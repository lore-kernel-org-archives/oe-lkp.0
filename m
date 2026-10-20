Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792466901;
	b=zZc/jfUzaJYplh5xojH2mkSc8zawjxWlBHiZLUBToIipMD9DL7g7o9bGt34hzFQB8Q0M
	 HasvuNb4tNACGsQo82oxxg7pBmGaduNG5xw+H3a8FzBigxHEXaq7MgF9rYB0D2XFLlXWf
	 CHXCDwzQKKtOWoqZDP8u2wcheW+eLB39TQJvaXMkx9vR5Mg/EdUoNWcqckuPhyl+P6pVy
	 fvD9vSmkGUDfyKvmlUtayBO2+p1Bv3qwInjHL5eBjEXgTWMs6W08cqoXjDxqg7R+Rw8bu
	 XKeWBZvvoi09ov7BAggFASYUA23DSlm7E47mC+NhdKVLQknH+35Gtq9DAy3p5VivUOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792466901;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=S11a+q8uthZ6OT5iMGLLaaA4xbs8NGH8wBdksxAdcnA=;
	b=IeEYT/qdT4Mh/NAoZdhWaUNrTdr7y2ocUk8YROD14H2oK3K0AAt9GWHKVdDCx8hvqvHZ
	 yJtJQxramN+6RIUzF2pxVmTna0y4KFz7NqvijS3r9z/Ha3qJ7krP6Uvnn7PmS70i61lZl
	 0syMYfvHAAt0Bt22yq1joNMNKjR3PVGZ78Mw5Liccwd1DhbFB7Y4QXtyxJZKK/kxSWRpT
	 B5TKKF0+larNo0nByyXOqHzlpDR7qQa/dT1ev7Rkwc8p8QfcmdT4cgZfun6HWT7uqDDjn
	 S1ABkg0innZszTK0VokMTQtyK67BngdQ3AkioDWpCD3RsaIAxj/XeB7exiT1JWFPU1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A46efsRJ;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25783606A319
	for <oe-lkp@lists.linux.dev>; Tue, 20 Oct 2026 03:28:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25783606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A46efsRJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792466900; x=1824002900;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=84pyQ5wUPTxCJ+9dBxDxuHt9gdguUz9LkGze+cgGaAk=;
  b=A46efsRJxvlzV6DwXq+Fqsi2GvDRpANtnfEqIfXglromCTWZZFzRDPga
   JscrmH0qcW+N9jAdNsxrod+UWL3Y4gUQhNRrpB0oV0TA3oltES6tuzfnN
   RxwoA4TsSj6/U+6eQINeJl7C1/xwUq83L587Xg+q1AGaR5RBAhLu5IbcJ
   M+4UEVW3J1VsT0NbFKFW2cz3QOpAxIeP2IRF3DfxjMeopi74U8digm8E0
   uRfmEEZJblrVmuS/bg0bLU86tnBwixCWCpQ5qFX2T+1S6S/eN4Nz0RRZn
   h6qGJHdXx2xlTgrVVGSg0nE60KV7bRrP/APdaDf63qR/senifKf6WCvf1
   Q==;
X-CSE-ConnectionGUID: 7S6Z89kXSpioKwo430xcjQ==
X-CSE-MsgGUID: hsO34AjIQQqmP3g1MwUEVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1047345"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1047345"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 20:28:19 -0700
X-CSE-ConnectionGUID: c/57Hva4RUu21ZxF9b1dzw==
X-CSE-MsgGUID: VX4ZR1j0Tpu4Xwrq6ZGaCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3167669"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 20:28:16 -0700
Date: Tue, 20 Oct 2026 11:28:13 +0800
From: kernel test robot <yi1.lai@intel.com>
To: Chengfeng Ye <nicoyip.dev@gmail.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	Steffen Klassert <steffen.klassert@secunet.com>,
	netdev@vger.kernel.org, yi1.lai@intel.com
Subject: [linus:master] [xfrm]  89fefad9f9:  stress-ng.epoll.ops_per_sec
 25.4% regression
Message-ID: <202610201112.ddb3ab07-lkp@intel.com>
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

kernel test robot noticed a 25.4% regression of stress-ng.epoll.ops_per_sec on:


commit: 89fefad9f971bc637fb22373078144f2563c4be9 ("xfrm: serialize state GC with device state flush") https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 256 threads 4 sockets INTEL(R) XEON(R) PLATINUM 8592+ (Emerald Rapids) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: epoll
	cpufreq_governor: performance


If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yi1.lai@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202610201112.ddb3ab07-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20261020/202610201112.ddb3ab07-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-emr-2sp1/epoll/stress-ng/60s

commit: 
  d042487dc1 ("xfrm: iptfs: fix stack OOB read in iptfs_skb_reset_frag_walk()")
  89fefad9f9 ("xfrm: serialize state GC with device state flush")

d042487dc118e494 89fefad9f971bc637fb22373078
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 1.889e+08           -25.4%   1.41e+08        stress-ng.epoll.ops
   3146137           -25.4%    2347837        stress-ng.epoll.ops_per_sec


Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


