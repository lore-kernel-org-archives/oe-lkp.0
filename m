Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06DA1C6A1
	for <oe-lkp@lists.linux.dev>; Tue, 20 Aug 2024 08:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724141178; cv=fail; b=T9LdAj7nm0CBcgSd238ENQiXd+YbD3SrjhkzWWI7iEn9SMBUOQBCwz6sM4T+nRaE0okKx+rgv/MlUnqbcYA+F1GyG7gfzs5bj5jOpI1RYMwRSOYH0z+4MxXWQXzs+IKO6vE50w4tkST7iYwtQZbdkNEijcJg5H66uBbQ0E1JTOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724141178; c=relaxed/simple;
	bh=BHA2m4DNZIOGW/hLuuhvOga4bonE0yTqt8Gxtjbh25Y=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=KYhygNUQtuDeaxBQaOw3AvoojKIdAab6FAJXPS1Gqx1uWaDPtYTTMHK4xQf2F+3MhGx9XYtQRzOSwaxUdsV0KSzue5R2tTsSOVjdo0JiJ7Pz5ZYrOko4qXKAszAUue1my++EQ6JqrHaw/YZL/7jbEQGABnO9AB41Rj29A5cA7Ic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BgA3Pizr; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BgA3Pizr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724141176; x=1755677176;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=BHA2m4DNZIOGW/hLuuhvOga4bonE0yTqt8Gxtjbh25Y=;
  b=BgA3PizranQ53ugVJZzOBbq1K+04d8mSQaAwsMgUBzQT7u3Zr3XaGJCF
   bSwwrrFT/NRb+7gjiah2BqVgy7IEWv2BkofpPOrJ3FtYiDizmrnTw5CHa
   zuFC4Jwrpay4bQrFsaAqt5vg3dVv2412H1nFPOsQiejc+szeI0F9mErU2
   8YKUwLJm1Z6kMSX7ThAiKMVvn9Jtk5tp6YJldoPcpqOnZG3/T1F3s8NVm
   hU9DhZxl6p46MtXSZmStqUpInI9AKKPiPcuq7VnGSoEldkf5S323gRNfz
   G04BLzp/Ql1mpkQPUvE+oLAsriOEN7kScbsGGMEHemMnvsyr/8CemUVAo
   g==;
X-CSE-ConnectionGUID: Kx5EnSnmTr6cv3c8UHGb6w==
X-CSE-MsgGUID: jM0MpiNBSJSPYSRGpWFOvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22561747"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; 
   d="scan'208";a="22561747"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 01:06:15 -0700
