Content-Type: multipart/mixed; boundary="===============3774468125010791261=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [sched] c3a340f7e7: invalid_opcode:#[##]
Date: Tue, 30 Jun 2020 14:46:28 +0200
Message-ID: <20200630124628.GV4817@hirez.programming.kicks-ass.net>
In-Reply-To: <20200629003127.GB5535@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============3774468125010791261==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2020 at 08:31:27AM +0800, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-4.9):
> =

> commit: c3a340f7e7eadac7662ab104ceb16432e5a4c6b2 ("sched: Have sched_clas=
s_highest define by vmlinux.lds.h")

> [    1.840970] kernel BUG at kernel/sched/core.c:6652!

W T H

$ readelf -Wa defconfig-build/vmlinux | grep sched_class
62931: c1e62d20     0 NOTYPE  GLOBAL DEFAULT    2 __begin_sched_classes
65736: c1e62f40    96 OBJECT  GLOBAL DEFAULT    2 stop_sched_class
71813: c1e62dc0    96 OBJECT  GLOBAL DEFAULT    2 fair_sched_class
78689: c1e62d40    96 OBJECT  GLOBAL DEFAULT    2 idle_sched_class
78953: c1e62fa0     0 NOTYPE  GLOBAL DEFAULT    2 __end_sched_classes
79090: c1e62e40    96 OBJECT  GLOBAL DEFAULT    2 rt_sched_class
79431: c1e62ec0    96 OBJECT  GLOBAL DEFAULT    2 dl_sched_class

$ printf "%d\n" $((0xc1e62dc0 - 0xc1e62d40))
128

So even though the object is 96 bytes in size, has an explicit 32 byte
alignment, the array ends up with a stride of 128 bytes !?!?!

Consistently so with GCC-4.9. Any other GCC I tried does the sane thing.

Full patch included below.

Anybody any clue wth 4.9 is doing crazy things like this?

---
commit c3a340f7e7eadac7662ab104ceb16432e5a4c6b2
Author: Steven Rostedt (VMware) <rostedt@goodmis.org>
Date:   Thu Dec 19 16:44:53 2019 -0500

    sched: Have sched_class_highest define by vmlinux.lds.h
    =

    Now that the sched_class descriptors are defined by the linker script, =
and
    this needs to be aware of the existance of stop_sched_class when SMP is
    enabled or not, as it is used as the "highest" priority when defined. M=
ove
    the declaration of sched_class_highest to the same location in the link=
er
    script that inserts stop_sched_class, and this will also make it easier=
 to
    see what should be defined as the highest class, as this linker script
    location defines the priorities as well.
    =

    Signed-off-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
    Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
    Link: https://lkml.kernel.org/r/20191219214558.682913590(a)goodmis.org

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinu=
x.lds.h
index 2186d7b01af6..66fb84c3dc7e 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -114,11 +114,14 @@
  * relation to each other.
  */
 #define SCHED_DATA				\
+	STRUCT_ALIGN();				\
+	__begin_sched_classes =3D .;		\
 	*(__idle_sched_class)			\
 	*(__fair_sched_class)			\
 	*(__rt_sched_class)			\
 	*(__dl_sched_class)			\
-	*(__stop_sched_class)
+	*(__stop_sched_class)			\
+	__end_sched_classes =3D .;
 =

 /*
  * Align to a 32 byte boundary equal to the
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 0208b71bef80..81640fe0eae8 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6646,6 +6646,14 @@ void __init sched_init(void)
 	unsigned long ptr =3D 0;
 	int i;
 =

+	/* Make sure the linker didn't screw up */
+	BUG_ON(&idle_sched_class + 1 !=3D &fair_sched_class ||
+	       &fair_sched_class + 1 !=3D &rt_sched_class ||
+	       &rt_sched_class + 1   !=3D &dl_sched_class);
+#ifdef CONFIG_SMP
+	BUG_ON(&dl_sched_class + 1 !=3D &stop_sched_class);
+#endif
+
 	wait_bit_init();
 =

 #ifdef CONFIG_FAIR_GROUP_SCHED
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 336887607b3d..4165c06d1d7b 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1811,7 +1811,7 @@ struct sched_class {
 #ifdef CONFIG_FAIR_GROUP_SCHED
 	void (*task_change_group)(struct task_struct *p, int type);
 #endif
-};
+} __aligned(32); /* STRUCT_ALIGN(), vmlinux.lds.h */
 =

 static inline void put_prev_task(struct rq *rq, struct task_struct *prev)
 {
@@ -1825,17 +1825,18 @@ static inline void set_next_task(struct rq *rq, str=
uct task_struct *next)
 	next->sched_class->set_next_task(rq, next, false);
 }
 =

-#ifdef CONFIG_SMP
-#define sched_class_highest (&stop_sched_class)
-#else
-#define sched_class_highest (&dl_sched_class)
-#endif
+/* Defined in include/asm-generic/vmlinux.lds.h */
+extern struct sched_class __begin_sched_classes[];
+extern struct sched_class __end_sched_classes[];
+
+#define sched_class_highest (__end_sched_classes - 1)
+#define sched_class_lowest  (__begin_sched_classes - 1)
 =

 #define for_class_range(class, _from, _to) \
-	for (class =3D (_from); class !=3D (_to); class =3D class->next)
+	for (class =3D (_from); class !=3D (_to); class--)
 =

 #define for_each_class(class) \
-	for_class_range(class, sched_class_highest, NULL)
+	for_class_range(class, sched_class_highest, sched_class_lowest)
 =

 extern const struct sched_class stop_sched_class;
 extern const struct sched_class dl_sched_class;
--===============3774468125010791261==--

