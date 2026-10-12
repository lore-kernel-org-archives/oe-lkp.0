Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038C437BE6F
	for <oe-lkp@lists.linux.dev>; Mon, 12 Oct 2026 02:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791770859; cv=none; b=Quq833jDTio0a3mBWfQRwuPEVJgV1NmWxeWL2hlIVpGRwTZaiCvdmk1mvQ7L/KmAhbRFkVezNnZUZgyIOfLdpxzwwd2fRvEOAHKn5YfNFdkT5oo1gMOHwd31rlFO0MF629ksmQdDST/ycfSDfHclGaG68kjVvVkFkTBgi4EYycw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791770859; c=relaxed/simple;
	bh=PIXnirzSeSpiSAL0k9VctTSSk+nA7YB97XAc2Ue9kVk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FUrRFhYK90ebltPjt68QRp+bLKinEoMSDK5ED8KHaLHrB4baht/BYf+x9fmbDsp097IJyI7yWDDj0ExNQCHhmXfhBGxJ+q4mn+JTKf5c6EKqosCrCyNaqb9+Rs9BDzsKXSBoZFmVRZ0gLyKzlOTKfTpaOwFbso9vko5p7+dyy7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Huk0Ea3C; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Huk0Ea3C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791770858; x=1823306858;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PIXnirzSeSpiSAL0k9VctTSSk+nA7YB97XAc2Ue9kVk=;
  b=Huk0Ea3CfYH6yK2Bp/8lF1F9227zWcJxqWPctOpGKVG9DU4Zh/Sl3gBH
   c2VRf9FRvMEUdMxrhXD+NiRAnRqSaP1S/a3MpltuF6YgpOTzG+Cj3LkwT
   OzsA5mdRIOv3O/aFsogZJG0JBLQAYw8Jasl107i97Jbp9LLrIxdiQa0Wu
   mqs7NnKDAq8NMMdIXktUfkJ+aNAwWF8dB1mtYwSIenlmmzFpW5J4ybEjc
   5j/JIl5CdROugb+Dpbn0Gz00vZ0Gghz67+I70C6524Ht4ZCZuzW5ia7X5
   50puxbnPmPSA8x7scsjA4hlsullTzQcKFoWs/Z7RM38NuM1DxunhFRe4i
   A==;
X-CSE-ConnectionGUID: GQfM2ZT3RwCv3IH5/1WcdQ==
X-CSE-MsgGUID: TvItc2xgSN2WCXqIrdL0aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="583875"
X-IronPort-AV: E=Sophos;i="6.27,152,1787036400"; 
   d="scan'208";a="583875"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2026 19:07:37 -0700
X-CSE-ConnectionGUID: CkpXoGN9ShmaTGiVOL9NNw==
X-CSE-MsgGUID: 0fcWhFasQtKEOMk7+iAjnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,152,1787036400"; 
   d="scan'208";a="1237457"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2026 19:07:36 -0700
Date: Mon, 12 Oct 2026 10:07:32 +0800
From: kernel test robot <yi1.lai@intel.com>
To: Eric Biggers <ebiggers@google.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, yi1.lai@intel.com
Subject: [ebiggers:wip-x86-aes-xts-integrated-tweak-encryption] [crypto]
 0ecd756ee5:  stress-ng.sigsuspend.ops_per_sec 12.7% improvement
Message-ID: <202610120947.84603e5f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline



Hello,

kernel test robot noticed a 12.7% improvement of stress-ng.sigsuspend.ops_per_sec on:


commit: 0ecd756ee5f1ebf3585e1190ad28f8da9240521e ("crypto: x86/aes-ecb - Remove superseded ECB skcipher") https://git.kernel.org/cgit/linux/kernel/git/ebiggers/linux.git wip-x86-aes-xts-integrated-tweak-encryption

testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: sigsuspend
	cpufreq_governor: performance


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20261012/202610120947.84603e5f-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-spr-r02/sigsuspend/stress-ng/60s

commit: 
  2f3f90b00a ("crypto: x86/aes - Drop superseded 32-bit build support")
  0ecd756ee5 ("crypto: x86/aes-ecb - Remove superseded ECB skcipher")

2f3f90b00a6604a3 0ecd756ee5f1ebf3585e1190ad2
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 3.371e+08           +12.8%  3.802e+08        stress-ng.sigsuspend.ops
   5629384           +12.7%    6343927        stress-ng.sigsuspend.ops_per_sec
 2.719e+08           +12.9%   3.07e+08        stress-ng.time.involuntary_context_switches
 3.371e+08           +12.8%  3.801e+08        stress-ng.time.voluntary_context_switches


Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


