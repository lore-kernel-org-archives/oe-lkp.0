Content-Type: multipart/mixed; boundary="===============3684364215648134769=="
MIME-Version: 1.0
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: lkp@lists.01.org
Subject: Re: [x86/ftrace] 644e0e8dc7:
Date: Thu, 20 Apr 2017 10:30:49 -0500
Message-ID: <20170420153049.k3uyonu36mbpgx6g@treble>
In-Reply-To: <20170420103316.5d963895@gandalf.local.home>
List-Id: <oe-lkp.lists.linux.dev>

--===============3684364215648134769==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 20, 2017 at 10:33:16AM -0400, Steven Rostedt wrote:
> On Thu, 20 Apr 2017 08:28:22 -0500
> Josh Poimboeuf <jpoimboe@redhat.com> wrote:
> =

> > This seems to be a real bug, unlike some of the other unwinder warnings.
> > The following line in ftrace_32.S makes ebp point to regs->flags:
> > =

> > #ifdef CC_USING_FENTRY
> > 	/* Load 4 off of the parent ip addr into ebp */
> > 	lea	14*4(%esp), %ebp
> > #endif
> > =

> =

> You need to add the entire context:
> =

> =

> #ifdef CC_USING_FENTRY
>         /* Load 4 off of the parent ip addr into ebp */
>         lea     14*4(%esp), %ebp
> #endif  =

> =

>         movl    12*4(%esp), %eax                /* Load ip (1st parameter=
) */
>         subl    $MCOUNT_INSN_SIZE, %eax         /* Adjust ip */
>         movl    0x4(%ebp), %edx                 /* Load parent ip (2nd pa=
rameter) */
>         movl    function_trace_op, %ecx         /* Save ftrace_pos in 3rd=
 parameter */
>         pushl   %esp                            /* Save pt_regs as 4th pa=
rameter */
> =

> We need to load the parent into %edx and we use ebp for both FENTRY and
> for MCOUNT. And 32 bit gets much more difficult than 64 bit, with the
> requirement that regs is the address of the stack of where the kernel
> took the breakpoint or the ftrace callback.

Does the &regs->sp thing really need to be a requirement here though?  I
know it's due to a HW limitation, but these regs are created in SW.

If any ftrace users rely on that, could they just be changed to access
regs->sp directly?  That would make it a lot easier to simplify this
code.

-- =

Josh

--===============3684364215648134769==--

