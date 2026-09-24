Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323443AC0EF
	for <oe-lkp@lists.linux.dev>; Thu, 24 Sep 2026 03:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790222155; cv=none; b=B2OeGS+XZy9AbEBqj0moWKBD3ZLJeSW+k/X/99EFDTaK0Th9GuUkbvq36K0EV55H6UbFHB4PJ29U80tGvrzpGRIem6ft2r16hgXDaYvA0OgoUfaFxYhOsH2doDR9FN+nHPVXyiFw/er6yFUiiOeeL4wy9EYWopaEQY8Ko4Q/kT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790222155; c=relaxed/simple;
	bh=lzlSPTzlh/Y5qjIW/JUnZhJwQdNHGCW9Q33UHnVlrS4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=EeNtubtKF0jVWXQgs14MB0+dmYyXF5+wf/hSzjwmGtmbiALKMygeuEsJlcHvq4fWXC+NIZxcA1P+1kstX/+fpYmU48imYB76tM4sbhrF8ieg9uMrkxXJ4b+c7dft001FwuhUes3Mt9jniUZCu4VF288bZQv/WPRmEpbxncP15cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W2biRSuj; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W2biRSuj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790222154; x=1821758154;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=lzlSPTzlh/Y5qjIW/JUnZhJwQdNHGCW9Q33UHnVlrS4=;
  b=W2biRSuj0u0nLtSGbtgkJqnpQCC4qvP1RgqKXMPsphx4A4wzc+AFYpfv
   xlc2x8BuS3siwN4u5dxsFgMu+RganXeFo1gBT/1+I4qcolXCbZrOTyYCF
   vQuw/Ifp2mEPWLu6swYn8lLpNbkiBppGESv93SwSDeTJ4wP6oDYdTCpxM
   KCu7YMIG3YTt92PGHL5NOOLFjEByYvTpcz4P/nXz1YMwCBzoktp2XzWIb
   Gcv9IVcWKOdmL4FAVR+RlyAt2hHF51mxX1En5rCjyAy9EtllJnBnC4Gu8
   kJS9bFDV3YTN05g3d3o2yfxZ/v0lFDnzNMG0AqTozqTb16vj4NdN4HjqS
   w==;
X-CSE-ConnectionGUID: QddqnivxRf2lbinvRLLrfw==
X-CSE-MsgGUID: d6RvNYV+TaGkjFPZB1lXlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="91087213"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="91087213"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 20:55:53 -0700
X-CSE-ConnectionGUID: 6IppWfUsRoKkrEUti05hiA==
X-CSE-MsgGUID: FU/g7o9gQVqhsp1vb3mJVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="273381451"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 20:55:50 -0700
Date: Thu, 24 Sep 2026 11:55:47 +0800
From: kernel test robot <yi1.lai@intel.com>
To: "Harry Yoo (Meta)" <harry@kernel.org>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, Hyunwoo Kim <imv4bel@gmail.com>,
	linux-mm@kvack.org, Vlastimil Babka <vbabka@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	linux-kernel@vger.kernel.org, yi1.lai@intel.com
Subject: Re: [PATCH v3] mm/slab: take n->list_lock in
 __slab_try_return_freelist() to avoid race
Message-ID: <202609240534.9fe4984a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903-slab-fix-aba-v3-1-b44cb6badd54@kernel.org>


Hello,

kernel test robot noticed a 2.3% regression of stress-ng.pagemove.page_remaps_per_sec on:


commit: 710555228bde64392410a9e8959d0324c1a0a598 ("[PATCH v3] mm/slab: take n->list_lock in __slab_try_return_freelist() to avoid race")
url: https://github.com/intel-lab-lkp/linux/commits/Harry-Yoo-Meta/mm-slab-take-n-list_lock-in-__slab_try_return_freelist-to-avoid-race/20260903-153226
patch link: https://lore.kernel.org/all/20260903-slab-fix-aba-v3-1-b44cb6badd54@kernel.org/
patch subject: [PATCH v3] mm/slab: take n->list_lock in __slab_try_return_freelist() to avoid race

testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 192 threads 2 sockets Intel(R) Xeon(R) 6740E  CPU @ 2.4GHz (Sierra Forest) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: pagemove
	cpufreq_governor: performance

If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yi1.lai@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202609240534.9fe4984a-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260924/202609240534.9fe4984a-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/igk-srf-2sp3/pagemove/stress-ng/60s

commit: 
  v7.3-rc1
  710555228b ("[PATCH v3] mm/slab: take n->list_lock in __slab_try_return_freelist() to avoid race")

        v7.3-rc1 710555228bde64392410a9e8959
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
  74699042            -2.5%   72797565        stress-ng.pagemove.ops
   1245981            -2.5%    1214288        stress-ng.pagemove.ops_per_sec
    291125            -2.3%     284309        stress-ng.pagemove.page_remaps_per_sec


Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

