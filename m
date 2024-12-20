Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D2453AC
	for <oe-lkp@lists.linux.dev>; Fri, 20 Dec 2024 02:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734663556; cv=fail; b=u0i4SRIYBbPS7WLEFETHpc/42tXpAXQ7cqj6zbkzbZWuBDM5/GFJ3v3u8fXJjpXTBylUerZkDUu/n8UE4dx5OfdE2xP4kmGMFKq+aewMcf2KmUwQc48PvKPvM/SBnsgQUxstxef/TpHK+dXgy3VkKMpRoJTi25GbfHaW1QUHVZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734663556; c=relaxed/simple;
	bh=VmjlZZsmzPNZCnh6qmC0wpl0INDfZc/Llrl9CYFwNtw=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=h48TnCjmXd1IBVQfrixbqfYC5ylJxdKQOCajginI9TFL6Lwi/HrkX+b5+8nqYSCzNxpZ0JGZkFAAzC/qx5E1npHd8ogDA2fc9sUwSov/z/RiQM2ZO25z7Kfagl4JujoZ+VGG23kIukrkFYZV+o+UcboVVdLdsupgjfOnBrUUxys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jyDC4wWA; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jyDC4wWA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734663554; x=1766199554;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VmjlZZsmzPNZCnh6qmC0wpl0INDfZc/Llrl9CYFwNtw=;
  b=jyDC4wWAdPShyk6Pihoy6u7Oxhr48rvJgM4uqTL28vdS03GeSwwVOO7N
   3GiWQYIi7+8Uo3QNd3D+IQvzSCxD+AqE5Pkw6/pJiT68IPDNMG5Y2dVi5
   jexOcCpbZnt0uuSgqft0EbJFbeeRtcDXecaNhxglG7/C1ux4nTIjYSMxI
   V8RlZ8cFg7l1BjX6RvkJzRBMT7t2mf2TvqCuuUvv2c9OMI+dQu1B5Pt7s
   8W0gKE9gsrp8ueQfe87QgToa3b85J0/TGXOykC4AwoYl5zFjD4P1hg+76
   ileF0sv5VxOZW65Cr0Eec3LXPAgcIVg7CLVHqrjPoZ9/HoT0h0li3+/uP
   g==;
X-CSE-ConnectionGUID: CL3qEieIQUaNahvVLRw8aQ==
X-CSE-MsgGUID: BBsqWLu3TICKKfepSeqWDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="35099523"
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; 
   d="scan'208";a="35099523"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 18:59:13 -0800
X-CSE-ConnectionGUID: mPp9raUBTJucrVjAbNpMyg==
X-CSE-MsgGUID: uEPt0KxpRrCak4d/GzrYzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; 
   d="scan'208";a="98591926"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 Dec 2024 18:58:47 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 18:58:46 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 18:58:46 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 18:58:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f0S7x3uI5CwtqLH6+hRgSf/84VQGA7aqJ8ZhEQjFaZ5St3dG7wXlYNwKNgqXRn1PsTlQU3xjuaAhMqkITdO6kzZtdohVtaRNgnrzDiufU/DjMtqkydTOORQjF05vMg5H+2l38pk8bpEKyb2PLQLMI6jTXPHFV1jIsHLpeZ5ddnzWm48IkuQp+iLwR7YNC0gaWVnYFdvnJBaoGVKKRMQAFlGCUlAtochslQnRW9cOrAHIvTkKbcLxMa34f4qZ9gj1aFgsyo6sciDKty2KxMfVM5sf+JuiItg481a/aU7UdarWRLtqOBp0u3FDPtG+Gz/QjQn4EjZPrmKvYV7b3rxX8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fIqZmF/Mppf8DEJHwlgNAZyZPJ5kfsp/CO++NyVx+kg=;
 b=xUqF+prqrh4g6Topjvc/Oz7IFZvSXXHAX2/1NTev46oB3Mkb6NttRbSzMO7xB1w+Hxwsl0H1pTV/ITGtdavmy50i2MOGQMJ9o+zvdG6FaBUfn2x7qA83xyRXxgbS6XGApXLis0VOZ0xWRY7qTP4muAMZZAOFWPfAz1XBo1+eLUsaaOMiDszyy8dpJVjGHj1mUEU/ZJ8Qrahc0JmYm3LK2a9FzLgS61sSh0ulLKMmgYkr6BsIrUI/AJMJ1wUri/zy0UYs9ooi/fb/sjtusJQh+tvR7XJxHdIqGi7bIqPPP83kGdthPbAv8QBWWIsR7yPsX4IsvqnIk4IyxwNb3G6h+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DM4PR11MB6357.namprd11.prod.outlook.com (2603:10b6:8:b5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 02:58:02 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%6]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 02:58:02 +0000
