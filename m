Content-Type: multipart/mixed; boundary="===============4790694853198716697=="
MIME-Version: 1.0
From: Borislav Petkov <bp@alien8.de>
To: lkp@lists.01.org
Subject: [PATCH] x86/mm: Prevent early boot triple-faults with instrumentation
Date: Mon, 20 Dec 2021 12:00:06 +0100
Message-ID: <YcBiNqhYrxBPZphJ@zn.tnic>
In-Reply-To: <Yb2/QCOExDEsj47w@zn.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============4790694853198716697==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Borislav Petkov <bp@suse.de>

Commit in Fixes added a global TLB flush on the early boot path, after
the kernel switches off of the trampoline page table.

Compiler profiling options add additional measurement code
which needs to be initialized prior to use. The global flush in
x86_64_start_kernel() happens before those initializations can happen,
leading to accessing invalid memory.

The second issue this fixes is with KASAN: for a similar reason,
kasan_early_init() needs to have happened before KASAN-instrumented
functions are called.

Therefore, reorder the flush to happen after the KASAN early init
and prevent the compilers from adding profiling instrumentation to
native_write_cr4().

Fixes: f154f290855b ("x86/mm/64: Flush global TLB on boot and AP bringup")
Reported-by: "J. Bruce Fields" <bfields@fieldses.org>
Reported-by: kernel test robot <oliver.sang@intel.com>
Signed-off-by: Borislav Petkov <bp@suse.de>
Link: https://lore.kernel.org/r/20211209144141.GC25654(a)xsang-OptiPlex-9020
---
 arch/x86/kernel/cpu/common.c |  2 +-
 arch/x86/kernel/head64.c     | 16 ++++++++++++++--
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 0083464de5e3..79b3d67addcc 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -384,7 +384,7 @@ void native_write_cr0(unsigned long val)
 }
 EXPORT_SYMBOL(native_write_cr0);
 =

-void native_write_cr4(unsigned long val)
+void __no_profile native_write_cr4(unsigned long val)
 {
 	unsigned long bits_changed =3D 0;
 =

diff --git a/arch/x86/kernel/head64.c b/arch/x86/kernel/head64.c
index 75acb6027a87..f5e80a8377ad 100644
--- a/arch/x86/kernel/head64.c
+++ b/arch/x86/kernel/head64.c
@@ -483,10 +483,12 @@ asmlinkage __visible void __init x86_64_start_kernel(=
char * real_mode_data)
 	/* Kill off the identity-map trampoline */
 	reset_early_page_tables();
 =

-	__native_tlb_flush_global(native_read_cr4());
-
 	clear_bss();
 =

+	/*
+	 * This needs to happen *before* kasan_early_init() because latter maps s=
tuff
+	 * into that page.
+	 */
 	clear_page(init_top_pgt);
 =

 	/*
@@ -498,6 +500,16 @@ asmlinkage __visible void __init x86_64_start_kernel(c=
har * real_mode_data)
 =

 	kasan_early_init();
 =

+	/*
+	 * Flush global TLB entries which could be left over from the trampoline =
page
+	 * table.
+	 *
+	 * This needs to happen *after* kasan_early_init() as KASAN-enabled .conf=
igs
+	 * instrument native_write_cr4() so KASAN must be initialized for that
+	 * instrumentation to work.
+	 */
+	__native_tlb_flush_global(this_cpu_read(cpu_tlbstate.cr4));
+
 	idt_setup_early_handler();
 =

 	copy_bootdata(__va(real_mode_data));
-- =

2.29.2

-- =

Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
--===============4790694853198716697==--

