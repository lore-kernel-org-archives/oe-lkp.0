Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C57C8CC
	for <oe-lkp@lists.linux.dev>; Sun, 24 Sep 2023 13:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695563455; x=1727099455;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dMs1sVAOluSIFiAsnDcfmwZ2ITjk1rjUxEd1G1S0lD4=;
  b=XmLjwl1JZDaBxEr5gS+G3dDjktsfWMGbbL1oMG8fCKTRJXtg9VroPdrO
   Mwfhu/KKe28fIvGqhcj5BiqM0XYHBhrBg51HG6+OZb0i1a+jstbXbknN3
   7xj1a61A6IKdrvS0VC7DqQgj4vUBiZZs+8z8XTpmjQqb1jeYYHe2SFEHA
   iqc1E3KNNAfFnQ0UekIpAp9kSTw2vojAY90nDNJm4Ng26bo8w6KDvLm++
   HjfJfp/F96avQZDRTCOpTAZFi0NPC0nsCsm7umsfcHxLTgZ80IPpwKDfx
   YwZEwsGc3MenjHxvISj2HIPuJR/C+1ekgFhLW9bFoh7XeFvuyArtK5Dz5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="379972412"
X-IronPort-AV: E=Sophos;i="6.03,173,1694761200"; 
   d="scan'208";a="379972412"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2023 06:50:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="1078930463"
X-IronPort-AV: E=Sophos;i="6.03,173,1694761200"; 
   d="scan'208";a="1078930463"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 24 Sep 2023 06:50:54 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sun, 24 Sep 2023 06:50:54 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sun, 24 Sep 2023 06:50:53 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Sun, 24 Sep 2023 06:50:53 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Sun, 24 Sep 2023 06:50:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JLYk37+QHHEk595h9tAR80qKlZGgUSg33KW5vJj0NSo+sB8cUReTKHTzXlaLTlKS4yTemd/A4pNTBIGULLPJowX5Hff/kriOyb1p6MupB/xuhx3U8/gmJ073Imxs4HONKmdjQrl6kZCqe21o5GiJpU+HZ987eKpB4B2gW6CcAA9jBHFJfHdiLbxZ4irLkYZm9kjsEfsPBMiV6mDOjm3VXc7V9fCR4uaqyDT3yz20C6BhOrhDnAaKkdNmDM77vYOzZijhtChDbNKNLTxAmu6EhkPaZ1XQRIW/+o55JxQWGDbftOVi+ZudLFnz1bmfI6q398aDHxt+YDX4IwEYrKZeFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TxodCLOL+LUwVBsJSdohCewcLGcpiW0Hg7+4HF9Cgds=;
 b=ePWbGfEFZwCp5kZUoZvVDZFkrsXG9tqVzx0WW9+T5PqdCc6vDCFk0UEBpxniV23rj1l/xLaPRN2QMWLtMo1atN72IxR0hfVP6f7CtMDrSQX9/zXSI2hz3DUbdwrq4YHNhRz45b7bmdhMtWM7GVYlQC8weWJUZ+xC2NEhesOjsQdPr+eopXu9Q5Sc8/OFO3khUsPjUTlT6pdNc/M3qOpXrB95gzETksh+AK5sCHtm7OjBWb92BZOTu60jufxmAwX10PIFnJZHFH1Mn8yZ5YlnDXobtESgNRwXuX+VhaoeU0mtYKzSJUHA4upsn7VXVqCih65k0w+xKy2Ou8AiJFWm4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by PH7PR11MB8501.namprd11.prod.outlook.com (2603:10b6:510:308::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Sun, 24 Sep
 2023 13:50:50 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::73c6:1231:e700:924]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::73c6:1231:e700:924%4]) with mapi id 15.20.6813.017; Sun, 24 Sep 2023
 13:50:50 +0000
Date: Sun, 24 Sep 2023 21:50:39 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Jaeseon Sim <jason.sim@samsung.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Linux Memory Management List
	<linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, "Liam R.
 Howlett" <Liam.Howlett@oracle.com>, Matthew Wilcox <willy@infradead.org>,
	Peng Zhang <zhangpeng.00@bytedance.com>, Suren Baghdasaryan
	<surenb@google.com>, <maple-tree@lists.infradead.org>,
	<oliver.sang@intel.com>
