Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E115136E17
	for <oe-lkp@lists.linux.dev>; Mon, 20 May 2024 14:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716217000; cv=fail; b=AnZQj2xtK+nXjCZGA6zlHAzuTuW4G+NGekP1juRpIk4Wn1hvmmppkzNAghSq3MQ98xy8xWQ4KEMgwBCzK2za3p/q9wtXm/6LYm411TQJAYPElkcP3a4pRvfWyL819iD3GRBp1IZAmn509e1o1EWzWnqyQB8C/cdsMRdVIFddEqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716217000; c=relaxed/simple;
	bh=0+OdlcYhyVUQF6znOJ0WuPRGHFNvraFRr97wZffDte0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=j7pBkqx5tCHlOY0zKugS3otE3N8qi6p3JBybxy2CAnmxD/2hO76PowuPvp1jUTtPcEDTPG8xPPf5YeDhE1NTFPi3cO9xuMq3HWx80BcD4/gcru0W9uO0zsQQhsUcza3sappBykaFT9m5AMfaHofyfl5ODWdxcztKNE7Bx2wY+mw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fkUJiAmL; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fkUJiAmL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716216999; x=1747752999;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0+OdlcYhyVUQF6znOJ0WuPRGHFNvraFRr97wZffDte0=;
  b=fkUJiAmLVpiP8tIGOfk6rXHdQyK2E1IsgpNejXurmsilwEtzP4Ii8jgW
   w457ZZ+ACRWwx/qFqY5R7Low1rkd9cj2hQVDJa+bUZ2enP9V7BqsFofdd
   oe1OVNi0JeOJmEsnkcCVm4QwJjd+0ACi6/MmfxrbuLwr1eg1Zlo8qvK9j
   r9QPM6d1mACPxoMoPuM89ot2V7cF5I4bMxA/5TZQ+UQEbu8z1tPZ13+8e
   Xb6bBmrEKsN+FB+YMcbxea6t7Bti6Qx7SwlUfqA1T7nMotb4g66pYo8kb
   cv8xtw2qLHq+8VqfpGtQSmgzlyeVGBlUFazqNG60RCPI/QtoEMPx3JkaZ
   A==;
X-CSE-ConnectionGUID: f2sv6MVzTjKVa5Xwk5xdeA==
X-CSE-MsgGUID: +eVB3rnDTr6wWuumTWXTYA==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12146156"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; 
   d="scan'208";a="12146156"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 07:56:38 -0700
X-CSE-ConnectionGUID: CbR12JbTQCihjRkMph1OvA==
X-CSE-MsgGUID: TS6Hn0Z9Trq1kdkuoKA+fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; 
   d="scan'208";a="32593525"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 May 2024 07:56:38 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 May 2024 07:56:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 May 2024 07:56:37 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 20 May 2024 07:56:37 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 20 May 2024 07:56:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mka9R02/90poPKtL3OJy/gxcde6aVVwbngJYGE1n92Cxm+AvYqGb1iCqORayjsX9KF3Ub6G1CEZKAju/X3pPUY+Q/rXdJT9sJ5Bwhq0q756I2pf6JvfknKplb0+tc07wtbnlYCQc4BLcjSE4YXsnFIXTMwi5KRHILkrieXYgK2RfOTgxTyVGdwuhCysMrd7MwfPA6DU7D4MQmXydgvwqMni0QrppWefOJy3I8DKPrQPWpOaZOtJXYYsM2WLAJEsxDcrQlB4/8c1vfRifOIq7Iio43bkjDFZp5dD14zYCWo4yePybnjJe0/TmLhSTWDkLTUyu6KqwvBYmj1/PN4d/Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n+ODRg28yUPU5nF3YAruF7R2HI12iBUn6W0AZkAr6/E=;
 b=Kng8wdTQ+6IxdpExnl7XucKwIQYjTiJgg2jVKiJFZbDyr4YveVmQl5a6HV31a92iDCtRua4a9jINAcaWsKaCW11kE2lw++7O+CayTKOO3XW/eqcNIZ9EJawPYFmeaakJy64Azr+Hfx+1bf/nMCXSwKYOGZpHCQFSHsJ0NfT7N+UsZnCGR6WETAaaEz6T3+thvQMYz0+KT7zByWEzed4tstfsMLlbPvBAjf6ED8nUKlpJ/VlwvVYxmnZUMY4sIo6GIi3PAdFdHEbrsIOiO13TTnE/pa1uRGQ41PiPbJt42mHYI9du6DLeflMRfre5tMj7DF2k36tW5vhEGlMS7BoaaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DM3PR11MB8734.namprd11.prod.outlook.com (2603:10b6:8:1af::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Mon, 20 May
 2024 14:56:35 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%2]) with mapi id 15.20.7587.030; Mon, 20 May 2024
 14:56:35 +0000
