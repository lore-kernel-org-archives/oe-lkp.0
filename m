Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794290135;
	b=xFqJn4ePYllozLuICUm9UXxdAsmJQ54rIUlc9rZHZOba+63FwFCYQoZg7+Y/1y5Q4EhU
	 xo1bwhTWXrwH+FTJdZqzFfIcqE1ou7x0bbWs66yuCTskxk8oVtSbFm3H1eLyS0xYHy3xA
	 xXxkojjLIUdyuBtMYGi4BJWiLlcruuBVGSRjGB/o71rYmsjh+jqB/c/783batDjtiNdkO
	 4m9zRSFp2s9JvYzIaM7MOj27QRAwqKMU7gouKh7V1lgib7uGyjM3ouwmPkAbgYeXjcc9I
	 vS4xidEZKM8NebzzeMdNse8j9OClNMiN3GPp6JhQp0ZkgGEbT5hFSw6iMEkU1Jj6P2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794290135;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=GkcKWJ0heCTsnAPSM2CLKHVBzexochNYD8ZlSD7BEC4=;
	b=gApXNFkVSy/0FD6osqWlfu87mgSsZ4Gvlpi2eEdPHAR5ykovUXQfAB2XEKiqyT7SQELS
	 FsfOLrI18vox/rucDH5olPAA7TXtUN9aTL7cvuTHVNn8Te2RiVALuOO4RzddrFTtyA8Q3
	 M7XRT0pfhwHyrEHz98/C0Kq7ADveZ/LC6Ox0vD/O8kx6yaGHEbkMKuk3HRG3DQF5RbyX8
	 OFooxQKVuaOU+B78llg5X5jhbLbUvdwX74zJY9Blmbf9pwGx7srIUXfE5lDE/7gl3Tt8V
	 lznGKgCuODZ+p4jfVNNL6WStOo2z/iWu3CAvXIz635KaldlcurMqF4EIrzzb75DpX3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lgWVTzXM;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03CC606A31C
	for <oe-lkp@lists.linux.dev>; Tue, 10 Nov 2026 05:55:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C03CC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lgWVTzXM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794290133; x=1825826133;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=iH88yvmbUE3SFjgUzc6lodYnds+PFSYIA9Ar8F2CVSM=;
  b=lgWVTzXMJznGGA8Yg83zpzWkwwGBoSiBA3boswZjQBISNwI1tc2Dh9U4
   pxqKuXU2UfbqW77mE0/7LfLD5C6y/raVh+p3L40F4IcKJl4JCGLtjHdLl
   pUVM0TyUA/8cxSBrqwoiOw0dFBg2h76+cNpOZoiDpumh0A8Zv7WydylwW
   5i6ZR0JscS+IiQ7Z6rTkBvHitfa/p9VQXCJNT6DspbUfgq7UQUEmKhjzm
   tKUUeFh/boMXMFvs0PL953WSRbN5PyGEQZQpu6ySk0JtaWE1R102kZPOs
   nPIRlLSbqLZFsYhaIos9TRGo2PuczC7fa09lIbNdx5nDNtG1tTlYFpRGk
   w==;
X-CSE-ConnectionGUID: P2ZkoHEyRXCPR/jK5ZhJTA==
X-CSE-MsgGUID: ADjVeT/3TwaqgMrgZrmqlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2917653"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="2917653"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 21:55:32 -0800
X-CSE-ConnectionGUID: LcEW59E0QuehKVntU1UV3A==
X-CSE-MsgGUID: c7XNTJf3QdG48TPU0eC1yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8366056"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 21:55:31 -0800
Date: Tue, 10 Nov 2026 13:55:27 +0800
From: kernel test robot <yi1.lai@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	Yao Kai <yaokai34@huawei.com>, yi1.lai@intel.com
Subject: [linus:master] [workqueue]  f1639cde5f:  stress-ng.io.ops_per_sec
 9.9% improvement
Message-ID: <202611100656.fcd6dc19-lkp@intel.com>
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

kernel test robot noticed a 9.9% improvement of stress-ng.io.ops_per_sec on:


commit: f1639cde5f5c1bee25498ef988227ee8cf5ddb04 ("workqueue: Make flush_workqueue() visit only pwqs active since the last flush") https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 224 threads 2 sockets Intel(R) Xeon(R) (Sapphire Rapids) with 128G memory
parameters:

	nr_threads: 100%
	disk: 1SSD
	testtime: 60s
	fs: xfs
	test: io
	cpufreq_governor: performance


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20261110/202611100656.fcd6dc19-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/disk/fs/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/1SSD/xfs/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-spr-2sp3/io/stress-ng/60s

commit: 
  31e33de1f4 ("workqueue: Maintain pwq->total_in_flight")
  f1639cde5f ("workqueue: Make flush_workqueue() visit only pwqs active since the last flush")

31e33de1f4e159c7 f1639cde5f5c1bee25498ef9882
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    260170 ±  3%      +9.9%     285895 ±  4%  stress-ng.io.ops
      4337 ±  3%      +9.9%       4766 ±  4%  stress-ng.io.ops_per_sec
   6244092 ±  3%      +9.9%    6861492 ±  4%  stress-ng.time.file_system_outputs
      4547 ±  7%     -15.8%       3826 ±  4%  stress-ng.time.involuntary_context_switches
      3320 ±  3%     -17.5%       2739 ±  5%  stress-ng.time.percent_of_cpu_this_job_got
      1995 ±  3%     -17.5%       1645 ±  5%  stress-ng.time.system_time


Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


