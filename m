Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC3B2DB7A9
	for <oe-lkp@lists.linux.dev>; Thu, 11 Jun 2026 02:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781144381; cv=fail; b=PGUGlxw6zpML/6Yq0I00OHU01wz72tlUR1qkTM7hyabBYfuql2dY5HBHKwCkQ4I+yI9mh18qcFwRgFrnnvFC4X+LecroblISSxAbX45kbTpBL+/I1hHwnqvinWSbDYO1TPDQQuLBAjcf4ICIDBJUYix0W4hKhoD451AQbqSyTtk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781144381; c=relaxed/simple;
	bh=86o7lfAY4QpVqdwwY0WwfSYrsBL2PpNFM8gGiqo/F6U=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=IoJQaQDJYDLr5xDbdoj5f8ZL87BIaGMIaZXFGJ1kxJMYobBuJJiH7UUDsNHbX51YOtLLxX3LNOm8iTZcuWHA8u8JQqwmMi73gyX9gDpfM3wtQPctmXiKkri9jReOhRw961iO1+RoIBbpbFWewDVuPJFJrV3z7NuCTcyU59nxobQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H/pMm2sm; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H/pMm2sm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781144378; x=1812680378;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=86o7lfAY4QpVqdwwY0WwfSYrsBL2PpNFM8gGiqo/F6U=;
  b=H/pMm2smKK8M6gvYUZQOqi45f/y4du7AzmHfOp6YeXIS+FJ/lxipYuDJ
   WZn30sz9S/RPXGCO96uvoQ1PL3weUExL7Nw5p93wniNxKKkFiWqiqdxIh
   SVZa6MkskstbdFkrB+ETrhI4LS7Gg03HbxLMyqS79Br06HZD674d9nlIy
   Ko9CN13ME2VgGj1tRkLbVT5yQDyvY8FXp3NiJnraBMuG4e+Yk8dx6qk9L
   tOQUVEXRLMjyayINFqlwfao7nSh8JC/gtnyeVn6E+MXenniwQgHXGkp6Q
   mNGWwYeeXex9rfSGL8BOmxX0/HJJSRfLpaBL6e5M2a9ugnKZ1h0Bv997r
   Q==;
X-CSE-ConnectionGUID: VX1lqPg7RkWjp9HEpXS+0Q==
X-CSE-MsgGUID: whtxqobvS+uXr+sCEeTe2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93059812"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="93059812"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 19:19:38 -0700
X-CSE-ConnectionGUID: DsA3g+t6S1SL7Whx+Bxf5A==
X-CSE-MsgGUID: wRdPGCBERBGJYzsVef4QaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="270360727"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 19:19:38 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 19:19:37 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 10 Jun 2026 19:19:37 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.2) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 19:19:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EA1XrK+WdBEAfD8vIC+VsQw/IGpQ2ndYz5WkpUXbOYwOuRXW1lcac/2kXz3tUo0h8DKtdujU2OEfAWBHdvk89SziVD+MFQx0kRU4AiUWgUhAlO52+YH1Y8fQ7rkPURvAcnr6tjWQjv5sIEgf/1oUbiBav3x4en1fsrIVDh7menPliljVn6Y7MAP24ECLDdPLKvnPu2sqJJQyZ6VWGgrsYw6QxTk4xeliVcSip/2inqsSU3cK9YVy8WOWseVjlXaLdPAuDWCtpeklm80i8wYUvt0ZTAJQbC8OOj/KIXd15xG4ree5yG0NxF6r1wgmpVRv8UFPB1x03CPikZfBoR9J5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/A1XIvq8W0zreNH1Fg6OiWcjn5Ae5bBF07NDAGsFts8=;
 b=iUXbD/rd2gMcphAv6aGht3C0dPH9thLG90EDG6iKQsHMSnp/MqVVEiYnLFJI3X0N87WIzezFKLxLctzNABwpl9lsJtGFFoI70tzxO4kRUeAeN1RMK5S6HWqLVklZ99PJXBe+IgvOGTqDe+6ZrcXYa/XjVxeOS0yw0xyLjbVmoQFYMAAgT7yxAdeL64PL3Vr+jYkCTJTjg269IIhIKVDbYlNTbU1tT990uWi133cRGFFcfsM8tBEzl31Ok1C0c0y3ZT3hTTOhHxEPq8RJAu653RX38sgsFUNk+BX1GvAHKzWepDqTv86CGI6VCvf+X9yBMCmzfAkIytF/Hy2BWhJaOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by CO1PR11MB5124.namprd11.prod.outlook.com (2603:10b6:303:92::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Thu, 11 Jun
 2026 02:19:29 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%5]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 02:19:29 +0000
