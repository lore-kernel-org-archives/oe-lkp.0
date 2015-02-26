Content-Type: multipart/mixed; boundary="===============7150665913898232241=="
MIME-Version: 1.0
From: Borislav Petkov <bp@suse.de>
To: lkp@lists.01.org
Subject: Re: [x86/mm/ASLR] f47233c2d34: WARNING: CPU: 0 PID: 1 at arch/x86/mm/ioremap.c:63 __ioremap_check_ram+0x445/0x4a0()
Date: Thu, 26 Feb 2015 13:16:17 +0100
Message-ID: <20150226121617.GB3573@pd.tnic>
In-Reply-To: <20150226111250.GA32024@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7150665913898232241==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 26, 2015 at 12:12:50PM +0100, Ingo Molnar wrote:
> Why is it ioremap()-ed to begin with, why cannot the kernel =

> access its own data structure in RAM directly?

Probably because those setup_data structs refer to !RAM objects and
there we need to ioremap. But from looking at arch/x86/kernel/ksysfs.c,
this thing is ioremapping/iounmapping stuff on every access and I'm
thinking caching all that stuff for a subsequent access should be much
cleaner/simpler.

And from looking at

	5039e316dde3 ("x86: Export x86 boot_params to sysfs")

this got added for kexec just so that it gets some info from the running
kernel.

And frankly, I'm not even convinced exposing this in sysfs is the right
thing to do. Perhaps it is or perhaps kexec should get a second syscall
which returns the info it requires instead of exposing all that stuff in
sysfs, for everyone to see. That's a big hmmm.

In any case, shutting up the warning is not very easy because doing
a dirty patch to add ioremap_nowarn() doesn't really work (see
diff below): there are other places in the code which ioremap()
boot_params.hdr.setup_data and there it screams to (splat at the end of
the mail).

Which shows the real problem - if we're going to pass setup_data
structs to kernel proper and kernel ioremaps them, the check in
__ioremap_check_ram() is going to fire.

The proper fix should be to say, don't ioremap setup_data which is
kernel memory but I'm not sure I have a good idea at the moment how to
do that *without* ioremapping the thing to inspect it first...

More hmm...

---
diff --git a/arch/x86/include/asm/io.h b/arch/x86/include/asm/io.h
index 34a5b93704d3..2f14c1021172 100644
--- a/arch/x86/include/asm/io.h
+++ b/arch/x86/include/asm/io.h
@@ -180,6 +180,7 @@ extern void __iomem *ioremap_nocache(resource_size_t of=
fset, unsigned long size)
 extern void __iomem *ioremap_cache(resource_size_t offset, unsigned long s=
ize);
 extern void __iomem *ioremap_prot(resource_size_t offset, unsigned long si=
ze,
 				unsigned long prot_val);
+extern void __iomem *ioremap_nowarn(resource_size_t offset, unsigned long =
size);
 =

 /*
  * The default ioremap() behavior is non-cached:
diff --git a/arch/x86/kernel/ksysfs.c b/arch/x86/kernel/ksysfs.c
index c2bedaea11f7..75cb9880419c 100644
--- a/arch/x86/kernel/ksysfs.c
+++ b/arch/x86/kernel/ksysfs.c
@@ -79,7 +79,7 @@ static int get_setup_data_paddr(int nr, u64 *paddr)
 			*paddr =3D pa_data;
 			return 0;
 		}
-		data =3D ioremap_cache(pa_data, sizeof(*data));
+		data =3D ioremap_nowarn(pa_data, sizeof(*data));
 		if (!data)
 			return -ENOMEM;
 =

@@ -97,7 +97,7 @@ static int __init get_setup_data_size(int nr, size_t *siz=
e)
 	u64 pa_data =3D boot_params.hdr.setup_data;
 =

 	while (pa_data) {
-		data =3D ioremap_cache(pa_data, sizeof(*data));
+		data =3D ioremap_nowarn(pa_data, sizeof(*data));
 		if (!data)
 			return -ENOMEM;
 		if (nr =3D=3D i) {
@@ -127,7 +127,7 @@ static ssize_t type_show(struct kobject *kobj,
 	ret =3D get_setup_data_paddr(nr, &paddr);
 	if (ret)
 		return ret;
-	data =3D ioremap_cache(paddr, sizeof(*data));
+	data =3D ioremap_nowarn(paddr, sizeof(*data));
 	if (!data)
 		return -ENOMEM;
 =

@@ -154,7 +154,7 @@ static ssize_t setup_data_data_read(struct file *fp,
 	ret =3D get_setup_data_paddr(nr, &paddr);
 	if (ret)
 		return ret;
-	data =3D ioremap_cache(paddr, sizeof(*data));
+	data =3D ioremap_nowarn(paddr, sizeof(*data));
 	if (!data)
 		return -ENOMEM;
 =

@@ -170,7 +170,7 @@ static ssize_t setup_data_data_read(struct file *fp,
 		goto out;
 =

 	ret =3D count;
-	p =3D ioremap_cache(paddr + sizeof(*data), data->len);
+	p =3D ioremap_nowarn(paddr + sizeof(*data), data->len);
 	if (!p) {
 		ret =3D -ENOMEM;
 		goto out;
@@ -250,7 +250,7 @@ static int __init get_setup_data_total_num(u64 pa_data,=
 int *nr)
 	*nr =3D 0;
 	while (pa_data) {
 		*nr +=3D 1;
-		data =3D ioremap_cache(pa_data, sizeof(*data));
+		data =3D ioremap_nowarn(pa_data, sizeof(*data));
 		if (!data) {
 			ret =3D -ENOMEM;
 			goto out;
diff --git a/arch/x86/mm/ioremap.c b/arch/x86/mm/ioremap.c
index fdf617c00e2f..20a83332c254 100644
--- a/arch/x86/mm/ioremap.c
+++ b/arch/x86/mm/ioremap.c
@@ -60,6 +60,12 @@ static int __ioremap_check_ram(unsigned long start_pfn, =
unsigned long nr_pages,
 		    !PageReserved(pfn_to_page(start_pfn + i)))
 			return 1;
 =

+	pr_err("%s: start_pfn: 0x%lx, arg: %p, *arg: %d\n",
+		__func__, start_pfn, arg, *(bool *)arg);
+
+	if (arg && *(bool *)arg)
+		return 0;
+
 	WARN_ONCE(1, "ioremap on RAM pfn 0x%lx\n", start_pfn);
 =

 	return 0;
@@ -74,8 +80,9 @@ static int __ioremap_check_ram(unsigned long start_pfn, u=
nsigned long nr_pages,
  * have to convert them into an offset in a page-aligned mapping, but the
  * caller shouldn't need to know that small detail.
  */
