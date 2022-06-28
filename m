Content-Type: multipart/mixed; boundary="===============6446538204215919962=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [net] 4890b686f4: netperf.Throughput_Mbps -69.4% regression
Date: Tue, 28 Jun 2022 11:49:26 +0800
Message-ID: <20220628034926.GA69004@shbuild999.sh.intel.com>
In-Reply-To: <CANn89iLSWm-c4XE79rUsxzOp3VwXVDhOEPTQnWgeQ48UwM=u7Q@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6446538204215919962==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 27, 2022 at 06:25:59PM +0200, Eric Dumazet wrote:
> On Mon, Jun 27, 2022 at 4:48 PM Feng Tang <feng.tang@intel.com> wrote:
> >
> > Yes, I also analyzed the perf-profile data, and made some layout changes
> > which could recover the changes from 69% to 40%.
> >
> > 7c80b038d23e1f4c 4890b686f4088c90432149bd6de 332b589c49656a45881bca4ecc0
> > ---------------- --------------------------- ---------------------------
> >      15722           -69.5%       4792           -40.8%       9300     =
   netperf.Throughput_Mbps
> >
> =

> I simply did the following and got much better results.
> =

> But I am not sure if updates to ->usage are really needed that often...
> =

> =

> diff --git a/include/linux/page_counter.h b/include/linux/page_counter.h
> index 679591301994d316062f92b275efa2459a8349c9..e267be4ba849760117d9fd041=
e22c2a44658ab36
> 100644
> --- a/include/linux/page_counter.h
> +++ b/include/linux/page_counter.h
> @@ -3,12 +3,15 @@
>  #define _LINUX_PAGE_COUNTER_H
> =

>  #include <linux/atomic.h>
> +#include <linux/cache.h>
>  #include <linux/kernel.h>
>  #include <asm/page.h>
> =

>  struct page_counter {
> -       atomic_long_t usage;
> -       unsigned long min;
> +       /* contended cache line. */
> +       atomic_long_t usage ____cacheline_aligned_in_smp;
> +
> +       unsigned long min ____cacheline_aligned_in_smp;
>         unsigned long low;
>         unsigned long high;
>         unsigned long max;
> @@ -27,12 +30,6 @@ struct page_counter {
>         unsigned long watermark;
>         unsigned long failcnt;
> =

> -       /*
> -        * 'parent' is placed here to be far from 'usage' to reduce
> -        * cache false sharing, as 'usage' is written mostly while
> -        * parent is frequently read for cgroup's hierarchical
> -        * counting nature.
> -        */
>         struct page_counter *parent;
>  };

I just tested it, it does perform better (the 4th is with your patch),
some perf-profile data is also listed.

 7c80b038d23e1f4c 4890b686f4088c90432149bd6de 332b589c49656a45881bca4ecc0 e=
719635902654380b23ffce908d =

---------------- --------------------------- --------------------------- --=
------------------------- =

     15722           -69.5%       4792           -40.8%       9300         =
  -27.9%      11341        netperf.Throughput_Mbps

      0.00            +0.3        0.26 =C2=B1  5%      +0.5        0.51    =
        +1.3        1.27 =C2=B1  2%pp.self.__sk_mem_raise_allocated
      0.00            +0.3        0.32 =C2=B1 15%      +1.7        1.74 =C2=
=B1  2%      +0.4        0.40 =C2=B1  2%  pp.self.propagate_protected_usage
      0.00            +0.8        0.82 =C2=B1  7%      +0.9        0.90    =
        +0.8        0.84        pp.self.__mod_memcg_state
      0.00            +1.2        1.24 =C2=B1  4%      +1.0        1.01    =
        +1.4        1.44        pp.self.try_charge_memcg
      0.00            +2.1        2.06            +2.1        2.13         =
   +2.1        2.11        pp.self.page_counter_uncharge
      0.00            +2.1        2.14 =C2=B1  4%      +2.7        2.71    =
        +2.6        2.60 =C2=B1  2%  pp.self.page_counter_try_charge
      1.12 =C2=B1  4%      +3.1        4.24            +1.1        2.22    =
        +1.4        2.51        pp.self.native_queued_spin_lock_slowpath
      0.28 =C2=B1  9%      +3.8        4.06 =C2=B1  4%      +0.2        0.4=
8            +0.4        0.68        pp.self.sctp_eat_data
      0.00            +8.2        8.23            +0.8        0.83         =
   +1.3        1.26        pp.self.__sk_mem_reduce_allocated

And the size of 'mem_cgroup' is increased from 4224 Bytes to 4608.

Another info is the perf hotspos are slightly different between
tcp and sctp test cases.

Thanks,
Feng
--===============6446538204215919962==--

