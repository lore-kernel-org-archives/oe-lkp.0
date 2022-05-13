Content-Type: multipart/mixed; boundary="===============3777807422038256839=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [x86/uaccess] 9c5743dff4: WARNING:at_arch/x86/mm/extable.c:#ex_handler_fprestore
Date: Fri, 13 May 2022 09:52:08 -0700
Message-ID: <CAHk-=wjDE7tWc5k81P41AKw9b13ehrTX8XawgnP-wa6fA57kuA@mail.gmail.com>
In-Reply-To: <20220513085455.GB21013@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============3777807422038256839==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, May 13, 2022 at 1:55 AM kernel test robot <oliver.sang@intel.com>=
 wrote:
>
> FYI, we noticed the following commit (built with gcc-11): commit
> 9c5743dff415 ("x86/uaccess: fix code generation in put_user()")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>
> in testcase: boot
>
> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 16G
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):

Hmm. It sounds unlikely that _that_ commit caused the problem,
although tweaks to generate different code can obviously always expose
anything..

But considering that the fail:runs thing is 41:52, I suspect it's
something very timing-dependent and who knows how reliable the
bisection has been.

That commit did have some discussion about how to possibly do it more
nicely without the "register asm" thing, but I'm not finding anything
else about it, so I don't think it caused any actual real code
generation problems.

As such, it seems unlikely to then cause this FP state restore issue..

> [ 266.823123][ T1] WARNING: CPU: 0 PID: 1 at arch/x86/mm/extable.c:65 ex_=
handler_fprestore (??:?)

This is just

    65          WARN_ONCE(1, "Bad FPU state detected at %pB,
reinitializing FPU registers.",
    66                    (void *)instruction_pointer(regs));

which isn't great, in that it implies that there was bad fp state to
restore in the first place.

But that can technically happen when user space does something bad
too, notably when it has used ptrace to change the FP state.

See commit d5c8028b4788 ("x86/fpu: Reinitialize FPU registers if
restoring FPU state fails") for more details.

And *this* part:

> [ 266.879246][ T1] RIP: 0010:copy_kernel_to_fpregs (core.c:?)
> [ 266.880748][ T1] Code: 05 31 84 1e 0b 48 c7 c7 50 47 2b 8c 48 8d 58 01 =
e8 c1 80 5c 00 b8 ff ff ff ff 48 89 1d 15 84 1e 0b 4c 89 e7 89 c2 48 0f ae =
2f <48> c7 c7 58 47 2b 8c e8 60 82 5c 00 48 8b 05 01 84 1e 0b 48 c7 c7
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>    0:   05 31 84 1e 0b          add    $0xb1e8431,%eax
>    5:   48 c7 c7 50 47 2b 8c    mov    $0xffffffff8c2b4750,%rdi
>    c:   48 8d 58 01             lea    0x1(%rax),%rbx
>   10:   e8 c1 80 5c 00          callq  0x5c80d6
>   15:   b8 ff ff ff ff          mov    $0xffffffff,%eax
>   1a:   48 89 1d 15 84 1e 0b    mov    %rbx,0xb1e8415(%rip)        # 0xb1=
e8436
>   21:   4c 89 e7                mov    %r12,%rdi
>   24:   89 c2                   mov    %eax,%edx
>   26:   48 0f ae 2f             xrstor64 (%rdi)
>   2a:*  48 c7 c7 58 47 2b 8c    mov    $0xffffffff8c2b4758,%rdi         <=
-- trapping instruction

Seems to be just the exception stack chain (ie notice how it's
pointing to the instruction after the xrstor64, it's not that the
immediate register move really trapped).

> [ 266.899210][ T1] __fpregs_load_activate (core.c:?)
> [ 266.900418][ T1] copy_fpstate_to_sigframe (??:?)
> [ 266.901947][ T1] get_sigframe+0x196/0x360
> [ 266.903138][ T1] __setup_rt_frame (signal.c:?)
> [ 266.904162][ T1] setup_rt_frame (signal.c:?)
> [ 266.905386][ T1] handle_signal (signal.c:?)
> [ 266.906423][ T1] arch_do_signal (??:?)

.. and it is in the signal handling path when returning to user space. Hmm.

And then again, we have the exception stack entry all the way to user space:

> [  266.914026][    T1] RIP: 0033:0x7f32488b5700
> [ 266.915046][ T1] Code: 76 05 e9 f3 fd ff ff 48 8b 05 3c f7 37 00 64 c7 =
00 16 00 00 00 83 c8 ff c3 90 41 ba 08 00 00 00 48 63 ff b8 0e 00 00 00 0f =
05 <48> 3d 00 f0 ff ff 77 02 f3 c3 48 8b 15 0f f7 37 00 f7 d8 64 89 02
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>    0:   76 05                   jbe    0x7
>    2:   e9 f3 fd ff ff          jmpq   0xfffffffffffffdfa
>    7:   48 8b 05 3c f7 37 00    mov    0x37f73c(%rip),%rax        # 0x37f=
74a
>    e:   64 c7 00 16 00 00 00    movl   $0x16,%fs:(%rax)
>   15:   83 c8 ff                or     $0xffffffff,%eax
>   18:   c3                      retq
>   19:   90                      nop
>   1a:   41 ba 08 00 00 00       mov    $0x8,%r10d
>   20:   48 63 ff                movslq %edi,%rdi
>   23:   b8 0e 00 00 00          mov    $0xe,%eax
>   28:   0f 05                   syscall
>   2a:*  48 3d 00 f0 ff ff       cmp    $0xfffffffffffff000,%rax         <=
-- trapping instruction

and again, it's just pointing back to after the 'syscall' instruction
that caused this whole chain of events.

Anyway, I *think* that what may be going on is some ptrace thing, but
let's bring in other people. Because I don't think that "x86/uaccess:
fix code generation in put_user()" commit is what triggered this, but
who knows.. The x86 FP code can be very grotty.
--===============3777807422038256839==--

