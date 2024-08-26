Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F25813A25F
	for <oe-lkp@lists.linux.dev>; Mon, 26 Aug 2024 08:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724660102; cv=fail; b=PG/kVkqiCIO9IYbNRmHDu66es/6ta/9tNQCzyEe4b8AZ3Exil3rxvxzD4lK8EEGryr+Yi+naX4HOSHp11fV6dyFKF38O1yQz9gIuQBs1TcMXGqJu4Qm61YmSNDReB7gy1q0aVBUjYP2eLMHHPXp1O5svyUQrqG/Jwz99sB0NVtk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724660102; c=relaxed/simple;
	bh=YozY5jg1mWb1hpgmTOeqYBKEieAh2M3EdE+U4TiNSVs=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=N64f2fui6vQaBruW0wB/RaJCzBUJic2vLVkV4viLf36X4E+sJn4h4WVLq1mGpuSh9EiQSOzroVzjKQ/Cdh23QDh0RFIsyeGmWFVW7T2vcF08nNOI8dusfZNp5qTsux5c5dBBqTRfyTxwWtBoo28Bpvnr3MqyYmEoSrNgYx1JR3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VMEMaOzV; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VMEMaOzV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724660101; x=1756196101;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YozY5jg1mWb1hpgmTOeqYBKEieAh2M3EdE+U4TiNSVs=;
  b=VMEMaOzVJ4Xg/dxbY1G0tK8BhHp18twBVYGAdcB9bKLPIFmpRebslSG0
   V3aI6U3mfIwKsyYZQgmw54QEMgjnUvSXSnnnhbITSQlpGhzuzyRXvkU3X
   /uK/uE8vx38ad2okL7pGxPqqsipLOr6o9fKVGuUTd/aD6HJyLDteLdzfh
   eszbO19AxOqqElh0Wqov4rbz5JIwgOYPeLoOFClsFh+ArbimIJjz23Rz4
   a94eZ0yFIh8tjks0281hz7FIoAQc2W/mcpDYmSn+QkEl38FBt7t4wUj/Y
   na3pqunudMK1Gh80Vvpfle3wC8TGMUGBmBj3+tXp29vE2MLtK35UBO6bG
   Q==;
X-CSE-ConnectionGUID: mif4BJA7S+StdMFs4LdT8A==
X-CSE-MsgGUID: EnVrF2daQayXnco6R44WAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="23036636"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="23036636"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 01:14:57 -0700
X-CSE-ConnectionGUID: NG+S+RbgTlmyMmoSj0xCCA==
X-CSE-MsgGUID: 2cCrS+3rTyKK8CES5QWcWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="93234567"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 26 Aug 2024 01:14:56 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 01:14:55 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 26 Aug 2024 01:14:55 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 26 Aug 2024 01:14:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q0aByxBqLa9zP99sqdS2xKt/TI9BAqo+uoSi9vjf/wo+jCcZ5gCDa2oPTWb+ffjje4rXCW/5sgDD1CgKKIpQzlh2o5ESR0oeaWJTt8cWFXJJM6Nyme2mTgmzaRSMUn18Y9YlrNfYL/HYTrSaO7rY4NQwyhmeyIXbUCLl3BqTHLqbR0u0dUZq14EZYHTLba9gFlLYZB0haBjIxaoJz0kMNWMaH2LzsNF8Pfc72wARO1CeoFjCUcdql8IwDALRCBGMd/pYyY0tCx1KQR4X6AlPiTi41OPScklvkirmRTtEJ0pO6W6qqmHewmwyKKWu4Znb1yxDbXkR6UX5RZShi4V1zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yam4o9Xo1sQqvLWiku8Ozv6twLK20ykKH1k1wRrI7TQ=;
 b=jbjx9cKug/s0nVD4jt6so+cvN+3yFF13LUWuFq7CO3X6I0q9YpwOZONhF3PmETDKeLLasMA9qL42ySsI9MYEtX3MR71SBb+wIRHSb7pm/TUAmKGXVw//veQFj4ex2jUirLB5tC6JDeHudxRNnFJl1JghvXPTAPjocZEcheO4DCUTfIJO0PC9g22hbfQ5GqhpjSTZw/R+gawoe0aC2aD1wvWp9yqwgEQpyW9utUkFXASM000M14E83Pyp0i63dSsTvtzUCaqUGNoxXvwG1ougoTsBPQXh44OHTNJqsviQpcFJNIx1j0BCkziWK9/mY1c99lY1B3dUc7iaWr2HdY/Dww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by IA0PR11MB7955.namprd11.prod.outlook.com (2603:10b6:208:3dd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Mon, 26 Aug
 2024 08:14:46 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 08:14:46 +0000
