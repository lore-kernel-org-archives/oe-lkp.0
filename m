Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE65F510
	for <oe-lkp@lists.linux.dev>; Mon, 27 Jan 2025 15:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737990029; cv=fail; b=ikiNBFUhJW5HdtoYm0Ee8Xub0RqxUzC2VoaJRYOAC7NqsQ3KrBQWzfyBpJucvfAHkw7b02EZjHEBTQDDt5T1U7Dw2Af4kUZbMIjB5S9TXpCQAGC95BgzmnFBunQ2AgN9max9lBADkCXKmieSyNvRgE7LOSwBGraYxNwDq4xMrlc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737990029; c=relaxed/simple;
	bh=pONpTYoE2ogd+PASYvyzusaPHxyk2JHaj4GXJwIK0m8=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=EedR4SS88tpvb1KhCYh+14aLrVLrQwr6spztUiFg7uceT/DQIdvwgjk011rehx6QSEVsIqiI2KSNvVmi8lsvrRwLVBwZHVkTQpSnGBpYdgYxNtyK/jXigynLYaJNmm+A4U2yfz/zQ5jLmM0doD+YT/KchXRvwcNvwZcQ64Y4zS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=glUYF4vF; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="glUYF4vF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737990027; x=1769526027;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pONpTYoE2ogd+PASYvyzusaPHxyk2JHaj4GXJwIK0m8=;
  b=glUYF4vF5b6Jgec0ijSemLpFSqtUC7pBzbu0csOyAbmw2ZZGqu9L3klq
   RST4iCdc7NeST4xs0UXco5M+IlICYH27kHFFFKpXudRe1+gGo9KSBUtsY
   ohaHHuBPsKrVaGdTJ6Z0DG5JkwtJLtDafSNXB8JdZSP+JgpDco/1VGfdf
   /uTiSQshcs7cBVLuhEo6NCX86CXq7otKw8mhzFqS+cYuviAlthcDm61lq
   UayfNUlJG4FrmKO7uGuEaEvZqiteFmOZx8fwAi7w6OT5M2PoHb6NPQ5yJ
   BIS+iRr+72ux5TrJIGTWPVtM3CPDiDw/y+6z81cWBGxgX1tbtL4DqKWii
   Q==;
X-CSE-ConnectionGUID: DDKWtaCqTh+pRUuTt57TPw==
X-CSE-MsgGUID: RMcDVlf9SNasNfilrqwGAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="49842337"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; 
   d="scan'208";a="49842337"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 07:00:27 -0800
X-CSE-ConnectionGUID: 5B7cW8k+QqWClLf1nCVPLw==
X-CSE-MsgGUID: H6EZJer9SyKm3aH0x3ta2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; 
   d="scan'208";a="108358526"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Jan 2025 07:00:26 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 27 Jan 2025 07:00:26 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 27 Jan 2025 07:00:26 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 27 Jan 2025 07:00:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mYbc6X5EVwkPzxAXA9XyP2n1D9ygIMrnVfSdINRRdoWnfV/qHWzrap30D3iVqdIJT9CnKn4+AxE8vS3/mVf9e0RenQ+kxkbZZKuIBW+IesGxp4S/Oe9+C4IcVgKiN1ovEUxtID9dtsELW/LFwFqpVR4Q6SfdXhulsHOJV8m9kL8bRCtg08ysd283BsEpqHTN+aMTR14FLuZoMAXUtYmnszCbwbNDahk4SI8/e9HamLa7LtpdB6ond7hyhMpkXTrgqhuRMHzjdPSqbaBMFlogPfLUHHvUFHtQdeE+xd9bUDMsf6KwZIBPEFjPXENEi0g3Kcll6IO8gynPnYEe1I8mrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GkSJkiacy/qu4l4rbka8n85laUGOC2+rBYQxuTgUj9c=;
 b=PsYh1b4fhHbGuvwnG+h3m2ZvrBPDYCswdsO+5Iac+VvfLLzgCGKCbpsUiKgllGEspJdA6jDcq9zE7PCmqcIHCqmzUqu/gAXl+ZbcpgptLKxXTk2oSc4bsiDfc2xfswj//lG2OPOiiHNkcB2T9tBSwDuFqABgtBh2sa7bZT9cDs5dYO+ldMIWvL5yqVpPX2gCSKWW3gamc7QuCufwYgEfsQ9MMs7H6BNObreK8F4rB1z4kc+rPjQQXFY1CpsUZovuGdYG2syN+MAdGUzNROIAHJIKFsthpES8F9eEZCzCIMrT361awT9RSVSW7rl5XfDHbV5WLp1CIr3IKXY77odMGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MW4PR11MB8292.namprd11.prod.outlook.com (2603:10b6:303:20c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.21; Mon, 27 Jan
 2025 15:00:09 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 15:00:09 +0000
