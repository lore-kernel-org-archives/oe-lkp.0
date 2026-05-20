Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E549370AC1
	for <oe-lkp@lists.linux.dev>; Wed, 20 May 2026 08:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779265928; cv=fail; b=itSd5zpgsrcFx9/UUGrCas32x/rKe/yJNxdHOOJ8EUc9rhj/0cjOTy+grb8tC6wsZXMs90RzfTCHtiBN+NXv2TX0H1gPGN9/tKwU/scnccTtGxFgqdCX9IfR0I73SAbZO7dtrGD1I7kEXwo+5LYeAhxeZbAXexfu9mUWfcDXn3Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779265928; c=relaxed/simple;
	bh=RfeCSHwLnnED2p/iMrUcKxeleSIBYVFau+QeEjofDBg=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=i7TpnIinkXBr+dunMjYQCucOQj+oauAP8uz3AqWmrMXrSUrAUnBn2VrgNd+3gNJrlTHzhPSrZOCCr5JusCHg3vS3T/GdXorvDhXQooVcB5Xnc/RrEVZFG0OqsMifggbbQLPSsYTLyG4zVMDsrk1CO80L56TyiNHUWfVjADswroI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EocnZzqS; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EocnZzqS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779265927; x=1810801927;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RfeCSHwLnnED2p/iMrUcKxeleSIBYVFau+QeEjofDBg=;
  b=EocnZzqSy6rIxA/wkJDliGJHw2cbsm5ZTUgE9dGIHCwu4yZ0YABe0ROh
   yPajIIrgFhuK7BgoB9nCBVy1QA8+2A500tbfv8yCNezhZ4DMGCuKbgdSc
   UyYaJwAUmfCbbTr78H1qtKpIcIQ8bPz1ZNYvtFE15KfCUttMRSvE6CNfm
   6x8VHYkQ3fMRGb1YvrvusWh1/U0pr9CH2AuUwE9USNPywHEJ00TtRSM82
   z0VeJH+p06lTTz0IeSQdMxj8kEubZlwFXC6NQvHE7vFN6sKVgMwmFZUuQ
   qPo89DhwczMt31WLxN74C4LUxW/y9kSDq94bIoYwwgN+SCxQe49sH8QBE
   w==;
X-CSE-ConnectionGUID: uDX3GoGTRwKBP8GcZkb0BQ==
X-CSE-MsgGUID: rEp5d4hITi6SLjOMTH/nhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="90854458"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="90854458"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 01:32:06 -0700
X-CSE-ConnectionGUID: 7ZNxDE1RSEeEWpJTMp0hhw==
X-CSE-MsgGUID: KdaCP7LhSse13IV3YnyWTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="240337535"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 01:32:05 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 01:31:58 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 20 May 2026 01:31:58 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.23) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 01:31:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=do8sX9jXpTa1cF5Lw3BIA8DcWcXNmmGZABudu1MXDwpHVASYNlFJQL1L+qyfiAHpO6Sud9yujPv5KBZ+w2hwEeQKYH9qTNGTCiMir2DlZwiA19tGmMid6QgqBml+jPvI2HeHqEdzDITgupsqpYuWGswwJo8jB8QhllfRq1R7INXW/0R1lgo6ON6nWEBlyh1PaMnBh4wNvvky/7dk9iLCJ1UfxaKQzcDE83e23lGy6sL0ydCLEBo9awN2QhwXVkmJFOU3qHP8x6gvnhDBtGNv4uIVTwLsw8+GbBmoYrqJOCIfyCnd3AZqG0Ft1RypzZy5RLCqYaIBrLbEurdUoOJHsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dp2U/aL5z5P7F70I2k5Gu6uV6wmhM2eKgLQwo4twvVk=;
 b=d9u7fTsdYshIUPn/AJnkCh8io5AkkvmNfoYuL5e+kpr03kt+fo6qVO+ZwX0WCz3wgloHExRLnF54wQ1brI0GyXNqUoNhmRi5BsdEbKQMS4lN/24OFfhEp0dLozNV2o2y74G9DdQB1p6iVIN512hsI1eMNqdYXOc+vXB3QkNTCqn/6SuDQFPbaFOUkQN0mQvCSk10HdjejbjgN26r9ZbS52v23m0tc+Im1ajkeNbGYnYh9hENZx/GUgrFyG2ztsfxLVuEP0XJQ1nU4K7mgTGBAeurq5+J1VWqJ4aFpUoQ/LizHxh0yPMlRnuJY0z41k6GVhBLnTOYGtxtQnzxncdz5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by DM4PR11MB7253.namprd11.prod.outlook.com (2603:10b6:8:10f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 08:31:32 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%3]) with mapi id 15.21.0025.020; Wed, 20 May 2026
 08:31:32 +0000
