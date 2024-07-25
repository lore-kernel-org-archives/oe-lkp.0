Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFCC14A636
	for <oe-lkp@lists.linux.dev>; Thu, 25 Jul 2024 05:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721887175; cv=fail; b=nBWNxORPuavWUC7xjk/K9Uc+rIBrfXYGFZVPFdoXKPwqsg1DyVDGukxZD9U1jMsrnKJ3r+nRYG/T7L719HM03/faZS097SQuInqWUJaCqAoeY3by5Zm/L77HRXqrnolstve13zmG5+7UMl8/t08xP7VFy3N1W5fGcxY9quRQokk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721887175; c=relaxed/simple;
	bh=ZcLYlfpp9oRY5zKyD+AxKXGOnjG/55Bp2owSmlLMfxg=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=rtEVsFRSVAceRvWyBNFfzZjdDt0gXLanmyPGHFab4kZvA3nVWI3ZFtwK90XeGU4DrUMY/WaDc3Sc19+ywVIhOKv3NvK0kTLwiiBH4DipXXt64CPt+h2F7nZdkdP8WXfwYmIXCRZkgy3k4YYBJRjalHwg36doINL9iZZOGOEJgIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jsQvAxcW; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jsQvAxcW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721887174; x=1753423174;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZcLYlfpp9oRY5zKyD+AxKXGOnjG/55Bp2owSmlLMfxg=;
  b=jsQvAxcWcFrYdmt7Q83cIF5gqVG2T2XguAnDNOrnh8TdnWrWCo8+Xsiv
   nNUbxcmWUoj0WrtO+ckcl1hL2gof5G7p0Uu2gA1vf8N4halnsHlUWQM6M
   DMIoKLpcKFM+ZoOyFcujKokwrEDFexW4P+aEcMNyc2d/7y8HzwdhX7rz3
   zYTEb05uaElwAjhwFJTQU35AyNG3wBlU3iiPND/9JOuiR5nLjkWLCHhEU
   dvYYl9nqYM/IRZMPAh5LTCTi2G8LRqDG8PQ6UepphWu2t86Z+nOUepkh5
   IoHG0ksQHp2sbC65O/+vZewYqrj5RFDu/9mHjEEuXs6EHt0Z22rug3SHw
   w==;
X-CSE-ConnectionGUID: 3EfWSHC5Q5uZeUht7VDo5A==
X-CSE-MsgGUID: PD7v3cGZQmWkFTFf9xaGGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19407727"
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="19407727"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2024 22:59:34 -0700
X-CSE-ConnectionGUID: yNx8L9zJRa+WnnkiBAnAwQ==
X-CSE-MsgGUID: JP94ig5oRbelCRJcoUWwmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="52492228"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 24 Jul 2024 22:59:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 24 Jul 2024 22:59:32 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 24 Jul 2024 22:59:32 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 24 Jul 2024 22:59:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NCPsbUlcNutEi4/PRFqTYgRZTM7/JZ1bvfzPPtAsnZTxaSSXNJgVPcibwvmnwu9DG6tGCdrJqiswzp8iE3K0U6uCF+tC507uD0iqKWljVoP5d31ORn05CN60wm9aCFjIY9Twtm/ZOuUj4eOszcDnRBF29lBpppLJwNAR1pRWDpMaJqVI7lgfFH3ZCgdsWQtniWDiSThQNOHThOZZfmIINYUNk1OPB+ToB2QRxNlwL+qS5kFnSoAjnQct8dC+3N/fzBzDgxrn0LfK44Uip8Wc8mcrkacuku3l9pePRfQeDxVF60O5yu9izuDIhyLsX0qUzmLo7rsDtFaIkzB14nOxCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h/8rF5AtO9779Xs6WNdwZHvtUMW/R1zhnh8En1CMEoY=;
 b=HvLLx0qgzLXTubsrRVb+EJhBdSJ7pRAQcTLYirWeP0PK9A6I/CS6zV7kYso+D1/g9qRXKUj6CwvkR5nWvBcJvQ547t1KPn0r7uGaMd1jHzw7OMMBFjfajFj9irOSquMkMt22v6Hyo//hKg0oig5jjNwKpS8k64YUrRUMgynx5rdsXbvtQc+KuzsnFGF/T5NJ85/SxTOTKDs9Pf+pXv2hqN3bzDl+5NhmOAD8OYK1XGyG4oqD0o8e7t4qV5/Buhk9v4m8MGZRQC3IB40w//4s1I0TmiBgM9g6Ry8uUD9sFpEBmkrfoQDjhYS21ws39DSh1dbfbedeLDnKqeDIy+fqkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SA0PR11MB4623.namprd11.prod.outlook.com (2603:10b6:806:95::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Thu, 25 Jul
 2024 05:59:30 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.7784.020; Thu, 25 Jul 2024
 05:59:30 +0000
