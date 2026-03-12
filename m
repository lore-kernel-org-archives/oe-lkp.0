Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46667274652
	for <oe-lkp@lists.linux.dev>; Thu, 12 Mar 2026 08:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773304226; cv=fail; b=PXw5arzz700x/CJ8kK0gGjl9UGQbtdaLbmWup2gzpEuNpoxkTIqkQQaMJygilaOp0uwvXEYyGmcDO5lh1UKnnKp0kbHbFl60mAkdrPI1mUSJ8tGEkhFPTQsdK2M8In3RPT9XPVsvZDHY7ZET9j/nMLCmGnz0w7dFeDDvFf56nh4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773304226; c=relaxed/simple;
	bh=OEXFUuf1aSQoNrEYCIIu/BYWKNUKrma68cFY2n6lR6Y=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=sy+BFTKyPDYsvlypSIoa5KYit/PdIghUQgSq4s1Emw7r1EIoz90UJDHAxNnj66iOhd63Ioq3oSFko0hU+rbDRfU2/CKv1V7bZBa09PYd0BB9IfamJ8542f4FQHj4ko4qEGPC1mN7xgkzL2a+GXgonFbNAn9XozGjO54fheABK9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S/g57vOB; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S/g57vOB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773304224; x=1804840224;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OEXFUuf1aSQoNrEYCIIu/BYWKNUKrma68cFY2n6lR6Y=;
  b=S/g57vOBSpdrfQg/O3dySmpAmupogTw0/ilAyDL750jZPhZoz00Fc/CV
   PnRNsUTSCv7MJi91H0EyLLTPne6ASqbd6B8VIRbB+zTn2vfljrPQ7tJUK
   rdko9kWWuJlaVqTCvfYNrMXaevppNfIdVFNCMI40qIUUJl6mKxhZteBPs
   +0qOW1e0ozLS0+C4DlAse0i8o3LYlzpPaG7OLBiKkncYkUaNVvrt6tqiA
   OILTOFvn3s+ouYNtKf00frccSuBFR27zwkwHV4XSYOeoehb81JlAKgjcp
   Um4ti+iT5W5WhRwWZINX8VJAvu/xSW6l8yaJZTDMFIxwPy4z9G+Mhquri
   w==;
X-CSE-ConnectionGUID: GKzK5pP0RXCgUfwfTZT9Eg==
X-CSE-MsgGUID: tUc5J9NbTMqQuGjim1lM2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74503631"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="74503631"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 01:30:23 -0700
X-CSE-ConnectionGUID: G7Ub4fOmRnqR5sZ9r+/cWg==
X-CSE-MsgGUID: POeEqSZGQsq+Oa6HqePoGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="220013431"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 01:30:24 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 01:30:23 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 12 Mar 2026 01:30:23 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.21)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 01:30:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B0BCYwjStWWEsA50DL1Gcy2WWySYGqcCMYleSqKSU16rBZ1O/01Nlx0gXqOlCYNkig2WdjqimoUhzOr2on7KsPqowqnZaTQZHz7l4pvXH0agk/wPW9v2LavFC00lt/AcILhV0Ly91s5MHSy6KRoIEnU53OH5ujjANnMk1HF/TaGNRL3nFnBBYFOXSoN97v5THaqBvvHAHOzsLjUiEwAS5PzcgE6jW5KgrnzRmmP5oGW316bcuYWWuTXdBfxWpvY27lsTwcvKrJMNrissmGMUtbkLjalMU7kYuFHvUxBP/FwJgl9LYRLBuHfLFqEd2dcCHl9zTCTUEZbqzl3ojGzYvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w09cfWsfA/663xjawH1YE/UB6ERYeM0gueoVcU2o89c=;
 b=TvFbce6NHsgjVokUPC1TMcw8l4fp+EgLuMXECBRmIvMFWaNgOolWW0/CjxILFsMfFpWiXSvI0NMlSFgkIQY3lNX0bjEOZKVOOVmA1bZRnPX6QrqSnOBZn5GoiUAj8tzYijS6K5zOxhhmpQUC/O4glKlgfVPf8PbVmLBHUvUgfG+LyAlZS6F28eWeHviB1d8/PzXZpW02zghULWgeIaTJuJiN6tJiiGZDH1SBHkKzsjQB+U7dSqDQ9pPwO76Smefc0soPC0BxOmZf1qVDhyr9aZfIQBKvZkSV3U54liY0Z33gWVofOZ47gfh2wLouWjy0DMTw/EAeN+16H3pwpjT0oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by SJ5PPF3F833FA49.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::823) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.4; Thu, 12 Mar
 2026 08:30:15 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%3]) with mapi id 15.20.9723.004; Thu, 12 Mar 2026
 08:30:15 +0000
Date: Thu, 12 Mar 2026 16:30:09 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [ast-bpf:stacklive_must_write] [bpf]  2b97edcbfd:
 BUG:kernel_hang_in_boot_stage
