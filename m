Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795394881;
	b=d9bJrKudghlNrLHeiHgVWLRQt/D8wOJ6bvXD3rJkZeABZ+NwVN8IwBBFw8+BEVoaKv13
	 dpJaqqZAJA+fD/lXXae3gSGB0Zk8y6PazOj/zWJ4jG/TT/KPgo1CW5o9SLzqo3rifr8jW
	 h93PkHfgHXmu57qpT1Kz7OaUSPBmfYOnkLkkQsOIQusqRMjUdjmWD3OZl2xhAcBWCCBS0
	 SPy0vtj1QDrh66Rs723fsykjyS6Bh+KJ897yVRa9qumoLPP+uph9eSisnvNUYxmjEppMl
	 diAmmCqqwPT8lRXiA93Hf/DLYsRXUqR7aoWd6XuTvOA4YEbOjoDIn/az/kT8wKQD2Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795394881;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=Y4JNk4pyGWX3Uo4YVET7QG0RhmS/mzdDPtPPHLN7jk8=;
	b=uM6g+X96zXfuE5IsKmmER8iJ0hSn+z8xOOaJl67qvZt4MiH+/l3t01sfqpvTmnl1D4Ha
	 Ytv8ZeTeiUxJXUI4bMWv+86RHk8s8lJsDWGZODEqtsLUXbd0sLY99YvzdhGcgcQ8aTn75
	 d8BJ3eKG5k0E609+jIN7FPQBLgg9vrMBryIFIZ3SpjYh3Gsj96tMp7LfUXQAbQUepZcRm
	 STddt9R9xrYfdBa0OAOeWTMyipuXrFqUHWXdjmMfc96j+8yeJprv8CdtLSjbP6Zhxd4zl
	 XqUGozeG1kfjAbxoAOWmoFJUw1YuX+/uIvCzBgDChD5/vXkLVhYcWi3OtPxt81c1aOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Je4oWkDI;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306BE606A327
	for <oe-lkp@lists.linux.dev>; Mon, 23 Nov 2026 00:48:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 306BE606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Je4oWkDI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795394881; x=1826930881;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/g9XQgD9XDbUImkIdSXx2Kdcg/aWZwqLCbyJbNrk2TI=;
  b=Je4oWkDIPB5aRbDnrxEgrGvhWsA6wJnRQitUPfT6HZwJxAUpYOKJ4XO+
   CQXOD2doa854zNdXwMZsn1kr819zCbFofE9oPgJoBi1WAG3wCZ3Krf6Eq
   cDLAIuLPxixfIERiil0S3nbYr8iU/kqa2CiBOl2vILPY0xOfdzNgovgP2
   Y/CB1wst9q+4rdFwg8gqrOhjrh+LL9xTr3SxTkDsd2ktqNL86gq7fJyxO
   daQGp9pSIIsgftgFvZ0LsnhIghxPs8kW39bn0DoUO9rF7W9Y4EeuOX0hq
   TrxHy8zNWjGKOcn0zdPjhTgZXi1IvwACina3pwLoutUMycDjQ4hUkH7u4
   w==;
X-CSE-ConnectionGUID: aqdz3ApPSA2ZkRHshxlzfw==
X-CSE-MsgGUID: cyBwnwonRByT3iAZ1e2b6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4226445"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4226445"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 16:48:00 -0800
X-CSE-ConnectionGUID: /q4kNaRZSwidLgrsg1wxRA==
X-CSE-MsgGUID: 1jq7hFN2TSi9btq6VEVf9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11503356"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 16:47:58 -0800
Date: Mon, 23 Nov 2026 08:47:54 +0800
From: kernel test robot <yi1.lai@intel.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	aubrey.li@linux.intel.com, yu.c.chen@intel.com, yi1.lai@intel.com
Subject: [linus:master] [sched/fair]  486c3d06b9:
 stress-ng.switch.ops_per_sec 33.3% regression
Message-ID: <202611230853.e2e6401-lkp@intel.com>
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

kernel test robot noticed a 33.3% regression of stress-ng.switch.ops_per_sec on:


commit: 486c3d06b90240860e99686d29ed9f15637dc314 ("sched/fair: Avoid transient double accounting for delayed tasks") https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory
parameters:

  nr_threads: 100%
  testtime: 60s
  test: switch
  method: pipe
  cpufreq_governor: performance


If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yi1.lai@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202611230853.e2e6401-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20261123/202611230853.e2e6401-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/method/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/pipe/100%/debian-13-x86_64-20250902.cgz/lkp-spr-r02/switch/stress-ng/60s

commit: 
  75545668ae ("sched/fair: Make cfs_rq::idle the sum of ancestor tg::idle")
  486c3d06b9 ("sched/fair: Avoid transient double accounting for delayed tasks")

75545668ae0fd80c 486c3d06b90240860e99686d29e
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      4113           +49.9%       6165        stress-ng.switch.nanosecs_per_context_switch_pipe_method
 3.265e+09           -33.3%  2.178e+09        stress-ng.switch.ops
  54451715           -33.3%   36327730        stress-ng.switch.ops_per_sec
  77740057 ±  6%     +63.2%  1.269e+08 ±  6%  stress-ng.time.involuntary_context_switches
     37428            -4.5%      35727 ±  2%  stress-ng.time.minor_page_faults
     21920           -16.1%      18382        stress-ng.time.percent_of_cpu_this_job_got
     12118           -16.1%      10162        stress-ng.time.system_time
      1052           -16.2%     881.56        stress-ng.time.user_time
 6.431e+09           -40.8%   3.81e+09        stress-ng.time.voluntary_context_switches


Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


