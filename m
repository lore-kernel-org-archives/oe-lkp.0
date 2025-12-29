Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0780F10F1
	for <oe-lkp@lists.linux.dev>; Mon, 29 Dec 2025 05:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766986647; cv=fail; b=Jt0/1jrGv9aZRBoE+4dOHWDz23wXxjUrPUGMxwUosexrRdEkqp9a41EAbwDt1l4x+GGgB5PCHUzBjCwHlfYYLKNtgU73vGOkkC5F5DbIdXAzH0mAW+GelCW/PgNzmRIT6OvHtMmVeo7R8VLmXQoV6bTRemW4xdIaWNyYHKTVess=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766986647; c=relaxed/simple;
	bh=eIDMjItq+cIBcG5lJYEujkMim+teKzXVAE9JNc+H5G4=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=XtiKIjRtTllZWYLkkayuP3xFz0LWEpwEmHmH3VrUpPtesGciItj+lXD6QKWGVzUg8q52WsvMvg5PUhyWb8PzUNsx+cCVbAxlYm9DXJTY1o7wpVMWsH/gR/cyJwK0KLvslbVDQl7aHgAKbYJY7PgkbAegsJOkyYM0XqEYgqkGJ8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ccna7Xhj; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ccna7Xhj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766986646; x=1798522646;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eIDMjItq+cIBcG5lJYEujkMim+teKzXVAE9JNc+H5G4=;
  b=Ccna7XhjQp6oFk7232+LdcgI3mbCAjSY03iOvN3/m1wc87707irnOUYb
   6UKdsJpezfMIsMtlPcvVoUplXU93FbQQr1ZLUIJ21ikmvknrwHzF3VOVu
   GNT36X/eSNqyhuhtvNrbDm5qb3waGQA268MFaYTlpcv7dJMgfJQffxS8e
   JNOPvxTP0E+iWMOHDpLCkzIAwjFg3aqMtNtLGeddIGJQ3jq7Xy+NwIs26
   uhUFgP+3kuD8D+0r92ZCeeLNw+6MaguBLE/rQ9qjpc9tLbDSgIzndj9Qw
   r1AFptWBNq85DjNjoywrH/a1FbdmKcxABaRCp0EErvLnOOnKRyxl+9FSt
   g==;
