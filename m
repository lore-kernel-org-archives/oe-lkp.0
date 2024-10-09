Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA5B14D6F9
	for <oe-lkp@lists.linux.dev>; Wed,  9 Oct 2024 08:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728461606; cv=fail; b=n2Jjr0VJHImqXYJj4/YWCBAXbsKLY9aPSzHV7dswH/DGTSu4JDoSGzvu5/xmp6l1TUntKlzaPEOmxa5v7kNRrefinxWS3CH8DGn0vZyTaSn9ke5L9vcMC3Czt1Tn/vx/L1EkyuFsEPFz5iUf59TqOmHS5dFfEdpaOHapaGhcxUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728461606; c=relaxed/simple;
	bh=d2pH8cShOqgTsPYTwQ0YRhiQizGg7Yg1pbiCrpks/uU=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=rqpNAPZcQfrAxQrVS5533gs7dAW0YvepmlegqPtm/93Y4uCubD3bbri22EHAcxevFGNU1xYNpTSKMaxKGjdLoJRk7heMXgvyoEpO8qXvqd9FnogtB8+/c9ak5dCgx7U+D+iYCNVxuVcmnD1Qe+UwFb7zrUIP2llOL2iexbIOgBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b1tF0X4P; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b1tF0X4P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728461604; x=1759997604;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d2pH8cShOqgTsPYTwQ0YRhiQizGg7Yg1pbiCrpks/uU=;
  b=b1tF0X4PNMVRXriG2fL/qlmPXK6yKAdHwdZBnak70ixz25QcC4Jsd2/r
   sTur2FZukwt11RIIR0qVTv7hCJP6usNiSAox3Oa32PyR7Qj70+csSSUGv
   byqmZPJn3VZfO9gx2PqbEusWKdPoqa75vQGm0lxQdlLoQL8UCyfINehEv
   9VjsPp47sN2TtM5w/SYuTyzy5YtNiJvTGB7fbGExvSPcFZ9najspGRW5r
   /tHEhotTZOAdmB1r/kZUInijRJ5+dE+GnpcmI3ZRyOz87Xm/IlUVgLthI
   B5eFy3ON9GLEa1Z2NgSKNgN4c+QgbPd2wAjz/9QwDm3bvZaYpYw6rR8Ub
   Q==;
