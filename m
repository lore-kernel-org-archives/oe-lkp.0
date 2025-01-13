Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E9013D504
	for <oe-lkp@lists.linux.dev>; Mon, 13 Jan 2025 06:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736748692; cv=fail; b=PFfq6aX8dIPZg+yMC367tpFRD3YRt/awZXdqhV5QZresJyV79Q+FQvDenF2eUOGGrEKM2vk1O/fGKdB+0ksQcl0MH05dfkCDmpgvmjfAGokZaPAmoYggk66YDJocQM/D2BD5YKxm4Cz5tafJ2OcyOUF/CuTXMh7tFeweWpRrnhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736748692; c=relaxed/simple;
	bh=KaQI+MK5AcUMTd2e6E2fAfXwJ1M+3g3FDNhqAHBmoLE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=gSG9TvwGJ/+oSAB0aOtTKlEql73qJ1hBxaMuu/c6+IqM4lQMQzUOpWIz1ZN86G/8XJm0L4NRupDlYtpOgYYWHQvb53Re19BgbsEk0Q/T5qXXEl699QhNz8ZXACtHJx++MKVAIsOZJJiadLXR9SxDZfOmzYnyawXrwzKIWtE8HH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DsH7Gow2; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DsH7Gow2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736748691; x=1768284691;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KaQI+MK5AcUMTd2e6E2fAfXwJ1M+3g3FDNhqAHBmoLE=;
  b=DsH7Gow2U7EoYGOmkaih2fvAKrykRQ5hD6XRCQgghiuTpmkWGM94KbJ3
   xtaoYNFbfpqZoLye4etpygwZ2BuOAaWI77jDj8D6Eg1O4gobFNv5kAeUU
   6sJk3I3uInJzHCiTPkY0r/OsnJE78QhbzZoaaKZ8HRzX00iKf5fNPDWx6
   Nn69Ec5HnvH+yuLDiONBsi6naRxv1bXYETlDkrL9lH99bip4CmtZ3NyNL
   G3Xbf/+UJy3oBgGsTd3xh7Q7upsQpYoYaocwn/ADjbRV0gcBbzym6Bj3e
   yKaXVZOV+7jT8Y02vxb3teI03WgQSv51akotqzIv49mrMqZyflE2+1tw6
   g==;
