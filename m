Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04463303CAA
	for <oe-lkp@lists.linux.dev>; Mon, 26 Jan 2026 13:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769433533; cv=fail; b=GFw9djHhRs3mVWPpg+e1tGx38xFluDvfgGnhY1khP6LOtRAHWqLzMSMiKXsCFFO4eqa78s9czjI/KN0O20ofgwQaaDEdTIhUoMlWsumMnyx4n1YXIy9mDfnpHpHiZTSoeoUjr7zl70eqEPN450vIVj3ZmkzCmwShDBdzC/i0ISc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769433533; c=relaxed/simple;
	bh=Hrqf66tMeBJ1BsmjM8IxZMlrR7HrNQ2/B/ebp0d3BXg=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=TipOjOgFcgvy1kziTRg41NmdgMWeiCIi9VE2roVTfxOYrGSSITIMpBXsYSPOp9hSlLYT5+sHAmmRG5/1aa5lilC2sxB1ddEhYaUQGU1uMZa9SBi6COf/vVsmGUQRjgGGf34q5NovbY2ieL2N+U/VJAOoWkdjQJDc2PWnl4KNpnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jf3/pWlB; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jf3/pWlB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769433530; x=1800969530;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hrqf66tMeBJ1BsmjM8IxZMlrR7HrNQ2/B/ebp0d3BXg=;
  b=jf3/pWlBwg4ntL35IrulJq6HOrr3gvNxiF3y/V/ZpbLJJi1XN1BTe6SF
   P4sNRl2zOIqsAmQiloCJMd0YK3VnTDPUdysOPoBYKQjG/Lgp62VlY4m6t
   AOSF8FExqIaOflInr8wmJ+0NFnEOIJs+Tfh6fCbhQ1Glwg9Z8+6dD5vHu
   vt2TosSRzTb4QTW/YbOv4yCnspvc7rggZZ1sueYV7dur8pqFDVNiAD0ji
   XHxhGnUPyzWpVuOHX47wUZH0E+O1utHjYdGKDd1Lo/wYLcwXGmPV/n0mo
   vbzVGQwZdfahwbHGh7EQVqjkTc3XGrR9NzLSmbKv5sl/Hh/HmKpqtvUsJ
   Q==;
