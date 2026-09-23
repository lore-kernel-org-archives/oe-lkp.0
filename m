Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9166923E325
	for <oe-lkp@lists.linux.dev>; Wed, 23 Sep 2026 01:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790125268; cv=none; b=gZKMtv0fSMlcjhCwwjXvKvhWk6FuxJuJEPnznpPOTHaZDazYzS5hcfSYnzxURqm8c7T0t673XEk1XGQvLLmM8CEqFWA+r7g2TPY2mjWHxXSt+NqhNJK+n1A1su5nF6QIE2MGlmvH21S/rHtrzBFz0/WAJ3Xbv8zx1cBkn6AUV1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790125268; c=relaxed/simple;
	bh=74O1kp/nZApmmjBc7sKM2+VS4aA5/+dj08DdtbaNMyI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bfZ4sqC/r6fjTXXGPyxfZVQgPiKuzKgJ8Ro0Rwu/c+PWM0GgK+QCLDObObMRQjaHRsgLwZCdw5ey+f+Dc2jKrQjInQAoaKiDHzRZyz7FYtdW0FkA9EsG3yZlaDohxM5xgms6gFo7/CiRbutFheEMVJjfHyFOKk/z25GVS+FbM6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V5YPYDn9; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V5YPYDn9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790125265; x=1821661265;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=74O1kp/nZApmmjBc7sKM2+VS4aA5/+dj08DdtbaNMyI=;
  b=V5YPYDn9a/kW4EMwB0KWIpqzxbESTWH3SC8tnYV/VwtJkQH813KpFmIk
   BfDWGqycrv8EH/BRJbehbqimbZqugArdhPsWo+TvYl35tUtcv58GsrB7b
   CSjQCs4etyu52PUMGOw+G9OxMCiqLCInalcFWDgFvYx5ds5CkHGSDJbQf
   Z46JaKs5J/p4IAKvLaatVdXkMPYbBwf4uQ8F1na3rrR3vH2m356tSy7Xo
   CebyDvp3ZL3EvpQbXgG4ePfum1bFUHFazSC37kRiZEhmGLdHCkncfdUEy
   PsSofmlxRYEJOspHqaWLfuRCRLzLgw0Zg9JpmtWZkzscqVFbEH6UorMSc
   g==;
X-CSE-ConnectionGUID: b3QDm9YnSGyEIg/Qm+FL9Q==
X-CSE-MsgGUID: sOftchc6TRymCcnxnIyp+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="116303998"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="116303998"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 18:01:05 -0700
X-CSE-ConnectionGUID: ti1bcWrYTQuQFr18gyFW6w==
X-CSE-MsgGUID: +8ft8is0RFGwWC+LqX5l9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="281446757"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 18:01:00 -0700
Date: Wed, 23 Sep 2026 09:00:57 +0800
From: kernel test robot <yi1.lai@intel.com>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Daehyeon Ko <4ncienth@gmail.com>, Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Hagen Paul Pfeifer <hagen@jauu.net>,
	Jakub Kacinski <kuba@kernel.org>,
	James Bottomley <james.bottomley@hansenpartnership.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Michal Hocko <mhocko@suse.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>, linux-mm@kvack.org,
	yi1.lai@intel.com
Subject: [linus:master] [mm/secretmem]  97d34aa65c:
 stress-ng.secretmem.ops_per_sec 99.5% regression
Message-ID: <202609230824.7a9189aa-lkp@intel.com>
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

kernel test robot noticed a 99.5% regression of stress-ng.secretmem.ops_per_sec on:

commit: 97d34aa65c29cca85e3e9050f4c936389b38a054 ("mm/secretmem: properly account locked pages") https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: secretmem
	cpufreq_governor: performance

If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yi1.lai@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202609230824.7a9189aa-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->

The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260923/202609230824.7a9189aa-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-spr-r02/secretmem/stress-ng/60s

commit: 
  35b0fb391b ("mm/mremap: reset unfaulted VMA page offset for MREMAP_DONTUNMAP")
  97d34aa65c ("mm/secretmem: properly account locked pages")

35b0fb391b0df573 97d34aa65c29cca85e3e9050f4c
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
   6080503           -99.6%      23092 ±  3%  stress-ng.secretmem.ops
     85584           -99.5%     385.28 ±  3%  stress-ng.secretmem.ops_per_sec
     71.48           -16.0%      60.07        stress-ng.time.elapsed_time
     71.48           -16.0%      60.07        stress-ng.time.elapsed_time.max
     97435 ±  2%   +1276.4%    1341103        stress-ng.time.involuntary_context_switches
    230308           -96.1%       9096        stress-ng.time.maximum_resident_set_size
  18401243         +3349.6%  6.348e+08        stress-ng.time.minor_page_faults
     20417            -8.7%      18639        stress-ng.time.percent_of_cpu_this_job_got
     14581           -25.0%      10937        stress-ng.time.system_time
     13.34         +1858.5%     261.33        stress-ng.time.user_time
      6898 ±  2%  +96037.7%    6631576 ±  3%  stress-ng.time.voluntary_context_switches

Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

