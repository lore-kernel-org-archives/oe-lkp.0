Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A9A3C3C
	for <oe-lkp@lists.linux.dev>; Tue, 15 Oct 2024 05:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728970762; cv=fail; b=HO4JeMnXbytN5alKlnDwGmQM1QZpE182FZZnjcMb6Hm05zixrmOiAstnwoRR2Bv3pwXoho+w1PZZUGrPJieZhCD9scxLtp8EmFdg7ushiWGsYAnu1oct6aat1O0ad44wCopQfUMH+3LmaOtah3DOvbufXIyO47o/Ps2FuDDnIWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728970762; c=relaxed/simple;
	bh=UWD7Gz4l8eFf4WE+zmm01yGeKou2svWC1D5pcJUfU/c=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=s7X58L9++m04e4lD274P+G/hqTgkSOBQ8x+dxCgo0IS9merTmwo8KKNUYtEBM+PL2XalBNrLEYo7iXBg7jWISEklzO0S4UUv8oObY36iTV27UmZDZXG4L1A/RUmqhNQvBzelWtqP239LBhRLNtIK3KyEOvBbnRvPF9UWqypIF4E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fdLeqKVi; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fdLeqKVi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728970760; x=1760506760;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UWD7Gz4l8eFf4WE+zmm01yGeKou2svWC1D5pcJUfU/c=;
  b=fdLeqKViJVQXejtSPF2FBaOPJ3OHM6RMPJ/N2rk3U7vN9CyAch5GDrYD
   Sa4yWQAA9Lc8hZuBRISDsEgs9KHs11STwX+jr25d4Tfs3lK4wF2IDjDWN
   L+OCZDWoNVozlz87E+WpCTTEtie1lj2MnVyqD3M8+fArf2z9TxRKUwK3X
   nzo9IRuj7yBT6PssZEjYaC4jlNE4FfI4Jlp66x5iu0+7Lps6gMaXLzp7z
   TNs3A9mL4tMDo/F5isPPKe3oKFCR28C+3V7SNGq9NCAkgX00mqLA6TB5W
   XuWl/A1TDz1X2w1tq64eLzBpkEl0yTrfXs1jp3eW8iHI6dxugA33ilRxI
   w==;
