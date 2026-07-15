Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B983603DB
	for <oe-lkp@lists.linux.dev>; Wed, 15 Jul 2026 04:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784090982; cv=fail; b=mn20rx86TnM4imBMOAQaNOjG34nXQIuemmlMTKJ59FdUJCorROiEPKdf2A5MUDMZqiY0DTE15jJG8TsPuy1IRIdE/RrGmkATKlT45IF7k97K4WaOuSNVWfwGORgN42sDmPJ0sb5HQL5y1CpWzsvZ7JtkwcxvY0i9IIADy9QMTzo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784090982; c=relaxed/simple;
	bh=OCMcbxCnglNRjEmGoGpR/wArEogNClFGR7m40QnIZok=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=HT4DPs17EZRmFcwczmfOg7M7ifuujma2Ss1sScCxXliCTlnWxp4uSIMEtTTfUg65VwJvPvYKDTENKUnYpGd8e7wyw7Hqu57+bw6K1MbIeSMa7dDs71tklbN+h9xh22CK8VFIkhzdFw7FB82PIGKKixSrxWt/sz3T0KZ+IntSzr4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a645su23; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a645su23"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784090972; x=1815626972;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=OCMcbxCnglNRjEmGoGpR/wArEogNClFGR7m40QnIZok=;
  b=a645su23OxsonHWIkGK7Oi26rPEyWgb49Fp54TA+NJQ9MPv+fmdH2wwV
   vCeNp4fwFfOaYYg53RfQORChk0QC/aLfof3Nx4M/ute0FuP9BL4/ryto/
   odkvr+qmnU71mQLvgjgtzOhvepsrdHU0128TbKMyzIs/ErFI2Lj41jxs/
   7M/Ol3pG9tUyYO6OfLjbX0dAlii/6h9b9Esr2rpDOaZC+cMS4swBNAJct
   jO7WkhkV8H48K+4183L5CT1dS24nyo0/tjuiEPQZEA772GZRFpNaEAoIW
   iS8fDtv715mQ3nlhtq6i9QjaKO8TfhxmiOzv9hRicpsaCcIMwtWPGZMP8
   A==;
X-CSE-ConnectionGUID: s5s+n8gLTiyCc/ltOeAh+Q==
X-CSE-MsgGUID: 8zAk21uMSbmRWafNkIDHgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="102271943"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; 
   d="scan'208";a="102271943"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 21:49:30 -0700
X-CSE-ConnectionGUID: CmhNs5NkQZy116UpOY0J/Q==
X-CSE-MsgGUID: qBLwY/JXRh+uc6aRfqrcjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; 
   d="scan'208";a="294266948"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 21:49:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 21:49:29 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 14 Jul 2026 21:49:29 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.48) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 21:49:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QV84p31YxVJbv9yuPpHxTlg0qmW/5AJTYrCIR73C8vytNXXW37zw6h+qfWjLLAOXjE6+GbrGhhDYQI5NcdTEpp0Hf5A3O8K2ufR1wJidJQelc3PYMlQ1izHdh5F+UXgb0ztl3kxulb7Un7NJMFOBPIgOF+FIm5VS37hrPxdO8IFQY+cd/9q+ZtCmuN6E5Vq+DSlFeicbL0GLRPl60l117M8qwVYePWfmsizuf25n5VwBugc9W0bHf7zCLKrgoElv/QD9AW/g7WpcVGjeySe+W6Mm2orjMrPf9WEFQkUSx71pZqtqzY/MmmQJu/rN19ZzkIQh6ZmZy09Noj2J/psAJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NVGR0gVtFh+xZ2cFT6Dunt+PUpWjDWmO03lsZpcmFuE=;
 b=r7HtNcz/pl+D3box+FozjvyOMcfxgXrhEpHhvjuLHnPEpCVOmM0b9AFWvxLcA2vbd+oPjoC+Q14RcrVqE8fMSfOnWMcofSEs94B86PpJ6VZpryYwizcr9ZpbJfkfrspArkQJG/N6qK0wFwptPMlM/IW/P7UceZy7SSGGTd89vz4lm08vEiv71QAwVhF8bObfwAiHI9Cdu7MdfN5hahnDUrqLHCe/0gScbVh764wYZBQGVUKpwrBX+GYreq+5KnHyCxhWC57Oq4L5gN0SHta4nG1SDgKlxnL+2wWme0wvAg2h6CFaNkGCw+9rU+nwBd/8Czz0m9SmECPxkKgsNDUfHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by SJ0PR11MB4992.namprd11.prod.outlook.com (2603:10b6:a03:2d4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Wed, 15 Jul
 2026 04:49:20 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%5]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 04:49:20 +0000
Date: Wed, 15 Jul 2026 12:49:11 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<aubrey.li@linux.intel.com>, <yu.c.chen@intel.com>, <oliver.sang@intel.com>
Subject: [linux-next:master] [sched/eevdf]  85570f10a4: hackbench.throughput
 77.2% improvement
Message-ID: <202607151005.f697e2dc-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: SI2PR01CA0002.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::21) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|SJ0PR11MB4992:EE_
X-MS-Office365-Filtering-Correlation-Id: cc26e884-e8a7-4ec8-32da-08dee22c6e62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|18002099003|3023799007|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 0IhxjISUwt9gMEu8d4imhhLDe9DrpvUEZwhlWgU2EMc33fQcnFQjBpZ5dBslFCqTXZ7CwLTXZoYSsGQ5q4dvdR87Po97lzNQN3ykqYLkCvkQh0CUAFcQUxR1G7MIOQSpCtyo0yCTpHbXfkrc/g4rvTkrBwAgcn1h2DxNzIEEts59B3aYZF5Sm6lDBN+bcH3q8DMbTiM1IW8uaPYZ8a1g+p1AtZvybTS4zz7LiUIqOOYlcMaQKPmVwDIpehk1on51qcmjgfK1aeFiW9n1UiuT+gefRrTfEK3Y3OsWPm7lHL/ucTfrJx+vL5iSqZ4E5kADC84ivBB/zzHOtt67XJj5wcQeMfLKwZg2/c2q/hAIXslvCtcfAQ2qNw/WNa0z0rxd20F26dgoFxnOWrEqZytEs4qdeHr7hcz8DY2AKwCN61uTTAh7hk5xyDP2iixOrAep/4c4n9jg2cd2DZXushsWJzx5Db0e7bXKGiEhT0cRvayrsgHvrOHcFRJW5eiInHfjwj3xuFl6Kt63tzQI6/zfMTqXL3UBN9oPGhw8bOPwxFnjj9ICP+MHGU29+k635+KthiE+S3dx8p0pUTPvdvofMZIma9sNJveQuGyp86Md2lZNL5+0L61WEFEOLtr30GCY
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(18002099003)(3023799007)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?1lgt2zTl05/AOtseaNf5Yw3B/wQWhFPOkrbkSj4/L7Zu72+mxPqsQ35M2O?=
 =?iso-8859-1?Q?RklenSH/bZ6+kii1xh0Lp1enmRHzaVj+vNuYpxX9rJkNoDfEMnyLQTpVva?=
 =?iso-8859-1?Q?tIgs8QT0YEipAWa8P0Sx3z0F6grcl9CSGl2Gld/HvxlzcxBioBvA5WpM6o?=
 =?iso-8859-1?Q?knlq1SUhnKsjavPJGX3GulJ3WdR0klMfeeTqbsVJcvEiHwBN2O+QJxsJHp?=
 =?iso-8859-1?Q?nfuWEztUxu6Mrp3sQH6x1F/h1b0yk3R/GkTBDKIIkF2gf4ovqAdywXTK0X?=
 =?iso-8859-1?Q?ixpVX1gNyukApXBhlg5aw9y9rUC1F7afihqGLjU4hTl8Ec70Jezkl8j6vD?=
 =?iso-8859-1?Q?jZlohauemBUaMIUV3JpFe9zDMBwIVcCGWq6EzwstYlnTyjV5MKIroN5jht?=
 =?iso-8859-1?Q?R4bH5dKB/rrs1uRvkOTL5f8hRDfLaDCwxFRYClwyFg8aX0DQYUoOxjO/ng?=
 =?iso-8859-1?Q?AD1qcvbWofCMVkv0n7YSabDpC7mcXxb3kMnoZemVPOHmhRXEdMMubBcQAy?=
 =?iso-8859-1?Q?IWkBjMmx9Gtf9/4LgWaoAn7t88v4ga8OHw6ZUigAXqrt3v2SSclStSkOdq?=
 =?iso-8859-1?Q?2b/PSQ21f3jgGfjNU8/xjiu+id/+W3cnTymwJ9IMBo+RFiMsv4N60fQk+s?=
 =?iso-8859-1?Q?04U5YEoqUatiC1aiJedTJ78hvlGNEVjMRY/DM81cMaHEtZdLotFyTprvXi?=
 =?iso-8859-1?Q?+O8SwAHdrlIOvoQBR2soNm+69LwqGfo8HBPtjO+zypZoGuXZmZ67on8+UZ?=
 =?iso-8859-1?Q?dSc0C4NP8kKwADHR1F7wO40BBVph/Vtl40jUQONaNIq4g4eHAz2Ok2suwi?=
 =?iso-8859-1?Q?Ke4FsQCD+OiDOluCbWJvqouC+iA60cJ/JcN0wjMKwtP0+cjnILlEW4U603?=
 =?iso-8859-1?Q?p/PwEc7SP2gNR8e05M4j5Z732Fps3UCQlbk66DeH9xSkCGP49fj2BhkzxR?=
 =?iso-8859-1?Q?FmN2AEwkkmYLz4p+FpvHRM8F+4BgWkE7vF3El5ZK3cvozqtutbt7pv1ynY?=
 =?iso-8859-1?Q?JbzCND7k2+uXZnVcv5N0SNJFEavtySSyUlk+BXQFfWlntOBuKNg1P7ChrX?=
 =?iso-8859-1?Q?ivelLkpGPSgpuU7StbkpLqHGUnUBLnHkF4GqKOZCJ5dJIQju1iVW5YeL0C?=
 =?iso-8859-1?Q?VKuQKS5PPNyeq0VUfuRfngtM3F9CVJem5VDtVyvn3ffNZkHMuHq7xAfx0T?=
 =?iso-8859-1?Q?3k4pioF9TLdCVUffBGc8naXZgESQiive35BHFfVqdH5+HuMT+7qyglsPhv?=
 =?iso-8859-1?Q?GnpFapr+z8EKoLPmfODtt5zTjhlKQuVBlfsEUx40pBP+sgo+KkU19JvcA/?=
 =?iso-8859-1?Q?GNW4GEYLVZZNvNq5FhMLut9fh0HKQ9Ua6eYk4TNq+ue6ub8s6AoHK5Z6mA?=
 =?iso-8859-1?Q?wdNRDPXww2kNb7/DnpmRFdipQcU1UMOs7R/hq54yOb740cMYbu5GvzBKIo?=
 =?iso-8859-1?Q?qGaxm5FpXaEsJVLupImxqhfEVBb4qHbvBXxZprnm95AZrw+I5dWG6GkxbI?=
 =?iso-8859-1?Q?i+5u+h2dIYzcuOPMukTxTGT7QG1mUytV3lArCem8DngzuLjKnI9lNSOmy3?=
 =?iso-8859-1?Q?NWptZODQmJaKuU408iKotWknuP3HyP/imJKB4PAKZOIH1CgMpJKoHYyPS2?=
 =?iso-8859-1?Q?K1ii9gooO0dyHfYSq7pfPbXFQoiXa0M4kMIGWbScXwvj+q21FyEMCQ9khX?=
 =?iso-8859-1?Q?mxhN6oSnKcHknxdHN3N7s64Ta31CGZ+mwfF/qAsOqu0pGHlgHOe4jqnTTy?=
 =?iso-8859-1?Q?lZyU0AM/PNOSRSZGFXuDY7gP9HhZv7ByG8hbVlezc6UEJPS2eXBxphj5EH?=
 =?iso-8859-1?Q?gf2JvHAs0g=3D=3D?=
X-Exchange-RoutingPolicyChecked: stEDXS5x0KmraJAF/X95yHuFi/UKu5JbBvLHYPdwV7z3pb927z+GitXVhQa/h2Ip7+bxIV1RnGUBCw52jXshsxASLHcjWiaIeF3Ks3A9RoDJvqQUp9Y4+pANaQWIrAk4tsL0gJ8sU8wItyUnTUkfU5LGiOrtFcVU5GKDSTKDEwPq1bW1KG5mLiu+LYpVRQmh3UKCq9w+5NQotZoZ83Wrg45wH6vZC6bvaQnwLhme+oxmM5t+hma15eQOr094DAX57WQJSC+iDQQLjA0JQJIkqpCynKpXueOm4jr3UCOMohCWFgPCJeeFp8uUnJC2O9aPgEpoKbHphwvSmRbvCCEnLg==
X-MS-Exchange-CrossTenant-Network-Message-Id: cc26e884-e8a7-4ec8-32da-08dee22c6e62
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 04:49:20.1038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gikbQmcSOANmogReDc9cePa/uAinWQaWc/25ratilC7D9J0L67E6suulll5WpnmiESvansHRcIv7ugRTLcZGRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4992
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 77.2% improvement of hackbench.throughput on:


commit: 85570f10a4c61372c1d437365b9d8dbad512ec6f ("sched/eevdf: Move to a single runqueue")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master


testcase: hackbench
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory
parameters:

	nr_threads: 100%
	iterations: 4
	mode: threads
	ipc: pipe
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+----------------------------------------------------------------+
| testcase: change | hackbench: hackbench.throughput 61.0% improvement              |
| test parameters  | cpufreq_governor=performance                                   |
|                  | ipc=pipe                                                       |
|                  | iterations=4                                                   |
|                  | mode=process                                                   |
|                  | nr_threads=50%                                                 |
+------------------+----------------------------------------------------------------+
| testcase: change | hackbench: hackbench.throughput 81.6% improvement              |
| test parameters  | cpufreq_governor=performance                                   |
|                  | ipc=pipe                                                       |
|                  | iterations=8                                                   |
|                  | mode=threads                                                   |
|                  | nr_threads=100%                                                |
+------------------+----------------------------------------------------------------+
| testcase: change | will-it-scale: will-it-scale.per_process_ops 24.5% improvement |
| test parameters  | cpufreq_governor=performance                                   |
|                  | mode=process                                                   |
|                  | nr_task=100%                                                   |
|                  | test=sched_yield                                               |
+------------------+----------------------------------------------------------------+
| testcase: change | will-it-scale: will-it-scale.per_thread_ops 26.0% improvement  |
| test parameters  | cpufreq_governor=performance                                   |
|                  | mode=thread                                                    |
|                  | nr_task=100%                                                   |
|                  | test=sched_yield                                               |
+------------------+----------------------------------------------------------------+




Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260715/202607151005.f697e2dc-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/ipc/iterations/kconfig/mode/nr_threads/rootfs/tbox_group/testcase:
  gcc-14/performance/pipe/4/x86_64-rhel-9.4/threads/100%/debian-13-x86_64-20250902.cgz/lkp-spr-r02/hackbench

commit: 
  fb1050ac8e ("sched/fair: Change the default cgroup_mode to concur")
  85570f10a4 ("sched/eevdf: Move to a single runqueue")

