Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6CD3D394
	for <oe-lkp@lists.linux.dev>; Tue, 17 Oct 2023 08:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VspLKC75"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697531443; x=1729067443;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LgiHppljTtYJWvIp91Nkds2bn0slKdHjgrogzgiJk6A=;
  b=VspLKC75NQL71M1GIhWPKKxHjQnm2hKJpqkdcy0obvbrP7/fUsKoWA3+
   99rET7IFQJZ97jZCEyxfSnG4Hx3IaVBmpgyN59TpkIi22/GC3XgsdOdab
   eyJabbhhzXrnZ9gPcrvpHbrk4WvwAyW0XkQNi9OvLqrZ8QkxW6lX44jBR
   IrvTnoo2ao1GPJJ7aAh0Nj2QAqrUfGFsjhYPMGViSqbyKTMwStGk7b1BY
   xxtVJ7/oKXwTQz+fk5xI0SbFcsD3610LTfUNiDGzEMqvq4GieBA9z5+kf
   MCxGf3g/iO5UPAtjKicRZsxb1HB4fhNOd/PnT0zfoyqIWaODQvQOiMZIg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="416812023"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="416812023"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 01:30:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="759718249"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="759718249"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 17 Oct 2023 01:30:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 17 Oct 2023 01:30:41 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 17 Oct 2023 01:30:41 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 17 Oct 2023 01:30:41 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 17 Oct 2023 01:30:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nW9jGI7TBnPZNYk7sBkY9GIYIwShRDo5sVfh7C6IJEmgSwRBCgi0r68J7XiqCWdwvPcOp3nJJfqUga7CBB6Yn5yw83tuntyDTKke7ZoV9RyBYSzq07bOGA2r7PGdTOz2/fDZtzZV4q4QIh7MEHs2nnHC11LE+L1kKnCqMSTfST5Wp0bELTHURcoy4KIXacr0fmBYj0o9CTDEcLIMmzUEgRlQl5OLPGlFtZxHoB3TXtHT4Eyq8BMSBet7X9zpC1jXDRuPaKz2HnTom14yWZfoOo5LaLEX0Ron9vBAfpmAE5tYU0xfhBLer7A8jSaL/bHwXgVt+eSudbEBfXCDY/P06g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FpQolY7uQUVzUdCC/oFeW0CqS4gY1AkNsn/+YHQIWm8=;
 b=N2UA+NvTb5FTN508VAeDaBAK7DneKFNTzbm8kUuqdDymhY5Ejm73gFP/55oqpsXwY3FHIddpXV521SbpvHAM000ClzopPFtoVTlANa9gHC4f3PnG7cIFqiHg7c93d0nOZfkr385Jej/4bQ8i/n/a+G8I9Dpd+SIXzTc5rag75T6Df+QO0iP+IHoM1Ekz+J/25fk9FhO+UVH8Pw5sVDcOCCOWgcm4CGDIOG7s+JLbsPZe1+zdZMiJZScqTd0JX30iMzb+idwxRbej98pSm/Ryofgk5bVC2fqzLiWJbyQV0cBMhqAxAdtRWlufpPupnlpfnyWhciq6XywjPNvG4GQ9Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by IA0PR11MB7791.namprd11.prod.outlook.com (2603:10b6:208:401::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Tue, 17 Oct
 2023 08:30:34 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::134a:412c:eb02:ae17]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::134a:412c:eb02:ae17%5]) with mapi id 15.20.6863.046; Tue, 17 Oct 2023
 08:30:33 +0000
Date: Tue, 17 Oct 2023 16:30:26 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Linux Memory Management List
	<linux-mm@kvack.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Shuah
 Khan" <skhan@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
	<oliver.sang@intel.com>
Subject: [linux-next:master] [usbip]  b8aaf639b4:
 BUG:KASAN:slab-out-of-bounds_in_lockdep_init_map_type
Message-ID: <202310171658.eceb99b8-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR02CA0035.apcprd02.prod.outlook.com
 (2603:1096:4:195::22) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|IA0PR11MB7791:EE_
