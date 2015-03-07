Content-Type: multipart/mixed; boundary="===============8136808189713463577=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@amacapital.net>
To: lkp@lists.01.org
Subject: Re: [x86/asm/entry] BUG: unable to handle kernel paging request
Date: Fri, 06 Mar 2015 16:33:56 -0800
Message-ID: <CALCETrVvuQEu5Az4EFUr6Fhx00bFS3NCwN6MJ3gY00o4u2eWWg@mail.gmail.com>
In-Reply-To: <20150306233033.GA3556@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8136808189713463577==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 6, 2015 at 3:30 PM, Fengguang Wu <fengguang.wu@intel.com> wro=
te:
> Greetings,
>
> 0day kernel testing robot got the below dmesg and the first bad commit is
>
> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/asm
>
> commit 75182b1632a89f12540baa1806a7c5c180db620c
> Author:     Andy Lutomirski <luto@amacapital.net>
> AuthorDate: Thu Mar 5 19:19:03 2015 -0800
> Commit:     Ingo Molnar <mingo@kernel.org>
> CommitDate: Fri Mar 6 08:32:57 2015 +0100
>
>     x86/asm/entry: Switch all C consumers of kernel_stack to this_cpu_sp0=
()

This problem only happens on 32-bit kernels, and the culprit is, sort of:

/*
 * The below -8 is to reserve 8 bytes on top of the ring0 stack.
 * This is necessary to guarantee that the entire "struct pt_regs"
 * is accessible even if the CPU haven't stored the SS/ESP registers
 * on the stack (interrupt gate does not save these registers
 * when switching to the same priv ring).
 * Therefore beware: accessing the ss/esp fields of the
 * "struct pt_regs" is possible, but they may contain the
 * completely wrong values.
 */
#define task_pt_regs(task)                                             \
({                                                                     \
       struct pt_regs *__regs__;                                       \
       __regs__ =3D (struct pt_regs *)(KSTK_TOP(task_stack_page(task))-8); \
       __regs__ - 1;                                                   \
})

I'm confused about multiple things:

1. I don't understand this comment.

2. copy_thread thinks that sp0 should be task_pt_regs + 1, which is 8
bytes below the top of the stack.  cpu_tss, formerly INIT_TSS, thinks
that sp0 should be the top of the stack.  This is inconsistent.  What
gives?

3. vm86 does something terrible to sp0, which might mean that we can't
use sp0 to find the top of the stack in general on 32-bit kernels,
which is sad.  We might need a partial revert or to introduce a
per-cpu variable "real_sp0" on 32-bit.  Ugh.  Could someone who
understands vm86 mode better than me give me a hint?

4. Not directly related, but the 32-bit tss_struct contains this gem:

    /*
     * .. and then another 0x100 bytes for the emergency kernel stack:
     */
    unsigned long        stack[64];

Last I checked, 0x100 !=3D 64.  Also, wow, this is kind of disgusting. :)

I'd like to make the two non-vm86 thinks that set sp0 agree with each
other, but I clearly don't understand what's going on here.

--Andy

--===============8136808189713463577==--

