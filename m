Content-Type: multipart/mixed; boundary="===============5244959127493800835=="
MIME-Version: 1.0
From: kernel test robot <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: [sched/fair] 83a0a96a5f2: -19.9% unixbench.score
Date: Tue, 04 Nov 2014 12:28:21 +0800
Message-ID: <20141104042821.GL27038@yliu-dev.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5244959127493800835==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

commit 83a0a96a5f26d974580fd7251043ff70c8f1823d ("sched/fair: Leverage the =
idle state info when choosing the "idlest" cpu")


442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  testbox/testcase/testparams
----------------  --------------------------  ---------------------------
         %stddev     %change         %stddev
             \          |                \  =

       883 =C2=B1  2%     -19.9%        706 =C2=B1  0%  ivb42/unixbench/per=
formance-execl
       883           -19.9%        706        GEO-MEAN unixbench.score

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       562 =C2=B1 15%    +572.8%       3786 =C2=B1  8%  ivb42/unixbench/per=
formance-execl
       562          +572.8%       3786        GEO-MEAN sched_debug.cpu#28.t=
twu_count

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       127 =C2=B1 38%   +1135.4%       1576 =C2=B1 16%  ivb42/unixbench/per=
formance-execl
       127         +1135.4%       1576        GEO-MEAN sched_debug.cfs_rq[4=
7]:/.avg->runnable_avg_sum

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       207 =C2=B1 25%   +1868.9%       4075 =C2=B1  6%  ivb42/unixbench/per=
formance-execl
       206         +1868.9%       4075        GEO-MEAN sched_debug.cpu#47.t=
twu_count

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       158 =C2=B1 25%   +3096.7%       5076 =C2=B1 14%  ivb42/unixbench/per=
formance-execl
       158         +3096.7%       5076        GEO-MEAN sched_debug.cpu#47.s=
ched_goidle

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       349 =C2=B1 25%   +3878.9%      13886 =C2=B1 10%  ivb42/unixbench/per=
formance-execl
       348         +3878.9%      13886        GEO-MEAN sched_debug.cpu#47.n=
r_switches

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

    160.41 =C2=B1 42%    +510.9%     980.00 =C2=B1 14%  ivb42/unixbench/per=
formance-execl
    160.41          +510.9%     980.00        GEO-MEAN sched_debug.cfs_rq[2=
2]:/.exec_clock

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     24065 =C2=B1 18%     -86.2%       3331 =C2=B1 32%  client7/autotest/pe=
rformance-unixbench
     24064           -86.2%       3331        GEO-MEAN proc-vmstat.numa_hin=
t_faults

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     18054 =C2=B1 16%     -83.7%       2939 =C2=B1 26%  client7/autotest/pe=
rformance-unixbench
     18054           -83.7%       2939        GEO-MEAN proc-vmstat.numa_hin=
t_faults_local

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       143 =C2=B1 36%    +824.1%       1327 =C2=B1 18%  ivb42/unixbench/per=
formance-execl
       143          +824.1%       1326        GEO-MEAN sched_debug.cfs_rq[4=
6]:/.avg->runnable_avg_sum

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

         2 =C2=B1 39%    +961.5%         27 =C2=B1 18%  ivb42/unixbench/per=
formance-execl
         2          +961.5%         27        GEO-MEAN sched_debug.cfs_rq[4=
6]:/.tg_runnable_contrib

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       279 =C2=B1 46%    +754.8%       2384 =C2=B1 12%  ivb42/unixbench/per=
formance-execl
       278          +754.8%       2384        GEO-MEAN sched_debug.cpu#22.t=
twu_local

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        24 =C2=B1 31%  +13712.4%       3342 =C2=B1 13%  ivb42/unixbench/per=
formance-execl
        24        +13712.4%       3342        GEO-MEAN sched_debug.cpu#46.t=
twu_local

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     44.55 =C2=B1 20%   +2597.5%    1201.85 =C2=B1 11%  ivb42/unixbench/per=
formance-execl
     44.55         +2597.5%    1201.85        GEO-MEAN sched_debug.cfs_rq[4=
5]:/.exec_clock

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        28 =C2=B1 33%  +11224.6%       3216 =C2=B1  8%  ivb42/unixbench/per=
formance-execl
        28        +11224.6%       3216        GEO-MEAN sched_debug.cpu#45.t=
twu_local

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       129 =C2=B1 37%   +3211.6%       4291 =C2=B1 14%  ivb42/unixbench/per=
formance-execl
       129         +3211.6%       4291        GEO-MEAN sched_debug.cpu#45.s=
ched_goidle

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       178 =C2=B1  7%    +425.4%        937 =C2=B1 18%  ivb42/unixbench/per=
formance-execl
       178          +425.4%        937        GEO-MEAN sched_debug.cfs_rq[2=
2]:/.avg->runnable_avg_sum

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       285 =C2=B1 35%   +4047.2%      11852 =C2=B1 13%  ivb42/unixbench/per=
formance-execl
       285         +4047.2%      11852        GEO-MEAN sched_debug.cpu#45.n=
r_switches

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       148 =C2=B1 33%    +796.8%       1334 =C2=B1  9%  ivb42/unixbench/per=
formance-execl
       148          +796.8%       1334        GEO-MEAN sched_debug.cfs_rq[4=
4]:/.avg->runnable_avg_sum

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      2135 =C2=B1 47%    +395.0%      10571 =C2=B1 27%  ivb42/unixbench/per=
formance-execl
      2135          +395.0%      10571        GEO-MEAN sched_debug.cpu#23.t=
twu_count

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     44.50 =C2=B1 27%   +2702.7%    1247.30 =C2=B1 10%  ivb42/unixbench/per=
formance-execl
     44.50         +2702.7%    1247.30        GEO-MEAN sched_debug.cfs_rq[4=
4]:/.exec_clock

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        32 =C2=B1 23%  +10782.8%       3547 =C2=B1 12%  ivb42/unixbench/per=
formance-execl
        32        +10782.8%       3547        GEO-MEAN sched_debug.cpu#44.t=
twu_local

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        69 =C2=B1 26%   +5486.8%       3888 =C2=B1 11%  ivb42/unixbench/per=
formance-execl
        69         +5486.8%       3888        GEO-MEAN sched_debug.cpu#44.t=
twu_count

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        49 =C2=B1 27%   +7581.0%       3809 =C2=B1 15%  ivb42/unixbench/per=
formance-execl
        49         +7581.0%       3809        GEO-MEAN sched_debug.cpu#43.t=
twu_local

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        97 =C2=B1 15%   +4243.9%       4213 =C2=B1 14%  ivb42/unixbench/per=
formance-execl
        97         +4243.9%       4213        GEO-MEAN sched_debug.cpu#43.t=
twu_count

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       400 =C2=B1 49%   +3373.7%      13894 =C2=B1 15%  ivb42/unixbench/per=
formance-execl
       399         +3373.7%      13894        GEO-MEAN sched_debug.cpu#43.n=
r_switches

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       219 =C2=B1 28%    +644.9%       1637 =C2=B1 24%  ivb42/unixbench/per=
formance-execl
       219          +644.9%       1637        GEO-MEAN sched_debug.cfs_rq[4=
2]:/.avg->runnable_avg_sum

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

         4 =C2=B1 41%    +775.0%         35 =C2=B1 24%  ivb42/unixbench/per=
formance-execl
         4          +775.0%         34        GEO-MEAN sched_debug.cfs_rq[4=
2]:/.tg_runnable_contrib

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       156 =C2=B1 24%   +2848.8%       4617 =C2=B1 19%  ivb42/unixbench/per=
formance-execl
       156         +2848.8%       4617        GEO-MEAN sched_debug.cpu#42.s=
ched_goidle

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

    144.90 =C2=B1 46%    +548.0%     938.91 =C2=B1  5%  ivb42/unixbench/per=
formance-execl
    144.90          +548.0%     938.91        GEO-MEAN sched_debug.cfs_rq[2=
0]:/.exec_clock

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

         3 =C2=B1  0%    +546.7%         19 =C2=B1 19%  ivb42/unixbench/per=
formance-execl
         3          +546.7%         19        GEO-MEAN sched_debug.cfs_rq[2=
2]:/.tg_runnable_contrib

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       537 =C2=B1 49%   +2591.8%      14471 =C2=B1 17%  ivb42/unixbench/per=
formance-execl
       537         +2591.8%      14471        GEO-MEAN sched_debug.cpu#24.n=
r_switches

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     97.93 =C2=B1 13%   +1528.5%    1594.83 =C2=B1 45%  ivb42/unixbench/per=
formance-execl
     97.93         +1528.5%    1594.83        GEO-MEAN sched_debug.cfs_rq[4=
1]:/.exec_clock

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        87 =C2=B1 35%   +5044.0%       4516 =C2=B1 49%  ivb42/unixbench/per=
formance-execl
        87         +5044.0%       4516        GEO-MEAN sched_debug.cpu#41.t=
twu_local

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       259 =C2=B1 19%   +1778.2%       4872 =C2=B1 46%  ivb42/unixbench/per=
formance-execl
       259         +1778.2%       4872        GEO-MEAN sched_debug.cpu#41.t=
twu_count

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       244 =C2=B1 20%   +2290.7%       5838 =C2=B1 36%  ivb42/unixbench/per=
formance-execl
       244         +2290.7%       5837        GEO-MEAN sched_debug.cpu#41.s=
ched_goidle

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       571 =C2=B1 16%   +2745.5%      16247 =C2=B1 40%  ivb42/unixbench/per=
formance-execl
       571         +2745.5%      16247        GEO-MEAN sched_debug.cpu#41.n=
r_switches

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       142 =C2=B1 19%    +857.4%       1365 =C2=B1 13%  ivb42/unixbench/per=
formance-execl
       142          +857.4%       1365        GEO-MEAN sched_debug.cfs_rq[4=
0]:/.exec_clock

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       144 =C2=B1  8%   +2504.3%       3760 =C2=B1 15%  ivb42/unixbench/per=
formance-execl
       144         +2504.3%       3760        GEO-MEAN sched_debug.cpu#40.t=
twu_local

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       516 =C2=B1 11%    +698.5%       4125 =C2=B1 12%  ivb42/unixbench/per=
formance-execl
       516          +698.5%       4125        GEO-MEAN sched_debug.cpu#40.t=
twu_count

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       227 =C2=B1 16%    +887.1%       2243 =C2=B1 46%  ivb42/unixbench/per=
formance-execl
       227          +887.1%       2243        GEO-MEAN sched_debug.cfs_rq[3=
9]:/.exec_clock

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       265 =C2=B1  4%   +1393.0%       3959 =C2=B1  9%  ivb42/unixbench/per=
formance-execl
       265         +1393.0%       3959        GEO-MEAN sched_debug.cpu#39.t=
twu_local

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       154 =C2=B1 39%    +689.8%       1222 =C2=B1  7%  ivb42/unixbench/per=
formance-execl
       154          +689.8%       1222        GEO-MEAN sched_debug.cfs_rq[1=
8]:/.avg->runnable_avg_sum

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       539 =C2=B1  6%    +853.6%       5145 =C2=B1 15%  ivb42/unixbench/per=
formance-execl
       539          +853.6%       5145        GEO-MEAN sched_debug.cpu#39.s=
ched_goidle

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      1348 =C2=B1  5%    +989.0%      14689 =C2=B1  8%  ivb42/unixbench/per=
formance-execl
      1348          +989.0%      14688        GEO-MEAN sched_debug.cpu#39.n=
r_switches

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     21692 =C2=B1  5%     -93.0%       1514 =C2=B1 27%  ivb42/unixbench/per=
formance-execl
     21692           -93.0%       1514        GEO-MEAN sched_debug.cfs_rq[3=
7]:/.avg->runnable_avg_sum

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       475 =C2=B1  5%     -93.3%         31 =C2=B1 28%  ivb42/unixbench/per=
formance-execl
       475           -93.3%         31        GEO-MEAN sched_debug.cfs_rq[3=
7]:/.tg_runnable_contrib

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      2944 =C2=B1 26%     -90.2%        288 =C2=B1 45%  ivb42/unixbench/per=
formance-execl
      2943           -90.2%        288        GEO-MEAN sched_debug.cfs_rq[3=
7]:/.tg_load_contrib

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      2841 =C2=B1 29%     -90.1%        281 =C2=B1 42%  ivb42/unixbench/per=
formance-execl
      2841           -90.1%        281        GEO-MEAN sched_debug.cfs_rq[3=
7]:/.blocked_load_avg

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     48940 =C2=B1  5%     -90.0%       4906 =C2=B1 21%  ivb42/unixbench/per=
formance-execl
     48940           -90.0%       4906        GEO-MEAN sched_debug.cfs_rq[3=
7]:/.min_vruntime

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     20714 =C2=B1  5%     -93.0%       1442 =C2=B1  9%  ivb42/unixbench/per=
formance-execl
     20714           -93.0%       1442        GEO-MEAN sched_debug.cfs_rq[3=
7]:/.exec_clock

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     77987 =C2=B1  5%     -94.6%       4187 =C2=B1 11%  ivb42/unixbench/per=
formance-execl
     77987           -94.6%       4187        GEO-MEAN sched_debug.cpu#37.t=
twu_local

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     82036 =C2=B1  4%     -94.5%       4471 =C2=B1 12%  ivb42/unixbench/per=
formance-execl
     82036           -94.5%       4471        GEO-MEAN sched_debug.cpu#37.t=
twu_count

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     79721 =C2=B1  4%     -92.9%       5679 =C2=B1  9%  ivb42/unixbench/per=
formance-execl
     79721           -92.9%       5678        GEO-MEAN sched_debug.cpu#37.s=
ched_goidle

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

    239352 =C2=B1  5%     -91.0%      21655 =C2=B1 43%  ivb42/unixbench/per=
formance-execl
    239352           -91.0%      21655        GEO-MEAN sched_debug.cpu#37.s=
ched_count

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       561 =C2=B1  5%     -89.3%         60 =C2=B1  7%  client7/autotest/pe=
rformance-unixbench
       561           -89.3%         60        GEO-MEAN sched_debug.cpu#10.n=
r_uninterruptible

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       141 =C2=B1 17%    +958.6%       1502 =C2=B1 24%  ivb42/unixbench/per=
formance-execl
       141          +958.6%       1502        GEO-MEAN sched_debug.cfs_rq[2=
4]:/.exec_clock

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      4853 =C2=B1 45%    +265.4%      17735 =C2=B1 13%  ivb42/unixbench/per=
formance-execl
      4853          +265.4%      17735        GEO-MEAN sched_debug.cpu#18.n=
r_switches

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

    237543 =C2=B1  4%     -93.4%      15601 =C2=B1  9%  ivb42/unixbench/per=
formance-execl
    237543           -93.4%      15601        GEO-MEAN sched_debug.cpu#37.n=
r_switches

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       103 =C2=B1 31%   +1259.8%       1408 =C2=B1 15%  ivb42/unixbench/per=
formance-execl
       103         +1259.8%       1408        GEO-MEAN sched_debug.cfs_rq[3=
6]:/.avg->runnable_avg_sum

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

         1 =C2=B1 30%   +1750.0%         29 =C2=B1 16%  ivb42/unixbench/per=
formance-execl
         1         +1750.0%         29        GEO-MEAN sched_debug.cfs_rq[3=
6]:/.tg_runnable_contrib

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       580 =C2=B1  4%     -87.4%         73 =C2=B1 18%  client7/autotest/pe=
rformance-unixbench
       580           -87.4%         72        GEO-MEAN sched_debug.cpu#11.n=
r_uninterruptible

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     60.43 =C2=B1 34%   +2204.0%    1392.25 =C2=B1 14%  ivb42/unixbench/per=
formance-execl
     60.43         +2204.0%    1392.25        GEO-MEAN sched_debug.cfs_rq[3=
6]:/.exec_clock

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

    237456 =C2=B1  5%     -94.8%      12333 =C2=B1  8%  ivb42/unixbench/per=
formance-execl
    237456           -94.8%      12333        GEO-MEAN sched_debug.cpu#25.n=
r_switches

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       125 =C2=B1 30%   +1132.0%       1549 =C2=B1 26%  ivb42/unixbench/per=
formance-execl
       125         +1132.0%       1549        GEO-MEAN sched_debug.cfs_rq[3=
5]:/.avg->runnable_avg_sum

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        76 =C2=B1 10%     -94.0%          4 =C2=B1 29%  ivb42/unixbench/per=
formance-execl
        76           -94.0%          4        GEO-MEAN sched_debug.cpu#25.n=
r_uninterruptible

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

         1 =C2=B1 41%   +1722.2%         32 =C2=B1 27%  ivb42/unixbench/per=
formance-execl
         1         +1722.2%         32        GEO-MEAN sched_debug.cfs_rq[3=
5]:/.tg_runnable_contrib

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       212 =C2=B1 10%     -89.2%         23 =C2=B1 45%  ivb42/unixbench/per=
formance-execl
       212           -89.2%         23        GEO-MEAN sched_debug.cpu#25.c=
pu_load[3]

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     52.35 =C2=B1 28%   +2147.9%    1176.67 =C2=B1  8%  ivb42/unixbench/per=
formance-execl
     52.35         +2147.9%    1176.67        GEO-MEAN sched_debug.cfs_rq[3=
5]:/.exec_clock

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        32 =C2=B1 21%  +10078.9%       3277 =C2=B1 10%  ivb42/unixbench/per=
formance-execl
        32        +10078.9%       3277        GEO-MEAN sched_debug.cpu#35.t=
twu_local

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       189 =C2=B1 47%   +2179.0%       4321 =C2=B1  4%  ivb42/unixbench/per=
formance-execl
       189         +2179.0%       4320        GEO-MEAN sched_debug.cpu#35.s=
ched_goidle

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       221 =C2=B1 10%     -92.7%         16 =C2=B1 37%  ivb42/unixbench/per=
formance-execl
       221           -92.7%         16        GEO-MEAN sched_debug.cpu#25.c=
pu_load[4]

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       415 =C2=B1 43%   +2780.7%      11960 =C2=B1  5%  ivb42/unixbench/per=
formance-execl
       415         +2780.7%      11960        GEO-MEAN sched_debug.cpu#35.n=
r_switches

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       152 =C2=B1 31%    +955.5%       1612 =C2=B1 27%  ivb42/unixbench/per=
formance-execl
       152          +955.5%       1612        GEO-MEAN sched_debug.cfs_rq[3=
4]:/.avg->runnable_avg_sum

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

         2 =C2=B1 42%   +1325.0%         34 =C2=B1 28%  ivb42/unixbench/per=
formance-execl
         2         +1325.0%         34        GEO-MEAN sched_debug.cfs_rq[3=
4]:/.tg_runnable_contrib

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

    118.51 =C2=B1 38%    +908.5%    1195.16 =C2=B1 15%  ivb42/unixbench/per=
formance-execl
    118.51          +908.5%    1195.16        GEO-MEAN sched_debug.cfs_rq[3=
4]:/.exec_clock

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        33 =C2=B1 17%   +9688.1%       3288 =C2=B1 18%  ivb42/unixbench/per=
formance-execl
        33         +9688.1%       3288        GEO-MEAN sched_debug.cpu#34.t=
twu_local

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       104 =C2=B1 25%   +3279.5%       3521 =C2=B1 18%  ivb42/unixbench/per=
formance-execl
       104         +3279.5%       3521        GEO-MEAN sched_debug.cpu#34.t=
twu_count

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     96.86 =C2=B1 33%   +1158.7%    1219.23 =C2=B1 14%  ivb42/unixbench/per=
formance-execl
     96.86         +1158.7%    1219.23        GEO-MEAN sched_debug.cfs_rq[3=
3]:/.exec_clock

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        39 =C2=B1 41%   +8688.2%       3427 =C2=B1 19%  ivb42/unixbench/per=
formance-execl
        38         +8688.2%       3427        GEO-MEAN sched_debug.cpu#33.t=
twu_local

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       102 =C2=B1 16%   +3940.5%       4153 =C2=B1 27%  ivb42/unixbench/per=
formance-execl
       102         +3940.5%       4153        GEO-MEAN sched_debug.cpu#33.t=
twu_count

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

    110098 =C2=B1 46%     -99.6%        387 =C2=B1 40%  ivb42/unixbench/per=
formance-execl
    110098           -99.6%        387        GEO-MEAN cpuidle.C1E-IVT.usage

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     83.33 =C2=B1 25%   +1320.9%    1184.02 =C2=B1 10%  ivb42/unixbench/per=
formance-execl
     83.33         +1320.9%    1184.02        GEO-MEAN sched_debug.cfs_rq[3=
2]:/.exec_clock

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        37 =C2=B1 33%   +8704.3%       3257 =C2=B1 10%  ivb42/unixbench/per=
formance-execl
        36         +8704.3%       3257        GEO-MEAN sched_debug.cpu#32.t=
twu_local

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       128 =C2=B1 34%    +984.6%       1390 =C2=B1  9%  ivb42/unixbench/per=
formance-execl
       128          +984.6%       1390        GEO-MEAN sched_debug.cfs_rq[3=
1]:/.avg->runnable_avg_sum

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

    238673 =C2=B1  4%     -94.4%      13266 =C2=B1 12%  ivb42/unixbench/per=
formance-execl
    238673           -94.4%      13266        GEO-MEAN sched_debug.cpu#25.s=
ched_count

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     79668 =C2=B1  5%     -94.5%       4396 =C2=B1  9%  ivb42/unixbench/per=
formance-execl
     79668           -94.5%       4396        GEO-MEAN sched_debug.cpu#25.s=
ched_goidle

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        32 =C2=B1 19%  +12456.2%       4068 =C2=B1 10%  ivb42/unixbench/per=
formance-execl
        32        +12456.2%       4068        GEO-MEAN sched_debug.cpu#31.t=
twu_local

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     82071 =C2=B1  5%     -95.3%       3841 =C2=B1  7%  ivb42/unixbench/per=
formance-execl
     82071           -95.3%       3841        GEO-MEAN sched_debug.cpu#25.t=
twu_count

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        58 =C2=B1 22%   +5710.2%       3404 =C2=B1  8%  ivb42/unixbench/per=
formance-execl
        58         +5710.2%       3404        GEO-MEAN sched_debug.cpu#30.t=
twu_local

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

         0 =C2=B1  0%      +Inf%          9 =C2=B1 14%  ivb42/unixbench/per=
formance-execl
         0            +Inf%          9        GEO-MEAN sched_debug.cpu#30.c=
pu_load[4]

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

         0 =C2=B1  0%      +Inf%         10 =C2=B1 14%  ivb42/unixbench/per=
formance-execl
         0            +Inf%         10        GEO-MEAN sched_debug.cpu#30.c=
pu_load[3]

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     77932 =C2=B1  5%     -95.5%       3486 =C2=B1  9%  ivb42/unixbench/per=
formance-execl
     77931           -95.5%       3486        GEO-MEAN sched_debug.cpu#25.t=
twu_local

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     21145 =C2=B1  5%     -93.8%       1317 =C2=B1  9%  ivb42/unixbench/per=
formance-execl
     21145           -93.8%       1317        GEO-MEAN sched_debug.cfs_rq[2=
5]:/.exec_clock

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     49475 =C2=B1  5%     -90.7%       4602 =C2=B1 19%  ivb42/unixbench/per=
formance-execl
     49475           -90.7%       4602        GEO-MEAN sched_debug.cfs_rq[2=
5]:/.min_vruntime

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

    111.21 =C2=B1 15%   +1157.8%    1398.82 =C2=B1 28%  ivb42/unixbench/per=
formance-execl
    111.21         +1157.8%    1398.82        GEO-MEAN sched_debug.cfs_rq[2=
9]:/.exec_clock

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        50 =C2=B1 17%   +7189.8%       3703 =C2=B1 29%  ivb42/unixbench/per=
formance-execl
        50         +7189.8%       3703        GEO-MEAN sched_debug.cpu#29.t=
twu_local

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       169 =C2=B1 24%   +2312.8%       4082 =C2=B1 27%  ivb42/unixbench/per=
formance-execl
       169         +2312.8%       4082        GEO-MEAN sched_debug.cpu#29.t=
twu_count

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       227 =C2=B1 26%   +1980.9%       4740 =C2=B1 24%  ivb42/unixbench/per=
formance-execl
       227         +1980.9%       4740        GEO-MEAN sched_debug.cpu#29.s=
ched_goidle

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       523 =C2=B1 25%   +2425.4%      13227 =C2=B1 25%  ivb42/unixbench/per=
formance-execl
       523         +2425.4%      13227        GEO-MEAN sched_debug.cpu#29.n=
r_switches

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       139 =C2=B1 20%    +855.5%       1336 =C2=B1  9%  ivb42/unixbench/per=
formance-execl
       139          +855.5%       1336        GEO-MEAN sched_debug.cfs_rq[2=
8]:/.exec_clock

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       124 =C2=B1 10%   +2742.0%       3535 =C2=B1  8%  ivb42/unixbench/per=
formance-execl
       124         +2742.0%       3535        GEO-MEAN sched_debug.cpu#28.t=
twu_local

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       317 =C2=B1 19%   +1298.1%       4443 =C2=B1 15%  ivb42/unixbench/per=
formance-execl
       317         +1298.1%       4443        GEO-MEAN sched_debug.cpu#28.s=
ched_goidle

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       779 =C2=B1 17%   +1500.4%      12477 =C2=B1 12%  ivb42/unixbench/per=
formance-execl
       779         +1500.4%      12477        GEO-MEAN sched_debug.cpu#28.n=
r_switches

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

         0 =C2=B1  0%      +Inf%         15 =C2=B1 40%  ivb42/unixbench/per=
formance-execl
         0            +Inf%         15        GEO-MEAN sched_debug.cpu#6.cp=
u_load[3]

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

         0 =C2=B1  0%      +Inf%         10 =C2=B1 39%  ivb42/unixbench/per=
formance-execl
         0            +Inf%         10        GEO-MEAN sched_debug.cpu#6.cp=
u_load[4]

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       225 =C2=B1 16%    +609.3%       1602 =C2=B1 25%  ivb42/unixbench/per=
formance-execl
       225          +609.3%       1602        GEO-MEAN sched_debug.cfs_rq[2=
7]:/.exec_clock

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       222 =C2=B1  5%   +1799.9%       4221 =C2=B1 26%  ivb42/unixbench/per=
formance-execl
       222         +1799.9%       4221        GEO-MEAN sched_debug.cpu#27.t=
twu_local

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       760 =C2=B1 13%    +495.6%       4527 =C2=B1 26%  ivb42/unixbench/per=
formance-execl
       760          +495.6%       4527        GEO-MEAN sched_debug.cpu#27.t=
twu_count

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      1597 =C2=B1 46%    +831.1%      14871 =C2=B1 24%  ivb42/unixbench/per=
formance-execl
      1597          +831.1%      14871        GEO-MEAN sched_debug.cpu#27.n=
r_switches

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

         0 =C2=B1  0%      +Inf%          7 =C2=B1 38%  ivb42/unixbench/per=
formance-execl
         0            +Inf%          7        GEO-MEAN sched_debug.cpu#8.cp=
u_load[3]

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

         0 =C2=B1  0%      +Inf%          5 =C2=B1 21%  ivb42/unixbench/per=
formance-execl
         0            +Inf%          5        GEO-MEAN sched_debug.cpu#8.cp=
u_load[4]

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       624 =C2=B1 27%    +519.1%       3868 =C2=B1 18%  ivb42/unixbench/per=
formance-execl
       624          +519.1%       3868        GEO-MEAN sched_debug.cpu#26.t=
twu_local

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       959 =C2=B1 18%    +410.1%       4895 =C2=B1 21%  ivb42/unixbench/per=
formance-execl
       959          +410.1%       4895        GEO-MEAN sched_debug.cpu#26.s=
ched_goidle

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      2541 =C2=B1 18%    +440.2%      13729 =C2=B1 20%  ivb42/unixbench/per=
formance-execl
      2541          +440.2%      13729        GEO-MEAN sched_debug.cpu#26.n=
r_switches

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     22090 =C2=B1  4%     -92.4%       1687 =C2=B1 10%  ivb42/unixbench/per=
formance-execl
     22090           -92.4%       1687        GEO-MEAN sched_debug.cfs_rq[2=
5]:/.avg->runnable_avg_sum

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       484 =C2=B1  4%     -92.6%         36 =C2=B1 10%  ivb42/unixbench/per=
formance-execl
       484           -92.6%         36        GEO-MEAN sched_debug.cfs_rq[2=
5]:/.tg_runnable_contrib

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      3626 =C2=B1 11%     -86.2%        500 =C2=B1 41%  ivb42/unixbench/per=
formance-execl
      3626           -86.2%        500        GEO-MEAN sched_debug.cfs_rq[2=
5]:/.tg_load_contrib

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      3478 =C2=B1 10%     -86.9%        455 =C2=B1 43%  ivb42/unixbench/per=
formance-execl
      3478           -86.9%        455        GEO-MEAN sched_debug.cfs_rq[2=
5]:/.blocked_load_avg

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        38 =C2=B1 35%  +10817.3%       4170 =C2=B1 23%  ivb42/unixbench/per=
formance-execl
        38        +10817.3%       4170        GEO-MEAN sched_debug.cpu#24.t=
twu_local

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       946 =C2=B1 20%    +379.4%       4535 =C2=B1 10%  ivb42/unixbench/per=
formance-execl
       945          +379.4%       4534        GEO-MEAN sched_debug.cpu#39.t=
twu_count

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      2091 =C2=B1 44%    +347.1%       9348 =C2=B1 34%  ivb42/unixbench/per=
formance-execl
      2091          +347.1%       9348        GEO-MEAN sched_debug.cpu#18.t=
twu_count

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        88 =C2=B1 41%    +339.4%        388 =C2=B1 36%  ivb42/unixbench/per=
formance-execl
        88          +339.4%        388        GEO-MEAN sched_debug.cfs_rq[4=
4]:/.blocked_load_avg

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        88 =C2=B1 41%    +341.2%        390 =C2=B1 36%  ivb42/unixbench/per=
formance-execl
        88          +341.2%        390        GEO-MEAN sched_debug.cfs_rq[4=
4]:/.tg_load_contrib

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      1324 =C2=B1 34%    +513.2%       8120 =C2=B1 44%  ivb42/unixbench/per=
formance-execl
      1324          +513.2%       8120        GEO-MEAN sched_debug.cpu#10.t=
twu_count

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      1971 =C2=B1 42%    +321.7%       8312 =C2=B1 29%  ivb42/unixbench/per=
formance-execl
      1971          +321.7%       8312        GEO-MEAN sched_debug.cpu#1.tt=
wu_count

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     46599 =C2=B1  4%     -79.1%       9725 =C2=B1  5%  ivb42/unixbench/per=
formance-execl
     46598           -79.1%       9725        GEO-MEAN sched_debug.cpu#25.n=
r_load_updates

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       191 =C2=B1 27%    +485.9%       1123 =C2=B1 44%  ivb42/unixbench/per=
formance-execl
       191          +485.9%       1123        GEO-MEAN sched_debug.cfs_rq[1=
8]:/.exec_clock

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      2403 =C2=B1 45%    +230.2%       7935 =C2=B1 14%  ivb42/unixbench/per=
formance-execl
      2402          +230.2%       7935        GEO-MEAN sched_debug.cpu#18.s=
ched_goidle

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      1119 =C2=B1 35%    +316.7%       4666 =C2=B1 16%  ivb42/unixbench/per=
formance-execl
      1119          +316.7%       4666        GEO-MEAN sched_debug.cfs_rq[3=
6]:/.min_vruntime

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

         2 =C2=B1 42%    +408.3%         12 =C2=B1 47%  ivb42/unixbench/per=
formance-execl
         2          +408.3%         12        GEO-MEAN sched_debug.cpu#34.c=
pu_load[4]

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      1558 =C2=B1 48%    +437.8%       8380 =C2=B1 16%  ivb42/unixbench/per=
formance-execl
      1558          +437.8%       8380        GEO-MEAN sched_debug.cpu#9.tt=
wu_count

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       230 =C2=B1 11%    +364.3%       1069 =C2=B1 30%  ivb42/unixbench/per=
formance-execl
       230          +364.3%       1069        GEO-MEAN sched_debug.cfs_rq[5=
]:/.exec_clock

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      1008 =C2=B1 21%    +320.3%       4237 =C2=B1 16%  ivb42/unixbench/per=
formance-execl
      1008          +320.3%       4237        GEO-MEAN sched_debug.cpu#26.t=
twu_count

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

         6 =C2=B1 32%    +406.2%         32 =C2=B1 34%  ivb42/unixbench/per=
formance-execl
         6          +406.2%         32        GEO-MEAN sched_debug.cfs_rq[2=
9]:/.tg_runnable_contrib

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      3825 =C2=B1 49%    +306.0%      15529 =C2=B1  4%  ivb42/unixbench/per=
formance-execl
      3825          +306.0%      15529        GEO-MEAN sched_debug.cpu#11.n=
r_switches

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

         5 =C2=B1 35%    +480.8%         30 =C2=B1 27%  ivb42/unixbench/per=
formance-execl
         5          +480.8%         30        GEO-MEAN sched_debug.cfs_rq[3=
0]:/.tg_runnable_contrib

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      1899 =C2=B1 49%    +265.8%       6949 =C2=B1  5%  ivb42/unixbench/per=
formance-execl
      1899          +265.8%       6949        GEO-MEAN sched_debug.cpu#11.s=
ched_goidle

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     46217 =C2=B1  4%     -76.5%      10842 =C2=B1  4%  ivb42/unixbench/per=
formance-execl
     46217           -76.5%      10842        GEO-MEAN sched_debug.cpu#37.n=
r_load_updates

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

         1 =C2=B1 50%    +162.5%          4 =C2=B1 40%  client7/autotest/pe=
rformance-unixbench
         1          +162.5%          4        GEO-MEAN sched_debug.cfs_rq[1=
3]:/.nr_spread_over

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

         1 =C2=B1  0%    +280.0%          3 =C2=B1 42%  client7/autotest/pe=
rformance-unixbench
         1          +280.0%          3        GEO-MEAN sched_debug.cfs_rq[2=
]:/.nr_spread_over

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       247 =C2=B1 39%    +334.2%       1076 =C2=B1 16%  ivb42/unixbench/per=
formance-execl
       247          +334.2%       1076        GEO-MEAN sched_debug.cfs_rq[2=
3]:/.exec_clock

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      1379 =C2=B1 24%    +261.0%       4981 =C2=B1 23%  ivb42/unixbench/per=
formance-execl
      1379          +261.0%       4981        GEO-MEAN sched_debug.cfs_rq[4=
6]:/.min_vruntime

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       136 =C2=B1 33%    +272.5%        508 =C2=B1 39%  ivb42/unixbench/per=
formance-execl
       136          +272.5%        508        GEO-MEAN sched_debug.cfs_rq[4=
2]:/.tg_load_contrib

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

    238919 =C2=B1  0%     -65.3%      82939 =C2=B1  1%  client7/autotest/pe=
rformance-unixbench
    238919           -65.3%      82939        GEO-MEAN sched_debug.cpu#11.t=
twu_local

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     11568 =C2=B1  1%     -64.5%       4102 =C2=B1  4%  client7/autotest/pe=
rformance-unixbench
     11568           -64.5%       4102        GEO-MEAN sched_debug.cfs_rq[1=
1]:/.blocked_load_avg

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

    239165 =C2=B1  0%     -65.9%      81671 =C2=B1  6%  client7/autotest/pe=
rformance-unixbench
    239164           -65.9%      81671        GEO-MEAN sched_debug.cpu#10.t=
twu_local

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       216 =C2=B1 22%    +319.1%        908 =C2=B1  6%  ivb42/unixbench/per=
formance-execl
       216          +319.1%        908        GEO-MEAN sched_debug.cfs_rq[1=
6]:/.exec_clock

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     11671 =C2=B1  1%     -64.3%       4161 =C2=B1  4%  client7/autotest/pe=
rformance-unixbench
     11671           -64.3%       4161        GEO-MEAN sched_debug.cfs_rq[1=
1]:/.tg_load_contrib

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       267 =C2=B1 33%    +431.9%       1424 =C2=B1 26%  ivb42/unixbench/per=
formance-execl
       267          +431.9%       1424        GEO-MEAN sched_debug.cfs_rq[3=
0]:/.avg->runnable_avg_sum

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       328 =C2=B1 29%    +367.4%       1536 =C2=B1 34%  ivb42/unixbench/per=
formance-execl
       328          +367.4%       1536        GEO-MEAN sched_debug.cfs_rq[2=
9]:/.avg->runnable_avg_sum

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     11566 =C2=B1  0%     -61.7%       4426 =C2=B1  5%  client7/autotest/pe=
rformance-unixbench
     11566           -61.7%       4426        GEO-MEAN sched_debug.cfs_rq[1=
0]:/.blocked_load_avg

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     11667 =C2=B1  0%     -61.6%       4479 =C2=B1  5%  client7/autotest/pe=
rformance-unixbench
     11667           -61.6%       4479        GEO-MEAN sched_debug.cfs_rq[1=
0]:/.tg_load_contrib

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       780 =C2=B1 34%    +249.5%       2726 =C2=B1 12%  ivb42/unixbench/per=
formance-execl
       780          +249.5%       2725        GEO-MEAN sched_debug.cpu#16.t=
twu_local

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

    228614 =C2=B1 10%     -59.6%      92280 =C2=B1  9%  client7/autotest/pe=
rformance-unixbench
    228614           -59.6%      92280        GEO-MEAN sched_debug.cfs_rq[1=
1]:/.exec_clock

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     12739 =C2=B1 16%     -73.8%       3334 =C2=B1 16%  client7/autotest/pe=
rformance-unixbench
     12739           -73.8%       3334        GEO-MEAN proc-vmstat.numa_pte=
_updates

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        14 =C2=B1 20%    +112.2%         31 =C2=B1 21%  client7/autotest/pe=
rformance-unixbench
        14          +112.2%         31        GEO-MEAN sched_debug.cpu#0.cp=
u_load[0]

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      1327 =C2=B1 17%    +275.9%       4990 =C2=B1 17%  ivb42/unixbench/per=
formance-execl
      1327          +275.9%       4990        GEO-MEAN sched_debug.cpu#38.s=
ched_goidle

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       273 =C2=B1 14%    +282.8%       1048 =C2=B1 22%  ivb42/unixbench/per=
formance-execl
       273          +282.8%       1048        GEO-MEAN sched_debug.cfs_rq[1=
]:/.exec_clock

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       230 =C2=B1  5%     -54.3%        105 =C2=B1 10%  client7/autotest/pe=
rformance-unixbench
       230           -54.3%        105        GEO-MEAN sched_debug.cfs_rq[1=
1]:/.tg_runnable_contrib

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     10582 =C2=B1  5%     -54.0%       4868 =C2=B1 10%  client7/autotest/pe=
rformance-unixbench
     10582           -54.0%       4868        GEO-MEAN sched_debug.cfs_rq[1=
1]:/.avg->runnable_avg_sum

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      1980 =C2=B1  8%    +102.2%       4005 =C2=B1  7%  client7/autotest/pe=
rformance-unixbench
      1980          +102.2%       4005        GEO-MEAN sched_debug.cfs_rq[1=
]:/.blocked_load_avg

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      2015 =C2=B1  8%    +101.6%       4062 =C2=B1  7%  client7/autotest/pe=
rformance-unixbench
      2014          +101.6%       4062        GEO-MEAN sched_debug.cfs_rq[1=
]:/.tg_load_contrib

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      6081 =C2=B1 28%    +200.7%      18288 =C2=B1  8%  ivb42/unixbench/per=
formance-execl
      6081          +200.7%      18287        GEO-MEAN sched_debug.cpu#1.nr=
_switches

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

    178606 =C2=B1 27%     -74.1%      46308 =C2=B1 46%  client7/autotest/pe=
rformance-unixbench
    178606           -74.1%      46308        GEO-MEAN sched_debug.cfs_rq[4=
]:/.spread0

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

         8 =C2=B1 48%    +176.2%         23 =C2=B1 20%  client7/autotest/pe=
rformance-unixbench
         8          +176.2%         23        GEO-MEAN sched_debug.cpu#7.cp=
u_load[1]

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      1857 =C2=B1  4%     +91.5%       3556 =C2=B1  6%  client7/autotest/pe=
rformance-unixbench
      1857           +91.5%       3556        GEO-MEAN sched_debug.cfs_rq[3=
]:/.tg_load_contrib

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      1831 =C2=B1  4%     +91.0%       3497 =C2=B1  6%  client7/autotest/pe=
rformance-unixbench
      1830           +91.0%       3497        GEO-MEAN sched_debug.cfs_rq[3=
]:/.blocked_load_avg

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      1863 =C2=B1  7%     +80.2%       3359 =C2=B1  3%  client7/autotest/pe=
rformance-unixbench
      1863           +80.2%       3359        GEO-MEAN sched_debug.cfs_rq[6=
]:/.tg_load_contrib

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      1884 =C2=B1  6%     +80.7%       3406 =C2=B1  3%  client7/autotest/pe=
rformance-unixbench
      1884           +80.7%       3406        GEO-MEAN sched_debug.cfs_rq[7=
]:/.tg_load_contrib

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     48892 =C2=B1  8%     +78.2%      87107 =C2=B1  3%  client7/autotest/pe=
rformance-unixbench
     48892           +78.2%      87107        GEO-MEAN sched_debug.cpu#6.tt=
wu_local

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      1834 =C2=B1  7%     +80.3%       3307 =C2=B1  3%  client7/autotest/pe=
rformance-unixbench
      1834           +80.3%       3307        GEO-MEAN sched_debug.cfs_rq[6=
]:/.blocked_load_avg

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      1865 =C2=B1  6%     +79.7%       3352 =C2=B1  3%  client7/autotest/pe=
rformance-unixbench
      1865           +79.7%       3352        GEO-MEAN sched_debug.cfs_rq[7=
]:/.blocked_load_avg

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      2014 =C2=B1  3%     +77.5%       3575 =C2=B1  8%  client7/autotest/pe=
rformance-unixbench
      2014           +77.5%       3575        GEO-MEAN sched_debug.cfs_rq[5=
]:/.tg_load_contrib

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      1985 =C2=B1  4%     +77.5%       3523 =C2=B1  8%  client7/autotest/pe=
rformance-unixbench
      1985           +77.5%       3523        GEO-MEAN sched_debug.cfs_rq[5=
]:/.blocked_load_avg

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       229 =C2=B1  1%     -42.8%        131 =C2=B1 10%  client7/autotest/pe=
rformance-unixbench
       229           -42.8%        131        GEO-MEAN sched_debug.cfs_rq[1=
0]:/.tg_runnable_contrib

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     10535 =C2=B1  1%     -42.4%       6068 =C2=B1 10%  client7/autotest/pe=
rformance-unixbench
     10535           -42.4%       6068        GEO-MEAN sched_debug.cfs_rq[1=
0]:/.avg->runnable_avg_sum

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        25 =C2=B1 15%     +62.7%         41 =C2=B1 17%  client7/autotest/pe=
rformance-unixbench
        25           +62.7%         41        GEO-MEAN sched_debug.cpu#1.lo=
ad

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     54292 =C2=B1 16%     +61.8%      87856 =C2=B1  5%  client7/autotest/pe=
rformance-unixbench
     54291           +61.8%      87856        GEO-MEAN sched_debug.cpu#7.tt=
wu_local

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      2985 =C2=B1 29%    +176.8%       8262 =C2=B1  9%  ivb42/unixbench/per=
formance-execl
      2985          +176.8%       8262        GEO-MEAN sched_debug.cpu#1.sc=
hed_goidle

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      2734 =C2=B1 18%    +201.9%       8257 =C2=B1  9%  ivb42/unixbench/per=
formance-execl
      2734          +201.9%       8257        GEO-MEAN sched_debug.cpu#0.sc=
hed_goidle

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      1884 =C2=B1  4%     +66.9%       3146 =C2=B1 16%  client7/autotest/pe=
rformance-unixbench
      1884           +66.9%       3146        GEO-MEAN sched_debug.cfs_rq[0=
]:/.tg_load_contrib

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      1862 =C2=B1  4%     +66.7%       3104 =C2=B1 16%  client7/autotest/pe=
rformance-unixbench
      1862           +66.7%       3104        GEO-MEAN sched_debug.cfs_rq[0=
]:/.blocked_load_avg

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      2016 =C2=B1  4%     +56.1%       3147 =C2=B1  9%  client7/autotest/pe=
rformance-unixbench
      2016           +56.1%       3147        GEO-MEAN sched_debug.cfs_rq[4=
]:/.blocked_load_avg

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      2047 =C2=B1  3%     +56.1%       3196 =C2=B1  9%  client7/autotest/pe=
rformance-unixbench
      2046           +56.1%       3196        GEO-MEAN sched_debug.cfs_rq[4=
]:/.tg_load_contrib

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

    224.65 =C2=B1 47%    +269.2%     829.38 =C2=B1  8%  ivb42/unixbench/per=
formance-execl
    224.65          +269.2%     829.38        GEO-MEAN sched_debug.cfs_rq[2=
1]:/.exec_clock

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        57 =C2=B1 10%     -62.5%         21 =C2=B1 28%  client7/autotest/pe=
rformance-unixbench
        57           -62.5%         21        GEO-MEAN sched_debug.cpu#11.c=
pu_load[4]

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

    107353 =C2=B1  1%     -25.9%      79520 =C2=B1  7%  client7/autotest/pe=
rformance-unixbench
        95 =C2=B1 38%   +3152.0%       3089 =C2=B1 34%  ivb42/unixbench/per=
formance-execl
      3193          +390.8%      15673        GEO-MEAN sched_debug.cpu#13.t=
twu_local

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

    106243 =C2=B1  0%     -20.5%      84484 =C2=B1  1%  client7/autotest/pe=
rformance-unixbench
    106243           -20.5%      84484        GEO-MEAN sched_debug.cpu#12.t=
twu_local

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      1980 =C2=B1  4%     +84.2%       3648 =C2=B1 10%  client7/autotest/pe=
rformance-unixbench
      1980           +84.2%       3648        GEO-MEAN sched_debug.cfs_rq[2=
]:/.tg_load_contrib

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      1946 =C2=B1  4%     +84.3%       3587 =C2=B1 10%  client7/autotest/pe=
rformance-unixbench
      1946           +84.3%       3587        GEO-MEAN sched_debug.cfs_rq[2=
]:/.blocked_load_avg

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      1234 =C2=B1 42%    +257.7%       4416 =C2=B1 36%  ivb42/unixbench/per=
formance-execl
      1234          +257.7%       4416        GEO-MEAN sched_debug.cfs_rq[2=
1]:/.min_vruntime

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     71775 =C2=B1  0%     +11.9%      80325 =C2=B1  1%  client7/autotest/pe=
rformance-unixbench
     71774           +11.9%      80325        GEO-MEAN sched_debug.cpu#8.tt=
wu_local

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       419 =C2=B1 14%    +248.4%       1462 =C2=B1 20%  ivb42/unixbench/per=
formance-execl
       419          +248.4%       1462        GEO-MEAN sched_debug.cfs_rq[2=
6]:/.exec_clock

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      5109 =C2=B1 36%    +266.4%      18721 =C2=B1 15%  ivb42/unixbench/per=
formance-execl
      5109          +266.4%      18721        GEO-MEAN sched_debug.cpu#19.n=
r_switches

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      4630 =C2=B1 32%    +194.7%      13648 =C2=B1 15%  ivb42/unixbench/per=
formance-execl
      4630          +194.7%      13647        GEO-MEAN sched_debug.cpu#38.n=
r_switches

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      4886 =C2=B1 44%    +225.4%      15901 =C2=B1 10%  ivb42/unixbench/per=
formance-execl
      4886          +225.4%      15901        GEO-MEAN sched_debug.cpu#10.n=
r_switches

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

  54269.57 =C2=B1 33%     +84.8%  100296.87 =C2=B1 20%  client7/autotest/pe=
rformance-unixbench
    267.61 =C2=B1 43%    +334.0%    1161.48 =C2=B1  8%  ivb42/unixbench/per=
formance-execl
   3810.89          +183.2%   10793.19        GEO-MEAN sched_debug.cfs_rq[7=
]:/.exec_clock

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

         1 =C2=B1  0%    +280.0%          3 =C2=B1 30%  client7/autotest/pe=
rformance-unixbench
         1          +280.0%          3        GEO-MEAN sched_debug.cfs_rq[6=
]:/.nr_spread_over

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

    822656 =C2=B1  3%     -10.1%     739652 =C2=B1  3%  client7/autotest/pe=
rformance-unixbench
      1192 =C2=B1 22%    +372.1%       5630 =C2=B1 37%  ivb42/unixbench/per=
formance-execl
     31323          +106.0%      64535        GEO-MEAN sched_debug.cfs_rq[1=
3]:/.min_vruntime

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      1763 =C2=B1 37%    +135.3%       4148 =C2=B1 13%  ivb42/unixbench/per=
formance-execl
      1763          +135.3%       4148        GEO-MEAN sched_debug.cfs_rq[4=
4]:/.min_vruntime

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      3334 =C2=B1 27%    +165.8%       8862 =C2=B1 18%  ivb42/unixbench/per=
formance-execl
      3333          +165.8%       8862        GEO-MEAN sched_debug.cpu#16.t=
twu_count

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

         9 =C2=B1 46%    +171.1%         24 =C2=B1 15%  client7/autotest/pe=
rformance-unixbench
         9          +171.1%         24        GEO-MEAN sched_debug.cpu#7.cp=
u_load[0]

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      5423 =C2=B1 43%    +268.6%      19991 =C2=B1 30%  ivb42/unixbench/per=
formance-execl
      5423          +268.6%      19991        GEO-MEAN sched_debug.cpu#17.n=
r_switches

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       958 =C2=B1 28%     -62.8%        356 =C2=B1 36%  ivb42/unixbench/per=
formance-execl
       958           -62.8%        356        GEO-MEAN sched_debug.cfs_rq[2=
6]:/.tg_load_contrib

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      2537 =C2=B1 36%    +229.8%       8369 =C2=B1 15%  ivb42/unixbench/per=
formance-execl
      2537          +229.8%       8368        GEO-MEAN sched_debug.cpu#19.s=
ched_goidle

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     59716 =C2=B1  9%     +26.5%      75569 =C2=B1  3%  client7/autotest/pe=
rformance-unixbench
     59716           +26.5%      75569        GEO-MEAN sched_debug.cfs_rq[8=
]:/.exec_clock

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        56 =C2=B1 13%     +80.9%        102 =C2=B1 15%  client7/autotest/pe=
rformance-unixbench
        56           +80.9%        101        GEO-MEAN sched_debug.cfs_rq[7=
]:/.tg_runnable_contrib

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      1461 =C2=B1 13%    +215.2%       4607 =C2=B1 17%  ivb42/unixbench/per=
formance-execl
      1461          +215.2%       4607        GEO-MEAN sched_debug.cfs_rq[4=
5]:/.min_vruntime

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      2429 =C2=B1 45%    +189.9%       7042 =C2=B1  9%  ivb42/unixbench/per=
formance-execl
      2429          +189.9%       7042        GEO-MEAN sched_debug.cpu#10.s=
ched_goidle

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

    104379 =C2=B1 15%     +21.2%     126507 =C2=B1 14%  client7/autotest/pe=
rformance-unixbench
       225 =C2=B1 14%    +302.6%        906 =C2=B1 12%  ivb42/unixbench/per=
formance-execl
      4846          +120.9%      10707        GEO-MEAN sched_debug.cfs_rq[6=
]:/.exec_clock

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       392 =C2=B1 10%    +211.8%       1225 =C2=B1 33%  ivb42/unixbench/per=
formance-execl
       392          +211.8%       1225        GEO-MEAN sched_debug.cfs_rq[3=
]:/.exec_clock

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       934 =C2=B1 29%     -62.9%        347 =C2=B1 33%  ivb42/unixbench/per=
formance-execl
       934           -62.9%        347        GEO-MEAN sched_debug.cfs_rq[2=
6]:/.blocked_load_avg

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      2241 =C2=B1 32%    +105.1%       4596 =C2=B1 26%  ivb42/unixbench/per=
formance-execl
      2241          +105.1%       4596        GEO-MEAN sched_debug.cfs_rq[4=
2]:/.min_vruntime

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

 1.391e+08 =C2=B1  5%    +169.4%  3.746e+08 =C2=B1 10%  client7/autotest/pe=
rformance-unixbench
 1.391e+08          +169.4%  3.746e+08        GEO-MEAN cpuidle.C1E-NHM.time

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       101 =C2=B1  5%     -62.3%         38 =C2=B1  4%  client7/autotest/pe=
rformance-unixbench
       101           -62.3%         38        GEO-MEAN sched_debug.cpu#10.l=
oad

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      5674 =C2=B1 25%    +197.9%      16903 =C2=B1 22%  ivb42/unixbench/per=
formance-execl
      5673          +197.9%      16903        GEO-MEAN sched_debug.cpu#5.nr=
_switches

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      2695 =C2=B1 43%    +222.1%       8680 =C2=B1 24%  ivb42/unixbench/per=
formance-execl
      2694          +222.1%       8680        GEO-MEAN sched_debug.cpu#17.s=
ched_goidle

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     11309 =C2=B1 47%    +114.3%      24239 =C2=B1 19%  ivb42/unixbench/per=
formance-execl
     11309          +114.3%      24239        GEO-MEAN sched_debug.cpu#16.s=
ched_count

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        17 =C2=B1 33%    +122.5%         39 =C2=B1 20%  client7/autotest/pe=
rformance-unixbench
        17          +122.5%         39        GEO-MEAN sched_debug.cfs_rq[1=
3]:/.load

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       104 =C2=B1  1%     -62.5%         39 =C2=B1 10%  client7/autotest/pe=
rformance-unixbench
       103           -62.5%         38        GEO-MEAN sched_debug.cpu#11.l=
oad

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       307 =C2=B1 25%    +204.8%        938 =C2=B1 16%  ivb42/unixbench/per=
formance-execl
       307          +204.8%        938        GEO-MEAN sched_debug.cfs_rq[4=
]:/.exec_clock

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     49504 =C2=B1  9%     +99.6%      98817 =C2=B1  4%  client7/autotest/pe=
rformance-unixbench
       675 =C2=B1 38%    +298.7%       2692 =C2=B1 21%  ivb42/unixbench/per=
formance-execl
      5781          +182.1%      16310        GEO-MEAN sched_debug.cpu#1.tt=
wu_local

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      3018 =C2=B1 33%    +141.0%       7273 =C2=B1 30%  ivb42/unixbench/per=
formance-execl
      3018          +141.0%       7273        GEO-MEAN sched_debug.cpu#5.tt=
wu_count

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      6012 =C2=B1 28%    +195.9%      17793 =C2=B1 13%  ivb42/unixbench/per=
formance-execl
      6012          +195.9%      17793        GEO-MEAN sched_debug.cpu#16.n=
r_switches

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      2626 =C2=B1 13%     +79.7%       4719 =C2=B1 15%  client7/autotest/pe=
rformance-unixbench
      2626           +79.7%       4719        GEO-MEAN sched_debug.cfs_rq[7=
]:/.avg->runnable_avg_sum

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       102 =C2=B1  2%     -62.0%         39 =C2=B1 11%  client7/autotest/pe=
rformance-unixbench
       102           -62.0%         38        GEO-MEAN sched_debug.cfs_rq[1=
1]:/.load

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      1436 =C2=B1 46%    +151.1%       3606 =C2=B1 11%  ivb42/unixbench/per=
formance-execl
      1435          +151.1%       3605        GEO-MEAN sched_debug.cpu#38.t=
twu_local

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       104 =C2=B1  6%     -63.7%         38 =C2=B1  8%  client7/autotest/pe=
rformance-unixbench
       104           -63.7%         37        GEO-MEAN sched_debug.cfs_rq[1=
0]:/.load

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        18 =C2=B1 43%     +70.0%         30 =C2=B1  7%  ivb42/unixbench/per=
formance-execl
        17           +70.0%         30        GEO-MEAN sched_debug.cfs_rq[2=
7]:/.tg_runnable_contrib

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       867 =C2=B1 43%     +68.2%       1459 =C2=B1  7%  ivb42/unixbench/per=
formance-execl
       867           +68.2%       1459        GEO-MEAN sched_debug.cfs_rq[2=
7]:/.avg->runnable_avg_sum

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

    450012 =C2=B1 20%     +64.2%     738924 =C2=B1  9%  client7/autotest/pe=
rformance-unixbench
    450012           +64.2%     738924        GEO-MEAN sched_debug.cfs_rq[7=
]:/.min_vruntime

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        19 =C2=B1 24%    +102.0%         39 =C2=B1 20%  client7/autotest/pe=
rformance-unixbench
        19          +102.0%         39        GEO-MEAN sched_debug.cpu#13.l=
oad

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      3640 =C2=B1 12%    +205.4%      11117 =C2=B1 28%  ivb42/unixbench/per=
formance-execl
      3640          +205.4%      11117        GEO-MEAN sched_debug.cpu#15.t=
twu_count

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        59 =C2=B1  9%     -59.5%         24 =C2=B1 23%  client7/autotest/pe=
rformance-unixbench
        59           -59.5%         24        GEO-MEAN sched_debug.cpu#11.c=
pu_load[3]

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      7898 =C2=B1 11%    +128.2%      18021 =C2=B1 17%  ivb42/unixbench/per=
formance-execl
      7898          +128.2%      18021        GEO-MEAN sched_debug.cpu#15.n=
r_switches

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      1997 =C2=B1 24%    +111.1%       4217 =C2=B1  9%  ivb42/unixbench/per=
formance-execl
      1997          +111.1%       4217        GEO-MEAN sched_debug.cfs_rq[3=
2]:/.min_vruntime

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       110 =C2=B1 42%    +174.4%        302 =C2=B1 33%  ivb42/unixbench/per=
formance-execl
       110          +174.4%        302        GEO-MEAN sched_debug.cfs_rq[4=
7]:/.tg_load_contrib

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       110 =C2=B1 42%    +168.2%        295 =C2=B1 36%  ivb42/unixbench/per=
formance-execl
       110          +168.2%        295        GEO-MEAN sched_debug.cfs_rq[4=
7]:/.blocked_load_avg

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     48605 =C2=B1  8%     +84.7%      89750 =C2=B1  5%  client7/autotest/pe=
rformance-unixbench
       815 =C2=B1 37%    +242.0%       2787 =C2=B1 38%  ivb42/unixbench/per=
formance-execl
      6293          +151.3%      15817        GEO-MEAN sched_debug.cpu#5.tt=
wu_local

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        16 =C2=B1 16%     -59.5%          6 =C2=B1 28%  client7/autotest/pe=
rformance-unixbench
        16           -59.5%          6        GEO-MEAN sched_debug.cfs_rq[1=
1]:/.nr_spread_over

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      2160 =C2=B1 19%    +138.2%       5146 =C2=B1 24%  ivb42/unixbench/per=
formance-execl
      2160          +138.2%       5146        GEO-MEAN sched_debug.cfs_rq[2=
9]:/.min_vruntime

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      2817 =C2=B1 25%    +164.6%       7455 =C2=B1 20%  ivb42/unixbench/per=
formance-execl
      2817          +164.6%       7454        GEO-MEAN sched_debug.cpu#5.sc=
hed_goidle

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      3085 =C2=B1 41%    +187.0%       8856 =C2=B1 35%  ivb42/unixbench/per=
formance-execl
      3085          +187.0%       8856        GEO-MEAN sched_debug.cpu#19.t=
twu_count

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      2986 =C2=B1 28%    +167.6%       7991 =C2=B1 14%  ivb42/unixbench/per=
formance-execl
      2985          +167.6%       7991        GEO-MEAN sched_debug.cpu#16.s=
ched_goidle

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      2292 =C2=B1 17%    +132.5%       5331 =C2=B1 24%  ivb42/unixbench/per=
formance-execl
      2292          +132.5%       5331        GEO-MEAN sched_debug.cfs_rq[3=
0]:/.min_vruntime

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        12 =C2=B1 19%    +112.7%         26 =C2=B1 18%  client7/autotest/pe=
rformance-unixbench
        12          +112.7%         26        GEO-MEAN sched_debug.cfs_rq[0=
]:/.load

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

    232162 =C2=B1  2%     -46.4%     124451 =C2=B1 17%  client7/autotest/pe=
rformance-unixbench
       260 =C2=B1 36%    +271.2%        967 =C2=B1 18%  ivb42/unixbench/per=
formance-execl
      7780           +41.1%      10975        GEO-MEAN sched_debug.cfs_rq[1=
0]:/.exec_clock

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      5168 =C2=B1  6%     -53.9%       2382 =C2=B1 18%  client7/autotest/pe=
rformance-unixbench
      5167           -53.9%       2382        GEO-MEAN sched_debug.cpu#11.c=
urr->pid

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      3908 =C2=B1 11%     +99.8%       7809 =C2=B1 15%  ivb42/unixbench/per=
formance-execl
      3908           +99.8%       7809        GEO-MEAN sched_debug.cpu#15.s=
ched_goidle

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      5455 =C2=B1  7%     -55.2%       2443 =C2=B1  6%  client7/autotest/pe=
rformance-unixbench
      5455           -55.2%       2443        GEO-MEAN sched_debug.cpu#10.c=
urr->pid

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

    101631 =C2=B1 10%     +52.1%     154574 =C2=B1 23%  client7/autotest/pe=
rformance-unixbench
       300 =C2=B1 36%    +214.7%        946 =C2=B1 15%  ivb42/unixbench/per=
formance-execl
      5528          +118.8%      12095        GEO-MEAN sched_debug.cfs_rq[9=
]:/.exec_clock

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        65 =C2=B1 10%     -51.4%         32 =C2=B1  9%  client7/autotest/pe=
rformance-unixbench
        65           -51.4%         32        GEO-MEAN sched_debug.cfs_rq[1=
0]:/.runnable_load_avg

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      4052 =C2=B1  6%    +129.8%       9312 =C2=B1  6%  ivb42/unixbench/per=
formance-execl
      4052          +129.8%       9312        GEO-MEAN sched_debug.cpu#47.n=
r_load_updates

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       972 =C2=B1 13%    +127.9%       2216 =C2=B1 11%  ivb42/unixbench/per=
formance-execl
       972          +127.9%       2216        GEO-MEAN sched_debug.cfs_rq[4=
7]:/.exec_clock

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        64 =C2=B1  7%     -55.2%         29 =C2=B1 17%  client7/autotest/pe=
rformance-unixbench
        64           -55.2%         29        GEO-MEAN sched_debug.cpu#11.c=
pu_load[2]

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        26 =C2=B1 29%    +116.8%         56 =C2=B1 15%  client7/autotest/pe=
rformance-unixbench
        26          +116.8%         56        GEO-MEAN sched_debug.cfs_rq[2=
]:/.load

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       931 =C2=B1 21%     +94.7%       1813 =C2=B1 25%  client7/autotest/pe=
rformance-unixbench
       931           +94.7%       1813        GEO-MEAN sched_debug.cpu#0.cu=
rr->pid

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     10323 =C2=B1 12%    +120.7%      22785 =C2=B1 12%  ivb42/unixbench/per=
formance-execl
     10322          +120.7%      22785        GEO-MEAN sched_debug.cpu#0.nr=
_switches

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        20 =C2=B1 15%    +118.3%         45 =C2=B1  5%  client7/autotest/pe=
rformance-unixbench
        20          +118.3%         45        GEO-MEAN sched_debug.cpu#3.lo=
ad

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

   1424033 =C2=B1  2%     -41.4%     834195 =C2=B1  7%  client7/autotest/pe=
rformance-unixbench
      1214 =C2=B1 44%    +259.0%       4359 =C2=B1 34%  ivb42/unixbench/per=
formance-execl
     41582           +45.0%      60304        GEO-MEAN sched_debug.cfs_rq[1=
0]:/.min_vruntime

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        61 =C2=B1  9%     -48.2%         32 =C2=B1 15%  client7/autotest/pe=
rformance-unixbench
        61           -48.2%         32        GEO-MEAN sched_debug.cfs_rq[1=
1]:/.runnable_load_avg

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      4845 =C2=B1  5%    +106.9%      10024 =C2=B1  7%  ivb42/unixbench/per=
formance-execl
      4845          +106.9%      10024        GEO-MEAN sched_debug.cpu#40.n=
r_load_updates

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      8430 =C2=B1 43%    +234.3%      28182 =C2=B1 48%  ivb42/unixbench/per=
formance-execl
      8430          +234.3%      28182        GEO-MEAN sched_debug.cpu#21.s=
ched_count

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      4805 =C2=B1  5%    +116.2%      10387 =C2=B1  8%  ivb42/unixbench/per=
formance-execl
      4805          +116.2%      10387        GEO-MEAN sched_debug.cpu#36.n=
r_load_updates

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        26 =C2=B1 30%    +113.6%         56 =C2=B1 17%  client7/autotest/pe=
rformance-unixbench
        26          +113.6%         56        GEO-MEAN sched_debug.cpu#2.lo=
ad

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      4996 =C2=B1  5%    +104.8%      10234 =C2=B1  3%  ivb42/unixbench/per=
formance-execl
      4996          +104.8%      10234        GEO-MEAN sched_debug.cpu#31.n=
r_load_updates

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      5039 =C2=B1  5%    +109.8%      10576 =C2=B1  3%  ivb42/unixbench/per=
formance-execl
      5039          +109.8%      10576        GEO-MEAN sched_debug.cpu#39.n=
r_load_updates

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      4489 =C2=B1  6%    +107.8%       9330 =C2=B1  7%  ivb42/unixbench/per=
formance-execl
      4489          +107.8%       9330        GEO-MEAN sched_debug.cpu#46.n=
r_load_updates

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        19 =C2=B1 15%    +143.3%         47 =C2=B1 11%  client7/autotest/pe=
rformance-unixbench
        19          +143.3%         47        GEO-MEAN sched_debug.cfs_rq[3=
]:/.load

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      1.14 =C2=B1 20%     +72.9%       1.97 =C2=B1 13%  client7/autotest/pe=
rformance-unixbench
      1.14           +72.9%       1.97        GEO-MEAN turbostat.%pc3

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      4506 =C2=B1  5%    +112.0%       9556 =C2=B1  6%  ivb42/unixbench/per=
formance-execl
      4506          +112.0%       9556        GEO-MEAN sched_debug.cpu#44.n=
r_load_updates

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      4575 =C2=B1  5%    +116.9%       9922 =C2=B1  9%  ivb42/unixbench/per=
formance-execl
      4575          +116.9%       9921        GEO-MEAN sched_debug.cpu#43.n=
r_load_updates

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     44590 =C2=B1 13%    +105.5%      91634 =C2=B1  4%  client7/autotest/pe=
rformance-unixbench
     44589          +105.5%      91634        GEO-MEAN sched_debug.cpu#2.tt=
wu_local

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      4958 =C2=B1  4%    +104.5%      10138 =C2=B1  7%  ivb42/unixbench/per=
formance-execl
      4958          +104.5%      10138        GEO-MEAN sched_debug.cpu#24.n=
r_load_updates

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      4671 =C2=B1  5%    +131.7%      10826 =C2=B1 25%  ivb42/unixbench/per=
formance-execl
      4671          +131.7%      10826        GEO-MEAN sched_debug.cpu#41.n=
r_load_updates

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       505 =C2=B1  9%     -49.6%        254 =C2=B1  4%  ivb42/unixbench/per=
formance-execl
       505           -49.6%        254        GEO-MEAN slabinfo.kmalloc-32.=
active_slabs

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       505 =C2=B1  9%     -49.6%        254 =C2=B1  4%  ivb42/unixbench/per=
formance-execl
       505           -49.6%        254        GEO-MEAN slabinfo.kmalloc-32.=
num_slabs

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      4474 =C2=B1  5%     +99.3%       8917 =C2=B1  6%  ivb42/unixbench/per=
formance-execl
      4474           +99.3%       8917        GEO-MEAN sched_debug.cpu#45.n=
r_load_updates

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

    670199 =C2=B1  1%     -50.1%     334352 =C2=B1  2%  client7/autotest/pe=
rformance-unixbench
    670199           -50.1%     334352        GEO-MEAN cpuidle.C1E-NHM.usage

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     42580 =C2=B1 10%    +112.1%      90323 =C2=B1  2%  client7/autotest/pe=
rformance-unixbench
      1370 =C2=B1 19%    +126.8%       3109 =C2=B1 36%  ivb42/unixbench/per=
formance-execl
      7639          +119.3%      16758        GEO-MEAN sched_debug.cpu#3.tt=
wu_local

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      8459 =C2=B1  9%    +118.4%      18473 =C2=B1 19%  ivb42/unixbench/per=
formance-execl
      8458          +118.4%      18473        GEO-MEAN sched_debug.cpu#3.nr=
_switches

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      2180 =C2=B1 41%     +83.4%       3997 =C2=B1  9%  ivb42/unixbench/per=
formance-execl
      2180           +83.4%       3997        GEO-MEAN sched_debug.cpu#38.t=
twu_count

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      6695 =C2=B1 17%     +77.4%      11879 =C2=B1  6%  ivb42/unixbench/per=
formance-execl
      6695           +77.4%      11879        GEO-MEAN sched_debug.cpu#22.n=
r_load_updates

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      4682 =C2=B1  8%    +100.4%       9382 =C2=B1  9%  ivb42/unixbench/per=
formance-execl
      4682          +100.4%       9382        GEO-MEAN sched_debug.cpu#42.n=
r_load_updates

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      4827 =C2=B1  8%     +92.3%       9281 =C2=B1 10%  ivb42/unixbench/per=
formance-execl
      4826           +92.3%       9281        GEO-MEAN sched_debug.cpu#33.n=
r_load_updates

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      5061 =C2=B1  5%     +91.6%       9694 =C2=B1  7%  ivb42/unixbench/per=
formance-execl
      5060           +91.6%       9694        GEO-MEAN sched_debug.cpu#28.n=
r_load_updates

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      4768 =C2=B1  7%     +90.9%       9103 =C2=B1  4%  ivb42/unixbench/per=
formance-execl
      4768           +90.9%       9103        GEO-MEAN sched_debug.cpu#35.n=
r_load_updates

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

   1463083 =C2=B1  6%     -48.2%     758024 =C2=B1  2%  client7/autotest/pe=
rformance-unixbench
   1463083           -48.2%     758024        GEO-MEAN sched_debug.cfs_rq[1=
1]:/.min_vruntime

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      4913 =C2=B1  5%    +100.6%       9858 =C2=B1 14%  ivb42/unixbench/per=
formance-execl
      4913          +100.6%       9858        GEO-MEAN sched_debug.cpu#29.n=
r_load_updates

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      2204 =C2=B1 44%     +89.4%       4174 =C2=B1 26%  ivb42/unixbench/per=
formance-execl
      2204           +89.4%       4174        GEO-MEAN sched_debug.cfs_rq[1=
6]:/.min_vruntime

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      4913 =C2=B1  7%     +83.2%       9000 =C2=B1  5%  ivb42/unixbench/per=
formance-execl
      4912           +83.2%       9000        GEO-MEAN sched_debug.cpu#32.n=
r_load_updates

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      2.86 =C2=B1 19%     +97.8%       5.66 =C2=B1 13%  ivb42/unixbench/per=
formance-execl
      2.86           +97.8%       5.66        GEO-MEAN turbostat.%pc2

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     48392 =C2=B1  8%     +82.4%      88281 =C2=B1  0%  client7/autotest/pe=
rformance-unixbench
      1141 =C2=B1 34%    +101.4%       2299 =C2=B1 34%  ivb42/unixbench/per=
formance-execl
      7433           +91.7%      14248        GEO-MEAN sched_debug.cpu#4.tt=
wu_local

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       955 =C2=B1 23%     +93.1%       1845 =C2=B1 11%  client7/autotest/pe=
rformance-unixbench
       955           +93.1%       1845        GEO-MEAN sched_debug.cpu#7.cu=
rr->pid

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

    593481 =C2=B1  7%     +40.0%     830999 =C2=B1  4%  client7/autotest/pe=
rformance-unixbench
      1805 =C2=B1 48%    +221.4%       5804 =C2=B1 28%  ivb42/unixbench/per=
formance-execl
     32737          +112.1%      69452        GEO-MEAN sched_debug.cfs_rq[6=
]:/.min_vruntime

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        16 =C2=B1 24%    +125.0%         37 =C2=B1 20%  client7/autotest/pe=
rformance-unixbench
        16          +125.0%         37        GEO-MEAN sched_debug.cpu#12.l=
oad

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        16 =C2=B1 32%    +117.9%         36 =C2=B1 15%  client7/autotest/pe=
rformance-unixbench
        16          +117.9%         36        GEO-MEAN sched_debug.cfs_rq[1=
2]:/.load

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        78 =C2=B1  7%     -42.2%         45 =C2=B1 22%  client7/autotest/pe=
rformance-unixbench
        78           -42.2%         45        GEO-MEAN sched_debug.cpu#5.lo=
ad

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        16 =C2=B1 49%    +101.2%         33 =C2=B1 26%  ivb42/unixbench/per=
formance-execl
        16          +101.2%         33        GEO-MEAN sched_debug.cfs_rq[2=
8]:/.tg_runnable_contrib

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        73 =C2=B1  6%     -49.2%         37 =C2=B1 13%  client7/autotest/pe=
rformance-unixbench
        73           -49.2%         37        GEO-MEAN sched_debug.cpu#11.c=
pu_load[1]

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        17 =C2=B1 25%     +65.1%         28 =C2=B1 18%  client7/autotest/pe=
rformance-unixbench
        17           +65.1%         28        GEO-MEAN sched_debug.cpu#0.lo=
ad

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      6873 =C2=B1 26%     -44.8%       3792 =C2=B1 11%  ivb42/unixbench/per=
formance-execl
      6873           -44.8%       3792        GEO-MEAN cpuidle.C1-IVT.usage

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      2429 =C2=B1 17%     +89.7%       4609 =C2=B1 17%  ivb42/unixbench/per=
formance-execl
      2429           +89.7%       4609        GEO-MEAN sched_debug.cfs_rq[2=
8]:/.min_vruntime

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      4918 =C2=B1  8%     +85.8%       9137 =C2=B1  7%  ivb42/unixbench/per=
formance-execl
      4918           +85.8%       9137        GEO-MEAN sched_debug.cpu#34.n=
r_load_updates

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      5427 =C2=B1  5%     +95.7%      10624 =C2=B1 15%  ivb42/unixbench/per=
formance-execl
      5427           +95.7%      10624        GEO-MEAN sched_debug.cpu#27.n=
r_load_updates

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       813 =C2=B1 47%     +96.9%       1602 =C2=B1 25%  ivb42/unixbench/per=
formance-execl
       813           +96.9%       1602        GEO-MEAN sched_debug.cfs_rq[2=
8]:/.avg->runnable_avg_sum

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      1572 =C2=B1 18%     +65.7%       2604 =C2=B1 30%  client7/autotest/pe=
rformance-unixbench
      1572           +65.7%       2604        GEO-MEAN sched_debug.cpu#13.c=
urr->pid

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      1191 =C2=B1 12%     +49.3%       1778 =C2=B1  6%  client7/autotest/pe=
rformance-unixbench
      1191           +49.3%       1778        GEO-MEAN sched_debug.cpu#3.cu=
rr->pid

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      7291 =C2=B1 15%     +65.8%      12092 =C2=B1  8%  ivb42/unixbench/per=
formance-execl
      7291           +65.8%      12092        GEO-MEAN sched_debug.cpu#18.n=
r_load_updates

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      7729 =C2=B1 23%    +107.1%      16004 =C2=B1 15%  ivb42/unixbench/per=
formance-execl
      7729          +107.1%      16004        GEO-MEAN sched_debug.cpu#4.nr=
_switches

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        15 =C2=B1 28%     +60.8%         25 =C2=B1 12%  client7/autotest/pe=
rformance-unixbench
        15           +60.8%         25        GEO-MEAN sched_debug.cpu#5.cp=
u_load[0]

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      7235 =C2=B1 18%     +71.1%      12380 =C2=B1  6%  ivb42/unixbench/per=
formance-execl
      7235           +71.1%      12380        GEO-MEAN sched_debug.cpu#20.n=
r_load_updates

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

    399458 =C2=B1  6%     -49.2%     202852 =C2=B1  4%  client7/autotest/pe=
rformance-unixbench
      6979 =C2=B1 14%     +64.3%      11469 =C2=B1  3%  ivb42/unixbench/per=
formance-execl
     52802            -8.7%      48234        GEO-MEAN sched_debug.cpu#11.n=
r_load_updates

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      4185 =C2=B1  9%     +89.8%       7945 =C2=B1 15%  ivb42/unixbench/per=
formance-execl
      4185           +89.8%       7945        GEO-MEAN sched_debug.cpu#3.sc=
hed_goidle

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      1161 =C2=B1 13%     +59.7%       1855 =C2=B1 14%  ivb42/unixbench/per=
formance-execl
      1161           +59.7%       1855        GEO-MEAN sched_debug.cfs_rq[3=
8]:/.avg->runnable_avg_sum

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      5762 =C2=B1  3%     +75.8%      10128 =C2=B1 12%  ivb42/unixbench/per=
formance-execl
      5762           +75.8%      10128        GEO-MEAN sched_debug.cpu#26.n=
r_load_updates

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        24 =C2=B1 14%     +61.5%         39 =C2=B1 15%  ivb42/unixbench/per=
formance-execl
        24           +61.5%         39        GEO-MEAN sched_debug.cfs_rq[3=
8]:/.tg_runnable_contrib

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

    586746 =C2=B1  8%     +70.4%    1000000 =C2=B1  0%  ivb42/unixbench/per=
formance-execl
    586746           +70.4%     999999        GEO-MEAN sched_debug.cpu#25.a=
vg_idle

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        58 =C2=B1  6%     -40.1%         35 =C2=B1 13%  client7/autotest/pe=
rformance-unixbench
        58           -40.1%         34        GEO-MEAN sched_debug.cpu#10.c=
pu_load[4]

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        25 =C2=B1 15%     +65.1%         41 =C2=B1 16%  client7/autotest/pe=
rformance-unixbench
        25           +65.1%         41        GEO-MEAN sched_debug.cfs_rq[1=
]:/.load

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        61 =C2=B1  6%     -38.4%         37 =C2=B1 14%  client7/autotest/pe=
rformance-unixbench
        61           -38.4%         37        GEO-MEAN sched_debug.cpu#10.c=
pu_load[3]

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      7521 =C2=B1 23%     +63.0%      12255 =C2=B1  5%  ivb42/unixbench/per=
formance-execl
      7521           +63.0%      12255        GEO-MEAN sched_debug.cpu#23.n=
r_load_updates

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      6965 =C2=B1  8%     +63.6%      11397 =C2=B1 25%  ivb42/unixbench/per=
formance-execl
      6964           +63.6%      11397        GEO-MEAN sched_debug.cpu#0.tt=
wu_count

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      3842 =C2=B1 23%     +84.9%       7104 =C2=B1 15%  ivb42/unixbench/per=
formance-execl
      3841           +84.9%       7103        GEO-MEAN sched_debug.cpu#4.sc=
hed_goidle

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

         3 =C2=B1 14%    +105.9%          7 =C2=B1 36%  client7/autotest/pe=
rformance-unixbench
         3          +105.9%          6        GEO-MEAN sched_debug.cfs_rq[3=
]:/.nr_spread_over

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     14.19 =C2=B1  1%      -9.2%      12.88 =C2=B1  1%  client7/autotest/pe=
rformance-unixbench
      5.54 =C2=B1 16%     -54.6%       2.52 =C2=B1 30%  ivb42/unixbench/per=
formance-execl
      8.86           -35.8%       5.69        GEO-MEAN turbostat.%pc6

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        72 =C2=B1  7%     -38.5%         44 =C2=B1 18%  client7/autotest/pe=
rformance-unixbench
        72           -38.5%         44        GEO-MEAN sched_debug.cfs_rq[5=
]:/.load

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        19 =C2=B1 23%     +53.7%         29 =C2=B1 17%  client7/autotest/pe=
rformance-unixbench
        18           +53.7%         29        GEO-MEAN sched_debug.cpu#6.cp=
u_load[0]

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       798 =C2=B1 15%     +41.2%       1126 =C2=B1 20%  ivb42/unixbench/per=
formance-execl
       798           +41.2%       1126        GEO-MEAN sched_debug.cfs_rq[1=
5]:/.avg->runnable_avg_sum

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      3774 =C2=B1 14%     +84.6%       6967 =C2=B1 31%  ivb42/unixbench/per=
formance-execl
      3774           +84.6%       6967        GEO-MEAN sched_debug.cpu#3.tt=
wu_count

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        16 =C2=B1 16%     +43.9%         23 =C2=B1 20%  ivb42/unixbench/per=
formance-execl
        16           +43.9%         23        GEO-MEAN sched_debug.cfs_rq[1=
5]:/.tg_runnable_contrib

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

    671065 =C2=B1  5%     +20.0%     804997 =C2=B1  5%  client7/autotest/pe=
rformance-unixbench
    671065           +20.0%     804997        GEO-MEAN sched_debug.cfs_rq[5=
]:/.min_vruntime

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      1514 =C2=B1 20%     +56.4%       2368 =C2=B1 24%  client7/autotest/pe=
rformance-unixbench
      1514           +56.4%       2368        GEO-MEAN sched_debug.cpu#12.c=
urr->pid

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       597 =C2=B1 23%     +85.9%       1110 =C2=B1 27%  ivb42/unixbench/per=
formance-execl
       597           +85.9%       1110        GEO-MEAN sched_debug.cfs_rq[2=
]:/.exec_clock

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        74 =C2=B1  8%     -39.3%         45 =C2=B1 14%  client7/autotest/pe=
rformance-unixbench
        74           -39.3%         45        GEO-MEAN sched_debug.cpu#10.c=
pu_load[1]

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

    170819 =C2=B1  3%     +16.8%     199577 =C2=B1  5%  client7/autotest/pe=
rformance-unixbench
      6864 =C2=B1 20%     +90.1%      13046 =C2=B1  3%  ivb42/unixbench/per=
formance-execl
     34241           +49.0%      51027        GEO-MEAN sched_debug.cpu#13.n=
r_load_updates

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      7604 =C2=B1 21%     +57.1%      11947 =C2=B1  5%  ivb42/unixbench/per=
formance-execl
      7604           +57.1%      11947        GEO-MEAN sched_debug.cpu#21.n=
r_load_updates

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        15 =C2=B1 31%     +89.6%         29 =C2=B1 18%  client7/autotest/pe=
rformance-unixbench
        15           +89.6%         29        GEO-MEAN sched_debug.cfs_rq[1=
2]:/.runnable_load_avg

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

    402973 =C2=B1  0%     -40.7%     239098 =C2=B1  7%  client7/autotest/pe=
rformance-unixbench
      7507 =C2=B1 13%     +53.9%      11556 =C2=B1  6%  ivb42/unixbench/per=
formance-execl
     55002            -4.4%      52564        GEO-MEAN sched_debug.cpu#10.n=
r_load_updates

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        87 =C2=B1  7%     -40.7%         51 =C2=B1 13%  client7/autotest/pe=
rformance-unixbench
        87           -40.7%         51        GEO-MEAN sched_debug.cpu#11.c=
pu_load[0]

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      7734 =C2=B1 10%     +59.5%      12336 =C2=B1  7%  ivb42/unixbench/per=
formance-execl
      7734           +59.5%      12336        GEO-MEAN sched_debug.cpu#16.n=
r_load_updates

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     16604 =C2=B1 17%     +41.9%      23555 =C2=B1 14%  ivb42/unixbench/per=
formance-execl
     16604           +41.9%      23555        GEO-MEAN sched_debug.cfs_rq[0=
]:/.tg_load_avg

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      7405 =C2=B1 14%     +67.3%      12390 =C2=B1  7%  ivb42/unixbench/per=
formance-execl
      7405           +67.3%      12390        GEO-MEAN sched_debug.cpu#19.n=
r_load_updates

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     23622 =C2=B1  5%     -10.3%      21198 =C2=B1  7%  client7/autotest/pe=
rformance-unixbench
     64567 =C2=B1  9%     -49.5%      32618 =C2=B1  4%  ivb42/unixbench/per=
formance-execl
     39054           -32.7%      26295        GEO-MEAN slabinfo.kmalloc-32.=
active_objs

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     23804 =C2=B1  5%      -9.6%      21510 =C2=B1  7%  client7/autotest/pe=
rformance-unixbench
     64715 =C2=B1  9%     -49.6%      32618 =C2=B1  4%  ivb42/unixbench/per=
formance-execl
     39249           -32.5%      26488        GEO-MEAN slabinfo.kmalloc-32.=
num_objs

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        66 =C2=B1  7%     -39.0%         40 =C2=B1 13%  client7/autotest/pe=
rformance-unixbench
        66           -39.0%         40        GEO-MEAN sched_debug.cpu#10.c=
pu_load[2]

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        68 =C2=B1  7%     +48.7%        101 =C2=B1 17%  client7/autotest/pe=
rformance-unixbench
        68           +48.7%        101        GEO-MEAN sched_debug.cfs_rq[0=
]:/.tg_runnable_contrib

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      3166 =C2=B1  7%     +48.3%       4694 =C2=B1 17%  client7/autotest/pe=
rformance-unixbench
      3166           +48.3%       4694        GEO-MEAN sched_debug.cfs_rq[0=
]:/.avg->runnable_avg_sum

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      8114 =C2=B1  6%     +54.6%      12544 =C2=B1 11%  ivb42/unixbench/per=
formance-execl
      8114           +54.6%      12543        GEO-MEAN sched_debug.cpu#15.n=
r_load_updates

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       540 =C2=B1 12%     +60.4%        867 =C2=B1 11%  ivb42/unixbench/per=
formance-execl
       540           +60.4%        866        GEO-MEAN slabinfo.mnt_cache.n=
um_objs

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       540 =C2=B1 12%     +60.4%        867 =C2=B1 11%  ivb42/unixbench/per=
formance-execl
       540           +60.4%        866        GEO-MEAN slabinfo.mnt_cache.a=
ctive_objs

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        38 =C2=B1 14%     +57.6%         60 =C2=B1 12%  client7/autotest/pe=
rformance-unixbench
        38           +57.6%         60        GEO-MEAN sched_debug.cpu#7.lo=
ad

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        45 =C2=B1  7%     -38.2%         28 =C2=B1 28%  client7/autotest/pe=
rformance-unixbench
        45           -38.2%         28        GEO-MEAN sched_debug.cfs_rq[1=
5]:/.runnable_load_avg

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

    170701 =C2=B1  6%     +58.3%     270227 =C2=B1 12%  client7/autotest/pe=
rformance-unixbench
      7726 =C2=B1 17%     +55.1%      11979 =C2=B1  7%  ivb42/unixbench/per=
formance-execl
     36316           +56.7%      56896        GEO-MEAN sched_debug.cpu#9.nr=
_load_updates

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       287 =C2=B1 13%     +67.8%        482 =C2=B1  5%  client7/autotest/pe=
rformance-unixbench
       714 =C2=B1 10%     +51.2%       1079 =C2=B1  6%  ivb42/unixbench/per=
formance-execl
       453           +59.3%        721        GEO-MEAN slabinfo.RAW.active_=
objs

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       287 =C2=B1 13%     +67.8%        482 =C2=B1  5%  client7/autotest/pe=
rformance-unixbench
       714 =C2=B1 10%     +51.2%       1079 =C2=B1  6%  ivb42/unixbench/per=
formance-execl
       453           +59.3%        721        GEO-MEAN slabinfo.RAW.num_objs

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        91 =C2=B1 10%     -38.7%         56 =C2=B1 19%  client7/autotest/pe=
rformance-unixbench
        91           -38.7%         56        GEO-MEAN sched_debug.cpu#10.c=
pu_load[0]

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      7499 =C2=B1 15%     +74.9%      13115 =C2=B1 20%  ivb42/unixbench/per=
formance-execl
      7499           +74.9%      13115        GEO-MEAN sched_debug.cpu#17.n=
r_load_updates

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      1228 =C2=B1 20%     +47.7%       1814 =C2=B1  4%  ivb42/unixbench/per=
formance-execl
      1228           +47.7%       1814        GEO-MEAN sched_debug.cfs_rq[3=
9]:/.avg->runnable_avg_sum

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      3258 =C2=B1  9%     -31.5%       2231 =C2=B1 12%  client7/autotest/pe=
rformance-unixbench
      3258           -31.5%       2231        GEO-MEAN sched_debug.cpu#15.c=
urr->pid

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

         4 =C2=B1  9%     +85.7%          7 =C2=B1 40%  client7/autotest/pe=
rformance-unixbench
         4           +85.7%          7        GEO-MEAN sched_debug.cfs_rq[0=
]:/.nr_spread_over

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        25 =C2=B1 20%     +48.8%         38 =C2=B1  4%  ivb42/unixbench/per=
formance-execl
        25           +48.8%         38        GEO-MEAN sched_debug.cfs_rq[3=
9]:/.tg_runnable_contrib

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     77564 =C2=B1 14%     +45.8%     113067 =C2=B1 12%  client7/autotest/pe=
rformance-unixbench
     77564           +45.8%     113067        GEO-MEAN sched_debug.cfs_rq[0=
]:/.exec_clock

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      2916 =C2=B1 19%     +51.7%       4422 =C2=B1  9%  ivb42/unixbench/per=
formance-execl
      2916           +51.7%       4422        GEO-MEAN sched_debug.cfs_rq[4=
0]:/.min_vruntime

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        29 =C2=B1 12%     +40.7%         40 =C2=B1 13%  client7/autotest/pe=
rformance-unixbench
        29           +40.7%         40        GEO-MEAN sched_debug.cpu#2.cp=
u_load[0]

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

    199089 =C2=B1  7%     +43.0%     284760 =C2=B1  4%  client7/autotest/pe=
rformance-unixbench
      7976 =C2=B1 10%     +60.7%      12814 =C2=B1  9%  ivb42/unixbench/per=
formance-execl
     39848           +51.6%      60407        GEO-MEAN sched_debug.cpu#0.nr=
_load_updates

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      7883 =C2=B1  9%     +54.0%      12139 =C2=B1 12%  ivb42/unixbench/per=
formance-execl
      7882           +54.0%      12139        GEO-MEAN sched_debug.cpu#5.nr=
_load_updates

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      2924 =C2=B1 32%     +73.2%       5064 =C2=B1 15%  ivb42/unixbench/per=
formance-execl
      2924           +73.2%       5064        GEO-MEAN sched_debug.cfs_rq[4=
7]:/.min_vruntime

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      7.63 =C2=B1  2%     +48.1%      11.29 =C2=B1  1%  client7/autotest/pe=
rformance-unixbench
      7.63           +48.1%      11.29        GEO-MEAN turbostat.%c3

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

    131628 =C2=B1  4%     +37.0%     180310 =C2=B1  2%  client7/autotest/pe=
rformance-unixbench
      7964 =C2=B1 20%     +44.9%      11541 =C2=B1  5%  ivb42/unixbench/per=
formance-execl
     32378           +40.9%      45617        GEO-MEAN sched_debug.cpu#8.nr=
_load_updates

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       529 =C2=B1  3%     -23.8%        403 =C2=B1 16%  client7/autotest/pe=
rformance-unixbench
       529           -23.8%        403        GEO-MEAN slabinfo.xfs_buf.act=
ive_objs

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        39 =C2=B1  6%     -30.8%         27 =C2=B1  8%  client7/autotest/pe=
rformance-unixbench
        39           -30.8%         27        GEO-MEAN sched_debug.cfs_rq[8=
]:/.runnable_load_avg

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       529 =C2=B1  3%     -23.8%        403 =C2=B1 16%  client7/autotest/pe=
rformance-unixbench
       529           -23.8%        403        GEO-MEAN slabinfo.xfs_buf.num=
_objs

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        78 =C2=B1  5%     -26.3%         57 =C2=B1 17%  client7/autotest/pe=
rformance-unixbench
        78           -26.3%         57        GEO-MEAN sched_debug.cpu#4.lo=
ad

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     10001 =C2=B1  3%     -27.0%       7298 =C2=B1  8%  client7/autotest/pe=
rformance-unixbench
     10001           -27.0%       7298        GEO-MEAN slabinfo.kmalloc-192=
.active_objs

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

    399521 =C2=B1  8%     +49.5%     597137 =C2=B1  1%  ivb42/unixbench/per=
formance-execl
    399521           +49.5%     597137        GEO-MEAN cpuidle.C6-IVT.usage

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      6691 =C2=B1 16%     +46.3%       9790 =C2=B1  8%  ivb42/unixbench/per=
formance-execl
      6691           +46.3%       9790        GEO-MEAN sched_debug.cpu#38.n=
r_load_updates

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     92567 =C2=B1  0%     -13.2%      80343 =C2=B1  0%  client7/autotest/pe=
rformance-unixbench
      1350 =C2=B1 15%    +102.1%       2729 =C2=B1 26%  ivb42/unixbench/per=
formance-execl
     11178           +32.5%      14807        GEO-MEAN sched_debug.cpu#15.t=
twu_local

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     16946 =C2=B1 16%     +33.7%      22663 =C2=B1 12%  ivb42/unixbench/per=
formance-execl
     16946           +33.7%      22663        GEO-MEAN sched_debug.cfs_rq[1=
]:/.tg_load_avg

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     10196 =C2=B1  2%     -26.6%       7486 =C2=B1  7%  client7/autotest/pe=
rformance-unixbench
     10195           -26.6%       7486        GEO-MEAN slabinfo.kmalloc-192=
.num_objs

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

    567017 =C2=B1  6%     +41.7%     803670 =C2=B1  3%  client7/autotest/pe=
rformance-unixbench
    567017           +41.7%     803670        GEO-MEAN sched_debug.cfs_rq[0=
]:/.min_vruntime

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        45 =C2=B1 10%     -30.6%         31 =C2=B1 22%  client7/autotest/pe=
rformance-unixbench
        45           -30.6%         31        GEO-MEAN sched_debug.cfs_rq[1=
5]:/.load

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

    240910 =C2=B1  8%     +26.7%     305311 =C2=B1  5%  client7/autotest/pe=
rformance-unixbench
      8061 =C2=B1 19%     +43.3%      11552 =C2=B1  4%  ivb42/unixbench/per=
formance-execl
     44070           +34.8%      59388        GEO-MEAN sched_debug.cpu#6.nr=
_load_updates

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        38 =C2=B1  5%     +40.9%         54 =C2=B1 14%  client7/autotest/pe=
rformance-unixbench
        38           +40.9%         54        GEO-MEAN sched_debug.cfs_rq[7=
]:/.load

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        22 =C2=B1 21%     +49.1%         34 =C2=B1  8%  client7/autotest/pe=
rformance-unixbench
        22           +49.1%         34        GEO-MEAN sched_debug.cpu#4.cp=
u_load[0]

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        14 =C2=B1 29%     +48.6%         22 =C2=B1 13%  client7/autotest/pe=
rformance-unixbench
        14           +48.6%         22        GEO-MEAN sched_debug.cpu#5.cp=
u_load[1]

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

    226918 =C2=B1  8%     +29.5%     293865 =C2=B1  3%  client7/autotest/pe=
rformance-unixbench
      8569 =C2=B1  7%     +51.2%      12952 =C2=B1 11%  ivb42/unixbench/per=
formance-execl
     44096           +39.9%      61695        GEO-MEAN sched_debug.cpu#3.nr=
_load_updates

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

    180321 =C2=B1  6%     +17.9%     212650 =C2=B1  3%  client7/autotest/pe=
rformance-unixbench
      7462 =C2=B1 19%     +70.8%      12741 =C2=B1 10%  ivb42/unixbench/per=
formance-execl
     36681           +41.9%      52052        GEO-MEAN sched_debug.cpu#12.n=
r_load_updates

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

    192619 =C2=B1 14%     +42.5%     274465 =C2=B1  8%  client7/autotest/pe=
rformance-unixbench
      8830 =C2=B1 24%     +41.2%      12469 =C2=B1  4%  ivb42/unixbench/per=
formance-execl
     41241           +41.9%      58500        GEO-MEAN sched_debug.cpu#7.nr=
_load_updates

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      1511 =C2=B1 12%     +32.2%       1998 =C2=B1 12%  client7/autotest/pe=
rformance-unixbench
      1511           +32.2%       1998        GEO-MEAN sched_debug.cpu#4.cu=
rr->pid

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

    612413 =C2=B1  7%     +32.4%     810895 =C2=B1  4%  client7/autotest/pe=
rformance-unixbench
    612413           +32.4%     810895        GEO-MEAN sched_debug.cfs_rq[3=
]:/.min_vruntime

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      1023 =C2=B1  4%     +30.1%       1332 =C2=B1  7%  ivb42/unixbench/per=
formance-execl
      1023           +30.1%       1332        GEO-MEAN slabinfo.mm_struct.a=
ctive_objs

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      1023 =C2=B1  4%     +30.1%       1332 =C2=B1  7%  ivb42/unixbench/per=
formance-execl
      1023           +30.1%       1332        GEO-MEAN slabinfo.mm_struct.n=
um_objs

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

    653230 =C2=B1  5%     +38.2%     902600 =C2=B1  7%  client7/autotest/pe=
rformance-unixbench
    653230           +38.2%     902600        GEO-MEAN sched_debug.cfs_rq[2=
]:/.min_vruntime

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        25 =C2=B1 26%     +29.6%         32 =C2=B1 10%  client7/autotest/pe=
rformance-unixbench
        24           +29.6%         32        GEO-MEAN sched_debug.cpu#4.cp=
u_load[3]

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        47 =C2=B1  7%     -32.1%         32 =C2=B1 21%  client7/autotest/pe=
rformance-unixbench
        47           -32.1%         32        GEO-MEAN sched_debug.cpu#15.l=
oad

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        24 =C2=B1 23%     +33.9%         33 =C2=B1  9%  client7/autotest/pe=
rformance-unixbench
        24           +33.9%         33        GEO-MEAN sched_debug.cpu#4.cp=
u_load[2]

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      8774 =C2=B1 10%     +35.7%      11908 =C2=B1  8%  ivb42/unixbench/per=
formance-execl
      8774           +35.7%      11908        GEO-MEAN sched_debug.cpu#4.nr=
_load_updates

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       113 =C2=B1  3%     -24.2%         85 =C2=B1  6%  client7/autotest/pe=
rformance-unixbench
       113           -24.2%         85        GEO-MEAN sched_debug.cpu#13.n=
r_uninterruptible

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

    251517 =C2=B1  6%     +15.0%     289276 =C2=B1  4%  client7/autotest/pe=
rformance-unixbench
      7919 =C2=B1  9%     +58.6%      12563 =C2=B1  5%  ivb42/unixbench/per=
formance-execl
     44630           +35.1%      60284        GEO-MEAN sched_debug.cpu#1.nr=
_load_updates

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

 3.665e+09 =C2=B1  0%     +33.4%  4.889e+09 =C2=B1  1%  client7/autotest/pe=
rformance-unixbench
 3.665e+09           +33.4%  4.889e+09        GEO-MEAN cpuidle.C3-NHM.time

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        38 =C2=B1 15%     +26.9%         49 =C2=B1 10%  client7/autotest/pe=
rformance-unixbench
        38           +26.9%         48        GEO-MEAN sched_debug.cpu#12.c=
pu_load[0]

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

    756792 =C2=B1 11%     +25.3%     948522 =C2=B1  4%  ivb42/unixbench/per=
formance-execl
    756792           +25.3%     948522        GEO-MEAN sched_debug.cpu#14.a=
vg_idle

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     13492 =C2=B1  8%     +34.2%      18107 =C2=B1 18%  ivb42/unixbench/per=
formance-execl
     13492           +34.2%      18107        GEO-MEAN sched_debug.cpu#2.nr=
_switches

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     63611 =C2=B1  9%     +43.6%      91355 =C2=B1  4%  client7/autotest/pe=
rformance-unixbench
      4064 =C2=B1  4%     +39.5%       5672 =C2=B1 22%  ivb42/unixbench/per=
formance-execl
     16080           +41.6%      22763        GEO-MEAN sched_debug.cpu#0.tt=
wu_local

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        24 =C2=B1 21%     +38.3%         33 =C2=B1  7%  client7/autotest/pe=
rformance-unixbench
        24           +38.3%         33        GEO-MEAN sched_debug.cpu#4.cp=
u_load[1]

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        41 =C2=B1  8%     -22.0%         32 =C2=B1  8%  client7/autotest/pe=
rformance-unixbench
        41           -22.0%         32        GEO-MEAN sched_debug.cpu#8.lo=
ad

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

    724304 =C2=B1  7%     +36.9%     991722 =C2=B1  0%  ivb42/unixbench/per=
formance-execl
    724304           +36.9%     991722        GEO-MEAN sched_debug.cpu#37.a=
vg_idle

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        16 =C2=B1 25%     +43.8%         23 =C2=B1 14%  client7/autotest/pe=
rformance-unixbench
        15           +43.8%         23        GEO-MEAN sched_debug.cfs_rq[4=
]:/.runnable_load_avg

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        14 =C2=B1  5%     +29.6%         18 =C2=B1  5%  client7/autotest/pe=
rformance-unixbench
        14           +29.6%         18        GEO-MEAN numa-numastat.node0.=
other_node

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

    252858 =C2=B1  7%     +33.4%     337348 =C2=B1  6%  client7/autotest/pe=
rformance-unixbench
     10508 =C2=B1  3%     +21.3%      12744 =C2=B1 10%  ivb42/unixbench/per=
formance-execl
     51546           +27.2%      65569        GEO-MEAN sched_debug.cpu#2.nr=
_load_updates

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        41 =C2=B1  6%     -19.8%         33 =C2=B1  6%  client7/autotest/pe=
rformance-unixbench
        41           -19.8%         33        GEO-MEAN sched_debug.cfs_rq[8=
]:/.load

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      2161 =C2=B1  2%     +23.7%       2673 =C2=B1  5%  ivb42/unixbench/per=
formance-execl
      2161           +23.7%       2672        GEO-MEAN slabinfo.kmalloc-204=
8.active_objs

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      3736 =C2=B1  4%     +28.6%       4803 =C2=B1  1%  ivb42/unixbench/per=
formance-execl
      3736           +28.6%       4803        GEO-MEAN slabinfo.kmalloc-96.=
active_objs

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      3772 =C2=B1  4%     +28.3%       4839 =C2=B1  1%  ivb42/unixbench/per=
formance-execl
      3772           +28.3%       4839        GEO-MEAN slabinfo.kmalloc-96.=
num_objs

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

 2.552e+08 =C2=B1  6%     +32.0%  3.368e+08 =C2=B1 15%  client7/autotest/pe=
rformance-unixbench
 2.552e+08           +32.0%  3.368e+08        GEO-MEAN cpuidle.C1-NHM.time

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        73 =C2=B1  5%     +32.0%         96 =C2=B1  9%  client7/autotest/pe=
rformance-unixbench
        73           +32.0%         96        GEO-MEAN sched_debug.cpu#9.nr=
_uninterruptible

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      7641 =C2=B1 10%     +39.7%      10674 =C2=B1  6%  client7/autotest/pe=
rformance-unixbench
     12833 =C2=B1  7%     +15.5%      14825 =C2=B1  4%  ivb42/unixbench/per=
formance-execl
      9902           +27.0%      12579        GEO-MEAN slabinfo.anon_vma.ac=
tive_objs

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     22311 =C2=B1  9%     +22.2%      27261 =C2=B1  5%  ivb42/unixbench/per=
formance-execl
     22311           +22.2%      27261        GEO-MEAN slabinfo.vm_area_str=
uct.active_objs

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     22445 =C2=B1  9%     +21.5%      27279 =C2=B1  5%  ivb42/unixbench/per=
formance-execl
     22445           +21.5%      27279        GEO-MEAN slabinfo.vm_area_str=
uct.num_objs

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

  12867359 =C2=B1  2%     -20.1%   10282559 =C2=B1  0%  ivb42/unixbench/per=
formance-execl
  12867359           -20.1%   10282558        GEO-MEAN proc-vmstat.pgfree

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

  12867752 =C2=B1  2%     -20.1%   10283113 =C2=B1  0%  ivb42/unixbench/per=
formance-execl
  12867752           -20.1%   10283113        GEO-MEAN proc-vmstat.pgalloc_=
normal

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       509 =C2=B1  9%     +21.5%        619 =C2=B1  5%  ivb42/unixbench/per=
formance-execl
       509           +21.5%        619        GEO-MEAN slabinfo.vm_area_str=
uct.active_slabs

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       509 =C2=B1  9%     +21.5%        619 =C2=B1  5%  ivb42/unixbench/per=
formance-execl
       509           +21.5%        619        GEO-MEAN slabinfo.vm_area_str=
uct.num_slabs

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      2307 =C2=B1  2%     +21.5%       2803 =C2=B1  4%  ivb42/unixbench/per=
formance-execl
      2307           +21.5%       2803        GEO-MEAN slabinfo.kmalloc-204=
8.num_objs

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

   6409789 =C2=B1  1%     -19.8%    5139255 =C2=B1  0%  ivb42/unixbench/per=
formance-execl
   6409788           -19.8%    5139255        GEO-MEAN numa-numastat.node1.=
local_node

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

   6409802 =C2=B1  1%     -19.8%    5139268 =C2=B1  0%  ivb42/unixbench/per=
formance-execl
   6409802           -19.8%    5139268        GEO-MEAN numa-numastat.node1.=
numa_hit

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

  12799106 =C2=B1  2%     -19.8%   10263087 =C2=B1  0%  ivb42/unixbench/per=
formance-execl
  12799106           -19.8%   10263087        GEO-MEAN proc-vmstat.numa_hit

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

  12799085 =C2=B1  2%     -19.8%   10263069 =C2=B1  0%  ivb42/unixbench/per=
formance-execl
  12799084           -19.8%   10263069        GEO-MEAN proc-vmstat.numa_loc=
al

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

   3267835 =C2=B1  2%     -19.3%    2635752 =C2=B1  1%  ivb42/unixbench/per=
formance-execl
   3267835           -19.3%    2635752        GEO-MEAN numa-vmstat.node0.nu=
ma_local

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

  16505318 =C2=B1  2%     -19.4%   13296822 =C2=B1  0%  ivb42/unixbench/per=
formance-execl
  16505318           -19.4%   13296822        GEO-MEAN proc-vmstat.pgfault

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

   6393689 =C2=B1  2%     -19.8%    5129432 =C2=B1  0%  ivb42/unixbench/per=
formance-execl
   6393688           -19.8%    5129432        GEO-MEAN numa-numastat.node0.=
local_node

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

   6393697 =C2=B1  2%     -19.8%    5129439 =C2=B1  0%  ivb42/unixbench/per=
formance-execl
   6393696           -19.8%    5129439        GEO-MEAN numa-numastat.node0.=
numa_hit

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      7.94 =C2=B1  4%     +22.4%       9.71 =C2=B1  4%  ivb42/unixbench/per=
formance-execl
      7.94           +22.4%       9.71        GEO-MEAN turbostat.%c1

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

   3301870 =C2=B1  2%     -18.7%    2685983 =C2=B1  0%  ivb42/unixbench/per=
formance-execl
   3301870           -18.7%    2685983        GEO-MEAN numa-vmstat.node0.nu=
ma_hit

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      7862 =C2=B1 10%     +37.0%      10769 =C2=B1  6%  client7/autotest/pe=
rformance-unixbench
     12951 =C2=B1  7%     +14.5%      14825 =C2=B1  4%  ivb42/unixbench/per=
formance-execl
     10091           +25.2%      12635        GEO-MEAN slabinfo.anon_vma.nu=
m_objs

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

   3291343 =C2=B1  2%     -18.6%    2678738 =C2=B1  0%  ivb42/unixbench/per=
formance-execl
   3291343           -18.6%    2678738        GEO-MEAN numa-vmstat.node1.nu=
ma_hit

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

   3248233 =C2=B1  2%     -18.4%    2651644 =C2=B1  0%  ivb42/unixbench/per=
formance-execl
   3248233           -18.4%    2651644        GEO-MEAN numa-vmstat.node1.nu=
ma_local

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      1468 =C2=B1  8%     +25.0%       1836 =C2=B1  8%  ivb42/unixbench/per=
formance-execl
      1468           +25.0%       1836        GEO-MEAN slabinfo.sock_inode_=
cache.num_objs

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      1468 =C2=B1  8%     +25.0%       1836 =C2=B1  8%  ivb42/unixbench/per=
formance-execl
      1468           +25.0%       1836        GEO-MEAN slabinfo.sock_inode_=
cache.active_objs

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

    170096 =C2=B1  8%     +20.0%     204181 =C2=B1  3%  client7/autotest/pe=
rformance-unixbench
     10037 =C2=B1 10%     +20.1%      12053 =C2=B1  7%  ivb42/unixbench/per=
formance-execl
     41319           +20.1%      49608        GEO-MEAN sched_debug.cpu#14.n=
r_load_updates

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      4102 =C2=B1  0%     -13.6%       3545 =C2=B1  4%  client7/autotest/pe=
rformance-unixbench
      4102           -13.6%       3545        GEO-MEAN slabinfo.kmalloc-256=
.num_objs

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      3862 =C2=B1  2%     -14.4%       3306 =C2=B1  4%  client7/autotest/pe=
rformance-unixbench
      3861           -14.4%       3305        GEO-MEAN slabinfo.kmalloc-256=
.active_objs

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      4147 =C2=B1 11%     +19.1%       4941 =C2=B1  8%  client7/autotest/pe=
rformance-unixbench
      4147           +19.1%       4941        GEO-MEAN sched_debug.cfs_rq[5=
]:/.avg->runnable_avg_sum

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     77070 =C2=B1  5%     -13.7%      66499 =C2=B1  5%  ivb42/unixbench/per=
formance-execl
     77070           -13.7%      66499        GEO-MEAN softirqs.RCU

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

        38 =C2=B1 12%     -19.8%         30 =C2=B1 14%  client7/autotest/pe=
rformance-unixbench
        38           -19.8%         30        GEO-MEAN sched_debug.cfs_rq[1=
4]:/.runnable_load_avg

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

    797923 =C2=B1 16%     +20.1%     958095 =C2=B1  3%  ivb42/unixbench/per=
formance-execl
    797923           +20.1%     958095        GEO-MEAN sched_debug.cpu#15.a=
vg_idle

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      2137 =C2=B1  6%     -12.4%       1871 =C2=B1  2%  client7/autotest/pe=
rformance-unixbench
      2137           -12.4%       1871        GEO-MEAN numa-meminfo.node1.K=
ernelStack

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

    723678 =C2=B1 10%     +17.5%     850484 =C2=B1  5%  client7/autotest/pe=
rformance-unixbench
    723678           +17.5%     850484        GEO-MEAN sched_debug.cfs_rq[1=
]:/.min_vruntime

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     93332 =C2=B1 11%     -15.6%      78792 =C2=B1  7%  ivb42/unixbench/per=
formance-execl
     93332           -15.6%      78792        GEO-MEAN meminfo.Committed_AS

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     90569 =C2=B1  1%     -12.2%      79510 =C2=B1  1%  client7/autotest/pe=
rformance-unixbench
     90569           -12.2%      79510        GEO-MEAN sched_debug.cpu#14.t=
twu_local

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

   6542800 =C2=B1  5%     -12.1%    5754258 =C2=B1  2%  client7/autotest/pe=
rformance-unixbench
   6542800           -12.1%    5754258        GEO-MEAN cpuidle.C3-NHM.usage

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

    745623 =C2=B1  5%     +14.0%     849979 =C2=B1  3%  client7/autotest/pe=
rformance-unixbench
    745623           +14.0%     849979        GEO-MEAN sched_debug.cfs_rq[4=
]:/.min_vruntime

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     16701 =C2=B1 15%     -13.8%      14401 =C2=B1  5%  ivb42/unixbench/per=
formance-execl
     16701           -13.8%      14401        GEO-MEAN sched_debug.cfs_rq[2=
5]:/.tg_load_avg

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      2756 =C2=B1  3%     +10.2%       3037 =C2=B1  1%  ivb42/unixbench/per=
formance-execl
      2756           +10.2%       3037        GEO-MEAN meminfo.PageTables

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

    767213 =C2=B1  1%     +11.1%     851994 =C2=B1  1%  client7/autotest/pe=
rformance-unixbench
    767213           +11.1%     851994        GEO-MEAN sched_debug.cpu#5.av=
g_idle

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     15581 =C2=B1  3%      -7.0%      14483 =C2=B1  4%  ivb42/unixbench/per=
formance-execl
     15580            -7.0%      14483        GEO-MEAN sched_debug.cfs_rq[3=
2]:/.tg_load_avg

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

    833110 =C2=B1  0%     +11.0%     924454 =C2=B1  0%  client7/autotest/pe=
rformance-unixbench
    833110           +11.0%     924454        GEO-MEAN sched_debug.cpu#11.a=
vg_idle

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

    869770 =C2=B1  5%      +8.5%     943718 =C2=B1  4%  ivb42/unixbench/per=
formance-execl
    869770            +8.5%     943718        GEO-MEAN sched_debug.cpu#2.av=
g_idle

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     15656 =C2=B1  3%      -7.2%      14527 =C2=B1  4%  ivb42/unixbench/per=
formance-execl
     15656            -7.2%      14527        GEO-MEAN sched_debug.cfs_rq[3=
3]:/.tg_load_avg

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      5013 =C2=B1 13%     +16.4%       5836 =C2=B1  7%  client7/autotest/pe=
rformance-unixbench
      5013           +16.4%       5836        GEO-MEAN sched_debug.cfs_rq[4=
]:/.avg->runnable_avg_sum

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     92323 =C2=B1  3%     -10.4%      82728 =C2=B1  2%  ivb42/unixbench/per=
formance-execl
     92323           -10.4%      82728        GEO-MEAN softirqs.SCHED

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       697 =C2=B1  2%     +10.0%        766 =C2=B1  1%  ivb42/unixbench/per=
formance-execl
       697           +10.0%        766        GEO-MEAN proc-vmstat.nr_page_=
table_pages

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      2014 =C2=B1  0%      -4.0%       1933 =C2=B1  0%  client7/autotest/pe=
rformance-unixbench
      2028 =C2=B1 12%     -34.6%       1325 =C2=B1  4%  ivb42/unixbench/per=
formance-execl
      2021           -20.8%       1600        GEO-MEAN vmstat.system.in

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

 3.701e+08 =C2=B1  0%      -4.9%  3.522e+08 =C2=B1  0%  client7/autotest/pe=
rformance-unixbench
  16100636 =C2=B1  2%     -20.0%   12874053 =C2=B1  0%  ivb42/unixbench/per=
formance-execl
  77195276           -12.8%   67332341        GEO-MEAN time.minor_page_faul=
ts

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

   4170804 =C2=B1  0%      -5.1%    3956976 =C2=B1  0%  client7/autotest/pe=
rformance-unixbench
    340385 =C2=B1  2%     -19.3%     274568 =C2=B1  0%  ivb42/unixbench/per=
formance-execl
   1191503           -12.5%    1042334        GEO-MEAN time.involuntary_con=
text_switches

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

     41415 =C2=B1  0%      -2.4%      40434 =C2=B1  0%  client7/autotest/pe=
rformance-unixbench
     12983 =C2=B1  1%     +13.8%      14775 =C2=B1  0%  ivb42/unixbench/per=
formance-execl
     23188            +5.4%      24442        GEO-MEAN vmstat.system.cs

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      9.26 =C2=B1  0%      -3.2%       8.96 =C2=B1  0%  client7/autotest/pe=
rformance-unixbench
      9.26            -3.2%       8.96        GEO-MEAN turbostat.%c0

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      3319 =C2=B1  0%      -3.2%       3214 =C2=B1  0%  client7/autotest/pe=
rformance-unixbench
      3319            -3.2%       3214        GEO-MEAN time.system_time

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

       138 =C2=B1  0%      -2.7%        135 =C2=B1  0%  client7/autotest/pe=
rformance-unixbench
       138            -2.7%        135        GEO-MEAN time.percent_of_cpu_=
this_job_got

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

  33537415 =C2=B1  0%      -2.7%   32644695 =C2=B1  0%  client7/autotest/pe=
rformance-unixbench
  33537415            -2.7%   32644695        GEO-MEAN time.voluntary_conte=
xt_switches

442bf3aaf55a91eb  83a0a96a5f26d974580fd72510  =

----------------  --------------------------  =

      1099 =C2=B1  0%      -1.4%       1084 =C2=B1  0%  client7/autotest/pe=
rformance-unixbench
      1099            -1.4%       1084        GEO-MEAN time.user_time

ivb42: Ivytown Ivy Bridge-EP
Memory: 64G

client7: Nehalem EP
Memory: 48G



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


Thanks,
Fengguang

_______________________________________________
LKP mailing list
LKP(a)linux.intel.com

--===============5244959127493800835==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiB1bml4YmVuY2gKZGVmYXVsdF9tb25pdG9yczoKICB3YWl0OiBwcmUtdGVz
dAogIHVwdGltZTogCiAgaW9zdGF0OiAKICB2bXN0YXQ6IAogIG51bWEtbnVtYXN0YXQ6IAogIG51
bWEtdm1zdGF0OiAKICBudW1hLW1lbWluZm86IAogIHByb2Mtdm1zdGF0OiAKICBwcm9jLXN0YXQ6
IAogIG1lbWluZm86IAogIHNsYWJpbmZvOiAKICBpbnRlcnJ1cHRzOiAKICBsb2NrX3N0YXQ6IAog
IGxhdGVuY3lfc3RhdHM6IAogIHNvZnRpcnFzOiAKICBiZGlfZGV2X21hcHBpbmc6IAogIGRpc2tz
dGF0czogCiAgZW5lcmd5OiAKICBjcHVpZGxlOiAKICBjcHVmcmVxOiAKICB0dXJib3N0YXQ6IAog
IHNjaGVkX2RlYnVnOgogICAgaW50ZXJ2YWw6IDEwCiAgcG1ldGVyOiAKZGVmYXVsdF93YXRjaGRv
Z3M6CiAgd2F0Y2gtb29tOiAKICB3YXRjaGRvZzogCmNwdWZyZXFfZ292ZXJub3I6Ci0gcG93ZXJz
YXZlCmNvbW1pdDogZjExNDA0MGUzZWE2ZTA3MzcyMzM0YWRlNzVkMWVlMDc3NWMzNTVlMQptb2Rl
bDogR3JhbnRsZXkgSGFzd2VsbApucl9jcHU6IDE2Cm1lbW9yeTogMTZHCmhkZF9wYXJ0aXRpb25z
OiAKc3dhcF9wYXJ0aXRpb25zOiAKcm9vdGZzX3BhcnRpdGlvbjogCnVuaXhiZW5jaDoKICB0ZXN0
OgogIC0gc2hlbGwxCmVucXVldWVfdGltZTogMjAxNC0xMC0xOSAyMzoyNDo1NS41MzMxMzE3MDAg
KzA4OjAwCnRlc3Rib3g6IGxpdHV5YQp0Ym94X2dyb3VwOiBsaXR1eWEKa2NvbmZpZzogeDg2XzY0
LXJoZWwKaGVhZF9jb21taXQ6IDU2MGJmOGY2MzE2NmFmNDVlODBmZWQxYWE4MmFlYTc3MmU3ZjNh
MTIKYmFzZV9jb21taXQ6IGYxMTQwNDBlM2VhNmUwNzM3MjMzNGFkZTc1ZDFlZTA3NzVjMzU1ZTEK
YnJhbmNoOiBsaW51eC1kZXZlbC9kZXZlbC1ob3VybHktMjAxNDEwMjAxOQprZXJuZWw6ICIva2Vy
bmVsL3g4Nl82NC1yaGVsL2YxMTQwNDBlM2VhNmUwNzM3MjMzNGFkZTc1ZDFlZTA3NzVjMzU1ZTEv
dm1saW51ei0zLjE4LjAtcmMxLWdmMTE0MDQwIgp1c2VyOiBsa3AKcXVldWU6IGN5Y2xpYwpyZXN1
bHRfcm9vdDogIi9yZXN1bHQvbGl0dXlhL3VuaXhiZW5jaC9wb3dlcnNhdmUtc2hlbGwxL2RlYmlh
bi14ODZfNjQuY2d6L3g4Nl82NC1yaGVsL2YxMTQwNDBlM2VhNmUwNzM3MjMzNGFkZTc1ZDFlZTA3
NzVjMzU1ZTEvMCIKam9iX2ZpbGU6ICIvbGtwL3NjaGVkdWxlZC9saXR1eWEvY3ljbGljX3VuaXhi
ZW5jaC1wb3dlcnNhdmUtc2hlbGwxLXg4Nl82NC1yaGVsLUJBU0UtZjExNDA0MGUzZWE2ZTA3Mzcy
MzM0YWRlNzVkMWVlMDc3NWMzNTVlMS0wLnlhbWwiCmRlcXVldWVfdGltZTogMjAxNC0xMC0yMCAx
OToxOTo1NS4yNjU5OTIwODggKzA4OjAwCmpvYl9zdGF0ZTogZmluaXNoZWQKbG9hZGF2ZzogMTgu
MzcgMTAuNDkgNC4yNyAxLzE4MyAyNTMzNApzdGFydF90aW1lOiAnMTQxMzgwNDAzNCcKZW5kX3Rp
bWU6ICcxNDEzODA0NDEyJwp2ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0yMDE0MTAyMC0xODAxMzUi
Cg==

--===============5244959127493800835==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZWNobyBwb3dlcnNhdmUgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUwL2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgplY2hvIHBvd2Vyc2F2ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTEvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcG93ZXJzYXZl
ID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTEvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CmVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTIvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MTQvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcG93ZXJz
YXZlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCmVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Mi9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKZWNobyBwb3dlcnNhdmUgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBvd2Vyc2F2ZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTQvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcG93ZXJz
YXZlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKZWNobyBwb3dlcnNhdmUgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2L2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgplY2hvIHBvd2Vyc2F2ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTcvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1OC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwb3dlcnNh
dmUgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgouL1J1biBzaGVsbDEK

--===============5244959127493800835==--

