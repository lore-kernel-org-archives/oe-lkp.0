Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036AC197A8F
	for <oe-lkp@lists.linux.dev>; Fri, 20 Dec 2024 09:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734685364; cv=fail; b=BRUOVmHkcb570bojETnSdSmSFwbs6gjTw9ESFWrMJeID70aUyk8yV8G9hG8WdufkkU+sAxEtyUtZ4PyPjHsCVNUFzhrFoVBAm8MpAwNEsdQYb1enE3wUIEoNzsbOegOnWUFaFJw0UZ4zdEq360XC6wCA2bGGWM/YnOObWQ9mfJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734685364; c=relaxed/simple;
	bh=fPxihXAMcrp0tS4k7okuszsCc2kwNvjejlOXfehDMZc=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=WgN9QejV3XRQz1R1kiHBSMzNCGwh/s/T/sKYn+ury8DrvcTb8bGaBa+Usv28GCofd+OZTLCIGLgSQ5C+PnBSSIala9wTz2+nL3dK/lRMrsj6qCr5i65HOGq6LeMpWKvSId54hi4MRS+ENhhuooqjSKNeCoPxd05UUpDQlD/gAPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aLGBJ0Z9; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aLGBJ0Z9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734685363; x=1766221363;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fPxihXAMcrp0tS4k7okuszsCc2kwNvjejlOXfehDMZc=;
  b=aLGBJ0Z9OTOi9zD+MuLEDCqdJ+tVw6uWVcHJB1LouKLpjHNzZuWhcItZ
   m5D4SIBjMnGeNB14edy4aEjXXddxMRDLflDXwSoelqHhMecbL2BgImx9/
   gaf6TofGkQCfCu4r5bDw+3jzEwixx/0zgEvqc367s5u1jEnVt87GpZk3E
   KE0sWgu+icnTj9CKA3ByUTRr5skFqdHBBW1PjK6ekZc3jv5U7QnXTKgS3
   OAhot6SM9TIu8aZ7GuuVaqlcOmp8XtCMWLBttfr5oydwse2xwaqB/Bf8u
   Q8omGYvV/kFo1q0Ev069Icb5YOwz/ncWh0ENGHWxE+0y2ZPAciLpRLJG8
   g==;
X-CSE-ConnectionGUID: 1J5KPX4cReGEyurXN93VSQ==
X-CSE-MsgGUID: /v9lfUVfT3WkF0bvaEQV/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="45833431"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="45833431"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 01:02:41 -0800
X-CSE-ConnectionGUID: yCPKxQLtRA2tnptcHNEnlQ==
X-CSE-MsgGUID: o2OyBsXsRv2mj/itpX8kmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="98287633"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Dec 2024 01:02:41 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 20 Dec 2024 01:02:40 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 20 Dec 2024 01:02:40 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 20 Dec 2024 01:02:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UFh9NFxsmJ4opuX5ZhVcJd6hIDI5X4s6Ni3kcxPvoaVJsWfTsVPTGbkzVirgaS25U+rH14MjkjAEpNRNU17tV3QMBHiF3qihlHUyuzmcFo9Su6CJao7D1q5zk5mS5CU1Lct8giW9FLm32UqFZa7NOyCUtynXVg4TJr1vVVsx2VJ/jFy69RDb8AOSiVIDq7lTWjM8zsCuZaH3y7JSleHp5oxbf5BUiBKbXvznW/o1nv7Kkqt4XOs1xhYg0ASJNczMIFQd+k2Ev0zf6bAwYKclVQ4YJIKdefRY0AQVOqu0YEEGS/i1Gs4AIoO99nOX8M649eedIBmp1znr3OSvqHBnTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W3sUmXcyopmeGCUInBfwLqzagGciAEQeiL/WXda9WNo=;
 b=Qt3zcMJXKak530iLUg+LuWOGhVJsRiYmYJaOcdyVCNKJy/VnPKUq6HqVExvoQkZMaOSaLRmo44mFSvSxYGzgNXP1Whl/TU+3tr+GYgKz+nx+ijqrT/hEup4e5NcfEvLy4Vf1eOOyoS+iSRV0Gtoqjhu34hvhzCtiLYCnXg35bqdYCus4JB+p8Ns6lFJyjeRu1Yh/CbgBiPXIgrm/jcpPVG/IrSe69yrq1Z3sv16n0QO+OEkDhKpV1BuUQ1oFOLbuR2CN2s8xMIOcSxDvQF5gUUOz6PhLHR+gzb3iWYFqMq9cx3+L7cNdlQsY9TnQnjeqgCAiy/0AVQrGdenwFTySkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SA1PR11MB5876.namprd11.prod.outlook.com (2603:10b6:806:22a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Fri, 20 Dec
 2024 09:02:37 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%6]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 09:02:37 +0000
