Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115E063A9
	for <oe-lkp@lists.linux.dev>; Wed, 17 Apr 2024 05:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713332493; cv=fail; b=F69IL4ZgFFgwFyJvSxDyQb46EHm5TkOCqkU4Nu2WLNH4lQhHruKJYhKPTrelQjexzkqy06P9Kzmk3H8Ckr/WSim+WrWnTHzN+Cc8XmHgLeRmVO2QYZmnPp8ydZkdscA8vNrkNBB3FjrAlCYCTv8CL5NnApsxBnk2nnqbJXmQty4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713332493; c=relaxed/simple;
	bh=aG6GAbRT/67ff/lErlL6kOKJAJKWFMCrIaUflCycubk=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=gnzraVPbhs4jKp/7w93CAL2lyrjcZkdHxX2jw8VDNA7/XOymeuERL1OA039TggmxjiY9teSplzF/MAv487ZFYsKlnuT26k870dtebLAa5w3WMP/7cMLi0pDtQEi5oI+aX2RXL3ES9FPlz7yL5h5raywdV9BabMezOenVUCTK3/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hvsXYl/Q; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hvsXYl/Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713332487; x=1744868487;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=aG6GAbRT/67ff/lErlL6kOKJAJKWFMCrIaUflCycubk=;
  b=hvsXYl/QNRa3NONMdTO0sjdNtym9zB7vfk4Wpu/8guqEhIJ91Bbqnk0G
   cZVeBHF6VSCWNVJkwd9GEeeFV0rOfdQNqCcV9tHg0a4hkG1/dmrGO6WIv
   amuhybpGz4EXv73Rynd6HZFHYJJZIE9Z46n3/n4ZlmMlOQf8j6nK8MESl
   ptnyXUw9YKPz0B4vTShr62XUca8RpQY2DGxoKdkyGjBhZaMZKQguIV261
   WL9/ShzbpBBPG6cIoXC/8OWO1norQa35aX0uYiMrRwEf12jEfpNLGMmqj
   Mciz2u2NMwGXnoBFJJGlo5ixggv6Fv4yRxZvujWmmeKp+o09KhGeNPz9T
   Q==;
X-CSE-ConnectionGUID: PZfIuV7/Skyaf3dzMtJn8Q==
X-CSE-MsgGUID: XY6yHIL5SDiv5k92YY1ICQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8688039"
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="8688039"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 22:41:25 -0700
X-CSE-ConnectionGUID: arpyRvGnTFiHH1lIt5gDXw==
X-CSE-MsgGUID: D0g7EqiHTqW7puj4/APvMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="53475915"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 16 Apr 2024 22:41:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 22:41:24 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Apr 2024 22:41:24 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Apr 2024 22:41:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X79Puizk7JIEIa8unFtvHn/9riY2eXs7aAvoqNRnof6Wk4QnazbRgHNK0WBcWC335ADz6xFXzYs1/je/wOdRXAmDtt286Ta1MWXYzCXmJkUR4tZx1ycvk/snS/pzCT8ghybHozR2fiaLXefFKRdsTTpuzOtuu4AX9Sp9Pmv6QavStAw0IpHZDKDIjXuu4+LSDKife9sBla5CIL6/nrG/HojDkL8ZccNG9JMw90m2d9nSXzlgQVeFxaXpvZ+Sr3sp4V9TxtqG/PyWP+Qc4vFrCm/1NZDRwgi5F25YBcV3WSYJo2ubeb70IFDkDNFLn3D6/FPiyBIhRFeUGHeQM8muQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FSF+EF+fOZHp9zz9aNIZVx6535nuJ2AHYwNa18K72aA=;
 b=KVWkEdQQb8VpMdp8GVK2zRvAXWoiz7vmz2wSQdUmvn9jpEb65sHVQvFV6rlWT8Zmx6GgrM1Pc21H4lHB+craQnOSRXNZ8hiuv8Ep/4Zy/eXzgHO7EovKgFkbEWCJRgYLHemQhNUf+byeKe/VtOkEBnv7LG3U7mwDxqQJcYxqInoi0IB8oiACXaaT3bkhZyjocXBGQexzqrU1h0W9XGEAW2NeUukiCdkavZtbKgMhEolitYtm69rvVZULl+cUUK6eSxufu/UOVuzit7ADVd609YYx+yMr6GsLSz/B+/tRShpGqnJoWvXJzgQ31ZRJubraBNtk8UbGn2XvT8MYtQULJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by IA1PR11MB7727.namprd11.prod.outlook.com (2603:10b6:208:3f1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.37; Wed, 17 Apr
 2024 05:41:15 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e%3]) with mapi id 15.20.7472.025; Wed, 17 Apr 2024
 05:41:15 +0000
Date: Wed, 17 Apr 2024 13:41:08 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [tglx-devel:timers/posix] [posix]  71cc52f552:
 stress-ng.timer.ops_per_sec -50.6% regression
Message-ID: <202404171204.63092e23-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0037.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::13) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|IA1PR11MB7727:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b051fe9-61d1-4ef6-516f-08dc5ea0ff20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8B1Zf/mxGpXYORLB8Ir1Fw2Y4VJAG2Okl9KJrjgzPBqbjRlL9KSXGIfnQUkU+P8mRzD/pkWwgLn/bxbXESUe1ODmoPqsw8EUvUsnwB73NFyk2eB2bYVxwwmotLMdX+6SKRho5TZJJ87btAy8wybf+4uE2lCMTqVkULVINoIYRnfybeTr4lNDLODZ+CwoxQBtoTgFlSiNnAx55UJd3wV2VHJ1GqxnFA5kRxMi3GER7ahdZ7j3zddAGb7uRkVKCHkEZZpw+ituoFEKwAGXQpM25yEWAV5FKjAOdBdfH8X1uZOGKIXxxZysCIiIg2iIigvt88LBNKioHamoXr0CPhN1xMi1JVtAZcQp4VfK7Xz62rBrZCWeKpDBPytcNsNFEkCdomLJxjQpDD4naFQmsj52gl9Yaf4uOAtWIOsNrOuzrXAnLPlwbqJ63ylhlJ0NdBLWrhtnmtHFL0x1fHkosBmdkYLVDOctCNZ1Qd+K94kxxGF3bpN6bWovM2SE6HAzfcqQxkfeT2VbO3+T89qHqyJIycEWxxjcabasmLCIK7PulYQGPSgJnAFb0XmwI61nR/77/vapmlhXyZXTB6vtKaTCOnFMRvdyIB0EfjZmURNrdR6SGQEijfc+sNRI0ZfoPV03
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?+9Gh3bAUBFNaKVWXr9XRxrXHx3BM0mbX15EIZwztYE80+yBMm32cvRsIFD?=
 =?iso-8859-1?Q?UTNaM4s2vIQaDgtGv8tkMZZD2YgdxhMxvS/HUdMsVo424hFjPxZ0kEKbRJ?=
 =?iso-8859-1?Q?aO1ELGEJyaVh07MZVLuhiESsGOB3249GXH78aL0yvsCxniSUK/R7bF8l9M?=
 =?iso-8859-1?Q?LVnVOE+tK25GxijfxzLGd93FzHj9sY2jyc1aoPU0vRM+3R3zu8pBszNPiG?=
 =?iso-8859-1?Q?Wic6zfogo3pggtp31/OkxCjJBw+Rv8Cxr85YQi5Ml0RrQ01pe50L+7rEfi?=
 =?iso-8859-1?Q?2pZX1NHkCoVPS4Cpg6f4/VQ8NfvEmzMJn6Hbo+RdcMoMYmfJQZ4e0KKbn2?=
 =?iso-8859-1?Q?u+WqIRMQK5eTP/RZoELP1XGA9XGtI1xnjaJpMNHHG+rpeUK/I3u2J3/jD5?=
 =?iso-8859-1?Q?Wru2RO0mRDviAVL0pNFXTpRu73Wkt196m5R59LvP/0Fs+NW37JTPzpMwyt?=
 =?iso-8859-1?Q?waSh0bNmGfvxcAdetMz9p/3kYIekbgh46K7TjPIjEGANm/o9PTg2PXCgXX?=
 =?iso-8859-1?Q?gL9ZvgYPjw3aQXTxzg78zi0TbS9ErwMDB9GU0THQIApwlKxUYGuNqjF6Bi?=
 =?iso-8859-1?Q?ucG3JKiXFHapWVpdcG9nxvIB1bmwrP0MWifXIu1uiQ3FbO5dO/H0acGYyH?=
 =?iso-8859-1?Q?iIyY9vo7JtWuTbCOK5P85BjKCBvFBSMfWRbudJdF31wQ+lQAo2S/CnIBn7?=
 =?iso-8859-1?Q?jZEVMdpuKdLT8OMj0nVp4XWyBMiv7VLysHZu9gtOgYNCWTDSPabQbV5QUf?=
 =?iso-8859-1?Q?s5zEB8TFpgtLF5XEy5OoyxpnpI1WL2pXGltorkZuoWRza0DAVJqZcyQnEc?=
 =?iso-8859-1?Q?sArUJGiE1HPBtsk1VvryOHAKV3tqy/In0L89o8yx+EfnXBU0KShiUSD5pN?=
 =?iso-8859-1?Q?s6mIb2EUu3l0UNEjb5Vw7r5Ki84N7qVs9CqxNyPXcNTr3Cr7UMt7GKT0JJ?=
 =?iso-8859-1?Q?CvvK5T6P9vE/qfgqJrHBzGW4gjch/QuUy1uq+LADDnzpQUFl6KPk4E4MiV?=
 =?iso-8859-1?Q?Jyfgl+BCHUcaD/trortISO2cs9TrnWNsyZdCiKqi8pIFF3NKceORPsk5/k?=
 =?iso-8859-1?Q?PkEMoiaEc1N6vTDZmeQw0rWfYSK4v53eGLQoDzbyTZsVd6LuefUeOD7atW?=
 =?iso-8859-1?Q?b1IANYpoOWoB48yGS2HTNOsWKJxkjv+dXUkMPlT2Y1ngINJfemsuxU/nUb?=
 =?iso-8859-1?Q?n+RZjuacUxGx9xzoATH/eU8BLAeHRBNZcjaLqwhaNau1L99GCq0ATRXp9j?=
 =?iso-8859-1?Q?3H5SkoHDNmpn1vXizYlzaphmqjkxgXO6EDcOeKAajwJAimCCZfgMpiVW5S?=
 =?iso-8859-1?Q?Du3+SlvnWr6kxf/DAySNUwUliy3fU4tXwQ1rIoFLRjEA5qDMLXu51frdUn?=
 =?iso-8859-1?Q?GJt7snXLgdogVl4MC1v/s9aECk+IUXClxZmwx+ZtiBCH2gD4eAcrz/KhY1?=
 =?iso-8859-1?Q?IuRzCZLhmiwc34/Wn/vGFuc2XU5szzS6kLVCrJbePjgnsCOQhaYLkCSagE?=
 =?iso-8859-1?Q?LOsy/VE+nEurQhxVCeXLlcCDC71M4ulJqzePx+QdA/LLnqa3mdm8gxuMRl?=
 =?iso-8859-1?Q?ZKQw568ryiJOreG9sHTi7zxGON0MByejAjrrGyn8AGURRQf42TegqQMfwo?=
 =?iso-8859-1?Q?BV0MXlHjRrzIrQhWFeEG/p8I2RZQ89DehYYuchnqYSvMHY47ZmJnYwHw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b051fe9-61d1-4ef6-516f-08dc5ea0ff20
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 05:41:15.3867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fnzx2+DbrIztGBW1CSKXAl9AQSkpj2gBHX4XmPmhscxohZKzZT+cRmIVEjsKgQaE1g/dfw6uBqMbbhdeirTGpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7727
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a -50.6% regression of stress-ng.timer.ops_per_sec on:


commit: 71cc52f552ea8520d8bd7bec132853e9ff8dd6de ("posix-timers: Make signal delivery consistent")
https://git.kernel.org/cgit/linux/kernel/git/tglx/devel.git timers/posix

testcase: stress-ng
test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 512G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: timer
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+-------------------------------------------------------------------------------------------+
| testcase: change | stress-ng: stress-ng.timer.ops_per_sec -58.1% regression                                  |
| test machine     | 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory |
| test parameters  | cpufreq_governor=performance                                                              |
|                  | nr_threads=100%                                                                           |
|                  | test=timer                                                                                |
|                  | testtime=60s                                                                              |
+------------------+-------------------------------------------------------------------------------------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202404171204.63092e23-oliver.sang@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240417/202404171204.63092e23-oliver.sang@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-13/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/lkp-spr-2sp4/timer/stress-ng/60s

commit: 
  9b5f919dc6 ("posix-timers: Add proper state tracking")
  71cc52f552 ("posix-timers: Make signal delivery consistent")

