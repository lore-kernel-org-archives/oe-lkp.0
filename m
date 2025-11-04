Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EB98F7D
	for <oe-lkp@lists.linux.dev>; Tue,  4 Nov 2025 06:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762239582; cv=fail; b=KDBiCHvvlPIbm+P5ctLd6IYmqRzeDStACECBCS0ZTNY7ku7dLGgUrAZsY6in3+bCOx9vD2s/JQ9yIzZ8rZZ7UW1E+yJ/2ZZL+7FsMSZQ6MomTq4azvPiQ/cfGqAb2Ms2xp98P8LE8zP0EKA+2iif1hFCqjyOd1NGkIo6WToDZYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762239582; c=relaxed/simple;
	bh=J9vEDSbJVSQAh1H+8QmuQBm9Ape/clp6DgyI0ZILqIE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=FzeqECZXRBDsscGxax1j1w3jLJAy2aUYrA5g3TqG5kfrZYYmIbb2uRtpoTAvqob7NvrHTdw1p4sQLjGr1oNM2Zqm1ql+LZnx/8J5+zI2HVOWLEcU7/7ih7rC39YlxMRBAYyaIS6NzLRFDe5OXluEnJtmRxdHbw12E9g1LhmJhPg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hsnnK4/Y; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hsnnK4/Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762239580; x=1793775580;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J9vEDSbJVSQAh1H+8QmuQBm9Ape/clp6DgyI0ZILqIE=;
  b=hsnnK4/YzybUQoJN0vyCOs+n2MUWVnwBs5d7eIJXK9XGU6K5XlfCv08a
   hfl6zAk8Kh9Cu7I4MqGQYOockyvY30V2GaIREpOIutlYAwM7s9NSOmVsf
   xuwaw8o+hve0V/uZW5BvTZnNKYpSii+OOAYaiXbIYVqiKQSlFuxiCRxhN
   aJPzFZ/AQOWkQa3Lkyg+k15zu9pQg46Gom7Hp4LLaOaeG8inPqoYdAl9k
   WBG+jJl9QRLgWc9K7cu3//2pgUnHD8Diq6Sv9c2V04UEEenDaCMSTsfMY
   PRN9T4vhA0kQnpPc7Cojy2cj+H3LCn4OADyPDSDSaWX6/eD9ZO/s+E2L1
   A==;
