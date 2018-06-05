Content-Type: multipart/mixed; boundary="===============5277085158296345941=="
MIME-Version: 1.0
From: Dave Chinner <david@fromorbit.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [xfs] b027d4c97b: fio.latency_2ms% +7.1% regression
Date: Wed, 06 Jun 2018 08:38:13 +1000
Message-ID: <20180605223813.GI10363@dastard>
In-Reply-To: <20180605071657.GP16472@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============5277085158296345941==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 05, 2018 at 03:16:57PM +0800, kernel test robot wrote:
> =

> Greeting,
> =

> FYI, we noticed a +7.1%% regression of fio.latency_2ms% due to commit:
> =

> =

> commit: b027d4c97b9675c2ad75dec94be4e46dceb3ec74 ("xfs: don't retry xfs_b=
uf_find on XBF_TRYLOCK failure")
> https://git.kernel.org/cgit/fs/xfs/xfs-linux.git xfs-4.18-merge
....
> 8925a3dc4771004b b027d4c97b9675c2ad75dec94b =

> ---------------- -------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>      46.56 =C2=B1  3%      +7.1       53.61        fio.latency_2ms%
>       8.19            +0.2        8.40        fio.latency_100ms%
>       0.74 =C2=B1  3%      -0.1        0.68 =C2=B1  6%  fio.latency_250ms%
>      25.20 =C2=B1  6%      -7.3       17.86 =C2=B1  6%  fio.latency_4ms%
>       0.46 =C2=B1  9%      +0.2        0.69 =C2=B1 13%  fio.latency_750us%

This is not a regression. The number of IOs in the 4ms IO latency
bin has reduced by 7%, and inumber in the 2ms IO latency bin has
increased by 7%. IOWs, there's a measurable improvement in IO
latency as a result of those patches, not a regression.

Cheers,

Dave.
-- =

Dave Chinner
david(a)fromorbit.com

--===============5277085158296345941==--