-static void __iomem *__ioremap_caller(resource_size_t phys_addr,
-		unsigned long size, enum page_cache_mode pcm, void *caller)
+static void __iomem *
+__ioremap_caller(resource_size_t phys_addr, unsigned long size,
+		 enum page_cache_mode pcm, void *caller, bool warn)
 {
 	unsigned long offset, vaddr;
 	resource_size_t pfn, last_pfn, last_addr;
@@ -122,7 +129,7 @@ static void __iomem *__ioremap_caller(resource_size_t p=
hys_addr,
 	if (ram_region < 0) {
 		pfn      =3D phys_addr >> PAGE_SHIFT;
 		last_pfn =3D last_addr >> PAGE_SHIFT;
-		if (walk_system_ram_range(pfn, last_pfn - pfn + 1, NULL,
+		if (walk_system_ram_range(pfn, last_pfn - pfn + 1, &warn,
 					  __ioremap_check_ram) =3D=3D 1)
 			return NULL;
 	}
@@ -237,7 +244,7 @@ void __iomem *ioremap_nocache(resource_size_t phys_addr=
, unsigned long size)
 	enum page_cache_mode pcm =3D _PAGE_CACHE_MODE_UC_MINUS;
 =

 	return __ioremap_caller(phys_addr, size, pcm,
-				__builtin_return_address(0));
+				__builtin_return_address(0), false);
 }
 EXPORT_SYMBOL(ioremap_nocache);
 =

@@ -255,7 +262,7 @@ void __iomem *ioremap_wc(resource_size_t phys_addr, uns=
igned long size)
 {
 	if (pat_enabled)
 		return __ioremap_caller(phys_addr, size, _PAGE_CACHE_MODE_WC,
-					__builtin_return_address(0));
+					__builtin_return_address(0), false);
 	else
 		return ioremap_nocache(phys_addr, size);
 }
@@ -264,7 +271,7 @@ EXPORT_SYMBOL(ioremap_wc);
 void __iomem *ioremap_cache(resource_size_t phys_addr, unsigned long size)
 {
 	return __ioremap_caller(phys_addr, size, _PAGE_CACHE_MODE_WB,
-				__builtin_return_address(0));
+				__builtin_return_address(0), false);
 }
 EXPORT_SYMBOL(ioremap_cache);
 =

@@ -273,10 +280,19 @@ void __iomem *ioremap_prot(resource_size_t phys_addr,=
 unsigned long size,
 {
 	return __ioremap_caller(phys_addr, size,
 				pgprot2cachemode(__pgprot(prot_val)),
-				__builtin_return_address(0));
+				__builtin_return_address(0), false);
 }
 EXPORT_SYMBOL(ioremap_prot);
 =

