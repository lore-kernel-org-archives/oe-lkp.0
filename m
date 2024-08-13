Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB6E3AC0D
	for <oe-lkp@lists.linux.dev>; Tue, 13 Aug 2024 06:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723529075; cv=fail; b=uTdvdA8gOYKZxBuktywD74ElCPch+CVlPatUQcjYzTSw0dbVyBepOo27rf72qNfIBhu+TGPK/BBOeixPsCHrG+Sk6c1slvV7i1vClk8GdRIs+G4y/1JN1OnRCWBgpuvOWL03xPzi5EwHoNr4nTje/WGyGjx+bbBuosI2faetIkM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723529075; c=relaxed/simple;
	bh=AaiyMEpwXYQZS2npD7QGdiI0vqHzJKLqEDEfaN8rl/E=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=cBLYqHIZZbJg8PiOWyb+qjas97DqR1oUJ5oKUC4nPcu62/pj8KqfAHI9/mLexAw8HwaoWDhRhn1bGOLIlvKf332kSd+TwOtVzpQRTLeOtwiMJudwT1sMyzizPHlkKLk35aQeb+PEiXUbCloASjicot+zAf/seNbCFr96TsqcNaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FSo5RaKu; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FSo5RaKu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723529074; x=1755065074;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AaiyMEpwXYQZS2npD7QGdiI0vqHzJKLqEDEfaN8rl/E=;
  b=FSo5RaKufz/p8ZiJ0RP9jO1cxPAb//TVOZSgX/HMU5HJrw0/+c3el7P6
   D+TDxBwCQWp6gDfHzIlmN8U0fxW6V3+vbtBW95pcv4waujsF/+MswAkzS
   7amdmeOL8HVIJXiGe/3lg1pRYytLXQmjufQ8wKL4sB3nWFtSKKBVKplal
   qaCsVXb7roxBlD5yXtU7tRRBZp327Jq6NsslbJ7RYFRKJEyIVTt6zUG9z
   u3l+KtcdlQ4UqijGRxNbaWnmvSk9wOqdqZstzDCt2LMkTltyzJO008qmc
   telVXOBy6beapYFQC4fKBxf+sWi0NKOj+l396abzExWbtphlXrcfcM8EP
   Q==;
X-CSE-ConnectionGUID: C8tWcq3nSbSXWhss48KRPQ==
X-CSE-MsgGUID: hSBAEeQKQlqdTg2oeFDaDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21643401"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="21643401"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 23:04:31 -0700
X-CSE-ConnectionGUID: 2GXpilRNRiGoi4WKIWewRA==
X-CSE-MsgGUID: K6sPqFxIQ5OGBXklOG/3QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="58488393"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Aug 2024 23:04:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 Aug 2024 23:04:29 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 12 Aug 2024 23:04:29 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 12 Aug 2024 23:04:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mjmX3SRPV0jQWRLKC3ItBSNzAl2A4lHG8WTL/kTihggJQRF6GcaBIHtX4qvjrl8WUYc9KgCxCz2YzdHXj/S5OPPUtTRX0A9sOr2uTF5UeJB26W13p8UJf5A+fxULfeuFCS8npJ4lQ/mANMzOLikbeZ2vxK1auF8lznETwl5qkRh6GjQW3IaYE+EwS4Z2ahTAKvXKHhlNF2OSN6wsvDuOQ4BcQ/xHP/tdRvdhYraC66N/iymJh2z/fa06xH36tw1nHer4Y2pj4Q5oH4UNA4EezXlQwG+26vKd5cZLqeeJvcHN1YQp5U8VbZ8K+9MeUVqu2AIGAWKaGzPGkbdZ471NSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O5XRolj4OW0+Scsk0S7vPliH+iw9ttns4Sx9GD3p4jI=;
 b=QQgSrSN1YjhJ3s8kav3BjCbYQeJzBtO/9n/yyOzI8X6pxk9xT4vVNQ02QBi7L9v9hulVIv+MHUi1kSxQqNiQrRIuAEge3oZe9GSRfFRuZ6wtEOF3MdX6AAl2Ztn9PWg78N/xdO+ui47y/Y+zavI5SpzEXW3hQCbw1LtAzcuwj1HrKjx6UC4nIn6pgC5rXtnbMeKkMEJ1dSBgG4ylCI8HkYCZYqFZ/wXiL1b3s3AD4FlFiRCVCaib6swmR6Ik//Aps+21wgJnyMIWMJY1gfKRbs2YbwqfhbVzslI9C5R8Y2zpbC3r8PafNupX2VFLk0dj1hUCJrqAspzNMmGKdKRLBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SA3PR11MB7654.namprd11.prod.outlook.com (2603:10b6:806:305::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.32; Tue, 13 Aug
 2024 06:04:27 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.7828.023; Tue, 13 Aug 2024
 06:04:26 +0000
