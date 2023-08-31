Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71E11855
	for <oe-lkp@lists.linux.dev>; Thu, 31 Aug 2023 05:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693460607; x=1724996607;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0kJLOKmmhG0UPMW24yz2J8/68ewMBPJU/TgY0LvN8+E=;
  b=j0a2VubXxEcRt7MPy1Z3PzCb13Be5hTatfy7m3dOMUPPVvJgKwuLfp59
   W7zzyGSEefQJi/czH4JPV6BPVMnzLKMLpzmXr4XeqpqYpN3SnUWhVlWSQ
   eHJaxInWq6NkAHv/Ar5/qFriY5mGbWdhalGJl67b34sisNqUn/JtSdev+
   DqrFyK2hN17oKZFc8v/uTAVia0afm79xetsIpkNyYsXToE03rfRjIA7pz
   t7PsufRTSu4SLj7irE0d8UdxHXeSJ37OBGfp6QwE+G4O8RUrrjXY9YoeC
   QFojvgYT4Z4RICW4y67Ldv75QstGHWQjnIU03XhkfJg818TrYkvqi3O0L
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="439772325"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="439772325"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 22:43:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="732927771"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="732927771"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga007.jf.intel.com with ESMTP; 30 Aug 2023 22:43:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 30 Aug 2023 22:43:26 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 30 Aug 2023 22:43:25 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 30 Aug 2023 22:43:25 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 30 Aug 2023 22:43:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VwWFKZIS57CyT878YQYAlm/VaMNPSiYCP0jXUJAbWqR/Gs+mum3mofAdn9GKz/tRPd08kQB8KfQckekPpC8AoKB+NV8Vm8cRBjzmXzwSvVw8sIh76B8t+cUtLv5KkSfYK/Bc7aTap9LVnBXDCts1wfNSYLTOB0WT4ZbgXFzZbx48fRciiiVrIZs35aN8O0fJk/5mDJmdk1rnePMGTKgyGzOxWVEO7FF4Cx/8y5J25x7b+prlufoOOleNzL+VLJcw25VG2o94Sv8Qx4iiXWeu6hEYe1uWt9dSICEfvPuMG9Be1svd8kqXIC4gIyUdbZPcpQZlr34CEpXGSDn80GnxQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CdGZ5mo0XD5O++Ue7uYzO7HJAPxVma9hNfvEHotuAoA=;
 b=VZMKJ8///DRGqdY3qatbb0NhT9oG7VplXE19j57fVVCs4LQ0LeKcrujtQM1Jc8blVqQ8UInoBe69CXC5/fuk+pESvQF5GIaHN7FcT8fE1+6SG10Q19mmQJrX4VmOW2tT5NUP1FK5yLepuLEi89IvlPU/PnEs5U0ChFuJhfXBNYM46ziv0tW99D7T+Vc70Zux05JMGYqIeGejN+9Yo/sCJ/HHbvkbfWVyW26KJeULGu378t/YQ9OLNkWalZY02Nf5akouiN37sUK/vd5eBq+LnrDGLf8jGU4ewL6Dt57XsiqrQ7peANJBveUoYApp3GlW81rHpd5eTnXU9329dnbleA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by MW4PR11MB7007.namprd11.prod.outlook.com (2603:10b6:303:22c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Thu, 31 Aug
 2023 05:43:18 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::73c6:1231:e700:924]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::73c6:1231:e700:924%4]) with mapi id 15.20.6745.021; Thu, 31 Aug 2023
 05:43:18 +0000
Date: Thu, 31 Aug 2023 13:43:09 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [mcgrof-next:large-block-nobdev-20230829-minorder] [test_xarray]
 dea2cb729d: WARNING:suspicious_RCU_usage
