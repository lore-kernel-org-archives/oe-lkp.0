Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405341A70E
	for <oe-lkp@lists.linux.dev>; Fri, 20 Oct 2023 13:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lIIYu8fY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697807911; x=1729343911;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=y8tRFRmAwpy+gIaMMbk9thvk2Xhyz+G4RJttihGMX5c=;
  b=lIIYu8fY3kx1pZLqFMn/Cq6qEodGmvFN+Lz7a0OBjWD66Ikfv/VrHAS4
   Zupa4I/ZUoZvBZahg46Z0v0Vao86jno6jCKuBCuTNWiYvYvNHO4/LLkxU
   pFHcvkJeB/PvJg8QPg4AcsypO/kBHSOnQkjOFnfQJufUamN8vMrAamy4h
   OPk6EV9g04FBZnSESv+bkXBWNQUcgRPB8v7HFM4Nrsu7okwn8S0CPLWBm
   ZSoJd3jLJDpsdQVGkzBGpBQa2eqii0tZ2R6bRoYRb4duo0QJZxoRdPmUj
   eIalVlUbc04stVig66a5jroHor2qPv0AApBvcTSRIKmy9t4zK/j5ARnt7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="366723212"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="366723212"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 06:18:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="1088740856"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="1088740856"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Oct 2023 06:18:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 20 Oct 2023 06:18:23 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 20 Oct 2023 06:18:23 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 20 Oct 2023 06:18:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rdn69HqLP5dqbnJb+foEGochJVTcUpqYZn2CVjlSQc03NaFMnpViZu0GKABJy/GPcU3t6ElWgo8BdSwhRuAYygxXfSshyGbmUNsSwVueEG4RTpx/Wps8cUi1JfW3sD0+Bnc74aqq+bGtwXn+EGerhJ/Om5AkSbikPeJ2MEgMakdLdvRjNfSpdt24oloM5UIGiRT94HLMIvwijfy+sgUcW6Vc7XOK1t1jDJHZ7qC700mYpNYyrlp8XZ7OOzwj4TWl91jLH+CFNdzS7M8+Nnao0Aui0TYiXMoxl9iziBvZpjncd7wL7pIkfexgvEXtxozed8aJkn3/IJ775NDeM4tVXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PDkv637QE9PBgNiJAcMljFM01nywku/HJRGU9ge0rUs=;
 b=V5wvZP/WEZBm5YxHtBjj/mcqAWEd8B2hKS+1XnTdM32u2g6ODKKS8SzqoFVMns96tVvKC2LPBMN8BPd4XqfZrbEXvHSYcAK/3h9Z+eImU6ivaMt/wNW7CwfW8JazueQ+MRDkMG47hTuaxVpbS0Ni5DUIrLVh8/dEE9ABXUG8bUVqKUfDQqCCfIoDNAgoaUr14hZxXG8Oqautj0W83+2eueInDzkx3ni4FzJBF2dnyZ9iZaZT+wA+HTSQfbUf/FGlgMPC3yTSCCZlGjmJ4EmRxhQ7TmUPKDhzsznCOXs0II1R2lQvgtX45GymuprsRVR9T9z4ZlLfF+EImJv1mWDj9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by SA2PR11MB4779.namprd11.prod.outlook.com (2603:10b6:806:11a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 20 Oct
 2023 13:18:20 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::134a:412c:eb02:ae17]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::134a:412c:eb02:ae17%5]) with mapi id 15.20.6863.046; Fri, 20 Oct 2023
 13:18:20 +0000
Date: Fri, 20 Oct 2023 21:18:11 +0800
From: kernel test robot <oliver.sang@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-mm@kvack.org>,
	<ying.huang@intel.com>, <feng.tang@intel.com>, <fengwei.yin@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>, "Matthew Wilcox (Oracle)"
	<willy@infradead.org>, Suren Baghdasaryan <surenb@google.com>,
	<oliver.sang@intel.com>
Subject: Re: [PATCH v2 4/6] mm: Handle COW faults under the VMA lock
Message-ID: <202310201702.62f04f91-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231006195318.4087158-5-willy@infradead.org>
X-ClientProxiedBy: KL1PR01CA0140.apcprd01.prod.exchangelabs.com
 (2603:1096:820:4::32) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|SA2PR11MB4779:EE_