fb1050ac8e40aaa0 85570f10a4c61372c1d437365b9 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
   1696275           +77.2%    3006426        hackbench.throughput
   1636129           +74.5%    2854793        hackbench.throughput_avg
   1696275           +77.2%    3006426        hackbench.throughput_best
   1579506           +64.7%    2600752 ±  2%  hackbench.throughput_worst
     65.56           -42.0%      38.05        hackbench.time.elapsed_time
     65.56           -42.0%      38.05        hackbench.time.elapsed_time.max
  1.98e+08           -58.0%   83202814        hackbench.time.involuntary_context_switches
     95128 ±  3%     -19.8%      76319        hackbench.time.minor_page_faults
     21465            -2.3%      20980        hackbench.time.percent_of_cpu_this_job_got
     12919           -46.0%       6982        hackbench.time.system_time
      1156           -13.3%       1001        hackbench.time.user_time
 7.285e+08           -61.0%  2.841e+08        hackbench.time.voluntary_context_switches
   3696076 ±  6%     +26.4%    4672222 ±  5%  cpuidle..usage
   1090577 ± 93%     -99.2%       8572 ±  8%  numa-meminfo.node0.Shmem
    355.18            -7.5%     328.57        uptime.boot
  96279829           +10.6%  1.064e+08 ±  2%  numa-numastat.node0.local_node
  96327388           +10.6%  1.066e+08 ±  2%  numa-numastat.node0.numa_hit
  97194657           +13.6%  1.104e+08 ±  2%  numa-numastat.node1.local_node
  97397915           +13.5%  1.106e+08 ±  2%  numa-numastat.node1.numa_hit
      8.71 ±  3%     +87.1%      16.29 ± 31%  vmstat.cpu.id
   6709250 ±  3%     -28.0%    4833316 ±  2%  vmstat.memory.cache
  13537037           -35.5%    8734230 ±  6%  vmstat.system.cs
    474702           -27.1%     345957 ±  6%  vmstat.system.in
      5.73 ±  6%      +6.3       12.05 ± 47%  mpstat.cpu.all.idle%
      0.04 ±  6%      +0.0        0.05 ±  9%  mpstat.cpu.all.soft%
     85.69            -9.7       76.00 ±  6%  mpstat.cpu.all.sys%
      7.78            +3.2       11.02 ±  6%  mpstat.cpu.all.usr%
     33.50 ± 18%     -28.9%      23.83 ± 17%  mpstat.max_utilization.seconds
    272622 ± 93%     -99.2%       2142 ±  8%  numa-vmstat.node0.nr_shmem
  96326453           +10.6%  1.066e+08 ±  2%  numa-vmstat.node0.numa_hit
  96278894           +10.6%  1.064e+08 ±  2%  numa-vmstat.node0.numa_local
  97397324           +13.5%  1.106e+08 ±  2%  numa-vmstat.node1.numa_hit
  97194064           +13.6%  1.104e+08 ±  2%  numa-vmstat.node1.numa_local
      3673 ± 11%     -99.6%      15.50 ± 32%  perf-c2c.DRAM.local
      7072 ± 11%     -99.7%      18.00 ± 31%  perf-c2c.DRAM.remote
     46785 ± 27%    -100.0%      10.00 ± 23%  perf-c2c.HITM.local
      1578 ± 44%     -99.5%       7.17 ± 39%  perf-c2c.HITM.remote
     48363 ± 27%    -100.0%      17.17 ± 14%  perf-c2c.HITM.total
   3225741 ±  7%     -59.2%    1314614 ±  8%  meminfo.Active
   3225741 ±  7%     -59.2%    1314614 ±  8%  meminfo.Active(anon)
    437564            -4.6%     417285        meminfo.AnonHugePages
   6495617 ±  3%     -29.0%    4611527 ±  2%  meminfo.Cached
   3408354 ±  7%     -56.3%    1490021 ±  6%  meminfo.Committed_AS
  12022811 ±  2%     -14.7%   10251817        meminfo.Memused
   2424250 ± 10%     -77.7%     540163 ± 18%  meminfo.Shmem
  12116243 ±  2%     -14.5%   10354026        meminfo.max_used_kB
  14001950           -33.5%    9308468 ±  6%  perf-stat.i.context-switches
    835576 ±  2%     -45.7%     453685 ±  7%  perf-stat.i.cpu-migrations
      7968 ±  2%     +31.3%      10459 ±  4%  perf-stat.i.minor-faults
      7968 ±  2%     +31.3%      10460 ±  4%  perf-stat.i.page-faults
  13821611           -34.3%    9080172 ±  5%  perf-stat.ps.context-switches
    220586            -1.0%     218347        perf-stat.ps.cpu-clock
    816627 ±  2%     -45.9%     442153 ±  7%  perf-stat.ps.cpu-migrations
      7343 ±  2%     +31.8%       9680 ±  5%  perf-stat.ps.minor-faults
      7343 ±  2%     +31.8%       9680 ±  5%  perf-stat.ps.page-faults
    220586            -1.0%     218347        perf-stat.ps.task-clock
      0.04            +0.0        0.08 ±  9%  turbostat.C1%
      0.50 ±  4%      +0.4        0.87 ±  4%  turbostat.C1E%
      5.60 ±  5%      +6.1       11.69 ± 47%  turbostat.C6%
      2.05           +69.7%       3.48 ±  7%  turbostat.CPU%c1
      3.77 ±  7%    +129.1%       8.64 ± 61%  turbostat.CPU%c6
      0.66           +46.8%       0.97        turbostat.IPC
  32630394 ±  2%     -54.7%   14765365 ±  2%  turbostat.IRQ
   2987864 ±  6%    -100.0%       1343 ± 47%  turbostat.NMI
     64.80 ±  9%     +30.7       95.52 ±  6%  turbostat.PKG_%
      0.18 ±124%    +555.6%       1.18 ± 96%  turbostat.Pkg%pc2
     22.74           +10.4%      25.12        turbostat.RAMWatt
    810167 ±  7%     -59.3%     330052 ±  7%  proc-vmstat.nr_active_anon
    201658            -3.4%     194900        proc-vmstat.nr_anon_pages
   1627634 ±  3%     -29.1%    1154237 ±  2%  proc-vmstat.nr_file_pages
    159850            -4.0%     153527 ±  4%  proc-vmstat.nr_kernel_stack
    609792 ± 10%     -77.6%     136397 ± 17%  proc-vmstat.nr_shmem
     39190            -3.6%      37767        proc-vmstat.nr_slab_reclaimable
    810167 ±  7%     -59.3%     330052 ±  7%  proc-vmstat.nr_zone_active_anon
 1.937e+08           +12.1%  2.171e+08        proc-vmstat.numa_hit
 1.935e+08           +12.1%  2.169e+08        proc-vmstat.numa_local
  1.94e+08           +12.0%  2.173e+08        proc-vmstat.pgalloc_normal
 1.921e+08           +12.4%   2.16e+08        proc-vmstat.pgfree
     36049 ± 11%     -33.1%      24101 ±  2%  proc-vmstat.pgreuse
     22.42 ± 28%     -13.4        9.07 ± 97%  perf-profile.calltrace.cycles-pp.process_simple.perf_session__process_events.record__finish_output.cmd_record
     22.38 ± 28%     -13.3        9.07 ± 97%  perf-profile.calltrace.cycles-pp.ordered_events__queue.process_simple.perf_session__process_events.record__finish_output.cmd_record
      5.69 ± 25%      -4.5        1.20 ± 85%  perf-profile.calltrace.cycles-pp.cmd_record.handle_internal_command.main
      8.35 ± 73%      -1.7        6.67 ±223%  perf-profile.calltrace.cycles-pp.__ordered_events__flush.perf_session__process_user_event.perf_session__process_events.record__finish_output.cmd_record
      8.35 ± 73%      -1.7        6.67 ±223%  perf-profile.calltrace.cycles-pp.perf_session__process_user_event.perf_session__process_events.record__finish_output.cmd_record
      8.08 ± 73%      -1.4        6.67 ±223%  perf-profile.calltrace.cycles-pp.ordered_events__deliver_event.__ordered_events__flush.perf_session__process_user_event.perf_session__process_events.record__finish_output
      8.08 ± 73%      -1.4        6.67 ±223%  perf-profile.calltrace.cycles-pp.perf_session__deliver_event.ordered_events__deliver_event.__ordered_events__flush.perf_session__process_user_event.perf_session__process_events
      5.06 ±103%      +0.5        5.56 ±223%  perf-profile.calltrace.cycles-pp.sample__for_each_callchain_node.build_id__mark_dso_hit.perf_session__deliver_event.ordered_events__deliver_event.__ordered_events__flush
      4.88 ±103%      +0.7        5.56 ±223%  perf-profile.calltrace.cycles-pp.__thread__resolve_callchain.sample__for_each_callchain_node.build_id__mark_dso_hit.perf_session__deliver_event.ordered_events__deliver_event
      5.80 ±105%      +0.9        6.67 ±223%  perf-profile.calltrace.cycles-pp.build_id__mark_dso_hit.perf_session__deliver_event.ordered_events__deliver_event.__ordered_events__flush.perf_session__process_user_event
      3.90 ±104%      +1.7        5.56 ±223%  perf-profile.calltrace.cycles-pp.thread__resolve_callchain_sample.__thread__resolve_callchain.sample__for_each_callchain_node.build_id__mark_dso_hit.perf_session__deliver_event
      3.53 ±104%      +2.0        5.56 ±223%  perf-profile.calltrace.cycles-pp.add_callchain_ip.thread__resolve_callchain_sample.__thread__resolve_callchain.sample__for_each_callchain_node.build_id__mark_dso_hit
      8.35 ± 73%      -1.7        6.67 ±223%  perf-profile.children.cycles-pp.__ordered_events__flush
      8.35 ± 73%      -1.7        6.67 ±223%  perf-profile.children.cycles-pp.perf_session__process_user_event
      8.08 ± 73%      -1.4        6.67 ±223%  perf-profile.children.cycles-pp.ordered_events__deliver_event
      8.08 ± 73%      -0.6        7.51 ±194%  perf-profile.children.cycles-pp.perf_session__deliver_event
      5.06 ±103%      +0.5        5.56 ±223%  perf-profile.children.cycles-pp.sample__for_each_callchain_node
      4.88 ±103%      +0.7        5.56 ±223%  perf-profile.children.cycles-pp.__thread__resolve_callchain
      5.80 ±105%      +0.9        6.67 ±223%  perf-profile.children.cycles-pp.build_id__mark_dso_hit
      3.95 ±103%      +1.6        5.56 ±223%  perf-profile.children.cycles-pp.thread__resolve_callchain_sample
      3.58 ±103%      +2.0        5.56 ±223%  perf-profile.children.cycles-pp.add_callchain_ip
     27668           -97.4%     720.48        sched_debug.cfs_rq:/.avg_vruntime.avg
     45097 ±  5%     -61.5%      17381 ± 25%  sched_debug.cfs_rq:/.avg_vruntime.max
     25078           -99.8%      49.43 ± 11%  sched_debug.cfs_rq:/.avg_vruntime.min
      2580 ± 13%     -27.4%       1874 ± 15%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      8.72 ±  5%     -99.5%       0.04 ± 10%  sched_debug.cfs_rq:/.h_nr_queued.avg
     19.17 ±  6%     -93.9%       1.17 ± 31%  sched_debug.cfs_rq:/.h_nr_queued.max
      4.46 ±  3%     -95.3%       0.21 ±  7%  sched_debug.cfs_rq:/.h_nr_queued.stddev
      8.55 ±  5%     -99.5%       0.04 ±  9%  sched_debug.cfs_rq:/.h_nr_runnable.avg
     19.08 ±  7%     -94.8%       1.00        sched_debug.cfs_rq:/.h_nr_runnable.max
      4.42 ±  3%     -95.4%       0.20 ±  4%  sched_debug.cfs_rq:/.h_nr_runnable.stddev
    640858 ±  2%     -96.2%      24377 ±  9%  sched_debug.cfs_rq:/.load.avg
   1540919 ±  8%     -51.1%     754013 ± 37%  sched_debug.cfs_rq:/.load.max
    223212 ±  7%     -47.7%     116795 ±  8%  sched_debug.cfs_rq:/.load.stddev
     41336 ±  9%     +68.3%      69583 ± 21%  sched_debug.cfs_rq:/.load_avg.max
    193.92 ± 51%    -100.0%       0.00        sched_debug.cfs_rq:/.load_avg.min
      0.52           -91.7%       0.04 ±  9%  sched_debug.cfs_rq:/.nr_queued.avg
      0.13 ± 18%     +53.1%       0.20 ±  4%  sched_debug.cfs_rq:/.nr_queued.stddev
      3.76 ± 26%    +236.6%      12.67 ± 22%  sched_debug.cfs_rq:/.removed.runnable_avg.avg
    258.17          +101.5%     520.33        sched_debug.cfs_rq:/.removed.runnable_avg.max
     29.75 ± 14%    +159.8%      77.29 ± 11%  sched_debug.cfs_rq:/.removed.runnable_avg.stddev
      3.76 ± 26%    +236.6%      12.67 ± 22%  sched_debug.cfs_rq:/.removed.util_avg.avg
    258.17          +101.5%     520.33        sched_debug.cfs_rq:/.removed.util_avg.max
     29.75 ± 14%    +159.8%      77.29 ± 11%  sched_debug.cfs_rq:/.removed.util_avg.stddev
      8861 ±  3%     -98.5%     131.46 ±  6%  sched_debug.cfs_rq:/.runnable_avg.avg
     14023 ±  4%     -92.3%       1080 ±  6%  sched_debug.cfs_rq:/.runnable_avg.max
      3571 ± 26%    -100.0%       0.00        sched_debug.cfs_rq:/.runnable_avg.min
      1695 ±  8%     -87.4%     213.16 ±  5%  sched_debug.cfs_rq:/.runnable_avg.stddev
    573.43           -77.1%     131.34 ±  6%  sched_debug.cfs_rq:/.util_avg.avg
      1278 ±  4%     -15.6%       1079 ±  6%  sched_debug.cfs_rq:/.util_avg.max
    266.50 ± 22%    -100.0%       0.00        sched_debug.cfs_rq:/.util_avg.min
    162.57 ±  4%     +31.0%     213.04 ±  5%  sched_debug.cfs_rq:/.util_avg.stddev
    804.96 ±  7%     -98.3%      13.46 ± 16%  sched_debug.cfs_rq:/.util_est.avg
      4373 ± 26%     -79.6%     891.17 ±  7%  sched_debug.cfs_rq:/.util_est.max
    546.11 ± 11%     -83.2%      91.62 ±  9%  sched_debug.cfs_rq:/.util_est.stddev
     27668           -97.4%     720.48        sched_debug.cfs_rq:/.zero_vruntime.avg
     45097 ±  5%     -61.5%      17381 ± 25%  sched_debug.cfs_rq:/.zero_vruntime.max
     25078           -99.8%      49.43 ± 11%  sched_debug.cfs_rq:/.zero_vruntime.min
      2580 ± 13%     -27.4%       1874 ± 15%  sched_debug.cfs_rq:/.zero_vruntime.stddev
    666164 ±  3%     +38.2%     920418 ±  2%  sched_debug.cpu.avg_idle.avg
    227571 ±  6%     -20.3%     181298 ± 11%  sched_debug.cpu.avg_idle.stddev
    319224            -9.8%     288003        sched_debug.cpu.clock.avg
    319969           -10.0%     288020        sched_debug.cpu.clock.max
    318436            -9.6%     287983        sched_debug.cpu.clock.min
    441.05 ± 14%     -97.8%       9.68 ±  5%  sched_debug.cpu.clock.stddev
    318810            -9.7%     287836        sched_debug.cpu.clock_task.avg
    319683            -9.9%     287990        sched_debug.cpu.clock_task.max
    304138            -9.9%     273890        sched_debug.cpu.clock_task.min
      1155 ±  4%     -18.2%     945.03        sched_debug.cpu.clock_task.stddev
     21804           -98.6%     301.50 ± 15%  sched_debug.cpu.curr->pid.avg
     28025           -71.2%       8073        sched_debug.cpu.curr->pid.max
      2205 ±  8%     -32.5%       1489 ±  7%  sched_debug.cpu.curr->pid.stddev
      0.00 ± 15%     -97.1%       0.00 ± 17%  sched_debug.cpu.next_balance.stddev
      8.75 ±  5%     -99.5%       0.04 ± 22%  sched_debug.cpu.nr_running.avg
     19.00 ±  6%     -93.0%       1.33 ± 35%  sched_debug.cpu.nr_running.max
      4.48 ±  3%     -95.4%       0.21 ± 14%  sched_debug.cpu.nr_running.stddev
   1911899           -99.9%       1110 ±  2%  sched_debug.cpu.nr_switches.avg
   2232521 ±  5%     -99.3%      15017 ± 15%  sched_debug.cpu.nr_switches.max
   1616194 ±  7%    -100.0%     289.50 ±  5%  sched_debug.cpu.nr_switches.min
    185882 ± 52%     -99.2%       1573 ±  6%  sched_debug.cpu.nr_switches.stddev
      2.37 ±  6%     -99.6%       0.01 ± 58%  sched_debug.cpu.nr_uninterruptible.avg
    203.33 ± 14%     -66.5%      68.17 ± 33%  sched_debug.cpu.nr_uninterruptible.max
   -162.00           -95.7%      -7.00        sched_debug.cpu.nr_uninterruptible.min
     61.42 ±  5%     -88.3%       7.20 ±  8%  sched_debug.cpu.nr_uninterruptible.stddev
    318410            -9.6%     287988        sched_debug.cpu_clk
      0.33 ± 70%    +200.0%       1.00        sched_debug.dl_rq:.dl_nr_running.max
      0.03 ± 74%    +191.2%       0.09 ± 25%  sched_debug.dl_rq:.dl_nr_running.stddev
    317345            -9.6%     286922        sched_debug.ktime
    320650            -9.5%     290233        sched_debug.sched_clk
      0.02 ± 51%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.(inlined).receiver.[unknown]
      1.90 ± 23%    +104.1%       3.88 ±  2%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
      0.25 ±101%    +323.3%       1.05 ± 74%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group
      1.92 ± 30%    +119.4%       4.21 ±  7%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      5.11 ± 69%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.io_schedule.softleaf_entry_wait_on_locked.migration_entry_wait.do_swap_page
     69.53 ± 32%     -61.8%      26.56 ± 17%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
      0.12 ±124%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_call_function_single.[unknown]
      0.23 ±107%     -97.4%       0.01 ±223%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_call_function_single.read@plt.[unknown]
      0.37 ±142%     -90.4%       0.04 ±159%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_call_function_single.receiver.[unknown]
      0.79 ± 75%     -93.8%       0.05 ±223%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_call_function_single.sender.[unknown]
      0.21 ±112%     -99.4%       0.00 ±223%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_call_function_single.write.[unknown]
      0.20 ±166%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_call_function_single.write@plt.[unknown]
     79.77 ±130%     -96.0%       3.20 ± 40%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__alloc_frozen_pages_noprof
     98.75 ± 36%     -69.5%      30.15 ± 11%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt._copy_from_iter
     81.30 ± 31%     -60.3%      32.28 ± 22%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.anon_pipe_write
    102.69 ± 34%     -72.1%      28.67 ± 10%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.do_syscall_64
      0.11 ± 45%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.irqentry_exit
      0.02 ± 87%   +5456.8%       1.22 ± 77%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.ksys_read
     87.25 ± 39%     -68.5%      27.47 ± 19%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.mutex_lock
     67.19 ± 32%     -58.6%      27.81 ± 32%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.mutex_unlock
      4.54 ±202%   +1287.3%      62.96 ±109%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.page_counter_try_charge
     86.29 ± 46%     -64.3%      30.79 ± 23%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.vfs_write
     95.87 ± 48%     -51.9%      46.11 ± 26%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.__mutex_lock.constprop.0
     75.95 ± 34%     -65.7%      26.03 ± 57%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.__mutex_unlock_slowpath.isra.0
     11.24 ± 36%     +47.0%      16.52 ±  9%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      0.01 ± 31%  +5.9e+05%      54.05 ±118%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      0.27 ± 67%   +1922.4%       5.38 ± 33%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0
     59.27 ± 31%     -62.1%      22.46 ± 11%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.schedule_preempt_disabled.__mutex_lock.constprop.0
      5.12 ±125%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read_killable.lock_mm_and_find_vma
      0.25 ± 28%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.schedule_timeout.wait_for_completion.synchronize_rcu_normal.part
      0.02 ± 51%    -100.0%       0.00        perf-sched.sch_delay.max.ms.(inlined).receiver.[unknown]
    298.19 ±102%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.io_schedule.softleaf_entry_wait_on_locked.migration_entry_wait.do_swap_page
      2.70 ±141%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_call_function_single.[unknown]
    322.80 ± 95%     -96.7%      10.80 ±134%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_call_function_single.[unknown].[unknown]
      2.18 ±112%     -98.8%       0.03 ±223%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_call_function_single.read@plt.[unknown]
      4.59 ±136%     -98.5%       0.07 ±141%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_call_function_single.receiver.[unknown]
     41.46 ±127%     -99.4%       0.24 ±223%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_call_function_single.sender.[unknown]
      0.77 ±111%     -99.8%       0.00 ±223%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_call_function_single.write.[unknown]
      0.27 ±141%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_call_function_single.write@plt.[unknown]
      0.52 ± 83%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.irqentry_exit
      0.03 ± 98%   +8027.5%       2.56 ± 70%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.ksys_read
     15.20 ±212%   +9022.7%       1386 ± 75%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.page_counter_try_charge
     15.61 ±143%   +3478.2%     558.70 ± 92%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.try_charge_memcg
      0.03 ± 46%  +2.5e+06%     692.37 ±146%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      1817 ± 85%     -99.5%       8.89 ± 18%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0
     86.21 ±113%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read_killable.lock_mm_and_find_vma
     84.06 ±223%    -100.0%       0.02 ±130%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.86 ± 15%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.schedule_timeout.wait_for_completion.synchronize_rcu_normal.part
      1.24 ±142%    +410.4%       6.33 ± 97%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.wait_for_partner.fifo_open.do_dentry_open.vfs_open
    479.94 ±138%     -99.2%       3.81 ± 31%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      2.39 ± 26%    +110.1%       5.02 ±  3%  perf-sched.total_sch_delay.average.ms
      8.20 ± 24%    +108.6%      17.10 ±  4%  perf-sched.total_wait_and_delay.average.ms
   5761411 ± 10%     -27.9%    4156231 ±  9%  perf-sched.total_wait_and_delay.count.ms
      5.81 ± 23%    +108.0%      12.08 ±  4%  perf-sched.total_wait_time.average.ms
      6.43 ± 21%     +82.2%      11.71 ±  3%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
      5.97 ± 30%    +173.9%      16.36 ±  8%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    246.40 ± 28%     -57.2%     105.51 ± 15%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
    330.59 ± 38%     -65.5%     113.97 ±  9%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt._copy_from_iter
     71.30 ± 31%     +56.8%     111.76 ± 10%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt._raw_spin_unlock_irqrestore
    251.69 ± 36%     -53.0%     118.17 ± 18%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.anon_pipe_write
    326.48 ± 32%     -67.1%     107.31 ± 11%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.do_syscall_64
    277.41 ± 37%     -60.0%     110.91 ±  6%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.mutex_lock
    219.49 ± 26%     -46.9%     116.58 ± 20%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.mutex_unlock
    250.57 ± 36%     -57.2%     107.36 ± 20%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.__mutex_unlock_slowpath.isra.0
     24.56 ± 32%     +36.6%      33.55 ±  7%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
    450.80 ± 64%     -77.9%      99.62 ± 45%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.rmqueue.isra.0
     25.56 ±148%    +586.0%     175.32 ± 71%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
    200.65 ± 30%     -56.3%      87.60 ± 12%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.schedule_preempt_disabled.__mutex_lock.constprop.0
     79.56 ± 12%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read_killable.lock_mm_and_find_vma
     36.64 ± 18%    +157.7%      94.41 ± 37%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
   4340540 ± 11%     -26.1%    3206983 ±  9%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
     22782 ± 14%    +409.6%     116101 ± 10%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.anon_pipe_write.vfs_write.ksys_write.do_syscall_64
   1351415 ±  8%     -43.0%     770660 ± 11%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    481.33 ± 19%    +202.4%       1455 ± 10%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
     67.17 ± 50%    +305.5%     272.33 ± 12%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.sender.[unknown]
     10.17 ± 41%    +268.9%      37.50 ±  4%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.write.[unknown]
      5.50 ± 53%    +187.9%      15.83 ± 17%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__alloc_frozen_pages_noprof
     13.67 ± 30%    +264.6%      49.83 ± 24%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__fget_files
      1.67 ± 82%    +710.0%      13.50 ± 26%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__memcg_kmem_charge_page
    292.67 ± 19%    +263.3%       1063 ± 11%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt._copy_from_iter
     17266 ±  9%     -69.2%       5313 ± 11%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt._raw_spin_unlock_irqrestore
    403.67 ± 15%    +100.9%     811.17 ±  9%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.anon_pipe_write
     44.17 ± 19%    +247.2%     153.33 ± 12%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.copy_page_from_iter
    635.50 ± 20%    +265.8%       2324 ± 11%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.do_syscall_64
     46.50 ± 15%    +212.9%     145.50 ± 21%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.fdget_pos
     12.00 ± 23%    +319.4%      50.33 ± 19%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.kill_fasync
     35.50 ± 27%    +287.3%     137.50 ± 10%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.ksys_write
    246.67 ± 13%    +187.5%     709.17 ± 10%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.mutex_lock
    648.00 ± 16%     +48.3%     961.00 ±  9%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.mutex_unlock
      0.83 ±223%   +4040.0%      34.50 ± 24%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.page_counter_try_charge
     22.83 ± 36%    +292.7%      89.67 ± 17%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.rw_verify_area
     19.83 ± 19%    +245.4%      68.50 ± 14%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.security_file_permission
    181.33 ± 16%    +232.2%     602.33 ± 13%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.vfs_write
     28.17 ± 25%    +225.4%      91.67 ± 11%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.x64_sys_call
    465.00 ± 18%    +103.2%     944.67 ± 13%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_thunk.__fget_files.fdget_pos.ksys_write
     56.67 ± 16%    +171.5%     153.83 ± 15%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_thunk.__mutex_unlock_slowpath.isra.0
     47.00 ± 14%    +263.8%     171.00 ± 10%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_thunk.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    147.83 ± 19%    +149.7%     369.17 ± 12%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_thunk.fput.ksys_write.do_syscall_64
     17.83 ± 30%    +386.0%      86.67 ±  9%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_thunk.rmqueue.isra.0
      2.83 ±144%    +341.2%      12.50 ± 40%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
     12.17 ± 72%     -90.4%       1.17 ±159%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
     10693 ± 20%    +314.8%      44355 ± 10%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.schedule_preempt_disabled.__mutex_lock.constprop.0
    147.00 ± 84%    -100.0%       0.00        perf-sched.wait_and_delay.count.perf_trace_sched_switch.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read_killable.lock_mm_and_find_vma
      4.33 ± 17%     -65.4%       1.50 ±107%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.schedule_timeout.kcompactd.kthread.ret_from_fork
    225.50 ± 17%     -66.1%      76.50 ± 24%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    830.83 ± 16%     -73.5%     220.33 ± 28%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
    314.16 ±223%    +814.3%       2872 ± 68%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.page_counter_try_charge
    199.16 ±142%    +785.8%       1764 ±109%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      2394 ± 45%     -85.8%     339.07 ±219%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
    281.53 ± 39%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read_killable.lock_mm_and_find_vma
      2358 ± 53%     -64.4%     840.16 ±123%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.schedule_timeout.kcompactd.kthread.ret_from_fork
      4.53 ± 21%     +73.0%       7.83 ±  3%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
      3.37 ± 35%   +3796.3%     131.38 ±129%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.do_task_dead.do_exit.__x64_sys_exit.x64_sys_call
      4.06 ± 31%    +199.7%      12.16 ±  8%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      7.55 ± 53%    -100.0%       0.00        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.io_schedule.softleaf_entry_wait_on_locked.migration_entry_wait.do_swap_page
      1.01 ± 43%     -98.6%       0.01 ±223%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_call_function.[unknown].[unknown]
      0.18 ± 92%    -100.0%       0.00        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_call_function_single.[unknown]
      2.71 ±192%     -95.0%       0.14 ±173%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_call_function_single.read.[unknown]
      0.21 ±112%     -99.4%       0.00 ±223%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_call_function_single.write.[unknown]
      0.20 ±166%    -100.0%       0.00        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_call_function_single.write@plt.[unknown]
     48.98 ± 31%     +66.6%      81.60 ± 11%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt._raw_spin_unlock_irqrestore
      5.39 ±141%   +1130.7%      66.36 ±123%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.alloc_pages_noprof
      0.19 ± 44%    -100.0%       0.00        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.irqentry_exit
      0.06 ± 61%   +2819.0%       1.71 ±103%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.ksys_read
    190.16 ± 36%     -56.1%      83.44 ±  7%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.mutex_lock
    152.30 ± 24%     -41.7%      88.78 ± 18%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.mutex_unlock
    168.64 ± 32%     -54.3%      77.05 ± 16%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.fput.ksys_write.do_syscall_64
     28.08 ±129%    +331.9%     121.27 ± 56%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      0.44 ± 58%     -99.6%       0.00 ±223%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0
     74.43 ± 19%    -100.0%       0.00        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read_killable.lock_mm_and_find_vma
     23.49 ± 15%    +193.0%      68.82 ± 39%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      2.91 ± 29%    -100.0%       0.00        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.schedule_timeout.wait_for_completion.synchronize_rcu_normal.part
    314.75 ± 93%    -100.0%       0.00        perf-sched.wait_time.max.ms.perf_trace_sched_switch.io_schedule.softleaf_entry_wait_on_locked.migration_entry_wait.do_swap_page
      8.54 ±170%     -99.8%       0.01 ±223%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_call_function.[unknown].[unknown]
      2.95 ±124%    -100.0%       0.00        perf-sched.wait_time.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_call_function_single.[unknown]
    688.35 ± 27%     -81.6%     126.65 ±157%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_call_function_single.[unknown].[unknown]
     37.66 ±215%     -99.6%       0.14 ±167%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_call_function_single.read.[unknown]
      3.67 ± 79%     -94.2%       0.21 ±191%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_call_function_single.read@plt.[unknown]
     10.66 ±116%     -99.0%       0.11 ±100%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_call_function_single.receiver.[unknown]
      0.77 ±111%     -99.8%       0.00 ±223%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_call_function_single.write.[unknown]
      0.27 ±141%    -100.0%       0.00        perf-sched.wait_time.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_call_function_single.write@plt.[unknown]
      8.86 ±160%   +2761.5%     253.44 ±105%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.alloc_pages_noprof
      0.71 ± 67%    -100.0%       0.00        perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.irqentry_exit
      0.06 ± 58%   +4857.5%       3.13 ± 70%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.ksys_read
     69.26 ±154%   +1488.8%       1100 ± 64%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.try_charge_memcg
    202.32 ±139%    +481.2%       1175 ± 75%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      2310 ± 42%     -84.9%     349.11 ±211%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      1314 ± 77%    -100.0%       0.01 ±223%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0
    236.41 ± 30%    -100.0%       0.00        perf-sched.wait_time.max.ms.perf_trace_sched_switch.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read_killable.lock_mm_and_find_vma
      2357 ± 53%     -64.4%     840.16 ±123%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.schedule_timeout.kcompactd.kthread.ret_from_fork
     10.40 ± 15%    -100.0%       0.00        perf-sched.wait_time.max.ms.perf_trace_sched_switch.schedule_timeout.wait_for_completion.synchronize_rcu_normal.part
      1.22 ±146%    +419.8%       6.33 ± 97%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.wait_for_partner.fifo_open.do_dentry_open.vfs_open


***************************************************************************************************

=========================================================================================
compiler/cpufreq_governor/ipc/iterations/kconfig/mode/nr_threads/rootfs/tbox_group/testcase:
  gcc-14/performance/pipe/4/x86_64-rhel-9.4/process/50%/debian-13-x86_64-20250902.cgz/lkp-spr-r02/hackbench

commit: 
  fb1050ac8e ("sched/fair: Change the default cgroup_mode to concur")
  85570f10a4 ("sched/eevdf: Move to a single runqueue")

