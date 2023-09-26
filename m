Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0711C32
	for <oe-lkp@lists.linux.dev>; Tue, 26 Sep 2023 07:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695712605; x=1727248605;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=1+WTXwAubf6LsSvUWADNeIJm4ovZsm8WZ1fLK8Uwdvs=;
  b=nDookDySsigsYougVTQ6dJuPxiVlHDwY4VoUaopgkQfVWZcneFWTb+HT
   WoPb/YeiEV3HqDQuKLKz8nseWV4Z4HOQTylmNjUEaLhQ1KspYjx85Kg02
   EHSEhc5faVllX4bousnkC3IhioJ1JlPx1CJ/7lA6xblskpvHUaqjb5dt2
   pXNW8xp51b4n8TCdHv1ueCBOtERnlKsSXjcsluTwxi7c991KxAznueS1r
   fxdw6CmHVVZbKw9VnTSj/beVYQZRNjvSac0vjfBAPQrKGC+6CxKtGgJhM
   DZk9Zuu+vhIZVXQTTzYVRlTYb1n+d3irJugQs2qqy/MCo5kCAsMApM+m+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="360883546"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="360883546"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 00:16:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="892103572"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="892103572"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 26 Sep 2023 00:15:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 00:16:43 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 00:16:43 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 00:16:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Glkooa1biQYc1yN3cVq+Z5BopC29WRZscsFZ5/3vus0mNjJNaP3EPgmo9x79X6EmBX6KCZSrj5rD+H+XxG+kfzOZWfj1eN/SFd899A4pQ4p6YtTxX5OxLGby9AabDpLJH/uHi+0KmHJEouu+NT3hDPDbE6tyNNGza9ODXAf+mD6ocRy64uuejejOmEml8pB7xNPQd5jPl/vIZIe3aKyt0arlzzoimaKd0RTLi3ncS+39ATTwWyQOVg5nJVM/mJYlx0QrPsI/HeYkt2uSQZp2pi7jKUPrEy1sWRALDb/bPixUKbuQNXs3j6aHUiEcXb6RRuVxxdPxNujgKNIzHwfWOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dEjat67M+Hv+j4bF0jR+9xDyn4m9mowRL/sPauKz7wU=;
 b=R/NVn4E5ao/RMtWUYkNKzLVURXSI9IG8pg5IJaHajVQLI373TWYGNMvJ8cSur2rWF4G5ERKRfjXRm6UnkRKxk8/xmmvTlV4wJ7c4JoGFu5FPYtlqGNaPQ9XGqMIFEotQPaUhTE44B7asExE1Qgrfh8s9JwYeIzfVkdi9r1VOBfyUSd4o3Qdoi4gyJSdWUdnG2tNUzrfn4DLHghdrzmTxtjMu4yTf1O4z3D0wbsEd59LfMihimrfDTDJEyH3yZT3MMve7Ss1tRjpvg87tmFyq98TRt58WKBysTmCU3r21KAKOJGTYHI3MlzUmuktK9v+f7JBSljoGJkSugQ4itg37OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by BL1PR11MB5495.namprd11.prod.outlook.com (2603:10b6:208:317::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Tue, 26 Sep
 2023 07:16:40 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::73c6:1231:e700:924]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::73c6:1231:e700:924%4]) with mapi id 15.20.6813.017; Tue, 26 Sep 2023
 07:16:40 +0000
Date: Tue, 26 Sep 2023 15:16:33 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Dave Chinner <david@fromorbit.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [dgc-xfs:xlog-grant-head-bytes] [xfs]  524acbadb2:  fio.write_iops
 -14.4% regression
