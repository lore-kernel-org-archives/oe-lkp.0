Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355923D0BE
	for <oe-lkp@lists.linux.dev>; Thu, 29 Feb 2024 14:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709217120; cv=fail; b=kDq8ZjYbkNozwe+/0ILtAuEA7qzSZxXVNom13LKu3pjCNjH4cFBW8aDKILkIjGoCIK1zFFd+TdxIlFN0/ILFkZra8/scCnyAs2sCon0pfOWUW7c9P2P5Ih2aYVeKVrFwzMosc2bo10JV1Z8mQPuAIYL5tW2/B8a+S+2DKU/ZbxY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709217120; c=relaxed/simple;
	bh=0slh0p88UcdS6k+gtg0oH5khVltJjdbBJBvB7khp3b8=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=OaJTFSJH/+i/olgWrJhKwO+73/FO4QJkvPghHX7wY4MOhKwHSMEAmgAUtK8nvFb51GIahN5pYpALyzpQfkb62FePfQ3IF9iPdypFSiolnm3rYRd/CdKy49kegFDZVr0xixKZPsuQstW3fmE8lTKxUhm5apEr7BkguEoOqm2jnsI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fa6Qy0Rg; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fa6Qy0Rg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709217117; x=1740753117;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=0slh0p88UcdS6k+gtg0oH5khVltJjdbBJBvB7khp3b8=;
  b=fa6Qy0RgkRsrQP5mSQMDsAQFCdTHdMdAci0v8KMkWY+CPjp0svGquq/V
   8pVqUatWCslsDuUcOGeaJ374KrGqitm5ipxXzz6QMHFIAp/w4VXJIl7z1
   TGAF5yxhyjQDTuCarNpooOvWyoT0Y8qZGJ9J27A0LjmiFt5xy/3YIqz35
   fGxvZyjJdtYbsGt+M8aNqEfrmSEyp7iq7WUDe869JtYETZN/IZhirrXzC
   8N8ArsKPQNxy+DR6X1hQSz+GEpEuOw+Ltraql96kvZd8AEts+lCnAwVyB
   hFGyYRAVBpH76XgIWOjcW6707ua82C4U+fic/51CQojQchZ1PIOAQ9J5L
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="14323837"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="14323837"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 06:31:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7717025"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 29 Feb 2024 06:31:56 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 06:31:55 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 29 Feb 2024 06:31:55 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 29 Feb 2024 06:31:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ANVl4BttePVhW9dbf3q74kHygcVKqapdxrMRpsFdDUTMu9r9NDmvkNeKdKq6B2vyFgFgh8g808XKyaBM/qL9P0IcmOdghMW9ZaDlabQojBkcD1WWpHHfVfA8jiJslgzsYil1SQJLx9NI4/b4YGI/e/i3ioL+P2S7BjzaF8qH5uULFGHHk4+dFJGg3RvY9jH+N5OsDEqUQjnLnF6IPf4bZnAjeKG2VVD+23b6uzbJWr8vZq0zf/+4vlgi5aTA5DfkjZlOK0etw0ydgObaIcxmX3ppBO935FopcFSuDpxlq0kKxqtKDEAOdA+0nHUbd5c/9J3JegqmXm+ppriN206saQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=whHA6fAlJ441wZNtvhlaWEwj1+BEVm6xCMBrNVdKxOo=;
 b=Au4nrah0qKcLUk9T+7sJejvjJU/ektZXpeBnjh7WWnys4ykhbM3dRqkA4jd3vbY0bxVRZ7VFy+9XEI4boeBya4EK0AWmiE+vMWrB304FFsW8yum7OtDtiY0tHxciqE7aRJsBz3FQgsANlIxep/yJ3xHZBIVcD2KTsaMHAVwC+Gpr1582YbttYWcseMqsstVeVW0phIGOWyqXftYlDBw7EtudXYzDTBVuCeBxWWML54tXcX6C3i95HlUG7jZFZ8kX1/7w1xWsvjiTpj+KAPqa9Yr26dUgKTLDm3Yp7DCi1CSG6AIgu292Ay8FIZBdAlc9WyvV55kQVc3Ia2J4rsclXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SA2PR11MB4890.namprd11.prod.outlook.com (2603:10b6:806:117::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.16; Thu, 29 Feb
 2024 14:31:50 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e%3]) with mapi id 15.20.7339.024; Thu, 29 Feb 2024
 14:31:50 +0000
Date: Thu, 29 Feb 2024 22:31:43 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Joel Fernandes <joel@joelfernandes.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [jfern:tick/keep-tick-on-hrt] [tick]  0a35d7bf32:
 stress-ng.uprobe.ops_per_sec -38.9% regression
Message-ID: <202402292258.726df765-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:4:194::20) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SA2PR11MB4890:EE_
X-MS-Office365-Filtering-Correlation-Id: 99b13146-a317-49cf-63e3-08dc39332ab9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q1ip4dI/o5v1TNcwi9QiXwV3ZE88X9VFuyXBu1s3W9euJ3X0EyDok2mbdHLXY/sTRi1biRdnmaHBv6WqWUfMgiYO0g40BWYsjXOdmhP8ue9JkjCGVdFPQLgPfbr8qfqcsHQV27Sj332Ee5un3hxUOLAnKD8jLNJMmATPwLNoRs5Oa7mE+6qq/MuYIFNkJ62Oqb19dN/380KWC0jKJntb6K+uKPn5B3/fXP6hGlNF9fQY8w1bECEUYV749tiTFANJDWjhKxprt3DyccLMrD281y1r+cGd1fw6rgEpzSgz7RViy0ExI+VjQVhQbJmLI55hyA7v5rwruUXxCecczVSvOIhrEBCrr4131WdzjdAP3N8464ExmXNIKt96OgYrg/l3Ak258jAUSXMy6kTvgqgct88IN1VZ3mky/DvdRapP906YPyBY2DtFrskD7YBGAbox84el0A8D0fCZPA+RFfAoQxbyld6jf44mxTFtAh++dyjVKCotl/YTd1XSkmWf8u6o/IXuQITYaIEV47pvVYn7KL/TLx0++37LDetM4mbhaDGJPOGfTCFwHkGVX8u4cHYgr/+1Z6fUUzg/Q7U+PhGtbt8rJ2kcea892kh2ywy7sLg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?IyFUZraT7KbOqfuxJF6S9obG0As3eVBtpoqpP4oxtvxb8lFGVn9TDiaqyU?=
 =?iso-8859-1?Q?HPa4Pu8R6qrAtT0L6kzf6CJT1HHeGMYlcvOqMsls6rhjwPXbHZkG6A5Ze9?=
 =?iso-8859-1?Q?kW8HKvZK4fQ1ay30lTFj4ntermtewU1lDFkipU5Mep09UdTPI3R9UC10ue?=
 =?iso-8859-1?Q?mPd1wmEimRrZKXZFkbkBX+xQ64IuGHheoaGx941FzXHYiTi93zAa76pE0f?=
 =?iso-8859-1?Q?/RrFt4zPTLsvgBBPRF7bDei9nMaM1rQYXnTjFyVFCKzp8U3GgCEbtHqoG7?=
 =?iso-8859-1?Q?+f9ZrGG6QaT6zRMgRw2qi+CBwJlk+uO0fEchuoj1IvzagoJzP6XOR2ZRmY?=
 =?iso-8859-1?Q?6yCqK888vX4ATetYff7tExzUumat+g3eReLyVS/FkiyExgC01o9hgvHJwJ?=
 =?iso-8859-1?Q?gzuiwqcxFBX9v1fp7ifJ7bjaVvQp0/7/nxkwJqOZA1nu2J7hVMqH1fLagl?=
 =?iso-8859-1?Q?Fz6ECHWGe4nEjcyJlveHCdYc5TCVpK34f21gGL4E/kvQEissLyBuJgNb4r?=
 =?iso-8859-1?Q?7cy29BXgKyjr4Lnju2IWvv2SX4TMtQ64R8oMGB/lHEUcbASih5gSmuKWEU?=
 =?iso-8859-1?Q?cdUCW3wog6yJRhDaBgLimHgFutalNHJejFxtZ1ZhTdAWheXIBv3i5hvt1x?=
 =?iso-8859-1?Q?xcwc0u3INLkps/US+c/tAt9FK4GmLgEEu5mNqFsqSi7D+NFJimYwQbd27u?=
 =?iso-8859-1?Q?ssouExd7gY4Cb7Ux2h9tWb8oytslfi4YX9MF1x+kK9yK78OsZkupH0T2wM?=
 =?iso-8859-1?Q?ziefK7MjpSTsNSFHQAQwPM7b9bbabJnmpgeES7hrie9fCQgDCSDChPh+X8?=
 =?iso-8859-1?Q?yrWyTwFYMTFU4TiJmBw93D8ExZPZPzXrBt1w+MwPysZegiPgOEYVgwBGSQ?=
 =?iso-8859-1?Q?ZjodCB5V2jUwlS+T3AEfGVlanNenT/UXitWG7t9h5YBlwFdvAtbjdN3pv5?=
 =?iso-8859-1?Q?D+/nB2wWCMHNs81ATk6S1O5zhdXU0YXHhFylN7lB/UlZ+l2RwViPwQZC72?=
 =?iso-8859-1?Q?vb+qZSSsCkJbRn81LjbVfOCh5rKIqgSPIIMCIOMEtdy3iNCQGXuAtfCTtz?=
 =?iso-8859-1?Q?IRwSTV5p9mYOQ6kR+OncQnLvwZZHny8EbVjF6GdPH4CdALjMyY3fgMFJVD?=
 =?iso-8859-1?Q?5fOB61l23mV8/AUy3X4brhozS2xZY1aOJrlY8sPvkJFFuJ7TMSpvXT1+4I?=
 =?iso-8859-1?Q?qFj/MPGwdtkJ7I2gxCM6C/nw1feH5VfkupkZl8IWE0XiYkw6tupXr+1KwT?=
 =?iso-8859-1?Q?6qadrzIn7CtKsiJnbzzkZlf8u+0hc+JT6IKqHPoGY9AbOodsSJ7uB+sQaZ?=
 =?iso-8859-1?Q?5GECS9NTHxQBk5mIbMhyFx/XmkfZuUabcj2ny48M+C/+3lTre8m7Q1kErD?=
 =?iso-8859-1?Q?EFDjFvVtOue/jqAszMulZZzG9/IkI89YR11a57/H8PZmaMrwl1y81yV/jB?=
 =?iso-8859-1?Q?/j6ESXH8KUaozApeWIbtYgmFSVgZt+0J9Or/SM0qdMtDzDWXXpCLU2pNt0?=
 =?iso-8859-1?Q?9w2v0nSjr9rRYhYEh/RvUorGOY79NkxE3+5FoNm/IehgAyfAe/OoR/RWgx?=
 =?iso-8859-1?Q?kEp75LE7B7pLvllwsIkvsRH5pUixmlP7gECq6h1eX2p3j8QHSlarUBjIOp?=
 =?iso-8859-1?Q?FHZnbGZRwH6I+EmZlcDP0DZtW0F0AVNa/pkMPxO8dzwSVZMVIxJ6VQGA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 99b13146-a317-49cf-63e3-08dc39332ab9
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 14:31:50.6570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yqMfWuBI2yubXzeo1qPb+klCmT0hTbsr2Yts+OFSkfIxRXKCOpctZBAx2tUjq6vnsKveup+46a/3V0qZ0OqE2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4890
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a -38.9% regression of stress-ng.uprobe.ops_per_sec on:


commit: 0a35d7bf32f50bf62cae0a6135f747653d093633 ("tick-sched: Keep tick on if hrtimer is due imminently")
https://git.kernel.org/cgit/linux/kernel/git/jfern/linux.git tick/keep-tick-on-hrt

testcase: stress-ng
test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 512G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: uprobe
	cpufreq_governor: performance



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202402292258.726df765-oliver.sang@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240229/202402292258.726df765-oliver.sang@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-12/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/lkp-spr-2sp4/uprobe/stress-ng/60s

commit: 
  064b3cdf74 ("sched: Fix build error in "sched/rt: Remove default bandwidth control"")
  0a35d7bf32 ("tick-sched: Keep tick on if hrtimer is due imminently")

064b3cdf74693a4f 0a35d7bf32f50bf62cae0a6135f 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
  10495163           -82.3%    1856368 ±  2%  cpuidle..usage
     14965 ±  6%     +38.0%      20647 ± 34%  sched_debug.cpu.nr_switches.max
      7801            +7.3%       8373 ±  2%  vmstat.system.cs
    177012           -77.8%      39341        vmstat.system.in
      0.10            -0.0        0.06 ±  2%  mpstat.cpu.all.irq%
      0.01 ±  6%      -0.0        0.01 ± 21%  mpstat.cpu.all.soft%
      0.57 ±  6%      -0.1        0.42 ±  4%  mpstat.cpu.all.sys%
    601474 ± 14%     -31.3%     413039 ± 14%  numa-numastat.node0.local_node
    814596 ±  7%     -34.4%     534369 ±  6%  numa-numastat.node0.numa_hit
    677328 ±  8%     -14.8%     577131 ±  6%  numa-numastat.node1.numa_hit
    815233 ±  7%     -34.5%     534132 ±  6%  numa-vmstat.node0.numa_hit
    602112 ± 14%     -31.4%     412785 ± 14%  numa-vmstat.node0.numa_local
    677094 ±  8%     -14.9%     576357 ±  6%  numa-vmstat.node1.numa_hit
     50.50 ± 22%     -71.6%      14.33 ± 23%  perf-c2c.DRAM.local
    446.50 ±  6%     +53.7%     686.17 ±  5%  perf-c2c.HITM.local
    417.83 ±  4%     -14.0%     359.33 ±  8%  perf-c2c.HITM.remote
   1494589           -25.5%    1113491        proc-vmstat.numa_hit
   1146436 ±  2%     -25.6%     853483        proc-vmstat.numa_local
    348138 ±  4%     -25.3%     260000        proc-vmstat.numa_other
   1568033           -24.5%    1183892        proc-vmstat.pgalloc_normal
    743648           -14.8%     633363        proc-vmstat.pgfault
   1379197           -21.2%    1086368 ±  2%  proc-vmstat.pgfree
    261827           -41.6%     152852 ±  3%  stress-ng.time.minor_page_faults
    118.17 ±  6%     -28.9%      84.00 ±  5%  stress-ng.time.percent_of_cpu_this_job_got
     71.08 ±  6%     -28.8%      50.62 ±  5%  stress-ng.time.system_time
    139766           +20.5%     168433 ±  3%  stress-ng.time.voluntary_context_switches
   1269707           -38.9%     776255 ±  4%  stress-ng.uprobe.ops
     21158           -38.9%      12936 ±  4%  stress-ng.uprobe.ops_per_sec
      1.31 ±  3%     -47.2%       0.69 ±  4%  perf-stat.i.MPKI
 9.759e+08           +21.8%  1.189e+09        perf-stat.i.branch-instructions
      2.38            -0.1        2.24        perf-stat.i.branch-miss-rate%
     12.65 ±  2%      -2.6       10.08 ±  3%  perf-stat.i.cache-miss-rate%
   4621767 ±  3%     -35.4%    2985387 ±  2%  perf-stat.i.cache-misses
  34157988           -26.7%   25024620 ±  2%  perf-stat.i.cache-references
      7793            +8.7%       8467 ±  2%  perf-stat.i.context-switches
      2.76           -49.0%       1.41        perf-stat.i.cpi
 9.133e+09 ±  2%     -34.6%  5.969e+09 ±  2%  perf-stat.i.cpu-cycles
      2449 ±  4%     +38.8%       3400 ±  2%  perf-stat.i.cycles-between-cache-misses
  4.74e+09           +20.5%  5.712e+09        perf-stat.i.instructions
      0.48           +94.9%       0.93        perf-stat.i.ipc
      0.97 ±  3%     -46.6%       0.52 ±  2%  perf-stat.overall.MPKI
      3.50            -0.7        2.83        perf-stat.overall.branch-miss-rate%
     13.48 ±  3%      -1.6       11.85 ±  2%  perf-stat.overall.cache-miss-rate%
      1.93           -45.8%       1.05        perf-stat.overall.cpi
      0.52           +84.4%       0.96        perf-stat.overall.ipc
 9.587e+08           +21.7%  1.167e+09        perf-stat.ps.branch-instructions
   4527431 ±  3%     -35.7%    2913120 ±  2%  perf-stat.ps.cache-misses
  33589341           -26.8%   24593524 ±  2%  perf-stat.ps.cache-references
      7658            +8.6%       8320 ±  2%  perf-stat.ps.context-switches
 8.981e+09 ±  2%     -34.7%  5.866e+09 ±  2%  perf-stat.ps.cpu-cycles
 4.657e+09           +20.4%  5.609e+09        perf-stat.ps.instructions
 2.858e+11           +19.7%  3.421e+11        perf-stat.total.instructions
     34.33 ±  5%     -26.2        8.17 ±  8%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     35.19 ±  5%     -25.7        9.54 ±  8%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     35.19 ±  5%     -25.6        9.54 ±  8%  perf-profile.calltrace.cycles-pp.start_secondary.secondary_startup_64_no_verify
     35.17 ±  5%     -25.6        9.53 ±  8%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     31.94 ±  5%     -25.5        6.44 ±  9%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
     35.86 ±  5%     -25.4       10.47 ±  8%  perf-profile.calltrace.cycles-pp.secondary_startup_64_no_verify
     31.53 ±  4%     -24.9        6.65 ± 10%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
     20.40 ±  5%     -18.2        2.18 ±  9%  perf-profile.calltrace.cycles-pp.intel_idle_xstate.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      7.37 ±  6%      -7.4        0.00        perf-profile.calltrace.cycles-pp.asm_sysvec_call_function.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      1.19 ±  4%      -0.5        0.72 ± 10%  perf-profile.calltrace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      1.29 ±  4%      -0.4        0.87 ± 10%  perf-profile.calltrace.cycles-pp.menu_select.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
      0.55 ±  7%      +0.1        0.66 ±  9%  perf-profile.calltrace.cycles-pp.tick_nohz_idle_stop_tick.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
      0.37 ± 70%      +0.3        0.62 ±  8%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.rest_init.arch_call_rest_init
      0.67 ±  8%      +0.3        0.93 ±  7%  perf-profile.calltrace.cycles-pp.arch_call_rest_init.start_kernel.x86_64_start_reservations.x86_64_start_kernel.secondary_startup_64_no_verify
      0.67 ±  8%      +0.3        0.93 ±  7%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.rest_init.arch_call_rest_init.start_kernel.x86_64_start_reservations
      0.67 ±  8%      +0.3        0.93 ±  7%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.rest_init.arch_call_rest_init.start_kernel
      0.67 ±  8%      +0.3        0.93 ±  7%  perf-profile.calltrace.cycles-pp.rest_init.arch_call_rest_init.start_kernel.x86_64_start_reservations.x86_64_start_kernel
      0.67 ±  8%      +0.3        0.93 ±  7%  perf-profile.calltrace.cycles-pp.start_kernel.x86_64_start_reservations.x86_64_start_kernel.secondary_startup_64_no_verify
      0.67 ±  8%      +0.3        0.93 ±  7%  perf-profile.calltrace.cycles-pp.x86_64_start_kernel.secondary_startup_64_no_verify
      0.67 ±  8%      +0.3        0.93 ±  7%  perf-profile.calltrace.cycles-pp.x86_64_start_reservations.x86_64_start_kernel.secondary_startup_64_no_verify
      0.09 ±223%      +0.5        0.57 ±  7%  perf-profile.calltrace.cycles-pp.process_one_work.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.09 ±223%      +0.5        0.61 ±  7%  perf-profile.calltrace.cycles-pp.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      1.86 ±  4%      +0.6        2.42 ±  9%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      0.70 ± 11%      +0.6        1.26 ±  9%  perf-profile.calltrace.cycles-pp.kthread.ret_from_fork.ret_from_fork_asm
      0.70 ± 11%      +0.6        1.26 ±  9%  perf-profile.calltrace.cycles-pp.ret_from_fork.ret_from_fork_asm
      0.70 ± 11%      +0.6        1.26 ±  9%  perf-profile.calltrace.cycles-pp.ret_from_fork_asm
      0.00            +0.6        0.56 ±  7%  perf-profile.calltrace.cycles-pp.link_path_walk.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat
      1.96 ±  4%      +0.6        2.57 ±  9%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      0.95 ±  4%      +0.6        1.56 ± 11%  perf-profile.calltrace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      1.13 ±  5%      +0.6        1.74 ± 11%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
      1.15 ±  4%      +0.6        1.77 ± 10%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
      3.09 ±  5%      +0.7        3.76 ± 12%  perf-profile.calltrace.cycles-pp.mutex_spin_on_owner.__mutex_lock.tracing_check_open_get_tr.tracing_open_pipe.do_dentry_open
      0.00            +0.7        0.66 ± 12%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
      0.00            +0.7        0.67 ± 12%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.clock_nanosleep
      0.00            +0.7        0.67 ± 14%  perf-profile.calltrace.cycles-pp.__hrtimer_start_range_ns.hrtimer_start_range_ns.start_dl_timer.enqueue_dl_entity.enqueue_task_fair
      0.00            +0.7        0.73 ± 15%  perf-profile.calltrace.cycles-pp.hrtimer_start_range_ns.start_dl_timer.enqueue_dl_entity.enqueue_task_fair.activate_task
      0.46 ± 45%      +0.7        1.19 ± 13%  perf-profile.calltrace.cycles-pp.try_to_wake_up.hrtimer_wakeup.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt
      0.46 ± 45%      +0.7        1.20 ± 13%  perf-profile.calltrace.cycles-pp.hrtimer_wakeup.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      0.00            +0.7        0.74 ± 16%  perf-profile.calltrace.cycles-pp.start_dl_timer.enqueue_dl_entity.enqueue_task_fair.activate_task.ttwu_do_activate
      0.00            +0.7        0.75 ± 13%  perf-profile.calltrace.cycles-pp.clock_nanosleep
      0.00            +0.8        0.76 ± 16%  perf-profile.calltrace.cycles-pp.enqueue_dl_entity.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_wake_up
      0.09 ±223%      +0.9        1.03 ± 15%  perf-profile.calltrace.cycles-pp.ttwu_do_activate.try_to_wake_up.hrtimer_wakeup.__hrtimer_run_queues.hrtimer_interrupt
      0.00            +1.0        0.96 ± 15%  perf-profile.calltrace.cycles-pp.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_wake_up.hrtimer_wakeup
      0.00            +1.0        0.96 ± 19%  perf-profile.calltrace.cycles-pp.ring_buffer_peek.peek_next_entry.__find_next_entry.trace_find_next_entry_inc.tracing_read_pipe
      0.00            +1.0        0.96 ± 15%  perf-profile.calltrace.cycles-pp.activate_task.ttwu_do_activate.try_to_wake_up.hrtimer_wakeup.__hrtimer_run_queues
      0.00            +1.0        1.00 ± 15%  perf-profile.calltrace.cycles-pp.ring_buffer_empty.ring_buffer_poll_wait.do_select.core_sys_select.do_pselect
      0.00            +1.1        1.05 ± 15%  perf-profile.calltrace.cycles-pp.ring_buffer_poll_wait.do_select.core_sys_select.do_pselect.__x64_sys_pselect6
      0.00            +1.1        1.07 ± 18%  perf-profile.calltrace.cycles-pp.peek_next_entry.__find_next_entry.trace_find_next_entry_inc.tracing_read_pipe.vfs_read
      0.00            +1.2        1.20 ± 11%  perf-profile.calltrace.cycles-pp.rb_set_head_page.rb_per_cpu_empty.ring_buffer_empty_cpu.__find_next_entry.trace_find_next_entry_inc
      0.00            +1.2        1.22 ± 16%  perf-profile.calltrace.cycles-pp.do_select.core_sys_select.do_pselect.__x64_sys_pselect6.do_syscall_64
      0.00            +1.2        1.24 ± 15%  perf-profile.calltrace.cycles-pp.core_sys_select.do_pselect.__x64_sys_pselect6.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +1.3        1.26 ± 16%  perf-profile.calltrace.cycles-pp.do_pselect.__x64_sys_pselect6.do_syscall_64.entry_SYSCALL_64_after_hwframe.__select
      0.00            +1.3        1.26 ± 15%  perf-profile.calltrace.cycles-pp.__x64_sys_pselect6.do_syscall_64.entry_SYSCALL_64_after_hwframe.__select
      0.00            +1.3        1.27 ± 16%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__select
      0.00            +1.3        1.27 ± 16%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__select
      0.00            +1.3        1.29 ± 16%  perf-profile.calltrace.cycles-pp.__select
      5.81 ±  8%      +1.8        7.64 ± 12%  perf-profile.calltrace.cycles-pp.trace_parse_run_command.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      5.25 ±  7%      +1.9        7.14 ± 12%  perf-profile.calltrace.cycles-pp.rb_reset_cpu.reset_disabled_cpu_buffer.ring_buffer_reset_online_cpus.tracing_reset_online_cpus.tracing_reset_all_online_cpus
      5.70 ±  8%      +1.9        7.59 ± 12%  perf-profile.calltrace.cycles-pp.dyn_event_release.trace_parse_run_command.vfs_write.ksys_write.do_syscall_64
      5.28 ±  7%      +1.9        7.18 ± 12%  perf-profile.calltrace.cycles-pp.reset_disabled_cpu_buffer.ring_buffer_reset_online_cpus.tracing_reset_online_cpus.tracing_reset_all_online_cpus.dyn_event_release
      1.12 ±  4%      +2.0        3.10 ±  6%  perf-profile.calltrace.cycles-pp._raw_spin_lock.ring_buffer_empty_cpu.__find_next_entry.trace_find_next_entry_inc.tracing_read_pipe
      5.57 ±  7%      +2.0        7.54 ± 12%  perf-profile.calltrace.cycles-pp.ring_buffer_reset_online_cpus.tracing_reset_online_cpus.tracing_reset_all_online_cpus.dyn_event_release.trace_parse_run_command
      5.58 ±  7%      +2.0        7.57 ± 12%  perf-profile.calltrace.cycles-pp.tracing_reset_all_online_cpus.dyn_event_release.trace_parse_run_command.vfs_write.ksys_write
      5.58 ±  7%      +2.0        7.57 ± 12%  perf-profile.calltrace.cycles-pp.tracing_reset_online_cpus.tracing_reset_all_online_cpus.dyn_event_release.trace_parse_run_command.vfs_write
      1.78 ±  8%      +2.0        3.82 ±  9%  perf-profile.calltrace.cycles-pp.rb_per_cpu_empty.ring_buffer_empty_cpu.__find_next_entry.trace_find_next_entry_inc.tracing_read_pipe
      4.58 ±  3%      +3.0        7.57 ± 10%  perf-profile.calltrace.cycles-pp.reset_disabled_cpu_buffer.ring_buffer_reset_online_cpus.tracing_reset_online_cpus.tracing_open.do_dentry_open
      4.56 ±  3%      +3.0        7.56 ± 10%  perf-profile.calltrace.cycles-pp.rb_reset_cpu.reset_disabled_cpu_buffer.ring_buffer_reset_online_cpus.tracing_reset_online_cpus.tracing_open
      4.70 ±  3%      +3.2        7.89 ± 10%  perf-profile.calltrace.cycles-pp.ring_buffer_reset_online_cpus.tracing_reset_online_cpus.tracing_open.do_dentry_open.do_open
      4.70 ±  3%      +3.2        7.91 ± 10%  perf-profile.calltrace.cycles-pp.tracing_open.do_dentry_open.do_open.path_openat.do_filp_open
      4.70 ±  3%      +3.2        7.91 ± 10%  perf-profile.calltrace.cycles-pp.tracing_reset_online_cpus.tracing_open.do_dentry_open.do_open.path_openat
      3.64 ±  6%      +5.3        8.95 ±  7%  perf-profile.calltrace.cycles-pp.ring_buffer_empty_cpu.__find_next_entry.trace_find_next_entry_inc.tracing_read_pipe.vfs_read
      4.02 ±  6%      +7.0       11.02 ±  7%  perf-profile.calltrace.cycles-pp.__find_next_entry.trace_find_next_entry_inc.tracing_read_pipe.vfs_read.ksys_read
      4.08 ±  5%      +7.1       11.22 ±  7%  perf-profile.calltrace.cycles-pp.trace_find_next_entry_inc.tracing_read_pipe.vfs_read.ksys_read.do_syscall_64
     40.58 ±  7%      +7.8       48.38 ±  8%  perf-profile.calltrace.cycles-pp.osq_lock.__mutex_lock.tracing_check_open_get_tr.tracing_open_pipe.do_dentry_open
      4.32 ±  5%      +8.3       12.60 ±  7%  perf-profile.calltrace.cycles-pp.tracing_read_pipe.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      4.41 ±  5%      +8.4       12.79 ±  7%  perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      4.41 ±  5%      +8.4       12.79 ±  7%  perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      4.42 ±  5%      +8.4       12.80 ±  7%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      4.42 ±  5%      +8.4       12.80 ±  7%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.read
      4.42 ±  5%      +8.4       12.82 ±  7%  perf-profile.calltrace.cycles-pp.read
     43.83 ±  6%      +8.5       52.35 ±  7%  perf-profile.calltrace.cycles-pp.__mutex_lock.tracing_check_open_get_tr.tracing_open_pipe.do_dentry_open.do_open
     43.89 ±  6%      +8.6       52.46 ±  7%  perf-profile.calltrace.cycles-pp.tracing_check_open_get_tr.tracing_open_pipe.do_dentry_open.do_open.path_openat
     43.92 ±  6%      +8.6       52.50 ±  7%  perf-profile.calltrace.cycles-pp.tracing_open_pipe.do_dentry_open.do_open.path_openat.do_filp_open
     48.70 ±  5%     +11.8       60.54 ±  5%  perf-profile.calltrace.cycles-pp.do_dentry_open.do_open.path_openat.do_filp_open.do_sys_openat2
     48.72 ±  5%     +11.9       60.61 ±  5%  perf-profile.calltrace.cycles-pp.do_open.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat
     49.23 ±  5%     +12.3       61.56 ±  5%  perf-profile.calltrace.cycles-pp.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat.do_syscall_64
     49.23 ±  5%     +12.3       61.57 ±  5%  perf-profile.calltrace.cycles-pp.do_filp_open.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe
     49.36 ±  5%     +12.4       61.79 ±  5%  perf-profile.calltrace.cycles-pp.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe.open64
     49.36 ±  5%     +12.4       61.80 ±  5%  perf-profile.calltrace.cycles-pp.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe.open64
     49.46 ±  5%     +12.5       61.92 ±  5%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.open64
     49.46 ±  5%     +12.5       61.92 ±  5%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.open64
     49.50 ±  5%     +12.5       62.00 ±  5%  perf-profile.calltrace.cycles-pp.open64
     34.88 ±  5%     -26.1        8.80 ±  8%  perf-profile.children.cycles-pp.cpuidle_idle_call
     35.19 ±  5%     -25.6        9.54 ±  8%  perf-profile.children.cycles-pp.start_secondary
     32.44 ±  5%     -25.4        7.01 ±  8%  perf-profile.children.cycles-pp.cpuidle_enter
     32.41 ±  5%     -25.4        7.00 ±  8%  perf-profile.children.cycles-pp.cpuidle_enter_state
     35.86 ±  5%     -25.4       10.47 ±  8%  perf-profile.children.cycles-pp.do_idle
     35.86 ±  5%     -25.4       10.47 ±  8%  perf-profile.children.cycles-pp.cpu_startup_entry
     35.86 ±  5%     -25.4       10.47 ±  8%  perf-profile.children.cycles-pp.secondary_startup_64_no_verify
     20.49 ±  5%     -18.2        2.25 ±  9%  perf-profile.children.cycles-pp.intel_idle_xstate
      6.19 ±  6%      -6.2        0.00        perf-profile.children.cycles-pp.asm_sysvec_call_function
      2.48 ±  4%      -2.3        0.20 ± 13%  perf-profile.children.cycles-pp.__flush_smp_call_function_queue
      1.24 ± 18%      -1.1        0.16 ± 16%  perf-profile.children.cycles-pp.irq_enter_rcu
      1.20 ± 18%      -1.0        0.16 ± 14%  perf-profile.children.cycles-pp.tick_irq_enter
      1.64 ±  3%      -0.9        0.77 ±  8%  perf-profile.children.cycles-pp.__ftrace_event_enable_disable
      0.92 ±  5%      -0.6        0.28 ± 15%  perf-profile.children.cycles-pp.native_irq_return_iret
      0.73 ± 29%      -0.6        0.16 ± 24%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      1.21 ±  4%      -0.5        0.73 ± 10%  perf-profile.children.cycles-pp.intel_idle
      0.88 ±  4%      -0.4        0.45 ±  8%  perf-profile.children.cycles-pp.event_enable_write
      0.78 ±  5%      -0.4        0.35 ±  9%  perf-profile.children.cycles-pp.__ftrace_set_clr_event_nolock
      1.32 ±  4%      -0.4        0.89 ± 10%  perf-profile.children.cycles-pp.menu_select
      0.78 ±  5%      -0.4        0.36 ±  8%  perf-profile.children.cycles-pp.system_enable_write
      0.51 ±  7%      -0.3        0.18 ± 12%  perf-profile.children.cycles-pp.ktime_get
      0.37 ±  5%      -0.3        0.06 ± 11%  perf-profile.children.cycles-pp.irqtime_account_irq
      0.36 ±  7%      -0.3        0.10 ± 11%  perf-profile.children.cycles-pp.native_sched_clock
      0.34 ±  8%      -0.3        0.09 ± 17%  perf-profile.children.cycles-pp.sched_clock_cpu
      0.28 ±  5%      -0.2        0.04 ±101%  perf-profile.children.cycles-pp.get_next_timer_interrupt
      0.37 ±  7%      -0.2        0.16 ± 18%  perf-profile.children.cycles-pp.ct_idle_exit
      1.15 ±  5%      -0.2        0.95 ±  5%  perf-profile.children.cycles-pp.irq_exit_rcu
      0.28 ±  9%      -0.2        0.09 ± 13%  perf-profile.children.cycles-pp.sched_clock
      0.33 ±  8%      -0.2        0.14 ± 18%  perf-profile.children.cycles-pp.ct_kernel_enter
      0.26 ±  9%      -0.2        0.08 ± 19%  perf-profile.children.cycles-pp.ct_kernel_exit_state
      0.24 ± 11%      -0.2        0.08 ± 19%  perf-profile.children.cycles-pp.read_tsc
      0.52 ± 11%      -0.1        0.38 ± 14%  perf-profile.children.cycles-pp.tick_sched_handle
      0.50 ± 11%      -0.1        0.37 ± 15%  perf-profile.children.cycles-pp.update_process_times
      0.11 ±  9%      -0.1        0.03 ±100%  perf-profile.children.cycles-pp.tick_nohz_stop_idle
      0.11 ± 25%      -0.1        0.03 ±100%  perf-profile.children.cycles-pp.__trace_uprobe_create
      0.11 ± 25%      -0.1        0.03 ±100%  perf-profile.children.cycles-pp.create_or_delete_trace_uprobe
      0.11 ± 25%      -0.1        0.03 ±100%  perf-profile.children.cycles-pp.trace_probe_create
      0.15 ±  7%      -0.1        0.06 ± 21%  perf-profile.children.cycles-pp.call_cpuidle
      0.14 ± 14%      -0.1        0.08 ± 21%  perf-profile.children.cycles-pp.cpuidle_governor_latency_req
      0.13 ± 12%      -0.1        0.07 ± 15%  perf-profile.children.cycles-pp.arch_cpu_idle_enter
      0.12 ± 13%      -0.0        0.07 ± 13%  perf-profile.children.cycles-pp.tsc_verify_tsc_adjust
      0.16 ±  8%      -0.0        0.12 ± 10%  perf-profile.children.cycles-pp.rcu_core
      0.14 ± 10%      -0.0        0.11 ± 10%  perf-profile.children.cycles-pp.tick_nohz_stop_tick
      0.12 ±  3%      +0.0        0.16 ± 13%  perf-profile.children.cycles-pp.asm_exc_debug
      0.06 ± 14%      +0.0        0.10 ± 13%  perf-profile.children.cycles-pp.timerqueue_add
      0.08 ± 12%      +0.0        0.12 ± 29%  perf-profile.children.cycles-pp.switch_mm_irqs_off
      0.06 ± 14%      +0.0        0.11 ± 13%  perf-profile.children.cycles-pp.enqueue_hrtimer
      0.06 ±  6%      +0.0        0.10 ± 17%  perf-profile.children.cycles-pp.strncpy_from_user
      0.06 ± 11%      +0.0        0.11 ±  8%  perf-profile.children.cycles-pp.force_qs_rnp
      0.05 ±  8%      +0.0        0.10 ± 14%  perf-profile.children.cycles-pp.kmem_cache_free
      0.03 ±100%      +0.1        0.08 ± 17%  perf-profile.children.cycles-pp.poll_idle
      0.04 ± 71%      +0.1        0.09 ± 12%  perf-profile.children.cycles-pp.dyntick_save_progress_counter
      0.06 ± 14%      +0.1        0.12 ±  8%  perf-profile.children.cycles-pp.rcu_gp_fqs_loop
      0.07 ± 31%      +0.1        0.12 ± 13%  perf-profile.children.cycles-pp.ksys_mmap_pgoff
      0.02 ± 99%      +0.1        0.08 ± 23%  perf-profile.children.cycles-pp.wake_up_q
      0.12 ±  8%      +0.1        0.17 ± 16%  perf-profile.children.cycles-pp.schedule_preempt_disabled
      0.19 ±  5%      +0.1        0.25 ±  8%  perf-profile.children.cycles-pp.__get_user_pages
      0.20 ±  4%      +0.1        0.25 ±  9%  perf-profile.children.cycles-pp.get_user_pages_remote
      0.09 ± 13%      +0.1        0.15 ± 14%  perf-profile.children.cycles-pp.pre_ssout
      0.02 ± 99%      +0.1        0.08 ± 11%  perf-profile.children.cycles-pp.timekeeping_advance
      0.02 ± 99%      +0.1        0.08 ± 11%  perf-profile.children.cycles-pp.update_wall_time
      0.06 ± 16%      +0.1        0.12 ±  9%  perf-profile.children.cycles-pp.seq_read_iter
      0.00            +0.1        0.06 ± 20%  perf-profile.children.cycles-pp.__memcg_slab_free_hook
      0.02 ±142%      +0.1        0.08 ± 17%  perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
      0.08 ± 13%      +0.1        0.14 ± 19%  perf-profile.children.cycles-pp.__d_lookup
      0.00            +0.1        0.06 ±  9%  perf-profile.children.cycles-pp.exec_mmap
      0.00            +0.1        0.06 ± 19%  perf-profile.children.cycles-pp.move_queued_task
      0.00            +0.1        0.06 ±  9%  perf-profile.children.cycles-pp.perf_evsel__read
      0.00            +0.1        0.06 ± 16%  perf-profile.children.cycles-pp.trace_print_lat_fmt
      0.00            +0.1        0.06 ± 11%  perf-profile.children.cycles-pp.elf_load
      0.00            +0.1        0.06 ± 23%  perf-profile.children.cycles-pp.migration_cpu_stop
      0.08 ± 13%      +0.1        0.14 ± 17%  perf-profile.children.cycles-pp.hrtimer_try_to_cancel
      0.12 ±  8%      +0.1        0.18 ± 12%  perf-profile.children.cycles-pp.__replace_page
      0.08 ± 13%      +0.1        0.14 ± 16%  perf-profile.children.cycles-pp.copy_to_page
      0.07 ± 10%      +0.1        0.14 ± 11%  perf-profile.children.cycles-pp.rcu_gp_kthread
      0.00            +0.1        0.06 ± 17%  perf-profile.children.cycles-pp.affine_move_task
      0.00            +0.1        0.06 ± 23%  perf-profile.children.cycles-pp.cpu_stopper_thread
      0.00            +0.1        0.06 ± 28%  perf-profile.children.cycles-pp.kernfs_dop_revalidate
      0.00            +0.1        0.06 ± 11%  perf-profile.children.cycles-pp.__get_user_8
      0.00            +0.1        0.06 ± 21%  perf-profile.children.cycles-pp.entry_SYSCALL_64
      0.05 ± 47%      +0.1        0.11 ± 15%  perf-profile.children.cycles-pp.exit_mmap
      0.02 ±141%      +0.1        0.08 ± 14%  perf-profile.children.cycles-pp.finish_task_switch
      0.00            +0.1        0.07 ± 18%  perf-profile.children.cycles-pp.do_vmi_align_munmap
      0.00            +0.1        0.07 ± 16%  perf-profile.children.cycles-pp.rseq_get_rseq_cs
      0.04 ± 71%      +0.1        0.10 ± 10%  perf-profile.children.cycles-pp.timerqueue_del
      0.05 ± 47%      +0.1        0.11 ± 17%  perf-profile.children.cycles-pp.__mmput
      0.05 ± 46%      +0.1        0.12 ± 12%  perf-profile.children.cycles-pp.readn
      0.14 ± 12%      +0.1        0.21 ± 12%  perf-profile.children.cycles-pp.serial8250_console_write
      0.00            +0.1        0.07 ± 17%  perf-profile.children.cycles-pp.__set_cpus_allowed_ptr_locked
      0.02 ±141%      +0.1        0.08 ± 11%  perf-profile.children.cycles-pp.__traverse_mounts
      0.00            +0.1        0.07 ± 10%  perf-profile.children.cycles-pp.begin_new_exec
      0.08 ± 10%      +0.1        0.15 ± 14%  perf-profile.children.cycles-pp.getname_flags
      0.00            +0.1        0.07 ± 17%  perf-profile.children.cycles-pp.set_next_entity
      0.12 ± 14%      +0.1        0.19 ± 13%  perf-profile.children.cycles-pp.update_rq_clock_task
      0.05 ± 47%      +0.1        0.12 ± 10%  perf-profile.children.cycles-pp.__x64_sys_exit_group
      0.05 ± 47%      +0.1        0.12 ± 10%  perf-profile.children.cycles-pp.do_exit
      0.05 ± 47%      +0.1        0.12 ± 10%  perf-profile.children.cycles-pp.do_group_exit
      0.01 ±223%      +0.1        0.08 ± 11%  perf-profile.children.cycles-pp.__remove_hrtimer
      0.00            +0.1        0.07 ± 11%  perf-profile.children.cycles-pp.__cond_resched
      0.00            +0.1        0.07 ± 23%  perf-profile.children.cycles-pp.down_read
      0.02 ±141%      +0.1        0.09 ± 10%  perf-profile.children.cycles-pp.setlocale
      0.09 ± 10%      +0.1        0.16 ± 14%  perf-profile.children.cycles-pp.dl_server_stop
      0.15 ± 11%      +0.1        0.22 ± 12%  perf-profile.children.cycles-pp._printk
      0.15 ± 11%      +0.1        0.22 ± 12%  perf-profile.children.cycles-pp.vprintk_emit
      0.06 ±  6%      +0.1        0.13 ± 11%  perf-profile.children.cycles-pp.kernel_clone
      0.14 ± 13%      +0.1        0.21 ± 13%  perf-profile.children.cycles-pp.wait_for_lsr
      0.00            +0.1        0.07 ± 18%  perf-profile.children.cycles-pp.___perf_sw_event
      0.15 ± 11%      +0.1        0.22 ± 11%  perf-profile.children.cycles-pp.console_flush_all
      0.15 ± 11%      +0.1        0.22 ± 11%  perf-profile.children.cycles-pp.console_unlock
      0.00            +0.1        0.07 ± 10%  perf-profile.children.cycles-pp.__trace_bputs
      0.00            +0.1        0.07 ± 18%  perf-profile.children.cycles-pp.do_vmi_munmap
      0.01 ±223%      +0.1        0.08 ± 19%  perf-profile.children.cycles-pp.init_file
      0.00            +0.1        0.07 ± 17%  perf-profile.children.cycles-pp.trace_bputs_print
      0.17 ± 15%      +0.1        0.25 ± 12%  perf-profile.children.cycles-pp.update_load_avg
      0.01 ±223%      +0.1        0.08 ± 17%  perf-profile.children.cycles-pp.exit_mm
      0.02 ±141%      +0.1        0.09 ± 23%  perf-profile.children.cycles-pp.__check_object_size
      0.00            +0.1        0.08 ± 12%  perf-profile.children.cycles-pp.__smp_call_single_queue
      0.02 ±141%      +0.1        0.09 ± 24%  perf-profile.children.cycles-pp.open_last_lookups
      0.00            +0.1        0.08 ± 14%  perf-profile.children.cycles-pp.rb_erase
      0.02 ± 99%      +0.1        0.10 ± 14%  perf-profile.children.cycles-pp._Fork
      0.09 ± 15%      +0.1        0.17 ± 14%  perf-profile.children.cycles-pp.sched_ttwu_pending
      0.04 ± 71%      +0.1        0.12 ± 20%  perf-profile.children.cycles-pp.evsel__read_counter
      0.00            +0.1        0.08 ± 17%  perf-profile.children.cycles-pp.ring_buffer_consume
      0.02 ±141%      +0.1        0.10 ± 16%  perf-profile.children.cycles-pp.__rseq_handle_notify_resume
      0.02 ±141%      +0.1        0.10 ± 12%  perf-profile.children.cycles-pp.copy_process
      0.08 ±  8%      +0.1        0.16 ± 12%  perf-profile.children.cycles-pp.inode_permission
      0.00            +0.1        0.08 ± 14%  perf-profile.children.cycles-pp.irq_work_queue
      0.00            +0.1        0.08 ± 16%  perf-profile.children.cycles-pp.number
      0.18 ±  9%      +0.1        0.26 ± 13%  perf-profile.children.cycles-pp.uprobe_notify_resume
      0.09 ± 23%      +0.1        0.17 ± 10%  perf-profile.children.cycles-pp.do_mmap
      0.08 ± 22%      +0.1        0.17 ± 11%  perf-profile.children.cycles-pp.mmap_region
      0.08 ± 13%      +0.1        0.17 ±  8%  perf-profile.children.cycles-pp.tick_nohz_restart_sched_tick
      0.01 ±223%      +0.1        0.09 ± 14%  perf-profile.children.cycles-pp.__do_sys_clone
      0.00            +0.1        0.08 ± 11%  perf-profile.children.cycles-pp.need_update
      0.00            +0.1        0.08 ± 28%  perf-profile.children.cycles-pp.prepare_task_switch
      0.05 ± 45%      +0.1        0.14 ± 13%  perf-profile.children.cycles-pp.__set_cpus_allowed_ptr
      0.08 ± 10%      +0.1        0.17 ± 11%  perf-profile.children.cycles-pp.kmem_cache_alloc
      0.09 ±  7%      +0.1        0.18 ±  8%  perf-profile.children.cycles-pp._find_next_and_bit
      0.02 ±141%      +0.1        0.10 ± 12%  perf-profile.children.cycles-pp.pcpu_alloc
      0.00            +0.1        0.09 ±  8%  perf-profile.children.cycles-pp.quiet_vmstat
      0.00            +0.1        0.09 ± 12%  perf-profile.children.cycles-pp.ttwu_queue_wakelist
      0.11 ±  5%      +0.1        0.20 ±  3%  perf-profile.children.cycles-pp.step_into
      0.19 ± 11%      +0.1        0.28 ± 12%  perf-profile.children.cycles-pp.irqentry_exit_to_user_mode
      0.07 ± 13%      +0.1        0.16 ± 11%  perf-profile.children.cycles-pp.__sched_setaffinity
      0.06 ± 19%      +0.1        0.16 ± 16%  perf-profile.children.cycles-pp.select_task_rq_fair
      0.00            +0.1        0.09 ± 18%  perf-profile.children.cycles-pp.get_symbol_pos
      0.00            +0.1        0.09 ± 15%  perf-profile.children.cycles-pp.rseq_ip_fixup
      0.09 ± 21%      +0.1        0.18 ± 10%  perf-profile.children.cycles-pp.vm_mmap_pgoff
      0.14 ±  4%      +0.1        0.23 ± 17%  perf-profile.children.cycles-pp.filemap_map_pages
      0.04 ± 71%      +0.1        0.13 ± 12%  perf-profile.children.cycles-pp.mm_init
      0.02 ±142%      +0.1        0.11 ± 12%  perf-profile.children.cycles-pp.alloc_bprm
      0.28 ±  8%      +0.1        0.38 ±  9%  perf-profile.children.cycles-pp.asm_exc_int3
      0.12 ±  8%      +0.1        0.22 ± 12%  perf-profile.children.cycles-pp.__memcpy
      0.04 ± 71%      +0.1        0.13 ± 12%  perf-profile.children.cycles-pp.select_task_rq
      0.20 ±  7%      +0.1        0.30 ±  9%  perf-profile.children.cycles-pp.__probe_event_disable
      0.20 ±  7%      +0.1        0.30 ±  9%  perf-profile.children.cycles-pp.__uprobe_unregister
      0.26 ±  3%      +0.1        0.36 ± 10%  perf-profile.children.cycles-pp.install_breakpoint
      0.20 ±  7%      +0.1        0.30 ±  9%  perf-profile.children.cycles-pp.probe_event_disable
      0.20 ±  7%      +0.1        0.30 ±  9%  perf-profile.children.cycles-pp.uprobe_unregister
      0.22 ±  5%      +0.1        0.32 ±  8%  perf-profile.children.cycles-pp.trace_uprobe_register
      0.14 ±  4%      +0.1        0.24 ± 17%  perf-profile.children.cycles-pp.do_read_fault
      0.08 ±  9%      +0.1        0.18 ±  7%  perf-profile.children.cycles-pp.__x64_sys_sched_setaffinity
      0.08 ± 11%      +0.1        0.18 ±  6%  perf-profile.children.cycles-pp.load_elf_binary
      0.00            +0.1        0.11 ± 14%  perf-profile.children.cycles-pp.__memset
      0.00            +0.1        0.11 ± 25%  perf-profile.children.cycles-pp.schedule_hrtimeout_range_clock
      0.08 ± 11%      +0.1        0.19 ± 10%  perf-profile.children.cycles-pp.alloc_empty_file
      0.08 ± 11%      +0.1        0.19 ±  5%  perf-profile.children.cycles-pp.exec_binprm
      0.08 ± 11%      +0.1        0.19 ±  5%  perf-profile.children.cycles-pp.search_binary_handler
      0.15 ±  3%      +0.1        0.26 ± 15%  perf-profile.children.cycles-pp.do_fault
      0.57 ±  7%      +0.1        0.68 ±  8%  perf-profile.children.cycles-pp.tick_nohz_idle_stop_tick
      0.10 ±  4%      +0.1        0.22 ± 21%  perf-profile.children.cycles-pp.dequeue_entity
      0.14 ± 16%      +0.1        0.25 ±  9%  perf-profile.children.cycles-pp.raw_spin_rq_lock_nested
      0.12 ±  9%      +0.1        0.23 ± 14%  perf-profile.children.cycles-pp.enqueue_entity
      0.00            +0.1        0.12 ± 16%  perf-profile.children.cycles-pp.vbin_printf
      0.12 ±  9%      +0.1        0.24 ±  8%  perf-profile.children.cycles-pp.tick_nohz_idle_exit
      0.19 ±  6%      +0.1        0.31 ±  9%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      0.29 ±  4%      +0.1        0.42 ±  8%  perf-profile.children.cycles-pp.__uprobe_register
      0.10 ± 13%      +0.1        0.22 ±  4%  perf-profile.children.cycles-pp.bprm_execve
      0.10 ± 23%      +0.1        0.23 ± 30%  perf-profile.children.cycles-pp.flush_smp_call_function_queue
      0.14 ± 12%      +0.1        0.26 ± 10%  perf-profile.children.cycles-pp.walk_component
      0.11 ± 13%      +0.1        0.24 ± 13%  perf-profile.children.cycles-pp.do_user_addr_fault
      0.11 ± 13%      +0.1        0.24 ± 12%  perf-profile.children.cycles-pp.exc_page_fault
      0.10 ± 13%      +0.1        0.23 ± 13%  perf-profile.children.cycles-pp.update_rq_clock
      0.14 ± 14%      +0.1        0.28 ± 10%  perf-profile.children.cycles-pp.lookup_fast
      0.41 ±  5%      +0.1        0.55 ±  7%  perf-profile.children.cycles-pp.uprobe_write_opcode
      0.37 ±  6%      +0.1        0.51 ±  9%  perf-profile.children.cycles-pp.__getpid
      0.31 ±  6%      +0.1        0.45 ±  8%  perf-profile.children.cycles-pp.probe_event_enable
      0.12 ± 12%      +0.1        0.27 ± 11%  perf-profile.children.cycles-pp.asm_exc_page_fault
      0.12 ± 12%      +0.1        0.26 ±  7%  perf-profile.children.cycles-pp.evlist_cpu_iterator__next
      0.20 ±  3%      +0.2        0.34 ± 12%  perf-profile.children.cycles-pp.__handle_mm_fault
      0.00            +0.2        0.15 ± 12%  perf-profile.children.cycles-pp.__rb_reserve_next
      0.29 ± 16%      +0.2        0.44 ±  5%  perf-profile.children.cycles-pp.drm_fb_memcpy
      0.29 ± 16%      +0.2        0.44 ±  5%  perf-profile.children.cycles-pp.memcpy_toio
      0.29 ± 16%      +0.2        0.44 ±  5%  perf-profile.children.cycles-pp.ast_primary_plane_helper_atomic_update
      0.30 ± 17%      +0.2        0.46 ±  6%  perf-profile.children.cycles-pp.ast_mode_config_helper_atomic_commit_tail
      0.30 ± 17%      +0.2        0.46 ±  6%  perf-profile.children.cycles-pp.commit_tail
      0.30 ± 17%      +0.2        0.46 ±  6%  perf-profile.children.cycles-pp.drm_atomic_helper_commit_tail_rpm
      0.30 ± 16%      +0.2        0.46 ±  6%  perf-profile.children.cycles-pp.drm_atomic_helper_commit_planes
      0.30 ± 16%      +0.2        0.46 ±  6%  perf-profile.children.cycles-pp.drm_atomic_helper_dirtyfb
      0.00            +0.2        0.16 ± 15%  perf-profile.children.cycles-pp.ring_buffer_nest_start
      0.30 ± 17%      +0.2        0.46 ±  6%  perf-profile.children.cycles-pp.drm_atomic_commit
      0.30 ± 17%      +0.2        0.46 ±  6%  perf-profile.children.cycles-pp.drm_atomic_helper_commit
      0.20 ±  5%      +0.2        0.36 ± 10%  perf-profile.children.cycles-pp.handle_mm_fault
      0.13 ± 23%      +0.2        0.29 ± 17%  perf-profile.children.cycles-pp.sysvec_call_function_single
      0.13 ± 23%      +0.2        0.30 ± 17%  perf-profile.children.cycles-pp.asm_sysvec_call_function_single
      0.31 ± 16%      +0.2        0.48 ±  6%  perf-profile.children.cycles-pp.drm_fb_helper_damage_work
      0.31 ± 16%      +0.2        0.48 ±  6%  perf-profile.children.cycles-pp.drm_fbdev_generic_helper_fb_dirty
      0.00            +0.2        0.18 ± 12%  perf-profile.children.cycles-pp.get_symbol_offset
      0.15 ± 17%      +0.2        0.33 ± 13%  perf-profile.children.cycles-pp.pick_next_task_fair
      0.01 ±223%      +0.2        0.19 ± 11%  perf-profile.children.cycles-pp.format_decode
      0.21 ±  6%      +0.2        0.40 ± 14%  perf-profile.children.cycles-pp.dequeue_task_fair
      0.38 ± 19%      +0.2        0.57 ±  7%  perf-profile.children.cycles-pp.process_one_work
      0.14 ± 11%      +0.2        0.33 ± 13%  perf-profile.children.cycles-pp.balance_fair
      0.00            +0.2        0.19 ± 20%  perf-profile.children.cycles-pp.ring_buffer_unlock_commit
      0.12 ± 16%      +0.2        0.32 ± 11%  perf-profile.children.cycles-pp.vsnprintf
      0.12 ± 17%      +0.2        0.31 ± 11%  perf-profile.children.cycles-pp.seq_buf_vprintf
      0.00            +0.2        0.20 ± 12%  perf-profile.children.cycles-pp.ring_buffer_lock_reserve
      0.40 ± 17%      +0.2        0.61 ±  7%  perf-profile.children.cycles-pp.worker_thread
      0.37 ±  4%      +0.2        0.58 ± 11%  perf-profile.children.cycles-pp.tick_nohz_get_sleep_length
      0.12 ± 12%      +0.2        0.33 ± 13%  perf-profile.children.cycles-pp.trace_seq_printf
      0.16 ±  6%      +0.2        0.37 ±  5%  perf-profile.children.cycles-pp.__x64_sys_execve
      0.16 ±  6%      +0.2        0.37 ±  5%  perf-profile.children.cycles-pp.do_execveat_common
      0.15 ±  7%      +0.2        0.37 ±  6%  perf-profile.children.cycles-pp.execve
      0.50 ±  5%      +0.2        0.72 ±  8%  perf-profile.children.cycles-pp.register_for_each_vma
      0.17 ± 11%      +0.2        0.40 ±  8%  perf-profile.children.cycles-pp.sched_setaffinity
      0.12 ± 10%      +0.2        0.34 ± 10%  perf-profile.children.cycles-pp.trace_print_context
      0.00            +0.2        0.23 ± 23%  perf-profile.children.cycles-pp.tracing_wait_pipe
      0.00            +0.2        0.24 ± 11%  perf-profile.children.cycles-pp.pollwake
      0.22 ±  5%      +0.2        0.47 ± 15%  perf-profile.children.cycles-pp.do_nanosleep
      0.20 ± 10%      +0.3        0.46 ±  9%  perf-profile.children.cycles-pp.read_counters
      0.00            +0.3        0.26 ± 12%  perf-profile.children.cycles-pp.rb_wake_up_waiters
      0.21 ±  9%      +0.3        0.47 ± 10%  perf-profile.children.cycles-pp.process_interval
      0.67 ±  8%      +0.3        0.93 ±  7%  perf-profile.children.cycles-pp.arch_call_rest_init
      0.67 ±  8%      +0.3        0.93 ±  7%  perf-profile.children.cycles-pp.rest_init
      0.18 ± 10%      +0.3        0.45 ± 12%  perf-profile.children.cycles-pp.smpboot_thread_fn
      0.67 ±  8%      +0.3        0.93 ±  7%  perf-profile.children.cycles-pp.start_kernel
      0.67 ±  8%      +0.3        0.93 ±  7%  perf-profile.children.cycles-pp.x86_64_start_kernel
      0.67 ±  8%      +0.3        0.93 ±  7%  perf-profile.children.cycles-pp.x86_64_start_reservations
      0.21 ±  9%      +0.3        0.47 ±  9%  perf-profile.children.cycles-pp.cmd_stat
      0.21 ±  9%      +0.3        0.47 ±  9%  perf-profile.children.cycles-pp.dispatch_events
      0.23 ±  4%      +0.3        0.49 ± 14%  perf-profile.children.cycles-pp.hrtimer_nanosleep
      0.00            +0.3        0.27 ± 11%  perf-profile.children.cycles-pp.__wake_up
      0.23 ±  4%      +0.3        0.50 ± 14%  perf-profile.children.cycles-pp.common_nsleep
      0.00            +0.3        0.28 ± 11%  perf-profile.children.cycles-pp.__wake_up_common
      0.25 ±  6%      +0.3        0.53 ± 13%  perf-profile.children.cycles-pp.__x64_sys_clock_nanosleep
      0.12 ± 12%      +0.3        0.40 ± 10%  perf-profile.children.cycles-pp.print_trace_fmt
      0.00            +0.3        0.29 ±  8%  perf-profile.children.cycles-pp.trace_bprint_print
      0.38 ±  6%      +0.3        0.68 ± 13%  perf-profile.children.cycles-pp.update_sg_lb_stats
      0.00            +0.3        0.30 ± 10%  perf-profile.children.cycles-pp.kallsyms_lookup_buildid
      0.35 ±  7%      +0.3        0.65 ±  6%  perf-profile.children.cycles-pp.link_path_walk
      0.24 ±  5%      +0.3        0.55 ± 15%  perf-profile.children.cycles-pp.schedule_idle
      0.22 ± 11%      +0.3        0.54 ± 11%  perf-profile.children.cycles-pp.newidle_balance
      0.00            +0.3        0.32 ± 10%  perf-profile.children.cycles-pp.trace_seq_print_sym
      0.00            +0.3        0.32 ± 10%  perf-profile.children.cycles-pp.seq_print_ip_sym
      0.42 ±  6%      +0.3        0.74 ± 11%  perf-profile.children.cycles-pp.update_sd_lb_stats
      0.42 ±  6%      +0.3        0.75 ± 11%  perf-profile.children.cycles-pp.find_busiest_group
      0.49 ±  6%      +0.3        0.82 ±  8%  perf-profile.children.cycles-pp.load_balance
      0.15 ± 11%      +0.4        0.51 ±  9%  perf-profile.children.cycles-pp.irq_work_single
      0.15 ± 11%      +0.4        0.51 ± 10%  perf-profile.children.cycles-pp.irq_work_run
      0.15 ± 11%      +0.4        0.51 ± 10%  perf-profile.children.cycles-pp.irq_work_run_list
      0.15 ± 11%      +0.4        0.52 ± 10%  perf-profile.children.cycles-pp.__sysvec_irq_work
      0.25 ±  7%      +0.4        0.65 ±  8%  perf-profile.children.cycles-pp._find_next_bit
      0.15 ± 11%      +0.4        0.56 ± 10%  perf-profile.children.cycles-pp.sysvec_irq_work
      0.03 ±100%      +0.4        0.44 ± 21%  perf-profile.children.cycles-pp.trace_empty
      0.54 ± 13%      +0.4        0.95 ±  7%  perf-profile.children.cycles-pp._nohz_idle_balance
      0.35 ±  4%      +0.4        0.78 ± 13%  perf-profile.children.cycles-pp.clock_nanosleep
      0.15 ± 11%      +0.4        0.60 ± 10%  perf-profile.children.cycles-pp.asm_sysvec_irq_work
      0.31 ±  6%      +0.5        0.80 ± 15%  perf-profile.children.cycles-pp.get_nohz_timer_target
      0.00            +0.5        0.50 ± 23%  perf-profile.children.cycles-pp.rb_get_reader_page
      0.45 ±  8%      +0.5        1.00 ± 13%  perf-profile.children.cycles-pp.start_dl_timer
      0.70 ± 11%      +0.6        1.26 ±  9%  perf-profile.children.cycles-pp.kthread
      0.70 ± 11%      +0.6        1.27 ±  9%  perf-profile.children.cycles-pp.ret_from_fork
      0.70 ± 11%      +0.6        1.27 ±  9%  perf-profile.children.cycles-pp.ret_from_fork_asm
      0.47 ±  7%      +0.6        1.04 ± 13%  perf-profile.children.cycles-pp.enqueue_dl_entity
      0.46 ±  7%      +0.6        1.05 ± 11%  perf-profile.children.cycles-pp.__hrtimer_start_range_ns
      0.52 ±  5%      +0.6        1.12 ±  8%  perf-profile.children.cycles-pp.schedule
      1.26 ±  7%      +0.6        1.87 ±  8%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.00            +0.6        0.62 ± 22%  perf-profile.children.cycles-pp.rb_buffer_peek
      1.47 ±  6%      +0.6        2.09 ±  8%  perf-profile.children.cycles-pp.hrtimer_interrupt
      1.50 ±  6%      +0.6        2.12 ±  8%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      2.38 ±  4%      +0.6        3.02 ±  7%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.54 ±  8%      +0.7        1.20 ± 13%  perf-profile.children.cycles-pp.hrtimer_wakeup
      0.55 ±  6%      +0.7        1.21 ± 11%  perf-profile.children.cycles-pp.hrtimer_start_range_ns
      0.62 ±  6%      +0.7        1.34 ± 13%  perf-profile.children.cycles-pp.activate_task
      0.62 ±  6%      +0.7        1.35 ± 12%  perf-profile.children.cycles-pp.enqueue_task_fair
      2.52 ±  4%      +0.7        3.25 ±  7%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.00            +0.7        0.74 ± 13%  perf-profile.children.cycles-pp.trace_vbprintk
      0.00            +0.7        0.74 ± 13%  perf-profile.children.cycles-pp.__trace_bprintk
      0.63 ±  6%      +0.8        1.41 ± 13%  perf-profile.children.cycles-pp.ttwu_do_activate
      0.75 ±  4%      +0.9        1.66 ± 10%  perf-profile.children.cycles-pp.__schedule
      0.08 ± 27%      +0.9        1.03 ± 15%  perf-profile.children.cycles-pp.ring_buffer_empty
      0.68 ±  6%      +1.0        1.64 ± 11%  perf-profile.children.cycles-pp.try_to_wake_up
      0.08 ± 27%      +1.0        1.05 ± 15%  perf-profile.children.cycles-pp.ring_buffer_poll_wait
      0.00            +1.0        1.00 ± 18%  perf-profile.children.cycles-pp.ring_buffer_peek
      0.00            +1.1        1.10 ± 17%  perf-profile.children.cycles-pp.peek_next_entry
      0.36 ± 11%      +1.1        1.49 ± 11%  perf-profile.children.cycles-pp.rb_set_head_page
      0.08 ± 30%      +1.1        1.22 ± 16%  perf-profile.children.cycles-pp.do_select
      0.09 ± 30%      +1.2        1.24 ± 15%  perf-profile.children.cycles-pp.core_sys_select
      0.09 ± 26%      +1.2        1.26 ± 15%  perf-profile.children.cycles-pp.__x64_sys_pselect6
      0.09 ± 26%      +1.2        1.26 ± 15%  perf-profile.children.cycles-pp.do_pselect
      0.09 ± 24%      +1.2        1.29 ± 16%  perf-profile.children.cycles-pp.__select
      5.81 ±  8%      +1.8        7.64 ± 12%  perf-profile.children.cycles-pp.trace_parse_run_command
      5.70 ±  8%      +1.9        7.59 ± 12%  perf-profile.children.cycles-pp.dyn_event_release
      5.58 ±  7%      +2.0        7.57 ± 12%  perf-profile.children.cycles-pp.tracing_reset_all_online_cpus
      2.26 ± 10%      +2.3        4.53 ±  5%  perf-profile.children.cycles-pp._raw_spin_lock
      1.89 ±  7%      +2.6        4.46 ±  9%  perf-profile.children.cycles-pp.rb_per_cpu_empty
      4.70 ±  3%      +3.2        7.91 ± 10%  perf-profile.children.cycles-pp.tracing_open
      9.82 ±  5%      +4.9       14.70 ± 11%  perf-profile.children.cycles-pp.rb_reset_cpu
      9.86 ±  5%      +4.9       14.75 ± 11%  perf-profile.children.cycles-pp.reset_disabled_cpu_buffer
     10.29 ±  5%      +5.2       15.48 ± 11%  perf-profile.children.cycles-pp.tracing_reset_online_cpus
     10.28 ±  5%      +5.2       15.48 ± 11%  perf-profile.children.cycles-pp.ring_buffer_reset_online_cpus
      3.77 ±  6%      +5.8        9.57 ±  7%  perf-profile.children.cycles-pp.ring_buffer_empty_cpu
      4.08 ±  5%      +7.1       11.22 ±  7%  perf-profile.children.cycles-pp.__find_next_entry
      4.08 ±  5%      +7.1       11.22 ±  7%  perf-profile.children.cycles-pp.trace_find_next_entry_inc
     40.60 ±  7%      +7.8       48.38 ±  8%  perf-profile.children.cycles-pp.osq_lock
      4.32 ±  5%      +8.3       12.60 ±  7%  perf-profile.children.cycles-pp.tracing_read_pipe
     44.05 ±  6%      +8.3       52.38 ±  7%  perf-profile.children.cycles-pp.__mutex_lock
      4.45 ±  5%      +8.4       12.86 ±  7%  perf-profile.children.cycles-pp.vfs_read
      4.46 ±  5%      +8.4       12.89 ±  7%  perf-profile.children.cycles-pp.ksys_read
      4.48 ±  5%      +8.5       12.94 ±  7%  perf-profile.children.cycles-pp.read
     43.89 ±  6%      +8.6       52.47 ±  7%  perf-profile.children.cycles-pp.tracing_check_open_get_tr
     43.92 ±  6%      +8.6       52.50 ±  7%  perf-profile.children.cycles-pp.tracing_open_pipe
     48.71 ±  5%     +11.8       60.56 ±  5%  perf-profile.children.cycles-pp.do_dentry_open
     48.74 ±  5%     +11.9       60.63 ±  5%  perf-profile.children.cycles-pp.do_open
     49.29 ±  5%     +12.4       61.70 ±  5%  perf-profile.children.cycles-pp.path_openat
     49.29 ±  5%     +12.4       61.71 ±  5%  perf-profile.children.cycles-pp.do_filp_open
     49.50 ±  5%     +12.5       62.00 ±  5%  perf-profile.children.cycles-pp.open64
     49.42 ±  5%     +12.5       61.93 ±  5%  perf-profile.children.cycles-pp.do_sys_openat2
     49.42 ±  5%     +12.5       61.94 ±  5%  perf-profile.children.cycles-pp.__x64_sys_openat
     62.42 ±  3%     +24.1       86.52        perf-profile.children.cycles-pp.do_syscall_64
     62.42 ±  3%     +24.1       86.54        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     20.44 ±  5%     -18.2        2.24 ±  9%  perf-profile.self.cycles-pp.intel_idle_xstate
      2.06 ±  5%      -1.8        0.28 ± 10%  perf-profile.self.cycles-pp.cpuidle_enter_state
      0.92 ±  5%      -0.6        0.28 ± 14%  perf-profile.self.cycles-pp.native_irq_return_iret
      0.73 ± 29%      -0.6        0.15 ± 22%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      0.76 ±  4%      -0.5        0.22 ±  8%  perf-profile.self.cycles-pp.menu_select
      1.21 ±  4%      -0.5        0.73 ± 10%  perf-profile.self.cycles-pp.intel_idle
      0.35 ±  7%      -0.3        0.10 ±  8%  perf-profile.self.cycles-pp.native_sched_clock
      0.25 ± 10%      -0.2        0.08 ± 18%  perf-profile.self.cycles-pp.ct_kernel_exit_state
      0.22 ±  9%      -0.2        0.05 ± 52%  perf-profile.self.cycles-pp.cpuidle_idle_call
      0.28 ±  9%      -0.2        0.12 ± 18%  perf-profile.self.cycles-pp.ktime_get
      0.23 ± 12%      -0.1        0.08 ± 19%  perf-profile.self.cycles-pp.read_tsc
      0.14 ±  9%      -0.1        0.06 ± 19%  perf-profile.self.cycles-pp.call_cpuidle
      0.10 ±  9%      -0.1        0.02 ± 99%  perf-profile.self.cycles-pp.do_idle
      0.14 ± 12%      -0.1        0.06 ± 23%  perf-profile.self.cycles-pp.tick_nohz_next_event
      0.12 ± 16%      -0.1        0.06 ± 49%  perf-profile.self.cycles-pp.ct_kernel_enter
      0.08 ± 16%      -0.0        0.04 ± 71%  perf-profile.self.cycles-pp.tsc_verify_tsc_adjust
      0.07 ± 16%      +0.0        0.10 ± 17%  perf-profile.self.cycles-pp.__getpid
      0.08 ± 10%      +0.0        0.12 ± 28%  perf-profile.self.cycles-pp.switch_mm_irqs_off
      0.04 ± 71%      +0.1        0.08 ± 11%  perf-profile.self.cycles-pp.dyntick_save_progress_counter
      0.02 ±142%      +0.1        0.07 ± 18%  perf-profile.self.cycles-pp.poll_idle
      0.00            +0.1        0.06 ± 13%  perf-profile.self.cycles-pp.enqueue_task_fair
      0.19 ±  4%      +0.1        0.25 ± 10%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.00            +0.1        0.06 ± 23%  perf-profile.self.cycles-pp.down_read
      0.08 ± 17%      +0.1        0.15 ± 19%  perf-profile.self.cycles-pp.update_rq_clock_task
      0.00            +0.1        0.06 ± 11%  perf-profile.self.cycles-pp.__get_user_8
      0.01 ±223%      +0.1        0.07 ± 10%  perf-profile.self.cycles-pp.kmem_cache_alloc
      0.01 ±223%      +0.1        0.08 ± 16%  perf-profile.self.cycles-pp.__update_load_avg_cfs_rq
      0.08 ±  6%      +0.1        0.14 ±  9%  perf-profile.self.cycles-pp._find_next_and_bit
      0.01 ±223%      +0.1        0.08 ± 16%  perf-profile.self.cycles-pp.timerqueue_add
      0.00            +0.1        0.07 ± 11%  perf-profile.self.cycles-pp.filemap_map_pages
      0.00            +0.1        0.07 ± 15%  perf-profile.self.cycles-pp.rb_erase
      0.00            +0.1        0.08 ± 14%  perf-profile.self.cycles-pp.inode_permission
      0.05 ± 45%      +0.1        0.12 ± 15%  perf-profile.self.cycles-pp.__schedule
      0.00            +0.1        0.08 ±  9%  perf-profile.self.cycles-pp.peek_next_entry
      0.01 ±223%      +0.1        0.09 ± 12%  perf-profile.self.cycles-pp.vsnprintf
      0.00            +0.1        0.09 ± 18%  perf-profile.self.cycles-pp.get_symbol_pos
      0.12 ±  9%      +0.1        0.21 ± 12%  perf-profile.self.cycles-pp.__memcpy
      0.00            +0.1        0.11 ± 14%  perf-profile.self.cycles-pp.__memset
      0.07 ± 15%      +0.1        0.20 ± 11%  perf-profile.self.cycles-pp.update_rq_clock
      0.00            +0.1        0.13 ± 21%  perf-profile.self.cycles-pp.rb_buffer_peek
      0.00            +0.1        0.14 ± 11%  perf-profile.self.cycles-pp.__rb_reserve_next
      0.00            +0.1        0.14 ± 15%  perf-profile.self.cycles-pp.trace_vbprintk
      0.29 ± 16%      +0.1        0.44 ±  6%  perf-profile.self.cycles-pp.memcpy_toio
      0.00            +0.2        0.16 ± 15%  perf-profile.self.cycles-pp.ring_buffer_nest_start
      0.00            +0.2        0.17 ±  9%  perf-profile.self.cycles-pp.format_decode
      0.00            +0.2        0.18 ± 12%  perf-profile.self.cycles-pp.get_symbol_offset
      0.25 ±  5%      +0.2        0.47 ±  8%  perf-profile.self.cycles-pp.update_sg_lb_stats
      0.00            +0.2        0.24 ± 11%  perf-profile.self.cycles-pp.ring_buffer_peek
      0.40 ±  8%      +0.3        0.69 ± 13%  perf-profile.self.cycles-pp.ring_buffer_reset_online_cpus
      0.00            +0.3        0.30 ± 20%  perf-profile.self.cycles-pp.ring_buffer_empty
      0.21 ±  7%      +0.3        0.54 ±  9%  perf-profile.self.cycles-pp._find_next_bit
      0.21 ±  7%      +0.4        0.59 ±  7%  perf-profile.self.cycles-pp.__find_next_entry
      0.27 ±  8%      +0.4        0.70 ± 15%  perf-profile.self.cycles-pp.get_nohz_timer_target
      0.00            +0.5        0.49 ± 24%  perf-profile.self.cycles-pp.rb_get_reader_page
      0.33 ± 10%      +1.0        1.38 ± 11%  perf-profile.self.cycles-pp.rb_set_head_page
      0.76 ±  8%      +1.4        2.15 ±  8%  perf-profile.self.cycles-pp.ring_buffer_empty_cpu
      1.53 ±  9%      +1.5        2.98 ±  9%  perf-profile.self.cycles-pp.rb_per_cpu_empty
      1.57 ±  4%      +2.8        4.35 ±  6%  perf-profile.self.cycles-pp._raw_spin_lock
      9.82 ±  5%      +4.9       14.70 ± 11%  perf-profile.self.cycles-pp.rb_reset_cpu
     40.30 ±  7%      +7.8       48.12 ±  8%  perf-profile.self.cycles-pp.osq_lock



Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

