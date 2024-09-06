Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DFD15852B
	for <oe-lkp@lists.linux.dev>; Fri,  6 Sep 2024 13:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725630705; cv=fail; b=OFOLUkIzzd51EKWumo/SqoXJL7P8rr4rNPuR3QK+d125V2vSk61TjqW1eIBF74Vs+eB/HOWu7J1Uk3JcnsvJaq9TiSw4IhpGc7w3NXHGwrbvOq+RDVvOuxDXCUj8uIPdpv9NT5D5V+tUADCM0+nGq96fv5ZNns5V0nSW3wbvjps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725630705; c=relaxed/simple;
	bh=wothmuI+EPne2FCssP60S00u4p2bQkGGzFYyhiwsr40=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=UUWW9lpXbqfSY1BtcbPorePb5h96GRz3NUZrHC+BAznPPXKkztbRvr9QY9uHPyrvUf0xO4XiFdpCU07Mf2ehdxkOdRYi3B9HaeTRFoLW6Xlkit1DGjKOi/XYDMqpeFdLTwe7Yw6CnrhTprf6C4W5EnK8cN5ydiydT/CKeRGJ76A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l0L5Bixl; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l0L5Bixl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725630704; x=1757166704;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wothmuI+EPne2FCssP60S00u4p2bQkGGzFYyhiwsr40=;
  b=l0L5BixlF2WaJyhoZ5vSnKae0/pZR+hnNQBpkVwAKrdt0BxTRC7zbbyX
   51i4ND1Cy9b6zzbu7r6sbb5hHLmJS7naPpTg8RrPVKD34tLfPNB5nqMss
   LEoueX9xkhuEOKE47TATqUReQ0izcTWpRZw123J32m+zT71Ihe3DSqdvb
   q+EA7i3USXrg1MHqRBsk7lgKgDOOHmRRrg0al2gc1CIhXPnRAhVqlxqNH
   lV54xoA8/xIYzCiN+O++NcjmoWoEp6oKpd8wbBycRchybWrLKxYJrOo5O
   DDBcm/L2WlvpC7Md+bW+7iURetEIqYeKLpDYpri/p3knQr1cm7YUdFMN/
   A==;
X-CSE-ConnectionGUID: GdQl6S6OSCqR+PUOzZdaIg==
X-CSE-MsgGUID: 5fswaQ20Sb2sxw44OVkpJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="28138216"
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; 
   d="scan'208";a="28138216"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 06:51:43 -0700
