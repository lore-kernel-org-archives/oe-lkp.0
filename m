Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559FF2045AD
	for <oe-lkp@lists.linux.dev>; Tue,  2 Jun 2026 02:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780367680; cv=fail; b=GxJXDmTpmrRZH3TaVSFhVHGb/hLgwUGgMDonmXe5GQ0zn+KpFIAWq1uFsB6alendgVfo1FCSQG4xWLvqSjREi8w/BLOt98nM2futTKMBWpLnHic6zAr+1/r8NTPtGCn4P0mduw8GfSMjx1jQnwTeZcm3yG31Cz+R/LFGzB/k7f0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780367680; c=relaxed/simple;
	bh=ua+j+Ys8P84YltNzb6+yspIWV/kiKugMKhf4omJnki4=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=a/p6MGYCWy+3F3M4wH4dkeulsrrG2UlB+AhWDbVb7PTEqkgr4LkXBWbOLK2mbeu2x+epXXTJb4VKfTKmjnnBXj/TWnoo7WkcBaRarnUCmHuwSu3+J186WF3YFkP3IAHt6dE06/OkBd6OC+nnYjMS5MwjjWm4U5AR13qkvHMFjyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mEUPlNUu; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mEUPlNUu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780367675; x=1811903675;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=ua+j+Ys8P84YltNzb6+yspIWV/kiKugMKhf4omJnki4=;
  b=mEUPlNUuB4o8oen//mKuRzsoSP+zm3JhUanDSyKyCW5VQW6XTdzMDOtx
   ZtrDRhYjCQ+rfzkLNRSm57iaQqsKzjgTjpvEbFDd/7h+o/3CZbqu42kgG
   JWrJTPPg9418jJGiWZQKsbq6ZVG/F6tGCpXaSP9MNle0rUQNh78q8RLgb
   sQUDAFIOCVGRptANYbsoLB/zT+S8ejlB8TsfU7azaRuPC1ZLpkFyghfLy
   wFFCczovsHfyg4X/JKc1NGOxJaTnI/DkecPeRIoc/oTXdfE9TkGR7Qw88
   13wHFXE6s47uLBJ69JT4puDrD4QQRSbSWpcw5LCMHCHyhBSfVLgC87wDm
   w==;
X-CSE-ConnectionGUID: nLukTwEzRcCPs5C22qRtXA==
X-CSE-MsgGUID: zt0YomPnRlm8QQuGd2hd4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81320791"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="81320791"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 19:34:35 -0700
X-CSE-ConnectionGUID: N369LXSvTwOP8aJcll3WDw==
X-CSE-MsgGUID: +0Dw6X77TGijWwL/1pTVVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="247704096"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 19:34:35 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 19:34:34 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 1 Jun 2026 19:34:34 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.11) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 19:34:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n6Fi1cDFWDzFcaMNgoqMUzuwyoHY5m1eTjcV2+rhTE6BUHb6eh5dMNIn15QSi109gXIhyYtf3dbTHRK2iP5e3MAe6UF+tZVN0Q/QVS8gkTOVtZsd3YoqJAbJu1B7kO5Vp8mglGYvvkwLMRvFmZr10uktXQ2JqEAbOdqmUY7hItpDKi7phWQUONOqchx47Qzb+q8gqrT2tYRMNA5aDYRKutsHUprYSmP6P6oRYMHO+qxggflKDDXRBiFW7rsFrwlsGIQjL+LEDnIYLLr7PlWMv51l7p9MLTozoqXM02cbP7rNYmMcVt7qARW4iyOyDjERioRx7CK8eFhTGcqrdUyXdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ukaWDrAeSvEMEvLth5ujhrvXGrg9+iAaMN+jL9gDxng=;
 b=efL7WBokRiDX8X/g8Yo4OejMZ8cC/YXd0vgH2KNu59CbbL5YBhApCoTsJVDHwQ/UOrUZ0oqoI52gkFMQ3SC9LJWyMy1vTIlqNCNRUN4NAUXaeHMlvB2hZ8xchljY77I6qecgBM/ZwTBfBRytRG5rDCTX0YiTpoV554shwU7pgRs664HsS2g+R8a4E8E8XvHRkXdJafeLI2sgoRYFetDkLXaUvAhhhhIPctO5hWmTGiZn7EBnAHyYAcvEcTFJWe0s4VWWa3DBtHSa/D6aSLHKMI3/hWBHo5eeeHW9shi7HaF3U6sHIy/VrXm09QzmrKF342sJVf99cdewx9P4iQ6UVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by LV8PR11MB8557.namprd11.prod.outlook.com (2603:10b6:408:1e8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Tue, 2 Jun 2026
 02:34:29 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%5]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 02:34:29 +0000
Date: Tue, 2 Jun 2026 10:34:22 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Chen Yu <yu.c.chen@intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Peter Zijlstra
	<peterz@infradead.org>, Libo Chen <libchen@purestorage.com>, Adam Li
	<adamli@os.amperecomputing.com>, Tim Chen <tim.c.chen@linux.intel.com>,
	<linux-kernel@vger.kernel.org>, <aubrey.li@linux.intel.com>,
	<yu.c.chen@intel.com>, <oliver.sang@intel.com>
Subject: [linux-next:master] [sched/cache]  d59f4fd1d3:
 pts.libgav1.SummerNature4K.fps 38.4% improvement
Message-ID: <202606020934.f9ffc394-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: TPYP295CA0059.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:8::20) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|LV8PR11MB8557:EE_
X-MS-Office365-Filtering-Correlation-Id: 714ba483-b9f9-4341-b66a-08dec04f78a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|6133799003|3023799007|11063799006|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: m35azbGoGVFkiYoAH3azCbIZ2627VNJX03adRDIQ/tU6CmsG32H98mpTWcByR/iUnTRe42L7dznt0l8gH2rDtn18pqFPls0oMcIBKXVXpt2FVXkE3phYdFr02yu/qH1H3y02ZXa1asBXUX5qtqiQK+WSo8qqH5WRmxbnOyNvLj37smDBQdhxkfXKpcFMgeqaSJEfRlBn8T9Sls3eRsle07rNWgzeMiWfjGLHj4xfyupdecXlYj6ysMlILxFDRjrk0/DCHMTMhDqXCN63yrlX25YIiSWUCZB57+6akU9ZX62EDbgja7rtfHwV6bZGiPc69eSVrsNXZHHqPbpY4MsXQ0CkabBH/elN/bAcluRpY5VojyLKnkcSEjN94Fr8VIgBnwj9a/mf4sOfMlHITYMbS0kUlgFbd0zquZ4LVyVPrx+QmXxNpFgGEJf2H913RMPGvezBCY1R2jyxfV5s5R7KlX0JZIVV3XSVwwCLiqFjHWXz+onpVSfBBKEtuOK6AJw6u6LMjGWZKjijmkA21TGFKSAx3NzmgPkc7DgI/AE8GwznwOvfIzboU5h7QtqbiSDFo5ib/JMqTEkwAlStiCLxuI9sEIQ+rZhSfrk3+rc7NpH+/9Sss6c/L0O4pBZc4UxRZiPRB8gCeVU5Rr5IZdpXhA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(6133799003)(3023799007)(11063799006)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?k2jb2NcbkOijKGhDYisjFUy3EOrubPJLKb6gUmKykML33e8vofRg5UcXhq?=
 =?iso-8859-1?Q?KsBin4XHROgqeDWGlJ7XNHJ50o9R9aDPQPb2UHAWfpkzAIGJubKaShQIBA?=
 =?iso-8859-1?Q?hAttl/aKiWM2yLbYe52bFOEMsI8mUGVUCOHsLWZ803ai0LcnE1D7pepSzL?=
 =?iso-8859-1?Q?etj5O1PXI8+5Gu8EAjN5bVxa9JSohKWd085WVIo/kedg1cJHIrcSVTWEI3?=
 =?iso-8859-1?Q?dJd3Q94cLM8aU8kY+rna8gNmimjzl/wcILnRWsPRR/fcrhAmCH3eldU13f?=
 =?iso-8859-1?Q?RDbh/UCl8v2IwohXCmfYHvSg0uhbsSuko8qDYPRWGC/wlMsHe75JbIHZjJ?=
 =?iso-8859-1?Q?N1NFtQzLBBT1hMf2d0HcNzHAtQJCJ59uAnSw+5xdrv7hgYoHDMEERGdTn0?=
 =?iso-8859-1?Q?JIzzybrx93cfU7qk+xsLnCag13kcw9Bq/ikcZwwZ1FW/dC56KwYPqBFSgS?=
 =?iso-8859-1?Q?2QgM16aDmRnseP0pfjSSLdnlovFBXls8RViwoYtEnbpdze07P6Q5cyGANQ?=
 =?iso-8859-1?Q?h7gIEht23d1orJjnwKOQZrv+omlQJy+kiNlddWk+I5q2tNuG/WyuMx45pR?=
 =?iso-8859-1?Q?w7nQQ5pZP7fxg1uxXbK0Xnoizq8vUYY6jFPNU+qIQiQlsjag0EflpiAacd?=
 =?iso-8859-1?Q?ccTl7NdoA2jRsoD2B3t+1LNIUK3W+2CsudVLmzO1Yggmd4zHUOxdmxVTdx?=
 =?iso-8859-1?Q?tgnAu4rmsSk7ln6xXMjPs+ymjw3iWy9OCkM/TZzri2sxamanLloI5rrAow?=
 =?iso-8859-1?Q?p5cT02XnD169FeZ5XOdApRWaaaq2sacF1q1lg8esNMad2zlJh2yuZrcw69?=
 =?iso-8859-1?Q?RWvG00GqcRRebakDEH/7sWGfA4qxCUAvvjpZDmpRhO6SrUW/6LZxq/FIgz?=
 =?iso-8859-1?Q?IS4UYg8ZRT2MGjli2uV8yTL8qW5qGIJzUhizsVhU+bYYTzZgCI5MV77q1l?=
 =?iso-8859-1?Q?6d7tT84a5gIHgPHlEZQQePXh720EUtPdvyTSnVcidlbbA1/nG+MQVTYvke?=
 =?iso-8859-1?Q?znDGKS/7RGDwoXRszP/ji7lXBXlJDkrLNkRKCpGBlwyuwSWxtPPYABMN6Q?=
 =?iso-8859-1?Q?7KYE4gxS1bkBEZo1PNUgI9c/JH09sIT6GWvwWQH8WXM6QWeAeuDpFlrA/L?=
 =?iso-8859-1?Q?SefVGSrjNx7jccMCN+hse246/F88NrfJ5XtCffj2BRwt2I40f7A9lTPgHy?=
 =?iso-8859-1?Q?0kOfO197PGMZYAe07G1nOO6ZFb/2Vg8ZfG7wiKvkCGlG6MEKR/qrCxviA0?=
 =?iso-8859-1?Q?G0TCJ4QxWhv/+gKmJV3MewWw2FNcb+I+nLlRcr2WDLHNNc+v2TZZ5EG5Ms?=
 =?iso-8859-1?Q?GKRcD3wxXIQBZZu+BknbHHezKcIQeIWf2lhacoT0GyfN7kaV3flUjucOSp?=
 =?iso-8859-1?Q?VFn0M+R68sVSaroNKcWYVSS5aD4QRgt56+AYHmKptigI1lsHao2CAR+vt2?=
 =?iso-8859-1?Q?cgegj+Yuhtz3BnFlj1HVlATGV5EfiyGdDMLbE7slxscOlmOyGmVd6MG2m1?=
 =?iso-8859-1?Q?vYSmxk5anyEW66Oye461vTUkVZkQPrcp2gVqrbjrBGPsuhizRZDsNMe2WX?=
 =?iso-8859-1?Q?g2YTOJ2Ctis/zCkpF0JA1exdwcfQzym+atlhPP2uYLPZZTaLtVP4j304lm?=
 =?iso-8859-1?Q?rLRXHyxbCD0F2xxHzNwNyg8gdaXyyVPiqpJ7mmyM1+WFi/GYv8GLtQrYsR?=
 =?iso-8859-1?Q?H/bYUzq8n/Jc5yLlTi10BlP8hcMVVsDXdMIQXG768cHllN03lccLUEs+/j?=
 =?iso-8859-1?Q?P6mWComMMD3jZv1N5z0a0pI+yRKHb+X2JcnU9madZ8zvh/pBBdvMrodc0w?=
 =?iso-8859-1?Q?2M+2dU6j8w=3D=3D?=
