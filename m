Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2528A31
	for <oe-lkp@lists.linux.dev>; Fri, 20 Dec 2024 08:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734682140; cv=fail; b=PuSRKR0QUoKHxCEN3xOqHWqC2C1yGhfn+kBs5crfUvLiRQNrQv5VSlIRMORC+0HNiOJrQso7nWWZsL0hf+bELCQbUUa7TXFtKpPWbSM6qD2KXqU8wg7vXyJkYpeNRPUtgZ8MxMOI0pWPz4plJANfopWGxalaYrCojRn2kGoI5ik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734682140; c=relaxed/simple;
	bh=jtx7VWe6QCo0g1AWC+gdqhSab0KI/owTj8BD+h7bs1w=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=oiae9y/Q5/nJpe38gipmk8X7kTAMvQAGDdYSY2guK7xYSJ8dEPcvX8ONWiITJ9VWwm0VHT9/FLWu+hTsA1rH2QlvZcy7Rm1nGLd0e4XP8nGv3qI+OxATaywV0ce7Tlr976UCzUoZbbx+qOA3f3eA5VXn8FvvsZfSI7c0VYw7Azg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jQZlMfYJ; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jQZlMfYJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734682138; x=1766218138;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=jtx7VWe6QCo0g1AWC+gdqhSab0KI/owTj8BD+h7bs1w=;
  b=jQZlMfYJaGea3EFyY9Cwu/SQsAKDGt8n1IuYo7l8yoDWOA+ITO4piFig
   4U9IVESQe5GkoTgwNk7aS/vkUoiYL2YNjbbMF5yEWxS29kAl/Vv3ghWjP
   QpQXwGvZxoYpQitFP1/eecdDEeRw6shQ+1eQUDCwRz8yy2qpAgbErZNm+
   eQ2Bva0KbOul4N111MtshiyROJXkUEDknCEOmwyWZkfjztu8PtzXWrDW0
   Mqbt67IdMoTJDP5oEBiHho8mx655GSq5usIcHZbTqnUJ5zzJpTUHBtSck
   Ufg5sRKC9S1Ge/4tebzWgG0ODKQm5OXvxQBIGOO+HpXIDZQY8mop4nA+h
   Q==;
X-CSE-ConnectionGUID: +R8Ma+ANTuWSMG5wu63Lbg==
X-CSE-MsgGUID: 96N8q0paSMWLsbvDHbALTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="57697587"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="57697587"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 00:08:57 -0800
X-CSE-ConnectionGUID: u2XZ4csDRGSbflksEsjJ7w==
X-CSE-MsgGUID: jZymkaZNRFCj47yE6XRBGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="129408361"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Dec 2024 00:08:56 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 20 Dec 2024 00:08:56 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 20 Dec 2024 00:08:56 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 20 Dec 2024 00:08:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jyL0skFlima44AwjxaQK2avwmET2uPfQSXztBYB6+hkSlhuBTmfp+9Ddp3gnFvIiPbZ3+SXkgMqKeM/0bv0mfnvcNKpjaV5K/+O+MkysndMPrw+dGJOEWcEnOHCLyU43p1OxNWGW3WJ3B5DKmTv8yCAWl42nrwJW20cGPF6oXN1Ksm3zGZUPDyrDDNg98dkUBHNXjTIOos3Kt74a5LmjSQIhPG4tNJbT1rc6KjZXXA8sksxO50WJ4tDzlzRYLbBt2I4oANAI5WlJGcVxIgawlR+kCTQ/kMN+sZZDLEiIsuA4dLRY9A/0FwtyTv//tdvtVweMZ2n2MYmMnc9Ze6+DUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aHkYTu8fo35SvAb8XGew8agO65sy5/IdJbMqheEVkfA=;
 b=CVTkMbydRXv506NAEu1cZRz0Fz7hL6G4Ka1zgaxow6KBnXuyZxBvQbT0T3S03l/VvzY+A52wiAGT+6T7dvAkJv1/C2kGp8GE4+lgMm+W31OuLvlxBwsvHwQVWq+azWGqVZT2p0lBfIZazCwQ8Qc/vdHIw1OzVifz0NYHaGlfggrtL0avA1UjKoX13pIBLeQPENqZ/wxMZIg2aoUE24jYHjS3qMX4yF6/499WMnCAsxjJTTMGKFqrheAdsxqIeunzSLFlCF1Df3KDtYXTfCW7O7xz4QTTpffXF1ZxvA61sCSVU6Py3F3ut6LYwHZRi1S+PasAymNjH2OUf5CmKvmnWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MN2PR11MB4725.namprd11.prod.outlook.com (2603:10b6:208:263::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 08:08:38 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%6]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 08:08:38 +0000
