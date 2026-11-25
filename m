Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795614431;
	b=h+8ok1V0wOPmXrh7wnmvKpQQxd1BHZZ8elrQbl2zsVx9XVdqMtrNhTLaVLio0ust5Ycv
	 ZVjLvirprz4lA6Ga46tCjaVOQ4jSIWnX3mqBoOHbiNaPrpKpi4MZQxYRhf7Z2bzl5RIZS
	 FsZg1E8TB9M3R50OvayXqiBlR2rPQlRjJZnOgEUfQgsib9999pzdd2J59Kue+fVt9on0X
	 5JI9HSYD3ptwAqvSwXJenjRTefPbR5QnPfpbWNuih1RuHcwbMH9AkK7cc5lBp/m/o/S3U
	 LoGUC2dXc7mI7Oz9pKrrxs5d2NVWDhhncW0uLuQFhSWLZcAgwkghKQI+p9gNW/XadWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795614431;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=Se8wT/fU+HdNWsGJegIdeQkIxuwrabWdV0hbMqDYi0E=;
	b=MVpNCzzgYuyuB3GsB6oDYw4I6gkWpxXqecIMpEcPkcabxIXUDBpUmzpi+80vO4x2B2fN
	 4LMPys8DRlAWGSxRoxtWo4bX2b4INvvcUh3jZjWy+TpoJ7zlOJ1+g0iDVmlsadOfx3ZgP
	 /HlE6J313w9AdzaprnQ5WDLnx1pvdX5/O3aEX2hOJdQLkLnwm1glsRZCwWSdXSr0J9qXt
	 pECpgjBkC/gtzKeOM+LM6ON3erA8KfTETCPRh9rtJ/Jog3LyZjEUo3JTEuFrhKnIZcX5I
	 wdqHTrYTD6ZMLUzkKy66IwFouxnrd5raaiNIuktta7It/ybOndFUL549MnVEW/s9dnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Y3Foe6Bp;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CC9606A323
	for <oe-lkp@lists.linux.dev>; Wed, 25 Nov 2026 13:47:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51CC9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Y3Foe6Bp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795614432; x=1827150432;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=85dtCJhxafyH7yNjIQIXWSMxs0vF+3hxEDtwFRfZmf4=;
  b=Y3Foe6BpYUmH6T1XqhNNqT7qH3DLqLvfnmBW8GNjqA/LVQ7Xf4vufgZj
   zzI3h7MfYbc970HtXkNV/bMlynKJnVY2q7fMBiXcoTG6H6sfrwlHJhukA
   d2TWHYLUdkDT0UYO5lk9YeHQtk7N1PQRIwXQMuIkMDOnJ56iaxRqbaNj0
   K1TK0T6B9J6I6ZcH5TKi9FUHPJKRydUbhAijrRy85to/jzMveFwdDnJbq
   iXldIshrjN0Iay3F7H3yU7GNMaWBQTCZwemkN+JjO9VIRRON1DVBy6k2p
   bNmJloSLyz4vS7QfsNN4xsxLFhOEOwolmDj16odZEQvti82Jwzq0Y2r0s
   A==;
X-CSE-ConnectionGUID: mtyGKyGlR0KOinlnEx4VDw==
X-CSE-MsgGUID: bTfbImgoSkKDs07UziK7+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4405968"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4405968"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 05:47:11 -0800
X-CSE-ConnectionGUID: sOwTZi0oT1a8yYrbS8PixA==
X-CSE-MsgGUID: GKirioOfRvq3CU9Yc2Uxuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="11859261"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 05:47:09 -0800
Date: Wed, 25 Nov 2026 21:47:05 +0800
From: kernel test robot <yi1.lai@intel.com>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
	David Hildenbrand <david@kernel.org>,
	Eliav Farber <farbere@amazon.com>,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
	Zi Yan <ziy@nvidia.com>, linux-mm@kvack.org, yi1.lai@intel.com
