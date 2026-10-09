Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EC439DBD0
	for <oe-lkp@lists.linux.dev>; Fri,  9 Oct 2026 03:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791516690; cv=none; b=iEZNWvQISp6w4iruIU2q9VkmLYAnU9y09IvBMEJZXyl65PQnacbSnjQ/nl4aoFeGPYwL5FsTYLcRn2ZUajVx779VuFmdoHLPELPRx8EuhKEzXCHOfsFYsNgaEfxLMQfLoCwTNU75OXAsXlt/iiKkulKNQrHTZBa0SH56K2ZtUNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791516690; c=relaxed/simple;
	bh=bLCjJ2qDKu+48tLpSPvLn/9TDbJUSjqorra8kXtkbTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K1oMbgXrbQ1Ip+VDtNvZgzNUEsOoh1lQSFQl2GAjZAyHzR9GLE6OiGTj8Zbsvu34fN/Qik+yDkcqaSSoR8MWO7LBywxkIKYKl9aZMGgLIaq8v3McE7XTHvj0zMC/R9F4oqukLHVkU8cAO6sar3lXoWOG3taWe8DMZQqtUXBFnC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ml79/aVK; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ml79/aVK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791516678; x=1823052678;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bLCjJ2qDKu+48tLpSPvLn/9TDbJUSjqorra8kXtkbTQ=;
  b=ml79/aVKfO0q7Hr50Z1Wc1uFLhb2E8Z2SDvKB3Jv/NXeZIigJgtyOLlp
   rnMVs26ScvJ0oUh8uIdPvSdq2et2TNdhkXhogXQ1h33ufXOwUHpUM1+0V
   nz2VDHivV68isGRlQzDqiyzTBMvKmWi8JP4Whct3QDK36pNCsPPpbB2sf
   S0T6Dum00HLCSNBApaPlkfSJNTDKrtUlRlA8E4/Un634Y4Pe5kRzkIAQh
   6fETpfghkuHA4pRG2am9iST4PQa9rooDsD+E4OJ9S7UB0M8QpH9pdXlAM
   00kVF6jYD4/6XJDdrf2ayaFYBNhW35p9S5P25tyIAtREY6fkk2znAabl6
   Q==;
X-CSE-ConnectionGUID: YytcvH2WTCOoKttf2zfSCA==
X-CSE-MsgGUID: xidk5UnbSC2RqEYuA+qHcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="215492"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="215492"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 20:30:39 -0700
X-CSE-ConnectionGUID: gKEfUMn3QGSKSWQrk9hvsw==
X-CSE-MsgGUID: v4Hf0qCsQx+mHt6yBcX4VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="654599"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 20:30:36 -0700
Date: Fri, 9 Oct 2026 11:30:33 +0800
From: kernel test robot <yi1.lai@intel.com>
To: Tim Chen <tim.c.chen@linux.intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>, Hyunwoo Kim <imv4bel@gmail.com>,
	Zenghui Yu <zenghui.yu@linux.dev>, Chen Yu <yu.c.chen@intel.com>,
	Peter Zijlstra <peterz@infradead.org>, linux-mm@kvack.org,
	aubrey.li@linux.intel.com, yi1.lai@intel.com
Subject: [linus:master] [sched/cache]  28f9c0e0a0:
 stress-ng.fd-race.ops_per_sec 5.2% improvement
Message-ID: <202610091149.c00cf9f2-lkp@intel.com>
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

kernel test robot noticed a 5.2% improvement of stress-ng.fd-race.ops_per_sec on:

commit: 28f9c0e0a0b94c5d3e1b634db545f6e1f94858c5 ("sched/cache: Decouple sched_cache_group from mm to fix UAF") https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 256 threads 2 sockets GENUINE INTEL(R) XEON(R) (Sierra Forest) with 128G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: fd-race
	cpufreq_governor: performance

Details are as below:
-------------------------------------------------------------------------------------------------->

The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20261009/202610091149.c00cf9f2-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-srf-2sp1/fd-race/stress-ng/60s

commit: 
  d6013e2465 ("sched/cache: Honor migrate_llc_task semantics in active load balance, to fix LLC mis-scheduling bug")
  28f9c0e0a0 ("sched/cache: Decouple sched_cache_group from mm to fix UAF")

d6013e2465d98d52 28f9c0e0a0b94c5d3e1b634db54
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
  28370042            +5.2%   29834431        stress-ng.fd-race.ops
    473267            +5.2%     497702        stress-ng.fd-race.ops_per_sec
    843367           +27.1%    1072325        stress-ng.time.voluntary_context_switches
     62132            +7.1%      66565 ±  4%  meminfo.PageTables
  48712422 ±  4%      +8.4%   52824690 ±  2%  cpuidle.C1E.time
  62293414 ±  2%      +9.0%   67917882 ±  3%  cpuidle.C6S.time
     68069 ±  2%      +9.6%      74599 ±  3%  cpuidle.C6S.usage


Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


