Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0022F56B81
	for <oe-lkp@lists.linux.dev>; Tue, 30 Sep 2025 13:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759238790; cv=fail; b=RjOg60yrt3w1LC5Lllc7H9bJuyO6GVVHxgcxecn9zHvpzu2BxkZgya0SSUBtPBY5U1BIHc8lTZFt/EG5Fzp+NvAdd1pML8vByWx/ZygsD+3aHM8AngTBRimiwibFjopbOovJ5yndyCT2fRxmHR91e1ATPFyawH6dXs0saLlsb0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759238790; c=relaxed/simple;
	bh=c9myHjALMtsNY+v4MlqtOO6q+J/fDBiar6zsK/zNvnI=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=j7FRDZIhQmnbN0Ux+mXKK1tm4GN+p9HJmFrUNTWnbIouv0/3Y0By0oEB3vM2EUTfF7bsKhwHNAD7RS9+6LEdLbbPYFsUFCpCVqpzfzeYOcCMboRd3qocq1L3b7WoTjAX+/4U64+v0gJWGAldjpWxdAzw4WpyjOH8a4bQE1nVHho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P3ie4SN3; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P3ie4SN3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759238788; x=1790774788;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c9myHjALMtsNY+v4MlqtOO6q+J/fDBiar6zsK/zNvnI=;
  b=P3ie4SN317qVbeLBVGk1kuS7Osz4yvzv4IRT+NYJoCbL8cPWcWd+mU/9
   ynKkPUWbgyPCjy0SzslPKy/IVTtTDkoUEmMw+E5Ex0h7ydRqEw9Yh7UBr
   AUr/6Dx85ymX5yWG453A0r7CUiH7mHmmFC12P9clLS7tW6/tf8SfDDzV3
   NUf/CE0pvt4dGHnImJhx9nLU3UZC7ECQ0rBgCrpETWZBOW8ylsPhP2F3l
   /WheYAZVeloOaJ8K9syHC0c5Xpi0y22C2vdYsI3WRElY/s5ETOu3kqEae
   /FvzpvmKl3vOsXZkeEsVuVvhYBUnIL/7UNEh9/fkzxGJc7xbmidf6SlAi
   g==;
X-CSE-ConnectionGUID: 0LCNLC2STcmeCIPGXxgOBQ==
X-CSE-MsgGUID: 5N+PJqzlSLqOOresPheX4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="49055041"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; 
   d="scan'208";a="49055041"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2025 06:26:27 -0700
