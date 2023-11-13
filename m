Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A24C208A7
	for <oe-lkp@lists.linux.dev>; Mon, 13 Nov 2023 13:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f1eH+DeQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699882637; x=1731418637;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VSqq8EctngX6bGUD/Ge47AiYOk8dySAti0/qhKHkXYU=;
  b=f1eH+DeQ+7o2D22IJAgtY9DfnLqBQsXtmjmx4z8itvUWDjWZsBtvK9kT
   R9JLWSgtvkR4kBqUm3ciCZpForrk0yKYoqBMAkN5Gqkv6SKM0Cu6QQdmJ
   xfLaE4s4IDUZG7mDQs498qnt1LXi0EUz7n978DeX4Go4KulMA8DMdkgl6
   v37JSVk6kHI2QJkDcG4GsnGl2xjNENPhEuaAjjx8kcgFNJYVyD5eSb97G
   j5mYkyKGEdZ0kFXlrPYFQ6FpqZefvSWDFiEZm4+REjJUIaGDAosNUmOD+
   LvIecB549z7dgJ0ZVmgjTmLV3AOkzSg6jD6y1kEmYgdiQIBzUcAvsVThO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="387599992"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="387599992"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 05:37:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="12108061"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Nov 2023 05:37:17 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 05:37:15 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 13 Nov 2023 05:37:15 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 13 Nov 2023 05:37:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aMnhx6C1dJnnR9RwFdJQAL4d74eJSMKFzGrCjT01A9zs636slaPtvbBHSVslCdy1rcz3MZiSEEA6PlnsbC1uvRDpFvEz8eIDSEcEVQbiU+iaofRvyi6jaIkYVjX5IjHo2mWxWcPrqN2A3VFvtOQnP2NbrkPYecqIIHHuGY6KwkgIUfSM65Shoc/Rn1nJDqP2lX5M88jERWY5dxH76y2zVxAoZpJUjNQFNwOFct6nQ/ia/QUOOJUtuRKurkvM28h2MlPGrI+EmZ5F4iA3PtIAQXOXDToVWSOqL0kWJ/guZqD6Thmut6YzWj3ppb8qTKnItmcU2IIA7U9rOToRmmCiOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SjpoeHY+KIz+EkIyDRJ8S5sRj7pZ4c3fPKhOjTFxSu0=;
 b=WHhpRa5siMSnqsoB7X85gCtuu1EByRYKc3YXiUILt0COeVLVuBApAQZQB1xWphnUPUc6Rla+ldB1BMvNv0VchyV5UZkUpuMgqQqcTfEcG9VIHiIXmoY8kzbPGYK2GFl9RAY6lkH8bmaPl3zKqXYQ9CPZDE/8VJ8fW8UFeo3WzgD6GkBDrkNrvQXjHEUJS7igxrFcAGNPuLz0N0nugeMsi6D6/Lbu3bafhw30wzXvheJteYMergA426L9SFCK2fu5DJQa2l4XSQVket9rPard7MBAujsfUk4dheJz4sND6SpSwalOYfsg1tlAi75ykB/7SKAPgRv1psMNV60kS4+XzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by DS7PR11MB6127.namprd11.prod.outlook.com (2603:10b6:8:9d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Mon, 13 Nov
 2023 13:37:13 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::b8:30e8:1502:b2a7]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::b8:30e8:1502:b2a7%4]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 13:37:13 +0000
Date: Mon, 13 Nov 2023 21:37:06 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [tglx-devel:x86/topology] [x86/cpu/topology] 2e3fa8028d:
 BUG:KASAN:slab-out-of-bounds_in_rapl_cpu_online
