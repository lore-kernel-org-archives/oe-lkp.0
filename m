Content-Type: multipart/mixed; boundary="===============6445957988231793301=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: BUG: KASAN: slab-out-of-bounds in perf_callchain_user+0x494/0x530
Date: Wed, 06 Dec 2017 17:39:51 +0100
Message-ID: <20171206163951.fyden6m4vamkjbqi@hirez.programming.kicks-ass.net>
In-Reply-To: <20171206154957.GB3367@danjae.aot.lge.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6445957988231793301==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 07, 2017 at 12:49:57AM +0900, Namhyung Kim wrote:

> So, are you ok with this?

yeah, that should work.

> diff --git a/kernel/events/callchain.c b/kernel/events/callchain.c
> index 1b2be63c8528..ee0ba22d3993 100644
> --- a/kernel/events/callchain.c
> +++ b/kernel/events/callchain.c
> @@ -137,8 +137,11 @@ int get_callchain_buffers(int event_max_stack)
>  =

>         err =3D alloc_callchain_buffers();
>  exit:
> -       if (err)
> -               atomic_dec(&nr_callchain_events);
> +       if (err) {
> +               /* might race with put_callchain_buffers() */
> +               if (atomic_dec_and_test(&nr_callchain_events))
> +                       release_callchain_buffers();
> +       }
>  =

>         mutex_unlock(&callchain_mutex);
> =20

--===============6445957988231793301==--

