Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CAF311977
	for <oe-lkp@lists.linux.dev>; Mon, 19 Oct 2026 01:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792373563; cv=none; b=VPhNGSTqjKk00Y9TwRkgzEwuzhDu5r99DEwZ0KOvdKOylV6U3WJvinqtmYiOFEwcmZIFc8Fo+9LXqXt6jMBP4DKshE7XMebsL97e+iIaCkQ8YLs+m1Arqs0ZG2ZsjNdHkaBE2rA5WagvxZc2Do+g0nMaQmtGnwWsiQPFQbKXCPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792373563; c=relaxed/simple;
	bh=RXERPTuL/5y/d7hWDRVXc6d/Cd+HYVuMmBfzY3LpxrU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k/oZFNt05kwWlcQkzLeno8jYoYggUB/4mlL1iBPNdpbvD/VYeksDc++rNQ5Xmd98gEy4InKIqllgon8tdQ6aWW4kfwC0OKMboOJiF/JZTaXGbqRkpP4TvBtBF1dtuiXEAiaffOVoLVI+mZOEy6uT0Hy82OjV2xZbj79Nx4TC9V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Se/EHGx8; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Se/EHGx8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792373563; x=1823909563;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=RXERPTuL/5y/d7hWDRVXc6d/Cd+HYVuMmBfzY3LpxrU=;
  b=Se/EHGx8x9ZiTL7s2/FJVF5GbTE3eSE7KW7nHq7QH3txIYFVvByCKxsp
   UJ0c3LeUkGveSkkouJ7HBvC/kdF5T61iinTdoMdGtsp7iSL8/dmTBaK9h
   RZ1fK2tvzDOK967fX+pTlI4L1rcKy7j3ipG0CtE0jNwt+SwGMNpb4hmvM
   WcYLvZ/XByxICcDvVEv/a5pUrJ7zbBz0WfaqM0lyqIiIXNcJPwcSi1L24
   OSINT9FteoPyD5k3SK/d3SxAC/h1I1FJBrhnzeqEr9yog4sxDigKFST6d
   ipGljGTnfGjdPoIOl/SjSMeGL0my2Z6kGI7SOSQAfRU6LPKBFq/DjCDgp
   Q==;
X-CSE-ConnectionGUID: W8o5Ler6Qp2EeLdgHCwtQg==
X-CSE-MsgGUID: 9+pqCz80SW+JYLLK+ylm3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1069180"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="1069180"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 18:32:42 -0700
X-CSE-ConnectionGUID: mNts2OuEQrKepLEn4BeTNg==
X-CSE-MsgGUID: CkNwRCGYSNWthbIVwa2dHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="2728948"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 18:32:37 -0700
Date: Mon, 19 Oct 2026 09:32:33 +0800
From: kernel test robot <yi1.lai@intel.com>
To: Barry Song <baohua@kernel.org>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Baoquan He <baoquan.he@linux.dev>, Chris Li <chrisl@kernel.org>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>, Nhat Pham <nphamcs@gmail.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Usama Arif <usama.arif@linux.dev>, linux-mm@kvack.org,
	yi1.lai@intel.com
Subject: [linus:master] [mm]  8d596d8b81:  stress-ng.mlockmany.ops_per_sec
 10.5% improvement
Message-ID: <202610190949.71c20bb5-lkp@intel.com>
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

kernel test robot noticed a 10.5% improvement of stress-ng.mlockmany.ops_per_sec on:


commit: 8d596d8b81ef56bf61538d6b4761a7b0d6138280 ("mm: avoid unnecessary lru drain for wp_can_reuse_anon_folio()") https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 256 threads 4 sockets INTEL(R) XEON(R) PLATINUM 8592+ (Emerald Rapids) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: mlockmany
	cpufreq_governor: performance


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20261019/202610190949.71c20bb5-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-emr-2sp1/mlockmany/stress-ng/60s

commit: 
  819bfbd47e ("mm/page_alloc: remove set_page_private() in prep_compound_tail()")
  8d596d8b81 ("mm: avoid unnecessary lru drain for wp_can_reuse_anon_folio()")

819bfbd47e49df89 8d596d8b81ef56bf61538d6b476
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
   1050118           +10.6%    1161061 ±  2%  stress-ng.mlockmany.ops
     17541           +10.5%      19384 ±  2%  stress-ng.mlockmany.ops_per_sec
   2933233            -7.5%    2714192        stress-ng.time.involuntary_context_switches
     76.26           +29.3%      98.61 ±  3%  stress-ng.time.user_time
   2425877            +9.4%    2654908 ±  2%  stress-ng.time.voluntary_context_switches


Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


