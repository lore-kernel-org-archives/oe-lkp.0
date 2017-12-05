Content-Type: multipart/mixed; boundary="===============2825944317041045036=="
MIME-Version: 1.0
From: Namhyung Kim <namhyung@kernel.org>
To: lkp@lists.01.org
Subject: Re: BUG: KASAN: slab-out-of-bounds in perf_callchain_user+0x494/0x530
Date: Tue, 05 Dec 2017 23:47:18 +0900
Message-ID: <20171205144718.GA27916@danjae.aot.lge.com>
In-Reply-To: <20171205133740.GA28405@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============2825944317041045036==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Arnaldo,

On Tue, Dec 05, 2017 at 10:37:40AM -0300, Arnaldo Carvalho de Melo wrote:
> Em Tue, Dec 05, 2017 at 05:11:56PM +0900, Namhyung Kim escreveu:
> > Also I'm not sure that the allocation failure check would work
> > correctly since it decrements nr_callchain_events when it fails.
> =

> Can you elaborate a bit more?

Sure, I mean the following code:

	mutex_lock(&callchain_mutex);

	count =3D atomic_inc_return(&nr_callchain_events);
	if (WARN_ON_ONCE(count < 1)) {
		err =3D -EINVAL;
		goto exit;
	}

	if (count > 1) {
		/* If the allocation failed, give up */
		if (!callchain_cpus_entries)
			err =3D -ENOMEM;

		goto exit;
	}

	err =3D alloc_callchain_buffers();
exit:
	if (err)
		atomic_dec(&nr_callchain_events);

	mutex_unlock(&callchain_mutex);


The callchain_cpus_entries is allocated in alloc_callchain_buffers()
only when the count is 1.  But if it failed to allocate, it decrease
the count so next event would try to allocate it again.  Thus it seems
not possible to see the callchain_cpus_entries being NULL in the
'if (count > 1)' block.  If you want to make next event give up, it'd
need to take an additional count IMHO.

Thanks,
Namhyung

--===============2825944317041045036==--

