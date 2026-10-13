Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2353F306D2A
	for <oe-lkp@lists.linux.dev>; Tue, 13 Oct 2026 03:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791861597; cv=none; b=Xot53VwQ6Skk2/3Fn96XO1s2whW7Flv9N3gfgbUUgRAztG8XIw7XwFudvxzHlRfnPJHWBhiM96oelWfhG9Ca+YRf3SsaxDAMBxfvRkm3cO6uGSvy/Rm56urVs3MiY6wQaBqwQHN4iziIKFsaVr3lqJJ/8+wrHqnupQ6vTBDW9Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791861597; c=relaxed/simple;
	bh=e/G+/sjP870rWRPl7fW6fScVaR4XUSaNGG10FbSXvXA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bPZ7jKipPdU6frE60sSHLNLKvKQufqqTH8msBB7JjT6t/bgPTyEkfnefqoA5tMBIizRpPUNbL6EHhexwYWR5GgUtwhSScYc8n/FCsTkz0nkPZ6JPdXZkqtJrgkhBbrxUkUY5qc8wE6gyAx0dIoFP+KtiKnEdHEwBtmycwFlhfK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PT2K4Wp7; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PT2K4Wp7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791861595; x=1823397595;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=e/G+/sjP870rWRPl7fW6fScVaR4XUSaNGG10FbSXvXA=;
  b=PT2K4Wp70B8g+shu8rrSeEL9Z6h7/c6UG4g/fC4CGa/M7Gudv25H05u/
   wIVEUzapx9AhyCJgupag629WabFvsBguuwEl1p8TX9Dw+b4Hr5dr6ytyZ
   lFrRjWMD/5/axFXS9Ue6Uvq767J9XOz8MrCh/pU3hFMuQ5bbRqdAzA6K4
   TD5t5fossRcwzSEQ/fKtzk3ctC0/SDBeR9LuV1ncZdsykUaSVT3vKUZJS
   e7PihzT7qxuGQUCkwJx64sqwQvR/R0WeSx1jqUfqLR3CjT1hsNnxx6Wbu
   XgDOP3KDPE4wGGbzlPswkyd0kUmbIT5RStV3LIrfkgi4mN+BDtUSIsf7D
   A==;
X-CSE-ConnectionGUID: +rDgYXqUQ/yqSDieAPngrA==
X-CSE-MsgGUID: p1uadIcjSLW0XKP0EFf8hQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="571469"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="571469"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 20:19:53 -0700
X-CSE-ConnectionGUID: LffCJul+RDKkYWQn3k8nnw==
X-CSE-MsgGUID: 5VQ6d9m8Q/OW+eAdoilZEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="2815493"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 20:19:52 -0700
Date: Tue, 13 Oct 2026 11:19:49 +0800
From: kernel test robot <yi1.lai@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, yi1.lai@intel.com
Subject: [anolis-intel-cloud:devel-5.10] [sched/fair]  e213519c64:
 netperf.Throughput_tps 3.8% regression
Message-ID: <202610091252.d0d6cae8-lkp@intel.com>
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

kernel test robot noticed a 3.8% regression of netperf.Throughput_tps on:

commit: e213519c64ec899502f211079bb2a4603cb8ab53 ("sched/fair: Avoid a second scan of target in select_idle_cpu") https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10

testcase: netperf
config: x86_64-anolis-intel-cloud-devel-5.10
compiler: gcc-14
test machine: 256 threads 2 sockets Intel(R) Xeon(R) 6768P  CPU @ 2.4GHz (Granite Rapids) with 64G memory
parameters:

	ip: ipv4
	runtime: 300s
	nr_threads: 200%
	cluster: cs-localhost
	test: TCP_RR
	cpufreq_governor: performance


If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yi1.lai@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202610091252.d0d6cae8-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20261009/202610091252.d0d6cae8-lkp@intel.com

=========================================================================================
cluster/compiler/cpufreq_governor/ip/kconfig/nr_threads/rootfs/runtime/tbox_group/test/testcase:
  cs-localhost/gcc-14/performance/ipv4/x86_64-anolis-intel-cloud-devel-5.10/200%/debian-13-x86_64-20250902.cgz/300s/lkp-gnr-2sp4/TCP_RR/netperf

commit: 
  eb34bf470a ("sched/fair: Bring back select_idle_smt(), but differently")
  e213519c64 ("sched/fair: Avoid a second scan of target in select_idle_cpu")

eb34bf470aa84e3d e213519c64ec899502f211079bb
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
  28413404            -3.8%   27329713 ±  2%  netperf.ThroughputBoth_total_tps
     55494            -3.8%      53378 ±  2%  netperf.ThroughputBoth_tps
  28413404            -3.8%   27329713 ±  2%  netperf.Throughput_total_tps
     55494            -3.8%      53378 ±  2%  netperf.Throughput_tps
      1932 ±  2%      -5.1%       1833        netperf.time.user_time
 8.524e+09            -3.8%  8.199e+09 ±  2%  netperf.workload


Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