Date: Tue, 13 Aug 2024 14:04:17 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [tglx-devel:timers/ptp/timekeeping] [timekeeping]  3b5abae994:
 ltp.stime01.fail
Message-ID: <202408121625.e5629d93-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR02CA0084.apcprd02.prod.outlook.com
 (2603:1096:4:90::24) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SA3PR11MB7654:EE_
X-MS-Office365-Filtering-Correlation-Id: 40cadd9e-1e94-46a4-f43d-08dcbb5dc966
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dcn+zFMQzoxr3RnEWW1T16WvMLEa+UIRNyUVK/na6owceYgZWvYXpHEU43YG?=
 =?us-ascii?Q?ZTfQNB099ssrh98xnunVSZr3GBzzXtaBk61qKrhOu+To48j8FQdUFhAQC3JV?=
 =?us-ascii?Q?eeJOZNpOsqQfbx7Ekdrlib5vOOxDHib1MA/ssUmuuJ6Ve9QnfzxxRSx59zLF?=
 =?us-ascii?Q?+My9vw7fN0/Sk+WPXrftZKVbm+Yv6B7P4YtKdwjUlx/+a6ULmadgsWReSq3B?=
 =?us-ascii?Q?1m7z5mGwX8fx5SD6tWuDzrCHIqJEI8Ve7eKVU5PXXlzMGF6Zu5C2u+RgDQyN?=
 =?us-ascii?Q?EPxz5zvLuMtKTRqQgtiHMkK84CaS4S6bYmgfxdrkR6DtGem0UYrJtEoMbQBO?=
 =?us-ascii?Q?vlTTfz9H4e43V26N5UQsSKrEVgY7UybkNkGcM86wDh/YUyfV7mr8phv2RNP7?=
 =?us-ascii?Q?4hHmOn/zUpnJEItVoFfaeJKfCFkBLb2Ia1rQJQMbne6gjjZa222E2UmbBhfd?=
 =?us-ascii?Q?ctq540jQpiXJwjFPa7LezFEI7RCod/yiPP4Vm72Lx5PIEA6UMa2UPnx2UUnI?=
 =?us-ascii?Q?xSuqhlm11EV1Z7Wm1gnMPGQiH0ME6qpSXxbD76Kr8e2eVBW5o10QwxavLPd+?=
 =?us-ascii?Q?jwtZSiVJlJlR0Be6MtkiIWxjI/KAZGaXbi49Gkr3CqwVcItym4jzSDgMonuy?=
 =?us-ascii?Q?h4RU3MtXsN7hFl2CCoM4GbnkkpY7TvGOmdxBZe6g/FzkjdGNMkUv8YHhMqWf?=
 =?us-ascii?Q?DQGaGE0H5VHsL0mn09Zg/lFbjNZI64DINoRSC4PL5g1s86PPWYukxrrnWfCk?=
 =?us-ascii?Q?q+AaooYN26+vyzF8ZfDS7vguMXIj0NsimWuIPTDHvqSxa8BcGsjghKrkkWoC?=
 =?us-ascii?Q?5qiZd8Orhs5hzcNwuJU3otof9K+7y0Sv0sdZSXCAYMIOu0fDihSl+lqgMmyS?=
 =?us-ascii?Q?AYnWsL82czcidfqXLEK55VGQWvewmxq7tDlOrNXuNPLDX+VAqSkfrQsv955p?=
 =?us-ascii?Q?aSLvKGE7YEDD9TP6LCnSLvEOBQJyGZm54Y0xI3MdEtybJwS6V3/0xtzYTOTY?=
 =?us-ascii?Q?x6qERSQTpKKsHgwUyslWOzn9k76bwA1MUpapNk8BfhM32wxVuziG7Je2ez4D?=
 =?us-ascii?Q?dtkXRM6YbRoaaAD98E8k2Ozxvkbshx6ET/gQ1/Xc4Fbg9yd4CBAxPx8GPCiB?=
 =?us-ascii?Q?5y5nVsXBucp4moQ07CUdOgRATxkKzHYLmf4pzXUAPlAku71kAvPYBnH53iJE?=
 =?us-ascii?Q?4vp1f4BDuwZczr6k+ddcJyxsA8LsnlOYtV0jBu/0J7JxlxFnk0bWwKhoQaw7?=
 =?us-ascii?Q?dvtRwjkA94IeWFpPo+419wHJbCUAvOcuKo7QVGgsL3lB8RYa+FGdVHU3VU+t?=
 =?us-ascii?Q?ofJdGjcILh0WieRURJoI5fFD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?40G6cErGIlgV2a4yTbwKG0N6ii+lVHzG9AFqYkt/ZEObUMjNrHvN6UetpBtv?=
 =?us-ascii?Q?oYSAhWV8e8LTr6YsMoDgq5iftaxWTZcZgKMrKk0RvmHkDYg/yLYY99rOka+k?=
 =?us-ascii?Q?eVYfqnkFGU4rev0xwJALOXx4UUjkx17O/42UiskuP90VWtNKGQMRWCyevuaZ?=
 =?us-ascii?Q?adzrEAW1prBsr3/Ojcn2MFkJUS/w1sCOR90r/4VF+T/KXa3N1u75+hlLpfHu?=
 =?us-ascii?Q?fSSeHw+4wVjlzcnwpr72HpoGvgZb5Bn+aV2pNjWQvxmQ8kIo78eg62gsHv/1?=
 =?us-ascii?Q?66L8jQ9HE9+igNrc8Uxsur5pIMs2qACPJ0/ksRPywcexzmK3ORSijkl9Ly77?=
 =?us-ascii?Q?/4aKtwai3tjmsmh3vzC5bqPYRqgGXIK7c+4K1aCNBFxhh0d/1SMj508ocFys?=
 =?us-ascii?Q?F9/UXhn1zEsvXvxdjotqfr01G6epPLZqdkedWy8oujg5Owpi+/GCOSYkgC97?=
 =?us-ascii?Q?R4cSwg/LBXbZOFZuZDEAspZ/8jl4WzthNR3vjw478hhorq1GABqNYnmA+/QZ?=
 =?us-ascii?Q?Vs/h3wdH3KU5qPqPVv/pghSXpIUz1gGtfXI2vX8pTYjExx+DldjSTc8leSAA?=
 =?us-ascii?Q?RRgTqf/Ml4acaSy0sHJi/V8gDVwpONuONN0M9Cax65tzVPT7++SLjdrYc61+?=
 =?us-ascii?Q?8/FIQx6wNkhzk9/HOvZJWTZxSMfZyAK9jCHWvnccGDdkhrRBG0c9O7bldygo?=
 =?us-ascii?Q?0rVFcZNVv/V+56FEO4tDAtZfaC+G3tWythEu88w1yWj0zT3DPeR3U3folUxE?=
 =?us-ascii?Q?IR1OWcs3Ku1HUSbip9DSD7GXFFpYXeaKvdbrFoQS31cZgUo9WidUHDEVdw5Z?=
 =?us-ascii?Q?bxBJF/Uwa1YiZf88N3s8izdEdF9oeDEBKqC8kqNABRqqbrg0Ii6UKqIrjlyb?=
 =?us-ascii?Q?LhNQLdvfB1Sx3LX7BR+veLo3Mpvmdy3eoTVziOqrg4vORxUypb3wq5I4iIJG?=
 =?us-ascii?Q?tSSeZ1mDFse8p3GlsbsLoKdTOd2SCyfjH7v+bjCRD7JGY1Gekt54HdUXwJ6o?=
 =?us-ascii?Q?YtzmMJMlOhUw6BZ0EsULUGh4h8WOFSAMYcaBPfS9NtcWV4En2OyGJC/mpcIg?=
 =?us-ascii?Q?y24crHocZK8/pkVb36OB/FazKMuXo2dOstTXFhpwTImIEj6fu7w3QcLY10+r?=
 =?us-ascii?Q?qvtfVxseILLt5q/waeb4n00nWNoVZcHBFQ6Z1LrZOb0eQ2YYHbC6q4MeIiRa?=
 =?us-ascii?Q?TWAwkp3FKC4CYa1d68rFwLEXZNs4bShAauNjmWWd65MmVT8KrdGNow9Bb8HF?=
 =?us-ascii?Q?Wjp1wWBM+c02UHS5Hz3zU+ZF3tC0viXzZZkWu3ZdOu7jwJ1et9RGJou0dk7i?=
 =?us-ascii?Q?gcjZnZ3csjTRkaZuGAON6o+NP8XSGaeW1tf0oCek83KuRbyKDxGQa5Hz54H4?=
 =?us-ascii?Q?/ZAkFGFMi2vntCglOrdEIpEtvbJPgHdhCEttcgh1KWjkU2jYySVxz7HVip9j?=
 =?us-ascii?Q?rIsRpaXYk5+8kuv4cQ7P/QIXRmzXwee3OzuYiZXcY279iADmwI9KVDrzuK4f?=
 =?us-ascii?Q?CD1E2Nl+CUmgvljkqHUPOElrwo3tkSDpUm1h3JJE8tC4jOKs0iZUeCqHxhaZ?=
 =?us-ascii?Q?r/gH6BkewShVEXETC+0x3jFFzjn+g5qkCX1KRPc+strkx9T/VZTN7bryeM+H?=
 =?us-ascii?Q?LQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40cadd9e-1e94-46a4-f43d-08dcbb5dc966
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 06:04:26.5817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: awB8Zy5oLdENIvNc+WYiKHWV9QOahM2Tji7HK6ckw3mNGwKdO2gofMEZP0U+gZcguGYAjhHFUErDmvfd7tfKlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7654
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "ltp.stime01.fail" on:

commit: 3b5abae9942143c5d6ddb0992c73a4c07821158f ("timekeeping: Rework do_settimeofday64() to use shadow_timekeeper")
https://git.kernel.org/cgit/linux/kernel/git/tglx/devel.git timers/ptp/timekeeping

in testcase: ltp
version: ltp-x86_64-14c1f76-1_20240803
with following parameters:

	disk: 1HDD
	fs: xfs
	test: syscalls-06/stime01



compiler: gcc-12
test machine: 4 threads 1 sockets Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz (Ivy Bridge) with 8G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)




If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202408121625.e5629d93-oliver.sang@intel.com


Running tests.......
<<<test_start>>>
tag=stime01 stime=1723284309
cmdline="stime01"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1807: TINFO: LTP version: 20240524-153-g07b265966
tst_test.c:1651: TINFO: Timeout per run is 0h 02m 30s
stime_var.h:46: TINFO: Testing libc stime()
stime_var.h:22: TCONF: libc stime() is not implemented
stime_var.h:49: TINFO: Testing SYS_stime syscall
stime_var.h:28: TCONF: syscall(-1) __NR_stime not supported on your arch
stime_var.h:52: TINFO: Testing SYS_settimeofday syscall
stime01.c:36: TFAIL: stime(1723284339) failed: EINVAL (22)

Summary:
passed   0
failed   1
broken   0
skipped  2
warnings 0
tst_wallclock.c:64: TBROK: tst_clock_settime() realtime failed: EINVAL (22)

Summary:
passed   0
failed   1
broken   1
skipped  2
warnings 0
incrementing stop
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=35 corefile=no
cutime=0 cstime=2
<<<test_end>>>
INFO: ltp-pan reported some tests FAIL
LTP Version: 20240524-153-g07b265966

       ###############################################################

            Done executing testcases.
            LTP Version:  20240524-153-g07b265966
       ###############################################################




The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240812/202408121625.e5629d93-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

