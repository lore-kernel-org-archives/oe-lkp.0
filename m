Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198091D63D1
	for <oe-lkp@lists.linux.dev>; Tue, 11 Feb 2025 08:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739263522; cv=fail; b=Dg45/8PP9Ya4aR5MlO/BeziaJ1EF3RmmgtLqh9brm6ZD6KNAKwaocx6oQJRZY3aXfvYjsCMo0rHaFAg2tFCgT9zdxClFIXeDTK2fKt+2Msx1JbIeHs7JOewlV4XGyYU/1lBzXGDUQUbIFiIOz8UnZ67CS84JMubCwfwTzZ2ubdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739263522; c=relaxed/simple;
	bh=HefpBnpklXZ8gHbKsDDgDF0AKLhgsslQZqY2/eqBFDM=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=NwWJHf3S3mL7s+poAk2yITxYVWxmFDbTxBpCbUDxbA2CA14yPfNpo0TQJb4ZdqigN/9Lths7tcKP4iOjDlTNp0GBRvD3FWKkbbnwP24oi1Ux2rMB+uJc+U1rzAzw98q9ifSm6ZnX5Ks52EJh5fT5c4+g0iK9E1nOVCIRTLsMHyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LHfGU7FF; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LHfGU7FF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739263520; x=1770799520;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HefpBnpklXZ8gHbKsDDgDF0AKLhgsslQZqY2/eqBFDM=;
  b=LHfGU7FFbZoDn1NyfQLHW6ybzS21k/7KPggm/ryipDEFda4uiYyzwpmx
   6gfP9eUblQhNhCbSRdW1Zr30FwPAtAoVSOR2wxfvbv1AFKA7avDKmO/os
   xG+KQC9Vdvyat+qFRina8li1SjSkonie/G+bu6LXz39En86CSzVrRpnQQ
   ICpzFaK58/9rirx6WLc9D8+mtQH2oVAbW1MJuQM0j6aP7CTRSGaLZ4/wx
   77Ergufs0vcJ4lQ9S223HCpRf9oii0cnNybBr0HR2pe3sm29eFY/7kvnj
   aqzd6yl3/9PWG3oz7kPi7sHGRsg2sVitsD4g4nQEziOPl8bM84RcDWDS/
   A==;