X-CSE-ConnectionGUID: 8BHfup5dSi+528BYVAgWrg==
X-CSE-MsgGUID: jiglFYhAQRyxe56dh84INg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; 
   d="scan'208";a="183701054"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2025 06:26:25 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 06:26:24 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 30 Sep 2025 06:26:24 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.42) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 06:26:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NMkWO8YASjT+jMUgngy1dtwTg4ahaj4g7tZMKLskE4REA9jtt02dBVYkkAZisoK5SPRvR0TPYehY1P5AxgKM/CBzhQpb7V5L+4e8ePiTIqoVgk2iCvmoiz7Dh2TtEO1tcKkbiqzyYXPxKbA8iJO1EvIjaMZEIQcZPOM1b+v3KGjptAk6jWL1dHP7ADF2XWhOhy87ftsQYHYx6jks+JgSTFyRUIvl33/HHurl86y7BuoY8uaV2oFk40Dgzc/pckxjpqVXD+cw4VZ9hmTLWxwMSEy9D3vyEJ20dVKRUuPeDdtdUboguWak04fHfjOXZMyeaHUxyr7tjYv8a6pfrWPv4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9trekciE6X078EgoGR7IP8Hm/qT1kIDmDYRzQh1ve6c=;
 b=xVGAvVSl3kTQberLtGc9dUFg/sTM2zLPPLL8PlV32zZzHUm5LRr+HvKlIih5t19WAc/0+97EVbFf3lYK2/l3NKua6pRbAfYm7EDOuUvRg1DDLWmBOZud9P/kdm9GeTnNz4AdDwUnRL4LnYtAuKq2e8aSEv+OiBvPoYs2cjh/0T8k2OuNKtH321N2CHyZsWcAzkwykj3UcLaP1i1NtumeQLKhCEMUragusvLbjPAE3dAK0BQ3ni0MkjAPtMyArAqBR6oOpJuns2+K9FTW5qWV/qVF0v/ScGMZ8fOA4YwZ44Yidy7APhhEj0RqwvUBUXHek2odb05h9iJvnz4am1QjyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH0PR11MB5901.namprd11.prod.outlook.com (2603:10b6:510:143::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 13:26:22 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9160.014; Tue, 30 Sep 2025
 13:26:22 +0000
Date: Tue, 30 Sep 2025 21:26:14 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Chao Yu <chao@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Chao Yu <chao@kernel.org>,
	<oliver.sang@intel.com>
Subject: [chao:cleanup] [f2fs]  06a400ed17:
 Oops:general_protection_fault,probably_for_non-canonical_address#:#[##]SMP_KASAN_PTI
Message-ID: <202509302144.af1b7a00-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TPYP295CA0009.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:9::8)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH0PR11MB5901:EE_
X-MS-Office365-Filtering-Correlation-Id: fe7fbd60-8ff8-4e34-40e4-08de0024f280
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BeYY6HRRaArprxUl2p/g30/TgkYqHomSh+LaIj3h7euhQIzH1WFG88Xm0by6?=
 =?us-ascii?Q?q6v0m5O88I90jJF3aS1ab/i4ykgHu+9zphhBmVGPRqnlsD5izaqnJ6exmn4x?=
 =?us-ascii?Q?mfO+0+x/3gUIsbeiqs6Zox5vC2gt/B3kq9tyoQ/YX+xyXOzjuG7EzcFwmG/g?=
 =?us-ascii?Q?FVlphdMY80qhQ8iAJnEVN35avoFZcTDuYwiSmNHR5D8kc+jGJF3xvzjwmlaF?=
 =?us-ascii?Q?sRBvjFegzRz7Fhd08wSqelporHPf0myBv0tD+KbUk4BoRUEGIAF1UQorweeg?=
 =?us-ascii?Q?e/nsZPETmAsJqffS5l8CkaIegvy3MsJ7nqK4NsjgHjY3IxfMiIb8YXtmpsAn?=
 =?us-ascii?Q?sF5IcsWmSLIk4Cgfqo+0lddXlZa1ybMBgfOnikplom2Chm6Entl4/gTH88G4?=
 =?us-ascii?Q?IemhbuDbWXwIQNQOcBw+b0S0f+5iOH5MzUR5MuHpJEiI3M1iKAjReE304wE7?=
 =?us-ascii?Q?rWqgRUWVFypyP4kQZ7WOhg7KJkgJotIy01J2A5iH5kuOCUVV9TFFHHH50cZd?=
 =?us-ascii?Q?J1FS5Fz8RbPpC47dQtpN33xBnjpa4CA1+4nkxLI7j/nSalZgGqFyUHHgm/ox?=
 =?us-ascii?Q?KINon2CdkWaXNrlyECZ55ke8tVNK5kfgoSG/wtzuRSZja3VRzIh89LJyjjGK?=
 =?us-ascii?Q?cgq9K37X6AW965W7adnCAfzVagXXBWeLuyIfLfc54BQPotmnHspvAnomUnmo?=
 =?us-ascii?Q?w9ozBCQ1AKW3dZdXHXdF14pr1kDSTo5+aFh8ypO6AI7cK0/o4rXD9eMQQFh2?=
 =?us-ascii?Q?At6MPcs8n6Orn6IBO2/o1lP/9/ADmmErkAzfn/HERI/R5lr2RN4fMYbQzldB?=
 =?us-ascii?Q?caidKh5Pv0K+AJ4Bl9ti3sLBJyrxAt8DeTE8KskIPobT2MyzFkr+h9Vj7Eyp?=
 =?us-ascii?Q?BA4PYY3I9vRGkFRbpsI8JpcUTlUFV68mxR2JWHfvDMJDqFyPtybZDVRfMql+?=
 =?us-ascii?Q?AiPn+IqD8ImYyAZR5H5gODydGr/5KY2xdsn0BSk9cwQPcH/qFW08E3rIZ0ME?=
 =?us-ascii?Q?YJnCRq2+F8mca6LettKBjWKWR1PqG+/PxFki9sPRLHBpHRHEB2GxezmWgMZs?=
 =?us-ascii?Q?RcbNcAPsn7/GS4bXL11ieKhSSjSqhfH0eTi3n1UnXDorB61pQlQkUpHCbQ+0?=
 =?us-ascii?Q?T1z6p/EJIJEmF4pY085bEu1jqcJVDPa1h3awYQgbdfWoEMgB1Y3WZunrVtB+?=
 =?us-ascii?Q?VBwEI3I2zLuM3lF9CRgy+o1Q4RdLh9+lEx15TT4brSgHZ+yCdNnyTXek3oiP?=
 =?us-ascii?Q?fSqb1gcW8g+fMYjgmyFpC+OLeGCfsRZb5JWFJ6dQS8MGQoB9m6GyFDnSKyjn?=
 =?us-ascii?Q?qyPEuZx/l3+o2MjpT5UJV0mb5Xpp9U5c3yLdir9312iaqPlL5xOrp62oSR6s?=
 =?us-ascii?Q?wukMG6R/B0nbYK2OX3UlLiBecCYqxOval3QCBHVWu4aUREVOHSoWTrInr+H0?=
 =?us-ascii?Q?niUeMRKjrcQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L1ULK7RXk9q0zeA8Tdb1aoH0Iwm3snBpTL/8rYJNBKgroNSSu29UQvPyKY4t?=
 =?us-ascii?Q?CwDvGd1wzLIbGcYLUK7rZgC5cLMbmuduBeRObrtKIn8j4GAJPctAjZK9DNdi?=
 =?us-ascii?Q?EPZEkbCsEMOpRRbYiHaY3NGAQmbHTa6nMUPJ8BWSEjUvBcMocHkmzesu9dSf?=
 =?us-ascii?Q?cKl8cdUoQPDKIYltlaTJVNtIxY1GBFGBbtdldmMsTB1KSZ1KYldu40T7qfMv?=
 =?us-ascii?Q?9hf6DRYW9MEiqjitOapsOpqfEcRxcFkSGB7LegOZr1iU7Im/t4FU/Q/ObA4r?=
 =?us-ascii?Q?zre5AQ6suEmDS9gm+r4qkpp42bMMPTMmRStJRd0y2Onv4+BqFdeem5oamiMf?=
 =?us-ascii?Q?NAszOx4ko9f3nn6+boBHY0nChUyfzNK0J1QZxwPIBiaOND+HU00et608bGms?=
 =?us-ascii?Q?8RCf8VjWKDE/Z5HGSC6VGGJbX8LLROMcvzY6EEOOHSgtGSRtpouEr1Bik9pc?=
 =?us-ascii?Q?+9eyouUJcB936wjLGke3fSVG/x2FPvBdhi5O95KBac69ueyQ1TIAds/X7Qc1?=
 =?us-ascii?Q?ciYnLh00fwIui03EGGnQ76CwnamU/LTZcwTMkyY4TohO1ZkMFFzhtj4T4v8K?=
 =?us-ascii?Q?z39VLC6nMxCBz4wnVNsIiRSCUqqYPG1Bpv34+SoTFDeWeP8/ddoX/AVDZr/d?=
 =?us-ascii?Q?0/bzcLE35Q4n7rGCQljR5rRd7idWhg34Y0LUspJtg8Mbg+7cBg7D9f917igi?=
 =?us-ascii?Q?yCPtR7L7fbx14/WBrskL42AlSWv4iaF+uoWhKDdVQZhCYJIg6qVLhL9tFh8P?=
 =?us-ascii?Q?Cv7uBE4Nvhw7xwSQkDQhxWC9HHWXahNR65ftqo4dSGH9thF8/gsKU99/Kpsg?=
 =?us-ascii?Q?Hfg9GRDwTxbvwm3zHVf9tVgkYLeUogmNe7tOHl/+nADFgYeb/GqTuRBUpZku?=
 =?us-ascii?Q?+E4Keh3fqMxTwv7DkvF6ywi3AzF/Gru77BA1udhjFR4RkLBDbH7u4Ke46Yai?=
 =?us-ascii?Q?L0vChq/psB8AU6dAPZ0qcnwYb/xQoDePzqtSwwGo56zTiW9+SPphsrjlB5qd?=
 =?us-ascii?Q?hTMI1ANY72do2KN8fq/zAfYHgWOT+W1XQ6h2MIQoILGHvAkqByuQdMwJi4R1?=
 =?us-ascii?Q?4C807yO7FmPQumd87i+jUacTwRyI8OHp76Dc4eB9finrsXLNhH/LXaeTkNjx?=
 =?us-ascii?Q?pDeBaZpprlrZPu/HgkhLFXpXvSVLKKm/jNBwrZIlKru5aaJejFGEc+AZBELp?=
 =?us-ascii?Q?o1P/uV0NWA8KwS8dT3OLxj72tWoP68u9a0KBQ7+gCQgRxTJxv5LhKHejTFYV?=
 =?us-ascii?Q?hpd4DuC9vxEXDteDRPc473vw5LaZfA88G8hjd9BAXQgAPnP1DJCBe03Omcfx?=
 =?us-ascii?Q?AAUolIbU3jQNlMCL3lrUh2sGCRgErM6eKxGDpTpsfRGa59oHHkR/N7+BLYY3?=
 =?us-ascii?Q?nhW4FYGfg7dzxXkaEulgXWREWOyZRsu2LShzPjhACD+q9DVow8CBnxTegnTl?=
 =?us-ascii?Q?4Urbnz/nCHkkl+B6nW5MLuPBi4Eq7tmnF//gvs48ZFlHrZvWoHS/FCMlpCJ+?=
 =?us-ascii?Q?6+Cl0QUanfsqKI9/ee4upO7yNGnmgDJ1a7FkoK6HevjDGVH2P+CBRZx/yf6t?=
 =?us-ascii?Q?IicbHk7fWukfLnKEG9Zc/Ru1xHst8N1S/aqua7yrQzURMnQ5aY5hT/CFh/Ev?=
 =?us-ascii?Q?kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe7fbd60-8ff8-4e34-40e4-08de0024f280
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 13:26:22.2068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PR3jYVWPVJt01/42U6W6weSjYINJOMZR+w+EGEbK7LVqUQtpbm51UYx195oN8fil7+TAU1SUtgl9pvjDjjEz4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5901
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "Oops:general_protection_fault,probably_for_non-canonical_address#:#[##]SMP_KASAN_PTI" on:

