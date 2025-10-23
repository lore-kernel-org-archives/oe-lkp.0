Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47462D839C
	for <oe-lkp@lists.linux.dev>; Thu, 23 Oct 2025 07:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761204635; cv=fail; b=VwJi5AvTFC9Wy3j5lQwQF/SA1d4Ch6mcNpb82du3sfL65kMj2sQ0/X7ma+nF+n3QzRCOv1ODfvlcNu0Q+KhDa+ggpIUDfQ+vH1fyUifA/xFlb/Wl7FEhjiv2c8C4LtqKkg7vvJCbqDvLYBNcotL+zG+bF221pctrH/y0VK8z878=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761204635; c=relaxed/simple;
	bh=xk8Rq9yslEpfbOz1dWp/4+wpDgsFToOzuKqc0hFjmEE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=BmXUbHQD+rWnW1pxi0UlLXywvD4rENWy6Cv8cTSvA+syQxgUGJF5lNXGIZjFAkmPmcuR+lGXDO7YDkg0g5GAFDHJBplrqo8WKqMyAcR1TiwKvqqEAxCDHd9G1zIqoXnvuMmSSgMULsw++cwJsSOVk3TUrg+1LHrPFFxHeSbMAH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B4KZjcnf; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B4KZjcnf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761204633; x=1792740633;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xk8Rq9yslEpfbOz1dWp/4+wpDgsFToOzuKqc0hFjmEE=;
  b=B4KZjcnfwm3j5JE0rzPTKzUwXcNDp0ZSI9b2h050e++C6LG4RkEtuHE1
   HuGPb0VtqPszjsw7TdoyciwweLOzcldItZ3/KFRirw+DFxI6JMw+D+fCV
   Grap6zCawk474CEgwJshic+0pvQ3lwRU19iy42GSfLEXqWWi6Wzhm9uBm
   bG+k6hC2WEITShoPEnE3BpDaefEnTKXPFgCell185An77+BM2R1PEyHPo
   97kgVI5TNiWeN5WPhiK8Ad3Mrj1aWdMs8qw3dE80ydDiX3t39mbGNJg0n
   WrZ1mrbfuOBoaOzFMpmV3C888xeFJtiTc6S9kTpgZLyoOUBSKBgKwddHz
   w==;
