Content-Type: multipart/mixed; boundary="===============7138355421725115713=="
MIME-Version: 1.0
From: Shakeel Butt <shakeelb@google.com>
To: lkp@lists.01.org
Subject: Re: [net] 4890b686f4: netperf.Throughput_Mbps -69.4% regression
Date: Mon, 27 Jun 2022 09:48:01 -0700
Message-ID: <CALvZod60OHC4iQnyBd16evCHXa_8ucpHiRnm9iNErQeUOycGZw@mail.gmail.com>
In-Reply-To: <CANn89iLSWm-c4XE79rUsxzOp3VwXVDhOEPTQnWgeQ48UwM=u7Q@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7138355421725115713==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 27, 2022 at 9:26 AM Eric Dumazet <edumazet@google.com> wrote:
>
[...]
> >
>
> I simply did the following and got much better results.
>
> But I am not sure if updates to ->usage are really needed that often...

I suspect we need to improve the per-cpu memcg stock usage here. Were
the updates mostly from uncharge path or charge path or that's
irrelevant?

I think doing full drain (i.e. drain_stock()) within __refill_stock()
when the local cache is larger than MEMCG_CHARGE_BATCH is not best.
Rather we should always keep at least MEMCG_CHARGE_BATCH for such
scenarios.

>
>
> diff --git a/include/linux/page_counter.h b/include/linux/page_counter.h
> index 679591301994d316062f92b275efa2459a8349c9..e267be4ba849760117d9fd041=
e22c2a44658ab36
> 100644
> --- a/include/linux/page_counter.h
> +++ b/include/linux/page_counter.h
> @@ -3,12 +3,15 @@
>  #define _LINUX_PAGE_COUNTER_H
>
>  #include <linux/atomic.h>
> +#include <linux/cache.h>
>  #include <linux/kernel.h>
>  #include <asm/page.h>
>
>  struct page_counter {
> -       atomic_long_t usage;
> -       unsigned long min;
> +       /* contended cache line. */
> +       atomic_long_t usage ____cacheline_aligned_in_smp;
> +
> +       unsigned long min ____cacheline_aligned_in_smp;

Do we need to align 'min' too?

>         unsigned long low;
>         unsigned long high;
>         unsigned long max;
> @@ -27,12 +30,6 @@ struct page_counter {
>         unsigned long watermark;
>         unsigned long failcnt;
>
> -       /*
> -        * 'parent' is placed here to be far from 'usage' to reduce
> -        * cache false sharing, as 'usage' is written mostly while
> -        * parent is frequently read for cgroup's hierarchical
> -        * counting nature.
> -        */
>         struct page_counter *parent;
>  };
>
>
>
--===============7138355421725115713==--

