Content-Type: multipart/mixed; boundary="===============7310763755352423103=="
MIME-Version: 1.0
From: kernel test robot <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: [mm, page_alloc] 51284eb2d4: pbzip2.throughput -5.7% regression
Date: Fri, 22 Apr 2016 15:58:05 +0800
Message-ID: <20160422075805.GB31129@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============7310763755352423103==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed that pbzip2.throughput -5.7% regression with following comm=
it:

https://git.kernel.org/pub/scm/linux/kernel/git/mel/linux mm-vmscan-node-lr=
u-v5r9
commit 51284eb2d4a997754f593df73502aebac7441e71 ("mm, page_alloc: Remove fa=
ir zone allocation policy")

on test machine: ivb42: 48 threads Ivytown Ivy Bridge-EP with 64G memory

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
blocksize/compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/te=
stcase:
  900K/gcc-4.9/performance/x86_64-rhel/100%/debian-x86_64-2015-02-07.cgz/iv=
b42/pbzip2

commit: =

  6dd786145f2a37bd515620649cbba0565d63082e
  51284eb2d4a997754f593df73502aebac7441e71

6dd786145f2a37bd 51284eb2d4a997754f593df735 =

---------------- -------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

 1.028e+08 =C2=B1  0%      -5.7%   96910404 =C2=B1  0%  pbzip2.throughput
    207713 =C2=B1  3%      -8.7%     189663 =C2=B1  1%  pbzip2.time.involun=
tary_context_switches
    335.33 =C2=B1  1%     +12.7%     377.81 =C2=B1  1%  pbzip2.time.system_=
time
    143286 =C2=B1  0%      -8.3%     131419 =C2=B1  3%  pbzip2.time.volunta=
ry_context_switches
     18.71 =C2=B1  0%      -5.1%      17.75 =C2=B1  0%  turbostat.RAMWatt
      1113 =C2=B1  9%     +13.2%       1260 =C2=B1  5%  slabinfo.mnt_cache.=
active_objs
      1113 =C2=B1  9%     +13.2%       1260 =C2=B1  5%  slabinfo.mnt_cache.=
num_objs
    207713 =C2=B1  3%      -8.7%     189663 =C2=B1  1%  time.involuntary_co=
ntext_switches
    335.33 =C2=B1  1%     +12.7%     377.81 =C2=B1  1%  time.system_time
     39059 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  meminfo.Active(anon)
     48844 =C2=B1  0%     +92.2%      93876 =C2=B1  0%  meminfo.Active(file)
     93416 =C2=B1  0%     -95.2%       4523 =C2=B1  0%  meminfo.Unevictable
      0.06 =C2=B1 21%     +74.1%       0.10 =C2=B1 24%  sched_debug.cfs_rq:=
/.nr_running.stddev
      1693 =C2=B1 31%     -39.2%       1029 =C2=B1 54%  sched_debug.cpu.cur=
r->pid.min
     29813 =C2=B1 10%     -17.6%      24555 =C2=B1 13%  sched_debug.cpu.nr_=
switches.max
      4803 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node0.n=
r_alloc_batch
  14229332 =C2=B1  4%     -11.2%   12629744 =C2=B1  3%  numa-vmstat.node0.n=
uma_hit
  14229287 =C2=B1  4%     -11.2%   12629684 =C2=B1  3%  numa-vmstat.node0.n=
uma_local
     44.25 =C2=B1 27%     +35.0%      59.75 =C2=B1 20%  numa-vmstat.node0.n=
uma_other
      5085 =C2=B1  2%    -100.0%       0.00 =C2=B1 -1%  numa-vmstat.node1.n=
r_alloc_batch
  28097606 =C2=B1  3%      -9.6%   25399940 =C2=B1  1%  numa-numastat.node0=
.local_node
     13324 =C2=B1 24%     -76.7%       3098 =C2=B1 99%  numa-numastat.node0=
.numa_foreign
  28097696 =C2=B1  3%      -9.6%   25400039 =C2=B1  1%  numa-numastat.node0=
.numa_hit
     13601 =C2=B1 24%     -77.2%       3098 =C2=B1 99%  numa-numastat.node0=
.numa_miss
     12579 =C2=B1 30%     -65.9%       4283 =C2=B1 82%  numa-numastat.node1=
.numa_foreign
     12301 =C2=B1 31%     -65.2%       4283 =C2=B1 82%  numa-numastat.node1=
.numa_miss
      9841 =C2=B1  3%    -100.0%       0.00 =C2=B1 -1%  proc-vmstat.nr_allo=
c_batch
     23863 =C2=B1  1%     -74.0%       6200 =C2=B1  0%  proc-vmstat.numa_fo=
reign
     23835 =C2=B1  1%     -74.0%       6200 =C2=B1  0%  proc-vmstat.numa_mi=
ss
    161293 =C2=B1  6%     +22.0%     196747 =C2=B1  8%  proc-vmstat.numa_pa=
ges_migrated
   5437133 =C2=B1  1%    -100.0%       0.00 =C2=B1  0%  proc-vmstat.pgalloc=
_dma32
    161293 =C2=B1  6%     +22.0%     196747 =C2=B1  8%  proc-vmstat.pgmigra=
te_success
     81470 =C2=B1  4%      -9.8%      73448 =C2=B1  2%  proc-vmstat.thp_def=
erred_split_page
     81329 =C2=B1  4%      -9.9%      73243 =C2=B1  2%  proc-vmstat.thp_fau=
lt_alloc
      1.83 =C2=B1  4%     -19.0%       1.48 =C2=B1  9%  perf-profile.cycles=
-pp.__do_softirq.irq_exit.smp_apic_timer_interrupt.apic_timer_interrupt
     16.95 =C2=B1  7%     -17.6%      13.97 =C2=B1  9%  perf-profile.cycles=
-pp.__hrtimer_run_queues.hrtimer_interrupt.local_apic_timer_interrupt.smp_a=
pic_timer_interrupt.apic_timer_interrupt
     23.45 =C2=B1  7%     -18.1%      19.20 =C2=B1 10%  perf-profile.cycles=
-pp.apic_timer_interrupt
      0.98 =C2=B1110%    +430.2%       5.18 =C2=B1 21%  perf-profile.cycles=
-pp.call_cpuidle.cpu_startup_entry.start_secondary
      0.99 =C2=B1  4%     +45.6%       1.44 =C2=B1 14%  perf-profile.cycles=
-pp.call_function_interrupt
      1.14 =C2=B1 10%     -19.2%       0.92 =C2=B1 10%  perf-profile.cycles=
-pp.clockevents_program_event.tick_program_event.hrtimer_interrupt.local_ap=
ic_timer_interrupt.smp_apic_timer_interrupt
      0.99 =C2=B1108%    +423.1%       5.21 =C2=B1 21%  perf-profile.cycles=
-pp.cpu_startup_entry.start_secondary
      0.98 =C2=B1110%    +430.2%       5.18 =C2=B1 21%  perf-profile.cycles=
-pp.cpuidle_enter.call_cpuidle.cpu_startup_entry.start_secondary
      0.96 =C2=B1110%    +434.3%       5.14 =C2=B1 21%  perf-profile.cycles=
-pp.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpu_startup_entry.start_=
secondary
      0.81 =C2=B1  5%     +41.7%       1.16 =C2=B1 12%  perf-profile.cycles=
-pp.flush_smp_call_function_queue.generic_smp_call_function_single_interrup=
t.smp_call_function_interrupt.call_function_interrupt
      0.83 =C2=B1  5%     +43.6%       1.19 =C2=B1 11%  perf-profile.cycles=
-pp.generic_smp_call_function_single_interrupt.smp_call_function_interrupt.=
call_function_interrupt
     19.34 =C2=B1  8%     -18.7%      15.73 =C2=B1 10%  perf-profile.cycles=
-pp.hrtimer_interrupt.local_apic_timer_interrupt.smp_apic_timer_interrupt.a=
pic_timer_interrupt
      0.99 =C2=B1106%    +443.9%       5.39 =C2=B1 24%  perf-profile.cycles=
-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpu_startup_e=
ntry
      2.02 =C2=B1  5%     -18.3%       1.65 =C2=B1 10%  perf-profile.cycles=
-pp.irq_exit.smp_apic_timer_interrupt.apic_timer_interrupt
     19.78 =C2=B1  8%     -18.1%      16.19 =C2=B1 10%  perf-profile.cycles=
-pp.local_apic_timer_interrupt.smp_apic_timer_interrupt.apic_timer_interrupt
      1.93 =C2=B1 10%     +14.9%       2.22 =C2=B1  6%  perf-profile.cycles=
-pp.native_irq_return_iret
      1.06 =C2=B1  4%     -13.6%       0.92 =C2=B1  7%  perf-profile.cycles=
-pp.perf_event_task_tick.scheduler_tick.update_process_times.tick_sched_han=
dle.tick_sched_timer
      3.67 =C2=B1  7%      -9.5%       3.33 =C2=B1  5%  perf-profile.cycles=
-pp.pipe_write.__vfs_write.vfs_write.sys_write.entry_SYSCALL_64_fastpath
     10.15 =C2=B1  6%     -15.2%       8.61 =C2=B1 10%  perf-profile.cycles=
-pp.scheduler_tick.update_process_times.tick_sched_handle.tick_sched_timer.=
__hrtimer_run_queues
     23.01 =C2=B1  7%     -17.7%      18.94 =C2=B1 10%  perf-profile.cycles=
-pp.smp_apic_timer_interrupt.apic_timer_interrupt
      0.92 =C2=B1  5%     +45.9%       1.34 =C2=B1 12%  perf-profile.cycles=
-pp.smp_call_function_interrupt.call_function_interrupt
      1.00 =C2=B1108%    +421.6%       5.20 =C2=B1 21%  perf-profile.cycles=
-pp.start_secondary
      6.68 =C2=B1  6%     -14.1%       5.73 =C2=B1 10%  perf-profile.cycles=
-pp.task_tick_fair.scheduler_tick.update_process_times.tick_sched_handle.ti=
ck_sched_timer
      1.30 =C2=B1  7%     -18.8%       1.06 =C2=B1  7%  perf-profile.cycles=
-pp.tick_program_event.hrtimer_interrupt.local_apic_timer_interrupt.smp_api=
c_timer_interrupt.apic_timer_interrupt
     14.41 =C2=B1  8%     -16.9%      11.98 =C2=B1 10%  perf-profile.cycles=
-pp.tick_sched_handle.isra.17.tick_sched_timer.__hrtimer_run_queues.hrtimer=
_interrupt.local_apic_timer_interrupt
     15.44 =C2=B1  8%     -17.1%      12.79 =C2=B1 10%  perf-profile.cycles=
-pp.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.local_apic_time=
r_interrupt.smp_apic_timer_interrupt
      1.89 =C2=B1  6%     -16.1%       1.59 =C2=B1 14%  perf-profile.cycles=
-pp.update_cfs_shares.task_tick_fair.scheduler_tick.update_process_times.ti=
ck_sched_handle
      0.95 =C2=B1 11%     -31.1%       0.66 =C2=B1 13%  perf-profile.cycles=
-pp.update_cpu_load_active.scheduler_tick.update_process_times.tick_sched_h=
andle.tick_sched_timer
     14.18 =C2=B1  7%     -16.8%      11.80 =C2=B1 10%  perf-profile.cycles=
-pp.update_process_times.tick_sched_handle.tick_sched_timer.__hrtimer_run_q=
ueues.hrtimer_interrupt





                                   pbzip2.throughput

  1.2e+08 ++---------------------------------------------------------------=
-+
          |                                                                =
 |
    1e+08 *+**.*.**.*.**.*.**.**.*.**   **.*.**.*.**   **.*.**.**.*.**.*.**=
.*
          O OO O OO O OO O OO OO O OO O OO O OO O OO O OO O O              =
 |
          |                         :   :          :   :                   =
 |
    8e+07 ++                         :  :           :  :                   =
 |
          |                          : :            : :                    =
 |
    6e+07 ++                         : :            : :                    =
 |
          |                          : :            : :                    =
 |
    4e+07 ++                         : :            : :                    =
 |
          |                          : :            : :                    =
 |
          |                           ::             ::                    =
 |
    2e+07 ++                          :              :                     =
 |
          |                           :              :                     =
 |
        0 ++--------------------------*--------------*---------------------=
-+


                              pbzip2.time.system_time

  400 O+O-OO-O------O----O-O--------O-OO---O-OO-----O----------------------=
-+
      |        O OO   O O    O OO O      O      O O  O O O O               =
 |
  350 *+*.**.*.*.*   .*.**.*.*.**.*   **.*.*.**.*.*  *.*.*.**.*.*. *.*.*.**=
.*
  300 ++          *.*             :   :           :  :            *        =
 |
      |                           :   :           :  :                     =
 |
  250 ++                           :  :            : :                     =
 |
      |                            : :             : :                     =
 |
  200 ++                           : :             : :                     =
 |
      |                            : :             : :                     =
 |
  150 ++                           : :             ::                      =
 |
  100 ++                           : :             ::                      =
 |
      |                             ::              :                      =
 |
   50 ++                            :               :                      =
 |
      |                             :               :                      =
 |
    0 ++----------------------------*---------------*----------------------=
-+


                                 time.system_time

  400 O+O-OO-O------O----O-O--------O-OO---O-OO-----O----------------------=
-+
      |        O OO   O O    O OO O      O      O O  O O O O               =
 |
  350 *+*.**.*.*.*   .*.**.*.*.**.*   **.*.*.**.*.*  *.*.*.**.*.*. *.*.*.**=
.*
  300 ++          *.*             :   :           :  :            *        =
 |
      |                           :   :           :  :                     =
 |
  250 ++                           :  :            : :                     =
 |
      |                            : :             : :                     =
 |
  200 ++                           : :             : :                     =
 |
      |                            : :             : :                     =
 |
  150 ++                           : :             ::                      =
 |
  100 ++                           : :             ::                      =
 |
      |                             ::              :                      =
 |
   50 ++                            :               :                      =
 |
      |                             :               :                      =
 |
    0 ++----------------------------*---------------*----------------------=
-+


                              proc-vmstat.pgalloc_dma32

  6e+06 ++-----------------------------------------------------------------=
-+
        *.**.*.*.**.*.**.*.**.*.*.**   **.*.**.*.*.*  *.**.*.**.*.*.**.*.**=
.*
  5e+06 ++                         :   :           :  :                    =
 |
        |                          :   :           :  :                    =
 |
        |                          :   :           :  :                    =
 |
  4e+06 ++                          : :            : :                     =
 |
        |                           : :            : :                     =
 |
  3e+06 ++                          : :            : :                     =
 |
        |                           : :             ::                     =
 |
  2e+06 ++                          : :             ::                     =
 |
        |                           : :             ::                     =
 |
        |                            :              :                      =
 |
  1e+06 ++                           :              :                      =
 |
        |                            :              :                      =
 |
      0 O+OO-O-O-OO-O-OO-O-OO-O-O-OO-O-OO-O-OO-O-O-OO-O-OO-O---------------=
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

--===============7310763755352423103==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCkxLUF9TRVJWRVI6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZTX1BPUlQ6IDEzOQp0
ZXN0Y2FzZTogcGJ6aXAyCmRlZmF1bHQtbW9uaXRvcnM6CiAgd2FpdDogYWN0aXZhdGUtbW9uaXRv
cgogIGttc2c6IAogIHVwdGltZTogCiAgaW9zdGF0OiAKICBoZWFydGJlYXQ6IAogIHZtc3RhdDog
CiAgbnVtYS1udW1hc3RhdDogCiAgbnVtYS12bXN0YXQ6IAogIG51bWEtbWVtaW5mbzogCiAgcHJv
Yy12bXN0YXQ6IAogIHByb2Mtc3RhdDoKICAgIGludGVydmFsOiAxMAogIG1lbWluZm86IAogIHNs
YWJpbmZvOiAKICBpbnRlcnJ1cHRzOiAKICBsb2NrX3N0YXQ6IAogIGxhdGVuY3lfc3RhdHM6IAog
IHNvZnRpcnFzOiAKICBiZGlfZGV2X21hcHBpbmc6IAogIGRpc2tzdGF0czogCiAgbmZzc3RhdDog
CiAgY3B1aWRsZTogCiAgY3B1ZnJlcS1zdGF0czogCiAgdHVyYm9zdGF0OiAKICBwbWV0ZXI6IAog
IHNjaGVkX2RlYnVnOgogICAgaW50ZXJ2YWw6IDYwCmNwdWZyZXFfZ292ZXJub3I6IHBlcmZvcm1h
bmNlCmRlZmF1bHQtd2F0Y2hkb2dzOgogIG9vbS1raWxsZXI6IAogIHdhdGNoZG9nOiAKY29tbWl0
OiA1MTI4NGViMmQ0YTk5Nzc1NGY1OTNkZjczNTAyYWViYWM3NDQxZTcxCm1vZGVsOiBJdnl0b3du
IEl2eSBCcmlkZ2UtRVAKbnJfY3B1OiA0OAptZW1vcnk6IDY0Rwpzd2FwX3BhcnRpdGlvbnM6IExB
QkVMPVNXQVAKcm9vdGZzX3BhcnRpdGlvbjogTEFCRUw9TEtQLVJPT1RGUwpjYXRlZ29yeTogYmVu
Y2htYXJrCnBlcmYtcHJvZmlsZToKICBmcmVxOiA4MDAKbnJfdGhyZWFkczogMTAwJQpwYnppcDI6
CiAgYmxvY2tzaXplOiA5MDBLCnF1ZXVlOiBiaXNlY3QKdGVzdGJveDogaXZiNDIKdGJveF9ncm91
cDogaXZiNDIKa2NvbmZpZzogeDg2XzY0LXJoZWwKZW5xdWV1ZV90aW1lOiAyMDE2LTA0LTIyIDA1
OjE5OjUwLjQzMDU5ODgyOCArMDg6MDAKY29tcGlsZXI6IGdjYy00LjkKcm9vdGZzOiBkZWJpYW4t
eDg2XzY0LTIwMTUtMDItMDcuY2d6CmlkOiAwMjc5ZjY0YzA4ZjRjNTRjZWRiMzEzMzk3NDlhYWQ5
ZTMyMDkxNTUwCnVzZXI6IGxrcApoZWFkX2NvbW1pdDogM2NmMzY0MmM4NDNmMjY0OTAxNzBhYmM3
OTA5MTE0MTFjYzhkN2NhYQpiYXNlX2NvbW1pdDogYzNiNDZjNzMyNjRiMDMwMDBkMWUxOGIyMmY1
Y2FmNjMzMzI1NDdjOQpicmFuY2g6IGxpbnV4LWRldmVsL2RldmVsLWhvdXJseS0yMDE2MDQyMTAx
CnJlc3VsdF9yb290OiAiL3Jlc3VsdC9wYnppcDIvcGVyZm9ybWFuY2UtMTAwJS05MDBLL2l2YjQy
L2RlYmlhbi14ODZfNjQtMjAxNS0wMi0wNy5jZ3oveDg2XzY0LXJoZWwvZ2NjLTQuOS81MTI4NGVi
MmQ0YTk5Nzc1NGY1OTNkZjczNTAyYWViYWM3NDQxZTcxLzAiCmpvYl9maWxlOiAiL2xrcC9zY2hl
ZHVsZWQvaXZiNDIvYmlzZWN0X3BiemlwMi1wZXJmb3JtYW5jZS0xMDAlLTkwMEstZGViaWFuLXg4
Nl82NC0yMDE1LTAyLTA3LmNnei14ODZfNjQtcmhlbC01MTI4NGViMmQ0YTk5Nzc1NGY1OTNkZjcz
NTAyYWViYWM3NDQxZTcxLTIwMTYwNDIyLTExNjU1MC0xcXBzeXJxLTAueWFtbCIKbWF4X3VwdGlt
ZTogMTI3MC44NAppbml0cmQ6ICIvb3NpbWFnZS9kZWJpYW4vZGViaWFuLXg4Nl82NC0yMDE1LTAy
LTA3LmNneiIKYm9vdGxvYWRlcl9hcHBlbmQ6Ci0gcm9vdD0vZGV2L3JhbTAKLSB1c2VyPWxrcAot
IGpvYj0vbGtwL3NjaGVkdWxlZC9pdmI0Mi9iaXNlY3RfcGJ6aXAyLXBlcmZvcm1hbmNlLTEwMCUt
OTAwSy1kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6LXg4Nl82NC1yaGVsLTUxMjg0ZWIyZDRh
OTk3NzU0ZjU5M2RmNzM1MDJhZWJhYzc0NDFlNzEtMjAxNjA0MjItMTE2NTUwLTFxcHN5cnEtMC55
YW1sCi0gQVJDSD14ODZfNjQKLSBrY29uZmlnPXg4Nl82NC1yaGVsCi0gYnJhbmNoPWxpbnV4LWRl
dmVsL2RldmVsLWhvdXJseS0yMDE2MDQyMTAxCi0gY29tbWl0PTUxMjg0ZWIyZDRhOTk3NzU0ZjU5
M2RmNzM1MDJhZWJhYzc0NDFlNzEKLSBCT09UX0lNQUdFPS9wa2cvbGludXgveDg2XzY0LXJoZWwv
Z2NjLTQuOS81MTI4NGViMmQ0YTk5Nzc1NGY1OTNkZjczNTAyYWViYWM3NDQxZTcxL3ZtbGludXot
NC42LjAtcmMzLTAwMDUyLWc1MTI4NGViMgotIG1heF91cHRpbWU9MTI3MAotIFJFU1VMVF9ST09U
PS9yZXN1bHQvcGJ6aXAyL3BlcmZvcm1hbmNlLTEwMCUtOTAwSy9pdmI0Mi9kZWJpYW4teDg2XzY0
LTIwMTUtMDItMDcuY2d6L3g4Nl82NC1yaGVsL2djYy00LjkvNTEyODRlYjJkNGE5OTc3NTRmNTkz
ZGY3MzUwMmFlYmFjNzQ0MWU3MS8wCi0gTEtQX1NFUlZFUj1pbm4KLSB8Mi0KCgogIGVhcmx5cHJp
bnRrPXR0eVMwLDExNTIwMCBzeXN0ZW1kLmxvZ19sZXZlbD1lcnIKICBkZWJ1ZyBhcGljPWRlYnVn
IHN5c3JxX2Fsd2F5c19lbmFibGVkIHJjdXBkYXRlLnJjdV9jcHVfc3RhbGxfdGltZW91dD0xMDAK
ICBwYW5pYz0tMSBzb2Z0bG9ja3VwX3BhbmljPTEgbm1pX3dhdGNoZG9nPXBhbmljIG9vcHM9cGFu
aWMgbG9hZF9yYW1kaXNrPTIgcHJvbXB0X3JhbWRpc2s9MAogIGNvbnNvbGU9dHR5UzAsMTE1MjAw
IGNvbnNvbGU9dHR5MCB2Z2E9bm9ybWFsCgogIHJ3CmxrcF9pbml0cmQ6ICIvbGtwL2xrcC9sa3At
eDg2XzY0LmNneiIKbW9kdWxlc19pbml0cmQ6ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00
LjkvNTEyODRlYjJkNGE5OTc3NTRmNTkzZGY3MzUwMmFlYmFjNzQ0MWU3MS9tb2R1bGVzLmNneiIK
Ym1faW5pdHJkOiAiL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L2xr
cC5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3J1bi1pcGNv
bmZpZy5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3R1cmJv
c3RhdC5jZ3osL2xrcC9iZW5jaG1hcmtzL3R1cmJvc3RhdC5jZ3osL29zaW1hZ2UvZGVwcy9kZWJp
YW4teDg2XzY0LTIwMTUtMDItMDcuY2d6L3BiemlwMi5jZ3oiCmxpbnV4X2hlYWRlcnNfaW5pdHJk
OiAiL3BrZy9saW51eC94ODZfNjQtcmhlbC9nY2MtNC45LzUxMjg0ZWIyZDRhOTk3NzU0ZjU5M2Rm
NzM1MDJhZWJhYzc0NDFlNzEvbGludXgtaGVhZGVycy5jZ3oiCnJlcGVhdF90bzogMgprZXJuZWw6
ICIvcGtnL2xpbnV4L3g4Nl82NC1yaGVsL2djYy00LjkvNTEyODRlYjJkNGE5OTc3NTRmNTkzZGY3
MzUwMmFlYmFjNzQ0MWU3MS92bWxpbnV6LTQuNi4wLXJjMy0wMDA1Mi1nNTEyODRlYjIiCmRlcXVl
dWVfdGltZTogMjAxNi0wNC0yMiAwNToyOToyOS4zNDQ0NTQwODkgKzA4OjAwCmpvYl9zdGF0ZTog
ZmluaXNoZWQKbG9hZGF2ZzogNDQuMjYgMzAuMjEgMTMuMzIgMS81NDMgODk3NwpzdGFydF90aW1l
OiAnMTQ2MTI3NDIxNScKZW5kX3RpbWU6ICcxNDYxMjc0NTE4Jwp2ZXJzaW9uOiAiL2xrcC9sa3Av
LnNyYy0yMDE2MDQyMS0xNzQ3MjciCg==

--===============7310763755352423103==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

MjAxNi0wNC0yMiAwNTozMDoxMyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1MC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0yMiAwNTozMDoxMyBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MS9jcHVmcmVxL3Nj
YWxpbmdfZ292ZXJub3IKMjAxNi0wNC0yMiAwNTozMDoxMyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5
cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTAvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYt
MDQtMjIgMDU6MzA6MTMgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTExL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTIyIDA1OjMwOjEzIGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxMi9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3IKMjAxNi0wNC0yMiAwNTozMDoxMyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvY3B1MTMvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQt
MjIgMDU6MzA6MTMgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2Nw
dTE0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTIyIDA1OjMwOjEzIGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxNS9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wNC0yMiAwNTozMDoxMyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MTYvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMjIg
MDU6MzA6MTMgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTE3
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTIyIDA1OjMwOjEzIGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUxOC9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNi0wNC0yMiAwNTozMDoxMyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MTkvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMjIgMDU6
MzA6MTMgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIvY3B1
ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMjIgMDU6MzA6MTMgZWNobyBwZXJmb3JtYW5j
ZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIwL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5v
cgoyMDE2LTA0LTIyIDA1OjMwOjEzIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lz
dGVtL2NwdS9jcHUyMS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0yMiAwNTozMDox
MyBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjIvY3B1ZnJl
cS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMjIgMDU6MzA6MTMgZWNobyBwZXJmb3JtYW5jZSA+
IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTIzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoy
MDE2LTA0LTIyIDA1OjMwOjEzIGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVt
L2NwdS9jcHUyNC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0yMiAwNTozMDoxMyBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjUvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMjIgMDU6MzA6MTMgZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTI2L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2
LTA0LTIyIDA1OjMwOjE0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHUyNy9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0yMiAwNTozMDoxNCBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MjgvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDQtMjIgMDU6MzA6MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTI5L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0
LTIyIDA1OjMwOjE0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHUzL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTIyIDA1OjMwOjE0IGVjaG8gcGVy
Zm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzMC9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3IKMjAxNi0wNC0yMiAwNTozMDoxNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1MzEvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMjIg
MDU6MzA6MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTMy
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTIyIDA1OjMwOjE0IGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzMy9jcHVmcmVxL3NjYWxpbmdfZ292
ZXJub3IKMjAxNi0wNC0yMiAwNTozMDoxNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS9jcHUvY3B1MzQvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMjIgMDU6
MzA6MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM1L2Nw
dWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTIyIDA1OjMwOjE0IGVjaG8gcGVyZm9ybWFu
Y2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzNi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJu
b3IKMjAxNi0wNC0yMiAwNTozMDoxNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1MzcvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMjIgMDU6MzA6
MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTM4L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTIyIDA1OjMwOjE0IGVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUzOS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IK
MjAxNi0wNC0yMiAwNTozMDoxNCBlY2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3Rl
bS9jcHUvY3B1NC9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0yMiAwNTozMDoxNCBl
Y2hvIHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDAvY3B1ZnJlcS9z
Y2FsaW5nX2dvdmVybm9yCjIwMTYtMDQtMjIgMDU6MzA6MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9z
eXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQxL2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2
LTA0LTIyIDA1OjMwOjE0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9jcHU0Mi9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0yMiAwNTozMDoxNCBlY2hv
IHBlcmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDMvY3B1ZnJlcS9zY2Fs
aW5nX2dvdmVybm9yCjIwMTYtMDQtMjIgMDU6MzA6MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTQ0L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0
LTIyIDA1OjMwOjE0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9j
cHU0NS9jcHVmcmVxL3NjYWxpbmdfZ292ZXJub3IKMjAxNi0wNC0yMiAwNTozMDoxNCBlY2hvIHBl
cmZvcm1hbmNlID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1NDYvY3B1ZnJlcS9zY2FsaW5n
X2dvdmVybm9yCjIwMTYtMDQtMjIgMDU6MzA6MTQgZWNobyBwZXJmb3JtYW5jZSA+IC9zeXMvZGV2
aWNlcy9zeXN0ZW0vY3B1L2NwdTQ3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTIy
IDA1OjMwOjE0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU1
L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTIyIDA1OjMwOjE0IGVjaG8gcGVyZm9y
bWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU2L2NwdWZyZXEvc2NhbGluZ19nb3Zl
cm5vcgoyMDE2LTA0LTIyIDA1OjMwOjE0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHU3L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTIyIDA1OjMw
OjE0IGVjaG8gcGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU4L2NwdWZy
ZXEvc2NhbGluZ19nb3Zlcm5vcgoyMDE2LTA0LTIyIDA1OjMwOjE0IGVjaG8gcGVyZm9ybWFuY2Ug
PiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHU5L2NwdWZyZXEvc2NhbGluZ19nb3Zlcm5vcgo=

--===============7310763755352423103==--