Date: Fri, 20 Dec 2024 16:08:31 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [bigeasy-staging:futex_local_v4.5] [futex]  4638f3a75b:
 will-it-scale.per_thread_ops 71.3% regression
Message-ID: <202412201518.1c943f4a-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR06CA0002.apcprd06.prod.outlook.com
 (2603:1096:4:186::10) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MN2PR11MB4725:EE_
X-MS-Office365-Filtering-Correlation-Id: f07e0a12-ef3b-4fd2-a05d-08dd20cd8271
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?FTWTP7wNMwqAp7zN564TEeaR4qReUsPUIELuxToa+Ff6cZnOimSrkCvjtw?=
 =?iso-8859-1?Q?7nV4SIFNNyUSetSFv4XggRpOheGswNGWBo6NNFdxZe/wQJxp9UMBU4pDGi?=
 =?iso-8859-1?Q?P4N0/c667d72TLvQZwk2XfAudH4ZIgBSaJsFMq6Sp+8PrmXClbv/Itgi0p?=
 =?iso-8859-1?Q?UfEP5QJDjlZAdmzf96SFPWmoWQ5isnOFrOBL4q93FmTdIkEpEcacaIRVGz?=
 =?iso-8859-1?Q?KGXbYwYHRuBgFM9Da1S0IU0IyT36NIppCvUStLi+8SziGkZb5yliRpAleO?=
 =?iso-8859-1?Q?ZnMXaxTfHohjhFIBeVeTat6h4T+KoPyrQdwF+iUA7dFdra2MgF8j1QDGu+?=
 =?iso-8859-1?Q?CgfIm6YZsVUS/ZpuEyiZg9h5/44S8MOAeTwWnCBzRuqQpodTLnyTZYxPNx?=
 =?iso-8859-1?Q?YA0QF29FZuTvXzw5FXcrZWNNQg8SdsFJI+Mmwq+E1tXcnfgrUWGVpfOcQf?=
 =?iso-8859-1?Q?i7E7yqoMysGlrrYjvZnqisTiGuP5r/qvDevHSMXbkvxTq5HARbM982WIEs?=
 =?iso-8859-1?Q?//zQez/eUPQPA2HzSJzM48L+5AvgJsDzEUE00x/iW85qAxyw6xi3/ZTNp5?=
 =?iso-8859-1?Q?JQL0poS7yQNKS5T2dp4o3ZVOcSzQt1UgbfZWUJfwyek94MThws8Opc62i9?=
 =?iso-8859-1?Q?IYaS7ewl3VB5qiS2Mod7Iox2kxW2aItFEbDxruWtw8V12h5w2gA09Mc0i8?=
 =?iso-8859-1?Q?xbCiLVcPvb2VB5x/HNQKRK6JD7j6Pl22pXyCmCGNKCNdSYfEJf1ErmKfBL?=
 =?iso-8859-1?Q?/X0TUmu+/GZTf2KjFNZbltCjBQJbcC2aSzTs4CIGpP7GKYLK2x+lSkYtIV?=
 =?iso-8859-1?Q?0lPYfElCbnpkHKorp0AjxQjmx3H0Q64vehIvV8wi15Yx8MmKvrLeAbWrmw?=
 =?iso-8859-1?Q?BKlIwIclBkhN1O4coq0/GGEfyoZvdV28D5NXwFtBTXeIjWz90m5qFmjKRT?=
 =?iso-8859-1?Q?v5TQLQBsRg0kQkoMgzzbJwNO4DyR7E67irmYw8ewzBQf1YyPIVi6XH+Js4?=
 =?iso-8859-1?Q?Y6RpqcC5PYqKBur1i31I+gkdlORLkGufxMza7+QUnF/bC0SPrREQunjVt/?=
 =?iso-8859-1?Q?8nOUoY/NuwZqVXfNZPyP2BFFcZqTuBh4WwGL7EK17yTDsq7Sp+9IXcPHEz?=
 =?iso-8859-1?Q?b9mtZafgfprm64/2UATP0AforjiFg5NIiqVsdN4ZFs5LIw+ynoO0jcgEyc?=
 =?iso-8859-1?Q?j0y4XDtvUHDGCnP4OcLZAO8E1HKalUBPR6DRDX37Voo/gsUw+yj/odlFR7?=
 =?iso-8859-1?Q?abQ3R9bzy6QaWlcc8lf4m2OtVUZcXA6vBQ8ruGfl92+SHN9ZMAE6ISGYb+?=
 =?iso-8859-1?Q?eM/fJCTJ4IQuq12dsV9zrksAN4BE5KQhnUeO6n/Rik4Uhv1BW6xnj+FJUL?=
 =?iso-8859-1?Q?JumgooJoxnCVZ8QmFaXSR4L9o7TPRElUi0wEUag5HeQcM7td/qnglITkwh?=
 =?iso-8859-1?Q?fltIsgHnSdcdMfwfBTc5jt/8esJUbgHu6ie3HA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?8FQXJTKHpTfZTbYkSmUcnIlFbf3aq1M34VmXqTQSZDkBadQpcPyzhqqFsw?=
 =?iso-8859-1?Q?PvUmXVtPf5S1My260U1Oq3BpEro0tn6F3zwbz0cw+pKcYwKV5Zy/zNQ5Qt?=
 =?iso-8859-1?Q?9X3jHYYGie7uYEveg/jlx7leyZBRLGcP9g6UKKlfacucLzd9i2HzK/g5QH?=
 =?iso-8859-1?Q?K2aXu/pTrgEqhdd1wzOSajTg6aISQp6L58jaa9KJrbBDX2r3pq4JHHVK4I?=
 =?iso-8859-1?Q?SSMGc9R+A1XlKQlHZvV5WT1aLpiAdPUh8q9aKUFlbWuBTp3mpzVt4qvjmM?=
 =?iso-8859-1?Q?SPs/i8xIlWTw80plr9WtWLN+36KzzQgoD8jrLQOgJWjN9KFhdxg80BwSgG?=
 =?iso-8859-1?Q?VKoLszR/w23juowPxNXUWKNLaXERVsb6MosvBrqpIqhnvbTvdgzUF0Tnos?=
 =?iso-8859-1?Q?0XQHNsjT5zUR3d5TLm6Ihd2jiswP8qyKiA/eZsLfUrJMuasA4crcwMWOhC?=
 =?iso-8859-1?Q?RZBvhjbLuYGnVsiwtgKiJTHb/7/eBLnYr2EaPl54aZHYmrKBp0ASfKZQPh?=
 =?iso-8859-1?Q?LDyL8hY3DvqUmzv/VBZuiPLKt9TFVzumER8R6i4NIONuJAyPYVfNaCI0Be?=
 =?iso-8859-1?Q?RkzHMGxUQxxlJVC8WYmSDc4VZfKaHOWhixkXWHLZdtSWE3UvqPSYYE9EuV?=
 =?iso-8859-1?Q?WkwHvzCZoCoHh0rjxLqL/g9j4Aw2VmhzGQCu0yPrBA061VCWRm9nsxiKdZ?=
 =?iso-8859-1?Q?/ZBPjjil/xWd30PZEzSdA/rBq01XaKv9ufHi1XgokpYVqBB8/tzTJF9pwk?=
 =?iso-8859-1?Q?L58VROvTIhIq/ETXbDhjC2fHAUaYsz05Pk2alFZxeHREujpeWwFHVAMcWd?=
 =?iso-8859-1?Q?n00dG0vBKk01xXdaYIewH+p+yxx7n9uoE+4J7LSHLRV0lSkjZxPuiwVmLd?=
 =?iso-8859-1?Q?YLqaA9EVnALGXBilwt528LXPZwgWOMRukXUEf3dJNyaYBx9KAtg6aOY+XO?=
 =?iso-8859-1?Q?5IgsEGjuIsviMxbq4+aVUS1ICxGuPKyDfX8YZnkd2AEGuREBHMRZxbQc6g?=
 =?iso-8859-1?Q?BC9+wJiqZiN9heepUbMJf5QC3XFSw8Q4+CpZZhBP0L30yvYiysADH0oLbL?=
 =?iso-8859-1?Q?sGrOL9yPJevGFgfwEiFE8mYyFLTgSjr3ygYHRA3t9mKeRy1SQrNxIPSKtg?=
 =?iso-8859-1?Q?Fw/ul7MuVO7j+ZpBFgdO1OLvES4H4Eh8ARa3c7fH9fom5bDQ1ZngrStWLD?=
 =?iso-8859-1?Q?jmPERii70uUL5OslJM8XR3tpZAxePAplsjM5Ek36sAczDAfhG9KeXvl6Oa?=
 =?iso-8859-1?Q?0RoEui1mFbX8z1zTC0mjMk56At/31pvL2wJsw5SVcFxc0w3I97NRw+lazA?=
 =?iso-8859-1?Q?0YqwUr6VmlDiLNQVY98fJ42TkLH5d3tFnmscSMdZxGWvz3lEFJWv2gIVHS?=
 =?iso-8859-1?Q?ioQrX1tn1kvZDJRflzKD6itdYZyMcLjMd+1SlQgC3CDaDWRLK+J/NJHyaE?=
 =?iso-8859-1?Q?9aNuzxhgv8PhVu2zA4cIunXaoqN5XujeBRdj4iS7ihvETevDdPc/yZvjqs?=
 =?iso-8859-1?Q?tNMtTIS+YlWRtl9dW9qQQPygmGItAnTEjgNmzJpdyvpr1Wp6rA5ArNb4As?=
 =?iso-8859-1?Q?Wz5ek5exJZXZGqF+jqRQQiyUCqbwA4sQxYHPj89nCo7TzRNAs5Ow4R4su3?=
 =?iso-8859-1?Q?197bV99F4lt5uI/Gwtpni/BCZTupZY3CSOYfNBseZQl1W4qa3CIno7gw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f07e0a12-ef3b-4fd2-a05d-08dd20cd8271
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 08:08:38.6961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6L9+6zWr8H3k1fIOWEaQYEHWfSkiU8IHsfG8jHCxRhR+LXOmuKMb7xoeIol/r3LWes4uG0W/gllbFSZ3AyMWIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4725
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 71.3% regression of will-it-scale.per_thread_ops on:


commit: 4638f3a75b480cf344c10ec5a7bb2fb00f18ce15 ("futex: Allow automatic allocation of process wide futex hash.")
https://git.kernel.org/cgit/linux/kernel/git/bigeasy/staging.git futex_local_v4.5

testcase: will-it-scale
config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 104 threads 2 sockets (Skylake) with 192G memory
parameters:

	nr_task: 100%
	mode: thread
	test: futex4
	cpufreq_governor: performance




If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202412201518.1c943f4a-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241220/202412201518.1c943f4a-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-9.4/thread/100%/debian-12-x86_64-20240206.cgz/lkp-skl-fpga01/futex4/will-it-scale

commit: 
  50db8efb77 ("futex: Add basic infrastructure for local task local hash.")
  4638f3a75b ("futex: Allow automatic allocation of process wide futex hash.")

50db8efb77ebb469 4638f3a75b480cf344c10ec5a7b 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    376201           +18.5%     445825        meminfo.Shmem
    349223 ± 12%     +23.6%     431800 ±  2%  numa-meminfo.node1.Shmem
     87290 ± 12%     +23.6%     107914 ±  2%  numa-vmstat.node1.nr_shmem
      0.01            -0.0        0.01 ±  4%  mpstat.cpu.all.soft%
     52.32           +29.8       82.14        mpstat.cpu.all.sys%
     46.92           -29.8       17.11 ±  5%  mpstat.cpu.all.usr%
     52.27           +56.9%      82.00        vmstat.cpu.sy
     46.64           -63.6%      16.97 ±  5%  vmstat.cpu.us
      1781            +2.5%       1826        vmstat.system.cs
  74963355           -71.3%   21536995 ± 10%  will-it-scale.104.threads
    720801           -71.3%     207085 ± 10%  will-it-scale.per_thread_ops
  74963355           -71.3%   21536995 ± 10%  will-it-scale.workload
     43.83 ± 16%    +182.1%     123.67 ± 19%  perf-c2c.DRAM.local
    244.67 ±  9%  +19338.0%      47558 ±  2%  perf-c2c.DRAM.remote
    410.00 ±  9%  +16221.2%      66916 ±  4%  perf-c2c.HITM.local
    225.50 ± 10%  +15827.4%      35916 ±  2%  perf-c2c.HITM.remote
    635.50 ±  8%  +16081.5%     102833 ±  3%  perf-c2c.HITM.total
    265133            +6.7%     282956        proc-vmstat.nr_active_anon
    970278            +1.8%     987734        proc-vmstat.nr_file_pages
     22050            -1.8%      21658        proc-vmstat.nr_mapped
     94043           +18.6%     111497        proc-vmstat.nr_shmem
    265133            +6.7%     282956        proc-vmstat.nr_zone_active_anon
    981190            +2.4%    1005032        proc-vmstat.numa_hit
    873516            +2.7%     897369        proc-vmstat.numa_local
   1117899            +2.3%    1143238        proc-vmstat.pgalloc_normal
      0.67           +25.0%       0.83        sched_debug.cfs_rq:/.h_nr_running.min
      6457           +24.5%       8038        sched_debug.cfs_rq:/.load.min
      6.00           +24.5%       7.47        sched_debug.cfs_rq:/.load_avg.min
      0.67           +25.0%       0.83        sched_debug.cfs_rq:/.nr_running.min
      0.07 ±  4%     -20.0%       0.06 ±  9%  sched_debug.cfs_rq:/.nr_running.stddev
      1623 ±  3%     -11.4%       1437 ±  3%  sched_debug.cfs_rq:/.runnable_avg.max
    668.47 ±  4%     +27.7%     853.31        sched_debug.cfs_rq:/.runnable_avg.min
    123.90 ±  4%     -24.8%      93.12 ±  4%  sched_debug.cfs_rq:/.runnable_avg.stddev
    577.17 ±  5%     +39.3%     803.97 ±  3%  sched_debug.cfs_rq:/.util_avg.min
     82.31 ±  5%     -27.5%      59.69 ±  5%  sched_debug.cfs_rq:/.util_avg.stddev
     13.39 ±  3%     -31.9%       9.12 ± 10%  sched_debug.cpu.clock.stddev
      1084 ±  8%     -14.9%     923.03 ±  8%  sched_debug.cpu.nr_switches.min
      0.00          -100.0%       0.00        sched_debug.rt_rq:.rt_nr_running.avg
      0.17          -100.0%       0.00        sched_debug.rt_rq:.rt_nr_running.max
      0.02          -100.0%       0.00        sched_debug.rt_rq:.rt_nr_running.stddev
      0.03 ± 75%  +30918.7%       8.77 ±  5%  perf-stat.i.MPKI
  7.09e+09           -58.1%  2.972e+09 ±  5%  perf-stat.i.branch-instructions
      0.84 ±  2%      +1.1        1.95 ±  2%  perf-stat.i.branch-miss-rate%
   1368513 ± 78%  +11794.2%  1.628e+08 ±  7%  perf-stat.i.cache-misses
   6553472 ± 32%   +6548.1%  4.357e+08 ±  8%  perf-stat.i.cache-references
      1730            +2.9%       1781        perf-stat.i.context-switches
      5.69          +175.2%      15.65 ±  7%  perf-stat.i.cpi
    172.74            -8.2%     158.61        perf-stat.i.cpu-migrations
    483061 ± 37%     -99.6%       1786 ±  6%  perf-stat.i.cycles-between-cache-misses
 5.086e+10           -63.3%  1.868e+10 ±  7%  perf-stat.i.instructions
      0.18           -62.9%       0.07 ±  7%  perf-stat.i.ipc
      3036            +0.9%       3064        perf-stat.i.minor-faults
      3036            +0.9%       3064        perf-stat.i.page-faults
      0.03 ± 78%  +32290.9%       8.73 ±  5%  perf-stat.overall.MPKI
      0.84 ±  2%      +1.1        1.98 ±  2%  perf-stat.overall.branch-miss-rate%
      5.69          +173.8%      15.59 ±  7%  perf-stat.overall.cpi
    284916 ± 32%     -99.4%       1787 ±  6%  perf-stat.overall.cycles-between-cache-misses
      0.18           -63.3%       0.06 ±  7%  perf-stat.overall.ipc
    204439           +28.2%     262018 ±  3%  perf-stat.overall.path-length
 7.067e+09           -58.1%  2.963e+09 ±  5%  perf-stat.ps.branch-instructions
   1364474 ± 78%  +11789.7%  1.622e+08 ±  7%  perf-stat.ps.cache-misses
   6549492 ± 32%   +6530.5%  4.343e+08 ±  8%  perf-stat.ps.cache-references
      1724            +2.9%       1774        perf-stat.ps.context-switches
    172.10            -8.2%     158.06        perf-stat.ps.cpu-migrations
 5.069e+10           -63.3%  1.862e+10 ±  7%  perf-stat.ps.instructions
      3025            +0.9%       3053        perf-stat.ps.minor-faults
      3025            +0.9%       3053        perf-stat.ps.page-faults
 1.533e+13           -63.3%  5.625e+12 ±  7%  perf-stat.total.instructions
      0.06 ± 27%     -67.0%       0.02 ±141%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_common_interrupt.[unknown].[unknown]
      3.74           +26.8%       4.74 ± 17%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      1.78 ±  4%     -19.5%       1.43 ± 16%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
      0.01 ±  2%     -25.8%       0.01 ±  5%  perf-sched.sch_delay.avg.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      0.02 ± 15%     -26.3%       0.01 ± 13%  perf-sched.sch_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.61 ±  5%     +32.6%       0.81 ±  5%  perf-sched.sch_delay.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.69 ±  8%     -29.9%       0.48 ± 19%  perf-sched.sch_delay.avg.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
      3.88 ± 20%     +96.5%       7.62 ± 46%  perf-sched.sch_delay.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      0.08 ± 20%     -75.2%       0.02 ±142%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_common_interrupt.[unknown].[unknown]
      6.36 ± 26%    +157.5%      16.38 ± 41%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
    153.42 ±216%     -97.8%       3.44 ± 14%  perf-sched.sch_delay.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      7.48           +26.8%       9.49 ± 17%  perf-sched.wait_and_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      3.56 ±  4%     -19.5%       2.86 ± 16%  perf-sched.wait_and_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
    442.22 ± 21%     -64.3%     158.04 ± 95%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
     11.46 ±  3%     -38.3%       7.07 ±  5%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      1.23 ±  5%     +35.2%       1.66 ±  4%  perf-sched.wait_and_delay.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      1169 ±  3%     -61.1%     454.33 ±  6%  perf-sched.wait_and_delay.count.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
    409.00 ±  4%     +71.2%     700.33 ±  5%  perf-sched.wait_and_delay.count.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      3388 ± 11%     +35.9%       4603 ± 10%  perf-sched.wait_and_delay.count.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    588.49 ±  2%     +93.3%       1137 ± 48%  perf-sched.wait_and_delay.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
     12.72 ± 26%    +157.5%      32.75 ± 41%  perf-sched.wait_and_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
    411.49 ±  9%     -25.0%     308.67 ± 10%  perf-sched.wait_and_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      0.07 ±176%     -93.1%       0.00 ±100%  perf-sched.wait_time.avg.ms.__cond_resched.dput.__fput.task_work_run.do_exit
      0.06 ± 27%     -67.0%       0.02 ±141%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_common_interrupt.[unknown].[unknown]
      3.74           +26.8%       4.74 ± 17%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      1.78 ±  4%     -19.5%       1.43 ± 16%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
    442.04 ± 21%     -64.3%     158.02 ± 95%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
     11.45 ±  3%     -38.4%       7.06 ±  5%  perf-sched.wait_time.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      0.62 ±  5%     +37.9%       0.85 ±  7%  perf-sched.wait_time.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.57 ± 21%     -36.9%       0.36 ± 17%  perf-sched.wait_time.avg.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
      0.13 ±197%     -96.2%       0.00 ±100%  perf-sched.wait_time.max.ms.__cond_resched.dput.__fput.task_work_run.do_exit
    588.49 ±  2%     +93.3%       1137 ± 48%  perf-sched.wait_time.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
      0.08 ± 20%     -75.2%       0.02 ±142%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_common_interrupt.[unknown].[unknown]
      6.36 ± 26%    +157.5%      16.38 ± 41%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
    410.98 ±  9%     -24.9%     308.66 ± 10%  perf-sched.wait_time.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     26.98           -18.9        8.12 ±  8%  perf-profile.calltrace.cycles-pp.syscall_return_via_sysret.syscall
     11.86            -9.9        1.99 ± 14%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_safe_stack.syscall
     16.60            -9.1        7.53 ±  2%  perf-profile.calltrace.cycles-pp.entry_SYSRETQ_unsafe_stack.syscall
      9.14            -7.0        2.19 ± 10%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.syscall
     99.62            -0.1       99.56        perf-profile.calltrace.cycles-pp.syscall
      0.84            +7.3        8.16        perf-profile.calltrace.cycles-pp.futex_q_unlock.futex_wait_setup.__futex_wait.futex_wait.do_futex
     38.74           +41.4       80.09        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.syscall
      0.00           +50.5       50.55 ±  4%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.futex_q_lock.futex_wait_setup.__futex_wait
     23.71           +51.4       75.12 ±  2%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      0.79 ±  4%     +54.7       55.48 ±  3%  perf-profile.calltrace.cycles-pp._raw_spin_lock.futex_q_lock.futex_wait_setup.__futex_wait.futex_wait
     15.49           +58.5       73.96 ±  2%  perf-profile.calltrace.cycles-pp.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
     14.52           +59.2       73.72 ±  2%  perf-profile.calltrace.cycles-pp.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
     13.83           +59.7       73.54 ±  2%  perf-profile.calltrace.cycles-pp.futex_wait.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.06 ±  5%     +60.1       63.18 ±  3%  perf-profile.calltrace.cycles-pp.futex_q_lock.futex_wait_setup.__futex_wait.futex_wait.do_futex
     13.03           +60.3       73.32 ±  2%  perf-profile.calltrace.cycles-pp.__futex_wait.futex_wait.do_futex.__x64_sys_futex.do_syscall_64
     11.28 ±  2%     +62.3       73.63 ±  2%  perf-profile.calltrace.cycles-pp.futex_wait_setup.__futex_wait.futex_wait.do_futex.__x64_sys_futex
     27.15           -19.0        8.17 ±  8%  perf-profile.children.cycles-pp.syscall_return_via_sysret
     13.54           -10.4        3.10 ± 11%  perf-profile.children.cycles-pp.entry_SYSCALL_64
     17.74            -9.9        7.85 ±  2%  perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      6.23            -5.2        1.08 ± 13%  perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      2.16            -1.7        0.42 ± 12%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      1.23            -0.9        0.29 ± 12%  perf-profile.children.cycles-pp.futex_hash
      0.75            -0.6        0.19 ± 11%  perf-profile.children.cycles-pp.get_futex_key
      0.40 ±  2%      -0.3        0.13 ±  8%  perf-profile.children.cycles-pp.x64_sys_call
      0.32 ±  2%      -0.2        0.07 ± 15%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
      0.08 ±  8%      +0.0        0.11 ±  3%  perf-profile.children.cycles-pp.sched_tick
      0.02 ±141%      +0.0        0.06 ±  6%  perf-profile.children.cycles-pp.task_tick_fair
      0.17 ±  9%      +0.0        0.22 ±  5%  perf-profile.children.cycles-pp.tick_nohz_handler
      0.14 ±  9%      +0.0        0.19 ±  5%  perf-profile.children.cycles-pp.update_process_times
      0.30 ±  8%      +0.1        0.35 ±  4%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.21 ±  9%      +0.1        0.27 ±  5%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.23 ±  9%      +0.1        0.30 ±  5%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.25 ±  8%      +0.1        0.32 ±  5%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.24 ±  7%      +0.1        0.31 ±  5%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
     99.74            +0.1       99.88        perf-profile.children.cycles-pp.syscall
      0.90            +8.0        8.89        perf-profile.children.cycles-pp.futex_q_unlock
     39.09           +41.1       80.21        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.00           +50.6       50.56 ±  4%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
     23.87           +51.3       75.20 ±  2%  perf-profile.children.cycles-pp.do_syscall_64
      0.83 ±  4%     +54.7       55.52 ±  3%  perf-profile.children.cycles-pp._raw_spin_lock
     15.57           +58.4       73.98 ±  2%  perf-profile.children.cycles-pp.__x64_sys_futex
     14.60           +59.1       73.74 ±  2%  perf-profile.children.cycles-pp.do_futex
     13.96           +59.6       73.57 ±  2%  perf-profile.children.cycles-pp.futex_wait
      3.16 ±  5%     +60.0       63.20 ±  3%  perf-profile.children.cycles-pp.futex_q_lock
     13.06           +60.3       73.32 ±  2%  perf-profile.children.cycles-pp.__futex_wait
     11.42 ±  2%     +61.5       72.94 ±  2%  perf-profile.children.cycles-pp.futex_wait_setup
     27.13           -19.0        8.16 ±  8%  perf-profile.self.cycles-pp.syscall_return_via_sysret
     15.47           -10.4        5.08 ±  8%  perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
     17.56            -9.8        7.80 ±  2%  perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
     12.31            -9.5        2.78 ± 11%  perf-profile.self.cycles-pp.entry_SYSCALL_64
      6.71 ±  2%      -6.0        0.68 ± 11%  perf-profile.self.cycles-pp.futex_wait_setup
      5.45 ±  2%      -4.9        0.55 ± 13%  perf-profile.self.cycles-pp.do_syscall_64
      2.94 ±  2%      -2.2        0.72 ± 11%  perf-profile.self.cycles-pp.syscall
      1.82            -1.5        0.34 ± 12%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      1.60 ±  3%      -1.2        0.38 ± 14%  perf-profile.self.cycles-pp.__futex_wait
      1.19            -0.9        0.28 ± 12%  perf-profile.self.cycles-pp.futex_hash
      0.95            -0.7        0.24 ± 11%  perf-profile.self.cycles-pp.__x64_sys_futex
      0.81 ±  3%      -0.6        0.23 ± 14%  perf-profile.self.cycles-pp.futex_wait
      0.72            -0.5        0.18 ± 11%  perf-profile.self.cycles-pp.get_futex_key
      0.65            -0.5        0.18 ± 11%  perf-profile.self.cycles-pp.do_futex
      0.60            -0.4        0.17 ± 11%  perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.37 ±  2%      -0.3        0.12 ±  9%  perf-profile.self.cycles-pp.x64_sys_call
      0.29            -0.2        0.06 ± 11%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
      0.79 ±  4%      +4.2        4.96 ±  3%  perf-profile.self.cycles-pp._raw_spin_lock
      1.10 ± 14%      +6.3        7.37        perf-profile.self.cycles-pp.futex_q_lock
      0.85            +8.0        8.85        perf-profile.self.cycles-pp.futex_q_unlock
      0.00           +50.4       50.37 ±  4%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