X-CSE-ConnectionGUID: ToqyEGITTJGldfzSjqtgCg==
X-CSE-MsgGUID: 0095eaUxSlOWibaN4d8vUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="50876922"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="50876922"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 22:39:19 -0700
X-CSE-ConnectionGUID: fd/YOaqnQ06yyEGffpB5Zw==
X-CSE-MsgGUID: bg7E42eaTAibzld6tTcUtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="81755287"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 14 Oct 2024 22:39:18 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Oct 2024 22:39:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Oct 2024 22:39:17 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 14 Oct 2024 22:39:17 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 14 Oct 2024 22:39:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lMgO5v++b9pDTnqsgjyzSsNC8iEquhbIhSIuNHL++DDdmG5NrMkyMA4xwABurVU1tsiU2fMhZVk93vhgot3fuBWcr5FPjV13FJg/KTHK3UXCE3zz4gTarvv9TpIaCLJOSX8y4dTztjuiW2KzFEOh6EIs2ffqXODLHUTLY1nZbQzOI//LS2OABsRDNACXb6GQZEIBLsbHv6BtIFIoDveiQeGtYwGfgCUxxvf5F/Qjcd3Vvtz5rYwlyzzm/vAz7vN1VBjfGtarTFYcIVjyw3+eooGntczVmk2723+ZChl2DIa0OobEhBr6O13IlQTmGUau3ZTlMaN5Z1OfGs9fmyuqeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nDCVD7Q8VZEmRVChU9RcYBS8Uo3/Q2D8iCDmQOUGHSA=;
 b=XKitZo9LaxEijwfCVqbO5SIXqWdBiMBk31XE+W1OVe92uMpNE0HdCrOk9u+kbNMT4K65qIREw+teLSIaXyhFgjXl5t/LN0yoKavXpnsBXSVFrbu6jYM1p6MrMjeh9A0xWwbrefB2iRHYIG9/rx9JUCLTWgzirlANo+5ymAxNtnCebIqWNZ4WwCK8CJK5xifwZXdFd1cAOAv3ggaQpOpvzmzIZUPWHj8MphtOHaeMCH69Jw9m6gveGBZvxevqPAgLiRZEe5S2q/BVXobEZgmmf8BZMYC+MI27ZzWHL7LJ3gGHKT+k4UB/nZkIJrAbXqtyYEttaUcMHuPT7hGUVKzMNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MN0PR11MB6253.namprd11.prod.outlook.com (2603:10b6:208:3c6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Tue, 15 Oct
 2024 05:39:12 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 05:39:11 +0000
Date: Tue, 15 Oct 2024 13:39:02 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Christian Brauner <brauner@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Christian Brauner
	<christianvanbrauner@gmail.com>, <oliver.sang@intel.com>
Subject: [brauner-github:vfs.experiments] [fs]  007604382b:
 WARNING:at_fs/open.c:#filp_flush
Message-ID: <202410151043.5d224a27-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0052.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::20) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MN0PR11MB6253:EE_
X-MS-Office365-Filtering-Correlation-Id: 75922e14-3d68-4587-ea50-08dcecdbb23f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vL1pNE5eGL/xXkYZKkBpaNsDPAaIXv/N9cTJbN3JUa1umzMCzdu9mnfj1CAG?=
 =?us-ascii?Q?OwJFE9lAesSiZewIRnuHwcKfU9lxxR7++JB7VsId+jO/89Jp6sncm1i6CkCT?=
 =?us-ascii?Q?tRVRwUV9bYvloLrUumaekhiStVak5mvWN3gnFQeyrcsCebufdUpIhuNN8OJt?=
 =?us-ascii?Q?pzdB0/bC2N3wMpuL8ihW0sRJiZijn8o1el7qQlF5pdXMyyYuuYPwCq42RfBM?=
 =?us-ascii?Q?lwRByc11fw25x3iLmR8LV2HYIbZ3KkNxepiKzJbNX1lUVI5kHArFtc0U8jk6?=
 =?us-ascii?Q?dMMY7VdJIiOO4BkUkt6MW+3IQ/gRWntdcQaGNqNvbgurGa0qZ4A/cwyga0p1?=
 =?us-ascii?Q?LmUtKNkAHaIed7IMOcMYlunId3VhDGUUI2sDVyCx4S7wFSWymZKTi4zMNEYa?=
 =?us-ascii?Q?dY0+BTsWHYgiAGSwFMIdtKBPngBMSdSX++L25WzkF1AKtMvmxt2YigpjvOK9?=
 =?us-ascii?Q?dtKmrL0e6Obril280J3irm5a+q/vrwMv7hU0h8iun+eet9VfjEGkOxnt7wpF?=
 =?us-ascii?Q?+FX3YRlcaEOScnEGClI3ssB2G/gu/wFJCKcfkb1kvdoUINqXMGzlgR+9kcog?=
 =?us-ascii?Q?lWR6Y+20/+XOAUPxiqcM4fPrF1ynGPnDoeKslDxQHK8pPiwkz2gY2bUGZrEy?=
 =?us-ascii?Q?Fy5Drmd0VIQQtFvCqdeTAV6yFbCi9dXQoJQyutfX28WPmBgPaSkYmEYYRdho?=
 =?us-ascii?Q?K3dP+oGq1VNblwa1Bs2RVyto5FNiGqd9efAt67uq3iMPyn0V9VCKkEvhm3Xd?=
 =?us-ascii?Q?R9u5NxNMU23KYqsl3pdHT6ySqh70OJRvYPeYWtcG3KxN390Zyf7baPrA+6cf?=
 =?us-ascii?Q?MuQGjPzig5f6Mlq1iFWwIfYDgJvx2B144iUMeDap9IKhyAmE2JIUCug501jY?=
 =?us-ascii?Q?GsjYPh+LhID4fcLGQfGa0T0aVRy+G2l2QoPySdzIPCnHL9TALitU8tu/CItq?=
 =?us-ascii?Q?kAva5pHr6UZtDhyh9YA57+2lDlwEz9xM5jjmDE9ytCGn2hbzDrprLAJtQbuw?=
 =?us-ascii?Q?x6MSLdATJZjMpeCtZMTd+xc2fwjjdM/i4JNjja6ixcWegDFBP3ZSaIVP+PkQ?=
 =?us-ascii?Q?1jM/EeydGeuQxrQ0mi/gqc7SnVkTsnbVlFzKCq9tI9LAiaaarbNxBzS8xhLP?=
 =?us-ascii?Q?c3zExfGR+DdbTYBsvpLta8RP0ZLWheHsm0+yCecVsTHY8sxu/KRNiPGQVpXL?=
 =?us-ascii?Q?zSKKseD2vfE5KUzaIq+FJeD3PtEsrX1F8VNJ0HprkMFdtqNnJOLGjsOAUro?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V12YZTBnei9MMehnw6wnRbKKamJZfqZD72YlAsBWbxbDX9Zee4Vm4w49K3nl?=
 =?us-ascii?Q?mHmGO8OO5NFwcG+fq8XBg38RhqccwhDTqa+uDXIb6g34Tm4y1C2ep2+rplKL?=
 =?us-ascii?Q?26S+I1Q6+Bi8YosTT8lqaTbMuxCF6+ufaemg65zYF6ZV9huHw9WqywZN7lIz?=
 =?us-ascii?Q?em//yYD7DlGWYToQE9vbZlYnzE0Eks13HdvB3Bg8LK21kyFHUHyQk+sAcUlD?=
 =?us-ascii?Q?mN6xE0ZB8P76KrXhI9rEUD2AMQGGf+7pt/NFjx7qjGkBk+2MuVKfrRwktihM?=
 =?us-ascii?Q?P13ACakrYUrJUmT0RDqRk7prIq1iaBxv5yma/nT9vUxZr+OahUO8ffVHjsHc?=
 =?us-ascii?Q?wYlHw7zYaO/+pbDndEQArv4khjj8RBdJM33MBTQdfnD1s0af66nOFFVdatQM?=
 =?us-ascii?Q?gRo5HOKa7gbkvwPXR2VxkhHYGrUwb0GhA7DDOONk+8UCyUOKANuHK2IV7pwv?=
 =?us-ascii?Q?LKllx5KtgznKOGrQAQgmheqL6crVJczW3BTABLoDK+nH6bgcfvXLINeWme99?=
 =?us-ascii?Q?zxDwkwMZaLwDeeK4x+bb+ZYNy98p4daEWi1/TXVxoI4ssv7kTVp82LwclCyv?=
 =?us-ascii?Q?o/bea5IqtVAOEQX0BtVIOLSX8N+VS+7KexR1RB6EcXOHPlB9YM9rBXaKq0Y3?=
 =?us-ascii?Q?a333bZMk/6Wb8jqzpWiUnS1d9BoTgo/obOQVMHd3bYJ6DMrhxtk+3uf9OxrC?=
 =?us-ascii?Q?9Z4sWVldPP6j8kijdy9tpdKDGG1HAVLxcYi64pdpycULnvsND2aXZqTuI2YU?=
 =?us-ascii?Q?EHHdjEdGsCFQbB+1Y6aOZY8O6EUuN4MpQZeLdtX6Rt0BpkeRogp4V+yF3QI/?=
 =?us-ascii?Q?Zbid8env6uo7dnhtG8h3SWnbSVCX3aaTUz/R/2aaNMXuxKT9Kq4LPE8OMnXW?=
 =?us-ascii?Q?jAWEUIFIX+qOVs0CFv3VCAUCKleSeA4oGPjc6K5lagvArNujCigqwzGi8gv1?=
 =?us-ascii?Q?+cRmyrZUW4n2Qzd2WnUHBYJleUIulKzYexRHu34jGtVgRseBP9CJFH2txw3S?=
 =?us-ascii?Q?5y0ugrB8ZXfCUHwK2H6Op79YrXXHW+E6L8Evahz2Oqr5r6GSLRydANQ2BKbW?=
 =?us-ascii?Q?2sedJ3Md/ydjQBpLde6w/1PVTMHw5qrNRlp2Jj4jyxfzqx/MZMsaZIfoxbIQ?=
 =?us-ascii?Q?4rDVBg8rwnAKUUG8QRr5abuUYbaod98yG9KEKP19eMYifFhmUu0+lKH+B5Ka?=
 =?us-ascii?Q?BRZIEjwtKSWsE5bz21cRNC2mjwXkxzKsKNUrJZSejBo8kjarws2nVCfclp3s?=
 =?us-ascii?Q?2n3yGH/cDYfFTo9I2PJn7xcHOI9y02dgM2vCVCZXRxMe4pjd9WerYMvcEw0c?=
 =?us-ascii?Q?Dx/GiGDMXjjr/19dVDZrrXtEvwrs0oVnxQ0Dav8yYjlt8jkDbdXqsmU7yhY9?=
 =?us-ascii?Q?n+we/pPpl+Vd7ByQBvfRIiJ8+2tZs1SrDaRpqR0wa67QlFSd8pHUyDW90AkB?=
 =?us-ascii?Q?LK9lXCRX8iaMuTZBQwRlK08XxgXsihik1ZXv2pPyiPE8oSSe26tAWewDRD8a?=
 =?us-ascii?Q?7cseEEG0KGRJP9qTvJvR9+/s6AKIVydtKTu3IioT0RZfqGt23Wz1BhECcuqk?=
 =?us-ascii?Q?ZQc4W4HIvwAgQo1KETj1Q5FuXh+mH+ME0bN3H9vGbaDDtNnSuUEwK50QZkir?=
 =?us-ascii?Q?/w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75922e14-3d68-4587-ea50-08dcecdbb23f
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 05:39:11.5395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zpEPHzPwJbB41QpijZ8oojUR7OXkchYCN1WUwOeUjZUuk7yXs830pSOZ4TnAl/3kWPhSYFjZiFbolmbiehihKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6253
X-OriginatorOrg: intel.com


