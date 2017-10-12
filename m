Content-Type: multipart/mixed; boundary="===============4149932318758269832=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/kconfig] 81d3871900: BUG:unable_to_handle_kernel
Date: Thu, 12 Oct 2017 11:48:43 -0700
Message-ID: <20171012114843.d74096014cb88eedbaa7ac70@linux-foundation.org>
In-Reply-To: <CAADWXX-M2uftDuCyAS+UMKACC6d-B+Zb-DDNGO76yRS5wuigHw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4149932318758269832==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 12 Oct 2017 10:54:57 -0700 Linus Torvalds <torvalds@linux-foundat=
ion.org> wrote:

> On Thu, Oct 12, 2017 at 10:05 AM, Christopher Lameter <cl@linux.com> wr=
ote:
> > On Wed, 11 Oct 2017, Josh Poimboeuf wrote:
> >
> >> I failed to add the slab maintainers to CC on the last attempt.  Trying
> >> again.
> >
> > Hmmm... Yea. SLOB is rarely used and tested. Good illustration of a sim=
ple
> > allocator and the K&R mechanism that was used in the early kernels.
> =

> Should we finally just get rid of SLOB?
> =

> I'm not happy about the whole "three different allocators" crap. It's
> been there for much too long, and I've tried to cut it down before.
> People always protest, but three different allocators, one of which
> gets basically no testing, is not good.
> =


I am not aware of anyone using slob.  We could disable it in Kconfig
for a year, see what the feedback looks like.

--===============4149932318758269832==--

