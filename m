Content-Type: multipart/mixed; boundary="===============7079494244805526854=="
MIME-Version: 1.0
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: lkp@lists.01.org
Subject: Re: [PATCH] x86/asm: Fix inline asm call constraints for GCC 4.4
Date: Thu, 28 Sep 2017 20:40:56 -0500
Message-ID: <20170929014056.gzfge2efgwfxkokj@treble>
In-Reply-To: <CA+55aFxkVPZRAuLQ-xOsdvLZtnJpSAWuW0zUefojSmo=uLsgTg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7079494244805526854==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 28, 2017 at 04:53:09PM -0700, Linus Torvalds wrote:
> On Thu, Sep 28, 2017 at 2:58 PM, Josh Poimboeuf <jpoimboe@redhat.com> w=
rote:
> >
> > Reported-by: kernel test robot <xiaolong.ye@intel.com>
> > Fixes: f5caf621ee35 ("x86/asm: Fix inline asm call constraints for Clan=
g")
> > Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
> =

> Side note: it's not like I personally need the credit, but in general
> I really want people to pick up on who debugged the code and pointed
> to the solution. That's often more of the work than the fix itself.
> =

> The kernel test robot report looked to be ignored as a "gcc-4.4 is too
> old to worry about" thing. People who then step up and analyze the
> problem are rare as it is. They need to be credited in the commit
> logs.
> =

> We don't have any fixed format for that, but it's pretty free-form. So
> we have tags like
> =

>   Root-caused-by:
>   Diagnosed-by:
>   Analyzed-by:
>   Debugged-by:
>   Bisected-by:
>   Fix-suggested-by:
> =

> etc for giving credit to people who figured out some part of a bug
> (and, having grepped for this, we also a _shitload_ of miss-spellings
> of various things ;)

Indeed, credit is important and I try to give it where it's due.  Sorry
for the snub!  I anoint you with:

Debugged-by: Linus Torvalds <torvalds@linux-foundation.org>

-- =

Josh

--===============7079494244805526854==--

