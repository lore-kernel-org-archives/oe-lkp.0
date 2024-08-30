Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33C91531DB
	for <oe-lkp@lists.linux.dev>; Fri, 30 Aug 2024 07:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725003118; cv=fail; b=sJt+1vRlrc/ndXVpP+5Q0psnu51HPxMJTB5Cz72PwigCN3Jh1PhIE8H7AsyoWpgLIObFAtw2b/QghlQf582MCpkjX/Wt06THZQaxrtkaOPie5srPzaNp5W3qtOck0oE3cpb9HuEdHV3rmFNMffGxbbH+tVL/+pEXkpmQxVx4Cbg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725003118; c=relaxed/simple;
	bh=VP61nUHaA/9u7Wp27kYFUr6CP9jfmwzizmYrXUu4Pus=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=R4o1V1TU7zV0UOWCKiepilkd+jSBUVO9mqwWECuxlGIMrag23apTq15U/FWocTQyYoJjBk0q82KeP6GD2qywQzPUtHgYPoicbYStaN2Y6BPSddBTSvXNUYqP1WR4yCh5FG1jdsBF+QLEHMmPWERQYkTDILtXKAStdxEBice4lfs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dxHSvyTb; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dxHSvyTb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725003113; x=1756539113;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=VP61nUHaA/9u7Wp27kYFUr6CP9jfmwzizmYrXUu4Pus=;
  b=dxHSvyTb+JfVLJJTajICVgh9zYUHxZL8Z5aZCSc4W9UPv9ZxoxLvwace
   kGFSuOFAldt+3kHRvRf/e4BF+kPR9xDnBrXShd2+TzyTWdFEpfPFaINc5
   41955Z6A6PzGJ9NTuwTrR10zQRv0n8sMyDKxnYBlYhxVSfRfs3L7wmyDv
   mUukgVX74dXEjhmgdTBY/dHnj0ltfyExS0hzOHTbgkdN22v1zk7o4VvG7
   bFbk4XgfbMMEKrkBvLEFedjgkjXBrx9YFsNG96uKjB9ibM2mr45Ebq1ga
   bP1MBiKNuVdwxY0tZJ5p37AbrcGGwf3f/XDv/ow7J3TPNQr/X/g4kx7pM
   w==;
X-CSE-ConnectionGUID: pymkl4boQLGIjluXB0hd4w==
X-CSE-MsgGUID: yNxJModIR8GX4SdpZFl3bA==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="23431585"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="23431585"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 00:31:53 -0700
X-CSE-ConnectionGUID: nledgGNURW2kEPnBeE5UFQ==
X-CSE-MsgGUID: m4W/ReVRTI+j/q2uVYnqAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="64560021"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 30 Aug 2024 00:31:54 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 30 Aug 2024 00:31:52 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 30 Aug 2024 00:31:52 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 30 Aug 2024 00:31:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rXsU8trnLQYJ6wNCMedFxQXuR6MrokTXFmzkSxgeeg//u9tf3AQtlh26xRGM2SpJHri4UDlnFtLbwOKUZlY9vkAUsoOWC9YlAI60t/AVCKga42Npq2qLbQO6GdcvuUT50i63JsYTWwHdveD2gUCCt3iTHt+Tv1r9d8Vtch/1I8TR53FY4JGYSpbl0K9i3S/U1GWbSzcwW8EnSv+0b+uabKczjktuJxfsOHbfS6KaLsoLQguB9NZOBD1iuqvXBMvBae2x0ZlrGV8H5scHyCpt4KS8WQFGDYcMCrxptr6hsDCOHT6Yp1WHUfX4wXjbxgYWzdPoGT4KLRpsJc4AD0Y/2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G/KsTs3PGCAuuAm0hgEd2/gXoLRqHgB5xWd4h6qhrnA=;
 b=d0yUJdinzOvFAIISVjwhp7tY6dEMxfbw+X4GFvgJZU/CCgmTo6j8Zi50RKl6mrs4e/oYmRQXWSp/V94yVr1kYlCt5c3UzPSpb4BX1mQyU08ZNvq/rgMcQnFOZkzwJXymOTYDKtxHNfN6bvAJP31T7BlzUgaA6nUHZD5BxHctoskDkWAoOT8HP3yuIA7oyrp261i42MpwpTYaK/+80OzT5C1JC0VT0cf/vL+u4JSHVr2PzcjUqCrRsJ/1ezNBM7rg65xhR+nNdtclRMPySL05XvWNqDvxiR2sZ25svIr9xVDPOzudnE4+KIWZrCp9TJ+Qptw5b7iXWtraVRzxZe2rsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH0PR11MB4934.namprd11.prod.outlook.com (2603:10b6:510:30::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Fri, 30 Aug
 2024 07:31:48 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.7918.019; Fri, 30 Aug 2024
 07:31:48 +0000
Date: Fri, 30 Aug 2024 15:31:34 +0800
From: kernel test robot <oliver.sang@intel.com>
To: <jasperwang@tencent.com>, <kaixuxia@tencent.com>,
	<frankjpliu@tencent.com>, <kasong@tencent.com>, <sagazchen@tencent.com>,
	<kernelxing@tencent.com>, <aurelianliu@tencent.com>, <deshengwu@tencent.com>,
	<flyingpeng@tencent.com>, <jason.zeng@intel.com>, <wu.zheng@intel.com>,
	<yingbao.jia@intel.com>, <pei.p.jia@intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [opencloudos:next] [sched/fair]  1e116c18e3:
 stress-ng.race-sched.ops_per_sec 41.4% improvement
Message-ID: <202408301502.6e7c0136-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG3P274CA0016.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::28)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH0PR11MB4934:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cd1e87e-e04a-4afb-3a1d-08dcc8c5ce63
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?9GD+40zbFDf1n29YQuqPUrfY/DFaQf0tOnA4KVQyVTwUFqHVazSW8p+OVa?=
 =?iso-8859-1?Q?YDgzYlZAeUNWpQ8v4cVLXiI3GJa3ZhaaPsBG24vRgKJMCROU/OVatugeCX?=
 =?iso-8859-1?Q?qFR07aYvGkGwy6qs7nHgpfMsBTwuZThgwQ4aFoteheVkgzVg/1ABny5vOc?=
 =?iso-8859-1?Q?D4VWjXwRB3brnurxcrua9JCw8oAbu39duitXh1bZDjTS6AGc18sRfz5l0c?=
 =?iso-8859-1?Q?LAYjieTfofBS41XpLdwJ77BT95f1svyNB+QOGV3ji+4lbvt5N0GZ9Tzjrh?=
 =?iso-8859-1?Q?mLzqtNzve5E+Wyssz5dBEJ4zhnzslh7wfkGFzMcWPTI8r4TBVJnnY7V/Jf?=
 =?iso-8859-1?Q?u3RpcX4WsfOVf9Or7W6wSvvWsF1f+riOOGCEB+sWYnaWjReBP1OFs4/eux?=
 =?iso-8859-1?Q?ZjA8FQHxi0q7Ewo856WrirArnWVbkACaC77ooeA2pxjrvKlsbDmOXCJXah?=
 =?iso-8859-1?Q?F6bYzm7TNn/EixX10uD/h7zhYPQ8LX8bam6Zo/qshQFqzMiMEbc5cJrrXv?=
 =?iso-8859-1?Q?5nTqbq5/VpHGesQJUOAftDKm/W7t/tSHlZgoFWs/233sHGmRLD/SmumBvu?=
 =?iso-8859-1?Q?J2V7O7IWkekNKubRKDOSWBELqfo+oT8MsqRWhMAnCGfLjRltHENdoQTQKm?=
 =?iso-8859-1?Q?6CzbegTvpphlT6RKdxhDDdh5iDtUTI6lvPFme3Vu1p/CxOQTzA4/atyrME?=
 =?iso-8859-1?Q?HiTvw93afPd7Alr71T13panynrY79Rf3CgHYmFjymLKb5N+bIvom6OTOZc?=
 =?iso-8859-1?Q?fbm+RVFoOHndQ+ezTvwwH/ELwLCcAIpm6ToESflzkb9bowSUYBwpHDVrcq?=
 =?iso-8859-1?Q?hJcu8UXoO+3yhAMwrnFJL7VIZZOlCBadlewdsDJIgmUDAKEXLu085OlY1N?=
 =?iso-8859-1?Q?g8yHBdTekUrmxh8HHRiGcFlVhep0SymWEs1zU5vyrGmuXG8zs33VpoTVm7?=
 =?iso-8859-1?Q?goVKPP14d3J6taojTvi2ANQtEl6JhPD5GBhJKcBXzz9bjZ63KYyoXrgg3o?=
 =?iso-8859-1?Q?g1p47y3lXIm0ExTCY+BhRUNtOZIJHoJ2/HFONLJj9IIe471V7T219iHi0S?=
 =?iso-8859-1?Q?zJFjWQ+RuKcDT9p7Mpv4vUVJMK5AGFfTt/Yj8LimqBTrvE16MU1O5CIyTs?=
 =?iso-8859-1?Q?3xG4BZtVa0LtLF57SLo6vAQlde5o8QCzdM/omt5eSIRZkGzJY390bCV80r?=
 =?iso-8859-1?Q?aQFsubWHk9yxZAQ4dkTmd1tKJU7AKeaId31mBeXH7wt5pfsXgndjzt46hH?=
 =?iso-8859-1?Q?TzuLrnM10mGKwHh/Ga9gskBYqGO0xjHO9y1MCVzxfiuvyjQlB043cuq79A?=
 =?iso-8859-1?Q?Rl4boTne7zscC2sXkGy7ouTTKhpfduqWQSmjAm7zVf8DL6nQFwYQ6H1Y+P?=
 =?iso-8859-1?Q?bH2DAVF8zsBVc3qJmVEC104gTLggnhqhuwJ54dPGS1tHJxxkXF/O0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?c4cWNUg+fXaWnVmGRPZOe5eVs/2pUAinfdtOblfImmeanszzThLqpXiNiG?=
 =?iso-8859-1?Q?U1EdzqsnCpHbjx9/6WadWEgxORBx3nsoXt6BaIVUan6DVoDC0Skpe7g7wp?=
 =?iso-8859-1?Q?qkB78X5kckom75ew4+ltJhQAVzYfZ4VO0wGgDopPlWYIxaRsO6ByqiPI0o?=
 =?iso-8859-1?Q?XC0PXB/1Ce+E1oGsOb3JO7Xrtus5koNOw2D6HxRtLUG+kClUiRAK2x8MPT?=
 =?iso-8859-1?Q?WI5wnPMmYNAZt3O1sSgaYrwJM6WUMfAgeJwSJNab8QoAnFWcsQrMINI7Nr?=
 =?iso-8859-1?Q?FkTcp8bzwuvhXRkAwzgOYBunW7hybboLjgW0+q0kRuRpYaoiVTHkbxP+ml?=
 =?iso-8859-1?Q?06aVg5vIGG8ERsDgBmmDh2p8KDmp066ACfRNT1FhHJL8sd4YWK7I8Cgt6R?=
 =?iso-8859-1?Q?hranTEhtiVxWEleDy4ti/PDDlr0n+KIiqMn35bS16Yr7HTZ2PfSukE5Nmd?=
 =?iso-8859-1?Q?V8yQA7Bum+nV86/L8JRREnNX1K/4K/LEsvdJgCAgboq30DOC8jdaKawMW3?=
 =?iso-8859-1?Q?lGmlxt6KRBsaSkYV35l4w9w33oQYQ0tOaNWIgWzFw7NZHRDP14mjy4979J?=
 =?iso-8859-1?Q?tKbAoYBPagUay2e1taqLCZbT2EIj7qaQR8kh3XAYzUAVimEwbfs94KXgei?=
 =?iso-8859-1?Q?MnmdwX+QBakOJlgGuThdRNljxmNGT1vIUMtAXBh6bAbLJoUWI1N5uV2fFL?=
 =?iso-8859-1?Q?QQgCFBQmKCDu3HzzlFxQsz2RZKVnyJYOBaC6YqU15DWqYKJ7q1pJsTpmCz?=
 =?iso-8859-1?Q?PKt/UxhMzF0oT+RjH+50U03o6wT4yVZSrRiq4zjHQnaQWWa+6fTm2wVjcS?=
 =?iso-8859-1?Q?0zyR7+vLGH5vBFsOr2G+6Iidt23iLBqsazFiuTL/ZyFxDTbo5wuRAwPDFT?=
 =?iso-8859-1?Q?2sSBiDbvhl68rDh7142GFGQLRHzMTRqfyGIGOsQrNaGHYgsN8d6jICYLe6?=
 =?iso-8859-1?Q?sAJASQLnaU4AmRYFkfIDrHPH5zaPZDWGyU3C0wQGxF/B+uIiLoMwzJ7VOB?=
 =?iso-8859-1?Q?+zY+UsZEgfh4s6608E4XGbM+Blupgmr7vMRoU97cZ0/m2XMVpg7Qw+nKJC?=
 =?iso-8859-1?Q?gAa9qcYulEkWXciASRgzI6oDUOSl1WtEmnQeg1zokBY0BVf493XIPqfYLc?=
 =?iso-8859-1?Q?vaMzq44z0Mj8QyaeHygHfn0N66uFastswECtrGIwM+7sjmUvOzh8Yyfg6N?=
 =?iso-8859-1?Q?FGgJWbn74OCxudMIJ7CX93ASP93pt4pPMjcPks4V5FoBgfrsvcT7FTQmbJ?=
 =?iso-8859-1?Q?jDUD2RI0S+L1GZdfFluiftWRzat5JJMS8z3LOm6TG3Wa6CBMqVuzWuVwQd?=
 =?iso-8859-1?Q?hfG+N8wrldTYbExDG7oz7nwRYL0H6D317nr+ebXQEMvnSO6z1yur9ze5Bh?=
 =?iso-8859-1?Q?D8JJyZjgGWMBY60pTL6rbfwKqIEewfPp/1nFK5iRBKjqkz114EPNxaHHhS?=
 =?iso-8859-1?Q?K+FPR+vAVljjVHdVw5rQR7LgZulYZm3eqAf1Bpk/NJo6M7YCllrAxkUptu?=
 =?iso-8859-1?Q?ZPk/InOUKF121TRsLZQawQChl4V5TT6JdoOMfQC5l5eYus9L1M4UnBzBYH?=
 =?iso-8859-1?Q?GzkPzVfoRZ8129G58x9AXdAm+wqZtz8o90O08Ksj+mW0Ec5cXo8e39xino?=
 =?iso-8859-1?Q?WqgKxwBe5O8VRQnSw0nJuZp+YBnz40ZF7OOPERAr17epC4gFvS4jg49Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cd1e87e-e04a-4afb-3a1d-08dcc8c5ce63
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 07:31:48.1989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vCmhDxjMV5IuWLc74Uz54iIXhNtC6xTi8y3gpv4mLT0PKR60pUt/wtCoc0m5n3hYbFuckYTuOkYBVo7Iaoo9XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4934
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 41.4% improvement of stress-ng.race-sched.ops_per_sec on:


commit: 1e116c18e32b035a2d1bd460800072c8bf96bc44 ("Revert "sched/fair: Make sure to try to detach at least one movable task"")
https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next

testcase: stress-ng
test machine: 256 threads 4 sockets INTEL(R) XEON(R) PLATINUM 8592+ (Emerald Rapids) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: race-sched
	cpufreq_governor: performance






Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240830/202408301502.6e7c0136-oliver.sang@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-12/performance/x86_64-oc_stream_base_config/100%/debian-12-x86_64-20240206.cgz/lkp-emr-2sp1/race-sched/stress-ng/60s

commit: 
  87f3ceb2b1 ("cifs: fix setting SecurityFlags to true")
  1e116c18e3 ("Revert "sched/fair: Make sure to try to detach at least one movable task"")

87f3ceb2b143141f 1e116c18e32b035a2d1bd460800 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
   7226784 ±  3%     +21.8%    8798664        cpuidle..usage
   1742467           +10.9%    1932244        meminfo.Shmem
     37160 ± 20%    +609.6%     263696 ±174%  numa-meminfo.node3.Mapped
      9370 ± 21%    +613.8%      66890 ±174%  numa-vmstat.node3.nr_mapped
      0.06 ± 16%      -0.0        0.02 ±  4%  mpstat.cpu.all.soft%
      0.36 ±  2%      +0.1        0.44 ±  4%  mpstat.cpu.all.usr%
    148602 ±  5%     +42.5%     211781 ±  2%  vmstat.system.cs
    134630 ±  2%     +18.9%     160041 ±  2%  vmstat.system.in
     17602 ±  3%     +29.1%      22731 ±  7%  perf-c2c.DRAM.remote
      2837 ±  7%     -29.4%       2002 ±  7%  perf-c2c.HITM.local
      5843 ±  7%     -25.5%       4352 ±  4%  perf-c2c.HITM.remote
      8680 ±  7%     -26.8%       6355 ±  5%  perf-c2c.HITM.total
    231623 ±  4%     +41.4%     327560        stress-ng.race-sched.ops
      3856 ±  4%     +41.4%       5453        stress-ng.race-sched.ops_per_sec
   2998111 ±  5%     +45.2%    4353080        stress-ng.time.involuntary_context_switches
  12390414 ±  5%     +40.2%   17374973 ±  2%  stress-ng.time.minor_page_faults
    753.17 ±  2%     +12.7%     849.17        stress-ng.time.percent_of_cpu_this_job_got
     81.61 ±  7%     +58.5%     129.34        stress-ng.time.user_time
   1229534 ±  5%     +51.0%    1856000        stress-ng.time.voluntary_context_switches
    610364            +8.6%     662783        proc-vmstat.nr_active_anon
    176928            +2.5%     181299        proc-vmstat.nr_anon_pages
   1259844            +3.8%    1307937        proc-vmstat.nr_file_pages
     54323            +3.1%      56022        proc-vmstat.nr_kernel_stack
    345571            +3.9%     358899        proc-vmstat.nr_mapped
    435715           +11.0%     483743        proc-vmstat.nr_shmem
    153025            +2.1%     156305        proc-vmstat.nr_slab_unreclaimable
    610364            +8.6%     662783        proc-vmstat.nr_zone_active_anon
  11315757 ±  5%     +37.0%   15505931 ±  3%  proc-vmstat.numa_hit
  10912836 ±  5%     +38.3%   15089274 ±  3%  proc-vmstat.numa_local
  12078888 ±  5%     +37.1%   16561591 ±  3%  proc-vmstat.pgalloc_normal
  13081529 ±  5%     +38.6%   18128529 ±  2%  proc-vmstat.pgfault
  11827118 ±  5%     +37.3%   16234947 ±  3%  proc-vmstat.pgfree
   1512941 ±  4%     +45.0%    2193603 ±  5%  proc-vmstat.pgreuse
    313.33 ± 46%    +196.5%     928.95 ± 47%  sched_debug.cfs_rq:/.left_vruntime.avg
      3564 ± 25%    +139.6%       8540 ± 54%  sched_debug.cfs_rq:/.left_vruntime.stddev
    313.33 ± 46%    +196.5%     928.95 ± 47%  sched_debug.cfs_rq:/.right_vruntime.avg
      3564 ± 25%    +139.6%       8540 ± 54%  sched_debug.cfs_rq:/.right_vruntime.stddev
   1147279 ± 30%     -75.9%     277046 ± 29%  sched_debug.cpu.avg_idle.avg
   3509751 ± 13%     -88.8%     392654 ± 31%  sched_debug.cpu.avg_idle.max
    680622 ± 24%     -91.4%      58631 ± 30%  sched_debug.cpu.avg_idle.stddev
    547.51 ± 29%    +117.2%       1189 ± 28%  sched_debug.cpu.curr->pid.avg
      4198 ± 18%     +74.4%       7321 ± 14%  sched_debug.cpu.curr->pid.stddev
   1677456 ± 19%     -90.9%     153335 ± 30%  sched_debug.cpu.max_idle_balance_cost.avg
   2415220 ± 20%     -91.7%     200039 ± 30%  sched_debug.cpu.max_idle_balance_cost.max
   1147108 ± 15%     -86.7%     152777 ± 30%  sched_debug.cpu.max_idle_balance_cost.min
    224073 ± 28%     -98.2%       4143 ± 56%  sched_debug.cpu.max_idle_balance_cost.stddev
      1155 ± 26%     +61.4%       1864 ± 24%  sched_debug.cpu.nr_switches.min
      9.74           +32.3%      12.89        perf-stat.i.MPKI
 4.644e+09           +30.3%   6.05e+09        perf-stat.i.branch-instructions
  77975002           +31.5%  1.025e+08        perf-stat.i.branch-misses
     49.37            -2.1       47.31        perf-stat.i.cache-miss-rate%
 2.174e+08           +83.8%  3.997e+08        perf-stat.i.cache-misses
 4.402e+08           +91.4%  8.426e+08        perf-stat.i.cache-references
    155602 ±  4%     +44.0%     224035        perf-stat.i.context-switches
      3.00 ±  6%     -50.2%       1.49        perf-stat.i.cpi
 6.721e+10 ±  6%     -31.0%  4.639e+10        perf-stat.i.cpu-cycles
     43158 ±  4%     +45.6%      62828        perf-stat.i.cpu-migrations
    311.67 ±  7%     -62.2%     117.93        perf-stat.i.cycles-between-cache-misses
 2.284e+10           +36.9%  3.126e+10        perf-stat.i.instructions
      0.37 ±  6%     +86.2%       0.68        perf-stat.i.ipc
      1.13 ± 12%     +59.8%       1.80 ± 14%  perf-stat.i.major-faults
      0.15 ± 78%   +1291.8%       2.13 ±  4%  perf-stat.i.metric.K/sec
    207599 ±  4%     +40.1%     290888 ±  2%  perf-stat.i.minor-faults
    207600 ±  4%     +40.1%     290890 ±  2%  perf-stat.i.page-faults
     45.02 ± 25%     -40.8        4.20 ±  2%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.raw_spin_rq_lock_nested.load_balance.newidle_balance
     24.98 ± 24%     -23.2        1.76        perf-profile.calltrace.cycles-pp._raw_spin_lock.raw_spin_rq_lock_nested.load_balance.newidle_balance.pick_next_task_fair
     24.98 ± 24%     -23.2        1.76        perf-profile.calltrace.cycles-pp.raw_spin_rq_lock_nested.load_balance.newidle_balance.pick_next_task_fair.pick_next_task
     20.04 ± 27%     -17.6        2.44 ±  2%  perf-profile.calltrace.cycles-pp._raw_spin_lock.raw_spin_rq_lock_nested.load_balance.newidle_balance.balance_fair
     20.05 ± 27%     -17.6        2.45 ±  2%  perf-profile.calltrace.cycles-pp.raw_spin_rq_lock_nested.load_balance.newidle_balance.balance_fair.put_prev_task_balance
     28.89 ± 20%     -17.6       11.34        perf-profile.calltrace.cycles-pp.load_balance.newidle_balance.pick_next_task_fair.pick_next_task.__schedule
     21.70 ± 19%     -13.4        8.32        perf-profile.calltrace.cycles-pp.newidle_balance.pick_next_task_fair.pick_next_task.__schedule.schedule_idle
     21.80 ± 18%     -13.3        8.52        perf-profile.calltrace.cycles-pp.pick_next_task_fair.pick_next_task.__schedule.schedule_idle.do_idle
     21.83 ± 18%     -13.3        8.55        perf-profile.calltrace.cycles-pp.pick_next_task.__schedule.schedule_idle.do_idle.cpu_startup_entry
     22.61 ± 18%     -13.2        9.42        perf-profile.calltrace.cycles-pp.__schedule.schedule_idle.do_idle.cpu_startup_entry.start_secondary
     22.63 ± 18%     -13.2        9.46        perf-profile.calltrace.cycles-pp.schedule_idle.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     26.88 ±  9%      -9.8       17.12        perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     26.93 ±  9%      -9.7       17.22        perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     26.94 ±  9%      -9.7       17.22        perf-profile.calltrace.cycles-pp.start_secondary.secondary_startup_64_no_verify
     27.44 ±  9%      -9.6       17.86        perf-profile.calltrace.cycles-pp.secondary_startup_64_no_verify
      5.33 ± 21%      -2.8        2.48        perf-profile.calltrace.cycles-pp.newidle_balance.pick_next_task_fair.pick_next_task.__schedule.schedule
      3.15 ± 23%      -2.3        0.87        perf-profile.calltrace.cycles-pp.pick_next_task_fair.pick_next_task.__schedule.schedule.worker_thread
      3.15 ± 23%      -2.3        0.87        perf-profile.calltrace.cycles-pp.pick_next_task.__schedule.schedule.worker_thread.kthread
      3.16 ± 23%      -2.3        0.90        perf-profile.calltrace.cycles-pp.__schedule.schedule.worker_thread.kthread.ret_from_fork
      3.16 ± 23%      -2.3        0.90        perf-profile.calltrace.cycles-pp.schedule.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      3.30 ± 20%      -2.1        1.16        perf-profile.calltrace.cycles-pp.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      5.33 ± 10%      -1.5        3.88        perf-profile.calltrace.cycles-pp._raw_spin_lock.raw_spin_rq_lock_nested.task_rq_lock.__set_cpus_allowed_ptr.__sched_setaffinity
      5.33 ± 10%      -1.5        3.88        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.raw_spin_rq_lock_nested.task_rq_lock.__set_cpus_allowed_ptr
      5.33 ± 10%      -1.4        3.88        perf-profile.calltrace.cycles-pp.raw_spin_rq_lock_nested.task_rq_lock.__set_cpus_allowed_ptr.__sched_setaffinity.sched_setaffinity
      2.04 ± 22%      -1.0        0.99        perf-profile.calltrace.cycles-pp.newidle_balance.pick_next_task_fair.pick_next_task.__schedule.do_task_dead
      2.04 ± 21%      -1.0        1.00        perf-profile.calltrace.cycles-pp.pick_next_task_fair.pick_next_task.__schedule.do_task_dead.do_exit
      2.04 ± 21%      -1.0        1.00        perf-profile.calltrace.cycles-pp.pick_next_task.__schedule.do_task_dead.do_exit.do_group_exit
      2.08 ± 21%      -1.0        1.06        perf-profile.calltrace.cycles-pp.__schedule.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group
      2.08 ± 21%      -1.0        1.07        perf-profile.calltrace.cycles-pp.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
      1.50 ± 13%      -0.6        0.89        perf-profile.calltrace.cycles-pp.tlb_finish_mmu.exit_mmap.__mmput.mmput.exit_mm
      1.73 ± 10%      -0.6        1.15 ±  2%  perf-profile.calltrace.cycles-pp._raw_spin_lock.raw_spin_rq_lock_nested.task_rq_lock.__sched_setscheduler._sched_setscheduler
      1.73 ± 10%      -0.6        1.15 ±  2%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.raw_spin_rq_lock_nested.task_rq_lock.__sched_setscheduler
      1.73 ± 10%      -0.6        1.15 ±  2%  perf-profile.calltrace.cycles-pp.raw_spin_rq_lock_nested.task_rq_lock.__sched_setscheduler._sched_setscheduler.do_sched_setscheduler
      1.81 ±  9%      -0.5        1.33 ±  2%  perf-profile.calltrace.cycles-pp.task_rq_lock.__sched_setscheduler._sched_setscheduler.do_sched_setscheduler.__x64_sys_sched_setscheduler
      1.24 ± 10%      -0.5        0.79        perf-profile.calltrace.cycles-pp._raw_spin_lock.raw_spin_rq_lock_nested.move_queued_task.affine_move_task.__set_cpus_allowed_ptr_locked
      1.24 ± 10%      -0.5        0.79        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.raw_spin_rq_lock_nested.move_queued_task.affine_move_task
      1.24 ± 10%      -0.5        0.79        perf-profile.calltrace.cycles-pp.raw_spin_rq_lock_nested.move_queued_task.affine_move_task.__set_cpus_allowed_ptr_locked.__set_cpus_allowed_ptr
      1.66 ±  8%      -0.4        1.28        perf-profile.calltrace.cycles-pp.detach_tasks.load_balance.newidle_balance.pick_next_task_fair.pick_next_task
      1.10 ±  8%      -0.3        0.78        perf-profile.calltrace.cycles-pp._raw_spin_lock.raw_spin_rq_lock_nested.move_queued_task.migration_cpu_stop.cpu_stopper_thread
      1.10 ±  8%      -0.3        0.78        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.raw_spin_rq_lock_nested.move_queued_task.migration_cpu_stop
      1.10 ±  8%      -0.3        0.78        perf-profile.calltrace.cycles-pp.raw_spin_rq_lock_nested.move_queued_task.migration_cpu_stop.cpu_stopper_thread.smpboot_thread_fn
      0.39 ± 70%      +0.2        0.64 ±  4%  perf-profile.calltrace.cycles-pp.arch_call_rest_init.start_kernel.x86_64_start_reservations.x86_64_start_kernel.secondary_startup_64_no_verify
      0.39 ± 70%      +0.2        0.64 ±  4%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.rest_init.arch_call_rest_init.start_kernel.x86_64_start_reservations
      0.39 ± 70%      +0.2        0.64 ±  4%  perf-profile.calltrace.cycles-pp.rest_init.arch_call_rest_init.start_kernel.x86_64_start_reservations.x86_64_start_kernel
      0.39 ± 70%      +0.2        0.64 ±  4%  perf-profile.calltrace.cycles-pp.start_kernel.x86_64_start_reservations.x86_64_start_kernel.secondary_startup_64_no_verify
      0.39 ± 70%      +0.2        0.64 ±  4%  perf-profile.calltrace.cycles-pp.x86_64_start_kernel.secondary_startup_64_no_verify
      0.39 ± 70%      +0.2        0.64 ±  4%  perf-profile.calltrace.cycles-pp.x86_64_start_reservations.x86_64_start_kernel.secondary_startup_64_no_verify
      0.39 ± 70%      +0.2        0.64 ±  3%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.rest_init.arch_call_rest_init.start_kernel
      0.52 ± 49%      +0.4        0.87        perf-profile.calltrace.cycles-pp.__cond_resched.__wait_for_common.wait_for_completion.affine_move_task.__set_cpus_allowed_ptr_locked
      1.01 ± 19%      +0.4        1.39 ±  2%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.sched_getaffinity
      1.03 ± 19%      +0.4        1.43 ±  2%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.sched_getaffinity
      0.43 ± 73%      +0.4        0.86        perf-profile.calltrace.cycles-pp.__schedule.__cond_resched.__wait_for_common.wait_for_completion.affine_move_task
      0.08 ±223%      +0.5        0.55        perf-profile.calltrace.cycles-pp.kfree.sched_setaffinity.__x64_sys_sched_setaffinity.x64_sys_call.do_syscall_64
      0.08 ±223%      +0.5        0.55        perf-profile.calltrace.cycles-pp.stop_one_cpu_nowait.affine_move_task.__set_cpus_allowed_ptr_locked.__set_cpus_allowed_ptr.__sched_setaffinity
      0.09 ±223%      +0.5        0.56        perf-profile.calltrace.cycles-pp.mas_commit_b_node.mas_wr_bnode.mas_wr_store_entry.mas_store.dup_mmap
      0.08 ±223%      +0.5        0.56        perf-profile.calltrace.cycles-pp.__alloc_percpu_gfp.__percpu_counter_init_many.mm_init.dup_mm.copy_process
      1.79 ± 11%      +0.5        2.27        perf-profile.calltrace.cycles-pp.move_queued_task.migration_cpu_stop.cpu_stopper_thread.smpboot_thread_fn.kthread
      0.09 ±223%      +0.5        0.58 ±  2%  perf-profile.calltrace.cycles-pp.__alloc_percpu.mm_init.dup_mm.copy_process.kernel_clone
      0.09 ±223%      +0.5        0.60        perf-profile.calltrace.cycles-pp.__percpu_counter_init_many.mm_init.dup_mm.copy_process.kernel_clone
      0.09 ±223%      +0.5        0.61        perf-profile.calltrace.cycles-pp.mas_wr_bnode.mas_wr_store_entry.mas_store.dup_mmap.dup_mm
      0.00            +0.5        0.53        perf-profile.calltrace.cycles-pp.cpuidle_select.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
      0.09 ±223%      +0.5        0.62 ±  7%  perf-profile.calltrace.cycles-pp.page_remove_rmap.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_single_vma
      0.10 ±223%      +0.5        0.64 ±  2%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.sched_setaffinity
      0.19 ±142%      +0.5        0.73 ± 11%  perf-profile.calltrace.cycles-pp._compound_head.zap_pmd_range.unmap_page_range.unmap_single_vma.unmap_vmas
      0.00            +0.5        0.54        perf-profile.calltrace.cycles-pp.mas_split.mas_commit_b_node.mas_wr_bnode.mas_wr_store_entry.mas_store
      0.00            +0.5        0.54        perf-profile.calltrace.cycles-pp.update_process_times.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt
      0.00            +0.5        0.54        perf-profile.calltrace.cycles-pp.free_pages_and_swap_cache.tlb_batch_pages_flush.tlb_finish_mmu.exit_mmap.__mmput
      0.09 ±223%      +0.5        0.63        perf-profile.calltrace.cycles-pp.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      0.20 ±144%      +0.5        0.74 ±  2%  perf-profile.calltrace.cycles-pp.next_uptodate_folio.filemap_map_pages.do_read_fault.do_fault.handle_pte_fault
      0.10 ±223%      +0.5        0.65 ±  2%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.sched_setaffinity
      0.08 ±223%      +0.5        0.63 ±  2%  perf-profile.calltrace.cycles-pp.enqueue_task_fair.enqueue_task.move_queued_task.migration_cpu_stop.cpu_stopper_thread
      0.00            +0.5        0.55        perf-profile.calltrace.cycles-pp.dequeue_entity.dequeue_task_fair.__do_set_cpus_allowed.__set_cpus_allowed_ptr_locked.__set_cpus_allowed_ptr
      2.39 ± 10%      +0.5        2.94        perf-profile.calltrace.cycles-pp.migration_cpu_stop.cpu_stopper_thread.smpboot_thread_fn.kthread.ret_from_fork
      0.10 ±223%      +0.6        0.65        perf-profile.calltrace.cycles-pp.kmem_cache_alloc.anon_vma_clone.anon_vma_fork.dup_mmap.dup_mm
      0.00            +0.6        0.56 ±  3%  perf-profile.calltrace.cycles-pp.up_write.dup_mm.copy_process.kernel_clone.__do_sys_clone
      0.10 ±223%      +0.6        0.67 ±  2%  perf-profile.calltrace.cycles-pp.stress_race_sched_exercise
      0.00            +0.6        0.57        perf-profile.calltrace.cycles-pp.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt
      0.00            +0.6        0.57 ±  2%  perf-profile.calltrace.cycles-pp.enqueue_task_fair.__do_set_cpus_allowed.__set_cpus_allowed_ptr_locked.__set_cpus_allowed_ptr.__sched_setaffinity
      0.00            +0.6        0.57        perf-profile.calltrace.cycles-pp._find_next_and_bit.update_sd_lb_stats.find_busiest_group.load_balance.newidle_balance
      2.44 ± 10%      +0.6        3.02        perf-profile.calltrace.cycles-pp.cpu_stopper_thread.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.00            +0.6        0.59        perf-profile.calltrace.cycles-pp.enqueue_entity.enqueue_task_fair.enqueue_task.move_queued_task.affine_move_task
      1.23 ± 22%      +0.6        1.82        perf-profile.calltrace.cycles-pp.sched_getaffinity
      2.12 ± 11%      +0.6        2.71        perf-profile.calltrace.cycles-pp.move_queued_task.affine_move_task.__set_cpus_allowed_ptr_locked.__set_cpus_allowed_ptr.__sched_setaffinity
      0.10 ±223%      +0.6        0.69        perf-profile.calltrace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      1.66 ±  5%      +0.6        2.26 ±  2%  perf-profile.calltrace.cycles-pp.detach_tasks.load_balance.newidle_balance.balance_fair.put_prev_task_balance
      0.21 ±144%      +0.6        0.83        perf-profile.calltrace.cycles-pp.kmem_cache_alloc.vm_area_dup.dup_mmap.dup_mm.copy_process
      0.10 ±223%      +0.6        0.74        perf-profile.calltrace.cycles-pp.update_rq_clock.__set_cpus_allowed_ptr_locked.__set_cpus_allowed_ptr.__sched_setaffinity.sched_setaffinity
      0.10 ±223%      +0.6        0.74        perf-profile.calltrace.cycles-pp.enqueue_task_fair.enqueue_task.move_queued_task.affine_move_task.__set_cpus_allowed_ptr_locked
      0.00            +0.7        0.65 ±  5%  perf-profile.calltrace.cycles-pp.find_busiest_queue.load_balance.newidle_balance.balance_fair.put_prev_task_balance
      0.76 ± 36%      +0.7        1.43 ±  2%  perf-profile.calltrace.cycles-pp.mm_init.dup_mm.copy_process.kernel_clone.__do_sys_clone
      0.22 ±145%      +0.7        0.90        perf-profile.calltrace.cycles-pp.mas_store.dup_mmap.dup_mm.copy_process.kernel_clone
      0.12 ±223%      +0.7        0.79        perf-profile.calltrace.cycles-pp.tlb_batch_pages_flush.tlb_finish_mmu.exit_mmap.__mmput.mmput
      0.12 ±223%      +0.7        0.80        perf-profile.calltrace.cycles-pp.mas_wr_store_entry.mas_store.dup_mmap.dup_mm.copy_process
      0.33 ±105%      +0.7        1.03        perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
      0.11 ±223%      +0.7        0.82 ±  2%  perf-profile.calltrace.cycles-pp.enqueue_task.move_queued_task.migration_cpu_stop.cpu_stopper_thread.smpboot_thread_fn
      0.64 ± 59%      +0.7        1.34 ±  3%  perf-profile.calltrace.cycles-pp.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.34 ±105%      +0.7        1.06        perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
      0.36 ±106%      +0.7        1.09        perf-profile.calltrace.cycles-pp.__slab_free.kmem_cache_free.unlink_anon_vmas.free_pgtables.exit_mmap
      1.01 ± 28%      +0.7        1.76        perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpuidle_idle_call
      1.01 ± 29%      +0.7        1.75        perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.call_cpuidle
      0.12 ±223%      +0.8        0.87        perf-profile.calltrace.cycles-pp.dequeue_task_fair.__do_set_cpus_allowed.__set_cpus_allowed_ptr_locked.__set_cpus_allowed_ptr.__sched_setaffinity
      0.69 ± 59%      +0.8        1.45 ±  3%  perf-profile.calltrace.cycles-pp.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.23 ±146%      +0.8        0.99        perf-profile.calltrace.cycles-pp.enqueue_task.move_queued_task.affine_move_task.__set_cpus_allowed_ptr_locked.__set_cpus_allowed_ptr
      0.81 ± 40%      +0.8        1.58 ±  4%  perf-profile.calltrace.cycles-pp.copy_pte_range.copy_p4d_range.copy_page_range.dup_mmap.dup_mm
      0.54 ± 81%      +0.8        1.31 ±  2%  perf-profile.calltrace.cycles-pp.handle_pte_fault.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault
      0.42 ±105%      +0.8        1.20 ±  2%  perf-profile.calltrace.cycles-pp.filemap_map_pages.do_read_fault.do_fault.handle_pte_fault.__handle_mm_fault
      0.38 ±106%      +0.8        1.17        perf-profile.calltrace.cycles-pp.kmem_cache_free.__vm_area_free.remove_vma.exit_mmap.__mmput
      0.37 ±107%      +0.8        1.17        perf-profile.calltrace.cycles-pp.__anon_vma_interval_tree_remove.anon_vma_interval_tree_remove.unlink_anon_vmas.free_pgtables.exit_mmap
      0.40 ±107%      +0.8        1.21        perf-profile.calltrace.cycles-pp.vm_area_dup.dup_mmap.dup_mm.copy_process.kernel_clone
      0.43 ±105%      +0.8        1.24 ±  2%  perf-profile.calltrace.cycles-pp.do_read_fault.do_fault.handle_pte_fault.__handle_mm_fault.handle_mm_fault
      0.38 ±107%      +0.8        1.18        perf-profile.calltrace.cycles-pp.anon_vma_interval_tree_remove.unlink_anon_vmas.free_pgtables.exit_mmap.__mmput
      0.43 ±105%      +0.8        1.24 ±  2%  perf-profile.calltrace.cycles-pp.do_fault.handle_pte_fault.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      0.00            +0.8        0.82        perf-profile.calltrace.cycles-pp._raw_spin_lock.task_rq_lock.__set_cpus_allowed_ptr.__sched_setaffinity.sched_setaffinity
      0.93 ± 38%      +0.8        1.76 ±  2%  perf-profile.calltrace.cycles-pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.39 ±106%      +0.8        1.22        perf-profile.calltrace.cycles-pp.__vm_area_free.remove_vma.exit_mmap.__mmput.mmput
      0.67 ± 60%      +0.8        1.50        perf-profile.calltrace.cycles-pp.kmem_cache_free.unlink_anon_vmas.free_pgtables.exit_mmap.__mmput
      0.69 ± 59%      +0.8        1.53 ±  3%  perf-profile.calltrace.cycles-pp.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_single_vma.unmap_vmas
      0.41 ±106%      +0.9        1.27        perf-profile.calltrace.cycles-pp.remove_vma.exit_mmap.__mmput.mmput.exit_mm
      0.96 ± 39%      +0.9        1.87 ±  4%  perf-profile.calltrace.cycles-pp.copy_p4d_range.copy_page_range.dup_mmap.dup_mm.copy_process
      1.00 ± 38%      +0.9        1.92 ±  2%  perf-profile.calltrace.cycles-pp.exc_page_fault.asm_exc_page_fault
      1.01 ± 38%      +0.9        1.94 ±  2%  perf-profile.calltrace.cycles-pp.asm_exc_page_fault
      0.99 ± 39%      +0.9        1.93 ±  3%  perf-profile.calltrace.cycles-pp.copy_page_range.dup_mmap.dup_mm.copy_process.kernel_clone
      0.68 ± 57%      +1.0        1.73        perf-profile.calltrace.cycles-pp.__do_set_cpus_allowed.__set_cpus_allowed_ptr_locked.__set_cpus_allowed_ptr.__sched_setaffinity.sched_setaffinity
      1.26 ± 32%      +1.1        2.40        perf-profile.calltrace.cycles-pp.intel_idle_xstate.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpuidle_idle_call
      6.20 ±  2%      +1.2        7.40        perf-profile.calltrace.cycles-pp.affine_move_task.__set_cpus_allowed_ptr_locked.__set_cpus_allowed_ptr.__sched_setaffinity.sched_setaffinity
      1.27 ± 39%      +1.2        2.51 ±  5%  perf-profile.calltrace.cycles-pp.zap_pmd_range.unmap_page_range.unmap_single_vma.unmap_vmas.exit_mmap
      1.33 ± 39%      +1.3        2.63 ±  4%  perf-profile.calltrace.cycles-pp.unmap_page_range.unmap_single_vma.unmap_vmas.exit_mmap.__mmput
      1.36 ± 39%      +1.3        2.70 ±  4%  perf-profile.calltrace.cycles-pp.unmap_single_vma.unmap_vmas.exit_mmap.__mmput.mmput
      1.44 ± 39%      +1.4        2.85 ±  4%  perf-profile.calltrace.cycles-pp.unmap_vmas.exit_mmap.__mmput.mmput.exit_mm
      0.00            +1.7        1.66        perf-profile.calltrace.cycles-pp.cpu_util.update_sg_lb_stats.update_sd_lb_stats.find_busiest_group.load_balance
      1.70 ± 40%      +1.8        3.50        perf-profile.calltrace.cycles-pp.unlink_anon_vmas.free_pgtables.exit_mmap.__mmput.mmput
     13.85 ±  5%      +1.9       15.71        perf-profile.calltrace.cycles-pp.__set_cpus_allowed_ptr.__sched_setaffinity.sched_setaffinity.__x64_sys_sched_setaffinity.x64_sys_call
      1.87 ± 40%      +2.0        3.91        perf-profile.calltrace.cycles-pp.anon_vma_interval_tree_insert.anon_vma_clone.anon_vma_fork.dup_mmap.dup_mm
      2.53 ± 31%      +2.1        4.61        perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpuidle_idle_call.do_idle
      2.26 ± 40%      +2.4        4.67        perf-profile.calltrace.cycles-pp.free_pgtables.exit_mmap.__mmput.mmput.exit_mm
      3.22 ± 32%      +2.6        5.79        perf-profile.calltrace.cycles-pp.cpuidle_enter.call_cpuidle.cpuidle_idle_call.do_idle.cpu_startup_entry
      3.22 ± 32%      +2.6        5.80        perf-profile.calltrace.cycles-pp.call_cpuidle.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
      7.57 ±  7%      +2.7       10.23        perf-profile.calltrace.cycles-pp.__set_cpus_allowed_ptr_locked.__set_cpus_allowed_ptr.__sched_setaffinity.sched_setaffinity.__x64_sys_sched_setaffinity
      2.66 ± 39%      +2.9        5.52        perf-profile.calltrace.cycles-pp.anon_vma_clone.anon_vma_fork.dup_mmap.dup_mm.copy_process
      3.80 ± 33%      +3.1        6.90        perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
      8.65 ± 16%      +3.4       12.09        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
      8.65 ± 16%      +3.4       12.09        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
      8.64 ± 16%      +3.4       12.08        perf-profile.calltrace.cycles-pp.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe
      8.59 ± 16%      +3.4       12.04        perf-profile.calltrace.cycles-pp.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call.do_syscall_64
      8.60 ± 16%      +3.4       12.05        perf-profile.calltrace.cycles-pp.__x64_sys_exit_group.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe
      8.60 ± 16%      +3.4       12.05        perf-profile.calltrace.cycles-pp.do_group_exit.__x64_sys_exit_group.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.20 ± 40%      +3.5        6.70        perf-profile.calltrace.cycles-pp.anon_vma_fork.dup_mmap.dup_mm.copy_process.kernel_clone
     15.26 ±  8%      +3.5       18.78        perf-profile.calltrace.cycles-pp.__sched_setaffinity.sched_setaffinity.__x64_sys_sched_setaffinity.x64_sys_call.do_syscall_64
      1.02 ± 15%      +4.2        5.20        perf-profile.calltrace.cycles-pp.update_sd_lb_stats.find_busiest_group.load_balance.newidle_balance.pick_next_task_fair
      1.04 ± 15%      +4.2        5.25        perf-profile.calltrace.cycles-pp.find_busiest_group.load_balance.newidle_balance.pick_next_task_fair.pick_next_task
      6.25 ± 27%      +4.2       10.48        perf-profile.calltrace.cycles-pp.exit_mmap.__mmput.mmput.exit_mm.do_exit
      6.30 ± 27%      +4.3       10.59        perf-profile.calltrace.cycles-pp.__mmput.mmput.exit_mm.do_exit.do_group_exit
      6.31 ± 27%      +4.3       10.60        perf-profile.calltrace.cycles-pp.mmput.exit_mm.do_exit.do_group_exit.__x64_sys_exit_group
      6.31 ± 27%      +4.3       10.60        perf-profile.calltrace.cycles-pp.exit_mm.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
     16.19 ± 10%      +4.4       20.56        perf-profile.calltrace.cycles-pp.sched_setaffinity.__x64_sys_sched_setaffinity.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe
     16.48 ± 10%      +4.6       21.08        perf-profile.calltrace.cycles-pp.__x64_sys_sched_setaffinity.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe.sched_setaffinity
     16.49 ± 10%      +4.6       21.12        perf-profile.calltrace.cycles-pp.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe.sched_setaffinity
     16.93 ± 11%      +5.0       21.91        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.sched_setaffinity
     16.96 ± 11%      +5.0       21.97        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.sched_setaffinity
     17.24 ± 11%      +5.2       22.49        perf-profile.calltrace.cycles-pp.sched_setaffinity
      1.04 ± 10%      +6.2        7.28        perf-profile.calltrace.cycles-pp.update_sd_lb_stats.find_busiest_group.load_balance.newidle_balance.balance_fair
      1.06 ± 11%      +6.3        7.35        perf-profile.calltrace.cycles-pp.find_busiest_group.load_balance.newidle_balance.balance_fair.put_prev_task_balance
      6.65 ± 36%      +6.3       12.98        perf-profile.calltrace.cycles-pp.dup_mmap.dup_mm.copy_process.kernel_clone.__do_sys_clone
      7.74 ± 36%      +7.3       15.07        perf-profile.calltrace.cycles-pp.dup_mm.copy_process.kernel_clone.__do_sys_clone.__x64_sys_clone
      1.66 ± 12%      +7.6        9.22        perf-profile.calltrace.cycles-pp.update_sg_lb_stats.update_sd_lb_stats.find_busiest_group.load_balance.newidle_balance
      8.31 ± 35%      +7.6       15.90        perf-profile.calltrace.cycles-pp.copy_process.kernel_clone.__do_sys_clone.__x64_sys_clone.x64_sys_call
      8.48 ± 35%      +7.6       16.07        perf-profile.calltrace.cycles-pp.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe._Fork
      8.47 ± 35%      +7.6       16.07        perf-profile.calltrace.cycles-pp.kernel_clone.__do_sys_clone.__x64_sys_clone.x64_sys_call.do_syscall_64
      8.47 ± 35%      +7.6       16.07        perf-profile.calltrace.cycles-pp.__x64_sys_clone.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe._Fork
      8.47 ± 35%      +7.6       16.07        perf-profile.calltrace.cycles-pp.__do_sys_clone.__x64_sys_clone.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe
      8.50 ± 35%      +7.6       16.11        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe._Fork
      8.50 ± 35%      +7.6       16.11        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe._Fork
      8.67 ± 35%      +7.7       16.41        perf-profile.calltrace.cycles-pp._Fork
     57.66 ± 21%     -44.5       13.12        perf-profile.children.cycles-pp.raw_spin_rq_lock_nested
     58.97 ± 20%     -44.3       14.64        perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
     58.91 ± 20%     -43.2       15.68        perf-profile.children.cycles-pp._raw_spin_lock
     53.50 ± 21%     -28.1       25.42        perf-profile.children.cycles-pp.load_balance
     53.02 ± 21%     -27.0       25.99        perf-profile.children.cycles-pp.newidle_balance
     53.43 ± 20%     -26.6       26.84        perf-profile.children.cycles-pp.pick_next_task
     55.96 ± 19%     -25.7       30.25        perf-profile.children.cycles-pp.__schedule
     30.01 ± 19%     -17.2       12.85        perf-profile.children.cycles-pp.pick_next_task_fair
     22.75 ± 18%     -12.9        9.80        perf-profile.children.cycles-pp.schedule_idle
     26.94 ±  9%      -9.7       17.22        perf-profile.children.cycles-pp.start_secondary
     27.38 ±  9%      -9.6       17.77        perf-profile.children.cycles-pp.do_idle
     27.44 ±  9%      -9.6       17.86        perf-profile.children.cycles-pp.secondary_startup_64_no_verify
     27.44 ±  9%      -9.6       17.86        perf-profile.children.cycles-pp.cpu_startup_entry
      3.30 ± 20%      -2.1        1.16        perf-profile.children.cycles-pp.worker_thread
      8.12 ±  9%      -1.4        6.77        perf-profile.children.cycles-pp.task_rq_lock
      1.38 ± 31%      -1.3        0.11 ±  8%  perf-profile.children.cycles-pp.smp_call_function_many_cond
      1.39 ± 31%      -1.3        0.13 ±  6%  perf-profile.children.cycles-pp.native_flush_tlb_multi
      1.39 ± 31%      -1.3        0.13 ±  6%  perf-profile.children.cycles-pp.on_each_cpu_cond_mask
      1.42 ± 29%      -1.2        0.19 ±  6%  perf-profile.children.cycles-pp.flush_tlb_mm_range
      2.10 ± 21%      -1.0        1.07        perf-profile.children.cycles-pp.do_task_dead
      1.50 ± 13%      -0.6        0.89        perf-profile.children.cycles-pp.tlb_finish_mmu
      0.78 ± 18%      -0.6        0.24 ±  4%  perf-profile.children.cycles-pp.rebalance_domains
      0.93 ± 11%      -0.4        0.53 ±  2%  perf-profile.children.cycles-pp.run_rebalance_domains
      1.11 ±  8%      -0.3        0.86        perf-profile.children.cycles-pp.handle_softirqs
      1.13 ±  7%      -0.2        0.92        perf-profile.children.cycles-pp.__irq_exit_rcu
      1.14 ±  6%      -0.2        0.93        perf-profile.children.cycles-pp.irq_exit_rcu
      1.27 ±  8%      -0.2        1.10        perf-profile.children.cycles-pp.can_migrate_task
      0.50 ± 10%      -0.1        0.37 ±  3%  perf-profile.children.cycles-pp._nohz_idle_balance
      0.20 ±  9%      -0.1        0.09 ±  4%  perf-profile.children.cycles-pp.__task_rq_lock
      0.10 ± 15%      -0.1        0.05 ±  7%  perf-profile.children.cycles-pp.vfs_read
      0.10 ± 15%      -0.1        0.05 ±  8%  perf-profile.children.cycles-pp.__x64_sys_read
      0.10 ± 15%      -0.1        0.05 ±  8%  perf-profile.children.cycles-pp.ksys_read
      0.11 ± 12%      -0.1        0.06 ±  6%  perf-profile.children.cycles-pp.read
      0.09 ±  7%      -0.0        0.06 ±  6%  perf-profile.children.cycles-pp.task_fork_fair
      0.09 ± 10%      -0.0        0.07 ±  5%  perf-profile.children.cycles-pp.sched_cgroup_fork
      0.10 ±  8%      +0.0        0.12 ±  4%  perf-profile.children.cycles-pp.main
      0.10 ±  8%      +0.0        0.12 ±  4%  perf-profile.children.cycles-pp.run_builtin
      0.45 ±  2%      +0.0        0.49 ±  2%  perf-profile.children.cycles-pp.scheduler_tick
      0.01 ±223%      +0.0        0.06 ±  9%  perf-profile.children.cycles-pp.arch_scale_freq_tick
      0.01 ±223%      +0.0        0.06 ±  9%  perf-profile.children.cycles-pp.clear_page_erms
      0.02 ±141%      +0.0        0.06 ± 14%  perf-profile.children.cycles-pp.shim_sched_yield
      0.07 ± 27%      +0.0        0.12 ±  4%  perf-profile.children.cycles-pp.trigger_load_balance
      0.06 ± 21%      +0.0        0.11 ±  4%  perf-profile.children.cycles-pp.sched_autogroup_exit_task
      0.01 ±223%      +0.0        0.06 ±  6%  perf-profile.children.cycles-pp.__mod_node_page_state
      0.01 ±223%      +0.0        0.06 ±  6%  perf-profile.children.cycles-pp.put_files_struct
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.error_entry
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.kmem_cache_alloc_node
      0.02 ±142%      +0.1        0.07 ±  5%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.tick_sched_do_timer
      0.07 ± 29%      +0.1        0.12 ±  3%  perf-profile.children.cycles-pp.release_task
      0.00            +0.1        0.05 ±  7%  perf-profile.children.cycles-pp.ct_idle_enter
      0.00            +0.1        0.05 ±  7%  perf-profile.children.cycles-pp.wake_q_add
      0.02 ±142%      +0.1        0.07        perf-profile.children.cycles-pp.check_preempt_wakeup
      0.03 ±102%      +0.1        0.08 ±  4%  perf-profile.children.cycles-pp.read_tsc
      0.00            +0.1        0.05 ±  8%  perf-profile.children.cycles-pp.__calc_delta
      0.06 ± 50%      +0.1        0.11 ±  6%  perf-profile.children.cycles-pp.sched_move_task
      0.00            +0.1        0.05 ±  8%  perf-profile.children.cycles-pp.set_next_task_fair
      0.01 ±223%      +0.1        0.06 ±  6%  perf-profile.children.cycles-pp.vma_interval_tree_augment_rotate
      0.00            +0.1        0.06 ±  9%  perf-profile.children.cycles-pp.__pmd_alloc
      0.01 ±223%      +0.1        0.06 ±  7%  perf-profile.children.cycles-pp.cpuidle_reflect
      0.02 ±142%      +0.1        0.08 ±  6%  perf-profile.children.cycles-pp.lru_add_drain
      0.02 ±142%      +0.1        0.08 ±  6%  perf-profile.children.cycles-pp.lru_add_drain_cpu
      0.00            +0.1        0.06 ±  8%  perf-profile.children.cycles-pp.exit_files
      0.01 ±223%      +0.1        0.07 ±  7%  perf-profile.children.cycles-pp.nohz_balancer_kick
      0.02 ±144%      +0.1        0.08 ±  9%  perf-profile.children.cycles-pp.__free_one_page
      0.02 ±144%      +0.1        0.08 ±  4%  perf-profile.children.cycles-pp.__kmem_cache_alloc_bulk
      0.01 ±223%      +0.1        0.07 ±  7%  perf-profile.children.cycles-pp.__mod_lruvec_state
      0.01 ±223%      +0.1        0.07 ±  5%  perf-profile.children.cycles-pp.__mt_destroy
      0.01 ±223%      +0.1        0.07 ±  5%  perf-profile.children.cycles-pp.__pte_offset_map
      0.01 ±223%      +0.1        0.07 ±  5%  perf-profile.children.cycles-pp.__tlb_remove_page_size
      0.01 ±223%      +0.1        0.07 ±  5%  perf-profile.children.cycles-pp._raw_spin_trylock
      0.01 ±223%      +0.1        0.07 ±  5%  perf-profile.children.cycles-pp.mt_destroy_walk
      0.02 ±142%      +0.1        0.08 ±  4%  perf-profile.children.cycles-pp.__wake_up_common_lock
      0.02 ±144%      +0.1        0.08 ±  7%  perf-profile.children.cycles-pp.kmem_cache_alloc_bulk
      0.03 ±103%      +0.1        0.09 ±  4%  perf-profile.children.cycles-pp.__exit_signal
      0.01 ±223%      +0.1        0.07        perf-profile.children.cycles-pp.activate_task
      0.03 ±105%      +0.1        0.09        perf-profile.children.cycles-pp.hrtimer_try_to_cancel
      0.12 ± 19%      +0.1        0.18 ±  3%  perf-profile.children.cycles-pp.do_wait
      0.02 ±144%      +0.1        0.08 ±  4%  perf-profile.children.cycles-pp.asm_sysvec_reschedule_ipi
      0.04 ± 78%      +0.1        0.11 ±  4%  perf-profile.children.cycles-pp.tick_nohz_next_event
      0.01 ±223%      +0.1        0.08 ±  6%  perf-profile.children.cycles-pp.find_unlink_vmap_area
      0.02 ±142%      +0.1        0.08 ±  4%  perf-profile.children.cycles-pp.mas_leaf_max_gap
      0.02 ±144%      +0.1        0.08 ±  5%  perf-profile.children.cycles-pp.tick_nohz_stop_idle
      0.02 ±142%      +0.1        0.08 ±  8%  perf-profile.children.cycles-pp.__folio_alloc
      0.03 ±105%      +0.1        0.09 ±  5%  perf-profile.children.cycles-pp.__memcg_kmem_charge_page
      0.02 ±142%      +0.1        0.08 ±  5%  perf-profile.children.cycles-pp.__perf_sw_event
      0.04 ±105%      +0.1        0.10 ±  9%  perf-profile.children.cycles-pp.folio_batch_move_lru
      0.02 ±142%      +0.1        0.08 ±  8%  perf-profile.children.cycles-pp.free_pages
      0.13 ± 18%      +0.1        0.20 ±  2%  perf-profile.children.cycles-pp.kernel_wait4
      0.03 ±106%      +0.1        0.10 ±  3%  perf-profile.children.cycles-pp._find_next_or_bit
      0.02 ±143%      +0.1        0.09 ± 10%  perf-profile.children.cycles-pp.discard_slab
      0.04 ± 79%      +0.1        0.11 ±  7%  perf-profile.children.cycles-pp.down_read_trylock
      0.02 ±144%      +0.1        0.08 ±  8%  perf-profile.children.cycles-pp.free_slab
      0.01 ±223%      +0.1        0.08 ± 10%  perf-profile.children.cycles-pp.kmalloc_slab
      0.02 ±144%      +0.1        0.08 ±  5%  perf-profile.children.cycles-pp.mas_alloc_nodes
      0.02 ±144%      +0.1        0.08 ±  5%  perf-profile.children.cycles-pp.mas_expected_entries
      0.02 ±146%      +0.1        0.09 ±  5%  perf-profile.children.cycles-pp.mast_fill_bnode
      0.05 ± 77%      +0.1        0.11 ±  6%  perf-profile.children.cycles-pp.nr_iowait_cpu
      0.13 ± 20%      +0.1        0.20        perf-profile.children.cycles-pp.__do_sys_wait4
      0.06 ± 56%      +0.1        0.13 ±  4%  perf-profile.children.cycles-pp.___perf_sw_event
      0.02 ±144%      +0.1        0.09 ±  5%  perf-profile.children.cycles-pp.__bitmap_subset
      0.08 ± 41%      +0.1        0.14 ±  5%  perf-profile.children.cycles-pp.get_user_cpu_mask
      0.02 ±146%      +0.1        0.09 ±  4%  perf-profile.children.cycles-pp.mas_node_count_gfp
      0.02 ±144%      +0.1        0.09 ± 10%  perf-profile.children.cycles-pp.sched_getaffinity@plt
      0.07 ± 38%      +0.1        0.14 ±  2%  perf-profile.children.cycles-pp.stress_race_sched_head_remove
      0.02 ±146%      +0.1        0.09 ±  7%  perf-profile.children.cycles-pp.xas_find
      0.03 ±105%      +0.1        0.10 ±  4%  perf-profile.children.cycles-pp.__put_task_struct
      0.08 ± 29%      +0.1        0.15 ±  4%  perf-profile.children.cycles-pp.wait_task_zombie
      0.04 ±104%      +0.1        0.11 ±  4%  perf-profile.children.cycles-pp.__pte_offset_map_lock
      0.03 ±106%      +0.1        0.10 ±  3%  perf-profile.children.cycles-pp.delayed_put_task_struct
      0.04 ± 79%      +0.1        0.11 ±  4%  perf-profile.children.cycles-pp.folio_add_file_rmap_range
      0.05 ± 81%      +0.1        0.12 ±  4%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
      0.02 ±146%      +0.1        0.09 ±  6%  perf-profile.children.cycles-pp.__get_obj_cgroup_from_memcg
      0.13 ± 20%      +0.1        0.20        perf-profile.children.cycles-pp.__x64_sys_wait4
      0.09 ± 30%      +0.1        0.16 ±  2%  perf-profile.children.cycles-pp.wait_consider_task
      0.02 ±143%      +0.1        0.09 ±  5%  perf-profile.children.cycles-pp.__free_slab
      0.04 ±104%      +0.1        0.11 ±  3%  perf-profile.children.cycles-pp._find_next_bit
      0.01 ±223%      +0.1        0.08        perf-profile.children.cycles-pp.osq_lock
      0.01 ±223%      +0.1        0.08        perf-profile.children.cycles-pp.place_entity
      0.02 ±141%      +0.1        0.10 ±  8%  perf-profile.children.cycles-pp.vma_alloc_folio
      0.01 ±223%      +0.1        0.08 ±  5%  perf-profile.children.cycles-pp.__bitmap_and
      0.07 ± 35%      +0.1        0.14 ± 11%  perf-profile.children.cycles-pp.stress_mwc8modn
      0.05 ± 80%      +0.1        0.12 ±  3%  perf-profile.children.cycles-pp.wake_up_var
      0.01 ±223%      +0.1        0.08 ±  4%  perf-profile.children.cycles-pp.__queue_work
      0.02 ±146%      +0.1        0.09 ±  5%  perf-profile.children.cycles-pp.get_partial_node
      0.02 ±144%      +0.1        0.09 ±  4%  perf-profile.children.cycles-pp.set_cpus_allowed_common
      0.06 ± 60%      +0.1        0.13 ±  2%  perf-profile.children.cycles-pp.mas_topiary_replace
      0.04 ±102%      +0.1        0.11 ±  5%  perf-profile.children.cycles-pp.free_pud_range
      0.08 ± 41%      +0.1        0.15 ±  7%  perf-profile.children.cycles-pp.getpid@plt
      0.04 ±104%      +0.1        0.11 ±  3%  perf-profile.children.cycles-pp.hrtimer_cancel
      0.02 ±144%      +0.1        0.09 ±  5%  perf-profile.children.cycles-pp.llist_add_batch
      0.04 ±107%      +0.1        0.11        perf-profile.children.cycles-pp.vm_normal_page
      0.14 ± 18%      +0.1        0.22 ±  2%  perf-profile.children.cycles-pp.wait4
      0.06 ± 57%      +0.1        0.13 ±  5%  perf-profile.children.cycles-pp.free_unref_page_commit
      0.08 ± 39%      +0.1        0.15 ±  8%  perf-profile.children.cycles-pp.__get_vm_area_node
      0.08 ± 38%      +0.1        0.16 ±  3%  perf-profile.children.cycles-pp.__memcpy
      0.08 ± 38%      +0.1        0.16 ±  5%  perf-profile.children.cycles-pp.__switch_to_asm
      0.08 ± 35%      +0.1        0.15 ±  3%  perf-profile.children.cycles-pp.mas_wr_append
      0.04 ±102%      +0.1        0.11 ±  4%  perf-profile.children.cycles-pp.free_p4d_range
      0.05 ± 77%      +0.1        0.13 ±  5%  perf-profile.children.cycles-pp.free_percpu
      0.07 ± 34%      +0.1        0.15 ±  3%  perf-profile.children.cycles-pp.free_unref_page
      0.08 ± 35%      +0.1        0.16        perf-profile.children.cycles-pp.__switch_to
      0.10 ± 37%      +0.1        0.18 ±  2%  perf-profile.children.cycles-pp.hrtimer_start_range_ns
      0.08 ± 35%      +0.1        0.16 ±  6%  perf-profile.children.cycles-pp.percpu_counter_add_batch
      0.05 ± 85%      +0.1        0.13 ±  6%  perf-profile.children.cycles-pp.tick_irq_enter
      0.02 ±146%      +0.1        0.10        perf-profile.children.cycles-pp.__pick_next_task_fair
      0.04 ±107%      +0.1        0.12 ±  4%  perf-profile.children.cycles-pp.free_pcppages_bulk
      0.08 ± 40%      +0.1        0.16 ±  8%  perf-profile.children.cycles-pp.copy_mc_enhanced_fast_string
      0.10 ± 36%      +0.1        0.18 ±  2%  perf-profile.children.cycles-pp.pcpu_alloc
      0.06 ± 58%      +0.1        0.14 ±  6%  perf-profile.children.cycles-pp.rmqueue_bulk
      0.05 ± 80%      +0.1        0.13 ± 10%  perf-profile.children.cycles-pp._copy_to_user
      0.01 ±223%      +0.1        0.09 ± 39%  perf-profile.children.cycles-pp.clock_gettime
      0.08 ± 44%      +0.1        0.16 ±  2%  perf-profile.children.cycles-pp.delayed_vfree_work
      0.04 ±104%      +0.1        0.12 ±  4%  perf-profile.children.cycles-pp.free_pgd_range
      0.09 ± 41%      +0.1        0.17 ±  3%  perf-profile.children.cycles-pp.alloc_user_cpus_ptr
      0.08 ± 44%      +0.1        0.16 ±  5%  perf-profile.children.cycles-pp.get_obj_cgroup_from_current
      0.01 ±223%      +0.1        0.09 ±  4%  perf-profile.children.cycles-pp.update_min_vruntime
      0.15 ± 25%      +0.1        0.23 ±  4%  perf-profile.children.cycles-pp._raw_spin_lock_irq
      0.05 ± 80%      +0.1        0.13 ± 10%  perf-profile.children.cycles-pp.stress_mwc1
      0.08 ± 35%      +0.1        0.17 ±  4%  perf-profile.children.cycles-pp.__unfreeze_partials
      0.01 ±223%      +0.1        0.10 ±  5%  perf-profile.children.cycles-pp.avg_vruntime
      0.09 ± 41%      +0.1        0.18 ±  2%  perf-profile.children.cycles-pp.irq_enter_rcu
      0.08 ± 39%      +0.1        0.16 ±  4%  perf-profile.children.cycles-pp.memset@plt
      0.09 ± 39%      +0.1        0.18 ±  2%  perf-profile.children.cycles-pp.tick_nohz_get_sleep_length
      0.08 ± 40%      +0.1        0.17 ±  9%  perf-profile.children.cycles-pp.__wp_page_copy_user
      0.06 ± 57%      +0.1        0.14 ±  3%  perf-profile.children.cycles-pp.sched_mm_cid_migrate_to
      0.05 ± 83%      +0.1        0.14 ± 10%  perf-profile.children.cycles-pp.alloc_vmap_area
      0.06 ± 61%      +0.1        0.15        perf-profile.children.cycles-pp.__anon_vma_interval_tree_augment_rotate
      0.08 ± 41%      +0.1        0.16 ±  9%  perf-profile.children.cycles-pp.clockevents_program_event
      0.05 ± 73%      +0.1        0.14        perf-profile.children.cycles-pp.kmem_cache_free_bulk
      0.08 ± 38%      +0.1        0.17 ±  4%  perf-profile.children.cycles-pp.__free_pages
      0.00            +0.1        0.09 ±  4%  perf-profile.children.cycles-pp.should_we_balance
      0.08 ± 38%      +0.1        0.17 ±  2%  perf-profile.children.cycles-pp.ttwu_queue_wakelist
      0.09 ± 33%      +0.1        0.18 ±  4%  perf-profile.children.cycles-pp.acct_collect
      0.09 ± 36%      +0.1        0.18 ±  3%  perf-profile.children.cycles-pp.put_prev_task_fair
      0.09 ± 36%      +0.1        0.18 ±  3%  perf-profile.children.cycles-pp.__mod_memcg_lruvec_state
      0.10 ± 39%      +0.1        0.20        perf-profile.children.cycles-pp.native_sched_clock
      0.10 ± 39%      +0.1        0.19 ±  2%  perf-profile.children.cycles-pp.mas_walk
      0.10 ± 38%      +0.1        0.19 ±  3%  perf-profile.children.cycles-pp.refill_obj_stock
      0.10 ± 36%      +0.1        0.19 ±  6%  perf-profile.children.cycles-pp.rmqueue
      0.10 ± 39%      +0.1        0.20 ±  3%  perf-profile.children.cycles-pp.mtree_range_walk
      0.10 ± 32%      +0.1        0.20        perf-profile.children.cycles-pp.switch_mm_irqs_off
      0.11 ± 40%      +0.1        0.21 ±  4%  perf-profile.children.cycles-pp.__get_user_8
      0.10 ± 34%      +0.1        0.20 ±  3%  perf-profile.children.cycles-pp.pick_next_entity
      0.08 ± 38%      +0.1        0.19 ±  3%  perf-profile.children.cycles-pp.__update_load_avg_se
      0.12 ± 38%      +0.1        0.22 ±  4%  perf-profile.children.cycles-pp.rseq_ip_fixup
      0.11 ± 35%      +0.1        0.22 ± 13%  perf-profile.children.cycles-pp.syscall_enter_from_user_mode
      0.11 ± 38%      +0.1        0.21        perf-profile.children.cycles-pp.obj_cgroup_uncharge
      0.10 ± 37%      +0.1        0.20 ±  5%  perf-profile.children.cycles-pp.put_cpu_partial
      0.10 ± 42%      +0.1        0.20        perf-profile.children.cycles-pp.vfree
      0.10 ± 37%      +0.1        0.21        perf-profile.children.cycles-pp.obj_cgroup_charge
      0.00            +0.1        0.10 ±  4%  perf-profile.children.cycles-pp.update_sd_pick_busiest
      0.10 ± 36%      +0.1        0.20 ±  6%  perf-profile.children.cycles-pp.__mod_lruvec_page_state
      0.10 ± 41%      +0.1        0.20 ±  5%  perf-profile.children.cycles-pp.put_prev_entity
      0.11 ± 37%      +0.1        0.22 ±  7%  perf-profile.children.cycles-pp.__vmalloc_node_range
      0.12 ± 38%      +0.1        0.22 ±  4%  perf-profile.children.cycles-pp.rcu_all_qs
      0.12 ± 37%      +0.1        0.23        perf-profile.children.cycles-pp.tick_nohz_restart_sched_tick
      0.12 ± 38%      +0.1        0.22 ±  2%  perf-profile.children.cycles-pp.mas_push_data
      0.12 ± 38%      +0.1        0.22 ±  3%  perf-profile.children.cycles-pp.sync_regs
      0.11 ± 39%      +0.1        0.22 ±  2%  perf-profile.children.cycles-pp.sched_clock
      0.11 ± 35%      +0.1        0.22 ±  3%  perf-profile.children.cycles-pp.rcu_do_batch
      0.10 ± 32%      +0.1        0.21 ±  3%  perf-profile.children.cycles-pp.__update_blocked_fair
      0.05 ± 80%      +0.1        0.16 ±  4%  perf-profile.children.cycles-pp.reweight_entity
      0.09 ± 44%      +0.1        0.21 ±  2%  perf-profile.children.cycles-pp.__dequeue_entity
      0.34 ± 13%      +0.1        0.46 ±  2%  perf-profile.children.cycles-pp.wake_up_q
      0.11 ± 35%      +0.1        0.22 ±  3%  perf-profile.children.cycles-pp.__pick_eevdf
      0.11 ± 37%      +0.1        0.23 ±  5%  perf-profile.children.cycles-pp.get_page_from_freelist
      0.12 ± 41%      +0.1        0.24 ±  6%  perf-profile.children.cycles-pp.fput
      0.12 ± 40%      +0.1        0.24 ±  6%  perf-profile.children.cycles-pp.alloc_thread_stack_node
      0.11 ± 43%      +0.1        0.23 ±  4%  perf-profile.children.cycles-pp.vma_interval_tree_remove
      0.13 ± 44%      +0.1        0.25 ±  2%  perf-profile.children.cycles-pp.process_one_work
      0.13 ± 45%      +0.1        0.26 ±  5%  perf-profile.children.cycles-pp.free_swap_cache
      0.13 ± 35%      +0.1        0.26        perf-profile.children.cycles-pp.sched_clock_cpu
      0.11 ± 35%      +0.1        0.24        perf-profile.children.cycles-pp.prepare_task_switch
      0.12 ± 39%      +0.1        0.25 ±  3%  perf-profile.children.cycles-pp.set_task_cpu
      0.14 ± 35%      +0.1        0.27        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.14 ± 39%      +0.1        0.27 ±  6%  perf-profile.children.cycles-pp.tick_program_event
      0.15 ± 30%      +0.1        0.28 ±  4%  perf-profile.children.cycles-pp._exit
      0.11 ± 42%      +0.1        0.25 ±  3%  perf-profile.children.cycles-pp.set_next_entity
      0.50 ± 25%      +0.1        0.64 ±  4%  perf-profile.children.cycles-pp.arch_call_rest_init
      0.50 ± 25%      +0.1        0.64 ±  4%  perf-profile.children.cycles-pp.rest_init
      0.50 ± 25%      +0.1        0.64 ±  4%  perf-profile.children.cycles-pp.start_kernel
      0.50 ± 25%      +0.1        0.64 ±  4%  perf-profile.children.cycles-pp.x86_64_start_kernel
      0.50 ± 25%      +0.1        0.64 ±  4%  perf-profile.children.cycles-pp.x86_64_start_reservations
      0.14 ± 37%      +0.1        0.28 ±  9%  perf-profile.children.cycles-pp.pte_alloc_one
      0.15 ± 35%      +0.1        0.29 ±  3%  perf-profile.children.cycles-pp.__sched_getscheduler
      0.15 ± 32%      +0.1        0.29        perf-profile.children.cycles-pp.rcu_core
      0.15 ± 34%      +0.1        0.30 ±  2%  perf-profile.children.cycles-pp.rcu_core_si
      0.15 ± 36%      +0.1        0.30 ±  2%  perf-profile.children.cycles-pp.__rseq_handle_notify_resume
      0.16 ± 36%      +0.1        0.31 ±  3%  perf-profile.children.cycles-pp._copy_from_user
      0.15 ± 39%      +0.1        0.30 ±  3%  perf-profile.children.cycles-pp.set_pte_range
      0.62 ±  8%      +0.1        0.77        perf-profile.children.cycles-pp.update_process_times
      0.13 ± 47%      +0.1        0.28 ±  8%  perf-profile.children.cycles-pp.ktime_get
      0.37 ± 14%      +0.1        0.52        perf-profile.children.cycles-pp.cpu_stop_queue_work
      0.16 ± 37%      +0.2        0.32 ±  6%  perf-profile.children.cycles-pp.alloc_pages
      0.24 ± 19%      +0.2        0.39 ±  3%  perf-profile.children.cycles-pp.sched_ttwu_pending
      0.16 ± 42%      +0.2        0.32 ±  8%  perf-profile.children.cycles-pp.__pte_alloc
      0.15 ± 40%      +0.2        0.31        perf-profile.children.cycles-pp.__put_anon_vma
      0.64 ±  8%      +0.2        0.80        perf-profile.children.cycles-pp.tick_sched_handle
      0.69 ± 11%      +0.2        0.85        perf-profile.children.cycles-pp.try_to_wake_up
      0.13 ± 41%      +0.2        0.30 ±  3%  perf-profile.children.cycles-pp.__rb_erase_color
      0.18 ± 39%      +0.2        0.35 ±  2%  perf-profile.children.cycles-pp.mas_next_slot
      0.17 ± 38%      +0.2        0.34 ±  2%  perf-profile.children.cycles-pp.__percpu_counter_sum
      0.18 ± 38%      +0.2        0.34        perf-profile.children.cycles-pp.stress_call_race_sched_method
      0.12 ± 40%      +0.2        0.28        perf-profile.children.cycles-pp.resched_curr
      0.39 ± 16%      +0.2        0.56        perf-profile.children.cycles-pp.stop_one_cpu_nowait
      0.18 ± 37%      +0.2        0.36 ±  3%  perf-profile.children.cycles-pp.dup_task_struct
      0.17 ± 39%      +0.2        0.34 ±  3%  perf-profile.children.cycles-pp.irqentry_exit_to_user_mode
      0.22 ± 36%      +0.2        0.39        perf-profile.children.cycles-pp.tick_nohz_idle_exit
      0.21 ± 42%      +0.2        0.38        perf-profile.children.cycles-pp.switch_fpu_return
      0.18 ± 40%      +0.2        0.36 ±  3%  perf-profile.children.cycles-pp.irqentry_exit
      0.12 ± 33%      +0.2        0.30 ±  3%  perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
      0.19 ± 39%      +0.2        0.38 ± 12%  perf-profile.children.cycles-pp.stress_race_sched_child
      0.19 ± 35%      +0.2        0.38 ±  6%  perf-profile.children.cycles-pp.__alloc_pages
      0.27 ± 21%      +0.2        0.46 ±  3%  perf-profile.children.cycles-pp.__flush_smp_call_function_queue
      0.18 ± 43%      +0.2        0.38        perf-profile.children.cycles-pp.___slab_alloc
      0.22 ± 38%      +0.2        0.42 ±  2%  perf-profile.children.cycles-pp.mas_find
      0.23 ± 38%      +0.2        0.42 ±  2%  perf-profile.children.cycles-pp.__radix_tree_lookup
      0.24 ± 38%      +0.2        0.44        perf-profile.children.cycles-pp.tick_nohz_idle_stop_tick
      0.16 ± 42%      +0.2        0.36 ±  2%  perf-profile.children.cycles-pp.check_preempt_curr
      0.68 ± 10%      +0.2        0.88        perf-profile.children.cycles-pp.tick_sched_timer
      0.23 ± 37%      +0.2        0.43        perf-profile.children.cycles-pp.radix_tree_lookup
      0.19 ± 40%      +0.2        0.39 ±  4%  perf-profile.children.cycles-pp.vma_interval_tree_insert_after
      0.21 ± 36%      +0.2        0.42 ±  3%  perf-profile.children.cycles-pp.lock_vma_under_rcu
      0.20 ± 36%      +0.2        0.40 ±  3%  perf-profile.children.cycles-pp.native_irq_return_iret
      0.24 ± 18%      +0.2        0.46 ±  3%  perf-profile.children.cycles-pp.generic_smp_call_function_single_interrupt
      0.24 ± 18%      +0.2        0.46 ±  3%  perf-profile.children.cycles-pp.__sysvec_call_function_single
      0.26 ± 33%      +0.2        0.48 ±  3%  perf-profile.children.cycles-pp.__libc_fork
      0.20 ± 33%      +0.2        0.42 ±  2%  perf-profile.children.cycles-pp.psi_task_switch
      0.72 ± 11%      +0.2        0.95        perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.26 ± 37%      +0.2        0.50        perf-profile.children.cycles-pp.idr_find
      0.25 ± 40%      +0.2        0.49 ±  7%  perf-profile.children.cycles-pp.copy_present_pte
      0.26 ± 37%      +0.2        0.49 ±  2%  perf-profile.children.cycles-pp.free_cpumask_var
      0.20 ± 37%      +0.2        0.43 ±  2%  perf-profile.children.cycles-pp.ttwu_do_activate
      0.18 ± 38%      +0.2        0.41 ±  2%  perf-profile.children.cycles-pp.update_cfs_group
      0.24 ± 40%      +0.2        0.49        perf-profile.children.cycles-pp.dup_userfaultfd
      0.20 ± 41%      +0.2        0.44 ± 24%  perf-profile.children.cycles-pp.stress_race_sched_setaffinity
      0.27 ± 37%      +0.2        0.52        perf-profile.children.cycles-pp.menu_select
      0.24 ± 39%      +0.2        0.49 ±  2%  perf-profile.children.cycles-pp.unlink_file_vma
      0.46 ± 16%      +0.3        0.72        perf-profile.children.cycles-pp.complete_all
      0.28 ± 36%      +0.3        0.54 ±  2%  perf-profile.children.cycles-pp.entry_SYSCALL_64
      0.24 ± 32%      +0.3        0.50        perf-profile.children.cycles-pp.update_blocked_averages
      0.28 ± 39%      +0.3        0.54        perf-profile.children.cycles-pp.mas_split
      0.29 ± 39%      +0.3        0.56 ±  2%  perf-profile.children.cycles-pp.__kmem_cache_alloc_node
      0.26 ± 38%      +0.3        0.53        perf-profile.children.cycles-pp.psi_task_change
      0.30 ± 37%      +0.3        0.56        perf-profile.children.cycles-pp.cpuidle_select
      0.57 ± 19%      +0.3        0.84 ±  2%  perf-profile.children.cycles-pp.sysvec_call_function_single
      0.31 ± 37%      +0.3        0.59        perf-profile.children.cycles-pp.__alloc_percpu
      0.30 ± 37%      +0.3        0.58        perf-profile.children.cycles-pp.__alloc_percpu_gfp
      0.25 ± 42%      +0.3        0.53 ±  2%  perf-profile.children.cycles-pp.release_pages
      0.29 ± 39%      +0.3        0.57        perf-profile.children.cycles-pp.mas_commit_b_node
      0.32 ± 32%      +0.3        0.61        perf-profile.children.cycles-pp.__mmdrop
      0.32 ± 37%      +0.3        0.61        perf-profile.children.cycles-pp.__percpu_counter_init_many
      0.25 ± 38%      +0.3        0.54        perf-profile.children.cycles-pp.update_curr
      0.70 ± 12%      +0.3        1.00        perf-profile.children.cycles-pp.finish_task_switch
      0.27 ± 43%      +0.3        0.56 ±  2%  perf-profile.children.cycles-pp.free_pages_and_swap_cache
      0.28 ± 37%      +0.3        0.58        perf-profile.children.cycles-pp.psi_group_change
      0.33 ± 38%      +0.3        0.62 ±  2%  perf-profile.children.cycles-pp.alloc_cpumask_var_node
      0.32 ± 38%      +0.3        0.61 ±  5%  perf-profile.children.cycles-pp.wp_page_copy
      0.32 ± 39%      +0.3        0.62        perf-profile.children.cycles-pp.mas_wr_bnode
      0.60 ± 20%      +0.3        0.91 ±  2%  perf-profile.children.cycles-pp.asm_sysvec_call_function_single
      0.20 ± 50%      +0.3        0.52 ±  3%  perf-profile.children.cycles-pp.rwsem_spin_on_owner
      0.36 ± 37%      +0.3        0.68 ±  2%  perf-profile.children.cycles-pp.find_task_by_vpid
      0.33 ± 39%      +0.3        0.66 ±  7%  perf-profile.children.cycles-pp.page_remove_rmap
      0.36 ± 38%      +0.3        0.69 ±  4%  perf-profile.children.cycles-pp.do_wp_page
      0.32 ± 38%      +0.3        0.66 ±  2%  perf-profile.children.cycles-pp.__rb_insert_augmented
      0.38 ± 37%      +0.3        0.72 ±  2%  perf-profile.children.cycles-pp.stress_race_sched_exercise
      1.98 ±  9%      +0.3        2.32        perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.39 ± 38%      +0.4        0.74        perf-profile.children.cycles-pp.__kmalloc_node
      0.39 ± 40%      +0.4        0.74        perf-profile.children.cycles-pp.__kmem_cache_free
      0.44 ± 33%      +0.4        0.80        perf-profile.children.cycles-pp.exit_to_user_mode_loop
      0.22 ± 51%      +0.4        0.59 ±  3%  perf-profile.children.cycles-pp.rwsem_optimistic_spin
      0.40 ± 38%      +0.4        0.78        perf-profile.children.cycles-pp.memcg_slab_post_alloc_hook
      0.42 ± 38%      +0.4        0.81        perf-profile.children.cycles-pp.mas_wr_store_entry
      0.39 ± 42%      +0.4        0.80        perf-profile.children.cycles-pp.tlb_batch_pages_flush
      0.93 ± 15%      +0.4        1.33        perf-profile.children.cycles-pp.hrtimer_interrupt
      2.07 ± 10%      +0.4        2.48        perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.95 ± 16%      +0.4        1.36        perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      3.90 ±  5%      +0.4        4.32        perf-profile.children.cycles-pp.detach_tasks
      0.26 ± 52%      +0.4        0.68 ±  2%  perf-profile.children.cycles-pp.rwsem_down_write_slowpath
      0.56 ± 34%      +0.4        0.99        perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      0.43 ± 37%      +0.4        0.86        perf-profile.children.cycles-pp.mod_objcg_state
      0.35 ± 36%      +0.4        0.79 ±  3%  perf-profile.children.cycles-pp.__enqueue_entity
      0.46 ± 38%      +0.4        0.91        perf-profile.children.cycles-pp.mas_store
      0.54 ± 37%      +0.5        1.02        perf-profile.children.cycles-pp.__memset
      0.86 ± 24%      +0.5        1.38        perf-profile.children.cycles-pp.__cond_resched
      0.56 ± 38%      +0.5        1.08        perf-profile.children.cycles-pp.kfree
      0.60 ± 38%      +0.5        1.14 ±  3%  perf-profile.children.cycles-pp.next_uptodate_folio
      2.39 ± 10%      +0.6        2.94        perf-profile.children.cycles-pp.migration_cpu_stop
      0.47 ± 38%      +0.6        1.04        perf-profile.children.cycles-pp.dequeue_entity
      0.69 ± 35%      +0.6        1.26        perf-profile.children.cycles-pp.exit_to_user_mode_prepare
      2.44 ± 10%      +0.6        3.02        perf-profile.children.cycles-pp.cpu_stopper_thread
      0.62 ± 39%      +0.6        1.22        perf-profile.children.cycles-pp.vm_area_dup
      0.57 ± 41%      +0.6        1.19        perf-profile.children.cycles-pp.__anon_vma_interval_tree_remove
      0.58 ± 41%      +0.6        1.20        perf-profile.children.cycles-pp.anon_vma_interval_tree_remove
      0.62 ± 37%      +0.6        1.24        perf-profile.children.cycles-pp.__vm_area_free
      0.68 ± 40%      +0.6        1.32 ± 10%  perf-profile.children.cycles-pp._compound_head
      0.64 ± 37%      +0.6        1.29        perf-profile.children.cycles-pp.remove_vma
      1.87 ± 17%      +0.7        2.52        perf-profile.children.cycles-pp.sched_getaffinity
      0.78 ± 36%      +0.7        1.45 ±  2%  perf-profile.children.cycles-pp.mm_init
      0.61 ± 38%      +0.8        1.36        perf-profile.children.cycles-pp.update_load_avg
      0.82 ± 39%      +0.8        1.59 ±  4%  perf-profile.children.cycles-pp.copy_pte_range
      0.75 ± 39%      +0.8        1.55 ±  2%  perf-profile.children.cycles-pp.up_write
      0.69 ± 34%      +0.8        1.50        perf-profile.children.cycles-pp.update_rq_clock
      0.81 ± 39%      +0.8        1.62 ±  3%  perf-profile.children.cycles-pp.zap_pte_range
      0.96 ± 37%      +0.9        1.84 ±  2%  perf-profile.children.cycles-pp.filemap_map_pages
      0.96 ± 39%      +0.9        1.87 ±  4%  perf-profile.children.cycles-pp.copy_p4d_range
      1.01 ± 37%      +0.9        1.92        perf-profile.children.cycles-pp.do_read_fault
      1.02 ± 37%      +0.9        1.94        perf-profile.children.cycles-pp.do_fault
      0.72 ± 38%      +0.9        1.65        perf-profile.children.cycles-pp.dequeue_task_fair
      1.00 ± 39%      +0.9        1.93 ±  3%  perf-profile.children.cycles-pp.copy_page_range
      0.78 ± 36%      +1.0        1.74        perf-profile.children.cycles-pp.enqueue_entity
      0.98 ± 38%      +1.0        1.95        perf-profile.children.cycles-pp.kmem_cache_alloc
      0.77 ± 36%      +1.0        1.74        perf-profile.children.cycles-pp.__do_set_cpus_allowed
      0.21 ±  8%      +1.1        1.29 ±  4%  perf-profile.children.cycles-pp.find_busiest_queue
      3.91 ± 11%      +1.1        4.99        perf-profile.children.cycles-pp.move_queued_task
      1.15 ± 39%      +1.1        2.29        perf-profile.children.cycles-pp.__slab_free
      1.01 ± 38%      +1.1        2.16        perf-profile.children.cycles-pp.enqueue_task
      1.29 ± 32%      +1.2        2.44        perf-profile.children.cycles-pp.intel_idle_xstate
      0.96 ± 42%      +1.2        2.11 ±  2%  perf-profile.children.cycles-pp.down_write
      6.22 ±  2%      +1.2        7.44        perf-profile.children.cycles-pp.affine_move_task
      0.29 ± 10%      +1.2        1.51        perf-profile.children.cycles-pp.idle_cpu
      0.99 ± 36%      +1.2        2.22        perf-profile.children.cycles-pp.enqueue_task_fair
      1.28 ± 39%      +1.2        2.52 ±  4%  perf-profile.children.cycles-pp.zap_pmd_range
      0.30 ± 12%      +1.3        1.56        perf-profile.children.cycles-pp._find_next_and_bit
      1.41 ± 37%      +1.3        2.68 ±  2%  perf-profile.children.cycles-pp.handle_pte_fault
      1.34 ± 39%      +1.3        2.64 ±  4%  perf-profile.children.cycles-pp.unmap_page_range
      1.46 ± 37%      +1.3        2.79 ±  2%  perf-profile.children.cycles-pp.__handle_mm_fault
      1.37 ± 39%      +1.3        2.71 ±  4%  perf-profile.children.cycles-pp.unmap_single_vma
      1.44 ± 39%      +1.4        2.86 ±  4%  perf-profile.children.cycles-pp.unmap_vmas
      1.56 ± 37%      +1.4        2.98 ±  2%  perf-profile.children.cycles-pp.handle_mm_fault
      1.54 ± 38%      +1.5        3.08        perf-profile.children.cycles-pp.kmem_cache_free
      1.84 ± 37%      +1.7        3.51 ±  2%  perf-profile.children.cycles-pp.do_user_addr_fault
      1.96 ± 37%      +1.8        3.78 ±  2%  perf-profile.children.cycles-pp.exc_page_fault
      1.70 ± 40%      +1.8        3.52        perf-profile.children.cycles-pp.unlink_anon_vmas
     13.87 ±  5%      +1.9       15.75        perf-profile.children.cycles-pp.__set_cpus_allowed_ptr
      2.10 ± 37%      +1.9        4.04 ±  2%  perf-profile.children.cycles-pp.asm_exc_page_fault
      1.89 ± 40%      +2.1        3.95        perf-profile.children.cycles-pp.anon_vma_interval_tree_insert
      2.95 ± 28%      +2.1        5.01        perf-profile.children.cycles-pp.cpuidle_enter_state
      0.48 ± 11%      +2.2        2.71        perf-profile.children.cycles-pp.cpu_util
      2.27 ± 40%      +2.4        4.68        perf-profile.children.cycles-pp.free_pgtables
      3.57 ± 29%      +2.5        6.06        perf-profile.children.cycles-pp.cpuidle_enter
      3.59 ± 30%      +2.5        6.12        perf-profile.children.cycles-pp.call_cpuidle
      7.60 ±  7%      +2.7       10.27        perf-profile.children.cycles-pp.__set_cpus_allowed_ptr_locked
      2.67 ± 39%      +2.9        5.53        perf-profile.children.cycles-pp.anon_vma_clone
      4.17 ± 31%      +3.0        7.18        perf-profile.children.cycles-pp.cpuidle_idle_call
      3.21 ± 40%      +3.5        6.72        perf-profile.children.cycles-pp.anon_vma_fork
     15.28 ±  8%      +3.5       18.82        perf-profile.children.cycles-pp.__sched_setaffinity
      8.75 ± 16%      +3.6       12.31        perf-profile.children.cycles-pp.do_exit
      8.74 ± 16%      +3.6       12.32        perf-profile.children.cycles-pp.do_group_exit
      8.74 ± 16%      +3.6       12.33        perf-profile.children.cycles-pp.__x64_sys_exit_group
      6.26 ± 27%      +4.2       10.49        perf-profile.children.cycles-pp.exit_mmap
      6.31 ± 27%      +4.3       10.60        perf-profile.children.cycles-pp.__mmput
      6.31 ± 27%      +4.3       10.60        perf-profile.children.cycles-pp.mmput
      6.33 ± 27%      +4.3       10.64        perf-profile.children.cycles-pp.exit_mm
     16.50 ± 10%      +4.6       21.12        perf-profile.children.cycles-pp.__x64_sys_sched_setaffinity
      6.66 ± 36%      +6.3       13.01        perf-profile.children.cycles-pp.dup_mmap
      7.74 ± 36%      +7.3       15.07        perf-profile.children.cycles-pp.dup_mm
      8.52 ± 34%      +7.6       16.08        perf-profile.children.cycles-pp.kernel_clone
      8.32 ± 35%      +7.6       15.90        perf-profile.children.cycles-pp.copy_process
      8.47 ± 35%      +7.6       16.07        perf-profile.children.cycles-pp.__do_sys_clone
      8.47 ± 35%      +7.6       16.07        perf-profile.children.cycles-pp.__x64_sys_clone
      8.69 ± 35%      +7.8       16.44        perf-profile.children.cycles-pp._Fork
      2.00 ± 12%      +9.2       11.21        perf-profile.children.cycles-pp.update_sg_lb_stats
     33.61 ± 11%      +9.8       43.36        perf-profile.children.cycles-pp.sched_setaffinity
      2.40 ± 13%     +10.9       13.29        perf-profile.children.cycles-pp.update_sd_lb_stats
      2.44 ± 13%     +11.0       13.39        perf-profile.children.cycles-pp.find_busiest_group
     37.89 ± 17%     +16.2       54.08        perf-profile.children.cycles-pp.x64_sys_call
     38.64 ± 17%     +16.8       55.44        perf-profile.children.cycles-pp.do_syscall_64
     38.71 ± 17%     +16.9       55.56        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     58.97 ± 20%     -44.3       14.64        perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      1.36 ± 32%      -1.3        0.11 ±  8%  perf-profile.self.cycles-pp.smp_call_function_many_cond
      1.22 ±  8%      -0.2        1.06        perf-profile.self.cycles-pp.can_migrate_task
      0.02 ±141%      +0.0        0.06 ± 11%  perf-profile.self.cycles-pp.stress_mwc8modn
      0.01 ±223%      +0.0        0.06 ±  9%  perf-profile.self.cycles-pp.arch_scale_freq_tick
      0.01 ±223%      +0.0        0.06 ±  9%  perf-profile.self.cycles-pp.call_cpuidle
      0.01 ±223%      +0.0        0.06 ±  9%  perf-profile.self.cycles-pp.clear_page_erms
      0.01 ±223%      +0.0        0.06 ±  9%  perf-profile.self.cycles-pp.pte_alloc_one
      0.01 ±223%      +0.0        0.06 ±  9%  perf-profile.self.cycles-pp.refresh_cpu_vm_stats
      0.01 ±223%      +0.0        0.06 ±  9%  perf-profile.self.cycles-pp.trigger_load_balance
      0.01 ±223%      +0.0        0.06 ±  9%  perf-profile.self.cycles-pp.vma_interval_tree_augment_rotate
      0.01 ±223%      +0.0        0.06 ±  8%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.01 ±223%      +0.0        0.06 ±  6%  perf-profile.self.cycles-pp.__mod_node_page_state
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.__calc_delta
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.sched_clock_cpu
      0.02 ±142%      +0.1        0.07 ±  5%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.01 ±223%      +0.1        0.06        perf-profile.self.cycles-pp.__put_anon_vma
      0.00            +0.1        0.05 ±  7%  perf-profile.self.cycles-pp.copy_page_range
      0.01 ±223%      +0.1        0.06        perf-profile.self.cycles-pp.memset@plt
      0.00            +0.1        0.05 ±  7%  perf-profile.self.cycles-pp.smpboot_thread_fn
      0.02 ±142%      +0.1        0.07 ±  9%  perf-profile.self.cycles-pp.__free_one_page
      0.00            +0.1        0.05 ±  8%  perf-profile.self.cycles-pp.set_cpus_allowed_common
      0.01 ±223%      +0.1        0.06 ±  6%  perf-profile.self.cycles-pp.unmap_vmas
      0.02 ±141%      +0.1        0.07 ±  8%  perf-profile.self.cycles-pp.zap_pmd_range
      0.01 ±223%      +0.1        0.06 ±  7%  perf-profile.self.cycles-pp.psi_task_change
      0.01 ±223%      +0.1        0.06 ±  7%  perf-profile.self.cycles-pp.stress_race_sched_setscheduler
      0.02 ±142%      +0.1        0.07 ±  6%  perf-profile.self.cycles-pp.exit_to_user_mode_prepare
      0.00            +0.1        0.06 ±  8%  perf-profile.self.cycles-pp.__flush_smp_call_function_queue
      0.01 ±223%      +0.1        0.07 ±  7%  perf-profile.self.cycles-pp._raw_spin_trylock
      0.00            +0.1        0.06 ±  8%  perf-profile.self.cycles-pp.idr_find
      0.01 ±223%      +0.1        0.07 ±  7%  perf-profile.self.cycles-pp.kmalloc_slab
      0.00            +0.1        0.06 ±  8%  perf-profile.self.cycles-pp.place_entity
      0.01 ±223%      +0.1        0.06 ±  7%  perf-profile.self.cycles-pp.__kmem_cache_alloc_bulk
      0.02 ±144%      +0.1        0.08 ±  6%  perf-profile.self.cycles-pp._sched_setscheduler
      0.01 ±223%      +0.1        0.06 ±  7%  perf-profile.self.cycles-pp.free_pud_range
      0.02 ±144%      +0.1        0.08 ±  8%  perf-profile.self.cycles-pp.__libc_fork
      0.02 ±142%      +0.1        0.08 ±  6%  perf-profile.self.cycles-pp.__bitmap_subset
      0.01 ±223%      +0.1        0.07 ±  5%  perf-profile.self.cycles-pp.unmap_single_vma
      0.00            +0.1        0.06 ±  9%  perf-profile.self.cycles-pp.__handle_mm_fault
      0.02 ±144%      +0.1        0.08        perf-profile.self.cycles-pp._find_next_or_bit
      0.02 ±142%      +0.1        0.08 ±  5%  perf-profile.self.cycles-pp.cpuacct_charge
      0.01 ±223%      +0.1        0.07 ±  5%  perf-profile.self.cycles-pp.__mod_lruvec_page_state
      0.03 ±103%      +0.1        0.09 ±  5%  perf-profile.self.cycles-pp._find_next_bit
      0.02 ±142%      +0.1        0.08        perf-profile.self.cycles-pp.mas_leaf_max_gap
      0.04 ±104%      +0.1        0.10 ±  4%  perf-profile.self.cycles-pp.x64_sys_call
      0.05 ± 77%      +0.1        0.11 ±  5%  perf-profile.self.cycles-pp.___perf_sw_event
      0.05 ± 77%      +0.1        0.11 ±  5%  perf-profile.self.cycles-pp._raw_spin_unlock_irqrestore
      0.01 ±223%      +0.1        0.08 ±  6%  perf-profile.self.cycles-pp.do_syscall_64
      0.04 ± 77%      +0.1        0.11 ±  4%  perf-profile.self.cycles-pp.down_read_trylock
      0.07 ± 33%      +0.1        0.14 ±  7%  perf-profile.self.cycles-pp.rcu_all_qs
      0.01 ±223%      +0.1        0.08 ±  6%  perf-profile.self.cycles-pp.get_partial_node
      0.02 ±146%      +0.1        0.09 ±  8%  perf-profile.self.cycles-pp.stress_race_sched_child
      0.01 ±223%      +0.1        0.08 ±  8%  perf-profile.self.cycles-pp.__get_obj_cgroup_from_memcg
      0.02 ±143%      +0.1        0.09        perf-profile.self.cycles-pp.vm_normal_page
      0.05 ± 77%      +0.1        0.12 ±  4%  perf-profile.self.cycles-pp.entry_SYSCALL_64
      0.04 ±109%      +0.1        0.10 ±  4%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
      0.04 ±107%      +0.1        0.11 ±  4%  perf-profile.self.cycles-pp.__kmalloc_node
      0.01 ±223%      +0.1        0.08        perf-profile.self.cycles-pp.osq_lock
      0.01 ±223%      +0.1        0.08 ± 10%  perf-profile.self.cycles-pp.sched_getaffinity@plt
      0.08 ± 39%      +0.1        0.15 ±  3%  perf-profile.self.cycles-pp.__memcpy
      0.03 ±106%      +0.1        0.10 ±  4%  perf-profile.self.cycles-pp.acct_collect
      0.04 ±104%      +0.1        0.11 ±  5%  perf-profile.self.cycles-pp.nr_iowait_cpu
      0.03 ±106%      +0.1        0.10 ±  4%  perf-profile.self.cycles-pp.set_pte_range
      0.04 ±105%      +0.1        0.11 ±  4%  perf-profile.self.cycles-pp.folio_add_file_rmap_range
      0.06 ± 60%      +0.1        0.13 ±  2%  perf-profile.self.cycles-pp.mab_mas_cp
      0.02 ±144%      +0.1        0.09 ±  5%  perf-profile.self.cycles-pp.llist_add_batch
      0.07 ± 39%      +0.1        0.15 ±  3%  perf-profile.self.cycles-pp.refill_obj_stock
      0.08 ± 31%      +0.1        0.15 ±  4%  perf-profile.self.cycles-pp.percpu_counter_add_batch
      0.08 ± 35%      +0.1        0.16 ±  2%  perf-profile.self.cycles-pp.__switch_to
      0.08 ± 38%      +0.1        0.16 ±  3%  perf-profile.self.cycles-pp.__switch_to_asm
      0.00            +0.1        0.08 ±  6%  perf-profile.self.cycles-pp.find_busiest_group
      0.05 ± 80%      +0.1        0.12 ± 12%  perf-profile.self.cycles-pp._copy_to_user
      0.01 ±223%      +0.1        0.08 ±  5%  perf-profile.self.cycles-pp.avg_vruntime
      0.06 ± 59%      +0.1        0.13 ±  2%  perf-profile.self.cycles-pp.mas_topiary_replace
      0.06 ± 57%      +0.1        0.14 ±  5%  perf-profile.self.cycles-pp.rmqueue_bulk
      0.08 ± 38%      +0.1        0.16 ±  2%  perf-profile.self.cycles-pp.obj_cgroup_charge
      0.09 ± 35%      +0.1        0.17 ±  2%  perf-profile.self.cycles-pp.stress_call_race_sched_method
      0.05 ± 82%      +0.1        0.13 ±  6%  perf-profile.self.cycles-pp.lock_vma_under_rcu
      0.00            +0.1        0.08 ±  4%  perf-profile.self.cycles-pp.should_we_balance
      0.01 ±223%      +0.1        0.09 ±  4%  perf-profile.self.cycles-pp.update_min_vruntime
      0.07 ± 54%      +0.1        0.15 ± 10%  perf-profile.self.cycles-pp.copy_pte_range
      0.08 ± 37%      +0.1        0.16 ±  9%  perf-profile.self.cycles-pp.copy_mc_enhanced_fast_string
      0.06 ± 58%      +0.1        0.14 ±  3%  perf-profile.self.cycles-pp.__mod_memcg_lruvec_state
      0.04 ±105%      +0.1        0.12 ±  6%  perf-profile.self.cycles-pp.handle_mm_fault
      0.08 ± 33%      +0.1        0.16 ±  4%  perf-profile.self.cycles-pp.__update_blocked_fair
      0.01 ±223%      +0.1        0.09 ±  5%  perf-profile.self.cycles-pp.reweight_entity
      0.10 ± 36%      +0.1        0.19 ±  7%  perf-profile.self.cycles-pp.mm_init
      0.06 ± 57%      +0.1        0.14 ±  3%  perf-profile.self.cycles-pp.sched_mm_cid_migrate_to
      0.10 ± 35%      +0.1        0.18 ±  2%  perf-profile.self.cycles-pp.task_rq_lock
      0.06 ± 61%      +0.1        0.15        perf-profile.self.cycles-pp.__anon_vma_interval_tree_augment_rotate
      0.10 ± 39%      +0.1        0.18 ±  3%  perf-profile.self.cycles-pp.native_sched_clock
      0.09 ± 42%      +0.1        0.18 ±  3%  perf-profile.self.cycles-pp.vma_interval_tree_remove
      0.07 ± 39%      +0.1        0.16 ±  2%  perf-profile.self.cycles-pp.switch_fpu_return
      0.08 ± 37%      +0.1        0.17 ±  2%  perf-profile.self.cycles-pp.__update_load_avg_se
      0.10 ± 36%      +0.1        0.19 ± 14%  perf-profile.self.cycles-pp.syscall_enter_from_user_mode
      0.00            +0.1        0.09 ±  5%  perf-profile.self.cycles-pp.update_sd_pick_busiest
      0.08 ± 40%      +0.1        0.18 ±  2%  perf-profile.self.cycles-pp.finish_task_switch
      0.10 ± 38%      +0.1        0.19 ±  2%  perf-profile.self.cycles-pp.sched_getaffinity
      0.12 ± 35%      +0.1        0.21 ±  3%  perf-profile.self.cycles-pp._raw_spin_lock_irq
      0.08 ± 37%      +0.1        0.18 ±  3%  perf-profile.self.cycles-pp.dequeue_entity
      0.10 ± 36%      +0.1        0.19 ±  2%  perf-profile.self.cycles-pp.mtree_range_walk
      0.10 ± 32%      +0.1        0.20 ±  2%  perf-profile.self.cycles-pp.switch_mm_irqs_off
      0.10 ± 39%      +0.1        0.20 ±  3%  perf-profile.self.cycles-pp.dup_userfaultfd
      0.08 ± 43%      +0.1        0.18 ±  2%  perf-profile.self.cycles-pp.__dequeue_entity
      0.10 ± 39%      +0.1        0.20 ±  2%  perf-profile.self.cycles-pp.__get_user_8
      0.10 ± 42%      +0.1        0.20 ±  3%  perf-profile.self.cycles-pp.anon_vma_fork
      0.10 ± 36%      +0.1        0.20 ±  2%  perf-profile.self.cycles-pp.do_sched_setscheduler
      0.11 ± 39%      +0.1        0.22 ±  5%  perf-profile.self.cycles-pp.find_task_by_vpid
      0.10 ± 44%      +0.1        0.21 ±  4%  perf-profile.self.cycles-pp.___slab_alloc
      0.12 ± 35%      +0.1        0.23 ±  3%  perf-profile.self.cycles-pp.__cond_resched
      0.12 ± 38%      +0.1        0.22 ±  3%  perf-profile.self.cycles-pp.sync_regs
      0.08 ± 37%      +0.1        0.19 ±  4%  perf-profile.self.cycles-pp.newidle_balance
      0.11 ± 41%      +0.1        0.22 ±  2%  perf-profile.self.cycles-pp.unlink_anon_vmas
      0.08 ± 37%      +0.1        0.19 ±  2%  perf-profile.self.cycles-pp.prepare_task_switch
      0.12 ± 45%      +0.1        0.24 ±  5%  perf-profile.self.cycles-pp.free_swap_cache
      0.11 ± 32%      +0.1        0.22 ±  3%  perf-profile.self.cycles-pp.__pick_eevdf
      0.12 ± 41%      +0.1        0.24 ±  5%  perf-profile.self.cycles-pp.fput
      0.10 ± 34%      +0.1        0.22 ±  4%  perf-profile.self.cycles-pp.psi_task_switch
      0.14 ± 28%      +0.1        0.26 ±  3%  perf-profile.self.cycles-pp.cpuidle_enter_state
      0.13 ± 37%      +0.1        0.25 ±  4%  perf-profile.self.cycles-pp.menu_select
      0.10 ± 38%      +0.1        0.22        perf-profile.self.cycles-pp.set_task_cpu
      0.10 ± 37%      +0.1        0.23 ±  4%  perf-profile.self.cycles-pp.update_cfs_group
      0.14 ± 39%      +0.1        0.26        perf-profile.self.cycles-pp.__kmem_cache_free
      0.10 ± 39%      +0.1        0.23 ±  3%  perf-profile.self.cycles-pp.enqueue_task_fair
      0.14 ± 38%      +0.1        0.26        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.15 ± 39%      +0.1        0.28 ±  2%  perf-profile.self.cycles-pp.mas_next_slot
      0.12 ± 36%      +0.1        0.26 ±  3%  perf-profile.self.cycles-pp.affine_move_task
      0.11 ± 35%      +0.1        0.25 ±  2%  perf-profile.self.cycles-pp.enqueue_entity
      0.16 ± 37%      +0.1        0.30 ±  3%  perf-profile.self.cycles-pp._copy_from_user
      0.11 ± 42%      +0.1        0.26 ±  4%  perf-profile.self.cycles-pp.__rb_erase_color
      0.13 ± 46%      +0.1        0.27 ±  6%  perf-profile.self.cycles-pp.ktime_get
      0.16 ± 36%      +0.2        0.31 ±  2%  perf-profile.self.cycles-pp.__percpu_counter_sum
      0.17 ± 35%      +0.2        0.33 ±  3%  perf-profile.self.cycles-pp.kfree
      0.17 ± 40%      +0.2        0.32 ±  2%  perf-profile.self.cycles-pp.vm_area_dup
      0.11 ± 38%      +0.2        0.28        perf-profile.self.cycles-pp.resched_curr
      0.19 ± 37%      +0.2        0.35 ±  2%  perf-profile.self.cycles-pp.__kmem_cache_alloc_node
      0.12 ± 39%      +0.2        0.29 ± 34%  perf-profile.self.cycles-pp.stress_race_sched_setaffinity
      0.12 ± 38%      +0.2        0.30        perf-profile.self.cycles-pp.dequeue_task_fair
      0.12 ± 36%      +0.2        0.29 ±  3%  perf-profile.self.cycles-pp.__update_load_avg_cfs_rq
      0.20 ± 36%      +0.2        0.38 ±  5%  perf-profile.self.cycles-pp.filemap_map_pages
      0.21 ± 37%      +0.2        0.40 ±  3%  perf-profile.self.cycles-pp.stress_race_sched_exercise
      0.20 ± 38%      +0.2        0.40 ±  2%  perf-profile.self.cycles-pp.memcg_slab_post_alloc_hook
      0.22 ± 38%      +0.2        0.42 ±  2%  perf-profile.self.cycles-pp.__radix_tree_lookup
      0.24 ± 35%      +0.2        0.44 ±  3%  perf-profile.self.cycles-pp.__sched_setscheduler
      0.18 ± 43%      +0.2        0.38 ±  4%  perf-profile.self.cycles-pp.release_pages
      0.20 ± 36%      +0.2        0.40 ±  3%  perf-profile.self.cycles-pp.native_irq_return_iret
      0.21 ± 41%      +0.2        0.42 ±  5%  perf-profile.self.cycles-pp.dup_mmap
      0.21 ± 37%      +0.2        0.42        perf-profile.self.cycles-pp.kmem_cache_alloc
      0.18 ± 37%      +0.2        0.40 ±  2%  perf-profile.self.cycles-pp.update_curr
      0.24 ± 40%      +0.2        0.46 ±  7%  perf-profile.self.cycles-pp.copy_present_pte
      0.25 ± 38%      +0.3        0.51 ±  3%  perf-profile.self.cycles-pp.__rb_insert_augmented
      0.22 ±  9%      +0.3        0.48 ±  3%  perf-profile.self.cycles-pp.load_balance
      0.24 ± 36%      +0.3        0.50        perf-profile.self.cycles-pp.__schedule
      0.29 ± 35%      +0.3        0.54 ±  8%  perf-profile.self.cycles-pp.anon_vma_clone
      0.09 ± 24%      +0.3        0.35 ±  2%  perf-profile.self.cycles-pp.update_sd_lb_stats
      0.27 ± 36%      +0.3        0.54 ±  2%  perf-profile.self.cycles-pp.psi_group_change
      0.31 ± 38%      +0.3        0.62 ±  7%  perf-profile.self.cycles-pp.page_remove_rmap
      0.32 ± 36%      +0.3        0.64        perf-profile.self.cycles-pp.kmem_cache_free
      0.19 ± 51%      +0.3        0.51 ±  3%  perf-profile.self.cycles-pp.rwsem_spin_on_owner
      0.34 ± 39%      +0.3        0.68 ±  2%  perf-profile.self.cycles-pp.zap_pte_range
      0.38 ± 37%      +0.4        0.76        perf-profile.self.cycles-pp.mod_objcg_state
      0.43 ± 39%      +0.4        0.83 ±  3%  perf-profile.self.cycles-pp.sched_setaffinity
      0.33 ± 37%      +0.4        0.75 ±  3%  perf-profile.self.cycles-pp.__enqueue_entity
      0.52 ± 37%      +0.5        0.99        perf-profile.self.cycles-pp.__memset
      0.46 ± 40%      +0.5        0.93        perf-profile.self.cycles-pp.__anon_vma_interval_tree_remove
      0.55 ± 37%      +0.5        1.02 ±  3%  perf-profile.self.cycles-pp.next_uptodate_folio
      0.42 ± 40%      +0.5        0.91        perf-profile.self.cycles-pp.update_load_avg
      2.53 ±  6%      +0.6        3.11        perf-profile.self.cycles-pp.detach_tasks
      0.65 ± 41%      +0.6        1.26 ± 10%  perf-profile.self.cycles-pp._compound_head
      0.64 ± 39%      +0.7        1.30 ±  3%  perf-profile.self.cycles-pp.down_write
      0.60 ± 33%      +0.7        1.34        perf-profile.self.cycles-pp.update_rq_clock
      0.74 ± 39%      +0.8        1.51 ±  2%  perf-profile.self.cycles-pp.up_write
      1.05 ± 39%      +1.0        2.08        perf-profile.self.cycles-pp.__slab_free
      0.20 ±  9%      +1.0        1.24 ±  4%  perf-profile.self.cycles-pp.find_busiest_queue
      0.27 ± 13%      +1.1        1.36 ±  2%  perf-profile.self.cycles-pp._find_next_and_bit
      0.27 ± 10%      +1.1        1.37        perf-profile.self.cycles-pp.idle_cpu
      1.29 ± 32%      +1.1        2.44        perf-profile.self.cycles-pp.intel_idle_xstate
      1.19 ± 25%      +1.3        2.47        perf-profile.self.cycles-pp._raw_spin_lock
      1.18 ± 41%      +1.5        2.63        perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      1.74 ± 40%      +1.9        3.64        perf-profile.self.cycles-pp.anon_vma_interval_tree_insert
      0.46 ± 12%      +2.1        2.57        perf-profile.self.cycles-pp.cpu_util
      1.40 ± 13%      +6.5        7.90        perf-profile.self.cycles-pp.update_sg_lb_stats




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