X-CSE-ConnectionGUID: 6qAuYC5yRY6IYKwighefVA==
X-CSE-MsgGUID: vRhVDRMVRn2t9/5YP4RTfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="50506546"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="50506546"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 00:45:20 -0800
X-CSE-ConnectionGUID: qqSf8PZZS+GqfBYcq8vZXw==
X-CSE-MsgGUID: SALMKvt0RBKaQw9UnaRymA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="112956396"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 11 Feb 2025 00:45:19 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Feb 2025 00:45:18 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Feb 2025 00:45:18 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Feb 2025 00:45:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hETs/wvWhzLocmFlJ0Xg7vgp3Ll/YVcRJoKh5pl/F9C3hvw4m5OdTpyFr0xyTaTScsOEpWoozJ6X88B//gLQ0ha1jGM4uz6EddQZTSQik6eR+wnYp8oGD05ATuLpRMPUmBUKerTzp8ELjFJyCkJGa5odnYzaoq1KmUm8OesS5zL+TotmmM7bkhyAo6Kr6895WPuSyjyuCss8mNsZmutp81lQ7jaZBvv3eitvldai4ibw/HeGZy82kllRnAhILpscU2I1NUkyltDjv6/9rWur7294M22mutd9WAAZM+qP8XGPqykjuUSbucBzV+TbRDBrn18hfjT0lobH3JBsxind0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IfYk74qXcvHtxr1FDUPnxpYHc8Zz3e40R+RdBF7TiQQ=;
 b=mGpoK11crEm8jt8zsdsUkqw887k+TYm7A/7ISSC9D/LSybTcIP1AUfmmvXvOIBo2qJ9GpJvbNtT/rZ1Wf/qpK4r1cbsFt4B48fMAzBRDetK9TyFHA/3ElsdfEN7TYJGsO197UFVkTbLXj7PokbshtxpFTYsIMwL3P/tJfAzmi0PKoXAnKYp0uYGBO6W7UU/JQcB7iK1Wi+Y+9XGa24aNrcWqDs6RysEohTsBCNBLlEPv30qmaQp8r6H52Kl6Aq8VOxWPsdCucZLorlOUNVnuSFsKAPsnySN+tpCnRCbGYjGlrhltbHe47oEdJi/g7Pa0MqK4RE7Or0mfEYp5/FBsHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MN6PR11MB8170.namprd11.prod.outlook.com (2603:10b6:208:47c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.17; Tue, 11 Feb
 2025 08:45:16 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 08:45:16 +0000
Date: Tue, 11 Feb 2025 16:45:08 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [vbabka:maple-tree-sheaves-v3-hack] [mm/slub] 6ae99d8987:
 BUG:unable_to_handle_page_fault_for_address
Message-ID: <202502111634.5b253851-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR02CA0018.apcprd02.prod.outlook.com
 (2603:1096:4:194::18) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MN6PR11MB8170:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d7d0b0a-8b6c-436a-75b7-08dd4a786834
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?M2fSflFz7fuuAIAgH92mXE9HNa4VXM0WzoPg1L1/YsRwv1tjJw4V62ak5HD+?=
 =?us-ascii?Q?xnh7t3bVINWcKLBFU6+WSePfHrCprgdAG0N6K9o0+rzombjLB1HahZ6FxqTd?=
 =?us-ascii?Q?Fc9AUFx0p+PrMQSSAMM5XFpaOU17dLFYcppUFOr+cB+euPVLk1EqhnXRUpoy?=
 =?us-ascii?Q?7YiKsfTrvIPhdJw8S2xL2N+e/w7DuFW1GDgB+TAd9zDx7o89sACyhpic5+qk?=
 =?us-ascii?Q?j4kRxHwfZ3KuASbK9cfstz0DGBOZSOJla6y6W5pcpp3VY2pvr04K+9pic8Vu?=
 =?us-ascii?Q?ZXMcFC/yXq/n1MCu95fhXabpe5LdH3BhngYoer/nFXL/PNSwClK4Uiq5A9QP?=
 =?us-ascii?Q?/K80ai7dqX8IoxLp8lqOue3MRsItxIIq9Rk5JocOK32eN+DG1hopfn31s37c?=
 =?us-ascii?Q?QX+PaSQCjQr43RoUAgl8D6rQWLaGcjm1sV8hprJ0aZSxf9EcbMbSg03GGWyd?=
 =?us-ascii?Q?kLTkKmoHJZdLgY+g0HW6Z5746E16dTH31/XsKQ2yf0+ASHLOJcAXBiMMHzWb?=
 =?us-ascii?Q?6xKxEUWszAaDr4g24osBvtmdcaKDZzy0J+7RqSFkCQZdoz+skDpntopo2Eco?=
 =?us-ascii?Q?x8lRtFvKZxkBwSrKKzE/E/ji+3TTnS7wypqDhrqkHEZuxoGxxTmbM3YGEuH5?=
 =?us-ascii?Q?H0cDODKF425nHQcflnu+CZwR1L2ElNlsmAjoV6Br4zPi2JVOQl3o19ypMgzy?=
 =?us-ascii?Q?QjHsQY2aDYBkxtXmfH4IBx+OiwpWcdpXfqYpNjMoH6UHdr0sI9o7q3IhJdDT?=
 =?us-ascii?Q?2FPS61vvhfp1JIlbDAs96FhSQwtxzAtH8psj5dgsHvEeklVa1k+pjS10ca+B?=
 =?us-ascii?Q?mxoglgcjcu1UaazhrFY4otBcAid+tQvQjWeTatU/LiWt4TyfpJlYNM3c6mw9?=
 =?us-ascii?Q?5p7RCGUOwSRywc64JpSq1NZG6zg+YHeKCajQ5ZU6rjiyJ+MCHFB3ME8MKyrK?=
 =?us-ascii?Q?/VO+7sFtz7Hk5EMA0GjgZZJOSJmF2U4am6gLbsshDbpMnupNslZConTti164?=
 =?us-ascii?Q?xyHa+omjfZYK+SjC2SJbQu0tOeOO9iFM2MrNQ9ZCxibJ/D2Q0c3s6O4yIQQZ?=
 =?us-ascii?Q?rQDxXjLSMFdKIewefIhikXEPcO1Mun9qpqc3G43pf/4aciYXFwpDChIeMQnn?=
 =?us-ascii?Q?wXnTqobmbtNHqOI6PLcXFATqtGFofYJM4u6E3fmRmbSZH4O9hJnhQ9sKojsF?=
 =?us-ascii?Q?HLAuyQFMHbXGWU4a/4fKq4XmrjfGw/vaI/2SVsxgAKvT91vW7sCN8KKC91aN?=
 =?us-ascii?Q?kNIrZi2fVbUbFKhycyFP1ZRuD1/4rxeQLSyL6Udcrb6+u6nLQX+NFdUjcUA+?=
 =?us-ascii?Q?xv/bnCSYRftZUzCJrTZxSBsNjpa4idG4FHm5wMwEklBJ1Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ATnx9DtxpeiBZFETkNpMxttzCJC4Og92+QhPGfMu/yqCCN7pqcXIEUh6fWUG?=
 =?us-ascii?Q?LanodtuwdPH8gppLer7DWF+AfFuNh64OmeRfXT91G4v1Ly9AlouyOvndKVa9?=
 =?us-ascii?Q?5rsHrPhIGNeqBpkFzbwCP4ASFSawaGcxifvSrYTJFJ+bTnYRhocwYaxaKwLl?=
 =?us-ascii?Q?DRcy4l80WJvhhXUsty3YIRYQuTWVq6WMPGIHOxqkhkS0EhxQ1rouCuDqws2e?=
 =?us-ascii?Q?J/oiULGVkTGf9s0yvhE1EYgcCaM074TTXkY4xHvoLyfkUCVI/0D7rwBgeQfO?=
 =?us-ascii?Q?/IBHxX8A/gYI93Fuejv6z34jnJmxqSnpraVxYukp+Pb+AOEKggdV2LZPKTw9?=
 =?us-ascii?Q?yrLUK3FRO5JCPxajlJ+iFwVjbbzxQUHZm67ssE9LR2rHuzCei9acie5JqUS4?=
 =?us-ascii?Q?lzTE80eQRMQfSLJ4V9HYfbWD131g8r3wgAn0sJTjiK4M2td82efqC3s27D6/?=
 =?us-ascii?Q?hDEPaiqkMpp/famHLsAYBniUjX5nJVllFbF5SS8rR54iM61Kw5sV0yQ3pCdS?=
 =?us-ascii?Q?xGwpZlI8Ba2hlJM9dhb+bRbxZlqJhbhhR7nbRq6usVTRNJfP3zYtQfR+qxH5?=
 =?us-ascii?Q?3H/IKZHcQNlzWurwemyWxb7r2JYzZAS2ARteNTgDMpf7yetn1N0YG3/F2dEF?=
 =?us-ascii?Q?xO7paJSJ8RoAcnNttdXoTCJXpcBuqyUpPLEOlh2NxMVYulougScjp8O5RL77?=
 =?us-ascii?Q?Q+Q0UHKQdciAA38Z6PmbxbOZ6SJboG2bd11bVyI2flvD8YWR/eBrAdqdeMlZ?=
 =?us-ascii?Q?SkjZhqlwjXbgJCqxXMzwPkaACAJosB6SO/Rr1rP5TvlO+Vje/vptytIpNm9I?=
 =?us-ascii?Q?/YW/XgNSj5zesMoIcSATXN/KQnXZXRPkGaLWDFu9u84KKIkVuQNRY5FVHQ6q?=
 =?us-ascii?Q?IUEjLLlKXxy6udfoZ+vstoWd6sPM+Ye31NkRDRDKYoyPiFFTjs69QH/lwjum?=
 =?us-ascii?Q?/Zf3JGaserOfuWPoHwGv6eDuw+1w13QcOAWZP2XF4MGMuW3i0lwiuPxVnUUp?=
 =?us-ascii?Q?qtL8rriIV3U7yWpBrxqDnUcTDVjVL27C5MRzG241X1KbuokNoqjdV52vOXyH?=
 =?us-ascii?Q?QbfTGtg1STNQ9qxNt6QssmZwL42eWBsfIn7f4EuO8vJcB6Hw9GfcpHILLvhO?=
 =?us-ascii?Q?GYkgDyZ4dHBxbWjXEYceOQHr1MrQLq+Ai56d7o2MaM5S9HJJ3VzZDsenmNk7?=
 =?us-ascii?Q?WsXITOGVRiQEXef4RDOR/nlyLLm9rWkIROi36llB7iFliR6BfuCh68H3q9eF?=
 =?us-ascii?Q?0iUxHcAF6l5b/1Z9wQENClKk+HFy7AuSLKLMA6GKe8o+HR8dEQNHkLgQWiK8?=
 =?us-ascii?Q?hJ/MZ3qWJQH+k56wdeT1PBJy6DBsZomWPEaBpqxtQHKTo/CYo6rCwWJPq2ss?=
 =?us-ascii?Q?+XYvOqUci7mXPfbDfZ6lCK/LQBAg7i5w/So593XV+C4INwWODSnUieZ5zSRW?=
 =?us-ascii?Q?WGmZkEJRI1yfJsE6Mf3eQ5tG+UbyUU9hnj3sxlJlaXmTfPxVdVY17azq6kPw?=
 =?us-ascii?Q?++Pqe8Pgn3zYB3yUCdu2AwKLofS31JFWOpk8RWrxnUvIlM6O8RGWhsRCmMR6?=
 =?us-ascii?Q?/4DjpQKxgwttWLRy7NvC/wbRxqSSUdtyCweySBytE63NCAswEjL/Im2YsiN6?=
 =?us-ascii?Q?Iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d7d0b0a-8b6c-436a-75b7-08dd4a786834
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 08:45:16.2063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cvssaZvqWIIVTqVe1JhhXUE0zEkraSLEZFOl7z2u4ICSGr829nvL4Tjj9w3VS6BauLZU6VibDkwjTuRhK5+xkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8170
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:unable_to_handle_page_fault_for_address" on:

commit: 6ae99d898777c763b32368e64b6047318a585480 ("mm/slub: add opt-in caching layer of percpu sheaves")
https://git.kernel.org/cgit/linux/kernel/git/vbabka/linux.git maple-tree-sheaves-v3-hack

in testcase: rcutorture
version: 
with following parameters:

	runtime: 300s
	test: cpuhotplug
	torture_type: tasks-rude



config: i386-randconfig-006-20250206
compiler: clang-19
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+---------------------------------------------+------------+------------+
|                                             | ce998ef62f | 6ae99d8987 |
+---------------------------------------------+------------+------------+
| boot_successes                              | 15         | 0          |
| boot_failures                               | 0          | 15         |
| BUG:unable_to_handle_page_fault_for_address | 0          | 15         |
| Oops                                        | 0          | 15         |
| EIP:slub_cpu_dead                           | 0          | 15         |
| Kernel_panic-not_syncing:Fatal_exception    | 0          | 15         |
+---------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202502111634.5b253851-lkp@intel.com


[  903.483592][   T95] BUG: unable to handle page fault for address: 22d2901c
[  903.497033][   T95] #PF: supervisor read access in kernel mode
[  903.508673][   T95] #PF: error_code(0x0000) - not-present page
[  903.520178][   T95] *pdpt = 000000002d20e001 *pde = 0000000000000000
[  903.529533][   T95] Oops: Oops: 0000 [#1] PREEMPT SMP
[  903.538675][   T95] CPU: 0 UID: 0 PID: 95 Comm: kworker/0:2 Not tainted 6.14.0-rc1-00007-g6ae99d898777 #1 5603fc9365f1d85d27f438261baf539a26273452
[  903.562623][   T95] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[  903.581901][   T95] Workqueue: events work_for_cpu_fn
[ 903.592377][ T95] EIP: slub_cpu_dead (mm/slub.c:2613 mm/slub.c:3776) 
[ 903.602098][ T95] Code: 0c 00 00 00 00 85 d2 74 0b 8b 4d f0 e8 5b 29 00 00 8b 4d f0 8b 73 b0 8b 7d e8 83 ff 20 0f 83 93 00 00 00 8b 3c bd 88 f7 49 c3 <8b> 44 37 1c 85 c0 74 54 8b 48 0c 85 c9 74 34 8b 55 f0 8b 12 64 01
All code
========
   0:	0c 00                	or     $0x0,%al
   2:	00 00                	add    %al,(%rax)
   4:	00 85 d2 74 0b 8b    	add    %al,-0x74f48b2e(%rbp)
   a:	4d                   	rex.WRB
   b:	f0 e8 5b 29 00 00    	lock call 0x296c
  11:	8b 4d f0             	mov    -0x10(%rbp),%ecx
  14:	8b 73 b0             	mov    -0x50(%rbx),%esi
  17:	8b 7d e8             	mov    -0x18(%rbp),%edi
  1a:	83 ff 20             	cmp    $0x20,%edi
  1d:	0f 83 93 00 00 00    	jae    0xb6
  23:	8b 3c bd 88 f7 49 c3 	mov    -0x3cb60878(,%rdi,4),%edi
  2a:*	8b 44 37 1c          	mov    0x1c(%rdi,%rsi,1),%eax		<-- trapping instruction
  2e:	85 c0                	test   %eax,%eax
  30:	74 54                	je     0x86
  32:	8b 48 0c             	mov    0xc(%rax),%ecx
  35:	85 c9                	test   %ecx,%ecx
  37:	74 34                	je     0x6d
  39:	8b 55 f0             	mov    -0x10(%rbp),%edx
  3c:	8b 12                	mov    (%rdx),%edx
  3e:	64                   	fs
  3f:	01                   	.byte 0x1

Code starting with the faulting instruction
===========================================
   0:	8b 44 37 1c          	mov    0x1c(%rdi,%rsi,1),%eax
   4:	85 c0                	test   %eax,%eax
   6:	74 54                	je     0x5c
   8:	8b 48 0c             	mov    0xc(%rax),%ecx
   b:	85 c9                	test   %ecx,%ecx
   d:	74 34                	je     0x43
   f:	8b 55 f0             	mov    -0x10(%rbp),%edx
  12:	8b 12                	mov    (%rdx),%edx
  14:	64                   	fs
  15:	01                   	.byte 0x1
[  903.637062][   T95] EAX: 00000000 EBX: ed6ba954 ECX: ed6ba900 EDX: 00000000
[  903.650313][   T95] ESI: 00000000 EDI: 22d29000 EBP: edd93e74 ESP: edd93e5c
[  903.663542][   T95] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010287
[  903.678675][   T95] CR0: 80050033 CR2: 22d2901c CR3: 04857080 CR4: 000006f0
[  903.691830][   T95] Call Trace:
[ 903.699121][ T95] ? __die_body (arch/x86/kernel/dumpstack.c:478 (discriminator 1) arch/x86/kernel/dumpstack.c:420 (discriminator 1)) 
[ 903.708036][ T95] ? __die (arch/x86/kernel/dumpstack.c:434) 
[ 903.716364][ T95] ? page_fault_oops (arch/x86/mm/fault.c:710) 
[ 903.725981][ T95] ? kernelmode_fixup_or_oops (arch/x86/mm/fault.c:737) 
[ 903.736746][ T95] ? __bad_area_nosemaphore (arch/x86/mm/fault.c:784) 
[ 903.747406][ T95] ? slub_cpu_dead (mm/slub.c:3774) 
[ 903.756968][ T95] ? bad_area_nosemaphore (arch/x86/mm/fault.c:833) 
[ 903.766982][ T95] ? do_user_addr_fault (arch/x86/mm/fault.c:?) 
[ 903.777218][ T95] ? exc_page_fault (arch/x86/include/asm/irqflags.h:19 arch/x86/include/asm/irqflags.h:87 arch/x86/include/asm/irqflags.h:147 arch/x86/mm/fault.c:1488 arch/x86/mm/fault.c:1538) 
[ 903.786749][ T95] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1493) 
[ 903.798575][ T95] ? handle_exception (??:?) 
[ 903.808492][ T95] ? oom_kill_process (include/linux/percpu_counter.h:? mm/oom_kill.c:1051) 
[ 903.818501][ T95] ? get_page_from_freelist (mm/page_alloc.c:2213 mm/page_alloc.c:2292 mm/page_alloc.c:2914 mm/page_alloc.c:3083 mm/page_alloc.c:3474) 
[ 903.829592][ T95] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1493) 
[ 903.841223][ T95] ? slub_cpu_dead (mm/slub.c:2613 mm/slub.c:3776) 
[ 903.850583][ T95] ? get_page_from_freelist (mm/page_alloc.c:2213 mm/page_alloc.c:2292 mm/page_alloc.c:2914 mm/page_alloc.c:3083 mm/page_alloc.c:3474) 
[ 903.861445][ T95] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1493) 
[ 903.873436][ T95] ? slub_cpu_dead (mm/slub.c:2613 mm/slub.c:3776) 
[ 903.882921][ T95] ? __kmem_cache_do_shrink.llvm.4033622462196252832 (mm/slub.c:3770) 
[ 903.897735][ T95] ? __kmem_cache_do_shrink.llvm.4033622462196252832 (mm/slub.c:3770) 
[ 903.912801][ T95] cpuhp_invoke_callback (kernel/cpu.c:?) 
[ 903.922565][ T95] ? bio_alloc_cache_prune (block/bio.c:741) 
[ 903.933413][ T95] _cpu_down (kernel/cpu.c:966 kernel/cpu.c:990 kernel/cpu.c:1383 kernel/cpu.c:1444) 
[ 903.942261][ T95] __cpu_down_maps_locked (kernel/cpu.c:1474) 
[ 903.952119][ T95] work_for_cpu_fn (kernel/workqueue.c:6731) 
[ 903.960284][ T95] process_one_work (kernel/workqueue.c:3241) 
[ 903.969193][ T95] worker_thread (kernel/workqueue.c:3311 (discriminator 260) kernel/workqueue.c:3398 (discriminator 260)) 
[ 903.978361][ T95] kthread (kernel/kthread.c:466) 
[ 903.986592][ T95] ? alloc_worker (kernel/workqueue.c:3344) 
[ 903.995249][ T95] ? kthread_blkcg (kernel/kthread.c:413) 
[ 904.003831][ T95] ? kthread_blkcg (kernel/kthread.c:413) 
[ 904.012654][ T95] ? kthread_blkcg (kernel/kthread.c:413) 
[ 904.021426][ T95] ret_from_fork (arch/x86/kernel/process.c:154) 
[ 904.029857][ T95] ret_from_fork_asm (??:?) 
[ 904.038771][ T95] entry_INT80_32 (??:?) 
[  904.047678][   T95] Modules linked in: rcutorture torture
[  904.057919][   T95] CR2: 0000000022d2901c
[  904.065670][   T95] ---[ end trace 0000000000000000 ]---
[ 904.075397][ T95] EIP: slub_cpu_dead (mm/slub.c:2613 mm/slub.c:3776) 
[ 904.084829][ T95] Code: 0c 00 00 00 00 85 d2 74 0b 8b 4d f0 e8 5b 29 00 00 8b 4d f0 8b 73 b0 8b 7d e8 83 ff 20 0f 83 93 00 00 00 8b 3c bd 88 f7 49 c3 <8b> 44 37 1c 85 c0 74 54 8b 48 0c 85 c9 74 34 8b 55 f0 8b 12 64 01
All code
========
   0:	0c 00                	or     $0x0,%al
   2:	00 00                	add    %al,(%rax)
   4:	00 85 d2 74 0b 8b    	add    %al,-0x74f48b2e(%rbp)
   a:	4d                   	rex.WRB
   b:	f0 e8 5b 29 00 00    	lock call 0x296c
  11:	8b 4d f0             	mov    -0x10(%rbp),%ecx
  14:	8b 73 b0             	mov    -0x50(%rbx),%esi
  17:	8b 7d e8             	mov    -0x18(%rbp),%edi
  1a:	83 ff 20             	cmp    $0x20,%edi
  1d:	0f 83 93 00 00 00    	jae    0xb6
  23:	8b 3c bd 88 f7 49 c3 	mov    -0x3cb60878(,%rdi,4),%edi
  2a:*	8b 44 37 1c          	mov    0x1c(%rdi,%rsi,1),%eax		<-- trapping instruction
  2e:	85 c0                	test   %eax,%eax
  30:	74 54                	je     0x86
  32:	8b 48 0c             	mov    0xc(%rax),%ecx
  35:	85 c9                	test   %ecx,%ecx
  37:	74 34                	je     0x6d
  39:	8b 55 f0             	mov    -0x10(%rbp),%edx
  3c:	8b 12                	mov    (%rdx),%edx
  3e:	64                   	fs
  3f:	01                   	.byte 0x1

Code starting with the faulting instruction
===========================================
   0:	8b 44 37 1c          	mov    0x1c(%rdi,%rsi,1),%eax
   4:	85 c0                	test   %eax,%eax
   6:	74 54                	je     0x5c
   8:	8b 48 0c             	mov    0xc(%rax),%ecx
   b:	85 c9                	test   %ecx,%ecx
   d:	74 34                	je     0x43
   f:	8b 55 f0             	mov    -0x10(%rbp),%edx
  12:	8b 12                	mov    (%rdx),%edx
  14:	64                   	fs
  15:	01                   	.byte 0x1


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250211/202502111634.5b253851-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