X-CSE-ConnectionGUID: T7P27k8TRMiQP7SvnshZ8w==
X-CSE-MsgGUID: orSxWHxTS9So6rxPnLwIjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="81719574"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="81719574"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 05:18:49 -0800
X-CSE-ConnectionGUID: hVOi9A+mRJWBs1jgNOKkqw==
X-CSE-MsgGUID: 4FhObuMMQYuElHIxKqdTog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="212664113"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 05:18:49 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 26 Jan 2026 05:18:48 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 26 Jan 2026 05:18:48 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.15) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 26 Jan 2026 05:18:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zSz1yIzcLquoCJ3t+mXF67kA+42bI57qu3csXNFuGkDIH/35HMIu1zSCQvAwrVJvC9iNDRYh5bXvjOR4AuLzXvdz3ytPrXIIkMxfP48R+qi7dfsGqkveW9eXTsLMTDamLgQWqMWzuEfoclUF8iFWeIMCeazHt2XYlIgUQl7ZSUVMPkJzFoDGiJKxuLcG9qPZQzNgcLgdhYMBTEPq7A+KbEKahJVS5hk3Vtl2qGZLkv2ySJys1/sIxEzhgufm5HAk+lG9GYTTzRijOlOQlwNc5uESJiBKDipfxuonNX8/uyY9aImzZmpKUArnQ86TOQC9aVtQ59tn0YIGyQAHL7SFIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FoK/hKHVcHWOZHDva74Aja3qdM/7nTtDOu3mGBk9xdA=;
 b=jHEjhuc5i01g2ZmHV/VB+Bud1cgvH2f9BaLQ9bzh6aYaOaxA4xe8/qTNT5LoIGoG0qH6LQlSM3tEyhVk4PqelVIm9j0qiG0tHTzIteOiSpLN80uDotrxNKC/dbPDAMyjlQWmkER5OTMLvsrrp4y53iSZKF6Qvqxzyh/h7D06Y7jC/I6JxbcAv9hRXiFwy49R4PXgI9+A7NCRP1BWLI1gvnekHZnVKCfD+x85aaFtJUlVQzSqS0EG3TgzUhcSfIr0/CkNjRuQ+JNC18YM57Tp2tEjuRlRP8PJc4L9H5n+P+hkJwJPb/F9euaiP2fzRcBfamxORbl25Pu5MqzoMpBczw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH0PR11MB5128.namprd11.prod.outlook.com (2603:10b6:510:39::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 13:18:45 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 13:18:45 +0000
Date: Mon, 26 Jan 2026 21:18:37 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>, =?utf-8?Q?=C5=81ukasz?= Bartosik
	<ukaszb@chromium.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [jimc:wk-modhash] [dyndbg]  a6e60e2484: WARNING:suspicious_RCU_usage
Message-ID: <202601262015.5f498cb8-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: KL1PR01CA0082.apcprd01.prod.exchangelabs.com
 (2603:1096:820:2::22) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH0PR11MB5128:EE_
X-MS-Office365-Filtering-Correlation-Id: ff0308a4-d759-445a-6518-08de5cdd6f28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LVVd86TAqWLUKVfZ20GVYeejx+PE1KvrhYjrYk+JSKHEVT/ctCKYuPTK6n18?=
 =?us-ascii?Q?6FijjaJrMH5icogo4ZxUqpm4afRQ3CeEO1WZUINmQbcwZYbR1hjkkrFlmeH+?=
 =?us-ascii?Q?pLd/oaRFjuCRc2PIGvUG6QiEGo+vPPZhADsP/omBiiIdTejSVJmayiZMG2Mg?=
 =?us-ascii?Q?EptvABFnMhqOkjKyARPv85dDD6Bnu2Ghct0RbIGGYNGcM7yboDAmnR17v1dw?=
 =?us-ascii?Q?45sqQCCOkkjYVmOcB4Zj2Hhs7s3ewSfOZKpCpZbtBGGJqrgim07FOAO8jLOs?=
 =?us-ascii?Q?GELpdR8+oJHLc6XmGaGLPGgsaoWb1Hm+jbkMyWVwlLlAAvGPs+byXjG60fnq?=
 =?us-ascii?Q?Azjh1Vao76fUeNnK2ZZ3EBzJ6C+yy9qYryAVho6hgLrao2gFtoRojdvJRe4c?=
 =?us-ascii?Q?Q5EBMgL1B47iigCRj39Fd5BOTdL0VSvcM4yITkRzznUyKbSjK4ZB+YN2KI7r?=
 =?us-ascii?Q?WFPiTQojVo5obnl4kOiQaNN78ACioz/ZcRzUVSYRxme44euwoG+ertjHbBg7?=
 =?us-ascii?Q?fWZP24DZXoqVvjWCHNPHolwRhk1GIfx9SJ3QI1cI/Ka8p9tLtIWLpL/txgne?=
 =?us-ascii?Q?b3AXfZANo1wxb6Fonm+/EA3ok8e3+4c5WgkkYAi55Com1buUDJ7KJJq+ZZiM?=
 =?us-ascii?Q?hCVZHfMIryT8OsJLF1Fuf/YdHnVF+Y98WQmCtPYJkAqPBDAolp1SJNPS7xIU?=
 =?us-ascii?Q?0E5YXmz6/KtGiIFiquKXSWSwfqoZH6bW3+yo97KPTbsMywDMfXn87DuWeeyX?=
 =?us-ascii?Q?fNQ8XlR7XvYGnYOjqmHU5vBp/hsVUoMFKJItWI6LQuD5U3a9UzAMpaH310D4?=
 =?us-ascii?Q?3VCG6mCvmsWEnHWuQ8C/vTWrt/7k8xgO3gyzACzYd7swo9Zc+Htn0ish2teS?=
 =?us-ascii?Q?GMsk5LZOmAxtm1YMvW1HxKLh1RWJsyBzQKllFxkCg1ypg5kajfOqymft36lx?=
 =?us-ascii?Q?8o4MklSdJ5EVeGkU/3yHTl5tIXqe4ZQMhkUIJ66+6isiCk+SVWHhdkcxyV5G?=
 =?us-ascii?Q?KZDXz0C4Sb63d9zu86QoO25IXFV0oSk5936/Rj8/I6CScA5ZIsohsDdKFFQN?=
 =?us-ascii?Q?bp2YTdjBQ2iUmsc/p0gGgU8s5ccv1WBUen7Mej5GjhhoaK13F/DnmiHv53OX?=
 =?us-ascii?Q?LE+mks0UAH7WzzEYZ/H9+kGKTEBhtXNvPi7Lf6vJsotk/mMe6CaXEuyJM34z?=
 =?us-ascii?Q?DidRJe8d7ZO2b45gWUwSB1/5avkDNavFv6fm4eGyy5nuiWJhR8BD/idqRhQv?=
 =?us-ascii?Q?xMaiptLy2wwcevsdn5qEc2b7QDXYeVqjD4qnCK19SFbJkZcEQzSSF2oI+za5?=
 =?us-ascii?Q?x8Pzuv57PQ2UPE5epLkNIXnSOQ8V0BMPznss4WHlAxxb0VH1xJkHI/P00+Bf?=
 =?us-ascii?Q?9PA5q9An6IZUYJcXYwjtbGOMbcOoDTPK4DadzJ39L3KDMXFKAg1jKNXO2JcQ?=
 =?us-ascii?Q?jCo9BwsDB3RIspzBtyHE+BFE1/SEHlxpjgddNeJoOEI5qZmappbIvCLj1zMn?=
 =?us-ascii?Q?8YpJ44lcWefSHtIuWo52SNOjB9n2Y5f4FLlQvGDu6ZpTLdzF6s+9x0r7LEup?=
 =?us-ascii?Q?SCiFxU6+SLP5NAMB3gjFTCPzMofzC84jMvsVbMHe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+8InG1MM/kxwW1xvGildq7fxFisjoBOdPKvQmGOI6JBxwyjzklyD4g8DOCUu?=
 =?us-ascii?Q?o6bwBivs7u2CN+Aq1ZxwqMbkDwDP85x/VH7aCIlHZgjRja5YRHQKQW+qr//C?=
 =?us-ascii?Q?QEJOeSuC4FB7KnIUYsF0Q6fk3OAqyJZSKwT5XegX9G8R5KPdL25xYpkUxMlg?=
 =?us-ascii?Q?3ltgWJA3Q11iZ7Jz+JAPmtMgq37mZb/GhDCs+HnZRVeaRJKkJTHOzRJDfO+i?=
 =?us-ascii?Q?q0UUZWqS5QRdaFg/2/agMlIuq76smgrtvx2PljuexJ6vucTdyW+T0p33WPPj?=
 =?us-ascii?Q?MpfDD7tnbEn/AetJk4iiepz8NcIu2mRoYQb385CdbRzj3CCvHijPkE48RTvI?=
 =?us-ascii?Q?RXzfqpGzvc8VUoYJMcAhOVsdy2Q8oP0Z+KsIdZDNPhliX2sXqPck6U/etB+V?=
 =?us-ascii?Q?aL0ksxQabSBITrmWMT4HhXzNBSaWiBevLQ6jBs5MfrBuz6CmXkxt1lsk5mR1?=
 =?us-ascii?Q?6/vIWjYUzeiJyuffbVttucfEZ4nC2kteYPhb3xdiVwwbjhH7FJZNGgTop76z?=
 =?us-ascii?Q?7avh0HYwfYM9XWUN7XPyFmXj0OVfKelFZL0mf4EuCh425lTRPaQPCow3Oa8h?=
 =?us-ascii?Q?qegpaudNSz/rmXib0F69VpG4LGRluJFjRtnLfIOBACXKsdFZnmB3GRGTiEdb?=
 =?us-ascii?Q?+CqaZJzYoQJHHDH8IlXhExbgX/vZOwKsqcsfO8uI3eMmy+Eju9s3NdKCZNRb?=
 =?us-ascii?Q?nDAPxdpkWpTLfqyGudInzqJk/kd1TM5f2qUdnnu4k8JPU8VTRHczjgxnakpx?=
 =?us-ascii?Q?zjUClU6OeAoIuh1GuL1TjQAhNJgnlpb+09L4QaOLI1DxC0GXWXmXyai8q2WC?=
 =?us-ascii?Q?TfZSaY1swrVtN7IpE7FGX1e39Q38dGRRanuZmAse/qmSPGC3VN4uwfydEmyJ?=
 =?us-ascii?Q?XhXlwUGx/hTyXK1ey+Q7UUak9Ki4iJXaEUINfxVhewOk4eKaSw2cIxyKfGUt?=
 =?us-ascii?Q?SfuKT2zJd1C0gL0wCns5Mu/+Q4EZlvBAVRnAhQhomcIEW6vsV5yh52GKOXDk?=
 =?us-ascii?Q?TUtsXzjEljgei51F7GGPIsHK9+bhvfmkeakU/6iqyTkyYvWU0TB52afI2ptQ?=
 =?us-ascii?Q?VI69/5W3+SnCtXlGuyMbYyBjlWhN2pdIH/+YFITEdp8ytYGAkA8OzYbnAQyR?=
 =?us-ascii?Q?DGRj0LXkw0Ew8TKOd5Yox9x9pSN1nUN8puNqsXPbft3FCAShvhpjiSkwE++K?=
 =?us-ascii?Q?j1R+SVYsVFfQslOtoe5G9AmJ4w+dN9xkMKBEQyj2Hg62BT9/yYddcDrjsZAn?=
 =?us-ascii?Q?LwRaBMXZ0o9tYnQxftejvL7I/JF1G1NV8jlFP9shYcuUgggyoBGXYG9Oa6k9?=
 =?us-ascii?Q?lNGupQ0ojUtoL8pwbLu98vG9BD7wc75RqwM2Kc5A0am0IyxCGTw6gGbt17KP?=
 =?us-ascii?Q?SuVPZAfdCnHCnDA1yPjvZHXjcg7/FLRx7ws9WiRuYiUG9qHQYm3AX9j7ovkC?=
 =?us-ascii?Q?xoRlj5tN/lTppeTBlNwZOYH03/e6ZL0C4qTgMcNs1smFSGSmzaWSVSMTxxWB?=
 =?us-ascii?Q?nVSe3LikasVJnzLpvqzA6UDvqS6BautwGfAhYwxaeeGqDNAEsZfI8T/1TpFz?=
 =?us-ascii?Q?+LyO2Mox3zVP6nl8nHjCUvxz6pUPtYDGlg1fM3AI16ahDszmKfiqgtNvn29E?=
 =?us-ascii?Q?qWUFI/bXotUUjgjU2+9BarrmLlkJuBqL2HxZ4oodTQfaFeI+eIizapGX3l/1?=
 =?us-ascii?Q?aWWE4fWghe9RMo/1Jp5y1DqnIa+7SZ2bKbC5ryxCvvt3B7cCGfPna2ySf1ab?=
 =?us-ascii?Q?wcRIbEpYrw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ff0308a4-d759-445a-6518-08de5cdd6f28
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 13:18:45.7164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1L4vbTumfoDn9DfdLCosuvWB9AQd6aRwbhpw2BtfCtGPDnAVI2430KLFAEBsyfsLOJ9JCGretRvtMq5coUKVUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5128
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:suspicious_RCU_usage" on:

commit: a6e60e2484beb46405af7aba2a83cea2aaf0815f ("dyndbg: walk dd_mod_map intervals in dynamic_debug_init()")
https://github.com/jimc/linux.git wk-modhash

in testcase: boot

config: x86_64-randconfig-074-20260122
compiler: clang-20
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+------------------------------------------------------------------------------------+------------+------------+
|                                                                                    | 46e05bf6d2 | a6e60e2484 |
+------------------------------------------------------------------------------------+------------+------------+
| WARNING:suspicious_RCU_usage                                                       | 0          | 6          |
| include/linux/rcupdate.h:#Illegal_context_switch_in_RCU_read-side_critical_section | 0          | 6          |
| BUG:sleeping_function_called_from_invalid_context_at_include/linux/sched/mm.h      | 0          | 6          |
+------------------------------------------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202601262015.5f498cb8-lkp@intel.com



[    0.848842][    T1] WARNING: suspicious RCU usage
[    0.849347][    T1] 6.19.0-rc6-00039-ga6e60e2484be #1 Not tainted
[    0.850012][    T1] -----------------------------
[    0.850522][    T1] include/linux/rcupdate.h:410 Illegal context switch in RCU read-side critical section!
[    0.851549][    T1]
[    0.851549][    T1] other info that might help us debug this:
[    0.851549][    T1]
[    0.852619][    T1]
[    0.852619][    T1] rcu_scheduler_active = 2, debug_locks = 1
[    0.853448][    T1] 1 lock held by swapper/0/1:
[    0.853945][    T1]  #0: ffffffff83bcbfb0 (rcu_read_lock){....}-{1:3}, at: dynamic_debug_init (include/linux/rcupdate.h:331 include/linux/rcupdate.h:867 lib/dynamic_debug.c:1800)
[    0.855024][    T1]
[    0.855024][    T1] stack backtrace:
[    0.855624][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.19.0-rc6-00039-ga6e60e2484be #1 PREEMPTLAZY
[    0.856708][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[    0.857761][    T1] Call Trace:
[    0.858101][    T1]  <TASK>
[    0.858410][    T1]  __dump_stack (lib/dump_stack.c:95)
[    0.858859][    T1]  dump_stack_lvl (lib/dump_stack.c:123)
[    0.859338][    T1]  lockdep_rcu_suspicious (kernel/locking/lockdep.c:6877)
[    0.859898][    T1]  __might_resched (kernel/sched/core.c:8791)
[    0.860395][    T1]  __might_sleep (kernel/sched/core.c:8759)
[    0.860868][    T1]  slab_pre_alloc_hook (mm/slub.c:4906)
[    0.861392][    T1]  slab_alloc_node (mm/slub.c:5239)
[    0.861886][    T1]  ? mas_next_slot (lib/maple_tree.c:4410)
[    0.862401][    T1]  ? dynamic_debug_init (include/linux/rcupdate.h:331 include/linux/rcupdate.h:867 lib/dynamic_debug.c:1800)
[    0.862934][    T1]  ? ddebug_add_module (lib/dynamic_debug.c:1578)
[    0.863450][    T1]  __kmalloc_cache_noprof (mm/slub.c:5771)
[    0.863987][    T1]  ? dynamic_debug_init (include/linux/rcupdate.h:331 include/linux/rcupdate.h:867 lib/dynamic_debug.c:1800)
[    0.864520][    T1]  ddebug_add_module (lib/dynamic_debug.c:1578)
[    0.865012][    T1]  ? dynamic_debug_init (include/linux/rcupdate.h:331 include/linux/rcupdate.h:867 lib/dynamic_debug.c:1800)
[    0.865012][    T1]  dynamic_debug_init (lib/dynamic_debug.c:1811)
[    0.865012][    T1]  ? dyndbg_setup (lib/dynamic_debug.c:1843)
[    0.865012][    T1]  __initstub__kmod_dynamic_debug__1505_1843_dynamic_debug_initearly (lib/dynamic_debug.c:1843)
[    0.865012][    T1]  do_one_initcall (init/main.c:1378)
[    0.865012][    T1]  ? rcu_read_lock_any_held (kernel/rcu/update.c:386)
[    0.865012][    T1]  ? __lock_acquire (kernel/locking/lockdep.c:3801 kernel/locking/lockdep.c:3821 kernel/locking/lockdep.c:3876 kernel/locking/lockdep.c:5237)
[    0.865012][    T1]  ? ___slab_alloc (include/linux/spinlock.h:? mm/slub.c:3550 mm/slub.c:3630 mm/slub.c:4631)
[    0.865012][    T1]  ? _raw_spin_unlock_irqrestore (include/linux/spinlock_api_smp.h:152 kernel/locking/spinlock.c:194)
[    0.865012][    T1]  ? ___slab_alloc (include/linux/spinlock.h:? mm/slub.c:3550 mm/slub.c:3630 mm/slub.c:4631)
[    0.865012][    T1]  ? kvm_sched_clock_read (arch/x86/kernel/kvmclock.c:91)
[    0.865012][    T1]  ? sched_clock_noinstr (arch/x86/kernel/tsc.c:272)
[    0.865012][    T1]  ? __register_sysctl_table (include/linux/spinlock.h:? fs/proc/proc_sysctl.c:?)
[    0.865012][    T1]  ? local_clock_noinstr (kernel/sched/clock.c:274 kernel/sched/clock.c:309)
[    0.865012][    T1]  ? local_clock (arch/x86/include/asm/preempt.h:95 kernel/sched/clock.c:319)
[    0.865012][    T1]  ? __register_sysctl_table (include/linux/spinlock.h:? fs/proc/proc_sysctl.c:?)
[    0.865012][    T1]  ? _raw_spin_unlock (include/linux/spinlock_api_smp.h:143 kernel/locking/spinlock.c:186)
[    0.865012][    T1]  ? _raw_write_unlock (include/linux/rwlock_api_smp.h:226 kernel/locking/spinlock.c:342)
[    0.865012][    T1]  do_pre_smp_initcalls (init/main.c:1483)
[    0.865012][    T1]  kernel_init_freeable (init/main.c:1678)
[    0.865012][    T1]  ? rest_init (init/main.c:1570)
[    0.865012][    T1]  kernel_init (kernel/async.c:297 kernel/async.c:284 init/main.c:1580)
[    0.865012][    T1]  ret_from_fork (arch/x86/kernel/process.c:164)
[    0.865012][    T1]  ? rest_init (init/main.c:1570)
[    0.865012][    T1]  ret_from_fork_asm (arch/x86/entry/entry_64.S:256)
[    0.865012][    T1]  </TASK>
[    0.865022][    T1] BUG: sleeping function called from invalid context at include/linux/sched/mm.h:323
[    0.865708][    T1] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 1, name: swapper/0
[    0.866337][    T1] preempt_count: 1, expected: 0
[    0.866679][    T1] 1 lock held by swapper/0/1:
[    0.867004][    T1]  #0: ffffffff83bcbfb0 (rcu_read_lock){....}-{1:3}, at: dynamic_debug_init (include/linux/rcupdate.h:331 include/linux/rcupdate.h:867 lib/dynamic_debug.c:1800)
[    0.867709][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.19.0-rc6-00039-ga6e60e2484be #1 PREEMPTLAZY
[    0.868476][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[    0.869211][    T1] Call Trace:
[    0.869455][    T1]  <TASK>
[    0.869751][    T1]  __dump_stack (lib/dump_stack.c:95)
[    0.870190][    T1]  dump_stack_lvl (lib/dump_stack.c:123)
[    0.870654][    T1]  __might_resched (kernel/sched/core.c:8830)
[    0.871152][    T1]  __might_sleep (kernel/sched/core.c:8759)
[    0.871671][    T1]  slab_pre_alloc_hook (mm/slub.c:4906)
[    0.872188][    T1]  slab_alloc_node (mm/slub.c:5239)
[    0.872680][    T1]  ? mas_next_slot (lib/maple_tree.c:4410)
[    0.873174][    T1]  ? dynamic_debug_init (include/linux/rcupdate.h:331 include/linux/rcupdate.h:867 lib/dynamic_debug.c:1800)
[    0.873699][    T1]  ? ddebug_add_module (lib/dynamic_debug.c:1578)
[    0.874214][    T1]  __kmalloc_cache_noprof (mm/slub.c:5771)
[    0.874768][    T1]  ? dynamic_debug_init (include/linux/rcupdate.h:331 include/linux/rcupdate.h:867 lib/dynamic_debug.c:1800)
[    0.875012][    T1]  ddebug_add_module (lib/dynamic_debug.c:1578)
[    0.875012][    T1]  ? dynamic_debug_init (include/linux/rcupdate.h:331 include/linux/rcupdate.h:867 lib/dynamic_debug.c:1800)
[    0.875012][    T1]  dynamic_debug_init (lib/dynamic_debug.c:1811)
[    0.875012][    T1]  ? dyndbg_setup (lib/dynamic_debug.c:1843)
[    0.875012][    T1]  __initstub__kmod_dynamic_debug__1505_1843_dynamic_debug_initearly (lib/dynamic_debug.c:1843)
[    0.875012][    T1]  do_one_initcall (init/main.c:1378)
[    0.875012][    T1]  ? rcu_read_lock_any_held (kernel/rcu/update.c:386)
[    0.875012][    T1]  ? __lock_acquire (kernel/locking/lockdep.c:3801 kernel/locking/lockdep.c:3821 kernel/locking/lockdep.c:3876 kernel/locking/lockdep.c:5237)
[    0.875012][    T1]  ? ___slab_alloc (include/linux/spinlock.h:? mm/slub.c:3550 mm/slub.c:3630 mm/slub.c:4631)
[    0.875012][    T1]  ? _raw_spin_unlock_irqrestore (include/linux/spinlock_api_smp.h:152 kernel/locking/spinlock.c:194)
[    0.875012][    T1]  ? ___slab_alloc (include/linux/spinlock.h:? mm/slub.c:3550 mm/slub.c:3630 mm/slub.c:4631)
[    0.875012][    T1]  ? kvm_sched_clock_read (arch/x86/kernel/kvmclock.c:91)
[    0.875012][    T1]  ? sched_clock_noinstr (arch/x86/kernel/tsc.c:272)
[    0.875012][    T1]  ? __register_sysctl_table (include/linux/spinlock.h:? fs/proc/proc_sysctl.c:?)
[    0.875012][    T1]  ? local_clock_noinstr (kernel/sched/clock.c:274 kernel/sched/clock.c:309)
[    0.875012][    T1]  ? local_clock (arch/x86/include/asm/preempt.h:95 kernel/sched/clock.c:319)
[    0.875012][    T1]  ? __register_sysctl_table (include/linux/spinlock.h:? fs/proc/proc_sysctl.c:?)
[    0.875012][    T1]  ? _raw_spin_unlock (include/linux/spinlock_api_smp.h:143 kernel/locking/spinlock.c:186)
[    0.875012][    T1]  ? _raw_write_unlock (include/linux/rwlock_api_smp.h:226 kernel/locking/spinlock.c:342)
[    0.875012][    T1]  do_pre_smp_initcalls (init/main.c:1483)
[    0.875012][    T1]  kernel_init_freeable (init/main.c:1678)
[    0.875012][    T1]  ? rest_init (init/main.c:1570)
[    0.875012][    T1]  kernel_init (kernel/async.c:297 kernel/async.c:284 init/main.c:1580)
[    0.875012][    T1]  ret_from_fork (arch/x86/kernel/process.c:164)
[    0.875012][    T1]  ? rest_init (init/main.c:1570)
[    0.875012][    T1]  ret_from_fork_asm (arch/x86/entry/entry_64.S:256)
[    0.875012][    T1]  </TASK>
[    0.875048][    T1]
[    0.875307][    T1] =============================
[    0.875808][    T1] [ BUG: Invalid wait context ]
[    0.876315][    T1] 6.19.0-rc6-00039-ga6e60e2484be #1 Tainted: G        W
[    0.877174][    T1] -----------------------------
[    0.877679][    T1] swapper/0/1 is trying to lock:
[    0.878204][    T1] ffffffff83ccd418 (ddebug_lock){....}-{4:4}, at: ddebug_add_module (include/linux/list.h:191 lib/dynamic_debug.c:1601)
[    0.879138][    T1] other info that might help us debug this:
[    0.879750][    T1] context-{5:5}
[    0.880110][    T1] 1 lock held by swapper/0/1:
[    0.880591][    T1]  #0: ffffffff83bcbfb0 (rcu_read_lock){....}-{1:3}, at: dynamic_debug_init (include/linux/rcupdate.h:331 include/linux/rcupdate.h:867 lib/dynamic_debug.c:1800)
[    0.881525][    T1] stack backtrace:
[    0.881915][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G        W           6.19.0-rc6-00039-ga6e60e2484be #1 PREEMPTLAZY
[    0.883184][    T1] Tainted: [W]=WARN
[    0.883576][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[    0.884654][    T1] Call Trace:
[    0.884990][    T1]  <TASK>
[    0.885012][    T1]  __dump_stack (lib/dump_stack.c:95)
[    0.885012][    T1]  dump_stack_lvl (lib/dump_stack.c:123)
[    0.885012][    T1]  __lock_acquire (kernel/locking/lockdep.c:4832 kernel/locking/lockdep.c:4902 kernel/locking/lockdep.c:5187)
[    0.885012][    T1]  ? kvm_sched_clock_read (arch/x86/kernel/kvmclock.c:91)
[    0.885012][    T1]  ? ddebug_add_module (include/linux/list.h:191 lib/dynamic_debug.c:1601)
[    0.885012][    T1]  lock_acquire (kernel/locking/lockdep.c:5868)
[    0.885012][    T1]  ? ddebug_add_module (include/linux/list.h:191 lib/dynamic_debug.c:1601)
[    0.885012][    T1]  ? __might_resched (kernel/sched/core.c:8791)
[    0.885012][    T1]  ? ddebug_add_module (include/linux/list.h:191 lib/dynamic_debug.c:1601)
[    0.885012][    T1]  __mutex_lock (kernel/locking/mutex.c:614 kernel/locking/mutex.c:776)
[    0.885012][    T1]  ? ddebug_add_module (include/linux/list.h:191 lib/dynamic_debug.c:1601)
[    0.885012][    T1]  mutex_lock_nested (kernel/locking/mutex.c:829)
[    0.885012][    T1]  ddebug_add_module (include/linux/list.h:191 lib/dynamic_debug.c:1601)
[    0.885012][    T1]  ? dynamic_debug_init (include/linux/rcupdate.h:331 include/linux/rcupdate.h:867 lib/dynamic_debug.c:1800)
[    0.885012][    T1]  dynamic_debug_init (lib/dynamic_debug.c:1811)
[    0.885012][    T1]  ? dyndbg_setup (lib/dynamic_debug.c:1843)
[    0.885012][    T1]  __initstub__kmod_dynamic_debug__1505_1843_dynamic_debug_initearly (lib/dynamic_debug.c:1843)
[    0.885012][    T1]  do_one_initcall (init/main.c:1378)
[    0.885012][    T1]  ? rcu_read_lock_any_held (kernel/rcu/update.c:386)
[    0.885012][    T1]  ? __lock_acquire (kernel/locking/lockdep.c:3801 kernel/locking/lockdep.c:3821 kernel/locking/lockdep.c:3876 kernel/locking/lockdep.c:5237)
[    0.885012][    T1]  ? ___slab_alloc (include/linux/spinlock.h:? mm/slub.c:3550 mm/slub.c:3630 mm/slub.c:4631)
[    0.885012][    T1]  ? _raw_spin_unlock_irqrestore (include/linux/spinlock_api_smp.h:152 kernel/locking/spinlock.c:194)
[    0.885012][    T1]  ? ___slab_alloc (include/linux/spinlock.h:? mm/slub.c:3550 mm/slub.c:3630 mm/slub.c:4631)
[    0.885012][    T1]  ? kvm_sched_clock_read (arch/x86/kernel/kvmclock.c:91)
[    0.885012][    T1]  ? sched_clock_noinstr (arch/x86/kernel/tsc.c:272)
[    0.885012][    T1]  ? __register_sysctl_table (include/linux/spinlock.h:? fs/proc/proc_sysctl.c:?)
[    0.885012][    T1]  ? local_clock_noinstr (kernel/sched/clock.c:274 kernel/sched/clock.c:309)
[    0.885012][    T1]  ? local_clock (arch/x86/include/asm/preempt.h:95 kernel/sched/clock.c:319)
[    0.885012][    T1]  ? __register_sysctl_table (include/linux/spinlock.h:? fs/proc/proc_sysctl.c:?)
[    0.885012][    T1]  ? _raw_spin_unlock (include/linux/spinlock_api_smp.h:143 kernel/locking/spinlock.c:186)
[    0.885012][    T1]  ? _raw_write_unlock (include/linux/rwlock_api_smp.h:226 kernel/locking/spinlock.c:342)
[    0.885012][    T1]  do_pre_smp_initcalls (init/main.c:1483)
[    0.885012][    T1]  kernel_init_freeable (init/main.c:1678)
[    0.885012][    T1]  ? rest_init (init/main.c:1570)
[    0.885012][    T1]  kernel_init (kernel/async.c:297 kernel/async.c:284 init/main.c:1580)
[    0.885012][    T1]  ret_from_fork (arch/x86/kernel/process.c:164)
[    0.885012][    T1]  ? rest_init (init/main.c:1570)
[    0.885012][    T1]  ret_from_fork_asm (arch/x86/entry/entry_64.S:256)
[    0.885012][    T1]  </TASK>
[    0.896451][    T1] Memory: 32541600K/33553912K available (24738K kernel code, 10275K rwdata, 11116K rodata, 2024K init, 14052K bss, 991524K reserved, 0K cma-reserved)
[    0.899956][    T1] devtmpfs: initialized


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260126/202601262015.5f498cb8-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