Date: Mon, 27 Jan 2025 23:00:01 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Steev Klimaszewski <steev@kali.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [steev:lenovo-x13s-linux-6.13.y] [linux6.13.y] c358c65925:
 WARNING:possible_recursive_locking_detected
Message-ID: <202501272202.7e88153b-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: KL1PR01CA0038.apcprd01.prod.exchangelabs.com
 (2603:1096:820:1::26) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MW4PR11MB8292:EE_
X-MS-Office365-Filtering-Correlation-Id: f7b057e0-2b17-46c0-9c7d-08dd3ee34b11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sdykR7tgaNBsjytzJ9R4N3NReUkSyGM9Wgd3oEr7Izy0RmChlZg5kxW9udn2?=
 =?us-ascii?Q?MAt8xFnUAld0moc7smkGpUpC2xbPEeYTOjTWAmHePxYsNbZXBPOBoBcj7Un+?=
 =?us-ascii?Q?G589X1TEJ2QZhRNtgUtpdmw3dozduiYRxbNrIvqHYMKd3PF4etMuawHouuhK?=
 =?us-ascii?Q?dDBgWIitxJPXHZySKnOXZvb938edGeLooD9O13WjclMUosRpWIblbueVLpPQ?=
 =?us-ascii?Q?F/PAJbYsSKXmEc/ZhrJIAV2C6IZmXw5oDQY0IAiA8FggFM/2aFZuXWkKLkWB?=
 =?us-ascii?Q?ABpwTn4pOj0SfOGd6axVwQIJVfD5bPi+MwSoI/GdhdhXkR8KZjO3i66n/Vqq?=
 =?us-ascii?Q?whUR22flDyjtB3WqlNIkR4+potCLYboU4GZptBF9kFATNG310aW+E3U0wujU?=
 =?us-ascii?Q?FPBq+8RzfvRZX0yJHcCDFm+ZVgEHsNq5sgjtwvmJxLvmuUNSXa5k/WgpRALZ?=
 =?us-ascii?Q?gAquOBR3AKItZjtRi18mP30g1TCxSnaA/CB1+5SqwzwupLegN6qSWueR/hqS?=
 =?us-ascii?Q?TbS7Qhare9zNJgXX57oAdKQv7tGLk0kLtVJd0k87IsH4Bo3MHyMpSkjq7cx3?=
 =?us-ascii?Q?/nGoB8IZIeTcBRDQXILT7C8HyuTNDE+Ecg8vcjEavJeB8tSwiNVRe/BdRoPL?=
 =?us-ascii?Q?oYYvj0K4puqfPCjKxpT1+FvS+1q0tOIc5nya7IJmaBdYQo339PvBT6RnIn5R?=
 =?us-ascii?Q?ARWxAogc+Sh4fGANMz+9Ee1zBEGT8ogsxlMQ4rQCEMIkgAMHoWsrnYBVn/sZ?=
 =?us-ascii?Q?zusnikTy3b1+6FBsmgP0u8xE1kzoLQAEWrJd7gujwwnBp+MfI7YtrgzKy+Yr?=
 =?us-ascii?Q?Ee9NKARkCZYwDEx6/B8hN6rRJzbTeVAS5BmZjaQ2G0/TIzZlqsvtq6Q6ejvH?=
 =?us-ascii?Q?YSqQ7m7esHQL/BEv5nQVyaceBCgJ7Qvb0MD3uUOmilctxNzOgYpAVk5VyuW7?=
 =?us-ascii?Q?ZAEvZ2Vq2WdiUJctp9WOiQxUqNVpa6KmU5dy4CsOOHOG3WfZIzB2NqxyZT36?=
 =?us-ascii?Q?/NuUIz32OqFvNoFEL53RDKzuGXQmdSsMbequ5vl1A2E6+ZqYKVxOXQp+ZJiT?=
 =?us-ascii?Q?UJGEtecs3TYgPkHpJFef+Kq2PNPmSg0xxJxPsDWJGMyHhzV4g0EfFGH98m7x?=
 =?us-ascii?Q?yw9m4kybN2ccF8/GUnmaVzvfBp9KYUwd7hyR0jzQi3au4x/FWawH/H14RIEp?=
 =?us-ascii?Q?AduPzdpUztbZbGcSEitlsB90Gz4I2It1X+9t6x1bP4tXxFFffLwlp3hEE1jA?=
 =?us-ascii?Q?sqiQze5elfAV4B9Kw/BiyIu/uFHx0VVqabpL0uku7kZQUI/01qjNWXcj5p+l?=
 =?us-ascii?Q?Vs6WrApPyc1pLkqtdhOBeWOFPJEa1n8cSIavIiyIxNooew=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6qbo9Mjdg3+tRD3SFRdhpuu+zzFE8B5ooq9fGuDNclnz115tBxUUFowXXDsb?=
 =?us-ascii?Q?UVxl2bfO2k3Aft8OuEXvDcLO5W+pLAsNKqYnyQ8SxGuintmaHE4kw1KqyFGg?=
 =?us-ascii?Q?C3TwCF+EKWKtYSNjPwPhQi2v0ISv6wXWyvMUDQEYjtVUPY8/wMuo/4tJ8CYo?=
 =?us-ascii?Q?L6+NYolwxujnpIIDBmjPoYxGKILXG5R6SG2sOYY6L2SMoimtcP0rhbQI/mKo?=
 =?us-ascii?Q?uWYIiOKnGb/ZQ1YXIDtTP7y/O31TOLgje3HUpJn+2xkw0M1MGZk0T8k6FM3h?=
 =?us-ascii?Q?YeirtmQIYfUUEFUUpIWT1Dj82HvS7fZ4G18oCTeXcFjfnW3PseCq8Tx6V8Vp?=
 =?us-ascii?Q?CDh7xNH3aTLQHTErjZ7bzf75VHNbYRSXyp1uAPwdDTDZUjkO8RHp3S9S3Y8D?=
 =?us-ascii?Q?yjCZ943UqqJ9flvZHkM3b+ENLjN8TxMb3/wZePHngurY/vWHhaxSlBgDrofa?=
 =?us-ascii?Q?LOvLiqkPH4KJoBavywEYDdu47vXcRFawGPc6tUFCw1vazTqrLQESbjMjnmrf?=
 =?us-ascii?Q?nT06rCyRbhjsvkn9IrpoeusVQIq7aeUggmsUB/tRAo68vCz/txrdHZG0CnR4?=
 =?us-ascii?Q?t4Bq4LLSGKlPYgnFXFEXExgbwz84r4ZOEdt6pgjqLQfvqp9N3pvXYoRiFXap?=
 =?us-ascii?Q?9RyfUr3ztbyPsXbSSLRGG+gsnFC1jTwUGLcoc9brh4QhccADCOwdkfINgIoU?=
 =?us-ascii?Q?1bfdpi0/RyjcvAHHp+BK6TSKcSA2urx+sTkDL59+Ho4fknF3Jfacs4IVw8eZ?=
 =?us-ascii?Q?y8goHzsvDCbWmR6mlQOIt9CQcK794zSpBMFiYmToSf6xuFo2RC6Yt8Lfz1HQ?=
 =?us-ascii?Q?j8N1ssfdHkR7pOs0BQVoZssH2SlixHQpmpVaU+M2Ak57UZ/5cKlX1L8KhIhA?=
 =?us-ascii?Q?AfavVU92X3ZW0byjngefu+Gt5h3Esn4ag0MBeLFIcuAMoYGWtWJZtiD/WzGi?=
 =?us-ascii?Q?dFU3LZbgUjSyTnIlLn7XLmoYNmvU2hPUrEs0osupc+a9PR+1FNcWCVRbgWHB?=
 =?us-ascii?Q?bSXfutk/UzBdDH4Yd2aglwjWSf9UDeyPbcWKJkbnuyL5F6ThdfgCWW5Q7c4j?=
 =?us-ascii?Q?r4wDJdIaFE3sRfBpFDeUHTP9EcwHwmwQO/k67QNhVCIFr55KEWCIVLHF2ZMT?=
 =?us-ascii?Q?fgE2lcB0vTIePkfq9y+vx5DdMUrTa97QsuZ0UEWlTW7cowQQAnCzvIuY87xx?=
 =?us-ascii?Q?aAdP0QVA7assR82xNBgH3skL+kgb9Ik8C+3om9v2Dwf6I0vT5GhKG6mEeuuq?=
 =?us-ascii?Q?WRoe/p5WS9RMXwJ+/VkaPotNGqfivaAeQw2SUK1TGhqyMVBQb94/IC2XKZcD?=
 =?us-ascii?Q?KtRvr7bBNjxUUbFE7GCPTrPhoNhOrGenzMRaYwrYmNzBJYUmS9pyZdj6vvd5?=
 =?us-ascii?Q?EsvwJynt0hBa62mFDYIV+oFgHktW8TqmnLxcC9aZGinKW836laMno56HJScv?=
 =?us-ascii?Q?7LE/o1h6M5SpmxIMFaK7rYvHcBzYmXVw+YFE62TBoX5xPgOG/ExgeBYOpBXX?=
 =?us-ascii?Q?WgEjtMcRHrZ+f1wbbvoAk88abRX+OEUTukmc6XYMVVg/HFqLwhlYOMT96km/?=
 =?us-ascii?Q?3nllRczKUc3Ywta3eir2xvERp/UVv0FErEzPWPrL2b46xUdbpot4EuCyakDH?=
 =?us-ascii?Q?8w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f7b057e0-2b17-46c0-9c7d-08dd3ee34b11
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2025 15:00:09.5579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hlpGoZ/nTVIqa7MKtEq9g8MLsIl8Al2CtKao/N6SoiYwHC352swcOR7sHT/bWo+l8h/i2jVZUOW7D3PK25Hu8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8292
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:possible_recursive_locking_detected" on:

commit: c358c65925524fe1dfe962d59966a6aa01b5fc9b ("linux6.13.y-bore5.9.6")
https://github.com/steev/linux lenovo-x13s-linux-6.13.y

in testcase: boot

config: i386-randconfig-141-20250127
compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202501272202.7e88153b-lkp@intel.com


[    5.233830][    T1] WARNING: possible recursive locking detected
[    5.234207][    T1] 6.13.0-00083-gc358c6592552 #2 Tainted: G                T
[    5.234652][    T1] --------------------------------------------
[    5.235025][    T1] init/1 is trying to acquire lock:
[ 5.235318][ T1] b111ac44 (&p->se.child_burst.lock){+.+.}-{3:3}, at: update_child_burst_topological (kernel/sched/bore.c:168 kernel/sched/bore.c:226) 
[    5.235865][    T1]
[    5.235865][    T1] but task is already holding lock:
[ 5.236248][ T1] b9a648c4 (&p->se.child_burst.lock){+.+.}-{3:3}, at: sched_clone_bore (kernel/sched/bore.c:168 kernel/sched/bore.c:266 kernel/sched/bore.c:312) 
[    5.236742][    T1]
[    5.236742][    T1] other info that might help us debug this:
[    5.237166][    T1]  Possible unsafe locking scenario:
[    5.237166][    T1]
[    5.237552][    T1]        CPU0
[    5.237725][    T1]        ----
[    5.237899][    T1]   lock(&p->se.child_burst.lock);
[    5.238166][    T1]   lock(&p->se.child_burst.lock);
[    5.238433][    T1]
[    5.238433][    T1]  *** DEADLOCK ***
[    5.238433][    T1]
[    5.238852][    T1]  May be due to missing lock nesting notation
[    5.238852][    T1]
[    5.239281][    T1] 3 locks held by init/1:
[ 5.239506][ T1] #0: b9dd17f4 (cgroup_threadgroup_rwsem){.+.+}-{0:0}, at: cgroup_can_fork (kernel/cgroup/cgroup.c:6635) 
[ 5.240001][ T1] #1: b9a31054 (tasklist_lock){.+.+}-{3:3}, at: sched_clone_bore (kernel/sched/bore.c:311) 
[ 5.240463][ T1] #2: b9a648c4 (&p->se.child_burst.lock){+.+.}-{3:3}, at: sched_clone_bore (kernel/sched/bore.c:168 kernel/sched/bore.c:266 kernel/sched/bore.c:312) 
[    5.240972][    T1]
[    5.240972][    T1] stack backtrace:
[    5.241279][    T1] CPU: 1 UID: 0 PID: 1 Comm: init Tainted: G                T  6.13.0-00083-gc358c6592552 #2
[    5.241805][    T1] Tainted: [T]=RANDSTRUCT
[    5.242031][    T1] Call Trace:
[ 5.242206][ T1] dump_stack_lvl (lib/dump_stack.c:123) 
[ 5.242445][ T1] dump_stack (lib/dump_stack.c:130) 
[ 5.242658][ T1] print_deadlock_bug (kernel/locking/lockdep.c:3039) 
[ 5.242923][ T1] validate_chain (kernel/locking/lockdep.c:3894) 
[ 5.243170][ T1] __lock_acquire (kernel/locking/lockdep.c:5226) 
[ 5.243417][ T1] lock_acquire (kernel/locking/lockdep.c:467 kernel/locking/lockdep.c:5851 kernel/locking/lockdep.c:5814) 
[ 5.243651][ T1] ? update_child_burst_topological (kernel/sched/bore.c:168 kernel/sched/bore.c:226) 
[ 5.243982][ T1] _raw_spin_lock (include/linux/spinlock_api_smp.h:134 kernel/locking/spinlock.c:154) 
[ 5.244330][ T1] ? update_child_burst_topological (kernel/sched/bore.c:168 kernel/sched/bore.c:226) 
[ 5.244824][ T1] update_child_burst_topological (kernel/sched/bore.c:168 kernel/sched/bore.c:226) 
[ 5.245312][ T1] sched_clone_bore (kernel/sched/bore.c:267 kernel/sched/bore.c:312) 
[ 5.245710][ T1] copy_process (kernel/fork.c:2522) 
[ 5.246102][ T1] kernel_clone (include/linux/random.h:24 kernel/fork.c:2813) 
[ 5.246460][ T1] ? lock_acquire (kernel/locking/lockdep.c:467 kernel/locking/lockdep.c:5851 kernel/locking/lockdep.c:5814) 
[ 5.246844][ T1] ? find_held_lock (kernel/locking/lockdep.c:5339) 
[ 5.247229][ T1] ? __lock_release+0x4e/0x150 
[ 5.247660][ T1] __ia32_sys_clone (kernel/fork.c:2923) 
[ 5.248058][ T1] ia32_sys_call (arch/x86/entry/syscall_32.c:44) 
[ 5.248470][ T1] do_int80_syscall_32 (arch/x86/entry/common.c:165 arch/x86/entry/common.c:339) 
[ 5.248894][ T1] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[    5.249292][    T1] EIP: 0xa7e0a68a
[ 5.249602][ T1] Code: 33 04 00 83 c4 10 85 ed 0f 85 ea 00 00 00 31 d2 b8 78 00 00 00 65 8b 3d 08 00 00 00 bb 11 00 20 01 83 c7 68 89 d1 89 d6 cd 80 <89> c7 3d 00 f0 ff ff 0f 87 71 01 00 00 85 ff 0f 85 99 00 00 00 8b
All code
========
   0:	33 04 00             	xor    (%rax,%rax,1),%eax
   3:	83 c4 10             	add    $0x10,%esp
   6:	85 ed                	test   %ebp,%ebp
   8:	0f 85 ea 00 00 00    	jne    0xf8
   e:	31 d2                	xor    %edx,%edx
  10:	b8 78 00 00 00       	mov    $0x78,%eax
  15:	65 8b 3d 08 00 00 00 	mov    %gs:0x8(%rip),%edi        # 0x24
  1c:	bb 11 00 20 01       	mov    $0x1200011,%ebx
  21:	83 c7 68             	add    $0x68,%edi
  24:	89 d1                	mov    %edx,%ecx
  26:	89 d6                	mov    %edx,%esi
  28:	cd 80                	int    $0x80
  2a:*	89 c7                	mov    %eax,%edi		<-- trapping instruction
  2c:	3d 00 f0 ff ff       	cmp    $0xfffff000,%eax
  31:	0f 87 71 01 00 00    	ja     0x1a8
  37:	85 ff                	test   %edi,%edi
  39:	0f 85 99 00 00 00    	jne    0xd8
  3f:	8b                   	.byte 0x8b

Code starting with the faulting instruction
===========================================
   0:	89 c7                	mov    %eax,%edi
   2:	3d 00 f0 ff ff       	cmp    $0xfffff000,%eax
   7:	0f 87 71 01 00 00    	ja     0x17e
   d:	85 ff                	test   %edi,%edi
   f:	0f 85 99 00 00 00    	jne    0xae
  15:	8b                   	.byte 0x8b
[    5.251173][    T1] EAX: ffffffda EBX: 01200011 ECX: 00000000 EDX: 00000000
[    5.251745][    T1] ESI: 00000000 EDI: a7d59da8 EBP: 00000000 ESP: afe31680
[    5.252331][    T1] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS: 00000282



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250127/202501272202.7e88153b-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

