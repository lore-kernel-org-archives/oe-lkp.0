Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793581875;
	b=dv2kbgPHJQ2lIenxMbWL13LZHkcH8bcgJpJYEOwwy/OJAy/s+ZreiAxi8TJafUJfGeg0
	 MJvFsXQWTDYMKW+Z33wG/J8P4i3hqhObtQUSyTq4TRafqVQ0OCHM1wHYdKjfswTiOF3EK
	 GTJ9RgBywTfZAFoly7yu/LlL/od6sCLTIoruR37kM60vKkqNszOkI28pCncOTdmnxCyay
	 x7S3AM3M+BXW5eEZ6KXkZmtc5+b9i0C/+5EXdAWGjeBwFGFAgUy0FbhSRHZxkQmomz4B6
	 AZ0F93O028dl7lwFn2vBrNpl7dlLfJn+9eLkZswQUVBSlKdv06MstJXAcMF1/5rMETw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793581875;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=Y+k8hpGVYeUwOEv0Jo/0a23XJqN/6/6dhP4pk6TCZDk=;
	b=qdlaAIXcK8hTBfmu4Fvmy5q2+4xpakjZ0Hfxv2xX4eQxcYpAklgDVQ+nHft9GzaDjTtV
	 eaqOh7qdK7AicCS5cIdpiHjhK7KHA5rT3CCUkEz3KDVeOpPBV+jvuGMAhMvQn5wgLY6Xj
	 A8STkAjoF7dv+IUPuIdpYscYsS8VHWpGMF+FROMoTYevKyixSavyu6eYja21b4MdpsGx8
	 V7GpooOhFxlDTWJTxJFPSUT9NfL7qMOZKEFf38wA6YM4nZKFiHA7+zypLFPBCXjEreQrM
	 c3ARWyo65+YILHD2l+8Ax8mU4diAVZNsU5RchA3FXpSLp+zZuAjT8kHfL/umLvW92rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aocOD7WN;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FF2606A324
	for <oe-lkp@lists.linux.dev>; Mon,  2 Nov 2026 01:11:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11FF2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aocOD7WN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793581873; x=1825117873;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tCMvJzsRcFSMuMigcng7Q379fcSk3XClTExLzr1/g40=;
  b=aocOD7WNuVReGodsdQd0GARDb6mXP61poR+DKNX0oNeIHlziCJwvWWwT
   /2uLwTG4O0U/gvDRleb8soSVaIR71zwvIJSi7DtDg2N2bPzIlADxRGkwo
   ZeBT6yyX3VHgAFwHulTO/vG2LwnvBFvFH054S8wgDV/mroSk3vhS2XaJJ
   eikz8u87XOISDYTtIUlNP30LOnODnEhm+lboZY0PKZl2rtzzsHxbfQLYV
   zEjenIhJ+xNgsJwXpB0GFmodyvUtDRbZiUytUA5TjAFqOGmsD7l4T31mv
   dZLZSyWCnlzINAEj1U1OWwV+2msnv+V1F6q5iSpLURECpnIyY9Cb3hQWw
   g==;
X-CSE-ConnectionGUID: eKUQSWXXQwi6EWouWCQ62g==
X-CSE-MsgGUID: oc0RwB/5SUCIRAVs5Yx5lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2142341"
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="2142341"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 17:11:12 -0800
X-CSE-ConnectionGUID: qhj4lhiPQ5uRQLjUNkT4aw==
X-CSE-MsgGUID: WMBZaa0TTNerH5kGH8hJog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="7747426"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 17:11:09 -0800
Date: Mon, 2 Nov 2026 09:11:06 +0800
From: kernel test robot <yi1.lai@intel.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>,
	Amir Goldstein <amir73il@gmail.com>, linux-unionfs@vger.kernel.org,
	yi1.lai@intel.com
Subject: [linus:master] [ovl]  a518e63c37:
 kselftests.filesystems/fscontext_ns.fscontext_ns_test.fscontext_ns.overlay.create_from_descendant_userns.fail
Message-ID: <202611020115.2281e158-lkp@intel.com>
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

kernel test robot noticed "kselftests.filesystems/fscontext_ns.fscontext_ns_test.fscontext_ns.overlay.create_from_descendant_userns.fail" on:

commit: a518e63c377574784f49653ef5314c70e2463b0c ("ovl: return EINVAL instead of EIO in case of mismatched user_ns")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[test failed on linux-next/master 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c]

in testcase: kselftests
version: kselftests-x86_64-24a19b953e2a-1_20261012
with following parameters:

	group: filesystems

config: x86_64-rhel-9.4-kselftests
compiler: gcc-14
test machine: 16 threads Intel(R) Core(TM) i7-13620H (Raptor Lake) with 32G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yi1.lai@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202611020115.2281e158-lkp@intel.com


026-10-30 20:02:04 make -j16 TARGETS=filesystems/fscontext_ns run_tests
gcc -Wall -O0 -g -isystem /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-a518e63c377574784f49653ef5314c70e2463b0c/usr/include -isystem /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-a518e63c377574784f49653ef5314c70e2463b0c/tools/testing/selftests/../../../tools/include/uapi -D_GNU_SOURCE= -I/usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-a518e63c377574784f49653ef5314c70e2463b0c/tools/testing/selftests/../../../tools/testing/selftests  -o /usr/src/perf_selftests-x86_64-rhel-9.4-kselftests-a518e63c377574784f49653ef5314c70e2463b0c/tools/testing/selftests/filesystems/fscontext_ns/fscontext_ns_test fscontext_ns_test.c ../utils.c -lcap
# timeout set to 300
# selftests: filesystems/fscontext_ns: fscontext_ns_test
# TAP version 13
# 1..3
# # Starting 3 tests from 3 test cases.
# #  RUN           global.create_from_same_userns ...
# #            OK  global.create_from_same_userns
# ok 1 global.create_from_same_userns
# #  RUN           fscontext_ns.binfmt_misc.create_from_descendant_userns ...
# # fscontext_ns_test.c:215:create_from_descendant_userns:TAINT_WARN already set, not checking for a new warning
# #            OK  fscontext_ns.binfmt_misc.create_from_descendant_userns
# ok 2 fscontext_ns.binfmt_misc.create_from_descendant_userns
# #  RUN           fscontext_ns.overlay.create_from_descendant_userns ...
# # fscontext_ns_test.c:208:create_from_descendant_userns:Expected variant->expected_errno (5) == errno (22)
# # create_from_descendant_userns: Test terminated by assertion
# #          FAIL  fscontext_ns.overlay.create_from_descendant_userns
# not ok 3 fscontext_ns.overlay.create_from_descendant_userns
# # FAILED: 2 / 3 tests passed.
# # Totals: pass:2 fail:1 xfail:0 xpass:0 skip:0 error:0
not ok 1 selftests: filesystems/fscontext_ns: fscontext_ns_test # exit=1


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20261102/202611020115.2281e158-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


