Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284CA38239B
	for <oe-lkp@lists.linux.dev>; Sat,  9 May 2026 08:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778315843; cv=fail; b=ctLf06zR0dVxKo7xhEpEehrCqx02DutmWBkPlYra8++iqsQPqt9s/zGaMny9umG+SZ6ZdfvhL52s2kLfCHXyrxKVsBca+Ihj5NqqZDQRwIUAZ+cR1aXF7+4WUk0E1xuc59Uviqb/0V4CtaJhkIPQsB8xiz3saE3Yfg8EzZoiYzc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778315843; c=relaxed/simple;
	bh=UtvjwFv/msrb/L0sf3KTabZR3RDF2WtIYgRwoU6XfTI=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BCTaaw0RQA8T/v7TcEJonE3UFuffdboLl99I5XUkIz087JyCQNSXMLA2zEyMN0Tj05gOYpaHJJZ5iRjDgqNaIblVqxLzMcDEG2penh34yIj+XuwBIdQC3LRCMmMGiIkScVplfXLUr29gdI1PtkVgtDRrb2dn6HD94VPrF02Ygs8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mt6DXCCQ; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mt6DXCCQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778315842; x=1809851842;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=UtvjwFv/msrb/L0sf3KTabZR3RDF2WtIYgRwoU6XfTI=;
  b=mt6DXCCQIt1T/ic0QCcPM5T310aoJBEuDIrjiALK+Jg7S0YhfK62ELer
   i+liMRAmVPeju33VicuxMV5Vc0ExjzP5KaoFzp/rBuFQOFgtDVNPhNQY/
   9BOLWjRT7SrZeVsKnE+9GafNDoWN6OYhZ4BBRt6wC4SXnko9EYj432Swb
   lF15XYurLw0NiNOb5X6JzImZmcILzcUDvkk1TpZhvzZ6e/gk2d7wmDoZC
   9spP5XFQW6EdbVb5BqSmcksatomjj/+5pSh4nj14Yi+uC0RaGwwN3InhR
   1kKW/iJHrA5sFlOyN/4qrwMC8jxrO5wIT25fDq7vAhkIhauSVpdgSsT3f
   g==;
X-CSE-ConnectionGUID: VVInncF3TKWNdyhxR0SKzw==
X-CSE-MsgGUID: lhBIi/T3Rharilk/9E4ffg==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="79005348"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="79005348"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 01:37:22 -0700
X-CSE-ConnectionGUID: X3T+3R0jRfuWjXkOxGid0w==
X-CSE-MsgGUID: U674yuFzSxKPsQLVY0bLpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="241981923"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 01:37:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 9 May 2026 01:37:21 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sat, 9 May 2026 01:37:21 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.14) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 9 May 2026 01:37:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oGVFy4jCfBD7RQYOSVS256ZDFk8ARU4v7xlcne39HiOfO/phUhIlt6s2I/+at7jnDiN8gBQMxjIwGeAX2bxrJDaMsGcDMFGFOYF9EV/9ECENhIoWySqLOqmhruUwA2/T5vn4BwIU/Um78seM/Q2xeBV7Uo4tPrakKuNyBQjStG6yWU9gAcPf2R1YnLiXALUYPw/56U/T/LF8tsGgMnqOaMJHy5Ef2Lk/dyfMNi1b5SFlNc5vJE3FHlwKdxpdJJGyBmgCSX821DMqOyPs517SFYN2oMiwliy+bZ8vAYx9RoBqtvw18dqhN1Yvi8t3kE6onRhn1Gjgocb7tIDhEGSp7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l/6VmmWXDEb+M23bvXHiHVdt2/TQafCsHa11ElamCEI=;
 b=IU1B2s4Q35j+I0z3rBZZEuklM2UQNjqOSF3oXp1mXkcOwv2yTH0eeIxXJvz+pZ7u9OZqCfjZF1RZYwjJxKQbnfXCJyJOv+DyQcauECgKzPqBdgQRCinqJocrXvGwY1qBO6JQBu7KRYeb3zETvbfs55MczfRkoCV+k24GH1odNoAqcX+dAEMKZMfJ0OwbFOsYwUIV6QYxw6+gOHQ1r2LLl4n7iiDS5Ms6uPI/INvuPP4VUeiy7Skbbrooz2VvNH5J6Mo3ha2R4cB2x/TikADm0NWXqBWjqj/JeiwEJsGT2nrjWBIoc4llukV7auGyBLPuZ0bSSUdYFBljpd2A8MlHgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by DS4PPF31CEE2CEC.namprd11.prod.outlook.com (2603:10b6:f:fc02::1c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Sat, 9 May
 2026 08:37:18 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%3]) with mapi id 15.20.9891.019; Sat, 9 May 2026
 08:37:18 +0000
