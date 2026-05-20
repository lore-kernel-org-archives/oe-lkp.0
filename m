Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA603EBF24
	for <oe-lkp@lists.linux.dev>; Wed, 20 May 2026 14:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779286849; cv=fail; b=iJKUd+DBz3NAE/BjfucOnYTHBm+TY1NqFOAXDXXFFKQ/fgBFBHUryAXeKHBM/1cqIAQGcgyvn8i93ezgl3AiocrI1UyPQOzlO186RrpvYDeiv+1VQahsfI47QWNgUv2AX20BlfF/Ujn2NWuB1JEilKcOFiz11EtI+gMw9IIHGLE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779286849; c=relaxed/simple;
	bh=C60ZNBILFPXBu2sT3GMe5Eikq65pWUBLk4milaF8ctY=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=qOIOG9mEGykpUNrG0x7vNExI1XaxlsCr6W50UxmSvZs/5FUnDkBl0+6SEJ9bULBqpGh9eIvoA3hSjsGx+fjnf7bzmbHHXNpfYGDrsbiav2xuy1v+S7aIv25429l9Ag16fxpa/T913y4TMm4js5ZAocJKmYzF8I7UJ14F8AATtW0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gcY87hXC; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gcY87hXC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779286844; x=1810822844;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=C60ZNBILFPXBu2sT3GMe5Eikq65pWUBLk4milaF8ctY=;
  b=gcY87hXC5b0MfOVKdy06BVirdA8lCjCrf829R7PoBtxzr9O5ne4DkvEO
   zH4P162QVwuD0qDxuXtjbGs569zgBiOqffPjzSJagqlgtArgR5eZrbeuu
   9bFaExooWjjW+8u/eM/6S3b8Ela2ZNKYUHL5Ks9Tl3Jw+G3ljvTUdORPr
   fy3FUReAvRC6Pe7I0LOgWxVRy/Jeu8bQ/eula9MUJU0nONTxg/gihYGwS
   /th2y3uZu0s1UbH9PEfOKEDfTH4mvoDSvZuiOTwKjQOJvRIJzyMvvrALc
   77W+1amSnrEopW8C1oCbaqqxYBIPr5vSeMyGvEHkCL2e9NeNNSk9P+co6
   A==;
X-CSE-ConnectionGUID: eW9q2bLARne5SmfiuJmhLQ==
X-CSE-MsgGUID: NNenn/y6TeKYp3qmu1Q77g==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="90882162"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="90882162"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 07:20:42 -0700
X-CSE-ConnectionGUID: jKZOBBfYR/6wEmQDgRxKWw==
X-CSE-MsgGUID: HlvFeUL3TQeGK9sJTvI6hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="233842408"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 07:20:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 07:20:41 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 20 May 2026 07:20:41 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.24) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 07:20:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dQflWIk3HO5OFd32N3Lh9eZOhNrfWS9Ps9eJ8xa0LwVZtoK6Bj92fwASpPIY3Be8429yRvJluZUbr99NVvqIiZNaT/tTzupaX/A8n7M/ADS/wof33SbFxk/n/ZqEW1DisZUJjSyb/CyH+R4l6H76sMRxG1RnCjozdphaafbABaTIZZLeh00XEKG255Oo/1yr7p0R7z/hjvRVErPwkCSfVnU8Xc6c+E111S7mhwGKX4NQ7K9j/XLgnkfqVt1UKjLnzBfP25ZUVhT2m2IVWb9xUZW7tGZuZndKNqDcbg9RhBCbzk1WoLDhPWzxJgp1jCdZUbF8X3vo7F5ErCpRabgv7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uSfb6rsw7HCX1SPb+4SAxtjaKFbSY4K3PH+KOQhGsik=;
 b=kELvL4y5Jy5HEieE47GWODtFhP/LGnbHbk33izWS1AIwgrCyQ4vAMDN2jV9Kw+fHV4c0JgOcS3n+osS+kpEg7yP9uMMZRnyDZeDqJwoGfHi7YVLMUUOkdWD406vPUh2Bs7l5Nmlr8wPAKI9IqZojiodd3Ghz1tR3d4tm6jRjFtOLPfzFg13M3Yx/KW0OBPVaa0uAx69aFZYEd5iNyJhIlQ1GbkuWToa+6flfLsky4F0b1eqAJPdsDymuRD6+n0BXAVTd3V/mn89yjt1NOE8WTYGlN5ZfmqUkA3+huvLAHqcsgQkjHh+1t2EF8UPzyipFlXCr+9gqEBQkBsQkOi7b7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by SJ0PR11MB4783.namprd11.prod.outlook.com (2603:10b6:a03:2af::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.18; Wed, 20 May
 2026 14:20:33 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%3]) with mapi id 15.21.0025.020; Wed, 20 May 2026
 14:20:33 +0000
Date: Wed, 20 May 2026 22:20:26 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>, Frederic Weisbecker <frederic@kernel.org>, Peter Zijlstra
	<peterz@infradead.org>, <oliver.sang@intel.com>
Subject: [tip:timers/core] [posix]  acc071343d:
 stress-ng.timermix.ops_per_sec 5.8% improvement
