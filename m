Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793929991;
	b=TLVrED+uBLXRYcUOvSpqw/mTRVQtY3jtp4bmYGvuqgzmACOCMMA09l8sdEUt/+sr6rCl
	 3NyTfkuyA8R4NVvjjsiUtuAIrNPwxM7NNMUPtUpfg1COs1JTPbKc6V3LIlGWxjbGpshUt
	 6c//yPYrd1vGTREph8SZIjX4WJ6p4fWJSIH2mDreZ2q9/gpSMVm5RsYzCUfPRcrjAUBes
	 jRhGFMGOYksBTL5u/9Prz0ntaEWRiYOXOHoa6MC95BGdyytsrVmymFBnL5BE7wmzbUrv9
	 wjzvgysODUd0hc/OkEap727Y+WmltiErlO0IYldXXkZCCkmuKTed4BJ4fh9WYJrKqQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793929991;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=vphnmM+jwIoRrlB8iEsjeGpfpXI0diKX+EPHgC7tAik=;
	b=S1kc0K7qE+M3/wD6YKsaTxXf2PMomdOrKQsx6NJ3H9k0hqLd7dkKNzqXldFkDIn0unaD
	 j2LGSQgaLWV6NWuvcDIBQJ93Xhtf2ZJjEiZTi3NWSSO4tFMMtpmID44RoXEs/57kuB5O8
	 stKYr6ohvCE/Rad6A+3h5voBdxs0bBrKEvF1U4v2wL/7+G6jsi8ozryTL+Lc36pHDGk0M
	 JqDphPdxV6UKOXhy8lF+Bllsk72vfgPMxnPaiqpdOb/GIY9jKYv8/fHQO6mLGGIN0ICnj
	 ePqygh4n0QF6GjdTZ5FVTdwdT5Chutt3kT8XqzuqKfzdePnB5EUhr6iwmd12E3EHdkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FQCSelky;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66D5606A31B
	for <oe-lkp@lists.linux.dev>; Fri,  6 Nov 2026 01:53:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A66D5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FQCSelky
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793929991; x=1825465991;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Tz7i/BkGK7Upp9+h2GI/VokWmLavMPvpV1aNQOLIW8M=;
  b=FQCSelkysRZFzxsrVq2c27K3uO2gbIKn6yGouj4/qGyPjEYDAwRf/Y38
   BBSj32amEgBQeuzmE5Igm03Za1F5JuNsEr1j1T4TUtqbMiHLOCZ8tlm+D
   2Pe3oYvuhu9w1oz9z7igtcd2wC7YfLZfem41IwG/F7Fd6z20+p79wKNtn
   4LIw7g7BQVYCXwRSCvzNjYacs4NXAr0tE66Q7Dp0x+z4/u24e3d1K7HUJ
   j8tpHygtwC3hpSpe2O02GwkCCcm9QK6JCcEjfCTV7P+xweh8uhF6SPbJc
   tlofUr7Nf7eaLJQ169ahC30nqsqBzc53B1+zX+gklRxBkUMktjzW5GH8q
   Q==;
X-CSE-ConnectionGUID: 2tEsbj+DQEmPu/hS/jU6CQ==
X-CSE-MsgGUID: YDpzTb+OTMi5l9XQtEi1uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2634026"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2634026"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 17:53:10 -0800
X-CSE-ConnectionGUID: TzwXlRPATqqMRLBfipF6OQ==
X-CSE-MsgGUID: 85+2EOpoR0Gshj6zqJkAhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7277393"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 17:53:09 -0800
Date: Fri, 6 Nov 2026 09:53:05 +0800
From: kernel test robot <yi1.lai@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	aubrey.li@linux.intel.com, yu.c.chen@intel.com, yi1.lai@intel.com
Subject: [linus:master] [sched/fair]  fb1050ac8e: stress-ng.sleep.ops_per_sec
 29.9% regression
