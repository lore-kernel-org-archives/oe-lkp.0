Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC71E1CAB1
	for <oe-lkp@lists.linux.dev>; Mon,  8 Jul 2024 07:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720422721; cv=fail; b=kxTPdthTgWvaTdn/3Vmd3e9P7mHi/DuXwQjHu6Uj7sHZ/6BEnp3D6JIsrNaDJwW9qrQj6eOWJ0CMCSKdtWNlQgNqIYhUmELC+Wpkq28ymjooGMLwA4Aquqs+NrvyPpA1c7S3kJX3CvEk+13/DWYS6wXg1g7tOpm3LZCTRizFUGQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720422721; c=relaxed/simple;
	bh=cZgsLa1QUN7sBA5+v8rZlGcZKdSW9xvymlwWlP5gq6U=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=JoU6wacqirtFFWFcD2wJ6nyOIF/GNEMokgRFgXE+M1IJHyZh89fzl7nA/J0WGlewEpWqsAx/N410IBcDVe3iUPLfaI3eYphuImH5KnZ40AOFW4w+mQiE2OD20L4RGioVzY2TjFBKVCHyHu/QrpetFYGJS7Y5OlPU8gPk1Xdbd0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gmAi1cLT; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gmAi1cLT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720422719; x=1751958719;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cZgsLa1QUN7sBA5+v8rZlGcZKdSW9xvymlwWlP5gq6U=;
  b=gmAi1cLTaEYl0cjhKF6VSQI1EhklNSLxI8f6zzmyVKg6n3RTPysFZjZr
   njK70hvXL/IaNxqjtb1FBBLqi3Ritn5u47t+03bTO1G9VYdBftXyWLSEX
   q3174x9P5Vz5IUHg2B4xsDS4sxsnFHdw1L97Szm6qeZqSMrrAoM4DhDrZ
   xL3mwyQGOrQHwmMJXRlYXQ/sVuGLlW9Ky8bVgKYLkkDV+2rbp0kIkPAmp
   hzUOa8F6xSPt540GKuSk/yXvq2+VQqGOnkDMaR6Anwvohk2BzuGvRDxe2
   LC4khCXM3vsMDLPXkGWAOfO7LdL5ncK0IFvu7wYnzDxr23bw+MsPvT8pu
   w==;
X-CSE-ConnectionGUID: YULWVrZiSFqy+n78lp3uBQ==
X-CSE-MsgGUID: aeR6xBRkReeow5TYpyypSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="17741119"
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; 
   d="scan'208";a="17741119"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 00:11:58 -0700
