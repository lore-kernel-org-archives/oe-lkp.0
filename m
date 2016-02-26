Content-Type: multipart/mixed; boundary="===============4943939774030033637=="
MIME-Version: 1.0
From: Borislav Petkov <bp@alien8.de>
To: lkp@lists.01.org
Subject: Re: [x86/fpu] 58122bf1d8: WARNING: CPU: 0 PID: 1 at arch/x86/include/asm/fpu/internal.h:529 fpu__restore+0x28f/0x9ab()
Date: Fri, 26 Feb 2016 08:49:40 +0100
Message-ID: <20160226074940.GA28911@pd.tnic>
In-Reply-To: <87d1rk9str.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4943939774030033637==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 26, 2016 at 09:13:52AM +0800, kernel test robot wrote:
> FYI, we noticed the below changes on
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> commit 58122bf1d856a4ea9581d62a07c557d997d46a19 ("x86/fpu: Default eagerf=
pu=3Don on all CPUs")

Oh cool, so your bisection results point at Ingo's initial suspicion which I
couldn't confirm with mine.

> [   17.097301] WARNING: CPU: 0 PID: 1 at arch/x86/include/asm/fpu/interna=
l.h:529 fpu__restore+0x28f/0x9ab()
> [   17.099191] CPU: 0 PID: 1 Comm: init Not tainted 4.5.0-rc3-00015-g5812=
2bf #1
> [   17.100373]  ffff88000ae17c38 ffffffff85405ca8 0000000000000002 000000=
0000000020
> [   17.101747]  0000000000000001 0000000000000000 ffff88000ae17c70 ffffff=
ff818f024e
> [   17.103110]  ffff88000ae17cb0 ffffffff81138526 0000000900000000 ffff88=
000ae113c0
> [   17.104543] Call Trace:
> [   17.104980]  [<ffffffff818f024e>] dump_stack+0x19/0x1b
> [   17.105854]  [<ffffffff81138526>] warn_slowpath_common+0x1a5/0x1c0
> [   17.106895]  [<ffffffff81138613>] warn_slowpath_null+0x1a/0x1c
> [   17.107904]  [<ffffffff810362bd>] fpu__restore+0x28f/0x9ab
> [   17.108834]  [<ffffffff8103ac01>] __fpu__restore_sig+0xc3e/0x1a3a
> [   17.109862]  [<ffffffff81003058>] ? ___preempt_schedule+0x12/0x14
> [   17.110916]  [<ffffffff8103c645>] fpu__restore_sig+0xf5/0x102
> [   17.111887]  [<ffffffff81123b73>] ia32_restore_sigcontext+0x586/0x5af
> [   17.112987]  [<ffffffff811244fb>] sys32_sigreturn+0x246/0x317
> [   17.113956]  [<ffffffff811242b5>] ? get_sigframe+0x719/0x719
> [   17.115108]  [<ffffffff810076ef>] do_syscall_32_irqs_off+0x2b2/0x789
> [   17.116179]  [<ffffffff82a43528>] entry_INT80_compat+0x38/0x50
> [   17.117161] ---[ end trace cb640c01126c054b ]---

...also cool, 32-bit process on a 64-bit kernel. I triggered it once on
a 32-bit kernel.

Does this one help?

---
From: Borislav Petkov <bp@suse.de>
Date: Mon, 15 Feb 2016 19:50:33 +0100
Subject: [PATCH] x86/FPU: Fix double FPU regs activation

sys_sigreturn() calls fpu__restore_sig() with interrupts enabled. When
restoring a 32-bit signal frame. And it can happen that we get preempted
right after setting ->fpstate_active in a task's FPU.

After we get preempted, we switch between tasks merrily and eventually
are about to switch to that task above whose ->fpstate_active we
set. We enter __switch_to() and do switch_fpu_prepare(). Our task gets
->fpregs_active set, we find ourselves back on the call stack below and
especially in __fpu__restore_sig() which sets ->fpregs_active again.

Leading to that whoops below.

So let's enlarge the preemption-off region so that we set
->fpstate_active with preemption disabled and thus not trigger
fpu.preload:

  switch_fpu_prepare

  ...

        fpu.preload =3D static_cpu_has(X86_FEATURE_FPU) &&
                      new_fpu->fpstate_active &&
		      ^^^^^^^^^^^^^^^^^^^^^^

prematurely.

  WARNING: CPU: 0 PID: 3031 at ./arch/x86/include/asm/fpu/internal.h:530 fp=
u__restore+0x90/0x130()
  Modules linked in: ...
   CPU: 0 PID: 3031 Comm: bash Not tainted 4.5.0-rc3+ #1
   ...
  Call Trace:
    dump_stack
    warn_slowpath_common
    ? fpu__restore
    ? fpu__restore
    warn_slowpath_null
    fpu__restore
    __fpu__restore_sig
    fpu__restore_sig
    restore_sigcontext
    sys_sigreturn
    do_syscall_32_irqs_on
    entry_INT80_32

Suggested-by: Andy Lutomirski <luto@amacapital.net>
Signed-off-by: Borislav Petkov <bp@suse.de>
---
 arch/x86/kernel/fpu/signal.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/fpu/signal.c b/arch/x86/kernel/fpu/signal.c
index 31c6a60505e6..408e5a1c6fdd 100644
--- a/arch/x86/kernel/fpu/signal.c
+++ b/arch/x86/kernel/fpu/signal.c
@@ -316,12 +316,11 @@ static int __fpu__restore_sig(void __user *buf, void =
__user *buf_fx, int size)
 			sanitize_restored_xstate(tsk, &env, xfeatures, fx_only);
 		}
 =

+		preempt_disable();
 		fpu->fpstate_active =3D 1;
-		if (use_eager_fpu()) {
-			preempt_disable();
+		if (use_eager_fpu())
 			fpu__restore(fpu);
-			preempt_enable();
-		}
+		preempt_enable();
 =

 		return err;
 	} else {
-- =

2.3.5

-- =

Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.

--===============4943939774030033637==--

