Content-Type: multipart/mixed; boundary="===============7042143539413590848=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Thu, 11 Aug 2016 22:02:39 -0700
Message-ID: <CA+55aFyed_pvUwCXSgyqvOa6VCkuE-qgFPi0CRqcnOWuXiAECQ@mail.gmail.com>
In-Reply-To: <20160812041622.GR19025@dastard>
List-Id: <oe-lkp.lists.linux.dev>

--===============7042143539413590848==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 11, 2016 at 9:16 PM, Dave Chinner <david@fromorbit.com> wrote:
>
> That's why running aim7 as your "does the filesystem scale"
> benchmark is somewhat irrelevant to scaling applications on high
> performance systems these days

Yes, don't get me wrong - I'm not at all trying to say that AIM7 is a
good benchmark. It's just that I think what it happens to test is
still meaningful, even if it's not necessarily in any way some kind of
"high performance IO" thing.

There are probably lots of other more important loads, I just reacted
to Christoph seeming to argue that the AIM7 behavior was _so_ broken
that we shouldn't even care. It's not _that_ broken, it's just not
about high-performance IO streaming, it happens to test something else
entirely.

We've actually had AIM7 occasionally find other issues just because
some of the things it does is so odd.

Iirc it has a fork test that doesn't execve (very unusual - you'd
generally use threads if you care about performance), and that has
shown issues with our anon_vma scaling before anything else did.

I also seem to remember some odd pty open/close/ioctl subtest that
showed problems with some of the last remnants of the old BKL (the
test probably actually tested something else, but ended up choking on
the odd tty things).

So in general, I'm not a fan of AIM as a benchmark, but it actually
_has_ found lots of real issues because it tends to do things that
kernel developers think are insane.

And let's face it, user programs doing odd and not very efficient
things should be considered par for the course. We're never going to
get rid of insane user programs, so we might as well fix the
performance problems even when we say "that's just stupid".

            Linus

--===============7042143539413590848==--

