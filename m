Content-Type: multipart/mixed; boundary="===============1501940018660034399=="
MIME-Version: 1.0
From: Borislav Petkov <bp@suse.de>
To: lkp@lists.01.org
Subject: Re: [x86] 0ad07c8104: BUG: unable to handle kernel paging request at 000000001ea0d000
Date: Sat, 11 Feb 2017 15:28:25 +0100
Message-ID: <20170211142825.pfxee27luaclcgd5@pd.tnic>
In-Reply-To: <589e48a9.WGrbtirHySgQ8KqF%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1501940018660034399==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 11, 2017 at 07:11:37AM +0800, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://github.com/0day-ci/linux Borislav-Petkov/x86-Optimize-clear_page/=
20170210-053052

Thanks for the report and bisection, below should be a better version.
Looks like I forgot the asm clobbers. It doesn't trigger here anymore,
please double-check:

---
>From bafdb9a1598c1fa1defe67d89824a11a6a3dff4d Mon Sep 17 00:00:00 2001
From: Borislav Petkov <bp@suse.de>
Date: Thu, 9 Feb 2017 01:34:49 +0100
Subject: [PATCH] x86: Optimize clear_page()

Currently, we CALL clear_page() which then JMPs to the proper function
chosen by the alternatives.

What we should do instead is CALL the proper function directly. (This
was something Ingo suggested a while ago). So let's do that.

Measuring our favourite kernel build workload shows that there are no
significant changes in performance.

AMD
=3D=3D=3D
  --- /tmp/before 2017-02-09 18:01:46.451961188 +0100
  +++ /tmp/after  2017-02-09 18:01:54.883961175 +0100
  @@ -1,15 +1,15 @@
    Performance counter stats for 'system wide' (5 runs):

  -    1028960.373643      cpu-clock (msec)          #    6.000 CPUs utiliz=
ed            ( +-  1.41% )
  +    1023086.018961      cpu-clock (msec)          #    6.000 CPUs utiliz=
ed            ( +-  1.20% )
  -           518,744      context-switches          #    0.504 K/sec      =
              ( +-  1.04% )
  +           518,254      context-switches          #    0.507 K/sec      =
              ( +-  1.01% )
  -            38,112      cpu-migrations            #    0.037 K/sec      =
              ( +-  1.95% )
  +            37,917      cpu-migrations            #    0.037 K/sec      =
              ( +-  1.02% )
  -        20,874,266      page-faults               #    0.020 M/sec      =
              ( +-  0.07% )
  +        20,918,897      page-faults               #    0.020 M/sec      =
              ( +-  0.18% )
  - 2,043,646,230,667      cycles                    #    1.986 GHz        =
              ( +-  0.14% )  (66.67%)
  + 2,045,305,584,032      cycles                    #    1.999 GHz        =
              ( +-  0.16% )  (66.67%)
  -   553,698,855,431      stalled-cycles-frontend   #   27.09% frontend cy=
cles idle     ( +-  0.07% )  (66.67%)
  +   555,099,401,413      stalled-cycles-frontend   #   27.14% frontend cy=
cles idle     ( +-  0.13% )  (66.67%)
  -   621,544,286,390      stalled-cycles-backend    #   30.41% backend cyc=
les idle      ( +-  0.39% )  (66.67%)
  +   621,371,430,254      stalled-cycles-backend    #   30.38% backend cyc=
les idle      ( +-  0.32% )  (66.67%)
  - 1,738,364,431,659      instructions              #    0.85  insn per cy=
cle
  + 1,739,895,771,901      instructions              #    0.85  insn per cy=
cle
  -                                                  #    0.36  stalled cyc=
les per insn  ( +-  0.11% )  (66.67%)
  +                                                  #    0.36  stalled cyc=
les per insn  ( +-  0.13% )  (66.67%)
  -   391,170,943,850      branches                  #  380.161 M/sec      =
              ( +-  0.13% )  (66.67%)
  +   391,398,551,757      branches                  #  382.567 M/sec      =
              ( +-  0.13% )  (66.67%)
  -    22,567,810,411      branch-misses             #    5.77% of all bran=
ches          ( +-  0.11% )  (66.67%)
  +    22,574,726,683      branch-misses             #    5.77% of all bran=
