Content-Type: multipart/mixed; boundary="===============8131287158281002312=="
MIME-Version: 1.0
From: Steven Rostedt <rostedt@goodmis.org>
To: lkp@lists.01.org
Subject: Re: [x86, build] 6dafca9780: WARNING:at_arch/x86/kernel/ftrace.c:#ftrace_verify_code
Date: Tue, 02 Mar 2021 10:58:27 -0500
Message-ID: <20210302105827.3403656c@gandalf.local.home>
In-Reply-To: <YD4DM6uAETid7j4l@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============8131287158281002312==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 2 Mar 2021 10:19:47 +0100
Peter Zijlstra <peterz@infradead.org> wrote:

> On Mon, Mar 01, 2021 at 08:15:26PM -0500, Steven Rostedt wrote:
> > diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
> > index 7edbd5ee5ed4..e8afc765e00a 100644
> > --- a/arch/x86/kernel/ftrace.c
> > +++ b/arch/x86/kernel/ftrace.c
> > @@ -36,6 +36,7 @@
> >  #ifdef CONFIG_DYNAMIC_FTRACE
> >  =

> >  static int ftrace_poke_late =3D 0;
> > +static const char p6_nop[] =3D { P6_NOP5 };  =

> =

> I don't understand this approach, why not simply rewrite all the nops at
> boot and not worry about it when modifying the code later?

That was one of the suggestions I made in the first reply. But it's more
complex than that. Because the CC_USING_NOP_MCOUNT was added for other
architectures (currently only s390 and parisc uses it), it simply skips the
process of initializing the mcount/fentry into nops if the compiler had
already done it.

But because x86 is the only architecture daft enough to have different nops
with different "performance" depending on what hardware it's booted on, it's
a bit "special".

If we have to convert nops at boot up in case the compiler gets it wrong,
than why bother having the compiler try in the first place?

In other words, the only changes I see is the one I just made, or we rip
out CC_USING_NOP_MCOUNT for x86 completely.

-- Steve
--===============8131287158281002312==--

