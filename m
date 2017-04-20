Content-Type: multipart/mixed; boundary="===============1099549897242607536=="
MIME-Version: 1.0
From: Steven Rostedt <rostedt@goodmis.org>
To: lkp@lists.01.org
Subject: Re: [x86/ftrace] 644e0e8dc7:
Date: Thu, 20 Apr 2017 10:33:16 -0400
Message-ID: <20170420103316.5d963895@gandalf.local.home>
In-Reply-To: <20170420132822.l5lcr42ij7u4hngc@treble>
List-Id: <oe-lkp.lists.linux.dev>

--===============1099549897242607536==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 20 Apr 2017 08:28:22 -0500
Josh Poimboeuf <jpoimboe@redhat.com> wrote:

> This seems to be a real bug, unlike some of the other unwinder warnings.
> The following line in ftrace_32.S makes ebp point to regs->flags:
> =

> #ifdef CC_USING_FENTRY
> 	/* Load 4 off of the parent ip addr into ebp */
> 	lea	14*4(%esp), %ebp
> #endif
> =


You need to add the entire context:


#ifdef CC_USING_FENTRY
        /* Load 4 off of the parent ip addr into ebp */
        lea     14*4(%esp), %ebp
#endif  =


        movl    12*4(%esp), %eax                /* Load ip (1st parameter) =
*/
        subl    $MCOUNT_INSN_SIZE, %eax         /* Adjust ip */
        movl    0x4(%ebp), %edx                 /* Load parent ip (2nd para=
meter) */
        movl    function_trace_op, %ecx         /* Save ftrace_pos in 3rd p=
arameter */
        pushl   %esp                            /* Save pt_regs as 4th para=
meter */

We need to load the parent into %edx and we use ebp for both FENTRY and
for MCOUNT. And 32 bit gets much more difficult than 64 bit, with the
requirement that regs is the address of the stack of where the kernel
took the breakpoint or the ftrace callback.

I did this just to keep out extra #ifdefs. Yes, the ebp would be
corrupt here, which would only break the unwinder and nothing else. The
fix would be to add more #ifdefs for when FENTRY and
CONFIG_FRAME_POINTERS are enabled. If it is that important for you, we
can do it, I just didn't want to uglify the code anymore.

We could do something ugly like:

#ifdef CC_USING_FENTRY
#ifdef CONFIG_FRAME_POINTERS
	movl	15*4(%esp), %edx
#else
        /* Load 4 off of the parent ip addr into ebp */
        lea     14*4(%esp), %ebp
#endif
#endif  =


        movl    12*4(%esp), %eax                /* Load ip (1st parameter) =
*/
        subl    $MCOUNT_INSN_SIZE, %eax         /* Adjust ip */
#if !defined(CC_USING_FENTRY) || !defined(CONFIG_FRAME_POINTERS)
        movl    0x4(%ebp), %edx                 /* Load parent ip (2nd para=
meter) */
#endif
        movl    function_trace_op, %ecx         /* Save ftrace_pos in 3rd p=
arameter */
        pushl   %esp                            /* Save pt_regs as 4th para=
meter */

-- Steve

--===============1099549897242607536==--

