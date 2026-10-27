Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793070147;
	b=B5ibpOdA6p2CvgYJ8pB5jdJbe1Nqr9GjP5zc0sGW6fXQW3oopDx2lB9HxlppsFl4WHOv
	 gHo4S8BZ79MrF7XV8SVMlwst2Xb+fx9VbEwAEW0TPUaE15eUAUskPv8pypJ4sW+f7eqRP
	 MokRFlS0oysUYWV5u5Y8o8EkMd5orKcDmIA4KOkk3tu9n/l1aVKlcm9t6cucLR+zv6N9I
	 dJ0GOhNfEt8kh8tGnOphLu0ibzUePQzuoQCtukwO7kHENu4SR1tub5I5LlwiUw4o4Mifa
	 Z3guN87xjG2Ora2udLGVf9jnu3DZtIGzv8e+Cfo5vT4e5hHp/g/YckFlSQ97MtXzXkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793070147;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=C0QrFOI28M3MmR3SK4Hg20NvJbMOHT80aEV0AnlAm/A=;
	b=M9n+i9TgXt4nBPZ8yd/KRA/NIJjGCTEtI2VIJKjKz1/r7R/5xknkSX42Lz8H4bEYJ7F/
	 5svtrSDrCkyUAXune5NJgv4m0ge6cqH/g9shftkb1K8MoAsaqJ8l4WkD8yAZd7aB6q6Ny
	 JAUZx8D6hdkqez9czQ32XyNbR3JA7OKqOXz81q+FH+O6WuXp+3psw7eldMk0SzVfsuzhw
	 hLO7S4p4wkcsu2swZH0wuQCPXYfGjFYDju9hBnTs5Lc76oSAEDsS2RRChvUt4raHNI2gR
	 QGKMhFnm7xkhbMwcecr6ryDn2XXQBiEmHZ8dNvpwn/MM5sjNDxTrj42+JwFkrCubRVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NFGQM0tT;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C91606A31A
	for <oe-lkp@lists.linux.dev>; Tue, 27 Oct 2026 03:02:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77C91606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NFGQM0tT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793070147; x=1824606147;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TAE5fxBZz63S/h+97WG1Zur1qUt7ZOGBGZDuc6VOXaY=;
  b=NFGQM0tTEWyfVj8rpmb6LJPATJ6ibixR5aiq23LCgxQ3vXVw6I78WzXO
   QovqAxw+bs2bFr/Q7SUC273ZKPAwzpQOP+mdPZkaLcWhXZH7PwznoI7JA
   dkb9P8Xyvuzg4u2rhEOoM8Q/1e6fOwWY21peU2+5GqbKwnzxB0z1GwgTy
   7DYQoR+fg7MkHGO8Jlu6ekMxgIP1qXNYf26fRf58B8uKux/ro8/sRtjV+
   afGu/yR/BZ20iL4UnM8eNfy68lcAUbyhqR6g0izElqr40wIaXTcHCdc+n
   6V2MWX4Yb0ySCj6Ky2fX0FPqUY3N06MHk27jPqqyHcQXUM/q0jT5EWB5g
   A==;
X-CSE-ConnectionGUID: VLcjZiYiTGGlimen0IZ5ZQ==
X-CSE-MsgGUID: 2C7WE5NIQMi1k0LWuElHig==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1748750"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1748750"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 20:02:26 -0700
X-CSE-ConnectionGUID: cygFRvYVQFm7tNjpxahaEw==
X-CSE-MsgGUID: cdvJTzg7QnSd4Ohpv3Ijxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4291569"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 20:02:24 -0700
Date: Tue, 27 Oct 2026 11:02:21 +0800
From: kernel test robot <yi1.lai@intel.com>
To: =?iso-8859-1?B?Suly6W15?= Jean <Jeremy.Jean@oss.cyber.gouv.fr>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>, yi1.lai@intel.com
Subject: [linus:master] [nsfs]  82e9343260:  stress-ng.signest.ops_per_sec
 4.1% regression
Message-ID: <202610271038.d2f16428-lkp@intel.com>
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

kernel test robot noticed a 4.1% regression of stress-ng.signest.ops_per_sec on:


commit: 82e9343260dfc6dda6349f285d9a5eac3e0738d7 ("nsfs: keep namespace tree fields stable until after RCU grace period") https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: signest
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+---------------------------------------------------------------------------------------------+
| testcase: change | stress-ng: stress-ng.sigill.ops_per_sec -3.6% regression                                    |
| test machine     | 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory |
| test parameters  | cpufreq_governor=performance                                                                |
|                  | nr_threads=100%                                                                             |
|                  | test=sigill                                                                                 |
|                  | testtime=60s                                                                                |
+------------------+---------------------------------------------------------------------------------------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yi1.lai@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202610271038.d2f16428-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20261027/202610271038.d2f16428-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-spr-r02/signest/stress-ng/60s

commit: 
  0ecd56573c ("ext4: Avoid entering writeback paths during fastcommit replay")
  82e9343260 ("nsfs: keep namespace tree fields stable until after RCU grace period")

0ecd56573c1f272c 82e9343260dfc6dda6349f285d9
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     33691            +4.3%      35127        stress-ng.signest.nanosec_to_handle_a_signal
 3.989e+08            -4.1%  3.826e+08        stress-ng.signest.ops
   6646641            -4.1%    6374889        stress-ng.signest.ops_per_sec
    147.25            -3.8%     141.70        stress-ng.time.user_time


***************************************************************************************************
lkp-spr-r02: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-spr-r02/sigill/stress-ng/60s

commit: 
  0ecd56573c ("ext4: Avoid entering writeback paths during fastcommit replay")
  82e9343260 ("nsfs: keep namespace tree fields stable until after RCU grace period")

0ecd56573c1f272c 82e9343260dfc6dda6349f285d9 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 3.977e+08            -3.6%  3.835e+08        stress-ng.sigill.ops
   6645057            -3.6%    6408021        stress-ng.sigill.ops_per_sec


Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