fb1050ac8e40aaa0 85570f10a4c61372c1d437365b9 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
   1347655           +61.0%    2170034        hackbench.throughput
   1279681           +61.9%    2072056        hackbench.throughput_avg
   1347655           +61.0%    2170034        hackbench.throughput_best
   1162397           +60.7%    1868135        hackbench.throughput_worst
     83.50           -37.6%      52.13        hackbench.time.elapsed_time
     83.50           -37.6%      52.13        hackbench.time.elapsed_time.max
 6.597e+08           -69.7%  1.999e+08        hackbench.time.involuntary_context_switches
    679980            -7.8%     627241        hackbench.time.minor_page_faults
     21508            -2.5%      20981        hackbench.time.percent_of_cpu_this_job_got
     16371           -40.0%       9824        hackbench.time.system_time
      1590           -30.0%       1113        hackbench.time.user_time
 1.879e+09           -62.8%  6.994e+08        hackbench.time.voluntary_context_switches
  10100297 ±  5%     +49.5%   15102671 ±  2%  cpuidle..usage
    374.57            -7.8%     345.35        uptime.boot
      5.34 ± 31%      +3.9        9.22 ± 11%  mpstat.cpu.all.idle%
      0.04 ±  5%      +0.0        0.06 ±  2%  mpstat.cpu.all.soft%
     85.11            -4.7       80.44        mpstat.cpu.all.sys%
      8.51            +0.7        9.22        mpstat.cpu.all.usr%
   3217045 ±  9%     -21.3%    2532626 ± 13%  numa-meminfo.node1.Active
   3217045 ±  9%     -21.3%    2532626 ± 13%  numa-meminfo.node1.Active(anon)
    395858 ± 13%     -56.9%     170757 ± 25%  numa-meminfo.node1.Mapped
   2686068 ± 10%     -20.4%    2137756 ±  7%  numa-meminfo.node1.Shmem
  73039340           +26.6%   92502304        numa-numastat.node0.local_node
  73202657           +26.5%   92608513        numa-numastat.node0.numa_hit
  74455670           +25.6%   93509458        numa-numastat.node1.local_node
  74579795           +25.6%   93705814        numa-numastat.node1.numa_hit
      7.67 ± 17%     +59.5%      12.22 ±  6%  vmstat.cpu.id
   6948420 ±  3%      -7.4%    6437520 ±  2%  vmstat.memory.cache
  29200434           -44.1%   16311443        vmstat.system.cs
    544429           -19.6%     437873        vmstat.system.in
      3320 ±  6%     -99.5%      16.67 ± 21%  perf-c2c.DRAM.local
      7959 ±  3%     -99.8%      15.50 ± 24%  perf-c2c.DRAM.remote
    255400          -100.0%       9.33 ± 29%  perf-c2c.HITM.local
      1538 ± 16%     -99.7%       5.00 ± 36%  perf-c2c.HITM.remote
    256938          -100.0%      14.33 ± 16%  perf-c2c.HITM.total
   3645416 ±  7%     -16.6%    3040069 ±  5%  meminfo.Active
   3645416 ±  7%     -16.6%    3040069 ±  5%  meminfo.Active(anon)
    956074            -6.4%     895362        meminfo.AnonPages
   6766390 ±  4%      -8.0%    6222064 ±  2%  meminfo.Cached
   5182986 ±  5%     -12.7%    4523513 ±  3%  meminfo.Committed_AS
    437808 ±  4%     -48.9%     223705 ±  2%  meminfo.Mapped
   2695002 ± 10%     -20.2%    2150680 ±  7%  meminfo.Shmem
  73202702           +26.5%   92608502        numa-vmstat.node0.numa_hit
  73039385           +26.6%   92502296        numa-vmstat.node0.numa_local
    802661 ±  9%     -21.0%     634177 ± 13%  numa-vmstat.node1.nr_active_anon
     98414 ± 12%     -56.5%      42799 ± 25%  numa-vmstat.node1.nr_mapped
    669979 ± 10%     -20.1%     535432 ±  7%  numa-vmstat.node1.nr_shmem
    802660 ±  9%     -21.0%     634174 ± 13%  numa-vmstat.node1.nr_zone_active_anon
  74579679           +25.6%   93705682        numa-vmstat.node1.numa_hit
  74455560           +25.6%   93509327        numa-vmstat.node1.numa_local
  30022084           -43.0%   17104150        perf-stat.i.context-switches
   3044460           -61.3%    1176879        perf-stat.i.cpu-migrations
     14664           +34.3%      19698        perf-stat.i.minor-faults
     14667           +34.3%      19703        perf-stat.i.page-faults
  29714923           -43.4%   16809705        perf-stat.ps.context-switches
   3008319           -61.6%    1156027        perf-stat.ps.cpu-migrations
     13798           +34.1%      18509 ±  2%  perf-stat.ps.minor-faults
     13801           +34.1%      18513 ±  2%  perf-stat.ps.page-faults
      0.13 ±  5%      +0.2        0.29 ±  2%  turbostat.C1%
      0.51 ±  5%      +0.4        0.96 ±  3%  turbostat.C1E%
      5.03 ± 27%      +3.0        7.98 ± 12%  turbostat.C6%
      1.79 ±  4%     +59.4%       2.85 ±  3%  turbostat.CPU%c1
      0.67           +14.9%       0.77        turbostat.IPC
  47506999 ±  2%     -48.3%   24538664        turbostat.IRQ
   3664721          -100.0%     692.83 ± 19%  turbostat.NMI
    100.43 ±  2%      -7.7       92.75 ±  2%  turbostat.PKG_%
      0.02            +0.0        0.05        turbostat.POLL%
      0.01 ± 76%   +7800.0%       0.92 ± 28%  turbostat.Pkg%pc2
     24.13            +7.3%      25.89        turbostat.RAMWatt
    910069 ±  7%     -16.7%     758312 ±  5%  proc-vmstat.nr_active_anon
    238954            -6.4%     223777        proc-vmstat.nr_anon_pages
   1690380 ±  4%      -8.1%    1553872 ±  2%  proc-vmstat.nr_file_pages
    109061 ±  4%     -49.0%      55657 ±  3%  proc-vmstat.nr_mapped
    672533 ± 10%     -20.3%     536026 ±  7%  proc-vmstat.nr_shmem
    129023            -1.1%     127656        proc-vmstat.nr_slab_unreclaimable
    910069 ±  7%     -16.7%     758312 ±  5%  proc-vmstat.nr_zone_active_anon
     86746 ± 19%     -52.4%      41255 ± 32%  proc-vmstat.numa_hint_faults
 1.478e+08           +26.1%  1.863e+08        proc-vmstat.numa_hit
 1.475e+08           +26.1%   1.86e+08        proc-vmstat.numa_local
     50341 ± 52%     -98.4%     829.33 ±177%  proc-vmstat.numa_pages_migrated
    138997 ± 44%     -68.0%      44447 ± 32%  proc-vmstat.numa_pte_updates
 1.479e+08           +26.0%  1.864e+08        proc-vmstat.pgalloc_normal
   1321807           -13.3%    1146193        proc-vmstat.pgfault
 1.462e+08           +26.2%  1.845e+08        proc-vmstat.pgfree
     50341 ± 52%     -98.4%     829.33 ±177%  proc-vmstat.pgmigrate_success
    132669 ±  5%     -24.4%     100293 ±  3%  proc-vmstat.pgreuse
     10.00 ± 50%     -10.0        0.00        perf-profile.calltrace.cycles-pp.__ordered_events__flush.perf_session__process_user_event.perf_session__process_events.record__finish_output.cmd_record
     10.00 ± 50%     -10.0        0.00        perf-profile.calltrace.cycles-pp.ordered_events__deliver_event.__ordered_events__flush.perf_session__process_user_event.perf_session__process_events.record__finish_output
     10.00 ± 50%     -10.0        0.00        perf-profile.calltrace.cycles-pp.perf_session__deliver_event.ordered_events__deliver_event.__ordered_events__flush.perf_session__process_user_event.perf_session__process_events
     10.00 ± 50%     -10.0        0.00        perf-profile.calltrace.cycles-pp.perf_session__process_user_event.perf_session__process_events.record__finish_output.cmd_record
      9.30 ± 51%      -9.3        0.00        perf-profile.calltrace.cycles-pp.build_id__mark_dso_hit.perf_session__deliver_event.ordered_events__deliver_event.__ordered_events__flush.perf_session__process_user_event
      8.79 ± 49%      -8.8        0.00        perf-profile.calltrace.cycles-pp.__thread__resolve_callchain.sample__for_each_callchain_node.build_id__mark_dso_hit.perf_session__deliver_event.ordered_events__deliver_event
      8.79 ± 49%      -8.8        0.00        perf-profile.calltrace.cycles-pp.sample__for_each_callchain_node.build_id__mark_dso_hit.perf_session__deliver_event.ordered_events__deliver_event.__ordered_events__flush
      5.21 ± 55%      -5.2        0.00        perf-profile.calltrace.cycles-pp.thread__resolve_callchain_sample.__thread__resolve_callchain.sample__for_each_callchain_node.build_id__mark_dso_hit.perf_session__deliver_event
      4.97 ± 53%      -5.0        0.00        perf-profile.calltrace.cycles-pp.add_callchain_ip.thread__resolve_callchain_sample.__thread__resolve_callchain.sample__for_each_callchain_node.build_id__mark_dso_hit
     10.00 ± 50%     -10.0        0.00        perf-profile.children.cycles-pp.__ordered_events__flush
     10.00 ± 50%     -10.0        0.00        perf-profile.children.cycles-pp.ordered_events__deliver_event
     10.00 ± 50%     -10.0        0.00        perf-profile.children.cycles-pp.perf_session__process_user_event
     10.00 ± 50%      -9.9        0.12 ±223%  perf-profile.children.cycles-pp.perf_session__deliver_event
      9.30 ± 51%      -9.3        0.00        perf-profile.children.cycles-pp.build_id__mark_dso_hit
      8.79 ± 49%      -8.8        0.00        perf-profile.children.cycles-pp.__thread__resolve_callchain
      8.79 ± 49%      -8.8        0.00        perf-profile.children.cycles-pp.sample__for_each_callchain_node
      5.21 ± 55%      -5.2        0.00        perf-profile.children.cycles-pp.thread__resolve_callchain_sample
      4.97 ± 53%      -5.0        0.00        perf-profile.children.cycles-pp.add_callchain_ip
      2.36 ± 43%      -1.7        0.69 ±144%  perf-profile.children.cycles-pp.__do_sys_newfstatat
      2.20 ± 46%      -1.5        0.69 ±144%  perf-profile.children.cycles-pp.vfs_fstatat
     25651           -97.1%     734.38 ±  2%  sched_debug.cfs_rq:/.avg_vruntime.avg
     41927 ±  5%     -64.2%      15005 ± 18%  sched_debug.cfs_rq:/.avg_vruntime.max
     24282           -99.8%      42.00 ± 18%  sched_debug.cfs_rq:/.avg_vruntime.min
      2084 ±  3%     -13.0%       1814 ± 10%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      4.71           -99.0%       0.05 ± 19%  sched_debug.cfs_rq:/.h_nr_queued.avg
     11.58 ± 13%     -91.4%       1.00        sched_debug.cfs_rq:/.h_nr_queued.max
      2.70 ±  4%     -92.3%       0.21 ±  8%  sched_debug.cfs_rq:/.h_nr_queued.stddev
      4.60           -99.0%       0.05 ± 19%  sched_debug.cfs_rq:/.h_nr_runnable.avg
     11.50 ± 14%     -91.3%       1.00        sched_debug.cfs_rq:/.h_nr_runnable.max
      2.68 ±  4%     -92.3%       0.21 ±  8%  sched_debug.cfs_rq:/.h_nr_runnable.stddev
    666828           -96.2%      25563 ± 21%  sched_debug.cfs_rq:/.load.avg
   1712362 ±  9%     -54.3%     783145 ± 27%  sched_debug.cfs_rq:/.load.max
    255742 ±  6%     -53.3%     119371 ± 13%  sched_debug.cfs_rq:/.load.stddev
     39659 ±  9%     +82.0%      72192 ± 19%  sched_debug.cfs_rq:/.load_avg.max
    150.08 ± 29%    -100.0%       0.00        sched_debug.cfs_rq:/.load_avg.min
      5751 ± 13%     +95.1%      11220 ± 23%  sched_debug.cfs_rq:/.load_avg.stddev
      0.52           -91.3%       0.05 ± 19%  sched_debug.cfs_rq:/.nr_queued.avg
      0.14 ± 20%     +51.3%       0.21 ±  8%  sched_debug.cfs_rq:/.nr_queued.stddev
      4.99 ± 60%    +150.8%      12.50 ± 26%  sched_debug.cfs_rq:/.removed.runnable_avg.avg
    259.33          +111.4%     548.33 ± 10%  sched_debug.cfs_rq:/.removed.runnable_avg.max
     33.28 ± 31%    +131.5%      77.05 ± 10%  sched_debug.cfs_rq:/.removed.runnable_avg.stddev
      4.99 ± 60%    +150.8%      12.50 ± 26%  sched_debug.cfs_rq:/.removed.util_avg.avg
    259.33          +111.4%     548.33 ± 10%  sched_debug.cfs_rq:/.removed.util_avg.max
     33.28 ± 31%    +131.5%      77.05 ± 10%  sched_debug.cfs_rq:/.removed.util_avg.stddev
      4698           -97.2%     130.36 ±  9%  sched_debug.cfs_rq:/.runnable_avg.avg
      9956 ± 10%     -88.6%       1137 ± 20%  sched_debug.cfs_rq:/.runnable_avg.max
      1296 ± 49%    -100.0%       0.00        sched_debug.cfs_rq:/.runnable_avg.min
      1190 ±  7%     -82.1%     213.21 ±  9%  sched_debug.cfs_rq:/.runnable_avg.stddev
    560.06           -76.7%     130.22 ±  9%  sched_debug.cfs_rq:/.util_avg.avg
    212.50 ± 21%    -100.0%       0.00        sched_debug.cfs_rq:/.util_avg.min
    638.71 ±  4%     -97.9%      13.46 ± 22%  sched_debug.cfs_rq:/.util_est.avg
      3539 ± 26%     -75.0%     885.00 ± 12%  sched_debug.cfs_rq:/.util_est.max
    473.95 ± 13%     -81.0%      90.01 ± 11%  sched_debug.cfs_rq:/.util_est.stddev
     25651           -97.1%     734.38 ±  2%  sched_debug.cfs_rq:/.zero_vruntime.avg
     41927 ±  5%     -64.2%      15005 ± 18%  sched_debug.cfs_rq:/.zero_vruntime.max
     24282           -99.8%      42.00 ± 18%  sched_debug.cfs_rq:/.zero_vruntime.min
      2084 ±  3%     -13.0%       1814 ± 10%  sched_debug.cfs_rq:/.zero_vruntime.stddev
    516808           +79.1%     925411        sched_debug.cpu.avg_idle.avg
    319371            -8.7%     291446        sched_debug.cpu.clock.avg
    319515            -8.8%     291462        sched_debug.cpu.clock.max
    319236            -8.7%     291426        sched_debug.cpu.clock.min
     75.89 ± 24%     -87.3%       9.60 ±  5%  sched_debug.cpu.clock.stddev
    318894            -8.7%     291278        sched_debug.cpu.clock_task.avg
    319181            -8.7%     291428        sched_debug.cpu.clock_task.max
    304819            -9.0%     277351        sched_debug.cpu.clock_task.min
     11615           -97.4%     298.86 ± 13%  sched_debug.cpu.curr->pid.avg
     16865           -52.2%       8058        sched_debug.cpu.curr->pid.max
      0.00 ± 31%     -89.5%       0.00 ±  5%  sched_debug.cpu.next_balance.stddev
      4.66 ±  2%     -99.1%       0.04 ± 14%  sched_debug.cpu.nr_running.avg
     11.67 ± 13%     -91.4%       1.00        sched_debug.cpu.nr_running.max
      2.72 ±  3%     -92.6%       0.20 ±  6%  sched_debug.cpu.nr_running.stddev
   3939697          -100.0%       1104        sched_debug.cpu.nr_switches.avg
   4197321 ±  2%     -99.7%      14247 ±  6%  sched_debug.cpu.nr_switches.max
   3722568          -100.0%     288.33 ±  6%  sched_debug.cpu.nr_switches.min
     82128 ±  7%     -98.1%       1545 ±  7%  sched_debug.cpu.nr_switches.stddev
      1.11 ±  8%     -99.7%       0.00 ± 82%  sched_debug.cpu.nr_uninterruptible.avg
    270.50 ± 25%     -77.6%      60.67 ± 61%  sched_debug.cpu.nr_uninterruptible.max
   -235.25           -97.2%      -6.50        sched_debug.cpu.nr_uninterruptible.min
     78.47 ±  6%     -91.2%       6.88 ± 24%  sched_debug.cpu.nr_uninterruptible.stddev
    319235            -8.7%     291430        sched_debug.cpu_clk
    318168            -8.7%     290363        sched_debug.ktime
    321487            -8.7%     293672        sched_debug.sched_clk
      1.54 ±  5%     -22.6%       1.19 ±  7%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
     54.39           -63.7%      19.74 ±  6%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.anon_pipe_write.vfs_write.ksys_write.do_syscall_64
      3.81 ±  4%     -35.1%       2.48 ±  6%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     24.23 ±219%     -99.7%       0.06 ± 85%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.irqentry_exit.asm_exc_page_fault.[unknown]
     69.40 ± 16%     -73.3%      18.54 ± 15%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.[unknown].create_worker
     74.00 ± 54%     -68.6%      23.25 ± 27%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.sender.create_worker
     77.72 ± 14%     -72.7%      21.25 ± 11%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt._copy_from_iter
     39.70 ±  7%     -64.1%      14.26 ±  9%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt._raw_spin_unlock_irqrestore
      0.03 ±100%   +6609.0%       1.86 ±121%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.anon_pipe_read
     63.06 ±  7%     -69.0%      19.58 ± 13%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.anon_pipe_write
     78.10 ± 62%     -72.0%      21.89 ± 52%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.copy_page_from_iter
     82.16 ± 12%     -77.1%      18.78 ±  7%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.do_syscall_64
     56.31 ± 30%     -67.9%      18.08 ± 33%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.fdget_pos
     80.35 ± 47%     -78.7%      17.13 ± 33%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.ksys_write
     67.38 ± 14%     -70.2%      20.10 ± 16%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.mutex_lock
     64.34 ±  4%     -67.1%      21.15 ± 10%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.mutex_unlock
      0.02 ±121%   +9245.7%       2.15 ± 70%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.shmem_add_to_page_cache
     86.89 ± 23%     -74.5%      22.16 ± 24%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.vfs_write
     90.32 ± 34%     -73.5%      23.91 ± 59%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.x64_sys_call
      2.89 ± 76%    +971.7%      30.96 ± 85%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.__mod_memcg_state.__memcg_kmem_charge_page.__alloc_frozen_pages_noprof
     68.18 ± 40%     -74.7%      17.27 ± 35%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.__mutex_lock.constprop.0
     43.57 ± 36%     -55.6%      19.34 ± 23%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.__mutex_unlock_slowpath.isra.0
      0.01 ±128%   +3576.1%       0.28 ± 74%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.cpu_stop_queue_work.stop_one_cpu.sched_exec
     41.47 ±  8%     -59.8%      16.66 ±  7%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.schedule_preempt_disabled.__mutex_lock.constprop.0
      0.06 ± 35%    +102.2%       0.13 ±  9%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      3626 ± 13%     -52.5%       1721 ± 13%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.anon_pipe_write.vfs_write.ksys_write.do_syscall_64
      4330 ±  9%     -57.7%       1830 ± 10%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    168.52 ±220%     -99.8%       0.26 ± 96%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.irqentry_exit.asm_exc_page_fault.[unknown]
      2126 ± 21%     -61.5%     819.41 ± 26%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.[unknown].create_worker
      0.04 ±223%    +542.6%       0.29 ± 86%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.read@plt.create_worker
      1301 ± 35%     -48.8%     666.65 ± 50%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.sender.create_worker
      2036 ± 25%     -54.2%     932.26 ± 39%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt._copy_from_iter
      3591 ±  6%     -63.6%       1305 ± 20%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt._raw_spin_unlock_irqrestore
      0.16 ± 83%  +56923.2%      91.62 ±132%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.anon_pipe_read
      2311 ± 18%     -59.5%     937.02 ± 14%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.anon_pipe_write
      2635 ± 23%     -59.6%       1065 ± 27%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.do_syscall_64
      1507 ± 48%     -59.3%     613.95 ± 21%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.fdget_pos
      1050 ± 54%     -61.1%     408.92 ± 15%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.ksys_write
      2393 ± 16%     -63.0%     885.84 ± 18%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.mutex_lock
      2230 ± 19%     -55.2%     998.68 ± 23%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.mutex_unlock
      0.59 ±220%   +1084.4%       6.94 ± 65%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.rmqueue
      0.03 ±116%  +12326.5%       3.75 ± 78%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.shmem_add_to_page_cache
      0.38 ± 52%   +1097.7%       4.53 ± 59%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.vfs_read
      2069 ± 16%     -65.1%     722.31 ± 36%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.vfs_write
      1441 ± 37%     -68.2%     458.04 ± 55%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.x64_sys_call
      1338 ± 14%     -59.8%     537.56 ± 17%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.__mutex_lock.constprop.0
      1127 ± 21%     -41.1%     664.29 ± 31%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.__mutex_unlock_slowpath.isra.0
      0.02 ±124%   +8502.8%       2.02 ± 65%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.cpu_stop_queue_work.stop_one_cpu.sched_exec
      3864 ±  7%     -60.1%       1542 ±  9%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.schedule_preempt_disabled.__mutex_lock.constprop.0
      2.48 ±  5%     -27.9%       1.79 ±  6%  perf-sched.total_sch_delay.average.ms
      4417 ±  8%     -49.6%       2224 ± 23%  perf-sched.total_sch_delay.max.ms
      7.51 ±  5%     -24.0%       5.71 ±  6%  perf-sched.total_wait_and_delay.average.ms
   4552783 ± 11%     +38.4%    6301153 ±  6%  perf-sched.total_wait_and_delay.count.ms
      8836 ±  8%     -39.8%       5318 ±  5%  perf-sched.total_wait_and_delay.max.ms
      5.04 ±  4%     -22.1%       3.92 ±  5%  perf-sched.total_wait_time.average.ms
      4.85 ±  5%     -27.2%       3.53 ±  6%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
    157.01 ±  2%     -57.2%      67.21 ±  6%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.anon_pipe_write.vfs_write.ksys_write.do_syscall_64
     11.02 ±  4%     -24.7%       8.29 ±  5%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    188.42 ± 11%     -66.0%      64.13 ± 11%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.[unknown].create_worker
    206.19 ± 38%     -60.3%      81.92 ± 16%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.sender.create_worker
    247.17 ± 73%     -70.7%      72.34 ± 57%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.write.create_worker
    224.56 ± 13%     -67.9%      72.18 ±  5%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt._copy_from_iter
    114.36 ±  7%     -58.1%      47.96 ±  7%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt._raw_spin_unlock_irqrestore
    186.04 ±  9%     -63.2%      68.45 ± 11%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.anon_pipe_write
    238.14 ± 40%     -67.0%      78.55 ± 41%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.copy_page_from_iter
    235.92 ±  8%     -73.8%      61.87 ±  7%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.do_syscall_64
    160.80 ± 26%     -61.1%      62.61 ± 22%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.fdget_pos
    203.38 ± 40%     -67.8%      65.50 ± 17%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.ksys_write
    197.00 ± 13%     -66.0%      67.05 ± 12%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.mutex_lock
    190.45 ±  8%     -62.5%      71.37 ±  9%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.mutex_unlock
    227.71 ± 17%     -68.0%      72.90 ± 17%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.vfs_write
    267.92 ± 39%     -71.4%      76.62 ± 38%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.x64_sys_call
    201.24 ± 25%     -69.0%      62.47 ± 28%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.__mutex_lock.constprop.0
    142.35 ± 18%     -49.9%      71.26 ± 19%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.__mutex_unlock_slowpath.isra.0
    118.64 ±  8%     -52.2%      56.74 ±  6%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.schedule_preempt_disabled.__mutex_lock.constprop.0
   3572433 ± 11%     +43.3%    5118283 ±  5%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
     15190 ±  8%    +434.2%      81140 ±  5%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.anon_pipe_write.vfs_write.ksys_write.do_syscall_64
    352.50 ±  9%    +175.2%     970.17 ±  9%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.[unknown].create_worker
     67.83 ± 12%    +152.1%     171.00 ± 11%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.sender.create_worker
      9.33 ± 19%    +203.6%      28.33 ± 18%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.write.create_worker
      3.67 ± 64%    +168.2%       9.83 ± 21%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.write@plt.create_worker
    208.67 ±  9%    +178.4%     581.00 ±  7%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt._copy_from_iter
    643.83 ± 13%    +143.4%       1567 ±  8%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.anon_pipe_write
     35.83 ± 13%     +98.6%      71.17 ± 14%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.copy_page_from_iter
    499.17 ± 10%    +184.0%       1417 ±  6%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.do_syscall_64
    106.00 ± 11%    +133.8%     247.83 ±  3%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.fdget_pos
     23.50 ± 10%     +94.3%      45.67 ± 14%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.kill_fasync
     21.83 ± 21%    +175.6%      60.17 ±  9%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.ksys_write
    444.33 ± 11%    +183.9%       1261 ±  8%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.mutex_lock
    653.67 ± 15%    +168.2%       1753 ±  7%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.mutex_unlock
     20.33 ± 25%    +126.2%      46.00 ± 13%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.rw_verify_area
     12.83 ± 25%    +205.2%      39.17 ± 16%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.security_file_permission
    133.50 ± 11%    +108.5%     278.33 ±  4%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.vfs_write
     23.33 ± 16%    +160.0%      60.67 ± 17%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.x64_sys_call
      4.00 ± 81%    +208.3%      12.33 ± 38%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_thunk.__memcg_kmem_charge_page.__alloc_frozen_pages_noprof.alloc_pages_mpol
     61.67 ± 12%    +322.2%     260.33 ±  9%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_thunk.__mutex_lock.constprop.0
     92.33 ± 17%    +118.6%     201.83 ± 10%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_thunk.__mutex_unlock_slowpath.isra.0
    285.00 ±  4%     +73.6%     494.83 ± 19%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_thunk.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
     39.00 ± 16%    +173.5%     106.67 ±  7%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_thunk.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     13.83 ± 23%    +141.0%      33.33 ± 17%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_thunk.rmqueue.isra.0
     14647 ± 11%    +139.9%      35142 ±  7%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.schedule_preempt_disabled.__mutex_lock.constprop.0
    328.83 ±  9%    +116.8%     712.83 ± 16%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     88.33 ± 21%     +99.6%     176.33 ± 10%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      7513 ± 13%     -53.8%       3474 ± 12%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.anon_pipe_write.vfs_write.ksys_write.do_syscall_64
      8661 ±  9%     -56.6%       3755 ±  5%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      4278 ± 20%     -59.0%       1755 ± 21%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.[unknown].create_worker
      4467 ± 21%     -56.0%       1966 ± 34%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt._copy_from_iter
      7253 ±  7%     -62.8%       2701 ± 19%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt._raw_spin_unlock_irqrestore
      4884 ± 10%     -61.2%       1893 ± 14%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.anon_pipe_write
      2413 ± 50%     -49.1%       1228 ± 37%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.copy_page_from_iter
      5345 ± 22%     -59.8%       2146 ± 26%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.do_syscall_64
      3201 ± 43%     -60.5%       1266 ± 22%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.fdget_pos
      2186 ± 52%     -60.0%     875.10 ± 10%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.ksys_write
      4899 ± 14%     -62.3%       1848 ± 25%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.mutex_lock
      4939 ± 19%     -58.2%       2066 ± 20%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.mutex_unlock
      4143 ± 16%     -62.6%       1547 ± 33%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.vfs_write
      2928 ± 38%     -64.6%       1037 ± 43%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.x64_sys_call
      2989 ± 14%     -61.6%       1146 ± 18%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.__mutex_lock.constprop.0
      2362 ± 18%     -41.1%       1390 ± 33%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.__mutex_unlock_slowpath.isra.0
      7840 ±  6%     -59.8%       3150 ±  8%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.schedule_preempt_disabled.__mutex_lock.constprop.0
      3.30 ±  5%     -29.3%       2.34 ±  6%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
    102.62 ±  2%     -53.7%      47.48 ±  6%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.anon_pipe_write.vfs_write.ksys_write.do_syscall_64
      7.21 ±  4%     -19.3%       5.82 ±  5%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     24.23 ±219%     -99.8%       0.06 ± 81%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.irqentry_exit.asm_exc_page_fault.[unknown]
    119.02 ± 10%     -61.7%      45.59 ± 10%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.[unknown].create_worker
      0.13 ±192%   +6167.0%       8.22 ±210%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.read.create_worker
    132.19 ± 30%     -55.6%      58.67 ± 15%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.sender.create_worker
    172.30 ± 49%     -70.8%      50.29 ± 51%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.write.create_worker
    146.84 ± 13%     -65.3%      50.93 ±  4%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt._copy_from_iter
     74.66 ±  7%     -54.9%      33.69 ±  6%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt._raw_spin_unlock_irqrestore
      0.02 ± 98%   +5276.3%       1.17 ±122%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.anon_pipe_buf_release
      0.14 ± 45%   +1635.7%       2.43 ±113%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.anon_pipe_read
    122.98 ± 10%     -60.3%      48.87 ± 11%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.anon_pipe_write
    160.04 ± 37%     -64.6%      56.66 ± 38%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.copy_page_from_iter
    153.75 ±  7%     -72.0%      43.09 ±  8%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.do_syscall_64
    104.49 ± 24%     -57.4%      44.54 ± 18%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.fdget_pos
    123.03 ± 38%     -60.7%      48.36 ± 21%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.ksys_write
    129.62 ± 13%     -63.8%      46.95 ± 11%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.mutex_lock
    126.11 ± 11%     -60.2%      50.22 ±  8%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.mutex_unlock
      0.59 ±220%   +1292.3%       8.16 ± 60%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.rmqueue
      0.02 ±121%   +9245.7%       2.15 ± 70%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.shmem_add_to_page_cache
    140.83 ± 14%     -64.0%      50.74 ± 16%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.vfs_write
    177.60 ± 45%     -70.3%      52.71 ± 28%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.x64_sys_call
    133.06 ± 19%     -66.0%      45.20 ± 26%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.__mutex_lock.constprop.0
     98.78 ± 11%     -47.4%      51.92 ± 19%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.__mutex_unlock_slowpath.isra.0
      0.01 ±124%   +4969.7%       0.28 ± 74%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.cpu_stop_queue_work.stop_one_cpu.sched_exec
      0.14 ±160%  +1.7e+05%     235.65 ± 71%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0
     77.17 ±  7%     -48.1%      40.07 ±  6%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.schedule_preempt_disabled.__mutex_lock.constprop.0
      3988 ± 13%     -53.0%       1873 ±  8%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.anon_pipe_write.vfs_write.ksys_write.do_syscall_64
      4599 ±  9%     -57.5%       1954 ±  5%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    168.52 ±220%     -99.8%       0.26 ± 96%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.irqentry_exit.asm_exc_page_fault.[unknown]
      2441 ± 13%     -56.8%       1054 ± 26%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.[unknown].create_worker
      0.14 ±185%  +13467.9%      18.38 ±184%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.read.create_worker
      3.97 ±163%   +1582.2%      66.87 ±163%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.receiver.create_worker
      2596 ± 13%     -54.5%       1180 ± 29%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt._copy_from_iter
      3777 ± 11%     -60.1%       1508 ± 13%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt._raw_spin_unlock_irqrestore
      0.02 ± 98%  +17976.3%       3.95 ±154%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.anon_pipe_buf_release
      0.51 ± 74%  +19013.2%      97.35 ±123%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.anon_pipe_read
      2688 ± 11%     -58.6%       1114 ± 18%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.anon_pipe_write
      1453 ± 39%     -53.7%     672.87 ± 30%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.copy_page_from_iter
      2842 ± 17%     -60.4%       1126 ± 23%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.do_syscall_64
      1783 ± 34%     -59.0%     731.47 ± 14%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.fdget_pos
      0.03 ±139%    +501.3%       0.15 ± 65%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.finish_wait
      0.14 ±127%  +37794.7%      52.67 ±216%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.ksys_read
      2654 ± 11%     -59.4%       1078 ± 23%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.mutex_lock
      3018 ± 17%     -62.0%       1148 ± 14%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.mutex_unlock
      0.59 ±220%   +3865.7%      23.25 ± 72%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.rmqueue
      0.03 ±116%  +12326.5%       3.75 ± 78%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.shmem_add_to_page_cache
      0.87 ± 59%   +1143.0%      10.79 ±103%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.vfs_read
      2202 ± 20%     -59.8%     886.28 ± 26%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.vfs_write
      1631 ± 27%     -55.9%     719.97 ± 28%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.x64_sys_call
      1674 ± 19%     -53.0%     787.21 ± 29%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.__mutex_lock.constprop.0
      1462 ± 12%     -39.2%     889.31 ± 23%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.__mutex_unlock_slowpath.isra.0
      0.02 ±131%   +8819.1%       2.02 ± 65%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.cpu_stop_queue_work.stop_one_cpu.sched_exec
      1081 ± 33%     -47.5%     567.89 ± 27%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.rmqueue.isra.0
      0.40 ±145%  +2.5e+05%       1002 ± 57%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0
      4202 ±  7%     -60.3%       1670 ±  4%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.schedule_preempt_disabled.__mutex_lock.constprop.0



***************************************************************************************************

=========================================================================================
compiler/cpufreq_governor/ipc/iterations/kconfig/mode/nr_threads/rootfs/tbox_group/testcase:
  gcc-14/performance/pipe/8/x86_64-rhel-9.4/threads/100%/debian-13-x86_64-20250902.cgz/lkp-emr-2sp1/hackbench

commit: 
  fb1050ac8e ("sched/fair: Change the default cgroup_mode to concur")
  85570f10a4 ("sched/eevdf: Move to a single runqueue")

