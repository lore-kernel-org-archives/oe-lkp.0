Content-Type: multipart/mixed; boundary="===============3628581811470846996=="
MIME-Version: 1.0
From: Chris Goldsworthy <cgoldswo@codeaurora.org>
To: lkp@lists.01.org
Subject: Re: [mm] 8cc621d2f4: fio.write_iops -21.8% regression
Date: Mon, 24 May 2021 10:37:49 -0700
Message-ID: <45f761de51d514f77cc48214846c5f8f@codeaurora.org>
In-Reply-To: <YKasEeXCr9R5yzCr@google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3628581811470846996==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Minchan,

This looks good to me, I just have some minor feedback.

Thanks,

Chris.

On 2021-05-20 11:36, Minchan Kim wrote:
> On Thu, May 20, 2021 at 04:31:44PM +0800, kernel test robot wrote:
>> =

>> =

>> Greeting,
>> =

>> FYI, we noticed a -21.8% regression of fio.write_iops due to commit:
>> =

>> =

>> commit: 8cc621d2f45ddd3dc664024a647ee7adf48d79a5 ("mm: fs: invalidate =

>> BH LRU during page migration")
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>> =

>> =

>> in testcase: fio-basic
>> on test machine: 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ =

>> 2.10GHz with 256G memory
>> with following parameters:
>> =

>> 	disk: 2pmem
>> 	fs: ext4
>> 	runtime: 200s
>> 	nr_task: 50%
>> 	time_based: tb
>> 	rw: randwrite
>> 	bs: 4k
>> 	ioengine: libaio
>> 	test_size: 200G
>> 	cpufreq_governor: performance
>> 	ucode: 0x5003006
>> =

>> test-description: Fio is a tool that will spawn a number of threads or =

>> processes doing a particular type of I/O action as specified by the =

>> user.
>> test-url: https://github.com/axboe/fio
>> =

>> =

>> =

>> If you fix the issue, kindly add following tag
>> Reported-by: kernel test robot <oliver.sang@intel.com>
>> =

>> =

>> Details are as below:
>> ------------------------------------------------------------------------=
-------------------------->
>> =

>> =

>> To reproduce:
>> =

>>         git clone https://github.com/intel/lkp-tests.git
>>         cd lkp-tests
>>         bin/lkp install                job.yaml  # job file is =

>> attached in this email
>>         bin/lkp split-job --compatible job.yaml  # generate the yaml =

>> file for lkp run
>>         bin/lkp run                    generated-yaml-file
> =

> Hi,
> =

> I tried to insall the lkp-test in my machine by following above guide =

> but failed
> due to package problems(I guess it's my problem since I use something =

> particular
> environement). However, I guess it comes from increased miss ratio of =

> bh_lrus
> since the patch caused more frequent invalidation of the bh_lrus calls =

> compared
> to old. For example, lru_add_drain could be called from several hot =

> places(e.g.,
> unmap and pagevec_release from several path) and it could keeps =

> invalidating
> bh_lrus.
> =

> IMO, we should move the overhead from such hot path to cold one. How =

> about this?
> =

> From ebf4ede1cf32fb14d85f0015a3693cb8e1b8dbfe Mon Sep 17 00:00:00 2001
> From: Minchan Kim <minchan@kernel.org>
> Date: Thu, 20 May 2021 11:17:56 -0700
> Subject: [PATCH] invalidate bh_lrus only at lru_add_drain_all
> =

> Not-Yet-Signed-off-by: Minchan Kim <minchan@kernel.org>
> ---
>  mm/swap.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> =

> diff --git a/mm/swap.c b/mm/swap.c
> index dfb48cf9c2c9..d6168449e28c 100644
> --- a/mm/swap.c
> +++ b/mm/swap.c
> @@ -642,7 +642,6 @@ void lru_add_drain_cpu(int cpu)
>  		pagevec_lru_move_fn(pvec, lru_lazyfree_fn);
> =

>  	activate_page_drain(cpu);
> -	invalidate_bh_lrus_cpu(cpu);
>  }
> =

