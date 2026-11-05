Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793840695;
	b=T2P2r9WhFUnHFBJRhBYsUzFot8Bk1bdUTz31gScO4WdLFEDTwYjJcqISLiuVuNZ1IASr
	 CHm75Cur4PKkM0gN/TgjXPWznlmTh74uO1fdyUBTLfCGXF3d+FURjObs18+NQo3755peN
	 OcFPCnfKZgUWVWydNnEzkZAhgMoxhNQUk8iXFaP1O0f/BLuuDz3omuOBrUUfiXkakNVXk
	 FK51CCeZCt0085H9bJ6vzoICBxLB8i0YfGiPtZFNc6JKXuNMGpBE+oFWW1K8aqB9cDYkP
	 k6qIN7yzMRxwDRgjSPM1/aXp/y6eNaEZpD68eohweb1CaoMEZqHnhfFT14Uh/d7IwuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793840695;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=ZjklZ1XtzVupZR4jiPfWvQJ9B53VB9qvPaAAJzXaKKs=;
	b=Y4LZs9h4wEKSTAl3gB0AQlerumqyrRm54gd9M0/akgaPlZZtHPQZcVcoMJi6Bi4rqdVR
	 rMvOxH7mn2ymO6tSa3IRzToAnl+vQUuZeyZewRwxH7lvYHMyGwOr09HTNrT4Wcb7XZcgU
	 JfD8k2zGX/xPk9X5zWGo0r6FIwFe/0GnoORkaOGfY13fE3pRlDhutFCJR1ixmVmR+a9zf
	 /6aSkeUkp3z6BwkADeUi8VPtksa4ywGffpWID377/cFFoQNxSNo/F7pUs8x6MgNiQOAkg
	 vdtAohql+BvM3n5b6ZdUIksWI0AZMoyzDM3sDIjhmhnP1PG7q7HxpbvUhhzExNIR2jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jQcgUmty;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8F3606A31B
	for <oe-lkp@lists.linux.dev>; Thu,  5 Nov 2026 01:04:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA8F3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jQcgUmty
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793840693; x=1825376693;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=wC0JHPiXzKgvBgxZ+MMifGEL6SvGZg5uRWKwj3ryTJ4=;
  b=jQcgUmtyhfA60/Zt3oWVCbpc72enAztbK1iQ5rmimoUosgFEod3BOZ9O
   8jTiSYXIiHXpnQsUvfG3Q86oGq633qxCrAdM8bf67ukCIgMB3BkmQ1uLe
   y8oOFx7EceXbiidcIeMX3TGC6diM5HP0BfN11uYjaX4ZCyfg6Nq3yI8TC
   mP0NffigCsVNxseh3i7KBaYV+Dd6aEK9LAEgKjIvNpYuetn92jxYfOhp3
   T+lt9POzSZd/dSJ/RjyaLnxCJ4XRP/n3zJTo5gRxhOp32XgyPdWbkCa+R
   HVqjEKigJ6fzp2ezn/pcUIGYV9fPFa24yeQJnZzD+n+tRPKH7K5Ow3fzE
   g==;
X-CSE-ConnectionGUID: cWA8y9AjTNKPsOiLpNINRw==
X-CSE-MsgGUID: el1JURlMTs2dEL3Fd6V/Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2500095"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2500095"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 17:04:52 -0800
X-CSE-ConnectionGUID: Hqpe9KkhSxqKXnx+RqoeBQ==
X-CSE-MsgGUID: ad0CjgkpS0+KFjfau5iIfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="6875882"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 17:04:50 -0800
Date: Thu, 5 Nov 2026 09:04:47 +0800
From: kernel test robot <yi1.lai@intel.com>
To: Kyle Zeng <kylebot@openai.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
	Lukas Maar <lukas.maar@tugraz.at>, linux-kernel@vger.kernel.org,
	tglx@kernel.org, mingo@redhat.com, outbounddisclosures@openai.com,
	Kyle Zeng <kylebot@openai.com>, yi1.lai@intel.com
Subject: Re: [PATCH v2] futex: Use a keyed hash for global futex buckets
Message-ID: <202611050816.9e42490c-lkp@intel.com>
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
In-Reply-To: <20261019183334.29433-1-kylebot@openai.com>


Hello,

kernel test robot noticed a -6.0% regression of will-it-scale.per_thread_ops on:


commit: c44a057178cbedbc04c63404258524975e87a64f ("[PATCH v2] futex: Use a keyed hash for global futex buckets")
url: https://github.com/intel-lab-lkp/linux/commits/Kyle-Zeng/futex-Use-a-keyed-hash-for-global-futex-buckets/20261019-113334
patch link: https://lore.kernel.org/all/20261019183334.29433-1-kylebot@openai.com/
patch subject: [PATCH v2] futex: Use a keyed hash for global futex buckets

testcase: will-it-scale
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 512G memory
parameters:

  nr_task: 100%
  mode: thread
  test: futex2
  cpufreq_governor: performance


If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yi1.lai@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202611050816.9e42490c-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20261105/202611050816.9e42490c-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-14/performance/x86_64-rhel-9.4/thread/100%/debian-13-x86_64-20250902.cgz/lkp-spr-2sp5/futex2/will-it-scale

commit: 
  0fcb05b723 ("Merge tag 'libcrypto-fixes-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux")
  c44a057178 ("[PATCH v2] futex: Use a keyed hash for global futex buckets")

0fcb05b72344f408 c44a057178cbedbc04c63404258
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 7.026e+08            -6.0%  6.607e+08        will-it-scale.224.threads
   3136755            -6.0%    2949754        will-it-scale.per_thread_ops
 7.026e+08            -6.0%  6.607e+08        will-it-scale.workload


Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


