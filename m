Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E5B80033
	for <oe-lkp@lists.linux.dev>; Tue,  6 Feb 2024 06:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707199871; cv=fail; b=Ng+J6KBM6ET4C03e25BTVew/eV4GAkNqskHaOo4WEOXyfszx+xFTD2naxZwR5oyRmgh+aIL4UJWNtEZZMVQ3K+tELazqMR1GgenI8OzgdLahc2ed2OJgTKQsH/7d23l+bjjEiSr9Io36PW51WKq3wOp936oMN2jIjD0TRIf7fZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707199871; c=relaxed/simple;
	bh=zJbRFkOCUWR9NHA7Y8KMxgAdD0iyaaFMdDyFK1mhsVc=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Drq09StrkYl2+vXbiBqiuda6FhHwRF9cIhY5CEae4OEqSlHa3mTXPaDwaM4syiSEHSuQIAM5ATjj07RE5Wk0QfxdVnZJyUHqJECYnbhFZ9RVF1NQD4jYzB4TbNcvvRBXedKgMkxhzS6nGnAwqi+E46KoSxiByp+vMTzQDyut6l8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WPGOc9P/; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WPGOc9P/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707199868; x=1738735868;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zJbRFkOCUWR9NHA7Y8KMxgAdD0iyaaFMdDyFK1mhsVc=;
  b=WPGOc9P/mx7ZDdj+CFNVENS/I/d/XLnF727plLI2120p/AKrVDhTPOTW
   4gd1jM2Qz0g21RLbPmcJf/V7txzMQUNSykvxG8JbIjMlGiocBIm8XSEWB
   CCdCEN6ACk65nPRxPWP6SJfR56uw0udNXqJULwi7mDCXssSQfT8uzln5B
   paETbuccWMmei6sU9DMfJrtcINVOMegNUOczu+NXeh3L/kKOAT/HOdcYe
   o19vExGIvpO3EPB3biQQZ4b09URFJ/Gmtv83zZFPNNIxpuRN3boWP+1HV
   q5gPgFVPx/ONtTVFC/5FrD78hJLazo7TTQL7qSL8N8Uy/OXsXq+3k75Nr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="832090"
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; 
   d="scan'208";a="832090"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 22:10:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; 
   d="scan'208";a="5540232"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Feb 2024 22:10:33 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 5 Feb 2024 22:10:32 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 5 Feb 2024 22:10:32 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 5 Feb 2024 22:10:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WUQ+paJYe8STJOeJl5ZIc5nxTfV4orjLVvDLypnIEjGR4pMLJK+2EHPLqEync31s88G4eiFlkyHbwk30T62u9jsYPT9ZPMF5nwjk5RxPg4xwsItKgh055UzCuAZ/uECX7tcJRpITVXX2WGN8trL0XG3Tw+baAARsOw8UpHSs1rjng6DgF3qAwnIyJR+aucCesT36sgiVNPzxiumNDhiBe8Cgj9tgn+AnYhCjm7e4jAYSF6KTmpArhg3U/rgoTmh9R9Nvd6//nGQLEo2flX/oxhFGRLJ8dBUyYda55Eyo5yLcOxPs93vGrTb6d2baBbnGZFJv+ooT3Ckc4OSEp67NBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wi53cEDQC6hkLakemZMuqbWBdF3JMswt+WSvM39UKDI=;
 b=Bh8QB7YpL7f/1EOTZlUpt4BfbhtNUuqiCATo3rKOk7RUdM+tPkrwr/qypqRL7iMR+p19rPgr3AuQhcDc4Pgw13vc59uTp4dsi6lEzmS8MbS41NOoKWTrUrJdg6O3OmOSN2LOkm4zCoIu+6+HVIyDafMq9JXKXuD7ndxj6U2unmD5zqmHm69Zy0goGlx1Grx6tz7BibBKPdAdCBCAayYgI4ny0WOFpOLJ03L0QM2r3pZeesCnjfR2XMx9kaVkalbDCJZnfp2akz9XO+mB7NuNNW+bjHM+bc9u/22yRWAowmQLjsPctyEDXVeQYlae7ES3St6jwzgCU+LCj6luxMsXUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DS0PR11MB8232.namprd11.prod.outlook.com (2603:10b6:8:15d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 6 Feb
 2024 06:10:30 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::a026:574d:dab0:dc8e]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::a026:574d:dab0:dc8e%3]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 06:10:30 +0000