>  /**
> @@ -725,6 +724,17 @@ void lru_add_drain(void)
>  	local_unlock(&lru_pvecs.lock);
>  }
> =

> +void lru_and_bh_lrus_drain(void)
> +{
> +	int cpu;
> +
> +	local_lock(&lru_pvecs.lock);
> +	cpu =3D smp_processor_id();
> +	lru_add_drain_cpu(cpu);
> +	local_unlock(&lru_pvecs.lock);
> +	invalidate_bh_lrus_cpu(cpu);
> +}
> +

Nit: drop int cpu?

>  void lru_add_drain_cpu_zone(struct zone *zone)
>  {
>  	local_lock(&lru_pvecs.lock);
> @@ -739,7 +749,7 @@ static DEFINE_PER_CPU(struct work_struct,
> lru_add_drain_work);
> =

>  static void lru_add_drain_per_cpu(struct work_struct *dummy)
>  {
> -	lru_add_drain();
> +	lru_and_bh_lrus_drain();
>  }
> =

>  /*
> @@ -881,6 +891,7 @@ void lru_cache_disable(void)
>  	__lru_add_drain_all(true);
>  #else
>  	lru_add_drain();
> +	invalidate_bh_lrus_cpu(smp_processor_id());
>  #endif
>  }

Can't we replace the call to lru_add_drain() and =

invalidate_bh_lrus_cpu(smp_processor_id()) with a single call to =

lru_and_bh_lrus_drain()?

> --
> 2.31.1.818.g46aad6cb9e-goog
> =


Thanks,

Chris.

>> =

>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> bs/compiler/cpufreq_governor/disk/fs/ioengine/kconfig/nr_task/rootfs/run=
time/rw/tbox_group/test_size/testcase/time_based/ucode:
>>   =

>> 4k/gcc-9/performance/2pmem/ext4/libaio/x86_64-rhel-8.3/50%/debian-10.4-x=
86_64-20200603.cgz/200s/randwrite/lkp-csl-2sp6/200G/fio-basic/tb/0x5003006
>> =

>> commit:
>>   361a2a229f ("mm: replace migrate_[prep|finish] with =

>> lru_cache_[disable|enable]")
>>   8cc621d2f4 ("mm: fs: invalidate BH LRU during page migration")
>> =

>> 361a2a229fa31ab7 8cc621d2f45ddd3dc664024a647
>> ---------------- ---------------------------
>>          %stddev     %change         %stddev
>>              \          |                \
>>       0.01            -0.0        0.00        fio.latency_1000ms%
>>       0.27 =C2=B1  5%      -0.0        0.24 =C2=B1  7%  fio.latency_10ms%
>>       0.01            -0.0        0.00        fio.latency_2000ms%
>>       0.33 =C2=B1  8%      +0.1        0.44 =C2=B1  7%  fio.latency_20ms%
>>       0.01            -0.0        0.00        fio.latency_500ms%
>>      13.99            +6.0       19.96        fio.latency_50ms%
>>       0.01            -0.0        0.00        fio.latency_750ms%
>>       3.40 =C2=B1 44%      -2.2        1.17 =C2=B1 46%  fio.latency_750u=
s%
>>  4.967e+08           -21.8%  3.885e+08        =

>> fio.time.file_system_outputs
>>       2249 =C2=B1 20%     -35.0%       1463 =C2=B1 21%  =

>> fio.time.involuntary_context_switches
>>     305.83 =C2=B1  4%     -32.5%     206.33 =C2=B1  2%  =

>> fio.time.percent_of_cpu_this_job_got
>>     556.42 =C2=B1  3%     -33.6%     369.53 =C2=B1  2%  fio.time.system_=
time
>>      61.89 =C2=B1 18%     -22.9%      47.75 =C2=B1  4%  fio.time.user_ti=
me
>>    1117924           -12.3%     980822 =C2=B1  4%  =

>> fio.time.voluntary_context_switches
>>   62087973           -21.8%   48559860        fio.workload
>>       1212           -21.8%     948.29        fio.write_bw_MBps
>>   33073834           -11.6%   29229056        fio.write_clat_95%_us
>>   34865152            -9.1%   31675733        fio.write_clat_99%_us
>>    4794125           +27.9%    6129631        fio.write_clat_mean_us
>>   13179671 =C2=B1  6%     -10.1%   11842274        fio.write_clat_stddev
>>     310403           -21.8%     242761        fio.write_iops
>>     152653           +28.9%     196759        fio.write_slat_mean_us
>>    2139749            +9.3%    2338598        fio.write_slat_stddev
>>    2101512 =C2=B1121%     -70.4%     621076 =C2=B1 15%  cpuidle.POLL.usa=
ge
>>    2282803 =C2=B1  3%     -18.4%    1861946 =C2=B1  8%  =

>> numa-meminfo.node1.MemFree
>>      43.07            +3.6%      44.63        iostat.cpu.iowait
>>       5.40 =C2=B1  2%     -18.5%       4.40 =C2=B1  3%  iostat.cpu.system
>>       4.27 =C2=B1  2%      -0.9        3.34        mpstat.cpu.all.sys%
>>       0.28 =C2=B1 15%      -0.1        0.20 =C2=B1  3%  mpstat.cpu.all.u=
sr%
>>      43381           -12.6%      37910 =C2=B1  3%  meminfo.Active(anon)
>>      35262 =C2=B1  3%     -10.9%      31403 =C2=B1  6%  meminfo.CmaFree
>>    4195566           -14.2%    3599569        meminfo.MemFree
>>     194.67 =C2=B1  3%     -17.2%     161.17        turbostat.Avg_MHz
>>       7.24 =C2=B1  2%      -1.2        6.08 =C2=B1  3%  turbostat.Busy%
>>     117.10            -1.4%     115.47        turbostat.RAMWatt
>>      42.83            +2.7%      44.00        vmstat.cpu.wa
>>    1285628           -21.8%    1005417        vmstat.io.bo
>>    4195839           -14.3%    3595056        vmstat.memory.free
>>      13161 =C2=B1  2%     -12.2%      11556 =C2=B1  3%  vmstat.system.cs
>>   30958589 =C2=B1  3%     -26.6%   22710943 =C2=B1 11%  =

>> numa-numastat.node0.local_node
>>   11018987 =C2=B1 22%     -41.5%    6444904 =C2=B1 38%  =

>> numa-numastat.node0.numa_foreign
>>   31025533 =C2=B1  3%     -26.6%   22759513 =C2=B1 11%  =

>> numa-numastat.node0.numa_hit
>>   11018987 =C2=B1 22%     -41.5%    6444904 =C2=B1 38%  =

>> numa-numastat.node1.numa_miss
>>   11040187 =C2=B1 22%     -41.3%    6484419 =C2=B1 38%  =

>> numa-numastat.node1.other_node
>>   14095336 =C2=B1  2%     -10.6%   12603755        =

>> numa-vmstat.node0.nr_dirtied
>>   13208199 =C2=B1  2%     -11.2%   11722525        =

>> numa-vmstat.node0.nr_written
>>     852.17 =C2=B1  9%     -82.8%     146.67 =C2=B1 46%  =

>> numa-vmstat.node0.workingset_nodes
>>   14563084 =C2=B1  2%     -11.2%   12933874        =

>> numa-vmstat.node1.nr_dirtied
>>     571303 =C2=B1  3%     -18.5%     465407 =C2=B1  8%  =

>> numa-vmstat.node1.nr_free_pages
>>   13698641 =C2=B1  2%     -12.1%   12047165        =

>> numa-vmstat.node1.nr_written
>>       0.02 =C2=B1 25%     -32.4%       0.01 =C2=B1 27%  =

>> perf-sched.sch_delay.max.ms.jbd2_log_wait_commit.jbd2_log_do_checkpoint.=
__jbd2_log_wait_for_space.add_transaction_credits
>>       6.26 =C2=B1169%     -88.1%       0.74 =C2=B1 64%  =

>> perf-sched.sch_delay.max.ms.schedule_timeout.io_schedule_timeout.balance=
_dirty_pages.balance_dirty_pages_ratelimited
>>      27.33           +16.4%      31.82 =C2=B1  5%  =

>> perf-sched.total_wait_and_delay.average.ms
>>      89752           -15.0%      76314 =C2=B1  4%  =

>> perf-sched.total_wait_and_delay.count.ms
>>      27.33           +16.4%      31.82 =C2=B1  5%  =

>> perf-sched.total_wait_time.average.ms
>>      35.69 =C2=B1 31%    -100.0%       0.00        =

>> perf-sched.wait_and_delay.avg.ms.preempt_schedule_common.__cond_resched.=
down_read.ext4_da_map_blocks.constprop
>>       0.29 =C2=B1  2%     +34.9%       0.39 =C2=B1  8%  =

>> perf-sched.wait_and_delay.avg.ms.rwsem_down_read_slowpath.ext4_da_map_bl=
ocks.constprop.0.ext4_da_get_block_prep
>>     416.43 =C2=B1  2%     +40.7%     585.86 =C2=B1  3%  =

>> perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.poll_sch=
edule_timeout.constprop.0.do_sys_poll
>>      29.78            -9.6%      26.93        =

>> perf-sched.wait_and_delay.avg.ms.schedule_timeout.io_schedule_timeout.ba=
lance_dirty_pages.balance_dirty_pages_ratelimited
>>     242.41 =C2=B1 20%     +65.7%     401.67 =C2=B1 13%  =

>> perf-sched.wait_and_delay.avg.ms.schedule_timeout.kcompactd.kthread.ret_=
from_fork
>>      21.67 =C2=B1 25%     -67.7%       7.00 =C2=B1 85%  =

>> perf-sched.wait_and_delay.count.kswapd.kthread.ret_from_fork
>>       4.33 =C2=B1 51%    -100.0%       0.00        =

>> perf-sched.wait_and_delay.count.preempt_schedule_common.__cond_resched.d=
own_read.ext4_da_map_blocks.constprop
>>      12.67 =C2=B1 30%     -81.6%       2.33 =C2=B1223%  =

>> perf-sched.wait_and_delay.count.preempt_schedule_common.__cond_resched.g=
eneric_perform_write.ext4_buffered_write_iter.aio_write
>>      62774           -23.9%      47742 =C2=B1  8%  =

>> perf-sched.wait_and_delay.count.rwsem_down_read_slowpath.ext4_da_map_blo=
cks.constprop.0.ext4_da_get_block_prep
>>      44.83 =C2=B1  3%     -29.0%      31.83 =C2=B1  3%  =

>> perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.poll_sche=
dule_timeout.constprop.0.do_sys_poll
>>      14423           +11.9%      16138        =

>> perf-sched.wait_and_delay.count.schedule_timeout.io_schedule_timeout.bal=
ance_dirty_pages.balance_dirty_pages_ratelimited
>>      79.67 =C2=B1 17%     -39.5%      48.17 =C2=B1 14%  =

>> perf-sched.wait_and_delay.count.schedule_timeout.kcompactd.kthread.ret_f=
rom_fork
>>      43.01 =C2=B1 51%    -100.0%       0.00        =

>> perf-sched.wait_and_delay.max.ms.preempt_schedule_common.__cond_resched.=
down_read.ext4_da_map_blocks.constprop
>>     109.65 =C2=B1  6%     -12.4%      96.02 =C2=B1  7%  =

>> perf-sched.wait_and_delay.max.ms.schedule_timeout.io_schedule_timeout.ba=
lance_dirty_pages.balance_dirty_pages_ratelimited
>>      35.68 =C2=B1 31%     -22.7%      27.57 =C2=B1  5%  =

>> perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.down_=
read.ext4_da_map_blocks.constprop
>>       0.29 =C2=B1  2%     +35.0%       0.39 =C2=B1  8%  =

>> perf-sched.wait_time.avg.ms.rwsem_down_read_slowpath.ext4_da_map_blocks.=
constprop.0.ext4_da_get_block_prep
>>     416.43 =C2=B1  2%     +40.7%     585.86 =C2=B1  3%  =

>> perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.poll_schedule=
_timeout.constprop.0.do_sys_poll
>>      29.77            -9.6%      26.93        =

>> perf-sched.wait_time.avg.ms.schedule_timeout.io_schedule_timeout.balance=
_dirty_pages.balance_dirty_pages_ratelimited
>>     242.41 =C2=B1 20%     +65.7%     401.66 =C2=B1 13%  =

>> perf-sched.wait_time.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_=
fork
>>       3.22 =C2=B1203%     -99.6%       0.01 =C2=B1223%  =

>> perf-sched.wait_time.avg.ms.schedule_timeout.wait_for_completion.__flush=
_work.__drain_all_pages
>>       0.10 =C2=B1132%     -84.4%       0.02 =C2=B1 80%  =

>> perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.ext4_=
journal_check_start.__ext4_journal_start_reserved.ext4_convert_unwritten_io=
_end_vec
>>     107.54 =C2=B1  8%     -47.8%      56.19 =C2=B1 70%  =

>> perf-sched.wait_time.max.ms.rwsem_down_write_slowpath.ext4_map_blocks.ex=
t4_writepages.do_writepages
>>     109.64 =C2=B1  6%     -12.4%      96.02 =C2=B1  7%  =

>> perf-sched.wait_time.max.ms.schedule_timeout.io_schedule_timeout.balance=
_dirty_pages.balance_dirty_pages_ratelimited
>>      35.78 =C2=B1220%     -99.9%       0.05 =C2=B1223%  =

>> perf-sched.wait_time.max.ms.schedule_timeout.wait_for_completion.__flush=
_work.__drain_all_pages
>>      33.56 =C2=B1  5%     -27.9%      24.20 =C2=B1 44%  =

>> perf-sched.wait_time.max.ms.wait_transaction_locked.add_transaction_cred=
its.start_this_handle.jbd2__journal_start
>>     884734 =C2=B1 93%     -82.5%     154904 =C2=B1 54%  =

>> proc-vmstat.compact_isolated
>>      10835           -12.6%       9471 =C2=B1  3%  =

>> proc-vmstat.nr_active_anon
>>     142479            -1.5%     140281        =

>> proc-vmstat.nr_active_file
>>   63543876           -21.6%   49802284        proc-vmstat.nr_dirtied
>>    9537128            +1.5%    9679184        =

>> proc-vmstat.nr_file_pages
>>       8775 =C2=B1  3%      -9.4%       7949 =C2=B1  5%  proc-vmstat.nr_f=
ree_cma
>>    1047867           -14.1%     900231        =

>> proc-vmstat.nr_free_pages
>>    8839312            +1.7%    8985232        =

>> proc-vmstat.nr_inactive_file
>>     457350            +1.6%     464520        =

>> proc-vmstat.nr_slab_reclaimable
>>   62565176           -22.7%   48374444        proc-vmstat.nr_written
>>      10836           -12.6%       9472 =C2=B1  3%  =

>> proc-vmstat.nr_zone_active_anon
>>     142503            -1.5%     140308        =

>> proc-vmstat.nr_zone_active_file
>>    8840847            +1.7%    8986996        =

>> proc-vmstat.nr_zone_inactive_file
>>   12080712 =C2=B1 17%     -26.1%    8922914 =C2=B1 12%  proc-vmstat.numa=
_foreign
>>   52344635 =C2=B1  4%     -20.2%   41790589 =C2=B1  2%  proc-vmstat.numa=
_hit
>>   52256486 =C2=B1  4%     -20.2%   41702499 =C2=B1  2%  proc-vmstat.numa=
_local
>>   12080712 =C2=B1 17%     -26.1%    8922914 =C2=B1 12%  proc-vmstat.numa=
_miss
>>   12168861 =C2=B1 17%     -26.0%    9011004 =C2=B1 12%  proc-vmstat.numa=
_other
>>      30433 =C2=B1 13%     -16.6%      25366 =C2=B1  5%  proc-vmstat.pgac=
tivate
>>    2278530           -18.9%    1846941 =C2=B1  7%  =

>> proc-vmstat.pgalloc_dma32
>>   62368755           -21.4%   49038161        =

>> proc-vmstat.pgalloc_normal
>>   55006150           -26.8%   40250446        proc-vmstat.pgfree
>>      10920 =C2=B1 63%     -82.0%       1964 =C2=B1119%  =

>> proc-vmstat.pgmigrate_fail
>>     444528 =C2=B1 93%     -82.2%      79298 =C2=B1 51%  =

>> proc-vmstat.pgmigrate_success
>>   2.62e+08           -21.9%  2.045e+08        proc-vmstat.pgpgout
>>   42363626            -8.6%   38717997        proc-vmstat.pgscan_file
>>   41658702            -8.4%   38149115        =

>> proc-vmstat.pgscan_kswapd
>>   42361403            -8.6%   38717417        proc-vmstat.pgsteal_file
>>   41656479            -8.4%   38148535        =

>> proc-vmstat.pgsteal_kswapd
>>   82628757            -5.9%   77759594        =

>> proc-vmstat.slabs_scanned
>>     386745 =C2=B1 29%     -49.6%     194783 =C2=B1  6%  =

>> interrupts.CAL:Function_call_interrupts
>>       6532 =C2=B1 30%     -60.6%       2576 =C2=B1 40%  =

>> interrupts.CPU1.CAL:Function_call_interrupts
>>       6834 =C2=B1 35%     -62.5%       2563 =C2=B1 40%  =

>> interrupts.CPU10.CAL:Function_call_interrupts
>>       6529 =C2=B1 37%     -54.6%       2965 =C2=B1 38%  =

>> interrupts.CPU13.CAL:Function_call_interrupts
>>       5216 =C2=B1 35%     -61.9%       1988 =C2=B1 55%  =

>> interrupts.CPU15.CAL:Function_call_interrupts
>>      71.00 =C2=B1 36%     -61.0%      27.67 =C2=B1 62%  =

>> interrupts.CPU15.RES:Rescheduling_interrupts
>>       5532 =C2=B1 27%     -62.7%       2062 =C2=B1 52%  =

>> interrupts.CPU16.CAL:Function_call_interrupts
>>      61.67 =C2=B1 40%     -75.7%      15.00 =C2=B1 47%  =

>> interrupts.CPU16.RES:Rescheduling_interrupts
>>       7412 =C2=B1 32%     -63.8%       2684 =C2=B1 44%  =

>> interrupts.CPU18.CAL:Function_call_interrupts
>>       5379 =C2=B1 36%     -39.0%       3279 =C2=B1 30%  =

>> interrupts.CPU19.CAL:Function_call_interrupts
>>       5174 =C2=B1 25%     -52.8%       2443 =C2=B1 32%  =

>> interrupts.CPU20.CAL:Function_call_interrupts
>>      73.50 =C2=B1 45%     -54.4%      33.50 =C2=B1 80%  =

>> interrupts.CPU21.RES:Rescheduling_interrupts
>>       7035 =C2=B1 29%     -63.6%       2564 =C2=B1 66%  =

>> interrupts.CPU23.CAL:Function_call_interrupts
>>       6149 =C2=B1 39%     -49.5%       3104 =C2=B1 19%  =

>> interrupts.CPU3.CAL:Function_call_interrupts
>>     248.17 =C2=B1 51%     +78.6%     443.33 =C2=B1 34%  =

>> interrupts.CPU36.NMI:Non-maskable_interrupts
>>     248.17 =C2=B1 51%     +78.6%     443.33 =C2=B1 34%  =

>> interrupts.CPU36.PMI:Performance_monitoring_interrupts
>>     509.33 =C2=B1  5%     -62.0%     193.33 =C2=B1 59%  =

>> interrupts.CPU42.NMI:Non-maskable_interrupts
>>     509.33 =C2=B1  5%     -62.0%     193.33 =C2=B1 59%  =

>> interrupts.CPU42.PMI:Performance_monitoring_interrupts
>>       6932 =C2=B1 43%     -65.7%       2378 =C2=B1 18%  =

>> interrupts.CPU48.CAL:Function_call_interrupts
>>       5884 =C2=B1 17%     -63.8%       2131 =C2=B1 60%  =

>> interrupts.CPU49.CAL:Function_call_interrupts
>>       5593 =C2=B1 26%     -50.2%       2787 =C2=B1 27%  =

>> interrupts.CPU5.CAL:Function_call_interrupts
>>       5501 =C2=B1 63%     -65.0%       1925 =C2=B1 57%  =

>> interrupts.CPU51.CAL:Function_call_interrupts
>>       5352 =C2=B1 19%     -61.5%       2059 =C2=B1 43%  =

>> interrupts.CPU52.CAL:Function_call_interrupts
>>      74.50 =C2=B1 44%     -73.4%      19.83 =C2=B1 78%  =

>> interrupts.CPU52.RES:Rescheduling_interrupts
>>       4305 =C2=B1 22%     -74.5%       1097 =C2=B1 50%  =

>> interrupts.CPU53.CAL:Function_call_interrupts
>>     922.33 =C2=B1 91%     -67.6%     298.50 =C2=B1 58%  =

>> interrupts.CPU55.NMI:Non-maskable_interrupts
>>     922.33 =C2=B1 91%     -67.6%     298.50 =C2=B1 58%  =

>> interrupts.CPU55.PMI:Performance_monitoring_interrupts
>>       7849 =C2=B1 42%     -78.6%       1681 =C2=B1 54%  =

>> interrupts.CPU57.CAL:Function_call_interrupts
>>      75.00 =C2=B1 40%     -74.0%      19.50 =C2=B1 51%  =

>> interrupts.CPU57.RES:Rescheduling_interrupts
>>       6309 =C2=B1 40%     -50.1%       3149 =C2=B1 19%  =

>> interrupts.CPU6.CAL:Function_call_interrupts
>>      53.33 =C2=B1 73%     -65.3%      18.50 =C2=B1109%  =

>> interrupts.CPU62.RES:Rescheduling_interrupts
>>       4893 =C2=B1 17%     -67.8%       1575 =C2=B1 64%  =

>> interrupts.CPU63.CAL:Function_call_interrupts
>>     104.00 =C2=B1 58%     -81.1%      19.67 =C2=B1 63%  =

>> interrupts.CPU63.RES:Rescheduling_interrupts
>>      49.17 =C2=B1 80%     -68.8%      15.33 =C2=B1 45%  =

>> interrupts.CPU64.RES:Rescheduling_interrupts
>>      62.67 =C2=B1 61%     -71.8%      17.67 =C2=B1 92%  =

>> interrupts.CPU67.RES:Rescheduling_interrupts
>>       8163 =C2=B1 32%     -69.9%       2456 =C2=B1 64%  =

>> interrupts.CPU7.CAL:Function_call_interrupts
>>       5163 =C2=B1 57%     -64.3%       1841 =C2=B1 55%  =

>> interrupts.CPU71.CAL:Function_call_interrupts
>>     165.33 =C2=B1 42%    +598.8%       1155 =C2=B1 85%  =

>> interrupts.CPU79.NMI:Non-maskable_interrupts
>>     165.33 =C2=B1 42%    +598.8%       1155 =C2=B1 85%  =

>> interrupts.CPU79.PMI:Performance_monitoring_interrupts
>>     401.83 =C2=B1 42%     -49.4%     203.50 =C2=B1 31%  =

>> interrupts.CPU82.NMI:Non-maskable_interrupts
>>     401.83 =C2=B1 42%     -49.4%     203.50 =C2=B1 31%  =

>> interrupts.CPU82.PMI:Performance_monitoring_interrupts
>>       5512 =C2=B1 19%     -64.6%       1950 =C2=B1 39%  =

>> interrupts.CPU9.CAL:Function_call_interrupts
>>     209.50 =C2=B1 35%     -41.2%     123.17 =C2=B1 34%  =

>> interrupts.CPU90.NMI:Non-maskable_interrupts
>>     209.50 =C2=B1 35%     -41.2%     123.17 =C2=B1 34%  =

>> interrupts.CPU90.PMI:Performance_monitoring_interrupts
>>       3763 =C2=B1  7%     -34.9%       2451 =C2=B1 14%  =

>> interrupts.RES:Rescheduling_interrupts
>>       5.47            -8.6%       5.00        perf-stat.i.MPKI
>>  2.655e+09            -8.7%  2.425e+09        =

>> perf-stat.i.branch-instructions
>>       1.20            -0.1        1.13        =

>> perf-stat.i.branch-miss-rate%
>>   31751272           -13.4%   27505174        =

>> perf-stat.i.branch-misses
>>   50939566           -19.7%   40921870 =C2=B1  2%  perf-stat.i.cache-mis=
ses
>>   79655814           -20.5%   63321768 =C2=B1  2%  =

>> perf-stat.i.cache-references
>>      13271 =C2=B1  2%     -12.3%      11636 =C2=B1  3%  =

>> perf-stat.i.context-switches
>>       1.24 =C2=B1  3%      -5.5%       1.17        perf-stat.i.cpi
>>  1.802e+10 =C2=B1  4%     -17.4%  1.488e+10        perf-stat.i.cpu-cycles
>>  4.127e+09           -11.8%  3.642e+09        perf-stat.i.dTLB-loads
>>  1.992e+09           -12.0%  1.752e+09        perf-stat.i.dTLB-stores
>>    5010814 =C2=B1  4%     -23.7%    3825076 =C2=B1 12%  =

>> perf-stat.i.iTLB-load-misses
>>  1.396e+10            -9.9%  1.257e+10        perf-stat.i.instructions
>>       0.19 =C2=B1  4%     -17.4%       0.15        perf-stat.i.metric.GHz
>>     878.82            -7.5%     812.57 =C2=B1  2%  perf-stat.i.metric.K/=
sec
>>      91.56           -11.0%      81.46        perf-stat.i.metric.M/sec
>>       3065            -1.0%       3033        perf-stat.i.minor-faults
>>      46.71 =C2=B1  3%      +5.0       51.72 =C2=B1  5%  =

>> perf-stat.i.node-load-miss-rate%
>>    8184873 =C2=B1  4%     -30.9%    5656360 =C2=B1  6%  perf-stat.i.node=
-loads
>>      57.96 =C2=B1  2%      +6.5       64.41        =

>> perf-stat.i.node-store-miss-rate%
>>    2001649 =C2=B1  5%     -16.6%    1669180 =C2=B1  2%  =

>> perf-stat.i.node-store-misses
>>    1374181 =C2=B1  3%     -32.9%     922555 =C2=B1  3%  perf-stat.i.node=
-stores
>>       5.71           -11.8%       5.04        perf-stat.overall.MPKI
>>       1.20            -0.1        1.13        =

>> perf-stat.overall.branch-miss-rate%
>>       1.29 =C2=B1  3%      -8.3%       1.18        perf-stat.overall.cpi
>>      72.84            -5.7       67.18 =C2=B1  3%  =

>> perf-stat.overall.iTLB-load-miss-rate%
>>       0.78 =C2=B1  3%      +8.9%       0.84        perf-stat.overall.ipc
>>      46.39 =C2=B1  3%      +5.5       51.91 =C2=B1  5%  =

>> perf-stat.overall.node-load-miss-rate%
>>      59.27 =C2=B1  3%      +5.1       64.42        =

>> perf-stat.overall.node-store-miss-rate%
>>      45385           +15.1%      52236        =

>> perf-stat.overall.path-length
>>  2.643e+09            -8.7%  2.414e+09        =

>> perf-stat.ps.branch-instructions
>>   31606841           -13.4%   27384226        =

>> perf-stat.ps.branch-misses
>>   50691768           -19.7%   40727855 =C2=B1  2%  =

>> perf-stat.ps.cache-misses
>>   79290645           -20.5%   63040614 =C2=B1  2%  =

>> perf-stat.ps.cache-references
>>      13210 =C2=B1  2%     -12.3%      11582 =C2=B1  3%  =

>> perf-stat.ps.context-switches
>>  1.794e+10 =C2=B1  4%     -17.4%  1.482e+10        perf-stat.ps.cpu-cycl=
es
>>  4.107e+09           -11.7%  3.625e+09        perf-stat.ps.dTLB-loads
>>  1.982e+09           -12.0%  1.744e+09        perf-stat.ps.dTLB-stores
>>    4988272 =C2=B1  4%     -23.6%    3809139 =C2=B1 12%  =

>> perf-stat.ps.iTLB-load-misses
>>  1.389e+10            -9.9%  1.252e+10        =

>> perf-stat.ps.instructions
>>       3050            -1.0%       3019        =

>> perf-stat.ps.minor-faults
>>    8145509 =C2=B1  4%     -30.9%    5629700 =C2=B1  6%  perf-stat.ps.nod=
e-loads
>>    1993105 =C2=B1  5%     -16.6%    1662627 =C2=B1  2%  =

>> perf-stat.ps.node-store-misses
>>    1367876 =C2=B1  3%     -32.9%     918414 =C2=B1  3%  perf-stat.ps.nod=
e-stores
>>  2.818e+12           -10.0%  2.537e+12        =

>> perf-stat.total.instructions
>>       0.79 =C2=B1 13%      +0.2        1.03 =C2=B1 17%  =

>> perf-profile.calltrace.cycles-pp.clockevents_program_event.hrtimer_inter=
rupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_a=
pic_timer_interrupt
>>       0.41 =C2=B1 72%      +0.4        0.76 =C2=B1 18%  =

>> perf-profile.calltrace.cycles-pp.ktime_get.clockevents_program_event.hrt=
imer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
>>       0.00            +0.7        0.72 =C2=B1 12%  =

>> perf-profile.calltrace.cycles-pp.ext4_reserve_inode_write.__ext4_mark_in=
ode_dirty.ext4_convert_unwritten_extents.ext4_convert_unwritten_io_end_vec.=
ext4_put_io_end
>>       3.34 =C2=B1 12%      +0.9        4.24 =C2=B1 12%  =

>> perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_=
apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.do_idle
>>       1.35 =C2=B1 17%      +1.2        2.54 =C2=B1  9%  =

>> perf-profile.calltrace.cycles-pp.ext4_find_extent.ext4_ext_map_blocks.ex=
t4_map_blocks.ext4_writepages.do_writepages
>>       3.64 =C2=B1 16%      +1.2        4.84 =C2=B1 10%  =

>> perf-profile.calltrace.cycles-pp.ext4_map_blocks.ext4_convert_unwritten_=
extents.ext4_convert_unwritten_io_end_vec.ext4_put_io_end.ext4_writepages
>>       0.51 =C2=B1 45%      +1.2        1.72 =C2=B1 10%  =

>> perf-profile.calltrace.cycles-pp.__read_extent_tree_block.ext4_find_exte=
nt.ext4_ext_map_blocks.ext4_map_blocks.ext4_writepages
>>       2.09 =C2=B1 15%      +1.2        3.33 =C2=B1  9%  =

>> perf-profile.calltrace.cycles-pp.ext4_ext_map_blocks.ext4_map_blocks.ext=
4_convert_unwritten_extents.ext4_convert_unwritten_io_end_vec.ext4_put_io_e=
nd
>>       0.83 =C2=B1 14%      +1.3        2.08 =C2=B1  8%  =

>> perf-profile.calltrace.cycles-pp.ext4_find_extent.ext4_ext_map_blocks.ex=
t4_map_blocks.ext4_convert_unwritten_extents.ext4_convert_unwritten_io_end_=
vec
>>       1.49 =C2=B1 11%      +1.3        2.74 =C2=B1  5%  =

>> perf-profile.calltrace.cycles-pp.pagecache_get_page.__find_get_block.__g=
etblk_gfp.__read_extent_tree_block.ext4_find_extent
>>       4.77 =C2=B1 16%      +1.4        6.21 =C2=B1 10%  =

>> perf-profile.calltrace.cycles-pp.ext4_convert_unwritten_extents.ext4_con=
vert_unwritten_io_end_vec.ext4_put_io_end.ext4_writepages.do_writepages
>>       0.00            +1.5        1.50 =C2=B1  7%  =

>> perf-profile.calltrace.cycles-pp.__read_extent_tree_block.ext4_find_exte=
nt.ext4_ext_map_blocks.ext4_map_blocks.ext4_convert_unwritten_extents
>>       0.27 =C2=B1100%      +2.8        3.03 =C2=B1  9%  =

>> perf-profile.calltrace.cycles-pp.__getblk_gfp.__read_extent_tree_block.e=
xt4_find_extent.ext4_ext_map_blocks.ext4_map_blocks
>>       3.07 =C2=B1 13%      +2.9        6.00 =C2=B1  5%  =

>> perf-profile.calltrace.cycles-pp.__find_get_block.__getblk_gfp.__read_ex=
tent_tree_block.ext4_find_extent.ext4_ext_map_blocks
>>       0.23 =C2=B1 26%      -0.1        0.10 =C2=B1 27%  =

>> perf-profile.children.cycles-pp.errseq_check
>>       0.23 =C2=B1 26%      -0.1        0.14 =C2=B1 21%  =

>> perf-profile.children.cycles-pp.node_dirty_ok
>>       0.11 =C2=B1  8%      +0.0        0.14 =C2=B1  9%  =

>> perf-profile.children.cycles-pp.io_serial_in
>>       0.16 =C2=B1 11%      +0.0        0.20 =C2=B1 13%  =

>> perf-profile.children.cycles-pp.irq_work_run_list
>>       0.46 =C2=B1  6%      +0.1        0.53 =C2=B1  3%  =

>> perf-profile.children.cycles-pp.rb_next
>>       0.01 =C2=B1223%      +0.1        0.09 =C2=B1 46%  =

>> perf-profile.children.cycles-pp.ext4_cache_extents
>>       0.01 =C2=B1223%      +0.1        0.09 =C2=B1 46%  =

>> perf-profile.children.cycles-pp.ext4_es_cache_extent
>>       0.12 =C2=B1 19%      +0.1        0.23 =C2=B1 39%  =

>> perf-profile.children.cycles-pp.tick_irq_enter
>>       0.12 =C2=B1 17%      +0.1        0.24 =C2=B1 36%  =

>> perf-profile.children.cycles-pp.irq_enter_rcu
>>       0.41 =C2=B1 12%      +0.2        0.58 =C2=B1 10%  =

>> perf-profile.children.cycles-pp.__brelse
>>       0.51 =C2=B1 18%      +0.2        0.72 =C2=B1  8%  =

>> perf-profile.children.cycles-pp.__pagevec_release
>>       0.00            +0.2        0.23 =C2=B1 11%  =

>> perf-profile.children.cycles-pp.invalidate_bh_lrus_cpu
>>       0.00            +0.3        0.27 =C2=B1 10%  =

>> perf-profile.children.cycles-pp.lru_add_drain
>>       0.45 =C2=B1 13%      +0.3        0.79 =C2=B1 12%  =

>> perf-profile.children.cycles-pp.ext4_reserve_inode_write
>>       0.29 =C2=B1 10%      +0.4        0.65 =C2=B1 12%  =

>> perf-profile.children.cycles-pp.ext4_get_inode_loc
>>       0.29 =C2=B1 10%      +0.4        0.65 =C2=B1 12%  =

>> perf-profile.children.cycles-pp.__ext4_get_inode_loc
>>       1.06 =C2=B1 15%      +0.4        1.46 =C2=B1 16%  =

>> perf-profile.children.cycles-pp.ktime_get
>>       2.31 =C2=B1 10%      +0.7        3.00 =C2=B1  8%  =

>> perf-profile.children.cycles-pp.xas_load
>>       4.78 =C2=B1 16%      +1.4        6.21 =C2=B1 10%  =

>> perf-profile.children.cycles-pp.ext4_convert_unwritten_extents
>>       4.44 =C2=B1  7%      +2.4        6.87 =C2=B1  5%  =

>> perf-profile.children.cycles-pp.__read_extent_tree_block
>>       8.40 =C2=B1  5%      +2.5       10.90 =C2=B1  4%  =

>> perf-profile.children.cycles-pp.ext4_find_extent
>>      12.63 =C2=B1  6%      +2.5       15.17 =C2=B1  4%  =

>> perf-profile.children.cycles-pp.ext4_ext_map_blocks
>>       4.33 =C2=B1  8%      +2.8        7.10 =C2=B1  5%  =

>> perf-profile.children.cycles-pp.__getblk_gfp
>>       3.91 =C2=B1  9%      +2.8        6.69 =C2=B1  5%  =

>> perf-profile.children.cycles-pp.__find_get_block
>>       0.23 =C2=B1 26%      -0.1        0.10 =C2=B1 28%  =

>> perf-profile.self.cycles-pp.errseq_check
>>       0.14 =C2=B1 13%      -0.0        0.11 =C2=B1 14%  =

>> perf-profile.self.cycles-pp.__getblk_gfp
>>       0.08 =C2=B1 14%      -0.0        0.06 =C2=B1 13%  =

>> perf-profile.self.cycles-pp.get_page_from_freelist
>>       0.11 =C2=B1  8%      +0.0        0.14 =C2=B1  9%  =

>> perf-profile.self.cycles-pp.io_serial_in
>>       0.05 =C2=B1 74%      +0.0        0.09 =C2=B1 15%  =

>> perf-profile.self.cycles-pp.jbd2_journal_get_write_access
>>       0.00            +0.1        0.06 =C2=B1 13%  =

>> perf-profile.self.cycles-pp.ext4_buffered_write_iter
>>       0.08 =C2=B1 19%      +0.1        0.14 =C2=B1 29%  =

>> perf-profile.self.cycles-pp.ktime_get_update_offsets_now
>>       0.00            +0.1        0.07 =C2=B1  6%  =

>> perf-profile.self.cycles-pp.invalidate_bh_lrus_cpu
>>       0.45 =C2=B1  6%      +0.1        0.53 =C2=B1  3%  =

>> perf-profile.self.cycles-pp.rb_next
>>       0.40 =C2=B1 13%      +0.2        0.56 =C2=B1 11%  =

>> perf-profile.self.cycles-pp.__brelse
>>       0.61 =C2=B1 11%      +0.2        0.84 =C2=B1  7%  =

>> perf-profile.self.cycles-pp._raw_spin_lock
>>       0.89 =C2=B1 19%      +0.4        1.27 =C2=B1 17%  =

>> perf-profile.self.cycles-pp.ktime_get
>>       2.09 =C2=B1 10%      +0.6        2.67 =C2=B1  7%  =

>> perf-profile.self.cycles-pp.xas_load
>>       1.00 =C2=B1 10%      +0.6        1.59 =C2=B1  6%  =

>> perf-profile.self.cycles-pp.pagecache_get_page
>>       1.36 =C2=B1  5%      +1.0        2.34 =C2=B1  6%  =

>> perf-profile.self.cycles-pp.__find_get_block
>> =

>> =

>> =

>>                                  fio.write_bw_MBps
>> =

>>   1300 =

>> +--------------------------------------------------------------------+
>>        |                                                               =

>>      |
>>   1250 |-.++       +.+   ++.  +.         .++    +.+                   =

>> +.    |
>>   1200 |++  :  +.+ :  +.+   + : +    +.++  :  ++  :  +    ++.+   +   + =

>>  ++.+|
>>        |    : +   :          +   +.+ :      ::     :: :   :   +.+ :  : =

>>      |
>>   1150 |-+   ::   +                 +       ::     :: ++.:        +.+  =

>>      |
>>        |     +                              +      +     +             =

>>      |
>>   1100 |-+                                                             =

>>      |
>>        |                                                               =

>>      |
>>   1050 |-+                                                             =

>>      |
>>   1000 |-+                                                             =

>>      |
>>        |                                                               =

>>      |
>>    950 |O+ O OO  OOO OO OOO OOO OO OOO OO  OO OO  O                    =

>>      |
>>        |  O    O                          O     O                      =

>>      |
>>    900 =

>> +--------------------------------------------------------------------+
>> =

>> =

>>                                    fio.write_iops
>> =

>>   330000 =

>> +------------------------------------------------------------------+
>>   320000 |-+          +                                                =

>>      |
>>          | .++   ++  + + ++.++ .+         .++    +.+ +     +          =

>> .+    |
>>   310000 |++ :   : : :  +     +  +    +.++  :  ++  : :+    :++.+ +   + =

>>  ++.+|
>>   300000 |-+  : +  ::             +.+ :      ::     :: +  :     + +  : =

>>      |
>>          |    :+    +                +       ::     :   + :        ++  =

>>      |
>>   290000 |-+  +                              +      +    +             =

>>      |
>>   280000 |-+                                                           =

>>      |
>>   270000 |-+                                                           =

>>      |
>>          |                                                             =

>>      |
>>   260000 |-+                                                           =

>>      |
>>   250000 |-+                                                           =

>>      |
>>          |O OOO O O OOO OOO OOO OOO OOO OO  OO OO  O                   =

>>      |
>>   240000 |-+     O                         O     O                     =

>>      |
>>   230000 =

>> +------------------------------------------------------------------+
>> =

>> =

>>                                 fio.write_clat_mean_us
>> =

>>   6.4e+06 =

>> +-----------------------------------------------------------------+
>>           |       O                        O                           =

>>      |
>>   6.2e+06 |-+OO  O O OOO O  O   O   O OO  O O OOO OO                   =

>>      |
>>     6e+06 |O+  O          OO  OO  OO    O                              =

>>      |
>>           |                                                            =

>>      |
>>   5.8e+06 |-+                                                          =

>>      |
>>   5.6e+06 |-+                                                          =

>>      |
>>           |                                                            =

>>      |
>>   5.4e+06 |-+                                                          =

>>      |
>>   5.2e+06 |-+  +                              +     +                  =

>>      |
>>           |    ::                             :     ::   .+        +   =

>>      |
>>     5e+06 |-+  ::    +             ++.+      : :    :: ++ :       + +  =

>>      |
>>   4.8e+06 |-+ :  +  + :  +     + .+    ++.   : +   :  ::   :++.+++   : =

>>  ++.+|
>>           |+.++   ++  + + + +.+ +         +++   +.++  +    +         =

>> +.+    |
>>   4.6e+06 =

>> +-----------------------------------------------------------------+
>> =

>> =

>>                                  fio.write_clat_99__us
>> =

>>   3.55e+07 =

>> +----------------------------------------------------------------+
>>            |:                            ::    :+                      =

>>      |
>>    3.5e+07 |+.+++.++++.+++.+++.++++  ++.+ +.+++  =

>> +++.+++.++++.+++.+++.++++.+|
>>   3.45e+07 |-+                     + :                                 =

>>      |
>>            |                        +                                  =

>>      |
>>    3.4e+07 |-+                                                         =

>>      |
>>   3.35e+07 |-+ O     O   O  OO  O O   O                                =

>>      |
>>            |        O               O                                  =

>>      |
>>    3.3e+07 |O+  O          O   O     O   O                             =

>>      |
>>   3.25e+07 |-+    O                                                    =

>>      |
>>            |                     O            O                        =

>>      |
>>    3.2e+07 |-+         OO               O    O     O                   =

>>      |
>>   3.15e+07 |-+                            O                            =

>>      |
>>            |  O                                O O                     =

>>      |
>>    3.1e+07 =

>> +----------------------------------------------------------------+
>> =

>> =

>>                                fio.write_slat_mean_us
>> =

>>   210000 =

>> +------------------------------------------------------------------+
>>          |                                                             =

>>      |
>>   200000 |-+O    O                    O    O    OO                     =

>>      |
>>          |O  OO O O OOO OOO OOO OOO OO  OO  OO O   O                   =

>>      |
>>   190000 |-+                                                           =

>>      |
>>          |                                                             =

>>      |
>>   180000 |-+                                                           =

>>      |
>>          |                                                             =

>>      |
>>   170000 |-+                                                           =

>>      |
>>          |    +                              +      +    +             =

>>      |
>>   160000 |-+  :+    +              .++       :+     :  ++ :       .++  =

>>      |
>>          |   :  +  + :  +     +. ++   +.+   :  +   : :+   : ++.+++   =

>> +. ++.+|
>>   150000 |+.++   ++  + + ++.++  +        +.++   ++.+ +     +           =

>> +    |
>>          |            +                                                =

>>      |
>>   140000 =

>> +------------------------------------------------------------------+
>> =

>> =

>>                                  fio.write_slat_stddev
>> =

>>    2.4e+06 =

>> +----------------------------------------------------------------+
>>            |                                                           =

>>      |
>>   2.35e+06 |-+OO   O   O          O     O   O     O                    =

>>      |
>>            |O   O O OO  OO  OO  OO  OOO   O  OOO O O                   =

>>      |
>>            |               O   O         O                             =

>>      |
>>    2.3e+06 |-+                                                         =

>>      |
>>            |                                                           =

>>      |
>>   2.25e+06 |-+                                                         =

>>      |
>>            |    +                             +      +                 =

>>      |
>>    2.2e+06 |-+  :                             :      :   ++            =

>>      |
>>            |    ::                    +.      ::    : : +  :       ++  =

>>      |
>>            |   : :   +.  +.     + +. +  ++   : +.   : :+   +     .+  + =

>>     +|
>>   2.15e+06 |+. :  :++  + : + +.+ :: +     +. :   + :  +     +.+++     =

>> +   + |
>>            |  ++  +     +   ::   +          ++    ++                   =

>> +++  |
>>    2.1e+06 =

>> +----------------------------------------------------------------+
>> =

>> =

>>                                 fio.latency_50ms_
>> =

>>   21 =

>> +----------------------------------------------------------------------+
>>      |  O     O                          O      O                      =

>>      |
>>   20 |O+ O OO  OO OO OO  OO  O O O OO OO  OO OO  O                     =

>>      |
>>   19 |-+               O    O   O                                      =

>>      |
>>      |                                                                 =

>>      |
>>   18 |-+                                                               =

>>      |
>>      |                                                                 =

>>      |
>>   17 |-+                                                               =

>>      |
>>      |                                                                 =

>>      |
>>   16 |-+                                                               =

>>      |
>>   15 |-+   +    +                          +      +     +         +    =

>>      |
>>      |    : +   ::              ++.+       ::     :: +.+ :   .++. :+.  =

>>      |
>>   14 |+.  :  + : :  .++    .+ .+    +. +. : : +. : : :   : ++    +   + =

>> .++.+|
>>      |  ++    ++  ++   +.++  +        +  ++  +  ++  +     +           =

>> +     |
>>   13 =

>> +----------------------------------------------------------------------+
>> =

>> =

>>                                      fio.workload
>> =

>>   6.6e+07 =

>> +-----------------------------------------------------------------+
>>   6.4e+07 |-+          +                                               =

>>      |
>>           | .++   ++  + + +++.+ +.         ++    .++  +    +          =

>> .+    |
>>   6.2e+07 |++ :   : : :  +     +  +    ++.+  : ++  :  ::   :++.+ +   + =

>>  ++.+|
>>     6e+07 |-+  : +  ::             ++. :     : :    :: +   :    + +  : =

>>      |
>>           |    :+    +                +       :     ::  +.:        ++  =

>>      |
>>   5.8e+07 |-+  +                              +     +     +            =

>>      |
>>   5.6e+07 |-+                                                          =

>>      |
>>   5.4e+07 |-+                                                          =

>>      |
>>           |                                                            =

>>      |
>>   5.2e+07 |-+                                                          =

>>      |
>>     5e+07 |-+                                                          =

>>      |
>>           |O OOO O O OOO OOOO OOO OOO OOO O O OOO  O                   =

>>      |
>>   4.8e+07 |-+     O                        O      O                    =

>>      |
>>   4.6e+07 =

>> +-----------------------------------------------------------------+
>> =

>> =

>>                                fio.time.system_time
>> =

>>   650 =

>> +---------------------------------------------------------------------+
>>       |             +                                                  =

>>      |
>>   600 |-+           :                                                  =

>>      |
>>       |   +  +      :   +                 +      +           +        =

>> +. +  |
>>       |+.+ : :+.   : :  :+    +        .++ :  .++ : +.+     + :       =

>> : + + |
>>   550 |-+  : :  +  + :.+  ++ + :.+  .++    : +    : : :   ++  ++.+   + =

>>     +|
>>       |     :    :+  +      +  +  ++        ::     :   : +        :.+  =

>>      |
>>   500 |-+   +    +                          +      +   :+         +    =

>>      |
>>       |                                                +               =

>>      |
>>   450 |-+                                                              =

>>      |
>>       |                                                                =

>>      |
>>       |                                                                =

>>      |
>>   400 |-+                                                              =

>>      |
>>       |   O OO  OO OOO OO OOO  O OO  OO OOO O   OO                     =

>>      |
>>   350 =

>> +---------------------------------------------------------------------+
>> =

>> =

>>                        fio.time.percent_of_cpu_this_job_got
>> =

>>   340 =

>> +---------------------------------------------------------------------+
>>       |             :                                                  =

>>   +  |
>>   320 |-+ +  +      :   +.                +      +           +        =

>> +. :: |
>>   300 |+.+ : :+.   : : +  +  .+        .++ :  .++ : +.+   + + : .+    =

>> : + : |
>>       |    : :  + .+ :+    ++  +.+  .++    : +    : : :  : +  ++ :   + =

>>     +|
>>   280 |-+   :    +   +            ++        ::     :   : :        :.+  =

>>      |
>>       |     +                               +      +   ++         +    =

>>      |
>>   260 |-+                                                              =

>>      |
>>       |                                                                =

>>      |
>>   240 |-+                                                              =

>>      |
>>   220 |-+                                                              =

>>      |
>>       |          O O   O   O     O   O    O O   O                      =

>>      |
>>   200 |O+OO OOO O   OO  O O O OO  OO  O OO   O O O                     =

>>      |
>>       |                                                                =

>>      |
>>   180 =

>> +---------------------------------------------------------------------+
>> =

>> =

>>                              fio.time.file_system_outputs
>> =

>>   5.2e+08 =

>> +-----------------------------------------------------------------+
>>           | .+        ++   ++.  +          +     .+                   =

>> .+    |
>>     5e+08 |++ +   ++  : + +   + :+      +.+ +  ++  +  +    +         + =

>>  +   |
>>           |   :  +  : :  +     +  +    +     : :   :  ::   :++.+++   : =

>>   +.+|
>>   4.8e+08 |-+  ::   ::             ++.+      : :    :: +   :      + +  =

>>      |
>>           |    ::    +                        :     ::  +.:        +   =

>>      |
>>   4.6e+08 |-+  +                              +     +     +            =

>>      |
>>           |                                                            =

>>      |
>>   4.4e+08 |-+                                                          =

>>      |
>>           |                                                            =

>>      |
>>   4.2e+08 |-+                                                          =

>>      |
>>           |                                                            =

>>      |
>>     4e+08 |-+                                                          =

>>      |
>>           |O OOO O O OOO OOOO OOO OOO OOO O O OOO  O                   =

>>      |
>>   3.8e+08 =

>> +-----------------------------------------------------------------+
>> =

>> =

>>                                   fio.latency_750ms_
>> =

>>    0.0101 =

>> +-----------------------------------------------------------------+
>>   0.01008 |-+                                                          =

>>      |
>>           |                                                            =

>>      |
>>   0.01006 |-+                                                          =

>>      |
>>   0.01004 |-+                                                          =

>>      |
>>           |                                                            =

>>      |
>>   0.01002 |-+                                                          =

>>      |
>>      0.01 =

>> |+.+++.+++.+++.++++.+++.+++.+++.+++.+++.+++.+++.++++.+++.+++.+++.+|
>>   0.00998 |-+                                                          =

>>      |
>>           |                                                            =

>>      |
>>   0.00996 |-+                                                          =

>>      |
>>   0.00994 |-+                                                          =

>>      |
>>           |                                                            =

>>      |
>>   0.00992 |-+                                                          =

>>      |
>>    0.0099 =

>> +-----------------------------------------------------------------+
>> =

>> =

>>                                   fio.latency_1000ms_
>> =

>>    0.0101 =

>> +-----------------------------------------------------------------+
>>   0.01008 |-+                                                          =

>>      |
>>           |                                                            =

>>      |
>>   0.01006 |-+                                                          =

>>      |
>>   0.01004 |-+                                                          =

>>      |
>>           |                                                            =

>>      |
>>   0.01002 |-+                                                          =

>>      |
>>      0.01 =

>> |+.+++.+++.+++.++++.+++.+++.+++.+++.+++.+++.+++.++++.+++.+++.+++.+|
>>   0.00998 |-+                                                          =

>>      |
>>           |                                                            =

>>      |
>>   0.00996 |-+                                                          =

>>      |
>>   0.00994 |-+                                                          =

>>      |
>>           |                                                            =

>>      |
>>   0.00992 |-+                                                          =

>>      |
>>    0.0099 =

>> +-----------------------------------------------------------------+
>> =

>> =

>>                                   fio.latency_2000ms_
>> =

>>    0.0101 =

>> +-----------------------------------------------------------------+
>>   0.01008 |-+                                                          =

>>      |
>>           |                                                            =

>>      |
>>   0.01006 |-+                                                          =

>>      |
>>   0.01004 |-+                                                          =

>>      |
>>           |                                                            =

>>      |
>>   0.01002 |-+                                                          =

>>      |
>>      0.01 =

>> |+.+++.+++.+++.++++.+++.+++.+++.+++.+++.+++.+++.++++.+++.+++.+++.+|
>>   0.00998 |-+                                                          =

>>      |
>>           |                                                            =

>>      |
>>   0.00996 |-+                                                          =

>>      |
>>   0.00994 |-+                                                          =

>>      |
>>           |                                                            =

>>      |
>>   0.00992 |-+                                                          =

>>      |
>>    0.0099 =

>> +-----------------------------------------------------------------+
>> =

>> =

>> [*] bisect-good sample
>> [O] bisect-bad  sample
>> =

>> =

>> =

>> Disclaimer:
>> Results have been estimated based on internal Intel analysis and are =

>> provided
>> for informational purposes only. Any difference in system hardware or =

>> software
>> design or configuration may affect actual performance.
>> =

>> =

>> ---
>> 0DAY/LKP+ Test Infrastructure                   Open Source Technology =

>> Center
>> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org       Intel =

>> Corporation
>> =

>> Thanks,
>> Oliver Sang
-- =

The Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora =

Forum,
a Linux Foundation Collaborative Project
--===============3628581811470846996==--

