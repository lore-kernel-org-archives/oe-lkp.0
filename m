Content-Type: multipart/mixed; boundary="===============7765950862993693286=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Fri, 19 Aug 2016 18:08:00 -0700
Message-ID: <CA+55aFxi01rPHNi41JWavDFAm-3EOuQRieNnLuxiHhqJhGtNHA@mail.gmail.com>
In-Reply-To: <20160819234839.GG22388@dastard>
List-Id: <oe-lkp.lists.linux.dev>

--===============7765950862993693286==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 19, 2016 at 4:48 PM, Dave Chinner <david@fromorbit.com> wrote:
>
> Well, it depends on the speed of the storage. The higher the speed
> of the storage, the less we care about stalling on dirty pages
> during reclaim

Actually, that's largely true independently of the speed of the storage, I =
feel.

On really fast storage, you might as well push it out and buffering
lots of dirty memory pointless. And on really slow storage, buffering
lots of dirty memory is absolutely *horrible* from a latency
standpoint.

So I don't think this is about fast-vs-slow disks.

I think a lot of our "let's aggressively buffer dirty data" is
entirely historical. When you had 16MB of RAM in a workstation,
aggressively using half of it for writeback caches meant that you
could do things like untar source trees without waiting for IO.

But when you have 16GB of RAM in a workstation, and terabytes of RAM
in multi-node big machines, it's kind of silly to talk about
"percentages of memory available" for dirty data. I think it's likely
silly to even see "one node worth of memory" as being some limiter.

So I think we should try to avoid stalling on dirty pages during
reclaim by simply aiming to have fewer dirty pages in the first place.
Not because the stall is shorter on a fast disk, but because we just
shouldn't use that much memory for dirty data.

                 Linus

--===============7765950862993693286==--

