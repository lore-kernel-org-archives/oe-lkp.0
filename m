Content-Type: multipart/mixed; boundary="===============2284647791411384455=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: BUG: KASAN: slab-out-of-bounds in perf_callchain_user+0x494/0x530
Date: Wed, 06 Dec 2017 16:45:44 +0100
Message-ID: <20171206154544.oiavdgfrpryak23z@hirez.programming.kicks-ass.net>
In-Reply-To: <20171206143130.GA3367@danjae.aot.lge.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2284647791411384455==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 06, 2017 at 11:31:30PM +0900, Namhyung Kim wrote:

> > There's also a race against put_callchain_buffers() there, consider:
> > =

> > =

> > 	get_callchain_buffers()		put_callchain_buffers()
> > 	  mutex_lock();
> > 	  inc()
> > 					  dec_and_test() // false
> > =

> > 	  dec() // 0
> > =

> > =

> > And the buffers leak.
> =

> Hmm.. did you mean that get_callchain_buffers() returns an error?

Yes, get_callchain_buffers() fails, but while doing so it has a
temporary increment on the count.

> AFAICS it cannot fail when it sees count > 1 (and callchain_cpus_
> entries is allocated).  =


It can with your patch. We only test event_max_stack against the sysctl
after incrementing.

--===============2284647791411384455==--