9b5f919dc6ac5ca1 71cc52f552ea8520d8bd7bec132 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      3588 ± 41%     +99.7%       7164 ± 14%  perf-c2c.DRAM.local
    780156 ± 15%    +270.0%    2886190 ±  9%  numa-numastat.node1.local_node
    900988 ± 13%    +235.1%    3019218 ±  6%  numa-numastat.node1.numa_hit
      4.76 ± 13%    +109.8%       9.98 ±  6%  vmstat.cpu.us
    214.79            -8.4%     196.68        vmstat.procs.r
      6333 ±  4%  +4.1e+05%   25898660 ± 12%  vmstat.system.cs
     15.00            +6.7       21.66 ±  2%  mpstat.cpu.all.irq%
      0.00 ± 61%      +0.3        0.29 ± 14%  mpstat.cpu.all.soft%
     76.97           -11.4       65.61        mpstat.cpu.all.sys%
      4.90 ± 12%      +5.4       10.26 ±  6%  mpstat.cpu.all.usr%
      3.00          +505.6%      18.17 ± 71%  mpstat.max_utilization.seconds
    171764 ± 61%    +224.2%     556785 ± 16%  numa-meminfo.node0.Mapped
   1667162 ± 75%    +329.5%    7160853 ± 15%  numa-meminfo.node1.FilePages
    683442 ± 30%    +859.3%    6556594 ±  6%  numa-meminfo.node1.Inactive
    683369 ± 30%    +859.4%    6556486 ±  6%  numa-meminfo.node1.Inactive(anon)
    320855 ± 33%    +241.1%    1094484 ± 20%  numa-meminfo.node1.Mapped
   3429031 ± 35%    +165.2%    9095271 ± 12%  numa-meminfo.node1.MemUsed
    780168 ± 19%    +749.1%    6624356 ±  7%  numa-meminfo.node1.Shmem
     43280 ± 61%    +219.7%     138374 ± 16%  numa-vmstat.node0.nr_mapped
    416759 ± 75%    +330.0%    1792177 ± 15%  numa-vmstat.node1.nr_file_pages
    170953 ± 30%    +859.5%    1640269 ±  6%  numa-vmstat.node1.nr_inactive_anon
     81000 ± 32%    +237.9%     273703 ± 20%  numa-vmstat.node1.nr_mapped
    195010 ± 19%    +750.2%    1658053 ±  7%  numa-vmstat.node1.nr_shmem
    170952 ± 30%    +859.5%    1640266 ±  6%  numa-vmstat.node1.nr_zone_inactive_anon
    899610 ± 13%    +235.5%    3018345 ±  6%  numa-vmstat.node1.numa_hit
    778778 ± 14%    +270.5%    2885317 ±  9%  numa-vmstat.node1.numa_local
     85208 ±  2%  +11137.7%    9575388 ± 15%  stress-ng.time.involuntary_context_switches
     78190            -1.6%      76963        stress-ng.time.minor_page_faults
     18676           -16.7%      15554        stress-ng.time.percent_of_cpu_this_job_got
     10649           -23.2%       8179 ±  2%  stress-ng.time.system_time
    617.52 ± 13%     +92.6%       1189 ±  5%  stress-ng.time.user_time
     85065 ± 14%  +9.6e+05%  8.155e+08 ± 11%  stress-ng.time.voluntary_context_switches
 4.594e+09           -50.6%  2.269e+09 ±  2%  stress-ng.timer.ops
  76553270           -50.6%   37822112 ±  2%  stress-ng.timer.ops_per_sec
    616562 ±  3%     -23.3%     472875 ±  5%  meminfo.Active
    616530 ±  3%     -23.3%     472843 ±  5%  meminfo.Active(anon)
   4005527          +155.3%   10227471 ±  2%  meminfo.Cached
   3586752          +176.5%    9916384 ±  3%  meminfo.Committed_AS
   1122808 ± 17%    +563.2%    7446291 ±  4%  meminfo.Inactive
   1122597 ± 17%    +563.3%    7446079 ±  4%  meminfo.Inactive(anon)
    492458 ±  8%    +234.7%    1648358 ± 13%  meminfo.Mapped
   7553002 ±  3%     +88.7%   14250194 ±  2%  meminfo.Memused
     25526 ±  2%     +10.4%      28185 ±  3%  meminfo.PageTables
    929680          +669.3%    7151624 ±  4%  meminfo.Shmem
   7997833 ±  3%     +79.5%   14354660 ±  2%  meminfo.max_used_kB
      0.14 ± 35%     +88.3%       0.27 ± 44%  perf-stat.i.MPKI
  47187055 ± 38%    +121.5%  1.045e+08 ± 38%  perf-stat.i.cache-misses
 1.116e+08 ± 34%    +142.1%    2.7e+08 ± 32%  perf-stat.i.cache-references
      6411 ±  5%  +4.2e+05%   26920349 ± 11%  perf-stat.i.context-switches
    468.76 ±  6%   +6155.0%      29320 ± 40%  perf-stat.i.cpu-migrations
     16193 ± 40%     -56.5%       7045 ± 30%  perf-stat.i.cycles-between-cache-misses
      2.17 ±  4%   +5408.1%     119.29 ± 11%  perf-stat.i.metric.K/sec
     11633 ±  2%     +72.5%      20062 ±  4%  perf-stat.i.minor-faults
     11633 ±  2%     +72.5%      20062 ±  4%  perf-stat.i.page-faults
      0.13 ± 40%    +100.5%       0.25 ± 47%  perf-stat.overall.MPKI
     15911 ± 38%     -56.7%       6883 ± 29%  perf-stat.overall.cycles-between-cache-misses
 6.727e+10           +16.1%  7.812e+10 ±  6%  perf-stat.ps.branch-instructions
  45955262 ± 38%    +121.6%  1.018e+08 ± 38%  perf-stat.ps.cache-misses
 1.084e+08 ± 35%    +143.6%   2.64e+08 ± 32%  perf-stat.ps.cache-references
      6133 ±  5%  +4.3e+05%   26354419 ± 11%  perf-stat.ps.context-switches
    445.94 ±  6%   +6363.7%      28824 ± 40%  perf-stat.ps.cpu-migrations
     10959 ±  2%     +74.4%      19111 ±  3%  perf-stat.ps.minor-faults
     10959 ±  2%     +74.4%      19111 ±  3%  perf-stat.ps.page-faults
    154488 ±  3%     -23.7%     117851 ±  4%  proc-vmstat.nr_active_anon
  12922936            -1.3%   12755836        proc-vmstat.nr_dirty_background_threshold
  25877469            -1.3%   25542860        proc-vmstat.nr_dirty_threshold
   1001772          +155.2%    2556222 ±  2%  proc-vmstat.nr_file_pages
   1.3e+08            -1.3%  1.283e+08        proc-vmstat.nr_free_pages
    280703 ± 17%    +563.1%    1861289 ±  4%  proc-vmstat.nr_inactive_anon
    123510 ±  8%    +234.4%     413000 ± 13%  proc-vmstat.nr_mapped
      6382 ±  2%     +10.6%       7056 ±  3%  proc-vmstat.nr_page_table_pages
    232810          +667.7%    1787259 ±  4%  proc-vmstat.nr_shmem
     37632            +9.2%      41098        proc-vmstat.nr_slab_reclaimable
    113381            +1.5%     115054        proc-vmstat.nr_slab_unreclaimable
    154488 ±  3%     -23.7%     117851 ±  4%  proc-vmstat.nr_zone_active_anon
    280703 ± 17%    +563.1%    1861289 ±  4%  proc-vmstat.nr_zone_inactive_anon
     66975 ± 17%    +394.9%     331460 ±  5%  proc-vmstat.numa_hint_faults
     34515 ± 15%    +506.8%     209446 ± 11%  proc-vmstat.numa_hint_faults_local
   1364426          +169.2%    3673557 ±  3%  proc-vmstat.numa_hit
   1132545          +203.9%    3441534 ±  3%  proc-vmstat.numa_local
    191745 ± 10%     -40.5%     114009 ± 12%  proc-vmstat.pgactivate
   1484934 ±  4%    +152.6%    3750917 ±  3%  proc-vmstat.pgalloc_normal
    801693           +62.9%    1305662 ±  3%  proc-vmstat.pgfault
    998209 ±  5%     -32.0%     678713        proc-vmstat.pgfree
   6320289           -26.0%    4676258 ±  2%  sched_debug.cfs_rq:/.avg_vruntime.avg
   6616510           -13.6%    5714746 ±  4%  sched_debug.cfs_rq:/.avg_vruntime.max
      0.50          -100.0%       0.00        sched_debug.cfs_rq:/.h_nr_running.min
      0.16 ± 12%     +79.2%       0.29 ±  5%  sched_debug.cfs_rq:/.h_nr_running.stddev
      0.00        +3.4e+13%     336215 ± 23%  sched_debug.cfs_rq:/.left_deadline.avg
      0.00        +4.9e+14%    4890556 ±  2%  sched_debug.cfs_rq:/.left_deadline.max
      0.00        +3.4e+13%     336188 ± 23%  sched_debug.cfs_rq:/.left_vruntime.avg
      0.00        +4.9e+14%    4890210 ±  2%  sched_debug.cfs_rq:/.left_vruntime.max
      2305          -100.0%       0.00        sched_debug.cfs_rq:/.load.min
      2504 ±  9%   +1412.4%      37875 ± 77%  sched_debug.cfs_rq:/.load.stddev
   6320289           -26.0%    4676258 ±  2%  sched_debug.cfs_rq:/.min_vruntime.avg
   6616510           -13.6%    5714746 ±  4%  sched_debug.cfs_rq:/.min_vruntime.max
      0.50          -100.0%       0.00        sched_debug.cfs_rq:/.nr_running.min
      0.11 ±  7%    +148.8%       0.28 ±  5%  sched_debug.cfs_rq:/.nr_running.stddev
      0.00        +3.4e+13%     336188 ± 23%  sched_debug.cfs_rq:/.right_vruntime.avg
      0.00        +4.9e+14%    4890210 ±  2%  sched_debug.cfs_rq:/.right_vruntime.max
    580.14           -13.4%     502.48        sched_debug.cfs_rq:/.runnable_avg.avg
    143.62 ±  6%     +17.8%     169.22 ±  5%  sched_debug.cfs_rq:/.runnable_avg.stddev
    576.73           -13.7%     497.44        sched_debug.cfs_rq:/.util_avg.avg
    140.41 ±  9%     +18.3%     166.10 ±  5%  sched_debug.cfs_rq:/.util_avg.stddev
    508.13           -21.3%     399.87 ±  2%  sched_debug.cfs_rq:/.util_est.avg
     70.25 ± 52%    -100.0%       0.00        sched_debug.cfs_rq:/.util_est.min
     90.89 ± 17%     +70.4%     154.91 ±  9%  sched_debug.cfs_rq:/.util_est.stddev
    532035           -15.6%     448852        sched_debug.cpu.avg_idle.avg
   1375072 ± 17%     -40.6%     817017 ± 26%  sched_debug.cpu.avg_idle.max
    218378 ± 10%     -55.1%      98007 ± 10%  sched_debug.cpu.avg_idle.stddev
      3543           -11.0%       3154 ±  3%  sched_debug.cpu.curr->pid.avg
      3149 ± 17%    -100.0%       0.00        sched_debug.cpu.curr->pid.min
    474.26 ±  7%    +219.5%       1515 ± 10%  sched_debug.cpu.curr->pid.stddev
      0.50          -100.0%       0.00        sched_debug.cpu.nr_running.min
      0.15 ± 15%     +77.5%       0.27 ±  9%  sched_debug.cpu.nr_running.stddev
      1669 ±  9%  +2.1e+05%    3579516 ± 11%  sched_debug.cpu.nr_switches.avg
     25130 ± 58%  +21461.1%    5418352 ± 21%  sched_debug.cpu.nr_switches.max
    322.00 ±  9%  +3.6e+05%    1144355 ± 53%  sched_debug.cpu.nr_switches.min
      2615 ± 37%  +28925.8%     759302 ± 70%  sched_debug.cpu.nr_switches.stddev
      6.28 ± 10%     +18.9%       7.47 ±  5%  sched_debug.cpu.nr_uninterruptible.stddev
     43.48 ±  3%     -35.4        8.04 ±  4%  perf-profile.calltrace.cycles-pp.handle_signal.arch_do_signal_or_restart.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
     29.36 ±  6%     -24.7        4.70 ±  5%  perf-profile.calltrace.cycles-pp.x64_setup_rt_frame.handle_signal.arch_do_signal_or_restart.syscall_exit_to_user_mode.do_syscall_64
     37.02 ±  3%     -17.5       19.52 ±  8%  perf-profile.calltrace.cycles-pp.arch_do_signal_or_restart.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
     37.30 ±  3%     -17.4       19.88 ±  8%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
     20.03 ±  3%     -16.0        4.02 ±  5%  perf-profile.calltrace.cycles-pp.get_sigframe.x64_setup_rt_frame.handle_signal.arch_do_signal_or_restart.syscall_exit_to_user_mode
     22.77           -12.2       10.58 ±  3%  perf-profile.calltrace.cycles-pp.stress_timer_handler
     10.90 ± 13%      -9.6        1.32 ±  4%  perf-profile.calltrace.cycles-pp.save_xstate_epilog.get_sigframe.x64_setup_rt_frame.handle_signal.arch_do_signal_or_restart
      9.13 ± 13%      -9.1        0.00        perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.x64_setup_rt_frame.handle_signal.arch_do_signal_or_restart.syscall_exit_to_user_mode
     11.27 ±  2%      -8.8        2.49        perf-profile.calltrace.cycles-pp.arch_do_signal_or_restart.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_timer_handler
     11.51 ±  2%      -8.3        3.17 ±  4%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.stress_timer_handler
     11.50 ±  2%      -8.3        3.17 ±  3%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_timer_handler
     11.44 ±  2%      -8.3        3.12 ±  3%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_timer_handler
      8.21 ±  3%      -6.5        1.69        perf-profile.calltrace.cycles-pp.fpu__clear_user_states.handle_signal.arch_do_signal_or_restart.syscall_exit_to_user_mode.do_syscall_64
     46.03 ±  3%      -6.0       40.00        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
     46.06 ±  3%      -5.8       40.22        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.clock_nanosleep
      5.66 ±  4%      -5.7        0.00        perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.fpu__clear_user_states.handle_signal.arch_do_signal_or_restart.syscall_exit_to_user_mode
     15.60            -5.1       10.48 ±  5%  perf-profile.calltrace.cycles-pp.timer_settime
      5.02 ± 17%      -5.0        0.00        perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.__put_user_nocheck_4.save_xstate_epilog.get_sigframe.x64_setup_rt_frame
      4.82 ± 17%      -4.8        0.00        perf-profile.calltrace.cycles-pp.__put_user_nocheck_4.save_xstate_epilog.get_sigframe.x64_setup_rt_frame.handle_signal
     12.86            -4.4        8.45 ±  8%  perf-profile.calltrace.cycles-pp.__x64_sys_timer_settime.do_syscall_64.entry_SYSCALL_64_after_hwframe.timer_settime
      8.69 ±  3%      -4.1        4.56 ±  5%  perf-profile.calltrace.cycles-pp.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
     13.45            -4.0        9.43 ±  7%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.timer_settime
     13.69            -3.9        9.80 ±  6%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.timer_settime
     46.12 ±  3%      -3.7       42.45 ±  2%  perf-profile.calltrace.cycles-pp.clock_nanosleep
      8.34            -3.7        4.66        perf-profile.calltrace.cycles-pp.common_timer_set.do_timer_settime.__x64_sys_timer_settime.do_syscall_64.entry_SYSCALL_64_after_hwframe
      5.95 ±  8%      -3.5        2.41 ±  5%  perf-profile.calltrace.cycles-pp.copy_fpstate_to_sigframe.get_sigframe.x64_setup_rt_frame.handle_signal.arch_do_signal_or_restart
     10.14 ±  2%      -3.5        6.66 ± 11%  perf-profile.calltrace.cycles-pp.do_timer_settime.__x64_sys_timer_settime.do_syscall_64.entry_SYSCALL_64_after_hwframe.timer_settime
      7.32 ±  3%      -3.5        3.83 ±  6%  perf-profile.calltrace.cycles-pp.restore_sigcontext.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
      7.12 ±  3%      -3.4        3.72 ±  5%  perf-profile.calltrace.cycles-pp.fpu__restore_sig.restore_sigcontext.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      6.95 ±  3%      -3.3        3.64 ±  6%  perf-profile.calltrace.cycles-pp.__fpu_restore_sig.fpu__restore_sig.restore_sigcontext.__x64_sys_rt_sigreturn.do_syscall_64
      5.28 ±  6%      -2.7        2.56        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
      5.85            -2.7        3.18        perf-profile.calltrace.cycles-pp.hrtimer_start_range_ns.common_timer_set.do_timer_settime.__x64_sys_timer_settime.do_syscall_64
      5.06 ±  6%      -2.6        2.44        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
      4.40 ±  3%      -2.1        2.31 ±  5%  perf-profile.calltrace.cycles-pp.restore_fpregs_from_user.__fpu_restore_sig.fpu__restore_sig.restore_sigcontext.__x64_sys_rt_sigreturn
      4.25            -2.0        2.28        perf-profile.calltrace.cycles-pp.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.93            -1.9        2.04 ±  2%  perf-profile.calltrace.cycles-pp.clockevents_program_event.hrtimer_start_range_ns.common_timer_set.do_timer_settime.__x64_sys_timer_settime
      2.12            -1.5        0.62 ±  3%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.stress_timer_handler
      2.06            -1.5        0.56 ±  3%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.sigpending
      2.95            -1.4        1.54 ±  2%  perf-profile.calltrace.cycles-pp.lapic_next_deadline.clockevents_program_event.hrtimer_start_range_ns.common_timer_set.do_timer_settime
      1.84            -1.4        0.46 ± 44%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.timer_getoverrun
      2.63 ±  4%      -1.4        1.26 ±  5%  perf-profile.calltrace.cycles-pp.__rseq_handle_notify_resume.handle_signal.arch_do_signal_or_restart.syscall_exit_to_user_mode.do_syscall_64
      1.72 ± 23%      -1.2        0.49 ± 45%  perf-profile.calltrace.cycles-pp.lapic_next_deadline.clockevents_program_event.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      2.51 ± 16%      -1.2        1.33 ±  7%  perf-profile.calltrace.cycles-pp.clockevents_program_event.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      2.31            -0.9        1.44        perf-profile.calltrace.cycles-pp.get_itimerspec64.__x64_sys_timer_settime.do_syscall_64.entry_SYSCALL_64_after_hwframe.timer_settime
      1.64 ±  2%      -0.8        0.80 ±  3%  perf-profile.calltrace.cycles-pp.restore_sigcontext.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.66 ±  3%      -0.8        0.86 ±  6%  perf-profile.calltrace.cycles-pp.check_xstate_in_sigframe.__fpu_restore_sig.fpu__restore_sig.restore_sigcontext.__x64_sys_rt_sigreturn
      1.95            -0.8        1.17 ±  2%  perf-profile.calltrace.cycles-pp._copy_from_user.get_itimerspec64.__x64_sys_timer_settime.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.21            -0.8        0.44 ± 44%  perf-profile.calltrace.cycles-pp.signal_setup_done.arch_do_signal_or_restart.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.60 ± 23%      -0.7        0.86 ± 34%  perf-profile.calltrace.cycles-pp.stress_timer
      1.45 ±  3%      -0.7        0.76 ±  5%  perf-profile.calltrace.cycles-pp.rseq_ip_fixup.__rseq_handle_notify_resume.handle_signal.arch_do_signal_or_restart.syscall_exit_to_user_mode
      1.40 ±  2%      -0.7        0.71 ±  4%  perf-profile.calltrace.cycles-pp.__get_user_nocheck_8.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.51            -0.6        0.86        perf-profile.calltrace.cycles-pp.common_hrtimer_arm.common_timer_set.do_timer_settime.__x64_sys_timer_settime.do_syscall_64
      0.96 ±  3%      -0.6        0.34 ± 70%  perf-profile.calltrace.cycles-pp._copy_from_user.restore_altstack.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.28 ±  3%      -0.6        0.68 ±  6%  perf-profile.calltrace.cycles-pp.restore_altstack.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
      0.91            -0.6        0.34 ± 70%  perf-profile.calltrace.cycles-pp.__hrtimer_start_range_ns.hrtimer_start_range_ns.common_timer_set.do_timer_settime.__x64_sys_timer_settime
      1.12 ±  2%      -0.6        0.57 ±  3%  perf-profile.calltrace.cycles-pp._copy_from_user.restore_sigcontext.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.02 ±  3%      -0.4        0.61 ±  5%  perf-profile.calltrace.cycles-pp.set_current_blocked.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.77            +0.3        2.07 ±  5%  perf-profile.calltrace.cycles-pp.__x64_sys_rt_sigpending.do_syscall_64.entry_SYSCALL_64_after_hwframe.sigpending
      2.64            +0.4        3.06 ±  4%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.sigpending
      2.37            +0.5        2.85 ±  4%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.sigpending
      0.00            +0.5        0.53 ±  6%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.stress_timer_handler
      0.00            +0.6        0.56 ±  5%  perf-profile.calltrace.cycles-pp.common_hrtimer_rearm.posixtimer_deliver_signal.dequeue_signal.get_signal.arch_do_signal_or_restart
      0.57 ± 50%      +0.6        1.16 ± 26%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__lock_timer.posixtimer_deliver_signal.dequeue_signal.get_signal
      0.00            +0.6        0.62 ±  5%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.stress_timer_handler
      0.00            +0.6        0.62 ±  5%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.__x64_sys_timer_getoverrun.do_syscall_64
      0.00            +0.6        0.64 ±  8%  perf-profile.calltrace.cycles-pp._copy_from_user.get_timespec64.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.7        0.69 ±  4%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.stress_timer_handler
      0.00            +0.7        0.71 ± 21%  perf-profile.calltrace.cycles-pp._raw_spin_lock.posixtimer_deliver_signal.dequeue_signal.get_signal.arch_do_signal_or_restart
      0.00            +0.7        0.71 ± 13%  perf-profile.calltrace.cycles-pp.__hrtimer_start_range_ns.hrtimer_start_range_ns.do_nanosleep.hrtimer_nanosleep.common_nsleep
      0.00            +0.7        0.71 ±  4%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.do_syscall_64
      0.00            +0.7        0.73 ±  5%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.__x64_sys_timer_getoverrun.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.7        0.73 ± 18%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.clock_nanosleep
      0.00            +0.7        0.74 ± 13%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.do_syscall_64.entry_SYSCALL_64_after_hwframe.timer_settime
      0.00            +0.8        0.80 ± 16%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.sigpending
      0.00            +0.9        0.88 ±  5%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.9        0.88 ± 13%  perf-profile.calltrace.cycles-pp.pick_next_task_fair.__schedule.schedule.do_nanosleep.hrtimer_nanosleep
      0.00            +0.9        0.89 ±  8%  perf-profile.calltrace.cycles-pp.get_timespec64.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
      0.36 ±106%      +0.9        1.30 ± 38%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.get_signal
      0.00            +1.0        0.98 ± 17%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.__nanosleep
      0.00            +1.0        1.03 ±  6%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.do_syscall_64.entry_SYSCALL_64_after_hwframe.timer_getoverrun
      0.00            +1.1        1.08 ± 16%  perf-profile.calltrace.cycles-pp.enqueue_entity.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_wake_up
      0.00            +1.1        1.09 ±  6%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.__x64_sys_timer_getoverrun.do_syscall_64.entry_SYSCALL_64_after_hwframe.timer_getoverrun
      0.00            +1.1        1.10 ±  5%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.stress_timer_handler
      0.40 ±106%      +1.2        1.56 ± 48%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.get_signal.arch_do_signal_or_restart
      0.00            +1.2        1.18 ± 12%  perf-profile.calltrace.cycles-pp.hrtimer_start_range_ns.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.00            +1.2        1.23 ± 16%  perf-profile.calltrace.cycles-pp.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_wake_up.complete_signal
      0.00            +1.3        1.29 ± 16%  perf-profile.calltrace.cycles-pp.activate_task.ttwu_do_activate.try_to_wake_up.complete_signal.send_sigqueue
      0.44 ±106%      +1.3        1.74 ± 47%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.get_signal.arch_do_signal_or_restart.syscall_exit_to_user_mode
      0.00            +1.3        1.30 ±  8%  perf-profile.calltrace.cycles-pp.lapic_next_deadline.clockevents_program_event.hrtimer_start_range_ns.posixtimer_deliver_signal.dequeue_signal
      0.00            +1.5        1.48 ± 15%  perf-profile.calltrace.cycles-pp.ttwu_do_activate.try_to_wake_up.complete_signal.send_sigqueue.posix_timer_fn
      0.00            +1.6        1.56 ± 26%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.__lock_timer
      0.00            +1.6        1.57 ± 16%  perf-profile.calltrace.cycles-pp.dequeue_entity.dequeue_task_fair.__schedule.schedule.do_nanosleep
      0.81 ± 60%      +1.6        2.44 ± 57%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.get_signal.arch_do_signal_or_restart.syscall_exit_to_user_mode.do_syscall_64
      0.00            +1.6        1.64 ± 25%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.timer_getoverrun
      0.00            +1.7        1.71 ± 17%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.do_nanosleep
      0.00            +1.7        1.74 ±  7%  perf-profile.calltrace.cycles-pp.clockevents_program_event.hrtimer_start_range_ns.posixtimer_deliver_signal.dequeue_signal.get_signal
      0.00            +1.8        1.76 ± 15%  perf-profile.calltrace.cycles-pp.dequeue_task_fair.__schedule.schedule.do_nanosleep.hrtimer_nanosleep
      0.00            +1.9        1.88 ± 25%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.__lock_timer.__x64_sys_timer_getoverrun
      0.00            +1.9        1.91 ± 18%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.do_syscall_64.entry_SYSCALL_64_after_hwframe.timer_getoverrun
      1.46 ± 33%      +2.0        3.47 ± 45%  perf-profile.calltrace.cycles-pp.__lock_timer.posixtimer_deliver_signal.dequeue_signal.get_signal.arch_do_signal_or_restart
      0.00            +2.0        2.04 ± 18%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.do_nanosleep.hrtimer_nanosleep
      0.00            +2.0        2.04 ± 28%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.sigpending
      0.00            +2.2        2.16 ± 24%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.__lock_timer.__x64_sys_timer_getoverrun.do_syscall_64
      0.00            +2.3        2.33 ± 18%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.do_nanosleep.hrtimer_nanosleep.common_nsleep
      0.00            +2.6        2.56 ± 14%  perf-profile.calltrace.cycles-pp.try_to_wake_up.complete_signal.send_sigqueue.posix_timer_fn.__hrtimer_run_queues
      0.00            +2.7        2.71 ± 15%  perf-profile.calltrace.cycles-pp.complete_signal.send_sigqueue.posix_timer_fn.__hrtimer_run_queues.hrtimer_interrupt
      0.51 ± 46%      +2.9        3.42 ± 18%  perf-profile.calltrace.cycles-pp.send_sigqueue.posix_timer_fn.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt
      0.00            +3.0        3.00        perf-profile.calltrace.cycles-pp.hrtimer_start_range_ns.posixtimer_deliver_signal.dequeue_signal.get_signal.arch_do_signal_or_restart
      2.88 ± 14%      +3.2        6.06        perf-profile.calltrace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      1.62 ± 17%      +3.3        4.88 ±  5%  perf-profile.calltrace.cycles-pp.posix_timer_fn.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      2.27 ± 27%      +3.7        6.01 ± 28%  perf-profile.calltrace.cycles-pp.__lock_timer.__x64_sys_timer_getoverrun.do_syscall_64.entry_SYSCALL_64_after_hwframe.timer_getoverrun
      0.00            +4.3        4.33 ± 18%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.00            +4.4        4.41 ± 23%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.__lock_timer.__x64_sys_timer_getoverrun.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +4.7        4.71 ± 13%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.finish_task_switch
      0.00            +5.2        5.21 ± 13%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.finish_task_switch.__schedule
      2.54 ± 24%      +5.3        7.88 ± 21%  perf-profile.calltrace.cycles-pp.__x64_sys_timer_getoverrun.do_syscall_64.entry_SYSCALL_64_after_hwframe.timer_getoverrun
      0.00            +5.5        5.52 ± 15%  perf-profile.calltrace.cycles-pp.__schedule.schedule.do_nanosleep.hrtimer_nanosleep.common_nsleep
      0.00            +5.7        5.73 ± 13%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.finish_task_switch.__schedule.schedule_idle
      0.00            +6.1        6.13 ± 15%  perf-profile.calltrace.cycles-pp.schedule.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      1.96 ± 24%      +6.4        8.35 ± 21%  perf-profile.calltrace.cycles-pp.posixtimer_deliver_signal.dequeue_signal.get_signal.arch_do_signal_or_restart.syscall_exit_to_user_mode
      2.83 ± 15%      +6.6        9.43 ± 19%  perf-profile.calltrace.cycles-pp.dequeue_signal.get_signal.arch_do_signal_or_restart.syscall_exit_to_user_mode.do_syscall_64
      3.08 ± 20%      +7.0       10.06 ± 15%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.timer_getoverrun
      5.98 ±  9%      +7.2       13.18 ±  9%  perf-profile.calltrace.cycles-pp.timer_getoverrun
      3.36 ± 18%      +7.3       10.70 ± 13%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.timer_getoverrun
      0.00            +7.8        7.85 ± 13%  perf-profile.calltrace.cycles-pp.finish_task_switch.__schedule.schedule_idle.do_idle.cpu_startup_entry
      5.10 ± 15%      +8.4       13.52 ± 21%  perf-profile.calltrace.cycles-pp.get_signal.arch_do_signal_or_restart.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +8.7        8.70 ± 13%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.finish_task_switch.__schedule.schedule_idle.do_idle
      0.00           +10.1       10.12 ± 13%  perf-profile.calltrace.cycles-pp.__schedule.schedule_idle.do_idle.cpu_startup_entry.start_secondary
      0.00           +10.2       10.25 ± 13%  perf-profile.calltrace.cycles-pp.schedule_idle.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      0.00           +10.3       10.25 ± 13%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.common_startup_64
      0.00           +10.3       10.25 ± 13%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      0.00           +10.3       10.25 ± 13%  perf-profile.calltrace.cycles-pp.start_secondary.common_startup_64
      0.00           +10.3       10.30 ± 13%  perf-profile.calltrace.cycles-pp.common_startup_64
      0.00           +11.8       11.83 ± 17%  perf-profile.calltrace.cycles-pp.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_64
      0.00           +13.4       13.39 ± 15%  perf-profile.calltrace.cycles-pp.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00           +13.5       13.50 ± 15%  perf-profile.calltrace.cycles-pp.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
      0.00           +15.0       14.97 ± 14%  perf-profile.calltrace.cycles-pp.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
     44.24 ±  3%     -35.4        8.79 ±  2%  perf-profile.children.cycles-pp.handle_signal
     53.72           -28.2       25.49 ± 10%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode
     52.33           -27.4       24.90 ± 12%  perf-profile.children.cycles-pp.arch_do_signal_or_restart
     31.55 ±  5%     -26.3        5.22 ±  2%  perf-profile.children.cycles-pp.x64_setup_rt_frame
     20.70 ±  3%     -16.2        4.45 ±  2%  perf-profile.children.cycles-pp.get_sigframe
     87.06           -15.2       71.82 ±  3%  perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     86.20           -15.0       71.24 ±  3%  perf-profile.children.cycles-pp.do_syscall_64
     12.30 ± 12%     -10.8        1.49        perf-profile.children.cycles-pp.save_xstate_epilog
     18.72           -10.2        8.52 ±  3%  perf-profile.children.cycles-pp.stress_timer_handler
      9.00 ±  3%      -7.1        1.91        perf-profile.children.cycles-pp.fpu__clear_user_states
     13.85            -6.6        7.28 ±  2%  perf-profile.children.cycles-pp.__x64_sys_rt_sigreturn
      5.94 ± 13%      -5.4        0.55        perf-profile.children.cycles-pp.__put_user_nocheck_4
     15.82            -4.9       10.95 ±  5%  perf-profile.children.cycles-pp.timer_settime
      7.36 ± 11%      -4.7        2.68 ±  2%  perf-profile.children.cycles-pp.copy_fpstate_to_sigframe
      9.61 ±  2%      -4.7        4.95 ±  3%  perf-profile.children.cycles-pp.restore_sigcontext
     12.92            -4.4        8.50 ±  8%  perf-profile.children.cycles-pp.__x64_sys_timer_settime
      7.79 ±  2%      -3.8        4.02 ±  3%  perf-profile.children.cycles-pp.fpu__restore_sig
      8.40            -3.7        4.68        perf-profile.children.cycles-pp.common_timer_set
      7.67 ±  2%      -3.7        3.96 ±  3%  perf-profile.children.cycles-pp.__fpu_restore_sig
     10.24 ±  2%      -3.5        6.71 ± 11%  perf-profile.children.cycles-pp.do_timer_settime
      4.01 ± 12%      -3.3        0.74 ±  3%  perf-profile.children.cycles-pp.__get_user_nocheck_4
     46.12 ±  3%      -3.2       42.96 ±  2%  perf-profile.children.cycles-pp.clock_nanosleep
      4.86 ±  2%      -2.3        2.52 ±  2%  perf-profile.children.cycles-pp.restore_fpregs_from_user
      8.52            -1.8        6.70 ±  4%  perf-profile.children.cycles-pp.native_irq_return_iret
      3.56            -1.2        2.32 ±  5%  perf-profile.children.cycles-pp.entry_SYSCALL_64
      4.35 ±  2%      -1.2        3.18 ±  3%  perf-profile.children.cycles-pp._copy_from_user
      3.02 ±  5%      -1.2        1.86 ±  5%  perf-profile.children.cycles-pp.__rseq_handle_notify_resume
      1.84 ±  2%      -0.9        0.95 ±  3%  perf-profile.children.cycles-pp.check_xstate_in_sigframe
      2.37            -0.9        1.48        perf-profile.children.cycles-pp.get_itimerspec64
      1.94 ±  2%      -0.7        1.22 ±  5%  perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      1.46 ±  2%      -0.7        0.75 ±  3%  perf-profile.children.cycles-pp.__get_user_nocheck_8
      1.62            -0.7        0.92 ±  2%  perf-profile.children.cycles-pp.common_hrtimer_arm
      1.60 ± 23%      -0.7        0.91 ± 32%  perf-profile.children.cycles-pp.stress_timer
      1.44 ±  2%      -0.7        0.75 ±  3%  perf-profile.children.cycles-pp.restore_altstack
      1.26 ±  7%      -0.7        0.59 ±  5%  perf-profile.children.cycles-pp.fpregs_mark_activate
      1.24            -0.7        0.58 ±  2%  perf-profile.children.cycles-pp.signal_setup_done
      1.04            -0.6        0.47        perf-profile.children.cycles-pp.__set_current_blocked
      1.69 ±  4%      -0.6        1.13 ±  5%  perf-profile.children.cycles-pp.rseq_ip_fixup
      1.20 ±  5%      -0.5        0.67 ±  4%  perf-profile.children.cycles-pp.rseq_update_cpu_node_id
      1.09 ±  3%      -0.4        0.64 ±  4%  perf-profile.children.cycles-pp.set_current_blocked
      0.62 ±  4%      -0.3        0.29 ±  4%  perf-profile.children.cycles-pp.__local_bh_enable_ip
      1.76 ±  2%      -0.3        1.43 ±  4%  perf-profile.children.cycles-pp._raw_spin_lock_irq
      0.64 ±  5%      -0.2        0.41 ±  5%  perf-profile.children.cycles-pp.__put_user_8
      0.77 ±  3%      -0.2        0.54 ±  5%  perf-profile.children.cycles-pp.rseq_get_rseq_cs
      0.62 ±  3%      -0.2        0.45 ±  5%  perf-profile.children.cycles-pp.__get_user_8
      0.23 ± 15%      -0.2        0.08        perf-profile.children.cycles-pp.fpu__alloc_mathframe
      0.40            -0.1        0.25 ±  3%  perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.50            -0.1        0.36 ±  4%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.98 ±  3%      -0.1        0.84 ±  2%  perf-profile.children.cycles-pp.recalc_sigpending
      0.21 ±  3%      -0.1        0.08 ±  4%  perf-profile.children.cycles-pp.__set_task_blocked
      0.19 ±  2%      -0.1        0.10 ±  7%  perf-profile.children.cycles-pp.scheduler_tick
      0.14            -0.1        0.06 ±  6%  perf-profile.children.cycles-pp.task_tick_fair
      0.32 ±  2%      -0.1        0.26 ±  2%  perf-profile.children.cycles-pp.prepare_signal
      0.20 ±  2%      -0.1        0.15 ±  6%  perf-profile.children.cycles-pp.amd_clear_divider
      0.32 ±  2%      -0.1        0.26 ±  9%  perf-profile.children.cycles-pp.tick_nohz_handler
      0.29 ±  2%      -0.1        0.24 ±  8%  perf-profile.children.cycles-pp.update_process_times
      0.11            -0.1        0.06 ±  6%  perf-profile.children.cycles-pp.hrtimer_init
      0.12 ±  4%      -0.1        0.07 ±  5%  perf-profile.children.cycles-pp.do_sigaltstack
      0.09 ±  4%      -0.0        0.05 ± 45%  perf-profile.children.cycles-pp.task_curr
      0.28            -0.0        0.24 ±  8%  perf-profile.children.cycles-pp.__check_object_size
      0.06            +0.0        0.08 ±  8%  perf-profile.children.cycles-pp.irqentry_exit
      0.13 ±  2%      +0.0        0.15 ±  4%  perf-profile.children.cycles-pp.__cond_resched
      0.05 ±  7%      +0.0        0.08 ± 11%  perf-profile.children.cycles-pp.timer_getoverrun@plt
      0.11 ±  4%      +0.0        0.14 ±  5%  perf-profile.children.cycles-pp.irqentry_enter
      0.12 ±  4%      +0.0        0.15 ±  6%  perf-profile.children.cycles-pp.rb_next
      0.12 ±  4%      +0.0        0.17 ±  7%  perf-profile.children.cycles-pp.hrtimer_active
      0.10 ±  4%      +0.1        0.16 ± 12%  perf-profile.children.cycles-pp.idle_cpu
      0.00            +0.1        0.06 ± 11%  perf-profile.children.cycles-pp.put_prev_entity
      0.00            +0.1        0.07 ± 14%  perf-profile.children.cycles-pp.rcu_note_context_switch
      0.00            +0.1        0.07 ± 14%  perf-profile.children.cycles-pp.put_prev_task_fair
      0.00            +0.1        0.08 ± 18%  perf-profile.children.cycles-pp.__enqueue_entity
      0.10 ±  4%      +0.1        0.18 ±  9%  perf-profile.children.cycles-pp.__irqentry_text_end
      0.00            +0.1        0.08 ± 19%  perf-profile.children.cycles-pp.tracing_gen_ctx_irq_test
      0.10            +0.1        0.19 ±  3%  perf-profile.children.cycles-pp.rb_insert_color
      0.00            +0.1        0.09 ± 15%  perf-profile.children.cycles-pp.cpuacct_charge
      0.16 ±  3%      +0.1        0.25 ± 13%  perf-profile.children.cycles-pp.get_nohz_timer_target
      0.00            +0.1        0.09 ± 19%  perf-profile.children.cycles-pp.perf_trace_buf_alloc
      0.00            +0.1        0.09 ± 11%  perf-profile.children.cycles-pp.perf_trace_sched_stat_runtime
      0.00            +0.1        0.09 ±  7%  perf-profile.children.cycles-pp.resched_curr
      0.00            +0.1        0.10 ±  9%  perf-profile.children.cycles-pp.perf_trace_sched_switch
      0.09            +0.1        0.19 ± 15%  perf-profile.children.cycles-pp.sigismember@plt
      0.00            +0.1        0.10 ± 15%  perf-profile.children.cycles-pp.update_curr_se
      0.14            +0.1        0.25 ±  7%  perf-profile.children.cycles-pp.rb_erase
      0.00            +0.1        0.11 ± 16%  perf-profile.children.cycles-pp.__cgroup_account_cputime
      0.00            +0.1        0.12 ± 26%  perf-profile.children.cycles-pp.pick_next_task_idle
      0.00            +0.1        0.12 ± 13%  perf-profile.children.cycles-pp.__rdgsbase_inactive
      0.00            +0.1        0.13 ± 31%  perf-profile.children.cycles-pp.clockevents_program_min_delta
      0.01 ±223%      +0.1        0.14 ± 40%  perf-profile.children.cycles-pp.nanosleep@plt
      0.00            +0.1        0.13 ± 12%  perf-profile.children.cycles-pp.__dequeue_entity
      0.00            +0.1        0.14 ± 11%  perf-profile.children.cycles-pp.switch_mm_irqs_off
      0.00            +0.1        0.14 ± 17%  perf-profile.children.cycles-pp.perf_trace_buf_update
      0.00            +0.1        0.15 ± 12%  perf-profile.children.cycles-pp.newidle_balance
      0.00            +0.2        0.15 ± 10%  perf-profile.children.cycles-pp.wakeup_preempt
      0.00            +0.2        0.16 ± 12%  perf-profile.children.cycles-pp.pick_eevdf
      0.00            +0.2        0.17 ±  2%  perf-profile.children.cycles-pp.hrtimer_forward
      0.04 ± 44%      +0.2        0.21 ± 12%  perf-profile.children.cycles-pp.update_min_vruntime
      0.00            +0.2        0.17 ± 10%  perf-profile.children.cycles-pp.avg_vruntime
      0.00            +0.2        0.18 ± 12%  perf-profile.children.cycles-pp.__remove_hrtimer
      0.00            +0.2        0.18 ± 13%  perf-profile.children.cycles-pp.place_entity
      0.00            +0.2        0.18 ± 13%  perf-profile.children.cycles-pp.update_irq_load_avg
      0.00            +0.2        0.19 ± 14%  perf-profile.children.cycles-pp._raw_spin_trylock
      0.34 ±  4%      +0.2        0.53        perf-profile.children.cycles-pp.timerqueue_add
      0.00            +0.2        0.19 ± 13%  perf-profile.children.cycles-pp.__calc_delta
      0.15 ±  3%      +0.2        0.34 ± 10%  perf-profile.children.cycles-pp.sigismember
      0.00            +0.2        0.20 ± 13%  perf-profile.children.cycles-pp.rebalance_domains
      0.00            +0.2        0.20 ± 16%  perf-profile.children.cycles-pp.reweight_entity
      0.55 ±  2%      +0.2        0.77 ±  7%  perf-profile.children.cycles-pp.__hrtimer_init
      0.80 ±  2%      +0.2        1.02 ±  5%  perf-profile.children.cycles-pp.native_sched_clock
      0.00            +0.2        0.23 ± 13%  perf-profile.children.cycles-pp.__wrgsbase_inactive
      0.46 ±  2%      +0.2        0.70 ±  2%  perf-profile.children.cycles-pp.enqueue_hrtimer
      0.91 ±  2%      +0.3        1.16 ±  5%  perf-profile.children.cycles-pp.sched_clock
      1.17            +0.3        1.44 ±  6%  perf-profile.children.cycles-pp.irq_exit_rcu
      0.00            +0.3        0.27 ± 13%  perf-profile.children.cycles-pp.__do_softirq
      0.00            +0.3        0.28 ± 24%  perf-profile.children.cycles-pp.select_task_rq_fair
      1.08 ±  2%      +0.3        1.36 ±  5%  perf-profile.children.cycles-pp.sched_clock_cpu
      1.89            +0.3        2.19 ±  5%  perf-profile.children.cycles-pp.__x64_sys_rt_sigpending
      0.00            +0.3        0.34 ± 12%  perf-profile.children.cycles-pp.__update_load_avg_se
      0.00            +0.3        0.34 ± 23%  perf-profile.children.cycles-pp.select_task_rq
      2.29 ±  2%      +0.4        2.65 ±  5%  perf-profile.children.cycles-pp.ktime_get
      0.00            +0.4        0.36 ± 12%  perf-profile.children.cycles-pp.___perf_sw_event
      0.00            +0.4        0.36 ± 17%  perf-profile.children.cycles-pp.perf_tp_event
      0.00            +0.4        0.38 ± 14%  perf-profile.children.cycles-pp.update_rq_clock_task
      0.00            +0.4        0.38 ± 11%  perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
      0.43 ±  7%      +0.4        0.82 ±  9%  perf-profile.children.cycles-pp.timerqueue_del
      0.00            +0.4        0.40 ± 13%  perf-profile.children.cycles-pp.update_rq_clock
      0.15 ±  3%      +0.4        0.56 ± 10%  perf-profile.children.cycles-pp.hrtimer_try_to_cancel
      0.00            +0.4        0.42 ± 12%  perf-profile.children.cycles-pp.queue_event
      0.00            +0.4        0.42 ± 11%  perf-profile.children.cycles-pp.ordered_events__queue
      0.00            +0.4        0.42 ± 11%  perf-profile.children.cycles-pp.process_simple
      0.00            +0.4        0.42 ± 13%  perf-profile.children.cycles-pp.os_xsave
      0.00            +0.4        0.43 ± 31%  perf-profile.children.cycles-pp.update_cfs_group
      0.38 ±  5%      +0.4        0.82 ±  2%  perf-profile.children.cycles-pp.__cmd_record
      0.00            +0.4        0.44        perf-profile.children.cycles-pp.perf_session__process_events
      0.00            +0.4        0.44        perf-profile.children.cycles-pp.reader__read_event
      0.00            +0.4        0.44        perf-profile.children.cycles-pp.record__finish_output
      0.00            +0.5        0.47 ± 14%  perf-profile.children.cycles-pp.set_next_entity
      0.00            +0.5        0.49 ± 14%  perf-profile.children.cycles-pp.__switch_to_asm
      0.00            +0.6        0.59 ±  9%  perf-profile.children.cycles-pp.hrtimer_init_sleeper
      0.00            +0.6        0.60 ± 16%  perf-profile.children.cycles-pp.perf_trace_sched_wakeup_template
      0.00            +0.6        0.61 ± 12%  perf-profile.children.cycles-pp.__switch_to
      0.00            +0.6        0.62 ± 15%  perf-profile.children.cycles-pp.prepare_task_switch
      0.00            +0.6        0.64        perf-profile.children.cycles-pp.common_hrtimer_rearm
      0.00            +0.8        0.77 ± 10%  perf-profile.children.cycles-pp.sync_regs
      0.98            +0.8        1.80 ±  6%  perf-profile.children.cycles-pp.__hrtimer_start_range_ns
      0.30            +0.8        1.13 ± 15%  perf-profile.children.cycles-pp._raw_spin_lock
      0.07            +0.9        0.98 ± 13%  perf-profile.children.cycles-pp.update_curr
      0.00            +0.9        0.92 ±  8%  perf-profile.children.cycles-pp.get_timespec64
      1.88 ± 16%      +1.0        2.85 ± 39%  perf-profile.children.cycles-pp.__nanosleep
      0.00            +1.1        1.08 ± 13%  perf-profile.children.cycles-pp.update_load_avg
      0.00            +1.2        1.15 ± 16%  perf-profile.children.cycles-pp.enqueue_entity
      0.00            +1.3        1.26 ± 17%  perf-profile.children.cycles-pp.irqentry_exit_to_user_mode
      0.00            +1.3        1.27 ± 16%  perf-profile.children.cycles-pp.enqueue_task_fair
      0.00            +1.3        1.32 ± 16%  perf-profile.children.cycles-pp.activate_task
      0.00            +1.5        1.52 ± 16%  perf-profile.children.cycles-pp.ttwu_do_activate
      0.00            +1.5        1.54 ± 13%  perf-profile.children.cycles-pp.pick_next_task_fair
      0.00            +1.6        1.63 ± 16%  perf-profile.children.cycles-pp.dequeue_entity
      0.00            +1.8        1.77 ± 15%  perf-profile.children.cycles-pp.dequeue_task_fair
      5.94            +1.8        7.78        perf-profile.children.cycles-pp.hrtimer_start_range_ns
      4.71 ± 16%      +2.6        7.26 ± 22%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      0.83 ±  3%      +2.7        3.52 ± 14%  perf-profile.children.cycles-pp.complete_signal
      2.26 ±  2%      +2.8        5.03 ±  8%  perf-profile.children.cycles-pp.send_sigqueue
      0.19 ±  3%      +2.9        3.07 ± 15%  perf-profile.children.cycles-pp.try_to_wake_up
      3.60 ±  6%      +3.8        7.43 ±  2%  perf-profile.children.cycles-pp.posix_timer_fn
     14.78            +3.9       18.66        perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
     12.05            +4.0       16.02        perf-profile.children.cycles-pp.hrtimer_interrupt
     17.04            +4.2       21.20        perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      5.23 ±  5%      +4.2        9.42 ±  3%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      2.60 ± 24%      +5.7        8.26 ± 20%  perf-profile.children.cycles-pp.__x64_sys_timer_getoverrun
      0.00            +6.2        6.23 ± 15%  perf-profile.children.cycles-pp.schedule
     25.48            +6.4       31.87        perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      2.49 ± 23%      +6.9        9.37 ± 21%  perf-profile.children.cycles-pp.posixtimer_deliver_signal
      3.43 ± 15%      +7.1       10.53 ± 18%  perf-profile.children.cycles-pp.dequeue_signal
      5.46 ± 26%      +7.1       12.58 ± 32%  perf-profile.children.cycles-pp.__lock_timer
      6.34 ±  9%      +7.8       14.12 ±  7%  perf-profile.children.cycles-pp.timer_getoverrun
      6.43 ± 16%      +8.6       15.08 ± 21%  perf-profile.children.cycles-pp.get_signal
      0.00            +8.8        8.78 ± 13%  perf-profile.children.cycles-pp.finish_task_switch
      0.00           +10.3       10.25 ± 13%  perf-profile.children.cycles-pp.start_secondary
      0.00           +10.3       10.30 ± 13%  perf-profile.children.cycles-pp.common_startup_64
      0.00           +10.3       10.30 ± 13%  perf-profile.children.cycles-pp.cpu_startup_entry
      0.00           +10.3       10.30 ± 13%  perf-profile.children.cycles-pp.do_idle
      0.00           +10.3       10.30 ± 13%  perf-profile.children.cycles-pp.schedule_idle
      0.00           +12.4       12.37 ± 16%  perf-profile.children.cycles-pp.do_nanosleep
      0.00           +13.5       13.47 ± 15%  perf-profile.children.cycles-pp.hrtimer_nanosleep
      0.00           +13.6       13.59 ± 15%  perf-profile.children.cycles-pp.common_nsleep
      0.00           +15.0       15.04 ± 14%  perf-profile.children.cycles-pp.__x64_sys_clock_nanosleep
      0.00           +16.0       15.99 ± 14%  perf-profile.children.cycles-pp.__schedule
      4.08 ±  9%      -3.4        0.72 ±  4%  perf-profile.self.cycles-pp.x64_setup_rt_frame
      4.51            -3.0        1.52 ±  3%  perf-profile.self.cycles-pp.fpu__clear_user_states
      5.23 ±  2%      -2.8        2.38 ±  3%  perf-profile.self.cycles-pp.copy_fpstate_to_sigframe
      4.32 ±  2%      -2.2        2.16 ±  3%  perf-profile.self.cycles-pp.restore_fpregs_from_user
      2.36 ± 11%      -1.9        0.49 ±  2%  perf-profile.self.cycles-pp.__put_user_nocheck_4
      8.51            -1.8        6.69 ±  4%  perf-profile.self.cycles-pp.native_irq_return_iret
      4.23 ±  2%      -1.5        2.72 ±  4%  perf-profile.self.cycles-pp._copy_from_user
      2.10 ±  8%      -1.4        0.69 ±  3%  perf-profile.self.cycles-pp.__get_user_nocheck_4
      1.68 ±  4%      -1.1        0.56 ±  4%  perf-profile.self.cycles-pp.save_xstate_epilog
      1.90            -0.7        1.20 ±  5%  perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      1.38 ±  2%      -0.7        0.71 ±  3%  perf-profile.self.cycles-pp.__get_user_nocheck_8
      1.07 ±  2%      -0.5        0.54 ±  3%  perf-profile.self.cycles-pp.check_xstate_in_sigframe
      1.02 ±  2%      -0.5        0.51 ±  4%  perf-profile.self.cycles-pp.__fpu_restore_sig
      0.92 ±  5%      -0.4        0.48 ±  5%  perf-profile.self.cycles-pp.fpregs_mark_activate
      0.92            -0.4        0.51 ±  4%  perf-profile.self.cycles-pp.timer_settime
      0.97            -0.4        0.62 ±  6%  perf-profile.self.cycles-pp.rseq_update_cpu_node_id
      0.56 ±  3%      -0.3        0.22 ±  3%  perf-profile.self.cycles-pp.get_sigframe
      1.67 ±  2%      -0.3        1.36 ±  4%  perf-profile.self.cycles-pp._raw_spin_lock_irq
      0.86            -0.3        0.55 ±  4%  perf-profile.self.cycles-pp.entry_SYSCALL_64
      0.64 ±  2%      -0.3        0.33 ±  3%  perf-profile.self.cycles-pp.restore_sigcontext
      0.91            -0.3        0.60 ±  6%  perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      1.30            -0.3        1.00 ±  4%  perf-profile.self.cycles-pp.stress_timer_handler
      0.44            -0.2        0.20 ±  3%  perf-profile.self.cycles-pp.__local_bh_enable_ip
      0.79            -0.2        0.56 ±  7%  perf-profile.self.cycles-pp._copy_to_user
      0.63 ± 18%      -0.2        0.42 ± 14%  perf-profile.self.cycles-pp.common_timer_set
      0.37            -0.2        0.20 ±  6%  perf-profile.self.cycles-pp.handle_signal
      0.38            -0.2        0.22 ±  5%  perf-profile.self.cycles-pp.do_timer_settime
      0.50 ±  3%      -0.2        0.35 ±  3%  perf-profile.self.cycles-pp.complete_signal
      0.52            -0.2        0.38 ±  5%  perf-profile.self.cycles-pp.__put_user_8
      0.40            -0.1        0.25 ±  3%  perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.50            -0.1        0.36 ±  4%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.41 ±  3%      -0.1        0.27 ±  5%  perf-profile.self.cycles-pp.__x64_sys_rt_sigreturn
      0.32            -0.1        0.18 ±  2%  perf-profile.self.cycles-pp.get_itimerspec64
      0.82 ±  2%      -0.1        0.68 ±  6%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.93 ±  3%      -0.1        0.80        perf-profile.self.cycles-pp.recalc_sigpending
      0.20 ±  2%      -0.1        0.09        perf-profile.self.cycles-pp.__set_current_blocked
      0.15 ±  4%      -0.1        0.04 ± 44%  perf-profile.self.cycles-pp.__set_task_blocked
      0.22 ±  2%      -0.1        0.11        perf-profile.self.cycles-pp.restore_altstack
      0.50            -0.1        0.40 ±  5%  perf-profile.self.cycles-pp.__get_user_8
      0.28 ±  6%      -0.1        0.18 ± 10%  perf-profile.self.cycles-pp.set_current_blocked
      0.20            -0.1        0.10 ±  5%  perf-profile.self.cycles-pp.signal_setup_done
      0.33            -0.1        0.24 ±  3%  perf-profile.self.cycles-pp.__x64_sys_timer_settime
      0.26            -0.1        0.18 ±  5%  perf-profile.self.cycles-pp.rseq_ip_fixup
      0.13 ±  5%      -0.1        0.05        perf-profile.self.cycles-pp.fpu__alloc_mathframe
      0.30 ±  4%      -0.1        0.22 ±  6%  perf-profile.self.cycles-pp.common_hrtimer_arm
      0.12 ±  4%      -0.1        0.06        perf-profile.self.cycles-pp.fpu__restore_sig
      0.31 ±  3%      -0.1        0.25 ±  3%  perf-profile.self.cycles-pp.prepare_signal
      0.31            -0.1        0.25 ±  5%  perf-profile.self.cycles-pp.__x64_sys_rt_sigpending
      0.31            -0.1        0.26 ±  8%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
      0.14            -0.0        0.09 ±  7%  perf-profile.self.cycles-pp.__check_object_size
      0.11 ±  3%      -0.0        0.06        perf-profile.self.cycles-pp.do_sigaltstack
      0.15            -0.0        0.10 ±  6%  perf-profile.self.cycles-pp.rseq_get_rseq_cs
      0.13 ±  2%      -0.0        0.10 ±  7%  perf-profile.self.cycles-pp.amd_clear_divider
      0.29 ±  3%      -0.0        0.26 ±  3%  perf-profile.self.cycles-pp.sysvec_apic_timer_interrupt
      0.10 ±  3%      -0.0        0.07 ±  7%  perf-profile.self.cycles-pp.__rseq_handle_notify_resume
      0.34 ±  2%      -0.0        0.31 ±  3%  perf-profile.self.cycles-pp.ktime_get_update_offsets_now
      0.20 ±  2%      -0.0        0.18 ±  2%  perf-profile.self.cycles-pp.do_sigpending
      0.08            -0.0        0.05 ±  8%  perf-profile.self.cycles-pp.check_stack_object
      0.07 ±  5%      -0.0        0.05 ± 45%  perf-profile.self.cycles-pp.task_curr
      0.07            +0.0        0.08 ±  5%  perf-profile.self.cycles-pp.__cond_resched
      0.07            +0.0        0.09 ±  6%  perf-profile.self.cycles-pp.sched_clock
      0.10            +0.0        0.13 ±  5%  perf-profile.self.cycles-pp.rb_next
      0.16 ±  3%      +0.0        0.20 ±  6%  perf-profile.self.cycles-pp.sched_clock_cpu
      0.08            +0.0        0.12 ±  8%  perf-profile.self.cycles-pp.__irqentry_text_end
      0.10 ±  4%      +0.0        0.15 ±  6%  perf-profile.self.cycles-pp.enqueue_hrtimer
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.rcu_all_qs
      0.08 ±  4%      +0.1        0.14 ± 14%  perf-profile.self.cycles-pp.idle_cpu
      0.00            +0.1        0.07 ± 11%  perf-profile.self.cycles-pp.hrtimer_init_sleeper
      0.00            +0.1        0.07 ± 19%  perf-profile.self.cycles-pp.__cgroup_account_cputime
      0.00            +0.1        0.07 ± 14%  perf-profile.self.cycles-pp.__enqueue_entity
      0.00            +0.1        0.07 ± 17%  perf-profile.self.cycles-pp.schedule_idle
      0.00            +0.1        0.08 ± 17%  perf-profile.self.cycles-pp.cpuacct_charge
      0.00            +0.1        0.08 ± 17%  perf-profile.self.cycles-pp.tracing_gen_ctx_irq_test
      0.05            +0.1        0.13 ± 13%  perf-profile.self.cycles-pp.hrtimer_try_to_cancel
      0.00            +0.1        0.08 ± 13%  perf-profile.self.cycles-pp.place_entity
      0.14 ±  2%      +0.1        0.22 ± 13%  perf-profile.self.cycles-pp.get_nohz_timer_target
      0.06            +0.1        0.14 ±  3%  perf-profile.self.cycles-pp.rb_insert_color
      0.00            +0.1        0.09 ± 10%  perf-profile.self.cycles-pp.perf_trace_sched_stat_runtime
      0.00            +0.1        0.09 ±  5%  perf-profile.self.cycles-pp.perf_trace_sched_switch
      0.00            +0.1        0.09 ± 10%  perf-profile.self.cycles-pp.resched_curr
      0.00            +0.1        0.09 ± 15%  perf-profile.self.cycles-pp.update_curr_se
      0.00            +0.1        0.09 ± 15%  perf-profile.self.cycles-pp.update_rq_clock
      0.00            +0.1        0.09 ± 11%  perf-profile.self.cycles-pp.__dequeue_entity
      0.00            +0.1        0.09 ± 13%  perf-profile.self.cycles-pp.set_next_entity
      0.00            +0.1        0.10 ± 17%  perf-profile.self.cycles-pp.perf_trace_sched_wakeup_template
      0.00            +0.1        0.10 ±  6%  perf-profile.self.cycles-pp.common_hrtimer_rearm
      0.10 ±  4%      +0.1        0.20 ±  8%  perf-profile.self.cycles-pp.rb_erase
      0.26 ±  6%      +0.1        0.36        perf-profile.self.cycles-pp.timerqueue_add
      0.00            +0.1        0.11 ± 13%  perf-profile.self.cycles-pp.common_nsleep
      0.00            +0.1        0.12 ± 12%  perf-profile.self.cycles-pp.__rdgsbase_inactive
      0.00            +0.1        0.12 ± 17%  perf-profile.self.cycles-pp.enqueue_task_fair
      0.22 ±  4%      +0.1        0.34 ± 13%  perf-profile.self.cycles-pp.posix_timer_fn
      0.34 ±  2%      +0.1        0.46 ±  5%  perf-profile.self.cycles-pp.hrtimer_start_range_ns
      0.00            +0.1        0.12 ±  8%  perf-profile.self.cycles-pp.get_timespec64
      0.00            +0.1        0.12 ± 15%  perf-profile.self.cycles-pp.select_task_rq_fair
      0.00            +0.1        0.13 ± 13%  perf-profile.self.cycles-pp.newidle_balance
      0.00            +0.1        0.14 ± 17%  perf-profile.self.cycles-pp.dequeue_task_fair
      0.00            +0.1        0.14 ± 10%  perf-profile.self.cycles-pp.switch_mm_irqs_off
      0.00            +0.1        0.14 ± 11%  perf-profile.self.cycles-pp.pick_eevdf
      0.00            +0.2        0.16 ±  9%  perf-profile.self.cycles-pp.avg_vruntime
      0.00            +0.2        0.16 ±  2%  perf-profile.self.cycles-pp.hrtimer_forward
      0.00            +0.2        0.17 ± 14%  perf-profile.self.cycles-pp.update_irq_load_avg
      0.00            +0.2        0.18 ± 13%  perf-profile.self.cycles-pp.__calc_delta
      0.00            +0.2        0.19 ±  9%  perf-profile.self.cycles-pp.stress_timer
      0.00            +0.2        0.19 ± 12%  perf-profile.self.cycles-pp.update_min_vruntime
      0.00            +0.2        0.19 ± 14%  perf-profile.self.cycles-pp._raw_spin_trylock
      0.00            +0.2        0.19 ± 16%  perf-profile.self.cycles-pp.reweight_entity
      0.00            +0.2        0.19 ± 13%  perf-profile.self.cycles-pp.update_rq_clock_task
      0.20 ±  3%      +0.2        0.40 ±  9%  perf-profile.self.cycles-pp.posixtimer_deliver_signal
      0.38 ±  2%      +0.2        0.59 ±  7%  perf-profile.self.cycles-pp.__hrtimer_start_range_ns
      0.00            +0.2        0.21 ± 16%  perf-profile.self.cycles-pp.schedule
      0.76 ±  2%      +0.2        0.98 ±  5%  perf-profile.self.cycles-pp.native_sched_clock
      0.00            +0.2        0.22 ± 14%  perf-profile.self.cycles-pp.enqueue_entity
      0.00            +0.2        0.22 ± 15%  perf-profile.self.cycles-pp.perf_tp_event
      0.00            +0.2        0.22 ± 13%  perf-profile.self.cycles-pp.__wrgsbase_inactive
      0.00            +0.2        0.24 ± 14%  perf-profile.self.cycles-pp.dequeue_entity
      0.00            +0.3        0.26 ± 19%  perf-profile.self.cycles-pp.prepare_task_switch
      0.00            +0.3        0.27 ± 13%  perf-profile.self.cycles-pp.pick_next_task_fair
      0.00            +0.3        0.28 ± 12%  perf-profile.self.cycles-pp.___perf_sw_event
      0.21 ± 16%      +0.3        0.49 ± 19%  perf-profile.self.cycles-pp.timerqueue_del
      0.00            +0.3        0.30 ± 13%  perf-profile.self.cycles-pp.__update_load_avg_se
      0.19 ±  2%      +0.3        0.49 ±  7%  perf-profile.self.cycles-pp.__x64_sys_timer_getoverrun
      1.37 ±  7%      +0.3        1.68 ± 14%  perf-profile.self.cycles-pp.get_signal
      0.00            +0.3        0.32 ±  6%  perf-profile.self.cycles-pp.__nanosleep
      0.00            +0.4        0.35 ± 16%  perf-profile.self.cycles-pp.update_curr
      0.00            +0.4        0.36 ± 11%  perf-profile.self.cycles-pp.__update_load_avg_cfs_rq
      0.00            +0.4        0.38 ± 14%  perf-profile.self.cycles-pp.update_load_avg
      0.00            +0.4        0.39 ±  7%  perf-profile.self.cycles-pp.__x64_sys_clock_nanosleep
      0.00            +0.4        0.40 ± 12%  perf-profile.self.cycles-pp.hrtimer_nanosleep
      0.00            +0.4        0.41 ± 12%  perf-profile.self.cycles-pp.queue_event
      0.00            +0.4        0.41 ± 32%  perf-profile.self.cycles-pp.update_cfs_group
      0.00            +0.4        0.42 ± 13%  perf-profile.self.cycles-pp.os_xsave
      0.00            +0.5        0.49 ± 13%  perf-profile.self.cycles-pp.__switch_to_asm
      0.00            +0.6        0.58 ±  9%  perf-profile.self.cycles-pp.clock_nanosleep
      0.00            +0.6        0.58 ± 12%  perf-profile.self.cycles-pp.__switch_to
      1.09            +0.6        1.71 ±  6%  perf-profile.self.cycles-pp.do_syscall_64
      0.00            +0.8        0.76 ± 10%  perf-profile.self.cycles-pp.sync_regs
      0.29            +0.8        1.09 ± 16%  perf-profile.self.cycles-pp._raw_spin_lock
      0.00            +1.3        1.30 ± 14%  perf-profile.self.cycles-pp.__schedule
      0.00            +1.4        1.35 ± 16%  perf-profile.self.cycles-pp.do_nanosleep
      0.00            +1.8        1.77 ± 13%  perf-profile.self.cycles-pp.finish_task_switch
      4.53 ± 17%      +2.4        6.90 ± 24%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      3.13 ± 32%      +3.9        7.04 ± 39%  perf-profile.self.cycles-pp.__lock_timer


