Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A8B1581F8
	for <oe-lkp@lists.linux.dev>; Tue, 22 Jul 2025 07:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753167949; cv=fail; b=B5E7+AMLh9SSNFoaVCHgcGqYmN2iErvFthSEn9vfMz+yASVAGk0NX5ZPEUPf7woxMEcVe45SQdDfzn0n55F95O+406mH6n/kQ8zUtB2jLRkdZgb3FN4g7+DU8lu2cNfvVym6/ndH76iygPT775A1moEEUv0Ky+IUlodhisk/caM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753167949; c=relaxed/simple;
	bh=x8jvrGckN2j7Zc05myS4/+FrWbbKPlrqpDCQpIyI14k=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=POVdomwKpjsu3Y3IhTgzP0WhR5kgYHSIQXypE5npeK4yHYxcjP5ohgQlRCwt3eVeXmfNQ5Q1Pt1nOR1li7/9yug9h7iGyQBnKgnej7YOvyPts2MtGCXPUuYPtmFhfdmlHbSw+d4O/BforITTkq1jdWfshsT1DnSrVg6e7mAKduU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=js/3ENLh; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="js/3ENLh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753167947; x=1784703947;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x8jvrGckN2j7Zc05myS4/+FrWbbKPlrqpDCQpIyI14k=;
  b=js/3ENLh+tdun6kF4G7thu+3l8vMBZFmeJe3BN1Z/eotRzLC3BFWnhl9
   7WOOVvSC/WtYJQACpvOXBcNH/qHRy/8I/LJyX7a3T9JdZs8p4vZk0X8om
   qxxH4A8+Qbcznd+J4EnUDg7bDvlLroNZH4hWXE3yfM1AvwjhwKk1I8XQB
   QRQJ0HZsdkAIyxqj6IWqlXjedJYy/s+WOixsJUtUv0NfPsDmY79fCg99j
   dDWt16r7lqx2886klIdzLzye+jaz0Q7i9aIAn4oLautSBpzrI1yLLJESX
   vIOEbwlGr8hoOsHgwKTdtqXrFvqvZFsrI5vZAE/OcaYyRMDiayH6NdHJg
   w==;