Message-ID: <202308311334.51039a5b-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:3:18::34) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|MW4PR11MB7007:EE_
X-MS-Office365-Filtering-Correlation-Id: 2970023e-0d74-4479-bc4a-08dba9e52db7
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ADQZ5VIiZ7jJfsFcYsMFLUNRSRKpfUub/0zIl4fepLFfeptMHfM3jccyYSjI/I9zw8XbDQEyKfRgMY1slPK04i85iMheQf4yl8nh93h/cEiJ2ncBhfyXlhGj/Jzei3EPUxCOQdBcS6gIIOUIdPisnH1PHf2I4DzwePs59AJIlYdNicHhdosRTrnzWsBTl0kx2DhVWV3ztV8AN6+JU2AdUdX1BeLK12ve7VrmJsbkDxqeOypNfa8t82k7IRtSSiJxnyHytyfpbDr/o6EthulkEysgxQYe4uWbbqOiY3muPodXzH+3kRhXnDqVbvoWrXTJWtDI0UkxB9eUUp6M29XQFApKH1YVGJ1eiSVqXUWh9/i4NO8xxr0fa2nNt+oHSQSspkj0RCN6Q5xamfNHXUIp1B4s7e5GRb7Mkr94axM9FTDgFe6V6UsDY06GW13t8CLEMWS8qp2zC8V3uFp8hkyrgT6VgS4+UjPY95YrMMbtPaLT5vRG5C986D9SkVDvYMxGNQ3aWJ7ivVMwQtJLSvTaEQSifqkfNnB8d3KFIUhZsXq54BJmnEc7CxBhfvwGsXlwRcQs8AyM7jT/N1eQGLwM4A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(136003)(39860400002)(366004)(1800799009)(186009)(451199024)(8936002)(6666004)(45080400002)(66946007)(478600001)(6506007)(66556008)(66476007)(966005)(6486002)(38100700002)(316002)(41300700001)(82960400001)(6512007)(8676002)(86362001)(36756003)(1076003)(26005)(2616005)(83380400001)(107886003)(30864003)(2906002)(6916009)(5660300002)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FhQFm6PVtljKidfeXc4FdXI+n6OFIs+rT/1nwUjK0Q0zhZad/g6Ecm6zN55d?=
 =?us-ascii?Q?cxQnce4wD3sYWozX5btCHsLnfJLqK9fc3OdpUOzQRcOohiXGUn7uInGbHAK3?=
 =?us-ascii?Q?1gSQeiADKoqX2fjFnaExNoM1YiyyZrq24yZNTLWWZKx8MaADA15k0XvKs3zQ?=
 =?us-ascii?Q?jORZiH6fB3q9jvNIeA0mOUtoiQwGZU5mU6+cfUVpJU4i7BKbKUC7Xym9Yrpv?=
 =?us-ascii?Q?gJawMFaYjZUxxBGwmr4CmRx0JzeOTvmvd8gvoK5LnvJZLxPTcpAcG0fVmHwQ?=
 =?us-ascii?Q?kgqaUmAa9a7xFiZNcnhj0FIIoQvoCvWf9RjKiwDpuqQJ4LtKWmUs6eiROec3?=
 =?us-ascii?Q?r2STtdaUH3ZYOJAEei3qpHLuwwC//Vfu+z4nNKRF0ANriJiwqUAdMAcd2y4t?=
 =?us-ascii?Q?MIfIBlZdPJg0NR4oU25Rnqlw17tvqkgprQqvPmf/pRU7uU1P6+Kbd7Yv66Og?=
 =?us-ascii?Q?RvfnwTUYKRTR4l3DigWQo4YCQJWTj2dr7IaioV8EEpxmJZrzgee2KzjDyBu3?=
 =?us-ascii?Q?AUh8sdWfteO+iWbuXCiDMhUKQjl4FJHqb5Bcq91a/ewG86JfrecJ6nd7xKF5?=
 =?us-ascii?Q?0tOpQJFcNakJmcETnigMLDX0ZWjrC/W5ZAEwAPJuk0PvDwvEn1W4EKDx0kaL?=
 =?us-ascii?Q?3OYCcS29VkcqE1rgqjqP4hrYNzN+cVSGmc1WWYOpiOPlQyNrH7zSRrYACNxI?=
 =?us-ascii?Q?EwuKWx/JBCVqvZoFFk4egLf6UlePqVz7cM7j7QqAXW3FAoTBhkwnkqv3jdrM?=
 =?us-ascii?Q?l5CuZ3uqvHzUXrmmQWo+ZgA1nAvrrGChMUg17+VMFdFJ8z/WPF8MRs02aIc2?=
 =?us-ascii?Q?nBC8wkSHiE8Kr1kX5saVJZEUT20pYmrxlfgnNMQ/foZ8f2X1PGthvnGGY70f?=
 =?us-ascii?Q?BkQWsNhsdwlVh73isv7iB5yuq2gVv2+shDjheRG90dESaDvr1cXzpQQlYAYY?=
 =?us-ascii?Q?bEmbBG2tIMC4B/xvcmaYg1U15l6ejkBgR/SYJXbsCY14MuZOueaTUQPqe1BG?=
 =?us-ascii?Q?ArtpB9q23pTsUzE1MnPR2661yXyQIanoAnS346CWRIp3BD/X2eyconsg0rBL?=
 =?us-ascii?Q?6B79ChjbwICh/A1v89DVIISIhJ36GQMcwxWwJHH/EUNac7Ce5TCEAs773pzt?=
 =?us-ascii?Q?PkrUdIjJjEYHmxnkkmkgUctj9NtRZLlXNOFC2I0Di7NSe5baUbuIboOQRF06?=
 =?us-ascii?Q?CoqLyjs8m09mEqKMIE4kCeu1Gm63ql3d7lWC4shxmHrvPNP2wsO5fhgh2Yr8?=
 =?us-ascii?Q?Bm1YtTEcDddu+VTVQOLnl02PONMvZFx7S6+Fu+4uv8awX0W25miSdSvysyAE?=
 =?us-ascii?Q?BtLWdcx6PIS4L/RDzOH2uFvhP2oyR/5DavUOIkghvFIlfKS7mUvLp5YFHWfB?=
 =?us-ascii?Q?SikF8Zntya1uwrkFJY7Sbj2Gy78Jfrm48kJMTJmBLZ0KMoqOudqyCVSiWnZf?=
 =?us-ascii?Q?Xv/HJvhp7RPN/p/UTCmPXXQkFTmkv95Aro7v8yUwBXOFpoTkGW+BtWdzgC0T?=
 =?us-ascii?Q?6C5uLG3UGs2XldGLIpn/n+f/w6Iza8Zy1jtmgdLcz0gB0jq4hxmDYgYOVD1w?=
 =?us-ascii?Q?nYiDcPiyPntk5UMjc5nia6kPXyXAVtCP3dYPKHTjY6J+a9Av069F8nnDgiJ5?=
 =?us-ascii?Q?PQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2970023e-0d74-4479-bc4a-08dba9e52db7
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 05:43:18.5399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YgV52gNO4wfnm94xB1rF8DpZqPdXBIomzGutMHD1b6t+FTH4azpsLKQy7/3b+DslZ45gT7qctAR3+W7c5JDjQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7007
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:suspicious_RCU_usage" on:

commit: dea2cb729d3c23cae6a72fd50b24601cfbb04fcc ("test_xarray: add tests for advanced multi-index use")
https://git.kernel.org/cgit/linux/kernel/git/mcgrof/linux-next.git large-block-nobdev-20230829-minorder

