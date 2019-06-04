Content-Type: multipart/mixed; boundary="===============6232823671707030196=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: rcu_read_lock lost its compiler barrier
Date: Tue, 04 Jun 2019 10:29:45 -0700
Message-ID: <CAHk-=wjJdffKFrZUZny=N=Yt91_9En6d+nbHF2NXKeopM3TC+A@mail.gmail.com>
In-Reply-To: <Pine.LNX.4.44L0.1906041251210.1731-100000@iolanthe.rowland.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============6232823671707030196==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 4, 2019 at 10:00 AM Alan Stern <stern@rowland.harvard.edu> wr=
ote:
>
> Which suggests asking whether these higher expectations should be
> reflected in the Linux Kernel Memory Model.  So far we have largely
> avoided doing that sort of thing, although there are a few exceptions.

I think they might be hard to describe - which in turn may be why the
standard leaves it open and only describes the simple cases.

Exactly that "we expect an assignment to be done as a single write" is
probably a good example. Yes, we do have that expectation for the
simple cases. But it's not an absolute rule, obviously, because it's
clearly violated by bitfield writes, and similarly it's obviously
violated for data that is bigger than the word size (ie a "u64"
assignment is obviously not a single write when you're on a 32-bit
target).

And while those cases are static and could be described separately,
the "oh, and we have _other_ accesses to the same variable nearby, and
we expect that the compiler might take those into account unless we
explicitly use WRITE_ONCE()" things make for much more hard to
describe issues.

Doing writes with speculative values is clearly bogus and garbage
(although compiler writers _have_ tried to do that too: "we then
overwrite it with the right value later, so it's ok"), and thankfully
even user space people complain about that due to threading and
signals. But eliding writes entirely by combining them with a later
one is clearly ok - and eliding them when there was an explcit earlier
read and value comparison (like in my example) sounds reasonable to me
too. Yet silently adding the elision that wasn't visible in the source
due to other accesses would be bad.

How do you say "sane and reasonable compiler" in a spec? You usually
don't - or  you make the rules so odd and complex than nobody really
understands them any more, and make it all moot ;)

                 Linus

--===============6232823671707030196==--