Message-ID: <202603121524.70171e6f-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: TPYP295CA0006.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:9::16) To SJ0PR11MB5815.namprd11.prod.outlook.com
 (2603:10b6:a03:426::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|SJ5PPF3F833FA49:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e1a6e17-dd42-46a0-b6bf-08de801195ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: TjRUG0CaHw6cipRgOVwp6knLV7a9UrZ/8wDkQMM1YCaMcPC4AO5GXKegUqBuUAYQRdrvedXsF1B4BnEQTmfAeaUcE2RMla6Ju1nrN3U9LxfEyxHPid49622epiaLkzwHhdtUlhIWf2pgJLA0qukIp44ut7VtfFtQ8YkujkQi2y408/njL0379cFrtctC2fhewqp4pAoezcDE+XI5agI/Tl3xAYi9s9xnkLbIwiRCXuSjUbw2B+E9xkxvRai17Z6x+NF4xEnm/CWbo6SEb66n8zd8hpzcPLvZIzPs8mZcUcsJd/OTAaGrzfaISd8MlmjS04Hql+xRfyD1edZawnXr6aix2HIVgplU3Ooankm7gvRYkIy8jtJ8BjWeJYkQC41NqGI8Z6rv6rOrAf4X+1IEHU5baL6LmdCz2XRAle4EXzXjUOd2cxBdM0E1h+NVeoeNrDopwyV98SM+MSdNUFAZ20QjlsJRncQCqLpINHQXLSpMhXy0LXf3ebyR9PNnnDoEqmNEPZoXAx+MIVEoNzN3Pn9hfuV581U+2ruNK9IN8b+tY1uul7XdnKtUASrritCaahM+pwAJRuqi+nFqJagL/IDrdlTY8bDOCj1o8WArpZ1WPn56DOf7KxsSbmXAAJqeIcK7/XnHFhPv3kiYvILGRGqUSQbM0bhE+P0A7/xrSkWrH1yK3cHxF1qXP+dzvJ/8
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IzeguaRQmRgZ04blPd3lCsp72F51FH/Qwe8RXmOcbUS2RBwNUPOXl5F33O+C?=
 =?us-ascii?Q?i/p3FTezkqFOXdCQQ3fqUpHt0bzXUjweBfYmQVVPu0OCaSEutCsAv3/zG/L7?=
 =?us-ascii?Q?uXi6g5LtGBXQVrKbBXLlTGFc2BLgzEehRsUzKD6oTUyKjrx3ZswdSqiQKooD?=
 =?us-ascii?Q?3wcSmMvdwOaCLSl05h6KcbSu6O5dvCxU46sTaRFZVl87CsiIjpA6wBaz1yZU?=
 =?us-ascii?Q?iPxFRWCCxY7qRkYyH0+kghZnBs4E93E8B+UPFfvmNVTXC6w991NI2aBAu2RB?=
 =?us-ascii?Q?7s0o3E/Yi75H8odJcfkVz/WLD23Bc3Wx9+WkJOEfTSwMPwnI6+GLseFPutsQ?=
 =?us-ascii?Q?DRstoxpRyD6elf85THWrrUg352oN8R21uZU0kCbG6jEfgsIm6OQ6CAODkNtY?=
 =?us-ascii?Q?vGndCLdH3zXLnnuLNNJcF+ptyiwE9FsIbH6bab/MuvXykiqgED46S/1W/P/M?=
 =?us-ascii?Q?JqV8ErRCjO2oDyDqAlArhStE9Yvk4sup5iiIoQvTlQ/IkXFq75JGaacE/VJ7?=
 =?us-ascii?Q?MvU22hT5ngTtK2HoZEVBsK02spxwKCv6kyWAY+QdTbGXAeViOLaZTkBc2qQ6?=
 =?us-ascii?Q?Zfrr6RKyAWvJpuFzNqlEjF2v+lptWjAsSJnxfGGxrcZm07626Br7QsGMavAg?=
 =?us-ascii?Q?QSjyvm822ztvrrHewJd6A6RKDnHu77mFsKvaEIKExuYgqyOb7tvQP0Yqj5Zz?=
 =?us-ascii?Q?45Dax2fw+ljXZXkXrQ/copNPvnasPoRKZG2BTiz4luYCVufyM/dKe8yE5AeO?=
 =?us-ascii?Q?tXuEeABJxVLUjfbj0Oto1PGwjLEkr9ppmnggzCF4rvHAygMegeOoj3QJAi+8?=
 =?us-ascii?Q?bMpaZ06yiTOxtRoHE/y2jlV2LSjv+wVjGw3XdSWGYx2BnP9nNG7nv/PfGdMi?=
 =?us-ascii?Q?EE+uEkOstesYmr4esZ/z99CFW1FDm+AYLYvJ6GpWgE2G4OQJ61NdZHZob404?=
 =?us-ascii?Q?aZ4Jjs3RahatyOo7IIIhh9H5o7sY3b6vnGAFSri8aTXoep85HqpcCtP+v/WH?=
 =?us-ascii?Q?qbF4Zi200ExT0rTzNMqtc1FXCAq4rGWgZ2Q/AMcBZATR4S8pZsUOAduuufBF?=
 =?us-ascii?Q?Ieq40/3UaSdNIUvgJ2D0vRcgXuNuftotLoy6MNM4M0D4PlkMrph7wPMO0NWl?=
 =?us-ascii?Q?PTAjotJUri6hhwK1mrb7aLxBiXuyrscrGxaYw8ZpnXJlQstFR/H6uj44Us+W?=
 =?us-ascii?Q?V7uzzUCqL1o3dIKhMbbvu43YfC8cl/xhmER8fVC76I/IlVb+ZnJXgNQbp+ds?=
 =?us-ascii?Q?s8X9TPq3ea8WPIvKaEzUYsjLEwDLTvoM6LLXzP2geQCNpNIyEv3ZvgLKmqlg?=
 =?us-ascii?Q?WiWGnK0N3+GLMYr0VH1C/bC5pJ/mEKa7wyre6swpqBmnh9NBpowjXjKZugM/?=
 =?us-ascii?Q?f8UME0zd/ay479HmBnRK8X3XuXRafAD+5GqlHP/UJNdf3XXJzuUajU/tS7iW?=
 =?us-ascii?Q?qvtpBWFZKF0J/jpS1DslpfgnGwsRxwmXFoVY9ElVI8vvKupNW9JvfOubVcU+?=
 =?us-ascii?Q?vV6iiXqfTWOO5PR7okiG8VaDkD8tkKsikaU/WN5CJ9wAgEkL6tR8ycoYVxiO?=
 =?us-ascii?Q?SQqCDcOJ8T9WCY1ERpQ6oy0+81DFvbuDXMJ02bDBSmt1qRmKmxBP4w0rpxyQ?=
 =?us-ascii?Q?fzFqN1qOZWMyxDXJHlEpy1X58NptXs5Nmxp7kQwwc/BkXhlnxuM81Ezh5a+g?=
 =?us-ascii?Q?eYoZXhZi1Pm1lVMORw2MhY6wgG3pOvrabWHUA12nlEasAY880xy7E6AiEenG?=
 =?us-ascii?Q?L0XVpFacCQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: KxaZALI0MU2l7TJ/6iFRbwjMCXF5RUVR410IKQTQKMUWroDngSINCOS9gLHIi2eiE1Jc4VP7AsuXFqb0zttvrR/V4Lvd7NQfc3KIc1CxPqKOzC9UxCWTlE+hLLnsspYUymFiXw39HzUJv3kuiQNSTKBCKyIyP6mCbXUKg5KIpPhfgT9rRhOiECRYpEQvjy1CjMUSA0KIk14SrQIrqAuOpU16iWL65BWDr5RBzaAyqjVl6JoO1z3gvz/jKkYXfZvxUU5OT5C96jSuk5g7mrCL7jRIzDDFImFf4I+7nk6F4tjMgHLEW6Izl8TF8Zbqr8r4mxElOegVYuMWit+3Z/kEnA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e1a6e17-dd42-46a0-b6bf-08de801195ce
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5815.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 08:30:15.3814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /3MaAJymvVa6VFRKcbmXwpP3nBi3tO/hz5NwmJRu4N9Vz7ENYmhjniZl533lyTvMv5RZAU7BhDwjT7yPyOpJBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF3F833FA49
X-OriginatorOrg: intel.com




Hello,


sorry that we didn't capture more useful information in dmesg, but the results
looks quite persistent that 2b97edcbfd always crash early while parent seems be
able to run further. so we still make out this report FYI.

=========================================================================================
tbox_group/testcase/rootfs/kconfig/compiler/sleep:
  vm-snb-i386/boot/debian-11.1-i386-20220923.cgz/i386-randconfig-016-20260309/clang-20/1

305f3f033e1ec8a6 2b97edcbfd3d62b17ed04708448
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :50         100%          50:50    dmesg.BUG:kernel_hang_in_boot_stage


kernel test robot noticed "BUG:kernel_hang_in_boot_stage" on:

commit: 2b97edcbfd3d62b17ed04708448e140d681576f1 ("bpf: Resolve stack access from FP-derived pointers")
https://git.kernel.org/cgit/linux/kernel/git/ast/bpf.git stacklive_must_write

in testcase: boot

config: i386-randconfig-016-20260309
compiler: clang-20
test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202603121524.70171e6f-lkp@intel.com



[   10.987909][    T1] IRQ13 -> 0:13
[   10.988164][    T1] IRQ14 -> 0:14
[   10.988418][    T1] IRQ15 -> 0:15
[   10.988671][    T1] .................................... done.
[   11.144010][    T1] sched_clock: Marking stable (11105621659, 38118780)->(11272634786, -128894347)
BUG: kernel hang in boot stage



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260312/202603121524.70171e6f-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

