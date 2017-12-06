Content-Type: multipart/mixed; boundary="===============4997907063594526959=="
MIME-Version: 1.0
From: Namhyung Kim <namhyung@kernel.org>
To: lkp@lists.01.org
Subject: Re: BUG: KASAN: slab-out-of-bounds in perf_callchain_user+0x494/0x530
Date: Thu, 07 Dec 2017 00:49:57 +0900
Message-ID: <20171206154957.GB3367@danjae.aot.lge.com>
In-Reply-To: <20171206154544.oiavdgfrpryak23z@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============4997907063594526959==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 06, 2017 at 04:45:44PM +0100, Peter Zijlstra wrote:
> On Wed, Dec 06, 2017 at 11:31:30PM +0900, Namhyung Kim wrote:
> =

> > > There's also a race against put_callchain_buffers() there, consider:
> > > =

> > > =

> > > 	get_callchain_buffers()		put_callchain_buffers()
> > > 	  mutex_lock();
> > > 	  inc()
> > > 					  dec_and_test() // false
> > > =

> > > 	  dec() // 0
> > > =

> > > =

> > > And the buffers leak.
> > =

> > Hmm.. did you mean that get_callchain_buffers() returns an error?
> =

> Yes, get_callchain_buffers() fails, but while doing so it has a
> temporary increment on the count.
> =

> > AFAICS it cannot fail when it sees count > 1 (and callchain_cpus_
> > entries is allocated).  =

> =

> It can with your patch. We only test event_max_stack against the sysctl
> after incrementing.

So, are you ok with this?

Thanks,
Namhyung


diff --git a/kernel/events/callchain.c b/kernel/events/callchain.c
index 1b2be63c8528..ee0ba22d3993 100644
--- a/kernel/events/callchain.c
+++ b/kernel/events/callchain.c
@@ -137,8 +137,11 @@ int get_callchain_buffers(int event_max_stack)
 =

        err =3D alloc_callchain_buffers();
 exit:
-       if (err)
-               atomic_dec(&nr_callchain_events);
+       if (err) {
+               /* might race with put_callchain_buffers() */
+               if (atomic_dec_and_test(&nr_callchain_events))
+                       release_callchain_buffers();
+       }
 =

        mutex_unlock(&callchain_mutex);
=20

--===============4997907063594526959==--

