Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795072774;
	b=wg/7J5zAcbAi/K6uai51VU5/FP98MQaReT0JIGtd6b4wFUtor/rZPTU5V142K9+ZcoWB
	 DQ9N7nhhDLE0eNKlZo8lMnQYAVxlFgVhPyurOz0D4zG0RLhggVXoMQ/gdj3KJDKfDBx0C
	 W21S7Q32S0tLwThvMdDYWXS72cgoH4YGng5IWBeC05SdQOGdr6QzevN8+KmAeAkhXOypy
	 tEvpC8hORFNPvANpm1XajdD0IRXxjBYu+vYcVkGj10axKF7mtcEd1/tmAbzoMFwz6c+Yb
	 MN12ReFg5l1A1HyMa6WG8q+tOxgCXwyjFGfOXEHModAOK2M72iEmtUZDDu2OQ6APd7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795072774;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=3TrXJMCcs5ep2Db28l8wXC4tW89iq+gAVgMo+jzadEo=;
	b=ThtPRF4I7hg50oK63MW3Ivaea5ibJ+B/Tv2A4Bsa2wBtkDOIQxG008k//4i7GNoQBRyi
	 5poYKZ2oqMYX46PiDGcaMmCEYSfPX/bZmXEObHQOektXyH08DjWGuwZrXQb+3hNeOZnHi
	 qBmfnlRwrGpPAHOe5VQyhZd6fOO8MqMysL2IGiURLLLq4Ajqu2Gj5uCj2UNtkn9XbkuCE
	 yg1zUqecTb1BsRSmf1fmUjjZxCpnwFCeAo1zHKPioh8o36re+qlC0ac8zZ96y2Uurmxn8
	 3EFNc53pjY3ZpI/XTUsCBeIj7YrIcrsz29eFkX0OwSK1ofzcFAwO7W+LhMHzz+3qHYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kPsH6UBG;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A197E606A32F
	for <oe-lkp@lists.linux.dev>; Thu, 19 Nov 2026 07:19:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A197E606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kPsH6UBG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795072773; x=1826608773;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=xVN1HNBHJ6ITR0GYNuQsZJ8LzCI/aRphVbzb4z2FBGs=;
  b=kPsH6UBGEQz1sZ7UKbTfd2CaOQC0DVY7yzCOuBn+gkowi+stu+FWlHcR
   dOtjyYlu2gy0//+a/xWyvUmGzr1qlkRgHU+2u69BlSfxn46z/qpFQ/Ebw
   0oF+S4EmHhYYKuvzbfd3QoQurgg9SwmxxI/xlSfFjLsIie234glcf4GVV
   YozETpxGZQTA7WqZrQ01ZnSrMU6ghzcmkjWrOTr1RyRDwlIZioUNGgqMA
   zG/yKzjmK8u3iWLBimaQpYvphPkh0i3FSpy2Y/Lkq2ajQWs8JENO2a8uL
   prpT7xp/GwR6nl9Bbvx8snGwa5XXQBZ8PqVd+Htm92v32jAEyHpOMwUOc
   w==;
X-CSE-ConnectionGUID: sPc9KTWjRk6BnzV3RtQuvQ==
X-CSE-MsgGUID: S/hgb4ZAQE+PiBIrjUHDtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3830484"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3830484"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 23:18:12 -0800
X-CSE-ConnectionGUID: qCb8xQlbT7SoogZ7ztGYDQ==
X-CSE-MsgGUID: rUxOxDkRQA6e3/RmdaODVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10720768"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 23:17:09 -0800
Date: Thu, 19 Nov 2026 15:17:06 +0800
From: kernel test robot <yi1.lai@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	x86@kernel.org, Ingo Molnar <mingo@kernel.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	aubrey.li@linux.intel.com, yu.c.chen@intel.com, yi1.lai@intel.com
Subject: [tip:sched/core] [sched/fair]  9e3fa63360:
 stress-ng.spawn.ops_per_sec 12.8% regression
Message-ID: <202611191526.fc8f4ad6-lkp@intel.com>
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

kernel test robot noticed a 12.8% regression of stress-ng.spawn.ops_per_sec on:


commit: 9e3fa63360bc9ac17619ff076d38d29f57edeb0e ("sched/fair: Rework/fix task_h_load()") https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git sched/core

testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: spawn
	cpufreq_governor: performance


If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yi1.lai@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202611191526.fc8f4ad6-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20261119/202611191526.fc8f4ad6-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-spr-r02/spawn/stress-ng/60s

commit: 
  e0aeaebb8a ("sched/fair: Extend for_each_sched_entity() with a back-link")
  9e3fa63360 ("sched/fair: Rework/fix task_h_load()")

e0aeaebb8a46c276 9e3fa63360bc9ac17619ff076d3
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
   1067726           -12.8%     930818        stress-ng.spawn.ops
     17811           -12.8%      15528        stress-ng.spawn.ops_per_sec
   1053999 ±  2%     -11.6%     931631        stress-ng.time.involuntary_context_switches
    885751 ±  9%    +109.9%    1859162 ±  2%  stress-ng.time.major_page_faults
 5.971e+08           -12.9%  5.201e+08        stress-ng.time.minor_page_faults
     19469            -1.4%      19196        stress-ng.time.percent_of_cpu_this_job_got
      9503            +1.6%       9652        stress-ng.time.system_time
      2196           -14.2%       1884        stress-ng.time.user_time
  16430012 ±  4%     +24.0%   20370954        stress-ng.time.voluntary_context_switches


Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


