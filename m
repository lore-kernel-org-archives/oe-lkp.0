Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D7938E125
	for <oe-lkp@lists.linux.dev>; Thu, 26 Feb 2026 07:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772090798; cv=fail; b=bOg8DZ/5fC707b9P12LNj4Om4U9o+5S7RXOH69lT5lMjPG+WuVSJmPZzWcEkakIUg+86H1eORCgKX+eVgKZz4FqXq5J0vD+IobXzv5UwTrGNB8YcQACH9VUqLhANnR6pJg3J+C2kIjCYM7gy3Hbsfc+E1HxQe58UFewV7t7fwUY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772090798; c=relaxed/simple;
	bh=hPIL4SqAzy5hYxPg9PjZH/h+07z4hM9ZjAPW5HfxZLo=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Bnw8wulYMdLLhh0cawecZSgFBnTzxEzycaG/SWIyhtDkw8iVRyG8dQpwYL25VnpNMtbQAde/5NRF6Ik4l+zIoqzEbCRK+jLpUUuCfgisgznAIVy6g06/MFQaKFzTxCfK77kid3P7B1mzZ9M9KFIqepKY135KUJsW2h8IzlW/oGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PQp8NO3n; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PQp8NO3n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772090795; x=1803626795;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=hPIL4SqAzy5hYxPg9PjZH/h+07z4hM9ZjAPW5HfxZLo=;
  b=PQp8NO3n79es9qetfgP2sQzFx95j0+tF6rD0kxVUXfz8FjMwNdZ8mtLv
   hn5yuTnrVxBwellis8TLa3As2LAII8rHgMmOUXDJyz/siOMVwwL1gosXR
   K39iky9cYuUInlJwG33g9j6WOzZJ4KPJCVsHwfrIV/DzFWlfGq5Rv0cDd
   5iR+i5xcezR+dgq0WL/ob1FoJkxE8q8j8ogg+9e566RBCbsDBVR6jU/7d
   cngKrTpjcH9PkMMeCXQifwtnK752eDXyxI631Sn8v7q8U0jv6xmrumXLV
   FgDXnE25u48nU66JGUdRzbc0qMt6PwlBZf2O1YnNSKk+dEWpTGDLqgXDm
   A==;
X-CSE-ConnectionGUID: j3CCF9+hTxSJGcVMV61PGg==
X-CSE-MsgGUID: opwQbMNsR72k2TJZrusuZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="84500744"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="84500744"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 23:26:35 -0800
X-CSE-ConnectionGUID: nLE2Y9B4QKqItZsUp2alRw==
X-CSE-MsgGUID: /493rF4zRkqyEVc8hWkA3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="221462891"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 23:26:34 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Feb 2026 23:26:33 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 25 Feb 2026 23:26:33 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.20) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 23:26:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WgKdP+9wMzMbeyXwmjTco71SYIeP7IUIn280aTmd5Uhobj8KH6t6Z68c0JsQA++7ncFI8sB1THzxPzn26z3sJY/oz1s5+xwF0EHN7XDFNFhmQxgPwJQYA78lvkPf3aA6sz14HsTCq7EPruVGS1TpVi1xqdqaHI2LxBEOOAU1tN3VYknqYj6+gZYwPJdbWsK96olhW5Sjf4FrISRqdcODD+knBFRHZTK4dUavlYeb1Xz7Pko3EYla8swQpTxM0PNX4eS+HpttmpnQBbv9pCSjrCh+1SRgdqxhc3SHh5SqDx6YfAQLIgIfkHm5DontT2js8ZnWlA//kv8kTN3oQMm5qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aH17W20esjCWDSGIfY36znyukH7m1GW4RTpNNyMXLNI=;
 b=WgryYX/ijal3grpZkaB4zypUbs/k/Xa9ekwG/19XBAtnaqBVlShNLa2jBe8KcVCFzyuEKJRvCgv48I7RHQGjkFiHpiYduc8MfDafz9oR91X82ET4VrI0UWdFom17AX+zx8sUaowDzR9zk/gCGWi5nVlPBGYil6/CKr4B2MXoYkgyBQLicWKpDC0w5xGKLDX9k6nPfhW7qOKBBI3VlMRUj7KibKlLhNXGUyFQrJuYzpcAiYcAf4DeqCfwIqE0NsAVobKEXmF0E+tZ/iOBF5tREiBVeiK5T6uKJaRRuVFFs2YC4AQFYJwRzT6X8RP70TEMMi95IN/YpfVfGIDJhyT5Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DS4PPF10012BF96.namprd11.prod.outlook.com (2603:10b6:f:fc02::a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Thu, 26 Feb
 2026 07:26:26 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::e4de:b1d:5557:7257]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::e4de:b1d:5557:7257%5]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 07:26:26 +0000