Date: Tue, 6 Feb 2024 14:10:23 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [vbabka:slub-percpu-caches-v4r1-BROKEN] [maple_tree] 21597d6283:
 canonical_address#:#[##]
Message-ID: <202402061012.51046f57-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR06CA0226.apcprd06.prod.outlook.com
 (2603:1096:4:68::34) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DS0PR11MB8232:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f586e53-28c6-4149-0172-08dc26da51f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jHii4+CTxfPUGlExB4gxiEs3uGhlFSSXBzox8Ad2/Fnbe9YiwrhLGk6F7nFlPTD9d89WufZMRGbmko6jWdaFrCXXrAqFD6rTKp2874DBvxES2/hfq6o/1ZOK3pA7lqJkur9VMSG+lA00HSvUT17XXV7rgdrEkqbXrIGELF3GEEUm11qXxKrki63C7I1ZrX3vewEpRjcOPFtuSsynRQMJTJ9wpfcfYWBwwYZFdUB30VMkizBL2vBD83CiGWhJ2jKUsUv40WaLHwYvAVeR2f7ddqTHK0FJJXs52MB8f5Zc6WCNSv1UYIhNeCaSTXJir/uDNC0lOTGK/Xxwr90yWkT3kRvL4uMTJVY/O3u6yY9EBkpPI2nxbFDZf2WPul9rZNhxtsltSXRObC61X8+sII1iTitbQJQ6bFAsfjoUPD6Z8/I5gTl0GZFtW5EWLow4qWZ+SNtxiV3si2b7+mvKisHrdpVsaByMw6DmYFyVmixOAVcwA67l4CdyRYarDyoDNjSNG6QpZJDR0p28NDIYSsbjVCgPygUQFWbbjBu+NTNBW8zm3UaYxEgncmmEZZeCXOq9O9brnWfAnonTy5skmNMF+Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(366004)(136003)(396003)(376002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(38100700002)(82960400001)(6506007)(6666004)(83380400001)(26005)(86362001)(41300700001)(1076003)(2616005)(107886003)(4326008)(36756003)(8676002)(8936002)(6512007)(478600001)(2906002)(6486002)(966005)(5660300002)(6916009)(66946007)(66476007)(66556008)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KDyUy4Z2aRLhXqFmgZb3gmyihO7EZt08rAWgLEFKCXTGZTZvBcSfE0KjnuRq?=
 =?us-ascii?Q?VMG33Scgt2XNYczT/ionEzd44AWb3e7E0wPm4FrvMXQ/pCJd2T5e1Gp9JhzH?=
 =?us-ascii?Q?rTWlX2pFyn9r8D+O++NNlEhm4J/OgySr36o6ujfA7rHis0XD980BGQoXjA4P?=
 =?us-ascii?Q?gp7KjsWRIIbmUapzbihw5W/lMkBq8cLboCr/wA94f0qPT2ElXW5waTx51hx5?=
 =?us-ascii?Q?3n5K35fA2NhaC+4mwQj7peQDSVEUh/SmdKBYBGRDkt82J7ZaI/26XOhGQUYj?=
 =?us-ascii?Q?wGfEgPf52m8GjwGFPf0FEejNPVsX1GkfqysjADVLhczGTIneFxQ3dEvz87nu?=
 =?us-ascii?Q?lJnwbdDcHkhehFRcIWbz3OnFrEEsNixDixVNr2HOwZUSTTgVLMVqqE7Y0Ns2?=
 =?us-ascii?Q?sNivDdvgtDrJd7IkU7g/FGfuh26gZF5mUIAkfXeT/PAqtvIrt+w+s/E91bva?=
 =?us-ascii?Q?FJ0BbASWQo0wsh4vznUXkbestinIHlOzJzNJxE7E03AHtrcBTWdAYpHqaxEx?=
 =?us-ascii?Q?0WrrI853Y5Y3NUtmCGhsz+AWk0VV0ypQflG2EtybG4T1vmriXCjMFWCfBBiX?=
 =?us-ascii?Q?QzoU87n27MYvxh0jZNIvSHH+7xDZ+Zr2LKvxnCIY6GJoUi5dg6G6jJGoLtGi?=
 =?us-ascii?Q?H5/mkMJXZQjzlH6a2x+Qq508lpK8MdNc8pHLYzqt9TqB1Oc1+nu8cRefKtJS?=
 =?us-ascii?Q?4g9DM26rGDH8WjvjDV9FN9yJJT3qkl0if9H+py427Y1f2uGnGwRMf8mxDKEH?=
 =?us-ascii?Q?d25ErMt59lhlKkCUZNj73D7/FBvz5zsM1YRHyxQ0X4142zlNgY7OC24+xMoW?=
 =?us-ascii?Q?WOP5nl69v0sw+ryy3Qnjl4h/Wknzhb+Z/E3NNgsPdNFtPJXVRaXFM1E/jtQL?=
 =?us-ascii?Q?ky1sk5ZLTZ2OQbur+E0xgt6qYUTFVOTWHqTXNIv0yJfncrZMQjtODrW7ITtu?=
 =?us-ascii?Q?mgA7KgNIMvobm9pdWwCS/XLspJLhQJzlKCjwhEKyuJrwoZ+q0/wtZIPGEbwf?=
 =?us-ascii?Q?flgHokVtp86vjaWldQvfEq4zEiZ7dIbb6lKbCz9AN8e0DKGt0zdyxxH8IjXb?=
 =?us-ascii?Q?49FllckBbWkkzFpwbOxt8c419rd4iICNWBTYVlRsxKU9ZJDZDpw0UMmPWmpR?=
 =?us-ascii?Q?EQdksRGjdPr9lTF+LpxvsGt7hKBhncv6uYf3Y4KQuVU862OMSaPYaoWyzVHA?=
 =?us-ascii?Q?eFBefCThSsYhEMXCcI2pxAmlHfQViMEEgAOb5V/r3ZyQD2b5RTpRef460pjw?=
 =?us-ascii?Q?NG08TftcCojuNZZq5lS7fpyO5aaisx6gwgb4ifGXlLDB4sF06TUUEJQuTLcA?=
 =?us-ascii?Q?JtZyh8YKL0HIDJY77c7hvSQu8kLkkYqbnMbje2o3dBxxs0hGLNCreeRe4gyL?=
 =?us-ascii?Q?cGT1rPD4Ey6tznupRdoyTIN6cNo1Boqt6iWTCLRIChQJCK0jSa/vsFPvmcyu?=
 =?us-ascii?Q?qFJispiGA+oK165i7JSiZEjCNq9GQzDpGEKxDXkjHfWhFCOBmuxNkUpQjirF?=
 =?us-ascii?Q?6/mGnzYZbh/3nhwBIkblfoeiNqLSSkaYAX+GUEXwc03gvlRj5Tvsr8rm3ZBN?=
 =?us-ascii?Q?UftBD0iM8oSVFB8I+OT9wEHVGwyX1DRmxVhcdveP0hwu/2K4CJ7yksILzrbQ?=
 =?us-ascii?Q?lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f586e53-28c6-4149-0172-08dc26da51f6
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2024 06:10:30.2414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GAATbVUHDNEPlRx+t8/IY5xvq3tKlQk95vLxbF1201Cq/DBRq6NA6CJESOqPvu/C8n4bXtlFvUfzGOjWPCswiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8232
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "canonical_address#:#[##]" on:

commit: 21597d62834b4bd718c145bd504fbbf78fa80cd9 ("maple_tree: use slub percpu array")
https://git.kernel.org/cgit/linux/kernel/git/vbabka/linux.git slub-percpu-caches-v4r1-BROKEN

in testcase: boot

compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+------------------------------------------+------------+------------+
|                                          | c2c26b35e8 | 21597d6283 |
+------------------------------------------+------------+------------+
| boot_successes                           | 8          | 0          |
| boot_failures                            | 0          | 8          |
| canonical_address#:#[##]                 | 0          | 8          |
| RIP:kmem_cache_alloc                     | 0          | 8          |
| Kernel_panic-not_syncing:Fatal_exception | 0          | 8          |
+------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202402061012.51046f57-oliver.sang@intel.com


[    0.274494][    T0] 	Rude variant of Tasks RCU enabled.
[    0.275261][    T0] 	Tracing variant of Tasks RCU enabled.
[    0.276060][    T0] rcu: RCU calculated value of scheduler-enlistment delay is 100 jiffies.
[    0.277281][    T0] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=2
[    0.283749][    T0] NR_IRQS: 524544, nr_irqs: 440, preallocated irqs: 16
[    0.284814][    T0] general protection fault, probably for non-canonical address 0xffff2a85afc45a08: 0000 [#1] SMP PTI
[    0.286449][    T0] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 6.8.0-rc2-00004-g21597d62834b #1
[    0.287749][    T0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 0.289311][ T0] RIP: 0010:kmem_cache_alloc (kbuild/src/consumer/mm/slub.c:3870 kbuild/src/consumer/mm/slub.c:3945 kbuild/src/consumer/mm/slub.c:3965) 
[ 0.290135][ T0] Code: 0f 85 3e 02 00 00 45 31 d2 4d 85 e4 0f 84 2b 02 00 00 48 c7 44 24 10 00 00 00 00 49 83 7c 24 08 00 0f 84 43 01 00 00 9c 59 fa <65> 49 8b 54 24 08 8b 42 04 85 c0 0f 84 dd 00 00 00 83 e8 01 89 42
All code
========
   0:	0f 85 3e 02 00 00    	jne    0x244
   6:	45 31 d2             	xor    %r10d,%r10d
   9:	4d 85 e4             	test   %r12,%r12
   c:	0f 84 2b 02 00 00    	je     0x23d
  12:	48 c7 44 24 10 00 00 	movq   $0x0,0x10(%rsp)
  19:	00 00 
  1b:	49 83 7c 24 08 00    	cmpq   $0x0,0x8(%r12)
  21:	0f 84 43 01 00 00    	je     0x16a
  27:	9c                   	pushf
  28:	59                   	pop    %rcx
  29:	fa                   	cli
  2a:*	65 49 8b 54 24 08    	mov    %gs:0x8(%r12),%rdx		<-- trapping instruction
  30:	8b 42 04             	mov    0x4(%rdx),%eax
  33:	85 c0                	test   %eax,%eax
  35:	0f 84 dd 00 00 00    	je     0x118
  3b:	83 e8 01             	sub    $0x1,%eax
  3e:	89                   	.byte 0x89
  3f:	42                   	rex.X

Code starting with the faulting instruction
===========================================
   0:	65 49 8b 54 24 08    	mov    %gs:0x8(%r12),%rdx
   6:	8b 42 04             	mov    0x4(%rdx),%eax
   9:	85 c0                	test   %eax,%eax
   b:	0f 84 dd 00 00 00    	je     0xee
  11:	83 e8 01             	sub    $0x1,%eax
  14:	89                   	.byte 0x89
  15:	42                   	rex.X
[    0.293101][    T0] RSP: 0000:ffffffff8be03d80 EFLAGS: 00010002
[    0.293986][    T0] RAX: 0000000000000000 RBX: 0000000000002000 RCX: 0000000000000002
[    0.295175][    T0] RDX: 0000000000002800 RSI: 0000000000002800 RDI: ffff954140045a00
[    0.296338][    T0] RBP: ffffffff8be03dc8 R08: ffffffffffffffff R09: 0000000000000000
[    0.297499][    T0] R10: 0000000000000000 R11: 0000000000000000 R12: ffff954140045a00
[    0.298680][    T0] R13: 0000000000002800 R14: 0000000000000100 R15: ffffffff8b1e2ec1
[    0.299856][    T0] FS:  0000000000000000(0000) GS:ffff95446fc00000(0000) knlGS:0000000000000000
[    0.301178][    T0] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    0.302119][    T0] CR2: ffff95447ffff000 CR3: 000000011c61c000 CR4: 00000000000000b0
[    0.303308][    T0] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[    0.304489][    T0] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[    0.305664][    T0] Call Trace:
[    0.306154][    T0]  <TASK>
[ 0.306568][ T0] ? die_addr (kbuild/src/consumer/arch/x86/kernel/dumpstack.c:421 kbuild/src/consumer/arch/x86/kernel/dumpstack.c:460) 
[ 0.307182][ T0] ? exc_general_protection (kbuild/src/consumer/arch/x86/kernel/traps.c:698 kbuild/src/consumer/arch/x86/kernel/traps.c:643) 
[ 0.308009][ T0] ? asm_exc_general_protection (kbuild/src/consumer/arch/x86/include/asm/idtentry.h:564) 
[ 0.308862][ T0] ? mas_alloc_nodes (kbuild/src/consumer/lib/maple_tree.c:162 kbuild/src/consumer/lib/maple_tree.c:1242) 


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240206/202402061012.51046f57-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