hi, Christian Brauner,

we send out this report FYI.

we don't have enough knowledge how the issues are related with your code. but by
rebuilding kernel and reruning more, the issues are persistent.

"WARNING:at_fs/open.c:#filp_flush" does not always happen, 6 times out of 20
runs as below table. we report upon it because it's the first issue in dmesg
when it appears.

"WARNING:at_lib/rcuref.c:#rcuref_long_put_slowpath" is another random issue.

but "RIP:aa_file_perm" is different, it always happens and kernel crash after
it.

we uploaded one dmesg as example.
https://download.01.org/0day-ci/archive/20241015/202410151043.5d224a27-oliver.sang@intel.com/dmesg.xz


=========================================================================================
tbox_group/testcase/rootfs/kconfig/compiler/nr_threads/disk/testtime/fs/test/cpufreq_governor:
  lkp-icl-2sp8/stress-ng/debian-12-x86_64-20240206.cgz/x86_64-rhel-8.3/gcc-12/100%/1HDD/60s/btrfs/getdent/performance

d72d156a1254d829 007604382bae5e5955ef294a676
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :20         100%          20:20    dmesg.BUG:kernel_NULL_pointer_dereference,address
           :20         100%          20:20    dmesg.Kernel_panic-not_syncing:Fatal_exception
           :20         100%          20:20    dmesg.Oops
           :20         100%          20:20    dmesg.RIP:aa_file_perm
           :20          30%           6:20    dmesg.RIP:filp_flush
           :20          25%           5:20    dmesg.RIP:rcuref_long_put_slowpath
           :20          30%           6:20    dmesg.WARNING:at_fs/open.c:#filp_flush
           :20          25%           5:20    dmesg.WARNING:at_lib/rcuref.c:#rcuref_long_put_slowpath


