Content-Type: multipart/mixed; boundary="===============4352835246066503883=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [sched] c3a340f7e7: invalid_opcode:#[##]
Date: Tue, 30 Jun 2020 16:02:31 +0200
Message-ID: <20200630140231.GW4817@hirez.programming.kicks-ass.net>
In-Reply-To: <5b7286c9-ef4f-c1d0-fae3-ebb198aa0742@rasmusvillemoes.dk>
List-Id: <oe-lkp.lists.linux.dev>

--===============4352835246066503883==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2020 at 03:55:05PM +0200, Rasmus Villemoes wrote:

> > Consistently so with GCC-4.9. Any other GCC I tried does the sane thing.
> =

> Does that include gcc 4.8, or is it only "anything newer than 4.9"?

It includes 4.8 :-)

> so the section it was put in has an alignment of 64. The generated
> assembly is indeed
> =

>         .globl  fair_sched_class
>         .section        __fair_sched_class,"a",@progbits
>         .align 64
> =

> /me goes brew coffee

Right.. so I now have the below patch, and with that I get:

62931: c1e62c20     0 NOTYPE  GLOBAL DEFAULT    2 __begin_sched_classes
65736: c1e62e40   128 OBJECT  GLOBAL DEFAULT    2 stop_sched_class
71813: c1e62cc0   128 OBJECT  GLOBAL DEFAULT    2 fair_sched_class
78689: c1e62c40   128 OBJECT  GLOBAL DEFAULT    2 idle_sched_class
78953: c1e62ec0     0 NOTYPE  GLOBAL DEFAULT    2 __end_sched_classes
79090: c1e62d40   128 OBJECT  GLOBAL DEFAULT    2 rt_sched_class
79431: c1e62dc0   128 OBJECT  GLOBAL DEFAULT    2 dl_sched_class


Which has me stumped on __begin_sched_classes being on a 32byte edge
(and crashes differently due to that).

Argh!!



diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinu=
x.lds.h
index 66fb84c3dc7ee..b4704fb12b2dd 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -108,6 +108,17 @@
 #define SBSS_MAIN .sbss
 #endif
 =

+/*
+ * Align to a 32 byte boundary equal to the
+ * alignment gcc 4.5 uses for a struct
+ */
+#if GCC_VERSION >=3D 40900 && GCC_VERSION < 50000
+#define STRUCT_ALIGNMENT 64
+#else
+#define STRUCT_ALIGNMENT 32
+#endif
+#define STRUCT_ALIGN() . =3D ALIGN(STRUCT_ALIGNMENT)
+
 /*
  * The order of the sched class addresses are important, as they are
  * used to determine the order of the priority of each sched class in
@@ -123,13 +134,6 @@
 	*(__stop_sched_class)			\
 	__end_sched_classes =3D .;
 =

-/*
- * Align to a 32 byte boundary equal to the
- * alignment gcc 4.5 uses for a struct
- */
-#define STRUCT_ALIGNMENT 32
-#define STRUCT_ALIGN() . =3D ALIGN(STRUCT_ALIGNMENT)
-
 /* The actual configuration determine if the init/exit sections
  * are handled as text/data or they can be discarded (which
  * often happens@runtime)
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 4165c06d1d7bd..33251d0ab62e7 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -67,6 +67,7 @@
 #include <linux/tsacct_kern.h>
 =

 #include <asm/tlb.h>
+#include <asm-generic/vmlinux.lds.h>
 =

 #ifdef CONFIG_PARAVIRT
 # include <asm/paravirt.h>
@@ -1811,7 +1812,7 @@ struct sched_class {
 #ifdef CONFIG_FAIR_GROUP_SCHED
 	void (*task_change_group)(struct task_struct *p, int type);
 #endif
-} __aligned(32); /* STRUCT_ALIGN(), vmlinux.lds.h */
+} __aligned(STRUCT_ALIGNMENT); /* STRUCT_ALIGN(), vmlinux.lds.h */
 =

 static inline void put_prev_task(struct rq *rq, struct task_struct *prev)
 {
--===============4352835246066503883==--