Date: Fri, 20 Dec 2024 10:57:52 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<oliver.sang@intel.com>
Subject: [peterz-queue:x86/text_poke_early] [x86]  d83d84ba82:
 WARNING:at_arch/x86/kernel/alternative.c:#poison_endbr
Message-ID: <202412201026.6ad736f3-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0015.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::18) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DM4PR11MB6357:EE_
X-MS-Office365-Filtering-Correlation-Id: 90255951-81ed-41a7-08e6-08dd20a21e3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GGsiilD1pmHo7t4KTh2MPE2/ZyGincarKCtRxsIktwG2ajn9/vmfQplWlV8P?=
 =?us-ascii?Q?CK5jBFP0/581yjIH1WnsdXjgpCLBloElFmZr7+nbYvF4bLbXm4fFQbA9mO2x?=
 =?us-ascii?Q?pZwGT7YZKBOYP0uGCnn2iLTwwrktYKwQhoMc7Kj0QAifu1jraRQOoanfN48B?=
 =?us-ascii?Q?NOeCFqco7unreCu7hf5J5blraMER6ZLYJ3z1HBdL5psswf+NTFbgCe86/6w/?=
 =?us-ascii?Q?xXKcs1vhbzf6Mey1U0DkWE6nDIXPEtYOCUvVkk/qDhJHYf89pnxrdoFiRZBJ?=
 =?us-ascii?Q?w8hVS65XwnZO1MxHLiTVMdZo7262dvtS4vJ6Ogo/K1Z6xdpguYGV+v9EoJ+y?=
 =?us-ascii?Q?UbLesrPm1WM3XvUF8sHaP1sd2onTL4LiEySKzDnv10EyOAEzvffQmcXpAQaR?=
 =?us-ascii?Q?+rZCxpRbC5R8h4xoDTUcVVG+0GabFHNN66JFBSEyKilURHkliYVsqcGzC+5a?=
 =?us-ascii?Q?d+ojO1mO3e2rdB/zHXt1ERjUKSt87J52VVcO3RTjy5dAz07hTt9xc6vYqtou?=
 =?us-ascii?Q?ItRnbYL8PHIXwAanjXanJxkl2p6s0Owo05zvC5IxniSr/f0JTfeR3FGiRP97?=
 =?us-ascii?Q?wCHgmLVaUt9S4bCVD2gYzq3dp09gPalX7lwYPZ6Mu/dPvNvIjFmCTY679eUD?=
 =?us-ascii?Q?eYckIEllXpNlDTOddbCrJG/KneKcBG988cKosQX1epZcm5b6mBXqcTQBEkxc?=
 =?us-ascii?Q?nwgPzVRTXsKtcGAK8fUSIUwriF6r5uIO+HGwE7mvU0k5ol9KkRpHuypFaMGC?=
 =?us-ascii?Q?1V8FsWeX8naINTr3EKhBhoyGRwnO3A8X/o16K8I1HAD/CseBR/6wcjqOTWie?=
 =?us-ascii?Q?xJ4NDlJON7Q6XPZ9284UzaCwf1oLu3RWsez45JkZN2oOeRQL6x7PeT1BNcMV?=
 =?us-ascii?Q?5Npklr3MPQEm7xkJmauXDRdf4kv0wGZOz+tEQWitA1EMdjHMR5qFKZcrryZM?=
 =?us-ascii?Q?DTmwUOaHsmJ8ju7KM+04TUBua8FQ1/13/nz10wKE+Kz9qJpwUATrBmN6v019?=
 =?us-ascii?Q?kkiGuOVqsIJSNNSDLrL+DwkUrnlfml4nc5mGv8nIph1ZtomdOC1GKPYGrB2M?=
 =?us-ascii?Q?ulWQcEgEWHxMOPJ/QHTQ95cPDE73Bh/u0M1x+QKhaX2PBr7CVFzxkWWLBpbu?=
 =?us-ascii?Q?csCAVEUcAJjgmPl3jHaK1tUQSKJh+1Qy5vByReaRURWpO7P/ix5j/kzUDLT2?=
 =?us-ascii?Q?0qTQP+wOU370Q2VTisgiPNVbu+pNFPpOL61AfKrv/tsOt9v03YwBbDnizRVY?=
 =?us-ascii?Q?FhH1v8dmNEIVWVo6tmTWOtfe7Y2ccfjWwyr85AclvvNci8Y+I0fIA2XaOMMb?=
 =?us-ascii?Q?FLwv5HuSS5K3Ctmw5Mjk+djDeXVJ7VG/iePge6x9/tmGhT8fxSKttQ5+oMTY?=
 =?us-ascii?Q?8yk9bd5gOV0GkCuTF3l4FBpuoGr3uvTMwnDFpj4fTJXIOmslrA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bOhtfbfiUzVKlrakOO9GjxtlmL7H+EcTRSpMFuB1mNC2/jBIsEDcBUgOCwf8?=
 =?us-ascii?Q?Kvz9RwlwZdJ7dKK8sdmcHgfknpghvU3wFel6QFyDOKK1TM+RjDbMgDZyHRL+?=
 =?us-ascii?Q?tdmbgsay7MF3xMJmqA0AGNrdS/K18sodeD/FSt+FaCc4prq6Ypcme1IIaKJM?=
 =?us-ascii?Q?aWTWFfuO8Co7IejmdkGXEyWMMYFxFh0BKo+XCd40KMxcL1njhRHt/SmfijD4?=
 =?us-ascii?Q?8YTIQHbLUWvq8NzVcZVX0mQo58QUl2zEJrdoU5cuW8fWgi3+FKjy+A45b/QQ?=
 =?us-ascii?Q?Yc0s3xrh+cwDzeA/gI54NAu2fl9f2DoCxgbCADUR81B8w0tURoobh7zRIIpR?=
 =?us-ascii?Q?BFRx958052pN2hdlKpeN6+yc2D2AgqUN/N0/7s9JlZrBjHqQzrFwZ69u/XfH?=
 =?us-ascii?Q?Ve01up/N3Jrol6l9qCRBFswwresMEv9rO8WfSKmpnTQuCnKAlUucPjABWWvO?=
 =?us-ascii?Q?0COqWv3Wplu2b202VpRAyQulZR7eNUAlzxFkOdUbHQOSayp8dry+xJMPX9E5?=
 =?us-ascii?Q?t1YILgSagV+OYPlmgj/YTNJM9jfh3+pEZlEnxR0D0Yo/KiinGZOhrtKCNTMQ?=
 =?us-ascii?Q?oGbf0L6oh6eAVd0sJs5pgyaTMIyhykPHBmGhZTmIGSiA6Wvy4h/fhTuYRzGF?=
 =?us-ascii?Q?JOGUBuRD9hLgq6iBGDOxk8FyH+0NP/lGXuTu8gq93L0/HPpI5SvVLJt1qkJA?=
 =?us-ascii?Q?wpgs8zScfir84W1oZ+IbT9HD8XJmoFEjmj53xfBuEffQwgSd+k7OrOzNQHQY?=
 =?us-ascii?Q?oPXih2tqtad7hrhd/v1oEHlY6F7sdAD4N0ydoKo9eKKlWN1VxZ2KYB6TXiTO?=
 =?us-ascii?Q?IZeneoxBQX+1NSeGO0pA+x1wWFkbRonrWOT5jXcd9LqbrmS/jUOZv1qWHJD4?=
 =?us-ascii?Q?WiHYijrVpt8Ng7l9px4HegzpwK9DUgGZEiPJsBOKnL4HJywM7Txsqt9AJCg6?=
 =?us-ascii?Q?7iJuVjm/DwdhPfqUtHvk0f/yllkO7POvtvLGjenog4c4Ytz197k+yMRVFykF?=
 =?us-ascii?Q?Kap8SN48cQdN4VifVFhWR5Yn9MCqB5capielfOmRsxz2TEOlM+JT+My89Dd4?=
 =?us-ascii?Q?/4Uf4RiF0lnfE5QCiVlcJPuabzcFKpo5z26fQxKCMBLKODTG4Q429vfyMlYC?=
 =?us-ascii?Q?DizS/a9Hd3DUt5zuUBubLGqhKcoRr9vxBQpgdhlpwIVpTm4Za6lWs7OKgaQa?=
 =?us-ascii?Q?il1D0GmYFN+k+nZTsloMwSBU+/e9rKw7y48HrJ/a3WkbslLslEaUzOGX5tgA?=
 =?us-ascii?Q?NG+Uu57eUNYeMWNcsnjN+s+1v5IRhmctvq/sYbMs7xMhnLIHuPNTyu4d6HOW?=
 =?us-ascii?Q?VjoCqZAsFjJ0+nvzez42ROlxjL81mKLy5LsnKy6KmPtlTElyY4Q2YDqlVVsU?=
 =?us-ascii?Q?pWkr/FYGXaz88CMuOG30nvB4/B2kki/a+HD5/ntMw5MhvoEl2tbMQbGwX1SX?=
 =?us-ascii?Q?+7C1Ufvmr56OfGs4v/H6auXouEX95OF0DktrN2IwPosEk6RuCYJfurZQUTG4?=
 =?us-ascii?Q?pO6SLKhotzJsA2qdDf/cliHMieCOstX3MJrqH8K5bfpVhpsEC7gy48fhDkNu?=
 =?us-ascii?Q?QgqjWQIGTLLyXDE+rbQBc8xjVGNIkjJpz6ONb777cDDR1Ftlye6mOZ3aGgdB?=
 =?us-ascii?Q?nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90255951-81ed-41a7-08e6-08dd20a21e3f
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 02:58:02.3636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SFv88Zm0VoOgUnry9dOkD3AcR3uhaWxeQCPmDi3KfCYFrWplSaNCRZ4zYO76W9Kv7ECQUcEc0atZGttKys1U5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6357
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:at_arch/x86/kernel/alternative.c:#poison_endbr" on:

commit: d83d84ba82388139834970a12f4f8d8d49b6b543 ("x86: Clean up module_writable_address() mess")
https://git.kernel.org/cgit/linux/kernel/git/peterz/queue.git x86/text_poke_early

in testcase: rcuscale
version: 
with following parameters:

	runtime: 300s
	scale_type: rcu



config: x86_64-randconfig-074-20241213
compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+--------------------------------------------------------+-----------+------------+
|                                                        | v6.13-rc1 | d83d84ba82 |
+--------------------------------------------------------+-----------+------------+
| WARNING:at_arch/x86/kernel/alternative.c:#poison_endbr | 0         | 18         |
| RIP:poison_endbr                                       | 0         | 18         |
+--------------------------------------------------------+-----------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202412201026.6ad736f3-lkp@intel.com


[   35.687830][  T129] ------------[ cut here ]------------
[ 35.688731][ T129] WARNING: CPU: 1 PID: 129 at arch/x86/kernel/alternative.c:868 poison_endbr+0x2d8/0x3b0
[   35.690165][  T129] Modules linked in: qemu_fw_cfg(+) button(+)
[   35.691090][  T129] CPU: 1 UID: 0 PID: 129 Comm: systemd-udevd Tainted: G    B              6.13.0-rc1-00001-gd83d84ba8238 #1 c5f92a2cc5ec5cf398aabc567400058700a7a09d
[   35.693166][  T129] Tainted: [B]=BAD_PAGE
[   35.693850][  T129] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 35.695312][ T129] RIP: poison_endbr+0x2d8/0x3b0
[ 35.696266][ T129] Code: 03 48 c7 c7 00 ca 23 84 e8 85 ae 30 00 e9 71 fe ff ff b9 01 00 00 00 31 d2 be 01 00 00 00 48 c7 c7 60 54 be 86 e8 88 d0 57 00 <0f> 0b b9 01 00 00 00 31 d2 be 01 00 00 00 48 c7 c7 30 54 be 86 e8
All code
========
   0:	03 48 c7             	add    -0x39(%rax),%ecx
   3:	c7 00 ca 23 84 e8    	movl   $0xe88423ca,(%rax)
   9:	85 ae 30 00 e9 71    	test   %ebp,0x71e90030(%rsi)
   f:	fe                   	(bad)
  10:	ff                   	(bad)
  11:	ff                   	(bad)
  12:	b9 01 00 00 00       	mov    $0x1,%ecx
  17:	31 d2                	xor    %edx,%edx
  19:	be 01 00 00 00       	mov    $0x1,%esi
  1e:	48 c7 c7 60 54 be 86 	mov    $0xffffffff86be5460,%rdi
  25:	e8 88 d0 57 00       	call   0x57d0b2
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	b9 01 00 00 00       	mov    $0x1,%ecx
  31:	31 d2                	xor    %edx,%edx
  33:	be 01 00 00 00       	mov    $0x1,%esi
  38:	48 c7 c7 30 54 be 86 	mov    $0xffffffff86be5430,%rdi
  3f:	e8                   	.byte 0xe8

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	b9 01 00 00 00       	mov    $0x1,%ecx
   7:	31 d2                	xor    %edx,%edx
   9:	be 01 00 00 00       	mov    $0x1,%esi
   e:	48 c7 c7 30 54 be 86 	mov    $0xffffffff86be5430,%rdi
  15:	e8                   	.byte 0xe8