Date: Thu, 11 Jun 2026 10:19:20 +0800
From: kernel test robot <oliver.sang@intel.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Andrea Righi
	<arighi@nvidia.com>, <aubrey.li@linux.intel.com>, <yu.c.chen@intel.com>,
	<oliver.sang@intel.com>
Subject: [tip:sched/core] [sched/topology]  9e005ed211:
 stress-ng.kill.ops_per_sec 4.6% regression
Message-ID: <202606111053.c484a580-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: SG2P153CA0031.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::18)
 To PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|CO1PR11MB5124:EE_
X-MS-Office365-Filtering-Correlation-Id: da3e225b-659c-40a4-d04e-08dec75fddb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|18002099003|6133799003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: VJx6nd8taiDP+5vVvfE/hIClV70CjLqJm3gJCniRGMzsu7aoBHFdkBOnNEL8Mki9ZDWR7D70D1wy0ycnVN37/MdwT3kCGuKTYuFG5WUPjju1I4eiYz/FYbT8BIJGshQKD3v4b9Mo6ZCe+Qiu1FT090MzdyMtjueS2WkF28XZdJToTfI0+dTkqpctUdAfhCfftoMDovrryLvDU5XEXF47vlhYV7i3ARD6hLUMTjM/8UVlebTCRnvKeGFUa9ycnqTV7Z2KzfxMkv4iofVdzH3ppeQZWNLtheBu8pb+QOoKW14QqzEGii/8mNSHYKOx9vh9QnKD8jDjRbWbxw9aQi9jrZRmGIUuQbWnujFDKHNnMXwwxA0q17l+YXRYFxZkhxKHLq6aYXMzQJECOvpsOU2ygD4RtjqW6fg9HTAtZF4XrvDCJ6Olfxy8sHFyft9WVzi4eSneIOYH8/BYlMculAZWsqxkcAobXOYaM1mMK28skHgS8g6EoNpkHZQ+Hb1pr3WmGHNXPJIbH4R0TsKIn36PD0MfhnckdxKDXDYWjesOjRowxRWKGjgM/z3mCCZ6NPnVP0WrD61pNY+yJMtip9ca2YcxG4COhjG0EgcmLzMTHigJKK9uNtUStOJahvNr1A4CiaShn9RAmjgiLTrXWNzVpQDQUwD2nvCKcQWPnUBmq8wvHXejFfAQCxynqVI84dpc
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(18002099003)(6133799003)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?R8tBZfj3cUzzWXlZFJF3HBNPqu2hWmG25HI2AvlNZ1pcVRcwFQ8uBniv83?=
 =?iso-8859-1?Q?VpnF4TGH8QRLxCVgh2yfJ+tlRXoKQ4yTlxtceMQuJ4mLnzujD9MGzZgT9+?=
 =?iso-8859-1?Q?RKoBmdjMvujynEzanYkV6IyQP+0np0djzT7MKeAJG50awZ20oM1LoyYsHg?=
 =?iso-8859-1?Q?KvAzpJkBRTE8qfWeS93vlf9b1z8RDDVwfpwfiJPDdiT6eOiUeG0bmnND9H?=
 =?iso-8859-1?Q?FvnAS6wFwk2shQ2UX4rUHNdl84doOpZ48ZPZaQn31QO7h1pVCF24ESJu7J?=
 =?iso-8859-1?Q?XMqmZTxaeePZzfMqIDL6X7bPvHrWqT40yVaI1+9mPTjVQ8N9f2gAB3aCSs?=
 =?iso-8859-1?Q?sK/1P46Ntnj9x/N6TBCPX7I67B5QJ/ADhX6gz9Dbf4CFpfJAuC6Q71VRQ9?=
 =?iso-8859-1?Q?Zgmv3uBciWRITBq+nX/8CfxQznZjyUJJx9pU4dPfY2B7kte3m2aizCHlJJ?=
 =?iso-8859-1?Q?0RJXTCZsJY7AKIBqsKuniYDHaCYop+JKwjpZubStpq3aiEmixaamkZX+bk?=
 =?iso-8859-1?Q?NpKc4jfdazzC4lGoWw1Ijvr7zVOOez0ycrRhLkCkB1HQZib5YJ5+IjErP2?=
 =?iso-8859-1?Q?CWcyGB3lrQHDz5DSuOFmMRyK8Xp1vuN5jcDpTFG7KIrLXZmdQ9PnwTZdgN?=
 =?iso-8859-1?Q?JNvGr9uf9cKKrhsZrAVU/pXII55JSfEkT1FndrretezyhCRXiCG/9tW3yW?=
 =?iso-8859-1?Q?Tk0N9tS6Uua6M71DAHN1mSU+MkcVPeP6R31HJJgm1hEtJJxZv/FJ8Jinbu?=
 =?iso-8859-1?Q?2H5nLj0CNvDIuboplSGvXfSOjmZcNxKC3YITVClhyt3dDEjln/DjD3EWpe?=
 =?iso-8859-1?Q?iI9mPNsF4lf+QNMAevfjeeQ35TT8OYo8n4ntz/spOnTMoLY1dc8XyLBrNM?=
 =?iso-8859-1?Q?/NeqUwIT4/wT7Vw37fPTogeL3OIavAonq5QvzuPs3IYLAeMuPdhHACYjJY?=
 =?iso-8859-1?Q?DgiOAA5HC+OjozZHIAFWZraDKoyb/4mHvVWlBjP5hiG4iuVyXhGC/5lO2D?=
 =?iso-8859-1?Q?ML6PVNojQaH5IBc9nFKmChKCEJ1Ma5X7OjT1z2ruz1AdTcL88L2lzEo/s9?=
 =?iso-8859-1?Q?AjU7SGxwLAspekxn1koxzcfCLuc9VPgvDM9Y7hWw4O7119Uu64cPwdoKyO?=
 =?iso-8859-1?Q?a5ixe34y6e4oZsy7SHJ2CZQXhVKvjkiHBAC2IkfORC0d3DXW99MtmZfp0E?=
 =?iso-8859-1?Q?iEZHpxSxX5KN8f58HW23maCmzFZwasykUgAT0Dm/9IdqLadvZyKlinPUx6?=
 =?iso-8859-1?Q?1grjxH3DQPlPLp5AuNjSm6euogz66vmWw1AJLtUWoWGnDn8J6pCTeYRJDW?=
 =?iso-8859-1?Q?Z4bD+wyxdiJV+gIw95culAcKO1laP1b+b5mAJCa1hREvM6iV+DqKYZ1KM7?=
 =?iso-8859-1?Q?h11gE8qqvDvi1iM2Q6xBfruR3zn68zD5oW3N6XrYVGafV4nQ3WyJfNrvww?=
 =?iso-8859-1?Q?fgkwJQFAkQa6hlAby5wzbHl7TCLwvngn9PMA0bP3FuDfby/5szb/riBEOT?=
 =?iso-8859-1?Q?z5glPMLrv+QPmBfPULJRk/9UtleKQu6uW1ZWcRsFQUmCLJ6pJEm5Pr0Cc5?=
 =?iso-8859-1?Q?T6QiW9NivevyGMjgGb4HpwupIZkCqMxl7O2nV0HGyghOBvnk3XmMhSagDO?=
 =?iso-8859-1?Q?Rvpbj8nabNUpeqrcUiS99MMCqtLqlWsyi8gJL2k/AxIPun0qWL6C3UN7Al?=
 =?iso-8859-1?Q?aMsjpZmrA7+PxFigS3oW++UXy/n41vzkEI0QVZHsiN5IXF1t8arIhNHoC2?=
 =?iso-8859-1?Q?W8oOC/s+1uU/ox/XUvQJfddzI9A34JnqggVzPwNYZAPvsgbYbev4oyPuGF?=
 =?iso-8859-1?Q?qeOCj5Ci3g=3D=3D?=