ches          ( +-  0.13% )  (66.67%)

  -     171.480741921 seconds time elapsed                                 =
         ( +-  1.41% )
  +     170.509229451 seconds time elapsed                                 =
         ( +-  1.20% )

Intel
=3D=3D=3D=3D=3D

  --- /tmp/before 2017-02-09 20:36:19.851947473 +0100
  +++ /tmp/after  2017-02-09 20:36:30.151947458 +0100
  @@ -1,15 +1,15 @@
    Performance counter stats for 'system wide' (5 runs):

  -    2207248.598126      cpu-clock (msec)          #    8.000 CPUs utiliz=
ed            ( +-  0.69% )
  +    2213300.106631      cpu-clock (msec)          #    8.000 CPUs utiliz=
ed            ( +-  0.73% )
  -           899,342      context-switches          #    0.407 K/sec      =
              ( +-  0.68% )
  +           898,381      context-switches          #    0.406 K/sec      =
              ( +-  0.79% )
  -            80,553      cpu-migrations            #    0.036 K/sec      =
              ( +-  1.13% )
  +            80,979      cpu-migrations            #    0.037 K/sec      =
              ( +-  1.11% )
  -        36,171,148      page-faults               #    0.016 M/sec      =
              ( +-  0.02% )
  +        36,179,791      page-faults               #    0.016 M/sec      =
              ( +-  0.02% )
  - 6,665,288,826,484      cycles                    #    3.020 GHz        =
              ( +-  0.07% )  (83.33%)
  + 6,671,638,410,799      cycles                    #    3.014 GHz        =
              ( +-  0.06% )  (83.33%)
  - 5,065,975,115,197      stalled-cycles-frontend   #   76.01% frontend cy=
cles idle     ( +-  0.11% )  (83.33%)
  + 5,076,835,183,223      stalled-cycles-frontend   #   76.10% frontend cy=
cles idle     ( +-  0.11% )  (83.33%)
  - 3,841,556,350,614      stalled-cycles-backend    #   57.64% backend cyc=
les idle      ( +-  0.13% )  (66.67%)
  + 3,852,823,974,333      stalled-cycles-backend    #   57.75% backend cyc=
les idle      ( +-  0.12% )  (66.67%)
  - 4,148,398,171,079      instructions              #    0.62  insn per cy=
cle
  + 4,148,997,156,059      instructions              #    0.62  insn per cy=
cle
  -                                                  #    1.22  stalled cyc=
les per insn  ( +-  0.10% )  (83.33%)
  +                                                  #    1.22  stalled cyc=
les per insn  ( +-  0.11% )  (83.33%)
  -   887,187,118,591      branches                  #  401.943 M/sec      =
              ( +-  0.09% )  (83.33%)
  +   887,271,341,121      branches                  #  400.882 M/sec      =
              ( +-  0.11% )  (83.33%)
  -    30,139,439,034      branch-misses             #    3.40% of all bran=
ches          ( +-  0.09% )  (83.33%)
  +    30,134,864,997      branch-misses             #    3.40% of all bran=
ches          ( +-  0.06% )  (83.33%)

  -     275.904405540 seconds time elapsed                                 =
         ( +-  0.69% )
  +     276.660352016 seconds time elapsed                                 =
         ( +-  0.73% )

allmodconfig vmlinux size grows by a ~1Kb but that's fine - we optimize
our calling of the clear_page variants.

     text    data     bss     dec     hex filename
  9051979 23067670        27009024        59128673        3863b61		vmlinux
  9053000 23067670        27009024        59129694        3863f5e		vmlinux.=
clear_page

Signed-off-by: Borislav Petkov <bp@suse.de>
[ Forgot to add clobbers. ]
Reported-by: kernel test robot <fengguang.wu@intel.com>
---
 arch/x86/include/asm/alternative.h | 17 +++++++++++++++++
 arch/x86/include/asm/page_64.h     | 15 ++++++++++++++-
 arch/x86/lib/clear_page_64.S       | 17 +++++++----------
 3 files changed, 38 insertions(+), 11 deletions(-)

