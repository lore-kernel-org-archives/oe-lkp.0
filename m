Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0E2195FEF
	for <oe-lkp@lists.linux.dev>; Mon, 24 Mar 2025 06:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742797154; cv=fail; b=vErvLvCg2srsi6zHODGdK7/ir3ZM7tu267BYi7ulb3FwjxvSV2S3q2/hIOkR3NNtn1ASpP5WyEDVgB9vetM4AMyqd5c0YRtlUcyrF9lL176/R9xnGqUGWA6k6Ekl0cep5JXEnTIj5uRXW2TxSnfWJNqs/pQ6BBvqd0sEbMhniII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742797154; c=relaxed/simple;
	bh=ACtRNIYCB3dcX0TT/k7wzgxQ2+zJ1TMlPXaNkT0NkAc=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=uMbMp5KFelrBW2WOdKJYewSIjC/xErOxK8Pis2jOSWRoEVIZh4OV8Ixz417jtk5UmUuFXxOnGzDt+7yyeXsrcPadnV9bJpMdrRSFTn0ots0EByKOX/cFm0XhI4eNaOaKRJjJ/q2ImI5P8ZVIGPIe8FpzalRXOTOnifF6brNLk9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WU5tQ/yH; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WU5tQ/yH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742797152; x=1774333152;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ACtRNIYCB3dcX0TT/k7wzgxQ2+zJ1TMlPXaNkT0NkAc=;
  b=WU5tQ/yHfkfuCbS/Mo/MatgSs2TYvM2lmliKP6UUFbMvuvV9BVglLWl3
   DTPg9DmjgLJbTME57Qy8ObifDwIV+BFAuEMnmYhdfcpcDi7mjUm8MUnNJ
   R5u6bdcvp266MSk0o48Ixm+W+osOiwrIBNnAY8p/n50QMHV8Lv0GUy8Ls
   2Eal2X98rgrfOwlons6PRaMFQHTA4umGtS4nYUVeKsBsysJgrkGGNQNY2
   nC0UlCVx/JZ3uSutW4DsR0qFHfE+cSyXkNdnzgQbIFHRo/na0n4v/SwJ8
   avOJszCK/hdHjgXS8aR9lAXS8CUjzLhybEemGwjUVrzU77zr9PP1kevP2
   g==;
X-CSE-ConnectionGUID: qeYDWMoaRQiJGDMIZD00CA==
X-CSE-MsgGUID: YRS3nJVSQJmepVEDz4LzPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11382"; a="44095151"
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; 
   d="scan'208";a="44095151"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2025 23:19:12 -0700
