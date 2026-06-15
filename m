Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936C63F8EBE
	for <oe-lkp@lists.linux.dev>; Mon, 15 Jun 2026 14:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781533001; cv=fail; b=kN91nPOu5eT+NxGiKgRmABhe3CnbwrnUYfQMfECKhVRyJKiEVEMrU2OEDgrL1ar2KGwi8N9RhgN/IyJyDO+HDOC7R1fXnyX4D1kcW1boF80yw16PUgWgsRAlN2NPb1dgQJ4xPSVENh8lT5iqFs+fVQ09QOZgAAj2ExCVhmsCwHs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781533001; c=relaxed/simple;
	bh=YWIJB9VzZqP5K++u/7dEMpYjKOqP8Pvktz8dOkLKrQc=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=MhogQgy8GTsqkf2wGneB+rAO8yDIg+9Qq8RkPIJFogeDmljtpLWjJnHZXioOuoARh5HgSwUv/QlI7paQvgV6U5yd9iDxfTIgbGVq7AxrDvS/Zsr+qXYM6K+bKnDhBz1GKn2cehAAK1IvBboA7+xw451T3PecLiuZbGOoI2LTQ1g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YqR3p+gE; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YqR3p+gE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781532996; x=1813068996;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YWIJB9VzZqP5K++u/7dEMpYjKOqP8Pvktz8dOkLKrQc=;
  b=YqR3p+gE8IUmUQAd0Qo86h5awRO3w44fbVi9tgwhPCuPr5rkahrM+DVb
   qK+G7NjhLRUsa7+gKPqhK0KaOOJAVJMOLap4woQ31tMXA2u/D+kB7Pva9
   4jnjn5Xy+Cb2acYXiJthP0B7NHb6LRmmI6xU6VLa2v2+w6TJaQ1o1cnEu
   wK5pxq50xYnw7Z/5yLpIJFT9HdNObcrsyeO+OOuxTfKF0jcfQ/Ruvk3R3
   ls15V07wd5Ee5XHiscB40gk9uPXqT27dmpExVYQuoNCYccYgMhTQhuioc
   WLOC9bmAnFAYF/V3TnxVyU5+7Pf3PQ+SJz/u4PErpQFlgj2KyzojYZnsF
   A==;
X-CSE-ConnectionGUID: aSb+DY0hQW+YqEEHHu+2/Q==
X-CSE-MsgGUID: u3/wRAeKSUGClSSmfq9e4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82466441"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="82466441"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 07:16:36 -0700
X-CSE-ConnectionGUID: +cMPtbOMSpCBRc4mzxm8mw==
X-CSE-MsgGUID: VfIp2SH6ScS+ZMxrRNO3iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="246583069"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 07:16:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 15 Jun 2026 07:16:35 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 15 Jun 2026 07:16:35 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.22) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 15 Jun 2026 07:16:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GD7DybDvKGXzy0tbJq/RzHcdwz0BoP10TlnIylZAIjwN2ApK/U9fgz8Q2QAaZCnlJ9kKOS9PcnqIvcM4+B1rnic5G9ddaelJGP54PPF5cAWth/D5D0xQAaf94H86RcO9fTQwMahKfIFIruKyMl7FVWUSkUh96/0dQ/7vTPUQaUrIXUlweqkfVcQFRQPqje0kIChQapbFP2F9AA79rYiZiv+fXxw0MlXpH+h8C9okszvYKvkSOVxEpN2m9SeA7sRkXhz8g1S+IdgekElLa27fb1cPRGIAj4DSUZ9RnENlXqAK3fKi1prh1UIQmZVwhQrP4JLIEEx/sX97Qje+VsPRkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tKjudHM3ZmN1vX0qQlehKs2x6Gj/BYilh1JgtHIMR8A=;
 b=D4S8YsnKr2Qlvh8+MPvJy6TqtwdJt1OY6pjFp8ChJ/Cc+RA96zYHKve6sltuAjCFr/lKmQxXWJEg6zI0WZB0IlRW+yc7pB5dGTA0Ask/nM/JlAARf3k+7l4jrwlfr9MZP4+OdHnfOtJ3L1ToovCzhhLy4aaedhc4rxa1aku9fIxkNpkmgyDJXex7QUFOEWjKsXv9U9vSxIKBgc3lsyVdD1zsYagvsqgavyp+xXA/ehBGlUYvYygc9xhvOnpcrim8oZa5MfikUbXVY8hY8UibgrdC4sKuYwf6Tk6Pm8py+Bssd/td/OT2Rj8u3ZhMS9R7EP9LTK+oDKM54NzO6KDhvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by SA1PR11MB6846.namprd11.prod.outlook.com (2603:10b6:806:2b0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 14:16:32 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%5]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 14:16:32 +0000