X-CSE-ConnectionGUID: 19mYk6+oROa1GMkRrjM8uw==
X-CSE-MsgGUID: LcKfjIcqS7KyNLd9CNUjhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; 
   d="scan'208";a="47377002"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 08 Jul 2024 00:11:58 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 8 Jul 2024 00:11:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 8 Jul 2024 00:11:56 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 8 Jul 2024 00:11:56 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 8 Jul 2024 00:11:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HTlTfnKE9i2Cumz7p1dh5FA6ulH1wjRnkoOfEetCEVW76x6SY7oYF07tCF9A+M8Ew2h8ef1g1+MvaKNRogwVEMTA9+fNTwRFYk2KGud3nILDeWwkALi4tyUJUEoghEr/ZjWQZHpVhEelJBTzHRZ4Z8VJq7G/rWj88UQ5jjE4V73AfyrtntHCXZp5NWzBJ7iTiizZtQ5hK5Xia+PbqYRAyszILt0OPbXmTb6/gu16tJActNZuxPrKXWTa+GUzqo0G1VAXwq3tr6jZ0i4Cvy6mUOuCtmtbCSjw/qGswV7nDZZ960nZ4PoWqC0qTzYFlcQVAxeuy55T5Z0wr5pHUotbaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2GthU/aTVUMlB8HMh9rh0jOz63INpBIC5sJAKRyqqFs=;
 b=Trlfmcvyve6/L4lMrD86fQ48g+rCygEBEuV1o019CkbLmJgbFuufWTUhyMt1dxD16Lkk8oWSaowy+G/iFdsB0v3GPnXrR0z4qpjNw77jx/sZdp3/SOB/zCISD7Zg82lusATa7j7brdESILc5X/k5tIUPz4O/znUrp5aRFHHlcBrn3OzB3pA5HJjHClHcnUChkLFPepbXuTi0UyWTqJcGHl+GSQxhBYyL12Aau8ENsNuRyFmtSxYUFE3ZpxeeAkJYnZDgg6L9GexmFjDrorz+I8Bm56Rbm6ZKOvhZt4qZIzhGGSLC9m8AsEQEcZp/WuHrgBSFWG+esOu62D1xasMH7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SJ0PR11MB4975.namprd11.prod.outlook.com (2603:10b6:a03:2d0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 07:11:54 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 07:11:54 +0000
Date: Mon, 8 Jul 2024 15:11:45 +0800
From: kernel test robot <oliver.sang@intel.com>
To: David Hildenbrand <david@redhat.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-mm@kvack.org>,
	<oliver.sang@intel.com>
Subject: [davidhildenbrand:folio_walk] [mm/migrate] e20ad9c86e:
 WARNING:at_include/linux/hugetlb.h:#folio_walk_start
Message-ID: <202407081556.80770439-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0200.apcprd04.prod.outlook.com
 (2603:1096:4:187::15) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SJ0PR11MB4975:EE_
X-MS-Office365-Filtering-Correlation-Id: 06849d1a-23c5-43f2-0555-08dc9f1d3f33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZEc9Ea6NQ8C+jnrg7WYKLyaXwvBhKPaVUUVsJc6IMSK7fIR2LCHcIgtX0YZX?=
 =?us-ascii?Q?QLb4OvVxBnWTjG2s6uJENp14HmsfWcUzuKcqYnRQ75AV/VtN6qeqJhrGH9uA?=
 =?us-ascii?Q?AJUfO8kiOduMZsO6/0KF5PQ0DzDSAbRjV5yX3dtaDi3AV9/BKiE8hvfdevgU?=
 =?us-ascii?Q?vPklMyoNnIB1egLZ6LP+url938m03QZ2Fnp7Tlnz2RvKIiw3GqRw0dzIoh0l?=
 =?us-ascii?Q?p5MhgdbVKPsae83PqP705pTxhN6CqrPiNNN5HrzBbE25slvGXbcuIO5B2QZl?=
 =?us-ascii?Q?1KVX2TpP3aRz5k/OYZVKpHQia33AVHIuy8Syl2/P8acxZQ2UL/+WZelJgXPX?=
 =?us-ascii?Q?H0/ie1uAF+SGzSTNHBsI4EdZ6C3Tbxry6u7til+lFl6jb8++32THuq4mcr5Y?=
 =?us-ascii?Q?HEf1geyHKzg26QfCEwbjn/Y0N/Yjdoz9CclkR/lGnu2z3qF6raGomhwkFabj?=
 =?us-ascii?Q?uGhNzh95KsCqt9fPAlWw1+DUH8qg4JtUqy8+agLjygbgdAaHIkzDa4HQ7+J1?=
 =?us-ascii?Q?gaCPJ4o/5Q2EBfH1ZXeR5L4j3isF8V7VJo8td0jnzsYkIhkaZ0NaJQUPYFd7?=
 =?us-ascii?Q?+NO2ZEpW6JHLSw13VVYDysKv8JTsUDsrTlHFGSicXKhv4DRs8b5az4MyN7ud?=
 =?us-ascii?Q?WVu2I8eG+0JX7N3auJPquNacOzklUozbFid0sVrIdEJDWwE04DoAVWNocUQb?=
 =?us-ascii?Q?InX5lGp3IsxT1nLht2wyTqRsSj+3Hnz5Mg+0grCPrqWpvAPvVfY8EKD5ZzG1?=
 =?us-ascii?Q?7ZJQtigQak6eTM5m9iUAmxzwuG9ztNtcHKwbKRa87Otc1qFmKGDVo1o8SeB3?=
 =?us-ascii?Q?lh7RcKE7/txeSrfUm1+h/69XnCxRiy16YiYjRm+QX5tZBpAgQvsvxAYVNMbI?=
 =?us-ascii?Q?J35kvLXMEjDWO6i8Z5dumbznm7fOMiA5B/1pQo/03FavPDSGl30MYy8m6ZQ1?=
 =?us-ascii?Q?mCmdDGIa9wggiq0FQ1ep8fI0UNYpPj7FyvzmPPE96xZls+l/JgGEAvxxdUra?=
 =?us-ascii?Q?pzp0GeWEMfTaUksooNBkIYMcb30B4RihuQEU6vMAKzTzS33c5T3AX4Nc8E7/?=
 =?us-ascii?Q?9X9o0omMf5nsujwC4fmOdIhnbvgaoTOdRF5KafKr1da95QQIiocKHo0rQImY?=
 =?us-ascii?Q?BEuFn21ulklH5fHjSo7gEEmxCeLsPcxfD9aVynsG6iR+9yhlBWn50aYSv99H?=
 =?us-ascii?Q?01uEeqfL1ednDdaBLE9+PAeFK08v9h72VrbXxD1oR8p1cy66ofVqq+CqMqGf?=
 =?us-ascii?Q?XY9XUas1a0fGhRafPyOnu8Klxe2qMtgWN6gtMyUnz4W+YAuOPqKxlCAHqr9v?=
 =?us-ascii?Q?lckgOuHQXFFJxjpXaCNeilIh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AoMFND5VlNLLdtSZpVRubp2/TO7zNXWBvQAdBY9EcDL1NSiFInKZAkgwNggS?=
 =?us-ascii?Q?CozhcxT0dInSWMN+2ggvxZWGi/HjA/H4HdONknpS7kIRQiTqmDhoLO76vM9s?=
 =?us-ascii?Q?4IcPP+xlk1pfon3sUaxVCSqbTMy5HCJiQGiwujShnbjdkFTcQt6tDITqeLW1?=
 =?us-ascii?Q?DyT7a1oRJ3fW182K+OYlB/sM7TsxYcUJbtYxRFcANR76iwsGQXAAN4ZbLMKF?=
 =?us-ascii?Q?MJ45nS52f6SEOY0s9mqFooCpsI68Fur2LLNgSlo2lUvZARWWmTKyuQmX3NAn?=
 =?us-ascii?Q?AwIzCj/Ang/+NVE4lCfF5kyZiLzXPUaN6CcWWicbh7RVK8D8XgWlUMWy5bqa?=
 =?us-ascii?Q?2owlaoFYV4kBtPk7VTbLY0iQPmhzKFrlLTihjuxriEPJjW3QJIRPiVrd6CQT?=
 =?us-ascii?Q?DPzNjbHw99860zns5v91mCfgZw+2h0FOUxWseJTIPGZ8n49MwX/3kryDpBgI?=
 =?us-ascii?Q?FgFQNktxwPCzcc2cbPiFmBzK3r9AU66avnz+zwDiwhitpn3Grxt2+GcrKLVp?=
 =?us-ascii?Q?q0Mw/LsiSwPjpVZPslHW7FWclKBdhiMcK5cLuGRT1grTQHj7cCNHqApkRmao?=
 =?us-ascii?Q?pRek4GuPls1GKykcYUPSAgPQFOctiLIdDPR+XlAXOcwYny1Or2zHMkPi/zLj?=
 =?us-ascii?Q?slIbaUwuGjd9nWT9Hy/5kGM+iPbN14r4xYWT1Qd+YrK1327JlFyuxYIl4uKN?=
 =?us-ascii?Q?axycW2QVPscP0S/t0++QLwpop6IoETCyHpAzOuSuSr0t/Gul1Lyq0/b2vGho?=
 =?us-ascii?Q?wTCR6Ur9mBJbaEGCmZmi/7jkcumMDp7i0KEj/hoktUwy6Qw19/No1c/CqO03?=
 =?us-ascii?Q?Ef9ZNveNaoH7uN7w8s4K7u3DT4kBCIv2QiQDZWXcY/Xi4F7plfN7sqWDBTZ4?=
 =?us-ascii?Q?HTtQRNkGq0vT8XAEtl1Tlbvrw06bIRiMUoUipBKby4VZPBysTJRMz7WQnp97?=
 =?us-ascii?Q?hRcDafa921i+c3lgkuQjgtYDYOe1JouKTJ20TSIglzF+kF9ij13KrcCmm10E?=
 =?us-ascii?Q?hId/Age8E+jD+iu3hf/PdcXYPL4YICiqL6zV3WI7SRe5ektomAQnspWSwEz0?=
 =?us-ascii?Q?O32u67fGdFBqPJhKH4EphhUcMIyVSE3OkZsDZH1M8vRsqWnzdH6JyUZvLMv5?=
 =?us-ascii?Q?RZnp73NXkbNsy+fUrfOk+QyOfHdoHnNeOHf5aJhmR/ynumfoUMGl/J52/Bx1?=
 =?us-ascii?Q?pA0RNJ96c630PiuMFYD2iqkvSDnu0d2QPZolsJEzr80Uv6Ma2V/QHJ/PTrpV?=
 =?us-ascii?Q?nsF1RTA/g319vRwFAGmdOaBQI/TRU3co0XVmBf5i27yfNmXbCGVHpXGoVvLi?=
 =?us-ascii?Q?NwvU1Iz0qb5m26q4VzIjO4M78ZaRiwlEOmdZfEWLuYKMeBUWJxrJlaWCFkgU?=
 =?us-ascii?Q?4Ub/Tia7JYkjfDDr2SQSGmLRV5it5+qIzcM2XeWXYepLgkyILqyTWXTbsivG?=
 =?us-ascii?Q?cZw1ZYJUZZcdPa46GLLdv3HB942kd8DpW93oeDwWgayxQlyA6k+FCI7Tw6po?=
 =?us-ascii?Q?3ESL/VKdQilx9znqFpchAcKAr1T2gTL0jMC3GHfJYDREyUuTq0ubKpNt91Ok?=
 =?us-ascii?Q?/Oy5uLivSPRGolDb0rc/RTV6AQNV2uss3gQv3QIUnZdbQ4tkJMI+RmHD8Kbr?=
 =?us-ascii?Q?2Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 06849d1a-23c5-43f2-0555-08dc9f1d3f33
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 07:11:54.4419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AAYexPdJiGjrUHUGxoJbFtxGn8dr3JgsI/WI4ohRDNDNETphflKPCEBGbyEOssgPwKY+o0TIO3YDf7EU0T8Rhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4975
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:at_include/linux/hugetlb.h:#folio_walk_start" on:

commit: e20ad9c86e42503c57d99ea1a9d868c39198ae65 ("mm/migrate: convert add_page_for_migration() from follow_page() to folio_walk")
https://github.com/davidhildenbrand/linux folio_walk

in testcase: trinity
version: trinity-static-i386-x86_64-f93256fb_2019-08-28
with following parameters:

	runtime: 300s
	group: group-01
	nr_groups: 5



compiler: clang-18
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+------------------------------------------------------+------------+------------+
|                                                      | 6420096195 | e20ad9c86e |
+------------------------------------------------------+------------+------------+
| WARNING:at_include/linux/hugetlb.h:#folio_walk_start | 0          | 17         |
| RIP:folio_walk_start                                 | 0          | 17         |
| WARNING:bad_unlock_balance_detected                  | 0          | 17         |
| is_trying_to_release_lock(&vma_lock->rw_sema)at      | 0          | 17         |
| WARNING:at_kernel/locking/rwsem.c:#__up_read         | 0          | 17         |
| RIP:__up_read                                        | 0          | 17         |
+------------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202407081556.80770439-oliver.sang@intel.com


[  312.782456][ T4644] ------------[ cut here ]------------
[ 312.782941][ T4644] WARNING: CPU: 0 PID: 4644 at include/linux/hugetlb.h:1276 folio_walk_start (include/linux/hugetlb.h:1274) 
[  312.782957][ T4644] Modules linked in:
[  312.782961][ T4644] CPU: 0 UID: 65534 PID: 4644 Comm: trinity-c6 Not tainted 6.10.0-rc6-next-20240703-00003-ge20ad9c86e42 #1
[ 312.782965][ T4644] RIP: 0010:folio_walk_start (include/linux/hugetlb.h:1274) 
[ 312.782968][ T4644] Code: ff 48 89 ee 31 d2 4c 89 f1 e8 55 07 00 00 48 89 c3 e9 d6 02 00 00 0f 0b e9 86 f6 ff ff 4c 89 ff e8 3e 0a 00 00 e9 c2 02 00 00 <0f> 0b e9 66 fb ff ff 48 c7 c1 54 79 d1 85 80 e1 07 80 c1 03 38 c1
All code
========
   0:	ff 48 89             	decl   -0x77(%rax)
   3:	ee                   	out    %al,(%dx)
   4:	31 d2                	xor    %edx,%edx
   6:	4c 89 f1             	mov    %r14,%rcx
   9:	e8 55 07 00 00       	call   0x763
   e:	48 89 c3             	mov    %rax,%rbx
  11:	e9 d6 02 00 00       	jmp    0x2ec
  16:	0f 0b                	ud2
  18:	e9 86 f6 ff ff       	jmp    0xfffffffffffff6a3
  1d:	4c 89 ff             	mov    %r15,%rdi
  20:	e8 3e 0a 00 00       	call   0xa63
  25:	e9 c2 02 00 00       	jmp    0x2ec
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	e9 66 fb ff ff       	jmp    0xfffffffffffffb97
  31:	48 c7 c1 54 79 d1 85 	mov    $0xffffffff85d17954,%rcx
  38:	80 e1 07             	and    $0x7,%cl
  3b:	80 c1 03             	add    $0x3,%cl
  3e:	38 c1                	cmp    %al,%cl

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	e9 66 fb ff ff       	jmp    0xfffffffffffffb6d
   7:	48 c7 c1 54 79 d1 85 	mov    $0xffffffff85d17954,%rcx
   e:	80 e1 07             	and    $0x7,%cl
  11:	80 c1 03             	add    $0x3,%cl
  14:	38 c1                	cmp    %al,%cl
[  312.782971][ T4644] RSP: 0018:ffffc90001de7c88 EFLAGS: 00010246
[  312.782973][ T4644] RAX: 0000000000000000 RBX: ffff888109293ac0 RCX: 0000000000000000
[  312.782975][ T4644] RDX: ffffc90001de7df0 RSI: ffff888110e561d0 RDI: ffff888137ac5d98
[  312.782977][ T4644] RBP: dffffc0000000000 R08: ffffffff85d167af R09: 1ffffffff0ba2cf5
[  312.782978][ T4644] R10: dffffc0000000000 R11: fffffbfff0ba2cf6 R12: ffffffffffe00000
[  312.782980][ T4644] R13: ffff8881337c3470 R14: ffff8881337c3460 R15: ffff8881337c34e0
[  312.782981][ T4644] FS:  0000000000000000(0000) GS:ffff8883af000000(0063) knlGS:0000000009c1c880
[  312.782983][ T4644] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
[  312.782985][ T4644] CR2: 000000006d278c7e CR3: 0000000136d38000 CR4: 00000000000406f0
[  312.782988][ T4644] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  312.782990][ T4644] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[  312.782991][ T4644] Call Trace:
[  312.782993][ T4644]  <TASK>
[ 312.782995][ T4644] ? __warn (kernel/panic.c:240 kernel/panic.c:742) 
[ 312.782998][ T4644] ? folio_walk_start (include/linux/hugetlb.h:1274) 
[ 312.783001][ T4644] ? folio_walk_start (include/linux/hugetlb.h:1274) 
[ 312.783005][ T4644] ? report_bug (lib/bug.c:?) 
[ 312.783011][ T4644] ? handle_bug (arch/x86/kernel/traps.c:239) 
[ 312.783015][ T4644] ? exc_invalid_op (arch/x86/kernel/traps.c:260) 
[ 312.783017][ T4644] ? asm_exc_invalid_op (arch/x86/include/asm/idtentry.h:621) 
[ 312.783025][ T4644] ? folio_walk_start (include/linux/hugetlb.h:1274) 
[ 312.783029][ T4644] ? folio_walk_start (include/linux/hugetlb.h:1274) 
[ 312.783035][ T4644] __se_sys_move_pages (mm/migrate.c:?) 
[ 312.783043][ T4644] ? lock_acquire (kernel/locking/lockdep.c:5816) 
[ 312.783054][ T4644] ? __task_pid_nr_ns (include/linux/rcupdate.h:333 include/linux/rcupdate.h:845 kernel/pid.c:510) 
[ 312.783061][ T4644] __do_fast_syscall_32 (arch/x86/entry/common.c:?) 
[ 312.783068][ T4644] do_fast_syscall_32 (arch/x86/entry/common.c:411) 
[ 312.783071][ T4644] entry_SYSENTER_compat_after_hwframe (arch/x86/entry/entry_64_compat.S:121) 
[  312.783074][ T4644] RIP: 0023:0xf7f50539
[ 312.783076][ T4644] Code: 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00
All code
========
   0:	03 74 b4 01          	add    0x1(%rsp,%rsi,4),%esi
   4:	10 07                	adc    %al,(%rdi)
   6:	03 74 b0 01          	add    0x1(%rax,%rsi,4),%esi
   a:	10 08                	adc    %cl,(%rax)
   c:	03 74 d8 01          	add    0x1(%rax,%rbx,8),%esi
	...
  20:	00 51 52             	add    %dl,0x52(%rcx)
  23:	55                   	push   %rbp
  24:*	89 e5                	mov    %esp,%ebp		<-- trapping instruction
  26:	0f 34                	sysenter
  28:	cd 80                	int    $0x80
  2a:	5d                   	pop    %rbp
  2b:	5a                   	pop    %rdx
  2c:	59                   	pop    %rcx
  2d:	c3                   	ret
  2e:	90                   	nop
  2f:	90                   	nop
  30:	90                   	nop
  31:	90                   	nop
  32:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  39:	00 00 00 
  3c:	0f                   	.byte 0xf
  3d:	1f                   	(bad)
  3e:	44                   	rex.R
	...

