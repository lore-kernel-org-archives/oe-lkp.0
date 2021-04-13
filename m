Content-Type: multipart/mixed; boundary="===============0334134533411081938=="
MIME-Version: 1.0
From: SeongJae Park <sj38.park@gmail.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2 00/16] Multigenerational LRU Framework
Date: Tue, 13 Apr 2021 16:42:15 +0000
Message-ID: <20210413164215.30555-1-sjpark@amazon.de>
In-Reply-To: <3ddd4f8a-8e51-662b-df11-a63a0e75b2bc@kernel.dk>
List-Id: <oe-lkp.lists.linux.dev>

--===============0334134533411081938==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: SeongJae Park <sjpark@amazon.de>

On Tue, 13 Apr 2021 10:13:24 -0600 Jens Axboe <axboe@kernel.dk> wrote:

> On 4/13/21 1:51 AM, SeongJae Park wrote:
> > From: SeongJae Park <sjpark@amazon.de>
> > =

> > Hello,
> > =

> > =

> > Very interesting work, thank you for sharing this :)
> > =

> > On Tue, 13 Apr 2021 00:56:17 -0600 Yu Zhao <yuzhao@google.com> wrote:
> > =

> >> What's new in v2
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> Special thanks to Jens Axboe for reporting a regression in buffered
> >> I/O and helping test the fix.
> > =

> > Is the discussion open?  If so, could you please give me a link?
> =

> I wasn't on the initial post (or any of the lists it was posted to), but
> it's on the google page reclaim list. Not sure if that is public or not.
> =

> tldr is that I was pretty excited about this work, as buffered IO tends
> to suck (a lot) for high throughput applications. My test case was
> pretty simple:
> =

> Randomly read a fast device, using 4k buffered IO, and watch what
> happens when the page cache gets filled up. For this particular test,
> we'll initially be doing 2.1GB/sec of IO, and then drop to 1.5-1.6GB/sec
> with kswapd using a lot of CPU trying to keep up. That's mainline
> behavior.
> =

> The initial posting of this patchset did no better, in fact it did a bit
> worse. Performance dropped to the same levels and kswapd was using as
> much CPU as before, but on top of that we also got excessive swapping.
> Not at a high rate, but 5-10MB/sec continually.
> =

> I had some back and forths with Yu Zhao and tested a few new revisions,
> and the current series does much better in this regard. Performance
> still dips a bit when page cache fills, but not nearly as much, and
> kswapd is using less CPU than before.
> =

> Hope that helps,

Appreciate this kind and detailed explanation, Jens!

So, my understanding is that v2 of this patchset improved the performance by
using frequency (tier) in addition to recency (generation number) for buffe=
red
I/O pages.  That makes sense to me.  If I'm misunderstanding, please let me
know.


Thanks,
SeongJae Park

> -- =

> Jens Axboe
>=20
--===============0334134533411081938==--

