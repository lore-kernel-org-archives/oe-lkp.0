Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793926905;
	b=0o4WZ4FQyGiJ8iMwOIBO+NzXgC00lSVmTHu7ht0cIT+Dsm1ij3P6hBwZRiK2OjY3Z2en
	 MlohePd07rY0m9lDzGk2SR+D7xJ+FYBCHoecdPppQ4eqvB2uh8PEJ/YsNj05CMSk/06PB
	 aDNyt09K/MB6gjoakLJ6AU8chpjy3E2egaBZBblp1cmFifBcjYu2t9IqyR7rb+TZflK9c
	 ZZLbaMHtSfQ8q5V2fb+mxIxZxgN20epcvirh4PbzGtFhv/X4w4u6U8sZfmwoY8sQhPN1U
	 OPalqHaN99p9sMaCU1uPRw2Q4h9zrZRSFxlc/L83Xr5iCZzb0/fEM2XbNx5htfBKqmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793926905;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=VGB1N91OrRVxM418j3U4Eg1a7qSw+E2WCwXs9zxL8Xg=;
	b=ITXxR3CexYK8+tTP73cREovqnMosoAbVc/g5dknU2a7il7TfCM8JhG0X+YJc3lmeAlX7
	 rIZFHbqbpezyCcM4r17KYY4l0wlq5jeeI5C2v9U1Pw2IOWWFUW4A4Zjl1vv8Ix3h+/du6
	 jWsboFHHdPfVoNIBfPGXD3hQWuO+9FBbbo9cNGV8RD5jcFwT9UM8QLtIBhLa8/EU8BkqJ
	 6BjqHTCDLnZYxlBRpeB1vfm0gGOPw3HqG1wiEUlCrIAd/J9ssr+zABEk1wbX4MqMFTS1X
	 3PVrXyfcR7DoMgKB60vcX29LPWjorEmqeuwgH8VVqV+RWcMT08njNbCox/ClZrLr9Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="l/QDtNTd";
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897C5606A326
	for <oe-lkp@lists.linux.dev>; Fri,  6 Nov 2026 01:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 897C5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l/QDtNTd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793926904; x=1825462904;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=sK93C0hjcPIDsCisxELiH3uFUygQiikRATGgdib/NGc=;
  b=l/QDtNTdW1885m4knFDuoSSWEO7rWtcigIiiIvjQcLLzeuPGtos+nd6G
   FRj7g+3W5vPzJwCJY7WXr9Pua/YV4L7Z7YO2GA26TCwB294OcaXQnSPIy
   7nGZDG/vSre3E/OLbUGRwaeK0V3lHZ/wkTncMd4+W7iET2yx9g8wW0LiF
   qONZhp6/qI+fiWPrQLfsJb+23bfG1mDBp2OzF2AOQnJuXxbK4hJh5+lEj
   K2NXCE3gKH3zVfudkGhm/2ScApHBnJ7gzCw7fZ2fGtyl7fHJnhMYp3i0j
   xpQ6mFsUv4ufCAR3xSga3VtvN2VoAPxdzVs3KQYeZrucweZl+Hg+wmrZh
   Q==;
X-CSE-ConnectionGUID: wMpRvrqyQDOOA3BiOxQ46g==
X-CSE-MsgGUID: WNIilBWwSqqBBzkxwmX85g==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2752791"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2752791"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 17:01:43 -0800
X-CSE-ConnectionGUID: ppxUl7HUSne6cIdLerpzTw==
X-CSE-MsgGUID: 1NC1sPh/QYuI2UkyAugkfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7055412"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 17:01:41 -0800
Date: Fri, 6 Nov 2026 09:01:38 +0800
From: kernel test robot <yi1.lai@intel.com>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>,
	linux-fsdevel@vger.kernel.org, yi1.lai@intel.com
Subject: [linus:master] [fs]  161ce1e692:  will-it-scale.per_process_ops
 113.3% improvement
Message-ID: <202611060127.79124a4f-lkp@intel.com>
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

kernel test robot noticed a 113.3% improvement of will-it-scale.per_process_ops on:

commit: 161ce1e692d01ddec0522f24a29535ac59a3afaf ("fs: avoid spurious dentry ref/unref cycle on open") https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

testcase: will-it-scale
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 192 threads 2 sockets Intel(R) Xeon(R) 6740E  CPU @ 2.4GHz (Sierra Forest) with 256G memory
parameters:

	nr_task: 100%
	mode: process
	test: open3
	cpufreq_governor: performance

Details are as below:
-------------------------------------------------------------------------------------------------->

The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20261106/202611060127.79124a4f-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-14/performance/x86_64-rhel-9.4/process/100%/debian-13-x86_64-20250902.cgz/lkp-srf-2sp2/open3/will-it-scale

commit: 
  v7.3-rc1
  161ce1e692 ("fs: avoid spurious dentry ref/unref cycle on open")

        v7.3-rc1 161ce1e692d01ddec0522f24a29
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    582504 ±  4%    +113.3%    1242579 ± 18%  will-it-scale.192.processes
      3033 ±  4%    +113.3%       6471 ± 18%  will-it-scale.per_process_ops
    582504 ±  4%    +113.3%    1242579 ± 18%  will-it-scale.workload
      0.14 ±  3%      +0.0        0.18 ±  9%  mpstat.cpu.all.usr%


Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