X-CSE-ConnectionGUID: NSYudNlFS6G0AtcWxQvJLw==
X-CSE-MsgGUID: YwRgXtVtR+imFSyfBZXmPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; 
   d="scan'208";a="65953393"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Sep 2024 06:51:43 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 06:51:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 06:51:42 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Sep 2024 06:51:42 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Sep 2024 06:51:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m0qV1n+5cd/Y5lE7AqkWb40mRVPpsVPGhCwN4aFLEk7ahT2JcfeNkLMrFLo1vx00NXHzTOKyTVvsmhzPKQbId/UYVsyhIr/BAanQZrT7nm4SI1zp6vIVD6Xg/BYKBPolrd5bSVoK2TBypdO/+9FZGtYcIMMEQTYIZ8Yme3VNR+TOHCxGolUJ3p+T8zXiyFLk7fAKJ7WjCmbo85XxLwAE37m4gkkZXah5Ui0bM/MqZUoiCGU/jy5vBK3TbDWHpkLRXwh1RQoXZ8ZlykIExU3DtwptVXhMn879D/sg5FwKlZ4m5zOgmIs8iPCt/oTfwPUll8k+DtKrgb0FC7ddl/coJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UOcvxq9zFaDUN7tLjg4ia+agqnILer1cQI+aAPS6rSU=;
 b=uR9RUJCVSxMZckhKMSgAuEro9BvIiMZ7Luc3Q/7eayGm61hA/hbEegPEQqZVhvAaMlCBG9oAgeI3v3AkON5CAVA6L8Spc8Ai7xhR9DPup0eYKuQhYq5u2MRFXeHxmzBlBXNcOExcUuJxhBKmbUJ9qr6LfveTPgnY49KHE93kf5KkNfoUJAdzzDA+zm5PBhowhxJMt5Egdjjtdy2yfdikkgIXmJADVXZiqog5+Q/Kke5QleBG+WJFp+jOfqSS9pAZt06fxCUqznt5rwabYMHDq+mNcHVICl7MG5hj7RA/SRHGu9/pSMSRtYUXRFKFvOxLaEDv0u8Gj0lsq18F+QvNDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CO1PR11MB4995.namprd11.prod.outlook.com (2603:10b6:303:9f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Fri, 6 Sep
 2024 13:51:38 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.7918.020; Fri, 6 Sep 2024
 13:51:38 +0000
Date: Fri, 6 Sep 2024 21:51:30 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Mike Rapoport <rppt@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Mike Rapoport
	<rppt@kernel.org>, <oliver.sang@intel.com>
Subject: [rppt:kmem_cache_args] [slab]  0e7b6c407b:
 Kernel_panic-not_syncing:__kmem_cache_create:Failed_to_create_slab'dentry'.Error
Message-ID: <202409062147.10d5e860-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR02CA0068.apcprd02.prod.outlook.com
 (2603:1096:4:54::32) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CO1PR11MB4995:EE_
X-MS-Office365-Filtering-Correlation-Id: ac88ca1e-93ca-40f8-8a7b-08dcce7b07ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?d5sPqlggYDoosrtjLoY88z6cXdsHVzyz9XngG8pX+L6Srk3aSHD9HDmIWYMG?=
 =?us-ascii?Q?3HN5aBGUCZs9fPXa2rYjrUwVuR/qRlDiCMyKCpknfWZQf7xKNr5XR1h60iY+?=
 =?us-ascii?Q?Tvc5Zd3lzKGCP+IP1AuEdbatcxQfxuQ14ijVKPKwPjoODpUP55DcSLzg9giD?=
 =?us-ascii?Q?VTBD1M+7htrlNBuRpzLXl4v2WQ0xouNj/MapTzgGzdDF/PhA+Z+XSYwNihL7?=
 =?us-ascii?Q?viRMb+xQAZb1aO20ysJiVNWfvmMXjqBW2cL9vzpuOeXmG3o85yK2r/QleVpC?=
 =?us-ascii?Q?5CNS533yXJpgVU0UKHGltKdRMBLSMmAMYxEBiXwsdfTlpPGul9XegWkDJT3P?=
 =?us-ascii?Q?Gtx7aHCmD0C/c8FBw8dlQry9Jy/0WJcUYYGlF9Q1hvAlSuiPC9Hcm6KpTHHD?=
 =?us-ascii?Q?CS5Twsrz4qwRZt1L/u+5BDYCCjpOU3LLpI6XY/anfhFhthXTqF2iUs0t5WRd?=
 =?us-ascii?Q?ZOaLM7gAvUgdXvgPYOE9Jzv1QHT4JyJ4HFJFApJ7DcDwCdoLpxM8P6dSyxH4?=
 =?us-ascii?Q?7Gg7Xr2KgqHVR1we7U9d3y5zIsh4QlaaTt4wny2sHOpQFRNuflakOjKFHzQ3?=
 =?us-ascii?Q?18kGxoonJjT0ni0Keuq8mMdlGz5QeEV5gLF3wBzS6lnkUC99ItsgPgo3cq4c?=
 =?us-ascii?Q?ecFGpW3DnRIsh3uTE4jruZSL2ABtx+qZC07APzOjLxMVYl28PeGLK4GpKDTD?=
 =?us-ascii?Q?RHSPawWZV8bBM+PAhqPmjNfs3bTAEP5sLBELszA7M9Gx+r5ANgWwZUZfoBj1?=
 =?us-ascii?Q?/upo58BtCpe1hYbHnA+qyUTGZBBun6TX6ALiymA6Guin9yw3WkbluPxwwfu8?=
 =?us-ascii?Q?SL3IYFX/SoDbl87z0c62q4kWDmNgpzVkRxaGso/Do11jgcpjOPO+P5YVTRFl?=
 =?us-ascii?Q?GxkSDCNuSZMC0zsjQMEatW1UFWGZe3NJkvDA9MP/wu5Qlty5fNpNKo9ZzEAg?=
 =?us-ascii?Q?3KbNapB2zTdNUznx37UIqF37MB4Ml55HkgCzWpa7qR3Q8a+Btaf55XQNZ20m?=
 =?us-ascii?Q?i2OU+TlwvqOx52zBNyCyFiD72wosepwx1rrg3fXTj6oktTRaEyJzCTIrENHy?=
 =?us-ascii?Q?pcv79dGaIhwbKTESxVEXnjOoNW/o/JNnH+O4JdtJFgkq6Sa69gtXGMJnKPql?=
 =?us-ascii?Q?CBnoXh1+eSLrO5KRHMUw+xUbkB/m4VQBbzgl6+mymXi4700yRq9lxEwRxSnR?=
 =?us-ascii?Q?m/Lq6TU2YszrQIUudL11CVhxotWuBHImNsSjGu9TLOCJnBbvP6+O33o5ny5p?=
 =?us-ascii?Q?QHVHig8VNbASlbJE2RNg6SDtPVBtl9lwWqqbFKRZSGVh2pMC1phvYWHlFmIv?=
 =?us-ascii?Q?z0m1p0IX3SJrjMkpCeR532VGiWRmVIC1yO3iX4vfr3sw8mET82BoDIOoVav3?=
 =?us-ascii?Q?sKGkp3M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Nsyk75U6Loe5G98Pk6ws/mckEhW2z0ZEXhU1/GUsegxiyb7eUHdw+mJz2O52?=
 =?us-ascii?Q?SfdVMAfVJk0GyY4nsyl/c9FqQmMDeZaTduTBVSDLKsFy+S4COgIGVv8qX/EX?=
 =?us-ascii?Q?4lgPTZM1FBjKi3HuLX3F9BXGcspfBb8LguoPRfFUYmhhbItjy2iHgm70Ermr?=
 =?us-ascii?Q?hQqYTjMmQ6v4gih5+455l0eTR2oMds84vU6d/sC4dK0Als4O28Z8zr58tFqK?=
 =?us-ascii?Q?npaCy2hAPxSV6eje9PndSIiux2VAHp0gDFt83iuV0zu+A657Sya5q759s8Jj?=
 =?us-ascii?Q?trKbBvL/jRnISfFwYMGWYk3ETM4TKWmE5gkU1jOuOXDsF0vva11IMbZ0/Rti?=
 =?us-ascii?Q?fIdrH3SRSPZ7n+i0qwLjdctsi6ZV5eFhCXUo3nplIy+wJrTkWjaFOHzpAG3C?=
 =?us-ascii?Q?jE1cmaJH3LOm/odEI+C/TBLXBY1ikQ89s/lEgzIWuYZJDfZubDX4N6qNaW/l?=
 =?us-ascii?Q?ERjKoBM4QjiYGPb7p9JV1S9lvYaBnXSjT+K8PV+Z7P3fnJkhj23BwYOapvLJ?=
 =?us-ascii?Q?8VP/dijlnaslaWfzfp8JgNQKMJctJk6PuiBXRRrpH0D2i+DCFiArJr//N+r1?=
 =?us-ascii?Q?yEud8fK8qLSSat7csjm8AwGGtdnUygUKwmdmhxeH2ALD/LxDsB1fQn0cYykI?=
 =?us-ascii?Q?rmcogyzyGguLcsJi3VnDCktoOmv/+6BFrJXmndjqJwQPsjaBGPdTQCeLTVCr?=
 =?us-ascii?Q?TJ8sRN+utx0iZz4DCZayH8vlPSj/gnUXQeMo7hiZqxA7WbFcOTLw9OyezLDB?=
 =?us-ascii?Q?+3jn7Fie/HPRkb7zayrzxzUDFDZ3LqVLmg5cLn2obK6dnQd1uJQXzCnvwKHJ?=
 =?us-ascii?Q?ZZm1HTQbK3JgOZEXn2QF7ptqhEswmEUizES5RSz79yVk3roIDG+gA535UKQb?=
 =?us-ascii?Q?QGjaTQ89P4bH/FBuG+Vr2Tte1EzzO+PcQ59WI58SPAyW0bLX+Dl1L3qPRvBe?=
 =?us-ascii?Q?Hhnz20KqDMIImClpNLwfkdHlKFvl/MCVJOTBYHOgIORvHUwUToVZ1npm9E0l?=
 =?us-ascii?Q?ZdYsLZ7kIDNryqq9FwgnK9GuGsmGoXCRosVZUDWP1FMspFHfW1uLFXIBcDBc?=
 =?us-ascii?Q?bBgUsG63GIaiQxJjWEgpopaVotjt1rDNcitnkUBEIOxuSnDE82CXcpAJ97G7?=
 =?us-ascii?Q?hNRCoHK+Z07QBQraSU8WvEwXZRL3/FC2PbS8KOYXcNbTvm/2ydfQ3srHvrsE?=
 =?us-ascii?Q?TUgex+NG0aYYz3mnmTxaK+fQ9chHAHCFcmEHdQfIYn/PUvgXumLkylKD4+1F?=
 =?us-ascii?Q?3FgWJEy8hQGVPYuzZUK/2bCrzhbs9xjSi7LtDsJfC1KEwh36e41f3bxl737/?=
 =?us-ascii?Q?cIVw+WgNgS/qKPlk/n2f+hqwOerybJFCj21Yk2VHSs92aB6J9ypoiosSKDS5?=
 =?us-ascii?Q?wO6P6fxRZmAmvBgwpUe3e39De/o4wyj1Qch/DdPFYE7p4Kmei1JnV7/FlbRF?=
 =?us-ascii?Q?quGT9b11dyxqb7UavyKOcD3ucqvPC5lK+G/+6nnX1MNx4eRunuEeeehwGnmY?=
 =?us-ascii?Q?jgOV0xFMOyIC0qQH+WTwXBpQkA137dhV2PGoY4Gksf2yJJz3a1Nt3LPY0FEj?=
 =?us-ascii?Q?/xbcAEe5gJNoSzjXNTKiYf4ThPmmMUd2fR5YrtSylLvpno3C05zW/wEnun+A?=
 =?us-ascii?Q?bg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac88ca1e-93ca-40f8-8a7b-08dcce7b07ce
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 13:51:38.7810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xK95JaxKivJLu6wITy2lvGBBbPFA/o2NdL2Y5iDWmYdwNPk0qjdeddr2o0euIn09eXFkFSKUXEiKrCfe5XNVFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4995
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "Kernel_panic-not_syncing:__kmem_cache_create:Failed_to_create_slab'dentry'.Error" on:

commit: 0e7b6c407b3de4e1414db4caae9f27a73e205e73 ("slab: port KMEM_CACHE_USERCOPY() to struct kmem_cache_args")
https://git.kernel.org/cgit/linux/kernel/git/rppt/linux.git kmem_cache_args

in testcase: boot

compiler: clang-18
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+----------------------------------------------------------------------------------+------------+------------+
|                                                                                  | 44b4217834 | 0e7b6c407b |
+----------------------------------------------------------------------------------+------------+------------+
| boot_successes                                                                   | 6          | 0          |
| boot_failures                                                                    | 0          | 9          |
| Kernel_panic-not_syncing:__kmem_cache_create:Failed_to_create_slab'dentry'.Error | 0          | 9          |
+----------------------------------------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202409062147.10d5e860-oliver.sang@intel.com


[    0.738866][    T0] Freeing SMP alternatives memory: 56K
[    0.740773][    T0] pid_max: default: 32768 minimum: 301
[    0.744036][    T0] LSM: initializing lsm=capability,yama,apparmor,ima,evm
[    0.746097][    T0] Yama: becoming mindful.
[    0.747822][    T0] AppArmor: AppArmor initialized
[    0.749939][    T0] Kernel panic - not syncing: __kmem_cache_create: Failed to create slab 'dentry'. Error -22
[    0.750760][    T0] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.11.0-rc4-00014-g0e7b6c407b3d #1
[    0.750760][    T0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[    0.750760][    T0] Call Trace:
[    0.750760][    T0]  <TASK>
[ 0.750760][ T0] dump_stack_lvl (kbuild/src/consumer/lib/dump_stack.c:121) 
[ 0.750760][ T0] panic (kbuild/src/consumer/kernel/panic.c:288) 
[ 0.750760][ T0] __kmem_cache_create (kbuild/src/consumer/mm/slab_common.c:320) 
[ 0.750760][ T0] dcache_init (kbuild/src/consumer/fs/dcache.c:3178) 


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240906/202409062147.10d5e860-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

