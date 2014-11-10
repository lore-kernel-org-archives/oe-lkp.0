Content-Type: multipart/mixed; boundary="===============0264059692685622109=="
MIME-Version: 1.0
From: lkp@01.org
To: lkp@lists.01.org
Subject: [sched] 9597d64116d: -16.1% hackbench.throughput
Date: Mon, 10 Nov 2014 13:54:53 +0800
Message-ID: <20141110055453.GE1705@yliu-dev.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0264059692685622109==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

https://git.linaro.org/people/mturquette/linux.git eas-next
commit 9597d64116d0d441dea32e7f5f05fa135d16f44b ("sched: replace capacity_f=
actor by usage")


b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  testbox/testcase/testparams
----------------  --------------------------  ---------------------------
         %stddev     %change         %stddev
             \          |                \  =

    104249 =C2=B1  0%     -16.1%      87436 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
    104249           -16.1%      87436        GEO-MEAN hackbench.throughput

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

      0.88 =C2=B1 25%    +209.7%       2.74 =C2=B1  5%  ivb42/hackbench/per=
formance-50%-threads-socket
      0.88          +209.7%       2.74        GEO-MEAN perf-profile.cpu-cyc=
les.ttwu_do_activate.constprop.87.sched_ttwu_pending.scheduler_ipi.smp_resc=
hedule_interrupt.reschedule_interrupt

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

      0.76 =C2=B1 26%    +209.2%       2.36 =C2=B1  5%  ivb42/hackbench/per=
formance-50%-threads-socket
      0.76          +209.2%       2.36        GEO-MEAN perf-profile.cpu-cyc=
les.activate_task.ttwu_do_activate.sched_ttwu_pending.scheduler_ipi.smp_res=
chedule_interrupt

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

      0.76 =C2=B1 26%    +210.6%       2.35 =C2=B1  5%  ivb42/hackbench/per=
formance-50%-threads-socket
      0.76          +210.6%       2.35        GEO-MEAN perf-profile.cpu-cyc=
les.enqueue_task.activate_task.ttwu_do_activate.sched_ttwu_pending.schedule=
r_ipi

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

      0.70 =C2=B1 25%    +203.1%       2.13 =C2=B1  6%  ivb42/hackbench/per=
formance-50%-threads-socket
      0.70          +203.1%       2.13        GEO-MEAN perf-profile.cpu-cyc=
les.enqueue_task_fair.enqueue_task.activate_task.ttwu_do_activate.sched_ttw=
u_pending

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

    243252 =C2=B1 46%    +242.5%     833240 =C2=B1 42%  ivb42/hackbench/per=
formance-50%-threads-socket
    243252          +242.5%     833240        GEO-MEAN sched_debug.cfs_rq[2=
]:/.spread0

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

        98 =C2=B1 36%     -49.1%         50 =C2=B1 34%  ivb42/hackbench/per=
formance-50%-threads-socket
        98           -49.1%         50        GEO-MEAN sched_debug.cfs_rq[1=
8]:/.blocked_load_avg

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   1067752 =C2=B1 25%     +65.3%    1764542 =C2=B1 11%  ivb42/hackbench/per=
formance-50%-threads-socket
   1067752           +65.3%    1764542        GEO-MEAN sched_debug.cfs_rq[1=
6]:/.spread0

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

    923375 =C2=B1 22%     +96.3%    1812750 =C2=B1 21%  ivb42/hackbench/per=
formance-50%-threads-socket
    923375           +96.3%    1812750        GEO-MEAN sched_debug.cfs_rq[1=
4]:/.spread0

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   1008818 =C2=B1 20%     +70.9%    1724167 =C2=B1 14%  ivb42/hackbench/per=
formance-50%-threads-socket
   1008818           +70.9%    1724167        GEO-MEAN sched_debug.cfs_rq[6=
]:/.spread0

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   1109100 =C2=B1 25%     +53.9%    1707190 =C2=B1 16%  ivb42/hackbench/per=
formance-50%-threads-socket
   1109100           +53.9%    1707190        GEO-MEAN sched_debug.cfs_rq[1=
5]:/.spread0

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   1006499 =C2=B1 33%     +67.8%    1688436 =C2=B1 22%  ivb42/hackbench/per=
formance-50%-threads-socket
   1006499           +67.8%    1688436        GEO-MEAN sched_debug.cfs_rq[1=
3]:/.spread0

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

    915637 =C2=B1 16%     +93.4%    1771080 =C2=B1 18%  ivb42/hackbench/per=
formance-50%-threads-socket
    915637           +93.4%    1771080        GEO-MEAN sched_debug.cfs_rq[7=
]:/.spread0

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

    783024 =C2=B1 10%     +67.2%    1309563 =C2=B1 22%  ivb42/hackbench/per=
formance-50%-threads-socket
    783024           +67.2%    1309563        GEO-MEAN sched_debug.cfs_rq[5=
]:/.spread0

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

     16155 =C2=B1  3%     +66.8%      26952 =C2=B1  3%  ivb42/hackbench/per=
formance-50%-threads-socket
     16155           +66.8%      26952        GEO-MEAN proc-vmstat.numa_pag=
es_migrated

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

     16155 =C2=B1  3%     +66.8%      26952 =C2=B1  3%  ivb42/hackbench/per=
formance-50%-threads-socket
     16155           +66.8%      26952        GEO-MEAN proc-vmstat.pgmigrat=
e_success

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   1443204 =C2=B1 24%     +51.5%    2187058 =C2=B1  6%  ivb42/hackbench/per=
formance-50%-threads-socket
   1443204           +51.5%    2187058        GEO-MEAN sched_debug.cfs_rq[2=
3]:/.spread0

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

      2.26 =C2=B1  4%     -38.0%       1.40 =C2=B1  4%  ivb42/hackbench/per=
formance-50%-threads-socket
      2.26           -38.0%       1.40        GEO-MEAN perf-profile.cpu-cyc=
les._raw_spin_lock.try_to_wake_up.default_wake_function.autoremove_wake_fun=
ction.__wake_up_common

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   1203841 =C2=B1 25%     +53.0%    1842451 =C2=B1 19%  ivb42/hackbench/per=
formance-50%-threads-socket
   1203841           +53.0%    1842451        GEO-MEAN sched_debug.cfs_rq[1=
7]:/.spread0

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

       119 =C2=B1 32%     -41.7%         69 =C2=B1 23%  ivb42/hackbench/per=
formance-50%-threads-socket
       119           -41.7%         69        GEO-MEAN sched_debug.cfs_rq[1=
8]:/.tg_load_contrib

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   1128380 =C2=B1 24%     +67.1%    1886076 =C2=B1 15%  ivb42/hackbench/per=
formance-50%-threads-socket
   1128380           +67.1%    1886076        GEO-MEAN sched_debug.cfs_rq[8=
]:/.spread0

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

     35577 =C2=B1 20%     +42.9%      50840 =C2=B1 15%  ivb42/hackbench/per=
formance-50%-threads-socket
     35577           +42.9%      50840        GEO-MEAN sched_debug.cpu#11.a=
vg_idle

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

      4.45 =C2=B1  4%     -35.2%       2.88 =C2=B1  3%  ivb42/hackbench/per=
formance-50%-threads-socket
      4.45           -35.2%       2.88        GEO-MEAN perf-profile.cpu-cyc=
les.enqueue_task_fair.enqueue_task.activate_task.ttwu_do_activate.try_to_wa=
ke_up

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   1230679 =C2=B1  9%     +65.1%    2032295 =C2=B1 14%  ivb42/hackbench/per=
formance-50%-threads-socket
   1230679           +65.1%    2032295        GEO-MEAN sched_debug.cfs_rq[1=
0]:/.spread0

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

      6.42 =C2=B1  4%     -33.1%       4.30 =C2=B1  3%  ivb42/hackbench/per=
formance-50%-threads-socket
      6.42           -33.1%       4.30        GEO-MEAN perf-profile.cpu-cyc=
les.ttwu_do_activate.constprop.87.try_to_wake_up.default_wake_function.auto=
remove_wake_function.__wake_up_common

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

      5.13 =C2=B1  4%     -33.8%       3.40 =C2=B1  3%  ivb42/hackbench/per=
formance-50%-threads-socket
      5.13           -33.8%       3.40        GEO-MEAN perf-profile.cpu-cyc=
les.enqueue_task.activate_task.ttwu_do_activate.try_to_wake_up.default_wake=
_function

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

      5.14 =C2=B1  4%     -33.8%       3.41 =C2=B1  3%  ivb42/hackbench/per=
formance-50%-threads-socket
      5.14           -33.8%       3.41        GEO-MEAN perf-profile.cpu-cyc=
les.activate_task.ttwu_do_activate.try_to_wake_up.default_wake_function.aut=
oremove_wake_function

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

      1.11 =C2=B1  3%     -29.1%       0.78 =C2=B1  4%  ivb42/hackbench/per=
formance-50%-threads-socket
      1.11           -29.1%       0.78        GEO-MEAN perf-profile.cpu-cyc=
les.check_preempt_curr.ttwu_do_wakeup.ttwu_do_activate.try_to_wake_up.defau=
lt_wake_function

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

      1.22 =C2=B1  3%     -29.1%       0.87 =C2=B1  3%  ivb42/hackbench/per=
formance-50%-threads-socket
      1.22           -29.1%       0.87        GEO-MEAN perf-profile.cpu-cyc=
les.ttwu_do_wakeup.ttwu_do_activate.try_to_wake_up.default_wake_function.au=
toremove_wake_function

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   1357971 =C2=B1 14%     +41.3%    1918898 =C2=B1  9%  ivb42/hackbench/per=
formance-50%-threads-socket
   1357971           +41.3%    1918898        GEO-MEAN sched_debug.cfs_rq[9=
]:/.spread0

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   1304331 =C2=B1 11%     +49.2%    1946271 =C2=B1 13%  ivb42/hackbench/per=
formance-50%-threads-socket
   1304331           +49.2%    1946271        GEO-MEAN sched_debug.cfs_rq[1=
1]:/.spread0

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

       608 =C2=B1  3%     -28.7%        433 =C2=B1  4%  ivb42/hackbench/per=
formance-50%-threads-socket
       608           -28.7%        433        GEO-MEAN cpuidle.POLL.usage

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

    424656 =C2=B1  2%     +37.7%     584637 =C2=B1  2%  ivb42/hackbench/per=
formance-50%-threads-socket
    424656           +37.7%     584637        GEO-MEAN cpuidle.C6-IVT.usage

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   1508175 =C2=B1 18%     +37.7%    2076043 =C2=B1 16%  ivb42/hackbench/per=
formance-50%-threads-socket
   1508175           +37.7%    2076043        GEO-MEAN sched_debug.cfs_rq[2=
1]:/.spread0

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

    287269 =C2=B1  4%     +32.4%     380327 =C2=B1  6%  ivb42/hackbench/per=
formance-50%-threads-socket
    287268           +32.4%     380326        GEO-MEAN proc-vmstat.numa_hin=
t_faults

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  22221059 =C2=B1  1%     -25.7%   16516998 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  22221059           -25.7%   16516998        GEO-MEAN sched_debug.cpu#23.t=
twu_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   1468667 =C2=B1 15%     +43.2%    2102926 =C2=B1  9%  ivb42/hackbench/per=
formance-50%-threads-socket
   1468667           +43.2%    2102926        GEO-MEAN sched_debug.cfs_rq[2=
2]:/.spread0

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

    291407 =C2=B1  4%     +31.7%     383859 =C2=B1  6%  ivb42/hackbench/per=
formance-50%-threads-socket
    291407           +31.7%     383859        GEO-MEAN proc-vmstat.numa_pte=
_updates

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  20399319 =C2=B1  1%     -24.9%   15320065 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  20399319           -24.9%   15320065        GEO-MEAN sched_debug.cpu#47.t=
twu_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  21955842 =C2=B1  1%     -25.2%   16425955 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  21955842           -25.2%   16425955        GEO-MEAN sched_debug.cpu#19.t=
twu_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  21384750 =C2=B1  0%     -24.7%   16103640 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  21384750           -24.7%   16103640        GEO-MEAN sched_debug.cpu#21.t=
twu_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  19455420 =C2=B1  1%     -24.4%   14708872 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  19455420           -24.4%   14708872        GEO-MEAN sched_debug.cpu#44.t=
twu_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

      1.48 =C2=B1  4%     -23.7%       1.13 =C2=B1  2%  ivb42/hackbench/per=
formance-50%-threads-socket
      1.48           -23.7%       1.13        GEO-MEAN perf-profile.cpu-cyc=
les.__switch_to

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

      2.70 =C2=B1  5%     +27.7%       3.45 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
      2.70           +27.7%       3.45        GEO-MEAN perf-profile.cpu-cyc=
les.idle_cpu.select_idle_sibling.select_task_rq_fair.try_to_wake_up.default=
_wake_function

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  20991987 =C2=B1  0%     -24.1%   15929117 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  20991987           -24.1%   15929117        GEO-MEAN sched_debug.cpu#20.t=
twu_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  20232670 =C2=B1  1%     -24.7%   15244668 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  20232670           -24.7%   15244668        GEO-MEAN sched_debug.cpu#43.t=
twu_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  21686213 =C2=B1  1%     -24.5%   16369380 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  21686213           -24.5%   16369380        GEO-MEAN sched_debug.cpu#12.t=
twu_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  21654231 =C2=B1  1%     -24.3%   16385202 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  21654231           -24.3%   16385202        GEO-MEAN sched_debug.cpu#13.t=
twu_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  19800323 =C2=B1  1%     -24.6%   14937832 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  19800323           -24.6%   14937832        GEO-MEAN sched_debug.cpu#45.t=
twu_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  20091416 =C2=B1  0%     -24.4%   15193784 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  20091416           -24.4%   15193784        GEO-MEAN sched_debug.cpu#38.t=
twu_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  19904854 =C2=B1  1%     -24.2%   15083433 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  19904854           -24.2%   15083433        GEO-MEAN sched_debug.cpu#36.t=
twu_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  20172173 =C2=B1  0%     -24.0%   15328449 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  20172173           -24.0%   15328448        GEO-MEAN sched_debug.cpu#39.t=
twu_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

      1.25 =C2=B1  2%     -25.4%       0.93 =C2=B1  2%  ivb42/hackbench/per=
formance-50%-threads-socket
      1.25           -25.4%       0.93        GEO-MEAN perf-profile.cpu-cyc=
les.update_cfs_shares.dequeue_entity.dequeue_task_fair.dequeue_task.deactiv=
ate_task

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  21661306 =C2=B1  0%     -24.2%   16411873 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  21661306           -24.2%   16411873        GEO-MEAN sched_debug.cpu#14.t=
twu_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  21896234 =C2=B1  0%     -24.2%   16598293 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  21896234           -24.2%   16598293        GEO-MEAN sched_debug.cpu#15.t=
twu_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  19221661 =C2=B1  1%     -23.7%   14665426 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  19221661           -23.7%   14665426        GEO-MEAN sched_debug.cpu#40.t=
twu_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  21058318 =C2=B1  1%     -24.2%   15959916 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  21058318           -24.2%   15959916        GEO-MEAN sched_debug.cpu#17.t=
twu_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  21754207 =C2=B1  0%     -24.2%   16487812 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  21754207           -24.2%   16487812        GEO-MEAN sched_debug.cpu#22.t=
twu_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  19963010 =C2=B1  1%     -24.1%   15143746 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  19963009           -24.1%   15143746        GEO-MEAN sched_debug.cpu#37.t=
twu_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  20748744 =C2=B1  1%     -23.7%   15832368 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  20748743           -23.7%   15832368        GEO-MEAN sched_debug.cpu#16.t=
twu_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  19955834 =C2=B1  0%     -23.9%   15189591 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  19955834           -23.9%   15189591        GEO-MEAN sched_debug.cpu#46.t=
twu_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  26674784 =C2=B1  1%     -23.1%   20500535 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  26674784           -23.1%   20500535        GEO-MEAN sched_debug.cpu#22.n=
r_switches

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  26689071 =C2=B1  1%     -23.1%   20511407 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  26689071           -23.1%   20511407        GEO-MEAN sched_debug.cpu#22.s=
ched_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  21264995 =C2=B1  1%     -23.6%   16250715 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  21264995           -23.6%   16250715        GEO-MEAN sched_debug.cpu#18.t=
twu_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  19641786 =C2=B1  1%     -23.5%   15029146 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  19641786           -23.5%   15029146        GEO-MEAN sched_debug.cpu#42.t=
twu_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

     26923 =C2=B1  2%     +29.2%      34786 =C2=B1  2%  ivb42/hackbench/per=
formance-50%-threads-socket
     26923           +29.2%      34786        GEO-MEAN cpuidle.C3-IVT.usage

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  19417423 =C2=B1  1%     -23.3%   14891714 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  19417423           -23.3%   14891714        GEO-MEAN sched_debug.cpu#41.t=
twu_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  26079901 =C2=B1  0%     -22.7%   20147877 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  26079901           -22.7%   20147877        GEO-MEAN sched_debug.cpu#18.n=
r_switches

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  26104071 =C2=B1  0%     -22.7%   20165898 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  26104071           -22.7%   20165898        GEO-MEAN sched_debug.cpu#18.s=
ched_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  25569796 =C2=B1  0%     -21.9%   19978756 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  25569796           -21.9%   19978756        GEO-MEAN sched_debug.cpu#14.n=
r_switches

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  25580176 =C2=B1  0%     -21.8%   19998098 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  25580176           -21.8%   19998098        GEO-MEAN sched_debug.cpu#14.s=
ched_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   1336731 =C2=B1 24%     +41.1%    1886101 =C2=B1 10%  ivb42/hackbench/per=
formance-50%-threads-socket
   1336731           +41.1%    1886101        GEO-MEAN sched_debug.cfs_rq[1=
8]:/.spread0

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   7138831 =C2=B1  1%     -22.1%    5563134 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
   7138831           -22.1%    5563134        GEO-MEAN proc-vmstat.pgfree

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   7160822 =C2=B1  1%     -22.0%    5584442 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
   7160822           -22.0%    5584442        GEO-MEAN proc-vmstat.pgalloc_=
normal

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  25705305 =C2=B1  0%     -22.1%   20026342 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  25705305           -22.1%   20026342        GEO-MEAN sched_debug.cpu#15.s=
ched_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  26577794 =C2=B1  0%     -22.0%   20738980 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  26577794           -22.0%   20738980        GEO-MEAN sched_debug.cpu#23.n=
r_switches

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  25887804 =C2=B1  0%     -21.3%   20372718 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  25887804           -21.3%   20372718        GEO-MEAN sched_debug.cpu#19.n=
r_switches

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  25686569 =C2=B1  1%     -21.6%   20148163 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  25686569           -21.6%   20148163        GEO-MEAN sched_debug.cpu#13.s=
ched_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  25905972 =C2=B1  0%     -21.3%   20386581 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  25905972           -21.3%   20386581        GEO-MEAN sched_debug.cpu#19.s=
ched_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  26595019 =C2=B1  0%     -21.8%   20795049 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  26595019           -21.8%   20795049        GEO-MEAN sched_debug.cpu#23.s=
ched_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  25682384 =C2=B1  0%     -22.1%   20009219 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  25682384           -22.1%   20009218        GEO-MEAN sched_debug.cpu#15.n=
r_switches

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  25625064 =C2=B1  1%     -21.6%   20086187 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  25625064           -21.6%   20086187        GEO-MEAN sched_debug.cpu#13.n=
r_switches

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  26289191 =C2=B1  1%     -21.5%   20639754 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  26289191           -21.5%   20639754        GEO-MEAN sched_debug.cpu#20.s=
ched_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  26272949 =C2=B1  1%     -21.5%   20616474 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  26272949           -21.5%   20616474        GEO-MEAN sched_debug.cpu#20.n=
r_switches

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  25785235 =C2=B1  0%     -21.6%   20221040 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  25785235           -21.6%   20221040        GEO-MEAN sched_debug.cpu#12.n=
r_switches

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  25525885 =C2=B1  0%     -21.5%   20037162 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  25525885           -21.5%   20037162        GEO-MEAN sched_debug.cpu#17.n=
r_switches

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  25575741 =C2=B1  0%     -21.4%   20104812 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  25575741           -21.4%   20104812        GEO-MEAN sched_debug.cpu#17.s=
ched_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  25842972 =C2=B1  0%     -21.5%   20284708 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  25842972           -21.5%   20284708        GEO-MEAN sched_debug.cpu#12.s=
ched_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  25395850 =C2=B1  0%     -21.3%   19996864 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  25395850           -21.3%   19996864        GEO-MEAN sched_debug.cpu#16.s=
ched_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  25385835 =C2=B1  0%     -21.3%   19979026 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  25385835           -21.3%   19979026        GEO-MEAN sched_debug.cpu#16.n=
r_switches

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  26295715 =C2=B1  1%     -21.6%   20610286 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  26295715           -21.6%   20610286        GEO-MEAN sched_debug.cpu#21.n=
r_switches

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  26311333 =C2=B1  1%     -21.6%   20632524 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  26311333           -21.6%   20632524        GEO-MEAN sched_debug.cpu#21.s=
ched_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  30824379 =C2=B1  1%     -20.1%   24621183 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  30824379           -20.1%   24621183        GEO-MEAN sched_debug.cpu#42.n=
r_switches

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  30849469 =C2=B1  1%     -20.1%   24636230 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  30849469           -20.1%   24636230        GEO-MEAN sched_debug.cpu#42.s=
ched_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  31513770 =C2=B1  0%     -20.1%   25180158 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  31513770           -20.1%   25180158        GEO-MEAN sched_debug.cpu#46.n=
r_switches

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  31530459 =C2=B1  0%     -20.1%   25191647 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  31530459           -20.1%   25191647        GEO-MEAN sched_debug.cpu#46.s=
ched_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

     31534 =C2=B1 13%     +41.8%      44720 =C2=B1 14%  ivb42/hackbench/per=
formance-50%-threads-socket
     31534           +41.8%      44720        GEO-MEAN sched_debug.cpu#38.a=
vg_idle

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   3311434 =C2=B1  8%     +19.3%    3950522 =C2=B1 12%  ivb42/hackbench/per=
formance-50%-threads-socket
   3311434           +19.3%    3950522        GEO-MEAN sched_debug.cfs_rq[4=
6]:/.spread0

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  25599960 =C2=B1  0%     -19.5%   20605928 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  25599960           -19.5%   20605928        GEO-MEAN sched_debug.cpu#0.sc=
hed_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  25587783 =C2=B1  0%     -19.5%   20590387 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  25587783           -19.5%   20590387        GEO-MEAN sched_debug.cpu#0.nr=
_switches

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  30196745 =C2=B1  1%     -19.4%   24347741 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  30196745           -19.4%   24347740        GEO-MEAN sched_debug.cpu#41.n=
r_switches

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   2845181 =C2=B1 10%     +25.9%    3581780 =C2=B1  9%  ivb42/hackbench/per=
formance-50%-threads-socket
   2845181           +25.9%    3581780        GEO-MEAN sched_debug.cfs_rq[4=
0]:/.spread0

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  30227050 =C2=B1  1%     -19.3%   24406165 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  30227049           -19.3%   24406164        GEO-MEAN sched_debug.cpu#41.s=
ched_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  30720180 =C2=B1  0%     -19.4%   24772598 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  30720180           -19.4%   24772598        GEO-MEAN sched_debug.cpu#36.n=
r_switches

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  30769646 =C2=B1  1%     -19.3%   24823365 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  30769646           -19.3%   24823365        GEO-MEAN sched_debug.cpu#36.s=
ched_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  30527777 =C2=B1  1%     -19.2%   24677022 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  30527776           -19.2%   24677022        GEO-MEAN sched_debug.cpu#37.n=
r_switches

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

     22044 =C2=B1  1%     +25.8%      27733 =C2=B1  3%  ivb42/hackbench/per=
formance-50%-threads-socket
     22044           +25.8%      27733        GEO-MEAN cpuidle.C1E-IVT.usage

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   3387494 =C2=B1  6%     +16.9%    3960647 =C2=B1  7%  ivb42/hackbench/per=
formance-50%-threads-socket
   3387494           +16.9%    3960647        GEO-MEAN sched_debug.cfs_rq[3=
3]:/.spread0

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  31508807 =C2=B1  0%     -19.2%   25447218 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  31508807           -19.2%   25447218        GEO-MEAN sched_debug.cpu#47.n=
r_switches

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  30884674 =C2=B1  0%     -18.7%   25097824 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  30884674           -18.7%   25097824        GEO-MEAN sched_debug.cpu#24.n=
r_switches

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  31529669 =C2=B1  0%     -19.1%   25504070 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  31529669           -19.1%   25504070        GEO-MEAN sched_debug.cpu#47.s=
ched_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  30891431 =C2=B1  0%     -18.7%   25116019 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  30891431           -18.7%   25116019        GEO-MEAN sched_debug.cpu#24.s=
ched_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   2877453 =C2=B1  6%     +25.4%    3608032 =C2=B1  6%  ivb42/hackbench/per=
formance-50%-threads-socket
   2877453           +25.4%    3608032        GEO-MEAN sched_debug.cfs_rq[2=
6]:/.spread0

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  30686015 =C2=B1  0%     -19.0%   24852515 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  30686015           -19.0%   24852515        GEO-MEAN sched_debug.cpu#43.n=
r_switches

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  30567772 =C2=B1  1%     -19.1%   24719285 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  30567772           -19.1%   24719285        GEO-MEAN sched_debug.cpu#37.s=
ched_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  30700393 =C2=B1  0%     -19.0%   24871670 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  30700393           -19.0%   24871669        GEO-MEAN sched_debug.cpu#43.s=
ched_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  25429518 =C2=B1  0%     -19.0%   20597694 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  25429518           -19.0%   20597693        GEO-MEAN sched_debug.cpu#1.nr=
_switches

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  30426640 =C2=B1  0%     -18.9%   24661763 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  30426640           -18.9%   24661762        GEO-MEAN sched_debug.cpu#38.n=
r_switches

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  25437824 =C2=B1  0%     -19.0%   20602002 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  25437824           -19.0%   20602002        GEO-MEAN sched_debug.cpu#1.sc=
hed_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  30443857 =C2=B1  0%     -18.9%   24679394 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  30443857           -18.9%   24679394        GEO-MEAN sched_debug.cpu#38.s=
ched_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   3170186 =C2=B1 12%     +20.8%    3830642 =C2=B1  8%  ivb42/hackbench/per=
formance-50%-threads-socket
   3170186           +20.8%    3830642        GEO-MEAN sched_debug.cfs_rq[4=
1]:/.spread0

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  30345040 =C2=B1  1%     -18.8%   24632965 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  30345040           -18.8%   24632965        GEO-MEAN sched_debug.cpu#39.s=
ched_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  30316596 =C2=B1  1%     -18.8%   24607293 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  30316596           -18.8%   24607293        GEO-MEAN sched_debug.cpu#39.n=
r_switches

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  29982666 =C2=B1  0%     -18.4%   24458570 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  29982666           -18.4%   24458570        GEO-MEAN sched_debug.cpu#40.s=
ched_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  29960708 =C2=B1  0%     -18.4%   24438001 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  29960708           -18.4%   24438001        GEO-MEAN sched_debug.cpu#40.n=
r_switches

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  31047087 =C2=B1  1%     -19.2%   25085514 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  31047087           -19.2%   25085514        GEO-MEAN sched_debug.cpu#45.s=
ched_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  31032942 =C2=B1  1%     -19.2%   25067720 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  31032942           -19.2%   25067720        GEO-MEAN sched_debug.cpu#45.n=
r_switches

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  25578650 =C2=B1  1%     -18.4%   20864649 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  25578650           -18.4%   20864649        GEO-MEAN sched_debug.cpu#4.sc=
hed_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

      1.53 =C2=B1  3%     +23.0%       1.88 =C2=B1  7%  ivb42/hackbench/per=
formance-50%-threads-socket
      1.53           +23.0%       1.88        GEO-MEAN perf-profile.cpu-cyc=
les.fput.system_call_fastpath

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  25532967 =C2=B1  1%     -18.3%   20857796 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  25532967           -18.3%   20857796        GEO-MEAN sched_debug.cpu#4.nr=
_switches

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   3155171 =C2=B1  2%     +19.0%    3753143 =C2=B1  4%  ivb42/hackbench/per=
formance-50%-threads-socket
   3155171           +19.0%    3753143        GEO-MEAN sched_debug.cfs_rq[3=
1]:/.spread0

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  26700103 =C2=B1  1%     -19.1%   21595767 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  26700103           -19.1%   21595767        GEO-MEAN sched_debug.cpu#9.nr=
_switches

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  26710729 =C2=B1  1%     -19.1%   21602428 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  26710729           -19.1%   21602428        GEO-MEAN sched_debug.cpu#9.sc=
hed_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  31156436 =C2=B1  0%     -18.7%   25325830 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  31156435           -18.7%   25325830        GEO-MEAN sched_debug.cpu#44.s=
ched_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  31140524 =C2=B1  0%     -18.8%   25300128 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  31140524           -18.8%   25300128        GEO-MEAN sched_debug.cpu#44.n=
r_switches

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  26524961 =C2=B1  0%     -17.8%   21793394 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  26524961           -17.8%   21793394        GEO-MEAN sched_debug.cpu#10.n=
r_switches

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   3335586 =C2=B1  3%     +22.0%    4070327 =C2=B1  8%  ivb42/hackbench/per=
formance-50%-threads-socket
   3335586           +22.0%    4070327        GEO-MEAN sched_debug.cfs_rq[3=
4]:/.spread0

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  25755165 =C2=B1  0%     -18.0%   21119793 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  25755165           -18.0%   21119793        GEO-MEAN sched_debug.cpu#6.nr=
_switches

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  25808917 =C2=B1  0%     -18.1%   21133286 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  25808917           -18.1%   21133286        GEO-MEAN sched_debug.cpu#6.sc=
hed_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  31373706 =C2=B1  0%     -18.0%   25734789 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  31373706           -18.0%   25734789        GEO-MEAN sched_debug.cpu#33.s=
ched_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  31356060 =C2=B1  0%     -17.9%   25728656 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  31356060           -17.9%   25728656        GEO-MEAN sched_debug.cpu#33.n=
r_switches

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  26544024 =C2=B1  0%     -17.7%   21833203 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  26544024           -17.7%   21833203        GEO-MEAN sched_debug.cpu#10.s=
ched_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  26226903 =C2=B1  1%     -17.9%   21539753 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  26226903           -17.9%   21539753        GEO-MEAN sched_debug.cpu#8.sc=
hed_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  26216240 =C2=B1  1%     -17.9%   21529356 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  26216240           -17.9%   21529356        GEO-MEAN sched_debug.cpu#8.nr=
_switches

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  26008985 =C2=B1  0%     -17.3%   21498163 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  26008985           -17.3%   21498162        GEO-MEAN sched_debug.cpu#7.nr=
_switches

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  25640553 =C2=B1  0%     -18.0%   21025853 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  25640553           -18.0%   21025853        GEO-MEAN sched_debug.cpu#5.sc=
hed_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  25624862 =C2=B1  0%     -18.0%   21018684 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  25624862           -18.0%   21018684        GEO-MEAN sched_debug.cpu#5.nr=
_switches

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  26021354 =C2=B1  0%     -17.3%   21510179 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  26021354           -17.3%   21510179        GEO-MEAN sched_debug.cpu#7.sc=
hed_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

    254353 =C2=B1  4%     +18.7%     302028 =C2=B1  7%  ivb42/hackbench/per=
formance-50%-threads-socket
    254353           +18.7%     302028        GEO-MEAN proc-vmstat.numa_hin=
t_faults_local

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  25398742 =C2=B1  1%     -18.1%   20807675 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  25398742           -18.1%   20807675        GEO-MEAN sched_debug.cpu#3.nr=
_switches

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  25405187 =C2=B1  1%     -18.1%   20818635 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  25405187           -18.1%   20818635        GEO-MEAN sched_debug.cpu#3.sc=
hed_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

    881319 =C2=B1  1%     -16.5%     735645 =C2=B1  2%  ivb42/hackbench/per=
formance-50%-threads-socket
    881319           -16.5%     735645        GEO-MEAN sched_debug.cpu#19.t=
twu_local

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  30533255 =C2=B1  0%     -17.4%   25208231 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  30533255           -17.4%   25208231        GEO-MEAN sched_debug.cpu#25.n=
r_switches

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  26692010 =C2=B1  0%     -17.7%   21973527 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  26692010           -17.7%   21973527        GEO-MEAN sched_debug.cpu#11.s=
ched_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  26676971 =C2=B1  0%     -17.7%   21964784 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  26676971           -17.7%   21964784        GEO-MEAN sched_debug.cpu#11.n=
r_switches

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  30548238 =C2=B1  0%     -17.4%   25222173 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  30548238           -17.4%   25222173        GEO-MEAN sched_debug.cpu#25.s=
ched_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  30313545 =C2=B1  1%     -17.1%   25125827 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  30313545           -17.1%   25125827        GEO-MEAN sched_debug.cpu#26.n=
r_switches

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  30325190 =C2=B1  1%     -17.1%   25139575 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  30325190           -17.1%   25139575        GEO-MEAN sched_debug.cpu#26.s=
ched_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  30298989 =C2=B1  0%     -17.1%   25132450 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  30298989           -17.1%   25132450        GEO-MEAN sched_debug.cpu#28.n=
r_switches

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  30364476 =C2=B1  0%     -17.2%   25142879 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  30364476           -17.2%   25142879        GEO-MEAN sched_debug.cpu#28.s=
ched_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

      3.63 =C2=B1  3%     +17.9%       4.29 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
      3.63           +17.9%       4.29        GEO-MEAN perf-profile.cpu-cyc=
les.select_idle_sibling.select_task_rq_fair.try_to_wake_up.default_wake_fun=
ction.autoremove_wake_function

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

    885971 =C2=B1  1%     -17.6%     730417 =C2=B1  2%  ivb42/hackbench/per=
formance-50%-threads-socket
    885971           -17.6%     730417        GEO-MEAN sched_debug.cpu#22.t=
twu_local

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

      1.61 =C2=B1  1%     -14.9%       1.37 =C2=B1  2%  ivb42/hackbench/per=
formance-50%-threads-socket
      1.61           -14.9%       1.37        GEO-MEAN perf-profile.cpu-cyc=
les.pick_next_task_fair.__sched_text_start.schedule.schedule_timeout.unix_s=
tream_recvmsg

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   1487383 =C2=B1  1%     -17.0%    1233892 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
   1487383           -17.0%    1233892        GEO-MEAN sched_debug.cpu#22.s=
ched_goidle

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

    873433 =C2=B1  1%     -15.8%     735098 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
    873433           -15.8%     735098        GEO-MEAN sched_debug.cpu#12.t=
twu_local

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  25242747 =C2=B1  1%     -18.0%   20695565 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  25242747           -18.0%   20695565        GEO-MEAN sched_debug.cpu#2.nr=
_switches

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  25252993 =C2=B1  1%     -18.0%   20700339 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  25252993           -18.0%   20700338        GEO-MEAN sched_debug.cpu#2.sc=
hed_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

    876946 =C2=B1  1%     -16.9%     728531 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
    876946           -16.9%     728531        GEO-MEAN sched_debug.cpu#21.t=
twu_local

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  30929790 =C2=B1  1%     -16.7%   25766295 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  30929790           -16.7%   25766295        GEO-MEAN sched_debug.cpu#32.n=
r_switches

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  30944860 =C2=B1  1%     -16.7%   25778928 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  30944860           -16.7%   25778928        GEO-MEAN sched_debug.cpu#32.s=
ched_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  31340929 =C2=B1  0%     -16.7%   26094438 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  31340929           -16.7%   26094438        GEO-MEAN sched_debug.cpu#34.n=
r_switches

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  31354076 =C2=B1  0%     -16.7%   26120882 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  31354075           -16.7%   26120882        GEO-MEAN sched_debug.cpu#34.s=
ched_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

      3.01 =C2=B1  2%     -18.4%       2.46 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
      3.01           -18.4%       2.46        GEO-MEAN perf-profile.cpu-cyc=
les.dequeue_entity.dequeue_task_fair.dequeue_task.deactivate_task.__sched_t=
ext_start

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

    884857 =C2=B1  0%     -16.3%     741031 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
    884857           -16.3%     741031        GEO-MEAN sched_debug.cpu#23.t=
twu_local

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  22693545 =C2=B1  0%     -16.6%   18915402 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  22693545           -16.6%   18915402        GEO-MEAN sched_debug.cpu#11.t=
twu_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  30424082 =C2=B1  0%     -16.8%   25305405 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  30424082           -16.8%   25305405        GEO-MEAN sched_debug.cpu#30.n=
r_switches

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  30485250 =C2=B1  0%     -16.9%   25323543 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  30485250           -16.9%   25323542        GEO-MEAN sched_debug.cpu#30.s=
ched_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  30917867 =C2=B1  0%     -16.9%   25707653 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  30917867           -16.9%   25707653        GEO-MEAN sched_debug.cpu#31.n=
r_switches

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  30924268 =C2=B1  0%     -16.8%   25716265 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  30924268           -16.8%   25716265        GEO-MEAN sched_debug.cpu#31.s=
ched_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  30468014 =C2=B1  1%     -17.2%   25213426 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  30468014           -17.2%   25213426        GEO-MEAN sched_debug.cpu#27.n=
r_switches

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  30477512 =C2=B1  1%     -17.2%   25229055 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  30477512           -17.2%   25229055        GEO-MEAN sched_debug.cpu#27.s=
ched_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  30130205 =C2=B1  0%     -16.7%   25101385 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  30130205           -16.7%   25101385        GEO-MEAN sched_debug.cpu#29.n=
r_switches

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  22458882 =C2=B1  0%     -16.7%   18703491 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  22458882           -16.7%   18703491        GEO-MEAN sched_debug.cpu#10.t=
twu_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  30140313 =C2=B1  0%     -16.7%   25115800 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  30140313           -16.7%   25115800        GEO-MEAN sched_debug.cpu#29.s=
ched_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

    868193 =C2=B1  1%     -15.6%     732542 =C2=B1  2%  ivb42/hackbench/per=
formance-50%-threads-socket
    868193           -15.6%     732542        GEO-MEAN sched_debug.cpu#13.t=
twu_local

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   1374659 =C2=B1 25%     +37.8%    1894017 =C2=B1  8%  ivb42/hackbench/per=
formance-50%-threads-socket
   1374659           +37.8%    1894017        GEO-MEAN sched_debug.cfs_rq[1=
9]:/.spread0

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  20829936 =C2=B1  0%     -17.0%   17279112 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  20829936           -17.0%   17279112        GEO-MEAN sched_debug.cpu#35.t=
twu_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   1418996 =C2=B1  0%     -16.4%    1186744 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
   1418996           -16.4%    1186744        GEO-MEAN sched_debug.cpu#16.s=
ched_goidle

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  31557915 =C2=B1  0%     -16.4%   26383001 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  31557915           -16.4%   26383001        GEO-MEAN sched_debug.cpu#35.n=
r_switches

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  31570143 =C2=B1  0%     -16.4%   26389314 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  31570143           -16.4%   26389314        GEO-MEAN sched_debug.cpu#35.s=
ched_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   1420038 =C2=B1  1%     -16.0%    1193250 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
   1420038           -16.0%    1193250        GEO-MEAN sched_debug.cpu#13.s=
ched_goidle

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   1450656 =C2=B1  1%     -17.1%    1202921 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
   1450656           -17.1%    1202921        GEO-MEAN sched_debug.cpu#18.s=
ched_goidle

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  20626695 =C2=B1  0%     -16.6%   17207030 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  20626695           -16.6%   17207030        GEO-MEAN sched_debug.cpu#31.t=
twu_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  22476314 =C2=B1  1%     -16.3%   18802789 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  22476314           -16.3%   18802789        GEO-MEAN sched_debug.cpu#7.tt=
wu_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  20008939 =C2=B1  0%     -15.6%   16896437 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  20008939           -15.6%   16896437        GEO-MEAN sched_debug.cpu#32.t=
twu_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   1447302 =C2=B1  0%     -16.4%    1210584 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
   1447302           -16.4%    1210584        GEO-MEAN sched_debug.cpu#19.s=
ched_goidle

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   1429701 =C2=B1  1%     -16.2%    1198182 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
   1429701           -16.2%    1198181        GEO-MEAN sched_debug.cpu#15.s=
ched_goidle

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

    872462 =C2=B1  0%     -15.4%     737745 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
    872462           -15.4%     737745        GEO-MEAN sched_debug.cpu#15.t=
twu_local

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

      1.53 =C2=B1  3%     -16.4%       1.28 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
      1.53           -16.4%       1.28        GEO-MEAN perf-profile.cpu-cyc=
les.update_cfs_shares.enqueue_entity.enqueue_task_fair.enqueue_task.activat=
e_task

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  20534273 =C2=B1  1%     -15.8%   17284516 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  20534273           -15.8%   17284516        GEO-MEAN sched_debug.cpu#25.t=
twu_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  20560704 =C2=B1  0%     -16.2%   17227893 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  20560704           -16.2%   17227893        GEO-MEAN sched_debug.cpu#34.t=
twu_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

    862442 =C2=B1  0%     -15.1%     732316 =C2=B1  2%  ivb42/hackbench/per=
formance-50%-threads-socket
    862442           -15.1%     732316        GEO-MEAN sched_debug.cpu#14.t=
twu_local

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   1443239 =C2=B1  0%     -16.5%    1205709 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
   1443239           -16.5%    1205709        GEO-MEAN sched_debug.cpu#12.s=
ched_goidle

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

      0.98 =C2=B1  3%     +20.0%       1.18 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
      0.98           +20.0%       1.18        GEO-MEAN perf-profile.cpu-cyc=
les._raw_spin_lock_irqsave.skb_queue_tail.unix_stream_sendmsg.sock_aio_writ=
e.do_sync_write

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   1487380 =C2=B1  1%     -16.3%    1244520 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
   1487380           -16.3%    1244520        GEO-MEAN sched_debug.cpu#23.s=
ched_goidle

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

 1.356e+08 =C2=B1  0%     -15.5%  1.147e+08 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
 1.356e+08           -15.5%  1.147e+08        GEO-MEAN cpuidle.C1-IVT.usage

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  20314951 =C2=B1  0%     -15.6%   17140944 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  20314951           -15.6%   17140944        GEO-MEAN sched_debug.cpu#30.t=
twu_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   1473950 =C2=B1  1%     -16.2%    1235367 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
   1473950           -16.2%    1235367        GEO-MEAN sched_debug.cpu#20.s=
ched_goidle

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

    867410 =C2=B1  1%     -15.8%     730524 =C2=B1  2%  ivb42/hackbench/per=
formance-50%-threads-socket
    867410           -15.8%     730524        GEO-MEAN sched_debug.cpu#20.t=
twu_local

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

      1.33 =C2=B1  2%     -16.4%       1.11 =C2=B1  2%  ivb42/hackbench/per=
formance-50%-threads-socket
      1.33           -16.4%       1.11        GEO-MEAN perf-profile.cpu-cyc=
les.__sched_text_start.schedule_user.sysret_careful

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   1472841 =C2=B1  1%     -15.7%    1241382 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
   1472841           -15.7%    1241382        GEO-MEAN sched_debug.cpu#21.s=
ched_goidle

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   1423709 =C2=B1  0%     -15.8%    1198274 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
   1423709           -15.8%    1198274        GEO-MEAN sched_debug.cpu#17.s=
ched_goidle

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

    851770 =C2=B1  0%     -15.3%     721480 =C2=B1  2%  ivb42/hackbench/per=
formance-50%-threads-socket
    851770           -15.3%     721480        GEO-MEAN sched_debug.cpu#17.t=
twu_local

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

      1.40 =C2=B1  2%     -16.1%       1.17 =C2=B1  2%  ivb42/hackbench/per=
formance-50%-threads-socket
      1.40           -16.1%       1.17        GEO-MEAN perf-profile.cpu-cyc=
les.sysret_careful

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  21736276 =C2=B1  0%     -15.7%   18334370 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  21736276           -15.7%   18334370        GEO-MEAN sched_debug.cpu#8.tt=
wu_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   1417611 =C2=B1  1%     -16.1%    1189420 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
   1417611           -16.1%    1189420        GEO-MEAN sched_debug.cpu#14.s=
ched_goidle

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  20609132 =C2=B1  0%     -15.8%   17362846 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  20609132           -15.8%   17362846        GEO-MEAN sched_debug.cpu#26.t=
twu_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  22069167 =C2=B1  0%     -15.4%   18674407 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  22069167           -15.4%   18674407        GEO-MEAN sched_debug.cpu#6.tt=
wu_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   2820456 =C2=B1  4%     +23.4%    3479484 =C2=B1  7%  ivb42/hackbench/per=
formance-50%-threads-socket
   2820456           +23.4%    3479484        GEO-MEAN sched_debug.cfs_rq[2=
7]:/.spread0

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  20618809 =C2=B1  0%     -15.7%   17385264 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  20618809           -15.7%   17385264        GEO-MEAN sched_debug.cpu#27.t=
twu_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  19897448 =C2=B1  1%     -15.2%   16867976 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  19897448           -15.2%   16867976        GEO-MEAN sched_debug.cpu#29.t=
twu_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  22444826 =C2=B1  1%     -14.2%   19266125 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  22444826           -14.2%   19266125        GEO-MEAN sched_debug.cpu#0.tt=
wu_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   3341263 =C2=B1 11%     +20.3%    4019480 =C2=B1  4%  ivb42/hackbench/per=
formance-50%-threads-socket
   3341263           +20.3%    4019480        GEO-MEAN sched_debug.cfs_rq[4=
5]:/.spread0

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  22509799 =C2=B1  0%     -15.2%   19080882 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  22509799           -15.2%   19080882        GEO-MEAN sched_debug.cpu#2.tt=
wu_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  22483652 =C2=B1  1%     -15.0%   19119883 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  22483652           -15.0%   19119883        GEO-MEAN sched_debug.cpu#1.tt=
wu_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  20020943 =C2=B1  0%     -14.5%   17120192 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  20020943           -14.5%   17120192        GEO-MEAN sched_debug.cpu#33.t=
twu_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  21609616 =C2=B1  0%     -14.6%   18459478 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  21609616           -14.6%   18459478        GEO-MEAN sched_debug.cpu#5.tt=
wu_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  19520181 =C2=B1  0%     -14.6%   16662350 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  19520181           -14.6%   16662349        GEO-MEAN sched_debug.cpu#28.t=
twu_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

      1.37 =C2=B1  3%     -15.6%       1.15 =C2=B1  2%  ivb42/hackbench/per=
formance-50%-threads-socket
      1.37           -15.6%       1.15        GEO-MEAN perf-profile.cpu-cyc=
les.schedule_user.sysret_careful

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  22662241 =C2=B1  0%     -15.3%   19188484 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  22662241           -15.3%   19188484        GEO-MEAN sched_debug.cpu#3.tt=
wu_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

    866621 =C2=B1  1%     -15.9%     728734 =C2=B1  2%  ivb42/hackbench/per=
formance-50%-threads-socket
    866621           -15.9%     728734        GEO-MEAN sched_debug.cpu#18.t=
twu_local

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   1039319 =C2=B1  1%     -14.8%     885271 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
   1039319           -14.8%     885271        GEO-MEAN numa-numastat.node0.=
local_node

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  21798079 =C2=B1  1%     -14.6%   18621574 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
  21798079           -14.6%   18621574        GEO-MEAN sched_debug.cpu#9.tt=
wu_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   3043317 =C2=B1  9%     +25.3%    3814417 =C2=B1 13%  ivb42/hackbench/per=
formance-50%-threads-socket
   3043317           +25.3%    3814417        GEO-MEAN sched_debug.cfs_rq[3=
8]:/.spread0

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  20231936 =C2=B1  0%     -13.8%   17436914 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  20231936           -13.8%   17436914        GEO-MEAN sched_debug.cpu#24.t=
twu_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

        20 =C2=B1  4%     -10.7%         18 =C2=B1  5%  ivb42/hackbench/per=
formance-50%-threads-socket
        20           -10.7%         18        GEO-MEAN sched_debug.cpu#16.c=
pu_load[0]

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

        20 =C2=B1  3%      -9.8%         18 =C2=B1  5%  ivb42/hackbench/per=
formance-50%-threads-socket
        20            -9.8%         18        GEO-MEAN sched_debug.cpu#16.c=
pu_load[1]

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

      0.92 =C2=B1  3%     +16.1%       1.07 =C2=B1  3%  ivb42/hackbench/per=
formance-50%-threads-socket
      0.92           +16.1%       1.07        GEO-MEAN perf-profile.cpu-cyc=
les._raw_spin_lock.unix_stream_recvmsg.sock_aio_read.sock_aio_read.do_sync_=
read

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

  21278578 =C2=B1  0%     -14.0%   18299464 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
  21278578           -14.0%   18299464        GEO-MEAN sched_debug.cpu#4.tt=
wu_count

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   1043155 =C2=B1  1%     -14.6%     891335 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
   1043155           -14.6%     891335        GEO-MEAN numa-numastat.node0.=
numa_hit

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

    860946 =C2=B1  1%     -13.4%     745561 =C2=B1  2%  ivb42/hackbench/per=
formance-50%-threads-socket
    860946           -13.4%     745561        GEO-MEAN sched_debug.cpu#45.t=
twu_local

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

    846804 =C2=B1  1%     -14.7%     722316 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
    846804           -14.7%     722316        GEO-MEAN sched_debug.cpu#16.t=
twu_local

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   3100432 =C2=B1 12%     +22.4%    3793805 =C2=B1  6%  ivb42/hackbench/per=
formance-50%-threads-socket
   3100432           +22.4%    3793805        GEO-MEAN sched_debug.cfs_rq[3=
7]:/.spread0

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

    860253 =C2=B1  1%     -13.1%     747838 =C2=B1  2%  ivb42/hackbench/per=
formance-50%-threads-socket
    860253           -13.1%     747838        GEO-MEAN sched_debug.cpu#44.t=
twu_local

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   2896486 =C2=B1  7%     +19.6%    3463508 =C2=B1  5%  ivb42/hackbench/per=
formance-50%-threads-socket
   2896486           +19.6%    3463508        GEO-MEAN sched_debug.cfs_rq[2=
5]:/.spread0

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

    871677 =C2=B1  0%     -13.2%     756998 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
    871677           -13.2%     756998        GEO-MEAN sched_debug.cpu#47.t=
twu_local

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   3230592 =C2=B1  8%     +14.9%    3712705 =C2=B1  3%  ivb42/hackbench/per=
formance-50%-threads-socket
   3230592           +14.9%    3712705        GEO-MEAN sched_debug.cfs_rq[3=
0]:/.spread0

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

      3.91 =C2=B1  1%     -14.3%       3.35 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
      3.91           -14.3%       3.35        GEO-MEAN perf-profile.cpu-cyc=
les.dequeue_task_fair.dequeue_task.deactivate_task.__sched_text_start.sched=
ule

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

    860005 =C2=B1  1%     -12.9%     748893 =C2=B1  2%  ivb42/hackbench/per=
formance-50%-threads-socket
    860005           -12.9%     748893        GEO-MEAN sched_debug.cpu#42.t=
twu_local

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   3321870 =C2=B1  7%     +14.8%    3811901 =C2=B1  7%  ivb42/hackbench/per=
formance-50%-threads-socket
   3321870           +14.8%    3811901        GEO-MEAN sched_debug.cfs_rq[4=
7]:/.spread0

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

     14483 =C2=B1  2%     -11.5%      12813 =C2=B1  3%  ivb42/hackbench/per=
formance-50%-threads-socket
     14483           -11.5%      12813        GEO-MEAN sched_debug.cpu#7.cu=
rr->pid

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

     14.50 =C2=B1  1%     -13.3%      12.57 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
     14.50           -13.3%      12.57        GEO-MEAN perf-profile.cpu-cyc=
les.default_wake_function.autoremove_wake_function.__wake_up_common.__wake_=
up_sync_key.sock_def_readable

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   3234028 =C2=B1  9%     +15.2%    3724307 =C2=B1  4%  ivb42/hackbench/per=
formance-50%-threads-socket
   3234028           +15.2%    3724307        GEO-MEAN sched_debug.cfs_rq[3=
9]:/.spread0

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

    863531 =C2=B1  1%     -12.4%     756423 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
    863531           -12.4%     756423        GEO-MEAN sched_debug.cpu#46.t=
twu_local

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   3276492 =C2=B1  5%     +15.5%    3784016 =C2=B1  8%  ivb42/hackbench/per=
formance-50%-threads-socket
   3276492           +15.5%    3784016        GEO-MEAN sched_debug.cfs_rq[3=
5]:/.spread0

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

    860124 =C2=B1  0%     -12.8%     750152 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
    860124           -12.8%     750152        GEO-MEAN sched_debug.cpu#38.t=
twu_local

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

      4.32 =C2=B1  2%     +13.3%       4.90 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
      4.32           +13.3%       4.90        GEO-MEAN perf-profile.cpu-cyc=
les.select_task_rq_fair.try_to_wake_up.default_wake_function.autoremove_wak=
e_function.__wake_up_common

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

      4025 =C2=B1  6%      -8.3%       3691 =C2=B1  4%  ivb42/hackbench/per=
formance-50%-threads-socket
      4025            -8.3%       3691        GEO-MEAN slabinfo.RAW.num_objs

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

    859082 =C2=B1  1%     -12.0%     756012 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
    859082           -12.0%     756012        GEO-MEAN sched_debug.cpu#37.t=
twu_local

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

    870131 =C2=B1  1%     -13.0%     757186 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
    870131           -13.0%     757185        GEO-MEAN sched_debug.cpu#43.t=
twu_local

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

     14.53 =C2=B1  1%     -12.9%      12.66 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
     14.53           -12.9%      12.66        GEO-MEAN perf-profile.cpu-cyc=
les.try_to_wake_up.default_wake_function.autoremove_wake_function.__wake_up=
_common.__wake_up_sync_key

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

     14.75 =C2=B1  1%     -12.6%      12.89 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
     14.75           -12.6%      12.89        GEO-MEAN perf-profile.cpu-cyc=
les.autoremove_wake_function.__wake_up_common.__wake_up_sync_key.sock_def_r=
eadable.unix_stream_sendmsg

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

    870275 =C2=B1  1%     -13.3%     754578 =C2=B1  3%  ivb42/hackbench/per=
formance-50%-threads-socket
    870275           -13.3%     754578        GEO-MEAN sched_debug.cpu#36.t=
twu_local

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

      3989 =C2=B1  5%      -8.8%       3639 =C2=B1  5%  ivb42/hackbench/per=
formance-50%-threads-socket
      3989            -8.8%       3639        GEO-MEAN slabinfo.RAW.active_=
objs

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

      1.03 =C2=B1  1%     -13.2%       0.89 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
      1.03           -13.2%       0.89        GEO-MEAN perf-profile.cpu-cyc=
les.skb_unlink.unix_stream_recvmsg.sock_aio_read.sock_aio_read.do_sync_read

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

    885844 =C2=B1  1%     -11.8%     780892 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
    885844           -11.8%     780892        GEO-MEAN sched_debug.cpu#10.t=
twu_local

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

    895578 =C2=B1  2%     -11.5%     792265 =C2=B1  2%  ivb42/hackbench/per=
formance-50%-threads-socket
    895578           -11.5%     792265        GEO-MEAN sched_debug.cpu#11.t=
twu_local

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

    883237 =C2=B1  2%     -11.9%     777826 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
    883237           -11.9%     777826        GEO-MEAN sched_debug.cpu#1.tt=
wu_local

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   2115995 =C2=B1  0%     -11.9%    1863524 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
   2115994           -11.9%    1863523        GEO-MEAN proc-vmstat.numa_loc=
al

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   2122348 =C2=B1  0%     -11.9%    1869613 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
   2122348           -11.9%    1869613        GEO-MEAN proc-vmstat.numa_hit

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

      2.57 =C2=B1  4%     +13.8%       2.92 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
      2.57           +13.8%       2.92        GEO-MEAN perf-profile.cpu-cyc=
les._raw_spin_lock.unix_stream_sendmsg.sock_aio_write.do_sync_write.vfs_wri=
te

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   1406705 =C2=B1  1%     -10.8%    1254824 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
   1406705           -10.8%    1254824        GEO-MEAN sched_debug.cpu#0.sc=
hed_goidle

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

     15.05 =C2=B1  1%     -11.8%      13.27 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
     15.05           -11.8%      13.27        GEO-MEAN perf-profile.cpu-cyc=
les.__wake_up_common.__wake_up_sync_key.sock_def_readable.unix_stream_sendm=
sg.sock_aio_write

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

    879602 =C2=B1  1%     -11.5%     778421 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
    879602           -11.5%     778421        GEO-MEAN sched_debug.cpu#8.tt=
wu_local

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

    884715 =C2=B1  2%     -11.6%     782521 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
    884714           -11.6%     782521        GEO-MEAN sched_debug.cpu#9.tt=
wu_local

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

    869234 =C2=B1  1%     -10.1%     781750 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
    869234           -10.1%     781749        GEO-MEAN sched_debug.cpu#3.tt=
wu_local

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

     13928 =C2=B1  3%     -10.0%      12532 =C2=B1  2%  ivb42/hackbench/per=
formance-50%-threads-socket
     13928           -10.0%      12531        GEO-MEAN sched_debug.cpu#34.c=
urr->pid

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

      1.65 =C2=B1  3%     -11.9%       1.45 =C2=B1  2%  ivb42/hackbench/per=
formance-50%-threads-socket
      1.65           -11.9%       1.45        GEO-MEAN perf-profile.cpu-cyc=
les.__kmalloc_reserve.isra.26.__alloc_skb.sock_alloc_send_pskb.unix_stream_=
sendmsg.sock_aio_write

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

    860847 =C2=B1  2%     -11.2%     764541 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
    860847           -11.2%     764541        GEO-MEAN sched_debug.cpu#39.t=
twu_local

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

    839076 =C2=B1  1%     -11.6%     741571 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
    839076           -11.6%     741571        GEO-MEAN sched_debug.cpu#41.t=
twu_local

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

    875043 =C2=B1  2%     -10.0%     787246 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
    875042           -10.0%     787246        GEO-MEAN sched_debug.cpu#34.t=
twu_local

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

     23.87 =C2=B1  1%     -10.7%      21.31 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
     23.87           -10.7%      21.31        GEO-MEAN perf-profile.cpu-cyc=
les.__wake_up_sync_key.sock_def_readable.unix_stream_sendmsg.sock_aio_write=
.do_sync_write

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

      4.45 =C2=B1  1%     -11.6%       3.93 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
      4.45           -11.6%       3.93        GEO-MEAN perf-profile.cpu-cyc=
les.deactivate_task.__sched_text_start.schedule.schedule_timeout.unix_strea=
m_recvmsg

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

    873852 =C2=B1  2%     -10.8%     779782 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
    873852           -10.8%     779782        GEO-MEAN sched_debug.cpu#31.t=
twu_local

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

    872491 =C2=B1  2%     -10.3%     782420 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
    872491           -10.3%     782420        GEO-MEAN sched_debug.cpu#6.tt=
wu_local

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

      1.11 =C2=B1  7%     -12.5%       0.97 =C2=B1  3%  ivb42/hackbench/per=
formance-50%-threads-socket
      1.11           -12.5%       0.97        GEO-MEAN perf-profile.cpu-cyc=
les.selinux_file_permission.security_file_permission.rw_verify_area.vfs_rea=
d.sys_read

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

      8.05 =C2=B1  2%     -12.5%       7.04 =C2=B1  2%  ivb42/hackbench/per=
formance-50%-threads-socket
      8.05           -12.5%       7.04        GEO-MEAN perf-profile.cpu-cyc=
les._raw_spin_lock_irqsave.__wake_up_sync_key.sock_def_readable.unix_stream=
_sendmsg.sock_aio_write

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

      1.36 =C2=B1  3%     -11.6%       1.20 =C2=B1  2%  ivb42/hackbench/per=
formance-50%-threads-socket
      1.36           -11.6%       1.20        GEO-MEAN perf-profile.cpu-cyc=
les.__kmalloc_node_track_caller.__kmalloc_reserve.__alloc_skb.sock_alloc_se=
nd_pskb.unix_stream_sendmsg

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

    884511 =C2=B1  1%     -10.9%     788238 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
    884511           -10.9%     788238        GEO-MEAN sched_debug.cpu#7.tt=
wu_local

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   1423158 =C2=B1  1%     -10.2%    1278070 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
   1423157           -10.2%    1278070        GEO-MEAN sched_debug.cpu#4.sc=
hed_goidle

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

      1.39 =C2=B1  2%     +11.9%       1.56 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
      1.39           +11.9%       1.56        GEO-MEAN perf-profile.cpu-cyc=
les.skb_queue_tail.unix_stream_sendmsg.sock_aio_write.do_sync_write.vfs_wri=
te

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

      4.46 =C2=B1  1%     -11.2%       3.96 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
      4.46           -11.2%       3.96        GEO-MEAN perf-profile.cpu-cyc=
les.dequeue_task.deactivate_task.__sched_text_start.schedule.schedule_timeo=
ut

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

    882994 =C2=B1  2%      -9.2%     801606 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
    882994            -9.2%     801606        GEO-MEAN sched_debug.cpu#25.t=
twu_local

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

     14371 =C2=B1  1%     -10.2%      12907 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
     14371           -10.2%      12907        GEO-MEAN sched_debug.cpu#22.c=
urr->pid

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

     14692 =C2=B1  1%     -10.8%      13111 =C2=B1  2%  ivb42/hackbench/per=
formance-50%-threads-socket
     14692           -10.8%      13111        GEO-MEAN sched_debug.cpu#10.c=
urr->pid

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

     14093 =C2=B1  3%      -9.5%      12748 =C2=B1  5%  ivb42/hackbench/per=
formance-50%-threads-socket
     14093            -9.5%      12748        GEO-MEAN sched_debug.cpu#25.c=
urr->pid

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   1495572 =C2=B1  0%     -10.9%    1333271 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
   1495571           -10.9%    1333271        GEO-MEAN sched_debug.cpu#9.sc=
hed_goidle

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

     14153 =C2=B1  3%      -9.4%      12817 =C2=B1  2%  ivb42/hackbench/per=
formance-50%-threads-socket
     14153            -9.4%      12817        GEO-MEAN sched_debug.cpu#27.c=
urr->pid

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

     14374 =C2=B1  1%      -9.7%      12976 =C2=B1  2%  ivb42/hackbench/per=
formance-50%-threads-socket
     14374            -9.7%      12976        GEO-MEAN sched_debug.cpu#32.c=
urr->pid

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

    860018 =C2=B1  2%     -10.0%     773781 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
    860018           -10.0%     773781        GEO-MEAN sched_debug.cpu#4.tt=
wu_local

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

    863792 =C2=B1  1%     -10.0%     777585 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
    863792           -10.0%     777585        GEO-MEAN sched_debug.cpu#32.t=
twu_local

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

     14193 =C2=B1  2%     -10.5%      12697 =C2=B1  2%  ivb42/hackbench/per=
formance-50%-threads-socket
     14193           -10.5%      12697        GEO-MEAN sched_debug.cpu#46.c=
urr->pid

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   1394923 =C2=B1  0%      -9.3%    1265094 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
   1394922            -9.3%    1265094        GEO-MEAN sched_debug.cpu#3.sc=
hed_goidle

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   1427072 =C2=B1  1%      -9.9%    1285217 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
   1427072            -9.9%    1285217        GEO-MEAN sched_debug.cpu#5.sc=
hed_goidle

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

        20 =C2=B1  3%     -10.9%         18 =C2=B1  3%  ivb42/hackbench/per=
formance-50%-threads-socket
        20           -10.9%         17        GEO-MEAN sched_debug.cpu#5.cp=
u_load[0]

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

      1.30 =C2=B1  2%     -10.9%       1.16 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
      1.30           -10.9%       1.16        GEO-MEAN perf-profile.cpu-cyc=
les.skb_copy_datagram_from_iovec.unix_stream_sendmsg.sock_aio_write.do_sync=
_write.vfs_write

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   1404122 =C2=B1  0%     -10.1%    1262026 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
   1404122           -10.1%    1262026        GEO-MEAN sched_debug.cpu#2.sc=
hed_goidle

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

    871725 =C2=B1  3%      -9.5%     788740 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
    871725            -9.5%     788740        GEO-MEAN sched_debug.cpu#35.t=
twu_local

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

      2.62 =C2=B1  1%     +10.8%       2.90 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
      2.62           +10.8%       2.90        GEO-MEAN perf-profile.cpu-cyc=
les.skb_copy_datagram_iovec.unix_stream_recvmsg.sock_aio_read.sock_aio_read=
.do_sync_read

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   1440886 =C2=B1  0%     -10.0%    1296355 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
   1440886           -10.0%    1296355        GEO-MEAN sched_debug.cpu#6.sc=
hed_goidle

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

     14332 =C2=B1  2%      -9.0%      13045 =C2=B1  3%  ivb42/hackbench/per=
formance-50%-threads-socket
     14332            -9.0%      13045        GEO-MEAN sched_debug.cpu#33.c=
urr->pid

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

    882824 =C2=B1  1%     -10.1%     793313 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
    882824           -10.1%     793312        GEO-MEAN sched_debug.cpu#0.tt=
wu_local

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   3116277 =C2=B1  7%     +13.2%    3527174 =C2=B1  4%  ivb42/hackbench/per=
formance-50%-threads-socket
   3116277           +13.2%    3527174        GEO-MEAN sched_debug.cfs_rq[2=
9]:/.spread0

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

      2.38 =C2=B1  1%     +12.1%       2.67 =C2=B1  4%  ivb42/hackbench/per=
formance-50%-threads-socket
      2.38           +12.1%       2.67        GEO-MEAN perf-profile.cpu-cyc=
les.__fdget_pos.sys_write.system_call_fastpath

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

     14095 =C2=B1  2%      -9.6%      12748 =C2=B1  2%  ivb42/hackbench/per=
formance-50%-threads-socket
     14095            -9.6%      12748        GEO-MEAN sched_debug.cpu#12.c=
urr->pid

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   1499703 =C2=B1  0%      -9.7%    1354350 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
   1499703            -9.7%    1354350        GEO-MEAN sched_debug.cpu#10.s=
ched_goidle

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

     14050 =C2=B1  2%      -9.9%      12664 =C2=B1  4%  ivb42/hackbench/per=
formance-50%-threads-socket
     14050            -9.9%      12664        GEO-MEAN sched_debug.cpu#47.c=
urr->pid

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   1493710 =C2=B1  1%     -10.0%    1344628 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
   1493710           -10.0%    1344628        GEO-MEAN sched_debug.cpu#11.s=
ched_goidle

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

    882178 =C2=B1  2%      -8.7%     805480 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
    882178            -8.7%     805480        GEO-MEAN sched_debug.cpu#26.t=
twu_local

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   1451847 =C2=B1  1%      -9.6%    1311874 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
   1451847            -9.6%    1311874        GEO-MEAN sched_debug.cpu#7.sc=
hed_goidle

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

    869997 =C2=B1  1%     -10.0%     782794 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
    869997           -10.0%     782794        GEO-MEAN sched_debug.cpu#2.tt=
wu_local

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

     14168 =C2=B1  3%     -11.3%      12566 =C2=B1  4%  ivb42/hackbench/per=
formance-50%-threads-socket
     14168           -11.3%      12565        GEO-MEAN sched_debug.cpu#44.c=
urr->pid

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

    863764 =C2=B1  1%      -9.4%     782356 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
    863764            -9.4%     782356        GEO-MEAN sched_debug.cpu#5.tt=
wu_local

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

        20 =C2=B1  2%      -9.7%         18 =C2=B1  5%  ivb42/hackbench/per=
formance-50%-threads-socket
        20            -9.7%         18        GEO-MEAN sched_debug.cpu#16.c=
pu_load[3]

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

        20 =C2=B1  2%      -8.7%         18 =C2=B1  3%  ivb42/hackbench/per=
formance-50%-threads-socket
        20            -8.7%         18        GEO-MEAN sched_debug.cpu#16.c=
pu_load[4]

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

        20 =C2=B1  3%      -8.7%         19 =C2=B1  5%  ivb42/hackbench/per=
formance-50%-threads-socket
        20            -8.7%         18        GEO-MEAN sched_debug.cfs_rq[5=
]:/.runnable_load_avg

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   1471462 =C2=B1  1%      -9.5%    1331414 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
   1471462            -9.5%    1331414        GEO-MEAN sched_debug.cpu#8.sc=
hed_goidle

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

    877064 =C2=B1  0%      -8.9%     799209 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
    877064            -8.9%     799208        GEO-MEAN sched_debug.cpu#27.t=
twu_local

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   1081809 =C2=B1  1%      -9.1%     983451 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
   1081809            -9.1%     983451        GEO-MEAN numa-numastat.node1.=
local_node

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

     14225 =C2=B1  2%      -7.6%      13149 =C2=B1  3%  ivb42/hackbench/per=
formance-50%-threads-socket
     14225            -7.6%      13149        GEO-MEAN sched_debug.cpu#36.c=
urr->pid

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   1084327 =C2=B1  1%      -9.3%     983476 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
   1084327            -9.3%     983475        GEO-MEAN numa-numastat.node1.=
numa_hit

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

      2.29 =C2=B1  1%     +11.9%       2.57 =C2=B1  4%  ivb42/hackbench/per=
formance-50%-threads-socket
      2.29           +11.9%       2.57        GEO-MEAN perf-profile.cpu-cyc=
les.__fget_light.__fdget_pos.sys_write.system_call_fastpath

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

    847788 =C2=B1  3%     -12.0%     746038 =C2=B1  2%  ivb42/hackbench/per=
formance-50%-threads-socket
    847788           -12.0%     746038        GEO-MEAN sched_debug.cpu#40.t=
twu_local

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

    865949 =C2=B1  2%      -8.8%     789915 =C2=B1  2%  ivb42/hackbench/per=
formance-50%-threads-socket
    865949            -8.8%     789915        GEO-MEAN sched_debug.cpu#33.t=
twu_local

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

     14384 =C2=B1  2%     -10.9%      12817 =C2=B1  2%  ivb42/hackbench/per=
formance-50%-threads-socket
     14384           -10.9%      12816        GEO-MEAN sched_debug.cpu#23.c=
urr->pid

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   1395020 =C2=B1  0%     -10.0%    1255965 =C2=B1  1%  ivb42/hackbench/per=
formance-50%-threads-socket
   1395020           -10.0%    1255965        GEO-MEAN sched_debug.cpu#1.sc=
hed_goidle

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

     14326 =C2=B1  3%      -7.6%      13231 =C2=B1  4%  ivb42/hackbench/per=
formance-50%-threads-socket
     14326            -7.6%      13231        GEO-MEAN sched_debug.cpu#9.cu=
rr->pid

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

      9.40 =C2=B1  2%     +52.1%      14.30 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
      9.40           +52.1%      14.30        GEO-MEAN turbostat.RAM_W

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

    328603 =C2=B1  4%     +28.0%     420733 =C2=B1  6%  ivb42/hackbench/per=
formance-50%-threads-socket
    328603           +28.0%     420732        GEO-MEAN time.minor_page_faul=
ts

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

 2.029e+09 =C2=B1  0%     -19.6%  1.632e+09 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
 2.029e+09           -19.6%  1.632e+09        GEO-MEAN time.voluntary_conte=
xt_switches

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

 5.504e+08 =C2=B1  0%     -18.7%  4.477e+08 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
 5.504e+08           -18.7%  4.477e+08        GEO-MEAN time.involuntary_con=
text_switches

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   4221419 =C2=B1  0%     -18.2%    3451963 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
   4221418           -18.2%    3451963        GEO-MEAN vmstat.system.cs

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

       808 =C2=B1  0%     -10.7%        721 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
       808           -10.7%        721        GEO-MEAN time.user_time

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

   1096082 =C2=B1  1%     +11.3%    1220347 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
   1096082           +11.3%    1220347        GEO-MEAN vmstat.system.in

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

       173 =C2=B1  0%      -3.0%        168 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
       173            -3.0%        168        GEO-MEAN turbostat.Cor_W

b57a1e0afff2cbac  9597d64116d0d441dea32e7f5f  =

----------------  --------------------------  =

       204 =C2=B1  0%      -1.8%        200 =C2=B1  0%  ivb42/hackbench/per=
formance-50%-threads-socket
       204            -1.8%        200        GEO-MEAN turbostat.Pkg_W


ivb42: Ivytown Ivy Bridge-EP
Memory: 64G


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

--===============0264059692685622109==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiBoYWNrYmVuY2gKZGVmYXVsdF9tb25pdG9yczoKICB3YWl0OiBwcmUtdGVz
dAogIHVwdGltZTogCiAgaW9zdGF0OiAKICB2bXN0YXQ6IAogIG51bWEtbnVtYXN0YXQ6IAogIG51
bWEtdm1zdGF0OiAKICBudW1hLW1lbWluZm86IAogIHByb2Mtdm1zdGF0OiAKICBwcm9jLXN0YXQ6
IAogIG1lbWluZm86IAogIHNsYWJpbmZvOiAKICBpbnRlcnJ1cHRzOiAKICBsb2NrX3N0YXQ6IAog
IGxhdGVuY3lfc3RhdHM6IAogIHNvZnRpcnFzOiAKICBiZGlfZGV2X21hcHBpbmc6IAogIGRpc2tz
dGF0czogCiAgY3B1aWRsZTogCiAgY3B1ZnJlcTogCiAgdHVyYm9zdGF0OiAKICBzY2hlZF9kZWJ1
ZzoKICAgIGludGVydmFsOiAxMApkZWZhdWx0X3dhdGNoZG9nczoKICB3YXRjaC1vb206IAogIHdh
dGNoZG9nOiAKY3B1ZnJlcV9nb3Zlcm5vcjoKLSBwZXJmb3JtYW5jZQpjb21taXQ6IDFlNDQ0ODAz
ZmE4NjdkMmZjNGUzMGFmZThkOTA1NzRlNTgwNGM4YmEKbW9kZWw6IEl2eXRvd24gSXZ5IEJyaWRn
ZS1FUApucl9jcHU6IDQ4Cm1lbW9yeTogNjRHCm5yX3RocmVhZHM6Ci0gNTAlCnBlcmYtcHJvZmls
ZToKICBmcmVxOiA4MDAKaGFja2JlbmNoOgogIG1vZGU6CiAgLSB0aHJlYWRzCiAgaXBjOgogIC0g
c29ja2V0CmVucXVldWVfdGltZTogMjAxNC0xMS0wNSAwOTozOTowNC41MjgxMDg3MjEgKzA4OjAw
CnRlc3Rib3g6IGl2YjQyCnRib3hfZ3JvdXA6IGl2YjQyCmtjb25maWc6IHg4Nl82NC1yaGVsCmhl
YWRfY29tbWl0OiAxZTQ0NDgwM2ZhODY3ZDJmYzRlMzBhZmU4ZDkwNTc0ZTU4MDRjOGJhCmJhc2Vf
Y29tbWl0OiAwZGYxZjI0ODdkMmYwZDA0NzAzZjE0MjgxM2Q1MzYxNWQ2MmExZGE0CmJyYW5jaDog
bGludXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTQxMTA2MTgKa2VybmVsOiAiL2tlcm5lbC94ODZf
NjQtcmhlbC8xZTQ0NDgwM2ZhODY3ZDJmYzRlMzBhZmU4ZDkwNTc0ZTU4MDRjOGJhL3ZtbGludXot
My4xOC4wLXJjMy1nMWU0NDQ4MCIKdXNlcjogbGtwCnF1ZXVlOiBjeWNsaWMKcm9vdGZzOiBkZWJp
YW4teDg2XzY0LmNnegpyZXN1bHRfcm9vdDogIi9yZXN1bHQvaXZiNDIvaGFja2JlbmNoL3BlcmZv
cm1hbmNlLTUwJS10aHJlYWRzLXNvY2tldC9kZWJpYW4teDg2XzY0LmNnei94ODZfNjQtcmhlbC8x
ZTQ0NDgwM2ZhODY3ZDJmYzRlMzBhZmU4ZDkwNTc0ZTU4MDRjOGJhLzAiCmpvYl9maWxlOiAiL2xr
cC9zY2hlZHVsZWQvaXZiNDIvY3ljbGljX2hhY2tiZW5jaC1wZXJmb3JtYW5jZS01MCUtdGhyZWFk
cy1zb2NrZXQteDg2XzY0LXJoZWwtSEVBRC0xZTQ0NDgwM2ZhODY3ZDJmYzRlMzBhZmU4ZDkwNTc0
ZTU4MDRjOGJhLTAueWFtbCIKZGVxdWV1ZV90aW1lOiAyMDE0LTExLTA2IDE5OjQ5OjA3LjAyMTY0
MzY0NiArMDg6MDAKam9iX3N0YXRlOiBmaW5pc2hlZApsb2FkYXZnOiAzNTIuMjQgMzQ0Ljc4IDE5
NC4zNiAxLzQwOSAyNTYyMwpzdGFydF90aW1lOiAnMTQxNTI3NDU4OScKZW5kX3RpbWU6ICcxNDE1
Mjc1MjAxJwp2ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0yMDE0MTEwNi0xMzUxMzYiCg==

--===============0264059692685622109==
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
b3Zlcm5vcgovdXNyL2Jpbi9oYWNrYmVuY2ggLWcgMjQgLS10aHJlYWRzIC1sIDYwMDAwCi91c3Iv
YmluL2hhY2tiZW5jaCAtZyAyNCAtLXRocmVhZHMgLWwgNjAwMDAKL3Vzci9iaW4vaGFja2JlbmNo
IC1nIDI0IC0tdGhyZWFkcyAtbCA2MDAwMAovdXNyL2Jpbi9oYWNrYmVuY2ggLWcgMjQgLS10aHJl
YWRzIC1sIDYwMDAwCi91c3IvYmluL2hhY2tiZW5jaCAtZyAyNCAtLXRocmVhZHMgLWwgNjAwMDAK
L3Vzci9iaW4vaGFja2JlbmNoIC1nIDI0IC0tdGhyZWFkcyAtbCA2MDAwMAovdXNyL2Jpbi9oYWNr
YmVuY2ggLWcgMjQgLS10aHJlYWRzIC1sIDYwMDAwCi91c3IvYmluL2hhY2tiZW5jaCAtZyAyNCAt
LXRocmVhZHMgLWwgNjAwMDAKL3Vzci9iaW4vaGFja2JlbmNoIC1nIDI0IC0tdGhyZWFkcyAtbCA2
MDAwMAovdXNyL2Jpbi9oYWNrYmVuY2ggLWcgMjQgLS10aHJlYWRzIC1sIDYwMDAwCg==

--===============0264059692685622109==--