Date: Mon, 15 Jun 2026 22:16:24 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>, =?utf-8?Q?=C5=81ukasz?= Bartosik
	<ukaszb@chromium.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [jimc:wk-merge] [dyndbg]  d718f31771:
 BUG:kernel_NULL_pointer_dereference,address
Message-ID: <202606152239.7c9bee0c-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: TPYP295CA0014.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:9::20) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|SA1PR11MB6846:EE_
X-MS-Office365-Filtering-Correlation-Id: 07a0d0d2-7f7b-4468-90af-08decae8b301
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|56012099006|3023799007|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: eFBo8joNxx7JOLBlleJxL4VJj2NHaS1Wur8OzrMdupwQfH0oUfmBAtcDLg980qbN//Vq88q/D7bl01sPttZLqsWZLLNwOGlpuzagF66BMwZ70oW79ToBvrj0ZSpcx9e4D+1HpUxtp1Qs0YrHW2ZS9vVE+HtGLBp97FmcurTKijbUrGaAVxvlxM8emuZT7DdEpEeEdwOQTM8geIdZIA1guGnRYbG0V32PKWp/gU3L0loD0w1Gqg2rP6ehgr4Jv6ZumHd0cnPaAjVVF94TfcFf7YYjKz+/cHK7eCThqLRVQTPAVm7ponwjodAIgRlFdALNofGPae0q7UztzgTshWER2ej4/xZPfV0yuPhp6Fbo9SZJ0fKW+bccR6qAeibG7fvLl5wTWbdYAqwCld6xsR8611GZgG/7+MHHEn0JLscFE7DWatKCgNndeGuS/ldtFyCkL/nX6Fyiqb8aEgdPgZuW/BOnYZ+X6TKvt6b1QFbW0IP/iSLnlnkgsK89D43cYuk+H2UChY26yUPzXb9b4q65eUmtlhb6/V3BSKDbejxZ5WTLA7CdEE83fvrZKfIT/3TSj9Wz/rAuk0j6jZc83pl4szDO19aJzAv7yf/Hc6tXvUoziek8shiqZJ29wqOUDYA0+7cX7qlRVAC8N6uvHxwOMhm2Yj8vikfa2RT96TzQ9jH33duB5NCCHPWbTp4fZYuGJLK4x7vpuEymR5fLCsExjw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(3023799007)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?03eKaYaFk/BJNAbLU4RwAs63qyjBJDUVwwb59WfuhKfeXXilH4H5NOx6uOuX?=
 =?us-ascii?Q?/FNjxCOplK7dkXL6SyQvVL0xEkfo1Zn1dMcblGBUXqGoOqFjGsqqAh7eQZcr?=
 =?us-ascii?Q?w+9la5RfCFcauEb9ZAK3Y1/38uFG/tGlq6PrRJ1QI1MaEh97oMvJF/psQxN5?=
 =?us-ascii?Q?wkbV8t3oStKwjK51NcNnayHwbxLMsqSY5roEPfZRU/0Gsk5aZQT7dCl/s/11?=
 =?us-ascii?Q?CqX4xUbUpkLVcS9sSVldFN/uUH1WjVYSPUawDYL7kp6AZTd7RuKFY7sPyiAd?=
 =?us-ascii?Q?3L/h9Ww4udkhlTdZsKRWhYcXUWoNNoDppM9Ero03ehtwI+XvKNqaLQbG+bKk?=
 =?us-ascii?Q?BXm+/9STtU3MhJ7D4/c0xj5Qc6P/Oq5yGUAxScK16km7L+AFdsPl0EDdApjn?=
 =?us-ascii?Q?t9VjofcOfOsfU+f/+3fr/N6P5d0iz/VGGTl5Yqd5Ks+kMk3KamIoaN96h5ki?=
 =?us-ascii?Q?4hUd4tGCkWliN2FQYqfDsmHvZgit2F5rEDRprytUOsk1hzVAkalcved1ny8m?=
 =?us-ascii?Q?Tls+EVYxXoUjwDcDCVRwTMT+VYIb/EcBFMPqcADu7sCFddJrVuHdNWhl1M2D?=
 =?us-ascii?Q?VjY8ot4WRxNt1Jxy6vAY4s7zLyE5jEuNPH+ohdOuvy8P38ONwfkXptjyYCDu?=
 =?us-ascii?Q?3j33WJ4ezkzSoi+ds8I0QS5aLf/NdGQJo8nEYTW97qBJek1SYnGnns8r2iy3?=
 =?us-ascii?Q?tciZ+3Ielg8pVB1OT6Wga2GI8evIkm6pgerIVMH4+KxLfXaLrVB/RMfJJyF4?=
 =?us-ascii?Q?Wzao8y6/ZKDCQmjEGWCwYa3YhZfPo9thPiGU7cc7+fexu9DovvKEAlN7vOjs?=
 =?us-ascii?Q?40tj0s8VzdJQaD57W6tHVeGYeJLwcs5bdxUyRxhZ17g7yD6sOxJDkx7z2K8A?=
 =?us-ascii?Q?nR3Ld7/xHwgpxXnY/EvqZr2Irtyd2aAacKe/0zYbCk4t0WIHrdU+K3QqOTjf?=
 =?us-ascii?Q?ClpW8aGDyE4wfFVr/MSjUvGApyiOAIZalVurcVZWjOQ/8Yl+MbCd+r6aXI38?=
 =?us-ascii?Q?ylWATyepw+In2ZY1DReqUSv7/SGF6WqdCoYDfP6wTXtHMsAkkMPYAqzdsWX6?=
 =?us-ascii?Q?p7lb3pk6oz/adf/pgf0JHrJ1Pf3VMprEPbtyaBNu4fhl70m+rMhlYToaWRYy?=
 =?us-ascii?Q?Z8FQiASZIaU1ANEEWR6uqgngI5z/JcU5rF2SfVmeAgtqP7na2zBdOprgF+kq?=
 =?us-ascii?Q?Tj4Oeq3nRrGXRRivFHK3k1fk8IytxFx5gj0ZdbG+UE65pVOAV53cAmpo4RC8?=
 =?us-ascii?Q?pfBqavgX+dK7LiFWGDk3tYbUr+eVLxzcBWRYTiVFGLUVGy0jA50QT1e28jFY?=
 =?us-ascii?Q?3ic0QUfaeZX+XhrP1jGb9hQpKvOIDNhlm5ZFzR/k9KIMArMxOi9IoJu5n4Kf?=
 =?us-ascii?Q?VaXAun3ZigoX3KBRsoslOgN0IjaXLE7gcI3LCrvSkvMZJVlH8vj3Nqb7QD6/?=
 =?us-ascii?Q?CuDr1KZNFyZ3k1Hq+JjqaqmAn/gU3HwdZefRK3b1pYsKCitSTBvSS7Alm4W7?=
 =?us-ascii?Q?jjt1bU5Bq40RyOTunH5rg5/Q1hd1dRSf2ga28b4Tcfuu9LynaiiySiBKLJDT?=
 =?us-ascii?Q?D+30AhMiU7N1VHLdv72EsTPfxg+/KeKwBBBK+CGc0K6sc2PwQ/FlzVwH8z2I?=
 =?us-ascii?Q?L/EUubdq6a8ltv2n4PF6UoqRTFldflMz6JAxYWOdBCyQyfXUmVPhu+H3YK4H?=
 =?us-ascii?Q?+Kj3TUauYlE5paL39EjO6Tr6bMqvzDsSRm5eKg1xMithVwwoMvIpG4LNLsm3?=
 =?us-ascii?Q?B0xBEa4I7w=3D=3D?=
