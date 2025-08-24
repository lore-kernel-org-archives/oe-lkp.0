Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4922D8788
	for <oe-lkp@lists.linux.dev>; Sun, 24 Aug 2025 12:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756039062; cv=fail; b=JjKgmrTXC1CsetDO3EtttW1QTTqtQyr7ZMK3fNEGaLV7aSLtCza13ldw9XWh6kQVYQ7zaB4ESUqiuagoghyY9s2PjGkmVZlUn4dpCypniGVGTkoXr86zUCXIDVUJV94HIFYFDmqN+ZGwaLZTqdTxyXIa6IrEeogNpesAwexGwtI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756039062; c=relaxed/simple;
	bh=qnRiLk6muMEPpLw/KyHuBfkzvH2escXI454ub8zYVDw=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=OXyg6bNP9XtGxMiIJoGVGsI12tpfOU6gAe+MEVpjatTczmBx/Ys5PLBkis3I6Lus5S3kaH305L5LgWXHWLaEtBRVMO1UzGoyUg9ZX/M4BH0mtO//KfZIm4aKNQs8I26lLD6qGyZs5EubgHiLTWq7Yi1DbX1tRGSvvkz39djuVZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RbMt1Xnd; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RbMt1Xnd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756039060; x=1787575060;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qnRiLk6muMEPpLw/KyHuBfkzvH2escXI454ub8zYVDw=;
  b=RbMt1XndGtDEe7gbNW51oge87hMMUwPfJpokiy82wkVXi0uW/3fY6R3G
   EugQ6iMfOU6EaFL/e3SCE+0D8KVK7pkFlE3VxZ2Fv8n9cgocwcBMFOzry
   W9cfBxDEJSsoibFj/6C3YvxGVRMe0O6MfSas9MUycUPwS5JhMk+Bmy2nk
   NRiBsE+R63stdYXl7YQNWD5jyvuJO724QinmwHEPB3kB1LNXEAYY92cVK
   X+aQ88voeJFzELwimiWOjWxs1cWHJ8PRvZjXooYivpMb2OXbDyzvF2NRm
   hs+bU29h1O6CU4zXKGkZJiLpaZqyF+5GLYSjVbZahwLhOBRVDpob705C/
   Q==;
