Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242C11DFDBB
	for <oe-lkp@lists.linux.dev>; Tue,  7 Jan 2025 08:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736236817; cv=fail; b=AOfPJty/2ybCBOxRTNRHA1B1WuAyq4L69igdJedhRORfN//5/AH5H7dLaRz3pb1oYcFxou2JM838l0/bAacCzK/aIpS45WPNIiWlM9eEJIDTC4WO7GOOohHeZ2jKPVsX9uCbFiw2QfA98vIlpERslLQooCiOvPl81D4FgdL/C4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736236817; c=relaxed/simple;
	bh=OxcOsdtFMwbmhxcS6xwcvSyxgzBzVqVLdKn5WTlnKg8=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=S0UA8DiCUhu6QNEiFoow5NzRjxATDXwKgmwj+QtrcXibwuVSwscRKGmDB7eJOgLAJDGLfX7ie+QhOwTR2rFdd7a+wsGzA1gW9Uk1Z/k3ScJ5bg0MhH8vwIeNriUytU26jb89T6b5j0YTX4U3SQav0sa8EpJH4CXDCVsqvZmeqQU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=USilfjqj; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="USilfjqj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736236813; x=1767772813;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=OxcOsdtFMwbmhxcS6xwcvSyxgzBzVqVLdKn5WTlnKg8=;
  b=USilfjqjnbQQLx0sid3KqF32ZFYV/LGfuf/mPrsVVYGJ2mCvlhvck2Lb
   Czv4hCgGL4ihXXuGFe2RErZF5m5w0gnEgwCVaKGjvR4mWUSvs1twz2fgA
   Of1sZ5lAVxjAvHC20nfh4wmSU+5b8WweboLBTmrlAjchrtilCHkCvI42C
   Lvj+c9m/nEwF2iu0qR97moIm274HWRTY2AzIARjFGePLCqB2eFZ1j1dAF
   6X2OSUj5HQeEiomGBZnU3uFkwdg0EXs1sJgQ10aVlidXQ7yCg6P5oX+ZV
   k3onffFToEfPpgQI63E4sWvNpz0xcb/zDHEJztY1Aujydy3BNkPPqghYv
   w==;
X-CSE-ConnectionGUID: knfFPCZwR86rLAyXXIvHBw==
X-CSE-MsgGUID: Z+5DmKgfRESNlqHBEjhung==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="24011085"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; 
   d="scan'208";a="24011085"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 00:00:12 -0800
