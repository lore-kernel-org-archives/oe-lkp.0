Content-Type: multipart/mixed; boundary="===============1241276110336181982=="
MIME-Version: 1.0
From: Theodore Ts'o <tytso@mit.edu>
To: lkp@lists.01.org
Subject: Re: [jbd2] cc97f1a7c7e: +87.2% fsmark.files_per_sec
Date: Thu, 06 Nov 2014 10:43:56 -0500
Message-ID: <20141106154356.GA2928@thunk.org>
In-Reply-To: <20141106072314.GA16008@yliu-dev.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1241276110336181982==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Kudo's to Jan and Yuanhan!

Cheers,

					- Ted

On Thu, Nov 06, 2014 at 03:23:14PM +0800, LKP wrote:
> FYI, we noticed the below good changes on
> =

> commit cc97f1a7c7eed970e674b84be0e68f479c80228d ("jbd2: avoid pointless s=
canning of checkpoint lists")
> =

> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  testbox/testcase/testparams
> ----------------  --------------------------  ---------------------------
>          %stddev     %change         %stddev
>              \          |                \  =

>       6026 =C2=B1  1%     +87.2%      11283 =C2=B1  2%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>       6026           +87.2%      11283        GEO-MEAN fsmark.files_per_s=
ec
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>   86294457 =C2=B1  7%     -99.0%     822113 =C2=B1 25%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>   86294457           -99.0%     822113        GEO-MEAN cpuidle.C1E-IVT.ti=
me
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     795159 =C2=B1  5%     -99.9%        931 =C2=B1 16%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     795159           -99.9%        931        GEO-MEAN cpuidle.C1E-IVT.us=
age
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      13012 =C2=B1 36%     -68.0%       4169 =C2=B1 45%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      13012           -68.0%       4168        GEO-MEAN sched_debug.cpu#15=
.sched_goidle
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      26135 =C2=B1 36%     -67.9%       8395 =C2=B1 45%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      26135           -67.9%       8395        GEO-MEAN sched_debug.cpu#15=
.nr_switches
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>        890 =C2=B1 36%    +154.2%       2263 =C2=B1 29%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>        890          +154.2%       2263        GEO-MEAN sched_debug.cfs_rq=
[39]:/.tg_load_contrib
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      13688 =C2=B1 44%     -63.9%       4936 =C2=B1 28%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      13688           -63.9%       4936        GEO-MEAN sched_debug.cpu#14=
.ttwu_count
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>       1792 =C2=B1 24%     -64.5%        636 =C2=B1 37%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>       1792           -64.5%        636        GEO-MEAN cpuidle.C3-IVT.usa=
ge
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>       2118 =C2=B1 43%    +129.9%       4869 =C2=B1 23%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>       2118          +129.9%       4869        GEO-MEAN sched_debug.cfs_rq=
[25]:/.blocked_load_avg
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     244970 =C2=B1  2%     -52.1%     117231 =C2=B1  1%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     244970           -52.1%     117231        GEO-MEAN cpuidle.C6-IVT.usa=
ge
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>       2175 =C2=B1 41%    +126.3%       4923 =C2=B1 24%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>       2175          +126.3%       4922        GEO-MEAN sched_debug.cfs_rq=
[25]:/.tg_load_contrib
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      14419 =C2=B1 28%     -58.4%       5996 =C2=B1 17%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      14419           -58.4%       5996        GEO-MEAN sched_debug.cpu#14=
.sched_goidle
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      32555 =C2=B1 25%     -54.4%      14859 =C2=B1 17%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      32555           -54.4%      14859        GEO-MEAN sched_debug.cpu#14=
.nr_switches
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     107876 =C2=B1 13%     +72.7%     186283 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     107876           +72.7%     186283        GEO-MEAN proc-vmstat.nr_dir=
ty
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>  7.587e+09 =C2=B1  1%     -46.5%  4.059e+09 =C2=B1  2%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>  7.587e+09           -46.5%  4.059e+09        GEO-MEAN cpuidle.C6-IVT.time
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     432452 =C2=B1 13%     +72.2%     744607 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     432452           +72.2%     744607        GEO-MEAN meminfo.Dirty
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>        107 =C2=B1 44%     -49.7%         54 =C2=B1  6%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>        107           -49.7%         54        GEO-MEAN sched_debug.cpu#33=
.ttwu_count
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>    1190529 =C2=B1  3%     +68.4%    2004907 =C2=B1  0%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>    1190529           +68.4%    2004907        GEO-MEAN cpuidle.C1-IVT.usa=
ge
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>        190 =C2=B1  0%     -39.3%        115 =C2=B1  2%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>        190           -39.3%        115        GEO-MEAN uptime.boot
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>       8735 =C2=B1  1%     -39.5%       5285 =C2=B1  2%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>       8735           -39.5%       5285        GEO-MEAN uptime.idle
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     106392 =C2=B1  1%     -32.4%      71966 =C2=B1 13%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     106392           -32.4%      71966        GEO-MEAN softirqs.RCU
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     107085 =C2=B1  0%     -35.3%      69240 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     107085           -35.3%      69240        GEO-MEAN sched_debug.cpu#3.=
clock
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     107086 =C2=B1  0%     -35.3%      69240 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     107086           -35.3%      69240        GEO-MEAN sched_debug.cpu#2.=
clock
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     107086 =C2=B1  0%     -35.3%      69246 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     107086           -35.3%      69246        GEO-MEAN sched_debug.cpu#10=
.clock
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     107088 =C2=B1  0%     -35.3%      69244 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     107088           -35.3%      69244        GEO-MEAN sched_debug.cpu#8.=
clock
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     107088 =C2=B1  0%     -35.3%      69243 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     107088           -35.3%      69243        GEO-MEAN sched_debug.cpu#7.=
clock
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     107087 =C2=B1  0%     -35.3%      69246 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     107087           -35.3%      69246        GEO-MEAN sched_debug.cpu#9.=
clock
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     107083 =C2=B1  0%     -35.3%      69244 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     107083           -35.3%      69244        GEO-MEAN sched_debug.cpu#24=
.clock
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     107092 =C2=B1  0%     -35.3%      69247 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     107092           -35.3%      69247        GEO-MEAN sched_debug.cpu#16=
.clock
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     107073 =C2=B1  0%     -35.3%      69237 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     107073           -35.3%      69237        GEO-MEAN sched_debug.cpu#1.=
clock
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     107091 =C2=B1  0%     -35.3%      69245 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     107091           -35.3%      69245        GEO-MEAN sched_debug.cpu#28=
.clock
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     107090 =C2=B1  0%     -35.3%      69246 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     107090           -35.3%      69246        GEO-MEAN sched_debug.cpu#27=
.clock
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     107093 =C2=B1  0%     -35.3%      69245 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     107093           -35.3%      69245        GEO-MEAN sched_debug.cpu#17=
.clock
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     107086 =C2=B1  0%     -35.3%      69245 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     107086           -35.3%      69245        GEO-MEAN sched_debug.cpu#6.=
clock
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     107087 =C2=B1  0%     -35.3%      69246 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     107087           -35.3%      69246        GEO-MEAN sched_debug.cpu#25=
.clock
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     107091 =C2=B1  0%     -35.3%      69246 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     107091           -35.3%      69246        GEO-MEAN sched_debug.cpu#38=
.clock
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     107092 =C2=B1  0%     -35.3%      69246 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     107092           -35.3%      69246        GEO-MEAN sched_debug.cpu#41=
.clock
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     107091 =C2=B1  0%     -35.3%      69246 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     107091           -35.3%      69246        GEO-MEAN sched_debug.cpu#36=
.clock
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     107093 =C2=B1  0%     -35.3%      69246 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     107093           -35.3%      69246        GEO-MEAN sched_debug.cpu#43=
.clock
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     107093 =C2=B1  0%     -35.3%      69246 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     107093           -35.3%      69246        GEO-MEAN sched_debug.cpu#44=
.clock
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     107093 =C2=B1  0%     -35.3%      69246 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     107093           -35.3%      69246        GEO-MEAN sched_debug.cpu#45=
.clock
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     107093 =C2=B1  0%     -35.3%      69246 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     107093           -35.3%      69246        GEO-MEAN sched_debug.cpu#46=
.clock
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     107093 =C2=B1  0%     -35.3%      69246 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     107093           -35.3%      69246        GEO-MEAN sched_debug.cpu#47=
.clock
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     107084 =C2=B1  0%     -35.3%      69249 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     107084           -35.3%      69249        GEO-MEAN sched_debug.cpu#26=
.clock
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     107092 =C2=B1  0%     -35.3%      69246 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     107092           -35.3%      69246        GEO-MEAN sched_debug.cpu#30=
.clock
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     107089 =C2=B1  0%     -35.3%      69246 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     107089           -35.3%      69246        GEO-MEAN sched_debug.cpu#29=
.clock
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     107093 =C2=B1  0%     -35.3%      69245 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     107093           -35.3%      69245        GEO-MEAN sched_debug.cpu#31=
.clock
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     107090 =C2=B1  0%     -35.3%      69245 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     107090           -35.3%      69245        GEO-MEAN sched_debug.cpu#32=
.clock
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     107090 =C2=B1  0%     -35.3%      69246 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     107090           -35.3%      69246        GEO-MEAN sched_debug.cpu#33=
.clock
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     107090 =C2=B1  0%     -35.3%      69246 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     107090           -35.3%      69246        GEO-MEAN sched_debug.cpu#34=
.clock
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     107095 =C2=B1  0%     -35.3%      69246 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     107095           -35.3%      69246        GEO-MEAN sched_debug.cpu#42=
.clock
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     107090 =C2=B1  0%     -35.3%      69246 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     107090           -35.3%      69246        GEO-MEAN sched_debug.cpu#35=
.clock
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     107087 =C2=B1  0%     -35.3%      69246 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     107087           -35.3%      69246        GEO-MEAN sched_debug.cpu#13=
.clock
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     107093 =C2=B1  0%     -35.3%      69250 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     107093           -35.3%      69250        GEO-MEAN sched_debug.cpu#37=
.clock
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     107088 =C2=B1  0%     -35.3%      69247 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     107088           -35.3%      69247        GEO-MEAN sched_debug.cpu#12=
.clock
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     107091 =C2=B1  0%     -35.3%      69245 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     107091           -35.3%      69245        GEO-MEAN sched_debug.cpu#23=
.clock
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     107090 =C2=B1  0%     -35.3%      69249 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     107090           -35.3%      69249        GEO-MEAN sched_debug.cpu#19=
.clock
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     107083 =C2=B1  0%     -35.3%      69249 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     107083           -35.3%      69249        GEO-MEAN sched_debug.cpu#4.=
clock
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     107092 =C2=B1  0%     -35.3%      69247 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     107092           -35.3%      69247        GEO-MEAN sched_debug.cpu#20=
.clock
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     107088 =C2=B1  0%     -35.3%      69249 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     107088           -35.3%      69249        GEO-MEAN sched_debug.cpu#5.=
clock
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     107084 =C2=B1  0%     -35.3%      69249 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     107084           -35.3%      69249        GEO-MEAN sched_debug.cpu#11=
.clock
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     107097 =C2=B1  0%     -35.3%      69251 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     107097           -35.3%      69251        GEO-MEAN sched_debug.sched_=
clk
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     107097 =C2=B1  0%     -35.3%      69251 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     107097           -35.3%      69251        GEO-MEAN sched_debug.cpu_clk
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     107089 =C2=B1  0%     -35.3%      69248 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     107089           -35.3%      69248        GEO-MEAN sched_debug.cpu#21=
.clock
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     107094 =C2=B1  0%     -35.3%      69252 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     107094           -35.3%      69252        GEO-MEAN sched_debug.cpu#15=
.clock
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     107089 =C2=B1  0%     -35.3%      69250 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     107089           -35.3%      69250        GEO-MEAN sched_debug.cpu#18=
.clock
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     107095 =C2=B1  0%     -35.3%      69250 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     107095           -35.3%      69250        GEO-MEAN sched_debug.cpu#40=
.clock
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     107087 =C2=B1  0%     -35.3%      69252 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     107087           -35.3%      69252        GEO-MEAN sched_debug.cpu#22=
.clock
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     107093 =C2=B1  0%     -35.3%      69253 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     107093           -35.3%      69253        GEO-MEAN sched_debug.cpu#39=
.clock
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     107065 =C2=B1  0%     -35.3%      69234 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     107065           -35.3%      69234        GEO-MEAN sched_debug.cpu#0.=
clock
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     107094 =C2=B1  0%     -35.3%      69253 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     107094           -35.3%      69253        GEO-MEAN sched_debug.cpu#14=
.clock
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>        381 =C2=B1  5%     +81.8%        692 =C2=B1 31%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>        381           +81.8%        692        GEO-MEAN sched_debug.cfs_rq=
[26]:/.tg_load_contrib
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>        379 =C2=B1  6%     +80.3%        684 =C2=B1 32%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>        379           +80.3%        684        GEO-MEAN sched_debug.cfs_rq=
[26]:/.blocked_load_avg
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      11427 =C2=B1  3%     +57.5%      18000 =C2=B1  6%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      11427           +57.5%      18000        GEO-MEAN sched_debug.cfs_rq=
[44]:/.tg_load_avg
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      11405 =C2=B1  3%     +58.0%      18019 =C2=B1  6%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      11405           +58.0%      18018        GEO-MEAN sched_debug.cfs_rq=
[45]:/.tg_load_avg
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     104000 =C2=B1  0%     -35.2%      67385 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     104000           -35.2%      67385        GEO-MEAN sched_debug.ktime
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      11379 =C2=B1  3%     +58.2%      18001 =C2=B1  6%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      11379           +58.2%      18000        GEO-MEAN sched_debug.cfs_rq=
[46]:/.tg_load_avg
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      11388 =C2=B1  3%     +58.3%      18023 =C2=B1  6%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      11388           +58.3%      18023        GEO-MEAN sched_debug.cfs_rq=
[47]:/.tg_load_avg
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      11395 =C2=B1  3%     +55.7%      17744 =C2=B1  7%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      11395           +55.7%      17744        GEO-MEAN sched_debug.cfs_rq=
[31]:/.tg_load_avg
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      11382 =C2=B1  4%     +56.6%      17829 =C2=B1  7%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      11382           +56.6%      17829        GEO-MEAN sched_debug.cfs_rq=
[36]:/.tg_load_avg
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      11379 =C2=B1  3%     +57.4%      17915 =C2=B1  6%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      11379           +57.4%      17915        GEO-MEAN sched_debug.cfs_rq=
[39]:/.tg_load_avg
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      11415 =C2=B1  3%     +56.2%      17835 =C2=B1  7%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      11415           +56.2%      17835        GEO-MEAN sched_debug.cfs_rq=
[35]:/.tg_load_avg
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      11408 =C2=B1  3%     +55.5%      17736 =C2=B1  7%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      11407           +55.5%      17736        GEO-MEAN sched_debug.cfs_rq=
[33]:/.tg_load_avg
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      11401 =C2=B1  3%     +57.4%      17941 =C2=B1  6%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      11401           +57.4%      17941        GEO-MEAN sched_debug.cfs_rq=
[42]:/.tg_load_avg
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      11402 =C2=B1  3%     +57.4%      17942 =C2=B1  7%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      11402           +57.4%      17942        GEO-MEAN sched_debug.cfs_rq=
[43]:/.tg_load_avg
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      11398 =C2=B1  3%     +57.3%      17932 =C2=B1  6%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      11398           +57.3%      17932        GEO-MEAN sched_debug.cfs_rq=
[41]:/.tg_load_avg
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      11412 =C2=B1  3%     +55.2%      17716 =C2=B1  7%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      11412           +55.2%      17716        GEO-MEAN sched_debug.cfs_rq=
[32]:/.tg_load_avg
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      11384 =C2=B1  3%     +57.1%      17882 =C2=B1  6%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      11383           +57.1%      17882        GEO-MEAN sched_debug.cfs_rq=
[38]:/.tg_load_avg
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      11408 =C2=B1  3%     +57.1%      17917 =C2=B1  6%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      11408           +57.1%      17917        GEO-MEAN sched_debug.cfs_rq=
[40]:/.tg_load_avg
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      11419 =C2=B1  3%     +55.6%      17770 =C2=B1  7%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      11419           +55.6%      17770        GEO-MEAN sched_debug.cfs_rq=
[34]:/.tg_load_avg
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      11369 =C2=B1  3%     +55.4%      17669 =C2=B1  7%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      11369           +55.4%      17668        GEO-MEAN sched_debug.cfs_rq=
[29]:/.tg_load_avg
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      11391 =C2=B1  3%     +55.5%      17711 =C2=B1  7%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      11391           +55.5%      17711        GEO-MEAN sched_debug.cfs_rq=
[30]:/.tg_load_avg
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      11373 =C2=B1  3%     +55.1%      17644 =C2=B1  7%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      11373           +55.1%      17644        GEO-MEAN sched_debug.cfs_rq=
[28]:/.tg_load_avg
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      11407 =C2=B1  4%     +56.4%      17839 =C2=B1  7%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      11407           +56.4%      17839        GEO-MEAN sched_debug.cfs_rq=
[37]:/.tg_load_avg
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      11385 =C2=B1  3%     +54.9%      17638 =C2=B1  7%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      11385           +54.9%      17638        GEO-MEAN sched_debug.cfs_rq=
[16]:/.tg_load_avg
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      11389 =C2=B1  4%     +56.2%      17790 =C2=B1  7%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      11389           +56.2%      17790        GEO-MEAN sched_debug.cfs_rq=
[24]:/.tg_load_avg
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      11388 =C2=B1  4%     +56.3%      17800 =C2=B1  7%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      11388           +56.3%      17800        GEO-MEAN sched_debug.cfs_rq=
[23]:/.tg_load_avg
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      11399 =C2=B1  4%     +56.0%      17782 =C2=B1  7%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      11398           +56.0%      17782        GEO-MEAN sched_debug.cfs_rq=
[25]:/.tg_load_avg
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      11339 =C2=B1  3%     +55.9%      17678 =C2=B1  7%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      11338           +55.9%      17678        GEO-MEAN sched_debug.cfs_rq=
[18]:/.tg_load_avg
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      11391 =C2=B1  4%     +55.7%      17742 =C2=B1  7%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      11391           +55.7%      17742        GEO-MEAN sched_debug.cfs_rq=
[26]:/.tg_load_avg
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      11335 =C2=B1  4%     +56.0%      17682 =C2=B1  7%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      11334           +56.0%      17682        GEO-MEAN sched_debug.cfs_rq=
[19]:/.tg_load_avg
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      11330 =C2=B1  4%     +56.0%      17670 =C2=B1  7%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      11329           +56.0%      17670        GEO-MEAN sched_debug.cfs_rq=
[20]:/.tg_load_avg
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      11361 =C2=B1  4%     +56.7%      17803 =C2=B1  7%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      11361           +56.7%      17802        GEO-MEAN sched_debug.cfs_rq=
[21]:/.tg_load_avg
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      11374 =C2=B1  4%     +56.5%      17803 =C2=B1  7%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      11373           +56.5%      17803        GEO-MEAN sched_debug.cfs_rq=
[22]:/.tg_load_avg
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      11329 =C2=B1  3%     +55.8%      17652 =C2=B1  7%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      11329           +55.8%      17652        GEO-MEAN sched_debug.cfs_rq=
[17]:/.tg_load_avg
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      11364 =C2=B1  4%     +54.3%      17540 =C2=B1  7%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      11364           +54.3%      17540        GEO-MEAN sched_debug.cfs_rq=
[14]:/.tg_load_avg
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      11378 =C2=B1  3%     +54.7%      17597 =C2=B1  7%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      11378           +54.7%      17597        GEO-MEAN sched_debug.cfs_rq=
[15]:/.tg_load_avg
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      11344 =C2=B1  4%     +54.7%      17552 =C2=B1  7%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      11344           +54.7%      17552        GEO-MEAN sched_debug.cfs_rq=
[13]:/.tg_load_avg
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      11407 =C2=B1  3%     +54.5%      17623 =C2=B1  7%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      11407           +54.5%      17623        GEO-MEAN sched_debug.cfs_rq=
[27]:/.tg_load_avg
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      11350 =C2=B1  4%     +55.1%      17608 =C2=B1  7%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      11350           +55.1%      17608        GEO-MEAN sched_debug.cfs_rq=
[12]:/.tg_load_avg
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      11375 =C2=B1  4%     +53.8%      17492 =C2=B1  7%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      11375           +53.8%      17492        GEO-MEAN sched_debug.cfs_rq=
[8]:/.tg_load_avg
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      11369 =C2=B1  4%     +54.2%      17536 =C2=B1  7%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      11368           +54.2%      17536        GEO-MEAN sched_debug.cfs_rq=
[11]:/.tg_load_avg
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      11408 =C2=B1  5%     +53.6%      17523 =C2=B1  7%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      11407           +53.6%      17523        GEO-MEAN sched_debug.cfs_rq=
[7]:/.tg_load_avg
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      11492 =C2=B1  4%     +54.1%      17704 =C2=B1  7%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      11492           +54.1%      17704        GEO-MEAN sched_debug.cfs_rq=
[5]:/.tg_load_avg
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      11550 =C2=B1  4%     +56.0%      18022 =C2=B1  8%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      11550           +56.0%      18022        GEO-MEAN sched_debug.cfs_rq=
[4]:/.tg_load_avg
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      11366 =C2=B1  4%     +53.9%      17493 =C2=B1  7%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      11366           +53.9%      17493        GEO-MEAN sched_debug.cfs_rq=
[9]:/.tg_load_avg
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      11748 =C2=B1  4%     +55.0%      18209 =C2=B1  7%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      11748           +55.0%      18208        GEO-MEAN sched_debug.cfs_rq=
[1]:/.tg_load_avg
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      11411 =C2=B1  5%     +53.1%      17466 =C2=B1  7%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      11411           +53.1%      17465        GEO-MEAN sched_debug.cfs_rq=
[6]:/.tg_load_avg
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      11385 =C2=B1  4%     +53.6%      17487 =C2=B1  7%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      11385           +53.6%      17487        GEO-MEAN sched_debug.cfs_rq=
[10]:/.tg_load_avg
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      11835 =C2=B1  4%     +54.6%      18293 =C2=B1  7%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      11834           +54.6%      18293        GEO-MEAN sched_debug.cfs_rq=
[0]:/.tg_load_avg
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>       1862 =C2=B1 20%     +29.9%       2418 =C2=B1 14%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>       1862           +29.9%       2418        GEO-MEAN sched_debug.cfs_rq=
[25]:/.avg->runnable_avg_sum
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>         39 =C2=B1 20%     +31.2%         52 =C2=B1 14%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>         39           +31.2%         52        GEO-MEAN sched_debug.cfs_rq=
[25]:/.tg_runnable_contrib
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      11642 =C2=B1  4%     +55.3%      18079 =C2=B1  8%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      11642           +55.3%      18079        GEO-MEAN sched_debug.cfs_rq=
[3]:/.tg_load_avg
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>         49 =C2=B1 17%     +55.1%         76 =C2=B1 21%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>         48           +55.1%         76        GEO-MEAN sched_debug.cpu#46=
.ttwu_count
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      11683 =C2=B1  4%     +54.5%      18052 =C2=B1  8%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      11683           +54.5%      18052        GEO-MEAN sched_debug.cfs_rq=
[2]:/.tg_load_avg
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     581872 =C2=B1  4%     -27.2%     423323 =C2=B1  1%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     581872           -27.2%     423323        GEO-MEAN proc-vmstat.pgfault
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>       7910 =C2=B1 11%     +35.8%      10744 =C2=B1 15%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>       7910           +35.8%      10744        GEO-MEAN sched_debug.cfs_rq=
[25]:/.min_vruntime
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>        272 =C2=B1 16%     -30.9%        188 =C2=B1 22%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>        272           -30.9%        188        GEO-MEAN sched_debug.cpu#41=
.ttwu_count
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     446764 =C2=B1  3%     -20.9%     353422 =C2=B1  1%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     446764           -20.9%     353422        GEO-MEAN proc-vmstat.pgfree
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     112632 =C2=B1  1%     -25.8%      83611 =C2=B1 17%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     112632           -25.8%      83611        GEO-MEAN softirqs.SCHED
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>       4606 =C2=B1  5%     -17.0%       3824 =C2=B1 11%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>       4606           -17.0%       3824        GEO-MEAN slabinfo.dquot.num=
_objs
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>        748 =C2=B1 18%     -33.5%        497 =C2=B1 20%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>        748           -33.5%        497        GEO-MEAN slabinfo.ext4_allo=
cation_context.num_objs
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>        748 =C2=B1 18%     -33.5%        497 =C2=B1 20%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>        748           -33.5%        497        GEO-MEAN slabinfo.ext4_allo=
cation_context.active_objs
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>        993 =C2=B1 18%     -33.5%        660 =C2=B1 20%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>        993           -33.5%        660        GEO-MEAN slabinfo.jbd2_jour=
nal_handle.num_objs
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>        993 =C2=B1 18%     -33.5%        660 =C2=B1 20%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>        993           -33.5%        660        GEO-MEAN slabinfo.jbd2_jour=
nal_handle.active_objs
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>        643 =C2=B1 16%     -32.3%        435 =C2=B1 20%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>        643           -32.3%        435        GEO-MEAN slabinfo.ext4_io_e=
nd.num_objs
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>        643 =C2=B1 16%     -32.3%        435 =C2=B1 20%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>        643           -32.3%        435        GEO-MEAN slabinfo.ext4_io_e=
nd.active_objs
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>       4561 =C2=B1  4%     -16.2%       3822 =C2=B1 11%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>       4561           -16.2%       3822        GEO-MEAN slabinfo.dquot.act=
ive_objs
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>         38 =C2=B1  2%     +88.4%         71 =C2=B1  3%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>         37           +88.4%         71        GEO-MEAN time.percent_of_cp=
u_this_job_got
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     165.96 =C2=B1  1%     -46.6%      88.67 =C2=B1  2%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     165.96           -46.6%      88.67        GEO-MEAN time.elapsed_time
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>     311261 =C2=B1  1%     +85.0%     575680 =C2=B1  2%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>     311261           +85.0%     575680        GEO-MEAN vmstat.io.bo
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>      26582 =C2=B1  1%     +76.2%      46834 =C2=B1  2%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>      26582           +76.2%      46834        GEO-MEAN vmstat.system.cs
> =

> 844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

> ----------------  --------------------------  =

>       2.26 =C2=B1  0%      +2.7%       2.32 =C2=B1  1%  ivb43/fsmark/perf=
ormance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
>       2.26            +2.7%       2.32        GEO-MEAN turbostat.%c0
> =

> ivb43: Ivytown Ivy Bridge-EP
> Memory: 64G
> =

> =

> =

> =

>                                 fsmark.files_per_sec
> =

>   12000 ++---------------------------------------------------------------=
---+
>         O  O O  O  O  O O  O    O     O    O  O  O    O     O O  O  O  O =
   |
>   10000 ++                         O     O          O                    =
   |
>         |                                                                =
   |
>         |                                                                =
   |
>    8000 ++                                                               =
   |
>         |                                                                =
   |
>    6000 *+.*.*..*..*..*.*..*..*.*..*..*..*.*..*..*..*.*..*..*.*..*..*..*.=
*..*
>         |                                                                =
   |
>    4000 ++                                                               =
   |
>         |                                                                =
   |
>         |                                                                =
   |
>    2000 ++                                                               =
   |
>         |                                                                =
   |
>       0 ++---------------------------------------------------------------=
---+
> =

> 	[*] bisect-good sample
> 	[O] bisect-bad  sample
> =

> To reproduce:
> =

> 	apt-get install ruby ruby-oj
> 	git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tests.git
> 	cd lkp-tests
> 	bin/setup-local job.yaml # the job file attached in this email
> 	bin/run-local   job.yaml
> =

> =

> Disclaimer:
> Results have been estimated based on internal Intel analysis and are prov=
ided
> for informational purposes only. Any difference in system hardware or sof=
tware
> design or configuration may affect actual performance.

> ---
> testcase: fsmark
> default_monitors:
>   wait: pre-test
>   uptime: =

>   iostat: =

>   vmstat: =

>   numa-numastat: =

>   numa-vmstat: =

>   numa-meminfo: =

>   proc-vmstat: =

>   proc-stat: =

>   meminfo: =

>   slabinfo: =

>   interrupts: =

>   lock_stat: =

>   latency_stats: =

>   softirqs: =

>   bdi_dev_mapping: =

>   diskstats: =

>   cpuidle: =

>   cpufreq: =

>   turbostat: =

>   sched_debug:
>     interval: 10
>   pmeter: =

> default_watchdogs:
>   watch-oom: =

>   watchdog: =

> cpufreq_governor:
> - performance
> commit: cac7f2429872d3733dc3f9915857b1691da2eb2f
> model: Ivytown Ivy Bridge-EP
> nr_cpu: 48
> memory: 64G
> nr_hdd_partitions: 3
> hdd_partitions: "/dev/disk/by-id/ata-ST2000NM0011*-part1"
> rootfs_partition: "/dev/disk/by-id/ata-ST2000NM0011_Z1P67EBL-part3"
> swap_partitions: "/dev/disk/by-id/ata-ST2000NM0011_Z1P67EBL-part2"
> iterations: 1x
> nr_threads: 1t
> disk: 1BRD_32G
> need_memory: 48G
> fs:
> - ext4
> fs2:
> - =

> fsmark:
>   filesize: 4K
>   test_size: 4G
>   sync_method: fsyncBeforeClose
>   nr_files_per_directory: 1fpd
> enqueue_time: 2014-10-28 11:07:59.352040504 +08:00
> testbox: ivb43
> tbox_group: ivb43
> kconfig: x86_64-rhel
> head_commit: 1dc9d2c43b9b25cc48ce37e86c906487e1cd9df6
> base_commit: cac7f2429872d3733dc3f9915857b1691da2eb2f
> branch: linux-devel/devel-hourly-2014102809
> kernel: "/kernel/x86_64-rhel/cac7f2429872d3733dc3f9915857b1691da2eb2f/vml=
inuz-3.18.0-rc2"
> user: lkp
> queue: cyclic
> rootfs: debian-x86_64.cgz
> result_root: "/result/ivb43/fsmark/performance-1x-1t-1BRD_32G-ext4-4K-4G-=
fsyncBeforeClose-1fpd/debian-x86_64.cgz/x86_64-rhel/cac7f2429872d3733dc3f99=
15857b1691da2eb2f/0"
> job_file: "/lkp/scheduled/ivb43/cyclic_fsmark-performance-1x-1t-1BRD_32G-=
ext4-4K-4G-fsyncBeforeClose-1fpd-x86_64-rhel-BASE-cac7f2429872d3733dc3f9915=
857b1691da2eb2f-0.yaml"
> dequeue_time: 2014-10-28 11:19:28.081330731 +08:00
> job_state: finished
> loadavg: 1.08 0.39 0.14 1/422 6523
> start_time: '1414466414'
> end_time: '1414466506'
> version: "/lkp/lkp/.src-20141027-213532"

> echo performance > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
> echo performance > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
> echo performance > /sys/devices/system/cpu/cpu10/cpufreq/scaling_governor
> echo performance > /sys/devices/system/cpu/cpu11/cpufreq/scaling_governor
> echo performance > /sys/devices/system/cpu/cpu12/cpufreq/scaling_governor
> echo performance > /sys/devices/system/cpu/cpu13/cpufreq/scaling_governor
> echo performance > /sys/devices/system/cpu/cpu14/cpufreq/scaling_governor
> echo performance > /sys/devices/system/cpu/cpu15/cpufreq/scaling_governor
> echo performance > /sys/devices/system/cpu/cpu16/cpufreq/scaling_governor
> echo performance > /sys/devices/system/cpu/cpu17/cpufreq/scaling_governor
> echo performance > /sys/devices/system/cpu/cpu18/cpufreq/scaling_governor
> echo performance > /sys/devices/system/cpu/cpu19/cpufreq/scaling_governor
> echo performance > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
> echo performance > /sys/devices/system/cpu/cpu20/cpufreq/scaling_governor
> echo performance > /sys/devices/system/cpu/cpu21/cpufreq/scaling_governor
> echo performance > /sys/devices/system/cpu/cpu22/cpufreq/scaling_governor
> echo performance > /sys/devices/system/cpu/cpu23/cpufreq/scaling_governor
> echo performance > /sys/devices/system/cpu/cpu24/cpufreq/scaling_governor
> echo performance > /sys/devices/system/cpu/cpu25/cpufreq/scaling_governor
> echo performance > /sys/devices/system/cpu/cpu26/cpufreq/scaling_governor
> echo performance > /sys/devices/system/cpu/cpu27/cpufreq/scaling_governor
> echo performance > /sys/devices/system/cpu/cpu28/cpufreq/scaling_governor
> echo performance > /sys/devices/system/cpu/cpu29/cpufreq/scaling_governor
> echo performance > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
> echo performance > /sys/devices/system/cpu/cpu30/cpufreq/scaling_governor
> echo performance > /sys/devices/system/cpu/cpu31/cpufreq/scaling_governor
> echo performance > /sys/devices/system/cpu/cpu32/cpufreq/scaling_governor
> echo performance > /sys/devices/system/cpu/cpu33/cpufreq/scaling_governor
> echo performance > /sys/devices/system/cpu/cpu34/cpufreq/scaling_governor
> echo performance > /sys/devices/system/cpu/cpu35/cpufreq/scaling_governor
> echo performance > /sys/devices/system/cpu/cpu36/cpufreq/scaling_governor
> echo performance > /sys/devices/system/cpu/cpu37/cpufreq/scaling_governor
> echo performance > /sys/devices/system/cpu/cpu38/cpufreq/scaling_governor
> echo performance > /sys/devices/system/cpu/cpu39/cpufreq/scaling_governor
> echo performance > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
> echo performance > /sys/devices/system/cpu/cpu40/cpufreq/scaling_governor
> echo performance > /sys/devices/system/cpu/cpu41/cpufreq/scaling_governor
> echo performance > /sys/devices/system/cpu/cpu42/cpufreq/scaling_governor
> echo performance > /sys/devices/system/cpu/cpu43/cpufreq/scaling_governor
> echo performance > /sys/devices/system/cpu/cpu44/cpufreq/scaling_governor
> echo performance > /sys/devices/system/cpu/cpu45/cpufreq/scaling_governor
> echo performance > /sys/devices/system/cpu/cpu46/cpufreq/scaling_governor
> echo performance > /sys/devices/system/cpu/cpu47/cpufreq/scaling_governor
> echo performance > /sys/devices/system/cpu/cpu5/cpufreq/scaling_governor
> echo performance > /sys/devices/system/cpu/cpu6/cpufreq/scaling_governor
> echo performance > /sys/devices/system/cpu/cpu7/cpufreq/scaling_governor
> echo performance > /sys/devices/system/cpu/cpu8/cpufreq/scaling_governor
> echo performance > /sys/devices/system/cpu/cpu9/cpufreq/scaling_governor
> mkfs -t ext4 -q -F /dev/ram0
> mount -t ext4 /dev/ram0 /fs/ram0
> ./fs_mark -d /fs/ram0/1 -D 1000000 -N 1 -n 1000000 -L 1 -S 1 -s 4096

> _______________________________________________
> LKP mailing list
> LKP(a)linux.intel.com


--===============1241276110336181982==--

