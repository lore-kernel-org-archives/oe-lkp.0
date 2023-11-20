Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D5A1FAD
	for <oe-lkp@lists.linux.dev>; Mon, 20 Nov 2023 06:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lIFI79U5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700462905; x=1731998905;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bU75+tCinFWcUYa6oAjJJpAvEoTjNx409iVoUz4+U5E=;
  b=lIFI79U5Il7DKZ5QaAAPFJ551rQYnwQ5QYqLqles+DXK87aETo/QcrM3
   Kv/7hx7z471Rw7HAYhO6hK+ZViifwvK/XQex8ptWPWRYtO+rVJ7l1NnCS
   zolTObk9PqfvgMk2elgAnnGbZ0cp8batFLLo3jBoFEluWNeEIZS/viduP
   i/CEtw0yjVv6PbyAliA99yH1gCAw7mbvRdHVjcDKkDAbSinF8yeJXYoBA
   IDARDrwFVEihXTc/i18pLEoLkNUlFinU0IscppgqAkphCW470HsqU+HY4
   nl3/GohQkp1bh71qKHcugKwHZJchoU8UPQgkZP1aIGpY0vG6TMU2YmRdu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="381952586"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; 
   d="scan'208";a="381952586"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 22:48:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="795374683"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; 
   d="scan'208";a="795374683"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 Nov 2023 22:48:24 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 19 Nov 2023 22:48:23 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 19 Nov 2023 22:48:23 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 19 Nov 2023 22:48:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TLxTFX0jxUHHWDYZDdrvgAk00ET47CanrRaAaXhjUy8EmS7PRxzZweMCQNI2N5Yji72AeVt880UjHOY3KMjRIx5C9OcUiH/Yan5lEamkYix8vxTq1OCsSa/sFdUB+VBno42Zpy65wtZP6H9HgIpev8pf07F8kZkEibLHab8h+Q58fkIdczhfGQoV/WPULFz4dNquAv0JUsdQ5413PoGaU7AjCttqyGcdlDzYIiGHgHw0aKZxPDFIO0atHfObpdEpG5erz7ZSBeHsbVTNQGIbma8qCA89OqSxvCncQHw8bRPTcTVp4o7pHbnUeczJp/E2mDvFwsA4jKJqYzKGoAG6JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4XB3dJCEVdwVkVAUIWxwCPM25d9+T5usG5iVfKglki8=;
 b=eL5pNQeSQrFdsq5aVesz/fOzALYQFx8FKLxPKYkP1glg1QYDlht8HlfKAjTTk3EJAZ5hI6qcvUthBcfjHStYAan1eYqKRflFgxcmRnUu1BR+nU1FQFUQdRx8wjTCfidU0Tq3vv+5GXbysQcbGcXOWXVXA0TgDfcKLT5lrL5RfOXrUKLwcan94M6HSAG3IutB6cAX6BritNV9h3T5Y4CzNZzL/d1GtB5119ISac15gUxqJosFx5DFmerizYx8yC5PUu1V92wIJ2kV5lBSGodcOt62wIr5uibNlDlDCylQdQEoPtR1GZiz0HAXyp27tK9zSG0Oqatf5cURFubZXaIxWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MW4PR11MB6763.namprd11.prod.outlook.com (2603:10b6:303:20b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Mon, 20 Nov
 2023 06:48:21 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::1236:9a2e:5acd:a7f]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::1236:9a2e:5acd:a7f%3]) with mapi id 15.20.7002.027; Mon, 20 Nov 2023
 06:48:20 +0000
Date: Mon, 20 Nov 2023 14:48:14 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Joel Granados <j.granados@samsung.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [joelgranados:jag/sysctl_remove_empty_elem_kernel] [scheduler]
 423f75083a: BUG:KASAN:global-out-of-bounds_in_insert_header