X-CSE-ConnectionGUID: PfLZyiDqQi6lURefSUGKQw==
X-CSE-MsgGUID: o/6Vr3xYQZKwe65c47eqLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="31445507"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="31445507"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 01:13:23 -0700
X-CSE-ConnectionGUID: OGjiAGKfREyr7IL1IsLr3w==
X-CSE-MsgGUID: fTmQV0RKSi66QHqMVIwDtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="76487614"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 09 Oct 2024 01:13:22 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 01:13:21 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 01:13:21 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 9 Oct 2024 01:13:21 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 01:13:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kND8OQN5QKd+igl10ksyw0X7Ua1nVXnRwoNFcc8wcZhf2a/xV273nfsm7FwHlUjgs9DCpnBUvg16cnc0qPVrLx/p4A8zDIvoSczQoqq2u0FhvnHHBDwC5Ba3JYxCYVc62XSaLxIhzV7nLMLulb3f7e7aVWGjVse5Gvip3yXhu3EF6unt6E+EpXL4+1wMFleJpD3djmsbvsbZrnUG3pNQCmyHqFq7gq/xXV3oawQ/BSNsdytEes/F7JN3lo4KkHmJ6s2l9fDWtd10Y6tvxCjeK2YyCbBZdBYTFnISqARk1utWkB8Fz/Hgdug2LodIxQFz3fShypAKjzgi8lE9gA2XVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yTDq0/eDXxUQMHZ51h4CBeT3CQLJ2WG+Egmelvi3xZ4=;
 b=aIZQTlrFqVTnbswfKU+b9+f/wlmmwXPHM9q+a8COSRFZZ58vqMcTMbmxjJlposWW59cu+J8qMOA3BsSjexrOuMnjpBArqwkqlAKa5fX+RLiSJKy9f7B3DAPJODh62b0L7tLJCZ2iwCrbSpZYU/EXkJk5GCI1Rd5PGaPZ1E8DBmxmIm39xVFHlpDwg476ScOEqOmDqjpHeXs8Key06oQsfgwYOyFtLqtEA46wZCCn/Czx2MPlUR7BMzHKFH8jcoD/eB8DFGHBj7flRkUo7wih1zm1XnU2EVKFO1Zl0wQRpDgScVXbhXBGj68CgiCk5jW1tJplr6CwZXkpoetF55Xkiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DS7PR11MB6152.namprd11.prod.outlook.com (2603:10b6:8:9b::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.23; Wed, 9 Oct 2024 08:13:17 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8048.013; Wed, 9 Oct 2024
 08:13:17 +0000
Date: Wed, 9 Oct 2024 16:13:05 +0800
From: kernel test robot <oliver.sang@intel.com>
To: <kaixuxia@tencent.com>, <frankjpliu@tencent.com>, <kasong@tencent.com>,
	<sagazchen@tencent.com>, <kernelxing@tencent.com>, <aurelianliu@tencent.com>,
	<deshengwu@tencent.com>, <flyingpeng@tencent.com>, <jingqunli@tencent.com>,
	<jason.zeng@intel.com>, <wu.zheng@intel.com>, <yingbao.jia@intel.com>,
	<pei.p.jia@intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [opencloudos:next] [rue/mm]  0d35c4c639: WARNING:suspicious_RCU_usage
Message-ID: <202410091610.3345ae6c-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: KL1PR01CA0111.apcprd01.prod.exchangelabs.com
 (2603:1096:820:3::27) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DS7PR11MB6152:EE_
X-MS-Office365-Filtering-Correlation-Id: 2af035ea-9360-4af8-42be-08dce83a3a78
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UDs/faGAwShUw5PN98aeDVl4Y6gVKRAUED+T0vyiNHKkXmSIgrcXe0CmMo4G?=
 =?us-ascii?Q?/cuCLtflUfcot/veYwcLxBWbmE+kGmevL+bNsKuucbSlY8fyOs+UcgbBi7JB?=
 =?us-ascii?Q?5/meEU+JOoDieRFIDo0Z2Dij9CCH4VFvk1ppTQbTnUPNY0pFjh6P11AoUNqy?=
 =?us-ascii?Q?4UVNLJZm8ADO5rkDj5aP9ABrfpkxdN2Y8iIw66qaaSaFCcUSggeouQZjZMkZ?=
 =?us-ascii?Q?JxniI1oqD9AQbkVliPQmcnUwPBnLGsPmfvlo1+Dlvw2V/z9OgT88UrpVseUM?=
 =?us-ascii?Q?GKS3gP0LrJY2eD84FE3i1takgDqFOXF7dMnavgTMxHk9WSymyu/iw/Ba6xkA?=
 =?us-ascii?Q?CO041XFgTmbHcHQRxEt1GXHXcTolv/ntAQG4+uo/xiPsL227eJJbJvfXO7um?=
 =?us-ascii?Q?189Z3DlQs+bSXedL8NWHDQI3+tqQ78vvKox9J+v27VO6nsiV7fQmr1JI5LVv?=
 =?us-ascii?Q?mWQ1lxu0EOxRTXkzbtMvxk0QttrpRlIlhSDbiPVKQBcqWn0GiQdg8n8kbBNW?=
 =?us-ascii?Q?g3ZxwvP7ibJrXa0TLZkyjROYhpnA0mC69v78ofJ8NVCM5hWRT9c+oCYprD+Y?=
 =?us-ascii?Q?/7MrRP/fiNfG+AycijEquAgnXclc4IcaOmOu0JlLRHuEWjEzFz5ydcaGImTe?=
 =?us-ascii?Q?h2XQTEQKDqhGoazJostrHpPYZ9045FDUfKcTovhQUK1UY/AApSTPshg7p1KM?=
 =?us-ascii?Q?MqS0KzR4Y+8uVSgxcwXps0k5ShFqoks9rVJgF0/acx3LupPC46QiqNVJNte9?=
 =?us-ascii?Q?oHCyEbRFSf1pIJCSinwzRxZgjyO8krer+sPhC1zsO2E4yZA/E6j5CaQ/zzbG?=
 =?us-ascii?Q?yQjgqSIEBeHxCJe9Zjg4C/LjkinJjUhBs2HGuLtH6hiyPoM9ySmsGkRfn+zU?=
 =?us-ascii?Q?C1l6GDpYJbqfxERsOPBnZ2et1yc0heW2GjSqNhYZ12yZcRnGsen6hebTX7ey?=
 =?us-ascii?Q?5rFT/a8JD/+jQKAFYZBOnK4+wtn+jKuuMD/cNCOES7ET4T+Qw+Lsbs/oUnOz?=
 =?us-ascii?Q?AN/FcmRHlmOrBH2Z21AghaS+n/+7GvwjKFuBWJ3e6NwBsP4pySuSdU2XRGpd?=
 =?us-ascii?Q?zcFEsNhPQA3L0V0UKaED7hXTwUhp5gChGEscHc3m4qINyXjIt327TSxfc2B9?=
 =?us-ascii?Q?HFN3qAh/3WObNrld5ogmEnAvrDiFCyk+1gxBfdiqS4NiEyyDbJ28FLH9voPZ?=
 =?us-ascii?Q?pjncy80s5YC4AZeTo5msr0aFvVMufkkjPRVN12nA9m9Bx1Qt4q3LolTO2FhR?=
 =?us-ascii?Q?WGdqxe/24zckJCA+fuN2LDjlPFf3CN2BVo4ULyHLcw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sJ7Q2VfJ0qAjOEbx7qQLiDnjhy1gbwtB6DD6AgJ7fuKH6zIPwJGBmmO414gI?=
 =?us-ascii?Q?0UK4owu2E3KMY0pwh1EtUnZa5t38iTJw9ckAqMQKyDIa2aoO5Puy6yjHtv4l?=
 =?us-ascii?Q?pxsXpaLITo61w8Sqamz8Wc7Ega6I2qgAhtL43C0W17iHttNTSr5wOyNydQyh?=
 =?us-ascii?Q?pdV/x0GwwGizQu3/8aYy6ltWD1rdTwkhHjlJzwiNijkW5eQM7ea+28wuaQBm?=
 =?us-ascii?Q?1v/NA59G5aDC9hUJao5PDerp5anAh1iwMsWNm0oBHujoAELDAJU7+Zqf/D/+?=
 =?us-ascii?Q?nrq3gz17odHJG63i8nG6Gs9MhUIeJ6XLLmt7/bylTsdtwVIefeB1x14S2NUa?=
 =?us-ascii?Q?6lw0FxzRTn2fpX0XRmCEm/wT/mEC73zVig1n/8uttODzndCQ7TsxB2DtC4xp?=
 =?us-ascii?Q?6f7jUv3ZKfRjm0jCkEFq6TvmhHHwhlor5Ze957qp0zr33QSGAJqTFz6+bQma?=
 =?us-ascii?Q?GVn8jpQhXTKwtvXY0TPqmY58iGKWx0unWrYaWIIV2D40DZ2LnELSTQrMNehj?=
 =?us-ascii?Q?Q107HyzzBvNRZCWFB0DLpc5IB2sWeAc8WPuwAWO4a9xQAF/p+lxMrePMm4lM?=
 =?us-ascii?Q?7BRL6D4Q+fWhS91XkaN+JVhVHxgUwlyPpofhZwcaCbBHi9hYYpPs7modvXz1?=
 =?us-ascii?Q?AM7tX66MqQkTgwyPkM4qQI41k/c+thEZzWrZqSWX+N1rHGdv+Y5ayX1OBnS2?=
 =?us-ascii?Q?+lf0hd2v2nDc6LiM+QzuWYnTgYQOmeLzoQ1UqpBPoVKq5LG/v9VKsVgzLO2x?=
 =?us-ascii?Q?hZGximzHSfqglOCz6MW0aJmdeebWg8h22E6y0KF8T21DFWsRm2dG9OCttEjn?=
 =?us-ascii?Q?kZ3LwMtvl/+EqreRt8DAQ3lqECxHNZzjXV6pcwr+0CifoIn0uTylVDvM+MTS?=
 =?us-ascii?Q?yY49EknuGHnbKaClfBfGc6lkH02jEHYH3P33EMZ6FRqZuaTlNquXunfHkTyQ?=
 =?us-ascii?Q?nDfiDzUQ9ki+Q3BBOgZhvof/D/+cUSw00eCy6/Zd+Iw36yVg1tOZ8Esf5tB4?=
 =?us-ascii?Q?vOkRnaNLB6KpYEBtCneZyzWuxyf9q/HOxdtN3CFKGg/Nqel8QxJQsM03KEGc?=
 =?us-ascii?Q?RDTpyzSCNDE+Rv/oUkTDllePjSvO8TPB426h2qEZo97IpDA/7/3RhRGYA67X?=
 =?us-ascii?Q?Gj+zx+UIr/0oNmR5K10pOuFPyhNBtE9Erz29MHdB/Fhu7GGg1cprU/kBHzLa?=
 =?us-ascii?Q?YOg0H/qap6uGhGsDbXni77m2+4Sopd8q6SRYqtDFZfOGhTkMn3ceHV4b/ciD?=
 =?us-ascii?Q?nhrVTpKXkVPAS/p1nV4lyHRCx/rUlZIAPkDIR2KWK5utSqXMt+cGRsIpj8ie?=
 =?us-ascii?Q?vL97kihGIPAYqPpaX9DsdLaHanfkOVIq+L4+kDIAW017nhg+uJlziDsn8epO?=
 =?us-ascii?Q?BhItKxOS+CHnPC+7VDl0vzjMuTZlytr4kR/nMvwVP/QB3IRpUpkGrVIcYheE?=
 =?us-ascii?Q?OAsFSaE9O2b+FbcUNgA4CA+xZdjDhCzn0fwU+Dz/6V7BpnXxmKDPoBqoDvNL?=
 =?us-ascii?Q?qoL9+2fK45hMmtelBwM2iEhPK+/SbAk0Jo+HxKNJ+o+cZo4H/kylOzHwbIeD?=
 =?us-ascii?Q?+IKzRp9ojNt/wjEQdo57NtfZRIuHr37lTBFc2+I31F44uX9reNS1Tb/U9bNM?=
 =?us-ascii?Q?eA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2af035ea-9360-4af8-42be-08dce83a3a78
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 08:13:16.9531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X0ejWC0uPjpPoViy36/CEvDWK0uQDjZ31g+Mxm8zsQNSarHhgl3YwDLEKfKdMDFN40tSLl61mXvfU9LN9ZJAOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6152
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:suspicious_RCU_usage" on:

commit: 0d35c4c63934d43cba984351ade6326acfe3a631 ("rue/mm: introduce memcg priority oom")
https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next

in testcase: kernel-selftests
version: kernel-selftests-x86_64-977d51cf-1_20240508
with following parameters:

	group: cgroup



compiler: gcc-12
test machine: 256 threads 4 sockets INTEL(R) XEON(R) PLATINUM 8592+ (Emerald Rapids) with 256G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202410091610.3345ae6c-oliver.sang@intel.com


kern  :warn  : [  245.730287] WARNING: suspicious RCU usage
kern  :warn  : [  245.736314] 6.6.47-01324-g0d35c4c63934 #1 Not tainted
kern  :warn  : [  245.743549] -----------------------------
kern  :warn  : [  245.749628] include/linux/cgroup.h:444 suspicious rcu_dereference_check() usage!
kern  :warn  : [  245.759512]
other info that might help us debug this:

kern  :warn  : [  245.773278]
rcu_scheduler_active = 2, debug_locks = 1
kern  :warn  : [  245.783602] 3 locks held by test_memcontrol/4377:
kern :warn : [  245.790454] #0: ff11000249029660 (&vma->vm_lock->lock){++++}-{3:3}, at: lock_vma_under_rcu (include/linux/mm.h:676 mm/memory.c:5477) 
kern :warn : [  245.802662] #1: ffffffff85be7e00 (memcg_oom_lock#2){+.+.}-{0:0}, at: try_charge_memcg (mm/memcontrol.c:2242 mm/memcontrol.c:3175) 
kern :warn : [  245.814572] #2: ffffffff85b46ac8 (oom_lock){+.+.}-{3:3}, at: mem_cgroup_out_of_memory (mm/memcontrol.c:2005) 
kern  :warn  : [  245.826088]
stack backtrace:
kern  :warn  : [  245.834229] CPU: 1 PID: 4377 Comm: test_memcontrol Not tainted 6.6.47-01324-g0d35c4c63934 #1
kern  :warn  : [  245.845455] Call Trace:
kern  :warn  : [  245.849940]  <TASK>
kern :warn : [  245.854030] dump_stack_lvl (lib/dump_stack.c:108) 
kern :warn : [  245.859894] dump_stack (lib/dump_stack.c:115) 
kern :warn : [  245.865360] lockdep_rcu_suspicious (include/linux/context_tracking.h:153 kernel/locking/lockdep.c:6713) 
kern :warn : [  245.872211] mem_cgroup_account_oom_skip (include/linux/cgroup.h:444 mm/memcontrol.c:1069 mm/memcontrol.c:1368) 
kern :warn : [  245.879557] oom_evaluate_task (mm/oom_kill.c:372) 
kern :warn : [  245.885928] ? oom_badness (mm/oom_kill.c:313) 
kern :warn : [  245.891907] mem_cgroup_scan_tasks (mm/memcontrol.c:1482) 
kern :warn : [  245.898580] ? mem_cgroup_account_oom_skip (mm/memcontrol.c:1468) 
kern :warn : [  245.906133] ? lock_sync (kernel/locking/lockdep.c:5722) 
kern :warn : [  245.911942] ? trace_contention_end (include/trace/events/lock.h:122 include/trace/events/lock.h:122) 
kern :warn : [  245.918831] mem_cgroup_select_bad_process (mm/memcontrol.c:1515) 
kern :warn : [  245.926414] mem_cgroup_oom_select_bad_process (mm/memcontrol.c:1553) 
kern :warn : [  245.934290] out_of_memory (mm/oom_kill.c:1172) 
kern :warn : [  245.940308] ? oom_killer_disable (mm/oom_kill.c:1119) 
kern :warn : [  245.947020] mem_cgroup_out_of_memory (mm/memcontrol.c:2015) 
kern :warn : [  245.954124] ? mem_cgroup_margin (mm/memcontrol.c:1995) 
kern :warn : [  245.960748] ? __kasan_check_read (mm/kasan/shadow.c:32) 
kern :warn : [  245.967279] ? do_raw_spin_unlock (arch/x86/include/asm/atomic.h:23 include/linux/atomic/atomic-arch-fallback.h:444 include/linux/atomic/atomic-instrumented.h:33 include/asm-generic/qspinlock.h:57 kernel/locking/spinlock_debug.c:100 kernel/locking/spinlock_debug.c:140) 
kern :warn : [  245.973905] ? _raw_spin_unlock (arch/x86/include/asm/preempt.h:95 include/linux/spinlock_api_smp.h:143 kernel/locking/spinlock.c:186) 
kern :warn : [  245.980246] try_charge_memcg (mm/memcontrol.c:2248 mm/memcontrol.c:3175) 
kern :warn : [  245.986787] ? mem_cgroup_handle_over_high (mm/memcontrol.c:3060) 
kern :warn : [  245.994404] ? reacquire_held_locks (kernel/locking/lockdep.c:5405) 
kern :warn : [  246.001344] ? reacquire_held_locks (kernel/locking/lockdep.c:5405) 
kern :warn : [  246.008292] ? rcu_read_unlock (include/linux/rcupdate.h:344 (discriminator 9) include/linux/rcupdate.h:819 (discriminator 9)) 
kern :warn : [  246.014543] ? lock_release (kernel/locking/lockdep.c:467 kernel/locking/lockdep.c:5776) 
kern :warn : [  246.020717] charge_memcg (mm/memcontrol.c:8092) 
kern :warn : [  246.026588] __mem_cgroup_charge (include/linux/cgroup_refcnt.h:78 mm/memcontrol.c:8113) 
kern :warn : [  246.033060] do_anonymous_page (mm/memory.c:4140) 
kern :warn : [  246.039634] ? rcu_read_unlock (include/linux/rcupdate.h:344 (discriminator 9) include/linux/rcupdate.h:819 (discriminator 9)) 
kern :warn : [  246.045929] handle_pte_fault (mm/memory.c:3673 mm/memory.c:5004) 
kern :warn : [  246.052309] ? do_numa_page (mm/memory.c:4971) 
kern :warn : [  246.058689] __handle_mm_fault (mm/memory.c:5156) 
kern :warn : [  246.065175] ? __down_read_trylock (arch/x86/include/asm/atomic64_64.h:20 include/linux/atomic/atomic-arch-fallback.h:2602 include/linux/atomic/atomic-long.h:79 include/linux/atomic/atomic-instrumented.h:3196 kernel/locking/rwsem.c:176 kernel/locking/rwsem.c:181 kernel/locking/rwsem.c:1288) 
kern :warn : [  246.072058] ? copy_page_range (mm/memory.c:5067) 
kern :warn : [  246.078557] ? lock_mm_and_find_vma (mm/memory.c:5467) 
kern :warn : [  246.085551] handle_mm_fault (mm/memory.c:5321) 
kern :warn : [  246.091857] ? lockdep_hardirqs_on_prepare (kernel/locking/lockdep.c:4566) 
kern :warn : [  246.100232] do_user_addr_fault (arch/x86/mm/fault.c:1324) 
kern :warn : [  246.106857] exc_page_fault (arch/x86/include/asm/irqflags.h:26 arch/x86/include/asm/irqflags.h:67 arch/x86/include/asm/irqflags.h:127 arch/x86/mm/fault.c:1473 arch/x86/mm/fault.c:1521) 
kern :warn : [  246.112892] asm_exc_page_fault (arch/x86/include/asm/idtentry.h:570) 
kern  :warn  : [  246.119322] RIP: 0033:0x560d42a8c335
kern :warn : [ 246.125238] Code: 48 89 75 d0 48 8b 45 d0 48 89 45 f0 48 8b 45 f0 48 89 c7 e8 9d be ff ff 48 89 45 e8 48 8b 45 e8 48 89 45 f8 eb 0f 48 8b 45 f8 <c6> 00 00 48 81 45 f8 00 10 00 00 48 8b 55 e8 48 8b 45 f0 48 01 d0
All code
========
   0:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
   4:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   8:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
   c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  10:	48 89 c7             	mov    %rax,%rdi
  13:	e8 9d be ff ff       	call   0xffffffffffffbeb5
  18:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  1c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  20:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  24:	eb 0f                	jmp    0x35
  26:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  2a:*	c6 00 00             	movb   $0x0,(%rax)		<-- trapping instruction
  2d:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
  34:	00 
  35:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  39:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  3d:	48 01 d0             	add    %rdx,%rax

Code starting with the faulting instruction
===========================================
   0:	c6 00 00             	movb   $0x0,(%rax)
   3:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   a:	00 
   b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
   f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  13:	48 01 d0             	add    %rdx,%rax
kern  :warn  : [  246.148339] RSP: 002b:00007ffd6a0abda0 EFLAGS: 00010287
kern  :warn  : [  246.156206] RAX: 00007f5b70e58010 RBX: 00007ffd6a0acfd8 RCX: 00007f5b6de7e010
kern  :warn  : [  246.166245] RDX: 00007f5b6de7e010 RSI: 0000000006400000 RDI: 00007f5b6de7e010
kern  :warn  : [  246.176278] RBP: 00007ffd6a0abdd0 R08: 00000000ffffffff R09: 0000000000000000
kern  :warn  : [  246.186285] R10: 0000000000000022 R11: 0000000000000246 R12: 0000000000000000
kern  :warn  : [  246.196263] R13: 00007ffd6a0acfe8 R14: 0000560d42a8fdc8 R15: 00007f5b744a5020
kern  :warn  : [  246.206221]  </TASK>
kern  :warn  : [  246.210599] test_memcontrol invoked oom-killer: gfp_mask=0xcc0(GFP_KERNEL), order=0, oom_score_adj=0
kern  :warn  : [  246.222662] CPU: 1 PID: 4377 Comm: test_memcontrol Not tainted 6.6.47-01324-g0d35c4c63934 #1
kern  :warn  : [  246.234067] Call Trace:
kern  :warn  : [  246.238716]  <TASK>
kern :warn : [  246.242931] dump_stack_lvl (lib/dump_stack.c:108) 
kern :warn : [  246.248908] dump_stack (lib/dump_stack.c:115) 
kern :warn : [  246.254497] dump_header (mm/oom_kill.c:74 mm/oom_kill.c:476) 
kern :warn : [  246.260373] ? do_raw_spin_unlock (arch/x86/include/asm/atomic.h:23 include/linux/atomic/atomic-arch-fallback.h:444 include/linux/atomic/atomic-instrumented.h:33 include/asm-generic/qspinlock.h:57 kernel/locking/spinlock_debug.c:100 kernel/locking/spinlock_debug.c:140) 
kern :warn : [  246.267032] oom_kill_process (mm/oom_kill.c:1048) 
kern :warn : [  246.273399] out_of_memory (mm/oom_kill.c:1186 (discriminator 4)) 
kern :warn : [  246.279478] ? oom_killer_disable (mm/oom_kill.c:1119) 
kern :warn : [  246.286233] mem_cgroup_out_of_memory (mm/memcontrol.c:2015) 
kern :warn : [  246.293365] ? mem_cgroup_margin (mm/memcontrol.c:1995) 
kern :warn : [  246.300011] ? __kasan_check_read (mm/kasan/shadow.c:32) 
kern :warn : [  246.306547] ? do_raw_spin_unlock (arch/x86/include/asm/atomic.h:23 include/linux/atomic/atomic-arch-fallback.h:444 include/linux/atomic/atomic-instrumented.h:33 include/asm-generic/qspinlock.h:57 kernel/locking/spinlock_debug.c:100 kernel/locking/spinlock_debug.c:140) 
kern :warn : [  246.313190] ? _raw_spin_unlock (arch/x86/include/asm/preempt.h:95 include/linux/spinlock_api_smp.h:143 kernel/locking/spinlock.c:186) 
kern :warn : [  246.319539] try_charge_memcg (mm/memcontrol.c:2248 mm/memcontrol.c:3175) 
kern :warn : [  246.326087] ? mem_cgroup_handle_over_high (mm/memcontrol.c:3060) 
kern :warn : [  246.333692] ? reacquire_held_locks (kernel/locking/lockdep.c:5405) 
kern :warn : [  246.340601] ? reacquire_held_locks (kernel/locking/lockdep.c:5405) 
kern :warn : [  246.347500] ? rcu_read_unlock (include/linux/rcupdate.h:344 (discriminator 9) include/linux/rcupdate.h:819 (discriminator 9)) 
kern :warn : [  246.353693] ? lock_release (kernel/locking/lockdep.c:467 kernel/locking/lockdep.c:5776) 
kern :warn : [  246.359793] charge_memcg (mm/memcontrol.c:8092) 
kern :warn : [  246.365578] __mem_cgroup_charge (include/linux/cgroup_refcnt.h:78 mm/memcontrol.c:8113) 
kern :warn : [  246.371938] do_anonymous_page (mm/memory.c:4140) 
kern :warn : [  246.378400] ? rcu_read_unlock (include/linux/rcupdate.h:344 (discriminator 9) include/linux/rcupdate.h:819 (discriminator 9)) 
kern :warn : [  246.384579] handle_pte_fault (mm/memory.c:3673 mm/memory.c:5004) 
kern :warn : [  246.390852] ? do_numa_page (mm/memory.c:4971) 
kern :warn : [  246.397129] __handle_mm_fault (mm/memory.c:5156) 
kern :warn : [  246.403496] ? __down_read_trylock (arch/x86/include/asm/atomic64_64.h:20 include/linux/atomic/atomic-arch-fallback.h:2602 include/linux/atomic/atomic-long.h:79 include/linux/atomic/atomic-instrumented.h:3196 kernel/locking/rwsem.c:176 kernel/locking/rwsem.c:181 kernel/locking/rwsem.c:1288) 
kern :warn : [  246.410257] ? copy_page_range (mm/memory.c:5067) 
kern :warn : [  246.416634] ? lock_mm_and_find_vma (mm/memory.c:5467) 
kern :warn : [  246.423493] handle_mm_fault (mm/memory.c:5321) 
kern :warn : [  246.429664] ? lockdep_hardirqs_on_prepare (kernel/locking/lockdep.c:4566) 
kern :warn : [  246.437894] do_user_addr_fault (arch/x86/mm/fault.c:1324) 
kern :warn : [  246.444367] exc_page_fault (arch/x86/include/asm/irqflags.h:26 arch/x86/include/asm/irqflags.h:67 arch/x86/include/asm/irqflags.h:127 arch/x86/mm/fault.c:1473 arch/x86/mm/fault.c:1521) 
kern :warn : [  246.450243] asm_exc_page_fault (arch/x86/include/asm/idtentry.h:570) 
kern  :warn  : [  246.456506] RIP: 0033:0x560d42a8c335
kern :warn : [ 246.462273] Code: 48 89 75 d0 48 8b 45 d0 48 89 45 f0 48 8b 45 f0 48 89 c7 e8 9d be ff ff 48 89 45 e8 48 8b 45 e8 48 89 45 f8 eb 0f 48 8b 45 f8 <c6> 00 00 48 81 45 f8 00 10 00 00 48 8b 55 e8 48 8b 45 f0 48 01 d0
All code
========
   0:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
   4:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   8:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
   c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  10:	48 89 c7             	mov    %rax,%rdi
  13:	e8 9d be ff ff       	call   0xffffffffffffbeb5
  18:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  1c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  20:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  24:	eb 0f                	jmp    0x35
  26:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  2a:*	c6 00 00             	movb   $0x0,(%rax)		<-- trapping instruction
  2d:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
  34:	00 
  35:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241009/202410091610.3345ae6c-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