above is for btrfs.

we also change to test xfs, see the similar results, though the rate for two
WARNING a little lower.

=========================================================================================
tbox_group/testcase/rootfs/kconfig/compiler/nr_threads/disk/testtime/fs/test/cpufreq_governor:
  lkp-icl-2sp8/stress-ng/debian-12-x86_64-20240206.cgz/x86_64-rhel-8.3/gcc-12/100%/1HDD/60s/xfs/getdent/performance

d72d156a1254d829 007604382bae5e5955ef294a676
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :20         100%          20:20    dmesg.BUG:kernel_NULL_pointer_dereference,address
           :20         100%          20:20    dmesg.Kernel_panic-not_syncing:Fatal_exception
           :20         100%          20:20    dmesg.Oops
           :20         100%          20:20    dmesg.RIP:aa_file_perm
           :20          10%           2:20    dmesg.RIP:filp_flush
           :20          10%           2:20    dmesg.RIP:rcuref_long_put_slowpath
           :20          15%           3:20    dmesg.WARNING:at_fs/open.c:#filp_flush
           :20          10%           2:20    dmesg.WARNING:at_lib/rcuref.c:#rcuref_long_put_slowpath



Hello,

kernel test robot noticed "WARNING:at_fs/open.c:#filp_flush" on:

commit: 007604382bae5e5955ef294a676bd3eb1c1bbac2 ("fs: port files to rcuref_long_t")
https://github.com/brauner/linux.git vfs.experiments

in testcase: stress-ng
version: stress-ng-x86_64-3be6dc267-1_20240912
with following parameters:

	nr_threads: 100%
	disk: 1HDD
	testtime: 60s
	fs: btrfs
	test: getdent
	cpufreq_governor: performance



config: x86_64-rhel-8.3
compiler: gcc-12
test machine: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202410151043.5d224a27-oliver.sang@intel.com


[   51.880368][ T3051] ------------[ cut here ]------------
[   51.886180][ T3051] VFS: Close: file count is 0 (f_op=proc_fdinfo_operations)
[ 51.886203][ T3051] WARNING: CPU: 15 PID: 3051 at fs/open.c:1518 filp_flush (fs/open.c:1518) 
[   51.902820][ T3051] Modules linked in: intel_rapl_msr intel_rapl_common x86_pkg_temp_thermal coretemp kvm_intel btrfs kvm crct10dif_pclmul crc32_pclmul blake2b_generic ipmi_ssif ghash_clmulni_intel sha512_ssse3 xor sd_mod raid6_pq sg ahci rapl libcrc32c ast crc32c_intel libahci intel_th_gth intel_cstate drm_shmem_helper mei_me acpi_power_meter intel_th_pci nvme ioatdma i2c_i801 intel_uncore megaraid_sas ipmi_si dax_hmem acpi_ipmi libata drm_kms_helper mei nvme_core intel_pch_thermal i2c_smbus intel_th dca wmi ipmi_devintf ipmi_msghandler joydev binfmt_misc drm fuse loop dm_mod ip_tables
[   51.956900][ T3051] CPU: 15 UID: 0 PID: 3051 Comm: stress-ng-getde Not tainted 6.12.0-rc1-00003-g007604382bae #1
[   51.967564][ T3051] Hardware name: Inspur NF5180M6/NF5180M6, BIOS 06.00.04 04/12/2022
[ 51.975851][ T3051] RIP: 0010:filp_flush (fs/open.c:1518) 
[ 51.981093][ T3051] Code: 00 48 ba ff ff ff ff ff ff ff bf 41 54 55 48 89 f5 53 48 8b 07 48 8b 77 10 48 39 c2 73 1d 48 c7 c7 a8 23 9d 82 e8 52 81 c7 ff <0f> 0b 45 31 e4 44 89 e0 5b 5d 41 5c c3 cc cc cc cc 48 8b 46 70 48
All code
========
   0:	00 48 ba             	add    %cl,-0x46(%rax)
   3:	ff                   	(bad)  
   4:	ff                   	(bad)  
   5:	ff                   	(bad)  
   6:	ff                   	(bad)  
   7:	ff                   	(bad)  
   8:	ff                   	(bad)  
   9:	ff                   	(bad)  
   a:	bf 41 54 55 48       	mov    $0x48555441,%edi
   f:	89 f5                	mov    %esi,%ebp
  11:	53                   	push   %rbx
  12:	48 8b 07             	mov    (%rdi),%rax
  15:	48 8b 77 10          	mov    0x10(%rdi),%rsi
  19:	48 39 c2             	cmp    %rax,%rdx
  1c:	73 1d                	jae    0x3b
  1e:	48 c7 c7 a8 23 9d 82 	mov    $0xffffffff829d23a8,%rdi
  25:	e8 52 81 c7 ff       	callq  0xffffffffffc7817c
  2a:*	0f 0b                	ud2    		<-- trapping instruction
  2c:	45 31 e4             	xor    %r12d,%r12d
  2f:	44 89 e0             	mov    %r12d,%eax
  32:	5b                   	pop    %rbx
  33:	5d                   	pop    %rbp
  34:	41 5c                	pop    %r12
  36:	c3                   	retq   
  37:	cc                   	int3   
  38:	cc                   	int3   
  39:	cc                   	int3   
  3a:	cc                   	int3   
  3b:	48 8b 46 70          	mov    0x70(%rsi),%rax
  3f:	48                   	rex.W

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2    
   2:	45 31 e4             	xor    %r12d,%r12d
   5:	44 89 e0             	mov    %r12d,%eax
   8:	5b                   	pop    %rbx
   9:	5d                   	pop    %rbp
   a:	41 5c                	pop    %r12
   c:	c3                   	retq   
   d:	cc                   	int3   
   e:	cc                   	int3   
   f:	cc                   	int3   
  10:	cc                   	int3   
  11:	48 8b 46 70          	mov    0x70(%rsi),%rax
  15:	48                   	rex.W