commit: 06a400ed1731bd3f66e0f78309b49c236c198a36 ("f2fs: use fscrypt_finalize_bounce_page() for cleanup")
https://git.kernel.org/cgit/linux/kernel/git/chao/linux.git cleanup

in testcase: xfstests
version: xfstests-x86_64-5a9cd3ef-1_20250910
with following parameters:

	disk: 4HDD
	fs: f2fs
	test: generic-group-54



config: x86_64-rhel-9.4-func
compiler: gcc-14
test machine: 8 threads Intel(R) Core(TM) i7-6700 CPU @ 3.40GHz (Skylake) with 16G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202509302144.af1b7a00-lkp@intel.com


[   68.453271][ T5295] F2FS-fs (sdb4): f2fs_recover_fsync_data: recovery fsync data, check_only: 0
[   68.462317][ T5295] F2FS-fs (sdb4): Mounted with checkpoint version = 7f8129e3
[   68.675660][    C2] Oops: general protection fault, probably for non-canonical address 0xdffffc0000000005: 0000 [#1] SMP KASAN PTI
[   68.687388][    C2] KASAN: null-ptr-deref in range [0x0000000000000028-0x000000000000002f]
[   68.695647][    C2] CPU: 2 UID: 0 PID: 0 Comm: swapper/2 Tainted: G S                  6.17.0-rc1-00042-g06a400ed1731 #1 PREEMPT(voluntary)
[   68.708228][    C2] Tainted: [S]=CPU_OUT_OF_SPEC
[   68.712842][    C2] Hardware name: HP HP Z240 SFF Workstation/802E, BIOS N51 Ver. 01.63 10/05/2017
[ 68.721778][ C2] RIP: 0010:f2fs_is_cp_guaranteed (fs/f2fs/f2fs.h:2568 fs/f2fs/data.c:57) f2fs 
[ 68.728406][ C2] Code: 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 97 00 00 00 48 b8 00 00 00 00 00 fc ff df 48 8b 5b 28 48 8d 7b 28 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 84 63 ff ff ff e8 43 20 fb be e9 59 ff ff ff e8 19
All code
========
   0:	48 89 fa             	mov    %rdi,%rdx
   3:	48 c1 ea 03          	shr    $0x3,%rdx
   7:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
   b:	0f 85 97 00 00 00    	jne    0xa8
  11:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  18:	fc ff df 
  1b:	48 8b 5b 28          	mov    0x28(%rbx),%rbx
  1f:	48 8d 7b 28          	lea    0x28(%rbx),%rdi
  23:	48 89 fa             	mov    %rdi,%rdx
  26:	48 c1 ea 03          	shr    $0x3,%rdx
  2a:*	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)		<-- trapping instruction
  2e:	0f 84 63 ff ff ff    	je     0xffffffffffffff97
  34:	e8 43 20 fb be       	call   0xffffffffbefb207c
  39:	e9 59 ff ff ff       	jmp    0xffffffffffffff97
  3e:	e8                   	.byte 0xe8
  3f:	19                   	.byte 0x19

