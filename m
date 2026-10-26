Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792976583;
	b=E+zuqZC0M8snH9LD7H0/eJX4+CFkgUtrGZd+g0rzIMfMv3MgdSbV3yfEf8+QdfGKrGHv
	 p9mA22BgoeZRg8XG6GMR4hZqYuR0pw+mUZ/vnvtowGQlphb91ytLTHdAEDDKJwa+oAgWC
	 CmH3fIV4EpF4k+2xpjSYexocn3vAix7wyirxXxc+frYrtHK6QWMxKsQhA1E7XFNhm6EgL
	 p7w+WmNsm1HRV7cnRqoL4VfyYG4V6WQFXZgNNkvZYtHPeDpTd5Aq9BRe43SImz+bEjcvN
	 b160aPJ34TYp2xQW1OH+auqDp8x13Hblk08ljBXvRPuuxIyo0Bh8Cd2onsHav88vwiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792976583;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=6KypKBxeY4fKgDZu8C15CxK34EeYHCPZ3YrUNtMGVW8=;
	b=RMvYYkftqUY9nBLwES35XwJtqF1iU45OTI1NFytS4gs7YilUD/x0HEl2CjgyFMEzncXn
	 WtGrrpHj8FqrOW7tA+WCbVy3FARwN2dvHnPrnkyuFBK5f0BP+BCVHV1UNtr5OOKbDiIXo
	 Ni0Wsk3u/pl8rYvRnkPirB1095kOxGNHHK1NG2H7jinU6HfP8+K6L879tYEZNay/wFH3x
	 J2I9UC40nj3L3Un4ou5Khe1ZnWP2jJHPYc8dBqtjXQ4NOzMiEuamicFiQWM6hwuRwkUP0
	 d9xPLtEMsHEmnzACin4X5x4vPh9k2fp3DrdShGNt3TcjSAnDKw+08Mq7khNCa949+AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GrtO21Ez;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FBF606A31A
	for <oe-lkp@lists.linux.dev>; Mon, 26 Oct 2026 01:03:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83FBF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GrtO21Ez
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792976582; x=1824512582;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=MyV6KNfTsD6WaTa9di42yb310veedcMZyi1bBjCc+mg=;
  b=GrtO21EzqhKIpV+vAdNdhaEkXp1uCRpYd4rLUwSfyjUWfk25DYjJsLeG
   Ftq5tXUGl5OquiMaWFO4/+090g2SCQtILrOkyB0D4vCO9uZPnwP2cjUXl
   z/CN50RU5X0pbZq1fJ4bnUbHjAv3YcZkQUOyGGdqjoELrYYMvre4BsLp/
   3etF2shBinElfVxyPn33BA9TmaPD7dXhWfki3Hn45QaFu5YLKd5/67EZT
   wG5O8w/zSG9ySitnrOvozv6JJPgOwd+KmgaaggEQPDnnKHHFvRG7FAX5q
   n9bnwOhDxPtt9ROB/zocn5p6w+j3mU51UCebzcVbBOYsWsVNhg3w5+vtw
   A==;
X-CSE-ConnectionGUID: PNtRG/9bQt+PRp4SG0/eRQ==
X-CSE-MsgGUID: hF8/l8VOSLC97XTTd9Ei2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1625041"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1625041"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 18:03:01 -0700
X-CSE-ConnectionGUID: B+/zTdA0Sf+1LPmPJaauPQ==
X-CSE-MsgGUID: BumxbCY3S/q3LJG0eBKPMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4017743"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 18:02:57 -0700
Date: Mon, 26 Oct 2026 09:02:54 +0800
From: kernel test robot <yi1.lai@intel.com>
To: "Harry Yoo (Meta)" <harry@kernel.org>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-mm@kvack.org,
	Vlastimil Babka <vbabka@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Muchun Song <muchun.song@linux.dev>, Hao Ge <hao.ge@linux.dev>,
	Pedro Falcato <pfalcato@suse.de>, linux-kernel@vger.kernel.org,
	kernel-team@meta.com, "Harry Yoo (Meta)" <harry@kernel.org>,
	yi1.lai@intel.com
Subject: Re: [PATCH slab/for-next 14/14] mm/slab: do not set SLAB_MAY_ACCOUNT
 for all caches
