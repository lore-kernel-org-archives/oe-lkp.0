Content-Type: multipart/mixed; boundary="===============6932615568252829825=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: BUG: KASAN: slab-out-of-bounds in perf_callchain_user+0x494/0x530
Date: Wed, 06 Dec 2017 14:40:53 +0100
Message-ID: <20171206134053.xksmiam2ajmkpmhc@hirez.programming.kicks-ass.net>
In-Reply-To: <20171205081156.GB16663@sejong>
List-Id: <oe-lkp.lists.linux.dev>

--===============6932615568252829825==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 05, 2017 at 05:11:56PM +0900, Namhyung Kim wrote:
> From c12126c4ff9835f0899619db3ee7b4a3151ff2bb Mon Sep 17 00:00:00 2001
> From: Namhyung Kim <namhyung@kernel.org>
> Date: Tue, 5 Dec 2017 16:54:50 +0900
> Subject: [PATCH] perf/core: Fix overflow on perf_callchain_entry
> =

> The commit 97c79a38cd45 add a check whether per-event max stack is
> greater than the global max.  But it missed to do it for the first
> event.  So if the event had a stack depth greater than the global max,
> it could overflow the callchain entry list.
> =

> Reported-by: Fengguang Wu <fengguang.wu@intel.com>
> Fixes: 97c79a38cd45 ("perf core: Per event callchain limit")
> Signed-off-by: Namhyung Kim <namhyung@kernel.org>

Indeed, nice catch.

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Ingo, can you make this happen in perf/urgent ?

> ---
>  kernel/events/callchain.c | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)
> =

> diff --git a/kernel/events/callchain.c b/kernel/events/callchain.c
> index 1b2be63c8528..e449e23802eb 100644
> --- a/kernel/events/callchain.c
> +++ b/kernel/events/callchain.c
> @@ -119,19 +119,22 @@ int get_callchain_buffers(int event_max_stack)
>  		goto exit;
>  	}
>  =

> +	/*
> +	 * If requesting per event more than the global cap,
> +	 * return a different error to help userspace figure this out.
> +	 *
> +	 * And also do it here so that we have &callchain_mutex held.
> +	 */
> +	if (event_max_stack > sysctl_perf_event_max_stack) {
> +		err =3D -EOVERFLOW;
> +		goto exit;
> +	}
> +
>  	if (count > 1) {
>  		/* If the allocation failed, give up */
>  		if (!callchain_cpus_entries)
>  			err =3D -ENOMEM;
> -		/*
> -		 * If requesting per event more than the global cap,
> -		 * return a different error to help userspace figure
> -		 * this out.
> -		 *
> -		 * And also do it here so that we have &callchain_mutex held.
> -		 */
> -		if (event_max_stack > sysctl_perf_event_max_stack)
> -			err =3D -EOVERFLOW;
> +
>  		goto exit;
>  	}
>  =

> -- =

> 2.15.0
>=20

--===============6932615568252829825==--

