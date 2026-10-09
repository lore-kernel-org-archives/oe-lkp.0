Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80BC31E85E
	for <oe-lkp@lists.linux.dev>; Fri,  9 Oct 2026 06:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791527948; cv=none; b=ouZqNuGrD+wJCyRzDcLGYS+HIOX/uFIHdOJoX20hOmFLaIcX4Aq/nrqZkypOcCf+Mp2O4HtpBwBEh8fCoAu6OicXHYDw6y0e5UJF0v4vqmqTUiDB5MheWKFCpT+4YZSkgCuxh0SPc1gR/PJxtUjMSiyeb4VAlZrnB+XGCgn3Yw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791527948; c=relaxed/simple;
	bh=HyCYDcwd4p7v9CaOr/TI8WqjAnbtu3SXQcxglqX3xRY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PvWl4yZ8b+NJzJ7mRdNrluDcSqLUdQNV8IaPd9DNX1f/+1f5fWG5y3lSlfGN/1nheYL51o2pJibGnB6cGmttUYwyBdNr0K7zgqSvyelr3HKWxRVl0EWGaSCPtYEwIs658mfT8IAnd0q6FMyS0fMZ3RVMnJ9aADURDOtedf3PSdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FQNp5Dr+; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FQNp5Dr+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791527946; x=1823063946;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=HyCYDcwd4p7v9CaOr/TI8WqjAnbtu3SXQcxglqX3xRY=;
  b=FQNp5Dr+AAZBKk0NLDeUHBhBB/VlIUQBC9yh+x0jixtgkX1+RfVkzqEM
   NjUeCjrJ056bS49chuBVev/GLxSMJMWLkxPTrqAU7X4uiNGE8KQf6UHIx
   YxzrTmdw24f8Rua7zfm/nzAmvjdatVbtlVEXpXHCx8DuoqLUOq/NyHDau
   6Ut4McHEpswKrhmFviEBE2Yl7MJXZ866JbKpGA6+wZQ5nOq5huxldIvW9
   gJOTtqNunekjEDrpN51zGjheybgAninE9ViCVecPRMHS5SQ+4A757Oe8h
   ymDBtedR+TtUQW6F9P63XgwaXKhpqnz9qtKvmy5tAEsdnfWHoYPsnjosa
   w==;
X-CSE-ConnectionGUID: jso7RA8xQFGK4YVpPZGGsQ==
X-CSE-MsgGUID: CVSgSHlwQF+Tm0oS6twbcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="201180"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="201180"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 23:39:06 -0700
X-CSE-ConnectionGUID: Tpg1035cT+e4bln+P7KYGQ==
X-CSE-MsgGUID: bqsZdNQwSJi7cq+Du3SAZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="244059"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 23:39:06 -0700
Date: Fri, 9 Oct 2026 14:39:02 +0800
From: kernel test robot <yi1.lai@intel.com>
To: Harry Yoo <harry@kernel.org>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-mm@kvack.org,
	yi1.lai@intel.com
Subject: [harry:b4/sheaf-size-round-up] [mm/slab]  ddf56dfc79:
 will-it-scale.per_process_ops 54.5% improvement
Message-ID: <202610091451.beda4ec3-lkp@intel.com>
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

kernel test robot noticed a 54.5% improvement of will-it-scale.per_process_ops on:


commit: ddf56dfc79f5734d7b3aa8ba81f195d52b3e5823 ("mm/slab: round up sheaf size to kmalloc size for explicit sheaf_capacity")
https://git.kernel.org/cgit/linux/kernel/git/harry/linux.git b4/sheaf-size-round-up

testcase: will-it-scale
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 256 threads 2 sockets GENUINE INTEL(R) XEON(R) (Sierra Forest) with 128G memory
parameters:

	nr_task: 100%
	mode: process
	test: brk2
	cpufreq_governor: performance


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20261009/202610091451.beda4ec3-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-14/performance/x86_64-rhel-9.4/process/100%/debian-13-x86_64-20250902.cgz/lkp-srf-2sp1/brk2/will-it-scale

commit: 
  675a745c61 ("EDITME: cover title for sheaf-size-round-up")
  ddf56dfc79 ("mm/slab: round up sheaf size to kmalloc size for explicit sheaf_capacity")

675a745c6113e420 ddf56dfc79f5734d7b3aa8ba81f 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
  70440501           +54.5%  1.089e+08        will-it-scale.256.processes
      0.30 ±  3%     +35.9%       0.41 ±  8%  will-it-scale.256.processes_idle
    275157           +54.5%     425248        will-it-scale.per_process_ops
  70440501           +54.5%  1.089e+08        will-it-scale.workload


Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


