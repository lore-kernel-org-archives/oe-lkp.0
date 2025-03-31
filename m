Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71731202978
	for <oe-lkp@lists.linux.dev>; Mon, 31 Mar 2025 14:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743431092; cv=fail; b=hVa6EQx8EbHtE6kRAqG8OXONB40H3WxLjAP3nVLBb3AjoFpGESGMmyAisu+IXM932qOzS9hhi81GUSn2s6m2Lfn8x5c0+BbZ/dz3Fv1TwlbyggtMqcCGQ/FUmCIDtABjScIuugsdFlwvjxdsKqqEHEAU1EIKQhTza+jRIU8clAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743431092; c=relaxed/simple;
	bh=2F2jAaO3hVkn6ieo9RnbKob+b5Hfv+0+C/3J0rB1ogg=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=qHXbM2uyTsyYgTH7F46ceJDiBXerdUjlosoLI/wWSyZo5+Jmoi/ENJ8VLUIgedmLCXf7DRidg4mrF3ZW4+iW1vNxO5Uyu8I21NgSjW2e+8IwfYjR3SnG8MgYz4KlsCkcZ3YgxzDsktE+YkfYb/ke1kx8ffcWNXhNZPNF2K7YWpo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=chglYFYL; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="chglYFYL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743431089; x=1774967089;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=2F2jAaO3hVkn6ieo9RnbKob+b5Hfv+0+C/3J0rB1ogg=;
  b=chglYFYLIjResFEz1s06HU8xvs2mnm9uGb9vjQmrBUI7IzoYqive28t1
   vqYBzpfufc70CcSubcxL0GoXW6ZH28CcB/Rpp0EQ/WpyOhv96bKRo27pN
   DrGOIw0/zzR7LVFc91w8pGnsJ1XXMDwK0nrBk5DKOYXAprn4c1ZdeQYMZ
   /6oAPE466L+W/y+K3Va1RpCOeh54Wdvna0/T6rQgDJjhoWBvYq0bdngo3
   H7+cj/HwTPeN39HT3G9YijG0iT0EolAdy4/mOfPz2SQflaxRNJCUApX75
   wTlND40ZY9Dx5GnXA1cjEsQk8T3aTF0Ib/gpef8fg27PKpXvFh0MVE8FU
   w==;
X-CSE-ConnectionGUID: 8vf6eAPYRoiorp/1YIN/zQ==
X-CSE-MsgGUID: 19D1d0L2SUGZdk2LnNdSCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="48590706"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="48590706"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 07:24:48 -0700
X-CSE-ConnectionGUID: 45TWnBMxTpi+puHRBXsu+g==
X-CSE-MsgGUID: UOCrltK7QwmzmTDgAsRipw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="127006178"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 31 Mar 2025 07:24:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 31 Mar 2025 07:24:47 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 07:24:47 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 07:24:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xMndEfzkI1x5IzSVXFOPmsMDkIcQiok7d7Y1ABbsR9Usy57+6CpYuGVc1hdIvmK1lCJW0j7lN94CWz9qF7cUBbZCurXz0US3hYan0aD8KpJOE4J307rH1Sb8F1ouLfxw41yZcT3IPDJwDtXiOePZj8C2M7S8Z4pWN3a9fsU/TuZ5zSBNIYqRv9kLO7cucDwDFL0LTdd7b9BslUqAjOCAhK1k4CSeXgJ6IbXmZg8clhrEn+SyOvxfRIY93NQ6z+gBv3qNrlzC24awPKew3nflCRNo2WKTDLJ0S8YkYlXRw6jUXkr/zS1rfXqYt4VJRpO2EtL+qRORsdlBbPNjQQio2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U8NU6irZr8JRgETYQUnR2xDhWO4c0d1WBcxaVSSaYEw=;
 b=Qufyn/TnlhiOr+hV+Gz9hJjutZEJM2azlgpsaDSBO/zHnmh2I67tgCAHx//22CPAoHBt+rZZ2fe6pWf44AYGH4DZ7ayyoC8JE184C+IYe9Q8wsD+UYWTDXPWNGFZv1CewOdjxgoNZUDAEhdw7AN02TRnZfUWrGNiI+zXTUu+W7qOKSmtiAb0ajcB9eX+sPC80NFqg6tvqvEkYihoz6xBB14WawndVwiuEHb2PC+p7WqNhWGUVU/qUNKK8g/gFxUP2LBhBE3WD4ynx0W/JaeuV4ZG9cEfj9+n6wbkVUpXeNWGCP1g41TQGup0g2pGxRfPZhTP7zgoqRCR0WKQf2OCnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SJ2PR11MB7574.namprd11.prod.outlook.com (2603:10b6:a03:4ca::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 14:24:42 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 14:24:42 +0000
Date: Mon, 31 Mar 2025 22:24:33 +0800
From: kernel test robot <oliver.sang@intel.com>
To: <aubrey.li@linux.intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [anolis-intel-cloud:devel-5.10] [mm]  32c669c798:
 hackbench.throughput 75.2% regression
Message-ID: <202503312254.7a48f027-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR06CA0221.apcprd06.prod.outlook.com
 (2603:1096:4:68::29) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SJ2PR11MB7574:EE_
X-MS-Office365-Filtering-Correlation-Id: c258aaaf-50dd-4112-df74-08dd705fc6b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?02zRKHAZrVAhzOW2DRy9GRu9GC93oqEiEGlh0S785pgH2QDXKAO7/5DyvC?=
 =?iso-8859-1?Q?RBVQXxiUw/RY9Q4BaFiAHLJkkICBL6gHObCiqSPn1zWGrojfOQkaD+q6ig?=
 =?iso-8859-1?Q?QgoH44cdlcwOsG8TzBPBml5S1IVIvJcRSgMMywacXQ/xwkqcZFL/K2nQWk?=
 =?iso-8859-1?Q?XOLLf88CaDgvWxD/0DPUcem5F5LaagYMb9KnbEaweBa9NLkqgYkRmPGzvE?=
 =?iso-8859-1?Q?BuKc5Jw9DbcOnpeYRUYyCcpP4V28ArvXD4KxvLR+qssBrzbznaB+nNi5Vk?=
 =?iso-8859-1?Q?kMpP4kKETmhIsz9f+JwGYDo3I8O08WXRSGH5X0DtPiJJ6E4af4y2kjYnBS?=
 =?iso-8859-1?Q?FTz0WM/Ap6UpLgpd4yF7zlJdyPsl4jDcSGEx5689nwV4OfboUCdA4MjrOE?=
 =?iso-8859-1?Q?9CxcA+Xkoj1w8LG56vgkhB2VTlcdmYx0yXrCGxOvotv4IyvWpBLYCsqD2H?=
 =?iso-8859-1?Q?KOHjbw8FoeZ1K+thh53mz4CzcdbpHFP8PScb1i/f/Eaftt3oNnkL0vEod6?=
 =?iso-8859-1?Q?z2GoCDqTuPqxwbMqqgSiYU23mlWfhtdAN3OXH7XujC+RARQ8Nv4U0drgbT?=
 =?iso-8859-1?Q?fVgKBYnFXEwhCU6/eSqnAdwcgQQEfOQ0L5YEc6GxpNZVH6qMFhyqhgYbY1?=
 =?iso-8859-1?Q?ag7VARhMK1FU/wqLHxVL9RSir0xvfyD/4pUVLMoX8MaNo+BxYwiuSmNkJx?=
 =?iso-8859-1?Q?p9yDE/GRgSk43tCJziCT9UZvdK1C+i7bBWQlvFCQwEj4hAhybV8me//61z?=
 =?iso-8859-1?Q?bs8I7bpAYd/56P4PyNx9WUa9as9LDOrRdTZci8uqRtuhD7brvsqkv4bgR3?=
 =?iso-8859-1?Q?RERf/AK53odMVuwet+9J5CN+XvTGpG4+fpt2ufEhLQpZfmKkYrxWMGkMIA?=
 =?iso-8859-1?Q?wArCJa5xamZfzBsKX3f7pOPnBFmId4Y21kOSAVvugDLV3zsLV4kfrc5C3r?=
 =?iso-8859-1?Q?D34f/4oIhYLJUvP2mC/AODVeZ8Yp9Fpu7wGBpdoDRPocfMjPOkF27rroji?=
 =?iso-8859-1?Q?vnbiiYPmwoP60j/1qVVFwBhjkNa7p6+FYLBf3kWbtUg8T+iTtiE3eTolho?=
 =?iso-8859-1?Q?MPJp9VXVj9av8CfbuVoZQygTgw0ZYiypRJgd/SWxMDs4/oElkjoR8L8Blx?=
 =?iso-8859-1?Q?Vdyz8mcY1DlVlIsyyy/S9RQgwdA0DtixlLscQ6M+/ibkGiOZqh9vHk1kNd?=
 =?iso-8859-1?Q?Is70Kt1WZbAFMlk6BHTv9TfsGR68JqsFBMtkSvTLVHSwxYNRSL9RynvR6N?=
 =?iso-8859-1?Q?8yAqeWBDZkbnQtVvp45ieMgeqzUljarR2D+n2ABbGbUlsKM2oZWhtRsO5l?=
 =?iso-8859-1?Q?UDrGw7grGNFWX+k28w2yI2b+U6vv4r+SPpluEhDnDxedksoe28XulYK3FF?=
 =?iso-8859-1?Q?Kjmy7TT7YZQjHuvo012Dvez5gsIIj57IWrpqOiP+OQ2mLriqx1f0mdgD7o?=
 =?iso-8859-1?Q?QjIdPNLN4FQk/SBz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?cXmpvgJjfE4HD6CG08ytHQdEZA6KbathWf5SnimbCr2Z6BJke0cjQY+ts4?=
 =?iso-8859-1?Q?w71W/aDvOUGh0cWAbXObJqw2cpSyyQGtKuEiA/HpLHhlPwoo7YS7GviyaS?=
 =?iso-8859-1?Q?jNCf0WGsC26V9Gd8FqD+Vgb3aA4T0uZJvpyRRsfoQadWHHECX0WtJNcjO0?=
 =?iso-8859-1?Q?DWETk4f+wTXeUyqcYxT2jqFXPv/pSJCN1gQK/pRB4JFwyjthmVI19tc5ku?=
 =?iso-8859-1?Q?y68jnknl5wouPgr/vMXKjnVhipbLiGVUIYMOPSXcBZf590cRx73Z+9v7aq?=
 =?iso-8859-1?Q?9qGr76SJ14tLmLbUoUg4ZQNQIi6woSrUYG9Ml18QoFvOA4BBp8ioG070yz?=
 =?iso-8859-1?Q?LmNHtDuRhinJGoG35OO4EuFdIoPkb7r7Ziqcy2O9/6HQPbZbE+AVu5gPLv?=
 =?iso-8859-1?Q?kHOluuC0ljV2FTDmdM3PlE4Jj3H2NnVqe9O+Wf1IGgGTtPif1sgS/9ezYA?=
 =?iso-8859-1?Q?kFvGi1ygu61UBeXRjSKojEZkW4auDkrEIr1dGtmIat/EjvrzPQGW2RBYY+?=
 =?iso-8859-1?Q?lXi5Avy4LCXDfU42deE0HYyuNE7EXthRtfZMfiZnSbwnyLwPdPKiMUxJM6?=
 =?iso-8859-1?Q?qNU8sVKEU10K7CWuQj+H8gl5IVVvThTi+oJefiAYC5pde2xI6IKGCsM65h?=
 =?iso-8859-1?Q?2upopUARZcZBLN1hqldC+/2mMuhDfHPeDf4fTy3GcuAR/hYf+PEK8zzTSL?=
 =?iso-8859-1?Q?j68kVeMTbXwr+FzTXbzx1khRiL9thOHGCJjEvtbVCVcCRs7RuaGCFcFSdE?=
 =?iso-8859-1?Q?ulZAhFfqEjucfrej7BVnfDNBJMxBiDoLeTKUL4GGT3Fvxgd5b4jX0ZNFT8?=
 =?iso-8859-1?Q?Pe4HtbxQi/3mXtYFFRuayLby39GjW8V8zAVbcxdoj9rpgRhzrvSCQSdWKu?=
 =?iso-8859-1?Q?3gHdffZ6z5ZMELNTTkxO76Ni/wO1CsFkrd5S0CHl05vEepOkWMnvg+qp7m?=
 =?iso-8859-1?Q?yrYDkAcJIyEUHhvulXpKh5bl06XWxQWLn/IS6ultey5iA4IYZQuI9jidvV?=
 =?iso-8859-1?Q?KDmr3DhSErR416RduZydj8tKO7Op8Aln+cKoB9ERgLiwTHbLQ596qI/uIM?=
 =?iso-8859-1?Q?9d1ucUSBt8H2JDPbge2+8OQLs6qH0WptSHy1dQtYbyB/fAnR5q8yo9mvYf?=
 =?iso-8859-1?Q?jqiuNWTR9wyv2lPvtr4AXIcUMeT+S3Br/Wy+3zvZ11+Sjv9CPUwEWbfkjM?=
 =?iso-8859-1?Q?3kt/AbYQYy9o0QugA8u13toRIXxg5xM0nSHob98tnOGq7KBUydcqSX9IQo?=
 =?iso-8859-1?Q?GjNgobBkZm9G4TF31RBf63V2rNesRderjNrr1RfOl89agdlDYNCadrB+b9?=
 =?iso-8859-1?Q?gLQPN2lZT9yJdQqjcV4/aWM2TrltXNoFBIWGAEkpKoWiDfW3giyO9WHMQF?=
 =?iso-8859-1?Q?6EE+IjRusnEnAQ/t7dJ8YPaukXOd2s/ZAwxtUyW+e4AcjgZ01s1Ucusrt3?=
 =?iso-8859-1?Q?eBbrq85/848YAbXaGULUEyYSOsmStXdIeUSQmGKNgrQDyKfAh1EmV/QES+?=
 =?iso-8859-1?Q?U56dnQQBF1nUuUsaUQzdHEPNgOBxkKrlGSKlMg9nZINbVGtXPVA4sPb0/q?=
 =?iso-8859-1?Q?qNyfpyybSbkNPGIFR4f0ctjCfPhxQooKBaGycipfz6BcQQkaPbakOlAPtF?=
 =?iso-8859-1?Q?J8Y8YdQqcmkUJDzkt6nDnPrqpecCFUY67KbA171Z1niGVIR6BKgx07xQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c258aaaf-50dd-4112-df74-08dd705fc6b4
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 14:24:42.0682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yQkBddPUp2Hb4Gei7SBIcfWRQqy5P4S1aDJe9VUMafQG9YxBS924O2uqfGPkY2ic38Y6ErW9YrxPAiXzH6/xoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7574
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 75.2% regression of hackbench.throughput on:


commit: 32c669c798f889e6003003aa5a2efd1d367c1a46 ("mm: multi-gen LRU: support page table walks")
https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10

testcase: hackbench
config: x86_64-anolis-intel-cloud-devel-5.10
compiler: gcc-12
test machine: 240 threads 1 sockets Genuine Intel(R) 0000 (Granite Rapids) with 192G memory
parameters:

	nr_threads: 100%
	iterations: 8
	mode: threads
	ipc: pipe
	cpufreq_governor: performance




If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202503312254.7a48f027-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250331/202503312254.7a48f027-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/ipc/iterations/kconfig/mode/nr_threads/rootfs/tbox_group/testcase:
  gcc-12/performance/pipe/8/x86_64-anolis-intel-cloud-devel-5.10/threads/100%/debian-12-x86_64-20240206.cgz/lkp-gnr-1ap1/hackbench

commit: 
  1cb7e0178e ("mm: multi-gen LRU: exploit locality in rmap")
  32c669c798 ("mm: multi-gen LRU: support page table walks")

1cb7e0178e98589b 32c669c798f889e6003003aa5a2 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
  26991224 ±  3%     -47.1%   14270500 ±  6%  cpuidle..usage
    484.31 ±  4%    +166.6%       1291 ±  6%  uptime.boot
      0.02 ±  4%      +0.0        0.03 ±  3%  mpstat.cpu.all.soft%
      8.23 ±  4%      -3.7        4.57 ±  3%  mpstat.cpu.all.usr%
  76191455 ±  7%     -79.5%   15628097 ±  3%  vmstat.system.cs
    672978 ±  3%     -53.7%     311773 ±  3%  vmstat.system.in
    580614 ±  6%     -18.9%     470819 ± 10%  meminfo.Active
    580614 ±  6%     -18.9%     470819 ± 10%  meminfo.Active(anon)
    280645 ±  4%     +26.9%     356199 ± 14%  meminfo.AnonHugePages
    148918 ±  2%      +8.6%     161758 ±  2%  meminfo.KernelStack
    778.85 ± 15%    +163.4%       2051 ±  4%  meminfo.Mlocked
   1001954 ±  3%     -75.2%     248420 ±  5%  hackbench.throughput
    766109 ±  7%     -72.6%     209610 ±  2%  hackbench.throughput_avg
   1001954 ±  3%     -75.2%     248420 ±  5%  hackbench.throughput_best
    436225 ± 39%     -66.5%     146122 ±  8%  hackbench.throughput_worst
    297.94 ±  6%    +261.3%       1076 ±  2%  hackbench.time.elapsed_time
    297.94 ±  6%    +261.3%       1076 ±  2%  hackbench.time.elapsed_time.max
 1.101e+10           -25.9%  8.164e+09 ±  2%  hackbench.time.involuntary_context_switches
     23433            +1.5%      23777        hackbench.time.percent_of_cpu_this_job_got
     63957 ±  7%    +282.0%     244288 ±  2%  hackbench.time.system_time
      5872 ±  2%     +99.1%      11689        hackbench.time.user_time
 1.192e+10           -25.3%  8.904e+09 ±  2%  hackbench.time.voluntary_context_switches
    145303 ±  6%     -19.3%     117304 ± 10%  proc-vmstat.nr_active_anon
    149266            +7.9%     161040 ±  3%  proc-vmstat.nr_kernel_stack
    196.58 ± 15%    +162.7%     516.34 ±  4%  proc-vmstat.nr_mlock
     45557            +2.8%      46823        proc-vmstat.nr_slab_reclaimable
    125796            +2.3%     128652        proc-vmstat.nr_slab_unreclaimable
    145303 ±  6%     -19.3%     117304 ± 10%  proc-vmstat.nr_zone_active_anon
  57687614 ±  2%     -23.1%   44371777 ±  3%  proc-vmstat.numa_hit
  57687614 ±  2%     -23.1%   44371777 ±  3%  proc-vmstat.numa_local
  57946303 ±  2%     -22.9%   44680456 ±  3%  proc-vmstat.pgalloc_normal
   1126082           +68.3%    1895204 ±  3%  proc-vmstat.pgfault
  56958848 ±  3%     -23.2%   43736493 ±  3%  proc-vmstat.pgfree
     24484 ±  3%    +162.5%      64279 ±  4%  proc-vmstat.pgreuse
 1.047e+11 ±  2%     -75.8%  2.539e+10 ±  7%  perf-stat.i.branch-instructions
 8.264e+08 ±  3%     -79.2%  1.715e+08 ±  7%  perf-stat.i.branch-misses
   2200936 ± 14%     -59.5%     890742 ±  7%  perf-stat.i.cache-misses
 3.848e+09 ±  2%     -73.9%  1.005e+09 ±  8%  perf-stat.i.cache-references
  81749108 ±  3%     -81.0%   15537780 ±  7%  perf-stat.i.context-switches
      1.70 ±  4%    +289.2%       6.63 ±  6%  perf-stat.i.cpi
  19256624 ±  4%     -75.5%    4727231 ±  7%  perf-stat.i.cpu-migrations
   1328906 ± 14%    +170.9%    3599647 ± 10%  perf-stat.i.cycles-between-cache-misses
 5.118e+11 ±  2%     -76.0%  1.228e+11 ±  7%  perf-stat.i.instructions
      0.65 ±  2%     -71.4%       0.18 ± 29%  perf-stat.i.ipc
      1.51 ± 12%     -75.4%       0.37 ± 10%  perf-stat.i.major-faults
    420.93 ±  3%     -80.0%      84.21 ±  7%  perf-stat.i.metric.K/sec
      3259 ±  7%     -39.6%       1970 ±  4%  perf-stat.i.minor-faults
      3260 ±  7%     -39.6%       1970 ±  4%  perf-stat.i.page-faults
      0.00 ± 10%     +24.9%       0.01 ±  4%  perf-stat.overall.MPKI
      0.77 ±  2%      -0.1        0.66        perf-stat.overall.branch-miss-rate%
      1.62 ±  5%    +291.3%       6.34        perf-stat.overall.cpi
    373506 ± 14%    +209.3%    1155397 ±  5%  perf-stat.overall.cycles-between-cache-misses
      0.62 ±  5%     -74.5%       0.16        perf-stat.overall.ipc
 1.007e+11 ±  4%     -74.1%  2.613e+10 ±  3%  perf-stat.ps.branch-instructions
 7.798e+08 ±  6%     -77.9%   1.72e+08 ±  3%  perf-stat.ps.branch-misses
   2173046 ± 16%     -68.1%     692560 ±  4%  perf-stat.ps.cache-misses
 3.615e+09 ±  4%     -73.5%  9.593e+08 ±  4%  perf-stat.ps.cache-references
  76722852 ±  7%     -79.6%   15626388 ±  3%  perf-stat.ps.context-switches
  18081629 ±  7%     -74.2%    4667473 ±  3%  perf-stat.ps.cpu-migrations
 4.911e+11 ±  4%     -74.3%  1.261e+11 ±  3%  perf-stat.ps.instructions
      1.67 ±  6%     -72.3%       0.46 ±  4%  perf-stat.ps.major-faults
      3365 ±  5%     -52.3%       1606        perf-stat.ps.minor-faults
      3366 ±  5%     -52.3%       1607        perf-stat.ps.page-faults
 1.472e+14            -6.4%  1.378e+14        perf-stat.total.instructions
     12155 ±  7%    +196.6%      36047 ±  5%  sched_debug.cfs_rq:/.MIN_vruntime.avg
     50070 ± 13%     +54.3%      77267 ±  8%  sched_debug.cfs_rq:/.MIN_vruntime.max
      5651 ± 23%    +285.2%      21767 ± 16%  sched_debug.cfs_rq:/.MIN_vruntime.min
     12159 ±  7%    +196.5%      36052 ±  5%  sched_debug.cfs_rq:/.max_vruntime.avg
     50073 ± 13%     +54.3%      77271 ±  8%  sched_debug.cfs_rq:/.max_vruntime.max
      5654 ± 23%    +285.1%      21772 ± 16%  sched_debug.cfs_rq:/.max_vruntime.min
     12338 ±  7%    +206.2%      37782 ±  5%  sched_debug.cfs_rq:/.min_vruntime.avg
     58773 ± 11%     +41.1%      82953 ±  5%  sched_debug.cfs_rq:/.min_vruntime.max
      9315 ±  8%    +201.7%      28101 ± 12%  sched_debug.cfs_rq:/.min_vruntime.min
      7.15 ± 50%    +116.3%      15.46 ± 14%  sched_debug.cfs_rq:/.removed.load_avg.avg
      7.71 ± 42%    +121.3%      17.07 ± 13%  sched_debug.cfs_rq:/.removed.runnable_avg.avg
    443.97 ± 22%     +40.1%     622.09 ± 25%  sched_debug.cfs_rq:/.removed.runnable_avg.max
     37.78 ± 26%     +63.3%      61.68 ± 19%  sched_debug.cfs_rq:/.removed.runnable_avg.stddev
      2.93 ± 48%    +173.6%       8.02 ±  8%  sched_debug.cfs_rq:/.removed.util_avg.avg
      8.55 ± 43%    +136.6%      20.23 ±  6%  sched_debug.cfs_rq:/.removed.util_avg.stddev
     47.91 ± 61%    +173.7%     131.15 ± 33%  sched_debug.cfs_rq:/.spread.max
      5.49 ± 32%     +79.2%       9.84 ± 25%  sched_debug.cfs_rq:/.spread.stddev
    839.02           +12.4%     942.97 ±  4%  sched_debug.cfs_rq:/.util_avg.avg
    109.99 ±  7%     -14.2%      94.38 ±  5%  sched_debug.cfs_rq:/.util_avg.stddev
    488.41 ±  2%     +17.8%     575.34 ±  4%  sched_debug.cfs_rq:/.util_est_enqueued.avg
      1407 ±  7%     -15.0%       1196 ±  4%  sched_debug.cfs_rq:/.util_est_enqueued.max
      1626 ±  5%    +130.8%       3754 ±105%  sched_debug.cpu.avg_idle.min
    318472 ±  4%    +129.8%     731879 ±  8%  sched_debug.cpu.clock.avg
    320291 ±  4%    +131.1%     740128 ±  8%  sched_debug.cpu.clock.max
    316414 ±  4%    +128.5%     723126 ±  8%  sched_debug.cpu.clock.min
      1114 ± 20%    +343.2%       4941 ±  3%  sched_debug.cpu.clock.stddev
    317858 ±  4%    +129.5%     729473 ±  8%  sched_debug.cpu.clock_task.avg
    319719 ±  4%    +130.8%     737775 ±  8%  sched_debug.cpu.clock_task.max
    314180 ±  4%    +128.7%     718539 ±  8%  sched_debug.cpu.clock_task.min
      1175 ± 18%    +323.7%       4979 ±  3%  sched_debug.cpu.clock_task.stddev
     34399 ±  8%     +26.0%      43341 ±  5%  sched_debug.cpu.curr->pid.avg
     39155 ±  7%     +28.4%      50292 ±  4%  sched_debug.cpu.curr->pid.max
     27239 ± 22%     +26.2%      34383 ±  9%  sched_debug.cpu.curr->pid.min
      2428 ±  9%     +15.7%       2810 ±  6%  sched_debug.cpu.curr->pid.stddev
      0.00 ± 20%    +356.8%       0.01 ±  8%  sched_debug.cpu.next_balance.stddev
  39072381 ±  9%     -14.3%   33499537 ±  5%  sched_debug.cpu.nr_switches.avg
  49442574 ± 10%     -24.9%   37113768 ±  4%  sched_debug.cpu.nr_switches.max
   4272296 ± 10%     -59.0%    1750432 ±  3%  sched_debug.cpu.nr_switches.stddev
      0.20 ± 39%     -76.9%       0.05 ±102%  sched_debug.cpu.nr_uninterruptible.avg
    316394 ±  4%    +128.5%     723001 ±  8%  sched_debug.cpu_clk
    315506 ±  4%    +128.9%     722113 ±  8%  sched_debug.ktime
      0.00 ±158%  +48893.5%       0.42 ± 57%  sched_debug.rt_rq:.rt_time.avg
      0.01 ±141%  +1.9e+06%     101.07 ± 57%  sched_debug.rt_rq:.rt_time.max
      0.00 ±144%  +3.7e+05%       6.51 ± 57%  sched_debug.rt_rq:.rt_time.stddev
    322773 ±  4%    +126.0%     729377 ±  8%  sched_debug.sched_clk
    126.16 ± 51%    +209.1%     389.93 ± 17%  perf-sched.sch_delay.avg.ms._cond_resched.stop_one_cpu.__set_cpus_allowed_ptr.sched_setaffinity.__x64_sys_sched_setaffinity
     16.00 ± 63%    +289.0%      62.22 ± 16%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSCALL_64_after_hwframe.[unknown]
      3.22 ± 48%    +208.1%       9.93 ± 30%  perf-sched.sch_delay.avg.ms.pipe_read.new_sync_read.vfs_read.ksys_read
      0.83 ±101%   +1886.1%      16.44 ± 36%  perf-sched.sch_delay.avg.ms.pipe_write.new_sync_write.vfs_write.ksys_write
      0.46 ± 71%    +166.8%       1.21 ± 38%  perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.pipe_read
    174.97 ±202%    +885.1%       1723 ± 72%  perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.pipe_write
      5860 ± 60%    +187.8%      16867 ± 37%  perf-sched.sch_delay.max.ms._cond_resched.stop_one_cpu.__set_cpus_allowed_ptr.sched_setaffinity.__x64_sys_sched_setaffinity
     40407 ± 47%    +154.9%     102998 ± 14%  perf-sched.sch_delay.max.ms.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSCALL_64_after_hwframe.[unknown]
     33241 ± 57%    +197.4%      98856 ± 15%  perf-sched.sch_delay.max.ms.pipe_read.new_sync_read.vfs_read.ksys_read
      8473 ±182%   +1057.5%      98078 ± 15%  perf-sched.sch_delay.max.ms.pipe_write.new_sync_write.vfs_write.ksys_write
      9.40 ± 60%    +273.4%      35.09 ± 17%  perf-sched.total_sch_delay.average.ms
     40469 ± 47%    +155.0%     103213 ± 14%  perf-sched.total_sch_delay.max.ms
     46.88 ± 58%    +364.0%     217.53 ± 15%  perf-sched.total_wait_and_delay.average.ms
     81068 ± 47%    +154.6%     206426 ± 14%  perf-sched.total_wait_and_delay.max.ms
     37.48 ± 57%    +386.7%     182.43 ± 15%  perf-sched.total_wait_time.average.ms
     40619 ± 46%    +154.1%     103213 ± 14%  perf-sched.total_wait_time.max.ms
     61.44 ± 45%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms._cond_resched.generic_perform_write.__generic_file_write_iter.generic_file_write_iter.new_sync_write
    252.63 ± 51%    +209.7%     782.32 ± 17%  perf-sched.wait_and_delay.avg.ms._cond_resched.stop_one_cpu.__set_cpus_allowed_ptr.sched_setaffinity.__x64_sys_sched_setaffinity
     33.23 ± 63%    +280.6%     126.45 ± 16%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSCALL_64_after_hwframe.[unknown]
     58.33 ± 56%    +301.1%     233.98 ± 15%  perf-sched.wait_and_delay.avg.ms.pipe_read.new_sync_read.vfs_read.ksys_read
     66.92 ± 94%   +1254.1%     906.14 ± 16%  perf-sched.wait_and_delay.avg.ms.pipe_write.new_sync_write.vfs_write.ksys_write
    344.97 ±206%    +990.0%       3759 ± 58%  perf-sched.wait_and_delay.avg.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.pipe_write
      5801 ±126%    +354.2%      26352 ± 15%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.load_calc_func.kthread.ret_from_fork
     29.00 ±165%    -100.0%       0.00        perf-sched.wait_and_delay.count._cond_resched.generic_perform_write.__generic_file_write_iter.generic_file_write_iter.new_sync_write
     78.83 ±135%     -99.2%       0.67 ±141%  perf-sched.wait_and_delay.count.do_task_dead.do_exit.__x64_sys_exit.do_syscall_64.entry_SYSCALL_64_after_hwframe
     14971 ± 52%    +846.2%     141669 ±  4%  perf-sched.wait_and_delay.count.pipe_write.new_sync_write.vfs_write.ksys_write
    172.00 ± 98%     -74.7%      43.50 ± 27%  perf-sched.wait_and_delay.count.worker_thread.kthread.ret_from_fork
    103.54 ± 30%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms._cond_resched.generic_perform_write.__generic_file_write_iter.generic_file_write_iter.new_sync_write
     11720 ± 60%    +187.8%      33735 ± 37%  perf-sched.wait_and_delay.max.ms._cond_resched.stop_one_cpu.__set_cpus_allowed_ptr.sched_setaffinity.__x64_sys_sched_setaffinity
     80814 ± 47%    +154.9%     205996 ± 14%  perf-sched.wait_and_delay.max.ms.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSCALL_64_after_hwframe.[unknown]
     66785 ± 56%    +196.0%     197713 ± 15%  perf-sched.wait_and_delay.max.ms.pipe_read.new_sync_read.vfs_read.ksys_read
     27417 ±104%    +615.5%     196166 ± 15%  perf-sched.wait_and_delay.max.ms.pipe_write.new_sync_write.vfs_write.ksys_write
     13890 ±138%   +1096.3%     166170 ± 31%  perf-sched.wait_and_delay.max.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.pipe_write
     11857 ±122%    +385.9%      57615 ± 27%  perf-sched.wait_and_delay.max.ms.schedule_timeout.load_calc_func.kthread.ret_from_fork
     40476 ± 43%    +142.9%      98335 ± 15%  perf-sched.wait_and_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork
    126.47 ± 51%    +210.3%     392.40 ± 17%  perf-sched.wait_time.avg.ms._cond_resched.stop_one_cpu.__set_cpus_allowed_ptr.sched_setaffinity.__x64_sys_sched_setaffinity
     17.23 ± 63%    +272.8%      64.24 ± 17%  perf-sched.wait_time.avg.ms.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSCALL_64_after_hwframe.[unknown]
     55.10 ± 56%    +306.6%     224.05 ± 15%  perf-sched.wait_time.avg.ms.pipe_read.new_sync_read.vfs_read.ksys_read
     67.37 ± 91%   +1220.7%     889.69 ± 16%  perf-sched.wait_time.avg.ms.pipe_write.new_sync_write.vfs_write.ksys_write
    176.40 ±200%   +1054.3%       2036 ± 48%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.pipe_write
      5790 ±126%    +355.1%      26352 ± 15%  perf-sched.wait_time.avg.ms.schedule_timeout.load_calc_func.kthread.ret_from_fork
    675.89 ± 44%    +161.9%       1770 ± 67%  perf-sched.wait_time.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      5860 ± 60%    +187.8%      16867 ± 37%  perf-sched.wait_time.max.ms._cond_resched.stop_one_cpu.__set_cpus_allowed_ptr.sched_setaffinity.__x64_sys_sched_setaffinity
     40418 ± 47%    +154.8%     102998 ± 14%  perf-sched.wait_time.max.ms.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSCALL_64_after_hwframe.[unknown]
     38058 ± 48%    +164.1%     100507 ± 14%  perf-sched.wait_time.max.ms.pipe_read.new_sync_read.vfs_read.ksys_read
     20067 ± 78%    +403.1%     100955 ± 14%  perf-sched.wait_time.max.ms.pipe_write.new_sync_write.vfs_write.ksys_write
      7137 ±132%   +1197.2%      92589 ± 27%  perf-sched.wait_time.max.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.pipe_write
     11788 ±123%    +388.8%      57615 ± 27%  perf-sched.wait_time.max.ms.schedule_timeout.load_calc_func.kthread.ret_from_fork
     39785 ± 47%    +147.2%      98334 ± 15%  perf-sched.wait_time.max.ms.smpboot_thread_fn.kthread.ret_from_fork
     15.58 ±  4%      -9.4        6.19 ±  5%  perf-profile.calltrace.cycles.select_task_rq_fair.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock
     12.99 ±  6%      -8.1        4.91 ±  7%  perf-profile.calltrace.cycles.select_idle_sibling.select_task_rq_fair.try_to_wake_up.autoremove_wake_function.__wake_up_common
      7.87 ±  5%      -4.1        3.76 ±  8%  perf-profile.calltrace.cycles.select_idle_cpu.select_idle_sibling.select_task_rq_fair.try_to_wake_up.autoremove_wake_function
     40.71            -2.0       38.75        perf-profile.calltrace.cycles.read
      2.08 ±  7%      -1.5        0.62 ±  3%  perf-profile.calltrace.cycles.rseq_ip_fixup.__rseq_handle_notify_resume.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSCALL_64_after_hwframe
      1.98 ±  6%      -1.2        0.73 ±  2%  perf-profile.calltrace.cycles.__rseq_handle_notify_resume.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSCALL_64_after_hwframe.read
      3.49 ±  6%      -1.2        2.32 ±  2%  perf-profile.calltrace.cycles.syscall_exit_to_user_mode.entry_SYSCALL_64_after_hwframe.read
      1.98 ±  3%      -1.1        0.83 ±  4%  perf-profile.calltrace.cycles.copy_page_to_iter.pipe_read.new_sync_read.vfs_read.ksys_read
      2.05 ±  2%      -1.1        0.91 ± 17%  perf-profile.calltrace.cycles._raw_spin_lock.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock
      1.64 ±  5%      -1.1        0.56 ±  2%  perf-profile.calltrace.cycles.id_idle_cpu.select_idle_sibling.select_task_rq_fair.try_to_wake_up.autoremove_wake_function
      3.30 ±  6%      -1.0        2.29 ±  2%  perf-profile.calltrace.cycles.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSCALL_64_after_hwframe.read
      2.18 ± 13%      -1.0        1.18 ±  3%  perf-profile.calltrace.cycles.wake_affine.select_task_rq_fair.try_to_wake_up.autoremove_wake_function.__wake_up_common
      3.21 ±  3%      -0.9        2.32 ±  8%  perf-profile.calltrace.cycles.id_idle_cpu.select_idle_cpu.select_idle_sibling.select_task_rq_fair.try_to_wake_up
      1.55 ± 15%      -0.8        0.74 ±  5%  perf-profile.calltrace.cycles.mutex_unlock.pipe_write.new_sync_write.vfs_write.ksys_write
      3.07 ±  3%      -0.8        2.26 ±  8%  perf-profile.calltrace.cycles.available_idle_cpu.id_idle_cpu.select_idle_cpu.select_idle_sibling.select_task_rq_fair
      1.02 ±  7%      -0.8        0.26 ±100%  perf-profile.calltrace.cycles.rseq_get_rseq_cs.rseq_ip_fixup.__rseq_handle_notify_resume.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      1.88 ±  6%      -0.7        1.22 ±  5%  perf-profile.calltrace.cycles.restore_fpregs_from_fpstate.read
      1.54 ± 14%      -0.5        0.99 ±  4%  perf-profile.calltrace.cycles.task_h_load.wake_affine.select_task_rq_fair.try_to_wake_up.autoremove_wake_function
      0.37 ± 71%      +0.3        0.71 ±  5%  perf-profile.calltrace.cycles._raw_spin_lock_irq.pipe_read.new_sync_read.vfs_read.ksys_read
      0.00            +1.0        1.01 ±  6%  perf-profile.calltrace.cycles.perf_tp_event.perf_trace_sched_switch.__schedule.schedule.pipe_write
      0.00            +1.0        1.02 ±  6%  perf-profile.calltrace.cycles.perf_trace_sched_switch.__schedule.schedule.pipe_write.new_sync_write
      0.00            +1.2        1.16 ±  6%  perf-profile.calltrace.cycles.schedule.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSCALL_64_after_hwframe.read
      0.00            +1.2        1.18 ±  5%  perf-profile.calltrace.cycles.dequeue_entity.dequeue_task_fair.__schedule.schedule.pipe_write
      0.00            +1.2        1.19 ±  4%  perf-profile.calltrace.cycles.dequeue_task_fair.__schedule.schedule.pipe_write.new_sync_write
     34.43            +1.6       36.02        perf-profile.calltrace.cycles.entry_SYSCALL_64_after_hwframe.read
      8.84 ±  6%      +1.9       10.77        perf-profile.calltrace.cycles.syscall_exit_to_user_mode.entry_SYSCALL_64_after_hwframe.write
      8.60 ±  6%      +2.1       10.74        perf-profile.calltrace.cycles.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSCALL_64_after_hwframe.write
      0.69 ± 52%      +2.2        2.86 ±  5%  perf-profile.calltrace.cycles.__wake_up_common_lock.pipe_read.new_sync_read.vfs_read.ksys_read
      0.63 ± 53%      +2.2        2.80 ±  5%  perf-profile.calltrace.cycles.autoremove_wake_function.__wake_up_common.__wake_up_common_lock.pipe_read.new_sync_read
      0.63 ± 54%      +2.2        2.80 ±  5%  perf-profile.calltrace.cycles.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock.pipe_read
      0.64 ± 54%      +2.2        2.81 ±  5%  perf-profile.calltrace.cycles.__wake_up_common.__wake_up_common_lock.pipe_read.new_sync_read.vfs_read
      0.08 ±223%      +2.3        2.36 ±  5%  perf-profile.calltrace.cycles.__schedule.schedule.pipe_write.new_sync_write.vfs_write
      0.09 ±223%      +2.3        2.36 ±  5%  perf-profile.calltrace.cycles.schedule.pipe_write.new_sync_write.vfs_write.ksys_write
     58.23            +2.5       60.77        perf-profile.calltrace.cycles.write
     30.64            +3.0       33.63        perf-profile.calltrace.cycles.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
     30.16            +3.3       33.44        perf-profile.calltrace.cycles.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      6.38 ±  6%      +4.0       10.36        perf-profile.calltrace.cycles.schedule.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSCALL_64_after_hwframe.write
      0.00            +4.1        4.08 ±  2%  perf-profile.calltrace.cycles.unwind_next_frame.perf_callchain_kernel.get_perf_callchain.perf_callchain.perf_prepare_sample
     28.42            +4.5       32.94        perf-profile.calltrace.cycles.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      0.00            +4.6        4.61        perf-profile.calltrace.cycles.unwind_next_frame.__unwind_start.perf_callchain_kernel.get_perf_callchain.perf_callchain
     43.25 ±  2%      +5.0       48.23        perf-profile.calltrace.cycles.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      0.00            +5.0        5.00        perf-profile.calltrace.cycles.__unwind_start.perf_callchain_kernel.get_perf_callchain.perf_callchain.perf_prepare_sample
     42.97 ±  2%      +5.2       48.16        perf-profile.calltrace.cycles.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      6.20 ±  6%      +5.3       11.49        perf-profile.calltrace.cycles.__schedule.schedule.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSCALL_64_after_hwframe
     25.94            +6.1       32.00        perf-profile.calltrace.cycles.new_sync_read.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
     25.28            +6.5       31.79        perf-profile.calltrace.cycles.pipe_read.new_sync_read.vfs_read.ksys_read.do_syscall_64
      0.00            +6.6        6.56 ±  2%  perf-profile.calltrace.cycles.asm_exc_page_fault.__get_user_nocheck_8.perf_callchain_user.get_perf_callchain.perf_callchain
     52.42            +6.6       59.06        perf-profile.calltrace.cycles.entry_SYSCALL_64_after_hwframe.write
      1.83 ± 11%      +6.8        8.63        perf-profile.calltrace.cycles.set_task_cpu.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock
     40.10 ±  2%      +7.5       47.57        perf-profile.calltrace.cycles.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      5.33 ±  4%      +7.6       12.98        perf-profile.calltrace.cycles.ttwu_do_activate.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock
      0.00            +7.8        7.76        perf-profile.calltrace.cycles.perf_prepare_sample.perf_event_output_forward.__perf_event_overflow.perf_tp_event.perf_trace_sched_migrate_task
      0.00            +7.8        7.79        perf-profile.calltrace.cycles.perf_event_output_forward.__perf_event_overflow.perf_tp_event.perf_trace_sched_migrate_task.set_task_cpu
      5.07 ±  4%      +7.8       12.86        perf-profile.calltrace.cycles.enqueue_task_fair.ttwu_do_activate.try_to_wake_up.autoremove_wake_function.__wake_up_common
      0.00            +7.8        7.81        perf-profile.calltrace.cycles.__perf_event_overflow.perf_tp_event.perf_trace_sched_migrate_task.set_task_cpu.try_to_wake_up
      0.00            +7.9        7.88        perf-profile.calltrace.cycles.perf_tp_event.perf_trace_sched_migrate_task.set_task_cpu.try_to_wake_up.autoremove_wake_function
      0.00            +8.0        7.96        perf-profile.calltrace.cycles.perf_trace_sched_migrate_task.set_task_cpu.try_to_wake_up.autoremove_wake_function.__wake_up_common
     39.14 ±  3%      +8.1       47.21        perf-profile.calltrace.cycles.new_sync_write.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
     38.75 ±  3%      +8.1       46.88        perf-profile.calltrace.cycles.pipe_write.new_sync_write.vfs_write.ksys_write.do_syscall_64
      4.57 ±  4%      +8.1       12.72        perf-profile.calltrace.cycles.enqueue_entity.enqueue_task_fair.ttwu_do_activate.try_to_wake_up.autoremove_wake_function
      4.75 ±  3%      +8.4       13.20        perf-profile.calltrace.cycles.dequeue_task_fair.__schedule.schedule.pipe_read.new_sync_read
      3.54 ±  3%      +9.4       12.95        perf-profile.calltrace.cycles.dequeue_entity.dequeue_task_fair.__schedule.schedule.pipe_read
      0.00            +9.7        9.71        perf-profile.calltrace.cycles.perf_tp_event.perf_trace_sched_switch.__schedule.schedule.pipe_read
      0.00            +9.8        9.80        perf-profile.calltrace.cycles.perf_trace_sched_switch.__schedule.schedule.pipe_read.new_sync_read
      0.00            +9.9        9.93        perf-profile.calltrace.cycles.perf_tp_event.perf_trace_sched_switch.__schedule.schedule.exit_to_user_mode_prepare
     15.78 ±  3%     +10.0       25.74        perf-profile.calltrace.cycles.schedule.pipe_read.new_sync_read.vfs_read.ksys_read
      0.00           +10.0       10.03        perf-profile.calltrace.cycles.perf_trace_sched_switch.__schedule.schedule.exit_to_user_mode_prepare.syscall_exit_to_user_mode
     15.54 ±  3%     +10.1       25.67        perf-profile.calltrace.cycles.__schedule.schedule.pipe_read.new_sync_read.vfs_read
     31.51 ±  3%     +10.7       42.17        perf-profile.calltrace.cycles.__wake_up_common_lock.pipe_write.new_sync_write.vfs_write.ksys_write
     30.88 ±  3%     +10.7       41.60        perf-profile.calltrace.cycles.__wake_up_common.__wake_up_common_lock.pipe_write.new_sync_write.vfs_write
      0.00           +10.9       10.88 ±  2%  perf-profile.calltrace.cycles.perf_callchain_kernel.get_perf_callchain.perf_callchain.perf_prepare_sample.perf_event_output_forward
      0.81 ±  5%     +11.0       11.84        perf-profile.calltrace.cycles.update_curr.enqueue_entity.enqueue_task_fair.ttwu_do_activate.try_to_wake_up
     29.90 ±  3%     +11.1       41.02        perf-profile.calltrace.cycles.autoremove_wake_function.__wake_up_common.__wake_up_common_lock.pipe_write.new_sync_write
      0.00           +11.1       11.12        perf-profile.calltrace.cycles.__perf_event_overflow.perf_tp_event.perf_trace_sched_stat_runtime.update_curr.enqueue_entity
     29.80 ±  3%     +11.2       41.00        perf-profile.calltrace.cycles.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock.pipe_write
      0.00           +11.5       11.47        perf-profile.calltrace.cycles.perf_tp_event.perf_trace_sched_stat_runtime.update_curr.enqueue_entity.enqueue_task_fair
      0.00           +11.6       11.62        perf-profile.calltrace.cycles.perf_trace_sched_stat_runtime.update_curr.enqueue_entity.enqueue_task_fair.ttwu_do_activate
      0.59 ±  2%     +11.7       12.28        perf-profile.calltrace.cycles.perf_trace_sched_wakeup_template.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock
      0.00           +11.8       11.79        perf-profile.calltrace.cycles.perf_prepare_sample.perf_event_output_forward.__perf_event_overflow.perf_tp_event.perf_trace_sched_wakeup_template
      0.00           +11.8       11.84        perf-profile.calltrace.cycles.perf_event_output_forward.__perf_event_overflow.perf_tp_event.perf_trace_sched_wakeup_template.try_to_wake_up
      0.00           +11.9       11.87        perf-profile.calltrace.cycles.__perf_event_overflow.perf_tp_event.perf_trace_sched_wakeup_template.try_to_wake_up.autoremove_wake_function
      0.00           +12.0       11.99        perf-profile.calltrace.cycles.perf_tp_event.perf_trace_sched_wakeup_template.try_to_wake_up.autoremove_wake_function.__wake_up_common
      0.00           +12.6       12.64        perf-profile.calltrace.cycles.__perf_event_overflow.perf_tp_event.perf_trace_sched_stat_runtime.update_curr.dequeue_entity
      0.65 ±  5%     +13.0       13.66        perf-profile.calltrace.cycles.update_curr.dequeue_entity.dequeue_task_fair.__schedule.schedule
      0.00           +13.1       13.14        perf-profile.calltrace.cycles.perf_tp_event.perf_trace_sched_stat_runtime.update_curr.dequeue_entity.dequeue_task_fair
      0.00           +13.4       13.38        perf-profile.calltrace.cycles.perf_trace_sched_stat_runtime.update_curr.dequeue_entity.dequeue_task_fair.__schedule
      0.00           +19.8       19.80        perf-profile.calltrace.cycles.perf_prepare_sample.perf_event_output_forward.__perf_event_overflow.perf_tp_event.perf_trace_sched_switch
      0.00           +19.9       19.89        perf-profile.calltrace.cycles.perf_event_output_forward.__perf_event_overflow.perf_tp_event.perf_trace_sched_switch.__schedule
      0.00           +19.9       19.93        perf-profile.calltrace.cycles.__perf_event_overflow.perf_tp_event.perf_trace_sched_switch.__schedule.schedule
      0.00           +23.6       23.62        perf-profile.calltrace.cycles.perf_prepare_sample.perf_event_output_forward.__perf_event_overflow.perf_tp_event.perf_trace_sched_stat_runtime
      0.00           +23.7       23.72        perf-profile.calltrace.cycles.perf_event_output_forward.__perf_event_overflow.perf_tp_event.perf_trace_sched_stat_runtime.update_curr
      0.00           +48.3       48.26        perf-profile.calltrace.cycles.__get_user_nocheck_8.perf_callchain_user.get_perf_callchain.perf_callchain.perf_prepare_sample
      0.00           +49.5       49.52        perf-profile.calltrace.cycles.perf_callchain_user.get_perf_callchain.perf_callchain.perf_prepare_sample.perf_event_output_forward
      0.00           +62.0       61.97        perf-profile.calltrace.cycles.get_perf_callchain.perf_callchain.perf_prepare_sample.perf_event_output_forward.__perf_event_overflow
      0.00           +62.0       62.00        perf-profile.calltrace.cycles.perf_callchain.perf_prepare_sample.perf_event_output_forward.__perf_event_overflow.perf_tp_event
     15.87 ±  4%      -9.3        6.55 ±  5%  perf-profile.children.cycles.select_task_rq_fair
     13.26 ±  6%      -8.0        5.26 ±  6%  perf-profile.children.cycles.select_idle_sibling
      6.40 ±  3%      -5.4        0.98        perf-profile.children.cycles.update_load_avg
      8.13 ±  4%      -4.1        4.04 ±  8%  perf-profile.children.cycles.select_idle_cpu
      4.14 ±  5%      -3.7        0.46 ±  4%  perf-profile.children.cycles.prepare_task_switch
      4.33 ±  5%      -3.5        0.85        perf-profile.children.cycles.pick_next_task_fair
      3.19 ±  5%      -2.9        0.26 ±  4%  perf-profile.children.cycles.__update_load_avg_cfs_rq
      4.16 ±  2%      -2.6        1.56 ± 16%  perf-profile.children.cycles._raw_spin_lock
      5.51 ±  4%      -2.5        3.02 ±  6%  perf-profile.children.cycles.available_idle_cpu
      3.18 ±  3%      -2.4        0.74 ±  2%  perf-profile.children.cycles.__fdget_pos
      3.08 ±  3%      -2.4        0.72 ±  2%  perf-profile.children.cycles.__fget_light
      3.10 ±  7%      -2.2        0.90        perf-profile.children.cycles.__rseq_handle_notify_resume
      3.10 ±  3%      -2.2        0.90        perf-profile.children.cycles._raw_spin_lock_irqsave
      2.79 ±  4%      -2.2        0.62 ±  2%  perf-profile.children.cycles.__fget_files
      2.58 ±  5%      -2.0        0.58 ±  3%  perf-profile.children.cycles.mutex_lock
     40.71            -2.0       38.75        perf-profile.children.cycles.read
      2.39 ±  3%      -1.9        0.46 ±  3%  perf-profile.children.cycles.set_next_entity
      5.01 ±  4%      -1.9        3.08 ±  6%  perf-profile.children.cycles.id_idle_cpu
      2.20 ±  3%      -1.7        0.47 ±  2%  perf-profile.children.cycles.prepare_to_wait_event
      2.05 ±  5%      -1.5        0.52 ±  2%  perf-profile.children.cycles.__switch_to_asm
      2.08 ±  6%      -1.4        0.73 ±  2%  perf-profile.children.cycles.rseq_ip_fixup
      2.62 ±  6%      -1.2        1.37 ±  5%  perf-profile.children.cycles.restore_fpregs_from_fpstate
      1.59 ±  3%      -1.2        0.41 ±  2%  perf-profile.children.cycles.ttwu_do_wakeup
      1.56 ±  3%      -1.2        0.40 ±  3%  perf-profile.children.cycles.check_preempt_curr
      2.04 ± 10%      -1.2        0.89 ±  4%  perf-profile.children.cycles.mutex_unlock
      1.98 ±  3%      -1.1        0.83 ±  4%  perf-profile.children.cycles.copy_page_to_iter
      1.83 ±  7%      -1.1        0.69 ±  2%  perf-profile.children.cycles.copy_user_enhanced_fast_string
      2.00 ±  5%      -1.1        0.93 ±  3%  perf-profile.children.cycles.__switch_to
      1.39 ±  4%      -1.1        0.33 ±  2%  perf-profile.children.cycles.check_preempt_wakeup
      1.74 ± 13%      -1.1        0.68 ±  3%  perf-profile.children.cycles.__entry_text_start
      2.19 ± 13%      -1.0        1.18 ±  3%  perf-profile.children.cycles.wake_affine
      1.08 ±  8%      -0.9        0.18 ±  2%  perf-profile.children.cycles.put_prev_entity
      1.24 ±  7%      -0.9        0.36 ±  2%  perf-profile.children.cycles.__get_user_8
      1.09 ±  4%      -0.8        0.25 ±  3%  perf-profile.children.cycles.update_rq_clock
      1.15 ±  8%      -0.8        0.31 ±  3%  perf-profile.children.cycles.copyout
      0.99 ± 11%      -0.8        0.16 ±  2%  perf-profile.children.cycles.save_fpregs_to_fpstate
      1.02 ±  4%      -0.8        0.23 ±  4%  perf-profile.children.cycles.resched_curr
      1.34 ±  6%      -0.8        0.56 ±  3%  perf-profile.children.cycles.rseq_get_rseq_cs
      1.11 ± 12%      -0.8        0.33 ±  4%  perf-profile.children.cycles.copy_page_from_iter
      1.04 ±  6%      -0.8        0.27 ±  2%  perf-profile.children.cycles.fput_many
      1.15 ± 10%      -0.8        0.39 ±  3%  perf-profile.children.cycles.security_file_permission
      0.98 ± 11%      -0.7        0.25 ±  6%  perf-profile.children.cycles.cpumask_next_wrap
      0.81 ± 10%      -0.7        0.09 ±  5%  perf-profile.children.cycles.__put_user_nocheck_4
      1.42 ± 33%      -0.7        0.72 ±  4%  perf-profile.children.cycles.finish_task_switch
      0.92 ± 10%      -0.6        0.33 ±  2%  perf-profile.children.cycles.migrate_task_rq_fair
      0.76 ±  5%      -0.6        0.19 ±  6%  perf-profile.children.cycles._find_next_bit
      1.54 ± 13%      -0.5        0.99 ±  4%  perf-profile.children.cycles.task_h_load
      0.82 ±  8%      -0.5        0.30 ±  3%  perf-profile.children.cycles.apparmor_file_permission
      1.14 ±  7%      -0.5        0.62 ±  4%  perf-profile.children.cycles._raw_spin_unlock_irqrestore
      0.61 ±  4%      -0.5        0.15 ±  2%  perf-profile.children.cycles.update_rq_clock_task
      0.54 ±  6%      -0.4        0.11 ±  3%  perf-profile.children.cycles.__enqueue_entity
      0.46 ± 10%      -0.4        0.03 ± 70%  perf-profile.children.cycles.__put_user_nocheck_8
      0.62 ± 11%      -0.4        0.22 ±  4%  perf-profile.children.cycles.fsnotify
      0.58 ± 10%      -0.4        0.20 ±  2%  perf-profile.children.cycles.remove_entity_load_avg
      0.65 ±  8%      -0.4        0.27 ±  2%  perf-profile.children.cycles.sched_clock_cpu
      0.56            -0.4        0.18        perf-profile.children.cycles.switch_fpu_return
      0.50 ±  5%      -0.4        0.13        perf-profile.children.cycles.__update_load_avg_se
      0.60 ±  9%      -0.4        0.24 ±  3%  perf-profile.children.cycles.sched_clock
      0.82 ± 11%      -0.3        0.47 ±  3%  perf-profile.children.cycles.copyin
      0.57 ±  9%      -0.3        0.23 ±  3%  perf-profile.children.cycles.native_sched_clock
      0.51 ±  6%      -0.3        0.20 ±  4%  perf-profile.children.cycles.aa_file_perm
      0.41 ± 11%      -0.3        0.11        perf-profile.children.cycles.pick_next_entity
      0.34 ±  2%      -0.3        0.05 ±  8%  perf-profile.children.cycles.__dequeue_entity
      0.40 ± 10%      -0.2        0.16 ±  5%  perf-profile.children.cycles.syscall_return_via_sysret
      0.34 ± 53%      -0.2        0.10 ± 11%  perf-profile.children.cycles.__mutex_lock
      0.32 ± 10%      -0.2        0.08 ±  8%  perf-profile.children.cycles.cpuacct_charge
      0.63 ±  7%      -0.2        0.39 ±  4%  perf-profile.children.cycles.touch_atime
      0.31 ± 11%      -0.2        0.07 ±  6%  perf-profile.children.cycles.__rdgsbase_inactive
      0.35 ± 10%      -0.2        0.12 ±  4%  perf-profile.children.cycles._cond_resched
      0.35 ±  3%      -0.2        0.12 ±  3%  perf-profile.children.cycles.update_min_vruntime
      0.39 ± 12%      -0.2        0.18 ±  2%  perf-profile.children.cycles.___perf_sw_event
      0.32 ± 12%      -0.2        0.13 ±  3%  perf-profile.children.cycles.current_time
      0.29 ±  7%      -0.2        0.11 ±  4%  perf-profile.children.cycles.rb_erase
      0.24 ± 10%      -0.2        0.07 ±  6%  perf-profile.children.cycles.syscall_enter_from_user_mode
      0.28 ± 11%      -0.2        0.12        perf-profile.children.cycles.atime_needs_update
      0.23 ± 12%      -0.1        0.08        perf-profile.children.cycles.cpumask_next
      0.20 ± 10%      -0.1        0.05        perf-profile.children.cycles.attach_entity_load_avg
      0.17 ±  2%      -0.1        0.05        perf-profile.children.cycles.mem_cgroup_handle_over_high
      0.14 ± 12%      -0.1        0.02 ± 99%  perf-profile.children.cycles.rcu_read_unlock_strict
      0.16 ± 12%      -0.1        0.06 ±  6%  perf-profile.children.cycles.entry_SYSCALL_64_safe_stack
      0.15 ± 14%      -0.1        0.05 ±  7%  perf-profile.children.cycles.ktime_get_coarse_real_ts64
      0.11 ±  9%      -0.1        0.06 ±  9%  perf-profile.children.cycles.anon_pipe_buf_release
      0.12 ±  7%      -0.0        0.10 ±  5%  perf-profile.children.cycles.tracing_gen_ctx
      0.36 ±  4%      +0.0        0.40 ±  4%  perf-profile.children.cycles.perf_mmap__push
      0.04 ± 71%      +0.0        0.08 ±  5%  perf-profile.children.cycles.perf_swevent_get_recursion_context
      0.00            +0.1        0.06 ±  9%  perf-profile.children.cycles.__mnt_want_write
      0.00            +0.1        0.06        perf-profile.children.cycles.get_stack_info_noinstr
      0.00            +0.1        0.06 ±  7%  perf-profile.children.cycles.kvm_is_in_guest
      0.00            +0.1        0.07 ± 26%  perf-profile.children.cycles.shmem_write_end
      0.00            +0.1        0.08        perf-profile.children.cycles.perf_misc_flags
      0.07 ±  5%      +0.1        0.16 ±  5%  perf-profile.children.cycles.generic_update_time
      0.00            +0.1        0.09        perf-profile.children.cycles.__is_insn_slot_addr
      0.09 ± 12%      +0.1        0.18 ±  4%  perf-profile.children.cycles.perf_trace_buf_alloc
      0.00            +0.1        0.10 ±  4%  perf-profile.children.cycles.get_stack_info
      0.10 ±  5%      +0.1        0.21 ±  6%  perf-profile.children.cycles.__mark_inode_dirty
      0.01 ±223%      +0.1        0.14 ±  3%  perf-profile.children.cycles.perf_trace_run_bpf_submit
      0.00            +0.1        0.15 ±  4%  perf-profile.children.cycles.bpf_ksym_find
      0.00            +0.2        0.16 ±  6%  perf-profile.children.cycles.bad_get_user
      0.15 ±  9%      +0.2        0.32 ±  3%  perf-profile.children.cycles.perf_trace_buf_update
      0.00            +0.2        0.18 ±  4%  perf-profile.children.cycles.get_callchain_entry
      0.21 ±  6%      +0.2        0.39 ±  4%  perf-profile.children.cycles.record__pushfn
      0.21 ±  6%      +0.2        0.39 ±  4%  perf-profile.children.cycles.writen
      0.00            +0.2        0.18 ±  2%  perf-profile.children.cycles.is_bpf_text_address
      0.05 ±  7%      +0.2        0.26 ±  6%  perf-profile.children.cycles.iov_iter_copy_from_user_atomic
      0.09 ±  7%      +0.2        0.30 ±  9%  perf-profile.children.cycles.switch_mm_irqs_off
      0.17 ±  5%      +0.2        0.39 ±  3%  perf-profile.children.cycles.generic_file_write_iter
      0.00            +0.2        0.23 ±  3%  perf-profile.children.cycles.perf_output_begin_forward
      0.16 ±  5%      +0.2        0.39 ±  3%  perf-profile.children.cycles.__generic_file_write_iter
      0.15 ±  5%      +0.2        0.39 ±  3%  perf-profile.children.cycles.generic_perform_write
      0.00            +0.2        0.25 ±  3%  perf-profile.children.cycles.ftrace_graph_ret_addr
      0.00            +0.2        0.25 ±  3%  perf-profile.children.cycles.cmp_ex_search
      0.00            +0.4        0.39 ±  2%  perf-profile.children.cycles.error_entry
      0.00            +0.4        0.42 ±  3%  perf-profile.children.cycles.bsearch
      0.00            +0.4        0.42 ±  3%  perf-profile.children.cycles.search_extable
      0.00            +0.4        0.44 ±  4%  perf-profile.children.cycles.search_exception_tables
      0.00            +0.5        0.45 ±  2%  perf-profile.children.cycles.__task_pid_nr_ns
      0.00            +0.5        0.48 ±  3%  perf-profile.children.cycles.fixup_exception
      0.00            +0.6        0.56 ±  3%  perf-profile.children.cycles.no_context
      0.00            +0.6        0.58 ±  3%  perf-profile.children.cycles.__bad_area_nosemaphore
      0.00            +0.6        0.65 ±  2%  perf-profile.children.cycles.kernel_text_address
      0.00            +0.7        0.70        perf-profile.children.cycles.__perf_event_header__init_id
      0.00            +0.7        0.73 ±  2%  perf-profile.children.cycles.__kernel_text_address
      0.00            +0.8        0.78 ±  2%  perf-profile.children.cycles.exc_page_fault
      0.30 ± 20%      +0.8        1.11 ±  6%  perf-profile.children.cycles.asm_call_sysvec_on_stack
      0.02 ±141%      +0.9        0.88 ±  6%  perf-profile.children.cycles.task_tick_fair
      0.08 ± 10%      +0.9        0.95 ±  6%  perf-profile.children.cycles.scheduler_tick
      0.14 ± 15%      +0.9        1.01 ±  6%  perf-profile.children.cycles.update_process_times
      0.14 ± 15%      +0.9        1.02 ±  7%  perf-profile.children.cycles.tick_sched_handle
      0.15 ± 12%      +0.9        1.03 ±  6%  perf-profile.children.cycles.tick_sched_timer
      0.24 ± 14%      +0.9        1.12 ±  6%  perf-profile.children.cycles.hrtimer_interrupt
      0.24 ± 12%      +0.9        1.13 ±  6%  perf-profile.children.cycles.__sysvec_apic_timer_interrupt
      0.28 ± 13%      +0.9        1.17 ±  6%  perf-profile.children.cycles.sysvec_apic_timer_interrupt
      0.16 ± 13%      +0.9        1.05 ±  6%  perf-profile.children.cycles.__hrtimer_run_queues
      0.30 ± 12%      +0.9        1.22 ±  6%  perf-profile.children.cycles.asm_sysvec_apic_timer_interrupt
      0.00            +1.0        1.02 ±  2%  perf-profile.children.cycles.unwind_get_return_address
     11.89 ±  6%      +1.1       13.03        perf-profile.children.cycles.exit_to_user_mode_prepare
      0.00            +1.1        1.14        perf-profile.children.cycles.deref_stack_reg
      0.00            +1.2        1.20 ±  3%  perf-profile.children.cycles.orc_find
     58.44            +2.7       61.16        perf-profile.children.cycles.write
     30.16            +3.3       33.44        perf-profile.children.cycles.ksys_read
      0.00            +3.3        3.34 ±  2%  perf-profile.children.cycles.__orc_find
     28.42            +4.5       32.94        perf-profile.children.cycles.vfs_read
     43.16 ±  2%      +5.4       48.55        perf-profile.children.cycles.ksys_write
      0.00            +5.5        5.48        perf-profile.children.cycles.__unwind_start
     25.94            +6.1       32.00        perf-profile.children.cycles.new_sync_read
     25.28            +6.5       31.79        perf-profile.children.cycles.pipe_read
      1.83 ± 11%      +6.8        8.64        perf-profile.children.cycles.set_task_cpu
      0.00            +7.2        7.23 ±  3%  perf-profile.children.cycles.asm_exc_page_fault
      5.51 ±  3%      +7.5       12.98        perf-profile.children.cycles.ttwu_do_activate
      5.24 ±  4%      +7.6       12.86        perf-profile.children.cycles.enqueue_task_fair
     40.28 ±  2%      +7.7       47.96        perf-profile.children.cycles.vfs_write
      0.00            +8.0        7.97        perf-profile.children.cycles.perf_trace_sched_migrate_task
      4.72 ±  4%      +8.0       12.72        perf-profile.children.cycles.enqueue_entity
     74.18            +8.1       82.27        perf-profile.children.cycles.do_syscall_64
     38.75 ±  3%      +8.1       46.89        perf-profile.children.cycles.pipe_write
     39.31 ±  3%      +8.3       47.60        perf-profile.children.cycles.new_sync_write
     87.13            +8.4       95.49        perf-profile.children.cycles.entry_SYSCALL_64_after_hwframe
      4.86 ±  3%      +9.5       14.39        perf-profile.children.cycles.dequeue_task_fair
      0.00           +10.0       10.05 ±  2%  perf-profile.children.cycles.unwind_next_frame
      3.61 ±  3%     +10.5       14.13        perf-profile.children.cycles.dequeue_entity
      0.61 ±  3%     +11.7       12.28        perf-profile.children.cycles.perf_trace_sched_wakeup_template
      0.00           +12.1       12.06 ±  2%  perf-profile.children.cycles.perf_callchain_kernel
     32.27 ±  2%     +12.8       45.03        perf-profile.children.cycles.__wake_up_common_lock
     31.59 ±  3%     +12.8       44.41        perf-profile.children.cycles.__wake_up_common
     30.59 ±  2%     +13.2       43.82        perf-profile.children.cycles.autoremove_wake_function
     30.58 ±  2%     +13.2       43.81        perf-profile.children.cycles.try_to_wake_up
     22.75           +16.9       39.63        perf-profile.children.cycles.schedule
     22.44           +17.1       39.53        perf-profile.children.cycles.__schedule
      0.08 ± 10%     +20.8       20.85        perf-profile.children.cycles.perf_trace_sched_switch
      1.71 ±  5%     +24.7       26.40        perf-profile.children.cycles.update_curr
      0.21 ±  9%     +25.6       25.82        perf-profile.children.cycles.perf_trace_sched_stat_runtime
      0.00           +48.8       48.82        perf-profile.children.cycles.__get_user_nocheck_8
      0.00           +50.1       50.10        perf-profile.children.cycles.perf_callchain_user
      0.00           +62.8       62.75        perf-profile.children.cycles.get_perf_callchain
      0.00           +62.8       62.79        perf-profile.children.cycles.perf_callchain
      0.00           +63.8       63.77        perf-profile.children.cycles.perf_prepare_sample
      0.00           +64.0       64.04        perf-profile.children.cycles.perf_event_output_forward
      0.00           +64.2       64.16        perf-profile.children.cycles.__perf_event_overflow
      0.36 ±  4%     +65.6       65.95        perf-profile.children.cycles.perf_tp_event
      3.89 ±  5%      -3.5        0.35 ±  5%  perf-profile.self.cycles.prepare_task_switch
      4.13 ±  6%      -3.0        1.12 ±  3%  perf-profile.self.cycles.__schedule
      3.19 ±  5%      -2.9        0.26 ±  4%  perf-profile.self.cycles.__update_load_avg_cfs_rq
      3.36 ±  3%      -2.7        0.63 ±  3%  perf-profile.self.cycles._raw_spin_lock
      5.51 ±  4%      -2.5        3.02 ±  6%  perf-profile.self.cycles.available_idle_cpu
      3.66 ±  7%      -2.4        1.25 ±  9%  perf-profile.self.cycles.select_idle_cpu
      2.76 ±  4%      -2.1        0.62 ±  2%  perf-profile.self.cycles.__fget_files
      2.99 ±  3%      -2.1        0.88        perf-profile.self.cycles._raw_spin_lock_irqsave
      2.37 ±  6%      -1.9        0.52 ±  3%  perf-profile.self.cycles.mutex_lock
      2.16 ±  7%      -1.7        0.50        perf-profile.self.cycles.update_load_avg
      2.12 ±  4%      -1.6        0.52 ±  2%  perf-profile.self.cycles.select_idle_sibling
      2.05 ±  5%      -1.5        0.52 ±  2%  perf-profile.self.cycles.__switch_to_asm
      1.90 ±  4%      -1.4        0.50        perf-profile.self.cycles.exit_to_user_mode_prepare
      2.62 ±  6%      -1.2        1.37 ±  5%  perf-profile.self.cycles.restore_fpregs_from_fpstate
      2.04 ± 10%      -1.2        0.88 ±  4%  perf-profile.self.cycles.mutex_unlock
      1.82 ±  7%      -1.1        0.68 ±  2%  perf-profile.self.cycles.copy_user_enhanced_fast_string
      2.00 ±  5%      -1.1        0.93 ±  3%  perf-profile.self.cycles.__switch_to
      1.74 ± 13%      -1.1        0.68 ±  3%  perf-profile.self.cycles.__entry_text_start
      1.38 ±  7%      -1.0        0.33 ±  3%  perf-profile.self.cycles.pipe_read
      1.15 ± 39%      -1.0        0.16        perf-profile.self.cycles.finish_task_switch
      1.20 ±  4%      -0.9        0.25 ±  2%  perf-profile.self.cycles.dequeue_task_fair
      1.01 ±  8%      -0.9        0.10 ±  4%  perf-profile.self.cycles._raw_spin_unlock_irqrestore
      1.24 ±  7%      -0.9        0.36        perf-profile.self.cycles.__get_user_8
      1.18 ± 10%      -0.9        0.32 ±  3%  perf-profile.self.cycles.pipe_write
      0.99 ± 11%      -0.8        0.16 ±  2%  perf-profile.self.cycles.save_fpregs_to_fpstate
      1.23 ±  5%      -0.8        0.42 ±  2%  perf-profile.self.cycles.enqueue_entity
      1.36 ±  5%      -0.8        0.56 ±  5%  perf-profile.self.cycles.vfs_read
      1.02 ±  4%      -0.8        0.23 ±  4%  perf-profile.self.cycles.resched_curr
      1.04 ±  6%      -0.8        0.26        perf-profile.self.cycles.fput_many
      0.81 ± 10%      -0.7        0.09 ±  5%  perf-profile.self.cycles.__put_user_nocheck_4
      0.76 ±  5%      -0.6        0.19 ±  6%  perf-profile.self.cycles._find_next_bit
      0.73 ± 12%      -0.6        0.17 ±  5%  perf-profile.self.cycles.write
      1.54 ± 13%      -0.5        0.99 ±  4%  perf-profile.self.cycles.task_h_load
      0.71 ± 12%      -0.5        0.18 ±  5%  perf-profile.self.cycles.read
      0.86 ± 12%      -0.5        0.32        perf-profile.self.cycles.set_task_cpu
      0.62 ±  9%      -0.5        0.12 ±  5%  perf-profile.self.cycles.entry_SYSCALL_64_after_hwframe
      0.61 ±  4%      -0.5        0.13        perf-profile.self.cycles.update_rq_clock_task
      0.58 ±  6%      -0.4        0.14 ±  3%  perf-profile.self.cycles.update_rq_clock
      0.54 ±  6%      -0.4        0.11 ±  3%  perf-profile.self.cycles.__enqueue_entity
      0.54 ±  3%      -0.4        0.11        perf-profile.self.cycles.dequeue_entity
      0.46 ± 10%      -0.4        0.03 ± 70%  perf-profile.self.cycles.__put_user_nocheck_8
      0.62            -0.4        0.20        perf-profile.self.cycles.new_sync_read
      0.62 ± 11%      -0.4        0.22 ±  5%  perf-profile.self.cycles.fsnotify
      0.54 ±  6%      -0.4        0.13        perf-profile.self.cycles.prepare_to_wait_event
      0.99 ± 10%      -0.4        0.59 ±  6%  perf-profile.self.cycles.__wake_up_common
      0.76 ±  4%      -0.4        0.36        perf-profile.self.cycles.update_curr
      0.52 ±  4%      -0.4        0.14 ±  3%  perf-profile.self.cycles.enqueue_task_fair
      0.44 ±  4%      -0.4        0.07        perf-profile.self.cycles.syscall_exit_to_user_mode
      0.50 ±  5%      -0.4        0.13 ±  3%  perf-profile.self.cycles.__update_load_avg_se
      0.54            -0.4        0.18        perf-profile.self.cycles.switch_fpu_return
      0.57 ±  9%      -0.3        0.23 ±  3%  perf-profile.self.cycles.native_sched_clock
      0.45 ±  9%      -0.3        0.10 ±  4%  perf-profile.self.cycles.schedule
      0.38 ±  8%      -0.3        0.08 ±  4%  perf-profile.self.cycles.pick_next_task_fair
      0.40 ± 10%      -0.3        0.10 ±  4%  perf-profile.self.cycles.select_task_rq_fair
      0.40 ±  9%      -0.3        0.13 ±  3%  perf-profile.self.cycles.vfs_write
      0.45 ±  5%      -0.3        0.20 ±  4%  perf-profile.self.cycles.aa_file_perm
      0.74 ±  5%      -0.3        0.49 ±  9%  perf-profile.self.cycles.copy_page_to_iter
      0.40 ± 10%      -0.2        0.16 ±  5%  perf-profile.self.cycles.syscall_return_via_sysret
      0.32 ± 10%      -0.2        0.08 ±  8%  perf-profile.self.cycles.cpuacct_charge
      0.31 ± 11%      -0.2        0.07 ±  6%  perf-profile.self.cycles.__rdgsbase_inactive
      0.33 ± 33%      -0.2        0.09 ±  5%  perf-profile.self.cycles.cpumask_next_wrap
      0.35 ±  3%      -0.2        0.12 ±  3%  perf-profile.self.cycles.update_min_vruntime
      0.33 ± 10%      -0.2        0.10 ±  4%  perf-profile.self.cycles.wake_affine
      0.31 ± 13%      -0.2        0.10        perf-profile.self.cycles.apparmor_file_permission
      0.30 ±  7%      -0.2        0.09 ± 10%  perf-profile.self.cycles.__fget_light
      0.32 ±  4%      -0.2        0.13        perf-profile.self.cycles.do_syscall_64
      0.29 ±  7%      -0.2        0.11 ±  4%  perf-profile.self.cycles.rb_erase
      0.24 ±  9%      -0.2        0.06 ±  7%  perf-profile.self.cycles.syscall_enter_from_user_mode
      0.25 ± 11%      -0.2        0.08 ±  5%  perf-profile.self.cycles.copy_page_from_iter
      0.32 ± 13%      -0.2        0.16 ±  3%  perf-profile.self.cycles.___perf_sw_event
      0.22 ±  4%      -0.2        0.06 ±  7%  perf-profile.self.cycles.check_preempt_wakeup
      0.27 ± 10%      -0.2        0.12 ±  5%  perf-profile.self.cycles.ttwu_do_activate
      0.24 ± 10%      -0.1        0.10 ±  4%  perf-profile.self.cycles._cond_resched
      0.26 ±  6%      -0.1        0.12 ±  3%  perf-profile.self.cycles.rseq_ip_fixup
      0.20 ± 10%      -0.1        0.05        perf-profile.self.cycles.attach_entity_load_avg
      0.28 ±  4%      -0.1        0.14        perf-profile.self.cycles.id_idle_cpu
      0.17 ±  2%      -0.1        0.05        perf-profile.self.cycles.mem_cgroup_handle_over_high
      0.25 ± 13%      -0.1        0.13 ±  4%  perf-profile.self.cycles.migrate_task_rq_fair
      0.29 ±  4%      -0.1        0.18 ±  5%  perf-profile.self.cycles.touch_atime
      0.18 ± 14%      -0.1        0.07        perf-profile.self.cycles.current_time
      0.14 ± 12%      -0.1        0.02 ± 99%  perf-profile.self.cycles.rcu_read_unlock_strict
      0.16 ± 12%      -0.1        0.06 ±  6%  perf-profile.self.cycles.entry_SYSCALL_64_safe_stack
      0.17 ±  2%      -0.1        0.07        perf-profile.self.cycles.check_preempt_curr
      0.17 ± 10%      -0.1        0.08 ±  6%  perf-profile.self.cycles.__rseq_handle_notify_resume
      0.15 ± 14%      -0.1        0.05 ±  7%  perf-profile.self.cycles.ktime_get_coarse_real_ts64
      0.14 ± 10%      -0.1        0.07 ±  7%  perf-profile.self.cycles.atime_needs_update
      0.11 ±  9%      -0.1        0.05 ±  8%  perf-profile.self.cycles.anon_pipe_buf_release
      0.16 ±  8%      -0.0        0.13 ±  5%  perf-profile.self.cycles.file_update_time
      0.12 ±  7%      -0.0        0.10 ±  5%  perf-profile.self.cycles.tracing_gen_ctx
      0.07 ± 13%      -0.0        0.05        perf-profile.self.cycles.copyout
      0.08 ± 10%      +0.0        0.11 ±  5%  perf-profile.self.cycles.perf_trace_sched_switch
      0.04 ± 71%      +0.0        0.08 ±  5%  perf-profile.self.cycles.perf_swevent_get_recursion_context
      0.00            +0.1        0.05        perf-profile.self.cycles.perf_trace_sched_migrate_task
      0.00            +0.1        0.06 ±  9%  perf-profile.self.cycles.__mnt_want_write
      0.00            +0.1        0.06        perf-profile.self.cycles.perf_misc_flags
      0.00            +0.1        0.06 ±  7%  perf-profile.self.cycles.kvm_is_in_guest
      0.00            +0.1        0.07 ± 26%  perf-profile.self.cycles.shmem_write_end
      0.00            +0.1        0.07 ±  6%  perf-profile.self.cycles.no_context
      0.00            +0.1        0.08        perf-profile.self.cycles.__is_insn_slot_addr
      0.00            +0.1        0.08        perf-profile.self.cycles.__perf_event_overflow
      0.00            +0.1        0.08 ±  5%  perf-profile.self.cycles.__kernel_text_address
      0.01 ±223%      +0.1        0.09 ±  5%  perf-profile.self.cycles.perf_trace_buf_alloc
      0.10 ± 10%      +0.1        0.19 ±  5%  perf-profile.self.cycles.rseq_get_rseq_cs
      0.00            +0.1        0.11 ±  4%  perf-profile.self.cycles.__perf_event_header__init_id
      0.10 ±  5%      +0.1        0.21 ±  6%  perf-profile.self.cycles.__mark_inode_dirty
      0.00            +0.1        0.13 ±  2%  perf-profile.self.cycles.exc_page_fault
      0.01 ±223%      +0.1        0.14 ±  3%  perf-profile.self.cycles.perf_trace_run_bpf_submit
      0.12 ±  6%      +0.1        0.26 ± 10%  perf-profile.self.cycles.perf_trace_sched_wakeup_template
      0.00            +0.1        0.15 ±  4%  perf-profile.self.cycles.bpf_ksym_find
      0.00            +0.2        0.16 ±  6%  perf-profile.self.cycles.bad_get_user
      0.00            +0.2        0.16 ±  2%  perf-profile.self.cycles.perf_prepare_sample
      0.00            +0.2        0.17 ±  4%  perf-profile.self.cycles.bsearch
      0.00            +0.2        0.18 ±  4%  perf-profile.self.cycles.perf_output_begin_forward
      0.00            +0.2        0.18 ±  4%  perf-profile.self.cycles.get_callchain_entry
      0.09 ±  7%      +0.2        0.30 ±  9%  perf-profile.self.cycles.switch_mm_irqs_off
      0.00            +0.2        0.22 ±  4%  perf-profile.self.cycles.perf_trace_buf_update
      0.00            +0.2        0.25 ±  3%  perf-profile.self.cycles.ftrace_graph_ret_addr
      0.00            +0.2        0.25 ±  3%  perf-profile.self.cycles.cmp_ex_search
      1.10 ±  8%      +0.3        1.37 ±  2%  perf-profile.self.cycles.try_to_wake_up
      0.00            +0.3        0.29 ±  2%  perf-profile.self.cycles.unwind_get_return_address
      0.00            +0.3        0.29 ±  3%  perf-profile.self.cycles.kernel_text_address
      0.00            +0.3        0.32 ±  2%  perf-profile.self.cycles.__unwind_start
      0.00            +0.4        0.39 ±  2%  perf-profile.self.cycles.error_entry
      0.00            +0.4        0.41 ±  3%  perf-profile.self.cycles.get_perf_callchain
      0.00            +0.4        0.44 ±  3%  perf-profile.self.cycles.__task_pid_nr_ns
      0.00            +0.6        0.56 ±  2%  perf-profile.self.cycles.perf_callchain_kernel
      0.00            +1.1        1.08        perf-profile.self.cycles.perf_callchain_user
      0.00            +1.1        1.14        perf-profile.self.cycles.deref_stack_reg
      0.00            +1.2        1.20 ±  3%  perf-profile.self.cycles.orc_find
      0.20 ± 10%      +1.2        1.44 ±  2%  perf-profile.self.cycles.perf_tp_event
      0.00            +3.3        3.34 ±  2%  perf-profile.self.cycles.__orc_find
      0.00            +4.1        4.10        perf-profile.self.cycles.unwind_next_frame
      0.00            +6.2        6.20 ±  3%  perf-profile.self.cycles.asm_exc_page_fault
      0.00           +41.4       41.44        perf-profile.self.cycles.__get_user_nocheck_8




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