X-Exchange-RoutingPolicyChecked: PzJi7ug6Era8aSMcVzAj5RlU9aenaZsXjPkvyReCOcFeXrZ7X/E7I2E8GFm+k1StnTcgPgRO8La5zuQk3Kk2PSyLRIqdHXyVCdxyLufbqnoNi+EYePEAc6142TIzUiw/RBr6p4TND98DHq7kKEeEZcTpz6X0bstroAT8OJbUSnXFPRykkNftgifwqr1tNx9VH9RTh8GQLhygXeGqS9dRRJOtQY4ck94uZ8xyws/AQxpjfqoWu4wh417rIEEOcP1HU1Na+rkjH9bIRdDKOdO3lYVUV7pLR9qnZQcv3De7/6sMm6KJsk+SHtbK3Tk8Yw26+VyGAtvh8dMSbeLv/Tgr4w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 714ba483-b9f9-4341-b66a-08dec04f78a8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 02:34:29.5654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DYDJ8P5OUp8vg+pOMkE12gAF0lIl3BUE5iXnJXPwXTx1spQ/s8SgatHrG1tdhfRaQnPugbIODK0ou4r4KHKLJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8557
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 38.4% improvement of pts.libgav1.SummerNature4K.fps on:


commit: d59f4fd1d303987f434bcf0b8191e89ca1d6a67c ("sched/cache: Enable cache aware scheduling for multi LLCs NUMA node")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master


testcase: pts
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 256 threads 2 sockets Intel(R) Xeon(R) 6767P  CPU @ 2.4GHz (Granite Rapids) with 256G memory
parameters:

	test: libgav1-1.2.1
	option_a: Summer Nature 4K
	cpufreq_governor: performance



Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260602/202606020934.f9ffc394-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/option_a/rootfs/tbox_group/test/testcase:
  gcc-14/performance/x86_64-rhel-9.4/Summer Nature 4K/debian-12-x86_64-phoronix/lkp-gnr-2sp3/libgav1-1.2.1/pts

commit: 
  5b1d5e6db2 ("sched/cache: Respect LLC preference in task migration and detach")
  d59f4fd1d3 ("sched/cache: Enable cache aware scheduling for multi LLCs NUMA node")