Message-ID: <202311131632.d9ce0a36-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2P153CA0004.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::23) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|DS7PR11MB6127:EE_
X-MS-Office365-Filtering-Correlation-Id: ca9b10f4-6fa4-4304-4d34-08dbe44da475
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5p743og3u21F9zQj3wzNuqQDbrjXTNj7cRFAGkxyCwulIOJ95ReHYsTf/G5hofW8MUGw5G9mk5AbWwRmm2UTrCYBhaoMWGpicInotqBDRyQxfj2Ie0VYwZb0u5VB2GRM1X142x+3TKVaEm5pLqdccZKtatGTtLvQCZcfpMr3HF/IeSAU4v4IMXCLnJN6iwOKDfhLuEk9ro0pXj5zA+oK25hBsG4HF3vDOJcUNHVq42vtLTK3oXH6C+2IdqVgnqN0XlFTn4W0AHDDvztfmOJ8H1A09M7r0k0CSCE1HYViLbY98hLpp2ZygIZAfcb9jDZyFsaMLa3I47C1xbtTOqMv79IFcz46IE/IIxbZRBHaXFf/1xTF3k0gXSF4ighLsUw0oLWRjkPnlCVt8gEwl7146zGXNdIceP+uJ9wxuD1siZErE1PrAVRWWEUM//O9y4QQZjrbPmSKbUjO7ZKyUOhYHQDaKbiOaHOlUBKUHa4AFd9QoRxkL5eL6dH+1M0FGgbxXSGtjJNYKCiO/yps0Z7P/5dh0uJEG7mHia6omdM01ZFO2BeZWv5XW1VSRKwKCvK7oC6fQ5AfcH/Syh8cOv5Qe68fYXiZqV7ENIl0RxEcQblNGUAwKAbOkp0/GiACLo+t
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(376002)(136003)(346002)(366004)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(1076003)(26005)(6506007)(6666004)(2616005)(6512007)(83380400001)(5660300002)(4326008)(8936002)(8676002)(2906002)(41300700001)(966005)(6486002)(478600001)(316002)(6916009)(66476007)(66946007)(66556008)(82960400001)(36756003)(86362001)(38100700002)(107886003)(505234007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7QlQiymb4U0FgX2+mZ4Sfo6a4akdknP1W4NIq3WNprMFADDhgbkhzeywJ1Sh?=
 =?us-ascii?Q?r20LNlfh3dcCC+k8DaP4qseOp5kA/qH9I6TDjHPQUAnOtpiaKhiz0WcGpJeK?=
 =?us-ascii?Q?uClTWs6yOMvvOoesBcOaOLGWTLpAzdmiMniYu+GgJTymAxzvhZaMiQkPluyl?=
 =?us-ascii?Q?BJCxGIZ+fZJMyDnCL1iaL5OWmXKySlkGL7D7r4PCG15oCGprCCS9+WqEVEEM?=
 =?us-ascii?Q?CcVVx7oFB+IheFOXjaZjYJfDawISMZxx4lOPqA+fJxIYQlJMbvL7ThP4w5xd?=
 =?us-ascii?Q?6zdeSgQE9mspEaEXK5YBQhIS+au7Ky6Km+3P/2DESmO9u7VeDjOwtLEpGSda?=
 =?us-ascii?Q?ymtR8aZH1jZ5LlBRPoMBBS79isekYOxecCirruYKg00QJbS5jNNopUwevZ0x?=
 =?us-ascii?Q?ZkHoFjHpB4JnYZP2avsXP9VgB1T0CAsiXrWwU5fHih7j8vtxXqSa7D4irb4L?=
 =?us-ascii?Q?BUTy6Koo7RJwVUPiJ34KljeQI8js5/NPhQhmmgRLqFYMZbOOdtRF13i+JYoX?=
 =?us-ascii?Q?4458ks0X3ggGbxtZ5slzXZslYEu106NfXUmBcndZeLSUal+j7f/8iOtuapVf?=
 =?us-ascii?Q?A/g6ehIjTZqItTK4QxZ9LhVmrXg0D27MmF5O4b/978u/UQg3XIrkKoTmGsD5?=
 =?us-ascii?Q?MsLBn9YZoSDHeSTbqTiaa0+oruHdJXkLbWqUEYVx52vXL+FJWlsyFkkjAnvh?=
 =?us-ascii?Q?i1g72NSxIIuVSXbr789rFGIXjuNQsrJtxTY2gJjSTd+dOalHuUCR9teS6+5M?=
 =?us-ascii?Q?jhhiV+8KnJK0vE/a2t3+KlZh05s14wwylWMSSwGvD06Fghzd75zsbJL7D+37?=
 =?us-ascii?Q?vGCEqzgScyvx3w7fqv7jncP1KKGFzoP+5dF9yGmoSLt3EKoycujHUTpHNrHZ?=
 =?us-ascii?Q?xWbhDK5E8Bu1PhkXSqIMECJ636uQwPXzonGu8Ndt2t3q7ewJryKBoqxa8tkc?=
 =?us-ascii?Q?FxP3yqhg4wFCAk68aesjIK2dKFdkDlgkv/0fUEQtSucVnzYnGt264QYHBUOW?=
 =?us-ascii?Q?yUewsKY9WEpp3GWbe87MVRV5FoZdQo4DmVUm0BgA9SGKhx55xRnfz0gc2S1l?=
 =?us-ascii?Q?UasetBCbooVR0tetWxfmKoycAeLbp6ryQbPYoXmAxQ6RUszJI7BA2K1SnjIc?=
 =?us-ascii?Q?jr0RRTMP27vM4fN9bWBAdA+FSzlRXnz53Pq6QKllHvwTNSgWIj7Bo2QL3xs0?=
 =?us-ascii?Q?pGF2ngoAy/bxMyvkyew/01RvimVc8GG1LqdeWdiCLOzL4szWGAocs3K20Nsi?=
 =?us-ascii?Q?DQlgttb+FNpKmlwgMsvvn/evZ5q5F5BWy6znM5Wkwr/yNpAiQrXvZOb8zYgc?=
 =?us-ascii?Q?SrcmWc2T0Bw6/hlYHh3Hbujv0Cj34v7a4W8WopT0r6H3HDm8uVRb2B5K45yM?=
 =?us-ascii?Q?nzSkOLbRNkhWdgF57rGnNoXvQQYJSoLa3+FMuQVts1QiRucL8xfMqQu4if2X?=
 =?us-ascii?Q?u73sk6Zk6Rzk6YE6a/2zUGNtFlKej5HBA/lLvOpb5hDKQxw5CW1HhkVl0p4h?=
 =?us-ascii?Q?jNPbbKMN0YdQ9UhFtl2J1d8bim0laftfaEr6gqKPBpqEKLuNS8W59tdO0Ko8?=
 =?us-ascii?Q?80yG1NiBpZA4fhqjDK6UAPi17r3CqV04txXMewRjlG74OfjBZZCx7eYhunKU?=
 =?us-ascii?Q?2Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca9b10f4-6fa4-4304-4d34-08dbe44da475
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 13:37:12.9124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qpCAV4Wy6rp2WcjbxdluBdPSYdqXS2GEfrnhEkWEKkE31tOuNT6n3Wp1f5oIVgkJsQ7jcdZLQrAD+uOnMwD/jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6127
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:KASAN:slab-out-of-bounds_in_rapl_cpu_online" on:

commit: 2e3fa8028d1eb90d8780295acece38473801d8d9 ("x86/cpu/topology: Use topology bitmaps for sizing")
https://git.kernel.org/cgit/linux/kernel/git/tglx/devel.git x86/topology

in testcase: boot

compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202311131632.d9ce0a36-oliver.sang@intel.com


[ 113.407475][ T18] BUG: KASAN: slab-out-of-bounds in rapl_cpu_online (arch/x86/events/rapl.c:581) 
[  113.409102][   T18] Write of size 8 at addr ffff888111eb3d38 by task cpuhp/0/18
[  113.409328][   T18]
[  113.409328][   T18] CPU: 0 PID: 18 Comm: cpuhp/0 Not tainted 6.6.0-03706-g2e3fa8028d1e #1 a0594b95b9f62682eace4092e720782e645d6b1f
[  113.409328][   T18] Call Trace:
[  113.409328][   T18]  <TASK>
[ 113.409328][ T18] dump_stack_lvl (lib/dump_stack.c:107) 
[ 113.409328][ T18] print_address_description+0x2c/0x3b0 
[ 113.409328][ T18] ? rapl_cpu_online (arch/x86/events/rapl.c:581) 
[ 113.409328][ T18] print_report (mm/kasan/report.c:476) 
[ 113.409328][ T18] ? rapl_cpu_online (arch/x86/events/rapl.c:581) 
[ 113.409328][ T18] ? kasan_addr_to_slab (mm/kasan/common.c:35) 
[ 113.409328][ T18] ? rapl_cpu_online (arch/x86/events/rapl.c:581) 
[ 113.409328][ T18] kasan_report (mm/kasan/report.c:590) 
[ 113.409328][ T18] ? rapl_cpu_online (arch/x86/events/rapl.c:581) 
[ 113.409328][ T18] rapl_cpu_online (arch/x86/events/rapl.c:581) 
[ 113.409328][ T18] ? rapl_get_attr_cpumask (arch/x86/events/rapl.c:566) 
[ 113.409328][ T18] cpuhp_invoke_callback (kernel/cpu.c:196 (discriminator 4)) 
[ 113.409328][ T18] ? io_schedule_timeout (kernel/sched/core.c:8964 kernel/sched/core.c:8985) 
[ 113.409328][ T18] ? rapl_get_attr_cpumask (arch/x86/events/rapl.c:566) 
[ 113.409328][ T18] cpuhp_thread_fun (kernel/cpu.c:1093) 
[ 113.409328][ T18] ? take_cpu_down (kernel/cpu.c:1050) 
[ 113.409328][ T18] ? schedule (kernel/sched/core.c:6746 kernel/sched/core.c:6777) 
[ 113.409328][ T18] ? take_cpu_down (kernel/cpu.c:1050) 
[ 113.409328][ T18] ? smpboot_thread_fn (kernel/smpboot.c:162 (discriminator 3)) 
[ 113.409328][ T18] smpboot_thread_fn (kernel/smpboot.c:164 (discriminator 3)) 
[ 113.409328][ T18] ? sort_range (kernel/smpboot.c:107) 
[ 113.409328][ T18] kthread (kernel/kthread.c:388) 
[ 113.409328][ T18] ? kthread_complete_and_exit (kernel/kthread.c:341) 
[ 113.409328][ T18] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 113.409328][ T18] ? kthread_complete_and_exit (kernel/kthread.c:341) 
[ 113.409328][ T18] ret_from_fork_asm (arch/x86/entry/entry_64.S:250) 
[  113.409328][   T18]  </TASK>
[  113.409328][   T18]
[  113.409328][   T18] Allocated by task 1:
[ 113.409328][ T18] kasan_save_stack (mm/kasan/common.c:46) 
[ 113.409328][ T18] kasan_set_track (mm/kasan/common.c:52) 
[ 113.409328][ T18] __kasan_kmalloc (mm/kasan/common.c:374 mm/kasan/common.c:383) 
[ 113.409328][ T18] __kmalloc (include/linux/kasan.h:198 mm/slab_common.c:1026 mm/slab_common.c:1039) 
[ 113.409328][ T18] init_rapl_pmus (arch/x86/events/rapl.c:681) 
[ 113.409328][ T18] rapl_pmu_init (arch/x86/events/rapl.c:837) 
[ 113.409328][ T18] do_one_initcall (init/main.c:1232) 
[ 113.409328][ T18] do_initcalls (init/main.c:1293 init/main.c:1310) 
[ 113.409328][ T18] kernel_init_freeable (init/main.c:1551) 
[ 113.409328][ T18] kernel_init (init/main.c:1439) 
[ 113.409328][ T18] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 113.409328][ T18] ret_from_fork_asm (arch/x86/entry/entry_64.S:250) 
[  113.409328][   T18]
[  113.409328][   T18] The buggy address belongs to the object at ffff888111eb3c00
[  113.409328][   T18]  which belongs to the cache kmalloc-rnd-10-512 of size 512
[  113.409328][   T18] The buggy address is located 0 bytes to the right of
[  113.409328][   T18]  allocated 312-byte region [ffff888111eb3c00, ffff888111eb3d38)
[  113.409328][   T18]
[  113.409328][   T18] The buggy address belongs to the physical page:
[  113.409328][   T18] page:(____ptrval____) refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x111eb0
[  113.409328][   T18] head:(____ptrval____) order:2 entire_mapcount:0 nr_pages_mapped:0 pincount:0
[  113.409328][   T18] flags: 0x4000000000000840(slab|head|zone=1)
[  113.409328][   T18] page_type: 0xffffffff()
[  113.409328][   T18] raw: 4000000000000840 ffff88810005ca00 dead000000000122 0000000000000000
[  113.409328][   T18] raw: 0000000000000000 0000000080100010 00000001ffffffff 0000000000000000
[  113.409328][   T18] page dumped because: kasan: bad access detected
[  113.409328][   T18] page_owner tracks the page as allocated
[  113.409328][   T18] page last allocated via order 2, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 1, tgid 1 (swapper/0), ts 63683533156, free_ts 63683120165
[ 113.409328][ T18] get_page_from_freelist (mm/page_alloc.c:1545 mm/page_alloc.c:3170) 
[ 113.409328][ T18] __alloc_pages (mm/page_alloc.c:4426) 
[ 113.409328][ T18] allocate_slab (include/linux/gfp.h:237 include/linux/gfp.h:260 include/linux/gfp.h:271 mm/slub.c:1870 mm/slub.c:2017) 
[ 113.409328][ T18] ___slab_alloc (mm/slub.c:3223) 
[ 113.409328][ T18] __kmem_cache_alloc_node (mm/slub.c:3322 mm/slub.c:3375 mm/slub.c:3468 mm/slub.c:3517) 
[ 113.409328][ T18] kmalloc_trace (mm/slab_common.c:1120) 
[ 113.409328][ T18] device_add (drivers/base/core.c:3469 drivers/base/core.c:3520) 
[ 113.409328][ T18] pci_register_host_bridge (drivers/pci/probe.c:930) 
[ 113.409328][ T18] pci_create_root_bus (drivers/pci/probe.c:3059) 
[ 113.409328][ T18] acpi_pci_root_create (drivers/acpi/pci_root.c:1031) 
[ 113.409328][ T18] pci_acpi_scan_root (arch/x86/pci/acpi.c:452) 
[ 113.409328][ T18] acpi_pci_root_add (drivers/acpi/pci_root.c:733) 
[ 113.409328][ T18] acpi_bus_attach (drivers/acpi/scan.c:2164 drivers/acpi/scan.c:2210) 
[ 113.409328][ T18] acpi_dev_for_one_check (drivers/acpi/bus.c:1100) 
[ 113.409328][ T18] device_for_each_child (drivers/base/core.c:3952) 
[ 113.409328][ T18] acpi_dev_for_each_child (drivers/acpi/bus.c:1106) 
[  113.409328][   T18] page last free stack trace:
[ 113.409328][ T18] free_unref_page_prepare (include/linux/page_owner.h:24 mm/page_alloc.c:1136 mm/page_alloc.c:2312) 
[ 113.409328][ T18] free_unref_page (mm/page_alloc.c:2405) 
[ 113.409328][ T18] __stack_depot_save (lib/stackdepot.c:446) 
[ 113.409328][ T18] set_track_prepare (include/linux/hash.h:78 include/linux/slab.h:409 include/linux/slab.h:600 mm/slub.c:6226) 
[ 113.409328][ T18] __create_object (mm/kmemleak.c:681) 
[ 113.409328][ T18] __kmem_cache_alloc_node (mm/slab.h:761 mm/slub.c:3478 mm/slub.c:3517) 
[ 113.409328][ T18] __kmalloc (include/linux/kasan.h:198 mm/slab_common.c:1026 mm/slab_common.c:1039) 
[ 113.409328][ T18] resource_list_create_entry (include/linux/slab.h:603 include/linux/slab.h:720 kernel/resource.c:1751) 
[ 113.409328][ T18] pci_add_resource (drivers/pci/bus.c:26 drivers/pci/bus.c:38) 
[ 113.409328][ T18] acpi_pci_root_create (drivers/acpi/pci_root.c:1031) 
[ 113.409328][ T18] pci_acpi_scan_root (arch/x86/pci/acpi.c:452) 
[ 113.409328][ T18] acpi_pci_root_add (drivers/acpi/pci_root.c:733) 
[ 113.409328][ T18] acpi_bus_attach (drivers/acpi/scan.c:2164 drivers/acpi/scan.c:2210) 
[ 113.409328][ T18] acpi_dev_for_one_check (drivers/acpi/bus.c:1100) 
[ 113.409328][ T18] device_for_each_child (drivers/base/core.c:3952) 
[ 113.409328][ T18] acpi_dev_for_each_child (drivers/acpi/bus.c:1106) 
[  113.409328][   T18]
[  113.409328][   T18] Memory state around the buggy address:
[  113.409328][   T18]  ffff888111eb3c00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  113.409328][   T18]  ffff888111eb3c80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  113.409328][   T18] >ffff888111eb3d00: 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc fc


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20231113/202311131632.d9ce0a36-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

