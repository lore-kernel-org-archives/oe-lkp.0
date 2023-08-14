Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B15BA34
	for <oe-lkp@lists.linux.dev>; Mon, 14 Aug 2023 14:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692024422; x=1723560422;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=K6V/ph6K9KnrKl4qaS1Q2NWFuvUw4EZH6TIFkiIkeGA=;
  b=kRudTvdWIpnM+rmA9iVQPTTO75/3WWINC4f6opdMaen6ZkfBgcXMaAqK
   hWjOnqG8lMOrm1OMcQJiypbKMPEPQZwtcHXf0Ou4D1vYs+dVPseXqyiNM
   ZpnG49c5iGYPcxaKt0axa7Y/SxT3HnTJ54BJaZGphKNifqk6vU24Dt2i9
   DM9Y6TchQuei+rtEkqMMwawNYmVHyLiugsAMV+e6+1E65HP6L8IcO9A8R
   ssjMBDrTfPeJ1jGaHekPaNkgwg6wwxsfa9fB6PKOzDt98do3LiIyy0lSb
   j+NIX0pssEgv440tsLH/t3NSZLmEQ/Un3A+xY5zUypM7YAlqM9AmNBGaR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="435940744"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="435940744"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 07:47:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="823468731"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="823468731"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Aug 2023 07:47:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 14 Aug 2023 07:47:00 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 14 Aug 2023 07:47:00 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 14 Aug 2023 07:47:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i7c4aTGBnKHeG9uYjPCmAM6r+pJdEidbw62fTqLKQS/tQ89FnkSTKUMCWLUt3rg5zn6ahF9ryva0luaaO8BqNzsIApt7G29Pok0keyxvZJfBQ2v1J7nh56i2mVgO+HGXahK6QXyU22ILdsL1wsAemId4Gj1G9Z9DWNDdPPiCGp5Lnya5cPUpWMFA3xXL8iRkRCtWu13Wd7GYNxjZU5eb95fz/gutOYEEqDInnN2MjQ7vrvEl67/Kg5zi4eaxHwbqy7UysbfiO4CoO8EqPZZX0Re8yVGqEoul2naVswuMo9re1R346iGoHPHSKnx/pQFrQFwNxPfUpCIWqgCOQ5f5qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g7eswwdcz6WTH/GNbS6rIeSak8Y114pK0xgi3Oxhsh4=;
 b=f5pC+018Cm59uyPJKgQItAxlLpi0pH7HYyb4S048W3CAfYMXhdNzzXsWRO+JY8n5bYO0DCnLGS7f+sjOJ12Ww/AAFajVBSTbAlCCtFvrmwY04KXyqdgd/oxYBQm2ySZPRlcoaWPw88kr9S5wvYGSKPbIeMh/9G1ijbisjaW/QYRqfU3Z8xToxnadFndGoHA6h5U35vIaaS//pBxaUDjCY7qjwbWJNh5CICW0RS4z5ZeWs6UO/5pUBA1hiJKWWgh/aO/O42e9UN3XtRW8rbfeYbUzO1q0TQSjMUpTDT7JzZygxmWYTODDpVParFdCij1sbJ1ee5qs1QbfcIcsivQipQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by CO6PR11MB5601.namprd11.prod.outlook.com (2603:10b6:303:13d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Mon, 14 Aug
 2023 14:46:57 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::73c6:1231:e700:924]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::73c6:1231:e700:924%4]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 14:46:57 +0000
Date: Mon, 14 Aug 2023 22:46:48 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [peterz-queue:mm/core] [mm,nodemask]  d3d7b62dba:
 stress-ng.numa.ops_per_sec 947.1% improvement
Message-ID: <202308142207.d8e491a3-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR06CA0003.apcprd06.prod.outlook.com
 (2603:1096:4:186::14) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|CO6PR11MB5601:EE_
