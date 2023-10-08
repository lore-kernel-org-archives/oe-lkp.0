Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D1B522E
	for <oe-lkp@lists.linux.dev>; Sun,  8 Oct 2023 07:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MVTQhvj6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696749574; x=1728285574;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=gWUnOFUypp34EYkEn56CouF68XMx8LMRZgfcbL1Xzy8=;
  b=MVTQhvj6of725RkZbaN2IxHFmAIlLH9jX/p6FrcOJ2n59PCIRUiQcGyf
   ylw1IorD1h/GGtZKPYm2pgZbejTB5JoqLiHEOuzjQpqVS7ITxLG0GQpTE
   oOSdY/iqvP/Zz6lBhDCCzm0kyCDSrfyW3VPgly+2aJTZk87+55zF/4MX2
   UwUwyTf2EK8+1c9E8JpngMPSEIIa57iYbNK1IHtJppZF9HHgAi1r72U8h
   FrNaSuCv0CU88H6MW3CkIqradabtxSeLmOWoiQ77UwDk58Jzn6j5wMgmB
   v4KOiOVkH9WVGnWr4phb1QEHuonMoC67xI4nx0zNyf+jg0msbtpatDbpp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="450484797"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; 
   d="scan'208";a="450484797"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2023 00:19:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="896414814"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; 
   d="scan'208";a="896414814"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 08 Oct 2023 00:17:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sun, 8 Oct 2023 00:19:32 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Sun, 8 Oct 2023 00:19:32 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Sun, 8 Oct 2023 00:19:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CY8JU5u/lngwmXhZuDHphJu4aSHbR/szLXuW1YPPcdYZtC7uYSSqNXtKYDr0YYuHNajkNjbgqmNwSplRqF6GrK5TUtCBwIpuy3f61VmSXyI80ln093m8HWoWGf0qv0th/9qSq+e3C0lPwsdS7RNdJ+jKhiPb27P4froVEKAt0J7Y9zVOs1WnVXJoV8B7XcUeSnVOVSdA8WZGzmQUvvws8P+mNp+l3BXq6/h1mUoU6NovKkVVAjwnhG8W2nJcq+ymB2x0RpZOcARCVjHcrXoI2UcF7TjvUzz7ZVR2foa9ZQO1CGRb/6cljQ14vMDvbkSQDuNAb1LvfLiJ4OtOscgquQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qscBz2E/Ih+aK0/OMYzn4GW81Hv02HvvnlxFJ/QlvrQ=;
 b=ZWelW50mTW7riheYIEpOdiRi0bNM2R8koXaWVWL8JgC2MOL1mFuTRXR3T9CIry7/napR7/kqx9kmNyb2w7GgH4McVpY43Cs3Py/uHESFPuwCridLAna7YTD8B4uRFwEV0R6YV4tuMRO0lhc6Jt+XxHJWLhLhbJVWlPeQEW+HJvEpDsvh684XffjvsxskZYcIKVSC4hEteaLW5kjuhxG2kDA9VIjLQeW3Icl/f+pV1xEOfLvHi389LsAgeQy6d5dR3Q6w1gVP1jlfpVREafOg11+VScDDx4JCIVwPIem9EMFMbME1FB6RuHFSRwaha+spd692jVzvqB/GRmt9+BUTjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by CYXPR11MB8731.namprd11.prod.outlook.com (2603:10b6:930:db::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.43; Sun, 8 Oct
 2023 07:19:24 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::73c6:1231:e700:924]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::73c6:1231:e700:924%4]) with mapi id 15.20.6838.029; Sun, 8 Oct 2023
 07:19:24 +0000
Date: Sun, 8 Oct 2023 15:19:15 +0800
From: kernel test robot <oliver.sang@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [djwong-xfs:rmap-intent-cleanups] [xfs]  5350c34955:
 aim7.jobs-per-min 15.9% improvement
Message-ID: <202310081448.beefcf3-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0014.apcprd02.prod.outlook.com
 (2603:1096:4:194::19) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|CYXPR11MB8731:EE_
