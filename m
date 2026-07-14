Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9363D2EB5B8
	for <oe-lkp@lists.linux.dev>; Tue, 14 Jul 2026 21:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784065002; cv=none; b=XzSP50J1mltmbtiw9FiBNYidh6bqmXtoO25jn3jIitpC4o+TF5PWNKZ2qO8NJLwRegj94GjETjZ81Cs6Z9Lharbz3WllZAjMSjScuZHr7hWzgyOOyyjvpa1h+iIuhqXUmi4GIkHc3Si11/lCjAausL3xcqT22Mn51xEBoM0+S8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784065002; c=relaxed/simple;
	bh=zPN43Bq8eMSZ4Pw2t0vGWKYKmDBNwMhcKyhj6xOS+p4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GlMFKOVyPcu+QokSgPBSB2XVLcKzDtZI3Rffc03rcbqA4YTgaO+WVljzE23hdAVxvPQlsnKBkkmKKJciTKG8oze4dKvqQr0Er6hg3vtdSpFMR9VBfeGoRO27EhXORYuqAbclOtMmuS5VKmbbyKLJ6si8flVPSorkufvhfYGBa8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=GCsPawRr; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="GCsPawRr"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0BAAD339;
	Tue, 14 Jul 2026 14:36:33 -0700 (PDT)
Received: from [10.57.83.234] (unknown [10.57.83.234])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F23CF3F915;
	Tue, 14 Jul 2026 14:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784064997; bh=zPN43Bq8eMSZ4Pw2t0vGWKYKmDBNwMhcKyhj6xOS+p4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GCsPawRrEExzROKCCo2E6hpSPe1dn9OM7RUS0tkicZmW+r5THis6HagN4dY0A9ZaW
	 z3dASh1Nf/ZRECe060P3Sk2oyffOvBS/YAsp9Eb6lI6G/fOCLFs6D8Rd8Kpf2GfzX9
	 1kbt1mJXteB0ALtvTDAZR1P4wnweboHJSZU/uqsU=
Message-ID: <4ee18c03-ce30-49ac-8c11-377351483de1@arm.com>
Date: Tue, 14 Jul 2026 22:36:32 +0100
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linus:master] [sched/deadline] 14a8570564:
 stress-ng.mmaprandom.ops_per_sec 18.9% improvement
To: kernel test robot <oliver.sang@intel.com>,
 Peter Zijlstra <peterz@infradead.org>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
 John Stultz <jstultz@google.com>, Juri Lelli <juri.lelli@redhat.com>,
 aubrey.li@linux.intel.com, yu.c.chen@intel.com,
 Dietmar Eggemann <dietmar.eggemann@arm.com>