Date: Thu, 25 Jul 2024 13:59:20 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-mm@kvack.org>,
	<oliver.sang@intel.com>
Subject: [vbabka:slab-kfree_rcu-destroy-v1r0] [mm, slab] df00e211c9:
 WARNING:at_mm/slab_common.c:#kmem_cache_kfree_rcu_destroy_workfn
Message-ID: <202407251313.32e55498-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::14) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SA0PR11MB4623:EE_
X-MS-Office365-Filtering-Correlation-Id: 10286877-a93d-4a0f-76fe-08dcac6ef2c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0YsTs+06Wq5TPjX/zcZOjLuzjrOo0bVB8mdYl/YfyTPvcCHn6jmD9S331ja/?=
 =?us-ascii?Q?aQrFGP2rIZvRePvayCraHdESLj0ypSTMsX18wsZ11JOsrIFGkEOrZGGbnQvi?=
 =?us-ascii?Q?t6egb7r6bxcHO+bH+gFfsovWVgIDrLZ8pZoVE1JDTcGA2STJ0yqquYKbihzs?=
 =?us-ascii?Q?L5xfkxEX/6RNuCdVLpsWgj1/7BNs4xYualKPe5+goBO9fQaDPeefxGeNN1Fl?=
 =?us-ascii?Q?IbEfdO0IQ7qMVtoeBOi9Xww1Jzx8ZnvtKv1DOFc1SOXPoTq0n2SD7LmpnMXy?=
 =?us-ascii?Q?JP9vA/TzdfJMP15E8b8sh1nN31U9420UkBA40FfD+Ekx4sJj9ELSy9MCsD1t?=
 =?us-ascii?Q?/MehfanXpcZM59dofwJZVZEJB0WmjAPkEjFVRSU0jJfbNhlgUTnCwQWLZ9TU?=
 =?us-ascii?Q?sHN4JpfEQZnTXhJmdWBIABQMXXgtZusq10LE9Dw57Ji79odOgDT+tmIioeid?=
 =?us-ascii?Q?FUfNOqa6mKa7Jd6fPr++lJQXtKBoS2w3ty8fKMgPWZNU1aOnAxRcq3fkIMDh?=
 =?us-ascii?Q?Y+cmIgTzKUJUh6sGb/v/eo0ZsJgEfXGIjVPcRq9fUHsJ2VMI4sOayLTf4ECb?=
 =?us-ascii?Q?IjPVZd+2mjyB7tH4SqvVHHS239KHtJvKmFIZkEe6vR1DytWYBt2YQa6aSfCW?=
 =?us-ascii?Q?j22E8M5OZoT9AUDvzX5LhDr+DTf4TEX9lX5TapDe2JmgehJulrdEH0cPEpkw?=
 =?us-ascii?Q?a0iVWBAarI6ooQQe1HT/isKQy5xb0xDY4eU0QjGL7OhFednGRboAqNIS1JpW?=
 =?us-ascii?Q?MUrh25y65ZfLUP6R9LKPCfi8XZsYMzUo0xx7nVa476YrfDJLZ/4WviZOBwnC?=
 =?us-ascii?Q?BA2dydrmelr3ZS/jZkXm0xY+as6q/5cXmWOExliKk+8ylrUTVl7SEyLj2odr?=
 =?us-ascii?Q?cPQeK5fJ9HhELyHa3eysDTcTT21hiRFlceWaQZUjNodmXuSzEbDyhwGXAFRh?=
 =?us-ascii?Q?bvXjz53s2ERdI1CUqzAXYpBEZk6wldG44kvp5CMv+RJeJk6jpp+s0M5te0tM?=
 =?us-ascii?Q?D9cauh1WKjPStqMvr3H+p/uKS7IplptWCWg7hAINnosd4Drw3CXzYQqvixHz?=
 =?us-ascii?Q?E6uKFCxNE+xgLsFdEGkXgsRVt0DFMamvwXzQJvDevH9oA20VH+KeWGD7KfHK?=
 =?us-ascii?Q?O7O5GrYet3efn8Nw+9UwFQIxgMpVKEl02wBcyfCSwmj4BrWFnJfSmFoZFVYj?=
 =?us-ascii?Q?vlLH40+3X4b+zv+Rmvssd0q8/yhXBkcP1FFlDMdDV7toUnO9cR7TRVR9RL+c?=
 =?us-ascii?Q?JnCvUxRi2ZapRbQoqhkvL+0+oZ4cEpAN5jh3siLAJzr3nsqVOpcvnrucLBsk?=
 =?us-ascii?Q?bSA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YTDjsyo7C45L9weGIHfKxP7Wh89PwhBuLJMBkP7hwZuAGKGhvCv/iRN5lNhN?=
 =?us-ascii?Q?1l7ehm1EIMSk/TZk/ric2vVldS1T5AVUZxyfHRdZFqKFQa+g+xLFoVwwe3g4?=
 =?us-ascii?Q?4po/TUgg7jM7KiLYuQ7YGOqGCRuCBZY4ywLTRkfD4ikecSypJc9V+svepuIe?=
 =?us-ascii?Q?DHBYk7vb0qsmzkeYmKd2igpcbqopdGnzqGhz4Vv6Wep4fzjEM4TG63Vy5+PM?=
 =?us-ascii?Q?yRhM0OwVaHf1bEK9dnw9+N6Lw8u9zZBbf7ls4FIchG3ubYe1GALiehO2x1+U?=
 =?us-ascii?Q?vZDxL+9Qe6FMY940NgXDUC370UnkEeOrn+fQVt2QFkMSqtHGh7Azhj0Up5xZ?=
 =?us-ascii?Q?zdDxbBaZVKF2/01R1PW42l0+ly7+68l71ksKVhNGjnxT/Nd+TyZ4cHW0w1VT?=
 =?us-ascii?Q?7Y86mUgQ0T+Pp9yQv2ikZ+8Fs7Zyy3LIG67kys45CalU5VL1mWTxJp88dOjw?=
 =?us-ascii?Q?NYFBSDxwJSn9UMaEtfHXuGyfnDopNFtdMjNEB+0LoOkH/k+mk+vRdTyZSvPI?=
 =?us-ascii?Q?IQt8FLEMCO1ZrIKhLeoub4RLF9lyXhB1CehuDXdddnRykY+pFraYfFi/Vwz1?=
 =?us-ascii?Q?Tt0+hnGmtY0Hf1SSx/qQ7b1gOIq4GB+8GVgZzr9Y96YpmnHuj5NH5nCLfZmA?=
 =?us-ascii?Q?G7YqlgmnGRLk2FSpmZJ21e1AdGDVql0420ZlurucGizvAP1xSCqIQDML5lBY?=
 =?us-ascii?Q?u6K15elcbYMe03ye7dd3gy1favriVCfx4raWuKjXmRPz3ZBdnPCYOb5bRk14?=
 =?us-ascii?Q?ha9EUdCcG39J1XFgN6W7eu6iZ1dXFRdetBXNrDWnO+Tw2N3EOb5z15RO1RZH?=
 =?us-ascii?Q?6ClUaEaxv4ArkYRfM+kvKRyC8O0J8LwbOTErNcAEkKziZPntandMlIpzgSPF?=
 =?us-ascii?Q?9v4InIVxf1+cRq4nSVf1nNfwOQHOKjMRg8KxPpKLe0wBl2thu9SMEijjJpOs?=
 =?us-ascii?Q?BDO3nHxhaCq5xfjxFX56+FFbKdqW68M/hTJlzacJ8U7ZjzZabqUwzUoWuRAW?=
 =?us-ascii?Q?KiRTp6Qos7/RmItSv3IyTr/gFO0wzRO2rNQy2B9oUIfGXrNN05/L07Cyfkd+?=
 =?us-ascii?Q?dLXyOMW++nIlFq2gAYp1UNPZw8D5smPm5nb0eZ32K5EbSuC+Oo9f36Q/7Lmd?=
 =?us-ascii?Q?CMfvsFOCIiur3Ovr9QMytonlw1EW9Z/yICIXpZza+BcwRzrCV6H3arVweGpO?=
 =?us-ascii?Q?Exux2aehDDzAOA+4ZRxLJ/5GitJmXHisDC5RzZqZHxQgtzZflw+gNuZ2Rk7j?=
 =?us-ascii?Q?FjAEn3Ov7a2MSC1peSzKmBkPj/pt9q01dDQ77Ifd9n0wDHWu7/Cq8juXtvqT?=
 =?us-ascii?Q?tvz6xFUu4Ik0IZzVf6fGTaLJ2AJmQyNMSqe9Gos2fnR0d2H6iEKsGk+Fg+8G?=
 =?us-ascii?Q?ZBNBOLuumuUmIN03W/KDsIXrj4asnYGP1bwdE1pUYkFubkFgkuRdg1Ps7UkH?=
 =?us-ascii?Q?dLI9AjOKcHAUz+pBSCsuSeMhai3fjB4TfkGPRegPco3F4D1qXFMbGRLiCuG8?=
 =?us-ascii?Q?kAAwIB1htxtUGLdrRfWdtJBBjIK73L1xYFcqp3q8f2SKVru9QJk3FeXTyi4e?=
 =?us-ascii?Q?w8kfRD/s+G9ZvKoZu1Z2sTKJWlbZ4fC5RFuiNw5sfSMMOIG+o/+X7ER99urn?=
 =?us-ascii?Q?RA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10286877-a93d-4a0f-76fe-08dcac6ef2c8
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 05:59:30.2270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4rc7TLW4+Uapn/bNkL6w8JorsIQ2NNvTq4k68/9M+LR9kJs8dCacpJ8qdMikqUsgmKthC70yxFouL+EnT1y6MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4623
X-OriginatorOrg: intel.com


