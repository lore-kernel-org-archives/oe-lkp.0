Content-Type: multipart/mixed; boundary="===============5239099122063271036=="
MIME-Version: 1.0
From: LKP <lkp@01.org>
To: lkp@lists.01.org
Subject: [jbd2] cc97f1a7c7e: +87.2% fsmark.files_per_sec
Date: Thu, 06 Nov 2014 15:23:14 +0800
Message-ID: <20141106072314.GA16008@yliu-dev.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5239099122063271036==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below good changes on

commit cc97f1a7c7eed970e674b84be0e68f479c80228d ("jbd2: avoid pointless sca=
nning of checkpoint lists")


844749764b416ee2  cc97f1a7c7eed970e674b84be0  testbox/testcase/testparams
----------------  --------------------------  ---------------------------
         %stddev     %change         %stddev
             \          |                \  =

      6026 =C2=B1  1%     +87.2%      11283 =C2=B1  2%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
      6026           +87.2%      11283        GEO-MEAN fsmark.files_per_sec

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

  86294457 =C2=B1  7%     -99.0%     822113 =C2=B1 25%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
  86294457           -99.0%     822113        GEO-MEAN cpuidle.C1E-IVT.time

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    795159 =C2=B1  5%     -99.9%        931 =C2=B1 16%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    795159           -99.9%        931        GEO-MEAN cpuidle.C1E-IVT.usage

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     13012 =C2=B1 36%     -68.0%       4169 =C2=B1 45%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     13012           -68.0%       4168        GEO-MEAN sched_debug.cpu#15.s=
ched_goidle

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     26135 =C2=B1 36%     -67.9%       8395 =C2=B1 45%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     26135           -67.9%       8395        GEO-MEAN sched_debug.cpu#15.n=
r_switches

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

       890 =C2=B1 36%    +154.2%       2263 =C2=B1 29%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
       890          +154.2%       2263        GEO-MEAN sched_debug.cfs_rq[3=
9]:/.tg_load_contrib

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     13688 =C2=B1 44%     -63.9%       4936 =C2=B1 28%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     13688           -63.9%       4936        GEO-MEAN sched_debug.cpu#14.t=
twu_count

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

      1792 =C2=B1 24%     -64.5%        636 =C2=B1 37%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
      1792           -64.5%        636        GEO-MEAN cpuidle.C3-IVT.usage

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

      2118 =C2=B1 43%    +129.9%       4869 =C2=B1 23%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
      2118          +129.9%       4869        GEO-MEAN sched_debug.cfs_rq[2=
5]:/.blocked_load_avg

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    244970 =C2=B1  2%     -52.1%     117231 =C2=B1  1%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    244970           -52.1%     117231        GEO-MEAN cpuidle.C6-IVT.usage

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

      2175 =C2=B1 41%    +126.3%       4923 =C2=B1 24%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
      2175          +126.3%       4922        GEO-MEAN sched_debug.cfs_rq[2=
5]:/.tg_load_contrib

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     14419 =C2=B1 28%     -58.4%       5996 =C2=B1 17%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     14419           -58.4%       5996        GEO-MEAN sched_debug.cpu#14.s=
ched_goidle

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     32555 =C2=B1 25%     -54.4%      14859 =C2=B1 17%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     32555           -54.4%      14859        GEO-MEAN sched_debug.cpu#14.n=
r_switches

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    107876 =C2=B1 13%     +72.7%     186283 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    107876           +72.7%     186283        GEO-MEAN proc-vmstat.nr_dirty

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

 7.587e+09 =C2=B1  1%     -46.5%  4.059e+09 =C2=B1  2%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
 7.587e+09           -46.5%  4.059e+09        GEO-MEAN cpuidle.C6-IVT.time

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    432452 =C2=B1 13%     +72.2%     744607 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    432452           +72.2%     744607        GEO-MEAN meminfo.Dirty

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

       107 =C2=B1 44%     -49.7%         54 =C2=B1  6%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
       107           -49.7%         54        GEO-MEAN sched_debug.cpu#33.t=
twu_count

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

   1190529 =C2=B1  3%     +68.4%    2004907 =C2=B1  0%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
   1190529           +68.4%    2004907        GEO-MEAN cpuidle.C1-IVT.usage

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

       190 =C2=B1  0%     -39.3%        115 =C2=B1  2%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
       190           -39.3%        115        GEO-MEAN uptime.boot

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

      8735 =C2=B1  1%     -39.5%       5285 =C2=B1  2%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
      8735           -39.5%       5285        GEO-MEAN uptime.idle

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    106392 =C2=B1  1%     -32.4%      71966 =C2=B1 13%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    106392           -32.4%      71966        GEO-MEAN softirqs.RCU

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    107085 =C2=B1  0%     -35.3%      69240 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    107085           -35.3%      69240        GEO-MEAN sched_debug.cpu#3.cl=
ock

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    107086 =C2=B1  0%     -35.3%      69240 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    107086           -35.3%      69240        GEO-MEAN sched_debug.cpu#2.cl=
ock

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    107086 =C2=B1  0%     -35.3%      69246 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    107086           -35.3%      69246        GEO-MEAN sched_debug.cpu#10.c=
lock

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    107088 =C2=B1  0%     -35.3%      69244 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    107088           -35.3%      69244        GEO-MEAN sched_debug.cpu#8.cl=
ock

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    107088 =C2=B1  0%     -35.3%      69243 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    107088           -35.3%      69243        GEO-MEAN sched_debug.cpu#7.cl=
ock

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    107087 =C2=B1  0%     -35.3%      69246 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    107087           -35.3%      69246        GEO-MEAN sched_debug.cpu#9.cl=
ock

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    107083 =C2=B1  0%     -35.3%      69244 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    107083           -35.3%      69244        GEO-MEAN sched_debug.cpu#24.c=
lock

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    107092 =C2=B1  0%     -35.3%      69247 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    107092           -35.3%      69247        GEO-MEAN sched_debug.cpu#16.c=
lock

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    107073 =C2=B1  0%     -35.3%      69237 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    107073           -35.3%      69237        GEO-MEAN sched_debug.cpu#1.cl=
ock

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    107091 =C2=B1  0%     -35.3%      69245 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    107091           -35.3%      69245        GEO-MEAN sched_debug.cpu#28.c=
lock

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    107090 =C2=B1  0%     -35.3%      69246 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    107090           -35.3%      69246        GEO-MEAN sched_debug.cpu#27.c=
lock

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    107093 =C2=B1  0%     -35.3%      69245 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    107093           -35.3%      69245        GEO-MEAN sched_debug.cpu#17.c=
lock

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    107086 =C2=B1  0%     -35.3%      69245 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    107086           -35.3%      69245        GEO-MEAN sched_debug.cpu#6.cl=
ock

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    107087 =C2=B1  0%     -35.3%      69246 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    107087           -35.3%      69246        GEO-MEAN sched_debug.cpu#25.c=
lock

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    107091 =C2=B1  0%     -35.3%      69246 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    107091           -35.3%      69246        GEO-MEAN sched_debug.cpu#38.c=
lock

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    107092 =C2=B1  0%     -35.3%      69246 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    107092           -35.3%      69246        GEO-MEAN sched_debug.cpu#41.c=
lock

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    107091 =C2=B1  0%     -35.3%      69246 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    107091           -35.3%      69246        GEO-MEAN sched_debug.cpu#36.c=
lock

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    107093 =C2=B1  0%     -35.3%      69246 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    107093           -35.3%      69246        GEO-MEAN sched_debug.cpu#43.c=
lock

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    107093 =C2=B1  0%     -35.3%      69246 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    107093           -35.3%      69246        GEO-MEAN sched_debug.cpu#44.c=
lock

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    107093 =C2=B1  0%     -35.3%      69246 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    107093           -35.3%      69246        GEO-MEAN sched_debug.cpu#45.c=
lock

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    107093 =C2=B1  0%     -35.3%      69246 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    107093           -35.3%      69246        GEO-MEAN sched_debug.cpu#46.c=
lock

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    107093 =C2=B1  0%     -35.3%      69246 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    107093           -35.3%      69246        GEO-MEAN sched_debug.cpu#47.c=
lock

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    107084 =C2=B1  0%     -35.3%      69249 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    107084           -35.3%      69249        GEO-MEAN sched_debug.cpu#26.c=
lock

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    107092 =C2=B1  0%     -35.3%      69246 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    107092           -35.3%      69246        GEO-MEAN sched_debug.cpu#30.c=
lock

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    107089 =C2=B1  0%     -35.3%      69246 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    107089           -35.3%      69246        GEO-MEAN sched_debug.cpu#29.c=
lock

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    107093 =C2=B1  0%     -35.3%      69245 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    107093           -35.3%      69245        GEO-MEAN sched_debug.cpu#31.c=
lock

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    107090 =C2=B1  0%     -35.3%      69245 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    107090           -35.3%      69245        GEO-MEAN sched_debug.cpu#32.c=
lock

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    107090 =C2=B1  0%     -35.3%      69246 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    107090           -35.3%      69246        GEO-MEAN sched_debug.cpu#33.c=
lock

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    107090 =C2=B1  0%     -35.3%      69246 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    107090           -35.3%      69246        GEO-MEAN sched_debug.cpu#34.c=
lock

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    107095 =C2=B1  0%     -35.3%      69246 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    107095           -35.3%      69246        GEO-MEAN sched_debug.cpu#42.c=
lock

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    107090 =C2=B1  0%     -35.3%      69246 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    107090           -35.3%      69246        GEO-MEAN sched_debug.cpu#35.c=
lock

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    107087 =C2=B1  0%     -35.3%      69246 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    107087           -35.3%      69246        GEO-MEAN sched_debug.cpu#13.c=
lock

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    107093 =C2=B1  0%     -35.3%      69250 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    107093           -35.3%      69250        GEO-MEAN sched_debug.cpu#37.c=
lock

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    107088 =C2=B1  0%     -35.3%      69247 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    107088           -35.3%      69247        GEO-MEAN sched_debug.cpu#12.c=
lock

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    107091 =C2=B1  0%     -35.3%      69245 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    107091           -35.3%      69245        GEO-MEAN sched_debug.cpu#23.c=
lock

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    107090 =C2=B1  0%     -35.3%      69249 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    107090           -35.3%      69249        GEO-MEAN sched_debug.cpu#19.c=
lock

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    107083 =C2=B1  0%     -35.3%      69249 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    107083           -35.3%      69249        GEO-MEAN sched_debug.cpu#4.cl=
ock

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    107092 =C2=B1  0%     -35.3%      69247 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    107092           -35.3%      69247        GEO-MEAN sched_debug.cpu#20.c=
lock

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    107088 =C2=B1  0%     -35.3%      69249 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    107088           -35.3%      69249        GEO-MEAN sched_debug.cpu#5.cl=
ock

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    107084 =C2=B1  0%     -35.3%      69249 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    107084           -35.3%      69249        GEO-MEAN sched_debug.cpu#11.c=
lock

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    107097 =C2=B1  0%     -35.3%      69251 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    107097           -35.3%      69251        GEO-MEAN sched_debug.sched_clk

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    107097 =C2=B1  0%     -35.3%      69251 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    107097           -35.3%      69251        GEO-MEAN sched_debug.cpu_clk

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    107089 =C2=B1  0%     -35.3%      69248 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    107089           -35.3%      69248        GEO-MEAN sched_debug.cpu#21.c=
lock

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    107094 =C2=B1  0%     -35.3%      69252 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    107094           -35.3%      69252        GEO-MEAN sched_debug.cpu#15.c=
lock

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    107089 =C2=B1  0%     -35.3%      69250 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    107089           -35.3%      69250        GEO-MEAN sched_debug.cpu#18.c=
lock

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    107095 =C2=B1  0%     -35.3%      69250 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    107095           -35.3%      69250        GEO-MEAN sched_debug.cpu#40.c=
lock

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    107087 =C2=B1  0%     -35.3%      69252 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    107087           -35.3%      69252        GEO-MEAN sched_debug.cpu#22.c=
lock

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    107093 =C2=B1  0%     -35.3%      69253 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    107093           -35.3%      69253        GEO-MEAN sched_debug.cpu#39.c=
lock

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    107065 =C2=B1  0%     -35.3%      69234 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    107065           -35.3%      69234        GEO-MEAN sched_debug.cpu#0.cl=
ock

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    107094 =C2=B1  0%     -35.3%      69253 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    107094           -35.3%      69253        GEO-MEAN sched_debug.cpu#14.c=
lock

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

       381 =C2=B1  5%     +81.8%        692 =C2=B1 31%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
       381           +81.8%        692        GEO-MEAN sched_debug.cfs_rq[2=
6]:/.tg_load_contrib

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

       379 =C2=B1  6%     +80.3%        684 =C2=B1 32%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
       379           +80.3%        684        GEO-MEAN sched_debug.cfs_rq[2=
6]:/.blocked_load_avg

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     11427 =C2=B1  3%     +57.5%      18000 =C2=B1  6%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     11427           +57.5%      18000        GEO-MEAN sched_debug.cfs_rq[4=
4]:/.tg_load_avg

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     11405 =C2=B1  3%     +58.0%      18019 =C2=B1  6%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     11405           +58.0%      18018        GEO-MEAN sched_debug.cfs_rq[4=
5]:/.tg_load_avg

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    104000 =C2=B1  0%     -35.2%      67385 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    104000           -35.2%      67385        GEO-MEAN sched_debug.ktime

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     11379 =C2=B1  3%     +58.2%      18001 =C2=B1  6%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     11379           +58.2%      18000        GEO-MEAN sched_debug.cfs_rq[4=
6]:/.tg_load_avg

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     11388 =C2=B1  3%     +58.3%      18023 =C2=B1  6%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     11388           +58.3%      18023        GEO-MEAN sched_debug.cfs_rq[4=
7]:/.tg_load_avg

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     11395 =C2=B1  3%     +55.7%      17744 =C2=B1  7%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     11395           +55.7%      17744        GEO-MEAN sched_debug.cfs_rq[3=
1]:/.tg_load_avg

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     11382 =C2=B1  4%     +56.6%      17829 =C2=B1  7%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     11382           +56.6%      17829        GEO-MEAN sched_debug.cfs_rq[3=
6]:/.tg_load_avg

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     11379 =C2=B1  3%     +57.4%      17915 =C2=B1  6%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     11379           +57.4%      17915        GEO-MEAN sched_debug.cfs_rq[3=
9]:/.tg_load_avg

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     11415 =C2=B1  3%     +56.2%      17835 =C2=B1  7%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     11415           +56.2%      17835        GEO-MEAN sched_debug.cfs_rq[3=
5]:/.tg_load_avg

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     11408 =C2=B1  3%     +55.5%      17736 =C2=B1  7%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     11407           +55.5%      17736        GEO-MEAN sched_debug.cfs_rq[3=
3]:/.tg_load_avg

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     11401 =C2=B1  3%     +57.4%      17941 =C2=B1  6%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     11401           +57.4%      17941        GEO-MEAN sched_debug.cfs_rq[4=
2]:/.tg_load_avg

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     11402 =C2=B1  3%     +57.4%      17942 =C2=B1  7%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     11402           +57.4%      17942        GEO-MEAN sched_debug.cfs_rq[4=
3]:/.tg_load_avg

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     11398 =C2=B1  3%     +57.3%      17932 =C2=B1  6%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     11398           +57.3%      17932        GEO-MEAN sched_debug.cfs_rq[4=
1]:/.tg_load_avg

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     11412 =C2=B1  3%     +55.2%      17716 =C2=B1  7%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     11412           +55.2%      17716        GEO-MEAN sched_debug.cfs_rq[3=
2]:/.tg_load_avg

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     11384 =C2=B1  3%     +57.1%      17882 =C2=B1  6%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     11383           +57.1%      17882        GEO-MEAN sched_debug.cfs_rq[3=
8]:/.tg_load_avg

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     11408 =C2=B1  3%     +57.1%      17917 =C2=B1  6%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     11408           +57.1%      17917        GEO-MEAN sched_debug.cfs_rq[4=
0]:/.tg_load_avg

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     11419 =C2=B1  3%     +55.6%      17770 =C2=B1  7%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     11419           +55.6%      17770        GEO-MEAN sched_debug.cfs_rq[3=
4]:/.tg_load_avg

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     11369 =C2=B1  3%     +55.4%      17669 =C2=B1  7%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     11369           +55.4%      17668        GEO-MEAN sched_debug.cfs_rq[2=
9]:/.tg_load_avg

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     11391 =C2=B1  3%     +55.5%      17711 =C2=B1  7%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     11391           +55.5%      17711        GEO-MEAN sched_debug.cfs_rq[3=
0]:/.tg_load_avg

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     11373 =C2=B1  3%     +55.1%      17644 =C2=B1  7%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     11373           +55.1%      17644        GEO-MEAN sched_debug.cfs_rq[2=
8]:/.tg_load_avg

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     11407 =C2=B1  4%     +56.4%      17839 =C2=B1  7%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     11407           +56.4%      17839        GEO-MEAN sched_debug.cfs_rq[3=
7]:/.tg_load_avg

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     11385 =C2=B1  3%     +54.9%      17638 =C2=B1  7%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     11385           +54.9%      17638        GEO-MEAN sched_debug.cfs_rq[1=
6]:/.tg_load_avg

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     11389 =C2=B1  4%     +56.2%      17790 =C2=B1  7%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     11389           +56.2%      17790        GEO-MEAN sched_debug.cfs_rq[2=
4]:/.tg_load_avg

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     11388 =C2=B1  4%     +56.3%      17800 =C2=B1  7%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     11388           +56.3%      17800        GEO-MEAN sched_debug.cfs_rq[2=
3]:/.tg_load_avg

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     11399 =C2=B1  4%     +56.0%      17782 =C2=B1  7%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     11398           +56.0%      17782        GEO-MEAN sched_debug.cfs_rq[2=
5]:/.tg_load_avg

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     11339 =C2=B1  3%     +55.9%      17678 =C2=B1  7%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     11338           +55.9%      17678        GEO-MEAN sched_debug.cfs_rq[1=
8]:/.tg_load_avg

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     11391 =C2=B1  4%     +55.7%      17742 =C2=B1  7%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     11391           +55.7%      17742        GEO-MEAN sched_debug.cfs_rq[2=
6]:/.tg_load_avg

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     11335 =C2=B1  4%     +56.0%      17682 =C2=B1  7%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     11334           +56.0%      17682        GEO-MEAN sched_debug.cfs_rq[1=
9]:/.tg_load_avg

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     11330 =C2=B1  4%     +56.0%      17670 =C2=B1  7%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     11329           +56.0%      17670        GEO-MEAN sched_debug.cfs_rq[2=
0]:/.tg_load_avg

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     11361 =C2=B1  4%     +56.7%      17803 =C2=B1  7%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     11361           +56.7%      17802        GEO-MEAN sched_debug.cfs_rq[2=
1]:/.tg_load_avg

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     11374 =C2=B1  4%     +56.5%      17803 =C2=B1  7%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     11373           +56.5%      17803        GEO-MEAN sched_debug.cfs_rq[2=
2]:/.tg_load_avg

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     11329 =C2=B1  3%     +55.8%      17652 =C2=B1  7%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     11329           +55.8%      17652        GEO-MEAN sched_debug.cfs_rq[1=
7]:/.tg_load_avg

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     11364 =C2=B1  4%     +54.3%      17540 =C2=B1  7%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     11364           +54.3%      17540        GEO-MEAN sched_debug.cfs_rq[1=
4]:/.tg_load_avg

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     11378 =C2=B1  3%     +54.7%      17597 =C2=B1  7%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     11378           +54.7%      17597        GEO-MEAN sched_debug.cfs_rq[1=
5]:/.tg_load_avg

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     11344 =C2=B1  4%     +54.7%      17552 =C2=B1  7%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     11344           +54.7%      17552        GEO-MEAN sched_debug.cfs_rq[1=
3]:/.tg_load_avg

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     11407 =C2=B1  3%     +54.5%      17623 =C2=B1  7%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     11407           +54.5%      17623        GEO-MEAN sched_debug.cfs_rq[2=
7]:/.tg_load_avg

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     11350 =C2=B1  4%     +55.1%      17608 =C2=B1  7%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     11350           +55.1%      17608        GEO-MEAN sched_debug.cfs_rq[1=
2]:/.tg_load_avg

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     11375 =C2=B1  4%     +53.8%      17492 =C2=B1  7%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     11375           +53.8%      17492        GEO-MEAN sched_debug.cfs_rq[8=
]:/.tg_load_avg

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     11369 =C2=B1  4%     +54.2%      17536 =C2=B1  7%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     11368           +54.2%      17536        GEO-MEAN sched_debug.cfs_rq[1=
1]:/.tg_load_avg

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     11408 =C2=B1  5%     +53.6%      17523 =C2=B1  7%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     11407           +53.6%      17523        GEO-MEAN sched_debug.cfs_rq[7=
]:/.tg_load_avg

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     11492 =C2=B1  4%     +54.1%      17704 =C2=B1  7%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     11492           +54.1%      17704        GEO-MEAN sched_debug.cfs_rq[5=
]:/.tg_load_avg

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     11550 =C2=B1  4%     +56.0%      18022 =C2=B1  8%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     11550           +56.0%      18022        GEO-MEAN sched_debug.cfs_rq[4=
]:/.tg_load_avg

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     11366 =C2=B1  4%     +53.9%      17493 =C2=B1  7%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     11366           +53.9%      17493        GEO-MEAN sched_debug.cfs_rq[9=
]:/.tg_load_avg

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     11748 =C2=B1  4%     +55.0%      18209 =C2=B1  7%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     11748           +55.0%      18208        GEO-MEAN sched_debug.cfs_rq[1=
]:/.tg_load_avg

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     11411 =C2=B1  5%     +53.1%      17466 =C2=B1  7%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     11411           +53.1%      17465        GEO-MEAN sched_debug.cfs_rq[6=
]:/.tg_load_avg

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     11385 =C2=B1  4%     +53.6%      17487 =C2=B1  7%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     11385           +53.6%      17487        GEO-MEAN sched_debug.cfs_rq[1=
0]:/.tg_load_avg

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     11835 =C2=B1  4%     +54.6%      18293 =C2=B1  7%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     11834           +54.6%      18293        GEO-MEAN sched_debug.cfs_rq[0=
]:/.tg_load_avg

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

      1862 =C2=B1 20%     +29.9%       2418 =C2=B1 14%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
      1862           +29.9%       2418        GEO-MEAN sched_debug.cfs_rq[2=
5]:/.avg->runnable_avg_sum

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

        39 =C2=B1 20%     +31.2%         52 =C2=B1 14%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
        39           +31.2%         52        GEO-MEAN sched_debug.cfs_rq[2=
5]:/.tg_runnable_contrib

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     11642 =C2=B1  4%     +55.3%      18079 =C2=B1  8%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     11642           +55.3%      18079        GEO-MEAN sched_debug.cfs_rq[3=
]:/.tg_load_avg

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

        49 =C2=B1 17%     +55.1%         76 =C2=B1 21%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
        48           +55.1%         76        GEO-MEAN sched_debug.cpu#46.t=
twu_count

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     11683 =C2=B1  4%     +54.5%      18052 =C2=B1  8%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     11683           +54.5%      18052        GEO-MEAN sched_debug.cfs_rq[2=
]:/.tg_load_avg

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    581872 =C2=B1  4%     -27.2%     423323 =C2=B1  1%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    581872           -27.2%     423323        GEO-MEAN proc-vmstat.pgfault

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

      7910 =C2=B1 11%     +35.8%      10744 =C2=B1 15%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
      7910           +35.8%      10744        GEO-MEAN sched_debug.cfs_rq[2=
5]:/.min_vruntime

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

       272 =C2=B1 16%     -30.9%        188 =C2=B1 22%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
       272           -30.9%        188        GEO-MEAN sched_debug.cpu#41.t=
twu_count

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    446764 =C2=B1  3%     -20.9%     353422 =C2=B1  1%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    446764           -20.9%     353422        GEO-MEAN proc-vmstat.pgfree

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    112632 =C2=B1  1%     -25.8%      83611 =C2=B1 17%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    112632           -25.8%      83611        GEO-MEAN softirqs.SCHED

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

      4606 =C2=B1  5%     -17.0%       3824 =C2=B1 11%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
      4606           -17.0%       3824        GEO-MEAN slabinfo.dquot.num_o=
bjs

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

       748 =C2=B1 18%     -33.5%        497 =C2=B1 20%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
       748           -33.5%        497        GEO-MEAN slabinfo.ext4_alloca=
tion_context.num_objs

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

       748 =C2=B1 18%     -33.5%        497 =C2=B1 20%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
       748           -33.5%        497        GEO-MEAN slabinfo.ext4_alloca=
tion_context.active_objs

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

       993 =C2=B1 18%     -33.5%        660 =C2=B1 20%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
       993           -33.5%        660        GEO-MEAN slabinfo.jbd2_journa=
l_handle.num_objs

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

       993 =C2=B1 18%     -33.5%        660 =C2=B1 20%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
       993           -33.5%        660        GEO-MEAN slabinfo.jbd2_journa=
l_handle.active_objs

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

       643 =C2=B1 16%     -32.3%        435 =C2=B1 20%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
       643           -32.3%        435        GEO-MEAN slabinfo.ext4_io_end=
.num_objs

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

       643 =C2=B1 16%     -32.3%        435 =C2=B1 20%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
       643           -32.3%        435        GEO-MEAN slabinfo.ext4_io_end=
.active_objs

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

      4561 =C2=B1  4%     -16.2%       3822 =C2=B1 11%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
      4561           -16.2%       3822        GEO-MEAN slabinfo.dquot.activ=
e_objs

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

        38 =C2=B1  2%     +88.4%         71 =C2=B1  3%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
        37           +88.4%         71        GEO-MEAN time.percent_of_cpu_=
this_job_got

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    165.96 =C2=B1  1%     -46.6%      88.67 =C2=B1  2%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    165.96           -46.6%      88.67        GEO-MEAN time.elapsed_time

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

    311261 =C2=B1  1%     +85.0%     575680 =C2=B1  2%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
    311261           +85.0%     575680        GEO-MEAN vmstat.io.bo

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

     26582 =C2=B1  1%     +76.2%      46834 =C2=B1  2%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
     26582           +76.2%      46834        GEO-MEAN vmstat.system.cs

844749764b416ee2  cc97f1a7c7eed970e674b84be0  =

----------------  --------------------------  =

      2.26 =C2=B1  0%      +2.7%       2.32 =C2=B1  1%  ivb43/fsmark/perfor=
mance-1x-1t-1BRD_32G-ext4-4K-4G-fsyncBeforeClose-1fpd
      2.26            +2.7%       2.32        GEO-MEAN turbostat.%c0

ivb43: Ivytown Ivy Bridge-EP
Memory: 64G




                                fsmark.files_per_sec

  12000 ++-----------------------------------------------------------------=
-+
        O  O O  O  O  O O  O    O     O    O  O  O    O     O O  O  O  O   =
 |
  10000 ++                         O     O          O                      =
 |
        |                                                                  =
 |
        |                                                                  =
 |
   8000 ++                                                                 =
 |
        |                                                                  =
 |
   6000 *+.*.*..*..*..*.*..*..*.*..*..*..*.*..*..*..*.*..*..*.*..*..*..*.*.=
.*
        |                                                                  =
 |
   4000 ++                                                                 =
 |
        |                                                                  =
 |
        |                                                                  =
 |
   2000 ++                                                                 =
 |
        |                                                                  =
 |
      0 ++-----------------------------------------------------------------=
-+

	[*] bisect-good sample
	[O] bisect-bad  sample

To reproduce:

	apt-get install ruby ruby-oj
	git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tests.git
	cd lkp-tests
	bin/setup-local job.yaml # the job file attached in this email
	bin/run-local   job.yaml


Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.

_______________________________________________
LKP mailing list
LKP(a)linux.intel.com

--===============5239099122063271036==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiBmc21hcmsKZGVmYXVsdF9tb25pdG9yczoKICB3YWl0OiBwcmUtdGVzdAog
IHVwdGltZTogCiAgaW9zdGF0OiAKICB2bXN0YXQ6IAogIG51bWEtbnVtYXN0YXQ6IAogIG51bWEt
dm1zdGF0OiAKICBudW1hLW1lbWluZm86IAogIHByb2Mtdm1zdGF0OiAKICBwcm9jLXN0YXQ6IAog
IG1lbWluZm86IAogIHNsYWJpbmZvOiAKICBpbnRlcnJ1cHRzOiAKICBsb2NrX3N0YXQ6IAogIGxh
dGVuY3lfc3RhdHM6IAogIHNvZnRpcnFzOiAKICBiZGlfZGV2X21hcHBpbmc6IAogIGRpc2tzdGF0
czogCiAgY3B1aWRsZTogCiAgY3B1ZnJlcTogCiAgdHVyYm9zdGF0OiAKICBzY2hlZF9kZWJ1ZzoK
ICAgIGludGVydmFsOiAxMAogIHBtZXRlcjogCmRlZmF1bHRfd2F0Y2hkb2dzOgogIHdhdGNoLW9v
bTogCiAgd2F0Y2hkb2c6IApjcHVmcmVxX2dvdmVybm9yOgotIHBlcmZvcm1hbmNlCmNvbW1pdDog
Y2FjN2YyNDI5ODcyZDM3MzNkYzNmOTkxNTg1N2IxNjkxZGEyZWIyZgptb2RlbDogSXZ5dG93biBJ
dnkgQnJpZGdlLUVQCm5yX2NwdTogNDgKbWVtb3J5OiA2NEcKbnJfaGRkX3BhcnRpdGlvbnM6IDMK
aGRkX3BhcnRpdGlvbnM6ICIvZGV2L2Rpc2svYnktaWQvYXRhLVNUMjAwME5NMDAxMSotcGFydDEi
CnJvb3Rmc19wYXJ0aXRpb246ICIvZGV2L2Rpc2svYnktaWQvYXRhLVNUMjAwME5NMDAxMV9aMVA2
N0VCTC1wYXJ0MyIKc3dhcF9wYXJ0aXRpb25zOiAiL2Rldi9kaXNrL2J5LWlkL2F0YS1TVDIwMDBO
TTAwMTFfWjFQNjdFQkwtcGFydDIiCml0ZXJhdGlvbnM6IDF4Cm5yX3RocmVhZHM6IDF0CmRpc2s6
IDFCUkRfMzJHCm5lZWRfbWVtb3J5OiA0OEcKZnM6Ci0gZXh0NApmczI6Ci0gCmZzbWFyazoKICBm
aWxlc2l6ZTogNEsKICB0ZXN0X3NpemU6IDRHCiAgc3luY19tZXRob2Q6IGZzeW5jQmVmb3JlQ2xv
c2UKICBucl9maWxlc19wZXJfZGlyZWN0b3J5OiAxZnBkCmVucXVldWVfdGltZTogMjAxNC0xMC0y
OCAxMTowNzo1OS4zNTIwNDA1MDQgKzA4OjAwCnRlc3Rib3g6IGl2YjQzCnRib3hfZ3JvdXA6IGl2
YjQzCmtjb25maWc6IHg4Nl82NC1yaGVsCmhlYWRfY29tbWl0OiAxZGM5ZDJjNDNiOWIyNWNjNDhj
ZTM3ZTg2YzkwNjQ4N2UxY2Q5ZGY2CmJhc2VfY29tbWl0OiBjYWM3ZjI0Mjk4NzJkMzczM2RjM2Y5
OTE1ODU3YjE2OTFkYTJlYjJmCmJyYW5jaDogbGludXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTQx
MDI4MDkKa2VybmVsOiAiL2tlcm5lbC94ODZfNjQtcmhlbC9jYWM3ZjI0Mjk4NzJkMzczM2RjM2Y5
OTE1ODU3YjE2OTFkYTJlYjJmL3ZtbGludXotMy4xOC4wLXJjMiIKdXNlcjogbGtwCnF1ZXVlOiBj
eWNsaWMKcm9vdGZzOiBkZWJpYW4teDg2XzY0LmNnegpyZXN1bHRfcm9vdDogIi9yZXN1bHQvaXZi
NDMvZnNtYXJrL3BlcmZvcm1hbmNlLTF4LTF0LTFCUkRfMzJHLWV4dDQtNEstNEctZnN5bmNCZWZv
cmVDbG9zZS0xZnBkL2RlYmlhbi14ODZfNjQuY2d6L3g4Nl82NC1yaGVsL2NhYzdmMjQyOTg3MmQz
NzMzZGMzZjk5MTU4NTdiMTY5MWRhMmViMmYvMCIKam9iX2ZpbGU6ICIvbGtwL3NjaGVkdWxlZC9p
dmI0My9jeWNsaWNfZnNtYXJrLXBlcmZvcm1hbmNlLTF4LTF0LTFCUkRfMzJHLWV4dDQtNEstNEct
ZnN5bmNCZWZvcmVDbG9zZS0xZnBkLXg4Nl82NC1yaGVsLUJBU0UtY2FjN2YyNDI5ODcyZDM3MzNk
YzNmOTkxNTg1N2IxNjkxZGEyZWIyZi0wLnlhbWwiCmRlcXVldWVfdGltZTogMjAxNC0xMC0yOCAx
MToxOToyOC4wODEzMzA3MzEgKzA4OjAwCmpvYl9zdGF0ZTogZmluaXNoZWQKbG9hZGF2ZzogMS4w
OCAwLjM5IDAuMTQgMS80MjIgNjUyMwpzdGFydF90aW1lOiAnMTQxNDQ2NjQxNCcKZW5kX3RpbWU6
ICcxNDE0NDY2NTA2Jwp2ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0yMDE0MTAyNy0yMTM1MzIiCg==

--===============5239099122063271036==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMS9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTEy
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE1L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNo
byBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE4L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1MTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHUyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjAvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyMS9j
cHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9z
eXN0ZW0vY3B1L2NwdTIyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNl
ID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyNC9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTI1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyNy9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTI4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MjkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzL2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzAvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHUzMS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgpl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzMvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUzNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzYvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUz
Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTM4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NDAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNo
byBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQyL2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1NDMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHU0NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ1L2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDYv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHU0Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2L2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTgvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5L2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgpta2ZzIC10IGV4dDQgLXEgLUYgL2Rldi9yYW0wCm1vdW50IC10IGV4dDQgL2Rldi9y
YW0wIC9mcy9yYW0wCi4vZnNfbWFyayAtZCAvZnMvcmFtMC8xIC1EIDEwMDAwMDAgLU4gMSAtbiAx
MDAwMDAwIC1MIDEgLVMgMSAtcyA0MDk2Cg==

--===============5239099122063271036==--

