Content-Type: multipart/mixed; boundary="===============8895686336061263222=="
MIME-Version: 1.0
From: kernel test robot <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: [ACPI / processor] f3ca4164529: -48.3% will-it-scale.per_process_ops
Date: Mon, 27 Oct 2014 10:28:22 +0800
Message-ID: <20141027022822.GJ27038@yliu-dev.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8895686336061263222==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed the below changes on

commit f3ca4164529b875374c410193bbbac0ee960895f ("ACPI / processor: Rework =
processor throttling with work_on_cpu()")


       v3.14-rc4  f3ca4164529b875374c410193b  testbox/testcase/testparams
----------------  --------------------------  ---------------------------
         %stddev     %change         %stddev
             \          |                \  =

    624516 =C2=B1  0%     -48.3%     322914 =C2=B1  0%  brickland1/will-it-=
scale/powersave-pwrite1
    624516           -48.3%     322914        GEO-MEAN will-it-scale.per_pr=
ocess_ops

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

    576025 =C2=B1  0%     -47.9%     299956 =C2=B1  0%  brickland1/will-it-=
scale/powersave-pwrite1
    576024           -47.9%     299955        GEO-MEAN will-it-scale.per_th=
read_ops

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      0.46 =C2=B1  0%      +6.5%       0.48 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
      0.46            +6.5%       0.48        GEO-MEAN will-it-scale.scalab=
ility

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

    176818 =C2=B1  3%     -84.7%      26974 =C2=B1  7%  brickland1/will-it-=
scale/powersave-pwrite1
    176818           -84.7%      26973        GEO-MEAN cpuidle.C6-IVB.usage

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

 7.139e+09 =C2=B1  1%     -78.5%  1.533e+09 =C2=B1  5%  brickland1/will-it-=
scale/powersave-pwrite1
 7.139e+09           -78.5%  1.533e+09        GEO-MEAN cpuidle.C6-IVB.time

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

        32 =C2=B1 34%     -77.2%          7 =C2=B1 44%  brickland1/will-it-=
scale/powersave-pwrite1
        32           -77.2%          7        GEO-MEAN sched_debug.cfs_rq[3=
3]:/.blocked_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

        84 =C2=B1 27%     -71.6%         24 =C2=B1 39%  brickland1/will-it-=
scale/powersave-pwrite1
        84           -71.6%         24        GEO-MEAN proc-vmstat.nr_dirti=
ed

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

       976 =C2=B1 43%    +148.7%       2427 =C2=B1 37%  brickland1/will-it-=
scale/powersave-pwrite1
       976          +148.7%       2427        GEO-MEAN sched_debug.cpu#20.s=
ched_goidle

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

        41 =C2=B1 28%    +185.6%        118 =C2=B1 19%  brickland1/will-it-=
scale/powersave-pwrite1
        41          +185.6%        118        GEO-MEAN sched_debug.cpu#76.n=
r_uninterruptible

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      2144 =C2=B1 38%    +134.5%       5027 =C2=B1 36%  brickland1/will-it-=
scale/powersave-pwrite1
      2144          +134.5%       5027        GEO-MEAN sched_debug.cpu#20.n=
r_switches

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

        37 =C2=B1 18%     -60.8%         14 =C2=B1 44%  brickland1/will-it-=
scale/powersave-pwrite1
        37           -60.8%         14        GEO-MEAN sched_debug.cfs_rq[9=
1]:/.load

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

        37 =C2=B1 18%     -60.8%         14 =C2=B1 44%  brickland1/will-it-=
scale/powersave-pwrite1
        37           -60.8%         14        GEO-MEAN sched_debug.cpu#91.l=
oad

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

        35 =C2=B1 46%    +235.4%        117 =C2=B1 35%  brickland1/will-it-=
scale/powersave-pwrite1
        34          +235.4%        117        GEO-MEAN sched_debug.cfs_rq[9=
2]:/.tg_load_contrib

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

        54 =C2=B1  9%     -57.0%         23 =C2=B1 43%  brickland1/will-it-=
scale/powersave-pwrite1
        54           -57.0%         23        GEO-MEAN sched_debug.cpu#91.c=
pu_load[1]

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

        37 =C2=B1 29%     -64.5%         13 =C2=B1 16%  brickland1/will-it-=
scale/powersave-pwrite1
        37           -64.5%         13        GEO-MEAN sched_debug.cfs_rq[3=
3]:/.tg_load_contrib

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      1785 =C2=B1 46%     +75.8%       3139 =C2=B1 28%  brickland1/will-it-=
scale/powersave-pwrite1
      1785           +75.8%       3139        GEO-MEAN sched_debug.cpu#41.n=
r_switches

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      1799 =C2=B1 23%     -38.6%       1104 =C2=B1 38%  brickland1/will-it-=
scale/powersave-pwrite1
      1799           -38.6%       1104        GEO-MEAN sched_debug.cpu#60.n=
r_switches

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

        46 =C2=B1  9%     -54.9%         21 =C2=B1 24%  brickland1/will-it-=
scale/powersave-pwrite1
        46           -54.9%         21        GEO-MEAN sched_debug.cpu#91.c=
pu_load[2]

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      2138 =C2=B1 34%    +108.7%       4462 =C2=B1 33%  brickland1/will-it-=
scale/powersave-pwrite1
      2138          +108.7%       4462        GEO-MEAN sched_debug.cpu#43.n=
r_switches

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

       344 =C2=B1 36%     +73.2%        596 =C2=B1 18%  brickland1/will-it-=
scale/powersave-pwrite1
       344           +73.2%        596        GEO-MEAN sched_debug.cfs_rq[9=
1]:/.blocked_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

       104 =C2=B1 26%     -47.6%         54 =C2=B1  1%  brickland1/will-it-=
scale/powersave-pwrite1
       104           -47.6%         54        GEO-MEAN sched_debug.cpu#0.cp=
u_load[4]

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      1803 =C2=B1 23%     -37.9%       1119 =C2=B1 37%  brickland1/will-it-=
scale/powersave-pwrite1
      1803           -37.9%       1119        GEO-MEAN sched_debug.cpu#60.s=
ched_count

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

       680 =C2=B1 38%    +104.0%       1387 =C2=B1 37%  brickland1/will-it-=
scale/powersave-pwrite1
       679          +104.0%       1387        GEO-MEAN sched_debug.cpu#40.s=
ched_goidle

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

        96 =C2=B1 26%     -47.6%         50 =C2=B1  0%  brickland1/will-it-=
scale/powersave-pwrite1
        96           -47.6%         50        GEO-MEAN sched_debug.cpu#0.cp=
u_load[3]

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

       382 =C2=B1 34%     +60.2%        612 =C2=B1 16%  brickland1/will-it-=
scale/powersave-pwrite1
       382           +60.2%        612        GEO-MEAN sched_debug.cfs_rq[9=
1]:/.tg_load_contrib

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

       881 =C2=B1 38%    +135.9%       2079 =C2=B1 37%  brickland1/will-it-=
scale/powersave-pwrite1
       881          +135.9%       2079        GEO-MEAN sched_debug.cpu#43.t=
twu_count

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

        63 =C2=B1 24%     -40.5%         37 =C2=B1  5%  brickland1/will-it-=
scale/powersave-pwrite1
        63           -40.5%         37        GEO-MEAN sched_debug.cfs_rq[0=
]:/.runnable_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

        69 =C2=B1 34%     -46.7%         37 =C2=B1  7%  brickland1/will-it-=
scale/powersave-pwrite1
        69           -46.7%         37        GEO-MEAN sched_debug.cfs_rq[0=
]:/.load

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

        63 =C2=B1 24%     -40.5%         37 =C2=B1  5%  brickland1/will-it-=
scale/powersave-pwrite1
        63           -40.5%         37        GEO-MEAN sched_debug.cpu#0.lo=
ad

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

        85 =C2=B1 26%     -46.4%         45 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
        85           -46.4%         45        GEO-MEAN sched_debug.cpu#0.cp=
u_load[2]

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

        41 =C2=B1 12%     -50.2%         20 =C2=B1 15%  brickland1/will-it-=
scale/powersave-pwrite1
        41           -50.2%         20        GEO-MEAN sched_debug.cpu#91.c=
pu_load[3]

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

        63 =C2=B1 24%     -37.0%         40 =C2=B1 11%  brickland1/will-it-=
scale/powersave-pwrite1
        63           -37.0%         40        GEO-MEAN sched_debug.cfs_rq[0=
]:/.tg_load_contrib

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

       374 =C2=B1 28%     +81.1%        678 =C2=B1 45%  brickland1/will-it-=
scale/powersave-pwrite1
       374           +81.1%        678        GEO-MEAN sched_debug.cpu#12.s=
ched_goidle

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      2.26 =C2=B1  7%     +96.5%       4.44 =C2=B1  3%  brickland1/will-it-=
scale/powersave-pwrite1
      2.26           +96.5%       4.44        GEO-MEAN perf-profile.cpu-cyc=
les.scheduler_tick.update_process_times.tick_sched_handle.tick_sched_timer.=
__run_hrtimer

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      2.40 =C2=B1  8%     +95.7%       4.69 =C2=B1  3%  brickland1/will-it-=
scale/powersave-pwrite1
      2.40           +95.7%       4.69        GEO-MEAN perf-profile.cpu-cyc=
les.update_process_times.tick_sched_handle.tick_sched_timer.__run_hrtimer.h=
rtimer_interrupt

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      2.41 =C2=B1  8%     +95.7%       4.71 =C2=B1  3%  brickland1/will-it-=
scale/powersave-pwrite1
      2.41           +95.7%       4.71        GEO-MEAN perf-profile.cpu-cyc=
les.tick_sched_handle.isra.17.tick_sched_timer.__run_hrtimer.hrtimer_interr=
upt.local_apic_timer_interrupt

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

        25 =C2=B1 23%     -29.9%         17 =C2=B1 29%  brickland1/will-it-=
scale/powersave-pwrite1
        25           -29.9%         17        GEO-MEAN sched_debug.cfs_rq[1=
7]:/.load

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

        75 =C2=B1 28%     -41.9%         43 =C2=B1  5%  brickland1/will-it-=
scale/powersave-pwrite1
        74           -41.9%         43        GEO-MEAN sched_debug.cpu#0.cp=
u_load[1]

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

       130 =C2=B1 18%     -46.8%         69 =C2=B1 13%  brickland1/will-it-=
scale/powersave-pwrite1
       129           -46.8%         69        GEO-MEAN proc-vmstat.nr_writt=
en

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

       898 =C2=B1 23%     +68.6%       1513 =C2=B1 40%  brickland1/will-it-=
scale/powersave-pwrite1
       898           +68.6%       1513        GEO-MEAN sched_debug.cpu#12.n=
r_switches

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      2177 =C2=B1 25%    +102.9%       4418 =C2=B1 47%  brickland1/will-it-=
scale/powersave-pwrite1
      2177          +102.9%       4418        GEO-MEAN sched_debug.cpu#46.n=
r_switches

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

        66 =C2=B1 29%     -35.3%         43 =C2=B1 13%  brickland1/will-it-=
scale/powersave-pwrite1
        66           -35.3%         43        GEO-MEAN sched_debug.cpu#0.cp=
u_load[0]

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      1.12 =C2=B1  0%     -43.8%       0.63 =C2=B1  0%  brickland1/will-it-=
scale/powersave-pwrite1
      1.12           -43.8%       0.63        GEO-MEAN turbostat.GHz

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

       167 =C2=B1 28%     +67.5%        280 =C2=B1  3%  brickland1/will-it-=
scale/powersave-pwrite1
       167           +67.5%        279        GEO-MEAN slabinfo.nfs_write_d=
ata.num_objs

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

       167 =C2=B1 28%     +67.5%        280 =C2=B1  3%  brickland1/will-it-=
scale/powersave-pwrite1
       167           +67.5%        279        GEO-MEAN slabinfo.nfs_write_d=
ata.active_objs

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      2.00 =C2=B1  7%     +75.5%       3.52 =C2=B1  3%  brickland1/will-it-=
scale/powersave-pwrite1
      2.00           +75.5%       3.52        GEO-MEAN perf-profile.cpu-cyc=
les.sched_clock_tick.scheduler_tick.update_process_times.tick_sched_handle.=
tick_sched_timer

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

        33 =C2=B1 13%     -39.4%         20 =C2=B1 13%  brickland1/will-it-=
scale/powersave-pwrite1
        33           -39.4%         19        GEO-MEAN sched_debug.cpu#91.c=
pu_load[4]

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      1.98 =C2=B1  7%     +73.2%       3.44 =C2=B1  3%  brickland1/will-it-=
scale/powersave-pwrite1
      1.98           +73.2%       3.44        GEO-MEAN perf-profile.cpu-cyc=
les.ktime_get.sched_clock_tick.scheduler_tick.update_process_times.tick_sch=
ed_handle

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      1.96 =C2=B1  7%     +71.8%       3.37 =C2=B1  3%  brickland1/will-it-=
scale/powersave-pwrite1
      1.96           +71.8%       3.37        GEO-MEAN perf-profile.cpu-cyc=
les.read_hpet.ktime_get.sched_clock_tick.scheduler_tick.update_process_times

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

       474 =C2=B1 17%     +57.3%        746 =C2=B1 31%  brickland1/will-it-=
scale/powersave-pwrite1
       474           +57.3%        745        GEO-MEAN sched_debug.cpu#110.=
ttwu_count

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      1585 =C2=B1 29%     -37.8%        985 =C2=B1 30%  brickland1/will-it-=
scale/powersave-pwrite1
      1584           -37.8%        985        GEO-MEAN sched_debug.cpu#108.=
ttwu_count

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

        23 =C2=B1  7%     +81.0%         42 =C2=B1 22%  brickland1/will-it-=
scale/powersave-pwrite1
        23           +81.0%         42        GEO-MEAN sched_debug.cpu#106.=
cpu_load[4]

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      2741 =C2=B1 19%     +43.2%       3924 =C2=B1 18%  brickland1/will-it-=
scale/powersave-pwrite1
      2741           +43.2%       3924        GEO-MEAN sched_debug.cpu#35.n=
r_switches

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      1.32 =C2=B1  6%     +41.2%       1.86 =C2=B1 12%  brickland1/will-it-=
scale/powersave-pwrite1
      1.32           +41.2%       1.86        GEO-MEAN perf-profile.cpu-cyc=
les.apic_timer_interrupt.shmem_write_end.generic_file_buffered_write.__gene=
ric_file_aio_write.generic_file_aio_write

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

         4 =C2=B1  0%     +45.0%          5 =C2=B1 12%  brickland1/will-it-=
scale/powersave-pwrite1
         4           +45.0%          5        GEO-MEAN sched_debug.cpu#92.c=
pu_load[2]

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      1.29 =C2=B1  6%     +39.9%       1.80 =C2=B1 11%  brickland1/will-it-=
scale/powersave-pwrite1
      1.29           +39.9%       1.80        GEO-MEAN perf-profile.cpu-cyc=
les.local_apic_timer_interrupt.smp_apic_timer_interrupt.apic_timer_interrup=
t.shmem_write_end.generic_file_buffered_write

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      1.29 =C2=B1  7%     +40.0%       1.80 =C2=B1 12%  brickland1/will-it-=
scale/powersave-pwrite1
      1.29           +40.0%       1.80        GEO-MEAN perf-profile.cpu-cyc=
les.hrtimer_interrupt.local_apic_timer_interrupt.smp_apic_timer_interrupt.a=
pic_timer_interrupt.shmem_write_end

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      1.29 =C2=B1  6%     +39.9%       1.81 =C2=B1 11%  brickland1/will-it-=
scale/powersave-pwrite1
      1.29           +39.9%       1.81        GEO-MEAN perf-profile.cpu-cyc=
les.smp_apic_timer_interrupt.apic_timer_interrupt.shmem_write_end.generic_f=
ile_buffered_write.__generic_file_aio_write

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

       426 =C2=B1 39%     -43.1%        242 =C2=B1 10%  brickland1/will-it-=
scale/powersave-pwrite1
       426           -43.1%        242        GEO-MEAN sched_debug.cpu#60.s=
ched_goidle

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

        28 =C2=B1  5%     +57.4%         44 =C2=B1 23%  brickland1/will-it-=
scale/powersave-pwrite1
        28           +57.4%         44        GEO-MEAN sched_debug.cpu#106.=
cpu_load[3]

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

         5 =C2=B1  7%     +26.9%          6 =C2=B1  7%  brickland1/will-it-=
scale/powersave-pwrite1
         5           +26.9%          6        GEO-MEAN sched_debug.cpu#32.c=
pu_load[3]

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      7.81 =C2=B1  7%     +39.6%      10.91 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
      7.81           +39.6%      10.91        GEO-MEAN perf-profile.cpu-cyc=
les.__run_hrtimer.hrtimer_interrupt.local_apic_timer_interrupt.smp_apic_tim=
er_interrupt.apic_timer_interrupt

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      7.78 =C2=B1  7%     +38.9%      10.80 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
      7.78           +38.9%      10.80        GEO-MEAN perf-profile.cpu-cyc=
les.tick_sched_timer.__run_hrtimer.hrtimer_interrupt.local_apic_timer_inter=
rupt.smp_apic_timer_interrupt

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      2961 =C2=B1  9%     +30.2%       3856 =C2=B1 27%  brickland1/will-it-=
scale/powersave-pwrite1
      2960           +30.2%       3856        GEO-MEAN sched_debug.cpu#18.s=
ched_goidle

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3.87 =C2=B1  5%     +40.4%       5.44 =C2=B1  1%  brickland1/will-it-=
scale/powersave-pwrite1
      3.87           +40.4%       5.44        GEO-MEAN perf-profile.cpu-cyc=
les.apic_timer_interrupt.generic_file_buffered_write.__generic_file_aio_wri=
te.generic_file_aio_write.do_sync_write

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

       106 =C2=B1  7%     +58.7%        169 =C2=B1 31%  brickland1/will-it-=
scale/powersave-pwrite1
       106           +58.7%        169        GEO-MEAN sched_debug.cpu#86.t=
twu_count

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3.76 =C2=B1  5%     +39.6%       5.24 =C2=B1  1%  brickland1/will-it-=
scale/powersave-pwrite1
      3.76           +39.6%       5.24        GEO-MEAN perf-profile.cpu-cyc=
les.hrtimer_interrupt.local_apic_timer_interrupt.smp_apic_timer_interrupt.a=
pic_timer_interrupt.generic_file_buffered_write

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

       803 =C2=B1 17%     +40.3%       1127 =C2=B1 19%  brickland1/will-it-=
scale/powersave-pwrite1
       803           +40.3%       1127        GEO-MEAN sched_debug.cpu#39.s=
ched_goidle

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3.78 =C2=B1  5%     +39.5%       5.27 =C2=B1  1%  brickland1/will-it-=
scale/powersave-pwrite1
      3.78           +39.5%       5.27        GEO-MEAN perf-profile.cpu-cyc=
les.smp_apic_timer_interrupt.apic_timer_interrupt.generic_file_buffered_wri=
te.__generic_file_aio_write.generic_file_aio_write

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3.76 =C2=B1  5%     +39.4%       5.25 =C2=B1  1%  brickland1/will-it-=
scale/powersave-pwrite1
      3.76           +39.4%       5.25        GEO-MEAN perf-profile.cpu-cyc=
les.local_apic_timer_interrupt.smp_apic_timer_interrupt.apic_timer_interrup=
t.generic_file_buffered_write.__generic_file_aio_write

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

     19688 =C2=B1 19%     +35.1%      26591 =C2=B1  0%  brickland1/will-it-=
scale/powersave-pwrite1
     19688           +35.1%      26591        GEO-MEAN sched_debug.cfs_rq[1=
18]:/.exec_clock

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      1712 =C2=B1 17%     +44.7%       2477 =C2=B1 25%  brickland1/will-it-=
scale/powersave-pwrite1
      1712           +44.7%       2476        GEO-MEAN sched_debug.cpu#39.n=
r_switches

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

        73 =C2=B1  1%     +63.7%        119 =C2=B1 47%  brickland1/will-it-=
scale/powersave-pwrite1
        73           +63.7%        119        GEO-MEAN sched_debug.cpu#86.t=
twu_local

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

       429 =C2=B1 23%     +46.7%        630 =C2=B1 29%  brickland1/will-it-=
scale/powersave-pwrite1
       429           +46.7%        630        GEO-MEAN sched_debug.cpu#26.t=
twu_count

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

        98 =C2=B1 15%     +65.9%        162 =C2=B1 36%  brickland1/will-it-=
scale/powersave-pwrite1
        98           +65.9%        162        GEO-MEAN sched_debug.cpu#86.s=
ched_goidle

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

     71965 =C2=B1 14%     +17.5%      84574 =C2=B1  0%  brickland1/will-it-=
scale/powersave-pwrite1
     71965           +17.5%      84574        GEO-MEAN sched_debug.cfs_rq[6=
0]:/.exec_clock

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

       367 =C2=B1 17%     +43.8%        528 =C2=B1 24%  brickland1/will-it-=
scale/powersave-pwrite1
       367           +43.8%        528        GEO-MEAN sched_debug.cpu#82.n=
r_switches

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

       371 =C2=B1 17%     +45.0%        538 =C2=B1 26%  brickland1/will-it-=
scale/powersave-pwrite1
       371           +45.0%        538        GEO-MEAN sched_debug.cpu#82.s=
ched_count

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

    196924 =C2=B1 13%     +17.8%     231931 =C2=B1  0%  brickland1/will-it-=
scale/powersave-pwrite1
    196924           +17.8%     231931        GEO-MEAN sched_debug.cfs_rq[6=
0]:/.spread0

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

       309 =C2=B1 10%     +65.1%        511 =C2=B1 40%  brickland1/will-it-=
scale/powersave-pwrite1
       309           +65.1%        511        GEO-MEAN sched_debug.cpu#86.n=
r_switches

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3844 =C2=B1 17%     +30.9%       5032 =C2=B1  0%  brickland1/will-it-=
scale/powersave-pwrite1
      3844           +30.9%       5032        GEO-MEAN sched_debug.cpu#118.=
curr->pid

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

       313 =C2=B1 10%     +64.4%        514 =C2=B1 39%  brickland1/will-it-=
scale/powersave-pwrite1
       313           +64.4%        514        GEO-MEAN sched_debug.cpu#86.s=
ched_count

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

       928 =C2=B1 32%     -28.0%        668 =C2=B1 14%  brickland1/will-it-=
scale/powersave-pwrite1
       928           -28.0%        668        GEO-MEAN sched_debug.cpu#63.n=
r_switches

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3080 =C2=B1  6%     +25.8%       3875 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
      3080           +25.8%       3875        GEO-MEAN sched_debug.cfs_rq[1=
07]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3070 =C2=B1  6%     +25.4%       3849 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
      3070           +25.4%       3849        GEO-MEAN sched_debug.cfs_rq[1=
09]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      6762 =C2=B1 12%     -18.8%       5493 =C2=B1 16%  brickland1/will-it-=
scale/powersave-pwrite1
      6762           -18.8%       5493        GEO-MEAN proc-vmstat.pgalloc_=
dma32

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3072 =C2=B1  6%     +25.5%       3854 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
      3072           +25.5%       3854        GEO-MEAN sched_debug.cfs_rq[1=
08]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

         4 =C2=B1  0%     +35.0%          5 =C2=B1 14%  brickland1/will-it-=
scale/powersave-pwrite1
         4           +35.0%          5        GEO-MEAN sched_debug.cpu#92.c=
pu_load[4]

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

         4 =C2=B1  0%     +45.0%          5 =C2=B1 20%  brickland1/will-it-=
scale/powersave-pwrite1
         4           +45.0%          5        GEO-MEAN sched_debug.cpu#92.c=
pu_load[3]

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

   1609011 =C2=B1 17%     +29.1%    2076675 =C2=B1  0%  brickland1/will-it-=
scale/powersave-pwrite1
   1609011           +29.1%    2076675        GEO-MEAN sched_debug.cfs_rq[1=
18]:/.min_vruntime

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3209 =C2=B1  2%     +21.4%       3896 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
      3209           +21.4%       3896        GEO-MEAN sched_debug.cfs_rq[1=
00]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3105 =C2=B1  5%     +25.1%       3885 =C2=B1  1%  brickland1/will-it-=
scale/powersave-pwrite1
      3105           +25.1%       3885        GEO-MEAN sched_debug.cfs_rq[1=
06]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3197 =C2=B1  2%     +21.2%       3875 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
      3197           +21.2%       3875        GEO-MEAN sched_debug.cfs_rq[1=
02]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3198 =C2=B1  2%     +22.1%       3906 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
      3198           +22.1%       3906        GEO-MEAN sched_debug.cfs_rq[9=
5]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3195 =C2=B1  2%     +22.0%       3897 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
      3195           +22.0%       3897        GEO-MEAN sched_debug.cfs_rq[9=
9]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3202 =C2=B1  2%     +22.4%       3919 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
      3202           +22.4%       3919        GEO-MEAN sched_debug.cfs_rq[9=
7]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3211 =C2=B1  2%     +21.3%       3895 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
      3211           +21.3%       3895        GEO-MEAN sched_debug.cfs_rq[1=
01]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3195 =C2=B1  2%     +22.3%       3908 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
      3195           +22.3%       3908        GEO-MEAN sched_debug.cfs_rq[9=
8]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3045 =C2=B1  5%     +23.4%       3758 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
      3045           +23.4%       3758        GEO-MEAN sched_debug.cfs_rq[1=
19]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3076 =C2=B1  5%     +23.9%       3811 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
      3075           +23.9%       3810        GEO-MEAN sched_debug.cfs_rq[1=
13]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3060 =C2=B1  5%     +24.2%       3800 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
      3060           +24.2%       3800        GEO-MEAN sched_debug.cfs_rq[1=
14]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3215 =C2=B1  3%     +21.2%       3897 =C2=B1  1%  brickland1/will-it-=
scale/powersave-pwrite1
      3215           +21.2%       3897        GEO-MEAN sched_debug.cfs_rq[9=
4]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3229 =C2=B1  3%     +21.0%       3906 =C2=B1  1%  brickland1/will-it-=
scale/powersave-pwrite1
      3229           +21.0%       3906        GEO-MEAN sched_debug.cfs_rq[9=
3]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3071 =C2=B1  6%     +24.9%       3834 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
      3070           +24.9%       3834        GEO-MEAN sched_debug.cfs_rq[1=
11]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

       336 =C2=B1  4%     +23.1%        413 =C2=B1  6%  brickland1/will-it-=
scale/powersave-pwrite1
       336           +23.1%        413        GEO-MEAN sched_debug.cfs_rq[1=
06]:/.tg_runnable_contrib

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3081 =C2=B1  6%     +24.9%       3848 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
      3081           +24.9%       3848        GEO-MEAN sched_debug.cfs_rq[1=
10]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3202 =C2=B1  2%     +21.9%       3904 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
      3202           +21.9%       3904        GEO-MEAN sched_debug.cfs_rq[9=
6]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3102 =C2=B1  5%     +25.3%       3888 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
      3102           +25.3%       3888        GEO-MEAN sched_debug.cfs_rq[1=
05]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

     19954 =C2=B1  1%     +20.9%      24119 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
     19954           +20.9%      24119        GEO-MEAN sched_debug.cfs_rq[1=
06]:/.exec_clock

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3056 =C2=B1  5%     +24.0%       3790 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
      3056           +24.0%       3790        GEO-MEAN sched_debug.cfs_rq[1=
15]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3063 =C2=B1  5%     +23.7%       3791 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
      3063           +23.7%       3790        GEO-MEAN sched_debug.cfs_rq[1=
16]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3204 =C2=B1  2%     +20.8%       3872 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
      3204           +20.8%       3872        GEO-MEAN sched_debug.cfs_rq[1=
03]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3062 =C2=B1  5%     +23.4%       3778 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
      3062           +23.4%       3778        GEO-MEAN sched_debug.cfs_rq[1=
17]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3072 =C2=B1  5%     +23.5%       3795 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
      3072           +23.5%       3795        GEO-MEAN sched_debug.cfs_rq[1=
12]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3060 =C2=B1  5%     +23.1%       3768 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
      3060           +23.1%       3768        GEO-MEAN sched_debug.cfs_rq[1=
18]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      1.23 =C2=B1  5%     +18.3%       1.46 =C2=B1  4%  brickland1/will-it-=
scale/powersave-pwrite1
      1.23           +18.3%       1.46        GEO-MEAN perf-profile.cpu-cyc=
les.apic_timer_interrupt.__generic_file_aio_write.generic_file_aio_write.do=
_sync_write.vfs_write

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

     15533 =C2=B1  4%     +23.4%      19163 =C2=B1  6%  brickland1/will-it-=
scale/powersave-pwrite1
     15533           +23.4%      19162        GEO-MEAN sched_debug.cfs_rq[1=
06]:/.avg->runnable_avg_sum

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3209 =C2=B1  2%     +21.7%       3907 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
      3209           +21.7%       3907        GEO-MEAN sched_debug.cfs_rq[1=
04]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3235 =C2=B1  3%     +19.9%       3877 =C2=B1  1%  brickland1/will-it-=
scale/powersave-pwrite1
      3235           +19.9%       3877        GEO-MEAN sched_debug.cfs_rq[9=
2]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      1.21 =C2=B1  6%     +17.1%       1.41 =C2=B1  4%  brickland1/will-it-=
scale/powersave-pwrite1
      1.21           +17.1%       1.41        GEO-MEAN perf-profile.cpu-cyc=
les.local_apic_timer_interrupt.smp_apic_timer_interrupt.apic_timer_interrup=
t.__generic_file_aio_write.generic_file_aio_write

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      1.21 =C2=B1  6%     +17.1%       1.41 =C2=B1  4%  brickland1/will-it-=
scale/powersave-pwrite1
      1.21           +17.1%       1.41        GEO-MEAN perf-profile.cpu-cyc=
les.hrtimer_interrupt.local_apic_timer_interrupt.smp_apic_timer_interrupt.a=
pic_timer_interrupt.__generic_file_aio_write

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      1.21 =C2=B1  6%     +17.2%       1.42 =C2=B1  4%  brickland1/will-it-=
scale/powersave-pwrite1
      1.21           +17.2%       1.42        GEO-MEAN perf-profile.cpu-cyc=
les.smp_apic_timer_interrupt.apic_timer_interrupt.__generic_file_aio_write.=
generic_file_aio_write.do_sync_write

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3230 =C2=B1  2%     +19.9%       3873 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
      3230           +19.9%       3873        GEO-MEAN sched_debug.cfs_rq[8=
3]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3235 =C2=B1  2%     +20.3%       3891 =C2=B1  1%  brickland1/will-it-=
scale/powersave-pwrite1
      3235           +20.3%       3891        GEO-MEAN sched_debug.cfs_rq[8=
5]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3239 =C2=B1  3%     +19.7%       3877 =C2=B1  1%  brickland1/will-it-=
scale/powersave-pwrite1
      3239           +19.7%       3877        GEO-MEAN sched_debug.cfs_rq[8=
9]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3248 =C2=B1  3%     +19.7%       3889 =C2=B1  1%  brickland1/will-it-=
scale/powersave-pwrite1
      3248           +19.7%       3889        GEO-MEAN sched_debug.cfs_rq[9=
1]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3230 =C2=B1  2%     +19.9%       3873 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
      3230           +19.9%       3873        GEO-MEAN sched_debug.cfs_rq[7=
7]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      1.38 =C2=B1  2%     -14.6%       1.18 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
      1.38           -14.6%       1.18        GEO-MEAN perf-profile.cpu-cyc=
les.mutex_unlock.do_sync_write.vfs_write.sys_pwrite64.system_call_fastpath

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

        49 =C2=B1  9%     +33.9%         66 =C2=B1 18%  brickland1/will-it-=
scale/powersave-pwrite1
        49           +33.9%         66        GEO-MEAN sched_debug.cpu#118.=
ttwu_local

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3235 =C2=B1  2%     +20.3%       3891 =C2=B1  1%  brickland1/will-it-=
scale/powersave-pwrite1
      3235           +20.3%       3891        GEO-MEAN sched_debug.cfs_rq[8=
4]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3226 =C2=B1  2%     +19.7%       3862 =C2=B1  1%  brickland1/will-it-=
scale/powersave-pwrite1
      3226           +19.7%       3861        GEO-MEAN sched_debug.cfs_rq[8=
7]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3227 =C2=B1  3%     +20.0%       3872 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
      3227           +20.0%       3872        GEO-MEAN sched_debug.cfs_rq[8=
2]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3236 =C2=B1  2%     +20.0%       3882 =C2=B1  1%  brickland1/will-it-=
scale/powersave-pwrite1
      3235           +20.0%       3882        GEO-MEAN sched_debug.cfs_rq[8=
6]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3239 =C2=B1  3%     +20.1%       3891 =C2=B1  1%  brickland1/will-it-=
scale/powersave-pwrite1
      3239           +20.1%       3891        GEO-MEAN sched_debug.cfs_rq[9=
0]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3239 =C2=B1  3%     +19.5%       3870 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
      3239           +19.5%       3870        GEO-MEAN sched_debug.cfs_rq[8=
1]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3242 =C2=B1  3%     +18.3%       3834 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
      3242           +18.3%       3834        GEO-MEAN sched_debug.cfs_rq[7=
9]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3240 =C2=B1  2%     +18.9%       3851 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
      3240           +18.9%       3851        GEO-MEAN sched_debug.cfs_rq[7=
8]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3241 =C2=B1  2%     +18.1%       3828 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
      3241           +18.1%       3828        GEO-MEAN sched_debug.cfs_rq[8=
0]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3232 =C2=B1  2%     +18.9%       3842 =C2=B1  1%  brickland1/will-it-=
scale/powersave-pwrite1
      3232           +18.9%       3842        GEO-MEAN sched_debug.cfs_rq[8=
8]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3245 =C2=B1  2%     +18.2%       3835 =C2=B1  3%  brickland1/will-it-=
scale/powersave-pwrite1
      3245           +18.2%       3835        GEO-MEAN sched_debug.cfs_rq[6=
9]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3248 =C2=B1  2%     +17.9%       3828 =C2=B1  3%  brickland1/will-it-=
scale/powersave-pwrite1
      3247           +17.9%       3828        GEO-MEAN sched_debug.cfs_rq[7=
0]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

     25.35 =C2=B1  1%     -15.1%      21.52 =C2=B1  1%  brickland1/will-it-=
scale/powersave-pwrite1
     25.35           -15.1%      21.52        GEO-MEAN turbostat.%pc2

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3239 =C2=B1  2%     +18.6%       3841 =C2=B1  3%  brickland1/will-it-=
scale/powersave-pwrite1
      3239           +18.6%       3841        GEO-MEAN sched_debug.cfs_rq[7=
6]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3254 =C2=B1  2%     +17.4%       3821 =C2=B1  4%  brickland1/will-it-=
scale/powersave-pwrite1
      3254           +17.4%       3821        GEO-MEAN sched_debug.cfs_rq[7=
1]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

        78 =C2=B1 15%     +30.0%        101 =C2=B1 12%  brickland1/will-it-=
scale/powersave-pwrite1
        78           +30.0%        101        GEO-MEAN sched_debug.cpu#118.=
ttwu_count

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3247 =C2=B1  2%     +15.2%       3742 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
      3247           +15.2%       3742        GEO-MEAN sched_debug.cfs_rq[6=
1]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3236 =C2=B1  2%     +17.9%       3814 =C2=B1  4%  brickland1/will-it-=
scale/powersave-pwrite1
      3235           +17.9%       3814        GEO-MEAN sched_debug.cfs_rq[7=
2]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

       421 =C2=B1  5%     +11.4%        470 =C2=B1  4%  brickland1/will-it-=
scale/powersave-pwrite1
       421           +11.4%        470        GEO-MEAN sched_debug.cfs_rq[9=
1]:/.tg_runnable_contrib

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3249 =C2=B1  2%     +15.0%       3735 =C2=B1  3%  brickland1/will-it-=
scale/powersave-pwrite1
      3249           +15.0%       3735        GEO-MEAN sched_debug.cfs_rq[6=
2]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3246 =C2=B1  2%     +17.5%       3815 =C2=B1  3%  brickland1/will-it-=
scale/powersave-pwrite1
      3246           +17.5%       3815        GEO-MEAN sched_debug.cfs_rq[7=
4]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3255 =C2=B1  2%     +16.7%       3799 =C2=B1  3%  brickland1/will-it-=
scale/powersave-pwrite1
      3254           +16.7%       3799        GEO-MEAN sched_debug.cfs_rq[6=
8]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

     19474 =C2=B1  5%     +11.2%      21665 =C2=B1  4%  brickland1/will-it-=
scale/powersave-pwrite1
     19474           +11.2%      21665        GEO-MEAN sched_debug.cfs_rq[9=
1]:/.avg->runnable_avg_sum

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3239 =C2=B1  2%     +17.7%       3813 =C2=B1  3%  brickland1/will-it-=
scale/powersave-pwrite1
      3239           +17.7%       3813        GEO-MEAN sched_debug.cfs_rq[7=
5]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3260 =C2=B1  3%     +14.6%       3735 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
      3260           +14.6%       3735        GEO-MEAN sched_debug.cfs_rq[5=
9]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3244 =C2=B1  3%     +17.0%       3797 =C2=B1  3%  brickland1/will-it-=
scale/powersave-pwrite1
      3244           +17.0%       3796        GEO-MEAN sched_debug.cfs_rq[7=
3]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      5.81 =C2=B1  5%     -10.1%       5.22 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
      5.81           -10.1%       5.22        GEO-MEAN perf-profile.cpu-cyc=
les.read_hpet.ktime_get_update_offsets.hrtimer_interrupt.local_apic_timer_i=
nterrupt.smp_apic_timer_interrupt

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3319 =C2=B1  2%     +13.7%       3773 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
      3318           +13.7%       3773        GEO-MEAN sched_debug.cfs_rq[4=
6]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3978 =C2=B1  4%      +9.8%       4369 =C2=B1  4%  brickland1/will-it-=
scale/powersave-pwrite1
      3978            +9.8%       4369        GEO-MEAN sched_debug.cpu#90.c=
urr->pid

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3257 =C2=B1  2%     +14.8%       3740 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
      3257           +14.8%       3740        GEO-MEAN sched_debug.cfs_rq[6=
0]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3321 =C2=B1  2%     +13.7%       3775 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
      3321           +13.7%       3774        GEO-MEAN sched_debug.cfs_rq[4=
7]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3318 =C2=B1  3%     +13.4%       3764 =C2=B1  3%  brickland1/will-it-=
scale/powersave-pwrite1
      3318           +13.4%       3764        GEO-MEAN sched_debug.cfs_rq[4=
4]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3272 =C2=B1  3%     +14.2%       3736 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
      3271           +14.2%       3736        GEO-MEAN sched_debug.cfs_rq[5=
8]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3301 =C2=B1  3%     +13.9%       3759 =C2=B1  3%  brickland1/will-it-=
scale/powersave-pwrite1
      3301           +13.9%       3759        GEO-MEAN sched_debug.cfs_rq[5=
0]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3294 =C2=B1  3%     +13.5%       3740 =C2=B1  3%  brickland1/will-it-=
scale/powersave-pwrite1
      3294           +13.5%       3740        GEO-MEAN sched_debug.cfs_rq[5=
3]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      1.37 =C2=B1  5%     +14.1%       1.57 =C2=B1  4%  brickland1/will-it-=
scale/powersave-pwrite1
      1.37           +14.1%       1.57        GEO-MEAN perf-profile.cpu-cyc=
les.apic_timer_interrupt.fsnotify.vfs_write.sys_pwrite64.system_call_fastpa=
th

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3241 =C2=B1  3%     +16.2%       3766 =C2=B1  3%  brickland1/will-it-=
scale/powersave-pwrite1
      3241           +16.2%       3765        GEO-MEAN sched_debug.cfs_rq[6=
5]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3323 =C2=B1  2%     +13.3%       3763 =C2=B1  3%  brickland1/will-it-=
scale/powersave-pwrite1
      3323           +13.3%       3763        GEO-MEAN sched_debug.cfs_rq[4=
9]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3290 =C2=B1  2%     +14.0%       3752 =C2=B1  3%  brickland1/will-it-=
scale/powersave-pwrite1
      3290           +14.0%       3751        GEO-MEAN sched_debug.cfs_rq[5=
6]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3240 =C2=B1  2%     +15.9%       3755 =C2=B1  3%  brickland1/will-it-=
scale/powersave-pwrite1
      3240           +15.9%       3754        GEO-MEAN sched_debug.cfs_rq[6=
6]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3242 =C2=B1  2%     +14.5%       3712 =C2=B1  3%  brickland1/will-it-=
scale/powersave-pwrite1
      3242           +14.5%       3712        GEO-MEAN sched_debug.cfs_rq[6=
3]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3307 =C2=B1  3%     +13.9%       3768 =C2=B1  3%  brickland1/will-it-=
scale/powersave-pwrite1
      3307           +13.9%       3768        GEO-MEAN sched_debug.cfs_rq[5=
1]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3255 =C2=B1  2%     +15.6%       3762 =C2=B1  3%  brickland1/will-it-=
scale/powersave-pwrite1
      3255           +15.6%       3762        GEO-MEAN sched_debug.cfs_rq[6=
7]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3301 =C2=B1  3%     +13.4%       3744 =C2=B1  3%  brickland1/will-it-=
scale/powersave-pwrite1
      3301           +13.4%       3744        GEO-MEAN sched_debug.cfs_rq[5=
5]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3315 =C2=B1  3%     +13.7%       3769 =C2=B1  3%  brickland1/will-it-=
scale/powersave-pwrite1
      3315           +13.7%       3769        GEO-MEAN sched_debug.cfs_rq[4=
3]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3481 =C2=B1  4%     +10.4%       3842 =C2=B1  3%  brickland1/will-it-=
scale/powersave-pwrite1
      3481           +10.4%       3842        GEO-MEAN sched_debug.cfs_rq[3=
5]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

     14790 =C2=B1  1%     +17.6%      17396 =C2=B1 10%  brickland1/will-it-=
scale/powersave-pwrite1
     14790           +17.6%      17396        GEO-MEAN sched_debug.cfs_rq[4=
7]:/.exec_clock

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      5.07 =C2=B1  8%     +13.7%       5.77 =C2=B1  1%  brickland1/will-it-=
scale/powersave-pwrite1
      5.07           +13.7%       5.77        GEO-MEAN perf-profile.cpu-cyc=
les.ktime_get.tick_sched_timer.__run_hrtimer.hrtimer_interrupt.local_apic_t=
imer_interrupt

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3.90 =C2=B1  2%     -11.1%       3.47 =C2=B1  1%  brickland1/will-it-=
scale/powersave-pwrite1
      3.90           -11.1%       3.47        GEO-MEAN perf-profile.cpu-cyc=
les.__sb_start_write.vfs_write.sys_pwrite64.system_call_fastpath.__libc_pwr=
ite

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3295 =C2=B1  3%     +13.5%       3739 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
      3295           +13.5%       3739        GEO-MEAN sched_debug.cfs_rq[5=
4]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3274 =C2=B1  2%     +14.1%       3737 =C2=B1  3%  brickland1/will-it-=
scale/powersave-pwrite1
      3274           +14.1%       3737        GEO-MEAN sched_debug.cfs_rq[5=
7]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3449 =C2=B1  4%      +9.0%       3761 =C2=B1  3%  brickland1/will-it-=
scale/powersave-pwrite1
      3449            +9.0%       3761        GEO-MEAN sched_debug.cfs_rq[4=
2]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

        73 =C2=B1  2%     +21.0%         88 =C2=B1 18%  brickland1/will-it-=
scale/powersave-pwrite1
        73           +21.0%         88        GEO-MEAN sched_debug.cpu#87.t=
twu_local

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3447 =C2=B1  4%     +10.6%       3811 =C2=B1  3%  brickland1/will-it-=
scale/powersave-pwrite1
      3447           +10.6%       3811        GEO-MEAN sched_debug.cfs_rq[3=
9]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3327 =C2=B1  2%     +13.4%       3772 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
      3327           +13.4%       3772        GEO-MEAN sched_debug.cfs_rq[4=
8]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3493 =C2=B1  4%      +9.8%       3834 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
      3493            +9.8%       3834        GEO-MEAN sched_debug.cfs_rq[2=
9]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3247 =C2=B1  3%     +15.5%       3752 =C2=B1  3%  brickland1/will-it-=
scale/powersave-pwrite1
      3247           +15.5%       3752        GEO-MEAN sched_debug.cfs_rq[6=
4]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3498 =C2=B1  4%      +9.7%       3838 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
      3498            +9.7%       3838        GEO-MEAN sched_debug.cfs_rq[3=
0]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3309 =C2=B1  3%     +13.3%       3749 =C2=B1  3%  brickland1/will-it-=
scale/powersave-pwrite1
      3309           +13.3%       3749        GEO-MEAN sched_debug.cfs_rq[5=
2]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3465 =C2=B1  5%     +10.0%       3812 =C2=B1  3%  brickland1/will-it-=
scale/powersave-pwrite1
      3465           +10.0%       3812        GEO-MEAN sched_debug.cfs_rq[3=
7]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      1.34 =C2=B1  4%     +12.6%       1.51 =C2=B1  4%  brickland1/will-it-=
scale/powersave-pwrite1
      1.34           +12.6%       1.51        GEO-MEAN perf-profile.cpu-cyc=
les.local_apic_timer_interrupt.smp_apic_timer_interrupt.apic_timer_interrup=
t.fsnotify.vfs_write

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3449 =C2=B1  5%     +10.4%       3806 =C2=B1  3%  brickland1/will-it-=
scale/powersave-pwrite1
      3449           +10.4%       3806        GEO-MEAN sched_debug.cfs_rq[3=
8]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3492 =C2=B1  4%      +9.5%       3824 =C2=B1  3%  brickland1/will-it-=
scale/powersave-pwrite1
      3492            +9.5%       3824        GEO-MEAN sched_debug.cfs_rq[3=
1]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3471 =C2=B1  5%     +10.1%       3820 =C2=B1  3%  brickland1/will-it-=
scale/powersave-pwrite1
      3471           +10.1%       3820        GEO-MEAN sched_debug.cfs_rq[3=
6]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3498 =C2=B1  4%      +9.2%       3819 =C2=B1  3%  brickland1/will-it-=
scale/powersave-pwrite1
      3498            +9.2%       3819        GEO-MEAN sched_debug.cfs_rq[2=
7]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3478 =C2=B1  5%     +10.0%       3827 =C2=B1  3%  brickland1/will-it-=
scale/powersave-pwrite1
      3478           +10.0%       3827        GEO-MEAN sched_debug.cfs_rq[3=
4]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3474 =C2=B1  4%     +10.3%       3834 =C2=B1  3%  brickland1/will-it-=
scale/powersave-pwrite1
      3474           +10.3%       3834        GEO-MEAN sched_debug.cfs_rq[3=
3]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      5.04 =C2=B1  8%     +12.8%       5.68 =C2=B1  1%  brickland1/will-it-=
scale/powersave-pwrite1
      5.04           +12.8%       5.68        GEO-MEAN perf-profile.cpu-cyc=
les.read_hpet.ktime_get.tick_sched_timer.__run_hrtimer.hrtimer_interrupt

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3452 =C2=B1  4%      +9.4%       3776 =C2=B1  3%  brickland1/will-it-=
scale/powersave-pwrite1
      3452            +9.4%       3776        GEO-MEAN sched_debug.cfs_rq[4=
0]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3455 =C2=B1  4%      +9.2%       3772 =C2=B1  4%  brickland1/will-it-=
scale/powersave-pwrite1
      3455            +9.2%       3771        GEO-MEAN sched_debug.cfs_rq[4=
1]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3478 =C2=B1  5%      +9.6%       3811 =C2=B1  3%  brickland1/will-it-=
scale/powersave-pwrite1
      3478            +9.6%       3811        GEO-MEAN sched_debug.cfs_rq[3=
2]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      1.83 =C2=B1  5%     -11.3%       1.62 =C2=B1  5%  brickland1/will-it-=
scale/powersave-pwrite1
      1.83           -11.3%       1.62        GEO-MEAN perf-profile.cpu-cyc=
les.rw_verify_area.vfs_write.sys_pwrite64.system_call_fastpath.__libc_pwrite

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3321 =C2=B1  3%     +12.8%       3747 =C2=B1  3%  brickland1/will-it-=
scale/powersave-pwrite1
      3321           +12.8%       3747        GEO-MEAN sched_debug.cfs_rq[4=
5]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      1.34 =C2=B1  4%     +12.7%       1.51 =C2=B1  4%  brickland1/will-it-=
scale/powersave-pwrite1
      1.34           +12.7%       1.51        GEO-MEAN perf-profile.cpu-cyc=
les.hrtimer_interrupt.local_apic_timer_interrupt.smp_apic_timer_interrupt.a=
pic_timer_interrupt.fsnotify

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      1.35 =C2=B1  5%     +12.9%       1.52 =C2=B1  4%  brickland1/will-it-=
scale/powersave-pwrite1
      1.35           +12.9%       1.52        GEO-MEAN perf-profile.cpu-cyc=
les.smp_apic_timer_interrupt.apic_timer_interrupt.fsnotify.vfs_write.sys_pw=
rite64

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3507 =C2=B1  4%      +9.0%       3822 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
      3507            +9.0%       3822        GEO-MEAN sched_debug.cfs_rq[2=
8]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3537 =C2=B1  4%      +9.1%       3858 =C2=B1  3%  brickland1/will-it-=
scale/powersave-pwrite1
      3537            +9.1%       3858        GEO-MEAN sched_debug.cfs_rq[2=
1]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      1.18 =C2=B1  5%      -8.0%       1.09 =C2=B1  6%  brickland1/will-it-=
scale/powersave-pwrite1
      1.18            -8.0%       1.09        GEO-MEAN perf-profile.cpu-cyc=
les.local_apic_timer_interrupt.smp_apic_timer_interrupt.apic_timer_interrup=
t.__libc_pwrite

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      1.89 =C2=B1  1%     -10.3%       1.70 =C2=B1  1%  brickland1/will-it-=
scale/powersave-pwrite1
      1.89           -10.3%       1.70        GEO-MEAN perf-profile.cpu-cyc=
les.system_call.__libc_pwrite

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3519 =C2=B1  5%      +9.5%       3855 =C2=B1  3%  brickland1/will-it-=
scale/powersave-pwrite1
      3519            +9.5%       3855        GEO-MEAN sched_debug.cfs_rq[1=
9]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      5.84 =C2=B1  4%      -7.7%       5.40 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
      5.84            -7.7%       5.40        GEO-MEAN perf-profile.cpu-cyc=
les.ktime_get_update_offsets.hrtimer_interrupt.local_apic_timer_interrupt.s=
mp_apic_timer_interrupt.apic_timer_interrupt

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

     16504 =C2=B1  0%      -9.7%      14896 =C2=B1  1%  brickland1/will-it-=
scale/powersave-pwrite1
     16504            -9.7%      14896        GEO-MEAN slabinfo.kmalloc-192=
.active_objs

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

     16506 =C2=B1  0%      -9.8%      14897 =C2=B1  1%  brickland1/will-it-=
scale/powersave-pwrite1
     16506            -9.8%      14897        GEO-MEAN slabinfo.kmalloc-192=
.num_objs

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

     32046 =C2=B1  0%     +11.3%      35673 =C2=B1  0%  brickland1/will-it-=
scale/powersave-pwrite1
     32046           +11.3%      35673        GEO-MEAN sched_debug.cfs_rq[9=
1]:/.exec_clock

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3521 =C2=B1  5%      +9.4%       3853 =C2=B1  3%  brickland1/will-it-=
scale/powersave-pwrite1
      3521            +9.4%       3853        GEO-MEAN sched_debug.cfs_rq[2=
0]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      1.18 =C2=B1  5%      -7.8%       1.09 =C2=B1  6%  brickland1/will-it-=
scale/powersave-pwrite1
      1.18            -7.8%       1.09        GEO-MEAN perf-profile.cpu-cyc=
les.hrtimer_interrupt.local_apic_timer_interrupt.smp_apic_timer_interrupt.a=
pic_timer_interrupt.__libc_pwrite

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

    853455 =C2=B1  1%     +10.8%     945556 =C2=B1  1%  brickland1/will-it-=
scale/powersave-pwrite1
    853455           +10.8%     945556        GEO-MEAN sched_debug.cpu#76.a=
vg_idle

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3519 =C2=B1  4%      +8.2%       3807 =C2=B1  3%  brickland1/will-it-=
scale/powersave-pwrite1
      3519            +8.2%       3807        GEO-MEAN sched_debug.cfs_rq[2=
6]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      1.19 =C2=B1  4%      -7.9%       1.09 =C2=B1  5%  brickland1/will-it-=
scale/powersave-pwrite1
      1.19            -7.9%       1.09        GEO-MEAN perf-profile.cpu-cyc=
les.smp_apic_timer_interrupt.apic_timer_interrupt.__libc_pwrite

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

    842339 =C2=B1  2%     +11.3%     937538 =C2=B1  1%  brickland1/will-it-=
scale/powersave-pwrite1
    842339           +11.3%     937537        GEO-MEAN sched_debug.cpu#64.a=
vg_idle

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

     15887 =C2=B1  4%      +8.0%      17162 =C2=B1  3%  brickland1/will-it-=
scale/powersave-pwrite1
     15887            +8.0%      17162        GEO-MEAN sched_debug.cfs_rq[9=
0]:/.avg->runnable_avg_sum

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

       344 =C2=B1  4%      +7.7%        370 =C2=B1  3%  brickland1/will-it-=
scale/powersave-pwrite1
       344            +7.7%        370        GEO-MEAN sched_debug.cfs_rq[9=
0]:/.tg_runnable_contrib

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      1.21 =C2=B1  4%      -7.4%       1.12 =C2=B1  6%  brickland1/will-it-=
scale/powersave-pwrite1
      1.21            -7.4%       1.12        GEO-MEAN perf-profile.cpu-cyc=
les.apic_timer_interrupt.__libc_pwrite

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

    835125 =C2=B1  2%     +11.7%     932608 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
    835125           +11.7%     932608        GEO-MEAN sched_debug.cpu#69.a=
vg_idle

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3547 =C2=B1  4%      +9.3%       3879 =C2=B1  3%  brickland1/will-it-=
scale/powersave-pwrite1
      3547            +9.3%       3878        GEO-MEAN sched_debug.cfs_rq[2=
2]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

    835405 =C2=B1  1%     +10.3%     921248 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
    835405           +10.3%     921247        GEO-MEAN sched_debug.cpu#73.a=
vg_idle

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

    412312 =C2=B1 29%     +32.7%     547007 =C2=B1  1%  brickland1/will-it-=
scale/powersave-pwrite1
    412312           +32.7%     547007        GEO-MEAN softirqs.SCHED

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

    844305 =C2=B1  1%     +10.6%     933588 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
    844305           +10.6%     933587        GEO-MEAN sched_debug.cpu#65.a=
vg_idle

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

    833909 =C2=B1  1%     +11.6%     931037 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
    833909           +11.6%     931037        GEO-MEAN sched_debug.cpu#68.a=
vg_idle

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

     12247 =C2=B1  2%      +6.3%      13016 =C2=B1  4%  brickland1/will-it-=
scale/powersave-pwrite1
     12247            +6.3%      13016        GEO-MEAN sched_debug.cfs_rq[1=
05]:/.avg->runnable_avg_sum

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      3526 =C2=B1  4%      +8.0%       3810 =C2=B1  3%  brickland1/will-it-=
scale/powersave-pwrite1
      3526            +8.0%       3810        GEO-MEAN sched_debug.cfs_rq[2=
5]:/.tg_load_avg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      0.00 =C2=B1  0%    -100.0%       0.00 =C2=B1  0%  brickland1/will-it-=
scale/powersave-pwrite1
      0.00          -100.0%       0.00        GEO-MEAN energy.energy-pkg

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      0.00 =C2=B1  0%    -100.0%       0.00 =C2=B1  0%  brickland1/will-it-=
scale/powersave-pwrite1
      0.00          -100.0%       0.00        GEO-MEAN energy.energy-cores

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      1220 =C2=B1  0%     -56.2%        534 =C2=B1  0%  brickland1/will-it-=
scale/powersave-pwrite1
      1220           -56.2%        534        GEO-MEAN turbostat.Cor_W

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      1233 =C2=B1  0%     -55.6%        547 =C2=B1  0%  brickland1/will-it-=
scale/powersave-pwrite1
      1233           -55.6%        547        GEO-MEAN turbostat.Pkg_W

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

     66125 =C2=B1  0%     -12.5%      57879 =C2=B1  0%  brickland1/will-it-=
scale/powersave-pwrite1
     66125           -12.5%      57878        GEO-MEAN vmstat.system.in

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

       495 =C2=B1  1%      -6.0%        465 =C2=B1  2%  brickland1/will-it-=
scale/powersave-pwrite1
       495            -6.0%        465        GEO-MEAN time.user_time

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

      1649 =C2=B1  0%      +3.1%       1700 =C2=B1  0%  brickland1/will-it-=
scale/powersave-pwrite1
      1649            +3.1%       1699        GEO-MEAN vmstat.system.cs

       v3.14-rc4  f3ca4164529b875374c410193b  =

----------------  --------------------------  =

       311 =C2=B1  0%      +1.0%        314 =C2=B1  0%  brickland1/will-it-=
scale/powersave-pwrite1
       311            +1.0%        314        GEO-MEAN time.elapsed_time




brickland1: Brickland Ivy Bridge-EX
Memory: 128G

testbox: fake
Memory: 12G




                                  time.elapsed_time

  314.5 O+---------------O----------------O----------------O---------------=
-O
        |                                                                  =
 |
    314 ++                                                                 =
 |
        |                                                                  =
 |
  313.5 ++                                                                 =
 |
        |                                                                  =
 |
    313 ++                                                                 =
 |
        |                                                                  =
 |
  312.5 ++                                                                 =
 |
        |                                                                  =
 |
    312 ++                                                                 =
 |
        |                                                                  =
 |
  311.5 ++                                                                 =
 |
        *................*................*................*...............=
.*
    311 ++-----------------------------------------------------------------=
-+


                            will-it-scale.per_process_ops

  650000 ++----------------------------------------------------------------=
-+
         *................*................*...............*...............=
.*
  600000 ++                                                                =
 |
         |                                                                 =
 |
  550000 ++                                                                =
 |
         |                                                                 =
 |
  500000 ++                                                                =
 |
         |                                                                 =
 |
  450000 ++                                                                =
 |
         |                                                                 =
 |
  400000 ++                                                                =
 |
         |                                                                 =
 |
  350000 ++                                                                =
 |
         O                O                O               O               =
 O
  300000 ++----------------------------------------------------------------=
-+


                            will-it-scale.per_thread_ops

  600000 ++----------------------------------------------------------------=
-+
         *................*................*...............*...............=
.*
  550000 ++                                                                =
 |
         |                                                                 =
 |
  500000 ++                                                                =
 |
         |                                                                 =
 |
  450000 ++                                                                =
 |
         |                                                                 =
 |
  400000 ++                                                                =
 |
         |                                                                 =
 |
  350000 ++                                                                =
 |
         |                                                                 =
 |
  300000 O+               O                O               O               =
 O
         |                                                                 =
 |
  250000 ++----------------------------------------------------------------=
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


Thanks,
Fengguang

_______________________________________________
LKP mailing list
LKP(a)linux.intel.com

--===============8895686336061263222==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnRlc3RjYXNlOiB3aWxsLWl0LXNjYWxlCmRlZmF1bHRfbW9uaXRvcnM6CiAgd2F0Y2gtb29t
OiAKICB3YWl0OiBwcmUtdGVzdAogIHVwdGltZTogCiAgaW9zdGF0OiAKICB2bXN0YXQ6IAogIG51
bWEtbnVtYXN0YXQ6IAogIG51bWEtdm1zdGF0OiAKICBudW1hLW1lbWluZm86IAogIHByb2Mtdm1z
dGF0OiAKICBwcm9jLXN0YXQ6IAogIG1lbWluZm86IAogIHNsYWJpbmZvOiAKICBpbnRlcnJ1cHRz
OiAKICBsb2NrX3N0YXQ6IAogIGxhdGVuY3lfc3RhdHM6IAogIHNvZnRpcnFzOiAKICBiZGlfZGV2
X21hcHBpbmc6IAogIGRpc2tzdGF0czogCiAgZW5lcmd5OiAKICBjcHVpZGxlOiAKICBjcHVmcmVx
OiAKICB0dXJib3N0YXQ6IAogIHNjaGVkX2RlYnVnOgogICAgaW50ZXJ2YWw6IDEwCiAgcG1ldGVy
OiAKZGVmYXVsdF93YXRjaGRvZ3M6CiAgd2F0Y2gtb29tOiAKICB3YXRjaGRvZzogCmNwdWZyZXFf
Z292ZXJub3I6Ci0gcG93ZXJzYXZlCm1vZGVsOiBCcmlja2xhbmQgSXZ5IEJyaWRnZS1FWApucl9j
cHU6IDEyMAptZW1vcnk6IDEyOEcKaGRkX3BhcnRpdGlvbnM6ICIvZGV2L3NkYTIiCnN3YXBfcGFy
dGl0aW9uczogCnBlcmYtcHJvZmlsZToKICBmcmVxOiA4MDAKd2lsbC1pdC1zY2FsZToKICB0ZXN0
OgogIC0gcHdyaXRlMQpicmFuY2g6IGxpbnVzL21hc3Rlcgpjb21taXQ6IGYzY2E0MTY0NTI5Yjg3
NTM3NGM0MTAxOTNiYmJhYzBlZTk2MDg5NWYKcmVwZWF0X3RvOiAyCmVucXVldWVfdGltZTogMjAx
NC0xMC0yMiAxMTozMTo0Ni40OTg0Nzc4MTcgKzA4OjAwCnRlc3Rib3g6IGJyaWNrbGFuZDEKa2Nv
bmZpZzogeDg2XzY0LXJoZWwKdGJveF9ncm91cDogYnJpY2tsYW5kMQp1c2VyOiBsa3AKcXVldWU6
IGJpc2VjdApyZXN1bHRfcm9vdDogIi9yZXN1bHQvYnJpY2tsYW5kMS93aWxsLWl0LXNjYWxlL3Bv
d2Vyc2F2ZS1wd3JpdGUxL2RlYmlhbi14ODZfNjQuY2d6L3g4Nl82NC1yaGVsL2YzY2E0MTY0NTI5
Yjg3NTM3NGM0MTAxOTNiYmJhYzBlZTk2MDg5NWYvMCIKam9iX2ZpbGU6ICIvbGtwL3NjaGVkdWxl
ZC9icmlja2xhbmQxL2Jpc2VjdF93aWxsLWl0LXNjYWxlLXBvd2Vyc2F2ZS1wd3JpdGUxLXg4Nl82
NC1yaGVsLWYzY2E0MTY0NTI5Yjg3NTM3NGM0MTAxOTNiYmJhYzBlZTk2MDg5NWYtMS55YW1sIgpo
aXN0b3J5X3RpbWU6IDMwMAprZXJuZWw6ICIva2VybmVsL3g4Nl82NC1yaGVsL2YzY2E0MTY0NTI5
Yjg3NTM3NGM0MTAxOTNiYmJhYzBlZTk2MDg5NWYvdm1saW51ei0zLjE0LjAtcmM0LWdmM2NhNDE2
IgpkZXF1ZXVlX3RpbWU6IDIwMTQtMTAtMjIgMTE6NDM6MjEuNTIwMDc3ODY1ICswODowMApqb2Jf
c3RhdGU6IGZpbmlzaGVkCmxvYWRhdmc6IDgxLjcxIDM5LjcxIDE1LjcxIDEvOTY0IDE0Nzk0CnN0
YXJ0X3RpbWU6ICcxNDEzOTQ5NDk0JwplbmRfdGltZTogJzE0MTM5NDk4MDgnCnZlcnNpb246ICIv
bGtwL2xrcC8uc3JjLTIwMTQxMDIxLTIyNDIxMCIK

--===============8895686336061263222==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

ZWNobyBwb3dlcnNhdmUgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUwL2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgplY2hvIHBvd2Vyc2F2ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTEvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcG93ZXJzYXZl
ID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAwL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgplY2hvIHBvd2Vyc2F2ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTEwMS9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKZWNobyBwb3dlcnNhdmUgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUxMDIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcG93ZXJzYXZlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBv
d2Vyc2F2ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTEwNC9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKZWNobyBwb3dlcnNhdmUgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMDUv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1MTA2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBvd2Vyc2F2ZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTEwNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
ZWNobyBwb3dlcnNhdmUgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMDgvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1MTA5L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBvd2Vyc2F2ZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTExL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBvd2Vy
c2F2ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTExMC9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKZWNobyBwb3dlcnNhdmUgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMTEvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MTEyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBvd2Vyc2F2ZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTExMy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNo
byBwb3dlcnNhdmUgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMTQvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCmVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
MTE1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBvd2Vyc2F2ZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTExNi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwb3dlcnNh
dmUgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMTcvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCmVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTE4L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBvd2Vyc2F2ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTExOS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwb3dlcnNhdmUgPiAvc3lz
L2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBw
b3dlcnNhdmUgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMy9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKZWNobyBwb3dlcnNhdmUgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNC9j
cHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwb3dlcnNhdmUgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHUxNS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwb3dlcnNhdmUgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNo
byBwb3dlcnNhdmUgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNy9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKZWNobyBwb3dlcnNhdmUgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUx
OC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwb3dlcnNhdmUgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHUxOS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwb3dlcnNhdmUg
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgpl
Y2hvIHBvd2Vyc2F2ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIwL2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgplY2hvIHBvd2Vyc2F2ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTIxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBvd2Vyc2F2ZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTIyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBvd2Vyc2F2
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgplY2hvIHBvd2Vyc2F2ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTI0L2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgplY2hvIHBvd2Vyc2F2ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTI1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBvd2Vyc2F2ZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTI2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBvd2Vy
c2F2ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTI3L2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgplY2hvIHBvd2Vyc2F2ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTI4L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBvd2Vyc2F2ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTI5L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBvd2Vyc2F2ZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcG93
ZXJzYXZlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzAvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCmVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzEvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MzIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcG93ZXJzYXZlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8g
cG93ZXJzYXZlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzQvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCmVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzUv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1MzYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcG93ZXJzYXZlID4g
L3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzcvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVj
aG8gcG93ZXJzYXZlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzgvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCmVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
MzkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwb3dlcnNhdmUg
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
ZWNobyBwb3dlcnNhdmUgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKZWNobyBwb3dlcnNhdmUgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHU0Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwb3dlcnNhdmUgPiAvc3lzL2Rldmlj
ZXMvc3lzdGVtL2NwdS9jcHU0My9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwb3dlcnNh
dmUgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKZWNobyBwb3dlcnNhdmUgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0NS9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKZWNobyBwb3dlcnNhdmUgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHU0Ni9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwb3dlcnNhdmUgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHU0Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwb3dl
cnNhdmUgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0OC9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKZWNobyBwb3dlcnNhdmUgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0OS9jcHVm
cmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwb3dlcnNhdmUgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHU1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBvd2Vyc2F2ZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTUwL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBv
d2Vyc2F2ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTUxL2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgplY2hvIHBvd2Vyc2F2ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTUyL2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBvd2Vyc2F2ZSA+IC9zeXMvZGV2aWNlcy9zeXN0
ZW0vY3B1L2NwdTUzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBvd2Vyc2F2ZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hv
IHBvd2Vyc2F2ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU1L2NwdWZyZXEvc2NhbGlu
Z19nb3Zlcm5vcgplY2hvIHBvd2Vyc2F2ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU2
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBvd2Vyc2F2ZSA+IC9zeXMvZGV2aWNlcy9z
eXN0ZW0vY3B1L2NwdTU3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBvd2Vyc2F2ZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgpl
Y2hvIHBvd2Vyc2F2ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU5L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgplY2hvIHBvd2Vyc2F2ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1NjAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcG93ZXJzYXZl
ID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjEvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CmVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjIvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCmVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1NjMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1NjQvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcG93ZXJz
YXZlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCmVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjYvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1NjcvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcG93ZXJzYXZlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjgvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcG93
ZXJzYXZlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjkvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCmVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Ny9jcHVm
cmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwb3dlcnNhdmUgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHU3MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwb3dlcnNhdmUgPiAvc3lz
L2RldmljZXMvc3lzdGVtL2NwdS9jcHU3MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBw
b3dlcnNhdmUgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3Mi9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKZWNobyBwb3dlcnNhdmUgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3My9j
cHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwb3dlcnNhdmUgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHU3NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwb3dlcnNhdmUgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNo
byBwb3dlcnNhdmUgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3Ni9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKZWNobyBwb3dlcnNhdmUgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3
Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwb3dlcnNhdmUgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHU3OC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKZWNobyBwb3dlcnNhdmUg
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU3OS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
ZWNobyBwb3dlcnNhdmUgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgplY2hvIHBvd2Vyc2F2ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTgwL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBvd2Vyc2F2ZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTgxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBvd2Vyc2F2
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTgyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgplY2hvIHBvd2Vyc2F2ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTgzL2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgplY2hvIHBvd2Vyc2F2ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTg0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBvd2Vyc2F2ZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTg1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBvd2Vy
c2F2ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTg2L2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgplY2hvIHBvd2Vyc2F2ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTg3L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBvd2Vyc2F2ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTg4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBvd2Vyc2F2ZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTg5L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgplY2hvIHBv
d2Vyc2F2ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTkvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCmVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OTAvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1OTEvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcG93ZXJzYXZlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OTIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8g
cG93ZXJzYXZlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OTMvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCmVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OTQv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1OTUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcG93ZXJzYXZlID4g
L3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVj
aG8gcG93ZXJzYXZlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OTcvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCmVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
OTgvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCmVjaG8gcG93ZXJzYXZlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1OTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCi4vcnVudGVzdC5weSBw
d3JpdGUxIDE2IDEgMTUgMzAgNDUgNjAgOTAgMTIwCg==

--===============8895686336061263222==--

