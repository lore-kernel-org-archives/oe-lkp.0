Content-Type: multipart/mixed; boundary="===============2882483407265212169=="
MIME-Version: 1.0
From: Tim Chen <tim.c.chen@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [sched/fair] ddb3b1126f: hackbench.throughput -25.9% regression
Date: Wed, 30 Mar 2022 16:48:05 -0700
Message-ID: <7aa67fedb4b6dc9126bc59ee993fa18d0e472475.camel@linux.intel.com>
In-Reply-To: <20220330094632.GB6999@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============2882483407265212169==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 2022-03-30 at 17:46 +0800, kernel test robot wrote:
> =

> Greeting,
> =

> FYI, we noticed a -25.9% regression of hackbench.throughput due to commit:
> =


Will try to check the regression seen.

Thanks.

Tim

> =

> =

> commit: =

>   d9ad181b93 ("sched/fair: Don't rely on ->exec_start for migration")
>   ddb3b1126f ("sched/fair: Simple runqueue order on migrate")
> =

> d9ad181b93f83b36 ddb3b1126fe93e8d6e059600488 =

> ---------------- --------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>      92566           -25.9%      68598 =C2=B1  2%  hackbench.throughput
>      85.50           +40.8%     120.35 =C2=B1  2%  hackbench.time.elapsed=
_time
>      85.50           +40.8%     120.35 =C2=B1  2%  hackbench.time.elapsed=
_time.max
>    9674391 =C2=B1  2%    +466.2%   54780205 =C2=B1  2%  hackbench.time.in=
voluntary_context_switches
>       1240           +42.6%       1768 =C2=B1  3%  hackbench.time.system_=
time
>      89.58           +20.4%     107.85        hackbench.time.user_time
>   36626407          +270.2%  1.356e+08 =C2=B1  2%  hackbench.time.volunta=
ry_context_switches
>    2500490 =C2=B1  3%     +78.2%    4456808 =C2=B1  3%  cpuidle..usage
>     118.45 =C2=B1  2%     +29.2%     153.02 =C2=B1  2%  uptime.boot
>=20

--===============2882483407265212169==--

