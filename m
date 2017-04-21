Content-Type: multipart/mixed; boundary="===============8759542743632809741=="
MIME-Version: 1.0
From: Masami Hiramatsu <mhiramat@kernel.org>
To: lkp@lists.01.org
Subject: Re: [x86/ftrace] 644e0e8dc7:
Date: Fri, 21 Apr 2017 18:28:45 +0900
Message-ID: <20170421182845.4a1aa48449b96c3b605b4fba@kernel.org>
In-Reply-To: <20170420140846.3b5d6c93@gandalf.local.home>
List-Id: <oe-lkp.lists.linux.dev>

--===============8759542743632809741==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 20 Apr 2017 14:08:46 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Thu, 20 Apr 2017 11:46:20 -0500
> Josh Poimboeuf <jpoimboe@redhat.com> wrote:
> =

> > > Now would my last change work for you? How does the unwinder deal with
> > > breakpoints?  =

> > =

> > Your last change should fix the unwinder warning (I think).
> =

> I think I'll include that change then.
> =

> > =

> > However there's still a minor issue.  Because ftrace_regs_caller()
> > doesn't create a stack frame header (with the original rip and ebp saved
> > together on the stack), the function being traced won't show up in the
> > stack trace.
> > =

> > There are two possible ways to fix it.  One would be to create a stack
> > frame header after the pt_regs, and point ebp to it.
> > =

> > Another possibly better way would be to encode ebp with the address of
> > the pt_regs, similar to what entry code does with ENCODE_FRAME_POINTER.
> > That would allow the unwinder to read regs->bp.  It would also be able
> > to dump the pt_regs.
> =

> Making it simulate a breakpoint even more so is better.

I agreed with this idea. It keeps changes in ftrace local :)

Thank you!

> > If the latter approach works out, we might also want to consider doing
> > something similar for x86_64.  (Currently it does the former.)
> =

> Right, because it did not have this stupid way of accessing regs.
> =

> > =

> > I can look into fixing it, though it may be a few weeks before I get to
> > it.  In the meantime I think your last change is reasonable.
> > =

> =

> Yep, missing out on a trace function in a backtrace is not the end of
> the world. But stopping your warning is enough for me to include it.
> =

> Thanks!
> =

> -- Steve


-- =

Masami Hiramatsu <mhiramat@kernel.org>

--===============8759542743632809741==--

