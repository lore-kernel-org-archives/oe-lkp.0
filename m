Content-Type: multipart/mixed; boundary="===============8194763663386364646=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: [locking/rwsem] b3fd4f03ca0: -11.1% vm-scalability.throughput
Date: Fri, 13 Mar 2015 13:36:00 +0800
Message-ID: <1426224960.6711.228.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8194763663386364646==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
commit b3fd4f03ca0b9952221f39ae6790e698bf4b39e7 ("locking/rwsem: Avoid dece=
iving lock spinners")


testbox/testcase/testparams: brickland3/vm-scalability/performance-300s-sma=
ll-allocs

7a215f89a0335582  b3fd4f03ca0b9952221f39ae67  =

----------------  --------------------------  =

         %stddev     %change         %stddev
             \          |                \  =

      2.38 =C2=B1 18%    +247.4%       8.27 =C2=B1 16%  vm-scalability.stdd=
ev
  24226456 =C2=B1  0%     -23.0%   18650874 =C2=B1  1%  vm-scalability.time=
.voluntary_context_switches
      1622 =C2=B1  0%     -15.6%       1369 =C2=B1  1%  vm-scalability.time=
.system_time
       765 =C2=B1  0%     -13.1%        665 =C2=B1  1%  vm-scalability.time=
.percent_of_cpu_this_job_got
      1036 =C2=B1  0%     -11.9%        914 =C2=B1  1%  vm-scalability.time=
.user_time
 7.244e+08 =C2=B1  0%     -11.1%  6.439e+08 =C2=B1  1%  vm-scalability.time=
.minor_page_faults
  10841276 =C2=B1  0%     -11.1%    9639981 =C2=B1  1%  vm-scalability.thro=
ughput
   8922883 =C2=B1  3%     -70.2%    2658543 =C2=B1  4%  cpuidle.C1-IVT-4S.u=
sage
  1.19e+10 =C2=B1  2%     -66.2%  4.016e+09 =C2=B1  4%  cpuidle.C1-IVT-4S.t=
ime
      1.97 =C2=B1  4%    +106.7%       4.08 =C2=B1  6%  perf-profile.cpu-cy=
cles.intel_idle.cpuidle_enter_state.cpuidle_enter.cpu_startup_entry.start_s=
econdary
     58.29 =C2=B1  1%     -50.2%      29.03 =C2=B1  2%  turbostat.CPU%c1
     34.84 =C2=B1  2%     +86.6%      65.01 =C2=B1  1%  turbostat.CPU%c6
    170814 =C2=B1  7%     -39.9%     102682 =C2=B1 11%  sched_debug.cpu#21.=
sched_goidle
    367762 =C2=B1 11%     -39.9%     220850 =C2=B1 10%  sched_debug.cpu#26.=
sched_count
      5.12 =C2=B1  2%     -39.8%       3.08 =C2=B1  5%  perf-profile.cpu-cy=
cles.osq_lock.rwsem_down_write_failed.call_rwsem_down_write_failed.vma_link=
.mmap_region
    342453 =C2=B1  7%     -39.9%     205985 =C2=B1 11%  sched_debug.cpu#21.=
nr_switches
      3.14 =C2=B1  2%     +68.0%       5.28 =C2=B1  5%  perf-profile.cpu-cy=
cles.cpuidle_enter_state.cpuidle_enter.cpu_startup_entry.start_secondary
    170317 =C2=B1  6%     -39.9%     102389 =C2=B1 11%  sched_debug.cpu#22.=
sched_goidle
    168710 =C2=B1  6%     -38.4%     103876 =C2=B1 11%  sched_debug.cpu#23.=
sched_goidle
    341400 =C2=B1  6%     -39.8%     205416 =C2=B1 11%  sched_debug.cpu#22.=
nr_switches
    338590 =C2=B1  6%     -38.5%     208381 =C2=B1 11%  sched_debug.cpu#23.=
nr_switches
    165879 =C2=B1  4%     -36.6%     105178 =C2=B1 10%  sched_debug.cpu#18.=
sched_goidle
    168958 =C2=B1  6%     -39.0%     103043 =C2=B1 11%  sched_debug.cpu#20.=
sched_goidle
    359148 =C2=B1  5%     -39.2%     218455 =C2=B1 11%  sched_debug.cpu#20.=
sched_count
    332511 =C2=B1  4%     -36.5%     211029 =C2=B1 10%  sched_debug.cpu#18.=
nr_switches
    338875 =C2=B1  6%     -39.0%     206782 =C2=B1 11%  sched_debug.cpu#20.=
nr_switches
    359968 =C2=B1  6%     -39.4%     218057 =C2=B1 12%  sched_debug.cpu#21.=
sched_count
    166207 =C2=B1  4%     -38.5%     102168 =C2=B1 11%  sched_debug.cpu#27.=
sched_goidle
    164881 =C2=B1  6%     -37.0%     103846 =C2=B1 11%  sched_debug.cpu#25.=
sched_goidle
    330721 =C2=B1  6%     -37.0%     208344 =C2=B1 11%  sched_debug.cpu#25.=
nr_switches
    333161 =C2=B1  4%     -38.3%     205591 =C2=B1 11%  sched_debug.cpu#27.=
nr_switches
    362674 =C2=B1  7%     -40.1%     217123 =C2=B1 10%  sched_debug.cpu#22.=
sched_count
    350433 =C2=B1  7%     -37.3%     219595 =C2=B1 13%  sched_debug.cpu#15.=
nr_switches
    174599 =C2=B1  7%     -37.4%     109366 =C2=B1 13%  sched_debug.cpu#15.=
sched_goidle
    174038 =C2=B1  9%     -36.8%     109941 =C2=B1 12%  sched_debug.cpu#17.=
sched_goidle
    348896 =C2=B1  9%     -36.7%     220793 =C2=B1 12%  sched_debug.cpu#17.=
nr_switches
    327443 =C2=B1  6%     -36.8%     207015 =C2=B1 11%  sched_debug.cpu#24.=
nr_switches
    348687 =C2=B1  5%     -37.2%     219100 =C2=B1 11%  sched_debug.cpu#27.=
sched_count
    163220 =C2=B1  6%     -36.9%     103066 =C2=B1 11%  sched_debug.cpu#24.=
sched_goidle
    167997 =C2=B1  5%     -35.7%     108017 =C2=B1 11%  sched_debug.cpu#16.=
sched_goidle
    365757 =C2=B1 10%     -38.9%     223561 =C2=B1 12%  sched_debug.cpu#28.=
sched_count
    336756 =C2=B1  5%     -35.6%     216751 =C2=B1 11%  sched_debug.cpu#16.=
nr_switches
    174236 =C2=B1 12%     -40.6%     103542 =C2=B1 10%  sched_debug.cpu#26.=
sched_goidle
    349494 =C2=B1 12%     -40.6%     207718 =C2=B1 10%  sched_debug.cpu#26.=
nr_switches
    175130 =C2=B1 10%     -39.7%     105573 =C2=B1 13%  sched_debug.cpu#28.=
sched_goidle
    351090 =C2=B1 10%     -39.6%     212090 =C2=B1 13%  sched_debug.cpu#28.=
nr_switches
    350972 =C2=B1  5%     -35.2%     227402 =C2=B1 10%  sched_debug.cpu#19.=
sched_count
    343794 =C2=B1  5%     -36.2%     219297 =C2=B1 10%  sched_debug.cpu#24.=
sched_count
    347268 =C2=B1  5%     -36.3%     221228 =C2=B1 10%  sched_debug.cpu#25.=
sched_count
    352999 =C2=B1  5%     -34.1%     232554 =C2=B1  9%  sched_debug.cpu#16.=
sched_count
    354362 =C2=B1  7%     -37.0%     223292 =C2=B1 10%  sched_debug.cpu#23.=
sched_count
    166091 =C2=B1  7%     -36.6%     105356 =C2=B1 14%  sched_debug.cpu#29.=
sched_goidle
    350840 =C2=B1  6%     -35.5%     226331 =C2=B1 13%  sched_debug.cpu#29.=
sched_count
    332928 =C2=B1  7%     -36.4%     211785 =C2=B1 14%  sched_debug.cpu#29.=
nr_switches
    369396 =C2=B1  7%     -36.4%     234822 =C2=B1 13%  sched_debug.cpu#15.=
sched_count
    364063 =C2=B1  9%     -34.6%     238151 =C2=B1 11%  sched_debug.cpu#17.=
sched_count
    349193 =C2=B1  4%     -35.2%     226315 =C2=B1  9%  sched_debug.cpu#18.=
sched_count
      3.94 =C2=B1  1%     +49.9%       5.90 =C2=B1  5%  perf-profile.cpu-cy=
cles.cpuidle_enter.cpu_startup_entry.start_secondary
   5361900 =C2=B1  1%     +50.5%    8067121 =C2=B1  0%  cpuidle.C6-IVT-4S.u=
sage
    166471 =C2=B1  5%     -36.3%     106063 =C2=B1 10%  sched_debug.cpu#19.=
sched_goidle
    334078 =C2=B1  5%     -36.3%     212767 =C2=B1 10%  sched_debug.cpu#19.=
nr_switches
    511523 =C2=B1 11%     +40.1%     716466 =C2=B1  9%  sched_debug.cpu#38.=
avg_idle
      5141 =C2=B1 10%     -21.3%       4046 =C2=B1 18%  sched_debug.cfs_rq[=
16]:/.avg->runnable_avg_sum
    185324 =C2=B1  6%     -28.9%     131826 =C2=B1 11%  sched_debug.cpu#43.=
ttwu_count
       111 =C2=B1 10%     -21.6%         87 =C2=B1 18%  sched_debug.cfs_rq[=
16]:/.tg_runnable_contrib
    188387 =C2=B1  5%     -28.4%     134976 =C2=B1 11%  sched_debug.cpu#35.=
ttwu_count
    182306 =C2=B1  7%     -28.0%     131276 =C2=B1  9%  sched_debug.cpu#19.=
ttwu_count
    181618 =C2=B1  5%     -28.6%     129685 =C2=B1 10%  sched_debug.cpu#18.=
ttwu_count
    370815 =C2=B1  7%     -25.5%     276125 =C2=B1 11%  sched_debug.cpu#38.=
sched_count
    178281 =C2=B1  7%     -25.9%     132044 =C2=B1 11%  sched_debug.cpu#38.=
sched_goidle
    181914 =C2=B1  5%     -28.0%     130970 =C2=B1  8%  sched_debug.cpu#16.=
ttwu_count
    357347 =C2=B1  7%     -25.9%     264826 =C2=B1 11%  sched_debug.cpu#38.=
nr_switches
    546593 =C2=B1  7%     +38.6%     757389 =C2=B1  4%  sched_debug.cpu#27.=
avg_idle
    183057 =C2=B1  5%     -27.7%     132439 =C2=B1  8%  sched_debug.cpu#17.=
ttwu_count
    174289 =C2=B1  8%     -25.5%     129871 =C2=B1 13%  sched_debug.cpu#43.=
sched_goidle
    349323 =C2=B1  8%     -25.4%     260438 =C2=B1 13%  sched_debug.cpu#43.=
nr_switches
    187088 =C2=B1  5%     -27.4%     135758 =C2=B1 10%  sched_debug.cpu#36.=
ttwu_count
    190589 =C2=B1  5%     -29.1%     135135 =C2=B1 12%  sched_debug.cpu#33.=
ttwu_count
    179655 =C2=B1 10%     -28.6%     128343 =C2=B1 13%  sched_debug.cpu#44.=
sched_goidle
    367566 =C2=B1 11%     -26.0%     271924 =C2=B1 14%  sched_debug.cpu#43.=
sched_count
    360119 =C2=B1 10%     -28.5%     257380 =C2=B1 13%  sched_debug.cpu#44.=
nr_switches
    177427 =C2=B1  5%     -25.5%     132241 =C2=B1  9%  sched_debug.cpu#20.=
ttwu_count
    187477 =C2=B1  6%     -28.9%     133263 =C2=B1 11%  sched_debug.cpu#39.=
ttwu_count
    187313 =C2=B1  5%     -28.7%     133487 =C2=B1 11%  sched_debug.cpu#41.=
ttwu_count
    192203 =C2=B1  4%     -28.3%     137818 =C2=B1 10%  sched_debug.cpu#31.=
ttwu_count
    183679 =C2=B1  5%     -28.1%     132147 =C2=B1 10%  sched_debug.cpu#44.=
ttwu_count
    367665 =C2=B1  9%     -24.6%     277237 =C2=B1 15%  sched_debug.cpu#42.=
sched_count
    178211 =C2=B1  3%     -26.9%     130348 =C2=B1  8%  sched_debug.cpu#23.=
ttwu_count
    175478 =C2=B1  4%     -25.6%     130478 =C2=B1  9%  sched_debug.cpu#22.=
ttwu_count
    186974 =C2=B1  6%     -27.6%     135310 =C2=B1 10%  sched_debug.cpu#38.=
ttwu_count
    190431 =C2=B1  4%     -28.0%     137033 =C2=B1 11%  sched_debug.cpu#32.=
ttwu_count
    190722 =C2=B1  4%     -28.4%     136639 =C2=B1 10%  sched_debug.cpu#34.=
ttwu_count
    175431 =C2=B1  8%     -25.3%     131079 =C2=B1 12%  sched_debug.cpu#42.=
sched_goidle
    361690 =C2=B1  8%     -24.8%     272015 =C2=B1 13%  sched_debug.cpu#39.=
sched_count
    351619 =C2=B1  8%     -25.2%     262838 =C2=B1 12%  sched_debug.cpu#42.=
nr_switches
    175056 =C2=B1  6%     -24.8%     131564 =C2=B1 12%  sched_debug.cpu#40.=
sched_goidle
    350873 =C2=B1  6%     -24.8%     263820 =C2=B1 12%  sched_debug.cpu#40.=
nr_switches
    173107 =C2=B1  6%     -25.3%     129289 =C2=B1 13%  sched_debug.cpu#37.=
sched_goidle
    346966 =C2=B1  6%     -25.3%     259257 =C2=B1 13%  sched_debug.cpu#37.=
nr_switches
    171359 =C2=B1  7%     -24.8%     128941 =C2=B1 11%  sched_debug.cpu#39.=
sched_goidle
    343474 =C2=B1  7%     -24.7%     258590 =C2=B1 11%  sched_debug.cpu#39.=
nr_switches
    375852 =C2=B1 12%     -28.4%     269206 =C2=B1 15%  sched_debug.cpu#44.=
sched_count
    180303 =C2=B1  8%     -25.0%     135309 =C2=B1 10%  sched_debug.cpu#30.=
sched_goidle
    177803 =C2=B1  5%     -25.3%     132893 =C2=B1  9%  sched_debug.cpu#21.=
ttwu_count
    361386 =C2=B1  8%     -24.9%     271330 =C2=B1 10%  sched_debug.cpu#30.=
nr_switches
    172414 =C2=B1  7%     -24.9%     129400 =C2=B1 13%  sched_debug.cpu#41.=
sched_goidle
    345579 =C2=B1  7%     -24.9%     259489 =C2=B1 13%  sched_debug.cpu#41.=
nr_switches
    373591 =C2=B1  8%     -25.3%     279094 =C2=B1 13%  sched_debug.cpu#31.=
sched_count
    177533 =C2=B1  9%     -26.9%     129812 =C2=B1 12%  sched_debug.cpu#36.=
sched_goidle
    179094 =C2=B1  8%     -26.3%     131936 =C2=B1 11%  sched_debug.cpu#35.=
sched_goidle
    376042 =C2=B1  8%     -26.7%     275458 =C2=B1 12%  sched_debug.cpu#35.=
sched_count
    355841 =C2=B1  9%     -26.8%     260341 =C2=B1 12%  sched_debug.cpu#36.=
nr_switches
    183165 =C2=B1 12%     -29.4%     129301 =C2=B1 13%  sched_debug.cpu#33.=
sched_goidle
    371977 =C2=B1  9%     -27.3%     270521 =C2=B1 13%  sched_debug.cpu#36.=
sched_count
    184524 =C2=B1  5%     -27.3%     134078 =C2=B1 10%  sched_debug.cpu#42.=
ttwu_count
    204591 =C2=B1  7%     -22.5%     158606 =C2=B1 16%  sched_debug.cfs_rq[=
33]:/.min_vruntime
    358950 =C2=B1  8%     -26.3%     264608 =C2=B1 11%  sched_debug.cpu#35.=
nr_switches
    367143 =C2=B1 12%     -29.4%     259297 =C2=B1 13%  sched_debug.cpu#33.=
nr_switches
    184796 =C2=B1  5%     -26.7%     135370 =C2=B1  8%  sched_debug.cpu#15.=
ttwu_count
    560186 =C2=B1  7%     +36.4%     764034 =C2=B1  4%  sched_debug.cpu#15.=
avg_idle
    192024 =C2=B1  5%     -27.6%     138984 =C2=B1  9%  sched_debug.cpu#30.=
ttwu_count
    186661 =C2=B1  5%     -27.9%     134534 =C2=B1 11%  sched_debug.cpu#40.=
ttwu_count
    175890 =C2=B1  4%     -26.4%     129452 =C2=B1  8%  sched_debug.cpu#26.=
ttwu_count
    366664 =C2=B1  8%     -24.7%     276276 =C2=B1 14%  sched_debug.cpu#34.=
sched_count
    186046 =C2=B1  5%     -26.7%     136338 =C2=B1 10%  sched_debug.cpu#37.=
ttwu_count
    173138 =C2=B1  4%     -26.5%     127219 =C2=B1  8%  sched_debug.cpu#28.=
ttwu_count
    231881 =C2=B1  4%     -26.0%     171683 =C2=B1  6%  sched_debug.cpu#48.=
ttwu_count
    229108 =C2=B1  4%     -24.5%     173024 =C2=B1  5%  sched_debug.cpu#47.=
ttwu_count
    545213 =C2=B1  6%     +30.6%     712076 =C2=B1  3%  sched_debug.cpu#39.=
avg_idle
    175780 =C2=B1  8%     -25.0%     131911 =C2=B1 12%  sched_debug.cpu#34.=
sched_goidle
    352325 =C2=B1  8%     -24.9%     264519 =C2=B1 12%  sched_debug.cpu#34.=
nr_switches
    368764 =C2=B1  7%     -25.9%     273326 =C2=B1 13%  sched_debug.cpu#40.=
sched_count
    178369 =C2=B1  7%     -25.3%     133316 =C2=B1 12%  sched_debug.cpu#31.=
sched_goidle
    357523 =C2=B1  7%     -25.2%     267329 =C2=B1 12%  sched_debug.cpu#31.=
nr_switches
    445168 =C2=B1  6%     -21.5%     349498 =C2=B1  7%  sched_debug.cpu#50.=
sched_count
    178502 =C2=B1  3%     -27.0%     130326 =C2=B1  8%  sched_debug.cpu#24.=
ttwu_count
    232438 =C2=B1  4%     -25.2%     173912 =C2=B1  4%  sched_debug.cpu#45.=
ttwu_count
    214980 =C2=B1  6%     -21.3%     169213 =C2=B1  7%  sched_debug.cpu#50.=
sched_goidle
    430801 =C2=B1  6%     -21.3%     339213 =C2=B1  7%  sched_debug.cpu#50.=
nr_switches
    175354 =C2=B1  7%     -25.0%     131440 =C2=B1 12%  sched_debug.cpu#32.=
sched_goidle
    351473 =C2=B1  7%     -25.0%     263573 =C2=B1 12%  sched_debug.cpu#32.=
nr_switches
    175818 =C2=B1  4%     -25.5%     131027 =C2=B1  9%  sched_debug.cpu#25.=
ttwu_count
    562351 =C2=B1  4%     +33.0%     747969 =C2=B1  7%  sched_debug.cpu#17.=
avg_idle
    226274 =C2=B1  5%     -24.6%     170581 =C2=B1  5%  sched_debug.cpu#54.=
ttwu_count
    566741 =C2=B1  5%     +33.2%     754744 =C2=B1  4%  sched_debug.cpu#29.=
avg_idle
    365692 =C2=B1  8%     -24.7%     275497 =C2=B1 14%  sched_debug.cpu#32.=
sched_count
    443973 =C2=B1  6%     -22.1%     345964 =C2=B1  7%  sched_debug.cpu#51.=
sched_count
    360816 =C2=B1  8%     -25.3%     269548 =C2=B1 14%  sched_debug.cpu#41.=
sched_count
    224711 =C2=B1  4%     -24.6%     169414 =C2=B1  6%  sched_debug.cpu#53.=
ttwu_count
    380979 =C2=B1 13%     -28.9%     270783 =C2=B1 14%  sched_debug.cpu#33.=
sched_count
    174502 =C2=B1  4%     -27.0%     127311 =C2=B1  8%  sched_debug.cpu#29.=
ttwu_count
    573889 =C2=B1  4%     +32.2%     758635 =C2=B1  5%  sched_debug.cpu#24.=
avg_idle
    523204 =C2=B1 10%     +29.1%     675536 =C2=B1  9%  sched_debug.cpu#6.a=
vg_idle
    173555 =C2=B1  4%     -25.7%     128988 =C2=B1  8%  sched_debug.cpu#27.=
ttwu_count
    228859 =C2=B1  4%     -25.2%     171229 =C2=B1  6%  sched_debug.cpu#49.=
ttwu_count
    529356 =C2=B1  9%     +32.4%     700872 =C2=B1  6%  sched_debug.cpu#33.=
avg_idle
    565916 =C2=B1  5%     +33.4%     755047 =C2=B1  7%  sched_debug.cpu#23.=
avg_idle
    232257 =C2=B1  3%     -25.1%     173926 =C2=B1  5%  sched_debug.cpu#46.=
ttwu_count
    227954 =C2=B1  4%     -24.3%     172631 =C2=B1  5%  sched_debug.cpu#52.=
ttwu_count
    197241 =C2=B1  5%     -23.5%     150963 =C2=B1  8%  sched_debug.cpu#4.t=
twu_count
    228392 =C2=B1  3%     -24.8%     171779 =C2=B1  6%  sched_debug.cpu#51.=
ttwu_count
    542129 =C2=B1  5%     +28.0%     693751 =C2=B1  6%  sched_debug.cpu#13.=
avg_idle
    364245 =C2=B1  8%     -25.1%     272652 =C2=B1 15%  sched_debug.cpu#37.=
sched_count
    558275 =C2=B1  8%     +36.1%     759570 =C2=B1  6%  sched_debug.cpu#26.=
avg_idle
    225027 =C2=B1  5%     -24.7%     169427 =C2=B1  6%  sched_debug.cpu#57.=
ttwu_count
     17.06 =C2=B1  1%     -23.0%      13.13 =C2=B1  3%  perf-profile.cpu-cy=
cles.call_rwsem_down_write_failed.vma_link.mmap_region.do_mmap_pgoff.vm_mma=
p_pgoff
    197493 =C2=B1  5%     -22.8%     152503 =C2=B1  8%  sched_debug.cpu#2.t=
twu_count
     16.99 =C2=B1  1%     -23.2%      13.05 =C2=B1  3%  perf-profile.cpu-cy=
cles.rwsem_down_write_failed.call_rwsem_down_write_failed.vma_link.mmap_reg=
ion.do_mmap_pgoff
    223164 =C2=B1  4%     -24.7%     168105 =C2=B1  6%  sched_debug.cpu#59.=
ttwu_count
    223884 =C2=B1  4%     -24.6%     168887 =C2=B1  4%  sched_debug.cpu#58.=
ttwu_count
    538073 =C2=B1  6%     +27.8%     687436 =C2=B1  8%  sched_debug.cpu#43.=
avg_idle
    445916 =C2=B1  7%     -22.4%     345938 =C2=B1  6%  sched_debug.cpu#52.=
sched_count
    214967 =C2=B1  6%     -21.9%     167898 =C2=B1  6%  sched_debug.cpu#52.=
sched_goidle
    534156 =C2=B1  9%     +25.2%     668876 =C2=B1  5%  sched_debug.cpu#11.=
avg_idle
    430800 =C2=B1  6%     -21.9%     336561 =C2=B1  6%  sched_debug.cpu#52.=
nr_switches
       117 =C2=B1  8%     -21.7%         91 =C2=B1  5%  sched_debug.cfs_rq[=
36]:/.tg_runnable_contrib
    224801 =C2=B1  4%     -24.0%     170764 =C2=B1  5%  sched_debug.cpu#55.=
ttwu_count
    225103 =C2=B1  4%     -24.9%     168953 =C2=B1  5%  sched_debug.cpu#56.=
ttwu_count
  24226456 =C2=B1  0%     -23.0%   18650874 =C2=B1  1%  time.voluntary_cont=
ext_switches
      5411 =C2=B1  8%     -21.3%       4256 =C2=B1  4%  sched_debug.cfs_rq[=
36]:/.avg->runnable_avg_sum
    212964 =C2=B1  5%     -21.5%     167092 =C2=B1  6%  sched_debug.cpu#51.=
sched_goidle
    426769 =C2=B1  5%     -21.5%     334967 =C2=B1  6%  sched_debug.cpu#51.=
nr_switches
    519159 =C2=B1  4%     +27.0%     659572 =C2=B1  7%  sched_debug.cpu#52.=
avg_idle
    193464 =C2=B1  4%     -22.1%     150665 =C2=B1  7%  sched_debug.cpu#7.t=
twu_count
    226747 =C2=B1  4%     -24.4%     171347 =C2=B1  6%  sched_debug.cpu#50.=
ttwu_count
    572755 =C2=B1  6%     +29.0%     738639 =C2=B1  4%  sched_debug.cpu#25.=
avg_idle
    520910 =C2=B1  7%     +35.0%     703382 =C2=B1  6%  sched_debug.cpu#32.=
avg_idle
 2.696e+10 =C2=B1  1%     +29.0%  3.478e+10 =C2=B1  0%  cpuidle.C6-IVT-4S.t=
ime
    530311 =C2=B1 12%     +31.1%     695099 =C2=B1  5%  sched_debug.cpu#44.=
avg_idle
    204543 =C2=B1  8%     -20.5%     162661 =C2=B1 15%  sched_debug.cfs_rq[=
31]:/.min_vruntime
    484242 =C2=B1  9%     +31.7%     637669 =C2=B1  8%  sched_debug.cpu#47.=
avg_idle
      6.85 =C2=B1  1%     -22.4%       5.32 =C2=B1  3%  perf-profile.cpu-cy=
cles.rwsem_spin_on_owner.rwsem_down_write_failed.call_rwsem_down_write_fail=
ed.vma_link.mmap_region
    528770 =C2=B1  7%     +31.6%     695818 =C2=B1  6%  sched_debug.cpu#40.=
avg_idle
    223475 =C2=B1  4%     -20.9%     176718 =C2=B1  6%  sched_debug.cfs_rq[=
52]:/.min_vruntime
    577331 =C2=B1  4%     +29.2%     745806 =C2=B1  4%  sched_debug.cpu#16.=
avg_idle
    192821 =C2=B1  4%     -23.4%     147763 =C2=B1  8%  sched_debug.cpu#10.=
ttwu_count
    198393 =C2=B1  4%     -23.1%     152635 =C2=B1  7%  sched_debug.cpu#1.t=
twu_count
    572991 =C2=B1  9%     +29.0%     738876 =C2=B1  3%  sched_debug.cpu#18.=
avg_idle
    531346 =C2=B1  5%     +26.8%     673808 =C2=B1  6%  sched_debug.cpu#35.=
avg_idle
    531692 =C2=B1  8%     +30.0%     691275 =C2=B1  7%  sched_debug.cpu#36.=
avg_idle
    573689 =C2=B1  9%     +30.1%     746581 =C2=B1  3%  sched_debug.cpu#28.=
avg_idle
    194767 =C2=B1  3%     -22.1%     151736 =C2=B1  7%  sched_debug.cpu#6.t=
twu_count
    576252 =C2=B1 10%     +29.8%     748134 =C2=B1  5%  sched_debug.cpu#19.=
avg_idle
    189779 =C2=B1  5%     -22.5%     147019 =C2=B1  9%  sched_debug.cpu#13.=
ttwu_count
    574093 =C2=B1  9%     +28.0%     734982 =C2=B1  4%  sched_debug.cpu#22.=
avg_idle
    530896 =C2=B1  7%     +25.4%     665864 =C2=B1  7%  sched_debug.cpu#9.a=
vg_idle
    222143 =C2=B1  5%     -19.0%     179889 =C2=B1  9%  sched_debug.cfs_rq[=
49]:/.min_vruntime
    190106 =C2=B1  5%     -22.4%     147518 =C2=B1  7%  sched_debug.cpu#14.=
ttwu_count
    192933 =C2=B1  3%     -21.8%     150835 =C2=B1  8%  sched_debug.cpu#8.t=
twu_count
    193656 =C2=B1  4%     -22.7%     149678 =C2=B1  8%  sched_debug.cpu#9.t=
twu_count
    196739 =C2=B1  5%     -22.9%     151747 =C2=B1  7%  sched_debug.cpu#3.t=
twu_count
    434909 =C2=B1  6%     -18.4%     354789 =C2=B1  6%  sched_debug.cpu#55.=
sched_count
    194722 =C2=B1  4%     -22.0%     151895 =C2=B1  8%  sched_debug.cpu#5.t=
twu_count
    439285 =C2=B1  7%     -19.7%     352534 =C2=B1  6%  sched_debug.cpu#47.=
sched_count
    585003 =C2=B1  7%     +31.4%     768551 =C2=B1  5%  sched_debug.cpu#20.=
avg_idle
    432219 =C2=B1  7%     -19.5%     347734 =C2=B1  7%  sched_debug.cpu#48.=
sched_count
    224113 =C2=B1  5%     -18.9%     181798 =C2=B1  8%  sched_debug.cfs_rq[=
48]:/.min_vruntime
    534566 =C2=B1  7%     +30.3%     696442 =C2=B1  6%  sched_debug.cpu#31.=
avg_idle
    525194 =C2=B1  6%     +23.5%     648587 =C2=B1  7%  sched_debug.cpu#7.a=
vg_idle
    209128 =C2=B1  6%     -19.4%     168562 =C2=B1  7%  sched_debug.cpu#48.=
sched_goidle
    419098 =C2=B1  6%     -19.4%     337908 =C2=B1  7%  sched_debug.cpu#48.=
nr_switches
    448417 =C2=B1  7%     -19.8%     359813 =C2=B1  6%  sched_debug.cpu#46.=
sched_count
    491962 =C2=B1  8%     +26.7%     623449 =C2=B1  4%  sched_debug.cpu#48.=
avg_idle
    212354 =C2=B1  6%     -19.7%     170477 =C2=B1  5%  sched_debug.cpu#47.=
sched_goidle
    581409 =C2=B1  7%     +23.6%     718790 =C2=B1  4%  sched_debug.cpu#37.=
avg_idle
    194066 =C2=B1  6%     -17.8%     159565 =C2=B1 11%  sched_debug.cfs_rq[=
16]:/.min_vruntime
    425571 =C2=B1  6%     -19.7%     341752 =C2=B1  5%  sched_debug.cpu#47.=
nr_switches
    215882 =C2=B1  7%     -19.5%     173827 =C2=B1  5%  sched_debug.cpu#46.=
sched_goidle
    442267 =C2=B1  6%     -21.4%     347467 =C2=B1  6%  sched_debug.cpu#59.=
sched_count
    432617 =C2=B1  7%     -19.5%     348457 =C2=B1  5%  sched_debug.cpu#46.=
nr_switches
    569496 =C2=B1 11%     +32.0%     751590 =C2=B1  5%  sched_debug.cpu#21.=
avg_idle
    189763 =C2=B1  5%     -22.2%     147705 =C2=B1  8%  sched_debug.cpu#12.=
ttwu_count
    223064 =C2=B1  4%     -19.3%     179906 =C2=B1  5%  sched_debug.cfs_rq[=
53]:/.min_vruntime
    213869 =C2=B1  5%     -21.0%     168888 =C2=B1  5%  sched_debug.cpu#59.=
sched_goidle
    428592 =C2=B1  5%     -21.0%     338537 =C2=B1  5%  sched_debug.cpu#59.=
nr_switches
    441291 =C2=B1  6%     -19.8%     353975 =C2=B1  5%  sched_debug.cpu#45.=
sched_count
    213493 =C2=B1  5%     -19.5%     171778 =C2=B1  5%  sched_debug.cpu#45.=
sched_goidle
    427837 =C2=B1  5%     -19.5%     344360 =C2=B1  5%  sched_debug.cpu#45.=
nr_switches
    191795 =C2=B1  5%     -22.6%     148369 =C2=B1  8%  sched_debug.cpu#11.=
ttwu_count
    194309 =C2=B1  6%     -19.3%     156815 =C2=B1  8%  sched_debug.cfs_rq[=
17]:/.min_vruntime
    221301 =C2=B1  5%     -20.9%     175025 =C2=B1  7%  sched_debug.cfs_rq[=
56]:/.min_vruntime
    538571 =C2=B1  8%     +24.4%     670227 =C2=B1  8%  sched_debug.cpu#3.a=
vg_idle
    223672 =C2=B1  5%     -18.9%     181388 =C2=B1  7%  sched_debug.cfs_rq[=
47]:/.min_vruntime
    425387 =C2=B1  7%     -18.3%     347554 =C2=B1  7%  sched_debug.cpu#54.=
sched_count
    199287 =C2=B1  6%     -21.7%     156117 =C2=B1 12%  sched_debug.cfs_rq[=
15]:/.min_vruntime
      1.00 =C2=B1  5%     -15.8%       0.84 =C2=B1  6%  perf-profile.cpu-cy=
cles.kmem_cache_alloc_trace.perf_event_mmap.mmap_region.do_mmap_pgoff.vm_mm=
ap_pgoff
    385907 =C2=B1  8%     -23.7%     294552 =C2=B1 10%  sched_debug.cpu#6.s=
ched_count
    493228 =C2=B1  5%     +27.4%     628579 =C2=B1  8%  sched_debug.cpu#54.=
avg_idle
    185090 =C2=B1  8%     -23.0%     142559 =C2=B1 10%  sched_debug.cpu#6.s=
ched_goidle
    542727 =C2=B1  8%     +27.5%     691759 =C2=B1  4%  sched_debug.cpu#42.=
avg_idle
    209830 =C2=B1  6%     -18.0%     172096 =C2=B1  6%  sched_debug.cpu#55.=
sched_goidle
    370989 =C2=B1  8%     -23.0%     285813 =C2=B1 10%  sched_debug.cpu#6.n=
r_switches
    420473 =C2=B1  6%     -18.0%     344973 =C2=B1  6%  sched_debug.cpu#55.=
nr_switches
    201389 =C2=B1  4%     -20.7%     159785 =C2=B1  7%  sched_debug.cpu#0.t=
twu_count
    365245 =C2=B1  7%     -20.1%     291843 =C2=B1  9%  sched_debug.cpu#5.s=
ched_count
    176316 =C2=B1  7%     -19.7%     141647 =C2=B1  9%  sched_debug.cpu#5.s=
ched_goidle
    353385 =C2=B1  7%     -19.6%     284000 =C2=B1  9%  sched_debug.cpu#5.n=
r_switches
    430699 =C2=B1  7%     -20.6%     341980 =C2=B1  7%  sched_debug.cpu#53.=
sched_count
    434688 =C2=B1  7%     -17.9%     356994 =C2=B1  7%  sched_debug.cpu#58.=
sched_count
       910 =C2=B1 11%     -15.6%        767 =C2=B1 12%  sched_debug.cpu#34.=
ttwu_local
    194153 =C2=B1  7%     -16.9%     161410 =C2=B1  5%  sched_debug.cfs_rq[=
19]:/.min_vruntime
    435164 =C2=B1 10%     -20.0%     348238 =C2=B1  7%  sched_debug.cpu#56.=
sched_count
     25686 =C2=B1  0%     -18.8%      20849 =C2=B1  1%  softirqs.HRTIMER
    205841 =C2=B1  7%     -18.6%     167608 =C2=B1  6%  sched_debug.cpu#54.=
sched_goidle
    412493 =C2=B1  7%     -18.5%     335995 =C2=B1  6%  sched_debug.cpu#54.=
nr_switches
    209629 =C2=B1  7%     -17.5%     172950 =C2=B1  7%  sched_debug.cpu#58.=
sched_goidle
    420079 =C2=B1  7%     -17.5%     346715 =C2=B1  7%  sched_debug.cpu#58.=
nr_switches
    190909 =C2=B1  5%     -19.3%     154071 =C2=B1  8%  sched_debug.cfs_rq[=
26]:/.min_vruntime
    535739 =C2=B1 10%     +25.8%     674192 =C2=B1  3%  sched_debug.cpu#41.=
avg_idle
    220505 =C2=B1  5%     -17.2%     182496 =C2=B1 10%  sched_debug.cfs_rq[=
57]:/.min_vruntime
    207365 =C2=B1  6%     -19.9%     166054 =C2=B1  7%  sched_debug.cpu#53.=
sched_goidle
    415569 =C2=B1  6%     -19.9%     332885 =C2=B1  7%  sched_debug.cpu#53.=
nr_switches
    433052 =C2=B1  7%     -19.5%     348641 =C2=B1  8%  sched_debug.cpu#57.=
sched_count
    534493 =C2=B1  4%     +25.6%     671066 =C2=B1  4%  sched_debug.cpu#2.a=
vg_idle
      1.02 =C2=B1  2%     -20.2%       0.81 =C2=B1  8%  perf-profile.cpu-cy=
cles.scheduler_tick.update_process_times.tick_sched_handle.tick_sched_timer=
.__run_hrtimer
      5217 =C2=B1 12%     -17.6%       4297 =C2=B1  9%  sched_debug.cfs_rq[=
26]:/.avg->runnable_avg_sum
    209594 =C2=B1  6%     -19.1%     169509 =C2=B1  8%  sched_debug.cpu#57.=
sched_goidle
    420012 =C2=B1  6%     -19.1%     339802 =C2=B1  8%  sched_debug.cpu#57.=
nr_switches
    503208 =C2=B1 10%     +25.5%     631683 =C2=B1  7%  sched_debug.cpu#55.=
avg_idle
       113 =C2=B1 12%     -17.9%         92 =C2=B1  9%  sched_debug.cfs_rq[=
26]:/.tg_runnable_contrib
    549109 =C2=B1  5%     +22.6%     673144 =C2=B1  6%  sched_debug.cpu#14.=
avg_idle
    210495 =C2=B1  9%     -19.7%     169109 =C2=B1  7%  sched_debug.cpu#56.=
sched_goidle
    421839 =C2=B1  9%     -19.6%     338979 =C2=B1  7%  sched_debug.cpu#56.=
nr_switches
    221205 =C2=B1  4%     -17.6%     182374 =C2=B1  7%  sched_debug.cfs_rq[=
50]:/.min_vruntime
    502758 =C2=B1  6%     +23.1%     618755 =C2=B1  7%  sched_debug.cpu#46.=
avg_idle
    222043 =C2=B1  4%     -18.6%     180727 =C2=B1 10%  sched_debug.cfs_rq[=
51]:/.min_vruntime
    221617 =C2=B1  4%     -18.3%     181127 =C2=B1  8%  sched_debug.cfs_rq[=
55]:/.min_vruntime
    557533 =C2=B1 11%     +22.2%     681218 =C2=B1  7%  sched_debug.cpu#12.=
avg_idle
    187238 =C2=B1  6%     -17.7%     154099 =C2=B1 10%  sched_debug.cfs_rq[=
29]:/.min_vruntime
    551333 =C2=B1 10%     +22.2%     673592 =C2=B1  7%  sched_debug.cpu#34.=
avg_idle
    224579 =C2=B1  4%     -16.6%     187288 =C2=B1  9%  sched_debug.cfs_rq[=
54]:/.min_vruntime
    184873 =C2=B1  6%     -15.9%     155439 =C2=B1  8%  sched_debug.cfs_rq[=
28]:/.min_vruntime
    206172 =C2=B1  6%     -18.2%     168730 =C2=B1  7%  sched_debug.cpu#49.=
sched_goidle
    413179 =C2=B1  6%     -18.1%     338238 =C2=B1  7%  sched_debug.cpu#49.=
nr_switches
    225157 =C2=B1  5%     -16.4%     188227 =C2=B1  9%  sched_debug.cfs_rq[=
46]:/.min_vruntime
    175150 =C2=B1  5%     -16.9%     145619 =C2=B1 11%  sched_debug.cpu#3.s=
ched_goidle
    351054 =C2=B1  5%     -16.8%     291944 =C2=B1 11%  sched_debug.cpu#3.n=
r_switches
    564018 =C2=B1  3%     +21.0%     682616 =C2=B1  6%  sched_debug.cpu#4.a=
vg_idle
      5529 =C2=B1  8%     -18.1%       4527 =C2=B1 11%  sched_debug.cfs_rq[=
39]:/.avg->runnable_avg_sum
    600812 =C2=B1  5%     -15.3%     508926 =C2=B1  9%  numa-vmstat.node2.n=
uma_local
    187471 =C2=B1  4%     -18.5%     152874 =C2=B1 10%  sched_debug.cfs_rq[=
22]:/.min_vruntime
     19730 =C2=B1  6%     -13.7%      17025 =C2=B1  9%  sched_debug.cfs_rq[=
26]:/.exec_clock
    425149 =C2=B1  6%     -18.2%     347836 =C2=B1  7%  sched_debug.cpu#49.=
sched_count
     22908 =C2=B1  5%     -12.9%      19945 =C2=B1  5%  sched_debug.cfs_rq[=
58]:/.exec_clock
    191793 =C2=B1  4%     -16.6%     160031 =C2=B1 10%  sched_debug.cfs_rq[=
24]:/.min_vruntime
     14.49 =C2=B1  0%     +16.4%      16.87 =C2=B1  2%  perf-profile.cpu-cy=
cles.start_secondary
    514287 =C2=B1 10%     +19.7%     615733 =C2=B1  6%  sched_debug.cpu#58.=
avg_idle
      1622 =C2=B1  0%     -15.6%       1369 =C2=B1  1%  time.system_time
     14.45 =C2=B1  0%     +16.2%      16.80 =C2=B1  2%  perf-profile.cpu-cy=
cles.cpu_startup_entry.start_secondary
      1117 =C2=B1  6%     -12.1%        982 =C2=B1  3%  proc-vmstat.pgmigra=
te_success
      1117 =C2=B1  6%     -12.1%        982 =C2=B1  3%  proc-vmstat.numa_pa=
ges_migrated
     23520 =C2=B1  4%     -14.0%      20233 =C2=B1  6%  sched_debug.cfs_rq[=
48]:/.exec_clock
    372296 =C2=B1  1%     -18.0%     305136 =C2=B1  9%  sched_debug.cpu#2.s=
ched_count
    218377 =C2=B1  6%     -16.5%     182283 =C2=B1  6%  sched_debug.cfs_rq[=
58]:/.min_vruntime
    548860 =C2=B1  8%     +25.4%     688468 =C2=B1  6%  sched_debug.cpu#8.a=
vg_idle
    224066 =C2=B1  5%     -17.7%     184445 =C2=B1  8%  sched_debug.cfs_rq[=
45]:/.min_vruntime
     23172 =C2=B1  4%     -12.9%      20184 =C2=B1  5%  sched_debug.cfs_rq[=
52]:/.exec_clock
    947362 =C2=B1  3%     -14.4%     810580 =C2=B1  7%  numa-numastat.node2=
.local_node
     22992 =C2=B1  5%     -12.9%      20026 =C2=B1  7%  sched_debug.cfs_rq[=
59]:/.exec_clock
     23572 =C2=B1  4%     -12.3%      20668 =C2=B1  5%  sched_debug.cfs_rq[=
46]:/.exec_clock
      6293 =C2=B1  8%     -16.0%       5288 =C2=B1  8%  sched_debug.cfs_rq[=
47]:/.avg->runnable_avg_sum
     23545 =C2=B1  4%     -13.3%      20402 =C2=B1  6%  sched_debug.cfs_rq[=
47]:/.exec_clock
         7 =C2=B1  0%     -14.3%          6 =C2=B1  0%  vmstat.procs.r
       136 =C2=B1  8%     -16.3%        114 =C2=B1  8%  sched_debug.cfs_rq[=
47]:/.tg_runnable_contrib
    952018 =C2=B1  3%     -14.1%     817562 =C2=B1  7%  numa-numastat.node2=
.numa_hit
    684874 =C2=B1  4%     -13.1%     595283 =C2=B1  7%  numa-vmstat.node2.n=
uma_hit
     22864 =C2=B1  5%     -12.7%      19967 =C2=B1  5%  sched_debug.cfs_rq[=
57]:/.exec_clock
    190734 =C2=B1  5%     -16.3%     159695 =C2=B1  8%  sched_debug.cfs_rq[=
23]:/.min_vruntime
    237300 =C2=B1  6%     -14.9%     202014 =C2=B1  7%  numa-vmstat.node3.n=
r_page_table_pages
    949123 =C2=B1  6%     -14.9%     808058 =C2=B1  7%  numa-meminfo.node3.=
PageTables
     11.45 =C2=B1  4%     +12.2%      12.84 =C2=B1  7%  perf-profile.cpu-cy=
cles.task_numa_work.task_work_run.do_notify_resume.retint_signal
    561716 =C2=B1  7%     +22.7%     689210 =C2=B1  5%  sched_debug.cpu#10.=
avg_idle
     23421 =C2=B1  4%     -12.5%      20484 =C2=B1  5%  sched_debug.cfs_rq[=
45]:/.exec_clock
     23090 =C2=B1  4%     -13.4%      19999 =C2=B1  6%  sched_debug.cfs_rq[=
53]:/.exec_clock
   2257945 =C2=B1  6%     -14.5%    1929848 =C2=B1  7%  numa-meminfo.node3.=
SUnreclaim
    564591 =C2=B1  6%     -14.5%     482457 =C2=B1  7%  numa-vmstat.node3.n=
r_slab_unreclaimable
      7903 =C2=B1  0%     -13.6%       6830 =C2=B1  1%  sched_debug.cfs_rq[=
11]:/.tg->runnable_avg
    522411 =C2=B1  6%     +15.9%     605704 =C2=B1  4%  sched_debug.cpu#59.=
avg_idle
      7899 =C2=B1  0%     -13.6%       6827 =C2=B1  1%  sched_debug.cfs_rq[=
10]:/.tg->runnable_avg
      7884 =C2=B1  0%     -13.6%       6811 =C2=B1  1%  sched_debug.cfs_rq[=
2]:/.tg->runnable_avg
      7913 =C2=B1  0%     -13.6%       6839 =C2=B1  1%  sched_debug.cfs_rq[=
14]:/.tg->runnable_avg
   2272179 =C2=B1  6%     -14.4%    1944358 =C2=B1  7%  numa-meminfo.node3.=
Slab
      7896 =C2=B1  0%     -13.6%       6826 =C2=B1  1%  sched_debug.cfs_rq[=
9]:/.tg->runnable_avg
      7894 =C2=B1  0%     -13.6%       6822 =C2=B1  1%  sched_debug.cfs_rq[=
8]:/.tg->runnable_avg
      7877 =C2=B1  0%     -13.6%       6802 =C2=B1  1%  sched_debug.cfs_rq[=
0]:/.tg->runnable_avg
      7890 =C2=B1  0%     -13.6%       6817 =C2=B1  1%  sched_debug.cfs_rq[=
4]:/.tg->runnable_avg
      7891 =C2=B1  0%     -13.6%       6816 =C2=B1  1%  sched_debug.cfs_rq[=
5]:/.tg->runnable_avg
      7894 =C2=B1  0%     -13.6%       6823 =C2=B1  1%  sched_debug.cfs_rq[=
7]:/.tg->runnable_avg
    512300 =C2=B1  6%     +18.2%     605480 =C2=B1  9%  sched_debug.cpu#50.=
avg_idle
      7908 =C2=B1  0%     -13.6%       6836 =C2=B1  1%  sched_debug.cfs_rq[=
13]:/.tg->runnable_avg
      7888 =C2=B1  0%     -13.6%       6814 =C2=B1  1%  sched_debug.cfs_rq[=
3]:/.tg->runnable_avg
      7916 =C2=B1  0%     -13.6%       6843 =C2=B1  1%  sched_debug.cfs_rq[=
15]:/.tg->runnable_avg
      7892 =C2=B1  0%     -13.6%       6818 =C2=B1  1%  sched_debug.cfs_rq[=
6]:/.tg->runnable_avg
    178921 =C2=B1  1%     -17.9%     146921 =C2=B1  9%  sched_debug.cpu#2.s=
ched_goidle
      7918 =C2=B1  0%     -13.5%       6848 =C2=B1  1%  sched_debug.cfs_rq[=
16]:/.tg->runnable_avg
      7883 =C2=B1  0%     -13.6%       6809 =C2=B1  1%  sched_debug.cfs_rq[=
1]:/.tg->runnable_avg
      7903 =C2=B1  0%     -13.5%       6832 =C2=B1  1%  sched_debug.cfs_rq[=
12]:/.tg->runnable_avg
      7930 =C2=B1  0%     -13.5%       6861 =C2=B1  1%  sched_debug.cfs_rq[=
20]:/.tg->runnable_avg
      7925 =C2=B1  0%     -13.5%       6859 =C2=B1  1%  sched_debug.cfs_rq[=
19]:/.tg->runnable_avg
      7921 =C2=B1  0%     -13.5%       6852 =C2=B1  1%  sched_debug.cfs_rq[=
17]:/.tg->runnable_avg
      7932 =C2=B1  0%     -13.4%       6866 =C2=B1  1%  sched_debug.cfs_rq[=
21]:/.tg->runnable_avg
    358611 =C2=B1  1%     -17.9%     294548 =C2=B1  9%  sched_debug.cpu#2.n=
r_switches
      7922 =C2=B1  0%     -13.4%       6857 =C2=B1  1%  sched_debug.cfs_rq[=
18]:/.tg->runnable_avg
      7985 =C2=B1  0%     -13.4%       6918 =C2=B1  1%  sched_debug.cfs_rq[=
36]:/.tg->runnable_avg
    555502 =C2=B1  4%     +16.3%     646081 =C2=B1  5%  sched_debug.cpu#5.a=
vg_idle
      7944 =C2=B1  0%     -13.5%       6876 =C2=B1  1%  sched_debug.cfs_rq[=
24]:/.tg->runnable_avg
      7994 =C2=B1  0%     -13.4%       6926 =C2=B1  1%  sched_debug.cfs_rq[=
39]:/.tg->runnable_avg
      7959 =C2=B1  0%     -13.4%       6892 =C2=B1  1%  sched_debug.cfs_rq[=
28]:/.tg->runnable_avg
      7997 =C2=B1  0%     -13.3%       6930 =C2=B1  1%  sched_debug.cfs_rq[=
40]:/.tg->runnable_avg
      7962 =C2=B1  0%     -13.4%       6895 =C2=B1  1%  sched_debug.cfs_rq[=
29]:/.tg->runnable_avg
      7935 =C2=B1  0%     -13.4%       6869 =C2=B1  1%  sched_debug.cfs_rq[=
22]:/.tg->runnable_avg
      7982 =C2=B1  0%     -13.4%       6915 =C2=B1  1%  sched_debug.cfs_rq[=
35]:/.tg->runnable_avg
      8000 =C2=B1  0%     -13.3%       6932 =C2=B1  1%  sched_debug.cfs_rq[=
41]:/.tg->runnable_avg
      7951 =C2=B1  0%     -13.4%       6884 =C2=B1  1%  sched_debug.cfs_rq[=
26]:/.tg->runnable_avg
      7954 =C2=B1  0%     -13.4%       6889 =C2=B1  1%  sched_debug.cfs_rq[=
27]:/.tg->runnable_avg
      7976 =C2=B1  0%     -13.4%       6911 =C2=B1  1%  sched_debug.cfs_rq[=
34]:/.tg->runnable_avg
      7937 =C2=B1  0%     -13.4%       6872 =C2=B1  1%  sched_debug.cfs_rq[=
23]:/.tg->runnable_avg
      8003 =C2=B1  0%     -13.3%       6937 =C2=B1  1%  sched_debug.cfs_rq[=
43]:/.tg->runnable_avg
       765 =C2=B1  0%     -13.1%        665 =C2=B1  1%  time.percent_of_cpu=
_this_job_got
      7964 =C2=B1  0%     -13.4%       6896 =C2=B1  1%  sched_debug.cfs_rq[=
30]:/.tg->runnable_avg
      7987 =C2=B1  0%     -13.4%       6919 =C2=B1  1%  sched_debug.cfs_rq[=
37]:/.tg->runnable_avg
      8027 =C2=B1  0%     -13.3%       6961 =C2=B1  1%  sched_debug.cfs_rq[=
50]:/.tg->runnable_avg
      7988 =C2=B1  0%     -13.4%       6921 =C2=B1  1%  sched_debug.cfs_rq[=
38]:/.tg->runnable_avg
      7946 =C2=B1  0%     -13.4%       6883 =C2=B1  1%  sched_debug.cfs_rq[=
25]:/.tg->runnable_avg
      8025 =C2=B1  0%     -13.3%       6955 =C2=B1  1%  sched_debug.cfs_rq[=
48]:/.tg->runnable_avg
      8012 =C2=B1  0%     -13.3%       6944 =C2=B1  1%  sched_debug.cfs_rq[=
45]:/.tg->runnable_avg
      7974 =C2=B1  0%     -13.3%       6909 =C2=B1  1%  sched_debug.cfs_rq[=
33]:/.tg->runnable_avg
      1.13 =C2=B1  1%     -14.8%       0.96 =C2=B1  7%  perf-profile.cpu-cy=
cles.update_process_times.tick_sched_handle.tick_sched_timer.__run_hrtimer.=
hrtimer_interrupt
      8000 =C2=B1  0%     -13.3%       6933 =C2=B1  1%  sched_debug.cfs_rq[=
42]:/.tg->runnable_avg
      8035 =C2=B1  0%     -13.3%       6969 =C2=B1  1%  sched_debug.cfs_rq[=
51]:/.tg->runnable_avg
      8024 =C2=B1  0%     -13.3%       6954 =C2=B1  1%  sched_debug.cfs_rq[=
47]:/.tg->runnable_avg
      8014 =C2=B1  0%     -13.3%       6950 =C2=B1  1%  sched_debug.cfs_rq[=
46]:/.tg->runnable_avg
      8026 =C2=B1  0%     -13.3%       6959 =C2=B1  1%  sched_debug.cfs_rq[=
49]:/.tg->runnable_avg
      7968 =C2=B1  0%     -13.4%       6902 =C2=B1  1%  sched_debug.cfs_rq[=
31]:/.tg->runnable_avg
     37.12 =C2=B1  0%     -12.9%      32.34 =C2=B1  2%  perf-profile.cpu-cy=
cles.vma_link.mmap_region.do_mmap_pgoff.vm_mmap_pgoff.sys_mmap_pgoff
      8007 =C2=B1  0%     -13.4%       6938 =C2=B1  1%  sched_debug.cfs_rq[=
44]:/.tg->runnable_avg
      8037 =C2=B1  0%     -13.2%       6973 =C2=B1  1%  sched_debug.cfs_rq[=
52]:/.tg->runnable_avg
      7968 =C2=B1  0%     -13.3%       6906 =C2=B1  1%  sched_debug.cfs_rq[=
32]:/.tg->runnable_avg
      1.13 =C2=B1  1%     -14.1%       0.97 =C2=B1  7%  perf-profile.cpu-cy=
cles.tick_sched_handle.isra.18.tick_sched_timer.__run_hrtimer.hrtimer_inter=
rupt.local_apic_timer_interrupt
      8068 =C2=B1  0%     -13.1%       7007 =C2=B1  1%  sched_debug.cfs_rq[=
63]:/.tg->runnable_avg
      8040 =C2=B1  0%     -13.2%       6977 =C2=B1  1%  sched_debug.cfs_rq[=
53]:/.tg->runnable_avg
      8053 =C2=B1  0%     -13.2%       6990 =C2=B1  1%  sched_debug.cfs_rq[=
57]:/.tg->runnable_avg
      8064 =C2=B1  0%     -13.1%       7004 =C2=B1  1%  sched_debug.cfs_rq[=
61]:/.tg->runnable_avg
      8049 =C2=B1  0%     -13.2%       6985 =C2=B1  1%  sched_debug.cfs_rq[=
56]:/.tg->runnable_avg
      8070 =C2=B1  0%     -13.1%       7009 =C2=B1  1%  sched_debug.cfs_rq[=
64]:/.tg->runnable_avg
   3595633 =C2=B1  5%     -12.9%    3133416 =C2=B1  6%  numa-meminfo.node3.=
MemUsed
      8055 =C2=B1  0%     -13.2%       6993 =C2=B1  1%  sched_debug.cfs_rq[=
58]:/.tg->runnable_avg
      8071 =C2=B1  0%     -13.1%       7014 =C2=B1  1%  sched_debug.cfs_rq[=
65]:/.tg->runnable_avg
      8046 =C2=B1  0%     -13.2%       6983 =C2=B1  1%  sched_debug.cfs_rq[=
55]:/.tg->runnable_avg
      8045 =C2=B1  0%     -13.3%       6978 =C2=B1  1%  sched_debug.cfs_rq[=
54]:/.tg->runnable_avg
      8086 =C2=B1  0%     -13.1%       7027 =C2=B1  1%  sched_debug.cfs_rq[=
71]:/.tg->runnable_avg
      8137 =C2=B1  0%     -13.0%       7080 =C2=B1  1%  sched_debug.cfs_rq[=
91]:/.tg->runnable_avg
      8081 =C2=B1  0%     -13.1%       7022 =C2=B1  1%  sched_debug.cfs_rq[=
68]:/.tg->runnable_avg
      8076 =C2=B1  0%     -13.1%       7017 =C2=B1  1%  sched_debug.cfs_rq[=
66]:/.tg->runnable_avg
      8062 =C2=B1  0%     -13.1%       7002 =C2=B1  1%  sched_debug.cfs_rq[=
60]:/.tg->runnable_avg
      8139 =C2=B1  0%     -12.9%       7085 =C2=B1  1%  sched_debug.cfs_rq[=
92]:/.tg->runnable_avg
      8088 =C2=B1  0%     -13.1%       7031 =C2=B1  1%  sched_debug.cfs_rq[=
72]:/.tg->runnable_avg
      8064 =C2=B1  0%     -13.1%       7006 =C2=B1  1%  sched_debug.cfs_rq[=
62]:/.tg->runnable_avg
      8143 =C2=B1  0%     -12.9%       7090 =C2=B1  1%  sched_debug.cfs_rq[=
94]:/.tg->runnable_avg
  41932371 =C2=B1  0%     -13.0%   36489731 =C2=B1  1%  slabinfo.vm_area_st=
ruct.active_objs
      8078 =C2=B1  0%     -13.1%       7019 =C2=B1  1%  sched_debug.cfs_rq[=
67]:/.tg->runnable_avg
      8083 =C2=B1  0%     -13.1%       7025 =C2=B1  1%  sched_debug.cfs_rq[=
69]:/.tg->runnable_avg
      8058 =C2=B1  0%     -13.2%       6997 =C2=B1  1%  sched_debug.cfs_rq[=
59]:/.tg->runnable_avg
      8142 =C2=B1  0%     -12.9%       7089 =C2=B1  1%  sched_debug.cfs_rq[=
93]:/.tg->runnable_avg
      8084 =C2=B1  0%     -13.1%       7028 =C2=B1  1%  sched_debug.cfs_rq[=
70]:/.tg->runnable_avg
      8134 =C2=B1  0%     -13.0%       7078 =C2=B1  1%  sched_debug.cfs_rq[=
90]:/.tg->runnable_avg
      8123 =C2=B1  0%     -13.1%       7062 =C2=B1  1%  sched_debug.cfs_rq[=
84]:/.tg->runnable_avg
   3274295 =C2=B1  0%     -13.0%    2849232 =C2=B1  1%  meminfo.PageTables
    818565 =C2=B1  0%     -13.0%     712300 =C2=B1  1%  proc-vmstat.nr_page=
_table_pages
      8094 =C2=B1  0%     -13.0%       7038 =C2=B1  1%  sched_debug.cfs_rq[=
74]:/.tg->runnable_avg
      8133 =C2=B1  0%     -13.0%       7077 =C2=B1  1%  sched_debug.cfs_rq[=
89]:/.tg->runnable_avg
      8103 =C2=B1  0%     -13.0%       7046 =C2=B1  1%  sched_debug.cfs_rq[=
77]:/.tg->runnable_avg
      8144 =C2=B1  0%     -12.9%       7094 =C2=B1  1%  sched_debug.cfs_rq[=
95]:/.tg->runnable_avg
      8146 =C2=B1  0%     -12.9%       7096 =C2=B1  1%  sched_debug.cfs_rq[=
96]:/.tg->runnable_avg
      8128 =C2=B1  0%     -13.0%       7070 =C2=B1  1%  sched_debug.cfs_rq[=
86]:/.tg->runnable_avg
      8091 =C2=B1  0%     -13.0%       7035 =C2=B1  1%  sched_debug.cfs_rq[=
73]:/.tg->runnable_avg
    536950 =C2=B1 10%     +23.4%     662508 =C2=B1  6%  sched_debug.cpu#30.=
avg_idle
      8096 =C2=B1  0%     -13.1%       7039 =C2=B1  1%  sched_debug.cfs_rq[=
75]:/.tg->runnable_avg
      8127 =C2=B1  0%     -13.0%       7067 =C2=B1  1%  sched_debug.cfs_rq[=
85]:/.tg->runnable_avg
      8149 =C2=B1  0%     -12.9%       7097 =C2=B1  1%  sched_debug.cfs_rq[=
97]:/.tg->runnable_avg
      8151 =C2=B1  0%     -12.9%       7100 =C2=B1  1%  sched_debug.cfs_rq[=
99]:/.tg->runnable_avg
      8153 =C2=B1  0%     -12.9%       7101 =C2=B1  1%  sched_debug.cfs_rq[=
100]:/.tg->runnable_avg
      8129 =C2=B1  0%     -13.0%       7074 =C2=B1  1%  sched_debug.cfs_rq[=
87]:/.tg->runnable_avg
      8118 =C2=B1  0%     -13.0%       7060 =C2=B1  1%  sched_debug.cfs_rq[=
83]:/.tg->runnable_avg
      8107 =C2=B1  0%     -13.1%       7047 =C2=B1  1%  sched_debug.cfs_rq[=
78]:/.tg->runnable_avg
      8111 =C2=B1  0%     -13.0%       7054 =C2=B1  1%  sched_debug.cfs_rq[=
80]:/.tg->runnable_avg
      8098 =C2=B1  0%     -13.0%       7044 =C2=B1  1%  sched_debug.cfs_rq[=
76]:/.tg->runnable_avg
  42188778 =C2=B1  0%     -12.9%   36733179 =C2=B1  1%  slabinfo.vm_area_st=
ruct.num_objs
    958835 =C2=B1  0%     -12.9%     834844 =C2=B1  1%  slabinfo.vm_area_st=
ruct.num_slabs
    958835 =C2=B1  0%     -12.9%     834844 =C2=B1  1%  slabinfo.vm_area_st=
ruct.active_slabs
      8154 =C2=B1  0%     -12.9%       7103 =C2=B1  1%  sched_debug.cfs_rq[=
101]:/.tg->runnable_avg
      8116 =C2=B1  0%     -13.0%       7058 =C2=B1  1%  sched_debug.cfs_rq[=
82]:/.tg->runnable_avg
      8130 =C2=B1  0%     -12.9%       7077 =C2=B1  1%  sched_debug.cfs_rq[=
88]:/.tg->runnable_avg
      8171 =C2=B1  0%     -12.9%       7120 =C2=B1  1%  sched_debug.cfs_rq[=
107]:/.tg->runnable_avg
      8113 =C2=B1  0%     -13.0%       7058 =C2=B1  1%  sched_debug.cfs_rq[=
81]:/.tg->runnable_avg
      8109 =C2=B1  0%     -13.1%       7051 =C2=B1  1%  sched_debug.cfs_rq[=
79]:/.tg->runnable_avg
      8155 =C2=B1  0%     -12.9%       7106 =C2=B1  1%  sched_debug.cfs_rq[=
102]:/.tg->runnable_avg
      8157 =C2=B1  0%     -12.8%       7111 =C2=B1  1%  sched_debug.cfs_rq[=
103]:/.tg->runnable_avg
      8165 =C2=B1  0%     -12.9%       7115 =C2=B1  1%  sched_debug.cfs_rq[=
105]:/.tg->runnable_avg
      8159 =C2=B1  0%     -12.8%       7113 =C2=B1  1%  sched_debug.cfs_rq[=
104]:/.tg->runnable_avg
      8148 =C2=B1  0%     -12.9%       7099 =C2=B1  1%  sched_debug.cfs_rq[=
98]:/.tg->runnable_avg
      8169 =C2=B1  0%     -12.9%       7118 =C2=B1  1%  sched_debug.cfs_rq[=
106]:/.tg->runnable_avg
      1.78 =C2=B1  2%     -11.3%       1.58 =C2=B1  4%  perf-profile.cpu-cy=
cles.tick_sched_timer.__run_hrtimer.hrtimer_interrupt.local_apic_timer_inte=
rrupt.smp_apic_timer_interrupt
   7802174 =C2=B1  0%     -12.8%    6805780 =C2=B1  1%  meminfo.SUnreclaim
   1950525 =C2=B1  0%     -12.8%    1701410 =C2=B1  1%  proc-vmstat.nr_slab=
_unreclaimable
      8198 =C2=B1  0%     -12.7%       7154 =C2=B1  1%  sched_debug.cfs_rq[=
119]:/.tg->runnable_avg
      8175 =C2=B1  0%     -12.8%       7125 =C2=B1  1%  sched_debug.cfs_rq[=
109]:/.tg->runnable_avg
      8180 =C2=B1  0%     -12.8%       7136 =C2=B1  1%  sched_debug.cfs_rq[=
112]:/.tg->runnable_avg
      8188 =C2=B1  0%     -12.8%       7143 =C2=B1  1%  sched_debug.cfs_rq[=
115]:/.tg->runnable_avg
      8194 =C2=B1  0%     -12.7%       7151 =C2=B1  1%  sched_debug.cfs_rq[=
117]:/.tg->runnable_avg
      8176 =C2=B1  0%     -12.8%       7129 =C2=B1  1%  sched_debug.cfs_rq[=
110]:/.tg->runnable_avg
      8189 =C2=B1  0%     -12.8%       7145 =C2=B1  1%  sched_debug.cfs_rq[=
116]:/.tg->runnable_avg
    189413 =C2=B1  4%     -13.7%     163494 =C2=B1  8%  sched_debug.cfs_rq[=
25]:/.min_vruntime
      8184 =C2=B1  0%     -12.7%       7141 =C2=B1  1%  sched_debug.cfs_rq[=
114]:/.tg->runnable_avg
      8182 =C2=B1  0%     -12.8%       7137 =C2=B1  1%  sched_debug.cfs_rq[=
113]:/.tg->runnable_avg
      8172 =C2=B1  0%     -12.8%       7122 =C2=B1  1%  sched_debug.cfs_rq[=
108]:/.tg->runnable_avg
      8193 =C2=B1  0%     -12.7%       7152 =C2=B1  1%  sched_debug.cfs_rq[=
118]:/.tg->runnable_avg
      8178 =C2=B1  0%     -12.8%       7133 =C2=B1  1%  sched_debug.cfs_rq[=
111]:/.tg->runnable_avg
   7859652 =C2=B1  0%     -12.7%    6863230 =C2=B1  1%  meminfo.Slab
      0.95 =C2=B1  6%     +15.6%       1.10 =C2=B1  3%  perf-profile.cpu-cy=
cles.__fget.fget.sys_mmap_pgoff.sys_mmap.system_call_fastpath
      1.10 =C2=B1  2%     -10.5%       0.98 =C2=B1  4%  perf-profile.cpu-cy=
cles.ktime_get.clockevents_program_event.tick_program_event.__hrtimer_start=
_range_ns.hrtimer_start_range_ns
     23237 =C2=B1  4%     -13.3%      20143 =C2=B1  6%  sched_debug.cfs_rq[=
51]:/.exec_clock
      1.82 =C2=B1  2%     -11.0%       1.62 =C2=B1  4%  perf-profile.cpu-cy=
cles.__run_hrtimer.hrtimer_interrupt.local_apic_timer_interrupt.smp_apic_ti=
mer_interrupt.apic_timer_interrupt
      0.97 =C2=B1  7%     +14.0%       1.11 =C2=B1  3%  perf-profile.cpu-cy=
cles.fget.sys_mmap_pgoff.sys_mmap.system_call_fastpath
     23242 =C2=B1  4%     -12.9%      20253 =C2=B1  6%  sched_debug.cfs_rq[=
49]:/.exec_clock
     22886 =C2=B1  5%     -13.7%      19749 =C2=B1  5%  sched_debug.cfs_rq[=
56]:/.exec_clock
      1036 =C2=B1  0%     -11.9%        914 =C2=B1  1%  time.user_time
   8527124 =C2=B1  0%     -11.6%    7534220 =C2=B1  1%  vmstat.memory.cache
   1695225 =C2=B1  0%     -10.7%    1513459 =C2=B1  1%  softirqs.TIMER
     23318 =C2=B1  6%     -13.1%      20269 =C2=B1  6%  sched_debug.cfs_rq[=
54]:/.exec_clock
    667649 =C2=B1  3%     -10.0%     600607 =C2=B1  4%  numa-vmstat.node3.n=
uma_local
 7.244e+08 =C2=B1  0%     -11.1%  6.439e+08 =C2=B1  1%  time.minor_page_fau=
lts
 7.254e+08 =C2=B1  0%     -11.1%  6.449e+08 =C2=B1  1%  proc-vmstat.pgfault
      1.92 =C2=B1  2%     -10.9%       1.71 =C2=B1  4%  perf-profile.cpu-cy=
cles.read_hpet.ktime_get.clockevents_program_event.tick_program_event.__hrt=
imer_start_range_ns
     22971 =C2=B1  5%     -12.9%      19998 =C2=B1  5%  sched_debug.cfs_rq[=
55]:/.exec_clock
       131 =C2=B1 10%     -11.7%        115 =C2=B1  6%  sched_debug.cfs_rq[=
52]:/.tg_runnable_contrib
     42.89 =C2=B1  0%     -10.4%      38.41 =C2=B1  2%  perf-profile.cpu-cy=
cles.mmap_region.do_mmap_pgoff.vm_mmap_pgoff.sys_mmap_pgoff.sys_mmap
      6053 =C2=B1 10%     -11.6%       5349 =C2=B1  6%  sched_debug.cfs_rq[=
52]:/.avg->runnable_avg_sum
    753344 =C2=B1  2%      -9.0%     685539 =C2=B1  4%  numa-vmstat.node3.n=
uma_hit
    501098 =C2=B1  0%     -11.4%     443942 =C2=B1  2%  softirqs.SCHED
      1.19 =C2=B1  2%      -9.0%       1.08 =C2=B1  3%  perf-profile.cpu-cy=
cles.clockevents_program_event.tick_program_event.__hrtimer_start_range_ns.=
hrtimer_start_range_ns.tick_nohz_restart
     90940 =C2=B1  2%      +9.4%      99459 =C2=B1  2%  sched_debug.cpu#54.=
nr_load_updates
     88590 =C2=B1  2%      +9.8%      97229 =C2=B1  4%  sched_debug.cpu#2.n=
r_load_updates
     90669 =C2=B1  2%      +9.6%      99355 =C2=B1  2%  sched_debug.cpu#56.=
nr_load_updates
     91272 =C2=B1  2%      +9.4%      99833 =C2=B1  2%  sched_debug.cpu#49.=
nr_load_updates
      1.22 =C2=B1  1%     +10.5%       1.35 =C2=B1  2%  perf-profile.cpu-cy=
cles.schedule.rwsem_down_write_failed.call_rwsem_down_write_failed.vma_link=
.mmap_region
     89287 =C2=B1  3%     +10.3%      98507 =C2=B1  4%  sched_debug.cpu#1.n=
r_load_updates
     45.38 =C2=B1  0%      -9.4%      41.10 =C2=B1  2%  perf-profile.cpu-cy=
cles.do_mmap_pgoff.vm_mmap_pgoff.sys_mmap_pgoff.sys_mmap.system_call_fastpa=
th
     22980 =C2=B1  5%     -12.4%      20128 =C2=B1  6%  sched_debug.cfs_rq[=
50]:/.exec_clock
      1.19 =C2=B1  2%      -8.5%       1.09 =C2=B1  4%  perf-profile.cpu-cy=
cles.tick_program_event.__hrtimer_start_range_ns.hrtimer_start_range_ns.tic=
k_nohz_restart.tick_nohz_idle_exit
   5570129 =C2=B1  0%      -9.4%    5048932 =C2=B1  1%  proc-vmstat.pgalloc=
_normal
   1100174 =C2=B1  3%      -6.9%    1024326 =C2=B1  3%  numa-numastat.node3=
.local_node
      2.06 =C2=B1  2%      -9.1%       1.87 =C2=B1  4%  perf-profile.cpu-cy=
cles.print_context_stack.dump_trace.save_stack_trace_tsk.__account_schedule=
r_latency.enqueue_entity
     46.01 =C2=B1  0%      -9.2%      41.78 =C2=B1  2%  perf-profile.cpu-cy=
cles.vm_mmap_pgoff.sys_mmap_pgoff.sys_mmap.system_call_fastpath
     91494 =C2=B1  2%     +10.3%     100902 =C2=B1  2%  sched_debug.cpu#46.=
nr_load_updates
     20296 =C2=B1  3%     -24.7%      15293 =C2=B1  3%  vmstat.system.in
    140148 =C2=B1  0%     -21.9%     109393 =C2=B1  1%  vmstat.system.cs
       191 =C2=B1  0%     -19.5%        153 =C2=B1  0%  turbostat.CorWatt
       257 =C2=B1  0%     -14.7%        219 =C2=B1  0%  turbostat.PkgWatt
       218 =C2=B1  0%     -13.5%        188 =C2=B1  1%  turbostat.Avg_MHz
      6.84 =C2=B1  0%     -13.6%       5.91 =C2=B1  1%  turbostat.%Busy
       578 =C2=B1  0%      -8.5%        529 =C2=B1  0%  pmeter.Average_Acti=
ve_Power
     73.34 =C2=B1  0%      -3.0%      71.15 =C2=B1  0%  turbostat.RAMWatt

brickland3: Brickland Ivy Bridge-EX
Memory: 512G




                              vm-scalability.stddev

  16 ++--------------------------------------------------------------------=
-+
     |                 O                                                   =
 |
  14 ++                   O O                                              =
 |
  12 ++    O                    O   O    O  O                              =
 |
     | O       OO              O       O                                   =
 |
  10 O+   O         O             O       O              O                 =
 |
     |  O            O  O    O       O         O O   O O    O              =
 |
   8 ++      O    O                                                        =
 |
     |                                       O    O       O                =
 |
   6 ++                                             O                      =
 |
   4 ++                                                                    =
 |
     |                                .*      .*  *.       .*             *=
.|
   2 *+**.  .*.*   .*        *.**.   *  + *.**  + : *     *  *.*.  .*.**.* =
 *
     |    **    *.*  *.**.*.*     *.*    *       *   *.*.*       **        =
 |
   0 ++--------------------------------------------------------------------=
-+


	[*] bisect-good sample
	[O] bisect-bad  sample

To reproduce:

	apt-get install ruby
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
Ying Huang


_______________________________________________
LKP mailing list
LKP(a)linux.intel.com

--===============8194763663386364646==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiB2bS1zY2FsYWJpbGl0eQpkZWZhdWx0LW1vbml0b3JzOgogIHdhaXQ6IHBy
ZS10ZXN0CiAgdXB0aW1lOiAKICBpb3N0YXQ6IAogIHZtc3RhdDogCiAgbnVtYS1udW1hc3RhdDog
CiAgbnVtYS12bXN0YXQ6IAogIG51bWEtbWVtaW5mbzogCiAgcHJvYy12bXN0YXQ6IAogIHByb2Mt
c3RhdDogCiAgbWVtaW5mbzogCiAgc2xhYmluZm86IAogIGludGVycnVwdHM6IAogIGxvY2tfc3Rh
dDogCiAgbGF0ZW5jeV9zdGF0czogCiAgc29mdGlycXM6IAogIGJkaV9kZXZfbWFwcGluZzogCiAg
ZGlza3N0YXRzOiAKICBuZnNzdGF0OiAKICBjcHVpZGxlOiAKICBjcHVmcmVxLXN0YXRzOiAKICB0
dXJib3N0YXQ6IAogIHBtZXRlcjogCiAgc2NoZWRfZGVidWc6CiAgICBpbnRlcnZhbDogMTAKZGVm
YXVsdF93YXRjaGRvZ3M6CiAgd2F0Y2gtb29tOiAKICB3YXRjaGRvZzogCmNwdWZyZXFfZ292ZXJu
b3I6IHBlcmZvcm1hbmNlCmNvbW1pdDogY2U0M2ZhNTgxZjYxYzQ3NTYzMDFlN2ZkODYwOWY1MDU3
OWUxM2Q1ZAptb2RlbDogQnJpY2tsYW5kIEl2eSBCcmlkZ2UtRVgKbnJfY3B1OiAxMjAKbWVtb3J5
OiA1MTJHCmhkZF9wYXJ0aXRpb25zOiAKc3dhcF9wYXJ0aXRpb25zOiAKcG1ldGVyX3NlcnZlcjog
bGtwLXN0MDEKcG1ldGVyX2RldmljZTogeW9rb2dhd2Etd3QzMTAKcGVyZi1wcm9maWxlOiAKcnVu
dGltZTogMzAwcwpzaXplOiAKdm0tc2NhbGFiaWxpdHk6CiAgdGVzdDogc21hbGwtYWxsb2NzCnRl
c3Rib3g6IGJyaWNrbGFuZDMKdGJveF9ncm91cDogYnJpY2tsYW5kMwprY29uZmlnOiB4ODZfNjQt
cmhlbAplbnF1ZXVlX3RpbWU6IDIwMTUtMDMtMDggMDQ6NDg6MzMuMTg3MzQzMjE0ICswODowMApo
ZWFkX2NvbW1pdDogY2U0M2ZhNTgxZjYxYzQ3NTYzMDFlN2ZkODYwOWY1MDU3OWUxM2Q1ZApiYXNl
X2NvbW1pdDogMTNhN2E2YWMwYTExMTk3ZWRjZDBmNzU2YTAzNWY0NzJiNDJjZGY4YgpicmFuY2g6
IGxpbnV4LWRldmVsL2RldmVsLWhvdXJseS0yMDE1MDMwOTAwCmtlcm5lbDogIi9rZXJuZWwveDg2
XzY0LXJoZWwvY2U0M2ZhNTgxZjYxYzQ3NTYzMDFlN2ZkODYwOWY1MDU3OWUxM2Q1ZC92bWxpbnV6
LTQuMC4wLXJjMi0wMDc4NC1nY2U0M2ZhNSIKdXNlcjogbGtwCnF1ZXVlOiBjeWNsaWMKcm9vdGZz
OiBkZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6CnJlc3VsdF9yb290OiAiL3Jlc3VsdC9icmlj
a2xhbmQzL3ZtLXNjYWxhYmlsaXR5L3BlcmZvcm1hbmNlLTMwMHMtc21hbGwtYWxsb2NzL2RlYmlh
bi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwvY2U0M2ZhNTgxZjYxYzQ3NTYzMDFl
N2ZkODYwOWY1MDU3OWUxM2Q1ZC8wIgpqb2JfZmlsZTogIi9sa3Avc2NoZWR1bGVkL2JyaWNrbGFu
ZDMvY3ljbGljX3ZtLXNjYWxhYmlsaXR5LXBlcmZvcm1hbmNlLTMwMHMtc21hbGwtYWxsb2NzLXg4
Nl82NC1yaGVsLUhFQUQtY2U0M2ZhNTgxZjYxYzQ3NTYzMDFlN2ZkODYwOWY1MDU3OWUxM2Q1ZC0w
LTIwMTUwMzA4LTkyMzYwLWFlYXNhYi55YW1sIgpkZXF1ZXVlX3RpbWU6IDIwMTUtMDMtMDkgMDY6
MjA6NTYuNzI4MDEzNDg3ICswODowMApqb2Jfc3RhdGU6IGZpbmlzaGVkCmxvYWRhdmc6IDc4LjY0
IDc1LjUzIDM2LjI1IDEvOTUzIDE0MDc1CnN0YXJ0X3RpbWU6ICcxNDI1ODUzMzI3JwplbmRfdGlt
ZTogJzE0MjU4NTM2NzUnCnZlcnNpb246ICIvbGtwL2xrcC8uc3JjLTIwMTUwMzA4LTE3NTc0NiIK

--===============8194763663386364646==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMDAvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUx
MDEvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rldmlj
ZXMvc3lzdGVtL2NwdS9jcHUxMDIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMDMvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMDQv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHUxMDUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMDYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMDcvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHUxMDgvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMDkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMS9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTExMC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTExMS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNo
byBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTExMi9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTExMy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTExNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBw
ZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTExNS9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTExNi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTExNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTExOC9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTEx
OS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTEyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNC9jcHVm
cmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0
ZW0vY3B1L2NwdTE1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4g
L3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVj
aG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNy9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTE4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyL2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjAv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHUyMS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjMvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHUyNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTI1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjYvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHUyNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTI4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjkvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzL2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1MzAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzMS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMyL2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1MzMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lz
L2RldmljZXMvc3lzdGVtL2NwdS9jcHUzNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBw
ZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM1L2NwdWZyZXEvc2NhbGlu
Z19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
MzYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rldmlj
ZXMvc3lzdGVtL2NwdS9jcHUzNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3Jt
YW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM4L2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzkvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHU0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4g
L3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVj
aG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTQyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0NC9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ1
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1NDYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ4L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NDkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NTAvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHU1MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTUyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NTMvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1NC9j
cHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9z
eXN0ZW0vY3B1L2NwdTU1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNl
ID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1Ny9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTU4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2L2NwdWZyZXEvc2NhbGlu
Z19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
NjAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rldmlj
ZXMvc3lzdGVtL2NwdS9jcHU2MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3Jt
YW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTYyL2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjMvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHU2NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTY1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgpl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjYvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHU2Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTY4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjkvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1NzAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTcyL2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NzMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNo
byBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTc1L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1NzYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHU3Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTc4L2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Nzkv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHU4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNl
ID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1ODAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4MS9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTgyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1ODMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4NC9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTg1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1ODYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4Ny9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTg4L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1ODkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgpl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OTAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHU5MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTkyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OTMvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5
NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTk1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCmVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5Ny9jcHVm
cmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0
ZW0vY3B1L2NwdTk4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBlcmZvcm1hbmNlID4g
L3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCm1v
dW50IC10IHRtcGZzIC1vIHNpemU9MTAwJSB2bS1zY2FsYWJpbGl0eS10bXAgL3RtcC92bS1zY2Fs
YWJpbGl0eS10bXAKdHJ1bmNhdGUgLXMgNTQwOTQ5NTQ0OTYwIC90bXAvdm0tc2NhbGFiaWxpdHku
aW1nCm1rZnMueGZzIC1xIC90bXAvdm0tc2NhbGFiaWxpdHkuaW1nCm1vdW50IC1vIGxvb3AgL3Rt
cC92bS1zY2FsYWJpbGl0eS5pbWcgL3RtcC92bS1zY2FsYWJpbGl0eQouL2Nhc2Utc21hbGwtYWxs
b2NzCi4vdXNlbWVtIC0tcnVudGltZSAzMDAgLW4gMTIwIC0tcmVhZG9ubHkgLS11bml0IDQwOTYw
IDM2NjUwMzg3NTkyCnVtb3VudCAvdG1wL3ZtLXNjYWxhYmlsaXR5LXRtcAp1bW91bnQgL3RtcC92
bS1zY2FsYWJpbGl0eQpybSAvdG1wL3ZtLXNjYWxhYmlsaXR5LmltZwo=

--===============8194763663386364646==--

