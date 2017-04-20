Content-Type: multipart/mixed; boundary="===============4754940474543789144=="
MIME-Version: 1.0
From: Steven Rostedt <rostedt@goodmis.org>
To: lkp@lists.01.org
Subject: Re: [x86/ftrace] 644e0e8dc7:
Date: Thu, 20 Apr 2017 10:57:42 -0400
Message-ID: <20170420105742.7289d9a8@gandalf.local.home>
In-Reply-To: <20170420103316.5d963895@gandalf.local.home>
List-Id: <oe-lkp.lists.linux.dev>

--===============4754940474543789144==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 20 Apr 2017 10:33:16 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> We could do something ugly like:
> =

> #ifdef CC_USING_FENTRY
> #ifdef CONFIG_FRAME_POINTERS
> 	movl	15*4(%esp), %edx
> #else
>         /* Load 4 off of the parent ip addr into ebp */
>         lea     14*4(%esp), %ebp
> #endif
> #endif  =

> =

>         movl    12*4(%esp), %eax                /* Load ip (1st parameter=
) */
>         subl    $MCOUNT_INSN_SIZE, %eax         /* Adjust ip */
> #if !defined(CC_USING_FENTRY) || !defined(CONFIG_FRAME_POINTERS)
>         movl    0x4(%ebp), %edx                 /* Load parent ip (2nd pa=
rameter) */
> #endif
>         movl    function_trace_op, %ecx         /* Save ftrace_pos in 3rd=
 parameter */
>         pushl   %esp                            /* Save pt_regs as 4th pa=
rameter */
> =


Or perhaps it can be:

        movl    12*4(%esp), %eax                /* Load ip (1st parameter) =
*/
        subl    $MCOUNT_INSN_SIZE, %eax         /* Adjust ip */
#ifdef CC_USING_FENTRY
	movl	15*4(%esp), %edx
#else
        movl    0x4(%ebp), %edx                 /* Load parent ip (2nd para=
meter) */
#endif
        movl    function_trace_op, %ecx         /* Save ftrace_pos in 3rd p=
arameter */
        pushl   %esp                            /* Save pt_regs as 4th para=
meter */

There might have been a reason I didn't do it this way. I'll have to
check.

-- Steve

--===============4754940474543789144==--

