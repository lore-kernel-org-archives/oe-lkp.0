Content-Type: multipart/mixed; boundary="===============3960346770676289236=="
MIME-Version: 1.0
From: Ingo Molnar <mingo@kernel.org>
To: lkp@lists.01.org
Subject: Re: [x86/fpu] 58122bf1d8: WARNING: CPU: 0 PID: 1 at arch/x86/include/asm/fpu/internal.h:529 fpu__restore+0x28f/0x9ab()
Date: Sat, 27 Feb 2016 13:02:11 +0100
Message-ID: <20160227120211.GA25164@gmail.com>
In-Reply-To: <20160226074940.GA28911@pd.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============3960346770676289236==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


* Borislav Petkov <bp@alien8.de> wrote:

> From: Borislav Petkov <bp@suse.de>
> Date: Mon, 15 Feb 2016 19:50:33 +0100
> Subject: [PATCH] x86/FPU: Fix double FPU regs activation
> =

> sys_sigreturn() calls fpu__restore_sig() with interrupts enabled. When
> restoring a 32-bit signal frame. And it can happen that we get preempted
> right after setting ->fpstate_active in a task's FPU.
> =

> After we get preempted, we switch between tasks merrily and eventually
> are about to switch to that task above whose ->fpstate_active we
> set. We enter __switch_to() and do switch_fpu_prepare(). Our task gets
> ->fpregs_active set, we find ourselves back on the call stack below and
> especially in __fpu__restore_sig() which sets ->fpregs_active again.
> =

> Leading to that whoops below.
> =

> So let's enlarge the preemption-off region so that we set
> ->fpstate_active with preemption disabled and thus not trigger
> fpu.preload:
> =

>   switch_fpu_prepare
> =

>   ...
> =

>         fpu.preload =3D static_cpu_has(X86_FEATURE_FPU) &&
>                       new_fpu->fpstate_active &&
> 		      ^^^^^^^^^^^^^^^^^^^^^^
> =

> prematurely.

So I'm wondering, why did this commit:

  58122bf1d856 x86/fpu: Default eagerfpu=3Don on all CPUs

trigger the warning, while it never triggered on CPUs that were already =

eagerfpu=3Don for years?

There must be something we are still missing I think.

Thanks,

	Ingo

--===============3960346770676289236==--

