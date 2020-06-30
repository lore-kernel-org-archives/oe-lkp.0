Content-Type: multipart/mixed; boundary="===============8347413237823013434=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [sched] c3a340f7e7: invalid_opcode:#[##]
Date: Tue, 30 Jun 2020 16:49:05 +0200
Message-ID: <20200630144905.GX4817@hirez.programming.kicks-ass.net>
In-Reply-To: <20200630124628.GV4817@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============8347413237823013434==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2020 at 02:46:28PM +0200, Peter Zijlstra wrote:
> On Mon, Jun 29, 2020 at 08:31:27AM +0800, kernel test robot wrote:
> > Greeting,
> > =

> > FYI, we noticed the following commit (built with gcc-4.9):
> > =

> > commit: c3a340f7e7eadac7662ab104ceb16432e5a4c6b2 ("sched: Have sched_cl=
ass_highest define by vmlinux.lds.h")
> =

> > [    1.840970] kernel BUG at kernel/sched/core.c:6652!
> =

> W T H
> =

> $ readelf -Wa defconfig-build/vmlinux | grep sched_class
> 62931: c1e62d20     0 NOTYPE  GLOBAL DEFAULT    2 __begin_sched_classes
> 65736: c1e62f40    96 OBJECT  GLOBAL DEFAULT    2 stop_sched_class
> 71813: c1e62dc0    96 OBJECT  GLOBAL DEFAULT    2 fair_sched_class
> 78689: c1e62d40    96 OBJECT  GLOBAL DEFAULT    2 idle_sched_class
> 78953: c1e62fa0     0 NOTYPE  GLOBAL DEFAULT    2 __end_sched_classes
> 79090: c1e62e40    96 OBJECT  GLOBAL DEFAULT    2 rt_sched_class
> 79431: c1e62ec0    96 OBJECT  GLOBAL DEFAULT    2 dl_sched_class
> =

> $ printf "%d\n" $((0xc1e62dc0 - 0xc1e62d40))
> 128
> =

> So even though the object is 96 bytes in size, has an explicit 32 byte
> alignment, the array ends up with a stride of 128 bytes !?!?!
> =

> Consistently so with GCC-4.9. Any other GCC I tried does the sane thing.
> =

> Full patch included below.
> =

> Anybody any clue wth 4.9 is doing crazy things like this?
> =

> ---

This seems to make everything work, it builds and boots for 4.9 and
builds x86_64-defconfig with clang11 (just to check a !GCC compiler).

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinu=
x.lds.h
index 66fb84c3dc7ee..49a9aaa1e2424 100644
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
+#if __GNUC__ =3D=3D 4 && __GNUC_MINOR__ =3D=3D 9
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
  * often happens at runtime)
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
--===============8347413237823013434==--