Subject: [linux-next:master] [mm/memory]  f8eca7ec1b:
 xfstests.generic.437.fail
Message-ID: <202611252134.37a9cb7e-lkp@intel.com>
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

kernel test robot noticed "xfstests.generic.437.fail" on:

commit: f8eca7ec1b368557613cc727abadc82546c1f46a ("mm/memory: do not report OOM if insert_pfn() races a huge fault") https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

[test failed on linux-next/master 3dd8c790a7b7027abdd568e36db5e82ffaea7c77]

in testcase: xfstests
version: xfstests-x86_64-d07dca72-1_20261110
with following parameters:

	bp1_memmap: 4G!8G
	bp2_memmap: 4G!10G
	bp3_memmap: 4G!16G
	bp4_memmap: 4G!22G
	nr_pmem: 4
	fs: ext4
	test: generic-dax


config: x86_64-rhel-9.4-func
compiler: gcc-14
test machine: 8 threads Intel(R) Core(TM) i7-6700 CPU @ 3.40GHz (Skylake) with 28G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)


If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yi1.lai@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202611252134.37a9cb7e-lkp@intel.com


2026-11-25 00:16:54 cd /lkp/benchmarks/xfstests
2026-11-25 00:16:54 export TEST_DIR=/fs/pmem0
2026-11-25 00:16:54 export TEST_DEV=/dev/pmem0
2026-11-25 00:16:54 export FSTYP=ext4
2026-11-25 00:16:54 export SCRATCH_MNT=/fs/scratch
2026-11-25 00:16:54 mkdir /fs/scratch -p
2026-11-25 00:16:54 export SCRATCH_DEV=/dev/pmem3
2026-11-25 00:16:54 export LOGWRITES_DEV=/dev/pmem1
2026-11-25 00:16:54 export LOGWRITES_DEV=/dev/pmem1
2026-11-25 00:16:54 export MOUNT_OPTIONS="-o dax"
2026-11-25 00:16:54 sed "s:^:generic/:" /lkp/benchmarks/xfstests/tests/generic-dax
2026-11-25 00:16:54 ./check -E tests/exclude/ext4 generic/413 generic/428 generic/437 generic/452 generic/462 generic/470 generic/503 generic/605 generic/606 generic/607 generic/608
FSTYP         -- ext4
PLATFORM      -- Linux/x86_64 lkp-skl-d01 7.4.0-rc3+ #1 SMP PREEMPT Wed Nov 25 07:55:29 CST 2026
MKFS_OPTIONS  -- -F /dev/pmem3
MOUNT_OPTIONS -- -o dax /dev/pmem3 /fs/scratch

generic/413         4s
generic/428         1s
generic/437        - output mismatch (see /lkp/benchmarks/xfstests/results//generic/437.out.bad)
    --- /lkp/benchmarks/xfstests/tests/generic/437.out	2026-11-10 14:32:16.000000000 +0000
    +++ /lkp/benchmarks/xfstests/results//generic/437.out.bad	2026-11-25 00:17:00.840164485 +0000
    @@ -1,2 +1,3 @@
     QA output created by 437
    +/lkp/benchmarks/xfstests/tests/generic/437: line 22:  5709 Bus error               $here/src/t_mmap_cow_race $TEST_DIR/testfile
     Silence is golden
    ...
    (Run 'diff -u /lkp/benchmarks/xfstests/tests/generic/437.out /lkp/benchmarks/xfstests/results//generic/437.out.bad'  to see the entire diff)
generic/452         1s
generic/462         1s
generic/470        [not run] xfs_io log_writes  support is missing
generic/503         5s
generic/605         5s
generic/606         1s
generic/607         3s
generic/608         1s
Ran: generic/413 generic/428 generic/437 generic/452 generic/462 generic/470 generic/503 generic/605 generic/606 generic/607 generic/608 Not run: generic/470
Failures: generic/437
Failed 1 of 11 tests




The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20261125/202611252134.37a9cb7e-lkp@intel.com



--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