X-MS-Office365-Filtering-Correlation-Id: bda9e905-0fdd-4909-407c-08dbd16f0787
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o7wo6sPLftbtQp8aSNoaCIgj676BLAVuscaXLRbOoqr0Qo1ZzhsfiVIrW/ZFlT4C45ydGg+SPCpPWiQlPc4DG5JqNSbchzY9KRCRvamrSWq0QDZUBJS1qRk7mWKR0298ii5PD3eZAxaCZY0DuyMTmUB3MBI16Oon8phPcZTddSjZSEYqOzWB41grrDpxwOhjSSyLr2pZb+cfW+QJJ7UCNYzGkkjqrfTbMb8FPQIA953JAKfc20TRn8UHF8LPRCa8fIccEUg8CIJqtckGMGPoFUvtt4S1pP3/FrhkrLMKQ7GqqW2gJnv/TTgiB+65uB10DOPywQJ1d8JLZyCwjfxeTDPh2ji2zSpYyYWAWB3kOMVExsKGhyrgCMRU7dXKBcqOfsIyhhazeKCnBsQz7DSqI6TYy5Zae3ERp928CZy/sguecQn5VHEISzA2Y3s4VNMZGncwJZCnw63CY6/JKxDumxoCiNw/Ew6CQ/QzTLmz56qpaM2G7xnDZfg/83bnF7fFsBkP1c+qeBqczdoPUgAcC1nukf+VFJa9ofSCuFLACe4RV40vrsO3/CYXneQVktYZl+FYORnValh1Jjji8ilLnw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(376002)(396003)(346002)(39860400002)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(6506007)(36756003)(26005)(82960400001)(6916009)(66556008)(316002)(66946007)(66476007)(54906003)(966005)(6486002)(478600001)(6666004)(6512007)(38100700002)(1076003)(2616005)(107886003)(83380400001)(8676002)(4326008)(8936002)(5660300002)(2906002)(41300700001)(30864003)(86362001)(579004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?DKoHxitZ1L/cUGjD+5mP/j8rTEoWZVLEj0wQ5C0M5ckAv3HB/yaYox8lHR?=
 =?iso-8859-1?Q?II2lsMMWdX6w3qA2jZ6BC2nf3GnZ4/JDNqBIdcHmXXCv7rIxJaaQTaSuGd?=
 =?iso-8859-1?Q?gCyHtunEgH8VWUMPYfuzhiIN79QtMveljS2Jdq3DeeK3iEz1InklxDxB1k?=
 =?iso-8859-1?Q?CWX1bRTaQpg/Vo3Zq8E87+GBJlx9St8xmvIpntz1d2cAjqdsbsXG7vzYfR?=
 =?iso-8859-1?Q?z5OeXoBDnPsrtWvyC3tU1x7ip2LkLPEH8SkDuTzlEDHztJT7gh3jqopmin?=
 =?iso-8859-1?Q?tnMMhOEMZXhhauN9FYj+PZIpt1+a6ubS7bFsyh/RbMPuJEFgB8k3UZLbgS?=
 =?iso-8859-1?Q?OP1CM+oIv/rA1gk52z/y0EzOkJPiHGTN3Ajb0shecB/ETgDso5VA8jxGcX?=
 =?iso-8859-1?Q?sQvFYLb9esAoBpxD4kYFIOWXLQRvvY+FYh9W7JlRP6HziwfDi8+0Z56r5V?=
 =?iso-8859-1?Q?iZPLl2G2UPrQxW9J7WzOi9o05RfgXp9BTWlDqWFCZ3Ls+IqC/HH3ihPx+y?=
 =?iso-8859-1?Q?eM/8C/IV9qYw+3wg9Oi9HqO3GmcLkaO13QRlNN+fRRokOmF6JnqC1teXf6?=
 =?iso-8859-1?Q?xqYUHwEkdkwCu6hD3dhq2KG5L+Cn0MqJFci+CfnbrkzjC4Oa3CiOk1GsDx?=
 =?iso-8859-1?Q?NdRRsLicXCE5G1gOAZTTMkdGb1vhSmKcwSVWWDzYymlGOLU7RdG1Gdf8zt?=
 =?iso-8859-1?Q?ZMJlGv8YD882IPGpDO9X48GU/633iXsg9cFdsJ+YH0QQq6hz8gwCyt0weO?=
 =?iso-8859-1?Q?Uu5Uqr+odeL+2zSaWHCkv3iaGvPCFGxjfPGrWkNZXVFiU9Ha+Sy3onhQIB?=
 =?iso-8859-1?Q?hwF7Y/KVUJ9h86MURj3tWfy8C/YyDw4ACuJd7uCCiB6ZWZlGLqKCSBB1vN?=
 =?iso-8859-1?Q?tap3IapShl2Lzl7OxfiDa6Zw14Gs6EgUyD5KiGwNUcI2/vMZXkM+ZaW0hZ?=
 =?iso-8859-1?Q?XMTsYpNrvGJQTbPN+6lp337JGOyIgMW9mmo4YxFdVo1JC0TaiPQbT+ORWG?=
 =?iso-8859-1?Q?hWG+EdoG1upUCRpuFljxUDQt4MRddTCZbKguw1hV3TVw6eH9Iwgqp4xLig?=
 =?iso-8859-1?Q?kpJesaQSnxT1+Mqg8lwyfEfUJH7FKpBmcn9IeHY2lvnxHrVPszPD1An65/?=
 =?iso-8859-1?Q?2mFScu4dGPPu13q8aCnsMyDcmOadgRFqRPDG6YTrH0j87A5cJybb5iD1nI?=
 =?iso-8859-1?Q?FPYKflNua+UhBxFaj128zrhSGfVrSZjUXOM8o/ob0tBEb3rJLZNZPBzLV/?=
 =?iso-8859-1?Q?cLIP0PspFMqtgTJBl87v/ryVfIDtPezg3QvwPVYp0yq9PDtKbCB2Bjf032?=
 =?iso-8859-1?Q?pX+qj46KnlpIW1AEXLJXrsneJNgtrqpWftcTvbYeHg+0Kr4xpTcDkpm5uZ?=
 =?iso-8859-1?Q?xq2bcFw+lVAN66KuGQngo2Jijp6e9pUQv6+sxKC+JtSnAPNKByc0cjLbeU?=
 =?iso-8859-1?Q?lKVbmWVQhEER9jK7rh/vCfo3coCEtFSGv4epatb7t0X3fEx/tULRao/LcT?=
 =?iso-8859-1?Q?sCPyWBghNWXRtuCFm+CAJTpOb9/zafsMLDGarEg0HBPowo/dK0gq3yzen0?=
 =?iso-8859-1?Q?PU9zrRz+RqqVzo52G/hvxi3nyOnOM3qZb4WR7NzVLhykU+5pvOVw31F4Ii?=
 =?iso-8859-1?Q?JPIMpZVoI51VAWFXDFWCAMPd12mqwjUoMB+icFuJM8DiTtuGhHKzpkfg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bda9e905-0fdd-4909-407c-08dbd16f0787
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 13:18:20.5037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QGEgxMdq+5iYy3YwamA1jjmhXqC5kQ84ZaibZxR9HfZ1Cd5L7HsY9GndQkg5hqgGO5VU/JlWEKKo6aDkMdqg1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4779
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 38.7% improvement of will-it-scale.per_thread_ops on:


commit: 90e99527c746cd9ef7ebf0333c9611e45c6e5e1d ("[PATCH v2 4/6] mm: Handle COW faults under the VMA lock")
url: https://github.com/intel-lab-lkp/linux/commits/Matthew-Wilcox-Oracle/mm-Make-lock_folio_maybe_drop_mmap-VMA-lock-aware/20231007-035513
base: v6.6-rc4
patch link: https://lore.kernel.org/all/20231006195318.4087158-5-willy@infradead.org/
patch subject: [PATCH v2 4/6] mm: Handle COW faults under the VMA lock

testcase: will-it-scale
test machine: 104 threads 2 sockets (Skylake) with 192G memory
parameters:

	nr_task: 16
	mode: thread
	test: page_fault2
	cpufreq_governor: performance






Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20231020/202310201702.62f04f91-oliver.sang@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-8.3/thread/16/debian-11.1-x86_64-20220510.cgz/lkp-skl-fpga01/page_fault2/will-it-scale

commit: 
  c8b329d48e ("mm: Handle shared faults under the VMA lock")
  90e99527c7 ("mm: Handle COW faults under the VMA lock")

c8b329d48e0dac74 90e99527c746cd9ef7ebf0333c9 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      1.11 ±  2%      +0.4        1.50        mpstat.cpu.all.usr%
    690.67 ± 20%     -35.3%     447.00 ±  6%  perf-c2c.HITM.local
     71432 ±  3%     -10.5%      63958        meminfo.Active
     70468 ±  3%     -10.4%      63142        meminfo.Active(anon)
 5.722e+08 ±  2%     +38.8%  7.942e+08        numa-numastat.node0.local_node
 5.723e+08 ±  2%     +38.8%  7.944e+08        numa-numastat.node0.numa_hit
      4746           -54.0%       2183        vmstat.system.cs
    106237            +1.7%     108086        vmstat.system.in
     69143 ±  4%     -10.2%      62107 ±  2%  numa-meminfo.node1.Active
     68750 ±  3%     -10.1%      61835        numa-meminfo.node1.Active(anon)
     70251 ±  4%      -9.8%      63348        numa-meminfo.node1.Shmem
   1889742 ±  2%     +38.7%    2621754        will-it-scale.16.threads
    118108 ±  2%     +38.7%     163859        will-it-scale.per_thread_ops
   1889742 ±  2%     +38.7%    2621754        will-it-scale.workload
 5.723e+08 ±  2%     +38.8%  7.944e+08        numa-vmstat.node0.numa_hit
 5.722e+08 ±  2%     +38.8%  7.942e+08        numa-vmstat.node0.numa_local
     17189 ±  3%     -10.1%      15458        numa-vmstat.node1.nr_active_anon
     17563 ±  4%      -9.8%      15837        numa-vmstat.node1.nr_shmem
     17189 ±  3%     -10.1%      15458        numa-vmstat.node1.nr_zone_active_anon
     66914 ± 10%     -54.3%      30547 ±  4%  turbostat.C1
      0.07 ± 18%      -0.1        0.02 ± 33%  turbostat.C1%
    513918 ±  3%     -74.2%     132621 ±  2%  turbostat.C1E
      0.54 ±  4%      -0.4        0.16 ±  4%  turbostat.C1E%
      0.11           +18.2%       0.13        turbostat.IPC
    218.42            +2.0%     222.83        turbostat.PkgWatt
     30.47           +13.3%      34.53        turbostat.RAMWatt
    720.36           +24.0%     893.56 ±  4%  sched_debug.cfs_rq:/.runnable_avg.max
    225.47 ±  7%     +16.4%     262.37        sched_debug.cfs_rq:/.runnable_avg.stddev
    713.28           +25.3%     893.53 ±  4%  sched_debug.cfs_rq:/.util_avg.max
    224.87 ±  7%     +16.6%     262.19        sched_debug.cfs_rq:/.util_avg.stddev
     72.59 ± 49%     +63.1%     118.38 ± 11%  sched_debug.cfs_rq:/.util_est_enqueued.avg
    605.14 ±  4%     +40.7%     851.22        sched_debug.cfs_rq:/.util_est_enqueued.max
    151.28 ± 22%     +64.0%     248.15 ±  5%  sched_debug.cfs_rq:/.util_est_enqueued.stddev
      8811           -42.4%       5078        sched_debug.cpu.nr_switches.avg
     17617 ±  3%     -10.4%      15785        proc-vmstat.nr_active_anon
    332941            +4.6%     348206        proc-vmstat.nr_anon_pages
    855626            +1.7%     870502        proc-vmstat.nr_inactive_anon
     17617 ±  3%     -10.4%      15785        proc-vmstat.nr_zone_active_anon
    855626            +1.7%     870502        proc-vmstat.nr_zone_inactive_anon
 5.729e+08 ±  2%     +38.8%   7.95e+08        proc-vmstat.numa_hit
 5.727e+08 ±  2%     +38.8%  7.948e+08        proc-vmstat.numa_local
     16509 ±  4%     -13.0%      14365        proc-vmstat.pgactivate
 5.724e+08 ±  2%     +38.7%   7.94e+08        proc-vmstat.pgalloc_normal
 5.704e+08 ±  2%     +38.8%  7.914e+08        proc-vmstat.pgfault
 5.723e+08 ±  2%     +38.7%   7.94e+08        proc-vmstat.pgfree
      0.00 ± 37%    +164.7%       0.01 ±  6%  perf-sched.sch_delay.avg.ms.__cond_resched.tlb_batch_pages_flush.zap_pte_range.zap_pmd_range.isra
      0.02 ± 12%     +26.4%       0.02 ± 10%  perf-sched.sch_delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      0.00 ±223%   +9466.7%       0.05 ±181%  perf-sched.sch_delay.avg.ms.io_schedule.folio_wait_bit_common.filemap_fault.__do_fault
      0.02 ± 94%     -61.2%       0.01 ± 11%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
      0.00 ±  8%   +1068.0%       0.05 ±189%  perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write_killable.vm_mmap_pgoff
      0.01 ± 14%     +52.6%       0.01 ± 34%  perf-sched.sch_delay.max.ms.__cond_resched.tlb_batch_pages_flush.zap_pte_range.zap_pmd_range.isra
      0.01 ±  9%  +10802.8%       0.65 ±212%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      0.00 ±223%  +10533.3%       0.05 ±162%  perf-sched.sch_delay.max.ms.io_schedule.folio_wait_bit_common.filemap_fault.__do_fault
     62.95 ±  2%    +113.8%     134.58 ±  2%  perf-sched.total_wait_and_delay.average.ms
     13913           -52.2%       6654        perf-sched.total_wait_and_delay.count.ms
     62.87 ±  2%    +113.8%     134.44 ±  2%  perf-sched.total_wait_time.average.ms
      2.95 ±  3%   +1477.8%      46.48 ±  2%  perf-sched.wait_and_delay.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read_killable.lock_mm_and_find_vma
      1.18 ±  7%   +2017.8%      24.99 ±  2%  perf-sched.wait_and_delay.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write_killable.__vm_munmap
      2.76 ±  3%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write_killable.vm_mmap_pgoff
      6894 ±  2%     -94.4%     384.67        perf-sched.wait_and_delay.count.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read_killable.lock_mm_and_find_vma
      1070 ± 11%     -60.9%     418.33        perf-sched.wait_and_delay.count.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write_killable.__vm_munmap
    112.33 ± 13%    -100.0%       0.00        perf-sched.wait_and_delay.count.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write_killable.vm_mmap_pgoff
     15.07 ± 30%    +469.9%      85.90 ±  4%  perf-sched.wait_and_delay.max.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read_killable.lock_mm_and_find_vma
     11.68 ± 17%    +558.0%      76.85 ± 11%  perf-sched.wait_and_delay.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write_killable.__vm_munmap
     14.21 ± 27%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write_killable.vm_mmap_pgoff
     17.20 ± 29%     -69.9%       5.17 ±  7%  perf-sched.wait_and_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      3893 ±  8%     -19.2%       3144 ± 19%  perf-sched.wait_and_delay.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      2.99 ± 28%    +906.8%      30.07 ± 12%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.do_cow_fault
      3.59 ± 49%    +796.7%      32.22 ± 11%  perf-sched.wait_time.avg.ms.__cond_resched.shmem_get_folio_gfp.shmem_fault.__do_fault.do_cow_fault
      1.81 ± 75%   +2169.9%      41.07 ± 29%  perf-sched.wait_time.avg.ms.__cond_resched.tlb_batch_pages_flush.zap_pte_range.zap_pmd_range.isra
      3.46 ±101%   +1224.0%      45.81 ± 30%  perf-sched.wait_time.avg.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
      3.15 ± 29%    +943.4%      32.88 ±  7%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_fault
      2.88 ± 50%    +922.9%      29.44 ± 11%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      2.94 ±  3%   +1481.0%      46.47 ±  2%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read_killable.lock_mm_and_find_vma
      1.18 ±  7%   +2023.3%      24.96 ±  3%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write_killable.__vm_munmap
      2.76 ±  3%   +1449.8%      42.73 ±  9%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write_killable.vm_mmap_pgoff
     10.38 ±  3%    +533.8%      65.76 ±  7%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.do_cow_fault
      9.13 ± 26%    +596.6%      63.59 ± 11%  perf-sched.wait_time.max.ms.__cond_resched.shmem_get_folio_gfp.shmem_fault.__do_fault.do_cow_fault
      6.77 ± 70%    +843.3%      63.87 ± 30%  perf-sched.wait_time.max.ms.__cond_resched.tlb_batch_pages_flush.zap_pte_range.zap_pmd_range.isra
      5.71 ± 64%   +1111.5%      69.19 ± 15%  perf-sched.wait_time.max.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
     10.23 ±  4%    +560.7%      67.56 ±  6%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_fault
      8.83 ± 30%    +582.4%      60.23 ±  7%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
     15.06 ± 30%    +470.1%      85.89 ±  4%  perf-sched.wait_time.max.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read_killable.lock_mm_and_find_vma
     11.67 ± 17%    +558.2%      76.84 ± 11%  perf-sched.wait_time.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write_killable.__vm_munmap
     14.21 ± 27%    +429.5%      75.22 ±  9%  perf-sched.wait_time.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write_killable.vm_mmap_pgoff
     17.16 ± 28%     -69.9%       5.16 ±  7%  perf-sched.wait_time.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      3893 ±  8%     -19.2%       3144 ± 19%  perf-sched.wait_time.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     14.12           +16.6%      16.46        perf-stat.i.MPKI
 2.231e+09 ±  2%     +16.6%  2.601e+09        perf-stat.i.branch-instructions
  19953628            +8.8%   21705347        perf-stat.i.branch-misses
     51.96 ±  2%     +13.0       65.01        perf-stat.i.cache-miss-rate%
 1.566e+08 ±  2%     +36.8%  2.142e+08        perf-stat.i.cache-misses
 3.015e+08 ±  3%      +9.2%  3.294e+08        perf-stat.i.cache-references
      4702           -55.0%       2116        perf-stat.i.context-switches
      2.58           -14.2%       2.22        perf-stat.i.cpi
    114.64            -2.2%     112.13        perf-stat.i.cpu-migrations
    183.46           -26.2%     135.46        perf-stat.i.cycles-between-cache-misses
   4280505 ±  3%     +22.7%    5251081 ±  6%  perf-stat.i.dTLB-load-misses
 2.774e+09 ±  2%     +19.1%  3.303e+09        perf-stat.i.dTLB-loads
      0.98 ±  2%      +0.2        1.14        perf-stat.i.dTLB-store-miss-rate%
  15927669 ±  4%     +38.8%   22110291        perf-stat.i.dTLB-store-misses
 1.604e+09 ±  2%     +19.9%  1.923e+09        perf-stat.i.dTLB-stores
     79.86            +3.1       82.95        perf-stat.i.iTLB-load-miss-rate%
   2701759 ±  2%     +19.0%    3214102        perf-stat.i.iTLB-load-misses
    679352            -2.8%     660048        perf-stat.i.iTLB-loads
 1.115e+10 ±  2%     +17.1%  1.305e+10        perf-stat.i.instructions
      0.39           +16.8%       0.45        perf-stat.i.ipc
      0.29 ± 26%     -31.6%       0.20 ± 17%  perf-stat.i.major-faults
    762.98 ±  2%     +39.2%       1062        perf-stat.i.metric.K/sec
     66.44 ±  2%     +18.0%      78.42        perf-stat.i.metric.M/sec
   1890049 ±  2%     +38.5%    2616916        perf-stat.i.minor-faults
  47044113 ±  2%     +41.1%   66393293        perf-stat.i.node-loads
  11825548 ±  2%     +34.0%   15841684        perf-stat.i.node-stores
   1890049 ±  2%     +38.5%    2616917        perf-stat.i.page-faults
     14.05           +16.9%      16.42        perf-stat.overall.MPKI
      0.89            -0.1        0.83        perf-stat.overall.branch-miss-rate%
     51.96 ±  2%     +13.1       65.04        perf-stat.overall.cache-miss-rate%
      2.57           -14.4%       2.20        perf-stat.overall.cpi
    183.08           -26.7%     134.14        perf-stat.overall.cycles-between-cache-misses
      0.98 ±  2%      +0.2        1.14        perf-stat.overall.dTLB-store-miss-rate%
     79.90            +3.1       82.97        perf-stat.overall.iTLB-load-miss-rate%
      0.39           +16.7%       0.45        perf-stat.overall.ipc
      0.22 ±  2%      -0.1        0.15 ±  3%  perf-stat.overall.node-load-miss-rate%
      0.19 ±  8%      -0.1        0.13 ± 16%  perf-stat.overall.node-store-miss-rate%
   1779185           -15.5%    1503815        perf-stat.overall.path-length
 2.224e+09 ±  2%     +16.6%  2.593e+09        perf-stat.ps.branch-instructions
  19885795            +8.8%   21625880        perf-stat.ps.branch-misses
  1.56e+08 ±  2%     +36.8%  2.135e+08        perf-stat.ps.cache-misses
 3.005e+08 ±  3%      +9.2%  3.283e+08        perf-stat.ps.cache-references
      4686           -55.0%       2109        perf-stat.ps.context-switches
    114.35            -2.3%     111.73        perf-stat.ps.cpu-migrations
   4265367 ±  3%     +22.7%    5233761 ±  6%  perf-stat.ps.dTLB-load-misses
 2.765e+09 ±  2%     +19.1%  3.292e+09        perf-stat.ps.dTLB-loads
  15874379 ±  4%     +38.8%   22037238        perf-stat.ps.dTLB-store-misses
 1.598e+09 ±  2%     +19.9%  1.917e+09        perf-stat.ps.dTLB-stores
   2692499 ±  2%     +19.0%    3203465        perf-stat.ps.iTLB-load-misses
    677243            -2.9%     657791        perf-stat.ps.iTLB-loads
 1.111e+10 ±  2%     +17.1%    1.3e+10        perf-stat.ps.instructions
      0.29 ± 26%     -31.6%       0.20 ± 17%  perf-stat.ps.major-faults
   1883712 ±  2%     +38.5%    2608263        perf-stat.ps.minor-faults
  46887454 ±  2%     +41.1%   66175688        perf-stat.ps.node-loads
  11785781 ±  2%     +34.0%   15789100        perf-stat.ps.node-stores
   1883712 ±  2%     +38.5%    2608264        perf-stat.ps.page-faults
 3.362e+12 ±  2%     +17.3%  3.943e+12        perf-stat.total.instructions
     47.03 ±  2%      -8.6       38.45        perf-profile.calltrace.cycles-pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.testcase
     47.22 ±  2%      -8.6       38.67        perf-profile.calltrace.cycles-pp.exc_page_fault.asm_exc_page_fault.testcase
      8.30 ±  6%      -8.3        0.00        perf-profile.calltrace.cycles-pp.lock_mm_and_find_vma.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.testcase
      7.19 ±  4%      -7.2        0.00        perf-profile.calltrace.cycles-pp.down_read_trylock.lock_mm_and_find_vma.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
     57.96 ±  3%      -4.7       53.23        perf-profile.calltrace.cycles-pp.asm_exc_page_fault.testcase
     61.72 ±  3%      -3.3       58.42        perf-profile.calltrace.cycles-pp.testcase
      2.19 ± 13%      -0.6        1.59 ±  6%  perf-profile.calltrace.cycles-pp.lock_vma_under_rcu.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.testcase
      0.91 ±  8%      +0.2        1.09 ±  7%  perf-profile.calltrace.cycles-pp.__mem_cgroup_charge.do_cow_fault.do_fault.__handle_mm_fault.handle_mm_fault
      0.56 ±  2%      +0.2        0.78 ±  5%  perf-profile.calltrace.cycles-pp.__perf_sw_event.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.testcase
      1.11 ±  4%      +0.2        1.34 ±  4%  perf-profile.calltrace.cycles-pp.filemap_get_entry.shmem_get_folio_gfp.shmem_fault.__do_fault.do_cow_fault
      0.86 ±  6%      +0.3        1.13 ±  4%  perf-profile.calltrace.cycles-pp.lru_add_fn.folio_batch_move_lru.folio_add_lru_vma.set_pte_range.finish_fault
      1.42 ±  3%      +0.3        1.77 ±  2%  perf-profile.calltrace.cycles-pp.shmem_get_folio_gfp.shmem_fault.__do_fault.do_cow_fault.do_fault
      0.87 ±  6%      +0.4        1.27 ±  3%  perf-profile.calltrace.cycles-pp.__free_one_page.free_pcppages_bulk.free_unref_page_list.release_pages.tlb_batch_pages_flush
      1.66 ±  3%      +0.4        2.10        perf-profile.calltrace.cycles-pp.shmem_fault.__do_fault.do_cow_fault.do_fault.__handle_mm_fault
      0.54 ± 45%      +0.4        0.98 ±  4%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.folio_batch_move_lru.folio_add_lru_vma
      0.96 ±  6%      +0.4        1.40 ±  2%  perf-profile.calltrace.cycles-pp.free_pcppages_bulk.free_unref_page_list.release_pages.tlb_batch_pages_flush.zap_pte_range
      1.23 ±  4%      +0.4        1.68        perf-profile.calltrace.cycles-pp.sync_regs.asm_exc_page_fault.testcase
      0.26 ±100%      +0.5        0.72 ±  8%  perf-profile.calltrace.cycles-pp.folio_add_new_anon_rmap.set_pte_range.finish_fault.do_cow_fault.do_fault
      1.74 ±  3%      +0.5        2.22        perf-profile.calltrace.cycles-pp.__do_fault.do_cow_fault.do_fault.__handle_mm_fault.handle_mm_fault
      0.59 ± 45%      +0.5        1.06 ±  3%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.folio_batch_move_lru.folio_add_lru_vma.set_pte_range
      0.89 ±  5%      +0.5        1.36        perf-profile.calltrace.cycles-pp._compound_head.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_vmas
      0.60 ± 45%      +0.5        1.08 ±  3%  perf-profile.calltrace.cycles-pp.folio_lruvec_lock_irqsave.folio_batch_move_lru.folio_add_lru_vma.set_pte_range.finish_fault
      0.00            +0.5        0.52 ±  2%  perf-profile.calltrace.cycles-pp.tlb_batch_pages_flush.tlb_finish_mmu.unmap_region.do_vmi_align_munmap.do_vmi_munmap
      0.00            +0.5        0.52 ±  2%  perf-profile.calltrace.cycles-pp.tlb_finish_mmu.unmap_region.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap
      0.08 ±223%      +0.6        0.67        perf-profile.calltrace.cycles-pp.page_remove_rmap.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_vmas
      1.56 ±  4%      +0.6        2.18 ±  2%  perf-profile.calltrace.cycles-pp.free_unref_page_list.release_pages.tlb_batch_pages_flush.zap_pte_range.zap_pmd_range
      0.00            +0.6        0.63 ±  5%  perf-profile.calltrace.cycles-pp.___perf_sw_event.__perf_sw_event.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.00            +0.7        0.66 ±  2%  perf-profile.calltrace.cycles-pp.__perf_sw_event.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      2.04 ±  8%      +0.9        2.91        perf-profile.calltrace.cycles-pp.folio_batch_move_lru.folio_add_lru_vma.set_pte_range.finish_fault.do_cow_fault
      2.16 ±  7%      +0.9        3.10 ±  2%  perf-profile.calltrace.cycles-pp.folio_add_lru_vma.set_pte_range.finish_fault.do_cow_fault.do_fault
      2.80 ±  4%      +1.0        3.76        perf-profile.calltrace.cycles-pp.irqentry_exit_to_user_mode.asm_exc_page_fault.testcase
      2.93 ±  5%      +1.1        4.06        perf-profile.calltrace.cycles-pp._raw_spin_lock.__pte_offset_map_lock.finish_fault.do_cow_fault.do_fault
      3.11 ±  7%      +1.1        4.24 ±  2%  perf-profile.calltrace.cycles-pp.set_pte_range.finish_fault.do_cow_fault.do_fault.__handle_mm_fault
      3.15 ±  4%      +1.2        4.31        perf-profile.calltrace.cycles-pp.error_entry.testcase
      3.05 ±  5%      +1.2        4.23        perf-profile.calltrace.cycles-pp.__pte_offset_map_lock.finish_fault.do_cow_fault.do_fault.__handle_mm_fault
      3.21 ±  3%      +1.2        4.41        perf-profile.calltrace.cycles-pp.__irqentry_text_end.testcase
      2.62 ±  6%      +1.4        3.98        perf-profile.calltrace.cycles-pp.release_pages.tlb_batch_pages_flush.zap_pte_range.zap_pmd_range.unmap_page_range
      2.78 ±  6%      +1.4        4.20        perf-profile.calltrace.cycles-pp.tlb_batch_pages_flush.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_vmas
      0.70 ± 48%      +1.7        2.38 ±  3%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.rmqueue_bulk.rmqueue.get_page_from_freelist
      0.71 ± 48%      +1.7        2.39 ±  2%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.rmqueue_bulk.rmqueue.get_page_from_freelist.__alloc_pages
      1.98 ± 10%      +1.7        3.66        perf-profile.calltrace.cycles-pp.rmqueue_bulk.rmqueue.get_page_from_freelist.__alloc_pages.__folio_alloc
      2.43 ±  9%      +1.8        4.25        perf-profile.calltrace.cycles-pp.rmqueue.get_page_from_freelist.__alloc_pages.__folio_alloc.vma_alloc_folio
      2.64 ±  8%      +1.9        4.55        perf-profile.calltrace.cycles-pp.get_page_from_freelist.__alloc_pages.__folio_alloc.vma_alloc_folio.do_cow_fault
      3.07 ±  8%      +2.1        5.13        perf-profile.calltrace.cycles-pp.__alloc_pages.__folio_alloc.vma_alloc_folio.do_cow_fault.do_fault
      3.15 ±  8%      +2.1        5.25        perf-profile.calltrace.cycles-pp.__folio_alloc.vma_alloc_folio.do_cow_fault.do_fault.__handle_mm_fault
      4.46 ±  5%      +2.3        6.72        perf-profile.calltrace.cycles-pp.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_vmas.unmap_region
      4.47 ±  5%      +2.3        6.74        perf-profile.calltrace.cycles-pp.unmap_vmas.unmap_region.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap
      4.47 ±  5%      +2.3        6.74        perf-profile.calltrace.cycles-pp.unmap_page_range.unmap_vmas.unmap_region.do_vmi_align_munmap.do_vmi_munmap
      4.47 ±  5%      +2.3        6.74        perf-profile.calltrace.cycles-pp.zap_pmd_range.unmap_page_range.unmap_vmas.unmap_region.do_vmi_align_munmap
      6.38 ±  6%      +2.3        8.65        perf-profile.calltrace.cycles-pp.finish_fault.do_cow_fault.do_fault.__handle_mm_fault.handle_mm_fault
      3.64 ±  7%      +2.3        5.97        perf-profile.calltrace.cycles-pp.vma_alloc_folio.do_cow_fault.do_fault.__handle_mm_fault.handle_mm_fault
      4.81 ±  6%      +2.5        7.28        perf-profile.calltrace.cycles-pp.__munmap
      4.81 ±  6%      +2.5        7.28        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__munmap
      4.81 ±  6%      +2.5        7.28        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
      4.81 ±  6%      +2.5        7.28        perf-profile.calltrace.cycles-pp.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
      4.81 ±  6%      +2.5        7.28        perf-profile.calltrace.cycles-pp.__vm_munmap.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
      4.79 ±  6%      +2.5        7.27        perf-profile.calltrace.cycles-pp.unmap_region.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap.__x64_sys_munmap
      4.80 ±  6%      +2.5        7.28        perf-profile.calltrace.cycles-pp.do_vmi_munmap.__vm_munmap.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe
      4.80 ±  6%      +2.5        7.28        perf-profile.calltrace.cycles-pp.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap.__x64_sys_munmap.do_syscall_64
     31.04 ±  3%      +3.1       34.10        perf-profile.calltrace.cycles-pp.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
     32.18 ±  3%      +3.2       35.42        perf-profile.calltrace.cycles-pp.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.testcase
     10.32 ±  4%      +3.6       13.90        perf-profile.calltrace.cycles-pp.copy_page.do_cow_fault.do_fault.__handle_mm_fault.handle_mm_fault
     23.83 ±  5%      +9.0       32.85        perf-profile.calltrace.cycles-pp.do_cow_fault.do_fault.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
     23.96 ±  5%      +9.0       33.00        perf-profile.calltrace.cycles-pp.do_fault.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault
     47.11 ±  2%      -8.6       38.50        perf-profile.children.cycles-pp.do_user_addr_fault
     47.25 ±  2%      -8.5       38.70        perf-profile.children.cycles-pp.exc_page_fault
      8.31 ±  6%      -8.3        0.00        perf-profile.children.cycles-pp.lock_mm_and_find_vma
      7.32 ±  4%      -7.1        0.18 ±  9%  perf-profile.children.cycles-pp.down_read_trylock
     54.76 ±  3%      -5.9       48.89        perf-profile.children.cycles-pp.asm_exc_page_fault
      3.55 ±  3%      -3.4        0.18 ±  8%  perf-profile.children.cycles-pp.up_read
     63.31 ±  3%      -2.7       60.56        perf-profile.children.cycles-pp.testcase
      2.19 ± 13%      -0.6        1.59 ±  6%  perf-profile.children.cycles-pp.lock_vma_under_rcu
      0.55 ± 10%      -0.2        0.37 ±  6%  perf-profile.children.cycles-pp.mtree_range_walk
      0.30 ± 11%      -0.1        0.18 ± 10%  perf-profile.children.cycles-pp.handle_pte_fault
      0.20 ± 13%      -0.1        0.12 ±  9%  perf-profile.children.cycles-pp.pte_offset_map_nolock
      0.14 ± 10%      -0.1        0.07 ± 10%  perf-profile.children.cycles-pp.access_error
      0.08 ± 14%      -0.0        0.04 ± 45%  perf-profile.children.cycles-pp.intel_idle
      0.07 ± 11%      +0.0        0.10 ± 12%  perf-profile.children.cycles-pp.xas_start
      0.05 ± 46%      +0.0        0.08 ±  7%  perf-profile.children.cycles-pp.policy_node
      0.11 ±  7%      +0.0        0.14 ± 12%  perf-profile.children.cycles-pp.folio_unlock
      0.15 ±  6%      +0.0        0.20 ± 10%  perf-profile.children.cycles-pp._raw_spin_trylock
      0.11 ± 10%      +0.0        0.15 ±  7%  perf-profile.children.cycles-pp.get_pfnblock_flags_mask
      0.12 ± 12%      +0.0        0.17 ±  6%  perf-profile.children.cycles-pp.mem_cgroup_update_lru_size
      0.13 ± 10%      +0.0        0.18 ±  5%  perf-profile.children.cycles-pp.uncharge_folio
      0.15 ±  8%      +0.0        0.20 ±  7%  perf-profile.children.cycles-pp.__mem_cgroup_uncharge_list
      0.11 ± 10%      +0.0        0.16 ±  6%  perf-profile.children.cycles-pp.shmem_get_policy
      0.15 ±  7%      +0.0        0.20 ±  4%  perf-profile.children.cycles-pp.try_charge_memcg
      0.13 ±  9%      +0.0        0.18 ±  9%  perf-profile.children.cycles-pp.cgroup_rstat_updated
      0.01 ±223%      +0.1        0.06 ± 23%  perf-profile.children.cycles-pp.perf_swevent_event
      0.20 ± 10%      +0.1        0.26 ±  4%  perf-profile.children.cycles-pp.__mod_zone_page_state
      0.17 ±  9%      +0.1        0.23 ±  8%  perf-profile.children.cycles-pp.__count_memcg_events
      0.14 ± 11%      +0.1        0.20 ±  2%  perf-profile.children.cycles-pp.free_swap_cache
      0.20 ±  6%      +0.1        0.25 ±  3%  perf-profile.children.cycles-pp.free_unref_page_prepare
      0.04 ± 45%      +0.1        0.10 ± 19%  perf-profile.children.cycles-pp.kthread_blkcg
      0.14 ±  8%      +0.1        0.20 ±  3%  perf-profile.children.cycles-pp.free_pages_and_swap_cache
      0.24 ±  8%      +0.1        0.30 ±  6%  perf-profile.children.cycles-pp.__list_add_valid_or_report
      0.23 ±  9%      +0.1        0.30 ±  4%  perf-profile.children.cycles-pp.free_unref_page_commit
      0.46 ±  4%      +0.1        0.55 ±  2%  perf-profile.children.cycles-pp.xas_load
      0.00            +0.1        0.11 ±  9%  perf-profile.children.cycles-pp.exit_to_user_mode_prepare
      0.34 ±  3%      +0.1        0.47 ±  6%  perf-profile.children.cycles-pp.charge_memcg
      0.32 ±  8%      +0.1        0.47 ±  6%  perf-profile.children.cycles-pp.__mod_memcg_lruvec_state
      0.00            +0.2        0.15 ± 16%  perf-profile.children.cycles-pp.put_page
      0.25 ±  7%      +0.2        0.41 ±  5%  perf-profile.children.cycles-pp.__mod_node_page_state
      0.20 ± 15%      +0.2        0.36 ± 12%  perf-profile.children.cycles-pp.blk_cgroup_congested
      1.42 ±  4%      +0.2        1.58        perf-profile.children.cycles-pp.__list_del_entry_valid_or_report
      0.23 ± 16%      +0.2        0.42 ± 10%  perf-profile.children.cycles-pp.__folio_throttle_swaprate
      0.36 ±  4%      +0.2        0.56 ±  5%  perf-profile.children.cycles-pp.__mod_lruvec_state
      0.91 ±  8%      +0.2        1.11 ±  7%  perf-profile.children.cycles-pp.__mem_cgroup_charge
      0.32 ±  9%      +0.2        0.53 ±  2%  perf-profile.children.cycles-pp.tlb_finish_mmu
      0.45 ±  6%      +0.2        0.68        perf-profile.children.cycles-pp.page_remove_rmap
      1.11 ±  4%      +0.2        1.34 ±  4%  perf-profile.children.cycles-pp.filemap_get_entry
      0.47 ± 12%      +0.2        0.72 ±  8%  perf-profile.children.cycles-pp.folio_add_new_anon_rmap
      0.47 ± 11%      +0.3        0.74 ±  6%  perf-profile.children.cycles-pp.__mod_lruvec_page_state
      0.88 ±  6%      +0.3        1.17 ±  4%  perf-profile.children.cycles-pp.lru_add_fn
      0.85 ±  2%      +0.3        1.16 ±  3%  perf-profile.children.cycles-pp.___perf_sw_event
      1.43 ±  4%      +0.3        1.78 ±  2%  perf-profile.children.cycles-pp.shmem_get_folio_gfp
      1.06 ±  2%      +0.4        1.47 ±  2%  perf-profile.children.cycles-pp.__perf_sw_event
      1.66 ±  3%      +0.4        2.10        perf-profile.children.cycles-pp.shmem_fault
      0.97 ±  6%      +0.5        1.44 ±  3%  perf-profile.children.cycles-pp.__free_one_page
      1.27 ±  4%      +0.5        1.74        perf-profile.children.cycles-pp.sync_regs
      1.75 ±  4%      +0.5        2.22        perf-profile.children.cycles-pp.__do_fault
      1.06 ±  6%      +0.5        1.58 ±  2%  perf-profile.children.cycles-pp.free_pcppages_bulk
      0.92 ±  5%      +0.5        1.45        perf-profile.children.cycles-pp._compound_head
      1.75 ±  5%      +0.6        2.36        perf-profile.children.cycles-pp.native_irq_return_iret
      1.74 ±  4%      +0.7        2.47 ±  2%  perf-profile.children.cycles-pp.free_unref_page_list
      0.83 ± 18%      +0.8        1.65 ±  2%  perf-profile.children.cycles-pp.folio_lruvec_lock_irqsave
      2.04 ±  8%      +0.9        2.92        perf-profile.children.cycles-pp.folio_batch_move_lru
      2.17 ±  7%      +0.9        3.11 ±  2%  perf-profile.children.cycles-pp.folio_add_lru_vma
      2.85 ±  4%      +1.0        3.82        perf-profile.children.cycles-pp.irqentry_exit_to_user_mode
      3.01 ±  5%      +1.1        4.14        perf-profile.children.cycles-pp._raw_spin_lock
      3.12 ±  7%      +1.1        4.26 ±  3%  perf-profile.children.cycles-pp.set_pte_range
      3.20 ±  3%      +1.2        4.37        perf-profile.children.cycles-pp.error_entry
      3.06 ±  5%      +1.2        4.24        perf-profile.children.cycles-pp.__pte_offset_map_lock
      3.22 ±  3%      +1.2        4.41        perf-profile.children.cycles-pp.__irqentry_text_end
      3.09 ±  6%      +1.6        4.70        perf-profile.children.cycles-pp.release_pages
      3.09 ±  6%      +1.6        4.72        perf-profile.children.cycles-pp.tlb_batch_pages_flush
      1.98 ± 10%      +1.7        3.67        perf-profile.children.cycles-pp.rmqueue_bulk
      2.44 ±  9%      +1.8        4.27        perf-profile.children.cycles-pp.rmqueue
      2.66 ±  8%      +1.9        4.57        perf-profile.children.cycles-pp.get_page_from_freelist
      3.14 ±  7%      +2.1        5.23        perf-profile.children.cycles-pp.__alloc_pages
      3.17 ±  8%      +2.1        5.28        perf-profile.children.cycles-pp.__folio_alloc
      4.48 ±  5%      +2.3        6.75        perf-profile.children.cycles-pp.unmap_vmas
      4.48 ±  5%      +2.3        6.75        perf-profile.children.cycles-pp.unmap_page_range
      4.48 ±  5%      +2.3        6.75        perf-profile.children.cycles-pp.zap_pmd_range
      4.48 ±  5%      +2.3        6.75        perf-profile.children.cycles-pp.zap_pte_range
      6.39 ±  6%      +2.3        8.68        perf-profile.children.cycles-pp.finish_fault
      3.68 ±  7%      +2.4        6.03        perf-profile.children.cycles-pp.vma_alloc_folio
      1.56 ± 21%      +2.4        3.92        perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      1.66 ± 19%      +2.4        4.08        perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      4.97 ±  5%      +2.4        7.42        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      4.96 ±  5%      +2.4        7.42        perf-profile.children.cycles-pp.do_syscall_64
      4.81 ±  6%      +2.5        7.28        perf-profile.children.cycles-pp.__munmap
      4.81 ±  6%      +2.5        7.28        perf-profile.children.cycles-pp.__x64_sys_munmap
      4.81 ±  6%      +2.5        7.28        perf-profile.children.cycles-pp.__vm_munmap
      4.80 ±  6%      +2.5        7.28        perf-profile.children.cycles-pp.do_vmi_munmap
      4.80 ±  6%      +2.5        7.28        perf-profile.children.cycles-pp.do_vmi_align_munmap
      4.80 ±  6%      +2.5        7.27        perf-profile.children.cycles-pp.unmap_region
     31.08 ±  3%      +3.1       34.13        perf-profile.children.cycles-pp.__handle_mm_fault
     32.25 ±  3%      +3.2       35.50        perf-profile.children.cycles-pp.handle_mm_fault
     10.33 ±  4%      +3.6       13.92        perf-profile.children.cycles-pp.copy_page
     23.97 ±  5%      +9.0       33.01        perf-profile.children.cycles-pp.do_fault
     23.88 ±  5%      +9.1       32.95        perf-profile.children.cycles-pp.do_cow_fault
      7.29 ±  4%      -7.1        0.18 ± 10%  perf-profile.self.cycles-pp.down_read_trylock
      6.77 ±  4%      -5.8        0.93 ±  8%  perf-profile.self.cycles-pp.__handle_mm_fault
      3.51 ±  3%      -3.3        0.18 ± 10%  perf-profile.self.cycles-pp.up_read
      0.54 ± 10%      -0.2        0.36 ±  6%  perf-profile.self.cycles-pp.mtree_range_walk
      0.10 ± 18%      -0.1        0.04 ± 72%  perf-profile.self.cycles-pp.handle_pte_fault
      0.12 ±  7%      -0.1        0.07 ± 10%  perf-profile.self.cycles-pp.access_error
      0.10 ± 18%      -0.1        0.05 ± 47%  perf-profile.self.cycles-pp.pte_offset_map_nolock
      0.08 ± 11%      -0.0        0.04 ± 44%  perf-profile.self.cycles-pp.do_fault
      0.08 ± 14%      -0.0        0.04 ± 45%  perf-profile.self.cycles-pp.intel_idle
      0.09 ±  6%      +0.0        0.11 ±  5%  perf-profile.self.cycles-pp.free_unref_page_prepare
      0.06 ±  7%      +0.0        0.09 ±  4%  perf-profile.self.cycles-pp.free_pcppages_bulk
      0.09 ±  6%      +0.0        0.12 ±  6%  perf-profile.self.cycles-pp.rmqueue_bulk
      0.10 ±  6%      +0.0        0.13 ± 10%  perf-profile.self.cycles-pp.charge_memcg
      0.11 ±  8%      +0.0        0.14 ±  4%  perf-profile.self.cycles-pp.__mod_lruvec_state
      0.08 ± 12%      +0.0        0.11 ±  9%  perf-profile.self.cycles-pp.__pte_offset_map_lock
      0.10 ± 10%      +0.0        0.14 ± 11%  perf-profile.self.cycles-pp.folio_unlock
      0.12 ± 11%      +0.0        0.16 ±  8%  perf-profile.self.cycles-pp.uncharge_folio
      0.12 ± 15%      +0.0        0.16 ±  4%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.10 ±  9%      +0.0        0.14 ±  5%  perf-profile.self.cycles-pp.get_pfnblock_flags_mask
      0.10 ±  7%      +0.0        0.15 ±  3%  perf-profile.self.cycles-pp.try_charge_memcg
      0.04 ± 71%      +0.0        0.08 ± 16%  perf-profile.self.cycles-pp.__do_fault
      0.15 ±  6%      +0.0        0.20 ± 10%  perf-profile.self.cycles-pp._raw_spin_trylock
      0.11 ±  9%      +0.0        0.16 ±  6%  perf-profile.self.cycles-pp.mem_cgroup_update_lru_size
      0.13 ±  9%      +0.0        0.17 ±  8%  perf-profile.self.cycles-pp.set_pte_range
      0.10 ±  9%      +0.0        0.15 ±  5%  perf-profile.self.cycles-pp.shmem_get_policy
      0.18 ±  9%      +0.0        0.24 ±  4%  perf-profile.self.cycles-pp.__mod_zone_page_state
      0.14 ± 10%      +0.0        0.18 ±  2%  perf-profile.self.cycles-pp.free_swap_cache
      0.10 ± 11%      +0.1        0.16 ± 10%  perf-profile.self.cycles-pp.exc_page_fault
      0.19 ± 11%      +0.1        0.24 ±  5%  perf-profile.self.cycles-pp.free_unref_page_commit
      0.12 ± 12%      +0.1        0.17 ± 10%  perf-profile.self.cycles-pp.cgroup_rstat_updated
      0.14 ±  8%      +0.1        0.20 ±  5%  perf-profile.self.cycles-pp.asm_exc_page_fault
      0.01 ±223%      +0.1        0.06 ± 23%  perf-profile.self.cycles-pp.perf_swevent_event
      0.17 ±  7%      +0.1        0.22 ±  7%  perf-profile.self.cycles-pp.xas_load
      0.16 ±  9%      +0.1        0.22 ±  5%  perf-profile.self.cycles-pp.folio_add_new_anon_rmap
      0.20 ±  8%      +0.1        0.26 ±  4%  perf-profile.self.cycles-pp.free_unref_page_list
      0.06 ± 14%      +0.1        0.13 ± 21%  perf-profile.self.cycles-pp.__mem_cgroup_charge
      0.22 ±  9%      +0.1        0.28 ±  7%  perf-profile.self.cycles-pp.__list_add_valid_or_report
      0.13 ±  6%      +0.1        0.19 ±  7%  perf-profile.self.cycles-pp.folio_add_lru_vma
      0.22 ±  7%      +0.1        0.29 ±  5%  perf-profile.self.cycles-pp.rmqueue
      0.24 ±  5%      +0.1        0.31 ±  6%  perf-profile.self.cycles-pp.shmem_fault
      0.21 ±  6%      +0.1        0.29 ±  4%  perf-profile.self.cycles-pp.get_page_from_freelist
      0.22 ±  7%      +0.1        0.30 ±  4%  perf-profile.self.cycles-pp.__perf_sw_event
      0.00            +0.1        0.10 ±  9%  perf-profile.self.cycles-pp.exit_to_user_mode_prepare
      0.29 ±  4%      +0.1        0.39 ±  6%  perf-profile.self.cycles-pp.shmem_get_folio_gfp
      0.32 ±  7%      +0.1        0.44 ±  4%  perf-profile.self.cycles-pp.zap_pte_range
      0.24 ±  9%      +0.1        0.36 ±  6%  perf-profile.self.cycles-pp.__mod_memcg_lruvec_state
      0.16 ± 15%      +0.1        0.29 ± 11%  perf-profile.self.cycles-pp.blk_cgroup_congested
      0.35 ±  7%      +0.1        0.48 ±  4%  perf-profile.self.cycles-pp.folio_batch_move_lru
      0.39 ±  5%      +0.1        0.53 ±  5%  perf-profile.self.cycles-pp.__alloc_pages
      0.31 ±  8%      +0.1        0.45 ±  2%  perf-profile.self.cycles-pp.vma_alloc_folio
      0.29 ±  9%      +0.1        0.44 ±  4%  perf-profile.self.cycles-pp.page_remove_rmap
      0.65 ±  7%      +0.1        0.80 ±  7%  perf-profile.self.cycles-pp.filemap_get_entry
      0.44 ±  7%      +0.2        0.59 ±  2%  perf-profile.self.cycles-pp.lru_add_fn
      0.00            +0.2        0.15 ± 16%  perf-profile.self.cycles-pp.put_page
      0.24 ±  7%      +0.2        0.39 ±  6%  perf-profile.self.cycles-pp.__mod_node_page_state
      1.41 ±  4%      +0.2        1.57        perf-profile.self.cycles-pp.__list_del_entry_valid_or_report
      0.57 ±  8%      +0.2        0.81 ±  5%  perf-profile.self.cycles-pp.release_pages
      0.75 ±  2%      +0.3        1.03 ±  2%  perf-profile.self.cycles-pp.___perf_sw_event
      0.91 ±  6%      +0.5        1.37 ±  3%  perf-profile.self.cycles-pp.__free_one_page
      1.27 ±  4%      +0.5        1.74        perf-profile.self.cycles-pp.sync_regs
      0.90 ±  5%      +0.5        1.42        perf-profile.self.cycles-pp._compound_head
      1.74 ±  5%      +0.6        2.36        perf-profile.self.cycles-pp.native_irq_return_iret
      2.82 ±  5%      +0.9        3.72        perf-profile.self.cycles-pp.irqentry_exit_to_user_mode
      2.99 ±  5%      +1.1        4.11        perf-profile.self.cycles-pp._raw_spin_lock
      3.18 ±  4%      +1.2        4.34        perf-profile.self.cycles-pp.error_entry
      3.22 ±  3%      +1.2        4.41        perf-profile.self.cycles-pp.__irqentry_text_end
      3.70 ±  4%      +1.3        5.00        perf-profile.self.cycles-pp.testcase
      1.56 ± 21%      +2.4        3.92        perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
     10.29 ±  4%      +3.6       13.86        perf-profile.self.cycles-pp.copy_page




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