+void __iomem *ioremap_nowarn(resource_size_t phys_addr, unsigned long size)
+{
+	enum page_cache_mode pcm =3D _PAGE_CACHE_MODE_UC_MINUS;
+
+	return __ioremap_caller(phys_addr, size, pcm,
+				__builtin_return_address(0), true);
+}
+EXPORT_SYMBOL(ioremap_nowarn);
+
 /**
  * iounmap - Free a IO remapping
  * @addr: virtual address from ioremap_*


---
[    0.664002] ------------[ cut here ]------------
[    0.668006] WARNING: CPU: 1 PID: 1 at arch/x86/mm/ioremap.c:69 __ioremap=
_check_ram+0xe8/0x100()
[    0.676002] ioremap on RAM pfn 0x2206
[    0.680002] Modules linked in:
[    0.684003] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 4.0.0-rc1+ #7
[    0.696006] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
1.7.5-20140531_083030-gandalf 04/01/2014
[    0.704002]  ffffffff818a36e3 ffff88007bcfb8f8 ffffffff816759b9 00000000=
00000000
[    0.713663]  ffff88007bcfb948 ffff88007bcfb938 ffffffff810536a5 00000000=
ffffffff
[    0.720002]  0000000000002206 0000000000000000 ffff88007bcfba64 ffff8800=
7bcfba64
[    0.737656] Call Trace:
[    0.740007]  [<ffffffff816759b9>] dump_stack+0x4f/0x7b
[    0.744005]  [<ffffffff810536a5>] warn_slowpath_common+0x95/0xe0
[    0.748004]  [<ffffffff81053736>] warn_slowpath_fmt+0x46/0x50
[    0.752005]  [<ffffffff81046948>] __ioremap_check_ram+0xe8/0x100
[    0.756004]  [<ffffffff81046860>] ? ioremap_nowarn+0x20/0x20
[    0.760004]  [<ffffffff8105a44b>] walk_system_ram_range+0xab/0xd0
[    0.776008]  [<ffffffff8167db65>] ? _raw_read_unlock+0x35/0x60
[    0.784010]  [<ffffffff81046716>] __ioremap_caller+0x2b6/0x350
[    0.788005]  [<ffffffff8109c61e>] ? put_lock_stats.isra.19+0xe/0x30
[    0.792005]  [<ffffffff8158d1f1>] ? pcibios_add_device+0x41/0xd0
[    0.796005]  [<ffffffff81335c57>] ? pci_device_add+0xe7/0x150
[    0.800005]  [<ffffffff810467ca>] ioremap_nocache+0x1a/0x20
[    0.816008]  [<ffffffff8158d1f1>] pcibios_add_device+0x41/0xd0
[    0.820005]  [<ffffffff81335c5f>] pci_device_add+0xef/0x150
[    0.824004]  [<ffffffff81335d59>] pci_scan_single_device+0x99/0xd0
[    0.832004]  [<ffffffff81335dd8>] pci_scan_slot+0x48/0x120
[    0.836004]  [<ffffffff81336f45>] pci_scan_child_bus+0x35/0xd0
[    0.840005]  [<ffffffff8158baf5>] pci_acpi_scan_root+0x275/0x4e0
[    0.844005]  [<ffffffff81370692>] acpi_pci_root_add+0x3d0/0x4ea
[    0.864023]  [<ffffffff813697db>] ? acpi_bus_get_status_handle+0x1f/0x3b
[    0.872005]  [<ffffffff81c4225f>] ? acpi_sleep_proc_init+0x2a/0x2a
[    0.876004]  [<ffffffff8136c6b4>] acpi_bus_attach+0xd4/0x1c4
[    0.880004]  [<ffffffff8167b67e>] ? mutex_unlock+0xe/0x10
[    0.884005]  [<ffffffff814184c6>] ? device_attach+0x56/0xc0
[    0.888004]  [<ffffffff8136c72e>] acpi_bus_attach+0x14e/0x1c4
[    0.904007]  [<ffffffff8167b67e>] ? mutex_unlock+0xe/0x10
[    0.908005]  [<ffffffff814184c6>] ? device_attach+0x56/0xc0
[    0.912005]  [<ffffffff8136c72e>] acpi_bus_attach+0x14e/0x1c4
[    0.916005]  [<ffffffff81c4225f>] ? acpi_sleep_proc_init+0x2a/0x2a
[    0.920004]  [<ffffffff8136c89f>] acpi_bus_scan+0x61/0x6c
[    0.924004]  [<ffffffff81c4267f>] acpi_scan_init+0x72/0x1a8
[    0.928004]  [<ffffffff81c424b0>] acpi_init+0x251/0x26e
[    0.944008]  [<ffffffff810002f0>] do_one_initcall+0xa0/0x1f0
[    0.948007]  [<ffffffff81076a00>] ? parse_args+0x140/0x420
[    0.952006]  [<ffffffff81c13fd3>] kernel_init_freeable+0x11a/0x1a2
[    0.956004]  [<ffffffff8167e47f>] ? ret_from_fork+0xf/0xb0
[    0.960004]  [<ffffffff81671440>] ? rest_init+0x140/0x140
[    0.964004]  [<ffffffff8167144e>] kernel_init+0xe/0xe0
[    0.968004]  [<ffffffff8167e4ec>] ret_from_fork+0x7c/0xb0
[    0.980011]  [<ffffffff81671440>] ? rest_init+0x140/0x140
[    0.988064] ---[ end trace 38b4eaf72c18a877 ]---

-- =

Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
--

--===============7150665913898232241==--

