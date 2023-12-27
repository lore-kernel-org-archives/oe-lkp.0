Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EB55668
	for <oe-lkp@lists.linux.dev>; Wed, 27 Dec 2023 07:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I4gXPrhH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703663686; x=1735199686;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=7RUBC+w2PSKy6YofPNWsFIqep5U3uh+IBubesodm4eU=;
  b=I4gXPrhHzg8wkrcWl8ZmXNgEIqPyDkI1DZSNnu00fp7INn1g2pED+Zat
   y8RYwuXBd/poBcP+M22UAhOjDDZlTgV7HlFoa/uOjwquVB65VQMO39pM5
   ssH3QkNF54Mo2CsKzu3BT0Q/eFmcWpADRi12s4y0pNVe4oF0gpf/C5coT
   lZg2GHQmo72FaOqCaXmlyzmKo2erM5Tg3+7HTWEbqWARi6l+iOZnU+V/Z
   8+hug0ny6R0Gf/ZlEGk8ULCFYIBiGaJ3TNW9QsN0ViRwu/EIT6egIepVY
   CV/x2NbLjrJ5YHHEp95cfB8ageH+jwHfVl3scSmljOoNxyHR1C53aEyWc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="393578191"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; 
   d="scan'208";a="393578191"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2023 23:54:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="1025333086"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; 
   d="scan'208";a="1025333086"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 26 Dec 2023 23:54:42 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Dec 2023 23:54:41 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 26 Dec 2023 23:54:41 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Dec 2023 23:54:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DbjyhVnQReDEFcE5IFq8sNyZGuTnx4dLlxDPmDjsDbZ0MFNphg42PIQy33PNoozt6Wm7Y2YS0M0Ll3f2hKPJTTirX7mPcHJ8OQL+IvLnH86W6pVkRehTBWMAIBxePX4pI1iS2bsIqDRKdKyo+IlDJG6qjzGlpFZBvQOcUnEDyWz7sNAfO/bYc/AJqLsAmtyqj905qSjwWrdpIaOgdwYhMuU7AXhH9Opnw15r2viMri4ExYXZqUk1e8K3GOrjaL/HvorkCstpOcGkq8+aTeuJ/nW0m+lMx39f/jhss/6j9mj3iICp2ywX6F2pyAEtRejjYnVWCS4Qejye3MLc9X0YGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tb94mEjJmcaSa1ZBqLa+8SYT71rJZvnk20p2ZG7DDl4=;
 b=aNWmsgyoYH1P16Krs92ZM7p78ZbkyKpGrRHGUMoDr++uNgCzJFCHCOW8vLlfKAVyNAm9U53gpaJXPy2A9qjw5XHHykCJlWRf9GlwWDRxrarlQ+j/PblOELg+b0R8RPrXiqyrZokUdoT7eyl6VP0+hdvJH/BJS4cpQ2GE5t7DvcatO09SFp4zjjJh4SI/Go7ZXC0OVkSmkXB3K+i7+cKWUQw51RC5kX9yHP1g+3j3b6C8QR5Gio3xKoC5dhlbI9+9h0ksi2tIAIrRG3Np2ep68+4c8aM9xuf5XlAbgHH3D4WCgaRKEQPdIzvmDrbU3luVSCIk3E/Xmwhh6zu03Wv4qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH7PR11MB8549.namprd11.prod.outlook.com (2603:10b6:510:308::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Wed, 27 Dec
 2023 07:54:33 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::1236:9a2e:5acd:a7f]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::1236:9a2e:5acd:a7f%3]) with mapi id 15.20.7113.027; Wed, 27 Dec 2023
 07:54:33 +0000
Date: Wed, 27 Dec 2023 15:54:26 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Christoph Hellwig <hch@lst.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Christoph Hellwig <hch@lst.de>,
	<oliver.sang@intel.com>
Subject: [hch-misc:btrfs-holder] [btrfs]  725d94495f:
 filebench.sum_operations/s -15.1% regression
Message-ID: <202312271509.dd34d32a-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0027.apcprd02.prod.outlook.com
 (2603:1096:4:195::14) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH7PR11MB8549:EE_
