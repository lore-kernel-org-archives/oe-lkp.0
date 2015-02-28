Content-Type: multipart/mixed; boundary="===============4157408337490068067=="
MIME-Version: 1.0
From: Borislav Petkov <bp@suse.de>
To: lkp@lists.01.org
Subject: Re: [x86/mm/ASLR] f47233c2d34: WARNING: CPU: 0 PID: 1 at arch/x86/mm/ioremap.c:63 __ioremap_check_ram+0x445/0x4a0()
Date: Sat, 28 Feb 2015 11:50:49 +0100
Message-ID: <20150228105049.GA11038@pd.tnic>
In-Reply-To: <20150226121617.GB3573@pd.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============4157408337490068067==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 26, 2015 at 01:16:17PM +0100, Borislav Petkov wrote:
> The proper fix should be to say, don't ioremap setup_data which is
> kernel memory but I'm not sure I have a good idea at the moment how to
> do that *without* ioremapping the thing to inspect it first...
> =

> More hmm...

Yeah, too many hmms means this still needed staring at to find out what
exactly the problem is. And the problem is that allocating that struct
setup_data statically in arch/x86/boot/compressed/aslr.c works only by
chance, when the kernel decompressing doesn't overwrite that memory.

One thing that we could do is to stick it right below LOAD_PHYSICAL_ADDR
(16M by default) which is the miminum physical address for the kernel to
be loaded at and kaslr pays attention to.

I.e., this struct setup_data thing lands then here:

[    0.000000] parse_setup_data: data: 0xffffe0 (va: ffffffffff200fe0) { ne=
xt: 0x0, type: 0x5, len: 17, data[0]: 0x0 }

which is 16M - 2*sizeof(struct setup_data). Yeah, I left some room
there.

Now, this approach works but I'm not sure whether this is how we want to
be passing setup_data stuff from arch/x86/boot/ to kernel proper so I'd
like to hear some more experienced opinions please...

Thanks!

---
diff --git a/arch/x86/boot/compressed/aslr.c b/arch/x86/boot/compressed/asl=
r.c
index 7083c16cccba..9f64c64e3ebe 100644
--- a/arch/x86/boot/compressed/aslr.c
+++ b/arch/x86/boot/compressed/aslr.c
@@ -14,12 +14,7 @@
 static const char build_str[] =3D UTS_RELEASE " (" LINUX_COMPILE_BY "@"
 		LINUX_COMPILE_HOST ") (" LINUX_COMPILER ") " UTS_VERSION;
 =

-struct kaslr_setup_data {
-	__u64 next;
-	__u32 type;
-	__u32 len;
-	__u8 data[1];
-} kaslr_setup_data;
+struct setup_data *ksd;
 =

 #define I8254_PORT_CONTROL	0x43
 #define I8254_PORT_COUNTER0	0x40
@@ -302,14 +297,20 @@ static unsigned long find_random_addr(unsigned long m=
inimum,
 	return slots_fetch_random();
 }
 =

-static void add_kaslr_setup_data(struct boot_params *params, __u8 enabled)
+static void add_kaslr_setup_data(struct boot_params *params,
+				 u8 *output, __u8 enabled)
 {
 	struct setup_data *data;
 =

-	kaslr_setup_data.type =3D SETUP_KASLR;
-	kaslr_setup_data.len =3D 1;
-	kaslr_setup_data.next =3D 0;
-	kaslr_setup_data.data[0] =3D enabled;
+	/*
+	 * Stick it right under LOAD_PHYSICAL_ADDR
+	 */
+	ksd =3D (struct setup_data *)(output - 2 * sizeof(struct setup_data));
+
+	ksd->type =3D SETUP_KASLR;
+	ksd->len =3D 1;
+	ksd->next =3D 0;
+	ksd->data[0] =3D enabled;
 =

 	data =3D (struct setup_data *)(unsigned long)params->hdr.setup_data;
 =

@@ -317,10 +318,9 @@ static void add_kaslr_setup_data(struct boot_params *p=
arams, __u8 enabled)
 		data =3D (struct setup_data *)(unsigned long)data->next;
 =

 	if (data)
-		data->next =3D (unsigned long)&kaslr_setup_data;
+		data->next =3D (unsigned long)ksd;
 	else
-		params->hdr.setup_data =3D (unsigned long)&kaslr_setup_data;
-
+		params->hdr.setup_data =3D (unsigned long)ksd;
 }
 =

 unsigned char *choose_kernel_location(struct boot_params *params,
@@ -335,17 +335,17 @@ unsigned char *choose_kernel_location(struct boot_par=
ams *params,
 #ifdef CONFIG_HIBERNATION
 	if (!cmdline_find_option_bool("kaslr")) {
 		debug_putstr("KASLR disabled by default...\n");
-		add_kaslr_setup_data(params, 0);
+		add_kaslr_setup_data(params, output, 0);
 		goto out;
 	}
 #else
 	if (cmdline_find_option_bool("nokaslr")) {
 		debug_putstr("KASLR disabled by cmdline...\n");
-		add_kaslr_setup_data(params, 0);
+		add_kaslr_setup_data(params, output, 0);
 		goto out;
 	}
 #endif
-	add_kaslr_setup_data(params, 1);
+	add_kaslr_setup_data(params, output, 1);
 =

 	/* Record the various known unsafe memory ranges. */
 	mem_avoid_init((unsigned long)input, input_size,
diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 98dc9317286e..d3b34df6e539 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -429,7 +429,11 @@ static void __init reserve_initrd(void)
 =

 static void __init parse_kaslr_setup(u64 pa_data, u32 data_len)
 {
-	kaslr_enabled =3D (bool)(pa_data + sizeof(struct setup_data));
+	struct setup_data *kdata;
+
+	kdata =3D early_memremap(pa_data, data_len);
+	kaslr_enabled =3D kdata->data[0];
+	early_iounmap(kdata, data_len);
 }
 =

 static void __init parse_setup_data(void)
---

-- =

Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
--

--===============4157408337490068067==--