Date: Fri, 20 Dec 2024 17:02:29 +0800
From: kernel test robot <oliver.sang@intel.com>
To: <linux+lkp@weissschuh.net>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [thomas-weissschuh:b4/sysfs-const-bin_attr-module] [module]
 086a6acebc: BUG_kmalloc-#(Not_tainted):Object_already_free
Message-ID: <202412201645.a05690bc-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR01CA0041.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::15) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SA1PR11MB5876:EE_
X-MS-Office365-Filtering-Correlation-Id: c91d70f8-147a-4479-023c-08dd20d50d08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VPGztELQ5EBn8sPFIQfvzoqgjx5D7xl4PaBeIuewiLA/ZBdaGeVeeJ06DKLu?=
 =?us-ascii?Q?hqd35/fr1cPFFpgtTAQsjOktMRkfhnqpDMnf3KPAoHpLeKGf0nlqVt9p8ROK?=
 =?us-ascii?Q?rYxWznY0MPWbP4fQXXBoz7Hp9mIAf6ZxLlWyt+kp+gW1MYeFVCjnpgmeoDpq?=
 =?us-ascii?Q?5tWYtsKb5YMh/oXYiU+9zhCjjQonIMrI8rVoxfdDsxQVv/z0KtDIxlpl10/H?=
 =?us-ascii?Q?Aa36d/146bzcOXiS/xjqV7xmmIWCdmE6BcaS+4eDotCxjxIL9U7t2xWiqnm/?=
 =?us-ascii?Q?5JM/+DH4aL2tAeZ27AdbTLNjUzgUFqLcoO8KkOxoQqMvPKD8vbM2qQDoieMJ?=
 =?us-ascii?Q?quvmiv22r6pXJoWkvEf07vRY9gmiInxF3mVLNsQiiYOTIRu+F00E0pXHWy5B?=
 =?us-ascii?Q?G7nWoOn1bsFbzOW0yr/UzqtA2YcrHdqwMCmYYYSzddqLlEtzt0SxFmqjukeX?=
 =?us-ascii?Q?cH/Qj4J0Q7hglNIk6eXcoXUrMgIW7uHAV03jrLBHQG3Avs0IT1sARgxpoj+F?=
 =?us-ascii?Q?GWCDoC9v3GqraErrhf1cNgQyxyNNw7d+BCfuSNdz2V0QDdlqj0wXM3msLZGz?=
 =?us-ascii?Q?kZESK7HqtWJ7ahsr7V/NvRELCj9x34S0vCes2jEIZ+aofh4G8HWXjOQBSs3Y?=
 =?us-ascii?Q?9UhOIYJqi+5143upZrlyE6FsYCqGh4nzeHIW8VeBqJ/udxwoSFJpC7o+zRfA?=
 =?us-ascii?Q?KY9kzBKii18zYWIhRQbp/DQdWeLUyxVbu+3Aum1s7mY4UyyKyo3CnKe/4sfF?=
 =?us-ascii?Q?TycTkO6Zk1Y5cCdyYZJJJNr9A2Aks0ZDK5ueH85YxmldAPrFZJ+STYmMtM5o?=
 =?us-ascii?Q?V7+Pcrs0ZJuvli2zT0PFqY+vFFVSVsO7OqXffrYLtL0IL7JX4VEocbz3kD7y?=
 =?us-ascii?Q?0lADJTVbsBbZ4a1i+wlMahOquE+iA9MOP02+e6r59RZv2Y7HKbobpHlzBhpg?=
 =?us-ascii?Q?9VDwQD6f3uyFTIwK5G8L0iLVuV5cdRABBM3vRm7BY8YkQhnnowAlCli5085I?=
 =?us-ascii?Q?14YsB+hPUNZ7GO49S/hK6KK5ULgDhT4ESnofu0biBLPSYjuHF3FH9kJfrRiw?=
 =?us-ascii?Q?7cFo42tSNZ8sp1HoK2SDqWX8BjD9AYRAubt2w/E2R6YD7mlW4Mu8f4GA3dlf?=
 =?us-ascii?Q?Y54ZEd8CkSzk5Zhk9LYxXKbJE2Gm2CT6i7oiULw2Igg6HucaarTf4RL6ax//?=
 =?us-ascii?Q?cBmeeNtV9WTQ+k2bTPIlo0a5FHcZhJSWQA8fCupflmY7pu+iTns846OhfgTu?=
 =?us-ascii?Q?LcyyE3qF0qdgNBiukIxtsPw/61NK6sRgFNJ6OrInNBMsef1sU7F1oO5ZnSJY?=
 =?us-ascii?Q?3WiCMvxtsrCbZs0Gm05BNTPh+Ye/ZsnzJSB3XDAFU20EiQyduDlTuvL8PhBF?=
 =?us-ascii?Q?mMWmkVkZvTFik0oHw1jI4I2O/eWaZF0tRJduR/qHZaADxor+2w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?C8LrDxxShsezvNMUe6vwQ2jxjBn8O99Lu6giNnWo2ZL5FSDgnYRvJqa5AymA?=
 =?us-ascii?Q?/Is8qSJfzIhjRhiXVAHijpY1h/76RV23CiFUvDk1+4YaskBH/AJVd5ZeNjP0?=
 =?us-ascii?Q?whrCOLQjckNTTZ5GfFG90pgIesRCjrn2FSdN1a+Dlq9drG0QeECjoOK3KiG1?=
 =?us-ascii?Q?77Luy8ZhNAOjNOXjkQ42v6GVnc0Fk4H1+Ofiz+mBIwN88qTMh/PABr19Z5zU?=
 =?us-ascii?Q?CDdeTlc/ei9S6SKdgzo6ZWnKXkOq1x8MtX2Eoykzb1hQUcxKNZnziQwd8+EO?=
 =?us-ascii?Q?gmWIkFB/tR5ygBiRsyUbV1VmxWGoIO/YKyQI0JERUr2TKJleAiz+JjnIzlYX?=
 =?us-ascii?Q?c0KwDLglTJeV6uiYVnCW6OpAq5wrLkxddKuWrEIriOCchXogTQtZ0qXs/Ios?=
 =?us-ascii?Q?6D1aYAs1L0n9IRCISqLy1DBjw2fNsggk1Yy76lEBMGQnvcrNztdrLag85jbK?=
 =?us-ascii?Q?X2igXXH+5TYaDfo3kFLnna4Y2KvXkqOZVgJA4MWlZLCe9ypffEgu8QvG/RwN?=
 =?us-ascii?Q?rSwc4V4DwsnpiBCO9N8+q4BFRj6QrpEyf3Be3YdmuiYjFMIzywSWxD235wIi?=
 =?us-ascii?Q?LDxIT7wu9ZyM/PrbDqJvz+6hRWSGkhWYwE7937AJMGt1AoG3Pr016fHdFewT?=
 =?us-ascii?Q?ITLJlj3UbOsV3j0zlBEmGf6e5ldaPXFgea3VlezPpdnh4SCeyZO1xSZGzVST?=
 =?us-ascii?Q?wztEhnbGa8STj1zcP5CMmn/umAQH6qwB7iC3kyp2AWC+wyM6/M8oakAaYb25?=
 =?us-ascii?Q?5SJ8cvf/VHMpQVlZlC4DQ9c6Tot1vajquqxgc8VreFUAgroYzudHkV0r8o6d?=
 =?us-ascii?Q?sKnXMxQ9v69WGzUPz9a5cMUG3lKWHNBIhNgdLG4N4WYyUlP1egAvt0tU04Gx?=
 =?us-ascii?Q?s/Dm89mf1kylp3nT9cRAPsZd6Z9nRU7FUd0GGmU2G4kGVlgrS5TWVn+BfsSO?=
 =?us-ascii?Q?bC4DEbv/fRsFedn635BioQF3gO07CbMnrDTBxzo08T1h2Zl+YiDB02T3i2g2?=
 =?us-ascii?Q?qCld+kHmG0lAWypUBlw4UWq3SOj4TM2MhuwnK/wANVbUt4bCQVRBS2UWaEqM?=
 =?us-ascii?Q?q2u02eimpN6ekZw4y9SE1m+0xSF+2cYmi8MatCdxBeFfUL5D+6PzkkKJofhq?=
 =?us-ascii?Q?js1egu09YEahdV9iHhsXZg0La9Pn2Z/gUNQF6qcS0pRvRFmacDPib2nCPzIo?=
 =?us-ascii?Q?LXMMzqtGqO4DKps7V3v49vF57yycr/CDwRSGtiw5TccMg9sg1ie/rpV89FIr?=
 =?us-ascii?Q?8mMGrgi/ap4cPxcwd129P8ozsoBxFTxJ5CwUAKliNkf0X9VsYiqGTweGZmm8?=
 =?us-ascii?Q?jUo1hrSXeodrnTEWvc3J7lImmzLW3jMew21uTOz6WOrdSTLPaDsoryxMx1n9?=
 =?us-ascii?Q?RYYu97pM3udI9yxwIXva6KD+TyPpy5sMghifyX2GT4Vs9urIv+m+gZqmA4Bo?=
 =?us-ascii?Q?QvTuaqlfJs3KpuPyG/LorP8+Z7bkEZLi1s3qlN1rW7P0/FAw+3n4JHIXVTlD?=
 =?us-ascii?Q?elgReJ2KQPAhyzdvCwMzUETIrMSQeaP7rHKkd0nmgscx0mED5kBM4cpvoNxY?=
 =?us-ascii?Q?g9QbVb0Ygqi39OmbD7vNJYBulVnUGZd3Few9Nh6HNCy/msabam8Q35yewkQh?=
 =?us-ascii?Q?/Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c91d70f8-147a-4479-023c-08dd20d50d08
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 09:02:37.8424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9tXgKllAnjQR8Y63HsbrpTHGjvDF/F/cDdkp85MHUa+TyGotyt0vxTCydq4sD3AwExZXIxbNLj96zMYhiAqe+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5876
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG_kmalloc-#(Not_tainted):Object_already_free" on:

commit: 086a6acebc29978a745fe6b0bbeb73b35eabadf0 ("module: sysfs: Allocate notes attribute without kobject")
https://git.kernel.org/cgit/linux/kernel/git/thomas.weissschuh/linux.git b4/sysfs-const-bin_attr-module

in testcase: boot

config: i386-randconfig-054-20241216
compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+------------------------------------------------+------------+------------+
|                                                | d7b957196a | 086a6acebc |
+------------------------------------------------+------------+------------+
| BUG_kmalloc-#(Not_tainted):Object_already_free | 0          | 6          |
| BUG_kmalloc-#:Object_already_free              | 0          | 6          |
+------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202412201645.a05690bc-lkp@intel.com


Starting Raise network interfaces...
Starting LSB: Load kernel image with kexec...
[   19.154097][  T173] ipmi_si: IPMI System Interface driver
[   19.161000][  T173] ipmi_si: Unable to find any System Interface(s)
[   19.187407][  T173] =============================================================================
[   19.187521][  T173] BUG kmalloc-32 (Not tainted): Object already free
[   19.187525][  T173] -----------------------------------------------------------------------------
[   19.187525][  T173]
[ 19.187527][ T173] Allocated in add_sect_attrs+0xea/0x1c0 age=14 cpu=0 pid=173
[ 19.187538][ T173] kstrdup (kbuild/src/consumer/mm/util.c:61 kbuild/src/consumer/mm/util.c:81)
[ 19.187542][ T173] add_sect_attrs (kbuild/src/consumer/kernel/module/sysfs.c:106)


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241220/202412201645.a05690bc-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

