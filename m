Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E805E35AC14
	for <oe-lkp@lists.linux.dev>; Mon, 19 Oct 2026 01:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792375153; cv=none; b=Bd0glux34/XCGr0O0oM9SU2PS2CdEirptgp2D1uXJFEhzRcrlNtRk96np7dwK7y3qgObP0nWKPORbIWQodFgjcmjvarVujfCgt+fGXKfX2Wj/61isgDnnbHKmUCWiTBrRQp3ufdiW8mxQ4C9WzlvxsAVHmOAK4VSG0+uGKRaw1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792375153; c=relaxed/simple;
	bh=7fnx3dXsI2wRJdwIsrpwQJW0BoY5IQYr8pQyudxvv9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iw57up23KbBgTypB1cZtSHUJsIa7qWHKTlnZdu6KsoFfkRdUbAj5M5Y/YBc1Kkb1z7ehTS0Ghk3dNnAYfXBYxiha/bUKOuXdigU7uUiU4yyQd7VhwbMw2VFqgJ0MbvXbgKEpGigjiQCBQe6Ow7nmMBegMNoSbSEFTXWMq2PKqh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EoSTO2+R; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EoSTO2+R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792375152; x=1823911152;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7fnx3dXsI2wRJdwIsrpwQJW0BoY5IQYr8pQyudxvv9Y=;
  b=EoSTO2+RxBzHDNb29PJ+qdNAIuFFwDCpnV0SOAt9ilOaa83QxIWibjnH
   HVlnyFb69JxjaRELshlNjvIorlTVO7yFjyoCGlskHf+x/a8Ntugf/nNco
   Hys3tl95X+IIkSi08ZDUQylEQWgf+Xigxl9NmQlKMx+08O3UywHfknIfK
   NlWfzF31AhBVBK/FyPLO592+gHbPzcgymBwIn654/PP5KocpeaTiZO6IH
   3xYGaWaqnl4/xP2bR80IRiaTqQNlCJdRNXYVHPGwigdIKlc1PcCSYBrmx
   EdMfJ3d0ZxbxL1kv2QzqMZ969XZlnxb7Ivb8kB3b2s3WxxMMmW4iu3fSJ
   g==;
X-CSE-ConnectionGUID: KtD1HBCFQnaooMLbHCaktA==
X-CSE-MsgGUID: 7xRL3fN1RhqxI14GY9bJlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="924660"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="924660"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 18:59:11 -0700
X-CSE-ConnectionGUID: peGbbfOhSn2jwTT84XRp+A==
X-CSE-MsgGUID: rwe68dC6Tkma6YgMmPfUFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="2839779"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 18:59:06 -0700
Date: Mon, 19 Oct 2026 09:59:01 +0800
From: kernel test robot <yi1.lai@intel.com>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Pedro Falcato <pfalcato@suse.de>,
	David Hildenbrand <david@kernel.org>, Jann Horn <jannh@google.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>, Zi Yan <ziy@nvidia.com>,
	linux-mm@kvack.org, yi1.lai@intel.com
Subject: [linus:master] [mm]  7625cb5673:  stress-ng.mincore.ops_per_sec
 28.1% improvement
Message-ID: <202610190930.7aeab52b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline



Hello,

kernel test robot noticed a 28.1% improvement of stress-ng.mincore.ops_per_sec on:


commit: 7625cb56733bfd470e9fae69a1b8b78aa8b1d3eb ("mm: mincore: replace __get_free_page() with kmalloc()") https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 256 threads 4 sockets INTEL(R) XEON(R) PLATINUM 8592+ (Emerald Rapids) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: mincore
	cpufreq_governor: performance


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20261019/202610190930.7aeab52b-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-emr-2sp1/mincore/stress-ng/60s

commit: 
  006943a9b4 ("mm: mincore: remove special handling for VM_PFNMAP")
  7625cb5673 ("mm: mincore: replace __get_free_page() with kmalloc()")

006943a9b437b2d4 7625cb56733bfd470e9fae69a1b
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    547.22           -25.4%     408.24        stress-ng.mincore.nanosecs_per_mincore_call
  27632999           +28.1%   35386493        stress-ng.mincore.ops
    460725           +28.1%     590032        stress-ng.mincore.ops_per_sec
      1729            +7.1%       1852        stress-ng.time.user_time


Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


