Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C4432AAA1
	for <oe-lkp@lists.linux.dev>; Fri,  6 Feb 2026 03:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770347759; cv=fail; b=aIkAJZkdbL1a1DUdUqV2YAw7uzyHcUdbNWKUL9rOLiR6+LIk/YeV1clM/TowAUcs5z05/2mRp5McB0yAICq/DE8ClAifaoM6oB1JGaFEtqwRHY2wZOCmie0v7u8gukSSE+aA1R73BmgZ1QfCU2aa5zZpj7ZcUFELxPJBlKO6Qpo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770347759; c=relaxed/simple;
	bh=T1wH6YZrON7xWxsSo8IOD2JLhCILHoH2/u3cCMTWek8=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=BoVd+p54/3xek7J48nPf6jtXQhaJTPul3ECa5/jIwd3X8nxijCqNkuF3dFcaDXZJTabWjAa0QxI4u1MXbaTKRrfjBdrVWPxJNt0Tm5BWN0y3AicWVJ0uGCSObyNuywYaCu5gw2f3HDj4eDyCFKLltg6tLreYUHBQ0cLFdzHqEQM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ioftfaLY; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ioftfaLY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770347759; x=1801883759;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T1wH6YZrON7xWxsSo8IOD2JLhCILHoH2/u3cCMTWek8=;
  b=ioftfaLY7hRJOYLK9dOq4jguWZyutIHTBbJdIftyJ5Jlh3edKIJsaWBP
   7kbAF3ICUU5yvZxlKf6C3c7YVvq8KsXmIXTR6zQonb2TDMSVTw+Uoomt6
   swGHpRchXOoiks2t0AS+ISfOuTYYATHE8CEd2xCIziF/bsKPM4lGurL90
   4NE857Zku/4wFEw6u39Gmm2jep4oqQJdRMWUlPuOXbCwoMWeaae0sUICO
   xJIwBGA8gQhVIAqwbk6Y5kh8dt6rN03vcBynXpLNqfeKi38WNWpqNOyn0
   Y0smnKMASA2HDjTbe1JkVasPuhU8GljsRQUqx05YBYHG/oXbfOuw+rz7Z
   A==;
X-CSE-ConnectionGUID: Ptc17DCGQRSGQPZ+7FtLWA==
X-CSE-MsgGUID: ZpK5KgQSSnmrf37WvO8H3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="71447570"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="71447570"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 19:15:59 -0800
X-CSE-ConnectionGUID: Y6uujUcPRlyZtNdlN/RHbw==
X-CSE-MsgGUID: HdzFNmztTPStFsMR0mmoRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="209843187"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 19:15:58 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 5 Feb 2026 19:15:57 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 5 Feb 2026 19:15:57 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.68) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 5 Feb 2026 19:15:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NlFjE72WzlAPkEW47X4OCK2UOECH5ExnpzpQWzspt9r4uxqYTb015ckwd8UXjptz5lSbajd2apyxacECOpwfVgBDz6DCfP3nq/tj1ZCTDz5bbIbkqmCYGufVC+Aubtri8UAwkQWk2KQ+jfBSEB9i3Sb5T2sPW9FE8AInS4tI2JELskFJy0w0kOih8KF1+h+w8+XPmozlDEK4u6pRFd+NaDmreRF3jj8ftROvKmG2F+twHF4UugZBlGoPl3LhAvSX0sOQ5QI/3hcUn2IM9gH9QYTVlrYMSECAsou44ojIy6infekCDb5K0Rbu+qu9Rqs2wgq5cbP4duK57zdzbzdZBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lQDetzL9FxRYL2KeGY6FN+zPeDLM7TbJkaUJKO2DNQw=;
 b=HWjtgRN3o8HIwi2TjfjiyphX438RIr86sqeOksE/tvw6dCJlibKq8hjP84xJDtoiM64DGUHJ8zjGB+7nhcyPrN8OvTt9Wmy5EaVpQ0J5/KdwLOqZ+kSkiDFujmnXYx+CP/dGgRmlg58dz6ti1zfpbN3CYqCs0GgdaRavPTP7X7Ggke36pHMlFLPAczPJSDDP0mGcFq1bwEo9F/4aVsJbLtDoTTMZRZ4apiS6jZIkl0qc6n0sJXCZJUNu6A21Alnv39bsOHV53UZBGqpik3763Tctx8wuMziIAj0ttiJvLPySGp0MYkH09NLJ+rlmHZi5/0CXcnAG9p53+s4FKcoQQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DS0PR11MB7382.namprd11.prod.outlook.com (2603:10b6:8:131::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Fri, 6 Feb
 2026 03:15:50 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::e4de:b1d:5557:7257]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::e4de:b1d:5557:7257%5]) with mapi id 15.20.9587.010; Fri, 6 Feb 2026
 03:15:50 +0000