in testcase: boot

compiler: clang-16
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202308311334.51039a5b-oliver.sang@intel.com


[   16.877173][    T1] WARNING: suspicious RCU usage
[   16.878066][    T1] 6.5.0-rc7-next-20230825-00020-gdea2cb729d3c #8 Tainted: G                 N
[   16.879573][    T1] -----------------------------
[   16.880419][    T1] include/linux/xarray.h:1183 suspicious rcu_dereference_check() usage!
[   16.881937][    T1]
[   16.881937][    T1] other info that might help us debug this:
[   16.881937][    T1]
[   16.883693][    T1]
[   16.883693][    T1] rcu_scheduler_active = 2, debug_locks = 1
[   16.885616][    T1] no locks held by swapper/1.
[   16.887201][    T1]
[   16.887201][    T1] stack backtrace:
[   16.889434][    T1] CPU: 0 PID: 1 Comm: swapper Tainted: G                 N 6.5.0-rc7-next-20230825-00020-gdea2cb729d3c #8 b954d2305d302be70ae21c8b9828caea29d6c64b
[   16.892039][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   16.892039][    T1] Call Trace:
[ 16.892039][ T1] dump_stack_lvl (kbuild/src/rand-2/lib/dump_stack.c:107) 
[ 16.892039][ T1] dump_stack (kbuild/src/rand-2/lib/dump_stack.c:113) 
[ 16.892039][ T1] lockdep_rcu_suspicious (kbuild/src/rand-2/kernel/locking/lockdep.c:6713) 
[ 16.892039][ T1] xas_start (kbuild/src/rand-2/include/linux/xarray.h:?) 
[ 16.892039][ T1] xas_store (kbuild/src/rand-2/lib/xarray.c:237 kbuild/src/rand-2/lib/xarray.c:789) 
[ 16.892039][ T1] ? lock_release (kbuild/src/rand-2/kernel/locking/lockdep.c:?) 
[ 16.892039][ T1] ? rcu_lock_acquire (kbuild/src/rand-2/include/linux/rcupdate.h:307) 
[ 16.892039][ T1] check_xa_multi_store_adv_delete (kbuild/src/rand-2/lib/test_xarray.c:710) 
[ 16.892039][ T1] check_xa_multi_store_adv (kbuild/src/rand-2/lib/test_xarray.c:?) 
[ 16.892039][ T1] check_multi_store_advanced (kbuild/src/rand-2/lib/test_xarray.c:806) 
[ 16.892039][ T1] xarray_checks (kbuild/src/rand-2/lib/test_xarray.c:1943) 
[ 16.892039][ T1] do_one_initcall (kbuild/src/rand-2/init/main.c:1232) 
[ 16.892039][ T1] ? xa_dump (kbuild/src/rand-2/lib/test_xarray.c:1930) 
[ 16.892039][ T1] do_initcall_level (kbuild/src/rand-2/init/main.c:1293) 
[ 16.892039][ T1] ? rest_init (kbuild/src/rand-2/init/main.c:1429) 
[ 16.892039][ T1] do_initcalls (kbuild/src/rand-2/init/main.c:1307) 
[ 16.892039][ T1] ? rest_init (kbuild/src/rand-2/init/main.c:1429) 
[ 16.892039][ T1] do_basic_setup (kbuild/src/rand-2/init/main.c:1330) 
[ 16.892039][ T1] kernel_init_freeable (kbuild/src/rand-2/init/main.c:1549) 
[ 16.892039][ T1] kernel_init (kbuild/src/rand-2/init/main.c:1439) 
[ 16.892039][ T1] ret_from_fork (kbuild/src/rand-2/arch/x86/kernel/process.c:153) 
[ 16.892039][ T1] ret_from_fork_asm (kbuild/src/rand-2/arch/x86/entry/entry_32.S:741) 
[ 16.892039][ T1] entry_INT80_32 (kbuild/src/rand-2/arch/x86/entry/entry_32.S:947) 
[   16.912670][    T1]
[   16.913147][    T1] =============================
[   16.913930][    T1] WARNING: suspicious RCU usage
[   16.914844][    T1] 6.5.0-rc7-next-20230825-00020-gdea2cb729d3c #8 Tainted: G                 N
[   16.916292][    T1] -----------------------------
[   16.917137][    T1] include/linux/xarray.h:1199 suspicious rcu_dereference_check() usage!
[   16.918616][    T1]
[   16.918616][    T1] other info that might help us debug this:
[   16.918616][    T1]
[   16.920233][    T1]
[   16.920233][    T1] rcu_scheduler_active = 2, debug_locks = 1
[   16.921640][    T1] no locks held by swapper/1.
[   16.922470][    T1]
[   16.922470][    T1] stack backtrace:
[   16.923523][    T1] CPU: 0 PID: 1 Comm: swapper Tainted: G                 N 6.5.0-rc7-next-20230825-00020-gdea2cb729d3c #8 b954d2305d302be70ae21c8b9828caea29d6c64b
[   16.924933][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   16.924933][    T1] Call Trace:
[ 16.924933][ T1] dump_stack_lvl (kbuild/src/rand-2/lib/dump_stack.c:107) 
[ 16.924933][ T1] dump_stack (kbuild/src/rand-2/lib/dump_stack.c:113) 
[ 16.924933][ T1] lockdep_rcu_suspicious (kbuild/src/rand-2/kernel/locking/lockdep.c:6713) 
[ 16.924933][ T1] xas_descend (kbuild/src/rand-2/include/linux/xarray.h:?) 
[ 16.924933][ T1] xas_store (kbuild/src/rand-2/lib/xarray.c:244 kbuild/src/rand-2/lib/xarray.c:789) 
[ 16.924933][ T1] ? lock_release (kbuild/src/rand-2/kernel/locking/lockdep.c:?) 
[ 16.924933][ T1] ? rcu_lock_acquire (kbuild/src/rand-2/include/linux/rcupdate.h:307) 
[ 16.924933][ T1] check_xa_multi_store_adv_delete (kbuild/src/rand-2/lib/test_xarray.c:710) 
[ 16.924933][ T1] check_xa_multi_store_adv (kbuild/src/rand-2/lib/test_xarray.c:?) 
[ 16.924933][ T1] check_multi_store_advanced (kbuild/src/rand-2/lib/test_xarray.c:806) 
[ 16.924933][ T1] xarray_checks (kbuild/src/rand-2/lib/test_xarray.c:1943) 
[ 16.924933][ T1] do_one_initcall (kbuild/src/rand-2/init/main.c:1232) 
[ 16.924933][ T1] ? xa_dump (kbuild/src/rand-2/lib/test_xarray.c:1930) 
[ 16.924933][ T1] do_initcall_level (kbuild/src/rand-2/init/main.c:1293) 
[ 16.924933][ T1] ? rest_init (kbuild/src/rand-2/init/main.c:1429) 
[ 16.924933][ T1] do_initcalls (kbuild/src/rand-2/init/main.c:1307) 
[ 16.924933][ T1] ? rest_init (kbuild/src/rand-2/init/main.c:1429) 
[ 16.924933][ T1] do_basic_setup (kbuild/src/rand-2/init/main.c:1330) 
[ 16.924933][ T1] kernel_init_freeable (kbuild/src/rand-2/init/main.c:1549) 
[ 16.924933][ T1] kernel_init (kbuild/src/rand-2/init/main.c:1439) 
[ 16.924933][ T1] ret_from_fork (kbuild/src/rand-2/arch/x86/kernel/process.c:153) 
[ 16.924933][ T1] ret_from_fork_asm (kbuild/src/rand-2/arch/x86/entry/entry_32.S:741) 
[ 16.924933][ T1] entry_INT80_32 (kbuild/src/rand-2/arch/x86/entry/entry_32.S:947) 
[   16.946589][    T1]
[   16.947106][    T1] =============================
[   16.948015][    T1] WARNING: suspicious RCU usage
[   16.948834][    T1] 6.5.0-rc7-next-20230825-00020-gdea2cb729d3c #8 Tainted: G                 N
[   16.950288][    T1] -----------------------------
[   16.951119][    T1] include/linux/xarray.h:1208 suspicious rcu_dereference_protected() usage!
[   16.952625][    T1]
[   16.952625][    T1] other info that might help us debug this:
[   16.952625][    T1]
[   16.954353][    T1]
[   16.954353][    T1] rcu_scheduler_active = 2, debug_locks = 1
[   16.955821][    T1] no locks held by swapper/1.
[   16.956638][    T1]
[   16.956638][    T1] stack backtrace:
[   16.957697][    T1] CPU: 0 PID: 1 Comm: swapper Tainted: G                 N 6.5.0-rc7-next-20230825-00020-gdea2cb729d3c #8 b954d2305d302be70ae21c8b9828caea29d6c64b
[   16.958682][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   16.958682][    T1] Call Trace:
[ 16.958682][ T1] dump_stack_lvl (kbuild/src/rand-2/lib/dump_stack.c:107) 
[ 16.958682][ T1] dump_stack (kbuild/src/rand-2/lib/dump_stack.c:113) 
[ 16.958682][ T1] lockdep_rcu_suspicious (kbuild/src/rand-2/kernel/locking/lockdep.c:6713) 
[ 16.958682][ T1] xas_store (kbuild/src/rand-2/include/linux/xarray.h:?) 
[ 16.958682][ T1] check_xa_multi_store_adv_delete (kbuild/src/rand-2/lib/test_xarray.c:710) 
[ 16.958682][ T1] check_xa_multi_store_adv (kbuild/src/rand-2/lib/test_xarray.c:?) 
[ 16.958682][ T1] check_multi_store_advanced (kbuild/src/rand-2/lib/test_xarray.c:806) 
[ 16.958682][ T1] xarray_checks (kbuild/src/rand-2/lib/test_xarray.c:1943) 
[ 16.958682][ T1] do_one_initcall (kbuild/src/rand-2/init/main.c:1232) 
[ 16.958682][ T1] ? xa_dump (kbuild/src/rand-2/lib/test_xarray.c:1930) 
[ 16.958682][ T1] do_initcall_level (kbuild/src/rand-2/init/main.c:1293) 
[ 16.958682][ T1] ? rest_init (kbuild/src/rand-2/init/main.c:1429) 
[ 16.958682][ T1] do_initcalls (kbuild/src/rand-2/init/main.c:1307) 
[ 16.958682][ T1] ? rest_init (kbuild/src/rand-2/init/main.c:1429) 
[ 16.958682][ T1] do_basic_setup (kbuild/src/rand-2/init/main.c:1330) 
[ 16.958682][ T1] kernel_init_freeable (kbuild/src/rand-2/init/main.c:1549) 
[ 16.958682][ T1] kernel_init (kbuild/src/rand-2/init/main.c:1439) 
[ 16.958682][ T1] ret_from_fork (kbuild/src/rand-2/arch/x86/kernel/process.c:153) 
[ 16.958682][ T1] ret_from_fork_asm (kbuild/src/rand-2/arch/x86/entry/entry_32.S:741) 
[ 16.958682][ T1] entry_INT80_32 (kbuild/src/rand-2/arch/x86/entry/entry_32.S:947) 
[   16.978696][    T1]
[   16.979151][    T1] =============================
[   16.979938][    T1] WARNING: suspicious RCU usage
[   16.980721][    T1] 6.5.0-rc7-next-20230825-00020-gdea2cb729d3c #8 Tainted: G                 N
[   16.982219][    T1] -----------------------------
[   16.983050][    T1] include/linux/xarray.h:1224 suspicious rcu_dereference_protected() usage!
[   16.984499][    T1]
[   16.984499][    T1] other info that might help us debug this:
[   16.984499][    T1]
[   16.986252][    T1]
[   16.986252][    T1] rcu_scheduler_active = 2, debug_locks = 1
[   16.987582][    T1] no locks held by swapper/1.
[   16.988470][    T1]
[   16.988470][    T1] stack backtrace:
[   16.989517][    T1] CPU: 0 PID: 1 Comm: swapper Tainted: G                 N 6.5.0-rc7-next-20230825-00020-gdea2cb729d3c #8 b954d2305d302be70ae21c8b9828caea29d6c64b
[   16.991490][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   16.991490][    T1] Call Trace:
[ 16.991490][ T1] dump_stack_lvl (kbuild/src/rand-2/lib/dump_stack.c:107) 
[ 16.991490][ T1] dump_stack (kbuild/src/rand-2/lib/dump_stack.c:113) 
[ 16.991490][ T1] lockdep_rcu_suspicious (kbuild/src/rand-2/kernel/locking/lockdep.c:6713) 
[ 16.991490][ T1] xas_store (kbuild/src/rand-2/include/linux/xarray.h:?) 
[ 16.991490][ T1] check_xa_multi_store_adv_delete (kbuild/src/rand-2/lib/test_xarray.c:710) 
[ 16.991490][ T1] check_xa_multi_store_adv (kbuild/src/rand-2/lib/test_xarray.c:771) 
[ 16.991490][ T1] check_multi_store_advanced (kbuild/src/rand-2/lib/test_xarray.c:806) 
[ 16.991490][ T1] xarray_checks (kbuild/src/rand-2/lib/test_xarray.c:1943) 
[ 16.991490][ T1] do_one_initcall (kbuild/src/rand-2/init/main.c:1232) 
[ 16.991490][ T1] ? xa_dump (kbuild/src/rand-2/lib/test_xarray.c:1930) 
[ 16.991490][ T1] do_initcall_level (kbuild/src/rand-2/init/main.c:1293) 
[ 16.991490][ T1] ? rest_init (kbuild/src/rand-2/init/main.c:1429) 
[ 16.991490][ T1] do_initcalls (kbuild/src/rand-2/init/main.c:1307) 
[ 16.991490][ T1] ? rest_init (kbuild/src/rand-2/init/main.c:1429) 
[ 16.991490][ T1] do_basic_setup (kbuild/src/rand-2/init/main.c:1330) 
[ 16.991490][ T1] kernel_init_freeable (kbuild/src/rand-2/init/main.c:1549) 
[ 16.991490][ T1] kernel_init (kbuild/src/rand-2/init/main.c:1439) 
[ 16.991490][ T1] ret_from_fork (kbuild/src/rand-2/arch/x86/kernel/process.c:153) 
[ 16.991490][ T1] ret_from_fork_asm (kbuild/src/rand-2/arch/x86/entry/entry_32.S:741) 
[ 16.991490][ T1] entry_INT80_32 (kbuild/src/rand-2/arch/x86/entry/entry_32.S:947) 
[   30.258504][   T41] clocksource_wdtest: --- Verify tsc-like uncertainty margin.
[   30.259837][   T41] clocksource: wdtest-ktime: mask: 0xffffffffffffffff max_cycles: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
[   30.267004][   T41] clocksource_wdtest: --- tsc-like times: 3723291420 - 3723290042 = 1378.
[   30.270990][   T41] clocksource_wdtest: --- Watchdog with 0x error injection, 2 retries.
[   33.918797][   T41] clocksource_wdtest: --- Watchdog with 1x error injection, 2 retries.
[   34.529728][    T1] XArray: 80951366 of 80951366 tests passed
[   34.531629][    T1] test_memcat_p: test passed
[   34.549750][    T1] test_meminit: all 11 tests in test_pages passed
[   34.556237][    T1] test_meminit: all 40 tests in test_kvmalloc passed
[   35.064032][    T1] test_meminit: all 70 tests in test_kmemcache passed
[   35.066161][    T1] test_meminit: all 10 tests in test_rcu_persistent passed
[   35.067288][    T1] test_meminit: all 131 tests passed!
[   35.068218][    T1] test_free_pages: Testing with GFP_KERNEL
[   36.114706][   T41] clocksource_wdtest: --- Watchdog with 2x error injection, 2 retries, expect message.
[   36.436672][    C0] clocksource: timekeeping watchdog on CPU0: kvm-clock retried 2 times before success
[   38.248034][   T41] clocksource_wdtest: --- Watchdog with 3x error injection, 2 retries, expect clock skew.
[   38.437664][    C0] clocksource: timekeeping watchdog on CPU0: wd-wdtest-ktime-wd excessive read-back delay of 1000199ns vs. limit of 125000ns, wd-wd read-back delay only 29ns, attempt 3, marking wdtest-ktime unstable
[   38.442550][    C0] clocksource_wdtest: --- Marking wdtest-ktime unstable due to clocksource watchdog.
[   40.484705][   T41] clocksource: wdtest-ktime: mask: 0xffffffffffffffff max_cycles: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
[   40.486533][   T41] clocksource_wdtest: --- Watchdog clock-value-fuzz error injection, expect clock skew and per-CPU mismatches.
[   41.448046][    C0] clocksource: timekeeping watchdog on CPU0: Marking clocksource 'wdtest-ktime' as unstable because the skew is too large:
[   41.450062][    C0] clocksource:                       'kvm-clock' wd_nsec: 506701193 wd_now: a4e8f56a5 wd_last: a305bb11c mask: ffffffffffffffff
[   41.452211][    C0] clocksource:                       'wdtest-ktime' cs_nsec: 706700709 cs_now: 177fb34e7e53f60a cs_last: 177fb34e54349065 mask: ffffffffffffffff
[   41.454666][    C0] clocksource:                       Clocksource 'wdtest-ktime' skewed 199999516 ns (199 ms) over watchdog 'kvm-clock' interval of 506701193 ns (506 ms)
[   41.457127][    C0] clocksource:                       'kvm-clock' (not 'wdtest-ktime') is current clocksource.
[   41.458862][    C0] clocksource_wdtest: --- Marking wdtest-ktime unstable due to clocksource watchdog.
[   42.514737][   T41] clocksource: Not enough CPUs to check clocksource 'wdtest-ktime'.
[   42.516012][   T41] clocksource_wdtest: --- Done with test.
[   42.516965][   T41] wdtest (41) used greatest stack depth: 7076 bytes left
[   43.486668][    T1] test_free_pages: Testing with GFP_KERNEL | __GFP_COMP
[   46.511767][    T1] test_free_pages: Test completed
[   46.512781][    T1] ref_tracker: reference already released.
[   46.513772][    T1] ref_tracker: allocated in:
[ 46.514592][ T1] alloctest_ref_tracker_alloc2 (kbuild/src/rand-2/lib/test_ref_tracker.c:25) 
[ 46.514617][ T1] test_ref_tracker_init (kbuild/src/rand-2/lib/test_ref_tracker.c:74) 
[ 46.514617][ T1] do_one_initcall (kbuild/src/rand-2/init/main.c:1232) 
[ 46.514617][ T1] do_initcall_level (kbuild/src/rand-2/init/main.c:1293) 
[ 46.514617][ T1] do_initcalls (kbuild/src/rand-2/init/main.c:1307) 
[ 46.514617][ T1] do_basic_setup (kbuild/src/rand-2/init/main.c:1330) 
[ 46.514617][ T1] kernel_init_freeable (kbuild/src/rand-2/init/main.c:1549) 
[ 46.514617][ T1] kernel_init (kbuild/src/rand-2/init/main.c:1439) 
[ 46.514617][ T1] ret_from_fork (kbuild/src/rand-2/arch/x86/kernel/process.c:153) 
[ 46.514617][ T1] ret_from_fork_asm (kbuild/src/rand-2/arch/x86/entry/entry_32.S:741) 
[ 46.514617][ T1] restore_all_switch_stack (kbuild/src/rand-2/arch/x86/entry/entry_32.S:947) 
[   46.514617][    T1] ref_tracker: freed in:
[ 46.514617][ T1] alloctest_ref_tracker_free (kbuild/src/rand-2/lib/test_ref_tracker.c:51) 
[ 46.514617][ T1] test_ref_tracker_init (kbuild/src/rand-2/lib/test_ref_tracker.c:93) 
[ 46.514617][ T1] do_one_initcall (kbuild/src/rand-2/init/main.c:1232) 
[ 46.514617][ T1] do_initcall_level (kbuild/src/rand-2/init/main.c:1293) 
[ 46.514617][ T1] do_initcalls (kbuild/src/rand-2/init/main.c:1307) 
[ 46.514617][ T1] do_basic_setup (kbuild/src/rand-2/init/main.c:1330) 
[ 46.514617][ T1] kernel_init_freeable (kbuild/src/rand-2/init/main.c:1549) 
[ 46.514617][ T1] kernel_init (kbuild/src/rand-2/init/main.c:1439) 
[ 46.514617][ T1] ret_from_fork (kbuild/src/rand-2/arch/x86/kernel/process.c:153) 
[ 46.514617][ T1] ret_from_fork_asm (kbuild/src/rand-2/arch/x86/entry/entry_32.S:741) 
[ 46.514617][ T1] restore_all_switch_stack (kbuild/src/rand-2/arch/x86/entry/entry_32.S:947) 
[   46.533808][    T1] ------------[ cut here ]------------
[ 46.534805][ T1] WARNING: CPU: 0 PID: 1 at lib/ref_tracker.c:255 ref_tracker_free (kbuild/src/rand-2/lib/ref_tracker.c:255) 
[   46.536263][    T1] Modules linked in:
[   46.536960][    T1] CPU: 0 PID: 1 Comm: swapper Tainted: G                 N 6.5.0-rc7-next-20230825-00020-gdea2cb729d3c #8 b954d2305d302be70ae21c8b9828caea29d6c64b
[   46.539435][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 46.541123][ T1] EIP: ref_tracker_free (kbuild/src/rand-2/lib/ref_tracker.c:255) 
[ 46.542100][ T1] Code: 31 ff e9 8d 00 00 00 68 b4 87 5b dc e8 c1 c1 85 01 83 c4 04 83 7b 0c 00 75 2e 83 7b 10 00 75 43 89 f0 8b 55 f0 e8 68 27 87 01 <0f> 0b bf ea ff ff ff eb 61 89 d8 e8 80 28 86 01 e9 3b ff ff ff 89
All code
========
   0:	31 ff                	xor    %edi,%edi
   2:	e9 8d 00 00 00       	jmp    0x94
   7:	68 b4 87 5b dc       	push   $0xffffffffdc5b87b4
   c:	e8 c1 c1 85 01       	call   0x185c1d2
  11:	83 c4 04             	add    $0x4,%esp
  14:	83 7b 0c 00          	cmpl   $0x0,0xc(%rbx)
  18:	75 2e                	jne    0x48
  1a:	83 7b 10 00          	cmpl   $0x0,0x10(%rbx)
  1e:	75 43                	jne    0x63
  20:	89 f0                	mov    %esi,%eax
  22:	8b 55 f0             	mov    -0x10(%rbp),%edx
  25:	e8 68 27 87 01       	call   0x1872792
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	bf ea ff ff ff       	mov    $0xffffffea,%edi
  31:	eb 61                	jmp    0x94
  33:	89 d8                	mov    %ebx,%eax
  35:	e8 80 28 86 01       	call   0x18628ba
  3a:	e9 3b ff ff ff       	jmp    0xffffffffffffff7a
  3f:	89                   	.byte 0x89

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	bf ea ff ff ff       	mov    $0xffffffea,%edi
   7:	eb 61                	jmp    0x6a
   9:	89 d8                	mov    %ebx,%eax
   b:	e8 80 28 86 01       	call   0x1862890
  10:	e9 3b ff ff ff       	jmp    0xffffffffffffff50
  15:	89                   	.byte 0x89
