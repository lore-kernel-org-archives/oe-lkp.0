Content-Type: multipart/mixed; boundary="===============6676875104364523872=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [PATCH] x86/asm: Fix inline asm call constraints for GCC 4.4
Date: Thu, 28 Sep 2017 16:53:09 -0700
Message-ID: <CA+55aFxkVPZRAuLQ-xOsdvLZtnJpSAWuW0zUefojSmo=uLsgTg@mail.gmail.com>
In-Reply-To: <20170928215826.6sdpmwtkiydiytim@treble>
List-Id: <oe-lkp.lists.linux.dev>

--===============6676875104364523872==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 28, 2017 at 2:58 PM, Josh Poimboeuf <jpoimboe@redhat.com> wro=
te:
>
> Reported-by: kernel test robot <xiaolong.ye@intel.com>
> Fixes: f5caf621ee35 ("x86/asm: Fix inline asm call constraints for Clang")
> Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>

Side note: it's not like I personally need the credit, but in general
I really want people to pick up on who debugged the code and pointed
to the solution. That's often more of the work than the fix itself.

The kernel test robot report looked to be ignored as a "gcc-4.4 is too
old to worry about" thing. People who then step up and analyze the
problem are rare as it is. They need to be credited in the commit
logs.

We don't have any fixed format for that, but it's pretty free-form. So
we have tags like

  Root-caused-by:
  Diagnosed-by:
  Analyzed-by:
  Debugged-by:
  Bisected-by:
  Fix-suggested-by:

etc for giving credit to people who figured out some part of a bug
(and, having grepped for this, we also a _shitload_ of miss-spellings
of various things ;)

                 Linus

--===============6676875104364523872==--

