Content-Type: multipart/mixed; boundary="===============3302209267340139033=="
MIME-Version: 1.0
From: Denys Vlasenko <vda.linux@googlemail.com>
To: lkp@lists.01.org
Subject: Re: [x86/asm/entry] BUG: unable to handle kernel paging request
Date: Mon, 09 Mar 2015 13:55:33 +0100
Message-ID: <CAK1hOcNGeOdF7hfQboWe+zME31L1BwA+1iObLpnY+aYfyDx0_g@mail.gmail.com>
In-Reply-To: <CALCETrU3Ums8SnNQttoCYkdDi-T=HkhCQs-jvF21Nh6igJ3Mhw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3302209267340139033==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 8, 2015 at 8:41 PM, Andy Lutomirski <luto@amacapital.net> wro=
te:
>> It seems to be true that 32-bit x86 always has two unused words
>> beyond "struct pt_regs" on stack during syscalls.
>>
>> IOW: tss.sp0 is *not* set at the very end of the stack on 32-bit.
>
> So maybe the idea is that, if we end up using sp0 for an entry *from*
> ring 0, then the struct pt_regs won't dangle off the top of the stack.
> But this still doesn't make sense to me: if we enter from ring 0, then
> the CPU won't look at sp0 in the first place.
>
> Linus, if you're paying attention here, I suspect that you wrote this
> code.  Do you remember what the point is?

It was added in 2005:

commit 5df240826c90afdc7956f55a004ea6b702df9203
Author: Stas Sergeev <stsp@aknet.ru>
Date:   Sat Apr 16 15:24:01 2005 -0700

    [PATCH] fix crash in entry.S restore_all

    Fix the access-above-bottom-of-stack crash.

    1. Allows to preserve the valueable optimization

    2. Works for NMIs

    3.  Doesn't care whether or not there are more of the like instances
       where the stack is left empty.

    4. Seems to work for me without the crashes:)

    (akpm: this is still under discussion, although I _think_ it's OK.
You might
    want to hold off)

    Signed-off-by: Stas Sergeev <stsp@aknet.ru>
    Signed-off-by: Andrew Morton <akpm@osdl.org>
    Signed-off-by: Linus Torvalds <torvalds@osdl.org>

diff --git a/arch/i386/kernel/entry.S b/arch/i386/kernel/entry.S
index 1e45ff2..3c73dc8 100644
--- a/arch/i386/kernel/entry.S
+++ b/arch/i386/kernel/entry.S
@@ -245,6 +245,9 @@ syscall_exit:

 restore_all:
     movl EFLAGS(%esp), %eax        # mix EFLAGS, SS and CS
+    # Warning: OLDSS(%esp) contains the wrong/random values if we
+    # are returning to the kernel.
+    # See comments in process.c:copy_thread() for details.
     movb OLDSS(%esp), %ah
     movb CS(%esp), %al
     andl $(VM_MASK | (4 << 8) | 3), %eax
diff --git a/arch/i386/kernel/process.c b/arch/i386/kernel/process.c
index c36fedf..36145ef 100644
--- a/arch/i386/kernel/process.c
+++ b/arch/i386/kernel/process.c
@@ -405,7 +405,17 @@ int copy_thread(int nr, unsigned long
clone_flags, unsigned long esp,
     childregs->esp =3D esp;

     p->thread.esp =3D (unsigned long) childregs;
-    p->thread.esp0 =3D (unsigned long) (childregs+1);
+    /*
+     * The below -8 is to reserve 8 bytes on top of the ring0 stack.
+     * This is necessary to guarantee that the entire "struct pt_regs"
+     * is accessable even if the CPU haven't stored the SS/ESP registers
+     * on the stack (interrupt gate does not save these registers
+     * when switching to the same priv ring).
+     * Therefore beware: accessing the xss/esp fields of the
+     * "struct pt_regs" is possible, but they may contain the
+     * completely wrong values.
+     */
+    p->thread.esp0 =3D (unsigned long) (childregs+1) - 8;

     p->thread.eip =3D (unsigned long) ret_from_fork;




Apparently, code which uses this still exists, here
(current git):

restore_all:
        TRACE_IRQS_IRET
restore_all_notrace:
#ifdef CONFIG_X86_ESPFIX32
        movl PT_EFLAGS(%esp), %eax      # mix EFLAGS, SS and CS
        # Warning: PT_OLDSS(%esp) contains the wrong/random values if we
        # are returning to the kernel.
        # See comments in process.c:copy_thread() for details.
        movb PT_OLDSS(%esp), %ah
        movb PT_CS(%esp), %al
        andl $(X86_EFLAGS_VM | (SEGMENT_TI_MASK << 8) | SEGMENT_RPL_MASK), =
%eax
        cmpl $((SEGMENT_LDT << 8) | USER_RPL), %eax
        CFI_REMEMBER_STATE
        je ldt_ss                       # returning to user-space with LDT =
SS
#endif

"restore_all_notrace" is used by nmi handler too.
If nmi happened right after sysenter, the stack will indeed
only have three words, SS,ESP,EFLAGS, PT_OLDSS(%esp)
would refer to a word above them.

This needs better comments...

--===============3302209267340139033==--