hi, Vlastimil Babka,

we noticed by this commit:

7fd4dfd0d38db6f3 df00e211c9c11e8d20f2ea7b4ab
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
          6:6         -100%            :6     dmesg.WARNING:at_mm/slab_common.c:#kmem_cache_destroy
           :6          100%           6:6     dmesg.WARNING:at_mm/slab_common.c:#kmem_cache_kfree_rcu_destroy_workfn

below formal report just FYI what we observed in our tests. not sure if it's
valuable to supply any hints.


Hello,

kernel test robot noticed "WARNING:at_mm/slab_common.c:#kmem_cache_kfree_rcu_destroy_workfn" on:

commit: df00e211c9c11e8d20f2ea7b4ab1d7c9760fe822 ("mm, slab: asynchronously destroy caches with outstanding objects")
https://git.kernel.org/cgit/linux/kernel/git/vbabka/linux.git slab-kfree_rcu-destroy-v1r0

in testcase: rcutorture
version: 
with following parameters:

	runtime: 300s
	test: default
	torture_type: tasks-tracing



compiler: clang-18
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202407251313.32e55498-oliver.sang@intel.com


[  339.985807][   T98] ------------[ cut here ]------------
[  339.986460][   T98] kmem_cache_destroy rcuscale: Slab cache still has objects
[ 339.986476][ T98] WARNING: CPU: 1 PID: 98 at mm/slab_common.c:562 kmem_cache_kfree_rcu_destroy_workfn (mm/slab_common.c:561) 
[  339.988490][   T98] Modules linked in: rcutorture(-) torture crc32c_intel serio_raw stm_p_basic
[  339.989490][   T98] CPU: 1 PID: 98 Comm: kworker/1:3 Not tainted 6.10.0-rc6-00022-gdf00e211c9c1 #1
[  339.990127][   T98] Workqueue: events kmem_cache_kfree_rcu_destroy_workfn
[ 339.990888][ T98] EIP: kmem_cache_kfree_rcu_destroy_workfn (mm/slab_common.c:561) 
[ 339.991546][ T98] Code: 74 d3 e8 d8 f1 72 00 e8 63 31 e7 ff 83 c4 04 5e 5f 5b 5d 31 c0 31 c9 31 d2 c3 ff 76 f4 68 05 a9 2a d3 e8 38 28 e7 ff 83 c4 08 <0f> 0b eb cf 90 3e 8d 74 26 00 55 89 e5 53 57 56 83 ec 0c 64 a1 30
All code
========
   0:	74 d3                	je     0xffffffffffffffd5
   2:	e8 d8 f1 72 00       	call   0x72f1df
   7:	e8 63 31 e7 ff       	call   0xffffffffffe7316f
   c:	83 c4 04             	add    $0x4,%esp
   f:	5e                   	pop    %rsi
  10:	5f                   	pop    %rdi
  11:	5b                   	pop    %rbx
  12:	5d                   	pop    %rbp
  13:	31 c0                	xor    %eax,%eax
  15:	31 c9                	xor    %ecx,%ecx
  17:	31 d2                	xor    %edx,%edx
  19:	c3                   	ret
  1a:	ff 76 f4             	push   -0xc(%rsi)
  1d:	68 05 a9 2a d3       	push   $0xffffffffd32aa905
  22:	e8 38 28 e7 ff       	call   0xffffffffffe7285f
  27:	83 c4 08             	add    $0x8,%esp
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	eb cf                	jmp    0xfffffffffffffffd
  2e:	90                   	nop
  2f:	3e 8d 74 26 00       	ds lea 0x0(%rsi,%riz,1),%esi
  34:	55                   	push   %rbp
  35:	89 e5                	mov    %esp,%ebp
  37:	53                   	push   %rbx
  38:	57                   	push   %rdi
  39:	56                   	push   %rsi
  3a:	83 ec 0c             	sub    $0xc,%esp
  3d:	64                   	fs
  3e:	a1                   	.byte 0xa1
  3f:	30                   	.byte 0x30

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	eb cf                	jmp    0xffffffffffffffd3
   4:	90                   	nop
   5:	3e 8d 74 26 00       	ds lea 0x0(%rsi,%riz,1),%esi
   a:	55                   	push   %rbp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %rbx
   e:	57                   	push   %rdi
   f:	56                   	push   %rsi
  10:	83 ec 0c             	sub    $0xc,%esp
  13:	64                   	fs
  14:	a1                   	.byte 0xa1
  15:	30                   	.byte 0x30
