Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793588644;
	b=0cWvi++FvvNofcnfh2jnYmv8rbUqyd+pV1Bl9T+mDK9tJYM1CCOeqSATrAlnCdpqTPPp
	 cdxW0y6y71wyKOsUD+EjqQaXcRB3fltSfSUOCAGJBdynq//L68JxY4UXzUXY2iVE9NleW
	 Bb21jz4A70p8+4nJPAuvFWi286CkD3IQk8Sel2GstuNkl/ng0bajd/JiCzYi/cIBU/xz+
	 8fgOWsnMwxksprnNdtijLvOCNW2So98HVsOsQrJUHPgzffs9HSX+cmccItfy88ONFHexF
	 XUt4MT3k2p25sbIx5nxfJWV+LBH/dtnGx8UbtcQFcqHdYyQJ9FZGbibP9ANJSAnnpeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793588644;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=0VOhK1tiXvwD4rlAaAt9DA/YhM3wBDdK4db2i8QGuwE=;
	b=fO2LElPSvxKfQgJcHIvs6MWHA0Da2HH/U4gRnazRZ6+UMZK5+s8Md4yLOxhlDX49vHqO
	 IzC8LqfHE0hK2qvb1Lc/Si1Ec1pmg6d3ktyVdnYlr9Id9dvXSLuCycM+VZUESB835WHCE
	 gEsrXs68mh6FRsgv7O7p9sog1deC4sU3eeWl/Z6F9V+1dkNTw81N9jSFn0wygKCQs4N/d
	 UIMAPot/yjfTX45NfnJ2tMbjKi33Kwpr6Cr+3YFTcmDk1UrTUmT1qVavPcIbUiDZSemGZ
	 9ARnuDU4BnkGfYDelI88xhkIgH4X3smDt9AuJNfGvq45UayMILlatGXVKHwI8g5bQKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DvQs6cpv;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6440A606A324
	for <oe-lkp@lists.linux.dev>; Mon,  2 Nov 2026 03:04:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6440A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DvQs6cpv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793588644; x=1825124644;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zNaDoAroCC5BLRvZ8wPBDcDwp4aLs2bC+eKNIA0MqXk=;
  b=DvQs6cpv/3pj/YD4TMCGH8wqFYOfnZM01Lj2+vDwiqyZgUS7Iqe+bnqw
   28sDyqvnEOLd5Wk+SGwA1jhN6lnPP7ghb/UzvZeP5kfKj/zBk4Kp5bclT
   +A7MFbCTVToC4mFOrvU7b0iKSaIbc+nQeDvSVZJX3xvXiGQrgN1LMkfNI
   GW48dqY4Kphd18Sio44GtxJW0Nv6spcUykP1bGEvnHB4D/0ybqBBg9ps7
   xko/kqpuq4PuJqUMAQ//e5WbvqE4b3IdsEMD0ToRn5yJnFytR4Y6cybLK
   /hfb3glFPMKf+6Mgyg7uwyOJWPhs54xgbGU1DMDQJI3phb1tz/4KwYtDp
   Q==;
X-CSE-ConnectionGUID: bJa872TbSEyR1eckCzmi6w==
X-CSE-MsgGUID: ux1jXrLORySonKMSKZ7QfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2153083"
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="2153083"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 19:04:03 -0800
X-CSE-ConnectionGUID: F+A1kkJ2T2utroayL5FEiA==
X-CSE-MsgGUID: xBV+1rydRRG5uXRXzxicsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="5833835"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 19:04:01 -0800
Date: Mon, 2 Nov 2026 11:03:57 +0800
From: kernel test robot <yi1.lai@intel.com>
To: Michael Petlan <mpetlan@redhat.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>,
	linux-perf-users@vger.kernel.org, yi1.lai@intel.com
Subject: [linus:master] [perf test attr]  f8596112cb:
 perf-sanity-tests.Perf_attribute_expectations_test.fail
Message-ID: <202611020206.eb217e49-lkp@intel.com>
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

kernel test robot noticed "perf-sanity-tests.Perf_attribute_expectations_test.fail" on:

commit: f8596112cbad0072cdc957c0ea06695afda246dc ("perf test attr: Propagate the return value from the test to the wrapper") https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[test failed on linux-next/master 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c]

Note: this commit is very likely not the root cause, but rather the change that makes the pre-existing failure visible. This Commit correctly propagates the return value, so the test-record-branch-filter-any_call mismatch on this machine is now surfaced.

in testcase: perf-sanity-tests
with following parameters:

	perf_compiler: clang
	group: group-02


config: x86_64-rhel-9.4-bpf
compiler: gcc-14
test machine: 16 threads Intel(R) Core(TM) i7-13620H (Raptor Lake) with 32G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)


If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yi1.lai@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202611020206.eb217e49-lkp@intel.com


2026-10-31 15:26:58 sudo ASAN_OPTIONS=fast_unwind_on_malloc=0 /usr/src/linux-perf-x86_64-rhel-9.4-bpf-f8596112cbad0072cdc957c0ea06695afda246dc/tools/perf/perf test 82 -v
 82: Perf attribute expectations test                                                                          : Running (1 active)
---- start ----
...
expected mmap=1, got 0
expected comm=1, got 0
expected freq=1, got 0
expected enable_on_exec=1, got 0
expected task=1, got 0
expected sample_id_all=1, got 0
expected branch_sample_type=16, got 0
FAILED '/usr/src/perf_selftests-x86_64-rhel-9.4-bpf-f8596112cbad0072cdc957c0ea06695afda246dc/tools/perf/tests/shell/attr/test-record-branch-filter-any_call' - match failure
---- end(-1) ----
 82: Perf attribute expectations test                                                                          : FAILED!

=== Test Summary ===
Passed main tests : 0
Passed subtests   : 0
Skipped tests     : 0
Failed tests      : 1
List of failed tests:
   82: Perf attribute expectations test


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20261102/202611020206.eb217e49-lkp@intel.com



--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