***************************************************************************************************
lkp-icl-2sp9: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-13/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/lkp-icl-2sp9/timer/stress-ng/60s

commit: 
  9b5f919dc6 ("posix-timers: Add proper state tracking")
  71cc52f552 ("posix-timers: Make signal delivery consistent")

9b5f919dc6ac5ca1 71cc52f552ea8520d8bd7bec132 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     91052 ± 36%    +103.8%     185524 ± 17%  cpuidle..usage
    265386 ± 11%    +915.4%    2694697 ±  2%  numa-numastat.node1.local_node
    296493 ±  8%    +820.5%    2729280        numa-numastat.node1.numa_hit
     14.69 ±  3%     +12.8       27.44        mpstat.cpu.all.irq%
      0.04 ± 24%      +0.1        0.16        mpstat.cpu.all.soft%
     18.05 ± 12%      -5.5       12.58 ±  4%  mpstat.cpu.all.usr%
      3.50 ± 21%    +147.6%       8.67 ± 20%  mpstat.max_utilization.seconds
     17.54 ± 13%     -30.0%      12.28 ±  4%  vmstat.cpu.us
     62.88           -18.2%      51.45        vmstat.procs.r
     84560 ± 14%  +21901.9%   18605005 ±  5%  vmstat.system.cs
  25450322 ±  2%     -15.6%   21471601        vmstat.system.in
    109191 ±  9%   +1333.6%    1565341 ± 17%  stress-ng.time.involuntary_context_switches
      5347           -33.9%       3537 ±  2%  stress-ng.time.percent_of_cpu_this_job_got
      2544 ±  2%     -28.8%       1812 ±  3%  stress-ng.time.system_time
    669.47 ± 13%     -53.2%     313.35 ±  4%  stress-ng.time.user_time
   2581738 ± 15%  +22733.1%  5.895e+08 ±  5%  stress-ng.time.voluntary_context_switches
 1.599e+09 ±  2%     -58.1%  6.698e+08        stress-ng.timer.ops
  26648357 ±  2%     -58.1%   11162932        stress-ng.timer.ops_per_sec
     16038 ± 59%     -71.4%       4586 ± 46%  numa-vmstat.node0.nr_active_anon
     16038 ± 59%     -71.4%       4586 ± 46%  numa-vmstat.node0.nr_zone_active_anon
    394396 ± 79%    +441.2%    2134278 ± 14%  numa-vmstat.node1.nr_file_pages
    112345 ± 31%   +1546.5%    1849812 ±  4%  numa-vmstat.node1.nr_inactive_anon
     16119 ± 53%   +3072.0%     511313 ±  2%  numa-vmstat.node1.nr_mapped
     65304 ± 23%   +2599.1%    1762627        numa-vmstat.node1.nr_shmem
    112345 ± 31%   +1546.5%    1849812 ±  4%  numa-vmstat.node1.nr_zone_inactive_anon
    294813 ±  9%    +825.5%    2728401        numa-vmstat.node1.numa_hit
    263676 ± 11%    +921.6%    2693817 ±  2%  numa-vmstat.node1.numa_local
     65158 ± 59%     -71.8%      18353 ± 46%  numa-meminfo.node0.Active
     65126 ± 59%     -71.9%      18300 ± 46%  numa-meminfo.node0.Active(anon)
    192461 ± 18%     -36.9%     121514 ±  8%  numa-meminfo.node1.Active
    192429 ± 18%     -36.9%     121504 ±  8%  numa-meminfo.node1.Active(anon)
   1578783 ± 79%    +440.4%    8531291 ± 14%  numa-meminfo.node1.FilePages
    450180 ± 31%   +1542.5%    7394246 ±  4%  numa-meminfo.node1.Inactive
    450063 ± 31%   +1542.9%    7394203 ±  4%  numa-meminfo.node1.Inactive(anon)
     66583 ± 52%   +2962.1%    2038851 ±  3%  numa-meminfo.node1.Mapped
   2594565 ± 54%    +274.1%    9707230 ± 13%  numa-meminfo.node1.MemUsed
    262415 ± 22%   +2584.6%    7044687        numa-meminfo.node1.Shmem
    258126 ±  3%     -45.8%     139778 ±  3%  meminfo.Active
    258062 ±  3%     -45.9%     139714 ±  3%  meminfo.Active(anon)
   3462063          +194.3%   10190037        meminfo.Cached
   1684370          +403.1%    8474447        meminfo.Committed_AS
    790691 ±  5%    +870.1%    7670179        meminfo.Inactive
    790463 ±  5%    +870.3%    7669951        meminfo.Inactive(anon)
     91541           +16.7%     106864        meminfo.KReclaimable
    155267 ±  4%   +1321.8%    2207631        meminfo.Mapped
   5317226 ±  2%    +130.3%   12246149        meminfo.Memused
     11473 ±  3%     +34.9%      15477        meminfo.PageTables
     91541           +16.7%     106864        meminfo.SReclaimable
    386051 ±  2%   +1742.8%    7114037        meminfo.Shmem
   5526984 ±  4%    +122.3%   12283734        meminfo.max_used_kB
     64683 ±  3%     -46.0%      34960 ±  3%  proc-vmstat.nr_active_anon
   6423247            -2.7%    6250180        proc-vmstat.nr_dirty_background_threshold
  12862199            -2.7%   12515642        proc-vmstat.nr_dirty_threshold
    865686          +194.4%    2548487        proc-vmstat.nr_file_pages
  64611384            -2.7%   62878174        proc-vmstat.nr_free_pages
    197610 ±  5%    +870.8%    1918434        proc-vmstat.nr_inactive_anon
     39097 ±  3%   +1315.0%     553231        proc-vmstat.nr_mapped
      2869 ±  3%     +34.8%       3869        proc-vmstat.nr_page_table_pages
     96682 ±  2%   +1740.5%    1779486        proc-vmstat.nr_shmem
     22885           +16.7%      26718        proc-vmstat.nr_slab_reclaimable
     64683 ±  3%     -46.0%      34960 ±  3%  proc-vmstat.nr_zone_active_anon
    197610 ±  5%    +870.8%    1918434        proc-vmstat.nr_zone_inactive_anon
      6390 ± 52%   +2313.6%     154246        proc-vmstat.numa_hint_faults
      4185 ± 23%   +2265.1%      98998        proc-vmstat.numa_hint_faults_local
    500129          +482.9%    2915125        proc-vmstat.numa_hit
    433846          +556.6%    2848816        proc-vmstat.numa_local
     96719 ± 41%    +140.2%     232342        proc-vmstat.numa_pte_updates
    152521 ±  8%     -19.0%     123546        proc-vmstat.pgactivate
    549788 ±  2%    +437.8%    2956979        proc-vmstat.pgalloc_normal
    337225 ±  2%     +76.0%     593577        proc-vmstat.pgfault
    370160 ±  4%     -26.3%     272907        proc-vmstat.pgfree
 2.384e+10 ±  2%     +28.9%  3.072e+10        perf-stat.i.branch-instructions
      0.48 ±  4%      +0.2        0.69        perf-stat.i.branch-miss-rate%
 1.051e+08 ±  7%     +86.9%  1.965e+08 ±  2%  perf-stat.i.branch-misses
  46778737 ±103%    +320.0%  1.965e+08 ±  5%  perf-stat.i.cache-references
     87994 ± 14%  +21712.4%   19193757 ±  5%  perf-stat.i.context-switches
      1.71 ±  2%     -18.7%       1.39        perf-stat.i.cpi
    215.31 ±  6%  +80648.0%     173856 ±  8%  perf-stat.i.cpu-migrations
   1.3e+11 ±  2%     +24.0%  1.612e+11        perf-stat.i.instructions
      0.59 ±  2%     +24.2%       0.73        perf-stat.i.ipc
      1.15 ± 30%  +26093.4%     302.50 ±  5%  perf-stat.i.metric.K/sec
      4495 ±  2%     +95.5%       8789        perf-stat.i.minor-faults
      4496 ±  2%     +95.5%       8789        perf-stat.i.page-faults
      0.37 ± 45%      +0.3        0.64        perf-stat.overall.branch-miss-rate%
      0.49 ± 44%     +49.7%       0.73        perf-stat.overall.ipc
  1.95e+10 ± 44%     +54.7%  3.017e+10        perf-stat.ps.branch-instructions
  85886227 ± 45%    +124.3%  1.926e+08 ±  2%  perf-stat.ps.branch-misses
  40183403 ±125%    +383.0%  1.941e+08 ±  5%  perf-stat.ps.cache-references
     71431 ± 48%  +26346.1%   18890736 ±  5%  perf-stat.ps.context-switches
    177.85 ± 45%  +96715.7%     172191 ±  8%  perf-stat.ps.cpu-migrations
 1.064e+11 ± 44%     +48.9%  1.584e+11        perf-stat.ps.instructions
      3654 ± 44%    +134.7%       8576        perf-stat.ps.minor-faults
      3654 ± 44%    +134.7%       8576        perf-stat.ps.page-faults
 6.477e+12 ± 44%     +49.7%  9.696e+12        perf-stat.total.instructions
   1666951           -38.5%    1025859 ±  3%  sched_debug.cfs_rq:/.avg_vruntime.avg
   1715172           -22.9%    1322623 ±  5%  sched_debug.cfs_rq:/.avg_vruntime.max
   1516905 ±  2%     -35.0%     986098 ±  4%  sched_debug.cfs_rq:/.avg_vruntime.min
     36145 ± 14%     +47.9%      53473 ±  4%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      0.50          -100.0%       0.00        sched_debug.cfs_rq:/.h_nr_running.min
      0.32 ± 10%     +15.7%       0.37 ±  4%  sched_debug.cfs_rq:/.h_nr_running.stddev
     16.88 ± 79%  +7.6e+05%     127545 ± 22%  sched_debug.cfs_rq:/.left_deadline.avg
      1000 ± 85%  +1.1e+05%    1054636 ±  2%  sched_debug.cfs_rq:/.left_deadline.max
    126.68 ± 83%  +2.6e+05%     334422 ± 11%  sched_debug.cfs_rq:/.left_deadline.stddev
     16.19 ± 80%  +7.9e+05%     127532 ± 22%  sched_debug.cfs_rq:/.left_vruntime.avg
    976.16 ± 85%  +1.1e+05%    1054538 ±  2%  sched_debug.cfs_rq:/.left_vruntime.max
    122.54 ± 84%  +2.7e+05%     334390 ± 11%  sched_debug.cfs_rq:/.left_vruntime.stddev
      8014          -100.0%       0.00        sched_debug.cfs_rq:/.load.min
      7.58 ±  2%     -57.1%       3.25 ± 42%  sched_debug.cfs_rq:/.load_avg.min
   1666951           -38.5%    1025859 ±  3%  sched_debug.cfs_rq:/.min_vruntime.avg
   1715172           -22.9%    1322623 ±  5%  sched_debug.cfs_rq:/.min_vruntime.max
   1516905 ±  2%     -35.0%     986098 ±  4%  sched_debug.cfs_rq:/.min_vruntime.min
     36145 ± 14%     +47.9%      53473 ±  4%  sched_debug.cfs_rq:/.min_vruntime.stddev
      0.50          -100.0%       0.00        sched_debug.cfs_rq:/.nr_running.min
      0.22 ±  6%     +61.3%       0.35 ±  6%  sched_debug.cfs_rq:/.nr_running.stddev
     16.19 ± 80%  +7.9e+05%     127532 ± 22%  sched_debug.cfs_rq:/.right_vruntime.avg
    976.16 ± 85%  +1.1e+05%    1054538 ±  2%  sched_debug.cfs_rq:/.right_vruntime.max
    122.54 ± 84%  +2.7e+05%     334390 ± 11%  sched_debug.cfs_rq:/.right_vruntime.stddev
    747.61           -14.0%     642.98 ±  4%  sched_debug.cfs_rq:/.runnable_avg.avg
    437.00 ± 33%     -67.8%     140.58 ± 91%  sched_debug.cfs_rq:/.runnable_avg.min
    194.76 ± 16%     +42.5%     277.53 ± 15%  sched_debug.cfs_rq:/.runnable_avg.stddev
    743.62           -14.6%     635.08 ±  4%  sched_debug.cfs_rq:/.util_avg.avg
    182.37 ± 22%     +50.2%     273.94 ± 15%  sched_debug.cfs_rq:/.util_avg.stddev
    532.89           -37.7%     331.88 ±  5%  sched_debug.cfs_rq:/.util_est.avg
    448.92 ± 26%    -100.0%       0.00        sched_debug.cfs_rq:/.util_est.min
     91.09 ± 20%    +143.1%     221.42 ± 10%  sched_debug.cfs_rq:/.util_est.stddev
      3.35 ± 18%     -46.6%       1.79 ± 12%  sched_debug.cpu.clock.stddev
      1614           -19.9%       1292 ±  2%  sched_debug.cpu.curr->pid.avg
    609.80 ± 13%     +76.8%       1078 ±  4%  sched_debug.cpu.curr->pid.stddev
      0.62           -11.3%       0.55 ±  4%  sched_debug.cpu.nr_running.avg
      0.33 ±  8%     +31.7%       0.43 ±  3%  sched_debug.cpu.nr_running.stddev
     42905 ± 14%  +20850.9%    8989145 ±  5%  sched_debug.cpu.nr_switches.avg
    103942 ± 26%   +9186.5%    9652544 ±  4%  sched_debug.cpu.nr_switches.max
     24381 ± 58%  +17564.7%    4306851 ±  7%  sched_debug.cpu.nr_switches.min
     13002 ± 27%   +6136.0%     810812 ±  5%  sched_debug.cpu.nr_switches.stddev
      0.00 ±141%    +327.2%       0.00 ± 24%  sched_debug.rt_rq:.rt_time.avg
      0.05 ±141%    +327.2%       0.21 ± 24%  sched_debug.rt_rq:.rt_time.max
      0.01 ±141%    +327.2%       0.03 ± 24%  sched_debug.rt_rq:.rt_time.stddev
     41.83 ±  6%     -32.7        9.12        perf-profile.calltrace.cycles-pp.stress_timer_handler
     20.48 ± 18%     -20.2        0.27 ±100%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.stress_timer_handler
     21.12 ± 15%     -13.5        7.66        perf-profile.calltrace.cycles-pp.handle_signal.arch_do_signal_or_restart.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
     14.58 ±  5%     -12.4        2.19        perf-profile.calltrace.cycles-pp.arch_do_signal_or_restart.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_timer_handler
     15.19 ±  4%     -11.6        3.63        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_timer_handler
     15.03 ±  4%     -11.5        3.56        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_timer_handler
     15.21 ±  4%     -11.5        3.74 ±  2%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.stress_timer_handler
      9.00 ± 16%      -9.0        0.00        perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.stress_timer_handler
      7.68 ± 15%      -7.7        0.00        perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.stress_timer_handler
      6.18 ± 14%      -6.2        0.00        perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.stress_timer_handler
     10.28 ±  4%      -5.9        4.40        perf-profile.calltrace.cycles-pp.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
      6.34 ± 17%      -5.8        0.52        perf-profile.calltrace.cycles-pp.signal_setup_done.arch_do_signal_or_restart.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
     10.36 ± 10%      -5.8        4.56        perf-profile.calltrace.cycles-pp.x64_setup_rt_frame.handle_signal.arch_do_signal_or_restart.syscall_exit_to_user_mode.do_syscall_64
      8.57 ±  4%      -4.9        3.67        perf-profile.calltrace.cycles-pp.restore_sigcontext.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
      8.28 ±  4%      -4.7        3.54        perf-profile.calltrace.cycles-pp.fpu__restore_sig.restore_sigcontext.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      9.28            -4.7        4.58        perf-profile.calltrace.cycles-pp.common_timer_set.do_timer_settime.__x64_sys_timer_settime.do_syscall_64.entry_SYSCALL_64_after_hwframe
      6.09 ± 29%      -4.7        1.41        perf-profile.calltrace.cycles-pp.fpu__clear_user_states.handle_signal.arch_do_signal_or_restart.syscall_exit_to_user_mode.do_syscall_64
      4.66 ± 19%      -4.7        0.00        perf-profile.calltrace.cycles-pp.__set_current_blocked.signal_setup_done.arch_do_signal_or_restart.syscall_exit_to_user_mode.do_syscall_64
      8.06 ±  4%      -4.6        3.45        perf-profile.calltrace.cycles-pp.__fpu_restore_sig.fpu__restore_sig.restore_sigcontext.__x64_sys_rt_sigreturn.do_syscall_64
      8.52 ±  7%      -4.6        3.91        perf-profile.calltrace.cycles-pp.get_sigframe.x64_setup_rt_frame.handle_signal.arch_do_signal_or_restart.syscall_exit_to_user_mode
     18.85 ± 13%      -4.1       14.74 ±  3%  perf-profile.calltrace.cycles-pp.arch_do_signal_or_restart.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
     19.16 ± 12%      -4.0       15.15 ±  3%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
     10.75 ±  4%      -4.0        6.74 ±  4%  perf-profile.calltrace.cycles-pp.do_timer_settime.__x64_sys_timer_settime.do_syscall_64.entry_SYSCALL_64_after_hwframe.timer_settime
      6.50 ±  2%      -3.5        3.00        perf-profile.calltrace.cycles-pp.hrtimer_start_range_ns.common_timer_set.do_timer_settime.__x64_sys_timer_settime.do_syscall_64
      5.28            -3.0        2.27 ±  2%  perf-profile.calltrace.cycles-pp.sigpending
      4.97 ±  4%      -2.8        2.12        perf-profile.calltrace.cycles-pp.restore_fpregs_from_user.__fpu_restore_sig.fpu__restore_sig.restore_sigcontext.__x64_sys_rt_sigreturn
      4.89 ±  2%      -2.7        2.16        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
      4.66 ±  3%      -2.6        2.05        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
      4.32 ±  3%      -2.4        1.89        perf-profile.calltrace.cycles-pp.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      4.10            -2.3        1.83        perf-profile.calltrace.cycles-pp.clockevents_program_event.hrtimer_start_range_ns.common_timer_set.do_timer_settime.__x64_sys_timer_settime
      4.34 ±  4%      -2.2        2.17        perf-profile.calltrace.cycles-pp.copy_fpstate_to_sigframe.get_sigframe.x64_setup_rt_frame.handle_signal.arch_do_signal_or_restart
      3.20 ± 10%      -1.9        1.26        perf-profile.calltrace.cycles-pp.save_xstate_epilog.get_sigframe.x64_setup_rt_frame.handle_signal.arch_do_signal_or_restart
      2.96            -1.6        1.32        perf-profile.calltrace.cycles-pp.lapic_next_deadline.clockevents_program_event.hrtimer_start_range_ns.common_timer_set.do_timer_settime
      2.88 ±  6%      -1.6        1.24        perf-profile.calltrace.cycles-pp.__rseq_handle_notify_resume.handle_signal.arch_do_signal_or_restart.syscall_exit_to_user_mode.do_syscall_64
      2.86            -1.5        1.38        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.sigpending
      2.59            -1.3        1.26        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.sigpending
      2.00            -1.1        0.90        perf-profile.calltrace.cycles-pp.common_hrtimer_arm.common_timer_set.do_timer_settime.__x64_sys_timer_settime.do_syscall_64
      1.85 ±  4%      -1.0        0.80        perf-profile.calltrace.cycles-pp.restore_sigcontext.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.83 ±  4%      -1.0        0.78        perf-profile.calltrace.cycles-pp.check_xstate_in_sigframe.__fpu_restore_sig.fpu__restore_sig.restore_sigcontext.__x64_sys_rt_sigreturn
      1.87            -1.0        0.91        perf-profile.calltrace.cycles-pp.__x64_sys_rt_sigpending.do_syscall_64.entry_SYSCALL_64_after_hwframe.sigpending
      1.71 ±  5%      -1.0        0.76        perf-profile.calltrace.cycles-pp.rseq_ip_fixup.__rseq_handle_notify_resume.handle_signal.arch_do_signal_or_restart.syscall_exit_to_user_mode
      1.56 ±  5%      -0.9        0.67        perf-profile.calltrace.cycles-pp.restore_altstack.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
      1.98 ± 18%      -0.8        1.14 ±  5%  perf-profile.calltrace.cycles-pp.lapic_next_deadline.clockevents_program_event.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      1.37 ±  3%      -0.8        0.60        perf-profile.calltrace.cycles-pp.__get_user_nocheck_8.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.19 ±  4%      -0.7        0.51        perf-profile.calltrace.cycles-pp._copy_from_user.restore_sigcontext.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.14            -0.6        0.58        perf-profile.calltrace.cycles-pp.__hrtimer_start_range_ns.hrtimer_start_range_ns.common_timer_set.do_timer_settime.__x64_sys_timer_settime
      0.00            +0.6        0.55        perf-profile.calltrace.cycles-pp.__hrtimer_start_range_ns.hrtimer_start_range_ns.posixtimer_deliver_signal.dequeue_signal.get_signal
      0.00            +0.6        0.56        perf-profile.calltrace.cycles-pp.common_hrtimer_rearm.posixtimer_deliver_signal.dequeue_signal.get_signal.arch_do_signal_or_restart
      0.00            +0.6        0.57 ±  6%  perf-profile.calltrace.cycles-pp.__switch_to_asm.clock_nanosleep
      0.00            +0.6        0.57 ±  6%  perf-profile.calltrace.cycles-pp.irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.finish_task_switch.__schedule
      0.00            +0.6        0.58 ±  6%  perf-profile.calltrace.cycles-pp.__switch_to_asm
      0.00            +0.6        0.58 ±  7%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.get_itimerspec64.__x64_sys_timer_settime.do_syscall_64
      0.00            +0.6        0.62 ±  5%  perf-profile.calltrace.cycles-pp.rseq_ip_fixup.__rseq_handle_notify_resume.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.6        0.64 ±  5%  perf-profile.calltrace.cycles-pp.pick_next_task_fair.__schedule.schedule.do_nanosleep.hrtimer_nanosleep
      0.00            +0.6        0.65 ±  6%  perf-profile.calltrace.cycles-pp.update_load_avg.set_next_entity.pick_next_task_fair.__schedule.schedule_idle
      0.00            +0.7        0.66 ±  3%  perf-profile.calltrace.cycles-pp.finish_task_switch.__schedule.schedule.do_nanosleep.hrtimer_nanosleep
      0.00            +0.7        0.67 ±  2%  perf-profile.calltrace.cycles-pp.hrtimer_try_to_cancel.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.00            +0.7        0.68 ±  7%  perf-profile.calltrace.cycles-pp.prepare_task_switch.__schedule.schedule_idle.do_idle.cpu_startup_entry
      0.00            +0.7        0.69 ±  7%  perf-profile.calltrace.cycles-pp.select_task_rq.try_to_wake_up.complete_signal.send_sigqueue.posix_timer_fn
      0.00            +0.7        0.69 ±  5%  perf-profile.calltrace.cycles-pp.get_timespec64.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
      0.00            +0.7        0.70 ±  9%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.do_timer_settime.__x64_sys_timer_settime.do_syscall_64
      0.00            +0.7        0.73 ±  6%  perf-profile.calltrace.cycles-pp.native_apic_msr_eoi.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.finish_task_switch
      0.00            +0.7        0.74 ±  6%  perf-profile.calltrace.cycles-pp.os_xsave.clock_nanosleep
      0.00            +0.8        0.82 ±  6%  perf-profile.calltrace.cycles-pp.perf_trace_sched_wakeup_template.try_to_wake_up.complete_signal.send_sigqueue.posix_timer_fn
      0.00            +0.8        0.82 ±  5%  perf-profile.calltrace.cycles-pp.prepare_task_switch.__schedule.schedule.do_nanosleep.hrtimer_nanosleep
      0.00            +0.8        0.84 ±  7%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.get_itimerspec64.__x64_sys_timer_settime.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.9        0.85 ±  7%  perf-profile.calltrace.cycles-pp.update_load_avg.enqueue_entity.enqueue_task_fair.activate_task.ttwu_do_activate
      0.00            +0.9        0.92        perf-profile.calltrace.cycles-pp.__hrtimer_start_range_ns.hrtimer_start_range_ns.do_nanosleep.hrtimer_nanosleep.common_nsleep
      0.00            +1.0        1.00 ±  2%  perf-profile.calltrace.cycles-pp.queue_event.ordered_events__queue.process_simple.reader__read_event.perf_session__process_events
      0.00            +1.0        1.01 ±  2%  perf-profile.calltrace.cycles-pp.ordered_events__queue.process_simple.reader__read_event.perf_session__process_events.record__finish_output
      0.00            +1.0        1.04 ±  2%  perf-profile.calltrace.cycles-pp.process_simple.reader__read_event.perf_session__process_events.record__finish_output.__cmd_record
      0.00            +1.0        1.04 ±  5%  perf-profile.calltrace.cycles-pp.__rseq_handle_notify_resume.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_timer_handler
      0.00            +1.1        1.06 ± 10%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.timer_getoverrun
      0.00            +1.1        1.08 ±  9%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.do_syscall_64
      0.00            +1.1        1.08 ±  9%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.do_timer_settime.__x64_sys_timer_settime.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +1.1        1.10 ±  6%  perf-profile.calltrace.cycles-pp.update_load_avg.dequeue_entity.dequeue_task_fair.__schedule.schedule
     16.49            +1.1       17.59 ±  2%  perf-profile.calltrace.cycles-pp.timer_settime
      0.00            +1.1        1.11 ±  7%  perf-profile.calltrace.cycles-pp.update_curr.dequeue_entity.dequeue_task_fair.__schedule.schedule
      0.00            +1.2        1.20 ±  6%  perf-profile.calltrace.cycles-pp.set_next_entity.pick_next_task_fair.__schedule.schedule_idle.do_idle
      0.00            +1.3        1.26        perf-profile.calltrace.cycles-pp.lapic_next_deadline.clockevents_program_event.hrtimer_start_range_ns.posixtimer_deliver_signal.dequeue_signal
      0.00            +1.3        1.32        perf-profile.calltrace.cycles-pp.hrtimer_start_range_ns.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.00            +1.3        1.33 ±  9%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +1.5        1.49 ±  6%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt._copy_from_user
      0.00            +1.5        1.53        perf-profile.calltrace.cycles-pp.reader__read_event.perf_session__process_events.record__finish_output.__cmd_record
      0.00            +1.5        1.54        perf-profile.calltrace.cycles-pp.__cmd_record
      0.00            +1.5        1.54        perf-profile.calltrace.cycles-pp.perf_session__process_events.record__finish_output.__cmd_record
      0.00            +1.5        1.54        perf-profile.calltrace.cycles-pp.record__finish_output.__cmd_record
      0.00            +1.6        1.58 ±  9%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.do_syscall_64.entry_SYSCALL_64_after_hwframe.timer_settime
      0.00            +1.6        1.61 ±  6%  perf-profile.calltrace.cycles-pp.pick_next_task_fair.__schedule.schedule_idle.do_idle.cpu_startup_entry
     14.34 ±  2%      +1.7       16.08        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.timer_settime
      0.00            +1.8        1.76        perf-profile.calltrace.cycles-pp.clockevents_program_event.hrtimer_start_range_ns.posixtimer_deliver_signal.dequeue_signal.get_signal
      0.00            +1.8        1.84 ±  7%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt._copy_from_user.get_itimerspec64
      2.11 ±  3%      +2.0        4.10 ± 11%  perf-profile.calltrace.cycles-pp._copy_from_user.get_itimerspec64.__x64_sys_timer_settime.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +2.2        2.19 ±  7%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt._copy_from_user.get_itimerspec64.__x64_sys_timer_settime
     14.59 ±  2%      +2.2       16.83 ±  2%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.timer_settime
      0.00            +2.6        2.64 ±  7%  perf-profile.calltrace.cycles-pp.enqueue_entity.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_wake_up
      0.00            +2.9        2.91 ±  9%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.do_syscall_64.entry_SYSCALL_64_after_hwframe.timer_settime
      0.00            +3.0        2.96 ±  2%  perf-profile.calltrace.cycles-pp.hrtimer_start_range_ns.posixtimer_deliver_signal.dequeue_signal.get_signal.arch_do_signal_or_restart
      0.00            +3.0        3.04 ±  6%  perf-profile.calltrace.cycles-pp.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_wake_up.complete_signal
      2.55 ±  3%      +3.2        5.73 ±  6%  perf-profile.calltrace.cycles-pp.get_itimerspec64.__x64_sys_timer_settime.do_syscall_64.entry_SYSCALL_64_after_hwframe.timer_settime
      0.00            +3.2        3.24 ±  6%  perf-profile.calltrace.cycles-pp.activate_task.ttwu_do_activate.try_to_wake_up.complete_signal.send_sigqueue
      4.54 ± 23%      +3.5        8.02 ±  7%  perf-profile.calltrace.cycles-pp.get_signal.arch_do_signal_or_restart.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.82 ± 53%      +3.5        5.32 ±  8%  perf-profile.calltrace.cycles-pp.posixtimer_deliver_signal.dequeue_signal.get_signal.arch_do_signal_or_restart.syscall_exit_to_user_mode
      2.79 ± 33%      +3.7        6.45 ±  8%  perf-profile.calltrace.cycles-pp.dequeue_signal.get_signal.arch_do_signal_or_restart.syscall_exit_to_user_mode.do_syscall_64
      0.00            +3.7        3.68 ±  6%  perf-profile.calltrace.cycles-pp.ttwu_do_activate.try_to_wake_up.complete_signal.send_sigqueue.posix_timer_fn
      0.00            +3.7        3.73 ±  7%  perf-profile.calltrace.cycles-pp.dequeue_entity.dequeue_task_fair.__schedule.schedule.do_nanosleep
      0.00            +4.1        4.05 ±  8%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt._copy_from_user.get_itimerspec64.__x64_sys_timer_settime.do_syscall_64
      0.00            +4.2        4.24 ±  7%  perf-profile.calltrace.cycles-pp.dequeue_task_fair.__schedule.schedule.do_nanosleep.hrtimer_nanosleep
     29.54 ±  6%      +6.1       35.59        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
     29.58 ±  6%      +6.2       35.75        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.clock_nanosleep
      2.83 ±  6%      +6.2        9.07 ±  4%  perf-profile.calltrace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      1.45 ± 20%      +6.3        7.80 ±  5%  perf-profile.calltrace.cycles-pp.posix_timer_fn.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      0.00            +6.4        6.36 ±  6%  perf-profile.calltrace.cycles-pp.try_to_wake_up.complete_signal.send_sigqueue.posix_timer_fn.__hrtimer_run_queues
      0.70 ± 45%      +6.7        7.40 ±  5%  perf-profile.calltrace.cycles-pp.send_sigqueue.posix_timer_fn.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt
      0.00            +6.8        6.76 ±  6%  perf-profile.calltrace.cycles-pp.complete_signal.send_sigqueue.posix_timer_fn.__hrtimer_run_queues.hrtimer_interrupt
     29.59 ±  6%      +8.9       38.52        perf-profile.calltrace.cycles-pp.clock_nanosleep
      0.00            +9.3        9.31 ±  4%  perf-profile.calltrace.cycles-pp.__schedule.schedule.do_nanosleep.hrtimer_nanosleep.common_nsleep
      0.00            +9.7        9.69 ±  3%  perf-profile.calltrace.cycles-pp.schedule.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.00           +11.3       11.25 ±  4%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.finish_task_switch
      0.00           +12.3       12.26 ±  5%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.finish_task_switch.__schedule
      0.00           +13.0       13.03        perf-profile.calltrace.cycles-pp.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_64
      0.00           +13.6       13.57 ±  5%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.finish_task_switch.__schedule.schedule_idle
      0.00           +14.4       14.37        perf-profile.calltrace.cycles-pp.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00           +14.4       14.44        perf-profile.calltrace.cycles-pp.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
      0.00           +15.7       15.67        perf-profile.calltrace.cycles-pp.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
      0.00           +17.7       17.68 ±  5%  perf-profile.calltrace.cycles-pp.finish_task_switch.__schedule.schedule_idle.do_idle.cpu_startup_entry
      0.00           +19.2       19.16 ±  5%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.finish_task_switch.__schedule.schedule_idle.do_idle
      0.00           +22.8       22.79 ±  5%  perf-profile.calltrace.cycles-pp.__schedule.schedule_idle.do_idle.cpu_startup_entry.start_secondary
      0.00           +23.0       23.05 ±  5%  perf-profile.calltrace.cycles-pp.schedule_idle.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      0.00           +23.1       23.07 ±  5%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.common_startup_64
      0.00           +23.1       23.07 ±  5%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      0.00           +23.1       23.07 ±  5%  perf-profile.calltrace.cycles-pp.start_secondary.common_startup_64
      0.00           +23.4       23.45 ±  5%  perf-profile.calltrace.cycles-pp.common_startup_64
     40.41 ±  7%     -32.8        7.64        perf-profile.children.cycles-pp.stress_timer_handler
     33.62 ±  9%     -16.4       17.19 ±  3%  perf-profile.children.cycles-pp.arch_do_signal_or_restart
     35.39 ±  8%     -15.9       19.46 ±  2%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode
     21.30 ± 15%     -13.5        7.76        perf-profile.children.cycles-pp.handle_signal
     14.80 ±  4%      -8.4        6.40        perf-profile.children.cycles-pp.__x64_sys_rt_sigreturn
     69.70 ±  5%      -7.5       62.23        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     68.87 ±  5%      -7.3       61.59        perf-profile.children.cycles-pp.do_syscall_64
      6.66 ± 17%      -6.1        0.54        perf-profile.children.cycles-pp.signal_setup_done
     10.67 ± 12%      -6.0        4.67        perf-profile.children.cycles-pp.x64_setup_rt_frame
     10.48 ±  4%      -6.0        4.52        perf-profile.children.cycles-pp.restore_sigcontext
      6.62 ± 29%      -5.1        1.50        perf-profile.children.cycles-pp.fpu__clear_user_states
      5.22 ± 17%      -4.8        0.42        perf-profile.children.cycles-pp.__set_current_blocked
      9.35            -4.7        4.61        perf-profile.children.cycles-pp.common_timer_set
      8.32 ±  4%      -4.7        3.58        perf-profile.children.cycles-pp.fpu__restore_sig
      8.15 ±  4%      -4.6        3.50        perf-profile.children.cycles-pp.__fpu_restore_sig
      8.62 ±  7%      -4.6        3.99        perf-profile.children.cycles-pp.get_sigframe
     10.83 ±  4%      -3.7        7.13 ±  4%  perf-profile.children.cycles-pp.do_timer_settime
      5.03 ±  4%      -2.9        2.16        perf-profile.children.cycles-pp.restore_fpregs_from_user
      5.32            -2.8        2.57        perf-profile.children.cycles-pp.sigpending
      7.52 ±  3%      -2.5        5.04        perf-profile.children.cycles-pp.native_irq_return_iret
      4.52 ±  5%      -2.3        2.24        perf-profile.children.cycles-pp.copy_fpstate_to_sigframe
      2.45 ± 19%      -2.2        0.25 ± 12%  perf-profile.children.cycles-pp.sync_regs
      3.36 ± 11%      -2.0        1.33        perf-profile.children.cycles-pp.save_xstate_epilog
      2.29 ±  5%      -1.8        0.46 ±  2%  perf-profile.children.cycles-pp.fpregs_mark_activate
      2.11            -1.1        0.96        perf-profile.children.cycles-pp.common_hrtimer_arm
      2.71 ±  2%      -1.1        1.63        perf-profile.children.cycles-pp.entry_SYSCALL_64
      1.86 ±  4%      -1.1        0.80        perf-profile.children.cycles-pp.check_xstate_in_sigframe
      1.96            -1.0        0.95        perf-profile.children.cycles-pp.__x64_sys_rt_sigpending
      1.65 ±  4%      -1.0        0.66        perf-profile.children.cycles-pp.__get_user_nocheck_4
      1.62 ±  4%      -0.9        0.69        perf-profile.children.cycles-pp.restore_altstack
      1.34 ± 11%      -0.8        0.51        perf-profile.children.cycles-pp.__put_user_nocheck_4
      8.50 ±  2%      -0.8        7.66        perf-profile.children.cycles-pp.clockevents_program_event
      1.47 ±  3%      -0.8        0.64        perf-profile.children.cycles-pp.__get_user_nocheck_8
      1.96 ±  3%      -0.8        1.14        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      1.82            -0.7        1.13 ±  6%  perf-profile.children.cycles-pp._raw_spin_lock_irq
      2.95 ±  6%      -0.6        2.35 ±  2%  perf-profile.children.cycles-pp.__rseq_handle_notify_resume
      0.80 ±  6%      -0.6        0.21 ±  2%  perf-profile.children.cycles-pp.__local_bh_enable_ip
      0.96            -0.5        0.43        perf-profile.children.cycles-pp.set_current_blocked
      6.14 ±  2%      -0.5        5.62        perf-profile.children.cycles-pp.lapic_next_deadline
      0.91            -0.5        0.45        perf-profile.children.cycles-pp._copy_to_user
      1.80 ±  5%      -0.4        1.46 ±  2%  perf-profile.children.cycles-pp.rseq_ip_fixup
      0.53 ±  4%      -0.3        0.25 ±  2%  perf-profile.children.cycles-pp.do_sigpending
      1.04 ±  5%      -0.2        0.80 ±  2%  perf-profile.children.cycles-pp.rseq_update_cpu_node_id
      1.01 ±  3%      -0.2        0.77 ±  6%  perf-profile.children.cycles-pp.recalc_sigpending
      2.28 ±  3%      -0.2        2.05        perf-profile.children.cycles-pp.native_apic_msr_eoi
      0.68 ±  3%      -0.2        0.46        perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.72 ±  5%      -0.2        0.53        perf-profile.children.cycles-pp.__put_user_8
      0.32 ±  7%      -0.2        0.14 ±  3%  perf-profile.children.cycles-pp.rep_stos_alternative
      0.34 ±  4%      -0.2        0.16 ±  2%  perf-profile.children.cycles-pp.__check_object_size
      0.32 ±  5%      -0.2        0.16 ±  2%  perf-profile.children.cycles-pp.amd_clear_divider
      0.23 ±  6%      -0.1        0.10        perf-profile.children.cycles-pp.do_sigaltstack
      0.29 ±  3%      -0.1        0.17 ±  2%  perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.81 ±  4%      -0.1        0.70 ±  2%  perf-profile.children.cycles-pp.rseq_get_rseq_cs
      0.84 ±  3%      -0.1        0.74        perf-profile.children.cycles-pp.ktime_get_update_offsets_now
      0.17 ±  4%      -0.1        0.08 ±  6%  perf-profile.children.cycles-pp.__set_task_blocked
      0.27 ±  7%      -0.1        0.19 ±  3%  perf-profile.children.cycles-pp.fpu__alloc_mathframe
      0.62 ±  4%      -0.1        0.54 ±  2%  perf-profile.children.cycles-pp.__get_user_8
      0.42 ±  4%      -0.1        0.35 ±  3%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
      0.14 ±  3%      -0.1        0.07        perf-profile.children.cycles-pp.check_stack_object
      0.11 ±  3%      -0.1        0.06 ±  6%  perf-profile.children.cycles-pp.hrtimer_init
      0.14 ±  3%      -0.1        0.09 ±  7%  perf-profile.children.cycles-pp.sigismember
      0.10 ±  4%      -0.0        0.05 ±  8%  perf-profile.children.cycles-pp.sigismember@plt
      0.10 ±  3%      -0.0        0.05 ±  8%  perf-profile.children.cycles-pp.ktime_add_safe
      0.51 ±  2%      -0.0        0.47        perf-profile.children.cycles-pp.error_entry
      0.17 ±  4%      -0.0        0.15 ±  2%  perf-profile.children.cycles-pp.__cond_resched
      0.22 ±  2%      -0.0        0.19 ±  2%  perf-profile.children.cycles-pp.hrtimer_reprogram
      0.07            -0.0        0.05        perf-profile.children.cycles-pp.scheduler_tick
      0.06 ±  6%      +0.0        0.09 ±  5%  perf-profile.children.cycles-pp.error_return
      0.09 ±  5%      +0.0        0.11 ±  3%  perf-profile.children.cycles-pp.sched_clock_noinstr
      0.12 ±  4%      +0.0        0.16 ±  2%  perf-profile.children.cycles-pp.irqentry_enter
      0.08 ±  8%      +0.1        0.14 ±  3%  perf-profile.children.cycles-pp.restore_regs_and_return_to_kernel
      0.00            +0.1        0.05 ±  8%  perf-profile.children.cycles-pp.cgroup_rstat_updated
      1.38 ±  3%      +0.1        1.44        perf-profile.children.cycles-pp.irq_exit_rcu
      0.00            +0.1        0.06        perf-profile.children.cycles-pp.perf_swevent_get_recursion_context
      0.00            +0.1        0.06 ±  9%  perf-profile.children.cycles-pp.restore_fpregs_from_fpstate
      0.00            +0.1        0.06 ±  7%  perf-profile.children.cycles-pp.save_fpregs_to_fpstate
      0.00            +0.1        0.06 ±  7%  perf-profile.children.cycles-pp._raw_spin_trylock
      0.00            +0.1        0.07 ±  7%  perf-profile.children.cycles-pp.mem_cgroup_handle_over_high
      0.06 ± 46%      +0.1        0.13        perf-profile.children.cycles-pp.__do_softirq
      0.00            +0.1        0.07 ±  5%  perf-profile.children.cycles-pp.tick_check_oneshot_broadcast_this_cpu
      0.12 ±  6%      +0.1        0.20 ±  4%  perf-profile.children.cycles-pp.idle_cpu
      0.00            +0.1        0.07        perf-profile.children.cycles-pp.sched_update_worker
      0.00            +0.1        0.07 ±  6%  perf-profile.children.cycles-pp.mm_cid_get
      0.00            +0.1        0.07 ±  6%  perf-profile.children.cycles-pp.rebalance_domains
      0.00            +0.1        0.08 ±  6%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      0.00            +0.1        0.08 ±  9%  perf-profile.children.cycles-pp.evlist__event2evsel
      0.00            +0.1        0.08 ±  5%  perf-profile.children.cycles-pp.perf_exclude_event
      0.00            +0.1        0.08 ±  5%  perf-profile.children.cycles-pp.perf_trace_run_bpf_submit
      0.36 ±  4%      +0.1        0.45 ±  2%  perf-profile.children.cycles-pp.tick_program_event
      0.00            +0.1        0.10 ± 15%  perf-profile.children.cycles-pp.sched_ttwu_pending
      0.01 ±223%      +0.1        0.11 ±  6%  perf-profile.children.cycles-pp.task_curr
      0.27 ±  5%      +0.1        0.37 ±  3%  perf-profile.children.cycles-pp.get_nohz_timer_target
      0.00            +0.1        0.10 ±  7%  perf-profile.children.cycles-pp.perf_swevent_event
      0.00            +0.1        0.11 ±  6%  perf-profile.children.cycles-pp.ct_nmi_exit
      0.00            +0.1        0.11 ±  6%  perf-profile.children.cycles-pp.build_id__mark_dso_hit
      0.00            +0.1        0.11 ±  4%  perf-profile.children.cycles-pp.rcu_note_context_switch
      0.00            +0.1        0.11 ±  4%  perf-profile.children.cycles-pp.tick_irq_enter
      0.11 ±  3%      +0.1        0.22 ±  6%  perf-profile.children.cycles-pp.rb_insert_color
      0.00            +0.1        0.12 ± 16%  perf-profile.children.cycles-pp.__flush_smp_call_function_queue
      0.00            +0.1        0.12 ± 10%  perf-profile.children.cycles-pp.cpuacct_charge
      0.00            +0.1        0.12 ± 14%  perf-profile.children.cycles-pp.__sysvec_call_function_single
      0.00            +0.1        0.12 ±  3%  perf-profile.children.cycles-pp.tracing_gen_ctx_irq_test
      0.00            +0.1        0.12 ±  7%  perf-profile.children.cycles-pp.__rb_insert_augmented
      0.13 ± 17%      +0.1        0.26 ±  9%  perf-profile.children.cycles-pp.rb_next
      0.00            +0.1        0.13 ±  8%  perf-profile.children.cycles-pp.evsel__parse_sample
      0.00            +0.1        0.14 ±  8%  perf-profile.children.cycles-pp.perf_trace_sched_stat_runtime
      0.00            +0.1        0.14 ± 15%  perf-profile.children.cycles-pp.sysvec_call_function_single
      0.00            +0.1        0.14 ±  7%  perf-profile.children.cycles-pp.__cgroup_account_cputime
      0.00            +0.1        0.14 ±  8%  perf-profile.children.cycles-pp.perf_trace_buf_alloc
      0.12            +0.1        0.26 ±  3%  perf-profile.children.cycles-pp.irq_enter_rcu
      0.13 ±  2%      +0.2        0.28 ±  2%  perf-profile.children.cycles-pp.hrtimer_active
      0.00            +0.2        0.16 ± 13%  perf-profile.children.cycles-pp.asm_sysvec_call_function_single
      0.00            +0.2        0.16        perf-profile.children.cycles-pp.hrtimer_forward
      0.00            +0.2        0.16 ±  8%  perf-profile.children.cycles-pp.put_prev_entity
      0.00            +0.2        0.17 ±  8%  perf-profile.children.cycles-pp.ttwu_queue_wakelist
      0.00            +0.2        0.17 ±  3%  perf-profile.children.cycles-pp.update_curr_se
      0.00            +0.2        0.18 ±  4%  perf-profile.children.cycles-pp.resched_curr
      0.00            +0.2        0.18 ±  8%  perf-profile.children.cycles-pp.__enqueue_entity
      0.00            +0.2        0.20 ±  2%  perf-profile.children.cycles-pp.perf_trace_buf_update
      0.00            +0.2        0.20 ±  6%  perf-profile.children.cycles-pp.select_idle_core
      0.00            +0.2        0.21 ±  7%  perf-profile.children.cycles-pp.evlist__parse_sample
      0.07 ±  8%      +0.2        0.28 ±  3%  perf-profile.children.cycles-pp.irqentry_exit
      0.00            +0.2        0.22 ±  3%  perf-profile.children.cycles-pp.pick_eevdf
      0.00            +0.2        0.22 ±  6%  perf-profile.children.cycles-pp.select_idle_cpu
      0.00            +0.2        0.22 ±  2%  perf-profile.children.cycles-pp.update_irq_load_avg
      0.00            +0.2        0.22 ±  4%  perf-profile.children.cycles-pp.__update_idle_core
      0.00            +0.2        0.23 ±  6%  perf-profile.children.cycles-pp.perf_trace_sched_switch
      0.00            +0.3        0.25 ±  9%  perf-profile.children.cycles-pp.put_prev_task_fair
      0.38 ±  3%      +0.3        0.65 ±  3%  perf-profile.children.cycles-pp.timerqueue_add
      0.00            +0.3        0.26 ±  7%  perf-profile.children.cycles-pp.available_idle_cpu
      0.00            +0.3        0.28 ±  6%  perf-profile.children.cycles-pp.__rdgsbase_inactive
      0.18 ± 33%      +0.3        0.47 ±  8%  perf-profile.children.cycles-pp.rb_erase
      0.00            +0.3        0.30 ±  5%  perf-profile.children.cycles-pp.pick_next_task_idle
      0.00            +0.3        0.31 ±  9%  perf-profile.children.cycles-pp.update_min_vruntime
      0.00            +0.3        0.32 ±  4%  perf-profile.children.cycles-pp.switch_mm_irqs_off
      0.53            +0.3        0.86 ±  2%  perf-profile.children.cycles-pp.enqueue_hrtimer
      0.00            +0.3        0.34 ±  7%  perf-profile.children.cycles-pp.newidle_balance
      0.46 ± 30%      +0.3        0.81 ±  9%  perf-profile.children.cycles-pp.timerqueue_del
      0.00            +0.3        0.35 ±  2%  perf-profile.children.cycles-pp.__remove_hrtimer
      0.00            +0.3        0.35 ±  7%  perf-profile.children.cycles-pp.perf_session__deliver_event
      0.00            +0.4        0.35 ±  5%  perf-profile.children.cycles-pp.wakeup_preempt
      0.00            +0.4        0.35 ±  6%  perf-profile.children.cycles-pp.__dequeue_entity
      0.00            +0.4        0.38 ±  4%  perf-profile.children.cycles-pp.rest_init
      0.00            +0.4        0.38 ±  4%  perf-profile.children.cycles-pp.start_kernel
      0.00            +0.4        0.38 ±  4%  perf-profile.children.cycles-pp.x86_64_start_kernel
      0.00            +0.4        0.38 ±  4%  perf-profile.children.cycles-pp.x86_64_start_reservations
      0.85 ±  2%      +0.4        1.25        perf-profile.children.cycles-pp.native_sched_clock
      0.00            +0.4        0.41 ±  4%  perf-profile.children.cycles-pp.__calc_delta
      0.00            +0.4        0.41 ±  6%  perf-profile.children.cycles-pp.select_idle_sibling
      0.00            +0.4        0.43 ±  7%  perf-profile.children.cycles-pp.__ordered_events__flush
      0.00            +0.4        0.43 ±  7%  perf-profile.children.cycles-pp.perf_session__process_user_event
      0.00            +0.4        0.44 ±  5%  perf-profile.children.cycles-pp.avg_vruntime
      0.01 ±223%      +0.4        0.45 ± 14%  perf-profile.children.cycles-pp.stress_timer
      0.98 ±  2%      +0.4        1.43        perf-profile.children.cycles-pp.sched_clock
      0.00            +0.5        0.47 ±  7%  perf-profile.children.cycles-pp.hrtimer_init_sleeper
      0.00            +0.5        0.47 ±  7%  perf-profile.children.cycles-pp.reweight_entity
      0.00            +0.5        0.49 ±  5%  perf-profile.children.cycles-pp.__wrgsbase_inactive
      1.14 ±  3%      +0.5        1.64        perf-profile.children.cycles-pp.sched_clock_cpu
      0.00            +0.5        0.51 ±  5%  perf-profile.children.cycles-pp.place_entity
      0.33 ±  2%      +0.6        0.88 ±  2%  perf-profile.children.cycles-pp._raw_spin_lock
      0.00            +0.6        0.56 ±  3%  perf-profile.children.cycles-pp.update_rq_clock_task
      0.00            +0.6        0.58 ±  8%  perf-profile.children.cycles-pp.update_cfs_group
      0.01 ±223%      +0.6        0.60 ± 14%  perf-profile.children.cycles-pp.__nanosleep
      0.00            +0.6        0.59 ±  2%  perf-profile.children.cycles-pp.perf_tp_event
      0.00            +0.6        0.60        perf-profile.children.cycles-pp.common_hrtimer_rearm
      0.00            +0.6        0.65 ±  3%  perf-profile.children.cycles-pp.update_rq_clock
      0.00            +0.7        0.71 ±  5%  perf-profile.children.cycles-pp.get_timespec64
      0.00            +0.7        0.72 ±  6%  perf-profile.children.cycles-pp.select_task_rq_fair
      0.00            +0.7        0.75 ±  6%  perf-profile.children.cycles-pp.os_xsave
      6.63 ±  2%      +0.8        7.46        perf-profile.children.cycles-pp.hrtimer_start_range_ns
      0.00            +0.9        0.88 ±  6%  perf-profile.children.cycles-pp.select_task_rq
      0.00            +0.9        0.89 ±  6%  perf-profile.children.cycles-pp.__update_load_avg_se
      0.18 ±  2%      +0.9        1.10 ±  2%  perf-profile.children.cycles-pp.hrtimer_try_to_cancel
      0.00            +0.9        0.94 ±  2%  perf-profile.children.cycles-pp.perf_trace_sched_wakeup_template
      1.22            +1.0        2.18        perf-profile.children.cycles-pp.__hrtimer_start_range_ns
      0.00            +1.0        1.00 ±  2%  perf-profile.children.cycles-pp.queue_event
      0.00            +1.0        1.01 ±  7%  perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
      0.00            +1.0        1.01 ±  2%  perf-profile.children.cycles-pp.ordered_events__queue
      0.00            +1.0        1.04 ±  2%  perf-profile.children.cycles-pp.process_simple
      0.00            +1.0        1.05 ±  6%  perf-profile.children.cycles-pp.___perf_sw_event
      0.00            +1.2        1.21 ±  6%  perf-profile.children.cycles-pp.__switch_to_asm
      0.00            +1.3        1.30 ±  5%  perf-profile.children.cycles-pp.__switch_to
      0.00            +1.3        1.30 ±  6%  perf-profile.children.cycles-pp.set_next_entity
     16.53            +1.4       17.90 ±  2%  perf-profile.children.cycles-pp.timer_settime
      0.00            +1.4        1.42 ±  3%  perf-profile.children.cycles-pp.update_curr
      0.00            +1.5        1.53        perf-profile.children.cycles-pp.reader__read_event
      0.00            +1.5        1.54        perf-profile.children.cycles-pp.perf_session__process_events
      0.00            +1.5        1.54        perf-profile.children.cycles-pp.record__finish_output
      0.00            +1.6        1.56 ±  6%  perf-profile.children.cycles-pp.prepare_task_switch
      0.00            +1.6        1.57        perf-profile.children.cycles-pp.__cmd_record
      4.71 ±  4%      +1.7        6.43 ±  4%  perf-profile.children.cycles-pp._copy_from_user
      0.00            +2.4        2.36 ±  2%  perf-profile.children.cycles-pp.pick_next_task_fair
      0.00            +2.9        2.87 ±  7%  perf-profile.children.cycles-pp.enqueue_entity
      0.00            +2.9        2.90 ±  6%  perf-profile.children.cycles-pp.update_load_avg
      0.00            +3.2        3.22 ±  6%  perf-profile.children.cycles-pp.enqueue_task_fair
      2.61 ±  3%      +3.4        5.99 ±  6%  perf-profile.children.cycles-pp.get_itimerspec64
     26.40            +3.4       29.81        perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.00            +3.4        3.41 ±  6%  perf-profile.children.cycles-pp.activate_task
      1.92 ± 50%      +3.6        5.51 ±  8%  perf-profile.children.cycles-pp.posixtimer_deliver_signal
      4.70 ± 23%      +3.6        8.30 ±  8%  perf-profile.children.cycles-pp.get_signal
      2.87 ± 32%      +3.8        6.62 ±  9%  perf-profile.children.cycles-pp.dequeue_signal
      0.00            +3.9        3.86 ±  7%  perf-profile.children.cycles-pp.dequeue_entity
      0.00            +3.9        3.89 ±  6%  perf-profile.children.cycles-pp.ttwu_do_activate
      0.00            +4.3        4.27 ±  7%  perf-profile.children.cycles-pp.dequeue_task_fair
     13.90 ±  4%      +6.1       20.00        perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
     11.38 ±  6%      +6.4       17.76        perf-profile.children.cycles-pp.hrtimer_interrupt
     16.28 ±  3%      +6.4       22.71        perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.05 ± 81%      +6.9        6.90 ±  5%  perf-profile.children.cycles-pp.try_to_wake_up
      2.73 ± 22%      +7.0        9.72        perf-profile.children.cycles-pp.posix_timer_fn
      0.39 ± 20%      +7.0        7.42 ±  4%  perf-profile.children.cycles-pp.complete_signal
      4.40 ± 21%      +7.0       11.44        perf-profile.children.cycles-pp.__hrtimer_run_queues
      1.72 ±  5%      +7.1        8.80 ±  3%  perf-profile.children.cycles-pp.send_sigqueue
     29.59 ±  6%      +9.3       38.89        perf-profile.children.cycles-pp.clock_nanosleep
      0.00            +9.7        9.73 ±  3%  perf-profile.children.cycles-pp.schedule
      0.00           +13.3       13.28        perf-profile.children.cycles-pp.do_nanosleep
      0.02 ±141%     +14.4       14.41        perf-profile.children.cycles-pp.hrtimer_nanosleep
      0.02 ±141%     +14.6       14.58        perf-profile.children.cycles-pp.common_nsleep
      0.04 ± 44%     +15.7       15.70        perf-profile.children.cycles-pp.__x64_sys_clock_nanosleep
      0.05 ± 45%     +19.8       19.84 ±  5%  perf-profile.children.cycles-pp.finish_task_switch
      0.06 ± 11%     +23.0       23.07 ±  5%  perf-profile.children.cycles-pp.start_secondary
      0.06 ± 11%     +23.4       23.44 ±  5%  perf-profile.children.cycles-pp.schedule_idle
      0.06 ± 11%     +23.4       23.45 ±  5%  perf-profile.children.cycles-pp.common_startup_64
      0.06 ± 11%     +23.4       23.45 ±  5%  perf-profile.children.cycles-pp.cpu_startup_entry
      0.06 ± 11%     +23.4       23.45 ±  5%  perf-profile.children.cycles-pp.do_idle
      0.10 ± 13%     +32.7       32.75 ±  4%  perf-profile.children.cycles-pp.__schedule
      5.70 ± 15%      -4.8        0.87 ±  3%  perf-profile.self.cycles-pp.stress_timer_handler
      4.47 ±  4%      -2.5        1.94        perf-profile.self.cycles-pp.restore_fpregs_from_user
      7.51 ±  3%      -2.5        5.03        perf-profile.self.cycles-pp.native_irq_return_iret
      2.44 ± 19%      -2.2        0.24 ± 11%  perf-profile.self.cycles-pp.sync_regs
      3.27 ± 10%      -2.0        1.24        perf-profile.self.cycles-pp.fpu__clear_user_states
      3.88 ±  2%      -1.9        1.94        perf-profile.self.cycles-pp.copy_fpstate_to_sigframe
      1.26 ± 20%      -1.2        0.08        perf-profile.self.cycles-pp.__set_current_blocked
      4.60 ±  3%      -1.1        3.48 ±  2%  perf-profile.self.cycles-pp._copy_from_user
      1.62 ±  6%      -1.0        0.66        perf-profile.self.cycles-pp.x64_setup_rt_frame
      1.52 ±  2%      -0.9        0.64        perf-profile.self.cycles-pp.__get_user_nocheck_4
      1.40 ±  3%      -0.8        0.61        perf-profile.self.cycles-pp.__get_user_nocheck_8
      1.89 ±  3%      -0.8        1.11        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      1.13 ±  2%      -0.8        0.37 ±  2%  perf-profile.self.cycles-pp.fpregs_mark_activate
      1.28 ±  4%      -0.7        0.56        perf-profile.self.cycles-pp.__fpu_restore_sig
      1.12            -0.7        0.46        perf-profile.self.cycles-pp.__put_user_nocheck_4
      1.11            -0.6        0.51        perf-profile.self.cycles-pp.save_xstate_epilog
      1.06 ±  4%      -0.6        0.46        perf-profile.self.cycles-pp.check_xstate_in_sigframe
      1.64            -0.6        1.05 ±  6%  perf-profile.self.cycles-pp._raw_spin_lock_irq
      6.10 ±  2%      -0.5        5.58        perf-profile.self.cycles-pp.lapic_next_deadline
      0.88 ±  4%      -0.5        0.39        perf-profile.self.cycles-pp.restore_sigcontext
      0.88 ±  2%      -0.5        0.42        perf-profile.self.cycles-pp._copy_to_user
      0.57 ± 13%      -0.5        0.11 ±  4%  perf-profile.self.cycles-pp.signal_setup_done
      0.67 ±  3%      -0.4        0.31        perf-profile.self.cycles-pp.sigpending
      0.70 ±  3%      -0.4        0.34        perf-profile.self.cycles-pp.timer_settime
      0.87 ±  2%      -0.3        0.52        perf-profile.self.cycles-pp.entry_SYSCALL_64
      0.46 ±  5%      -0.3        0.16 ±  2%  perf-profile.self.cycles-pp.__local_bh_enable_ip
      0.49            -0.2        0.26        perf-profile.self.cycles-pp.get_sigframe
      2.26 ±  3%      -0.2        2.03        perf-profile.self.cycles-pp.native_apic_msr_eoi
      0.41 ±  4%      -0.2        0.18 ±  2%  perf-profile.self.cycles-pp.__x64_sys_rt_sigreturn
      0.96 ±  3%      -0.2        0.73 ±  6%  perf-profile.self.cycles-pp.recalc_sigpending
      0.90 ±  2%      -0.2        0.68        perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.68 ±  3%      -0.2        0.46        perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.39 ±  3%      -0.2        0.17 ±  4%  perf-profile.self.cycles-pp.common_timer_set
      0.35 ±  6%      -0.2        0.14 ±  3%  perf-profile.self.cycles-pp.common_hrtimer_arm
      0.97 ±  6%      -0.2        0.76        perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.97 ±  2%      -0.2        0.77 ±  2%  perf-profile.self.cycles-pp.rseq_update_cpu_node_id
      1.19            -0.2        1.02        perf-profile.self.cycles-pp.get_signal
      0.45            -0.2        0.28        perf-profile.self.cycles-pp.handle_signal
      0.66 ±  2%      -0.2        0.50        perf-profile.self.cycles-pp.__put_user_8
      0.75 ±  7%      -0.2        0.60        perf-profile.self.cycles-pp.arch_do_signal_or_restart
      0.26 ±  4%      -0.1        0.12 ±  3%  perf-profile.self.cycles-pp.restore_altstack
      0.25 ±  3%      -0.1        0.11        perf-profile.self.cycles-pp.__x64_sys_rt_sigpending
      0.70 ±  3%      -0.1        0.57 ±  5%  perf-profile.self.cycles-pp.timer_getoverrun
      0.22 ±  4%      -0.1        0.10        perf-profile.self.cycles-pp.set_current_blocked
      0.28 ±  3%      -0.1        0.16 ±  2%  perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.21 ±  7%      -0.1        0.09        perf-profile.self.cycles-pp.do_sigaltstack
      0.22 ±  2%      -0.1        0.10 ±  4%  perf-profile.self.cycles-pp.rep_stos_alternative
      0.19            -0.1        0.08 ±  5%  perf-profile.self.cycles-pp.do_sigpending
      0.17 ±  2%      -0.1        0.07 ±  6%  perf-profile.self.cycles-pp.fpu__restore_sig
      0.18 ±  5%      -0.1        0.08 ±  5%  perf-profile.self.cycles-pp.__check_object_size
      0.18 ±  5%      -0.1        0.10 ±  5%  perf-profile.self.cycles-pp.amd_clear_divider
      0.13 ±  6%      -0.1        0.06 ±  6%  perf-profile.self.cycles-pp.__set_task_blocked
      0.34 ±  4%      -0.1        0.28        perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
      0.75            -0.1        0.68        perf-profile.self.cycles-pp.__hrtimer_init
      0.58            -0.1        0.52 ±  3%  perf-profile.self.cycles-pp.__get_user_8
      0.31 ±  4%      -0.1        0.25 ±  5%  perf-profile.self.cycles-pp.__x64_sys_timer_settime
      0.21 ±  2%      -0.1        0.16 ±  3%  perf-profile.self.cycles-pp.fpu__alloc_mathframe
      0.30 ±  4%      -0.1        0.25 ±  4%  perf-profile.self.cycles-pp.rseq_ip_fixup
      0.11 ±  4%      -0.1        0.06 ±  8%  perf-profile.self.cycles-pp.check_stack_object
      0.12 ±  3%      -0.0        0.08 ±  6%  perf-profile.self.cycles-pp.sigismember
      0.26 ±  4%      -0.0        0.22 ±  2%  perf-profile.self.cycles-pp.__sysvec_apic_timer_interrupt
      0.49 ±  2%      -0.0        0.45        perf-profile.self.cycles-pp.error_entry
      0.30 ±  2%      -0.0        0.26        perf-profile.self.cycles-pp.ktime_get_update_offsets_now
      0.16 ±  4%      -0.0        0.14 ±  4%  perf-profile.self.cycles-pp.rseq_get_rseq_cs
      0.19 ±  2%      -0.0        0.17 ±  2%  perf-profile.self.cycles-pp.hrtimer_reprogram
      0.10 ±  5%      -0.0        0.08        perf-profile.self.cycles-pp.__cond_resched
      0.08 ±  4%      +0.0        0.10 ±  5%  perf-profile.self.cycles-pp.irqentry_enter
      0.08 ±  7%      +0.0        0.10 ±  3%  perf-profile.self.cycles-pp.irq_enter_rcu
      0.21 ±  4%      +0.0        0.24        perf-profile.self.cycles-pp.prepare_signal
      0.09 ±  5%      +0.0        0.12 ±  3%  perf-profile.self.cycles-pp.sched_clock
      0.23            +0.0        0.26        perf-profile.self.cycles-pp.sysvec_apic_timer_interrupt
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.mem_cgroup_handle_over_high
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.perf_swevent_get_recursion_context
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.sched_clock_noinstr
      0.17 ±  4%      +0.1        0.22 ±  2%  perf-profile.self.cycles-pp.sched_clock_cpu
      0.13 ±  4%      +0.1        0.18 ±  2%  perf-profile.self.cycles-pp.enqueue_hrtimer
      0.00            +0.1        0.06 ±  9%  perf-profile.self.cycles-pp.hrtimer_init_sleeper
      0.00            +0.1        0.06 ±  9%  perf-profile.self.cycles-pp.restore_fpregs_from_fpstate
      0.00            +0.1        0.06        perf-profile.self.cycles-pp.sched_update_worker
      0.00            +0.1        0.06 ±  6%  perf-profile.self.cycles-pp.tick_check_oneshot_broadcast_this_cpu
      0.01 ±223%      +0.1        0.07        perf-profile.self.cycles-pp.error_return
      0.24 ±  3%      +0.1        0.30        perf-profile.self.cycles-pp.posixtimer_deliver_signal
      0.00            +0.1        0.06 ±  7%  perf-profile.self.cycles-pp._raw_spin_trylock
      0.00            +0.1        0.06 ±  7%  perf-profile.self.cycles-pp.perf_exclude_event
      0.00            +0.1        0.07 ±  7%  perf-profile.self.cycles-pp.mm_cid_get
      0.10 ±  8%      +0.1        0.17 ±  6%  perf-profile.self.cycles-pp.idle_cpu
      0.00            +0.1        0.07 ± 14%  perf-profile.self.cycles-pp.perf_trace_buf_alloc
      0.00            +0.1        0.07 ±  6%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      0.00            +0.1        0.08 ± 10%  perf-profile.self.cycles-pp.evlist__event2evsel
      0.00            +0.1        0.08 ±  6%  perf-profile.self.cycles-pp.perf_trace_run_bpf_submit
      0.00            +0.1        0.08        perf-profile.self.cycles-pp.perf_trace_buf_update
      0.00            +0.1        0.08 ±  8%  perf-profile.self.cycles-pp.__ordered_events__flush
      0.00            +0.1        0.08 ±  8%  perf-profile.self.cycles-pp.pick_next_task_idle
      0.00            +0.1        0.08 ±  8%  perf-profile.self.cycles-pp.select_idle_sibling
      0.32 ±  4%      +0.1        0.41 ±  2%  perf-profile.self.cycles-pp.tick_program_event
      0.00            +0.1        0.09 ±  4%  perf-profile.self.cycles-pp.__remove_hrtimer
      0.00            +0.1        0.09 ± 13%  perf-profile.self.cycles-pp.common_hrtimer_rearm
      0.00            +0.1        0.09 ±  4%  perf-profile.self.cycles-pp.perf_swevent_event
      0.01 ±223%      +0.1        0.10 ±  7%  perf-profile.self.cycles-pp.task_curr
      0.00            +0.1        0.09 ± 14%  perf-profile.self.cycles-pp.__cgroup_account_cputime
      0.34 ±  4%      +0.1        0.44 ±  5%  perf-profile.self.cycles-pp.get_itimerspec64
      0.25 ±  5%      +0.1        0.35 ±  3%  perf-profile.self.cycles-pp.get_nohz_timer_target
      0.00            +0.1        0.10 ±  4%  perf-profile.self.cycles-pp.rcu_note_context_switch
      0.01 ±223%      +0.1        0.11 ±  5%  perf-profile.self.cycles-pp.restore_regs_and_return_to_kernel
      0.11 ±  4%      +0.1        0.21 ±  3%  perf-profile.self.cycles-pp.hrtimer_active
      0.00            +0.1        0.10 ±  4%  perf-profile.self.cycles-pp.ct_nmi_exit
      0.12 ± 21%      +0.1        0.22 ± 10%  perf-profile.self.cycles-pp.rb_next
      0.07            +0.1        0.18 ±  8%  perf-profile.self.cycles-pp.rb_insert_color
      0.05            +0.1        0.16 ±  4%  perf-profile.self.cycles-pp.irqentry_exit
      0.00            +0.1        0.11 ±  8%  perf-profile.self.cycles-pp.__rb_insert_augmented
      0.00            +0.1        0.11 ±  8%  perf-profile.self.cycles-pp.cpuacct_charge
      0.00            +0.1        0.11 ± 12%  perf-profile.self.cycles-pp.put_prev_task_fair
      0.00            +0.1        0.11        perf-profile.self.cycles-pp.get_timespec64
      0.00            +0.1        0.11 ± 13%  perf-profile.self.cycles-pp.put_prev_entity
      0.00            +0.1        0.12 ±  4%  perf-profile.self.cycles-pp.tracing_gen_ctx_irq_test
      0.28 ± 21%      +0.1        0.40 ± 17%  perf-profile.self.cycles-pp.complete_signal
      0.00            +0.1        0.13 ±  8%  perf-profile.self.cycles-pp.evsel__parse_sample
      0.00            +0.1        0.13 ±  8%  perf-profile.self.cycles-pp.perf_trace_sched_stat_runtime
      0.00            +0.1        0.13 ±  5%  perf-profile.self.cycles-pp.update_rq_clock
      0.00            +0.1        0.14 ±  7%  perf-profile.self.cycles-pp.ttwu_queue_wakelist
      0.00            +0.1        0.14 ±  6%  perf-profile.self.cycles-pp.ttwu_do_activate
      0.30 ±  3%      +0.1        0.44 ±  2%  perf-profile.self.cycles-pp.timerqueue_add
      0.00            +0.2        0.15        perf-profile.self.cycles-pp.hrtimer_forward
      0.06 ±  8%      +0.2        0.21 ±  2%  perf-profile.self.cycles-pp.hrtimer_try_to_cancel
      0.00            +0.2        0.15 ±  3%  perf-profile.self.cycles-pp.perf_trace_sched_wakeup_template
      0.00            +0.2        0.15 ±  4%  perf-profile.self.cycles-pp.update_curr_se
      0.00            +0.2        0.16 ±  7%  perf-profile.self.cycles-pp.activate_task
      0.00            +0.2        0.16 ±  7%  perf-profile.self.cycles-pp.select_task_rq
      0.00            +0.2        0.16 ±  7%  perf-profile.self.cycles-pp.wakeup_preempt
      0.00            +0.2        0.16 ±  5%  perf-profile.self.cycles-pp.common_nsleep
      0.00            +0.2        0.17 ±  7%  perf-profile.self.cycles-pp.__enqueue_entity
      0.00            +0.2        0.17 ±  4%  perf-profile.self.cycles-pp.resched_curr
      0.40 ±  3%      +0.2        0.57 ±  6%  perf-profile.self.cycles-pp.do_timer_settime
      0.00            +0.2        0.17 ±  4%  perf-profile.self.cycles-pp.schedule_idle
      0.00            +0.2        0.20 ±  5%  perf-profile.self.cycles-pp.perf_trace_sched_switch
      0.00            +0.2        0.20 ±  4%  perf-profile.self.cycles-pp.pick_eevdf
      0.00            +0.2        0.20 ±  6%  perf-profile.self.cycles-pp.place_entity
      0.00            +0.2        0.20 ±  5%  perf-profile.self.cycles-pp.__update_idle_core
      0.44 ±  3%      +0.2        0.65        perf-profile.self.cycles-pp.__hrtimer_start_range_ns
      0.00            +0.2        0.21 ±  2%  perf-profile.self.cycles-pp.update_irq_load_avg
      0.00            +0.2        0.22 ±  3%  perf-profile.self.cycles-pp.schedule
      0.00            +0.2        0.24 ±  5%  perf-profile.self.cycles-pp.__dequeue_entity
      0.00            +0.2        0.24 ±  6%  perf-profile.self.cycles-pp.available_idle_cpu
      0.00            +0.3        0.26 ±  5%  perf-profile.self.cycles-pp.set_next_entity
      0.00            +0.3        0.26 ±  5%  perf-profile.self.cycles-pp.__rdgsbase_inactive
      0.00            +0.3        0.27 ± 10%  perf-profile.self.cycles-pp.update_min_vruntime
      1.37 ±  2%      +0.3        1.64 ±  3%  perf-profile.self.cycles-pp.do_syscall_64
      0.15 ± 43%      +0.3        0.43 ±  8%  perf-profile.self.cycles-pp.rb_erase
      0.02 ±149%      +0.3        0.32        perf-profile.self.cycles-pp.try_to_wake_up
      0.00            +0.3        0.31 ±  4%  perf-profile.self.cycles-pp.switch_mm_irqs_off
      0.00            +0.3        0.31 ±  6%  perf-profile.self.cycles-pp.select_task_rq_fair
      0.00            +0.3        0.32 ±  7%  perf-profile.self.cycles-pp.newidle_balance
      0.00            +0.3        0.32 ±  2%  perf-profile.self.cycles-pp.stress_timer
      0.00            +0.3        0.33 ±  4%  perf-profile.self.cycles-pp.update_rq_clock_task
      0.00            +0.4        0.35 ±  5%  perf-profile.self.cycles-pp.enqueue_task_fair
      0.00            +0.4        0.36 ±  4%  perf-profile.self.cycles-pp.__nanosleep
      0.00            +0.4        0.39 ±  3%  perf-profile.self.cycles-pp.perf_tp_event
      0.00            +0.4        0.39 ±  4%  perf-profile.self.cycles-pp.__calc_delta
      0.00            +0.4        0.39 ±  2%  perf-profile.self.cycles-pp.pick_next_task_fair
      0.81 ±  2%      +0.4        1.20        perf-profile.self.cycles-pp.native_sched_clock
      0.00            +0.4        0.40 ±  7%  perf-profile.self.cycles-pp.dequeue_task_fair
      0.00            +0.4        0.40 ±  5%  perf-profile.self.cycles-pp.avg_vruntime
      0.00            +0.4        0.40 ±  3%  perf-profile.self.cycles-pp.__x64_sys_clock_nanosleep
      0.00            +0.4        0.41 ±  5%  perf-profile.self.cycles-pp.clock_nanosleep
      0.00            +0.5        0.45 ±  7%  perf-profile.self.cycles-pp.reweight_entity
      0.00            +0.5        0.47 ±  5%  perf-profile.self.cycles-pp.__wrgsbase_inactive
      0.31            +0.5        0.80 ±  2%  perf-profile.self.cycles-pp._raw_spin_lock
      0.00            +0.5        0.52 ±  6%  perf-profile.self.cycles-pp.prepare_task_switch
      0.00            +0.5        0.53 ±  8%  perf-profile.self.cycles-pp.update_cfs_group
      0.00            +0.6        0.56 ±  6%  perf-profile.self.cycles-pp.update_curr
      0.00            +0.6        0.56 ±  6%  perf-profile.self.cycles-pp.dequeue_entity
      0.00            +0.6        0.58 ±  7%  perf-profile.self.cycles-pp.enqueue_entity
      0.00            +0.6        0.61 ±  2%  perf-profile.self.cycles-pp.hrtimer_nanosleep
      0.00            +0.6        0.64 ± 13%  perf-profile.self.cycles-pp.do_nanosleep
      0.00            +0.7        0.74 ±  6%  perf-profile.self.cycles-pp.os_xsave
      0.00            +0.8        0.80 ±  6%  perf-profile.self.cycles-pp.__update_load_avg_se
      0.00            +0.9        0.86 ±  6%  perf-profile.self.cycles-pp.___perf_sw_event
      0.00            +0.9        0.93 ±  7%  perf-profile.self.cycles-pp.__update_load_avg_cfs_rq
      0.00            +1.0        1.00 ±  2%  perf-profile.self.cycles-pp.queue_event
      0.00            +1.1        1.06 ±  7%  perf-profile.self.cycles-pp.update_load_avg
      0.00            +1.2        1.20 ±  5%  perf-profile.self.cycles-pp.__switch_to_asm
      0.00            +1.2        1.25 ±  5%  perf-profile.self.cycles-pp.__switch_to
      0.00            +1.8        1.81 ±  3%  perf-profile.self.cycles-pp.__schedule
      0.00            +3.4        3.35 ±  5%  perf-profile.self.cycles-pp.finish_task_switch





Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