X-CSE-ConnectionGUID: mqyDIoysSe6YgHV9m99lIQ==
X-CSE-MsgGUID: P3ao62ioRoWZmaObtkyYtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="55248135"
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="55248135"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 00:05:47 -0700
X-CSE-ConnectionGUID: Axkq7UJnQ0iMZ2511kYVVw==
X-CSE-MsgGUID: Pj6b/q6TTnS+gPV3KS5UXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="196129214"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 00:05:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 22 Jul 2025 00:05:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 22 Jul 2025 00:05:46 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.89)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 22 Jul 2025 00:05:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jRNGW/sudUY71q0G0Wt9BC7BvvZu86aj4by+WfREald2iRZvE9O4LptnBgJHlABTvY1/IbQN6AVX50YCujeUdeW9OQTQaL4FM5gEwAjEbb9nBhah/LFVbaB3WHNgvghzyF0aObaeyD3AAQsdZ3mLCFQGw8CEHMAdq1AamLjTKgRzQQOmQPTdVziCRQuWch+efjR8a5JHdvPCNDbDW0uOfm8G9WLDeqvwbwtOkBWJzAXyNhJ06Q+Mjb3teSwZ9fVHGyc4tusy+ghT3/h3CkppxBxkyJmnNmErO1Wo5a+Y2VfuWNt25TPuku9jBnIFTam/ST1zNVPBDqqXZDAyHAH6Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4jT6NjjiEiPR9IUpioDAmQQt8lhxxcb0LLWdCFCpkao=;
 b=vo2nm02rkh8Z23tIQr1UECxyKSopuIs6a0vpVkvTB8tIq5Za/2AS0qkmf3P0MoMVEGZXjuxsKihdkrjK/nzTQzpnUFkC76GgBNyJo/XYf946VtVjHpqXor7ROPbOwT+PboegE6cZLaTd9ZYdvBb2SYl82fsHc9H1rYvg0Hn8LDX61kIilEC5jpbs7ZEfRTcJD94xvJzGNGHgOr0GRMqm6mveBaYz4XembdvexnCcq3kiIfoD+86sK8ttBuMC8lPlunvN0Jquzr3UdhXeVsUpE6YhqMMAN2o0+2+DlDy3Q78a+iYff52xXeYbX24RRokh5PiwnxZt03VgxICt5gZI7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH0PR11MB5078.namprd11.prod.outlook.com (2603:10b6:510:3e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 07:05:03 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8943.029; Tue, 22 Jul 2025
 07:05:03 +0000
Date: Tue, 22 Jul 2025 15:04:55 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [morimoto:string-helper-2025-07-22] [maple tree] f8c8dfd75d:
 WARNING:possible_circular_locking_dependency_detected
Message-ID: <202507220857.ad1734da-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR02CA0043.apcprd02.prod.outlook.com
 (2603:1096:4:196::12) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH0PR11MB5078:EE_
X-MS-Office365-Filtering-Correlation-Id: f044c422-77f7-4ac5-1d45-08ddc8ee14cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DeqPW8XOg9QI9fZRRLorEgfCFQM3kAQGEd4YHmHkLV0yNuJrSk+atS93uoKd?=
 =?us-ascii?Q?vHuBgGvfzaO5mjm+oWZQGnC+IZ73ckVK8q8sDgshjTMu8ZK+ZiP8yCVNrgGg?=
 =?us-ascii?Q?R9FJUDhwAmc3fmzU2HrKwFqQAHPJqjtm/Y3Zhj/QI6+3wnDOuwN1ldzKWCns?=
 =?us-ascii?Q?Tn9Kh8XqspkQFO84975r9Jt63TDc+0tItskZT98rocccm7Hepjq1qpWIzwpO?=
 =?us-ascii?Q?iHltc4mlrRPD9hm3gwTIBf4dG/km+mh+InGxk7ffKXEtlX0PH53uurFRLF6Y?=
 =?us-ascii?Q?+ezOom/bm1+Oz2/b41xMCEkvjoJL2lVBGYfIS7CL//XdrKnzYyDY4kpjQljh?=
 =?us-ascii?Q?1IKLuaXh6EeaADCRqhlzmzkgBccRvAzC707e18tQqQCYMlSb4Xi2Le6juqu/?=
 =?us-ascii?Q?97s3XgyIV4VhGGyf0OAB8uWJwk0//XB0FB01mDH8ynFw0HUddQsQ1/dbA/c6?=
 =?us-ascii?Q?O16hc/rWhv+2AfGiQxhybWXvGMhV35v2gyZeOKpvMUdh5CuE6zfgHglKiNMc?=
 =?us-ascii?Q?zRT0wSmPrFwarbna3kO6mHHqUJV2z2sGbDqNl1O23uG2EEi13cYLbsTyqrxy?=
 =?us-ascii?Q?E20ReWUcmH2RlpSOz88VRCQ6UR3dBRrHOTxSw+4m0aWPc/HAP2zxYMYOpRfw?=
 =?us-ascii?Q?kbTRFV6cJGlcop+U5elKSlzdD57waRNL0QUF8V/tXMwLefcB5hEklkTg9sON?=
 =?us-ascii?Q?w8XXGE+wop8wiOzZLFABiNlmt679KEa+kK166h1WbLQ7Dd6Rz+ValCLylUse?=
 =?us-ascii?Q?KWeE1dednt17hn3mtSZMhqD39gxsx0VPkKczM5lW8E01x+6J0h1DeFBzYhyg?=
 =?us-ascii?Q?pHrm9ZYQ0nmqyIsJ0NESlPDCitxokPpwWUuguUwLpZ+2YDr4whcrk9cwynms?=
 =?us-ascii?Q?Ppt5Jpn7mwuUeMpgJeUV9zHKdyRF5DtVLugNoZs26bfUWyL14S/GTYMZC4jq?=
 =?us-ascii?Q?wUt7iXgKrlgU05TasrtOC1SjJy6dV8Z7w58y54597k6tn/70e3Oh47tqeHTo?=
 =?us-ascii?Q?tHbb6Jc9JJlBLt+IO5vtBcpN3xYoJpcW51JEb0OcDIYu0jxyn75cZ+KiLIfe?=
 =?us-ascii?Q?paTxqzYAvq1pkc/18ZbDHvS2+m/UOEIYFc0TsLNGscQabMfjoFW3Hb4BgKSi?=
 =?us-ascii?Q?NxK9jMF0W7UaEA9kY/JPbRrp4T6naYvBy45ftHxPAwB7yQkQC9oaih1nL/n1?=
 =?us-ascii?Q?1SviMJd3yn4IgUdlPYhknkMHzHFYVDWwzYIklWqoBvW0K2EwH3/RYkIHgzob?=
 =?us-ascii?Q?Bv5zUzX78kK7vbiYxOBHmBs4O+B87WdRk7Emzi+GdArRIisq3ABu1WkbLClo?=
 =?us-ascii?Q?HzFccVF/p/WMFd9m6S7HqoguqmcnygZElN5tbUzuYYEfnwUew6xeDrjLMcNk?=
 =?us-ascii?Q?ZDSUSTHIoMxAFHrUpE64oiODIcbw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zc46Eh38DF3K11UYmRVbGIKvieWBwaUh1gYQC2TzmIt8Rn2vCuw4fghNS6l4?=
 =?us-ascii?Q?lFvA6GupxucHdWCiNoq6ehDh2LICn9W+/rZvbnVPc3zH1oon7aPQtRLqGTJ4?=
 =?us-ascii?Q?yc2a3esM5LAFH8L/OmU2AX1X7wwqciZe2yrFEv1WhX/Jd6hodBuRicbyKLKS?=
 =?us-ascii?Q?CSV08fZBMJ8Ld3I7X2tGKAAbe8vZWTyGa42JgptHJrHsy73GzYIKxOhyh6fu?=
 =?us-ascii?Q?yInylV/ZzZ+0Yh5UA/qK78luC/HwZ4HTldRJdKJJGy0YQD0+sXF5+5uKLkS6?=
 =?us-ascii?Q?p1FsbYGjBANTslD5n8dSLuvBXTJ5dkyypa1FV7Xs80Hyl/PCdLpS3F4zzbAf?=
 =?us-ascii?Q?GjmhM8RRYHz8Ip4DZPjtCflAkC0J8KiKG1abVRnbv7f5NDN/F9jHIHVjRADK?=
 =?us-ascii?Q?MEjNyXhjrJuelj39aBa9vpj3q3dc5UVzXVOcQe+T/AlRFW4brXCjZSdcVhSc?=
 =?us-ascii?Q?XGTd+vDIKGv/qFWAO6rVDzM+P4fu0v/Ga+wvRj07SS9FaxxsIJQ5PbwOgpUj?=
 =?us-ascii?Q?e7u3yK9kT3GtBTiwTRdNPxdQic5vQpKoEr0OSehsTGFnzD5oa0f5ISf4Sfnz?=
 =?us-ascii?Q?O1h8gSv50YwS4VtLj8fnzsZRL5UyL8gZQinwnxFmUC88+NlDHQEyQmLdAAgZ?=
 =?us-ascii?Q?yGbhPcDOAawUHXjjxbrSk3LBniaDWS7Tg9EfvWBJk66gc1Ul/8Ag3HvEaPUO?=
 =?us-ascii?Q?GW0CYOEDN+SnuqE9XcgO6SnIjGd9h7lDmE8Kf+zEW6vVBosot1GP/Az/1S1B?=
 =?us-ascii?Q?QDz86+8qZNW3oYOWMywuOwyntLt28eadqDZZW916ETCfkBWjUw0mhJqfohRT?=
 =?us-ascii?Q?k7lKKYCnfy/vEIXO1yzuK/YXFx5moZw4F+mfRZ8hBWYrD6ZakHBajS/v74f4?=
 =?us-ascii?Q?KdWc5JNVwlTajqPp/YYk9iGjwN7DFJ9qKB/huCuKKBXpttKk4zmdRgUrHE6H?=
 =?us-ascii?Q?JEgyTWz5mBZqdREVrZZcHRS0ip5Z/m32mi7B3lzOzAB8EJHWGtnKOKiwNce6?=
 =?us-ascii?Q?sBQHMP0MS9QLBXwj2R6Zd01KPIgYsBj81qtR5uwTKXeGkfpsztVKa6/y2g1q?=
 =?us-ascii?Q?ecTd+4javEqCLuwGn3Rp7FOSF6/MTSddUKSCl2au4EekMHq3MsPHaDqjYS/C?=
 =?us-ascii?Q?BAQ6dzfQNhhuhFSkVaxgOYNZrni7idrp3do3TiXAIkS+mVYASh5QZf0IJTje?=
 =?us-ascii?Q?+cB1INiic4woww/U+k3YZNfl8XoKDT8C/ZnopeEuO8DbHtEG6UjjLWKtCkEv?=
 =?us-ascii?Q?f6/QfBRZJLBULxVgfR2VIIvK80cLv+g9UaKqJvRyhzfK0P/ff6kPfxA0Ok6O?=
 =?us-ascii?Q?dQ7hyNgZ1CmWhU4g7mH12NFwUZHAga852t9kR91ND+dZ6xDqa2JDSgriwkUC?=
 =?us-ascii?Q?qA69BKw61A9DnMueb+UusIUcRiBUQlLQL10XVA688+bbBvKM5XXoHFP/nJjT?=
 =?us-ascii?Q?NzFHYYH3Tclm6N4Y6v33y8kV5iQ6EBRdq1dYNI418T1140aK+CQSOPhs6bN/?=
 =?us-ascii?Q?pC2OrsulovvvJf5QExCHYBfPlBFtq1YaouiBYgds2yi9W8xuxQ35EeLUV7at?=
 =?us-ascii?Q?qeHbeeIJYF59WfgP32zpHzlipOq9yQTol0IP5N8lPjCgTGEDZuOz/UittS6X?=
 =?us-ascii?Q?qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f044c422-77f7-4ac5-1d45-08ddc8ee14cc
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 07:05:03.4667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RM0CSkR/PFr5qiznVDXkHi0Qf2yOF9tlyYRZhg4VEl/6MTo65b/KbxUGieMiOTdOlhamVmqNozSRCg09WCWXJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5078
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:possible_circular_locking_dependency_detected" on:

commit: f8c8dfd75d35332116f689f299014e53d18acdf9 ("maple tree: tidyup frame size error")
https://github.com/morimoto/linux string-helper-2025-07-22

in testcase: trinity
version: trinity-i386-abe9de86-1_20230429
with following parameters:

	runtime: 300s
	group: group-02
	nr_groups: 5



config: i386-randconfig-007-20250717
compiler: clang-20
test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+----------------------------------------------------------------------------------------------------------------------------------------------------------------------+---------------+------------+
|                                                                                                                                                                      | next-20250716 | f8c8dfd75d |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------+---------------+------------+
| WARNING:possible_circular_locking_dependency_detected                                                                                                                | 0             | 12         |
| WARNING:possible_circular_locking_dependency_detected_trinity-c3_is_trying_to_acquire_lock:at:__kmalloc_cache_noprof_but_task_is_already_holding_lock:at:vma_prepare | 0             | 5          |
| WARNING:possible_circular_locking_dependency_detected_trinity-c2_is_trying_to_acquire_lock:at:__kmalloc_cache_noprof_but_task_is_already_holding_lock:at:vma_prepare | 0             | 6          |
| WARNING:possible_circular_locking_dependency_detected_trinity-c0_is_trying_to_acquire_lock:at:__kmalloc_cache_noprof_but_task_is_already_holding_lock:at:vma_prepare | 0             | 1          |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------+---------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202507220857.ad1734da-lkp@intel.com


[   43.204844][ T3677] WARNING: possible circular locking dependency detected
[   43.205280][ T3677] 6.16.0-rc6-next-20250716-00001-gf8c8dfd75d35 #1 Not tainted
[   43.205733][ T3677] ------------------------------------------------------
[   43.206224][ T3677] trinity-c2/3677 is trying to acquire lock:
[ 43.206633][ T3677] b3177764 (fs_reclaim){+.+.}-{0:0}, at: __kmalloc_cache_noprof (include/linux/sched/mm.h:319 mm/slub.c:4131 mm/slub.c:4209 mm/slub.c:4391) 
[   43.207240][ T3677]
[   43.207240][ T3677] but task is already holding lock:
[ 43.207683][ T3677] b53d3c48 (&mapping->i_mmap_rwsem){++++}-{4:4}, at: vma_prepare (mm/vma.c:296) 
[   43.208197][ T3677]
[   43.208197][ T3677] which lock already depends on the new lock.
[   43.208197][ T3677]
[   43.208828][ T3677]
[   43.208828][ T3677] the existing dependency chain (in reverse order) is:
[   43.209373][ T3677]
[   43.209373][ T3677] -> #1 (&mapping->i_mmap_rwsem){++++}-{4:4}:
[ 43.209866][ T3677] down_write (kernel/locking/rwsem.c:1592) 
[ 43.210206][ T3677] dma_resv_lockdep (include/linux/fs.h:557 drivers/dma-buf/dma-resv.c:798) 
[ 43.210581][ T3677] do_one_initcall (init/main.c:1269) 
[ 43.210942][ T3677] do_initcall_level (init/main.c:1330 (discriminator 6)) 
[ 43.211305][ T3677] do_initcalls (init/main.c:1344 (discriminator 2)) 
[ 43.211628][ T3677] do_basic_setup (init/main.c:1367) 
[ 43.211920][ T3677] kernel_init_freeable (init/main.c:1581) 
[ 43.212238][ T3677] kernel_init (init/main.c:1471) 
[ 43.212522][ T3677] ret_from_fork (arch/x86/kernel/process.c:154) 
[ 43.212817][ T3677] ret_from_fork_asm (arch/x86/entry/entry_32.S:737) 
[ 43.213118][ T3677] restore_all_switch_stack (arch/x86/entry/entry_32.S:945) 
[   43.213451][ T3677]
[   43.213451][ T3677] -> #0 (fs_reclaim){+.+.}-{0:0}:
[ 43.213866][ T3677] __lock_acquire (kernel/locking/lockdep.c:?) 
[ 43.214233][ T3677] lock_acquire (kernel/locking/lockdep.c:5871) 
[ 43.214557][ T3677] fs_reclaim_acquire (mm/page_alloc.c:4234 mm/page_alloc.c:4248) 
[ 43.214911][ T3677] __kmalloc_cache_noprof (include/linux/sched/mm.h:319 mm/slub.c:4131 mm/slub.c:4209 mm/slub.c:4391) 
[ 43.215287][ T3677] mas_wr_spanning_store (include/linux/slab.h:905 include/linux/slab.h:1039 lib/maple_tree.c:3801) 
[ 43.215627][ T3677] mas_wr_store_entry (lib/maple_tree.c:?) 
[ 43.215959][ T3677] mas_store_prealloc (include/linux/maple_tree.h:566 lib/maple_tree.c:5516) 
[ 43.216270][ T3677] commit_merge (mm/vma.c:767) 
[ 43.216555][ T3677] vma_modify (mm/vma.c:973 (discriminator 1)) 
[ 43.216831][ T3677] vma_modify_flags (mm/vma.c:?) 
[ 43.217122][ T3677] madvise_walk_vmas (mm/madvise.c:168) 
[ 43.217429][ T3677] madvise_do_behavior (mm/madvise.c:?) 
[ 43.217748][ T3677] do_madvise (mm/madvise.c:1909) 
[ 43.218086][ T3677] __ia32_sys_madvise (mm/madvise.c:1918 (discriminator 1) mm/madvise.c:1916 (discriminator 1) mm/madvise.c:1916 (discriminator 1)) 
[ 43.218546][ T3677] ia32_sys_call (arch/x86/entry/syscall_32.c:50 (discriminator 376832)) 
[ 43.219019][ T3677] do_int80_syscall_32 (arch/x86/entry/syscall_32.c:?) 
[ 43.219532][ T3677] restore_all_switch_stack (arch/x86/entry/entry_32.S:945) 
[   43.220078][ T3677]
[   43.220078][ T3677] other info that might help us debug this:
[   43.220078][ T3677]
[   43.221003][ T3677]  Possible unsafe locking scenario:
[   43.221003][ T3677]
[   43.221674][ T3677]        CPU0                    CPU1
[   43.222191][ T3677]        ----                    ----
[   43.222699][ T3677]   lock(&mapping->i_mmap_rwsem);
[   43.223178][ T3677]                                lock(fs_reclaim);
[   43.223787][ T3677]                                lock(&mapping->i_mmap_rwsem);
[   43.224481][ T3677]   lock(fs_reclaim);
[   43.224863][ T3677]
[   43.224863][ T3677]  *** DEADLOCK ***
[   43.224863][ T3677]
[   43.225618][ T3677] 2 locks held by trinity-c2/3677:
[ 43.226112][ T3677] #0: b49a3800 (&mm->mmap_lock){++++}-{4:4}, at: madvise_lock (include/linux/mmap_lock.h:40) 
[ 43.226906][ T3677] #1: b53d3c48 (&mapping->i_mmap_rwsem){++++}-{4:4}, at: vma_prepare (mm/vma.c:296) 
[   43.227744][ T3677]
[   43.227744][ T3677] stack backtrace:
[   43.228320][ T3677] CPU: 0 UID: 65534 PID: 3677 Comm: trinity-c2 Not tainted 6.16.0-rc6-next-20250716-00001-gf8c8dfd75d35 #1 PREEMPT(full)
[   43.229467][ T3677] Call Trace:
[ 43.229791][ T3677] __dump_stack (lib/dump_stack.c:95) 
[ 43.230220][ T3677] dump_stack_lvl (lib/dump_stack.c:123 (discriminator 2)) 
[ 43.230647][ T3677] dump_stack (lib/dump_stack.c:129) 
[ 43.231038][ T3677] print_circular_bug (kernel/locking/lockdep.c:2048) 
[ 43.231525][ T3677] check_noncircular (kernel/locking/lockdep.c:2178) 
[ 43.231983][ T3677] __lock_acquire (kernel/locking/lockdep.c:?) 
[ 43.232421][ T3677] ? rcu_lock_acquire (include/linux/rcupdate.h:340) 
[ 43.232864][ T3677] lock_acquire (kernel/locking/lockdep.c:5871) 
[ 43.233269][ T3677] ? __kmalloc_cache_noprof (include/linux/sched/mm.h:319 mm/slub.c:4131 mm/slub.c:4209 mm/slub.c:4391) 
[ 43.233766][ T3677] ? local_clock_noinstr (kernel/sched/build_utility.c:304) 
[ 43.234272][ T3677] fs_reclaim_acquire (mm/page_alloc.c:4234 mm/page_alloc.c:4248) 
[ 43.234735][ T3677] ? __kmalloc_cache_noprof (include/linux/sched/mm.h:319 mm/slub.c:4131 mm/slub.c:4209 mm/slub.c:4391) 
[ 43.235244][ T3677] __kmalloc_cache_noprof (include/linux/sched/mm.h:319 mm/slub.c:4131 mm/slub.c:4209 mm/slub.c:4391) 
[ 43.235732][ T3677] ? mas_wr_spanning_store (include/linux/slab.h:905 include/linux/slab.h:1039 lib/maple_tree.c:3801) 
[ 43.236247][ T3677] mas_wr_spanning_store (include/linux/slab.h:905 include/linux/slab.h:1039 lib/maple_tree.c:3801) 
[ 43.236762][ T3677] mas_wr_store_entry (lib/maple_tree.c:?) 
[ 43.237244][ T3677] ? local_clock_noinstr (kernel/sched/build_utility.c:304) 
[ 43.237717][ T3677] ? local_clock_noinstr (kernel/sched/build_utility.c:304) 
[ 43.238198][ T3677] ? __this_cpu_preempt_check (lib/smp_processor_id.c:65) 
[ 43.238697][ T3677] ? kvm_sched_clock_read (arch/x86/kernel/kvmclock.c:91) 
[ 43.239169][ T3677] ? sched_clock_noinstr (arch/x86/kernel/tsc.c:271) 
[ 43.239640][ T3677] ? local_clock_noinstr (kernel/sched/build_utility.c:304) 
[ 43.240126][ T3677] ? local_clock_noinstr (kernel/sched/build_utility.c:304) 
[ 43.240615][ T3677] ? __lock_acquire (kernel/locking/lockdep.c:4677) 
[ 43.241082][ T3677] ? kvm_sched_clock_read (arch/x86/kernel/kvmclock.c:91) 
[ 43.241559][ T3677] ? kvm_sched_clock_read (arch/x86/kernel/kvmclock.c:91) 
[ 43.242051][ T3677] ? sched_clock_noinstr (arch/x86/kernel/tsc.c:271) 
[ 43.242527][ T3677] ? local_clock_noinstr (kernel/sched/build_utility.c:304) 
[ 43.243023][ T3677] ? kvm_sched_clock_read (arch/x86/kernel/kvmclock.c:91) 
[ 43.243505][ T3677] ? sched_clock_noinstr (arch/x86/kernel/tsc.c:271) 
[ 43.243982][ T3677] ? local_clock_noinstr (kernel/sched/build_utility.c:304) 
[ 43.244467][ T3677] ? __lock_acquire (kernel/locking/lockdep.c:4677) 
[ 43.244939][ T3677] ? kvm_sched_clock_read (arch/x86/kernel/kvmclock.c:91) 
[ 43.245416][ T3677] ? sched_clock_noinstr (arch/x86/kernel/tsc.c:271) 
[ 43.245907][ T3677] ? local_clock_noinstr (kernel/sched/build_utility.c:304) 
[ 43.246271][ T3677] ? __lock_acquire (kernel/locking/lockdep.c:4677) 
[ 43.246605][ T3677] ? sched_clock_noinstr (arch/x86/kernel/tsc.c:271) 
[ 43.246942][ T3677] ? local_clock_noinstr (kernel/sched/build_utility.c:304) 
[ 43.247288][ T3677] ? __this_cpu_preempt_check (lib/smp_processor_id.c:65) 
[ 43.247606][ T3677] ? kmem_cache_alloc_bulk_noprof (arch/x86/include/asm/irqflags.h:19 arch/x86/include/asm/irqflags.h:109 arch/x86/include/asm/irqflags.h:151 mm/slub.c:5349 mm/slub.c:5403) 
[ 43.247962][ T3677] ? __this_cpu_preempt_check (lib/smp_processor_id.c:65) 
[ 43.248278][ T3677] ? lockdep_hardirqs_on (kernel/locking/lockdep.c:4475 (discriminator 5)) 
[ 43.248578][ T3677] ? kmem_cache_alloc_bulk_noprof (mm/slub.c:?) 
[ 43.248927][ T3677] ? __this_cpu_preempt_check (lib/smp_processor_id.c:65) 
[ 43.249241][ T3677] mas_store_prealloc (include/linux/maple_tree.h:566 lib/maple_tree.c:5516) 
[ 43.249538][ T3677] commit_merge (mm/vma.c:767) 
[ 43.249813][ T3677] vma_modify (mm/vma.c:973 (discriminator 1)) 
[ 43.250135][ T3677] vma_modify_flags (mm/vma.c:?) 
[ 43.250442][ T3677] madvise_walk_vmas (mm/madvise.c:168) 
[ 43.250767][ T3677] ? __this_cpu_preempt_check (lib/smp_processor_id.c:65) 
[ 43.251146][ T3677] ? madvise_lock (include/linux/mmap_lock.h:40) 
[ 43.251417][ T3677] madvise_do_behavior (mm/madvise.c:?) 
[ 43.251704][ T3677] ? down_write_killable (kernel/locking/rwsem.c:?) 
[ 43.252002][ T3677] do_madvise (mm/madvise.c:1909) 
[ 43.252247][ T3677] __ia32_sys_madvise (mm/madvise.c:1918 (discriminator 1) mm/madvise.c:1916 (discriminator 1) mm/madvise.c:1916 (discriminator 1)) 
[ 43.252522][ T3677] ia32_sys_call (arch/x86/entry/syscall_32.c:50 (discriminator 376832)) 
[ 43.252782][ T3677] do_int80_syscall_32 (arch/x86/entry/syscall_32.c:?) 
[ 43.253069][ T3677] ? entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[ 43.253351][ T3677] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[   43.253619][ T3677] EIP: 0xa7fd1092
[ 43.253844][ T3677] Code: 00 00 00 e9 90 ff ff ff ff a3 24 00 00 00 68 30 00 00 00 e9 80 ff ff ff ff a3 f8 ff ff ff 66 90 00 00 00 00 00 00 00 00 cd 80 <c3> 8d b4 26 00 00 00 00 8d b6 00 00 00 00 8b 1c 24 c3 8d b4 26 00
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



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250722/202507220857.ad1734da-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