Date: Sat, 9 May 2026 16:37:10 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	K Prateek Nayak <kprateek.nayak@amd.com>, Shubhang Kaushik
	<shubhang@os.amperecomputing.com>, <aubrey.li@linux.intel.com>,
	<yu.c.chen@intel.com>, <oliver.sang@intel.com>
Subject: Re: [linus:master] [sched/fair]  4823725d9d:
 INFO:task_blocked_for_more_than#seconds
Message-ID: <af7yNkeckkeCu9pu@xsang-OptiPlex-9020>
References: <202605052050.8156b7e0-lkp@intel.com>
 <20260505152918.GY3126523@noisy.programming.kicks-ass.net>
 <afroZfHCMPrKFD01@xsang-OptiPlex-9020>
 <20260506074858.GB3126523@noisy.programming.kicks-ass.net>
 <afr3Hp/CgemmL3eY@xsang-OptiPlex-9020>
 <20260506082301.GI3102624@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260506082301.GI3102624@noisy.programming.kicks-ass.net>
X-ClientProxiedBy: TP0P295CA0023.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::19) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|DS4PPF31CEE2CEC:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e32ebaf-b822-47e5-21c5-08deada62e21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: h2W0p64Vhfij5GvMacJlImc+g+OdJE98u56MjoFLHNPaEHuadlGVfswG3oSB6xKq4PVJ5bUdnrXGOZs3MfLmIj1fYbcQJfmu6/wpHdZjnS/7mCJ2B08xgULS7pZ7iigAkmQXMtQ5ZGKKmx8ShFZw+OOAUvBVhnfoZKUaVOJYdjHkL4RGX0oZ8eaFAOLRBeYwDRflMQA+PXjsJKJwWvVo1lezU8oKYV4orZ65Zwfe13XLP9ZrdFW1ZBk5A/y7i6i8qyU7uBC98jL8s+q0J/OvYMdRNqUkkiFQP3c176wiTMrpJfgXWR+59z42E5ubpVNlY49Eww49YjgYsFBezRkTzSFPnBkIcnuE5V4rNKkGo/F45uVDMSh/cxoitvqdmjIeo9KBFehB925jnQwo4Xei7RiLRJE62gGDUKA8wG8Ik7EhwHDslnr21qsb0tUqeD3poZdtgGPaP3wsLKdDln5KKpCOjzaMORAlGNAkq/DIbOJtsTOtLwSOK4G9tYMLhyXqZ/DZqCMRV6FSVuyXFodZ6qNhwIscuwzEXkrPnYrrS9HUSjYM6DjTfWf1g4LiJxDChBfLat6OJ6YNHmAjigLHPbdLI4h4wgIsovDjpirKJ64E081U2jryfejGMBTA8beeLhRs7K035uk7PiSaJblEqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uytDjyiTWbGMWN48YJFB+5SdIkbmEs2tijntr/kWxL5NxkDjxHzwAAbsD50Z?=
 =?us-ascii?Q?4IsdXshiHrpYqIu6wp/zlByVdz0AZtNGG6o2FxmOL/KND/b9eJ2XqK2JuuOH?=
 =?us-ascii?Q?RLCABVH2zaAENLWpCdcP57WVJATZhqXNEhL+mvUnACzubLfX7Dz9i4B5MWPR?=
 =?us-ascii?Q?515zzJDDVgTRqb0z3TZp/BDBWe0UL9CUFIpHAKyfpas4ib0jiDq63N8Cvs1Q?=
 =?us-ascii?Q?XDToLfISgW6JehcI3N6DWcwCZOltmOqoP6tb/4Z92ya6QNS18fuh1rNF6+SE?=
 =?us-ascii?Q?MT8O7WbH4u9nyvjK+0HY9Njdi2z5oMd+1nnXqezfye/gUGGFgLUzM5OVWHpe?=
 =?us-ascii?Q?EIPZaze79B8buRZm48T7iCfe3EVs9a2P+U6IbldZxREi7DLwO9czCnhkMtyZ?=
 =?us-ascii?Q?sSsXzC8/Q2M3zmAYHeHtj6iAn56/Iop60mgBqBupLxwgE0250I7g8D+ijDQc?=
 =?us-ascii?Q?KW+E6tLCnmrU+GfVIBAhDLD4B/DiNEQgSyhKmbM0UjsmxIBflRJ/3Ws0rATP?=
 =?us-ascii?Q?3LyE8fKy4WgZ85f9psvPHBzVT6gIX5z5PIZDOP6Z36fPjSFVGpJSk5zX3SDM?=
 =?us-ascii?Q?q3Lxwsk8acYrf+a13BSDmK7Fq5+prKNyi/jzHQ2KIsIEsJeCOUkhmQOGtwNv?=
 =?us-ascii?Q?w6wyN7k+x0wIoZPEYwe20SGV17tyM6lP5JKLhYbaa9zkpUPooHHNZIJ2NgOE?=
 =?us-ascii?Q?4rMA58RX+tVC6f5ttviOOct974zDy+1QAlx3anU5t85g+DLQyvjBKVOubUAq?=
 =?us-ascii?Q?6kScmb2LFvd9jJSmcGvAN2B399JBDHt2QR0Y/N1/ORdBV57KLBQB6jqBGrxz?=
 =?us-ascii?Q?u1f3u1ZSyV6BRihWCldbG16J71j+krSyEqdsgz5Cblx8Z355KJi8bmye96J8?=
 =?us-ascii?Q?4Tyg4333BgrxowESLLv0uiWOOPJjPgNdH/2Cs+dupNUe0KmqRWrFV6qjtmS1?=
 =?us-ascii?Q?EjihxrsJw907rTaQuMPPuGLxCIDaN5Ak+JkG6StUuuQBK63g3ZdBGa5m6Rbh?=
 =?us-ascii?Q?Fe190Jv3W3hJIVLAmcEVyXaAcHc/LUQ2xaRMvZrMGnp2A6nhi6HcML9Y/jOC?=
 =?us-ascii?Q?hDJvD3jDohjrgHhWmOv7o2JAtxlHvp9u+4J+x0eO1j8sODcE1JLP+Um2zdY4?=
 =?us-ascii?Q?YmaXoLrG7Gdi7k2aLWztoviaRG/ppK64zI7Pp98ru4VJyRAXwWyw50qKhgfA?=
 =?us-ascii?Q?Zpx0kWb07f4JNA4MWWzFImRHTSI7NnWOnhKzQG1ZVXUSOYo0AfWF+lydBEf8?=
 =?us-ascii?Q?cp/07s59cIBCtfMAuCLaEuSzzjFI/am0qci/poWCv1L7pxoupm+opmSBncRG?=
 =?us-ascii?Q?1fsOaPawqRtlKgxooFm4X9zT39EUCTyEtztCHebuX5XPdYJ4KOlo3Ae+0kOe?=
 =?us-ascii?Q?QxpRITB/AwUNMO5oE8cmBwMH+t6NVClVUk3gmY+u3/80P52jqrbt+BAEa89H?=
 =?us-ascii?Q?xWbZt9PhA06DhMRxsYysgTpy9Eb6fFPAxRj3LqzKQhKp9Qlz8+Z4EP9K868s?=
 =?us-ascii?Q?13pkfOg6LkykpRFi9kcihm4xxcCUgHzIPECqPDgfhhBGbubaOUequOvofBSJ?=
 =?us-ascii?Q?1fEicFx8QDo3AQwc6St261Kkbrnl5YFvhabi6NyZ+jKIhtXHMFiqCpL9dB27?=
 =?us-ascii?Q?5OMh6DNPGeDjcfmRDQ/f0Kwmk/ZjTEo4vHWfvxTutBMewn+ogAUQ+qR5TZdM?=
 =?us-ascii?Q?XqUQiUORqFRzONdtvWN2jD95Uaa+TTbRisOujtWfCQMzBrKwJdSVClHic3au?=
 =?us-ascii?Q?WMfl+JcDag=3D=3D?=