Code starting with the faulting instruction
===========================================
   0:	5d                   	pop    %rbp
   1:	5a                   	pop    %rdx
   2:	59                   	pop    %rcx
   3:	c3                   	ret
   4:	90                   	nop
   5:	90                   	nop
   6:	90                   	nop
   7:	90                   	nop
   8:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   f:	00 00 00 
  12:	0f                   	.byte 0xf
  13:	1f                   	(bad)
  14:	44                   	rex.R
	...
[  312.783078][ T4644] RSP: 002b:00000000ffb6430c EFLAGS: 00000206 ORIG_RAX: 000000000000013d
[  312.783081][ T4644] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 0000000000000142
[  312.783083][ T4644] RDX: 0000000009eb9dd8 RSI: 0000000009eb42d0 RDI: 0000000009eb47e0
[  312.783085][ T4644] RBP: 0000000000000002 R08: 0000000000000000 R09: 0000000000000000
[  312.783087][ T4644] R10: 0000000000000000 R11: 0000000000000206 R12: 0000000000000000
[  312.783089][ T4644] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
[  312.783100][ T4644]  </TASK>
[  312.783101][ T4644] irq event stamp: 394339
[ 312.783103][ T4644] hardirqs last enabled at (394341): vprintk_store (kernel/printk/printk.c:2323 arch/x86/include/asm/irqflags.h:155 kernel/printk/printk.c:2323) 
[ 312.783108][ T4644] hardirqs last disabled at (394342): vprintk_store (kernel/printk/printk.c:?) 
[ 312.783111][ T4644] softirqs last enabled at (394246): __irq_exit_rcu (kernel/softirq.c:617) 
[ 312.783115][ T4644] softirqs last disabled at (393977): __irq_exit_rcu (kernel/softirq.c:617) 
[  312.783119][ T4644] ---[ end trace 0000000000000000 ]---
[  312.821303][ T4644]
[  312.821307][ T4644] =====================================


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240708/202407081556.80770439-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