X-CSE-ConnectionGUID: jKZR897VRZKK2PbrNp/GXQ==
X-CSE-MsgGUID: /efQGOiQTuWUzsK7MMgJqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="94069980"
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="94069980"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 21:37:25 -0800
X-CSE-ConnectionGUID: Rjy/5U8dRcKMf0zhQXqJRQ==
X-CSE-MsgGUID: cAXcaSimSQS6jARiAttY/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="201300197"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 21:37:25 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 28 Dec 2025 21:37:24 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 28 Dec 2025 21:37:24 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.70) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 28 Dec 2025 21:37:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qfBTr8qPU/J5ENKP8WQ4tSG3+NnHR2hpoWmF5s1xQqYu+aJTEjSLwP8W+B/icqYlslmx3t5YWtEIOSGxJ8DQsB85HGMuzYr7YTCIr/CEYOqr9pHWy03Aqs3ppm+vWwU603uYwlPGV/FcRAklubELzb4N2wbBbY4W/XXXLsABiA6igplPg5j7nFBqt99wndc0mblEcAWi2X+hPVu/Jvn8WP5C92676FAf+SVHBztBsPqO6GweD9zb7r05gDZNhBXo5gz/kncnOU1jXNPwrO/Jrp4/ZdYvkNmzYM8Jbg6GewXnwLKnke1Hxph0fY0rmtp+QJVrdSHfKI7cWX3pRK+svQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fsas7FvdLExRpJxemfO5NTJvDYCzpimhFObjQ+myK/E=;
 b=U24qRjZDLXPSEuTdLh7rLkGF4tJ2VSklziyfkG+TBj2opBMA1VDgKuOtr3ScoOksKuRBLvQhB6W2YJKJ0Tuk8jDvAuVyPGN0s3fZc+9eGEXCSsfUedF6hlXEGrVA6SkfMotKmlLsGrvfPn/R2tj/Ve9RNaHGwHHIrk3lpLmwZgbzegIL9+kJgwsokYsmms3r3GiJbIhX+UiOZlqC6FDTqIVeOF04NGRR7W+4mkrulvLIFY0U+MMZrdfC3jkjtgfdx5SVG7jr854jGuN6aqmJf1K+yPX1leeLECKr3/BK7YK+hpmXXTFhQMvVjUxvj/nOli0JKDqvP2m6OnAb7LyUCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by BY1PR11MB7982.namprd11.prod.outlook.com (2603:10b6:a03:530::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.12; Mon, 29 Dec
 2025 05:37:22 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9456.013; Mon, 29 Dec 2025
 05:37:22 +0000
Date: Mon, 29 Dec 2025 13:37:15 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Mike Rapoport <rppt@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Mike Rapoport
	<rppt@kernel.org>, <oliver.sang@intel.com>
Subject: [rppt:hugetlb-init/v0] [dev]  ac8d6455e4: PANIC:early_exception
Message-ID: <202512291353.1423cde2-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: TPYP295CA0053.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:8::10) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|BY1PR11MB7982:EE_
X-MS-Office365-Filtering-Correlation-Id: 05e0bb8c-41d1-4182-44ac-08de469c570e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XV+cyfJKIDmr4+HrF5l9u8WIJoMRHY3BmAZdrTCSLEpLGxB38OVNx33Uc1+K?=
 =?us-ascii?Q?12GIE/5AFqHd+r+BTtg/EMmxP14zxAMAmfp8bbff4KLvwsjaQx/b7007AEVh?=
 =?us-ascii?Q?uOfOefw6xhFd0V8JDHrKZ/QVH8fTCAh1JGMKMYDxmlMlM0gxbISb99ed1O4X?=
 =?us-ascii?Q?1YJqdL9Yj0vvKCQKRDYpdGjj0tF673DC0LGwVC8B9VRmnhZ5HEerTC1L7RZ8?=
 =?us-ascii?Q?nqhngJB+2pvUWrPMEcsEqYh+Q+/gdFUXlKUpShXpz7sTzQQMg1kaz5lXX+Em?=
 =?us-ascii?Q?Mq0Vo0c2aL1PxWUEG9BhYwG9vw5pFRfOe0bYBsCRIiXIn1ZHNXJcqrNQ+21h?=
 =?us-ascii?Q?C3LzBflmFPVlWUD0u9wU3NxRhrfjmOPrtj79GnVtxGQcp//jofS1JrYyEO8L?=
 =?us-ascii?Q?xto5ZHFWUO9Wp883IsBs4sBNG87mvEY5PJaeFsliLKXo1nmKsbtdNyFWNdbX?=
 =?us-ascii?Q?AVWGLSYXARX0tRjn5Q/ShpBSo0fAbF9EQe7ST3V6RAiIOeKodztsqbkl6/d6?=
 =?us-ascii?Q?n26KB35tqbIXY9eWM3aUoW1pzTY2D9NyJhROdxDAtVet3Hy9EoNCJW8ttt19?=
 =?us-ascii?Q?+O6PvG9jUlELYYBtBRB9oOHC+XiaCE1ahzj4djsOfRAKcjIb93UCSbDZiXYS?=
 =?us-ascii?Q?ZQeJqIFJZB88LdiZtjSEilpvcWAedYGnZvidIYDM47JdJD0cLDMqs4fDB0Kg?=
 =?us-ascii?Q?BXHH372KQSGSuSJjuG0f/MIgXIcn5wgNSmCPhUh7BAQewTDh2d7d9OtuxOUY?=
 =?us-ascii?Q?6WPqNiUbV/9GJFuXhmKZRCjEBFvq0IHqYtXgmwMj/x0RldZbgRcvCiwFIRMq?=
 =?us-ascii?Q?uOLsmQjP/8P/AMvqnAY8nFgoqLdx6J3VBzWL18pyAp6ldOStguUU0XPJws+B?=
 =?us-ascii?Q?7AMko72m/AuicHhO+GTP3kJY9K/XitO2yeJiZTwPPLiY87EbgabTTdfVO43n?=
 =?us-ascii?Q?leOtzjbVDjZ5mymAHCldVHen5/hPKX3e9hbyh7nBGYl0Ahe1LuDYLzDs6ICa?=
 =?us-ascii?Q?utNfIZXqz54j//R+QAdv5hwpyx0OxESF0RFVOwwU7QRtfvLyY/8YghGzL0XX?=
 =?us-ascii?Q?rzcVdLYtmU5hRT9kIekDwyctu06N/duPdlileTumYshQWTtXBzoT2YxQsVKr?=
 =?us-ascii?Q?sSlJRJMiXPpFZtbqvcIPsebLe2fiXDLqGjtrKXLhsAsOR79Z7DcCmcfwVTg1?=
 =?us-ascii?Q?kJSup3ToQNGSGxeP6avMAj8X9IADI4RA3ra/VUR5Wjcw6NLbieYZgJaDmzv+?=
 =?us-ascii?Q?sy2S7NypAp/A1IBnba4NOqAsyf2ijEKgklpkwJA+FJxNic++vVC8XcupJ6B5?=
 =?us-ascii?Q?BV7PXAU6nR4p9DZ/c2k9CnyxaW+wNcTgJpi9zMoALYtromF+5Po8bwGS2NGC?=
 =?us-ascii?Q?itWR6npN61WTC39zT/A0xjvOL4KZj3bHmYLZGc3YCNg9/JwW9eAH8XtS9fxp?=
 =?us-ascii?Q?EIBvvMBXROtlxsr5STlf9Ih5+XF+CjKRw/0GP5fd2POBF1ZNfo02Aw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OJDsvJugTQOPcG6Y+xiiNiR0GVacENn8wFR/UgfTkpWH99HzAPLKHlGFpUnj?=
 =?us-ascii?Q?EpdoiBI5p6PFM5IqykFjLIGOwNNb04PKiDV10/NKGmu+oA5PR5QukUkXcXEe?=
 =?us-ascii?Q?UKdCW2nuQ5Lc0QjG8dqLK6zLZ8n8eGhaxpvFVY8bzOj/pNwZ0Tv62cp+U2Ws?=
 =?us-ascii?Q?yyUXTsTeog5hz+T7y4y1sS52RJUjSuI2B1AoB9jjU0KVfaRb+y8aso3aUYKI?=
 =?us-ascii?Q?yS+ZBXd25KW6AoNcAv+mHIfA9u6ANu5LfTnUSE4prdw+hjzFgqj/NTYde4bA?=
 =?us-ascii?Q?mksBJq+RZEZZ8U505IccdD2aD8nP90i9KqnYF6ImT16kdXVhfot5vpNHflBC?=
 =?us-ascii?Q?dSvkMNdTL9jMK/5RcnYFAHK3eYvonZp1M16Vt1MMWt/sdm0/hkLkV5ZlHyXP?=
 =?us-ascii?Q?KxEUso0daxOvwsLzkFjMOnZAPgmtZFNeUTB0SLmtzKyp0b+bnYePwBeODDzK?=
 =?us-ascii?Q?wPtmIDgkE6cwp+IRVBmwTG/TnMUxy6iynxn01jtZkEMJz8SaeiblN/jnTxOA?=
 =?us-ascii?Q?5Bp/LYucZKt1b6V7YO0yU5eOakbb/T5tBoonLr7Sr35IKIHFu6AKyv/ZwLRe?=
 =?us-ascii?Q?IUl5vFdgVcr1XXKnVVmnNpB7KX8MQIDa2KiYpwqCmpVst9DZEk2RByEGb3cM?=
 =?us-ascii?Q?L+969r9QUfaMS0tnAf2MyKV1Wp096w8hfoGwpys+Sx3Low9n6FMHKYsvjkpg?=
 =?us-ascii?Q?iHxARCEJnAJOcoP+8unElIQktwaAxZPbrWP5U6KrqS1GIYJPT4lwU66ntHGe?=
 =?us-ascii?Q?z2CSlrsNdY/FRDtYytQCSXzESTg4+fcbs7G2k0PxDP9wDx8cHasVeGc2dpVP?=
 =?us-ascii?Q?2f2/LgwurnV2m8rfa3EM8LWtibQSHJLrIOiawAmx+2/jQ6ZOcYeYKfcumoj+?=
 =?us-ascii?Q?MUF2lKokhS7vXK213SG0GM58CTyB/Xb95AYcviTZ7NGH4TFVkwbf0Qry1jrh?=
 =?us-ascii?Q?AD6KHCoETzLoj6/MdSRCUflhNcCIqcFTfRysYRWGozr6D2JbCUYWKzp4ovQF?=
 =?us-ascii?Q?SgD8bqM4SF977+OYaUA8RbJjgZbgTXDzPT9Bm4o8XMAMjQin0dUhBeiSv9P5?=
 =?us-ascii?Q?wXv2Z99X2Xoz6Q7Y8TEDqtehJ27SCz7NG5dMEIl1isnIqIWksKpilXurBzOb?=
 =?us-ascii?Q?lr+kb3F2h5Sr7gQ116J4ZYExZPtBwm41SgKtKpAN4mPgzRFQLXVdmX3iz5B6?=
 =?us-ascii?Q?RO6zTXtIQ9DbIdqJArj9If1SHAe9KBxANZROpLadcKVr0ExaFhLFwHJ3zybN?=
 =?us-ascii?Q?zQiwuFal3llK59ltoF7XsaatO5kAVmajbFOvnEKziYqHPADAE1DHTPJgTgg5?=
 =?us-ascii?Q?yQ74hhq2VCNFe+IS+wlm24/NxfZGqxMv7ksrBSLNRENdks1qkEySvQPABbVc?=
 =?us-ascii?Q?cc8zk2yF4h7uuh2jvPJjBFVbr1OJLyMCy9ltAyNRJ8Igbe/MphyhbRYUS8dD?=
 =?us-ascii?Q?ccoHFtTHGge3btSy/C6XXNhfdfJJLMLP/Dr7+pLms2Pqg5E2SLEgSt7nJ365?=
 =?us-ascii?Q?rG5j4cZIeSk5hymrzxcAjabW3L4Sjw8s8ErfL7QkwTJDQoKtIROG1yhJVi8J?=
 =?us-ascii?Q?4fDCUFjeD3xiS7KrwIziuuwHMPph77cZF6ts2bSFkH3hsfWvG23fqUQ/AFz7?=
 =?us-ascii?Q?eZPnPjVsVOwluOvamTy+iQurwVVfQ191egEjtjhsrQrEi6C/dyrexetXGqz2?=
 =?us-ascii?Q?zoIlYMtUM3aTyAbzirLroZO3NzkfMOs56Ap5B1TzqvNeW/p7K+1JcVU/z6BQ?=
 =?us-ascii?Q?tZud3prWMQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 05e0bb8c-41d1-4182-44ac-08de469c570e
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 05:37:22.3562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +wkcr1QohxeEwitXE4ydBJQrR4Kf7EhGEZVJ1F/PuIZu67y+MYVpQpzW+zXjW6x1ovoO/J69HMwtLTGHDoNc8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB7982
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "PANIC:early_exception" on:

commit: ac8d6455e4bbac839994bac1863b9017acb90c88 ("dev: Revert "mm/hugetlb: deal with multiple calls to hugetlb_bootmem_alloc"")
https://git.kernel.org/cgit/linux/kernel/git/rppt/linux.git hugetlb-init/v0

in testcase: boot

config: x86_64-randconfig-014-20251225
compiler: clang-20
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202512291353.1423cde2-lkp@intel.com


[    1.747357][    T0] PM: hibernation: Registered nosave memory: [mem 0x0009f000-0x000fffff]
[    1.748440][    T0] PM: hibernation: Registered nosave memory: [mem 0xbffe0000-0xffffffff]
[    1.749535][    T0] [mem 0xc0000000-0xfeffbfff] available for PCI devices
[    1.750441][    T0] Booting paravirtualized kernel on KVM
[    1.751160][    T0] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 6370452778343963 ns
PANIC: early exception 0x0c IP 10:ffffffff85c3e5eb error 0 cr2 0xffff88883ffff000
[    1.773701][    T0] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.19.0-rc1-00027-gac8d6455e4bb #1 PREEMPT(undef)
[    1.775093][    T0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[    1.776471][    T0] RIP: 0010:hugetlb_vmemmap_init_early (kbuild/src/consumer/mm/hugetlb_vmemmap.c:758)
[    1.777364][    T0] Code: 3f 83 fb 41 0f 83 c2 02 00 00 4c 3b 7c 24 20 0f 84 b7 03 00 00 8a 05 04 5a 20 ff 3c 01 75 c0 4d 8d 67 10 4c 89 e5 48 c1 ed 03 <80> 7c 15 00 00 74 12 4c 89 e7 e8 e6 24 d5 fb 48 ba 00 00 00 00 00
All code
========
   0:	3f                   	(bad)
   1:	83 fb 41             	cmp    $0x41,%ebx
   4:	0f 83 c2 02 00 00    	jae    0x2cc
   a:	4c 3b 7c 24 20       	cmp    0x20(%rsp),%r15
   f:	0f 84 b7 03 00 00    	je     0x3cc
  15:	8a 05 04 5a 20 ff    	mov    -0xdfa5fc(%rip),%al        # 0xffffffffff205a1f
  1b:	3c 01                	cmp    $0x1,%al
  1d:	75 c0                	jne    0xffffffffffffffdf
  1f:	4d 8d 67 10          	lea    0x10(%r15),%r12
  23:	4c 89 e5             	mov    %r12,%rbp
  26:	48 c1 ed 03          	shr    $0x3,%rbp
  2a:*	80 7c 15 00 00       	cmpb   $0x0,0x0(%rbp,%rdx,1)		<-- trapping instruction
  2f:	74 12                	je     0x43
  31:	4c 89 e7             	mov    %r12,%rdi
  34:	e8 e6 24 d5 fb       	call   0xfffffffffbd5251f
  39:	48                   	rex.W
  3a:	ba 00 00 00 00       	mov    $0x0,%edx
	...

Code starting with the faulting instruction
===========================================
   0:	80 7c 15 00 00       	cmpb   $0x0,0x0(%rbp,%rdx,1)
   5:	74 12                	je     0x19
   7:	4c 89 e7             	mov    %r12,%rdi
   a:	e8 e6 24 d5 fb       	call   0xfffffffffbd524f5
   f:	48                   	rex.W
  10:	ba 00 00 00 00       	mov    $0x0,%edx
	...
[    1.779986][    T0] RSP: 0000:ffffffff84807cf0 EFLAGS: 00010002 ORIG_RAX: 0000000000000000
[    1.781096][    T0] RAX: 1ffffffff0ba2b01 RBX: 0000000000000000 RCX: 0000000000000000
[    1.782156][    T0] RDX: dffffc0000000000 RSI: ffffffff869f7738 RDI: 0000000000000000
[    1.783242][    T0] RBP: 0000000000000002 R08: 0000000000000020 R09: 000000000001fb80
[    1.784333][    T0] R10: 000000083ffe0480 R11: ffffffff00000020 R12: 0000000000000010
[    1.785292][    T0] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
[    1.786174][    T0] FS:  0000000000000000(0000) GS:0000000000000000(0000) knlGS:0000000000000000
[    1.787169][    T0] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    1.787906][    T0] CR2: ffff88883ffff000 CR3: 0000000004867000 CR4: 00000000000000b0
[    1.788857][    T0] Call Trace:
[    1.789309][    T0]  <TASK>
[    1.789719][    T0]  sparse_init_nid (kbuild/src/consumer/include/linux/mmzone.h:2260 (discriminator 1) kbuild/src/consumer/mm/sparse.c:549 (discriminator 1))
[    1.790364][    T0]  sparse_init (kbuild/src/consumer/mm/sparse.c:624)
[    1.790957][    T0]  zone_limits_init (kbuild/src/consumer/mm/mm_init.c:1819)
[    1.791606][    T0]  ? find_held_lock (kbuild/src/consumer/kernel/locking/lockdep.c:5350)


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20251229/202512291353.1423cde2-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