fb1050ac8e40aaa0 85570f10a4c61372c1d437365b9 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
   1871420           +81.6%    3398100        hackbench.throughput
   1697385 ±  7%     +91.6%    3251563        hackbench.throughput_avg
   1871420           +81.6%    3398100        hackbench.throughput_best
   1392548 ± 19%    +112.2%    2955455        hackbench.throughput_worst
    145.02 ±  7%     -47.1%      76.66        hackbench.time.elapsed_time
    145.02 ±  7%     -47.1%      76.66        hackbench.time.elapsed_time.max
 4.225e+08           -62.2%  1.595e+08 ±  3%  hackbench.time.involuntary_context_switches
    236680 ± 12%     -26.7%     173377        hackbench.time.minor_page_faults
     24461            -2.7%      23810        hackbench.time.percent_of_cpu_this_job_got
     32712 ±  7%     -51.2%      15956        hackbench.time.system_time
      2757 ±  5%     -16.6%       2299        hackbench.time.user_time
 1.606e+09           -64.8%  5.655e+08 ±  2%  hackbench.time.voluntary_context_switches
    278.32 ±  3%     -24.1%     211.19        uptime.boot
      4.34 ±  5%      +5.8       10.10 ± 23%  mpstat.cpu.all.idle%
     86.99            -9.4       77.55 ±  2%  mpstat.cpu.all.sys%
      7.58            +3.8       11.34 ±  2%  mpstat.cpu.all.usr%
      1198 ± 14%     +53.8%       1843 ±  8%  perf-c2c.DRAM.local
     50767 ± 17%     -48.5%      26153 ± 28%  perf-c2c.HITM.local
     76978 ± 18%     -37.3%      48264 ± 18%  perf-c2c.HITM.total
     44027 ± 51%     -64.8%      15505 ± 36%  numa-meminfo.node1.KReclaimable
     44027 ± 51%     -64.8%      15505 ± 36%  numa-meminfo.node1.SReclaimable
    652654 ±190%     -99.7%       1901 ± 36%  numa-meminfo.node2.Shmem
    633731 ± 17%     -37.5%     396304 ± 21%  numa-meminfo.node3.Mapped
      5.62 ±  5%    +109.6%      11.77 ± 21%  vmstat.cpu.id
   9101341 ±  4%     -31.3%    6250765 ±  3%  vmstat.memory.cache
      3628           +16.9%       4241 ±  2%  vmstat.procs.r
  13924473 ±  6%     -34.6%    9102079 ±  3%  vmstat.system.cs
    678861 ±  4%     -24.2%     514390 ±  3%  vmstat.system.in
 1.071e+08 ±  7%     +15.1%  1.233e+08        numa-numastat.node0.local_node
 1.072e+08 ±  7%     +15.1%  1.234e+08        numa-numastat.node0.numa_hit
 1.129e+08 ±  6%     +12.4%  1.269e+08        numa-numastat.node1.local_node
 1.129e+08 ±  6%     +12.4%   1.27e+08        numa-numastat.node1.numa_hit
 1.094e+08 ±  4%     +14.2%  1.249e+08        numa-numastat.node2.local_node
 1.095e+08 ±  4%     +14.1%   1.25e+08        numa-numastat.node2.numa_hit
 1.053e+08 ±  6%     +18.3%  1.246e+08        numa-numastat.node3.local_node
 1.054e+08 ±  6%     +18.3%  1.247e+08        numa-numastat.node3.numa_hit
  14242018 ±  4%     -34.1%    9379450 ±  3%  perf-stat.i.context-switches
    922027           -47.3%     485519 ±  3%  perf-stat.i.cpu-migrations
      7131           +34.4%       9588 ±  3%  perf-stat.i.minor-faults
      7131           +34.4%       9588 ±  3%  perf-stat.i.page-faults
  13900558 ±  5%     -33.4%    9263683 ±  3%  perf-stat.ps.context-switches
    892963           -46.4%     478493 ±  3%  perf-stat.ps.cpu-migrations
      6443 ±  2%     +41.5%       9117 ±  3%  perf-stat.ps.minor-faults
      6443 ±  2%     +41.5%       9117 ±  3%  perf-stat.ps.page-faults
      0.04 ± 31%      +0.0        0.07 ±  6%  turbostat.C1%
      0.40 ±  4%      +0.3        0.69 ±  2%  turbostat.C1E%
      3.72 ±  3%      +5.0        8.73 ± 29%  turbostat.C6%
      0.38 ±  2%     +72.6%       0.66 ±  3%  turbostat.CPU%c1
      3.45 ±  4%    +140.3%       8.29 ± 30%  turbostat.CPU%c6
      0.58 ±  3%     +56.3%       0.91        turbostat.IPC
 1.001e+08 ± 11%     -58.3%   41699720 ±  2%  turbostat.IRQ
  10161204 ±  4%     -66.6%    3390578        turbostat.NMI
     86.91 ± 19%     +32.6      119.50 ±  4%  turbostat.PKG_%
      0.15 ± 40%    +434.1%       0.78 ± 72%  turbostat.Pkg%pc2
 1.072e+08 ±  7%     +15.1%  1.234e+08        numa-vmstat.node0.numa_hit
 1.071e+08 ±  7%     +15.1%  1.233e+08        numa-vmstat.node0.numa_local
     11005 ± 51%     -64.8%       3877 ± 36%  numa-vmstat.node1.nr_slab_reclaimable
 1.129e+08 ±  6%     +12.4%   1.27e+08        numa-vmstat.node1.numa_hit
 1.129e+08 ±  6%     +12.4%  1.269e+08        numa-vmstat.node1.numa_local
    163253 ±190%     -99.7%     474.85 ± 36%  numa-vmstat.node2.nr_shmem
 1.095e+08 ±  4%     +14.1%   1.25e+08        numa-vmstat.node2.numa_hit
 1.094e+08 ±  4%     +14.2%  1.249e+08        numa-vmstat.node2.numa_local
    157977 ± 17%     -37.4%      98823 ± 20%  numa-vmstat.node3.nr_mapped
 1.054e+08 ±  6%     +18.3%  1.247e+08        numa-vmstat.node3.numa_hit
 1.053e+08 ±  6%     +18.3%  1.246e+08        numa-vmstat.node3.numa_local
   5735020 ±  6%     -50.5%    2837699 ±  6%  meminfo.Active
   5735020 ±  6%     -50.5%    2837699 ±  6%  meminfo.Active(anon)
    254314 ±  3%     -20.4%     202423        meminfo.AnonHugePages
    904650            -6.0%     850365        meminfo.AnonPages
   8907241 ±  4%     -31.9%    6064550 ±  3%  meminfo.Cached
   5937865 ±  6%     -48.7%    3044368 ±  6%  meminfo.Committed_AS
    169944            -5.1%     161237        meminfo.KReclaimable
    760932 ± 10%     -38.7%     466434 ± 12%  meminfo.Mapped
  15193853 ±  2%     -17.3%   12571108        meminfo.Memused
    169944            -5.1%     161237        meminfo.SReclaimable
   4835280 ±  8%     -58.8%    1992600 ±  9%  meminfo.Shmem
  15527429 ±  2%     -17.4%   12832541        meminfo.max_used_kB
   1434790 ±  6%     -50.5%     710570 ±  7%  proc-vmstat.nr_active_anon
    226329            -6.0%     212678        proc-vmstat.nr_anon_pages
   6173848            +1.1%    6239387        proc-vmstat.nr_dirty_background_threshold
  12362793            +1.1%   12494031        proc-vmstat.nr_dirty_threshold
   2227679 ±  4%     -31.9%    1517199 ±  3%  proc-vmstat.nr_file_pages
  62060084            +1.1%   62716435        proc-vmstat.nr_free_pages
  61782380            +1.1%   62455543        proc-vmstat.nr_free_pages_blocks
    190230 ± 10%     -38.4%     117086 ± 12%  proc-vmstat.nr_mapped
      4212            -3.4%       4067        proc-vmstat.nr_page_table_pages
   1209689 ±  8%     -58.7%     499212 ±  9%  proc-vmstat.nr_shmem
     42493            -5.1%      40312        proc-vmstat.nr_slab_reclaimable
   1434790 ±  6%     -50.5%     710570 ±  7%  proc-vmstat.nr_zone_active_anon
     76674 ± 21%     -38.4%      47234 ± 22%  proc-vmstat.numa_hint_faults
 4.351e+08           +14.9%  5.001e+08        proc-vmstat.numa_hit
 4.347e+08           +15.0%  4.997e+08        proc-vmstat.numa_local
     44719 ± 27%     -94.0%       2665 ±155%  proc-vmstat.numa_pages_migrated
    132483 ± 23%     -52.7%      62707 ± 48%  proc-vmstat.numa_pte_updates
 4.357e+08           +14.9%  5.006e+08        proc-vmstat.pgalloc_normal
   1103664 ±  5%     -20.0%     882849 ±  4%  proc-vmstat.pgfault
 4.333e+08           +15.2%   4.99e+08        proc-vmstat.pgfree
     44719 ± 27%     -94.0%       2665 ±155%  proc-vmstat.pgmigrate_success
     65035 ± 21%     -51.6%      31481        proc-vmstat.pgreuse
     55496           +25.7%      69740        sched_debug.cfs_rq:/.avg_vruntime.avg
     76951 ±  7%     +19.6%      92031 ±  4%  sched_debug.cfs_rq:/.avg_vruntime.max
     50037 ±  2%     +27.0%      63522        sched_debug.cfs_rq:/.avg_vruntime.min
    641.68 ± 93%  +10579.9%      68530        sched_debug.cfs_rq:/.left_deadline.avg
     37514 ± 28%    +122.0%      83277 ±  4%  sched_debug.cfs_rq:/.left_deadline.max
    641.66 ± 93%  +10577.4%      68512        sched_debug.cfs_rq:/.left_vruntime.avg
     37512 ± 28%    +121.9%      83259 ±  4%  sched_debug.cfs_rq:/.left_vruntime.max
    850228           -27.3%     618317        sched_debug.cfs_rq:/.load.avg
   2038057 ±  4%     -27.5%    1478438 ±  9%  sched_debug.cfs_rq:/.load.max
    286649 ± 16%     -38.8%     175462 ±  7%  sched_debug.cfs_rq:/.load.stddev
     27073 ±  5%     +41.2%      38238 ± 13%  sched_debug.cfs_rq:/.load_avg.max
      3525 ± 15%     +54.4%       5444 ± 18%  sched_debug.cfs_rq:/.load_avg.stddev
      0.67           -22.6%       0.52        sched_debug.cfs_rq:/.nr_queued.avg
    339.11           +51.0%     512.00        sched_debug.cfs_rq:/.removed.load_avg.max
     40.22 ± 28%     +62.1%      65.19 ±  9%  sched_debug.cfs_rq:/.removed.load_avg.stddev
    174.17 ±  2%     +49.9%     261.00        sched_debug.cfs_rq:/.removed.runnable_avg.max
     19.49 ± 26%     +60.0%      31.19 ±  9%  sched_debug.cfs_rq:/.removed.runnable_avg.stddev
    174.17 ±  2%     +49.7%     260.67        sched_debug.cfs_rq:/.removed.util_avg.max
     19.49 ± 26%     +59.8%      31.14 ±  9%  sched_debug.cfs_rq:/.removed.util_avg.stddev
    641.66 ± 93%  +10580.8%      68534        sched_debug.cfs_rq:/.right_vruntime.avg
     37512 ± 28%    +122.0%      83282 ±  4%  sched_debug.cfs_rq:/.right_vruntime.max
      3303 ± 16%     +66.0%       5485 ±  9%  sched_debug.cfs_rq:/.runnable_avg.min
 1.599e+09 ±108%   -4513.5% -7.059e+10        sched_debug.cfs_rq:/.sum_w_vruntime.avg
  3.43e+11 ± 64%    +251.1%  1.204e+12 ± 42%  sched_debug.cfs_rq:/.sum_w_vruntime.max