References: <202607101604.5b29f080-lkp@intel.com>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <202607101604.5b29f080-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/12/26 10:25, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed a 18.9% improvement of stress-ng.mmaprandom.ops_per_sec on:
> 
> 
> commit: 14a857056466be9d3d907a94e92a704ac1be149b ("sched/deadline: Use revised wakeup rule for dl_server")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> 
> 
> testcase: stress-ng
> config: x86_64-rhel-9.4
> compiler: gcc-14
> test machine: 192 threads 2 sockets Intel(R) Xeon(R) 6740E  CPU @ 2.4GHz (Sierra Forest) with 256G memory
> parameters:
> 
> 	nr_threads: 100%
> 	testtime: 60s
> 	test: mmaprandom
> 	cpufreq_governor: performance
> 
> 
> 
> Details are as below:
> -------------------------------------------------------------------------------------------------->
> 
> 
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20260710/202607101604.5b29f080-lkp@intel.com
> 
> =========================================================================================
> compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
>   gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-srf-2sp2/mmaprandom/stress-ng/60s
> 
> commit: 
>   v7.0-rc7
>   sched-urgent-2026-04-12
> 
>         v7.0-rc7     sched-urgent-2026-04-12 
> ---------------- --------------------------- 
>          %stddev     %change         %stddev
>              \          |                \  
>       7.42 ±  6%     +13.7%       8.44 ±  4%  stress-ng.mmaprandom.munmap_lo/hi_addr_ops/sec
>  3.268e+08 ±  3%     +18.8%  3.884e+08 ±  3%  stress-ng.mmaprandom.ops
>    5266977 ±  3%     +18.9%    6261751 ±  3%  stress-ng.mmaprandom.ops_per_sec
>     502294 ±  4%     +18.9%     597382 ±  5%  stress-ng.time.involuntary_context_switches
>   42134946 ±  4%     +15.8%   48772691 ±  3%  stress-ng.time.minor_page_faults
>      11559 ±  2%     +23.9%      14321        stress-ng.time.percent_of_cpu_this_job_got
>       7227           +23.2%       8905        stress-ng.time.system_time
>    1834057 ±  3%     +18.6%    2175623 ±  3%  stress-ng.time.voluntary_context_switches
>     109.70 ± 52%    +161.8%     287.20 ± 30%  perf-c2c.DRAM.local
>      10.88 ± 12%     -24.7%       8.19 ± 11%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.shmdt
>  5.149e+09 ±  4%     -33.2%  3.441e+09 ± 16%  cpuidle..time
>    3590818 ±  4%     +13.6%    4079292 ±  2%  cpuidle..usage
>      89858 ±  4%     +12.6%     101156 ±  3%  perf-stat.i.context-switches
>      78474 ±  4%     +19.4%      93707 ±  4%  perf-stat.ps.context-switches
>      40.88 ±  3%     -18.9       21.97 ± 51%  turbostat.C1%
>      40.77 ±  3%     -46.5%      21.83 ± 51%  turbostat.CPU%c1
>      41.69 ±  2%     -32.1%      28.32 ± 10%  vmstat.cpu.id
>     114.21 ±  3%     +17.4%     134.07 ±  5%  vmstat.procs.r
>      75991 ±  4%     +17.6%      89367 ±  4%  vmstat.system.cs
>     931.70 ± 15%     -21.5%     731.03 ±  6%  meminfo.Inactive
>     931.70 ± 15%     -21.5%     731.03 ±  6%  meminfo.Inactive(file)
>       3323 ± 17%     -92.7%     241.56 ± 41%  meminfo.ShmemHugePages
>       3167 ± 17%     -93.0%     223.03 ± 46%  meminfo.ShmemPmdMapped
>       1958 ± 28%     -94.4%     109.27 ± 64%  numa-meminfo.node0.ShmemHugePages
>       1883 ± 27%     -95.2%      90.32 ± 80%  numa-meminfo.node0.ShmemPmdMapped
>       1464 ± 25%     -90.2%     143.09 ± 73%  numa-meminfo.node1.ShmemHugePages
>       1380 ± 26%     -90.7%     127.76 ± 65%  numa-meminfo.node1.ShmemPmdMapped
>   29299405 ±  3%     +16.7%   34179169 ±  3%  numa-numastat.node0.local_node
>   29397753 ±  3%     +16.7%   34300051 ±  3%  numa-numastat.node0.numa_hit
>   29074958 ±  3%     +17.0%   34029990 ±  3%  numa-numastat.node1.local_node
>   29175702 ±  3%     +16.9%   34110422 ±  3%  numa-numastat.node1.numa_hit
>   29398448 ±  3%     +16.7%   34299565 ±  3%  numa-vmstat.node0.numa_hit
>   29300100 ±  3%     +16.7%   34178683 ±  3%  numa-vmstat.node0.numa_local
>   29175972 ±  3%     +16.9%   34110183 ±  3%  numa-vmstat.node1.numa_hit
>   29075150 ±  3%     +17.0%   34029751 ±  3%  numa-vmstat.node1.numa_local
>      40.14 ±  2%     -14.1       26.05 ± 11%  mpstat.cpu.all.idle%
>       0.33 ±  4%      +0.1        0.39 ±  6%  mpstat.cpu.all.irq%
>       0.26 ±  6%      +0.1        0.32 ±  3%  mpstat.cpu.all.soft%
>      57.71 ±  2%     +13.8       71.52 ±  4%  mpstat.cpu.all.sys%
>      87.62 ±  6%     +12.6%      98.66        mpstat.max_utilization_pct
>      22227           +17.6%      26146        sched_debug.cfs_rq:/.avg_vruntime.avg
>      82637 ± 12%     -26.0%      61123 ± 15%  sched_debug.cfs_rq:/.avg_vruntime.max
>      18397           +16.4%      21416 ±  5%  sched_debug.cfs_rq:/.avg_vruntime.min
>       6674 ±  7%     -26.8%       4887 ±  8%  sched_debug.cfs_rq:/.avg_vruntime.stddev
>     829.95 ± 16%     +37.0%       1136 ±  9%  sched_debug.cfs_rq:/.util_est.max
>      22226           +17.6%      26146        sched_debug.cfs_rq:/.zero_vruntime.avg
>      82637 ± 12%     -26.0%      61123 ± 15%  sched_debug.cfs_rq:/.zero_vruntime.max
>      18397           +16.4%      21416 ±  5%  sched_debug.cfs_rq:/.zero_vruntime.min
>       6674 ±  7%     -26.8%       4887 ±  8%  sched_debug.cfs_rq:/.zero_vruntime.stddev
>     142314 ± 12%     +56.2%     222249 ± 11%  sched_debug.cpu.avg_idle.stddev
>      14910 ±  3%     +15.0%      17153 ±  2%  sched_debug.cpu.nr_switches.avg
>   58577011 ±  3%     +16.8%   68413496 ±  3%  proc-vmstat.numa_hit
>   58377918 ±  3%     +16.8%   68212181 ±  3%  proc-vmstat.numa_local
>    3081605 ±  2%     +19.3%    3677408 ±  3%  proc-vmstat.pgactivate
>   69802610 ±  3%     +17.2%   81798112 ±  3%  proc-vmstat.pgalloc_normal
>    6196217 ±  2%     +19.9%    7429815 ±  3%  proc-vmstat.pgdeactivate
>   42798950 ±  4%     +15.5%   49451147 ±  3%  proc-vmstat.pgfault
>   68727309 ±  3%     +17.4%   80696135 ±  3%  proc-vmstat.pgfree
>     627355 ±  3%     +19.7%     750783 ±  3%  proc-vmstat.pglazyfree
>       4638 ±  3%     +20.0%       5565 ±  4%  proc-vmstat.thp_collapse_alloc
>      15260 ±  2%     +19.2%      18197 ±  3%  proc-vmstat.thp_fault_alloc
>       2729 ±  3%     +20.6%       3292 ±  4%  proc-vmstat.thp_file_mapped
>       1214 ±  3%     +20.9%       1468 ±  3%  proc-vmstat.thp_split_page
>       1214 ±  3%     +20.9%       1468 ±  3%  proc-vmstat.thp_swpout_fallback
>   38553874 ±  3%     +18.6%   45724835 ±  3%  proc-vmstat.unevictable_pgs_culled
>   38620357 ±  3%     +18.6%   45806796 ±  3%  proc-vmstat.unevictable_pgs_mlocked
>   37844607 ±  3%     +18.6%   44877490 ±  3%  proc-vmstat.unevictable_pgs_munlocked
>   37775054 ±  3%     +18.6%   44792535 ±  3%  proc-vmstat.unevictable_pgs_rescued
>     775098 ±  4%     +19.8%     928721 ±  4%  proc-vmstat.unevictable_pgs_stranded
> 
> 
> 
> 
> Disclaimer:
> Results have been estimated based on internal Intel analysis and are provided
> for informational purposes only. Any difference in system hardware or software
> design or configuration may affect actual performance.
> 
> 

Okay I'll bite, how does the revised wakeup rule for fair_server result in this
improvement? The above is mostly "more CPU time used by fair tasks instead of idle"
right?

