Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4FA3806D7
	for <oe-lkp@lists.linux.dev>; Thu, 17 Sep 2026 02:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789610603; cv=none; b=d+5p0pKYFku4hlGHDcmX8tJ41MstKVs23GSbzBjLTL8XtbqKTrGwws3bYDIN1ShCJJh1vka4W7kIkT6sO9Y1XQmdg+63/km6Tsir4JqMidkQ8hXMkoVYMRNlf+/IVL8Etbo6ZzvLATCbCiqaFqAWwcszcXI6jsVnZI1ebKzo8i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789610603; c=relaxed/simple;
	bh=nVjXlugxZyIAgb8Hgn/5fpIjPuP8oZskPBHNbBQGx1o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XEXe6ebD9AusuftVV3XoiQm3JX8fsp3Mxs3XPdUkIbv2hOKQe+I2U15kgaD+I9k49G8t7DPWalUfeQCUVBvUxFVr25r2ZySNcUvOrwAhg89/PzvsVij/DEGOJRdVL75kYkD7dVhY0hKs6oGh5wwzvp/kYxKnf8mMtxFZPV94fgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dglcAMtU; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dglcAMtU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789610599; x=1821146599;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nVjXlugxZyIAgb8Hgn/5fpIjPuP8oZskPBHNbBQGx1o=;
  b=dglcAMtUHVz5Gl45wg9T0ZQ2IxoT9qjIUQL0A34FqJc5zHcn/NJi0suq
   mZpgD4D1rM8QOwtpbNUeepMD79P/yieX3toAeCFqcjq8UqLbjH+sD6al6
   wdsGkuytrPfroYr4XneDb0CnIOYLAyjh6ft/xOSPZhnHoi30dqNNJvNhq
   oPabpK0zepbzU2mFGPUJLF2v3F+Q20TRfeUD3gncPeY91csqf5C67xIht
   GkPXsHnn16a7+RfAAxD9s9ClKGEI6wGbNidhMpPP0wyMbJj86qjGGAeh/
   ItDR1ks7vwaHnhUKGDe4GX7pt1OoQS94osZp0Fb31AVNDEkqS5c9nEJjj
   w==;
X-CSE-ConnectionGUID: W7LCucbBTJab0PB6a9EgRQ==
X-CSE-MsgGUID: joBNRHGUSfiMHL4AF+Gs5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93697863"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93697863"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 19:03:16 -0700
X-CSE-ConnectionGUID: aNetxnJWTJGFEmwzj0kBAQ==
X-CSE-MsgGUID: vm+ZHVwxS7aNDKnE39g1Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="277652016"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 19:03:15 -0700
Date: Thu, 17 Sep 2026 10:03:11 +0800
From: kernel test robot <yi1.lai@intel.com>
To: Dave Chinner <david@fromorbit.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, yi1.lai@intel.com
Subject: [dgc-xfs:log-verification-1] [xfs]  bbf33f240f:
 xfstests.generic.450/451/453.fail
Message-ID: <202609170902.2be2db11-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline



Hello,

kernel test robot noticed "xfstests.generic.450/451/453.fail" on:

commit: bbf33f240f9bd46857bf73a5d6f26724f58ed76f ("xfs: validate the unmount record during recovery") https://git.kernel.org/cgit/linux/kernel/git/dgc/linux-xfs.git log-verification-1

in testcase: xfstests
version: xfstests-x86_64-56c410ad-1_20260817
with following parameters:

	disk: 4HDD
	fs: xfs
	test: generic-group-45


config: x86_64-rhel-9.4-func
compiler: gcc-14
test machine: 8 threads Intel(R) Core(TM) i7-6700 CPU @ 3.40GHz (Skylake) with 16G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)


If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yi1.lai@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202609170902.2be2db11-lkp@intel.com

2026-09-16 11:14:08 cd /lkp/benchmarks/xfstests
2026-09-16 11:14:09 export TEST_DIR=/fs/sda1
2026-09-16 11:14:09 export TEST_DEV=/dev/sda1
2026-09-16 11:14:09 export FSTYP=xfs
2026-09-16 11:14:09 export SCRATCH_MNT=/fs/scratch
2026-09-16 11:14:09 mkdir /fs/scratch -p
2026-09-16 11:14:09 export SCRATCH_DEV=/dev/sda4
2026-09-16 11:14:09 export SCRATCH_LOGDEV=/dev/sda2
meta-data=/dev/sda1              isize=512    agcount=4, agsize=13107200 blks
         =                       sectsz=4096  attr=2, projid32bit=1
         =                       crc=1        finobt=1, sparse=1, rmapbt=1
         =                       reflink=1    bigtime=1 inobtcount=1 nrext64=1
         =                       exchange=1   metadir=0
