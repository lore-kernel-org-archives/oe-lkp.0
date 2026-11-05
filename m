Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793839131;
	b=BD9BCA4+aoo/dJbhcLdCcTHd8x6ydzG4Rtj0Uuq17rkgYhS6OL5LtqdkJUTwAxDwR92B
	 c76OIQ8SKa+nRdqOg46uQgjKPaSBaF5skiEjHJMtHZZdt2utOORVla3iXgfh50W6+JSzC
	 A2Mn+S33j6UEjHhqD9SnZBKCBB25/gSJQ+wRa1JF1ggySHbNoDAqJ2zFiTcy7/RmS39+0
	 SsUjvhe/zWq3K5tlm/k/4K6wQFLmLFYflkU5nP5Ir2LcFpn4Ba9IUfGer0N/iLw/L2Vgm
	 ZXAfrTfMmai+kz93IkkDE0a80GvzGyvyMUkLShkzKlVm6Akif1CobvKCg8pQ83dn7tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793839131;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=3j8nosRT0hMFrdPaU0fdOT3QafLKdAoumLCtN8aeB7c=;
	b=4+o974iCw1xe+NEtAUiERUAfRBzfXogdTQL2yhpRf17aGdOj5hBL60qwVcCS7XtZ7g4f
	 RFkUbqafjwrBGggXx/WDwzyJLa5eLbfSBokAAmPnU2/py7gPAod2G7w65FlXTImHjoNs6
	 9qEHd3OAahdPs5hBrB8H1A1K1LyQJFXEMOm8p3sKhtsuXE5erHJmktm9mxjNzUMVrr5OU
	 QNd5+2xK44KWxe0ODjyH6XkV/Kyr62ysJnVw3sdpz+LeuEeoNMSOGfGrveX8sX3nBsiLg
	 gdBnUBaIl6HbmrQ3oGSOlmqFuBLpXn+tRy0snEX3OMZQBMjRKF6S9Y7Vdb50OjGrUXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h6i4uEwF;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD77606A31B
	for <oe-lkp@lists.linux.dev>; Thu,  5 Nov 2026 00:38:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AD77606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h6i4uEwF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793839131; x=1825375131;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5+t87+N/s71iHTzWzcKOMalV2nyZX0pYiXF/rYzODWc=;
  b=h6i4uEwFrfeEv+kx230LwJIbRGbUXf2FXk6G8Iswv+zpLtubgbW0EEiN
   427KQH5pi4KZjJna1Nrd2lKvzE5z6cRlIQfXyFP8ip+E/bl3y96vWFyRv
   3kfj/FaoLOjmpNdoMDUInMRnsdH1aPL2vrMnlP6z3sHOSs5QANdqEpX19
   Hw+MyGugM16yqJaja/ArqQiJUHgde0Pu+C6X3bLWcKwXmAvUm7Q5nk8Bd
   +EWKV+z7WTCiwxEfTFBrp7HDMuq9Q6HARTaLrqKryhHxatQv9tSltZwBk
   lEW07AGBgqf4rpaChh2dY1nawdpM68LaJshc3u0bICKBDBuZj27kgJHMW
   Q==;
X-CSE-ConnectionGUID: ouCdIcYFRRKfhVTlOUkALQ==
X-CSE-MsgGUID: r0Dp0oeuT8G+kivITg3svg==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2630957"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2630957"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 16:38:50 -0800
X-CSE-ConnectionGUID: uRcZfDPTQACPdZzQ63gB0g==
X-CSE-MsgGUID: iLMWVtDLQ3ulnBNpVVj06w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="6866644"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 16:38:48 -0800
Date: Thu, 5 Nov 2026 08:38:45 +0800
From: kernel test robot <yi1.lai@intel.com>
To: Breno Leitao <leitao@debian.org>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>,
	Mateusz Guzik <mjguzik@gmail.com>, Oleg Nesterov <oleg@redhat.com>,
	linux-fsdevel@vger.kernel.org, yi1.lai@intel.com
Subject: [linus:master] [fs/pipe]  f7f4665dc5: lmbench3.PIPE.bandwidth.MB/sec
 18.5% regression
Message-ID: <202611041404.befe64cd-lkp@intel.com>
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Post: <mailto:oe-lkp@lists.linux.dev>
List-Help: <mailto:oe-lkp+help@lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-lkp+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit



Hello,

kernel test robot noticed a 18.5% regression of lmbench3.PIPE.bandwidth.MB/sec on:


commit: f7f4665dc520fd8bbc1db20e59945773e03744a0 ("fs/pipe: unify the page pools into a single per-pipe pool") https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

testcase: lmbench3
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 224 threads 2 sockets Intel(R) Xeon(R) (Sapphire Rapids) with 128G memory
parameters:

	test_memory_size: 50%
	nr_threads: 20%
	mode: development
	test: PIPE
	cpufreq_governor: performance

If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yi1.lai@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202611041404.befe64cd-lkp@intel.com

Details are as below:
-------------------------------------------------------------------------------------------------->

The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20261104/202611041404.befe64cd-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_threads/rootfs/tbox_group/test/test_memory_size/testcase:
  gcc-14/performance/x86_64-rhel-9.4/development/20%/debian-13-x86_64-20250902.cgz/lkp-spr-2sp2/PIPE/50%/lmbench3

commit: 
  c610d2d078 ("fs: annotate inode timestamp accessors")
  f7f4665dc5 ("fs/pipe: unify the page pools into a single per-pipe pool")

c610d2d0787961cd f7f4665dc520fd8bbc1db20e599
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     29142 ±  2%     -18.5%      23737        lmbench3.PIPE.bandwidth.MB/sec
    191.80 ±  8%     +54.1%     295.65 ±  5%  lmbench3.time.elapsed_time
    191.80 ±  8%     +54.1%     295.65 ±  5%  lmbench3.time.elapsed_time.max
     23261 ± 16%     +19.3%      27743 ±  5%  lmbench3.time.involuntary_context_switches
      9853 ± 16%     +27.9%      12605 ±  5%  lmbench3.time.system_time
     51.80 ±  2%     +11.6%      57.80 ±  3%  lmbench3.time.user_time
 2.928e+08 ±  3%     +26.6%  3.706e+08 ±  4%  lmbench3.time.voluntary_context_switches


Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