-3.553e+10         +5192.9%  -1.88e+12        sched_debug.cfs_rq:/.sum_w_vruntime.min
 2.512e+10 ± 52%   +2145.4%   5.64e+11 ±  7%  sched_debug.cfs_rq:/.sum_w_vruntime.stddev
      7075 ± 77%   +9938.8%     710341 ±  5%  sched_debug.cfs_rq:/.sum_weight.avg
    594141 ± 31%    +268.0%    2186729 ± 10%  sched_debug.cfs_rq:/.sum_weight.max
     54876 ± 41%    +539.0%     350683 ±  8%  sched_debug.cfs_rq:/.sum_weight.stddev
    690.13 ±  3%     -18.8%     560.69        sched_debug.cfs_rq:/.util_avg.avg
      1343 ±  6%      -7.8%       1238 ±  3%  sched_debug.cfs_rq:/.util_avg.max
    197.06 ± 10%     +54.7%     304.92 ±  8%  sched_debug.cfs_rq:/.util_avg.min
     55496           +25.7%      69740        sched_debug.cfs_rq:/.zero_vruntime.avg
     76951 ±  7%     +19.6%      92031 ±  4%  sched_debug.cfs_rq:/.zero_vruntime.max
     50037 ±  2%     +27.0%      63522        sched_debug.cfs_rq:/.zero_vruntime.min
    548532 ±  2%     +25.0%     685881 ±  4%  sched_debug.cpu.avg_idle.avg
    194377           -16.6%     162123        sched_debug.cpu.clock.avg
    195317           -16.8%     162570        sched_debug.cpu.clock.max
    193308           -16.4%     161669        sched_debug.cpu.clock.min
    593.13 ± 21%     -55.9%     261.85 ± 10%  sched_debug.cpu.clock.stddev
    193659           -16.5%     161700        sched_debug.cpu.clock_task.avg
    194674           -16.7%     162225        sched_debug.cpu.clock_task.max
    180455           -17.5%     148958        sched_debug.cpu.clock_task.min
      1091 ±  8%     -19.7%     875.76        sched_debug.cpu.clock_task.stddev
     44389 ±  5%     -10.3%      39817        sched_debug.cpu.curr->pid.avg
     51310 ±  3%      -9.4%      46507        sched_debug.cpu.curr->pid.max
      0.00 ± 15%     -58.0%       0.00 ± 12%  sched_debug.cpu.next_balance.stddev
   3532119 ±  2%     -68.0%    1130902        sched_debug.cpu.nr_switches.avg
   4034565 ±  4%     -66.3%    1360534 ±  5%  sched_debug.cpu.nr_switches.max
   2971922 ±  5%     -68.3%     942261 ±  2%  sched_debug.cpu.nr_switches.min
    254464 ± 27%     -56.4%     111034 ± 33%  sched_debug.cpu.nr_switches.stddev
    339.83 ± 21%     -44.1%     189.92 ± 15%  sched_debug.cpu.nr_uninterruptible.max
   -264.06           -36.9%    -166.75        sched_debug.cpu.nr_uninterruptible.min
     95.65 ±  3%     -40.4%      57.02 ±  5%  sched_debug.cpu.nr_uninterruptible.stddev
    193273           -16.4%     161663        sched_debug.cpu_clk
    192222           -16.4%     160612        sched_debug.ktime
      0.00          -100.0%       0.00        sched_debug.rt_rq:.rt_nr_running.avg
      0.33          -100.0%       0.00        sched_debug.rt_rq:.rt_nr_running.max
      0.02          -100.0%       0.00        sched_debug.rt_rq:.rt_nr_running.stddev
    194692           -16.2%     163087        sched_debug.sched_clk
      1.19 ± 53%    +292.9%       4.67 ±  4%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
      1.20 ± 52%    +302.3%       4.82 ±  5%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.01 ±223%    +1e+05%       6.48 ±112%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__mutex_unlock_slowpath
      0.02 ±223%   +3932.6%       0.97 ±184%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt._find_first_bit
     13.53 ± 56%    +128.0%      30.84 ±  9%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt._raw_spin_unlock_irqrestore
      0.06 ±114%  +61646.9%      38.18 ±221%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.anon_pipe_read
      0.84 ±151%    +739.0%       7.03 ± 51%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.exit_to_user_mode_loop
      2.33 ±161%   +1275.5%      31.99 ± 90%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.page_counter_try_charge
      2.22 ± 51%  +20629.8%     459.93 ±200%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.shmem_write_end
      2.59 ±110%   +1463.4%      40.52 ± 68%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.try_charge_memcg
     13.80 ± 80%    +168.2%      37.03 ± 37%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.x64_sys_call
      0.01 ±141%  +1.1e+06%      59.85 ±101%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.uncharge_batch.__mem_cgroup_uncharge.__folio_put
     10.50 ±136%    +414.6%      54.04 ± 53%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      0.27 ± 76%   +1241.0%       3.56 ± 47%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0
      0.29 ±118%  +23856.8%      70.15 ±220%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.schedule_timeout.wait_for_completion_state.kernel_clone.__x64_sys_vfork
      0.26 ±173%   +1141.2%       3.25 ± 94%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      2189 ± 52%    +125.3%       4931 ±  8%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
      2442 ± 51%    +111.5%       5165 ± 10%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.anon_pipe_write.vfs_write.ksys_write.do_syscall_64
      3132 ± 45%     +74.5%       5465 ± 11%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.01 ±223%  +1.7e+05%      10.58 ±113%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__mutex_unlock_slowpath
      0.02 ±223%  +10288.2%       2.49 ±196%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt._find_first_bit
      7.47 ±121%    +377.2%      35.67 ± 36%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.exit_to_user_mode_loop
      1097 ± 88%    +150.0%       2743 ± 44%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.fdget_pos
      4.45 ±131%  +28632.4%       1278 ± 84%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.page_counter_try_charge
    146.98 ± 79%   +1257.6%       1995 ± 63%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.rw_verify_area
     16.83 ± 75%   +4038.9%     696.70 ±136%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.shmem_write_end
      7.42 ±117%  +18401.4%       1371 ± 58%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.try_charge_memcg
    262.28 ±103%    +566.2%       1747 ± 30%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.x64_sys_call
      0.01 ±141%  +1.6e+07%     876.83 ±108%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.uncharge_batch.__mem_cgroup_uncharge.__folio_put
     38.35 ±155%   +1173.8%     488.57 ± 51%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      2510 ± 51%     +86.7%       4685 ± 17%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.schedule_preempt_disabled.__mutex_lock.constprop.0
    154.57 ±212%   +1216.8%       2035 ± 90%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1.40 ± 56%    +326.0%       5.95 ±  4%  perf-sched.total_sch_delay.average.ms
      3345 ± 45%     +68.8%       5647 ±  7%  perf-sched.total_sch_delay.max.ms
      4.82 ± 56%    +318.2%      20.16 ±  4%  perf-sched.total_wait_and_delay.average.ms
      6266 ± 45%     +80.5%      11312 ±  7%  perf-sched.total_wait_and_delay.max.ms
      3.42 ± 56%    +315.1%      14.21 ±  5%  perf-sched.total_wait_time.average.ms
      3.94 ± 53%    +248.5%      13.73 ±  5%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
      3.75 ± 55%    +405.8%      18.98 ±  5%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     43.16 ± 59%    +177.6%     119.83 ±  8%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt._raw_spin_unlock_irqrestore
     84.56 ± 71%     +71.7%     145.14 ± 32%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.fdget_pos
      5.89 ±145%   +1912.8%     118.47 ± 50%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.page_counter_try_charge
      6.74 ±165%   +1954.4%     138.49 ± 48%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.try_charge_memcg
     73.68 ± 77%     +94.4%     143.25 ± 29%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.x64_sys_call
     30.76 ±112%    +343.1%     136.28 ± 43%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
     43.68 ± 56%    +209.9%     135.36 ± 21%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     21353 ± 53%    +542.6%     137212 ± 14%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.anon_pipe_write.vfs_write.ksys_write.do_syscall_64
    473.83 ± 46%    +230.4%       1565 ± 12%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
     88.17 ± 50%    +231.4%     292.17 ± 13%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.sender.[unknown]
     17.33 ± 48%    +239.4%      58.83 ± 18%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__fget_files
    289.67 ± 46%    +295.7%       1146 ± 17%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt._copy_from_iter
    435.33 ± 48%     +79.5%     781.33 ± 11%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.anon_pipe_write
     41.83 ± 50%    +269.3%     154.50 ± 16%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.copy_page_from_iter
    500.83 ± 47%    +296.3%       1984 ± 15%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.do_syscall_64
     53.50 ± 45%    +186.0%     153.00 ± 16%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.fdget_pos
      9.83 ± 63%    +215.3%      31.00 ± 15%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.fput
     18.17 ± 48%    +133.9%      42.50 ± 13%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.kill_fasync
     37.17 ± 52%    +243.9%     127.83 ± 11%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.ksys_write
    260.67 ± 48%    +190.7%     757.67 ± 13%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.mutex_lock
      1.17 ±159%   +5957.1%      70.67 ± 26%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.page_counter_try_charge
     22.50 ± 46%    +305.9%      91.33 ± 32%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.rw_verify_area
     17.00 ± 52%    +289.2%      66.17 ± 16%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.security_file_permission
      1.67 ±157%   +4200.0%      71.67 ± 33%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.try_charge_memcg
    172.67 ± 47%    +235.8%     579.83 ± 13%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.vfs_write
     27.83 ± 50%    +257.5%      99.50 ± 16%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.x64_sys_call
    538.17 ± 47%    +105.1%       1103 ± 12%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_thunk.__fget_files.fdget_pos.ksys_write
     48.67 ± 50%    +261.6%     176.00 ± 13%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_thunk.__mutex_unlock_slowpath.isra.0
     46.33 ± 51%    +286.7%     179.17 ± 17%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_thunk.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    145.50 ± 47%    +188.0%     419.00 ± 15%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_thunk.fput.ksys_write.do_syscall_64
     17.50 ± 52%    +293.3%      68.83 ± 17%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_thunk.rmqueue.isra.0
      3.00 ± 94%    +322.2%      12.67 ± 25%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
     10772 ± 49%    +345.3%      47965 ± 15%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.schedule_preempt_disabled.__mutex_lock.constprop.0
      4545 ± 50%    +117.5%       9888 ±  8%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
      4934 ± 51%    +113.4%      10531 ±  8%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.anon_pipe_write.vfs_write.ksys_write.do_syscall_64
      6265 ± 45%     +75.4%      10991 ± 10%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      2207 ± 87%    +149.1%       5496 ± 43%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.fdget_pos
    632.19 ±124%    +311.1%       2598 ± 72%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.kill_fasync
     11.99 ±141%  +26311.2%       3166 ± 48%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.page_counter_try_charge
    695.78 ±104%    +483.6%       4060 ± 61%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.rw_verify_area
     20.13 ±146%  +15299.3%       3099 ± 38%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.try_charge_memcg
    106.77 ±120%    +881.3%       1047 ± 48%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      5035 ± 51%     +92.4%       9689 ± 16%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.schedule_preempt_disabled.__mutex_lock.constprop.0
      2.75 ± 53%    +229.3%       9.06 ±  5%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
      2.38 ± 46%  +13296.6%     318.82 ±100%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.do_task_dead.do_exit.__x64_sys_exit.x64_sys_call
      2.56 ± 57%    +454.3%      14.17 ±  5%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     29.64 ± 60%    +200.3%      88.99 ±  8%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt._raw_spin_unlock_irqrestore
      1.13 ±154%    +536.6%       7.20 ± 50%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.exit_to_user_mode_loop
     54.00 ± 67%     +88.0%     101.51 ± 28%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.fdget_pos
     36.27 ±107%    +186.3%     103.85 ± 68%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.kill_fasync
      4.36 ±116%   +1881.6%      86.49 ± 40%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.page_counter_try_charge
      2.22 ± 51%  +20629.8%     459.93 ±200%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.shmem_write_end
      5.62 ±175%   +1644.3%      97.96 ± 42%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.try_charge_memcg
      0.01 ±141%  +1.2e+06%      66.66 ±104%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.uncharge_batch.__mem_cgroup_uncharge.__folio_put
     20.60 ±100%    +299.1%      82.23 ± 38%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
     27.53 ± 55%    +263.1%      99.96 ± 19%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      8.89 ±182%   +1670.6%     157.45 ±117%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.schedule_timeout.wait_for_completion_state.kernel_clone.__x64_sys_vfork
      2913 ± 50%     +70.4%       4963 ±  8%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
      2586 ± 50%    +119.0%       5662 ±  5%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.anon_pipe_write.vfs_write.ksys_write.do_syscall_64
    244.89 ± 49%    +622.8%       1769 ± 93%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.do_task_dead.do_exit.__x64_sys_exit.x64_sys_call
      3157 ± 45%     +79.4%       5664 ±  6%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      2117 ± 53%     +82.6%       3866 ± 19%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
      2697 ± 48%     +66.8%       4497 ±  8%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt._raw_spin_unlock_irqrestore
      1291 ± 77%    +133.0%       3008 ± 31%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.copy_page_from_iter
      1992 ± 61%     +87.5%       3737 ± 14%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.do_syscall_64
      9.93 ±117%    +259.1%      35.67 ± 36%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.exit_to_user_mode_loop
      1153 ± 80%    +155.3%       2945 ± 33%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.fdget_pos
     10.82 ±124%  +19420.1%       2112 ± 26%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.page_counter_try_charge
    573.32 ±130%    +342.1%       2534 ± 43%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.rw_verify_area
     16.83 ± 75%   +4038.9%     696.70 ±136%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.shmem_write_end
     16.57 ±161%  +11513.1%       1924 ± 27%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.try_charge_memcg
      2366 ± 53%     +66.6%       3943 ± 21%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.__fget_files.fdget_pos.ksys_write
      0.01 ±141%  +1.7e+07%     882.25 ±108%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.uncharge_batch.__mem_cgroup_uncharge.__folio_put
     68.77 ±110%    +713.2%     559.18 ± 46%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      2602 ± 51%     +99.0%       5179 ± 10%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.schedule_preempt_disabled.__mutex_lock.constprop.0
     36.39 ±  2%     -36.4        0.00        perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
     30.46 ±  2%     -30.5        0.00        perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
     28.38 ±  3%     -28.4        0.00        perf-profile.calltrace.cycles-pp.anon_pipe_write.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
     25.16 ±  2%     -25.2        0.00        perf-profile.calltrace.cycles-pp.__switch_to
     66.86           -23.7       43.13 ±  6%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
     65.75           -22.7       43.08 ±  6%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
     23.13           -19.9        3.22 ± 25%  perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
     18.25 ±  3%     -18.2        0.00        perf-profile.calltrace.cycles-pp.__wake_up_sync_key.anon_pipe_write.vfs_write.ksys_write.do_syscall_64
     18.16 ±  3%     -18.2        0.00        perf-profile.calltrace.cycles-pp.__wake_up_common.__wake_up_sync_key.anon_pipe_write.vfs_write.ksys_write
     18.02 ±  2%     -18.0        0.00        perf-profile.calltrace.cycles-pp.autoremove_wake_function.__wake_up_common.__wake_up_sync_key.anon_pipe_write.vfs_write
     17.95 ±  2%     -17.9        0.00        perf-profile.calltrace.cycles-pp.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_sync_key.anon_pipe_write
     16.16 ±  3%     -16.2        0.00        perf-profile.calltrace.cycles-pp.anon_pipe_read.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
     18.29 ±  2%     -15.2        3.08 ± 24%  perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      9.32            -9.3        0.00        perf-profile.calltrace.cycles-pp.raw_spin_rq_lock_nested.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_sync_key
      9.30            -9.3        0.00        perf-profile.calltrace.cycles-pp._raw_spin_lock.raw_spin_rq_lock_nested.try_to_wake_up.autoremove_wake_function.__wake_up_common
      9.19            -9.2        0.00        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.raw_spin_rq_lock_nested.try_to_wake_up.autoremove_wake_function
      7.64 ±  7%      -7.6        0.00        perf-profile.calltrace.cycles-pp.schedule.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
      7.57 ±  7%      -7.6        0.00        perf-profile.calltrace.cycles-pp.__schedule.schedule.anon_pipe_read.vfs_read.ksys_read
      0.00            +0.8        0.77 ± 19%  perf-profile.calltrace.cycles-pp.anon_vma_fork.dup_mmap.dup_mm.copy_process.kernel_clone
      0.00            +0.8        0.79 ± 21%  perf-profile.calltrace.cycles-pp.setlocale
      0.00            +1.0        0.99 ± 12%  perf-profile.calltrace.cycles-pp.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +1.0        0.99 ± 12%  perf-profile.calltrace.cycles-pp.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +1.0        1.01 ± 33%  perf-profile.calltrace.cycles-pp.__irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
      0.00            +1.0        1.01 ± 14%  perf-profile.calltrace.cycles-pp.kthread.ret_from_fork.ret_from_fork_asm
      0.00            +1.0        1.01 ± 14%  perf-profile.calltrace.cycles-pp.ret_from_fork.ret_from_fork_asm
      0.00            +1.0        1.01 ± 14%  perf-profile.calltrace.cycles-pp.ret_from_fork_asm
      0.00            +1.1        1.06 ± 29%  perf-profile.calltrace.cycles-pp.__zap_vma_range.unmap_vmas.exit_mmap.__mmput.exit_mm
      0.00            +1.1        1.06 ± 29%  perf-profile.calltrace.cycles-pp.unmap_vmas.exit_mmap.__mmput.exit_mm.do_exit
      0.00            +1.1        1.09 ± 35%  perf-profile.calltrace.cycles-pp.zap_pte_range.zap_pmd_range.__zap_vma_range.unmap_vmas.exit_mmap
      0.00            +1.2        1.16 ± 11%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.record__pushfn.perf_mmap__push.record__mmap_read_evlist
      0.00            +1.2        1.16 ± 11%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.record__pushfn.perf_mmap__push.record__mmap_read_evlist.cmd_record
      0.00            +1.2        1.16 ± 11%  perf-profile.calltrace.cycles-pp.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write.do_syscall_64
      0.00            +1.2        1.16 ± 11%  perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.record__pushfn.perf_mmap__push
      0.00            +1.2        1.16 ± 11%  perf-profile.calltrace.cycles-pp.record__pushfn.perf_mmap__push.record__mmap_read_evlist.cmd_record.handle_internal_command
      0.00            +1.2        1.16 ± 11%  perf-profile.calltrace.cycles-pp.shmem_file_write_iter.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +1.2        1.16 ± 11%  perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.record__pushfn
      0.00            +1.2        1.18 ± 40%  perf-profile.calltrace.cycles-pp.zap_pmd_range.__zap_vma_range.unmap_vmas.exit_mmap.__mmput
      0.00            +1.2        1.22 ± 43%  perf-profile.calltrace.cycles-pp.intel_idle_xstate.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      0.00            +1.2        1.24 ± 11%  perf-profile.calltrace.cycles-pp.perf_mmap__push.record__mmap_read_evlist.cmd_record.handle_internal_command.main
      0.00            +1.2        1.24 ± 11%  perf-profile.calltrace.cycles-pp.record__mmap_read_evlist.cmd_record.handle_internal_command.main
      0.00            +1.3        1.26 ± 24%  perf-profile.calltrace.cycles-pp.__mmap_region.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64
      0.00            +1.3        1.27 ± 39%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
      0.00            +1.3        1.27 ± 39%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
      0.00            +1.3        1.28 ± 31%  perf-profile.calltrace.cycles-pp.mm_init.dup_mm.copy_process.kernel_clone.__do_sys_clone
      0.00            +1.3        1.34 ± 23%  perf-profile.calltrace.cycles-pp._nohz_idle_balance.handle_softirqs.do_softirq.flush_smp_call_function_queue.do_idle
      0.00            +1.4        1.36 ± 21%  perf-profile.calltrace.cycles-pp.handle_softirqs.do_softirq.flush_smp_call_function_queue.do_idle.cpu_startup_entry
      0.00            +1.4        1.38 ± 34%  perf-profile.calltrace.cycles-pp.lookup_open.open_last_lookups.path_openat.do_file_open.do_sys_openat2
      0.00            +1.4        1.42 ± 35%  perf-profile.calltrace.cycles-pp.mm_init.alloc_bprm.do_execveat_common.__x64_sys_execve.do_syscall_64
      0.00            +1.4        1.42 ± 24%  perf-profile.calltrace.cycles-pp.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +1.5        1.54 ± 30%  perf-profile.calltrace.cycles-pp.alloc_bprm.do_execveat_common.__x64_sys_execve.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +1.6        1.56 ± 21%  perf-profile.calltrace.cycles-pp.cmd_record.handle_internal_command.main
      0.00            +1.6        1.58 ± 23%  perf-profile.calltrace.cycles-pp.handle_internal_command.main
      0.00            +1.6        1.58 ± 23%  perf-profile.calltrace.cycles-pp.main
      0.00            +1.7        1.66 ± 25%  perf-profile.calltrace.cycles-pp.exit_mmap.__mmput.setup_new_exec.load_elf_binary.exec_binprm
      0.00            +1.7        1.68 ± 25%  perf-profile.calltrace.cycles-pp.__mmput.setup_new_exec.load_elf_binary.exec_binprm.bprm_execve
      0.00            +1.7        1.73 ± 17%  perf-profile.calltrace.cycles-pp.dup_mmap.dup_mm.copy_process.kernel_clone.__do_sys_clone
      0.00            +1.9        1.93 ± 32%  perf-profile.calltrace.cycles-pp.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.00            +1.9        1.94 ± 34%  perf-profile.calltrace.cycles-pp.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.00            +2.0        2.01 ± 18%  perf-profile.calltrace.cycles-pp.setup_new_exec.load_elf_binary.exec_binprm.bprm_execve.do_execveat_common
      0.00            +2.2        2.22 ± 34%  perf-profile.calltrace.cycles-pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.00            +2.2        2.23 ± 17%  perf-profile.calltrace.cycles-pp.__mmput.exit_mm.do_exit.do_group_exit.__x64_sys_exit_group
      0.00            +2.2        2.23 ± 17%  perf-profile.calltrace.cycles-pp.exit_mm.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
      0.00            +2.3        2.26 ± 32%  perf-profile.calltrace.cycles-pp.exc_page_fault.asm_exc_page_fault
      0.00            +2.4        2.37 ± 38%  perf-profile.calltrace.cycles-pp.proc_single_show.seq_read_iter.seq_read.vfs_read.ksys_read
      0.00            +2.4        2.44 ± 32%  perf-profile.calltrace.cycles-pp.open_last_lookups.path_openat.do_file_open.do_sys_openat2.__x64_sys_openat
      0.00            +2.5        2.45 ± 21%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      0.00            +2.6        2.60 ± 36%  perf-profile.calltrace.cycles-pp.seq_read.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +2.6        2.60 ± 36%  perf-profile.calltrace.cycles-pp.seq_read_iter.seq_read.vfs_read.ksys_read.do_syscall_64
      0.00            +2.7        2.72 ± 19%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      0.00            +2.8        2.80 ± 29%  perf-profile.calltrace.cycles-pp.asm_exc_page_fault
      0.00            +2.9        2.92 ± 17%  perf-profile.calltrace.cycles-pp.exit_mmap.__mmput.exit_mm.do_exit.do_group_exit
      0.00            +3.0        3.02 ± 15%  perf-profile.calltrace.cycles-pp.dup_mm.copy_process.kernel_clone.__do_sys_clone.do_syscall_64
      0.00            +3.3        3.32 ± 15%  perf-profile.calltrace.cycles-pp.load_elf_binary.exec_binprm.bprm_execve.do_execveat_common.__x64_sys_execve
      0.00            +3.4        3.37 ± 15%  perf-profile.calltrace.cycles-pp.exec_binprm.bprm_execve.do_execveat_common.__x64_sys_execve.do_syscall_64
      0.00            +3.4        3.38 ± 15%  perf-profile.calltrace.cycles-pp.copy_process.kernel_clone.__do_sys_clone.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +3.8        3.78 ± 11%  perf-profile.calltrace.cycles-pp.bprm_execve.do_execveat_common.__x64_sys_execve.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +4.0        4.02 ± 15%  perf-profile.calltrace.cycles-pp.__do_sys_clone.do_syscall_64.entry_SYSCALL_64_after_hwframe._Fork
      0.00            +4.0        4.02 ± 15%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe._Fork
      0.00            +4.0        4.02 ± 15%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe._Fork
      0.00            +4.0        4.02 ± 15%  perf-profile.calltrace.cycles-pp.kernel_clone.__do_sys_clone.do_syscall_64.entry_SYSCALL_64_after_hwframe._Fork
      0.00            +4.1        4.11 ± 32%  perf-profile.calltrace.cycles-pp.path_openat.do_file_open.do_sys_openat2.__x64_sys_openat.do_syscall_64
      0.00            +4.2        4.18 ± 32%  perf-profile.calltrace.cycles-pp.do_file_open.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +4.3        4.26 ± 28%  perf-profile.calltrace.cycles-pp.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +4.3        4.26 ± 28%  perf-profile.calltrace.cycles-pp.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +4.8        4.75 ± 12%  perf-profile.calltrace.cycles-pp._Fork
      0.00            +5.1        5.14 ± 16%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
      0.00            +5.2        5.24 ± 11%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
      0.00            +5.8        5.80 ± 11%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      0.00            +5.9        5.86 ± 12%  perf-profile.calltrace.cycles-pp.__x64_sys_execve.do_syscall_64.entry_SYSCALL_64_after_hwframe.execve
      0.00            +5.9        5.86 ± 12%  perf-profile.calltrace.cycles-pp.do_execveat_common.__x64_sys_execve.do_syscall_64.entry_SYSCALL_64_after_hwframe.execve
      0.00            +5.9        5.86 ± 12%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.execve
      0.00            +5.9        5.86 ± 12%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.execve
      0.00            +5.9        5.86 ± 12%  perf-profile.calltrace.cycles-pp.execve
      0.00            +7.0        7.01 ± 18%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      0.00            +7.0        7.03 ± 18%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.common_startup_64
      0.00            +7.0        7.03 ± 18%  perf-profile.calltrace.cycles-pp.start_secondary.common_startup_64
      0.00            +8.2        8.23 ± 10%  perf-profile.calltrace.cycles-pp.common_startup_64
      0.47 ± 44%      +9.2        9.65 ± 69%  perf-profile.calltrace.cycles-pp.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +9.6        9.62 ± 69%  perf-profile.calltrace.cycles-pp.__x64_sys_exit_group.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +9.6        9.62 ± 69%  perf-profile.calltrace.cycles-pp.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call.do_syscall_64
      0.00            +9.6        9.62 ± 69%  perf-profile.calltrace.cycles-pp.do_group_exit.__x64_sys_exit_group.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.57 ±  5%     +21.5       23.11 ± 27%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00           +22.1       22.14 ± 30%  perf-profile.calltrace.cycles-pp.__fput.task_work_run.do_exit.do_group_exit.get_signal
      0.00           +22.2       22.16 ± 30%  perf-profile.calltrace.cycles-pp.task_work_run.do_exit.do_group_exit.get_signal.arch_do_signal_or_restart
      0.00           +23.0       22.97 ± 28%  perf-profile.calltrace.cycles-pp.do_exit.do_group_exit.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop
      0.00           +23.0       22.97 ± 28%  perf-profile.calltrace.cycles-pp.do_group_exit.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64
      0.00           +23.0       22.99 ± 28%  perf-profile.calltrace.cycles-pp.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00           +23.0       23.03 ± 28%  perf-profile.calltrace.cycles-pp.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00           +27.7       27.72 ±  4%  perf-profile.calltrace.cycles-pp.event_function_call.perf_event_release_kernel.perf_release.__fput.task_work_run
      0.00           +27.7       27.72 ±  4%  perf-profile.calltrace.cycles-pp.smp_call_function_single.event_function_call.perf_event_release_kernel.perf_release.__fput
      0.00           +28.8       28.76 ±  6%  perf-profile.calltrace.cycles-pp.perf_event_release_kernel.perf_release.__fput.task_work_run.do_exit
      0.00           +28.8       28.76 ±  6%  perf-profile.calltrace.cycles-pp.perf_release.__fput.task_work_run.do_exit.do_group_exit
     36.71 ±  2%     -35.4        1.30 ± 11%  perf-profile.children.cycles-pp.ksys_write
     30.68 ±  3%     -29.4        1.30 ± 11%  perf-profile.children.cycles-pp.vfs_write
     28.56 ±  3%     -28.5        0.10 ±138%  perf-profile.children.cycles-pp.anon_pipe_write
     25.23 ±  2%     -25.2        0.03 ±223%  perf-profile.children.cycles-pp.__switch_to
     23.31           -20.1        3.22 ± 25%  perf-profile.children.cycles-pp.ksys_read
     18.32 ±  3%     -18.3        0.06 ±146%  perf-profile.children.cycles-pp.__wake_up_sync_key
     18.20 ±  3%     -18.1        0.06 ±146%  perf-profile.children.cycles-pp.__wake_up_common
     18.20 ±  3%     -18.0        0.16 ± 50%  perf-profile.children.cycles-pp.try_to_wake_up
     18.06 ±  2%     -18.0        0.06 ±146%  perf-profile.children.cycles-pp.autoremove_wake_function
     16.38 ±  3%     -16.2        0.19 ± 72%  perf-profile.children.cycles-pp.anon_pipe_read
     18.40 ±  2%     -15.3        3.10 ± 23%  perf-profile.children.cycles-pp.vfs_read
     11.59 ±  4%     -11.4        0.19 ±150%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
     11.32           -10.6        0.69 ± 43%  perf-profile.children.cycles-pp.raw_spin_rq_lock_nested
     67.10            -9.9       57.24 ±  5%  perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     11.63            -9.4        2.19 ± 20%  perf-profile.children.cycles-pp._raw_spin_lock
     66.27            -9.1       57.20 ±  5%  perf-profile.children.cycles-pp.do_syscall_64
      9.38 ±  6%      -8.6        0.82 ± 20%  perf-profile.children.cycles-pp.schedule
      9.41 ±  7%      -7.9        1.52 ± 17%  perf-profile.children.cycles-pp.__schedule
      7.95 ±  5%      -7.8        0.12 ±141%  perf-profile.children.cycles-pp.fdget_pos
      6.84 ±  5%      -6.8        0.06 ±153%  perf-profile.children.cycles-pp.__fget_files
      3.96 ±  3%      -3.9        0.05 ±102%  perf-profile.children.cycles-pp.ttwu_do_activate
      3.44 ±  3%      -3.3        0.10 ± 97%  perf-profile.children.cycles-pp.enqueue_task
      3.35 ±  3%      -3.2        0.10 ± 97%  perf-profile.children.cycles-pp.enqueue_task_fair
      3.14 ±  6%      -2.6        0.50 ± 50%  perf-profile.children.cycles-pp.mutex_unlock
      2.61 ±  7%      -2.5        0.10 ± 80%  perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      2.49 ±  4%      -2.4        0.08 ± 75%  perf-profile.children.cycles-pp.try_to_block_task
      2.45            -2.0        0.40 ± 60%  perf-profile.children.cycles-pp.mutex_lock
      1.94 ±  5%      -1.9        0.05 ±101%  perf-profile.children.cycles-pp.fput
      1.78 ±  2%      -1.7        0.08 ± 76%  perf-profile.children.cycles-pp.update_curr
      1.60 ±  5%      -1.5        0.07 ± 72%  perf-profile.children.cycles-pp.entry_SYSCALL_64
      1.34 ±  2%      -1.3        0.05 ±102%  perf-profile.children.cycles-pp.update_se
      2.11 ±  4%      -1.2        0.90 ± 16%  perf-profile.children.cycles-pp.__pick_next_task
      0.97 ±  7%      -0.9        0.05 ±100%  perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.97 ±  2%      -0.9        0.07 ±112%  perf-profile.children.cycles-pp.set_next_task_fair
      0.98 ±  5%      -0.9        0.09 ±110%  perf-profile.children.cycles-pp.arch_exit_to_user_mode_prepare
      0.86 ±  7%      -0.8        0.06 ±101%  perf-profile.children.cycles-pp.prandom_u32_state
      0.81 ± 35%      -0.8        0.05 ±102%  perf-profile.children.cycles-pp.select_task_rq
      0.64 ±  3%      -0.6        0.08 ±120%  perf-profile.children.cycles-pp.update_load_avg
      0.65 ± 20%      -0.6        0.10 ± 87%  perf-profile.children.cycles-pp.__mutex_lock
      1.07 ± 20%      -0.4        0.63 ± 28%  perf-profile.children.cycles-pp.finish_task_switch
      0.50 ± 11%      -0.4        0.12 ±118%  perf-profile.children.cycles-pp.task_tick_fair
      0.33 ± 23%      -0.2        0.10 ± 87%  perf-profile.children.cycles-pp.mutex_spin_on_owner
      0.21 ±  6%      -0.2        0.05 ±102%  perf-profile.children.cycles-pp.update_rq_clock
      0.21 ±  4%      -0.1        0.07 ±110%  perf-profile.children.cycles-pp.hrtimer_start_range_ns
      0.00            +0.1        0.11 ± 12%  perf-profile.children.cycles-pp.do_open_execat
      0.00            +0.1        0.11 ± 12%  perf-profile.children.cycles-pp.filp_close
      0.00            +0.1        0.11 ± 12%  perf-profile.children.cycles-pp.put_files_struct
      0.00            +0.1        0.13 ± 43%  perf-profile.children.cycles-pp.__folio_batch_add_and_move
      0.00            +0.2        0.16 ± 34%  perf-profile.children.cycles-pp.folio_batch_move_lru
      0.00            +0.2        0.16 ± 61%  perf-profile.children.cycles-pp.inode_permission
      0.00            +0.2        0.16 ± 36%  perf-profile.children.cycles-pp.__do_wait
      0.00            +0.2        0.18 ± 39%  perf-profile.children.cycles-pp.__free_one_page
      0.00            +0.2        0.19 ± 32%  perf-profile.children.cycles-pp.setup_arg_pages
      0.00            +0.2        0.20 ± 38%  perf-profile.children.cycles-pp.create_elf_tables
      0.00            +0.2        0.21 ± 47%  perf-profile.children.cycles-pp.down_write
      0.00            +0.2        0.21 ± 45%  perf-profile.children.cycles-pp.free_frozen_page_commit
      0.00            +0.2        0.23 ± 37%  perf-profile.children.cycles-pp.__anon_vma_interval_tree_remove
      0.00            +0.2        0.23 ± 60%  perf-profile.children.cycles-pp.up_write
      0.00            +0.2        0.23 ± 45%  perf-profile.children.cycles-pp.free_unref_folios
      0.00            +0.2        0.23 ± 44%  perf-profile.children.cycles-pp.alloc_empty_file
      0.00            +0.2        0.24 ± 45%  perf-profile.children.cycles-pp.__pi_memcpy
      0.00            +0.2        0.24 ± 41%  perf-profile.children.cycles-pp.do_wp_page
      0.00            +0.2        0.24 ± 32%  perf-profile.children.cycles-pp._exit
      0.00            +0.2        0.25 ± 72%  perf-profile.children.cycles-pp.__libc_fork
      0.00            +0.2        0.25 ± 54%  perf-profile.children.cycles-pp.free_pcppages_bulk
      0.00            +0.3        0.25 ± 53%  perf-profile.children.cycles-pp.affine_move_task
      0.00            +0.3        0.26 ± 46%  perf-profile.children.cycles-pp.shmem_write_end
      0.03 ±223%      +0.3        0.30 ± 34%  perf-profile.children.cycles-pp.schedule_idle
      0.00            +0.3        0.27 ± 46%  perf-profile.children.cycles-pp.__set_cpus_allowed_ptr
      0.00            +0.3        0.27 ± 47%  perf-profile.children.cycles-pp.__pte_alloc
      0.00            +0.3        0.27 ± 58%  perf-profile.children.cycles-pp.preempt_schedule
      0.00            +0.3        0.27 ± 58%  perf-profile.children.cycles-pp.preempt_schedule_thunk
      0.00            +0.3        0.28 ± 63%  perf-profile.children.cycles-pp.get_arg_page
      0.00            +0.3        0.28 ± 58%  perf-profile.children.cycles-pp.native_irq_return_iret
      0.00            +0.3        0.29 ± 60%  perf-profile.children.cycles-pp.copy_strings
      0.00            +0.3        0.29 ± 45%  perf-profile.children.cycles-pp.fast_dput
      0.00            +0.3        0.29 ± 44%  perf-profile.children.cycles-pp.lock_vma_under_rcu
      0.00            +0.3        0.29 ± 44%  perf-profile.children.cycles-pp.__sched_setaffinity
      0.00            +0.3        0.29 ± 44%  perf-profile.children.cycles-pp.__d_lookup
      0.00            +0.3        0.29 ± 35%  perf-profile.children.cycles-pp.__x64_sys_munmap
      0.00            +0.3        0.30 ± 44%  perf-profile.children.cycles-pp._find_next_or_bit
      0.00            +0.3        0.30 ± 53%  perf-profile.children.cycles-pp.__refill_objects_any
      0.00            +0.3        0.30 ± 49%  perf-profile.children.cycles-pp.dput
      0.00            +0.3        0.30 ± 45%  perf-profile.children.cycles-pp.vms_complete_munmap_vmas
      0.00            +0.3        0.31 ± 50%  perf-profile.children.cycles-pp.shmem_alloc_and_add_folio
      0.00            +0.3        0.31 ± 39%  perf-profile.children.cycles-pp.do_wait
      0.00            +0.3        0.31 ± 39%  perf-profile.children.cycles-pp.kernel_wait4
      0.00            +0.3        0.31 ± 54%  perf-profile.children.cycles-pp.folio_remove_rmap_ptes
      0.00            +0.3        0.31 ± 46%  perf-profile.children.cycles-pp.unmap_region
      0.00            +0.3        0.32 ± 39%  perf-profile.children.cycles-pp.__x64_sys_sched_setaffinity
      0.00            +0.3        0.33 ± 23%  perf-profile.children.cycles-pp.anon_vma_clone
      0.00            +0.3        0.33 ± 53%  perf-profile.children.cycles-pp.mm_init_sched
      0.00            +0.3        0.34 ± 32%  perf-profile.children.cycles-pp.pid_revalidate
      0.00            +0.4        0.35 ± 37%  perf-profile.children.cycles-pp.perf_event_mmap_event
      0.00            +0.4        0.36 ± 45%  perf-profile.children.cycles-pp.shmem_get_folio_gfp
      0.00            +0.4        0.36 ± 45%  perf-profile.children.cycles-pp.shmem_write_begin
      0.00            +0.4        0.38 ± 71%  perf-profile.children.cycles-pp.swevent_hlist_put_cpu
      0.00            +0.4        0.38 ± 15%  perf-profile.children.cycles-pp.__vm_munmap
      0.00            +0.4        0.38 ± 15%  perf-profile.children.cycles-pp.do_vmi_align_munmap
      0.00            +0.4        0.38 ± 15%  perf-profile.children.cycles-pp.do_vmi_munmap
      0.00            +0.4        0.38 ± 52%  perf-profile.children.cycles-pp.menu_select
      0.00            +0.4        0.38 ± 36%  perf-profile.children.cycles-pp.tear_down_vmas
      0.00            +0.4        0.38 ± 43%  perf-profile.children.cycles-pp.__mod_memcg_lruvec_state
      0.00            +0.4        0.39 ± 62%  perf-profile.children.cycles-pp.__sched_balance_update_blocked_averages
      0.00            +0.4        0.39 ± 57%  perf-profile.children.cycles-pp.sched_exec
      0.00            +0.4        0.39 ± 41%  perf-profile.children.cycles-pp.__d_alloc
      0.00            +0.4        0.40 ± 47%  perf-profile.children.cycles-pp.perf_event_mmap
      0.68 ± 12%      +0.4        1.09 ± 40%  perf-profile.children.cycles-pp.tick_nohz_handler
      0.00            +0.4        0.40 ± 68%  perf-profile.children.cycles-pp.lruvec_stat_mod_folio
      0.00            +0.4        0.40 ± 20%  perf-profile.children.cycles-pp.pte_offset_map_lock
      0.00            +0.4        0.41 ± 38%  perf-profile.children.cycles-pp.do_anonymous_page
      0.00            +0.4        0.42 ± 19%  perf-profile.children.cycles-pp.vfs_statx
      0.00            +0.4        0.42 ± 32%  perf-profile.children.cycles-pp.worker_thread
      0.00            +0.4        0.42 ± 46%  perf-profile.children.cycles-pp.__account_obj_stock
      0.00            +0.4        0.42 ± 35%  perf-profile.children.cycles-pp.fstatat64
      0.01 ±223%      +0.4        0.44 ± 57%  perf-profile.children.cycles-pp._find_next_bit
      0.00            +0.4        0.43 ± 21%  perf-profile.children.cycles-pp.copy_p4d_range
      0.00            +0.4        0.43 ± 21%  perf-profile.children.cycles-pp.copy_page_range
      0.00            +0.4        0.44 ± 35%  perf-profile.children.cycles-pp.filename_lookup
      0.00            +0.4        0.44 ± 35%  perf-profile.children.cycles-pp.path_lookupat
      0.00            +0.5        0.45 ± 52%  perf-profile.children.cycles-pp.do_dentry_open
      0.00            +0.5        0.45 ± 59%  perf-profile.children.cycles-pp.mas_store_prealloc
      0.00            +0.5        0.46 ± 22%  perf-profile.children.cycles-pp.vfs_fstatat
      0.00            +0.5        0.46 ± 50%  perf-profile.children.cycles-pp.__vma_start_write
      0.00            +0.5        0.47 ± 25%  perf-profile.children.cycles-pp.schedule_tail
      0.05 ± 74%      +0.5        0.53 ± 30%  perf-profile.children.cycles-pp.copy_folio_from_iter_atomic
      0.00            +0.5        0.49 ± 41%  perf-profile.children.cycles-pp.vms_gather_munmap_vmas
      0.00            +0.5        0.49 ± 47%  perf-profile.children.cycles-pp.vfs_open
      0.00            +0.5        0.51 ± 46%  perf-profile.children.cycles-pp.folios_put_refs
      0.00            +0.5        0.51 ± 27%  perf-profile.children.cycles-pp.elf_load
      0.00            +0.5        0.54 ± 68%  perf-profile.children.cycles-pp.seq_printf
      0.00            +0.5        0.54 ± 30%  perf-profile.children.cycles-pp.__split_vma
      0.00            +0.6        0.56 ± 27%  perf-profile.children.cycles-pp.__do_sys_newfstatat
      0.37 ±  7%      +0.6        0.94 ± 33%  perf-profile.children.cycles-pp.select_task_rq_fair
      0.00            +0.6        0.57 ± 45%  perf-profile.children.cycles-pp.sync_regs
      0.00            +0.6        0.58 ± 53%  perf-profile.children.cycles-pp.__x64_sys_close
      0.00            +0.6        0.58 ± 39%  perf-profile.children.cycles-pp.kmem_cache_alloc_lru_noprof
      0.00            +0.6        0.58 ± 30%  perf-profile.children.cycles-pp.smpboot_thread_fn
      0.00            +0.6        0.58 ± 24%  perf-profile.children.cycles-pp.__mmap
      0.00            +0.6        0.60 ± 50%  perf-profile.children.cycles-pp.proc_pident_lookup
      0.00            +0.6        0.60 ± 38%  perf-profile.children.cycles-pp.wake_up_new_task
      0.00            +0.6        0.61 ± 60%  perf-profile.children.cycles-pp.vsnprintf
      0.00            +0.6        0.61 ± 30%  perf-profile.children.cycles-pp.unlink_anon_vmas
      0.02 ±223%      +0.6        0.64 ± 48%  perf-profile.children.cycles-pp.intel_idle
      0.00            +0.6        0.64 ± 45%  perf-profile.children.cycles-pp.do_open
      0.00            +0.7        0.65 ± 44%  perf-profile.children.cycles-pp.__refill_objects_node
      0.00            +0.7        0.66 ± 29%  perf-profile.children.cycles-pp.__mmap_new_vma
      0.00            +0.7        0.66 ± 31%  perf-profile.children.cycles-pp.__open64_nocancel
      0.00            +0.7        0.66 ± 40%  perf-profile.children.cycles-pp.__percpu_counter_init_many
      0.00            +0.7        0.66 ± 41%  perf-profile.children.cycles-pp.sched_setaffinity
      0.00            +0.7        0.68 ± 30%  perf-profile.children.cycles-pp.__tlb_batch_free_encoded_pages
      0.00            +0.7        0.68 ± 30%  perf-profile.children.cycles-pp.free_pages_and_swap_cache
      0.00            +0.7        0.71 ± 28%  perf-profile.children.cycles-pp.rcu_do_batch
      0.04 ±156%      +0.7        0.76 ± 22%  perf-profile.children.cycles-pp.sched_balance_newidle
      0.00            +0.7        0.74 ± 42%  perf-profile.children.cycles-pp.sw_perf_event_destroy
      0.00            +0.7        0.74 ± 43%  perf-profile.children.cycles-pp.__d_lookup_rcu
      0.00            +0.8        0.75 ± 34%  perf-profile.children.cycles-pp.update_sg_wakeup_stats
      0.00            +0.8        0.76 ± 32%  perf-profile.children.cycles-pp.__pcs_replace_empty_main
      0.00            +0.8        0.76 ± 53%  perf-profile.children.cycles-pp.__memcg_slab_post_alloc_hook
      0.00            +0.8        0.76 ± 44%  perf-profile.children.cycles-pp.__free_event
      0.00            +0.8        0.77 ± 19%  perf-profile.children.cycles-pp.anon_vma_fork
      0.00            +0.8        0.78 ± 39%  perf-profile.children.cycles-pp.wp_page_copy
      0.00            +0.8        0.78 ± 28%  perf-profile.children.cycles-pp.__memcg_slab_free_hook
      0.00            +0.8        0.79 ± 21%  perf-profile.children.cycles-pp.setlocale
      0.00            +0.8        0.80 ± 37%  perf-profile.children.cycles-pp.sched_balance_find_dst_group
      0.00            +0.8        0.80 ± 16%  perf-profile.children.cycles-pp.next_uptodate_folio
      0.00            +0.8        0.80 ± 32%  perf-profile.children.cycles-pp.sched_balance_domains
      0.00            +0.8        0.81 ± 17%  perf-profile.children.cycles-pp.__percpu_counter_sum
      0.00            +0.8        0.81 ± 19%  perf-profile.children.cycles-pp.rcu_core
      0.00            +0.8        0.82 ± 34%  perf-profile.children.cycles-pp.refill_objects
      0.00            +0.8        0.84 ± 48%  perf-profile.children.cycles-pp.sched_balance_update_blocked_averages
      0.00            +0.9        0.89 ± 20%  perf-profile.children.cycles-pp.__mmdrop
      0.00            +1.0        0.96 ± 64%  perf-profile.children.cycles-pp.do_task_stat
      0.00            +1.0        0.98 ± 29%  perf-profile.children.cycles-pp.on_each_cpu_cond_mask
      0.00            +1.0        0.98 ± 29%  perf-profile.children.cycles-pp.smp_call_function_many_cond
      0.00            +1.0        1.00 ± 34%  perf-profile.children.cycles-pp.d_alloc_parallel
      0.23 ± 32%      +1.0        1.24 ± 11%  perf-profile.children.cycles-pp.record__mmap_read_evlist
      0.15 ± 36%      +1.0        1.16 ± 11%  perf-profile.children.cycles-pp.record__pushfn
      0.00            +1.0        1.01 ± 14%  perf-profile.children.cycles-pp.kthread
      0.22 ± 33%      +1.0        1.24 ± 11%  perf-profile.children.cycles-pp.perf_mmap__push
      0.00            +1.0        1.02 ± 21%  perf-profile.children.cycles-pp.kmem_cache_free
      0.00            +1.1        1.06 ± 28%  perf-profile.children.cycles-pp.zap_present_ptes
      0.00            +1.1        1.06 ± 20%  perf-profile.children.cycles-pp.kmem_cache_alloc_noprof
      0.10 ± 51%      +1.1        1.18 ± 11%  perf-profile.children.cycles-pp.generic_perform_write
      0.11 ± 52%      +1.1        1.19 ±  9%  perf-profile.children.cycles-pp.shmem_file_write_iter
      0.00            +1.1        1.12 ± 25%  perf-profile.children.cycles-pp.flush_tlb_mm_range
      0.01 ±223%      +1.1        1.15 ± 21%  perf-profile.children.cycles-pp.update_sg_lb_stats
      0.00            +1.2        1.20 ± 26%  perf-profile.children.cycles-pp.link_path_walk
      0.00            +1.2        1.22 ± 28%  perf-profile.children.cycles-pp.free_pgtables
      0.00            +1.2        1.22 ± 43%  perf-profile.children.cycles-pp.intel_idle_xstate
      0.02 ±149%      +1.3        1.31 ± 24%  perf-profile.children.cycles-pp.sched_balance_find_src_group
      0.02 ±149%      +1.3        1.31 ± 24%  perf-profile.children.cycles-pp.update_sd_lb_stats
      0.00            +1.3        1.33 ± 27%  perf-profile.children.cycles-pp.filemap_map_pages
      0.24 ± 31%      +1.3        1.58 ± 23%  perf-profile.children.cycles-pp.handle_internal_command
      0.24 ± 31%      +1.3        1.58 ± 23%  perf-profile.children.cycles-pp.main
      0.00            +1.4        1.36 ± 21%  perf-profile.children.cycles-pp.do_softirq
      0.06 ± 11%      +1.4        1.43 ± 24%  perf-profile.children.cycles-pp.__irq_exit_rcu
      0.00            +1.4        1.38 ± 26%  perf-profile.children.cycles-pp.do_read_fault
      0.00            +1.4        1.40 ± 33%  perf-profile.children.cycles-pp.lookup_open
      0.08 ± 55%      +1.4        1.52 ± 24%  perf-profile.children.cycles-pp.sched_balance_rq
      0.01 ±223%      +1.5        1.50 ± 14%  perf-profile.children.cycles-pp.flush_smp_call_function_queue
      0.00            +1.5        1.50 ± 25%  perf-profile.children.cycles-pp.tlb_finish_mmu
      0.00            +1.5        1.53 ± 22%  perf-profile.children.cycles-pp.zap_pmd_range
      0.00            +1.5        1.53 ± 22%  perf-profile.children.cycles-pp.zap_pte_range
      0.00            +1.5        1.53 ± 15%  perf-profile.children.cycles-pp.ret_from_fork
      0.00            +1.5        1.53 ± 15%  perf-profile.children.cycles-pp.ret_from_fork_asm
      0.00            +1.5        1.54 ± 30%  perf-profile.children.cycles-pp.alloc_bprm
      0.00            +1.5        1.54 ± 27%  perf-profile.children.cycles-pp.do_fault
      0.00            +1.6        1.56 ± 13%  perf-profile.children.cycles-pp.ksys_mmap_pgoff
      0.00            +1.6        1.61 ± 23%  perf-profile.children.cycles-pp.__zap_vma_range
      0.00            +1.6        1.64 ± 31%  perf-profile.children.cycles-pp.lookup_fast
      0.00            +1.7        1.72 ± 24%  perf-profile.children.cycles-pp.unmap_vmas
      0.00            +1.7        1.74 ± 17%  perf-profile.children.cycles-pp.dup_mmap
      0.00            +1.8        1.75 ± 19%  perf-profile.children.cycles-pp._nohz_idle_balance
      0.00            +1.8        1.77 ± 14%  perf-profile.children.cycles-pp.__mmap_region
      0.00            +1.8        1.85 ± 33%  perf-profile.children.cycles-pp.__pi_memset
      0.00            +1.9        1.92 ± 16%  perf-profile.children.cycles-pp.do_mmap
      0.00            +2.0        1.98 ± 15%  perf-profile.children.cycles-pp.vm_mmap_pgoff
      0.00            +2.0        2.01 ± 18%  perf-profile.children.cycles-pp.setup_new_exec
      0.87 ± 11%      +2.1        3.00 ± 21%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.00            +2.2        2.16 ± 34%  perf-profile.children.cycles-pp.pcpu_alloc_noprof
      0.00            +2.4        2.37 ± 38%  perf-profile.children.cycles-pp.proc_single_show
      0.99 ± 12%      +2.4        3.42 ± 18%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.00            +2.5        2.48 ± 32%  perf-profile.children.cycles-pp.open_last_lookups
      0.00            +2.6        2.62 ± 37%  perf-profile.children.cycles-pp.seq_read
      0.00            +2.7        2.69 ± 24%  perf-profile.children.cycles-pp.mm_init
      0.00            +2.7        2.74 ± 32%  perf-profile.children.cycles-pp.seq_read_iter
      0.03 ± 70%      +2.9        2.91 ± 15%  perf-profile.children.cycles-pp.handle_softirqs
      0.00            +3.0        2.99 ± 13%  perf-profile.children.cycles-pp.exit_mm
      0.00            +3.0        3.02 ± 15%  perf-profile.children.cycles-pp.dup_mm
      0.00            +3.2        3.21 ± 16%  perf-profile.children.cycles-pp.__handle_mm_fault
      0.00            +3.3        3.28 ± 16%  perf-profile.children.cycles-pp.handle_mm_fault
      0.00            +3.3        3.32 ± 15%  perf-profile.children.cycles-pp.load_elf_binary
      0.00            +3.4        3.37 ± 15%  perf-profile.children.cycles-pp.exec_binprm
      0.00            +3.4        3.38 ± 15%  perf-profile.children.cycles-pp.copy_process
      0.00            +3.6        3.63 ± 20%  perf-profile.children.cycles-pp.do_user_addr_fault
      0.00            +3.7        3.66 ± 19%  perf-profile.children.cycles-pp.exc_page_fault
      0.00            +3.8        3.81 ± 11%  perf-profile.children.cycles-pp.bprm_execve
      0.00            +4.0        4.02 ± 15%  perf-profile.children.cycles-pp.__do_sys_clone
      0.00            +4.0        4.02 ± 15%  perf-profile.children.cycles-pp.kernel_clone
      0.00            +4.5        4.54 ± 19%  perf-profile.children.cycles-pp.asm_exc_page_fault
      0.00            +4.6        4.58 ± 27%  perf-profile.children.cycles-pp.path_openat
      0.00            +4.6        4.61 ± 26%  perf-profile.children.cycles-pp.do_file_open
      0.00            +4.6        4.62 ± 13%  perf-profile.children.cycles-pp.exit_mmap
      0.00            +4.6        4.63 ± 13%  perf-profile.children.cycles-pp.__mmput
      0.00            +4.8        4.77 ± 13%  perf-profile.children.cycles-pp._Fork
      0.00            +4.9        4.86 ± 25%  perf-profile.children.cycles-pp.__x64_sys_openat
      0.00            +4.9        4.86 ± 25%  perf-profile.children.cycles-pp.do_sys_openat2
      0.03 ±223%      +5.5        5.53 ± 12%  perf-profile.children.cycles-pp.cpuidle_enter
      0.02 ±223%      +5.5        5.53 ± 12%  perf-profile.children.cycles-pp.cpuidle_enter_state
      0.00            +5.9        5.86 ± 12%  perf-profile.children.cycles-pp.execve
      0.00            +5.9        5.88 ± 12%  perf-profile.children.cycles-pp.__x64_sys_execve
      0.00            +5.9        5.88 ± 12%  perf-profile.children.cycles-pp.do_execveat_common
      0.03 ±223%      +6.2        6.20 ± 12%  perf-profile.children.cycles-pp.cpuidle_idle_call
      0.08 ±187%      +6.9        7.03 ± 18%  perf-profile.children.cycles-pp.start_secondary
      0.08 ±187%      +8.2        8.23 ± 10%  perf-profile.children.cycles-pp.common_startup_64
      0.08 ±187%      +8.2        8.23 ± 10%  perf-profile.children.cycles-pp.cpu_startup_entry
      0.08 ±187%      +8.2        8.23 ± 10%  perf-profile.children.cycles-pp.do_idle
      0.63 ±  6%      +9.3        9.95 ± 67%  perf-profile.children.cycles-pp.x64_sys_call
      0.00            +9.8        9.84 ± 68%  perf-profile.children.cycles-pp.__x64_sys_exit_group
      0.12 ± 16%     +17.7       17.81 ± 44%  perf-profile.children.cycles-pp.queue_event
      0.12 ± 16%     +17.7       17.86 ± 44%  perf-profile.children.cycles-pp.ordered_events__queue
      0.12 ± 16%     +17.8       17.89 ± 44%  perf-profile.children.cycles-pp.process_simple
      1.57 ±  5%     +21.6       23.19 ± 27%  perf-profile.children.cycles-pp.exit_to_user_mode_loop
      0.00           +23.0       23.01 ± 28%  perf-profile.children.cycles-pp.get_signal
      0.00           +23.0       23.05 ± 28%  perf-profile.children.cycles-pp.arch_do_signal_or_restart
      0.14 ± 15%     +24.0       24.11 ± 41%  perf-profile.children.cycles-pp.perf_session__process_events
      0.37 ± 23%     +24.9       25.25 ± 42%  perf-profile.children.cycles-pp.cmd_record
      0.00           +27.7       27.72 ±  4%  perf-profile.children.cycles-pp.event_function_call
      0.00           +27.7       27.72 ±  4%  perf-profile.children.cycles-pp.smp_call_function_single
      0.00           +28.8       28.76 ±  6%  perf-profile.children.cycles-pp.perf_event_release_kernel
      0.00           +28.8       28.76 ±  6%  perf-profile.children.cycles-pp.perf_release
      0.00           +29.3       29.28 ±  5%  perf-profile.children.cycles-pp.task_work_run
      0.00           +29.4       29.45 ±  6%  perf-profile.children.cycles-pp.__fput
      0.00           +32.8       32.84 ±  4%  perf-profile.children.cycles-pp.do_exit
      0.00           +32.8       32.84 ±  4%  perf-profile.children.cycles-pp.do_group_exit
     25.22 ±  2%     -25.2        0.03 ±223%  perf-profile.self.cycles-pp.__switch_to
     11.58 ±  4%     -11.4        0.19 ±150%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      6.45 ±  5%      -6.4        0.06 ±153%  perf-profile.self.cycles-pp.__fget_files
      3.03 ±  6%      -2.5        0.50 ± 50%  perf-profile.self.cycles-pp.mutex_unlock
      2.52 ±  7%      -2.4        0.10 ± 80%  perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      2.16 ±  7%      -2.1        0.10 ± 50%  perf-profile.self.cycles-pp.do_syscall_64
      2.34            -2.0        0.38 ± 57%  perf-profile.self.cycles-pp.mutex_lock
      1.84 ±  5%      -1.8        0.05 ±101%  perf-profile.self.cycles-pp.fput
      0.78 ±  8%      -0.7        0.06 ±101%  perf-profile.self.cycles-pp.prandom_u32_state
      0.54 ±  6%      -0.4        0.09 ±111%  perf-profile.self.cycles-pp.x64_sys_call
      0.32 ± 22%      -0.2        0.10 ± 87%  perf-profile.self.cycles-pp.mutex_spin_on_owner
      0.19 ±  3%      -0.1        0.06 ±102%  perf-profile.self.cycles-pp.update_load_avg
      0.00            +0.2        0.18 ± 39%  perf-profile.self.cycles-pp.__free_one_page
      0.00            +0.2        0.18 ± 64%  perf-profile.self.cycles-pp.perf_session__process_events
      0.00            +0.2        0.19 ± 28%  perf-profile.self.cycles-pp.lock_vma_under_rcu
      0.00            +0.2        0.21 ± 58%  perf-profile.self.cycles-pp.do_wp_page
      0.00            +0.2        0.21 ± 38%  perf-profile.self.cycles-pp.__anon_vma_interval_tree_remove
      0.00            +0.2        0.22 ± 47%  perf-profile.self.cycles-pp.__pi_memcpy
      0.00            +0.2        0.22 ± 54%  perf-profile.self.cycles-pp.__vma_start_write
      0.00            +0.2        0.23 ± 52%  perf-profile.self.cycles-pp.shmem_write_end
      0.00            +0.2        0.23 ± 60%  perf-profile.self.cycles-pp.up_write
      0.00            +0.2        0.24 ± 73%  perf-profile.self.cycles-pp.kmem_cache_alloc_noprof
      0.00            +0.2        0.25 ± 58%  perf-profile.self.cycles-pp.kmem_cache_free
      0.00            +0.2        0.25 ± 41%  perf-profile.self.cycles-pp.pid_revalidate
      0.00            +0.3        0.25 ± 46%  perf-profile.self.cycles-pp.mm_init_sched
      0.00            +0.3        0.26 ± 45%  perf-profile.self.cycles-pp.folio_remove_rmap_ptes
      0.00            +0.3        0.27 ± 55%  perf-profile.self.cycles-pp.zap_pte_range
      0.00            +0.3        0.28 ± 43%  perf-profile.self.cycles-pp.__mod_memcg_lruvec_state
      0.00            +0.3        0.28 ± 52%  perf-profile.self.cycles-pp._find_next_or_bit
      0.00            +0.3        0.28 ± 58%  perf-profile.self.cycles-pp.native_irq_return_iret
      0.00            +0.3        0.32 ± 54%  perf-profile.self.cycles-pp.__account_obj_stock
      0.00            +0.4        0.37 ± 47%  perf-profile.self.cycles-pp.cpuidle_enter_state
      0.01 ±223%      +0.4        0.40 ± 53%  perf-profile.self.cycles-pp._find_next_bit
      0.00            +0.5        0.45 ± 69%  perf-profile.self.cycles-pp.do_task_stat
      0.05 ± 74%      +0.5        0.53 ± 30%  perf-profile.self.cycles-pp.copy_folio_from_iter_atomic
      0.00            +0.5        0.50 ± 19%  perf-profile.self.cycles-pp.__percpu_counter_sum
      0.00            +0.5        0.54 ± 62%  perf-profile.self.cycles-pp.__refill_objects_node
      0.00            +0.6        0.55 ± 19%  perf-profile.self.cycles-pp.__memcg_slab_free_hook
      0.00            +0.6        0.57 ± 45%  perf-profile.self.cycles-pp.sync_regs
      0.02 ±223%      +0.6        0.64 ± 48%  perf-profile.self.cycles-pp.intel_idle
      0.00            +0.6        0.64 ± 34%  perf-profile.self.cycles-pp.zap_present_ptes
      0.00            +0.6        0.64 ± 37%  perf-profile.self.cycles-pp.update_sg_wakeup_stats
      0.00            +0.7        0.73 ± 20%  perf-profile.self.cycles-pp.next_uptodate_folio
      0.00            +0.7        0.74 ± 43%  perf-profile.self.cycles-pp.__d_lookup_rcu
      0.00            +1.0        0.98 ± 29%  perf-profile.self.cycles-pp.smp_call_function_many_cond
      0.01 ±223%      +1.0        1.06 ± 21%  perf-profile.self.cycles-pp.update_sg_lb_stats
      0.00            +1.2        1.22 ± 43%  perf-profile.self.cycles-pp.intel_idle_xstate
      0.53 ±  3%      +1.6        2.18 ± 21%  perf-profile.self.cycles-pp._raw_spin_lock
      0.00            +1.8        1.81 ± 34%  perf-profile.self.cycles-pp.__pi_memset
      0.11 ± 15%     +17.5       17.65 ± 44%  perf-profile.self.cycles-pp.queue_event
      0.00           +27.5       27.54 ±  5%  perf-profile.self.cycles-pp.smp_call_function_single



