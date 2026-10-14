Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0EA47F2FA
	for <oe-lkp@lists.linux.dev>; Wed, 14 Oct 2026 07:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791961385; cv=none; b=cQHKRcPoGiPA//0wZrIh0OLYDWfoqX3oZ4w28Dut47NnGcYz5x20rbNUZpPy5R17yQyk52aDeJr6XxfG1zfHzOFfEtJPCgJHxMK77U1iecjvNfSsBtPYIsdikit8tli2NgcwOoVuZzjp6KVVBeAF3gZEiNc2iA72KThDMxklnMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791961385; c=relaxed/simple;
	bh=3RRGgVlmByyFKDCqUpjDMXIygXtUwJHsAXirAcnuut8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iF0FqBahzOTC085F/SFwACQZOOkcT/Ipjan6/H77oGpkKVe8WxbH4YUAfPtBUV0vJ7xhPjQL0kmW0DrsATCo+I1SP9HxIPBPjd4bIGX/SQvj7whgPwSSj5j/tC8+qsdYx+T16otUQ6573D16xUts8n+GVVD8iqV58foB2/ZJAM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fcyKoHY5; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fcyKoHY5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791961378; x=1823497378;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3RRGgVlmByyFKDCqUpjDMXIygXtUwJHsAXirAcnuut8=;
  b=fcyKoHY57EfTE6hyLTGP56PXdZ8up0PZzBVG9Dhh57rb/Pk+6uurlwzp
   Rk6aK9UIjF+5pOvJtSyV6wcHYxvhpNQLhR3D4npHn5yXPjP5blPQ7J5By
   yVPQYiJu/4D6XWe51BZO31RYWqjMgHh0a1PJ6dFiWWdgbkhA4fFpE9K15
   oqau+vbl7mSFG69rEcukl47ot0v8io+F3RjI577AGBWrJU3AfwvMqWkSl
   7wNZuNcl2uMfLrSBLpKErsvFYm1+dJwyjO4yvSj04iuCgo+djLFTTlT5z
   rxsvdmYZAm6By7y2XI+W0XABRpu+hQbjmnXddaNla5btjpbePo+emIz8y
   w==;
X-CSE-ConnectionGUID: EWvwvIqNSV+xx95CKbVdcg==
X-CSE-MsgGUID: CiT37M6yTdSWJH5D7PwraQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="576453"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="576453"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 00:02:49 -0700
X-CSE-ConnectionGUID: 6j5A1LVvSfaVXKLZxbr1Sw==
X-CSE-MsgGUID: gG3VOYWvQWakMxMx/W/l/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1456547"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 00:02:47 -0700
Date: Wed, 14 Oct 2026 15:02:43 +0800
From: kernel test robot <yi1.lai@intel.com>
To: =?iso-8859-1?B?Suly6W15?= Jean <Jeremy.Jean@oss.cyber.gouv.fr>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>, yi1.lai@intel.com
Subject: [linus:master] [nsfs]  82e9343260: stress-ng.usersyscall.ops_per_sec
 12.4% improvement
Message-ID: <202610140836.4d5baee2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Hello,

kernel test robot noticed a 12.4% improvement of stress-ng.usersyscall.ops_per_sec on:


commit: 82e9343260dfc6dda6349f285d9a5eac3e0738d7 ("nsfs: keep namespace tree fields stable until after RCU grace period") https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 224 threads 2 sockets Intel(R) Xeon(R) (Sapphire Rapids) with 128G memory
parameters:

  nr_threads: 100%
  testtime: 60s
  test: usersyscall
  cpufreq_governor: performance


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20261014/202610140836.4d5baee2-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-spr-2sp2/usersyscall/stress-ng/60s

commit: 
  0ecd56573c ("ext4: Avoid entering writeback paths during fastcommit replay")
  82e9343260 ("nsfs: keep namespace tree fields stable until after RCU grace period")

0ecd56573c1f272c 82e9343260dfc6dda6349f285d9
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     33817           -10.8%      30152        stress-ng.usersyscall.nanosecs_per_syscall
 1.908e+08           +12.4%  2.144e+08        stress-ng.usersyscall.ops
   3187687           +12.4%    3582876        stress-ng.usersyscall.ops_per_sec


Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

