Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB5F1C5F27
	for <oe-lkp@lists.linux.dev>; Mon, 24 Feb 2025 06:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740377662; cv=fail; b=CQX7MRKsNmGEh72KTZETrHQS4JGXFBHz5pRohsa5NfFMl58PIe8pm7O8NV0zB+7o+X+mg0eXx8Vf3tAaHPt4MTg2LgeBlFjbiLfkH1VWt2qo5IwzP9GwUwVYueS0+Js5l7huAyKT4ssz1GGLVPaXYAix4lgqkJlhio3oApnzRi4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740377662; c=relaxed/simple;
	bh=xEETcwei5JPU1SIGCUq44fnpkiMg9gMyrm4w4BwWkGo=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=JguRnOuusLj12SLrokJ9BxhUn1zxDi/CD7xNCXXk6b0AFdClqHIjHzO8as8L/iOA9dMCIJtnKfXRzzo5LtUPXDdVXH9GonUBFXBW2OersG4g5rk0WvSvOqTF4aIvveP1iX1s7iWQwoJwFOWmzjsCG7ruuq+ktO33En6P+apOcWE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NRNLmRR2; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NRNLmRR2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740377659; x=1771913659;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=xEETcwei5JPU1SIGCUq44fnpkiMg9gMyrm4w4BwWkGo=;
  b=NRNLmRR2zry9EWXg8z5ADLqZ9SEz424bh2PjohHU1xJV/C0EMELW95KD
   DuppiGLZ/KbJ3I18BASQBQo5n3Fq6h0dM7OU7JVJjP30W879C2J1h8eal
   NgvKebK6xnS3u829Lr6hmkjzQEZjtLdNXswU4iz0/klizUf1wYoxlqCFX
   5aJzI2FNE4yV8KYqCRMVhsIjnaWlRc2Tmy1+rgkoRX0KRg6o4Rme2GM6n
   74KwCzzRPwS6YSdzGKJLmFU30LjTi6cRMejArZhPuXWuL9K/tBomETHPX
   rT6JWznBwnDK00SeujN9bV4IdPfGjYwPFEGdUhCTyZLAp4/TUJnpRuv9d
   A==;