***************************************************************************************************

=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-14/performance/x86_64-rhel-9.4/process/100%/debian-13-x86_64-20250902.cgz/lkp-ivb-2ep2/sched_yield/will-it-scale

commit: 
  fb1050ac8e ("sched/fair: Change the default cgroup_mode to concur")
  85570f10a4 ("sched/eevdf: Move to a single runqueue")

fb1050ac8e40aaa0 85570f10a4c61372c1d437365b9 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
  44783607           +24.5%   55768932        will-it-scale.48.processes
    932991           +24.5%    1161852        will-it-scale.per_process_ops
  44783607           +24.5%   55768932        will-it-scale.workload
    246.50 ± 24%     -97.8%       5.33 ± 45%  perf-c2c.DRAM.local
     58.56            -6.9       51.70        mpstat.cpu.all.sys%
     40.52            +6.9       47.38        mpstat.cpu.all.usr%
    483916 ±  6%     -33.6%     321124 ± 12%  numa-numastat.node0.local_node
    509785 ±  3%     -32.9%     341906 ± 11%  numa-numastat.node0.numa_hit
   2321721           -84.2%     367063 ± 11%  numa-numastat.node1.local_node
   2343407           -83.1%     396041 ± 10%  numa-numastat.node1.numa_hit
    173.25            -3.2%     167.66        turbostat.CorWatt
      0.46           -25.8%       0.34        turbostat.IPC
    202.81            -2.8%     197.19        turbostat.PkgWatt
     11.07            -3.1%      10.72        turbostat.RAMWatt
     40.25           +16.9%      47.03        vmstat.cpu.us
  11979652           -62.4%    4507821        vmstat.memory.cache
  52438214           +14.8%   60178980        vmstat.memory.free
    140798 ±  2%     -71.4%      40238 ±  3%  vmstat.system.cs
   8140266 ±  2%     -91.7%     675233 ± 11%  numa-meminfo.node1.Active
   8140266 ±  2%     -91.7%     675233 ± 11%  numa-meminfo.node1.Active(anon)
   9127277 ± 19%     -81.7%    1666644 ±108%  numa-meminfo.node1.FilePages
   3886821 ±  3%     -99.2%      31984 ±114%  numa-meminfo.node1.Mapped
  23060789 ±  8%     +32.9%   30646789 ±  5%  numa-meminfo.node1.MemFree
   9916974 ± 18%     -76.5%    2330978 ± 76%  numa-meminfo.node1.MemUsed
     12692 ±  3%     -60.3%       5035 ±  7%  numa-meminfo.node1.PageTables
   7749269           -96.3%     287599 ± 13%  numa-meminfo.node1.Shmem
    136641 ±  2%     -72.7%      37358 ±  2%  perf-stat.i.context-switches
    114.41            -4.0%     109.86        perf-stat.i.cpu-migrations
      3691 ±  3%     -40.2%       2206        perf-stat.i.minor-faults
      3691 ±  3%     -40.2%       2206        perf-stat.i.page-faults
    141802 ±  2%     -71.4%      40509 ±  3%  perf-stat.ps.context-switches
    113.72            -3.9%     109.30        perf-stat.ps.cpu-migrations
      3674 ±  3%     -40.1%       2199        perf-stat.ps.minor-faults
      3674 ±  3%     -40.1%       2199        perf-stat.ps.page-faults
    509973 ±  3%     -32.9%     342030 ± 11%  numa-vmstat.node0.numa_hit
    484103 ±  6%     -33.6%     321245 ± 12%  numa-vmstat.node0.numa_local
   2035158 ±  2%     -91.7%     168824 ± 11%  numa-vmstat.node1.nr_active_anon
   2281903 ± 19%     -81.7%     416673 ±108%  numa-vmstat.node1.nr_file_pages
   5765158 ±  8%     +32.9%    7661677 ±  5%  numa-vmstat.node1.nr_free_pages
   5740333 ±  8%     +33.0%    7632209 ±  5%  numa-vmstat.node1.nr_free_pages_blocks
    973290 ±  3%     -99.2%       8030 ±114%  numa-vmstat.node1.nr_mapped
      3176 ±  3%     -60.4%       1258 ±  7%  numa-vmstat.node1.nr_page_table_pages
   1937401           -96.3%      71912 ± 13%  numa-vmstat.node1.nr_shmem
   2035158 ±  2%     -91.7%     168824 ± 11%  numa-vmstat.node1.nr_zone_active_anon
   2343565           -83.1%     396221 ± 10%  numa-vmstat.node1.numa_hit
   2321879           -84.2%     367243 ± 11%  numa-vmstat.node1.numa_local
   8529288           -88.1%    1015618        meminfo.Active
   8529288           -88.1%    1015618        meminfo.Active(anon)
    732164            -8.4%     670611        meminfo.AnonPages
  11874627           -62.8%    4422526        meminfo.Cached
   8785059           -85.6%    1260657        meminfo.Committed_AS
    101740           -16.6%      84899        meminfo.KReclaimable
   3933734 ±  2%     -97.8%      85877        meminfo.Mapped
  52140246           +14.8%   59870117        meminfo.MemAvailable
  52440583           +14.8%   60178876        meminfo.MemFree
  13413372           -57.7%    5675083        meminfo.Memused
     18373           -45.4%      10029        meminfo.PageTables
    101740           -16.6%      84899        meminfo.SReclaimable
   7797582           -95.6%     345478 ±  3%  meminfo.Shmem
    209643            -8.5%     191729        meminfo.Slab
  13492428           -55.7%    5976857        meminfo.max_used_kB
   2132011           -88.1%     253881        proc-vmstat.nr_active_anon
    183065            -8.4%     167663        proc-vmstat.nr_anon_pages
   1300351           +14.9%    1493504        proc-vmstat.nr_dirty_background_threshold
   2603882           +14.9%    2990660        proc-vmstat.nr_dirty_threshold
   2968321           -62.8%    1105598        proc-vmstat.nr_file_pages
  13110339           +14.8%   15044700        proc-vmstat.nr_free_pages
  13039379           +14.7%   14962664        proc-vmstat.nr_free_pages_blocks
    984825 ±  2%     -97.8%      21496        proc-vmstat.nr_mapped
      4594           -45.4%       2508        proc-vmstat.nr_page_table_pages
   1949059           -95.6%      86335 ±  3%  proc-vmstat.nr_shmem
     25434           -16.5%      21224        proc-vmstat.nr_slab_reclaimable
   2132011           -88.1%     253881        proc-vmstat.nr_zone_active_anon
    306545 ± 10%     -99.0%       3138 ± 15%  proc-vmstat.numa_hint_faults
    303992 ±  9%     -99.2%       2572 ± 22%  proc-vmstat.numa_hint_faults_local
   2855220           -74.1%     739471        proc-vmstat.numa_hit
   2807664           -75.4%     689708        proc-vmstat.numa_local
    310624 ± 10%     -98.6%       4248 ± 18%  proc-vmstat.numa_pte_updates
   2998813           -70.2%     894370        proc-vmstat.pgalloc_normal
   1228987 ±  3%     -36.6%     778916        proc-vmstat.pgfault
    153643          +184.4%     436989        sched_debug.cfs_rq:/.avg_vruntime.avg
    178958 ±  2%   +2724.3%    5054254 ± 16%  sched_debug.cfs_rq:/.avg_vruntime.max
    141157            +6.8%     150705        sched_debug.cfs_rq:/.avg_vruntime.min
      5635 ±  6%  +15522.7%     880370 ± 11%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      0.36 ±  2%     -12.0%       0.31 ±  5%  sched_debug.cfs_rq:/.h_nr_queued.stddev
      0.36 ±  2%     -11.8%       0.31 ±  5%  sched_debug.cfs_rq:/.h_nr_runnable.stddev
    246.97 ±158%   +3818.6%       9677 ± 98%  sched_debug.cfs_rq:/.left_deadline.avg
     11854 ±158%   +3660.6%     445788 ± 94%  sched_debug.cfs_rq:/.left_deadline.max
      1693 ±158%   +3685.7%      64096 ± 94%  sched_debug.cfs_rq:/.left_deadline.stddev
    246.94 ±158%   +3818.9%       9677 ± 98%  sched_debug.cfs_rq:/.left_vruntime.avg
     11853 ±158%   +3660.9%     445786 ± 94%  sched_debug.cfs_rq:/.left_vruntime.max
      1692 ±158%   +3686.1%      64095 ± 94%  sched_debug.cfs_rq:/.left_vruntime.stddev
    676421 ±  9%     +22.3%     827416        sched_debug.cfs_rq:/.load.min
    322196 ±  4%     -11.2%     286116 ±  6%  sched_debug.cfs_rq:/.load.stddev
    658.36 ±  9%     +22.3%     805.47        sched_debug.cfs_rq:/.load_avg.min
    246.94 ±158%   +3818.9%       9677 ± 98%  sched_debug.cfs_rq:/.right_vruntime.avg
     11853 ±158%   +3660.9%     445787 ± 94%  sched_debug.cfs_rq:/.right_vruntime.max
      1692 ±158%   +3686.1%      64096 ± 94%  sched_debug.cfs_rq:/.right_vruntime.stddev
      1958           -34.7%       1278 ± 10%  sched_debug.cfs_rq:/.runnable_avg.max
    194.60 ±  4%     -56.3%      85.03 ± 26%  sched_debug.cfs_rq:/.runnable_avg.stddev
 9.579e+08 ±223%    +934.3%  9.908e+09 ± 19%  sched_debug.cfs_rq:/.sum_w_vruntime.avg
 4.598e+10 ±223%    +969.5%  4.918e+11 ± 17%  sched_debug.cfs_rq:/.sum_w_vruntime.max
 6.567e+09 ±223%    +999.8%  7.223e+10 ± 15%  sched_debug.cfs_rq:/.sum_w_vruntime.stddev
      1192 ±139%   +2976.6%      36692 ± 19%  sched_debug.cfs_rq:/.sum_weight.avg
     57245 ±139%   +2782.4%    1650080 ±  6%  sched_debug.cfs_rq:/.sum_weight.max
      8176 ±139%   +2824.8%     239140 ±  9%  sched_debug.cfs_rq:/.sum_weight.stddev
      1209 ±  9%     -13.1%       1050 ±  2%  sched_debug.cfs_rq:/.util_avg.max
     95.13 ± 16%     -38.0%      58.94 ± 14%  sched_debug.cfs_rq:/.util_avg.stddev
      1227 ±  6%     -42.1%     710.25 ±  2%  sched_debug.cfs_rq:/.util_est.max
    166.28 ±  3%     -28.6%     118.69 ± 12%  sched_debug.cfs_rq:/.util_est.stddev
    153642          +184.4%     436988        sched_debug.cfs_rq:/.zero_vruntime.avg
    178958 ±  2%   +2724.3%    5054254 ± 16%  sched_debug.cfs_rq:/.zero_vruntime.max
    141157            +6.8%     150705        sched_debug.cfs_rq:/.zero_vruntime.min
      5635 ±  6%  +15522.7%     880370 ± 11%  sched_debug.cfs_rq:/.zero_vruntime.stddev
      4452 ±  9%     +20.9%       5384        sched_debug.cpu.curr->pid.min
    478538 ±  2%     -57.9%     201499 ±  3%  sched_debug.cpu.nr_switches.avg
   4450482 ± 13%     -24.3%    3371066 ± 16%  sched_debug.cpu.nr_switches.max
      3355 ± 12%     -33.7%       2224 ± 24%  sched_debug.cpu.nr_switches.min
    814619 ± 13%     -25.6%     606037 ± 11%  sched_debug.cpu.nr_switches.stddev
     23.62           -18.8        4.80        perf-profile.calltrace.cycles-pp.__pick_next_task.__schedule.schedule.__x64_sys_sched_yield.do_syscall_64
     22.49           -18.8        3.67        perf-profile.calltrace.cycles-pp.pick_task_fair.__pick_next_task.__schedule.schedule.__x64_sys_sched_yield
     18.98 ±  2%     -17.2        1.76        perf-profile.calltrace.cycles-pp.update_curr.pick_task_fair.__pick_next_task.__schedule.schedule
     14.96 ±  5%     -13.8        1.12        perf-profile.calltrace.cycles-pp.update_se.update_curr.pick_task_fair.__pick_next_task.__schedule
     36.78           -10.6       26.18        perf-profile.calltrace.cycles-pp.__schedule.schedule.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe
     37.80           -10.2       27.55        perf-profile.calltrace.cycles-pp.schedule.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_yield
     43.35           -10.0       33.33        perf-profile.calltrace.cycles-pp.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_yield
     47.68            -9.1       38.56        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_yield
     49.04            -8.8       40.23        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__sched_yield
      1.80 ±  4%      -0.7        1.12        perf-profile.calltrace.cycles-pp.pick_eevdf.pick_task_fair.__pick_next_task.__schedule.schedule
      2.15 ± 13%      -0.5        1.63        perf-profile.calltrace.cycles-pp.yield_task_fair.do_sched_yield.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.54 ±  2%      +0.1        0.60        perf-profile.calltrace.cycles-pp.pick_next_task.__schedule.schedule.__x64_sys_sched_yield.do_syscall_64
      0.56 ±  2%      +0.1        0.67        perf-profile.calltrace.cycles-pp.prandom_u32_state.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_yield
      0.95 ±  3%      +0.2        1.13        perf-profile.calltrace.cycles-pp._raw_spin_lock.raw_spin_rq_lock_nested.do_sched_yield.__x64_sys_sched_yield.do_syscall_64
      0.58 ±  7%      +0.2        0.79 ±  4%  perf-profile.calltrace.cycles-pp.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_yield
      1.32 ±  8%      +0.2        1.57        perf-profile.calltrace.cycles-pp._raw_spin_lock.raw_spin_rq_lock_nested.__schedule.schedule.__x64_sys_sched_yield
      2.83 ±  6%      +0.3        3.12        perf-profile.calltrace.cycles-pp.update_rq_clock.__schedule.schedule.__x64_sys_sched_yield.do_syscall_64
      1.40 ±  2%      +0.3        1.70        perf-profile.calltrace.cycles-pp.raw_spin_rq_lock_nested.do_sched_yield.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.46 ±  4%      +0.3        1.79        perf-profile.calltrace.cycles-pp.update_rq_clock_task.__schedule.schedule.__x64_sys_sched_yield.do_syscall_64
      1.94 ±  8%      +0.7        2.59        perf-profile.calltrace.cycles-pp.raw_spin_rq_lock_nested.__schedule.schedule.__x64_sys_sched_yield.do_syscall_64
     95.00            +0.7       95.70        perf-profile.calltrace.cycles-pp.__sched_yield
      0.00            +1.0        0.96        perf-profile.calltrace.cycles-pp.rcu_note_context_switch.__schedule.schedule.__x64_sys_sched_yield.do_syscall_64
      5.29            +1.0        6.29        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_safe_stack.__sched_yield
      2.83 ± 10%      +1.2        3.98        perf-profile.calltrace.cycles-pp.testcase
      1.10 ± 11%      +1.8        2.91        perf-profile.calltrace.cycles-pp.migrate_disable_switch.__schedule.schedule.__x64_sys_sched_yield.do_syscall_64
     11.39 ±  2%      +2.3       13.72        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.__sched_yield
     12.33            +2.7       15.06        perf-profile.calltrace.cycles-pp.syscall_return_via_sysret.__sched_yield
     18.07            +4.3       22.40        perf-profile.calltrace.cycles-pp.entry_SYSRETQ_unsafe_stack.__sched_yield
     22.70           -18.9        3.85        perf-profile.children.cycles-pp.pick_task_fair
     23.72           -18.8        4.90        perf-profile.children.cycles-pp.__pick_next_task
     19.20 ±  2%     -17.4        1.84        perf-profile.children.cycles-pp.update_curr
     15.22 ±  5%     -14.1        1.14        perf-profile.children.cycles-pp.update_se
     37.11           -10.6       26.56        perf-profile.children.cycles-pp.__schedule
     37.90           -10.2       27.69        perf-profile.children.cycles-pp.schedule
     43.60           -10.0       33.62        perf-profile.children.cycles-pp.__x64_sys_sched_yield
     47.99            -9.1       38.93        perf-profile.children.cycles-pp.do_syscall_64
     49.19            -8.8       40.39        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      3.64 ±  3%      -0.9        2.73        perf-profile.children.cycles-pp._raw_spin_lock
      1.88 ±  4%      -0.7        1.16        perf-profile.children.cycles-pp.pick_eevdf
      2.22 ± 13%      -0.5        1.70        perf-profile.children.cycles-pp.yield_task_fair
      0.11 ±  4%      +0.0        0.12        perf-profile.children.cycles-pp.arch_scale_cpu_capacity
      0.15 ±  3%      +0.0        0.16 ±  2%  perf-profile.children.cycles-pp.sched_yield@plt
      0.54 ±  2%      +0.1        0.60        perf-profile.children.cycles-pp.pick_next_task
      0.38            +0.1        0.48        perf-profile.children.cycles-pp.arch_exit_to_user_mode_prepare
      0.58 ±  3%      +0.1        0.70 ±  2%  perf-profile.children.cycles-pp.prandom_u32_state
      0.63 ±  7%      +0.2        0.86 ±  4%  perf-profile.children.cycles-pp.x64_sys_call
      2.91 ±  6%      +0.3        3.20        perf-profile.children.cycles-pp.update_rq_clock
      1.49 ±  4%      +0.3        1.81        perf-profile.children.cycles-pp.update_rq_clock_task
      3.23            +0.6        3.80        perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.32 ±  3%      +0.6        0.96        perf-profile.children.cycles-pp.rcu_note_context_switch
      3.43 ±  5%      +1.0        4.42        perf-profile.children.cycles-pp.raw_spin_rq_lock_nested
     95.32            +1.0       96.31        perf-profile.children.cycles-pp.__sched_yield
      2.87 ±  9%      +1.2        4.02        perf-profile.children.cycles-pp.testcase
      1.14 ± 11%      +1.8        2.94        perf-profile.children.cycles-pp.migrate_disable_switch
     12.06 ±  2%      +2.4       14.44        perf-profile.children.cycles-pp.entry_SYSCALL_64
     12.55            +2.8       15.34        perf-profile.children.cycles-pp.syscall_return_via_sysret
     19.54            +4.5       24.03        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      7.17 ± 10%      -6.1        1.10        perf-profile.self.cycles-pp.update_se
      2.77 ±  6%      -2.1        0.66        perf-profile.self.cycles-pp.update_curr
      3.53 ±  3%      -0.9        2.61        perf-profile.self.cycles-pp._raw_spin_lock
      1.82 ±  3%      -0.9        0.96        perf-profile.self.cycles-pp.pick_task_fair
      1.77 ±  4%      -0.7        1.08        perf-profile.self.cycles-pp.pick_eevdf
      2.00 ± 14%      -0.5        1.51        perf-profile.self.cycles-pp.yield_task_fair
      0.64 ± 10%      -0.1        0.55        perf-profile.self.cycles-pp._raw_spin_unlock
      0.11 ±  4%      +0.0        0.12 ±  3%  perf-profile.self.cycles-pp.sched_yield@plt
      0.08 ±  5%      +0.0        0.10        perf-profile.self.cycles-pp.arch_scale_cpu_capacity
      0.22            +0.0        0.24 ±  2%  perf-profile.self.cycles-pp.__x86_indirect_thunk_rax
      0.29 ±  3%      +0.0        0.32        perf-profile.self.cycles-pp.sched_clock
      0.26 ±  5%      +0.1        0.31 ±  2%  perf-profile.self.cycles-pp.__x64_sys_sched_yield
      0.32            +0.1        0.38        perf-profile.self.cycles-pp.sched_clock_cpu
      0.49 ±  2%      +0.1        0.56        perf-profile.self.cycles-pp.pick_next_task
      1.02 ±  2%      +0.1        1.10        perf-profile.self.cycles-pp.__pick_next_task
      0.31 ±  2%      +0.1        0.41        perf-profile.self.cycles-pp.arch_exit_to_user_mode_prepare
      0.44 ±  2%      +0.1        0.55        perf-profile.self.cycles-pp.update_rq_clock
      0.53 ±  3%      +0.1        0.65 ±  2%  perf-profile.self.cycles-pp.prandom_u32_state
      1.17 ±  4%      +0.1        1.31        perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.56 ±  7%      +0.2        0.76 ±  4%  perf-profile.self.cycles-pp.x64_sys_call
      1.25            +0.3        1.52        perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      1.49 ±  3%      +0.3        1.77        perf-profile.self.cycles-pp.do_sched_yield
      1.36 ±  4%      +0.3        1.68        perf-profile.self.cycles-pp.update_rq_clock_task
      0.83 ±  4%      +0.4        1.19        perf-profile.self.cycles-pp.schedule
      2.22 ±  2%      +0.4        2.61        perf-profile.self.cycles-pp.__sched_yield
      2.84 ±  2%      +0.5        3.32 ±  2%  perf-profile.self.cycles-pp.do_syscall_64
      1.16 ±  5%      +0.6        1.72        perf-profile.self.cycles-pp.raw_spin_rq_lock_nested
      0.27 ±  4%      +0.6        0.89        perf-profile.self.cycles-pp.rcu_note_context_switch
      2.47 ± 11%      +1.1        3.54        perf-profile.self.cycles-pp.testcase
      1.14 ± 11%      +1.8        2.93        perf-profile.self.cycles-pp.migrate_disable_switch
     10.66 ±  2%      +2.0       12.68        perf-profile.self.cycles-pp.entry_SYSCALL_64
     12.54            +2.8       15.34        perf-profile.self.cycles-pp.syscall_return_via_sysret
     19.32            +4.4       23.76        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      4.85            +4.6        9.42        perf-profile.self.cycles-pp.__schedule
      0.05 ±  7%     -45.1%       0.03 ±  8%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_yield
     14.27 ± 47%     -99.8%       0.03 ±  7%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.anon_pipe_read.fifo_pipe_read.vfs_read.ksys_read
      5.18 ± 60%     -99.9%       0.01 ± 21%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
      0.03 ± 31%     -72.9%       0.01 ± 36%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group
      0.02 ±  3%     +19.1%       0.03 ±  5%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.__close_nocancel
      0.00 ±223%    +581.8%       0.01 ± 10%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.perf_mmap__read_head.perf_mmap__push
      0.02 ± 58%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__dquot_alloc_space
      0.01 ±  3%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__folio_batch_add_and_move
      0.01          -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__mem_cgroup_charge
      0.01 ±  3%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__percpu_counter_limited_add
      0.02 ± 68%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__vm_enough_memory
      0.01 ± 13%     -75.7%       0.00 ±144%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__x86_indirect_thunk_rax
      0.01 ±  9%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt._find_first_bit
      0.01 ±  7%     -72.6%       0.00 ±100%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt._raw_spin_unlock_irq
      0.01 ±  3%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.alloc_pages_mpol
      0.01 ±  6%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.cap_vm_enough_memory
      0.02 ± 86%    +373.4%       0.11 ± 67%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.do_syscall_64
      0.00 ±223%   +1030.0%       0.02 ± 33%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.fold_vm_zone_numa_events
      0.01 ±  4%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.get_page_from_freelist
      0.01 ±  5%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.get_task_policy
      0.01 ±  9%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.policy_nodemask
      0.01 ±  8%     -52.7%       0.01 ± 50%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.rep_movs_alternative
      0.01 ±  4%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.rmqueue
      0.01 ±  3%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.security_vm_enough_memory_mm
      0.01 ± 18%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.shmem_add_to_page_cache
      0.01          -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.shmem_alloc_and_add_folio
      0.01 ±  3%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.shmem_huge_global_enabled
      0.01 ± 29%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.shmem_inode_acct_blocks
      0.01 ±  6%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.shmem_recalc_inode
      0.01 ±  6%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.try_charge_memcg
      0.01          -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk._raw_spin_unlock.__dquot_alloc_space.shmem_inode_acct_blocks
      0.01 ± 31%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk._raw_spin_unlock.shmem_recalc_inode.shmem_alloc_and_add_folio
     23.13 ±167%     -99.3%       0.15 ±184%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.26 ± 51%     -92.5%       0.02 ± 32%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0
      0.02 ± 18%     -31.1%       0.02 ±  2%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.69 ±102%     -97.8%       0.02 ±  2%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     42.53 ± 76%     -99.8%       0.07 ±  9%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.schedule_timeout.wait_for_completion_state.kernel_clone.__x64_sys_vfork
      0.01 ± 24%     +76.0%       0.01 ± 19%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.wait_for_partner.fifo_open.do_dentry_open.vfs_open
     60.92 ± 64%    -100.0%       0.03 ± 17%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
    819.54 ± 35%     -96.2%      31.04 ± 34%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_yield
      2223 ± 33%    -100.0%       0.89 ± 34%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.anon_pipe_read.fifo_pipe_read.vfs_read.ksys_read
      1841 ± 37%    -100.0%       0.21 ±120%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
      0.87 ± 40%     -77.1%       0.20 ± 36%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group
      0.01 ±101%    +675.0%       0.04 ±140%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.[unknown].record__pushfn
      0.00 ±223%    +872.7%       0.02 ± 35%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.perf_mmap__read_head.perf_mmap__push
      0.09 ±215%   +2143.5%       2.10 ± 38%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.testcase.[unknown]
      0.05 ± 93%   +3188.2%       1.53 ± 50%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_call_function_single.__sched_yield.[unknown]
      0.02 ± 40%     -78.0%       0.00 ±142%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__alloc_frozen_pages_noprof
      0.03 ±101%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__dquot_alloc_space
      0.01 ±  7%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__folio_batch_add_and_move
      0.01 ±  4%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__mem_cgroup_charge
      0.01 ± 17%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__percpu_counter_limited_add
      0.04 ±135%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__vm_enough_memory
      0.02 ± 33%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt._find_first_bit
      0.08 ± 66%     -92.0%       0.01 ±101%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt._raw_spin_unlock_irq
      0.01 ±  4%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.alloc_pages_mpol
      0.01 ± 17%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.cap_vm_enough_memory
      0.05 ±154%     -91.8%       0.00 ±141%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.copy_folio_from_iter_atomic
      0.03 ± 98%   +3184.8%       1.08 ± 58%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.do_syscall_64
      0.00 ±223%   +1240.0%       0.02 ± 36%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.fold_vm_zone_numa_events
      0.01 ± 14%     -85.0%       0.00 ±223%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.get_mem_cgroup_from_mm
      0.01 ± 19%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.get_page_from_freelist
      0.01 ±  4%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.get_task_policy
      0.01 ± 42%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.policy_nodemask
      0.20 ± 29%     -92.6%       0.01 ±  8%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.rep_movs_alternative
      0.01 ± 19%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.rmqueue
      0.01 ± 19%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.security_vm_enough_memory_mm
      0.02 ±104%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.shmem_add_to_page_cache
      0.01 ±  4%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.shmem_alloc_and_add_folio
      0.01 ±  4%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.shmem_huge_global_enabled
      0.03 ±120%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.shmem_inode_acct_blocks
      0.01 ± 19%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.shmem_recalc_inode
      0.01 ± 15%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.try_charge_memcg
      0.01 ±  4%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk._raw_spin_unlock.__dquot_alloc_space.shmem_inode_acct_blocks
      0.03 ±123%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk._raw_spin_unlock.shmem_recalc_inode.shmem_alloc_and_add_folio
      0.05 ±164%     -96.0%       0.00 ±223%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.get_mem_cgroup_from_mm.__mem_cgroup_charge.shmem_alloc_and_add_folio
      0.07 ±117%     -97.0%       0.00 ±223%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.rmqueue.isra.0
      2.19 ± 47%     -86.1%       0.30 ±146%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0
      0.03 ± 15%     -35.7%       0.02 ±  5%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.schedule_timeout.kcompactd.kthread.ret_from_fork
     74.51 ±125%     -99.9%       0.06 ±110%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      1174 ± 76%    -100.0%       0.50 ± 67%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.schedule_timeout.wait_for_completion_state.kernel_clone.__x64_sys_vfork
      1613 ± 40%     -99.9%       1.95 ± 29%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.14 ± 25%     -81.5%       0.03 ±  6%  perf-sched.total_sch_delay.average.ms
      2696 ± 25%     -98.8%      31.04 ± 34%  perf-sched.total_sch_delay.max.ms
      6160 ± 20%     -40.1%       3693 ±  5%  perf-sched.total_wait_and_delay.max.ms
      0.09 ±  7%     -45.1%       0.05 ±  8%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_yield
     22.28           -35.8%      14.30        perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
     50.94 ± 93%     -94.4%       2.84 ±  8%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
    543.23 ± 21%     -60.2%     216.42 ± 13%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0
    730.70 ±  8%     -37.9%     453.62        perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.schedule_timeout.kcompactd.kthread.ret_from_fork
     30.23 ± 11%     -36.0%      19.34 ±  7%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    128.71 ± 75%     -99.6%       0.48 ±223%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.schedule_timeout.wait_for_completion_state.kernel_clone.__x64_sys_vfork
    916.24 ±  3%     -28.3%     657.10        perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    773.11 ± 10%     -18.3%     631.88 ±  5%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      3.00 ± 19%     +66.7%       5.00        perf-sched.wait_and_delay.count.perf_trace_sched_switch.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      7.00 ± 27%     +42.9%      10.00        perf-sched.wait_and_delay.count.perf_trace_sched_switch.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
    181.00           +59.1%     288.00        perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_thunk.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
     11.33 ± 16%     +85.3%      21.00 ± 17%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
     17.00 ±  8%    +243.1%      58.33 ± 15%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0
     11.33 ±  9%     +76.5%      20.00        perf-sched.wait_and_delay.count.perf_trace_sched_switch.schedule_timeout.kcompactd.kthread.ret_from_fork
    139.50 ±  4%     +71.7%     239.50 ±  6%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    214.17           +62.4%     347.83        perf-sched.wait_and_delay.count.perf_trace_sched_switch.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    160.33 ± 17%     +44.9%     232.33 ±  5%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      1639 ± 35%     -96.2%      62.09 ± 34%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_yield
      4016 ± 32%     -75.1%       1001        perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
    261.02 ± 78%     -98.1%       5.00        perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      2669 ± 17%     -62.5%       1001        perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0
      1344 ± 17%     -62.5%     504.84        perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.schedule_timeout.kcompactd.kthread.ret_from_fork
      2512 ± 59%     -99.3%      17.38 ±223%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.schedule_timeout.wait_for_completion_state.kernel_clone.__x64_sys_vfork
      3598 ± 11%     -72.0%       1007        perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.05 ±  7%     -45.1%       0.03 ±  8%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_yield
      2.56 ±221%     -99.7%       0.01 ± 36%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group
      0.02 ±  3%     +19.1%       0.03 ±  5%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.__close_nocancel
      0.01 ±101%  +1.4e+05%       7.62 ± 67%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.[unknown].record__pushfn
      0.00 ±223%  +1.6e+05%       2.89 ±127%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.perf_mmap__read_head.perf_mmap__push
      0.01 ±  5%    -100.0%       0.00        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__alloc_frozen_pages_noprof
      0.02 ± 58%    -100.0%       0.00        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__dquot_alloc_space
      0.01          -100.0%       0.00        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__mem_cgroup_charge
      0.02 ± 86%  +21394.4%       5.12 ±102%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.do_syscall_64
      0.01 ±  5%    -100.0%       0.00        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.get_task_policy
      0.01 ±  6%    -100.0%       0.00        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.percpu_counter_add_batch
      0.01 ±  9%    -100.0%       0.00        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.policy_nodemask
      0.01 ±  8%  +7.5e+05%      92.34 ± 35%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.rep_movs_alternative
      0.01 ±  3%    -100.0%       0.00        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.security_vm_enough_memory_mm
      0.01 ± 18%    -100.0%       0.00        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.shmem_add_to_page_cache
      0.01          -100.0%       0.00        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.shmem_alloc_and_add_folio
      0.01 ±  3%    -100.0%       0.00        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.shmem_huge_global_enabled
      0.01 ±  6%    -100.0%       0.00        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.shmem_recalc_inode
      0.01 ±  3%  +7.4e+05%      82.10 ± 97%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.shmem_write_end
      0.01 ±  4%  +7.3e+05%      84.24 ±108%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.__folio_batch_add_and_move.shmem_alloc_and_add_folio.shmem_get_folio_gfp
      0.01 ± 31%    -100.0%       0.00        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk._raw_spin_unlock.shmem_recalc_inode.shmem_alloc_and_add_folio
     22.20           -35.8%      14.24        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      0.01 ±  6%    +2e+05%      23.34 ±115%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.filemap_get_entry.shmem_get_folio_gfp.shmem_write_begin
     50.64 ± 94%     -94.4%       2.82 ±  8%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
    542.97 ± 21%     -60.1%     216.40 ± 13%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0
    730.68 ±  8%     -37.9%     453.60        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.schedule_timeout.kcompactd.kthread.ret_from_fork
     29.54 ± 10%     -34.6%      19.32 ±  7%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     86.19 ± 80%     -97.9%       1.78 ± 32%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.schedule_timeout.wait_for_completion_state.kernel_clone.__x64_sys_vfork
    916.23 ±  3%     -28.3%     657.09        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    712.19 ±  6%     -11.3%     631.85 ±  5%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
    819.54 ± 35%     -96.2%      31.04 ± 34%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_yield
      2343 ± 20%     -57.3%       1001        perf-sched.wait_time.max.ms.perf_trace_sched_switch.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
    163.87 ±222%     -99.9%       0.20 ± 36%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group
      0.01 ±101%  +1.6e+06%      87.45 ± 79%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.[unknown].record__pushfn
      0.00 ±223%    +2e+06%      36.36 ±104%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.perf_mmap__read_head.perf_mmap__push
      0.09 ±215%   +2143.5%       2.10 ± 38%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.testcase.[unknown]
      0.05 ± 93%   +3188.2%       1.53 ± 50%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_call_function_single.__sched_yield.[unknown]
      0.02 ± 40%    -100.0%       0.00        perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__alloc_frozen_pages_noprof
      0.03 ±101%    -100.0%       0.00        perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__dquot_alloc_space
      0.01 ±  4%    -100.0%       0.00        perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__mem_cgroup_charge
      0.03 ± 98%    +3e+05%      98.50 ± 89%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.do_syscall_64
      0.01 ± 14%     -85.0%       0.00 ±223%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.get_mem_cgroup_from_mm
      0.01 ±  4%    -100.0%       0.00        perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.get_task_policy
      0.01 ±  4%    -100.0%       0.00        perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.percpu_counter_add_batch
      0.01 ± 42%    -100.0%       0.00        perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.policy_nodemask
      0.20 ± 29%  +1.2e+05%     237.47 ± 19%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.rep_movs_alternative
      0.01 ± 19%    -100.0%       0.00        perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.security_vm_enough_memory_mm
      0.02 ±104%    -100.0%       0.00        perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.shmem_add_to_page_cache
      0.01 ±  4%    -100.0%       0.00        perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.shmem_alloc_and_add_folio
      0.01 ±  4%    -100.0%       0.00        perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.shmem_huge_global_enabled
      0.01 ± 19%    -100.0%       0.00        perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.shmem_recalc_inode
      0.03 ±123%    -100.0%       0.00        perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_thunk._raw_spin_unlock.shmem_recalc_inode.shmem_alloc_and_add_folio
      0.05 ±164%     -96.0%       0.00 ±223%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.get_mem_cgroup_from_mm.__mem_cgroup_charge.shmem_alloc_and_add_folio
    260.99 ± 78%     -98.1%       4.99        perf-sched.wait_time.max.ms.perf_trace_sched_switch.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      2669 ± 17%     -62.5%       1000        perf-sched.wait_time.max.ms.perf_trace_sched_switch.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0
      1344 ± 17%     -62.5%     504.82        perf-sched.wait_time.max.ms.perf_trace_sched_switch.schedule_timeout.kcompactd.kthread.ret_from_fork
      1673 ± 44%     -98.1%      31.64 ±126%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.schedule_timeout.wait_for_completion_state.kernel_clone.__x64_sys_vfork
      3598 ± 11%     -72.0%       1007        perf-sched.wait_time.max.ms.perf_trace_sched_switch.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm



