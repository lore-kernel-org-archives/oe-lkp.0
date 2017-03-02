Content-Type: multipart/mixed; boundary="===============0379037137941378549=="
MIME-Version: 1.0
From: Borislav Petkov <bp@alien8.de>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86] ed3ce2a917: BUG:unable_to_handle_kernel
Date: Thu, 02 Mar 2017 19:19:57 +0100
Message-ID: <20170302181957.533r5g2feoc53jtq@pd.tnic>
In-Reply-To: <20170302010934.GI9855@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============0379037137941378549==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Mar 02, 2017 at 09:09:34AM +0800, kernel test robot wrote:
> =

> FYI, we noticed the following commit:
> =

> commit: ed3ce2a9172457ef7dbaa9f964e63dfde2bdcb5f ("x86: Optimize clear_pa=
ge()")
> url: https://github.com/0day-ci/linux/commits/Borislav-Petkov/x86-Optimiz=
e-clear_page/20170215-193441
> =

> =

> in testcase: will-it-scale
> with following parameters:
> =

> 	test: poll2
> 	cpufreq_governor: performance
> =

> test-description: Will It Scale takes a testcase and runs it from 1 throu=
gh to n parallel copies to see if the testcase will scale. It builds both a=
 process and threads based test in order to see any differences between the=
 two.
> test-url: https://github.com/antonblanchard/will-it-scale

thanks for the report, I was able to reproduce.

BUT(!) this report is misleading because it talks about will-it-scale
but your splat happens when you kexec the kernel:

  [  336.340747] LKP: kexec loading...
  [  336.340852] =

  [  336.343323] kexec --noefi -l /tmp/cache/pkg/linux/x86_64-rhel-7.2/gcc-=
6/ed3ce2a9172457ef7dbaa9f964e63dfde2bdcb5f/vmlinuz-4.9.0-rc6-00134-ged3ce2a=
 --initrd=3D/tmp/cache/initrd-concatenated
  [  336.343758] =

  [  337.893471] --append=3Dip=3D::::lkp-ivb-d01::dhcp root=3D/dev/ram0 use=
r=3Dlkp job=3D/lkp/scheduled/lkp-ivb-d01/will-it-scale-poll2-performance-de=
bian-x86_64-2016-08-31.cgz-ed3ce2a9172457ef7dbaa9f964e63dfde2bdcb5f-2017030=
1-28072-1dqjyhl-11.yaml ARCH=3Dx86_64 kconfig=3Dx86_64-rhel-7.2 branch=3Dli=
nux-devel/devel-hourly-2017022612 commit=3Ded3ce2a9172457ef7dbaa9f964e63dfd=
e2bdcb5f BOOT_IMAGE=3D/pkg/linux/x86_64-rhel-7.2/gcc-6/ed3ce2a9172457ef7dba=
a9f964e63dfde2bdcb5f/vmlinuz-4.9.0-rc6-00134-ged3ce2a max_uptime=3D1500 RES=
ULT_ROOT=3D/result/will-it-scale/poll2-performance/lkp-ivb-d01/debian-x86_6=
4-2016-08-31.cgz/x86_64-rhel-7.2/gcc-6/ed3ce2a9172457ef7dbaa9f964e63dfde2bd=
cb5f/11 LKP_SERVER=3Dinn debug apic=3Ddebug sysrq_always_enabled rcupdate.r=
cu_cpu_stall_timeout=3D100 net.ifnames=3D0 printk.devkmsg=3Don panic=3D-1 s=
oftlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic load_ramdisk=3D2 prom=
pt_ramdisk=3D0 drbd.minor_count=3D8 systemd.log_level=3Derr ignore_
  [  337.895521] =

  [  339.467661] BUG: unable to handle kernel paging request at ffff8803cf2=
e2008
  [  339.468000] IP: [<ffffffff81061e71>] native_set_pmd+0x1/0x10
  ...


Maybe Fengguang has an idea what to do here, maybe something like add
markers to the log to denote where the test environment is prepared and
when the actual test starts. Then grep for those and generate the report
based on that...

Anyway, the diff is below, please try that ontop of tip's x86/asm branch
which already has the clear_page patch:

http://git.kernel.org/cgit/linux/kernel/git/tip/tip.git/log/?h=3Dx86/asm

Thanks!

---
 arch/x86/include/asm/alternative.h | 17 -----------------
 arch/x86/include/asm/page_64.h     | 11 ++++++-----
 2 files changed, 6 insertions(+), 22 deletions(-)

diff --git a/arch/x86/include/asm/alternative.h b/arch/x86/include/asm/alte=
rnative.h
index 12e3d8d607a9..1b020381ab38 100644
--- a/arch/x86/include/asm/alternative.h
+++ b/arch/x86/include/asm/alternative.h
@@ -227,23 +227,6 @@ static inline int alternatives_text_reserved(void *sta=
rt, void *end)
 }
 =

 /*
- * Like alternative_call(), but there are two features and respective func=
tions.
- * If CPU has feature2, function2 is used.
- * Otherwise, if CPU has feature1, function1 is used.
- * Otherwise, old function is used.
- */
-#define alternative_void_call_2(oldfunc, newfunc1, feature1, newfunc2,		\
-				feature2, input...)				\
-{										\
-	register void *__sp asm(_ASM_SP);					\
-	asm volatile (ALTERNATIVE_2("call %P[old]", "call %P[new1]", feature1,	\
-		"call %P[new2]", feature2)					\
-		: "+r" (__sp)							\
-		: [old] "i" (oldfunc), [new1] "i" (newfunc1),			\
-		  [new2] "i" (newfunc2), ## input);				\
-}
-
-/*
  * use this macro(s) if you need more than one output parameter
  * in alternative_io
  */
diff --git a/arch/x86/include/asm/page_64.h b/arch/x86/include/asm/page_64.h
index 254abce980a4..b4a0d43248cf 100644
--- a/arch/x86/include/asm/page_64.h
+++ b/arch/x86/include/asm/page_64.h
@@ -41,11 +41,12 @@ void clear_page_erms(void *page);
 =

 static inline void clear_page(void *page)
 {
-	alternative_void_call_2(clear_page_orig,
-				clear_page_rep, X86_FEATURE_REP_GOOD,
-				clear_page_erms, X86_FEATURE_ERMS,
-				"D" (page)
-				: "memory", "rax", "rcx");
+	alternative_call_2(clear_page_orig,
+			   clear_page_rep, X86_FEATURE_REP_GOOD,
+			   clear_page_erms, X86_FEATURE_ERMS,
+			   "=3DD" (page),
+			   "0" (page)
+			   : "memory", "rax", "rcx");
 }
 =

 void copy_page(void *to, void *from);
-- =

2.11.0


-- =

Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.

--===============0379037137941378549==--