X-MS-Office365-Filtering-Correlation-Id: f58dcd84-d6b1-43bc-20b2-08dbc7cee5f5
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nOl0zxbw+iChS7ogTbzI5w/Phcfiz/FZKItZt61plrzOUxNjaKRxJIMVMLPrpkdceY5jazVxk8UAPIA5g/jI7vKu4Xpyu/WxuchhRT1z36OUvsmKufH7j5krDmVzMHhNZik98SdIZNVWjmRWrRyeN6YUnEzIy27VRyndl/ITyCIcAOv9KJF6Ut/e5AUlJbzkxBO7bfURCvdp6PA/Q37B2kXY9eXv3y105tElhiMiN15ZIOjhQkHeOMw1s1OUaAmYxgReRKQ8aKFN+8b121qhTgnYpbixH9wHwthMYDhPMA+lux4Q8JZJ2YQ5HX6bjNhfCyEK2OS6n3n7jWEbnVzNEftUqH023F8Rkw9hNGkPOh3VaCwR4Okz49vNPdFm/fMPW39Jyq1W/PW+bj3T3EbWEAMbnIuL3yVEiB1hX9QIWl783cFluuPqXDHQy3jU62fceHROPtZwWxc1eQeV3gyiMsIVwHD1/HXE3+CMNsN7oBABge9l9Kexs0+DMjuYbzEQ+Y37JY/fPlJw0W7UNPJJMhx9xxFtZ7FFUfMtT4u5sWvK2p1ksZsE7uBxWAzxoa81zuQMy/KKUClaUiaQ/s+KrQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(136003)(376002)(346002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(86362001)(38100700002)(82960400001)(36756003)(2906002)(6512007)(6486002)(966005)(478600001)(5660300002)(41300700001)(8936002)(4326008)(8676002)(6666004)(6506007)(83380400001)(1076003)(2616005)(107886003)(66556008)(66476007)(66946007)(6916009)(316002)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?I4mtEVYkoYIodJRcovp5OCV/D5LNzd2YiTa3hWWLLJDw004+HM49u35L1O?=
 =?iso-8859-1?Q?9bWc/goVd0dyG+EKz2jd6ui7370s3aDAqjokuVLLUMIPwx2y0/0Ui/xA+X?=
 =?iso-8859-1?Q?xd9aMFRUkLE72WILUKJ1thDYgi3ZSrEf6ZKCXinZW9S4B0awzfvFRf2nDK?=
 =?iso-8859-1?Q?IZ3tYXsyzl5jenYjMZ/i7GAlnmjjf3XOLLF1o11UHVgUs0+BIrPfLWbA8T?=
 =?iso-8859-1?Q?b3boWJZ1qL1207eHi6Fa3tg6LUAHnc6sxkCESQOi/ZLGSKTUHjbi9OseFC?=
 =?iso-8859-1?Q?pc/XhL3pcpeZLuRwa6dH2BnfkDbh5c/ZI/g1Ng93aM2sl1iPWEisMvNCDa?=
 =?iso-8859-1?Q?VZqF79soGLYCTI7nOehduI995xOXHl3fIZf/0eHevhjZ5XiOGdjhDRrLKt?=
 =?iso-8859-1?Q?0HoPa3On1ws62Zg5COse8RkjUu5sPxDev6brUoXs3K6eKW1qNTcNgKGG8a?=
 =?iso-8859-1?Q?r1fGKIcX31ZmmILU0i74w5TltW4TVR5EMir3DE7rPdGfhdmA8wT7TkwJdK?=
 =?iso-8859-1?Q?LB0cZ5e7aIMI0yPVQHZgHixq8la4vd1jZzD49QxXpOwLWJCAngKSZF7dTG?=
 =?iso-8859-1?Q?gaKIymntU31m/G5vS0zB6WDOv3dIZf8eaIbr4cH52VeBRGByFOnu3amV+0?=
 =?iso-8859-1?Q?lDy7B4qP3Rc3JgH04rFTwZhp6n7hCZfVsR5zobc4TKnutNwl8sRa1yH30X?=
 =?iso-8859-1?Q?3XfeABgXIej6PCXQVgYhGvsQ2/l4wLrgaKdHAViaTPATNlUDflCEURQkUa?=
 =?iso-8859-1?Q?fjmo7cUQGPfUZauov0Ka3YHGWsBLCqzjMhDyQdC7cedXFzfqkrG5hRm2RJ?=
 =?iso-8859-1?Q?7A35T1QqmjpSiDLE6/YuPAaiFAwfU/lLUz86iTynCjaA1ZSJvEi/YQxbnH?=
 =?iso-8859-1?Q?hggwSn+DYkPBz96kQTxD7HDaVYGRiwrnLmhljm7ueieClv1gwsibxKrBNm?=
 =?iso-8859-1?Q?TEEc6pNCh56iXQp/2d11Ck0wKUZ/bvOyKBUMh3nFq9jTlG9nl29KxYYtKG?=
 =?iso-8859-1?Q?Na1w3WfQWu8zyBrYyCUQ3lSv7r8kmLY8JCOkD5jNvFs45P37ZB8YAriC/M?=
 =?iso-8859-1?Q?f2GYEacJZwvx4KYUBXHARxKiodE5KAI8rt17rqBM+1hRLiCZHoJjhv10iJ?=
 =?iso-8859-1?Q?MYKmVV3iksXa/lf+876lboCKFLVHzzkTLTui/hYmL6FbP6Dj1fFVGwzRHu?=
 =?iso-8859-1?Q?zzzgEdA9kzQ68vnFE8uC+IBk7WYmRf/77OUWqxxSjZEN4ldAYSTgnpsNBL?=
 =?iso-8859-1?Q?MdvxSGnzijL+PjWbDccM8FZRHpD/gqGQUHrikvbXFFsbsWKb8dFMhHvl78?=
 =?iso-8859-1?Q?K1bivQl7O7MBkqBxHYpQXZdhAJj8uAXNIe27Sq9ZcX6XXfVZhXwkDLT+qE?=
 =?iso-8859-1?Q?A+DX4NubRUySc4RJ+wWetqsyHBE6QgF0QZt7nrnSfdHCKJ1TsCxCPGyS80?=
 =?iso-8859-1?Q?aFD+wWHZifmzGtzWahtsZt7NdgofwotnEZQ4kLc/8PMZPEdTyT9tSa4kcw?=
 =?iso-8859-1?Q?qxsNXWo+V/Nl8PF5vGe5J/fqb0vlGAGEnXl2gKf5cCL7dCS8lUdpPAgD/V?=
 =?iso-8859-1?Q?2GieK4sXNlP3IthWF3aPF/43La/msDnBfgTxfXlqsn+B2GI9CioLpqTjLZ?=
 =?iso-8859-1?Q?HHe6vdb172RJbTWes2ZJo0k2M59xTnnZwCrNJZtdXSbw44fcUSr4dfQw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f58dcd84-d6b1-43bc-20b2-08dbc7cee5f5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2023 07:19:24.0579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /YoFu3pevnibZ5gxj6k0unGoIkxquIkOlcaffi9H1wo7VvFFTSrh48GeLKr0flRhGuxtpkKzToLDhaRnHUdOzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8731
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 15.9% improvement of aim7.jobs-per-min on:


commit: 5350c349553aebeaaaf44b50c584dc51b78cd0ee ("xfs: allow inode-based btrees to reserve space in the data device")
https://git.kernel.org/cgit/linux/kernel/git/djwong/xfs-linux.git rmap-intent-cleanups

testcase: aim7
test machine: 96 threads 2 sockets Intel(R) Xeon(R) Platinum 8260L CPU @ 2.40GHz (Cascade Lake) with 128G memory
parameters:

	disk: 4BRD_12G
	md: RAID1
	fs: xfs
	test: disk_rd
	load: 9000
	cpufreq_governor: performance






Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20231008/202310081448.beefcf3-oliver.sang@intel.com

=========================================================================================
compiler/cpufreq_governor/disk/fs/kconfig/load/md/rootfs/tbox_group/test/testcase:
  gcc-12/performance/4BRD_12G/xfs/x86_64-rhel-8.3/9000/RAID1/debian-11.1-x86_64-20220510.cgz/lkp-csl-2sp3/disk_rd/aim7

commit: 
  4f9f314d1f ("xfs: simplify xfs_ag_resv_free signature")
  5350c34955 ("xfs: allow inode-based btrees to reserve space in the data device")

4f9f314d1f93bcf9 5350c349553aebeaaaf44b50c58 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      0.00 ± 19%      +0.0        0.00 ± 21%  mpstat.cpu.all.iowait%
      4767 ± 14%     +28.2%       6111 ± 12%  perf-c2c.HITM.local
     13242 ±  5%      -8.8%      12080 ±  3%  sched_debug.cpu.curr->pid.max
    256.91 ±  2%     -11.3%     227.96 ±  2%  uptime.boot
     24284 ±  3%      -6.0%      22837 ±  4%  vmstat.system.cs
      7.25 ±  5%     +12.6%       8.16 ±  7%  iostat.cpu.idle
      9.58            -7.6%       8.85 ±  3%  iostat.cpu.user
   1437931 ±  4%      -7.3%    1333583 ±  4%  proc-vmstat.pgfault
   1657856           -12.6%    1449728        proc-vmstat.unevictable_pgs_scanned
      6.22 ±  3%      +0.7        6.91 ±  3%  turbostat.C6%
      4.21 ±  3%     +12.2%       4.72 ±  2%  turbostat.CPU%c1
    576.00           -41.7%     336.00 ± 45%  turbostat.SMI
      1.47 ±103%     -86.6%       0.20 ±122%  perf-sched.sch_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      1383 ±103%     -87.3%     176.08 ±130%  perf-sched.sch_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      1114 ± 38%     -43.0%     635.73 ± 16%  perf-sched.wait_and_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
    992.90 ± 42%     -39.4%     601.41 ± 20%  perf-sched.wait_time.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     13749 ± 86%     -68.3%       4352 ± 62%  perf-sched.wait_time.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
    270479           +15.9%     313406 ±  2%  aim7.jobs-per-min
    200.38 ±  2%     -13.7%     173.01        aim7.time.elapsed_time
    200.38 ±  2%     -13.7%     173.01        aim7.time.elapsed_time.max
   4486832 ±  3%     -18.1%    3673674 ±  6%  aim7.time.involuntary_context_switches
     16173 ±  2%     -13.7%      13954 ±  2%  aim7.time.system_time
      1844           -20.2%       1471 ±  4%  aim7.time.user_time
 1.639e+09           +13.4%  1.859e+09        perf-stat.i.branch-instructions
  14606121           +12.7%   16458296        perf-stat.i.branch-misses
  60258127 ±  2%     +14.0%   68691615 ±  3%  perf-stat.i.cache-misses
 2.386e+08           +13.8%  2.715e+08 ±  2%  perf-stat.i.cache-references
     32.63           -13.6%      28.20        perf-stat.i.cpi
    304.63 ±  5%      +8.9%     331.89 ±  5%  perf-stat.i.cpu-migrations
      4359 ±  3%     -13.7%       3763 ±  4%  perf-stat.i.cycles-between-cache-misses
 2.293e+09           +13.6%  2.604e+09        perf-stat.i.dTLB-loads
 1.289e+09           +13.6%  1.465e+09        perf-stat.i.dTLB-stores
   4211585 ±  3%      +7.1%    4511015 ±  3%  perf-stat.i.iTLB-load-misses
 8.168e+09           +13.5%  9.268e+09        perf-stat.i.instructions
      0.05 ±  7%     +24.3%       0.06 ±  5%  perf-stat.i.ipc
    190.78 ±  4%     +14.5%     218.45 ±  2%  perf-stat.i.metric.K/sec
     56.63           +13.8%      64.45        perf-stat.i.metric.M/sec
      6620 ±  3%      +6.6%       7058 ±  2%  perf-stat.i.minor-faults
   8155894 ±  6%     +17.4%    9571192 ±  5%  perf-stat.i.node-load-misses
   1486468 ± 12%     +19.4%    1775183 ±  8%  perf-stat.i.node-loads
      6621 ±  3%      +6.6%       7060 ±  2%  perf-stat.i.page-faults
     33.69           -12.8%      29.39        perf-stat.overall.cpi
      4549 ±  3%     -13.4%       3938 ±  4%  perf-stat.overall.cycles-between-cache-misses
      0.01 ±  2%      -0.0        0.01 ±  4%  perf-stat.overall.dTLB-store-miss-rate%
      1883 ±  2%      +5.8%       1993        perf-stat.overall.instructions-per-iTLB-miss
      0.03           +14.6%       0.03        perf-stat.overall.ipc
 1.657e+09           +13.7%  1.884e+09        perf-stat.ps.branch-instructions
  14372482           +12.6%   16189833        perf-stat.ps.branch-misses
  61190102 ±  3%     +14.7%   70173261 ±  4%  perf-stat.ps.cache-misses
   2.4e+08           +14.5%  2.747e+08 ±  2%  perf-stat.ps.cache-references
 2.318e+09           +14.0%  2.641e+09        perf-stat.ps.dTLB-loads
 1.303e+09           +14.1%  1.486e+09        perf-stat.ps.dTLB-stores
   4385634 ±  3%      +7.5%    4712811 ±  3%  perf-stat.ps.iTLB-load-misses
 8.256e+09           +13.7%   9.39e+09        perf-stat.ps.instructions
      0.97 ± 38%    +108.1%       2.03 ± 32%  perf-stat.ps.major-faults
   8302262 ±  5%     +17.7%    9768389 ±  5%  perf-stat.ps.node-load-misses
 1.666e+12            -2.1%  1.632e+12        perf-stat.total.instructions
     14.76 ±  4%      -3.6       11.12 ±  3%  perf-profile.calltrace.cycles-pp.xfs_iunlock.xfs_file_buffered_read.xfs_file_read_iter.vfs_read.ksys_read
     14.71 ±  4%      -3.6       11.08 ±  3%  perf-profile.calltrace.cycles-pp.up_read.xfs_iunlock.xfs_file_buffered_read.xfs_file_read_iter.vfs_read
     25.87 ±  3%      -2.8       23.11 ±  3%  perf-profile.calltrace.cycles-pp.touch_atime.filemap_read.xfs_file_buffered_read.xfs_file_read_iter.vfs_read
     25.80 ±  3%      -2.7       23.07 ±  3%  perf-profile.calltrace.cycles-pp.atime_needs_update.touch_atime.filemap_read.xfs_file_buffered_read.xfs_file_read_iter
      9.58            -0.5        9.10 ±  3%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      3.15 ±  8%      +0.7        3.81 ±  9%  perf-profile.calltrace.cycles-pp.filemap_get_read_batch.filemap_get_pages.filemap_read.xfs_file_buffered_read.xfs_file_read_iter
     20.65 ±  3%      +1.5       22.14 ±  2%  perf-profile.calltrace.cycles-pp.xfs_ilock.xfs_file_buffered_read.xfs_file_read_iter.vfs_read.ksys_read
     20.56 ±  3%      +1.5       22.08 ±  2%  perf-profile.calltrace.cycles-pp.down_read.xfs_ilock.xfs_file_buffered_read.xfs_file_read_iter.vfs_read
     46.61 ±  3%      +2.4       48.98        perf-profile.calltrace.cycles-pp.filemap_read.xfs_file_buffered_read.xfs_file_read_iter.vfs_read.ksys_read
     14.75 ±  4%      -3.7       11.09 ±  3%  perf-profile.children.cycles-pp.up_read
     14.77 ±  4%      -3.7       11.12 ±  3%  perf-profile.children.cycles-pp.xfs_iunlock
     25.85 ±  3%      -2.8       23.09 ±  3%  perf-profile.children.cycles-pp.atime_needs_update
     25.87 ±  3%      -2.8       23.11 ±  3%  perf-profile.children.cycles-pp.touch_atime
      9.70            -0.5        9.24 ±  3%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      0.65 ±  9%      -0.5        0.18 ±  8%  perf-profile.children.cycles-pp.current_time
      0.12 ± 49%      -0.1        0.04 ± 71%  perf-profile.children.cycles-pp.ktime_get_coarse_real_ts64
      0.10 ±  8%      +0.0        0.12 ±  6%  perf-profile.children.cycles-pp.__fdget_pos
      0.08 ± 13%      +0.1        0.14 ± 34%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
      0.19 ±  4%      +0.2        0.35 ± 19%  perf-profile.children.cycles-pp.__entry_text_start
      3.15 ±  8%      +0.7        3.82 ±  9%  perf-profile.children.cycles-pp.filemap_get_read_batch
     20.66 ±  3%      +1.5       22.15 ±  2%  perf-profile.children.cycles-pp.xfs_ilock
     20.60 ±  3%      +1.5       22.10 ±  2%  perf-profile.children.cycles-pp.down_read
     50.47 ±  2%      +2.4       52.88        perf-profile.children.cycles-pp.filemap_read
     14.67 ±  4%      -3.6       11.05 ±  3%  perf-profile.self.cycles-pp.up_read
     25.08 ±  3%      -2.3       22.82 ±  3%  perf-profile.self.cycles-pp.atime_needs_update
      9.25            -0.5        8.74 ±  3%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.53 ± 19%      -0.4        0.14 ± 10%  perf-profile.self.cycles-pp.current_time
      0.12 ± 53%      -0.1        0.03 ±100%  perf-profile.self.cycles-pp.ktime_get_coarse_real_ts64
      0.12 ± 11%      +0.0        0.16 ± 10%  perf-profile.self.cycles-pp.exit_to_user_mode_prepare
      0.03 ±100%      +0.1        0.08 ± 17%  perf-profile.self.cycles-pp.do_syscall_64
      0.08 ± 14%      +0.1        0.14 ± 37%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
      0.12 ±  6%      +0.1        0.25 ± 26%  perf-profile.self.cycles-pp.__entry_text_start
      0.16 ± 29%      +0.1        0.30 ± 22%  perf-profile.self.cycles-pp.ksys_read
      2.23 ± 12%      +0.6        2.79 ±  9%  perf-profile.self.cycles-pp.filemap_get_read_batch
     20.48 ±  3%      +1.5       22.01 ±  2%  perf-profile.self.cycles-pp.down_read
     20.00 ±  4%      +4.6       24.57 ±  4%  perf-profile.self.cycles-pp.filemap_read




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