Date: Fri, 6 Feb 2026 11:15:40 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<aubrey.li@linux.intel.com>, <yu.c.chen@intel.com>, <oliver.sang@intel.com>
Subject: [peterz-queue:sched/flat] [sched/fair]  596061ecef: Oops
Message-ID: <202602061046.eee12820-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: SI2PR01CA0027.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::7) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DS0PR11MB7382:EE_
X-MS-Office365-Filtering-Correlation-Id: ba40db35-7c99-4c96-678d-08de652e076f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7HxQLPcHw7tV0ua0NgJhP44eiroJm0NWCTnLHgEI6YxjCNHIg+ozMfD/ZR/Y?=
 =?us-ascii?Q?5FAYvTA8lPupstyMoXbIP/E4uXMVyXCsNxrj5xDyGCpv60+T9XtU4aJnOCDy?=
 =?us-ascii?Q?K2FL+ksclHZL2fm6WZFTDcu+IxRA/bhfyC5FPLXN7yI8FYxAkRzugcMym8iv?=
 =?us-ascii?Q?ObgakPA+A5A8WLhXCUOZx9ZcFfaFTYQB1AfllgJHt3Bfm+uw/O10FS6b7v4L?=
 =?us-ascii?Q?OCqDyFx/FWmXfFw6R7FcHvzuIPpYMhOpxtqrQTOyysW2fTa3IBVQTC31EmMg?=
 =?us-ascii?Q?YY8gw9oNhROriKpst1b3o61/npQH9qhcpzYUi1CRvcr3VodZiiMS9EhU+URk?=
 =?us-ascii?Q?Y1LbJlb8+Xv2FWpAJ7ZfpdfG/lmCUd2+lU2jToWKmhdx1fC03Gs8LySABGim?=
 =?us-ascii?Q?YG6bGL04bvwJNY6tXvjTvWTCFDRwx+EC/DvSq9fkSmhPuV+08VxZOlKhYmlI?=
 =?us-ascii?Q?2KWyMEyEGXLFoxjsY3zz9/BfDqgYdXTo69AHq6EB9SOpcXAIM3B3kl9yu+Ce?=
 =?us-ascii?Q?wIDHk3Cm2QZVUyTDRS0BJ8tt/Q3PILJjSV8xdcVGcw2ywPtooFLGkoWpAHDr?=
 =?us-ascii?Q?xmxcgMt1iAC2rVzoGIfE/69T053J55m1F7Ny5uth0BA/mFiP8CibWWvGhT83?=
 =?us-ascii?Q?Jx+6RdLRv8CqBQerCvTaPbfa8QenZVqakGABYvvFUhSVcxOKkyGkpYo5VEw0?=
 =?us-ascii?Q?oAHiivh/q/+watZSB7TfId6bCtJPxs4joR7Ae5IUiG4LLcpKlTx7DHScgwdm?=
 =?us-ascii?Q?fUydxfYrEUxFqrQ7d5fuubRhJXZIQ11s3TuDupzq4eFSrtZZ3brMI4pD9kI+?=
 =?us-ascii?Q?8SRziFVwq7Vos2T9AAVuBuY84Ct92VY0vz1YhDysa2BYssy9az8SXUnuf04Z?=
 =?us-ascii?Q?L69bjztZ5Gje1llN6cSH5FFpiByPkDsD22fG/ijMw6hT8yM4tBJbvQzM4ttP?=
 =?us-ascii?Q?B6rd8KteoUpmbt493SWIt3JflGIFoE4mL6WGHGInkzV7IhiNKW+7vSwklagj?=
 =?us-ascii?Q?J0+Y57KSW10DWAyyMt0aiMalby7NjITpsevCpJNeAAwwQxkTPKfbQ2e+CRzL?=
 =?us-ascii?Q?SFEOw9CexUOhIw70WM5bnejbOmLoM04CQSHj0GlqqYgdjz5Ky6v/yv5OXAyl?=
 =?us-ascii?Q?gI0s7DSpblM12n0m7taAtQbk6DqDpvYE2qMqyF4zixbKO+Wjr5bJUDBpFOEb?=
 =?us-ascii?Q?89NzFoQwblcUiUGo8HIrQXgVWg7ggDDm3zmyhLRzyGYXw5xgAU7DCUWc47w7?=
 =?us-ascii?Q?gXMYXTvI0JSO7E8pQzValJAjEgkY0lHANEDNpK9auMmgih49gctxL94IFRyS?=
 =?us-ascii?Q?CI1qf7F+lfdLhF5OjYY++1lOzG7SRUVD8LcxnTTrY48djjXkusxchfFZxJFz?=
 =?us-ascii?Q?L2dK3Nv/mXl/8oUoql50e67PjZPyq/M6lEANAvM5R18WrULYdc8k8p9Rn9Fy?=
 =?us-ascii?Q?qlFrqOt2IGUzdniBS11G4PAkeyzHI4IMmhnYoCEPmazFTVZH2fE5Cqv/GBQH?=
 =?us-ascii?Q?hlPIjivn1MEDlvewfB0sQukhctn9I6e9yrnnujsnVXV0zQczl37kC9qjwd7F?=
 =?us-ascii?Q?pZVh36s1/c5oVEeAPNPvF71gxGuCNzvjB2W5ph8s?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?it+B9cmS+cE4aD/vCu+eVdwrdzHwRNjw558rYcU4X8zjFIPWbWae6Rv7YCtX?=
 =?us-ascii?Q?pU3MDHXCYqIaE/ZnDTAaufu+PRse0FqnvwXL9GduLQusqa9eExFk5fQTMMr9?=
 =?us-ascii?Q?pDMRk+jmzgx/KOsq/m9q2J2Ykf2bsaJ7eTSdnOiyNVlGwzIxZVYDJDIzFCX+?=
 =?us-ascii?Q?U9eOCgiN/0yrrNwI8ybc/KWrWiC9OOZVzD0zrb4/1XI1j5joSGcycVwHt6IL?=
 =?us-ascii?Q?9V9xNueeN4fRA4PpjP5WrYhst+CfVrdqiJYgXPSc9czMrTeXe4yGhFIlwm97?=
 =?us-ascii?Q?kFvrcQkeVUicYaruUra5B1MYSDcYQG74mRaH391UQREyN5Gui/c37BNVP42c?=
 =?us-ascii?Q?xwVs11qazknU+ivDxf1gF/ciOnlRBODHFYLvh5LgodAJNe3ToXfBAxJ3Rc62?=
 =?us-ascii?Q?NBwDc5uQzdpD0sXF7dHp7DUN6kMEFAt6JW1HxfUXbKJDNnQcWFexCLUIlnKO?=
 =?us-ascii?Q?86HtVqos+6+YGDx08lYedmcaPVu/y60T1CZ5E18pXBBKOhBHVcMPOM0FDaVn?=
 =?us-ascii?Q?jtPIFnn6KSB3VCbk2FGk4OogUWaXZk8Evor+ggM/zO2hj2JkvhRYtpkjHUb/?=
 =?us-ascii?Q?VktJJDd0hyiSjP7SKOeuB8/SK6ZtFeNtrfkqJCafCgKaRpAVv7KZ91QhlUgz?=
 =?us-ascii?Q?MX0AOFI4FVPiICwTKrBqy/5wyqTqDpJxEJz4Rbqe7rkCu/ZoMs+C8g+G4XJp?=
 =?us-ascii?Q?O1pmbnU5G2Za1TRqO/KUqdbcX+9JdO+xjz6+ahFnXjvDWtTOXmkWS6vMOCIp?=
 =?us-ascii?Q?bESvHURiOfdWjKIYUYifj5h7fMn+z3KMsPBtHjTDXS1Lu+neB/EU/M5XDj7K?=
 =?us-ascii?Q?FEq3SK+dDh5YT6fhUtJdKjIYdMEabKNGRDTm5B9k418FFaopcSqpE3/Y4XnZ?=
 =?us-ascii?Q?67v+x8v0BqgjQgXpf8wbKXHR85qUubpWPmxUVQdAHvSNniTxhjYn77gy31re?=
 =?us-ascii?Q?uxQGR7xqir7CMKJYWDXOZSklbk4GJiuXrRgBXVqjMwhEwZjsS/n86q9OjG+d?=
 =?us-ascii?Q?WmOtIxbFksQFP8rmDKUfw+FFGNrPU8ON7CvKOE3WU5b1g49h+xDM9MXgD7YA?=
 =?us-ascii?Q?M+xzqJ3+LWPyxrQS4emaFJMOkbjyYrufPDVtZiRrtsLBRPjZaqNqIuVabMFz?=
 =?us-ascii?Q?FNRGAoFCnYf7SVvVbbVxfHw/G1+s6gUqD7Zt+xVmC17Q9z20+KT0H4JEcwHk?=
 =?us-ascii?Q?hD+3C5+i83nivWhCxjDkBceHfV7Am6Up3FV4t+nPXRuIZNxN7ILNcF892AWG?=
 =?us-ascii?Q?neBtqRk7iMFgDJbglg93g0abjS9AL9+8mxplflnKwsqNq/285IRxZgwK4VEN?=
 =?us-ascii?Q?E/hENlDV6P0KY503JwSh+VE3NFf8w/6/e0lZeQ8ncFXBhzkNUWFSr/OQ8DqK?=
 =?us-ascii?Q?tcCJ+9bgR4f8lRiv4Ume1p0qyfDu1uMpJ9e4oaajPAQIkVA8b9VI3VJzBpPV?=
 =?us-ascii?Q?2qzx03uVbvjwWOyx/nYYxNmBdk2pN8i/bpdwZyJ0SsZMKBxAbUQITOh4Nrfw?=
 =?us-ascii?Q?aoBzEDubn+FcZs2ULEN4SpNKfk0uSq7OdLyAuULBhEcUrY+y7l97oet3M5ig?=
 =?us-ascii?Q?zCddsW+hW9d4/+50auOP/X7g6gwc24SRlG0x9OGDxBvyR3qvFOqdFCgEWGhp?=
 =?us-ascii?Q?YSRrFLos1cQD9qVcw80lrauCdCKxZk4ALbkiw3FqEQEBTDydpXZV3qnIMbuV?=
 =?us-ascii?Q?G/j9DPJ4eh4xQeiqvP6j7ANJBw+nMz5JotnBPLzsuBSepS91BaNEZd/Db299?=
 =?us-ascii?Q?1ro+EvQ0yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba40db35-7c99-4c96-678d-08de652e076f
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 03:15:50.2158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8O76sYYkwNXtZdopV4xeSntdRjjZ7tEZzYYEkjlXR0jDtAqNf9Acxw3n5q3lotbyDZenyFAyIXeQxI7zZdyRMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7382
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "Oops" on:

commit: 596061ecef8ab0561e92704bcdc166fb91ecdec1 ("sched/fair: Add newidle balance to pick_task_fair()")
https://git.kernel.org/cgit/linux/kernel/git/peterz/queue.git sched/flat

in testcase: stress-ng
version: stress-ng-x86_64-30f8b2f05-1_20251212
with following parameters:

	nr_threads: 100%
	testtime: 60s
	test: pipeherd
	cpufreq_governor: performance



config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 192 threads 2 sockets Intel(R) Xeon(R) 6740E  CPU @ 2.4GHz (Sierra Forest) with 256G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202602061046.eee12820-lkp@intel.com



[  368.640460][T10417] #PF: supervisor write access in kernel mode
[  368.640462][T10417] #PF: error_code(0x0002) - not-present page
[  368.640465][T10417] PGD 0 P4D 0
[  368.643193][T10417] Oops: Oops: 0002 [#1] SMP NOPTI
[  368.643198][T10417] CPU: 8 UID: 0 PID: 10417 Comm: stress-ng-pipeh Tainted: G S                  6.19.0-rc6-00148-g596061ecef8a #1 PREEMPTLAZY
[  368.646302][T10417] Tainted: [S]=CPU_OUT_OF_SPEC
[  368.646303][T10417] Hardware name: IEIT SYSTEMS NF5180-M8-A0-R0-00/NF5180-M8-A0-R0-00, BIOS 00.14.04 09/23/2024
[  368.646304][T10417] RIP: 0010:pick_next_task_fair (kernel/sched/sched.h:2673 kernel/sched/fair.c:9114)
[  368.649951][T10417] Code: 48 89 c3 49 81 be a8 02 00 00 a8 e1 bb 82 0f 85 e5 00 00 00 49 c7 86 a0 02 00 00 00 00 00 00 49 89 dd 49 8b 84 24 88 0a 00 00 <48> 89 83 a0 02 00 00 49 c7 84 24 88 0a 00 00 00 00 00 00 4c 39 f3
All code
========
   0:	48 89 c3             	mov    %rax,%rbx
   3:	49 81 be a8 02 00 00 	cmpq   $0xffffffff82bbe1a8,0x2a8(%r14)
   a:	a8 e1 bb 82 
   e:	0f 85 e5 00 00 00    	jne    0xf9
  14:	49 c7 86 a0 02 00 00 	movq   $0x0,0x2a0(%r14)
  1b:	00 00 00 00 
  1f:	49 89 dd             	mov    %rbx,%r13
  22:	49 8b 84 24 88 0a 00 	mov    0xa88(%r12),%rax
  29:	00 
  2a:*	48 89 83 a0 02 00 00 	mov    %rax,0x2a0(%rbx)		<-- trapping instruction
  31:	49 c7 84 24 88 0a 00 	movq   $0x0,0xa88(%r12)
  38:	00 00 00 00 00 
  3d:	4c 39 f3             	cmp    %r14,%rbx

Code starting with the faulting instruction
===========================================
   0:	48 89 83 a0 02 00 00 	mov    %rax,0x2a0(%rbx)
   7:	49 c7 84 24 88 0a 00 	movq   $0x0,0xa88(%r12)
   e:	00 00 00 00 00 
  13:	4c 39 f3             	cmp    %r14,%rbx


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260206/202602061046.eee12820-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