diff --git a/arch/x86/include/asm/alternative.h b/arch/x86/include/asm/alte=
rnative.h
index 1b020381ab38..6f79f0284223 100644
--- a/arch/x86/include/asm/alternative.h
+++ b/arch/x86/include/asm/alternative.h
@@ -227,6 +227,23 @@ static inline int alternatives_text_reserved(void *sta=
rt, void *end)
 }
 =

 /*
+ * Like alternative_call, but there are two features and respective functi=
ons.
+ * If CPU has feature2, function2 is used.
+ * Otherwise, if CPU has feature1, function1 is used.
+ * Otherwise, old function is used.
+ */
+#define alternative_void_call_2(oldfunc, newfunc1, feature1, newfunc2,		\
+				feature2, input...)				\
+{										\
+	register void *__sp asm(_ASM_SP);					\
+	asm volatile (ALTERNATIVE_2("call %P[old]", "call %P[new1]", feature1,	\
+		"call %P[new2]", feature2)					\
+		: "+r" (__sp)							\
+		: [old] "i" (oldfunc), [new1] "i" (newfunc1),			\
+		  [new2] "i" (newfunc2), ## input);				\
+}
+
+/*
  * use this macro(s) if you need more than one output parameter
  * in alternative_io
  */
diff --git a/arch/x86/include/asm/page_64.h b/arch/x86/include/asm/page_64.h
index b3bebf9e5746..254abce980a4 100644
--- a/arch/x86/include/asm/page_64.h
+++ b/arch/x86/include/asm/page_64.h
@@ -4,6 +4,7 @@
 #include <asm/page_64_types.h>
 =

 #ifndef __ASSEMBLY__
+#include <asm/alternative.h>
 =

 /* duplicated to the one in bootmem.h */
 extern unsigned long max_pfn;
@@ -34,7 +35,19 @@ extern unsigned long __phys_addr_symbol(unsigned long);
 #define pfn_valid(pfn)          ((pfn) < max_pfn)
 #endif
 =

-void clear_page(void *page);
+void clear_page_orig(void *page);
+void clear_page_rep(void *page);
+void clear_page_erms(void *page);
+
+static inline void clear_page(void *page)
+{
+	alternative_void_call_2(clear_page_orig,
+				clear_page_rep, X86_FEATURE_REP_GOOD,
+				clear_page_erms, X86_FEATURE_ERMS,
+				"D" (page)
+				: "memory", "rax", "rcx");
+}
+
 void copy_page(void *to, void *from);
 =

 #endif	/* !__ASSEMBLY__ */
diff --git a/arch/x86/lib/clear_page_64.S b/arch/x86/lib/clear_page_64.S
index 5e2af3a88cf5..81b1635d67de 100644
--- a/arch/x86/lib/clear_page_64.S
+++ b/arch/x86/lib/clear_page_64.S
@@ -14,20 +14,15 @@
  * Zero a page.
  * %rdi	- page
  */
-ENTRY(clear_page)
-
-	ALTERNATIVE_2 "jmp clear_page_orig", "", X86_FEATURE_REP_GOOD, \
-		      "jmp clear_page_c_e", X86_FEATURE_ERMS
-
+ENTRY(clear_page_rep)
 	movl $4096/8,%ecx
 	xorl %eax,%eax
 	rep stosq
 	ret
-ENDPROC(clear_page)
-EXPORT_SYMBOL(clear_page)
+ENDPROC(clear_page_rep)
+EXPORT_SYMBOL_GPL(clear_page_rep)
 =

 ENTRY(clear_page_orig)
-
 	xorl   %eax,%eax
 	movl   $4096/64,%ecx
 	.p2align 4
@@ -47,10 +42,12 @@ ENTRY(clear_page_orig)
 	nop
 	ret
 ENDPROC(clear_page_orig)
+EXPORT_SYMBOL_GPL(clear_page_orig)
 =

-ENTRY(clear_page_c_e)
+ENTRY(clear_page_erms)
 	movl $4096,%ecx
 	xorl %eax,%eax
 	rep stosb
 	ret
-ENDPROC(clear_page_c_e)
+ENDPROC(clear_page_erms)
+EXPORT_SYMBOL_GPL(clear_page_erms)
-- =

2.11.0

SUSE Linux GmbH, GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Norton, =
HRB 21284 (AG N=C3=BCrnberg)
--=20

--===============1501940018660034399==--

