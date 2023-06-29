Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5E1566A
	for <oe-lkp@lists.linux.dev>; Thu, 29 Jun 2023 07:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688024145; x=1719560145;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Epw9Z1+lgfN59m7Eq/kMZTB8HNEj05p1hxxjsNRWY1g=;
  b=JyE4JIOUPOxMqmHOOYNAladXq8Qzzs0aQtI1PZpV61H63FNzCSAxsVPY
   4N9SiUzdR9z4nCqWPY7WOzx5MxPUBZRm1TMpAzSIBzuzXH1J9Q06DchUB
   YnCleYi9WeqPd9VzWkDAPmbAiJEOkis/8eN3iM/QZky31huJBMqEJxLPC
   GGr5WJJVbfDoLinyo64KAzMyduYwpwTmahGtd6ECjvnLjrdWUfqbuVMef
   whl1VD24Wq3QvbwyBH03OtYd4aVq5aespw1Nfj9CZo57xRwziFG8Q0mtl
   jALraaL/skeYDJGZvV7FgcgJI2z7OR8NA8eQ+MIHeLT8jsskW5miZ4jzb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="362082526"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="xz'341?scan'341,208,341";a="362082526"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 00:35:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="841362002"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="xz'341?scan'341,208,341";a="841362002"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga004.jf.intel.com with ESMTP; 29 Jun 2023 00:35:34 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 29 Jun 2023 00:35:34 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 29 Jun 2023 00:35:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 29 Jun 2023 00:35:33 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 29 Jun 2023 00:35:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bRlMr9tH174EaESMg7QL0UW7/MbAHeQY4Cvz5TVHym2hfx6VGgS3eLYzvORTGsWoRLyGy5uChKojnRYaOTQBBxJyrPHoPhJoq6faYx6cDbAeZT88M3YhaRaxIC6zQAV+XfSV54rui93Z6RD8nHtYPTbB0KTQ4y0H82F8vnCyI2ueBf4MActb7JLVMTwUQrvMZXNJFsKfdHRKYGzs9oSf7QHW6yDDTJRmURNP2ivHWeatRoScLZYecjxsOMYyFUVbf1NPcDRlrelvUvwvjWYWqs9JclNW3VBfk8GdvE3BZovcLpr+28QJ4p4HpswPEPcN9BubJbmLe4VRFtbMr/UqTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PApJi/nNjbjpwDPgpCP1Ds7M2OE/1YoCNS162vg/eu4=;
 b=dLNhgPua1zyZpGIbI+p4umzZOUXzRviOsFEmntp7/58gDd/bOulud9e0xa9cMwXQAKPgb9QbScGboMNxHls53oWV8OgXBlgmCdnn3eAE8N6BwpAHFIc5GZB2Uy2l4SVh0pL34Z1oenz87yJbIH1wbuaZzF3CRMK6ONG+BvNB2+oORbYy5nq334q1osmT9LKV4PXbynSir/rIT0rYUKXr1RJlqNaVC4LJtdzQGKtJ4YyeIDb+G2JL4F23oPzqp3sTMCEyTKsVMCB+YmX0mqpfP+sVOj3BYyt5SvwaUh5XlO1rJrDP686VfuOH5B7VPqKOjAVHbHyZh4N6TJBHcy+unQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by CH3PR11MB8316.namprd11.prod.outlook.com (2603:10b6:610:17b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Thu, 29 Jun
 2023 07:35:29 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::35cf:8518:48ea:b10a]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::35cf:8518:48ea:b10a%7]) with mapi id 15.20.6455.028; Thu, 29 Jun 2023
 07:35:29 +0000
Date: Thu, 29 Jun 2023 15:35:19 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Joel Granados <j.granados@samsung.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [joelgranados:jag/sysctl-testing-for-0day] [networking] d9c5a8f98c:
 WARNING:possible_circular_locking_dependency_detected