X-CSE-ConnectionGUID: s8WZ9zQ5T5283p0tQ93nPw==
X-CSE-MsgGUID: I9G7Tyc2RaqGc2OOWGikSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="69645326"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="69645326"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2025 05:37:39 -0700
X-CSE-ConnectionGUID: i5ym7JyGTR69+kUI8imDsA==
X-CSE-MsgGUID: JBI+KHCVTFqRearQ5RUfsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="200019322"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2025 05:37:38 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 24 Aug 2025 05:37:37 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Sun, 24 Aug 2025 05:37:37 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.46)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 24 Aug 2025 05:37:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pFH7Z9fVCBVTMv2Lzz833DGlsCQgDA6yj59R+XiDONX7j0rFTw2JMbmt2gvZPvNoH4RoEUwuUECJnI084Z58G7KldrAVFBAiDjQtCue9wxcXXqk2YGF8imBHDVURJjloTjKMgNAonDw6b+x5k30hOPxdtkt5c1qPCWghKa6wAUp9Egy8Qx+5dOEdHCG4RsJb3uCeWU8KO6RrDK0AhwEd2C/oYk26Y7n6hUiUo3BytRWtXKs7fzjE6jI06KewHDN5DaUVdx55PmByttBYKFSpEn2Z4KztPPYPGNIqmx1DlE4fjpmAM8PdtgnbfmC9iHPPuC3hsmKUm57LV36BjGB9Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bArtNssRHoX6yjMHKpPBLFI6rhp8NplLZpXo+RhMGWQ=;
 b=qmWqZdyQhai5Vde8YHPPj22ye6u9cr0jmlyxa9AyP0udT2SY9lgh0e11y3HNxb3U11rXHBDtYkOuOE4sZgCfOhdNjZ67PuBkmmnVl/nKWRoUv2WxiMOFZhUcGMJp0p4NGWCzpymxwAhb/z8fYIUnJjvNODf7Cup3M49UVy1L7kZX7TPgu1b8YT8ga7fIEfMDiVH/UH97oBEutiuIp03VywO3BspZTE9QROe83mP1PxThAOAB75qk+ryUbU+oI37hMd7jfrvS73W2Qf6KgHPAFnf+uZ2rP8FsvBk9UAdDwr1WjcWj7KegH2gZw8XeFhJDi6z13tPpEihhiisq7c2ctQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH8PR11MB6756.namprd11.prod.outlook.com (2603:10b6:510:1cb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Sun, 24 Aug
 2025 12:37:35 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9052.019; Sun, 24 Aug 2025
 12:37:35 +0000
Date: Sun, 24 Aug 2025 20:37:27 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Roman Gushchin
	<roman.gushchin@linux.dev>, <oliver.sang@intel.com>
Subject: [rgushchin:bpfoom.1.6] [mm]  2bdadc8e5c: WARNING:suspicious_RCU_usage
Message-ID: <202508242042.e9d8711f-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR02CA0060.apcprd02.prod.outlook.com
 (2603:1096:4:54::24) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH8PR11MB6756:EE_
X-MS-Office365-Filtering-Correlation-Id: 1551ccd9-3a5e-4877-a0d5-08dde30b00e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GwELIV34dp5CrnkIcaqCMeJRiItwKRPd5QDyjKP/tBh0FRT8yHFaG+xxFEft?=
 =?us-ascii?Q?s2L2y3Cz7LRECu4fg7omnSDZziS5IEvX2Ee0EQtoYuAXLWrmnwCU0uGIzvNw?=
 =?us-ascii?Q?kYip13KmjFgcm6UmVCq+EQYVANGIVU9zMsJwb76vt1cpsVPJWoDrd8pvhMdf?=
 =?us-ascii?Q?zMTR2d0rAwv/TrVwmyHqgN9NABtTibbwmfac/6Ax55JbmsbkkIDfaUIc+RtU?=
 =?us-ascii?Q?yHaYG/JOl2+8LcpMFhSgg5Q5nqdlYujmoTpVcx7LlZueZWWEYEsUsLQgkTtn?=
 =?us-ascii?Q?k49T/xC7WN2gWL7md0747vJRa7k6kyfXnk2Xo4YK8PieYy1C1q6F92UTZPQH?=
 =?us-ascii?Q?r3iGIF6W6Hz2qzwp/ppSK8lFwCUXVRAmLgr12/xXR8oveIqVLYcUrI1NzFeq?=
 =?us-ascii?Q?bSl9AvUSK+ZEp9xtwr+GEET4aBMgPqB7IbxA1nVqAle1tPFYThqKj/9533G9?=
 =?us-ascii?Q?SYAhkAchx9ew4Wp0X8mXG5y5BTy4Am2C/guGwBW0YdBF6zE8GxmyCSPzyJQS?=
 =?us-ascii?Q?K0sItrxfLBv3Y+p5bPrZUiTWkXvZoEy6M7RII+/r515rNkG/r3rArgWVmyb2?=
 =?us-ascii?Q?vodHmFOn/tCBe6TLPJJcVp+NRsUEKZiYSmxTj6sNyld3wTULyRdFIrD9JZms?=
 =?us-ascii?Q?24feAu9aaIW9USaDwiTkyJWxcE8QXvEzV80YHt8+NDWKqkN35Fkil7aSOqzq?=
 =?us-ascii?Q?dPVMD32hqrp7QMbOc5u+et31m4D0w73HJYNGtpySdAFu53iznghu0WJnnjxh?=
 =?us-ascii?Q?fcs7YTFF3279tL773ay0gIOJkW27jsIfvW3ZfVAKZvevCfWK0rROrFiR30if?=
 =?us-ascii?Q?7ysiamj8fDJwUpDmXnYmt6DW/gNyK24sKoQ/o1PBq5DuKe87oPT/p5Bpkp0U?=
 =?us-ascii?Q?5m7tXrgocCHM3rIgj/qaHpdag6ryjAvLRrzV57t1QUEZ2ue5B0Ga8u5n/YOx?=
 =?us-ascii?Q?ZhT7WcOH/fTU9jad74i3ydqpMF6ohl15yNcdud4rHxW3PXfTSSG7k3gq5DVH?=
 =?us-ascii?Q?6fpw8rhdaQFZ6gJQjiBsecgzzvtUDa8wIpmXbW13bD+IbQJZidIY+IKerICF?=
 =?us-ascii?Q?8gEBr8qCxBfjBVH1KtirPdYktuMDpzE4844kxJmHWxdpCtEVdoa0I1VUJVhv?=
 =?us-ascii?Q?TeQXA9X9V/mpVK8DhIsNoHvsDQHoOM5liwzrBh2/dSD51igbtrC0nPz4BzMQ?=
 =?us-ascii?Q?5HiGKZXC9NnOhg29jm5lninyGP6e72u7X0c3RGK1KQnxmg9Ic51zwUN532ml?=
 =?us-ascii?Q?sUwmzshoEMT698/KUgYm9//0DBQ8BYc8Ky+ZiEqFZLdB9ZVrmYakvCaOGnoM?=
 =?us-ascii?Q?7uKvEKlVAZzrfuBTJuDDZFfaGPqvFGwnIrdxsKmkdroGy9Qx7HU34T9tL6Y7?=
 =?us-ascii?Q?pG/s9sOnEMyqrsD0t8takW083Ahz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J3v+oj2Y93pNWMFnwWnd6w/ek0oyvMyvbFkFiy28LzUKLJELBidneT9N951H?=
 =?us-ascii?Q?hrgWI/s7ehq1yZC10wWN7mDv/FhCi+LcbkEJupGYxbkF8wBB77IKoFfONWt3?=
 =?us-ascii?Q?j0okzlbio9PE2oDrFcX1+r8ApgxtoQPTtYCoRlSQJLL1E1ml7/20Sr0Iqt9o?=
 =?us-ascii?Q?ZL5UockK/rm/LYsQ7YZ1+BVla+pEiZPeZKop8hpmhgjAoJ+zxs+AG2ZGXs9E?=
 =?us-ascii?Q?dHxK1nOh8R3qxL1cFEQwfj+1CLZwZqEcLY8duwmJ9slKEpn2ePFwDROF5gjE?=
 =?us-ascii?Q?NPm6AQswwuNgW1U1bAYqAoHtJFBE6AZl8PAX2cJFoZHFop7dRQ604Qp/kVrQ?=
 =?us-ascii?Q?hZ8mdQ7wxOt8a1V5Lml7I+1/FqezBUgcVb4s53mQ8tkTYfyUjBUYgI4LUKDY?=
 =?us-ascii?Q?xMkvtwyGt8uJcOlTIWdb4vDJjoUnEQqtwta17TqH7/kJrGge2ZXGsFRn1uTY?=
 =?us-ascii?Q?q8JgpR15HzwIbo66KBdlTFUhYOrOKt4BlQee8OqYqn2O2LDsy8VyHAClEKH9?=
 =?us-ascii?Q?hFnhbUR0bs3WpIryIm+FhtY5AxgPe0PPMEcCW2Vf0rh0DEnCK1KH1c40r9ek?=
 =?us-ascii?Q?BOWqUGaMwjFZoTY/OtHfmFGpOUOV9IZSb/fqyfdFYh+oB5YYYnnCSYEHWvYm?=
 =?us-ascii?Q?CV6uFVvcXi6pGXcXFiIchOHg7ADd66awqHLITww/yW6Sq6ckn+y5fJXGaHdQ?=
 =?us-ascii?Q?HtMPLk/xtoOuix+U3Kqje+EIfozefc8AYrE9OqE4pEejMOcZfLVPFpSu5Hed?=
 =?us-ascii?Q?9nh9KFbonD0IMBnO6tfF5nlWbeadJ4Lg4F2+7IM8R9mOpgJsI4tBsTF0k1k0?=
 =?us-ascii?Q?rSCotkVbXweTYg3XacLdg2Up/AXGqUVmuAVEADKvHxuXb2zCjUQlSQ15nlQ4?=
 =?us-ascii?Q?cjVSLnrplo3z12JvYxdl+bhS63IM1aMLkVbGuKZRCD47A3el48OXdPUDkiKE?=
 =?us-ascii?Q?QH2bUaFAmCePIQ+AjJH9VhBq9sTD16m1F4mlCQE46HNvbOEs/6hdQDqzFECt?=
 =?us-ascii?Q?cjezG3eF12ocQwVJoxqzyBIdoJxgrXMzyEAWk4wjnxqSooZvvl+be1MGI/qr?=
 =?us-ascii?Q?rKpvTZuM9zBHkkIp94Mmt/Mi/JO4uMEVZgmM3Nw7v53OyT2A8d42ghmNegb7?=
 =?us-ascii?Q?wO/Ok8dTmwJWJeRLEtn1w/Dx+ZBWHFwQQObZ7YdFTnDwihF2rU1uiajF344U?=
 =?us-ascii?Q?MG6RGk3eKkjSx2jsnEpPH31QNR5MxC2f8FXGsU+uPPv+YB5vv3udKY8DrZCj?=
 =?us-ascii?Q?z22jlvROBaJC916anXKJMT/TNWDmjY9T2cYlx4Vue2K0GwK08MkuErO4mISS?=
 =?us-ascii?Q?egRXclX1SXaUI65bmK8hRnZNSWMOIp+tdGknC7TfhOh1ioRs03BawGoi3HHY?=
 =?us-ascii?Q?MXjYXkbto5zMElwTghTkDx7Du7RkCM8Mk6vNZAyEp5gJtfoIYc9m/jgRef+T?=
 =?us-ascii?Q?o34RB4bZmNL9bSkCT+UnWppxVhEyMDxVO2CNKqLAlLNtFx0KzproN3wtDqYL?=
 =?us-ascii?Q?idhvlb+tCgtzWCKAURBZJVmfvsvzrUozaLStyk3JMVN2ADK0AlJT1xJUvRnM?=
 =?us-ascii?Q?r0tXAd+3rqVJ9E0ZDbNTAhZ2dVpCw8scOSgvVY9V?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1551ccd9-3a5e-4877-a0d5-08dde30b00e6
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2025 12:37:35.7428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3uNZbPOTP8xjVI5hu85Q3BNlHHJD9qLGA/0TM6FBOBszAY/ZkQGpWLskBfFTYdlmpeHS86V9gCOtrvIv5ctUdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6756
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:suspicious_RCU_usage" on:

commit: 2bdadc8e5ce6f6b23d63d28cfacb0882852401f9 ("mm: introduce a bpf hook for OOM handling")
https://github.com/rgushchin/linux.git bpfoom.1.6

in testcase: trinity
version: trinity-i386-abe9de86-1_20230429
with following parameters:

	runtime: 600s



config: x86_64-randconfig-101-20250522
compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202508242042.e9d8711f-lkp@intel.com


[  496.402237][T17289] WARNING: suspicious RCU usage
[  496.402834][T17289] 6.16.0-00002-g2bdadc8e5ce6 #1 Tainted: G                T
[  496.405807][T17289] -----------------------------
[  496.406337][T17289] mm/bpf_oom.c:32 RCU-list traversed without holding the required lock!!
[  496.407272][T17289]
[  496.407272][T17289] other info that might help us debug this:
[  496.407272][T17289]
[  496.411009][T17289]
[  496.411009][T17289] rcu_scheduler_active = 2, debug_locks = 1
[  496.411886][T17289] 4 locks held by trinity-c2/17289:
[496.414256][T17289] #0: ffff88839840ae30 (&type->i_mutex_dir_key#3){++++}-{4:4}, at: lookup_slow (fs/namei.c:1834) 
[496.415329][T17289] #1: ffff888100238188 (&root->kernfs_rwsem){++++}-{4:4}, at: kernfs_iop_lookup (include/linux/kernfs.h:399 fs/kernfs/dir.c:1223) 
[496.418735][T17289] #2: ffffffff9ecc1c08 (oom_lock){+.+.}-{4:4}, at: __alloc_pages_may_oom (mm/page_alloc.c:3785) 
[496.419781][T17289] #3: ffffffff9ed2ba70 (bpf_oom_srcu){.+.+}-{0:0}, at: srcu_read_lock (include/linux/srcu.h:161 include/linux/srcu.h:253) 
[  496.422883][T17289]
[  496.422883][T17289] stack backtrace:
[  496.423421][T17289] CPU: 1 UID: 65534 PID: 17289 Comm: trinity-c2 Tainted: G                T   6.16.0-00002-g2bdadc8e5ce6 #1 VOLUNTARY
[  496.423435][T17289] Tainted: [T]=RANDSTRUCT
[  496.423439][T17289] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[  496.423444][T17289] Call Trace:
[  496.423449][T17289]  <TASK>
[496.423457][T17289] dump_stack_lvl (lib/dump_stack.c:123) 
[496.423475][T17289] dump_stack (lib/dump_stack.c:130) 
[496.423485][T17289] lockdep_rcu_suspicious (kernel/locking/lockdep.c:6872) 
[496.423506][T17289] bpf_handle_oom (mm/bpf_oom.c:32 (discriminator 11)) 
[496.423519][T17289] ? constrained_alloc (arch/x86/include/asm/atomic64_64.h:15 include/linux/atomic/atomic-arch-fallback.h:2583 include/linux/atomic/atomic-long.h:38 include/linux/atomic/atomic-instrumented.h:3189 include/linux/mm.h:52 mm/oom_kill.c:276) 
[496.423540][T17289] out_of_memory (mm/oom_kill.c:1179) 
[496.423557][T17289] ? oom_killer_disable (mm/oom_kill.c:1124) 
[496.423582][T17289] __alloc_pages_may_oom (mm/page_alloc.c:3837) 
[496.423599][T17289] ? __alloc_pages_cpuset_fallback (mm/page_alloc.c:3769) 
[496.423641][T17289] __alloc_pages_slowpath+0x760/0x87a 
[496.423668][T17289] ? warn_alloc (mm/page_alloc.c:4407) 
[496.423697][T17289] __alloc_frozen_pages_noprof (mm/page_alloc.c:4972) 
[496.423710][T17289] ? __alloc_pages_slowpath+0x87a/0x87a 
[496.423737][T17289] ? policy_nodemask (include/linux/nodemask.h:253 mm/mempolicy.c:2206) 
[496.423753][T17289] alloc_pages_mpol (mm/mempolicy.c:2421) 
[496.423760][T17289] ? lock_acquire (include/trace/events/lock.h:24 kernel/locking/lockdep.c:5834) 
[496.423773][T17289] ? policy_nodemask (mm/mempolicy.c:2376) 
[496.423796][T17289] alloc_frozen_pages_noprof (mm/mempolicy.c:2492) 
[496.423807][T17289] alloc_slab_page (mm/slub.c:2451) 
[496.423818][T17289] allocate_slab (mm/slub.c:2627) 
[496.423835][T17289] new_slab (mm/slub.c:2675 (discriminator 9)) 
[496.423846][T17289] ___slab_alloc (mm/slub.c:3859) 
[496.423859][T17289] ? alloc_inode (fs/inode.c:348) 
[496.423884][T17289] ? alloc_inode (fs/inode.c:348) 
[496.423893][T17289] ? __might_sleep (kernel/sched/core.c:8730 (discriminator 17)) 
[496.423911][T17289] ? alloc_inode (fs/inode.c:348) 
[496.423920][T17289] __slab_alloc+0x1e/0x39 
[496.423929][T17289] kmem_cache_alloc_lru_noprof (mm/slub.c:4088 mm/slub.c:4187 mm/slub.c:4216) 
[496.423949][T17289] alloc_inode (fs/inode.c:348) 
[496.423963][T17289] iget_locked (fs/inode.c:1439) 
[496.423980][T17289] kernfs_get_inode (fs/kernfs/inode.c:251) 
[496.423997][T17289] kernfs_iop_lookup (fs/kernfs/dir.c:1236) 
[496.424014][T17289] __lookup_slow (fs/namei.c:1817) 
[496.424029][T17289] ? lookup_dcache (fs/namei.c:1793) 
[496.424078][T17289] ? rwsem_down_read_slowpath (kernel/locking/rwsem.c:1522) 
[496.424103][T17289] lookup_slow (include/linux/fs.h:894 fs/namei.c:1835) 
[496.424119][T17289] walk_component (fs/namei.c:2138) 
[496.424135][T17289] path_lookupat (fs/namei.c:2639 fs/namei.c:2663) 
[496.424153][T17289] filename_lookup (fs/namei.c:2693) 
[496.424159][T17289] ? __might_fault (mm/memory.c:6971 mm/memory.c:6965) 
[496.424173][T17289] ? may_linkat (fs/namei.c:2686) 
[496.424234][T17289] ? __kasan_check_write (mm/kasan/shadow.c:38) 
[496.424247][T17289] ? getname_flags (arch/x86/include/asm/atomic.h:28 include/linux/atomic/atomic-arch-fallback.h:503 include/linux/atomic/atomic-instrumented.h:68 fs/namei.c:132 fs/namei.c:213) 
[496.424265][T17289] user_path_at (fs/namei.c:3138) 
[496.424279][T17289] do_fchownat (fs/open.c:815) 
[496.424294][T17289] ? chown_common (fs/open.c:803) 
[496.424318][T17289] __do_sys_lchown16 (kernel/uid16.c:31 (discriminator 8)) 
[496.424327][T17289] __ia32_sys_lchown16 (kernel/uid16.c:28) 
[496.424340][T17289] ia32_sys_call (kbuild/obj/consumer/x86_64-randconfig-101-20250522/./arch/x86/include/generated/asm/syscalls_32.h:17) 
[496.424352][T17289] __do_fast_syscall_32 (arch/x86/entry/syscall_32.c:83 arch/x86/entry/syscall_32.c:306) 
[496.424368][T17289] do_fast_syscall_32 (arch/x86/entry/syscall_32.c:331) 
[496.424380][T17289] do_SYSENTER_32 (arch/x86/entry/syscall_32.c:370) 
[496.424390][T17289] entry_SYSENTER_compat_after_hwframe (arch/x86/entry/entry_64_compat.S:127) 
[  496.424399][T17289] RIP: 0023:0xf7f15589
[ 496.424408][T17289] Code: 03 74 d8 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 cc 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90
All code
========
   0:	03 74 d8 01          	add    0x1(%rax,%rbx,8),%esi
	...
  20:*	00 51 52             	add    %dl,0x52(%rcx)		<-- trapping instruction
  23:	55                   	push   %rbp
  24:	89 e5                	mov    %esp,%ebp
  26:	0f 34                	sysenter
  28:	cd 80                	int    $0x80
  2a:	5d                   	pop    %rbp
  2b:	5a                   	pop    %rdx
  2c:	59                   	pop    %rcx
  2d:	c3                   	ret
  2e:	cc                   	int3
  2f:	90                   	nop
  30:	90                   	nop
  31:	90                   	nop
  32:	90                   	nop
  33:	90                   	nop
  34:	90                   	nop
  35:	90                   	nop
  36:	90                   	nop
  37:	90                   	nop
  38:	90                   	nop
  39:	90                   	nop
  3a:	90                   	nop
  3b:	90                   	nop
  3c:	90                   	nop
  3d:	90                   	nop
  3e:	90                   	nop
  3f:	90                   	nop

Code starting with the faulting instruction
===========================================
   0:	5d                   	pop    %rbp
   1:	5a                   	pop    %rdx
   2:	59                   	pop    %rcx
   3:	c3                   	ret
   4:	cc                   	int3
   5:	90                   	nop
   6:	90                   	nop
   7:	90                   	nop
   8:	90                   	nop
   9:	90                   	nop
   a:	90                   	nop
   b:	90                   	nop
   c:	90                   	nop
   d:	90                   	nop
   e:	90                   	nop
   f:	90                   	nop
  10:	90                   	nop
  11:	90                   	nop
  12:	90                   	nop
  13:	90                   	nop
  14:	90                   	nop
  15:	90                   	nop


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250824/202508242042.e9d8711f-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