[   46.545227][    T1] EAX: 0207f06b EBX: c3bafd80 ECX: 00000000 EDX: ffffffff
[   46.546355][    T1] ESI: dda1ca08 EDI: 04790024 EBP: c129dc48 ESP: c129dbf8
[   46.547519][    T1] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00010286
[   46.548879][    T1] CR0: 80050033 CR2: ffdd9000 CR3: 1d0be000 CR4: 00040690
[   46.550037][    T1] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[   46.551176][    T1] DR6: fffe0ff0 DR7: 00000400
[   46.552086][    T1] Call Trace:
[ 46.552677][ T1] ? show_regs (kbuild/src/rand-2/arch/x86/kernel/dumpstack.c:478) 
[ 46.553409][ T1] ? ref_tracker_free (kbuild/src/rand-2/lib/ref_tracker.c:255) 
[ 46.554260][ T1] ? __warn (kbuild/src/rand-2/kernel/panic.c:235 kbuild/src/rand-2/kernel/panic.c:673) 
[ 46.555056][ T1] ? ref_tracker_free (kbuild/src/rand-2/lib/ref_tracker.c:255) 
[ 46.555904][ T1] ? ref_tracker_free (kbuild/src/rand-2/lib/ref_tracker.c:255) 
[ 46.556779][ T1] ? report_bug (kbuild/src/rand-2/lib/bug.c:199) 
[ 46.557544][ T1] ? exc_overflow (kbuild/src/rand-2/arch/x86/kernel/traps.c:250) 
[ 46.558416][ T1] ? handle_bug (kbuild/src/rand-2/arch/x86/kernel/traps.c:237) 
[ 46.559168][ T1] ? exc_invalid_op (kbuild/src/rand-2/arch/x86/kernel/traps.c:258) 
[ 46.559969][ T1] ? handle_exception (kbuild/src/rand-2/arch/x86/entry/entry_32.S:1049) 
[ 46.560834][ T1] ? try_to_take_rt_mutex (kbuild/src/rand-2/include/linux/rbtree.h:?) 
[ 46.561858][ T1] ? exc_overflow (kbuild/src/rand-2/arch/x86/kernel/traps.c:250) 
[ 46.562642][ T1] ? ref_tracker_free (kbuild/src/rand-2/lib/ref_tracker.c:255) 
[ 46.563508][ T1] ? exc_overflow (kbuild/src/rand-2/arch/x86/kernel/traps.c:250) 
[ 46.564271][ T1] ? ref_tracker_free (kbuild/src/rand-2/lib/ref_tracker.c:255) 
[ 46.565210][ T1] ? alloctest_ref_tracker_free (kbuild/src/rand-2/lib/test_ref_tracker.c:51) 
[ 46.566129][ T1] ? test_ref_tracker_init (kbuild/src/rand-2/lib/test_ref_tracker.c:99) 
[ 46.567038][ T1] ? do_one_initcall (kbuild/src/rand-2/init/main.c:1232) 
[ 46.567991][ T1] ? do_initcall_level (kbuild/src/rand-2/init/main.c:1293) 
[ 46.568846][ T1] ? do_initcalls (kbuild/src/rand-2/init/main.c:1307) 
[ 46.569632][ T1] ? do_basic_setup (kbuild/src/rand-2/init/main.c:1330) 
[ 46.570442][ T1] ? kernel_init_freeable (kbuild/src/rand-2/init/main.c:1549) 
[ 46.571403][ T1] ? kernel_init (kbuild/src/rand-2/init/main.c:1439) 
[ 46.572193][ T1] ? ret_from_fork (kbuild/src/rand-2/arch/x86/kernel/process.c:153) 
[ 46.572973][ T1] ? ret_from_fork_asm (kbuild/src/rand-2/arch/x86/entry/entry_32.S:741) 
[ 46.573792][ T1] ? entry_INT80_32 (kbuild/src/rand-2/arch/x86/entry/entry_32.S:947) 
[ 46.574699][ T1] alloctest_ref_tracker_free (kbuild/src/rand-2/lib/test_ref_tracker.c:51) 
[ 46.575614][ T1] test_ref_tracker_init (kbuild/src/rand-2/lib/test_ref_tracker.c:99) 
[ 46.576495][ T1] do_one_initcall (kbuild/src/rand-2/init/main.c:1232) 
[ 46.577299][ T1] ? do_kmem_cache_rcu_persistent (kbuild/src/rand-2/lib/test_ref_tracker.c:64) 
[ 46.578441][ T1] do_initcall_level (kbuild/src/rand-2/init/main.c:1293) 
[ 46.579269][ T1] ? rest_init (kbuild/src/rand-2/init/main.c:1429) 
[ 46.580016][ T1] do_initcalls (kbuild/src/rand-2/init/main.c:1307) 
[ 46.580785][ T1] ? rest_init (kbuild/src/rand-2/init/main.c:1429) 
[ 46.581630][ T1] do_basic_setup (kbuild/src/rand-2/init/main.c:1330) 
[ 46.582429][ T1] kernel_init_freeable (kbuild/src/rand-2/init/main.c:1549) 
[ 46.583283][ T1] kernel_init (kbuild/src/rand-2/init/main.c:1439) 
[ 46.584040][ T1] ret_from_fork (kbuild/src/rand-2/arch/x86/kernel/process.c:153) 
[ 46.584933][ T1] ret_from_fork_asm (kbuild/src/rand-2/arch/x86/entry/entry_32.S:741) 
[ 46.585734][ T1] entry_INT80_32 (kbuild/src/rand-2/arch/x86/entry/entry_32.S:947) 
[   46.586524][    T1] irq event stamp: 34075341
[ 46.587299][ T1] hardirqs last enabled at (34075351): console_unlock (kbuild/src/rand-2/arch/x86/include/asm/irqflags.h:42 kbuild/src/rand-2/arch/x86/include/asm/irqflags.h:77 kbuild/src/rand-2/arch/x86/include/asm/irqflags.h:135 kbuild/src/rand-2/kernel/printk/printk.c:347 kbuild/src/rand-2/kernel/printk/printk.c:2718 kbuild/src/rand-2/kernel/printk/printk.c:3037) 
[ 46.588841][ T1] hardirqs last disabled at (34075362): console_unlock (kbuild/src/rand-2/kernel/printk/printk.c:345) 
[ 46.590304][ T1] softirqs last enabled at (34075150): do_softirq_own_stack (kbuild/src/rand-2/arch/x86/kernel/irq_32.c:57 kbuild/src/rand-2/arch/x86/kernel/irq_32.c:147) 
[ 46.591907][ T1] softirqs last disabled at (34075141): do_softirq_own_stack (kbuild/src/rand-2/arch/x86/kernel/irq_32.c:57 kbuild/src/rand-2/arch/x86/kernel/irq_32.c:147) 
[   46.593418][    T1] ---[ end trace 0000000000000000 ]---
[   46.594467][    T1] ref_tracker: selftest@(ptrval) has 1/2 users at
[ 46.594467][ T1] test_ref_tracker_timer_func (kbuild/src/rand-2/arch/x86/include/asm/atomic.h:28 kbuild/src/rand-2/include/linux/atomic/atomic-arch-fallback.h:492 kbuild/src/rand-2/include/linux/atomic/atomic-instrumented.h:68 kbuild/src/rand-2/lib/test_ref_tracker.c:60) 
[ 46.594467][ T1] call_timer_fn (kbuild/src/rand-2/arch/x86/include/asm/jump_label.h:41 kbuild/src/rand-2/include/linux/jump_label.h:207 kbuild/src/rand-2/include/trace/events/timer.h:127 kbuild/src/rand-2/kernel/time/timer.c:1701) 
[ 46.594467][ T1] run_timer_softirq (kbuild/src/rand-2/kernel/time/timer.c:1751 kbuild/src/rand-2/kernel/time/timer.c:2022 kbuild/src/rand-2/kernel/time/timer.c:2035) 
[ 46.594467][ T1] __do_softirq (kbuild/src/rand-2/arch/x86/include/asm/jump_label.h:41 kbuild/src/rand-2/include/linux/jump_label.h:207 kbuild/src/rand-2/include/trace/events/irq.h:142 kbuild/src/rand-2/kernel/softirq.c:554) 
[   46.594467][    T1]
[   46.594748][    T1] ref_tracker: selftest@(ptrval) has 1/2 users at
[ 46.594748][ T1] alloctest_ref_tracker_alloc1 (kbuild/src/rand-2/lib/test_ref_tracker.c:24) 
[ 46.594748][ T1] test_ref_tracker_init (kbuild/src/rand-2/lib/test_ref_tracker.c:73) 
[ 46.594748][ T1] do_one_initcall (kbuild/src/rand-2/init/main.c:1232) 
[ 46.594748][ T1] do_initcall_level (kbuild/src/rand-2/init/main.c:1293) 
[ 46.594748][ T1] do_initcalls (kbuild/src/rand-2/init/main.c:1307) 
[ 46.594748][ T1] do_basic_setup (kbuild/src/rand-2/init/main.c:1330) 
[ 46.594748][ T1] kernel_init_freeable (kbuild/src/rand-2/init/main.c:1549) 
[ 46.594748][ T1] kernel_init (kbuild/src/rand-2/init/main.c:1439) 
[ 46.594748][ T1] ret_from_fork (kbuild/src/rand-2/arch/x86/kernel/process.c:153) 
[ 46.594748][ T1] ret_from_fork_asm (kbuild/src/rand-2/arch/x86/entry/entry_32.S:741) 
[ 46.594748][ T1] restore_all_switch_stack (kbuild/src/rand-2/arch/x86/entry/entry_32.S:947) 
[   46.594748][    T1]


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20230831/202308311334.51039a5b-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

