Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DD91FB8
	for <oe-lkp@lists.linux.dev>; Thu, 23 Nov 2023 01:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gXVVdAoZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700704251; x=1732240251;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=0biaacZ478EJ3Re3BL8KPRrQUXLLAP6JLB+vrvyX0IA=;
  b=gXVVdAoZ6n2eMRyO8SKGXnyl90K3My2KPBZG2ECUVi54G8X5RoFpMN3J
   On8tjY2NF1KWNYpHT2XfC4VnYzNF6+dY7lSVTBUxq2ahXTR/L/qdtvpR6
   gJhbJsF2tLukosAS1+gR/fkN0VzY7SCEibBhan8WKesJThu1TQiA134v0
   3S72BaSPNHzZproua7aNtZL9rZuMEEK4sa+FpUu4wCx8liJqVOK67B+7X
   RS4QjQ9NCqgRlA8vqzUGjsJ7xXAV69heGnFEDIEwdt1WVsC8cDNiTh1ke
   1F1RpKXfGLanBgKnqmJXmnBTSytF7Yg19xPO0cK7ePS3fINc2dDvDnotn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="10855859"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="10855859"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 17:50:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="770846100"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="770846100"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 22 Nov 2023 17:50:49 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 22 Nov 2023 17:50:48 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 22 Nov 2023 17:50:48 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 22 Nov 2023 17:50:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dYYrP0WcoaYEH6RmVU920epVovbAJhNZ5kiUu6nQ3xw6WwtViDGgUyDymy7k1l2cb9aYFr6S0tNUHmHt97ARNnxFWAb1TIv4naRQliwG8ccIp5MRVCZRCDN6qnRXPQFFPsWp41XXvpiGTqC3uliBRjtYhTDq/rI1GhiXx7mL9wtkMUWA65AzlKHMXj2I/gLZMvXwMrt7bdBWAtgOBcaz1vLKIldtqsQOZO6CwUhmt5QdIc3s6v/Koq/yFXxfglJ2APGK57Gweg9PL/SEFKT74U7GVvNWItBoDWCsukVhR54YuMihj0DYWt/bAmqxBTh6GDKnNeciigfZp89NMF+bPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+NLzOEVcE/LbALrYi98MnONy/MhPAXpcpmlDDwDCc8=;
 b=eSOetV2hYyiAJvQI+Qt1OucP+Hf8Igc3On0Achtq8wS1RUZzdr9cOyed7E9ULOAZ87mmjPrs3T3k+uF2AMohvx9Ix6apmVciRgoqkdbOTNSuv20ajELdpv4cLgPbuxcmwgOIyehO1EShXtO8PQ3ZId3dhs+4e6J4ctrpRBcMncX6I45LAOgvUplK3HOmevTOhT8gVEOjWdaMKutvSv1zy6Om/QbtRwErSNXGy/dIO6403a4D+BxI+RDHGqDvCpWZMz2Gvy0aJxopehwHUTglBfaOfohekYKNc26U8m+dw1PyRyP5TJ2qJug4EyNprtWFW8hjSELuRTL79b0l4UJ0vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MW4PR11MB5870.namprd11.prod.outlook.com (2603:10b6:303:187::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20; Thu, 23 Nov
 2023 01:50:46 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::1236:9a2e:5acd:a7f]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::1236:9a2e:5acd:a7f%3]) with mapi id 15.20.7002.027; Thu, 23 Nov 2023
 01:50:45 +0000
Date: Thu, 23 Nov 2023 09:50:38 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [peterz-queue:sched/more] [sched/fair]  786b20ecf0:
 adrestia.wakeup_cost_periodic_us 133.3% regression
Message-ID: <202311222157.b9c964d9-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR06CA0018.apcprd06.prod.outlook.com
 (2603:1096:4:186::8) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MW4PR11MB5870:EE_