X-CSE-ConnectionGUID: uXGDV2tSR7yyGU+Fephf2g==
X-CSE-MsgGUID: smZKQswSRCa5QYL4BTGvVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="41032142"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="41032142"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2025 22:14:18 -0800
X-CSE-ConnectionGUID: koIxC9ueTTyY1/LBoCd4NQ==
X-CSE-MsgGUID: NGkaAZWJRC+FCxq3gag/6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="146813004"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 23 Feb 2025 22:14:19 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 23 Feb 2025 22:14:17 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 23 Feb 2025 22:14:17 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 23 Feb 2025 22:14:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YQ1AKBPBGzGMNLEiRwAHCYpU4HXPVMg4jzMNAomeonlZiZaDyOCKqudSBogKzUuWYoGksXvHrwffOhvlEPb3do+fQtr3Vedi+vy3uPu6CwYy4gKU1baKRWzEcaucmXzQ3120JocVsGsb89OiT0E7dcsLuj8128iai8lVaVxX8Oxr+RHqBylZt/4fJ+Z6mz6q3khkVUsOssOVLMs8m79vroP5wHqw+87y3p+PSUSuL9gcqZCwB6qBifwYOwlZPc4AxSqBmy9eBo7Av6rnLVdGRnSdihYW72lWT01UD2EAI/26kB8tpUsohckeJUgKxb/9C8/xz3WB6x2px7bTsu2pGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PbgPc1oZ7A1OrWm/55nM7k6H/fsWKLGOmaP4gid2HYo=;
 b=lpWt9cmmwRR0w37+tdNWxZzxZ4N9d+11Ljv54DG9QF17CdEQqOf1QwHBvHlh1ro3b/cCcKwxqRzJ5LPHBkIfRMrgl8FMkSaVXrvVdEBMMw1MPDhEUHeWpAjyqRMQxocaIFEz6O30dCqWWvRODnWO47yZO7IOao2rBxmzuzIfMcWH8gge34CFcVXzgwMr57aUZnwLkyivgF6AmJwZJTqwajLnRsZSafwWZGEDeLVfJxVUK9W8liBnJEh54isMinN1em74/Sp5ZIMecNgW5HG9qb1zrg9yca5/nd4XmzT4uFiSDjVNQNmb3if9ip7Pj8KFLpC0c0aFlCsm0KSwP+xR8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DM3PR11MB8759.namprd11.prod.outlook.com (2603:10b6:8:1ac::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Mon, 24 Feb
 2025 06:13:58 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 06:13:58 +0000
Date: Mon, 24 Feb 2025 14:13:49 +0800
From: kernel test robot <oliver.sang@intel.com>
To: <jason.zeng@intel.com>, <lin.x.wang@intel.com>, <pei.p.jia@intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [bytedance:6.6-velinux] [sched/fair]  2d83a6635b:
 stress-ng.affinity.ops_per_sec 89.3% improvement
Message-ID: <202502241236.9a6e4525-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0042.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::23) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DM3PR11MB8759:EE_
X-MS-Office365-Filtering-Correlation-Id: fac5ee9f-675a-4fc9-6b99-08dd549a6c99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?AKBOgTHenHg+4Juueq4T6cn6E2D1hATrwzAFnbcWozIELUK3PsN3MwBafh?=
 =?iso-8859-1?Q?hIOezuL1lkx0oUHO8+n/KN/weTAUeeKtOrWApHtzNmv4PBPR5ZATTFbb4X?=
 =?iso-8859-1?Q?tJM7/ZSQ4GNzF3hLIp/ZYM3hi2Kv1CGmX1+5bKKiB1jfQ0vybxkDxtHrOo?=
 =?iso-8859-1?Q?PeeRQVSA2TILzD2ovQjT8Tv7HS6XGZi41HIiquNEZYSeXjfkgyKhYJpSmQ?=
 =?iso-8859-1?Q?ty/cQ6VjAnLHVB7rLGYLiYcLysIp77mQmuveFIlnDYQQoG/RqR43tLUnAR?=
 =?iso-8859-1?Q?t64Uvs4huR+9vo62gp5tLkHJ6p2GfyUGw5avVA8FgTwYqemLULohyf00C1?=
 =?iso-8859-1?Q?/HdB3AblmRWEAetxRutpre9C1T2tr2CWMBq/KJgC2uLucFScMrKtQxixqd?=
 =?iso-8859-1?Q?IRZu0REGgDYKpXWkPfIK/n65aze6rWftBGKABbJTcM1nT0fnJI0wKiFPhc?=
 =?iso-8859-1?Q?PKqnM6qsb3Arlvo00cQkZUQz8TJKigBK+fML140RY/8IIXMuliTKZbjC5P?=
 =?iso-8859-1?Q?23anCPYw+b0Btk4Wy+MEIOtKJ4KkPrJUVlHbNWpR04spYWg3o9vpOcneYy?=
 =?iso-8859-1?Q?oqjmd6VRufWeWdJWbCETKGD3XLkDeJlUXbb9KzBkAWjebr8tmciBrSa71E?=
 =?iso-8859-1?Q?Ajpk/aVQdpDz81opDcvSG8mGLIIYX/xFWXzlCbl0h6hA+1UCEKCUGL0vbO?=
 =?iso-8859-1?Q?OscZ5VOmb+1sj+paDrgcws1jrRalmISnQyNDbh7ur6uUjYMs6C/NQRTts2?=
 =?iso-8859-1?Q?zBK55d3A2pR9rGBvS7K7HBdN73nrl2WmrxXK7WHvRvVnOomiuYBnADLY+n?=
 =?iso-8859-1?Q?HtAFJLjcpLuYKlWZfTJe1ChmLtuiZYVHBM0Ybi5Yw5zcEpgzXfyQKbRZxV?=
 =?iso-8859-1?Q?cVDQAw/ykt5LuNcViQJUoEQMaeA5rHCGB7RJXMc+he/azIlr8JwXFAzHdQ?=
 =?iso-8859-1?Q?Ihld9URp6L9ZtdgIanfxbgTcFbaGaNCDDHgdWguoBHACy7ttMfd6HvUBAI?=
 =?iso-8859-1?Q?FUIVWIICuoa3MiQsZ2NwqLGdbAVUhZolyMmEQVKQvwnnikgWd4xPU4Bs9E?=
 =?iso-8859-1?Q?/2znYBXVnI9OPPFcebGUTmCM9BHfyZgQa9xwO9BwPlbkMmyP0kuuKsZwnh?=
 =?iso-8859-1?Q?9A2ZMfPgt+eYtskaQjhAUwtCTUfjftwX8B5iteoEgGhxj9JuDmHcxyg/U2?=
 =?iso-8859-1?Q?xQLO2XZxLiE1HOanCVcphVHBBISOI7TeHkRFdLoWzahqvGwoNC6XXLRc4D?=
 =?iso-8859-1?Q?mj4juBHRbLPQMrmU/Ya8H0chKFK3Lq9Ls1zIro7J2yIbtq1IauVFyJQDGZ?=
 =?iso-8859-1?Q?vz+9t+1QDusdoi+iu+AtE8AaV2sixmjtd3MBk3ERiJTpYrgBN1Rn8L2ODR?=
 =?iso-8859-1?Q?u2ZQYOXQ2V1Vt5UWzMqcIfBTTLfR0dzg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Aa6zj9F2ZQdGfo7nblGyh48Qc2UTBLQxqs3QJUXl4HDjGAclVscEvFK8h9?=
 =?iso-8859-1?Q?2bNA9UlyuWh4evNsdsRStr0IGShqwd1qfk7ZvCwXS7+rgWctFMKTgWtNc+?=
 =?iso-8859-1?Q?POGzZRXbHexENUfDsgwmsQZYas71UtXa7mX2DFkBlX20MBMAJng/qUmd1m?=
 =?iso-8859-1?Q?i86utGvXUX/p1uxE9cmFKiQbZao7K97c1StSsOX9+aJmG9efMb+otF5NM8?=
 =?iso-8859-1?Q?8lmNUkXFepH0qiMNufXjucJJx4Wwoqj1enHNhS+o1BCfqmc5PJoHt42c/Y?=
 =?iso-8859-1?Q?MquHbTMq6l/LUzY93DOt7MkNLUVd5kLk/dS/KrwSRWjaJpfabLV4C4G8Rk?=
 =?iso-8859-1?Q?RcIWQffpQ0Sn+JjC3DiWsKHXtHhFDT/xfWucqgXkaz49pgq4W9pSqOWLDe?=
 =?iso-8859-1?Q?q6rvbTrGoRgo4gFu2fAGsQXtrkKwdcVvV+/aS0A72wC9qxbazc7U6L1JYX?=
 =?iso-8859-1?Q?9tf78CcTvgkIT2b49D+pAPwBH2dt3IFXEQZT3oMYbskxZsOGGQbq18gZZG?=
 =?iso-8859-1?Q?fEImRnkjNV8OrDjqx2rmmmDNnRGu5kIRdB/HymwRPL5/SV10fTDuQ2huRG?=
 =?iso-8859-1?Q?pvG4bpUGsp2jxwXZKKy2ND46ZmsKc1ublhKQ4aXUNk46aEtIhxPeSMEifL?=
 =?iso-8859-1?Q?zMXCl7mXC+3byxiGvZhDvXtzKuO7u68pLHYZ+Hw4j7/e2ZsBWcs4TrVuHh?=
 =?iso-8859-1?Q?i1QiVXn2zuPK+phLfhXIV5GfUfjCL5V0G2u+yAS9QnG6CKYzGEgKTp3s/+?=
 =?iso-8859-1?Q?pB/2ug+H3hsNYmAcI/kVmOVXB3dsperCZl1cET7E8Z/ktjZaOEtrkHCCk3?=
 =?iso-8859-1?Q?kzlXQRB5TI1tSz51aH+vonSLqW+SmqJYLsJRF1kXhmmNhKA2dNZnKZRpOG?=
 =?iso-8859-1?Q?zlumlOtmLz65o2q8UEL3Us1EcMWhLpCiaDWdUwcP5YF6vD9/3fJteS0qUl?=
 =?iso-8859-1?Q?ztRZm1VuXpP9zvpZSmYQ3HAROLxM0/jZzUe0P5X6kLwYggfG5P4QjIGS/5?=
 =?iso-8859-1?Q?thmmK43nwV8B171jyrXTWBQS91SbMmwe3jeNkl/0Jrzp6yudSZynfw+lom?=
 =?iso-8859-1?Q?/c/oy08vTAtd5Rq2zfZjSzTVoIjj3AmynlAsnnpNJJiJTvs8UTyN9F+ySv?=
 =?iso-8859-1?Q?GoQL3gsLsueohA/El6HFr3lsfbMywtz4s6abn6m2DA2LBcJe0wDQH7Qj2r?=
 =?iso-8859-1?Q?xYwdSFVMh3s69q65lo/fhApq5u8BxssP0i+M9LttWDPmj5hfbopx+zkn5i?=
 =?iso-8859-1?Q?pm3VTtQmZe8TFVMO1M+scZ7ltkzXSytLVln74mD3Ord/8fHs5M09xE8XRd?=
 =?iso-8859-1?Q?2zpxt3oD4fkjlToa3zeEtuldOrCQjLoZQJ76KGE/CBPXXDFTmpPc0LsHj+?=
 =?iso-8859-1?Q?RT4+nFC8IWkFjhN+770MN9f3BDn4QCV0Eylqpsc5HM21y6or8RT6/FrstT?=
 =?iso-8859-1?Q?HdajKDJ9tP1sX23t1rlLOwui6plFwf3wZmrVa9OLakgoPue7VuzVKF/3sK?=
 =?iso-8859-1?Q?UZc4JaJVNR9bwDF5zesef6qQ9rlu1geZkJzn6jpPWmgvDnNwk7YOuyip26?=
 =?iso-8859-1?Q?w5RLK1AlNZOY9qT7hAv80q/LhYCyGnoAkHM7wGKvVRo0fbDkI2XuK+PMK8?=
 =?iso-8859-1?Q?cHbnuDE+I7fMxfi+YBy8h7pO0BPGTi1bVm5iWwIKfY6wOvRqGXc0IV2w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fac5ee9f-675a-4fc9-6b99-08dd549a6c99
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 06:13:58.1094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nFv2UDj+x6iLlLesgS08hoHJz3a2KQCF9ojPVw8wXHg6+lMktR0H3Qc1Yh/4pdMw0M3bv5imrJZA0O264ZMY5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8759
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 89.3% improvement of stress-ng.affinity.ops_per_sec on:


