Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D45B12CDBE
	for <oe-lkp@lists.linux.dev>; Wed, 26 Aug 2026 03:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787713458; cv=none; b=Ya8iaEecfVLouBnjGbPzNtlZGG8KkCC28FERs0MmaGRdmjnrAP4IcFsMTghlTChzWfR7Sidqx2s93/nAc4ezFv5HurR99r6gC22pS/5fUx378OEDWcAlQobyqafolHWfqrUc/z+DcN4qeu4nPpS2CXNH61KbgX/hG8VFlyDldw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787713458; c=relaxed/simple;
	bh=lJrFcn6E687k6uo2fiN/oEF/p1Lvs9Aml8qeAKjzSrk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZgIftCG+Z/ZR70NUbk5NGE4Oh63Zc6lyoMBrsduPLZo1qyBV59cyLHgW+XzbIrdQTlXjWfe1ESJb9XYNGPaQ9/TVRb9XoXTOA2b/d8ua8LmkT5AoCmfi2GcnB5khBicRZK1S6bY0uXogACBiLgCn+aDELyWObai1YChT8uDB34E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gCDLguL1; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gCDLguL1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787713456; x=1819249456;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=lJrFcn6E687k6uo2fiN/oEF/p1Lvs9Aml8qeAKjzSrk=;
  b=gCDLguL1TCuwSgg/H8u8NYEwk4B9xWAEn7004qrDrUK7JyogUS3MwVsS
   mqK5xsfYgSI4fGytcxzHmD18AdzAxhAemmHDwQEeVapHqWqwfvjKa0CDT
   L29Wnq1RbIDUftJ8+/gKY+9xvv8OsVhVxcnlYO5KqgKcAidW0remAmw5r
   IRU9kaf9CW4x5s1hvuir9F11NoI4PyL2zn5inW3eqfekdzqSbvaEHztEH
   1qsvdWFfIRyY3setM6bII+iAkJKjAxZvNH1gDv05yjM5YmTK7TJ0foxf/
   RBk8o4Vp/ba6QUbK75qFnTL2/vvhUJ3WlinmfZNqXat2G/vsFLkp3mfkI
   w==;
X-CSE-ConnectionGUID: yRVcFOaGQJiL0+RU6ZlVOQ==
X-CSE-MsgGUID: HLsOwgCLSNiEjwX4ylstWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88317717"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="88317717"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 20:04:15 -0700
X-CSE-ConnectionGUID: ysXVb46BSlO5C2HosiifEA==
X-CSE-MsgGUID: 6m+Ta2kNQxGdnGUPrK4vEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="263704390"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 20:04:13 -0700
Date: Wed, 26 Aug 2026 11:04:10 +0800
From: kernel test robot <yi1.lai@intel.com>
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	yi1.lai@intel.com
Subject: [reinette:resctrl/controls_rfc_v2.4] [arm,x86,fs/resctrl]
 54b36bf955:  stress-ng.sigrt.ops_per_sec 8.0% improvement
Message-ID: <202608261025.2521cb61-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit


Hello,

kernel test robot noticed a 8.0% improvement of stress-ng.sigrt.ops_per_sec on:


commit: 54b36bf9552c154f009f53ea023557239a1a3a03 ("arm,x86,fs/resctrl: Transition resource control to a list") https://git.kernel.org/cgit/linux/kernel/git/reinette/linux.git resctrl/controls_rfc_v2.4

testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory
parameters:

  nr_threads: 100%
  testtime: 60s
  test: sigrt
  cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+---------------------------------------------------------------------------------------------+
