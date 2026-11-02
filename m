Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627822;
	b=UpBdV9tKII9ZsnB2bei0As0hy33O9ELkgvFedpC+O1kDX66JHKpdzExeFawAA4cOfdxN
	 P7ZBos5ZvhGbousnUfWcBZRhGpQZFxSKK8yzT5qqifZtsUSLcNlK7VGIt4gsnD4LdRc1B
	 WozaMBFIwDrDWDiPDprODU7LcteNj14/Imf9RFo7Eai6Gq6DL9SKKpW2otjABGPy6y2zN
	 oQHJQ0gX+6jbOymjrTHFKA3Vny94ix0RVbvM6/C8mCEWclX47tDC/f8RbDxyQ5zYJaJVr
	 JbbQp/yv4tOgXaljiKl/EZZQdyNISGyfv4QsLnDWv2TadqTXbYsn+bTv2Sk9FBDM2+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627822;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=aY+uTVkzrvNotrv+R7o9XjTGrkI7pqN52rACqDEBwvw=;
	b=uSOi1dfp+k02UJnYzt5J1d1uZ+kBjGa1MInqS0emyWXK0DzRaiZwumaWCaaQNpxqMIIK
	 GRcr4GwhcnERhmcoMoXRwKUWMip63IlrxLENKQSA0KPX/xw5V2wvVTtqjbQ3pYAGiF4wK
	 OMd2lqkiUAR2Gcc2P+gS2fItVnZtwAkJcrFMWODyKurVgzVx028/jJEKtEicgXa7LoJiX
	 PdagRURE5Zkt4Wq8kcDxokhtO2/RSimiy3A08IB457RWi/oZ7pTiPGmbr440FZM5B0db8
	 oBzFwMF0xM24+2xDc5nSUYK+78B85/BCVrvO5KP+xTWfCKgifVn/7jzVDv6nXQuhetw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cvvF3wWe;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15360606A32F
	for <oe-lkp@lists.linux.dev>; Mon,  2 Nov 2026 13:56:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15360606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cvvF3wWe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793627820; x=1825163820;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/+Ka65ISl0O8qoyc0FUTNy5aKkP2xUp+ZgLvLFN/wz0=;
  b=cvvF3wWeimUShSdh8EhSn+xJ3Mmbp0xxhWUE1BFI5xXWjnEvINusZ59Y
   OJdCwCNR0roG6qlJxcNwxSsWLIsWgBNeNPMFXJCs7Kj/xtwrtJhpgJfpi
   3fS4y62o0Fh4jNvyxLbn6zLjIn8KYshTecKcho7Ev5+AX9eX9Y17C8Lyh
   7v6CQ8E2JrQUBvTpUQOA8udJC3Lkc7m4bW4HmubO9+6qICiMkEU1CLIwU
   ajTmIGXqOshLAWAZToWTxOqVt9WUyygDU6z4mC+V6VQBBdRhllkqshBMz
   LXf2q5nRykW7/mbb3JrA0D4TGnkj+DH4hAVM/J6+Pd/eJ08zByo/ZE27a
   g==;
X-CSE-ConnectionGUID: SyOW5zWQQVi2qedlWgTTYA==
X-CSE-MsgGUID: oqMNNOKUSlSk5cqs3LGxFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2328559"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2328559"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 05:56:59 -0800
X-CSE-ConnectionGUID: OV2TL7GUQu6q37LKLBaBmA==
X-CSE-MsgGUID: wZ3pGcFlTqGwtH2rwJfoWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6252146"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 05:56:57 -0800
Date: Mon, 2 Nov 2026 21:56:54 +0800
From: kernel test robot <yi1.lai@intel.com>
To: Harry Yoo <harry@kernel.org>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-mm@kvack.org,
	yi1.lai@intel.com
Subject: [harry:b4/sheaf-size-round-up] [mm/slab]  7d63a6c06a:
 will-it-scale.per_process_ops 54.0% improvement
Message-ID: <202611021441.984cb0bb-lkp@intel.com>
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

kernel test robot noticed a 54.0% improvement of will-it-scale.per_process_ops on:


commit: 7d63a6c06a85030dc4344dc0884883b115faa64a ("mm/slab: round up sheaf size to kmalloc size for explicit sheaf_capacity")
https://git.kernel.org/cgit/linux/kernel/git/harry/linux.git b4/sheaf-size-round-up

testcase: will-it-scale
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 192 threads 2 sockets Intel(R) Xeon(R) 6740E  CPU @ 2.4GHz (Sierra Forest) with 256G memory
parameters:

	nr_task: 100%
	mode: process
	test: mmap1
	cpufreq_governor: performance


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20261102/202611021441.984cb0bb-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-14/performance/x86_64-rhel-9.4/process/100%/debian-13-x86_64-20250902.cgz/lkp-srf-2sp2/mmap1/will-it-scale

commit: 
  6ae424d6ef ("EDITME: cover title for sheaf-size-round-up")
  7d63a6c06a ("mm/slab: round up sheaf size to kmalloc size for explicit sheaf_capacity")

6ae424d6eff8059f 7d63a6c06a85030dc4344dc0884 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
  38572109           +54.0%   59400688        will-it-scale.192.processes
    200895           +54.0%     309378        will-it-scale.per_process_ops
  38572109           +54.0%   59400688        will-it-scale.workload


Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