[   35.698861][  T129] RSP: 0000:ffff8881572577e8 EFLAGS: 00210282
[   35.699778][  T129] RAX: dffffc0000000000 RBX: 1ffff1102ae4aefe RCX: 0000000000000001
[   35.700982][  T129] RDX: 1ffffffff0d7ca8f RSI: 0000000000000001 RDI: ffffffff86be5478
[   35.702137][  T129] RBP: ffffffffa060d760 R08: 0000000000000000 R09: 0000000000000000
[   35.703328][  T129] R10: ffffffff86e59b57 R11: 0000000000000000 R12: 0000000000000000
[   35.704527][  T129] R13: ffffffffa05f7140 R14: 0000000000000000 R15: ffffc9000057e648
[   35.705732][  T129] FS:  0000000000000000(0000) GS:ffff8883aef00000(0063) knlGS:00000000f78f9ac0
[   35.707032][  T129] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
[   35.707995][  T129] CR2: 00000000f6ebbfef CR3: 000000015144f000 CR4: 00000000000406b0
[   35.709198][  T129] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   35.710231][  T129] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   35.711218][  T129] Call Trace:
[   35.711676][  T129]  <TASK>
[ 35.712113][ T129] ? poison_endbr+0x2d8/0x3b0
[ 35.712818][ T129] ? __warn (kernel/panic.c:748)
[ 35.713354][ T129] ? poison_endbr+0x2d8/0x3b0
[ 35.714083][ T129] ? report_bug (lib/bug.c:180 lib/bug.c:219)
[ 35.714657][ T129] ? handle_bug (arch/x86/kernel/traps.c:285)
[ 35.715236][ T129] ? exc_invalid_op (arch/x86/kernel/traps.c:309 (discriminator 1))
[ 35.715855][ T129] ? asm_exc_invalid_op (arch/x86/include/asm/idtentry.h:621)
[ 35.716489][ T129] ? poison_endbr+0x2d8/0x3b0
[ 35.717201][ T129] ? poison_endbr+0x2d8/0x3b0
[ 35.717921][ T129] ? apply_alternatives (arch/x86/kernel/alternative.c:860)
[ 35.718583][ T129] ? __write_relocate_add+0x1cf/0x590
[ 35.719358][ T129] ? add_kallsyms (include/linux/rcupdate.h:347 include/linux/rcupdate.h:880 kernel/module/kallsyms.c:223)
[ 35.719975][ T129] ? trace_lock_release (include/trace/events/lock.h:69 (discriminator 37))
[ 35.720610][ T129] ? add_kallsyms (include/linux/rcupdate.h:347 include/linux/rcupdate.h:880 kernel/module/kallsyms.c:223)
[ 35.721235][ T129] ? lock_release (kernel/locking/lockdep.c:116 kernel/locking/lockdep.c:5862)
[ 35.721855][ T129] apply_seal_endbr (arch/x86/kernel/alternative.c:892)
[ 35.722456][ T129] module_finalize (arch/x86/kernel/module.c:304)
[ 35.723084][ T129] load_module (kernel/module/main.c:2808 kernel/module/main.c:3316)
[ 35.723666][ T129] init_module_from_file (kernel/module/main.c:3565)
[ 35.724316][ T129] ? __ia32_sys_init_module (kernel/module/main.c:3541)
[ 35.724992][ T129] ? do_raw_spin_unlock (kernel/locking/spinlock_debug.c:103 kernel/locking/spinlock_debug.c:141)
[ 35.725648][ T129] idempotent_init_module (kernel/module/main.c:3577)
[ 35.726327][ T129] ? init_module_from_file (kernel/module/main.c:3569)
[ 35.727013][ T129] ? security_capable (security/security.c:1142)
[ 35.727622][ T129] __ia32_sys_finit_module (include/linux/file.h:62 include/linux/file.h:83 kernel/module/main.c:3600 kernel/module/main.c:3587 kernel/module/main.c:3587)
[ 35.728345][ T129] do_int80_emulation (arch/x86/entry/common.c:165 arch/x86/entry/common.c:253)
[ 35.728993][ T129] ? randomize_page (mm/util.c:570)
[ 35.729601][ T129] ? __fget_files (include/linux/rcupdate.h:347 include/linux/rcupdate.h:880 fs/file.c:1050)
[ 35.730279][ T129] ? lock_release (kernel/locking/lockdep.c:116 kernel/locking/lockdep.c:5862)
[ 35.730952][ T129] ? __fget_files (arch/x86/include/asm/preempt.h:84 include/linux/rcupdate.h:98 include/linux/rcupdate.h:882 fs/file.c:1050)
[ 35.731621][ T129] ? __fget_files (include/linux/rcupdate.h:337 include/linux/rcupdate.h:849 fs/file.c:1048)
[ 35.732311][ T129] ? fput (arch/x86/include/asm/atomic64_64.h:79 include/linux/atomic/atomic-arch-fallback.h:2913 include/linux/atomic/atomic-arch-fallback.h:3364 include/linux/atomic/atomic-long.h:698 include/linux/atomic/atomic-instrumented.h:3767 include/linux/file_ref.h:157 fs/file_table.c:501)
[ 35.732905][ T129] ? trace_irq_enable+0xdf/0x120
[ 35.733672][ T129] ? syscall_exit_to_user_mode (arch/x86/include/asm/processor.h:719 arch/x86/include/asm/entry-common.h:100 include/linux/entry-common.h:365 kernel/entry/common.c:220)
[ 35.734461][ T129] ? do_int80_emulation (arch/x86/entry/common.c:257)
[ 35.735179][ T129] ? trace_irq_enable+0xdf/0x120
[ 35.735948][ T129] ? syscall_exit_to_user_mode (arch/x86/include/asm/processor.h:719 arch/x86/include/asm/entry-common.h:100 include/linux/entry-common.h:365 kernel/entry/common.c:220)
[ 35.736674][ T129] ? do_int80_emulation (arch/x86/entry/common.c:257)
[ 35.737366][ T129] ? _copy_to_user (arch/x86/include/asm/uaccess_64.h:134 arch/x86/include/asm/uaccess_64.h:134 arch/x86/include/asm/uaccess_64.h:147 include/linux/uaccess.h:197 lib/usercopy.c:26)
[ 35.738007][ T129] ? __ia32_sys_llseek (fs/read_write.c:437 fs/read_write.c:417 fs/read_write.c:417)
[ 35.738760][ T129] ? __x64_compat_sys_lseek (fs/read_write.c:417)
[ 35.739470][ T129] ? trace_irq_enable+0xdf/0x120
[ 35.740240][ T129] ? syscall_exit_to_user_mode (arch/x86/include/asm/processor.h:719 arch/x86/include/asm/entry-common.h:100 include/linux/entry-common.h:365 kernel/entry/common.c:220)
[ 35.741014][ T129] ? do_int80_emulation (arch/x86/entry/common.c:257)
[ 35.741729][ T129] ? trace_irq_disable+0xdf/0x120
[ 35.742495][ T129] ? do_int80_emulation (arch/x86/include/asm/jump_label.h:36 arch/x86/entry/common.c:229)
[ 35.743160][ T129] asm_int80_emulation (arch/x86/include/asm/idtentry.h:626)
[   35.743791][  T129] RIP: 0023:0xf7f5d092
[ 35.744322][ T129] Code: 00 00 00 e9 90 ff ff ff ff a3 24 00 00 00 68 30 00 00 00 e9 80 ff ff ff ff a3 f8 ff ff ff 66 90 00 00 00 00 00 00 00 00 cd 80 <c3> 8d b4 26 00 00 00 00 8d b6 00 00 00 00 8b 1c 24 c3 8d b4 26 00
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
https://download.01.org/0day-ci/archive/20241220/202412201026.6ad736f3-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