[   52.001516][ T3051] RSP: 0018:ffa00000234f7ef8 EFLAGS: 00010286
[   52.007939][ T3051] RAX: 0000000000000000 RBX: ffa00000234f7f58 RCX: 0000000000000027
[   52.016279][ T3051] RDX: ff11001fff9a0b08 RSI: 0000000000000001 RDI: ff11001fff9a0b00
[   52.024642][ T3051] RBP: ff11000129f8b440 R08: 0000000000000000 R09: 0000000000000003
[   52.032985][ T3051] R10: ffa00000234f7d88 R11: ffffffff82fd8448 R12: 0000000000000003
[   52.041319][ T3051] R13: 0000000000000003 R14: 0000000000000000 R15: 0000000000000000
[   52.049686][ T3051] FS:  00007fe9324f9580(0000) GS:ff11001fff980000(0000) knlGS:0000000000000000
[   52.058969][ T3051] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   52.065938][ T3051] CR2: 000055f9aa6d21c8 CR3: 000000010aede002 CR4: 0000000000773ef0
[   52.074331][ T3051] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   52.082680][ T3051] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   52.091049][ T3051] PKRU: 55555554
[   52.094964][ T3051] Call Trace:
[   52.098594][ T3051]  <TASK>
[ 52.101846][ T3051] ? __warn (kernel/panic.c:748) 
[ 52.106281][ T3051] ? filp_flush (fs/open.c:1518) 
[ 52.110985][ T3051] ? report_bug (lib/bug.c:180 lib/bug.c:219) 
[ 52.115844][ T3051] ? handle_bug (arch/x86/kernel/traps.c:285) 
[ 52.120526][ T3051] ? exc_invalid_op (arch/x86/kernel/traps.c:309 (discriminator 1)) 
[ 52.125494][ T3051] ? asm_exc_invalid_op (arch/x86/include/asm/idtentry.h:621) 
[ 52.130830][ T3051] ? filp_flush (fs/open.c:1518) 
[ 52.135441][ T3051] ? filp_flush (fs/open.c:1518) 
[ 52.140086][ T3051] __x64_sys_close (fs/open.c:1565 fs/open.c:1550 fs/open.c:1550) 
[ 52.144983][ T3051] do_syscall_64 (arch/x86/entry/common.c:52 arch/x86/entry/common.c:83) 
[ 52.149796][ T3051] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130) 
[   52.155968][ T3051] RIP: 0033:0x7fe932c938e0
[ 52.160689][ T3051] Code: 0d 00 00 00 eb b2 e8 ff f7 01 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 80 3d 01 1d 0e 00 00 74 17 b8 03 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 48 c3 0f 1f 80 00 00 00 00 48 83 ec 18 89 7c
All code
========
   0:	0d 00 00 00 eb       	or     $0xeb000000,%eax
   5:	b2 e8                	mov    $0xe8,%dl
   7:	ff f7                	push   %rdi
   9:	01 00                	add    %eax,(%rax)
   b:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  12:	00 00 00 
  15:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  1a:	80 3d 01 1d 0e 00 00 	cmpb   $0x0,0xe1d01(%rip)        # 0xe1d22
  21:	74 17                	je     0x3a
  23:	b8 03 00 00 00       	mov    $0x3,%eax
  28:	0f 05                	syscall 
  2a:*	48 3d 00 f0 ff ff    	cmp    $0xfffffffffffff000,%rax		<-- trapping instruction
  30:	77 48                	ja     0x7a
  32:	c3                   	retq   
  33:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  3a:	48 83 ec 18          	sub    $0x18,%rsp
  3e:	89                   	.byte 0x89
  3f:	7c                   	.byte 0x7c

Code starting with the faulting instruction
===========================================
   0:	48 3d 00 f0 ff ff    	cmp    $0xfffffffffffff000,%rax
   6:	77 48                	ja     0x50
   8:	c3                   	retq   
   9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  10:	48 83 ec 18          	sub    $0x18,%rsp
  14:	89                   	.byte 0x89
  15:	7c                   	.byte 0x7c


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241015/202410151043.5d224a27-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