Date: Mon, 20 May 2024 22:56:26 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>, =?utf-8?Q?=C5=81ukasz?= Bartosik
	<ukaszb@chromium.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [jimc:dd-shrink-4b] [drm]  4558a76031: canonical_address#:#[##]
Message-ID: <202405202239.f4a4041c-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2P153CA0036.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::23)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DM3PR11MB8734:EE_
X-MS-Office365-Filtering-Correlation-Id: 754d3a90-ccec-43ed-820d-08dc78dd0b03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?McCmd/UjCASqWd6VX0JYzqLUvQygu31O5HGySQ1HxkQGNVuNej2ZjfsOcR+F?=
 =?us-ascii?Q?+XFTniGmUPzCzOKnMz/kIsswHF7Q1yDagQvW7ldgMkph8kK0VFKvOvJw/CJS?=
 =?us-ascii?Q?DMaVU+q72L3a87HXCXBF9yoCWQ7YYgvlWgNy0qPuxIItnX5R63t0bM1o//+y?=
 =?us-ascii?Q?kG9FePXxrYw4qpmjjSNGHE26SFI9CM/RjJ5YIk1hbK82Bm1mAWInzwVr53ow?=
 =?us-ascii?Q?Ig/LjmDK6z4o66I3YY2FgIUqSMzne6ms8yrvoyY95cDMWyTo9Lq3llKIbF5h?=
 =?us-ascii?Q?J9yX4g4kwl2buTZDukz1ZtbH+0BFaGQymRbYnMFluVd2I/QI490pZJ8xNASg?=
 =?us-ascii?Q?+Z/bVh9hiP/8mvZcsnLh4Au/eKPi4hlGcr7O0YBGFGOCfmZMdKvRpcUZTAGE?=
 =?us-ascii?Q?BNtQKmhpZ3e5ZvMm8K9frKJlrAX0e+iYpHc2ldYyZdIJva8hRGBexCuYgN3b?=
 =?us-ascii?Q?GGbbrtdRTJoPq2NTijc0Vu3IlwzLmZwchxOjGGsbngNFgZLDlOI7i1B3dsMT?=
 =?us-ascii?Q?mfF/8iTtVlmYVHEnvAiIrpDiNEdQbNq3Nu82CCW5IcmgLZZeOyG4tfS2IFKb?=
 =?us-ascii?Q?oU/qGBf44LOEmt8rrJnAJqnDWlco6jAdsO0HfgT2cLCDYL/td35ayofkgp1o?=
 =?us-ascii?Q?aS6LO/VJBLcWGoTS91/wJD9s+c7C36JEX6HSDu44dOzpBILO6KO/gFZlnZba?=
 =?us-ascii?Q?7CJ5R6cKFTIXiq52Aj0tvUfQ690BH+VcRq1QaMXzfnKzw2i/qWSfh3utmn/A?=
 =?us-ascii?Q?BX33htFCKpm0xqhN7Rsq2ugPNjFb0Y4WuyJ6olGATS2W3c+A+7Uxdm89pqI1?=
 =?us-ascii?Q?Zx5vqJ93A185FL4JjsnC3xSf0BINQBopXPYepJiLEM5RppUQEdrUQPB96Cjg?=
 =?us-ascii?Q?yzyTxrkNA1xMV4Ztp1GkR2MYr4e7cfVOIhhC51mJ+diQW/w1IkgWNNwVdlvh?=
 =?us-ascii?Q?7uTbhDHkFGK5t7OG9W6rw4wmQFZNhoOQFx1m9WSqsBtuz13NHFSEhCbZNIKB?=
 =?us-ascii?Q?cZBd2oBwXYfUkJOkE21T7+K6e9ZGKRfsbUTitT5uYQilx2PP/QlgYEik1CqC?=
 =?us-ascii?Q?LXVE86AfVHZZpicIrdcDvYRNw7lSI45ktFaTOoi6nK32yyGr4/qSjE4GJyha?=
 =?us-ascii?Q?r7/UpA/yJWmqMseouoO4LQt10dduVBSaXN3khr/hB7+z2kr/AcjFUM6M6SF6?=
 =?us-ascii?Q?Yqog8qc3PuoIezp1fZ65jvCTsJ8sxe4iN1PBy6QIaBqgvR2EAVXxnOOBJUs?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fskxHDKXJO8oJuPGGy8UNK0nmCIbSadhQJk/bxGt3QzVyTWo9K+XbPf+AcXf?=
 =?us-ascii?Q?hi0e7P8Xf0P92g3MeZeopJMvDj22NUXfoACc/Wyix0yDtPD4SvTlWQk3vDYV?=
 =?us-ascii?Q?/9/DAuwakFIU3tZnMXz/QvOqel1v8Xj5LS7I6FiPsTrGU0W4738OPFODbjFQ?=
 =?us-ascii?Q?ymdCs1KUU/lZjxlKc7tA2m70I6Zt4GOE4f/jtU3WfPFiIOmH2M5Dtb4MW5cg?=
 =?us-ascii?Q?3EVTjrfufMGReUVR/by0zx1vx3uxSRf+pC8iaM2aso7Ybo9dAIysNgIBozon?=
 =?us-ascii?Q?Rvaw7eCX8AAr8eGlewAnr7NwiBTIQbNSKtQreG2LnxQIXKZyTeGef7ZiQacy?=
 =?us-ascii?Q?6IyHXTlhrQv0fFgDDfbYseu0TlCtdULibskUmdFWRbI3UGj/3xEmRf7uPl7W?=
 =?us-ascii?Q?cRTCIcQcsFxdv+wsPfeqTjs4xUSEG75z9EUkasueejjsyzubIXcU1Xazba8V?=
 =?us-ascii?Q?NDL7FZoxEaCVmi35cc9ryVwlvpnV3d7E3T9VoafZB6iWUaDl29r2sLsLXRRD?=
 =?us-ascii?Q?t8dZFY+arW+/x8PHEY/8SsBl3Je7hJSbhJ5NI2xZzIaxjBUg4ovVtrMt5cfd?=
 =?us-ascii?Q?Hxg/ZuHz3Qg6ks2IEiM4CMJ5l4U+N/tjlwt9mIsxp3qdOsm5oR2DuJ+9FWqz?=
 =?us-ascii?Q?WayOM2Y0IObhlF6mjgXPFzhc/Pa5sCvDv0YrMNRzojO3B8UNvpKXfRM95+67?=
 =?us-ascii?Q?2xEeMo2RzUGhCgMZJDFOvglPP4rbW1C5Hv/LwGYZZl0/HKybR95DjaQJnXpg?=
 =?us-ascii?Q?BMUBj5HSHlKrTBuHrL2sIt8fkRr328IRDOUcVRVrSJziISx8gpH2lBosqqyX?=
 =?us-ascii?Q?oXTtUr0+/Dpdn8dLavKP0tafKmchSFr48rlqrvEXFN8nrhT4WHFi6zYAEZ/6?=
 =?us-ascii?Q?mqKysqIZhMYvyvkN1FJ4EGnxu9u0/nhW/X2I+R7LWkRFBwTZZy+kuaRYHDfD?=
 =?us-ascii?Q?7RZMO4D22Th+9Jm87BBc2g8D/QGKoUJj208GUFRnM2lcqHMM79SdbY2UEg+k?=
 =?us-ascii?Q?ho3U3yoI8A2vlsVMlIW/vqmNgmFVMWiI+5iaS5bzZuyPlOugldJpYuQdFgzU?=
 =?us-ascii?Q?nR5mtX1k6cACR/tO5Pb50tlD+xJm2lA6MlTZXmYFu1598tILiSR4byFKl7DK?=
 =?us-ascii?Q?74S2duZSK8IK0eevypBAVg3QX6j+ieqe9lNuZAvOHGKGkXOrvjIMguNhLKwL?=
 =?us-ascii?Q?5kDY5f3Elr3QG5ch9Y+5W0dYvemWE6TnNGbN+58tl9h5FPYm7+u7YnsiHHjA?=
 =?us-ascii?Q?K5jMz1iPFrNNG70NoHdncWsiy8k4x2aXQ1SDXKoZJ8ylJodQ3BVLYaHzSV7s?=
 =?us-ascii?Q?YfDdwaykMVIeCA2f8ooPjnWcHf1HuJptJZmZhOoKEQNRcWydzO1sfeqVDmDJ?=
 =?us-ascii?Q?3/tFF4ykj5ucQaNzaygMSMLA2Hf33C+R+ahWC7uJI2Z87LJkMXfvN4LyXUAT?=
 =?us-ascii?Q?Og1di/9+LSUUR4Xr9GJHfUEypzfDyerlmWqXNXl+wqOxkuWoWh+nyar4UwGS?=
 =?us-ascii?Q?ZdxcoiGM3uKgtVSco8C2gKOWNFcJEWWtvukjUZqgKUXxRtggWLGqsGB3TQNl?=
 =?us-ascii?Q?DZUCW9JaGo3TCMktw9oL2jECbBnUHIiK2H+E+p5PhzgOVn9ELhK9WzGG/Yqg?=
 =?us-ascii?Q?gQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 754d3a90-ccec-43ed-820d-08dc78dd0b03
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 14:56:35.0513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M3VKmF8n5MSthKVEFF/jOmFTqEjwXehdsm7dexR1x0Q2G7CFEII6GbVmZpfCZ94P8n1V8Y3xf9IT0eFhoPvYoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8734
X-OriginatorOrg: intel.com