| testcase: change | stress-ng: stress-ng.sigpipe.ops_per_sec 8.2% improvement                                   |
| test machine     | 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory |
| test parameters  | cpufreq_governor=performance                                                                |
|                  | nr_threads=100%                                                                             |
|                  | test=sigpipe                                                                                |
|                  | testtime=60s                                                                                |
+------------------+---------------------------------------------------------------------------------------------+
| testcase: change | stress-ng: stress-ng.sigsegv.ops_per_sec 9.5% improvement                                   |
| test machine     | 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory |
| test parameters  | cpufreq_governor=performance                                                                |
|                  | nr_threads=100%                                                                             |
|                  | test=sigsegv                                                                                |
|                  | testtime=60s                                                                                |
+------------------+---------------------------------------------------------------------------------------------+




Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260826/202608261025.2521cb61-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-spr-r02/sigrt/stress-ng/60s

commit: 
  fc4002bbbd ("x86/resctrl: Include control with information controlling hardware change")
  54b36bf955 ("arm,x86,fs/resctrl: Transition resource control to a list")

fc4002bbbd84b7af 54b36bf9552c154f009f53ea023
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    379326            -6.4%     355026        stress-ng.sigrt.nanosecs_between_sigqueue_and_sigwaitinfo_completion
 2.145e+08            +8.2%  2.322e+08        stress-ng.sigrt.ops
   3633830            +8.0%    3924146        stress-ng.sigrt.ops_per_sec
  54373528            +6.7%   58013987        stress-ng.time.involuntary_context_switches
     12263            -1.6%      12067        stress-ng.time.system_time
 1.903e+08            +6.5%  2.026e+08        stress-ng.time.voluntary_context_switches
    947802 ±  9%     -20.5%     753882 ±  8%  sched_debug.cpu.max_idle_balance_cost.max
    551284            +6.5%     587345        sched_debug.cpu.nr_switches.avg
    124204 ±  7%     -20.7%      98485 ±  4%  sched_debug.cpu.nr_switches.stddev


***************************************************************************************************
lkp-spr-r02: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-spr-r02/sigpipe/stress-ng/60s

commit: 
  fc4002bbbd ("x86/resctrl: Include control with information controlling hardware change")
  54b36bf955 ("arm,x86,fs/resctrl: Transition resource control to a list")

fc4002bbbd84b7af 54b36bf9552c154f009f53ea023 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 3.893e+08            +8.2%  4.212e+08        stress-ng.sigpipe.ops
   6505085            +8.2%    7037077        stress-ng.sigpipe.ops_per_sec
     13180            -1.6%      12968        stress-ng.time.system_time
     98.54          +221.2%     316.52 ± 12%  stress-ng.time.user_time
  12288000 ±  6%     -18.6%   10006869 ± 18%  meminfo.DirectMap2M
     22002 ±  8%     -35.3%      14236 ± 38%  numa-vmstat.node0.nr_slab_reclaimable
    270.33 ±  8%     -12.8%     235.67 ±  3%  perf-c2c.HITM.remote
     88017 ±  8%     -35.3%      56943 ± 38%  numa-meminfo.node0.KReclaimable
   5614606 ±  4%     -45.2%    3078560 ± 59%  numa-meminfo.node0.MemUsed
     88017 ±  8%     -35.3%      56943 ± 38%  numa-meminfo.node0.SReclaimable



***************************************************************************************************
lkp-spr-r02: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-spr-r02/sigsegv/stress-ng/60s

commit: 
  fc4002bbbd ("x86/resctrl: Include control with information controlling hardware change")
  54b36bf955 ("arm,x86,fs/resctrl: Transition resource control to a list")

fc4002bbbd84b7af 54b36bf9552c154f009f53ea023 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 3.954e+08            +9.5%  4.331e+08        stress-ng.sigsegv.ops
   6607818            +9.5%    7237406        stress-ng.sigsegv.ops_per_sec
     13048            -1.8%      12811        stress-ng.time.system_time
    221.98          +108.4%     462.53 ±  5%  stress-ng.time.user_time
      2256 ± 15%     +24.2%       2803 ± 14%  cpuidle.POLL.usage
    221.33 ± 14%     -16.6%     184.50 ± 10%  perf-c2c.DRAM.remote
    206.83 ± 13%     -18.9%     167.83 ±  4%  perf-c2c.HITM.remote





Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

