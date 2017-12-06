Content-Type: multipart/mixed; boundary="===============7156047240829347753=="
MIME-Version: 1.0
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: lkp@lists.01.org
Subject: Re: BUG: KASAN: slab-out-of-bounds in perf_callchain_user+0x494/0x530
Date: Wed, 06 Dec 2017 11:12:13 -0300
Message-ID: <20171206141213.GD12234@kernel.org>
In-Reply-To: <20171206134706.ahlr6ygnhtu2ik4s@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============7156047240829347753==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Em Wed, Dec 06, 2017 at 02:47:06PM +0100, Peter Zijlstra escreveu:
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

Yeah, this code is complicated, and there are several csets to consider,
by Fr=C3=A9d=C3=A9ric that may help to understando why the code ended up li=
ke
that, I started from git blame going first to
9251f904f95175b4a1d8cbc0449e748f9edd7629, where the test seemed to make
sense, to then go back, but still reading this...

commit fc3b86d673e41ac66b4ba5b75a90c2fcafb90089
Author: Frederic Weisbecker <fweisbec@gmail.com>
Date:   Fri Aug 2 18:29:54 2013 +0200

    perf: Roll back callchain buffer refcount under the callchain mutex

commit 90983b16078ab0fdc58f0dab3e8e3da79c9579a2
Author: Frederic Weisbecker <fweisbec@gmail.com>
Date:   Tue Jul 23 02:31:00 2013 +0200

    perf: Sanitize get_callchain_buffer()

commit fd45c15f13e754f3c106427e857310f3e0813951
Author: Namhyung Kim <namhyung.kim@lge.com>
Date:   Fri Jan 20 10:12:45 2012 +0900

    perf: Don't call release_callchain_buffers() if allocation fails

commit 9251f904f95175b4a1d8cbc0449e748f9edd7629
Author: Borislav Petkov <borislav.petkov@amd.com>
Date:   Sun Oct 16 17:15:04 2011 +0200

    perf: Carve out callchain functionality


--===============7156047240829347753==--