X-MS-Office365-Filtering-Correlation-Id: fe501eb2-30c6-45a6-a2c6-08dbebc69be5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JgpJz54PCj07RV7xzNrPfH5obVEPca/KIUH4vaNMF9X+Ie7qHhzSatoIHmEY+804nqdLtof7g0RDphGnHpPeivbtmDm58Qr5nlgjgO4J1X8a2HKTdjEcxacqraEk0RhbFWe7peiPoWGT97YwKrTJuR0Ybp5ajr/ch4p9rNqFP13MTeAfhc54/2SaVI9OGtxySKouUeU2ShykOgTcsRxsZJfAgr/ydkAY9LU+iaSIYTJC0sXvF2X9It5bGeXfpN4gXl5Tqu3yDwS6jNl/PA2Ljg4nEauNU6oC6dLOLJnK6UAw4mZmMo/8u5sbuSHxscjabNUciiKYmNCXu9NA5x99iKUMzPJfYzgnjJ6BVHCzpNmSavLVS5rv6BZT7BMKeUZz7wx9161SMYGjw1aQ178id5SzS7jhmbuAaK1r3zzms6Aln5wx0xfPRKt9teYP1f/YMYwzN4+ByaODJQ8+42UqYRe0bSUyncvh9v5V9cAqG+FmAdX4UBGegpSsaWUBXyHiFlymlw6SXnUp/yzMZzTN+1k0Id0i6WHdqViHYEW3mFZlvuIivX45bZDb9wwcTvMs8FYMll0ANzizPBCmxnTRYPnH5z3vgVkkto5Lo9LzCA7ZevmWS8gye8NT+vN4AGKf19JDXkokdaKLI/WYPNYBnA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(346002)(39860400002)(376002)(230473577357003)(230373577357003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(1076003)(107886003)(26005)(83380400001)(6506007)(6666004)(2616005)(6512007)(966005)(5660300002)(4326008)(8676002)(8936002)(41300700001)(2906002)(30864003)(6486002)(478600001)(316002)(6916009)(66476007)(66556008)(66946007)(86362001)(36756003)(38100700002)(82960400001)(579004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?NHIrZVuyUYAa02AZQi7jf8DSfSRsu6uP5UXuJHAgha05JysTEk6uOmKGUW?=
 =?iso-8859-1?Q?55+EQ9seKEN5LCPCCekdtOd7HTSvo7zFy/d4glFubcE6YTDRJHLG+lzKNC?=
 =?iso-8859-1?Q?Dsa4KCZYwOYPb6gBQVSgy5AmClLlYyNccH7HLig0bIHVRwr6Ha35xWK3+a?=
 =?iso-8859-1?Q?+ksc+2XG/s9z1JDFChvo4bLqMV2e181GoaGvZlxEofGePK3ga0TUstfiFK?=
 =?iso-8859-1?Q?ZdPYKIWR/1kWD8riVLUDrVlU1fb/ZmfEXrsK/CusHX5l5fb6v/TMUG/+SY?=
 =?iso-8859-1?Q?BalOX65reZDXajZOzSXa80fVjpR5wjQFnyJ+7BFm7Zl8wceyIA37WxzE1q?=
 =?iso-8859-1?Q?a/9fjb/c+dBMhGXQRT8LfeegTyrGJzepwQSpvgVuHwkBafoJdZ7DMbFarq?=
 =?iso-8859-1?Q?35KmmM/90ssK3afLi2hdhM/cMIut2OBxKEitUeWMoQajAcQ3GwV7q+zd3p?=
 =?iso-8859-1?Q?TTNiJwB23nMyMc8x3MO2SscaiqkntmTk0WMy/79/zxb4jM/TJvgGY5nsVc?=
 =?iso-8859-1?Q?W3Zr1fBLYXM9zaqlLUPjnl3RndDAXzrpVInunR257HlciKhXVqYO2YbRiz?=
 =?iso-8859-1?Q?bIX7Pi9Z47gfFcqHBugU2tABFGKEWJ6QiYDN/x2Z4z505sVsETW7g/2Zkc?=
 =?iso-8859-1?Q?nVBOhHMeDno3SypaHt2EDTUbNnNHsYOkysvMyJz0/L9ZL2xFGoPJ27dBGJ?=
 =?iso-8859-1?Q?A9U7xcV3YX4kP4g+R/gzifC2BlLFDrfhLOR1kEtIOlp31ZhT8p+EWiVerq?=
 =?iso-8859-1?Q?6PaF1ei0Zj1mrXB34vXldY4cXo3Wt09OKBsTaPZuFAM3gYtaAFCfQ2w1fF?=
 =?iso-8859-1?Q?plb9SVp4dIplgIwWP9JSRrZm1YGWvgQW8cmntczfWHu8KXeIjCFfLQ3EQg?=
 =?iso-8859-1?Q?YaO3NXNYqoRj1rPoSVO/NmutKaItSlk//zAPB4cS3NP1Xwn0a55W3jWgd4?=
 =?iso-8859-1?Q?4RX+4CJFtYVZT5L5M32NAQb41Vnt0Fh0U3og4PdELtkjXEHkJz7ds/eHuj?=
 =?iso-8859-1?Q?8nZHtOtSdTsNdNDQSOgAOjOg8InZ4M2HKWxPm1r5XUW8i87oTnoxF4fO9X?=
 =?iso-8859-1?Q?vPaKZaXC6aidv3neVsOjFv+RDS8axNx1BQvXDvzDcGIyEZw7/IKq+HWZjd?=
 =?iso-8859-1?Q?DYU7PHFQZ1OBzleUbnCtgpDNeatEV0y4+w8+24eAEutmfXWRCVU/931/Xq?=
 =?iso-8859-1?Q?r2Gm+ZAlKOEYuQsTXXcdxVDiklm0af4SYuOMH4NS5lhht6WYEbHAiCxH0f?=
 =?iso-8859-1?Q?O7DIjxN35cLTq2QxbqaGYAR0bHpJp9VnnVnYHHnqw0pg+xzVENYsTVwuul?=
 =?iso-8859-1?Q?ENGTttozkcBwrgSkli3mTrujpwWIzsb4DVQXa86dVWeNQIox/XIIY4BE8/?=
 =?iso-8859-1?Q?l9Olc7neE76264ZeibZGO1uMt8xV+PPwmko3eHaclOvdHKmj/2sDdGt05A?=
 =?iso-8859-1?Q?9DAh9+85l1jjwIVv0mfij6kEvsKoYZo3ygLywNch7I7NQ1mIaYZ2eevuAj?=
 =?iso-8859-1?Q?5S0HJG3ijWuDCHMG1Lhi+B6F7uMl3nDwcC2wDJYez5B6/LA/BAxI0d3GLN?=
 =?iso-8859-1?Q?gHLoBLYvzW7jvYI9A5zf1amDKUJamfe4WYmxvSkcWOjFOtu2MXe/1+4Xik?=
 =?iso-8859-1?Q?UTpWd16lDlyYAHPiVVy0LUWx+Wdv88XcyXNzACnpctvRlGjQFD55QAOg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe501eb2-30c6-45a6-a2c6-08dbebc69be5
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2023 01:50:45.8828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WwXKebtG04ms56LEVSEmLGtlErZ6wbr7p+Zrc9kZFHS1IxfowM1Vo6J+bfHtm/yd1WXCtNPmelEutqPwuhGXbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5870
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 133.3% regression of adrestia.wakeup_cost_periodic_us on:


commit: 786b20ecf0796835708a6494ffed76fe38973fd2 ("sched/fair: Add trivial fair server")
https://git.kernel.org/cgit/linux/kernel/git/peterz/queue.git sched/more

testcase: adrestia
test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-4770K CPU @ 3.50GHz (Haswell) with 8G memory
parameters:

	nr_threads: 100
	cpufreq_governor: performance




If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202311222157.b9c964d9-oliver.sang@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20231122/202311222157.b9c964d9-oliver.sang@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/testcase:
  gcc-12/performance/x86_64-rhel-8.3/100/debian-11.1-x86_64-20220510.cgz/lkp-hsw-d04/adrestia

commit: 
  194600008d ("sched/timers: Explain why idle task schedules out on remote timer enqueue")
  786b20ecf0 ("sched/fair: Add trivial fair server")

194600008d5c43b5 786b20ecf0796835708a6494ffe 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      0.79            +0.5        1.30 ±  3%  mpstat.cpu.all.irq%
      0.05 ±  2%      +0.0        0.06 ±  2%  mpstat.cpu.all.soft%
      2.66            +1.0        3.69 ±  7%  mpstat.cpu.all.sys%
      0.41 ±  8%    +348.6%       1.83 ±  6%  vmstat.procs.r
    226643            -8.0%     208502 ±  7%  vmstat.system.cs
     11020          +326.7%      47019 ±  6%  vmstat.system.in
    531.95            +3.8%     551.96        adrestia.time.elapsed_time
    531.95            +3.8%     551.96        adrestia.time.elapsed_time.max
    129.17 ±  6%  +1.2e+05%     155782        adrestia.time.involuntary_context_switches
     35.00           +22.9%      43.00        adrestia.time.percent_of_cpu_this_job_got
    123.89           +35.6%     167.96        adrestia.time.system_time
     64.33           +13.9%      73.27        adrestia.time.user_time
      3.00          +133.3%       7.00        adrestia.wakeup_cost_periodic_us
      2.00           +50.0%       3.00        adrestia.wakeup_cost_single_us
     49458 ±  2%     +17.9%      58308 ±  2%  sched_debug.cfs_rq:/.avg_vruntime.avg
     33195 ±  9%     +32.7%      44061 ±  7%  sched_debug.cfs_rq:/.avg_vruntime.min
    157654 ±  4%     -17.1%     130666 ± 16%  sched_debug.cfs_rq:/.load.avg
     49458 ±  2%     +17.9%      58308 ±  2%  sched_debug.cfs_rq:/.min_vruntime.avg
     33195 ±  9%     +32.7%      44061 ±  7%  sched_debug.cfs_rq:/.min_vruntime.min
    189.15 ±  8%     -14.3%     162.11 ± 13%  sched_debug.cfs_rq:/.util_est_enqueued.max
    934011           -24.0%     710013 ±  8%  sched_debug.cpu.avg_idle.max
    291203 ±  5%     -25.9%     215697 ±  5%  sched_debug.cpu.avg_idle.stddev
      0.61 ± 18%     +38.9%       0.84 ±  9%  sched_debug.cpu.nr_running.stddev
    270288            -7.7%     249484 ±  2%  proc-vmstat.nr_active_anon
     88146            +2.7%      90498        proc-vmstat.nr_dirty_background_threshold
    176508            +2.7%     181217        proc-vmstat.nr_dirty_threshold
    942929            -2.2%     922423        proc-vmstat.nr_file_pages
    915752            +2.6%     939305        proc-vmstat.nr_free_pages
      7350            -1.5%       7243        proc-vmstat.nr_mapped
    272233            -7.7%     251332 ±  2%  proc-vmstat.nr_shmem
    270288            -7.7%     249484 ±  2%  proc-vmstat.nr_zone_active_anon
    630907            +7.1%     675519 ±  7%  proc-vmstat.pgfault
     32133            +9.2%      35105 ±  8%  proc-vmstat.pgreuse
      0.00 ± 19%    +188.0%       0.01 ± 16%  perf-sched.sch_delay.avg.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      0.01 ± 14%     +33.8%       0.01 ± 11%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.01 ± 84%    +337.1%       0.03 ± 23%  perf-sched.sch_delay.max.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      0.20 ± 75%    +169.7%       0.55 ± 13%  perf-sched.sch_delay.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
   1256572            -9.5%    1137299        perf-sched.total_wait_and_delay.count.ms
      0.16 ±  2%     +11.4%       0.17 ±  2%  perf-sched.total_wait_time.average.ms
      0.35           +25.1%       0.44 ± 12%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    492.06 ±  3%     -45.5%     268.28 ±  9%  perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
   1180518           -10.4%    1058068        perf-sched.wait_and_delay.count.pipe_read.vfs_read.ksys_read.do_syscall_64
     68.17 ± 11%     +19.1%      81.20 ±  3%  perf-sched.wait_and_delay.count.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     93.17 ± 10%     +88.5%     175.60 ± 17%  perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.95 ± 12%     +43.4%       1.36 ± 26%  perf-sched.wait_and_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.00 ± 81%  +1.5e+06%      14.50 ±187%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.35           +25.6%       0.44 ± 12%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    492.06 ±  3%     -45.5%     268.27 ±  9%  perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.00 ± 72%    +195.4%       0.01 ± 15%  perf-sched.wait_time.avg.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
      0.00 ± 50%  +1.4e+07%     209.00 ±189%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.94 ± 12%     +44.4%       1.36 ± 26%  perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    350.67           +31.5%     461.00 ±  6%  turbostat.Avg_MHz
      9.35            +3.0       12.32 ±  6%  turbostat.Busy%
  15399691           -15.6%   12996385        turbostat.C1
     52.23           -21.3       30.90 ±  7%  turbostat.C1%
   2791705           -61.2%    1083939        turbostat.C1E
      3.81            -2.2        1.57 ±  6%  turbostat.C1E%
   2176128 ±  2%     -24.0%    1654458        turbostat.C3
     15.06 ±  2%      -2.7       12.36 ±  7%  turbostat.C3%
     86071 ±  3%    +674.7%     666756        turbostat.C6
      0.98 ±  4%      +8.6        9.55 ±  8%  turbostat.C6%
    843648 ±  5%    +139.7%    2022572 ± 20%  turbostat.C7s
     18.53 ±  4%     +14.3       32.86 ± 15%  turbostat.C7s%
     75.97           -29.8%      53.33 ±  7%  turbostat.CPU%c1
      8.26 ±  4%     +24.2%      10.26 ±  7%  turbostat.CPU%c3
      0.08 ±  5%   +8438.8%       7.26 ±  8%  turbostat.CPU%c6
      6.34 ± 14%    +165.7%      16.84 ± 35%  turbostat.CPU%c7
     10.44            -7.3%       9.68 ±  7%  turbostat.CorWatt
      0.18           -11.1%       0.16        turbostat.IPC
   5951785          +361.1%   27440922        turbostat.IRQ
  44934032           +10.6%   49709311        turbostat.POLL
      2.05            +0.8        2.83 ±  8%  turbostat.POLL%
      0.98 ± 92%    +842.4%       9.19 ± 70%  turbostat.Pkg%pc2
     18.75            -9.8%      16.91 ±  7%  turbostat.PkgWatt
      1.43 ±  6%      +1.2        2.63 ± 22%  perf-stat.i.branch-miss-rate%
   5956358 ±  5%     +61.0%    9590866 ±  6%  perf-stat.i.branch-misses
    235868 ±  2%     +46.0%     344362        perf-stat.i.cache-misses
  14203663           +68.2%   23895445 ±  6%  perf-stat.i.cache-references
    227822            -8.0%     209600 ±  7%  perf-stat.i.context-switches
      2.01 ±  2%     +16.8%       2.35 ± 15%  perf-stat.i.cpi
 2.778e+09           +32.9%  3.692e+09 ±  7%  perf-stat.i.cpu-cycles
    738.99 ±  2%   +2011.9%      15606 ±  8%  perf-stat.i.cpu-migrations
     13416            -8.4%      12285 ±  7%  perf-stat.i.cycles-between-cache-misses
   1319616 ±  3%     +16.3%    1534966 ±  8%  perf-stat.i.dTLB-load-misses
 4.742e+08           +19.0%  5.643e+08 ±  6%  perf-stat.i.dTLB-loads
      0.22 ±  4%      -0.0        0.19        perf-stat.i.dTLB-store-miss-rate%
    428526 ±  3%     +15.9%     496635 ±  5%  perf-stat.i.dTLB-store-misses
 2.937e+08           +18.0%  3.466e+08 ±  7%  perf-stat.i.dTLB-stores
     37.21            +7.4       44.64 ±  8%  perf-stat.i.iTLB-load-miss-rate%
    588483            -5.8%     554231 ±  5%  perf-stat.i.iTLB-load-misses
    838092           -22.9%     646310 ±  7%  perf-stat.i.iTLB-loads
      2898           +33.9%       3880 ±  8%  perf-stat.i.instructions-per-iTLB-miss
      0.53            -8.7%       0.48 ±  5%  perf-stat.i.ipc
      0.35           +32.9%       0.46 ±  7%  perf-stat.i.metric.GHz
    146.39           +19.1%     174.29 ±  6%  perf-stat.i.metric.M/sec
      1099            -1.2%       1086        perf-stat.i.minor-faults
      1099            -1.2%       1086        perf-stat.i.page-faults
      0.13           +24.4%       0.16 ± 10%  perf-stat.overall.MPKI
      1.53 ±  4%      +0.6        2.09 ±  2%  perf-stat.overall.branch-miss-rate%
      1.56           +12.4%       1.75        perf-stat.overall.cpi
     11778            -8.9%      10732 ±  8%  perf-stat.overall.cycles-between-cache-misses
     41.25            +5.0       46.20        perf-stat.overall.iTLB-load-miss-rate%
      3025           +25.4%       3794 ±  2%  perf-stat.overall.instructions-per-iTLB-miss
      0.64           -11.0%       0.57        perf-stat.overall.ipc
   5949532 ±  5%     +61.0%    9576304 ±  6%  perf-stat.ps.branch-misses
    235587 ±  2%     +45.9%     343836        perf-stat.ps.cache-misses
  14182056           +68.2%   23854482 ±  6%  perf-stat.ps.cache-references
    227492            -8.0%     209261 ±  7%  perf-stat.ps.context-switches
 2.774e+09           +32.9%  3.686e+09 ±  7%  perf-stat.ps.cpu-cycles
    737.78 ±  2%   +2011.6%      15579 ±  8%  perf-stat.ps.cpu-migrations
   1317567 ±  3%     +16.3%    1532361 ±  8%  perf-stat.ps.dTLB-load-misses
 4.736e+08           +19.0%  5.634e+08 ±  6%  perf-stat.ps.dTLB-loads
    427865 ±  3%     +15.9%     495792 ±  5%  perf-stat.ps.dTLB-store-misses
 2.933e+08           +18.0%   3.46e+08 ±  7%  perf-stat.ps.dTLB-stores
    587599            -5.8%     553314 ±  5%  perf-stat.ps.iTLB-load-misses
    836799           -22.9%     645223 ±  7%  perf-stat.ps.iTLB-loads
      1098            -1.2%       1084        perf-stat.ps.minor-faults
      1098            -1.2%       1084        perf-stat.ps.page-faults
 9.563e+11           +27.7%  1.221e+12        perf-stat.total.instructions
     33.70 ±  8%      -9.2       24.49 ±  2%  perf-profile.calltrace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
     56.49 ±  5%      -7.4       49.06        perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
      5.77 ±  6%      -1.7        4.09 ±  5%  perf-profile.calltrace.cycles-pp.__libc_write.start_thread
      4.26 ± 37%      -1.3        2.97 ±  9%  perf-profile.calltrace.cycles-pp.__libc_read.__libc_start_main
      4.37 ±  6%      -1.2        3.19 ±  8%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__libc_write.start_thread
      4.34 ±  6%      -1.2        3.16 ±  8%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write.start_thread
      3.12 ± 37%      -1.0        2.15 ±  7%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read.__libc_start_main
      2.72 ±  9%      -0.7        2.05 ±  8%  perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write.start_thread
      1.85 ± 39%      -0.6        1.27 ± 10%  perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read.__libc_start_main
      1.45 ±  5%      -0.5        0.95 ± 12%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write.start_thread
      1.82 ± 11%      -0.4        1.43 ±  5%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read.start_thread
      1.19 ± 36%      -0.4        0.80 ±  9%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read.__libc_start_main
      1.76 ±  7%      -0.2        1.52 ±  5%  perf-profile.calltrace.cycles-pp.dequeue_entity.dequeue_task_fair.__schedule.schedule.pipe_read
      1.26 ± 16%      +0.4        1.67 ±  4%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
      1.29 ± 15%      +0.4        1.72 ±  5%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
      1.91 ± 12%      +0.6        2.54 ±  4%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      0.00            +0.6        0.64 ± 10%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.poll_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      0.37 ±103%      +0.6        1.01 ± 14%  perf-profile.calltrace.cycles-pp.select_task_rq_fair.select_task_rq.try_to_wake_up.autoremove_wake_function.__wake_up_common
      0.40 ±105%      +0.7        1.06 ± 16%  perf-profile.calltrace.cycles-pp.select_task_rq.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_sync_key
      0.00            +0.7        0.66 ± 13%  perf-profile.calltrace.cycles-pp.pick_next_task_fair.pick_task_dl.pick_next_task_dl.__schedule.schedule_idle
      0.00            +0.7        0.67 ± 21%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.raw_spin_rq_lock_nested.load_balance.newidle_balance
      0.00            +0.7        0.72 ± 18%  perf-profile.calltrace.cycles-pp._raw_spin_lock.raw_spin_rq_lock_nested.load_balance.newidle_balance.pick_next_task_fair
      0.00            +0.7        0.72 ± 10%  perf-profile.calltrace.cycles-pp.cpudl_clear.__dequeue_dl_entity.dl_server_stop.dequeue_task_fair.__schedule
      0.00            +0.7        0.73 ± 18%  perf-profile.calltrace.cycles-pp.raw_spin_rq_lock_nested.load_balance.newidle_balance.pick_next_task_fair.__schedule
      0.00            +0.8        0.75 ± 13%  perf-profile.calltrace.cycles-pp.enqueue_dl_entity.enqueue_task_fair.activate_task.ttwu_do_activate.sched_ttwu_pending
      2.07 ± 11%      +0.8        2.84 ±  5%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      0.00            +0.8        0.80 ± 11%  perf-profile.calltrace.cycles-pp.pick_task_dl.pick_next_task_dl.__schedule.schedule_idle.do_idle
      2.76 ±  7%      +0.8        3.56 ±  8%  perf-profile.calltrace.cycles-pp.__flush_smp_call_function_queue.flush_smp_call_function_queue.do_idle.cpu_startup_entry.start_secondary
      0.00            +0.9        0.86 ±  8%  perf-profile.calltrace.cycles-pp.__dequeue_dl_entity.dl_server_stop.dequeue_task_fair.__schedule.schedule
      2.55 ± 10%      +0.9        3.49 ±  4%  perf-profile.calltrace.cycles-pp.sched_ttwu_pending.__flush_smp_call_function_queue.flush_smp_call_function_queue.do_idle.cpu_startup_entry
      2.96 ±  6%      +1.0        3.99 ±  8%  perf-profile.calltrace.cycles-pp.flush_smp_call_function_queue.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
      0.00            +1.0        1.03 ± 13%  perf-profile.calltrace.cycles-pp.update_blocked_averages.newidle_balance.pick_next_task_fair.__schedule.schedule
      0.00            +1.0        1.04 ± 12%  perf-profile.calltrace.cycles-pp.hrtimer_start_range_ns.pick_next_task_dl.__schedule.schedule_idle.do_idle
      0.00            +1.1        1.08 ±  6%  perf-profile.calltrace.cycles-pp.dl_server_stop.dequeue_task_fair.__schedule.schedule.pipe_read
      1.67 ± 12%      +1.2        2.85 ±  4%  perf-profile.calltrace.cycles-pp.enqueue_task_fair.activate_task.ttwu_do_activate.sched_ttwu_pending.__flush_smp_call_function_queue
      1.76 ±  9%      +1.2        2.97 ±  5%  perf-profile.calltrace.cycles-pp.activate_task.ttwu_do_activate.sched_ttwu_pending.__flush_smp_call_function_queue.flush_smp_call_function_queue
      1.87 ± 10%      +1.2        3.10 ±  4%  perf-profile.calltrace.cycles-pp.ttwu_do_activate.sched_ttwu_pending.__flush_smp_call_function_queue.flush_smp_call_function_queue.do_idle
      2.09 ±  6%      +1.4        3.49 ±  3%  perf-profile.calltrace.cycles-pp.dequeue_task_fair.__schedule.schedule.pipe_read.vfs_read
      2.20 ± 10%      +1.9        4.08 ±  8%  perf-profile.calltrace.cycles-pp.schedule_idle.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
      2.11 ± 10%      +1.9        4.00 ±  8%  perf-profile.calltrace.cycles-pp.__schedule.schedule_idle.do_idle.cpu_startup_entry.start_secondary
      0.00            +2.2        2.23 ± 10%  perf-profile.calltrace.cycles-pp.pick_next_task_dl.__schedule.schedule_idle.do_idle.cpu_startup_entry
      0.00            +2.8        2.82 ±  6%  perf-profile.calltrace.cycles-pp.update_sg_lb_stats.update_sd_lb_stats.find_busiest_group.load_balance.newidle_balance
      0.00            +3.7        3.67 ±  9%  perf-profile.calltrace.cycles-pp.update_sd_lb_stats.find_busiest_group.load_balance.newidle_balance.pick_next_task_fair
      0.00            +3.9        3.90 ±  9%  perf-profile.calltrace.cycles-pp.find_busiest_group.load_balance.newidle_balance.pick_next_task_fair.__schedule
     19.30 ±  4%      +6.1       25.41 ±  2%  perf-profile.calltrace.cycles-pp.start_thread
      0.00            +6.2        6.16 ±  9%  perf-profile.calltrace.cycles-pp.load_balance.newidle_balance.pick_next_task_fair.__schedule.schedule
      0.00            +7.8        7.77 ±  9%  perf-profile.calltrace.cycles-pp.newidle_balance.pick_next_task_fair.__schedule.schedule.pipe_read
      0.00            +7.8        7.84 ±  8%  perf-profile.calltrace.cycles-pp.pick_next_task_fair.__schedule.schedule.pipe_read.vfs_read
     12.92 ±  4%      +7.9       20.86 ±  2%  perf-profile.calltrace.cycles-pp.__libc_read.start_thread
     10.59 ±  4%      +8.4       19.00 ±  2%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__libc_read.start_thread
     10.57 ±  4%      +8.4       18.99 ±  2%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read.start_thread
      9.61 ±  7%      +8.5       18.11 ±  3%  perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read
      8.75 ±  6%      +8.7       17.43 ±  3%  perf-profile.calltrace.cycles-pp.pipe_read.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      8.50 ±  6%      +8.9       17.40 ±  2%  perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read.start_thread
      4.38 ±  6%      +9.4       13.81 ±  3%  perf-profile.calltrace.cycles-pp.__schedule.schedule.pipe_read.vfs_read.ksys_read
      4.43 ±  6%      +9.5       13.89 ±  3%  perf-profile.calltrace.cycles-pp.schedule.pipe_read.vfs_read.ksys_read.do_syscall_64
     33.71 ±  8%      -9.2       24.49 ±  2%  perf-profile.children.cycles-pp.intel_idle
     59.40 ±  5%      -7.3       52.06        perf-profile.children.cycles-pp.cpuidle_idle_call
     56.71 ±  5%      -7.3       49.43        perf-profile.children.cycles-pp.cpuidle_enter_state
     56.72 ±  5%      -7.3       49.47        perf-profile.children.cycles-pp.cpuidle_enter
     13.10 ± 17%      -2.3       10.82 ±  5%  perf-profile.children.cycles-pp.__libc_write
      5.99 ± 14%      -1.5        4.51 ±  3%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      2.46 ± 13%      -0.9        1.58 ±  3%  perf-profile.children.cycles-pp.__entry_text_start
      2.26 ± 21%      -0.8        1.47 ±  8%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      1.01 ± 17%      -0.4        0.65 ± 14%  perf-profile.children.cycles-pp.file_update_time
      1.20 ± 13%      -0.3        0.86 ±  4%  perf-profile.children.cycles-pp.__fdget_pos
      1.13 ± 10%      -0.3        0.81 ±  5%  perf-profile.children.cycles-pp.__fget_light
      1.07 ± 17%      -0.3        0.79 ± 16%  perf-profile.children.cycles-pp.generic_update_time
      1.86 ±  5%      -0.2        1.62 ±  4%  perf-profile.children.cycles-pp.dequeue_entity
      0.74 ± 12%      -0.2        0.52 ± 15%  perf-profile.children.cycles-pp.__get_file_rcu
      0.57 ± 10%      -0.2        0.37 ± 10%  perf-profile.children.cycles-pp.__switch_to
      0.54 ± 24%      -0.2        0.34 ± 17%  perf-profile.children.cycles-pp.__mark_inode_dirty
      0.65 ± 17%      -0.2        0.45 ± 10%  perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.25 ± 31%      -0.1        0.13 ± 28%  perf-profile.children.cycles-pp.llist_reverse_order
      0.27 ± 16%      -0.1        0.17 ± 19%  perf-profile.children.cycles-pp.inode_needs_update_time
      0.23 ± 22%      -0.1        0.14 ± 35%  perf-profile.children.cycles-pp.fput
      0.15 ± 10%      -0.0        0.12 ± 10%  perf-profile.children.cycles-pp.__x64_sys_execve
      0.15 ± 10%      -0.0        0.12 ± 10%  perf-profile.children.cycles-pp.do_execveat_common
      0.01 ±223%      +0.1        0.08 ± 28%  perf-profile.children.cycles-pp.tick_check_oneshot_broadcast_this_cpu
      0.00            +0.1        0.07 ± 16%  perf-profile.children.cycles-pp.__update_load_avg_blocked_se
      0.08 ± 29%      +0.1        0.16 ± 30%  perf-profile.children.cycles-pp.wakeup_preempt
      0.08 ± 46%      +0.1        0.16 ± 20%  perf-profile.children.cycles-pp.__enqueue_entity
      0.47 ±  7%      +0.1        0.55 ± 11%  perf-profile.children.cycles-pp.update_process_times
      0.01 ±223%      +0.1        0.09 ± 21%  perf-profile.children.cycles-pp.error_entry
      0.01 ±223%      +0.1        0.10 ± 50%  perf-profile.children.cycles-pp.irqentry_enter
      0.05 ± 75%      +0.1        0.14 ± 32%  perf-profile.children.cycles-pp.ktime_get_update_offsets_now
      0.00            +0.1        0.11 ± 50%  perf-profile.children.cycles-pp.pick_next_task_stop
      0.10 ± 39%      +0.1        0.21 ± 16%  perf-profile.children.cycles-pp.__hrtimer_next_event_base
      0.02 ±223%      +0.1        0.14 ± 20%  perf-profile.children.cycles-pp.remove_entity_load_avg
      0.00            +0.1        0.12 ± 19%  perf-profile.children.cycles-pp.can_migrate_task
      0.07 ± 52%      +0.1        0.20 ± 13%  perf-profile.children.cycles-pp.do_nanosleep
      0.07 ± 52%      +0.1        0.20 ± 13%  perf-profile.children.cycles-pp.hrtimer_nanosleep
      0.07 ± 52%      +0.1        0.20 ± 13%  perf-profile.children.cycles-pp.common_nsleep
      0.46 ± 12%      +0.1        0.59 ±  9%  perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
      0.07 ± 52%      +0.1        0.21 ± 10%  perf-profile.children.cycles-pp.__x64_sys_clock_nanosleep
      0.01 ±223%      +0.1        0.15 ± 13%  perf-profile.children.cycles-pp.rb_insert_color
      0.06 ± 75%      +0.1        0.20 ±  9%  perf-profile.children.cycles-pp.migrate_task_rq_fair
      0.10 ± 32%      +0.1        0.24 ±  9%  perf-profile.children.cycles-pp.__update_idle_core
      0.00            +0.1        0.14 ± 25%  perf-profile.children.cycles-pp.select_idle_core
      0.17 ± 14%      +0.1        0.32 ± 14%  perf-profile.children.cycles-pp.put_prev_task_fair
      0.05 ± 82%      +0.1        0.20 ± 21%  perf-profile.children.cycles-pp.tick_irq_enter
      0.05 ± 73%      +0.2        0.21 ± 18%  perf-profile.children.cycles-pp.put_prev_entity
      0.33 ± 25%      +0.2        0.49 ±  6%  perf-profile.children.cycles-pp.__x86_indirect_thunk_rax
      0.26 ± 19%      +0.2        0.42 ± 22%  perf-profile.children.cycles-pp.update_rq_clock
      0.00            +0.2        0.16 ± 27%  perf-profile.children.cycles-pp.task_h_load
      0.10 ± 26%      +0.2        0.28 ± 15%  perf-profile.children.cycles-pp.pick_next_task_idle
      0.76 ±  5%      +0.2        0.94        perf-profile.children.cycles-pp.native_sched_clock
      0.08 ± 50%      +0.2        0.26 ± 11%  perf-profile.children.cycles-pp.set_task_cpu
      0.06 ± 82%      +0.2        0.25 ± 19%  perf-profile.children.cycles-pp.irq_enter_rcu
      0.07 ± 53%      +0.2        0.27 ± 21%  perf-profile.children.cycles-pp.update_irq_load_avg
      0.00            +0.2        0.21 ± 18%  perf-profile.children.cycles-pp.__remove_hrtimer
      0.01 ±223%      +0.2        0.22 ± 21%  perf-profile.children.cycles-pp.rb_erase
      0.01 ±223%      +0.2        0.22 ± 17%  perf-profile.children.cycles-pp.hrtimer_update_next_event
      0.00            +0.2        0.23 ± 26%  perf-profile.children.cycles-pp.update_sd_pick_busiest
      0.04 ±107%      +0.2        0.28 ± 19%  perf-profile.children.cycles-pp.timerqueue_del
      0.00            +0.3        0.25 ± 25%  perf-profile.children.cycles-pp.hrtick_start
      0.10 ± 52%      +0.3        0.37 ± 21%  perf-profile.children.cycles-pp.irqtime_account_irq
      0.41 ± 10%      +0.3        0.68 ±  5%  perf-profile.children.cycles-pp.sched_clock
      0.06 ± 81%      +0.3        0.34 ± 22%  perf-profile.children.cycles-pp.wake_affine
      0.00            +0.3        0.27 ± 25%  perf-profile.children.cycles-pp.irqentry_exit_to_user_mode
      0.13 ± 24%      +0.3        0.41 ± 16%  perf-profile.children.cycles-pp.native_irq_return_iret
      0.03 ±141%      +0.3        0.33 ±  8%  perf-profile.children.cycles-pp.idle_cpu
      0.01 ±223%      +0.3        0.31 ± 16%  perf-profile.children.cycles-pp.select_idle_cpu
      0.01 ±223%      +0.3        0.34 ± 18%  perf-profile.children.cycles-pp.task_tick_fair
      0.47 ± 12%      +0.4        0.82 ±  7%  perf-profile.children.cycles-pp.sched_clock_cpu
      0.04 ±111%      +0.4        0.40 ± 11%  perf-profile.children.cycles-pp.timerqueue_add
      0.00            +0.4        0.37 ±  8%  perf-profile.children.cycles-pp.hrtimer_try_to_cancel
      0.26 ± 27%      +0.4        0.65 ± 10%  perf-profile.children.cycles-pp.update_rq_clock_task
      0.11 ± 26%      +0.4        0.51 ±  8%  perf-profile.children.cycles-pp.__sysvec_call_function_single
      0.00            +0.4        0.41 ± 18%  perf-profile.children.cycles-pp._find_next_and_bit
      0.05 ± 76%      +0.4        0.48 ±  9%  perf-profile.children.cycles-pp.cpu_util
      0.07 ± 52%      +0.4        0.51 ± 10%  perf-profile.children.cycles-pp.enqueue_hrtimer
      0.00            +0.4        0.44 ±  7%  perf-profile.children.cycles-pp.detach_tasks
      0.14 ± 31%      +0.4        0.59 ±  6%  perf-profile.children.cycles-pp.sysvec_call_function_single
      0.57 ± 39%      +0.5        1.03 ± 13%  perf-profile.children.cycles-pp.select_task_rq_fair
      0.11 ± 31%      +0.5        0.57 ± 16%  perf-profile.children.cycles-pp.__update_blocked_fair
      0.00            +0.5        0.46 ± 14%  perf-profile.children.cycles-pp.task_contending
      0.61 ± 41%      +0.5        1.08 ± 15%  perf-profile.children.cycles-pp.select_task_rq
      0.00            +0.5        0.47 ± 10%  perf-profile.children.cycles-pp.cpudl_set
      1.43 ± 11%      +0.5        1.92 ±  6%  perf-profile.children.cycles-pp.update_load_avg
      0.87 ±  6%      +0.5        1.38 ± 14%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      0.65 ± 25%      +0.5        1.17 ± 12%  perf-profile.children.cycles-pp.ktime_get
      0.18 ± 25%      +0.5        0.70 ±  6%  perf-profile.children.cycles-pp.asm_sysvec_call_function_single
      0.00            +0.6        0.55 ± 13%  perf-profile.children.cycles-pp.exit_to_user_mode_loop
      0.00            +0.6        0.57 ± 13%  perf-profile.children.cycles-pp.hrtick
      0.52 ± 12%      +0.6        1.10 ± 11%  perf-profile.children.cycles-pp.exit_to_user_mode_prepare
      0.00            +0.6        0.62 ± 16%  perf-profile.children.cycles-pp.cpupri_set
      0.54 ± 16%      +0.6        1.18 ± 12%  perf-profile.children.cycles-pp.finish_task_switch
      0.00            +0.7        0.74 ± 10%  perf-profile.children.cycles-pp.cpudl_clear
      0.00            +0.9        0.89 ±  6%  perf-profile.children.cycles-pp.__dequeue_dl_entity
      1.26 ± 16%      +1.0        2.22 ±  4%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.00            +1.0        1.00 ± 16%  perf-profile.children.cycles-pp.raw_spin_rq_lock_nested
      0.11 ± 50%      +1.0        1.12 ±  9%  perf-profile.children.cycles-pp.lapic_next_deadline
      0.00            +1.0        1.03 ± 20%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      0.00            +1.1        1.06 ±  6%  perf-profile.children.cycles-pp.enqueue_dl_entity
      0.45 ± 15%      +1.1        1.52 ± 14%  perf-profile.children.cycles-pp._raw_spin_lock
      0.00            +1.1        1.08 ±  8%  perf-profile.children.cycles-pp.pick_task_dl
      0.18 ± 17%      +1.1        1.25 ± 12%  perf-profile.children.cycles-pp.update_blocked_averages
      0.00            +1.1        1.11 ±  6%  perf-profile.children.cycles-pp.dl_server_stop
      3.37            +1.2        4.55 ±  5%  perf-profile.children.cycles-pp.flush_smp_call_function_queue
      3.26 ±  2%      +1.2        4.47 ±  6%  perf-profile.children.cycles-pp.__flush_smp_call_function_queue
      0.00            +1.3        1.28 ± 11%  perf-profile.children.cycles-pp.__hrtimer_start_range_ns
      2.82 ±  5%      +1.4        4.21 ±  5%  perf-profile.children.cycles-pp.sched_ttwu_pending
      0.14 ± 47%      +1.4        1.57 ±  5%  perf-profile.children.cycles-pp.clockevents_program_event
      2.14 ±  5%      +1.6        3.71 ±  3%  perf-profile.children.cycles-pp.dequeue_task_fair
      2.28 ±  8%      +1.7        3.94 ±  6%  perf-profile.children.cycles-pp.ttwu_do_activate
      2.04 ± 10%      +1.7        3.75 ±  6%  perf-profile.children.cycles-pp.enqueue_task_fair
      2.14 ±  8%      +1.8        3.91 ±  7%  perf-profile.children.cycles-pp.activate_task
      1.56 ± 14%      +1.9        3.49 ±  3%  perf-profile.children.cycles-pp.hrtimer_interrupt
      1.60 ± 14%      +2.0        3.58 ±  4%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.00            +2.0        2.02 ± 10%  perf-profile.children.cycles-pp.hrtimer_start_range_ns
      2.57 ±  7%      +2.2        4.75 ±  6%  perf-profile.children.cycles-pp.schedule_idle
      2.36 ±  8%      +2.5        4.87        perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.00            +2.9        2.89 ± 11%  perf-profile.children.cycles-pp.pick_next_task_dl
      0.08 ± 54%      +3.0        3.03 ±  7%  perf-profile.children.cycles-pp.update_sg_lb_stats
      2.56 ±  8%      +3.5        6.11 ±  2%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.14 ± 33%      +3.7        3.89 ±  9%  perf-profile.children.cycles-pp.update_sd_lb_stats
      0.16 ± 27%      +4.0        4.14 ±  9%  perf-profile.children.cycles-pp.find_busiest_group
     24.91 ± 10%      +6.0       30.91        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     24.68 ± 10%      +6.1       30.77        perf-profile.children.cycles-pp.do_syscall_64
     19.30 ±  4%      +6.1       25.41 ±  2%  perf-profile.children.cycles-pp.start_thread
      0.22 ± 16%      +6.3        6.48 ±  9%  perf-profile.children.cycles-pp.load_balance
     17.36 ±  7%      +6.7       24.03 ±  3%  perf-profile.children.cycles-pp.__libc_read
      1.26 ± 17%      +7.8        9.02 ±  7%  perf-profile.children.cycles-pp.pick_next_task_fair
      0.26 ± 38%      +7.8        8.03 ±  8%  perf-profile.children.cycles-pp.newidle_balance
     10.48 ±  7%      +8.3       18.78 ±  3%  perf-profile.children.cycles-pp.ksys_read
      9.72 ±  7%      +8.5       18.22 ±  3%  perf-profile.children.cycles-pp.vfs_read
      8.86 ±  7%      +8.7       17.53 ±  2%  perf-profile.children.cycles-pp.pipe_read
      4.54 ±  6%     +10.1       14.65 ±  3%  perf-profile.children.cycles-pp.schedule
      6.94 ±  3%     +12.5       19.42 ±  3%  perf-profile.children.cycles-pp.__schedule
     33.70 ±  8%      -9.2       24.48 ±  2%  perf-profile.self.cycles-pp.intel_idle
      5.41 ± 14%      -1.9        3.56 ±  4%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      2.16 ± 11%      -0.8        1.35 ±  5%  perf-profile.self.cycles-pp.__entry_text_start
      2.16 ± 22%      -0.7        1.41 ±  9%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.73 ± 11%      -0.2        0.49 ± 12%  perf-profile.self.cycles-pp.__get_file_rcu
      0.54 ± 24%      -0.2        0.33 ± 18%  perf-profile.self.cycles-pp.__mark_inode_dirty
      0.56 ± 10%      -0.2        0.35 ±  9%  perf-profile.self.cycles-pp.__switch_to
      0.46 ± 20%      -0.1        0.32 ± 10%  perf-profile.self.cycles-pp.vfs_write
      0.36 ± 23%      -0.1        0.22 ± 32%  perf-profile.self.cycles-pp.__pthread_disable_asynccancel
      0.35 ± 19%      -0.1        0.22 ± 14%  perf-profile.self.cycles-pp.reweight_entity
      0.24 ± 32%      -0.1        0.13 ± 28%  perf-profile.self.cycles-pp.llist_reverse_order
      0.27 ± 30%      -0.1        0.17 ± 32%  perf-profile.self.cycles-pp.mnt_get_write_access
      0.26 ± 21%      -0.1        0.16 ± 35%  perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.38 ± 22%      -0.1        0.28 ± 20%  perf-profile.self.cycles-pp.__fget_light
      0.21 ± 21%      -0.1        0.12 ± 32%  perf-profile.self.cycles-pp.fput
      0.13 ± 34%      -0.1        0.07 ± 39%  perf-profile.self.cycles-pp.schedule_idle
      0.09 ± 29%      -0.0        0.05 ± 14%  perf-profile.self.cycles-pp.cpu_startup_entry
      0.00            +0.1        0.06 ± 23%  perf-profile.self.cycles-pp.__remove_hrtimer
      0.01 ±223%      +0.1        0.08 ± 31%  perf-profile.self.cycles-pp.tick_check_oneshot_broadcast_this_cpu
      0.00            +0.1        0.07 ± 28%  perf-profile.self.cycles-pp.hrtimer_update_next_event
      0.00            +0.1        0.07 ± 18%  perf-profile.self.cycles-pp.__dequeue_dl_entity
      0.00            +0.1        0.07 ± 16%  perf-profile.self.cycles-pp.__update_load_avg_blocked_se
      0.08 ± 46%      +0.1        0.16 ± 19%  perf-profile.self.cycles-pp.__enqueue_entity
      0.01 ±223%      +0.1        0.09 ± 25%  perf-profile.self.cycles-pp.error_entry
      0.09 ± 28%      +0.1        0.17 ±  8%  perf-profile.self.cycles-pp.__update_idle_core
      0.05 ± 71%      +0.1        0.14 ± 31%  perf-profile.self.cycles-pp.sched_clock_cpu
      0.00            +0.1        0.09 ± 54%  perf-profile.self.cycles-pp.pick_next_task_stop
      0.00            +0.1        0.09 ± 29%  perf-profile.self.cycles-pp.detach_tasks
      0.00            +0.1        0.10 ± 26%  perf-profile.self.cycles-pp.can_migrate_task
      0.00            +0.1        0.10 ± 38%  perf-profile.self.cycles-pp.enqueue_hrtimer
      0.10 ± 30%      +0.1        0.20 ± 15%  perf-profile.self.cycles-pp.__hrtimer_next_event_base
      0.00            +0.1        0.12 ± 41%  perf-profile.self.cycles-pp.hrtimer_start_range_ns
      0.03 ±100%      +0.1        0.16 ± 23%  perf-profile.self.cycles-pp.hrtimer_interrupt
      0.01 ±223%      +0.1        0.14 ±  6%  perf-profile.self.cycles-pp.rb_insert_color
      0.00            +0.1        0.14 ± 12%  perf-profile.self.cycles-pp.update_blocked_averages
      0.03 ±144%      +0.1        0.17 ± 33%  perf-profile.self.cycles-pp.irqtime_account_irq
      0.00            +0.1        0.14 ± 18%  perf-profile.self.cycles-pp.pick_next_task_dl
      0.43 ± 15%      +0.1        0.58 ± 11%  perf-profile.self.cycles-pp.__update_load_avg_cfs_rq
      0.00            +0.2        0.15 ± 12%  perf-profile.self.cycles-pp.clockevents_program_event
      0.30 ± 26%      +0.2        0.45 ± 11%  perf-profile.self.cycles-pp.__x86_indirect_thunk_rax
      0.00            +0.2        0.16 ± 29%  perf-profile.self.cycles-pp.task_h_load
      0.20 ± 40%      +0.2        0.36 ± 18%  perf-profile.self.cycles-pp.newidle_balance
      0.04 ±102%      +0.2        0.21 ± 22%  perf-profile.self.cycles-pp.__hrtimer_run_queues
      0.73 ±  6%      +0.2        0.90 ±  2%  perf-profile.self.cycles-pp.native_sched_clock
      0.44 ± 14%      +0.2        0.62 ±  8%  perf-profile.self.cycles-pp._raw_spin_lock
      0.07 ± 53%      +0.2        0.25 ± 23%  perf-profile.self.cycles-pp.update_irq_load_avg
      0.01 ±223%      +0.2        0.21 ± 24%  perf-profile.self.cycles-pp.rb_erase
      0.14 ± 46%      +0.2        0.34 ± 14%  perf-profile.self.cycles-pp.ktime_get
      0.05 ± 74%      +0.2        0.26 ± 18%  perf-profile.self.cycles-pp.__update_blocked_fair
      0.00            +0.2        0.21 ± 27%  perf-profile.self.cycles-pp.enqueue_dl_entity
      0.00            +0.2        0.22 ± 27%  perf-profile.self.cycles-pp.find_busiest_group
      0.00            +0.2        0.23 ± 16%  perf-profile.self.cycles-pp.cpudl_set
      0.00            +0.2        0.23 ± 26%  perf-profile.self.cycles-pp.update_sd_pick_busiest
      0.41 ± 15%      +0.2        0.65 ± 12%  perf-profile.self.cycles-pp.cpuidle_enter_state
      0.00            +0.2        0.24 ± 42%  perf-profile.self.cycles-pp.__hrtimer_start_range_ns
      0.20 ± 40%      +0.3        0.46 ± 13%  perf-profile.self.cycles-pp.update_rq_clock_task
      0.01 ±223%      +0.3        0.27 ± 18%  perf-profile.self.cycles-pp.timerqueue_add
      0.13 ± 24%      +0.3        0.40 ± 17%  perf-profile.self.cycles-pp.native_irq_return_iret
      0.03 ±143%      +0.3        0.32 ±  8%  perf-profile.self.cycles-pp.idle_cpu
      0.00            +0.3        0.34 ± 12%  perf-profile.self.cycles-pp.cpudl_clear
      0.00            +0.4        0.36 ± 19%  perf-profile.self.cycles-pp._find_next_and_bit
      0.49 ± 22%      +0.4        0.86 ± 19%  perf-profile.self.cycles-pp.update_load_avg
      0.05 ± 78%      +0.4        0.47 ±  8%  perf-profile.self.cycles-pp.cpu_util
      0.00            +0.4        0.44 ± 18%  perf-profile.self.cycles-pp.load_balance
      0.00            +0.6        0.61 ± 16%  perf-profile.self.cycles-pp.cpupri_set
      0.01 ±223%      +0.6        0.63 ± 16%  perf-profile.self.cycles-pp.update_sd_lb_stats
      0.10 ± 49%      +1.0        1.09 ±  8%  perf-profile.self.cycles-pp.lapic_next_deadline
      0.00            +1.0        1.03 ± 20%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      0.04 ±143%      +2.0        2.01 ± 10%  perf-profile.self.cycles-pp.update_sg_lb_stats




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