Date: Wed, 20 May 2026 16:31:23 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<aubrey.li@linux.intel.com>, <yu.c.chen@intel.com>, <oliver.sang@intel.com>
Subject: [peterz-queue:sched/flat] [sched/eevdf]  d464c12d2d:
 Oops:divide_error:#[##]
Message-ID: <202605201620.d44e2cd6-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: KL1P15301CA0028.APCP153.PROD.OUTLOOK.COM
 (2603:1096:820:6::16) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|DM4PR11MB7253:EE_
X-MS-Office365-Filtering-Correlation-Id: 3081e5e2-64c7-42a5-96d7-08deb64a3278
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|18002099003|3023799007|11063799006;
X-Microsoft-Antispam-Message-Info: dpxgZuTrEBD6fYenI+7YPw/1qti5X0MuiXPyQGMGE0LqbQllZozETCQvDJpFQm+AwREDOjocoxUvsMuv4ddE7/W+mIMgYoYjsXL/VRXyvVHybuU35SXxXSRgso65WN9FEBnYnkdQ5PytykMxT7T3QNcoJ0aczvq+2RwalJHrAdAcml8wWmGu6u57IOsBQpxrOVdDDuosuHRYmVvFNhFwDmZbRd4BdZCFNujYRNXAW507Ecp37UcIXYgjYePb/kjwzBjSoOYOex25WOJcIsZa3CVgBMkIP3/4OHnf73kckG+5IWWSSVpfHX2+G0R8KANw+3xvdDwibeGtj2UcF10Ov43FeVGJf4yeOqW6DSEh6S5zc4eI34B67EbHXsiMd3SMxPYJQBFUoV74ndSHdogwKrsq+xoqRHVo94h3oJAvW7OYKqwucHAvIE31SgPFTloRuadBQPxapH1MExCOmttkk8tGYU3MHpEXWLcnamXQJLiGkrL4RUFURYHha1I5VEoi5me5rK3UO7Jl0+JbCLYwiDUxGCpBoAvHk1rUoVF8dGhMfOHPdU/fyqArx8GyVjQ+nYODPFdMybF/eIw3GPqQj2gOPpNrpY2VWMwmRbZx7FlRS78AbxQOY2zuQkAulQx78a+oCMDQaqpseOlwTQp/NQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(3023799007)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ncbEIH4ZQJqzWqXrB7btTdKmpjt/ZnkJRbJV+9dH5Vfg5ECQE7DSS4j+rogW?=
 =?us-ascii?Q?iCKSI84u8PWX+777+70e57/N/gi1bCxDjUYyXAN2OThT8WZZ/nB5mnFs1HtY?=
 =?us-ascii?Q?SimNeTVqQPLEcKCtQV7x07wQNXyV/+cXMBHu/2wuNGP98s4chS/bNIej3y6/?=
 =?us-ascii?Q?UrXiSx3Q+C+tTyzKg5yjMEom9xJSGUIDncPIkriIpvfdH6zsJSudTMldaxan?=
 =?us-ascii?Q?6TWzcY5agcazWzPTEFO/xHcPBg7ijj8vBg9DLnj+yffoRji8NQf83aDfx00T?=
 =?us-ascii?Q?i5y9P/QBaRXKeQJZh6cL53m0v69XcCt9/luVcyD/u4jOPxpPA5uv3woSIQ6j?=
 =?us-ascii?Q?MXFHnF46GJLc031tXDWe7hmfXTehWKTolMy3MXDfeGKWsO2KTWZG9FfGit4V?=
 =?us-ascii?Q?3npb8jCTNVdeRJcH2Q7UddP5CADlZds/VFZ02MeOCQ4LWVM9oe2jYplNmLg+?=
 =?us-ascii?Q?ByC15/CJX3O3s6SjvE7VquaKELSJhB1se3HyMLwjGE7Hu61nb1oO/q77CmWe?=
 =?us-ascii?Q?avfbp1sPT9asPBg3Synfg3rV59Yw0Y1GzFZ46TWpsUtnSbS2a1Q2436U5ZvP?=
 =?us-ascii?Q?z1uJIOtdVqA+qGTF0B0EiM9pGDYGMp8nj5vpvolm07S9OeNsW3xMDTFI0oYk?=
 =?us-ascii?Q?9PYNorDMZCwhu+beAx8iQkjaSrY4F+YxF97SpV0IgaiWpDW6iNkMhjc0WErt?=
 =?us-ascii?Q?w5Vi+5sJDaATln998rxUZWpIfFEABKOsfLUwWO6ld22A6OtJQvHGJqdKUI5C?=
 =?us-ascii?Q?bE4M8WKSlNkcpc9WU5L+Fy+8XkZUfBc1YKDQhxCxqwbgFYGllJMOt2fkuzz2?=
 =?us-ascii?Q?GMnPtdXMmHd4r1i+61K08XusaZBo9iIJNleeda29hFZyNO5xY1FYEINArCdJ?=
 =?us-ascii?Q?cOoy5SIT1PKv2T6tqYOiY+PEB3uinl/8HC7axSkUbLeGGmRlNkyrFh4Tc3mI?=
 =?us-ascii?Q?yust3QH0+LGEnOAkNQiytfOYdOceUi9cdllks3iAf5/YnksiQ/3kZWMMkqf2?=
 =?us-ascii?Q?+L/0jU/XQh96N+6pJXCpbXgm5kgZIYMN8OMcnmeztFSDEr30nBQkvbYaWlNo?=
 =?us-ascii?Q?7ZLexJF2rDmev7757Y+LJAyLpvQMk0p/Fcp6e0BLcKl7hVcR7FKsWG2pYVpT?=
 =?us-ascii?Q?melsMlIKtzOJaadPI4dp1tJzHsTYD+8KFfxEMqBYJ6OPItfgBNmtfVz4Ckvy?=
 =?us-ascii?Q?OrhZF78aelDIl8RR7avsE1T9z1GvIsbtBpdHrJAo9RB3n/X6pCZHnL2iJYoE?=
 =?us-ascii?Q?p+D8UDa1kez00ajbjMCXw11rnMIIJLUlqX4/+nMj6ua/3EugGg50ifbyoZ4I?=
 =?us-ascii?Q?1Uz4Gf7lVIJhZFw6WRZhNRpxvTgSpCcGQC9skdJa+vzhMM7Vybo9xVmTlM7R?=
 =?us-ascii?Q?wqQWIAKUnqF4BG4PWtKS8jEG3uZem9EJA/CkMP7i1uKxR64gH8JtIMNtFoB9?=
 =?us-ascii?Q?bTUsrwvLz7RLJN0+NUVHWoKSiTkPTRQtmdDNK6QMXB4yd/YaCtotrHPnNGEb?=
 =?us-ascii?Q?ARzRG3Ze3dsRwWjUzBvzCF9b9PrEF9ahmlfK/NjcevGqw2lIa0a8J73d1lkq?=
 =?us-ascii?Q?PtGqCZfHEUOTXBGts18+Rzg+QbNIrLVC5XXBOFrD3iqrj9907GFkSVNhQg90?=
 =?us-ascii?Q?itegE6C07L398YKLfYSpLsGW7I6XFJQXyqHojj8ED3FYndktSLI8vJehNdFh?=
 =?us-ascii?Q?Pun0VsuA+12y5D5Mcc5gvUvbGBsgC+PmlwM/htGqRu/0SXXX/TDk+pvOhYWW?=
 =?us-ascii?Q?ZJMuttWrfQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: GL9TYyHUgSJW+2TLJUZxLSnlHPPuB+fpI+mLetUKP0XH4/X9cKeXEmvmNcqG6tYb9e31uR6aFrBuraUJ8kOZbGAAlG+oIXFpCDR/iTmnjOkEzOM9aReVnYd9Pbk/DWIE50hmTtm/p+U1tOWJSh4jIWbXZ4ayAsdaZzIe01yG+Jaa4TYhyWPe12jDDWuXcEHLRfH11J1NV44lHiJVV+1qg8cUWI9h8oaTsWeOiOiICxdrYdXg/AVqwWVKBd08t/v/MAxKWH7aakIswslggr4ghD0/PU9Y9OxO6ll3PPo7YZUcnM/fOf9Fw5GgrLVC5qGBld9ZpYmcbbXJnl8eMd5dZA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3081e5e2-64c7-42a5-96d7-08deb64a3278
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 08:31:32.4783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dPSuoKfYnRSDf0Gd2eL1aYsOrtckh6diViFdMdECeAbuODNkd+V4y//vu7lMMfOjiMz4D7PmiUiGpI6OEMNZMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7253
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "Oops:divide_error:#[##]" on:

commit: d464c12d2d0562f4cc32bd0e62fad20f0d87e9ff ("sched/eevdf: Move to a single runqueue")
https://git.kernel.org/cgit/linux/kernel/git/peterz/queue.git sched/flat

in testcase: boot

config: x86_64-randconfig-005-20260514
compiler: clang-20
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202605201620.d44e2cd6-lkp@intel.com



[   16.137634][  T102] Oops: divide error: 0000 [#1]
[   16.139003][  T102] CPU: 0 UID: 0 PID: 102 Comm: udevd Tainted: G                T   7.1.0-rc2+ #1 PREEMPT
[   16.142054][  T102] Tainted: [T]=RANDSTRUCT
[   16.143709][  T102] RIP: 0010:update_protect_slice (kbuild/src/kernel/sched/fair.c:290 kbuild/src/kernel/sched/fair.c:300 kbuild/src/kernel/sched/fair.c:1070)
[   16.145953][  T102] Code: 49 48 48 39 c8 48 0f 43 c1 48 8b 8e 98 00 00 00 4c 8b 46 10 48 8b be 88 00 00 00 49 81 f8 00 00 10 00 74 09 48 c1 e0 14 31 d2 <49> f7 f0 48 01 f8 48 39 c8 48 0f 49 c1 48 89 86 98 00 00 00 c3 cc
All code
========
   0:	49                   	rex.WB
   1:	48                   	rex.W
   2:	48 39 c8             	cmp    %rcx,%rax
   5:	48 0f 43 c1          	cmovae %rcx,%rax
   9:	48 8b 8e 98 00 00 00 	mov    0x98(%rsi),%rcx
  10:	4c 8b 46 10          	mov    0x10(%rsi),%r8
  14:	48 8b be 88 00 00 00 	mov    0x88(%rsi),%rdi
  1b:	49 81 f8 00 00 10 00 	cmp    $0x100000,%r8
  22:	74 09                	je     0x2d
  24:	48 c1 e0 14          	shl    $0x14,%rax
  28:	31 d2                	xor    %edx,%edx
  2a:*	49 f7 f0             	div    %r8		<-- trapping instruction
  2d:	48 01 f8             	add    %rdi,%rax
  30:	48 39 c8             	cmp    %rcx,%rax
  33:	48 0f 49 c1          	cmovns %rcx,%rax
  37:	48 89 86 98 00 00 00 	mov    %rax,0x98(%rsi)
  3e:	c3                   	ret
  3f:	cc                   	int3

Code starting with the faulting instruction
===========================================
   0:	49 f7 f0             	div    %r8
   3:	48 01 f8             	add    %rdi,%rax
   6:	48 39 c8             	cmp    %rcx,%rax
   9:	48 0f 49 c1          	cmovns %rcx,%rax
   d:	48 89 86 98 00 00 00 	mov    %rax,0x98(%rsi)
  14:	c3                   	ret
  15:	cc                   	int3
[   16.153728][  T102] RSP: 0000:ffff888130197c10 EFLAGS: 00010046
[   16.156049][  T102] RAX: 000000aae6000000 RBX: ffffffff836824c0 RCX: 0000000000000000
[   16.159060][  T102] RDX: 0000000000000000 RSI: ffffffff83628140 RDI: 0000000000000000
[   16.161885][  T102] RBP: ffff888130197c30 R08: 0000000000000000 R09: 0000000369497ec6
[   16.163874][  T102] R10: 0000000000000000 R11: ffffffff813a0700 R12: ffffffff83682520
[   16.165864][  T102] R13: 0000000000004261 R14: ffff88812ffaa000 R15: ffffffff83626cc0
[   16.167651][  T102] FS:  0000000000000000(0000) GS:0000000000000000(0063) knlGS:00000000f7cb9740
[   16.169702][  T102] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
[   16.171179][  T102] CR2: 00000000f7c3700c CR3: 0000000130150000 CR4: 00000000000406b0
[   16.173009][  T102] Call Trace:
[   16.173803][  T102]  <TASK>
[   16.174479][  T102]  wakeup_preempt (kbuild/src/kernel/sched/core.c:2256)
[   16.175457][  T102]  attach_one_task (kbuild/src/kernel/sched/sched.h:3027)
[   16.176470][  T102]  find_proxy_task (kbuild/src/kernel/sched/core.c:6800)
[   16.177605][  T102]  __schedule (kbuild/src/kernel/sched/core.c:7108)


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260520/202605201620.d44e2cd6-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