Message-ID: <202611060925.fb5500b1-lkp@intel.com>
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Post: <mailto:oe-lkp@lists.linux.dev>
List-Help: <mailto:oe-lkp+help@lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-lkp+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit



Hello,

kernel test robot noticed a 29.9% regression of stress-ng.sleep.ops_per_sec on:


commit: fb1050ac8e40aaa014291b5b53612d27890c2b09 ("sched/fair: Change the default cgroup_mode to concur")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory
parameters:

  nr_threads: 100%
  testtime: 60s
  test: sleep
  cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+---------------------------------------------------------------------------------------------+
| testcase: change | netperf: netperf.Throughput_Mbps -15.9% regression                                          |
| test machine     | 192 threads 2 sockets Intel(R) Xeon(R) 6740E  CPU @ 2.4GHz (Sierra Forest) with 256G memory |
| test parameters  | cluster=cs-localhost                                                                        |
|                  | cpufreq_governor=performance                                                                |
|                  | ip=ipv4                                                                                     |
|                  | nr_threads=200%                                                                             |
|                  | runtime=300s                                                                                |
|                  | test=TCP_STREAM                                                                             |
+------------------+---------------------------------------------------------------------------------------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yi1.lai@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202611060925.fb5500b1-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20261106/202611060925.fb5500b1-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-spr-r02/sleep/stress-ng/60s

commit: 
  507f910a4e ("sched/fair: Add cgroup_mode: tasks")
  fb1050ac8e ("sched/fair: Change the default cgroup_mode to concur")

507f910a4e1f140a fb1050ac8e40aaa014291b5b536 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
  96108453           -29.9%   67358809        stress-ng.sleep.ops
   1599640           -29.9%    1120640        stress-ng.sleep.ops_per_sec
  46082447           -29.1%   32658369 ±  2%  stress-ng.time.involuntary_context_switches
     15699           -11.3%      13918        stress-ng.time.percent_of_cpu_this_job_got
      6459            -4.7%       6156        stress-ng.time.system_time
      3034           -25.5%       2262        stress-ng.time.user_time
  2.16e+09           -30.6%    1.5e+09        stress-ng.time.voluntary_context_switches


***************************************************************************************************
lkp-srf-2sp3: 192 threads 2 sockets Intel(R) Xeon(R) 6740E  CPU @ 2.4GHz (Sierra Forest) with 256G memory
=========================================================================================
cluster/compiler/cpufreq_governor/ip/kconfig/nr_threads/rootfs/runtime/tbox_group/test/testcase:
  cs-localhost/gcc-14/performance/ipv4/x86_64-rhel-9.4/200%/debian-13-x86_64-20250902.cgz/300s/lkp-srf-2sp3/TCP_STREAM/netperf

commit: 
  507f910a4e ("sched/fair: Add cgroup_mode: tasks")
  fb1050ac8e ("sched/fair: Change the default cgroup_mode to concur")

507f910a4e1f140a fb1050ac8e40aaa014291b5b536 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      3415           -15.9%       2871        netperf.ThroughputBoth_Mbps
   1311602           -15.9%    1102665        netperf.ThroughputBoth_total_Mbps
      3415           -15.9%       2871        netperf.Throughput_Mbps
   1311602           -15.9%    1102665        netperf.Throughput_total_Mbps
 3.906e+08 ±  2%     -63.2%  1.439e+08 ±  2%  netperf.time.involuntary_context_switches
    184303            -3.2%     178397        netperf.time.minor_page_faults
     11296            +1.6%      11478        netperf.time.percent_of_cpu_this_job_got
     33938            +2.0%      34626        netperf.time.system_time
    444.02 ±  2%     -27.5%     321.87 ±  2%  netperf.time.user_time
    425106 ± 27%     -48.3%     219585 ± 12%  netperf.time.voluntary_context_switches
 3.002e+09           -15.9%  2.524e+09        netperf.workload


Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


