Content-Type: multipart/mixed; boundary="===============7310554435074069262=="
MIME-Version: 1.0
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: lkp@lists.01.org
Subject: Re: [x86/ftrace] 644e0e8dc7:
Date: Thu, 20 Apr 2017 11:46:20 -0500
Message-ID: <20170420164620.a3iynmr7nh2xoxfg@treble>
In-Reply-To: <20170420114403.3962adb8@gandalf.local.home>
List-Id: <oe-lkp.lists.linux.dev>

--===============7310554435074069262==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 20, 2017 at 11:44:03AM -0400, Steven Rostedt wrote:
> > > We need to load the parent into %edx and we use ebp for both FENTRY a=
nd
> > > for MCOUNT. And 32 bit gets much more difficult than 64 bit, with the
> > > requirement that regs is the address of the stack of where the kernel
> > > took the breakpoint or the ftrace callback.  =

> > =

> > Does the &regs->sp thing really need to be a requirement here though?  I
> > know it's due to a HW limitation, but these regs are created in SW.
> > =

> > If any ftrace users rely on that, could they just be changed to access
> > regs->sp directly?  That would make it a lot easier to simplify this
> > code.
> > =

> =

> This is for the ftrace_regs_caller code which was specifically created
> for kprobes. And its requirement was to simulate a hw interrupt. Thus,
> it being a HW limitation, means it's also a ftrace_regs_caller
> limitation.

Ah.

> Now would my last change work for you? How does the unwinder deal with
> breakpoints?

Your last change should fix the unwinder warning (I think).

However there's still a minor issue.  Because ftrace_regs_caller()
doesn't create a stack frame header (with the original rip and ebp saved
together on the stack), the function being traced won't show up in the
stack trace.

There are two possible ways to fix it.  One would be to create a stack
frame header after the pt_regs, and point ebp to it.

Another possibly better way would be to encode ebp with the address of
the pt_regs, similar to what entry code does with ENCODE_FRAME_POINTER.
That would allow the unwinder to read regs->bp.  It would also be able
to dump the pt_regs.

If the latter approach works out, we might also want to consider doing
something similar for x86_64.  (Currently it does the former.)

I can look into fixing it, though it may be a few weeks before I get to
it.  In the meantime I think your last change is reasonable.

-- =

Josh

--===============7310554435074069262==--