Message-ID: <202309261403.6661cec7-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR01CA0115.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::19) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|BL1PR11MB5495:EE_
X-MS-Office365-Filtering-Correlation-Id: e76f31eb-d591-4826-9248-08dbbe608756
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b6O8X1auK1c+foWxjz0eSPSTMR+MgJxQGCc2bKUPjEbf4iOa9xF1x4SPvEUOMzmn4ipPBERhjLVK43MXV9otKP6T/XSnsPHFKlmH3/4czOYl7Y8/X0oBLKvcgmy+7izGxQFBTbGdh2PA8DRug1YI+MJdtRk1WTaB6u8pp6dHZBDAtP3cISOxMkAoOjqio/Mb58DSENFKsEYHamxhn8SjPLvcMmXw96NECXhRYmsfcfiS0cgyeSja02e4VDjrw+avGXqwuWgcCWQLl5XVYX00jD6ix1sDUjcP3r3iZx5DSI6mbFOq9cbvg4TFtgtxkZ2U/zDkbWtF7WfSAFrLwxjazPYWUJcTmilChdbHpIh55HAdVqs8b7G+/NdFbYvbAFwCyccjY+R6/1AYW2b9NtETneRYypqylXUp9Rvwbkeekv/MIyJ5QLv8VyBNDsVfhBYo1rqXMZA0hY2muIlSUaPO0citZ8Nv6RgNUwhFS5JZGXxx52f9GWuWE4D2BTOe640OOJtzdqki4Lqr+xJC4J5srhE4EZlmqz5eS8FSimKjHFTLGqOx7B4mLoRsYaYDemivuPyoNliVK1/Gw/g7J+skUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(376002)(366004)(39860400002)(136003)(230922051799003)(186009)(1800799009)(451199024)(83380400001)(6916009)(2616005)(6512007)(6486002)(6506007)(1076003)(26005)(107886003)(6666004)(36756003)(41300700001)(82960400001)(4326008)(5660300002)(66476007)(316002)(8936002)(8676002)(66946007)(86362001)(478600001)(19627235002)(66556008)(38100700002)(30864003)(2906002)(966005)(579004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Vc0oN73waJkCyxpmLv2gZdorAS22jP8oyctGUFqaoFGo8D3tWussakvtwq?=
 =?iso-8859-1?Q?5XZoyHRxFFaIMG2u7W9xl8x8ygCWvqWwyPnDhq01/r4Qk47K33qarmKFsX?=
 =?iso-8859-1?Q?kmJQ4doIhrOw2xgjr7jVO0gySYHPJx94vNJPp6tacPra5hW6s210bXTs+W?=
 =?iso-8859-1?Q?XIJsltHXVjmxwdep63X5yIX4m7ZfSH/DcFXLKPX7FSN9JGNkIX4L15qKRf?=
 =?iso-8859-1?Q?8I+VsENdkVGrbxUGKvDa5zwqoAf/ltDLY0k7rIPA89jSwNkFLsa8yjfQ6N?=
 =?iso-8859-1?Q?TpqktWtAph1BfquXeHAUCsdXRnSukghDA8N9DnoNSwxeXZIvaMqhyNi8B6?=
 =?iso-8859-1?Q?AUKA6nJbtkRDjbz2xF/MBlbiDWqy2YhKMhBxeJ1OI/H2ElJdEKVToJLQjH?=
 =?iso-8859-1?Q?rjC3ALGkhXiN4bQg11ymfOaS1z/23yre1ELDWlEDhMlBlKQyMKoTyDeuXI?=
 =?iso-8859-1?Q?K+ghFaZDqpfeCKJxG2jf39s5svZVu4oI+2BiErmigWD90HrXK20fWR0E2B?=
 =?iso-8859-1?Q?J7htZe4s4y55RHHprjAHrkjVgUgSw8b6pRh/4dRyQdV6ETj9oA6ZxMC8/+?=
 =?iso-8859-1?Q?fSqHoWO6Crbpzx6mNxg4oIpj2ts1xoxC5NItFZRhg8LUY0x5SICU6mZKJw?=
 =?iso-8859-1?Q?3tZV636y9fbUHV1aWXq1b65Mi3nyDcZ0mKoo5sq/b2MB17/uXWkMCnRuQH?=
 =?iso-8859-1?Q?NnKahHlUQtRpL8gKckRxyZJmXXlgWQVphOxgkBf7gCh+LsP6Reiw/jPyKA?=
 =?iso-8859-1?Q?zQr7vmGKSOGoI43TDEbd/g+h9KXjj/d7XSv4aztcsPEoWKLq4yNm88UPGF?=
 =?iso-8859-1?Q?73bWOn/TfHQBJ5gZ8cBHpWgQR2F1HM1/GnUTiW9KsQSvv3b2aqeZ4iC7Ne?=
 =?iso-8859-1?Q?d6zYNVoEBcRYRAw0AXHBv/8YUjUiKb+DHt54d9Ny2ymptOuIXpLo/74GJT?=
 =?iso-8859-1?Q?Dy8+pxgv7Q5vUpvvjD5h2WKuqb5NY2sVaRzlHXciPGY2dkef+tifD0xYYP?=
 =?iso-8859-1?Q?x3b2s/XUvBpgme+rJevuODRSTZvNIUvpwj8oCVfx0dJCDI3lVZA+14acDi?=
 =?iso-8859-1?Q?hxDdpeiqblKs5LTmAO9u41LVIquIQgLyqka2h5H0vqQkb0T9Ck94Tefoa1?=
 =?iso-8859-1?Q?FaJCjgl+Vagf9sGspfN5NUcrGvANHgwZbzyDVH05ypO8PuaE+zfb2wXR9o?=
 =?iso-8859-1?Q?Nv4/RTzLPLVDCFTMshe1Ppulu4OX+zZjp6i9ve5meNjj93c3Vr9GbItnsP?=
 =?iso-8859-1?Q?mMJHaHxq2pcpmK7AL9VhplkMtrmC+2GdCFV4X+wGa2H+4bVGP0FBehIiIN?=
 =?iso-8859-1?Q?C58wki6I8oLmGc00EWE/oLfTMCOkCgbpTJpr32T44f7cgPYMiz1eIQe9x6?=
 =?iso-8859-1?Q?I3Ee6dEmcVphOupzCRT85i2Kw7SQGic/3IaXK7tmG2nBJ1vPRWj6G68Onc?=
 =?iso-8859-1?Q?KYYjOtmelTBUOotfLG0hnWIjLpVRcgNHmy2WsL/p02L6pHXPyhZ/wi4Yc0?=
 =?iso-8859-1?Q?Tr5wAPyIbWGR/uTt/LPVDtTlXYU7VXmKf4CHwE0PrdRWLAE/ssdWRUqQuw?=
 =?iso-8859-1?Q?pXmxQ04fUwUNsEcoxoDXv0dsvN6Zt/Lq2Fx0guLVo69PJuGxomSaV87XPL?=
 =?iso-8859-1?Q?0DsKpGDtYt3ACDTIbH9X+100s001VpFvipRdu8T4AU5Abl1BPTtOcG5g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e76f31eb-d591-4826-9248-08dbbe608756
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 07:16:40.3042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i+lUUhu97GP6aGYx7CPbSErrN4TQLXsyXOXlJRV/qmJgZMR7Juip2TiXhbFayFHY+BBcpmvVEEwyHR14Y5MGpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5495
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a -14.4% regression of fio.write_iops on:


commit: 524acbadb229efa7532f1417d7f7a3b6eb29deb4 ("xfs: AIL doesn't need manual pushing")
https://git.kernel.org/cgit/linux/kernel/git/dgc/linux-xfs.git xlog-grant-head-bytes

testcase: fio-basic
test machine: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory
parameters:

	runtime: 300s
	disk: 1HDD
	fs: xfs
	nr_task: 1
	test_size: 128G
	rw: write
	bs: 4k
	ioengine: sync
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+-------------------------------------------------------------------------------------------+
| testcase: change | fio-basic: fio.write_iops -14.1% regression                                               |
| test machine     | 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory |
| test parameters  | bs=4k                                                                                     |
|                  | cpufreq_governor=performance                                                              |
|                  | disk=1HDD                                                                                 |
|                  | fs=xfs                                                                                    |
|                  | ioengine=vsync                                                                            |
|                  | nr_task=100%                                                                              |
|                  | runtime=300s                                                                              |
|                  | rw=write                                                                                  |
|                  | test_size=128G                                                                            |
+------------------+-------------------------------------------------------------------------------------------+



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202309261403.6661cec7-oliver.sang@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20230926/202309261403.6661cec7-oliver.sang@intel.com

=========================================================================================
bs/compiler/cpufreq_governor/disk/fs/ioengine/kconfig/nr_task/rootfs/runtime/rw/tbox_group/test_size/testcase:
  4k/gcc-12/performance/1HDD/xfs/sync/x86_64-rhel-8.3/1/debian-11.1-x86_64-20220510.cgz/300s/write/lkp-icl-2sp9/128G/fio-basic

commit: 
  9a3c84b6ca ("xfs: move and xfs_trans_committed_bulk")
  524acbadb2 ("xfs: AIL doesn't need manual pushing")

9a3c84b6ca3ab96a 524acbadb229efa7532f1417d7f 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    113036           -33.3%      75415        vmstat.io.bo
      0.09 ± 10%     -14.2%       0.08 ±  7%  sched_debug.cfs_rq:/.h_nr_running.avg
      0.26 ±  5%      -7.6%       0.24 ±  3%  sched_debug.cfs_rq:/.h_nr_running.stddev
      0.09 ± 10%     -14.2%       0.08 ±  7%  sched_debug.cfs_rq:/.nr_running.avg
      0.26 ±  5%      -7.6%       0.24 ±  3%  sched_debug.cfs_rq:/.nr_running.stddev
      0.03 ±  8%    +130.8%       0.07 ±  7%  sched_debug.cpu.nr_uninterruptible.avg
      0.18            -0.1        0.03 ± 26%  fio.latency_10ms%
      0.00 ±141%      +0.1        0.11 ±  5%  fio.latency_20ms%
      0.09            +0.0        0.11        fio.latency_20us%
 1.588e+08           -14.4%   1.36e+08        fio.time.file_system_outputs
     10.00           -10.0%       9.00        fio.time.percent_of_cpu_this_job_got
     67272           -14.9%      57216        fio.time.voluntary_context_switches
  19853269           -14.4%   17000824        fio.workload
    258.50           -14.4%     221.36        fio.write_bw_MBps
     14903           +17.0%      17438        fio.write_clat_mean_us
    320368           +31.4%     420922        fio.write_clat_stddev
     66176           -14.4%      56668        fio.write_iops
      0.01 ± 12%    +130.1%       0.03 ± 43%  perf-sched.sch_delay.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
     50.45           +55.7%      78.54 ±  7%  perf-sched.wait_and_delay.avg.ms.io_schedule.rq_qos_wait.wbt_wait.__rq_qos_throttle
      4.82 ±  2%     -10.5%       4.32 ±  7%  perf-sched.wait_and_delay.avg.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      7.56 ±  2%     +41.2%      10.67 ± 12%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.io_schedule_timeout.balance_dirty_pages.balance_dirty_pages_ratelimited_flags
     97.67 ±  2%     -36.0%      62.50 ±  8%  perf-sched.wait_and_delay.count.io_schedule.rq_qos_wait.wbt_wait.__rq_qos_throttle
    630.67 ±  2%     -27.0%     460.67 ± 13%  perf-sched.wait_and_delay.count.schedule_timeout.io_schedule_timeout.balance_dirty_pages.balance_dirty_pages_ratelimited_flags
    488.17           +24.8%     609.00 ±  6%  perf-sched.wait_and_delay.count.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
    155.89 ± 15%     +67.7%     261.41 ± 13%  perf-sched.wait_and_delay.max.ms.io_schedule.rq_qos_wait.wbt_wait.__rq_qos_throttle
      8.74           +46.9%      12.83 ±  3%  perf-sched.wait_and_delay.max.ms.schedule_timeout.io_schedule_timeout.balance_dirty_pages.balance_dirty_pages_ratelimited_flags
     50.45           +55.7%      78.54 ±  7%  perf-sched.wait_time.avg.ms.io_schedule.rq_qos_wait.wbt_wait.__rq_qos_throttle
      4.82 ±  2%     -10.5%       4.31 ±  7%  perf-sched.wait_time.avg.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      7.55 ±  2%     +41.2%      10.66 ± 12%  perf-sched.wait_time.avg.ms.schedule_timeout.io_schedule_timeout.balance_dirty_pages.balance_dirty_pages_ratelimited_flags
    155.88 ± 15%     +67.7%     261.41 ± 13%  perf-sched.wait_time.max.ms.io_schedule.rq_qos_wait.wbt_wait.__rq_qos_throttle
      8.73           +46.9%      12.83 ±  3%  perf-sched.wait_time.max.ms.schedule_timeout.io_schedule_timeout.balance_dirty_pages.balance_dirty_pages_ratelimited_flags
  19853430           -14.4%   17001047        proc-vmstat.nr_dirtied
  15727386            -8.3%   14415330        proc-vmstat.nr_file_pages
  49830689            +2.6%   51144808        proc-vmstat.nr_free_pages
  15022314            -8.7%   13710206        proc-vmstat.nr_inactive_file
     58285            -5.1%      55289        proc-vmstat.nr_slab_reclaimable
   8561584           -33.5%    5689398        proc-vmstat.nr_written
  15022314            -8.7%   13710206        proc-vmstat.nr_zone_inactive_file
   6460104 ±  7%     -24.8%    4860417        proc-vmstat.numa_foreign
  14100865 ±  3%      -8.9%   12844435        proc-vmstat.numa_hit
  14029407 ±  3%      -8.1%   12891528 ±  2%  proc-vmstat.numa_local
   6549615 ±  4%     -24.4%    4948547 ±  4%  proc-vmstat.numa_miss
   6526374 ±  6%     -24.5%    4924985        proc-vmstat.numa_other
  20684894           -13.8%   17826762        proc-vmstat.pgalloc_normal
  34266213           -33.5%   22792713        proc-vmstat.pgpgout
      1.16           -11.4%       1.03 ±  5%  perf-stat.i.MPKI
 2.468e+08            -7.7%  2.278e+08 ±  2%  perf-stat.i.branch-instructions
      0.68 ±  2%      +0.1        0.79 ±  3%  perf-stat.i.branch-miss-rate%
     18.25            -2.2       16.10 ±  4%  perf-stat.i.cache-miss-rate%
   1538755           -11.3%    1364767 ±  4%  perf-stat.i.cache-misses
   7621258            -7.5%    7048367 ±  3%  perf-stat.i.cache-references
      1.92 ±  3%     +13.7%       2.19 ±  4%  perf-stat.i.cpi
      1744           +49.4%       2606 ± 12%  perf-stat.i.cycles-between-cache-misses
 3.233e+08            -9.3%  2.934e+08        perf-stat.i.dTLB-loads
      0.01 ±  2%      +0.0        0.01 ±  3%  perf-stat.i.dTLB-store-miss-rate%
 1.651e+08           -10.4%   1.48e+08        perf-stat.i.dTLB-stores
   1.2e+09            -7.8%  1.107e+09 ±  2%  perf-stat.i.instructions
      0.55 ±  2%      -9.0%       0.50 ±  3%  perf-stat.i.ipc
    127.80           +37.7%     175.97 ±  8%  perf-stat.i.metric.K/sec
     11.48            -9.5%      10.40        perf-stat.i.metric.M/sec
     62246 ±  7%      -8.4%      57039        perf-stat.i.node-load-misses
    246656 ±  6%     -23.5%     188712 ±  7%  perf-stat.i.node-store-misses
      1.28            -3.9%       1.23 ±  2%  perf-stat.overall.MPKI
      0.75 ±  4%      +0.1        0.81 ±  3%  perf-stat.overall.branch-miss-rate%
     20.19            -0.8       19.36        perf-stat.overall.cache-miss-rate%
      1.54 ±  2%      +5.7%       1.63 ±  3%  perf-stat.overall.cpi
      1200 ±  2%     +10.1%       1322 ±  4%  perf-stat.overall.cycles-between-cache-misses
      0.01 ±  2%      +0.0        0.01 ±  2%  perf-stat.overall.dTLB-store-miss-rate%
     34.61 ±  7%      -6.0       28.65 ±  7%  perf-stat.overall.node-store-miss-rate%
     18163            +7.5%      19533 ±  2%  perf-stat.overall.path-length
 2.461e+08            -7.7%  2.272e+08 ±  2%  perf-stat.ps.branch-instructions
   1534264           -11.3%    1360796 ±  4%  perf-stat.ps.cache-misses
   7598787            -7.5%    7027862 ±  3%  perf-stat.ps.cache-references
 3.224e+08            -9.3%  2.925e+08        perf-stat.ps.dTLB-loads
 1.646e+08           -10.4%  1.475e+08        perf-stat.ps.dTLB-stores
 1.197e+09            -7.7%  1.104e+09 ±  2%  perf-stat.ps.instructions
     62046 ±  7%      -8.4%      56853        perf-stat.ps.node-load-misses
    245816 ±  6%     -23.5%     188075 ±  7%  perf-stat.ps.node-store-misses
 3.606e+11            -7.9%  3.321e+11 ±  2%  perf-stat.total.instructions
      9.07 ±  8%      -2.9        6.13 ± 17%  perf-profile.calltrace.cycles-pp.__libc_write
      8.57 ±  8%      -2.7        5.83 ± 19%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__libc_write
      8.54 ±  8%      -2.7        5.81 ± 19%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
      8.48 ±  8%      -2.7        5.78 ± 19%  perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
      8.39 ±  8%      -2.7        5.73 ± 19%  perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
      8.07 ±  8%      -2.5        5.52 ± 18%  perf-profile.calltrace.cycles-pp.xfs_file_buffered_write.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      7.59 ±  8%      -2.5        5.14 ± 19%  perf-profile.calltrace.cycles-pp.iomap_file_buffered_write.xfs_file_buffered_write.vfs_write.ksys_write.do_syscall_64
      6.71 ±  7%      -2.1        4.63 ± 21%  perf-profile.calltrace.cycles-pp.iomap_write_iter.iomap_file_buffered_write.xfs_file_buffered_write.vfs_write.ksys_write
      3.47 ± 19%      -1.3        2.15 ± 30%  perf-profile.calltrace.cycles-pp.process_one_work.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      3.51 ± 19%      -1.3        2.21 ± 30%  perf-profile.calltrace.cycles-pp.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      3.42 ±  7%      -1.2        2.22 ± 31%  perf-profile.calltrace.cycles-pp.iomap_write_end.iomap_write_iter.iomap_file_buffered_write.xfs_file_buffered_write.vfs_write
     76.38            +4.8       81.19        perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
     79.97            +4.8       84.78        perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     77.17            +4.9       82.04        perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
     80.63            +4.9       85.52        perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     80.80            +4.9       85.68        perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     80.80            +4.9       85.68        perf-profile.calltrace.cycles-pp.start_secondary.secondary_startup_64_no_verify
     76.00            +4.9       80.94        perf-profile.calltrace.cycles-pp.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
     82.06            +5.0       87.05        perf-profile.calltrace.cycles-pp.secondary_startup_64_no_verify
    104.52            +6.6      111.12 ±  2%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.acpi_safe_halt.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter
      9.21 ±  8%      -3.0        6.20 ± 17%  perf-profile.children.cycles-pp.__libc_write
     10.58 ±  7%      -2.9        7.69 ± 14%  perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     10.53 ±  7%      -2.9        7.66 ± 14%  perf-profile.children.cycles-pp.do_syscall_64
      8.59 ±  8%      -2.7        5.88 ± 19%  perf-profile.children.cycles-pp.ksys_write
      8.48 ±  8%      -2.7        5.83 ± 19%  perf-profile.children.cycles-pp.vfs_write
      8.08 ±  8%      -2.5        5.54 ± 18%  perf-profile.children.cycles-pp.xfs_file_buffered_write
      7.60 ±  8%      -2.5        5.14 ± 19%  perf-profile.children.cycles-pp.iomap_file_buffered_write
      6.72 ±  7%      -2.1        4.64 ± 20%  perf-profile.children.cycles-pp.iomap_write_iter
      3.47 ± 19%      -1.3        2.15 ± 30%  perf-profile.children.cycles-pp.process_one_work
      3.51 ± 19%      -1.3        2.21 ± 30%  perf-profile.children.cycles-pp.worker_thread
      3.42 ±  7%      -1.2        2.22 ± 31%  perf-profile.children.cycles-pp.iomap_write_end
      0.81 ± 32%      -0.3        0.48 ± 13%  perf-profile.children.cycles-pp.iomap_iter
      0.63 ± 12%      -0.2        0.40 ± 25%  perf-profile.children.cycles-pp.copy_page_from_iter_atomic
      0.63 ± 19%      -0.2        0.41 ± 20%  perf-profile.children.cycles-pp.filemap_dirty_folio
      0.56 ± 14%      -0.2        0.34 ± 24%  perf-profile.children.cycles-pp.copyin
      0.50 ± 24%      -0.2        0.31 ± 28%  perf-profile.children.cycles-pp.__mod_lruvec_page_state
      0.49 ± 20%      -0.2        0.33 ± 12%  perf-profile.children.cycles-pp.xas_load
      0.47 ± 19%      -0.2        0.31 ± 16%  perf-profile.children.cycles-pp.__folio_mark_dirty
      0.38 ± 11%      -0.1        0.26 ± 15%  perf-profile.children.cycles-pp.folio_add_lru
      0.35 ± 13%      -0.1        0.24 ± 13%  perf-profile.children.cycles-pp.folio_batch_move_lru
      0.17 ± 11%      -0.1        0.07 ± 60%  perf-profile.children.cycles-pp.fault_in_iov_iter_readable
      0.16 ± 16%      -0.1        0.06 ± 77%  perf-profile.children.cycles-pp.fault_in_readable
      0.19 ± 28%      -0.1        0.10 ± 22%  perf-profile.children.cycles-pp.__xa_set_mark
      0.30 ± 22%      -0.1        0.22 ± 12%  perf-profile.children.cycles-pp.xas_descend
      0.20 ± 24%      -0.1        0.12 ± 42%  perf-profile.children.cycles-pp.__update_blocked_fair
      0.15 ± 34%      -0.1        0.06 ± 16%  perf-profile.children.cycles-pp.xfs_iext_lookup_extent
      0.12 ± 47%      -0.1        0.03 ±100%  perf-profile.children.cycles-pp.filemap_get_folios_tag
      0.16 ± 17%      -0.1        0.08 ± 27%  perf-profile.children.cycles-pp.charge_memcg
      0.11 ± 28%      -0.1        0.04 ±101%  perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.62 ± 14%      +0.2        0.79 ±  9%  perf-profile.children.cycles-pp.update_sg_lb_stats
      0.84 ± 12%      +0.2        1.03 ±  6%  perf-profile.children.cycles-pp.find_busiest_group
      0.81 ± 12%      +0.2        1.01 ±  8%  perf-profile.children.cycles-pp.update_sd_lb_stats
      1.39 ±  8%      +0.3        1.68 ±  9%  perf-profile.children.cycles-pp.load_balance
     69.99            +4.5       74.50        perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
     77.23            +4.9       82.10        perf-profile.children.cycles-pp.cpuidle_enter_state
     80.80            +4.9       85.68        perf-profile.children.cycles-pp.start_secondary
     76.04            +4.9       80.98        perf-profile.children.cycles-pp.acpi_idle_enter
     77.58            +5.0       82.54        perf-profile.children.cycles-pp.cpuidle_enter
     75.88            +5.0       80.83        perf-profile.children.cycles-pp.acpi_safe_halt
     82.06            +5.0       87.05        perf-profile.children.cycles-pp.secondary_startup_64_no_verify
     82.06            +5.0       87.05        perf-profile.children.cycles-pp.cpu_startup_entry
     82.06            +5.0       87.05        perf-profile.children.cycles-pp.do_idle
     81.29            +5.0       86.28        perf-profile.children.cycles-pp.cpuidle_idle_call
      0.55 ± 14%      -0.2        0.34 ± 24%  perf-profile.self.cycles-pp.copyin
      0.45 ± 15%      -0.2        0.28 ± 22%  perf-profile.self.cycles-pp.fio_gettime
      0.15 ± 17%      -0.1        0.05 ± 75%  perf-profile.self.cycles-pp.fault_in_readable
      0.15 ± 34%      -0.1        0.06 ± 16%  perf-profile.self.cycles-pp.xfs_iext_lookup_extent
      0.11 ± 28%      -0.1        0.03 ±101%  perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.16 ± 18%      -0.1        0.10 ± 31%  perf-profile.self.cycles-pp.__filemap_add_folio
      0.32 ±  6%      +0.1        0.43 ± 18%  perf-profile.self.cycles-pp.cpuidle_enter
      0.39 ± 13%      +0.1        0.51 ± 15%  perf-profile.self.cycles-pp.update_sg_lb_stats
     39.10 ±  2%      +2.5       41.60 ±  4%  perf-profile.self.cycles-pp.acpi_safe_halt


***************************************************************************************************
lkp-icl-2sp9: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory
=========================================================================================
bs/compiler/cpufreq_governor/disk/fs/ioengine/kconfig/nr_task/rootfs/runtime/rw/tbox_group/test_size/testcase:
  4k/gcc-12/performance/1HDD/xfs/vsync/x86_64-rhel-8.3/100%/debian-11.1-x86_64-20220510.cgz/300s/write/lkp-icl-2sp9/128G/fio-basic

commit: 
  9a3c84b6ca ("xfs: move and xfs_trans_committed_bulk")
  524acbadb2 ("xfs: AIL doesn't need manual pushing")

9a3c84b6ca3ab96a 524acbadb229efa7532f1417d7f 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      9.00 ± 18%     +37.0%      12.33 ± 14%  perf-c2c.DRAM.local
     29.00 ± 17%     +33.3%      38.67 ± 10%  perf-c2c.DRAM.remote
    108530           -33.4%      72244        vmstat.io.bo
      3788           -10.3%       3396        vmstat.system.cs
     30247 ±  2%     -10.5%      27067        meminfo.Active
     29576            -9.8%      26670        meminfo.Active(anon)
     24497 ±  5%     -20.9%      19379 ±  3%  meminfo.Writeback
  31393531 ±  2%      -9.0%   28571090 ±  3%  numa-meminfo.node0.FilePages
  32186703 ±  2%      -8.7%   29381704 ±  3%  numa-meminfo.node0.MemUsed
     11976 ±  6%     -19.4%       9658 ±  3%  numa-meminfo.node0.Writeback
     11763 ±  5%     -16.8%       9786 ±  5%  numa-meminfo.node1.Writeback
  10179430           -15.1%    8639331        numa-numastat.node0.local_node
  10202921           -15.0%    8674555        numa-numastat.node0.numa_hit
   9968357           -12.2%    8756457        numa-numastat.node1.local_node
  10011220           -12.2%    8787570        numa-numastat.node1.numa_hit
   9857285           -15.6%    8322472        numa-vmstat.node0.nr_dirtied
   7848612 ±  2%      -9.0%    7142970 ±  3%  numa-vmstat.node0.nr_file_pages
      3037 ±  3%     -20.1%       2425 ±  3%  numa-vmstat.node0.nr_writeback
   4066381 ±  3%     -33.2%    2716447 ±  3%  numa-vmstat.node0.nr_written
  10202989           -15.0%    8674689        numa-vmstat.node0.numa_hit
  10179498           -15.1%    8639465        numa-vmstat.node0.numa_local
   9638412           -12.6%    8422335        numa-vmstat.node1.nr_dirtied
      2966 ±  6%     -17.7%       2440 ±  6%  numa-vmstat.node1.nr_writeback
   4149433 ±  3%     -34.3%    2728045 ±  3%  numa-vmstat.node1.nr_written
  10011066           -12.2%    8787693        numa-vmstat.node1.numa_hit
   9968203           -12.2%    8756580        numa-vmstat.node1.numa_local
      0.01 ±  7%     -20.5%       0.01 ±  4%  perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
    100.16           +18.5%     118.65        perf-sched.total_wait_and_delay.average.ms
     10331 ±  2%     -13.1%       8976        perf-sched.total_wait_and_delay.count.ms
    100.15           +18.5%     118.64        perf-sched.total_wait_time.average.ms
     53.60 ±  2%     +56.1%      83.69 ±  4%  perf-sched.wait_and_delay.avg.ms.io_schedule.rq_qos_wait.wbt_wait.__rq_qos_throttle
     70.80           +61.3%     114.20 ±  2%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.io_schedule_timeout.balance_dirty_pages.balance_dirty_pages_ratelimited_flags
     90.00 ±  3%     -35.4%      58.17 ±  4%  perf-sched.wait_and_delay.count.io_schedule.rq_qos_wait.wbt_wait.__rq_qos_throttle
      4452           -38.7%       2731 ±  2%  perf-sched.wait_and_delay.count.schedule_timeout.io_schedule_timeout.balance_dirty_pages.balance_dirty_pages_ratelimited_flags
    639.17 ±  2%     +19.8%     766.00 ±  2%  perf-sched.wait_and_delay.count.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     79.60 ±  3%     +58.6%     126.28 ±  2%  perf-sched.wait_and_delay.max.ms.schedule_timeout.io_schedule_timeout.balance_dirty_pages.balance_dirty_pages_ratelimited_flags
     53.60 ±  2%     +56.1%      83.69 ±  4%  perf-sched.wait_time.avg.ms.io_schedule.rq_qos_wait.wbt_wait.__rq_qos_throttle
     70.80           +61.3%     114.19 ±  2%  perf-sched.wait_time.avg.ms.schedule_timeout.io_schedule_timeout.balance_dirty_pages.balance_dirty_pages_ratelimited_flags
     79.59 ±  3%     +58.6%     126.27 ±  2%  perf-sched.wait_time.max.ms.schedule_timeout.io_schedule_timeout.balance_dirty_pages.balance_dirty_pages_ratelimited_flags
      7394            -9.8%       6666        proc-vmstat.nr_active_anon
  19495444           -14.1%   16744807        proc-vmstat.nr_dirtied
  15980365            -7.7%   14755642        proc-vmstat.nr_file_pages
  49574255            +2.5%   50801232        proc-vmstat.nr_free_pages
  15269283            -8.0%   14045436        proc-vmstat.nr_inactive_file
     11971            -6.1%      11245        proc-vmstat.nr_shmem
     58921            -4.7%      56133        proc-vmstat.nr_slab_reclaimable
      6060 ±  6%     -20.3%       4832 ±  4%  proc-vmstat.nr_writeback
   8212778           -33.7%    5442288        proc-vmstat.nr_written
      7394            -9.8%       6666        proc-vmstat.nr_zone_active_anon
  15269283            -8.0%   14045436        proc-vmstat.nr_zone_inactive_file
  20215670           -13.6%   17464285        proc-vmstat.numa_hit
  20149315           -13.7%   17397947        proc-vmstat.numa_local
     13691 ±  2%      -7.3%      12696 ±  2%  proc-vmstat.pgactivate
  20344680           -13.5%   17588396        proc-vmstat.pgalloc_normal
  32875844           -33.6%   21832608        proc-vmstat.pgpgout
      1.16            -1.2        0.01        fio.latency_100ms%
      5.78 ±  3%      +0.6        6.38 ±  3%  fio.latency_10us%
      1.68 ±  2%      +0.2        1.93 ±  2%  fio.latency_20us%
      0.07 ±  8%      +0.8        0.91        fio.latency_250ms%
      0.02 ±  2%      +0.0        0.02        fio.latency_250us%
     34.77 ±  3%      -4.2       30.60        fio.latency_2us%
     55.94 ±  2%      +3.5       59.49        fio.latency_4us%
  1.56e+08           -14.1%   1.34e+08        fio.time.file_system_outputs
     20.83            -8.8%      19.00        fio.time.percent_of_cpu_this_job_got
     51.66           -11.1%      45.95        fio.time.system_time
    283256           -29.8%     198779        fio.time.voluntary_context_switches
  19496144           -14.1%   16746170        fio.workload
    253.77           -14.1%     217.94        fio.write_bw_MBps
      3872            +2.6%       3973        fio.write_clat_90%_us
      6570            +4.2%       6848        fio.write_clat_95%_us
  71827456           -98.4%    1167872 ±187%  fio.write_clat_99%_us
    984660           +16.4%    1146541        fio.write_clat_mean_us
   9197482           +30.3%   11987201        fio.write_clat_stddev
     64971           -14.1%      55799        fio.write_iops
      1.53           -13.2%       1.33        perf-stat.i.MPKI
 2.546e+08            -8.5%  2.329e+08        perf-stat.i.branch-instructions
      0.83 ±  2%      +0.1        0.92        perf-stat.i.branch-miss-rate%
     20.91            -2.5       18.43        perf-stat.i.cache-miss-rate%
   2890539            -9.6%    2612793        perf-stat.i.cache-misses
   9446600            -8.9%    8606748        perf-stat.i.cache-references
      3759           -10.6%       3362        perf-stat.i.context-switches
      2.11 ±  4%     +10.1%       2.32        perf-stat.i.cpi
 2.243e+09 ±  2%      -3.6%  2.162e+09        perf-stat.i.cpu-cycles
      1442 ±  4%     +26.1%       1818 ±  2%  perf-stat.i.cycles-between-cache-misses
 3.377e+08            -8.3%  3.096e+08        perf-stat.i.dTLB-loads
      0.01 ±  2%      +0.0        0.01 ±  2%  perf-stat.i.dTLB-store-miss-rate%
 1.736e+08            -9.0%  1.579e+08        perf-stat.i.dTLB-stores
  1.24e+09            -8.6%  1.133e+09        perf-stat.i.instructions
      0.49 ±  4%      -9.1%       0.44        perf-stat.i.ipc
      0.04 ±  2%      -3.6%       0.03        perf-stat.i.metric.GHz
     99.08           -15.7%      83.49        perf-stat.i.metric.K/sec
     12.03            -8.5%      11.01        perf-stat.i.metric.M/sec
     80.95            +1.9       82.89        perf-stat.i.node-load-miss-rate%
    123336 ±  2%      -9.3%     111901        perf-stat.i.node-load-misses
     33596 ±  4%     -15.5%      28380 ±  2%  perf-stat.i.node-loads
   1729208            -5.7%    1630149        perf-stat.i.node-stores
    771.07 ±  2%      +6.8%     823.48        perf-stat.overall.cycles-between-cache-misses
      0.01 ±  2%      +0.0        0.01        perf-stat.overall.dTLB-store-miss-rate%
     19226            +6.3%      20446        perf-stat.overall.path-length
 2.553e+08            -8.7%  2.332e+08        perf-stat.ps.branch-instructions
   2913842            -9.9%    2626522        perf-stat.ps.cache-misses
   9487574            -9.1%    8627532        perf-stat.ps.cache-references
      3749           -10.6%       3352        perf-stat.ps.context-switches
 2.247e+09 ±  3%      -3.7%  2.163e+09        perf-stat.ps.cpu-cycles
 3.387e+08            -8.5%    3.1e+08        perf-stat.ps.dTLB-loads
 1.741e+08            -9.2%  1.581e+08        perf-stat.ps.dTLB-stores
 1.244e+09            -8.8%  1.135e+09        perf-stat.ps.instructions
    123543 ±  2%      -9.4%     111945        perf-stat.ps.node-load-misses
     33665 ±  4%     -15.6%      28401 ±  2%  perf-stat.ps.node-loads
   1748584            -6.1%    1641948        perf-stat.ps.node-stores
 3.748e+11            -8.7%  3.424e+11        perf-stat.total.instructions
     10.29 ±  5%      -4.0        6.28 ±  5%  perf-profile.calltrace.cycles-pp.writev
      9.96 ±  4%      -3.9        6.09 ±  5%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.writev
      9.91 ±  4%      -3.8        6.06 ±  5%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.writev
      9.85 ±  4%      -3.8        6.02 ±  5%  perf-profile.calltrace.cycles-pp.do_writev.do_syscall_64.entry_SYSCALL_64_after_hwframe.writev
      9.75 ±  5%      -3.8        5.95 ±  5%  perf-profile.calltrace.cycles-pp.vfs_writev.do_writev.do_syscall_64.entry_SYSCALL_64_after_hwframe.writev
      9.37 ±  4%      -3.6        5.79 ±  6%  perf-profile.calltrace.cycles-pp.do_iter_write.vfs_writev.do_writev.do_syscall_64.entry_SYSCALL_64_after_hwframe
      9.23 ±  4%      -3.5        5.72 ±  5%  perf-profile.calltrace.cycles-pp.do_iter_readv_writev.do_iter_write.vfs_writev.do_writev.do_syscall_64
      9.08 ±  5%      -3.4        5.64 ±  5%  perf-profile.calltrace.cycles-pp.xfs_file_buffered_write.do_iter_readv_writev.do_iter_write.vfs_writev.do_writev
      8.31 ±  4%      -3.2        5.10 ±  6%  perf-profile.calltrace.cycles-pp.iomap_file_buffered_write.xfs_file_buffered_write.do_iter_readv_writev.do_iter_write.vfs_writev
      7.55 ±  4%      -2.9        4.60 ±  6%  perf-profile.calltrace.cycles-pp.iomap_write_iter.iomap_file_buffered_write.xfs_file_buffered_write.do_iter_readv_writev.do_iter_write
      2.44 ±  8%      -1.0        1.45 ± 12%  perf-profile.calltrace.cycles-pp.iomap_write_begin.iomap_write_iter.iomap_file_buffered_write.xfs_file_buffered_write.do_iter_readv_writev
      3.15 ±  8%      -1.0        2.18 ±  5%  perf-profile.calltrace.cycles-pp.iomap_write_end.iomap_write_iter.iomap_file_buffered_write.xfs_file_buffered_write.do_iter_readv_writev
      2.32 ±  8%      -1.0        1.37 ± 11%  perf-profile.calltrace.cycles-pp.__filemap_get_folio.iomap_write_begin.iomap_write_iter.iomap_file_buffered_write.xfs_file_buffered_write
      2.48 ± 12%      -0.7        1.76 ± 18%  perf-profile.calltrace.cycles-pp.process_one_work.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      2.59 ± 11%      -0.7        1.87 ± 17%  perf-profile.calltrace.cycles-pp.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      1.47 ± 15%      -0.7        0.81 ± 18%  perf-profile.calltrace.cycles-pp.filemap_add_folio.__filemap_get_folio.iomap_write_begin.iomap_write_iter.iomap_file_buffered_write
      2.81 ±  9%      -0.6        2.17 ± 12%  perf-profile.calltrace.cycles-pp.ret_from_fork_asm
      2.81 ±  9%      -0.6        2.17 ± 12%  perf-profile.calltrace.cycles-pp.ret_from_fork.ret_from_fork_asm
      2.81 ±  9%      -0.6        2.17 ± 12%  perf-profile.calltrace.cycles-pp.kthread.ret_from_fork.ret_from_fork_asm
      1.00 ± 17%      -0.6        0.38 ± 71%  perf-profile.calltrace.cycles-pp.__filemap_add_folio.filemap_add_folio.__filemap_get_folio.iomap_write_begin.iomap_write_iter
      0.98 ± 10%      -0.5        0.51 ± 47%  perf-profile.calltrace.cycles-pp.balance_dirty_pages_ratelimited_flags.iomap_write_iter.iomap_file_buffered_write.xfs_file_buffered_write.do_iter_readv_writev
      0.75 ± 12%      -0.4        0.31 ±101%  perf-profile.calltrace.cycles-pp.xfs_end_io.process_one_work.worker_thread.kthread.ret_from_fork
      0.75 ± 12%      -0.4        0.31 ±101%  perf-profile.calltrace.cycles-pp.xfs_end_ioend.xfs_end_io.process_one_work.worker_thread.kthread
      0.74 ± 11%      -0.4        0.31 ±101%  perf-profile.calltrace.cycles-pp.iomap_finish_ioend.iomap_finish_ioends.xfs_end_ioend.xfs_end_io.process_one_work
      0.74 ± 11%      -0.4        0.31 ±101%  perf-profile.calltrace.cycles-pp.iomap_finish_ioends.xfs_end_ioend.xfs_end_io.process_one_work.worker_thread
      0.94 ± 16%      +0.6        1.55 ± 23%  perf-profile.calltrace.cycles-pp.ktime_get_update_offsets_now.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      1.11 ± 13%      +1.0        2.10 ± 51%  perf-profile.calltrace.cycles-pp.irq_enter_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.acpi_safe_halt.acpi_idle_enter
      0.19 ±141%      +1.0        1.20 ± 42%  perf-profile.calltrace.cycles-pp.tick_sched_do_timer.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt
     33.20 ±  3%      +3.1       36.32        perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.acpi_safe_halt.acpi_idle_enter.cpuidle_enter_state
     40.98            +3.2       44.22        perf-profile.calltrace.cycles-pp.acpi_safe_halt.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
     75.23            +4.6       79.83        perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
     78.76            +4.8       83.54        perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     79.60            +4.8       84.39        perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     79.75            +4.8       84.56        perf-profile.calltrace.cycles-pp.start_secondary.secondary_startup_64_no_verify
     79.74            +4.8       84.56        perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     76.02            +4.9       80.95        perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
     74.73            +5.0       79.69        perf-profile.calltrace.cycles-pp.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
     80.96            +5.2       86.18        perf-profile.calltrace.cycles-pp.secondary_startup_64_no_verify
    102.96            +6.5      109.50        perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.acpi_safe_halt.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter
     10.39 ±  5%      -4.1        6.33 ±  5%  perf-profile.children.cycles-pp.writev
      9.86 ±  4%      -3.8        6.02 ±  5%  perf-profile.children.cycles-pp.do_writev
      9.76 ±  5%      -3.8        5.96 ±  5%  perf-profile.children.cycles-pp.vfs_writev
     12.30 ±  3%      -3.6        8.70 ±  4%  perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      9.38 ±  4%      -3.6        5.79 ±  6%  perf-profile.children.cycles-pp.do_iter_write
     12.21 ±  3%      -3.5        8.66 ±  4%  perf-profile.children.cycles-pp.do_syscall_64
      9.24 ±  4%      -3.5        5.73 ±  5%  perf-profile.children.cycles-pp.do_iter_readv_writev
      9.08 ±  5%      -3.4        5.64 ±  5%  perf-profile.children.cycles-pp.xfs_file_buffered_write
      8.32 ±  4%      -3.2        5.10 ±  6%  perf-profile.children.cycles-pp.iomap_file_buffered_write
      7.56 ±  4%      -2.9        4.62 ±  6%  perf-profile.children.cycles-pp.iomap_write_iter
      2.45 ±  8%      -1.0        1.46 ± 12%  perf-profile.children.cycles-pp.iomap_write_begin
      3.16 ±  8%      -1.0        2.18 ±  5%  perf-profile.children.cycles-pp.iomap_write_end
      2.34 ±  8%      -1.0        1.38 ± 11%  perf-profile.children.cycles-pp.__filemap_get_folio
      2.48 ± 12%      -0.7        1.76 ± 18%  perf-profile.children.cycles-pp.process_one_work
      2.59 ± 11%      -0.7        1.87 ± 17%  perf-profile.children.cycles-pp.worker_thread
      1.48 ± 15%      -0.7        0.82 ± 17%  perf-profile.children.cycles-pp.filemap_add_folio
      2.81 ±  9%      -0.6        2.17 ± 12%  perf-profile.children.cycles-pp.kthread
      2.82 ±  9%      -0.6        2.18 ± 12%  perf-profile.children.cycles-pp.ret_from_fork
      2.82 ±  9%      -0.6        2.19 ± 12%  perf-profile.children.cycles-pp.ret_from_fork_asm
      1.01 ± 16%      -0.5        0.52 ± 18%  perf-profile.children.cycles-pp.__filemap_add_folio
      0.72 ± 36%      -0.5        0.26 ± 16%  perf-profile.children.cycles-pp.copy_page_from_iter_atomic
      0.63 ± 45%      -0.4        0.22 ± 16%  perf-profile.children.cycles-pp.copyin
      0.99 ±  9%      -0.4        0.59 ± 16%  perf-profile.children.cycles-pp.balance_dirty_pages_ratelimited_flags
      0.79 ± 18%      -0.4        0.43 ± 18%  perf-profile.children.cycles-pp.balance_dirty_pages
      0.69 ± 15%      -0.3        0.38 ±  8%  perf-profile.children.cycles-pp.filemap_dirty_folio
      0.66 ± 11%      -0.3        0.40 ± 12%  perf-profile.children.cycles-pp.__alloc_pages
      0.67 ± 13%      -0.3        0.41 ± 12%  perf-profile.children.cycles-pp.folio_alloc
      0.55 ±  8%      -0.3        0.29 ± 17%  perf-profile.children.cycles-pp.__libc_lseek64
      0.58 ± 19%      -0.2        0.35 ± 16%  perf-profile.children.cycles-pp.__mod_lruvec_page_state
      0.53 ± 15%      -0.2        0.31 ± 15%  perf-profile.children.cycles-pp.__folio_mark_dirty
      0.75 ± 12%      -0.2        0.53 ± 20%  perf-profile.children.cycles-pp.xfs_end_io
      0.75 ± 12%      -0.2        0.53 ± 20%  perf-profile.children.cycles-pp.xfs_end_ioend
      0.74 ± 11%      -0.2        0.52 ± 21%  perf-profile.children.cycles-pp.iomap_finish_ioends
      0.74 ± 11%      -0.2        0.52 ± 21%  perf-profile.children.cycles-pp.iomap_finish_ioend
      0.72 ± 11%      -0.2        0.51 ± 20%  perf-profile.children.cycles-pp.folio_end_writeback
      0.65 ± 11%      -0.2        0.45 ± 26%  perf-profile.children.cycles-pp.__folio_end_writeback
      0.53 ± 11%      -0.2        0.34 ± 17%  perf-profile.children.cycles-pp.get_page_from_freelist
      0.44 ± 22%      -0.2        0.26 ± 17%  perf-profile.children.cycles-pp.percpu_counter_add_batch
      0.35 ± 20%      -0.2        0.16 ± 15%  perf-profile.children.cycles-pp.folio_account_dirtied
      0.59 ± 19%      -0.2        0.42 ±  6%  perf-profile.children.cycles-pp.xfs_file_write_checks
      0.38 ± 25%      -0.2        0.23 ± 22%  perf-profile.children.cycles-pp.__mem_cgroup_charge
      0.31 ± 23%      -0.1        0.17 ± 28%  perf-profile.children.cycles-pp.charge_memcg
      0.18 ± 16%      -0.1        0.08 ± 78%  perf-profile.children.cycles-pp.io_schedule_timeout
      0.22 ± 20%      -0.1        0.12 ± 42%  perf-profile.children.cycles-pp.__mod_lruvec_state
      0.26 ± 20%      -0.1        0.16 ± 22%  perf-profile.children.cycles-pp.xas_descend
      0.26 ± 11%      -0.1        0.17 ± 21%  perf-profile.children.cycles-pp.__mod_memcg_lruvec_state
      0.19 ± 17%      -0.1        0.09 ± 48%  perf-profile.children.cycles-pp.__mod_node_page_state
      0.22 ± 20%      -0.1        0.12 ± 34%  perf-profile.children.cycles-pp.schedule_timeout
      0.22 ± 20%      -0.1        0.13 ± 13%  perf-profile.children.cycles-pp.td_io_queue
      0.14 ± 24%      -0.1        0.05 ± 46%  perf-profile.children.cycles-pp.io_completed
      0.14 ± 19%      -0.1        0.06 ± 55%  perf-profile.children.cycles-pp.__count_memcg_events
      0.18 ± 12%      -0.1        0.10 ± 27%  perf-profile.children.cycles-pp.fault_in_iov_iter_readable
      0.17 ± 17%      -0.1        0.10 ± 16%  perf-profile.children.cycles-pp.rmqueue_bulk
      0.15 ± 15%      -0.1        0.08 ± 53%  perf-profile.children.cycles-pp.fault_in_readable
      0.15 ± 32%      -0.1        0.08 ± 30%  perf-profile.children.cycles-pp.cgroup_rstat_updated
      0.30 ±  8%      -0.1        0.25 ± 11%  perf-profile.children.cycles-pp.timerqueue_del
      0.09 ± 19%      -0.1        0.04 ±105%  perf-profile.children.cycles-pp.up_write
      0.08 ± 25%      +0.0        0.12 ± 14%  perf-profile.children.cycles-pp.unmap_page_range
      0.04 ± 77%      +0.0        0.09 ± 19%  perf-profile.children.cycles-pp.__libc_read
      0.04 ± 77%      +0.0        0.09 ± 19%  perf-profile.children.cycles-pp.readn
      0.07 ± 49%      +0.0        0.12 ± 17%  perf-profile.children.cycles-pp.zap_pmd_range
      0.07 ± 25%      +0.1        0.12 ± 23%  perf-profile.children.cycles-pp.asm_common_interrupt
      0.07 ± 25%      +0.1        0.12 ± 23%  perf-profile.children.cycles-pp.common_interrupt
      0.12 ± 10%      +0.1        0.20 ± 21%  perf-profile.children.cycles-pp.cpuidle_reflect
      0.10 ± 30%      +0.1        0.18 ± 30%  perf-profile.children.cycles-pp.link_path_walk
      1.04 ±  7%      +0.1        1.16 ±  4%  perf-profile.children.cycles-pp.read_tsc
      0.44 ± 20%      +0.1        0.56 ±  9%  perf-profile.children.cycles-pp.__x64_sys_execve
      0.44 ± 21%      +0.1        0.56 ±  8%  perf-profile.children.cycles-pp.do_execveat_common
      0.43 ± 20%      +0.1        0.56 ±  9%  perf-profile.children.cycles-pp.execve
      0.96 ± 15%      +0.6        1.57 ± 23%  perf-profile.children.cycles-pp.ktime_get_update_offsets_now
      0.42 ± 27%      +0.8        1.22 ± 42%  perf-profile.children.cycles-pp.tick_sched_do_timer
      1.14 ± 12%      +1.0        2.16 ± 51%  perf-profile.children.cycles-pp.irq_enter_rcu
     23.79 ±  5%      +1.9       25.71 ±  3%  perf-profile.children.cycles-pp.hrtimer_interrupt
     24.46 ±  5%      +2.0       26.42 ±  3%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
     33.38 ±  3%      +3.0       36.38        perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
     68.70            +4.7       73.40        perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
     79.75            +4.8       84.56        perf-profile.children.cycles-pp.start_secondary
     76.07            +4.9       81.00        perf-profile.children.cycles-pp.cpuidle_enter_state
     76.44            +4.9       81.38        perf-profile.children.cycles-pp.cpuidle_enter
     74.60            +4.9       79.55        perf-profile.children.cycles-pp.acpi_safe_halt
     74.76            +5.0       79.76        perf-profile.children.cycles-pp.acpi_idle_enter
     80.06            +5.2       85.26        perf-profile.children.cycles-pp.cpuidle_idle_call
     80.96            +5.2       86.18        perf-profile.children.cycles-pp.do_idle
     80.96            +5.2       86.18        perf-profile.children.cycles-pp.secondary_startup_64_no_verify
     80.96            +5.2       86.18        perf-profile.children.cycles-pp.cpu_startup_entry
      2.44 ±  9%      -0.7        1.76 ±  6%  perf-profile.self.cycles-pp.iomap_write_end
      0.55 ± 24%      -0.3        0.22 ± 16%  perf-profile.self.cycles-pp.copyin
      0.39 ± 22%      -0.1        0.24 ± 21%  perf-profile.self.cycles-pp.percpu_counter_add_batch
      0.17 ± 15%      -0.1        0.06 ± 45%  perf-profile.self.cycles-pp.writev
      0.14 ± 31%      -0.1        0.05 ± 75%  perf-profile.self.cycles-pp.vfs_writev
      0.13 ± 26%      -0.1        0.04 ± 72%  perf-profile.self.cycles-pp.io_completed
      0.17 ± 17%      -0.1        0.09 ± 46%  perf-profile.self.cycles-pp.__mod_node_page_state
      0.20 ± 19%      -0.1        0.12 ± 24%  perf-profile.self.cycles-pp.__mod_memcg_lruvec_state
      0.14 ± 17%      -0.1        0.07 ± 57%  perf-profile.self.cycles-pp.fault_in_readable
      0.17 ± 10%      -0.1        0.12 ± 32%  perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.12 ± 17%      -0.1        0.07 ± 15%  perf-profile.self.cycles-pp.rmqueue_bulk
      0.13 ± 53%      +0.1        0.22 ± 14%  perf-profile.self.cycles-pp.update_sd_lb_stats
      0.81 ± 19%      +0.6        1.40 ± 25%  perf-profile.self.cycles-pp.ktime_get_update_offsets_now
      0.20 ± 35%      +0.8        0.99 ± 46%  perf-profile.self.cycles-pp.tick_sched_do_timer



Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