commit: 2d83a6635bdbc562c7b7bce62500281d5289b395 ("Revert "sched/fair: Make sure to try to detach at least one movable task"")
https://github.com/bytedance/kernel.git 6.6-velinux

testcase: stress-ng
config: x86_64-bytedance-6.6-velinux
compiler: gcc-12
test machine: 240 threads 1 sockets Genuine Intel(R) 0000 (Granite Rapids) with 192G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: affinity
	cpufreq_governor: performance






Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250224/202502241236.9a6e4525-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-12/performance/x86_64-bytedance-6.6-velinux/100%/debian-12-x86_64-20240206.cgz/lkp-gnr-1ap1/affinity/stress-ng/60s

commit: 
  e5d934fd00 ("cifs: fix setting SecurityFlags to true")
  2d83a6635b ("Revert "sched/fair: Make sure to try to detach at least one movable task"")

e5d934fd0013f8af 2d83a6635bdbc562c7b7bce6250 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    421.56 ±  4%     -20.4%     335.74        uptime.boot
 1.175e+10 ± 20%     -24.9%  8.832e+09 ±  9%  cpuidle..time
   3239798 ± 12%     -42.1%    1876924 ± 11%  cpuidle..usage
    105499 ± 14%     -34.9%      68636 ± 27%  perf-c2c.HITM.local
    105499 ± 14%     -34.9%      68636 ± 27%  perf-c2c.HITM.total
     20.79 ± 37%     +45.9%      30.34 ± 22%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
     41.61 ± 37%     +45.9%      60.70 ± 22%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
     20.82 ± 37%     +45.8%      30.36 ± 22%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
     50.40 ±  7%     -16.0%      42.31 ±  5%  vmstat.cpu.id
    468331 ±  9%     +82.0%     852350 ±  3%  vmstat.system.cs
    223188 ±  6%     +71.6%     383078 ±  3%  vmstat.system.in
     49.87 ±  7%      -8.8       41.02 ±  6%  mpstat.cpu.all.idle%
     14.28 ± 16%     -14.3        0.02 ±  9%  mpstat.cpu.all.soft%
     32.72 ±  9%     +25.6       58.28 ±  4%  mpstat.cpu.all.sys%
      3.14 ± 41%      -2.5        0.68        mpstat.cpu.all.usr%
    226957 ±  9%     +89.3%     429604 ±  3%  stress-ng.affinity.ops_per_sec
    174.64 ± 10%     -49.4%      88.41 ±  4%  stress-ng.time.elapsed_time
    174.64 ± 10%     -49.4%      88.41 ±  4%  stress-ng.time.elapsed_time.max
      8109 ±  8%     +71.4%      13897 ±  4%  stress-ng.time.percent_of_cpu_this_job_got
     13671 ±  2%     -10.8%      12195 ±  4%  stress-ng.time.system_time
    363.55 ± 46%     -77.5%      81.97 ±  3%  stress-ng.time.user_time
      7537 ± 23%     -31.1%       5194 ±  3%  stress-ng.time.voluntary_context_switches
    561293 ± 21%     -51.9%     270261 ±  9%  meminfo.Active
    561293 ± 21%     -51.9%     270261 ±  9%  meminfo.Active(anon)
   1145578            -9.9%    1032244        meminfo.AnonPages
   6613459 ±  2%      -9.2%    6006960        meminfo.Cached
   3662978 ±  3%     -11.7%    3233130        meminfo.Inactive
   3662978 ±  3%     -11.7%    3233130        meminfo.Inactive(anon)
   2999582 ±  4%     -15.5%    2533412 ±  2%  meminfo.Mapped
   3084578 ±  6%     -19.7%    2478094 ±  2%  meminfo.Shmem
    138616 ± 22%     -51.5%      67172 ± 10%  proc-vmstat.nr_active_anon
    286945           -10.0%     258227        proc-vmstat.nr_anon_pages
   1653988 ±  2%      -9.2%    1501743        proc-vmstat.nr_file_pages
    918631 ±  3%     -12.0%     808842        proc-vmstat.nr_inactive_anon
    753534 ±  4%     -15.8%     634524 ±  3%  proc-vmstat.nr_mapped
    137.31 ± 62%     -97.2%       3.90        proc-vmstat.nr_mlock
    771768 ±  6%     -19.7%     619527 ±  2%  proc-vmstat.nr_shmem
     45658            -3.2%      44185        proc-vmstat.nr_slab_reclaimable
    138616 ± 22%     -51.5%      67172 ± 10%  proc-vmstat.nr_zone_active_anon
    918631 ±  3%     -12.0%     808842        proc-vmstat.nr_zone_inactive_anon
   2259489            -4.2%    2163989        proc-vmstat.numa_hit
   2259489            -4.2%    2163989        proc-vmstat.numa_local
   2346835 ±  2%      -4.0%    2253501        proc-vmstat.pgalloc_normal
   1503356 ±  2%      -6.3%    1408924        proc-vmstat.pgfault
     41747 ±  5%     -11.9%      36778        proc-vmstat.pgreuse
      0.20 ±  2%      +0.0        0.24 ±  5%  perf-stat.i.branch-miss-rate%
  34322438 ±  3%     +20.0%   41172806 ±  2%  perf-stat.i.branch-misses
   5525584 ±  4%     +14.0%    6301834 ±  6%  perf-stat.i.cache-misses
 2.972e+08 ±  3%     +26.6%  3.761e+08 ±  2%  perf-stat.i.cache-references
   1256805 ±  2%      +9.1%    1371133        perf-stat.i.context-switches
     10.12            -4.9%       9.63        perf-stat.i.cpi
    602038 ±  2%     +10.6%     665816        perf-stat.i.cpu-migrations
    607990 ±  9%     -20.8%     481657 ±  9%  perf-stat.i.cycles-between-cache-misses
      0.10            +5.4%       0.11        perf-stat.i.ipc
      7.72 ±  3%      +9.9%       8.48        perf-stat.i.metric.K/sec
     21440 ±  3%     +14.2%      24491 ±  4%  perf-stat.i.minor-faults
     21440 ±  3%     +14.2%      24491 ±  4%  perf-stat.i.page-faults
      1.73 ±  4%      -1.3        0.46 ±152%  perf-stat.overall.cache-miss-rate%
     10.96           -73.7%       2.88 ±152%  perf-stat.overall.cpi
    228399 ±  8%     -82.0%      41188 ±152%  perf-stat.overall.cycles-between-cache-misses
 1.261e+10 ±  7%     -71.7%  3.562e+09 ±152%  perf-stat.ps.branch-instructions
    231132 ±  3%     -80.6%      44863 ±152%  perf-stat.ps.cpu-clock
 5.711e+11 ±  8%     -74.6%  1.449e+11 ±152%  perf-stat.ps.cpu-cycles
 5.212e+10 ±  7%     -71.1%  1.507e+10 ±152%  perf-stat.ps.instructions
    231132 ±  3%     -80.6%      44863 ±152%  perf-stat.ps.task-clock
 9.045e+12 ±  8%     -85.3%  1.327e+12 ±152%  perf-stat.total.instructions
   2115447 ± 12%     -32.3%    1431649 ± 16%  sched_debug.cfs_rq:/.avg_vruntime.avg
   3041468 ± 14%     -41.9%    1766738 ± 16%  sched_debug.cfs_rq:/.avg_vruntime.max
    219287 ± 20%     -94.2%      12718 ± 84%  sched_debug.cfs_rq:/.left_vruntime.avg
    516370 ± 14%     -78.4%     111306 ± 63%  sched_debug.cfs_rq:/.left_vruntime.stddev
   2115446 ± 12%     -32.3%    1431649 ± 16%  sched_debug.cfs_rq:/.min_vruntime.avg
   3041468 ± 14%     -41.9%    1766738 ± 16%  sched_debug.cfs_rq:/.min_vruntime.max
     25.02 ± 20%     +41.6%      35.41 ± 16%  sched_debug.cfs_rq:/.removed.util_avg.max
      2.86 ± 37%     +86.0%       5.31 ± 25%  sched_debug.cfs_rq:/.removed.util_avg.stddev
    219287 ± 20%     -94.2%      12718 ± 84%  sched_debug.cfs_rq:/.right_vruntime.avg
    516370 ± 14%     -78.4%     111306 ± 63%  sched_debug.cfs_rq:/.right_vruntime.stddev
     89.36 ± 40%     -51.6%      43.23 ± 29%  sched_debug.cfs_rq:/.util_est_enqueued.avg
     11990 ± 11%     -42.1%       6942 ± 19%  sched_debug.cfs_rq:/.util_est_enqueued.max
    971.97 ± 22%     -45.3%     532.06 ± 18%  sched_debug.cfs_rq:/.util_est_enqueued.stddev
  14657512 ± 17%     -98.6%     202077 ± 23%  sched_debug.cpu.avg_idle.avg
  19637544 ± 11%     -98.2%     360388 ± 27%  sched_debug.cpu.avg_idle.max
    112227 ± 61%     -76.9%      25971 ± 63%  sched_debug.cpu.avg_idle.min
   3492487 ± 14%     -98.6%      47289 ± 25%  sched_debug.cpu.avg_idle.stddev
      9.77 ± 29%     -54.2%       4.47 ± 24%  sched_debug.cpu.clock.stddev
      9.77 ± 29%     -54.2%       4.47 ± 24%  sched_debug.cpu.clock_task.stddev
   9960248 ± 11%     -98.8%     115257 ± 19%  sched_debug.cpu.max_idle_balance_cost.avg
  11161579 ± 11%     -98.3%     186883 ± 27%  sched_debug.cpu.max_idle_balance_cost.max
   1076167 ± 19%     -98.6%      15333 ± 37%  sched_debug.cpu.max_idle_balance_cost.stddev
      0.00 ± 21%     -86.0%       0.00 ± 72%  sched_debug.cpu.next_balance.stddev
     94.32            -3.4       90.91 ±  3%  perf-profile.calltrace.cycles-pp.__raw_spin_lock_irqsave.cpuset_cpus_allowed.__sched_setaffinity.sched_setaffinity.__x64_sys_sched_setaffinity
     94.33            -3.4       90.93 ±  3%  perf-profile.calltrace.cycles-pp.cpuset_cpus_allowed.__sched_setaffinity.sched_setaffinity.__x64_sys_sched_setaffinity.do_syscall_64
     94.07            -3.4       90.67 ±  3%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath.__raw_spin_lock_irqsave.cpuset_cpus_allowed.__sched_setaffinity.sched_setaffinity
     96.05            -3.3       92.76 ±  3%  perf-profile.calltrace.cycles-pp.__x64_sys_sched_setaffinity.do_syscall_64.entry_SYSCALL_64_after_hwframe.sched_setaffinity
     95.76            -3.3       92.48 ±  3%  perf-profile.calltrace.cycles-pp.__sched_setaffinity.sched_setaffinity.__x64_sys_sched_setaffinity.do_syscall_64.entry_SYSCALL_64_after_hwframe
     96.00            -3.3       92.71 ±  3%  perf-profile.calltrace.cycles-pp.sched_setaffinity.__x64_sys_sched_setaffinity.do_syscall_64.entry_SYSCALL_64_after_hwframe.sched_setaffinity
     96.49            -3.3       93.21 ±  3%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.sched_setaffinity
     96.62            -3.3       93.33 ±  3%  perf-profile.calltrace.cycles-pp.sched_setaffinity
     96.50            -3.3       93.22 ±  3%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.sched_setaffinity
      1.18 ±  2%      +0.1        1.28 ±  4%  perf-profile.calltrace.cycles-pp.__set_cpus_allowed_ptr.__sched_setaffinity.sched_setaffinity.__x64_sys_sched_setaffinity.do_syscall_64
      0.00            +1.2        1.24 ± 15%  perf-profile.calltrace.cycles-pp.update_sg_lb_stats.update_sd_lb_stats.find_busiest_group.load_balance.newidle_balance
      0.00            +1.3        1.34 ± 15%  perf-profile.calltrace.cycles-pp.update_sd_lb_stats.find_busiest_group.load_balance.newidle_balance.balance_fair
      0.00            +1.4        1.35 ± 15%  perf-profile.calltrace.cycles-pp.find_busiest_group.load_balance.newidle_balance.balance_fair.__schedule
      0.79 ± 15%      +3.4        4.21 ± 65%  perf-profile.calltrace.cycles-pp.schedule.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.78 ± 15%      +3.4        4.20 ± 65%  perf-profile.calltrace.cycles-pp.__schedule.schedule.smpboot_thread_fn.kthread.ret_from_fork
      1.62 ±  7%      +3.4        5.06 ± 55%  perf-profile.calltrace.cycles-pp.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1.62 ±  7%      +3.4        5.07 ± 55%  perf-profile.calltrace.cycles-pp.kthread.ret_from_fork.ret_from_fork_asm
      1.62 ±  7%      +3.4        5.07 ± 55%  perf-profile.calltrace.cycles-pp.ret_from_fork.ret_from_fork_asm
      1.62 ±  7%      +3.4        5.07 ± 55%  perf-profile.calltrace.cycles-pp.ret_from_fork_asm
      0.17 ±153%      +3.6        3.78 ± 72%  perf-profile.calltrace.cycles-pp.balance_fair.__schedule.schedule.smpboot_thread_fn.kthread
      0.17 ±153%      +3.6        3.78 ± 72%  perf-profile.calltrace.cycles-pp.newidle_balance.balance_fair.__schedule.schedule.smpboot_thread_fn
      0.11 ±200%      +3.6        3.75 ± 73%  perf-profile.calltrace.cycles-pp.load_balance.newidle_balance.balance_fair.__schedule.schedule
    192.76            -6.6      186.19 ±  3%  perf-profile.children.cycles-pp.sched_setaffinity
     94.52            -3.4       91.12 ±  3%  perf-profile.children.cycles-pp.__raw_spin_lock_irqsave
     94.35            -3.4       90.95 ±  3%  perf-profile.children.cycles-pp.cpuset_cpus_allowed
     96.08            -3.3       92.79 ±  3%  perf-profile.children.cycles-pp.__x64_sys_sched_setaffinity
     95.79            -3.3       92.50 ±  3%  perf-profile.children.cycles-pp.__sched_setaffinity
     96.70            -3.3       93.44 ±  3%  perf-profile.children.cycles-pp.do_syscall_64
     96.72            -3.3       93.46 ±  3%  perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     94.60            -1.6       92.97        perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      0.47 ± 15%      -0.2        0.22 ± 14%  perf-profile.children.cycles-pp.start_secondary
      0.49 ± 16%      -0.2        0.24 ± 18%  perf-profile.children.cycles-pp.cpu_startup_entry
      0.49 ± 16%      -0.2        0.24 ± 18%  perf-profile.children.cycles-pp.do_idle
      0.49 ± 16%      -0.2        0.24 ± 18%  perf-profile.children.cycles-pp.secondary_startup_64_no_verify
      0.30 ± 17%      -0.2        0.09 ± 36%  perf-profile.children.cycles-pp.cpuidle_idle_call
      0.28 ± 17%      -0.2        0.07 ± 46%  perf-profile.children.cycles-pp.cpuidle_enter
      0.28 ± 17%      -0.2        0.07 ± 46%  perf-profile.children.cycles-pp.cpuidle_enter_state
      0.23 ± 19%      -0.1        0.09 ± 12%  perf-profile.children.cycles-pp.__irq_exit_rcu
      0.24 ± 18%      -0.1        0.09 ± 12%  perf-profile.children.cycles-pp.handle_softirqs
      0.22 ± 19%      -0.1        0.08 ± 11%  perf-profile.children.cycles-pp.rebalance_domains
      0.33 ±  6%      -0.1        0.25 ±  7%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.36 ±  6%      -0.1        0.28 ±  7%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.09 ± 16%      -0.1        0.03 ±100%  perf-profile.children.cycles-pp.intel_idle
      0.14 ±  3%      +0.0        0.16 ±  3%  perf-profile.children.cycles-pp.update_curr
      0.08 ±  9%      +0.0        0.11 ± 15%  perf-profile.children.cycles-pp.finish_task_switch
      0.30 ±  5%      +0.0        0.34 ±  4%  perf-profile.children.cycles-pp.dequeue_task_fair
      0.33 ±  3%      +0.0        0.36 ±  2%  perf-profile.children.cycles-pp.enqueue_task_fair
      0.29 ±  2%      +0.0        0.33 ±  2%  perf-profile.children.cycles-pp.__do_set_cpus_allowed
      0.00            +0.1        0.05 ±  5%  perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
      0.12 ±  5%      +0.1        0.18 ±  3%  perf-profile.children.cycles-pp.pick_next_task_fair
      0.00            +0.1        0.06 ±  6%  perf-profile.children.cycles-pp.reweight_entity
      0.38 ±  2%      +0.1        0.44 ±  2%  perf-profile.children.cycles-pp.__set_cpus_allowed_ptr_locked
      0.26 ± 15%      +0.1        0.35 ±  9%  perf-profile.children.cycles-pp.cmd_sched
      1.18 ±  2%      +0.1        1.28 ±  4%  perf-profile.children.cycles-pp.__set_cpus_allowed_ptr
      0.15 ± 10%      +0.1        0.25 ± 17%  perf-profile.children.cycles-pp.detach_tasks
      0.00            +0.1        0.11 ± 13%  perf-profile.children.cycles-pp._find_next_and_bit
      0.00            +0.2        0.20 ± 15%  perf-profile.children.cycles-pp.cpu_util
      0.07 ± 21%      +1.3        1.37 ± 13%  perf-profile.children.cycles-pp.update_sg_lb_stats
      0.08 ± 22%      +1.4        1.46 ± 13%  perf-profile.children.cycles-pp.update_sd_lb_stats
      0.08 ± 22%      +1.4        1.46 ± 13%  perf-profile.children.cycles-pp.find_busiest_group
      0.60 ± 22%      +3.3        3.90 ± 70%  perf-profile.children.cycles-pp.load_balance
      0.39 ± 31%      +3.4        3.78 ± 72%  perf-profile.children.cycles-pp.balance_fair
      0.81 ± 15%      +3.4        4.24 ± 65%  perf-profile.children.cycles-pp.schedule
      1.23 ± 10%      +3.4        4.67 ± 59%  perf-profile.children.cycles-pp.__schedule
      0.40 ± 30%      +3.4        3.84 ± 71%  perf-profile.children.cycles-pp.newidle_balance
      1.62 ±  7%      +3.4        5.06 ± 55%  perf-profile.children.cycles-pp.smpboot_thread_fn
      1.62 ±  7%      +3.4        5.07 ± 55%  perf-profile.children.cycles-pp.kthread
      1.62 ±  7%      +3.4        5.07 ± 55%  perf-profile.children.cycles-pp.ret_from_fork
      1.62 ±  7%      +3.4        5.07 ± 55%  perf-profile.children.cycles-pp.ret_from_fork_asm
     94.59            -1.6       92.96        perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      0.09 ± 16%      -0.1        0.03 ±100%  perf-profile.self.cycles-pp.intel_idle
      0.09            +0.0        0.10 ±  4%  perf-profile.self.cycles-pp.update_curr
      0.13 ±  3%      +0.0        0.15 ±  4%  perf-profile.self.cycles-pp.update_rq_clock
      0.10 ±  5%      +0.0        0.14 ±  9%  perf-profile.self.cycles-pp._raw_spin_lock
      0.00            +0.1        0.09 ± 14%  perf-profile.self.cycles-pp._find_next_and_bit
      0.10 ± 13%      +0.1        0.23 ± 18%  perf-profile.self.cycles-pp.detach_tasks
      0.00            +0.2        0.19 ± 15%  perf-profile.self.cycles-pp.cpu_util
      0.05 ± 54%      +1.0        1.00 ± 11%  perf-profile.self.cycles-pp.update_sg_lb_stats




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

