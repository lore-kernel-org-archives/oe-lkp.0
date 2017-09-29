Content-Type: multipart/mixed; boundary="===============1100093571543862474=="
MIME-Version: 1.0
From: Ingo Molnar <mingo@kernel.org>
To: lkp@lists.01.org
Subject: Re: [PATCH] x86/asm: Fix inline asm call constraints for GCC 4.4
Date: Fri, 29 Sep 2017 09:51:30 +0200
Message-ID: <20170929075130.unemx3lbusjd6f6q@gmail.com>
In-Reply-To: <CA+55aFxkVPZRAuLQ-xOsdvLZtnJpSAWuW0zUefojSmo=uLsgTg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1100093571543862474==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


* Linus Torvalds <torvalds@linux-foundation.org> wrote:

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
> old to worry about" thing. [...]

No, and sorry if my first reply grumbling about how old GCC 4.4 is sounded =
that =

way! We have to live with compiler bugs no matter how old the compiler is, =
the =

release cycles are decoupled to such a degree and external tooling propagat=
es with =

such high latencies that that's the only sane thing to do.

We also officially support GCC 3.2 and later compilers. Had this regression=
 not =

been resolved within a week or so I was fully ready to queue up a revert co=
mmit, =

no questions asked.

Plus it's not just that it's a regression, but adding support for a differe=
nt =

compiler is about the _worst_ possible reason to break working compilers ...

> [...] People who then step up and analyze the problem are rare as it is. =
They =

> need to be credited in the commit logs.
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

Yeah, I sometimes add such tags, but not routinely. I'll lower the threshol=
d for =

adding such tags, to create further incentives for people to help debug cra=
shes.

Thanks,

	Ingo

--===============1100093571543862474==--