Message-ID: <202610260827.e64ec9d3-lkp@intel.com>
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
In-Reply-To: <20261021-memalloc-prof-dont-waste-slabobj-ext-metadata-v1-14-096800aa3330@kernel.org>


Hello,

kernel test robot noticed "sysfs:cannot_create_duplicate_filename" on:

commit: 74db9d3510fc1c12bbe4e56d0f034a734dd69d2e ("[PATCH slab/for-next 14/14] mm/slab: do not set SLAB_MAY_ACCOUNT for all caches")
url: https://github.com/intel-lab-lkp/linux/commits/Harry-Yoo-Meta/mm-slab-allow-passing-SLAB_MAY_ACCOUNT-to-kmem_cache_create/20261021-124642
patch link: https://lore.kernel.org/all/20261021-memalloc-prof-dont-waste-slabobj-ext-metadata-v1-14-096800aa3330@kernel.org/
patch subject: [PATCH slab/for-next 14/14] mm/slab: do not set SLAB_MAY_ACCOUNT for all caches

in testcase: trinity
version: trinity-x86_64-d4c26f234-1_20261018
with following parameters:

	runtime: 600s


config: x86_64-kexec
compiler: clang-22
test machine: qemu-system-x86_64 -enable-kvm -cpu IvyBridge,enforce -smp 4 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yi1.lai@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202610260827.e64ec9d3-lkp@intel.com


[    2.984089][    T1] sched_clock: Marking stable (2784008153, 199498551)->(3129505678, -145998974)
[    3.004962][    T1] registered taskstats version 1
[    3.007428][    T1] Loading compiled-in X.509 certificates
[    3.017205][    T1] sysfs: cannot create duplicate filename '/kernel/slab/:a-0000256'
[    3.021027][    T1] CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted 7.3.0-rc1-00024-g74db9d3510fc #1 PREEMPTLAZY
[    3.021034][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[    3.021036][    T1] Call Trace:
[    3.021055][    T1]  <TASK>
[    3.021059][    T1]  dump_stack_lvl+0x43/0x70
[    3.021066][    T1]  sysfs_warn_dup+0x5b/0x70
[    3.021072][    T1]  sysfs_create_dir_ns+0xae/0x130
[    3.021077][    T1]  kobject_add_internal+0xb2/0x230
[    3.021081][    T1]  kobject_init_and_add+0x81/0xb0
[    3.021088][    T1]  sysfs_slab_add+0x7d/0x1b0
[    3.021092][    T1]  slab_late_init+0x79/0xb0
[    3.021098][    T1]  ? __pfx_slab_late_init+0x10/0x10
[    3.021101][    T1]  do_one_initcall+0xef/0x330
[    3.021106][    T1]  ? __alloc_frozen_pages_noprof+0x145/0x2f0
[    3.021111][    T1]  ? alloc_from_new_slab+0x1b2/0x270
[    3.021115][    T1]  ? refill_objects+0x2cb/0x330
[    3.021118][    T1]  ? irqentry_exit+0x89/0x5f0
[    3.021124][    T1]  ? asm_sysvec_apic_timer_interrupt+0x1a/0x20
[    3.021128][    T1]  ? __pfx_ignore_unknown_bootoption+0x10/0x10
[    3.021135][    T1]  ? strlen+0x10/0x30
[    3.021140][    T1]  ? parameq+0x17/0x70
[    3.021146][    T1]  ? __pfx_ignore_unknown_bootoption+0x10/0x10
[    3.021150][    T1]  ? parse_args+0x117/0x2b0
[    3.021154][    T1]  do_initcall_level+0x7c/0xf0
[    3.021159][    T1]  do_initcalls+0x59/0xb0
[    3.021164][    T1]  kernel_init_freeable+0xd2/0x170
[    3.021168][    T1]  ? __pfx_kernel_init+0x10/0x10
[    3.021172][    T1]  kernel_init+0x1f/0x130
[    3.021176][    T1]  ret_from_fork+0xe0/0x1f0
[    3.021180][    T1]  ? __pfx_kernel_init+0x10/0x10
[    3.021184][    T1]  ret_from_fork_asm+0x1a/0x30
[    3.021188][    T1]  </TASK>
[    3.021192][    T1] kobject: kobject_add_internal failed for :a-0000256 with -EEXIST, don't try to register things with the same name in the same directory.


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20261026/202610260827.e64ec9d3-lkp@intel.com



--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