***************************************************************************************************

=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-14/performance/x86_64-rhel-9.4/thread/100%/debian-13-x86_64-20250902.cgz/lkp-ivb-2ep2/sched_yield/will-it-scale

commit: 
  fb1050ac8e ("sched/fair: Change the default cgroup_mode to concur")
  85570f10a4 ("sched/eevdf: Move to a single runqueue")

fb1050ac8e40aaa0 85570f10a4c61372c1d437365b9 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
  44248290           +26.0%   55748460        will-it-scale.48.threads
    921838           +26.0%    1161425        will-it-scale.per_thread_ops
  44248290           +26.0%   55748460        will-it-scale.workload
     57.80 ±  2%      -7.1       50.74        mpstat.cpu.all.sys%
     40.32 ±  2%      +6.3       46.64        mpstat.cpu.all.usr%
   2365820 ±  5%     -84.1%     375141 ±  7%  numa-numastat.node1.local_node
   2397470 ±  5%     -83.3%     399466 ±  3%  numa-numastat.node1.numa_hit
    250.50 ± 19%     -97.5%       6.33 ± 32%  perf-c2c.DRAM.local
     15.67 ± 26%     +80.9%      28.33 ± 17%  perf-c2c.DRAM.remote
     13.67 ± 33%     +75.6%      24.00 ± 19%  perf-c2c.HITM.remote
     40.07 ±  2%     +15.7%      46.37        vmstat.cpu.us
  11987470           -63.2%    4416390        vmstat.memory.cache
  52423303           +15.0%   60272523        vmstat.memory.free
    235933 ± 26%     -82.2%      42090 ± 16%  vmstat.system.cs
    171.70            -4.0%     164.78        turbostat.CorWatt
      0.46           -25.5%       0.34        turbostat.IPC
      0.05 ±223%   +1415.6%       0.81 ± 60%  turbostat.Pkg%pc6
    201.29            -3.5%     194.25        turbostat.PkgWatt
     11.26            -4.7%      10.73        turbostat.RAMWatt
    233071 ± 26%     -83.5%      38531 ± 17%  perf-stat.i.context-switches
    118.81 ±  2%      -7.7%     109.66        perf-stat.i.cpu-migrations
      3782 ±  9%     -41.5%       2213        perf-stat.i.minor-faults
      3782 ±  9%     -41.5%       2213        perf-stat.i.page-faults
    237694 ± 26%     -82.2%      42351 ± 16%  perf-stat.ps.context-switches
    118.17 ±  2%      -7.7%     109.06        perf-stat.ps.cpu-migrations
      3762 ±  9%     -41.4%       2205        perf-stat.ps.minor-faults
      3762 ±  9%     -41.4%       2205        perf-stat.ps.page-faults
      6504 ±  3%      -9.4%       5892 ±  7%  numa-meminfo.node0.KernelStack
      5635 ± 27%     -25.3%       4208 ±  5%  numa-meminfo.node0.PageTables
   8166183 ±  2%     -94.6%     444695 ± 56%  numa-meminfo.node1.Active
   8166183 ±  2%     -94.6%     444695 ± 56%  numa-meminfo.node1.Active(anon)
   9809234 ± 19%     -76.6%    2297968 ± 80%  numa-meminfo.node1.FilePages
   3816540           -98.8%      43932 ± 84%  numa-meminfo.node1.Mapped
  22354193 ±  8%     +34.9%   30155628 ±  6%  numa-meminfo.node1.MemFree
  10623570 ± 17%     -73.4%    2822139 ± 67%  numa-meminfo.node1.MemUsed
     10748 ± 14%     -62.6%       4020 ±  4%  numa-meminfo.node1.PageTables
   7764173           -97.2%     215604 ± 24%  numa-meminfo.node1.Shmem
     74.32 ± 66%     -71.6%      21.07 ±187%  numa-vmstat.node0.nr_inactive_file
      6504 ±  3%      -9.4%       5894 ±  7%  numa-vmstat.node0.nr_kernel_stack
      1408 ± 27%     -25.3%       1052 ±  5%  numa-vmstat.node0.nr_page_table_pages
     74.32 ± 66%     -71.6%      21.07 ±187%  numa-vmstat.node0.nr_zone_inactive_file
   2041644 ±  2%     -94.6%     111186 ± 56%  numa-vmstat.node1.nr_active_anon
   2452402 ± 19%     -76.6%     574501 ± 80%  numa-vmstat.node1.nr_file_pages
   5588467 ±  8%     +34.9%    7538888 ±  6%  numa-vmstat.node1.nr_free_pages
   5564841 ±  8%     +34.9%    7508898 ±  6%  numa-vmstat.node1.nr_free_pages_blocks
    954624           -98.8%      11011 ± 83%  numa-vmstat.node1.nr_mapped
      2688 ± 14%     -62.6%       1005 ±  4%  numa-vmstat.node1.nr_page_table_pages
   1941136           -97.2%      53910 ± 24%  numa-vmstat.node1.nr_shmem
   2041643 ±  2%     -94.6%     111186 ± 56%  numa-vmstat.node1.nr_zone_active_anon
   2397612 ±  5%     -83.3%     399593 ±  3%  numa-vmstat.node1.numa_hit
   2365963 ±  5%     -84.1%     375268 ±  7%  numa-vmstat.node1.numa_local
   8540663           -89.2%     922445 ±  5%  meminfo.Active
   8540663           -89.2%     922445 ±  5%  meminfo.Active(anon)
    265675 ±  2%      +6.1%     281868 ±  2%  meminfo.AnonHugePages
    735989            -9.2%     668368        meminfo.AnonPages
  11882422           -63.5%    4331840        meminfo.Cached
   9034673           -84.5%    1402735 ±  3%  meminfo.Committed_AS
    101546           -17.1%      84168        meminfo.KReclaimable
   3861557           -97.8%      84679        meminfo.Mapped
  52125825           +15.0%   59963446        meminfo.MemAvailable
  52426262           +15.0%   60272575        meminfo.MemFree
  13427693           -58.4%    5581384        meminfo.Memused
     16381           -49.8%       8225        meminfo.PageTables
    101546           -17.1%      84168        meminfo.SReclaimable
   7805134           -96.7%     254552 ± 18%  meminfo.Shmem
    209730            -8.9%     191020        meminfo.Slab
  13502940           -55.6%    5993056        meminfo.max_used_kB
   2135012           -89.2%     230632 ±  5%  proc-vmstat.nr_active_anon
    184004            -9.2%     167096        proc-vmstat.nr_anon_pages
   1299987           +15.1%    1495842        proc-vmstat.nr_dirty_background_threshold
   2603154           +15.1%    2995342        proc-vmstat.nr_dirty_threshold
   2970446           -63.5%    1082977        proc-vmstat.nr_file_pages
  13106698           +15.0%   15068119        proc-vmstat.nr_free_pages
  13028329           +14.9%   14973613        proc-vmstat.nr_free_pages_blocks
    964644           -97.8%      21193        proc-vmstat.nr_mapped
      4094           -49.8%       2056        proc-vmstat.nr_page_table_pages
   1951123           -96.7%      63654 ± 18%  proc-vmstat.nr_shmem
     25386           -17.1%      21042        proc-vmstat.nr_slab_reclaimable
   2135012           -89.2%     230632 ±  5%  proc-vmstat.nr_zone_active_anon
    339894 ± 29%     -98.3%       5712 ± 22%  proc-vmstat.numa_hint_faults
    332947 ± 27%     -98.8%       3855 ± 23%  proc-vmstat.numa_hint_faults_local
   2861300           -74.6%     725484 ±  2%  proc-vmstat.numa_hit
   2811514           -76.0%     675726 ±  2%  proc-vmstat.numa_local
    354293 ± 31%     -92.2%      27493 ±107%  proc-vmstat.numa_pte_updates
   3011200           -70.6%     884695 ±  2%  proc-vmstat.pgalloc_normal
   1269196 ±  8%     -37.2%     796422        proc-vmstat.pgfault
    725871 ±  4%      +9.3%     793121        proc-vmstat.pgfree
    153744          +193.4%     451104 ± 11%  sched_debug.cfs_rq:/.avg_vruntime.avg
    180997 ±  5%   +2565.7%    4824797 ±  8%  sched_debug.cfs_rq:/.avg_vruntime.max
      5747 ± 17%  +15420.4%     891976 ± 12%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      0.35 ±  3%      -8.6%       0.32 ±  6%  sched_debug.cfs_rq:/.h_nr_queued.stddev
      0.34 ±  3%      -8.5%       0.32 ±  6%  sched_debug.cfs_rq:/.h_nr_runnable.stddev
    144.43 ±141%   +7020.9%      10284 ± 80%  sched_debug.cfs_rq:/.left_deadline.avg
      6932 ±141%   +6534.6%     459956 ± 88%  sched_debug.cfs_rq:/.left_deadline.max
    990.16 ±141%   +6684.0%      67172 ± 85%  sched_debug.cfs_rq:/.left_deadline.stddev
    144.32 ±141%   +7026.5%      10284 ± 80%  sched_debug.cfs_rq:/.left_vruntime.avg
      6927 ±141%   +6539.8%     459954 ± 88%  sched_debug.cfs_rq:/.left_vruntime.max
    989.39 ±141%   +6689.3%      67172 ± 85%  sched_debug.cfs_rq:/.left_vruntime.stddev
    144.32 ±141%   +7026.5%      10284 ± 80%  sched_debug.cfs_rq:/.right_vruntime.avg
      6927 ±141%   +6539.8%     459955 ± 88%  sched_debug.cfs_rq:/.right_vruntime.max
    989.39 ±141%   +6689.3%      67172 ± 85%  sched_debug.cfs_rq:/.right_vruntime.stddev
      1879 ±  3%     -36.2%       1199 ±  5%  sched_debug.cfs_rq:/.runnable_avg.max
    177.05 ±  8%     -60.1%      70.72 ± 20%  sched_debug.cfs_rq:/.runnable_avg.stddev
    522.36 ±140%   +7174.9%      38001 ± 14%  sched_debug.cfs_rq:/.sum_weight.avg
     25073 ±140%   +6468.6%    1646971 ±  6%  sched_debug.cfs_rq:/.sum_weight.max
      3581 ±140%   +6655.0%     241904 ±  7%  sched_debug.cfs_rq:/.sum_weight.stddev
      1180 ±  5%      -8.3%       1082 ±  3%  sched_debug.cfs_rq:/.util_avg.max
    693.25 ± 14%     +20.0%     831.75        sched_debug.cfs_rq:/.util_avg.min
      1637 ±  8%     -31.6%       1119 ±  3%  sched_debug.cfs_rq:/.util_est.max
    171.19 ± 86%    +207.6%     526.58 ± 42%  sched_debug.cfs_rq:/.util_est.min
    195.99 ±  3%     -43.0%     111.76 ± 35%  sched_debug.cfs_rq:/.util_est.stddev
    153744          +193.4%     451104 ± 11%  sched_debug.cfs_rq:/.zero_vruntime.avg
    180996 ±  5%   +2565.7%    4824797 ±  8%  sched_debug.cfs_rq:/.zero_vruntime.max
      5747 ± 17%  +15420.4%     891976 ± 12%  sched_debug.cfs_rq:/.zero_vruntime.stddev
      0.34 ±  3%      -7.6%       0.32 ±  5%  sched_debug.cpu.nr_running.stddev
    732651 ± 24%     -71.0%     212248 ± 17%  sched_debug.cpu.nr_switches.avg
   5257514 ± 27%     -38.0%    3259771 ±  8%  sched_debug.cpu.nr_switches.max
      3552 ± 22%     -38.0%       2202 ± 11%  sched_debug.cpu.nr_switches.min
   1153497 ± 29%     -46.5%     616874 ± 12%  sched_debug.cpu.nr_switches.stddev
     24.18 ±  3%     -19.4        4.82        perf-profile.calltrace.cycles-pp.__pick_next_task.__schedule.schedule.__x64_sys_sched_yield.do_syscall_64
     23.02 ±  4%     -19.3        3.69        perf-profile.calltrace.cycles-pp.pick_task_fair.__pick_next_task.__schedule.schedule.__x64_sys_sched_yield
     19.47 ±  5%     -17.7        1.75        perf-profile.calltrace.cycles-pp.update_curr.pick_task_fair.__pick_next_task.__schedule.schedule
     15.38 ±  9%     -14.2        1.20        perf-profile.calltrace.cycles-pp.update_se.update_curr.pick_task_fair.__pick_next_task.__schedule
     36.78 ±  2%     -11.2       25.56        perf-profile.calltrace.cycles-pp.__schedule.schedule.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe
     37.81 ±  2%     -10.9       26.95        perf-profile.calltrace.cycles-pp.schedule.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_yield
     43.50 ±  2%     -10.8       32.73        perf-profile.calltrace.cycles-pp.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_yield
     47.78 ±  2%      -9.8       37.95        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_yield
     49.18 ±  2%      -9.6       39.61        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__sched_yield
      1.81 ±  7%      -0.7        1.13        perf-profile.calltrace.cycles-pp.pick_eevdf.pick_task_fair.__pick_next_task.__schedule.schedule
      0.54            +0.1        0.60        perf-profile.calltrace.cycles-pp.pick_next_task.__schedule.schedule.__x64_sys_sched_yield.do_syscall_64
      0.57 ±  4%      +0.1        0.65        perf-profile.calltrace.cycles-pp.prandom_u32_state.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_yield
      0.62 ±  7%      +0.1        0.76 ±  5%  perf-profile.calltrace.cycles-pp.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_yield
      0.94 ±  3%      +0.2        1.13        perf-profile.calltrace.cycles-pp._raw_spin_lock.raw_spin_rq_lock_nested.do_sched_yield.__x64_sys_sched_yield.do_syscall_64
      2.03 ±  7%      +0.2        2.25        perf-profile.calltrace.cycles-pp.sched_clock.sched_clock_cpu.update_rq_clock.__schedule.schedule
      2.34 ±  7%      +0.3        2.60        perf-profile.calltrace.cycles-pp.sched_clock_cpu.update_rq_clock.__schedule.schedule.__x64_sys_sched_yield
      1.49 ±  5%      +0.3        1.80        perf-profile.calltrace.cycles-pp.update_rq_clock_task.__schedule.schedule.__x64_sys_sched_yield.do_syscall_64
      1.39 ±  2%      +0.3        1.70        perf-profile.calltrace.cycles-pp.raw_spin_rq_lock_nested.do_sched_yield.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.76 ±  5%      +0.4        3.14        perf-profile.calltrace.cycles-pp.update_rq_clock.__schedule.schedule.__x64_sys_sched_yield.do_syscall_64
      1.18 ±  8%      +0.4        1.61        perf-profile.calltrace.cycles-pp._raw_spin_lock.raw_spin_rq_lock_nested.__schedule.schedule.__x64_sys_sched_yield
      0.00            +0.9        0.89        perf-profile.calltrace.cycles-pp.rcu_note_context_switch.__schedule.schedule.__x64_sys_sched_yield.do_syscall_64
      1.69 ±  9%      +0.9        2.63        perf-profile.calltrace.cycles-pp.raw_spin_rq_lock_nested.__schedule.schedule.__x64_sys_sched_yield.do_syscall_64
      5.24            +1.1        6.33        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_safe_stack.__sched_yield
      2.61 ± 13%      +1.1        3.70        perf-profile.calltrace.cycles-pp.testcase
      0.80 ± 16%      +2.0        2.80        perf-profile.calltrace.cycles-pp.migrate_disable_switch.__schedule.schedule.__x64_sys_sched_yield.do_syscall_64
     11.18 ±  2%      +2.5       13.66        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.__sched_yield
     12.23            +3.0       15.19        perf-profile.calltrace.cycles-pp.syscall_return_via_sysret.__sched_yield
     18.23 ±  2%      +4.7       22.88        perf-profile.calltrace.cycles-pp.entry_SYSRETQ_unsafe_stack.__sched_yield
     23.24 ±  4%     -19.4        3.87        perf-profile.children.cycles-pp.pick_task_fair
     24.28 ±  3%     -19.3        4.93        perf-profile.children.cycles-pp.__pick_next_task
     19.72 ±  5%     -17.8        1.87        perf-profile.children.cycles-pp.update_curr
     15.63 ±  9%     -14.4        1.23        perf-profile.children.cycles-pp.update_se
     37.10 ±  2%     -11.2       25.93        perf-profile.children.cycles-pp.__schedule
     37.92 ±  2%     -10.9       27.07        perf-profile.children.cycles-pp.schedule
     43.74 ±  2%     -10.7       33.03        perf-profile.children.cycles-pp.__x64_sys_sched_yield
     48.09 ±  2%      -9.8       38.31        perf-profile.children.cycles-pp.do_syscall_64
     49.32 ±  2%      -9.6       39.76        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      3.92 ± 13%      -1.1        2.80        perf-profile.children.cycles-pp._raw_spin_lock
      1.89 ±  7%      -0.7        1.18        perf-profile.children.cycles-pp.pick_eevdf
      0.54            +0.1        0.61        perf-profile.children.cycles-pp.pick_next_task
      0.59 ±  4%      +0.1        0.68        perf-profile.children.cycles-pp.prandom_u32_state
      0.37 ±  2%      +0.1        0.48 ±  2%  perf-profile.children.cycles-pp.arch_exit_to_user_mode_prepare
      0.67 ±  6%      +0.2        0.82 ±  4%  perf-profile.children.cycles-pp.x64_sys_call
      2.40 ±  6%      +0.3        2.69        perf-profile.children.cycles-pp.sched_clock_cpu
      1.52 ±  5%      +0.3        1.82        perf-profile.children.cycles-pp.update_rq_clock_task
      2.84 ±  5%      +0.4        3.23        perf-profile.children.cycles-pp.update_rq_clock
      0.30 ±  8%      +0.6        0.89        perf-profile.children.cycles-pp.rcu_note_context_switch
      3.21 ±  2%      +0.6        3.82        perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      2.67 ± 10%      +1.1        3.74        perf-profile.children.cycles-pp.testcase
     95.50            +1.1       96.61        perf-profile.children.cycles-pp.__sched_yield
      3.17 ±  5%      +1.3        4.46        perf-profile.children.cycles-pp.raw_spin_rq_lock_nested
      0.84 ± 16%      +2.0        2.84        perf-profile.children.cycles-pp.migrate_disable_switch
     11.82 ±  3%      +2.6       14.39        perf-profile.children.cycles-pp.entry_SYSCALL_64
     12.45            +3.0       15.47        perf-profile.children.cycles-pp.syscall_return_via_sysret
     19.73 ±  4%      +4.8       24.54        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      6.88 ± 19%      -5.7        1.15        perf-profile.self.cycles-pp.update_se
      2.78 ±  6%      -2.1        0.64        perf-profile.self.cycles-pp.update_curr
      3.78 ± 14%      -1.1        2.65        perf-profile.self.cycles-pp._raw_spin_lock
      1.84 ±  6%      -0.9        0.96        perf-profile.self.cycles-pp.pick_task_fair
      1.78 ±  7%      -0.7        1.08        perf-profile.self.cycles-pp.pick_eevdf
      0.08 ±  8%      +0.0        0.10 ±  5%  perf-profile.self.cycles-pp.sched_yield@plt
      0.04 ± 44%      +0.0        0.06        perf-profile.self.cycles-pp.sched_clock_noinstr
      0.23 ±  4%      +0.0        0.25 ±  3%  perf-profile.self.cycles-pp.__x86_indirect_thunk_rax
      0.25 ±  6%      +0.1        0.30 ±  2%  perf-profile.self.cycles-pp.__x64_sys_sched_yield
      0.32 ±  2%      +0.1        0.38        perf-profile.self.cycles-pp.sched_clock_cpu
      0.49            +0.1        0.57        perf-profile.self.cycles-pp.pick_next_task
      0.54 ±  5%      +0.1        0.62 ±  2%  perf-profile.self.cycles-pp.prandom_u32_state
      0.45 ±  2%      +0.1        0.55        perf-profile.self.cycles-pp.update_rq_clock
      0.30 ±  2%      +0.1        0.41 ±  2%  perf-profile.self.cycles-pp.arch_exit_to_user_mode_prepare
      0.60 ±  6%      +0.1        0.74 ±  5%  perf-profile.self.cycles-pp.x64_sys_call
      1.17 ±  6%      +0.1        1.32        perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      1.28 ± 10%      +0.2        1.52        perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      1.39 ±  5%      +0.3        1.70        perf-profile.self.cycles-pp.update_rq_clock_task
      0.85 ± 12%      +0.3        1.18        perf-profile.self.cycles-pp.schedule
      0.26 ± 10%      +0.6        0.82 ±  2%  perf-profile.self.cycles-pp.rcu_note_context_switch
      2.39 ±  3%      +0.6        2.96        perf-profile.self.cycles-pp.__sched_yield
      2.75            +0.6        3.35 ±  3%  perf-profile.self.cycles-pp.do_syscall_64
      1.05 ±  6%      +0.7        1.72        perf-profile.self.cycles-pp.raw_spin_rq_lock_nested
      2.28 ± 14%      +1.0        3.25        perf-profile.self.cycles-pp.testcase
      0.83 ± 15%      +2.0        2.83        perf-profile.self.cycles-pp.migrate_disable_switch
     10.42 ±  3%      +2.2       12.61        perf-profile.self.cycles-pp.entry_SYSCALL_64
     12.44            +3.0       15.47        perf-profile.self.cycles-pp.syscall_return_via_sysret
      4.87 ±  4%      +4.0        8.86        perf-profile.self.cycles-pp.__schedule
     19.52 ±  4%      +4.7       24.26        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.02 ±  6%     -14.4%       0.02 ±  6%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     10.88 ± 44%     -99.7%       0.03 ±  9%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.anon_pipe_read.fifo_pipe_read.vfs_read.ksys_read
      3.09 ± 58%     -99.7%       0.01 ± 17%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
      0.17 ± 90%     -91.0%       0.02 ±  3%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.03 ± 26%     -80.1%       0.01 ± 23%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group
      0.10 ± 29%     -38.5%       0.06 ± 41%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.01 ±  6%     +64.1%       0.02 ± 68%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.02 ±  6%     +43.0%       0.03 ± 10%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.__close_nocancel
      0.01 ± 15%     +47.5%       0.01 ±  5%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.[unknown]
      0.01 ± 71%    +135.9%       0.02 ± 20%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt._IO_fwrite
      0.01 ± 45%     +52.7%       0.01 ±  5%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.__mbrtowc.[unknown]
      0.06 ± 37%    +112.0%       0.12 ± 17%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.__sched_yield
      0.00 ±141%    +643.5%       0.03 ± 59%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_call_function_single.testcase
      0.01 ± 18%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__dquot_alloc_space
      0.01 ±  5%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__folio_batch_add_and_move
      0.01 ± 16%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__percpu_counter_limited_add
      0.01 ±  4%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__vm_enough_memory
      0.01 ± 10%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt._find_first_bit
      0.01 ±  4%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.cap_vm_enough_memory
      0.01 ±  6%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.copy_folio_from_iter_atomic
      0.01 ±  3%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.folio_mapping
      0.01 ±  4%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.get_mem_cgroup_from_mm
      0.03 ±133%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.get_page_from_freelist
      0.01 ±  4%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.noop_dirty_folio
      0.01 ±  4%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.percpu_counter_add_batch
      0.01 ± 12%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.security_vm_enough_memory_mm
      0.01 ±  4%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.shmem_add_to_page_cache
      0.01 ±  6%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.shmem_alloc_and_add_folio
      0.02 ±119%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.shmem_alloc_folio
      0.01          -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.shmem_huge_global_enabled
      0.01 ±  9%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.shmem_inode_acct_blocks
      0.01 ±  4%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.static_key_count
      0.01 ±  4%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.try_charge_memcg
      0.01 ±  4%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk._raw_spin_unlock.shmem_recalc_inode.shmem_alloc_and_add_folio
      0.85 ±204%     -96.7%       0.03 ± 30%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      0.01 ± 34%    +104.5%       0.02 ± 15%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.cpu_stop_queue_work.stop_one_cpu.sched_exec
      0.01 ±  4%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.rmqueue.isra.0
      0.01 ± 38%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.try_charge_memcg.charge_memcg.__mem_cgroup_charge
      0.00 ±141%    +510.0%       0.02 ± 33%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.try_to_unlazy.complete_walk.do_open
      0.52 ±132%     -89.1%       0.06 ±121%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.28 ± 17%     -93.8%       0.02 ± 17%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0
      0.04 ± 71%     -64.2%       0.02 ±  3%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.48 ± 54%     -96.4%       0.02 ±  2%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     25.36 ± 61%     -99.7%       0.07 ± 10%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.schedule_timeout.wait_for_completion_state.kernel_clone.__x64_sys_vfork
      0.01           +20.0%       0.01        perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     24.64 ± 27%     -99.9%       0.02 ± 15%  perf-sched.sch_delay.avg.ms.perf_trace_sched_switch.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
    790.48 ± 40%     -98.1%      14.82 ± 74%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_yield
      1839 ± 37%    -100.0%       0.82 ± 17%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.anon_pipe_read.fifo_pipe_read.vfs_read.ksys_read
      1339 ± 35%    -100.0%       0.09 ± 86%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
      0.69 ±108%     -97.4%       0.02 ±  9%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      1.04 ± 43%     -86.1%       0.14 ± 33%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group
      0.02 ±  9%     +68.1%       0.04 ± 24%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.__close_nocancel
      0.01 ± 71%    +143.6%       0.02 ± 19%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt._IO_fwrite
      0.39 ± 55%    +494.9%       2.35 ± 20%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.__sched_yield
      0.10 ±197%    +923.8%       1.07 ± 47%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.testcase
      0.08 ±139%   +2803.5%       2.22 ± 10%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_call_function_single.__sched_yield
      0.00 ±141%   +2991.3%       0.12 ±125%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_call_function_single.testcase
      0.01 ± 25%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__dquot_alloc_space
      0.01 ± 38%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__folio_batch_add_and_move
      0.02 ±100%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__percpu_counter_limited_add
      0.01 ±  3%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__vm_enough_memory
      0.01 ± 25%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt._find_first_bit
      0.08 ± 76%     -90.0%       0.01 ±101%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt._raw_spin_unlock_irq
      0.01          -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.cap_vm_enough_memory
      0.02 ± 46%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.copy_folio_from_iter_atomic
      0.01 ± 12%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.folio_mapping
      0.01 ±  7%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.get_mem_cgroup_from_mm
      0.04 ±144%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.get_page_from_freelist
      0.01 ±  6%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.noop_dirty_folio
      0.01 ±  3%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.percpu_counter_add_batch
      0.19 ± 18%     -91.9%       0.02 ± 47%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.rep_movs_alternative
      0.01 ± 18%     -85.2%       0.00 ±223%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.rmqueue
      0.02 ± 45%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.security_vm_enough_memory_mm
      0.01 ± 13%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.shmem_add_to_page_cache
      0.01 ± 20%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.shmem_alloc_and_add_folio
      0.04 ±154%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.shmem_alloc_folio
      0.01 ± 17%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.shmem_huge_global_enabled
      0.01 ± 23%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.shmem_inode_acct_blocks
      0.06 ± 80%     -87.0%       0.01 ±101%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.shmem_write_end
      0.01 ± 11%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.static_key_count
      0.01 ± 11%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.try_charge_memcg
      0.06 ±125%     -95.9%       0.00 ±223%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.__folio_batch_add_and_move.shmem_alloc_and_add_folio.shmem_get_folio_gfp
      0.01 ± 11%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk._raw_spin_unlock.shmem_recalc_inode.shmem_alloc_and_add_folio
      0.02 ± 21%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.rmqueue.isra.0
      0.03 ±123%    -100.0%       0.00        perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.try_charge_memcg.charge_memcg.__mem_cgroup_charge
      0.00 ±141%    +538.1%       0.02 ± 39%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.try_to_unlazy.complete_walk.do_open
      5.02 ±133%     -99.5%       0.02 ±  3%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      2.48 ± 22%     -98.5%       0.04 ± 57%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0
      0.35 ±128%     -94.4%       0.02 ±  7%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.schedule_timeout.kcompactd.kthread.ret_from_fork
     46.68 ± 89%     -99.9%       0.06 ± 90%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    839.43 ± 44%     -99.9%       0.52 ± 76%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.schedule_timeout.wait_for_completion_state.kernel_clone.__x64_sys_vfork
      1430 ± 28%    -100.0%       0.57 ± 62%  perf-sched.sch_delay.max.ms.perf_trace_sched_switch.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.10 ± 23%     -51.7%       0.05 ± 42%  perf-sched.total_sch_delay.average.ms
      2174 ± 17%     -99.3%      14.82 ± 74%  perf-sched.total_sch_delay.max.ms
      5331 ± 14%     -37.6%       3328 ± 14%  perf-sched.total_wait_and_delay.max.ms
     66.19 ± 40%     -99.3%       0.49 ±223%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
    644.48 ±  6%     -29.6%     453.59        perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.schedule_timeout.kcompactd.kthread.ret_from_fork
     91.67 ± 21%     -98.5%       1.37 ± 45%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.schedule_timeout.wait_for_completion_state.kernel_clone.__x64_sys_vfork
    822.72           -20.9%     650.76        perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    755.80 ±  5%     -27.8%     545.45 ± 10%  perf-sched.wait_and_delay.avg.ms.perf_trace_sched_switch.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      3.50 ± 14%     +42.9%       5.00        perf-sched.wait_and_delay.count.perf_trace_sched_switch.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      8.50 ±  5%     +17.6%      10.00        perf-sched.wait_and_delay.count.perf_trace_sched_switch.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
    212.17           +35.7%     288.00        perf-sched.wait_and_delay.count.perf_trace_sched_switch.preempt_schedule_thunk.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
     17.83 ±  3%    +115.9%      38.50 ± 61%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0
     13.50 ±  9%     +48.1%      20.00        perf-sched.wait_and_delay.count.perf_trace_sched_switch.schedule_timeout.kcompactd.kthread.ret_from_fork
    172.83 ±  7%     +38.8%     239.83 ±  3%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    252.83           +37.6%     347.83        perf-sched.wait_and_delay.count.perf_trace_sched_switch.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    154.50 ± 14%     +70.3%     263.17 ± 14%  perf-sched.wait_and_delay.count.perf_trace_sched_switch.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      1580 ± 40%     -98.1%      29.64 ± 74%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_yield
      4684 ± 29%     -69.7%       1417 ± 65%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.anon_pipe_read.fifo_pipe_read.vfs_read.ksys_read
      3181 ± 33%     -68.5%       1000        perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
      1500 ± 33%     -33.4%       1000        perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
    540.51 ± 33%     -99.8%       0.84 ±223%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      2335 ± 20%     -57.1%       1000        perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0
      1009           -50.0%     505.00        perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.schedule_timeout.kcompactd.kthread.ret_from_fork
      1511 ± 33%     -99.8%       3.74 ± 45%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.schedule_timeout.wait_for_completion_state.kernel_clone.__x64_sys_vfork
      3310 ± 12%     -69.6%       1006        perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      4203 ± 15%     -34.9%       2734 ± 27%  perf-sched.wait_and_delay.max.ms.perf_trace_sched_switch.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      9.84 ±173%     -99.9%       0.01 ± 23%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group
      0.02 ±  6%     +42.2%       0.03 ± 10%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.__close_nocancel
      0.01 ± 77%    +170.6%       0.02 ± 20%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt._IO_fwrite
      0.06 ± 37%    +112.0%       0.12 ± 17%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.__sched_yield
      0.00 ±141%    +643.5%       0.03 ± 59%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_call_function_single.testcase
      0.01 ± 18%    -100.0%       0.00        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__dquot_alloc_space
      0.01 ± 16%    -100.0%       0.00        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__percpu_counter_limited_add
      0.01 ±  4%    -100.0%       0.00        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__vm_enough_memory
      0.01 ± 10%    -100.0%       0.00        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt._find_first_bit
      0.01 ±  4%    -100.0%       0.00        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.cap_vm_enough_memory
      0.01 ±  3%    -100.0%       0.00        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.folio_mapping
      0.01 ±  4%    -100.0%       0.00        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.get_mem_cgroup_from_mm
      0.03 ±133%    -100.0%       0.00        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.get_page_from_freelist
      0.01 ±  4%    -100.0%       0.00        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.noop_dirty_folio
      0.01 ±  4%    -100.0%       0.00        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.percpu_counter_add_batch
      0.01 ±  5%  +6.4e+06%     816.22 ±134%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.rep_movs_alternative
      0.01 ±  6%    -100.0%       0.00        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.rmqueue
      0.01 ±  4%    -100.0%       0.00        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.shmem_add_to_page_cache
      0.02 ±119%    -100.0%       0.00        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.shmem_alloc_folio
      0.01          -100.0%       0.00        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.shmem_huge_global_enabled
      0.01 ±  9%    -100.0%       0.00        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.shmem_inode_acct_blocks
      0.01 ±  4%    -100.0%       0.00        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.static_key_count
      0.01 ±  4%    -100.0%       0.00        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.try_charge_memcg
      0.01 ±  4%    -100.0%       0.00        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk._raw_spin_unlock.shmem_recalc_inode.shmem_alloc_and_add_folio
      0.01 ±  4%    -100.0%       0.00        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.rmqueue.isra.0
      0.01 ± 38%    -100.0%       0.00        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.preempt_schedule_thunk.try_charge_memcg.charge_memcg.__mem_cgroup_charge
     65.84 ± 41%     -95.6%       2.87 ± 15%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
    644.44 ±  6%     -29.6%     453.58        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.schedule_timeout.kcompactd.kthread.ret_from_fork
     66.31 ± 36%     -97.7%       1.56 ±  4%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.schedule_timeout.wait_for_completion_state.kernel_clone.__x64_sys_vfork
    822.71           -20.9%     650.74        perf-sched.wait_time.avg.ms.perf_trace_sched_switch.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    731.17 ±  4%     -25.4%     545.43 ± 10%  perf-sched.wait_time.avg.ms.perf_trace_sched_switch.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
    790.48 ± 40%     -98.1%      14.82 ± 74%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_yield
      1842 ± 37%     -45.7%       1000        perf-sched.wait_time.max.ms.perf_trace_sched_switch.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
      1500 ± 33%     -33.4%       1000        perf-sched.wait_time.max.ms.perf_trace_sched_switch.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
    822.81 ±175%    -100.0%       0.14 ± 33%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group
      0.02 ±  9%     +68.1%       0.04 ± 24%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.__close_nocancel
      0.01 ± 71%    +143.6%       0.02 ± 19%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt._IO_fwrite
      0.39 ± 55%    +494.9%       2.35 ± 20%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.__sched_yield
      0.10 ±197%    +923.8%       1.07 ± 47%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_apic_timer_interrupt.testcase
      0.08 ±139%   +2803.5%       2.22 ± 10%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_call_function_single.__sched_yield
      0.00 ±141%   +2991.3%       0.12 ±125%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.irqentry_exit.asm_sysvec_call_function_single.testcase
      0.01 ± 25%    -100.0%       0.00        perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__dquot_alloc_space
      0.02 ±100%    -100.0%       0.00        perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__percpu_counter_limited_add
      0.01 ±  3%    -100.0%       0.00        perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.__vm_enough_memory
      0.01 ± 25%    -100.0%       0.00        perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt._find_first_bit
      0.08 ± 76%     -90.0%       0.01 ±101%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt._raw_spin_unlock_irq
      0.01          -100.0%       0.00        perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.cap_vm_enough_memory
      0.01 ± 12%    -100.0%       0.00        perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.folio_mapping
      0.01 ±  7%    -100.0%       0.00        perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.get_mem_cgroup_from_mm
      0.04 ±144%    -100.0%       0.00        perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.get_page_from_freelist
      0.01 ±  6%    -100.0%       0.00        perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.noop_dirty_folio
      0.01 ±  3%    -100.0%       0.00        perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.percpu_counter_add_batch
      0.01 ± 18%    -100.0%       0.00        perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.rmqueue
      0.01 ± 13%    -100.0%       0.00        perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.shmem_add_to_page_cache
      0.04 ±154%    -100.0%       0.00        perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.shmem_alloc_folio
      0.01 ± 17%    -100.0%       0.00        perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.shmem_huge_global_enabled
      0.01 ± 23%    -100.0%       0.00        perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.shmem_inode_acct_blocks
      0.01 ± 11%    -100.0%       0.00        perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.static_key_count
      0.01 ± 11%    -100.0%       0.00        perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_irq.irqentry_exit.asm_sysvec_apic_timer_interrupt.try_charge_memcg
      0.06 ±125%     -95.9%       0.00 ±223%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.__folio_batch_add_and_move.shmem_alloc_and_add_folio.shmem_get_folio_gfp
      0.01 ± 11%    -100.0%       0.00        perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_thunk._raw_spin_unlock.shmem_recalc_inode.shmem_alloc_and_add_folio
      0.02 ± 21%    -100.0%       0.00        perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.rmqueue.isra.0
      0.03 ±123%    -100.0%       0.00        perf-sched.wait_time.max.ms.perf_trace_sched_switch.preempt_schedule_thunk.try_charge_memcg.charge_memcg.__mem_cgroup_charge
    537.32 ± 32%     -99.1%       4.99        perf-sched.wait_time.max.ms.perf_trace_sched_switch.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      2335 ± 20%     -57.1%       1000        perf-sched.wait_time.max.ms.perf_trace_sched_switch.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0
      1008           -50.0%     504.99        perf-sched.wait_time.max.ms.perf_trace_sched_switch.schedule_timeout.kcompactd.kthread.ret_from_fork
      1006           -99.6%       4.39 ±  5%  perf-sched.wait_time.max.ms.perf_trace_sched_switch.schedule_timeout.wait_for_completion_state.kernel_clone.__x64_sys_vfork
      3310 ± 12%     -69.6%       1006        perf-sched.wait_time.max.ms.perf_trace_sched_switch.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm





Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

