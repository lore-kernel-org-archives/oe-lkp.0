Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795075317;
	b=nIYMTcQ6y8PcFJZ10s2xJd9Euah8zmTc1s/CE2tVpEdmSJqZO4UsjQWO9TXaxHxc+7QH
	 YTivuoRCCz600BNbWZKHubg0bH+iWDWQzCCsJxDcXfC6ZtEmLgQeh+NcgZK6BWx4OonKU
	 yjqsZGUkrE604FJ9q3puhOYN5I011/+JU3OdqF6bgg+30Iu7r3WKi0oHGPZ4hhWGuAov9
	 s34asMDie8D5J1d5Sa5BLfU1OddF5AXkjklNNa4kOzgAMPZfN/4JvjUP1mqh5vwkOQ9/2
	 ztP8WLy7riKCb0zJsPjIgItaRmGSYEh7mR7zG1dsraoYLuGJcrn/3oi36Rek9d9mOqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795075317;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=4p4KggojW3gw+ynucO6keC/RHS48WHwJWTuIPwfR82Q=;
	b=wFlBzZ5SsoBxrnq8/HseJSo27AaYQvLiP1uhJ9rWkEUJVf31WkezfJtRD/bdaR3btBD8
	 UVkEySQfxgnMu8A7k535og4u+ZCOlW9ZulzxmUdbqpejAiXsbJKcrFBey0znzbRemCOGt
	 d6Ta1WbH5KfOIu+3iskNv2NvqFdZ9WEPNP5eqq7SNJs+Y+lNSTolhTC9prrUuUo1FYvjQ
	 dJEbaysVMpkaOc3QFGOlfppvKI7+iK3/5I5/AbYKTSlaZA8P2w7sO8oYLU6180nGPyWOo
	 UFFs7Fgp03ffXexyY5bXRwPj9KGOWQeoXuEM/RxlczuuAPrIX90hh/gcjWQenah6+IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="i/Z5vHeL";
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A372C606A33F
	for <oe-lkp@lists.linux.dev>; Thu, 19 Nov 2026 08:01:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A372C606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i/Z5vHeL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795075317; x=1826611317;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=SW+nSXupzRSi0LSpp5nU2OtG3gFfZgoM7yD7TC9bB0A=;
  b=i/Z5vHeLCr9eE78hDyXFoaoWoC0gNuSJ2yWCo4I7M8XCLUXmeW1QtRr4
   T6TacPcQwQtuW/Luit3pguTy8usgoSpVxvDZSnJ7THCdx1DxGptPepKqg
   fOVwBHXJCZsalOYCnAEgPDIfdIsoY7AcRvEM7WJY+ua6zpuy6bs32TL/l
   m/jIb725jnAPomfMYRX1HTOwanO6Qm0mKCU7mBzkmBypTb4wenJNhn9l0
   kqR7zmn5/8YmgyxdANVGejJlpez3NBRYj5Z+YSgK82JKEhtNXbhkGRjnX
   L0f36wBAQcsKXk8VEJfXToAFGJJPdUJ2nY4NaLKtCusBG5q8LQ0hooo+N
   Q==;
X-CSE-ConnectionGUID: HFfmEfxCQKCj/5kQtRKhyA==
X-CSE-MsgGUID: AdSmrc5dQPajF2Oui6K4JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3910758"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3910758"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 00:01:56 -0800
X-CSE-ConnectionGUID: ZRezsXZMSK+nYkHgDWZ6vg==
X-CSE-MsgGUID: 2gn+ks/LRn+oy04G5k3UDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10701011"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 00:01:53 -0800
Date: Thu, 19 Nov 2026 16:01:50 +0800
From: kernel test robot <yi1.lai@intel.com>
To: Hengyu Liang <hengyul@cs.unc.edu>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	David Sterba <dsterba@suse.com>, Qu Wenruo <wqu@suse.com>,
	Filipe Manana <fdmanana@suse.com>, linux-btrfs@vger.kernel.org,
	yi1.lai@intel.com
Subject: [linus:master] [btrfs]  16b8f07d1e:
 stress-ng.inode-flags.ops_per_sec 89.3% improvement
Message-ID: <202611190824.7d8fe82f-lkp@intel.com>
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

kernel test robot noticed a 89.3% improvement of stress-ng.inode-flags.ops_per_sec on:


commit: 16b8f07d1ed50d4a8da468b56484873784dd8f4a ("btrfs: fix chattr failing on nodatasum files that have the compress flag")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 224 threads 2 sockets Intel(R) Xeon(R) (Sapphire Rapids) with 128G memory
parameters:

	nr_threads: 100%
	disk: 1SSD
	testtime: 60s
	fs: btrfs
	test: inode-flags
	cpufreq_governor: performance


Details are as below:
-------------------------------------------------------------------------------------------------->

The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20261119/202611190824.7d8fe82f-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/disk/fs/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/1SSD/btrfs/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-spr-2sp3/inode-flags/stress-ng/60s

commit: 
  58e844c3ba ("btrfs: fix use-after-free on quota enable allocation failure")
  16b8f07d1e ("btrfs: fix chattr failing on nodatasum files that have the compress flag")

58e844c3ba387ceb 16b8f07d1ed50d4a8da468b5648 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    204635           +89.2%     387239        stress-ng.inode-flags.ops
      3409           +89.3%       6454        stress-ng.inode-flags.ops_per_sec
   4400053 ± 12%     -96.0%     175237 ±  5%  stress-ng.time.file_system_outputs
     30530 ±  3%   +2174.3%     694344        stress-ng.time.involuntary_context_switches
    181230 ±  2%      +4.4%     189263        stress-ng.time.minor_page_faults
      1174         +1503.6%      18832        stress-ng.time.percent_of_cpu_this_job_got
    673.93         +1574.9%      11287        stress-ng.time.system_time
  23712987           -60.1%    9463627        stress-ng.time.voluntary_context_switches


Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