Code starting with the faulting instruction
===========================================
   0:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
   4:	0f 84 63 ff ff ff    	je     0xffffffffffffff6d
   a:	e8 43 20 fb be       	call   0xffffffffbefb2052
   f:	e9 59 ff ff ff       	jmp    0xffffffffffffff6d
  14:	e8                   	.byte 0xe8
  15:	19                   	.byte 0x19
[   68.747793][    C2] RSP: 0018:ffffc900002d8ca0 EFLAGS: 00010206
[   68.753705][    C2] RAX: dffffc0000000000 RBX: 0000000000000000 RCX: ffff8883c1d47f1c
[   68.761518][    C2] RDX: 0000000000000005 RSI: 0000000000000887 RDI: 0000000000000028
[   68.769319][    C2] RBP: 0000000000000000 R08: 0000000000000000 R09: ffff8883c1d47f04
[   68.777131][    C2] R10: ffff88843f7d65ef R11: 1ffff110783a8fe1 R12: ffff88815141cc00
[   68.784942][    C2] R13: ffffea00056fb8d8 R14: ffffea00056fb8c0 R15: 0000000000000000
[   68.792764][    C2] FS:  0000000000000000(0000) GS:ffff88843a9a2000(0000) knlGS:0000000000000000
[   68.801536][    C2] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   68.807970][    C2] CR2: 00000000004ac270 CR3: 0000000413692001 CR4: 00000000003726f0
[   68.815789][    C2] Call Trace:
[   68.818936][    C2]  <IRQ>
[ 68.821658][ C2] f2fs_write_end_io (fs/f2fs/data.c:342 (discriminator 1)) f2fs 
[ 68.827160][ C2] ? __pfx_f2fs_write_end_io (fs/f2fs/data.c:318) f2fs 
[ 68.833182][ C2] ? blk_mq_complete_need_ipi (block/blk-mq.c:1264) 
[ 68.838760][ C2] ? bio_endio (block/bio.c:1646) 
[ 68.843025][ C2] blk_update_request (block/blk-mq.c:992) 
[ 68.847904][ C2] ? ata_qc_complete_multiple (drivers/ata/libata-sata.c:792 (discriminator 3)) libata 
[ 68.854332][ C2] scsi_end_request (drivers/scsi/scsi_lib.c:637) 
[ 68.858945][ C2] ? sched_clock (arch/x86/include/asm/preempt.h:95 arch/x86/kernel/tsc.c:289) 
[ 68.863129][ C2] scsi_io_completion (drivers/scsi/scsi_lib.c:1078 (discriminator 2)) 
[ 68.867919][ C2] ? scsi_dec_host_busy (arch/x86/include/asm/bitops.h:94 include/asm-generic/bitops/instrumented-non-atomic.h:45 drivers/scsi/scsi_lib.c:377) 
[ 68.872880][ C2] ? __pfx_scsi_io_completion (drivers/scsi/scsi_lib.c:1057) 
[ 68.878276][ C2] ? scsi_device_unbusy (arch/x86/include/asm/bitops.h:60 include/asm-generic/bitops/instrumented-atomic.h:29 include/linux/sbitmap.h:321 include/linux/sbitmap.h:330 drivers/scsi/scsi_lib.c:399) 
[ 68.883334][ C2] blk_complete_reqs (block/blk-mq.c:1225 (discriminator 1)) 
[ 68.887949][ C2] handle_softirqs (arch/x86/include/asm/jump_label.h:36 include/trace/events/irq.h:142 kernel/softirq.c:580) 
[ 68.892575][ C2] __irq_exit_rcu (kernel/softirq.c:614 kernel/softirq.c:453 kernel/softirq.c:680) 
[ 68.897112][ C2] common_interrupt (arch/x86/kernel/irq.c:318 (discriminator 35)) 
[   68.901646][    C2]  </IRQ>
[   68.904449][    C2]  <TASK>
[ 68.907253][ C2] asm_common_interrupt (arch/x86/include/asm/idtentry.h:574) 
[ 68.912126][ C2] RIP: 0010:cpuidle_enter_state (drivers/cpuidle/cpuidle.c:292) 
[ 68.917770][ C2] Code: fd e8 02 f3 ff ff 8b 73 04 bf ff ff ff ff 49 89 c6 e8 a2 8a 51 ff 31 ff e8 fb 79 5d fd 45 84 ff 0f 85 78 01 00 00 fb 45 85 ed <0f> 88 4d 01 00 00 4d 63 fd 49 83 ff 0a 0f 83 73 02 00 00 4b 8d 04
All code
========
   0:	fd                   	std
   1:	e8 02 f3 ff ff       	call   0xfffffffffffff308
   6:	8b 73 04             	mov    0x4(%rbx),%esi
   9:	bf ff ff ff ff       	mov    $0xffffffff,%edi
   e:	49 89 c6             	mov    %rax,%r14
  11:	e8 a2 8a 51 ff       	call   0xffffffffff518ab8
  16:	31 ff                	xor    %edi,%edi
  18:	e8 fb 79 5d fd       	call   0xfffffffffd5d7a18
  1d:	45 84 ff             	test   %r15b,%r15b
  20:	0f 85 78 01 00 00    	jne    0x19e
  26:	fb                   	sti
  27:	45 85 ed             	test   %r13d,%r13d
  2a:*	0f 88 4d 01 00 00    	js     0x17d		<-- trapping instruction
  30:	4d 63 fd             	movslq %r13d,%r15
  33:	49 83 ff 0a          	cmp    $0xa,%r15
  37:	0f 83 73 02 00 00    	jae    0x2b0
  3d:	4b                   	rex.WXB
  3e:	8d                   	.byte 0x8d
  3f:	04                   	.byte 0x4

Code starting with the faulting instruction
===========================================
   0:	0f 88 4d 01 00 00    	js     0x153
   6:	4d 63 fd             	movslq %r13d,%r15
   9:	49 83 ff 0a          	cmp    $0xa,%r15
   d:	0f 83 73 02 00 00    	jae    0x286
  13:	4b                   	rex.WXB
  14:	8d                   	.byte 0x8d
  15:	04                   	.byte 0x4


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250930/202509302144.af1b7a00-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