hi, Jim Cromie,

we noticed this commit mentions "Time for some quality CI".

in our builds, with this commit, there is below config diff comparing to parent

@@ -3809,6 +3809,7 @@ CONFIG_CHARLCD_BL_FLASH=y
 CONFIG_DRM=y
 CONFIG_DRM_MIPI_DSI=y
 CONFIG_DRM_DEBUG_MM=y
+CONFIG_DRM_USE_DYNAMIC_DEBUG=y
 CONFIG_DRM_KMS_HELPER=y
 CONFIG_DRM_FBDEV_EMULATION=y
 CONFIG_DRM_FBDEV_OVERALLOC=100

seems this is expected, however, our tests crashed very early in this vm boot
test. just FYI.


Hello,

kernel test robot noticed "canonical_address#:#[##]" on:

commit: 4558a76031a9eeb67145f098930ab93ad66915e3 ("drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN")
https://github.com/jimc/linux.git dd-shrink-4b

in testcase: boot

compiler: gcc-8
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+------------------------------------------------+------------+------------+
|                                                | 4b46e0eb84 | 4558a76031 |
+------------------------------------------------+------------+------------+
| canonical_address#:#[##]                       | 0          | 5          |
| KASAN:null-ptr-deref_in_range[#-#]             | 0          | 5          |
| RIP:strcmp                                     | 0          | 5          |
| Kernel_panic-not_syncing:Fatal_exception       | 0          | 5          |
+------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202405202239.f4a4041c-oliver.sang@intel.com


[    2.369822][    T1] Performance Events: unsupported p6 CPU model 42 no PMU driver, software events only.
[    2.371877][    T1] signal: max sigframe size: 1776
[    2.374336][    T1] rcu: Hierarchical SRCU implementation.
[    2.375469][    T1] rcu: 	Max phase no-delay instances is 1000.
[    2.379182][   T14] Callback from call_rcu_tasks_trace() invoked.
[    2.404850][    T1] general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] PREEMPT SMP KASAN
[    2.405774][    T1] KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
[    2.405774][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.9.0-rc7-00032-g4558a76031a9 #1 b53ab647344fd548777e89e94e688e5f78e75cb7
[    2.405774][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 2.405774][ T1] RIP: 0010:strcmp (kbuild/src/consumer/lib/string.c:265) 
[ 2.405774][ T1] Code: 83 ec 08 49 bd 00 00 00 00 00 fc ff df eb 0a 48 89 ef 84 db 74 5a 4c 89 e6 48 89 f8 48 89 fa 48 8d 6f 01 48 c1 e8 03 83 e2 07 <42> 0f b6 04 28 38 d0 7f 04 84 c0 75 50 48 89 f0 48 89 f2 0f b6 5d
All code
========
   0:	83 ec 08             	sub    $0x8,%esp
   3:	49 bd 00 00 00 00 00 	movabs $0xdffffc0000000000,%r13
   a:	fc ff df 
   d:	eb 0a                	jmp    0x19
   f:	48 89 ef             	mov    %rbp,%rdi
  12:	84 db                	test   %bl,%bl
  14:	74 5a                	je     0x70
  16:	4c 89 e6             	mov    %r12,%rsi
  19:	48 89 f8             	mov    %rdi,%rax
  1c:	48 89 fa             	mov    %rdi,%rdx
  1f:	48 8d 6f 01          	lea    0x1(%rdi),%rbp
  23:	48 c1 e8 03          	shr    $0x3,%rax
  27:	83 e2 07             	and    $0x7,%edx
  2a:*	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax		<-- trapping instruction
  2f:	38 d0                	cmp    %dl,%al
  31:	7f 04                	jg     0x37
  33:	84 c0                	test   %al,%al
  35:	75 50                	jne    0x87
  37:	48 89 f0             	mov    %rsi,%rax
  3a:	48 89 f2             	mov    %rsi,%rdx
  3d:	0f                   	.byte 0xf
  3e:	b6 5d                	mov    $0x5d,%dh

Code starting with the faulting instruction
===========================================
   0:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
   5:	38 d0                	cmp    %dl,%al
   7:	7f 04                	jg     0xd
   9:	84 c0                	test   %al,%al
   b:	75 50                	jne    0x5d
   d:	48 89 f0             	mov    %rsi,%rax
  10:	48 89 f2             	mov    %rsi,%rdx
  13:	0f                   	.byte 0xf
  14:	b6 5d                	mov    $0x5d,%dh
[    2.405774][    T1] RSP: 0000:ffff888100a37c50 EFLAGS: 00010246
[    2.405774][    T1] RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffffffff81501477
[    2.405774][    T1] RDX: 0000000000000000 RSI: ffffffff84755280 RDI: 0000000000000000
[    2.405774][    T1] RBP: 0000000000000001 R08: 0000000000000001 R09: 000000009999999b
[    2.405774][    T1] R10: fffffbfff0c356d8 R11: ffffffff861ab6c7 R12: ffffffff86191610
[    2.405774][    T1] R13: dffffc0000000000 R14: 0000000000000000 R15: ffff888100a37d74
[    2.405774][    T1] FS:  0000000000000000(0000) GS:ffff8883af000000(0000) knlGS:0000000000000000
[    2.405774][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    2.405774][    T1] CR2: ffff88843ffff000 CR3: 00000000050ed000 CR4: 00000000000406f0
[    2.405774][    T1] Call Trace:
[    2.405774][    T1]  <TASK>
[ 2.405774][ T1] ? show_regs (kbuild/src/consumer/arch/x86/kernel/dumpstack.c:479) 
[ 2.405774][ T1] ? __die_body (kbuild/src/consumer/arch/x86/kernel/dumpstack.c:421) 
[ 2.405774][ T1] ? die_addr (kbuild/src/consumer/arch/x86/kernel/dumpstack.c:461) 
[ 2.405774][ T1] ? exc_general_protection (kbuild/src/consumer/arch/x86/kernel/traps.c:702 kbuild/src/consumer/arch/x86/kernel/traps.c:644) 


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240520/202405202239.f4a4041c-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

