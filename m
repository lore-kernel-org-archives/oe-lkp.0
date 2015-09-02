Content-Type: multipart/mixed; boundary="===============6019765994413685567=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/build] b2c51106c75: -18.1% will-it-scale.per_process_ops
Date: Wed, 02 Sep 2015 10:40:31 +0800
Message-ID: <1441161631.3138.7.camel@intel.com>
In-Reply-To: <20150805083858.GA21506@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6019765994413685567==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 2015-08-05 at 10:38 +0200, Ingo Molnar wrote:
> * kernel test robot <ying.huang@intel.com> wrote:
> =

> > FYI, we noticed the below changes on
> > =

> > git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/asm
> > commit b2c51106c7581866c37ffc77c5d739f3d4b7cbc9 ("x86/build: Fix detect=
ion of GCC -mpreferred-stack-boundary support")
> =

> Does the performance regression go away reproducibly if you do:
> =

>    git revert b2c51106c7581866c37ffc77c5d739f3d4b7cbc9
> =

> ?

Sorry for reply so late!

Revert the commit will restore part of the performance, as below.
parent commit: f2a50f8b7da45ff2de93a71393e715a2ab9f3b68
the commit:    b2c51106c7581866c37ffc77c5d739f3d4b7cbc9
revert commit: 987d12601a4a82cc2f2151b1be704723eb84cb9d

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/cpufreq_governor/test:
  wsm/will-it-scale/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/perfor=
mance/readseek2

commit: =

  f2a50f8b7da45ff2de93a71393e715a2ab9f3b68
  b2c51106c7581866c37ffc77c5d739f3d4b7cbc9
  987d12601a4a82cc2f2151b1be704723eb84cb9d

f2a50f8b7da45ff2 b2c51106c7581866c37ffc77c5 987d12601a4a82cc2f2151b1be =

---------------- -------------------------- -------------------------- =

         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \  =

    879002 =C2=B1  0%     -18.1%     720270 =C2=B1  7%      -3.6%     84701=
1 =C2=B1  2%  will-it-scale.per_process_ops
      0.02 =C2=B1  0%     +34.5%       0.02 =C2=B1  7%      +5.6%       0.0=
2 =C2=B1  2%  will-it-scale.scalability
     11144 =C2=B1  0%      +0.1%      11156 =C2=B1  0%     +10.6%      1232=
0 =C2=B1  0%  will-it-scale.time.minor_page_faults
    769.30 =C2=B1  0%      -0.9%     762.15 =C2=B1  0%      +1.1%     777.4=
2 =C2=B1  0%  will-it-scale.time.system_time
  26153173 =C2=B1  0%      +7.0%   27977076 =C2=B1  0%      +3.5%   2707812=
4 =C2=B1  0%  will-it-scale.time.voluntary_context_switches
      2964 =C2=B1  2%      +1.4%       3004 =C2=B1  1%     -51.9%       142=
6 =C2=B1  2%  proc-vmstat.pgactivate
      0.06 =C2=B1 27%    +154.5%       0.14 =C2=B1 44%    +122.7%       0.1=
2 =C2=B1 24%  turbostat.CPU%c3
    370683 =C2=B1  0%      +6.2%     393491 =C2=B1  0%      +2.4%     37957=
5 =C2=B1  0%  vmstat.system.cs
     11144 =C2=B1  0%      +0.1%      11156 =C2=B1  0%     +10.6%      1232=
0 =C2=B1  0%  time.minor_page_faults
     15.70 =C2=B1  2%     +14.5%      17.98 =C2=B1  0%      +1.5%      15.9=
4 =C2=B1  1%  time.user_time
    830343 =C2=B1 56%     -54.0%     382128 =C2=B1 39%     -22.3%     64530=
8 =C2=B1 65%  cpuidle.C1E-NHM.time
    788.25 =C2=B1 14%     -21.7%     617.25 =C2=B1 16%     -12.3%     691.0=
0 =C2=B1  3%  cpuidle.C1E-NHM.usage
   2489132 =C2=B1 20%     +79.3%    4464147 =C2=B1 33%     +78.4%    444057=
4 =C2=B1 21%  cpuidle.C3-NHM.time
   1082762 =C2=B1162%    -100.0%       0.00 =C2=B1 -1%    +189.3%    313203=
0 =C2=B1110%  latency_stats.avg.nfs_wait_on_request.nfs_updatepage.nfs_writ=
e_end.generic_perform_write.__generic_file_write_iter.generic_file_write_it=
er.nfs_file_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
    102189 =C2=B1  2%      -2.1%     100087 =C2=B1  5%     -32.9%      6856=
8 =C2=B1  2%  latency_stats.hits.pipe_wait.pipe_read.__vfs_read.vfs_read.Sy=
S_read.entry_SYSCALL_64_fastpath
   1082762 =C2=B1162%    -100.0%       0.00 =C2=B1 -1%    +289.6%    421797=
7 =C2=B1109%  latency_stats.max.nfs_wait_on_request.nfs_updatepage.nfs_writ=
e_end.generic_perform_write.__generic_file_write_iter.generic_file_write_it=
er.nfs_file_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
   1082762 =C2=B1162%    -100.0%       0.00 =C2=B1 -1%    +478.5%    626406=
1 =C2=B1110%  latency_stats.sum.nfs_wait_on_request.nfs_updatepage.nfs_writ=
e_end.generic_perform_write.__generic_file_write_iter.generic_file_write_it=
er.nfs_file_write.__vfs_write.vfs_write.SyS_write.entry_SYSCALL_64_fastpath
      5.10 =C2=B1  2%      -8.0%       4.69 =C2=B1  1%     +13.0%       5.7=
6 =C2=B1  1%  perf-profile.cpu-cycles.__kernel_text_address.print_context_s=
tack.dump_trace.save_stack_trace_tsk.__account_scheduler_latency
      2.58 =C2=B1  8%     +19.5%       3.09 =C2=B1  3%      -1.8%       2.5=
4 =C2=B1 11%  perf-profile.cpu-cycles._raw_spin_lock_irqsave.finish_wait.__=
wait_on_bit_lock.__lock_page.find_lock_entry
      7.02 =C2=B1  3%      +9.2%       7.67 =C2=B1  2%      +7.1%       7.5=
2 =C2=B1  3%  perf-profile.cpu-cycles._raw_spin_lock_irqsave.prepare_to_wai=
t_exclusive.__wait_on_bit_lock.__lock_page.find_lock_entry
      3.07 =C2=B1  2%     +14.8%       3.53 =C2=B1  3%      -1.4%       3.0=
3 =C2=B1  5%  perf-profile.cpu-cycles.finish_wait.__wait_on_bit_lock.__lock=
_page.find_lock_entry.shmem_getpage_gfp
      3.05 =C2=B1  5%      -8.4%       2.79 =C2=B1  4%      -5.2%       2.9=
0 =C2=B1  5%  perf-profile.cpu-cycles.hrtimer_start_range_ns.tick_nohz_stop=
_sched_tick.__tick_nohz_idle_enter.tick_nohz_idle_enter.cpu_startup_entry
      0.89 =C2=B1  5%      -7.6%       0.82 =C2=B1  3%     +16.3%       1.0=
3 =C2=B1  5%  perf-profile.cpu-cycles.is_ftrace_trampoline.__kernel_text_ad=
dress.print_context_stack.dump_trace.save_stack_trace_tsk
      0.98 =C2=B1  3%     -25.1%       0.74 =C2=B1  7%     -16.8%       0.8=
2 =C2=B1  2%  perf-profile.cpu-cycles.is_ftrace_trampoline.print_context_st=
ack.dump_trace.save_stack_trace_tsk.__account_scheduler_latency
      1.58 =C2=B1  3%      -5.2%       1.50 =C2=B1  2%     +44.2%       2.2=
8 =C2=B1  1%  perf-profile.cpu-cycles.is_module_text_address.__kernel_text_=
address.print_context_stack.dump_trace.save_stack_trace_tsk
      1.82 =C2=B1 18%     +46.6%       2.67 =C2=B1  3%     -32.6%       1.2=
3 =C2=B1 56%  perf-profile.cpu-cycles.native_queued_spin_lock_slowpath._raw=
_spin_lock_irqsave.finish_wait.__wait_on_bit_lock.__lock_page
      8.05 =C2=B1  3%      +9.5%       8.82 =C2=B1  3%      +5.4%       8.4=
9 =C2=B1  2%  perf-profile.cpu-cycles.prepare_to_wait_exclusive.__wait_on_b=
it_lock.__lock_page.find_lock_entry.shmem_getpage_gfp
      1.16 =C2=B1  2%      +6.9%       1.25 =C2=B1  5%     +11.4%       1.3=
0 =C2=B1  5%  perf-profile.cpu-cycles.put_page.shmem_file_read_iter.__vfs_r=
ead.vfs_read.sys_read
     11102 =C2=B1  1%      +0.0%      11102 =C2=B1  1%     -95.8%     468.0=
0 =C2=B1  0%  slabinfo.Acpi-ParseExt.active_objs
    198.25 =C2=B1  1%      +0.0%     198.25 =C2=B1  1%     -93.9%      12.0=
0 =C2=B1  0%  slabinfo.Acpi-ParseExt.active_slabs
     11102 =C2=B1  1%      +0.0%      11102 =C2=B1  1%     -95.8%     468.0=
0 =C2=B1  0%  slabinfo.Acpi-ParseExt.num_objs
    198.25 =C2=B1  1%      +0.0%     198.25 =C2=B1  1%     -93.9%      12.0=
0 =C2=B1  0%  slabinfo.Acpi-ParseExt.num_slabs
    341.25 =C2=B1 14%      +2.9%     351.00 =C2=B1 11%    -100.0%       0.0=
0 =C2=B1 -1%  slabinfo.blkdev_ioc.active_objs
    341.25 =C2=B1 14%      +2.9%     351.00 =C2=B1 11%    -100.0%       0.0=
0 =C2=B1 -1%  slabinfo.blkdev_ioc.num_objs
    438.00 =C2=B1 16%      -8.3%     401.50 =C2=B1 20%    -100.0%       0.0=
0 =C2=B1 -1%  slabinfo.file_lock_ctx.active_objs
    438.00 =C2=B1 16%      -8.3%     401.50 =C2=B1 20%    -100.0%       0.0=
0 =C2=B1 -1%  slabinfo.file_lock_ctx.num_objs
      4398 =C2=B1  1%      +1.4%       4462 =C2=B1  0%     -14.5%       376=
1 =C2=B1  2%  slabinfo.ftrace_event_field.active_objs
      4398 =C2=B1  1%      +1.4%       4462 =C2=B1  0%     -14.5%       376=
1 =C2=B1  2%  slabinfo.ftrace_event_field.num_objs
      3947 =C2=B1  2%     +10.6%       4363 =C2=B1  3%    +107.1%       817=
5 =C2=B1  2%  slabinfo.kmalloc-192.active_objs
     93.00 =C2=B1  2%     +10.8%     103.00 =C2=B1  3%    +120.2%     204.7=
5 =C2=B1  2%  slabinfo.kmalloc-192.active_slabs
      3947 =C2=B1  2%     +10.6%       4363 =C2=B1  3%    +118.4%       862=
0 =C2=B1  2%  slabinfo.kmalloc-192.num_objs
     93.00 =C2=B1  2%     +10.8%     103.00 =C2=B1  3%    +120.2%     204.7=
5 =C2=B1  2%  slabinfo.kmalloc-192.num_slabs
      1794 =C2=B1  0%      +3.2%       1851 =C2=B1  2%     +12.2%       201=
2 =C2=B1  3%  slabinfo.trace_event_file.active_objs
      1794 =C2=B1  0%      +3.2%       1851 =C2=B1  2%     +12.2%       201=
2 =C2=B1  3%  slabinfo.trace_event_file.num_objs
      7065 =C2=B1  7%      -5.4%       6684 =C2=B1  8%    -100.0%       0.0=
0 =C2=B1 -1%  slabinfo.vm_area_struct.active_objs
    160.50 =C2=B1  7%      -5.5%     151.75 =C2=B1  8%    -100.0%       0.0=
0 =C2=B1 -1%  slabinfo.vm_area_struct.active_slabs
      7091 =C2=B1  7%      -5.6%       6694 =C2=B1  8%    -100.0%       0.0=
0 =C2=B1 -1%  slabinfo.vm_area_struct.num_objs
    160.50 =C2=B1  7%      -5.5%     151.75 =C2=B1  8%    -100.0%       0.0=
0 =C2=B1 -1%  slabinfo.vm_area_struct.num_slabs
    857.50 =C2=B1 29%     +75.7%       1506 =C2=B1 78%    +157.6%       220=
9 =C2=B1 33%  sched_debug.cfs_rq[11]:/.blocked_load_avg
     52.75 =C2=B1 29%     -29.4%      37.25 =C2=B1 60%    +103.3%     107.2=
5 =C2=B1 43%  sched_debug.cfs_rq[11]:/.load
    914.50 =C2=B1 29%     +69.9%       1553 =C2=B1 77%    +155.6%       233=
7 =C2=B1 32%  sched_debug.cfs_rq[11]:/.tg_load_contrib
      7.75 =C2=B1 34%     -64.5%       2.75 =C2=B1 64%     -12.9%       6.7=
5 =C2=B1115%  sched_debug.cfs_rq[2]:/.nr_spread_over
      1135 =C2=B1 20%     -43.6%     640.75 =C2=B1 49%     -18.8%     922.5=
0 =C2=B1 51%  sched_debug.cfs_rq[3]:/.blocked_load_avg
      1215 =C2=B1 21%     -43.1%     691.50 =C2=B1 46%     -21.3%     956.2=
5 =C2=B1 50%  sched_debug.cfs_rq[3]:/.tg_load_contrib
     38.50 =C2=B1 21%    +129.9%      88.50 =C2=B1 36%     +96.1%      75.5=
0 =C2=B1 56%  sched_debug.cfs_rq[4]:/.load
     26.00 =C2=B1 20%     +98.1%      51.50 =C2=B1 46%    +142.3%      63.0=
0 =C2=B1 53%  sched_debug.cfs_rq[4]:/.runnable_load_avg
    128.25 =C2=B1 18%    +227.5%     420.00 =C2=B1 43%    +152.4%     323.7=
5 =C2=B1 68%  sched_debug.cfs_rq[4]:/.utilization_load_avg
     28320 =C2=B1 12%      -6.3%      26545 =C2=B1 11%     -19.4%      2281=
3 =C2=B1 13%  sched_debug.cfs_rq[6]:/.avg->runnable_avg_sum
      1015 =C2=B1 78%    +101.1%       2042 =C2=B1 25%     +64.4%       166=
9 =C2=B1 73%  sched_debug.cfs_rq[6]:/.blocked_load_avg
      1069 =C2=B1 72%    +100.2%       2140 =C2=B1 23%     +61.2%       172=
2 =C2=B1 70%  sched_debug.cfs_rq[6]:/.tg_load_contrib
    619.25 =C2=B1 12%      -6.3%     580.25 =C2=B1 11%     -19.2%     500.2=
5 =C2=B1 13%  sched_debug.cfs_rq[6]:/.tg_runnable_contrib
     88.75 =C2=B1 14%     -47.3%      46.75 =C2=B1 36%     -24.5%      67.0=
0 =C2=B1 11%  sched_debug.cfs_rq[9]:/.load
     59.25 =C2=B1 23%     -41.4%      34.75 =C2=B1 34%      -6.3%      55.5=
0 =C2=B1 12%  sched_debug.cfs_rq[9]:/.runnable_load_avg
    315.50 =C2=B1 45%     -64.6%     111.67 =C2=B1  1%     -12.1%     277.2=
5 =C2=B1  3%  sched_debug.cfs_rq[9]:/.utilization_load_avg
   2246758 =C2=B1  7%     +87.6%    4213925 =C2=B1 65%      -2.2%    219747=
5 =C2=B1  4%  sched_debug.cpu#0.nr_switches
   2249376 =C2=B1  7%     +87.4%    4215969 =C2=B1 65%      -2.2%    219921=
6 =C2=B1  4%  sched_debug.cpu#0.sched_count
   1121438 =C2=B1  7%     +81.0%    2030313 =C2=B1 61%      -2.2%    109647=
9 =C2=B1  4%  sched_debug.cpu#0.sched_goidle
   1151160 =C2=B1  7%     +86.5%    2146608 =C2=B1 64%      -1.9%    112926=
4 =C2=B1  3%  sched_debug.cpu#0.ttwu_count
     33.75 =C2=B1 15%     -22.2%      26.25 =C2=B1  6%      -8.9%      30.7=
5 =C2=B1 10%  sched_debug.cpu#1.cpu_load[3]
     33.25 =C2=B1 10%     -18.0%      27.25 =C2=B1  7%      -3.8%      32.0=
0 =C2=B1 11%  sched_debug.cpu#1.cpu_load[4]
     41.75 =C2=B1 29%     +23.4%      51.50 =C2=B1 33%     +53.9%      64.2=
5 =C2=B1 16%  sched_debug.cpu#10.cpu_load[1]
     40.00 =C2=B1 18%     +24.4%      49.75 =C2=B1 18%     +49.4%      59.7=
5 =C2=B1  8%  sched_debug.cpu#10.cpu_load[2]
     39.25 =C2=B1 14%     +22.3%      48.00 =C2=B1 10%     +38.9%      54.5=
0 =C2=B1  7%  sched_debug.cpu#10.cpu_load[3]
     39.50 =C2=B1 15%     +20.3%      47.50 =C2=B1  6%     +30.4%      51.5=
0 =C2=B1  7%  sched_debug.cpu#10.cpu_load[4]
   5269004 =C2=B1  1%     +27.8%    6731790 =C2=B1 30%      +1.4%    534256=
0 =C2=B1  2%  sched_debug.cpu#10.nr_switches
   5273193 =C2=B1  1%     +27.8%    6736526 =C2=B1 30%      +1.4%    534579=
1 =C2=B1  2%  sched_debug.cpu#10.sched_count
   2633974 =C2=B1  1%     +27.8%    3365271 =C2=B1 30%      +1.4%    267090=
1 =C2=B1  2%  sched_debug.cpu#10.sched_goidle
   2644149 =C2=B1  1%     +26.9%    3356318 =C2=B1 30%      +1.9%    269329=
5 =C2=B1  1%  sched_debug.cpu#10.ttwu_count
     26.50 =C2=B1 37%    +116.0%      57.25 =C2=B1 48%    +109.4%      55.5=
0 =C2=B1 29%  sched_debug.cpu#11.cpu_load[0]
     30.75 =C2=B1 15%     +66.7%      51.25 =C2=B1 31%     +65.9%      51.0=
0 =C2=B1 21%  sched_debug.cpu#11.cpu_load[1]
     33.50 =C2=B1 10%     +37.3%      46.00 =C2=B1 22%     +39.6%      46.7=
5 =C2=B1 17%  sched_debug.cpu#11.cpu_load[2]
     37.00 =C2=B1 11%     +15.5%      42.75 =C2=B1 19%     +29.7%      48.0=
0 =C2=B1 11%  sched_debug.cpu#11.cpu_load[4]
    508300 =C2=B1 11%      -0.6%     505024 =C2=B1  1%     +18.1%     60029=
1 =C2=B1  7%  sched_debug.cpu#4.avg_idle
    454696 =C2=B1  9%      -5.9%     427894 =C2=B1 25%     +21.8%     55360=
8 =C2=B1  4%  sched_debug.cpu#5.avg_idle
     66.00 =C2=B1 27%     +11.0%      73.25 =C2=B1 37%     -46.6%      35.2=
5 =C2=B1 22%  sched_debug.cpu#6.cpu_load[0]
     62.00 =C2=B1 36%     +12.5%      69.75 =C2=B1 45%     -41.5%      36.2=
5 =C2=B1 11%  sched_debug.cpu#6.cpu_load[1]
    247681 =C2=B1 19%     +21.0%     299747 =C2=B1 10%     +28.7%     31876=
4 =C2=B1 17%  sched_debug.cpu#8.avg_idle
   5116609 =C2=B1  4%     +34.5%    6884238 =C2=B1 33%     +55.2%    794225=
4 =C2=B1 34%  sched_debug.cpu#9.nr_switches
   5120531 =C2=B1  4%     +34.5%    6889156 =C2=B1 33%     +55.2%    794527=
0 =C2=B1 34%  sched_debug.cpu#9.sched_count
   2557822 =C2=B1  4%     +34.5%    3441428 =C2=B1 33%     +55.2%    397033=
7 =C2=B1 34%  sched_debug.cpu#9.sched_goidle
   2565307 =C2=B1  4%     +32.9%    3410042 =C2=B1 33%     +54.0%    394969=
6 =C2=B1 34%  sched_debug.cpu#9.ttwu_count
      0.00 =C2=B1141%  +4.2e+05%       4.76 =C2=B1173%     +47.7%       0.0=
0 =C2=B1-59671%  sched_debug.rt_rq[10]:/.rt_time
    155259 =C2=B1  0%      +0.0%     155259 =C2=B1  0%     -42.2%      8972=
3 =C2=B1  0%  sched_debug.sysctl_sched.sysctl_sched_features

Best Regards,
Huang, Ying



--===============6019765994413685567==--