X-Exchange-RoutingPolicyChecked: QUnzpLRUAc5XOmid7xGUKBW45ERrjRxlSTt1sBRDm+olhWXfy0YiegJNbYqtc9hWa8l3J5B+MsyqshWhpAO4o/qUDijYgFUmMCQZwgGrv3YMherYF4g8Da857EN+f1wFdOu+ObjTs4AEEvS88+7pAu0L2SL8bMFE/EW8ZMEMHWGB2T6rSB+H/T9pO6c5Tm1aPciBqSIPvaxMQaWG1NuT1DwdAZbi0hwwvTUGn9dtI1IH7XortV/pO9ON0YHHar6Mf1FmqBYZRDIgseTAkMQobfjg5ukGlp/pO1fnDIadwqQjTAW6ZAQ62qjKTHDvQ0+S+u3j/igrjE1XM/asZ2HwHw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 07a0d0d2-7f7b-4468-90af-08decae8b301
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 14:16:32.1956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lUxsqybdLpfLyXU8qsYOph5g3WTmd3qqEBfS5qRMhdE8HhPk40tTRzZVC9Yqg+VMlUqExq3y/ROJ/jSUDO2Y3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6846
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,address" on:

commit: d718f3177198f6703c60bd009f5685f5eabd5db1 ("dyndbg: consolidate site ranges")
https://github.com/jimc/linux.git wk-merge

