Content-Type: multipart/mixed; boundary="===============5980185501205955614=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: BUG: KASAN: slab-out-of-bounds in perf_callchain_user+0x494/0x530
Date: Wed, 06 Dec 2017 14:47:06 +0100
Message-ID: <20171206134706.ahlr6ygnhtu2ik4s@hirez.programming.kicks-ass.net>
In-Reply-To: <20171205144718.GA27916@danjae.aot.lge.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5980185501205955614==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 05, 2017 at 11:47:18PM +0900, Namhyung Kim wrote:
> Sure, I mean the following code:
> =

> 	mutex_lock(&callchain_mutex);
> =

> 	count =3D atomic_inc_return(&nr_callchain_events);
> 	if (WARN_ON_ONCE(count < 1)) {
> 		err =3D -EINVAL;
> 		goto exit;
> 	}
> =

> 	if (count > 1) {
> 		/* If the allocation failed, give up */
> 		if (!callchain_cpus_entries)
> 			err =3D -ENOMEM;
> =

> 		goto exit;
> 	}
> =

> 	err =3D alloc_callchain_buffers();
> exit:
> 	if (err)
> 		atomic_dec(&nr_callchain_events);
> =

> 	mutex_unlock(&callchain_mutex);
> =

> =

> The callchain_cpus_entries is allocated in alloc_callchain_buffers()
> only when the count is 1.  But if it failed to allocate, it decrease
> the count so next event would try to allocate it again.  Thus it seems
> not possible to see the callchain_cpus_entries being NULL in the
> 'if (count > 1)' block.  If you want to make next event give up, it'd
> need to take an additional count IMHO.

There's also a race against put_callchain_buffers() there, consider:


	get_callchain_buffers()		put_callchain_buffers()
	  mutex_lock();
	  inc()
					  dec_and_test() // false

	  dec() // 0


And the buffers leak.



--===============5980185501205955614==--