X-CSE-ConnectionGUID: N5dieOTpTjWie1QxBtocGA==
X-CSE-MsgGUID: VWmMccZ4SGGpLUlSeZMZxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="63338345"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="63338345"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 22:59:39 -0800
X-CSE-ConnectionGUID: FHg4hj7VRdilsVjslSnc8g==
X-CSE-MsgGUID: YhGjvrxbSTWoh+hgnPHVGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="224329352"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 22:59:37 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 22:59:38 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 3 Nov 2025 22:59:38 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.48) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 22:59:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GHQa1gKsdXQK78F9Xk0ZWo+edY3QiKPLPDAwRocBdU5l5DMX4bkm4DfLqvgMkYaYDK6RXk19e2SisjGY/iLVtE8Hd5tDt1xeSpvKJYqWiE3NEuuco+bMohlnwbRR8JhHxJ3IMgRrWJGIKtKesjiO9ne/d5iyBGirZRxKXsDqwS53FfYthOHprwaQ9G20dYRNcMDmQDUvCbRuCR7XK9sh6FVSdwnU63XN3ZBvYrwhF3+IAWK4HlwNgdOP33SM9AUvoGf3NHkVKqJpBmhQ4Ku6wuUuXCIfXiqGXHhStTLsjbSaltAQl4jZm5ZOHUhaEKCf7cWoHkmcNpFSSu41q5ggFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WTclMe62ZDd9IUPdz1BcW7XYvysVyEGZrFRbTOztWXk=;
 b=ntob3aSzEbDGpv5F5Mnxl0cYJWfGs4Tfi7uMCNZUqNiQYBoLu4WyNBAt11CkoqYdFCmqd2pGFTTakoeH8HUew6Gv3CsNrdiBwL96r53TaWZQFb21vuQ1AMdx3hSUn4yPs7njiwj55i4ezq0yWjd6ld/Duc+3x+0XkbhkGZis3uohGbueMfEAz75SwQKZHABcic49t+GOwq4TO2Ucza2fL6IFDIAbFFj0zamsZ6KKhgqp+IF8Hda3g0y/YSxW+Qplbux4XkWEaz7Cvw1KG/YTpEc3SKr5FyC+t8Mfaw7LfoTd88pf3ABy9wIrv7ytmvU93nZ3goP4kZiE6HGNiWxxLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by BN9PR11MB5244.namprd11.prod.outlook.com (2603:10b6:408:135::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Tue, 4 Nov
 2025 06:59:36 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9298.006; Tue, 4 Nov 2025
 06:59:35 +0000
Date: Tue, 4 Nov 2025 14:59:27 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>, =?utf-8?Q?=C5=81ukasz?= Bartosik
	<ukaszb@chromium.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [jimc:dd-drm-fix] [dyndbg]  c475b6f9cd: WARNING:suspicious_RCU_usage
Message-ID: <202511041400.47450d3c-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR06CA0013.apcprd06.prod.outlook.com
 (2603:1096:4:186::18) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|BN9PR11MB5244:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f2222c6-4992-46a8-72a4-08de1b6fb6ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4fwF5sutY7Zl1lHT4UumND3A2nPFs7e2ki4SeCVasCVwNixDze6sfXT1sTJs?=
 =?us-ascii?Q?M+m/UDplRQ65p9h9gGbbEmsORwNXcUxupjzclQNfodqKxYW+/WaRgDqmp67S?=
 =?us-ascii?Q?2ko0x5dmKUx7JpsxfWFwULWGcwdrO+yiWVlM0B4WBBKVDt2fCnzFHNAuhlj8?=
 =?us-ascii?Q?4IPGbIiUcTUtYtztxpid34BRKjK6D+MRWvTgsSmdxX9uqGQzvQfoUjDhYpJK?=
 =?us-ascii?Q?hgg9dXGweFpHAzx/5rxPtLDVcCbCFGFyzWnCXT7LulembI8A4D2oY4WwTgga?=
 =?us-ascii?Q?N4z62lgxHohMWUDuTB9RGg0Tl4crDL0HiTQ9yh5X2B8otvEUsX/dX9SKVCxL?=
 =?us-ascii?Q?4skC0jZn3Ju6bC7TOknPLfZKNydyVzUStrqUsv7JEWHrcXmuC2eQinJAJLmr?=
 =?us-ascii?Q?ZMlP8OOKtEBdiJ5jHq98CiJFBrkIpUrtH2dfc5ZOhoAvlzLeY0AyB4wvOyeZ?=
 =?us-ascii?Q?zgIURxFERmLzyeh51ODFwPGwW0W6ubgV5O1BAJ7YlJodTgmd3dxPLa9dgHan?=
 =?us-ascii?Q?XOM/NXbBNkQo6fkVpCVRTg2QMh1DHNuMHcZmdONMeqassQ3AtDALXtZ5W75q?=
 =?us-ascii?Q?FSxntK2aMReT7oucgsULn9eKEqCbESvUEJ9j4y2TmakkKzMeloRjr78gi9Ln?=
 =?us-ascii?Q?pIdN7afCw8z8sZddWU814Tdd2URxSCuNB1e0DgjQEq7nQji/+IK/Vv/7SbhT?=
 =?us-ascii?Q?4zCq2rZ/NJHR8tbDChalF2O//pJZzUcZK5tzZICPaof8mhpo75dslT3QCmlE?=
 =?us-ascii?Q?jlYwo2oaWkILKounAlXxWX8LzgX+vXt1xdWdQz/IBhzXh11kVRC+XaMs2GYB?=
 =?us-ascii?Q?WFbO8IkInqoJ+DNhqxKImyDi++WUFA4FsbdZRThKWnjceh22VPzSgU6rSgGb?=
 =?us-ascii?Q?bX0hlMWFejiQWGQaSD3RJPrUXz9YG0p00MsPZ82sV3qXh1BzWx1o1uZAkhDc?=
 =?us-ascii?Q?kLjkA9ngHsXEPRcw3YdK4vrGyu/LiH9zMfrMpDjrsl5XH7niEEEn8f0niVq0?=
 =?us-ascii?Q?WFGvxKnvb/mOAQ47lNSAs+kFYNaDk7bxiB09miu9MixSkag3Tc07AsQrKni8?=
 =?us-ascii?Q?Dz/mU+83x3sTiGGB16EQfReyC+OjI1TbOcGZ2esX8gh/hEp3U56AUpsQnZGb?=
 =?us-ascii?Q?flLMHjT/amBQmqIVDw0MabIKvGRdPwYtFcBaMbjtwCjPoj7syZlNMgs7KEZH?=
 =?us-ascii?Q?SXw5NEZvRpboyfPUBr5m1c1DDvUIvqSdFd7jy+2pWwVRW8AOr8VxTNsnN3b/?=
 =?us-ascii?Q?SinnWQotCxGmH8LIOmr4giqH1z7IzXLVrlpBM/WrzFor8vE/W9hRxQ++gG1y?=
 =?us-ascii?Q?UGeDUlCLxA0LRQdxCEIpze/IZc7Z05vPuCHp4UiiED3neKjSTRNANJBOD0oc?=
 =?us-ascii?Q?3t1vMexJec+8r+AzNkPxo+2xPM+u8Ha+j18hUP2gtOvZ8mBnjmmcVpWua0BL?=
 =?us-ascii?Q?2B5a/9J/E/0PYFhXguniO8EFLhHhsjEGfNo77vXVO4+VgBq1KS3wdg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WIoSZ87Sb9AqVAdPsambNcJaoZPSFhaIkmpSh5upFksfZ2ZLZ8PJ4yj5PxuP?=
 =?us-ascii?Q?uAOUmPrgd6uZF1Lj8/ZUWxVX4imjbu+YqRl1c3cS7cOHd1vd4TlOuTCQ54k9?=
 =?us-ascii?Q?Vwgdn3+bH2NhNet2S6yl3JiSFz/VFcgkkpvb9Ib64tkZHnBAyPKjZhfPKexJ?=
 =?us-ascii?Q?YVKoPXqj7dwkxmPqeDU32SKelwBxujgBSXHo+FUw2nlgFS3efcFm//UsWQIS?=
 =?us-ascii?Q?4zs55MHon6GNPtehF2YRY795pKzyY0NK5sipQnrTd6z3woPYy7T59sxxQIIN?=
 =?us-ascii?Q?f0EEWRr5IOpEYVBp0P9K3g7YNVzwGElxuu/z4s4fue0B6u8AB2SYkK93HGlG?=
 =?us-ascii?Q?KKgRpnizZ0+lFgIE0tGafNqro4corRzf2PnenYLjDl4PwrpYbtbVqo5BQNXn?=
 =?us-ascii?Q?oFXRMmE3wfZFgkhihUschjDfbWn1vyv3rLeiw+o25fgFZVcopYRAmNfbDAAJ?=
 =?us-ascii?Q?F3mHk40HnIHzfdqI/Ekg+Znqfh7OddhbsMjHUlrrwJakFW00zHbpJYrRMKAV?=
 =?us-ascii?Q?0999A+Ig6ZHV0SZgP9ishM4z11d1zclo3F1jrnkez5TbAFRqnb/X1n2O8u0V?=
 =?us-ascii?Q?jCw5AxAy8UOISTaWXNwpWCXCNc3VbzYFk9hGg96zdTgETbmyvMMJ8P8iOEi5?=
 =?us-ascii?Q?pfWsDwtpiGCl9Y0YChEMxRlHi20ZI89S1LWcPZS5iHNox7SEuFaqz4AZNcSm?=
 =?us-ascii?Q?1F0X+vU6u8AcRwozZvZCe+OWAndzJEgNhFWyFDV5VlYB0Ka8iX/h0tP8D8S2?=
 =?us-ascii?Q?TxYaC7HsnoPMF8DHPavTHghmnZtRMgO7pZ938IyGATnC5Hmziq2+BVT2UoEC?=
 =?us-ascii?Q?8H4xtgJPqjWAnGbibo0+SkWN3C6qhwwIxn41LXFm8fyeZuanAFnEZjRKNo9I?=
 =?us-ascii?Q?FGN6MOK0ugzEnXZotIAn4RcX7EBsUm6nOnjN4YjlZ4fJ6YOoqe5sRFy04p6I?=
 =?us-ascii?Q?ZWuE52vRW50RsI9OMiop7LHvQmF8QpSEnz8w01Qs3CBNjHCI8GHVThLzCrzo?=
 =?us-ascii?Q?RSPaAMRzPr1TflfT1noeT5olGmixJay+5wfxcrXi3PdTBTb28TvfDTvZIRbl?=
 =?us-ascii?Q?UNm5ts0pPIWlNcSnwgRB7oEc0feBbVLythb/PgNpeVJNcTDRrD5C7PHPrAaT?=
 =?us-ascii?Q?nI22gXvd1Y8Ju2Prz834IkUnS2u74nOlj0OeWBq4RVINsUgO0q75rwDiuMaK?=
 =?us-ascii?Q?FNmHsRWdx/n4vzeWCvkDYs3dh3zt6At+1uQzHwWKai57sObknFGyIYGgWE2M?=
 =?us-ascii?Q?Eip+mFwJD1tfIJ4sPjGzh4ZPcm1GhRpUCisS552al8tQkSUi0oyT60kDXDuG?=
 =?us-ascii?Q?VDmy39CtjPBajq5oeNSF9Xp5qTUBj7ApmPDTyg/Qoj0jsru5oJ0wIy/JnJK3?=
 =?us-ascii?Q?pSKIeVgLHjgVD/sojB/6lHlLyAULRIIf8GWkvWPW975xZs1YsXeKOZGy4qxO?=
 =?us-ascii?Q?3M2TLmzx6blIupzkp6hRcsj/k1LOFtG3vfFXNMH509g0cqvIwypYAAv8Tpw4?=
 =?us-ascii?Q?tGrRvf2LG/Ktd8Hcvgrq+7flkSdh5RrWvpg1pvaeXaqSK/Da53EfGJlsLOeA?=
 =?us-ascii?Q?EBnq9e//Yriet/rrspQtPxtlaVOufTctCI6KI9hK6QBTvaUGGF2LVFuXRDHu?=
 =?us-ascii?Q?OQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f2222c6-4992-46a8-72a4-08de1b6fb6ef
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 06:59:35.8834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3B/EN9phqfG5v47oXVK8CX+JJVEAuFp+0YlDQyRU2eiL3KleIEPgmNQRhVomEDFAtv/1pC+Kx6Mvl3CG4re6tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5244
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:suspicious_RCU_usage" on:

commit: c475b6f9cd3a5be561a68bf1309ac3384a2a57dd ("dyndbg: simplify dynamic_debug_init()")
https://github.com/jimc/linux.git dd-drm-fix

in testcase: boot

config: x86_64-randconfig-012-20251031
compiler: clang-20
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+----------------------------------------------------------------------------------------+------------+------------+
|                                                                                        | 44edbaddfd | c475b6f9cd |
+----------------------------------------------------------------------------------------+------------+------------+
| WARNING:suspicious_RCU_usage                                                           | 0          | 24         |
| lib/maple_tree.c:#suspicious_rcu_dereference_check()usage                              | 0          | 24         |
+----------------------------------------------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202511041400.47450d3c-lkp@intel.com


[    9.785830][    T1] WARNING: suspicious RCU usage
[    9.787345][    T1] 6.17.0-00043-gc475b6f9cd3a #1 Not tainted
[    9.789622][    T1] -----------------------------
[    9.791341][    T1] lib/maple_tree.c:844 suspicious rcu_dereference_check() usage!
[    9.794453][    T1]
[    9.794453][    T1] other info that might help us debug this:
[    9.794453][    T1]
[    9.799368][    T1]
[    9.799368][    T1] rcu_scheduler_active = 1, debug_locks = 1
[    9.802589][    T1] no locks held by swapper/0/1.
[    9.804003][    T1]
[    9.804003][    T1] stack backtrace:
[    9.806423][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.17.0-00043-gc475b6f9cd3a #1 NONE  d4732c5d83d6de1ea122067c38853387ec26d310
[    9.806465][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[    9.806478][    T1] Call Trace:
[    9.806492][    T1]  <TASK>
[    9.806521][    T1]  dump_stack_lvl (lib/dump_stack.c:123 (discriminator 1))
[    9.806563][    T1]  lockdep_rcu_suspicious (kernel/locking/lockdep.c:6877)
[    9.806599][    T1]  mas_start (lib/maple_tree.c:?)
[    9.806649][    T1]  mas_find (lib/maple_tree.c:3629)
[    9.806710][    T1]  dynamic_debug_init (lib/dynamic_debug.c:1920 (discriminator 1))
[    9.806747][    T1]  ? tracer_hardirqs_on (kernel/trace/trace_irqsoff.c:452 (discriminator 67240193))
[    9.806786][    T1]  ? dyndbg_setup (lib/dynamic_debug.c:1879)
[    9.806800][    T1]  ? dyndbg_setup (lib/dynamic_debug.c:1879)
[    9.806812][    T1]  do_one_initcall (init/main.c:1269)
[    9.806824][    T1]  ? dyndbg_setup (lib/dynamic_debug.c:1879)
[    9.806857][    T1]  ? __lock_acquire (kernel/locking/lockdep.c:4674)
[    9.806900][    T1]  ? drop_sysctl_table (fs/proc/proc_sysctl.c:?)
[    9.806917][    T1]  ? kvm_sched_clock_read (arch/x86/kernel/kvmclock.c:91)
[    9.806931][    T1]  ? local_clock_noinstr (kernel/sched/clock.c:274 kernel/sched/clock.c:309)
[    9.806945][    T1]  ? local_clock (arch/x86/include/asm/preempt.h:85 (discriminator 9) kernel/sched/clock.c:319 (discriminator 9))
[    9.806960][    T1]  ? do_raw_spin_unlock (arch/x86/include/asm/atomic.h:23)
[    9.806979][    T1]  ? _raw_spin_unlock (arch/x86/include/asm/preempt.h:85 (discriminator 9) include/linux/spinlock_api_smp.h:143 (discriminator 9) kernel/locking/spinlock.c:186 (discriminator 9))
[    9.806993][    T1]  ? __register_sysctl_table (fs/proc/proc_sysctl.c:?)
[    9.807020][    T1]  do_pre_smp_initcalls (init/main.c:1374 (discriminator 2))
[    9.807041][    T1]  kernel_init_freeable (init/main.c:1569)
[    9.807058][    T1]  ? rest_init (init/main.c:1461)
[    9.807073][    T1]  kernel_init (init/main.c:1471)
[    9.807088][    T1]  ? rest_init (init/main.c:1461)
[    9.807103][    T1]  ret_from_fork (arch/x86/kernel/process.c:154)
[    9.807120][    T1]  ? rest_init (init/main.c:1461)
[    9.807139][    T1]  ret_from_fork_asm (arch/x86/entry/entry_64.S:255)
[    9.807172][    T1]  </TASK>
[    9.807182][    T1]
[    9.855339][    T1] =============================
[    9.857314][    T1] WARNING: suspicious RCU usage
[    9.859218][    T1] 6.17.0-00043-gc475b6f9cd3a #1 Not tainted
[    9.860071][    T1] -----------------------------
[    9.861976][    T1] lib/maple_tree.c:800 suspicious rcu_dereference_check() usage!
[    9.864356][    T1]
[    9.864356][    T1] other info that might help us debug this:
[    9.864356][    T1]
[    9.867343][    T1]
[    9.867343][    T1] rcu_scheduler_active = 1, debug_locks = 1
[    9.870541][    T1] no locks held by swapper/0/1.
[    9.871977][    T1]
[    9.871977][    T1] stack backtrace:
[    9.874441][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.17.0-00043-gc475b6f9cd3a #1 NONE  d4732c5d83d6de1ea122067c38853387ec26d310
[    9.874474][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[    9.874487][    T1] Call Trace:
[    9.874501][    T1]  <TASK>
[    9.874516][    T1]  dump_stack_lvl (lib/dump_stack.c:123 (discriminator 1))
[    9.874552][    T1]  lockdep_rcu_suspicious (kernel/locking/lockdep.c:6877)
[    9.874591][    T1]  mtree_range_walk (lib/maple_tree.c:?)
[    9.874662][    T1]  mas_find (lib/maple_tree.c:3636)
[    9.874708][    T1]  dynamic_debug_init (lib/dynamic_debug.c:1920 (discriminator 1))
[    9.874747][    T1]  ? tracer_hardirqs_on (kernel/trace/trace_irqsoff.c:452 (discriminator 67240193))
[    9.874803][    T1]  ? dyndbg_setup (lib/dynamic_debug.c:1879)
[    9.874827][    T1]  ? dyndbg_setup (lib/dynamic_debug.c:1879)
[    9.874849][    T1]  do_one_initcall (init/main.c:1269)
[    9.874871][    T1]  ? dyndbg_setup (lib/dynamic_debug.c:1879)
[    9.874935][    T1]  ? __lock_acquire (kernel/locking/lockdep.c:4674)
[    9.875019][    T1]  ? drop_sysctl_table (fs/proc/proc_sysctl.c:?)
[    9.875052][    T1]  ? kvm_sched_clock_read (arch/x86/kernel/kvmclock.c:91)
[    9.875075][    T1]  ? local_clock_noinstr (kernel/sched/clock.c:274 kernel/sched/clock.c:309)
[    9.875100][    T1]  ? local_clock (arch/x86/include/asm/preempt.h:85 (discriminator 9) kernel/sched/clock.c:319 (discriminator 9))
[    9.875130][    T1]  ? do_raw_spin_unlock (arch/x86/include/asm/atomic.h:23)
[    9.875165][    T1]  ? _raw_spin_unlock (arch/x86/include/asm/preempt.h:85 (discriminator 9) include/linux/spinlock_api_smp.h:143 (discriminator 9) kernel/locking/spinlock.c:186 (discriminator 9))
[    9.875189][    T1]  ? __register_sysctl_table (fs/proc/proc_sysctl.c:?)
[    9.875242][    T1]  do_pre_smp_initcalls (init/main.c:1374 (discriminator 2))
[    9.875278][    T1]  kernel_init_freeable (init/main.c:1569)
[    9.875304][    T1]  ? rest_init (init/main.c:1461)
[    9.875304][    T1]  kernel_init (init/main.c:1471)
[    9.875304][    T1]  ? rest_init (init/main.c:1461)
[    9.875304][    T1]  ret_from_fork (arch/x86/kernel/process.c:154)
[    9.875304][    T1]  ? rest_init (init/main.c:1461)
[    9.875304][    T1]  ret_from_fork_asm (arch/x86/entry/entry_64.S:255)
[    9.875304][    T1]  </TASK>


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20251104/202511041400.47450d3c-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