X-MS-Office365-Filtering-Correlation-Id: ccc7d3b6-1775-4e67-2323-08dbceeb54ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xHM4NigJPE5tJvlM0MzgovNHocU+NmwDvaV547n6nb5HiyTRzvgltxx5OkorwPlEa28h7OYsdYtM07D36M3D1Fw+ZuFtFqLRrs3plnY/QJbi8z3tsdd3ZnzzuJALQOv10glh2ra/Pjia8HnxvEbksooF5bZufEIXK5q+fBQKnz2nDntbqvGmVu93bFtxM/pzZQZa7bUCctF7OZsWQQaU+deg8ckYpgyc0xPyEDlPhux5A1yxPRrSovZ9e/pmigL+XmMZ7ETv/H92iTxhLL/9pOeLBE9AQ6e7ineubNwMbAUGQtuZVflYP4q1tt2XD9pnEmHmGd4F8/qIdDQP7HWNywEuKqM9sRNx+leVDtlV8EcNj21K2wlNkQaxTi2zqhMj02TKC2ZeErjvSaHfENd48lO4w/mBsW+FLO7wfXjUwHgYAby5W7hbRv/h1OZyskobmTwPcq5nvgDjFIob4AeKZG+/Z8oUrlBH/UCxXxiNyCSiT+9ESoxQ6oTZRJjt4jz8Vmc6CqkL2XeFtV81jxgDZrmraCNhrS9ATQfI0K6WVTE3NnpGzGwN2fvVacSZeW7PkafziGNcPS6itRz0NUKJnw1KV4ywvGFAIigTanL/I4bVn33yolRGrAkPR5dbcVRI5Hi0X+orBTHcRkbg0OgA9w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(366004)(136003)(396003)(39860400002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(36756003)(86362001)(26005)(478600001)(2906002)(6486002)(6666004)(6506007)(41300700001)(5660300002)(966005)(82960400001)(38100700002)(2616005)(1076003)(6916009)(8936002)(54906003)(66556008)(66946007)(66476007)(316002)(4326008)(8676002)(83380400001)(6512007)(568244002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aXd/AdwFXhtwKIyTrlEq96tIAqSY9xWunwTI4kRWJCtwCT9ucp+R+cSiuUdr?=
 =?us-ascii?Q?erbvU+yglDHugqMKSBPLP6EhWZ8911moUiWhxauycMsQ0IqXI+wAgkebYDwp?=
 =?us-ascii?Q?R3v/vaOXOIIT4MtMJZjFU+ci8Fpn3r+IBlSM6lRyjSH11St1d06VbCrX+ijc?=
 =?us-ascii?Q?1seXarj4LlSdKyW9obGRxmvEFswfWqTL94ncLkDxXuWhVa70Ax8THMq51fqI?=
 =?us-ascii?Q?5HeoYf67f2gvxxHmPt7GYpYg6UtSgP2/hgIXQ6eIlZJaYz9k8tifjcroF418?=
 =?us-ascii?Q?vjO/GJDDBR9dNDC1Q5uOOCWASRZey+u3zqUiOJQR3qB9nFWjksuzBO8CSM2u?=
 =?us-ascii?Q?9xhLfLIaMiKz6FG1mNjLqZwgWBLpqV+q9WX/HgHhdpovZbUCmPJGmrcIe6Pk?=
 =?us-ascii?Q?h4TRKx/pIx/VUYtmnPX6TALW4f+yqqycsL2lZRZLvjmDs8eh9KHJdhFRbDk6?=
 =?us-ascii?Q?8aMnLyfz49a1Ek/EeFA2YkktZtTJkhz+mM/n1F12ANvZ0gRQmzkW9Yb7dWvr?=
 =?us-ascii?Q?Vd3vEIPhoRL03fCBqwG9rMYnET7dUGaPFscyNZdmDZplez03FAA2G+fozur+?=
 =?us-ascii?Q?DgobfsVU1H5buodG2sISX0M/3LAXyWK89N4w/TYD5zKtWzrOysM6Ciucjsa3?=
 =?us-ascii?Q?ZE3N8b2FnHRevQesH0Ea00ZVrQMEnyDOtE4JCtJU7GzYKd4GAlWcjKt9ovN4?=
 =?us-ascii?Q?hNHoOGv+dBt5vQ4MfX00lGHMYJbb8lA+LAYmDPnXfl7EHXiNOgXhWyH0wt8A?=
 =?us-ascii?Q?9aU2iAvhfzDgOTj9xnJZeZDxz8DYqtJE8y4oLOnHPUMFRyZuz30j2Mr6yE9L?=
 =?us-ascii?Q?9jgMFZjV9Zrkqh/IzytXIs3kxh3aZUJnIRGJk5FV8M4F0eQPQd5c/6vodQ1Z?=
 =?us-ascii?Q?Uoxl0ehZS39FsLuMi8FxNnVv8IhD7Iw2PHfmibcR4odaGsG8AhuXDqz/DBHG?=
 =?us-ascii?Q?SspjC8xVcjE6JuSyTgX6ZUI2fu9SYvR/jcVaVHwU/SIHwuYLR75VkSyroBoD?=
 =?us-ascii?Q?iBTRFCTnxwWwAQj2RDTWx4MSTB8Ls/dzuHwWfL4seRFoLauj6EsgdyVxz/Tt?=
 =?us-ascii?Q?iaYuxRVHVSH3lZQ3gGZDSUeSCkKCly++/FvntRhh3JTRbqpOL9M6WDSvbv4m?=
 =?us-ascii?Q?HnZCj9yjJPB0XSlsKtdcv5TTvpBgdcTMwaxvw4Aoo/t/BDxe1ZgItsPCgA7D?=
 =?us-ascii?Q?JByhz5qA4MR9bxOunGizLoBaQUX6jwat2MH4U1SolDcABLR6+JC82kqP3/Jw?=
 =?us-ascii?Q?CtBeSAh/esuQoAKABk1VSYXWyDlNCvqpWCrlxFhdS5+9uqrjShOc9akVod8m?=
 =?us-ascii?Q?1PYbu4jIo46bRE4rXcw+N45haNBnRIEzZkbOeydpjytnB/C/apJcnxyO75m3?=
 =?us-ascii?Q?95Mv6iFhuVzvouPTcr3ITaprHFUA2znybvN98aAr0UcqjIwoa4/kzLRslihW?=
 =?us-ascii?Q?UHMpzflF4DlEPnMOLZkbGERo4veFyYRb9UhvgDW0FleQ/xDDPP71vhTnfB0X?=
 =?us-ascii?Q?0Ft2cLIsD2VggLnuszN3G52uw+h3YXiq22QVw8xPHDoGg/A+0k4d1TA7fz0c?=
 =?us-ascii?Q?i3uNbBiGmQ+ep5UZjV50UM82leDusSkOdAyPUf6RwovcaIubLsS4ev8GwKW4?=
 =?us-ascii?Q?Ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ccc7d3b6-1775-4e67-2323-08dbceeb54ae
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 08:30:33.8320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tMMw52gL1HmMHRza22KBJYN1JonwDQyS9sk/9uhLyLygdFMWB93pVbuInYADE1/vVNiaGPLZ1/KGqnkeKyKEOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7791
X-OriginatorOrg: intel.com


hi, Andy Shevchenko,

we reported
"[usb:usb-next] [usbip]  b8aaf639b4: BUG:KASAN:slab-out-of-bounds_in_vhci_setup"
on
https://lore.kernel.org/all/202310111714.cb804a0c-oliver.sang@intel.com/
when this commit is still in
https://git.kernel.org/cgit/linux/kernel/git/gregkh/usb.git usb-next

now we noticed it's in linux-next/master, below report FYI.


Hello,

kernel test robot noticed "BUG:KASAN:slab-out-of-bounds_in_lockdep_init_map_type" on:

commit: b8aaf639b403f01d132c9ac1e906c45debfb0218 ("usbip: Use platform_device_register_full()")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

[test failed on linux-next/master f9a6bea131849702d591d18d5c8b8a0eda6f62b3]

in testcase: boot

compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202310171658.eceb99b8-oliver.sang@intel.com


[ 124.077874][ T1] BUG: KASAN: slab-out-of-bounds in lockdep_init_map_type (kernel/locking/lockdep.c:4862) 
[  124.077913][    T1] Write of size 8 at addr ffff88811506ce58 by task swapper/0/1
[  124.077913][    T1]
[  124.077913][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.6.0-rc4-00066-gb8aaf639b403 #1 b7f5a4e58d773035f956074c1d632e313715f9ac
[  124.077913][    T1] Call Trace:
[  124.077913][    T1]  <TASK>
[ 124.077913][ T1] dump_stack_lvl (lib/dump_stack.c:107) 
[ 124.077913][ T1] print_address_description+0x2b/0x3d0 
[ 124.077913][ T1] ? lockdep_init_map_type (kernel/locking/lockdep.c:4862) 
[ 124.077913][ T1] print_report (mm/kasan/report.c:476) 
[ 124.077913][ T1] ? lock_acquired (include/trace/events/lock.h:85 kernel/locking/lockdep.c:6026) 
[ 124.077913][ T1] ? kasan_addr_to_slab (mm/kasan/common.c:35) 
[ 124.077913][ T1] ? lockdep_init_map_type (kernel/locking/lockdep.c:4862) 
[ 124.077913][ T1] kasan_report (mm/kasan/report.c:590) 
[ 124.077913][ T1] ? lockdep_init_map_type (kernel/locking/lockdep.c:4862) 
[ 124.077913][ T1] lockdep_init_map_type (kernel/locking/lockdep.c:4862) 
[ 124.077913][ T1] __raw_spin_lock_init (kernel/locking/spinlock_debug.c:26) 
[ 124.077913][ T1] vhci_start (drivers/usb/usbip/vhci_hcd.c:1185) 
[ 124.077913][ T1] ? vhci_setup (drivers/usb/usbip/vhci_hcd.c:1173) 
[ 124.077913][ T1] usb_add_hcd (drivers/usb/core/hcd.c:2944) 
[ 124.077913][ T1] vhci_hcd_probe (drivers/usb/usbip/vhci_hcd.c:1363) 
[ 124.077913][ T1] platform_probe (drivers/base/platform.c:1410) 
[ 124.077913][ T1] really_probe (drivers/base/dd.c:579 drivers/base/dd.c:658) 
[ 124.077913][ T1] ? acpi_driver_match_device (drivers/acpi/bus.c:956) 
[ 124.077913][ T1] driver_probe_device (drivers/base/dd.c:830) 
[ 124.077913][ T1] __device_attach_driver (drivers/base/dd.c:959) 
[ 124.077913][ T1] ? driver_probe_device (drivers/base/dd.c:922) 
[ 124.077913][ T1] bus_for_each_drv (drivers/base/bus.c:414 drivers/base/bus.c:456) 
[ 124.077913][ T1] ? bus_for_each_dev (drivers/base/bus.c:445) 
[ 124.077913][ T1] ? __lock_acquired (kernel/locking/lockdep.c:339 kernel/locking/lockdep.c:5990) 
[ 124.077913][ T1] __device_attach (drivers/base/dd.c:1032) 
[ 124.077913][ T1] ? device_driver_attach (drivers/base/dd.c:1001) 
[ 124.077913][ T1] ? preempt_count_sub (kernel/sched/core.c:5863 kernel/sched/core.c:5859 kernel/sched/core.c:5881) 
[ 124.077913][ T1] ? _raw_spin_unlock (arch/x86/include/asm/preempt.h:104 include/linux/spinlock_api_smp.h:143 kernel/locking/spinlock.c:186) 
[ 124.077913][ T1] bus_probe_device (drivers/base/bus.c:532) 
[ 124.077913][ T1] device_add (drivers/base/core.c:3631) 
[ 124.077913][ T1] ? __fw_devlink_link_to_consumers+0x1f0/0x1f0 
[ 124.077913][ T1] ? kasan_set_track (mm/kasan/common.c:52) 
[ 124.077913][ T1] ? __kasan_kmalloc (mm/kasan/common.c:374 mm/kasan/common.c:383) 
[ 124.077913][ T1] platform_device_add (drivers/base/platform.c:717) 
[ 124.077913][ T1] platform_device_register_full (drivers/base/platform.c:844) 
[ 124.077913][ T1] ? driver_register (drivers/base/driver.c:258) 
[ 124.077913][ T1] vhci_hcd_init (drivers/usb/usbip/vhci_hcd.c:1532) 
[ 124.077913][ T1] ? _raw_spin_unlock_irqrestore (arch/x86/include/asm/preempt.h:104 include/linux/spinlock_api_smp.h:152 kernel/locking/spinlock.c:194) 
[ 124.077913][ T1] ? usbip_core_init (drivers/usb/usbip/vhci_hcd.c:1507) 
[ 124.077913][ T1] ? rng_is_initialized (drivers/char/random.c:918) 
[ 124.077913][ T1] ? usbip_core_init (drivers/usb/usbip/vhci_hcd.c:1507) 
[ 124.077913][ T1] do_one_initcall (init/main.c:1232) 
[ 124.077913][ T1] ? trace_initcall_level (init/main.c:1223) 
[ 124.077913][ T1] ? parse_one (kernel/params.c:138) 
[ 124.077913][ T1] ? __kmem_cache_alloc_node (mm/slab.h:761 mm/slub.c:3478 mm/slub.c:3517) 
[ 124.077913][ T1] ? kasan_set_track (mm/kasan/common.c:52) 
[ 124.077913][ T1] ? __kasan_kmalloc (mm/kasan/common.c:374 mm/kasan/common.c:383) 
[ 124.077913][ T1] do_initcalls (init/main.c:1293 init/main.c:1310) 
[ 124.077913][ T1] kernel_init_freeable (init/main.c:1549) 
[ 124.077913][ T1] ? rest_init (init/main.c:1429) 
[ 124.077913][ T1] kernel_init (init/main.c:1439) 
[ 124.077913][ T1] ? _raw_spin_unlock_irq (arch/x86/include/asm/preempt.h:104 include/linux/spinlock_api_smp.h:160 kernel/locking/spinlock.c:202) 
[ 124.077913][ T1] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 124.077913][ T1] ? rest_init (init/main.c:1429) 
[ 124.077913][ T1] ret_from_fork_asm (arch/x86/entry/entry_64.S:312) 
[  124.077913][    T1]  </TASK>
[  124.077913][    T1]
[  124.077913][    T1] Allocated by task 1:
[ 124.077913][ T1] kasan_save_stack (mm/kasan/common.c:46) 
[ 124.077913][ T1] kasan_set_track (mm/kasan/common.c:52) 
[ 124.077913][ T1] __kasan_kmalloc (mm/kasan/common.c:374 mm/kasan/common.c:383) 
[ 124.077913][ T1] __kmalloc_node_track_caller (mm/slab_common.c:1024 mm/slab_common.c:1043) 
[ 124.077913][ T1] kmemdup (mm/util.c:131) 
[ 124.077913][ T1] platform_device_add_data (include/linux/fortify-string.h:765 drivers/base/platform.c:638) 
[ 124.077913][ T1] platform_device_register_full (drivers/base/platform.c:832) 
[ 124.077913][ T1] vhci_hcd_init (drivers/usb/usbip/vhci_hcd.c:1532) 
[ 124.077913][ T1] do_one_initcall (init/main.c:1232) 
[ 124.077913][ T1] do_initcalls (init/main.c:1293 init/main.c:1310) 
[ 124.077913][ T1] kernel_init_freeable (init/main.c:1549) 
[ 124.077913][ T1] kernel_init (init/main.c:1439) 
[ 124.077913][ T1] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 124.077913][ T1] ret_from_fork_asm (arch/x86/entry/entry_64.S:312) 
[  124.077913][    T1]
[  124.077913][    T1] The buggy address belongs to the object at ffff88811506ce38
[  124.077913][    T1]  which belongs to the cache kmalloc-8 of size 8
[  124.077913][    T1] The buggy address is located 24 bytes to the right of
[  124.077913][    T1]  allocated 8-byte region [ffff88811506ce38, ffff88811506ce40)
[  124.077913][    T1]
[  124.077913][    T1] The buggy address belongs to the physical page:
[  124.077913][    T1] page:(____ptrval____) refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x11506c
[  124.077913][    T1] flags: 0x20000000000800(slab|node=0|zone=2)
[  124.077913][    T1] page_type: 0xffffffff()
[  124.077913][    T1] raw: 0020000000000800 ffff888100041280 dead000000000122 0000000000000000
[  124.077913][    T1] raw: 0000000000000000 0000000080660066 00000001ffffffff 0000000000000000
[  124.077913][    T1] page dumped because: kasan: bad access detected
[  124.077913][    T1] page_owner tracks the page as allocated
[  124.077913][    T1] page last allocated via order 0, migratetype Unmovable, gfp_mask 0x12cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY), pid 27, tgid 27 (kworker/u4:1), ts 45269241050, free_ts 0
[ 124.077913][ T1] get_page_from_freelist (mm/page_alloc.c:1545 mm/page_alloc.c:3170) 
[ 124.077913][ T1] __alloc_pages (mm/page_alloc.c:4426) 
[ 124.077913][ T1] allocate_slab (mm/slub.c:1870 mm/slub.c:2017) 
[ 124.077913][ T1] ___slab_alloc (mm/slub.c:3224 (discriminator 3)) 
[ 124.077913][ T1] __kmem_cache_alloc_node (mm/slub.c:3322 mm/slub.c:3375 mm/slub.c:3468 mm/slub.c:3517) 
[ 124.077913][ T1] __kmalloc_node_track_caller (include/linux/kasan.h:198 mm/slab_common.c:1023 mm/slab_common.c:1043) 
[ 124.077913][ T1] kstrdup (mm/util.c:62) 
[ 124.077913][ T1] eventfs_prepare_ef+0x6a/0x300 


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20231017/202310171658.eceb99b8-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