X-CSE-ConnectionGUID: spdR/lK2TRuXxpZoz6QZ3g==
X-CSE-MsgGUID: SM0xXHYvT1qM6orN9FtxLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; 
   d="scan'208";a="107562668"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Jan 2025 00:00:12 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 7 Jan 2025 00:00:11 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 7 Jan 2025 00:00:11 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 7 Jan 2025 00:00:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fs2duGR3ixV+hkFeFqleck1NzZSB0swwPKyje++xt7eLH248/N933llMljkax8WH0euLinL+ptiLTiC0dGkzAxDqEpIASYs3pBguqeDfjfAeGcyZn8LTJUBzNMc5958GgO5l4rYMFkz/4b/pl668CWSLGRKWkW8JR8MBsy68r7Pv2UtHNxQKTzYTyWUZewhRYu/BxR/n7l11RwKs3s+Gg8wJ6H8Bc9g1cYIbBouac1DgC8jQu/oiGFm/BB1OE30pwrdYreFuI2vCx2hO9GM2RSR9Bih18zwCvw4hub2i5UuxN49TiiZ+Sjgif4gd8XdPumcD8Wjg75+XuQjiQZpEfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sJzH49sKeqxRPSkF+b7Wrotbf4tEHJUEmydhmkFh9ok=;
 b=yyhAuhMfCWkMvR357G/RZO1OeD+2yP240UMyzTbP2wFopbtN603OF3epCUzBr1qPEeUohf7FGXggIsG3rxorm+OV1l40SnEh2ggYM/PtlDpZvo3P4Om3/eqQB0TUL1iJsOehlhZ2krEOCktOzIsYnmY1e7pA2JR8ZhuzfVxwSIWo+iJ7FZB/pdzhTur+qxpMUR+P6lK/FvH6u9PvijfGafxEoBmWaFOUWqoJTz8qdtFE4a3JRDl1HD7PUKM8ukGoy5mhvnVb0sMoHEc/zEpBmalv+0V+H1qu06qnEZ6RpjYS2sfS7oFvi+Nc3MDkIm1c8To5LCfKbqGCr7Df4Raiww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by IA0PR11MB7281.namprd11.prod.outlook.com (2603:10b6:208:43b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.16; Tue, 7 Jan
 2025 07:59:23 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8335.010; Tue, 7 Jan 2025
 07:59:23 +0000
Date: Tue, 7 Jan 2025 15:59:15 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Frederic Weisbecker <fweisbec@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [frederic-dynticks:cpuidle/polling-v2] [cpuidle]  f4de2cbaca:
 filebench.sum_operations/s 6.6% improvement
Message-ID: <202501071525.35650293-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR06CA0237.apcprd06.prod.outlook.com
 (2603:1096:4:ac::21) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|IA0PR11MB7281:EE_
X-MS-Office365-Filtering-Correlation-Id: 78ff677c-d4a4-4c2d-a9cf-08dd2ef132a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?bitsVA9tVTDwj3Pm6K3TNqVDeqd+VVja7g0whhjxrNEYCLc3ZiY7w8r2TR?=
 =?iso-8859-1?Q?qELxAic3PSwNxCupp/lCfPCGVc1BANE+F+g/71xVBJ6hRq/ExptIJiYtWk?=
 =?iso-8859-1?Q?Mv1BHLbV2lpVPhKN0uprVXi3J3HtYD4kjkG113sZGvXt1bpOzmaerDOGPg?=
 =?iso-8859-1?Q?YF4QlLZOay/GtVjriS7LD4jGSxPSoHVEYOL0xibQgkreLNLJuGDkaLUVEz?=
 =?iso-8859-1?Q?EgyTR7BsuSYz5Nc6A4q+MQjcV04sqxKHLq+UueBSrgtbef6Jfr7FGpmTjE?=
 =?iso-8859-1?Q?kqoDm7jBAz/ObrUh4EZLAjFEc7t9lOjY7W5osVbfz9ZFZ2FiDhfl2cnvGm?=
 =?iso-8859-1?Q?bNotp21ZL+PRPsAcff3sG8heubGSW4M3z6BzxHCdHx86bpmJXgNKSpC2nM?=
 =?iso-8859-1?Q?2Vk8NML51ABNgfLCzsypN3Ezb34qDxHHu0zcuhsESTgAVtD4dIjBN35zt6?=
 =?iso-8859-1?Q?RMeiHzwfRj9af+7JTMMeyiLKO9//sOaXAo+CKQ6On6y/IF5d9kikF4g9xy?=
 =?iso-8859-1?Q?wStiAw5WLgWl2yVH86/EacFo+YcmrvZ33pgehiLsClsZtQiw/+3T0NFDWP?=
 =?iso-8859-1?Q?I1x7nmlsqjWvTN2LYPEh6HKkUWUT6LaQiPlpE/r/sXwogSlHXYisi60aEf?=
 =?iso-8859-1?Q?SoA28ByQervsKOhnjPMgGcjTS7dWJnEWoEJ+oHIZ5y6kM195qNYC5GFxpB?=
 =?iso-8859-1?Q?oW2xp6RTJemnnG+pL4KUHo5/Uc+fHGJKpjtm61qdjxUpkvdxJA/9Ivq4j9?=
 =?iso-8859-1?Q?ehJIQuJPn45Nqa10idWxW2TinmSPZ1qZLEl6GaueXLiYQyNuOT8bT7xFMi?=
 =?iso-8859-1?Q?kTJwg55cZxDzj9UFsAGoCWzvkC5yf13LQcqgFcneU4hLB7sOeXiVY3Zk4Y?=
 =?iso-8859-1?Q?IpCCspCCQg3uN1CYwl6VibGR4bUkD092nCeDTvr7mrpxelKpiE9lFrHuqu?=
 =?iso-8859-1?Q?UeWkrsvnv1shJPLjcdNZqwU/5pd7DRxYd+fRxtAeOfmNsE9W7T/N9Jtp+g?=
 =?iso-8859-1?Q?4elExoFbHVnPsUVR+A/viGPwEE51Fsf0l8TncmmuggXS5gRjY1s9id83uZ?=
 =?iso-8859-1?Q?D/WN3d3QiyJQdLLuv+hl9gmFS9jHnVIbi6s5g8sPSJtnBDcwmIxyi1ZMA/?=
 =?iso-8859-1?Q?Bf3h6N6MKpt4YO4Ug2dXrSypgEC9jFcLh9cZG2WmhfTCiKZ2eIbOvMlKCL?=
 =?iso-8859-1?Q?KL0P8uEUtEFCcljScVFTqkSLSjhCVV/X6gMMIiCr972vbKjjLwkPiATd9B?=
 =?iso-8859-1?Q?k2ASwCuJfk3jmlw85Ug1d0liEXvhfdoYp6tC/JHgSey/hGkCexBQKisTBs?=
 =?iso-8859-1?Q?9BaIfk3JgoK47WZKE6KWGr1l0QVXS+ig5ltV3+BtI8p38Kl+BDzxVL3Vzi?=
 =?iso-8859-1?Q?xt17fzxwRYUNQW9kBmLWbbe3iOKQHYjQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?sU232R90RphN2fAtHImeeZ82ZqjfhOp21L/HSaBF3OzXIPPuy34eEk/thm?=
 =?iso-8859-1?Q?64r9tPe8T7VDKBYv5dyOaifGsz+yc6+7E+/qF3XBr04f5n/R40SJ5Au6D/?=
 =?iso-8859-1?Q?k0afAS6iLOETjhBjGoIPLZ5ci1/71mr7wtVUF+/QemJTGZx75bRzTbNS5L?=
 =?iso-8859-1?Q?iLhpSkUYT3JZR22pJpA6nMB3IR8Xr8DSesdhMmA7VENeLen7B9nqnahm9r?=
 =?iso-8859-1?Q?35GVSlI/mVR/9q8s0/SVumTBdFZ7gdH02Jjr9mkoNOgRYdSfi2CvNpO4gw?=
 =?iso-8859-1?Q?k9BHqujfEqWd2DgvlH81u+A7Zd8xylHpJL+muG9UREmrOatkMGPdBJOACL?=
 =?iso-8859-1?Q?eHML0B+0WBxj+WBm+FmRaB2AcNZG0s0yPvjQsinwHrZ52p0sNrFayaKX5F?=
 =?iso-8859-1?Q?DN7En9WqL075SXbPvCQirxL04h3P2jCv0u4L/t5YK4aKmZ4AaiZpl2DvPb?=
 =?iso-8859-1?Q?Y7ipPg+zW3RDlX4aJVqkifYYsRr+wIv+RI4ssckmgmTlz/3CVU5vjRkFM+?=
 =?iso-8859-1?Q?IVqK1rERdzTS3cM+bYBNQ8MHSVhWaSmRhc7UzNiriGNWxtSk9NCzvdQ1Kt?=
 =?iso-8859-1?Q?5qC7i1wYdUW2G/quo/6NH2H/G+NGbfw4KmCfT43UW5y7reMs+gosBq53Fv?=
 =?iso-8859-1?Q?6OFrS7wvRypFUgP9aNPsVZ12VSMeZoHGpQ/eJFW6GEoCeFrCcY6D5Y0vqE?=
 =?iso-8859-1?Q?0fU9OlbQFsP5xSG83Kv1DX20TKbjJzxMFXpv/6K4n1LQQ6s8J3t+r3uFAj?=
 =?iso-8859-1?Q?RdF+t7DMHrfcZkZ/zRpFVwg3wEVRH/ufHF1g6z7TM6mBBzouWULnE37nlu?=
 =?iso-8859-1?Q?bQkwgSWl9wM452gKKbwuMQN+/nJNerWSDzgZgM7jJxyHcuxyR4hAqXRYph?=
 =?iso-8859-1?Q?NONLreLq2sZX3+qP4rlPhqPELlFUS9oOXd/EMjrxtwcwBMKrPTXixrnOww?=
 =?iso-8859-1?Q?AQohbaqOv1WQA760YrWDoFsr+LIAN9UXhvwFpdPydDiZdt3H5lhtHoP5zq?=
 =?iso-8859-1?Q?v3u4KiklUonysJsMeRsPeNl0+7qEYWV5KrlZQFfXNgsQ+oVTfA319C1Q53?=
 =?iso-8859-1?Q?WtaRJ6tsvDo+Af4w+AEAYAJyK92OYcDFaf7GaLKjcvSuP8be80Bi7yP9Gc?=
 =?iso-8859-1?Q?fcHI3V8Cs/etn2tvO0bcyEtXWCt/+2eW0DxmpUFVxxjU5trcdAxAkkvzkP?=
 =?iso-8859-1?Q?5Loju5rBz1K/7C6PTCjNYb1R3XLOE+keVmQdR0j530xZeObjFlk/TG2WLL?=
 =?iso-8859-1?Q?RcXXhz3U5kiexK7jwAM8fT7AytONSvLjVq6Ji0f0r7m8P/kNU8k8mba+y6?=
 =?iso-8859-1?Q?bFaMYAi8XyGu4SrqYGZm/+5xJFdi4T/42hPtexSS/wUv1TBqBSmplARyiY?=
 =?iso-8859-1?Q?mXMKVfxFw/HDTEp+Mn78PPHCDIR1Cr7Luxzojdn34V4yyUifV736W7Oe8h?=
 =?iso-8859-1?Q?bnclVsXhtRONtNwinw++qmYh1SqAsfblA8FL8Q2nKdXvNnb/Fe7Y6NRjmK?=
 =?iso-8859-1?Q?TdIcdyMtr1CqB04sv32s+bDVQ0/dp0yKLDAKv3IQzkvIN9M0cpmbhHwwHZ?=
 =?iso-8859-1?Q?ZyKDu/N9hAigS47ZNSzIzTZsQD+nrgI0u3f3sFme1yXVyoL/ou+dZFNmei?=
 =?iso-8859-1?Q?StkgHfvudIp3EOXjT9BqgBDBqQiBW+JlO0nPszuGFkIkOHww64FPEKkg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 78ff677c-d4a4-4c2d-a9cf-08dd2ef132a2
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 07:59:23.1040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rTWz82LHsL4lsl1CCNilXzX2c9Q5G2wg2z34Y5RameVsEnSZME0wiUROAOu73tap7GwLHZx4MuHLd6H54NG2gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7281
X-OriginatorOrg: intel.com




Hello,

kernel test robot noticed a 6.6% improvement of filebench.sum_operations/s on:


commit: f4de2cbaca6897b0258c68cdb82aac72dbb53e92 ("cpuidle: Handle TIF_NR_POLLING on behalf of CPUIDLE_FLAG_MWAIT states")
https://git.kernel.org/cgit/linux/kernel/git/frederic/linux-dynticks.git cpuidle/polling-v2

testcase: filebench
config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz (Ice Lake) with 128G memory
parameters:

	disk: 1HDD
	fs: xfs
	test: webproxy.f
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+---------------------------------------------------------------------------------------------+
| testcase: change | stress-ng: stress-ng.vm-rw.ops_per_sec 2.0% improvement                                     |
| test machine     | 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 512G memory |
| test parameters  | cpufreq_governor=performance                                                                |
|                  | nr_threads=100%                                                                             |
|                  | test=vm-rw                                                                                  |
|                  | testtime=60s                                                                                |
+------------------+---------------------------------------------------------------------------------------------+




Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250107/202501071525.35650293-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/disk/fs/kconfig/rootfs/tbox_group/test/testcase:
  gcc-12/performance/1HDD/xfs/x86_64-rhel-9.4/debian-12-x86_64-20240206.cgz/lkp-icl-2sp6/webproxy.f/filebench

commit: 
  7a380fb031 ("x86/cpuidle: Move buggy mwait implementations away from CPUIDLE_FLAG_MWAIT")
  f4de2cbaca ("cpuidle: Handle TIF_NR_POLLING on behalf of CPUIDLE_FLAG_MWAIT states")

7a380fb031db0bb4 f4de2cbaca6897b0258c68cdb82 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      6407 ± 12%     +23.5%       7910 ±  8%  sched_debug.cpu.nr_switches.stddev
   1481526 ±  2%      +6.5%    1577678        proc-vmstat.nr_dirtied
   2012628            +4.0%    2093241        proc-vmstat.numa_hit
   1880101            +4.3%    1960706        proc-vmstat.numa_local
   2771079            +3.7%    2874789        proc-vmstat.pgalloc_normal
   2734823            +3.7%    2836297        proc-vmstat.pgfree
    458.15 ±  2%      +6.6%     488.26        filebench.sum_bytes_mb/s
  11016311 ±  2%      +6.6%   11745721        filebench.sum_operations
    183589 ±  2%      +6.6%     195745        filebench.sum_operations/s
     48313 ±  2%      +6.6%      51511        filebench.sum_reads/s
      0.54 ±  2%      -6.2%       0.51        filebench.sum_time_ms/op
      9662 ±  2%      +6.6%      10302        filebench.sum_writes/s
  11852212 ±  2%      +6.5%   12621425        filebench.time.file_system_outputs
  20819339            +1.7%   21174015        perf-stat.i.branch-misses
   8883260 ±  2%      +4.4%    9278168        perf-stat.i.cache-misses
      3980 ±  2%      +3.6%       4122        perf-stat.i.minor-faults
      3980 ±  2%      +3.6%       4122        perf-stat.i.page-faults
      3.12            +3.1%       3.21        perf-stat.overall.MPKI
      9.80            +0.3       10.13        perf-stat.overall.cache-miss-rate%
      2.02            -2.2%       1.98        perf-stat.overall.cpi
    649.78            -5.2%     616.22        perf-stat.overall.cycles-between-cache-misses
      0.49            +2.2%       0.51        perf-stat.overall.ipc
  20746231            +1.6%   21070901        perf-stat.ps.branch-misses
   8857896 ±  2%      +4.4%    9243835        perf-stat.ps.cache-misses
      3942 ±  2%      +3.5%       4081        perf-stat.ps.minor-faults
      3942 ±  2%      +3.5%       4081        perf-stat.ps.page-faults
      0.04 ± 38%     -49.9%       0.02 ± 71%  perf-sched.sch_delay.avg.ms.__cond_resched.folio_mc_copy.move_to_new_folio.migrate_pages_batch.migrate_pages
      0.05 ± 20%     -38.0%       0.03 ± 42%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
      0.06 ±  4%     -15.4%       0.05 ±  8%  perf-sched.sch_delay.avg.ms.schedule_timeout.___down_common.__down.down
      0.06 ± 27%     -19.7%       0.05 ±  4%  perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.04 ±  7%     -18.4%       0.03 ±  8%  perf-sched.sch_delay.avg.ms.xlog_grant_head_wait.xlog_grant_head_check.xfs_log_reserve.xfs_trans_reserve
    160.84 ±114%     -65.4%      55.58 ± 19%  perf-sched.total_sch_delay.max.ms
     11.55 ±  6%      -8.5%      10.56 ±  3%  perf-sched.wait_and_delay.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.open_last_lookups
     11.09 ±  2%      -9.9%      10.00 ±  3%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.___down_common.__down.down
     16.91 ± 11%     -12.9%      14.72 ±  3%  perf-sched.wait_and_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     18.01 ± 16%     +54.1%      27.75 ± 24%  perf-sched.wait_and_delay.avg.ms.xlog_state_get_iclog_space.xlog_write.xlog_cil_write_commit_record.xlog_cil_push_work
      5656 ±  5%     +12.5%       6365 ±  3%  perf-sched.wait_and_delay.count.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.open_last_lookups
     12.83 ±223%    +528.1%      80.60 ±  3%  perf-sched.wait_and_delay.count.xlog_wait_on_iclog.xlog_cil_push_work.process_one_work.worker_thread
     57.11 ±133%     -89.6%       5.93 ± 95%  perf-sched.wait_time.avg.ms.__cond_resched.iomap_write_iter.iomap_file_buffered_write.xfs_file_buffered_write.vfs_write
     11.49 ±  6%      -8.6%      10.50 ±  3%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.open_last_lookups
     11.04 ±  2%      -9.8%       9.95 ±  3%  perf-sched.wait_time.avg.ms.schedule_timeout.___down_common.__down.down
     16.85 ± 11%     -12.9%      14.67 ±  3%  perf-sched.wait_time.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     17.90 ± 16%     +54.4%      27.65 ± 24%  perf-sched.wait_time.avg.ms.xlog_state_get_iclog_space.xlog_write.xlog_cil_write_commit_record.xlog_cil_push_work
    138.36 ±102%     -84.7%      21.15 ± 78%  perf-sched.wait_time.max.ms.__cond_resched.iomap_write_iter.iomap_file_buffered_write.xfs_file_buffered_write.vfs_write
     17.69 ±  4%      -1.0       16.67 ±  4%  perf-profile.calltrace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      2.31 ± 25%      -0.5        1.81 ±  8%  perf-profile.calltrace.cycles-pp.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.76 ± 17%      -0.4        0.36 ± 82%  perf-profile.calltrace.cycles-pp.__pick_next_task.__schedule.schedule_idle.do_idle.cpu_startup_entry
      7.26 ±  4%      -0.8        6.49 ±  3%  perf-profile.children.cycles-pp.__schedule
      4.72 ± 12%      -0.7        4.05 ±  7%  perf-profile.children.cycles-pp.__pick_next_task
      4.89 ±  9%      -0.6        4.29 ±  5%  perf-profile.children.cycles-pp.schedule
      2.31 ± 25%      -0.5        1.82 ±  9%  perf-profile.children.cycles-pp.worker_thread
      4.26 ±  9%      -0.4        3.87 ±  6%  perf-profile.children.cycles-pp.bprm_execve
      1.38 ± 17%      -0.3        1.06 ± 26%  perf-profile.children.cycles-pp.update_rq_clock_task
      0.61 ± 19%      -0.3        0.33 ± 30%  perf-profile.children.cycles-pp.load_elf_interp
      0.95 ± 15%      -0.3        0.68 ± 20%  perf-profile.children.cycles-pp.native_irq_return_iret
      0.75 ± 24%      -0.2        0.50 ± 28%  perf-profile.children.cycles-pp.dup_task_struct
      0.48 ± 28%      -0.2        0.27 ± 38%  perf-profile.children.cycles-pp.cpu_util
      0.60 ±  7%      -0.2        0.42 ± 29%  perf-profile.children.cycles-pp.setup_arg_pages
      0.37 ± 33%      -0.2        0.20 ± 58%  perf-profile.children.cycles-pp.set_next_entity
      0.30 ± 15%      -0.2        0.14 ± 53%  perf-profile.children.cycles-pp.arch_do_signal_or_restart
      0.44 ± 11%      -0.2        0.29 ± 23%  perf-profile.children.cycles-pp.relocate_vma_down
      0.35 ± 16%      -0.1        0.20 ± 28%  perf-profile.children.cycles-pp.__vmalloc_area_node
      0.23 ± 31%      -0.1        0.11 ± 28%  perf-profile.children.cycles-pp.map_vdso
      0.16 ± 49%      -0.1        0.04 ± 93%  perf-profile.children.cycles-pp.tmigr_cpu_activate
      0.17 ± 16%      -0.1        0.09 ± 61%  perf-profile.children.cycles-pp._install_special_mapping
      0.12 ± 64%      +0.1        0.23 ± 23%  perf-profile.children.cycles-pp.__switch_to_asm
      0.12 ± 38%      +0.1        0.24 ± 26%  perf-profile.children.cycles-pp.up_write
      0.16 ± 24%      +0.1        0.29 ± 28%  perf-profile.children.cycles-pp.__fput
      0.34 ± 26%      +0.1        0.49 ± 19%  perf-profile.children.cycles-pp._find_next_bit
      0.80 ± 12%      +0.4        1.22 ± 19%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      0.94 ± 14%      -0.3        0.68 ± 20%  perf-profile.self.cycles-pp.native_irq_return_iret
      0.43 ± 28%      -0.2        0.25 ± 35%  perf-profile.self.cycles-pp.cpu_util
      0.22 ± 31%      -0.1        0.13 ± 34%  perf-profile.self.cycles-pp.cpuidle_governor_latency_req
      0.10 ± 26%      -0.1        0.03 ± 82%  perf-profile.self.cycles-pp.asm_exc_page_fault
      0.02 ±141%      +0.1        0.12 ± 33%  perf-profile.self.cycles-pp.down_read_trylock
      0.12 ± 64%      +0.1        0.23 ± 23%  perf-profile.self.cycles-pp.__switch_to_asm
      0.11 ± 46%      +0.1        0.24 ± 26%  perf-profile.self.cycles-pp.up_write
      0.16 ± 50%      +0.3        0.44 ± 29%  perf-profile.self.cycles-pp.do_idle
      0.75 ± 11%      +0.4        1.18 ± 23%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave


***************************************************************************************************
lkp-spr-2sp4: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 512G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-12/performance/x86_64-rhel-9.4/100%/debian-12-x86_64-20240206.cgz/lkp-spr-2sp4/vm-rw/stress-ng/60s

commit: 
  7a380fb031 ("x86/cpuidle: Move buggy mwait implementations away from CPUIDLE_FLAG_MWAIT")
  f4de2cbaca ("cpuidle: Handle TIF_NR_POLLING on behalf of CPUIDLE_FLAG_MWAIT states")

7a380fb031db0bb4 f4de2cbaca6897b0258c68cdb82 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      1.24            -0.2        0.99        mpstat.cpu.all.irq%
    708284 ± 11%     -16.5%     591126 ±  6%  sched_debug.cpu.max_idle_balance_cost.max
     19182 ± 39%     -56.7%       8297 ± 50%  sched_debug.cpu.max_idle_balance_cost.stddev
  11989239            +2.1%   12236767        vmstat.system.cs
   1257536            -8.7%    1148496        vmstat.system.in
  3.89e+09            +2.1%   3.97e+09        proc-vmstat.nr_foll_pin_acquired
  3.89e+09            +2.1%   3.97e+09        proc-vmstat.nr_foll_pin_released
      7719 ±  2%      -5.1%       7325 ±  3%  proc-vmstat.nr_page_table_pages
  16458012            +3.0%   16950005        stress-ng.time.involuntary_context_switches
 4.373e+08            +2.0%  4.462e+08        stress-ng.time.voluntary_context_switches
 2.198e+08            +2.0%  2.243e+08        stress-ng.vm-rw.ops
   3662922            +2.0%    3737506        stress-ng.vm-rw.ops_per_sec
      0.15            -3.6%       0.15 ±  2%  perf-stat.i.MPKI
  4.67e+10            +1.4%  4.737e+10        perf-stat.i.branch-instructions
      0.63            -0.0        0.62        perf-stat.i.branch-miss-rate%
      0.83            -0.0        0.80        perf-stat.i.cache-miss-rate%
 5.479e+09            +1.2%  5.544e+09        perf-stat.i.cache-references
  12414421            +1.9%   12653898        perf-stat.i.context-switches
      2.05            -1.1%       2.03        perf-stat.i.cpi
 2.487e+11            +1.5%  2.523e+11        perf-stat.i.instructions
     73.18            +2.0%      74.60        perf-stat.i.metric.K/sec
      0.59            -0.0        0.58        perf-stat.overall.branch-miss-rate%
      2.02            -1.1%       2.00        perf-stat.overall.cpi
      0.50            +1.1%       0.50        perf-stat.overall.ipc
 4.568e+10            +1.8%  4.649e+10        perf-stat.ps.branch-instructions
 5.375e+09            +1.3%  5.447e+09        perf-stat.ps.cache-references
  12180536            +2.1%   12434053        perf-stat.ps.context-switches
   3943914            +1.3%    3997071        perf-stat.ps.cpu-migrations
 2.433e+11            +1.8%  2.477e+11        perf-stat.ps.instructions
 1.482e+13            +1.6%  1.505e+13        perf-stat.total.instructions
      7.00            -1.1        5.93        perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      6.49            -0.9        5.59        perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
      6.44            -0.9        5.54        perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
      5.64            -0.7        4.97        perf-profile.calltrace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
     17.89            -0.4       17.47        perf-profile.calltrace.cycles-pp.common_startup_64
     17.76            -0.4       17.35        perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.common_startup_64
     17.80            -0.4       17.40        perf-profile.calltrace.cycles-pp.start_secondary.common_startup_64
     17.79            -0.4       17.39        perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.common_startup_64
      0.69            +0.0        0.72        perf-profile.calltrace.cycles-pp.dl_server_start.enqueue_task_fair.enqueue_task.ttwu_do_activate.sched_ttwu_pending
      0.55            +0.0        0.58        perf-profile.calltrace.cycles-pp.sched_mm_cid_migrate_to.ttwu_do_activate.sched_ttwu_pending.__flush_smp_call_function_queue.flush_smp_call_function_queue
      0.88            +0.0        0.91        perf-profile.calltrace.cycles-pp.update_load_avg.enqueue_entity.enqueue_task_fair.enqueue_task.ttwu_do_activate
      3.31            +0.0        3.34        perf-profile.calltrace.cycles-pp.pin_user_pages_remote.process_vm_rw_single_vec.process_vm_rw_core.process_vm_rw.__x64_sys_process_vm_writev
      0.64            +0.0        0.67        perf-profile.calltrace.cycles-pp.enqueue_dl_entity.dl_server_start.enqueue_task_fair.enqueue_task.ttwu_do_activate
      9.05            +0.0        9.09        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.read.__clone
      7.96            +0.0        8.00        perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read.__clone
      9.03            +0.0        9.08        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.read.__clone
      9.66            +0.0        9.70        perf-profile.calltrace.cycles-pp.read.__clone
      3.34            +0.1        3.40        perf-profile.calltrace.cycles-pp.__schedule.schedule_idle.do_idle.cpu_startup_entry.start_secondary
      3.44            +0.1        3.50        perf-profile.calltrace.cycles-pp.schedule_idle.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      5.67            +0.1        5.76        perf-profile.calltrace.cycles-pp._copy_from_iter.copy_page_from_iter.process_vm_rw_single_vec.process_vm_rw_core.process_vm_rw
      5.90            +0.1        5.98        perf-profile.calltrace.cycles-pp.copy_page_from_iter.process_vm_rw_single_vec.process_vm_rw_core.process_vm_rw.__x64_sys_process_vm_writev
     19.48            +0.1       19.58        perf-profile.calltrace.cycles-pp.__clone
      7.94            +0.1        8.04        perf-profile.calltrace.cycles-pp.__get_user_pages.__gup_longterm_locked.pin_user_pages_remote.process_vm_rw_single_vec.process_vm_rw_core
      8.07            +0.1        8.17        perf-profile.calltrace.cycles-pp.__gup_longterm_locked.pin_user_pages_remote.process_vm_rw_single_vec.process_vm_rw_core.process_vm_rw
      3.46            +0.1        3.57        perf-profile.calltrace.cycles-pp.enqueue_task_fair.enqueue_task.ttwu_do_activate.sched_ttwu_pending.__flush_smp_call_function_queue
      3.65            +0.1        3.77        perf-profile.calltrace.cycles-pp.enqueue_task.ttwu_do_activate.sched_ttwu_pending.__flush_smp_call_function_queue.flush_smp_call_function_queue
     27.56            +0.1       27.68        perf-profile.calltrace.cycles-pp.process_vm_readv.stress_vm_rw
     10.36            +0.1       10.49        perf-profile.calltrace.cycles-pp.process_vm_rw_single_vec.process_vm_rw_core.process_vm_rw.__x64_sys_process_vm_writev.do_syscall_64
     11.05            +0.1       11.20        perf-profile.calltrace.cycles-pp.process_vm_rw_core.process_vm_rw.__x64_sys_process_vm_writev.do_syscall_64.entry_SYSCALL_64_after_hwframe
     11.60            +0.2       11.76        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.process_vm_writev.stress_vm_rw
      4.34            +0.2        4.50        perf-profile.calltrace.cycles-pp.ttwu_do_activate.sched_ttwu_pending.__flush_smp_call_function_queue.flush_smp_call_function_queue.do_idle
     11.37            +0.2       11.52        perf-profile.calltrace.cycles-pp.__x64_sys_process_vm_writev.do_syscall_64.entry_SYSCALL_64_after_hwframe.process_vm_writev.stress_vm_rw
     11.35            +0.2       11.50        perf-profile.calltrace.cycles-pp.process_vm_rw.__x64_sys_process_vm_writev.do_syscall_64.entry_SYSCALL_64_after_hwframe.process_vm_writev
     11.64            +0.2       11.80        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.process_vm_writev.stress_vm_rw
     12.02            +0.2       12.19        perf-profile.calltrace.cycles-pp.process_vm_writev.stress_vm_rw
      5.46            +0.2        5.64        perf-profile.calltrace.cycles-pp.sched_ttwu_pending.__flush_smp_call_function_queue.flush_smp_call_function_queue.do_idle.cpu_startup_entry
      6.42            +0.2        6.59        perf-profile.calltrace.cycles-pp.flush_smp_call_function_queue.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      5.93            +0.2        6.12        perf-profile.calltrace.cycles-pp.__flush_smp_call_function_queue.flush_smp_call_function_queue.do_idle.cpu_startup_entry.start_secondary
     60.45            +0.3       60.78        perf-profile.calltrace.cycles-pp.stress_vm_rw
      7.05            -1.1        5.97        perf-profile.children.cycles-pp.cpuidle_idle_call
      6.51            -0.9        5.58        perf-profile.children.cycles-pp.cpuidle_enter_state
      6.52            -0.9        5.62        perf-profile.children.cycles-pp.cpuidle_enter
      5.67            -0.7        5.00        perf-profile.children.cycles-pp.intel_idle
     17.89            -0.4       17.47        perf-profile.children.cycles-pp.common_startup_64
     17.89            -0.4       17.47        perf-profile.children.cycles-pp.cpu_startup_entry
     17.86            -0.4       17.44        perf-profile.children.cycles-pp.do_idle
     17.80            -0.4       17.40        perf-profile.children.cycles-pp.start_secondary
      0.82            -0.3        0.56        perf-profile.children.cycles-pp.asm_sysvec_call_function_single
      0.72            -0.2        0.48        perf-profile.children.cycles-pp.sysvec_call_function_single
      0.68            -0.2        0.45        perf-profile.children.cycles-pp.__sysvec_call_function_single
      0.18            -0.1        0.11 ±  4%  perf-profile.children.cycles-pp.perf_trace_buf_alloc
      0.16 ±  2%      -0.1        0.10 ±  3%  perf-profile.children.cycles-pp.perf_swevent_get_recursion_context
      0.91            -0.0        0.88        perf-profile.children.cycles-pp.do_perf_trace_sched_wakeup_template
      0.20 ±  9%      -0.0        0.17 ± 11%  perf-profile.children.cycles-pp.cmd_record
      0.19 ±  9%      -0.0        0.16 ± 12%  perf-profile.children.cycles-pp.perf_mmap__push
      1.38            -0.0        1.37        perf-profile.children.cycles-pp.ttwu_queue_wakelist
      0.10            -0.0        0.09        perf-profile.children.cycles-pp.native_irq_return_iret
      0.47            +0.0        0.48        perf-profile.children.cycles-pp.__hrtimer_start_range_ns
      0.08            +0.0        0.09        perf-profile.children.cycles-pp.perf_trace_buf_update
      0.69            +0.0        0.70        perf-profile.children.cycles-pp.enqueue_dl_entity
      0.43            +0.0        0.44        perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.21 ±  2%      +0.0        0.23        perf-profile.children.cycles-pp.vruntime_eligible
      0.42            +0.0        0.44        perf-profile.children.cycles-pp.hrtimer_interrupt
      1.76            +0.0        1.78        perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      2.73            +0.0        2.76        perf-profile.children.cycles-pp.update_load_avg
      0.38            +0.0        0.41        perf-profile.children.cycles-pp.perf_tp_event
      0.82            +0.0        0.85        perf-profile.children.cycles-pp.prepare_task_switch
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.mm_cid_get
      3.47            +0.1        3.52        perf-profile.children.cycles-pp.schedule_idle
      5.94            +0.1        6.02        perf-profile.children.cycles-pp._copy_from_iter
     19.48            +0.1       19.58        perf-profile.children.cycles-pp.__clone
      6.20            +0.1        6.29        perf-profile.children.cycles-pp.copy_page_from_iter
      8.08            +0.1        8.18        perf-profile.children.cycles-pp.__gup_longterm_locked
      8.11            +0.1        8.22        perf-profile.children.cycles-pp.pin_user_pages_remote
     11.38            +0.2       11.54        perf-profile.children.cycles-pp.__x64_sys_process_vm_writev
     12.22            +0.2       12.38        perf-profile.children.cycles-pp.process_vm_writev
      6.49            +0.2        6.67        perf-profile.children.cycles-pp.flush_smp_call_function_queue
     35.33            +0.2       35.56        perf-profile.children.cycles-pp.process_vm_rw_single_vec
     37.46            +0.3       37.73        perf-profile.children.cycles-pp.process_vm_rw_core
     38.13            +0.3       38.40        perf-profile.children.cycles-pp.process_vm_rw
     60.45            +0.3       60.78        perf-profile.children.cycles-pp.stress_vm_rw
     75.14            +0.4       75.52        perf-profile.children.cycles-pp.do_syscall_64
     75.35            +0.4       75.73        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      5.67            -0.7        5.00        perf-profile.self.cycles-pp.intel_idle
      0.13 ±  3%      -0.1        0.05        perf-profile.self.cycles-pp.cpuidle_idle_call
      0.16            -0.1        0.09 ±  5%  perf-profile.self.cycles-pp.perf_swevent_get_recursion_context
      0.14            -0.0        0.10 ±  3%  perf-profile.self.cycles-pp.cpuidle_enter_state
      0.25            -0.0        0.21        perf-profile.self.cycles-pp.flush_smp_call_function_queue
      0.10            -0.0        0.09        perf-profile.self.cycles-pp.native_irq_return_iret
      0.28            +0.0        0.29        perf-profile.self.cycles-pp.__kmalloc_noprof
      0.05            +0.0        0.06        perf-profile.self.cycles-pp.ct_kernel_exit_state
      0.22            +0.0        0.23        perf-profile.self.cycles-pp.prepare_to_wait_event
      0.06            +0.0        0.07        perf-profile.self.cycles-pp.rw_verify_area
      0.31            +0.0        0.32        perf-profile.self.cycles-pp.perf_tp_event
      1.74            +0.0        1.76        perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.20 ±  2%      +0.0        0.22 ±  2%  perf-profile.self.cycles-pp.vruntime_eligible
      0.68            +0.0        0.71        perf-profile.self.cycles-pp.prepare_task_switch
      5.87            +0.1        5.96        perf-profile.self.cycles-pp._copy_from_iter
      0.13            +0.4        0.56        perf-profile.self.cycles-pp.do_idle





Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