X-MS-Office365-Filtering-Correlation-Id: 993cd9f7-8637-4a4d-1147-08db9cd54ec9
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3AVGDXmPmzH01/efUW8WzfiSJ8kUUOrSSjZEzO2Kn4+zpn4EbMhbLqmtsyLJ8WXjuK73hWgvBD0H3yOb6jfmA+OTE42rtKP/W9oSbKMY0WCIAlGpE25lmEtWHq95GU+N0nhO8VOG8+ZbibyaDRGarjtoJx0JeQ/j1YQ9I6Ij5lVDstQnRXNm1oGlMWig4gViPMsIeeuBgQVQL5tda9SYf/W2IaJpGbLPfhhAh9mK4oe/5g0JKoysImk+jAbPGRfoOBlQuaeKgDp8DBNB7gb+Ua8FnXVVsD9FsgPCbQIXaBSOmFigSV7lTkvEXtxKOOJkQr33WcwsVZV6hCtK65Si4BzFlYIiJRXv/H0DVGnygX4vR/bl41NDmfniVGdffahUt0HPyVbxMwRYWfMB+cLpOZA9wsN4+wHb0JEH9lMWpmCLzuvKuC6Crbcnv8wa8KQ8/DEcDC0G06H7ludPaedp8EXb2SfNEu3LOH2BN1tr8orpy5fkWcrrAeDG5uP6r/O5/M2fZ4wggMK5oaXClaQCijrIMJsJCMCAh6MlbB2b8HD+Go38cwBq439GAkh0uLC/hNBHL4g/drXhYUbUOSiL+g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(366004)(346002)(376002)(39860400002)(451199021)(186006)(1800799006)(38100700002)(6486002)(6666004)(478600001)(82960400001)(5660300002)(2906002)(36756003)(30864003)(86362001)(6916009)(4326008)(66476007)(66556008)(66946007)(41300700001)(8936002)(8676002)(316002)(107886003)(83380400001)(2616005)(26005)(6506007)(1076003)(966005)(6512007)(579004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?9VMCWJtK0aKo87v25XiF6/VMWKRUaRQnjNKJkr/C4OYfxk9R8RqMKvCC4j?=
 =?iso-8859-1?Q?ipNl/fh3hEOYWCbzlH0pQ4Kv5gaShHmYeM0CmOhMQAJe+4JV7hOTIrZ1n/?=
 =?iso-8859-1?Q?KToj/JBfDXa8mlLbe5djWY2ocf4XayShW5VKquJXJGXR5eP4/awf0USEDW?=
 =?iso-8859-1?Q?djTasRotBbEFT0emEpXirbdTvWekd/vIdismFIyjBBl48oAzmXueWIHg+9?=
 =?iso-8859-1?Q?0E5u+3ubr2JL2m9sFTVVyCjLBVplOH/1c8O/TgQwbpa0OGulZNvzLtNR4n?=
 =?iso-8859-1?Q?bDXfdptG2FZqCZCAeKUiMrgoB4/t9wH8O1pGCRshv5hoj1HFRut0MjfZFJ?=
 =?iso-8859-1?Q?HxyAOsnerP/4aiRScjvZRN+sxjdnTd+T0EjydWV8ocAj0RYBWrcrX7bK4Y?=
 =?iso-8859-1?Q?p0StEsSkeTAdtNVXKooNNVFdoD1FI57SObLhmOrhiMmym+J9u5a/yWooYD?=
 =?iso-8859-1?Q?SIuwe9LnXn/HKLuqEvkN19S8jmqGvHIxD2Ym3OmcLnCKHsVc33hx7l0lYc?=
 =?iso-8859-1?Q?2lfjAQslBaRpTbGEtRpJUpDKS6wTt5oVHP3nbIwzCqwxEnOK2AMSlA3tUg?=
 =?iso-8859-1?Q?ghjayJxX1R/n/zK/eYvSCorve206fJTZ6hjM6nzj2++TyXnyZA2sdJV5n5?=
 =?iso-8859-1?Q?5BYqekH7G9R8EGz2B3yguDL235VQ1IIiXLR4hEXutmfBmc9cfkYLrQQhAo?=
 =?iso-8859-1?Q?lqD4NuF39xUo9vPFd05rnofmTuIecektonDu5AYgVWihh+Ed90bO6XAUvA?=
 =?iso-8859-1?Q?3ZgwbTm9lh5i3PnBFb634mZte2tHhZTRLCv6TLzjVD5DI7lnZ1RcZiIJFL?=
 =?iso-8859-1?Q?DDCNLXzZ6275F3WSN5d2V6jvkyAyhLlssPamc6jTzNNjAOHjAgCBLkNrS/?=
 =?iso-8859-1?Q?VNb7y1sKtbTFfMJNKC1v1V/4GaGuHJjk45spJoZsSxb0MMoUCjheOdRRq4?=
 =?iso-8859-1?Q?yAbFySIUFgof/tv4rK05DRhqa4qezyh6lISNzAQXQrqZgo7A9ULELgZ4pp?=
 =?iso-8859-1?Q?fk6YwDG7GUT0DRTM06+E8WftWnPgclfTc2SCOcNND6QC1hxE4DUTb69RqV?=
 =?iso-8859-1?Q?G0m0Cn1yr8x3EZft+Zh/Hb7j4Bbq08UX1o2NsyDkagbbPt784oUCL1F2qH?=
 =?iso-8859-1?Q?ynBdtbnqHfcP0BDP9VdoCf/1cZRrp1tTgq+BSrQsXKPcV68AAzXJb6fsA7?=
 =?iso-8859-1?Q?n67dc4w1v63sGEGcunfWJseAj5ESvEYHuytiYy7Xw/SYzJsEeonbdlQhrm?=
 =?iso-8859-1?Q?vM4cFqnMKyWTpyZNwHj/eJA2Z3UspUTFb5ED/F7E+SoZPL+HC0OcxKlza9?=
 =?iso-8859-1?Q?VG8keHe6Z+xv2cfPUAqH1EjXggwvFh6xxH1WGKooqgvMGDj3SJrLcnN2/N?=
 =?iso-8859-1?Q?E4bhXRaLDzvfxC87MOrGdMRNVPVR3mAYC9qOFxgmf6R69oopqrnLrDEIuA?=
 =?iso-8859-1?Q?sAUc0iaEFAcp9kxXljqur9ViRg5kb5/9Yq/BugFRGAlYdS+edcj6G/5E1j?=
 =?iso-8859-1?Q?oL0P5JOXmlkb+vEU/aNuAh72m3fq0ac8rM0d8u0kDV51mjh4ZYZjqJyUOe?=
 =?iso-8859-1?Q?pI51L05hVuFMdz3nOY8OXOkN/H64dO2APizqQSAqzWOn+uEWK5d9YThpNH?=
 =?iso-8859-1?Q?vxT9xOIz9VpNiuA0gA6iVPSTALZgWN2QkWss0V3Kv8tzDYzptJHtmLbw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 993cd9f7-8637-4a4d-1147-08db9cd54ec9
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 14:46:57.0399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zkZUwmaheoHJP6E/PVvSKrS4S+4yPuwddmxcpOFJA/ytDp8U7+5GTHkKjgZ5ksQW8AJ+gctoxlTCL2uwkkjyNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5601
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 947.1% improvement of stress-ng.numa.ops_per_sec on:


commit: d3d7b62dba4561ac3793608a1c8a7867f9265bb7 ("mm,nodemask: Use nr_node_ids")
https://git.kernel.org/cgit/linux/kernel/git/peterz/queue.git mm/core

testcase: stress-ng
test machine: 36 threads 1 sockets Intel(R) Core(TM) i9-10980XE CPU @ 3.00GHz (Cascade Lake) with 128G memory
parameters:

	nr_threads: 1
	testtime: 60s
	class: cpu
	test: numa
	cpufreq_governor: performance






Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20230814/202308142207.d8e491a3-oliver.sang@intel.com

=========================================================================================
class/compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  cpu/gcc-12/performance/x86_64-rhel-8.3/1/debian-11.1-x86_64-20220510.cgz/lkp-csl-d02/numa/stress-ng/60s

commit: 
  0caebc9db8 ("smp: Mark nr_cpu_ids __ro_after_init")
  d3d7b62dba ("mm,nodemask: Use nr_node_ids")

0caebc9db82972fc d3d7b62dba4561ac3793608a1c8 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     39.50 ±  8%    +103.8%      80.50 ± 14%  perf-c2c.HITM.local
      2.50            -1.3        1.21 ±  2%  mpstat.cpu.all.sys%
      0.69 ±  3%      +1.3        1.97 ±  3%  mpstat.cpu.all.usr%
      0.00 ±  8%     +62.8%       0.00 ± 34%  sched_debug.cpu.next_balance.stddev
    305.17 ± 28%     +63.6%     499.33 ± 19%  sched_debug.cpu.nr_switches.min
     31465           +49.5%      47036        vmstat.system.cs
     50364            +2.3%      51504        vmstat.system.in
     58756           +61.7%      95037        meminfo.Active
     58656           +61.8%      94929        meminfo.Active(anon)
     65657           +59.6%     104788        meminfo.Shmem
      7484 ±  5%     +34.5%      10068        turbostat.C1
      0.60 ±  2%     -55.4%       0.27        turbostat.IPC
     12057 ±  4%     +81.1%      21835 ± 16%  turbostat.POLL
      1153          +946.8%      12072        stress-ng.numa.ops
     19.22          +947.1%     201.21        stress-ng.numa.ops_per_sec
     25642          +937.2%     265974        stress-ng.time.involuntary_context_switches
     95.00            -1.1%      94.00        stress-ng.time.percent_of_cpu_this_job_got
     56.07           -55.4%      24.99        stress-ng.time.system_time
      3.37          +891.2%      33.40        stress-ng.time.user_time
      2869 ± 17%    +810.0%      26113 ± 23%  stress-ng.time.voluntary_context_switches
     14663           +61.8%      23732        proc-vmstat.nr_active_anon
    702154            +1.4%     711931        proc-vmstat.nr_file_pages
     10198            +4.6%      10668        proc-vmstat.nr_mapped
     16414           +59.6%      26198        proc-vmstat.nr_shmem
     14663           +61.8%      23732        proc-vmstat.nr_zone_active_anon
    253201            +5.2%     266484        proc-vmstat.numa_hit
    254037            +4.9%     266484        proc-vmstat.numa_local
     24353           +51.0%      36764        proc-vmstat.pgactivate
    284562            +4.8%     298298        proc-vmstat.pgalloc_normal
    210082            +1.9%     214111        proc-vmstat.pgfault
      0.00           +50.0%       0.00        perf-sched.sch_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      0.00 ± 70%    +571.4%       0.03 ± 86%  perf-sched.sch_delay.max.ms.__cond_resched.synchronize_rcu_expedited.lru_cache_disable.do_pages_move.kernel_move_pages
      4.74           -46.2%       2.55 ±  4%  perf-sched.total_wait_and_delay.average.ms
     87312           +87.6%     163836        perf-sched.total_wait_and_delay.count.ms
      4.74           -46.2%       2.55 ±  4%  perf-sched.total_wait_time.average.ms
    285.65 ±  2%     -36.6%     180.97 ±  2%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      3.84 ± 20%     -84.2%       0.61 ± 11%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.__wait_for_common.__flush_work.isra.0
     24.77 ±  7%    +283.8%      95.07 ±  7%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    592.44 ±  8%     -24.2%     449.18 ±  6%  perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     21.82 ±  5%     -88.3%       2.56 ±  7%  perf-sched.wait_and_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      1.83 ± 73%    +609.1%      13.00 ± 27%  perf-sched.wait_and_delay.count.__cond_resched.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
      1.33 ±119%    +387.5%       6.50 ± 19%  perf-sched.wait_and_delay.count.__cond_resched.mutex_lock.perf_poll.do_poll.constprop
      2015          +889.9%      19948        perf-sched.wait_and_delay.count.__cond_resched.synchronize_rcu_expedited.lru_cache_disable.do_pages_move.kernel_move_pages
      1.50 ± 50%    +900.0%      15.00 ± 29%  perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
     55.50           +45.9%      81.00        perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      2121          +889.9%      20998        perf-sched.wait_and_delay.count.schedule_timeout.__wait_for_common.__flush_work.isra.0
    194.83 ±  5%     -74.3%      50.00 ±  5%  perf-sched.wait_and_delay.count.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    337.50 ±  6%     +21.9%     411.33 ±  8%  perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      4424          +851.6%      42105        perf-sched.wait_and_delay.count.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.04 ± 19%   +1191.7%       0.47 ± 47%  perf-sched.wait_and_delay.max.ms.__cond_resched.synchronize_rcu_expedited.lru_cache_disable.do_pages_move.kernel_move_pages
    862.83           +10.2%     950.84        perf-sched.wait_and_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      0.01 ± 10%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.queue_folios_pte_range.walk_pmd_range.isra.0
    285.65 ±  2%     -36.6%     180.96 ±  2%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      3.84 ± 20%     -84.3%       0.60 ± 11%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.__flush_work.isra.0
     24.77 ±  7%    +283.8%      95.06 ±  7%  perf-sched.wait_time.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    592.43 ±  8%     -24.2%     449.18 ±  6%  perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     21.82 ±  5%     -88.3%       2.56 ±  7%  perf-sched.wait_time.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.03 ± 39%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.queue_folios_pte_range.walk_pmd_range.isra.0
      0.02 ± 25%    +828.9%       0.20 ±121%  perf-sched.wait_time.max.ms.__cond_resched.synchronize_rcu_expedited.lru_cache_disable.do_migrate_pages.kernel_migrate_pages
      0.04 ± 17%   +1228.9%       0.47 ± 47%  perf-sched.wait_time.max.ms.__cond_resched.synchronize_rcu_expedited.lru_cache_disable.do_pages_move.kernel_move_pages
      0.62 ±  3%     +18.3%       0.73 ± 12%  perf-sched.wait_time.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
    263.93 ±148%    +216.3%     834.72 ± 44%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
    862.83           +10.2%     950.83        perf-sched.wait_time.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
 2.252e+09           -61.0%  8.784e+08 ±  3%  perf-stat.i.branch-instructions
  17929430 ±  3%     -35.8%   11514921 ± 10%  perf-stat.i.branch-misses
      7.79 ±  2%      -2.3        5.50 ±  2%  perf-stat.i.cache-miss-rate%
    653704 ±  3%      +9.8%     717987        perf-stat.i.cache-misses
   3936557 ±  5%     +73.8%    6843521 ±  3%  perf-stat.i.cache-references
     32915           +49.0%      49059        perf-stat.i.context-switches
      0.51 ± 15%    +160.0%       1.33 ±  5%  perf-stat.i.cpi
     57.17           +44.3%      82.47 ±  3%  perf-stat.i.cpu-migrations
 1.928e+09           -54.1%  8.851e+08 ±  3%  perf-stat.i.dTLB-loads
      0.00 ±102%      +0.0        0.01 ± 31%  perf-stat.i.dTLB-store-miss-rate%
      9715 ± 12%    +230.5%      32110 ± 17%  perf-stat.i.dTLB-store-misses
 6.774e+08           -29.9%  4.751e+08 ±  2%  perf-stat.i.dTLB-stores
     53.97            +3.8       57.76        perf-stat.i.iTLB-load-miss-rate%
    637665           +13.0%     720729        perf-stat.i.iTLB-load-misses
   1.1e+10           -60.7%  4.328e+09 ±  3%  perf-stat.i.instructions
     18980           -67.1%       6253 ±  2%  perf-stat.i.instructions-per-iTLB-miss
      2.12           -62.8%       0.79        perf-stat.i.ipc
    128.16 ±  8%     +64.4%     210.75 ±  3%  perf-stat.i.metric.K/sec
    134.92           -53.9%      62.16 ±  3%  perf-stat.i.metric.M/sec
      1818            +4.1%       1893        perf-stat.i.minor-faults
     26967 ±  5%     +44.5%      38965 ±  7%  perf-stat.i.node-stores
      1818            +4.1%       1893        perf-stat.i.page-faults
      0.36 ±  6%    +341.8%       1.58 ±  3%  perf-stat.overall.MPKI
      0.80 ±  2%      +0.5        1.31 ±  7%  perf-stat.overall.branch-miss-rate%
     16.62 ±  2%      -6.1       10.50 ±  3%  perf-stat.overall.cache-miss-rate%
      0.48          +155.3%       1.22        perf-stat.overall.cpi
      8085 ±  4%      -8.7%       7379        perf-stat.overall.cycles-between-cache-misses
      0.00 ± 11%      +0.0        0.01 ± 11%  perf-stat.overall.dTLB-load-miss-rate%
      0.00 ± 13%      +0.0        0.01 ± 18%  perf-stat.overall.dTLB-store-miss-rate%
     55.00            +3.6       58.57        perf-stat.overall.iTLB-load-miss-rate%
     17251           -65.2%       6003 ±  2%  perf-stat.overall.instructions-per-iTLB-miss
      2.08           -60.8%       0.82        perf-stat.overall.ipc
 2.217e+09           -61.0%  8.647e+08 ±  3%  perf-stat.ps.branch-instructions
  17650964 ±  3%     -35.8%   11338578 ± 10%  perf-stat.ps.branch-misses
    643397 ±  3%      +9.9%     706918        perf-stat.ps.cache-misses
   3875552 ±  5%     +73.8%    6737066 ±  3%  perf-stat.ps.cache-references
     32395           +49.1%      48287        perf-stat.ps.context-switches
     56.26           +44.3%      81.18 ±  3%  perf-stat.ps.cpu-migrations
 1.898e+09           -54.1%  8.713e+08 ±  3%  perf-stat.ps.dTLB-loads
      9563 ± 12%    +230.5%      31607 ± 17%  perf-stat.ps.dTLB-store-misses
 6.667e+08           -29.9%  4.677e+08 ±  2%  perf-stat.ps.dTLB-stores
    627609           +13.0%     709441        perf-stat.ps.iTLB-load-misses
 1.083e+10           -60.7%   4.26e+09 ±  3%  perf-stat.ps.instructions
      1789            +4.1%       1863        perf-stat.ps.minor-faults
     26546 ±  5%     +44.5%      38368 ±  7%  perf-stat.ps.node-stores
      1790            +4.1%       1863        perf-stat.ps.page-faults
 6.885e+11           -60.5%  2.722e+11 ±  2%  perf-stat.total.instructions
     61.35 ±  4%     -61.3        0.00        perf-profile.calltrace.cycles-pp.__x64_sys_migrate_pages.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall.stress_run
     61.35 ±  4%     -61.3        0.00        perf-profile.calltrace.cycles-pp.kernel_migrate_pages.__x64_sys_migrate_pages.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
     61.16 ±  4%     -61.2        0.00        perf-profile.calltrace.cycles-pp.do_migrate_pages.kernel_migrate_pages.__x64_sys_migrate_pages.do_syscall_64.entry_SYSCALL_64_after_hwframe
     31.66 ±  5%     -31.7        0.00        perf-profile.calltrace.cycles-pp.migrate_to_node.do_migrate_pages.kernel_migrate_pages.__x64_sys_migrate_pages.do_syscall_64
     31.54 ±  5%     -31.5        0.00        perf-profile.calltrace.cycles-pp.walk_page_range.migrate_to_node.do_migrate_pages.kernel_migrate_pages.__x64_sys_migrate_pages
     63.08 ±  4%     -29.2       33.90 ±  4%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall.stress_run
     63.08 ±  4%     -29.2       33.92 ±  4%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.syscall.stress_run
     63.09 ±  4%     -28.8       34.25 ±  4%  perf-profile.calltrace.cycles-pp.syscall.stress_run
     63.12 ±  4%     -27.2       35.94 ±  5%  perf-profile.calltrace.cycles-pp.stress_run
     20.68 ±  6%     -20.7        0.00        perf-profile.calltrace.cycles-pp.__walk_page_range.walk_page_range.migrate_to_node.do_migrate_pages.kernel_migrate_pages
     20.27 ±  6%     -20.3        0.00        perf-profile.calltrace.cycles-pp.walk_pgd_range.__walk_page_range.walk_page_range.migrate_to_node.do_migrate_pages
     19.52 ±  6%     -19.5        0.00        perf-profile.calltrace.cycles-pp.walk_p4d_range.walk_pgd_range.__walk_page_range.walk_page_range.migrate_to_node
     18.89 ±  6%     -18.9        0.00        perf-profile.calltrace.cycles-pp.walk_pud_range.walk_p4d_range.walk_pgd_range.__walk_page_range.walk_page_range
     18.24 ±  6%     -18.2        0.00        perf-profile.calltrace.cycles-pp.walk_pmd_range.walk_pud_range.walk_p4d_range.walk_pgd_range.__walk_page_range
     17.07 ±  6%     -17.1        0.00        perf-profile.calltrace.cycles-pp.queue_folios_pte_range.walk_pmd_range.walk_pud_range.walk_p4d_range.walk_pgd_range
     15.73 ±  4%     -15.7        0.00        perf-profile.calltrace.cycles-pp.bitmap_bitremap.do_migrate_pages.kernel_migrate_pages.__x64_sys_migrate_pages.do_syscall_64
     10.48 ±  5%     -10.5        0.00        perf-profile.calltrace.cycles-pp.__bitmap_weight.do_migrate_pages.kernel_migrate_pages.__x64_sys_migrate_pages.do_syscall_64
      8.26 ±  4%      -8.3        0.00        perf-profile.calltrace.cycles-pp.__bitmap_weight.bitmap_bitremap.do_migrate_pages.kernel_migrate_pages.__x64_sys_migrate_pages
      5.52 ±  3%      -5.5        0.00        perf-profile.calltrace.cycles-pp.queue_pages_test_walk.walk_page_range.migrate_to_node.do_migrate_pages.kernel_migrate_pages
      0.00            +0.6        0.65 ± 13%  perf-profile.calltrace.cycles-pp.newidle_balance.pick_next_task_fair.__schedule.schedule.do_nanosleep
      0.00            +0.7        0.66 ± 12%  perf-profile.calltrace.cycles-pp.pick_next_task_fair.__schedule.schedule.do_nanosleep.hrtimer_nanosleep
      1.96 ± 18%      +0.8        2.71 ± 12%  perf-profile.calltrace.cycles-pp.update_process_times.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt
      2.00 ± 18%      +0.8        2.76 ± 12%  perf-profile.calltrace.cycles-pp.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt
      2.22 ± 20%      +0.9        3.08 ± 12%  perf-profile.calltrace.cycles-pp.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      0.00            +0.9        0.91 ±  9%  perf-profile.calltrace.cycles-pp._raw_spin_lock.__pte_offset_map_lock.follow_page_pte.follow_page.add_page_for_migration
      0.62 ± 14%      +0.9        1.55 ± 15%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
      0.00            +0.9        0.93 ± 18%  perf-profile.calltrace.cycles-pp.follow_p4d_mask.follow_page.add_page_for_migration.do_pages_move.kernel_move_pages
      0.65 ± 13%      +0.9        1.58 ± 16%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.clock_nanosleep
      0.00            +0.9        0.94 ± 10%  perf-profile.calltrace.cycles-pp.move_pages_and_store_status.do_pages_move.kernel_move_pages.__x64_sys_move_pages.do_syscall_64
      0.51 ± 46%      +1.0        1.49 ± 16%  perf-profile.calltrace.cycles-pp.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
      0.79 ± 14%      +1.0        1.79 ± 16%  perf-profile.calltrace.cycles-pp.clock_nanosleep
      0.09 ±223%      +1.0        1.10 ± 15%  perf-profile.calltrace.cycles-pp.schedule.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.00            +1.1        1.08 ± 15%  perf-profile.calltrace.cycles-pp.__schedule.schedule.do_nanosleep.hrtimer_nanosleep.common_nsleep
      0.30 ±101%      +1.1        1.41 ± 15%  perf-profile.calltrace.cycles-pp.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.30 ±101%      +1.1        1.42 ± 15%  perf-profile.calltrace.cycles-pp.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
      3.02 ± 13%      +1.1        4.14 ± 12%  perf-profile.calltrace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      0.00            +1.2        1.16 ± 11%  perf-profile.calltrace.cycles-pp.try_grab_page.follow_page_pte.follow_page.add_page_for_migration.do_pages_move
      0.20 ±142%      +1.2        1.37 ± 15%  perf-profile.calltrace.cycles-pp.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_64
      0.00            +1.3        1.34 ± 21%  perf-profile.calltrace.cycles-pp.follow_trans_huge_pmd.follow_pmd_mask.follow_page.add_page_for_migration.do_pages_move
      3.76 ± 12%      +1.5        5.24 ± 13%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
      3.80 ± 12%      +1.5        5.28 ± 13%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
      0.00            +1.8        1.77 ± 14%  perf-profile.calltrace.cycles-pp.up_read.add_page_for_migration.do_pages_move.kernel_move_pages.__x64_sys_move_pages
      4.92 ± 13%      +1.9        6.86 ± 15%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      0.00            +2.0        1.98 ± 15%  perf-profile.calltrace.cycles-pp.__pte_offset_map_lock.follow_page_pte.follow_page.add_page_for_migration.do_pages_move
      0.00            +2.2        2.20 ± 10%  perf-profile.calltrace.cycles-pp.__put_user_4.do_pages_move.kernel_move_pages.__x64_sys_move_pages.do_syscall_64
      0.00            +2.2        2.22 ± 10%  perf-profile.calltrace.cycles-pp.__get_user_4.do_pages_move.kernel_move_pages.__x64_sys_move_pages.do_syscall_64
      0.00            +2.3        2.26 ±  7%  perf-profile.calltrace.cycles-pp.down_read.add_page_for_migration.do_pages_move.kernel_move_pages.__x64_sys_move_pages
      5.55 ± 13%      +2.3        7.89 ± 16%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      0.00            +2.5        2.46 ±  9%  perf-profile.calltrace.cycles-pp.__get_user_8.do_pages_move.kernel_move_pages.__x64_sys_move_pages.do_syscall_64
      0.00            +2.9        2.92 ± 37%  perf-profile.calltrace.cycles-pp.process_one_work.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.00            +3.2        3.16 ± 16%  perf-profile.calltrace.cycles-pp.follow_pmd_mask.follow_page.add_page_for_migration.do_pages_move.kernel_move_pages
      0.00            +3.8        3.79 ± 38%  perf-profile.calltrace.cycles-pp.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.00            +3.9        3.88 ± 38%  perf-profile.calltrace.cycles-pp.ret_from_fork_asm
      0.00            +3.9        3.88 ± 38%  perf-profile.calltrace.cycles-pp.ret_from_fork.ret_from_fork_asm
      0.00            +3.9        3.88 ± 38%  perf-profile.calltrace.cycles-pp.kthread.ret_from_fork.ret_from_fork_asm
      0.00            +4.2        4.17 ±  9%  perf-profile.calltrace.cycles-pp.follow_page_pte.follow_page.add_page_for_migration.do_pages_move.kernel_move_pages
      0.00            +4.2        4.23 ±  7%  perf-profile.calltrace.cycles-pp.mtree_load.add_page_for_migration.do_pages_move.kernel_move_pages.__x64_sys_move_pages
      0.32 ±100%      +9.4        9.73 ±  5%  perf-profile.calltrace.cycles-pp.follow_page.add_page_for_migration.do_pages_move.kernel_move_pages.__x64_sys_move_pages
     27.45 ±  9%     +19.0       46.40 ±  6%  perf-profile.calltrace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      1.12 ± 22%     +19.6       20.70 ±  5%  perf-profile.calltrace.cycles-pp.add_page_for_migration.do_pages_move.kernel_move_pages.__x64_sys_move_pages.do_syscall_64
     30.31 ±  6%     +20.3       50.60 ±  7%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
     31.16 ±  6%     +20.5       51.68 ±  7%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     31.47 ±  6%     +20.7       52.17 ±  7%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     31.44 ±  6%     +20.7       52.14 ±  7%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     31.47 ±  6%     +20.7       52.17 ±  7%  perf-profile.calltrace.cycles-pp.start_secondary.secondary_startup_64_no_verify
     33.46 ±  7%     +21.3       54.75 ±  5%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
     35.38 ±  7%     +21.8       57.18 ±  5%  perf-profile.calltrace.cycles-pp.secondary_startup_64_no_verify
      1.71 ± 20%     +31.5       33.18 ±  4%  perf-profile.calltrace.cycles-pp.do_pages_move.kernel_move_pages.__x64_sys_move_pages.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.73 ± 20%     +32.0       33.76 ±  4%  perf-profile.calltrace.cycles-pp.kernel_move_pages.__x64_sys_move_pages.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      1.73 ± 20%     +32.0       33.76 ±  4%  perf-profile.calltrace.cycles-pp.__x64_sys_move_pages.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall.stress_run
     61.35 ±  4%     -61.3        0.00        perf-profile.children.cycles-pp.__x64_sys_migrate_pages
     61.35 ±  4%     -61.3        0.00        perf-profile.children.cycles-pp.kernel_migrate_pages
     61.35 ±  4%     -61.3        0.00        perf-profile.children.cycles-pp.do_migrate_pages
     31.66 ±  5%     -31.7        0.00        perf-profile.children.cycles-pp.migrate_to_node
     31.57 ±  5%     -31.5        0.08 ± 47%  perf-profile.children.cycles-pp.walk_page_range
     63.09 ±  4%     -28.8       34.26 ±  4%  perf-profile.children.cycles-pp.syscall
     64.04 ±  4%     -28.1       35.93 ±  4%  perf-profile.children.cycles-pp.do_syscall_64
     64.06 ±  4%     -28.1       35.98 ±  4%  perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     63.12 ±  4%     -27.2       35.94 ±  5%  perf-profile.children.cycles-pp.stress_run
     20.73 ±  6%     -20.7        0.07 ± 48%  perf-profile.children.cycles-pp.__walk_page_range
     20.30 ±  6%     -20.2        0.07 ± 48%  perf-profile.children.cycles-pp.walk_pgd_range
     19.54 ±  6%     -19.5        0.07 ± 48%  perf-profile.children.cycles-pp.walk_p4d_range
     19.36 ±  4%     -19.4        0.00        perf-profile.children.cycles-pp.__bitmap_weight
     18.94 ±  6%     -18.9        0.07 ± 48%  perf-profile.children.cycles-pp.walk_pud_range
     18.25 ±  6%     -18.2        0.07 ± 50%  perf-profile.children.cycles-pp.walk_pmd_range
     17.25 ±  6%     -17.2        0.06 ± 48%  perf-profile.children.cycles-pp.queue_folios_pte_range
     15.90 ±  4%     -15.9        0.00        perf-profile.children.cycles-pp.bitmap_bitremap
      8.52 ±  4%      -8.5        0.00        perf-profile.children.cycles-pp.find_vma
      8.16 ±  4%      -8.2        0.00        perf-profile.children.cycles-pp.mt_find
      6.31 ±  4%      -6.3        0.00        perf-profile.children.cycles-pp.mtree_range_walk
      5.58 ±  3%      -5.6        0.00        perf-profile.children.cycles-pp.queue_pages_test_walk
      1.90 ±  4%      -1.7        0.22 ± 33%  perf-profile.children.cycles-pp.vm_normal_page
      1.20 ±  7%      -1.0        0.18 ± 31%  perf-profile.children.cycles-pp.vma_migratable
      1.00 ±  5%      -0.9        0.05 ± 76%  perf-profile.children.cycles-pp._find_next_bit
      0.05 ± 76%      +0.0        0.10 ± 18%  perf-profile.children.cycles-pp.__libc_start_main
      0.05 ± 76%      +0.0        0.10 ± 18%  perf-profile.children.cycles-pp.main
      0.05 ± 76%      +0.0        0.10 ± 18%  perf-profile.children.cycles-pp.run_builtin
      0.09 ± 10%      +0.1        0.14 ± 17%  perf-profile.children.cycles-pp.get_next_timer_interrupt
      0.02 ±142%      +0.1        0.08 ± 20%  perf-profile.children.cycles-pp.cmd_stat
      0.02 ±142%      +0.1        0.08 ± 20%  perf-profile.children.cycles-pp.dispatch_events
      0.02 ±142%      +0.1        0.08 ± 20%  perf-profile.children.cycles-pp.process_interval
      0.00            +0.1        0.07 ± 35%  perf-profile.children.cycles-pp.rcu_note_context_switch
      0.00            +0.1        0.08 ± 27%  perf-profile.children.cycles-pp.trigger_load_balance
      0.12 ± 17%      +0.1        0.20 ± 21%  perf-profile.children.cycles-pp.update_irq_load_avg
      0.00            +0.1        0.09 ± 28%  perf-profile.children.cycles-pp.os_xsave
      0.12 ± 17%      +0.1        0.23 ± 35%  perf-profile.children.cycles-pp.hrtimer_start_range_ns
      0.01 ±223%      +0.1        0.11 ± 36%  perf-profile.children.cycles-pp.__wrgsbase_inactive
      0.20 ± 11%      +0.1        0.31 ± 26%  perf-profile.children.cycles-pp.schedule_idle
      0.00            +0.1        0.13 ± 53%  perf-profile.children.cycles-pp.__wake_up_common_lock
      0.14 ± 18%      +0.1        0.27 ± 17%  perf-profile.children.cycles-pp.update_rq_clock_task
      0.10 ± 16%      +0.1        0.24 ±  9%  perf-profile.children.cycles-pp.rcu_all_qs
      0.24 ± 18%      +0.1        0.38 ± 10%  perf-profile.children.cycles-pp.native_sched_clock
      0.06 ± 63%      +0.1        0.21 ± 14%  perf-profile.children.cycles-pp._raw_spin_lock_irq
      0.00            +0.1        0.14 ± 23%  perf-profile.children.cycles-pp.cpu_util
      0.10 ± 21%      +0.1        0.25 ± 22%  perf-profile.children.cycles-pp.update_rq_clock
      0.38 ± 15%      +0.1        0.52 ± 18%  perf-profile.children.cycles-pp.lapic_next_deadline
      0.07 ± 50%      +0.1        0.22 ± 25%  perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
      0.21 ± 22%      +0.2        0.36 ± 12%  perf-profile.children.cycles-pp.sched_clock
      0.10 ± 29%      +0.2        0.26 ± 20%  perf-profile.children.cycles-pp.rcu_sched_clock_irq
      0.07 ± 50%      +0.2        0.22 ± 21%  perf-profile.children.cycles-pp.rcu_pending
      0.02 ±141%      +0.2        0.18 ± 30%  perf-profile.children.cycles-pp.__update_load_avg_se
      0.23 ± 21%      +0.2        0.41 ± 13%  perf-profile.children.cycles-pp.sched_clock_cpu
      0.24 ± 18%      +0.2        0.42 ± 18%  perf-profile.children.cycles-pp.hrtimer_wakeup
      0.04 ±105%      +0.2        0.23 ± 27%  perf-profile.children.cycles-pp.ct_kernel_enter
      0.04 ± 79%      +0.2        0.24 ± 21%  perf-profile.children.cycles-pp.ct_kernel_exit_state
      0.04 ±107%      +0.2        0.23 ± 26%  perf-profile.children.cycles-pp.set_next_entity
      0.02 ±141%      +0.2        0.22 ± 36%  perf-profile.children.cycles-pp.___perf_sw_event
      0.04 ±108%      +0.2        0.24 ± 26%  perf-profile.children.cycles-pp.ct_idle_exit
      0.06 ± 45%      +0.2        0.27 ± 33%  perf-profile.children.cycles-pp.__switch_to
      0.00            +0.2        0.22 ± 43%  perf-profile.children.cycles-pp.complete
      0.00            +0.2        0.23 ± 47%  perf-profile.children.cycles-pp.find_mm_struct
      0.00            +0.2        0.25 ± 89%  perf-profile.children.cycles-pp.vma_is_secretmem
      0.12 ± 26%      +0.3        0.38 ± 23%  perf-profile.children.cycles-pp.dequeue_entity
      0.03 ±102%      +0.3        0.28 ± 43%  perf-profile.children.cycles-pp.update_curr
      0.03 ±100%      +0.3        0.29 ± 39%  perf-profile.children.cycles-pp.prepare_task_switch
      0.00            +0.3        0.27 ± 43%  perf-profile.children.cycles-pp.wq_worker_sleeping
      0.07 ± 33%      +0.3        0.36 ± 34%  perf-profile.children.cycles-pp.__switch_to_asm
      0.24 ± 43%      +0.3        0.53 ± 64%  perf-profile.children.cycles-pp.irq_enter_rcu
      0.22 ± 47%      +0.3        0.52 ± 64%  perf-profile.children.cycles-pp.tick_irq_enter
      0.14 ± 25%      +0.3        0.45 ± 24%  perf-profile.children.cycles-pp.dequeue_task_fair
      0.13 ± 16%      +0.4        0.48 ± 26%  perf-profile.children.cycles-pp.update_load_avg
      0.00            +0.4        0.36 ± 33%  perf-profile.children.cycles-pp.rcu_exp_wait_wake
      0.00            +0.4        0.37 ± 41%  perf-profile.children.cycles-pp.rcu_report_exp_cpu_mult
      0.12 ± 13%      +0.4        0.52 ± 25%  perf-profile.children.cycles-pp.enqueue_entity
      0.24 ± 11%      +0.5        0.76 ± 11%  perf-profile.children.cycles-pp.update_sg_lb_stats
      0.32 ± 11%      +0.6        0.88 ± 11%  perf-profile.children.cycles-pp.update_sd_lb_stats
      0.40 ± 17%      +0.6        0.97 ± 13%  perf-profile.children.cycles-pp.load_balance
      0.33 ± 11%      +0.6        0.90 ± 11%  perf-profile.children.cycles-pp.find_busiest_group
      0.14 ± 21%      +0.6        0.71 ± 25%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      0.14 ± 20%      +0.6        0.72 ± 26%  perf-profile.children.cycles-pp.enqueue_task_fair
      0.02 ±141%      +0.6        0.61 ± 16%  perf-profile.children.cycles-pp.follow_page_mask
      0.15 ± 15%      +0.6        0.75 ± 27%  perf-profile.children.cycles-pp.activate_task
      0.00            +0.6        0.61 ± 43%  perf-profile.children.cycles-pp.__queue_work
      0.08 ±  8%      +0.7        0.73 ±  9%  perf-profile.children.cycles-pp.newidle_balance
      0.00            +0.7        0.66 ± 38%  perf-profile.children.cycles-pp.__wait_for_common
      0.00            +0.7        0.66 ± 37%  perf-profile.children.cycles-pp.schedule_timeout
      0.00            +0.7        0.67 ± 43%  perf-profile.children.cycles-pp.queue_work_on
      0.28 ± 12%      +0.7        0.95 ± 22%  perf-profile.children.cycles-pp.__cond_resched
      0.00            +0.7        0.67 ± 42%  perf-profile.children.cycles-pp.__sync_rcu_exp_select_node_cpus
      2.18 ± 13%      +0.7        2.86 ± 11%  perf-profile.children.cycles-pp.update_process_times
      2.23 ± 13%      +0.7        2.91 ± 11%  perf-profile.children.cycles-pp.tick_sched_handle
      0.17 ± 14%      +0.8        0.92 ± 31%  perf-profile.children.cycles-pp.ttwu_do_activate
      0.00            +0.8        0.76 ± 37%  perf-profile.children.cycles-pp.__flush_work
      2.46 ± 14%      +0.8        3.26 ± 11%  perf-profile.children.cycles-pp.tick_sched_timer
      1.34 ±  9%      +0.9        2.20 ±  7%  perf-profile.children.cycles-pp._raw_spin_lock
      0.50 ± 17%      +0.9        1.38 ± 16%  perf-profile.children.cycles-pp.do_nanosleep
      0.53 ± 17%      +0.9        1.41 ± 15%  perf-profile.children.cycles-pp.hrtimer_nanosleep
      0.54 ± 15%      +0.9        1.43 ± 15%  perf-profile.children.cycles-pp.common_nsleep
      0.05 ± 74%      +0.9        0.94 ± 18%  perf-profile.children.cycles-pp.follow_p4d_mask
      0.59 ± 15%      +0.9        1.49 ± 16%  perf-profile.children.cycles-pp.__x64_sys_clock_nanosleep
      0.03 ±108%      +1.0        1.01 ± 10%  perf-profile.children.cycles-pp.move_pages_and_store_status
      0.80 ± 14%      +1.0        1.80 ± 15%  perf-profile.children.cycles-pp.clock_nanosleep
      0.15 ± 17%      +1.1        1.25 ± 11%  perf-profile.children.cycles-pp.pick_next_task_fair
      0.00            +1.1        1.10 ± 41%  perf-profile.children.cycles-pp.__lru_add_drain_all
      0.26 ± 16%      +1.1        1.40 ± 30%  perf-profile.children.cycles-pp.try_to_wake_up
      3.34 ± 12%      +1.2        4.50 ± 10%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.00            +1.2        1.17 ± 42%  perf-profile.children.cycles-pp.synchronize_rcu_expedited
      0.00            +1.2        1.20 ± 42%  perf-profile.children.cycles-pp.lru_cache_disable
      0.10 ± 62%      +1.2        1.34 ± 21%  perf-profile.children.cycles-pp.follow_trans_huge_pmd
      0.00            +1.4        1.39 ± 37%  perf-profile.children.cycles-pp.sync_rcu_exp_select_cpus
      0.00            +1.4        1.39 ± 37%  perf-profile.children.cycles-pp.wait_rcu_exp_gp
      4.12 ± 12%      +1.5        5.64 ± 11%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      4.08 ± 12%      +1.5        5.59 ± 11%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.00            +1.5        1.54 ± 43%  perf-profile.children.cycles-pp.stress_numa
      0.10 ± 23%      +1.7        1.78 ± 11%  perf-profile.children.cycles-pp.try_grab_page
      0.08 ± 49%      +1.7        1.77 ± 14%  perf-profile.children.cycles-pp.up_read
      5.31 ± 12%      +2.0        7.28 ± 13%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.38 ± 21%      +2.1        2.52 ± 17%  perf-profile.children.cycles-pp.schedule
      0.13 ± 36%      +2.1        2.28 ±  7%  perf-profile.children.cycles-pp.down_read
      5.85 ± 11%      +2.2        8.03 ± 12%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.13 ± 12%      +2.2        2.33 ±  9%  perf-profile.children.cycles-pp.__put_user_4
      0.56 ± 15%      +2.3        2.88 ± 16%  perf-profile.children.cycles-pp.__schedule
      0.16 ± 31%      +2.4        2.52 ±  8%  perf-profile.children.cycles-pp.__get_user_4
      0.14 ± 20%      +2.7        2.82 ±  8%  perf-profile.children.cycles-pp.__get_user_8
      0.04 ± 72%      +2.9        2.94 ± 37%  perf-profile.children.cycles-pp.process_one_work
      0.23 ± 35%      +3.0        3.25 ± 16%  perf-profile.children.cycles-pp.follow_pmd_mask
      0.07 ± 14%      +3.7        3.80 ± 38%  perf-profile.children.cycles-pp.worker_thread
      0.11 ± 16%      +3.8        3.88 ± 38%  perf-profile.children.cycles-pp.kthread
      0.11 ± 13%      +3.8        3.88 ± 38%  perf-profile.children.cycles-pp.ret_from_fork
      0.11 ± 13%      +3.8        3.88 ± 38%  perf-profile.children.cycles-pp.ret_from_fork_asm
      0.24 ± 29%      +4.0        4.23 ±  7%  perf-profile.children.cycles-pp.mtree_load
      0.19 ± 19%      +4.1        4.25 ±  9%  perf-profile.children.cycles-pp.follow_page_pte
      0.55 ± 16%      +9.3        9.85 ±  5%  perf-profile.children.cycles-pp.follow_page
     27.45 ±  9%     +19.0       46.40 ±  6%  perf-profile.children.cycles-pp.intel_idle
      1.13 ± 21%     +19.7       20.81 ±  5%  perf-profile.children.cycles-pp.add_page_for_migration
     31.47 ±  6%     +20.7       52.17 ±  7%  perf-profile.children.cycles-pp.start_secondary
     33.92 ±  7%     +21.4       55.36 ±  5%  perf-profile.children.cycles-pp.cpuidle_enter_state
     33.93 ±  7%     +21.5       55.39 ±  5%  perf-profile.children.cycles-pp.cpuidle_enter
     34.95 ±  7%     +21.6       56.56 ±  5%  perf-profile.children.cycles-pp.cpuidle_idle_call
     35.36 ±  7%     +21.8       57.17 ±  5%  perf-profile.children.cycles-pp.do_idle
     35.38 ±  7%     +21.8       57.18 ±  5%  perf-profile.children.cycles-pp.secondary_startup_64_no_verify
     35.38 ±  7%     +21.8       57.18 ±  5%  perf-profile.children.cycles-pp.cpu_startup_entry
      1.72 ± 20%     +31.8       33.48 ±  4%  perf-profile.children.cycles-pp.do_pages_move
      1.73 ± 20%     +32.0       33.76 ±  4%  perf-profile.children.cycles-pp.kernel_move_pages
      1.73 ± 20%     +32.0       33.76 ±  4%  perf-profile.children.cycles-pp.__x64_sys_move_pages
     18.98 ±  4%     -19.0        0.00        perf-profile.self.cycles-pp.__bitmap_weight
     11.51 ±  7%     -11.5        0.02 ±144%  perf-profile.self.cycles-pp.queue_folios_pte_range
      6.28 ±  4%      -6.3        0.00        perf-profile.self.cycles-pp.mtree_range_walk
      5.13 ±  6%      -5.1        0.00        perf-profile.self.cycles-pp.bitmap_bitremap
      1.81 ±  4%      -1.6        0.20 ± 36%  perf-profile.self.cycles-pp.vm_normal_page
      1.16 ±  7%      -1.0        0.18 ± 31%  perf-profile.self.cycles-pp.vma_migratable
      0.99 ±  5%      -1.0        0.03 ±101%  perf-profile.self.cycles-pp._find_next_bit
      0.02 ±141%      +0.1        0.08 ± 35%  perf-profile.self.cycles-pp.update_rq_clock_task
      0.00            +0.1        0.08 ± 27%  perf-profile.self.cycles-pp.trigger_load_balance
      0.09 ± 18%      +0.1        0.16 ± 15%  perf-profile.self.cycles-pp.rcu_all_qs
      0.12 ± 15%      +0.1        0.20 ± 21%  perf-profile.self.cycles-pp.update_irq_load_avg
      0.00            +0.1        0.09 ± 28%  perf-profile.self.cycles-pp.os_xsave
      0.01 ±223%      +0.1        0.11 ± 36%  perf-profile.self.cycles-pp.__wrgsbase_inactive
      0.01 ±223%      +0.1        0.13 ± 24%  perf-profile.self.cycles-pp.update_load_avg
      0.24 ± 18%      +0.1        0.36 ± 10%  perf-profile.self.cycles-pp.native_sched_clock
      0.06 ± 85%      +0.1        0.19 ± 11%  perf-profile.self.cycles-pp._raw_spin_lock_irq
      0.00            +0.1        0.14 ± 23%  perf-profile.self.cycles-pp.cpu_util
      0.38 ± 15%      +0.1        0.52 ± 18%  perf-profile.self.cycles-pp.lapic_next_deadline
      0.07 ± 50%      +0.1        0.22 ± 23%  perf-profile.self.cycles-pp.__update_load_avg_cfs_rq
      0.02 ±143%      +0.2        0.18 ± 30%  perf-profile.self.cycles-pp.__update_load_avg_se
      0.04 ± 72%      +0.2        0.20 ± 21%  perf-profile.self.cycles-pp.rcu_pending
      0.00            +0.2        0.16 ± 30%  perf-profile.self.cycles-pp.enqueue_entity
      0.02 ±141%      +0.2        0.19 ± 39%  perf-profile.self.cycles-pp.___perf_sw_event
      0.00            +0.2        0.18 ±128%  perf-profile.self.cycles-pp.vma_is_secretmem
      0.16 ± 24%      +0.2        0.35 ± 17%  perf-profile.self.cycles-pp.__cond_resched
      0.00            +0.2        0.19 ± 35%  perf-profile.self.cycles-pp.enqueue_task_fair
      0.06 ± 46%      +0.2        0.26 ± 36%  perf-profile.self.cycles-pp.__switch_to
      0.04 ±105%      +0.2        0.24 ± 20%  perf-profile.self.cycles-pp.ct_kernel_exit_state
      0.67 ±  8%      +0.2        0.91 ± 15%  perf-profile.self.cycles-pp.cpuidle_enter_state
      0.07 ± 28%      +0.2        0.32 ± 23%  perf-profile.self.cycles-pp.__schedule
      0.00            +0.3        0.28 ± 40%  perf-profile.self.cycles-pp.rcu_report_exp_cpu_mult
      0.06 ± 54%      +0.3        0.36 ± 35%  perf-profile.self.cycles-pp.__switch_to_asm
      0.16 ± 13%      +0.3        0.48 ± 15%  perf-profile.self.cycles-pp.update_sg_lb_stats
      0.01 ±223%      +0.5        0.56 ± 16%  perf-profile.self.cycles-pp.follow_page_mask
      0.14 ± 24%      +0.6        0.70 ± 26%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.00            +0.6        0.59 ± 42%  perf-profile.self.cycles-pp.__sync_rcu_exp_select_node_cpus
      0.04 ±104%      +0.7        0.71 ± 21%  perf-profile.self.cycles-pp.follow_trans_huge_pmd
      0.01 ±223%      +0.7        0.73 ± 12%  perf-profile.self.cycles-pp.follow_page
      0.00            +0.7        0.73 ± 41%  perf-profile.self.cycles-pp.__lru_add_drain_all
      1.32 ±  9%      +0.8        2.14 ±  7%  perf-profile.self.cycles-pp._raw_spin_lock
      0.02 ±144%      +0.8        0.85 ± 11%  perf-profile.self.cycles-pp.move_pages_and_store_status
      0.03 ±102%      +0.9        0.89 ± 12%  perf-profile.self.cycles-pp.follow_page_pte
      0.05 ± 74%      +0.9        0.94 ± 18%  perf-profile.self.cycles-pp.follow_p4d_mask
      0.07 ± 53%      +1.2        1.31 ±  9%  perf-profile.self.cycles-pp.follow_pmd_mask
      0.00            +1.5        1.54 ± 43%  perf-profile.self.cycles-pp.stress_numa
      0.08 ± 58%      +1.6        1.71 ±  7%  perf-profile.self.cycles-pp.down_read
      0.08 ± 48%      +1.7        1.76 ± 11%  perf-profile.self.cycles-pp.try_grab_page
      0.08 ± 49%      +1.7        1.77 ± 14%  perf-profile.self.cycles-pp.up_read
      0.10 ± 26%      +1.9        1.98 ±  6%  perf-profile.self.cycles-pp.do_pages_move
      0.12 ± 15%      +2.1        2.26 ± 10%  perf-profile.self.cycles-pp.__put_user_4
      0.16 ± 31%      +2.4        2.52 ±  8%  perf-profile.self.cycles-pp.__get_user_4
      0.12 ± 31%      +2.5        2.59 ±  3%  perf-profile.self.cycles-pp.add_page_for_migration
      0.14 ± 16%      +2.6        2.74 ±  8%  perf-profile.self.cycles-pp.__get_user_8
      0.24 ± 29%      +4.0        4.22 ±  7%  perf-profile.self.cycles-pp.mtree_load
     27.45 ±  9%     +19.0       46.40 ±  6%  perf-profile.self.cycles-pp.intel_idle




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

