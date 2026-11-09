Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794193676;
	b=yrs3vGCtvX64fFM37If0jUykB5bzTM58VyzbqdvKEC/wWz320icA2qGGqYJR6rvJ0N/s
	 UtaJ/T2I/Ux46rzjmzoO5q/lURM3ZDxTDU1JV5xGG+BDiYhnRI0DAnN6Q2gfQ2+lbJ/g+
	 qq/vPQXSb2kV+9npHxOh00SYvlCabtZUQhIc+TH19b58GVyegej8gAupA1F8EAOb/ssiI
	 ntJBMl4Uv0gd2UKuYdQJdLzkCa6R8Fx2YR4Zw2wshIxWdoLWHOYuUtE9r4m9ASQgRYNbO
	 wu3cGx60naeMhz0w6wLhoYEBDPzIeSkbNq90Ift3t7LQCyHOORiYqg5mcgB2DniDs6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794193676;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=7gH5bT2Vxt0gNrCEsgfTETROJ7GF5H5tMV5hP0235n4=;
	b=ZLXi/SqEqDl/mOKQAoslK4YSTo7oLgcsgrvL5WMBAxi2Vh9/ZJJMDx4b4cqodLrMjGZk
	 vm7x23P22brZ+RZ/XNShn82VuGaeVOsG073lY5kc7yUQtwkh8wydf+oqQiKYTbdmtxW5N
	 WnTVfvoC9hW4hxCTNYkmh/2fxTXdNHO1IQEMGmoLzv59niB/iA23/ss8IBdA+lh8E+Kun
	 Vw8eiqUJ3F0FUfDJQEW9dm8D+ZAG5NYWnnByUmmQ93BdDQy5jiZ6Id6+bhrkaDXG41dr0
	 L4uZ/6dw43i/ohDmsA9nhIx+oRGS/vUNjyRK4wlXZvxppkw0CWiPxnDYSUG4bCa6N+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K+RvC28D;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02780606A323
	for <oe-lkp@lists.linux.dev>; Mon,  9 Nov 2026 03:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02780606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K+RvC28D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794193674; x=1825729674;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qjDMRVpVkMF74tWTNfZVyzHe4W8bMwXwRyqoOCBYirM=;
  b=K+RvC28D42ZrzN4Zb9oxQS9E+WRicsX67EOo6cLizBkSAnbkui0cpWS8
   zMpv8uCsMDCLvYNAFxVlYO18FkBMoLesbmxBrvb1widvEF0WPL/c2yti/
   0wpat6qsLREwcP2PbikCjgXdz5AuZoec9ZTI2+tD4c4+OwtggdpTfZEIP
   NkwFQ5cMYd2iWQXpjf4sfyNL3+v5rQaaRgaxQ8cvvhbdpSiGDhPiuMbl7
   NAoBAKg/kMUR6w76JYn3K5hTFzc0EvwT3bXwjA136BKdpTbI3iRI9Y7pa
   AcFacdztQk4JrCu9/mUVwf4T2jGkbtVbJ4Ne0e+hlwB1pQfwgBRiZ5NuK
   w==;
X-CSE-ConnectionGUID: eFSMiwymTtuhr1t/0/O9AQ==
X-CSE-MsgGUID: Xb4RbB1pTS6lIl27AvQa5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="3006327"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="3006327"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 19:07:53 -0800
X-CSE-ConnectionGUID: UlLbedElT1KnOpMa1ixC7w==
X-CSE-MsgGUID: i90PE10rQzWi5EpYC7Vy/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="7653164"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 19:07:49 -0800
Date: Mon, 9 Nov 2026 11:07:45 +0800
From: kernel test robot <yi1.lai@intel.com>
To: Joanne Koong <joannelkoong@gmail.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
	Andrew Morton <akpm@linux-foundation.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Yosry Ahmed <yosry@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	Baoquan He <baoquan.he@linux.dev>, linux-mm@kvack.org,
	yi1.lai@intel.com
Subject: [linux-next:master] [mm]  1e61c0bd82:  will-it-scale.per_process_ops
 6.2% improvement
Message-ID: <202611091011.f4668ccc-lkp@intel.com>
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

kernel test robot noticed a 6.2% improvement of will-it-scale.per_process_ops on:


commit: 1e61c0bd822af6f9026c048d53fe8824881df8d7 ("mm: move LRU size stat updates out of lru_lock in folio batches") https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

testcase: will-it-scale
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 512G memory
parameters:

	nr_task: 100%
	mode: process
	test: fallocate2
	cpufreq_governor: performance

Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20261109/202611091011.f4668ccc-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-14/performance/x86_64-rhel-9.4/process/100%/debian-13-x86_64-20250902.cgz/lkp-spr-2sp5/fallocate2/will-it-scale

commit: 
  25e9342d48 ("tools/mm/thpmaps: fix missing mapping names")
  1e61c0bd82 ("mm: move LRU size stat updates out of lru_lock in folio batches")

25e9342d487fcfaa 1e61c0bd822af6f9026c048d53f
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
   5750918            +6.2%    6109659        will-it-scale.224.processes
     25673            +6.2%      27274        will-it-scale.per_process_ops
   5750918            +6.2%    6109659        will-it-scale.workload
  

Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