Date: Mon, 26 Aug 2024 16:14:37 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [linyunsheng:page_frag_cache_v15] [mm]  4ce453f49e:
 kernel_BUG_at_arch/x86/mm/physaddr.c
Message-ID: <202408261653.f01f7c1a-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2P153CA0033.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::21) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|IA0PR11MB7955:EE_
X-MS-Office365-Filtering-Correlation-Id: ade8570d-7903-4b09-fad0-08dcc5a7255a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?01lcQFvWHl5W+6t0PGFZmpxILVN+y3KaQeBUIZpKXQtucWjxb0RJBJ0hhDoI?=
 =?us-ascii?Q?gV8etmol6d62i5C2ivDeGol8Lk6kpTrMDdZ657CXcacSWYH7i1S1f61kOdA1?=
 =?us-ascii?Q?5x+0DXYn1DMzWx5wcsFQXCK9nTfFxd5qF3Vjo/izSuwnKZvuRE4niYvRDbQA?=
 =?us-ascii?Q?HN8tgFkhsMEm0K+R0WuZ0PL+zGHHcGPOIA1W+/fQuv1PswtYPOhoy9ezYnND?=
 =?us-ascii?Q?VMygyd2GU+oBoTOvb0rc4TQTH6zFlr4hDMXazpmigRtQbc7AXOUgH+yZFg9/?=
 =?us-ascii?Q?g7VdudRJJTM9qW/t5xlfy3L6W4WOtjS6DW1877OjgmloCssDYDLO8SXtmFBO?=
 =?us-ascii?Q?7baAKPa/R2cyZMCFgs70OGfebT9t2PwJRh10IpNUyYv/t+3GQoLUgojx46Nj?=
 =?us-ascii?Q?SnGYVesnR7uHnz2of6p0ak3rMu1PskOHwelYysa73NsThTve0HTzs03xjKvz?=
 =?us-ascii?Q?yZQH3fD7d8pRF/dGDKnPn6f6zdEGkzY6y0n4t1muj3r2SdO84L0hiPCCkSdl?=
 =?us-ascii?Q?ekbbtXBUqRIsT/3z8fasn/brgH6ZNpy2/OUo261yOCDD4DQpq53/ztblUyxd?=
 =?us-ascii?Q?Lr9eTGQGr4WEiEy9/QqmS01jLRVqMx+8ttWzjAcGAXUE1xPr4eUN3BNJ0s8f?=
 =?us-ascii?Q?1HTnWZ3+ffbG62WGg+gNsc+1egkwCxpf0yHDzPzRKyfoBr0j3z7A665fg8cC?=
 =?us-ascii?Q?1gniPJinUirD++N6Y17Qsmd+EeltO0aPt5q5AgGuyZaM8mg1d0cDCj68OGtN?=
 =?us-ascii?Q?7GBiq6+XJcjPoSXx6lughOzptMHk0VzqAuYNbU9hkG3ws+PPX5AEdkFSdGQ3?=
 =?us-ascii?Q?AAQxxiXqO/TCDwyirP335ObvmZkqsCJ/phtGXQrgW9h0Vc2H9drgCss943QI?=
 =?us-ascii?Q?E6sKtP6uYm6+ld2HnsY+MmFtQhTxM8paJS+VLZWyGuLK95zX+xeGOpcquKT6?=
 =?us-ascii?Q?V18EtCMjSqv4+50an2PFKD56o6Ruo7bw2fEjU/7MHKfvmyj1/IpdKkM6QF3r?=
 =?us-ascii?Q?HTtDiXnjmKIf5qIDI2Wgjex1K3ULnqsnRfEdkCF0BBlOnbIJZm19hHT+jD8u?=
 =?us-ascii?Q?3lvULwvoqscCAINwTEgXklHys3RavcVRfWo/m5C+BRBapLXqdCDin/EhuQIK?=
 =?us-ascii?Q?5x20fWm21FxplxtrWbkVemCiNLNf3/TdqaKoG+ZNIFTPRF9YJoUDqXnD/UIm?=
 =?us-ascii?Q?5HqJfE6CyWXw+tW/YnjdPIWC4KetThtCyLBMGaoLeprQCkU7eAt58U/g7hrA?=
 =?us-ascii?Q?IcEsdkeP7oJcjgXjHxGlbCFwjEycme4gZx0tp1enfnhtakAKZGjSpxEEHOjM?=
 =?us-ascii?Q?ETEPkZlGywGM3YLirI5vP+eR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5m6j9GvxHxz/ZZwvQgVnd9mqQFQOYP+H5ef+xvjl381NiJYW8IQPFk59g1tT?=
 =?us-ascii?Q?7P2njO1czquTYuNmyzMuQWJtsvPzI/DIf1BJXohwHnjd1naW31rwdwisQjqA?=
 =?us-ascii?Q?6OxWCcluQ2zGsx+a6QY+oSMemfEEd3zbmvCEmfhwge0yndRY3wJ+i0yGBcrt?=
 =?us-ascii?Q?e01lOCJRuQRY3iA54tn+41aGi8PS0cLEtt/J42nsM4cjeJZntX57DU/yfGzO?=
 =?us-ascii?Q?nwupYrBBZ71Ppr/X8NM65BVQ+++BSA9zaW5IUQBJYtCzo70ziIiZgxVKQWBQ?=
 =?us-ascii?Q?tCwA849tyQJ6fhNkicF3D306V4Y4l8Z0Bs9dHW7cew0HDSgEJ+YCFwG+2qUj?=
 =?us-ascii?Q?ySdvg13vFrtWomOBdUAim6fDt8JjvZ88fJf9W9krhR3Tjnlt5d8iQ5ez8bdV?=
 =?us-ascii?Q?0X0QBMAd91EFs5X+yFhbQbfysAYg/XHf5hhkklpSJkGGIdcAr0NeeYZsVrK4?=
 =?us-ascii?Q?x1c8MBRlzEP5IaBIfX2cznm1AwbKm7QFiMrzBOuwx5x7eT8iNRQXf10LOO0C?=
 =?us-ascii?Q?wANhYEd+YN1GQPaJaSUfscvfzLhkoTcFJ1v7YOZPA8l216iIqa/L/VgHYwkM?=
 =?us-ascii?Q?YCtyg/Z6hECaoAzfLtTEi+kadRH+3BF4edOeWJv//7g7y0fnkdFLFP5KqIdz?=
 =?us-ascii?Q?HOg+l1LcQsE/Hu/JCiBQGEIWYvAwXY6R0sgfB2MtH0jrCHZmS29SG2T0GGi9?=
 =?us-ascii?Q?ErXX6P8vpoL5OYPFiVWsdMyupRCbQDJNebRw20f+LRcDLxq/JLcRD8POWnE3?=
 =?us-ascii?Q?ISK+uHONyo0Bx3t3S9GyKIqsxu4NqOHuaaMdMOaLQ9e5/5thf867RBQrzTa3?=
 =?us-ascii?Q?8kil0b7HC5mNmqu846z785whbdkczlfJ+9uOqADqvLEiiohCeP0fVgimdUhv?=
 =?us-ascii?Q?2AAVGZ3DA8M88BK17RSt4liF449nsESEES0OZEZWWyjODF3PM069GeXwGSy7?=
 =?us-ascii?Q?YlPeOardsNsDpuMHTyWJxkskY5Y+iIiegTtd/qgOoON6SNp/axKI0PuKnBIo?=
 =?us-ascii?Q?kA9m4jQWW/efQ4eipNLjz3P+uBSEb0I/+5FsrDJgM7CB+SI5+ov8U8CU/GTE?=
 =?us-ascii?Q?QKrDj4uWdQ29tjEyyQGzqhHUk1z8l5z337WccnDJtrMrwz5pZjLlkiIJ/KOW?=
 =?us-ascii?Q?zxchzet20D06eqRyyjlRAgFfLNpmtAU4R65hFHXTBVwWg0NIpHfZc+MTsDh9?=
 =?us-ascii?Q?+157SnLTeayyqB6ITTLEOIzj9mt03MDgwW/siChUoAHih0jWB09b0Yp+J2fo?=
 =?us-ascii?Q?8d70rU4ujIssIMBnFeI5MtvdsC08OLxHhAQmwNXtUTNAqQ9Ef066NiNsLbyQ?=
 =?us-ascii?Q?/DrCsGlYVWiIQkzVXAWfywlighYuc+AOCtFucKWgW1LAtdRA6Vc0SgMTBL1w?=
 =?us-ascii?Q?3QtuJOqMC/wBpibRDiift6WLDcJqAjIH0iQfxQhDtirtUEiaOJ6Pgg7TNyhg?=
 =?us-ascii?Q?XoxNz8yVVd9NA3JQWxfbyu7NHxhJt1ZXoKZow1VUKizcn9Tu4hZK29JejkQR?=
 =?us-ascii?Q?r3BGO3ckiQwnOsSTO7GMqtCWOy9G1CrmdXG23jcR/y5EsW9o5cLE4P5X6pUX?=
 =?us-ascii?Q?QCkLSR2qO7/gSACQr6/gXvvEAAHdVXeuzcNV9nHp+6bcYM2/fobcIQTPaMH6?=
 =?us-ascii?Q?Qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ade8570d-7903-4b09-fad0-08dcc5a7255a
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 08:14:45.9777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gQ3a7NQB6absc4/F63+Doe1kiBJ0z7f1uK98AwtodZ2HMB0tDANylPldsU/S14EBtg3K6q9nkBhfk1LVdkjUqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7955
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "kernel_BUG_at_arch/x86/mm/physaddr.c" on:

commit: 4ce453f49e1b390a4e1d1d70a915c962950158ba ("mm: page_frag: some minor refactoring before adding new API")
https://github.com/gestionlin/linux.git page_frag_cache_v15

in testcase: boot

compiler: gcc-12
test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+-------------------------------------------------------+------------+------------+
|                                                       | acf2c55ce8 | 4ce453f49e |
+-------------------------------------------------------+------------+------------+
| boot_successes                                        | 12         | 0          |
| boot_failures                                         | 0          | 12         |
| kernel_BUG_at_arch/x86/mm/physaddr.c                  | 0          | 12         |
| Oops:invalid_opcode:#[##]PREEMPT_SMP                  | 0          | 12         |
| EIP:__phys_addr                                       | 0          | 12         |
| Kernel_panic-not_syncing:Fatal_exception_in_interrupt | 0          | 12         |
+-------------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202408261653.f01f7c1a-lkp@intel.com


[    3.655470][    T1] ------------[ cut here ]------------
[    3.656114][    T1] kernel BUG at arch/x86/mm/physaddr.c:76!
[    3.656698][    T1] Oops: invalid opcode: 0000 [#1] PREEMPT SMP
[    3.657310][    T1] CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.11.0-rc4-00571-g4ce453f49e1b #1
[    3.658260][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 3.659288][ T1] EIP: __phys_addr (arch/x86/mm/physaddr.c:76 (discriminator 1)) 
[ 3.659741][ T1] Code: 30 28 a0 c2 85 c0 74 16 89 f2 c1 ea 0c 39 d0 72 51 89 d8 e8 2e 4d 00 00 31 f0 09 c2 75 34 89 f0 5b 5e 5d c3 8d b6 00 00 00 00 <0f> 0b b8 38 1d db c1 e8 bc 99 42 00 8d 74 26 00 e8 6f d9 25 00 84
All code
========
   0:	30 28                	xor    %ch,(%rax)
   2:	a0 c2 85 c0 74 16 89 	movabs 0xc1f2891674c085c2,%al
   9:	f2 c1 
   b:	ea                   	(bad)
   c:	0c 39                	or     $0x39,%al
   e:	d0 72 51             	shlb   0x51(%rdx)
  11:	89 d8                	mov    %ebx,%eax
  13:	e8 2e 4d 00 00       	call   0x4d46
  18:	31 f0                	xor    %esi,%eax
  1a:	09 c2                	or     %eax,%edx
  1c:	75 34                	jne    0x52
  1e:	89 f0                	mov    %esi,%eax
  20:	5b                   	pop    %rbx
  21:	5e                   	pop    %rsi
  22:	5d                   	pop    %rbp
  23:	c3                   	ret
  24:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	b8 38 1d db c1       	mov    $0xc1db1d38,%eax
  31:	e8 bc 99 42 00       	call   0x4299f2
  36:	8d 74 26 00          	lea    0x0(%rsi,%riz,1),%esi
  3a:	e8 6f d9 25 00       	call   0x25d9ae
  3f:	84                   	.byte 0x84

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	b8 38 1d db c1       	mov    $0xc1db1d38,%eax
   7:	e8 bc 99 42 00       	call   0x4299c8
   c:	8d 74 26 00          	lea    0x0(%rsi,%riz,1),%esi
  10:	e8 6f d9 25 00       	call   0x25d984
  15:	84                   	.byte 0x84
[    3.661698][    T1] EAX: 00000000 EBX: 00000000 ECX: 00000000 EDX: 00000740
[    3.662618][    T1] ESI: e9c57000 EDI: c0189d50 EBP: c0189d0c ESP: c0189d04
[    3.663368][    T1] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010213
[    3.664129][    T1] CR0: 80050033 CR2: 00000000 CR3: 02306000 CR4: 000406b0
[    3.664836][    T1] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[    3.665518][    T1] DR6: fffe0ff0 DR7: 00000400
[    3.665969][    T1] Call Trace:
[ 3.666290][ T1] ? show_regs (arch/x86/kernel/dumpstack.c:479 arch/x86/kernel/dumpstack.c:465) 
[ 3.666710][ T1] ? die (arch/x86/kernel/dumpstack.c:421 arch/x86/kernel/dumpstack.c:434 arch/x86/kernel/dumpstack.c:447) 
[ 3.667073][ T1] ? do_trap (arch/x86/kernel/traps.c:114 arch/x86/kernel/traps.c:155) 
[ 3.667476][ T1] ? do_error_trap (arch/x86/include/asm/traps.h:58 arch/x86/kernel/traps.c:176) 
[ 3.667921][ T1] ? __phys_addr (arch/x86/mm/physaddr.c:76 (discriminator 1)) 
[ 3.668336][ T1] ? exc_overflow (arch/x86/kernel/traps.c:252) 
[ 3.668768][ T1] ? exc_invalid_op (arch/x86/kernel/traps.c:267) 
[ 3.669238][ T1] ? __phys_addr (arch/x86/mm/physaddr.c:76 (discriminator 1)) 
[ 3.669813][ T1] ? handle_exception (arch/x86/entry/entry_32.S:1054) 
[ 3.670299][ T1] ? load_secondary_wait (arch/x86/kernel/cpu/microcode/core.c:331) 
[ 3.670798][ T1] ? exc_overflow (arch/x86/kernel/traps.c:252) 
[ 3.671240][ T1] ? __phys_addr (arch/x86/mm/physaddr.c:76 (discriminator 1)) 
[ 3.671673][ T1] ? load_secondary_wait (arch/x86/kernel/cpu/microcode/core.c:331) 
[ 3.672174][ T1] ? exc_overflow (arch/x86/kernel/traps.c:252) 
[ 3.672617][ T1] ? __phys_addr (arch/x86/mm/physaddr.c:76 (discriminator 1)) 
[ 3.673038][ T1] __page_frag_cache_prepare (include/linux/page_frag_cache.h:58 mm/page_frag_cache.c:80) 
[ 3.673583][ T1] __napi_alloc_frag_align (include/linux/page_frag_cache.h:109 net/core/skbuff.c:317) 
[ 3.674116][ T1] __netdev_alloc_frag_align (include/linux/bottom_half.h:33 net/core/skbuff.c:339) 
[ 3.674678][ T1] ? slab_free+0x2c/0xa4 
[ 3.675171][ T1] e1000_alloc_rx_buffers (drivers/net/ethernet/intel/e1000/e1000_main.c:2071 drivers/net/ethernet/intel/e1000/e1000_main.c:4577) 
[ 3.675701][ T1] ? e1000_set_rx_mode (drivers/net/ethernet/intel/e1000/e1000_main.c:2329) 
[ 3.676215][ T1] ? e1000_set_mac (drivers/net/ethernet/intel/e1000/e1000_main.c:4560) 
[ 3.676692][ T1] e1000_configure (drivers/net/ethernet/intel/e1000/e1000_main.c:375 (discriminator 10)) 
[ 3.677171][ T1] ? e1000_set_mac (drivers/net/ethernet/intel/e1000/e1000_main.c:4560) 
[ 3.677649][ T1] e1000_open (drivers/net/ethernet/intel/e1000/e1000_main.c:1388) 
[ 3.678076][ T1] __dev_open (net/core/dev.c:1479) 
[ 3.678503][ T1] __dev_change_flags (net/core/dev.c:8839) 
[ 3.679008][ T1] dev_change_flags (net/core/dev.c:8911) 
[ 3.679465][ T1] ic_open_devs (net/ipv4/ipconfig.c:242) 
[ 3.679895][ T1] ip_auto_config (net/ipv4/ipconfig.c:1514) 
[ 3.680341][ T1] ? root_nfs_parse_addr (net/ipv4/ipconfig.c:1477) 
[ 3.680857][ T1] ? debug_smp_processor_id (lib/smp_processor_id.c:61) 
[ 3.681396][ T1] ? root_nfs_parse_addr (net/ipv4/ipconfig.c:1477) 
[ 3.681853][ T1] do_one_initcall (init/main.c:1267) 
[ 3.682301][ T1] ? parse_args (kernel/params.c:153 kernel/params.c:186) 
[ 3.682755][ T1] do_initcalls (init/main.c:1328 init/main.c:1345) 
[ 3.683198][ T1] ? rest_init (init/main.c:1459) 
[ 3.683639][ T1] kernel_init_freeable (init/main.c:1582) 
[ 3.684138][ T1] kernel_init (init/main.c:1469) 
[ 3.684570][ T1] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 3.685011][ T1] ? rest_init (init/main.c:1459) 
[ 3.685438][ T1] ret_from_fork_asm (arch/x86/entry/entry_32.S:737) 
[ 3.685895][ T1] entry_INT80_32 (arch/x86/entry/entry_32.S:944) 
[    3.686317][    T1] Modules linked in:
[    3.686699][    T1] ---[ end trace 0000000000000000 ]---
[ 3.687223][ T1] EIP: __phys_addr (arch/x86/mm/physaddr.c:76 (discriminator 1)) 
[ 3.687698][ T1] Code: 30 28 a0 c2 85 c0 74 16 89 f2 c1 ea 0c 39 d0 72 51 89 d8 e8 2e 4d 00 00 31 f0 09 c2 75 34 89 f0 5b 5e 5d c3 8d b6 00 00 00 00 <0f> 0b b8 38 1d db c1 e8 bc 99 42 00 8d 74 26 00 e8 6f d9 25 00 84
All code
========
   0:	30 28                	xor    %ch,(%rax)
   2:	a0 c2 85 c0 74 16 89 	movabs 0xc1f2891674c085c2,%al
   9:	f2 c1 
   b:	ea                   	(bad)
   c:	0c 39                	or     $0x39,%al
   e:	d0 72 51             	shlb   0x51(%rdx)
  11:	89 d8                	mov    %ebx,%eax
  13:	e8 2e 4d 00 00       	call   0x4d46
  18:	31 f0                	xor    %esi,%eax
  1a:	09 c2                	or     %eax,%edx
  1c:	75 34                	jne    0x52
  1e:	89 f0                	mov    %esi,%eax
  20:	5b                   	pop    %rbx
  21:	5e                   	pop    %rsi
  22:	5d                   	pop    %rbp
  23:	c3                   	ret
  24:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	b8 38 1d db c1       	mov    $0xc1db1d38,%eax
  31:	e8 bc 99 42 00       	call   0x4299f2
  36:	8d 74 26 00          	lea    0x0(%rsi,%riz,1),%esi
  3a:	e8 6f d9 25 00       	call   0x25d9ae
  3f:	84                   	.byte 0x84

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	b8 38 1d db c1       	mov    $0xc1db1d38,%eax
   7:	e8 bc 99 42 00       	call   0x4299c8
   c:	8d 74 26 00          	lea    0x0(%rsi,%riz,1),%esi
  10:	e8 6f d9 25 00       	call   0x25d984
  15:	84                   	.byte 0x84


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240826/202408261653.f01f7c1a-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