5b1d5e6db20a6c64 d59f4fd1d303987f434bcf0b819 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     28.24           +38.4%      39.10        pts.libgav1.SummerNature4K.fps
    141.50           -25.0%     106.12        pts.time.elapsed_time
    141.50           -25.0%     106.12        pts.time.elapsed_time.max
      3326 ± 32%     -41.4%       1950 ±  7%  pts.time.involuntary_context_switches
    800.00            -3.6%     771.17        pts.time.percent_of_cpu_this_job_got
     80.21 ±  2%     -21.5%      62.97        pts.time.system_time
      1052           -28.2%     755.90        pts.time.user_time
  11593668            -4.7%   11047354        pts.time.voluntary_context_switches
    150157           +10.5%     165861        meminfo.Mapped
 3.551e+10           -24.6%  2.677e+10        cpuidle..time
  46768872           -20.3%   37277986        cpuidle..usage
      6179           +31.8%       8145        vmstat.io.bi
    163458 ±  2%     +25.9%     205769        vmstat.system.cs
    346136            +5.6%     365486        vmstat.system.in
      0.00 ±  3%      +0.0        0.00 ±  6%  mpstat.cpu.all.iowait%
      0.88 ±  2%      +0.1        0.99 ±  5%  mpstat.cpu.all.irq%
      0.25 ±  2%      +0.0        0.26        mpstat.cpu.all.sys%
     37.83           +36.6%      51.67 ± 18%  mpstat.max_utilization.seconds
    704281            +1.8%     716988        proc-vmstat.nr_active_anon
     62886            -2.3%      61444        proc-vmstat.nr_inactive_file
     37843           +10.4%      41764        proc-vmstat.nr_mapped
      3776            +4.2%       3936        proc-vmstat.nr_page_table_pages
    440831            +2.8%     453197        proc-vmstat.nr_shmem
    704281            +1.8%     716988        proc-vmstat.nr_zone_active_anon
     62886            -2.3%      61444        proc-vmstat.nr_zone_inactive_file
     81481 ± 10%     +38.4%     112765 ± 19%  proc-vmstat.numa_hint_faults_local
   1673457            -3.7%    1610857        proc-vmstat.numa_hit
   1407798            -4.4%    1346190        proc-vmstat.numa_local
   1987398            -5.3%    1881889        proc-vmstat.pgalloc_normal
   1035995           -10.1%     930869 ±  3%  proc-vmstat.pgfault
   1605073           -15.0%    1364507        proc-vmstat.pgfree
     57433 ±  9%     -40.8%      34000 ± 16%  proc-vmstat.pgreuse
      0.00 ± 47%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.cpu_stop_queue_work.stop_one_cpu.migrate_task_to
      0.00 ± 27%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.stop_two_cpus.migrate_swap.task_numa_migrate
      0.00           -50.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0
      0.01 ± 12%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.cpu_stop_queue_work.stop_one_cpu.migrate_task_to
      0.01 ± 13%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.stop_two_cpus.migrate_swap.task_numa_migrate
      5.72 ±  5%     -32.2%       3.88 ±  2%  perf-sched.total_wait_and_delay.average.ms
    458887 ±  4%     +35.9%     623426        perf-sched.total_wait_and_delay.count.ms
      5.72 ±  6%     -32.2%       3.88 ±  2%  perf-sched.total_wait_time.average.ms
      1.39 ±  4%     -34.3%       0.91 ±  2%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      1.36 ±  4%     -26.3%       1.00        perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.futex_do_wait.__futex_wait.futex_wait.do_futex
    235.96 ±  2%     -21.6%     185.03 ±  3%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0
     15872 ±  8%     +28.6%      20418 ±  3%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
    433796 ±  4%     +36.9%     593981        perf-sched.wait_and_delay.count.perf_trace_sched_switch.futex_do_wait.__futex_wait.futex_wait.do_futex
      1.50 ±223%    +911.1%      15.17 ± 12%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
    171.33 ±  2%     +27.3%     218.17 ±  3%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0
    837.67 ± 12%     -35.1%     543.83 ±  5%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      1.00 ±223%    +500.5%       6.00        perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
    161.85 ±  5%     +12.1%     181.43 ±  3%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.anon_pipe_read.fifo_pipe_read.vfs_read.ksys_read
      1.39 ±  4%     -34.4%       0.91 ±  2%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.39 ±  3%      +8.4%       0.42 ±  3%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.36 ±  4%     -26.3%       1.00        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.futex_do_wait.__futex_wait.futex_wait.do_futex
      1.43 ±117%    -100.0%       0.00        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.cpu_stop_queue_work.stop_one_cpu.migrate_task_to
      1.86 ± 72%    -100.0%       0.00        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.stop_two_cpus.migrate_swap.task_numa_migrate
    235.96 ±  2%     -21.6%     185.03 ±  3%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0
      0.51 ±  3%     +11.8%       0.57 ±  3%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.schedule_timeout.wait_for_completion_state.kernel_clone.__x64_sys_vfork
      7.36 ± 64%    -100.0%       0.00        perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.cpu_stop_queue_work.stop_one_cpu.migrate_task_to
      6.41 ± 64%    -100.0%       0.00        perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.stop_two_cpus.migrate_swap.task_numa_migrate
      3.01 ±  5%     -94.9%       0.15 ±  6%  perf-stat.i.MPKI
 2.036e+09           +27.5%  2.595e+09        perf-stat.i.branch-instructions
      2.01            +0.0        2.04        perf-stat.i.branch-miss-rate%
  42575007           +32.0%   56202927        perf-stat.i.branch-misses
     32.33 ±  5%     -29.7        2.68 ±  5%  perf-stat.i.cache-miss-rate%
  53090528 ±  5%     -95.6%    2345703 ±  5%  perf-stat.i.cache-misses
 1.583e+08           +26.8%  2.007e+08        perf-stat.i.cache-references
    167256 ±  2%     +26.9%     212247        perf-stat.i.context-switches
      2.34           -20.4%       1.86        perf-stat.i.cpi
    367.09           +64.9%     605.38 ±  8%  perf-stat.i.cpu-migrations
      1468 ±  6%   +2225.2%      34134 ±  5%  perf-stat.i.cycles-between-cache-misses
   1727467 ±  6%     +51.6%    2618711 ±  8%  perf-stat.i.dTLB-load-misses
 3.983e+09           +29.6%  5.161e+09        perf-stat.i.dTLB-loads
    748342 ±  5%     +40.5%    1051255 ±  9%  perf-stat.i.dTLB-store-misses
 1.964e+09           +29.3%   2.54e+09        perf-stat.i.dTLB-stores
 1.692e+10           +30.0%  2.199e+10        perf-stat.i.instructions
      0.44           +26.9%       0.56        perf-stat.i.ipc
      1.62           +27.5%       2.06 ±  6%  perf-stat.i.major-faults
    678.40            +9.3%     741.70        perf-stat.i.metric.K/sec
     31.16           +29.2%      40.26        perf-stat.i.metric.M/sec
      6545           +18.1%       7731 ±  3%  perf-stat.i.minor-faults
     96.17           -25.8       70.37 ±  3%  perf-stat.i.node-load-miss-rate%
   9489246 ±  6%     -97.2%     270341 ± 10%  perf-stat.i.node-load-misses
    211511 ±  3%     -50.4%     104810 ±  8%  perf-stat.i.node-loads
      6547           +18.1%       7733 ±  3%  perf-stat.i.page-faults
      3.14 ±  6%     -96.6%       0.11 ±  5%  perf-stat.overall.MPKI
      2.09            +0.1        2.17        perf-stat.overall.branch-miss-rate%
     33.55 ±  6%     -32.4        1.17 ±  5%  perf-stat.overall.cache-miss-rate%
      2.28           -22.8%       1.76        perf-stat.overall.cpi
    730.54 ±  6%   +2173.9%      16611 ±  5%  perf-stat.overall.cycles-between-cache-misses
      0.44           +29.6%       0.57        perf-stat.overall.ipc
     97.81           -25.9       71.96 ±  2%  perf-stat.overall.node-load-miss-rate%
 2.022e+09           +27.2%  2.572e+09        perf-stat.ps.branch-instructions
  42276911           +31.8%   55704478        perf-stat.ps.branch-misses
  52743457 ±  5%     -95.6%    2319603 ±  5%  perf-stat.ps.cache-misses
 1.573e+08           +26.5%   1.99e+08        perf-stat.ps.cache-references
    166214 ±  2%     +26.6%     210390        perf-stat.ps.context-switches
    364.30           +64.6%     599.74 ±  8%  perf-stat.ps.cpu-migrations
   1716129 ±  6%     +51.3%    2595685 ±  8%  perf-stat.ps.dTLB-load-misses
 3.956e+09           +29.3%  5.115e+09        perf-stat.ps.dTLB-loads
    743385 ±  5%     +40.1%    1041819 ±  9%  perf-stat.ps.dTLB-store-misses
 1.951e+09           +29.0%  2.517e+09        perf-stat.ps.dTLB-stores
  1.68e+10           +29.7%  2.179e+10        perf-stat.ps.instructions
      1.59           +27.6%       2.03 ±  5%  perf-stat.ps.major-faults
      6476           +17.9%       7637 ±  3%  perf-stat.ps.minor-faults
   9428376 ±  6%     -97.2%     267540 ± 10%  perf-stat.ps.node-load-misses
    210126 ±  3%     -50.6%     103774 ±  8%  perf-stat.ps.node-loads
      6478           +17.9%       7639 ±  3%  perf-stat.ps.page-faults
 2.395e+12            -2.7%   2.33e+12        perf-stat.total.instructions
    170236 ± 12%     -35.3%     110223 ± 18%  sched_debug.cfs_rq:/.avg_vruntime.max
     23176 ± 15%     -25.8%      17196 ± 25%  sched_debug.cfs_rq:/.avg_vruntime.stddev
     62.94 ±  5%     +18.9%      74.84 ±  9%  sched_debug.cfs_rq:/.runnable_avg.avg
     62.83 ±  5%     +18.9%      74.71 ±  9%  sched_debug.cfs_rq:/.util_avg.avg
    170236 ± 12%     -35.3%     110223 ± 18%  sched_debug.cfs_rq:/.zero_vruntime.max
     23176 ± 15%     -25.8%      17196 ± 25%  sched_debug.cfs_rq:/.zero_vruntime.stddev
     34851 ± 16%     -21.5%      27360 ± 17%  sched_debug.cfs_rq:/system.slice.avg_vruntime.avg
    140597 ± 16%     -49.6%      70861 ±  9%  sched_debug.cfs_rq:/system.slice.avg_vruntime.max
     17265 ±  6%     -45.1%       9475 ± 18%  sched_debug.cfs_rq:/system.slice.avg_vruntime.stddev
     83.67 ±  6%     -19.6%      67.25 ±  4%  sched_debug.cfs_rq:/system.slice.load_avg.max
     10.88 ±  2%     -12.3%       9.54 ±  8%  sched_debug.cfs_rq:/system.slice.load_avg.stddev
     83.31 ±  3%     +25.2%     104.34 ±  8%  sched_debug.cfs_rq:/system.slice.runnable_avg.avg
     83.29 ±  3%     +25.3%     104.33 ±  8%  sched_debug.cfs_rq:/system.slice.se->avg.runnable_avg.avg
     83.27 ±  3%     +25.3%     104.30 ±  8%  sched_debug.cfs_rq:/system.slice.se->avg.util_avg.avg
     77275 ±  5%     -23.1%      59449 ±  9%  sched_debug.cfs_rq:/system.slice.se->load.weight.avg
     46613 ±  7%     -28.7%      33212 ± 12%  sched_debug.cfs_rq:/system.slice.se->load.weight.min
      2423 ±  8%     -24.6%       1827 ±  3%  sched_debug.cfs_rq:/system.slice.se->sum_exec_runtime.avg
     15851 ± 13%     -34.4%      10391 ± 13%  sched_debug.cfs_rq:/system.slice.se->sum_exec_runtime.max
      1886 ±  6%     -33.4%       1256 ±  6%  sched_debug.cfs_rq:/system.slice.se->sum_exec_runtime.stddev
    167426 ± 13%     -35.1%     108634 ± 19%  sched_debug.cfs_rq:/system.slice.se->vruntime.max
     23093 ± 15%     -29.1%      16362 ± 27%  sched_debug.cfs_rq:/system.slice.se->vruntime.stddev
     83.29 ±  3%     +25.2%     104.31 ±  8%  sched_debug.cfs_rq:/system.slice.util_avg.avg
     34851 ± 16%     -21.5%      27360 ± 17%  sched_debug.cfs_rq:/system.slice.zero_vruntime.avg
    140597 ± 16%     -49.6%      70861 ±  9%  sched_debug.cfs_rq:/system.slice.zero_vruntime.max
     17265 ±  6%     -45.1%       9475 ± 18%  sched_debug.cfs_rq:/system.slice.zero_vruntime.stddev
      2623           -35.6%       1691 ±  3%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.avg_vruntime.avg
      1785 ± 12%     -30.8%       1236 ±  4%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.avg_vruntime.stddev
     10.71 ± 92%     -82.6%       1.86 ±219%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.left_deadline.avg
     10.70 ± 92%     -82.7%       1.86 ±220%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.left_vruntime.avg
    133.59 ±  5%     +20.5%     160.97 ±  9%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.load_avg.avg
    341.33           +53.0%     522.33 ±  4%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.removed.load_avg.max
    173.17           +57.3%     272.33 ±  8%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.removed.runnable_avg.max
     27.48 ± 19%     +59.1%      43.72 ± 24%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.removed.runnable_avg.stddev
    173.17           +57.3%     272.33 ±  8%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.removed.util_avg.max
     27.48 ± 19%     +59.1%      43.72 ± 24%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.removed.util_avg.stddev
     10.70 ± 92%     -82.7%       1.86 ±220%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.right_vruntime.avg
     92.29 ±  3%     +15.1%     106.19 ±  8%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.runnable_avg.avg
     83.50 ±  6%     -19.9%      66.92 ±  4%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.se->avg.load_avg.max
     11.75 ±  4%     -18.5%       9.57 ±  8%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.se->avg.load_avg.stddev
     92.22 ±  3%     +15.0%     106.04 ±  8%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.se->avg.runnable_avg.avg
     92.20 ±  3%     +15.0%     106.01 ±  8%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.se->avg.util_avg.avg
     74344 ±  4%     -21.5%      58348 ±  5%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.se->load.weight.avg
     60081 ±  3%     -24.5%      45384 ±  7%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.se->load.weight.min
      2623           -35.5%       1691 ±  3%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.se->sum_exec_runtime.avg
      1784 ± 12%     -30.8%       1235 ±  4%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.se->sum_exec_runtime.stddev
     38014 ± 13%     -27.7%      27490 ± 17%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.se->vruntime.avg
    128601 ± 24%     -44.9%      70861 ±  9%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.se->vruntime.max
     16281 ± 11%     -42.9%       9292 ± 18%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.se->vruntime.stddev
     18953 ±  3%     +26.7%      24013 ±  4%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.tg_load_avg.avg
     32217 ±  4%     +27.7%      41129 ±  3%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.tg_load_avg.max
     14359 ±  2%     +23.4%      17714 ±  2%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.tg_load_avg.min
      3618 ± 13%     +32.6%       4796 ±  8%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.tg_load_avg.stddev
    130.53 ±  4%     +27.1%     165.84 ±  8%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.tg_load_avg_contrib.avg
    202.51 ±  5%     +14.7%     232.24 ±  6%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.tg_load_avg_contrib.stddev
     92.27 ±  3%     +15.1%     106.16 ±  8%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.util_avg.avg
      2623           -35.6%       1691 ±  3%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.zero_vruntime.avg
      1785 ± 12%     -30.8%       1236 ±  4%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.zero_vruntime.stddev
      7801           -15.0%       6629        sched_debug.cpu.curr->pid.max
     40773           -37.7%      25401        sched_debug.cpu.nr_switches.avg
     29573 ±  2%     -12.3%      25921 ±  3%  sched_debug.cpu.nr_switches.stddev
      6.40 ±  3%      -2.8        3.60 ±  7%  perf-profile.calltrace.cycles-pp.libgav1::BlockParametersHolder::Get
      4.71 ±  3%      -1.5        3.26 ±  7%  perf-profile.calltrace.cycles-pp.libgav1::Tile::DecodeSuperBlock
      3.78 ±  2%      -1.3        2.51 ±  8%  perf-profile.calltrace.cycles-pp.libgav1::Tile::ReadPartition
      6.79 ±  3%      -0.9        5.88 ±  5%  perf-profile.calltrace.cycles-pp.libgav1::Tile::ReadInterBlockModeInfo
      5.19 ±  5%      -0.9        4.33 ±  9%  perf-profile.calltrace.cycles-pp.libgav1::Tile::InterPrediction
      4.40 ±  4%      -0.6        3.84 ±  3%  perf-profile.calltrace.cycles-pp.asm_sysvec_call_function_single.pv_native_safe_halt.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter
      1.53 ±  3%      -0.5        1.02 ±  8%  perf-profile.calltrace.cycles-pp.libgav1::EntropyDecoder::ReadSymbol<4>
      7.00            -0.5        6.51 ±  4%  perf-profile.calltrace.cycles-pp.libgav1::Tile::BlockInterPrediction
      2.14            -0.5        1.65        perf-profile.calltrace.cycles-pp.syscall
      2.07            -0.5        1.58        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.syscall
      2.06            -0.5        1.58        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      2.00            -0.5        1.52        perf-profile.calltrace.cycles-pp.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      2.00            -0.5        1.53        perf-profile.calltrace.cycles-pp.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      2.09 ±  5%      -0.5        1.62 ±  4%  perf-profile.calltrace.cycles-pp.sysvec_call_function_single.asm_sysvec_call_function_single.pv_native_safe_halt.acpi_safe_halt.acpi_idle_do_entry
      1.30 ±  3%      -0.5        0.84 ± 27%  perf-profile.calltrace.cycles-pp.__schedule.schedule.futex_do_wait.__futex_wait.futex_wait
      2.62 ±  5%      -0.4        2.17 ±  4%  perf-profile.calltrace.cycles-pp.futex_wake.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.66 ±  2%      -0.4        1.26 ±  5%  perf-profile.calltrace.cycles-pp.malloc
      1.78 ±  5%      -0.4        1.38 ±  3%  perf-profile.calltrace.cycles-pp.__sysvec_call_function_single.sysvec_call_function_single.asm_sysvec_call_function_single.pv_native_safe_halt.acpi_safe_halt
      1.76 ±  5%      -0.4        1.36 ±  4%  perf-profile.calltrace.cycles-pp.__flush_smp_call_function_queue.__sysvec_call_function_single.sysvec_call_function_single.asm_sysvec_call_function_single.pv_native_safe_halt
      2.73 ±  3%      -0.4        2.36 ±  3%  perf-profile.calltrace.cycles-pp.__futex_wait.futex_wait.do_futex.__x64_sys_futex.do_syscall_64
      2.74 ±  3%      -0.4        2.37 ±  3%  perf-profile.calltrace.cycles-pp.futex_wait.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.69 ±  7%      -0.4        0.34 ± 70%  perf-profile.calltrace.cycles-pp.__sched_balance_update_blocked_averages.sched_balance_update_blocked_averages.sched_balance_softirq.handle_softirqs.__irq_exit_rcu
      1.95 ±  2%      -0.3        1.62 ±  7%  perf-profile.calltrace.cycles-pp.libgav1::Tile::ProcessBlock
      1.24 ±  2%      -0.3        0.90 ±  8%  perf-profile.calltrace.cycles-pp.libgav1::Tile::ReadTransformCoefficients<short>
      1.13 ±  4%      -0.3        0.80 ±  9%  perf-profile.calltrace.cycles-pp.libgav1::Tile::TransformBlock
      0.66 ±  3%      -0.3        0.38 ± 71%  perf-profile.calltrace.cycles-pp.__schedule.schedule_idle.do_idle.cpu_startup_entry.start_secondary
      0.59 ±  4%      -0.3        0.34 ± 70%  perf-profile.calltrace.cycles-pp.enqueue_entity.enqueue_task_fair.enqueue_task.ttwu_do_activate.sched_ttwu_pending
      1.20 ±  5%      -0.2        0.96 ±  3%  perf-profile.calltrace.cycles-pp.sched_ttwu_pending.__flush_smp_call_function_queue.__sysvec_call_function_single.sysvec_call_function_single.asm_sysvec_call_function_single
      1.19 ±  4%      -0.2        0.98 ±  8%  perf-profile.calltrace.cycles-pp.libgav1::Tile::ObmcPrediction
      0.67 ±  3%      -0.2        0.47 ± 45%  perf-profile.calltrace.cycles-pp.schedule_idle.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      1.59 ±  3%      -0.2        1.41 ±  5%  perf-profile.calltrace.cycles-pp.futex_do_wait.__futex_wait.futex_wait.do_futex.__x64_sys_futex
      1.45 ±  3%      -0.2        1.27 ±  4%  perf-profile.calltrace.cycles-pp.schedule.futex_do_wait.__futex_wait.futex_wait.do_futex
      0.73 ±  6%      -0.2        0.56 ±  3%  perf-profile.calltrace.cycles-pp.sched_balance_update_blocked_averages.sched_balance_softirq.handle_softirqs.__irq_exit_rcu.sysvec_apic_timer_interrupt
      0.73 ±  6%      -0.2        0.57 ±  3%  perf-profile.calltrace.cycles-pp.sched_balance_softirq.handle_softirqs.__irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      0.86 ±  5%      -0.2        0.70 ±  3%  perf-profile.calltrace.cycles-pp.ttwu_do_activate.sched_ttwu_pending.__flush_smp_call_function_queue.__sysvec_call_function_single.sysvec_call_function_single
      1.76 ±  5%      -0.2        1.61 ±  5%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__lll_lock_wait_private
      1.66 ±  5%      -0.1        1.52 ±  5%  perf-profile.calltrace.cycles-pp.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe.__lll_lock_wait_private
      0.66 ±  4%      -0.1        0.54 ±  2%  perf-profile.calltrace.cycles-pp.enqueue_task_fair.enqueue_task.ttwu_do_activate.sched_ttwu_pending.__flush_smp_call_function_queue
      0.69 ±  5%      -0.1        0.58 ±  3%  perf-profile.calltrace.cycles-pp.enqueue_task.ttwu_do_activate.sched_ttwu_pending.__flush_smp_call_function_queue.__sysvec_call_function_single
      0.82 ±  4%      -0.1        0.74 ±  5%  perf-profile.calltrace.cycles-pp.libgav1::PostFilter::ApplyLoopRestorationWorker
      0.64 ±  5%      +0.1        0.75 ±  7%  perf-profile.calltrace.cycles-pp.libgav1::PostFilter::HorizontalDeblockFilter
      0.88 ±  6%      +0.5        1.38 ± 12%  perf-profile.calltrace.cycles-pp.sched_tick.update_process_times.tick_nohz_handler.__hrtimer_run_queues.hrtimer_interrupt
      0.77 ± 19%      +0.6        1.40 ± 21%  perf-profile.calltrace.cycles-pp.menu_select.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
      0.42 ± 75%      +0.7        1.13 ± 25%  perf-profile.calltrace.cycles-pp.tick_nohz_get_sleep_length.menu_select.cpuidle_idle_call.do_idle.cpu_startup_entry
      0.22 ±145%      +0.8        1.01 ± 28%  perf-profile.calltrace.cycles-pp.tick_nohz_next_event.tick_nohz_get_sleep_length.menu_select.cpuidle_idle_call.do_idle
      0.00            +0.9        0.87 ± 11%  perf-profile.calltrace.cycles-pp.sched_balance_rq.sched_balance_domains.handle_softirqs.__irq_exit_rcu.sysvec_apic_timer_interrupt
      0.00            +0.9        0.92 ± 10%  perf-profile.calltrace.cycles-pp.sched_balance_domains.handle_softirqs.__irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      0.00            +0.9        0.94 ± 18%  perf-profile.calltrace.cycles-pp.rcu_core.handle_softirqs.__irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      1.53 ±  4%      +1.0        2.54 ± 11%  perf-profile.calltrace.cycles-pp.handle_softirqs.__irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.pv_native_safe_halt
      1.61 ±  4%      +1.1        2.68 ± 10%  perf-profile.calltrace.cycles-pp.__irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.pv_native_safe_halt.acpi_safe_halt
      0.94 ±  8%      +1.6        2.52 ± 11%  perf-profile.calltrace.cycles-pp.ktime_get_update_offsets_now.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      2.36 ± 25%      +1.9        4.25 ± 22%  perf-profile.calltrace.cycles-pp.ktime_get.perf_mux_hrtimer_handler.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt
      2.67 ± 22%      +2.1        4.73 ± 19%  perf-profile.calltrace.cycles-pp.perf_mux_hrtimer_handler.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      2.80 ± 24%      +2.4        5.20 ± 25%  perf-profile.calltrace.cycles-pp.update_process_times.tick_nohz_handler.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt
      3.86 ± 23%      +3.1        6.98 ± 25%  perf-profile.calltrace.cycles-pp.tick_nohz_handler.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      6.83 ± 10%      +5.4       12.19 ± 15%  perf-profile.calltrace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      8.17 ±  8%      +7.2       15.36 ± 13%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.pv_native_safe_halt
      8.26 ±  8%      +7.2       15.49 ± 13%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.pv_native_safe_halt.acpi_safe_halt
     13.00 ±  4%      +8.6       21.61 ± 11%  perf-profile.calltrace.cycles-pp.pv_native_safe_halt.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state
     10.33 ±  6%      +8.7       19.04 ± 12%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.pv_native_safe_halt.acpi_safe_halt.acpi_idle_do_entry
     20.68 ±  3%     +12.0       32.68 ±  8%  perf-profile.calltrace.cycles-pp.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
     20.68 ±  3%     +12.0       32.67 ±  8%  perf-profile.calltrace.cycles-pp.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter
     20.69 ±  3%     +12.0       32.69 ±  8%  perf-profile.calltrace.cycles-pp.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
     20.98 ±  3%     +12.0       33.01 ±  8%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
     21.00 ±  3%     +12.0       33.03 ±  8%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
     22.81 ±  3%     +12.6       35.44 ±  8%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.common_startup_64
     22.82 ±  3%     +12.6       35.46 ±  8%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.common_startup_64
     22.82 ±  3%     +12.6       35.46 ±  8%  perf-profile.calltrace.cycles-pp.start_secondary.common_startup_64
     22.94 ±  3%     +12.7       35.62 ±  8%  perf-profile.calltrace.cycles-pp.common_startup_64
     21.89 ±  3%     +12.7       34.60 ±  8%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.common_startup_64
     23.43 ±  3%     +15.9       39.30 ±  9%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.pv_native_safe_halt.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter
      6.40 ±  3%      -2.8        3.61 ±  7%  perf-profile.children.cycles-pp.libgav1::BlockParametersHolder::Get
      4.80 ±  3%      -1.5        3.32 ±  7%  perf-profile.children.cycles-pp.libgav1::Tile::DecodeSuperBlock
      3.79 ±  2%      -1.3        2.52 ±  8%  perf-profile.children.cycles-pp.libgav1::Tile::ReadPartition
      6.83 ±  3%      -0.9        5.92 ±  5%  perf-profile.children.cycles-pp.libgav1::Tile::ReadInterBlockModeInfo
      5.62 ±  4%      -0.9        4.74 ±  3%  perf-profile.children.cycles-pp.do_futex
      5.64 ±  4%      -0.9        4.76 ±  3%  perf-profile.children.cycles-pp.__x64_sys_futex
      5.21 ±  5%      -0.9        4.35 ± 10%  perf-profile.children.cycles-pp.libgav1::Tile::InterPrediction
      3.38 ±  4%      -0.6        2.82 ±  3%  perf-profile.children.cycles-pp.asm_sysvec_call_function_single
      1.65 ±  3%      -0.6        1.10 ±  7%  perf-profile.children.cycles-pp.libgav1::EntropyDecoder::ReadSymbol<4>
      2.20 ±  5%      -0.5        1.68 ±  4%  perf-profile.children.cycles-pp.sysvec_call_function_single
      2.19            -0.5        1.70        perf-profile.children.cycles-pp.syscall
      7.04            -0.5        6.55 ±  4%  perf-profile.children.cycles-pp.libgav1::Tile::BlockInterPrediction
      0.62 ±  8%      -0.5        0.13 ± 20%  perf-profile.children.cycles-pp.libgav1::Tile::ReadIntraBlockModeInfo
      2.74 ±  5%      -0.5        2.26 ±  4%  perf-profile.children.cycles-pp.futex_wake
      1.88 ±  5%      -0.4        1.44 ±  3%  perf-profile.children.cycles-pp.__sysvec_call_function_single
      2.85 ±  3%      -0.4        2.45 ±  3%  perf-profile.children.cycles-pp.__futex_wait
      1.67 ±  3%      -0.4        1.27 ±  5%  perf-profile.children.cycles-pp.malloc
      1.87 ±  5%      -0.4        1.47 ±  4%  perf-profile.children.cycles-pp.__flush_smp_call_function_queue
      2.86 ±  3%      -0.4        2.46 ±  3%  perf-profile.children.cycles-pp.futex_wait
      1.37 ±  2%      -0.4        0.99 ±  8%  perf-profile.children.cycles-pp.libgav1::Tile::ReadTransformCoefficients<short>
      1.98 ±  2%      -0.3        1.65 ±  7%  perf-profile.children.cycles-pp.libgav1::Tile::ProcessBlock
      0.56 ± 12%      -0.3        0.23 ±  6%  perf-profile.children.cycles-pp.absl::lts_20210324::Mutex::LockSlowLoop
      1.14 ±  3%      -0.3        0.82 ±  9%  perf-profile.children.cycles-pp.libgav1::Tile::TransformBlock
      0.45 ±  7%      -0.3        0.16 ±  5%  perf-profile.children.cycles-pp.libgav1::Tile::DistanceWeightedPrediction
      1.28 ±  5%      -0.3        1.02 ±  2%  perf-profile.children.cycles-pp.sched_ttwu_pending
      0.73 ±  3%      -0.3        0.48 ±  6%  perf-profile.children.cycles-pp.libgav1::Tile::ReadCoeffBase2D<short>
      0.51 ±  4%      -0.2        0.26 ±  7%  perf-profile.children.cycles-pp.update_load_avg
      2.14 ±  4%      -0.2        1.90 ±  4%  perf-profile.children.cycles-pp.__schedule
      1.66 ±  4%      -0.2        1.45 ±  4%  perf-profile.children.cycles-pp.futex_do_wait
      1.19 ±  4%      -0.2        0.98 ±  8%  perf-profile.children.cycles-pp.libgav1::Tile::ObmcPrediction
      0.98 ±  6%      -0.2        0.80 ±  5%  perf-profile.children.cycles-pp.try_to_wake_up
      0.71 ±  7%      -0.2        0.53 ±  3%  perf-profile.children.cycles-pp.__sched_balance_update_blocked_averages
      0.94 ±  6%      -0.2        0.77 ±  6%  perf-profile.children.cycles-pp.wake_up_q
      0.95 ±  5%      -0.2        0.77 ±  2%  perf-profile.children.cycles-pp.ttwu_do_activate
      0.57 ±  3%      -0.2        0.40 ± 12%  perf-profile.children.cycles-pp.libgav1::Tile::ReconstructBlock
      1.62 ±  4%      -0.2        1.45 ±  3%  perf-profile.children.cycles-pp.schedule
      1.07 ±  5%      -0.2        0.90 ±  6%  perf-profile.children.cycles-pp.futex_hash
      0.76 ±  6%      -0.2        0.59 ±  2%  perf-profile.children.cycles-pp.sched_balance_softirq
      0.75 ±  6%      -0.2        0.59 ±  3%  perf-profile.children.cycles-pp.sched_balance_update_blocked_averages
      0.42 ± 10%      -0.2        0.26 ±  5%  perf-profile.children.cycles-pp.absl::lts_20210324::Mutex::Lock
      0.36 ±  7%      -0.1        0.21 ±  5%  perf-profile.children.cycles-pp.absl::lts_20210324::Mutex::UnlockSlow
      0.98 ±  4%      -0.1        0.84 ±  3%  perf-profile.children.cycles-pp.futex_wait_setup
      0.74 ±  4%      -0.1        0.61 ±  2%  perf-profile.children.cycles-pp.enqueue_task_fair
      0.78 ±  5%      -0.1        0.65 ±  3%  perf-profile.children.cycles-pp.enqueue_task
      0.68 ±  3%      -0.1        0.56 ±  6%  perf-profile.children.cycles-pp.schedule_idle
      0.69 ±  4%      -0.1        0.57 ±  2%  perf-profile.children.cycles-pp.enqueue_entity
      0.42 ±  5%      -0.1        0.31 ±  9%  perf-profile.children.cycles-pp.libgav1::EntropyDecoder::ReadBit
      0.29 ±  7%      -0.1        0.19 ±  8%  perf-profile.children.cycles-pp.select_task_rq
      0.38 ±  5%      -0.1        0.29 ±  6%  perf-profile.children.cycles-pp.finish_task_switch
      0.39 ±  3%      -0.1        0.31 ± 10%  perf-profile.children.cycles-pp.libgav1::BlockParametersHolder::FillCache
      0.26 ±  8%      -0.1        0.18 ±  7%  perf-profile.children.cycles-pp.update_cfs_group
      0.28 ±  4%      -0.1        0.20 ± 13%  perf-profile.children.cycles-pp.llist_reverse_order
      0.82 ±  4%      -0.1        0.74 ±  5%  perf-profile.children.cycles-pp.libgav1::PostFilter::ApplyLoopRestorationWorker
      0.37 ±  6%      -0.1        0.30 ±  5%  perf-profile.children.cycles-pp.ttwu_queue_wakelist
      0.11 ± 17%      -0.1        0.04 ± 75%  perf-profile.children.cycles-pp.poll_idle
      0.25 ±  7%      -0.1        0.18 ±  8%  perf-profile.children.cycles-pp.__smp_call_single_queue
      0.16 ±  7%      -0.1        0.10 ± 10%  perf-profile.children.cycles-pp.absl::lts_20210324::synchronization_internal::Waiter::Wait
      0.09 ± 15%      -0.1        0.03 ±100%  perf-profile.children.cycles-pp.clock_nanosleep
      0.12 ±  4%      -0.1        0.06 ± 46%  perf-profile.children.cycles-pp.absl::lts_20210324::Mutex::LockSlowWithDeadline
      0.32 ±  9%      -0.1        0.27        perf-profile.children.cycles-pp.futex_wake_mark
      0.32 ±  4%      -0.1        0.26 ±  8%  perf-profile.children.cycles-pp.irqentry_enter
      0.16 ±  8%      -0.1        0.10 ±  5%  perf-profile.children.cycles-pp.call_function_single_prep_ipi
      0.18 ±  7%      -0.1        0.13 ±  8%  perf-profile.children.cycles-pp.pthread_mutex_lock
      0.16 ±  7%      -0.1        0.11 ±  4%  perf-profile.children.cycles-pp.absl::lts_20210324::Mutex::Unlock
      0.20 ±  3%      -0.1        0.14 ± 16%  perf-profile.children.cycles-pp.libgav1::Tile::ComputeTransformType
      0.07 ±  6%      -0.0        0.02 ± 99%  perf-profile.children.cycles-pp.absl::lts_20210324::synchronization_internal::Waiter::Post
      0.17 ±  6%      -0.0        0.12 ±  5%  perf-profile.children.cycles-pp.__resched_curr
      0.16 ±  6%      -0.0        0.11 ±  5%  perf-profile.children.cycles-pp.futex_unqueue
      0.10 ±  5%      -0.0        0.06 ± 13%  perf-profile.children.cycles-pp.absl::lts_20210324::CondVar::WaitCommon
      0.18 ±  8%      -0.0        0.14 ±  7%  perf-profile.children.cycles-pp.select_task_rq_fair
      0.14 ±  3%      -0.0        0.09 ± 17%  perf-profile.children.cycles-pp.libgav1::Tile::ReadTransformType
      0.15 ±  5%      -0.0        0.10 ±  7%  perf-profile.children.cycles-pp.task_tick_fair
      0.17 ±  4%      -0.0        0.13 ± 14%  perf-profile.children.cycles-pp.update_cfs_rq_load_avg
      0.17 ±  6%      -0.0        0.13 ±  5%  perf-profile.children.cycles-pp.wakeup_preempt
      0.14 ±  9%      -0.0        0.10 ± 11%  perf-profile.children.cycles-pp.wake_affine
      0.10 ±  4%      -0.0        0.06 ± 11%  perf-profile.children.cycles-pp.__update_load_avg_se
      0.13 ±  8%      -0.0        0.10 ± 15%  perf-profile.children.cycles-pp.futex_q_lock
      0.14 ±  4%      -0.0        0.10 ± 13%  perf-profile.children.cycles-pp.libgav1::EntropyDecoder::~EntropyDecoder
      0.11 ±  6%      -0.0        0.08 ± 16%  perf-profile.children.cycles-pp.libgav1::Tile::SetEntropyContexts
      0.15 ±  3%      -0.0        0.12 ±  8%  perf-profile.children.cycles-pp.absl::lts_20210324::CondVar::Signal
      0.10 ±  8%      -0.0        0.07 ± 10%  perf-profile.children.cycles-pp.absl::lts_20210324::Enqueue
      0.12 ±  9%      -0.0        0.09 ± 12%  perf-profile.children.cycles-pp.libgav1::Tile::ReadSkip
      0.12 ±  6%      -0.0        0.09 ± 11%  perf-profile.children.cycles-pp.libgav1::EntropyDecoder::ReadSymbol<16>
      0.11            -0.0        0.09        perf-profile.children.cycles-pp.__switch_to
      0.08 ±  5%      -0.0        0.06 ±  7%  perf-profile.children.cycles-pp.libgav1::ThreadPool::WorkerFunction
      0.07 ±  9%      -0.0        0.05 ±  8%  perf-profile.children.cycles-pp.libgav1::Tile::GetDcSignContext
      0.14 ±  7%      +0.0        0.16 ±  4%  perf-profile.children.cycles-pp.libgav1::Tile::AssignInterMv
      0.06 ±  7%      +0.0        0.09 ± 11%  perf-profile.children.cycles-pp.hrtimer_next_event_without
      0.10 ±  5%      +0.0        0.12 ± 10%  perf-profile.children.cycles-pp.native_apic_msr_eoi
      0.06 ± 13%      +0.0        0.09 ± 14%  perf-profile.children.cycles-pp.timerqueue_add
      0.04 ± 45%      +0.0        0.08 ±  6%  perf-profile.children.cycles-pp.__hrtimer_next_event_base
      0.04 ± 45%      +0.0        0.08 ± 16%  perf-profile.children.cycles-pp.update_wall_time
      0.08 ± 10%      +0.0        0.12 ± 13%  perf-profile.children.cycles-pp.update_rq_clock
      0.02 ± 99%      +0.0        0.06 ±  6%  perf-profile.children.cycles-pp.local_clock_noinstr
      0.04 ± 71%      +0.0        0.08 ± 12%  perf-profile.children.cycles-pp.timerqueue_del
      0.08 ±  4%      +0.0        0.12 ± 15%  perf-profile.children.cycles-pp.update_irq_load_avg
      0.07 ± 14%      +0.0        0.11 ± 15%  perf-profile.children.cycles-pp.idle_cpu
      0.04 ± 45%      +0.0        0.09 ±  8%  perf-profile.children.cycles-pp.___task_rq_lock
      0.04 ± 71%      +0.0        0.08 ± 10%  perf-profile.children.cycles-pp.ct_idle_exit
      0.04 ± 71%      +0.0        0.08 ± 14%  perf-profile.children.cycles-pp.get_nohz_timer_target
      0.13 ±  5%      +0.1        0.18 ± 11%  perf-profile.children.cycles-pp.__get_next_timer_interrupt
      0.08 ± 14%      +0.1        0.14 ± 16%  perf-profile.children.cycles-pp.write
      0.01 ±223%      +0.1        0.06 ± 11%  perf-profile.children.cycles-pp.ct_kernel_enter
      0.02 ±141%      +0.1        0.07 ± 11%  perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.05 ±  7%      +0.1        0.11 ± 14%  perf-profile.children.cycles-pp.sched_balance_trigger
      0.02 ±142%      +0.1        0.08 ± 24%  perf-profile.children.cycles-pp.tsc_verify_tsc_adjust
      0.00            +0.1        0.06 ± 13%  perf-profile.children.cycles-pp.__x64_sys_exit
      0.09 ± 10%      +0.1        0.14 ±  6%  perf-profile.children.cycles-pp.ct_kernel_exit_state
      0.00            +0.1        0.06 ± 13%  perf-profile.children.cycles-pp.runtime.stealWork
      0.02 ±142%      +0.1        0.08 ± 24%  perf-profile.children.cycles-pp.arch_cpu_idle_enter
      0.11 ±  6%      +0.1        0.17 ± 10%  perf-profile.children.cycles-pp.irq_enter_rcu
      0.10 ±  5%      +0.1        0.16 ±  9%  perf-profile.children.cycles-pp.tick_irq_enter
      0.10 ±  8%      +0.1        0.16 ± 14%  perf-profile.children.cycles-pp.__intel_pmu_enable_all
      0.12 ±  5%      +0.1        0.19 ±  7%  perf-profile.children.cycles-pp.irqtime_account_irq
      0.00            +0.1        0.07 ± 14%  perf-profile.children.cycles-pp.lookup_open
      0.00            +0.1        0.07 ± 30%  perf-profile.children.cycles-pp.vfs_write
      0.17 ±  5%      +0.1        0.24 ±  7%  perf-profile.children.cycles-pp.native_sched_clock
      0.09 ± 15%      +0.1        0.16 ± 15%  perf-profile.children.cycles-pp.start_dl_timer
      0.08 ± 12%      +0.1        0.14 ± 14%  perf-profile.children.cycles-pp.switch_hrtimer_base
      0.00            +0.1        0.07 ± 11%  perf-profile.children.cycles-pp.irqtime_account_process_tick
      0.13 ± 13%      +0.1        0.20 ± 13%  perf-profile.children.cycles-pp.update_curr_dl_se
      0.17 ±  5%      +0.1        0.24 ±  8%  perf-profile.children.cycles-pp.sched_clock
      0.02 ± 99%      +0.1        0.10 ± 23%  perf-profile.children.cycles-pp.smpboot_thread_fn
      0.00            +0.1        0.08 ± 18%  perf-profile.children.cycles-pp.ct_nmi_exit
      0.01 ±223%      +0.1        0.08 ± 21%  perf-profile.children.cycles-pp.ksys_write
      0.13 ±  7%      +0.1        0.20 ±  7%  perf-profile.children.cycles-pp.entry_SYSCALL_64
      0.09 ± 15%      +0.1        0.17 ± 19%  perf-profile.children.cycles-pp.hrtimer_start_range_ns
      0.20 ±  4%      +0.1        0.27 ±  9%  perf-profile.children.cycles-pp.read_tsc
      0.22 ± 11%      +0.1        0.30 ± 11%  perf-profile.children.cycles-pp.calc_global_load_tick
      0.00            +0.1        0.08 ± 20%  perf-profile.children.cycles-pp.sched_setaffinity
      0.02 ±141%      +0.1        0.10 ±  9%  perf-profile.children.cycles-pp.github.com/containerd/containerd/gc/scheduler.(*gcScheduler).run
      0.02 ±141%      +0.1        0.10 ±  9%  perf-profile.children.cycles-pp.github.com/containerd/containerd/gc/scheduler.init.0.func1.1
      0.02 ±141%      +0.1        0.10 ±  6%  perf-profile.children.cycles-pp.runtime.findRunnable
      0.03 ±100%      +0.1        0.11 ±  5%  perf-profile.children.cycles-pp.runtime.goexit.abi0
      0.16 ±  4%      +0.1        0.25 ± 11%  perf-profile.children.cycles-pp.lapic_next_deadline
      0.00            +0.1        0.08 ± 22%  perf-profile.children.cycles-pp._raw_spin_trylock
      0.00            +0.1        0.08 ± 25%  perf-profile.children.cycles-pp.pid_revalidate
      0.02 ± 99%      +0.1        0.11 ±  6%  perf-profile.children.cycles-pp.runtime.mcall
      0.02 ± 99%      +0.1        0.11 ±  6%  perf-profile.children.cycles-pp.runtime.park_m
      0.02 ± 99%      +0.1        0.11 ±  6%  perf-profile.children.cycles-pp.runtime.schedule
      0.02 ±141%      +0.1        0.10 ±  8%  perf-profile.children.cycles-pp.runtime.selectgo
      0.00            +0.1        0.08 ± 22%  perf-profile.children.cycles-pp.task_tick_idle
      0.00            +0.1        0.08 ± 26%  perf-profile.children.cycles-pp.filename_lookup
      0.00            +0.1        0.08 ± 11%  perf-profile.children.cycles-pp.libgav1::Tile::ReadMotionVectorComponent
      0.00            +0.1        0.08 ± 26%  perf-profile.children.cycles-pp.path_lookupat
      0.20 ±  4%      +0.1        0.29 ±  9%  perf-profile.children.cycles-pp.sched_clock_cpu
      0.07 ±  9%      +0.1        0.16 ± 12%  perf-profile.children.cycles-pp._find_next_and_bit
      0.14 ± 10%      +0.1        0.22 ± 10%  perf-profile.children.cycles-pp.sched_balance_newidle
      0.09 ± 11%      +0.1        0.18 ± 13%  perf-profile.children.cycles-pp._raw_spin_lock_irq
      0.00            +0.1        0.09 ± 30%  perf-profile.children.cycles-pp.exit_mm
      0.07 ± 16%      +0.1        0.16 ± 15%  perf-profile.children.cycles-pp.__pi_memcpy
      0.00            +0.1        0.10 ± 31%  perf-profile.children.cycles-pp.__x64_sys_exit_group
      0.00            +0.1        0.10 ± 25%  perf-profile.children.cycles-pp.vfs_statx
      0.00            +0.1        0.10 ± 29%  perf-profile.children.cycles-pp.exit_mmap
      0.00            +0.1        0.10 ± 28%  perf-profile.children.cycles-pp.__mmput
      0.06 ±  9%      +0.1        0.15 ± 17%  perf-profile.children.cycles-pp.libgav1::PostFilter::GetHorizontalDeblockFilterEdgeInfoUV
      0.00            +0.1        0.10 ± 24%  perf-profile.children.cycles-pp.__x64_sys_execve
      0.00            +0.1        0.10 ± 24%  perf-profile.children.cycles-pp.do_execveat_common
      0.00            +0.1        0.10 ± 24%  perf-profile.children.cycles-pp.execve
      0.00            +0.1        0.11 ± 28%  perf-profile.children.cycles-pp.vfs_fstatat
      0.00            +0.1        0.11 ± 23%  perf-profile.children.cycles-pp.__close
      0.00            +0.1        0.11 ± 29%  perf-profile.children.cycles-pp.do_group_exit
      0.65 ±  5%      +0.1        0.76 ±  7%  perf-profile.children.cycles-pp.libgav1::PostFilter::HorizontalDeblockFilter
      0.00            +0.1        0.12 ± 12%  perf-profile.children.cycles-pp.account_llc_dequeue
      0.00            +0.1        0.12 ± 26%  perf-profile.children.cycles-pp.__do_sys_newfstatat
      0.00            +0.1        0.12 ± 28%  perf-profile.children.cycles-pp.do_open
      0.12 ±  9%      +0.1        0.23 ± 12%  perf-profile.children.cycles-pp.should_we_balance
      0.00            +0.1        0.12 ± 26%  perf-profile.children.cycles-pp.seq_printf
      0.00            +0.1        0.12 ± 25%  perf-profile.children.cycles-pp.fstatat64
      0.11 ± 22%      +0.1        0.24 ± 10%  perf-profile.children.cycles-pp.check_cpu_stall
      0.31 ± 11%      +0.1        0.44 ± 10%  perf-profile.children.cycles-pp.arch_scale_freq_tick
      0.00            +0.1        0.13 ± 14%  perf-profile.children.cycles-pp.task_cache_work
      0.00            +0.1        0.13 ±  6%  perf-profile.children.cycles-pp.task_llc
      0.00            +0.1        0.13 ± 24%  perf-profile.children.cycles-pp.link_path_walk
      0.00            +0.1        0.13 ± 30%  perf-profile.children.cycles-pp.vsnprintf
      0.00            +0.1        0.14 ± 27%  perf-profile.children.cycles-pp.__handle_mm_fault
      0.00            +0.1        0.14 ± 25%  perf-profile.children.cycles-pp.ast_mode_config_helper_atomic_commit_tail
      0.00            +0.1        0.14 ± 25%  perf-profile.children.cycles-pp.ast_primary_plane_helper_atomic_update
      0.00            +0.1        0.14 ± 25%  perf-profile.children.cycles-pp.commit_tail
      0.00            +0.1        0.14 ± 25%  perf-profile.children.cycles-pp.drm_atomic_commit
      0.00            +0.1        0.14 ± 25%  perf-profile.children.cycles-pp.drm_atomic_helper_commit
      0.00            +0.1        0.14 ± 25%  perf-profile.children.cycles-pp.drm_atomic_helper_commit_planes
      0.00            +0.1        0.14 ± 25%  perf-profile.children.cycles-pp.drm_atomic_helper_commit_tail
      0.00            +0.1        0.14 ± 25%  perf-profile.children.cycles-pp.drm_atomic_helper_dirtyfb
      0.00            +0.1        0.14 ± 25%  perf-profile.children.cycles-pp.drm_fb_helper_damage_work
      0.00            +0.1        0.14 ± 25%  perf-profile.children.cycles-pp.drm_fb_memcpy
      0.00            +0.1        0.14 ± 25%  perf-profile.children.cycles-pp.drm_fbdev_shmem_helper_fb_dirty
      0.00            +0.1        0.14 ± 25%  perf-profile.children.cycles-pp.memcpy_toio
      0.00            +0.1        0.14 ± 27%  perf-profile.children.cycles-pp.handle_mm_fault
      0.00            +0.1        0.14 ± 13%  perf-profile.children.cycles-pp.task_work_run
      0.25 ±  5%      +0.1        0.40 ± 12%  perf-profile.children.cycles-pp.perf_rotate_context
      0.00            +0.2        0.15 ± 27%  perf-profile.children.cycles-pp.do_user_addr_fault
      0.02 ± 99%      +0.2        0.18 ± 14%  perf-profile.children.cycles-pp.irqentry_exit
      0.00            +0.2        0.16 ± 28%  perf-profile.children.cycles-pp.exc_page_fault
      0.38 ±  3%      +0.2        0.54 ±  7%  perf-profile.children.cycles-pp.native_irq_return_iret
      0.00            +0.2        0.16 ± 32%  perf-profile.children.cycles-pp.__d_lookup_rcu
      0.00            +0.2        0.17 ± 21%  perf-profile.children.cycles-pp.do_exit
      0.00            +0.2        0.17 ± 20%  perf-profile.children.cycles-pp.process_one_work
      0.01 ±223%      +0.2        0.18 ± 26%  perf-profile.children.cycles-pp.asm_exc_page_fault
      0.00            +0.2        0.17 ± 19%  perf-profile.children.cycles-pp.x64_sys_call
      0.00            +0.2        0.18 ± 19%  perf-profile.children.cycles-pp.worker_thread
      0.32 ± 10%      +0.2        0.53 ± 14%  perf-profile.children.cycles-pp.clockevents_program_event
      0.00            +0.2        0.21 ± 29%  perf-profile.children.cycles-pp.do_task_stat
      0.00            +0.2        0.21 ± 29%  perf-profile.children.cycles-pp.proc_tgid_stat
      0.09 ± 10%      +0.2        0.30 ± 20%  perf-profile.children.cycles-pp.kthread
      0.72 ±  4%      +0.2        0.94 ±  8%  perf-profile.children.cycles-pp._raw_spin_lock
      0.09 ± 10%      +0.2        0.31 ± 19%  perf-profile.children.cycles-pp.ret_from_fork
      0.09 ± 10%      +0.2        0.31 ± 19%  perf-profile.children.cycles-pp.ret_from_fork_asm
      0.17 ± 19%      +0.2        0.39 ±  7%  perf-profile.children.cycles-pp.rcu_pending
      0.19 ± 16%      +0.2        0.42 ±  8%  perf-profile.children.cycles-pp.rcu_sched_clock_irq
      0.00            +0.3        0.26 ± 25%  perf-profile.children.cycles-pp.open_last_lookups
      0.00            +0.3        0.27 ± 27%  perf-profile.children.cycles-pp.lookup_fast
      0.27 ± 43%      +0.3        0.56 ± 40%  perf-profile.children.cycles-pp.tick_nohz_irq_exit
      0.13 ± 11%      +0.3        0.43 ± 18%  perf-profile.children.cycles-pp.note_gp_changes
      0.13 ± 12%      +0.3        0.46 ± 20%  perf-profile.children.cycles-pp.rcu_report_qs_rdp
      0.34 ±  4%      +0.3        0.68 ± 11%  perf-profile.children.cycles-pp.update_sg_lb_stats
      0.38 ±  3%      +0.4        0.74 ± 10%  perf-profile.children.cycles-pp.update_sd_lb_stats
      0.00            +0.4        0.36 ± 29%  perf-profile.children.cycles-pp.proc_pid_status
      0.39 ±  4%      +0.4        0.75 ± 10%  perf-profile.children.cycles-pp.sched_balance_find_src_group
      0.41 ±  5%      +0.4        0.78 ± 11%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      0.28 ± 47%      +0.4        0.66 ± 43%  perf-profile.children.cycles-pp.timekeeping_max_deferment
      0.47 ±  5%      +0.5        0.92 ± 10%  perf-profile.children.cycles-pp.sched_balance_domains
      1.07 ±  5%      +0.5        1.54 ± 10%  perf-profile.children.cycles-pp.sched_tick
      0.26 ±  6%      +0.5        0.77 ± 16%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      0.55 ±  5%      +0.5        1.07 ± 11%  perf-profile.children.cycles-pp.sched_balance_rq
      0.49 ± 29%      +0.5        1.02 ± 28%  perf-profile.children.cycles-pp.tick_nohz_next_event
      0.00            +0.6        0.55 ± 24%  perf-profile.children.cycles-pp.path_openat
      0.00            +0.6        0.56 ± 24%  perf-profile.children.cycles-pp.do_file_open
      0.58 ± 25%      +0.6        1.14 ± 25%  perf-profile.children.cycles-pp.tick_nohz_get_sleep_length
      0.00            +0.6        0.58 ± 29%  perf-profile.children.cycles-pp.proc_single_show
      0.00            +0.6        0.60 ± 25%  perf-profile.children.cycles-pp.__x64_sys_openat
      0.00            +0.6        0.60 ± 25%  perf-profile.children.cycles-pp.do_sys_openat2
      0.00            +0.6        0.63 ± 29%  perf-profile.children.cycles-pp.seq_read
      0.78 ± 19%      +0.6        1.41 ± 21%  perf-profile.children.cycles-pp.menu_select
      0.00            +0.6        0.64 ± 25%  perf-profile.children.cycles-pp.open64
      0.00            +0.7        0.67 ± 28%  perf-profile.children.cycles-pp.seq_read_iter
      0.06 ±  9%      +0.7        0.74 ± 27%  perf-profile.children.cycles-pp.vfs_read
      0.28 ± 10%      +0.7        0.97 ± 18%  perf-profile.children.cycles-pp.rcu_core
      0.06 ±  8%      +0.7        0.75 ± 27%  perf-profile.children.cycles-pp.ksys_read
      0.06 ±  7%      +0.8        0.82 ± 27%  perf-profile.children.cycles-pp.read
      1.57 ±  4%      +1.0        2.60 ± 10%  perf-profile.children.cycles-pp.handle_softirqs
      1.68 ±  4%      +1.1        2.76 ± 10%  perf-profile.children.cycles-pp.__irq_exit_rcu
      6.20 ±  4%      +1.1        7.31 ±  6%  perf-profile.children.cycles-pp.do_syscall_64
      6.21 ±  4%      +1.1        7.34 ±  6%  perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.97 ±  8%      +1.6        2.56 ± 11%  perf-profile.children.cycles-pp.ktime_get_update_offsets_now
      2.72 ± 22%      +2.1        4.82 ± 20%  perf-profile.children.cycles-pp.perf_mux_hrtimer_handler
      2.94 ± 25%      +2.4        5.32 ± 24%  perf-profile.children.cycles-pp.ktime_get
      3.11 ± 22%      +2.4        5.49 ± 24%  perf-profile.children.cycles-pp.update_process_times
      4.24 ± 22%      +3.1        7.31 ± 24%  perf-profile.children.cycles-pp.tick_nohz_handler
      7.28 ±  9%      +5.4       12.64 ± 14%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      8.67 ±  8%      +7.2       15.86 ± 13%  perf-profile.children.cycles-pp.hrtimer_interrupt
      8.75 ±  8%      +7.2       16.00 ± 13%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
     10.87 ±  6%      +8.7       19.60 ± 11%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
     20.77 ±  3%     +12.0       32.78 ±  8%  perf-profile.children.cycles-pp.pv_native_safe_halt
     20.80 ±  3%     +12.0       32.83 ±  8%  perf-profile.children.cycles-pp.acpi_idle_do_entry
     20.79 ±  3%     +12.0       32.82 ±  8%  perf-profile.children.cycles-pp.acpi_safe_halt
     20.80 ±  3%     +12.0       32.84 ±  8%  perf-profile.children.cycles-pp.acpi_idle_enter
     21.10 ±  3%     +12.1       33.17 ±  8%  perf-profile.children.cycles-pp.cpuidle_enter_state
     21.11 ±  3%     +12.1       33.18 ±  8%  perf-profile.children.cycles-pp.cpuidle_enter
     17.58 ±  3%     +12.4       29.99 ±  9%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
     22.82 ±  3%     +12.6       35.46 ±  8%  perf-profile.children.cycles-pp.start_secondary
     22.94 ±  3%     +12.7       35.61 ±  8%  perf-profile.children.cycles-pp.do_idle
     22.94 ±  3%     +12.7       35.62 ±  8%  perf-profile.children.cycles-pp.common_startup_64
     22.94 ±  3%     +12.7       35.62 ±  8%  perf-profile.children.cycles-pp.cpu_startup_entry
     22.02 ±  3%     +12.8       34.77 ±  8%  perf-profile.children.cycles-pp.cpuidle_idle_call
      6.36 ±  3%      -2.8        3.57 ±  7%  perf-profile.self.cycles-pp.libgav1::BlockParametersHolder::Get
      4.76 ±  3%      -1.5        3.29 ±  7%  perf-profile.self.cycles-pp.libgav1::Tile::DecodeSuperBlock
      3.76 ±  2%      -1.3        2.49 ±  8%  perf-profile.self.cycles-pp.libgav1::Tile::ReadPartition
      4.31 ±  5%      -0.9        3.40 ±  8%  perf-profile.self.cycles-pp.libgav1::Tile::BlockInterPrediction
      5.17 ±  5%      -0.9        4.30 ± 10%  perf-profile.self.cycles-pp.libgav1::Tile::InterPrediction
      1.57 ±  3%      -0.5        1.05 ±  7%  perf-profile.self.cycles-pp.libgav1::EntropyDecoder::ReadSymbol<4>
      0.61 ±  8%      -0.5        0.13 ± 19%  perf-profile.self.cycles-pp.libgav1::Tile::ReadIntraBlockModeInfo
      1.65 ±  2%      -0.4        1.25 ±  4%  perf-profile.self.cycles-pp.malloc
      1.31 ±  2%      -0.4        0.95 ±  8%  perf-profile.self.cycles-pp.libgav1::Tile::ReadTransformCoefficients<short>
      1.95 ±  2%      -0.3        1.62 ±  7%  perf-profile.self.cycles-pp.libgav1::Tile::ProcessBlock
      0.55 ± 12%      -0.3        0.23 ±  6%  perf-profile.self.cycles-pp.absl::lts_20210324::Mutex::LockSlowLoop
      0.45 ±  7%      -0.3        0.16 ±  5%  perf-profile.self.cycles-pp.libgav1::Tile::DistanceWeightedPrediction
      0.68 ±  3%      -0.2        0.44 ±  5%  perf-profile.self.cycles-pp.libgav1::Tile::ReadCoeffBase2D<short>
      0.36 ±  5%      -0.2        0.12 ± 10%  perf-profile.self.cycles-pp.update_load_avg
      0.63 ±  7%      -0.2        0.40 ±  7%  perf-profile.self.cycles-pp.__sched_balance_update_blocked_averages
      0.89 ±  3%      -0.2        0.67 ±  9%  perf-profile.self.cycles-pp.libgav1::Tile::TransformBlock
      1.18 ±  4%      -0.2        0.97 ±  8%  perf-profile.self.cycles-pp.libgav1::Tile::ObmcPrediction
      0.56 ±  3%      -0.2        0.40 ± 11%  perf-profile.self.cycles-pp.libgav1::Tile::ReconstructBlock
      0.85 ±  4%      -0.2        0.68 ±  9%  perf-profile.self.cycles-pp.futex_hash
      0.42 ± 10%      -0.2        0.26 ±  6%  perf-profile.self.cycles-pp.absl::lts_20210324::Mutex::Lock
      0.35 ±  8%      -0.1        0.21 ±  4%  perf-profile.self.cycles-pp.absl::lts_20210324::Mutex::UnlockSlow
      0.34 ±  4%      -0.1        0.25 ±  6%  perf-profile.self.cycles-pp.libgav1::EntropyDecoder::ReadBit
      0.40 ±  5%      -0.1        0.32 ±  7%  perf-profile.self.cycles-pp.__schedule
      0.31 ±  7%      -0.1        0.23 ±  6%  perf-profile.self.cycles-pp.__flush_smp_call_function_queue
      0.31 ±  5%      -0.1        0.23 ±  7%  perf-profile.self.cycles-pp.finish_task_switch
      0.26 ±  9%      -0.1        0.18 ±  7%  perf-profile.self.cycles-pp.update_cfs_group
      0.39 ±  4%      -0.1        0.31 ± 10%  perf-profile.self.cycles-pp.libgav1::BlockParametersHolder::FillCache
      0.28 ±  4%      -0.1        0.20 ±  8%  perf-profile.self.cycles-pp.irqentry_enter
      0.28 ±  5%      -0.1        0.20 ± 14%  perf-profile.self.cycles-pp.llist_reverse_order
      0.42 ±  6%      -0.1        0.35 ±  4%  perf-profile.self.cycles-pp.futex_wake
      0.21 ±  5%      -0.1        0.14 ± 11%  perf-profile.self.cycles-pp.pick_next_task_fair
      0.12 ±  4%      -0.1        0.06 ± 46%  perf-profile.self.cycles-pp.absl::lts_20210324::Mutex::LockSlowWithDeadline
      0.20 ±  3%      -0.1        0.14 ± 13%  perf-profile.self.cycles-pp.libgav1::Tile::ComputeTransformType
      0.28 ±  7%      -0.1        0.23 ±  4%  perf-profile.self.cycles-pp.update_rq_clock_task
      0.16 ±  8%      -0.1        0.10 ±  5%  perf-profile.self.cycles-pp.call_function_single_prep_ipi
      0.16 ±  7%      -0.1        0.10 ±  4%  perf-profile.self.cycles-pp.absl::lts_20210324::Mutex::Unlock
      0.30 ± 10%      -0.1        0.24 ±  3%  perf-profile.self.cycles-pp.futex_wake_mark
      0.13 ±  9%      -0.1        0.08 ± 10%  perf-profile.self.cycles-pp.absl::lts_20210324::synchronization_internal::Waiter::Wait
      0.18 ±  6%      -0.1        0.13 ±  8%  perf-profile.self.cycles-pp.pthread_mutex_lock
      0.17 ±  6%      -0.0        0.12 ±  5%  perf-profile.self.cycles-pp.__resched_curr
      0.16 ±  6%      -0.0        0.11 ±  5%  perf-profile.self.cycles-pp.futex_unqueue
      0.13 ±  5%      -0.0        0.09 ± 16%  perf-profile.self.cycles-pp.libgav1::Tile::ReadTransformType
      0.20 ±  8%      -0.0        0.16 ±  6%  perf-profile.self.cycles-pp.try_to_wake_up
      0.10 ±  7%      -0.0        0.06 ± 13%  perf-profile.self.cycles-pp.absl::lts_20210324::CondVar::WaitCommon
      0.14 ±  9%      -0.0        0.10 ± 11%  perf-profile.self.cycles-pp.wake_affine
      0.15 ±  5%      -0.0        0.11 ±  9%  perf-profile.self.cycles-pp.schedule
      0.18 ±  5%      -0.0        0.14 ± 13%  perf-profile.self.cycles-pp.libgav1::Tile::TransformTree
      0.12 ±  8%      -0.0        0.08 ±  8%  perf-profile.self.cycles-pp.select_task_rq
      0.13 ±  6%      -0.0        0.10 ± 18%  perf-profile.self.cycles-pp.futex_q_lock
      0.09 ±  6%      -0.0        0.06 ±  9%  perf-profile.self.cycles-pp.__update_load_avg_se
      0.10 ±  8%      -0.0        0.06 ±  7%  perf-profile.self.cycles-pp.absl::lts_20210324::Enqueue
      0.15 ±  3%      -0.0        0.12 ±  9%  perf-profile.self.cycles-pp.absl::lts_20210324::CondVar::Signal
      0.10 ±  8%      -0.0        0.07 ± 17%  perf-profile.self.cycles-pp.libgav1::Tile::SetEntropyContexts
      0.19 ±  5%      -0.0        0.16 ±  6%  perf-profile.self.cycles-pp.futex_do_wait
      0.11 ±  6%      -0.0        0.09 ± 10%  perf-profile.self.cycles-pp.libgav1::EntropyDecoder::ReadSymbol<16>
      0.10 ±  5%      -0.0        0.08 ± 10%  perf-profile.self.cycles-pp.switch_fpu_return
      0.11            -0.0        0.09 ±  5%  perf-profile.self.cycles-pp.__switch_to
      0.08 ±  5%      -0.0        0.06 ±  7%  perf-profile.self.cycles-pp.libgav1::ThreadPool::WorkerFunction
      0.07 ± 10%      -0.0        0.05        perf-profile.self.cycles-pp.libgav1::Tile::GetDcSignContext
      0.11 ±  6%      +0.0        0.14 ±  7%  perf-profile.self.cycles-pp.cpuidle_idle_call
      0.08 ±  7%      +0.0        0.12 ±  9%  perf-profile.self.cycles-pp.__hrtimer_run_queues
      0.11 ±  8%      +0.0        0.15 ± 10%  perf-profile.self.cycles-pp.perf_rotate_context
      0.06 ± 11%      +0.0        0.10 ± 18%  perf-profile.self.cycles-pp.idle_cpu
      0.06 ± 13%      +0.0        0.10 ± 13%  perf-profile.self.cycles-pp.cpuidle_enter_state
      0.07            +0.0        0.12 ± 17%  perf-profile.self.cycles-pp.update_irq_load_avg
      0.01 ±223%      +0.0        0.06 ±  9%  perf-profile.self.cycles-pp.__lll_lock_wake_private
      0.00            +0.1        0.05 ±  7%  perf-profile.self.cycles-pp.sched_balance_domains
      0.02 ±142%      +0.1        0.07 ± 20%  perf-profile.self.cycles-pp.tsc_verify_tsc_adjust
      0.08 ±  8%      +0.1        0.14 ±  9%  perf-profile.self.cycles-pp.ct_kernel_exit_state
      0.17 ±  6%      +0.1        0.23 ±  8%  perf-profile.self.cycles-pp.menu_select
      0.00            +0.1        0.06 ± 11%  perf-profile.self.cycles-pp.handle_softirqs
      0.01 ±223%      +0.1        0.07 ± 13%  perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.01 ±223%      +0.1        0.07 ± 11%  perf-profile.self.cycles-pp.sched_balance_rq
      0.10 ±  8%      +0.1        0.16 ± 14%  perf-profile.self.cycles-pp.__intel_pmu_enable_all
      0.16 ±  5%      +0.1        0.22 ±  6%  perf-profile.self.cycles-pp.native_sched_clock
      0.00            +0.1        0.07 ± 11%  perf-profile.self.cycles-pp.irqtime_account_process_tick
      0.19 ±  5%      +0.1        0.26 ± 11%  perf-profile.self.cycles-pp.read_tsc
      0.08 ± 11%      +0.1        0.16 ±  9%  perf-profile.self.cycles-pp._raw_spin_lock_irq
      0.22 ± 12%      +0.1        0.30 ± 12%  perf-profile.self.cycles-pp.calc_global_load_tick
      0.00            +0.1        0.08 ± 27%  perf-profile.self.cycles-pp.do_task_stat
      0.00            +0.1        0.08 ±  8%  perf-profile.self.cycles-pp.libgav1::Tile::ReadMotionVectorComponent
      0.00            +0.1        0.08 ± 25%  perf-profile.self.cycles-pp.task_tick_idle
      0.16 ±  4%      +0.1        0.25 ± 11%  perf-profile.self.cycles-pp.lapic_next_deadline
      0.07 ± 13%      +0.1        0.15 ± 11%  perf-profile.self.cycles-pp._find_next_and_bit
      0.00            +0.1        0.08 ± 22%  perf-profile.self.cycles-pp._raw_spin_trylock
      0.01 ±223%      +0.1        0.10 ± 15%  perf-profile.self.cycles-pp.sched_balance_trigger
      0.06 ± 14%      +0.1        0.16 ± 15%  perf-profile.self.cycles-pp.__pi_memcpy
      0.08 ± 28%      +0.1        0.17 ± 13%  perf-profile.self.cycles-pp.tick_nohz_next_event
      0.05 ±  8%      +0.1        0.15 ± 18%  perf-profile.self.cycles-pp.libgav1::PostFilter::GetHorizontalDeblockFilterEdgeInfoUV
      0.05 ± 45%      +0.1        0.14 ± 13%  perf-profile.self.cycles-pp.rcu_pending
      0.02 ±141%      +0.1        0.13 ±  8%  perf-profile.self.cycles-pp.update_se
      0.64 ±  5%      +0.1        0.75 ±  7%  perf-profile.self.cycles-pp.libgav1::PostFilter::HorizontalDeblockFilter
      0.11 ± 20%      +0.1        0.24 ± 10%  perf-profile.self.cycles-pp.check_cpu_stall
      0.31 ± 11%      +0.1        0.44 ± 10%  perf-profile.self.cycles-pp.arch_scale_freq_tick
      0.00            +0.1        0.13 ±  6%  perf-profile.self.cycles-pp.task_llc
      0.00            +0.1        0.14 ± 25%  perf-profile.self.cycles-pp.memcpy_toio
      0.38 ±  3%      +0.2        0.54 ±  7%  perf-profile.self.cycles-pp.native_irq_return_iret
      0.00            +0.2        0.16 ± 32%  perf-profile.self.cycles-pp.__d_lookup_rcu
      0.41 ±  3%      +0.2        0.58 ± 11%  perf-profile.self.cycles-pp._raw_spin_lock
      0.16 ±  4%      +0.2        0.38 ± 16%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.10 ± 10%      +0.2        0.33 ± 17%  perf-profile.self.cycles-pp.note_gp_changes
      0.29 ±  3%      +0.3        0.58 ± 10%  perf-profile.self.cycles-pp.update_sg_lb_stats
      0.40 ±  6%      +0.4        0.78 ± 11%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      0.28 ± 47%      +0.4        0.66 ± 43%  perf-profile.self.cycles-pp.timekeeping_max_deferment
      0.94 ±  9%      +1.6        2.52 ± 11%  perf-profile.self.cycles-pp.ktime_get_update_offsets_now
      2.78 ± 27%      +2.3        5.08 ± 25%  perf-profile.self.cycles-pp.ktime_get
      7.71 ±  3%      +3.6       11.27 ±  9%  perf-profile.self.cycles-pp.pv_native_safe_halt




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