data     =                       bsize=4096   blocks=52428800, imaxpct=25
         =                       sunit=0      swidth=0 blks
naming   =version 2              bsize=4096   ascii-ci=0, ftype=1, parent=1
log      =internal log           bsize=4096   blocks=25600, version=2
         =                       sectsz=4096  sunit=1 blks, lazy-count=1
realtime =none                   extsz=4096   blocks=0, rtextents=0
         =                       rgcount=0    rgsize=0 extents
         =                       zoned=0      start=0 reserved=0
2026-09-16 11:14:10 export MKFS_OPTIONS="-mreflink=1"
2026-09-16 11:14:10 sed "s:^:generic/:" /lkp/benchmarks/xfstests/tests/generic-group-45
2026-09-16 11:14:10 ./check -E tests/exclude/xfs generic/450 generic/451 generic/453
FSTYP         -- xfs (non-debug)
PLATFORM      -- Linux/x86_64 lkp-skl-d07 7.3.0-rc2+ #1 SMP PREEMPT_DYNAMIC Wed Sep 16 18:57:50 CST 2026
MKFS_OPTIONS  -- -f -mreflink=1 /dev/sda4
MOUNT_OPTIONS -- /dev/sda4 /fs/scratch

generic/450        [failed, exit status 1]- output mismatch (see /lkp/benchmarks/xfstests/results//generic/450.out.bad)
    --- tests/generic/450.out   2026-08-17 23:41:54.000000000 +0000
    +++ /lkp/benchmarks/xfstests/results//generic/450.out.bad   2026-09-16 11:14:14.376762747 +0000
    @@ -1,11 +1,7 @@
     QA output created by 450
    -buffer read the first sector within EOF
    -buffer read the second block contains EOF
    -buffer read a sector at (after) EOF
    -buffer read the last sector past EOF
    -buffer read at far away from EOF
    -direct read the first sector within EOF
    ...
    (Run 'diff -u /lkp/benchmarks/xfstests/tests/generic/450.out /lkp/benchmarks/xfstests/results//generic/450.out.bad'  to see the entire diff)
check: possible mount failures (see /lkp/benchmarks/xfstests/results//generic/450.mountfail)
generic/451        [failed, exit status 1]- output mismatch (see /lkp/benchmarks/xfstests/results//generic/451.out.bad)
    --- tests/generic/451.out   2026-08-17 23:41:54.000000000 +0000
    +++ /lkp/benchmarks/xfstests/results//generic/451.out.bad   2026-09-16 11:14:15.227462526 +0000
    @@ -1,2 +1,7 @@
     QA output created by 451
    -Silence is golden
    +mount: /fs/sda1: fsconfig() failed: Structure needs cleaning.
    +       dmesg(1) may have more information after failed mount system call.
    +common/rc: retrying test device mount with external set
    +mount: /fs/sda1: fsconfig() failed: Structure needs cleaning.
    +       dmesg(1) may have more information after failed mount system call.
    ...
    (Run 'diff -u /lkp/benchmarks/xfstests/tests/generic/451.out /lkp/benchmarks/xfstests/results//generic/451.out.bad'  to see the entire diff)
check: possible mount failures (see /lkp/benchmarks/xfstests/results//generic/451.mountfail)
generic/453        [failed, exit status 1]- output mismatch (see /lkp/benchmarks/xfstests/results//generic/453.out.bad)
    --- tests/generic/453.out   2026-08-17 23:41:54.000000000 +0000
    +++ /lkp/benchmarks/xfstests/results//generic/453.out.bad   2026-09-16 11:14:16.035987245 +0000
    @@ -1,6 +1,7 @@
     QA output created by 453
    -Format and mount
    -Create files
    -Test files
    -Uniqueness of inodes?
    -Test XFS online scrub, if applicable
    +mount: /fs/sda1: fsconfig() failed: Structure needs cleaning.
    ...
    (Run 'diff -u /lkp/benchmarks/xfstests/tests/generic/453.out /lkp/benchmarks/xfstests/results//generic/453.out.bad'  to see the entire diff)
check: possible mount failures (see /lkp/benchmarks/xfstests/results//generic/453.mountfail)
Ran: generic/450 generic/451 generic/453
Failures: generic/450 generic/451 generic/453
Failed 3 of 3 tests




The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260917/202609170902.2be2db11-lkp@intel.com



--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

