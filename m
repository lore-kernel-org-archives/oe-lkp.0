Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792756166;
	b=iqT0hvI+EZz3X/LjI6yr2fP20xHXxhMq49YEIa4jpXL/EWSz4N7irCxL2O2BRBLdeVlN
	 7pHN2HDyV9I09GOQEOH5vPh8ke/JxNo4hbsn4fR5+ezLQQOntHbbFO/1ot9owzOPjjxfh
	 3Ovc7IcsBUvWvkh3Tl1MhVm6x4oCDnlU3xwUmomvV8S17adjXv1gOz5Ibtyfned++ik9/
	 RBvtptaCa8xtGFFEPUUQ5tyou0w6dvbDakTztomKM4J+KuvQrGHOcIr9WWBpn7iiDM3yW
	 qJBfz5rDsG0dpC1WkQXNuBSKVySPUVhmLYLdacZ6vEUx/o8URn8K3DvT1a1Xx4rmqcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792756166;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=4FXxAPyga0Qid57YSpQStCI3yzDXnZmmINLsMa0I9tc=;
	b=xurEAHMX6W1axPNKd0Hj9rWRvm3VD87+NoaTIGOw+Dlut1x0Z076P7flV0GtiCVVUOva
	 Gj1HFjt33es+rtUJvEmhizJrhPnZzFsght5+OwVlF7ZhqxX9sGvxkuvDKGUC8dtz14fQ2
	 jW1XZR79uBcxDvn5J2ngPWTyebkGPa6QE1irfe7Al+nUNApwA5ooN6daSG/x9dxQv8CE4
	 sTy6yFpzxkbqhgoruIFFtl5WY/K64qHZxCMxcNBKRLrcpN3j4BC278zJZ8IVVqdQiKqff
	 ztb+6rDOxXgSMUtkkG1eWbOp5fc+/hp5EVt/P3/Ks7t5Y6qRYjPzoLsRuJpC9Xu1XFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g484suGu;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC524606A320
	for <oe-lkp@lists.linux.dev>; Fri, 23 Oct 2026 11:49:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC524606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g484suGu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792756166; x=1824292166;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=j2USRrb14ok/s5Bk8OxyKQsZsVoUpAPYYS9ZORWFFZA=;
  b=g484suGuXrdB6840D0ZjUVkPg77Sin1XXnlEEzaBmYapYB2n3Ggv5J+5
   SM4QfxaNrCX85ECLrAWLXnApC+a4GBm5IAHbKceNEId2vwyaeqVUuddSM
   YMiuHXOqeD/Z+FIMGMv07jf+D+hczk70cU29R1wgdJa2sFQaNkb8IWZ+V
   rKkD80DnuHhRD3iU/UkN+WSdYUQYZrY0MciuLRkQ3EgTwg6rE11Wey7eO
   pQh8N37aGLElDMiHDnQGGIE/+4Jihb9Gl9zuJz6843n7hzMMdlsU2iKtu
   ez6dNGTxOhmN9GqWo9XjiXBAsnYZJYswj/a4DgoLnQAA7/N8U/8MrgOuq
   A==;
X-CSE-ConnectionGUID: WjXOowunQLyT87ea+TlxxA==
X-CSE-MsgGUID: cV6xplt5RYmP0MUbpYSduA==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1418421"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1418421"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 04:49:26 -0700
X-CSE-ConnectionGUID: ZF3gUmqYQn6tqpF8QEKW+Q==
X-CSE-MsgGUID: nPNtmfM5TRGLfUGToMgkiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3501518"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 04:49:22 -0700
Date: Fri, 23 Oct 2026 19:49:20 +0800
From: kernel test robot <yi1.lai@intel.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Phil Auld <pauld@redhat.com>, aubrey.li@linux.intel.com,
	yu.c.chen@intel.com, yi1.lai@intel.com
Subject: [linus:master] [sched/core]  118a2cf4ce:
 stress-ng.schedpolicy.ops_per_sec 14.1% regression
Message-ID: <202610231954.51716452-lkp@intel.com>
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

kernel test robot noticed a 14.1% regression of stress-ng.schedpolicy.ops_per_sec on:


commit: 118a2cf4ced60777a2408001e2b4838fed1cea55 ("sched/core: Call wakeup_preempt() for queued tasks during class change") https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: schedpolicy
	cpufreq_governor: performance


If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yi1.lai@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202610231954.51716452-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20261023/202610231954.51716452-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-spr-r02/schedpolicy/stress-ng/60s

commit: 
  v7.3-rc7
  118a2cf4ce ("sched/core: Call wakeup_preempt() for queued tasks during class change")

        v7.3-rc7 118a2cf4ced60777a2408001e2b
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    246.24           -14.1%     211.56        stress-ng.schedpolicy.SCHED_BATCH_schedules_per_sec
    246.24           -14.1%     211.56        stress-ng.schedpolicy.SCHED_DEADLINE_schedules_per_sec
    246.24           -14.1%     211.55        stress-ng.schedpolicy.SCHED_FIFO_schedules_per_sec
    246.23           -14.1%     211.55        stress-ng.schedpolicy.SCHED_OTHER_schedules_per_sec
    246.24           -14.1%     211.56        stress-ng.schedpolicy.SCHED_RR_schedules_per_sec
  16540375           -14.1%   14210394        stress-ng.schedpolicy.ops
    275785           -14.1%     236940        stress-ng.schedpolicy.ops_per_sec
     85768 ±  3%    +734.4%     715671 ±  2%  stress-ng.time.involuntary_context_switches
     32443 ±  2%     +13.9%      36955 ±  2%  stress-ng.time.minor_page_faults
     21807           -10.3%      19559        stress-ng.time.percent_of_cpu_this_job_got
     13087           -10.3%      11737        stress-ng.time.system_time
     78783 ±  2%    +634.5%     578684        stress-ng.time.voluntary_context_switches


Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