Subject: [linux-next:master] [maple_tree]  2041864a22:
 BUG:sleeping_function_called_from_invalid_context_at_include/linux/sched/mm.h
Message-ID: <202309242123.7ebe65b5-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:3:18::19) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|PH7PR11MB8501:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a9d84cd-d159-46d0-495c-08dbbd05433e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O+994bskZvngtfXzHhF5eFabfOi9M9bmJ3K3TaG3CyqzrDSdX+nV7H2XhpkJ0BVK+nLyiwii7SAKg7zPyMY0TQXxm4j5xIGsUCMQdLWUIkAyqHU4HKQh6hOwkfWDyzu/1Sm0OGwYctf+/b0t9j33i5y40F+WJIK2tkTbr/0QMpOM3iTgqWn/COAMCR3sguXAfoLNbGYlTU6ZjOtUA16hrXVDmydyzinGhCYpL0ZrxKvHAYLFy8zhiyMn717ZsTHjR6rdEJADVxdm/Td0chK4Si3UTJKtrUWM8Y/M28hLrLQNHvNVCQgNINZyVeOHbfx/il7W6tUQEg3khXiq/s+iCC4NjygxI4bPu3+DSIb8fjyUpP0bLr+hlfBNNKtEksnJVpTAZyCoU++oClhv0Caz5RaAOt6PLtfGVce80fu/0sij9foInFOohYzOJESqAV+B1Hxy2Gd0NRmuHU6f9P6vN80UA2avC5MxG8d177IOyDfSbQc7wf66Pv2RyykIghbZo9V0n0F/qdNZND5ziMvTNGX3p+MVFkTjQOzjDBU+XtZH2/nbrEGX5yz3dN7HK/+Tpf8sDEuA0boEYFSpSpIANg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(136003)(396003)(366004)(39860400002)(230922051799003)(451199024)(186009)(1800799009)(2616005)(1076003)(5660300002)(107886003)(2906002)(26005)(82960400001)(4326008)(86362001)(36756003)(38100700002)(8936002)(8676002)(83380400001)(6486002)(41300700001)(6666004)(478600001)(6506007)(6512007)(966005)(66476007)(316002)(6916009)(54906003)(66556008)(66946007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h6ieCP8M7VcEL8ddKWCNof0Ib+TPmOOucC348uf0CRj4ZtTefWeiVf2LTZY+?=
 =?us-ascii?Q?Gn90I52Peo/5NpnZMlrBBGOpZv5yaliTxsrlckCPJm4SoIhvcnwf8l6pHskU?=
 =?us-ascii?Q?fUPuuZZsGT5xaNnqPn09zrr62F+VW1M1x3/Byy1b1/c2HxUyrA+ZEcYVR66C?=
 =?us-ascii?Q?URTNwDEqeNjjlDzd3VbgDehzsrCCt/p4nreOA8i45O2Qt1wr3TMITTpCzPW6?=
 =?us-ascii?Q?XjqJJcp2XlPkSW+VFIki2pxjIneo3Zibb8XbIlposavOeFJ+Amls9+FGi+na?=
 =?us-ascii?Q?AIJHNXg18J7Z+JRqRUZh9IuS18fxSa+ODu9nNraPqOoz729t7l+8sg3wMBLe?=
 =?us-ascii?Q?dr9JN0WC89aPjtD0C+tC6Xi0HL108doFhLnkeJi1vzNe2uHmyeQVvHgWX5t9?=
 =?us-ascii?Q?sTcekEt/i9QZwKp71kn9Lb+MlQPtzPpJE7y1hTvcW+mOdM4LKh0Kow3p/hnj?=
 =?us-ascii?Q?Eax03+QU+zM20gtf6XPZivf461nRjgxd+KZY4vvowXgJpQg/Lmd6Qr95Yfh4?=
 =?us-ascii?Q?8nKlcqJIvtjAo4W6wzmwmX7pAGqsSevWssDT+yfEZ8Xj9deq1yi3KwT6EgtV?=
 =?us-ascii?Q?LNecOinhfS1YodFJgkyNfIPbiaaJK6hzfYsYUQPi98I7unoLQ3L+65fuiS7u?=
 =?us-ascii?Q?vpfkYIY4GQc8zDf0mzAompv8+VqJpgbKHQrOmjTIfxUjIpSuh9kFdn7cYDgY?=
 =?us-ascii?Q?hGRRtBD0QQe3PwlOBH/jESZeiJfRBjotErF8jWwAYjGPIf7fuF2HK8ExOaZo?=
 =?us-ascii?Q?ciIEHLnDkS/6BgfafTCQwadjzTWoKsB6AXdDo3YL/SyYma3yF/E+54Ab7dla?=
 =?us-ascii?Q?1HKX+GiNimaKA0jbhSWjZ/OHOzu2hgvuONK7CHD8Kuuu94OsDHKKOXYYPFRo?=
 =?us-ascii?Q?x8x0QHgwIiGa7jqTkPusz8KPImkhJOCmsCyribkgQ5Hmd+0dIe2GzXGi1KCX?=
 =?us-ascii?Q?pCa7u/8SDmlAX0k3Wt28EN6sUJqd/0N4ZOtCBCbNKUEAMJ5r6FoKH/Q/at4X?=
 =?us-ascii?Q?NXrSa7v74afdCfh/PODiw9X7oEi8Yx3kutExdCd0tBcjXnRUeM1YmKnUM0FR?=
 =?us-ascii?Q?QSN2yggOs7MATMqVWK9WUva/VSUmmfQItRqrFtnewWReOloGKTw/c01vBmRc?=
 =?us-ascii?Q?XP+QoYoQ3ARQTz1TI92Mo1jX2VsHu3o2ntrJw12zyZ8OJTl/Y4VdTGqSEHsP?=
 =?us-ascii?Q?3SxvQAzJsqVlRALeNz9PosQjWZzEPlB7Uowd7TFakx7wejgYgLoQII3jVnEn?=
 =?us-ascii?Q?9PaT6ScejJsUvi4UOyBu4h7Uyjhds13fUccQR3QbA3Kmq8NlK8KQbMjk8N4z?=
 =?us-ascii?Q?TR886gPjdsvCSjdvrfCJ8vNCWBqMu7Y530ZkrUkDSW5W9ZdghwdlIqeZalx3?=
 =?us-ascii?Q?rXMK51n2OskJbEX8v+qCiHn98Itl/FE/oXEGuKzoPfl1ztRedX/bffjrEXyq?=
 =?us-ascii?Q?NfrmUcQz3U1R2AaVk7Jy32LaFKENHflw7FrvHAUTkDk+09eVAmsftG+RCV20?=
 =?us-ascii?Q?dbW1dk91QCSkrjZR0fDvBm1vBEw52a4pdIuDpSYVGYGRn6/6A4yh9JABWA/U?=
 =?us-ascii?Q?FQWzzN8E7Cfan+G+b/kt2Lhgw6hj3DyEVW8a6fOIHf6nR2tSmM0Jjce1mxOz?=
 =?us-ascii?Q?ZA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a9d84cd-d159-46d0-495c-08dbbd05433e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2023 13:50:50.6731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lz3LeLCYR4vgeBxzIoB0nhn5KVymXjIS+h7UkvgfWEVgfaPVcEdYbW440fcl4mCH5u1Hkhtj32c2Djt4uChV/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8501
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:sleeping_function_called_from_invalid_context_at_include/linux/sched/mm.h" on:

commit: 2041864a22d4f4e900d0a3def4985432a21d8e6d ("maple_tree: use mas_node_count_gfp() in mas_expected_entries()")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

[test failed on linux-next/master 940fcc189c51032dd0282cbee4497542c982ac59]

in testcase: boot

compiler: gcc-9
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202309242123.7ebe65b5-oliver.sang@intel.com


[  113.582828][    T1] BUG: sleeping function called from invalid context at include/linux/sched/mm.h:306
[  113.583602][    T1] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 1, name: swapper/0
[  113.584246][    T1] preempt_count: 1, expected: 0
[  113.584613][    T1] RCU nest depth: 0, expected: 0
[  113.584983][    T1] 1 lock held by swapper/0/1:
[ 113.585344][ T1] #0: ffffc9000001fc10 (&mt->ma_lock){+.+.}-{2:2}, at: check_forking+0x1e0/0x5c0 
[  113.586160][    T1] CPU: 1 PID: 1 Comm: swapper/0 Tainted: G                TN 6.6.0-rc2-00018-g2041864a22d4 #1
[  113.586924][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[  113.587701][    T1] Call Trace:
[  113.587949][    T1]  <TASK>
[ 113.588172][ T1] dump_stack_lvl (lib/dump_stack.c:107) 
[ 113.588540][ T1] dump_stack (lib/dump_stack.c:114) 
[ 113.588668][ T1] __might_resched (kernel/sched/core.c:10188) 
[ 113.588668][ T1] __might_sleep (kernel/sched/core.c:10117 (discriminator 17)) 
[ 113.588668][ T1] kmem_cache_alloc (include/linux/kernel.h:112 include/linux/sched/mm.h:306 mm/slab.h:709 mm/slub.c:3460 mm/slub.c:3486 mm/slub.c:3493 mm/slub.c:3502) 
[ 113.588668][ T1] ? mas_alloc_nodes (lib/maple_tree.c:160 lib/maple_tree.c:1249) 
[ 113.588668][ T1] mas_alloc_nodes (lib/maple_tree.c:160 lib/maple_tree.c:1249) 
[ 113.588668][ T1] mas_node_count_gfp (lib/maple_tree.c:1331) 
[ 113.588668][ T1] mas_expected_entries (lib/maple_tree.c:5580) 
[ 113.588668][ T1] check_forking+0x205/0x5c0 
[ 113.588668][ T1] ? check_mas_store_gfp+0x580/0x580 
[ 113.588668][ T1] ? mt_destroy_walk (lib/maple_tree.c:5273) 
[ 113.588668][ T1] ? mtree_destroy (lib/maple_tree.c:6392) 
[ 113.588668][ T1] ? lock_downgrade (kernel/locking/lockdep.c:5761) 
[ 113.588668][ T1] ? __raw_spin_lock_init (kernel/locking/spinlock_debug.c:26) 
[ 113.588668][ T1] maple_tree_seed (lib/test_maple_tree.c:3584) 
[ 113.588668][ T1] ? check_empty_area_window+0x3000/0x3000 
[ 113.588668][ T1] ? trace_hardirqs_on (kernel/trace/trace_preemptirq.c:63 (discriminator 22)) 
[ 113.588668][ T1] ? write_comp_data (kernel/kcov.c:236) 
[ 113.588668][ T1] ? check_empty_area_window+0x3000/0x3000 
[ 113.588668][ T1] do_one_initcall (init/main.c:1232) 
[ 113.588668][ T1] ? trace_event_raw_event_initcall_level (init/main.c:1223) 
[ 113.588668][ T1] ? parameq (kernel/params.c:171) 
[ 113.588668][ T1] ? __kasan_kmalloc (mm/kasan/common.c:384) 
[ 113.588668][ T1] kernel_init_freeable (init/main.c:1293 init/main.c:1310 init/main.c:1329 init/main.c:1547) 
[ 113.588668][ T1] ? rest_init (init/main.c:1429) 
[ 113.588668][ T1] kernel_init (init/main.c:1439) 
[ 113.588668][ T1] ? rest_init (init/main.c:1429) 
[ 113.588668][ T1] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 113.588668][ T1] ? rest_init (init/main.c:1429) 
[ 113.588668][ T1] ret_from_fork_asm (arch/x86/entry/entry_64.S:312) 
[  113.588668][    T1]  </TASK>



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20230924/202309242123.7ebe65b5-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

