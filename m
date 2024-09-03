Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E9D195
	for <oe-lkp@lists.linux.dev>; Tue,  3 Sep 2024 05:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725340959; cv=fail; b=mm3aBJfbcTjHB/yTXRvljBa7dyBjM6PUtgdGpk1CGNY5P0EE2W4Oq9CulXdb+6jqCxIhKjA14Uo8R330KjzgDZgCns5EuK5YS9F0HkOusravjALkLNGhjohlX86KSLzZtl8BFLWLaqcD0C6vSEUtZFPSsIXXs8dspG+PlSm48RA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725340959; c=relaxed/simple;
	bh=wKuKKnuM2dlI2BsV3dZToXJi41x6C4ma05MpSGTHAFQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=iycuTmHpg3fI6syeBj+O+qTbUX64wEM7eG6jvW1orwnWPbiS5AoUbbUcdlDBR51riiC7AmIQHuVxO8YmbMHvLE+wECpMn241YXzwQ9Gm2Ct7+1NeTh5F4bKtSkFS1+5xqiQJreJUy0uzYwbZ5B1vBlfHiMYgRqbkZwBaII3dy9A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nzovnGGd; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nzovnGGd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725340958; x=1756876958;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wKuKKnuM2dlI2BsV3dZToXJi41x6C4ma05MpSGTHAFQ=;
  b=nzovnGGdQv279bnCNOQVskA/z2wMxrkbma6NA/A+gWFkTQhFSrg+Q2Jd
   ll4TB9+jhmoi6pAx3K+jNjUjp6eHtOkBqtdqPjEbBHBOU6jnO97mctaFC
   cwATX7d30L9y3W6XF8YYMvPqk81l4muzEELFM/TYQlAhKxTcvhszo34ta
   fn7gKHhZ8LLBTm6FgGZNF/V1qTBpG2eF2o/78X+3ZK7JyY3bolTxIYQxp
   5oXl26CfnmvxfUNu/fhEbrGqNs+1gd9lcmjR+u0V1mW64XFl+/vVrct8V
   IGkLK5aLMaZEKU7oOJGWGVRHmJjuesS/fObzTZMvZ0yXAAfAOtCScI4CX
   w==;
X-CSE-ConnectionGUID: ABwOUc9hT+2oJ4Q/0NDohw==
X-CSE-MsgGUID: BuOpRfOJQviK72Jnv2omew==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="35285592"
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; 
   d="scan'208";a="35285592"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 22:22:37 -0700
