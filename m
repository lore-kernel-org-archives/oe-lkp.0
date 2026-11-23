Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795395858;
	b=vWACnv3Nxy7j+azW5L0B02oa+K+kuqKL/3ZPPws1qpCXVDp7MISkKtQ8Vveg9qgPADv2
	 hVavW5re86JAoT6IB6XU1XyZkp0F2YyuXSACY4uTEiYGZas4mY7MZcgG709Ev8YQy8/rz
	 S2Heg1wSAcoR1WqkhekuD3JR9ZLfVYxTgDoSr6/YUGomTmA+ytwEC2tUQpO8ySndAmNo0
	 LL9HOyjqnzCVktjAKmaMQiHDsTAbZgauK6Zoo+7foF1JfGd2cnglGcBkSXa4Zy64/ud7E
	 afG8yfMtsWgYPnSYuFXYapYdCB0TqHNKYXSsWNFUV+46cjWaFanSl8pzI1mzRWeSE5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795395858;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=01mfUFiaELPhPW/3IZ1mN4LD1SkpzM31ep1fFXj6p2w=;
	b=3w+xElfAEhVGqfNMd86jLzfLJkmGRtHSUlCrYey2gnH6EDdKd47oc2amctx+AtyL0xsj
	 xpsQGr29Ed++bP/O/ccuDlfW49kEZbPj7ExaUwyXu5Q1zCC9145seRqL2aY+HvaoDoWST
	 b8tM9n+yYG6LAgoNVPGqLvamw15q6XJHh5gCsfOFYRhH6jErUUuEGrcWFoTSkcIA43pF4
	 Q6z8UbjPMqjD1xv5hOKR5UxBBI/1Ci+K7L2nGIcFCK9BoVGdwrynLkd2uptBy7Y3oOnVu
	 tfH1Q2hs/PDFfPEnVoJ8zYnXKuin19nTci2znEvLgapXMhm+QEZ6CZVBfSAAPh86nSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GrGiBYZ8;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0C9606A31D
	for <oe-lkp@lists.linux.dev>; Mon, 23 Nov 2026 01:04:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E0C9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GrGiBYZ8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795395857; x=1826931857;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding:in-reply-to;
  bh=ACPRPFFAKAOS7IG43Q8ZsHzY8LGNqr69mSYmTMWnKOw=;
  b=GrGiBYZ8jzORpxmszpIM9RqGSOxy9WhIlKkorA0Tk1FNXLBwp2Md559r
   nVUqOfD9eubdGLT7SR7MLqLExGkPMdk+/4bnhfnJsfqCkrV3crxLw5qkc
   CFXxNc7p6p/L02meWahFxEtv+Y1on7WJj5BjbwBacMMYWBgaqTf8wy7S+
   Dy2gtn7cvVQARWItvt2TzYevzibtHzJWXx7+JRWlASBNEYc/VhZMABfQR
   Z0nd7EkdnkeYcMosX5DVg92QGC3MSfwyUIeExBI/SJZQHfGjjys34Q+Np
   0l5sKwR+XnioFk/BYpNCHYyEFt7qynejXLfS/Uz5X8uxl138eBXrUcX6t
   w==;
X-CSE-ConnectionGUID: 0OH7+shmSX2D8G8n1Lztuw==
X-CSE-MsgGUID: 2nOpRh2PQ/i6KD133/4Y9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4238912"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4238912"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 17:04:16 -0800
X-CSE-ConnectionGUID: VWTlepwkRJaoSRldnS1tzA==
X-CSE-MsgGUID: 9+XvnoobSau9BewdZvjWpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11260207"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 17:04:13 -0800
Date: Mon, 23 Nov 2026 09:04:09 +0800
From: kernel test robot <yi1.lai@intel.com>
To: Srikar Dronamraju <srikar@linux.ibm.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	aubrey.li@linux.intel.com, yu.c.chen@intel.com,
	Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>, Juri Lelli <juri.lelli@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Mel Gorman <mgorman@suse.de>, Steven Rostedt <rostedt@goodmis.org>,
	Valentin Schneider <vschneid@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Srikar Dronamraju <srikar@linux.ibm.com>, yi1.lai@intel.com
Subject: Re: [PATCH] sched/fair: Skip sched-domain traversal when wake affine
 is disabled
Message-ID: <202611230828.f45dac3e-lkp@intel.com>
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
In-Reply-To: <20261109120522.1704752-2-srikar@linux.ibm.com>


Hello,

kernel test robot noticed a 23.8% improvement of autonuma-benchmark.numa02.seconds on:


commit: d9f685e0573ed835e37d8053690c646cff017954 ("[PATCH] sched/fair: Skip sched-domain traversal when wake affine is disabled")
url: https://github.com/intel-lab-lkp/linux/commits/Srikar-Dronamraju/sched-fair-Skip-sched-domain-traversal-when-wake-affine-is-disabled/20261109-173522
base: v7.3
patch link: https://lore.kernel.org/all/20261109120522.1704752-2-srikar@linux.ibm.com/
patch subject: [PATCH] sched/fair: Skip sched-domain traversal when wake affine is disabled

testcase: autonuma-benchmark
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory
parameters:

  iterations: 1x
  test: numa01_THREAD_ALLOC
  cpufreq_governor: performance


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20261123/202611230828.f45dac3e-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/iterations/kconfig/rootfs/tbox_group/test/testcase:
  gcc-14/performance/1x/x86_64-rhel-9.4/debian-13-x86_64-20250902.cgz/lkp-spr-r02/numa01_THREAD_ALLOC/autonuma-benchmark

commit: 
  v7.3
  d9f685e057 ("[PATCH] sched/fair: Skip sched-domain traversal when wake affine is disabled")

            v7.3 d9f685e0573ed835e37d8053690 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      8.24           -23.8%       6.28 ± 17%  autonuma-benchmark.numa02.seconds
   1115596 ±  4%     -17.1%     924791 ±  6%  autonuma-benchmark.time.minor_page_faults
     20753            -1.8%      20388        autonuma-benchmark.time.percent_of_cpu_this_job_got
      1387 ±  7%     -42.8%     794.05 ± 33%  autonuma-benchmark.time.system_time


Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