X-Exchange-RoutingPolicyChecked: NfyKa7nnVLMMyV/F9zhN+qF1/4jiMJC4wGces2yF6t0YxzZojw+MRhA49f8gz6CgvzykJ83+XDpT1S2GlZq53WxSMVnycX0mR/wtDxjnPfy6FnLqKEbnEQlKYnuD1LMg+/AawgvnEg/CubdIEkzpAbBOUuQZAHoQLBC2I/SSU58YFijEUIslVWzltIhx/dlq+2amKJhcEGQ/H3t89fkqSKNNANanBG8kbPaAfkz9JsbIUfA6RIZ60XEpz/K3mWhWg3CC5WB//kycGLEQemsv8gUQap3wxsInyX7/MbnmDSdfnF0VeItSr283zps9ZJihfTrfDRKiuTcB2YXhk68XMQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e32ebaf-b822-47e5-21c5-08deada62e21
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2026 08:37:18.5673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WCnUpaVTzFUmKy3EZK4yzJLS3UiW35gKxxskNWcHfLegWhh54wdDCkwPRy1oOqCmfSZ7A7+2cnerlfxoC+zI1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF31CEE2CEC
X-OriginatorOrg: intel.com

hi, Peter Zijlstra,

On Wed, May 06, 2026 at 10:23:01AM +0200, Peter Zijlstra wrote:
> On Wed, May 06, 2026 at 04:09:02PM +0800, Oliver Sang wrote:
> > hi, Peter Zijlstra,
> > 
> > On Wed, May 06, 2026 at 09:48:58AM +0200, Peter Zijlstra wrote:
> > > On Wed, May 06, 2026 at 03:06:13PM +0800, Oliver Sang wrote:
> > > 
> > > > we tested upon below commit:
> > > > 0c0cf14be4909 (tip/sched/urgent) sched/fair: Fix wakeup_preempt_fair() for not waking up task
> > > > 
> > > > found most issues are still existing
> > > 
> > > Moo :-(
> > > 
> > > > =========================================================================================
> > > > compiler/kconfig/rootfs/sleep/tbox_group/testcase:
> > > >   gcc-14/i386-randconfig-2006-20250804/yocto-i386-minimal-20190520.cgz/1/vm-snb/boot
> > > > 
> > > > 9fe89f022c05d99c 4823725d9d1d9cc5b36647e0cb8 0c0cf14be490975a7431e9d49fc
> > > > ---------------- --------------------------- ---------------------------
> > > >        fail:runs  %reproduction    fail:runs  %reproduction    fail:runs
> > > >            |             |             |             |             |
> > > >            :499         13%          64:499          5%          23:1001  last_state.booting
> > > >            :499          6%          29:499          3%          13:1001  dmesg.BUG:kernel_hang_in_boot_stage
> > > >            :499          7%          33:499          2%          10:1001  dmesg.BUG:workqueue_lockup-pool
> > > >            :499          0%           1:499          0%           1:1001  dmesg.EIP:_raw_spin_unlock_irqrestore
> > > >            :499          1%           3:499          0%           1:1001  dmesg.EIP:finish_task_switch
> > > >            :499          0%           1:499          0%            :1001  dmesg.EIP:handle_softirqs
> > > >            :499          0%           2:499          0%           1:1001  dmesg.EIP:lock_acquire
> > > >            :499          0%           1:499          0%           2:1001  dmesg.EIP:lock_release
> > > >            :499          0%           1:499          0%            :1001  dmesg.EIP:on_each_cpu_cond_mask
> > > >            :499          0%           1:499          0%            :1001  dmesg.EIP:rcu_preempt_deferred_qs_irqrestore
> > > >            :499          1%           3:499          0%           1:1001  dmesg.INFO:rcu_preempt_detected_stalls_on_CPUs/tasks
> > > >            :499          3%          14:499          2%          10:1001  dmesg.INFO:task_blocked_for_more_than#seconds
> > > > 
> > > > the config used for 0c0cf14be4909 is attached as config-7.1.0-rc1+
> > > > one dmesg from 0c0cf14be4909 for dmesg.INFO:task_blocked_for_more_than#seconds
> > > > is attached as dmesg-0c0cf14be4.decoded.xz
> > > 
> > > Do you have a URL for that yocto image? git grep yocto on the lkp repo
> > > didn't immediately find me one, and I don't appear to have it in my
> > > .lkp/cache either.
> > 
> > it's here:
> > https://download.01.org/0day-ci/lkp-qemu/osimage/yocto/yocto-i386-minimal-20190520.cgz
> 
> Thanks!, however I'm not seeing boot fails.
> 
> I use:
> 
> qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 8 -m 8G -device e1000,netdev=u1 -netdev user,id=u1  -serial stdio -monitor pty -display none -append "earlyprintk=ttyS0,115200 force_early_printk console=ttyS0,115201 debug systemd.log_level=info sysrq_always_enabled ignore_loglevel nokaslr kgdboc=ttyS0" -virtfs local,path=$PWD/,mount_tag=tmp,security_model=none -kernel i386-build/arch/x86/boot/bzImage -initrd yocto-i386-minimal-20190520.cgz
> 
> and have booted the thing at least 10 times now, each time landing in
> the yocto login without issue. Is there anything I'm not doing right?


sorry for the delay, and please disregard this report as it may be noise.

I attempted to reproduce the issue using the above command approximately
1,000 times, and also tried another 1,000 iterations with our reproducer
https://download.01.org/0day-ci/archive/20260505/202605052050.8156b7e0-lkp@intel.com/reproduce
However, I was unable to reproduce the issue locally.

I then conducted further investigation within our cluster, but found little
evidence to confirm the possible root causes.

we will definitely investigate further to either avoid generating less
meaningful reports or provide an easier reproducer.
Thank you for your patience.

