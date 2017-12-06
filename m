Content-Type: multipart/mixed; boundary="===============2169879841183158403=="
MIME-Version: 1.0
From: Namhyung Kim <namhyung@kernel.org>
To: lkp@lists.01.org
Subject: Re: BUG: KASAN: slab-out-of-bounds in perf_callchain_user+0x494/0x530
Date: Wed, 06 Dec 2017 23:31:30 +0900
Message-ID: <20171206143130.GA3367@danjae.aot.lge.com>
In-Reply-To: <20171206134706.ahlr6ygnhtu2ik4s@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============2169879841183158403==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On Wed, Dec 06, 2017 at 02:47:06PM +0100, Peter Zijlstra wrote:
> On Tue, Dec 05, 2017 at 11:47:18PM +0900, Namhyung Kim wrote:
> > Sure, I mean the following code:
> > =

> > 	mutex_lock(&callchain_mutex);
> > =

> > 	count =3D atomic_inc_return(&nr_callchain_events);
> > 	if (WARN_ON_ONCE(count < 1)) {
> > 		err =3D -EINVAL;
> > 		goto exit;
> > 	}
> > =

> > 	if (count > 1) {
> > 		/* If the allocation failed, give up */
> > 		if (!callchain_cpus_entries)
> > 			err =3D -ENOMEM;
> > =

> > 		goto exit;
> > 	}
> > =

> > 	err =3D alloc_callchain_buffers();
> > exit:
> > 	if (err)
> > 		atomic_dec(&nr_callchain_events);
> > =

> > 	mutex_unlock(&callchain_mutex);
> > =

> > =

> > The callchain_cpus_entries is allocated in alloc_callchain_buffers()
> > only when the count is 1.  But if it failed to allocate, it decrease
> > the count so next event would try to allocate it again.  Thus it seems
> > not possible to see the callchain_cpus_entries being NULL in the
> > 'if (count > 1)' block.  If you want to make next event give up, it'd
> > need to take an additional count IMHO.
> =

> There's also a race against put_callchain_buffers() there, consider:
> =

> =

> 	get_callchain_buffers()		put_callchain_buffers()
> 	  mutex_lock();
> 	  inc()
> 					  dec_and_test() // false
> =

> 	  dec() // 0
> =

> =

> And the buffers leak.

Hmm.. did you mean that get_callchain_buffers() returns an error?
AFAICS it cannot fail when it sees count > 1 (and callchain_cpus_
entries is allocated).  So I think it won't decrease the count and
should be fine.

Thanks,
Namhyung

--===============2169879841183158403==--