X-Exchange-RoutingPolicyChecked: lQ9BiWIFBHHvWYybOLmyvyfWJWkDRmZ4xrZDfJjhEp9I2UVL0BYCV+VCW1n8ngcXb2fH7d3e5jQ9NOhQoaY+yQw4gRp8TleMAELFYlC47i7eV66JldZlyTqcsmI/age7p3ZnlFf0LV4H51KR1ZZbHkJE9T3XoXkGbgFHJgcsTlzkFt7PYJr+Cxi2mieIantk20mHylznVd+RzsgLND7d13Pw/V6xuLgQCXwmlF4QpRAHR/4YRGXrwe7LRECP5jp3LmHcZcfFCEKJJ35bpN3yZr30CUHPU8qcwvaWumbamTgydR3wsB/WQY3ll058eASZIdFoyArbLEzKL+BhdNn7Qg==
X-MS-Exchange-CrossTenant-Network-Message-Id: da3e225b-659c-40a4-d04e-08dec75fddb0
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 02:19:29.0100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OFatZGKjxN30V+KyWmfToMeq88S5JybSiya3Kks870c0HNsNXCN/bUTEO2WIrE66Cef95SiJ7pLiZc3daY6bSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5124
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 4.6% regression of stress-ng.kill.ops_per_sec on:


commit: 9e005ed21152d4a4bb0ceea71045ff8a642a6feb ("sched/topology: Allow multiple domains to claim sched_domain_shared")
https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git sched/core


testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 256 threads 4 sockets INTEL(R) XEON(R) PLATINUM 8592+ (Emerald Rapids) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: kill
	cpufreq_governor: performance


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202606111053.c484a580-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260611/202606111053.c484a580-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-emr-2sp1/kill/stress-ng/60s

commit: 
  a26d9208c1 ("Merge branch 'sched/cache'")
  9e005ed211 ("sched/topology: Allow multiple domains to claim sched_domain_shared")

a26d9208c1376ac3 9e005ed21152d4a4bb0ceea7104 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     16542            -5.6%      15623        stress-ng.kill.kill_calls_per_sec
  66940342            -4.6%   63830711        stress-ng.kill.ops
   1116630            -4.6%    1064849        stress-ng.kill.ops_per_sec
     50279            +5.7%      53164        meminfo.KernelStack
     14019 ± 46%     -48.8%       7174 ± 70%  numa-vmstat.node2.nr_slab_reclaimable
     10643 ± 21%     +49.0%      15853 ± 19%  numa-vmstat.node3.nr_slab_reclaimable
     50278            +5.7%      53144        proc-vmstat.nr_kernel_stack
     74611            +1.0%      75344        proc-vmstat.nr_vmalloc
    613641            +5.5%     647439 ±  3%  proc-vmstat.pgfree
     56078 ± 46%     -48.8%      28697 ± 70%  numa-meminfo.node2.KReclaimable
     56078 ± 46%     -48.8%      28697 ± 70%  numa-meminfo.node2.SReclaimable
     42574 ± 21%     +49.1%      63467 ± 19%  numa-meminfo.node3.KReclaimable
     42574 ± 21%     +49.1%      63467 ± 19%  numa-meminfo.node3.SReclaimable
      0.03 ± 55%     -64.7%       0.01 ± 99%  sched_debug.cfs_rq:/.spread.avg
      0.26 ± 27%     -55.0%       0.12 ± 84%  sched_debug.cfs_rq:/.spread.stddev
      4715 ± 14%     -28.3%       3380 ± 44%  sched_debug.cpu.curr->pid.min
      0.32 ±  3%      -8.3%       0.30 ±  3%  sched_debug.cpu.nr_running.stddev
     22.17 ± 31%    +128.9%      50.75 ± 12%  sched_debug.cpu.nr_uninterruptible.max
      3.99 ± 14%     +55.6%       6.20 ±  4%  sched_debug.cpu.nr_uninterruptible.stddev




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

