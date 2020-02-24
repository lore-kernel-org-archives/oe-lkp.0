Content-Type: multipart/mixed; boundary="===============4448744585419756210=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [perf/x86] 81ec3f3c4c: will-it-scale.per_process_ops -5.5% regression
Date: Mon, 24 Feb 2020 10:19:15 +0800
Message-ID: <20200224021915.GC5061@shbuild999.sh.intel.com>
In-Reply-To: <CAHk-=whi87NNOnNXJ6CvyyedmhnS8dZA2YkQQSajvBArH5XOeA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4448744585419756210==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 23, 2020 at 05:06:33PM -0800, Linus Torvalds wrote:
 =

> >      ffffffff8225b580 d types__ptrace
> >      ffffffff8225b5c0 D root_user
> >      ffffffff8225b680 D init_user_ns
> =

> I'm assuming this is after the alignment patch (since that's 64-byte
> aligned there).
> =

> What was it without the alignment?

For 5.0-rc6: =

	ffffffff8225b4c0 d types__ptrace
	ffffffff8225b4e0 D root_user
	ffffffff8225b580 D init_user_ns

For 5.0-rc6 + 81ec3f3c4c4
	ffffffff8225b580 d types__ptrace
	ffffffff8225b5a0 D root_user
	ffffffff8225b640 D init_user_ns

The sigpending and __count are in the same cachline.

> =

> > No, it's not the biggest, I tried another machine 'Xeon Phi(TM) CPU 729=
5',
> > which has 72C/288T, and the regression is not seen. This is the part
> > confusing me :)
> =

> Hmm.
> =

> Humor me - what  happens if you turn off SMT on that Cascade Lake
> system?  Maybe it's about the thread ID bit in the L1? Although again,
> I'd have expected things to get _worse_ if it's the two fields that
> are now in the same cachline thanks to alignment.

I'll try it and report back.
 =

> The Xeon Phi is the small-core setup, right? They may be slow enough
> to not show the issue as clearly despite having more cores. And it
> wouldn't show effects of some out-of-order speculative cache accesses.

Yes, seems the Xeon Phi is using 72 Silvermont cores. And the less bigger
platform I tested was a 2 sockets 48C/96T Cascadelake platform which
doesn't reproduce the regression.

Thanks,
Feng
--===============4448744585419756210==--

