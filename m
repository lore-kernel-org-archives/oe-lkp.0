Content-Type: multipart/mixed; boundary="===============4847989480039816478=="
MIME-Version: 1.0
From: Steven Rostedt <rostedt@goodmis.org>
To: lkp@lists.01.org
Subject: Re: [x86, build] 6dafca9780: WARNING:at_arch/x86/kernel/ftrace.c:#ftrace_verify_code
Date: Mon, 01 Mar 2021 21:47:02 -0500
Message-ID: <20210301214702.1119c732@oasis.local.home>
In-Reply-To: <YD2loOkd/AYqKPB6@google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4847989480039816478==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 1 Mar 2021 18:40:32 -0800
Sami Tolvanen <samitolvanen@google.com> wrote:

> On Mon, Mar 01, 2021 at 08:15:26PM -0500, Steven Rostedt wrote:
> > On Mon, 1 Mar 2021 16:03:51 -0800
> > Sami Tolvanen <samitolvanen@google.com> wrote:  =

> > >   =

> > > >                 ret =3D ftrace_verify_code(rec->ip, old);
> > > > +
> > > > +               if (__is_defined(CC_USING_NOP_MCOUNT) && ret && old=
_nop) {
> > > > +                       /* Compiler could have put in P6_NOP5 */
> > > > +                       old =3D P6_NOP5;
> > > > +                       ret =3D ftrace_verify_code(rec->ip, old);
> > > > +               }
> > > > +    =

> > > =

> > > Wouldn't that still hit WARN(1) in the initial ftrace_verify_code()
> > > call if ideal_nops doesn't match?  =

> > =

> > That was too quickly written ;-)
> > =

> > Take 2:
> > =

> > [ with fixes for setting p6_nop ]  =

> =

> Thanks, I tested this with the config from the build bot, and I can
> confirm that it fixes the issue for me.
> =

> I also tested a quick patch to disable the __fentry__ conversion in
> objtool, and it seems to work too, but it's probably a good idea to
> fix the issue with CC_USING_NOP_MCOUNT in any case.

Thanks for testing, I'll make this into a proper patch and start
testing it internally. I'm assuming you want this to go into the -rc
release and possibly stable?

-- Steve
--===============4847989480039816478==--

