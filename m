Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795610319;
	b=4piSUGopDnhWKdRQOdDgkzzWMCb4l824ZbTd3z4ZdjtgE17n+q/ns3ZVJt0R8ltm3spw
	 ev+WDBSJ/3EqjepZ/IVes/bIedNajm0+3xchJJuaODd+fuhiEoGmNxJLCJyTr8VE66mLe
	 ctB2pBgdZLebsu0O/Hgfw0Gj3cv9qixxqpRnrO8ZAMLjQLaMSR+joTYaaXN9fecqlmxJi
	 suT2aodaY55CwyI+xTozd5rDzVrGLRNGA/e1gTTKlTQ7kGhpvoVsG/UPDnf9hjroMZx0/
	 zTiFnwMEol2T8i5hq/x8kGibfShOZSaWUk4GhkakiULeGgONp0YWvK7o4+Yxy5A9/Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795610319;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=5rYEuvZZ77IlWHkYx5SxTEKMKBDUlCedKaOfJB7rcTo=;
	b=qrTjzmFDuuQDaDB3qN3XuM341Ni6zIJWQBcMAjmL4rtgt2kxHgCwIwPidRTv09Z5b6h3
	 M4GXSDi+jbla2OF2ynUiLpoF+59vEYDsXr3BocoIHMJRWZ7+UVJiKZKs/y6NOs3B6hQLw
	 5DED2YNuiyTk3ikCKq8RUQi5uPRr/LUAm9xOCAH9hfG9rOKTwAyLER0URLyC1KNLepOXL
	 4yxcflaTDMxtYoKN2jcD0ou8JZPMOk2aNx/tWNmfn+vxancQwVgSg73IB3r1blW3oFW9M
	 YhMLOWw0WwS6olrqmLN+8urkr1d6YMvgTiNOtqe5gxvNEv1IbSQm7tOMILW9Jarv38Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="Ux/reBuW";
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3540606A323
	for <oe-lkp@lists.linux.dev>; Wed, 25 Nov 2026 12:38:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3540606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ux/reBuW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795610319; x=1827146319;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e1CwTKpV5jzb3GMgVJVkoMjfFJRZt/FG9SClyCIQZSY=;
  b=Ux/reBuWr4+/eswSPokxJd55zCxTJCED+C0bipk9McVv89K0KWVp5W2m
   tx39O2GBocHElBehfmskJlOU9Y5nO0+tcKJihXrCeimnm5/yARhzRqlhj
   SjdqeUIKL6TYKpMcXf8TW0Ur+9TpNlfqwwGZbZgpF4/CzspxjkcghaAZd
   h5KB5lmo2eReAQMTZlmQ2J17O9M1T58uftGg/wsFgz6tRHlttFItTtDo3
   8BhK9Ebw+P8/2uS730BbA0tQ2SGrlXp7q8t2WeEEwkr3OOYkul3KeoezF
   7yoRPKSUd1VYdkEndTIVOScMMV21yf04/7pGlEZutEt42PelsLygVoqvM
   g==;
X-CSE-ConnectionGUID: XjO1meS0QQW30Eo4+icFUg==
X-CSE-MsgGUID: QGcHXdxlQn+qTQOisTw2Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4484097"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4484097"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 04:38:38 -0800
X-CSE-ConnectionGUID: hpUHan/rS3CotdBEZObKgA==
X-CSE-MsgGUID: jAB78FQlTCK61yiv8kGF/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="11746962"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 04:38:37 -0800
Date: Wed, 25 Nov 2026 20:38:34 +0800
From: kernel test robot <yi1.lai@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, yi1.lai@intel.com
Subject: [anolis-intel-cloud:devel-5.10] [net]  8d01c2f5e0:
 netperf.Throughput_tps 35.2% regression
Message-ID: <202611251044.88ddc425-lkp@intel.com>
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Post: <mailto:oe-lkp@lists.linux.dev>
List-Help: <mailto:oe-lkp+help@lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-lkp+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

kernel test robot noticed a 35.2% regression of netperf.Throughput_tps on:


commit: 8d01c2f5e06712df9a82ea2bf4dfec6c78df9336 ("net: don't let netpoll invoke NAPI if in xmit context")
https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10

testcase: netperf
config: x86_64-anolis-intel-cloud-devel-5.10
compiler: gcc-14
test machine: 256 threads 2 sockets Intel(R) Xeon(R) 6768P  CPU @ 2.4GHz (Granite Rapids) with 64G memory
parameters:

	ip: ipv4
	runtime: 300s
	nr_threads: 50%
	cluster: cs-localhost
	test: TCP_RR
	cpufreq_governor: performance


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yi1.lai@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202611251044.88ddc425-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20261125/202611251044.88ddc425-lkp@intel.com

=========================================================================================
cluster/compiler/cpufreq_governor/ip/kconfig/nr_threads/rootfs/runtime/tbox_group/test/testcase:
  cs-localhost/gcc-14/performance/ipv4/x86_64-anolis-intel-cloud-devel-5.10/50%/debian-13-x86_64-20250902.cgz/300s/lkp-gnr-2sp4/TCP_RR/netperf

commit: 
  20f35fbf5d ("icmp: guard against too small mtu")
  8d01c2f5e0 ("net: don't let netpoll invoke NAPI if in xmit context")

20f35fbf5d9f5182 8d01c2f5e06712df9a82ea2bf4d 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
   5405798           -35.2%    3504422        netperf.ThroughputBoth_total_tps
     42232           -35.2%      27378        netperf.ThroughputBoth_tps
   5405798           -35.2%    3504422        netperf.Throughput_total_tps
     42232           -35.2%      27378        netperf.Throughput_tps
     30856           -14.0%      26524        netperf.time.involuntary_context_switches
     65795            -4.1%      63098        netperf.time.minor_page_faults
      3725            -4.6%       3552        netperf.time.percent_of_cpu_this_job_got
     10934            -5.7%      10311        netperf.time.system_time
    289.90           +34.8%     390.65        netperf.time.user_time
  1.62e+09           -35.1%  1.051e+09        netperf.time.voluntary_context_switches
 1.622e+09           -35.2%  1.051e+09        netperf.workload


Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