Message-ID: <202605202152.78a82417-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: TP0P295CA0017.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::11) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|SJ0PR11MB4783:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bf74014-fc3d-466f-d1e4-08deb67af42a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|3023799007|56012099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: wv7SIt5uF5i8StWX+XYsC3W3zQFm5fqRxWIh4Jz5UycDMwv3pg01iNX4q+N8BH4SHG0ZUkNLysTKXW3VCeZzTXpIY37+PyIn7seF4D8Lp+NyEwabfkRlK9MPLEcJ9qPZ5kqQ6MpI6l9DQSWwYHVaZjhKXMdoAQOuWEdu21C4aXNuDblSmvfAg7slDZ73DzNpUzZgvdKDFXE9BsgD5Z1ilcB0rFFmsfc9T90dMZhoa/Kgc4t08KLLuDxuU/ybQrdpipZfmOpzC9w6j6TykAkv2oUYwug5wnOLBzlBR0CNeA+Lvt6jL1DsIr1ybNZhDAm6fxf097iTvad1YbFiahw9a/nU5cb6HMPp9ZIUgEUUhYO756VtlmotnHNosgdka8WJcMB3SDxQYEAGMOM8Tm7bTjgAb28HrlmDejqrQ+2cZapAagV+uhLfRjz7ONRnxdhu8dXMFgGMhwIuA66cBYullIkgjE4wbHb7uG5aNo0SXEQP/RSlstDgPUvlFOE+p3lAMYbdmgjQ5M2krSeNVsQeuL89Q/1AfyMHloeYDrEKUprxC21RQORCl43BRpBjQf6YHsPTKZaHNGbWBcoURaypAQkxjs0LldVdHC14bvbxPO2SZAriadsjE/DO0hhDU4O7bRurjBLpS0zUwwHaTL6lQg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(3023799007)(56012099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?98CfcD/tOvhix+NZjESeNT9bNu5UBh7SoQelR+FMMMyIKnfwRYPfSYY1aY?=
 =?iso-8859-1?Q?owYFwL3j7E00H1VL0dPTac3baO8vGmN2i1AAcCbg69Npdge+kEs4bmI8kB?=
 =?iso-8859-1?Q?ZpiVAhpbDKdNBSI9MJXeQAg5896pPtEqSHG6v4aR3+sPhiDTg3fCauDSmz?=
 =?iso-8859-1?Q?EuzHD9Cj7NbtqVXdfuqjk+OWCDJxcmNdSs9IZTVSd2NVTNw/smlBR/Xx4L?=
 =?iso-8859-1?Q?OtPjWnfh0/6/oTeHheDlyDPUjzaCNHVT4npKBvzegnAjFzkV2DPVwc0HYF?=
 =?iso-8859-1?Q?xrZc5JQ6VtaVrSYqDO9TB8JY711sDN3XlJ88KcWoVMj8UYffuATIjxrd5v?=
 =?iso-8859-1?Q?MMQn08t9e1Ob8JlMzS+PvQ4Td2l6Ads20rQT5d16+LMhZ0OZy6INqy4jUD?=
 =?iso-8859-1?Q?2vMqsBVjbt+W3VVRT9YKSh661F3WAsGtVL9uYl5XaawVNPVyujZa6lDSR0?=
 =?iso-8859-1?Q?3fQ9uuQn2Ikmvs19LdwYpf7fB9F+Pxf6TfaoG6RtxGh523acLdQYu0KTfv?=
 =?iso-8859-1?Q?OrgwFwLfvUxoavZO61DJNO9rW3tdB9A3RwgcK8xqNapc5rW6BHaVZoawPR?=
 =?iso-8859-1?Q?gAmDA3x163gAuXP+p2JKq5ynKho2qI8yirt4OVeC1QJ0tYZ3Fiw8V0hqmF?=
 =?iso-8859-1?Q?vSPAryYkDraIMdPcUD5+vu+3habfvYLgbsCINjNTKYVfx4Df6zGf2Zx+wK?=
 =?iso-8859-1?Q?oVT4ChT6PNK1/O/npQFQm3M6NtkE4WDXdq9f9veVC3wl6n3vntDcoPIvoA?=
 =?iso-8859-1?Q?aWLUVleZls3kSJO2qHVVVYGcaYvBkJyMpPPhRg/i5ruOLXSKFoyoDEKDUy?=
 =?iso-8859-1?Q?2EeqgT3eCUU2yeDc4m/foO9p2RivXNrcHj9rYMk/tvqZvhzojUxqgvmRFv?=
 =?iso-8859-1?Q?21BzpPXGxwkTipFEv/yqEaAEAiv4kySvDODz0+mEmoYN9Y7fhSB5UDfumH?=
 =?iso-8859-1?Q?m4A1gkV3IizQxazw/MDVzzoVNMlMGKEbpY080vOr87H7N8ToV38+ZtL0ts?=
 =?iso-8859-1?Q?u8aANA0XU2J9Pd320COnn/maNuwbUwWWHKHTXTQlWrP/YNRZsLq0TuYYng?=
 =?iso-8859-1?Q?z1OkE9IturMYLmdaErxNRBlxQh7BkRPOC75BR4cEo6PDKCF1iav2LrrF14?=
 =?iso-8859-1?Q?TxnuTsAwl6VfsWn/BjWWN/JKv/OX9rm7xt5gSKDAgdmE2G2WWb6JjaKzQI?=
 =?iso-8859-1?Q?uCGzb3vZ+8y1WmGwQTGOuIR0nVp/SYYRVAJPnSRnPV+GMrnffTxYotRxgb?=
 =?iso-8859-1?Q?G9hmbotW4An0PzGxNArhNBiwf6NsRvnm4Yvz5mlVUQEgeVMFktHL7F3I7W?=
 =?iso-8859-1?Q?3yCiH7C+iepOJiOyIyhDM/hnEJeHY3zxvt8uaMPB3Bjoq2P14SN2Y5szpY?=
 =?iso-8859-1?Q?vYS6P/X2iOozdM7+8XGY1YcZ6UkR1M0P6WJO6FTlQRmTeUZqAl+uODGuAY?=
 =?iso-8859-1?Q?wv+f30xwWJNuu56o48HmB7O8D/gQyAIeX3q2j5sUCr5iPFeOCbgiUVivLZ?=
 =?iso-8859-1?Q?h0CYhVlcsprhkHiyWUR3IUaChDCY5rcL8gPhLnCMX5kmIgR59PMQiCGf+w?=
 =?iso-8859-1?Q?++ZtYMb/4p50XK7+6J3Tkmfqxgc6utpmw0XqaHyEV9VNL86bjsWnu8Ghl0?=
 =?iso-8859-1?Q?+F6URPlorXHSuFWPnMvkeqWMXauUez8KD/zrAwB4jQpsMnGHOX8slC/lc5?=
 =?iso-8859-1?Q?p4/roiI748CKmrfXt/ZXO9Vf03rwL5nJOmMoYh6kYaTQ5agboMutfNLFaZ?=
 =?iso-8859-1?Q?saaZwKpGyvOys3gjUOE+Z+ZwciBVzNWulWsukX4DWhoYoTQgtRZ8A6PD5Z?=
 =?iso-8859-1?Q?cTMaqNOWUg=3D=3D?=
X-Exchange-RoutingPolicyChecked: chE/asKBmXdAMFHHhoJ4CshTHwKjy1p0c8B7/hmrOwXFKisqdP+DjYuezxleVXagQAT6bioe6kyGGZznqzn1Mtc83YqTRVNxjOrotQB2NPeVqkoseHFRUsqeQjHObX7phYoLrPmeMCZZi9IVjxEO4Rv0IED0rPhmrNihuFWrJmyShX+EJzmPRkz2yhrxkMxArNxlM3axNaTABQPuIp4iBSojFlH+72kA0gJjZFiCfu6fb+8//7nTFBnnlT7lRFur4dDkpEY3JIvRBHQuhMZu0PXfQuAjyxmjjyGUl3RCznTiLPkT+aOzUcUqhntC4vu9d/e85GV0HqkZGkkwvjlwwg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bf74014-fc3d-466f-d1e4-08deb67af42a
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 14:20:33.4246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xPJjgJBQmfGU5EPxGs95KAuGs+JlIPDkBOTEMVaoX3oOoYo7ZQoh/PAovFHoKnDvhz97qxeVI6LuKKn+1nigjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4783
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 5.8% improvement of stress-ng.timermix.ops_per_sec on:


commit: acc071343d29c2361619b05ad50ea3de9ef9a3ac ("posix-timers: Switch to hrtimer_start_expires_user()")
https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git timers/core


testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: timermix
	cpufreq_governor: performance



Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260520/202605202152.78a82417-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-icl-2sp8/timermix/stress-ng/60s

commit: 
  cfb7fe3fdd ("posix-timers: Handle the timer_[re]arm() return value")
  acc071343d ("posix-timers: Switch to hrtimer_start_expires_user()")

cfb7fe3fdd4ca1d3 acc071343d29c2361619b05ad50 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      5395            +2.2%       5514        stress-ng.time.percent_of_cpu_this_job_got
      2972            +1.8%       3025        stress-ng.time.system_time
    266.16            +7.3%     285.49        stress-ng.time.user_time
    114645            +5.8%     121264        stress-ng.timermix.CLOCK_BOOTTIME_ticks_per_sec
    114659            +5.8%     121273        stress-ng.timermix.CLOCK_MONOTONIC_ticks_per_sec
    114862            +5.8%     121481        stress-ng.timermix.CLOCK_REALTIME_ticks_per_sec
    114626            +5.8%     121249        stress-ng.timermix.CLOCK_TAI_ticks_per_sec
 1.772e+09            +5.8%  1.874e+09        stress-ng.timermix.ops
  29540557            +5.8%   31241504        stress-ng.timermix.ops_per_sec
     11289            +3.8%      11723 ±  4%  proc-vmstat.pgreuse
    102.14 ±  7%     -12.1%      89.82 ±  4%  sched_debug.cfs_rq:/.util_est.stddev
 1.764e+09           -14.2%  1.513e+09        turbostat.IRQ
  27933279           -14.7%   23829084        vmstat.system.in
     13.12            -1.9       11.25        mpstat.cpu.all.irq%
      8.19            +0.5        8.66        mpstat.cpu.all.usr%
      7349 ±  5%     +11.8%       8217 ±  7%  numa-meminfo.node0.KernelStack
      8073 ±  3%     -10.3%       7244 ±  8%  numa-meminfo.node1.KernelStack
      7350 ±  5%     +11.8%       8217 ±  7%  numa-vmstat.node0.nr_kernel_stack
      8077 ±  3%     -10.3%       7243 ±  8%  numa-vmstat.node1.nr_kernel_stack
 2.919e+10            +2.8%  2.999e+10        perf-stat.i.branch-instructions
      0.37            +0.0        0.38        perf-stat.i.branch-miss-rate%
  95526350            +8.1%  1.033e+08        perf-stat.i.branch-misses
      1.65            -1.6%       1.63        perf-stat.i.cpi
 1.332e+11            +1.8%  1.356e+11        perf-stat.i.instructions
      0.61            +1.6%       0.62        perf-stat.i.ipc
      0.32            +0.0        0.34        perf-stat.overall.branch-miss-rate%
      1.66            -1.6%       1.64        perf-stat.overall.cpi
      0.60            +1.6%       0.61        perf-stat.overall.ipc
 2.873e+10            +2.8%  2.952e+10        perf-stat.ps.branch-instructions
  92808849            +8.2%  1.004e+08        perf-stat.ps.branch-misses
 1.311e+11            +1.8%  1.335e+11        perf-stat.ps.instructions
 8.042e+12            +2.0%  8.206e+12        perf-stat.total.instructions
      6.76 ±  2%      -5.8        1.00 ±  4%  perf-profile.calltrace.cycles-pp.common_hrtimer_rearm.posixtimer_deliver_signal.dequeue_signal.get_signal.arch_do_signal_or_restart
      5.23 ±  2%      -5.2        0.00        perf-profile.calltrace.cycles-pp.hrtimer_start_range_ns.common_hrtimer_rearm.posixtimer_deliver_signal.dequeue_signal.get_signal
     16.47 ±  3%      -3.6       12.86 ±  3%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt._raw_spin_unlock_irq.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop
     13.31 ±  4%      -3.1       10.25 ±  2%  perf-profile.calltrace.cycles-pp._raw_spin_unlock_irq.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64
     27.02 ±  2%      -1.5       25.57        perf-profile.calltrace.cycles-pp.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
      6.74 ±  3%      -1.4        5.32 ±  2%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt._raw_spin_unlock_irq.get_signal.arch_do_signal_or_restart
     32.05            -1.3       30.80        perf-profile.calltrace.cycles-pp.x64_setup_rt_frame.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
      5.58 ±  3%      -1.2        4.40 ±  2%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt._raw_spin_unlock_irq.get_signal
      4.17 ±  3%      -0.9        3.28 ±  2%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt._raw_spin_unlock_irq
      2.23 ±  9%      -0.6        1.64 ±  4%  perf-profile.calltrace.cycles-pp.posix_timer_fn.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      1.50 ± 14%      -0.6        0.93 ±  4%  perf-profile.calltrace.cycles-pp.__hrtimer_rearm_deferred.asm_sysvec_apic_timer_interrupt._raw_spin_unlock_irq.get_signal.arch_do_signal_or_restart
      3.54 ±  6%      -0.6        2.97 ±  2%  perf-profile.calltrace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      4.10 ±  2%      -0.4        3.66 ±  3%  perf-profile.calltrace.cycles-pp.save_xstate_epilog.get_sigframe.x64_setup_rt_frame.arch_do_signal_or_restart.exit_to_user_mode_loop
      1.55 ± 14%      -0.3        1.27 ± 16%  perf-profile.calltrace.cycles-pp.__get_user_nocheck_8.copy_fpstate_to_sigframe.get_sigframe.x64_setup_rt_frame.arch_do_signal_or_restart
      1.00 ± 19%      -0.2        0.76 ±  4%  perf-profile.calltrace.cycles-pp.clockevents_program_event.__hrtimer_rearm_deferred.asm_sysvec_apic_timer_interrupt._raw_spin_unlock_irq.get_signal
      0.68 ±  6%      -0.1        0.57 ±  4%  perf-profile.calltrace.cycles-pp.native_apic_msr_eoi.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt._raw_spin_unlock_irq
      0.70 ±  6%      -0.1        0.60 ±  4%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.__get_user_nocheck_8.copy_fpstate_to_sigframe.get_sigframe.x64_setup_rt_frame
      0.61            +0.0        0.65        perf-profile.calltrace.cycles-pp.fpregs_mark_activate.fpu__clear_user_states.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64
      0.92            +0.0        0.97        perf-profile.calltrace.cycles-pp._copy_to_user.__x64_sys_rt_sigpending.do_syscall_64.entry_SYSCALL_64_after_hwframe.sigpending
      1.08            +0.1        1.14 ±  2%  perf-profile.calltrace.cycles-pp._copy_from_user.restore_sigcontext.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.94            +0.1        1.00 ±  2%  perf-profile.calltrace.cycles-pp._copy_from_user.restore_altstack.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.95            +0.1        1.02        perf-profile.calltrace.cycles-pp.set_current_blocked.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.58            +0.1        1.65 ±  2%  perf-profile.calltrace.cycles-pp.__get_user_nocheck_8.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.25 ±  2%      +0.1        1.33 ±  2%  perf-profile.calltrace.cycles-pp.signal_setup_done.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.86            +0.1        1.96        perf-profile.calltrace.cycles-pp.clear_bhb_loop
      1.50            +0.1        1.60        perf-profile.calltrace.cycles-pp.restore_altstack.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.94            +0.1        2.04        perf-profile.calltrace.cycles-pp.clear_bhb_loop.sigpending
      2.12            +0.1        2.24        perf-profile.calltrace.cycles-pp.__x64_sys_rt_sigpending.do_syscall_64.entry_SYSCALL_64_after_hwframe.sigpending
      2.54 ±  2%      +0.1        2.68        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.stress_timermix_timer_action
      3.22            +0.2        3.38        perf-profile.calltrace.cycles-pp.fpu__clear_user_states.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
      4.06 ±  2%      +0.3        4.33 ±  2%  perf-profile.calltrace.cycles-pp.__restore_fpregs_from_user.restore_fpregs_from_user.fpu__restore_sig.restore_sigcontext.__x64_sys_rt_sigreturn
      1.74 ± 13%      +0.3        2.03 ±  2%  perf-profile.calltrace.cycles-pp.check_xstate_in_sigframe.__fpu_restore_sig.fpu__restore_sig.restore_sigcontext.__x64_sys_rt_sigreturn
      1.89 ± 13%      +0.3        2.21 ±  2%  perf-profile.calltrace.cycles-pp.__fpu_restore_sig.fpu__restore_sig.restore_sigcontext.__x64_sys_rt_sigreturn.do_syscall_64
      4.88 ±  2%      +0.3        5.20 ±  2%  perf-profile.calltrace.cycles-pp.restore_fpregs_from_user.fpu__restore_sig.restore_sigcontext.__x64_sys_rt_sigreturn.do_syscall_64
      6.14 ±  2%      +0.3        6.47 ±  2%  perf-profile.calltrace.cycles-pp.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.09 ±223%      +0.4        0.53 ±  4%  perf-profile.calltrace.cycles-pp.__get_user_nocheck_4.check_xstate_in_sigframe.__fpu_restore_sig.fpu__restore_sig.restore_sigcontext
      7.20 ±  2%      +0.5        7.70 ±  2%  perf-profile.calltrace.cycles-pp.fpu__restore_sig.restore_sigcontext.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      5.08 ±  6%      +0.6        5.71 ±  4%  perf-profile.calltrace.cycles-pp.restore_sigcontext.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_timermix_itimer_action
      5.16 ±  6%      +0.6        5.80 ±  4%  perf-profile.calltrace.cycles-pp.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_timermix_itimer_action
      0.00            +0.7        0.73 ±  4%  perf-profile.calltrace.cycles-pp.__hrtimer_start_range_ns.hrtimer_start_range_ns_user.posixtimer_deliver_signal.dequeue_signal.get_signal
      8.33 ±  2%      +1.4        9.75 ±  3%  perf-profile.calltrace.cycles-pp.posixtimer_deliver_signal.dequeue_signal.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop
      9.56 ±  2%      +1.5       11.04 ±  3%  perf-profile.calltrace.cycles-pp.dequeue_signal.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64
      0.00            +2.5        2.55 ±  2%  perf-profile.calltrace.cycles-pp.clockevents_program_event.hrtimer_start_range_ns_user.posixtimer_deliver_signal.dequeue_signal.get_signal
      0.00            +5.9        5.88 ±  2%  perf-profile.calltrace.cycles-pp.hrtimer_start_range_ns_user.posixtimer_deliver_signal.dequeue_signal.get_signal.arch_do_signal_or_restart
      7.27            -5.7        1.56        perf-profile.children.cycles-pp.common_hrtimer_rearm
      5.66            -5.7        0.00        perf-profile.children.cycles-pp.hrtimer_start_range_ns
     28.66            -4.1       24.51        perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
     16.54            -3.2       13.29        perf-profile.children.cycles-pp._raw_spin_unlock_irq
     15.41            -2.2       13.18        perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
     66.67            -2.0       64.63        perf-profile.children.cycles-pp.arch_do_signal_or_restart
     67.05            -2.0       65.03        perf-profile.children.cycles-pp.exit_to_user_mode_loop
     12.68            -1.8       10.85        perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
     28.28            -1.6       26.66        perf-profile.children.cycles-pp.get_signal
      9.56            -1.4        8.18        perf-profile.children.cycles-pp.hrtimer_interrupt
      6.42            -1.0        5.41        perf-profile.children.cycles-pp.clockevents_program_event
      5.92            -0.8        5.06        perf-profile.children.cycles-pp.__hrtimer_run_queues
     28.25            -0.8       27.44        perf-profile.children.cycles-pp.get_sigframe
     86.00            -0.8       85.22        perf-profile.children.cycles-pp.do_syscall_64
     86.55            -0.8       85.80        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     32.54            -0.7       31.85        perf-profile.children.cycles-pp.x64_setup_rt_frame
      4.02            -0.6        3.43        perf-profile.children.cycles-pp.posix_timer_fn
      4.68 ±  3%      -0.6        4.10 ±  2%  perf-profile.children.cycles-pp.save_xstate_epilog
      3.77            -0.5        3.24        perf-profile.children.cycles-pp.__hrtimer_rearm_deferred
     19.59            -0.5       19.07        perf-profile.children.cycles-pp.copy_fpstate_to_sigframe
      8.64            -0.4        8.24        perf-profile.children.cycles-pp.native_irq_return_iret
      2.11 ±  3%      -0.4        1.74 ±  2%  perf-profile.children.cycles-pp.__put_user_nocheck_4
      2.56            -0.4        2.20        perf-profile.children.cycles-pp.native_apic_msr_eoi
      1.83            -0.3        1.56        perf-profile.children.cycles-pp.ktime_get_update_offsets_now
      1.72            -0.3        1.46        perf-profile.children.cycles-pp.irqtime_account_irq
      2.15            -0.3        1.90        perf-profile.children.cycles-pp.__put_user_nocheck_8
      4.81            -0.2        4.57        perf-profile.children.cycles-pp.__get_user_nocheck_8
      1.30            -0.2        1.11        perf-profile.children.cycles-pp.sched_clock_cpu
      1.34            -0.2        1.14        perf-profile.children.cycles-pp.__irq_exit_rcu
      1.13            -0.2        0.96        perf-profile.children.cycles-pp.sched_clock
      0.90            -0.1        0.76        perf-profile.children.cycles-pp.native_sched_clock
      0.65            -0.1        0.53        perf-profile.children.cycles-pp.ktime_expiry_to_cycles
      0.88 ±  2%      -0.1        0.78        perf-profile.children.cycles-pp.__local_bh_enable_ip
      0.23            -0.1        0.13        perf-profile.children.cycles-pp.hrtimer_reprogram
      0.53            -0.1        0.44        perf-profile.children.cycles-pp.hrtimer_update_next_event
      0.53 ±  2%      -0.1        0.45 ±  2%  perf-profile.children.cycles-pp.irqentry_exit
      0.34            -0.1        0.26        perf-profile.children.cycles-pp.tick_program_event
      1.90            -0.1        1.82        perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      0.52            -0.1        0.45        perf-profile.children.cycles-pp.error_entry
      0.63            -0.0        0.60        perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      0.20            -0.0        0.17 ±  2%  perf-profile.children.cycles-pp.hrtimer_bases_first
      0.17 ±  2%      -0.0        0.15 ±  2%  perf-profile.children.cycles-pp.irq_enter_rcu
      0.10 ±  5%      -0.0        0.07 ±  6%  perf-profile.children.cycles-pp.__hrtimer_reprogram
      0.13 ±  3%      -0.0        0.12 ±  4%  perf-profile.children.cycles-pp.sched_core_idle_cpu
      0.16            -0.0        0.14 ±  2%  perf-profile.children.cycles-pp.restore_regs_and_return_to_kernel
      0.12 ±  4%      -0.0        0.11        perf-profile.children.cycles-pp.irqentry_enter
      0.21            +0.0        0.22        perf-profile.children.cycles-pp.__irqentry_text_end
      0.41            +0.0        0.42        perf-profile.children.cycles-pp.hrtimer_forward
      0.30 ±  2%      +0.0        0.32 ±  2%  perf-profile.children.cycles-pp.__check_object_size
      0.14 ±  2%      +0.0        0.16 ±  3%  perf-profile.children.cycles-pp.rb_erase
      0.29            +0.0        0.31        perf-profile.children.cycles-pp.try_to_wake_up
      0.29            +0.0        0.31        perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.37            +0.0        0.39        perf-profile.children.cycles-pp.timerqueue_linked_add
      0.26            +0.0        0.28        perf-profile.children.cycles-pp.do_sigaltstack
      0.29            +0.0        0.31 ±  2%  perf-profile.children.cycles-pp.posixtimer_queue_sigqueue
      0.44            +0.0        0.47        perf-profile.children.cycles-pp.ktime_get_with_offset
      0.37            +0.0        0.39        perf-profile.children.cycles-pp.x64_sys_call
      0.37            +0.0        0.39        perf-profile.children.cycles-pp.prepare_signal
      0.44 ±  3%      +0.0        0.47 ±  4%  perf-profile.children.cycles-pp.collect_signal
      3.29            +0.0        3.32        perf-profile.children.cycles-pp.its_return_thunk
      0.51            +0.0        0.54        perf-profile.children.cycles-pp.prandom_u32_state
      0.65            +0.0        0.68        perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      2.06            +0.0        2.09        perf-profile.children.cycles-pp._raw_spin_lock_irq
      0.74            +0.0        0.79        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.60 ±  2%      +0.1        0.65        perf-profile.children.cycles-pp.fpu__alloc_mathframe
      1.09            +0.1        1.14        perf-profile.children.cycles-pp.__hrtimer_start_range_ns
      0.31            +0.1        0.36        perf-profile.children.cycles-pp.rb_erase_linked
      0.75            +0.1        0.81        perf-profile.children.cycles-pp.__get_user_nocheck_4
      1.08            +0.1        1.14        perf-profile.children.cycles-pp.complete_signal
      1.06            +0.1        1.13        perf-profile.children.cycles-pp.fpregs_mark_activate
      1.96            +0.1        2.03        perf-profile.children.cycles-pp.copy_siginfo_to_user
      1.04            +0.1        1.11        perf-profile.children.cycles-pp.set_current_blocked
      1.91            +0.1        1.98        perf-profile.children.cycles-pp._copy_to_user
      1.14            +0.1        1.22        perf-profile.children.cycles-pp.recalc_sigpending
      1.23 ±  2%      +0.1        1.31 ±  2%  perf-profile.children.cycles-pp.rep_stos_alternative
      1.36            +0.1        1.44        perf-profile.children.cycles-pp.signal_setup_done
      0.57            +0.1        0.66        perf-profile.children.cycles-pp.__remove_hrtimer
      1.59            +0.1        1.70        perf-profile.children.cycles-pp.restore_altstack
      2.05            +0.1        2.17        perf-profile.children.cycles-pp.entry_SYSCALL_64
      2.26            +0.1        2.38        perf-profile.children.cycles-pp.__x64_sys_rt_sigpending
      2.10            +0.1        2.23        perf-profile.children.cycles-pp._copy_from_user
      2.03            +0.2        2.20        perf-profile.children.cycles-pp.check_xstate_in_sigframe
      2.21            +0.2        2.39        perf-profile.children.cycles-pp.__fpu_restore_sig
      3.48            +0.2        3.66        perf-profile.children.cycles-pp.fpu__clear_user_states
      3.88            +0.2        4.08        perf-profile.children.cycles-pp.clear_bhb_loop
      3.27            +0.2        3.51        perf-profile.children.cycles-pp.posixtimer_send_sigqueue
      4.34            +0.3        4.63        perf-profile.children.cycles-pp.__restore_fpregs_from_user
      5.26            +0.4        5.61        perf-profile.children.cycles-pp.restore_fpregs_from_user
      7.66            +0.5        8.21        perf-profile.children.cycles-pp.fpu__restore_sig
      9.35            +0.7       10.00        perf-profile.children.cycles-pp.restore_sigcontext
      0.41            +0.9        1.26        perf-profile.children.cycles-pp.ktime_get
     14.28            +1.0       15.24        perf-profile.children.cycles-pp.__x64_sys_rt_sigreturn
      8.99            +1.5       10.52        perf-profile.children.cycles-pp.posixtimer_deliver_signal
     10.19            +1.6       11.81        perf-profile.children.cycles-pp.dequeue_signal
      0.00            +6.4        6.40        perf-profile.children.cycles-pp.hrtimer_start_range_ns_user
      5.78            -0.9        4.88        perf-profile.self.cycles-pp.clockevents_program_event
      4.66            -0.8        3.84        perf-profile.self.cycles-pp._raw_spin_unlock_irq
      8.64            -0.4        8.24        perf-profile.self.cycles-pp.native_irq_return_iret
      2.54            -0.4        2.18        perf-profile.self.cycles-pp.native_apic_msr_eoi
      1.78            -0.3        1.52        perf-profile.self.cycles-pp.ktime_get_update_offsets_now
      0.86            -0.1        0.73        perf-profile.self.cycles-pp.native_sched_clock
      0.85            -0.1        0.72        perf-profile.self.cycles-pp.hrtimer_interrupt
      0.60            -0.1        0.49        perf-profile.self.cycles-pp.ktime_expiry_to_cycles
      0.75            -0.1        0.65        perf-profile.self.cycles-pp.__hrtimer_run_queues
      0.19            -0.1        0.11 ±  3%  perf-profile.self.cycles-pp.hrtimer_reprogram
      1.78            -0.1        1.71        perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.49            -0.1        0.42        perf-profile.self.cycles-pp.irqentry_exit
      0.30            -0.1        0.23 ±  2%  perf-profile.self.cycles-pp.tick_program_event
      0.49            -0.1        0.43        perf-profile.self.cycles-pp.error_entry
      0.45            -0.1        0.39        perf-profile.self.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.40            -0.1        0.34        perf-profile.self.cycles-pp.irqtime_account_irq
      1.35            -0.1        1.30        perf-profile.self.cycles-pp.__put_user_nocheck_4
      0.33            -0.1        0.28        perf-profile.self.cycles-pp.hrtimer_update_next_event
      0.38            -0.1        0.33        perf-profile.self.cycles-pp.sysvec_apic_timer_interrupt
      1.44            -0.0        1.39        perf-profile.self.cycles-pp.save_xstate_epilog
      0.32            -0.0        0.28        perf-profile.self.cycles-pp.__sysvec_apic_timer_interrupt
      0.26            -0.0        0.22        perf-profile.self.cycles-pp.__irq_exit_rcu
      0.22 ±  2%      -0.0        0.18 ±  2%  perf-profile.self.cycles-pp.common_hrtimer_rearm
      0.22            -0.0        0.19 ±  2%  perf-profile.self.cycles-pp.posix_timer_fn
      0.18 ±  2%      -0.0        0.15 ±  3%  perf-profile.self.cycles-pp.hrtimer_bases_first
      0.49            -0.0        0.46        perf-profile.self.cycles-pp._raw_spin_unlock_irqrestore
      0.19            -0.0        0.16 ±  2%  perf-profile.self.cycles-pp.__hrtimer_rearm_deferred
      0.18 ±  2%      -0.0        0.15        perf-profile.self.cycles-pp.sched_clock_cpu
      0.18            -0.0        0.16 ±  2%  perf-profile.self.cycles-pp.sched_clock
      0.12 ±  3%      -0.0        0.10        perf-profile.self.cycles-pp.restore_regs_and_return_to_kernel
      0.10 ±  4%      -0.0        0.09        perf-profile.self.cycles-pp.irqentry_enter
      0.10 ±  4%      -0.0        0.09        perf-profile.self.cycles-pp.sched_core_idle_cpu
      0.07 ±  5%      -0.0        0.06        perf-profile.self.cycles-pp.__hrtimer_reprogram
      0.09            -0.0        0.08        perf-profile.self.cycles-pp.irq_enter_rcu
      0.19            +0.0        0.20        perf-profile.self.cycles-pp.__irqentry_text_end
      0.18            +0.0        0.19 ±  2%  perf-profile.self.cycles-pp.set_current_blocked
      0.12 ±  4%      +0.0        0.13        perf-profile.self.cycles-pp.rb_erase
      0.18 ±  2%      +0.0        0.19        perf-profile.self.cycles-pp.__fpu_restore_sig
      0.16 ±  3%      +0.0        0.17        perf-profile.self.cycles-pp.kick_process
      0.28            +0.0        0.29        perf-profile.self.cycles-pp.restore_altstack
      0.24 ±  2%      +0.0        0.25        perf-profile.self.cycles-pp.do_sigaltstack
      0.30            +0.0        0.32        perf-profile.self.cycles-pp.fpu__alloc_mathframe
      0.21            +0.0        0.23        perf-profile.self.cycles-pp.fpu__restore_sig
      0.36            +0.0        0.38        perf-profile.self.cycles-pp.hrtimer_forward
      0.27            +0.0        0.29        perf-profile.self.cycles-pp.timerqueue_linked_add
      0.27            +0.0        0.29        perf-profile.self.cycles-pp.try_to_wake_up
      0.29            +0.0        0.31        perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.27            +0.0        0.29        perf-profile.self.cycles-pp.signal_setup_done
      0.26            +0.0        0.28        perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.35            +0.0        0.37        perf-profile.self.cycles-pp.exit_to_user_mode_loop
      0.12            +0.0        0.14        perf-profile.self.cycles-pp.sigismember
      0.32            +0.0        0.34        perf-profile.self.cycles-pp.x64_sys_call
      0.54            +0.0        0.56        perf-profile.self.cycles-pp.arch_do_signal_or_restart
      0.39            +0.0        0.41        perf-profile.self.cycles-pp.dequeue_signal
      0.25            +0.0        0.27 ±  2%  perf-profile.self.cycles-pp.posixtimer_queue_sigqueue
      0.44            +0.0        0.46        perf-profile.self.cycles-pp.ktime_get_with_offset
      0.35            +0.0        0.37        perf-profile.self.cycles-pp.prepare_signal
      0.65            +0.0        0.67        perf-profile.self.cycles-pp.__hrtimer_start_range_ns
      0.47            +0.0        0.49        perf-profile.self.cycles-pp.prandom_u32_state
      0.37            +0.0        0.40        perf-profile.self.cycles-pp.restore_fpregs_from_user
      0.54            +0.0        0.57        perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.56            +0.0        0.59        perf-profile.self.cycles-pp.__x64_sys_rt_sigreturn
      0.48            +0.0        0.52        perf-profile.self.cycles-pp.__x64_sys_rt_sigpending
      0.42 ±  3%      +0.0        0.45 ±  4%  perf-profile.self.cycles-pp.collect_signal
      0.16            +0.0        0.19        perf-profile.self.cycles-pp.rb_erase_linked
      0.56            +0.0        0.59        perf-profile.self.cycles-pp.rep_stos_alternative
      0.26            +0.0        0.30        perf-profile.self.cycles-pp.__remove_hrtimer
      0.58            +0.0        0.61        perf-profile.self.cycles-pp.complete_signal
      1.91            +0.0        1.94        perf-profile.self.cycles-pp._raw_spin_lock_irq
      0.71            +0.0        0.75        perf-profile.self.cycles-pp.copy_siginfo_to_user
      0.48            +0.0        0.52        perf-profile.self.cycles-pp.restore_sigcontext
      0.72            +0.0        0.77        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.88            +0.0        0.93        perf-profile.self.cycles-pp.entry_SYSCALL_64
      1.36            +0.0        1.41        perf-profile.self.cycles-pp.get_signal
      1.80            +0.1        1.86        perf-profile.self.cycles-pp.its_return_thunk
      3.51            +0.1        3.56        perf-profile.self.cycles-pp.__get_user_nocheck_8
      0.73            +0.1        0.79        perf-profile.self.cycles-pp.__get_user_nocheck_4
      0.85            +0.1        0.91        perf-profile.self.cycles-pp.fpregs_mark_activate
      1.28            +0.1        1.35        perf-profile.self.cycles-pp.do_syscall_64
      0.79            +0.1        0.86        perf-profile.self.cycles-pp.posixtimer_deliver_signal
      1.24            +0.1        1.31        perf-profile.self.cycles-pp.sigpending
      0.79            +0.1        0.86        perf-profile.self.cycles-pp.posixtimer_send_sigqueue
      1.08            +0.1        1.16        perf-profile.self.cycles-pp.recalc_sigpending
      1.79            +0.1        1.87        perf-profile.self.cycles-pp._copy_to_user
      1.18            +0.1        1.28        perf-profile.self.cycles-pp.check_xstate_in_sigframe
      1.76            +0.1        1.87        perf-profile.self.cycles-pp.get_sigframe
      2.05            +0.1        2.18        perf-profile.self.cycles-pp._copy_from_user
      2.88            +0.2        3.04        perf-profile.self.cycles-pp.fpu__clear_user_states
      3.84            +0.2        4.04        perf-profile.self.cycles-pp.clear_bhb_loop
      6.77            +0.3        7.04        perf-profile.self.cycles-pp.copy_fpstate_to_sigframe
      4.30            +0.3        4.59        perf-profile.self.cycles-pp.__restore_fpregs_from_user
      0.00            +0.7        0.65        perf-profile.self.cycles-pp.hrtimer_start_range_ns_user
      0.40            +0.8        1.23        perf-profile.self.cycles-pp.ktime_get




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