Message-ID: <202306291543.91cb0c44-oliver.sang@intel.com>
Content-Type: multipart/mixed; boundary="w4P4cHKAfxD1kdF6"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI1PR02CA0042.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::17) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|CH3PR11MB8316:EE_
X-MS-Office365-Filtering-Correlation-Id: e1d15dfe-8a8e-4375-730c-08db787368f4
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 276Mv3/izdObjMZR1YuSIhqfX55+mG5u6JY09P9Z67WRZ1u4TWkogeOmixQ3wac7ncqDP+cie3BTkWkkB6sssIzF90fZcjUggax1NAW3qaoDF6UBHAwMeFnoWYdHDT7dTVsLCCQhXUSMFqXZ2XVGqRjGuz4X4v9sA+pkwTi2m9BC63M3SK6ahTpUNIkk1LCXzXMyuwTHH5Z0ocR3eMY1vMnCZj3v9qUurZVRWmkK+vxsmq7XRfbdxlULrEevxQMr3TC223si4FKFH5KgYdYUhaYvVm0F/oeoz4cd3pmgX7HM4Mes5qUriedkrNzx0mVTImJ4VDTBfTrDrrXo7v1UiYDZzp4rmuPIbp3s1BHPSfRthZcMnO8hyZH8YjkviFkHR4ae+XUFBEM6ZB1mQJpP6wE/32PrDyuez8GvvogY2AqzY3AB2tywSBRNHIVBqjrB+fykjRkCJqbzThvnalgzIil316zdcr8BU3BKgubjmOetky4i+tdIUTtEkLCL4MmTYCUZ7q086lu42QrFoDB08R8PQmE99gl/iEz/8xLGI52Q8HdBLIYzXJJC7HUaygHnxqguTrGVDoTdckDL7l/eyPZ/eU3LIhhHKbxzsqbNECXizyIUsiK7CBQN1Kq/zelwGzqtc/jKMDbg9MDWSeyoEYh+JwUwSHDOQUgEZzRCemg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(366004)(39860400002)(346002)(396003)(451199021)(2906002)(6486002)(2616005)(186003)(44144004)(38100700002)(107886003)(82960400001)(6666004)(6512007)(26005)(1076003)(83380400001)(6506007)(30864003)(966005)(41300700001)(86362001)(316002)(478600001)(36756003)(66556008)(4326008)(66946007)(66476007)(6916009)(235185007)(5660300002)(8676002)(8936002)(2700100001)(505234007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DafhMwDvhxRzf8G0tDW3LISdKSdFDmZFmHxD9IbB3E2outinITQzbCSY2JyR?=
 =?us-ascii?Q?WzmzLGp6IQHBJqPEjM+V8OvBv6wV3/PzDln3HsDB9fHFkEfRxDUGMmkiT5/n?=
 =?us-ascii?Q?vcDDoGKvHfCMQBjZcrcnrAvSPHHkrmaeO+ickLo3mxnkWrlHkG1fy3N1dQiD?=
 =?us-ascii?Q?N7KfBpuROVH4vIwehRGTiJFZhf+mq18rM3kIW3sdX46OXC+ONnOzPNEPM3lh?=
 =?us-ascii?Q?UClRQ7IYP0o60yN8xkbxjGWH4S19lh7ULjxLVUdUESUHSOdy6kVLvxwwq/HR?=
 =?us-ascii?Q?HNuyuYalKwy4GsLw9PriMEYpKWizLTGwCFTWUYnNiyTGbsuFUfGYckRImunC?=
 =?us-ascii?Q?Fn5nwojsUDtcoTYopn+UKvF7+8MVnSc626X4VD84wP6MQhTlDMM2izwEAoZ7?=
 =?us-ascii?Q?zfD/SylGyx/DQg+md2djC0TcsGtNDDONcRYejVTrSLGKAMPvQNlCjOgU43si?=
 =?us-ascii?Q?Ina7shndUmJFLjqx6IBXZU9HlrSkLgsQuDhSm/+ccDbVFntl8CM1CssOa3Rm?=
 =?us-ascii?Q?lIwUMvPByvZbgzFEyECh88fOZQ1hkgOU6qiAO5I4nZM9DrgQyLLtIczsAlZD?=
 =?us-ascii?Q?LHkSP5UOoR4KLwjwLzDVyggcn1FG7zFj6m+mLiwBELexiaJj3jwjtuY+4Ie3?=
 =?us-ascii?Q?3TLPnVXS/MHsyyRuVDd3YC5WYzkSCPZzK04/D/OjXb0zp5k8tHGFl2+ZTijV?=
 =?us-ascii?Q?VOiI0z9dl00+p9XoYN7QbDol5Vs35UXWtWQQUsXXoMrqTQsIcbZjf7nHPcwQ?=
 =?us-ascii?Q?ryW/8lR3u6ThrG3l3+62sVVRP4iyvXob5Mv64Pf374+Xs/Sadihi4DCawcsA?=
 =?us-ascii?Q?19rkw7DCq6ywBQ86VUL/UIffNakG1S0q5LIXDTSYxXMw589hidITUaie+jSn?=
 =?us-ascii?Q?9oA2g2wLgCX8NbqMVYe3zyUTrw9daG7+iDF75kj8uaMYT9hs6/QCotPGQI/3?=
 =?us-ascii?Q?FbCJlEJc2glnd0N3kCa58qQaLwSyy15eOP/crbfwt2bZA42fKiqeq4UMH9/L?=
 =?us-ascii?Q?XwOYAa42RK3wZYKJzQ4TBCtZdm9FxJ0GT27XQQAaoNU5wn+P92WvnqmMAD9i?=
 =?us-ascii?Q?ssEwodOdC8Uk2T0nolLnyumNbT1kslAVy7XSWM1dZ+un647YZTyVQ+wbTo91?=
 =?us-ascii?Q?tAQoStVj8VLB8Jr3+YIduAYf1j7SNCDtvvE9RTlFe2Tjl1jVri8oW17D6MrK?=
 =?us-ascii?Q?dRMm9AItfXeH7u5TYupXOQX9VThwvE6zWFMyszGIKJ6rqTZvOzIrvqA0Yhto?=
 =?us-ascii?Q?7ldO8B+rb6iU38naEXrwfTfUkcj4Yk3Ty3kk01uOHxtXpvOimUTwriY0C/kR?=
 =?us-ascii?Q?NDQ9rCq4dqJ/4Ch3qX7sbSSs5AOM7eQsIHOcRVB+nFWqe8LinfE+yQZo9FyX?=
 =?us-ascii?Q?Rx1ZJoLpkSVhvMD5331jrBcdtO5ApxpHAi23UnrQ4N8C7cK0u0J1f9F4TU1A?=
 =?us-ascii?Q?3aOeZzmb3FbkeZNZFP6m4PFBKPiWobKq1X3RjMrvZI4wGxTGbIGKkemJTqcO?=
 =?us-ascii?Q?yY2n/Kzbb8Do68MeeVmre8tWx4Fff94p2ssGxBCemGSnJVWNdR6j2trPWt00?=
 =?us-ascii?Q?ktejQB3PTHL0DlTNWQqQebyaIV7rDJoWC6cDcDOdL/74LOYcdyf8aDcRdDPY?=
 =?us-ascii?Q?Xg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1d15dfe-8a8e-4375-730c-08db787368f4
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 07:35:28.8189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hR/Mi83/cYb+kMGDWCmfnWgSK8XLS51VT1iMSdpXN4t5+4FMaDIa3LyK+j89dOp9OcwOo4Tr3rty2yX/AcFCVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8316
X-OriginatorOrg: intel.com

--w4P4cHKAfxD1kdF6
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline



Hello,

kernel test robot noticed "WARNING:possible_circular_locking_dependency_detected" on:

commit: d9c5a8f98c16b522847b83bfb9c4f201d31db50d ("networking: Update to register_net_sysctl_sz")
https://github.com/Joelgranados/linux.git jag/sysctl-testing-for-0day

in testcase: boot

compiler: clang-15
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202306291543.91cb0c44-oliver.sang@intel.com



[   24.402979][   T69] ======================================================
[   24.402980][   T69] WARNING: possible circular locking dependency detected
[   24.402982][   T69] 6.4.0-rc2-00029-gd9c5a8f98c16 #1 Not tainted
[   24.402984][   T69] ------------------------------------------------------
[   24.402984][   T69] kworker/1:2/69 is trying to acquire lock:
[   24.402987][   T69] c2be7a48 (console_owner){-.-.}-{0:0}, at: console_lock_spinning_enable+0x22/0x40
[   24.403011][   T69]
[   24.403011][   T69] but task is already holding lock:
[   24.403012][   T69] c3c0d590 (&n->list_lock){-.-.}-{2:2}, at: free_to_partial_list+0x33/0x550
[   24.403020][   T69]
[   24.403020][   T69] which lock already depends on the new lock.
[   24.403020][   T69]
[   24.403021][   T69]
[   24.403021][   T69] the existing dependency chain (in reverse order) is:
[   24.403022][   T69]
[   24.403022][   T69] -> #7 (&n->list_lock){-.-.}-{2:2}:
[   24.403026][   T69]        _raw_spin_lock_irqsave+0x43/0x60
[   24.403032][   T69]        ___slab_alloc+0x3a8/0xc60
[   24.403035][   T69]        kmem_cache_alloc+0x228/0x2d0
[   24.403038][   T69]        debug_objects_fill_pool+0x173/0x3d0
[   24.403043][   T69]        debug_object_activate+0x4e/0x340
[   24.403046][   T69]        enqueue_hrtimer+0x16/0xc0
[   24.403049][   T69]        __hrtimer_run_queues+0x2b5/0x350
[   24.403055][   T69]        hrtimer_interrupt+0x137/0x300
[   24.403059][   T69]        __sysvec_apic_timer_interrupt+0xcb/0x1e0
[   24.403062][   T69]        sysvec_apic_timer_interrupt+0x1a/0x30
[   24.403067][   T69]        handle_exception_return+0x0/0xc5
[   24.403087][   T69]        lock_acquire+0x14b/0x220
[   24.403093][   T69]        fs_reclaim_acquire+0x47/0x80
[   24.403098][   T69]        slab_pre_alloc_hook+0x1e/0x290
[   24.403101][   T69]        kmem_cache_alloc+0x33/0x2d0
[   24.403104][   T69]        getname_flags+0x20/0x130
[   24.403109][   T69]        getname+0xc/0x10
[   24.403113][   T69]        do_sys_openat2+0x4f/0x140
[   24.403117][   T69]        __ia32_sys_openat+0x80/0x90
[   24.403121][   T69]        do_int80_syscall_32+0x52/0x80
[   24.403125][   T69]        restore_all_switch_stack+0x0/0xe2
[   24.403130][   T69]
[   24.403130][   T69] -> #6 (hrtimer_bases.lock){-.-.}-{2:2}:
[   24.403133][   T69]        _raw_spin_lock_irqsave+0x43/0x60
[   24.403137][   T69]        hrtimer_start_range_ns+0x40/0x2d0
[   24.403142][   T69]        enqueue_task_rt+0x333/0x510
[   24.403148][   T69]        enqueue_task+0xbb/0x310
[   24.403152][   T69]        ttwu_do_activate+0xa6/0x310
[   24.403155][   T69]        sched_ttwu_pending+0xee/0x200
[   24.403159][   T69]        __flush_smp_call_function_queue+0x14f/0x1e0
[   24.403165][   T69]        generic_smp_call_function_single_interrupt+0xd/0x10
[   24.403169][   T69]        __sysvec_call_function_single+0x78/0xf0
[   24.403175][   T69]        sysvec_call_function_single+0x18/0x30
[   24.403180][   T69]        handle_exception_return+0x0/0xc5
[   24.403184][   T69]        default_idle+0x15/0x20
[   24.403186][   T69]        arch_cpu_idle+0x8/0x10
[   24.403188][   T69]        default_idle_call+0x63/0x90
[   24.403191][   T69]        do_idle+0xc3/0x1e0
[   24.403194][   T69]        cpu_startup_entry+0x25/0x30
[   24.403198][   T69]        start_secondary+0x87/0xa0
[   24.403201][   T69]        startup_32_smp+0x156/0x160
[   24.403204][   T69]
[   24.403204][   T69] -> #5 (&rt_b->rt_runtime_lock){-...}-{2:2}:
[   24.403208][   T69]        _raw_spin_lock+0x25/0x40
[   24.403211][   T69]        rq_online_rt+0x4a/0xc0
[   24.403215][   T69]        sched_cpu_activate+0x1da/0x290
[   24.403217][   T69]        cpuhp_invoke_callback+0x204/0x5a0
[   24.403221][   T69]        cpuhp_thread_fun+0x145/0x1c0
[   24.403224][   T69]        smpboot_thread_fn+0x185/0x240
[   24.403229][   T69]        kthread+0xd8/0xf0
[   24.403234][   T69]        ret_from_fork+0x19/0x30
[   24.403237][   T69]
[   24.403237][   T69] -> #4 (&rq->__lock){-.-.}-{2:2}:
[   24.403241][   T69]        _raw_spin_lock_nested+0x28/0x40
[   24.403244][   T69]        raw_spin_rq_lock_nested+0x60/0x70
[   24.403248][   T69]        task_fork_fair+0x31/0x180
[   24.403251][   T69]        sched_cgroup_fork+0xb2/0xd0
[   24.403255][   T69]        copy_process+0xcc9/0x1310
[   24.403259][   T69]        kernel_clone+0xc1/0x2f0
[   24.403262][   T69]        user_mode_thread+0xac/0xc0
[   24.403266][   T69]        rest_init+0x1a/0x190
[   24.403268][   T69]        arch_call_rest_init+0x8/0x10
[   24.403271][   T69]        start_kernel+0x2f8/0x370
[   24.403274][   T69]        i386_start_kernel+0x219/0x230
[   24.403278][   T69]        startup_32_smp+0x156/0x160
[   24.403281][   T69]
[   24.403281][   T69] -> #3 (&p->pi_lock){-.-.}-{2:2}:
[   24.403284][   T69]        _raw_spin_lock_irqsave+0x43/0x60
[   24.403288][   T69]        try_to_wake_up+0x38/0x700
[   24.403292][   T69]        default_wake_function+0x17/0x30
[   24.403296][   T69]        woken_wake_function+0x16/0x20
[   24.403301][   T69]        __wake_up_common+0xb8/0x150
[   24.403305][   T69]        __wake_up+0x5d/0x80
[   24.403308][   T69]        tty_wakeup+0x4d/0x60
[   24.403317][   T69]        tty_port_default_wakeup+0x4a/0x70
[   24.403321][   T69]        tty_port_tty_wakeup+0xc/0x10
[   24.403324][   T69]        uart_write_wakeup+0x12/0x20
[   24.403327][   T69]        serial8250_tx_chars+0x158/0x180
[   24.403331][   T69]        serial8250_handle_irq+0x118/0x150
[   24.403334][   T69]        serial8250_default_handle_irq+0x17/0x20
[   24.403338][   T69]        serial8250_interrupt+0x5a/0xf0
[   24.403341][   T69]        __handle_irq_event_percpu+0xc8/0x270
[   24.403345][   T69]        handle_irq_event+0x26/0x60
[   24.403348][   T69]        handle_edge_irq+0xa7/0x1a0
[   24.403351][   T69]        __handle_irq+0x68/0x90
[   24.403355][   T69]        __common_interrupt+0x95/0x120
[   24.403358][   T69]        common_interrupt+0x24/0x40
[   24.403362][   T69]        asm_common_interrupt+0x11a/0x120
[   24.403366][   T69]        default_idle+0x15/0x20
[   24.403368][   T69]        arch_cpu_idle+0x8/0x10
[   24.403371][   T69]        default_idle_call+0x63/0x90
[   24.403373][   T69]        do_idle+0xc3/0x1e0
[   24.403377][   T69]        cpu_startup_entry+0x25/0x30
[   24.403380][   T69]        start_secondary+0x87/0xa0
[   24.403384][   T69]        startup_32_smp+0x156/0x160
[   24.403387][   T69]
[   24.403387][   T69] -> #2 (&tty->write_wait){-.-.}-{2:2}:
[   24.403391][   T69]        _raw_spin_lock_irqsave+0x43/0x60
[   24.403395][   T69]        __wake_up+0x47/0x80
[   24.403399][   T69]        tty_wakeup+0x4d/0x60
[   24.403403][   T69]        tty_port_default_wakeup+0x4a/0x70
[   24.403406][   T69]        tty_port_tty_wakeup+0xc/0x10
[   24.403409][   T69]        uart_write_wakeup+0x12/0x20
[   24.403412][   T69]        serial8250_tx_chars+0x158/0x180
[   24.403415][   T69]        serial8250_handle_irq+0x118/0x150
[   24.403419][   T69]        serial8250_default_handle_irq+0x17/0x20
[   24.403422][   T69]        serial8250_interrupt+0x5a/0xf0
[   24.403426][   T69]        __handle_irq_event_percpu+0xc8/0x270
[   24.403429][   T69]        handle_irq_event+0x26/0x60
[   24.403433][   T69]        handle_edge_irq+0xa7/0x1a0
[   24.403435][   T69]        __handle_irq+0x68/0x90
[   24.403437][   T69]        __common_interrupt+0x95/0x120
[   24.403440][   T69]        common_interrupt+0x24/0x40
[   24.403443][   T69]        asm_common_interrupt+0x11a/0x120
[   24.403447][   T69]        __do_softirq+0xb2/0x3f1
[   24.403451][   T69]        do_softirq_own_stack+0x27/0x30
[   24.403454][   T69]        __irq_exit_rcu+0xa2/0xe0
[   24.403457][   T69]        irq_exit_rcu+0x8/0x20
[   24.403460][   T69]        sysvec_apic_timer_interrupt+0x1f/0x30
[   24.403464][   T69]        handle_exception_return+0x0/0xc5
[   24.403468][   T69]        default_idle+0x15/0x20
[   24.403471][   T69]        arch_cpu_idle+0x8/0x10
[   24.403473][   T69]        default_idle_call+0x63/0x90
[   24.403475][   T69]        do_idle+0xc3/0x1e0
[   24.403479][   T69]        cpu_startup_entry+0x25/0x30
[   24.403482][   T69]        start_secondary+0x87/0xa0
[   24.403487][   T69]        startup_32_smp+0x156/0x160
[   24.403489][   T69]
[   24.403489][   T69] -> #1 (&port_lock_key){-.-.}-{2:2}:
[   24.403493][   T69]        _raw_spin_lock_irqsave+0x43/0x60
[   24.403497][   T69]        serial8250_console_write+0x58/0x550
[   24.403500][   T69]        univ8250_console_write+0x2b/0x40
[   24.403503][   T69]        console_flush_all+0x21c/0x3c0
[   24.403506][   T69]        console_unlock+0x65/0xd0
[   24.403509][   T69]        vprintk_emit+0x6c/0xd0
[   24.403511][   T69]        vprintk_default+0x10/0x20
[   24.403514][   T69]        vprintk+0x4b/0x50
[   24.403516][   T69]        _printk+0x14/0x20
[   24.403519][   T69]        register_console+0x3e6/0x460
[   24.403522][   T69]        univ8250_console_init+0x22/0x30
[   24.403525][   T69]        console_init+0xdc/0x180
[   24.403530][   T69]        start_kernel+0x21c/0x370
[   24.403532][   T69]        i386_start_kernel+0x219/0x230
[   24.403536][   T69]        startup_32_smp+0x156/0x160
[   24.403538][   T69]
[   24.403538][   T69] -> #0 (console_owner){-.-.}-{0:0}:
[   24.403541][   T69]        __lock_acquire+0x1381/0x2c30
[   24.403545][   T69]        lock_acquire+0x101/0x220
[   24.403548][   T69]        console_lock_spinning_enable+0x3b/0x40
[   24.403552][   T69]        console_flush_all+0x210/0x3c0
[   24.403555][   T69]        console_unlock+0x65/0xd0
[   24.403558][   T69]        vprintk_emit+0x6c/0xd0
[   24.403560][   T69]        vprintk_default+0x10/0x20
[   24.403563][   T69]        vprintk+0x4b/0x50
[   24.403565][   T69]        _printk+0x14/0x20
[   24.403568][   T69]        slab_bug+0x26/0x60
[   24.403571][   T69]        check_bytes_and_report+0x7a/0xf0
[   24.403575][   T69]        check_object+0x2b9/0x2e0
[   24.403578][   T69]        free_to_partial_list+0x11e/0x550
[   24.403581][   T69]        __slab_free+0x32/0x1f0
[   24.403584][   T69]        kmem_cache_free_bulk+0x5ae/0x600
[   24.403587][   T69]        kvfree_rcu_bulk+0xfc/0x200
[   24.403591][   T69]        kfree_rcu_monitor+0x1eb/0x490
[   24.403594][   T69]        process_one_work+0x214/0x3d0
[   24.403597][   T69]        worker_thread+0x22b/0x400
[   24.403599][   T69]        kthread+0xd8/0xf0
[   24.403603][   T69]        ret_from_fork+0x19/0x30
[   24.403606][   T69]
[   24.403606][   T69] other info that might help us debug this:
[   24.403606][   T69]
[   24.403607][   T69] Chain exists of:
[   24.403607][   T69]   console_owner --> hrtimer_bases.lock --> &n->list_lock
[   24.403607][   T69]
[   24.403612][   T69]  Possible unsafe locking scenario:
[   24.403612][   T69]
[   24.403613][   T69]        CPU0                    CPU1
[   24.403614][   T69]        ----                    ----
[   24.403614][   T69]   lock(&n->list_lock);
[   24.403616][   T69]                                lock(hrtimer_bases.lock);
[   24.403618][   T69]                                lock(&n->list_lock);
[   24.403620][   T69]   lock(console_owner);
[   24.403622][   T69]
[   24.403622][   T69]  *** DEADLOCK ***
[   24.403622][   T69]
[   24.403623][   T69] 6 locks held by kworker/1:2/69:
[   24.403625][   T69]  #0: c3c193a8 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work+0x178/0x3d0
[   24.403633][   T69]  #1: c7aedf30 ((work_completion)(&(&krcp->monitor_work)->work)){+.+.}-{0:0}, at: process_one_work+0x19a/0x3d0
[   24.403640][   T69]  #2: c2beada0 (rcu_callback){....}-{0:0}, at: rcu_lock_acquire+0x0/0x20
[   24.403646][   T69]  #3: c3c0d590 (&n->list_lock){-.-.}-{2:2}, at: free_to_partial_list+0x33/0x550
[   24.403653][   T69]  #4: c28c7754 (console_lock){+.+.}-{0:0}, at: vprintk_emit+0x63/0xd0
[   24.403660][   T69]  #5: c28c761c (console_srcu){....}-{0:0}, at: rcu_lock_acquire+0x0/0x20
[   24.403666][   T69]
[   24.403666][   T69] stack backtrace:
[   24.403668][   T69] CPU: 1 PID: 69 Comm: kworker/1:2 Not tainted 6.4.0-rc2-00029-gd9c5a8f98c16 #1 dff000342694c2673fafda36c4b68bccbb7a397d
[   24.403673][   T69] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   24.403675][   T69] Workqueue: events kfree_rcu_monitor
[   24.403679][   T69] Call Trace:
[   24.403682][   T69]  dump_stack_lvl+0x77/0xb0
[   24.403687][   T69]  dump_stack+0xd/0x20
[   24.403690][   T69]  print_circular_bug+0x2a5/0x2b0
[   24.403696][   T69]  check_noncircular+0xe2/0xf0
[   24.403702][   T69]  __lock_acquire+0x1381/0x2c30
[   24.403714][   T69]  lock_acquire+0x101/0x220
[   24.403719][   T69]  ? console_lock_spinning_enable+0x22/0x40
[   24.403724][   T69]  ? console_lock_spinning_enable+0x22/0x40
[   24.403729][   T69]  console_lock_spinning_enable+0x3b/0x40
[   24.403733][   T69]  ? console_lock_spinning_enable+0x22/0x40
[   24.403736][   T69]  console_flush_all+0x210/0x3c0
[   24.403742][   T69]  console_unlock+0x65/0xd0
[   24.403747][   T69]  vprintk_emit+0x6c/0xd0
[   24.403751][   T69]  vprintk_default+0x10/0x20
[   24.403755][   T69]  vprintk+0x4b/0x50
[   24.403759][   T69]  _printk+0x14/0x20
[   24.403762][   T69]  slab_bug+0x26/0x60
[   24.403767][   T69]  check_bytes_and_report+0x7a/0xf0
[   24.403772][   T69]  check_object+0x2b9/0x2e0
[   24.403778][   T69]  free_to_partial_list+0x11e/0x550
[   24.403784][   T69]  __slab_free+0x32/0x1f0
[   24.403788][   T69]  ? kvfree_rcu_bulk+0xfc/0x200
[   24.403793][   T69]  kmem_cache_free_bulk+0x5ae/0x600
[   24.403797][   T69]  ? kvfree_rcu_bulk+0xfc/0x200
[   24.403800][   T69]  ? kvfree_rcu_bulk+0xfc/0x200
[   24.403806][   T69]  kvfree_rcu_bulk+0xfc/0x200
[   24.403809][   T69]  kfree_rcu_monitor+0x1eb/0x490
[   24.403815][   T69]  process_one_work+0x214/0x3d0
[   24.403821][   T69]  worker_thread+0x22b/0x400
[   24.403826][   T69]  kthread+0xd8/0xf0
[   24.403830][   T69]  ? pr_cont_work+0x170/0x170
[   24.403834][   T69]  ? kthread_unuse_mm+0xa0/0xa0
[   24.403838][   T69]  ret_from_fork+0x19/0x30
[   24.580217][   T69] BUG kmalloc-cg-512 (Not tainted): kmalloc Redzone overwritten
[   24.581249][   T69] -----------------------------------------------------------------------------
[   24.581249][   T69]
[   24.582698][   T69] 0xec1db330-0xec1db33f @offset=13104. First byte 0x1 instead of 0xcc
[   24.583774][   T69] Allocated in __register_sysctl_table+0x26/0x660 age=4381 cpu=1 pid=151
[   24.584879][   T69]  __kmalloc+0x8a/0x1d0
[   24.585456][   T69]  __register_sysctl_table+0x26/0x660
[   24.586162][   T69]  register_net_sysctl_sz+0x149/0x170
[   24.586871][   T69]  neigh_sysctl_register+0x1b6/0x1f0
[   24.587590][   T69]  addrconf_sysctl_register+0x41/0x80
[   24.588297][   T69]  ipv6_add_dev+0x324/0x4e0
[   24.588942][   T69]  addrconf_notify+0x1c8/0x550
[   24.589600][   T69]  notifier_call_chain+0xa2/0x100
[   24.590274][   T69]  raw_notifier_call_chain+0xc/0x20
[   24.590966][   T69]  call_netdevice_notifiers+0x54/0x80
[   24.591655][   T69]  register_netdevice+0x55a/0x690
[   24.592307][   T69]  register_netdev+0x1c/0x30
[   24.592922][   T69]  loopback_net_init+0x36/0x90
[   24.593562][   T69]  ops_init+0x10c/0x1f0
[   24.594140][   T69]  setup_net+0x159/0x320
[   24.594741][   T69]  copy_net_ns+0x11d/0x220
[   24.595386][   T69] Freed in skb_release_data+0x16f/0x180 age=4383 cpu=1 pid=163
[   24.596434][   T69]  __kmem_cache_free+0x318/0x360
[   24.597122][   T69]  kfree+0x95/0xc0
[   24.597683][   T69]  skb_release_data+0x16f/0x180
[   24.598325][   T69]  __kfree_skb+0x42/0xb0
[   24.598913][   T69]  consume_skb+0x72/0xb0
[   24.599529][   T69]  skb_free_datagram+0xa/0x10
[   24.600206][   T69]  __unix_dgram_recvmsg+0x305/0x350
[   24.600911][   T69]  unix_dgram_recvmsg+0x27/0x30
[   24.601593][   T69]  ____sys_recvmsg+0x6f/0x110
[   24.602250][   T69]  ___sys_recvmsg+0x19a/0x1b0
[   24.602906][   T69]  __ia32_sys_socketcall+0x3e5/0x400
[   24.603645][   T69]  do_int80_syscall_32+0x52/0x80
[   24.604344][   T69]  restore_all_switch_stack+0x0/0xe2
[   24.605047][   T69] Slab 0xe73e89c0 objects=21 used=11 fp=0xec1ddc00 flags=0x40010200(slab|head|zone=1)
[   24.606279][   T69] Object 0xec1db200 @offset=12800 fp=0x00000000
[   24.606279][   T69]
[   24.607374][   T69] Redzone  ec1db000: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
[   24.608671][   T69] Redzone  ec1db010: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
[   24.609876][   T69] Redzone  ec1db020: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
[   24.611104][   T69] Redzone  ec1db030: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
[   24.612346][   T69] Redzone  ec1db040: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
[   24.613566][   T69] Redzone  ec1db050: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
[   24.614799][   T69] Redzone  ec1db060: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
[   24.616031][   T69] Redzone  ec1db070: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
[   24.617208][   T69] Redzone  ec1db080: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
[   24.618428][   T69] Redzone  ec1db090: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
[   24.619668][   T69] Redzone  ec1db0a0: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
[   24.620932][   T69] Redzone  ec1db0b0: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
[   24.622150][   T69] Redzone  ec1db0c0: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
[   24.623360][   T69] Redzone  ec1db0d0: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
[   24.624615][   T69] Redzone  ec1db0e0: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
[   24.625891][   T69] Redzone  ec1db0f0: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
[   24.627153][   T69] Redzone  ec1db100: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
[   24.628381][   T69] Redzone  ec1db110: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
[   24.629654][   T69] Redzone  ec1db120: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
[   24.630888][   T69] Redzone  ec1db130: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
[   24.632145][   T69] Redzone  ec1db140: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
[   24.633363][   T69] Redzone  ec1db150: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
[   24.634624][   T69] Redzone  ec1db160: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
[   24.635846][   T69] Redzone  ec1db170: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
[   24.637069][   T69] Redzone  ec1db180: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
[   24.638288][   T69] Redzone  ec1db190: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
[   24.639513][   T69] Redzone  ec1db1a0: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
[   24.640739][   T69] Redzone  ec1db1b0: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
[   24.641950][   T69] Redzone  ec1db1c0: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
[   24.643204][   T69] Redzone  ec1db1d0: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
[   24.644417][   T69] Redzone  ec1db1e0: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
[   24.645640][   T69] Redzone  ec1db1f0: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
[   24.646885][   T69] Object   ec1db200: 04 84 66 ed 10 00 00 00 00 00 00 00 00 00 00 00  ..f.............
[   24.648134][   T69] Object   ec1db210: 00 00 00 00 ea ff ff ff 04 84 66 ed 7c 7d d9 c2  ..........f.|}..
[   24.649370][   T69] Object   ec1db220: 20 30 15 ec 08 5a 22 ec 30 b2 1d ec 00 00 00 00   0...Z".0.......
[   24.650601][   T69] Object   ec1db230: d0 b2 1d ec f0 b2 1d ec 60 b2 1d ec 00 b2 1d ec  ........`.......
[   24.651850][   T69] Object   ec1db240: d0 b2 1d ec c0 b2 1d ec 70 b2 1d ec 00 b2 1d ec  ........p.......
[   24.653062][   T69] Object   ec1db250: 81 b2 1d ec 00 00 00 00 e0 b2 1d ec 00 b2 1d ec  ................
[   24.654297][   T69] Object   ec1db260: d0 b2 1d ec f0 b2 1d ec 00 b3 1d ec 00 b2 1d ec  ................
[   24.655488][   T69] Object   ec1db270: 11 b3 1d ec 20 b3 1d ec 00 00 00 00 00 b2 1d ec  .... ...........
[   24.656671][   T69] Object   ec1db280: a1 b2 1d ec 90 b2 1d ec e0 b2 1d ec 00 b2 1d ec  ................
[   24.657923][   T69] Object   ec1db290: 31 b3 1d ec b0 b2 1d ec 00 00 00 00 00 b2 1d ec  1...............
[   24.659163][   T69] Object   ec1db2a0: 01 00 00 00 d0 b2 1d ec 30 b3 1d ec 00 b2 1d ec  ........0.......
[   24.660436][   T69] Object   ec1db2b0: 31 b3 1d ec 00 00 00 00 00 00 00 00 00 b2 1d ec  1...............
[   24.661668][   T69] Object   ec1db2c0: 11 b3 1d ec 00 00 00 00 00 00 00 00 00 b2 1d ec  ................
[   24.662915][   T69] Object   ec1db2d0: 01 00 00 00 10 b3 1d ec 00 b3 1d ec 00 b2 1d ec  ................
[   24.664175][   T69] Object   ec1db2e0: 30 b3 1d ec 00 00 00 00 00 00 00 00 00 b2 1d ec  0...............
[   24.665395][   T69] Object   ec1db2f0: 01 b3 1d ec 00 00 00 00 00 00 00 00 00 b2 1d ec  ................
[   24.666664][   T69] Object   ec1db300: 21 b3 1d ec 00 00 00 00 30 b3 1d ec 00 b2 1d ec  !.......0.......
[   24.667894][   T69] Object   ec1db310: 21 b3 1d ec 00 00 00 00 00 00 00 00 00 b2 1d ec  !...............
[   24.669153][   T69] Object   ec1db320: 01 00 00 00 00 00 00 00 30 b3 1d ec 00 b2 1d ec  ........0.......
[   24.670413][   T69] Object   ec1db330: 01 00 00 00 00 00 00 00 00 00 00 00 00 b2 1d ec  ................
[   24.674932][   T69] Object   ec1db340: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
[   24.676197][   T69] Object   ec1db350: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
[   24.677429][   T69] Object   ec1db360: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
[   24.678641][   T69] Object   ec1db370: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
[   24.679902][   T69] Object   ec1db380: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
[   24.681128][   T69] Object   ec1db390: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
[   24.682363][   T69] Object   ec1db3a0: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
[   24.683600][   T69] Object   ec1db3b0: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
[   24.684706][   T69] Object   ec1db3c0: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
[   24.685956][   T69] Object   ec1db3d0: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
[   24.687238][   T69] Object   ec1db3e0: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
[   24.688510][   T69] Object   ec1db3f0: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
[   24.689774][   T69] Redzone  ec1db400: cc cc cc cc                                      ....
[   24.690940][   T69] Padding  ec1db434: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
[   24.692221][   T69] Padding  ec1db444: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
[   24.693498][   T69] Padding  ec1db454: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
[   24.694765][   T69] Padding  ec1db464: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
[   24.695993][   T69] Padding  ec1db474: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
[   24.697216][   T69] Padding  ec1db484: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
[   24.698457][   T69] Padding  ec1db494: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
[   24.699693][   T69] Padding  ec1db4a4: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
[   24.700924][   T69] Padding  ec1db4b4: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
[   24.702151][   T69] Padding  ec1db4c4: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
[   24.703390][   T69] Padding  ec1db4d4: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
[   24.704623][   T69] Padding  ec1db4e4: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
[   24.705858][   T69] Padding  ec1db4f4: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
[   24.707089][   T69] Padding  ec1db504: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
[   24.708324][   T69] Padding  ec1db514: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
[   24.709545][   T69] Padding  ec1db524: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
[   24.710780][   T69] Padding  ec1db534: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
[   24.712007][   T69] Padding  ec1db544: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
[   24.713237][   T69] Padding  ec1db554: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
[   24.714450][   T69] Padding  ec1db564: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
[   24.715684][   T69] Padding  ec1db574: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
[   24.716921][   T69] Padding  ec1db584: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
[   24.718136][   T69] Padding  ec1db594: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
[   24.719373][   T69] Padding  ec1db5a4: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
[   24.720587][   T69] Padding  ec1db5b4: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
[   24.721814][   T69] Padding  ec1db5c4: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
[   24.723049][   T69] Padding  ec1db5d4: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
[   24.724249][   T69] Padding  ec1db5e4: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
[   24.725502][   T69] Padding  ec1db5f4: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a              ZZZZZZZZZZZZ
[   24.726722][   T69] CPU: 1 PID: 69 Comm: kworker/1:2 Not tainted 6.4.0-rc2-00029-gd9c5a8f98c16 #1 dff000342694c2673fafda36c4b68bccbb7a397d
[   24.728306][   T69] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   24.729650][   T69] Workqueue: events kfree_rcu_monitor
[   24.730381][   T69] Call Trace:
[   24.730900][   T69]  dump_stack_lvl+0x77/0xb0
[   24.731548][   T69]  dump_stack+0xd/0x20
[   24.732141][   T69]  print_trailer+0x1b6/0x1c0
[   24.732794][   T69]  check_bytes_and_report+0xa8/0xf0
[   24.733515][   T69]  check_object+0x2b9/0x2e0
[   24.734156][   T69]  free_to_partial_list+0x11e/0x550
[   24.734847][   T69]  __slab_free+0x32/0x1f0
[   24.735422][   T69]  ? kvfree_rcu_bulk+0xfc/0x200
[   24.736029][   T69]  kmem_cache_free_bulk+0x5ae/0x600
[   24.736637][   T69]  ? kvfree_rcu_bulk+0xfc/0x200
[   24.737226][   T69]  ? kvfree_rcu_bulk+0xfc/0x200
[   24.737893][   T69]  kvfree_rcu_bulk+0xfc/0x200
[   24.738543][   T69]  kfree_rcu_monitor+0x1eb/0x490
[   24.739255][   T69]  process_one_work+0x214/0x3d0
[   24.739931][   T69]  worker_thread+0x22b/0x400
[   24.740573][   T69]  kthread+0xd8/0xf0
[   24.741148][   T69]  ? pr_cont_work+0x170/0x170
[   24.741799][   T69]  ? kthread_unuse_mm+0xa0/0xa0
[   24.742469][   T69]  ret_from_fork+0x19/0x30
[   24.743122][   T69] FIX kmalloc-cg-512: Restoring kmalloc Redzone 0xec1db330-0xec1db33f=0xcc
[   24.744270][   T69] FIX kmalloc-cg-512: Object at 0xec1db200 not freed



To reproduce:

        # build kernel
	cd linux
	cp config-6.4.0-rc2-00029-gd9c5a8f98c16 .config
	make HOSTCC=clang-15 CC=clang-15 ARCH=i386 olddefconfig prepare modules_prepare bzImage modules
	make HOSTCC=clang-15 CC=clang-15 ARCH=i386 INSTALL_MOD_PATH=<mod-install-dir> modules_install
	cd <mod-install-dir>
	find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz


        git clone https://github.com/intel/lkp-tests.git
        cd lkp-tests
        bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-script is attached in this email

        # if come across any failure that blocks the test,
        # please remove ~/.lkp and /lkp dir to run from a clean state.



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



--w4P4cHKAfxD1kdF6
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment;
	filename="config-6.4.0-rc2-00029-gd9c5a8f98c16"

#
# Automatically generated file; DO NOT EDIT.
# Linux/i386 6.4.0-rc2 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)"
CONFIG_GCC_VERSION=0
CONFIG_CC_IS_CLANG=y
CONFIG_CLANG_VERSION=150007
CONFIG_AS_IS_LLVM=y
CONFIG_AS_VERSION=150007
CONFIG_LD_VERSION=0
CONFIG_LD_IS_LLD=y
CONFIG_LLD_VERSION=150007
CONFIG_RUST_IS_AVAILABLE=y
CONFIG_CC_CAN_LINK=y
CONFIG_CC_CAN_LINK_STATIC=y
CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT=y
CONFIG_TOOLS_SUPPORT_RELR=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
CONFIG_PAHOLE_VERSION=125
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_TABLE_SORT=y
CONFIG_THREAD_INFO_IN_TASK=y

#
# General setup
#
CONFIG_INIT_ENV_ARG_LIMIT=32
# CONFIG_COMPILE_TEST is not set
# CONFIG_WERROR is not set
CONFIG_LOCALVERSION=""
CONFIG_LOCALVERSION_AUTO=y
CONFIG_BUILD_SALT=""
CONFIG_HAVE_KERNEL_GZIP=y
CONFIG_HAVE_KERNEL_BZIP2=y
CONFIG_HAVE_KERNEL_LZMA=y
CONFIG_HAVE_KERNEL_XZ=y
CONFIG_HAVE_KERNEL_LZO=y
CONFIG_HAVE_KERNEL_LZ4=y
CONFIG_HAVE_KERNEL_ZSTD=y
# CONFIG_KERNEL_GZIP is not set
# CONFIG_KERNEL_BZIP2 is not set
CONFIG_KERNEL_LZMA=y
# CONFIG_KERNEL_XZ is not set
# CONFIG_KERNEL_LZO is not set
# CONFIG_KERNEL_LZ4 is not set
# CONFIG_KERNEL_ZSTD is not set
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
CONFIG_SYSVIPC=y
CONFIG_SYSVIPC_SYSCTL=y
# CONFIG_POSIX_MQUEUE is not set
CONFIG_WATCH_QUEUE=y
CONFIG_CROSS_MEMORY_ATTACH=y
# CONFIG_USELIB is not set
# CONFIG_AUDIT is not set
CONFIG_HAVE_ARCH_AUDITSYSCALL=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_PROBE=y
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=y
CONFIG_GENERIC_PENDING_IRQ=y
CONFIG_GENERIC_IRQ_MIGRATION=y
CONFIG_GENERIC_IRQ_INJECTION=y
CONFIG_HARDIRQS_SW_RESEND=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_IRQ_MSI_IOMMU=y
CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=y
CONFIG_GENERIC_IRQ_RESERVATION_MODE=y
CONFIG_IRQ_FORCED_THREADING=y
CONFIG_SPARSE_IRQ=y
CONFIG_GENERIC_IRQ_DEBUGFS=y
# end of IRQ subsystem

CONFIG_CLOCKSOURCE_WATCHDOG=y
CONFIG_ARCH_CLOCKSOURCE_INIT=y
CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=y
CONFIG_GENERIC_TIME_VSYSCALL=y
CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=y
CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=y
CONFIG_GENERIC_CMOS_UPDATE=y
CONFIG_HAVE_POSIX_CPU_TIMERS_TASK_WORK=y
CONFIG_POSIX_CPU_TIMERS_TASK_WORK=y
CONFIG_CONTEXT_TRACKING=y
CONFIG_CONTEXT_TRACKING_IDLE=y

#
# Timers subsystem
#
CONFIG_TICK_ONESHOT=y
CONFIG_HZ_PERIODIC=y
# CONFIG_NO_HZ_IDLE is not set
CONFIG_NO_HZ=y
CONFIG_HIGH_RES_TIMERS=y
CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US=125
# end of Timers subsystem

CONFIG_BPF=y
CONFIG_HAVE_EBPF_JIT=y

#
# BPF subsystem
#
CONFIG_BPF_SYSCALL=y
# CONFIG_BPF_JIT is not set
# CONFIG_BPF_UNPRIV_DEFAULT_OFF is not set
# CONFIG_BPF_PRELOAD is not set
# end of BPF subsystem

CONFIG_PREEMPT_BUILD=y
# CONFIG_PREEMPT_NONE is not set
# CONFIG_PREEMPT_VOLUNTARY is not set
CONFIG_PREEMPT=y
CONFIG_PREEMPT_COUNT=y
CONFIG_PREEMPTION=y
CONFIG_PREEMPT_DYNAMIC=y
CONFIG_SCHED_CORE=y

#
# CPU/Task time and stats accounting
#
CONFIG_TICK_CPU_ACCOUNTING=y
CONFIG_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_SCHED_AVG_IRQ=y
# CONFIG_BSD_PROCESS_ACCT is not set
# CONFIG_TASKSTATS is not set
CONFIG_PSI=y
CONFIG_PSI_DEFAULT_DISABLED=y
# end of CPU/Task time and stats accounting

# CONFIG_CPU_ISOLATION is not set

#
# RCU Subsystem
#
CONFIG_TREE_RCU=y
CONFIG_PREEMPT_RCU=y
CONFIG_RCU_EXPERT=y
CONFIG_TREE_SRCU=y
CONFIG_TASKS_RCU_GENERIC=y
CONFIG_FORCE_TASKS_RCU=y
CONFIG_TASKS_RCU=y
CONFIG_FORCE_TASKS_RUDE_RCU=y
CONFIG_TASKS_RUDE_RCU=y
CONFIG_FORCE_TASKS_TRACE_RCU=y
CONFIG_TASKS_TRACE_RCU=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
CONFIG_RCU_FANOUT=32
CONFIG_RCU_FANOUT_LEAF=16
# CONFIG_RCU_BOOST is not set
CONFIG_RCU_NOCB_CPU=y
# CONFIG_RCU_NOCB_CPU_DEFAULT_ALL is not set
CONFIG_TASKS_TRACE_RCU_READ_MB=y
CONFIG_RCU_LAZY=y
# end of RCU Subsystem

CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
# CONFIG_IKHEADERS is not set
CONFIG_LOG_BUF_SHIFT=20
CONFIG_LOG_CPU_MAX_BUF_SHIFT=12
CONFIG_PRINTK_INDEX=y
CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y

#
# Scheduler features
#
CONFIG_UCLAMP_TASK=y
CONFIG_UCLAMP_BUCKETS_COUNT=5
# end of Scheduler features

CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=y
CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough"
CONFIG_GCC11_NO_ARRAY_BOUNDS=y
CONFIG_CGROUPS=y
CONFIG_PAGE_COUNTER=y
CONFIG_CGROUP_FAVOR_DYNMODS=y
CONFIG_MEMCG=y
CONFIG_MEMCG_KMEM=y
# CONFIG_BLK_CGROUP is not set
CONFIG_CGROUP_SCHED=y
CONFIG_FAIR_GROUP_SCHED=y
# CONFIG_CFS_BANDWIDTH is not set
# CONFIG_RT_GROUP_SCHED is not set
CONFIG_SCHED_MM_CID=y
# CONFIG_UCLAMP_TASK_GROUP is not set
# CONFIG_CGROUP_PIDS is not set
# CONFIG_CGROUP_RDMA is not set
# CONFIG_CGROUP_FREEZER is not set
CONFIG_CGROUP_HUGETLB=y
CONFIG_CPUSETS=y
# CONFIG_PROC_PID_CPUSET is not set
CONFIG_CGROUP_DEVICE=y
CONFIG_CGROUP_CPUACCT=y
# CONFIG_CGROUP_PERF is not set
# CONFIG_CGROUP_BPF is not set
CONFIG_CGROUP_MISC=y
CONFIG_CGROUP_DEBUG=y
CONFIG_NAMESPACES=y
# CONFIG_UTS_NS is not set
CONFIG_TIME_NS=y
# CONFIG_IPC_NS is not set
CONFIG_USER_NS=y
CONFIG_PID_NS=y
CONFIG_NET_NS=y
CONFIG_CHECKPOINT_RESTORE=y
# CONFIG_SCHED_AUTOGROUP is not set
CONFIG_RELAY=y
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
CONFIG_RD_GZIP=y
# CONFIG_RD_BZIP2 is not set
# CONFIG_RD_LZMA is not set
CONFIG_RD_XZ=y
# CONFIG_RD_LZO is not set
# CONFIG_RD_LZ4 is not set
# CONFIG_RD_ZSTD is not set
CONFIG_BOOT_CONFIG=y
# CONFIG_BOOT_CONFIG_FORCE is not set
# CONFIG_BOOT_CONFIG_EMBED is not set
CONFIG_INITRAMFS_PRESERVE_MTIME=y
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
CONFIG_LD_ORPHAN_WARN=y
CONFIG_LD_ORPHAN_WARN_LEVEL="warn"
CONFIG_SYSCTL=y
CONFIG_HAVE_UID16=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_HAVE_PCSPKR_PLATFORM=y
# CONFIG_EXPERT is not set
CONFIG_UID16=y
CONFIG_MULTIUSER=y
CONFIG_SGETMASK_SYSCALL=y
CONFIG_SYSFS_SYSCALL=y
CONFIG_FHANDLE=y
CONFIG_POSIX_TIMERS=y
CONFIG_PRINTK=y
CONFIG_BUG=y
CONFIG_ELF_CORE=y
CONFIG_PCSPKR_PLATFORM=y
CONFIG_BASE_FULL=y
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
CONFIG_AIO=y
CONFIG_IO_URING=y
CONFIG_ADVISE_SYSCALLS=y
CONFIG_MEMBARRIER=y
CONFIG_KALLSYMS=y
# CONFIG_KALLSYMS_SELFTEST is not set
CONFIG_KALLSYMS_ALL=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
CONFIG_KCMP=y
CONFIG_RSEQ=y
# CONFIG_EMBEDDED is not set
CONFIG_HAVE_PERF_EVENTS=y
CONFIG_PERF_USE_VMALLOC=y

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
CONFIG_DEBUG_PERF_USE_VMALLOC=y
# end of Kernel Performance Events And Counters

# CONFIG_PROFILING is not set
CONFIG_TRACEPOINTS=y
# end of General setup

CONFIG_X86_32=y
CONFIG_X86=y
CONFIG_INSTRUCTION_DECODER=y
CONFIG_OUTPUT_FORMAT="elf32-i386"
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_MMU=y
CONFIG_ARCH_MMAP_RND_BITS_MIN=8
CONFIG_ARCH_MMAP_RND_BITS_MAX=16
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=8
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=16
CONFIG_GENERIC_ISA_DMA=y
CONFIG_GENERIC_BUG=y
CONFIG_ARCH_MAY_HAVE_PC_FDC=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_ARCH_HAS_CPU_RELAX=y
CONFIG_ARCH_HIBERNATION_POSSIBLE=y
CONFIG_ARCH_SUSPEND_POSSIBLE=y
CONFIG_X86_32_SMP=y
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_FIX_EARLYCON_MEM=y
CONFIG_PGTABLE_LEVELS=2
CONFIG_CC_HAS_SANE_STACKPROTECTOR=y

#
# Processor type and features
#
CONFIG_SMP=y
CONFIG_X86_FEATURE_NAMES=y
# CONFIG_X86_MPPARSE is not set
CONFIG_GOLDFISH=y
CONFIG_X86_CPU_RESCTRL=y
# CONFIG_X86_BIGSMP is not set
# CONFIG_X86_EXTENDED_PLATFORM is not set
# CONFIG_X86_INTEL_LPSS is not set
# CONFIG_X86_AMD_PLATFORM_DEVICE is not set
# CONFIG_IOSF_MBI is not set
CONFIG_X86_SUPPORTS_MEMORY_FAILURE=y
# CONFIG_X86_32_IRIS is not set
# CONFIG_SCHED_OMIT_FRAME_POINTER is not set
CONFIG_HYPERVISOR_GUEST=y
CONFIG_PARAVIRT=y
# CONFIG_PARAVIRT_DEBUG is not set
CONFIG_PARAVIRT_SPINLOCKS=y
CONFIG_X86_HV_CALLBACK_VECTOR=y
CONFIG_KVM_GUEST=y
CONFIG_ARCH_CPUIDLE_HALTPOLL=y
CONFIG_PVH=y
CONFIG_PARAVIRT_TIME_ACCOUNTING=y
CONFIG_PARAVIRT_CLOCK=y
# CONFIG_M486SX is not set
CONFIG_M486=y
# CONFIG_M586 is not set
# CONFIG_M586TSC is not set
# CONFIG_M586MMX is not set
# CONFIG_M686 is not set
# CONFIG_MPENTIUMII is not set
# CONFIG_MPENTIUMIII is not set
# CONFIG_MPENTIUMM is not set
# CONFIG_MPENTIUM4 is not set
# CONFIG_MK6 is not set
# CONFIG_MK7 is not set
# CONFIG_MK8 is not set
# CONFIG_MCRUSOE is not set
# CONFIG_MEFFICEON is not set
# CONFIG_MWINCHIPC6 is not set
# CONFIG_MWINCHIP3D is not set
# CONFIG_MELAN is not set
# CONFIG_MGEODEGX1 is not set
# CONFIG_MGEODE_LX is not set
# CONFIG_MCYRIXIII is not set
# CONFIG_MVIAC3_2 is not set
# CONFIG_MVIAC7 is not set
# CONFIG_MCORE2 is not set
# CONFIG_MATOM is not set
# CONFIG_X86_GENERIC is not set
CONFIG_X86_INTERNODE_CACHE_SHIFT=4
CONFIG_X86_L1_CACHE_SHIFT=4
CONFIG_X86_F00F_BUG=y
CONFIG_X86_INVD_BUG=y
CONFIG_X86_ALIGNMENT_16=y
CONFIG_X86_MINIMUM_CPU_FAMILY=4
CONFIG_IA32_FEAT_CTL=y
CONFIG_X86_VMX_FEATURE_NAMES=y
CONFIG_CPU_SUP_INTEL=y
CONFIG_CPU_SUP_CYRIX_32=y
CONFIG_CPU_SUP_AMD=y
CONFIG_CPU_SUP_HYGON=y
CONFIG_CPU_SUP_CENTAUR=y
CONFIG_CPU_SUP_TRANSMETA_32=y
CONFIG_CPU_SUP_UMC_32=y
CONFIG_CPU_SUP_ZHAOXIN=y
CONFIG_CPU_SUP_VORTEX_32=y
CONFIG_HPET_TIMER=y
CONFIG_HPET_EMULATE_RTC=y
CONFIG_DMI=y
CONFIG_BOOT_VESA_SUPPORT=y
CONFIG_NR_CPUS_RANGE_BEGIN=2
CONFIG_NR_CPUS_RANGE_END=8
CONFIG_NR_CPUS_DEFAULT=8
CONFIG_NR_CPUS=8
CONFIG_SCHED_CLUSTER=y
CONFIG_SCHED_SMT=y
# CONFIG_SCHED_MC is not set
CONFIG_X86_LOCAL_APIC=y
CONFIG_X86_IO_APIC=y
CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=y
CONFIG_X86_MCE=y
CONFIG_X86_MCELOG_LEGACY=y
CONFIG_X86_MCE_INTEL=y
# CONFIG_X86_MCE_AMD is not set
CONFIG_X86_ANCIENT_MCE=y
CONFIG_X86_MCE_THRESHOLD=y
CONFIG_X86_MCE_INJECT=y

#
# Performance monitoring
#
CONFIG_PERF_EVENTS_INTEL_UNCORE=y
CONFIG_PERF_EVENTS_INTEL_RAPL=y
CONFIG_PERF_EVENTS_INTEL_CSTATE=y
# CONFIG_PERF_EVENTS_AMD_POWER is not set
# CONFIG_PERF_EVENTS_AMD_UNCORE is not set
# CONFIG_PERF_EVENTS_AMD_BRS is not set
# end of Performance monitoring

# CONFIG_X86_LEGACY_VM86 is not set
CONFIG_X86_16BIT=y
CONFIG_X86_ESPFIX32=y
# CONFIG_X86_IOPL_IOPERM is not set
CONFIG_TOSHIBA=y
# CONFIG_X86_REBOOTFIXUPS is not set
CONFIG_MICROCODE=y
# CONFIG_MICROCODE_INTEL is not set
# CONFIG_MICROCODE_AMD is not set
CONFIG_MICROCODE_LATE_LOADING=y
CONFIG_X86_MSR=y
# CONFIG_X86_CPUID is not set
# CONFIG_NOHIGHMEM is not set
CONFIG_HIGHMEM4G=y
CONFIG_PAGE_OFFSET=0xC0000000
CONFIG_HIGHMEM=y
# CONFIG_X86_CPA_STATISTICS is not set
CONFIG_ARCH_FLATMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_SELECT_MEMORY_MODEL=y
CONFIG_ILLEGAL_POINTER_VALUE=0
# CONFIG_HIGHPTE is not set
CONFIG_X86_CHECK_BIOS_CORRUPTION=y
CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK=y
CONFIG_MTRR=y
CONFIG_MTRR_SANITIZER=y
CONFIG_MTRR_SANITIZER_ENABLE_DEFAULT=0
CONFIG_MTRR_SANITIZER_SPARE_REG_NR_DEFAULT=1
CONFIG_X86_PAT=y
CONFIG_ARCH_USES_PG_UNCACHED=y
CONFIG_X86_UMIP=y
CONFIG_CC_HAS_IBT=y
# CONFIG_X86_INTEL_TSX_MODE_OFF is not set
CONFIG_X86_INTEL_TSX_MODE_ON=y
# CONFIG_X86_INTEL_TSX_MODE_AUTO is not set
# CONFIG_EFI is not set
# CONFIG_HZ_100 is not set
# CONFIG_HZ_250 is not set
# CONFIG_HZ_300 is not set
CONFIG_HZ_1000=y
CONFIG_HZ=1000
CONFIG_SCHED_HRTICK=y
CONFIG_KEXEC=y
# CONFIG_CRASH_DUMP is not set
CONFIG_PHYSICAL_START=0x1000000
# CONFIG_RELOCATABLE is not set
CONFIG_PHYSICAL_ALIGN=0x200000
CONFIG_HOTPLUG_CPU=y
CONFIG_BOOTPARAM_HOTPLUG_CPU0=y
# CONFIG_DEBUG_HOTPLUG_CPU0 is not set
CONFIG_COMPAT_VDSO=y
# CONFIG_CMDLINE_BOOL is not set
CONFIG_MODIFY_LDT_SYSCALL=y
# CONFIG_STRICT_SIGALTSTACK_SIZE is not set
# end of Processor type and features

CONFIG_CC_HAS_SLS=y
CONFIG_CC_HAS_RETURN_THUNK=y
CONFIG_CC_HAS_ENTRY_PADDING=y
CONFIG_FUNCTION_PADDING_CFI=11
CONFIG_FUNCTION_PADDING_BYTES=16
# CONFIG_SPECULATION_MITIGATIONS is not set
CONFIG_ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE=y

#
# Power management and ACPI options
#
# CONFIG_SUSPEND is not set
# CONFIG_HIBERNATION is not set
# CONFIG_PM is not set
# CONFIG_ENERGY_MODEL is not set
CONFIG_ARCH_SUPPORTS_ACPI=y
CONFIG_ACPI=y
CONFIG_ACPI_LEGACY_TABLES_LOOKUP=y
CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=y
CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=y
# CONFIG_ACPI_DEBUGGER is not set
CONFIG_ACPI_SPCR_TABLE=y
CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=y
CONFIG_ACPI_EC_DEBUGFS=y
CONFIG_ACPI_AC=y
CONFIG_ACPI_BATTERY=y
CONFIG_ACPI_BUTTON=y
CONFIG_ACPI_VIDEO=y
# CONFIG_ACPI_FAN is not set
CONFIG_ACPI_DOCK=y
CONFIG_ACPI_CPU_FREQ_PSS=y
CONFIG_ACPI_PROCESSOR_CSTATE=y
CONFIG_ACPI_PROCESSOR_IDLE=y
CONFIG_ACPI_PROCESSOR=y
CONFIG_ACPI_HOTPLUG_CPU=y
CONFIG_ACPI_PROCESSOR_AGGREGATOR=y
# CONFIG_ACPI_THERMAL is not set
CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=y
CONFIG_ACPI_TABLE_UPGRADE=y
# CONFIG_ACPI_DEBUG is not set
# CONFIG_ACPI_PCI_SLOT is not set
CONFIG_ACPI_CONTAINER=y
CONFIG_ACPI_HOTPLUG_IOAPIC=y
# CONFIG_ACPI_SBS is not set
CONFIG_ACPI_HED=y
# CONFIG_ACPI_CUSTOM_METHOD is not set
CONFIG_HAVE_ACPI_APEI=y
CONFIG_HAVE_ACPI_APEI_NMI=y
CONFIG_ACPI_APEI=y
# CONFIG_ACPI_APEI_GHES is not set
CONFIG_ACPI_APEI_MEMORY_FAILURE=y
CONFIG_ACPI_APEI_EINJ=y
CONFIG_ACPI_APEI_ERST_DEBUG=y
CONFIG_ACPI_DPTF=y
CONFIG_DPTF_POWER=y
CONFIG_DPTF_PCH_FIVR=y
CONFIG_ACPI_EXTLOG=y
CONFIG_ACPI_CONFIGFS=y
# CONFIG_ACPI_PCC is not set
CONFIG_ACPI_FFH=y
# CONFIG_PMIC_OPREGION is not set
CONFIG_X86_PM_TIMER=y

#
# CPU Frequency scaling
#
CONFIG_CPU_FREQ=y
CONFIG_CPU_FREQ_GOV_ATTR_SET=y
CONFIG_CPU_FREQ_GOV_COMMON=y
CONFIG_CPU_FREQ_STAT=y
# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL=y
CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
# CONFIG_CPU_FREQ_GOV_POWERSAVE is not set
# CONFIG_CPU_FREQ_GOV_USERSPACE is not set
CONFIG_CPU_FREQ_GOV_ONDEMAND=y
# CONFIG_CPU_FREQ_GOV_CONSERVATIVE is not set
CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y

#
# CPU frequency scaling drivers
#
# CONFIG_X86_INTEL_PSTATE is not set
# CONFIG_X86_PCC_CPUFREQ is not set
# CONFIG_X86_AMD_PSTATE is not set
# CONFIG_X86_AMD_PSTATE_UT is not set
CONFIG_X86_ACPI_CPUFREQ=y
# CONFIG_X86_ACPI_CPUFREQ_CPB is not set
CONFIG_X86_POWERNOW_K6=y
CONFIG_X86_POWERNOW_K7=y
CONFIG_X86_POWERNOW_K7_ACPI=y
# CONFIG_X86_POWERNOW_K8 is not set
# CONFIG_X86_AMD_FREQ_SENSITIVITY is not set
# CONFIG_X86_GX_SUSPMOD is not set
CONFIG_X86_SPEEDSTEP_CENTRINO=y
CONFIG_X86_SPEEDSTEP_CENTRINO_TABLE=y
CONFIG_X86_SPEEDSTEP_ICH=y
# CONFIG_X86_SPEEDSTEP_SMI is not set
CONFIG_X86_P4_CLOCKMOD=y
# CONFIG_X86_CPUFREQ_NFORCE2 is not set
# CONFIG_X86_LONGRUN is not set
CONFIG_X86_LONGHAUL=y
CONFIG_X86_E_POWERSAVER=y

#
# shared options
#
CONFIG_X86_SPEEDSTEP_LIB=y
CONFIG_X86_SPEEDSTEP_RELAXED_CAP_CHECK=y
# end of CPU Frequency scaling

#
# CPU Idle
#
CONFIG_CPU_IDLE=y
CONFIG_CPU_IDLE_GOV_LADDER=y
CONFIG_CPU_IDLE_GOV_MENU=y
CONFIG_CPU_IDLE_GOV_TEO=y
CONFIG_CPU_IDLE_GOV_HALTPOLL=y
CONFIG_HALTPOLL_CPUIDLE=y
# end of CPU Idle

CONFIG_INTEL_IDLE=y
# end of Power management and ACPI options

#
# Bus options (PCI etc.)
#
# CONFIG_PCI_GOBIOS is not set
# CONFIG_PCI_GOMMCONFIG is not set
# CONFIG_PCI_GODIRECT is not set
CONFIG_PCI_GOANY=y
CONFIG_PCI_BIOS=y
CONFIG_PCI_DIRECT=y
CONFIG_PCI_MMCONFIG=y
CONFIG_ISA_DMA_API=y
CONFIG_ISA=y
CONFIG_SCx200=y
# CONFIG_SCx200HR_TIMER is not set
# CONFIG_OLPC is not set
# CONFIG_ALIX is not set
# CONFIG_NET5501 is not set
CONFIG_GEOS=y
CONFIG_AMD_NB=y
# end of Bus options (PCI etc.)

#
# Binary Emulations
#
CONFIG_COMPAT_32=y
# end of Binary Emulations

CONFIG_HAVE_ATOMIC_IOMAP=y
CONFIG_HAVE_KVM=y
# CONFIG_VIRTUALIZATION is not set
CONFIG_AS_AVX512=y
CONFIG_AS_SHA1_NI=y
CONFIG_AS_SHA256_NI=y
CONFIG_AS_TPAUSE=y
CONFIG_AS_GFNI=y

#
# General architecture-dependent options
#
CONFIG_CRASH_CORE=y
CONFIG_KEXEC_CORE=y
CONFIG_HOTPLUG_SMT=y
CONFIG_GENERIC_ENTRY=y
CONFIG_KPROBES=y
# CONFIG_JUMP_LABEL is not set
# CONFIG_STATIC_CALL_SELFTEST is not set
CONFIG_OPTPROBES=y
CONFIG_UPROBES=y
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
CONFIG_ARCH_USE_BUILTIN_BSWAP=y
CONFIG_KRETPROBES=y
CONFIG_KRETPROBE_ON_RETHOOK=y
CONFIG_HAVE_IOREMAP_PROT=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_HAVE_OPTPROBES=y
CONFIG_HAVE_KPROBES_ON_FTRACE=y
CONFIG_ARCH_CORRECT_STACKTRACE_ON_KRETPROBE=y
CONFIG_HAVE_FUNCTION_ERROR_INJECTION=y
CONFIG_HAVE_NMI=y
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_TRACE_IRQFLAGS_NMI_SUPPORT=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_HAVE_DMA_CONTIGUOUS=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
CONFIG_ARCH_HAS_SET_MEMORY=y
CONFIG_ARCH_HAS_SET_DIRECT_MAP=y
CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=y
CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=y
CONFIG_ARCH_WANTS_NO_INSTR=y
CONFIG_ARCH_32BIT_OFF_T=y
CONFIG_HAVE_ASM_MODVERSIONS=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_RSEQ=y
CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=y
CONFIG_HAVE_HW_BREAKPOINT=y
CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=y
CONFIG_HAVE_USER_RETURN_NOTIFIER=y
CONFIG_HAVE_PERF_EVENTS_NMI=y
CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=y
CONFIG_HAVE_PERF_REGS=y
CONFIG_HAVE_PERF_USER_STACK_DUMP=y
CONFIG_HAVE_ARCH_JUMP_LABEL=y
CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=y
CONFIG_MMU_GATHER_TABLE_FREE=y
CONFIG_MMU_GATHER_RCU_TABLE_FREE=y
CONFIG_MMU_GATHER_MERGE_VMAS=y
CONFIG_MMU_LAZY_TLB_REFCOUNT=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_ARCH_HAS_NMI_SAFE_THIS_CPU_OPS=y
CONFIG_HAVE_ALIGNED_STRUCT_PAGE=y
CONFIG_HAVE_CMPXCHG_LOCAL=y
CONFIG_HAVE_CMPXCHG_DOUBLE=y
CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
CONFIG_HAVE_ARCH_SECCOMP=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
# CONFIG_SECCOMP is not set
CONFIG_HAVE_ARCH_STACKLEAK=y
CONFIG_HAVE_STACKPROTECTOR=y
# CONFIG_STACKPROTECTOR is not set
CONFIG_ARCH_SUPPORTS_LTO_CLANG=y
CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN=y
CONFIG_HAS_LTO_CLANG=y
CONFIG_LTO_NONE=y
# CONFIG_LTO_CLANG_FULL is not set
# CONFIG_LTO_CLANG_THIN is not set
CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=y
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_MOVE_PUD=y
CONFIG_HAVE_MOVE_PMD=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
CONFIG_ARCH_WANT_HUGE_PMD_SHARE=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_REL=y
CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=y
CONFIG_SOFTIRQ_ON_OWN_STACK=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
CONFIG_HAVE_EXIT_THREAD=y
CONFIG_ARCH_MMAP_RND_BITS=8
CONFIG_PAGE_SIZE_LESS_THAN_64KB=y
CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
CONFIG_ISA_BUS_API=y
CONFIG_CLONE_BACKWARDS=y
CONFIG_OLD_SIGSUSPEND3=y
CONFIG_OLD_SIGACTION=y
CONFIG_COMPAT_32BIT_TIME=y
CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=y
CONFIG_RANDOMIZE_KSTACK_OFFSET=y
CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT=y
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
CONFIG_STRICT_KERNEL_RWX=y
CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
CONFIG_STRICT_MODULE_RWX=y
CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=y
# CONFIG_LOCK_EVENT_COUNTS is not set
CONFIG_ARCH_HAS_MEM_ENCRYPT=y
CONFIG_HAVE_STATIC_CALL=y
CONFIG_HAVE_PREEMPT_DYNAMIC=y
CONFIG_HAVE_PREEMPT_DYNAMIC_CALL=y
CONFIG_ARCH_WANT_LD_ORPHAN_WARN=y
CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
CONFIG_ARCH_SPLIT_ARG64=y
CONFIG_ARCH_HAS_PARANOID_L1D_FLUSH=y
CONFIG_DYNAMIC_SIGFRAME=y

#
# GCOV-based kernel profiling
#
# CONFIG_GCOV_KERNEL is not set
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
# end of GCOV-based kernel profiling

CONFIG_HAVE_GCC_PLUGINS=y
CONFIG_FUNCTION_ALIGNMENT_4B=y
CONFIG_FUNCTION_ALIGNMENT_16B=y
CONFIG_FUNCTION_ALIGNMENT=16
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
CONFIG_MODULES=y
# CONFIG_MODULE_DEBUG is not set
# CONFIG_MODULE_FORCE_LOAD is not set
CONFIG_MODULE_UNLOAD=y
# CONFIG_MODULE_FORCE_UNLOAD is not set
# CONFIG_MODULE_UNLOAD_TAINT_TRACKING is not set
# CONFIG_MODVERSIONS is not set
# CONFIG_MODULE_SRCVERSION_ALL is not set
# CONFIG_MODULE_SIG is not set
CONFIG_MODULE_COMPRESS_NONE=y
# CONFIG_MODULE_COMPRESS_GZIP is not set
# CONFIG_MODULE_COMPRESS_XZ is not set
# CONFIG_MODULE_COMPRESS_ZSTD is not set
# CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
CONFIG_MODPROBE_PATH="/sbin/modprobe"
CONFIG_MODULES_TREE_LOOKUP=y
CONFIG_BLOCK=y
# CONFIG_BLOCK_LEGACY_AUTOLOAD is not set
CONFIG_BLK_DEV_BSG_COMMON=y
CONFIG_BLK_ICQ=y
CONFIG_BLK_DEV_BSGLIB=y
# CONFIG_BLK_DEV_INTEGRITY is not set
# CONFIG_BLK_DEV_ZONED is not set
CONFIG_BLK_WBT=y
# CONFIG_BLK_WBT_MQ is not set
# CONFIG_BLK_DEBUG_FS is not set
CONFIG_BLK_SED_OPAL=y
CONFIG_BLK_INLINE_ENCRYPTION=y
CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK=y

#
# Partition Types
#
# CONFIG_PARTITION_ADVANCED is not set
CONFIG_MSDOS_PARTITION=y
CONFIG_EFI_PARTITION=y
# end of Partition Types

CONFIG_BLK_MQ_PCI=y
CONFIG_BLK_MQ_VIRTIO=y

#
# IO Schedulers
#
CONFIG_MQ_IOSCHED_DEADLINE=y
# CONFIG_MQ_IOSCHED_KYBER is not set
CONFIG_IOSCHED_BFQ=y
# end of IO Schedulers

CONFIG_PADATA=y
CONFIG_ASN1=y
CONFIG_UNINLINE_SPIN_UNLOCK=y
CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
CONFIG_MUTEX_SPIN_ON_OWNER=y
CONFIG_RWSEM_SPIN_ON_OWNER=y
CONFIG_LOCK_SPIN_ON_OWNER=y
CONFIG_ARCH_USE_QUEUED_SPINLOCKS=y
CONFIG_QUEUED_SPINLOCKS=y
CONFIG_ARCH_USE_QUEUED_RWLOCKS=y
CONFIG_QUEUED_RWLOCKS=y
CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=y
CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=y
CONFIG_ARCH_HAS_SYSCALL_WRAPPER=y

#
# Executable file formats
#
CONFIG_BINFMT_ELF=y
CONFIG_ELFCORE=y
CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=y
CONFIG_BINFMT_SCRIPT=y
CONFIG_BINFMT_MISC=y
CONFIG_COREDUMP=y
# end of Executable file formats

#
# Memory Management options
#
CONFIG_ZPOOL=y
CONFIG_SWAP=y
CONFIG_ZSWAP=y
# CONFIG_ZSWAP_DEFAULT_ON is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_DEFLATE is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZO is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_842 is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4 is not set
CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4HC=y
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_ZSTD is not set
CONFIG_ZSWAP_COMPRESSOR_DEFAULT="lz4hc"
# CONFIG_ZSWAP_ZPOOL_DEFAULT_ZBUD is not set
# CONFIG_ZSWAP_ZPOOL_DEFAULT_Z3FOLD is not set
CONFIG_ZSWAP_ZPOOL_DEFAULT_ZSMALLOC=y
CONFIG_ZSWAP_ZPOOL_DEFAULT="zsmalloc"
CONFIG_ZBUD=y
CONFIG_Z3FOLD=y
CONFIG_ZSMALLOC=y
CONFIG_ZSMALLOC_STAT=y
CONFIG_ZSMALLOC_CHAIN_SIZE=8

#
# SLAB allocator options
#
# CONFIG_SLAB is not set
CONFIG_SLUB=y
CONFIG_SLAB_MERGE_DEFAULT=y
CONFIG_SLAB_FREELIST_RANDOM=y
CONFIG_SLAB_FREELIST_HARDENED=y
CONFIG_SLUB_STATS=y
# CONFIG_SLUB_CPU_PARTIAL is not set
# end of SLAB allocator options

CONFIG_SHUFFLE_PAGE_ALLOCATOR=y
CONFIG_COMPAT_BRK=y
CONFIG_SELECT_MEMORY_MODEL=y
CONFIG_FLATMEM_MANUAL=y
# CONFIG_SPARSEMEM_MANUAL is not set
CONFIG_FLATMEM=y
CONFIG_SPARSEMEM_STATIC=y
CONFIG_HAVE_FAST_GUP=y
CONFIG_MEMORY_ISOLATION=y
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_MEMORY_BALLOON=y
# CONFIG_BALLOON_COMPACTION is not set
CONFIG_COMPACTION=y
CONFIG_COMPACT_UNEVICTABLE_DEFAULT=1
CONFIG_PAGE_REPORTING=y
CONFIG_MIGRATION=y
CONFIG_CONTIG_ALLOC=y
CONFIG_BOUNCE=y
CONFIG_KSM=y
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=y
CONFIG_MEMORY_FAILURE=y
# CONFIG_HWPOISON_INJECT is not set
CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
CONFIG_TRANSPARENT_HUGEPAGE=y
CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS=y
# CONFIG_TRANSPARENT_HUGEPAGE_MADVISE is not set
# CONFIG_READ_ONLY_THP_FOR_FS is not set
CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
CONFIG_HAVE_SETUP_PER_CPU_AREA=y
CONFIG_FRONTSWAP=y
CONFIG_CMA=y
# CONFIG_CMA_DEBUG is not set
CONFIG_CMA_DEBUGFS=y
CONFIG_CMA_SYSFS=y
CONFIG_CMA_AREAS=7
CONFIG_GENERIC_EARLY_IOREMAP=y
CONFIG_PAGE_IDLE_FLAG=y
CONFIG_IDLE_PAGE_TRACKING=y
CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
CONFIG_ARCH_HAS_CURRENT_STACK_POINTER=y
CONFIG_ZONE_DMA=y
CONFIG_VM_EVENT_COUNTERS=y
CONFIG_PERCPU_STATS=y
# CONFIG_GUP_TEST is not set
# CONFIG_DMAPOOL_TEST is not set
CONFIG_ARCH_HAS_PTE_SPECIAL=y
CONFIG_KMAP_LOCAL=y
CONFIG_SECRETMEM=y
# CONFIG_ANON_VMA_NAME is not set
CONFIG_USERFAULTFD=y
CONFIG_LRU_GEN=y
# CONFIG_LRU_GEN_ENABLED is not set
CONFIG_LRU_GEN_STATS=y

#
# Data Access Monitoring
#
CONFIG_DAMON=y
# CONFIG_DAMON_VADDR is not set
# CONFIG_DAMON_PADDR is not set
# CONFIG_DAMON_SYSFS is not set
# end of Data Access Monitoring
# end of Memory Management options

CONFIG_NET=y

#
# Networking options
#
CONFIG_PACKET=y
# CONFIG_PACKET_DIAG is not set
CONFIG_UNIX=y
CONFIG_UNIX_SCM=y
CONFIG_AF_UNIX_OOB=y
# CONFIG_UNIX_DIAG is not set
# CONFIG_TLS is not set
# CONFIG_XFRM_USER is not set
# CONFIG_NET_KEY is not set
# CONFIG_XDP_SOCKETS is not set
CONFIG_NET_HANDSHAKE=y
CONFIG_INET=y
# CONFIG_IP_MULTICAST is not set
# CONFIG_IP_ADVANCED_ROUTER is not set
CONFIG_IP_PNP=y
CONFIG_IP_PNP_DHCP=y
# CONFIG_IP_PNP_BOOTP is not set
# CONFIG_IP_PNP_RARP is not set
# CONFIG_NET_IPIP is not set
# CONFIG_NET_IPGRE_DEMUX is not set
CONFIG_NET_IP_TUNNEL=y
# CONFIG_SYN_COOKIES is not set
# CONFIG_NET_IPVTI is not set
# CONFIG_NET_FOU is not set
# CONFIG_NET_FOU_IP_TUNNELS is not set
# CONFIG_INET_AH is not set
# CONFIG_INET_ESP is not set
# CONFIG_INET_IPCOMP is not set
CONFIG_INET_TABLE_PERTURB_ORDER=16
CONFIG_INET_TUNNEL=y
CONFIG_INET_DIAG=y
CONFIG_INET_TCP_DIAG=y
# CONFIG_INET_UDP_DIAG is not set
# CONFIG_INET_RAW_DIAG is not set
# CONFIG_INET_DIAG_DESTROY is not set
# CONFIG_TCP_CONG_ADVANCED is not set
CONFIG_TCP_CONG_CUBIC=y
CONFIG_DEFAULT_TCP_CONG="cubic"
# CONFIG_TCP_MD5SIG is not set
CONFIG_IPV6=y
# CONFIG_IPV6_ROUTER_PREF is not set
# CONFIG_IPV6_OPTIMISTIC_DAD is not set
# CONFIG_INET6_AH is not set
# CONFIG_INET6_ESP is not set
# CONFIG_INET6_IPCOMP is not set
# CONFIG_IPV6_MIP6 is not set
# CONFIG_IPV6_VTI is not set
CONFIG_IPV6_SIT=y
# CONFIG_IPV6_SIT_6RD is not set
CONFIG_IPV6_NDISC_NODETYPE=y
# CONFIG_IPV6_TUNNEL is not set
# CONFIG_IPV6_MULTIPLE_TABLES is not set
# CONFIG_IPV6_MROUTE is not set
# CONFIG_IPV6_SEG6_LWTUNNEL is not set
# CONFIG_IPV6_SEG6_HMAC is not set
# CONFIG_IPV6_RPL_LWTUNNEL is not set
# CONFIG_IPV6_IOAM6_LWTUNNEL is not set
# CONFIG_NETLABEL is not set
# CONFIG_MPTCP is not set
# CONFIG_NETWORK_SECMARK is not set
CONFIG_NET_PTP_CLASSIFY=y
# CONFIG_NETWORK_PHY_TIMESTAMPING is not set
# CONFIG_NETFILTER is not set
# CONFIG_BPFILTER is not set
# CONFIG_IP_DCCP is not set
# CONFIG_IP_SCTP is not set
# CONFIG_RDS is not set
# CONFIG_TIPC is not set
# CONFIG_ATM is not set
# CONFIG_L2TP is not set
# CONFIG_BRIDGE is not set
# CONFIG_NET_DSA is not set
# CONFIG_VLAN_8021Q is not set
# CONFIG_LLC2 is not set
# CONFIG_ATALK is not set
# CONFIG_X25 is not set
# CONFIG_LAPB is not set
# CONFIG_PHONET is not set
# CONFIG_6LOWPAN is not set
# CONFIG_IEEE802154 is not set
# CONFIG_NET_SCHED is not set
# CONFIG_DCB is not set
CONFIG_DNS_RESOLVER=m
# CONFIG_BATMAN_ADV is not set
# CONFIG_OPENVSWITCH is not set
# CONFIG_VSOCKETS is not set
# CONFIG_NETLINK_DIAG is not set
# CONFIG_MPLS is not set
# CONFIG_NET_NSH is not set
# CONFIG_HSR is not set
# CONFIG_NET_SWITCHDEV is not set
# CONFIG_NET_L3_MASTER_DEV is not set
# CONFIG_QRTR is not set
# CONFIG_NET_NCSI is not set
CONFIG_PCPU_DEV_REFCNT=y
CONFIG_MAX_SKB_FRAGS=17
CONFIG_RPS=y
CONFIG_RFS_ACCEL=y
CONFIG_SOCK_RX_QUEUE_MAPPING=y
CONFIG_XPS=y
# CONFIG_CGROUP_NET_PRIO is not set
# CONFIG_CGROUP_NET_CLASSID is not set
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y
CONFIG_NET_FLOW_LIMIT=y

#
# Network testing
#
# CONFIG_NET_PKTGEN is not set
# CONFIG_NET_DROP_MONITOR is not set
# end of Network testing
# end of Networking options

# CONFIG_HAMRADIO is not set
# CONFIG_CAN is not set
# CONFIG_BT is not set
# CONFIG_AF_RXRPC is not set
# CONFIG_AF_KCM is not set
# CONFIG_MCTP is not set
CONFIG_WIRELESS=y
# CONFIG_CFG80211 is not set

#
# CFG80211 needs to be enabled for MAC80211
#
CONFIG_MAC80211_STA_HASH_MAX_SIZE=0
# CONFIG_RFKILL is not set
CONFIG_NET_9P=y
CONFIG_NET_9P_FD=y
CONFIG_NET_9P_VIRTIO=y
# CONFIG_NET_9P_DEBUG is not set
# CONFIG_CAIF is not set
# CONFIG_CEPH_LIB is not set
# CONFIG_NFC is not set
# CONFIG_PSAMPLE is not set
# CONFIG_NET_IFE is not set
# CONFIG_LWTUNNEL is not set
CONFIG_DST_CACHE=y
CONFIG_GRO_CELLS=y
CONFIG_NET_SOCK_MSG=y
CONFIG_PAGE_POOL=y
# CONFIG_PAGE_POOL_STATS is not set
CONFIG_FAILOVER=m
CONFIG_ETHTOOL_NETLINK=y

#
# Device Drivers
#
CONFIG_HAVE_EISA=y
CONFIG_EISA=y
CONFIG_EISA_VLB_PRIMING=y
CONFIG_EISA_PCI_EISA=y
# CONFIG_EISA_VIRTUAL_ROOT is not set
# CONFIG_EISA_NAMES is not set
CONFIG_HAVE_PCI=y
CONFIG_PCI=y
CONFIG_PCI_DOMAINS=y
# CONFIG_PCIEPORTBUS is not set
CONFIG_PCIEASPM=y
CONFIG_PCIEASPM_DEFAULT=y
# CONFIG_PCIEASPM_POWERSAVE is not set
# CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
# CONFIG_PCIEASPM_PERFORMANCE is not set
# CONFIG_PCIE_PTM is not set
# CONFIG_PCI_MSI is not set
CONFIG_PCI_QUIRKS=y
# CONFIG_PCI_DEBUG is not set
# CONFIG_PCI_STUB is not set
CONFIG_PCI_LOCKLESS_CONFIG=y
# CONFIG_PCI_IOV is not set
# CONFIG_PCI_PRI is not set
# CONFIG_PCI_PASID is not set
CONFIG_PCI_LABEL=y
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=16
# CONFIG_HOTPLUG_PCI is not set

#
# PCI controller drivers
#

#
# Cadence-based PCIe controllers
#
# end of Cadence-based PCIe controllers

#
# DesignWare-based PCIe controllers
#
# end of DesignWare-based PCIe controllers

#
# Mobiveil-based PCIe controllers
#
# end of Mobiveil-based PCIe controllers
# end of PCI controller drivers

#
# PCI Endpoint
#
# CONFIG_PCI_ENDPOINT is not set
# end of PCI Endpoint

#
# PCI switch controller drivers
#
# CONFIG_PCI_SW_SWITCHTEC is not set
# end of PCI switch controller drivers

# CONFIG_CXL_BUS is not set
CONFIG_PCCARD=y
CONFIG_PCMCIA=y
CONFIG_PCMCIA_LOAD_CIS=y
CONFIG_CARDBUS=y

#
# PC-card bridges
#
# CONFIG_YENTA is not set
# CONFIG_PD6729 is not set
# CONFIG_I82092 is not set
CONFIG_I82365=y
CONFIG_TCIC=y
CONFIG_PCMCIA_PROBE=y
CONFIG_PCCARD_NONSTATIC=y
# CONFIG_RAPIDIO is not set

#
# Generic Driver Options
#
CONFIG_AUXILIARY_BUS=y
# CONFIG_UEVENT_HELPER is not set
CONFIG_DEVTMPFS=y
CONFIG_DEVTMPFS_MOUNT=y
CONFIG_DEVTMPFS_SAFE=y
CONFIG_STANDALONE=y
CONFIG_PREVENT_FIRMWARE_BUILD=y

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_FW_LOADER_DEBUG=y
CONFIG_FW_LOADER_PAGED_BUF=y
CONFIG_FW_LOADER_SYSFS=y
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
# CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
# CONFIG_FW_LOADER_COMPRESS is not set
CONFIG_FW_UPLOAD=y
# end of Firmware loader

CONFIG_WANT_DEV_COREDUMP=y
CONFIG_ALLOW_DEV_COREDUMP=y
CONFIG_DEV_COREDUMP=y
# CONFIG_DEBUG_DRIVER is not set
# CONFIG_DEBUG_DEVRES is not set
# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
# CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_GENERIC_CPU_VULNERABILITIES=y
CONFIG_SOC_BUS=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=y
CONFIG_REGMAP_SLIMBUS=y
CONFIG_REGMAP_SPMI=y
CONFIG_REGMAP_W1=y
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_DMA_SHARED_BUFFER=y
CONFIG_DMA_FENCE_TRACE=y
# CONFIG_FW_DEVLINK_SYNC_STATE_TIMEOUT is not set
# end of Generic Driver Options

#
# Bus devices
#
# CONFIG_MHI_BUS is not set
CONFIG_MHI_BUS_EP=y
# end of Bus devices

# CONFIG_CONNECTOR is not set

#
# Firmware Drivers
#

#
# ARM System Control and Management Interface Protocol
#
# end of ARM System Control and Management Interface Protocol

CONFIG_EDD=y
CONFIG_EDD_OFF=y
CONFIG_FIRMWARE_MEMMAP=y
CONFIG_DMIID=y
# CONFIG_DMI_SYSFS is not set
CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=y
# CONFIG_FW_CFG_SYSFS is not set
CONFIG_SYSFB=y
CONFIG_SYSFB_SIMPLEFB=y
# CONFIG_GOOGLE_FIRMWARE is not set
CONFIG_UEFI_CPER=y
CONFIG_UEFI_CPER_X86=y

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

CONFIG_GNSS=y
CONFIG_GNSS_USB=y
# CONFIG_MTD is not set
# CONFIG_OF is not set
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
CONFIG_PARPORT=y
CONFIG_PARPORT_PC=y
# CONFIG_PARPORT_SERIAL is not set
# CONFIG_PARPORT_PC_FIFO is not set
CONFIG_PARPORT_PC_SUPERIO=y
CONFIG_PARPORT_PC_PCMCIA=y
# CONFIG_PARPORT_1284 is not set
CONFIG_PARPORT_NOT_PC=y
CONFIG_PNP=y
CONFIG_PNP_DEBUG_MESSAGES=y

#
# Protocols
#
CONFIG_ISAPNP=y
# CONFIG_PNPBIOS is not set
CONFIG_PNPACPI=y
CONFIG_BLK_DEV=y
# CONFIG_BLK_DEV_NULL_BLK is not set
# CONFIG_BLK_DEV_FD is not set
# CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
# CONFIG_ZRAM is not set
# CONFIG_BLK_DEV_LOOP is not set
# CONFIG_BLK_DEV_DRBD is not set
# CONFIG_BLK_DEV_NBD is not set
# CONFIG_BLK_DEV_RAM is not set
# CONFIG_CDROM_PKTCDVD is not set
# CONFIG_ATA_OVER_ETH is not set
# CONFIG_VIRTIO_BLK is not set
# CONFIG_BLK_DEV_RBD is not set
# CONFIG_BLK_DEV_UBLK is not set

#
# NVME Support
#
CONFIG_NVME_COMMON=y
CONFIG_NVME_CORE=y
# CONFIG_BLK_DEV_NVME is not set
# CONFIG_NVME_MULTIPATH is not set
CONFIG_NVME_VERBOSE_ERRORS=y
CONFIG_NVME_FABRICS=y
# CONFIG_NVME_FC is not set
# CONFIG_NVME_TCP is not set
CONFIG_NVME_AUTH=y
CONFIG_NVME_TARGET=y
# CONFIG_NVME_TARGET_PASSTHRU is not set
CONFIG_NVME_TARGET_LOOP=y
CONFIG_NVME_TARGET_FC=y
# CONFIG_NVME_TARGET_TCP is not set
CONFIG_NVME_TARGET_AUTH=y
# end of NVME Support

#
# Misc devices
#
CONFIG_SENSORS_LIS3LV02D=y
CONFIG_AD525X_DPOT=y
# CONFIG_AD525X_DPOT_I2C is not set
CONFIG_DUMMY_IRQ=y
# CONFIG_IBM_ASM is not set
# CONFIG_PHANTOM is not set
# CONFIG_TIFM_CORE is not set
# CONFIG_ICS932S401 is not set
CONFIG_ENCLOSURE_SERVICES=y
# CONFIG_HP_ILO is not set
# CONFIG_APDS9802ALS is not set
CONFIG_ISL29003=y
# CONFIG_ISL29020 is not set
# CONFIG_SENSORS_TSL2550 is not set
CONFIG_SENSORS_BH1770=y
CONFIG_SENSORS_APDS990X=y
CONFIG_HMC6352=y
CONFIG_DS1682=y
# CONFIG_PCH_PHUB is not set
# CONFIG_SRAM is not set
# CONFIG_DW_XDATA_PCIE is not set
# CONFIG_PCI_ENDPOINT_TEST is not set
CONFIG_XILINX_SDFEC=y
CONFIG_MISC_RTSX=y
# CONFIG_C2PORT is not set

#
# EEPROM support
#
CONFIG_EEPROM_AT24=y
# CONFIG_EEPROM_LEGACY is not set
CONFIG_EEPROM_MAX6875=y
CONFIG_EEPROM_93CX6=y
CONFIG_EEPROM_IDT_89HPESX=y
# CONFIG_EEPROM_EE1004 is not set
# end of EEPROM support

# CONFIG_CB710_CORE is not set

#
# Texas Instruments shared transport line discipline
#
# CONFIG_TI_ST is not set
# end of Texas Instruments shared transport line discipline

# CONFIG_SENSORS_LIS3_I2C is not set
CONFIG_ALTERA_STAPL=y
# CONFIG_INTEL_MEI is not set
# CONFIG_INTEL_MEI_ME is not set
# CONFIG_INTEL_MEI_TXE is not set
# CONFIG_VMWARE_VMCI is not set
CONFIG_ECHO=y
# CONFIG_MISC_ALCOR_PCI is not set
# CONFIG_MISC_RTSX_PCI is not set
CONFIG_MISC_RTSX_USB=y
# CONFIG_UACCE is not set
CONFIG_PVPANIC=y
# CONFIG_PVPANIC_MMIO is not set
# CONFIG_PVPANIC_PCI is not set
# CONFIG_GP_PCI1XXXX is not set
# end of Misc devices

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
CONFIG_RAID_ATTRS=y
CONFIG_SCSI_COMMON=y
CONFIG_SCSI=y
CONFIG_SCSI_DMA=y
CONFIG_SCSI_PROC_FS=y

#
# SCSI support type (disk, tape, CD-ROM)
#
CONFIG_BLK_DEV_SD=y
# CONFIG_CHR_DEV_ST is not set
# CONFIG_BLK_DEV_SR is not set
CONFIG_CHR_DEV_SG=y
# CONFIG_BLK_DEV_BSG is not set
CONFIG_CHR_DEV_SCH=y
# CONFIG_SCSI_ENCLOSURE is not set
# CONFIG_SCSI_CONSTANTS is not set
CONFIG_SCSI_LOGGING=y
CONFIG_SCSI_SCAN_ASYNC=y

#
# SCSI Transports
#
CONFIG_SCSI_SPI_ATTRS=y
# CONFIG_SCSI_FC_ATTRS is not set
# CONFIG_SCSI_ISCSI_ATTRS is not set
CONFIG_SCSI_SAS_ATTRS=y
CONFIG_SCSI_SAS_LIBSAS=y
CONFIG_SCSI_SAS_ATA=y
CONFIG_SCSI_SAS_HOST_SMP=y
CONFIG_SCSI_SRP_ATTRS=y
# end of SCSI Transports

# CONFIG_SCSI_LOWLEVEL is not set
# CONFIG_SCSI_DH is not set
# end of SCSI device support

CONFIG_ATA=y
CONFIG_SATA_HOST=y
CONFIG_PATA_TIMINGS=y
CONFIG_ATA_VERBOSE_ERROR=y
CONFIG_ATA_FORCE=y
# CONFIG_ATA_ACPI is not set
CONFIG_SATA_PMP=y

#
# Controllers with non-SFF native interface
#
# CONFIG_SATA_AHCI is not set
CONFIG_SATA_AHCI_PLATFORM=y
# CONFIG_AHCI_DWC is not set
# CONFIG_SATA_INIC162X is not set
# CONFIG_SATA_ACARD_AHCI is not set
# CONFIG_SATA_SIL24 is not set
CONFIG_ATA_SFF=y

#
# SFF controllers with custom DMA interface
#
# CONFIG_PDC_ADMA is not set
# CONFIG_SATA_QSTOR is not set
# CONFIG_SATA_SX4 is not set
CONFIG_ATA_BMDMA=y

#
# SATA SFF controllers with BMDMA
#
# CONFIG_ATA_PIIX is not set
CONFIG_SATA_MV=y
# CONFIG_SATA_NV is not set
# CONFIG_SATA_PROMISE is not set
# CONFIG_SATA_SIL is not set
# CONFIG_SATA_SIS is not set
# CONFIG_SATA_SVW is not set
# CONFIG_SATA_ULI is not set
# CONFIG_SATA_VIA is not set
# CONFIG_SATA_VITESSE is not set

#
# PATA SFF controllers with BMDMA
#
# CONFIG_PATA_ALI is not set
# CONFIG_PATA_AMD is not set
# CONFIG_PATA_ARTOP is not set
# CONFIG_PATA_ATIIXP is not set
# CONFIG_PATA_ATP867X is not set
# CONFIG_PATA_CMD64X is not set
# CONFIG_PATA_CS5520 is not set
# CONFIG_PATA_CS5530 is not set
# CONFIG_PATA_CS5535 is not set
# CONFIG_PATA_CS5536 is not set
# CONFIG_PATA_CYPRESS is not set
# CONFIG_PATA_EFAR is not set
# CONFIG_PATA_HPT366 is not set
# CONFIG_PATA_HPT37X is not set
# CONFIG_PATA_HPT3X2N is not set
# CONFIG_PATA_HPT3X3 is not set
# CONFIG_PATA_IT8213 is not set
# CONFIG_PATA_IT821X is not set
# CONFIG_PATA_JMICRON is not set
# CONFIG_PATA_MARVELL is not set
# CONFIG_PATA_NETCELL is not set
# CONFIG_PATA_NINJA32 is not set
# CONFIG_PATA_NS87415 is not set
# CONFIG_PATA_OLDPIIX is not set
# CONFIG_PATA_OPTIDMA is not set
# CONFIG_PATA_PDC2027X is not set
# CONFIG_PATA_PDC_OLD is not set
# CONFIG_PATA_RADISYS is not set
# CONFIG_PATA_RDC is not set
# CONFIG_PATA_SC1200 is not set
# CONFIG_PATA_SCH is not set
# CONFIG_PATA_SERVERWORKS is not set
# CONFIG_PATA_SIL680 is not set
# CONFIG_PATA_SIS is not set
# CONFIG_PATA_TOSHIBA is not set
# CONFIG_PATA_TRIFLEX is not set
# CONFIG_PATA_VIA is not set
# CONFIG_PATA_WINBOND is not set

#
# PIO-only SFF controllers
#
# CONFIG_PATA_CMD640_PCI is not set
CONFIG_PATA_ISAPNP=y
# CONFIG_PATA_MPIIX is not set
# CONFIG_PATA_NS87410 is not set
# CONFIG_PATA_OPTI is not set
CONFIG_PATA_PCMCIA=y
CONFIG_PATA_QDI=y
# CONFIG_PATA_RZ1000 is not set
CONFIG_PATA_WINBOND_VLB=y
CONFIG_PATA_PARPORT=y

#
# Parallel IDE protocol modules
#
CONFIG_PATA_PARPORT_ATEN=y
CONFIG_PATA_PARPORT_BPCK=y
# CONFIG_PATA_PARPORT_BPCK6 is not set
CONFIG_PATA_PARPORT_COMM=y
CONFIG_PATA_PARPORT_DSTR=y
# CONFIG_PATA_PARPORT_FIT2 is not set
CONFIG_PATA_PARPORT_FIT3=y
CONFIG_PATA_PARPORT_EPAT=y
CONFIG_PATA_PARPORT_EPATC8=y
CONFIG_PATA_PARPORT_EPIA=y
CONFIG_PATA_PARPORT_FRIQ=y
CONFIG_PATA_PARPORT_FRPW=y
CONFIG_PATA_PARPORT_KBIC=y
CONFIG_PATA_PARPORT_KTTI=y
# CONFIG_PATA_PARPORT_ON20 is not set
CONFIG_PATA_PARPORT_ON26=y

#
# Generic fallback / legacy drivers
#
# CONFIG_ATA_GENERIC is not set
CONFIG_PATA_LEGACY=y
CONFIG_MD=y
# CONFIG_BLK_DEV_MD is not set
# CONFIG_BCACHE is not set
# CONFIG_BLK_DEV_DM is not set
# CONFIG_TARGET_CORE is not set
# CONFIG_FUSION is not set

#
# IEEE 1394 (FireWire) support
#
CONFIG_FIREWIRE=y
# CONFIG_FIREWIRE_OHCI is not set
CONFIG_FIREWIRE_SBP2=y
# CONFIG_FIREWIRE_NET is not set
# CONFIG_FIREWIRE_NOSY is not set
# end of IEEE 1394 (FireWire) support

CONFIG_MACINTOSH_DRIVERS=y
CONFIG_MAC_EMUMOUSEBTN=y
CONFIG_NETDEVICES=y
CONFIG_NET_CORE=y
# CONFIG_BONDING is not set
# CONFIG_DUMMY is not set
# CONFIG_WIREGUARD is not set
# CONFIG_EQUALIZER is not set
# CONFIG_NET_FC is not set
# CONFIG_NET_TEAM is not set
# CONFIG_MACVLAN is not set
# CONFIG_IPVLAN is not set
# CONFIG_VXLAN is not set
# CONFIG_GENEVE is not set
# CONFIG_BAREUDP is not set
# CONFIG_GTP is not set
# CONFIG_MACSEC is not set
# CONFIG_NETCONSOLE is not set
# CONFIG_TUN is not set
# CONFIG_TUN_VNET_CROSS_LE is not set
# CONFIG_VETH is not set
CONFIG_VIRTIO_NET=m
# CONFIG_NLMON is not set
# CONFIG_ARCNET is not set
CONFIG_ETHERNET=y
CONFIG_NET_VENDOR_3COM=y
# CONFIG_EL3 is not set
# CONFIG_3C515 is not set
# CONFIG_PCMCIA_3C574 is not set
# CONFIG_PCMCIA_3C589 is not set
# CONFIG_VORTEX is not set
# CONFIG_TYPHOON is not set
CONFIG_NET_VENDOR_ADAPTEC=y
# CONFIG_ADAPTEC_STARFIRE is not set
CONFIG_NET_VENDOR_AGERE=y
# CONFIG_ET131X is not set
CONFIG_NET_VENDOR_ALACRITECH=y
# CONFIG_SLICOSS is not set
CONFIG_NET_VENDOR_ALTEON=y
# CONFIG_ACENIC is not set
# CONFIG_ALTERA_TSE is not set
CONFIG_NET_VENDOR_AMAZON=y
# CONFIG_NET_VENDOR_AMD is not set
CONFIG_NET_VENDOR_AQUANTIA=y
# CONFIG_AQTION is not set
CONFIG_NET_VENDOR_ARC=y
CONFIG_NET_VENDOR_ASIX=y
CONFIG_NET_VENDOR_ATHEROS=y
# CONFIG_ATL2 is not set
# CONFIG_ATL1 is not set
# CONFIG_ATL1E is not set
# CONFIG_ATL1C is not set
# CONFIG_ALX is not set
# CONFIG_CX_ECAT is not set
CONFIG_NET_VENDOR_BROADCOM=y
# CONFIG_B44 is not set
# CONFIG_BCMGENET is not set
# CONFIG_BNX2 is not set
# CONFIG_CNIC is not set
# CONFIG_TIGON3 is not set
# CONFIG_BNX2X is not set
# CONFIG_SYSTEMPORT is not set
# CONFIG_BNXT is not set
CONFIG_NET_VENDOR_CADENCE=y
# CONFIG_MACB is not set
CONFIG_NET_VENDOR_CAVIUM=y
CONFIG_NET_VENDOR_CHELSIO=y
# CONFIG_CHELSIO_T1 is not set
# CONFIG_CHELSIO_T3 is not set
# CONFIG_CHELSIO_T4 is not set
# CONFIG_CHELSIO_T4VF is not set
CONFIG_NET_VENDOR_CIRRUS=y
# CONFIG_CS89x0_ISA is not set
CONFIG_NET_VENDOR_CISCO=y
# CONFIG_ENIC is not set
CONFIG_NET_VENDOR_CORTINA=y
CONFIG_NET_VENDOR_DAVICOM=y
# CONFIG_DNET is not set
CONFIG_NET_VENDOR_DEC=y
# CONFIG_NET_TULIP is not set
CONFIG_NET_VENDOR_DLINK=y
# CONFIG_DL2K is not set
# CONFIG_SUNDANCE is not set
CONFIG_NET_VENDOR_EMULEX=y
# CONFIG_BE2NET is not set
CONFIG_NET_VENDOR_ENGLEDER=y
# CONFIG_TSNEP is not set
CONFIG_NET_VENDOR_EZCHIP=y
CONFIG_NET_VENDOR_FUJITSU=y
# CONFIG_PCMCIA_FMVJ18X is not set
CONFIG_NET_VENDOR_FUNGIBLE=y
CONFIG_NET_VENDOR_GOOGLE=y
CONFIG_NET_VENDOR_HUAWEI=y
CONFIG_NET_VENDOR_I825XX=y
CONFIG_NET_VENDOR_INTEL=y
# CONFIG_E100 is not set
CONFIG_E1000=y
# CONFIG_E1000E is not set
# CONFIG_IGB is not set
# CONFIG_IGBVF is not set
# CONFIG_IXGBE is not set
# CONFIG_I40E is not set
# CONFIG_IGC is not set
# CONFIG_JME is not set
CONFIG_NET_VENDOR_LITEX=y
CONFIG_NET_VENDOR_MARVELL=y
# CONFIG_MVMDIO is not set
# CONFIG_SKGE is not set
# CONFIG_SKY2 is not set
CONFIG_NET_VENDOR_MELLANOX=y
# CONFIG_MLX4_EN is not set
# CONFIG_MLX5_CORE is not set
# CONFIG_MLXSW_CORE is not set
# CONFIG_MLXFW is not set
CONFIG_NET_VENDOR_MICREL=y
# CONFIG_KS8851_MLL is not set
# CONFIG_KSZ884X_PCI is not set
CONFIG_NET_VENDOR_MICROCHIP=y
# CONFIG_LAN743X is not set
# CONFIG_VCAP is not set
CONFIG_NET_VENDOR_MICROSEMI=y
CONFIG_NET_VENDOR_MICROSOFT=y
CONFIG_NET_VENDOR_MYRI=y
# CONFIG_MYRI10GE is not set
# CONFIG_FEALNX is not set
CONFIG_NET_VENDOR_NI=y
# CONFIG_NI_XGE_MANAGEMENT_ENET is not set
CONFIG_NET_VENDOR_NATSEMI=y
# CONFIG_NATSEMI is not set
# CONFIG_NS83820 is not set
CONFIG_NET_VENDOR_NETERION=y
# CONFIG_S2IO is not set
CONFIG_NET_VENDOR_NETRONOME=y
CONFIG_NET_VENDOR_8390=y
# CONFIG_PCMCIA_AXNET is not set
# CONFIG_NE2000 is not set
# CONFIG_NE2K_PCI is not set
# CONFIG_PCMCIA_PCNET is not set
# CONFIG_ULTRA is not set
# CONFIG_WD80x3 is not set
CONFIG_NET_VENDOR_NVIDIA=y
# CONFIG_FORCEDETH is not set
CONFIG_NET_VENDOR_OKI=y
# CONFIG_PCH_GBE is not set
# CONFIG_ETHOC is not set
CONFIG_NET_VENDOR_PACKET_ENGINES=y
# CONFIG_HAMACHI is not set
# CONFIG_YELLOWFIN is not set
CONFIG_NET_VENDOR_PENSANDO=y
CONFIG_NET_VENDOR_QLOGIC=y
# CONFIG_QLA3XXX is not set
# CONFIG_QLCNIC is not set
# CONFIG_NETXEN_NIC is not set
# CONFIG_QED is not set
CONFIG_NET_VENDOR_BROCADE=y
# CONFIG_BNA is not set
CONFIG_NET_VENDOR_QUALCOMM=y
# CONFIG_QCOM_EMAC is not set
# CONFIG_RMNET is not set
CONFIG_NET_VENDOR_RDC=y
# CONFIG_R6040 is not set
CONFIG_NET_VENDOR_REALTEK=y
# CONFIG_ATP is not set
# CONFIG_8139CP is not set
# CONFIG_8139TOO is not set
# CONFIG_R8169 is not set
CONFIG_NET_VENDOR_RENESAS=y
CONFIG_NET_VENDOR_ROCKER=y
CONFIG_NET_VENDOR_SAMSUNG=y
# CONFIG_SXGBE_ETH is not set
CONFIG_NET_VENDOR_SEEQ=y
CONFIG_NET_VENDOR_SILAN=y
# CONFIG_SC92031 is not set
CONFIG_NET_VENDOR_SIS=y
# CONFIG_SIS900 is not set
# CONFIG_SIS190 is not set
CONFIG_NET_VENDOR_SOLARFLARE=y
# CONFIG_SFC is not set
# CONFIG_SFC_FALCON is not set
# CONFIG_SFC_SIENA is not set
CONFIG_NET_VENDOR_SMSC=y
# CONFIG_SMC9194 is not set
# CONFIG_PCMCIA_SMC91C92 is not set
# CONFIG_EPIC100 is not set
# CONFIG_SMSC911X is not set
# CONFIG_SMSC9420 is not set
CONFIG_NET_VENDOR_SOCIONEXT=y
CONFIG_NET_VENDOR_STMICRO=y
# CONFIG_STMMAC_ETH is not set
CONFIG_NET_VENDOR_SUN=y
# CONFIG_HAPPYMEAL is not set
# CONFIG_SUNGEM is not set
# CONFIG_CASSINI is not set
# CONFIG_NIU is not set
CONFIG_NET_VENDOR_SYNOPSYS=y
# CONFIG_DWC_XLGMAC is not set
CONFIG_NET_VENDOR_TEHUTI=y
# CONFIG_TEHUTI is not set
CONFIG_NET_VENDOR_TI=y
# CONFIG_TI_CPSW_PHY_SEL is not set
# CONFIG_TLAN is not set
CONFIG_NET_VENDOR_VERTEXCOM=y
CONFIG_NET_VENDOR_VIA=y
# CONFIG_VIA_RHINE is not set
# CONFIG_VIA_VELOCITY is not set
CONFIG_NET_VENDOR_WANGXUN=y
# CONFIG_NGBE is not set
# CONFIG_TXGBE is not set
CONFIG_NET_VENDOR_WIZNET=y
# CONFIG_WIZNET_W5100 is not set
# CONFIG_WIZNET_W5300 is not set
CONFIG_NET_VENDOR_XILINX=y
# CONFIG_XILINX_EMACLITE is not set
# CONFIG_XILINX_AXI_EMAC is not set
# CONFIG_XILINX_LL_TEMAC is not set
CONFIG_NET_VENDOR_XIRCOM=y
# CONFIG_PCMCIA_XIRC2PS is not set
# CONFIG_FDDI is not set
# CONFIG_HIPPI is not set
# CONFIG_NET_SB1000 is not set
# CONFIG_PHYLIB is not set
# CONFIG_PSE_CONTROLLER is not set
# CONFIG_MDIO_DEVICE is not set

#
# PCS device drivers
#
# end of PCS device drivers

# CONFIG_PLIP is not set
# CONFIG_PPP is not set
# CONFIG_SLIP is not set
CONFIG_USB_NET_DRIVERS=y
# CONFIG_USB_CATC is not set
# CONFIG_USB_KAWETH is not set
# CONFIG_USB_PEGASUS is not set
# CONFIG_USB_RTL8150 is not set
# CONFIG_USB_RTL8152 is not set
# CONFIG_USB_LAN78XX is not set
# CONFIG_USB_USBNET is not set
# CONFIG_USB_IPHETH is not set
CONFIG_WLAN=y
CONFIG_WLAN_VENDOR_ADMTEK=y
CONFIG_WLAN_VENDOR_ATH=y
# CONFIG_ATH_DEBUG is not set
# CONFIG_ATH5K_PCI is not set
CONFIG_WLAN_VENDOR_ATMEL=y
CONFIG_WLAN_VENDOR_BROADCOM=y
CONFIG_WLAN_VENDOR_CISCO=y
CONFIG_WLAN_VENDOR_INTEL=y
CONFIG_WLAN_VENDOR_INTERSIL=y
# CONFIG_HOSTAP is not set
CONFIG_WLAN_VENDOR_MARVELL=y
CONFIG_WLAN_VENDOR_MEDIATEK=y
CONFIG_WLAN_VENDOR_MICROCHIP=y
CONFIG_WLAN_VENDOR_PURELIFI=y
CONFIG_WLAN_VENDOR_RALINK=y
CONFIG_WLAN_VENDOR_REALTEK=y
CONFIG_WLAN_VENDOR_RSI=y
CONFIG_WLAN_VENDOR_SILABS=y
CONFIG_WLAN_VENDOR_ST=y
CONFIG_WLAN_VENDOR_TI=y
CONFIG_WLAN_VENDOR_ZYDAS=y
CONFIG_WLAN_VENDOR_QUANTENNA=y
# CONFIG_PCMCIA_RAYCS is not set
# CONFIG_WAN is not set

#
# Wireless WAN
#
# CONFIG_WWAN is not set
# end of Wireless WAN

# CONFIG_VMXNET3 is not set
# CONFIG_FUJITSU_ES is not set
# CONFIG_HYPERV_NET is not set
# CONFIG_NETDEVSIM is not set
CONFIG_NET_FAILOVER=m
# CONFIG_ISDN is not set

#
# Input device support
#
CONFIG_INPUT=y
# CONFIG_INPUT_LEDS is not set
CONFIG_INPUT_FF_MEMLESS=y
CONFIG_INPUT_SPARSEKMAP=y
CONFIG_INPUT_MATRIXKMAP=y
CONFIG_INPUT_VIVALDIFMAP=y

#
# Userland interfaces
#
# CONFIG_INPUT_MOUSEDEV is not set
CONFIG_INPUT_JOYDEV=y
CONFIG_INPUT_EVDEV=y
CONFIG_INPUT_EVBUG=y

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
CONFIG_KEYBOARD_ADC=y
CONFIG_KEYBOARD_ADP5588=y
CONFIG_KEYBOARD_ADP5589=y
CONFIG_KEYBOARD_ATKBD=y
CONFIG_KEYBOARD_QT1050=y
# CONFIG_KEYBOARD_QT1070 is not set
# CONFIG_KEYBOARD_QT2160 is not set
# CONFIG_KEYBOARD_DLINK_DIR685 is not set
CONFIG_KEYBOARD_LKKBD=y
CONFIG_KEYBOARD_GPIO=y
CONFIG_KEYBOARD_GPIO_POLLED=y
# CONFIG_KEYBOARD_TCA6416 is not set
CONFIG_KEYBOARD_TCA8418=y
CONFIG_KEYBOARD_MATRIX=y
CONFIG_KEYBOARD_LM8323=y
CONFIG_KEYBOARD_LM8333=y
CONFIG_KEYBOARD_MAX7359=y
CONFIG_KEYBOARD_MCS=y
CONFIG_KEYBOARD_MPR121=y
# CONFIG_KEYBOARD_NEWTON is not set
CONFIG_KEYBOARD_OPENCORES=y
CONFIG_KEYBOARD_PINEPHONE=y
# CONFIG_KEYBOARD_SAMSUNG is not set
CONFIG_KEYBOARD_GOLDFISH_EVENTS=y
# CONFIG_KEYBOARD_STOWAWAY is not set
# CONFIG_KEYBOARD_SUNKBD is not set
CONFIG_KEYBOARD_TM2_TOUCHKEY=y
CONFIG_KEYBOARD_XTKBD=y
# CONFIG_KEYBOARD_MTK_PMIC is not set
CONFIG_KEYBOARD_CYPRESS_SF=y
CONFIG_INPUT_MOUSE=y
# CONFIG_MOUSE_PS2 is not set
# CONFIG_MOUSE_SERIAL is not set
CONFIG_MOUSE_APPLETOUCH=y
CONFIG_MOUSE_BCM5974=y
CONFIG_MOUSE_CYAPA=y
CONFIG_MOUSE_ELAN_I2C=y
# CONFIG_MOUSE_ELAN_I2C_I2C is not set
# CONFIG_MOUSE_ELAN_I2C_SMBUS is not set
# CONFIG_MOUSE_INPORT is not set
CONFIG_MOUSE_LOGIBM=y
CONFIG_MOUSE_PC110PAD=y
CONFIG_MOUSE_VSXXXAA=y
# CONFIG_MOUSE_GPIO is not set
# CONFIG_MOUSE_SYNAPTICS_I2C is not set
# CONFIG_MOUSE_SYNAPTICS_USB is not set
CONFIG_INPUT_JOYSTICK=y
# CONFIG_JOYSTICK_ANALOG is not set
# CONFIG_JOYSTICK_A3D is not set
CONFIG_JOYSTICK_ADC=y
CONFIG_JOYSTICK_ADI=y
# CONFIG_JOYSTICK_COBRA is not set
CONFIG_JOYSTICK_GF2K=y
# CONFIG_JOYSTICK_GRIP is not set
CONFIG_JOYSTICK_GRIP_MP=y
# CONFIG_JOYSTICK_GUILLEMOT is not set
CONFIG_JOYSTICK_INTERACT=y
# CONFIG_JOYSTICK_SIDEWINDER is not set
# CONFIG_JOYSTICK_TMDC is not set
# CONFIG_JOYSTICK_IFORCE is not set
CONFIG_JOYSTICK_WARRIOR=y
CONFIG_JOYSTICK_MAGELLAN=y
CONFIG_JOYSTICK_SPACEORB=y
# CONFIG_JOYSTICK_SPACEBALL is not set
CONFIG_JOYSTICK_STINGER=y
# CONFIG_JOYSTICK_TWIDJOY is not set
CONFIG_JOYSTICK_ZHENHUA=y
CONFIG_JOYSTICK_DB9=y
CONFIG_JOYSTICK_GAMECON=y
CONFIG_JOYSTICK_TURBOGRAFX=y
CONFIG_JOYSTICK_AS5011=y
CONFIG_JOYSTICK_JOYDUMP=y
CONFIG_JOYSTICK_XPAD=y
CONFIG_JOYSTICK_XPAD_FF=y
CONFIG_JOYSTICK_XPAD_LEDS=y
# CONFIG_JOYSTICK_WALKERA0701 is not set
# CONFIG_JOYSTICK_PXRC is not set
CONFIG_JOYSTICK_QWIIC=y
CONFIG_JOYSTICK_FSIA6B=y
# CONFIG_JOYSTICK_SENSEHAT is not set
CONFIG_INPUT_TABLET=y
CONFIG_TABLET_USB_ACECAD=y
CONFIG_TABLET_USB_AIPTEK=y
CONFIG_TABLET_USB_HANWANG=y
CONFIG_TABLET_USB_KBTAB=y
# CONFIG_TABLET_USB_PEGASUS is not set
CONFIG_TABLET_SERIAL_WACOM4=y
# CONFIG_INPUT_TOUCHSCREEN is not set
CONFIG_INPUT_MISC=y
CONFIG_INPUT_88PM80X_ONKEY=y
CONFIG_INPUT_AD714X=y
# CONFIG_INPUT_AD714X_I2C is not set
CONFIG_INPUT_ATC260X_ONKEY=y
CONFIG_INPUT_BMA150=y
CONFIG_INPUT_E3X0_BUTTON=y
# CONFIG_INPUT_PCSPKR is not set
CONFIG_INPUT_MAX77693_HAPTIC=y
# CONFIG_INPUT_MAX8997_HAPTIC is not set
CONFIG_INPUT_MMA8450=y
CONFIG_INPUT_APANEL=y
CONFIG_INPUT_GPIO_BEEPER=y
# CONFIG_INPUT_GPIO_DECODER is not set
CONFIG_INPUT_GPIO_VIBRA=y
# CONFIG_INPUT_WISTRON_BTNS is not set
# CONFIG_INPUT_ATLAS_BTNS is not set
# CONFIG_INPUT_ATI_REMOTE2 is not set
# CONFIG_INPUT_KEYSPAN_REMOTE is not set
# CONFIG_INPUT_KXTJ9 is not set
CONFIG_INPUT_POWERMATE=y
CONFIG_INPUT_YEALINK=y
CONFIG_INPUT_CM109=y
# CONFIG_INPUT_REGULATOR_HAPTIC is not set
# CONFIG_INPUT_RETU_PWRBUTTON is not set
CONFIG_INPUT_TWL6040_VIBRA=y
# CONFIG_INPUT_UINPUT is not set
CONFIG_INPUT_PCF50633_PMU=y
CONFIG_INPUT_PCF8574=y
CONFIG_INPUT_PWM_BEEPER=y
CONFIG_INPUT_PWM_VIBRA=y
# CONFIG_INPUT_GPIO_ROTARY_ENCODER is not set
CONFIG_INPUT_DA7280_HAPTICS=y
# CONFIG_INPUT_DA9052_ONKEY is not set
CONFIG_INPUT_DA9063_ONKEY=y
# CONFIG_INPUT_ADXL34X is not set
CONFIG_INPUT_IBM_PANEL=y
CONFIG_INPUT_IMS_PCU=y
# CONFIG_INPUT_IQS269A is not set
# CONFIG_INPUT_IQS626A is not set
# CONFIG_INPUT_IQS7222 is not set
# CONFIG_INPUT_CMA3000 is not set
CONFIG_INPUT_IDEAPAD_SLIDEBAR=y
CONFIG_INPUT_SOC_BUTTON_ARRAY=y
# CONFIG_INPUT_DRV260X_HAPTICS is not set
CONFIG_INPUT_DRV2665_HAPTICS=y
CONFIG_INPUT_DRV2667_HAPTICS=y
CONFIG_INPUT_RT5120_PWRKEY=y
CONFIG_RMI4_CORE=y
# CONFIG_RMI4_I2C is not set
# CONFIG_RMI4_SMB is not set
# CONFIG_RMI4_F03 is not set
CONFIG_RMI4_2D_SENSOR=y
CONFIG_RMI4_F11=y
CONFIG_RMI4_F12=y
CONFIG_RMI4_F30=y
# CONFIG_RMI4_F34 is not set
CONFIG_RMI4_F3A=y
CONFIG_RMI4_F55=y

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
CONFIG_SERIO_I8042=y
CONFIG_SERIO_SERPORT=y
# CONFIG_SERIO_CT82C710 is not set
# CONFIG_SERIO_PARKBD is not set
# CONFIG_SERIO_PCIPS2 is not set
CONFIG_SERIO_LIBPS2=y
CONFIG_SERIO_RAW=y
# CONFIG_SERIO_ALTERA_PS2 is not set
CONFIG_SERIO_PS2MULT=y
CONFIG_SERIO_ARC_PS2=y
# CONFIG_HYPERV_KEYBOARD is not set
CONFIG_SERIO_GPIO_PS2=y
CONFIG_USERIO=y
CONFIG_GAMEPORT=y
# CONFIG_GAMEPORT_NS558 is not set
CONFIG_GAMEPORT_L4=y
# CONFIG_GAMEPORT_EMU10K1 is not set
# CONFIG_GAMEPORT_FM801 is not set
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=y
CONFIG_VT=y
CONFIG_CONSOLE_TRANSLATIONS=y
CONFIG_VT_CONSOLE=y
CONFIG_HW_CONSOLE=y
CONFIG_VT_HW_CONSOLE_BINDING=y
CONFIG_UNIX98_PTYS=y
# CONFIG_LEGACY_PTYS is not set
# CONFIG_LEGACY_TIOCSTI is not set
# CONFIG_LDISC_AUTOLOAD is not set

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=y
CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=y
CONFIG_SERIAL_8250_PNP=y
# CONFIG_SERIAL_8250_16550A_VARIANTS is not set
CONFIG_SERIAL_8250_FINTEK=y
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_8250_PCILIB=y
CONFIG_SERIAL_8250_PCI=y
CONFIG_SERIAL_8250_EXAR=y
# CONFIG_SERIAL_8250_CS is not set
CONFIG_SERIAL_8250_NR_UARTS=4
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
CONFIG_SERIAL_8250_EXTENDED=y
CONFIG_SERIAL_8250_MANY_PORTS=y
# CONFIG_SERIAL_8250_FOURPORT is not set
CONFIG_SERIAL_8250_ACCENT=y
# CONFIG_SERIAL_8250_BOCA is not set
# CONFIG_SERIAL_8250_EXAR_ST16C554 is not set
# CONFIG_SERIAL_8250_HUB6 is not set
# CONFIG_SERIAL_8250_PCI1XXXX is not set
CONFIG_SERIAL_8250_SHARE_IRQ=y
# CONFIG_SERIAL_8250_DETECT_IRQ is not set
CONFIG_SERIAL_8250_RSA=y
CONFIG_SERIAL_8250_DWLIB=y
CONFIG_SERIAL_8250_DW=y
CONFIG_SERIAL_8250_RT288X=y
CONFIG_SERIAL_8250_LPSS=y
CONFIG_SERIAL_8250_MID=y
CONFIG_SERIAL_8250_PERICOM=y

#
# Non-8250 serial port support
#
CONFIG_SERIAL_UARTLITE=y
# CONFIG_SERIAL_UARTLITE_CONSOLE is not set
CONFIG_SERIAL_UARTLITE_NR_UARTS=1
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
# CONFIG_SERIAL_JSM is not set
# CONFIG_SERIAL_LANTIQ is not set
CONFIG_SERIAL_SCCNXP=y
# CONFIG_SERIAL_SCCNXP_CONSOLE is not set
# CONFIG_SERIAL_SC16IS7XX is not set
# CONFIG_SERIAL_TIMBERDALE is not set
CONFIG_SERIAL_ALTERA_JTAGUART=y
CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE=y
CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE_BYPASS=y
CONFIG_SERIAL_ALTERA_UART=y
CONFIG_SERIAL_ALTERA_UART_MAXPORTS=4
CONFIG_SERIAL_ALTERA_UART_BAUDRATE=115200
# CONFIG_SERIAL_ALTERA_UART_CONSOLE is not set
# CONFIG_SERIAL_PCH_UART is not set
CONFIG_SERIAL_ARC=y
CONFIG_SERIAL_ARC_CONSOLE=y
CONFIG_SERIAL_ARC_NR_PORTS=1
# CONFIG_SERIAL_RP2 is not set
# CONFIG_SERIAL_FSL_LPUART is not set
CONFIG_SERIAL_FSL_LINFLEXUART=y
# CONFIG_SERIAL_FSL_LINFLEXUART_CONSOLE is not set
CONFIG_SERIAL_SPRD=y
CONFIG_SERIAL_SPRD_CONSOLE=y
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
CONFIG_SERIAL_NONSTANDARD=y
CONFIG_MOXA_INTELLIO=y
# CONFIG_MOXA_SMARTIO is not set
# CONFIG_SYNCLINK_GT is not set
CONFIG_N_HDLC=y
CONFIG_GOLDFISH_TTY=y
CONFIG_GOLDFISH_TTY_EARLY_CONSOLE=y
# CONFIG_IPWIRELESS is not set
# CONFIG_N_GSM is not set
# CONFIG_NOZOMI is not set
CONFIG_NULL_TTY=y
CONFIG_RPMSG_TTY=y
# CONFIG_SERIAL_DEV_BUS is not set
CONFIG_PRINTER=y
CONFIG_LP_CONSOLE=y
# CONFIG_PPDEV is not set
# CONFIG_VIRTIO_CONSOLE is not set
# CONFIG_IPMI_HANDLER is not set
CONFIG_SSIF_IPMI_BMC=y
CONFIG_IPMB_DEVICE_INTERFACE=y
CONFIG_HW_RANDOM=y
# CONFIG_HW_RANDOM_TIMERIOMEM is not set
CONFIG_HW_RANDOM_INTEL=y
# CONFIG_HW_RANDOM_AMD is not set
CONFIG_HW_RANDOM_BA431=y
CONFIG_HW_RANDOM_GEODE=y
CONFIG_HW_RANDOM_VIA=y
CONFIG_HW_RANDOM_VIRTIO=y
CONFIG_HW_RANDOM_XIPHERA=y
CONFIG_DTLK=y
# CONFIG_APPLICOM is not set
# CONFIG_SONYPI is not set
CONFIG_MWAVE=y
# CONFIG_SCx200_GPIO is not set
CONFIG_PC8736x_GPIO=y
CONFIG_NSC_GPIO=y
CONFIG_DEVMEM=y
# CONFIG_NVRAM is not set
CONFIG_DEVPORT=y
# CONFIG_HPET is not set
# CONFIG_HANGCHECK_TIMER is not set
CONFIG_TCG_TPM=y
# CONFIG_HW_RANDOM_TPM is not set
CONFIG_TCG_TIS_CORE=y
CONFIG_TCG_TIS=y
# CONFIG_TCG_TIS_I2C is not set
CONFIG_TCG_TIS_I2C_CR50=y
# CONFIG_TCG_TIS_I2C_ATMEL is not set
# CONFIG_TCG_TIS_I2C_INFINEON is not set
CONFIG_TCG_TIS_I2C_NUVOTON=y
# CONFIG_TCG_NSC is not set
# CONFIG_TCG_ATMEL is not set
CONFIG_TCG_INFINEON=y
CONFIG_TCG_CRB=y
CONFIG_TCG_VTPM_PROXY=y
CONFIG_TCG_TIS_ST33ZP24=y
CONFIG_TCG_TIS_ST33ZP24_I2C=y
# CONFIG_TELCLOCK is not set
CONFIG_XILLYBUS_CLASS=y
# CONFIG_XILLYBUS is not set
CONFIG_XILLYUSB=y
# end of Character devices

#
# I2C support
#
CONFIG_I2C=y
# CONFIG_ACPI_I2C_OPREGION is not set
CONFIG_I2C_BOARDINFO=y
# CONFIG_I2C_COMPAT is not set
CONFIG_I2C_CHARDEV=y
CONFIG_I2C_MUX=y

#
# Multiplexer I2C Chip support
#
# CONFIG_I2C_MUX_GPIO is not set
# CONFIG_I2C_MUX_LTC4306 is not set
CONFIG_I2C_MUX_PCA9541=y
# CONFIG_I2C_MUX_PCA954x is not set
# CONFIG_I2C_MUX_REG is not set
CONFIG_I2C_MUX_MLXCPLD=y
# end of Multiplexer I2C Chip support

# CONFIG_I2C_HELPER_AUTO is not set
CONFIG_I2C_SMBUS=y

#
# I2C Algorithms
#
CONFIG_I2C_ALGOBIT=y
# CONFIG_I2C_ALGOPCF is not set
CONFIG_I2C_ALGOPCA=y
# end of I2C Algorithms

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
# CONFIG_I2C_ALI1535 is not set
# CONFIG_I2C_ALI1563 is not set
# CONFIG_I2C_ALI15X3 is not set
# CONFIG_I2C_AMD756 is not set
# CONFIG_I2C_AMD8111 is not set
# CONFIG_I2C_AMD_MP2 is not set
# CONFIG_I2C_I801 is not set
# CONFIG_I2C_ISCH is not set
# CONFIG_I2C_ISMT is not set
# CONFIG_I2C_PIIX4 is not set
# CONFIG_I2C_NFORCE2 is not set
# CONFIG_I2C_NVIDIA_GPU is not set
# CONFIG_I2C_SIS5595 is not set
# CONFIG_I2C_SIS630 is not set
# CONFIG_I2C_SIS96X is not set
# CONFIG_I2C_VIA is not set
# CONFIG_I2C_VIAPRO is not set

#
# ACPI drivers
#
# CONFIG_I2C_SCMI is not set

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
# CONFIG_I2C_CBUS_GPIO is not set
CONFIG_I2C_DESIGNWARE_CORE=y
CONFIG_I2C_DESIGNWARE_SLAVE=y
CONFIG_I2C_DESIGNWARE_PLATFORM=y
# CONFIG_I2C_DESIGNWARE_PCI is not set
# CONFIG_I2C_EG20T is not set
CONFIG_I2C_EMEV2=y
CONFIG_I2C_GPIO=y
# CONFIG_I2C_GPIO_FAULT_INJECTOR is not set
CONFIG_I2C_KEMPLD=y
CONFIG_I2C_OCORES=y
CONFIG_I2C_PCA_PLATFORM=y
# CONFIG_I2C_SIMTEC is not set
CONFIG_I2C_XILINX=y

#
# External I2C/SMBus adapter drivers
#
CONFIG_I2C_DIOLAN_U2C=y
CONFIG_I2C_DLN2=y
CONFIG_I2C_CP2615=y
CONFIG_I2C_PARPORT=y
# CONFIG_I2C_PCI1XXXX is not set
CONFIG_I2C_ROBOTFUZZ_OSIF=y
CONFIG_I2C_TAOS_EVM=y
CONFIG_I2C_TINY_USB=y
CONFIG_I2C_VIPERBOARD=y

#
# Other I2C/SMBus bus drivers
#
# CONFIG_I2C_PCA_ISA is not set
# CONFIG_SCx200_ACB is not set
CONFIG_I2C_VIRTIO=y
# end of I2C Hardware Bus support

# CONFIG_I2C_STUB is not set
CONFIG_I2C_SLAVE=y
# CONFIG_I2C_SLAVE_EEPROM is not set
CONFIG_I2C_SLAVE_TESTUNIT=y
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
# end of I2C support

CONFIG_I3C=y
CONFIG_CDNS_I3C_MASTER=y
# CONFIG_DW_I3C_MASTER is not set
# CONFIG_SVC_I3C_MASTER is not set
CONFIG_MIPI_I3C_HCI=y
# CONFIG_SPI is not set
CONFIG_SPMI=y
# CONFIG_SPMI_HISI3670 is not set
# CONFIG_HSI is not set
CONFIG_PPS=y
# CONFIG_PPS_DEBUG is not set
# CONFIG_NTP_PPS is not set

#
# PPS clients support
#
# CONFIG_PPS_CLIENT_KTIMER is not set
# CONFIG_PPS_CLIENT_LDISC is not set
# CONFIG_PPS_CLIENT_PARPORT is not set
# CONFIG_PPS_CLIENT_GPIO is not set

#
# PPS generators support
#

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK=y
CONFIG_PTP_1588_CLOCK_OPTIONAL=y

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
#
# CONFIG_PTP_1588_CLOCK_PCH is not set
CONFIG_PTP_1588_CLOCK_KVM=y
# CONFIG_PTP_1588_CLOCK_IDT82P33 is not set
# CONFIG_PTP_1588_CLOCK_IDTCM is not set
# CONFIG_PTP_1588_CLOCK_VMW is not set
# end of PTP clock support

CONFIG_PINCTRL=y
CONFIG_PINMUX=y
CONFIG_PINCONF=y
CONFIG_GENERIC_PINCONF=y
# CONFIG_DEBUG_PINCTRL is not set
# CONFIG_PINCTRL_AMD is not set
CONFIG_PINCTRL_CY8C95X0=y
CONFIG_PINCTRL_DA9062=y
# CONFIG_PINCTRL_MCP23S08 is not set
CONFIG_PINCTRL_SX150X=y

#
# Intel pinctrl drivers
#
CONFIG_PINCTRL_BAYTRAIL=y
CONFIG_PINCTRL_CHERRYVIEW=y
# CONFIG_PINCTRL_LYNXPOINT is not set
CONFIG_PINCTRL_INTEL=y
# CONFIG_PINCTRL_ALDERLAKE is not set
# CONFIG_PINCTRL_BROXTON is not set
CONFIG_PINCTRL_CANNONLAKE=y
CONFIG_PINCTRL_CEDARFORK=y
CONFIG_PINCTRL_DENVERTON=y
# CONFIG_PINCTRL_ELKHARTLAKE is not set
# CONFIG_PINCTRL_EMMITSBURG is not set
# CONFIG_PINCTRL_GEMINILAKE is not set
CONFIG_PINCTRL_ICELAKE=y
CONFIG_PINCTRL_JASPERLAKE=y
CONFIG_PINCTRL_LAKEFIELD=y
CONFIG_PINCTRL_LEWISBURG=y
# CONFIG_PINCTRL_METEORLAKE is not set
CONFIG_PINCTRL_SUNRISEPOINT=y
# CONFIG_PINCTRL_TIGERLAKE is not set
# end of Intel pinctrl drivers

#
# Renesas pinctrl drivers
#
# end of Renesas pinctrl drivers

CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_GPIO_ACPI=y
CONFIG_GPIOLIB_IRQCHIP=y
# CONFIG_DEBUG_GPIO is not set
CONFIG_GPIO_CDEV=y
CONFIG_GPIO_CDEV_V1=y
CONFIG_GPIO_GENERIC=y

#
# Memory mapped GPIO drivers
#
# CONFIG_GPIO_AMDPT is not set
CONFIG_GPIO_DWAPB=y
# CONFIG_GPIO_EXAR is not set
CONFIG_GPIO_GENERIC_PLATFORM=y
# CONFIG_GPIO_MB86S7X is not set
# CONFIG_GPIO_SIOX is not set
# CONFIG_GPIO_VX855 is not set
CONFIG_GPIO_AMD_FCH=y
# end of Memory mapped GPIO drivers

#
# Port-mapped I/O GPIO drivers
#
CONFIG_GPIO_F7188X=y
CONFIG_GPIO_IT87=y
CONFIG_GPIO_SCH311X=y
# CONFIG_GPIO_WINBOND is not set
CONFIG_GPIO_WS16C48=y
# end of Port-mapped I/O GPIO drivers

#
# I2C GPIO expanders
#
# CONFIG_GPIO_FXL6408 is not set
# CONFIG_GPIO_MAX7300 is not set
# CONFIG_GPIO_MAX732X is not set
# CONFIG_GPIO_PCA953X is not set
CONFIG_GPIO_PCA9570=y
# CONFIG_GPIO_PCF857X is not set
CONFIG_GPIO_TPIC2810=y
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
# CONFIG_GPIO_CRYSTAL_COVE is not set
CONFIG_GPIO_DA9052=y
CONFIG_GPIO_DLN2=y
# CONFIG_GPIO_ELKHARTLAKE is not set
CONFIG_GPIO_KEMPLD=y
CONFIG_GPIO_LP3943=y
# CONFIG_GPIO_RC5T583 is not set
# CONFIG_GPIO_TPS65086 is not set
CONFIG_GPIO_TPS6586X=y
# CONFIG_GPIO_TPS65912 is not set
CONFIG_GPIO_TQMX86=y
CONFIG_GPIO_TWL6040=y
CONFIG_GPIO_WHISKEY_COVE=y
CONFIG_GPIO_WM8350=y
# end of MFD GPIO expanders

#
# PCI GPIO expanders
#
# CONFIG_GPIO_AMD8111 is not set
# CONFIG_GPIO_BT8XX is not set
# CONFIG_GPIO_ML_IOH is not set
# CONFIG_GPIO_PCH is not set
# CONFIG_GPIO_PCI_IDIO_16 is not set
# CONFIG_GPIO_PCIE_IDIO_24 is not set
# CONFIG_GPIO_RDC321X is not set
# end of PCI GPIO expanders

#
# USB GPIO expanders
#
CONFIG_GPIO_VIPERBOARD=y
# end of USB GPIO expanders

#
# Virtual GPIO drivers
#
# CONFIG_GPIO_AGGREGATOR is not set
CONFIG_GPIO_LATCH=y
# CONFIG_GPIO_MOCKUP is not set
CONFIG_GPIO_VIRTIO=y
# CONFIG_GPIO_SIM is not set
# end of Virtual GPIO drivers

CONFIG_W1=y

#
# 1-wire Bus Masters
#
# CONFIG_W1_MASTER_MATROX is not set
# CONFIG_W1_MASTER_DS2490 is not set
CONFIG_W1_MASTER_DS2482=y
# CONFIG_W1_MASTER_GPIO is not set
# CONFIG_W1_MASTER_SGI is not set
# end of 1-wire Bus Masters

#
# 1-wire Slaves
#
# CONFIG_W1_SLAVE_THERM is not set
CONFIG_W1_SLAVE_SMEM=y
# CONFIG_W1_SLAVE_DS2405 is not set
# CONFIG_W1_SLAVE_DS2408 is not set
# CONFIG_W1_SLAVE_DS2413 is not set
CONFIG_W1_SLAVE_DS2406=y
CONFIG_W1_SLAVE_DS2423=y
# CONFIG_W1_SLAVE_DS2805 is not set
CONFIG_W1_SLAVE_DS2430=y
CONFIG_W1_SLAVE_DS2431=y
CONFIG_W1_SLAVE_DS2433=y
CONFIG_W1_SLAVE_DS2433_CRC=y
CONFIG_W1_SLAVE_DS2438=y
CONFIG_W1_SLAVE_DS250X=y
CONFIG_W1_SLAVE_DS2780=y
CONFIG_W1_SLAVE_DS2781=y
CONFIG_W1_SLAVE_DS28E04=y
CONFIG_W1_SLAVE_DS28E17=y
# end of 1-wire Slaves

CONFIG_POWER_RESET=y
CONFIG_POWER_RESET_ATC260X=y
# CONFIG_POWER_RESET_MT6323 is not set
CONFIG_POWER_RESET_RESTART=y
CONFIG_POWER_RESET_TPS65086=y
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
CONFIG_GENERIC_ADC_BATTERY=y
# CONFIG_IP5XXX_POWER is not set
CONFIG_WM8350_POWER=y
# CONFIG_TEST_POWER is not set
CONFIG_CHARGER_ADP5061=y
CONFIG_BATTERY_CW2015=y
CONFIG_BATTERY_DS2760=y
CONFIG_BATTERY_DS2780=y
CONFIG_BATTERY_DS2781=y
CONFIG_BATTERY_DS2782=y
# CONFIG_BATTERY_SAMSUNG_SDI is not set
# CONFIG_BATTERY_SBS is not set
CONFIG_CHARGER_SBS=y
CONFIG_MANAGER_SBS=y
CONFIG_BATTERY_BQ27XXX=y
CONFIG_BATTERY_BQ27XXX_I2C=y
# CONFIG_BATTERY_BQ27XXX_HDQ is not set
CONFIG_BATTERY_BQ27XXX_DT_UPDATES_NVM=y
# CONFIG_BATTERY_DA9030 is not set
# CONFIG_BATTERY_DA9052 is not set
CONFIG_CHARGER_DA9150=y
CONFIG_BATTERY_DA9150=y
CONFIG_BATTERY_MAX17040=y
# CONFIG_BATTERY_MAX17042 is not set
CONFIG_BATTERY_MAX1721X=y
# CONFIG_CHARGER_PCF50633 is not set
CONFIG_CHARGER_ISP1704=y
# CONFIG_CHARGER_MAX8903 is not set
CONFIG_CHARGER_LP8727=y
# CONFIG_CHARGER_LP8788 is not set
CONFIG_CHARGER_GPIO=y
# CONFIG_CHARGER_MANAGER is not set
# CONFIG_CHARGER_LT3651 is not set
# CONFIG_CHARGER_LTC4162L is not set
CONFIG_CHARGER_MAX14577=y
CONFIG_CHARGER_MAX77976=y
CONFIG_CHARGER_MAX8997=y
# CONFIG_CHARGER_MAX8998 is not set
# CONFIG_CHARGER_MT6370 is not set
CONFIG_CHARGER_BQ2415X=y
CONFIG_CHARGER_BQ24190=y
CONFIG_CHARGER_BQ24257=y
# CONFIG_CHARGER_BQ24735 is not set
# CONFIG_CHARGER_BQ2515X is not set
CONFIG_CHARGER_BQ25890=y
# CONFIG_CHARGER_BQ25980 is not set
# CONFIG_CHARGER_BQ256XX is not set
# CONFIG_CHARGER_SMB347 is not set
CONFIG_BATTERY_GAUGE_LTC2941=y
# CONFIG_BATTERY_GOLDFISH is not set
CONFIG_BATTERY_RT5033=y
CONFIG_CHARGER_RT9455=y
CONFIG_CHARGER_RT9467=y
CONFIG_CHARGER_RT9471=y
# CONFIG_CHARGER_BD99954 is not set
CONFIG_BATTERY_UG3105=y
# CONFIG_HWMON is not set
CONFIG_THERMAL=y
# CONFIG_THERMAL_NETLINK is not set
CONFIG_THERMAL_STATISTICS=y
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
CONFIG_THERMAL_WRITABLE_TRIPS=y
# CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE is not set
CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE=y
# CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
CONFIG_THERMAL_GOV_FAIR_SHARE=y
CONFIG_THERMAL_GOV_STEP_WISE=y
CONFIG_THERMAL_GOV_BANG_BANG=y
CONFIG_THERMAL_GOV_USER_SPACE=y
CONFIG_DEVFREQ_THERMAL=y
# CONFIG_THERMAL_EMULATION is not set

#
# Intel thermal drivers
#
# CONFIG_INTEL_POWERCLAMP is not set
CONFIG_X86_THERMAL_VECTOR=y
CONFIG_INTEL_TCC=y
CONFIG_X86_PKG_TEMP_THERMAL=y
# CONFIG_INTEL_SOC_DTS_THERMAL is not set

#
# ACPI INT340X thermal drivers
#
# end of ACPI INT340X thermal drivers

CONFIG_INTEL_BXT_PMIC_THERMAL=y
# CONFIG_INTEL_PCH_THERMAL is not set
CONFIG_INTEL_TCC_COOLING=y
# CONFIG_INTEL_HFI_THERMAL is not set
# end of Intel thermal drivers

CONFIG_GENERIC_ADC_THERMAL=y
CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
# CONFIG_WATCHDOG_NOWAYOUT is not set
CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=y
CONFIG_WATCHDOG_OPEN_TIMEOUT=0
# CONFIG_WATCHDOG_SYSFS is not set
# CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT is not set

#
# Watchdog Pretimeout Governors
#
CONFIG_WATCHDOG_PRETIMEOUT_GOV=y
CONFIG_WATCHDOG_PRETIMEOUT_GOV_SEL=m
# CONFIG_WATCHDOG_PRETIMEOUT_GOV_NOOP is not set
CONFIG_WATCHDOG_PRETIMEOUT_GOV_PANIC=y
CONFIG_WATCHDOG_PRETIMEOUT_DEFAULT_GOV_PANIC=y

#
# Watchdog Device Drivers
#
CONFIG_SOFT_WATCHDOG=y
# CONFIG_SOFT_WATCHDOG_PRETIMEOUT is not set
# CONFIG_DA9052_WATCHDOG is not set
CONFIG_DA9063_WATCHDOG=y
CONFIG_DA9062_WATCHDOG=y
CONFIG_MENF21BMC_WATCHDOG=y
# CONFIG_WDAT_WDT is not set
CONFIG_WM8350_WATCHDOG=y
CONFIG_XILINX_WATCHDOG=y
CONFIG_ZIIRAVE_WATCHDOG=y
CONFIG_CADENCE_WATCHDOG=y
CONFIG_DW_WATCHDOG=y
CONFIG_MAX63XX_WATCHDOG=y
CONFIG_RETU_WATCHDOG=y
CONFIG_ACQUIRE_WDT=y
CONFIG_ADVANTECH_WDT=y
CONFIG_ADVANTECH_EC_WDT=y
# CONFIG_ALIM1535_WDT is not set
# CONFIG_ALIM7101_WDT is not set
# CONFIG_EBC_C384_WDT is not set
# CONFIG_EXAR_WDT is not set
CONFIG_F71808E_WDT=y
# CONFIG_SP5100_TCO is not set
CONFIG_SBC_FITPC2_WATCHDOG=y
CONFIG_EUROTECH_WDT=y
CONFIG_IB700_WDT=y
CONFIG_IBMASR=y
CONFIG_WAFER_WDT=y
# CONFIG_I6300ESB_WDT is not set
# CONFIG_IE6XX_WDT is not set
# CONFIG_ITCO_WDT is not set
# CONFIG_IT8712F_WDT is not set
CONFIG_IT87_WDT=y
# CONFIG_HP_WATCHDOG is not set
CONFIG_KEMPLD_WDT=y
CONFIG_SC1200_WDT=y
# CONFIG_SCx200_WDT is not set
CONFIG_PC87413_WDT=y
# CONFIG_NV_TCO is not set
CONFIG_60XX_WDT=y
CONFIG_SBC8360_WDT=y
CONFIG_SBC7240_WDT=y
# CONFIG_CPU5_WDT is not set
CONFIG_SMSC_SCH311X_WDT=y
# CONFIG_SMSC37B787_WDT is not set
CONFIG_TQMX86_WDT=y
# CONFIG_VIA_WDT is not set
CONFIG_W83627HF_WDT=y
CONFIG_W83877F_WDT=y
CONFIG_W83977F_WDT=y
# CONFIG_MACHZ_WDT is not set
CONFIG_SBC_EPX_C3_WATCHDOG=y
CONFIG_NI903X_WDT=y
CONFIG_NIC7018_WDT=y
CONFIG_MEN_A21_WDT=y

#
# ISA-based Watchdog Cards
#
# CONFIG_PCWATCHDOG is not set
CONFIG_MIXCOMWD=y
CONFIG_WDT=y

#
# PCI-based Watchdog Cards
#
# CONFIG_PCIPCWATCHDOG is not set
# CONFIG_WDTPCI is not set

#
# USB-based Watchdog Cards
#
# CONFIG_USBPCWATCHDOG is not set
CONFIG_SSB_POSSIBLE=y
CONFIG_SSB=y
CONFIG_SSB_SPROM=y
CONFIG_SSB_PCIHOST_POSSIBLE=y
CONFIG_SSB_PCIHOST=y
CONFIG_SSB_PCMCIAHOST_POSSIBLE=y
CONFIG_SSB_PCMCIAHOST=y
CONFIG_SSB_SDIOHOST_POSSIBLE=y
# CONFIG_SSB_SDIOHOST is not set
CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=y
# CONFIG_SSB_DRIVER_PCICORE is not set
# CONFIG_SSB_DRIVER_GPIO is not set
CONFIG_BCMA_POSSIBLE=y
CONFIG_BCMA=y
CONFIG_BCMA_HOST_PCI_POSSIBLE=y
CONFIG_BCMA_HOST_PCI=y
CONFIG_BCMA_HOST_SOC=y
CONFIG_BCMA_DRIVER_PCI=y
# CONFIG_BCMA_SFLASH is not set
# CONFIG_BCMA_DRIVER_GMAC_CMN is not set
CONFIG_BCMA_DRIVER_GPIO=y
CONFIG_BCMA_DEBUG=y

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
# CONFIG_MFD_CS5535 is not set
CONFIG_MFD_AS3711=y
# CONFIG_MFD_SMPRO is not set
# CONFIG_PMIC_ADP5520 is not set
# CONFIG_MFD_AAT2870_CORE is not set
CONFIG_MFD_BCM590XX=y
# CONFIG_MFD_BD9571MWV is not set
# CONFIG_MFD_AXP20X_I2C is not set
# CONFIG_MFD_MADERA is not set
CONFIG_PMIC_DA903X=y
CONFIG_PMIC_DA9052=y
CONFIG_MFD_DA9052_I2C=y
# CONFIG_MFD_DA9055 is not set
CONFIG_MFD_DA9062=y
CONFIG_MFD_DA9063=y
CONFIG_MFD_DA9150=y
CONFIG_MFD_DLN2=y
# CONFIG_MFD_MC13XXX_I2C is not set
# CONFIG_MFD_MP2629 is not set
# CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
# CONFIG_LPC_ICH is not set
# CONFIG_LPC_SCH is not set
CONFIG_INTEL_SOC_PMIC=y
CONFIG_INTEL_SOC_PMIC_BXTWC=y
# CONFIG_INTEL_SOC_PMIC_CHTWC is not set
CONFIG_INTEL_SOC_PMIC_CHTDC_TI=y
CONFIG_INTEL_SOC_PMIC_MRFLD=y
# CONFIG_MFD_INTEL_LPSS_ACPI is not set
# CONFIG_MFD_INTEL_LPSS_PCI is not set
CONFIG_MFD_INTEL_PMC_BXT=y
# CONFIG_MFD_IQS62X is not set
# CONFIG_MFD_JANZ_CMODIO is not set
CONFIG_MFD_KEMPLD=y
CONFIG_MFD_88PM800=y
CONFIG_MFD_88PM805=y
# CONFIG_MFD_88PM860X is not set
CONFIG_MFD_MAX14577=y
# CONFIG_MFD_MAX77693 is not set
CONFIG_MFD_MAX77843=y
CONFIG_MFD_MAX8907=y
# CONFIG_MFD_MAX8925 is not set
CONFIG_MFD_MAX8997=y
CONFIG_MFD_MAX8998=y
# CONFIG_MFD_MT6360 is not set
CONFIG_MFD_MT6370=y
CONFIG_MFD_MT6397=y
CONFIG_MFD_MENF21BMC=y
CONFIG_MFD_VIPERBOARD=y
CONFIG_MFD_RETU=y
CONFIG_MFD_PCF50633=y
# CONFIG_PCF50633_ADC is not set
# CONFIG_PCF50633_GPIO is not set
CONFIG_MFD_SY7636A=y
# CONFIG_MFD_RDC321X is not set
CONFIG_MFD_RT4831=y
CONFIG_MFD_RT5033=y
CONFIG_MFD_RT5120=y
CONFIG_MFD_RC5T583=y
CONFIG_MFD_SI476X_CORE=y
CONFIG_MFD_SIMPLE_MFD_I2C=y
CONFIG_MFD_SM501=y
CONFIG_MFD_SM501_GPIO=y
CONFIG_MFD_SKY81452=y
CONFIG_MFD_SYSCON=y
CONFIG_MFD_TI_AM335X_TSCADC=y
CONFIG_MFD_LP3943=y
CONFIG_MFD_LP8788=y
CONFIG_MFD_TI_LMU=y
# CONFIG_MFD_PALMAS is not set
# CONFIG_TPS6105X is not set
# CONFIG_TPS65010 is not set
CONFIG_TPS6507X=y
CONFIG_MFD_TPS65086=y
# CONFIG_MFD_TPS65090 is not set
# CONFIG_MFD_TI_LP873X is not set
CONFIG_MFD_TPS6586X=y
# CONFIG_MFD_TPS65910 is not set
CONFIG_MFD_TPS65912=y
CONFIG_MFD_TPS65912_I2C=y
# CONFIG_TWL4030_CORE is not set
CONFIG_TWL6040_CORE=y
CONFIG_MFD_WL1273_CORE=y
CONFIG_MFD_LM3533=y
# CONFIG_MFD_TIMBERDALE is not set
CONFIG_MFD_TQMX86=y
# CONFIG_MFD_VX855 is not set
# CONFIG_MFD_ARIZONA_I2C is not set
CONFIG_MFD_WM8400=y
# CONFIG_MFD_WM831X_I2C is not set
CONFIG_MFD_WM8350=y
CONFIG_MFD_WM8350_I2C=y
# CONFIG_MFD_WM8994 is not set
CONFIG_MFD_WCD934X=y
CONFIG_MFD_ATC260X=y
CONFIG_MFD_ATC260X_I2C=y
# end of Multifunction device drivers

CONFIG_REGULATOR=y
CONFIG_REGULATOR_DEBUG=y
CONFIG_REGULATOR_FIXED_VOLTAGE=y
CONFIG_REGULATOR_VIRTUAL_CONSUMER=y
CONFIG_REGULATOR_USERSPACE_CONSUMER=y
# CONFIG_REGULATOR_88PG86X is not set
CONFIG_REGULATOR_88PM800=y
CONFIG_REGULATOR_ACT8865=y
CONFIG_REGULATOR_AD5398=y
# CONFIG_REGULATOR_AS3711 is not set
CONFIG_REGULATOR_ATC260X=y
# CONFIG_REGULATOR_BCM590XX is not set
# CONFIG_REGULATOR_DA9052 is not set
# CONFIG_REGULATOR_DA9062 is not set
# CONFIG_REGULATOR_DA9210 is not set
# CONFIG_REGULATOR_DA9211 is not set
CONFIG_REGULATOR_FAN53555=y
# CONFIG_REGULATOR_GPIO is not set
CONFIG_REGULATOR_ISL9305=y
CONFIG_REGULATOR_ISL6271A=y
CONFIG_REGULATOR_LM363X=y
CONFIG_REGULATOR_LP3971=y
# CONFIG_REGULATOR_LP3972 is not set
# CONFIG_REGULATOR_LP872X is not set
CONFIG_REGULATOR_LP8755=y
CONFIG_REGULATOR_LP8788=y
CONFIG_REGULATOR_LTC3589=y
# CONFIG_REGULATOR_LTC3676 is not set
CONFIG_REGULATOR_MAX14577=y
CONFIG_REGULATOR_MAX1586=y
CONFIG_REGULATOR_MAX8649=y
# CONFIG_REGULATOR_MAX8660 is not set
CONFIG_REGULATOR_MAX8893=y
CONFIG_REGULATOR_MAX8907=y
CONFIG_REGULATOR_MAX8952=y
CONFIG_REGULATOR_MAX8997=y
CONFIG_REGULATOR_MAX8998=y
CONFIG_REGULATOR_MAX20086=y
CONFIG_REGULATOR_MAX20411=y
# CONFIG_REGULATOR_MAX77693 is not set
CONFIG_REGULATOR_MAX77826=y
CONFIG_REGULATOR_MP8859=y
CONFIG_REGULATOR_MT6311=y
CONFIG_REGULATOR_MT6315=y
CONFIG_REGULATOR_MT6323=y
CONFIG_REGULATOR_MT6331=y
CONFIG_REGULATOR_MT6332=y
# CONFIG_REGULATOR_MT6357 is not set
CONFIG_REGULATOR_MT6358=y
CONFIG_REGULATOR_MT6359=y
CONFIG_REGULATOR_MT6370=y
# CONFIG_REGULATOR_MT6397 is not set
# CONFIG_REGULATOR_PCA9450 is not set
CONFIG_REGULATOR_PCF50633=y
CONFIG_REGULATOR_PV88060=y
CONFIG_REGULATOR_PV88080=y
CONFIG_REGULATOR_PV88090=y
# CONFIG_REGULATOR_PWM is not set
CONFIG_REGULATOR_QCOM_SPMI=y
CONFIG_REGULATOR_QCOM_USB_VBUS=y
CONFIG_REGULATOR_RC5T583=y
# CONFIG_REGULATOR_RT4801 is not set
# CONFIG_REGULATOR_RT4803 is not set
CONFIG_REGULATOR_RT4831=y
# CONFIG_REGULATOR_RT5033 is not set
# CONFIG_REGULATOR_RT5120 is not set
CONFIG_REGULATOR_RT5190A=y
# CONFIG_REGULATOR_RT5739 is not set
# CONFIG_REGULATOR_RT5759 is not set
CONFIG_REGULATOR_RT6160=y
# CONFIG_REGULATOR_RT6190 is not set
CONFIG_REGULATOR_RT6245=y
# CONFIG_REGULATOR_RTQ2134 is not set
CONFIG_REGULATOR_RTMV20=y
CONFIG_REGULATOR_RTQ6752=y
CONFIG_REGULATOR_SKY81452=y
# CONFIG_REGULATOR_SLG51000 is not set
CONFIG_REGULATOR_SY7636A=y
CONFIG_REGULATOR_TPS51632=y
CONFIG_REGULATOR_TPS62360=y
# CONFIG_REGULATOR_TPS65023 is not set
CONFIG_REGULATOR_TPS6507X=y
# CONFIG_REGULATOR_TPS65086 is not set
CONFIG_REGULATOR_TPS65132=y
CONFIG_REGULATOR_TPS6586X=y
CONFIG_REGULATOR_TPS65912=y
CONFIG_REGULATOR_WM8350=y
# CONFIG_REGULATOR_WM8400 is not set
CONFIG_REGULATOR_QCOM_LABIBB=y
# CONFIG_RC_CORE is not set
CONFIG_CEC_CORE=y
CONFIG_CEC_NOTIFIER=y
CONFIG_CEC_PIN=y

#
# CEC support
#
# CONFIG_CEC_PIN_ERROR_INJ is not set
CONFIG_MEDIA_CEC_SUPPORT=y
# CONFIG_CEC_CH7322 is not set
CONFIG_CEC_GPIO=y
# CONFIG_CEC_SECO is not set
CONFIG_USB_PULSE8_CEC=y
CONFIG_USB_RAINSHADOW_CEC=y
# end of CEC support

# CONFIG_MEDIA_SUPPORT is not set

#
# Graphics support
#
CONFIG_APERTURE_HELPERS=y
CONFIG_VIDEO_CMDLINE=y
CONFIG_VIDEO_NOMODESET=y
# CONFIG_AGP is not set
# CONFIG_VGA_SWITCHEROO is not set
CONFIG_DRM=y
CONFIG_DRM_DEBUG_MM=y
CONFIG_DRM_KMS_HELPER=y
# CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
CONFIG_DRM_DISPLAY_HELPER=y
CONFIG_DRM_DISPLAY_DP_HELPER=y
CONFIG_DRM_DP_AUX_CHARDEV=y
CONFIG_DRM_DP_CEC=y
CONFIG_DRM_GEM_SHMEM_HELPER=y
CONFIG_DRM_SCHED=y

#
# I2C encoder or helper chips
#
CONFIG_DRM_I2C_CH7006=y
CONFIG_DRM_I2C_SIL164=y
# CONFIG_DRM_I2C_NXP_TDA998X is not set
CONFIG_DRM_I2C_NXP_TDA9950=y
# end of I2C encoder or helper chips

#
# ARM devices
#
# end of ARM devices

# CONFIG_DRM_RADEON is not set
# CONFIG_DRM_AMDGPU is not set
# CONFIG_DRM_NOUVEAU is not set
# CONFIG_DRM_I915 is not set
CONFIG_DRM_VGEM=y
CONFIG_DRM_VKMS=y
# CONFIG_DRM_VMWGFX is not set
# CONFIG_DRM_GMA500 is not set
CONFIG_DRM_UDL=y
# CONFIG_DRM_AST is not set
# CONFIG_DRM_MGAG200 is not set
# CONFIG_DRM_QXL is not set
CONFIG_DRM_VIRTIO_GPU=y
CONFIG_DRM_VIRTIO_GPU_KMS=y
CONFIG_DRM_PANEL=y

#
# Display Panels
#
# end of Display Panels

CONFIG_DRM_BRIDGE=y
CONFIG_DRM_PANEL_BRIDGE=y

#
# Display Interface Bridges
#
CONFIG_DRM_ANALOGIX_ANX78XX=y
CONFIG_DRM_ANALOGIX_DP=y
# end of Display Interface Bridges

CONFIG_DRM_ETNAVIV=y
CONFIG_DRM_ETNAVIV_THERMAL=y
# CONFIG_DRM_BOCHS is not set
# CONFIG_DRM_CIRRUS_QEMU is not set
# CONFIG_DRM_GM12U320 is not set
CONFIG_DRM_SIMPLEDRM=y
# CONFIG_DRM_VBOXVIDEO is not set
CONFIG_DRM_GUD=y
# CONFIG_DRM_SSD130X is not set
# CONFIG_DRM_HYPERV is not set
CONFIG_DRM_LEGACY=y
CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=y

#
# Frame buffer Devices
#
# CONFIG_FB is not set
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
CONFIG_LCD_CLASS_DEVICE=y
CONFIG_LCD_PLATFORM=y
CONFIG_BACKLIGHT_CLASS_DEVICE=y
CONFIG_BACKLIGHT_KTD253=y
# CONFIG_BACKLIGHT_KTZ8866 is not set
CONFIG_BACKLIGHT_LM3533=y
CONFIG_BACKLIGHT_PWM=y
CONFIG_BACKLIGHT_DA903X=y
CONFIG_BACKLIGHT_DA9052=y
# CONFIG_BACKLIGHT_MT6370 is not set
# CONFIG_BACKLIGHT_APPLE is not set
# CONFIG_BACKLIGHT_QCOM_WLED is not set
CONFIG_BACKLIGHT_RT4831=y
CONFIG_BACKLIGHT_SAHARA=y
CONFIG_BACKLIGHT_ADP8860=y
CONFIG_BACKLIGHT_ADP8870=y
# CONFIG_BACKLIGHT_PCF50633 is not set
CONFIG_BACKLIGHT_LM3630A=y
CONFIG_BACKLIGHT_LM3639=y
CONFIG_BACKLIGHT_LP855X=y
CONFIG_BACKLIGHT_LP8788=y
CONFIG_BACKLIGHT_SKY81452=y
CONFIG_BACKLIGHT_AS3711=y
CONFIG_BACKLIGHT_GPIO=y
# CONFIG_BACKLIGHT_LV5207LP is not set
# CONFIG_BACKLIGHT_BD6107 is not set
# CONFIG_BACKLIGHT_ARCXCNN is not set
# end of Backlight & LCD device support

CONFIG_HDMI=y

#
# Console display driver support
#
CONFIG_VGA_CONSOLE=y
CONFIG_MDA_CONSOLE=y
CONFIG_DUMMY_CONSOLE=y
CONFIG_DUMMY_CONSOLE_COLUMNS=80
CONFIG_DUMMY_CONSOLE_ROWS=25
# end of Console display driver support
# end of Graphics support

CONFIG_DRM_ACCEL=y
CONFIG_SOUND=y
# CONFIG_SND is not set
# CONFIG_HID_SUPPORT is not set
CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_COMMON=y
CONFIG_USB_LED_TRIG=y
CONFIG_USB_ULPI_BUS=y
CONFIG_USB_CONN_GPIO=y
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB=y
CONFIG_USB_PCI=y
# CONFIG_USB_ANNOUNCE_NEW_DEVICES is not set

#
# Miscellaneous USB options
#
CONFIG_USB_DEFAULT_PERSIST=y
CONFIG_USB_FEW_INIT_RETRIES=y
CONFIG_USB_DYNAMIC_MINORS=y
# CONFIG_USB_OTG_PRODUCTLIST is not set
CONFIG_USB_LEDS_TRIGGER_USBPORT=y
CONFIG_USB_AUTOSUSPEND_DELAY=2
# CONFIG_USB_MON is not set

#
# USB Host Controller Drivers
#
CONFIG_USB_C67X00_HCD=y
# CONFIG_USB_XHCI_HCD is not set
CONFIG_USB_EHCI_HCD=y
CONFIG_USB_EHCI_ROOT_HUB_TT=y
CONFIG_USB_EHCI_TT_NEWSCHED=y
CONFIG_USB_EHCI_PCI=y
CONFIG_USB_EHCI_FSL=y
CONFIG_USB_EHCI_HCD_PLATFORM=y
CONFIG_USB_OXU210HP_HCD=y
# CONFIG_USB_ISP116X_HCD is not set
CONFIG_USB_OHCI_HCD=y
CONFIG_USB_OHCI_HCD_PCI=y
CONFIG_USB_OHCI_HCD_SSB=y
CONFIG_USB_OHCI_HCD_PLATFORM=y
# CONFIG_USB_UHCI_HCD is not set
CONFIG_USB_SL811_HCD=y
CONFIG_USB_SL811_HCD_ISO=y
CONFIG_USB_SL811_CS=y
CONFIG_USB_R8A66597_HCD=y
CONFIG_USB_HCD_BCMA=y
CONFIG_USB_HCD_SSB=y
# CONFIG_USB_HCD_TEST_MODE is not set

#
# USB Device Class drivers
#
CONFIG_USB_ACM=y
# CONFIG_USB_PRINTER is not set
CONFIG_USB_WDM=y
CONFIG_USB_TMC=y

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
#

#
# also be needed; see USB_STORAGE Help for more info
#
# CONFIG_USB_STORAGE is not set

#
# USB Imaging devices
#
# CONFIG_USB_MDC800 is not set
# CONFIG_USB_MICROTEK is not set
# CONFIG_USBIP_CORE is not set

#
# USB dual-mode controller drivers
#
CONFIG_USB_CDNS_SUPPORT=y
CONFIG_USB_CDNS3=y
CONFIG_USB_CDNS3_GADGET=y
# CONFIG_USB_CDNS3_HOST is not set
CONFIG_USB_CDNS3_PCI_WRAP=y
# CONFIG_USB_CDNSP_PCI is not set
CONFIG_USB_MUSB_HDRC=y
# CONFIG_USB_MUSB_HOST is not set
CONFIG_USB_MUSB_GADGET=y
# CONFIG_USB_MUSB_DUAL_ROLE is not set

#
# Platform Glue Layer
#

#
# MUSB DMA mode
#
CONFIG_MUSB_PIO_ONLY=y
# CONFIG_USB_DWC3 is not set
# CONFIG_USB_DWC2 is not set
CONFIG_USB_CHIPIDEA=y
# CONFIG_USB_CHIPIDEA_UDC is not set
CONFIG_USB_CHIPIDEA_HOST=y
CONFIG_USB_CHIPIDEA_MSM=y
CONFIG_USB_CHIPIDEA_GENERIC=y
# CONFIG_USB_ISP1760 is not set

#
# USB port drivers
#
# CONFIG_USB_SERIAL is not set

#
# USB Miscellaneous drivers
#
CONFIG_USB_USS720=y
# CONFIG_USB_EMI62 is not set
CONFIG_USB_EMI26=y
CONFIG_USB_ADUTUX=y
CONFIG_USB_SEVSEG=y
# CONFIG_USB_LEGOTOWER is not set
CONFIG_USB_LCD=y
CONFIG_USB_CYPRESS_CY7C63=y
CONFIG_USB_CYTHERM=y
CONFIG_USB_IDMOUSE=y
# CONFIG_USB_APPLEDISPLAY is not set
CONFIG_APPLE_MFI_FASTCHARGE=y
# CONFIG_USB_SISUSBVGA is not set
CONFIG_USB_LD=y
CONFIG_USB_TRANCEVIBRATOR=y
CONFIG_USB_IOWARRIOR=y
# CONFIG_USB_TEST is not set
# CONFIG_USB_EHSET_TEST_FIXTURE is not set
CONFIG_USB_ISIGHTFW=y
CONFIG_USB_YUREX=y
CONFIG_USB_EZUSB_FX2=y
# CONFIG_USB_HUB_USB251XB is not set
# CONFIG_USB_HSIC_USB3503 is not set
CONFIG_USB_HSIC_USB4604=y
# CONFIG_USB_LINK_LAYER_TEST is not set
CONFIG_USB_CHAOSKEY=y

#
# USB Physical Layer drivers
#
CONFIG_USB_PHY=y
# CONFIG_NOP_USB_XCEIV is not set
CONFIG_TAHVO_USB=y
CONFIG_TAHVO_USB_HOST_BY_DEFAULT=y
# CONFIG_USB_ISP1301 is not set
# end of USB Physical Layer drivers

CONFIG_USB_GADGET=y
# CONFIG_USB_GADGET_DEBUG is not set
CONFIG_USB_GADGET_DEBUG_FILES=y
CONFIG_USB_GADGET_DEBUG_FS=y
CONFIG_USB_GADGET_VBUS_DRAW=2
CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS=2
CONFIG_U_SERIAL_CONSOLE=y

#
# USB Peripheral Controller
#
# CONFIG_USB_FUSB300 is not set
CONFIG_USB_GR_UDC=y
CONFIG_USB_R8A66597=y
CONFIG_USB_PXA27X=y
# CONFIG_USB_MV_UDC is not set
CONFIG_USB_MV_U3D=y
# CONFIG_USB_M66592 is not set
CONFIG_USB_BDC_UDC=y
# CONFIG_USB_AMD5536UDC is not set
# CONFIG_USB_NET2272 is not set
# CONFIG_USB_NET2280 is not set
# CONFIG_USB_GOKU is not set
# CONFIG_USB_EG20T is not set
CONFIG_USB_DUMMY_HCD=y
# end of USB Peripheral Controller

CONFIG_USB_LIBCOMPOSITE=y
CONFIG_USB_F_ACM=y
CONFIG_USB_F_SS_LB=y
CONFIG_USB_U_SERIAL=y
CONFIG_USB_F_SERIAL=y
CONFIG_USB_F_OBEX=y
CONFIG_USB_F_MASS_STORAGE=y
CONFIG_USB_F_HID=y
CONFIG_USB_F_PRINTER=y
CONFIG_USB_CONFIGFS=y
# CONFIG_USB_CONFIGFS_SERIAL is not set
CONFIG_USB_CONFIGFS_ACM=y
CONFIG_USB_CONFIGFS_OBEX=y
# CONFIG_USB_CONFIGFS_NCM is not set
# CONFIG_USB_CONFIGFS_ECM is not set
# CONFIG_USB_CONFIGFS_ECM_SUBSET is not set
# CONFIG_USB_CONFIGFS_RNDIS is not set
# CONFIG_USB_CONFIGFS_EEM is not set
CONFIG_USB_CONFIGFS_MASS_STORAGE=y
CONFIG_USB_CONFIGFS_F_LB_SS=y
# CONFIG_USB_CONFIGFS_F_FS is not set
CONFIG_USB_CONFIGFS_F_HID=y
CONFIG_USB_CONFIGFS_F_PRINTER=y

#
# USB Gadget precomposed configurations
#
CONFIG_USB_ZERO=y
# CONFIG_USB_ETH is not set
# CONFIG_USB_G_NCM is not set
# CONFIG_USB_GADGETFS is not set
# CONFIG_USB_FUNCTIONFS is not set
CONFIG_USB_MASS_STORAGE=y
CONFIG_USB_G_SERIAL=y
# CONFIG_USB_G_PRINTER is not set
# CONFIG_USB_CDC_COMPOSITE is not set
CONFIG_USB_G_ACM_MS=y
# CONFIG_USB_G_MULTI is not set
# CONFIG_USB_G_HID is not set
CONFIG_USB_G_DBGP=y
# CONFIG_USB_G_DBGP_PRINTK is not set
CONFIG_USB_G_DBGP_SERIAL=y
CONFIG_USB_RAW_GADGET=y
# end of USB Gadget precomposed configurations

CONFIG_TYPEC=y
# CONFIG_TYPEC_TCPM is not set
CONFIG_TYPEC_UCSI=y
CONFIG_UCSI_CCG=y
CONFIG_UCSI_ACPI=y
CONFIG_UCSI_STM32G0=y
CONFIG_TYPEC_TPS6598X=y
CONFIG_TYPEC_ANX7411=y
CONFIG_TYPEC_RT1719=y
CONFIG_TYPEC_HD3SS3220=y
# CONFIG_TYPEC_STUSB160X is not set
# CONFIG_TYPEC_WUSB3801 is not set

#
# USB Type-C Multiplexer/DeMultiplexer Switch support
#
CONFIG_TYPEC_MUX_FSA4480=y
CONFIG_TYPEC_MUX_GPIO_SBU=y
# CONFIG_TYPEC_MUX_PI3USB30532 is not set
CONFIG_TYPEC_MUX_INTEL_PMC=y
# end of USB Type-C Multiplexer/DeMultiplexer Switch support

#
# USB Type-C Alternate Mode drivers
#
CONFIG_TYPEC_DP_ALTMODE=y
# CONFIG_TYPEC_NVIDIA_ALTMODE is not set
# end of USB Type-C Alternate Mode drivers

CONFIG_USB_ROLE_SWITCH=y
CONFIG_USB_ROLES_INTEL_XHCI=y
CONFIG_MMC=y
CONFIG_MMC_BLOCK=y
CONFIG_MMC_BLOCK_MINORS=8
CONFIG_SDIO_UART=y
# CONFIG_MMC_TEST is not set
CONFIG_MMC_CRYPTO=y

#
# MMC/SD/SDIO Host Controller Drivers
#
# CONFIG_MMC_DEBUG is not set
# CONFIG_MMC_SDHCI is not set
# CONFIG_MMC_WBSD is not set
# CONFIG_MMC_TIFM_SD is not set
# CONFIG_MMC_SDRICOH_CS is not set
# CONFIG_MMC_CB710 is not set
# CONFIG_MMC_VIA_SDMMC is not set
# CONFIG_MMC_VUB300 is not set
CONFIG_MMC_USHC=y
CONFIG_MMC_USDHI6ROL0=y
CONFIG_MMC_REALTEK_USB=y
CONFIG_MMC_CQHCI=y
# CONFIG_MMC_HSQ is not set
# CONFIG_MMC_TOSHIBA_PCI is not set
# CONFIG_MMC_MTK is not set
CONFIG_SCSI_UFSHCD=y
CONFIG_SCSI_UFS_BSG=y
CONFIG_SCSI_UFS_CRYPTO=y
CONFIG_SCSI_UFS_HPB=y
CONFIG_SCSI_UFS_FAULT_INJECTION=y
# CONFIG_SCSI_UFSHCD_PCI is not set
CONFIG_SCSI_UFSHCD_PLATFORM=y
CONFIG_SCSI_UFS_CDNS_PLATFORM=y
CONFIG_MEMSTICK=y
CONFIG_MEMSTICK_DEBUG=y

#
# MemoryStick drivers
#
CONFIG_MEMSTICK_UNSAFE_RESUME=y
# CONFIG_MSPRO_BLOCK is not set
CONFIG_MS_BLOCK=y

#
# MemoryStick Host Controller Drivers
#
# CONFIG_MEMSTICK_TIFM_MS is not set
# CONFIG_MEMSTICK_JMICRON_38X is not set
# CONFIG_MEMSTICK_R592 is not set
CONFIG_MEMSTICK_REALTEK_USB=y
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
CONFIG_LEDS_CLASS_FLASH=y
CONFIG_LEDS_CLASS_MULTICOLOR=y
CONFIG_LEDS_BRIGHTNESS_HW_CHANGED=y

#
# LED drivers
#
CONFIG_LEDS_APU=y
CONFIG_LEDS_LM3530=y
CONFIG_LEDS_LM3532=y
CONFIG_LEDS_LM3533=y
CONFIG_LEDS_LM3642=y
CONFIG_LEDS_MT6323=y
# CONFIG_LEDS_PCA9532 is not set
CONFIG_LEDS_GPIO=y
# CONFIG_LEDS_LP3944 is not set
CONFIG_LEDS_LP3952=y
# CONFIG_LEDS_LP50XX is not set
CONFIG_LEDS_LP8788=y
CONFIG_LEDS_PCA955X=y
CONFIG_LEDS_PCA955X_GPIO=y
# CONFIG_LEDS_PCA963X is not set
CONFIG_LEDS_WM8350=y
CONFIG_LEDS_DA903X=y
CONFIG_LEDS_DA9052=y
CONFIG_LEDS_PWM=y
CONFIG_LEDS_REGULATOR=y
# CONFIG_LEDS_BD2606MVV is not set
CONFIG_LEDS_BD2802=y
# CONFIG_LEDS_INTEL_SS4200 is not set
CONFIG_LEDS_LT3593=y
# CONFIG_LEDS_TCA6507 is not set
# CONFIG_LEDS_TLC591XX is not set
# CONFIG_LEDS_MAX8997 is not set
CONFIG_LEDS_LM355x=y
# CONFIG_LEDS_OT200 is not set
CONFIG_LEDS_MENF21BMC=y
# CONFIG_LEDS_IS31FL319X is not set

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
# CONFIG_LEDS_BLINKM is not set
CONFIG_LEDS_MLXCPLD=y
CONFIG_LEDS_MLXREG=y
# CONFIG_LEDS_USER is not set
# CONFIG_LEDS_NIC78BX is not set
# CONFIG_LEDS_TI_LMU_COMMON is not set

#
# Flash and Torch LED drivers
#
# CONFIG_LEDS_AS3645A is not set
CONFIG_LEDS_LM3601X=y
# CONFIG_LEDS_MT6370_FLASH is not set
CONFIG_LEDS_RT8515=y
# CONFIG_LEDS_SGM3140 is not set

#
# RGB LED drivers
#
CONFIG_LEDS_PWM_MULTICOLOR=y
# CONFIG_LEDS_MT6370_RGB is not set

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
# CONFIG_LEDS_TRIGGER_TIMER is not set
CONFIG_LEDS_TRIGGER_ONESHOT=y
# CONFIG_LEDS_TRIGGER_DISK is not set
CONFIG_LEDS_TRIGGER_HEARTBEAT=y
CONFIG_LEDS_TRIGGER_BACKLIGHT=y
# CONFIG_LEDS_TRIGGER_CPU is not set
# CONFIG_LEDS_TRIGGER_ACTIVITY is not set
# CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set

#
# iptables trigger is under Netfilter config (LED target)
#
# CONFIG_LEDS_TRIGGER_TRANSIENT is not set
CONFIG_LEDS_TRIGGER_CAMERA=y
CONFIG_LEDS_TRIGGER_PANIC=y
# CONFIG_LEDS_TRIGGER_NETDEV is not set
CONFIG_LEDS_TRIGGER_PATTERN=y
# CONFIG_LEDS_TRIGGER_AUDIO is not set
CONFIG_LEDS_TRIGGER_TTY=y

#
# Simple LED drivers
#
CONFIG_ACCESSIBILITY=y
CONFIG_A11Y_BRAILLE_CONSOLE=y

#
# Speakup console speech
#
CONFIG_SPEAKUP=y
CONFIG_SPEAKUP_SERIALIO=y
# CONFIG_SPEAKUP_SYNTH_ACNTSA is not set
# CONFIG_SPEAKUP_SYNTH_ACNTPC is not set
# CONFIG_SPEAKUP_SYNTH_APOLLO is not set
CONFIG_SPEAKUP_SYNTH_AUDPTR=y
CONFIG_SPEAKUP_SYNTH_BNS=y
CONFIG_SPEAKUP_SYNTH_DECTLK=y
CONFIG_SPEAKUP_SYNTH_DECEXT=y
# CONFIG_SPEAKUP_SYNTH_DECPC is not set
CONFIG_SPEAKUP_SYNTH_DTLK=y
CONFIG_SPEAKUP_SYNTH_KEYPC=y
# CONFIG_SPEAKUP_SYNTH_LTLK is not set
CONFIG_SPEAKUP_SYNTH_SOFT=y
CONFIG_SPEAKUP_SYNTH_SPKOUT=y
CONFIG_SPEAKUP_SYNTH_TXPRT=y
CONFIG_SPEAKUP_SYNTH_DUMMY=y
# end of Speakup console speech

# CONFIG_INFINIBAND is not set
CONFIG_EDAC_ATOMIC_SCRUB=y
CONFIG_EDAC_SUPPORT=y
CONFIG_EDAC=y
CONFIG_EDAC_LEGACY_SYSFS=y
CONFIG_EDAC_DEBUG=y
# CONFIG_EDAC_AMD76X is not set
# CONFIG_EDAC_E7XXX is not set
# CONFIG_EDAC_E752X is not set
# CONFIG_EDAC_I82875P is not set
# CONFIG_EDAC_I82975X is not set
# CONFIG_EDAC_I3000 is not set
# CONFIG_EDAC_I3200 is not set
# CONFIG_EDAC_IE31200 is not set
# CONFIG_EDAC_X38 is not set
# CONFIG_EDAC_I5400 is not set
# CONFIG_EDAC_I7CORE is not set
# CONFIG_EDAC_I82860 is not set
# CONFIG_EDAC_R82600 is not set
# CONFIG_EDAC_I5100 is not set
# CONFIG_EDAC_I7300 is not set
CONFIG_RTC_LIB=y
CONFIG_RTC_MC146818_LIB=y
CONFIG_RTC_CLASS=y
CONFIG_RTC_HCTOSYS=y
CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
# CONFIG_RTC_SYSTOHC is not set
# CONFIG_RTC_DEBUG is not set
CONFIG_RTC_NVMEM=y

#
# RTC interfaces
#
CONFIG_RTC_INTF_SYSFS=y
CONFIG_RTC_INTF_PROC=y
# CONFIG_RTC_INTF_DEV is not set
# CONFIG_RTC_DRV_TEST is not set

#
# I2C RTC drivers
#
# CONFIG_RTC_DRV_88PM80X is not set
CONFIG_RTC_DRV_ABB5ZES3=y
# CONFIG_RTC_DRV_ABEOZ9 is not set
CONFIG_RTC_DRV_ABX80X=y
CONFIG_RTC_DRV_DS1307=y
CONFIG_RTC_DRV_DS1307_CENTURY=y
# CONFIG_RTC_DRV_DS1374 is not set
CONFIG_RTC_DRV_DS1672=y
# CONFIG_RTC_DRV_LP8788 is not set
# CONFIG_RTC_DRV_MAX6900 is not set
CONFIG_RTC_DRV_MAX8907=y
# CONFIG_RTC_DRV_MAX8998 is not set
CONFIG_RTC_DRV_MAX8997=y
# CONFIG_RTC_DRV_RS5C372 is not set
CONFIG_RTC_DRV_ISL1208=y
CONFIG_RTC_DRV_ISL12022=y
CONFIG_RTC_DRV_X1205=y
CONFIG_RTC_DRV_PCF8523=y
# CONFIG_RTC_DRV_PCF85063 is not set
CONFIG_RTC_DRV_PCF85363=y
# CONFIG_RTC_DRV_PCF8563 is not set
CONFIG_RTC_DRV_PCF8583=y
CONFIG_RTC_DRV_M41T80=y
CONFIG_RTC_DRV_M41T80_WDT=y
# CONFIG_RTC_DRV_BQ32K is not set
CONFIG_RTC_DRV_TPS6586X=y
CONFIG_RTC_DRV_RC5T583=y
CONFIG_RTC_DRV_S35390A=y
CONFIG_RTC_DRV_FM3130=y
CONFIG_RTC_DRV_RX8010=y
CONFIG_RTC_DRV_RX8581=y
CONFIG_RTC_DRV_RX8025=y
CONFIG_RTC_DRV_EM3027=y
# CONFIG_RTC_DRV_RV3028 is not set
# CONFIG_RTC_DRV_RV3032 is not set
# CONFIG_RTC_DRV_RV8803 is not set
# CONFIG_RTC_DRV_SD3078 is not set

#
# SPI RTC drivers
#
CONFIG_RTC_I2C_AND_SPI=y

#
# SPI and I2C RTC drivers
#
CONFIG_RTC_DRV_DS3232=y
CONFIG_RTC_DRV_PCF2127=y
# CONFIG_RTC_DRV_RV3029C2 is not set
CONFIG_RTC_DRV_RX6110=y

#
# Platform RTC drivers
#
CONFIG_RTC_DRV_CMOS=y
# CONFIG_RTC_DRV_DS1286 is not set
CONFIG_RTC_DRV_DS1511=y
# CONFIG_RTC_DRV_DS1553 is not set
CONFIG_RTC_DRV_DS1685_FAMILY=y
# CONFIG_RTC_DRV_DS1685 is not set
# CONFIG_RTC_DRV_DS1689 is not set
# CONFIG_RTC_DRV_DS17285 is not set
# CONFIG_RTC_DRV_DS17485 is not set
CONFIG_RTC_DRV_DS17885=y
CONFIG_RTC_DRV_DS1742=y
# CONFIG_RTC_DRV_DS2404 is not set
# CONFIG_RTC_DRV_DA9052 is not set
CONFIG_RTC_DRV_DA9063=y
# CONFIG_RTC_DRV_STK17TA8 is not set
# CONFIG_RTC_DRV_M48T86 is not set
# CONFIG_RTC_DRV_M48T35 is not set
CONFIG_RTC_DRV_M48T59=y
CONFIG_RTC_DRV_MSM6242=y
CONFIG_RTC_DRV_BQ4802=y
CONFIG_RTC_DRV_RP5C01=y
# CONFIG_RTC_DRV_WM8350 is not set
CONFIG_RTC_DRV_PCF50633=y

#
# on-CPU RTC drivers
#
CONFIG_RTC_DRV_FTRTC010=y
CONFIG_RTC_DRV_MT6397=y

#
# HID Sensor RTC drivers
#
CONFIG_RTC_DRV_GOLDFISH=y
# CONFIG_DMADEVICES is not set

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
# CONFIG_SW_SYNC is not set
CONFIG_UDMABUF=y
CONFIG_DMABUF_MOVE_NOTIFY=y
CONFIG_DMABUF_DEBUG=y
# CONFIG_DMABUF_SELFTESTS is not set
# CONFIG_DMABUF_HEAPS is not set
CONFIG_DMABUF_SYSFS_STATS=y
# end of DMABUF options

CONFIG_AUXDISPLAY=y
CONFIG_CHARLCD=y
CONFIG_LINEDISP=y
CONFIG_HD44780_COMMON=y
CONFIG_HD44780=y
# CONFIG_KS0108 is not set
CONFIG_IMG_ASCII_LCD=y
CONFIG_LCD2S=y
# CONFIG_PARPORT_PANEL is not set
# CONFIG_PANEL_CHANGE_MESSAGE is not set
# CONFIG_CHARLCD_BL_OFF is not set
# CONFIG_CHARLCD_BL_ON is not set
CONFIG_CHARLCD_BL_FLASH=y
# CONFIG_PANEL is not set
CONFIG_UIO=y
# CONFIG_UIO_CIF is not set
# CONFIG_UIO_PDRV_GENIRQ is not set
CONFIG_UIO_DMEM_GENIRQ=y
# CONFIG_UIO_AEC is not set
# CONFIG_UIO_SERCOS3 is not set
# CONFIG_UIO_PCI_GENERIC is not set
# CONFIG_UIO_NETX is not set
CONFIG_UIO_PRUSS=y
# CONFIG_UIO_MF624 is not set
CONFIG_UIO_HV_GENERIC=y
# CONFIG_VFIO is not set
CONFIG_VIRT_DRIVERS=y
CONFIG_VMGENID=y
# CONFIG_VBOXGUEST is not set
# CONFIG_NITRO_ENCLAVES is not set
CONFIG_VIRTIO_ANCHOR=y
CONFIG_VIRTIO=y
CONFIG_VIRTIO_MENU=y
# CONFIG_VIRTIO_PCI is not set
CONFIG_VIRTIO_BALLOON=y
CONFIG_VIRTIO_INPUT=y
CONFIG_VIRTIO_MMIO=y
# CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES is not set
CONFIG_VIRTIO_DMA_SHARED_BUFFER=y
# CONFIG_VDPA is not set
# CONFIG_VHOST_MENU is not set

#
# Microsoft Hyper-V guest support
#
CONFIG_HYPERV=y
CONFIG_HYPERV_TIMER=y
CONFIG_HYPERV_BALLOON=y
# end of Microsoft Hyper-V guest support

# CONFIG_GREYBUS is not set
# CONFIG_COMEDI is not set
CONFIG_STAGING=y
# CONFIG_RTL8192U is not set
# CONFIG_RTLLIB is not set
# CONFIG_RTS5208 is not set

#
# IIO staging drivers
#

#
# Accelerometers
#
# end of Accelerometers

#
# Analog to digital converters
#
# end of Analog to digital converters

#
# Analog digital bi-direction converters
#
CONFIG_ADT7316=y
CONFIG_ADT7316_I2C=y
# end of Analog digital bi-direction converters

#
# Direct Digital Synthesis
#
# end of Direct Digital Synthesis

#
# Network Analyzer, Impedance Converters
#
# CONFIG_AD5933 is not set
# end of Network Analyzer, Impedance Converters

#
# Resolver to digital converters
#
# end of Resolver to digital converters
# end of IIO staging drivers

CONFIG_STAGING_MEDIA=y
# CONFIG_LTE_GDM724X is not set
CONFIG_MOST_COMPONENTS=y
# CONFIG_MOST_NET is not set
# CONFIG_MOST_I2C is not set
# CONFIG_KS7010 is not set
CONFIG_FIELDBUS_DEV=y
# CONFIG_QLGE is not set
# CONFIG_VME_BUS is not set
CONFIG_GOLDFISH_PIPE=y
CONFIG_CHROME_PLATFORMS=y
# CONFIG_CHROMEOS_ACPI is not set
CONFIG_CHROMEOS_LAPTOP=y
CONFIG_CHROMEOS_PSTORE=y
# CONFIG_CHROMEOS_TBMC is not set
# CONFIG_CROS_EC is not set
CONFIG_CROS_KBD_LED_BACKLIGHT=y
# CONFIG_CHROMEOS_PRIVACY_SCREEN is not set
# CONFIG_MELLANOX_PLATFORM is not set
# CONFIG_SURFACE_PLATFORMS is not set
CONFIG_X86_PLATFORM_DEVICES=y
CONFIG_ACPI_WMI=y
CONFIG_WMI_BMOF=y
# CONFIG_HUAWEI_WMI is not set
# CONFIG_MXM_WMI is not set
# CONFIG_NVIDIA_WMI_EC_BACKLIGHT is not set
# CONFIG_XIAOMI_WMI is not set
CONFIG_YOGABOOK_WMI=y
CONFIG_ACERHDF=y
CONFIG_ACER_WIRELESS=y
# CONFIG_ACER_WMI is not set
# CONFIG_AMD_PMF is not set
# CONFIG_AMD_PMC is not set
CONFIG_ADV_SWBUTTON=y
# CONFIG_APPLE_GMUX is not set
CONFIG_ASUS_LAPTOP=y
CONFIG_ASUS_WIRELESS=y
CONFIG_X86_PLATFORM_DRIVERS_DELL=y
CONFIG_ALIENWARE_WMI=y
CONFIG_DCDBAS=y
# CONFIG_DELL_LAPTOP is not set
CONFIG_DELL_RBU=y
CONFIG_DELL_SMBIOS=y
CONFIG_DELL_SMBIOS_WMI=y
CONFIG_DELL_SMBIOS_SMM=y
CONFIG_DELL_SMO8800=y
# CONFIG_DELL_WMI is not set
# CONFIG_DELL_WMI_AIO is not set
CONFIG_DELL_WMI_DESCRIPTOR=y
# CONFIG_DELL_WMI_DDV is not set
CONFIG_DELL_WMI_LED=y
CONFIG_DELL_WMI_SYSMAN=y
CONFIG_FUJITSU_LAPTOP=y
# CONFIG_FUJITSU_TABLET is not set
CONFIG_GPD_POCKET_FAN=y
CONFIG_X86_PLATFORM_DRIVERS_HP=y
CONFIG_HP_ACCEL=y
# CONFIG_HP_WMI is not set
# CONFIG_TC1100_WMI is not set
# CONFIG_WIRELESS_HOTKEY is not set
# CONFIG_IBM_RTL is not set
# CONFIG_LENOVO_YMC is not set
# CONFIG_SENSORS_HDAPS is not set
# CONFIG_THINKPAD_ACPI is not set
CONFIG_THINKPAD_LMI=y
CONFIG_INTEL_ATOMISP2_PDX86=y
CONFIG_INTEL_ATOMISP2_LED=y
# CONFIG_INTEL_SAR_INT1092 is not set
# CONFIG_INTEL_SKL_INT3472 is not set
# CONFIG_INTEL_PMC_CORE is not set
# CONFIG_INTEL_WMI_SBL_FW_UPDATE is not set
# CONFIG_INTEL_WMI_THUNDERBOLT is not set
CONFIG_INTEL_HID_EVENT=y
# CONFIG_INTEL_VBTN is not set
CONFIG_INTEL_BXTWC_PMIC_TMU=y
# CONFIG_INTEL_BYTCRC_PWRSRC is not set
CONFIG_INTEL_CHTDC_TI_PWRBTN=y
# CONFIG_INTEL_MRFLD_PWRBTN is not set
# CONFIG_INTEL_PUNIT_IPC is not set
# CONFIG_INTEL_RST is not set
# CONFIG_INTEL_SMARTCONNECT is not set
# CONFIG_INTEL_VSEC is not set
# CONFIG_MSI_EC is not set
# CONFIG_MSI_WMI is not set
CONFIG_PCENGINES_APU2=y
# CONFIG_BARCO_P50_GPIO is not set
CONFIG_SAMSUNG_LAPTOP=y
CONFIG_SAMSUNG_Q10=y
CONFIG_ACPI_TOSHIBA=y
CONFIG_TOSHIBA_BT_RFKILL=y
CONFIG_TOSHIBA_HAPS=y
CONFIG_TOSHIBA_WMI=y
CONFIG_ACPI_CMPC=y
# CONFIG_LG_LAPTOP is not set
# CONFIG_PANASONIC_LAPTOP is not set
# CONFIG_TOPSTAR_LAPTOP is not set
CONFIG_MLX_PLATFORM=y
CONFIG_FW_ATTR_CLASS=y
# CONFIG_INTEL_IPS is not set
CONFIG_INTEL_SCU_IPC=y
CONFIG_INTEL_SCU=y
# CONFIG_INTEL_SCU_PCI is not set
CONFIG_INTEL_SCU_PLATFORM=y
CONFIG_INTEL_SCU_IPC_UTIL=y
# CONFIG_SIEMENS_SIMATIC_IPC is not set
CONFIG_WINMATE_FM07_KEYS=y
# CONFIG_P2SB is not set
CONFIG_HAVE_CLK=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y
# CONFIG_COMMON_CLK_MAX9485 is not set
# CONFIG_COMMON_CLK_SI5341 is not set
# CONFIG_COMMON_CLK_SI5351 is not set
# CONFIG_COMMON_CLK_SI544 is not set
CONFIG_COMMON_CLK_CDCE706=y
CONFIG_COMMON_CLK_CS2000_CP=y
# CONFIG_CLK_TWL6040 is not set
# CONFIG_COMMON_CLK_PWM is not set
CONFIG_XILINX_VCU=y
CONFIG_HWSPINLOCK=y

#
# Clock Source drivers
#
CONFIG_CLKSRC_I8253=y
CONFIG_CLKEVT_I8253=y
CONFIG_I8253_LOCK=y
CONFIG_CLKBLD_I8253=y
# end of Clock Source drivers

CONFIG_MAILBOX=y
CONFIG_PCC=y
# CONFIG_ALTERA_MBOX is not set
CONFIG_IOMMU_IOVA=y
CONFIG_IOMMU_API=y
CONFIG_IOMMU_SUPPORT=y

#
# Generic IOMMU Pagetable Support
#
# end of Generic IOMMU Pagetable Support

CONFIG_IOMMU_DEBUGFS=y
# CONFIG_IOMMU_DEFAULT_DMA_STRICT is not set
CONFIG_IOMMU_DEFAULT_DMA_LAZY=y
# CONFIG_IOMMU_DEFAULT_PASSTHROUGH is not set
CONFIG_IOMMU_DMA=y
# CONFIG_IOMMUFD is not set
CONFIG_HYPERV_IOMMU=y
# CONFIG_VIRTIO_IOMMU is not set

#
# Remoteproc drivers
#
CONFIG_REMOTEPROC=y
CONFIG_REMOTEPROC_CDEV=y
# end of Remoteproc drivers

#
# Rpmsg drivers
#
CONFIG_RPMSG=y
# CONFIG_RPMSG_CHAR is not set
CONFIG_RPMSG_CTRL=y
CONFIG_RPMSG_NS=y
CONFIG_RPMSG_QCOM_GLINK=y
CONFIG_RPMSG_QCOM_GLINK_RPM=y
CONFIG_RPMSG_VIRTIO=y
# end of Rpmsg drivers

CONFIG_SOUNDWIRE=y

#
# SoundWire Devices
#

#
# SOC (System On Chip) specific Drivers
#

#
# Amlogic SoC drivers
#
# end of Amlogic SoC drivers

#
# Broadcom SoC drivers
#
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
# end of NXP/Freescale QorIQ SoC drivers

#
# fujitsu SoC drivers
#
# end of fujitsu SoC drivers

#
# i.MX SoC drivers
#
# end of i.MX SoC drivers

#
# Enable LiteX SoC Builder specific drivers
#
# end of Enable LiteX SoC Builder specific drivers

CONFIG_WPCM450_SOC=y

#
# Qualcomm SoC drivers
#
# end of Qualcomm SoC drivers

# CONFIG_SOC_TI is not set

#
# Xilinx SoC drivers
#
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

CONFIG_PM_DEVFREQ=y

#
# DEVFREQ Governors
#
CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=y
CONFIG_DEVFREQ_GOV_PERFORMANCE=y
CONFIG_DEVFREQ_GOV_POWERSAVE=y
CONFIG_DEVFREQ_GOV_USERSPACE=y
# CONFIG_DEVFREQ_GOV_PASSIVE is not set

#
# DEVFREQ Drivers
#
# CONFIG_PM_DEVFREQ_EVENT is not set
CONFIG_EXTCON=y

#
# Extcon Device Drivers
#
CONFIG_EXTCON_ADC_JACK=y
CONFIG_EXTCON_FSA9480=y
CONFIG_EXTCON_GPIO=y
# CONFIG_EXTCON_INTEL_INT3496 is not set
CONFIG_EXTCON_INTEL_MRFLD=y
CONFIG_EXTCON_MAX14577=y
CONFIG_EXTCON_MAX3355=y
# CONFIG_EXTCON_MAX77843 is not set
CONFIG_EXTCON_MAX8997=y
# CONFIG_EXTCON_PTN5150 is not set
CONFIG_EXTCON_RT8973A=y
CONFIG_EXTCON_SM5502=y
CONFIG_EXTCON_USB_GPIO=y
CONFIG_EXTCON_USBC_TUSB320=y
CONFIG_MEMORY=y
CONFIG_IIO=y
CONFIG_IIO_BUFFER=y
CONFIG_IIO_BUFFER_CB=y
CONFIG_IIO_BUFFER_DMA=y
CONFIG_IIO_BUFFER_DMAENGINE=y
# CONFIG_IIO_BUFFER_HW_CONSUMER is not set
CONFIG_IIO_KFIFO_BUF=y
CONFIG_IIO_TRIGGERED_BUFFER=y
CONFIG_IIO_CONFIGFS=y
CONFIG_IIO_TRIGGER=y
CONFIG_IIO_CONSUMERS_PER_TRIGGER=2
CONFIG_IIO_SW_DEVICE=y
CONFIG_IIO_SW_TRIGGER=y
CONFIG_IIO_TRIGGERED_EVENT=y

#
# Accelerometers
#
CONFIG_ADXL313=y
CONFIG_ADXL313_I2C=y
CONFIG_ADXL345=y
CONFIG_ADXL345_I2C=y
# CONFIG_ADXL355_I2C is not set
CONFIG_ADXL367=y
CONFIG_ADXL367_I2C=y
CONFIG_ADXL372=y
CONFIG_ADXL372_I2C=y
CONFIG_BMA400=y
CONFIG_BMA400_I2C=y
CONFIG_BMC150_ACCEL=y
CONFIG_BMC150_ACCEL_I2C=y
CONFIG_DA280=y
CONFIG_DA311=y
# CONFIG_DMARD06 is not set
CONFIG_DMARD09=y
CONFIG_DMARD10=y
CONFIG_FXLS8962AF=y
CONFIG_FXLS8962AF_I2C=y
CONFIG_IIO_ST_ACCEL_3AXIS=y
# CONFIG_IIO_ST_ACCEL_I2C_3AXIS is not set
# CONFIG_IIO_KX022A_I2C is not set
# CONFIG_KXSD9 is not set
# CONFIG_KXCJK1013 is not set
# CONFIG_MC3230 is not set
# CONFIG_MMA7455_I2C is not set
CONFIG_MMA7660=y
CONFIG_MMA8452=y
CONFIG_MMA9551_CORE=y
CONFIG_MMA9551=y
CONFIG_MMA9553=y
CONFIG_MSA311=y
CONFIG_MXC4005=y
# CONFIG_MXC6255 is not set
CONFIG_STK8312=y
CONFIG_STK8BA50=y
# end of Accelerometers

#
# Analog to digital converters
#
# CONFIG_AD7091R5 is not set
CONFIG_AD7291=y
CONFIG_AD7606=y
CONFIG_AD7606_IFACE_PARALLEL=y
CONFIG_AD799X=y
# CONFIG_CC10001_ADC is not set
CONFIG_DA9150_GPADC=y
# CONFIG_DLN2_ADC is not set
CONFIG_ENVELOPE_DETECTOR=y
# CONFIG_HX711 is not set
# CONFIG_INA2XX_ADC is not set
# CONFIG_INTEL_MRFLD_ADC is not set
CONFIG_LP8788_ADC=y
# CONFIG_LTC2471 is not set
CONFIG_LTC2485=y
CONFIG_LTC2497=y
CONFIG_MAX1363=y
CONFIG_MAX9611=y
# CONFIG_MCP3422 is not set
CONFIG_MEDIATEK_MT6370_ADC=y
CONFIG_NAU7802=y
CONFIG_QCOM_VADC_COMMON=y
# CONFIG_QCOM_SPMI_IADC is not set
CONFIG_QCOM_SPMI_VADC=y
CONFIG_QCOM_SPMI_ADC5=y
# CONFIG_RICHTEK_RTQ6056 is not set
CONFIG_SD_ADC_MODULATOR=y
CONFIG_TI_ADC081C=y
CONFIG_TI_ADS1015=y
CONFIG_TI_ADS7924=y
# CONFIG_TI_ADS1100 is not set
CONFIG_TI_AM335X_ADC=y
CONFIG_VF610_ADC=y
CONFIG_VIPERBOARD_ADC=y
# CONFIG_XILINX_XADC is not set
# end of Analog to digital converters

#
# Analog to digital and digital to analog converters
#
# end of Analog to digital and digital to analog converters

#
# Analog Front Ends
#
# CONFIG_IIO_RESCALE is not set
# end of Analog Front Ends

#
# Amplifiers
#
CONFIG_HMC425=y
# end of Amplifiers

#
# Capacitance to digital converters
#
CONFIG_AD7150=y
# CONFIG_AD7746 is not set
# end of Capacitance to digital converters

#
# Chemical Sensors
#
# CONFIG_ATLAS_PH_SENSOR is not set
CONFIG_ATLAS_EZO_SENSOR=y
CONFIG_BME680=y
CONFIG_BME680_I2C=y
# CONFIG_CCS811 is not set
CONFIG_IAQCORE=y
CONFIG_SCD30_CORE=y
CONFIG_SCD30_I2C=y
CONFIG_SCD4X=y
CONFIG_SENSIRION_SGP30=y
# CONFIG_SENSIRION_SGP40 is not set
CONFIG_SPS30=y
CONFIG_SPS30_I2C=y
# CONFIG_SENSEAIR_SUNRISE_CO2 is not set
# CONFIG_VZ89X is not set
# end of Chemical Sensors

#
# Hid Sensor IIO Common
#
# end of Hid Sensor IIO Common

CONFIG_IIO_MS_SENSORS_I2C=y

#
# IIO SCMI Sensors
#
# end of IIO SCMI Sensors

#
# SSP Sensor Common
#
# end of SSP Sensor Common

CONFIG_IIO_ST_SENSORS_I2C=y
CONFIG_IIO_ST_SENSORS_CORE=y

#
# Digital to analog converters
#
# CONFIG_AD5064 is not set
CONFIG_AD5380=y
CONFIG_AD5446=y
CONFIG_AD5592R_BASE=y
CONFIG_AD5593R=y
# CONFIG_AD5696_I2C is not set
CONFIG_DPOT_DAC=y
CONFIG_DS4424=y
CONFIG_M62332=y
# CONFIG_MAX517 is not set
# CONFIG_MAX5821 is not set
CONFIG_MCP4725=y
CONFIG_TI_DAC5571=y
CONFIG_VF610_DAC=y
# end of Digital to analog converters

#
# IIO dummy driver
#
CONFIG_IIO_SIMPLE_DUMMY=y
# CONFIG_IIO_SIMPLE_DUMMY_EVENTS is not set
CONFIG_IIO_SIMPLE_DUMMY_BUFFER=y
# end of IIO dummy driver

#
# Filters
#
# end of Filters

#
# Frequency Synthesizers DDS/PLL
#

#
# Clock Generator/Distribution
#
# end of Clock Generator/Distribution

#
# Phase-Locked Loop (PLL) frequency synthesizers
#
# end of Phase-Locked Loop (PLL) frequency synthesizers
# end of Frequency Synthesizers DDS/PLL

#
# Digital gyroscope sensors
#
# CONFIG_BMG160 is not set
CONFIG_FXAS21002C=y
CONFIG_FXAS21002C_I2C=y
CONFIG_MPU3050=y
CONFIG_MPU3050_I2C=y
# CONFIG_IIO_ST_GYRO_3AXIS is not set
CONFIG_ITG3200=y
# end of Digital gyroscope sensors

#
# Health Sensors
#

#
# Heart Rate Monitors
#
CONFIG_AFE4404=y
CONFIG_MAX30100=y
CONFIG_MAX30102=y
# end of Heart Rate Monitors
# end of Health Sensors

#
# Humidity sensors
#
CONFIG_AM2315=y
# CONFIG_DHT11 is not set
CONFIG_HDC100X=y
# CONFIG_HDC2010 is not set
CONFIG_HTS221=y
CONFIG_HTS221_I2C=y
CONFIG_HTU21=y
CONFIG_SI7005=y
CONFIG_SI7020=y
# end of Humidity sensors

#
# Inertial measurement units
#
CONFIG_BMI160=y
CONFIG_BMI160_I2C=y
# CONFIG_BOSCH_BNO055_I2C is not set
CONFIG_FXOS8700=y
CONFIG_FXOS8700_I2C=y
CONFIG_KMX61=y
CONFIG_INV_ICM42600=y
CONFIG_INV_ICM42600_I2C=y
CONFIG_INV_MPU6050_IIO=y
CONFIG_INV_MPU6050_I2C=y
# CONFIG_IIO_ST_LSM6DSX is not set
# CONFIG_IIO_ST_LSM9DS0 is not set
# end of Inertial measurement units

#
# Light sensors
#
CONFIG_ACPI_ALS=y
CONFIG_ADJD_S311=y
CONFIG_ADUX1020=y
# CONFIG_AL3010 is not set
# CONFIG_AL3320A is not set
CONFIG_APDS9300=y
CONFIG_APDS9960=y
CONFIG_AS73211=y
CONFIG_BH1750=y
CONFIG_BH1780=y
CONFIG_CM32181=y
CONFIG_CM3232=y
CONFIG_CM3323=y
CONFIG_CM3605=y
CONFIG_CM36651=y
CONFIG_GP2AP002=y
CONFIG_GP2AP020A00F=y
# CONFIG_SENSORS_ISL29018 is not set
CONFIG_SENSORS_ISL29028=y
# CONFIG_ISL29125 is not set
CONFIG_JSA1212=y
# CONFIG_ROHM_BU27034 is not set
CONFIG_RPR0521=y
CONFIG_SENSORS_LM3533=y
CONFIG_LTR501=y
CONFIG_LTRF216A=y
CONFIG_LV0104CS=y
# CONFIG_MAX44000 is not set
# CONFIG_MAX44009 is not set
CONFIG_NOA1305=y
# CONFIG_OPT3001 is not set
# CONFIG_PA12203001 is not set
CONFIG_SI1133=y
CONFIG_SI1145=y
# CONFIG_STK3310 is not set
CONFIG_ST_UVIS25=y
CONFIG_ST_UVIS25_I2C=y
# CONFIG_TCS3414 is not set
CONFIG_TCS3472=y
# CONFIG_SENSORS_TSL2563 is not set
CONFIG_TSL2583=y
CONFIG_TSL2591=y
CONFIG_TSL2772=y
CONFIG_TSL4531=y
CONFIG_US5182D=y
CONFIG_VCNL4000=y
CONFIG_VCNL4035=y
CONFIG_VEML6030=y
CONFIG_VEML6070=y
# CONFIG_VL6180 is not set
CONFIG_ZOPT2201=y
# end of Light sensors

#
# Magnetometer sensors
#
CONFIG_AK8974=y
CONFIG_AK8975=y
CONFIG_AK09911=y
CONFIG_BMC150_MAGN=y
CONFIG_BMC150_MAGN_I2C=y
CONFIG_MAG3110=y
CONFIG_MMC35240=y
CONFIG_IIO_ST_MAGN_3AXIS=y
CONFIG_IIO_ST_MAGN_I2C_3AXIS=y
CONFIG_SENSORS_HMC5843=y
CONFIG_SENSORS_HMC5843_I2C=y
# CONFIG_SENSORS_RM3100_I2C is not set
# CONFIG_TI_TMAG5273 is not set
CONFIG_YAMAHA_YAS530=y
# end of Magnetometer sensors

#
# Multiplexers
#
# CONFIG_IIO_MUX is not set
# end of Multiplexers

#
# Inclinometer sensors
#
# end of Inclinometer sensors

#
# Triggers - standalone
#
# CONFIG_IIO_HRTIMER_TRIGGER is not set
CONFIG_IIO_INTERRUPT_TRIGGER=y
CONFIG_IIO_TIGHTLOOP_TRIGGER=y
CONFIG_IIO_SYSFS_TRIGGER=y
# end of Triggers - standalone

#
# Linear and angular position sensors
#
# end of Linear and angular position sensors

#
# Digital potentiometers
#
CONFIG_AD5110=y
CONFIG_AD5272=y
CONFIG_DS1803=y
CONFIG_MAX5432=y
# CONFIG_MCP4018 is not set
CONFIG_MCP4531=y
CONFIG_TPL0102=y
# end of Digital potentiometers

#
# Digital potentiostats
#
CONFIG_LMP91000=y
# end of Digital potentiostats

#
# Pressure sensors
#
CONFIG_ABP060MG=y
CONFIG_BMP280=y
CONFIG_BMP280_I2C=y
CONFIG_DLHL60D=y
# CONFIG_DPS310 is not set
CONFIG_HP03=y
# CONFIG_ICP10100 is not set
# CONFIG_MPL115_I2C is not set
CONFIG_MPL3115=y
# CONFIG_MS5611 is not set
# CONFIG_MS5637 is not set
# CONFIG_IIO_ST_PRESS is not set
CONFIG_T5403=y
# CONFIG_HP206C is not set
# CONFIG_ZPA2326 is not set
# end of Pressure sensors

#
# Lightning sensors
#
# end of Lightning sensors

#
# Proximity and distance sensors
#
CONFIG_ISL29501=y
CONFIG_LIDAR_LITE_V2=y
CONFIG_MB1232=y
CONFIG_PING=y
CONFIG_RFD77402=y
# CONFIG_SRF04 is not set
# CONFIG_SX9310 is not set
# CONFIG_SX9324 is not set
# CONFIG_SX9360 is not set
# CONFIG_SX9500 is not set
# CONFIG_SRF08 is not set
CONFIG_VCNL3020=y
CONFIG_VL53L0X_I2C=y
# end of Proximity and distance sensors

#
# Resolver to digital converters
#
# end of Resolver to digital converters

#
# Temperature sensors
#
CONFIG_MLX90614=y
CONFIG_MLX90632=y
CONFIG_TMP006=y
# CONFIG_TMP007 is not set
CONFIG_TMP117=y
# CONFIG_TSYS01 is not set
# CONFIG_TSYS02D is not set
# CONFIG_MAX30208 is not set
# end of Temperature sensors

# CONFIG_NTB is not set
CONFIG_PWM=y
CONFIG_PWM_SYSFS=y
CONFIG_PWM_DEBUG=y
CONFIG_PWM_CLK=y
CONFIG_PWM_CRC=y
# CONFIG_PWM_DWC is not set
CONFIG_PWM_LP3943=y
CONFIG_PWM_LPSS=y
# CONFIG_PWM_LPSS_PCI is not set
CONFIG_PWM_LPSS_PLATFORM=y
# CONFIG_PWM_PCA9685 is not set

#
# IRQ chip support
#
# end of IRQ chip support

CONFIG_IPACK_BUS=y
# CONFIG_BOARD_TPCI200 is not set
CONFIG_SERIAL_IPOCTAL=y
CONFIG_RESET_CONTROLLER=y
CONFIG_RESET_TI_SYSCON=y
CONFIG_RESET_TI_TPS380X=y

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
# CONFIG_USB_LGM_PHY is not set
CONFIG_PHY_CAN_TRANSCEIVER=y

#
# PHY drivers for Broadcom platforms
#
CONFIG_BCM_KONA_USB2_PHY=y
# end of PHY drivers for Broadcom platforms

CONFIG_PHY_PXA_28NM_HSIC=y
CONFIG_PHY_PXA_28NM_USB2=y
# CONFIG_PHY_CPCAP_USB is not set
CONFIG_PHY_QCOM_USB_HS=y
# CONFIG_PHY_QCOM_USB_HSIC is not set
# CONFIG_PHY_TUSB1210 is not set
CONFIG_PHY_INTEL_LGM_EMMC=y
# end of PHY Subsystem

# CONFIG_POWERCAP is not set
# CONFIG_MCB is not set

#
# Performance monitor support
#
# end of Performance monitor support

CONFIG_RAS=y
# CONFIG_RAS_CEC is not set
# CONFIG_USB4 is not set

#
# Android
#
# CONFIG_ANDROID_BINDER_IPC is not set
# end of Android

CONFIG_DAX=y
CONFIG_DEV_DAX=y
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y

#
# Layout Types
#
# CONFIG_NVMEM_LAYOUT_SL28_VPD is not set
# CONFIG_NVMEM_LAYOUT_ONIE_TLV is not set
# end of Layout Types

CONFIG_NVMEM_RMEM=y
# CONFIG_NVMEM_SPMI_SDAM is not set

#
# HW tracing support
#
CONFIG_STM=y
# CONFIG_STM_PROTO_BASIC is not set
# CONFIG_STM_PROTO_SYS_T is not set
# CONFIG_STM_DUMMY is not set
CONFIG_STM_SOURCE_CONSOLE=y
CONFIG_STM_SOURCE_HEARTBEAT=y
# CONFIG_STM_SOURCE_FTRACE is not set
# CONFIG_INTEL_TH is not set
# end of HW tracing support

CONFIG_FPGA=y
CONFIG_ALTERA_PR_IP_CORE=y
# CONFIG_FPGA_MGR_ALTERA_CVP is not set
# CONFIG_FPGA_BRIDGE is not set
# CONFIG_FPGA_DFL is not set
# CONFIG_TEE is not set
CONFIG_MULTIPLEXER=y

#
# Multiplexer drivers
#
CONFIG_MUX_ADG792A=y
CONFIG_MUX_GPIO=y
# end of Multiplexer drivers

CONFIG_PM_OPP=y
CONFIG_SIOX=y
CONFIG_SIOX_BUS_GPIO=y
CONFIG_SLIMBUS=y
CONFIG_SLIM_QCOM_CTRL=y
CONFIG_INTERCONNECT=y
CONFIG_COUNTER=y
# CONFIG_INTEL_QEP is not set
# CONFIG_INTERRUPT_CNT is not set
CONFIG_MOST=y
CONFIG_MOST_USB_HDM=y
CONFIG_MOST_CDEV=y
CONFIG_PECI=y
CONFIG_PECI_CPU=y
CONFIG_HTE=y
# end of Device Drivers

#
# File systems
#
CONFIG_DCACHE_WORD_ACCESS=y
CONFIG_VALIDATE_FS_PARSER=y
CONFIG_FS_IOMAP=y
CONFIG_LEGACY_DIRECT_IO=y
CONFIG_EXT2_FS=y
CONFIG_EXT2_FS_XATTR=y
# CONFIG_EXT2_FS_POSIX_ACL is not set
# CONFIG_EXT2_FS_SECURITY is not set
CONFIG_EXT3_FS=y
CONFIG_EXT3_FS_POSIX_ACL=y
CONFIG_EXT3_FS_SECURITY=y
CONFIG_EXT4_FS=y
CONFIG_EXT4_FS_POSIX_ACL=y
CONFIG_EXT4_FS_SECURITY=y
# CONFIG_EXT4_DEBUG is not set
CONFIG_JBD2=y
CONFIG_JBD2_DEBUG=y
CONFIG_FS_MBCACHE=y
# CONFIG_REISERFS_FS is not set
CONFIG_JFS_FS=y
# CONFIG_JFS_POSIX_ACL is not set
CONFIG_JFS_SECURITY=y
# CONFIG_JFS_DEBUG is not set
CONFIG_JFS_STATISTICS=y
CONFIG_XFS_FS=y
# CONFIG_XFS_SUPPORT_V4 is not set
CONFIG_XFS_SUPPORT_ASCII_CI=y
# CONFIG_XFS_QUOTA is not set
# CONFIG_XFS_POSIX_ACL is not set
CONFIG_XFS_RT=y
# CONFIG_XFS_ONLINE_SCRUB is not set
CONFIG_XFS_DEBUG=y
CONFIG_XFS_ASSERT_FATAL=y
# CONFIG_GFS2_FS is not set
# CONFIG_OCFS2_FS is not set
# CONFIG_BTRFS_FS is not set
CONFIG_NILFS2_FS=y
CONFIG_F2FS_FS=y
# CONFIG_F2FS_STAT_FS is not set
CONFIG_F2FS_FS_XATTR=y
# CONFIG_F2FS_FS_POSIX_ACL is not set
CONFIG_F2FS_FS_SECURITY=y
# CONFIG_F2FS_CHECK_FS is not set
CONFIG_F2FS_FAULT_INJECTION=y
# CONFIG_F2FS_FS_COMPRESSION is not set
CONFIG_F2FS_IOSTAT=y
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
# CONFIG_EXPORTFS_BLOCK_OPS is not set
CONFIG_FILE_LOCKING=y
CONFIG_FS_ENCRYPTION=y
CONFIG_FS_ENCRYPTION_ALGS=y
# CONFIG_FS_ENCRYPTION_INLINE_CRYPT is not set
# CONFIG_FS_VERITY is not set
CONFIG_FSNOTIFY=y
CONFIG_DNOTIFY=y
CONFIG_INOTIFY_USER=y
CONFIG_FANOTIFY=y
# CONFIG_FANOTIFY_ACCESS_PERMISSIONS is not set
CONFIG_QUOTA=y
# CONFIG_QUOTA_NETLINK_INTERFACE is not set
# CONFIG_QUOTA_DEBUG is not set
CONFIG_QUOTA_TREE=y
# CONFIG_QFMT_V1 is not set
CONFIG_QFMT_V2=y
CONFIG_QUOTACTL=y
CONFIG_AUTOFS4_FS=y
CONFIG_AUTOFS_FS=y
CONFIG_FUSE_FS=y
CONFIG_CUSE=y
# CONFIG_VIRTIO_FS is not set
CONFIG_OVERLAY_FS=y
CONFIG_OVERLAY_FS_REDIRECT_DIR=y
# CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW is not set
CONFIG_OVERLAY_FS_INDEX=y
CONFIG_OVERLAY_FS_METACOPY=y

#
# Caches
#
CONFIG_NETFS_SUPPORT=y
CONFIG_NETFS_STATS=y
CONFIG_FSCACHE=y
CONFIG_FSCACHE_STATS=y
# CONFIG_FSCACHE_DEBUG is not set
CONFIG_CACHEFILES=y
# CONFIG_CACHEFILES_DEBUG is not set
# CONFIG_CACHEFILES_ERROR_INJECTION is not set
# CONFIG_CACHEFILES_ONDEMAND is not set
# end of Caches

#
# CD-ROM/DVD Filesystems
#
CONFIG_ISO9660_FS=y
CONFIG_JOLIET=y
# CONFIG_ZISOFS is not set
CONFIG_UDF_FS=y
# end of CD-ROM/DVD Filesystems

#
# DOS/FAT/EXFAT/NT Filesystems
#
CONFIG_FAT_FS=y
CONFIG_MSDOS_FS=y
# CONFIG_VFAT_FS is not set
CONFIG_FAT_DEFAULT_CODEPAGE=437
CONFIG_EXFAT_FS=y
CONFIG_EXFAT_DEFAULT_IOCHARSET="utf8"
CONFIG_NTFS_FS=y
# CONFIG_NTFS_DEBUG is not set
# CONFIG_NTFS_RW is not set
# CONFIG_NTFS3_FS is not set
# end of DOS/FAT/EXFAT/NT Filesystems

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
CONFIG_PROC_KCORE=y
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
CONFIG_PROC_CHILDREN=y
CONFIG_PROC_PID_ARCH_STATUS=y
CONFIG_PROC_CPU_RESCTRL=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
CONFIG_TMPFS_POSIX_ACL=y
CONFIG_TMPFS_XATTR=y
CONFIG_HUGETLBFS=y
CONFIG_HUGETLB_PAGE=y
CONFIG_MEMFD_CREATE=y
CONFIG_CONFIGFS_FS=y
# end of Pseudo filesystems

CONFIG_MISC_FILESYSTEMS=y
CONFIG_ORANGEFS_FS=y
CONFIG_ADFS_FS=y
# CONFIG_ADFS_FS_RW is not set
# CONFIG_AFFS_FS is not set
CONFIG_ECRYPT_FS=y
# CONFIG_ECRYPT_FS_MESSAGING is not set
CONFIG_HFS_FS=y
# CONFIG_HFSPLUS_FS is not set
# CONFIG_BEFS_FS is not set
# CONFIG_BFS_FS is not set
CONFIG_EFS_FS=y
CONFIG_CRAMFS=y
CONFIG_CRAMFS_BLOCKDEV=y
CONFIG_SQUASHFS=y
CONFIG_SQUASHFS_FILE_CACHE=y
# CONFIG_SQUASHFS_FILE_DIRECT is not set
CONFIG_SQUASHFS_DECOMP_SINGLE=y
CONFIG_SQUASHFS_DECOMP_MULTI=y
CONFIG_SQUASHFS_DECOMP_MULTI_PERCPU=y
CONFIG_SQUASHFS_CHOICE_DECOMP_BY_MOUNT=y
CONFIG_SQUASHFS_MOUNT_DECOMP_THREADS=y
CONFIG_SQUASHFS_XATTR=y
# CONFIG_SQUASHFS_ZLIB is not set
CONFIG_SQUASHFS_LZ4=y
CONFIG_SQUASHFS_LZO=y
CONFIG_SQUASHFS_XZ=y
CONFIG_SQUASHFS_ZSTD=y
CONFIG_SQUASHFS_4K_DEVBLK_SIZE=y
CONFIG_SQUASHFS_EMBEDDED=y
CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3
CONFIG_VXFS_FS=y
CONFIG_MINIX_FS=y
CONFIG_OMFS_FS=y
# CONFIG_HPFS_FS is not set
CONFIG_QNX4FS_FS=y
# CONFIG_QNX6FS_FS is not set
# CONFIG_ROMFS_FS is not set
CONFIG_PSTORE=y
CONFIG_PSTORE_DEFAULT_KMSG_BYTES=10240
CONFIG_PSTORE_DEFLATE_COMPRESS=y
CONFIG_PSTORE_LZO_COMPRESS=y
# CONFIG_PSTORE_LZ4_COMPRESS is not set
CONFIG_PSTORE_LZ4HC_COMPRESS=y
CONFIG_PSTORE_842_COMPRESS=y
CONFIG_PSTORE_ZSTD_COMPRESS=y
CONFIG_PSTORE_COMPRESS=y
CONFIG_PSTORE_DEFLATE_COMPRESS_DEFAULT=y
# CONFIG_PSTORE_LZO_COMPRESS_DEFAULT is not set
# CONFIG_PSTORE_LZ4HC_COMPRESS_DEFAULT is not set
# CONFIG_PSTORE_842_COMPRESS_DEFAULT is not set
# CONFIG_PSTORE_ZSTD_COMPRESS_DEFAULT is not set
CONFIG_PSTORE_COMPRESS_DEFAULT="deflate"
# CONFIG_PSTORE_CONSOLE is not set
# CONFIG_PSTORE_PMSG is not set
CONFIG_PSTORE_RAM=y
CONFIG_PSTORE_ZONE=y
CONFIG_PSTORE_BLK=y
CONFIG_PSTORE_BLK_BLKDEV=""
CONFIG_PSTORE_BLK_KMSG_SIZE=64
CONFIG_PSTORE_BLK_MAX_REASON=2
CONFIG_SYSV_FS=y
CONFIG_UFS_FS=y
CONFIG_UFS_FS_WRITE=y
# CONFIG_UFS_DEBUG is not set
CONFIG_EROFS_FS=y
# CONFIG_EROFS_FS_DEBUG is not set
CONFIG_EROFS_FS_XATTR=y
CONFIG_EROFS_FS_POSIX_ACL=y
# CONFIG_EROFS_FS_SECURITY is not set
# CONFIG_EROFS_FS_ZIP is not set
CONFIG_NETWORK_FILESYSTEMS=y
CONFIG_NFS_FS=y
CONFIG_NFS_V2=y
CONFIG_NFS_V3=y
# CONFIG_NFS_V3_ACL is not set
CONFIG_NFS_V4=m
# CONFIG_NFS_SWAP is not set
# CONFIG_NFS_V4_1 is not set
# CONFIG_ROOT_NFS is not set
# CONFIG_NFS_FSCACHE is not set
# CONFIG_NFS_USE_LEGACY_DNS is not set
CONFIG_NFS_USE_KERNEL_DNS=y
CONFIG_NFS_DISABLE_UDP_SUPPORT=y
# CONFIG_NFSD is not set
CONFIG_GRACE_PERIOD=y
CONFIG_LOCKD=y
CONFIG_LOCKD_V4=y
CONFIG_NFS_COMMON=y
CONFIG_SUNRPC=y
CONFIG_SUNRPC_GSS=y
CONFIG_RPCSEC_GSS_KRB5=y
# CONFIG_SUNRPC_DEBUG is not set
# CONFIG_CEPH_FS is not set
CONFIG_CIFS=m
CONFIG_CIFS_STATS2=y
CONFIG_CIFS_ALLOW_INSECURE_LEGACY=y
# CONFIG_CIFS_UPCALL is not set
# CONFIG_CIFS_XATTR is not set
CONFIG_CIFS_DEBUG=y
# CONFIG_CIFS_DEBUG2 is not set
# CONFIG_CIFS_DEBUG_DUMP_KEYS is not set
# CONFIG_CIFS_DFS_UPCALL is not set
# CONFIG_CIFS_SWN_UPCALL is not set
# CONFIG_CIFS_FSCACHE is not set
# CONFIG_SMB_SERVER is not set
CONFIG_SMBFS_COMMON=m
# CONFIG_CODA_FS is not set
# CONFIG_AFS_FS is not set
# CONFIG_9P_FS is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
CONFIG_NLS_CODEPAGE_437=y
CONFIG_NLS_CODEPAGE_737=y
# CONFIG_NLS_CODEPAGE_775 is not set
CONFIG_NLS_CODEPAGE_850=y
CONFIG_NLS_CODEPAGE_852=y
CONFIG_NLS_CODEPAGE_855=y
# CONFIG_NLS_CODEPAGE_857 is not set
CONFIG_NLS_CODEPAGE_860=y
CONFIG_NLS_CODEPAGE_861=y
# CONFIG_NLS_CODEPAGE_862 is not set
CONFIG_NLS_CODEPAGE_863=y
CONFIG_NLS_CODEPAGE_864=y
CONFIG_NLS_CODEPAGE_865=y
CONFIG_NLS_CODEPAGE_866=y
CONFIG_NLS_CODEPAGE_869=y
# CONFIG_NLS_CODEPAGE_936 is not set
CONFIG_NLS_CODEPAGE_950=y
# CONFIG_NLS_CODEPAGE_932 is not set
CONFIG_NLS_CODEPAGE_949=y
CONFIG_NLS_CODEPAGE_874=y
# CONFIG_NLS_ISO8859_8 is not set
CONFIG_NLS_CODEPAGE_1250=y
CONFIG_NLS_CODEPAGE_1251=y
CONFIG_NLS_ASCII=y
CONFIG_NLS_ISO8859_1=y
# CONFIG_NLS_ISO8859_2 is not set
# CONFIG_NLS_ISO8859_3 is not set
CONFIG_NLS_ISO8859_4=y
# CONFIG_NLS_ISO8859_5 is not set
# CONFIG_NLS_ISO8859_6 is not set
CONFIG_NLS_ISO8859_7=y
# CONFIG_NLS_ISO8859_9 is not set
# CONFIG_NLS_ISO8859_13 is not set
CONFIG_NLS_ISO8859_14=y
# CONFIG_NLS_ISO8859_15 is not set
CONFIG_NLS_KOI8_R=y
CONFIG_NLS_KOI8_U=y
# CONFIG_NLS_MAC_ROMAN is not set
CONFIG_NLS_MAC_CELTIC=y
# CONFIG_NLS_MAC_CENTEURO is not set
# CONFIG_NLS_MAC_CROATIAN is not set
CONFIG_NLS_MAC_CYRILLIC=y
CONFIG_NLS_MAC_GAELIC=y
CONFIG_NLS_MAC_GREEK=y
CONFIG_NLS_MAC_ICELAND=y
CONFIG_NLS_MAC_INUIT=y
CONFIG_NLS_MAC_ROMANIAN=y
CONFIG_NLS_MAC_TURKISH=y
# CONFIG_NLS_UTF8 is not set
# CONFIG_DLM is not set
# CONFIG_UNICODE is not set
CONFIG_IO_WQ=y
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
CONFIG_KEYS_REQUEST_CACHE=y
# CONFIG_PERSISTENT_KEYRINGS is not set
# CONFIG_BIG_KEYS is not set
CONFIG_TRUSTED_KEYS=y
CONFIG_TRUSTED_KEYS_TPM=y
# CONFIG_ENCRYPTED_KEYS is not set
# CONFIG_KEY_DH_OPERATIONS is not set
CONFIG_KEY_NOTIFICATIONS=y
# CONFIG_SECURITY_DMESG_RESTRICT is not set
CONFIG_SECURITY=y
# CONFIG_SECURITYFS is not set
# CONFIG_SECURITY_NETWORK is not set
# CONFIG_SECURITY_PATH is not set
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
CONFIG_HARDENED_USERCOPY=y
CONFIG_STATIC_USERMODEHELPER=y
CONFIG_STATIC_USERMODEHELPER_PATH="/sbin/usermode-helper"
# CONFIG_SECURITY_SMACK is not set
# CONFIG_SECURITY_TOMOYO is not set
# CONFIG_SECURITY_APPARMOR is not set
# CONFIG_SECURITY_LOADPIN is not set
# CONFIG_SECURITY_YAMA is not set
# CONFIG_SECURITY_SAFESETID is not set
# CONFIG_SECURITY_LOCKDOWN_LSM is not set
# CONFIG_SECURITY_LANDLOCK is not set
CONFIG_INTEGRITY=y
# CONFIG_INTEGRITY_SIGNATURE is not set
# CONFIG_IMA is not set
# CONFIG_EVM is not set
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,integrity,bpf"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_CC_HAS_AUTO_VAR_INIT_PATTERN=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO_ENABLER=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO=y
# CONFIG_INIT_STACK_NONE is not set
CONFIG_INIT_STACK_ALL_PATTERN=y
# CONFIG_INIT_STACK_ALL_ZERO is not set
# CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
# CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
CONFIG_CC_HAS_ZERO_CALL_USED_REGS=y
# CONFIG_ZERO_CALL_USED_REGS is not set
# end of Memory initialization

CONFIG_RANDSTRUCT_NONE=y
# end of Kernel hardening options
# end of Security options

CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_SKCIPHER=y
CONFIG_CRYPTO_SKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=y
CONFIG_CRYPTO_AKCIPHER2=y
CONFIG_CRYPTO_AKCIPHER=y
CONFIG_CRYPTO_KPP2=y
CONFIG_CRYPTO_KPP=y
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
# CONFIG_CRYPTO_USER is not set
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
CONFIG_CRYPTO_PCRYPT=y
CONFIG_CRYPTO_CRYPTD=y
CONFIG_CRYPTO_AUTHENC=y
# CONFIG_CRYPTO_TEST is not set
CONFIG_CRYPTO_SIMD=y
CONFIG_CRYPTO_ENGINE=y
# end of Crypto core or helper

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=y
CONFIG_CRYPTO_DH_RFC7919_GROUPS=y
CONFIG_CRYPTO_ECC=y
CONFIG_CRYPTO_ECDH=y
# CONFIG_CRYPTO_ECDSA is not set
CONFIG_CRYPTO_ECRDSA=y
# CONFIG_CRYPTO_SM2 is not set
CONFIG_CRYPTO_CURVE25519=y
# end of Public-key cryptography

#
# Block ciphers
#
CONFIG_CRYPTO_AES=y
CONFIG_CRYPTO_AES_TI=y
CONFIG_CRYPTO_ARIA=y
CONFIG_CRYPTO_BLOWFISH=y
CONFIG_CRYPTO_BLOWFISH_COMMON=y
CONFIG_CRYPTO_CAMELLIA=y
# CONFIG_CRYPTO_CAST5 is not set
# CONFIG_CRYPTO_CAST6 is not set
CONFIG_CRYPTO_DES=y
# CONFIG_CRYPTO_FCRYPT is not set
CONFIG_CRYPTO_SERPENT=y
# CONFIG_CRYPTO_SM4_GENERIC is not set
# CONFIG_CRYPTO_TWOFISH is not set
CONFIG_CRYPTO_TWOFISH_COMMON=y
# end of Block ciphers

#
# Length-preserving ciphers and modes
#
# CONFIG_CRYPTO_ADIANTUM is not set
CONFIG_CRYPTO_CHACHA20=y
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CFB=y
CONFIG_CRYPTO_CTR=y
# CONFIG_CRYPTO_CTS is not set
CONFIG_CRYPTO_ECB=y
# CONFIG_CRYPTO_HCTR2 is not set
CONFIG_CRYPTO_KEYWRAP=y
# CONFIG_CRYPTO_LRW is not set
CONFIG_CRYPTO_OFB=y
# CONFIG_CRYPTO_PCBC is not set
CONFIG_CRYPTO_XTS=y
# end of Length-preserving ciphers and modes

#
# AEAD (authenticated encryption with associated data) ciphers
#
CONFIG_CRYPTO_AEGIS128=y
CONFIG_CRYPTO_CHACHA20POLY1305=y
CONFIG_CRYPTO_CCM=m
CONFIG_CRYPTO_GCM=m
CONFIG_CRYPTO_SEQIV=y
CONFIG_CRYPTO_ECHAINIV=y
CONFIG_CRYPTO_ESSIV=y
# end of AEAD (authenticated encryption with associated data) ciphers

#
# Hashes, digests, and MACs
#
CONFIG_CRYPTO_BLAKE2B=y
CONFIG_CRYPTO_CMAC=y
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_HMAC=y
# CONFIG_CRYPTO_MD4 is not set
CONFIG_CRYPTO_MD5=y
# CONFIG_CRYPTO_MICHAEL_MIC is not set
CONFIG_CRYPTO_POLY1305=y
# CONFIG_CRYPTO_RMD160 is not set
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
# CONFIG_CRYPTO_SHA3 is not set
CONFIG_CRYPTO_SM3=y
CONFIG_CRYPTO_SM3_GENERIC=y
CONFIG_CRYPTO_STREEBOG=y
# CONFIG_CRYPTO_VMAC is not set
# CONFIG_CRYPTO_WP512 is not set
CONFIG_CRYPTO_XCBC=y
CONFIG_CRYPTO_XXHASH=y
# end of Hashes, digests, and MACs

#
# CRCs (cyclic redundancy checks)
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32=y
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_CRC64_ROCKSOFT=y
# end of CRCs (cyclic redundancy checks)

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=y
CONFIG_CRYPTO_LZO=y
CONFIG_CRYPTO_842=y
# CONFIG_CRYPTO_LZ4 is not set
CONFIG_CRYPTO_LZ4HC=y
CONFIG_CRYPTO_ZSTD=y
# end of Compression

#
# Random number generation
#
# CONFIG_CRYPTO_ANSI_CPRNG is not set
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
# CONFIG_CRYPTO_DRBG_HASH is not set
CONFIG_CRYPTO_DRBG_CTR=y
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
# end of Random number generation

#
# Userspace interface
#
# CONFIG_CRYPTO_USER_API_HASH is not set
# CONFIG_CRYPTO_USER_API_SKCIPHER is not set
# CONFIG_CRYPTO_USER_API_RNG is not set
# CONFIG_CRYPTO_USER_API_AEAD is not set
# end of Userspace interface

CONFIG_CRYPTO_HASH_INFO=y

#
# Accelerated Cryptographic Algorithms for CPU (x86)
#
CONFIG_CRYPTO_AES_NI_INTEL=y
CONFIG_CRYPTO_SERPENT_SSE2_586=y
CONFIG_CRYPTO_TWOFISH_586=y
CONFIG_CRYPTO_CRC32C_INTEL=y
CONFIG_CRYPTO_CRC32_PCLMUL=y
# end of Accelerated Cryptographic Algorithms for CPU (x86)

CONFIG_CRYPTO_HW=y
# CONFIG_CRYPTO_DEV_PADLOCK is not set
# CONFIG_CRYPTO_DEV_GEODE is not set
# CONFIG_CRYPTO_DEV_HIFN_795X is not set
CONFIG_CRYPTO_DEV_ATMEL_I2C=y
CONFIG_CRYPTO_DEV_ATMEL_ECC=y
CONFIG_CRYPTO_DEV_ATMEL_SHA204A=y
# CONFIG_CRYPTO_DEV_CCP is not set
# CONFIG_CRYPTO_DEV_QAT_DH895xCC is not set
# CONFIG_CRYPTO_DEV_QAT_C3XXX is not set
# CONFIG_CRYPTO_DEV_QAT_C62X is not set
# CONFIG_CRYPTO_DEV_QAT_4XXX is not set
# CONFIG_CRYPTO_DEV_QAT_DH895xCCVF is not set
# CONFIG_CRYPTO_DEV_QAT_C3XXXVF is not set
# CONFIG_CRYPTO_DEV_QAT_C62XVF is not set
CONFIG_CRYPTO_DEV_VIRTIO=y
# CONFIG_CRYPTO_DEV_SAFEXCEL is not set
CONFIG_CRYPTO_DEV_AMLOGIC_GXL=y
CONFIG_CRYPTO_DEV_AMLOGIC_GXL_DEBUG=y
# CONFIG_ASYMMETRIC_KEY_TYPE is not set

#
# Certificates for signature checking
#
CONFIG_SYSTEM_BLACKLIST_KEYRING=y
CONFIG_SYSTEM_BLACKLIST_HASH_LIST=""
# end of Certificates for signature checking

CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_LINEAR_RANGES=y
CONFIG_PACKING=y
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
CONFIG_CORDIC=y
CONFIG_PRIME_NUMBERS=y
CONFIG_RATIONAL=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_GENERIC_IOMAP=y
CONFIG_ARCH_HAS_FAST_MULTIPLIER=y
CONFIG_ARCH_USE_SYM_ANNOTATIONS=y

#
# Crypto library routines
#
CONFIG_CRYPTO_LIB_UTILS=y
CONFIG_CRYPTO_LIB_AES=y
CONFIG_CRYPTO_LIB_GF128MUL=y
CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA=y
CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=y
CONFIG_CRYPTO_LIB_CURVE25519=y
CONFIG_CRYPTO_LIB_DES=y
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=1
CONFIG_CRYPTO_LIB_POLY1305_GENERIC=y
CONFIG_CRYPTO_LIB_POLY1305=y
CONFIG_CRYPTO_LIB_CHACHA20POLY1305=y
CONFIG_CRYPTO_LIB_SHA1=y
CONFIG_CRYPTO_LIB_SHA256=y
# end of Crypto library routines

CONFIG_CRC_CCITT=y
CONFIG_CRC16=y
# CONFIG_CRC_T10DIF is not set
CONFIG_CRC64_ROCKSOFT=y
CONFIG_CRC_ITU_T=y
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
# CONFIG_CRC32_SLICEBY8 is not set
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
CONFIG_CRC32_BIT=y
CONFIG_CRC64=y
CONFIG_CRC4=y
CONFIG_CRC7=y
CONFIG_LIBCRC32C=y
CONFIG_CRC8=y
CONFIG_XXHASH=y
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_842_COMPRESS=y
CONFIG_842_DECOMPRESS=y
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_COMPRESS=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4_COMPRESS=y
CONFIG_LZ4HC_COMPRESS=y
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_COMMON=y
CONFIG_ZSTD_COMPRESS=y
CONFIG_ZSTD_DECOMPRESS=y
CONFIG_XZ_DEC=y
CONFIG_XZ_DEC_X86=y
CONFIG_XZ_DEC_POWERPC=y
CONFIG_XZ_DEC_IA64=y
CONFIG_XZ_DEC_ARM=y
CONFIG_XZ_DEC_ARMTHUMB=y
CONFIG_XZ_DEC_SPARC=y
# CONFIG_XZ_DEC_MICROLZMA is not set
CONFIG_XZ_DEC_BCJ=y
# CONFIG_XZ_DEC_TEST is not set
CONFIG_DECOMPRESS_GZIP=y
CONFIG_DECOMPRESS_XZ=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_REED_SOLOMON=y
CONFIG_REED_SOLOMON_ENC8=y
CONFIG_REED_SOLOMON_DEC8=y
CONFIG_XARRAY_MULTI=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_DMA_OPS=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_DMA_CMA=y
# CONFIG_DMA_PERNUMA_CMA is not set

#
# Default contiguous memory area size:
#
CONFIG_CMA_SIZE_MBYTES=0
CONFIG_CMA_SIZE_SEL_MBYTES=y
# CONFIG_CMA_SIZE_SEL_PERCENTAGE is not set
# CONFIG_CMA_SIZE_SEL_MIN is not set
# CONFIG_CMA_SIZE_SEL_MAX is not set
CONFIG_CMA_ALIGNMENT=8
# CONFIG_DMA_API_DEBUG is not set
CONFIG_DMA_MAP_BENCHMARK=y
CONFIG_SGL_ALLOC=y
CONFIG_CHECK_SIGNATURE=y
CONFIG_CPU_RMAP=y
CONFIG_DQL=y
CONFIG_GLOB=y
# CONFIG_GLOB_SELFTEST is not set
CONFIG_NLATTR=y
CONFIG_CLZ_TAB=y
CONFIG_IRQ_POLL=y
CONFIG_MPILIB=y
CONFIG_OID_REGISTRY=y
CONFIG_HAVE_GENERIC_VDSO=y
CONFIG_GENERIC_GETTIMEOFDAY=y
CONFIG_GENERIC_VDSO_32=y
CONFIG_GENERIC_VDSO_TIME_NS=y
CONFIG_SG_POOL=y
CONFIG_ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION=y
CONFIG_ARCH_STACKWALK=y
CONFIG_STACKDEPOT=y
CONFIG_STACKDEPOT_ALWAYS_INIT=y
CONFIG_SBITMAP=y
# end of Library routines

CONFIG_ASN1_ENCODER=y

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_PRINTK_TIME=y
CONFIG_PRINTK_CALLER=y
CONFIG_STACKTRACE_BUILD_ID=y
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
# CONFIG_BOOT_PRINTK_DELAY is not set
CONFIG_DYNAMIC_DEBUG=y
CONFIG_DYNAMIC_DEBUG_CORE=y
# CONFIG_SYMBOLIC_ERRNAME is not set
CONFIG_DEBUG_BUGVERBOSE=y
# end of printk and dmesg options

CONFIG_DEBUG_KERNEL=y
CONFIG_DEBUG_MISC=y

#
# Compile-time checks and compiler options
#
CONFIG_DEBUG_INFO=y
CONFIG_AS_HAS_NON_CONST_LEB128=y
# CONFIG_DEBUG_INFO_NONE is not set
CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
# CONFIG_DEBUG_INFO_DWARF4 is not set
# CONFIG_DEBUG_INFO_DWARF5 is not set
CONFIG_DEBUG_INFO_REDUCED=y
CONFIG_DEBUG_INFO_COMPRESSED_NONE=y
# CONFIG_DEBUG_INFO_COMPRESSED_ZLIB is not set
# CONFIG_DEBUG_INFO_SPLIT is not set
CONFIG_PAHOLE_HAS_SPLIT_BTF=y
CONFIG_PAHOLE_HAS_BTF_TAG=y
CONFIG_PAHOLE_HAS_LANG_EXCLUDE=y
# CONFIG_GDB_SCRIPTS is not set
CONFIG_FRAME_WARN=8192
# CONFIG_STRIP_ASM_SYMS is not set
# CONFIG_HEADERS_INSTALL is not set
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
CONFIG_FRAME_POINTER=y
# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
CONFIG_MAGIC_SYSRQ=y
CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
# CONFIG_MAGIC_SYSRQ_SERIAL is not set
CONFIG_DEBUG_FS=y
# CONFIG_DEBUG_FS_ALLOW_ALL is not set
CONFIG_DEBUG_FS_DISALLOW_MOUNT=y
# CONFIG_DEBUG_FS_ALLOW_NONE is not set
CONFIG_HAVE_ARCH_KGDB=y
# CONFIG_KGDB is not set
CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
CONFIG_UBSAN=y
# CONFIG_UBSAN_TRAP is not set
CONFIG_CC_HAS_UBSAN_BOUNDS=y
CONFIG_CC_HAS_UBSAN_ARRAY_BOUNDS=y
CONFIG_UBSAN_BOUNDS=y
CONFIG_UBSAN_ARRAY_BOUNDS=y
CONFIG_UBSAN_SHIFT=y
CONFIG_UBSAN_UNREACHABLE=y
# CONFIG_UBSAN_BOOL is not set
# CONFIG_UBSAN_ENUM is not set
# CONFIG_UBSAN_ALIGNMENT is not set
CONFIG_UBSAN_SANITIZE_ALL=y
# CONFIG_TEST_UBSAN is not set
CONFIG_HAVE_KCSAN_COMPILER=y
# end of Generic Kernel Debugging Instruments

#
# Networking Debugging
#
# CONFIG_NET_DEV_REFCNT_TRACKER is not set
# CONFIG_NET_NS_REFCNT_TRACKER is not set
# CONFIG_DEBUG_NET is not set
# end of Networking Debugging

#
# Memory Debugging
#
CONFIG_PAGE_EXTENSION=y
# CONFIG_DEBUG_PAGEALLOC is not set
CONFIG_SLUB_DEBUG=y
CONFIG_SLUB_DEBUG_ON=y
CONFIG_PAGE_OWNER=y
CONFIG_PAGE_POISONING=y
# CONFIG_DEBUG_PAGE_REF is not set
# CONFIG_DEBUG_RODATA_TEST is not set
CONFIG_ARCH_HAS_DEBUG_WX=y
# CONFIG_DEBUG_WX is not set
CONFIG_GENERIC_PTDUMP=y
# CONFIG_PTDUMP_DEBUGFS is not set
CONFIG_HAVE_DEBUG_KMEMLEAK=y
CONFIG_DEBUG_KMEMLEAK=y
CONFIG_DEBUG_KMEMLEAK_MEM_POOL_SIZE=16000
# CONFIG_DEBUG_KMEMLEAK_DEFAULT_OFF is not set
CONFIG_DEBUG_KMEMLEAK_AUTO_SCAN=y
CONFIG_DEBUG_OBJECTS=y
# CONFIG_DEBUG_OBJECTS_SELFTEST is not set
# CONFIG_DEBUG_OBJECTS_FREE is not set
CONFIG_DEBUG_OBJECTS_TIMERS=y
# CONFIG_DEBUG_OBJECTS_WORK is not set
# CONFIG_DEBUG_OBJECTS_RCU_HEAD is not set
CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER=y
CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=1
# CONFIG_SHRINKER_DEBUG is not set
CONFIG_DEBUG_STACK_USAGE=y
# CONFIG_SCHED_STACK_END_CHECK is not set
CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=y
# CONFIG_DEBUG_VM is not set
# CONFIG_DEBUG_VM_PGTABLE is not set
CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
# CONFIG_DEBUG_VIRTUAL is not set
CONFIG_DEBUG_MEMORY_INIT=y
# CONFIG_DEBUG_PER_CPU_MAPS is not set
CONFIG_DEBUG_KMAP_LOCAL=y
CONFIG_ARCH_SUPPORTS_KMAP_LOCAL_FORCE_MAP=y
# CONFIG_DEBUG_KMAP_LOCAL_FORCE_MAP is not set
# CONFIG_DEBUG_HIGHMEM is not set
CONFIG_HAVE_DEBUG_STACKOVERFLOW=y
CONFIG_DEBUG_STACKOVERFLOW=y
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_CC_HAS_KASAN_SW_TAGS=y
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
CONFIG_HAVE_ARCH_KFENCE=y
# CONFIG_KFENCE is not set
CONFIG_HAVE_KMSAN_COMPILER=y
# end of Memory Debugging

CONFIG_DEBUG_SHIRQ=y

#
# Debug Oops, Lockups and Hangs
#
CONFIG_PANIC_ON_OOPS=y
CONFIG_PANIC_ON_OOPS_VALUE=1
CONFIG_PANIC_TIMEOUT=0
CONFIG_LOCKUP_DETECTOR=y
CONFIG_SOFTLOCKUP_DETECTOR=y
CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=y
# CONFIG_HARDLOCKUP_DETECTOR is not set
CONFIG_DETECT_HUNG_TASK=y
CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=480
CONFIG_BOOTPARAM_HUNG_TASK_PANIC=y
CONFIG_WQ_WATCHDOG=y
# CONFIG_TEST_LOCKUP is not set
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
CONFIG_SCHED_DEBUG=y
CONFIG_SCHED_INFO=y
CONFIG_SCHEDSTATS=y
# end of Scheduler Debugging

CONFIG_DEBUG_TIMEKEEPING=y
CONFIG_DEBUG_PREEMPT=y

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
CONFIG_PROVE_LOCKING=y
# CONFIG_PROVE_RAW_LOCK_NESTING is not set
# CONFIG_LOCK_STAT is not set
CONFIG_DEBUG_RT_MUTEXES=y
CONFIG_DEBUG_SPINLOCK=y
CONFIG_DEBUG_MUTEXES=y
CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y
CONFIG_DEBUG_RWSEMS=y
CONFIG_DEBUG_LOCK_ALLOC=y
CONFIG_LOCKDEP=y
CONFIG_LOCKDEP_BITS=15
CONFIG_LOCKDEP_CHAINS_BITS=16
CONFIG_LOCKDEP_STACK_TRACE_BITS=19
CONFIG_LOCKDEP_STACK_TRACE_HASH_BITS=14
CONFIG_LOCKDEP_CIRCULAR_QUEUE_BITS=12
# CONFIG_DEBUG_LOCKDEP is not set
CONFIG_DEBUG_ATOMIC_SLEEP=y
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
CONFIG_LOCK_TORTURE_TEST=m
# CONFIG_WW_MUTEX_SELFTEST is not set
# CONFIG_SCF_TORTURE_TEST is not set
# end of Lock Debugging (spinlocks, mutexes, etc...)

CONFIG_TRACE_IRQFLAGS=y
CONFIG_TRACE_IRQFLAGS_NMI=y
# CONFIG_NMI_CHECK_CPU is not set
CONFIG_DEBUG_IRQFLAGS=y
CONFIG_STACKTRACE=y
# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
# CONFIG_DEBUG_KOBJECT is not set
# CONFIG_DEBUG_KOBJECT_RELEASE is not set

#
# Debug kernel data structures
#
CONFIG_DEBUG_LIST=y
CONFIG_DEBUG_PLIST=y
# CONFIG_DEBUG_SG is not set
CONFIG_DEBUG_NOTIFIERS=y
CONFIG_BUG_ON_DATA_CORRUPTION=y
# CONFIG_DEBUG_MAPLE_TREE is not set
# end of Debug kernel data structures

CONFIG_DEBUG_CREDENTIALS=y

#
# RCU Debugging
#
CONFIG_PROVE_RCU=y
# CONFIG_PROVE_RCU_LIST is not set
CONFIG_TORTURE_TEST=m
CONFIG_RCU_SCALE_TEST=m
CONFIG_RCU_TORTURE_TEST=m
CONFIG_RCU_REF_SCALE_TEST=m
CONFIG_RCU_CPU_STALL_TIMEOUT=21
CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=0
# CONFIG_RCU_CPU_STALL_CPUTIME is not set
CONFIG_RCU_TRACE=y
CONFIG_RCU_EQS_DEBUG=y
# end of RCU Debugging

# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
# CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
CONFIG_LATENCYTOP=y
# CONFIG_DEBUG_CGROUP_REF is not set
CONFIG_USER_STACKTRACE_SUPPORT=y
CONFIG_NOP_TRACER=y
CONFIG_HAVE_RETHOOK=y
CONFIG_RETHOOK=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
CONFIG_HAVE_DYNAMIC_FTRACE_NO_PATCHABLE=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_HAVE_BUILDTIME_MCOUNT_SORT=y
CONFIG_TRACE_CLOCK=y
CONFIG_RING_BUFFER=y
CONFIG_EVENT_TRACING=y
CONFIG_CONTEXT_SWITCH_TRACER=y
CONFIG_PREEMPTIRQ_TRACEPOINTS=y
CONFIG_TRACING=y
CONFIG_TRACING_SUPPORT=y
CONFIG_FTRACE=y
# CONFIG_BOOTTIME_TRACING is not set
# CONFIG_FUNCTION_TRACER is not set
# CONFIG_STACK_TRACER is not set
# CONFIG_IRQSOFF_TRACER is not set
# CONFIG_PREEMPT_TRACER is not set
# CONFIG_SCHED_TRACER is not set
# CONFIG_HWLAT_TRACER is not set
# CONFIG_OSNOISE_TRACER is not set
# CONFIG_TIMERLAT_TRACER is not set
# CONFIG_MMIOTRACE is not set
# CONFIG_ENABLE_DEFAULT_TRACERS is not set
# CONFIG_FTRACE_SYSCALLS is not set
# CONFIG_TRACER_SNAPSHOT is not set
CONFIG_BRANCH_PROFILE_NONE=y
# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
# CONFIG_PROFILE_ALL_BRANCHES is not set
# CONFIG_BLK_DEV_IO_TRACE is not set
CONFIG_KPROBE_EVENTS=y
CONFIG_UPROBE_EVENTS=y
CONFIG_BPF_EVENTS=y
CONFIG_DYNAMIC_EVENTS=y
CONFIG_PROBE_EVENTS=y
CONFIG_BPF_KPROBE_OVERRIDE=y
# CONFIG_SYNTH_EVENTS is not set
# CONFIG_USER_EVENTS is not set
# CONFIG_HIST_TRIGGERS is not set
# CONFIG_TRACE_EVENT_INJECT is not set
# CONFIG_TRACEPOINT_BENCHMARK is not set
# CONFIG_RING_BUFFER_BENCHMARK is not set
# CONFIG_TRACE_EVAL_MAP_FILE is not set
# CONFIG_RING_BUFFER_STARTUP_TEST is not set
# CONFIG_RING_BUFFER_VALIDATE_TIME_DELTAS is not set
# CONFIG_PREEMPTIRQ_DELAY_TEST is not set
# CONFIG_KPROBE_EVENT_GEN_TEST is not set
# CONFIG_RV is not set
# CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
# CONFIG_SAMPLES is not set
CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y
# CONFIG_STRICT_DEVMEM is not set

#
# x86 Debugging
#
CONFIG_EARLY_PRINTK_USB=y
CONFIG_X86_VERBOSE_BOOTUP=y
CONFIG_EARLY_PRINTK=y
CONFIG_EARLY_PRINTK_DBGP=y
CONFIG_EARLY_PRINTK_USB_XDBC=y
CONFIG_DEBUG_TLBFLUSH=y
CONFIG_HAVE_MMIOTRACE_SUPPORT=y
# CONFIG_X86_DECODER_SELFTEST is not set
# CONFIG_IO_DELAY_0X80 is not set
# CONFIG_IO_DELAY_0XED is not set
# CONFIG_IO_DELAY_UDELAY is not set
CONFIG_IO_DELAY_NONE=y
CONFIG_DEBUG_BOOT_PARAMS=y
# CONFIG_CPA_DEBUG is not set
CONFIG_DEBUG_ENTRY=y
# CONFIG_DEBUG_NMI_SELFTEST is not set
CONFIG_X86_DEBUG_FPU=y
# CONFIG_PUNIT_ATOM_DEBUG is not set
CONFIG_UNWINDER_FRAME_POINTER=y
# end of x86 Debugging

#
# Kernel Testing and Coverage
#
# CONFIG_KUNIT is not set
# CONFIG_NOTIFIER_ERROR_INJECTION is not set
CONFIG_FUNCTION_ERROR_INJECTION=y
CONFIG_FAULT_INJECTION=y
# CONFIG_FAILSLAB is not set
CONFIG_FAIL_PAGE_ALLOC=y
CONFIG_FAULT_INJECTION_USERCOPY=y
# CONFIG_FAIL_MAKE_REQUEST is not set
# CONFIG_FAIL_IO_TIMEOUT is not set
# CONFIG_FAIL_FUTEX is not set
# CONFIG_FAULT_INJECTION_DEBUG_FS is not set
# CONFIG_FAULT_INJECTION_CONFIGFS is not set
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
CONFIG_RUNTIME_TESTING_MENU=y
# CONFIG_TEST_DHRY is not set
# CONFIG_LKDTM is not set
# CONFIG_TEST_MIN_HEAP is not set
# CONFIG_TEST_DIV64 is not set
# CONFIG_BACKTRACE_SELF_TEST is not set
# CONFIG_TEST_REF_TRACKER is not set
# CONFIG_RBTREE_TEST is not set
# CONFIG_REED_SOLOMON_TEST is not set
# CONFIG_INTERVAL_TREE_TEST is not set
# CONFIG_PERCPU_TEST is not set
# CONFIG_ATOMIC64_SELFTEST is not set
# CONFIG_TEST_HEXDUMP is not set
# CONFIG_STRING_SELFTEST is not set
# CONFIG_TEST_STRING_HELPERS is not set
# CONFIG_TEST_KSTRTOX is not set
# CONFIG_TEST_PRINTF is not set
# CONFIG_TEST_SCANF is not set
# CONFIG_TEST_BITMAP is not set
# CONFIG_TEST_UUID is not set
# CONFIG_TEST_XARRAY is not set
# CONFIG_TEST_MAPLE_TREE is not set
# CONFIG_TEST_RHASHTABLE is not set
# CONFIG_TEST_IDA is not set
# CONFIG_TEST_LKM is not set
# CONFIG_TEST_BITOPS is not set
# CONFIG_TEST_VMALLOC is not set
# CONFIG_TEST_USER_COPY is not set
# CONFIG_TEST_BPF is not set
# CONFIG_TEST_BLACKHOLE_DEV is not set
# CONFIG_FIND_BIT_BENCHMARK is not set
# CONFIG_TEST_FIRMWARE is not set
# CONFIG_TEST_SYSCTL is not set
# CONFIG_TEST_UDELAY is not set
# CONFIG_TEST_STATIC_KEYS is not set
# CONFIG_TEST_DYNAMIC_DEBUG is not set
# CONFIG_TEST_KMOD is not set
# CONFIG_TEST_MEMCAT_P is not set
# CONFIG_TEST_MEMINIT is not set
# CONFIG_TEST_FREE_PAGES is not set
# CONFIG_TEST_FPU is not set
# CONFIG_TEST_CLOCKSOURCE_WATCHDOG is not set
CONFIG_ARCH_USE_MEMTEST=y
# CONFIG_MEMTEST is not set
CONFIG_HYPERV_TESTING=y
# end of Kernel Testing and Coverage

#
# Rust hacking
#
# end of Rust hacking
# end of Kernel hacking

--w4P4cHKAfxD1kdF6
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="job-script"

#!/bin/sh

export_top_env()
{
	export suite='boot'
	export testcase='boot'
	export category='functional'
	export timeout='10m'
	export job_origin='boot.yaml'
	export queue_cmdline_keys='branch
commit
kbuild_queue_analysis'
	export queue='validate'
	export testbox='vm-snb'
	export tbox_group='vm-snb'
	export branch='joelgranados/jag/sysctl-testing-for-0day'
	export commit='d9c5a8f98c16b522847b83bfb9c4f201d31db50d'
	export kconfig='i386-randconfig-i012-20230627'
	export repeat_to=6
	export nr_vm=300
	export submit_id='649b1b3c19d8499553b0a966'
	export job_file='/lkp/jobs/queued/validate/vm-snb/boot-1-debian-11.1-i386-20220923.cgz-i386-randconfig-i012-20230627-d9c5a8f98c16-20230628-38227-yqagi1-4.yaml'
	export id='2499439cd9eceb9d2c475ff5042bb33e0dccc811'
	export queuer_version='/zday/lkp'
	export model='qemu-system-x86_64 -enable-kvm -cpu SandyBridge'
	export nr_cpu=2
	export memory='16G'
	export need_kconfig=\{\"KVM_GUEST\"\=\>\"y\"\}
	export ssh_base_port=23032
	export kernel_cmdline_hw='vmalloc=256M initramfs_async=0 page_owner=on'
	export rootfs='debian-11.1-i386-20220923.cgz'
	export compiler='clang-15'
	export enqueue_time='2023-06-28 01:24:12 +0800'
	export _id='649b1b3c19d8499553b0a967'
	export _rt='/result/boot/1/vm-snb/debian-11.1-i386-20220923.cgz/i386-randconfig-i012-20230627/clang-15/d9c5a8f98c16b522847b83bfb9c4f201d31db50d'
	export user='lkp'
	export LKP_SERVER='internal-lkp-server'
	export scheduler_version='/lkp/lkp/.src-20230627-211350'
	export arch='i386'
	export max_uptime=600
	export initrd='/osimage/debian/debian-11.1-i386-20220923.cgz'
	export bootloader_append='root=/dev/ram0
RESULT_ROOT=/result/boot/1/vm-snb/debian-11.1-i386-20220923.cgz/i386-randconfig-i012-20230627/clang-15/d9c5a8f98c16b522847b83bfb9c4f201d31db50d/3
BOOT_IMAGE=/pkg/linux/i386-randconfig-i012-20230627/clang-15/d9c5a8f98c16b522847b83bfb9c4f201d31db50d/vmlinuz-6.4.0-rc2-00029-gd9c5a8f98c16
branch=joelgranados/jag/sysctl-testing-for-0day
job=/lkp/jobs/scheduled/vm-meta-23/boot-1-debian-11.1-i386-20220923.cgz-i386-randconfig-i012-20230627-d9c5a8f98c16-20230628-38227-yqagi1-4.yaml
user=lkp
ARCH=i386
kconfig=i386-randconfig-i012-20230627
commit=d9c5a8f98c16b522847b83bfb9c4f201d31db50d
mem=4G
nmi_watchdog=0
vmalloc=256M initramfs_async=0 page_owner=on
max_uptime=600
LKP_SERVER=internal-lkp-server
selinux=0
debug
apic=debug
sysrq_always_enabled
rcupdate.rcu_cpu_stall_timeout=100
net.ifnames=0
printk.devkmsg=on
panic=-1
softlockup_panic=1
nmi_watchdog=panic
oops=panic
load_ramdisk=2
prompt_ramdisk=0
drbd.minor_count=8
systemd.log_level=err
ignore_loglevel
console=tty0
earlyprintk=ttyS0,115200
console=ttyS0,115200
vga=normal
rw'
	export modules_initrd='/pkg/linux/i386-randconfig-i012-20230627/clang-15/d9c5a8f98c16b522847b83bfb9c4f201d31db50d/modules.cgz'
	export bm_initrd='/osimage/deps/debian-11.1-i386-20220923.cgz/run-ipconfig_20220923.cgz,/osimage/deps/debian-11.1-i386-20220923.cgz/lkp_20220923.cgz,/osimage/deps/debian-11.1-i386-20220923.cgz/rsync-rootfs_20220923.cgz'
	export lkp_initrd='/osimage/user/lkp/lkp-i386.cgz'
	export site='inn'
	export LKP_CGI_PORT=80
	export LKP_CIFS_PORT=139
	export stop_repeat_if_found='dmesg.WARNING:possible_circular_locking_dependency_detected'
	export kbuild_queue_analysis=1
	export kernel='/pkg/linux/i386-randconfig-i012-20230627/clang-15/d9c5a8f98c16b522847b83bfb9c4f201d31db50d/vmlinuz-6.4.0-rc2-00029-gd9c5a8f98c16'
	export result_root='/result/boot/1/vm-snb/debian-11.1-i386-20220923.cgz/i386-randconfig-i012-20230627/clang-15/d9c5a8f98c16b522847b83bfb9c4f201d31db50d/3'
	export meta_host='vm-meta-23'
	export job_initrd='/lkp/jobs/scheduled/vm-meta-23/boot-1-debian-11.1-i386-20220923.cgz-i386-randconfig-i012-20230627-d9c5a8f98c16-20230628-38227-yqagi1-4.cgz'

	[ -n "$LKP_SRC" ] ||
	export LKP_SRC=/lkp/${user:-lkp}/src
}

run_job()
{
	echo $$ > $TMP/run-job.pid

	. $LKP_SRC/lib/http.sh
	. $LKP_SRC/lib/job.sh
	. $LKP_SRC/lib/env.sh

	export_top_env

	run_setup $LKP_SRC/setup/sanity-check

	run_monitor $LKP_SRC/monitors/one-shot/wrapper boot-slabinfo
	run_monitor $LKP_SRC/monitors/one-shot/wrapper boot-meminfo
	run_monitor $LKP_SRC/monitors/one-shot/wrapper memmap
	run_monitor $LKP_SRC/monitors/no-stdout/wrapper boot-time
	run_monitor $LKP_SRC/monitors/wrapper kmsg
	run_monitor $LKP_SRC/monitors/wrapper heartbeat
	run_monitor $LKP_SRC/monitors/wrapper meminfo
	run_monitor $LKP_SRC/monitors/wrapper kmemleak
	run_monitor $LKP_SRC/monitors/wrapper oom-killer
	run_monitor $LKP_SRC/monitors/plain/watchdog

	run_test $LKP_SRC/tests/wrapper sleep 1
}

extract_stats()
{
	export stats_part_begin=
	export stats_part_end=

	$LKP_SRC/stats/wrapper boot-slabinfo
	$LKP_SRC/stats/wrapper boot-meminfo
	$LKP_SRC/stats/wrapper memmap
	$LKP_SRC/stats/wrapper boot-memory
	$LKP_SRC/stats/wrapper boot-time
	$LKP_SRC/stats/wrapper kernel-size
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper sleep
	$LKP_SRC/stats/wrapper meminfo
	$LKP_SRC/stats/wrapper kmemleak

	$LKP_SRC/stats/wrapper time sleep.time
	$LKP_SRC/stats/wrapper dmesg
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper last_state
	$LKP_SRC/stats/wrapper stderr
	$LKP_SRC/stats/wrapper time
}

"$@"

--w4P4cHKAfxD1kdF6
Content-Type: application/x-xz
Content-Disposition: attachment; filename="dmesg.xz"
Content-Transfer-Encoding: base64

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

--w4P4cHKAfxD1kdF6--
