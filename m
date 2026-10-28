Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793149914;
	b=a9Ljd6AU1Q1Pqop3ApHIs4F8Z0MsWfbQJhG/+1tBN9hSCx+5P/Y4vMoQha0NuK+M5+sR
	 sFBlgffd8wTXyn+TVh7KsSLNnyzOnmQ2ejR2wM9fiTkKFQtRi+xlM2QyIdZzyGnP57bQZ
	 kzz2NrBc+jPjprZTe6tvXQ3KInSdnF3BtQj40pDuR53BDXaGSDRTrOuTorNwAZetXBPKn
	 tFg+QN/PnLqLPRJanNxty3G2B0ebFrw5bQl0MR5/c8MCcGyUckTHmhw6O49b9of58hTAs
	 b5BEDYDXJsxHwZejJfpDyK2kYMqPR3jaPwjC7zb6nr9Xtw4o97bDMFYVV+ybALQ52XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793149914;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=yMMzs9Pna+jtafw1vf89IdntKCnHY1198130cQ5LmJI=;
	b=k2UWu6/p5qCbqlXdT9Y3Xq5nXw4xJ5UiS9mPkzANBcjt3HI0MAkPJXY+kAcUfEl7wXJn
	 fJEDsGOMIn6TVVepvHK4jjU9HiJvwJirkA3HcWq4DhBsKAZgG8bRBqTon2UCIrklBLkMm
	 tBmgWrE6QP4OQVebCAkY8S7FwWDsdzlTL+BZfDTuVTtt8R4khmjLq0MOhIR7q5wZ1P/CW
	 jrZeMxoMHjuA3wT91jNgtdrOoZazLHAe+E7fm+qCBHnrRgpImkLT7yhm64GhWoFptlKBQ
	 05tEdUkm7RwBFxAVo7DQzWjimqMBoCFupMiHNlT77x9EH+PchLKDsA7k7cGlIh2q8Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WF3dVuBT;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E72606A31A
	for <oe-lkp@lists.linux.dev>; Wed, 28 Oct 2026 01:11:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8E72606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WF3dVuBT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793149914; x=1824685914;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bRrSSI31hvxe5p4s6MhnpET0k5fmh93d4jplPxCRmPw=;
  b=WF3dVuBTKQk+kN4ykeBbtFSTiCQblhuieRGDKoBwwPAhd8/WXS+2Y8s/
   oLxK3QpMg2b/mbOyj6VF/of3dQVS4x/m1re0nr82wINcRewpWqSlaExUz
   QSTmUt53MSv+BlNRsKZOJYvSLMqdzrGZds1fKfIO7kbsdL6dh9MWwzpI2
   WiINbQNkhD9UraN61MfWAoOnLXJLBWe2eDvaPcGKgB1eUBzVcaWFOlmjj
   5w22iN8pwP/MXM1YL30e1I4Y08Pq47IvKDsg0Sq/M7R+G0uCWkCY0wyye
   GrmmT0z4sDhZDSRsyt/s2Y9aaKBETGI3uO7tWvvrLmXnw03suDo/j0sYX
   A==;
X-CSE-ConnectionGUID: /hkqV84nSC2cpF3X35lAkA==
X-CSE-MsgGUID: v+pov8XyQLO1HCIWbpIlBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1870200"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1870200"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 18:11:54 -0700
X-CSE-ConnectionGUID: Il5r4mD2TAqZL8hUeXkOWQ==
X-CSE-MsgGUID: tqfZYdDyQzi7dyaNWBs2uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4805966"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 18:11:51 -0700
Date: Wed, 28 Oct 2026 09:11:48 +0800
From: kernel test robot <yi1.lai@intel.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>, aubrey.li@linux.intel.com,
	yu.c.chen@intel.com, yi1.lai@intel.com
Subject: [linus:master] [sched]  333238da9a:  stress-ng.vm-rw.ops_per_sec
 36.4% improvement
Message-ID: <202610280223.6ff1abde-lkp@intel.com>
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

kernel test robot noticed a 36.4% improvement of stress-ng.vm-rw.ops_per_sec on:


commit: 333238da9a193ffc58792995f3e951e4cb87bfd2 ("sched: Update time before requeueing delayed entities") https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 224 threads 2 sockets Intel(R) Xeon(R) (Sapphire Rapids) with 128G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: vm-rw
	cpufreq_governor: performance


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20261028/202610280223.6ff1abde-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-spr-2sp3/vm-rw/stress-ng/60s

commit: 
  v7.2-rc7
  333238da9a ("sched: Update time before requeueing delayed entities")

        v7.2-rc7 333238da9a193ffc58792995f3e
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 5.011e+08           +35.9%  6.808e+08 ± 35%  stress-ng.time.voluntary_context_switches
 2.519e+08           +36.4%  3.436e+08 ± 36%  stress-ng.vm-rw.ops
   4200915           +36.4%    5729669 ± 36%  stress-ng.vm-rw.ops_per_sec


Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