X-CSE-ConnectionGUID: jfY3vqRURbW+m5yGzKQasA==
X-CSE-MsgGUID: a6cKxsq8T2mShmSwA9muzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="36896520"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="36896520"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2025 22:11:30 -0800
X-CSE-ConnectionGUID: WvUcagX/REmugai3ZqsVjA==
X-CSE-MsgGUID: jFXNd1NvQ5eBIA9I/2k0LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="135253330"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Jan 2025 22:11:27 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 12 Jan 2025 22:11:25 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 12 Jan 2025 22:11:25 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 12 Jan 2025 22:11:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wXHLn/3Nx6o7Nv/X6JXAL51Iv81wGfuU+JmotRsOEf5yIUeXM/5DYIEUUGCqmNrz4TMg0tmb+eBSFuCwKk/wy9GIygNFYcQTe8XEOh/IkCYiVIGSXlgTapgo0906LojENrw6YtKmFEEVNnCb57yOmMYYIqBXgf2zGQAqVOTc3/JN5+XL7SD1v3I6teS2liEhHQoRrmWCGopbjhiUbt3zX7k7urwPPVfv0D45J7ywpuXU0MwJdvzufLhF8rjFngE1eZZaKbvH9f92Bm1LfnffSO9oABftcY3gWiFtjwWByWCoPv6yDqpLZ9VOWNdE/W8g0fk/hic3c1Tj0ikd48ZQVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ekallwUkCM8Wcb+na2PMg9ofA8H1Z3FPxAr67icSzJk=;
 b=AwRXXLslzvoa5ZOXhhUoaK4pr1p+YlN0Yf3WM3fDlxqtUWWsvufzOZu9qzixkRtrYdg4/cUFZZOGvDDCi8Ntv3w00XeGXqi6214ESwp1jpreMdaGbsGHWokOYu2nm++TQHsTylJAwOPW0IZypSC1LaWG3aFIJLM7gaZJI+oRFtU1/UBpf8K96r8fTtIAN2SifSWfdi2oItqmcMub5Tjt36TOy20geyYDG9LYFAQjf18u/hHw/3415PH3PTccbOHnmKuwbuTTEXMpgJqrcW7EGlMCdygW7k591Vcnmsf1iu9OBtH0PZaR27zOj5gWppTaDC5jHTwqfAVjWQkF9zX/3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by BN9PR11MB5225.namprd11.prod.outlook.com (2603:10b6:408:132::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Mon, 13 Jan
 2025 06:11:22 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8335.015; Mon, 13 Jan 2025
 06:11:22 +0000
Date: Mon, 13 Jan 2025 14:11:14 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<oliver.sang@intel.com>
Subject: [linux-next:master] [vsnprintf]  8d4826cc8a:
 BUG:KASAN:global-out-of-bounds_in_number
Message-ID: <202501131352.e226f995-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0169.apcprd04.prod.outlook.com (2603:1096:4::31)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|BN9PR11MB5225:EE_
X-MS-Office365-Filtering-Correlation-Id: c280ef3f-d32b-4497-69d0-08dd33991a6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IOsOA4qx8dHlf/exwJ3KpNqVIvcmLDsFJdPmVtGvSilYhBUUXrTq4zwdcGDo?=
 =?us-ascii?Q?kBmun+sgCqWw9V7uh3WpUcMQYdYtQHat/HGH6fMV0JXe8mPYLYCco4IugutT?=
 =?us-ascii?Q?1mWEPq4RpWi6C/aDq1ALAkDEPUsCxzSLmw7QDho6vh4Xh+246E/Rvm27MfrD?=
 =?us-ascii?Q?RUv1lIJ3OCFY42t+dwzK0AQjI5KE1vDRbNuZ2yu3LbzNp7BU4d7eox2KKTIR?=
 =?us-ascii?Q?4mfkvS1rlSqcl15y+9gDgKf/QERuncjBKLTcLx6m5+dw2dUT9rMHVE2NH221?=
 =?us-ascii?Q?JSOCRSmg+pjiWz8o9JfCUf8fTiefEDW1B7HP3c3bdGL08kADo5nUDexHs706?=
 =?us-ascii?Q?TmjawDZMmHIIL5hgl2nlU2R75YRj69TN19gLrJXZbNx7SINuWxTw0RfFlmmB?=
 =?us-ascii?Q?CyMz/qFQcOtmIi8fJmN0rM6mt+I8FT64iz19EoRdm0lmiJCS8gTgqV49+PxH?=
 =?us-ascii?Q?m60nCUHVj2FWf8irnQJCVRTg1k7PLNbzwELq8LBD/110cX2oY8VLet7vp7Wq?=
 =?us-ascii?Q?egnHXfhXVNqInUok9YKJGyUEOu84dMC+p87BbHK2WhwlKW3wCudOHMyiGAFR?=
 =?us-ascii?Q?O4L+hQCvOpnTzl7Az1ZnbalR2fJarUEpxhAerfAiurNbbaYtjLkWNtMA/OdC?=
 =?us-ascii?Q?vnPYtOaRARLB5tGVuDrqSkt8Klqa8JUa7u03SG32HS/HaquReFWzGUtVfGOH?=
 =?us-ascii?Q?87HDH7G3u48zL5HDHUoPeKHfWfzVs0BgpSEQs/XMp2XHPGJRKwrs76LgDv2D?=
 =?us-ascii?Q?RWfaHIAVQHc1LrrdX24Ytk7Ime/bTkbWhLb1vYAhtNBdno0fek3r70qMvCS3?=
 =?us-ascii?Q?hBhMTr9nCRqlFYzhaDq45Vbsc0JZT/0nqhZADzFAZardSA4zTTrV7cl72E4s?=
 =?us-ascii?Q?zirs/tRPWuORzPzdBK6FRtZJRiVR4sU6++aoU4mFi8vlC9efSujV2nzv3Ijw?=
 =?us-ascii?Q?2MVPo9aMWCoTTQwpWwTxX5morg6mo+UzrJQTmD/4oZMIJW80UgA9JKZd4aKR?=
 =?us-ascii?Q?K2pPC+izveBUzI2EX4UNKi5NxX/0Kd0UPA8wcgnBw/+0WtyFeAVmy4vHuG2v?=
 =?us-ascii?Q?zc1X+TNgSwlED2cQjmFH6yjhey5haS1+WuHnaLHD4FFLJp7EAopVv3Pv6lD3?=
 =?us-ascii?Q?JJqB63rssoNqNoTbQ3rta01cUpgRVOmhmgo6NElaLMwO86r4f6XZeGIUAJZ3?=
 =?us-ascii?Q?cyR9UJ6cFhejnaO4TT621n3lB2CVW3EbeAKBY/PVLRf3r6c19B6Tz5XTN8jc?=
 =?us-ascii?Q?45dzPACzJGrM/Ztr6D6+bb1Q6JbusfwBhTO1ZGuZyyWq9ef3Yc4jqwemadEy?=
 =?us-ascii?Q?eq1BigzJuxQpBF9J257e4qjNE6OF3wpe1pFyIgf7iX7UWw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mKslhB0bAxuztUDKovTFTKHfPdfRV2XIko/7hFhjMeT0GEqap6JqrxnVqYEz?=
 =?us-ascii?Q?Whc1UX9zGM/5EznkEeNsHtSu8ovaTkEcrVjr6MX354BTsjnV2NnlNFgIzjds?=
 =?us-ascii?Q?Zsqfb/enIDym//TU7xOPRkQsZ980tU81/04raRra0slUHcqaUuSRPRoWG17c?=
 =?us-ascii?Q?o2taWYdTN0+hZxcFnsEfN6kQTJlfZ/8HSKexr9fMKMBwgZmnpfigELolSNYT?=
 =?us-ascii?Q?2r+6VTirLtcF3tE6IznJC3kDEqtAcX1oKIPxal/X0MjgZ34u4r0McJ9u2ve7?=
 =?us-ascii?Q?2J0UYuHjaX9toewwaYmqm5TM+2hsfOcWE6wNPUCU9qdulUx+dZGC0agbwI3t?=
 =?us-ascii?Q?tXNr6bchyVW0UAHt1lOCGN+HLAE5OnyWuXU/QrlMmXOO/nDerXSHzsyAGlHK?=
 =?us-ascii?Q?IQ0JuT54Ad0fE220qejokZj8V+faBjKzNSlprAP20BR3IIyXCh+IidNPBfnM?=
 =?us-ascii?Q?wAnyLrbbe+YVBkpnjmaCskUam5O1Xd2HQ9jvY7E8SarELzi3AZgeFHFehaAe?=
 =?us-ascii?Q?8IgJNeZCEC/SHDYHKbBYWRqabPVEuNOjFub4esQ0DxtkHdPKHryB7v4a1pp7?=
 =?us-ascii?Q?Es+EnqojEHoGTfStpDA7Ppifm5eyXVxMGp/3RvsHnKt20+6oWDXHV8VQZK7C?=
 =?us-ascii?Q?B0vJt74pE4Uvy56dbRxs2gG9NiGbfvgGt9Lf8tiis1+oLVIG0HbeQkq8rOqh?=
 =?us-ascii?Q?xDuDm/hIcfqtwXkBcjCBXblwoI4OuRiN9L8+t4RJAqb4y4ptd/n4y+cszqfF?=
 =?us-ascii?Q?XlkXWF/JdomzAHN97yE1E6/fv1jOYSW3Gjp5mIk9Zy7tPStbf4ibjighggk0?=
 =?us-ascii?Q?x6NZbPCTd4LQ9SpAxFQCgzKbgYqtca1DiWAmNQiZu1fvn8KbK/GI4WTAPlfG?=
 =?us-ascii?Q?no9nQewpSjU2urA/lALeL3mlN5K33rEbrkGUhXccd1onIVRxKVCh8SjO+RJL?=
 =?us-ascii?Q?+EXCDnfXW+nFGBc2woWtQxkMGTv39eTyl0xvDoabnflhqXcIaQukq25Sh2O0?=
 =?us-ascii?Q?t0SCKdF6Em+8K5z/xZwZoYq4iS+DugBD6BEy1oR7CARC/hIkksBj4Tnl3BIZ?=
 =?us-ascii?Q?5f32HuTGTLxmXdluNxJ6yjp8ZRmCWnHH1RaSfFWPTELfVnAUUpnFdLLu7zAe?=
 =?us-ascii?Q?ObL5v5paxdJcITxKKy/Jdr0RXOJKubpmcLXsUZg1tH+JnDivP/U4yjSenuZa?=
 =?us-ascii?Q?mCvLRGJq4EDXCfudCDFtB43SklnCyBd1J3PzwNMyv0Kr1sFusMlDcAOcA6Ct?=
 =?us-ascii?Q?iQC8M8uXn72+WhtK/yVkNKlUl0ve0KEAALSj7LMAejrfYRkFSEncW3C+djV1?=
 =?us-ascii?Q?G+rBlnsr2nL2NLztBz14cBwQFfaEVsihSgyaNg9nzOtwtMbCEiIP48Bkwnk7?=
 =?us-ascii?Q?v/OCoUBk9ylfMqyqVnL6K4YIBFc6RJWn0TBJ99fUl7v2NWB1FhZwMzLo4IIZ?=
 =?us-ascii?Q?E6YPFIQwQZfjPjLKNo+WmCug0/yO3hmhA0Yh+qGD8eGGIhFZh12nkb07SrUa?=
 =?us-ascii?Q?rSVOGqb469X0gRnyapoxagEiEuY+uTSeDyLud3g/edm16FOnNYlJ6XDNaoQo?=
 =?us-ascii?Q?XCcN+iJfNgiBehyHX3NH/wn9I9mLkkrEMTjCQC+kN8OoyHSD47g+gihjqOl2?=
 =?us-ascii?Q?jg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c280ef3f-d32b-4497-69d0-08dd33991a6d
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 06:11:22.5927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lRnbLR06N2hHDG0Ix9GeaNUVNUE62En0PsKEycSDSauSOTjuM0zWKe13pXWENswHzr05dW4b+c2WJpx/+phoPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5225
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:KASAN:global-out-of-bounds_in_number" on:

commit: 8d4826cc8a8aca01a3b5e95438dfc0eb3bd589ab ("vsnprintf: collapse the number format state into one single state")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

[test failed on linux-next/master 2b88851f583d3c4e40bcd40cfe1965241ec229dd]

in testcase: blktests
version: blktests-x86_64-827924b-1_20250108
with following parameters:

	disk: 1SSD
	test: nvme-group-01
	nvme_trtype: rdma



config: x86_64-rhel-9.4-func
compiler: gcc-12
test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-4770 CPU @ 3.40GHz (Haswell) with 16G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202501131352.e226f995-lkp@intel.com


[ 53.288261][ T1140] BUG: KASAN: global-out-of-bounds in number (lib/vsprintf.c:494)
[   53.295106][ T1140] Read of size 1 at addr ffffffff843035c8 by task ln/1140
[   53.302035][ T1140]
[   53.304209][ T1140] CPU: 1 UID: 0 PID: 1140 Comm: ln Not tainted 6.13.0-rc4-00009-g8d4826cc8a8a #1
[   53.313125][ T1140] Hardware name: Dell Inc. OptiPlex 9020/0DNKMN, BIOS A05 12/05/2013
[   53.321002][ T1140] Call Trace:
[   53.324131][ T1140]  <TASK>
[ 53.326913][ T1140] dump_stack_lvl (lib/dump_stack.c:123 (discriminator 1))
[ 53.331252][ T1140] print_address_description+0x2c/0x3a0
[ 53.337665][ T1140] ? number (lib/vsprintf.c:494)
[ 53.341660][ T1140] print_report (mm/kasan/report.c:490)
[ 53.345914][ T1140] ? kasan_addr_to_slab (mm/kasan/common.c:37)
[ 53.350684][ T1140] ? number (lib/vsprintf.c:494)
[ 53.354679][ T1140] kasan_report (mm/kasan/report.c:604)
[ 53.358845][ T1140] ? number (lib/vsprintf.c:494)
[ 53.362841][ T1140] number (lib/vsprintf.c:494)
[ 53.366661][ T1140] ? rmqueue+0x7d0/0x3350
[ 53.371865][ T1140] ? __pfx_number (lib/vsprintf.c:446)
[ 53.376205][ T1140] ? nvmet_port_subsys_allow_link (drivers/nvme/target/configfs.c:1065) nvmet
[ 53.382805][ T1140] ? __pfx_ip4_string (lib/vsprintf.c:1332)
[ 53.387489][ T1140] ? __module_address (kernel/module/main.c:3702)
[ 53.392264][ T1140] ? exit_xfs_fs (fs/xfs/xfs_trace.c:218) xfs
[ 53.397474][ T1140] ? nvmet_port_subsys_allow_link (drivers/nvme/target/configfs.c:1065) nvmet
[ 53.404072][ T1140] ? nvmet_port_subsys_allow_link (drivers/nvme/target/configfs.c:1065) nvmet
[ 53.410671][ T1140] ip4_addr_string_sa (lib/vsprintf.c:1594)
[ 53.415532][ T1140] ? __pfx_ip4_addr_string_sa (lib/vsprintf.c:1569)
[ 53.420908][ T1140] ? __pfx_check_pointer (lib/vsprintf.c:695)
[ 53.425850][ T1140] ? __kernel_text_address (kernel/extable.c:79)
[ 53.430882][ T1140] ? unwind_get_return_address (arch/x86/kernel/unwind_orc.c:369)
[ 53.436353][ T1140] ? __pfx_stack_trace_consume_entry (kernel/stacktrace.c:83)
[ 53.442338][ T1140] ip_addr_string (lib/vsprintf.c:1624)
[ 53.446860][ T1140] ? __pfx_ip_addr_string (lib/vsprintf.c:1604)
[ 53.451889][ T1140] ? __pfx__raw_spin_lock_irqsave (kernel/locking/spinlock.c:161)
[ 53.457612][ T1140] ? depot_alloc_stack (lib/stackdepot.c:326 lib/stackdepot.c:408)
[ 53.462471][ T1140] pointer (lib/vsprintf.c:2459)
[ 53.466378][ T1140] ? __pfx_pointer (lib/vsprintf.c:2425)
[ 53.470803][ T1140] ? kasan_save_stack (mm/kasan/common.c:49)
[ 53.475487][ T1140] ? __kasan_kmalloc (mm/kasan/common.c:377 mm/kasan/common.c:394)
[ 53.480086][ T1140] ? siw_create_listen (drivers/infiniband/sw/siw/siw_cm.c:1853) siw
[ 53.485555][ T1140] ? iw_cm_listen (drivers/infiniband/core/iwcm.c:585) iw_cm
[ 53.490758][ T1140] ? cma_iw_listen (drivers/infiniband/core/cma.c:2668 (discriminator 12)) rdma_cm
[ 53.496229][ T1140] ? rdma_listen (drivers/infiniband/core/cma.c:3953) rdma_cm
[ 53.501530][ T1140] vsnprintf (lib/vsprintf.c:2848)
[ 53.505700][ T1140] ? do_syscall_64 (arch/x86/entry/common.c:52 arch/x86/entry/common.c:83)
[ 53.510214][ T1140] ? entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130)
[ 53.516108][ T1140] ? __pfx_vsnprintf (lib/vsprintf.c:2760)
[ 53.520707][ T1140] vprintk_store (kernel/printk/printk.c:2279)
[ 53.525131][ T1140] ? __pfx_vprintk_store (kernel/printk/printk.c:2244)
[ 53.530071][ T1140] ? __kmalloc_cache_noprof (mm/slub.c:4119 mm/slub.c:4168 mm/slub.c:4324)
[ 53.535445][ T1140] ? kasan_save_track (arch/x86/include/asm/current.h:49 mm/kasan/common.c:60 mm/kasan/common.c:69)
[ 53.540127][ T1140] ? __kasan_kmalloc (mm/kasan/common.c:377 mm/kasan/common.c:394)
[ 53.544724][ T1140] ? siw_create_listen (include/linux/list.h:150 include/linux/list.h:183 drivers/infiniband/sw/siw/siw_cm.c:1861) siw
[ 53.550195][ T1140] ? _raw_spin_lock_irqsave (arch/x86/include/asm/atomic.h:107 include/linux/atomic/atomic-arch-fallback.h:2170 include/linux/atomic/atomic-instrumented.h:1302 include/asm-generic/qspinlock.h:111 include/linux/spinlock.h:187 include/linux/spinlock_api_smp.h:111 kernel/locking/spinlock.c:162)
[ 53.555398][ T1140] ? __pfx__raw_spin_lock_irqsave (kernel/locking/spinlock.c:161)
[ 53.561119][ T1140] ? alloc_work_entries (include/linux/list.h:150 include/linux/list.h:169 drivers/infiniband/core/iwcm.c:154 drivers/infiniband/core/iwcm.c:180 drivers/infiniband/core/iwcm.c:167) iw_cm
[ 53.566841][ T1140] vprintk_emit (kernel/printk/printk.c:749)
[   53.567978][  T328] LKP: stdout: 301: Kernel tests: Boot OK!
[ 53.571781][ T1140] ? __pfx_vprintk_emit (kernel/printk/printk.c:2381)
[ 53.571786][ T1140] _printk (kernel/printk/printk.c:2452)
[ 53.571789][ T1140] ? __pfx__printk (kernel/printk/printk.c:2452)
[   53.577422][  T328]
[ 53.582861][ T1140] ? rdma_bind_addr_dst (drivers/infiniband/core/cma.c:4027) rdma_cm
[ 53.599093][ T1140] ? _raw_spin_lock_irqsave (arch/x86/include/asm/atomic.h:107 include/linux/atomic/atomic-arch-fallback.h:2170 include/linux/atomic/atomic-instrumented.h:1302 include/asm-generic/qspinlock.h:111 include/linux/spinlock.h:187 include/linux/spinlock_api_smp.h:111 kernel/locking/spinlock.c:162)
[ 53.604299][ T1140] nvmet_rdma_add_port (drivers/nvme/target/rdma.c:1972 (discriminator 1)) nvmet_rdma
[ 53.610379][ T1140] nvmet_enable_port (drivers/nvme/target/core.c:354) nvmet
[ 53.615858][ T1140] nvmet_port_subsys_allow_link (drivers/nvme/target/configfs.c:1065) nvmet
[ 53.622286][ T1140] configfs_symlink (fs/configfs/symlink.c:202)
[ 53.626973][ T1140] ? generic_permission (fs/namei.c:410 fs/namei.c:471)
[ 53.632004][ T1140] ? __pfx_configfs_symlink (fs/configfs/symlink.c:142)
[ 53.637204][ T1140] ? from_kgid (kernel/user_namespace.c:499)
[ 53.641284][ T1140] ? inode_permission (fs/namei.c:593 fs/namei.c:567)
[ 53.646053][ T1140] vfs_symlink (fs/namei.c:4669 fs/namei.c:4653)
[ 53.650319][ T1140] do_symlinkat (fs/namei.c:4695)
[ 53.654658][ T1140] ? __pfx_do_symlinkat (fs/namei.c:4677)
[ 53.659513][ T1140] ? getname_flags (include/linux/audit.h:316)
[ 53.664628][ T1140] __x64_sys_symlinkat (fs/namei.c:4708)
[ 53.669398][ T1140] do_syscall_64 (arch/x86/entry/common.c:52 arch/x86/entry/common.c:83)
[ 53.673739][ T1140] ? handle_pte_fault (mm/memory.c:5801)
[ 53.678596][ T1140] ? _raw_spin_lock (arch/x86/include/asm/atomic.h:107 include/linux/atomic/atomic-arch-fallback.h:2170 include/linux/atomic/atomic-instrumented.h:1302 include/asm-generic/qspinlock.h:111 include/linux/spinlock.h:187 include/linux/spinlock_api_smp.h:134 kernel/locking/spinlock.c:154)
[ 53.683106][ T1140] ? __pfx_handle_pte_fault (mm/memory.c:5758)
[ 53.688319][ T1140] ? file_close_fd_locked (arch/x86/include/asm/bitops.h:227 (discriminator 4) arch/x86/include/asm/bitops.h:239 (discriminator 4) include/asm-generic/bitops/instrumented-non-atomic.h:142 (discriminator 4) fs/file.c:325 (discriminator 4) fs/file.c:599 (discriminator 4) fs/file.c:684 (discriminator 4))
[ 53.693522][ T1140] ? __handle_mm_fault (mm/memory.c:5944)
[ 53.698552][ T1140] ? __pfx___handle_mm_fault (mm/memory.c:5853)
[ 53.703839][ T1140] ? file_close_fd_locked (arch/x86/include/asm/bitops.h:227 (discriminator 4) arch/x86/include/asm/bitops.h:239 (discriminator 4) include/asm-generic/bitops/instrumented-non-atomic.h:142 (discriminator 4) fs/file.c:325 (discriminator 4) fs/file.c:599 (discriminator 4) fs/file.c:684 (discriminator 4))
[ 53.709042][ T1140] ? __count_memcg_events (mm/memcontrol.c:583 mm/memcontrol.c:857)
[ 53.714245][ T1140] ? handle_mm_fault (mm/memory.c:5986 mm/memory.c:6138)
[ 53.719018][ T1140] ? do_user_addr_fault (include/linux/rcupdate.h:882 include/linux/mm.h:742 arch/x86/mm/fault.c:1340)
[ 53.724047][ T1140] ? exc_page_fault (arch/x86/include/asm/irqflags.h:37 arch/x86/include/asm/irqflags.h:92 arch/x86/mm/fault.c:1489 arch/x86/mm/fault.c:1539)
[ 53.728558][ T1140] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130)
[   53.734280][ T1140] RIP: 0033:0x7f54290d89f7
[ 53.738532][ T1140] Code: 73 01 c3 48 8b 0d 09 84 0d 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 b8 0a 01 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d d9 83 0d 00 f7 d8 64 89 01 48
All code
========
   0:	73 01                	jae    0x3
   2:	c3                   	ret
   3:	48 8b 0d 09 84 0d 00 	mov    0xd8409(%rip),%rcx        # 0xd8413
   a:	f7 d8                	neg    %eax
   c:	64 89 01             	mov    %eax,%fs:(%rcx)
   f:	48 83 c8 ff          	or     $0xffffffffffffffff,%rax
  13:	c3                   	ret
  14:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  1b:	00 00 00 
  1e:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  23:	b8 0a 01 00 00       	mov    $0x10a,%eax
  28:	0f 05                	syscall
  2a:*	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax		<-- trapping instruction
  30:	73 01                	jae    0x33
  32:	c3                   	ret
  33:	48 8b 0d d9 83 0d 00 	mov    0xd83d9(%rip),%rcx        # 0xd8413
  3a:	f7 d8                	neg    %eax
  3c:	64 89 01             	mov    %eax,%fs:(%rcx)
  3f:	48                   	rex.W

Code starting with the faulting instruction
===========================================
   0:	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax
   6:	73 01                	jae    0x9
   8:	c3                   	ret
   9:	48 8b 0d d9 83 0d 00 	mov    0xd83d9(%rip),%rcx        # 0xd83e9
  10:	f7 d8                	neg    %eax
  12:	64 89 01             	mov    %eax,%fs:(%rcx)
  15:	48                   	rex.W


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250113/202501131352.e226f995-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