X-CSE-ConnectionGUID: t54/e4KZRQSbr0Tx6V6Y2w==
X-CSE-MsgGUID: 2mmAK8JRQyKuH396dGE71A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; 
   d="scan'208";a="65595116"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Aug 2024 01:06:15 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 01:06:14 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 01:06:13 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 01:06:13 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 01:06:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xCcl/v+gn88PgK4EtnvsJWesqkVbptB1eqfhATR+RpyY0xyJZ935tQkjDfmGwqVq0ExQAuNiN4EBdSk3KpG8JImZEf/j/esWK/GsYf6ye7wISf1rbzKU8ykMmFIT3Ye0UJf6RRGHlV8ky7werDkf2B8N8UdVlIrSCd/LJ3JsRcoGarpphB6/qsptfNLMtnc4DJRAjjNueKN0L0Ax3vW7VbCLgHcXJepO5iGZFJaVqmltF/xYJptGbHMHV9VG6+GQkC50fpCBR2xL6Sa8nj/bTiASjE1hY3DdlSrlOzzxWh5bJt+JKliYZ5epHZv7dz7THtJVCHDdxPvFLRReXVZBrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zdUEsh83Ph8bIaL2/lGAWBOIci2PpS0ozENGhJTZZXY=;
 b=XYU5J/DgiSypkagkF63dU5RKsnd09lRTJZHLJqJ+sScXLDm47j62Mb9m4E8+ap8usIDCdVS8oJhaEBaWduBpufC+t3e9pkQuLtfcBq0Xf/UeYp4pe/jfVqQM1XLRFVWLpULH08N9Intn6AbJtuMCee8LZzahQQAEL5iI5ogFucfU7VWfTitkO271LyR7VNPwBPC6iA6k0v/8q6wVnpIXrZ3Unf36CxGSNsef3XELapg+gsEj3k/j5CqiELajQKh0C/9yUhryraf2NeGuCu6qXpnqmuKwmjoXkku0aVH1x4jwoCrC83ul+o7sdTIaC3Y7MIQOJK2s+qC3BJCQWTVH+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by LV2PR11MB5999.namprd11.prod.outlook.com (2603:10b6:408:17d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 08:06:02 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 08:06:02 +0000
Date: Tue, 20 Aug 2024 16:05:50 +0800
From: kernel test robot <oliver.sang@intel.com>
To: <jasperwang@tencent.com>, <kaixuxia@tencent.com>,
	<frankjpliu@tencent.com>, <kasong@tencent.com>, <sagazchen@tencent.com>,
	<kernelxing@tencent.com>, <aurelianliu@tencent.com>, <deshengwu@tencent.com>,
	<flyingpeng@tencent.com>, <jason.zeng@intel.com>, <wu.zheng@intel.com>,
	<yingbao.jia@intel.com>, <pei.p.jia@intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [opencloudos:next] [tcp]  45323a0a8f: stress-ng.sockmany.ops_per_sec
 9.9% improvement
Message-ID: <202408201521.c370da1a-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR04CA0003.apcprd04.prod.outlook.com
 (2603:1096:4:197::23) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|LV2PR11MB5999:EE_
X-MS-Office365-Filtering-Correlation-Id: 3464f69b-a05e-47b9-2c75-08dcc0eeee99
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?9SXJ3SUPoK+yTECsuLSz3f0z/EX2LDV2mDF44JVMIB6/4V4CcLZQtupuIl?=
 =?iso-8859-1?Q?oDrTbGWEopiuT9EvsScrRMkIJaCM17HS0hQ/br9kxaayUD4ppmFhYmiZN0?=
 =?iso-8859-1?Q?XXYL7/NSpWCyqUprsY/q46CZzTYRiNi2moW2hCw9Gu4hMA5nWpySvyYiX9?=
 =?iso-8859-1?Q?rMWvYzwtUtrGbVh+wBqWLuIeV2JfIoRZDiaVhvxdzdjSHGbmxM5y9CGQap?=
 =?iso-8859-1?Q?e3wGxcPKWlRz/kjcWjJkWGqdjAHOqoC4vcxEB+JXSpKWnlJbhvViWFNecE?=
 =?iso-8859-1?Q?yPz61iM0ZdJ1nYbRAtgQuiBAop80fz7nFKFn+2y2lP9vBzb9yz/4hPYAAF?=
 =?iso-8859-1?Q?+CseDGDa7XYnczpMgLAnk7s7xqNihqKdiC9/euK7F+x9/53MpLpIT9DVW0?=
 =?iso-8859-1?Q?HwGmEaXri/pDFfUuc7buN/fFsDykoYMsAI7VXisBN2lWjddjfVu17biX5O?=
 =?iso-8859-1?Q?LSCipR5hB8YX8tc2V9BhNdoDBgFEI80NaxtsWO3zQqIhaFUAP3GRUGeZeZ?=
 =?iso-8859-1?Q?HsM4Mcn/cdqK/Vz5RjunpI7NV7eonC6na4g/wzaOsO9llXw7Fvz+7T6pj+?=
 =?iso-8859-1?Q?rgrmSvQVa3SEuWafo9M1I2POHa16pT+lB0Ranhb1JA51NX97gBPO8t/cwI?=
 =?iso-8859-1?Q?DikcQW9hwOArQQHOjIjVU392RJl3W4TTPrMGIMcPgCB3k1X8g/drVj0p9k?=
 =?iso-8859-1?Q?syg5excuUKQH8PGfVIjoAn6ZwOzrSSfT/3BGBPAiMGymPifEgprVF9tVGx?=
 =?iso-8859-1?Q?dYp7RAoeudk2KA96AZNsCBzew/vxjH9EHnyqln1cUgOGDKC7DZbXxLHjzl?=
 =?iso-8859-1?Q?membVHtOFX+CbuslOLkzGKwrGVR1JhL8yAEiGmFkgR6KibF3RJTndiidgQ?=
 =?iso-8859-1?Q?mttNMieVSgT51QNuw9IY3Ix5IQER564Ma6najktOhhn5hQW/9WVPIg5GDy?=
 =?iso-8859-1?Q?MSH7s6ERZkmo0d+EojZAF8OnOocwIxuXAPSHWo8Kf9at+oe3ug+pth9l4M?=
 =?iso-8859-1?Q?da6UaNGrKTn8sZTKz560CtyTSMTyw7VJSLTHe6FDKvwDGrR9DyxHAD1ucw?=
 =?iso-8859-1?Q?XF1XKh316MkJxxTXVi3FVo7UgJgdjqvhuVzjCHVzQWvf6ZfDf96Iod3XfL?=
 =?iso-8859-1?Q?NK+8pzD3UfV0sRdqR/79/3LDpT7XScxbowsCyjnslco0Ld3c/kcaQAj7+9?=
 =?iso-8859-1?Q?Hkg2Cq5u8t+pgLE768yxQvOZnrCFBiCnKJwloYtHh0bPXN1vLPLVT9fELy?=
 =?iso-8859-1?Q?X0vYlyYHQ8OXGR1QuJ0lMvCAqkyFDWYwBOcGLujV1SFGbOTMEqakmEs6zm?=
 =?iso-8859-1?Q?6bhF31J5Y56JUJPZTtJd3bSfRCz0e0pytu5iV+0w61kVTcugXxyMiaXstV?=
 =?iso-8859-1?Q?/sHw+O+TbrMZyUqusCCkOVvpx5uoachPqSJ7fU+Z4pEwP7ID7A37A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?fNXGDReRGMl9fgqLbnrx0X4wWud7fe9kDHXXnPhkUuOmhytwF81GSJW4+o?=
 =?iso-8859-1?Q?EUPLCG9TO2yuAWvucz+vVlp26NMHZJCGmoHet/HtIJw9StEaYwTZppPluY?=
 =?iso-8859-1?Q?w/0A0KfVtEBA4C3fvWRxNbKvli3u06fu3n1bLqFlSredXqSi0UEuUgrA4n?=
 =?iso-8859-1?Q?YuJubt8y/5TA3vjkzymGGNKHWVgEU8j2qt9uqtjXcnVFwrOHjpKBwLxNbp?=
 =?iso-8859-1?Q?zZFkZmQdRHsvkrfbgHMuVUR4qae4LO9X3RzoluyoKwskpJIlAU0dhh4J3v?=
 =?iso-8859-1?Q?Kl6julYnnAG0anvahK3vK4bcGReJrSR6PC1gFL+o3JgPjRE3wiv2Pjvx8+?=
 =?iso-8859-1?Q?8E+YgTH6g3iuRhdBlCXW7rLziMv+/Ci0Vbb1bH64yblHAcJYaLwCkApXmT?=
 =?iso-8859-1?Q?PSiRa+eIzO11QgtedmFdQroqg3amuKrhtNDa4XIbIn5kdbrgetHFdHtIRj?=
 =?iso-8859-1?Q?2cFMHoBSCoaQC+kWM0dNfiw9bQCjPytolod6lMCsSS8z5+5zAV+7TRWwoC?=
 =?iso-8859-1?Q?NILtsfGk9EvlbRYHBdta22+zh/fFrEeq0LRjQySpeX3KpF3eb8Kc2pej72?=
 =?iso-8859-1?Q?NoJRbWvI+sdv4zr1T2HV1KsoHQaZgc9Rm8nH/V7u7IhwcJCMwozpzPIhUC?=
 =?iso-8859-1?Q?N2om4/KV8AcLYFtVnAEXt3eke0fSIaE6qZUBUhIm4PNDG86OPhcGEzahnX?=
 =?iso-8859-1?Q?ymkQpIGrpASLX4EqB0CQbx51SSfJjxLKr9whICeg1iOxaORxCOJvDTMD9g?=
 =?iso-8859-1?Q?EdB8TOr9PIBkUpADeYytvhHwYJ62WUQYEsLRALCaxJDDKay5+pLDeRLZ85?=
 =?iso-8859-1?Q?ROCAEUC0kd62E8NtO6LtQibdcpgtgHw8d2ADN+hjL+Pmo3O3MknlX6eR70?=
 =?iso-8859-1?Q?fhI6bLIy9lTGgjvIllgzwWUE9Xnjn9HxgPrGYprBSIKvgXXA9DnCYBoIzG?=
 =?iso-8859-1?Q?sFoAZB2QtH6AhFiLamu0pTof3znnHbpThH3MNUeJUydIcO//OkgbARXhzS?=
 =?iso-8859-1?Q?achuAyj0HgUducqwtAEGWQfQmox1T+etOTsLyXJz9SjbR1+3Xy1QN14jjx?=
 =?iso-8859-1?Q?k/B0CZQBil49vbFodxXOX4LrnuCezLN/3as/+UtVLDevhm86wm+EuJVX9O?=
 =?iso-8859-1?Q?R8HKksUBaHt9eMKqdm9vlRadHckoXJXheFMfK6AlHrzdkeUj21/vcQBKq3?=
 =?iso-8859-1?Q?7Wvs2NbWUueg7pETorFzXRqnD2vOrpGT/VRxuhdyutUQQxeQqDMnSTZPPE?=
 =?iso-8859-1?Q?r8sn3Snap92aRdrPN/F103rvJDF7YJsbV99IdxqdCsheWSCMiOmtjf583G?=
 =?iso-8859-1?Q?lbHZ8j1CvCXsEvZ2F8flwJtSSy8XAcoHFi1BFHb423mfs9BNOr6TV3GkMW?=
 =?iso-8859-1?Q?tdHlZlG8vC+2oWFtD5ouwUTVbpbcfG8pseOD7qE+NAbN/OHIZUnRLMkzPi?=
 =?iso-8859-1?Q?5wr+LsYcrZbSqYGoWmHlLTCOD5Z8w9+eJPaZCD1b0U56SLXb1Lh8Tt9fZt?=
 =?iso-8859-1?Q?taYFfuL3wE3yBuYiiAs85giWoelkB8AEqc3eejlr+S99peHao/eTaOlXtf?=
 =?iso-8859-1?Q?xQcQgZ77iPM+5aiFqqcwyQBzpnqAG6icTCpNObNJfDh7jN8iL2KlUCBNaW?=
 =?iso-8859-1?Q?c1lbCxl/+o0qNqrARyl8uuFVNThdqC3nprhW9Iq+/xIwmBNYd+6v0KeA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3464f69b-a05e-47b9-2c75-08dcc0eeee99
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 08:06:02.0726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rb70mE8VmvtAmTchR2nBjqk8OowsRG+r1vKpJDEjBViuoP66GPDxYQTobpdXMKCq9eXRBphMd9YnY917+m8x7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5999
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 9.9% improvement of stress-ng.sockmany.ops_per_sec on:


commit: 45323a0a8f0cefc05f0e7185092fe1fb71aae2a6 ("tcp: double the default value of thash_entries")
https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next

testcase: stress-ng
test machine: 256 threads 4 sockets INTEL(R) XEON(R) PLATINUM 8592+ (Emerald Rapids) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: sockmany
	cpufreq_governor: performance






Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240820/202408201521.c370da1a-oliver.sang@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-12/performance/x86_64-oc_stream_base_config/100%/debian-12-x86_64-20240206.cgz/lkp-emr-2sp1/sockmany/stress-ng/60s

commit: 
  5030291931 ("tcp: backoff the commit allowing timestamps even if SYN packet has tsval=0")
  45323a0a8f ("tcp: double the default value of thash_entries")

503029193192fbe9 45323a0a8f0cefc05f0e7185092 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    253180 ±185%    +830.6%    2356192 ± 71%  numa-meminfo.node2.FilePages
     63300 ±185%    +830.6%     589063 ± 71%  numa-vmstat.node2.nr_file_pages
    459.02 ± 54%    +101.0%     922.74 ± 16%  sched_debug.cpu.curr->pid.min
    154017            +8.7%     167465        vmstat.system.cs
   4504103            +9.9%    4951644        stress-ng.sockmany.ops
     74584            +9.9%      81931        stress-ng.sockmany.ops_per_sec
   3614097           +12.5%    4065102        stress-ng.time.involuntary_context_switches
   5503665            +8.2%    5952789        stress-ng.time.voluntary_context_switches
    289698 ±  2%      +4.2%     301890 ±  2%  proc-vmstat.nr_inactive_anon
    625821            +1.9%     638012        proc-vmstat.nr_shmem
   1104542            +5.5%    1165521        proc-vmstat.nr_slab_reclaimable
   3065760            +5.7%    3240573        proc-vmstat.nr_slab_unreclaimable
    289698 ±  2%      +4.2%     301890 ±  2%  proc-vmstat.nr_zone_inactive_anon
   2696385            +2.5%    2763152        proc-vmstat.numa_hit
   2300055            +2.9%    2365707        proc-vmstat.numa_local
   6818679            +6.8%    7279752        proc-vmstat.pgalloc_normal
   1236622            +1.7%    1257257        proc-vmstat.pgfault
   6050716            +6.5%    6443724        proc-vmstat.pgfree
     40.13           -21.1%      31.65        perf-stat.i.MPKI
 1.539e+10           +30.5%  2.009e+10        perf-stat.i.branch-instructions
     82.71            -3.4       79.35        perf-stat.i.cache-miss-rate%
 3.123e+09            +9.2%  3.409e+09        perf-stat.i.cache-misses
 3.726e+09           +13.9%  4.244e+09        perf-stat.i.cache-references
    174872            +7.7%     188415        perf-stat.i.context-switches
      9.31           -27.4%       6.76        perf-stat.i.cpi
    246.62            -7.5%     228.05        perf-stat.i.cycles-between-cache-misses
 8.101e+10           +35.7%  1.099e+11        perf-stat.i.instructions
      0.13           +29.3%       0.17        perf-stat.i.ipc
     38.93           -19.8%      31.23        perf-stat.overall.MPKI
     83.88            -3.5       80.39        perf-stat.overall.cache-miss-rate%
      9.12           -26.4%       6.71        perf-stat.overall.cpi
    234.17            -8.2%     214.98        perf-stat.overall.cycles-between-cache-misses
      0.11           +35.8%       0.15        perf-stat.overall.ipc
 1.489e+10           +30.2%  1.939e+10        perf-stat.ps.branch-instructions
  3.05e+09            +8.6%  3.312e+09        perf-stat.ps.cache-misses
 3.636e+09           +13.3%   4.12e+09        perf-stat.ps.cache-references
    158898            +9.0%     173148        perf-stat.ps.context-switches
 7.833e+10           +35.4%  1.061e+11        perf-stat.ps.instructions
     12549            +2.8%      12896        perf-stat.ps.minor-faults
     12550            +2.8%      12896        perf-stat.ps.page-faults
 4.842e+12           +35.3%  6.553e+12        perf-stat.total.instructions
     70.60            -7.8       62.79        perf-profile.calltrace.cycles-pp.__inet_check_established.__inet_hash_connect.inet_hash_connect.tcp_v4_connect.__inet_stream_connect
     87.96            -4.0       83.97        perf-profile.calltrace.cycles-pp.__inet_hash_connect.inet_hash_connect.tcp_v4_connect.__inet_stream_connect.inet_stream_connect
      8.01 ±  5%      -1.9        6.08 ±  3%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_bh.__inet_hash_connect.inet_hash_connect.tcp_v4_connect
      8.01 ±  5%      -1.9        6.08 ±  3%  perf-profile.calltrace.cycles-pp._raw_spin_lock_bh.__inet_hash_connect.inet_hash_connect.tcp_v4_connect.__inet_stream_connect
     99.31            -0.2       99.13        perf-profile.calltrace.cycles-pp.inet_hash_connect.tcp_v4_connect.__inet_stream_connect.inet_stream_connect.__sys_connect_file
     99.36            -0.2       99.20        perf-profile.calltrace.cycles-pp.tcp_v4_connect.__inet_stream_connect.inet_stream_connect.__sys_connect_file.__sys_connect
     99.44            -0.1       99.30        perf-profile.calltrace.cycles-pp.__sys_connect_file.__sys_connect.__x64_sys_connect.do_syscall_64.entry_SYSCALL_64_after_hwframe
     99.44            -0.1       99.30        perf-profile.calltrace.cycles-pp.inet_stream_connect.__sys_connect_file.__sys_connect.__x64_sys_connect.do_syscall_64
     99.46            -0.1       99.32        perf-profile.calltrace.cycles-pp.connect.stress_sockmany
     99.43            -0.1       99.30        perf-profile.calltrace.cycles-pp.__inet_stream_connect.inet_stream_connect.__sys_connect_file.__sys_connect.__x64_sys_connect
     99.44            -0.1       99.30        perf-profile.calltrace.cycles-pp.__sys_connect.__x64_sys_connect.do_syscall_64.entry_SYSCALL_64_after_hwframe.connect
     99.44            -0.1       99.30        perf-profile.calltrace.cycles-pp.__x64_sys_connect.do_syscall_64.entry_SYSCALL_64_after_hwframe.connect.stress_sockmany
     99.46            -0.1       99.32        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.connect.stress_sockmany
     99.46            -0.1       99.32        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.connect.stress_sockmany
      1.78            +0.1        1.92        perf-profile.calltrace.cycles-pp._raw_spin_lock.__inet_check_established.__inet_hash_connect.inet_hash_connect.tcp_v4_connect
      1.78            +0.1        1.92        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.__inet_check_established.__inet_hash_connect.inet_hash_connect
      0.00            +0.6        0.57        perf-profile.calltrace.cycles-pp._raw_spin_unlock_bh.__inet_hash_connect.inet_hash_connect.tcp_v4_connect.__inet_stream_connect
      0.17 ±141%      +0.6        0.74        perf-profile.calltrace.cycles-pp.inet_ehashfn.__inet_check_established.__inet_hash_connect.inet_hash_connect.tcp_v4_connect
     11.21            +3.7       14.94        perf-profile.calltrace.cycles-pp._raw_spin_lock_bh.inet_hash_connect.tcp_v4_connect.__inet_stream_connect.inet_stream_connect
      7.23            +4.9       12.16        perf-profile.calltrace.cycles-pp._raw_spin_lock.__inet_hash_connect.inet_hash_connect.tcp_v4_connect.__inet_stream_connect
     70.76            -7.7       63.01        perf-profile.children.cycles-pp.__inet_check_established
     88.09            -3.9       84.16        perf-profile.children.cycles-pp.__inet_hash_connect
      9.80 ±  4%      -1.8        8.01 ±  2%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
     99.31            -0.2       99.13        perf-profile.children.cycles-pp.inet_hash_connect
     99.36            -0.2       99.20        perf-profile.children.cycles-pp.tcp_v4_connect
     99.44            -0.1       99.30        perf-profile.children.cycles-pp.__sys_connect_file
     99.44            -0.1       99.30        perf-profile.children.cycles-pp.__inet_stream_connect
     99.44            -0.1       99.30        perf-profile.children.cycles-pp.inet_stream_connect
     99.44            -0.1       99.30        perf-profile.children.cycles-pp.__sys_connect
     99.44            -0.1       99.30        perf-profile.children.cycles-pp.__x64_sys_connect
     99.46            -0.1       99.33        perf-profile.children.cycles-pp.connect
     99.74            -0.1       99.66        perf-profile.children.cycles-pp.do_syscall_64
     99.74            -0.1       99.66        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.05            +0.0        0.08 ±  4%  perf-profile.children.cycles-pp.__tcp_send_ack
      0.05            +0.0        0.08        perf-profile.children.cycles-pp.tcp_send_ack
      0.09            +0.0        0.12 ±  3%  perf-profile.children.cycles-pp.ip_local_out
      0.07            +0.0        0.10 ±  3%  perf-profile.children.cycles-pp.__release_sock
      0.09 ±  4%      +0.0        0.12        perf-profile.children.cycles-pp.ip_finish_output
      0.09 ±  4%      +0.0        0.12        perf-profile.children.cycles-pp.ip_output
      0.09 ±  5%      +0.0        0.12        perf-profile.children.cycles-pp.__ip_finish_output
      0.09            +0.0        0.12 ±  3%  perf-profile.children.cycles-pp.__ip_queue_xmit
      0.09            +0.0        0.12 ±  3%  perf-profile.children.cycles-pp.ip_queue_xmit
      0.07            +0.0        0.10 ±  4%  perf-profile.children.cycles-pp.release_sock
      0.08 ±  5%      +0.0        0.12        perf-profile.children.cycles-pp.ip_finish_output2
      0.08 ±  5%      +0.0        0.12        perf-profile.children.cycles-pp.ip_protocol_deliver_rcu
      0.08 ±  5%      +0.0        0.12 ±  3%  perf-profile.children.cycles-pp.ip_local_deliver
      0.08 ±  5%      +0.0        0.12 ±  3%  perf-profile.children.cycles-pp.ip_local_deliver_finish
      0.08 ±  4%      +0.0        0.12 ±  3%  perf-profile.children.cycles-pp.neigh_hh_output
      0.08 ±  6%      +0.0        0.11 ±  3%  perf-profile.children.cycles-pp.tcp_rcv_state_process
      0.08            +0.0        0.12 ±  3%  perf-profile.children.cycles-pp.__dev_queue_xmit
      0.08 ±  4%      +0.0        0.12        perf-profile.children.cycles-pp.tcp_v4_rcv
      0.09            +0.0        0.13        perf-profile.children.cycles-pp.__netif_receive_skb
      0.09            +0.0        0.13        perf-profile.children.cycles-pp.__netif_receive_skb_one_core
      0.10            +0.0        0.14        perf-profile.children.cycles-pp.__tcp_transmit_skb
      0.09            +0.0        0.13        perf-profile.children.cycles-pp.ip_rcv
      0.09            +0.0        0.13        perf-profile.children.cycles-pp.process_backlog
      0.09 ±  4%      +0.0        0.13 ±  2%  perf-profile.children.cycles-pp.net_rx_action
      0.09            +0.0        0.13 ±  2%  perf-profile.children.cycles-pp.__napi_poll
      0.09            +0.0        0.13 ±  2%  perf-profile.children.cycles-pp.tcp_v4_do_rcv
      0.12            +0.1        0.17 ±  2%  perf-profile.children.cycles-pp.__do_softirq
      0.12            +0.1        0.17 ±  2%  perf-profile.children.cycles-pp.do_softirq
      0.01 ±223%      +0.1        0.06 ±  6%  perf-profile.children.cycles-pp.tcp_rcv_synsent_state_process
      0.00            +0.1        0.06        perf-profile.children.cycles-pp.tcp_connect
      0.15 ±  3%      +0.1        0.22 ±  2%  perf-profile.children.cycles-pp.rcu_all_qs
      0.08 ± 59%      +0.1        0.16 ± 20%  perf-profile.children.cycles-pp.reader__read_event
      0.06 ± 54%      +0.1        0.14 ±  9%  perf-profile.children.cycles-pp.process_simple
      0.06 ± 51%      +0.1        0.14 ±  9%  perf-profile.children.cycles-pp.ordered_events__queue
      0.06 ± 51%      +0.1        0.14 ±  9%  perf-profile.children.cycles-pp.queue_event
      0.08 ± 59%      +0.1        0.16 ± 16%  perf-profile.children.cycles-pp.cmd_sched
      0.40 ± 13%      +0.1        0.49 ±  9%  perf-profile.children.cycles-pp.__cmd_record
      0.08 ± 59%      +0.1        0.16 ± 18%  perf-profile.children.cycles-pp.perf_session__process_events
      0.08 ± 59%      +0.1        0.16 ± 18%  perf-profile.children.cycles-pp.record__finish_output
      0.40 ± 13%      +0.1        0.49 ±  9%  perf-profile.children.cycles-pp.cmd_record
      0.40 ± 13%      +0.1        0.49 ±  9%  perf-profile.children.cycles-pp.main
      0.40 ± 13%      +0.1        0.49 ±  9%  perf-profile.children.cycles-pp.run_builtin
      0.26            +0.1        0.39        perf-profile.children.cycles-pp.__cond_resched
      0.58            +0.2        0.77        perf-profile.children.cycles-pp.__local_bh_enable_ip
      0.53            +0.2        0.73        perf-profile.children.cycles-pp._raw_spin_unlock_bh
      0.59            +0.3        0.88        perf-profile.children.cycles-pp.inet_ehashfn
     19.27 ±  2%      +1.8       21.09        perf-profile.children.cycles-pp._raw_spin_lock_bh
      9.06            +5.1       14.15        perf-profile.children.cycles-pp._raw_spin_lock
     68.25            -8.2       60.09        perf-profile.self.cycles-pp.__inet_check_established
      9.78 ±  4%      -1.8        7.99 ±  2%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      0.10            +0.0        0.15 ±  2%  perf-profile.self.cycles-pp.rcu_all_qs
      0.15            +0.1        0.22        perf-profile.self.cycles-pp._raw_spin_unlock_bh
      0.06 ± 51%      +0.1        0.14 ±  9%  perf-profile.self.cycles-pp.queue_event
      0.19            +0.1        0.28        perf-profile.self.cycles-pp.__cond_resched
      0.42            +0.1        0.55        perf-profile.self.cycles-pp.__local_bh_enable_ip
      0.56            +0.3        0.84        perf-profile.self.cycles-pp.inet_ehashfn
      1.21            +0.5        1.70        perf-profile.self.cycles-pp.__inet_hash_connect
     11.20            +3.7       14.93        perf-profile.self.cycles-pp._raw_spin_lock_bh
      7.23            +4.9       12.16        perf-profile.self.cycles-pp._raw_spin_lock




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