X-CSE-ConnectionGUID: 9eEtiXJsSK2vCTCnIys7gg==
X-CSE-MsgGUID: zMuI8YXNRNez+qH4RC4PPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; 
   d="scan'208";a="64823002"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 02 Sep 2024 22:22:36 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 2 Sep 2024 22:22:35 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 2 Sep 2024 22:22:35 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 2 Sep 2024 22:22:35 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 2 Sep 2024 22:22:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FI+07/buYLv/ac9zlwoNXuPFI3RcPKDkSw7zoPI7mCdjeCT7IpY3uwN2C+LwW0rWkP5kcwFnp4G1E0a8nlf5m3nEpNAaQkEP6SIk3s3USlZaKN4kDmOqYHhRZMXX7uCmCCdVIOtAtivdLq3LLm9bBjIi+Ke4KBbCUI1/y7JWD5lgurqj9Ra/nmVuS6tcY7KnudqH5PYPr5HQBmpMbpk8j1TgYHdHgtU3ofhhF1sdBfCa+tZpQzhkl+zCy5RtrcWEolTLRt0Oom8B/rV3heN9l0oNM6JskO+OBjG3+CP7HMm6gUwNf+M+rOExZYDamfgXD1wmJZg9Iz9LI0dfI/LFSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ntU5K+RXw13ghgocgU6YTZiNkUzA1hPJPEcmN7ujij8=;
 b=gF938B+pGi/7capBmbPyOMZ4moYB3XBrphciswtNVVFtL5RKEKJp1FQ03nYtlVy3nzaVw2Y27FJQ1opfLa+hYJoHOUd0h3Pz9yzO2MN9LzUNiourdZ/v0ZTQWdrOcST28T1wnTsWaK/9pTdMXGMMZPWoxMjXOftD5gGL19uZeGmc2jQL0OXLy2nihpCUdDV41Hfj9LEBVxDtMqib1da/QRpR49HfRztOc2YteAQDhJFfsPoXJGKDtudcQHjlncS+YqDD9Lz4sAot2RgzkeN3iIuatUMnu3glnhaqpxW9b9F2ozPmFXoPt5mzJrXX+ld5IKFLTPux5qL5W9adrwsDvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MW3PR11MB4700.namprd11.prod.outlook.com (2603:10b6:303:2d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 05:22:33 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.7918.020; Tue, 3 Sep 2024
 05:22:33 +0000
Date: Tue, 3 Sep 2024 13:22:25 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-mm@kvack.org>,
	<oliver.sang@intel.com>
Subject: [vbabka:slub-percpu-sheaves-v1r1] [mm, slub] 000f7cce0f:
 WARNING:inconsistent_lock_state
Message-ID: <202409031302.dba16910-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR01CA0033.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::23) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MW3PR11MB4700:EE_
X-MS-Office365-Filtering-Correlation-Id: 7823916d-2096-4244-6020-08dccbd86a0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yguBMxwhJzk6iGw4OHaBkiN843OdUcWsUce23XjJF8weXkDaMhWWHSxDnthd?=
 =?us-ascii?Q?Jt9P1yz3XpEac9OinvdnhsVss+e6xyAElu+MAFmX3Mel+JVVpgLZPY3Ozyd3?=
 =?us-ascii?Q?g2PZ3KTrl6MMlMGsfAHKolB61MUdsi/dnqQSyrgM29kxvYlowmjLheCSWE3v?=
 =?us-ascii?Q?LgECWm3p2CjjPB08HXzOvQBKf71ipImmH5gggVWiuiOM2bGkRKf8QsTpdx0C?=
 =?us-ascii?Q?MZnR38Nfde9+1FrhtQw05A3vyycmgypP4Ff2vCSSqA4q6Er9JzOdBMSQJxlV?=
 =?us-ascii?Q?ACI7YK12BokmPBA7PXaF2oc23WTx/gLGGbOVQDbl11x/aEX85OGnaFQiDIIM?=
 =?us-ascii?Q?gY0Ns5UBAaOQVleSuP4h9RT7EapmKD/DoMH1fIt7yzG8a/MtYj6DFg6Zu0Ze?=
 =?us-ascii?Q?/ZUJdAOWAZwfasXmKBBsx5jBQoKiUZKNLiQsTo6urptxXCEbNKldw5grzf6w?=
 =?us-ascii?Q?g7LuYUy4Ko6cb2W93g5BG3129H8ZGsR1tzcgi5fcw5rzb9j8UjUPcj+dfOVN?=
 =?us-ascii?Q?AIN7Ub8/5VMvawRt49f0mTpwDSbYnKXr8kbGlOvFXa58PZq9xylzm5aG1zgs?=
 =?us-ascii?Q?PTRoGpfGfi53vTnqXGE0A53lxgiD4YLlBOQV82SwAmUyj8U+o5RIcCoo6nCt?=
 =?us-ascii?Q?Pf191jiEJzMOkwxuT2BlSMav+SRE2UB6UdKHul3OywRKkJPAYTD12ngtssYo?=
 =?us-ascii?Q?IEe6AN2qxWDwR8ubPU0p5DS7OLp3HuhdoI1sK9S7VNv8fSw5sOYypqy60SLZ?=
 =?us-ascii?Q?/pZg0kLiuYCdBKgXyu3g2+El2BEs6gyR+9WdVpOoyZhTSucjtzOp1Md7BnYH?=
 =?us-ascii?Q?yW/0KhS+LNAnQjNwJEYX3jzlYf0zXKTTG5SsKg8KUTSsqntbPb1ujeCGYdE3?=
 =?us-ascii?Q?q05oHtkpsJ0/HcM4FqF0UkactVNhvwe3Zb2W6DKvRPEnIOASGcx5rNJBwsUw?=
 =?us-ascii?Q?ftSmT9Er6TPbMVSEFvKME/Jw+igm6s309tep+pcz8x93XmtGL+Or9S5GLq9k?=
 =?us-ascii?Q?JeCTxm1yWxP70MpnRxx12pIeOV4ZkHmj1cbgy3uFXcgELilYJ3S983D6S41y?=
 =?us-ascii?Q?K6euGhbuSpX64QZMzN3P+9X4YohZNx3vQaywXZ89mZTBERBWDDrPIsrf4hOE?=
 =?us-ascii?Q?pzf5rIdQDKCjaRrZ10D5UUyVBNW6/dt65NfYfrwSpA1mw+yRww7gdviRcLj7?=
 =?us-ascii?Q?lnk5PZVbtjhklrao3bPZ/iPhYt9jL1elKAntOpSmSSFYZgXSoXb3gER1oJsV?=
 =?us-ascii?Q?T1RqAhR1hAG84+8xcaC0ZoF+Y+DQa93ilCOpYMXV9B8bLIMCEa3vjj8zIbZb?=
 =?us-ascii?Q?uscGC4eCwl4VAGkB5M4QcyLd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?psz+NbOf6tXVR1TsnLc9GhSsn5mXYI+5Q8Y5UiIG+0sfYFqgT1RbrLfis2xd?=
 =?us-ascii?Q?/TBn9ImMf6/WAY7l7Uxiuxziu4tkkE1GrK4MPNosyZSDFpZaSFF5ndq0+NdA?=
 =?us-ascii?Q?H8BRs6tKxuOKAO/QPKYK7FCL5UuZiAcShP74iWQsmAyoRFKYhMW17AvtDbeZ?=
 =?us-ascii?Q?PMLPJNcdJCy0P4rFQBsUu3MUM1i0oNMV1BfJ34S5Q/hLmuWxuR8+CO/ooy8e?=
 =?us-ascii?Q?QNZksti1YRyTcsvsd8ESW5j4MJpKOLcoYMlyLPzdQdk3U2kKdCbfjmYEeqwG?=
 =?us-ascii?Q?+1lbxKWrdx+PgZ0FV9/XKKyis/blRMWlSduKNZ6dBPAK0b8dKNVBYEpjmNZX?=
 =?us-ascii?Q?lBUAYOi9juXNmZ89Ori2XUqM3vreWlt3ssKzb1d6IX7FG+KqQSExJjrUPcdq?=
 =?us-ascii?Q?oDV2l+ZBQfgpqGvDqhjqHhDZMoiQP3GLL9n0Lz4KeAOvwWBnO+3FAFtMYuwV?=
 =?us-ascii?Q?FC4pWfeYE7wpG3EhjokUKwb1P79qscc7GqD2hYIoDcO7wVFOlyyj51+w1JvM?=
 =?us-ascii?Q?vJ7wmK+2rmA9GG6K/MGIi6Sef6bVX7+J7SHT9FDfrfQF9eytBMiLxnBVZ4C6?=
 =?us-ascii?Q?CcMCTlCFyGkPooMwxwdyD84Pexn8OJTXOXClMUslJMQNEfo3tDs3IxGe508x?=
 =?us-ascii?Q?HBOJdASSZj60xQfqif+USE1LLMaZLiQyL/A4IvZiYm7kHUMXUcfm5YRlYqs5?=
 =?us-ascii?Q?FNUjzBO3P9ymsZ57ONLWhXDZ7sk4Yvckz/VF7gPBE7B7yVWsw0hkZODWj0RM?=
 =?us-ascii?Q?2Ga4kBASdbestHsdKPIUg0keHeLJ6iObH6ovXRJSTDC8imiChacbYg8LIvF4?=
 =?us-ascii?Q?GF2jQRPl6JC/O543f0cbahYs9P0WFYk6bCsBEm9mFe+JKKes/ZLib30Yj8z4?=
 =?us-ascii?Q?AkLC2k4btxQiNH6IGPRtqQgZXctAEOGzOeX6wpPNIqSy4BRS5nQT8KK7BtEX?=
 =?us-ascii?Q?Mg1M+gKw7biiDH+EKuND4ixwdBFn/wHG6LuE4vBr2lT1rfVLaV6HiX39qMDz?=
 =?us-ascii?Q?VO+Os/MiDyDfVU5wyVgLDedVNolYKPklyxScnO/E2ltk20RcJuq8MWYauTtL?=
 =?us-ascii?Q?/H1UMh6hYr/KcY2bf6HCfoEhA8CNomQj9X49s6GqpsdJgV4Vz8/jKQinVB7u?=
 =?us-ascii?Q?3nbNEajEEG1aVjQSRdq9e4uad50MAOZhVHtnGfIoknVc+LTRgQB3yDjjYCyd?=
 =?us-ascii?Q?kLvXnv0VlAylmxQ+cDI7TMdXSZoodUbCEswD73Nn9T5p6lkaGJj4S3/CSaM2?=
 =?us-ascii?Q?CCP6orCvxvdn+/8WpfYkcf7lAES1zh6E8391ldIaQ0m/3ryDsDwu7+PSzXa3?=
 =?us-ascii?Q?0OVUQgmmmaTzCx/A5WMgjDT/3QepD0srDCfDDWm8A9vFvrm4GDtJ89xBWB6S?=
 =?us-ascii?Q?rsVkV/qmEzmNfQLJIuVjbrnJzcBorRj7sADm8uRwZZbZxrnRe7f3oppT9AEq?=
 =?us-ascii?Q?PxDciaZJWtKqRziFmyxei/d4ur6uszBBR27CbG/gUw2cQGf/0oT71zWIyMpC?=
 =?us-ascii?Q?j4BXN0Ei7M8HdWlF7RwBHdNSGuOcXZmVUS5QMDVSKRrUvoItI533l9BLFZe/?=
 =?us-ascii?Q?BU/6XCJewPCDim0gdoSX3VdzViNv6g53FLBy1x5VFYmbRzgy9Mo92AYU8y4p?=
 =?us-ascii?Q?sA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7823916d-2096-4244-6020-08dccbd86a0d
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 05:22:33.3682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1DBdn6gVMa5YVMvQ8cDjV2wrqmdtsxpVSiAPVZ3+yIxYfGqSousBJPwb4yh2TaKZZgtURj8mUt0JXZC4WDoLkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4700
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:inconsistent_lock_state" on:

commit: 000f7cce0fe19452a5ecbc350b16d7d8ac68d8ba ("mm, slub: cheaper locking for percpu sheaves")
https://git.kernel.org/cgit/linux/kernel/git/vbabka/linux.git slub-percpu-sheaves-v1r1

in testcase: boot

compiler: clang-18
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+-------------------------------------------------+------------+------------+
|                                                 | aa03930ed5 | 000f7cce0f |
+-------------------------------------------------+------------+------------+
| WARNING:inconsistent_lock_state                 | 0          | 18         |
| inconsistent{SOFTIRQ-ON-W}->{IN-SOFTIRQ-W}usage | 0          | 18         |
| RIP:default_idle                                | 0          | 18         |
+-------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202409031302.dba16910-lkp@intel.com


[   28.196191][    C1] WARNING: inconsistent lock state
[   28.196613][    C1] 6.10.0-rc1-00013-g000f7cce0fe1 #1 Not tainted
[   28.197105][    C1] --------------------------------
[   28.197503][    C1] inconsistent {SOFTIRQ-ON-W} -> {IN-SOFTIRQ-W} usage.
[   28.198039][    C1] swapper/1/0 [HC0[0]:SC1[1]:HE1:SE0] takes:
[ 28.198510][ C1] ffffe8ffffd00d60 (&pcs->lock.llock){+.?.}-{2:2}, at: kmem_cache_alloc_noprof (include/linux/local_lock_internal.h:29) 
[   28.199302][    C1] {SOFTIRQ-ON-W} state was registered at:
[ 28.199749][ C1] lock_acquire (kernel/locking/lockdep.c:5754) 
[ 28.200114][ C1] kmem_cache_alloc_noprof (include/linux/local_lock_internal.h:29) 
[ 28.200552][ C1] do_set_mempolicy (mm/mempolicy.c:333) 
[ 28.200941][ C1] numa_policy_init (mm/mempolicy.c:3127) 
[ 28.201328][ C1] start_kernel (init/main.c:1063) 
[ 28.201689][ C1] x86_64_start_reservations (??:?) 
[ 28.202121][ C1] x86_64_start_kernel (arch/x86/kernel/head64.c:437) 
[ 28.202519][ C1] common_startup_64 (arch/x86/kernel/head_64.S:421) 
[   28.202912][    C1] irq event stamp: 38366
[ 28.203242][ C1] hardirqs last enabled at (38366): _raw_spin_unlock_irqrestore (arch/x86/include/asm/irqflags.h:42 arch/x86/include/asm/irqflags.h:77 arch/x86/include/asm/irqflags.h:135 include/linux/spinlock_api_smp.h:151 kernel/locking/spinlock.c:194) 
[ 28.204062][ C1] hardirqs last disabled at (38365): _raw_spin_lock_irqsave (arch/x86/include/asm/preempt.h:79 include/linux/spinlock_api_smp.h:109 kernel/locking/spinlock.c:162) 
[ 28.204877][ C1] softirqs last enabled at (38338): irq_exit_rcu (kernel/softirq.c:651) 
[ 28.205590][ C1] softirqs last disabled at (38345): irq_exit_rcu (kernel/softirq.c:651) 
[   28.206304][    C1]
[   28.206304][    C1] other info that might help us debug this:
[   28.206933][    C1]  Possible unsafe locking scenario:
[   28.206933][    C1]
[   28.207514][    C1]        CPU0
[   28.207770][    C1]        ----
[   28.208027][    C1]   lock(&pcs->lock.llock);
[   28.208384][    C1]   <Interrupt>
[   28.208662][    C1]     lock(&pcs->lock.llock);
[   28.209028][    C1]
[   28.209028][    C1]  *** DEADLOCK ***
[   28.209028][    C1]
[   28.209657][    C1] 1 lock held by swapper/1/0:
[ 28.210020][ C1] #0: ffffffff882dee40 (rcu_read_lock){....}-{1:2}, at: netif_receive_skb_list_internal (include/linux/rcupdate.h:329 include/linux/rcupdate.h:781 net/core/dev.c:5844) 
[   28.210872][    C1]
[   28.210872][    C1] stack backtrace:
[   28.211329][    C1] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 6.10.0-rc1-00013-g000f7cce0fe1 #1
[   28.212019][    C1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   28.212836][    C1] Call Trace:
[   28.213096][    C1]  <IRQ>
[ 28.213321][ C1] dump_stack_lvl (lib/dump_stack.c:116) 
[ 28.213678][ C1] valid_state (kernel/locking/lockdep.c:?) 
[ 28.214029][ C1] mark_lock_irq (kernel/locking/lockdep.c:?) 
[ 28.214383][ C1] ? stack_trace_save (kernel/stacktrace.c:123) 
[ 28.214766][ C1] ? save_trace (kernel/locking/lockdep.c:?) 
[ 28.215113][ C1] ? swiotlb_tbl_map_single (include/linux/spinlock.h:? kernel/dma/swiotlb.c:1116 kernel/dma/swiotlb.c:1267 kernel/dma/swiotlb.c:1402) 
[ 28.215557][ C1] mark_lock (kernel/locking/lockdep.c:4678) 
[ 28.215892][ C1] __lock_acquire (kernel/locking/lockdep.c:?) 
[ 28.216270][ C1] lock_acquire (kernel/locking/lockdep.c:5754) 
[ 28.216634][ C1] ? kmem_cache_alloc_noprof (include/linux/local_lock_internal.h:29) 
[ 28.217115][ C1] ? kmem_cache_alloc_noprof (include/linux/local_lock_internal.h:29) 
[ 28.217546][ C1] kmem_cache_alloc_noprof (include/linux/local_lock_internal.h:29) 
[ 28.217967][ C1] ? kmem_cache_alloc_noprof (include/linux/local_lock_internal.h:29) 
[ 28.218401][ C1] ? skb_clone (net/core/skbuff.c:2053) 
[ 28.218751][ C1] skb_clone (net/core/skbuff.c:2053) 
[ 28.219085][ C1] ic_bootp_recv (include/linux/skbuff.h:2036) 
[ 28.219442][ C1] ? lock_is_held_type (kernel/locking/lockdep.c:5495 kernel/locking/lockdep.c:5825) 
[ 28.219837][ C1] ? ic_bootp_send_if (net/ipv4/ipconfig.c:990) 
[ 28.220230][ C1] __netif_receive_skb_core (net/core/dev.c:? net/core/dev.c:5575) 
[ 28.220715][ C1] __netif_receive_skb_list_core (net/core/dev.c:5701) 
[ 28.221187][ C1] netif_receive_skb_list_internal (net/core/dev.c:5769) 
[ 28.221668][ C1] ? netif_receive_skb_list_internal (include/linux/rcupdate.h:329 include/linux/rcupdate.h:781 net/core/dev.c:5844) 
[ 28.222163][ C1] napi_complete_done (include/linux/list.h:37 include/net/gro.h:516 net/core/dev.c:6202) 
[ 28.222556][ C1] ? e1000_alloc_jumbo_rx_buffers (drivers/net/ethernet/intel/e1000/e1000_main.c:4348) 
[ 28.223031][ C1] e1000_clean (drivers/net/ethernet/intel/e1000/e1000_main.c:3809) 
[ 28.223388][ C1] ? mark_lock (arch/x86/include/asm/bitops.h:227 arch/x86/include/asm/bitops.h:239 include/asm-generic/bitops/instrumented-non-atomic.h:142 kernel/locking/lockdep.c:228 kernel/locking/lockdep.c:4656) 
[ 28.223728][ C1] ? __lock_acquire (kernel/locking/lockdep.c:?) 
[ 28.224122][ C1] __napi_poll (net/core/dev.c:6721) 
[ 28.224472][ C1] net_rx_action (net/core/dev.c:6790 net/core/dev.c:6906) 
[ 28.224836][ C1] handle_softirqs (arch/x86/include/asm/jump_label.h:27 include/linux/jump_label.h:207 include/trace/events/irq.h:142 kernel/softirq.c:555) 
[ 28.225210][ C1] ? irq_exit_rcu (kernel/softirq.c:651) 
[ 28.225567][ C1] irq_exit_rcu (kernel/softirq.c:651) 
[ 28.225910][ C1] common_interrupt (arch/x86/kernel/irq.c:278) 
[   28.226283][    C1]  </IRQ>
[   28.226515][    C1]  <TASK>
[ 28.226745][ C1] asm_common_interrupt (arch/x86/include/asm/idtentry.h:693) 
[ 28.227143][ C1] RIP: 0010:default_idle (arch/x86/include/asm/irqflags.h:37 arch/x86/include/asm/irqflags.h:72 arch/x86/kernel/process.c:743) 
[ 28.227549][ C1] Code: 89 07 49 c7 c0 08 00 00 00 4d 29 c8 4c 01 c7 4c 29 c2 e9 72 ff ff ff f3 0f 1e fa eb 07 0f 00 2d 13 70 31 00 f3 0f 1e fa fb f4 <fa> c3 cc cc cc cc cc 66 0f 1f 44 00 00 f3 0f 1e fa e9 d7 ff ff ff
All code
========
   0:	89 07                	mov    %eax,(%rdi)
   2:	49 c7 c0 08 00 00 00 	mov    $0x8,%r8
   9:	4d 29 c8             	sub    %r9,%r8
   c:	4c 01 c7             	add    %r8,%rdi
   f:	4c 29 c2             	sub    %r8,%rdx
  12:	e9 72 ff ff ff       	jmp    0xffffffffffffff89
  17:	f3 0f 1e fa          	endbr64
  1b:	eb 07                	jmp    0x24
  1d:	0f 00 2d 13 70 31 00 	verw   0x317013(%rip)        # 0x317037
  24:	f3 0f 1e fa          	endbr64
  28:	fb                   	sti
  29:	f4                   	hlt
  2a:*	fa                   	cli		<-- trapping instruction
  2b:	c3                   	ret
  2c:	cc                   	int3
  2d:	cc                   	int3
  2e:	cc                   	int3
  2f:	cc                   	int3
  30:	cc                   	int3
  31:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  37:	f3 0f 1e fa          	endbr64
  3b:	e9 d7 ff ff ff       	jmp    0x17

Code starting with the faulting instruction
===========================================
   0:	fa                   	cli
   1:	c3                   	ret
   2:	cc                   	int3
   3:	cc                   	int3
   4:	cc                   	int3
   5:	cc                   	int3
   6:	cc                   	int3
   7:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   d:	f3 0f 1e fa          	endbr64
  11:	e9 d7 ff ff ff       	jmp    0xffffffffffffffed


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240903/202409031302.dba16910-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