Date: Thu, 26 Feb 2026 15:26:16 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Harry Yoo <harry.yoo@oracle.com>, Hao Li <hao.li@linux.dev>, "Suren
 Baghdasaryan" <surenb@google.com>, Alexei Starovoitov <ast@kernel.org>,
	<linux-mm@kvack.org>, <oliver.sang@intel.com>
Subject: [linus:master] [slab]  17c38c8829: will-it-scale.per_process_ops
 60.5% regression
Message-ID: <202602261526.dc2fdec-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: SI2PR02CA0044.apcprd02.prod.outlook.com
 (2603:1096:4:196::17) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DS4PPF10012BF96:EE_
X-MS-Office365-Filtering-Correlation-Id: 634ea035-4f2c-4ac7-601b-08de750859fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: YZRUJGjkaPPWZEQSAm8iKD7gCzcRE/55fAqenS8HGq57ATjKho6IYmqaf725bKWZ0rMVNfDNw+uqNm81rNMQbeur0UD8RD79XKAC491LPsfbZxiRky88A54FNF5+VleUhFbBX6fixiZ1zUbzUDEjzvJHJN/twChyGvbfmNpnLGRG4P4GLJWJiHRZZaWeSQjqvYRyEC76P/0peB7zib0SSs4LLyDZpTfYzDU8N2XSDd7bX+zIm3hVssne3io3z7vYhM7F3nS7Q1bISfF9N0OrCYlRAFv5LkYU1jSIpa2QbmAfolFVX9jygfTdrXK4fE0cguk745Z54aAA8i3vueVhb3o8SShQfsrrehppmdWy8ZXhgzr2pDk3JcOz8cdWU6HeMIpRdnA7WaZbkIpgPd1wreQ3GWmDY7JMG6KkwEAbRl6UmaeF6R8xp1TmJ7C2M97kRf4igqEgLoQaF1I95rSH4Po/kXhGp2R7iuD3itZ5yzzwQvW1CGtaq7WyoKc6QHkwBSZOUwDt5mkzZUlGsje/toaqA5JxIws5QjMy3hD9Wqp9WqjDTDrzgWRhYABLbxbiuPnpmXAp+EHQnbsh+5m+WkgacyY6oDfFglfl2JV+EMHkhlL6m0mRpj1MWYAR5c+LBCW1EZmb1jWWDGya4SxfdeficWlo1vRTxTGJkXu8L5HfBay6R6f40u91hVIQC8JOUBZUMr7SRqYLF5ljxF7AJOlfkasK80owVN1JhHwptsdzkDAytSktzHSYN6NwgJ6D
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?YnbfVBYWP/cGHs1NZTlZdYszUqYhqlxhGfMwp8TUxi+V0G2aWl0AD0ry3H?=
 =?iso-8859-1?Q?CTD32BWv9ndjnvrN4EZVTgGlwR3ugBvU3P7garETMDQp1u/eAJHExG8k7s?=
 =?iso-8859-1?Q?CXgxFnm0x/2Tjt+CfZQWXNSOLz3KtyxSkDRmtgRY3EX9b0tzmFHvAJwBu2?=
 =?iso-8859-1?Q?VDFD9O8Sj9Qzqy/NN0np4L0ydGHL/HvVRnr5BwpVdhsRSohTFXRLLdRJrD?=
 =?iso-8859-1?Q?XwLtvLEJ7ARoJ1Gd+U8ZXcAHwAwxnpagc+Akx3Rwoq/nZccLsFesXJcUtC?=
 =?iso-8859-1?Q?WUtBecntW/O3UDIP38vPGeMp58oLnm4wO2wLtrktbxzNQscocgDPo/2i1U?=
 =?iso-8859-1?Q?skapTM7BuDo9rq2mSDIWnOrbROE7Cyds1pPnjd1+6PrNtvmtVTeElHUWbk?=
 =?iso-8859-1?Q?ToDa/O+vJSmmT+auuHiqRH3OGMqKB79dTydLq44KyRRILVgunykCMdzcPX?=
 =?iso-8859-1?Q?m1lUuCiv35gb74qPTZU0GYOCQPmgPTK0ZNtObbyQzyrdKE+FHV4Vm3d9X7?=
 =?iso-8859-1?Q?iRqsl1y+DVzttMjPGM9K2UqjDYHZWAsIJyslS+/WEiwZfDu9I0PKDWh3wK?=
 =?iso-8859-1?Q?hGxRoM00jIlHjABdBycLda/sPbbQNBNNOBcU5hUCwMwWdXgtp73394fbCl?=
 =?iso-8859-1?Q?tGetf381TUpYuHDQj6twu2TfOpw1L/eLQ8a3eL5Jr9du1I037N5WSJx3nQ?=
 =?iso-8859-1?Q?Qt+4JAAZyKaQwFK807DYPSnqF6l0J34NARPMH9BFjmKsHt9r2+ZmZM13tq?=
 =?iso-8859-1?Q?/LEL2yM7yDS97wwh8VnVw1omCk0pvq+SiAZeJjOMGOGKcoP2ZvjdIyiRFw?=
 =?iso-8859-1?Q?2+MNz2zu5kQ7CoAuVyoA7u1kcRO8kfRacl69tUeS3JUFa05s0ZndgdJHNy?=
 =?iso-8859-1?Q?5V4SJ/T0Knhx0Sq+dF9iaSwqG1es9sEsmbe19E1p6ELTyDcha30AqqY0/A?=
 =?iso-8859-1?Q?3HbEdUVz6Pjy6Km6/32SjjcBrTfnk0OSd9eT/TciAm8m37P44Gm2Nxh+ey?=
 =?iso-8859-1?Q?KSdLyV3mV4qH3JO4Pd2j0niUhGfgweDmeHgrYM9AvrSN9vnUM6kH7qo8m5?=
 =?iso-8859-1?Q?OZxjlibTVJsO8sJXIPMLnDBlzNp0+1iikhsxIBHomJg7ZtMWQec9g2P3bI?=
 =?iso-8859-1?Q?uq5APDbdL/CkXNAIPLFXCW6CReRgAEQMmpKt6W86YhDFVij/zZbu4Ndxvn?=
 =?iso-8859-1?Q?DgMW56JlR3QNA4H2AFGr4OZPpaaDh4UB3tfVVKuUq/+uvlhgv6CuYpfI8G?=
 =?iso-8859-1?Q?bHMVWMQ9Bsn++oGsISONalSjID148C8NFnbcwXO5S8550bjd3gIckyj0d0?=
 =?iso-8859-1?Q?aJFPiYrSMLim0Sl+8GBoKx1JWjfEfgn+wyRTqLmYd9zvqscC774kRAWyh6?=
 =?iso-8859-1?Q?Aaayl0Z+L309pLD2Wgjw4E8oBGfuad5GqUl1Qiy+r1Mpntnp2Xu7cubPQ/?=
 =?iso-8859-1?Q?0hz1JYe6CD8zjvxLCkKy305TvFMiA9fmJ25Pa5DRKcjQhFPEE6OrEQYcLP?=
 =?iso-8859-1?Q?D5afAGm0jBkrKORNmvEgr5Lzgx18vR+QDr0UA1SM+CQPnTfhLQdOfFhynJ?=
 =?iso-8859-1?Q?c9NmQRDc/Avv7uDotuDuY9uj8yv39NMRcgax6Rv87hYPiAaLjV8JSQbn1k?=
 =?iso-8859-1?Q?A43NNiIyqNW1ktH0S6Hgj3TORTyh9131kB69zVUuw7EgIDl5C+pY0WkVsq?=
 =?iso-8859-1?Q?XkKBUEbMG3acBaR6C9B6xP+FM3pWj6E5vU/sr3emiE2Y+d0pvnhH3F8+bX?=
 =?iso-8859-1?Q?UE642cbhCq8eHKvn27Cpub0y3tJsQZMPx3Uy9at6gjQs1mm5peTC6/mcJD?=
 =?iso-8859-1?Q?hsQYajsagQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 634ea035-4f2c-4ac7-601b-08de750859fc
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 07:26:26.4110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yrdtrDd3KtrPGW6x+rnBs3NA97epAwPNDGXrpUz0CSdQaT/OAeED3Zl8lSZ1c8weJ3IxT12cYCKj4p/Id3M2sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF10012BF96
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 60.5% regression of will-it-scale.per_process_ops on:


commit: 17c38c88294d75506c67cae378c9e940d1ce55e3 ("slab: remove cpu (partial) slabs usage from allocation paths")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[still regression on linus/master      8bf22c33e7a172fbc72464f4cc484d23a6b412ba]
[still regression on linux-next/master 44982d352c33767cd8d19f8044e7e1161a587ff7]

testcase: will-it-scale
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 48 threads 2 sockets Intel(R) Xeon(R) CPU E5-2697 v2 @ 2.70GHz (Ivy Bridge-EP) with 64G memory
parameters:

	nr_task: 100%
	mode: process
	test: brk1
	cpufreq_governor: performance



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202602261526.dc2fdec-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260226/202602261526.dc2fdec-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-14/performance/x86_64-rhel-9.4/process/100%/debian-13-x86_64-20250902.cgz/lkp-ivb-2ep2/brk1/will-it-scale

commit: 
  ed30c4adfc ("slab: add optimized sheaf refill from partial list")
  17c38c8829 ("slab: remove cpu (partial) slabs usage from allocation paths")

ed30c4adfc2b5690 17c38c88294d75506c67cae378c 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
  22625956           -60.5%    8947026        will-it-scale.48.processes
    471373           -60.5%     186395        will-it-scale.per_process_ops
  22625956           -60.5%    8947026        will-it-scale.workload
     20.65           -74.9%       5.19        vmstat.cpu.us
     10502 ±  3%     -87.0%       1366 ±  9%  vmstat.system.cs
      1.31            -0.1        1.20        mpstat.cpu.all.irq%
      4.13            -1.9        2.21        mpstat.cpu.all.soft%
     73.24           +17.4       90.61        mpstat.cpu.all.sys%
     20.67           -15.3        5.36        mpstat.cpu.all.usr%
    179.60            -4.1%     172.24        turbostat.CorWatt
      0.39           -40.0%       0.23 ±  2%  turbostat.IPC
    211.17            -4.4%     201.86        turbostat.PkgWatt
     21.36           -45.0%      11.76        turbostat.RAMWatt
      0.07 ±  6%     -38.7%       0.04 ±  9%  perf-sched.sch_delay.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      0.07 ±  6%     -38.7%       0.04 ±  9%  perf-sched.total_sch_delay.average.ms
     18.17 ±  3%    +262.0%      65.77 ±  8%  perf-sched.total_wait_and_delay.average.ms
     47429 ±  4%     -84.9%       7139 ± 10%  perf-sched.total_wait_and_delay.count.ms
     18.10 ±  3%    +263.2%      65.72 ±  8%  perf-sched.total_wait_time.average.ms
     18.17 ±  3%    +262.0%      65.77 ±  8%  perf-sched.wait_and_delay.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
     47429 ±  4%     -84.9%       7139 ± 10%  perf-sched.wait_and_delay.count.[unknown].[unknown].[unknown].[unknown].[unknown]
     18.10 ±  3%    +263.2%      65.72 ±  8%  perf-sched.wait_time.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      0.68           -83.8%       0.11 ±  6%  perf-stat.i.MPKI
 1.657e+10           -35.2%  1.073e+10        perf-stat.i.branch-instructions
      0.27 ±  2%      +0.1        0.34 ±  2%  perf-stat.i.branch-miss-rate%
  43387409           -17.1%   35980500 ±  2%  perf-stat.i.branch-misses
     38.35           -35.8        2.53 ±  6%  perf-stat.i.cache-miss-rate%
  56795946           -90.4%    5475678 ±  6%  perf-stat.i.cache-misses
  1.48e+08           +48.5%  2.198e+08        perf-stat.i.cache-references
     10520 ±  3%     -87.4%       1322 ±  9%  perf-stat.i.context-switches
      1.70           +65.9%       2.81        perf-stat.i.cpi
      2499         +1000.8%      27508 ±  6%  perf-stat.i.cycles-between-cache-misses
 8.369e+10           -39.7%  5.048e+10        perf-stat.i.instructions
      0.59           -39.7%       0.36        perf-stat.i.ipc
      0.68           -84.0%       0.11 ±  6%  perf-stat.overall.MPKI
      0.26            +0.1        0.34 ±  2%  perf-stat.overall.branch-miss-rate%
     38.37           -35.9        2.49 ±  6%  perf-stat.overall.cache-miss-rate%
      1.70           +65.9%       2.81        perf-stat.overall.cpi
      2500          +942.6%      26067 ±  6%  perf-stat.overall.cycles-between-cache-misses
      0.59           -39.7%       0.36        perf-stat.overall.ipc
   1117006           +52.3%    1700887        perf-stat.overall.path-length
 1.651e+10           -35.2%  1.069e+10        perf-stat.ps.branch-instructions
  43243442           -17.1%   35861582 ±  2%  perf-stat.ps.branch-misses
  56607711           -90.4%    5457714 ±  6%  perf-stat.ps.cache-misses
 1.475e+08           +48.5%  2.191e+08        perf-stat.ps.cache-references
     10485 ±  3%     -87.4%       1318 ±  9%  perf-stat.ps.context-switches
 8.341e+10           -39.7%  5.031e+10        perf-stat.ps.instructions
 2.527e+13           -39.8%  1.522e+13        perf-stat.total.instructions




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

