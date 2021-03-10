Content-Type: multipart/mixed; boundary="===============2451091269091064308=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [mm, slub] 8ff60eb052: stress-ng.rawpkt.ops_per_sec -47.9% regression
Date: Wed, 10 Mar 2021 10:17:43 -0800
Message-ID: <CAHk-=whJCPchWozS0-4gF8zJ+9SfRv3h7jCSmivr+fs+eJJuZA@mail.gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2103100757530.128125@gentwo.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============2451091269091064308==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 9, 2021 at 10:59 PM Christoph Lameter <cl@gentwo.de> wrote:
>
> >
> > it really looks like this might well have been very intentional
> > indeed. Or at least very beneficial for _some_ loads.
>
> Yes the thought was that adding an additional page when contention is
> there on the page objects will increase possible concurrency while
> avoiding locks and increase the ability to allocate / free concurrently
> from a multitude of objects.

I wonder if we might have a "try twice before failing" middle ground,
rather than break out on the very first cmpxchg failure (or continue
forever).

Yes, yes, it claims a "Fixes:", but the commit it claims to fix really
does explicitly _mention_ avoiding the loop in the commit message, and
this kernel test robot report very much implies that that original
commit was right, and the "fix" is wrong.

Jann - if you had other loads that showed problems, that would be
worth documenting.

And as mentioned, maybe having a _limited_ retry, rather than a
"continue for as long as there is contention" that clearly regresses
on this (perhaps odd) load?

But for now, I think the thing to do is revert.

         Linus
--===============2451091269091064308==--