X-MS-Office365-Filtering-Correlation-Id: 16af8b7b-924f-4c56-ff84-08dc06b1105c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fO8VeQWheSEYKCkF2HD9nDUK+3VvXSRACzdrBvUzbGqqYz6DV6f1grsEU63jD9yEX7ROIuM1abD79BY09qW3QfXTg8OsPRLHGaMqveItieWRUbDx1Uxi1LizJkD8gC5xABkAxpBnBlq/fQxMsY2UezxVrfGfTHHLJCiZfcwGUO+2as2EopsEekA0e7CaMfVd95lcevIiPUGhECy+rzt7+jQ7WPCT48uEC+u14cfxqZJ90+vda4kXOj115BZLrb/nams+Z4RFEQDaBro3hXMvsXF5kdzWt2JjHeU0G5BY2zX7nT/5rO3NHZXOM+ipQuHpYZbMf1zLmRdxrLxrrWKPlHVQXLctfWZIue/6ZAFY+EeexFwt0Cg6Vw1v8iqLDqmlrkDA0UOyPM2qlCeqgk4f2W7UThmm7nMC6FfMhhE/xCfHsA5JzwsnmgS6zKYu04417tRovhtlTM1lVyf7UB83pL886/JCHUpP2SVViKjrKDxAMJuRBcWCifIBdLt19trCcHUNyiEdjjw1ISBC4YX8TgF+gLMRDgVhogsj+j12q3Qjr47xjtjpBp0iAqHg5iQLffwVZhoiy7TtHRpTsO03hUZEgcBSIxyJX95Gp2Ith0WDFZqDyYLfyGsa3BTxnUWMHTVoiWv2mlVYmaSTtQ4rBQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(396003)(136003)(39860400002)(230473577357003)(230373577357003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(36756003)(6916009)(6512007)(6666004)(6506007)(966005)(66946007)(66556008)(66476007)(6486002)(86362001)(38100700002)(107886003)(26005)(82960400001)(1076003)(83380400001)(41300700001)(2616005)(5660300002)(2906002)(478600001)(8936002)(4326008)(316002)(8676002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?3hhsIindxgpBm6fglymCKxwa6xxA8/xG87hPEjnjxpjN4PE6J6zCdz+bNz?=
 =?iso-8859-1?Q?KnCEA8jv0boQhsguJAPWX/Dw17kBi7HjkAvjrfwEeoMcDICfN7oelc0NcM?=
 =?iso-8859-1?Q?YO3TgJGo2k0JqkErAXvD9T4+wC/KLi58iH9hCWFKL5nwAZEa2Yr3/iJR5u?=
 =?iso-8859-1?Q?EdCK6MTF+FibcVjYhDbvDjuUVVl4IjpbsAwTOs8YGMnbopMF643Ya7v8mG?=
 =?iso-8859-1?Q?3A+6kZOKl3KoQM0GeP1B415A7eEzymdmi96w4Yc59OelZXmJf8IWvj3M1H?=
 =?iso-8859-1?Q?ePGDiYhgsTJQAaaD9O0sZVMmlnjm9gB0yGExT/khWLsfo8UY/3Qwp0wFK6?=
 =?iso-8859-1?Q?j6tSaOgVOLyYhXkUN7/w7/TPWeY/55xbLb0jps/sShKeUWOqq3ZRXGsyl9?=
 =?iso-8859-1?Q?i/kQoJaATfaEl8j80ps7lhbwlQP/LvjKKMTrIDLdVKVnK3gCFDnpyc4Wg/?=
 =?iso-8859-1?Q?VcfJ5zjnZ2AXnDZCN5aR1jqOPpU0kz2TOaspnMUUX1jvQV8V0NAAoYfzjn?=
 =?iso-8859-1?Q?eQ6Xn7zFZsjNjjyIo1xM1KvuK47BJkDh0zrN8H8d5p9/W3va7WYsLgMbN5?=
 =?iso-8859-1?Q?r05SEhWIGEoq3NSWsVVBLDyGIxI3m5Bb3Kgy8MtvDZHwJFSj+zJ5lgawdy?=
 =?iso-8859-1?Q?cwsRImDt8daDPpERPXLcv+i5DPoG+BRINy9XNkbogujmyzwZPSPjWH2/F3?=
 =?iso-8859-1?Q?0o1ov0/+s1E15o8AKUlLd45rzqxpTjHKkm+V4D33vb7YzR5yN10QHrbRFA?=
 =?iso-8859-1?Q?i8Udln/gjQDYMdVtgW+B8ZyVC04xO5mMnjX2gteAsJ3zUe7yostx60ud6j?=
 =?iso-8859-1?Q?7nZNUd4n/YzWpRl4sdSs7OH+xYwVr7+hBy6RQ0AuYa8i8UMwUfIu+60DAO?=
 =?iso-8859-1?Q?HgXpzKuUh7cpItY+3YUp9gaUKZ7wS2ocGKC/o5lY0hhLpVwUaEhK//LdIq?=
 =?iso-8859-1?Q?yH1aj8j7kqjdc3TKsifzvhZxT5CbzKQ7Hin04BxF2hKg7PW8C0zPScb/2f?=
 =?iso-8859-1?Q?y9zOg0stZYlNqTX9NBkvQBvsz70qr/1Dvg9EfiJHeNgcdWIEDM31sB3/4z?=
 =?iso-8859-1?Q?JEjTPQq6wIWUEiGNWotJ1lkrGey1iOfuSIydRBcp2eA6X8NcaWhhhz5hDU?=
 =?iso-8859-1?Q?Ljz9c+tt3EeKVjlcVBNAlfeetq5a7+XOugi41sjxOBzd3U7SsOBbI73ZoJ?=
 =?iso-8859-1?Q?e88p6NIp9Ho0FN6QwAAn6CcEmACZ2wy5Mc9WO6RhjooMRMYRj8fxH2UOpD?=
 =?iso-8859-1?Q?53fe+FU9Ld0eJglbBPhSSUVi/Sm1EIkAemhjpJhGELjIvEiOZn26toMxYu?=
 =?iso-8859-1?Q?HiK6zJATwiyz5Kc9EDCFovIwwF/OR4zT3fH3KqMH4+BNspLBjCB4cSrST2?=
 =?iso-8859-1?Q?Pl3iOf7w19/WQKwcdew72LgXq3DwKgoUxZFWkiecwd8F12hnlDybLKTu6h?=
 =?iso-8859-1?Q?Xej/Q1KgdJGkmqIzX+oe4borXutvgh7uMXnGG4MHf/4/tZJFB/cHP5zhhr?=
 =?iso-8859-1?Q?pLIByVTXhWKK7BrldshSYeNgE6z0sE0z5SygM3g5ZpPtQ/72B7914J2TNq?=
 =?iso-8859-1?Q?v8EIvDVTDpP6To90kPSpVy6880hM4J5pJYjqDdfvpWgOevpRU3J3wqi+S1?=
 =?iso-8859-1?Q?gWU3/Kjt1A8nGM3BWNsW1FQHHGADF4hkfcri9CUz6GwEVxs+TZQLmuHg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 16af8b7b-924f-4c56-ff84-08dc06b1105c
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2023 07:54:33.4626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fB+ERgKJQefb3XndFqrSeo9f5pcFk6KA3FcQntRhZzVVOHT1826QDnHHSTHiSpHuHXltW5IYBahfeiDYJTf1MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8549
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a -15.1% regression of filebench.sum_operations/s on:


commit: 725d94495f851bdc4c6ea41a81059cecf046baba ("btrfs: open block devices after superblock creation")
git://git.infradead.org/users/hch/misc.git btrfs-holder

testcase: filebench
test machine: 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz (Ice Lake) with 128G memory
parameters:

	disk: 1HDD
	fs: btrfs
	test: varmail.f
	cpufreq_governor: performance




If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202312271509.dd34d32a-oliver.sang@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20231227/202312271509.dd34d32a-oliver.sang@intel.com

=========================================================================================
compiler/cpufreq_governor/disk/fs/kconfig/rootfs/tbox_group/test/testcase:
  gcc-12/performance/1HDD/btrfs/x86_64-rhel-8.3/debian-11.1-x86_64-20220510.cgz/lkp-icl-2sp6/varmail.f/filebench

commit: 
  c1c32aea10 ("btrfs: split btrfs_fs_devices.opened")
  725d94495f ("btrfs: open block devices after superblock creation")

c1c32aea10f1b9f6 725d94495f851bdc4c6ea41a810 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      0.94 ±  3%     +49.1%       1.40 ±  7%  iostat.cpu.iowait
      0.96 ±  3%      +0.5        1.44 ±  7%  mpstat.cpu.all.iowait%
      2.59 ± 43%      +2.3        4.85 ± 31%  perf-profile.calltrace.cycles-pp.exc_page_fault.asm_exc_page_fault
      4823           -10.9%       4297        vmstat.system.cs
      1.59 ±  2%      +0.4        1.97 ±  6%  turbostat.C1E%
      6.57           +11.5%       7.32 ±  2%  turbostat.CPU%c1
     64940 ±  2%      -9.6%      58678        meminfo.Active
     52819 ±  2%     -10.2%      47457        meminfo.Active(file)
      1743 ±  4%     +11.3%       1940 ±  5%  meminfo.Dirty
     31004           +23.4%      38251 ±  3%  meminfo.Inactive(file)
      4.42 ±  5%     -28.2%       3.18 ±  3%  filebench.sum_bytes_mb/s
     71208           -15.1%      60438        filebench.sum_operations
      1186           -15.1%       1007        filebench.sum_operations/s
    182.50           -15.1%     154.88        filebench.sum_reads/s
     13.47           +17.8%      15.86        filebench.sum_time_ms/op
    182.88           -15.1%     155.25        filebench.sum_writes/s
     75322           -21.3%      59275 ±  2%  filebench.time.voluntary_context_switches
      0.84 ±  2%      -8.5%       0.77 ±  7%  perf-stat.i.MPKI
      4616           -11.8%       4072        perf-stat.i.context-switches
    421745            -2.3%     412114        perf-stat.i.dTLB-store-misses
     46188 ±  4%     -12.4%      40456 ±  4%  perf-stat.i.node-loads
     93704 ±  9%     -21.0%      73989 ± 18%  perf-stat.i.node-store-misses
      0.66 ±  2%      -8.7%       0.60 ±  5%  perf-stat.overall.MPKI
     36.93 ±  9%      -7.3       29.61 ± 16%  perf-stat.overall.node-store-miss-rate%
      4541           -11.8%       4005        perf-stat.ps.context-switches
    414759            -2.3%     405225        perf-stat.ps.dTLB-store-misses
     45384 ±  4%     -12.4%      39776 ±  4%  perf-stat.ps.node-loads
     92192 ±  9%     -21.0%      72796 ± 18%  perf-stat.ps.node-store-misses
      3031 ±  3%      -7.4%       2806        proc-vmstat.nr_active_anon
     13205 ±  2%     -10.2%      11864        proc-vmstat.nr_active_file
    435.57 ±  4%     +11.4%     485.19 ±  5%  proc-vmstat.nr_dirty
      7751           +23.4%       9563 ±  3%  proc-vmstat.nr_inactive_file
     14743            -1.4%      14543        proc-vmstat.nr_shmem
      3031 ±  3%      -7.4%       2806        proc-vmstat.nr_zone_active_anon
     13205 ±  2%     -10.2%      11864        proc-vmstat.nr_zone_active_file
      7751           +23.4%       9563 ±  3%  proc-vmstat.nr_zone_inactive_file
    692733            -1.2%     684561        proc-vmstat.numa_hit
     40492 ±  5%     -15.3%      34310 ±  2%  proc-vmstat.pgactivate
    794319            -1.8%     780215        proc-vmstat.pgalloc_normal
    651378 ±  4%      -4.4%     622805        proc-vmstat.pgfree
      0.04 ±  9%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.schedule_timeout.btrfs_sync_log.btrfs_sync_file.__x64_sys_fsync
      0.23 ± 19%    -100.0%       0.00        perf-sched.sch_delay.max.ms.schedule_timeout.btrfs_sync_log.btrfs_sync_file.__x64_sys_fsync
     92.35 ±  4%     +12.2%     103.60        perf-sched.total_wait_and_delay.average.ms
     13285 ±  5%     -12.1%      11684        perf-sched.total_wait_and_delay.count.ms
     92.32 ±  4%     +12.2%     103.56        perf-sched.total_wait_time.average.ms
      6.35 ± 43%    +130.7%      14.65 ± 14%  perf-sched.wait_and_delay.avg.ms.btrfs_start_ordered_extent.btrfs_wait_ordered_range.btrfs_sync_file.__x64_sys_fsync
     53.52 ±  4%     +19.3%      63.83 ±  7%  perf-sched.wait_and_delay.avg.ms.futex_wait_queue.__futex_wait.futex_wait.do_futex
     17.74 ± 12%     +20.8%      21.44 ±  7%  perf-sched.wait_and_delay.avg.ms.io_schedule.folio_wait_bit_common.folio_wait_writeback.__filemap_fdatawait_range
     32.87 ±  5%     -25.3%      24.55        perf-sched.wait_and_delay.avg.ms.io_schedule.folio_wait_bit_common.write_all_supers.btrfs_sync_log
      5.13 ± 24%     +78.3%       9.15 ± 33%  perf-sched.wait_and_delay.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.__btrfs_tree_lock
     10.28 ± 29%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.schedule_timeout.btrfs_sync_log.btrfs_sync_file.__x64_sys_fsync
      0.29 ± 24%    +117.8%       0.63 ± 32%  perf-sched.wait_and_delay.avg.ms.wait_log_commit.btrfs_sync_log.btrfs_sync_file.__x64_sys_fsync
    391.38 ±  6%     -14.8%     333.62        perf-sched.wait_and_delay.count.btrfs_start_ordered_extent.btrfs_wait_ordered_range.btrfs_sync_file.__x64_sys_fsync
    662.38 ±  9%     -24.7%     498.50 ± 14%  perf-sched.wait_and_delay.count.futex_wait_queue.__futex_wait.futex_wait.do_futex
     77.75 ±  4%     +24.9%      97.12        perf-sched.wait_and_delay.count.io_schedule.folio_wait_bit_common.write_all_supers.btrfs_sync_log
    113.12 ±  9%     +21.3%     137.25 ±  4%  perf-sched.wait_and_delay.count.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      1988 ± 14%     -33.4%       1323 ±  8%  perf-sched.wait_and_delay.count.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.__btrfs_tree_read_lock
    967.62 ± 20%     -48.4%     499.25 ± 15%  perf-sched.wait_and_delay.count.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.__btrfs_tree_lock
    399.62 ±  6%     -26.4%     294.12 ± 10%  perf-sched.wait_and_delay.count.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.do_unlinkat
    117.88 ±  6%    -100.0%       0.00        perf-sched.wait_and_delay.count.schedule_timeout.btrfs_sync_log.btrfs_sync_file.__x64_sys_fsync
     78.50 ±  3%     +25.0%      98.12        perf-sched.wait_and_delay.count.schedule_timeout.io_schedule_timeout.__wait_for_common.barrier_all_devices
     86.99 ± 34%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.schedule_timeout.btrfs_sync_log.btrfs_sync_file.__x64_sys_fsync
      6.34 ± 43%    +129.3%      14.54 ± 14%  perf-sched.wait_time.avg.ms.btrfs_start_ordered_extent.btrfs_wait_ordered_range.btrfs_sync_file.__x64_sys_fsync
     53.40 ±  4%     +19.1%      63.60 ±  7%  perf-sched.wait_time.avg.ms.futex_wait_queue.__futex_wait.futex_wait.do_futex
     17.70 ± 12%     +20.5%      21.34 ±  7%  perf-sched.wait_time.avg.ms.io_schedule.folio_wait_bit_common.folio_wait_writeback.__filemap_fdatawait_range
     32.85 ±  5%     -25.5%      24.46        perf-sched.wait_time.avg.ms.io_schedule.folio_wait_bit_common.write_all_supers.btrfs_sync_log
      5.11 ± 24%     +78.1%       9.10 ± 33%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.__btrfs_tree_lock
     10.24 ± 29%    -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_timeout.btrfs_sync_log.btrfs_sync_file.__x64_sys_fsync
      0.27 ± 25%    +126.3%       0.61 ± 33%  perf-sched.wait_time.avg.ms.wait_log_commit.btrfs_sync_log.btrfs_sync_file.__x64_sys_fsync
     86.90 ± 35%    -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_timeout.btrfs_sync_log.btrfs_sync_file.__x64_sys_fsync




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

