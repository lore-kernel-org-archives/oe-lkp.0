Content-Type: multipart/mixed; boundary="===============6671869038237917813=="
MIME-Version: 1.0
From: kernel test robot <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: [vmstat] 0eb77e9880: +2.7% pigz.throughput
Date: Thu, 24 Mar 2016 09:51:36 +0800
Message-ID: <20160324015135.GA23869@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============6671869038237917813==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed that pigz.throughput +2.7% improvement on

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
commit 0eb77e9880321915322d42913c3b53241739c8aa ("vmstat: make vmstat_updat=
er deferrable again and shut down on idle")


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
blocksize/compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/te=
stcase:
  128K/gcc-4.9/performance/x86_64-rhel/100%/debian-x86_64-2015-02-07.cgz/br=
ickland1/pigz

commit: =

  686739f6af5e8d5687ffebbf1193ff066aada6d9
  0eb77e9880321915322d42913c3b53241739c8aa

686739f6af5e8d56 0eb77e9880321915322d42913c =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

 1.989e+08 =C2=B1  0%      +2.7%  2.043e+08 =C2=B1  0%  pigz.throughput
     19017 =C2=B1  2%     -17.3%      15725 =C2=B1  4%  pigz.time.involunta=
ry_context_switches
      1929 =C2=B1  0%      +6.2%       2049 =C2=B1  0%  pigz.time.percent_o=
f_cpu_this_job_got
    262.60 =C2=B1  0%      +6.6%     279.90 =C2=B1  0%  pigz.time.system_ti=
me
      5532 =C2=B1  0%      +6.2%       5873 =C2=B1  0%  pigz.time.user_time
  15031795 =C2=B1  0%      +2.7%   15439431 =C2=B1  0%  pigz.time.voluntary=
_context_switches
      3978 =C2=B1 96%     -99.8%       8.25 =C2=B1 33%  numa-numastat.node3=
.other_node
     19017 =C2=B1  2%     -17.3%      15725 =C2=B1  4%  time.involuntary_co=
ntext_switches
      1537 =C2=B1  1%     -10.2%       1380 =C2=B1  1%  proc-vmstat.nr_allo=
c_batch
    768.25 =C2=B1 33%    -100.0%       0.33 =C2=B1141%  proc-vmstat.pgmigra=
te_fail
    101204 =C2=B1  0%      +2.4%     103648 =C2=B1  0%  vmstat.system.cs
     33988 =C2=B1  1%      +4.6%      35542 =C2=B1  1%  vmstat.system.in
     16.57 =C2=B1  0%      +6.3%      17.61 =C2=B1  0%  turbostat.%Busy
    346.00 =C2=B1  0%      +3.0%     356.50 =C2=B1  0%  turbostat.Avg_MHz
      0.92 =C2=B1  1%     -62.6%       0.35 =C2=B1  4%  turbostat.CPU%c3
    665.14 =C2=B1  0%      +6.5%     708.22 =C2=B1  0%  turbostat.CorWatt
    677.67 =C2=B1  0%      +6.4%     720.77 =C2=B1  0%  turbostat.PkgWatt
    401974 =C2=B1 10%     +28.1%     514828 =C2=B1 10%  numa-meminfo.node0.=
MemUsed
     15203 =C2=B1  6%     -11.9%      13388 =C2=B1  3%  numa-meminfo.node2.=
SReclaimable
     38174 =C2=B1 18%     +25.5%      47898 =C2=B1  6%  numa-meminfo.node3.=
Active(anon)
    332312 =C2=B1  3%     +14.4%     380028 =C2=B1  1%  numa-meminfo.node3.=
MemUsed
     15391 =C2=B1 19%     +29.6%      19949 =C2=B1  6%  numa-meminfo.node3.=
SReclaimable
     51955 =C2=B1  7%     +13.4%      58906 =C2=B1  2%  numa-meminfo.node3.=
Slab
     21485 =C2=B1 19%     +23.2%      26468 =C2=B1  0%  numa-vmstat.node1.n=
uma_other
    411.50 =C2=B1  4%     -15.6%     347.50 =C2=B1  2%  numa-vmstat.node2.n=
r_alloc_batch
      3800 =C2=B1  6%     -11.9%       3346 =C2=B1  3%  numa-vmstat.node2.n=
r_slab_reclaimable
      9542 =C2=B1 18%     +25.4%      11969 =C2=B1  6%  numa-vmstat.node3.n=
r_active_anon
    403.25 =C2=B1  2%     -12.6%     352.50 =C2=B1  3%  numa-vmstat.node3.n=
r_alloc_batch
      3847 =C2=B1 19%     +29.6%       4986 =C2=B1  6%  numa-vmstat.node3.n=
r_slab_reclaimable
    428.00 =C2=B1  8%     +38.0%     590.75 =C2=B1 21%  slabinfo.blkdev_req=
uests.active_objs
    428.00 =C2=B1  8%     +38.0%     590.75 =C2=B1 21%  slabinfo.blkdev_req=
uests.num_objs
     26723 =C2=B1  2%      -7.0%      24850 =C2=B1  3%  slabinfo.kmalloc-25=
6.active_objs
     27745 =C2=B1  2%      -7.0%      25801 =C2=B1  3%  slabinfo.kmalloc-25=
6.num_objs
      1165 =C2=B1  5%     +16.2%       1354 =C2=B1  3%  slabinfo.mnt_cache.=
active_objs
      1165 =C2=B1  5%     +16.2%       1354 =C2=B1  3%  slabinfo.mnt_cache.=
num_objs
  5.87e+08 =C2=B1  2%     +19.4%  7.012e+08 =C2=B1  7%  cpuidle.C1-IVT-4S.t=
ime
    651990 =C2=B1  0%     -10.3%     584857 =C2=B1  0%  cpuidle.C1-IVT-4S.u=
sage
  64334504 =C2=B1  2%     -60.4%   25444312 =C2=B1  8%  cpuidle.C1E-IVT-4S.=
time
    121454 =C2=B1  1%     -59.8%      48868 =C2=B1  7%  cpuidle.C1E-IVT-4S.=
usage
 2.634e+08 =C2=B1  1%     -61.0%  1.028e+08 =C2=B1  5%  cpuidle.C3-IVT-4S.t=
ime
    451711 =C2=B1  1%     -59.6%     182479 =C2=B1  7%  cpuidle.C3-IVT-4S.u=
sage
     30487 =C2=B1  6%     +41.4%      43112 =C2=B1  5%  cpuidle.POLL.usage
      1.15 =C2=B1  7%     -83.2%       0.19 =C2=B1 10%  perf-profile.cycles=
-pp.__remove_hrtimer.hrtimer_try_to_cancel.hrtimer_cancel.tick_nohz_restart=
.tick_nohz_idle_exit
      2.65 =C2=B1  5%     +11.7%       2.96 =C2=B1  2%  perf-profile.cycles=
-pp.__schedule.schedule.futex_wait_queue_me.futex_wait.do_futex
      3.67 =C2=B1  3%     -25.4%       2.73 =C2=B1  8%  perf-profile.cycles=
-pp.__tick_nohz_idle_enter.tick_nohz_idle_enter.cpu_startup_entry.start_sec=
ondary
      3.70 =C2=B1  5%      +8.9%       4.02 =C2=B1  2%  perf-profile.cycles=
-pp.futex_wait.do_futex.sys_futex.entry_SYSCALL_64_fastpath
      1.39 =C2=B1  6%     -69.4%       0.42 =C2=B1  5%  perf-profile.cycles=
-pp.hrtimer_cancel.tick_nohz_restart.tick_nohz_idle_exit.cpu_startup_entry.=
start_secondary
      2.16 =C2=B1  4%     -39.1%       1.31 =C2=B1  9%  perf-profile.cycles=
-pp.hrtimer_start_range_ns.tick_nohz_stop_sched_tick.__tick_nohz_idle_enter=
.tick_nohz_idle_enter.cpu_startup_entry
      1.36 =C2=B1  7%     -72.1%       0.38 =C2=B1  8%  perf-profile.cycles=
-pp.hrtimer_try_to_cancel.hrtimer_cancel.tick_nohz_restart.tick_nohz_idle_e=
xit.cpu_startup_entry
      0.88 =C2=B1  8%     -15.3%       0.74 =C2=B1  9%  perf-profile.cycles=
-pp.ktime_get.clockevents_program_event.tick_program_event.__remove_hrtimer=
.hrtimer_start_range_ns
      0.97 =C2=B1  6%     -10.1%       0.87 =C2=B1  6%  perf-profile.cycles=
-pp.ktime_get.sched_clock_tick.sched_clock_idle_wakeup_event.tick_nohz_stop=
_idle.tick_nohz_idle_exit
      0.65 =C2=B1  6%     +44.1%       0.94 =C2=B1  8%  perf-profile.cycles=
-pp.pick_next_task_fair.__schedule.schedule.futex_wait_queue_me.futex_wait
      0.00 =C2=B1 -1%      +Inf%       2.02 =C2=B1  5%  perf-profile.cycles=
-pp.quiet_vmstat.cpu_startup_entry.start_secondary
      1.62 =C2=B1  6%     -51.6%       0.78 =C2=B1  9%  perf-profile.cycles=
-pp.read_hpet.ktime_get.clockevents_program_event.tick_program_event.__remo=
ve_hrtimer
      1.67 =C2=B1  4%     -49.9%       0.84 =C2=B1  6%  perf-profile.cycles=
-pp.read_hpet.ktime_get.clockevents_program_event.tick_program_event.hrtime=
r_start_range_ns
      0.00 =C2=B1 -1%      +Inf%       1.71 =C2=B1  5%  perf-profile.cycles=
-pp.refresh_cpu_vm_stats.quiet_vmstat.cpu_startup_entry.start_secondary
      2.79 =C2=B1  5%     +10.1%       3.07 =C2=B1  2%  perf-profile.cycles=
-pp.schedule.futex_wait_queue_me.futex_wait.do_futex.sys_futex
      3.78 =C2=B1  3%     -24.6%       2.85 =C2=B1  8%  perf-profile.cycles=
-pp.tick_nohz_idle_enter.cpu_startup_entry.start_secondary
      5.26 =C2=B1  4%     -20.9%       4.16 =C2=B1  4%  perf-profile.cycles=
-pp.tick_nohz_idle_exit.cpu_startup_entry.start_secondary
      2.86 =C2=B1  6%     -35.2%       1.85 =C2=B1  4%  perf-profile.cycles=
-pp.tick_nohz_restart.tick_nohz_idle_exit.cpu_startup_entry.start_secondary
      2.56 =C2=B1  3%     -33.2%       1.71 =C2=B1  9%  perf-profile.cycles=
-pp.tick_nohz_stop_sched_tick.__tick_nohz_idle_enter.tick_nohz_idle_enter.c=
pu_startup_entry.start_secondary
      0.94 =C2=B1  4%     -94.7%       0.05 =C2=B1 58%  perf-profile.cycles=
-pp.tick_program_event.__remove_hrtimer.hrtimer_try_to_cancel.hrtimer_cance=
l.tick_nohz_restart

brickland1: Brickland Ivy Bridge-EX
Memory: 128G



                         pigz.time.voluntary_context_switches

  1.6e+07 ++---------------------------------------------------------------=
-+
          | O O     O O O  O   O         O O O O O O O O                   =
 |
  1.5e+07 O+*.*.O.O.*.*.*..*.O.*.O.O.O.O.*.*.*.*.*.*.*.*.*..*.*.*.*.*.*.*.*=
.*
          | :                                                              =
 |
          | :                                                              =
 |
  1.4e+07 ++                                                               =
 |
          |:                                                               =
 |
  1.3e+07 ++                                                               =
 |
          |:                                                               =
 |
  1.2e+07 ++                                                               =
 |
          |:                                                               =
 |
          |                                                                =
 |
  1.1e+07 ++                                                               =
 |
          *                                                                =
 |
    1e+07 ++---------------------------------------------------------------=
-+


                               cpuidle.C1E-IVT-4S.time

  9e+07 ++-----------------------------------------------------------------=
-+
        |                                                *                 =
 |
  8e+07 ++                                               ::                =
 |
        |                                               : :                =
 |
  7e+07 ++                                              :  *.      .*.     =
 |
        |    .*.. .*.*.*.*.   .*..   .*.*.   .*.  .*.  :     *.*.*.   *.*. =
.*
  6e+07 ++*.*    *         *.*    *.*     *.*   *.   *.*                  *=
 |
        | :                                                                =
 |
  5e+07 ++                                                                 =
 |
        |:                                                                 =
 |
  4e+07 ++                                                                 =
 |
        |:                   O                                             =
 |
  3e+07 O+  O O            O      O   O O   O O    O                       =
 |
        * O      O O O O O     O    O     O     O    O                     =
 |
  2e+07 ++---------------------------------------------O-------------------=
-+


                              cpuidle.C1E-IVT-4S.usage

  130000 ++--------*-------------------------------------------*-----------=
-+
  120000 ++   .*. +   *.*.*.*.*.*. .*.*.    .*.*.*.*.*. .*.*.*    *.*.*.*.*=
.*
         | *.*   *                *     *..*           *                   =
 |
  110000 ++:                                                               =
 |
  100000 ++:                                                               =
 |
         |:                                                                =
 |
   90000 ++                                                                =
 |
   80000 ++                                                                =
 |
   70000 ++                                                                =
 |
         |:                                                                =
 |
   60000 O+O O O                        O                                  =
 |
   50000 ++      O      O O   O O O O O    O O O   O O                     =
 |
         |         O  O     O                    O     O                   =
 |
   40000 *+                                                                =
 |
   30000 ++----------------------------------------------------------------=
-+


                                cpuidle.C3-IVT-4S.time

  2.8e+08 ++------------*--------------------------------------------------=
-+
  2.6e+08 ++ .*.*. .*.*    *.*.*.*. .*.*.   .*.*.*.*.*. .*..*.*.*.*.*.*.*.*=
.*
          | *     *                *     *.*           *                   =
 |
  2.4e+08 ++:                                                              =
 |
  2.2e+08 ++:                                                              =
 |
          |:                                                               =
 |
    2e+08 ++                                                               =
 |
  1.8e+08 ++                                                               =
 |
  1.6e+08 ++                                                               =
 |
          |:                                                               =
 |
  1.4e+08 ++                                                               =
 |
  1.2e+08 ++O O O                                                          =
 |
          O                  O O O O O O O O O O O O O                     =
 |
    1e+08 ++      O O O O  O                           O                   =
 |
    8e+07 ++---------------------------------------------------------------=
-+


                               cpuidle.C3-IVT-4S.usage

  500000 ++----------------------------------------------------------------=
-+
         |         *..                                      .*.*..         =
 |
  450000 ++*.*.*. +   *.*.*.*.*.*. .*.*.    .*.*.*.*.*.*.*.*      *.*.*.*.*=
.*
         | :     *                *     *..*                               =
 |
  400000 ++:                                                               =
 |
         | :                                                               =
 |
  350000 ++                                                                =
 |
         |:                                                                =
 |
  300000 ++                                                                =
 |
         |:                                                                =
 |
  250000 ++                                                                =
 |
         |:  O                                                             =
 |
  200000 O+O   O              O O O O O O  O O O   O O                     =
 |
         |       O O  O O O O                    O     O                   =
 |
  150000 *+----------------------------------------------------------------=
-+


                                 turbostat.CPU_c3

    1 ++-------------------------------------------------------------------=
-+
      |     .*. .*.*.*..*.*. .*.            .*.. .*.   .*..*.*.*.*.*.  .*. =
 |
  0.9 ++*.*.   *            *   *.*..*.*.*.*    *   *.*              *.   *=
.*
      | :                                                                  =
 |
  0.8 ++:                                                                  =
 |
      |:                                                                   =
 |
  0.7 ++                                                                   =
 |
      |:                                                                   =
 |
  0.6 ++                                                                   =
 |
      |:                                                                   =
 |
  0.5 ++                                                                   =
 |
      |                                                                    =
 |
  0.4 *+O O  O                                                             =
 |
      O        O O O O  O O O O O O  O O O O O  O O O                      =
 |
  0.3 ++----------------------------------------------O--------------------=
-+


	[*] bisect-good sample
	[O] bisect-bad  sample

To reproduce:

        git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tes=
ts.git
        cd lkp-tests
        bin/lkp install job.yaml  # job file is attached in this email
        bin/lkp run     job.yaml


Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.


Thanks,
Xiaolong Ye

--===============6671869038237917813==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogcGlnegpkZWZhdWx0LW1vbml0b3JzOgogIHdhaXQ6IGFjdGl2YXRlLW1vbml0b3IK
ICBrbXNnOiAKICB1cHRpbWU6IAogIGlvc3RhdDogCiAgaGVhcnRiZWF0OiAKICB2bXN0YXQ6IAog
IG51bWEtbnVtYXN0YXQ6IAogIG51bWEtdm1zdGF0OiAKICBudW1hLW1lbWluZm86IAogIHByb2Mt
dm1zdGF0OiAKICBwcm9jLXN0YXQ6CiAgICBpbnRlcnZhbDogMTAKICBtZW1pbmZvOiAKICBzbGFi
aW5mbzogCiAgaW50ZXJydXB0czogCiAgbG9ja19zdGF0OiAKICBsYXRlbmN5X3N0YXRzOiAKICBz
b2Z0aXJxczogCiAgYmRpX2Rldl9tYXBwaW5nOiAKICBkaXNrc3RhdHM6IAogIG5mc3N0YXQ6IAog
IGNwdWlkbGU6IAogIGNwdWZyZXEtc3RhdHM6IAogIHR1cmJvc3RhdDogCiAgcG1ldGVyOiAKICBz
Y2hlZF9kZWJ1ZzoKICAgIGludGVydmFsOiA2MApjcHVmcmVxX2dvdmVybm9yOiBwZXJmb3JtYW5j
ZQpkZWZhdWx0LXdhdGNoZG9nczoKICBvb20ta2lsbGVyOiAKICB3YXRjaGRvZzogCmNvbW1pdDog
MGViNzdlOTg4MDMyMTkxNTMyMmQ0MjkxM2MzYjUzMjQxNzM5YzhhYQptb2RlbDogQnJpY2tsYW5k
IEl2eSBCcmlkZ2UtRVgKbnJfY3B1OiAxMjAKbWVtb3J5OiAxMjhHCmhkZF9wYXJ0aXRpb25zOiAi
L2Rldi9zZGEyIgpzd2FwX3BhcnRpdGlvbnM6IApjYXRlZ29yeTogYmVuY2htYXJrCnBlcmYtcHJv
ZmlsZToKICBmcmVxOiA4MDAKbnJfdGhyZWFkczogMTAwJQpwaWd6OgogIGJsb2Nrc2l6ZTogMTI4
SwpxdWV1ZTogYmlzZWN0CnRlc3Rib3g6IGJyaWNrbGFuZDEKdGJveF9ncm91cDogYnJpY2tsYW5k
MQprY29uZmlnOiB4ODZfNjQtcmhlbAplbnF1ZXVlX3RpbWU6IDIwMTYtMDMtMTggMTc6MDg6MDAu
MDc3Mjk5NTYwICswODowMApjb21waWxlcjogZ2NjLTQuOQpyb290ZnM6IGRlYmlhbi14ODZfNjQt
MjAxNS0wMi0wNy5jZ3oKaWQ6IDE2MmU1MDRiMTZlNTQ4Y2IzYWU0N2Q5MWNhNDUwMjViNTY3Y2Y4
N2EKdXNlcjogbGtwCmhlYWRfY29tbWl0OiBjMDFkMDY0NjgxYjBjYTc5ZDE3NTVkZjg1NmJkMmQ4
OGNmYjFlODM4CmJhc2VfY29tbWl0OiBiNTYyZTQ0ZjUwN2U4NjNjNjc5Mjk0NmU0ZTFiMTQ0OWZi
YmFjODVkCmJyYW5jaDogbGludXgtZGV2ZWwvZGV2ZWwtaG91cmx5LTIwMTYwMzE4MDQKcmVzdWx0
X3Jvb3Q6ICIvcmVzdWx0L3BpZ3ovcGVyZm9ybWFuY2UtMTAwJS0xMjhLL2JyaWNrbGFuZDEvZGVi
aWFuLXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9nY2MtNC45LzBlYjc3ZTk4ODAz
MjE5MTUzMjJkNDI5MTNjM2I1MzI0MTczOWM4YWEvMCIKam9iX2ZpbGU6ICIvbGtwL3NjaGVkdWxl
ZC9icmlja2xhbmQxL2Jpc2VjdF9waWd6LXBlcmZvcm1hbmNlLTEwMCUtMTI4Sy1kZWJpYW4teDg2
XzY0LTIwMTUtMDItMDcuY2d6LXg4Nl82NC1yaGVsLTBlYjc3ZTk4ODAzMjE5MTUzMjJkNDI5MTNj
M2I1MzI0MTczOWM4YWEtMjAxNjAzMTgtMTk3NjctN2psa2YyLTAueWFtbCIKbWF4X3VwdGltZTog
MTI5OS40MjAwMDAwMDAwMDAzCmluaXRyZDogIi9vc2ltYWdlL2RlYmlhbi9kZWJpYW4teDg2XzY0
LTIwMTUtMDItMDcuY2d6Igpib290bG9hZGVyX2FwcGVuZDoKLSByb290PS9kZXYvcmFtMAotIHVz
ZXI9bGtwCi0gam9iPS9sa3Avc2NoZWR1bGVkL2JyaWNrbGFuZDEvYmlzZWN0X3BpZ3otcGVyZm9y
bWFuY2UtMTAwJS0xMjhLLWRlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oteDg2XzY0LXJoZWwt
MGViNzdlOTg4MDMyMTkxNTMyMmQ0MjkxM2MzYjUzMjQxNzM5YzhhYS0yMDE2MDMxOC0xOTc2Ny03
amxrZjItMC55YW1sCi0gQVJDSD14ODZfNjQKLSBrY29uZmlnPXg4Nl82NC1yaGVsCi0gYnJhbmNo
PWxpbnV4LWRldmVsL2RldmVsLWhvdXJseS0yMDE2MDMxODA0Ci0gY29tbWl0PTBlYjc3ZTk4ODAz
MjE5MTUzMjJkNDI5MTNjM2I1MzI0MTczOWM4YWEKLSBCT09UX0lNQUdFPS9wa2cvbGludXgveDg2
XzY0LXJoZWwvZ2NjLTQuOS8wZWI3N2U5ODgwMzIxOTE1MzIyZDQyOTEzYzNiNTMyNDE3MzljOGFh
L3ZtbGludXotNC40LjAtMDU2OTEtZzBlYjc3ZTkKLSBtYXhfdXB0aW1lPTEyOTkKLSBSRVNVTFRf
Uk9PVD0vcmVzdWx0L3BpZ3ovcGVyZm9ybWFuY2UtMTAwJS0xMjhLL2JyaWNrbGFuZDEvZGViaWFu
LXg4Nl82NC0yMDE1LTAyLTA3LmNnei94ODZfNjQtcmhlbC9nY2MtNC45LzBlYjc3ZTk4ODAzMjE5
MTUzMjJkNDI5MTNjM2I1MzI0MTczOWM4YWEvMAotIExLUF9TRVJWRVI9aW5uCi0gfC0KICBpcG1p
X3NpLnRyeWFjcGk9MCBpcG1pX3dhdGNoZG9nLnN0YXJ0X25vdz0xCgogIGVhcmx5cHJpbnRrPXR0
eVMwLDExNTIwMCBzeXN0ZW1kLmxvZ19sZXZlbD1lcnIKICBkZWJ1ZyBhcGljPWRlYnVnIHN5c3Jx
X2Fsd2F5c19lbmFibGVkIHJjdXBkYXRlLnJjdV9jcHVfc3RhbGxfdGltZW91dD0xMDAKICBwYW5p
Yz0tMSBzb2Z0bG9ja3VwX3BhbmljPTEgbm1pX3dhdGNoZG9nPXBhbmljIG9vcHM9cGFuaWMgbG9h
ZF9yYW1kaXNrPTIgcHJvbXB0X3JhbWRpc2s9MAogIGNvbnNvbGU9dHR5UzAsMTE1MjAwIGNvbnNv
bGU9dHR5MCB2Z2E9bm9ybWFsCgogIHJ3CmxrcF9pbml0cmQ6ICIvbGtwL2xrcC9sa3AteDg2XzY0
LmNneiIKbW9kdWxlc19pbml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvMGVi
NzdlOTg4MDMyMTkxNTMyMmQ0MjkxM2MzYjUzMjQxNzM5YzhhYS9tb2R1bGVzLmNneiIKYm1faW5p
dHJkOiAiL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L2xrcC5jZ3os
L29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3J1bi1pcGNvbmZpZy5j
Z3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3R1cmJvc3RhdC5j
Z3osL2xrcC9iZW5jaG1hcmtzL3R1cmJvc3RhdC5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2
XzY0LTIwMTUtMDItMDcuY2d6L3BpZ3ouY2d6IgpsaW51eF9oZWFkZXJzX2luaXRyZDogIi9wa2cv
bGludXgveDg2XzY0LXJoZWwvZ2NjLTQuOS8wZWI3N2U5ODgwMzIxOTE1MzIyZDQyOTEzYzNiNTMy
NDE3MzljOGFhL2xpbnV4LWhlYWRlcnMuY2d6IgpyZXBlYXRfdG86IDIKa2VybmVsOiAiL3BrZy9s
aW51eC94ODZfNjQtcmhlbC9nY2MtNC45LzBlYjc3ZTk4ODAzMjE5MTUzMjJkNDI5MTNjM2I1MzI0
MTczOWM4YWEvdm1saW51ei00LjQuMC0wNTY5MS1nMGViNzdlOSIKZGVxdWV1ZV90aW1lOiAyMDE2
LTAzLTE4IDE3OjI5OjE0Ljg5NTQyNzMzMSArMDg6MDAKam9iX3N0YXRlOiBmaW5pc2hlZApsb2Fk
YXZnOiAxNy4wMiAxMS4yMiA0LjkxIDEvMTA4NSAxMjAzNgpzdGFydF90aW1lOiAnMTQ1ODI5MzQx
NycKZW5kX3RpbWU6ICcxNDU4MjkzNzE3Jwp2ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0yMDE2MDMx
OC0xNTUwMTIiCg==

--===============6671869038237917813==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

MjAxNi0wMy0xOCAxNzozMDoxNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xOCAxNzozMDoxNiBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xOCAxNzozMDoxNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDMtMTggMTc6MzA6MTYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTEwMC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xOCAxNzozMDoxNiBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAxL2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgoyMDE2LTAzLTE4IDE3OjMwOjE2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lz
L2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMDIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDMtMTggMTc6MzA6MTYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTEwMy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xOCAxNzozMDoxNiBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTA0L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgoyMDE2LTAzLTE4IDE3OjMwOjE2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lz
L2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMDUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDMtMTggMTc6MzA6MTYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTEwNi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xOCAxNzozMDoxNiBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTA3L2NwdWZyZXEvc2Nh
bGluZ19nb3Zlcm5vcgoyMDE2LTAzLTE4IDE3OjMwOjE2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lz
L2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMDgvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDMtMTggMTc6MzA6MTYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTEwOS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xOCAxNzozMDoxNiBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTEvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDMtMTggMTc6MzA6MTYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTExMC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0w
My0xOCAxNzozMDoxNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1MTExL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTE4IDE3OjMwOjE2IGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMTIvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDMtMTggMTc6MzA6MTYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTExMy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0w
My0xOCAxNzozMDoxNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1MTE0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTE4IDE3OjMwOjE2IGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMTUvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDMtMTggMTc6MzA6MTYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTExNi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0w
My0xOCAxNzozMDoxNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1MTE3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTE4IDE3OjMwOjE2IGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMTgvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDMtMTggMTc6MzA6MTYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTExOS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0w
My0xOCAxNzozMDoxNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUv
Y3B1MTIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMTggMTc6MzA6MTYgZWNobyBw
ZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTEzL2NwdWZyZXEvc2NhbGlu
Z19nb3Zlcm5vcgoyMDE2LTAzLTE4IDE3OjMwOjE2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rl
dmljZXMvc3lzdGVtL2NwdS9jcHUxNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0x
OCAxNzozMDoxNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
MTUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMTggMTc6MzA6MTYgZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE2L2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgoyMDE2LTAzLTE4IDE3OjMwOjE2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rldmlj
ZXMvc3lzdGVtL2NwdS9jcHUxNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xOCAx
NzozMDoxNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTgv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMTggMTc6MzA6MTYgZWNobyBwZXJmb3Jt
YW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE5L2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgoyMDE2LTAzLTE4IDE3OjMwOjE2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHUyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTE4IDE3OjMw
OjE2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyMC9jcHVm
cmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xOCAxNzozMDoxNiBlY2hvIHBlcmZvcm1hbmNl
ID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjEvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9y
CjIwMTYtMDMtMTggMTc6MzA6MTYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0
ZW0vY3B1L2NwdTIyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTE4IDE3OjMwOjE2
IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyMy9jcHVmcmVx
L3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xOCAxNzozMDoxNiBlY2hvIHBlcmZvcm1hbmNlID4g
L3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjQvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIw
MTYtMDMtMTggMTc6MzA6MTYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTI1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTE4IDE3OjMwOjE2IGVj
aG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyNi9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xOCAxNzozMDoxNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjcvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDMtMTggMTc6MzA6MTYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTI4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTE4IDE3OjMwOjE2IGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUyOS9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wMy0xOCAxNzozMDoxNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1My9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0x
OCAxNzozMDoxNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
MzAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMTggMTc6MzA6MTYgZWNobyBwZXJm
b3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMxL2NwdWZyZXEvc2NhbGluZ19n
b3Zlcm5vcgoyMDE2LTAzLTE4IDE3OjMwOjE2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2Rldmlj
ZXMvc3lzdGVtL2NwdS9jcHUzMi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xOCAx
NzozMDoxNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzMv
Y3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMTggMTc6MzA6MTYgZWNobyBwZXJmb3Jt
YW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM0L2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgoyMDE2LTAzLTE4IDE3OjMwOjE2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHUzNS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xOCAxNzoz
MDoxNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzYvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMTggMTc6MzA6MTYgZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgoyMDE2LTAzLTE4IDE3OjMwOjE2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHUzOC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xOCAxNzozMDox
NiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MzkvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMTggMTc6MzA6MTYgZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIw
MTYtMDMtMTggMTc6MzA6MTYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTQwL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTE4IDE3OjMwOjE2IGVj
aG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xOCAxNzozMDoxNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDMtMTggMTc6MzA6MTYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTQzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTE4IDE3OjMwOjE2IGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0NC9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wMy0xOCAxNzozMDoxNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDUvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMt
MTggMTc6MzA6MTYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTQ2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTE4IDE3OjMwOjE2IGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU0Ny9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wMy0xOCAxNzozMDoxNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1NDgvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMTgg
MTc6MzA6MTYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ5
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTE4IDE3OjMwOjE2IGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1L2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgoyMDE2LTAzLTE4IDE3OjMwOjE2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHU1MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xOCAxNzoz
MDoxNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NTEvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMTggMTc6MzA6MTYgZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTUyL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgoyMDE2LTAzLTE4IDE3OjMwOjE2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHU1My9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xOCAxNzozMDox
NiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NTQvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMTggMTc6MzA6MTYgZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU1L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoy
MDE2LTAzLTE4IDE3OjMwOjE2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHU1Ni9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xOCAxNzozMDoxNiBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NTcvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMTggMTc6MzA6MTYgZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTU4L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2
LTAzLTE4IDE3OjMwOjE2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHU1OS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xOCAxNzozMDoxNiBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1Ni9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wMy0xOCAxNzozMDoxNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1NjAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMt
MTggMTc6MzA6MTYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTYxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTE4IDE3OjMwOjE2IGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2Mi9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wMy0xOCAxNzozMDoxNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1NjMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMTgg
MTc6MzA6MTYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTY0
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTE4IDE3OjMwOjE2IGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2NS9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNi0wMy0xOCAxNzozMDoxNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1NjYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMTggMTc6
MzA6MTYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTY3L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTE4IDE3OjMwOjE2IGVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2OC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKMjAxNi0wMy0xOCAxNzozMDoxNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1NjkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMTggMTc6MzA6
MTYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTcvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMTggMTc6MzA6MTYgZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTcwL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoy
MDE2LTAzLTE4IDE3OjMwOjE2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHU3MS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xOCAxNzozMDoxNiBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NzIvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMTggMTc6MzA6MTYgZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTczL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2
LTAzLTE4IDE3OjMwOjE2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHU3NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xOCAxNzozMDoxNiBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NzUvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDMtMTggMTc6MzA6MTYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTc2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAz
LTE4IDE3OjMwOjE2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHU3Ny9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xOCAxNzozMDoxNiBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NzgvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCjIwMTYtMDMtMTggMTc6MzA6MTYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTc5L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTE4
IDE3OjMwOjE2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTE4IDE3OjMwOjE2IGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4MC9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNi0wMy0xOCAxNzozMDoxNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1ODEvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMTggMTc6
MzA6MTYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTgyL2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTE4IDE3OjMwOjE2IGVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4My9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKMjAxNi0wMy0xOCAxNzozMDoxNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1ODQvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMTggMTc6MzA6
MTYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTg1L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTE4IDE3OjMwOjE2IGVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4Ni9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
MjAxNi0wMy0xOCAxNzozMDoxNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1ODcvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDMtMTggMTc6MzA6MTYg
ZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTg4L2NwdWZyZXEv
c2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTE4IDE3OjMwOjE2IGVjaG8gcGVyZm9ybWFuY2UgPiAv
c3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4OS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAx
Ni0wMy0xOCAxNzozMDoxNiBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUvY3B1OS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xOCAxNzozMDoxNiBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OTAvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDMtMTggMTc6MzA6MTYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTkxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAz
LTE4IDE3OjMwOjE2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHU5Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xOCAxNzozMDoxNiBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OTMvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCjIwMTYtMDMtMTggMTc6MzA6MTYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTk0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTE4
IDE3OjMwOjE2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5
NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xOCAxNzozMDoxNiBlY2hvIHBlcmZv
cm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OTYvY3B1ZnJlcS9zY2FsaW5nX2dv
dmVybm9yCjIwMTYtMDMtMTggMTc6MzA6MTYgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTk3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTAzLTE4IDE3
OjMwOjE2IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5OC9j
cHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wMy0xOCAxNzozMDoxNiBlY2hvIHBlcmZvcm1h
bmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1OTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVy
bm9yCg==

--===============6671869038237917813==--