Message-ID: <202311201431.57aae8f3-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2P153CA0026.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::18) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MW4PR11MB6763:EE_
X-MS-Office365-Filtering-Correlation-Id: 89c607c4-fb7a-4049-18c4-08dbe994af28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 201pSSHhH7XCeu+Thjm5jUViKpck+GcM8R2VOeekHVYMlMluyftLbYTJbkxld82UwoBqTH5PY0quJH7dsk0yxshEGgbpsYf2noKxq71eIyjL/zBswhxW2fez0SZLU2Tfz09HmhTelEngETfRWYSTbxO3wJCJhQ+55t26wkwuJ/cVhFjNTcbngplTN/SQCxtw7xfQe5gsEuJfgQlB5sjnY89/KCVTXk/Exf1Ssg/hzJeQnkoRZAVn+icR1LRT9tSQ+RCAvwK6nWAkkmVCfh0Ffpq5o1D7iqrQSgNE39OkZ2TeAiTAP+NMroSMzQEPs7Zdn6ejDbxfunAwhUxLI/LhshIG9rJFZwGV/OtrNc8jasjE6Pp7lidYiF/bHY/pVG+cLpsp24VIUR6+kWzDSTTY3SEvKveTqzGySartuLhsS1sN8K0CrGjGP4y5TPfXoeLx1g9NRt/Iyi4yMSE/L7tjLEvJUhQe4pTXYa9drE0m/D3NRmVnE1cuYBBqjsvlmOB4HtiPd5vKTAL4QkcovJE4ZUKmpMzitTr4V6pd+e3nxyNdt/kUkj1bGtHP9EEOdVxmj50iNYWjzvJy5ZBTIdjMvaiNTv0wY9Ew0VUgBKv2KCM/1Y11dviyA1zv3nt3AA/524bWee1LiPMGo/0DRFZh3A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(39860400002)(366004)(346002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(6506007)(107886003)(26005)(1076003)(6666004)(6512007)(2616005)(6916009)(316002)(6486002)(966005)(478600001)(83380400001)(82960400001)(66946007)(66556008)(66476007)(8936002)(8676002)(4326008)(86362001)(38100700002)(5660300002)(2906002)(41300700001)(36756003)(505234007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qrchQ88G+1PJeCg0ZVbrHEZoS/0t9apbZqP7PxzgA6gVqgBA/1siTZDNc8xr?=
 =?us-ascii?Q?RfGPf0SkdYXq2MAAA7jz55vduR2YskPsLMcp9HnYgKG9BkK6E9ZqeX3/UlNZ?=
 =?us-ascii?Q?aSM6hcYLbWvIZ8OQ+YQWzdsxjGUIc3XgUsFbd3MpwjxJmfZnwUpbl9+Uvg3G?=
 =?us-ascii?Q?PiOXLquxLQuIoLrNSnVjubhIkE+OzI1ch8qvpP5YyoOzLgkMclVHznM4Vw8m?=
 =?us-ascii?Q?UIrNTplWIGbuIvxq+6HEjdGZueqFpfbYlzyrDfNL+WHP4/BhbqjT+1g6U7EG?=
 =?us-ascii?Q?TvgqMWYmp/MOCZUQIH+OFa9Y/dLcVEotv6kXX0erfeUIVbnZ7/nrCgli5Xop?=
 =?us-ascii?Q?5Udz2UTOLEd9aTwnSgTudaYBsQkNVO+Be0u7c5POnfzjfC+LaJnH/q0I8190?=
 =?us-ascii?Q?d/gdOBCoJB52USdCW+p/vO52bXhc+KBzTbcPJN8p2u4cbs02gAB5UZ+FWN1v?=
 =?us-ascii?Q?bLyogzO2RVcd9hwclYhUmCejjLVALueqoPNNA8+b+q39aRWRKbryemZYrFr9?=
 =?us-ascii?Q?xogF24dCVjebDMSKtIUmdyPc+O49fDdtGB/XnIo9hmRrHvhmAwbdR2ylezI5?=
 =?us-ascii?Q?AOKw1L4Ke4ev4hTv5cMn5DLy+7gFCClRHO8F59beZgTFrDYlpbKKoNEQBvws?=
 =?us-ascii?Q?IltnTf1pdh+iAwmwmK33i1NIqbPZZpa3AanRg5OvPaDw8uJ8ZqipzQJy/vCu?=
 =?us-ascii?Q?8yGJH7+4Z9xUdiuoZxHboI27X91URQYuy2Vq0e+duzE7J+2GWSXyB6PFlnek?=
 =?us-ascii?Q?6c4/w7LCBHwv5S9iwiJpSNrpTXp+AMM73eJQSaHNLhH6gDAjHGD0N36uOQai?=
 =?us-ascii?Q?i+4/CnFS5/KphUQa7vlMs5xb6GOAcqJRmDjd3zqH35BpMRuy+r4gXSlwco5v?=
 =?us-ascii?Q?Xb58kw2EUJe3UvIp7biXf4F9SbgVha05pN5qD9J3f2q4+KJM8wNKTvEeNBJO?=
 =?us-ascii?Q?biKniLPLYDOoKNS4n+AaCjKpD2wu213iUn71nkg0xqCDiCvv1c7SkDGkpKyv?=
 =?us-ascii?Q?33DEdlu3BT8FwB51Uj9nugC4+664pA47iaxV61SEC7t/DMK9RFvwkB5nkxd7?=
 =?us-ascii?Q?tRDlhSqCdlSC9qjeKoWwtcCxeI6AcCa3z5WkmhRPzLKv1GDX98BrIkDyi+xr?=
 =?us-ascii?Q?Wk3oOUk+dXkfL+EolZvzteSforqxNA6RATFz93zxwTtztcLQ3Lf2eBQWVJ/V?=
 =?us-ascii?Q?o5Y74WORPEbi63Rk23IL7sITLWe99k6WLxex/NBhNlhRqCJriAAuyZRFoX5C?=
 =?us-ascii?Q?SEGLprKvDAlYPyV3Ssjdex6DDAisJBXjKMDaycf6HSLle5UoY5pLRfmFOhUL?=
 =?us-ascii?Q?mC07tb4v/yMVwA5bVb8VGpegrzDDM6Fj2198aQOrf/N1Pqju4E/aSbXgpwX5?=
 =?us-ascii?Q?n6QejJj7Ty50TfYA/+X4TJNasWpJmkbEAnkyDrjg/XAnu06zOgC4v9DLcpkj?=
 =?us-ascii?Q?DTP6PRv/WeiJd/6Zgtizuns46kvHskNecrlymP8n2hAZXZdIj+ALP6fByHOk?=
 =?us-ascii?Q?v9TdaRShh3e8zFyxHJznvIegXHN4pSvTWmvU8qfIeMHCjkHf+oOKf9Z0a6HP?=
 =?us-ascii?Q?ekB93YVoyizRWxokouBT1bmkar7yTWxR9tnAhi1duyLQyCJNDRechv+oTBWy?=
 =?us-ascii?Q?TQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 89c607c4-fb7a-4049-18c4-08dbe994af28
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 06:48:20.9018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p0SW5ZZTwh1FfSb/H7CnfDukhqIqzJsf5jBI7iSzoP3TtfduvxFAq/x8zkG/tyzmaTPmoi6XYnxiTMsDMQNnGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6763
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:KASAN:global-out-of-bounds_in_insert_header" on:

commit: 423f75083acd947804c8d5c31ad1e1b5fcb3c020 ("scheduler:  Remove the now superfluous sentinel elements from ctl_table array")
https://github.com/Joelgranados/linux.git jag/sysctl_remove_empty_elem_kernel

in testcase: boot

compiler: gcc-9
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+---------------------------------------------------+------------+------------+
|                                                   | 9bd138a89a | 423f75083a |
+---------------------------------------------------+------------+------------+
| BUG:KASAN:global-out-of-bounds_in_insert_header   | 0          | 14         |
+---------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202311201431.57aae8f3-oliver.sang@intel.com


[ 19.917748][ T1] BUG: KASAN: global-out-of-bounds in insert_header (fs/proc/proc_sysctl.c:236) 
[   19.917748][    T1] Read of size 4 at addr ffffffff86ade6b8 by task swapper/0/1
[   19.917748][    T1]
[   19.917748][    T1] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 6.6.0-rc2-00030-g423f75083acd #1 ed4fb2c8ca9b9b9984dcf540593bcadd356bb772
[   19.917748][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   19.917748][    T1] Call Trace:
[   19.917748][    T1]  <TASK>
[ 19.917748][ T1] dump_stack_lvl (lib/dump_stack.c:108) 
[ 19.917748][ T1] print_address_description+0x66/0x390 
[ 19.917748][ T1] ? insert_header (fs/proc/proc_sysctl.c:236) 
[ 19.917748][ T1] print_report (mm/kasan/report.c:476) 
[ 19.917748][ T1] ? kasan_addr_to_slab (mm/kasan/common.c:35) 
[ 19.917748][ T1] kasan_report (mm/kasan/report.c:590) 
[ 19.917748][ T1] ? insert_header (fs/proc/proc_sysctl.c:236) 
[ 19.917748][ T1] insert_header (fs/proc/proc_sysctl.c:236) 
[ 19.917748][ T1] ? do_raw_spin_lock (arch/x86/include/asm/atomic.h:115 include/linux/atomic/atomic-arch-fallback.h:2155 include/linux/atomic/atomic-instrumented.h:1296 include/asm-generic/qspinlock.h:111 kernel/locking/spinlock_debug.c:115) 
[ 19.917748][ T1] ? __kasan_kmalloc (mm/kasan/common.c:384) 
[ 19.917748][ T1] __register_sysctl_table (fs/proc/proc_sysctl.c:1395) 
[ 19.917748][ T1] ? mix_pool_bytes (drivers/char/random.c:918) 
[ 19.917748][ T1] __register_sysctl_init (fs/proc/proc_sysctl.c:1454) 
[ 19.917748][ T1] ? user_namespace_sysctl_init (kernel/sched/core.c:4717) 
[ 19.917748][ T1] sched_core_sysctl_init (kernel/sched/core.c:4720) 
[ 19.917748][ T1] do_one_initcall (init/main.c:1236) 
[ 19.917748][ T1] ? trace_event_raw_event_initcall_level (init/main.c:1227) 
[ 19.917748][ T1] ? parameq (kernel/params.c:171) 
[ 19.917748][ T1] ? _raw_spin_trylock_bh (include/linux/spinlock_api_smp.h:174 kernel/locking/spinlock.c:146) 
[ 19.917748][ T1] ? kasan_set_track (mm/kasan/common.c:52) 
[ 19.917748][ T1] ? __kasan_kmalloc (mm/kasan/common.c:384) 
[ 19.917748][ T1] kernel_init_freeable (init/main.c:1297 init/main.c:1314 init/main.c:1333 init/main.c:1551) 
[ 19.917748][ T1] ? rest_init (init/main.c:1433) 
[ 19.917748][ T1] kernel_init (init/main.c:1443) 
[ 19.917748][ T1] ? _raw_spin_unlock_irq (arch/x86/include/asm/irqflags.h:42 arch/x86/include/asm/irqflags.h:77 include/linux/spinlock_api_smp.h:159 kernel/locking/spinlock.c:202) 
[ 19.917748][ T1] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 19.917748][ T1] ? rest_init (init/main.c:1433) 
[ 19.917748][ T1] ret_from_fork_asm (arch/x86/entry/entry_64.S:312) 
[   19.917748][    T1]  </TASK>
[   19.917748][    T1]
[   19.917748][    T1] The buggy address belongs to the variable:
[ 19.917748][ T1] sched_core_sysctls+0x18/0x20 
[   19.917748][    T1]
[   19.917748][    T1] The buggy address belongs to the physical page:
[   19.917748][    T1] page:ffffea00001ab780 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x6ade
[   19.917748][    T1] flags: 0x4000000000004000(reserved|zone=1)
[   19.917748][    T1] page_type: 0xffffffff()
[   19.917748][    T1] raw: 4000000000004000 ffffea00001ab788 ffffea00001ab788 0000000000000000
[   19.917748][    T1] raw: 0000000000000000 0000000000000000 00000001ffffffff 0000000000000000
[   19.917748][    T1] page dumped because: kasan: bad access detected
[   19.917748][    T1] page_owner info is not present (never set?)
[   19.917748][    T1]
[   19.917748][    T1] Memory state around the buggy address:
[   19.917748][    T1]  ffffffff86ade580: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[   19.917748][    T1]  ffffffff86ade600: 00 00 00 00 00 00 00 00 f9 f9 f9 f9 04 f9 f9 f9
[   19.917748][    T1] >ffffffff86ade680: f9 f9 f9 f9 f9 f9 f9 f9 00 00 f9 f9 f9 f9 f9 f9
[   19.917748][    T1]                                         ^
[   19.917748][    T1]  ffffffff86ade700: 00 f9 f9 f9 f9 f9 f9 f9 04 f9 f9 f9 f9 f9 f9 f9
[   19.917748][    T1]  ffffffff86ade780: 00 00 f9 f9 f9 f9 f9 f9 00 00 f9 f9 f9 f9 f9 f9
[   19.917748][    T1] ==================================================================
[   19.956634][    T1] Disabling lock debugging due to kernel taint


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20231120/202311201431.57aae8f3-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