[  339.993706][   T98] EAX: 00000000 EBX: ed3f3000 ECX: 00000000 EDX: 00000000
[  339.994569][   T98] ESI: ed3f3048 EDI: 00010000 EBP: eda63f00 ESP: eda63ef0
[  339.994972][   T98] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010296
[  339.995835][   T98] CR0: 80050033 CR2: b7296028 CR3: 2e17c000 CR4: 000406d0
[  339.996669][   T98] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[  339.997563][   T98] DR6: fffe0ff0 DR7: 00000400
[  339.998168][   T98] Call Trace:
[ 339.998550][ T98] ? show_regs (arch/x86/kernel/dumpstack.c:478) 
[ 339.999044][ T98] ? kmem_cache_kfree_rcu_destroy_workfn (mm/slab_common.c:561) 
[ 339.999854][ T98] ? __warn (kernel/panic.c:239 kernel/panic.c:693) 
[ 340.000309][ T98] ? kmem_cache_kfree_rcu_destroy_workfn (mm/slab_common.c:561) 
[ 340.001084][ T98] ? kmem_cache_kfree_rcu_destroy_workfn (mm/slab_common.c:561) 
[ 340.001837][ T98] ? report_bug (lib/bug.c:199) 
[ 340.002138][ T98] ? exc_overflow (arch/x86/kernel/traps.c:252) 
[ 340.002374][ T98] ? handle_bug (arch/x86/kernel/traps.c:?) 
[ 340.002602][ T98] ? exc_invalid_op (arch/x86/kernel/traps.c:260) 
[ 340.003063][ T98] ? handle_exception (arch/x86/entry/entry_32.S:1054) 
[ 340.003641][ T98] ? exc_overflow (arch/x86/kernel/traps.c:252) 
[ 340.004094][ T98] ? kmem_cache_kfree_rcu_destroy_workfn (mm/slab_common.c:561) 
[ 340.004932][ T98] ? exc_overflow (arch/x86/kernel/traps.c:252) 
[ 340.005201][ T98] ? kmem_cache_kfree_rcu_destroy_workfn (mm/slab_common.c:561) 
[ 340.005814][ T98] process_one_work (kernel/workqueue.c:3253) 
[ 340.006385][ T98] worker_thread (kernel/workqueue.c:3323 kernel/workqueue.c:3409) 
[ 340.006870][ T98] kthread (kernel/kthread.c:391) 
[ 340.007165][ T98] ? pr_cont_work (kernel/workqueue.c:3356) 
[ 340.007508][ T98] ? kthread_unuse_mm (kernel/kthread.c:342) 
[ 340.007852][ T98] ? kthread_unuse_mm (kernel/kthread.c:342) 
[ 340.008205][ T98] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 340.008546][ T98] ret_from_fork_asm (arch/x86/entry/entry_32.S:737) 
[ 340.008966][ T98] entry_INT80_32 (arch/x86/entry/entry_32.S:944) 
[  340.009348][   T98] irq event stamp: 13099
[ 340.009686][ T98] hardirqs last enabled at (13107): console_unlock (arch/x86/include/asm/irqflags.h:19 arch/x86/include/asm/irqflags.h:67 arch/x86/include/asm/irqflags.h:127 kernel/printk/printk.c:341 kernel/printk/printk.c:2731 kernel/printk/printk.c:3050) 
[ 340.015799][ T98] hardirqs last disabled at (13122): console_unlock (kernel/printk/printk.c:339) 
[ 340.016806][ T98] softirqs last enabled at (13120): __do_softirq (kernel/softirq.c:589) 
[ 340.017976][ T98] softirqs last disabled at (13115): __do_softirq (kernel/softirq.c:589) 
[  340.019062][   T98] ---[ end trace 0000000000000000 ]---



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240725/202407251313.32e55498-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

