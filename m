Content-Type: multipart/mixed; boundary="===============2952891261168625993=="
MIME-Version: 1.0
From: Ingo Molnar <mingo@kernel.org>
To: lkp@lists.01.org
Subject: Re: [PATCH] x86/asm: Fix inline asm call constraints for GCC 4.4
Date: Fri, 29 Sep 2017 10:01:28 +0200
Message-ID: <20170929080128.eygnwju6rbegs3lh@gmail.com>
In-Reply-To: <20170929014056.gzfge2efgwfxkokj@treble>
List-Id: <oe-lkp.lists.linux.dev>

--===============2952891261168625993==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


* Josh Poimboeuf <jpoimboe@redhat.com> wrote:

> On Thu, Sep 28, 2017 at 04:53:09PM -0700, Linus Torvalds wrote:
> > On Thu, Sep 28, 2017 at 2:58 PM, Josh Poimboeuf <jpoimboe@redhat.com>=
 wrote:
> > >
> > > Reported-by: kernel test robot <xiaolong.ye@intel.com>
> > > Fixes: f5caf621ee35 ("x86/asm: Fix inline asm call constraints for Cl=
ang")
> > > Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
> > =

> > Side note: it's not like I personally need the credit, but in general
> > I really want people to pick up on who debugged the code and pointed
> > to the solution. That's often more of the work than the fix itself.
> > =

> > The kernel test robot report looked to be ignored as a "gcc-4.4 is too
> > old to worry about" thing. People who then step up and analyze the
> > problem are rare as it is. They need to be credited in the commit
> > logs.
> > =

> > We don't have any fixed format for that, but it's pretty free-form. So
> > we have tags like
> > =

> >   Root-caused-by:
> >   Diagnosed-by:
> >   Analyzed-by:
> >   Debugged-by:
> >   Bisected-by:
> >   Fix-suggested-by:
> > =

> > etc for giving credit to people who figured out some part of a bug
> > (and, having grepped for this, we also a _shitload_ of miss-spellings
> > of various things ;)
> =

> Indeed, credit is important and I try to give it where it's due.  Sorry
> for the snub!  I anoint you with:
> =

> Debugged-by: Linus Torvalds <torvalds@linux-foundation.org>

When applying the fix I went with:

  Diagnosed-by: Linus Torvalds <torvalds@linux-foundation.org>

Because I think 'diagnosing' a bug is a higher category, which implies debu=
gging. =


( Sometimes we refer to 'debugging a bug' as the reporter adding printks on =

  request and printing out key state that helps understand the bug. It does=
 not =

  necessarily imply root-causing the bug. )

Also note that I added a "Reported-and-Bisected-by:" tag for the ktest robo=
t, to =

further credit the fact that in addition to reporting a kernel crash, a spe=
cific =

commit was bisected to as well.

I'll wait for another round of ktest robot testing to make sure the crash i=
s =

indeed fixed.

Thanks,

	Ingo

--===============2952891261168625993==--