in testcase: boot

config: i386-randconfig-016-20260614
compiler: clang-22
test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202606152239.7c9bee0c-lkp@intel.com



[   26.968728][   T76] BUG: kernel NULL pointer dereference, address: 00000000
[   26.970219][   T76] #PF: supervisor read access in kernel mode
[   26.971419][   T76] #PF: error_code(0x0000) - not-present page
[   26.972635][   T76] *pde = 00000000
[   26.973405][   T76] Oops: Oops: 0000 [#1]
[   26.974262][   T76] CPU: 0 UID: 0 PID: 76 Comm: modprobe Tainted: G        W           7.1.0-rc7+ #1 PREEMPT(lazy)  c6420a15eeaf166da8d1dae05d67320060b21950
[   26.977057][   T76] Tainted: [W]=WARN
[   26.977839][   T76] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[   26.979974][   T76] EIP: strcmp (x86/lib/string_32.c:97)
[   26.980822][   T76] Code: ac aa 84 c0 75 f7 31 c0 aa 89 d8 83 c4 04 5e 5f 5b 5d c3 90 90 90 90 90 90 90 90 90 90 90 90 90 55 89 e5 57 56 89 c6 89 d7 ac <ae> 75 08 84 c0 75 f8 31 c0 eb 04 19 c0 0c 01 5e 5f 5d c3 90 90 90
All code
========
   0:	ac                   	lods   %ds:(%rsi),%al
   1:	aa                   	stos   %al,%es:(%rdi)
   2:	84 c0                	test   %al,%al
   4:	75 f7                	jne    0xfffffffffffffffd
   6:	31 c0                	xor    %eax,%eax
   8:	aa                   	stos   %al,%es:(%rdi)
   9:	89 d8                	mov    %ebx,%eax
   b:	83 c4 04             	add    $0x4,%esp
   e:	5e                   	pop    %rsi
   f:	5f                   	pop    %rdi
  10:	5b                   	pop    %rbx
  11:	5d                   	pop    %rbp
  12:	c3                   	ret
  13:	90                   	nop
  14:	90                   	nop
  15:	90                   	nop
  16:	90                   	nop
  17:	90                   	nop
  18:	90                   	nop
  19:	90                   	nop
  1a:	90                   	nop
  1b:	90                   	nop
  1c:	90                   	nop
  1d:	90                   	nop
  1e:	90                   	nop
  1f:	90                   	nop
  20:	55                   	push   %rbp
  21:	89 e5                	mov    %esp,%ebp
  23:	57                   	push   %rdi
  24:	56                   	push   %rsi
  25:	89 c6                	mov    %eax,%esi
  27:	89 d7                	mov    %edx,%edi
  29:	ac                   	lods   %ds:(%rsi),%al
  2a:*	ae                   	scas   %es:(%rdi),%al		<-- trapping instruction
  2b:	75 08                	jne    0x35
  2d:	84 c0                	test   %al,%al
  2f:	75 f8                	jne    0x29
  31:	31 c0                	xor    %eax,%eax
  33:	eb 04                	jmp    0x39
  35:	19 c0                	sbb    %eax,%eax
  37:	0c 01                	or     $0x1,%al
  39:	5e                   	pop    %rsi
  3a:	5f                   	pop    %rdi
  3b:	5d                   	pop    %rbp
  3c:	c3                   	ret
  3d:	90                   	nop
  3e:	90                   	nop
  3f:	90                   	nop

Code starting with the faulting instruction
===========================================
   0:	ae                   	scas   %es:(%rdi),%al
   1:	75 08                	jne    0xb
   3:	84 c0                	test   %al,%al
   5:	75 f8                	jne    0xffffffffffffffff
   7:	31 c0                	xor    %eax,%eax
   9:	eb 04                	jmp    0xf
   b:	19 c0                	sbb    %eax,%eax
   d:	0c 01                	or     $0x1,%al
   f:	5e                   	pop    %rsi
  10:	5f                   	pop    %rdi
  11:	5d                   	pop    %rbp
  12:	c3                   	ret
  13:	90                   	nop
  14:	90                   	nop
  15:	90                   	nop
[   26.984699][   T76] EAX: f81b5262 EBX: f81b52ae ECX: 00000006 EDX: 00000000
[   26.986123][   T76] ESI: f81b52af EDI: 00000000 EBP: efd25a8c ESP: efd25a84
[   26.987548][   T76] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 0068 EFLAGS: 00210282
[   26.989110][   T76] CR0: 80050033 CR2: 00000000 CR3: 6fcc2000 CR4: 000406d0
[   26.990542][   T76] Call Trace:
[   26.991231][   T76]  ddebug_condense_sites (dynamic_debug.c:1633)
[   26.992296][   T76]  ? ddebug_add_module (dynamic_debug.c:1690)
[   26.993328][   T76]  ddebug_add_module (dynamic_debug.c:?)
[   26.994609][   T76]  ? __this_cpu_preempt_check (smp_processor_id.c:65)
[   26.996249][   T76]  ? lock_acquire (locking/lockdep.c:470 (discriminator 3))
[   26.997621][   T76]  ddebug_module_notify (dynamic_debug.c:1888)
[   26.999124][   T76]  ? __mutex_lock_common (x86/include/asm/preempt.h:104 locking/mutex.c:656)
[   27.000830][   T76]  ? __this_cpu_preempt_check (smp_processor_id.c:65)
[   27.002451][   T76]  ? lock_release (locking/lockdep.c:470 (discriminator 3))
[   27.003857][   T76]  ? kprobes_module_callback (kprobes.c:2709)
[   27.005572][   T76]  ? __mutex_unlock_slowpath (x86/include/asm/atomic.h:23 linux/atomic/atomic-arch-fallback.h:457 linux/atomic/atomic-long.h:40 linux/atomic/atomic-instrumented.h:3189 locking/mutex.c:999)
[   27.007240][   T76]  ? mutex_unlock (locking/mutex.c:583)
[   27.008698][   T76]  ? kprobes_module_callback (kprobes.c:2709)
[   27.010393][   T76]  notifier_call_chain (notifier.c:85)
[   27.011917][   T76]  blocking_notifier_call_chain_robust (notifier.c:120 notifier.c:345)
[   27.013788][   T76]  load_module (module/main.c:3363)
[   27.015193][   T76]  __ia32_sys_finit_module (module/main.c:3783 module/main.c:3795 module/main.c:3821 module/main.c:3805 module/main.c:3805)
[   27.016794][   T76]  ia32_sys_call (x86/entry/syscall_32.c:50 (discriminator 201719808))
[   27.018186][   T76]  do_int80_syscall_32 (x86/entry/syscall_32.c:?)
[   27.019830][   T76]  ? do_int80_syscall_32 (x86/include/asm/irqflags.h:42 x86/include/asm/irqflags.h:119 linux/entry-common.h:177 x86/entry/syscall_32.c:255)
[   27.021392][   T76]  ? __this_cpu_preempt_check (smp_processor_id.c:65)
[   27.022979][   T76]  ? lockdep_hardirqs_on (locking/lockdep.c:4472 (discriminator 5))
[   27.024765][   T76]  ? do_int80_syscall_32 (x86/include/asm/irqflags.h:42 x86/include/asm/irqflags.h:119 linux/entry-common.h:177 x86/entry/syscall_32.c:255)
[   27.026351][   T76]  ? entry_INT80_32 (x86/entry/entry_32.S:942)
[   27.027829][   T76]  ? trace_hardirqs_on (trace/trace_preemptirq.c:80)
[   27.029336][   T76]  ? do_int80_syscall_32 (x86/include/asm/preempt.h:104 linux/randomize_kstack.h:58 x86/entry/syscall_32.c:258)
[   27.030991][   T76]  ? entry_INT80_32 (x86/entry/entry_32.S:942)
[   27.032493][   T76]  entry_INT80_32 (x86/entry/entry_32.S:942)
[   27.033493][   T76] EIP: 0x77f27092
[   27.034250][   T76] Code: 00 00 00 e9 90 ff ff ff ff a3 24 00 00 00 68 30 00 00 00 e9 80 ff ff ff ff a3 f8 ff ff ff 66 90 00 00 00 00 00 00 00 00 cd 80 <c3> 8d b4 26 00 00 00 00 8d b6 00 00 00 00 8b 1c 24 c3 8d b4 26 00
All code
========
   0:	00 00                	add    %al,(%rax)
   2:	00 e9                	add    %ch,%cl
   4:	90                   	nop
   5:	ff                   	(bad)
   6:	ff                   	(bad)
   7:	ff                   	(bad)
   8:	ff a3 24 00 00 00    	jmp    *0x24(%rbx)
   e:	68 30 00 00 00       	push   $0x30
  13:	e9 80 ff ff ff       	jmp    0xffffffffffffff98
  18:	ff a3 f8 ff ff ff    	jmp    *-0x8(%rbx)
  1e:	66 90                	xchg   %ax,%ax
	...
  28:	cd 80                	int    $0x80
  2a:*	c3                   	ret		<-- trapping instruction
  2b:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
  32:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
  38:	8b 1c 24             	mov    (%rsp),%ebx
  3b:	c3                   	ret
  3c:	8d                   	.byte 0x8d
  3d:	b4 26                	mov    $0x26,%ah
	...

Code starting with the faulting instruction
===========================================
   0:	c3                   	ret
   1:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
   8:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
   e:	8b 1c 24             	mov    (%rsp),%ebx
  11:	c3                   	ret
  12:	8d                   	.byte 0x8d
  13:	b4 26                	mov    $0x26,%ah


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260615/202606152239.7c9bee0c-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