X-CSE-ConnectionGUID: UWE4WlckTOar6ngNcHxnPw==
X-CSE-MsgGUID: 1DEoxSBKQACaPwH0SUo6dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74803382"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="74803382"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 00:30:33 -0700
X-CSE-ConnectionGUID: ubFVTcRHRbmTbAloXmVUHw==
X-CSE-MsgGUID: /IcHHgcyT2qSpIpodWTyOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="184148845"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 00:30:33 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 00:30:32 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 00:30:32 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.30) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 00:30:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CvRTO9GdPXdB8hzVqiYKLHDVkX3401D8VoQtg0CR/uVrPXJFMGdgrnQ3spkXSZj2XyLIH5vC4fiHgl28Vct+fguJA3YqknoII2O1v/XJuqK3ykkSrmzKUgvyyTEJS5T0yjwtohAowmJjLJtuDxXITjOMpnGwABoHKO5B5oerUsqkV6pnkOPVNGVwIjCXPFu1MtVr4lDBKtYGYdCbUAZt2+o3/pFmO5PltUwxeNvdW6s4OmduAs/+HgMSsLYWILtqMAPI/Pd9ChjBwkHVFW9P+NgEXvGGuYQhPHMObZoOWnx72ZFRRjFd5CKKb/YwuIdaeZaH6tGjtHtethXIJSuZzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ciJ35czM3ox2GvNUTArBOd8LC8gu8e7/gT8hbj88Hmg=;
 b=ZbcqCZQ56wrIiKawQeM6i/NARsARbipyRdFsC7HZiVTGj/NS5G3qeS67JCtdJNxESvqPbXeVSfzppIvZtSlMMdA+2AiflULskOytz4ky8AJOqJZGtAW2QgtIvPzrCM7EqSD4MwwuF8grj7EqSKORCUDf27p7QquoErdTKoAQxcu3xyjKP9oWuDtNiPXmLgm3MVAP9C7xx9ZJZiQNTrF4+NwxaoDYCBfuWOt1BHjHk4lQdVnw5l+iW6ai88xl3YXdAg/ggf+5SmTblH4UvAG/nJ4x4OQWcOcjKxf8TjNv5OrtVYAI8IdsKlfLdTq+Bn8v3BB/QDGwkRJL6ROZob0ueA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DM4PR11MB5312.namprd11.prod.outlook.com (2603:10b6:5:393::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Thu, 23 Oct
 2025 07:30:25 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 07:30:25 +0000
Date: Thu, 23 Oct 2025 15:30:17 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [tglx-devel:rseq/slice-v2] [x86/uaccess]  227a9a48be:
 BUG:unable_to_handle_page_fault_for_address
Message-ID: <202510231428.d088556-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: KUZPR02CA0001.apcprd02.prod.outlook.com
 (2603:1096:d10:33::6) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DM4PR11MB5312:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ee9385b-b9db-4d2c-417e-08de12060893
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?j0b4ffSFWH562v+AOS4MxXuxSc2fXmDCKkIMnBo6byR0rLNmJpFNuqQm0Wuz?=
 =?us-ascii?Q?LFiSl3TaBxmpehaSmGy85U8IMZwrze14FGCJa5mKJAcpDyQ9vpqbXi7ip0cD?=
 =?us-ascii?Q?q65cQjcpx+cTl3BriDdapX4gnYvrcfxZj6HbosC/iXVjunIriwZIQZBwVPBY?=
 =?us-ascii?Q?uyZvmNbztqd0u+ZE2z4afxApPOgPUT9Mmrl8tBq8jml5HbxpssBxSCheA0mS?=
 =?us-ascii?Q?CqG3iVVHDgt/fpHB1ZUdzJLbq42jv8oWnGEeQrHW55BzVgeHmRLEvlVA3+5X?=
 =?us-ascii?Q?v9Fi/ZRFAKfyqmEZJ0B9Diy0/0GUzdQ/+76JjPLwZF+Xc8bynyMj2mY0W+Xk?=
 =?us-ascii?Q?D4RCrKpGLTt93SmGqfi5IAebNHogWqiNOH8Hyc1302u5hLttGhiG8SIcaMYX?=
 =?us-ascii?Q?jByKQwSd4CXSbLDZJEd/JX9i5jY7sTJUCi2mhWGSK+xz2NHuEwCtmQUZTTSV?=
 =?us-ascii?Q?KZHyRNK0Dfat/Ml2qlYEiPzUFE7YY8LVPrgplo8qHRzrFrrlMLSKeb1kwPrJ?=
 =?us-ascii?Q?zdAUSmML/iVsVnLlIRN2Sp7WAAW77LzqJz9JtlciISRTVURETLu/f4lbeTro?=
 =?us-ascii?Q?cjQR04PMD3vK13y6OtbdtlmnEODPr8zN9lfoRbb4uC2TkHkpdSAbzPAjEkTT?=
 =?us-ascii?Q?/j4vzzuHoX0Iu9QEI3cWMFfvgLQyoXkMwQp9wuvSL7Lx3IV/hyHFDoCv9ayn?=
 =?us-ascii?Q?Yl85PVGHi4jzK1yKOIPaIG5s0QWtEmhptGPxNplKQBkuFDEUEWL+gVO5VuzL?=
 =?us-ascii?Q?A6ByaEuivyE+Ihe7C5YqMeCwmeDn6Tl2+4P2TnTC9isk2v04UAej1k/PxQ3z?=
 =?us-ascii?Q?I+bdl96B9a8kW6c8wOSwjoYsI87do9Np80gDtbdPPcQ3yEv1hgR/KbVVH9HS?=
 =?us-ascii?Q?IjeYcRbiwjfe6fHLBdCvYlUyapGKDZOnf2Uq55NtLKrW5ZVFm42oRtMsit9q?=
 =?us-ascii?Q?QykmBe1Kkn8ulA+YhVbiufVV2m3qytBobX6WmA30hIjruPC/pHbAVrFz4lvO?=
 =?us-ascii?Q?cK0fDFjsFpfpTNN5uM99tPRLtIxx6p/SU7INVOnuhOWRndZMS5q+9wgmzPUI?=
 =?us-ascii?Q?qkhg0WvwcSOWdhwACDSA17T9dKC8NToPh+txLk4KCzY8d8KNnHmfZ06HqP4f?=
 =?us-ascii?Q?HUxvn6hFHqlwWsc/VJX79IPqup6FKyizIdd68/IbrgWVF8j99D3RNOYccHwt?=
 =?us-ascii?Q?zhujJyhoQZOez1B5f/VlbXvReSzo7xo1S4w/IoMqtg4Av+iP3RXa3TSNguqz?=
 =?us-ascii?Q?15t8LSiKLa1avvGTvaPtrVgv3hXLWKbQpbGLd6hxxBnZ3B920aKgmqiMJFcM?=
 =?us-ascii?Q?kDACHJAXai9f+WhuZRzr/jKVTaXYvUzS/MLtcI0RJtWc4KpkMrMLopx1Q/Le?=
 =?us-ascii?Q?CIG6LnbNhGoTH1tr3r93nV5e/F61HqvRm7FI3jGEDQ4p8qjMnnvVneZQsGH9?=
 =?us-ascii?Q?DKjKV4uNN1ry3558sJMYr3jQygwL38BUoz3qO8VmPxb7G2Ja16EDwg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?omyXH7SV7Zelyi7BXEmS0S0yo9b3JSuYzFC6gcRn6gNffQUn6w80MfMj8Lmh?=
 =?us-ascii?Q?KucQBNiZPBPfFisGvcP2rIveYohCp6YMZUcCneguPLTAEFOuZ81crSYCbQ5y?=
 =?us-ascii?Q?Z/ntGwVrUmCmcjbX68rn2MNp7Px/eDp+BTmFDPhQCGswrCuXIrX1yr5VLP75?=
 =?us-ascii?Q?XWvI7wW4qG7H0sRwtC+9Vgaw5uzk+XVUj1KZ5ae58ZNMFoI8Iu3KU8kbO9Y/?=
 =?us-ascii?Q?2Pg0P9YlZ8hPuLU98YXai2n3PifNYp4LgyGyK2nnO2/67LlEA3O4IPbLSQMx?=
 =?us-ascii?Q?vc64hJt+HBWI40nmTTEQb58FkGjpLzwnUaDAc++xG2f7nQBqwmAppJePm3u/?=
 =?us-ascii?Q?KRtMqgVz3lEsYHY10OdYydjKJmuRet6iRX9L/Anw80aOn8n76fXG3ylMGVhU?=
 =?us-ascii?Q?OtLcXVJtLtgW/8q1GFuTr2des2XX7Jxu4joyK1ye6fs3ln3/lDKabESHzq2o?=
 =?us-ascii?Q?vJ0SZ9jP/uYnTtUDlUH6Q+gMpBT3ZiX8jzjHs2V4HNOhrsm1aDpQ2Nd46IN6?=
 =?us-ascii?Q?s/20o5ua89T+PFqstmZd/W+9111lqVUvO/l4UgjTgxepFqUjHBavmuDvZl3O?=
 =?us-ascii?Q?F+rJzNwSg+rl0kkDYLVrfQHooOf49Rf770g47VEa+3wVsG/BUPFD2PgMKGLw?=
 =?us-ascii?Q?rNhN5LDyKCH8myLXLK08EruZkH1l2VpzS/kIWKWio0vXjklMD4KnctHiUo2B?=
 =?us-ascii?Q?+DLNhFlZ5gTPFgiuCBUjKeUtQ2qB7A0qmR6tm97jHJjkqlgQs0cZgeas3gcA?=
 =?us-ascii?Q?gNYTOkD3lHFdfRKvpVzojhTnp6hyayAcMabqaBC6kIpakWzPddLvDJNqO1CV?=
 =?us-ascii?Q?lUJUYrxmqvHILy4W0cRbm9gwvaP1THywMgeaiY5vNltfZj9vg7b3rANWHafj?=
 =?us-ascii?Q?aUcfnpJ2dWGKtFWwDLWAQRFJrB7GRzOcU8ju98XN+GtTimOmRabH5x/zfsfq?=
 =?us-ascii?Q?cCKdxl9JGEYMVdjK2AM5FUYsWtd9W93B2X60dpfZG47/kVcDxWywUXt6B8T0?=
 =?us-ascii?Q?/XOYaPhIE4eIC4LbiUXSdSR087jkgZXXxjiKht8ALFmuJ96Vvx8QN+WBdv3C?=
 =?us-ascii?Q?010n9su/vdMZacrX/ueJkf+6DbTjvbdOUixzd/K4Ma62MvNAIs13UXT2AWix?=
 =?us-ascii?Q?zSn27YIOfOG1R6B1RtnHnnazeTFLrBIjlLdH5f2ZsWOvQwnYbEKWoUC6xPZZ?=
 =?us-ascii?Q?aXtEHE03BugQ2HVBedqMPNd54g4v8KlXFvI5vYTJi5n/K5zg/GniaCOKe4Hr?=
 =?us-ascii?Q?vNZxHp3hQ0MTO/pDrszOGZxsYsvOaLvSnahzZOQ2zH2q5wOgYBs1kGlNihct?=
 =?us-ascii?Q?f0rHViYejbq873QkX34iRjH2mbFAXORSobZyTr4rOP0lu1yEppYUKJDoa9Gf?=
 =?us-ascii?Q?9jibByIXO+nCFHzhOYh/JAZnEg5O4B6fpZca3PnCOM3ZJIKhK6aJHZWnLkBN?=
 =?us-ascii?Q?NIIAyY0V4vJMv3eKtFbIyw/gKagdAPXx5s+4XonQnAh7BTmhmtHa3U2RcxkT?=
 =?us-ascii?Q?gyjdEA3W9Ef63xuDm+h3gGa1d1EP2NcemPCa2LTYYJNR2MFEo2sn0P4cA+o3?=
 =?us-ascii?Q?YMDHsTbKewCph5X5hHX3VozvAwXMMlmVHQid41+YKeNkWNMjjbO8PpUi/vTH?=
 =?us-ascii?Q?Xg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ee9385b-b9db-4d2c-417e-08de12060893
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 07:30:25.7608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: adKO77Pfn4LI6nimcRZ0bORwx1uk9lb++YUhhvMpEhRFsu/yqwByG0i2jvHLpYiUXVo5cuozSLAIhC4RPcTB6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5312
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:unable_to_handle_page_fault_for_address" on:

commit: 227a9a48be5d752c0a6854d1454c42fd670c1f3e ("x86/uaccess: Use unsafe wrappers for ASM GOTO")
https://git.kernel.org/cgit/linux/kernel/git/tglx/devel.git rseq/slice-v2

in testcase: boot

config: i386-randconfig-141-20251022
compiler: gcc-14
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+---------------------------------------------+------------+------------+
|                                             | 821a44ce12 | 227a9a48be |
+---------------------------------------------+------------+------------+
| boot_successes                              | 18         | 0          |
| boot_failures                               | 0          | 18         |
| BUG:unable_to_handle_page_fault_for_address | 0          | 18         |
| Oops                                        | 0          | 18         |
| EIP:copy_to_kernel_nofault                  | 0          | 18         |
| Kernel_panic-not_syncing:Fatal_exception    | 0          | 18         |
+---------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202510231428.d088556-lkp@intel.com


[   16.992248][    T0] BUG: unable to handle page fault for address: ffcb2000
[   16.994015][    T0] #PF: supervisor write access in kernel mode
[   16.994645][    T0] #PF: error_code(0x0003) - permissions violation
[   16.995321][    T0] *pde = 0326d067 *pte = 0326b121
[   16.995868][    T0] Oops: Oops: 0003 [#1] SMP
[   16.996321][    T0] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.18.0-rc1-00003-g227a9a48be5d #1 PREEMPT
[   16.997384][    T0] EIP: copy_to_kernel_nofault (mm/maccess.c:78 (discriminator 7))
[   16.997993][    T0] Code: 83 f9 03 76 12 8b 36 89 30 83 e9 04 eb ea 66 8b 36 66 89 30 83 e9 02 89 d8 89 d6 29 c8 29 ce 83 f9 01 77 ea 85 c9 74 04 8a 16 <88> 10 e8 1d fe ff ff 31 c0 eb 11 89 30 eb 03 66 89 30 e8 0d fe ff
All code
========
   0:	83 f9 03             	cmp    $0x3,%ecx
   3:	76 12                	jbe    0x17
   5:	8b 36                	mov    (%rsi),%esi
   7:	89 30                	mov    %esi,(%rax)
   9:	83 e9 04             	sub    $0x4,%ecx
   c:	eb ea                	jmp    0xfffffffffffffff8
   e:	66 8b 36             	mov    (%rsi),%si
  11:	66 89 30             	mov    %si,(%rax)
  14:	83 e9 02             	sub    $0x2,%ecx
  17:	89 d8                	mov    %ebx,%eax
  19:	89 d6                	mov    %edx,%esi
  1b:	29 c8                	sub    %ecx,%eax
  1d:	29 ce                	sub    %ecx,%esi
  1f:	83 f9 01             	cmp    $0x1,%ecx
  22:	77 ea                	ja     0xe
  24:	85 c9                	test   %ecx,%ecx
  26:	74 04                	je     0x2c
  28:	8a 16                	mov    (%rsi),%dl
  2a:*	88 10                	mov    %dl,(%rax)		<-- trapping instruction
  2c:	e8 1d fe ff ff       	call   0xfffffffffffffe4e
  31:	31 c0                	xor    %eax,%eax
  33:	eb 11                	jmp    0x46
  35:	89 30                	mov    %esi,(%rax)
  37:	eb 03                	jmp    0x3c
  39:	66 89 30             	mov    %si,(%rax)
  3c:	e8                   	.byte 0xe8
  3d:	0d                   	.byte 0xd
  3e:	fe                   	(bad)
  3f:	ff                   	.byte 0xff

Code starting with the faulting instruction
===========================================
   0:	88 10                	mov    %dl,(%rax)
   2:	e8 1d fe ff ff       	call   0xfffffffffffffe24
   7:	31 c0                	xor    %eax,%eax
   9:	eb 11                	jmp    0x1c
   b:	89 30                	mov    %esi,(%rax)
   d:	eb 03                	jmp    0x12
   f:	66 89 30             	mov    %si,(%rax)
  12:	e8                   	.byte 0xe8
  13:	0d                   	.byte 0xd
  14:	fe                   	(bad)
  15:	ff                   	.byte 0xff
[   17.000167][    T0] EAX: ffcb2000 EBX: ffcb2001 ECX: 00000001 EDX: 82ba9f00
[   17.000906][    T0] ESI: 82ba9f6b EDI: ee7fdb35 EBP: 82ba9f5c ESP: 82ba9f54
[   17.001671][    T0] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00210002
[   17.002508][    T0] CR0: 80050033 CR2: ffcb2000 CR3: 0326a000 CR4: 00000090
[   17.003279][    T0] Call Trace:
[   17.003638][    T0]  mem_init (arch/x86/mm/init_32.c:675 (discriminator 2) arch/x86/mm/init_32.c:720 (discriminator 2))
[   17.004123][    T0]  mm_core_init (mm/mm_init.c:2708)
[   17.004578][    T0]  start_kernel (init/main.c:972)
[   17.006783][    T0]  i386_start_kernel (arch/x86/kernel/head32.c:79)
[   17.007289][    T0]  startup_32_smp (arch/x86/kernel/head_32.S:293)
[   17.007784][    T0] Modules linked in:
[   17.008183][    T0] CR2: 00000000ffcb2000
[   17.008631][    T0] ---[ end trace 0000000000000000 ]---
[   17.009250][    T0] EIP: copy_to_kernel_nofault (mm/maccess.c:78 (discriminator 7))
[   17.009853][    T0] Code: 83 f9 03 76 12 8b 36 89 30 83 e9 04 eb ea 66 8b 36 66 89 30 83 e9 02 89 d8 89 d6 29 c8 29 ce 83 f9 01 77 ea 85 c9 74 04 8a 16 <88> 10 e8 1d fe ff ff 31 c0 eb 11 89 30 eb 03 66 89 30 e8 0d fe ff
All code
========
   0:	83 f9 03             	cmp    $0x3,%ecx
   3:	76 12                	jbe    0x17
   5:	8b 36                	mov    (%rsi),%esi
   7:	89 30                	mov    %esi,(%rax)
   9:	83 e9 04             	sub    $0x4,%ecx
   c:	eb ea                	jmp    0xfffffffffffffff8
   e:	66 8b 36             	mov    (%rsi),%si
  11:	66 89 30             	mov    %si,(%rax)
  14:	83 e9 02             	sub    $0x2,%ecx
  17:	89 d8                	mov    %ebx,%eax
  19:	89 d6                	mov    %edx,%esi
  1b:	29 c8                	sub    %ecx,%eax
  1d:	29 ce                	sub    %ecx,%esi
  1f:	83 f9 01             	cmp    $0x1,%ecx
  22:	77 ea                	ja     0xe
  24:	85 c9                	test   %ecx,%ecx
  26:	74 04                	je     0x2c
  28:	8a 16                	mov    (%rsi),%dl
  2a:*	88 10                	mov    %dl,(%rax)		<-- trapping instruction
  2c:	e8 1d fe ff ff       	call   0xfffffffffffffe4e
  31:	31 c0                	xor    %eax,%eax
  33:	eb 11                	jmp    0x46
  35:	89 30                	mov    %esi,(%rax)
  37:	eb 03                	jmp    0x3c
  39:	66 89 30             	mov    %si,(%rax)
  3c:	e8                   	.byte 0xe8
  3d:	0d                   	.byte 0xd
  3e:	fe                   	(bad)
  3f:	ff                   	.byte 0xff

Code starting with the faulting instruction
===========================================
   0:	88 10                	mov    %dl,(%rax)
   2:	e8 1d fe ff ff       	call   0xfffffffffffffe24
   7:	31 c0                	xor    %eax,%eax
   9:	eb 11                	jmp    0x1c
   b:	89 30                	mov    %esi,(%rax)
   d:	eb 03                	jmp    0x12
   f:	66 89 30             	mov    %si,(%rax)
  12:	e8                   	.byte 0xe8
  13:	0d                   	.byte 0xd
  14:	fe                   	(bad)
  15:	ff                   	.byte 0xff


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20251023/202510231428.d088556-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

