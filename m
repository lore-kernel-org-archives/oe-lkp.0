Content-Type: multipart/mixed; boundary="===============3034803693508239002=="
MIME-Version: 1.0
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/unwinder] 5209e8ac93: dmesg.WARNING:stack_recursion
Date: Tue, 01 May 2018 09:23:10 -0500
Message-ID: <20180501142310.uikr2cjkft2os6mk@treble>
In-Reply-To: <20180428065353.GE6376@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============3034803693508239002==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 28, 2018 at 02:53:53PM +0800, kernel test robot wrote:
> =

> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 5209e8ac937261925c12db63a28cfaa033fa30ed ("x86/unwinder: Handle s=
tack overflows more gracefully")
> https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable-rc.git l=
inux-4.14.y
> =

> in testcase: vm-scalability
> with following parameters:
> =

> 	runtime: 300s
> 	size: 512G
> 	test: anon-w-rand-mt
> 	cpufreq_governor: performance
> =

> test-description: The motivation behind this suite is to exercise functio=
ns and regions of the mm/ of the Linux kernel which are of interest to us.
> test-url: https://git.kernel.org/cgit/linux/kernel/git/wfg/vm-scalability=
.git/
> =

> =

> on test machine: 144 threads Intel(R) Xeon(R) CPU E7-8890 v3 @ 2.50GHz wi=
th 512G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> kern  :warn  : [  188.061048] WARNING: can't dereference registers at 000=
000003fb3add8 for ip ret_from_intr+0x6/0x19
> kern  :warn  : [  190.564038] WARNING: stack recursion on stack type 1
> =

> =

> Thanks,
> Xiaolong

Hi Xiaolong,

Is it very reproducible?  Does the following patch fix the warnings?


diff --git a/arch/x86/kernel/dumpstack_64.c b/arch/x86/kernel/dumpstack_64.c
index 563e28d14f2c..5eb796865b5b 100644
--- a/arch/x86/kernel/dumpstack_64.c
+++ b/arch/x86/kernel/dumpstack_64.c
@@ -137,7 +137,9 @@ int get_stack_info(unsigned long *stack, struct task_st=
ruct *task,
 	 */
 	if (visit_mask) {
 		if (*visit_mask & (1UL << info->type)) {
-			printk_deferred_once(KERN_WARNING "WARNING: stack recursion on stack ty=
pe %d\n", info->type);
+			if (task =3D=3D current)
+				printk_deferred_once(KERN_WARNING "WARNING: stack recursion on stack t=
ype %d\n",
+						     info->type);
 			goto unknown;
 		}
 		*visit_mask |=3D 1UL << info->type;
diff --git a/arch/x86/kernel/unwind_orc.c b/arch/x86/kernel/unwind_orc.c
index feb28fee6cea..570435c52ca0 100644
--- a/arch/x86/kernel/unwind_orc.c
+++ b/arch/x86/kernel/unwind_orc.c
@@ -7,7 +7,14 @@
 #include <asm/orc_lookup.h>
 =

 #define orc_warn(fmt, ...) \
-	printk_deferred_once(KERN_WARNING pr_fmt("WARNING: " fmt), ##__VA_ARGS__)
+	printk_deferred_once(KERN_WARNING "WARNING: " fmt, ##__VA_ARGS__)
+
+#define orc_warn_current(fmt, ...)					\
+({									\
+	if (state->task =3D=3D current)					\
+		printk_deferred_once(KERN_WARNING "WARNING: " fmt,	\
+				     ##__VA_ARGS__);			\
+})
 =

 extern int __start_orc_unwind_ip[];
 extern int __stop_orc_unwind_ip[];
@@ -400,8 +407,8 @@ bool unwind_next_frame(struct unwind_state *state)
 =

 	case ORC_REG_R10:
 		if (!state->regs || !state->full_regs) {
-			orc_warn("missing regs for base reg R10 at ip %pB\n",
-				 (void *)state->ip);
+			orc_warn_current("missing regs for base reg R10 at ip %pB\n",
+					 (void *)state->ip);
 			goto done;
 		}
 		sp =3D state->regs->r10;
@@ -409,8 +416,8 @@ bool unwind_next_frame(struct unwind_state *state)
 =

 	case ORC_REG_R13:
 		if (!state->regs || !state->full_regs) {
-			orc_warn("missing regs for base reg R13 at ip %pB\n",
-				 (void *)state->ip);
+			orc_warn_current("missing regs for base reg R13 at ip %pB\n",
+					 (void *)state->ip);
 			goto done;
 		}
 		sp =3D state->regs->r13;
@@ -418,8 +425,8 @@ bool unwind_next_frame(struct unwind_state *state)
 =

 	case ORC_REG_DI:
 		if (!state->regs || !state->full_regs) {
-			orc_warn("missing regs for base reg DI at ip %pB\n",
-				 (void *)state->ip);
+			orc_warn_current("missing regs for base reg DI at ip %pB\n",
+					 (void *)state->ip);
 			goto done;
 		}
 		sp =3D state->regs->di;
@@ -427,8 +434,8 @@ bool unwind_next_frame(struct unwind_state *state)
 =

 	case ORC_REG_DX:
 		if (!state->regs || !state->full_regs) {
-			orc_warn("missing regs for base reg DX at ip %pB\n",
-				 (void *)state->ip);
+			orc_warn_current("missing regs for base reg DX at ip %pB\n",
+					 (void *)state->ip);
 			goto done;
 		}
 		sp =3D state->regs->dx;
@@ -463,8 +470,8 @@ bool unwind_next_frame(struct unwind_state *state)
 =

 	case ORC_TYPE_REGS:
 		if (!deref_stack_regs(state, sp, &state->ip, &state->sp)) {
-			orc_warn("can't dereference registers at %p for ip %pB\n",
-				 (void *)sp, (void *)orig_ip);
+			orc_warn_current("can't dereference registers at %p for ip %pB\n",
+					 (void *)sp, (void *)orig_ip);
 			goto done;
 		}
 =

@@ -475,8 +482,8 @@ bool unwind_next_frame(struct unwind_state *state)
 =

 	case ORC_TYPE_REGS_IRET:
 		if (!deref_stack_iret_regs(state, sp, &state->ip, &state->sp)) {
-			orc_warn("can't dereference iret registers at %p for ip %pB\n",
-				 (void *)sp, (void *)orig_ip);
+			orc_warn_current("can't dereference iret registers at %p for ip %pB\n",
+					 (void *)sp, (void *)orig_ip);
 			goto done;
 		}
 =

@@ -518,8 +525,8 @@ bool unwind_next_frame(struct unwind_state *state)
 	if (state->stack_info.type =3D=3D prev_type &&
 	    on_stack(&state->stack_info, (void *)state->sp, sizeof(long)) &&
 	    state->sp <=3D prev_sp) {
-		orc_warn("stack going in the wrong direction? ip=3D%pB\n",
-			 (void *)orig_ip);
+		orc_warn_current("stack going in the wrong direction? ip=3D%pB\n",
+				 (void *)orig_ip);
 		goto done;
 	}
=20

--===============3034803693508239002==--

