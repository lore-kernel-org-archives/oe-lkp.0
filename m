Content-Type: multipart/mixed; boundary="===============5800126654454519989=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [i915] b12d691ea5: kernel_BUG_at_mm/memory.c
Date: Wed, 19 May 2021 06:31:31 -1000
Message-ID: <CAHk-=wgEZrsY9tsyC=+2sXVVuBDiZDTSMxt-X5LgwvSQqs_a6w@mail.gmail.com>
In-Reply-To: <CAHk-=wgYqF3bffW0EPmVTUFcoV0jXECu-A_dyWZ0ZwUwhCHi+A@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5800126654454519989==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, May 19, 2021 at 6:11 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, May 19, 2021 at 5:00 AM Kalle Valo <kvalo@codeaurora.org> wrote:
> >
> > Christoph Hellwig <hch@lst.de> writes:
> >
> > > On Tue, May 18, 2021 at 04:58:31PM -1000, Linus Torvalds wrote:
> > >>
> > >> I'd be inclined to revert the commits as "not ready yet", but it wou=
ld
> > >> be better if somebody can go "yeah, this should be done properly like
> > >> X".
> > >
> > > I think reverting just this commit for now is the best thing.
> >
> > Yes, please revert it if there's no quick fix. On my Dell XPS 13 9310
> > laptop (with Debian 10) X won't start until I revert commit
> > b12d691ea5e0, so this is a major issue.
>
> Reverted.

Oh, and Christoph - there were a couple of preparatory patches before
that one. They all looked syntactic to me, but it might be best to
check that reverting just this one commit is ok?

                   Linus
--===============5800126654454519989==--