X-CSE-ConnectionGUID: OBvlWTAnRlG6wp716wAfwA==
X-CSE-MsgGUID: LUsbQ+iRQuqnYZJZl46x7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; 
   d="scan'208";a="154849876"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 23 Mar 2025 23:19:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 23 Mar 2025 23:19:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 23 Mar 2025 23:19:11 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 23 Mar 2025 23:19:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x++E0mws3cl7mbjvp7rYvaBP7kDfSJwWBF0fZIe9xHs393+bl9wMrlGeqJRJTnz70vLrNeV2muhDGjduYmT7lxWOjrjMUPSxMBXtyA2k1qHjyMBWhWDYq6EtZW1pdF7+pjVyHDv0JbiIw4NPQZrNM0peVya33R8aOXpAcI31ABlPBmMWjXkpxgKPzPw5PaQnrqUSGZ5trP73XOAOPFkw0szn/xGYxt/OdZ8gWKO4EFcU/bGQrp73IeAOzSDkw2z3QPedFUGG3nktNiFu128X+PE+IXQSh1tFKH61NoB+FFjBhHslAJf8sUPDhQGslWvpPuRKRtZbKP4dg/j97P8Evw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1WlkRAcIgW21RbYyKltK/nv1eszGjKaOXRWwUvJN01o=;
 b=njaKLhHJ/xNJddKAWdEDz9uQ9Ca7FztSU3N6Gc2XJENPFEKlwJaXLIRiSzu6WHFlen8lW5kbxkH/0zMIqvRahEweE8YuL/YXzAgTmf5b+2mwdq0PdXqAdlYtmEVFb6/u/gPbj1XfnORVdDtmKiL34sgW1kBeam5+0PhzeLWfgCw+rXVWMDgfWHBk8YFnGDyLMMiOuMWEP+4RuDehiHVHfmZmktFbdAiy1cO2TueXozOhfOMevCRP0eGs9owGjvMFVhWMQMmGsjXl8J5RFCXiWlXuFWb5YEYunqj5tDa63nqeKUXIgKGtzdtk7is9FExRWLWKX6zWvM3cJU/I382Zsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SJ2PR11MB7619.namprd11.prod.outlook.com (2603:10b6:a03:4d1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 06:19:01 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 06:19:01 +0000
Date: Mon, 24 Mar 2025 14:18:53 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-mm@kvack.org>,
	<oliver.sang@intel.com>
Subject: [vbabka:slub-percpu-sheaves-v3] [slab]  c19bb08297:
 BUG:kernel_NULL_pointer_dereference,address
Message-ID: <202503241413.afff5aa1-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::6) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SJ2PR11MB7619:EE_
X-MS-Office365-Filtering-Correlation-Id: 295c12e5-ed18-4788-c280-08dd6a9bc4e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8RnfD2s9lISkFEDZylBNWNoteyof6huPjuQJWdet9I1uVUOkvV8y3idjWZui?=
 =?us-ascii?Q?5uWx6Vzhn67uQS4GiXrA/eVgiLMEVj2Q179RrKRrxpLibyAsSBCJnOEf6cnS?=
 =?us-ascii?Q?+vxZ+cLi7xWtcNCQOhV1hdxvgteIve8LyKjyc8S5+gdb+GhfLoAKNtghe5hf?=
 =?us-ascii?Q?VB5yu2FexANiRSYawvaCo5xGavESgoQLBcw4MaRDGeLJJ61ZOVRl5U84/IZy?=
 =?us-ascii?Q?xnvOm2oPXEmjhjMhwUA24ZSkB0FGqZy54mfhU37i4GGTaqV+zm3pi3EksLuO?=
 =?us-ascii?Q?IlP4fAu7srSUMRMX8Z+fhMniTeVTfLfroySxzIa+pQGzs5i7GwleEq0Y0vLo?=
 =?us-ascii?Q?yortqqY8zoKm8PCPjSJMbR8JvN6BKRdejmDjCVW0KumdIRTFwCV+t8H0er+q?=
 =?us-ascii?Q?gE6QVEZyKlQDg51yVcSedGRWGaVe2NnHfkXby/LEVf4urKPgtjOKshAE0bBf?=
 =?us-ascii?Q?Wsw3cRpLXFKk50tjBTcc0T+wMb5HEYQrBN0QORGXB1NljpTScwVP/rq11ad0?=
 =?us-ascii?Q?WWGeaSusMB3iromgsmqmB58vEbPUqCPVM9KnJO53zfk6WZl464UJ4huy2ess?=
 =?us-ascii?Q?dmdKPj1fI+OVy50leXGFrfAL5vmkWSQdamIoGoQeKKnX/t+c95jWkCRS+CnW?=
 =?us-ascii?Q?EBiGC0O0gkfMXin2eJnDXFQPmeiERuBTiVrdBlvjvo2AdiNKm4tZfBhJPAa9?=
 =?us-ascii?Q?hyOkslVcR/wjs8MCQMalqL+8IV38FCjUtwilfsnrLVbkyRhmsod0eCcMWbie?=
 =?us-ascii?Q?P6oyCGiQ9XY1UEn7M9lRzsC6mGwH442DoKk8G6T1V+NnPoLqPh/M/xzGftcT?=
 =?us-ascii?Q?sMvnY/guA9DxBWs246y6POWIjOzPwPm59H98AEXzn7CI8PMF5SPAIgWyahpR?=
 =?us-ascii?Q?lir1UbkoiZ0W7ihXlRuAEbLpPOUeSdRiS1lmU8QcV8FiDO8m1hVdhiNM5eDe?=
 =?us-ascii?Q?uj0e549P6k8JpFg+12uhCOebYqSGcB54AQ4KlIQ/uwam1lTUDkFF9uqQDK8p?=
 =?us-ascii?Q?NumP1ZzT+2NicEOQEAn6vXT/LFXQB/fEPlQ83VMCcrJDQXeQcsiCtCNEVNHM?=
 =?us-ascii?Q?SLUYYDvvVeIP8P01nzs7MWpwCgqp9oKt/jAg6bFNBVdOlJHSRUWIcRwwZJq6?=
 =?us-ascii?Q?Kv2K9L7McsXCxkA+ZDkSTNKmJrJMlFwZQB36iHVohl4eOm4lBw1AfnQL1Lti?=
 =?us-ascii?Q?K/s2mQ5woSWsMtzLJ3r8L8FlyuaCdlQAQ68ttwkut7hzPSSo+gq3hit7Qkcm?=
 =?us-ascii?Q?ZY4ufhaakKpiX83lPqVGtgYlN+tRAQkldVnGcpKadxunYhzHqoXhimB+Yw0j?=
 =?us-ascii?Q?kerrHhPB6NrGcq2wwYVihKxh/H6GXvSOTI/93JIWlSkkMzFcvrKF+bxlGuY+?=
 =?us-ascii?Q?zuFnu+5MYFsGNtvRnXvTtGZjB7lk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Zgd67PfLTsqeHe3xKfRmXjVRReOnIoLQx3kLUK1lgvC4Ky+VatBSq28UPXra?=
 =?us-ascii?Q?9xxPleGflyYQtGb0H9f6zAccLI45bI8TKnoVgtB8rYDthEtlZjPO458q+sr3?=
 =?us-ascii?Q?LnrV+R7PWtFlqT93qP3gbqcIXK4YyctxVsfKwaMNElytkkATFgWtU8uDUTdz?=
 =?us-ascii?Q?s1McEw54C4+i0myV6yMw7mAyprqpiv0LlXdpfLyurZJIH+vlfSBo2lWYV4IN?=
 =?us-ascii?Q?PaujZl9lEbEYbOZ3P770Snmu5EjC7AF0z6q/zz91zXNU5wGgOwbdW2kQOBTV?=
 =?us-ascii?Q?TVHFREat5vzzvbBJYTMka+4mGJ80SGtFfx32Z4wgGG71yblJ/AfLIDXj7PjW?=
 =?us-ascii?Q?SXaTTOUi2IxiOOJo1KoJmTYSkWc+dVgjqcZIfHT+5y5rRVhSPMj80agN2rue?=
 =?us-ascii?Q?a24yQFc71JEo/UHJvi+AKDdtgKk3CNKO9MloSa+zrTyK9S2YX1YyhgAW6Hw3?=
 =?us-ascii?Q?dfsXRnVQ6dpCMHHJ8VnjqZDpgKnqj3+osb+/6oLgwCrwzd70ycVRkZBInzjg?=
 =?us-ascii?Q?t0JuIT0qSY87eR2TaL+8yrt/y+s/qRfKMuAii5oRucrrNN6mSD/42cIIvToI?=
 =?us-ascii?Q?P/AePcAnKidNQrobqFmg2OFOk3ygYVhkEJjEIECq+HhLCzaOUZq3qpLTgq+Y?=
 =?us-ascii?Q?82viw/WtMKoI2M0GChaRlqhMCOlddYjM6X5z5Jo9a09BGPHgxfJZs0dWxloq?=
 =?us-ascii?Q?26w0Dc/0DKLoTYHs0ZsNN1OynFboxDjaswlohbtk96bHeTGMAuDdQ6NGFfxx?=
 =?us-ascii?Q?cvTjOtV7dIXicAw0JuKahGIU9q+CgaKZ1ZA22p94IcpYKgCEfMNpiGWPkfVp?=
 =?us-ascii?Q?8SR8JDbldFm6TxF5DZ9yMhmJsSONf6TVSYdWHeoNA4i7rHFFphm4eMvwx0Wd?=
 =?us-ascii?Q?0AARCUyJR0OENlx8yzlho1CI+9yrq3e5wFDzOlz3tGjpMgrnCWAqCIDwD0wt?=
 =?us-ascii?Q?RJAUCf04WhnECUN3jPbysA684qPb+Q6+AD/r/snxzi0ZhxR32s7PtKAh/pwE?=
 =?us-ascii?Q?cZ3+4hIuYFVrjeh7RxWqSiF/ZobOrecZKV/8EFIGergn4WW3PKHTIYrfWPwD?=
 =?us-ascii?Q?nQJyLeVM7gAdxLouS5064Y1efb4j23wBpbuMnS0FgFaaNRT+DnJX4pvs7JXb?=
 =?us-ascii?Q?PapaTdOebqnoM21ZM5Uxpe8w6VrnBC3h3w4YUHSfR8ywmrNaCUyddQvLa7W5?=
 =?us-ascii?Q?SJY3f2l9+mUwgK7Dp+bcZ9GmVgKJWmfI5AJnBTv8e4wLA/D+vHIoRUhvNDuL?=
 =?us-ascii?Q?gA4xTvaLKcFf7ioi7V2aOaQb9bIP0ZI0TzoQZbJ/lELb6bLfws4gVUS62kcn?=
 =?us-ascii?Q?mwIas2T4sO+NnPITgfgh86P22TRE03olzRVzU2grn/XfS94KdbyBG6vJwO9I?=
 =?us-ascii?Q?hfvvhiQ1w6cs4uLgyF9nMvdGv6OxLmPtNPKp5/IXxKwxdWSMUIihmxmB0umj?=
 =?us-ascii?Q?XzUmo11gPSHRSYTCIw5VhLy884t3gdwL3CvXI6+FWXD/HVK+z9Wq9SRv8XC2?=
 =?us-ascii?Q?hOVPYnISJ2XUezeJYYEXtyX5pUXuAxIc5nyBnIa5hIw9vDPCyJhh1AZXCvGu?=
 =?us-ascii?Q?lPCo01mDXBpUa6hHlZlz59cy1G6UtPJpMfPDd/7ehfpgsoDOM1jxWiQ4X+Nq?=
 =?us-ascii?Q?3A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 295c12e5-ed18-4788-c280-08dd6a9bc4e9
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 06:19:01.3500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fMvrb7JhIdNiyJZUBe90Z7z66jz0nWzpgGm1ut2HmPlcUP29kkAVN4Jc3XlLRHQCKLSgH4waFysz0+rfUQMJbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7619
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,address" on:

commit: c19bb0829736a5c7abe1d1b70d013489d720bb54 ("slab: add opt-in caching layer of percpu sheaves")
https://git.kernel.org/cgit/linux/kernel/git/vbabka/linux.git slub-percpu-sheaves-v3

in testcase: rcutorture
version: 
with following parameters:

	runtime: 300s
	test: cpuhotplug
	torture_type: srcud



config: i386-randconfig-005-20250321
compiler: gcc-12
test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+---------------------------------------------+------------+------------+
|                                             | d52c71b1f1 | c19bb08297 |
+---------------------------------------------+------------+------------+
| boot_successes                              | 6          | 0          |
| boot_failures                               | 0          | 6          |
| BUG:kernel_NULL_pointer_dereference,address | 0          | 6          |
| Oops                                        | 0          | 6          |
| EIP:slub_cpu_dead                           | 0          | 6          |
| Kernel_panic-not_syncing:Fatal_exception    | 0          | 6          |
+---------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202503241413.afff5aa1-lkp@intel.com


[  100.813833][    T6] BUG: kernel NULL pointer dereference, address: 00000008
[  100.814405][    T6] #PF: supervisor read access in kernel mode
[  100.814830][    T6] #PF: error_code(0x0000) - not-present page
[  100.815260][    T6] *pde = 00000000
[  100.815526][    T6] Oops: Oops: 0000 [#1] SMP
[  100.815856][    T6] CPU: 0 UID: 0 PID: 6 Comm: kworker/0:0 Not tainted 6.14.0-rc1-00007-gc19bb0829736 #1
[  100.816542][    T6] Workqueue: events work_for_cpu_fn
[ 100.816933][ T6] EIP: slub_cpu_dead (mm/slub.c:2578 mm/slub.c:2625 mm/slub.c:3783) 
[ 100.817301][ T6] Code: 01 a1 2c 56 a2 43 3d 2c 56 a2 43 74 72 8d 70 b8 8d 76 00 8b 1e 83 7d f0 07 77 7a 8b 45 f0 8b 0c 85 e0 78 5f 43 01 cb 8b 7b 1c <8b> 57 08 85 d2 74 11 8d 4f 0c 89 f0 e8 c0 e3 ff ff c7 47 08 00 00
All code
========
   0:	01 a1 2c 56 a2 43    	add    %esp,0x43a2562c(%rcx)
   6:	3d 2c 56 a2 43       	cmp    $0x43a2562c,%eax
   b:	74 72                	je     0x7f
   d:	8d 70 b8             	lea    -0x48(%rax),%esi
  10:	8d 76 00             	lea    0x0(%rsi),%esi
  13:	8b 1e                	mov    (%rsi),%ebx
  15:	83 7d f0 07          	cmpl   $0x7,-0x10(%rbp)
  19:	77 7a                	ja     0x95
  1b:	8b 45 f0             	mov    -0x10(%rbp),%eax
  1e:	8b 0c 85 e0 78 5f 43 	mov    0x435f78e0(,%rax,4),%ecx
  25:	01 cb                	add    %ecx,%ebx
  27:	8b 7b 1c             	mov    0x1c(%rbx),%edi
  2a:*	8b 57 08             	mov    0x8(%rdi),%edx		<-- trapping instruction
  2d:	85 d2                	test   %edx,%edx
  2f:	74 11                	je     0x42
  31:	8d 4f 0c             	lea    0xc(%rdi),%ecx
  34:	89 f0                	mov    %esi,%eax
  36:	e8 c0 e3 ff ff       	call   0xffffffffffffe3fb
  3b:	c7                   	.byte 0xc7
  3c:	47 08 00             	rex.RXB or %r8b,(%r8)
	...

Code starting with the faulting instruction
===========================================
   0:	8b 57 08             	mov    0x8(%rdi),%edx
   3:	85 d2                	test   %edx,%edx
   5:	74 11                	je     0x18
   7:	8d 4f 0c             	lea    0xc(%rdi),%ecx
   a:	89 f0                	mov    %esi,%eax
   c:	e8 c0 e3 ff ff       	call   0xffffffffffffe3d1
  11:	c7                   	.byte 0xc7
  12:	47 08 00             	rex.RXB or %r8b,(%r8)
	...
[  100.819393][    T6] EAX: 00000001 EBX: a9148000 ECX: a9148000 EDX: 00000000
[  100.819900][    T6] ESI: 40392e80 EDI: 00000000 EBP: 401cfe78 ESP: 401cfe68
[  100.820414][    T6] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010286
[  100.820969][    T6] CR0: 80050033 CR2: 00000008 CR3: 7c8e9000 CR4: 00040690
[  100.821493][    T6] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[  100.822008][    T6] DR6: fffe0ff0 DR7: 00000400
[  100.822356][    T6] Call Trace:
[ 100.822609][ T6] ? show_regs (arch/x86/kernel/dumpstack.c:478) 
[ 100.822935][ T6] ? __die (arch/x86/kernel/dumpstack.c:421 arch/x86/kernel/dumpstack.c:434) 
[ 100.823237][ T6] ? page_fault_oops (arch/x86/mm/fault.c:709) 
[ 100.823596][ T6] ? kernelmode_fixup_or_oops+0x58/0x70 
[ 100.824081][ T6] ? __bad_area_nosemaphore+0x10f/0x1f0 
[ 100.824560][ T6] ? hrtimer_interrupt (kernel/time/hrtimer.c:1877) 
[ 100.824934][ T6] ? bad_area_nosemaphore (arch/x86/mm/fault.c:834) 
[ 100.825309][ T6] ? do_user_addr_fault (arch/x86/mm/fault.c:1451) 
[ 100.825686][ T6] ? sysvec_call_function_single (arch/x86/kernel/apic/apic.c:1049) 
[ 100.826123][ T6] ? exc_page_fault (arch/x86/include/asm/irqflags.h:26 arch/x86/include/asm/irqflags.h:87 arch/x86/include/asm/irqflags.h:147 arch/x86/mm/fault.c:1488 arch/x86/mm/fault.c:1538) 
[ 100.826474][ T6] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1493) 
[ 100.826923][ T6] ? handle_exception (arch/x86/entry/entry_32.S:1055) 
[ 100.827294][ T6] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1493) 
[ 100.827737][ T6] ? slub_cpu_dead (mm/slub.c:2578 mm/slub.c:2625 mm/slub.c:3783) 
[ 100.828071][ T6] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1493) 
[ 100.828520][ T6] ? slub_cpu_dead (mm/slub.c:2578 mm/slub.c:2625 mm/slub.c:3783) 
[ 100.828861][ T6] ? cpuhp_invoke_callback (kernel/cpu.c:194) 
[ 100.829258][ T6] ? __wait_for_common (kernel/sched/completion.c:122) 
[ 100.829631][ T6] ? hrtimer_nanosleep_restart (kernel/time/sleep_timeout.c:62) 
[ 100.830069][ T6] ? kfree (mm/slub.c:3777) 
[ 100.830367][ T6] ? __cpuhp_invoke_callback_range (kernel/cpu.c:967) 
[ 100.830805][ T6] ? _cpu_down+0xf9/0x390 
[ 100.831205][ T6] ? __cpu_down_maps_locked (kernel/cpu.c:1475) 
[ 100.831611][ T6] ? work_for_cpu_fn (kernel/workqueue.c:6731) 
[ 100.831966][ T6] ? process_one_work (arch/x86/include/asm/atomic.h:23 include/linux/atomic/atomic-arch-fallback.h:457 include/linux/jump_label.h:262 include/trace/events/workqueue.h:110 kernel/workqueue.c:3241) 
[ 100.832338][ T6] ? worker_thread (kernel/workqueue.c:3311 kernel/workqueue.c:3398) 
[ 100.832694][ T6] ? kthread (kernel/kthread.c:464) 
[ 100.833001][ T6] ? rescuer_thread (kernel/workqueue.c:3344) 
[ 100.833356][ T6] ? kthreads_online_cpu (kernel/kthread.c:413) 
[ 100.833733][ T6] ? ret_from_fork (arch/x86/kernel/process.c:154) 
[ 100.838377][ T6] ? kthreads_online_cpu (kernel/kthread.c:413) 
[ 100.838752][ T6] ? ret_from_fork_asm (arch/x86/entry/entry_32.S:737) 
[ 100.839109][ T6] ? entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[  100.839472][    T6] Modules linked in: rcutorture torture
[  100.839877][    T6] CR2: 0000000000000008
[  100.840173][    T6] ---[ end trace 0000000000000000 ]---
[ 100.840547][ T6] EIP: slub_cpu_dead (mm/slub.c:2578 mm/slub.c:2625 mm/slub.c:3783) 
[ 100.840886][ T6] Code: 01 a1 2c 56 a2 43 3d 2c 56 a2 43 74 72 8d 70 b8 8d 76 00 8b 1e 83 7d f0 07 77 7a 8b 45 f0 8b 0c 85 e0 78 5f 43 01 cb 8b 7b 1c <8b> 57 08 85 d2 74 11 8d 4f 0c 89 f0 e8 c0 e3 ff ff c7 47 08 00 00
All code
========
   0:	01 a1 2c 56 a2 43    	add    %esp,0x43a2562c(%rcx)
   6:	3d 2c 56 a2 43       	cmp    $0x43a2562c,%eax
   b:	74 72                	je     0x7f
   d:	8d 70 b8             	lea    -0x48(%rax),%esi
  10:	8d 76 00             	lea    0x0(%rsi),%esi
  13:	8b 1e                	mov    (%rsi),%ebx
  15:	83 7d f0 07          	cmpl   $0x7,-0x10(%rbp)
  19:	77 7a                	ja     0x95
  1b:	8b 45 f0             	mov    -0x10(%rbp),%eax
  1e:	8b 0c 85 e0 78 5f 43 	mov    0x435f78e0(,%rax,4),%ecx
  25:	01 cb                	add    %ecx,%ebx
  27:	8b 7b 1c             	mov    0x1c(%rbx),%edi
  2a:*	8b 57 08             	mov    0x8(%rdi),%edx		<-- trapping instruction
  2d:	85 d2                	test   %edx,%edx
  2f:	74 11                	je     0x42
  31:	8d 4f 0c             	lea    0xc(%rdi),%ecx
  34:	89 f0                	mov    %esi,%eax
  36:	e8 c0 e3 ff ff       	call   0xffffffffffffe3fb
  3b:	c7                   	.byte 0xc7
  3c:	47 08 00             	rex.RXB or %r8b,(%r8)
	...

Code starting with the faulting instruction
===========================================
   0:	8b 57 08             	mov    0x8(%rdi),%edx
   3:	85 d2                	test   %edx,%edx
   5:	74 11                	je     0x18
   7:	8d 4f 0c             	lea    0xc(%rdi),%ecx
   a:	89 f0                	mov    %esi,%eax
   c:	e8 c0 e3 ff ff       	call   0xffffffffffffe3d1
  11:	c7                   	.byte 0xc7
  12:	47 08 00             	rex.RXB or %r8b,(%r8)


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250324/202503241413.afff5aa1-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

