Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DD38839
	for <oe-lkp@lists.linux.dev>; Mon, 24 Jul 2023 15:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690211917; x=1721747917;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=ute4nY3xaH2oyHpP67gGPl2MNNifHl27D2upt3jwpzQ=;
  b=fo28XhYGCmPSEtUsunFM2XlBmDdB+7VB5AVxfqOUzvyOFbs+0usRjXOy
   hj52iVmRjKvnKZEdWnjr8VUR5VhH7A85bVhcnIhQHxvkHidllaB/lHjU+
   ZP5RjBOd1YvlEY6pGU9MkvZwCfa6l/Hlo9P3MogDd/5lAjxjsGyemUtCF
   PSIKe1bVgK1gelyYzd4rY8G/k2VeMceZGcZ7scX4a3/Etd0BdR/zX31ot
   iRhKCC/ECvzHslOVeb3e54Us+v8mUKbtIx48ApVbH5pAJNqPeGvCCWI6Y
   i3d6GwqdjgD1bMXY1wlOjxJrEeSkvDDCDpZKsOmpfCZlahhZ7Ds1u2p3N
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="357467204"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="yaml'?scan'208";a="357467204"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 08:18:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="719703716"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="yaml'?scan'208";a="719703716"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga007.jf.intel.com with ESMTP; 24 Jul 2023 08:18:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 08:18:34 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 24 Jul 2023 08:18:34 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 24 Jul 2023 08:18:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eHQt01N34jTSI83NF4BDU2GvK7KrEl+lVsyMBSrE6beK9eitwna7wQWaePjPL/yYD40NaqWdlkw9A3q8xUYUjJdSJoFbSyxa5OLi1LbWd4J6Nu77g5NNyd6I2D0WkeRcnx1I5XieMzlmFTNRZLI70StBNCSBGswrt+TkfOxEC6jbgCJ9VpIPSOAtgey7FBalYfG4sY+1DAaO6eaWxQBhDDOaKx8HONb4FJ7+E36BtMmw/+F3p7SzQGGry3QVYoUz/sGeopTgEOvivYjGswQ1UYbc+5IgZ0P/3OnzOfeKLtFbZHn0GNJz4mV+Dc4rHPhNHxYBFFjcYbqZk1P9JQS5Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gJsZOgMyafSktQJvBhXeAmQ030YgQOlZIOSqPFnLfjs=;
 b=nMV5JvGXDVxrtweKpRJmCxbCKrwvrKb7jYyNFr/+8JxZdhI+HNlVS7QyPtEhHhSeCiK6HyNhB+bSdjw9mowT24kpHGDgD/F91XnzeYfTPMbsQDDV2DqCSGlS1TBBLUvzZ30QCXnootwj+cHrOR6Q61Huvvo7wqt1IUFriCm/a9WwpVv0XHUN0CQTBLOBCx+h3SE9bDE9Q+po1fL5XWBV+MzGfYd55f3qw3c/TVV/cMfkYwU5Wo4/LRMaD71qRUmOuCOQEk5CqWvlWewIdibFjBWU6W+M4zFQG3JqRcYqrYOQ8iIbawEgGKro6/K6t8ia3/6LPTGyLrWdBm167aFBnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by PH7PR11MB7663.namprd11.prod.outlook.com (2603:10b6:510:27c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Mon, 24 Jul
 2023 15:18:27 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::1778:c00c:d5ff:da66]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::1778:c00c:d5ff:da66%6]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 15:18:26 +0000
Date: Mon, 24 Jul 2023 23:18:15 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <ying.huang@intel.com>,
	<feng.tang@intel.com>, <fengwei.yin@intel.com>, <aubrey.li@linux.intel.com>,
	<yu.c.chen@intel.com>, <oliver.sang@intel.com>
Subject: [tip:sched/eevdf] [sched/fair]  147f3efaa2:  hackbench.throughput
 -50.6% regression
Message-ID: <202307241126.4e722e87-oliver.sang@intel.com>
Content-Type: multipart/mixed; boundary="eiWryPIrJOFvxlHA"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR04CA0006.apcprd04.prod.outlook.com
 (2603:1096:4:197::13) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|PH7PR11MB7663:EE_
X-MS-Office365-Filtering-Correlation-Id: 14c9c714-fbe4-42aa-32e6-08db8c593a19
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UTBiYWFx3EBNBkcsdzmwaAql8FPBIQZfdtkQoedKMfeh+cIal5xAJ/Am/ZiHUZLONBc5yRoaDDc/Iv3e7S7Eurpl8iqbk8cPTqv1p/LEitP6cFMc3C9i2CjYCn8l8WMPgkBa2y07KwKUcFES3ggjdb4nAJKLp8U8eaM7mQLQ3GDQRuniIjJh8viKEFhdyqCO7bcOqUB6L/4NE0e2GfjW0LidgLX9ITSvVqmIro6Qs9ODrgg75QmnA4apm096hg9tS0rGhH1Sj8rfrn4naoysX6CLVFw3IHVb/ipp03yH8CVuh1cM/1GVp1vs8iIJD4UIcCpGVv8rYnQ0gIq6rR7WLWXgQhpU+5CUDclBljsNkpD9BpZxnGfk8nUDG+sIejig+N3I2mffiErxYcqZ2sJ7R/BuDv3PrCnb2jYw4AUWbF7T7nKmU03Kj1UoxEMdg7AwXwBkvxRDbyKlHCam37cRxu1rASwtoPkEZCgLvuxFD0usnHJPLatlQSkfV0uatxS10oo8S1pHtkejpUjrdTZ+nZTY0xj8gQvQ0WxHgU7Rpo6bXmrjz3RHl2Kf8naaIjFuUZmMC7o/ffs5emu4tLoAjMTCCwcVEes+5KkqGJfqdn+PXUI/OekgPkbeZIMMFzDr/VxiQ1Kb7T6vbTCXDOpF9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(39860400002)(366004)(346002)(376002)(451199021)(83380400001)(2616005)(30864003)(2906002)(19627235002)(38100700002)(82960400001)(6916009)(26005)(66556008)(66476007)(4326008)(66946007)(5660300002)(186003)(316002)(21490400003)(966005)(1076003)(6506007)(41300700001)(6486002)(6666004)(6512007)(44144004)(235185007)(478600001)(86362001)(8936002)(36756003)(8676002)(2700100001)(559001)(579004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?8LsP/qgp7tZMEFoq+mic++eo4R/IQuwxv3m/+0KhiyXJf2wFPx1d4o+POV?=
 =?iso-8859-1?Q?sy+Wrcv9w+WR+RpLkbMdV8idISM6G8Eu1kDZbHQZPbJ4pCW7pkRIZVhMig?=
 =?iso-8859-1?Q?DKl0HGNdIjdHjlM8zwB9NV2pj38PtOBNfNjTsR5xwJCXET3wWJoWNZpdcZ?=
 =?iso-8859-1?Q?ztEz/VNXW+gu8u1ownn0Vnv30001hx1ZWT4URyioNqOT2vmKpF0Fxd8NgM?=
 =?iso-8859-1?Q?JQ5sCscetUv2BxTjndxoZ2/lb1SYQ8JHrDhGSIr6Fq8qgF1kJmZOvILHJu?=
 =?iso-8859-1?Q?gNKwLZWwWb9nxc7eaAqPgahakYV18PdU033jIjK3K4oj9ZSXkYm3mBp92V?=
 =?iso-8859-1?Q?nfT/Wu2uizeLKfO8gPh80YKfEiH5T2A91W9G13v7QSJr5PkFlb0sXKHfrq?=
 =?iso-8859-1?Q?gg6/D+ajfDw3WZCjsw7vFE2Gs39cVjMKaYJxw9kRRm9tpKXo4GbKCHCINm?=
 =?iso-8859-1?Q?nKeUS+GeGd9YjT1wMdmozBo2tmJUnlXVYP4sW5bLCaeaybdqL/emqV9xZs?=
 =?iso-8859-1?Q?B78oG7Urhwsy7X5QIHCRtdhscmUPduoXgIMpvNiIC0NO5gKcOAY/JdMz0/?=
 =?iso-8859-1?Q?l6hLn/4CXmQiTP9Vnyruqx5cjXFMRW4hS2U5RWzW6oCLP9jS4PbUgp0Nqh?=
 =?iso-8859-1?Q?doaZdM0KAKZxooHkZ+cGBAXzplKGEC9nu//hBoadhS1qhsZP5YUK5/UjQw?=
 =?iso-8859-1?Q?fVrWwzElEC3HGiOWKx+q/PeTjStJ4jbZ+qSKE/TMfvB+2DL8NUrfwsF/+V?=
 =?iso-8859-1?Q?2Mns2aiy4DwMyhYL9/6HreD2aMTO4puxnEdazIesBYBrn++wx8K9IgnRuY?=
 =?iso-8859-1?Q?m/FYWR+gk10nctJPB+EzT3Dfjpq9y0j6uMbU68TmE5FnJFutPsEa3VoPwJ?=
 =?iso-8859-1?Q?l5V6CynZNzpm08Xgwf4jYIEa3hYJPGa+XvYve/lawlgJSu8G0HaozZt+xB?=
 =?iso-8859-1?Q?sXvXVKDYhDtXtu8zZnACMoiY4pB+g3AXwQKF/H0B9VigfnMtRmf1j50Bn7?=
 =?iso-8859-1?Q?7uGNgBkvJQkG4T/0FMzEzQp3RqP/TUoHaTVCSQbBgEPeWqvyWtp0Orrj/N?=
 =?iso-8859-1?Q?ui3uhQNv+zNhAxiSnuMjZ8aFzHv7Nk4sqYRf+TDVreu/Bo2uhSvEvJsV13?=
 =?iso-8859-1?Q?1RIWxgTAp4iUGFPwWF4n0EvpBA7YDx4kOL0L1iUrhxGyqg6kdTAirRPi1x?=
 =?iso-8859-1?Q?pEcbAlbrItn9UMKxaUnDnk7d6zE7PbPXxDdkFRvFjU5hBM/BfMUhD7tV0E?=
 =?iso-8859-1?Q?aZFtvGrWbx4WqP0V13RJAX5o8tIOjrhoSq0hLj1qBUJLv6p7otV98X36kM?=
 =?iso-8859-1?Q?0nJGzghdVlkuG3fWIIAmJbejAW4wyIBozY/cVCV4KWj3pSCMKGn14Oypvv?=
 =?iso-8859-1?Q?SY0QfrdpFMbZPufb0McFULZS/Ky3UaT6AGjsFea+0iDQxacr/4ARb7z9N+?=
 =?iso-8859-1?Q?fnVeiNnjN15FCRyOB79mbHKOaSgY6Lz0n7u24PiTtdD4CcHPXJTfO7sGfO?=
 =?iso-8859-1?Q?QajkRiVAN1j2YexrZneVrXfmrXO+JK+SliNbT9d9yyyPeYlBpG+G6ElBVn?=
 =?iso-8859-1?Q?seCxM7EC7+58qWnR8Gr5eYXUPXjPwEvm2nQic62j0e6QdQ7frV0sL3k1zj?=
 =?iso-8859-1?Q?E8UCV9mx+w8Vsyb4mJfOJ4eW3mrk4+jRQaPvuFXfSS6jmpoPQwjOSocQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14c9c714-fbe4-42aa-32e6-08db8c593a19
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 15:18:26.6539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ul7NMlebVOvfpPQgDG+wcEM+IKAqt6MpoSBWtxS9muF0t4Z1ngk19B8mJQo5dg4GgIqcfRTUP5K1phQE4Y3mFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7663
X-OriginatorOrg: intel.com

--eiWryPIrJOFvxlHA
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit



Hello,

kernel test robot noticed a -50.6% regression of hackbench.throughput on:


commit: 147f3efaa24182a21706bca15eab2f3f4630b5fe ("sched/fair: Implement an EEVDF-like scheduling policy")
https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git sched/eevdf

testcase: hackbench
test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory
parameters:

	nr_threads: 100%
	iterations: 4
	mode: threads
	ipc: socket
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+---------------------------------------------------------------------------------------------+
| testcase: change | hackbench: hackbench.throughput -12.6% regression                                           |
| test machine     | 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2.00GHz (Ice Lake) with 256G memory  |
| test parameters  | cpufreq_governor=performance                                                                |
|                  | ipc=socket                                                                                  |
|                  | iterations=4                                                                                |
|                  | mode=threads                                                                                |
|                  | nr_threads=50%                                                                              |
+------------------+---------------------------------------------------------------------------------------------+
| testcase: change | schbench: perf-c2c.HITM.total 979.4% regression                                             |
| test machine     | 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory |
| test parameters  | cpufreq_governor=performance                                                                |
|                  | iterations=3x                                                                               |
|                  | message_threads=1                                                                           |
|                  | runtime=30s                                                                                 |
|                  | worker_threads=512                                                                          |
+------------------+---------------------------------------------------------------------------------------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202307241126.4e722e87-oliver.sang@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


To reproduce:

        git clone https://github.com/intel/lkp-tests.git
        cd lkp-tests
        sudo bin/lkp install job.yaml           # job file is attached in this email
        bin/lkp split-job --compatible job.yaml # generate the yaml file for lkp run
        sudo bin/lkp run generated-yaml-file

        # if come across any failure that blocks the test,
        # please remove ~/.lkp and /lkp dir to run from a clean state.

=========================================================================================
compiler/cpufreq_governor/ipc/iterations/kconfig/mode/nr_threads/rootfs/tbox_group/testcase:
  gcc-12/performance/socket/4/x86_64-rhel-8.3/threads/100%/debian-11.1-x86_64-20220510.cgz/lkp-spr-r02/hackbench

commit: 
  99d4d26551 ("rbtree: Add rb_add_augmented_cached() helper")
  147f3efaa2 ("sched/fair: Implement an EEVDF-like scheduling policy")

99d4d26551b56f4e 147f3efaa24182a21706bca15ea 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    217.62           +82.8%     397.74        uptime.boot
 1.182e+09           -11.6%  1.045e+09 ±  3%  cpuidle..time
  14078559 ±  4%     -47.3%    7421140 ±  7%  cpuidle..usage
   7487715           -32.6%    5044352        vmstat.memory.cache
   1039525 ±  2%   +1621.9%   17900018 ±  3%  vmstat.system.cs
    455244           +25.4%     570909 ±  8%  vmstat.system.in
      2.85 ±  2%      -1.6        1.27 ±  7%  mpstat.cpu.all.idle%
      0.97            -0.2        0.81 ±  2%  mpstat.cpu.all.irq%
      0.02 ±  6%      -0.0        0.01 ±  2%  mpstat.cpu.all.soft%
      4.93 ±  2%      -1.2        3.73 ±  2%  mpstat.cpu.all.usr%
    710117 ± 29%   +1696.3%   12755899 ±  4%  numa-numastat.node0.local_node
    809102 ± 21%   +1486.1%   12833399 ±  4%  numa-numastat.node0.numa_hit
   2030255 ± 11%    +575.4%   13711507 ±  2%  numa-numastat.node1.local_node
   2175275 ±  7%    +537.4%   13866091 ±  2%  numa-numastat.node1.numa_hit
     39060 ±  7%     -77.0%       8972 ±  4%  perf-c2c.DRAM.local
      3013 ± 13%     +61.6%       4869 ± 12%  perf-c2c.DRAM.remote
     52768 ±  2%     -54.1%      24207 ± 12%  perf-c2c.HITM.local
    272.00 ± 33%    +953.0%       2864 ± 15%  perf-c2c.HITM.remote
     53040 ±  2%     -49.0%      27071 ± 12%  perf-c2c.HITM.total
   3843314 ± 10%     -54.3%    1757171 ±  5%  numa-meminfo.node1.Active
   3843210 ± 10%     -54.3%    1757083 ±  5%  numa-meminfo.node1.Active(anon)
    183240 ± 25%     +40.0%     256606 ± 19%  numa-meminfo.node1.AnonPages
   5301820 ± 18%     -58.8%    2185706 ±  4%  numa-meminfo.node1.FilePages
    557385 ± 19%     -39.2%     338666 ± 29%  numa-meminfo.node1.Mapped
   7011597 ± 16%     -48.3%    3627901 ±  3%  numa-meminfo.node1.MemUsed
   4306674 ± 10%     -50.0%    2154139 ±  2%  numa-meminfo.node1.Shmem
    809307 ± 21%   +1485.7%   12832896 ±  4%  numa-vmstat.node0.numa_hit
    710322 ± 29%   +1695.7%   12755396 ±  4%  numa-vmstat.node0.numa_local
    963964 ± 10%     -54.7%     436975 ±  6%  numa-vmstat.node1.nr_active_anon
     45727 ± 25%     +40.9%      64408 ± 20%  numa-vmstat.node1.nr_anon_pages
   1329383 ± 18%     -59.0%     544905 ±  5%  numa-vmstat.node1.nr_file_pages
    141501 ± 20%     -39.9%      85019 ± 27%  numa-vmstat.node1.nr_mapped
   1080596 ± 10%     -50.3%     537014 ±  3%  numa-vmstat.node1.nr_shmem
    963963 ± 10%     -54.7%     436975 ±  6%  numa-vmstat.node1.nr_zone_active_anon
   2175323 ±  7%    +537.4%   13865640 ±  2%  numa-vmstat.node1.numa_hit
   2030302 ± 11%    +575.3%   13711056 ±  2%  numa-vmstat.node1.numa_local
   3993526 ±  4%     -54.5%    1818405 ± 10%  turbostat.C1
      0.06 ±  7%      -0.0        0.02 ± 33%  turbostat.C1%
   9281710 ±  4%     -48.1%    4816823 ±  8%  turbostat.C1E
      1.58 ±  2%      -0.9        0.68 ±  4%  turbostat.C1E%
      1.26            -0.7        0.60 ±  3%  turbostat.C6%
      3.10           -51.2%       1.51 ±  3%  turbostat.CPU%c1
      0.30           -21.4%       0.24        turbostat.IPC
 1.105e+08          +109.8%  2.318e+08 ±  7%  turbostat.IRQ
     79.94 ±  4%     -28.6       51.38 ±  2%  turbostat.PKG_%
    675.53            -6.3%     632.84        turbostat.PkgWatt
     33.75           -25.2%      25.26        turbostat.RAMWatt
    624345 ±  2%     -50.6%     308417        hackbench.throughput
    594472           -50.4%     294601        hackbench.throughput_avg
    624345 ±  2%     -50.6%     308417        hackbench.throughput_best
    570619           -52.8%     269230 ±  2%  hackbench.throughput_worst
    179.33          +100.3%     359.17        hackbench.time.elapsed_time
    179.33          +100.3%     359.17        hackbench.time.elapsed_time.max
  24230990 ±  2%  +12163.0%  2.971e+09 ±  2%  hackbench.time.involuntary_context_switches
    295687           +14.0%     336983 ±  3%  hackbench.time.minor_page_faults
     21615            +1.7%      21985        hackbench.time.percent_of_cpu_this_job_got
     36864          +106.2%      76016        hackbench.time.system_time
      1902           +55.1%       2950        hackbench.time.user_time
  1.49e+08         +2156.4%  3.362e+09 ±  2%  hackbench.time.voluntary_context_switches
   4102216           -57.1%    1759415 ±  3%  meminfo.Active
   4102111           -57.1%    1759311 ±  3%  meminfo.Active(anon)
    155297 ±  5%     +18.9%     184641 ±  4%  meminfo.AnonHugePages
   7302799           -33.2%    4876509        meminfo.Cached
   5300024           -46.9%    2815386 ±  2%  meminfo.Committed_AS
   9324202 ±  8%     +15.2%   10737322 ±  3%  meminfo.DirectMap2M
    736786 ± 11%     -34.8%     480342 ± 21%  meminfo.Mapped
  10762837           -26.7%    7885348        meminfo.Memused
      7131 ±  5%     -18.0%       5848 ±  4%  meminfo.PageTables
   1042178           -10.7%     931126        meminfo.SUnreclaim
   4591217           -52.8%    2164893 ±  2%  meminfo.Shmem
  11468916           -20.7%    9099545 ±  2%  meminfo.max_used_kB
   1025199           -56.7%     444287 ±  4%  proc-vmstat.nr_active_anon
   6284557            +1.1%    6356478        proc-vmstat.nr_dirty_background_threshold
  12584480            +1.1%   12728499        proc-vmstat.nr_dirty_threshold
   1827110           -33.1%    1221631        proc-vmstat.nr_file_pages
  63222363            +1.1%   63942636        proc-vmstat.nr_free_pages
    167321            +4.7%     175178        proc-vmstat.nr_kernel_stack
    188102 ± 13%     -37.0%     118464 ± 23%  proc-vmstat.nr_mapped
      1785 ±  5%     -18.5%       1455 ±  5%  proc-vmstat.nr_page_table_pages
   1149213           -52.7%     543726 ±  3%  proc-vmstat.nr_shmem
     46177            -2.8%      44882        proc-vmstat.nr_slab_reclaimable
    260390           -10.3%     233676        proc-vmstat.nr_slab_unreclaimable
   1025199           -56.7%     444287 ±  4%  proc-vmstat.nr_zone_active_anon
   2986895          +794.0%   26701643 ±  3%  proc-vmstat.numa_hit
   2742806          +865.1%   26469557 ±  3%  proc-vmstat.numa_local
   4125389 ±  2%   +3533.7%  1.499e+08 ±  3%  proc-vmstat.pgalloc_normal
   1662469           +13.7%    1890991        proc-vmstat.pgfault
   2622664 ±  4%   +5589.9%  1.492e+08 ±  3%  proc-vmstat.pgfree
     70137 ±  2%     +16.1%      81426 ±  2%  proc-vmstat.pgreuse
    665900 ±  2%     +80.2%    1200050        proc-vmstat.unevictable_pgs_scanned
      6.36           -47.9%       3.31 ±  5%  perf-stat.i.MPKI
      0.33            +0.4        0.75        perf-stat.i.branch-miss-rate%
 1.952e+08          +123.7%  4.365e+08 ±  2%  perf-stat.i.branch-misses
 5.104e+08           -53.5%  2.373e+08 ±  3%  perf-stat.i.cache-misses
 2.044e+09           -50.9%  1.003e+09 ±  5%  perf-stat.i.cache-references
   1035056         +1828.7%   19963180 ±  2%  perf-stat.i.context-switches
      2.00           +21.1%       2.42        perf-stat.i.cpi
    225165           +23.9%     278904 ±  3%  perf-stat.i.cpu-clock
 6.286e+11           +21.0%  7.605e+11 ±  3%  perf-stat.i.cpu-cycles
      1546 ±  4%    +116.1%       3342 ±  3%  perf-stat.i.cycles-between-cache-misses
 8.774e+10            -5.6%  8.282e+10 ±  2%  perf-stat.i.dTLB-loads
      0.00 ± 13%      +0.0        0.01 ± 10%  perf-stat.i.dTLB-store-miss-rate%
   5.2e+10           -13.6%  4.491e+10 ±  2%  perf-stat.i.dTLB-stores
 3.242e+11            -6.0%  3.049e+11 ±  2%  perf-stat.i.instructions
      0.52           -17.9%       0.42        perf-stat.i.ipc
      0.03 ± 37%    +212.3%       0.11 ± 44%  perf-stat.i.major-faults
      2.80            -1.7%       2.75        perf-stat.i.metric.GHz
    738.18           -57.4%     314.77 ±  2%  perf-stat.i.metric.K/sec
    906.73           -22.2%     705.00        perf-stat.i.metric.M/sec
      8623 ± 11%     +38.9%      11979        perf-stat.i.minor-faults
     15.45 ±  7%     +25.3       40.77 ±  3%  perf-stat.i.node-load-miss-rate%
  17255555 ±  8%     +48.5%   25625060 ±  5%  perf-stat.i.node-load-misses
 1.446e+08           -74.4%   37043263 ±  3%  perf-stat.i.node-loads
      8623 ± 11%     +38.9%      11979        perf-stat.i.page-faults
    225165           +23.9%     278904 ±  3%  perf-stat.i.task-clock
      6.28           -54.0%       2.89 ±  2%  perf-stat.overall.MPKI
      0.31            +0.4        0.73        perf-stat.overall.branch-miss-rate%
      1.94           +27.6%       2.48        perf-stat.overall.cpi
      1230          +169.6%       3317        perf-stat.overall.cycles-between-cache-misses
      0.51           -21.6%       0.40        perf-stat.overall.ipc
     10.48 ±  8%     +26.0       36.51        perf-stat.overall.node-load-miss-rate%
 6.125e+10           -16.9%  5.092e+10        perf-stat.ps.branch-instructions
 1.926e+08           +92.1%    3.7e+08 ±  2%  perf-stat.ps.branch-misses
 5.077e+08           -62.5%  1.907e+08        perf-stat.ps.cache-misses
 2.019e+09           -63.5%  7.359e+08 ±  2%  perf-stat.ps.cache-references
   1010569         +1639.2%   17575724 ±  3%  perf-stat.ps.context-switches
 6.245e+11            +1.2%  6.323e+11        perf-stat.ps.cpu-cycles
    120079 ±  4%     -47.6%      62972 ± 16%  perf-stat.ps.cpu-migrations
   5988138 ±  9%     -21.3%    4712935 ±  5%  perf-stat.ps.dTLB-load-misses
 8.691e+10           -20.4%   6.92e+10        perf-stat.ps.dTLB-loads
 5.148e+10           -27.2%  3.748e+10        perf-stat.ps.dTLB-stores
 3.212e+11           -20.7%  2.549e+11        perf-stat.ps.instructions
      8744           -43.1%       4971 ±  2%  perf-stat.ps.minor-faults
 1.443e+08           -78.2%   31409439        perf-stat.ps.node-loads
      8744           -43.1%       4971 ±  2%  perf-stat.ps.page-faults
 5.783e+13           +58.8%  9.183e+13        perf-stat.total.instructions
 2.537e+10 ± 45%     -99.8%   38313906 ±  2%  sched_debug.cfs_rq:/.avg_vruntime.avg
  2.13e+12 ± 32%    -100.0%   53798406 ±  3%  sched_debug.cfs_rq:/.avg_vruntime.max
-2.649e+08          -112.8%   34016238 ±  2%  sched_debug.cfs_rq:/.avg_vruntime.min
 1.769e+11 ± 41%    -100.0%    2196833 ± 17%  sched_debug.cfs_rq:/.avg_vruntime.stddev
     20.15 ±  9%     +22.7%      24.71 ±  4%  sched_debug.cfs_rq:/.h_nr_running.avg
      6.33 ± 10%     +19.6%       7.58 ±  3%  sched_debug.cfs_rq:/.h_nr_running.stddev
     25417 ± 14%     -41.5%      14876        sched_debug.cfs_rq:/.load_avg.max
 2.537e+10 ± 45%     -99.8%   38313906 ±  2%  sched_debug.cfs_rq:/.min_vruntime.avg
  2.13e+12 ± 32%    -100.0%   53798406 ±  3%  sched_debug.cfs_rq:/.min_vruntime.max
  15796809 ± 22%    +115.3%   34016238 ±  2%  sched_debug.cfs_rq:/.min_vruntime.min
 1.769e+11 ± 41%    -100.0%    2196833 ± 17%  sched_debug.cfs_rq:/.min_vruntime.stddev
      0.69 ±  9%     +22.4%       0.84        sched_debug.cfs_rq:/.nr_running.avg
      0.13 ± 25%     -52.8%       0.06 ± 19%  sched_debug.cfs_rq:/.nr_running.stddev
    167.33 ± 17%     -40.9%      98.86 ± 18%  sched_debug.cfs_rq:/.removed.util_avg.max
     20651 ±  9%     +25.3%      25878 ±  4%  sched_debug.cfs_rq:/.runnable_avg.avg
    763.33 ± 29%    +398.8%       3807 ± 59%  sched_debug.cfs_rq:/.runnable_avg.min
    721.61 ±  6%     +21.0%     872.95        sched_debug.cfs_rq:/.util_avg.avg
    132.12 ± 34%    +198.4%     394.31 ± 22%  sched_debug.cfs_rq:/.util_avg.min
    174.54 ± 15%     -38.8%     106.86 ± 14%  sched_debug.cfs_rq:/.util_avg.stddev
    146889 ± 13%     +49.7%     219928 ± 12%  sched_debug.cpu.avg_idle.stddev
    113787 ± 12%     +76.7%     201112        sched_debug.cpu.clock.avg
    114015 ± 12%     +78.3%     203289        sched_debug.cpu.clock.max
    113549 ± 13%     +74.7%     198333        sched_debug.cpu.clock.min
    133.35 ± 24%   +1009.9%       1480 ± 32%  sched_debug.cpu.clock.stddev
    112874 ± 12%     +76.8%     199545        sched_debug.cpu.clock_task.avg
    113218 ± 12%     +78.2%     201796        sched_debug.cpu.clock_task.max
    100146 ± 14%     +84.0%     184267        sched_debug.cpu.clock_task.min
    880.62 ±  2%    +124.5%       1976 ± 20%  sched_debug.cpu.clock_task.stddev
     19731 ± 15%     +23.5%      24372 ±  2%  sched_debug.cpu.curr->pid.avg
      4141 ± 42%    +340.1%      18224 ± 14%  sched_debug.cpu.curr->pid.min
      9870 ± 31%     +97.0%      19440 ± 23%  sched_debug.cpu.max_idle_balance_cost.stddev
      0.00 ± 18%    +939.2%       0.00 ± 32%  sched_debug.cpu.next_balance.stddev
     20.15 ±  9%     +22.6%      24.70 ±  4%  sched_debug.cpu.nr_running.avg
      6.34 ± 10%     +19.7%       7.58 ±  3%  sched_debug.cpu.nr_running.stddev
    338017 ± 18%   +3400.8%   11833439 ±  5%  sched_debug.cpu.nr_switches.avg
    472116 ± 14%   +2611.5%   12801402 ±  5%  sched_debug.cpu.nr_switches.max
    217988 ± 26%   +3143.0%    7069338 ± 11%  sched_debug.cpu.nr_switches.min
     27762 ± 22%   +2279.8%     660693 ±  6%  sched_debug.cpu.nr_switches.stddev
    113548 ± 13%     +74.6%     198269        sched_debug.cpu_clk
    112341 ± 13%     +75.4%     197063        sched_debug.ktime
      0.00 ± 14%     -52.4%       0.00 ± 44%  sched_debug.rt_rq:.rt_nr_migratory.avg
      0.29 ± 14%     -52.4%       0.14 ± 44%  sched_debug.rt_rq:.rt_nr_migratory.max
      0.02 ± 14%     -52.4%       0.01 ± 44%  sched_debug.rt_rq:.rt_nr_migratory.stddev
      0.00 ± 14%     -52.4%       0.00 ± 44%  sched_debug.rt_rq:.rt_nr_running.avg
      0.29 ± 14%     -52.4%       0.14 ± 44%  sched_debug.rt_rq:.rt_nr_running.max
      0.02 ± 14%     -52.4%       0.01 ± 44%  sched_debug.rt_rq:.rt_nr_running.stddev
    114427 ± 12%     +74.0%     199153        sched_debug.sched_clk
 1.172e+08          +329.0%  5.029e+08        sched_debug.sysctl_sched.sysctl_sched_features
      2.86 ±  8%   +7084.1%     205.34 ± 30%  perf-sched.sch_delay.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      4.97 ±  5%   +1476.0%      78.34 ± 77%  perf-sched.sch_delay.avg.ms.__cond_resched.aa_sk_perm.security_socket_recvmsg.sock_recvmsg.sock_read_iter
      4.22 ±  9%   +1052.2%      48.59 ± 36%  perf-sched.sch_delay.avg.ms.__cond_resched.aa_sk_perm.security_socket_sendmsg.sock_write_iter.vfs_write
      0.20 ± 14%  +21143.8%      42.59 ± 56%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      6.98 ± 10%   +1553.9%     115.46 ± 40%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      6.65 ±  2%    +127.4%      15.13 ± 33%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.27 ±131%  +36648.8%      98.98 ± 82%  perf-sched.sch_delay.avg.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      1917 ± 95%     -97.8%      41.28 ±143%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
      0.52 ± 93%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.__flush_work.isra.0
      0.12 ± 97%  +19698.5%      24.72 ± 49%  perf-sched.sch_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      8.47 ±  2%    +525.3%      52.95 ± 41%  perf-sched.sch_delay.avg.ms.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
      7.14 ±  2%     +63.9%      11.69 ± 41%  perf-sched.sch_delay.avg.ms.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
     44.77 ± 32%  +37960.6%      17039 ± 31%  perf-sched.sch_delay.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
     71.02 ± 42%  +14647.3%      10473 ± 52%  perf-sched.sch_delay.max.ms.__cond_resched.aa_sk_perm.security_socket_recvmsg.sock_recvmsg.sock_read_iter
     40.77 ± 60%  +27252.8%      11152 ± 26%  perf-sched.sch_delay.max.ms.__cond_resched.aa_sk_perm.security_socket_sendmsg.sock_write_iter.vfs_write
     64.59 ± 55%  +15401.6%      10012 ± 41%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
     37.91 ± 65%  +15591.3%       5949 ± 71%  perf-sched.sch_delay.max.ms.__cond_resched.mutex_lock.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
     23.69 ± 19%   +5362.6%       1293 ±193%  perf-sched.sch_delay.max.ms.__cond_resched.wait_for_unix_gc.unix_stream_sendmsg.sock_write_iter.vfs_write
     19.98 ± 22%   +7251.9%       1468 ±174%  perf-sched.sch_delay.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
     32.24 ± 33%  +39618.5%      12804 ± 26%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
     51.19 ± 47%  +15405.3%       7937 ± 75%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      1304 ±126%   +1235.0%      17412 ± 31%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
     18.17 ±149%   +8747.3%       1607 ± 76%  perf-sched.sch_delay.max.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      2592 ± 83%     -98.4%      41.28 ±143%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
      0.52 ± 93%    -100.0%       0.00        perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.__flush_work.isra.0
     30.32 ± 89%   +6385.8%       1966 ± 63%  perf-sched.sch_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      1309 ±123%   +1192.5%      16928 ± 31%  perf-sched.sch_delay.max.ms.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
      1304 ±126%   +1228.1%      17327 ± 31%  perf-sched.sch_delay.max.ms.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
      7.58          +115.7%      16.36 ± 37%  perf-sched.total_sch_delay.average.ms
      3700 ± 39%    +370.9%      17424 ± 31%  perf-sched.total_sch_delay.max.ms
     17.03          +257.5%      60.89 ± 33%  perf-sched.total_wait_and_delay.average.ms
   4726756           -49.6%    2380019        perf-sched.total_wait_and_delay.count.ms
      6063 ± 36%    +475.8%      34909 ± 31%  perf-sched.total_wait_and_delay.max.ms
      9.45 ±  2%    +371.4%      44.53 ± 32%  perf-sched.total_wait_time.average.ms
      4596 ±  4%    +294.2%      18118 ± 31%  perf-sched.total_wait_time.max.ms
    391.48 ± 38%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
    218.04 ±  6%     -96.1%       8.42 ±223%  perf-sched.wait_and_delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
     18.97 ±141%   +7278.3%       1399 ± 92%  perf-sched.wait_and_delay.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      8.97 ±141%   +4530.9%     415.34 ± 31%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
     14.45 ±  2%    +290.9%      56.51 ± 29%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
    692.95 ± 12%    +516.7%       4273 ± 46%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
    452.27          +845.4%       4275 ± 45%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
     18.82 ±  2%   +1139.2%     233.22 ± 35%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
     15.58 ±  2%    +141.1%      37.58 ± 37%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
    631.02 ± 15%    +434.5%       3372 ± 48%  perf-sched.wait_and_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      5.17 ±  7%    -100.0%       0.00        perf-sched.wait_and_delay.count.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
    103.17 ±  3%     -95.8%       4.33 ±223%  perf-sched.wait_and_delay.count.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
     38.00 ±144%   +1366.7%     557.33 ± 10%  perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
    651091 ±  2%     +41.4%     920615 ±  2%  perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
     16.67 ± 10%     -74.0%       4.33 ± 17%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
     12.00 ±  6%     -69.4%       3.67 ± 20%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
     19.50 ±  2%     -76.1%       4.67 ± 23%  perf-sched.wait_and_delay.count.schedule_timeout.kcompactd.kthread.ret_from_fork
   1845378           -93.4%     122710 ±  5%  perf-sched.wait_and_delay.count.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
   2216553 ±  2%     -40.5%    1318166        perf-sched.wait_and_delay.count.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
      1110 ± 33%     -70.9%     322.67 ± 10%  perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1180 ± 23%     -71.3%     338.83 ±  5%  perf-sched.wait_and_delay.count.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      1020          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      1051           -84.0%     168.40 ±223%  perf-sched.wait_and_delay.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
    802.69 ±141%   +1126.1%       9842 ± 57%  perf-sched.wait_and_delay.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
    351.48 ±141%   +7099.3%      25304 ± 28%  perf-sched.wait_and_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      2852 ±109%   +1120.9%      34828 ± 31%  perf-sched.wait_and_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      1887 ± 67%    +758.5%      16205 ± 33%  perf-sched.wait_and_delay.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      1043         +1092.7%      12444 ± 32%  perf-sched.wait_and_delay.max.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
    504.85         +2545.6%      13356 ± 31%  perf-sched.wait_and_delay.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      3243 ± 99%    +946.1%      33934 ± 31%  perf-sched.wait_and_delay.max.ms.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
      2660 ±122%   +1202.7%      34655 ± 31%  perf-sched.wait_and_delay.max.ms.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
      3762 ± 15%    +309.7%      15413 ± 21%  perf-sched.wait_and_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      4480 ±  3%    +260.7%      16159 ± 23%  perf-sched.wait_and_delay.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      3.99 ±  6%  +16428.8%     658.92 ± 29%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      6.48 ±  3%   +1994.2%     135.77 ± 51%  perf-sched.wait_time.avg.ms.__cond_resched.aa_sk_perm.security_socket_recvmsg.sock_recvmsg.sock_read_iter
      5.61 ±  5%   +3703.3%     213.42 ± 24%  perf-sched.wait_time.avg.ms.__cond_resched.aa_sk_perm.security_socket_sendmsg.sock_write_iter.vfs_write
      0.01 ± 72%  +1.3e+05%      12.84 ±188%  perf-sched.wait_time.avg.ms.__cond_resched.dput.__fput.task_work_run.exit_to_user_mode_loop
      2.55 ±  3%   +4290.6%     112.01 ± 38%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      5.08         +1590.7%      85.82 ±126%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      4.82 ± 13%   +3300.8%     164.01 ± 57%  perf-sched.wait_time.avg.ms.__cond_resched.wait_for_unix_gc.unix_stream_sendmsg.sock_write_iter.vfs_write
    503.15 ± 55%    -100.0%       0.01 ±137%  perf-sched.wait_time.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    386.55 ± 38%     -98.5%       5.85 ±164%  perf-sched.wait_time.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      7.21 ± 96%    -100.0%       0.00        perf-sched.wait_time.avg.ms.do_task_dead.do_exit.__x64_sys_exit.do_syscall_64.entry_SYSCALL_64_after_hwframe
    214.80 ±  6%     -93.3%      14.33 ± 69%  perf-sched.wait_time.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
     23.43 ± 97%   +5578.9%       1330 ± 89%  perf-sched.wait_time.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
     11.79 ± 46%   +2442.9%     299.88 ± 30%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      9.67 ± 11%   +1376.1%     142.78 ± 64%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      7.80 ±  2%    +430.5%      41.38 ± 28%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      2.02 ±177%     -99.9%       0.00 ±223%  perf-sched.wait_time.avg.ms.pipe_write.vfs_write.ksys_write.do_syscall_64
      2.18 ± 16%  +10330.0%     227.65 ± 56%  perf-sched.wait_time.avg.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
    684.28 ± 12%    +523.7%       4268 ± 46%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      7.77 ± 33%   +2471.1%     199.67 ±193%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    452.24          +845.4%       4275 ± 45%  perf-sched.wait_time.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      2.56 ± 46%    -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_timeout.khugepaged_wait_work.khugepaged.kthread
      6.07 ± 29%   +1035.8%      68.96 ± 38%  perf-sched.wait_time.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     10.35 ±  2%   +1641.5%     180.27 ± 33%  perf-sched.wait_time.avg.ms.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
      8.45 ±  2%    +206.4%      25.88 ± 35%  perf-sched.wait_time.avg.ms.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
      0.23 ± 83%   +1291.7%       3.26 ±131%  perf-sched.wait_time.avg.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
    597.98 ± 17%    +461.9%       3360 ± 48%  perf-sched.wait_time.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     52.23 ± 23%  +33038.8%      17307 ± 32%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
     71.10 ± 41%  +20186.0%      14422 ± 41%  perf-sched.wait_time.max.ms.__cond_resched.aa_sk_perm.security_socket_recvmsg.sock_recvmsg.sock_read_iter
     39.40 ±  9%  +39654.0%      15662 ± 31%  perf-sched.wait_time.max.ms.__cond_resched.aa_sk_perm.security_socket_sendmsg.sock_write_iter.vfs_write
      0.01 ± 72%  +2.7e+05%      26.30 ±183%  perf-sched.wait_time.max.ms.__cond_resched.dput.__fput.task_work_run.exit_to_user_mode_loop
     77.54 ± 44%  +16059.3%      12529 ± 19%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
     42.65 ± 53%  +20012.2%       8578 ± 34%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
     27.08 ± 21%  +39676.6%      10772 ± 49%  perf-sched.wait_time.max.ms.__cond_resched.wait_for_unix_gc.unix_stream_sendmsg.sock_write_iter.vfs_write
    843.73 ± 44%    -100.0%       0.01 ±166%  perf-sched.wait_time.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      1010           -99.0%      10.21 ±186%  perf-sched.wait_time.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
    187.84 ± 60%    -100.0%       0.00        perf-sched.wait_time.max.ms.do_task_dead.do_exit.__x64_sys_exit.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1025           -80.5%     200.17 ± 87%  perf-sched.wait_time.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
    826.56 ±135%   +1061.4%       9599 ± 59%  perf-sched.wait_time.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
    367.47 ±127%   +4091.2%      15401 ± 33%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
    271.77 ±131%   +3885.0%      10830 ± 34%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      1733 ± 80%    +907.0%      17460 ± 31%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      1425 ± 30%    +926.5%      14629 ± 30%  perf-sched.wait_time.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      4.60 ±172%     -99.9%       0.00 ±223%  perf-sched.wait_time.max.ms.pipe_write.vfs_write.ksys_write.do_syscall_64
     23.90 ±115%   +8460.3%       2045 ± 48%  perf-sched.wait_time.max.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      1021         +1117.3%      12440 ± 32%  perf-sched.wait_time.max.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
     35.90 ± 31%   +5829.9%       2128 ±208%  perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    504.84         +2545.6%      13356 ± 31%  perf-sched.wait_time.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      2.56 ± 46%    -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_timeout.khugepaged_wait_work.khugepaged.kthread
    191.93 ± 61%   +1200.0%       2495 ± 46%  perf-sched.wait_time.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      2074 ± 94%    +729.7%      17209 ± 34%  perf-sched.wait_time.max.ms.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
      1382 ±115%   +1156.3%      17370 ± 31%  perf-sched.wait_time.max.ms.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
      3762 ± 15%    +309.7%      15413 ± 21%  perf-sched.wait_time.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      4480 ±  3%    +250.7%      15711 ± 18%  perf-sched.wait_time.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      6.78 ±  9%      -4.5        2.23 ± 11%  perf-profile.calltrace.cycles-pp.unix_stream_read_actor.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      6.73 ±  9%      -4.5        2.21 ± 11%  perf-profile.calltrace.cycles-pp.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      6.64 ±  9%      -4.5        2.16 ± 11%  perf-profile.calltrace.cycles-pp.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic.unix_stream_recvmsg
     55.71            -2.7       52.96        perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read.start_thread
      3.69 ±  9%      -2.5        1.15 ± 11%  perf-profile.calltrace.cycles-pp._copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic
     56.44            -2.5       53.90        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__libc_read.start_thread
     56.21            -2.5       53.72        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read.start_thread
      3.48 ±  9%      -2.4        1.04 ± 11%  perf-profile.calltrace.cycles-pp.copyout._copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor
     54.75            -2.4       52.33        perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read
     57.46            -2.4       55.10        perf-profile.calltrace.cycles-pp.__libc_read.start_thread
      3.78 ±  8%      -2.4        1.43 ± 15%  perf-profile.calltrace.cycles-pp.kmem_cache_free.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
     53.52            -2.1       51.44        perf-profile.calltrace.cycles-pp.sock_read_iter.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
     53.11            -2.0       51.12        perf-profile.calltrace.cycles-pp.sock_recvmsg.sock_read_iter.vfs_read.ksys_read.do_syscall_64
      2.76 ±  9%      -1.8        0.90 ± 13%  perf-profile.calltrace.cycles-pp.simple_copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic
     52.58            -1.8       50.74        perf-profile.calltrace.cycles-pp.unix_stream_recvmsg.sock_recvmsg.sock_read_iter.vfs_read.ksys_read
     52.39            -1.8       50.57 ±  2%  perf-profile.calltrace.cycles-pp.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter.vfs_read
      2.64 ±  9%      -1.8        0.84 ± 14%  perf-profile.calltrace.cycles-pp.__check_object_size.simple_copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor
      2.62 ±  9%      -1.8        0.84 ± 15%  perf-profile.calltrace.cycles-pp.__slab_free.skb_release_data.consume_skb.unix_stream_read_generic.unix_stream_recvmsg
      2.80 ±  8%      -1.6        1.21 ± 12%  perf-profile.calltrace.cycles-pp.skb_release_head_state.consume_skb.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      2.74 ±  8%      -1.6        1.18 ± 13%  perf-profile.calltrace.cycles-pp.unix_destruct_scm.skb_release_head_state.consume_skb.unix_stream_read_generic.unix_stream_recvmsg
      2.15 ±  9%      -1.5        0.62 ± 19%  perf-profile.calltrace.cycles-pp.check_heap_object.__check_object_size.simple_copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter
      2.60 ±  8%      -1.5        1.11 ± 13%  perf-profile.calltrace.cycles-pp.sock_wfree.unix_destruct_scm.skb_release_head_state.consume_skb.unix_stream_read_generic
      1.66 ±  7%      -1.4        0.26 ±100%  perf-profile.calltrace.cycles-pp.__entry_text_start.__libc_write.start_thread
      1.64 ±  7%      -1.4        0.26 ±100%  perf-profile.calltrace.cycles-pp.__entry_text_start.__libc_read.start_thread
      2.08 ±  9%      -1.0        1.05 ± 34%  perf-profile.calltrace.cycles-pp._raw_spin_lock.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write
      1.75 ±  9%      -0.8        0.99 ±  6%  perf-profile.calltrace.cycles-pp.__pthread_disable_asynccancel.start_thread
      1.56 ±  9%      -0.8        0.81 ± 10%  perf-profile.calltrace.cycles-pp.__kmem_cache_free.skb_release_data.consume_skb.unix_stream_read_generic.unix_stream_recvmsg
      0.97 ±  7%      -0.6        0.36 ± 71%  perf-profile.calltrace.cycles-pp.memcg_slab_post_alloc_hook.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      1.07 ± 11%      -0.6        0.49 ± 46%  perf-profile.calltrace.cycles-pp.skb_set_owner_w.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter.vfs_write
      1.30 ±  7%      -0.5        0.80 ±  6%  perf-profile.calltrace.cycles-pp.skb_copy_datagram_from_iter.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write
      0.00            +0.6        0.59 ±  7%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read.start_thread
      0.00            +0.8        0.83 ± 18%  perf-profile.calltrace.cycles-pp.pick_next_task_fair.__schedule.schedule.schedule_timeout.unix_stream_data_wait
      0.00            +0.8        0.83 ± 18%  perf-profile.calltrace.cycles-pp.enqueue_entity.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_wake_up
      0.00            +1.0        0.98 ± 24%  perf-profile.calltrace.cycles-pp.pick_next_task_fair.__schedule.schedule.exit_to_user_mode_loop.exit_to_user_mode_prepare
      0.00            +1.2        1.18 ± 11%  perf-profile.calltrace.cycles-pp.dequeue_task_fair.__schedule.schedule.schedule_timeout.unix_stream_data_wait
      0.00            +1.3        1.30 ± 10%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.get_partial_node.get_any_partial.___slab_alloc.kmem_cache_alloc_node
      0.00            +1.3        1.34 ± 10%  perf-profile.calltrace.cycles-pp.get_partial_node.get_any_partial.___slab_alloc.kmem_cache_alloc_node.__alloc_skb
      0.00            +1.3        1.35 ± 10%  perf-profile.calltrace.cycles-pp.get_any_partial.___slab_alloc.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags
      0.00            +1.4        1.40 ± 22%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.get_partial_node.get_any_partial.___slab_alloc.__kmem_cache_alloc_node
      0.00            +1.4        1.41 ± 14%  perf-profile.calltrace.cycles-pp.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_wake_up.autoremove_wake_function
      0.00            +1.4        1.44 ± 22%  perf-profile.calltrace.cycles-pp.get_partial_node.get_any_partial.___slab_alloc.__kmem_cache_alloc_node.__kmalloc_node_track_caller
      0.00            +1.5        1.45 ± 22%  perf-profile.calltrace.cycles-pp.get_any_partial.___slab_alloc.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve
      0.00            +1.5        1.46 ± 14%  perf-profile.calltrace.cycles-pp.activate_task.ttwu_do_activate.try_to_wake_up.autoremove_wake_function.__wake_up_common
     36.91            +1.6       38.48 ±  2%  perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write.start_thread
      0.00            +1.8        1.77 ± 24%  perf-profile.calltrace.cycles-pp.__schedule.schedule.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      0.00            +1.9        1.85 ± 15%  perf-profile.calltrace.cycles-pp.ttwu_do_activate.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock
     27.76 ±  3%      +1.9       29.61 ±  2%  perf-profile.calltrace.cycles-pp.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write
      0.00            +1.9        1.86 ± 24%  perf-profile.calltrace.cycles-pp.schedule.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.00            +1.9        1.94 ± 24%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
     35.64            +1.9       37.59 ±  2%  perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
     26.24 ±  4%      +2.4       28.63 ±  3%  perf-profile.calltrace.cycles-pp.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter.vfs_write
     34.46            +2.4       36.85 ±  2%  perf-profile.calltrace.cycles-pp.sock_write_iter.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +2.4        2.40 ± 24%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
     26.06 ±  4%      +2.5       28.53 ±  3%  perf-profile.calltrace.cycles-pp.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
      0.00            +2.5        2.50 ± 23%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write.start_thread
      0.00            +2.7        2.70 ± 14%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.get_partial_node.get_any_partial.___slab_alloc
     33.38 ±  2%      +2.8       36.22 ±  2%  perf-profile.calltrace.cycles-pp.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write.do_syscall_64
      0.00            +2.9        2.94 ± 13%  perf-profile.calltrace.cycles-pp.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock.sock_def_readable
      0.00            +3.0        3.00 ± 13%  perf-profile.calltrace.cycles-pp.autoremove_wake_function.__wake_up_common.__wake_up_common_lock.sock_def_readable.unix_stream_sendmsg
      0.00            +3.1        3.06 ± 13%  perf-profile.calltrace.cycles-pp.__wake_up_common.__wake_up_common_lock.sock_def_readable.unix_stream_sendmsg.sock_write_iter
      0.00            +3.1        3.10 ± 13%  perf-profile.calltrace.cycles-pp.__schedule.schedule.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic
      0.00            +3.2        3.21 ± 13%  perf-profile.calltrace.cycles-pp.schedule.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
      0.00            +3.3        3.33 ± 12%  perf-profile.calltrace.cycles-pp.__wake_up_common_lock.sock_def_readable.unix_stream_sendmsg.sock_write_iter.vfs_write
      0.00            +3.3        3.34 ± 13%  perf-profile.calltrace.cycles-pp.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      0.17 ±141%      +3.4        3.62 ± 14%  perf-profile.calltrace.cycles-pp.sock_def_readable.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write
     37.66            +3.7       41.33        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__libc_write.start_thread
     37.42            +3.7       41.16        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write.start_thread
     38.68            +3.8       42.46        perf-profile.calltrace.cycles-pp.__libc_write.start_thread
      0.00            +3.9        3.94 ± 13%  perf-profile.calltrace.cycles-pp.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      7.57 ± 19%      +4.0       11.61 ± 14%  perf-profile.calltrace.cycles-pp.get_partial_node.___slab_alloc.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags
      7.18 ± 20%      +4.2       11.34 ± 15%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.get_partial_node.___slab_alloc.kmem_cache_alloc_node.__alloc_skb
      7.15 ± 20%      +4.2       11.31 ± 15%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.get_partial_node.___slab_alloc.kmem_cache_alloc_node
     10.09 ± 14%      +4.4       14.45 ± 11%  perf-profile.calltrace.cycles-pp.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg
      7.98 ± 18%      +5.3       13.25 ± 13%  perf-profile.calltrace.cycles-pp.___slab_alloc.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
     11.35 ± 20%      +8.5       19.90 ± 14%  perf-profile.calltrace.cycles-pp.__unfreeze_partials.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
     11.08 ± 20%      +8.6       19.67 ± 14%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__unfreeze_partials.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
     10.94 ± 20%      +8.6       19.55 ± 14%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__unfreeze_partials.unix_stream_read_generic.unix_stream_recvmsg
      6.80 ±  9%      -4.6        2.25 ± 11%  perf-profile.children.cycles-pp.unix_stream_read_actor
      6.76 ±  9%      -4.5        2.22 ± 11%  perf-profile.children.cycles-pp.skb_copy_datagram_iter
      6.67 ±  9%      -4.5        2.18 ± 11%  perf-profile.children.cycles-pp.__skb_datagram_iter
     55.76            -2.8       53.00        perf-profile.children.cycles-pp.ksys_read
     58.23            -2.7       55.52        perf-profile.children.cycles-pp.__libc_read
      3.74 ±  9%      -2.6        1.17 ± 10%  perf-profile.children.cycles-pp._copy_to_iter
      3.53 ±  9%      -2.5        1.07 ± 11%  perf-profile.children.cycles-pp.copyout
     54.83            -2.5       52.38        perf-profile.children.cycles-pp.vfs_read
      3.81 ±  8%      -2.4        1.45 ± 15%  perf-profile.children.cycles-pp.kmem_cache_free
      3.52 ±  8%      -2.3        1.22 ± 16%  perf-profile.children.cycles-pp.__slab_free
      3.42 ±  8%      -2.1        1.31 ± 10%  perf-profile.children.cycles-pp.__check_object_size
     53.54            -2.1       51.46        perf-profile.children.cycles-pp.sock_read_iter
     53.15            -2.0       51.16        perf-profile.children.cycles-pp.sock_recvmsg
      2.78 ±  9%      -1.9        0.92 ± 13%  perf-profile.children.cycles-pp.simple_copy_to_iter
     52.51            -1.9       50.64 ±  2%  perf-profile.children.cycles-pp.unix_stream_read_generic
     52.60            -1.8       50.76        perf-profile.children.cycles-pp.unix_stream_recvmsg
      2.56 ±  9%      -1.7        0.87 ± 15%  perf-profile.children.cycles-pp.check_heap_object
      2.83 ±  8%      -1.6        1.22 ± 13%  perf-profile.children.cycles-pp.skb_release_head_state
      2.77 ±  8%      -1.6        1.20 ± 13%  perf-profile.children.cycles-pp.unix_destruct_scm
      2.64 ±  8%      -1.5        1.13 ± 13%  perf-profile.children.cycles-pp.sock_wfree
      1.85 ±  7%      -0.9        0.99 ±  6%  perf-profile.children.cycles-pp.__entry_text_start
      1.74 ±  7%      -0.8        0.93 ±  6%  perf-profile.children.cycles-pp.mod_objcg_state
      1.82 ±  7%      -0.8        1.04 ±  7%  perf-profile.children.cycles-pp.memcg_slab_post_alloc_hook
      1.78 ±  9%      -0.8        1.00 ±  6%  perf-profile.children.cycles-pp.__pthread_disable_asynccancel
      1.60 ±  9%      -0.8        0.83 ± 10%  perf-profile.children.cycles-pp.__kmem_cache_free
      1.35 ±  7%      -0.5        0.83 ±  6%  perf-profile.children.cycles-pp.skb_copy_datagram_from_iter
      1.08 ± 11%      -0.5        0.58 ± 12%  perf-profile.children.cycles-pp.skb_set_owner_w
      1.38 ±  9%      -0.4        0.96 ± 17%  perf-profile.children.cycles-pp.__fdget_pos
      1.25 ± 10%      -0.4        0.89 ± 18%  perf-profile.children.cycles-pp.__fget_light
      0.76 ±  7%      -0.3        0.41 ±  7%  perf-profile.children.cycles-pp.obj_cgroup_charge
      0.78 ±  7%      -0.3        0.46 ±  6%  perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.79 ±  5%      -0.3        0.47 ±  7%  perf-profile.children.cycles-pp.security_file_permission
      0.58 ±  8%      -0.3        0.31 ±  8%  perf-profile.children.cycles-pp.__pthread_enable_asynccancel
      0.62 ± 15%      -0.3        0.35 ±  5%  perf-profile.children.cycles-pp.get_obj_cgroup_from_current
      0.52 ±  9%      -0.3        0.26 ±  9%  perf-profile.children.cycles-pp.skb_unlink
      0.63 ±  8%      -0.2        0.39 ±  7%  perf-profile.children.cycles-pp.__cond_resched
      0.43 ±  8%      -0.2        0.20 ±  6%  perf-profile.children.cycles-pp.__check_heap_object
      0.59 ±  5%      -0.2        0.36 ±  7%  perf-profile.children.cycles-pp.apparmor_file_permission
      0.49 ±  7%      -0.2        0.27 ±  6%  perf-profile.children.cycles-pp.refill_obj_stock
      0.62 ±  9%      -0.2        0.40 ± 12%  perf-profile.children.cycles-pp.aa_sk_perm
      0.54 ±  7%      -0.2        0.35 ±  6%  perf-profile.children.cycles-pp._copy_from_iter
      0.45 ±  9%      -0.2        0.28 ± 11%  perf-profile.children.cycles-pp.security_socket_sendmsg
      0.34 ± 21%      -0.2        0.18 ±  7%  perf-profile.children.cycles-pp.__get_obj_cgroup_from_memcg
      0.43 ±  8%      -0.2        0.27 ± 11%  perf-profile.children.cycles-pp.security_socket_recvmsg
      0.43 ±  6%      -0.2        0.27 ± 15%  perf-profile.children.cycles-pp.unix_write_space
      0.48 ±  7%      -0.1        0.34 ±  7%  perf-profile.children.cycles-pp.fput
      0.40 ±  7%      -0.1        0.26 ±  7%  perf-profile.children.cycles-pp.copyin
      0.34 ±  8%      -0.1        0.20 ±  7%  perf-profile.children.cycles-pp.rcu_all_qs
      0.26 ±  7%      -0.1        0.14 ±  8%  perf-profile.children.cycles-pp.__get_task_ioprio
      0.30 ±  6%      -0.1        0.19 ±  7%  perf-profile.children.cycles-pp.__virt_addr_valid
      0.24 ±  9%      -0.1        0.12 ±  7%  perf-profile.children.cycles-pp.obj_cgroup_uncharge_pages
      0.39 ±  7%      -0.1        0.28 ±  6%  perf-profile.children.cycles-pp.mutex_lock
      0.22 ±  8%      -0.1        0.12 ±  8%  perf-profile.children.cycles-pp.syscall_enter_from_user_mode
      0.25 ±  8%      -0.1        0.16 ±  7%  perf-profile.children.cycles-pp.aa_file_perm
      0.19 ±  9%      -0.1        0.10 ±  9%  perf-profile.children.cycles-pp.memcg_account_kmem
      0.19 ±  7%      -0.1        0.11 ±  5%  perf-profile.children.cycles-pp.kmalloc_slab
      0.18 ±  7%      -0.1        0.10 ±  4%  perf-profile.children.cycles-pp.wait_for_unix_gc
      0.16 ±  2%      -0.1        0.08 ± 11%  perf-profile.children.cycles-pp.put_cpu_partial
      0.26 ±  7%      -0.1        0.19 ±  5%  perf-profile.children.cycles-pp.mutex_unlock
      0.12 ±  8%      -0.1        0.05 ± 13%  perf-profile.children.cycles-pp.try_charge_memcg
      0.15 ±  6%      -0.1        0.08 ±  9%  perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.13 ±  7%      -0.1        0.07 ±  7%  perf-profile.children.cycles-pp.unix_scm_to_skb
      0.16 ±  7%      -0.1        0.10 ±  8%  perf-profile.children.cycles-pp.kmalloc_size_roundup
      0.10 ±  9%      -0.1        0.04 ± 45%  perf-profile.children.cycles-pp.refill_stock
      0.13 ±  8%      -0.1        0.07 ±  9%  perf-profile.children.cycles-pp.rw_verify_area
      0.12 ±  7%      -0.1        0.06 ±  7%  perf-profile.children.cycles-pp.security_socket_getpeersec_dgram
      0.14 ±  6%      -0.1        0.09 ±  5%  perf-profile.children.cycles-pp.__scm_recv_common
      0.12 ±  7%      -0.1        0.07 ±  8%  perf-profile.children.cycles-pp.kfree
      0.12 ±  9%      -0.1        0.06 ± 11%  perf-profile.children.cycles-pp.__mod_memcg_lruvec_state
      0.14 ±  6%      -0.1        0.09 ±  7%  perf-profile.children.cycles-pp.__build_skb_around
      0.10 ±  6%      -0.0        0.05 ±  8%  perf-profile.children.cycles-pp.maybe_add_creds
      0.10 ±  9%      -0.0        0.06 ±  6%  perf-profile.children.cycles-pp.put_pid
      0.09 ±  7%      -0.0        0.04 ± 44%  perf-profile.children.cycles-pp.fsnotify_perm
      0.10 ±  6%      -0.0        0.06 ±  8%  perf-profile.children.cycles-pp.is_vmalloc_addr
      0.24 ±  6%      -0.0        0.19 ±  7%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.10 ±  9%      -0.0        0.06 ± 11%  perf-profile.children.cycles-pp.check_stack_object
      0.12 ±  4%      -0.0        0.08 ±  7%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
      0.06            +0.0        0.10 ± 10%  perf-profile.children.cycles-pp.__list_add_valid
      0.00            +0.1        0.07 ± 20%  perf-profile.children.cycles-pp.avg_vruntime
      0.00            +0.1        0.07 ± 14%  perf-profile.children.cycles-pp.cpuacct_charge
      0.00            +0.1        0.08 ± 16%  perf-profile.children.cycles-pp.switch_mm_irqs_off
      0.00            +0.1        0.08 ± 20%  perf-profile.children.cycles-pp.__rb_insert_augmented
      0.00            +0.1        0.08 ± 21%  perf-profile.children.cycles-pp.__rdgsbase_inactive
      0.00            +0.1        0.08 ±  8%  perf-profile.children.cycles-pp.update_rq_clock_task
      0.00            +0.1        0.09 ± 24%  perf-profile.children.cycles-pp.entity_eligible
      0.00            +0.1        0.09 ± 18%  perf-profile.children.cycles-pp.__calc_delta
      0.00            +0.1        0.10 ± 19%  perf-profile.children.cycles-pp.place_entity
      0.00            +0.1        0.10 ± 17%  perf-profile.children.cycles-pp.native_sched_clock
      0.00            +0.1        0.11 ± 15%  perf-profile.children.cycles-pp.sched_clock
      0.00            +0.1        0.12 ± 15%  perf-profile.children.cycles-pp.update_min_vruntime
      0.00            +0.1        0.13 ± 19%  perf-profile.children.cycles-pp.finish_wait
      0.00            +0.1        0.13 ± 16%  perf-profile.children.cycles-pp.sched_clock_cpu
      0.00            +0.1        0.14 ± 23%  perf-profile.children.cycles-pp.__wrgsbase_inactive
      0.00            +0.2        0.17 ± 16%  perf-profile.children.cycles-pp.update_rq_clock
      0.00            +0.2        0.17 ±  9%  perf-profile.children.cycles-pp.finish_task_switch
      0.00            +0.2        0.19 ±112%  perf-profile.children.cycles-pp.select_idle_cpu
      0.00            +0.2        0.23 ± 20%  perf-profile.children.cycles-pp.___perf_sw_event
      0.00            +0.3        0.27 ± 88%  perf-profile.children.cycles-pp.select_idle_sibling
      0.00            +0.3        0.27 ± 18%  perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
      0.06 ± 13%      +0.3        0.35 ± 18%  perf-profile.children.cycles-pp.__switch_to_asm
      0.00            +0.3        0.31 ± 21%  perf-profile.children.cycles-pp.os_xsave
      0.00            +0.3        0.34 ± 17%  perf-profile.children.cycles-pp.__update_load_avg_se
      0.00            +0.4        0.35 ± 18%  perf-profile.children.cycles-pp.check_preempt_wakeup
      0.00            +0.4        0.36 ± 16%  perf-profile.children.cycles-pp.prepare_task_switch
      0.06 ±  9%      +0.4        0.43 ± 18%  perf-profile.children.cycles-pp.__switch_to
      0.08 ± 10%      +0.4        0.46 ± 30%  perf-profile.children.cycles-pp.update_cfs_group
      0.00            +0.4        0.38 ± 65%  perf-profile.children.cycles-pp.select_task_rq_fair
      0.00            +0.4        0.39 ± 17%  perf-profile.children.cycles-pp.check_preempt_curr
      0.00            +0.4        0.39 ± 18%  perf-profile.children.cycles-pp.reweight_entity
      0.00            +0.4        0.42 ± 20%  perf-profile.children.cycles-pp.__dequeue_entity
      0.00            +0.4        0.42 ± 57%  perf-profile.children.cycles-pp.select_task_rq
      0.00            +0.4        0.45 ± 43%  perf-profile.children.cycles-pp.prepare_to_wait
      0.00            +0.5        0.45 ± 22%  perf-profile.children.cycles-pp.put_prev_entity
      0.00            +0.5        0.50 ± 19%  perf-profile.children.cycles-pp.__enqueue_entity
      0.05 ±  7%      +0.5        0.56 ± 12%  perf-profile.children.cycles-pp.dequeue_entity
      0.12 ±  9%      +0.5        0.64 ± 20%  perf-profile.children.cycles-pp.restore_fpregs_from_fpstate
      0.16 ±  8%      +0.6        0.79 ± 18%  perf-profile.children.cycles-pp.switch_fpu_return
      0.00            +0.6        0.64 ± 20%  perf-profile.children.cycles-pp.pick_eevdf
      0.05 ±  7%      +0.7        0.72 ± 20%  perf-profile.children.cycles-pp.update_curr
      0.02 ± 99%      +0.7        0.70 ± 19%  perf-profile.children.cycles-pp.set_next_entity
      0.08 ±  8%      +0.8        0.92 ± 12%  perf-profile.children.cycles-pp.enqueue_entity
      0.10 ±  8%      +0.8        0.94 ± 11%  perf-profile.children.cycles-pp.update_load_avg
      0.10 ±  5%      +1.1        1.22 ± 10%  perf-profile.children.cycles-pp.dequeue_task_fair
     94.16            +1.2       95.32        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     93.83            +1.2       95.03        perf-profile.children.cycles-pp.do_syscall_64
      0.12 ±  5%      +1.4        1.50 ± 10%  perf-profile.children.cycles-pp.enqueue_task_fair
      0.13 ±  5%      +1.4        1.54 ± 10%  perf-profile.children.cycles-pp.activate_task
     36.99            +1.5       38.54 ±  2%  perf-profile.children.cycles-pp.ksys_write
      0.15 ±  5%      +1.8        1.95 ± 11%  perf-profile.children.cycles-pp.ttwu_do_activate
     27.80 ±  3%      +1.8       29.63 ±  2%  perf-profile.children.cycles-pp.sock_alloc_send_pskb
      0.10 ±  8%      +1.8        1.94 ± 19%  perf-profile.children.cycles-pp.pick_next_task_fair
     35.73            +1.9       37.65 ±  2%  perf-profile.children.cycles-pp.vfs_write
      0.01 ±223%      +2.0        2.02 ± 21%  perf-profile.children.cycles-pp.exit_to_user_mode_loop
     34.50            +2.4       36.87 ±  2%  perf-profile.children.cycles-pp.sock_write_iter
     26.26 ±  4%      +2.4       28.64 ±  3%  perf-profile.children.cycles-pp.alloc_skb_with_frags
     26.12 ±  4%      +2.4       28.57 ±  3%  perf-profile.children.cycles-pp.__alloc_skb
      0.61 ±  7%      +2.5        3.15 ± 19%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      0.34 ±  7%      +2.6        2.94 ± 20%  perf-profile.children.cycles-pp.exit_to_user_mode_prepare
     33.56            +2.8       36.31 ±  2%  perf-profile.children.cycles-pp.unix_stream_sendmsg
      0.24 ±  5%      +2.8        3.03 ± 13%  perf-profile.children.cycles-pp.try_to_wake_up
      0.00            +2.8        2.80 ± 14%  perf-profile.children.cycles-pp.get_any_partial
      0.25 ±  5%      +2.8        3.09 ± 13%  perf-profile.children.cycles-pp.autoremove_wake_function
      0.26 ±  6%      +2.9        3.14 ± 13%  perf-profile.children.cycles-pp.__wake_up_common
      0.42 ±  7%      +3.0        3.44 ± 12%  perf-profile.children.cycles-pp.schedule_timeout
      0.50 ±  6%      +3.1        3.63 ± 14%  perf-profile.children.cycles-pp.sock_def_readable
      0.26 ±  6%      +3.2        3.42 ± 13%  perf-profile.children.cycles-pp.__wake_up_common_lock
     39.49            +3.4       42.91        perf-profile.children.cycles-pp.__libc_write
      0.27 ±  6%      +3.7        3.98 ± 13%  perf-profile.children.cycles-pp.unix_stream_data_wait
     10.16 ± 14%      +4.3       14.49 ± 11%  perf-profile.children.cycles-pp.kmem_cache_alloc_node
      0.41 ±  6%      +4.7        5.13 ± 15%  perf-profile.children.cycles-pp.__schedule
      0.41 ±  6%      +4.8        5.23 ± 15%  perf-profile.children.cycles-pp.schedule
     19.20 ±  9%      +5.7       24.90 ±  5%  perf-profile.children.cycles-pp.___slab_alloc
     18.40 ±  9%      +5.9       24.27 ±  5%  perf-profile.children.cycles-pp.get_partial_node
     27.58 ±  9%      +9.3       36.85 ±  5%  perf-profile.children.cycles-pp.__unfreeze_partials
     45.53 ±  9%     +15.8       61.28 ±  4%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
     44.27 ±  9%     +16.0       60.30 ±  4%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      3.48 ±  9%      -2.4        1.04 ± 11%  perf-profile.self.cycles-pp.copyout
      3.49 ±  8%      -2.3        1.20 ± 16%  perf-profile.self.cycles-pp.__slab_free
      2.98 ±  8%      -2.0        1.01 ± 19%  perf-profile.self.cycles-pp.kmem_cache_free
      2.99 ±  9%      -1.7        1.26 ± 10%  perf-profile.self.cycles-pp.unix_stream_read_generic
      2.14 ±  9%      -1.5        0.62 ± 20%  perf-profile.self.cycles-pp.check_heap_object
      2.22 ±  9%      -1.4        0.86 ± 13%  perf-profile.self.cycles-pp.sock_wfree
      2.32 ±  9%      -0.9        1.38 ± 13%  perf-profile.self.cycles-pp._raw_spin_lock
      1.61 ±  7%      -0.9        0.74 ± 13%  perf-profile.self.cycles-pp.__alloc_skb
      1.72 ±  9%      -0.8        0.96 ±  6%  perf-profile.self.cycles-pp.__pthread_disable_asynccancel
      1.56 ±  7%      -0.7        0.83 ±  6%  perf-profile.self.cycles-pp.mod_objcg_state
      0.91 ± 10%      -0.7        0.25 ±  8%  perf-profile.self.cycles-pp.skb_release_data
      1.07 ± 11%      -0.5        0.57 ± 12%  perf-profile.self.cycles-pp.skb_set_owner_w
      1.12 ±  7%      -0.5        0.62 ± 10%  perf-profile.self.cycles-pp.memcg_slab_post_alloc_hook
      0.93 ±  7%      -0.4        0.52 ±  6%  perf-profile.self.cycles-pp.__libc_write
      0.90 ±  7%      -0.4        0.51 ±  6%  perf-profile.self.cycles-pp.__libc_read
      0.74 ±  6%      -0.4        0.37 ±  8%  perf-profile.self.cycles-pp.__kmem_cache_alloc_node
      0.73 ±  9%      -0.4        0.37 ± 13%  perf-profile.self.cycles-pp.__kmem_cache_free
      1.22 ± 10%      -0.3        0.87 ± 18%  perf-profile.self.cycles-pp.__fget_light
      0.76 ±  7%      -0.3        0.44 ±  6%  perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.61 ±  7%      -0.3        0.32 ±  6%  perf-profile.self.cycles-pp.kmem_cache_alloc_node
      0.55 ±  8%      -0.3        0.29 ±  7%  perf-profile.self.cycles-pp.__pthread_enable_asynccancel
      0.67 ±  7%      -0.2        0.43 ±  9%  perf-profile.self.cycles-pp.vfs_write
      0.79            -0.2        0.56 ±  4%  perf-profile.self.cycles-pp.___slab_alloc
      0.40 ±  8%      -0.2        0.19 ±  7%  perf-profile.self.cycles-pp.__check_heap_object
      0.49 ±  8%      -0.2        0.28 ±  8%  perf-profile.self.cycles-pp.sock_write_iter
      0.46 ±  7%      -0.2        0.25 ±  6%  perf-profile.self.cycles-pp.refill_obj_stock
      0.44 ±  7%      -0.2        0.25 ±  7%  perf-profile.self.cycles-pp.obj_cgroup_charge
      0.41 ±  7%      -0.2        0.22 ±  6%  perf-profile.self.cycles-pp.__entry_text_start
      0.38 ±  7%      -0.2        0.21 ±  6%  perf-profile.self.cycles-pp.__check_object_size
      0.33 ±  7%      -0.2        0.16 ±  9%  perf-profile.self.cycles-pp.consume_skb
      0.32 ± 22%      -0.2        0.17 ±  7%  perf-profile.self.cycles-pp.__get_obj_cgroup_from_memcg
      0.35 ±  8%      -0.1        0.21 ±  8%  perf-profile.self.cycles-pp.__cond_resched
      0.69 ±  7%      -0.1        0.55 ±  8%  perf-profile.self.cycles-pp.vfs_read
      0.46 ±  7%      -0.1        0.32 ±  7%  perf-profile.self.cycles-pp.fput
      0.42 ±  9%      -0.1        0.29 ± 14%  perf-profile.self.cycles-pp.aa_sk_perm
      0.33 ±  4%      -0.1        0.20 ±  9%  perf-profile.self.cycles-pp.apparmor_file_permission
      0.39 ±  8%      -0.1        0.26 ±  6%  perf-profile.self.cycles-pp.copyin
      0.22 ±  7%      -0.1        0.12 ±  6%  perf-profile.self.cycles-pp._copy_to_iter
      0.43            -0.1        0.33 ±  3%  perf-profile.self.cycles-pp.get_partial_node
      0.22 ±  7%      -0.1        0.12 ± 10%  perf-profile.self.cycles-pp.__get_task_ioprio
      0.45            -0.1        0.34 ±  3%  perf-profile.self.cycles-pp.__unfreeze_partials
      0.27 ±  8%      -0.1        0.16 ±  5%  perf-profile.self.cycles-pp.get_obj_cgroup_from_current
      0.28 ±  7%      -0.1        0.18 ±  6%  perf-profile.self.cycles-pp.__virt_addr_valid
      0.28 ±  6%      -0.1        0.18 ±  7%  perf-profile.self.cycles-pp.unix_write_space
      0.22 ±  6%      -0.1        0.12 ±  6%  perf-profile.self.cycles-pp.security_file_permission
      0.23 ±  7%      -0.1        0.13 ± 11%  perf-profile.self.cycles-pp.sock_alloc_send_pskb
      0.19 ±  8%      -0.1        0.10 ±  9%  perf-profile.self.cycles-pp.ksys_write
      0.18 ±  8%      -0.1        0.10 ±  6%  perf-profile.self.cycles-pp.syscall_enter_from_user_mode
      0.21 ±  8%      -0.1        0.12 ±  6%  perf-profile.self.cycles-pp.rcu_all_qs
      0.16 ±  3%      -0.1        0.08 ± 10%  perf-profile.self.cycles-pp.put_cpu_partial
      0.16 ±  5%      -0.1        0.09 ±  5%  perf-profile.self.cycles-pp.__skb_datagram_iter
      0.38 ±  9%      -0.1        0.30 ±  7%  perf-profile.self.cycles-pp.sock_read_iter
      0.16 ±  9%      -0.1        0.08 ±  8%  perf-profile.self.cycles-pp.memcg_account_kmem
      0.17 ±  7%      -0.1        0.10 ±  9%  perf-profile.self.cycles-pp.kmalloc_slab
      0.20 ±  7%      -0.1        0.13 ± 10%  perf-profile.self.cycles-pp.aa_file_perm
      0.27 ±  6%      -0.1        0.20 ±  7%  perf-profile.self.cycles-pp.mutex_lock
      0.25 ±  6%      -0.1        0.18 ±  6%  perf-profile.self.cycles-pp.mutex_unlock
      0.15 ±  6%      -0.1        0.08 ±  9%  perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.36 ±  6%      -0.1        0.29 ±  9%  perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.16 ±  6%      -0.1        0.09 ±  7%  perf-profile.self.cycles-pp.skb_copy_datagram_from_iter
      0.14 ±  7%      -0.1        0.08 ±  6%  perf-profile.self.cycles-pp.alloc_skb_with_frags
      0.13 ±  7%      -0.1        0.07 ±  5%  perf-profile.self.cycles-pp.__kmalloc_node_track_caller
      0.14 ±  7%      -0.1        0.08 ±  4%  perf-profile.self.cycles-pp.kmalloc_reserve
      0.19 ±  6%      -0.1        0.14 ±  8%  perf-profile.self.cycles-pp.ksys_read
      0.13 ±  6%      -0.1        0.08 ±  6%  perf-profile.self.cycles-pp.__fdget_pos
      0.11 ±  7%      -0.1        0.06 ±  9%  perf-profile.self.cycles-pp.unix_scm_to_skb
      0.09 ±  7%      -0.1        0.03 ± 70%  perf-profile.self.cycles-pp.skb_copy_datagram_iter
      0.10 ±  7%      -0.1        0.05 ±  7%  perf-profile.self.cycles-pp.unix_destruct_scm
      0.09 ±  7%      -0.0        0.04 ± 45%  perf-profile.self.cycles-pp.skb_queue_tail
      0.10 ±  9%      -0.0        0.06 ±  9%  perf-profile.self.cycles-pp.rw_verify_area
      0.13 ±  6%      -0.0        0.08 ±  8%  perf-profile.self.cycles-pp._copy_from_iter
      0.11 ±  6%      -0.0        0.06 ± 11%  perf-profile.self.cycles-pp.kfree
      0.12 ±  8%      -0.0        0.07 ±  5%  perf-profile.self.cycles-pp.__scm_recv_common
      0.10 ±  8%      -0.0        0.06 ±  8%  perf-profile.self.cycles-pp.security_socket_sendmsg
      0.09 ±  7%      -0.0        0.04 ± 45%  perf-profile.self.cycles-pp.skb_unlink
      0.24 ±  7%      -0.0        0.19 ±  7%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.10 ±  9%      -0.0        0.06 ±  9%  perf-profile.self.cycles-pp.security_socket_recvmsg
      0.26 ±  6%      -0.0        0.22 ± 10%  perf-profile.self.cycles-pp.do_syscall_64
      0.09 ± 10%      -0.0        0.05 ±  7%  perf-profile.self.cycles-pp.__mod_memcg_lruvec_state
      0.09 ±  7%      -0.0        0.05        perf-profile.self.cycles-pp.security_socket_getpeersec_dgram
      0.08 ±  7%      -0.0        0.04 ± 44%  perf-profile.self.cycles-pp.check_stack_object
      0.12 ±  8%      -0.0        0.08 ±  6%  perf-profile.self.cycles-pp.__build_skb_around
      0.17 ±  7%      -0.0        0.13 ±  9%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.07 ±  6%      -0.0        0.06 ±  8%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
      0.06 ±  6%      +0.0        0.09 ±  9%  perf-profile.self.cycles-pp.__list_add_valid
      0.00            +0.1        0.06 ± 14%  perf-profile.self.cycles-pp.avg_vruntime
      0.00            +0.1        0.07 ± 10%  perf-profile.self.cycles-pp.cpuacct_charge
      0.00            +0.1        0.07 ± 18%  perf-profile.self.cycles-pp.__rb_insert_augmented
      0.00            +0.1        0.07 ± 12%  perf-profile.self.cycles-pp.switch_mm_irqs_off
      0.00            +0.1        0.08 ± 10%  perf-profile.self.cycles-pp.update_rq_clock_task
      0.00            +0.1        0.08 ± 27%  perf-profile.self.cycles-pp.entity_eligible
      0.00            +0.1        0.08 ± 20%  perf-profile.self.cycles-pp.check_preempt_wakeup
      0.00            +0.1        0.08 ± 20%  perf-profile.self.cycles-pp.__calc_delta
      0.00            +0.1        0.08 ± 20%  perf-profile.self.cycles-pp.__rdgsbase_inactive
      0.00            +0.1        0.09 ± 24%  perf-profile.self.cycles-pp.exit_to_user_mode_loop
      0.00            +0.1        0.09 ± 25%  perf-profile.self.cycles-pp.select_task_rq_fair
      0.00            +0.1        0.10 ± 13%  perf-profile.self.cycles-pp.enqueue_task_fair
      0.00            +0.1        0.10 ± 13%  perf-profile.self.cycles-pp.native_sched_clock
      0.00            +0.1        0.10 ± 19%  perf-profile.self.cycles-pp.dequeue_entity
      0.00            +0.1        0.10 ± 14%  perf-profile.self.cycles-pp.dequeue_task_fair
      0.00            +0.1        0.11 ± 16%  perf-profile.self.cycles-pp.update_min_vruntime
      0.00            +0.1        0.11 ± 11%  perf-profile.self.cycles-pp.try_to_wake_up
      0.00            +0.1        0.11 ±  9%  perf-profile.self.cycles-pp.finish_task_switch
      0.02 ±141%      +0.1        0.13 ± 11%  perf-profile.self.cycles-pp.schedule_timeout
      0.00            +0.1        0.12 ± 14%  perf-profile.self.cycles-pp.unix_stream_data_wait
      0.00            +0.1        0.12 ± 14%  perf-profile.self.cycles-pp.enqueue_entity
      0.00            +0.1        0.12 ± 12%  perf-profile.self.cycles-pp.prepare_task_switch
      0.00            +0.1        0.14 ± 22%  perf-profile.self.cycles-pp.schedule
      0.00            +0.1        0.14 ± 21%  perf-profile.self.cycles-pp.__wrgsbase_inactive
      0.00            +0.1        0.14 ± 16%  perf-profile.self.cycles-pp.prepare_to_wait
      0.00            +0.2        0.15 ± 15%  perf-profile.self.cycles-pp.switch_fpu_return
      0.00            +0.2        0.16 ± 18%  perf-profile.self.cycles-pp.pick_next_task_fair
      0.00            +0.2        0.18 ± 18%  perf-profile.self.cycles-pp.reweight_entity
      0.00            +0.2        0.19 ± 20%  perf-profile.self.cycles-pp.___perf_sw_event
      0.00            +0.3        0.26 ± 17%  perf-profile.self.cycles-pp.__update_load_avg_cfs_rq
      0.00            +0.3        0.30 ± 22%  perf-profile.self.cycles-pp.os_xsave
      0.03 ± 70%      +0.3        0.33 ±  9%  perf-profile.self.cycles-pp.update_load_avg
      0.05 ± 47%      +0.3        0.35 ± 17%  perf-profile.self.cycles-pp.__switch_to_asm
      0.00            +0.3        0.31 ± 17%  perf-profile.self.cycles-pp.__update_load_avg_se
      0.00            +0.3        0.35 ± 20%  perf-profile.self.cycles-pp.__dequeue_entity
      0.00            +0.4        0.35 ± 21%  perf-profile.self.cycles-pp.update_curr
      0.06 ±  9%      +0.4        0.41 ± 19%  perf-profile.self.cycles-pp.__switch_to
      0.08 ± 11%      +0.4        0.44 ± 30%  perf-profile.self.cycles-pp.update_cfs_group
      0.00            +0.5        0.50 ± 19%  perf-profile.self.cycles-pp.__enqueue_entity
      0.12 ±  9%      +0.5        0.63 ± 20%  perf-profile.self.cycles-pp.restore_fpregs_from_fpstate
      0.00            +0.6        0.56 ± 19%  perf-profile.self.cycles-pp.pick_eevdf
      0.14 ± 11%      +0.8        0.93 ± 17%  perf-profile.self.cycles-pp.__schedule
     44.27 ±  9%     +16.0       60.29 ±  4%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath


***************************************************************************************************
lkp-icl-2sp2: 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2.00GHz (Ice Lake) with 256G memory
=========================================================================================
compiler/cpufreq_governor/ipc/iterations/kconfig/mode/nr_threads/rootfs/tbox_group/testcase:
  gcc-12/performance/socket/4/x86_64-rhel-8.3/threads/50%/debian-11.1-x86_64-20220510.cgz/lkp-icl-2sp2/hackbench

commit: 
  99d4d26551 ("rbtree: Add rb_add_augmented_cached() helper")
  147f3efaa2 ("sched/fair: Implement an EEVDF-like scheduling policy")

99d4d26551b56f4e 147f3efaa24182a21706bca15ea 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
  53361421          +483.7%  3.115e+08        turbostat.IRQ
     47.79           -16.3%      40.00        turbostat.RAMWatt
   7118841           +16.1%    8266083 ±  6%  vmstat.memory.cache
   1151248          +399.7%    5752306        vmstat.system.cs
    345994          +456.4%    1925280        vmstat.system.in
    791023 ± 15%     -38.1%     489702 ± 15%  numa-numastat.node0.local_node
    831089 ± 13%     -33.3%     554528 ±  6%  numa-numastat.node0.numa_hit
   1443336 ±  9%     +57.0%    2266186 ±  9%  numa-numastat.node1.local_node
   1535821 ±  7%     +51.7%    2329679 ±  7%  numa-numastat.node1.numa_hit
      9714 ±  5%     -54.0%       4467 ±  6%  perf-c2c.DRAM.local
     40273 ±  3%     +16.8%      47032        perf-c2c.HITM.local
    779.33 ± 17%     +81.6%       1415 ± 16%  perf-c2c.HITM.remote
     41052 ±  3%     +18.0%      48447        perf-c2c.HITM.total
    447156           -12.6%     391010        hackbench.throughput
    442048           -12.6%     386536        hackbench.throughput_avg
    447156           -12.6%     391010        hackbench.throughput_best
    433943           -13.1%     377199        hackbench.throughput_worst
    136.56           +14.2%     156.01        hackbench.time.elapsed_time
    136.56           +14.2%     156.01        hackbench.time.elapsed_time.max
  29585134         +1038.0%  3.367e+08        hackbench.time.involuntary_context_switches
    103914            +2.2%     106242        hackbench.time.minor_page_faults
     15999           +14.5%      18326        hackbench.time.system_time
    935.24           +12.3%       1050        hackbench.time.user_time
 1.261e+08          +355.1%  5.739e+08        hackbench.time.voluntary_context_switches
   3028282 ±  3%     -93.5%     197428        meminfo.Active
   3028170 ±  3%     -93.5%     197316        meminfo.Active(anon)
    437876           +33.4%     584331        meminfo.AnonPages
   6968056           +16.4%    8110525 ±  6%  meminfo.Cached
   4964761           +26.1%    6261556 ±  8%  meminfo.Committed_AS
   1701041 ±  9%    +242.2%    5821228 ±  9%  meminfo.Inactive
   1699713 ±  8%    +242.4%    5820552 ±  9%  meminfo.Inactive(anon)
   1795123 ±  8%     +31.9%    2367760 ±  4%  meminfo.Mapped
   9507361           +15.2%   10949799 ±  4%  meminfo.Memused
      8271 ±  3%     +17.6%       9730 ±  2%  meminfo.PageTables
   4290519           +26.6%    5433644 ±  9%  meminfo.Shmem
   9868253           +12.5%   11100346 ±  4%  meminfo.max_used_kB
 2.088e+10 ± 25%    -100.0%    7472149        sched_debug.cfs_rq:/.avg_vruntime.avg
 1.018e+12 ± 31%    -100.0%    9306362 ±  3%  sched_debug.cfs_rq:/.avg_vruntime.max
  1.11e+11 ± 26%    -100.0%     249409 ±  8%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      9.38 ±  2%     -10.2%       8.43        sched_debug.cfs_rq:/.h_nr_running.avg
 2.087e+10 ± 25%    -100.0%    7472149        sched_debug.cfs_rq:/.min_vruntime.avg
 1.018e+12 ± 31%    -100.0%    9306362 ±  3%  sched_debug.cfs_rq:/.min_vruntime.max
  1.11e+11 ± 26%    -100.0%     249409 ±  8%  sched_debug.cfs_rq:/.min_vruntime.stddev
    206.39 ± 17%     -43.4%     116.83 ± 40%  sched_debug.cfs_rq:/.util_avg.min
     14328 ± 40%     -51.8%       6911 ± 30%  sched_debug.cpu.avg_idle.min
     20.91 ± 19%    +121.5%      46.31 ± 25%  sched_debug.cpu.clock.stddev
      9.37 ±  2%     -10.1%       8.43        sched_debug.cpu.nr_running.avg
    542026          +395.3%    2684742        sched_debug.cpu.nr_switches.avg
    746786 ±  3%    +310.4%    3065008        sched_debug.cpu.nr_switches.max
    461132 ±  5%    +377.9%    2203685 ±  2%  sched_debug.cpu.nr_switches.min
     26664 ±  7%    +434.1%     142408 ±  4%  sched_debug.cpu.nr_switches.stddev
 1.172e+08          +329.0%  5.029e+08        sched_debug.sysctl_sched.sysctl_sched_features
    940490 ± 32%     -95.2%      45452 ± 21%  numa-meminfo.node0.Active
    940434 ± 32%     -95.2%      45433 ± 21%  numa-meminfo.node0.Active(anon)
   1698832 ± 70%     -83.9%     273200 ± 22%  numa-meminfo.node0.FilePages
    464579 ± 13%     -64.9%     163120 ± 45%  numa-meminfo.node0.Inactive
    463832 ± 13%     -65.0%     162564 ± 45%  numa-meminfo.node0.Inactive(anon)
    613421 ± 26%     -58.6%     254207 ± 20%  numa-meminfo.node0.Mapped
   2956592 ± 38%     -46.8%    1571858 ±  7%  numa-meminfo.node0.MemUsed
      5219 ±  6%     -55.6%       2317 ± 18%  numa-meminfo.node0.PageTables
   1190470 ± 31%     -92.6%      88485 ± 68%  numa-meminfo.node0.Shmem
   2082200 ± 15%     -92.7%     151397 ±  6%  numa-meminfo.node1.Active
   2082145 ± 15%     -92.7%     151304 ±  6%  numa-meminfo.node1.Active(anon)
    223857 ± 46%    +107.8%     465092 ±  8%  numa-meminfo.node1.AnonPages
    290733 ± 39%    +101.0%     584441 ±  7%  numa-meminfo.node1.AnonPages.max
   5269392 ± 22%     +48.8%    7838439 ±  7%  numa-meminfo.node1.FilePages
   1242257 ± 14%    +355.6%    5660284 ± 10%  numa-meminfo.node1.Inactive
   1241677 ± 14%    +355.8%    5660161 ± 10%  numa-meminfo.node1.Inactive(anon)
   1187709 ± 15%     +78.1%    2115870 ±  4%  numa-meminfo.node1.Mapped
   6549544 ± 17%     +43.2%    9380429 ±  6%  numa-meminfo.node1.MemUsed
      3073 ± 14%    +141.3%       7414 ±  5%  numa-meminfo.node1.PageTables
   3100216 ± 12%     +72.4%    5346266 ± 10%  numa-meminfo.node1.Shmem
    235150 ± 32%     -95.2%      11354 ± 21%  numa-vmstat.node0.nr_active_anon
    424639 ± 70%     -83.9%      68310 ± 22%  numa-vmstat.node0.nr_file_pages
    115781 ± 14%     -64.9%      40648 ± 45%  numa-vmstat.node0.nr_inactive_anon
    153157 ± 26%     -58.5%      63574 ± 19%  numa-vmstat.node0.nr_mapped
      1302 ±  7%     -55.6%     578.83 ± 18%  numa-vmstat.node0.nr_page_table_pages
    297549 ± 31%     -92.6%      22132 ± 68%  numa-vmstat.node0.nr_shmem
    235150 ± 32%     -95.2%      11354 ± 21%  numa-vmstat.node0.nr_zone_active_anon
    115781 ± 14%     -64.9%      40648 ± 45%  numa-vmstat.node0.nr_zone_inactive_anon
    831021 ± 13%     -33.3%     554406 ±  6%  numa-vmstat.node0.numa_hit
    790953 ± 15%     -38.1%     489580 ± 15%  numa-vmstat.node0.numa_local
    520760 ± 15%     -92.7%      37886 ±  6%  numa-vmstat.node1.nr_active_anon
     55957 ± 45%    +107.7%     116237 ±  8%  numa-vmstat.node1.nr_anon_pages
   1317331 ± 22%     +48.8%    1959599 ±  7%  numa-vmstat.node1.nr_file_pages
    310167 ± 14%    +356.2%    1414933 ± 10%  numa-vmstat.node1.nr_inactive_anon
    296745 ± 16%     +78.3%     529013 ±  4%  numa-vmstat.node1.nr_mapped
    768.67 ± 14%    +141.1%       1853 ±  5%  numa-vmstat.node1.nr_page_table_pages
    775037 ± 12%     +72.5%    1336556 ± 10%  numa-vmstat.node1.nr_shmem
    520759 ± 15%     -92.7%      37886 ±  6%  numa-vmstat.node1.nr_zone_active_anon
    310168 ± 14%    +356.2%    1414933 ± 10%  numa-vmstat.node1.nr_zone_inactive_anon
   1535949 ±  7%     +51.7%    2329479 ±  7%  numa-vmstat.node1.numa_hit
   1443465 ±  9%     +57.0%    2265986 ±  9%  numa-vmstat.node1.numa_local
    756398 ±  3%     -93.5%      49292        proc-vmstat.nr_active_anon
    109507           +33.4%     146104        proc-vmstat.nr_anon_pages
   1741992           +16.4%    2028145 ±  6%  proc-vmstat.nr_file_pages
    425584 ±  8%    +242.0%    1455709 ±  9%  proc-vmstat.nr_inactive_anon
    449504 ±  8%     +31.8%     592226 ±  4%  proc-vmstat.nr_mapped
      2068 ±  3%     +17.6%       2432 ±  2%  proc-vmstat.nr_page_table_pages
   1072607           +26.7%    1358923 ±  9%  proc-vmstat.nr_shmem
     34777            +2.1%      35516        proc-vmstat.nr_slab_reclaimable
    103825            -8.3%      95208        proc-vmstat.nr_slab_unreclaimable
    756398 ±  3%     -93.5%      49292        proc-vmstat.nr_zone_active_anon
    425584 ±  8%    +242.0%    1455709 ±  9%  proc-vmstat.nr_zone_inactive_anon
    272962 ±  4%    +102.8%     553460 ±  6%  proc-vmstat.numa_hint_faults
    166981 ±  7%    +193.2%     489507 ±  6%  proc-vmstat.numa_hint_faults_local
   2369397           +21.8%    2886125 ±  5%  proc-vmstat.numa_hit
   2236847           +23.3%    2757806 ±  6%  proc-vmstat.numa_local
     30842 ±  5%     -41.7%      17979 ± 21%  proc-vmstat.numa_pages_migrated
    474237           +59.8%     757791 ±  4%  proc-vmstat.numa_pte_updates
    852790 ±  3%     -90.5%      81185        proc-vmstat.pgactivate
   3262288           +42.0%    4633831 ±  3%  proc-vmstat.pgalloc_normal
   1075544           +28.3%    1380393 ±  2%  proc-vmstat.pgfault
   1743075           +48.4%    2586770        proc-vmstat.pgfree
     30842 ±  5%     -41.7%      17979 ± 21%  proc-vmstat.pgmigrate_success
     44575 ±  3%     -25.3%      33315        proc-vmstat.pgreuse
   1137920           +12.1%    1275392        proc-vmstat.unevictable_pgs_scanned
      0.40            +0.2        0.62        perf-stat.i.branch-miss-rate%
 1.723e+08           +54.9%  2.668e+08        perf-stat.i.branch-misses
     12.56            -5.1        7.41        perf-stat.i.cache-miss-rate%
 2.464e+08           -43.0%  1.403e+08        perf-stat.i.cache-misses
 1.964e+09            -2.8%   1.91e+09        perf-stat.i.cache-references
   1166826          +404.6%    5887393        perf-stat.i.context-switches
      1.38            +2.2%       1.41        perf-stat.i.cpi
    341911           +38.2%     472579        perf-stat.i.cpu-migrations
      1330 ±  2%     +75.7%       2338        perf-stat.i.cycles-between-cache-misses
      0.01 ± 10%      +0.0        0.02 ± 73%  perf-stat.i.dTLB-load-miss-rate%
   6691820 ±  9%     +24.3%    8314660 ±  8%  perf-stat.i.dTLB-load-misses
   2230596 ±  7%     -29.8%    1565488 ± 22%  perf-stat.i.dTLB-store-misses
 3.934e+10            -2.3%  3.842e+10        perf-stat.i.dTLB-stores
 2.335e+11            -1.6%  2.298e+11        perf-stat.i.instructions
      0.72            -2.0%       0.71        perf-stat.i.ipc
      0.07 ± 34%     -71.0%       0.02 ± 46%  perf-stat.i.major-faults
    959.34           -38.5%     589.62        perf-stat.i.metric.K/sec
      1158            -1.7%       1139        perf-stat.i.metric.M/sec
      6811           +14.6%       7802 ±  2%  perf-stat.i.minor-faults
     26.40 ±  2%     +17.9       44.34        perf-stat.i.node-load-miss-rate%
  19999756 ±  2%      -4.8%   19048138        perf-stat.i.node-load-misses
  56509242           -58.3%   23539189        perf-stat.i.node-loads
     24.87 ±  3%     +21.7       46.52        perf-stat.i.node-store-miss-rate%
  10829289 ±  3%     +11.1%   12029507        perf-stat.i.node-store-misses
  31912804           -57.7%   13496375        perf-stat.i.node-stores
      6811           +14.6%       7802 ±  2%  perf-stat.i.page-faults
      0.39            +0.2        0.61        perf-stat.overall.branch-miss-rate%
     12.55            -5.2        7.34        perf-stat.overall.cache-miss-rate%
      1.38            +2.0%       1.41        perf-stat.overall.cpi
      1306           +77.0%       2312        perf-stat.overall.cycles-between-cache-misses
      0.01 ±  9%      +0.0        0.01 ±  8%  perf-stat.overall.dTLB-load-miss-rate%
      0.73            -2.0%       0.71        perf-stat.overall.ipc
     26.08 ±  2%     +18.2       44.31        perf-stat.overall.node-load-miss-rate%
     25.27 ±  3%     +21.3       46.60        perf-stat.overall.node-store-miss-rate%
 1.707e+08           +54.6%  2.639e+08        perf-stat.ps.branch-misses
 2.442e+08           -43.3%  1.385e+08        perf-stat.ps.cache-misses
 1.946e+09            -3.0%  1.888e+09        perf-stat.ps.cache-references
   1156453          +403.3%    5820786        perf-stat.ps.context-switches
    338643           +37.9%     466906        perf-stat.ps.cpu-migrations
   6654118 ±  9%     +25.5%    8349384 ±  8%  perf-stat.ps.dTLB-load-misses
 6.288e+10            -1.4%  6.202e+10        perf-stat.ps.dTLB-loads
   2211902 ±  8%     -30.2%    1544888 ± 22%  perf-stat.ps.dTLB-store-misses
 3.898e+10            -2.4%  3.804e+10        perf-stat.ps.dTLB-stores
 2.314e+11            -1.6%  2.276e+11        perf-stat.ps.instructions
      0.06 ± 34%     -73.6%       0.02 ± 51%  perf-stat.ps.major-faults
      6656           +15.8%       7707 ±  3%  perf-stat.ps.minor-faults
  19772856 ±  2%      -5.9%   18597981        perf-stat.ps.node-load-misses
  56047340           -58.3%   23374855        perf-stat.ps.node-loads
  10696385 ±  3%      +9.6%   11717949        perf-stat.ps.node-store-misses
  31633558           -57.6%   13424881        perf-stat.ps.node-stores
      6657           +15.8%       7707 ±  3%  perf-stat.ps.page-faults
 3.179e+13           +12.4%  3.575e+13        perf-stat.total.instructions
      0.94 ±  2%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      0.02 ± 42%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      1.86 ±  2%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.aa_sk_perm.security_socket_recvmsg.sock_recvmsg.sock_read_iter
      0.94 ±  4%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.aa_sk_perm.security_socket_sendmsg.sock_write_iter.vfs_write
      1.11 ±201%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      0.19 ±  3%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      0.12 ± 73%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.mutex_lock.futex_exit_release.exit_mm_release.exit_mm
      1.75 ±  2%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.mutex_lock.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      0.02 ± 53%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.71 ± 25%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      0.94 ±  7%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.wait_for_unix_gc.unix_stream_sendmsg.sock_write_iter.vfs_write
      0.45 ± 50%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.20 ± 70%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      0.72 ±128%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.44 ± 33%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      0.18 ± 22%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      0.54 ± 70%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_fault
      1.55 ± 10%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      1.47 ± 18%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
      2.25 ±  8%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      1.88          -100.0%       0.00        perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.07 ±183%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.futex_wait_queue.futex_wait.do_futex.__x64_sys_futex
      0.24          -100.0%       0.00        perf-sched.sch_delay.avg.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.74 ± 29%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      0.07 ± 49%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      0.31 ± 45%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      1.60 ± 57%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
      0.13 ± 90%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      1.25 ±137%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.exit_mm
      0.01 ± 46%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.__wait_rcu_gp.synchronize_rcu
      1.02 ± 38%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.04 ±103%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.07 ± 20%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      2.04          -100.0%       0.00        perf-sched.sch_delay.avg.ms.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
      0.79 ±  4%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
      0.02 ± 52%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.12 ±134%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.syslog_print.do_syslog.kmsg_read.vfs_read
      0.06 ±112%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
      0.04 ± 20%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     45.91 ± 40%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      7.86 ± 67%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
     41.50 ± 20%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.aa_sk_perm.security_socket_recvmsg.sock_recvmsg.sock_read_iter
     44.14 ± 43%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.aa_sk_perm.security_socket_sendmsg.sock_write_iter.vfs_write
     10.20 ±202%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
     51.56 ± 28%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      0.67 ± 92%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.lock_mm_and_find_vma.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.74 ± 67%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.mutex_lock.futex_exit_release.exit_mm_release.exit_mm
     37.44 ± 44%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.mutex_lock.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      0.39 ± 78%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     12.29 ± 78%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
     27.07 ± 46%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.wait_for_unix_gc.unix_stream_sendmsg.sock_write_iter.vfs_write
      2.02 ± 50%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      1.78 ± 57%    -100.0%       0.00        perf-sched.sch_delay.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      2.68 ±106%    -100.0%       0.00        perf-sched.sch_delay.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
     18.83 ± 88%    -100.0%       0.00        perf-sched.sch_delay.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      5.18 ± 26%    -100.0%       0.00        perf-sched.sch_delay.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      4.90 ± 62%    -100.0%       0.00        perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_fault
     16.38 ± 14%    -100.0%       0.00        perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
     19.45 ± 53%    -100.0%       0.00        perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
     30.46 ± 31%    -100.0%       0.00        perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
     85.90 ±  5%    -100.0%       0.00        perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.59 ±187%    -100.0%       0.00        perf-sched.sch_delay.max.ms.futex_wait_queue.futex_wait.do_futex.__x64_sys_futex
      0.33 ± 31%    -100.0%       0.00        perf-sched.sch_delay.max.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
     16.19 ± 26%    -100.0%       0.00        perf-sched.sch_delay.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      3.57 ± 33%    -100.0%       0.00        perf-sched.sch_delay.max.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
     24.92 ± 39%    -100.0%       0.00        perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
     14.79 ± 55%    -100.0%       0.00        perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
      2.27 ±106%    -100.0%       0.00        perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      4.17 ± 98%    -100.0%       0.00        perf-sched.sch_delay.max.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.exit_mm
      0.01 ±130%    -100.0%       0.00        perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.__wait_rcu_gp.synchronize_rcu
     11.86 ± 48%    -100.0%       0.00        perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.49 ±148%    -100.0%       0.00        perf-sched.sch_delay.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      8.86 ± 87%    -100.0%       0.00        perf-sched.sch_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     87.01 ± 11%    -100.0%       0.00        perf-sched.sch_delay.max.ms.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
     90.78 ± 39%    -100.0%       0.00        perf-sched.sch_delay.max.ms.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
     14.72 ± 89%    -100.0%       0.00        perf-sched.sch_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1.22 ±141%    -100.0%       0.00        perf-sched.sch_delay.max.ms.syslog_print.do_syslog.kmsg_read.vfs_read
      0.80 ±101%    -100.0%       0.00        perf-sched.sch_delay.max.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
      9.77 ±102%    -100.0%       0.00        perf-sched.sch_delay.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      1.18 ±  3%    -100.0%       0.00        perf-sched.total_sch_delay.average.ms
    105.19 ± 26%    -100.0%       0.00        perf-sched.total_sch_delay.max.ms
      3.35 ±  3%    -100.0%       0.00        perf-sched.total_wait_and_delay.average.ms
   5191298          -100.0%       0.00        perf-sched.total_wait_and_delay.count.ms
      4621          -100.0%       0.00        perf-sched.total_wait_and_delay.max.ms
      2.17 ±  3%    -100.0%       0.00        perf-sched.total_wait_time.average.ms
      4621          -100.0%       0.00        perf-sched.total_wait_time.max.ms
      6.30 ± 11%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      4.31 ±  3%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.aa_sk_perm.security_socket_recvmsg.sock_recvmsg.sock_read_iter
      2.01          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      4.09 ±  2%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.mutex_lock.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
    241.17 ± 22%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    308.73 ± 30%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    394.51 ±  2%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
    468.21 ± 40%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
    144.11 ±  5%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      4.05 ±  7%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      4.18 ± 19%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
     10.38 ± 12%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      4.59 ±  2%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
     23.55 ± 84%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.futex_wait_queue.futex_wait.do_futex.__x64_sys_futex
    102.05          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
    316.38 ± 21%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
     14.91 ± 59%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
    315.10 ±  2%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
    375.78 ± 15%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
     21.30 ± 94%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.schedule_timeout.__wait_for_common.__wait_rcu_gp.synchronize_rcu
    453.18          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      5.13 ±  5%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      5.59          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
      2.02 ±  4%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
    520.49 ±  3%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    385.25 ±  6%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.syslog_print.do_syslog.kmsg_read.vfs_read
    217.11 ±  2%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
    726.83 ±  8%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
     14695 ±  2%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.aa_sk_perm.security_socket_recvmsg.sock_recvmsg.sock_read_iter
     30678 ±  2%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      5596 ±  3%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.mutex_lock.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
     49.33 ± 16%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      4.83 ±  7%    -100.0%       0.00        perf-sched.wait_and_delay.count.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     11.83 ±  3%    -100.0%       0.00        perf-sched.wait_and_delay.count.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      5.00          -100.0%       0.00        perf-sched.wait_and_delay.count.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
    162.17          -100.0%       0.00        perf-sched.wait_and_delay.count.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
    390.33 ±  6%    -100.0%       0.00        perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
    261.17 ± 26%    -100.0%       0.00        perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
    374.33 ±  5%    -100.0%       0.00        perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
    660150          -100.0%       0.00        perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
     16.67 ± 40%    -100.0%       0.00        perf-sched.wait_and_delay.count.futex_wait_queue.futex_wait.do_futex.__x64_sys_futex
     48.00          -100.0%       0.00        perf-sched.wait_and_delay.count.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
    210.50 ± 25%    -100.0%       0.00        perf-sched.wait_and_delay.count.pipe_read.vfs_read.ksys_read.do_syscall_64
      2124 ± 39%    -100.0%       0.00        perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
     15.00          -100.0%       0.00        perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
     24.17 ± 18%    -100.0%       0.00        perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      6.17 ± 23%    -100.0%       0.00        perf-sched.wait_and_delay.count.schedule_timeout.__wait_for_common.__wait_rcu_gp.synchronize_rcu
     19.83          -100.0%       0.00        perf-sched.wait_and_delay.count.schedule_timeout.kcompactd.kthread.ret_from_fork
    921.17 ±  4%    -100.0%       0.00        perf-sched.wait_and_delay.count.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
   1043731 ±  2%    -100.0%       0.00        perf-sched.wait_and_delay.count.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
   3404729 ±  2%    -100.0%       0.00        perf-sched.wait_and_delay.count.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
      1415 ±  3%    -100.0%       0.00        perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     12.17 ±  7%    -100.0%       0.00        perf-sched.wait_and_delay.count.syslog_print.do_syslog.kmsg_read.vfs_read
      2513          -100.0%       0.00        perf-sched.wait_and_delay.count.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      1010          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
    135.98 ± 72%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.aa_sk_perm.security_socket_recvmsg.sock_recvmsg.sock_read_iter
    179.26 ± 35%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
    108.73 ± 47%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.mutex_lock.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      3479 ± 15%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1001          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      4609          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      1005          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      1036 ±  3%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
     76.35 ± 89%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
     85.29 ± 76%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
      1031 ±  4%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      1009          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
    207.73 ± 71%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.futex_wait_queue.futex_wait.do_futex.__x64_sys_futex
    105.28          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
      4609          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      1020          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      4619          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
      4193 ±  4%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
    113.77 ±152%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.schedule_timeout.__wait_for_common.__wait_rcu_gp.synchronize_rcu
    505.71          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
    300.19 ± 37%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    266.72 ± 21%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
    255.92 ± 32%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
      4266 ±  2%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      4609          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.syslog_print.do_syslog.kmsg_read.vfs_read
      2048          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.77 ± 48%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.shmem_alloc_folio
      0.30 ±171%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.allocate_slab
      1.24 ±112%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.memcg_slab_post_alloc_hook
      1.92 ±  6%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      6.29 ± 11%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      2.45 ±  4%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.aa_sk_perm.security_socket_recvmsg.sock_recvmsg.sock_read_iter
      1.98 ±  6%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.aa_sk_perm.security_socket_sendmsg.sock_write_iter.vfs_write
      0.90 ±176%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_write.generic_file_write_iter.vfs_write.ksys_write
      0.28 ± 56%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      0.45 ± 24%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
      0.02 ± 48%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.vm_area_alloc.mmap_region.do_mmap
      1.83          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      0.25 ± 95%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.lock_mm_and_find_vma.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.98 ±143%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.__fdget_pos.ksys_write.do_syscall_64
      2.52 ±175%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.futex_exit_release.exit_mm_release.exit_mm
      0.67 ±112%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.perf_event_ctx_lock_nested.constprop.0
     69.03 ±141%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.perf_poll.do_poll.constprop
      2.34 ±  3%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      0.22 ± 62%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.shmem_get_folio_gfp.shmem_write_begin.generic_perform_write.generic_file_write_iter
      1.73 ± 13%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.shrink_dentry_list.shrink_dcache_parent.d_invalidate.proc_invalidate_siblings_dcache
    241.14 ± 22%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.06 ±142%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      0.02 ± 42%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.93 ±  9%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.wait_for_unix_gc.unix_stream_sendmsg.sock_write_iter.vfs_write
    308.28 ± 30%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    394.31 ±  2%    -100.0%       0.00        perf-sched.wait_time.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
    467.49 ± 40%    -100.0%       0.00        perf-sched.wait_time.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.62 ± 11%    -100.0%       0.00        perf-sched.wait_time.avg.ms.do_task_dead.do_exit.__x64_sys_exit.do_syscall_64.entry_SYSCALL_64_after_hwframe
    143.66 ±  5%    -100.0%       0.00        perf-sched.wait_time.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      1.19 ± 21%    -100.0%       0.00        perf-sched.wait_time.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
     19.86 ±207%    -100.0%       0.00        perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_fault
      2.50 ±  7%    -100.0%       0.00        perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      2.71 ± 22%    -100.0%       0.00        perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
      8.13 ± 16%    -100.0%       0.00        perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      2.71 ±  2%    -100.0%       0.00        perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
     23.48 ± 84%    -100.0%       0.00        perf-sched.wait_time.avg.ms.futex_wait_queue.futex_wait.do_futex.__x64_sys_futex
    101.81          -100.0%       0.00        perf-sched.wait_time.avg.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
    315.64 ± 21%    -100.0%       0.00        perf-sched.wait_time.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      1.09 ± 77%    -100.0%       0.00        perf-sched.wait_time.avg.ms.pipe_write.vfs_write.ksys_write.do_syscall_64
      2.70 ±  3%    -100.0%       0.00        perf-sched.wait_time.avg.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
     14.60 ± 61%    -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
    313.50          -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
    375.65 ± 15%    -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      1.56 ±132%    -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.exit_mm
     21.29 ± 94%    -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.__wait_rcu_gp.synchronize_rcu
      2.17 ± 27%    -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    453.14          -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      5.07 ±  5%    -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      3.55 ±  2%    -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
      1.23 ±  4%    -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
    520.47 ±  3%    -100.0%       0.00        perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    385.14 ±  6%    -100.0%       0.00        perf-sched.wait_time.avg.ms.syslog_print.do_syslog.kmsg_read.vfs_read
      0.09 ± 53%    -100.0%       0.00        perf-sched.wait_time.avg.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
    217.08 ±  2%    -100.0%       0.00        perf-sched.wait_time.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     12.90 ± 40%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.shmem_alloc_folio
      0.47 ±159%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.allocate_slab
      2.82 ±114%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.memcg_slab_post_alloc_hook
    164.49 ± 53%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      1005          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
    119.23 ± 80%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.aa_sk_perm.security_socket_recvmsg.sock_recvmsg.sock_read_iter
    115.62 ± 69%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.aa_sk_perm.security_socket_sendmsg.sock_write_iter.vfs_write
      2.12 ±155%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_write.generic_file_write_iter.vfs_write.ksys_write
      1.96 ± 57%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
     11.33 ± 28%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
      0.04 ± 71%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.vm_area_alloc.mmap_region.do_mmap
    168.49 ± 42%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      2.38 ± 80%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.lock_mm_and_find_vma.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      5.39 ±129%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.__fdget_pos.ksys_write.do_syscall_64
     30.94 ±201%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.futex_exit_release.exit_mm_release.exit_mm
      3.39 ±153%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.perf_event_ctx_lock_nested.constprop.0
    341.11 ±137%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.perf_poll.do_poll.constprop
     88.20 ± 62%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      2.86 ± 59%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.shmem_get_folio_gfp.shmem_write_begin.generic_perform_write.generic_file_write_iter
    657.35 ± 48%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.shrink_dentry_list.shrink_dcache_parent.d_invalidate.proc_invalidate_siblings_dcache
      3479 ± 15%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      2.87 ±138%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      0.02 ± 84%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
     77.64 ± 87%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.wait_for_unix_gc.unix_stream_sendmsg.sock_write_iter.vfs_write
    999.72          -100.0%       0.00        perf-sched.wait_time.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      4609          -100.0%       0.00        perf-sched.wait_time.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      1002          -100.0%       0.00        perf-sched.wait_time.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
    213.80 ± 91%    -100.0%       0.00        perf-sched.wait_time.max.ms.do_task_dead.do_exit.__x64_sys_exit.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1018          -100.0%       0.00        perf-sched.wait_time.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
     31.83 ± 45%    -100.0%       0.00        perf-sched.wait_time.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
    179.19 ±207%    -100.0%       0.00        perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_fault
     66.16 ±107%    -100.0%       0.00        perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
     72.54 ± 91%    -100.0%       0.00        perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
      1030 ±  4%    -100.0%       0.00        perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      1004          -100.0%       0.00        perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
    207.72 ± 71%    -100.0%       0.00        perf-sched.wait_time.max.ms.futex_wait_queue.futex_wait.do_futex.__x64_sys_futex
    105.02          -100.0%       0.00        perf-sched.wait_time.max.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
      4609          -100.0%       0.00        perf-sched.wait_time.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      1.92 ± 86%    -100.0%       0.00        perf-sched.wait_time.max.ms.pipe_write.vfs_write.ksys_write.do_syscall_64
      7.77 ± 25%    -100.0%       0.00        perf-sched.wait_time.max.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      1010          -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      4619          -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
      4193 ±  4%    -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      4.93 ±102%    -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.exit_mm
    113.76 ±152%    -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.__wait_rcu_gp.synchronize_rcu
     18.79 ± 63%    -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    505.33          -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
    300.17 ± 37%    -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    235.65 ± 30%    -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
    227.21 ± 34%    -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
      4266 ±  2%    -100.0%       0.00        perf-sched.wait_time.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      4609          -100.0%       0.00        perf-sched.wait_time.max.ms.syslog_print.do_syslog.kmsg_read.vfs_read
      1.42 ± 77%    -100.0%       0.00        perf-sched.wait_time.max.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
      2048          -100.0%       0.00        perf-sched.wait_time.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     46.63            -1.9       44.72        perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read.start_thread
     44.87            -1.8       43.05        perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read
     14.78            -1.8       12.98        perf-profile.calltrace.cycles-pp.consume_skb.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
     42.57            -1.7       40.84        perf-profile.calltrace.cycles-pp.sock_read_iter.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
     40.23            -1.7       38.54        perf-profile.calltrace.cycles-pp.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter.vfs_read
     40.60            -1.7       38.91        perf-profile.calltrace.cycles-pp.unix_stream_recvmsg.sock_recvmsg.sock_read_iter.vfs_read.ksys_read
     41.67            -1.7       40.00        perf-profile.calltrace.cycles-pp.sock_recvmsg.sock_read_iter.vfs_read.ksys_read.do_syscall_64
     20.34            -1.5       18.82        perf-profile.calltrace.cycles-pp.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write
      7.45            -1.5        5.95        perf-profile.calltrace.cycles-pp.unix_stream_read_actor.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      7.36            -1.5        5.88        perf-profile.calltrace.cycles-pp.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      7.21            -1.5        5.73        perf-profile.calltrace.cycles-pp.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic.unix_stream_recvmsg
     10.61 ±  2%      -1.1        9.48        perf-profile.calltrace.cycles-pp.skb_release_data.consume_skb.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
     17.39            -1.1       16.33        perf-profile.calltrace.cycles-pp.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter.vfs_write
     17.04            -1.0       16.02        perf-profile.calltrace.cycles-pp.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
      5.42            -0.9        4.48        perf-profile.calltrace.cycles-pp.kmem_cache_free.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      3.62            -0.9        2.73        perf-profile.calltrace.cycles-pp._copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic
      3.23            -0.9        2.38        perf-profile.calltrace.cycles-pp.copyout._copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor
     47.93            -0.8       47.14        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__libc_read.start_thread
     47.55            -0.8       46.77        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read.start_thread
      3.35            -0.7        2.64        perf-profile.calltrace.cycles-pp._raw_spin_lock.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write
      3.67            -0.6        3.06        perf-profile.calltrace.cycles-pp.skb_release_head_state.consume_skb.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      3.53            -0.6        2.93        perf-profile.calltrace.cycles-pp.unix_destruct_scm.skb_release_head_state.consume_skb.unix_stream_read_generic.unix_stream_recvmsg
      8.66 ±  2%      -0.6        8.06        perf-profile.calltrace.cycles-pp.kmalloc_reserve.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg
      3.30            -0.6        2.71        perf-profile.calltrace.cycles-pp.sock_wfree.unix_destruct_scm.skb_release_head_state.consume_skb.unix_stream_read_generic
      3.33            -0.6        2.76        perf-profile.calltrace.cycles-pp.simple_copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic
      3.12            -0.5        2.58        perf-profile.calltrace.cycles-pp.__check_object_size.simple_copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor
      8.16 ±  2%      -0.5        7.63        perf-profile.calltrace.cycles-pp.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
     50.32            -0.5       49.79        perf-profile.calltrace.cycles-pp.__libc_read.start_thread
      2.45            -0.5        1.96        perf-profile.calltrace.cycles-pp.check_heap_object.__check_object_size.simple_copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter
      7.68 ±  2%      -0.5        7.20        perf-profile.calltrace.cycles-pp.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb.alloc_skb_with_frags
      3.08 ±  2%      -0.5        2.61        perf-profile.calltrace.cycles-pp.__fdget_pos.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
      2.96 ±  2%      -0.4        2.52        perf-profile.calltrace.cycles-pp.__fget_light.__fdget_pos.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.36            -0.4        2.99        perf-profile.calltrace.cycles-pp.__kmem_cache_free.skb_release_data.consume_skb.unix_stream_read_generic.unix_stream_recvmsg
      2.10            -0.4        1.74        perf-profile.calltrace.cycles-pp.skb_queue_tail.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write
      1.98            -0.4        1.63        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.skb_queue_tail.unix_stream_sendmsg.sock_write_iter.vfs_write
      2.80            -0.3        2.52        perf-profile.calltrace.cycles-pp.skb_copy_datagram_from_iter.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write
      1.87            -0.3        1.60        perf-profile.calltrace.cycles-pp.skb_set_owner_w.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter.vfs_write
      6.55 ±  2%      -0.3        6.29 ±  2%  perf-profile.calltrace.cycles-pp.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg
      1.86 ±  2%      -0.2        1.64        perf-profile.calltrace.cycles-pp.__slab_free.skb_release_data.consume_skb.unix_stream_read_generic.unix_stream_recvmsg
      1.68            -0.2        1.51        perf-profile.calltrace.cycles-pp.__entry_text_start.__libc_read.start_thread
      1.72            -0.2        1.55        perf-profile.calltrace.cycles-pp.__entry_text_start.__libc_write.start_thread
      1.26            -0.1        1.13        perf-profile.calltrace.cycles-pp._copy_from_iter.skb_copy_datagram_from_iter.unix_stream_sendmsg.sock_write_iter.vfs_write
      1.60            -0.1        1.47        perf-profile.calltrace.cycles-pp.__slab_free.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      0.74 ±  2%      -0.1        0.62        perf-profile.calltrace.cycles-pp.skb_unlink.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
     99.45            -0.1       99.33        perf-profile.calltrace.cycles-pp.start_thread
      0.92            -0.1        0.82        perf-profile.calltrace.cycles-pp.copyin._copy_from_iter.skb_copy_datagram_from_iter.unix_stream_sendmsg.sock_write_iter
      1.02 ±  3%      -0.1        0.92        perf-profile.calltrace.cycles-pp.security_socket_sendmsg.sock_write_iter.vfs_write.ksys_write.do_syscall_64
      0.60 ±  2%      -0.1        0.51        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.skb_unlink.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      0.63 ±  5%      -0.1        0.54 ±  4%  perf-profile.calltrace.cycles-pp.get_obj_cgroup_from_current.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      0.80            -0.1        0.71        perf-profile.calltrace.cycles-pp.mod_objcg_state.__kmem_cache_free.skb_release_data.consume_skb.unix_stream_read_generic
      0.76            -0.1        0.67        perf-profile.calltrace.cycles-pp.mod_objcg_state.kmem_cache_free.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      1.12            -0.1        1.04        perf-profile.calltrace.cycles-pp.__check_object_size.skb_copy_datagram_from_iter.unix_stream_sendmsg.sock_write_iter.vfs_write
      0.60 ±  2%      -0.1        0.52        perf-profile.calltrace.cycles-pp.security_file_permission.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.81            -0.1        0.73        perf-profile.calltrace.cycles-pp.__pthread_enable_asynccancel.start_thread
      0.96            -0.1        0.89        perf-profile.calltrace.cycles-pp.__pthread_disable_asynccancel.start_thread
      0.63            -0.1        0.56        perf-profile.calltrace.cycles-pp.obj_cgroup_charge.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      0.62 ±  4%      -0.1        0.56 ±  3%  perf-profile.calltrace.cycles-pp.security_file_permission.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.83            -0.1        0.77        perf-profile.calltrace.cycles-pp.unix_write_space.sock_wfree.unix_destruct_scm.skb_release_head_state.consume_skb
      1.55            -0.1        1.50        perf-profile.calltrace.cycles-pp.memcg_slab_post_alloc_hook.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      0.58 ±  2%      -0.0        0.54        perf-profile.calltrace.cycles-pp.check_heap_object.__check_object_size.skb_copy_datagram_from_iter.unix_stream_sendmsg.sock_write_iter
      0.59            -0.0        0.56        perf-profile.calltrace.cycles-pp.__build_skb_around.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg
      0.55 ±  3%      +0.0        0.59 ±  2%  perf-profile.calltrace.cycles-pp.aa_sk_perm.security_socket_recvmsg.sock_recvmsg.sock_read_iter.vfs_read
      0.60            +0.0        0.65        perf-profile.calltrace.cycles-pp.mutex_lock.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      0.00            +0.5        0.51        perf-profile.calltrace.cycles-pp._raw_spin_lock.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock
      0.00            +0.5        0.52        perf-profile.calltrace.cycles-pp.check_preempt_curr.ttwu_do_activate.try_to_wake_up.autoremove_wake_function.__wake_up_common
      0.00            +0.5        0.54        perf-profile.calltrace.cycles-pp.select_task_rq.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock
     47.25            +0.6       47.81        perf-profile.calltrace.cycles-pp.__libc_write.start_thread
      0.00            +0.6        0.57        perf-profile.calltrace.cycles-pp.dequeue_entity.dequeue_task_fair.__schedule.schedule.schedule_timeout
     39.81            +0.6       40.40        perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
     44.89            +0.7       45.55        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__libc_write.start_thread
     44.51            +0.7       45.18        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write.start_thread
     37.54            +0.8       38.35        perf-profile.calltrace.cycles-pp.sock_write_iter.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.9        0.87        perf-profile.calltrace.cycles-pp.pick_next_task_fair.__schedule.schedule.schedule_timeout.unix_stream_data_wait
      0.00            +0.9        0.88        perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
      0.00            +1.0        1.00        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__wake_up_common_lock.sock_def_readable.unix_stream_sendmsg
      0.00            +1.0        1.03        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write.start_thread
     35.16            +1.1       36.22        perf-profile.calltrace.cycles-pp.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write.do_syscall_64
      0.00            +1.1        1.06        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__wake_up_common_lock.sock_def_readable.unix_stream_sendmsg.sock_write_iter
      0.00            +1.1        1.12        perf-profile.calltrace.cycles-pp.enqueue_entity.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_wake_up
      0.00            +1.3        1.28        perf-profile.calltrace.cycles-pp.dequeue_task_fair.__schedule.schedule.schedule_timeout.unix_stream_data_wait
      0.00            +1.4        1.37        perf-profile.calltrace.cycles-pp.__schedule.schedule.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      0.00            +1.4        1.40        perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read
      0.00            +1.4        1.43        perf-profile.calltrace.cycles-pp.schedule.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.00            +1.5        1.48        perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +1.6        1.60        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read.start_thread
      0.00            +1.9        1.88        perf-profile.calltrace.cycles-pp.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_wake_up.autoremove_wake_function
      0.00            +1.9        1.92        perf-profile.calltrace.cycles-pp.activate_task.ttwu_do_activate.try_to_wake_up.autoremove_wake_function.__wake_up_common
      0.00            +2.5        2.47        perf-profile.calltrace.cycles-pp.ttwu_do_activate.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock
      0.86            +2.5        3.40        perf-profile.calltrace.cycles-pp.__schedule.schedule.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic
      0.87            +2.6        3.48        perf-profile.calltrace.cycles-pp.schedule.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
      0.90            +2.8        3.67        perf-profile.calltrace.cycles-pp.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      1.06            +3.4        4.43        perf-profile.calltrace.cycles-pp.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      0.68            +3.7        4.36        perf-profile.calltrace.cycles-pp.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock.sock_def_readable
      0.70            +3.7        4.43        perf-profile.calltrace.cycles-pp.autoremove_wake_function.__wake_up_common.__wake_up_common_lock.sock_def_readable.unix_stream_sendmsg
      0.74            +3.8        4.58        perf-profile.calltrace.cycles-pp.__wake_up_common.__wake_up_common_lock.sock_def_readable.unix_stream_sendmsg.sock_write_iter
      2.86            +4.5        7.31        perf-profile.calltrace.cycles-pp.sock_def_readable.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write
      0.98 ±  2%      +4.8        5.74        perf-profile.calltrace.cycles-pp.__wake_up_common_lock.sock_def_readable.unix_stream_sendmsg.sock_write_iter.vfs_write
     46.71            -1.9       44.80        perf-profile.children.cycles-pp.ksys_read
     44.99            -1.8       43.17        perf-profile.children.cycles-pp.vfs_read
     14.88            -1.8       13.07        perf-profile.children.cycles-pp.consume_skb
     42.62            -1.7       40.89        perf-profile.children.cycles-pp.sock_read_iter
     40.42            -1.7       38.72        perf-profile.children.cycles-pp.unix_stream_read_generic
     40.64            -1.7       38.95        perf-profile.children.cycles-pp.unix_stream_recvmsg
     41.74            -1.7       40.06        perf-profile.children.cycles-pp.sock_recvmsg
     20.40            -1.5       18.88        perf-profile.children.cycles-pp.sock_alloc_send_pskb
      7.48            -1.5        5.99        perf-profile.children.cycles-pp.unix_stream_read_actor
      7.40            -1.5        5.91        perf-profile.children.cycles-pp.skb_copy_datagram_iter
      7.27            -1.5        5.79        perf-profile.children.cycles-pp.__skb_datagram_iter
     10.65 ±  2%      -1.1        9.52        perf-profile.children.cycles-pp.skb_release_data
     17.43            -1.1       16.37        perf-profile.children.cycles-pp.alloc_skb_with_frags
     17.16            -1.0       16.13        perf-profile.children.cycles-pp.__alloc_skb
      5.49            -0.9        4.55        perf-profile.children.cycles-pp.kmem_cache_free
      3.66            -0.9        2.77        perf-profile.children.cycles-pp._copy_to_iter
      3.35            -0.9        2.49        perf-profile.children.cycles-pp.copyout
      4.54            -0.7        3.87        perf-profile.children.cycles-pp.__check_object_size
      3.71            -0.6        3.09        perf-profile.children.cycles-pp.skb_release_head_state
      3.59            -0.6        2.98        perf-profile.children.cycles-pp.unix_destruct_scm
      8.76 ±  2%      -0.6        8.16        perf-profile.children.cycles-pp.kmalloc_reserve
      3.34            -0.6        2.75        perf-profile.children.cycles-pp.sock_wfree
      3.37            -0.6        2.80        perf-profile.children.cycles-pp.simple_copy_to_iter
     50.45            -0.5       49.90        perf-profile.children.cycles-pp.__libc_read
      8.25 ±  2%      -0.5        7.71        perf-profile.children.cycles-pp.__kmalloc_node_track_caller
      3.16            -0.5        2.62        perf-profile.children.cycles-pp.check_heap_object
      4.17 ±  3%      -0.5        3.64 ±  2%  perf-profile.children.cycles-pp.__fdget_pos
      7.83 ±  2%      -0.5        7.33        perf-profile.children.cycles-pp.__kmem_cache_alloc_node
      3.93 ±  3%      -0.5        3.44 ±  2%  perf-profile.children.cycles-pp.__fget_light
      0.47 ±  6%      -0.4        0.03 ± 70%  perf-profile.children.cycles-pp.secondary_startup_64_no_verify
      0.47 ±  6%      -0.4        0.03 ± 70%  perf-profile.children.cycles-pp.cpu_startup_entry
      0.47 ±  6%      -0.4        0.03 ± 70%  perf-profile.children.cycles-pp.do_idle
      0.46 ±  6%      -0.4        0.03 ± 70%  perf-profile.children.cycles-pp.start_secondary
      3.42            -0.4        3.05        perf-profile.children.cycles-pp.__kmem_cache_free
      2.14            -0.4        1.78        perf-profile.children.cycles-pp.skb_queue_tail
      3.50            -0.3        3.17        perf-profile.children.cycles-pp.__slab_free
      2.72            -0.3        2.41        perf-profile.children.cycles-pp.mod_objcg_state
      2.87            -0.3        2.59        perf-profile.children.cycles-pp.skb_copy_datagram_from_iter
      6.69            -0.3        6.42 ±  2%  perf-profile.children.cycles-pp.kmem_cache_alloc_node
      1.89            -0.3        1.62        perf-profile.children.cycles-pp.skb_set_owner_w
      0.32 ±  7%      -0.2        0.08 ±  8%  perf-profile.children.cycles-pp.asm_sysvec_call_function_single
      2.00            -0.2        1.81        perf-profile.children.cycles-pp.__entry_text_start
      1.50            -0.2        1.34        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
     92.92            -0.2       92.76        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      1.34 ±  2%      -0.2        1.18 ±  2%  perf-profile.children.cycles-pp.security_file_permission
     92.34            -0.1       92.20        perf-profile.children.cycles-pp.do_syscall_64
      1.32            -0.1        1.18        perf-profile.children.cycles-pp._copy_from_iter
      1.15            -0.1        1.03        perf-profile.children.cycles-pp.obj_cgroup_charge
      0.78 ±  2%      -0.1        0.66        perf-profile.children.cycles-pp.skb_unlink
      1.00 ±  3%      -0.1        0.88 ±  3%  perf-profile.children.cycles-pp.apparmor_file_permission
     99.45            -0.1       99.33        perf-profile.children.cycles-pp.start_thread
      1.03            -0.1        0.92        perf-profile.children.cycles-pp.copyin
      1.07 ±  3%      -0.1        0.96        perf-profile.children.cycles-pp.security_socket_sendmsg
      3.07            -0.1        2.97        perf-profile.children.cycles-pp.memcg_slab_post_alloc_hook
      0.86            -0.1        0.77        perf-profile.children.cycles-pp.__pthread_enable_asynccancel
      0.14 ±  9%      -0.1        0.06 ±  9%  perf-profile.children.cycles-pp.sysvec_call_function_single
      0.66 ±  3%      -0.1        0.59 ±  2%  perf-profile.children.cycles-pp.__check_heap_object
      0.12 ± 12%      -0.1        0.04 ± 45%  perf-profile.children.cycles-pp.__flush_smp_call_function_queue
      1.00            -0.1        0.93        perf-profile.children.cycles-pp.__pthread_disable_asynccancel
      0.72            -0.1        0.65        perf-profile.children.cycles-pp.refill_obj_stock
      0.12 ±  9%      -0.1        0.05 ±  8%  perf-profile.children.cycles-pp.__sysvec_call_function_single
      0.85            -0.1        0.79        perf-profile.children.cycles-pp.unix_write_space
      0.42            -0.0        0.38        perf-profile.children.cycles-pp.rcu_all_qs
      0.30 ±  2%      -0.0        0.26 ±  3%  perf-profile.children.cycles-pp.kmalloc_size_roundup
      0.37 ±  2%      -0.0        0.33        perf-profile.children.cycles-pp.kmalloc_slab
      0.36 ±  2%      -0.0        0.33        perf-profile.children.cycles-pp.aa_file_perm
      0.53 ±  3%      -0.0        0.49 ±  2%  perf-profile.children.cycles-pp.__virt_addr_valid
      0.51            -0.0        0.48 ±  3%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.20            -0.0        0.17 ±  4%  perf-profile.children.cycles-pp.__mod_memcg_lruvec_state
      0.21            -0.0        0.18 ±  2%  perf-profile.children.cycles-pp.rw_verify_area
      0.28 ±  2%      -0.0        0.26 ±  2%  perf-profile.children.cycles-pp.__scm_recv_common
      0.61            -0.0        0.58        perf-profile.children.cycles-pp.__build_skb_around
      0.07 ± 17%      -0.0        0.05        perf-profile.children.cycles-pp.select_idle_cpu
      0.32            -0.0        0.29        perf-profile.children.cycles-pp.wait_for_unix_gc
      0.21 ±  2%      -0.0        0.19        perf-profile.children.cycles-pp.security_socket_getpeersec_dgram
      0.34 ±  2%      -0.0        0.32        perf-profile.children.cycles-pp.obj_cgroup_uncharge_pages
      0.18 ±  2%      -0.0        0.16 ±  2%  perf-profile.children.cycles-pp.unix_scm_to_skb
      0.27 ±  2%      -0.0        0.25 ±  3%  perf-profile.children.cycles-pp.newidle_balance
      0.17 ±  2%      -0.0        0.15 ±  3%  perf-profile.children.cycles-pp.put_cpu_partial
      0.13 ±  2%      -0.0        0.11 ±  3%  perf-profile.children.cycles-pp.should_failslab
      0.17 ±  4%      -0.0        0.15        perf-profile.children.cycles-pp.is_vmalloc_addr
      0.17 ±  2%      -0.0        0.15 ±  2%  perf-profile.children.cycles-pp.fsnotify_perm
      0.17 ±  2%      -0.0        0.15 ±  2%  perf-profile.children.cycles-pp.maybe_add_creds
      0.14 ±  3%      -0.0        0.13 ±  2%  perf-profile.children.cycles-pp.try_charge_memcg
      0.21 ±  2%      -0.0        0.19        perf-profile.children.cycles-pp.kfree
      0.18 ±  2%      -0.0        0.16 ±  2%  perf-profile.children.cycles-pp.put_pid
      0.10 ±  4%      -0.0        0.09 ±  4%  perf-profile.children.cycles-pp.skb_free_head
      0.14 ±  3%      -0.0        0.12 ±  3%  perf-profile.children.cycles-pp.refill_stock
      0.04 ± 44%      +0.0        0.06        perf-profile.children.cycles-pp.set_task_cpu
      0.09 ±  4%      +0.0        0.11 ±  3%  perf-profile.children.cycles-pp.__list_add_valid
      0.21 ±  2%      +0.0        0.24 ±  2%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
      0.11 ± 13%      +0.0        0.15 ±  3%  perf-profile.children.cycles-pp.select_idle_sibling
      0.04 ± 44%      +0.0        0.08        perf-profile.children.cycles-pp.finish_wait
      0.06 ±  7%      +0.0        0.10 ±  4%  perf-profile.children.cycles-pp.available_idle_cpu
      0.12 ± 17%      +0.0        0.16 ±  6%  perf-profile.children.cycles-pp.get_any_partial
      0.64            +0.0        0.69        perf-profile.children.cycles-pp.mutex_lock
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.__rdgsbase_inactive
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.perf_trace_buf_update
      0.00            +0.1        0.06 ±  8%  perf-profile.children.cycles-pp.avg_vruntime
      0.26            +0.1        0.32        perf-profile.children.cycles-pp.__list_del_entry_valid
      0.00            +0.1        0.06        perf-profile.children.cycles-pp.ttwu_queue_wakelist
      0.00            +0.1        0.06        perf-profile.children.cycles-pp.entity_eligible
      0.00            +0.1        0.06 ±  7%  perf-profile.children.cycles-pp.place_entity
      0.00            +0.1        0.07        perf-profile.children.cycles-pp.__calc_delta
      0.00            +0.1        0.07 ±  5%  perf-profile.children.cycles-pp.resched_curr
      0.00            +0.1        0.08        perf-profile.children.cycles-pp.__rb_insert_augmented
      1.16            +0.1        1.24        perf-profile.children.cycles-pp.__cond_resched
      0.00            +0.1        0.09        perf-profile.children.cycles-pp.__wrgsbase_inactive
      0.00            +0.1        0.09        perf-profile.children.cycles-pp.native_sched_clock
      0.00            +0.1        0.09 ±  7%  perf-profile.children.cycles-pp.perf_trace_sched_stat_runtime
      0.05            +0.1        0.14 ±  3%  perf-profile.children.cycles-pp.os_xsave
      0.06            +0.1        0.16        perf-profile.children.cycles-pp.task_h_load
      0.00            +0.1        0.10        perf-profile.children.cycles-pp.sched_clock
      0.00            +0.1        0.10        perf-profile.children.cycles-pp.native_apic_msr_eoi_write
      0.05            +0.1        0.15 ±  2%  perf-profile.children.cycles-pp.update_rq_clock
      0.01 ±223%      +0.1        0.12 ±  4%  perf-profile.children.cycles-pp.sched_clock_cpu
      0.00            +0.1        0.11 ±  3%  perf-profile.children.cycles-pp.__x2apic_send_IPI_dest
      0.00            +0.1        0.11 ±  6%  perf-profile.children.cycles-pp.cpuacct_charge
      0.00            +0.1        0.11 ±  4%  perf-profile.children.cycles-pp.update_min_vruntime
      0.00            +0.1        0.14 ±  2%  perf-profile.children.cycles-pp.sysvec_reschedule_ipi
      0.05 ±  8%      +0.2        0.21 ±  2%  perf-profile.children.cycles-pp.update_rq_clock_task
      0.33 ±  4%      +0.2        0.50        perf-profile.children.cycles-pp.prepare_to_wait
      0.07 ±  6%      +0.2        0.26 ±  2%  perf-profile.children.cycles-pp.___perf_sw_event
      0.08 ±  4%      +0.2        0.27 ±  2%  perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
      0.00            +0.2        0.19        perf-profile.children.cycles-pp.perf_tp_event
      0.00            +0.2        0.19 ±  2%  perf-profile.children.cycles-pp.native_irq_return_iret
      0.09 ±  5%      +0.2        0.29        perf-profile.children.cycles-pp.wake_affine
      0.07 ±  5%      +0.2        0.28        perf-profile.children.cycles-pp.finish_task_switch
      0.11            +0.2        0.32        perf-profile.children.cycles-pp.__switch_to
      0.20            +0.2        0.41        perf-profile.children.cycles-pp.restore_fpregs_from_fpstate
      0.12 ±  4%      +0.2        0.34 ±  2%  perf-profile.children.cycles-pp.__switch_to_asm
      0.10 ±  3%      +0.2        0.33        perf-profile.children.cycles-pp.__update_load_avg_se
      4.04            +0.2        4.28        perf-profile.children.cycles-pp._raw_spin_lock
      0.07            +0.3        0.33 ±  2%  perf-profile.children.cycles-pp.reweight_entity
      0.00            +0.3        0.27        perf-profile.children.cycles-pp.perf_trace_sched_wakeup_template
      0.05            +0.3        0.33        perf-profile.children.cycles-pp.__dequeue_entity
      0.00            +0.3        0.29        perf-profile.children.cycles-pp.put_prev_entity
      0.23 ±  7%      +0.3        0.52        perf-profile.children.cycles-pp.select_task_rq_fair
      0.09            +0.3        0.38        perf-profile.children.cycles-pp.prepare_task_switch
      0.24 ±  5%      +0.3        0.58        perf-profile.children.cycles-pp.select_task_rq
      0.25 ±  2%      +0.3        0.59        perf-profile.children.cycles-pp.switch_fpu_return
      0.25 ±  2%      +0.4        0.68        perf-profile.children.cycles-pp.dequeue_entity
      0.00            +0.5        0.46        perf-profile.children.cycles-pp.check_preempt_wakeup
      0.11            +0.5        0.57        perf-profile.children.cycles-pp.set_next_entity
      0.31 ±  5%      +0.5        0.77 ±  4%  perf-profile.children.cycles-pp.update_cfs_group
      0.06            +0.5        0.55        perf-profile.children.cycles-pp.check_preempt_curr
      0.00            +0.5        0.50        perf-profile.children.cycles-pp.asm_sysvec_reschedule_ipi
      0.08            +0.5        0.58        perf-profile.children.cycles-pp.__enqueue_entity
      0.00            +0.5        0.53 ± 16%  perf-profile.children.cycles-pp.ordered_events__queue
      0.00            +0.5        0.53 ± 15%  perf-profile.children.cycles-pp.queue_event
      0.00            +0.5        0.54 ± 15%  perf-profile.children.cycles-pp.process_simple
     47.40            +0.6       47.96        perf-profile.children.cycles-pp.__libc_write
      0.00            +0.6        0.57 ±  8%  perf-profile.children.cycles-pp.record__finish_output
      0.00            +0.6        0.57 ±  8%  perf-profile.children.cycles-pp.perf_session__process_events
      0.00            +0.6        0.57 ±  8%  perf-profile.children.cycles-pp.reader__read_event
     39.93            +0.6       40.51        perf-profile.children.cycles-pp.vfs_write
      0.00            +0.6        0.59 ±  8%  perf-profile.children.cycles-pp.__cmd_record
      0.00            +0.6        0.59        perf-profile.children.cycles-pp.pick_eevdf
      0.16 ±  3%      +0.6        0.81        perf-profile.children.cycles-pp.update_curr
      0.45 ±  2%      +0.7        1.19        perf-profile.children.cycles-pp.update_load_avg
     37.62            +0.8       38.43        perf-profile.children.cycles-pp.sock_write_iter
      0.36 ±  2%      +0.9        1.28        perf-profile.children.cycles-pp.enqueue_entity
      0.45 ±  2%      +1.0        1.45        perf-profile.children.cycles-pp.dequeue_task_fair
     35.46            +1.0       36.48        perf-profile.children.cycles-pp.unix_stream_sendmsg
      0.13 ±  2%      +1.4        1.50        perf-profile.children.cycles-pp.exit_to_user_mode_loop
      0.51            +1.5        1.99        perf-profile.children.cycles-pp.pick_next_task_fair
      0.55 ±  2%      +1.6        2.12        perf-profile.children.cycles-pp.enqueue_task_fair
      0.58 ±  2%      +1.6        2.16        perf-profile.children.cycles-pp.activate_task
      1.06            +1.7        2.78        perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      0.62            +1.7        2.35        perf-profile.children.cycles-pp.exit_to_user_mode_prepare
      0.58 ±  2%      +2.1        2.67        perf-profile.children.cycles-pp.ttwu_do_activate
      1.25            +2.8        4.01        perf-profile.children.cycles-pp.schedule_timeout
      1.06            +3.4        4.46        perf-profile.children.cycles-pp.unix_stream_data_wait
      1.01            +3.6        4.66        perf-profile.children.cycles-pp.try_to_wake_up
      1.04            +3.7        4.73        perf-profile.children.cycles-pp.autoremove_wake_function
      1.08            +3.8        4.88        perf-profile.children.cycles-pp.__wake_up_common
      1.32            +3.9        5.26        perf-profile.children.cycles-pp.schedule
      1.37            +4.0        5.39        perf-profile.children.cycles-pp.__schedule
      2.88            +4.5        7.34        perf-profile.children.cycles-pp.sock_def_readable
      1.33            +4.7        6.06        perf-profile.children.cycles-pp.__wake_up_common_lock
      3.31            -0.9        2.46        perf-profile.self.cycles-pp.copyout
      4.26            -0.8        3.43        perf-profile.self.cycles-pp.kmem_cache_free
      2.48            -0.5        1.94        perf-profile.self.cycles-pp.sock_wfree
      3.43            -0.5        2.91        perf-profile.self.cycles-pp.unix_stream_read_generic
      3.87 ±  3%      -0.5        3.38 ±  2%  perf-profile.self.cycles-pp.__fget_light
      2.44            -0.5        1.96        perf-profile.self.cycles-pp.check_heap_object
      2.86            -0.5        2.39        perf-profile.self.cycles-pp.unix_stream_sendmsg
      3.44            -0.3        3.10        perf-profile.self.cycles-pp.__slab_free
      1.87            -0.3        1.53        perf-profile.self.cycles-pp.sock_def_readable
      3.38            -0.3        3.07        perf-profile.self.cycles-pp._raw_spin_lock
      2.44            -0.3        2.16        perf-profile.self.cycles-pp.mod_objcg_state
      1.86            -0.3        1.59        perf-profile.self.cycles-pp.skb_set_owner_w
      0.75            -0.3        0.49        perf-profile.self.cycles-pp.skb_release_data
      2.05 ±  2%      -0.2        1.82        perf-profile.self.cycles-pp.__kmem_cache_free
      3.01            -0.2        2.84        perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      1.46            -0.2        1.30        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      1.16            -0.1        1.03        perf-profile.self.cycles-pp.__alloc_skb
      1.11            -0.1        1.00        perf-profile.self.cycles-pp.sock_write_iter
      1.05 ±  4%      -0.1        0.94 ±  2%  perf-profile.self.cycles-pp.aa_sk_perm
      0.99            -0.1        0.88        perf-profile.self.cycles-pp.copyin
      1.31            -0.1        1.21        perf-profile.self.cycles-pp.__kmem_cache_alloc_node
      0.98            -0.1        0.88        perf-profile.self.cycles-pp.__libc_read
      1.39            -0.1        1.29        perf-profile.self.cycles-pp.vfs_write
      1.00 ±  2%      -0.1        0.91        perf-profile.self.cycles-pp.__libc_write
      0.96            -0.1        0.87        perf-profile.self.cycles-pp.kmem_cache_alloc_node
      0.81            -0.1        0.72        perf-profile.self.cycles-pp.__pthread_enable_asynccancel
      0.72            -0.1        0.64        perf-profile.self.cycles-pp.obj_cgroup_charge
      0.67            -0.1        0.60        perf-profile.self.cycles-pp.refill_obj_stock
      0.60 ±  6%      -0.1        0.53 ±  4%  perf-profile.self.cycles-pp.apparmor_file_permission
      0.71            -0.1        0.64        perf-profile.self.cycles-pp.__cond_resched
      0.62 ±  3%      -0.1        0.55 ±  2%  perf-profile.self.cycles-pp.__check_heap_object
      0.88            -0.1        0.80        perf-profile.self.cycles-pp.__pthread_disable_asynccancel
      0.62            -0.1        0.56        perf-profile.self.cycles-pp.__check_object_size
      0.38 ±  2%      -0.1        0.32        perf-profile.self.cycles-pp.__unfreeze_partials
      0.54            -0.1        0.47        perf-profile.self.cycles-pp.consume_skb
      0.66 ±  2%      -0.1        0.60 ±  2%  perf-profile.self.cycles-pp.get_obj_cgroup_from_current
      0.32            -0.1        0.27        perf-profile.self.cycles-pp.get_partial_node
      0.86            -0.1        0.80        perf-profile.self.cycles-pp.sock_read_iter
      0.60            -0.1        0.55        perf-profile.self.cycles-pp.__entry_text_start
      0.37            -0.0        0.32        perf-profile.self.cycles-pp.security_file_permission
      0.45 ±  3%      -0.0        0.40        perf-profile.self.cycles-pp.sock_alloc_send_pskb
      0.77            -0.0        0.74        perf-profile.self.cycles-pp.fput
      0.27            -0.0        0.24        perf-profile.self.cycles-pp.kmalloc_reserve
      0.24 ±  2%      -0.0        0.20 ±  3%  perf-profile.self.cycles-pp.__fdget_pos
      0.32            -0.0        0.28        perf-profile.self.cycles-pp.skb_copy_datagram_from_iter
      0.32            -0.0        0.28        perf-profile.self.cycles-pp.aa_file_perm
      0.30 ±  2%      -0.0        0.27        perf-profile.self.cycles-pp._copy_from_iter
      0.48 ±  3%      -0.0        0.45 ±  2%  perf-profile.self.cycles-pp.__virt_addr_valid
      0.31 ±  3%      -0.0        0.28 ±  2%  perf-profile.self.cycles-pp.ksys_write
      0.30 ±  3%      -0.0        0.27        perf-profile.self.cycles-pp.rcu_all_qs
      0.27            -0.0        0.24        perf-profile.self.cycles-pp.alloc_skb_with_frags
      0.32            -0.0        0.29        perf-profile.self.cycles-pp.kmalloc_slab
      0.28 ±  2%      -0.0        0.25        perf-profile.self.cycles-pp.__skb_datagram_iter
      0.30            -0.0        0.28        perf-profile.self.cycles-pp._copy_to_iter
      0.16 ±  4%      -0.0        0.13        perf-profile.self.cycles-pp.skb_unlink
      0.22 ±  5%      -0.0        0.19        perf-profile.self.cycles-pp.security_socket_recvmsg
      0.31 ±  2%      -0.0        0.29        perf-profile.self.cycles-pp.ksys_read
      0.56            -0.0        0.54        perf-profile.self.cycles-pp.__build_skb_around
      0.23 ±  2%      -0.0        0.21 ±  2%  perf-profile.self.cycles-pp.__kmalloc_node_track_caller
      0.44 ±  2%      -0.0        0.42        perf-profile.self.cycles-pp.mutex_unlock
      0.19            -0.0        0.17        perf-profile.self.cycles-pp.security_socket_sendmsg
      0.27            -0.0        0.25 ±  2%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.22            -0.0        0.20        perf-profile.self.cycles-pp.__scm_recv_common
      0.16 ±  2%      -0.0        0.14 ±  3%  perf-profile.self.cycles-pp.security_socket_getpeersec_dgram
      0.16 ±  4%      -0.0        0.14 ±  3%  perf-profile.self.cycles-pp.put_cpu_partial
      0.21 ±  3%      -0.0        0.19        perf-profile.self.cycles-pp.unix_destruct_scm
      0.13 ±  2%      -0.0        0.12 ±  4%  perf-profile.self.cycles-pp.maybe_add_creds
      0.13 ±  3%      -0.0        0.11 ±  3%  perf-profile.self.cycles-pp.is_vmalloc_addr
      0.16 ±  2%      -0.0        0.15 ±  2%  perf-profile.self.cycles-pp.rw_verify_area
      0.16 ±  2%      -0.0        0.14 ±  3%  perf-profile.self.cycles-pp.unix_scm_to_skb
      0.14 ±  3%      -0.0        0.13 ±  4%  perf-profile.self.cycles-pp.__mod_memcg_lruvec_state
      0.10 ±  3%      -0.0        0.09        perf-profile.self.cycles-pp.skb_release_head_state
      0.08 ±  5%      -0.0        0.07 ±  6%  perf-profile.self.cycles-pp.skb_free_head
      0.18 ±  2%      -0.0        0.17        perf-profile.self.cycles-pp.kfree
      0.08            -0.0        0.07        perf-profile.self.cycles-pp.should_failslab
      0.06            -0.0        0.05        perf-profile.self.cycles-pp.kfree_skbmem
      0.25 ±  2%      +0.0        0.27 ±  2%  perf-profile.self.cycles-pp._raw_spin_unlock_irqrestore
      0.08 ±  4%      +0.0        0.10 ±  3%  perf-profile.self.cycles-pp.__list_add_valid
      0.21 ±  3%      +0.0        0.23 ±  2%  perf-profile.self.cycles-pp.exit_to_user_mode_prepare
      0.13 ±  2%      +0.0        0.16 ±  3%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
      0.42            +0.0        0.45        perf-profile.self.cycles-pp.mutex_lock
      0.06 ± 11%      +0.0        0.10 ±  3%  perf-profile.self.cycles-pp.available_idle_cpu
      0.25 ±  2%      +0.0        0.30        perf-profile.self.cycles-pp.__list_del_entry_valid
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.exit_to_user_mode_loop
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.wake_affine
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.avg_vruntime
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.__rdgsbase_inactive
      0.00            +0.1        0.05 ±  8%  perf-profile.self.cycles-pp.entity_eligible
      0.00            +0.1        0.06 ±  6%  perf-profile.self.cycles-pp.select_task_rq
      0.00            +0.1        0.06        perf-profile.self.cycles-pp.__wake_up_common_lock
      0.00            +0.1        0.06 ±  7%  perf-profile.self.cycles-pp.__calc_delta
      0.00            +0.1        0.07        perf-profile.self.cycles-pp.resched_curr
      0.00            +0.1        0.07 ±  8%  perf-profile.self.cycles-pp.select_idle_sibling
      0.00            +0.1        0.07 ±  6%  perf-profile.self.cycles-pp.__rb_insert_augmented
      0.00            +0.1        0.08 ±  5%  perf-profile.self.cycles-pp.native_sched_clock
      0.00            +0.1        0.09 ±  5%  perf-profile.self.cycles-pp.perf_trace_sched_stat_runtime
      0.00            +0.1        0.09        perf-profile.self.cycles-pp.schedule
      0.00            +0.1        0.09        perf-profile.self.cycles-pp.select_task_rq_fair
      0.00            +0.1        0.09        perf-profile.self.cycles-pp.__wrgsbase_inactive
      0.05            +0.1        0.14 ±  2%  perf-profile.self.cycles-pp.enqueue_entity
      0.00            +0.1        0.09 ±  4%  perf-profile.self.cycles-pp.dequeue_entity
      0.00            +0.1        0.09 ±  4%  perf-profile.self.cycles-pp.check_preempt_wakeup
      0.06            +0.1        0.15 ±  3%  perf-profile.self.cycles-pp.task_h_load
      0.00            +0.1        0.09 ±  5%  perf-profile.self.cycles-pp.check_preempt_curr
      0.00            +0.1        0.10        perf-profile.self.cycles-pp.native_apic_msr_eoi_write
      0.04 ± 44%      +0.1        0.14 ±  3%  perf-profile.self.cycles-pp.os_xsave
      0.00            +0.1        0.10 ±  4%  perf-profile.self.cycles-pp.update_min_vruntime
      0.00            +0.1        0.11        perf-profile.self.cycles-pp.dequeue_task_fair
      0.00            +0.1        0.11 ±  5%  perf-profile.self.cycles-pp.cpuacct_charge
      0.00            +0.1        0.11 ±  3%  perf-profile.self.cycles-pp.__x2apic_send_IPI_dest
      0.00            +0.1        0.13 ±  3%  perf-profile.self.cycles-pp.prepare_to_wait
      0.00            +0.1        0.14 ±  3%  perf-profile.self.cycles-pp.finish_task_switch
      0.00            +0.1        0.14 ±  4%  perf-profile.self.cycles-pp.enqueue_task_fair
      0.00            +0.1        0.14        perf-profile.self.cycles-pp.prepare_task_switch
      0.00            +0.1        0.14        perf-profile.self.cycles-pp.perf_tp_event
      0.01 ±223%      +0.1        0.15        perf-profile.self.cycles-pp.__wake_up_common
      0.05            +0.1        0.20        perf-profile.self.cycles-pp.schedule_timeout
      0.05 ±  7%      +0.1        0.20        perf-profile.self.cycles-pp.try_to_wake_up
      0.00            +0.2        0.15 ±  2%  perf-profile.self.cycles-pp.unix_stream_data_wait
      0.00            +0.2        0.16 ±  2%  perf-profile.self.cycles-pp.reweight_entity
      0.06 ±  7%      +0.2        0.23        perf-profile.self.cycles-pp.___perf_sw_event
      0.00            +0.2        0.17 ±  2%  perf-profile.self.cycles-pp.switch_fpu_return
      0.08 ±  4%      +0.2        0.25        perf-profile.self.cycles-pp.__update_load_avg_cfs_rq
      0.02 ±141%      +0.2        0.20 ±  2%  perf-profile.self.cycles-pp.update_rq_clock_task
      0.00            +0.2        0.19 ±  2%  perf-profile.self.cycles-pp.native_irq_return_iret
      0.11 ±  3%      +0.2        0.30        perf-profile.self.cycles-pp.__switch_to
      0.20            +0.2        0.41        perf-profile.self.cycles-pp.restore_fpregs_from_fpstate
      0.09 ±  4%      +0.2        0.30 ±  2%  perf-profile.self.cycles-pp.__update_load_avg_se
      0.06 ±  6%      +0.2        0.28        perf-profile.self.cycles-pp.pick_next_task_fair
      0.12 ±  4%      +0.2        0.34 ±  2%  perf-profile.self.cycles-pp.__switch_to_asm
      0.00            +0.3        0.26        perf-profile.self.cycles-pp.__dequeue_entity
      0.08 ±  6%      +0.3        0.40 ±  2%  perf-profile.self.cycles-pp.update_curr
      0.26 ±  6%      +0.3        0.60        perf-profile.self.cycles-pp.update_load_avg
      0.20            +0.4        0.64        perf-profile.self.cycles-pp.__schedule
      0.30 ±  6%      +0.5        0.76 ±  4%  perf-profile.self.cycles-pp.update_cfs_group
      0.08            +0.5        0.58        perf-profile.self.cycles-pp.__enqueue_entity
      0.00            +0.5        0.52 ± 15%  perf-profile.self.cycles-pp.queue_event
      0.00            +0.5        0.53        perf-profile.self.cycles-pp.pick_eevdf



***************************************************************************************************
lkp-spr-r02: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory
=========================================================================================
compiler/cpufreq_governor/iterations/kconfig/message_threads/rootfs/runtime/tbox_group/testcase/worker_threads:
  gcc-12/performance/3x/x86_64-rhel-8.3/1/debian-11.1-x86_64-20220510.cgz/30s/lkp-spr-r02/schbench/512

commit: 
  99d4d26551 ("rbtree: Add rb_add_augmented_cached() helper")
  147f3efaa2 ("sched/fair: Implement an EEVDF-like scheduling policy")

99d4d26551b56f4e 147f3efaa24182a21706bca15ea 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 6.594e+08 ± 11%     -29.8%  4.631e+08 ±  4%  cpuidle..time
   1520021 ±  6%     -56.8%     656461 ±  5%  cpuidle..usage
    594546 ±  3%     -11.4%     526791        meminfo.Active
    594344 ±  3%     -11.4%     526670        meminfo.Active(anon)
    735392 ±  4%      -9.5%     665533        meminfo.Shmem
    267237 ± 15%     -19.9%     214104 ±  8%  numa-meminfo.node0.Active
    267178 ± 15%     -19.9%     214047 ±  9%  numa-meminfo.node0.Active(anon)
    326711 ± 15%     -18.1%     267575 ±  8%  numa-meminfo.node0.Shmem
     66678 ± 15%     -19.7%      53550 ±  9%  numa-vmstat.node0.nr_active_anon
     81607 ± 15%     -17.9%      67020 ±  8%  numa-vmstat.node0.nr_shmem
     66678 ± 15%     -19.7%      53549 ±  9%  numa-vmstat.node0.nr_zone_active_anon
    382.83 ±  2%     +13.6%     435.00        vmstat.procs.r
     93690           +39.1%     130276        vmstat.system.cs
    303287            +2.9%     312214        vmstat.system.in
      2.75 ± 17%      -0.7        2.02 ± 17%  mpstat.cpu.all.idle%
      1.69            -0.4        1.31        mpstat.cpu.all.irq%
      0.04 ±  4%      -0.0        0.02 ±  3%  mpstat.cpu.all.soft%
      0.41            -0.2        0.25 ±  2%  mpstat.cpu.all.sys%
     43.67 ± 23%    +418.3%     226.33 ± 29%  perf-c2c.DRAM.local
    953.00 ± 13%     +71.4%       1633 ± 10%  perf-c2c.DRAM.remote
      4616 ±  3%   +1087.0%      54797 ±  5%  perf-c2c.HITM.local
    543.33 ± 17%     +65.4%     898.67 ± 13%  perf-c2c.HITM.remote
      5159 ±  4%    +979.4%      55696 ±  5%  perf-c2c.HITM.total
    148060 ±  3%     -11.1%     131575        proc-vmstat.nr_active_anon
    860940            -2.0%     843600        proc-vmstat.nr_file_pages
    183502 ±  4%      -9.4%     166309        proc-vmstat.nr_shmem
    148060 ±  3%     -11.1%     131575        proc-vmstat.nr_zone_active_anon
     43753 ±  7%     -16.7%      36460 ±  5%  proc-vmstat.numa_pages_migrated
   1342999            -2.4%    1310497        proc-vmstat.pgalloc_normal
     43753 ±  7%     -16.7%      36460 ±  5%  proc-vmstat.pgmigrate_success
     10.28 ±102%      -5.9        4.39 ±223%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
     10.28 ±102%      -5.9        4.39 ±223%  perf-profile.calltrace.cycles-pp.asm_sysvec_reschedule_ipi
     10.28 ±102%      -5.9        4.39 ±223%  perf-profile.calltrace.cycles-pp.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
     10.28 ±102%      -5.9        4.39 ±223%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
     10.28 ±102%      -5.9        4.39 ±223%  perf-profile.calltrace.cycles-pp.arch_do_signal_or_restart.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
     10.28 ±102%      -5.9        4.39 ±223%  perf-profile.calltrace.cycles-pp.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode
     10.53 ± 98%      -6.1        4.39 ±223%  perf-profile.children.cycles-pp.irqentry_exit_to_user_mode
     10.28 ±102%      -5.9        4.39 ±223%  perf-profile.children.cycles-pp.asm_sysvec_reschedule_ipi
      2829            +2.1%       2889        turbostat.Bzy_MHz
      7078 ±  9%     -64.4%       2518 ±  8%  turbostat.C1
   1254363 ±  4%     -64.6%     444077 ±  2%  turbostat.C1E
      1.86 ±  9%      -0.7        1.12 ±  5%  turbostat.C1E%
      3.22 ± 11%     -29.0%       2.29 ±  6%  turbostat.CPU%c1
      0.01          -100.0%       0.00        turbostat.CPU%c6
    120.78           -13.4      107.39        turbostat.PKG_%
      2473 ± 23%     -67.0%     815.33 ± 21%  turbostat.POLL
 6.641e+08 ± 29%     -98.9%    7618941        sched_debug.cfs_rq:/.avg_vruntime.avg
 2.522e+10 ± 70%    -100.0%    8858519        sched_debug.cfs_rq:/.avg_vruntime.max
 2.579e+09 ± 44%    -100.0%     194754 ±  3%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      0.96 ±  4%     +11.1%       1.07 ±  4%  sched_debug.cfs_rq:/.h_nr_running.avg
 6.641e+08 ± 29%     -98.9%    7618941        sched_debug.cfs_rq:/.min_vruntime.avg
 2.522e+10 ± 70%    -100.0%    8858519        sched_debug.cfs_rq:/.min_vruntime.max
 2.579e+09 ± 44%    -100.0%     194754 ±  3%  sched_debug.cfs_rq:/.min_vruntime.stddev
    991.99 ±  3%     +13.6%       1126 ±  3%  sched_debug.cfs_rq:/.runnable_avg.avg
    431.46 ±  4%     +11.8%     482.56 ±  5%  sched_debug.cfs_rq:/.util_est_enqueued.avg
      0.00 ± 15%     +88.7%       0.00 ± 23%  sched_debug.cpu.next_balance.stddev
      0.96 ±  4%     +11.4%       1.07 ±  4%  sched_debug.cpu.nr_running.avg
     13832           +35.8%      18783        sched_debug.cpu.nr_switches.avg
     12336           +35.6%      16728        sched_debug.cpu.nr_switches.min
 1.172e+08          +329.0%  5.029e+08        sched_debug.sysctl_sched.sysctl_sched_features
      7168           +64.3%      11776        schbench.request_end_latency_50%_us_max
      1.03 ± 53%      +2.6        3.66 ± 16%  schbench.request_end_latency_50%_us_stddev%
     11461          +113.0%      24416        schbench.request_end_latency_90%_us_max
      0.79 ± 55%      +1.6        2.37 ± 19%  schbench.request_end_latency_90%_us_stddev%
     20000          +140.5%      48106        schbench.request_end_latency_99%_us_max
      1.22 ± 58%      +1.9        3.09 ± 17%  schbench.request_end_latency_99%_us_stddev%
     66112          +111.9%     140117        schbench.request_end_latency_99.9%_us_max
      5.17 ± 55%      +5.0       10.17 ± 17%  schbench.request_end_latency_99.9%_us_stddev%
      7092           +57.2%      11150        schbench.request_latency_50%_us
      2.11 ± 27%      +4.6        6.69 ±  8%  schbench.request_latency_50%_us_stddev%
     11465          +106.0%      23624        schbench.request_latency_90%_us
      2.61 ± 15%      +2.0        4.62 ± 11%  schbench.request_latency_90%_us_stddev%
     20157          +128.6%      46080        schbench.request_latency_99%_us
      4.26 ± 11%      +1.6        5.82 ± 11%  schbench.request_latency_99%_us_stddev%
     64467 ±  3%     +91.8%     123660        schbench.request_latency_99.9%_us
      8.29 ± 15%      +6.5       14.76 ± 14%  schbench.request_latency_99.9%_us_stddev%
    444097 ± 15%     +86.0%     826096 ±  9%  schbench.request_latency_max_us
    407447         +1307.8%    5736231        schbench.time.involuntary_context_switches
    187725            +3.4%     194163        schbench.time.minor_page_faults
     21641            +1.4%      21942        schbench.time.percent_of_cpu_this_job_got
     71.59           -43.7%      40.28        schbench.time.system_time
     19474            +1.6%      19795        schbench.time.user_time
   7169485           -16.5%    5986841        schbench.time.voluntary_context_switches
      2894           -50.7%       1426 ±  2%  schbench.wakeup_end_latency_50%_us_max
      3.18 ± 10%     +27.7       30.90 ±  6%  schbench.wakeup_end_latency_50%_us_stddev%
      0.78 ± 48%      +3.1        3.86 ±  6%  schbench.wakeup_end_latency_90%_us_stddev%
      1.70 ± 19%      -1.1        0.58 ± 51%  schbench.wakeup_end_latency_99%_us_stddev%
     12154           +65.0%      20053        schbench.wakeup_end_latency_99.9%_us_max
      2804           -61.9%       1069        schbench.wakeup_latency_50%_us
      5.68 ±  8%     +39.9       45.58 ±  3%  schbench.wakeup_latency_50%_us_stddev%
      5373            -3.2%       5199        schbench.wakeup_latency_90%_us
      1.61 ±  8%      +4.2        5.79 ±  4%  schbench.wakeup_latency_90%_us_stddev%
      3.09 ±  9%      -2.1        1.01 ± 27%  schbench.wakeup_latency_99%_us_stddev%
     12193           +57.4%      19192        schbench.wakeup_latency_99.9%_us
    166332 ± 11%    +132.4%     386572 ± 13%  schbench.wakeup_latency_max_us
      0.05          +240.2%       0.18        perf-stat.i.MPKI
 2.272e+11           -13.0%  1.977e+11        perf-stat.i.branch-instructions
      0.02 ±  2%      -0.0        0.02        perf-stat.i.branch-miss-rate%
  50165340           -31.2%   34493120        perf-stat.i.branch-misses
     10.37            -6.6        3.75 ±  2%  perf-stat.i.cache-miss-rate%
  95338549 ±  2%    +183.9%  2.706e+08        perf-stat.i.cache-references
     96640           +39.4%     134695        perf-stat.i.context-switches
      0.34           +23.8%       0.43        perf-stat.i.cpi
 6.214e+11            +3.1%  6.409e+11        perf-stat.i.cpu-cycles
     45498           -46.7%      24257        perf-stat.i.cpu-migrations
     67383 ±  2%      +6.7%      71916        perf-stat.i.cycles-between-cache-misses
      0.00 ±  5%      -0.0        0.00 ±  7%  perf-stat.i.dTLB-load-miss-rate%
   2715098 ±  6%     -29.9%    1902588 ±  7%  perf-stat.i.dTLB-load-misses
 4.497e+11           -15.7%  3.791e+11        perf-stat.i.dTLB-loads
   1873619           -14.6%    1599512        perf-stat.i.dTLB-store-misses
 2.267e+11           -14.5%  1.937e+11        perf-stat.i.dTLB-stores
 1.803e+12           -16.7%  1.502e+12        perf-stat.i.instructions
      2.90           -19.2%       2.34        perf-stat.i.ipc
      3.78 ±  2%     -56.3%       1.65        perf-stat.i.metric.G/sec
      2.75            +2.7%       2.82        perf-stat.i.metric.GHz
    440.03           -87.2%      56.49 ± 23%  perf-stat.i.metric.K/sec
    212.17 ± 33%    +720.8%       1741        perf-stat.i.metric.M/sec
     11505 ±  7%     +12.4%      12935 ±  3%  perf-stat.i.minor-faults
     11505 ±  7%     +12.4%      12935 ±  3%  perf-stat.i.page-faults
      0.05          +241.6%       0.18        perf-stat.overall.MPKI
      0.02 ±  2%      -0.0        0.02        perf-stat.overall.branch-miss-rate%
     10.63            -7.0        3.61        perf-stat.overall.cache-miss-rate%
      0.34           +23.9%       0.43        perf-stat.overall.cpi
     61631            +7.0%      65955        perf-stat.overall.cycles-between-cache-misses
      0.00 ±  5%      -0.0        0.00 ±  9%  perf-stat.overall.dTLB-load-miss-rate%
      0.00            -0.0        0.00        perf-stat.overall.dTLB-store-miss-rate%
      2.90           -19.3%       2.34        perf-stat.overall.ipc
 2.221e+11           -13.5%  1.922e+11        perf-stat.ps.branch-instructions
  49232457           -33.2%   32910918        perf-stat.ps.branch-misses
   9861145            -4.1%    9454836        perf-stat.ps.cache-misses
  92737977          +182.9%  2.623e+08        perf-stat.ps.cache-references
     94423           +38.8%     131067        perf-stat.ps.context-switches
 6.076e+11            +2.6%  6.235e+11        perf-stat.ps.cpu-cycles
     44457           -47.2%      23463        perf-stat.ps.cpu-migrations
   2598169 ±  5%     -30.4%    1808495 ±  8%  perf-stat.ps.dTLB-load-misses
 4.397e+11           -16.2%  3.685e+11        perf-stat.ps.dTLB-loads
   1814009           -16.5%    1514374        perf-stat.ps.dTLB-store-misses
 2.216e+11           -15.0%  1.883e+11        perf-stat.ps.dTLB-stores
 1.763e+12           -17.2%   1.46e+12        perf-stat.ps.instructions
     10149            -2.3%       9916        perf-stat.ps.minor-faults
    124994 ±  5%     -12.8%     108950 ±  5%  perf-stat.ps.node-loads
     10149            -2.3%       9916        perf-stat.ps.page-faults
 1.609e+14           -17.2%  1.332e+14        perf-stat.total.instructions
      0.01 ±147%   +1087.5%       0.06 ±115%  perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.wp_page_copy
     44.56 ±208%     -99.4%       0.26 ±147%  perf-sched.sch_delay.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      1.34 ± 12%     -65.0%       0.47 ± 22%  perf-sched.sch_delay.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      2.81 ±  4%     -45.3%       1.54 ±  2%  perf-sched.sch_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.81 ± 17%     -47.4%       0.43 ± 23%  perf-sched.sch_delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      0.49 ± 19%     -81.3%       0.09 ± 27%  perf-sched.sch_delay.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      1.60 ±  5%     -63.5%       0.58 ±  3%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      2.02 ± 62%     -76.9%       0.47 ± 13%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function
      2.36 ±  8%     -65.0%       0.83 ± 11%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
      2.43 ±  5%     -64.2%       0.87 ± 10%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      2.12 ±  9%     -86.5%       0.29 ± 26%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      2.30 ±  5%     -74.9%       0.58        perf-sched.sch_delay.avg.ms.futex_wait_queue.futex_wait.do_futex.__x64_sys_futex
      3.11 ± 35%     -84.7%       0.48 ± 53%  perf-sched.sch_delay.avg.ms.io_schedule.migration_entry_wait_on_locked.migration_entry_wait.do_swap_page
      0.25 ± 30%     -77.3%       0.06 ± 16%  perf-sched.sch_delay.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      0.31 ±134%     -95.3%       0.01 ± 89%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
      1.18 ± 13%     -67.0%       0.39 ± 13%  perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.01 ±153%   +2445.9%       0.16 ±133%  perf-sched.sch_delay.max.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.wp_page_copy
      0.13 ±223%    +628.4%       0.95 ± 94%  perf-sched.sch_delay.max.ms.__cond_resched.mutex_lock_killable.pcpu_alloc.__percpu_counter_init.mm_init
    173.73 ±213%     -99.5%       0.83 ±144%  perf-sched.sch_delay.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      5.29 ±  7%     -48.6%       2.72 ± 27%  perf-sched.sch_delay.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
    238.68 ± 17%     +56.4%     373.27 ± 10%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
    153.68 ± 43%    +102.7%     311.48 ± 22%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
    208.93 ± 26%     +46.2%     305.50 ± 16%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      2.34 ±128%     -97.0%       0.07 ±143%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
     21.36 ± 65%     -73.8%       5.59 ±113%  perf-sched.sch_delay.max.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.do_madvise
      6.30 ± 14%     -38.6%       3.87 ± 19%  perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      2.50 ±  5%     -64.1%       0.90 ±  2%  perf-sched.total_sch_delay.average.ms
     11.58 ±  3%     -35.5%       7.47 ±  2%  perf-sched.total_wait_and_delay.average.ms
    420495 ±  4%     +32.7%     558098        perf-sched.total_wait_and_delay.count.ms
      9.09 ±  3%     -27.7%       6.57 ±  2%  perf-sched.total_wait_time.average.ms
    688.49 ± 20%     -75.7%     167.00 ±127%  perf-sched.wait_and_delay.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      8.30 ±  2%     -14.4%       7.11        perf-sched.wait_and_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      3.78 ±  4%     -43.9%       2.12 ±  2%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      5.54 ±  8%     -47.6%       2.90 ±  7%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
      5.51 ±  5%     -46.0%       2.98 ±  5%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      5.15 ± 11%     -50.6%       2.54 ± 19%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      5.03 ±  5%     -48.4%       2.60        perf-sched.wait_and_delay.avg.ms.futex_wait_queue.futex_wait.do_futex.__x64_sys_futex
    200.55 ± 43%     -74.6%      50.84 ± 31%  perf-sched.wait_and_delay.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
     79.29 ±  4%     -10.6%      70.87 ±  9%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      8.17 ± 37%    +108.2%      17.00 ± 23%  perf-sched.wait_and_delay.count.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    196322 ±  5%     -14.5%     167826        perf-sched.wait_and_delay.count.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
     10372 ±  4%   +1470.1%     162862        perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      2282 ±  3%    +816.4%      20912        perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
      3137 ± 12%    +688.9%      24749        perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      3187 ±  7%     +70.0%       5417 ±  5%  perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
    198864 ±  5%     -15.0%     169073        perf-sched.wait_and_delay.count.futex_wait_queue.futex_wait.do_futex.__x64_sys_futex
    363.50 ± 40%    +220.6%       1165 ± 24%  perf-sched.wait_and_delay.count.pipe_read.vfs_read.ksys_read.do_syscall_64
      1504 ± 26%     -29.5%       1061 ±  8%  perf-sched.wait_and_delay.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
    611.79 ± 46%     +68.2%       1029 ± 20%  perf-sched.wait_and_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
    331.70 ± 34%     +94.5%     645.16 ± 34%  perf-sched.wait_and_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
    342.96 ± 36%     +60.3%     549.66 ± 23%  perf-sched.wait_and_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
    667.28 ±  6%     -23.4%     511.08 ± 13%  perf-sched.wait_and_delay.max.ms.futex_wait_queue.futex_wait.do_futex.__x64_sys_futex
      1.18 ±223%  +24180.0%     287.23 ± 26%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock_killable.pcpu_alloc.__percpu_counter_init.mm_init
      0.05 ±163%   +1179.7%       0.68 ± 34%  perf-sched.wait_time.avg.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
    643.93 ± 23%     -74.0%     167.11 ±127%  perf-sched.wait_time.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      7.61 ± 36%     -42.6%       4.36 ±  4%  perf-sched.wait_time.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      7.20 ±109%     -86.1%       1.00 ± 24%  perf-sched.wait_time.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      4.70 ± 65%    +231.5%      15.58 ± 64%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_fault
      2.18 ±  4%     -29.6%       1.53 ±  2%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      3.18 ±  8%     -34.7%       2.08 ±  6%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
      3.08 ±  5%     -31.5%       2.11 ±  4%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      2.72 ±  5%     -26.0%       2.02        perf-sched.wait_time.avg.ms.futex_wait_queue.futex_wait.do_futex.__x64_sys_futex
      4.11 ± 44%     -58.0%       1.73 ± 17%  perf-sched.wait_time.avg.ms.io_schedule.migration_entry_wait_on_locked.migration_entry_wait.do_swap_page
    200.30 ± 43%     -74.6%      50.78 ± 31%  perf-sched.wait_time.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
     79.23 ±  4%     -10.6%      70.83 ±  9%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      6.68 ± 87%     -79.9%       1.34 ± 21%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      1.18 ±223%  +84743.1%       1003        perf-sched.wait_time.max.ms.__cond_resched.mutex_lock_killable.pcpu_alloc.__percpu_counter_init.mm_init
      5.95 ±112%    +338.9%      26.11 ± 51%  perf-sched.wait_time.max.ms.__cond_resched.shmem_get_folio_gfp.shmem_write_begin.generic_perform_write.generic_file_write_iter
      1504 ± 26%     -29.7%       1057 ±  8%  perf-sched.wait_time.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
     12.63 ± 56%   +1603.4%     215.11 ±164%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_fault
    469.22 ± 80%    +106.4%     968.60 ± 32%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
    348.01 ±  5%     -21.5%     273.05 ±  9%  perf-sched.wait_time.max.ms.futex_wait_queue.futex_wait.do_futex.__x64_sys_futex





Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



--eiWryPIrJOFvxlHA
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment;
	filename="config-6.5.0-rc2-00020-g147f3efaa241"

#
# Automatically generated file; DO NOT EDIT.
# Linux/x86_64 6.5.0-rc2 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="gcc-12 (Debian 12.2.0-14) 12.2.0"
CONFIG_CC_IS_GCC=y
CONFIG_GCC_VERSION=120200
CONFIG_CLANG_VERSION=0
CONFIG_AS_IS_GNU=y
CONFIG_AS_VERSION=24000
CONFIG_LD_IS_BFD=y
CONFIG_LD_VERSION=24000
CONFIG_LLD_VERSION=0
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
CONFIG_KERNEL_GZIP=y
# CONFIG_KERNEL_BZIP2 is not set
# CONFIG_KERNEL_LZMA is not set
# CONFIG_KERNEL_XZ is not set
# CONFIG_KERNEL_LZO is not set
# CONFIG_KERNEL_LZ4 is not set
# CONFIG_KERNEL_ZSTD is not set
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
CONFIG_SYSVIPC=y
CONFIG_SYSVIPC_SYSCTL=y
CONFIG_SYSVIPC_COMPAT=y
CONFIG_POSIX_MQUEUE=y
CONFIG_POSIX_MQUEUE_SYSCTL=y
# CONFIG_WATCH_QUEUE is not set
CONFIG_CROSS_MEMORY_ATTACH=y
# CONFIG_USELIB is not set
CONFIG_AUDIT=y
CONFIG_HAVE_ARCH_AUDITSYSCALL=y
CONFIG_AUDITSYSCALL=y

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
CONFIG_GENERIC_MSI_IRQ=y
CONFIG_IRQ_MSI_IOMMU=y
CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=y
CONFIG_GENERIC_IRQ_RESERVATION_MODE=y
CONFIG_IRQ_FORCED_THREADING=y
CONFIG_SPARSE_IRQ=y
# CONFIG_GENERIC_IRQ_DEBUGFS is not set
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
CONFIG_NO_HZ_COMMON=y
# CONFIG_HZ_PERIODIC is not set
# CONFIG_NO_HZ_IDLE is not set
CONFIG_NO_HZ_FULL=y
CONFIG_CONTEXT_TRACKING_USER=y
# CONFIG_CONTEXT_TRACKING_USER_FORCE is not set
CONFIG_NO_HZ=y
CONFIG_HIGH_RES_TIMERS=y
CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US=125
# end of Timers subsystem

CONFIG_BPF=y
CONFIG_HAVE_EBPF_JIT=y
CONFIG_ARCH_WANT_DEFAULT_BPF_JIT=y

#
# BPF subsystem
#
CONFIG_BPF_SYSCALL=y
CONFIG_BPF_JIT=y
CONFIG_BPF_JIT_ALWAYS_ON=y
CONFIG_BPF_JIT_DEFAULT_ON=y
CONFIG_BPF_UNPRIV_DEFAULT_OFF=y
# CONFIG_BPF_PRELOAD is not set
# CONFIG_BPF_LSM is not set
# end of BPF subsystem

CONFIG_PREEMPT_VOLUNTARY_BUILD=y
# CONFIG_PREEMPT_NONE is not set
CONFIG_PREEMPT_VOLUNTARY=y
# CONFIG_PREEMPT is not set
# CONFIG_PREEMPT_DYNAMIC is not set
# CONFIG_SCHED_CORE is not set

#
# CPU/Task time and stats accounting
#
CONFIG_VIRT_CPU_ACCOUNTING=y
CONFIG_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_SCHED_AVG_IRQ=y
CONFIG_BSD_PROCESS_ACCT=y
CONFIG_BSD_PROCESS_ACCT_V3=y
CONFIG_TASKSTATS=y
CONFIG_TASK_DELAY_ACCT=y
CONFIG_TASK_XACCT=y
CONFIG_TASK_IO_ACCOUNTING=y
# CONFIG_PSI is not set
# end of CPU/Task time and stats accounting

CONFIG_CPU_ISOLATION=y

#
# RCU Subsystem
#
CONFIG_TREE_RCU=y
# CONFIG_RCU_EXPERT is not set
CONFIG_TREE_SRCU=y
CONFIG_TASKS_RCU_GENERIC=y
CONFIG_TASKS_RUDE_RCU=y
CONFIG_TASKS_TRACE_RCU=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
CONFIG_RCU_NOCB_CPU=y
# CONFIG_RCU_NOCB_CPU_DEFAULT_ALL is not set
# CONFIG_RCU_LAZY is not set
# end of RCU Subsystem

CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
# CONFIG_IKHEADERS is not set
CONFIG_LOG_BUF_SHIFT=20
CONFIG_LOG_CPU_MAX_BUF_SHIFT=12
# CONFIG_PRINTK_INDEX is not set
CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y

#
# Scheduler features
#
# CONFIG_UCLAMP_TASK is not set
# end of Scheduler features

CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=y
CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=y
CONFIG_CC_HAS_INT128=y
CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough=5"
CONFIG_GCC11_NO_ARRAY_BOUNDS=y
CONFIG_CC_NO_ARRAY_BOUNDS=y
CONFIG_ARCH_SUPPORTS_INT128=y
CONFIG_NUMA_BALANCING=y
CONFIG_NUMA_BALANCING_DEFAULT_ENABLED=y
CONFIG_CGROUPS=y
CONFIG_PAGE_COUNTER=y
# CONFIG_CGROUP_FAVOR_DYNMODS is not set
CONFIG_MEMCG=y
CONFIG_MEMCG_KMEM=y
CONFIG_BLK_CGROUP=y
CONFIG_CGROUP_WRITEBACK=y
CONFIG_CGROUP_SCHED=y
CONFIG_FAIR_GROUP_SCHED=y
CONFIG_CFS_BANDWIDTH=y
# CONFIG_RT_GROUP_SCHED is not set
CONFIG_SCHED_MM_CID=y
CONFIG_CGROUP_PIDS=y
CONFIG_CGROUP_RDMA=y
CONFIG_CGROUP_FREEZER=y
CONFIG_CGROUP_HUGETLB=y
CONFIG_CPUSETS=y
CONFIG_PROC_PID_CPUSET=y
CONFIG_CGROUP_DEVICE=y
CONFIG_CGROUP_CPUACCT=y
CONFIG_CGROUP_PERF=y
CONFIG_CGROUP_BPF=y
# CONFIG_CGROUP_MISC is not set
# CONFIG_CGROUP_DEBUG is not set
CONFIG_SOCK_CGROUP_DATA=y
CONFIG_NAMESPACES=y
CONFIG_UTS_NS=y
CONFIG_TIME_NS=y
CONFIG_IPC_NS=y
CONFIG_USER_NS=y
CONFIG_PID_NS=y
CONFIG_NET_NS=y
# CONFIG_CHECKPOINT_RESTORE is not set
CONFIG_SCHED_AUTOGROUP=y
CONFIG_RELAY=y
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
CONFIG_RD_GZIP=y
CONFIG_RD_BZIP2=y
CONFIG_RD_LZMA=y
CONFIG_RD_XZ=y
CONFIG_RD_LZO=y
CONFIG_RD_LZ4=y
CONFIG_RD_ZSTD=y
# CONFIG_BOOT_CONFIG is not set
CONFIG_INITRAMFS_PRESERVE_MTIME=y
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
CONFIG_LD_ORPHAN_WARN=y
CONFIG_LD_ORPHAN_WARN_LEVEL="warn"
CONFIG_SYSCTL=y
CONFIG_HAVE_UID16=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_HAVE_PCSPKR_PLATFORM=y
CONFIG_EXPERT=y
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
CONFIG_KALLSYMS_ABSOLUTE_PERCPU=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
CONFIG_KCMP=y
CONFIG_RSEQ=y
CONFIG_CACHESTAT_SYSCALL=y
# CONFIG_DEBUG_RSEQ is not set
# CONFIG_EMBEDDED is not set
CONFIG_HAVE_PERF_EVENTS=y
CONFIG_GUEST_PERF_EVENTS=y
# CONFIG_PC104 is not set

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
# end of Kernel Performance Events And Counters

CONFIG_SYSTEM_DATA_VERIFICATION=y
CONFIG_PROFILING=y
CONFIG_TRACEPOINTS=y
# end of General setup

CONFIG_64BIT=y
CONFIG_X86_64=y
CONFIG_X86=y
CONFIG_INSTRUCTION_DECODER=y
CONFIG_OUTPUT_FORMAT="elf64-x86-64"
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_MMU=y
CONFIG_ARCH_MMAP_RND_BITS_MIN=28
CONFIG_ARCH_MMAP_RND_BITS_MAX=32
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=8
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=16
CONFIG_GENERIC_ISA_DMA=y
CONFIG_GENERIC_BUG=y
CONFIG_GENERIC_BUG_RELATIVE_POINTERS=y
CONFIG_ARCH_MAY_HAVE_PC_FDC=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_ARCH_HAS_CPU_RELAX=y
CONFIG_ARCH_HIBERNATION_POSSIBLE=y
CONFIG_ARCH_SUSPEND_POSSIBLE=y
CONFIG_AUDIT_ARCH=y
CONFIG_HAVE_INTEL_TXT=y
CONFIG_X86_64_SMP=y
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_FIX_EARLYCON_MEM=y
CONFIG_PGTABLE_LEVELS=5
CONFIG_CC_HAS_SANE_STACKPROTECTOR=y

#
# Processor type and features
#
CONFIG_SMP=y
CONFIG_X86_X2APIC=y
CONFIG_X86_MPPARSE=y
# CONFIG_GOLDFISH is not set
# CONFIG_X86_CPU_RESCTRL is not set
CONFIG_X86_EXTENDED_PLATFORM=y
# CONFIG_X86_NUMACHIP is not set
# CONFIG_X86_VSMP is not set
CONFIG_X86_UV=y
# CONFIG_X86_GOLDFISH is not set
# CONFIG_X86_INTEL_MID is not set
CONFIG_X86_INTEL_LPSS=y
# CONFIG_X86_AMD_PLATFORM_DEVICE is not set
CONFIG_IOSF_MBI=y
# CONFIG_IOSF_MBI_DEBUG is not set
CONFIG_X86_SUPPORTS_MEMORY_FAILURE=y
# CONFIG_SCHED_OMIT_FRAME_POINTER is not set
CONFIG_HYPERVISOR_GUEST=y
CONFIG_PARAVIRT=y
# CONFIG_PARAVIRT_DEBUG is not set
CONFIG_PARAVIRT_SPINLOCKS=y
CONFIG_X86_HV_CALLBACK_VECTOR=y
# CONFIG_XEN is not set
CONFIG_KVM_GUEST=y
CONFIG_ARCH_CPUIDLE_HALTPOLL=y
# CONFIG_PVH is not set
CONFIG_PARAVIRT_TIME_ACCOUNTING=y
CONFIG_PARAVIRT_CLOCK=y
# CONFIG_JAILHOUSE_GUEST is not set
# CONFIG_ACRN_GUEST is not set
# CONFIG_INTEL_TDX_GUEST is not set
# CONFIG_MK8 is not set
# CONFIG_MPSC is not set
# CONFIG_MCORE2 is not set
# CONFIG_MATOM is not set
CONFIG_GENERIC_CPU=y
CONFIG_X86_INTERNODE_CACHE_SHIFT=6
CONFIG_X86_L1_CACHE_SHIFT=6
CONFIG_X86_TSC=y
CONFIG_X86_CMPXCHG64=y
CONFIG_X86_CMOV=y
CONFIG_X86_MINIMUM_CPU_FAMILY=64
CONFIG_X86_DEBUGCTLMSR=y
CONFIG_IA32_FEAT_CTL=y
CONFIG_X86_VMX_FEATURE_NAMES=y
CONFIG_PROCESSOR_SELECT=y
CONFIG_CPU_SUP_INTEL=y
# CONFIG_CPU_SUP_AMD is not set
# CONFIG_CPU_SUP_HYGON is not set
# CONFIG_CPU_SUP_CENTAUR is not set
# CONFIG_CPU_SUP_ZHAOXIN is not set
CONFIG_HPET_TIMER=y
CONFIG_HPET_EMULATE_RTC=y
CONFIG_DMI=y
CONFIG_BOOT_VESA_SUPPORT=y
CONFIG_MAXSMP=y
CONFIG_NR_CPUS_RANGE_BEGIN=8192
CONFIG_NR_CPUS_RANGE_END=8192
CONFIG_NR_CPUS_DEFAULT=8192
CONFIG_NR_CPUS=8192
CONFIG_SCHED_CLUSTER=y
CONFIG_SCHED_SMT=y
CONFIG_SCHED_MC=y
CONFIG_SCHED_MC_PRIO=y
CONFIG_X86_LOCAL_APIC=y
CONFIG_X86_IO_APIC=y
CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=y
CONFIG_X86_MCE=y
CONFIG_X86_MCELOG_LEGACY=y
CONFIG_X86_MCE_INTEL=y
CONFIG_X86_MCE_THRESHOLD=y
CONFIG_X86_MCE_INJECT=m

#
# Performance monitoring
#
CONFIG_PERF_EVENTS_INTEL_UNCORE=m
CONFIG_PERF_EVENTS_INTEL_RAPL=m
CONFIG_PERF_EVENTS_INTEL_CSTATE=m
# end of Performance monitoring

CONFIG_X86_16BIT=y
CONFIG_X86_ESPFIX64=y
CONFIG_X86_VSYSCALL_EMULATION=y
CONFIG_X86_IOPL_IOPERM=y
CONFIG_MICROCODE=y
CONFIG_MICROCODE_INTEL=y
CONFIG_MICROCODE_LATE_LOADING=y
CONFIG_X86_MSR=y
CONFIG_X86_CPUID=y
CONFIG_X86_5LEVEL=y
CONFIG_X86_DIRECT_GBPAGES=y
# CONFIG_X86_CPA_STATISTICS is not set
CONFIG_NUMA=y
# CONFIG_AMD_NUMA is not set
CONFIG_X86_64_ACPI_NUMA=y
CONFIG_NUMA_EMU=y
CONFIG_NODES_SHIFT=10
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_DEFAULT=y
# CONFIG_ARCH_MEMORY_PROBE is not set
CONFIG_ARCH_PROC_KCORE_TEXT=y
CONFIG_ILLEGAL_POINTER_VALUE=0xdead000000000000
CONFIG_X86_PMEM_LEGACY_DEVICE=y
CONFIG_X86_PMEM_LEGACY=m
CONFIG_X86_CHECK_BIOS_CORRUPTION=y
# CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK is not set
CONFIG_MTRR=y
CONFIG_MTRR_SANITIZER=y
CONFIG_MTRR_SANITIZER_ENABLE_DEFAULT=1
CONFIG_MTRR_SANITIZER_SPARE_REG_NR_DEFAULT=1
CONFIG_X86_PAT=y
CONFIG_ARCH_USES_PG_UNCACHED=y
CONFIG_X86_UMIP=y
CONFIG_CC_HAS_IBT=y
CONFIG_X86_KERNEL_IBT=y
CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS=y
CONFIG_X86_INTEL_TSX_MODE_OFF=y
# CONFIG_X86_INTEL_TSX_MODE_ON is not set
# CONFIG_X86_INTEL_TSX_MODE_AUTO is not set
# CONFIG_X86_SGX is not set
CONFIG_EFI=y
CONFIG_EFI_STUB=y
CONFIG_EFI_HANDOVER_PROTOCOL=y
CONFIG_EFI_MIXED=y
# CONFIG_EFI_FAKE_MEMMAP is not set
CONFIG_EFI_RUNTIME_MAP=y
# CONFIG_HZ_100 is not set
# CONFIG_HZ_250 is not set
# CONFIG_HZ_300 is not set
CONFIG_HZ_1000=y
CONFIG_HZ=1000
CONFIG_SCHED_HRTICK=y
CONFIG_KEXEC=y
CONFIG_KEXEC_FILE=y
CONFIG_ARCH_HAS_KEXEC_PURGATORY=y
# CONFIG_KEXEC_SIG is not set
CONFIG_CRASH_DUMP=y
CONFIG_KEXEC_JUMP=y
CONFIG_PHYSICAL_START=0x1000000
CONFIG_RELOCATABLE=y
CONFIG_RANDOMIZE_BASE=y
CONFIG_X86_NEED_RELOCS=y
CONFIG_PHYSICAL_ALIGN=0x200000
CONFIG_DYNAMIC_MEMORY_LAYOUT=y
CONFIG_RANDOMIZE_MEMORY=y
CONFIG_RANDOMIZE_MEMORY_PHYSICAL_PADDING=0xa
# CONFIG_ADDRESS_MASKING is not set
CONFIG_HOTPLUG_CPU=y
# CONFIG_COMPAT_VDSO is not set
CONFIG_LEGACY_VSYSCALL_XONLY=y
# CONFIG_LEGACY_VSYSCALL_NONE is not set
# CONFIG_CMDLINE_BOOL is not set
CONFIG_MODIFY_LDT_SYSCALL=y
# CONFIG_STRICT_SIGALTSTACK_SIZE is not set
CONFIG_HAVE_LIVEPATCH=y
CONFIG_LIVEPATCH=y
# end of Processor type and features

CONFIG_CC_HAS_SLS=y
CONFIG_CC_HAS_RETURN_THUNK=y
CONFIG_CC_HAS_ENTRY_PADDING=y
CONFIG_FUNCTION_PADDING_CFI=11
CONFIG_FUNCTION_PADDING_BYTES=16
CONFIG_CALL_PADDING=y
CONFIG_HAVE_CALL_THUNKS=y
CONFIG_CALL_THUNKS=y
CONFIG_PREFIX_SYMBOLS=y
CONFIG_SPECULATION_MITIGATIONS=y
CONFIG_PAGE_TABLE_ISOLATION=y
CONFIG_RETPOLINE=y
CONFIG_RETHUNK=y
CONFIG_CALL_DEPTH_TRACKING=y
# CONFIG_CALL_THUNKS_DEBUG is not set
CONFIG_CPU_IBRS_ENTRY=y
# CONFIG_SLS is not set
CONFIG_ARCH_HAS_ADD_PAGES=y
CONFIG_ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE=y

#
# Power management and ACPI options
#
CONFIG_ARCH_HIBERNATION_HEADER=y
CONFIG_SUSPEND=y
CONFIG_SUSPEND_FREEZER=y
# CONFIG_SUSPEND_SKIP_SYNC is not set
CONFIG_HIBERNATE_CALLBACKS=y
CONFIG_HIBERNATION=y
CONFIG_HIBERNATION_SNAPSHOT_DEV=y
CONFIG_PM_STD_PARTITION=""
CONFIG_PM_SLEEP=y
CONFIG_PM_SLEEP_SMP=y
# CONFIG_PM_AUTOSLEEP is not set
# CONFIG_PM_USERSPACE_AUTOSLEEP is not set
# CONFIG_PM_WAKELOCKS is not set
CONFIG_PM=y
# CONFIG_PM_DEBUG is not set
CONFIG_PM_CLK=y
# CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
# CONFIG_ENERGY_MODEL is not set
CONFIG_ARCH_SUPPORTS_ACPI=y
CONFIG_ACPI=y
CONFIG_ACPI_LEGACY_TABLES_LOOKUP=y
CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=y
CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=y
# CONFIG_ACPI_DEBUGGER is not set
CONFIG_ACPI_SPCR_TABLE=y
# CONFIG_ACPI_FPDT is not set
CONFIG_ACPI_LPIT=y
CONFIG_ACPI_SLEEP=y
CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=y
CONFIG_ACPI_EC_DEBUGFS=m
CONFIG_ACPI_AC=y
CONFIG_ACPI_BATTERY=y
CONFIG_ACPI_BUTTON=y
CONFIG_ACPI_VIDEO=m
CONFIG_ACPI_FAN=y
CONFIG_ACPI_TAD=m
CONFIG_ACPI_DOCK=y
CONFIG_ACPI_CPU_FREQ_PSS=y
CONFIG_ACPI_PROCESSOR_CSTATE=y
CONFIG_ACPI_PROCESSOR_IDLE=y
CONFIG_ACPI_CPPC_LIB=y
CONFIG_ACPI_PROCESSOR=y
CONFIG_ACPI_IPMI=m
CONFIG_ACPI_HOTPLUG_CPU=y
CONFIG_ACPI_PROCESSOR_AGGREGATOR=m
CONFIG_ACPI_THERMAL=y
CONFIG_ACPI_PLATFORM_PROFILE=m
CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=y
CONFIG_ACPI_TABLE_UPGRADE=y
# CONFIG_ACPI_DEBUG is not set
CONFIG_ACPI_PCI_SLOT=y
CONFIG_ACPI_CONTAINER=y
CONFIG_ACPI_HOTPLUG_MEMORY=y
CONFIG_ACPI_HOTPLUG_IOAPIC=y
CONFIG_ACPI_SBS=m
CONFIG_ACPI_HED=y
# CONFIG_ACPI_CUSTOM_METHOD is not set
CONFIG_ACPI_BGRT=y
# CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
CONFIG_ACPI_NFIT=m
# CONFIG_NFIT_SECURITY_DEBUG is not set
CONFIG_ACPI_NUMA=y
CONFIG_ACPI_HMAT=y
CONFIG_HAVE_ACPI_APEI=y
CONFIG_HAVE_ACPI_APEI_NMI=y
CONFIG_ACPI_APEI=y
CONFIG_ACPI_APEI_GHES=y
CONFIG_ACPI_APEI_PCIEAER=y
CONFIG_ACPI_APEI_MEMORY_FAILURE=y
CONFIG_ACPI_APEI_EINJ=m
# CONFIG_ACPI_APEI_ERST_DEBUG is not set
# CONFIG_ACPI_DPTF is not set
CONFIG_ACPI_WATCHDOG=y
CONFIG_ACPI_EXTLOG=m
CONFIG_ACPI_ADXL=y
# CONFIG_ACPI_CONFIGFS is not set
# CONFIG_ACPI_PFRUT is not set
CONFIG_ACPI_PCC=y
# CONFIG_ACPI_FFH is not set
# CONFIG_PMIC_OPREGION is not set
CONFIG_ACPI_PRMT=y
CONFIG_X86_PM_TIMER=y

#
# CPU Frequency scaling
#
CONFIG_CPU_FREQ=y
CONFIG_CPU_FREQ_GOV_ATTR_SET=y
CONFIG_CPU_FREQ_GOV_COMMON=y
CONFIG_CPU_FREQ_STAT=y
CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y
# CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL is not set
CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
CONFIG_CPU_FREQ_GOV_POWERSAVE=y
CONFIG_CPU_FREQ_GOV_USERSPACE=y
CONFIG_CPU_FREQ_GOV_ONDEMAND=y
CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y

#
# CPU frequency scaling drivers
#
CONFIG_X86_INTEL_PSTATE=y
# CONFIG_X86_PCC_CPUFREQ is not set
# CONFIG_X86_AMD_PSTATE is not set
# CONFIG_X86_AMD_PSTATE_UT is not set
CONFIG_X86_ACPI_CPUFREQ=m
# CONFIG_X86_POWERNOW_K8 is not set
# CONFIG_X86_SPEEDSTEP_CENTRINO is not set
CONFIG_X86_P4_CLOCKMOD=m

#
# shared options
#
CONFIG_X86_SPEEDSTEP_LIB=m
# end of CPU Frequency scaling

#
# CPU Idle
#
CONFIG_CPU_IDLE=y
# CONFIG_CPU_IDLE_GOV_LADDER is not set
CONFIG_CPU_IDLE_GOV_MENU=y
# CONFIG_CPU_IDLE_GOV_TEO is not set
CONFIG_CPU_IDLE_GOV_HALTPOLL=y
CONFIG_HALTPOLL_CPUIDLE=y
# end of CPU Idle

CONFIG_INTEL_IDLE=y
# end of Power management and ACPI options

#
# Bus options (PCI etc.)
#
CONFIG_PCI_DIRECT=y
CONFIG_PCI_MMCONFIG=y
CONFIG_MMCONF_FAM10H=y
# CONFIG_PCI_CNB20LE_QUIRK is not set
# CONFIG_ISA_BUS is not set
CONFIG_ISA_DMA_API=y
# end of Bus options (PCI etc.)

#
# Binary Emulations
#
CONFIG_IA32_EMULATION=y
# CONFIG_X86_X32_ABI is not set
CONFIG_COMPAT_32=y
CONFIG_COMPAT=y
CONFIG_COMPAT_FOR_U64_ALIGNMENT=y
# end of Binary Emulations

CONFIG_HAVE_KVM=y
CONFIG_HAVE_KVM_PFNCACHE=y
CONFIG_HAVE_KVM_IRQCHIP=y
CONFIG_HAVE_KVM_IRQFD=y
CONFIG_HAVE_KVM_IRQ_ROUTING=y
CONFIG_HAVE_KVM_DIRTY_RING=y
CONFIG_HAVE_KVM_DIRTY_RING_TSO=y
CONFIG_HAVE_KVM_DIRTY_RING_ACQ_REL=y
CONFIG_HAVE_KVM_EVENTFD=y
CONFIG_KVM_MMIO=y
CONFIG_KVM_ASYNC_PF=y
CONFIG_HAVE_KVM_MSI=y
CONFIG_HAVE_KVM_CPU_RELAX_INTERCEPT=y
CONFIG_KVM_VFIO=y
CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT=y
CONFIG_KVM_COMPAT=y
CONFIG_HAVE_KVM_IRQ_BYPASS=y
CONFIG_HAVE_KVM_NO_POLL=y
CONFIG_KVM_XFER_TO_GUEST_WORK=y
CONFIG_HAVE_KVM_PM_NOTIFIER=y
CONFIG_KVM_GENERIC_HARDWARE_ENABLING=y
CONFIG_VIRTUALIZATION=y
CONFIG_KVM=m
# CONFIG_KVM_WERROR is not set
CONFIG_KVM_INTEL=m
# CONFIG_KVM_AMD is not set
CONFIG_KVM_SMM=y
# CONFIG_KVM_XEN is not set
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
CONFIG_HOTPLUG_CORE_SYNC=y
CONFIG_HOTPLUG_CORE_SYNC_DEAD=y
CONFIG_HOTPLUG_CORE_SYNC_FULL=y
CONFIG_HOTPLUG_SPLIT_STARTUP=y
CONFIG_HOTPLUG_PARALLEL=y
CONFIG_GENERIC_ENTRY=y
CONFIG_KPROBES=y
CONFIG_JUMP_LABEL=y
# CONFIG_STATIC_KEYS_SELFTEST is not set
# CONFIG_STATIC_CALL_SELFTEST is not set
CONFIG_OPTPROBES=y
CONFIG_KPROBES_ON_FTRACE=y
CONFIG_UPROBES=y
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
CONFIG_ARCH_USE_BUILTIN_BSWAP=y
CONFIG_KRETPROBES=y
CONFIG_KRETPROBE_ON_RETHOOK=y
CONFIG_USER_RETURN_NOTIFIER=y
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
CONFIG_ARCH_HAS_CPU_FINALIZE_INIT=y
CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=y
CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=y
CONFIG_ARCH_WANTS_NO_INSTR=y
CONFIG_HAVE_ASM_MODVERSIONS=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_RSEQ=y
CONFIG_HAVE_RUST=y
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
CONFIG_ARCH_WANT_COMPAT_IPC_PARSE_VERSION=y
CONFIG_ARCH_WANT_OLD_COMPAT_IPC=y
CONFIG_HAVE_ARCH_SECCOMP=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
CONFIG_SECCOMP=y
CONFIG_SECCOMP_FILTER=y
# CONFIG_SECCOMP_CACHE_DEBUG is not set
CONFIG_HAVE_ARCH_STACKLEAK=y
CONFIG_HAVE_STACKPROTECTOR=y
CONFIG_STACKPROTECTOR=y
CONFIG_STACKPROTECTOR_STRONG=y
CONFIG_ARCH_SUPPORTS_LTO_CLANG=y
CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN=y
CONFIG_LTO_NONE=y
CONFIG_ARCH_SUPPORTS_CFI_CLANG=y
CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=y
CONFIG_HAVE_CONTEXT_TRACKING_USER=y
CONFIG_HAVE_CONTEXT_TRACKING_USER_OFFSTACK=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_MOVE_PUD=y
CONFIG_HAVE_MOVE_PMD=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=y
CONFIG_HAVE_ARCH_HUGE_VMAP=y
CONFIG_HAVE_ARCH_HUGE_VMALLOC=y
CONFIG_ARCH_WANT_HUGE_PMD_SHARE=y
CONFIG_HAVE_ARCH_SOFT_DIRTY=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=y
CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=y
CONFIG_SOFTIRQ_ON_OWN_STACK=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
CONFIG_HAVE_EXIT_THREAD=y
CONFIG_ARCH_MMAP_RND_BITS=28
CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS=y
CONFIG_ARCH_MMAP_RND_COMPAT_BITS=8
CONFIG_HAVE_ARCH_COMPAT_MMAP_BASES=y
CONFIG_PAGE_SIZE_LESS_THAN_64KB=y
CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
CONFIG_HAVE_OBJTOOL=y
CONFIG_HAVE_JUMP_LABEL_HACK=y
CONFIG_HAVE_NOINSTR_HACK=y
CONFIG_HAVE_NOINSTR_VALIDATION=y
CONFIG_HAVE_UACCESS_VALIDATION=y
CONFIG_HAVE_STACK_VALIDATION=y
CONFIG_HAVE_RELIABLE_STACKTRACE=y
CONFIG_OLD_SIGSUSPEND3=y
CONFIG_COMPAT_OLD_SIGACTION=y
CONFIG_COMPAT_32BIT_TIME=y
CONFIG_HAVE_ARCH_VMAP_STACK=y
CONFIG_VMAP_STACK=y
CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=y
CONFIG_RANDOMIZE_KSTACK_OFFSET=y
# CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT is not set
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
CONFIG_STRICT_KERNEL_RWX=y
CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
CONFIG_STRICT_MODULE_RWX=y
CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=y
CONFIG_ARCH_USE_MEMREMAP_PROT=y
# CONFIG_LOCK_EVENT_COUNTS is not set
CONFIG_ARCH_HAS_MEM_ENCRYPT=y
CONFIG_HAVE_STATIC_CALL=y
CONFIG_HAVE_STATIC_CALL_INLINE=y
CONFIG_HAVE_PREEMPT_DYNAMIC=y
CONFIG_HAVE_PREEMPT_DYNAMIC_CALL=y
CONFIG_ARCH_WANT_LD_ORPHAN_WARN=y
CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
CONFIG_ARCH_SUPPORTS_PAGE_TABLE_CHECK=y
CONFIG_ARCH_HAS_ELFCORE_COMPAT=y
CONFIG_ARCH_HAS_PARANOID_L1D_FLUSH=y
CONFIG_DYNAMIC_SIGFRAME=y
CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG=y

#
# GCOV-based kernel profiling
#
# CONFIG_GCOV_KERNEL is not set
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
# end of GCOV-based kernel profiling

CONFIG_HAVE_GCC_PLUGINS=y
CONFIG_GCC_PLUGINS=y
# CONFIG_GCC_PLUGIN_LATENT_ENTROPY is not set
CONFIG_FUNCTION_ALIGNMENT_4B=y
CONFIG_FUNCTION_ALIGNMENT_16B=y
CONFIG_FUNCTION_ALIGNMENT=16
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
CONFIG_MODULE_SIG_FORMAT=y
CONFIG_MODULES=y
# CONFIG_MODULE_DEBUG is not set
CONFIG_MODULE_FORCE_LOAD=y
CONFIG_MODULE_UNLOAD=y
# CONFIG_MODULE_FORCE_UNLOAD is not set
# CONFIG_MODULE_UNLOAD_TAINT_TRACKING is not set
# CONFIG_MODVERSIONS is not set
# CONFIG_MODULE_SRCVERSION_ALL is not set
CONFIG_MODULE_SIG=y
# CONFIG_MODULE_SIG_FORCE is not set
CONFIG_MODULE_SIG_ALL=y
# CONFIG_MODULE_SIG_SHA1 is not set
# CONFIG_MODULE_SIG_SHA224 is not set
CONFIG_MODULE_SIG_SHA256=y
# CONFIG_MODULE_SIG_SHA384 is not set
# CONFIG_MODULE_SIG_SHA512 is not set
CONFIG_MODULE_SIG_HASH="sha256"
CONFIG_MODULE_COMPRESS_NONE=y
# CONFIG_MODULE_COMPRESS_GZIP is not set
# CONFIG_MODULE_COMPRESS_XZ is not set
# CONFIG_MODULE_COMPRESS_ZSTD is not set
# CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
CONFIG_MODPROBE_PATH="/sbin/modprobe"
# CONFIG_TRIM_UNUSED_KSYMS is not set
CONFIG_MODULES_TREE_LOOKUP=y
CONFIG_BLOCK=y
CONFIG_BLOCK_LEGACY_AUTOLOAD=y
CONFIG_BLK_CGROUP_RWSTAT=y
CONFIG_BLK_CGROUP_PUNT_BIO=y
CONFIG_BLK_DEV_BSG_COMMON=y
CONFIG_BLK_ICQ=y
CONFIG_BLK_DEV_BSGLIB=y
CONFIG_BLK_DEV_INTEGRITY=y
CONFIG_BLK_DEV_INTEGRITY_T10=m
# CONFIG_BLK_DEV_ZONED is not set
CONFIG_BLK_DEV_THROTTLING=y
# CONFIG_BLK_DEV_THROTTLING_LOW is not set
CONFIG_BLK_WBT=y
CONFIG_BLK_WBT_MQ=y
# CONFIG_BLK_CGROUP_IOLATENCY is not set
# CONFIG_BLK_CGROUP_IOCOST is not set
# CONFIG_BLK_CGROUP_IOPRIO is not set
CONFIG_BLK_DEBUG_FS=y
# CONFIG_BLK_SED_OPAL is not set
# CONFIG_BLK_INLINE_ENCRYPTION is not set

#
# Partition Types
#
# CONFIG_PARTITION_ADVANCED is not set
CONFIG_MSDOS_PARTITION=y
CONFIG_EFI_PARTITION=y
# end of Partition Types

CONFIG_BLK_MQ_PCI=y
CONFIG_BLK_MQ_VIRTIO=y
CONFIG_BLK_PM=y
CONFIG_BLOCK_HOLDER_DEPRECATED=y
CONFIG_BLK_MQ_STACKING=y

#
# IO Schedulers
#
CONFIG_MQ_IOSCHED_DEADLINE=y
CONFIG_MQ_IOSCHED_KYBER=y
CONFIG_IOSCHED_BFQ=y
CONFIG_BFQ_GROUP_IOSCHED=y
# CONFIG_BFQ_CGROUP_DEBUG is not set
# end of IO Schedulers

CONFIG_PREEMPT_NOTIFIERS=y
CONFIG_PADATA=y
CONFIG_ASN1=y
CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
CONFIG_INLINE_READ_UNLOCK=y
CONFIG_INLINE_READ_UNLOCK_IRQ=y
CONFIG_INLINE_WRITE_UNLOCK=y
CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
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
CONFIG_FREEZER=y

#
# Executable file formats
#
CONFIG_BINFMT_ELF=y
CONFIG_COMPAT_BINFMT_ELF=y
CONFIG_ELFCORE=y
CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=y
CONFIG_BINFMT_SCRIPT=y
CONFIG_BINFMT_MISC=m
CONFIG_COREDUMP=y
# end of Executable file formats

#
# Memory Management options
#
CONFIG_ZPOOL=y
CONFIG_SWAP=y
CONFIG_ZSWAP=y
# CONFIG_ZSWAP_DEFAULT_ON is not set
# CONFIG_ZSWAP_EXCLUSIVE_LOADS_DEFAULT_ON is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_DEFLATE is not set
CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZO=y
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_842 is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4 is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4HC is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_ZSTD is not set
CONFIG_ZSWAP_COMPRESSOR_DEFAULT="lzo"
CONFIG_ZSWAP_ZPOOL_DEFAULT_ZBUD=y
# CONFIG_ZSWAP_ZPOOL_DEFAULT_Z3FOLD is not set
# CONFIG_ZSWAP_ZPOOL_DEFAULT_ZSMALLOC is not set
CONFIG_ZSWAP_ZPOOL_DEFAULT="zbud"
CONFIG_ZBUD=y
# CONFIG_Z3FOLD is not set
CONFIG_ZSMALLOC=y
CONFIG_ZSMALLOC_STAT=y
CONFIG_ZSMALLOC_CHAIN_SIZE=8

#
# SLAB allocator options
#
# CONFIG_SLAB_DEPRECATED is not set
CONFIG_SLUB=y
# CONFIG_SLUB_TINY is not set
CONFIG_SLAB_MERGE_DEFAULT=y
CONFIG_SLAB_FREELIST_RANDOM=y
# CONFIG_SLAB_FREELIST_HARDENED is not set
# CONFIG_SLUB_STATS is not set
CONFIG_SLUB_CPU_PARTIAL=y
# end of SLAB allocator options

CONFIG_SHUFFLE_PAGE_ALLOCATOR=y
# CONFIG_COMPAT_BRK is not set
CONFIG_SPARSEMEM=y
CONFIG_SPARSEMEM_EXTREME=y
CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
CONFIG_SPARSEMEM_VMEMMAP=y
CONFIG_ARCH_WANT_OPTIMIZE_VMEMMAP=y
CONFIG_HAVE_FAST_GUP=y
CONFIG_NUMA_KEEP_MEMINFO=y
CONFIG_MEMORY_ISOLATION=y
CONFIG_EXCLUSIVE_SYSTEM_RAM=y
CONFIG_HAVE_BOOTMEM_INFO_NODE=y
CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=y
CONFIG_MEMORY_HOTPLUG=y
# CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE is not set
CONFIG_MEMORY_HOTREMOVE=y
CONFIG_MHP_MEMMAP_ON_MEMORY=y
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=y
CONFIG_MEMORY_BALLOON=y
CONFIG_BALLOON_COMPACTION=y
CONFIG_COMPACTION=y
CONFIG_COMPACT_UNEVICTABLE_DEFAULT=1
CONFIG_PAGE_REPORTING=y
CONFIG_MIGRATION=y
CONFIG_DEVICE_MIGRATION=y
CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION=y
CONFIG_ARCH_ENABLE_THP_MIGRATION=y
CONFIG_CONTIG_ALLOC=y
CONFIG_PHYS_ADDR_T_64BIT=y
CONFIG_MMU_NOTIFIER=y
CONFIG_KSM=y
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=y
CONFIG_MEMORY_FAILURE=y
CONFIG_HWPOISON_INJECT=m
CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
CONFIG_ARCH_WANTS_THP_SWAP=y
CONFIG_TRANSPARENT_HUGEPAGE=y
CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS=y
# CONFIG_TRANSPARENT_HUGEPAGE_MADVISE is not set
CONFIG_THP_SWAP=y
# CONFIG_READ_ONLY_THP_FOR_FS is not set
CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
CONFIG_USE_PERCPU_NUMA_NODE_ID=y
CONFIG_HAVE_SETUP_PER_CPU_AREA=y
CONFIG_FRONTSWAP=y
# CONFIG_CMA is not set
CONFIG_GENERIC_EARLY_IOREMAP=y
CONFIG_DEFERRED_STRUCT_PAGE_INIT=y
CONFIG_PAGE_IDLE_FLAG=y
CONFIG_IDLE_PAGE_TRACKING=y
CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
CONFIG_ARCH_HAS_CURRENT_STACK_POINTER=y
CONFIG_ARCH_HAS_PTE_DEVMAP=y
CONFIG_ARCH_HAS_ZONE_DMA_SET=y
CONFIG_ZONE_DMA=y
CONFIG_ZONE_DMA32=y
CONFIG_ZONE_DEVICE=y
CONFIG_GET_FREE_REGION=y
CONFIG_DEVICE_PRIVATE=y
CONFIG_VMAP_PFN=y
CONFIG_ARCH_USES_HIGH_VMA_FLAGS=y
CONFIG_ARCH_HAS_PKEYS=y
CONFIG_VM_EVENT_COUNTERS=y
# CONFIG_PERCPU_STATS is not set
# CONFIG_GUP_TEST is not set
# CONFIG_DMAPOOL_TEST is not set
CONFIG_ARCH_HAS_PTE_SPECIAL=y
CONFIG_SECRETMEM=y
# CONFIG_ANON_VMA_NAME is not set
CONFIG_USERFAULTFD=y
CONFIG_HAVE_ARCH_USERFAULTFD_WP=y
CONFIG_HAVE_ARCH_USERFAULTFD_MINOR=y
CONFIG_PTE_MARKER_UFFD_WP=y
# CONFIG_LRU_GEN is not set
CONFIG_ARCH_SUPPORTS_PER_VMA_LOCK=y
CONFIG_PER_VMA_LOCK=y
CONFIG_LOCK_MM_AND_FIND_VMA=y

#
# Data Access Monitoring
#
# CONFIG_DAMON is not set
# end of Data Access Monitoring
# end of Memory Management options

CONFIG_NET=y
CONFIG_NET_INGRESS=y
CONFIG_NET_EGRESS=y
CONFIG_SKB_EXTENSIONS=y

#
# Networking options
#
CONFIG_PACKET=y
CONFIG_PACKET_DIAG=m
CONFIG_UNIX=y
CONFIG_UNIX_SCM=y
CONFIG_AF_UNIX_OOB=y
CONFIG_UNIX_DIAG=m
CONFIG_TLS=m
CONFIG_TLS_DEVICE=y
# CONFIG_TLS_TOE is not set
CONFIG_XFRM=y
CONFIG_XFRM_OFFLOAD=y
CONFIG_XFRM_ALGO=y
CONFIG_XFRM_USER=y
# CONFIG_XFRM_USER_COMPAT is not set
# CONFIG_XFRM_INTERFACE is not set
CONFIG_XFRM_SUB_POLICY=y
CONFIG_XFRM_MIGRATE=y
CONFIG_XFRM_STATISTICS=y
CONFIG_XFRM_AH=m
CONFIG_XFRM_ESP=m
CONFIG_XFRM_IPCOMP=m
# CONFIG_NET_KEY is not set
CONFIG_XDP_SOCKETS=y
# CONFIG_XDP_SOCKETS_DIAG is not set
CONFIG_NET_HANDSHAKE=y
CONFIG_INET=y
CONFIG_IP_MULTICAST=y
CONFIG_IP_ADVANCED_ROUTER=y
CONFIG_IP_FIB_TRIE_STATS=y
CONFIG_IP_MULTIPLE_TABLES=y
CONFIG_IP_ROUTE_MULTIPATH=y
CONFIG_IP_ROUTE_VERBOSE=y
CONFIG_IP_ROUTE_CLASSID=y
CONFIG_IP_PNP=y
CONFIG_IP_PNP_DHCP=y
# CONFIG_IP_PNP_BOOTP is not set
# CONFIG_IP_PNP_RARP is not set
CONFIG_NET_IPIP=m
CONFIG_NET_IPGRE_DEMUX=m
CONFIG_NET_IP_TUNNEL=m
CONFIG_NET_IPGRE=m
CONFIG_NET_IPGRE_BROADCAST=y
CONFIG_IP_MROUTE_COMMON=y
CONFIG_IP_MROUTE=y
CONFIG_IP_MROUTE_MULTIPLE_TABLES=y
CONFIG_IP_PIMSM_V1=y
CONFIG_IP_PIMSM_V2=y
CONFIG_SYN_COOKIES=y
CONFIG_NET_IPVTI=m
CONFIG_NET_UDP_TUNNEL=m
# CONFIG_NET_FOU is not set
# CONFIG_NET_FOU_IP_TUNNELS is not set
CONFIG_INET_AH=m
CONFIG_INET_ESP=m
CONFIG_INET_ESP_OFFLOAD=m
# CONFIG_INET_ESPINTCP is not set
CONFIG_INET_IPCOMP=m
CONFIG_INET_TABLE_PERTURB_ORDER=16
CONFIG_INET_XFRM_TUNNEL=m
CONFIG_INET_TUNNEL=m
CONFIG_INET_DIAG=m
CONFIG_INET_TCP_DIAG=m
CONFIG_INET_UDP_DIAG=m
CONFIG_INET_RAW_DIAG=m
# CONFIG_INET_DIAG_DESTROY is not set
CONFIG_TCP_CONG_ADVANCED=y
CONFIG_TCP_CONG_BIC=m
CONFIG_TCP_CONG_CUBIC=y
CONFIG_TCP_CONG_WESTWOOD=m
CONFIG_TCP_CONG_HTCP=m
CONFIG_TCP_CONG_HSTCP=m
CONFIG_TCP_CONG_HYBLA=m
CONFIG_TCP_CONG_VEGAS=m
CONFIG_TCP_CONG_NV=m
CONFIG_TCP_CONG_SCALABLE=m
CONFIG_TCP_CONG_LP=m
CONFIG_TCP_CONG_VENO=m
CONFIG_TCP_CONG_YEAH=m
CONFIG_TCP_CONG_ILLINOIS=m
CONFIG_TCP_CONG_DCTCP=m
# CONFIG_TCP_CONG_CDG is not set
CONFIG_TCP_CONG_BBR=m
CONFIG_DEFAULT_CUBIC=y
# CONFIG_DEFAULT_RENO is not set
CONFIG_DEFAULT_TCP_CONG="cubic"
CONFIG_TCP_MD5SIG=y
CONFIG_IPV6=y
CONFIG_IPV6_ROUTER_PREF=y
CONFIG_IPV6_ROUTE_INFO=y
CONFIG_IPV6_OPTIMISTIC_DAD=y
CONFIG_INET6_AH=m
CONFIG_INET6_ESP=m
CONFIG_INET6_ESP_OFFLOAD=m
# CONFIG_INET6_ESPINTCP is not set
CONFIG_INET6_IPCOMP=m
CONFIG_IPV6_MIP6=m
# CONFIG_IPV6_ILA is not set
CONFIG_INET6_XFRM_TUNNEL=m
CONFIG_INET6_TUNNEL=m
CONFIG_IPV6_VTI=m
CONFIG_IPV6_SIT=m
CONFIG_IPV6_SIT_6RD=y
CONFIG_IPV6_NDISC_NODETYPE=y
CONFIG_IPV6_TUNNEL=m
CONFIG_IPV6_GRE=m
CONFIG_IPV6_MULTIPLE_TABLES=y
# CONFIG_IPV6_SUBTREES is not set
CONFIG_IPV6_MROUTE=y
CONFIG_IPV6_MROUTE_MULTIPLE_TABLES=y
CONFIG_IPV6_PIMSM_V2=y
# CONFIG_IPV6_SEG6_LWTUNNEL is not set
# CONFIG_IPV6_SEG6_HMAC is not set
# CONFIG_IPV6_RPL_LWTUNNEL is not set
# CONFIG_IPV6_IOAM6_LWTUNNEL is not set
CONFIG_NETLABEL=y
# CONFIG_MPTCP is not set
CONFIG_NETWORK_SECMARK=y
CONFIG_NET_PTP_CLASSIFY=y
CONFIG_NETWORK_PHY_TIMESTAMPING=y
CONFIG_NETFILTER=y
CONFIG_NETFILTER_ADVANCED=y
CONFIG_BRIDGE_NETFILTER=m

#
# Core Netfilter Configuration
#
CONFIG_NETFILTER_INGRESS=y
CONFIG_NETFILTER_EGRESS=y
CONFIG_NETFILTER_SKIP_EGRESS=y
CONFIG_NETFILTER_NETLINK=m
CONFIG_NETFILTER_FAMILY_BRIDGE=y
CONFIG_NETFILTER_FAMILY_ARP=y
CONFIG_NETFILTER_BPF_LINK=y
# CONFIG_NETFILTER_NETLINK_HOOK is not set
# CONFIG_NETFILTER_NETLINK_ACCT is not set
CONFIG_NETFILTER_NETLINK_QUEUE=m
CONFIG_NETFILTER_NETLINK_LOG=m
CONFIG_NETFILTER_NETLINK_OSF=m
CONFIG_NF_CONNTRACK=m
CONFIG_NF_LOG_SYSLOG=m
CONFIG_NETFILTER_CONNCOUNT=m
CONFIG_NF_CONNTRACK_MARK=y
CONFIG_NF_CONNTRACK_SECMARK=y
CONFIG_NF_CONNTRACK_ZONES=y
CONFIG_NF_CONNTRACK_PROCFS=y
CONFIG_NF_CONNTRACK_EVENTS=y
CONFIG_NF_CONNTRACK_TIMEOUT=y
CONFIG_NF_CONNTRACK_TIMESTAMP=y
CONFIG_NF_CONNTRACK_LABELS=y
CONFIG_NF_CONNTRACK_OVS=y
CONFIG_NF_CT_PROTO_DCCP=y
CONFIG_NF_CT_PROTO_GRE=y
CONFIG_NF_CT_PROTO_SCTP=y
CONFIG_NF_CT_PROTO_UDPLITE=y
CONFIG_NF_CONNTRACK_AMANDA=m
CONFIG_NF_CONNTRACK_FTP=m
CONFIG_NF_CONNTRACK_H323=m
CONFIG_NF_CONNTRACK_IRC=m
CONFIG_NF_CONNTRACK_BROADCAST=m
CONFIG_NF_CONNTRACK_NETBIOS_NS=m
CONFIG_NF_CONNTRACK_SNMP=m
CONFIG_NF_CONNTRACK_PPTP=m
CONFIG_NF_CONNTRACK_SANE=m
CONFIG_NF_CONNTRACK_SIP=m
CONFIG_NF_CONNTRACK_TFTP=m
CONFIG_NF_CT_NETLINK=m
CONFIG_NF_CT_NETLINK_TIMEOUT=m
CONFIG_NF_CT_NETLINK_HELPER=m
CONFIG_NETFILTER_NETLINK_GLUE_CT=y
CONFIG_NF_NAT=m
CONFIG_NF_NAT_AMANDA=m
CONFIG_NF_NAT_FTP=m
CONFIG_NF_NAT_IRC=m
CONFIG_NF_NAT_SIP=m
CONFIG_NF_NAT_TFTP=m
CONFIG_NF_NAT_REDIRECT=y
CONFIG_NF_NAT_MASQUERADE=y
CONFIG_NF_NAT_OVS=y
CONFIG_NETFILTER_SYNPROXY=m
CONFIG_NF_TABLES=m
CONFIG_NF_TABLES_INET=y
CONFIG_NF_TABLES_NETDEV=y
CONFIG_NFT_NUMGEN=m
CONFIG_NFT_CT=m
CONFIG_NFT_CONNLIMIT=m
CONFIG_NFT_LOG=m
CONFIG_NFT_LIMIT=m
CONFIG_NFT_MASQ=m
CONFIG_NFT_REDIR=m
CONFIG_NFT_NAT=m
# CONFIG_NFT_TUNNEL is not set
CONFIG_NFT_QUEUE=m
CONFIG_NFT_QUOTA=m
CONFIG_NFT_REJECT=m
CONFIG_NFT_REJECT_INET=m
CONFIG_NFT_COMPAT=m
CONFIG_NFT_HASH=m
CONFIG_NFT_FIB=m
CONFIG_NFT_FIB_INET=m
# CONFIG_NFT_XFRM is not set
CONFIG_NFT_SOCKET=m
# CONFIG_NFT_OSF is not set
# CONFIG_NFT_TPROXY is not set
# CONFIG_NFT_SYNPROXY is not set
CONFIG_NF_DUP_NETDEV=m
CONFIG_NFT_DUP_NETDEV=m
CONFIG_NFT_FWD_NETDEV=m
CONFIG_NFT_FIB_NETDEV=m
# CONFIG_NFT_REJECT_NETDEV is not set
# CONFIG_NF_FLOW_TABLE is not set
CONFIG_NETFILTER_XTABLES=y
# CONFIG_NETFILTER_XTABLES_COMPAT is not set

#
# Xtables combined modules
#
CONFIG_NETFILTER_XT_MARK=m
CONFIG_NETFILTER_XT_CONNMARK=m

#
# Xtables targets
#
CONFIG_NETFILTER_XT_TARGET_AUDIT=m
CONFIG_NETFILTER_XT_TARGET_CHECKSUM=m
CONFIG_NETFILTER_XT_TARGET_CLASSIFY=m
CONFIG_NETFILTER_XT_TARGET_CONNMARK=m
CONFIG_NETFILTER_XT_TARGET_CONNSECMARK=m
CONFIG_NETFILTER_XT_TARGET_CT=m
CONFIG_NETFILTER_XT_TARGET_DSCP=m
CONFIG_NETFILTER_XT_TARGET_HL=m
CONFIG_NETFILTER_XT_TARGET_HMARK=m
CONFIG_NETFILTER_XT_TARGET_IDLETIMER=m
# CONFIG_NETFILTER_XT_TARGET_LED is not set
CONFIG_NETFILTER_XT_TARGET_LOG=m
CONFIG_NETFILTER_XT_TARGET_MARK=m
CONFIG_NETFILTER_XT_NAT=m
CONFIG_NETFILTER_XT_TARGET_NETMAP=m
CONFIG_NETFILTER_XT_TARGET_NFLOG=m
CONFIG_NETFILTER_XT_TARGET_NFQUEUE=m
CONFIG_NETFILTER_XT_TARGET_NOTRACK=m
CONFIG_NETFILTER_XT_TARGET_RATEEST=m
CONFIG_NETFILTER_XT_TARGET_REDIRECT=m
CONFIG_NETFILTER_XT_TARGET_MASQUERADE=m
CONFIG_NETFILTER_XT_TARGET_TEE=m
CONFIG_NETFILTER_XT_TARGET_TPROXY=m
CONFIG_NETFILTER_XT_TARGET_TRACE=m
CONFIG_NETFILTER_XT_TARGET_SECMARK=m
CONFIG_NETFILTER_XT_TARGET_TCPMSS=m
CONFIG_NETFILTER_XT_TARGET_TCPOPTSTRIP=m

#
# Xtables matches
#
CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=m
CONFIG_NETFILTER_XT_MATCH_BPF=m
CONFIG_NETFILTER_XT_MATCH_CGROUP=m
CONFIG_NETFILTER_XT_MATCH_CLUSTER=m
CONFIG_NETFILTER_XT_MATCH_COMMENT=m
CONFIG_NETFILTER_XT_MATCH_CONNBYTES=m
CONFIG_NETFILTER_XT_MATCH_CONNLABEL=m
CONFIG_NETFILTER_XT_MATCH_CONNLIMIT=m
CONFIG_NETFILTER_XT_MATCH_CONNMARK=m
CONFIG_NETFILTER_XT_MATCH_CONNTRACK=m
CONFIG_NETFILTER_XT_MATCH_CPU=m
CONFIG_NETFILTER_XT_MATCH_DCCP=m
CONFIG_NETFILTER_XT_MATCH_DEVGROUP=m
CONFIG_NETFILTER_XT_MATCH_DSCP=m
CONFIG_NETFILTER_XT_MATCH_ECN=m
CONFIG_NETFILTER_XT_MATCH_ESP=m
CONFIG_NETFILTER_XT_MATCH_HASHLIMIT=m
CONFIG_NETFILTER_XT_MATCH_HELPER=m
CONFIG_NETFILTER_XT_MATCH_HL=m
# CONFIG_NETFILTER_XT_MATCH_IPCOMP is not set
CONFIG_NETFILTER_XT_MATCH_IPRANGE=m
CONFIG_NETFILTER_XT_MATCH_IPVS=m
# CONFIG_NETFILTER_XT_MATCH_L2TP is not set
CONFIG_NETFILTER_XT_MATCH_LENGTH=m
CONFIG_NETFILTER_XT_MATCH_LIMIT=m
CONFIG_NETFILTER_XT_MATCH_MAC=m
CONFIG_NETFILTER_XT_MATCH_MARK=m
CONFIG_NETFILTER_XT_MATCH_MULTIPORT=m
# CONFIG_NETFILTER_XT_MATCH_NFACCT is not set
CONFIG_NETFILTER_XT_MATCH_OSF=m
CONFIG_NETFILTER_XT_MATCH_OWNER=m
CONFIG_NETFILTER_XT_MATCH_POLICY=m
CONFIG_NETFILTER_XT_MATCH_PHYSDEV=m
CONFIG_NETFILTER_XT_MATCH_PKTTYPE=m
CONFIG_NETFILTER_XT_MATCH_QUOTA=m
CONFIG_NETFILTER_XT_MATCH_RATEEST=m
CONFIG_NETFILTER_XT_MATCH_REALM=m
CONFIG_NETFILTER_XT_MATCH_RECENT=m
CONFIG_NETFILTER_XT_MATCH_SCTP=m
CONFIG_NETFILTER_XT_MATCH_SOCKET=m
CONFIG_NETFILTER_XT_MATCH_STATE=m
CONFIG_NETFILTER_XT_MATCH_STATISTIC=m
CONFIG_NETFILTER_XT_MATCH_STRING=m
CONFIG_NETFILTER_XT_MATCH_TCPMSS=m
# CONFIG_NETFILTER_XT_MATCH_TIME is not set
# CONFIG_NETFILTER_XT_MATCH_U32 is not set
# end of Core Netfilter Configuration

# CONFIG_IP_SET is not set
CONFIG_IP_VS=m
CONFIG_IP_VS_IPV6=y
# CONFIG_IP_VS_DEBUG is not set
CONFIG_IP_VS_TAB_BITS=12

#
# IPVS transport protocol load balancing support
#
CONFIG_IP_VS_PROTO_TCP=y
CONFIG_IP_VS_PROTO_UDP=y
CONFIG_IP_VS_PROTO_AH_ESP=y
CONFIG_IP_VS_PROTO_ESP=y
CONFIG_IP_VS_PROTO_AH=y
CONFIG_IP_VS_PROTO_SCTP=y

#
# IPVS scheduler
#
CONFIG_IP_VS_RR=m
CONFIG_IP_VS_WRR=m
CONFIG_IP_VS_LC=m
CONFIG_IP_VS_WLC=m
CONFIG_IP_VS_FO=m
CONFIG_IP_VS_OVF=m
CONFIG_IP_VS_LBLC=m
CONFIG_IP_VS_LBLCR=m
CONFIG_IP_VS_DH=m
CONFIG_IP_VS_SH=m
# CONFIG_IP_VS_MH is not set
CONFIG_IP_VS_SED=m
CONFIG_IP_VS_NQ=m
# CONFIG_IP_VS_TWOS is not set

#
# IPVS SH scheduler
#
CONFIG_IP_VS_SH_TAB_BITS=8

#
# IPVS MH scheduler
#
CONFIG_IP_VS_MH_TAB_INDEX=12

#
# IPVS application helper
#
CONFIG_IP_VS_FTP=m
CONFIG_IP_VS_NFCT=y
CONFIG_IP_VS_PE_SIP=m

#
# IP: Netfilter Configuration
#
CONFIG_NF_DEFRAG_IPV4=m
CONFIG_NF_SOCKET_IPV4=m
CONFIG_NF_TPROXY_IPV4=m
CONFIG_NF_TABLES_IPV4=y
CONFIG_NFT_REJECT_IPV4=m
CONFIG_NFT_DUP_IPV4=m
CONFIG_NFT_FIB_IPV4=m
CONFIG_NF_TABLES_ARP=y
CONFIG_NF_DUP_IPV4=m
CONFIG_NF_LOG_ARP=m
CONFIG_NF_LOG_IPV4=m
CONFIG_NF_REJECT_IPV4=m
CONFIG_NF_NAT_SNMP_BASIC=m
CONFIG_NF_NAT_PPTP=m
CONFIG_NF_NAT_H323=m
CONFIG_IP_NF_IPTABLES=m
CONFIG_IP_NF_MATCH_AH=m
CONFIG_IP_NF_MATCH_ECN=m
CONFIG_IP_NF_MATCH_RPFILTER=m
CONFIG_IP_NF_MATCH_TTL=m
CONFIG_IP_NF_FILTER=m
CONFIG_IP_NF_TARGET_REJECT=m
CONFIG_IP_NF_TARGET_SYNPROXY=m
CONFIG_IP_NF_NAT=m
CONFIG_IP_NF_TARGET_MASQUERADE=m
CONFIG_IP_NF_TARGET_NETMAP=m
CONFIG_IP_NF_TARGET_REDIRECT=m
CONFIG_IP_NF_MANGLE=m
CONFIG_IP_NF_TARGET_ECN=m
CONFIG_IP_NF_TARGET_TTL=m
CONFIG_IP_NF_RAW=m
CONFIG_IP_NF_SECURITY=m
CONFIG_IP_NF_ARPTABLES=m
CONFIG_IP_NF_ARPFILTER=m
CONFIG_IP_NF_ARP_MANGLE=m
# end of IP: Netfilter Configuration

#
# IPv6: Netfilter Configuration
#
CONFIG_NF_SOCKET_IPV6=m
CONFIG_NF_TPROXY_IPV6=m
CONFIG_NF_TABLES_IPV6=y
CONFIG_NFT_REJECT_IPV6=m
CONFIG_NFT_DUP_IPV6=m
CONFIG_NFT_FIB_IPV6=m
CONFIG_NF_DUP_IPV6=m
CONFIG_NF_REJECT_IPV6=m
CONFIG_NF_LOG_IPV6=m
CONFIG_IP6_NF_IPTABLES=m
CONFIG_IP6_NF_MATCH_AH=m
CONFIG_IP6_NF_MATCH_EUI64=m
CONFIG_IP6_NF_MATCH_FRAG=m
CONFIG_IP6_NF_MATCH_OPTS=m
CONFIG_IP6_NF_MATCH_HL=m
CONFIG_IP6_NF_MATCH_IPV6HEADER=m
CONFIG_IP6_NF_MATCH_MH=m
CONFIG_IP6_NF_MATCH_RPFILTER=m
CONFIG_IP6_NF_MATCH_RT=m
# CONFIG_IP6_NF_MATCH_SRH is not set
# CONFIG_IP6_NF_TARGET_HL is not set
CONFIG_IP6_NF_FILTER=m
CONFIG_IP6_NF_TARGET_REJECT=m
CONFIG_IP6_NF_TARGET_SYNPROXY=m
CONFIG_IP6_NF_MANGLE=m
CONFIG_IP6_NF_RAW=m
CONFIG_IP6_NF_SECURITY=m
CONFIG_IP6_NF_NAT=m
CONFIG_IP6_NF_TARGET_MASQUERADE=m
CONFIG_IP6_NF_TARGET_NPT=m
# end of IPv6: Netfilter Configuration

CONFIG_NF_DEFRAG_IPV6=m
CONFIG_NF_TABLES_BRIDGE=m
# CONFIG_NFT_BRIDGE_META is not set
CONFIG_NFT_BRIDGE_REJECT=m
# CONFIG_NF_CONNTRACK_BRIDGE is not set
CONFIG_BRIDGE_NF_EBTABLES=m
CONFIG_BRIDGE_EBT_BROUTE=m
CONFIG_BRIDGE_EBT_T_FILTER=m
CONFIG_BRIDGE_EBT_T_NAT=m
CONFIG_BRIDGE_EBT_802_3=m
CONFIG_BRIDGE_EBT_AMONG=m
CONFIG_BRIDGE_EBT_ARP=m
CONFIG_BRIDGE_EBT_IP=m
CONFIG_BRIDGE_EBT_IP6=m
CONFIG_BRIDGE_EBT_LIMIT=m
CONFIG_BRIDGE_EBT_MARK=m
CONFIG_BRIDGE_EBT_PKTTYPE=m
CONFIG_BRIDGE_EBT_STP=m
CONFIG_BRIDGE_EBT_VLAN=m
CONFIG_BRIDGE_EBT_ARPREPLY=m
CONFIG_BRIDGE_EBT_DNAT=m
CONFIG_BRIDGE_EBT_MARK_T=m
CONFIG_BRIDGE_EBT_REDIRECT=m
CONFIG_BRIDGE_EBT_SNAT=m
CONFIG_BRIDGE_EBT_LOG=m
CONFIG_BRIDGE_EBT_NFLOG=m
# CONFIG_BPFILTER is not set
CONFIG_IP_DCCP=y
CONFIG_INET_DCCP_DIAG=m

#
# DCCP CCIDs Configuration
#
# CONFIG_IP_DCCP_CCID2_DEBUG is not set
CONFIG_IP_DCCP_CCID3=y
# CONFIG_IP_DCCP_CCID3_DEBUG is not set
CONFIG_IP_DCCP_TFRC_LIB=y
# end of DCCP CCIDs Configuration

#
# DCCP Kernel Hacking
#
# CONFIG_IP_DCCP_DEBUG is not set
# end of DCCP Kernel Hacking

CONFIG_IP_SCTP=m
# CONFIG_SCTP_DBG_OBJCNT is not set
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5 is not set
CONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA1=y
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_NONE is not set
CONFIG_SCTP_COOKIE_HMAC_MD5=y
CONFIG_SCTP_COOKIE_HMAC_SHA1=y
CONFIG_INET_SCTP_DIAG=m
# CONFIG_RDS is not set
# CONFIG_TIPC is not set
# CONFIG_ATM is not set
# CONFIG_L2TP is not set
CONFIG_STP=m
CONFIG_GARP=m
CONFIG_MRP=m
CONFIG_BRIDGE=m
CONFIG_BRIDGE_IGMP_SNOOPING=y
CONFIG_BRIDGE_VLAN_FILTERING=y
# CONFIG_BRIDGE_MRP is not set
# CONFIG_BRIDGE_CFM is not set
# CONFIG_NET_DSA is not set
CONFIG_VLAN_8021Q=m
CONFIG_VLAN_8021Q_GVRP=y
CONFIG_VLAN_8021Q_MVRP=y
CONFIG_LLC=m
# CONFIG_LLC2 is not set
# CONFIG_ATALK is not set
# CONFIG_X25 is not set
# CONFIG_LAPB is not set
# CONFIG_PHONET is not set
# CONFIG_6LOWPAN is not set
# CONFIG_IEEE802154 is not set
CONFIG_NET_SCHED=y

#
# Queueing/Scheduling
#
CONFIG_NET_SCH_HTB=m
CONFIG_NET_SCH_HFSC=m
CONFIG_NET_SCH_PRIO=m
CONFIG_NET_SCH_MULTIQ=m
CONFIG_NET_SCH_RED=m
CONFIG_NET_SCH_SFB=m
CONFIG_NET_SCH_SFQ=m
CONFIG_NET_SCH_TEQL=m
CONFIG_NET_SCH_TBF=m
# CONFIG_NET_SCH_CBS is not set
# CONFIG_NET_SCH_ETF is not set
CONFIG_NET_SCH_MQPRIO_LIB=m
# CONFIG_NET_SCH_TAPRIO is not set
CONFIG_NET_SCH_GRED=m
CONFIG_NET_SCH_NETEM=m
CONFIG_NET_SCH_DRR=m
CONFIG_NET_SCH_MQPRIO=m
# CONFIG_NET_SCH_SKBPRIO is not set
CONFIG_NET_SCH_CHOKE=m
CONFIG_NET_SCH_QFQ=m
CONFIG_NET_SCH_CODEL=m
CONFIG_NET_SCH_FQ_CODEL=y
# CONFIG_NET_SCH_CAKE is not set
CONFIG_NET_SCH_FQ=m
CONFIG_NET_SCH_HHF=m
CONFIG_NET_SCH_PIE=m
# CONFIG_NET_SCH_FQ_PIE is not set
CONFIG_NET_SCH_INGRESS=m
CONFIG_NET_SCH_PLUG=m
# CONFIG_NET_SCH_ETS is not set
CONFIG_NET_SCH_DEFAULT=y
# CONFIG_DEFAULT_FQ is not set
# CONFIG_DEFAULT_CODEL is not set
CONFIG_DEFAULT_FQ_CODEL=y
# CONFIG_DEFAULT_SFQ is not set
# CONFIG_DEFAULT_PFIFO_FAST is not set
CONFIG_DEFAULT_NET_SCH="fq_codel"

#
# Classification
#
CONFIG_NET_CLS=y
CONFIG_NET_CLS_BASIC=m
CONFIG_NET_CLS_ROUTE4=m
CONFIG_NET_CLS_FW=m
CONFIG_NET_CLS_U32=m
CONFIG_CLS_U32_PERF=y
CONFIG_CLS_U32_MARK=y
CONFIG_NET_CLS_FLOW=m
CONFIG_NET_CLS_CGROUP=y
CONFIG_NET_CLS_BPF=m
CONFIG_NET_CLS_FLOWER=m
CONFIG_NET_CLS_MATCHALL=m
CONFIG_NET_EMATCH=y
CONFIG_NET_EMATCH_STACK=32
CONFIG_NET_EMATCH_CMP=m
CONFIG_NET_EMATCH_NBYTE=m
CONFIG_NET_EMATCH_U32=m
CONFIG_NET_EMATCH_META=m
CONFIG_NET_EMATCH_TEXT=m
# CONFIG_NET_EMATCH_CANID is not set
# CONFIG_NET_EMATCH_IPT is not set
CONFIG_NET_CLS_ACT=y
CONFIG_NET_ACT_POLICE=m
CONFIG_NET_ACT_GACT=m
CONFIG_GACT_PROB=y
CONFIG_NET_ACT_MIRRED=m
CONFIG_NET_ACT_SAMPLE=m
# CONFIG_NET_ACT_IPT is not set
CONFIG_NET_ACT_NAT=m
CONFIG_NET_ACT_PEDIT=m
CONFIG_NET_ACT_SIMP=m
CONFIG_NET_ACT_SKBEDIT=m
CONFIG_NET_ACT_CSUM=m
# CONFIG_NET_ACT_MPLS is not set
CONFIG_NET_ACT_VLAN=m
CONFIG_NET_ACT_BPF=m
# CONFIG_NET_ACT_CONNMARK is not set
# CONFIG_NET_ACT_CTINFO is not set
CONFIG_NET_ACT_SKBMOD=m
# CONFIG_NET_ACT_IFE is not set
CONFIG_NET_ACT_TUNNEL_KEY=m
# CONFIG_NET_ACT_GATE is not set
# CONFIG_NET_TC_SKB_EXT is not set
CONFIG_NET_SCH_FIFO=y
CONFIG_DCB=y
CONFIG_DNS_RESOLVER=m
# CONFIG_BATMAN_ADV is not set
CONFIG_OPENVSWITCH=m
CONFIG_OPENVSWITCH_GRE=m
CONFIG_VSOCKETS=m
CONFIG_VSOCKETS_DIAG=m
CONFIG_VSOCKETS_LOOPBACK=m
CONFIG_VIRTIO_VSOCKETS=m
CONFIG_VIRTIO_VSOCKETS_COMMON=m
CONFIG_HYPERV_VSOCKETS=m
CONFIG_NETLINK_DIAG=m
CONFIG_MPLS=y
CONFIG_NET_MPLS_GSO=y
CONFIG_MPLS_ROUTING=m
CONFIG_MPLS_IPTUNNEL=m
CONFIG_NET_NSH=y
# CONFIG_HSR is not set
CONFIG_NET_SWITCHDEV=y
CONFIG_NET_L3_MASTER_DEV=y
# CONFIG_QRTR is not set
# CONFIG_NET_NCSI is not set
CONFIG_PCPU_DEV_REFCNT=y
CONFIG_MAX_SKB_FRAGS=17
CONFIG_RPS=y
CONFIG_RFS_ACCEL=y
CONFIG_SOCK_RX_QUEUE_MAPPING=y
CONFIG_XPS=y
CONFIG_CGROUP_NET_PRIO=y
CONFIG_CGROUP_NET_CLASSID=y
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y
CONFIG_BPF_STREAM_PARSER=y
CONFIG_NET_FLOW_LIMIT=y

#
# Network testing
#
CONFIG_NET_PKTGEN=m
CONFIG_NET_DROP_MONITOR=y
# end of Network testing
# end of Networking options

# CONFIG_HAMRADIO is not set
CONFIG_CAN=m
CONFIG_CAN_RAW=m
CONFIG_CAN_BCM=m
CONFIG_CAN_GW=m
# CONFIG_CAN_J1939 is not set
# CONFIG_CAN_ISOTP is not set
# CONFIG_BT is not set
# CONFIG_AF_RXRPC is not set
# CONFIG_AF_KCM is not set
CONFIG_STREAM_PARSER=y
# CONFIG_MCTP is not set
CONFIG_FIB_RULES=y
CONFIG_WIRELESS=y
CONFIG_CFG80211=m
# CONFIG_NL80211_TESTMODE is not set
# CONFIG_CFG80211_DEVELOPER_WARNINGS is not set
# CONFIG_CFG80211_CERTIFICATION_ONUS is not set
CONFIG_CFG80211_REQUIRE_SIGNED_REGDB=y
CONFIG_CFG80211_USE_KERNEL_REGDB_KEYS=y
CONFIG_CFG80211_DEFAULT_PS=y
# CONFIG_CFG80211_DEBUGFS is not set
CONFIG_CFG80211_CRDA_SUPPORT=y
# CONFIG_CFG80211_WEXT is not set
CONFIG_MAC80211=m
CONFIG_MAC80211_HAS_RC=y
CONFIG_MAC80211_RC_MINSTREL=y
CONFIG_MAC80211_RC_DEFAULT_MINSTREL=y
CONFIG_MAC80211_RC_DEFAULT="minstrel_ht"
# CONFIG_MAC80211_MESH is not set
CONFIG_MAC80211_LEDS=y
CONFIG_MAC80211_DEBUGFS=y
# CONFIG_MAC80211_MESSAGE_TRACING is not set
# CONFIG_MAC80211_DEBUG_MENU is not set
CONFIG_MAC80211_STA_HASH_MAX_SIZE=0
CONFIG_RFKILL=m
CONFIG_RFKILL_LEDS=y
CONFIG_RFKILL_INPUT=y
# CONFIG_RFKILL_GPIO is not set
CONFIG_NET_9P=y
CONFIG_NET_9P_FD=y
CONFIG_NET_9P_VIRTIO=y
# CONFIG_NET_9P_DEBUG is not set
# CONFIG_CAIF is not set
CONFIG_CEPH_LIB=m
# CONFIG_CEPH_LIB_PRETTYDEBUG is not set
CONFIG_CEPH_LIB_USE_DNS_RESOLVER=y
# CONFIG_NFC is not set
CONFIG_PSAMPLE=m
# CONFIG_NET_IFE is not set
CONFIG_LWTUNNEL=y
CONFIG_LWTUNNEL_BPF=y
CONFIG_DST_CACHE=y
CONFIG_GRO_CELLS=y
CONFIG_SOCK_VALIDATE_XMIT=y
CONFIG_NET_SELFTESTS=y
CONFIG_NET_SOCK_MSG=y
CONFIG_PAGE_POOL=y
# CONFIG_PAGE_POOL_STATS is not set
CONFIG_FAILOVER=m
CONFIG_ETHTOOL_NETLINK=y

#
# Device Drivers
#
CONFIG_HAVE_EISA=y
# CONFIG_EISA is not set
CONFIG_HAVE_PCI=y
CONFIG_PCI=y
CONFIG_PCI_DOMAINS=y
CONFIG_PCIEPORTBUS=y
CONFIG_HOTPLUG_PCI_PCIE=y
CONFIG_PCIEAER=y
CONFIG_PCIEAER_INJECT=m
CONFIG_PCIE_ECRC=y
CONFIG_PCIEASPM=y
CONFIG_PCIEASPM_DEFAULT=y
# CONFIG_PCIEASPM_POWERSAVE is not set
# CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
# CONFIG_PCIEASPM_PERFORMANCE is not set
CONFIG_PCIE_PME=y
CONFIG_PCIE_DPC=y
# CONFIG_PCIE_PTM is not set
# CONFIG_PCIE_EDR is not set
CONFIG_PCI_MSI=y
CONFIG_PCI_QUIRKS=y
# CONFIG_PCI_DEBUG is not set
# CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
CONFIG_PCI_STUB=y
CONFIG_PCI_PF_STUB=m
CONFIG_PCI_ATS=y
CONFIG_PCI_LOCKLESS_CONFIG=y
CONFIG_PCI_IOV=y
CONFIG_PCI_PRI=y
CONFIG_PCI_PASID=y
# CONFIG_PCI_P2PDMA is not set
CONFIG_PCI_LABEL=y
CONFIG_PCI_HYPERV=m
# CONFIG_PCIE_BUS_TUNE_OFF is not set
CONFIG_PCIE_BUS_DEFAULT=y
# CONFIG_PCIE_BUS_SAFE is not set
# CONFIG_PCIE_BUS_PERFORMANCE is not set
# CONFIG_PCIE_BUS_PEER2PEER is not set
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=64
CONFIG_HOTPLUG_PCI=y
CONFIG_HOTPLUG_PCI_ACPI=y
CONFIG_HOTPLUG_PCI_ACPI_IBM=m
# CONFIG_HOTPLUG_PCI_CPCI is not set
CONFIG_HOTPLUG_PCI_SHPC=y

#
# PCI controller drivers
#
CONFIG_VMD=y
CONFIG_PCI_HYPERV_INTERFACE=m

#
# Cadence-based PCIe controllers
#
# end of Cadence-based PCIe controllers

#
# DesignWare-based PCIe controllers
#
# CONFIG_PCI_MESON is not set
# CONFIG_PCIE_DW_PLAT_HOST is not set
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
# CONFIG_PCCARD is not set
# CONFIG_RAPIDIO is not set

#
# Generic Driver Options
#
CONFIG_AUXILIARY_BUS=y
# CONFIG_UEVENT_HELPER is not set
CONFIG_DEVTMPFS=y
CONFIG_DEVTMPFS_MOUNT=y
# CONFIG_DEVTMPFS_SAFE is not set
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
CONFIG_FW_CACHE=y
# CONFIG_FW_UPLOAD is not set
# end of Firmware loader

CONFIG_ALLOW_DEV_COREDUMP=y
# CONFIG_DEBUG_DRIVER is not set
# CONFIG_DEBUG_DEVRES is not set
# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
CONFIG_HMEM_REPORTING=y
# CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_GENERIC_CPU_VULNERABILITIES=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=m
CONFIG_REGMAP_SPI=m
CONFIG_DMA_SHARED_BUFFER=y
# CONFIG_DMA_FENCE_TRACE is not set
# CONFIG_FW_DEVLINK_SYNC_STATE_TIMEOUT is not set
# end of Generic Driver Options

#
# Bus devices
#
# CONFIG_MHI_BUS is not set
# CONFIG_MHI_BUS_EP is not set
# end of Bus devices

CONFIG_CONNECTOR=y
CONFIG_PROC_EVENTS=y

#
# Firmware Drivers
#

#
# ARM System Control and Management Interface Protocol
#
# end of ARM System Control and Management Interface Protocol

CONFIG_EDD=m
# CONFIG_EDD_OFF is not set
CONFIG_FIRMWARE_MEMMAP=y
CONFIG_DMIID=y
CONFIG_DMI_SYSFS=y
CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=y
# CONFIG_ISCSI_IBFT is not set
CONFIG_FW_CFG_SYSFS=y
# CONFIG_FW_CFG_SYSFS_CMDLINE is not set
CONFIG_SYSFB=y
# CONFIG_SYSFB_SIMPLEFB is not set
# CONFIG_GOOGLE_FIRMWARE is not set

#
# EFI (Extensible Firmware Interface) Support
#
CONFIG_EFI_ESRT=y
CONFIG_EFI_VARS_PSTORE=y
CONFIG_EFI_VARS_PSTORE_DEFAULT_DISABLE=y
CONFIG_EFI_SOFT_RESERVE=y
CONFIG_EFI_DXE_MEM_ATTRIBUTES=y
CONFIG_EFI_RUNTIME_WRAPPERS=y
# CONFIG_EFI_BOOTLOADER_CONTROL is not set
# CONFIG_EFI_CAPSULE_LOADER is not set
# CONFIG_EFI_TEST is not set
# CONFIG_APPLE_PROPERTIES is not set
# CONFIG_RESET_ATTACK_MITIGATION is not set
# CONFIG_EFI_RCI2_TABLE is not set
# CONFIG_EFI_DISABLE_PCI_DMA is not set
CONFIG_EFI_EARLYCON=y
CONFIG_EFI_CUSTOM_SSDT_OVERLAYS=y
# CONFIG_EFI_DISABLE_RUNTIME is not set
# CONFIG_EFI_COCO_SECRET is not set
# end of EFI (Extensible Firmware Interface) Support

CONFIG_UEFI_CPER=y
CONFIG_UEFI_CPER_X86=y

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

# CONFIG_GNSS is not set
# CONFIG_MTD is not set
# CONFIG_OF is not set
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
CONFIG_PARPORT=m
CONFIG_PARPORT_PC=m
CONFIG_PARPORT_SERIAL=m
# CONFIG_PARPORT_PC_FIFO is not set
# CONFIG_PARPORT_PC_SUPERIO is not set
CONFIG_PARPORT_1284=y
CONFIG_PNP=y
# CONFIG_PNP_DEBUG_MESSAGES is not set

#
# Protocols
#
CONFIG_PNPACPI=y
CONFIG_BLK_DEV=y
CONFIG_BLK_DEV_NULL_BLK=m
# CONFIG_BLK_DEV_FD is not set
CONFIG_CDROM=m
# CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
# CONFIG_ZRAM is not set
CONFIG_BLK_DEV_LOOP=m
CONFIG_BLK_DEV_LOOP_MIN_COUNT=0
# CONFIG_BLK_DEV_DRBD is not set
CONFIG_BLK_DEV_NBD=m
CONFIG_BLK_DEV_RAM=m
CONFIG_BLK_DEV_RAM_COUNT=16
CONFIG_BLK_DEV_RAM_SIZE=16384
CONFIG_CDROM_PKTCDVD=m
CONFIG_CDROM_PKTCDVD_BUFFERS=8
# CONFIG_CDROM_PKTCDVD_WCACHE is not set
# CONFIG_ATA_OVER_ETH is not set
CONFIG_VIRTIO_BLK=m
CONFIG_BLK_DEV_RBD=m
# CONFIG_BLK_DEV_UBLK is not set

#
# NVME Support
#
CONFIG_NVME_CORE=m
CONFIG_BLK_DEV_NVME=m
CONFIG_NVME_MULTIPATH=y
# CONFIG_NVME_VERBOSE_ERRORS is not set
# CONFIG_NVME_HWMON is not set
# CONFIG_NVME_FC is not set
# CONFIG_NVME_TCP is not set
# CONFIG_NVME_AUTH is not set
# CONFIG_NVME_TARGET is not set
# end of NVME Support

#
# Misc devices
#
# CONFIG_AD525X_DPOT is not set
# CONFIG_DUMMY_IRQ is not set
# CONFIG_IBM_ASM is not set
# CONFIG_PHANTOM is not set
CONFIG_TIFM_CORE=m
CONFIG_TIFM_7XX1=m
# CONFIG_ICS932S401 is not set
CONFIG_ENCLOSURE_SERVICES=m
# CONFIG_SGI_XP is not set
CONFIG_HP_ILO=m
# CONFIG_SGI_GRU is not set
CONFIG_APDS9802ALS=m
CONFIG_ISL29003=m
CONFIG_ISL29020=m
CONFIG_SENSORS_TSL2550=m
CONFIG_SENSORS_BH1770=m
CONFIG_SENSORS_APDS990X=m
# CONFIG_HMC6352 is not set
# CONFIG_DS1682 is not set
# CONFIG_LATTICE_ECP3_CONFIG is not set
# CONFIG_SRAM is not set
# CONFIG_DW_XDATA_PCIE is not set
# CONFIG_PCI_ENDPOINT_TEST is not set
# CONFIG_XILINX_SDFEC is not set
# CONFIG_C2PORT is not set

#
# EEPROM support
#
# CONFIG_EEPROM_AT24 is not set
# CONFIG_EEPROM_AT25 is not set
CONFIG_EEPROM_LEGACY=m
CONFIG_EEPROM_MAX6875=m
CONFIG_EEPROM_93CX6=m
# CONFIG_EEPROM_93XX46 is not set
# CONFIG_EEPROM_IDT_89HPESX is not set
# CONFIG_EEPROM_EE1004 is not set
# end of EEPROM support

# CONFIG_CB710_CORE is not set

#
# Texas Instruments shared transport line discipline
#
# CONFIG_TI_ST is not set
# end of Texas Instruments shared transport line discipline

# CONFIG_SENSORS_LIS3_I2C is not set
# CONFIG_ALTERA_STAPL is not set
CONFIG_INTEL_MEI=m
CONFIG_INTEL_MEI_ME=m
# CONFIG_INTEL_MEI_TXE is not set
# CONFIG_INTEL_MEI_GSC is not set
# CONFIG_INTEL_MEI_HDCP is not set
# CONFIG_INTEL_MEI_PXP is not set
# CONFIG_INTEL_MEI_GSC_PROXY is not set
# CONFIG_VMWARE_VMCI is not set
# CONFIG_GENWQE is not set
# CONFIG_ECHO is not set
# CONFIG_BCM_VK is not set
# CONFIG_MISC_ALCOR_PCI is not set
# CONFIG_MISC_RTSX_PCI is not set
# CONFIG_MISC_RTSX_USB is not set
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
CONFIG_RAID_ATTRS=m
CONFIG_SCSI_COMMON=y
CONFIG_SCSI=y
CONFIG_SCSI_DMA=y
CONFIG_SCSI_NETLINK=y
CONFIG_SCSI_PROC_FS=y

#
# SCSI support type (disk, tape, CD-ROM)
#
CONFIG_BLK_DEV_SD=m
CONFIG_CHR_DEV_ST=m
CONFIG_BLK_DEV_SR=m
CONFIG_CHR_DEV_SG=m
CONFIG_BLK_DEV_BSG=y
CONFIG_CHR_DEV_SCH=m
CONFIG_SCSI_ENCLOSURE=m
CONFIG_SCSI_CONSTANTS=y
CONFIG_SCSI_LOGGING=y
CONFIG_SCSI_SCAN_ASYNC=y

#
# SCSI Transports
#
CONFIG_SCSI_SPI_ATTRS=m
CONFIG_SCSI_FC_ATTRS=m
CONFIG_SCSI_ISCSI_ATTRS=m
CONFIG_SCSI_SAS_ATTRS=m
CONFIG_SCSI_SAS_LIBSAS=m
CONFIG_SCSI_SAS_ATA=y
CONFIG_SCSI_SAS_HOST_SMP=y
CONFIG_SCSI_SRP_ATTRS=m
# end of SCSI Transports

CONFIG_SCSI_LOWLEVEL=y
# CONFIG_ISCSI_TCP is not set
# CONFIG_ISCSI_BOOT_SYSFS is not set
# CONFIG_SCSI_CXGB3_ISCSI is not set
# CONFIG_SCSI_CXGB4_ISCSI is not set
# CONFIG_SCSI_BNX2_ISCSI is not set
# CONFIG_BE2ISCSI is not set
# CONFIG_BLK_DEV_3W_XXXX_RAID is not set
# CONFIG_SCSI_HPSA is not set
# CONFIG_SCSI_3W_9XXX is not set
# CONFIG_SCSI_3W_SAS is not set
# CONFIG_SCSI_ACARD is not set
# CONFIG_SCSI_AACRAID is not set
# CONFIG_SCSI_AIC7XXX is not set
# CONFIG_SCSI_AIC79XX is not set
# CONFIG_SCSI_AIC94XX is not set
# CONFIG_SCSI_MVSAS is not set
# CONFIG_SCSI_MVUMI is not set
# CONFIG_SCSI_ADVANSYS is not set
# CONFIG_SCSI_ARCMSR is not set
# CONFIG_SCSI_ESAS2R is not set
CONFIG_MEGARAID_NEWGEN=y
CONFIG_MEGARAID_MM=m
CONFIG_MEGARAID_MAILBOX=m
CONFIG_MEGARAID_LEGACY=m
CONFIG_MEGARAID_SAS=m
CONFIG_SCSI_MPT3SAS=m
CONFIG_SCSI_MPT2SAS_MAX_SGE=128
CONFIG_SCSI_MPT3SAS_MAX_SGE=128
# CONFIG_SCSI_MPT2SAS is not set
# CONFIG_SCSI_MPI3MR is not set
# CONFIG_SCSI_SMARTPQI is not set
# CONFIG_SCSI_HPTIOP is not set
# CONFIG_SCSI_BUSLOGIC is not set
# CONFIG_SCSI_MYRB is not set
# CONFIG_SCSI_MYRS is not set
# CONFIG_VMWARE_PVSCSI is not set
CONFIG_HYPERV_STORAGE=m
# CONFIG_LIBFC is not set
# CONFIG_SCSI_SNIC is not set
# CONFIG_SCSI_DMX3191D is not set
# CONFIG_SCSI_FDOMAIN_PCI is not set
CONFIG_SCSI_ISCI=m
# CONFIG_SCSI_IPS is not set
# CONFIG_SCSI_INITIO is not set
# CONFIG_SCSI_INIA100 is not set
# CONFIG_SCSI_PPA is not set
# CONFIG_SCSI_IMM is not set
# CONFIG_SCSI_STEX is not set
# CONFIG_SCSI_SYM53C8XX_2 is not set
# CONFIG_SCSI_IPR is not set
# CONFIG_SCSI_QLOGIC_1280 is not set
# CONFIG_SCSI_QLA_FC is not set
# CONFIG_SCSI_QLA_ISCSI is not set
# CONFIG_SCSI_LPFC is not set
# CONFIG_SCSI_DC395x is not set
# CONFIG_SCSI_AM53C974 is not set
# CONFIG_SCSI_WD719X is not set
# CONFIG_SCSI_DEBUG is not set
# CONFIG_SCSI_PMCRAID is not set
# CONFIG_SCSI_PM8001 is not set
# CONFIG_SCSI_BFA_FC is not set
# CONFIG_SCSI_VIRTIO is not set
# CONFIG_SCSI_CHELSIO_FCOE is not set
CONFIG_SCSI_DH=y
CONFIG_SCSI_DH_RDAC=y
CONFIG_SCSI_DH_HP_SW=y
CONFIG_SCSI_DH_EMC=y
CONFIG_SCSI_DH_ALUA=y
# end of SCSI device support

CONFIG_ATA=m
CONFIG_SATA_HOST=y
CONFIG_PATA_TIMINGS=y
CONFIG_ATA_VERBOSE_ERROR=y
CONFIG_ATA_FORCE=y
CONFIG_ATA_ACPI=y
# CONFIG_SATA_ZPODD is not set
CONFIG_SATA_PMP=y

#
# Controllers with non-SFF native interface
#
CONFIG_SATA_AHCI=m
CONFIG_SATA_MOBILE_LPM_POLICY=0
CONFIG_SATA_AHCI_PLATFORM=m
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
CONFIG_ATA_PIIX=m
# CONFIG_SATA_DWC is not set
# CONFIG_SATA_MV is not set
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
# CONFIG_PATA_MPIIX is not set
# CONFIG_PATA_NS87410 is not set
# CONFIG_PATA_OPTI is not set
# CONFIG_PATA_RZ1000 is not set
# CONFIG_PATA_PARPORT is not set

#
# Generic fallback / legacy drivers
#
# CONFIG_PATA_ACPI is not set
CONFIG_ATA_GENERIC=m
# CONFIG_PATA_LEGACY is not set
CONFIG_MD=y
CONFIG_BLK_DEV_MD=y
CONFIG_MD_AUTODETECT=y
CONFIG_MD_LINEAR=m
CONFIG_MD_RAID0=m
CONFIG_MD_RAID1=m
CONFIG_MD_RAID10=m
CONFIG_MD_RAID456=m
# CONFIG_MD_MULTIPATH is not set
CONFIG_MD_FAULTY=m
# CONFIG_BCACHE is not set
CONFIG_BLK_DEV_DM_BUILTIN=y
CONFIG_BLK_DEV_DM=m
# CONFIG_DM_DEBUG is not set
CONFIG_DM_BUFIO=m
# CONFIG_DM_DEBUG_BLOCK_MANAGER_LOCKING is not set
CONFIG_DM_BIO_PRISON=m
CONFIG_DM_PERSISTENT_DATA=m
# CONFIG_DM_UNSTRIPED is not set
CONFIG_DM_CRYPT=m
CONFIG_DM_SNAPSHOT=m
CONFIG_DM_THIN_PROVISIONING=m
CONFIG_DM_CACHE=m
CONFIG_DM_CACHE_SMQ=m
CONFIG_DM_WRITECACHE=m
# CONFIG_DM_EBS is not set
CONFIG_DM_ERA=m
# CONFIG_DM_CLONE is not set
CONFIG_DM_MIRROR=m
CONFIG_DM_LOG_USERSPACE=m
CONFIG_DM_RAID=m
CONFIG_DM_ZERO=m
CONFIG_DM_MULTIPATH=m
CONFIG_DM_MULTIPATH_QL=m
CONFIG_DM_MULTIPATH_ST=m
# CONFIG_DM_MULTIPATH_HST is not set
# CONFIG_DM_MULTIPATH_IOA is not set
CONFIG_DM_DELAY=m
# CONFIG_DM_DUST is not set
CONFIG_DM_UEVENT=y
CONFIG_DM_FLAKEY=m
CONFIG_DM_VERITY=m
# CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG is not set
# CONFIG_DM_VERITY_FEC is not set
CONFIG_DM_SWITCH=m
CONFIG_DM_LOG_WRITES=m
CONFIG_DM_INTEGRITY=m
CONFIG_DM_AUDIT=y
# CONFIG_TARGET_CORE is not set
# CONFIG_FUSION is not set

#
# IEEE 1394 (FireWire) support
#
CONFIG_FIREWIRE=m
CONFIG_FIREWIRE_OHCI=m
CONFIG_FIREWIRE_SBP2=m
CONFIG_FIREWIRE_NET=m
# CONFIG_FIREWIRE_NOSY is not set
# end of IEEE 1394 (FireWire) support

CONFIG_MACINTOSH_DRIVERS=y
CONFIG_MAC_EMUMOUSEBTN=y
CONFIG_NETDEVICES=y
CONFIG_MII=y
CONFIG_NET_CORE=y
# CONFIG_BONDING is not set
# CONFIG_DUMMY is not set
# CONFIG_WIREGUARD is not set
# CONFIG_EQUALIZER is not set
# CONFIG_NET_FC is not set
# CONFIG_IFB is not set
# CONFIG_NET_TEAM is not set
# CONFIG_MACVLAN is not set
# CONFIG_IPVLAN is not set
# CONFIG_VXLAN is not set
# CONFIG_GENEVE is not set
# CONFIG_BAREUDP is not set
# CONFIG_GTP is not set
# CONFIG_AMT is not set
# CONFIG_MACSEC is not set
CONFIG_NETCONSOLE=m
CONFIG_NETCONSOLE_DYNAMIC=y
CONFIG_NETPOLL=y
CONFIG_NET_POLL_CONTROLLER=y
CONFIG_TUN=m
# CONFIG_TUN_VNET_CROSS_LE is not set
# CONFIG_VETH is not set
CONFIG_VIRTIO_NET=m
# CONFIG_NLMON is not set
# CONFIG_NET_VRF is not set
# CONFIG_VSOCKMON is not set
# CONFIG_ARCNET is not set
CONFIG_ETHERNET=y
CONFIG_MDIO=y
# CONFIG_NET_VENDOR_3COM is not set
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
# CONFIG_ENA_ETHERNET is not set
# CONFIG_NET_VENDOR_AMD is not set
CONFIG_NET_VENDOR_AQUANTIA=y
# CONFIG_AQTION is not set
CONFIG_NET_VENDOR_ARC=y
CONFIG_NET_VENDOR_ASIX=y
# CONFIG_SPI_AX88796C is not set
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
# CONFIG_THUNDER_NIC_PF is not set
# CONFIG_THUNDER_NIC_VF is not set
# CONFIG_THUNDER_NIC_BGX is not set
# CONFIG_THUNDER_NIC_RGX is not set
CONFIG_CAVIUM_PTP=y
# CONFIG_LIQUIDIO is not set
# CONFIG_LIQUIDIO_VF is not set
CONFIG_NET_VENDOR_CHELSIO=y
# CONFIG_CHELSIO_T1 is not set
# CONFIG_CHELSIO_T3 is not set
# CONFIG_CHELSIO_T4 is not set
# CONFIG_CHELSIO_T4VF is not set
CONFIG_NET_VENDOR_CISCO=y
# CONFIG_ENIC is not set
CONFIG_NET_VENDOR_CORTINA=y
CONFIG_NET_VENDOR_DAVICOM=y
# CONFIG_DM9051 is not set
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
CONFIG_NET_VENDOR_FUNGIBLE=y
# CONFIG_FUN_ETH is not set
CONFIG_NET_VENDOR_GOOGLE=y
# CONFIG_GVE is not set
CONFIG_NET_VENDOR_HUAWEI=y
# CONFIG_HINIC is not set
CONFIG_NET_VENDOR_I825XX=y
CONFIG_NET_VENDOR_INTEL=y
# CONFIG_E100 is not set
CONFIG_E1000=y
CONFIG_E1000E=y
CONFIG_E1000E_HWTS=y
CONFIG_IGB=y
CONFIG_IGB_HWMON=y
# CONFIG_IGBVF is not set
CONFIG_IXGBE=y
CONFIG_IXGBE_HWMON=y
# CONFIG_IXGBE_DCB is not set
# CONFIG_IXGBE_IPSEC is not set
# CONFIG_IXGBEVF is not set
CONFIG_I40E=y
# CONFIG_I40E_DCB is not set
# CONFIG_I40EVF is not set
# CONFIG_ICE is not set
# CONFIG_FM10K is not set
CONFIG_IGC=y
# CONFIG_JME is not set
CONFIG_NET_VENDOR_ADI=y
# CONFIG_ADIN1110 is not set
CONFIG_NET_VENDOR_LITEX=y
CONFIG_NET_VENDOR_MARVELL=y
# CONFIG_MVMDIO is not set
# CONFIG_SKGE is not set
# CONFIG_SKY2 is not set
# CONFIG_OCTEON_EP is not set
# CONFIG_PRESTERA is not set
CONFIG_NET_VENDOR_MELLANOX=y
# CONFIG_MLX4_EN is not set
# CONFIG_MLX5_CORE is not set
# CONFIG_MLXSW_CORE is not set
# CONFIG_MLXFW is not set
CONFIG_NET_VENDOR_MICREL=y
# CONFIG_KS8842 is not set
# CONFIG_KS8851 is not set
# CONFIG_KS8851_MLL is not set
# CONFIG_KSZ884X_PCI is not set
CONFIG_NET_VENDOR_MICROCHIP=y
# CONFIG_ENC28J60 is not set
# CONFIG_ENCX24J600 is not set
# CONFIG_LAN743X is not set
# CONFIG_VCAP is not set
CONFIG_NET_VENDOR_MICROSEMI=y
CONFIG_NET_VENDOR_MICROSOFT=y
# CONFIG_MICROSOFT_MANA is not set
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
# CONFIG_NFP is not set
CONFIG_NET_VENDOR_8390=y
# CONFIG_NE2K_PCI is not set
CONFIG_NET_VENDOR_NVIDIA=y
# CONFIG_FORCEDETH is not set
CONFIG_NET_VENDOR_OKI=y
# CONFIG_ETHOC is not set
CONFIG_NET_VENDOR_PACKET_ENGINES=y
# CONFIG_HAMACHI is not set
# CONFIG_YELLOWFIN is not set
CONFIG_NET_VENDOR_PENSANDO=y
# CONFIG_IONIC is not set
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
CONFIG_R8169=y
CONFIG_NET_VENDOR_RENESAS=y
CONFIG_NET_VENDOR_ROCKER=y
# CONFIG_ROCKER is not set
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
# CONFIG_MSE102X is not set
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
# CONFIG_FDDI is not set
# CONFIG_HIPPI is not set
# CONFIG_NET_SB1000 is not set
CONFIG_PHYLINK=y
CONFIG_PHYLIB=y
CONFIG_SWPHY=y
# CONFIG_LED_TRIGGER_PHY is not set
CONFIG_FIXED_PHY=y
# CONFIG_SFP is not set

#
# MII PHY device drivers
#
# CONFIG_AMD_PHY is not set
# CONFIG_ADIN_PHY is not set
# CONFIG_ADIN1100_PHY is not set
# CONFIG_AQUANTIA_PHY is not set
CONFIG_AX88796B_PHY=y
# CONFIG_BROADCOM_PHY is not set
# CONFIG_BCM54140_PHY is not set
# CONFIG_BCM7XXX_PHY is not set
# CONFIG_BCM84881_PHY is not set
# CONFIG_BCM87XX_PHY is not set
# CONFIG_CICADA_PHY is not set
# CONFIG_CORTINA_PHY is not set
# CONFIG_DAVICOM_PHY is not set
# CONFIG_ICPLUS_PHY is not set
# CONFIG_LXT_PHY is not set
# CONFIG_INTEL_XWAY_PHY is not set
# CONFIG_LSI_ET1011C_PHY is not set
# CONFIG_MARVELL_PHY is not set
# CONFIG_MARVELL_10G_PHY is not set
# CONFIG_MARVELL_88X2222_PHY is not set
# CONFIG_MAXLINEAR_GPHY is not set
# CONFIG_MEDIATEK_GE_PHY is not set
# CONFIG_MICREL_PHY is not set
# CONFIG_MICROCHIP_T1S_PHY is not set
# CONFIG_MICROCHIP_PHY is not set
# CONFIG_MICROCHIP_T1_PHY is not set
# CONFIG_MICROSEMI_PHY is not set
# CONFIG_MOTORCOMM_PHY is not set
# CONFIG_NATIONAL_PHY is not set
# CONFIG_NXP_CBTX_PHY is not set
# CONFIG_NXP_C45_TJA11XX_PHY is not set
# CONFIG_NXP_TJA11XX_PHY is not set
# CONFIG_NCN26000_PHY is not set
# CONFIG_QSEMI_PHY is not set
CONFIG_REALTEK_PHY=y
# CONFIG_RENESAS_PHY is not set
# CONFIG_ROCKCHIP_PHY is not set
# CONFIG_SMSC_PHY is not set
# CONFIG_STE10XP is not set
# CONFIG_TERANETICS_PHY is not set
# CONFIG_DP83822_PHY is not set
# CONFIG_DP83TC811_PHY is not set
# CONFIG_DP83848_PHY is not set
# CONFIG_DP83867_PHY is not set
# CONFIG_DP83869_PHY is not set
# CONFIG_DP83TD510_PHY is not set
# CONFIG_VITESSE_PHY is not set
# CONFIG_XILINX_GMII2RGMII is not set
# CONFIG_MICREL_KS8995MA is not set
# CONFIG_PSE_CONTROLLER is not set
# CONFIG_CAN_DEV is not set
CONFIG_MDIO_DEVICE=y
CONFIG_MDIO_BUS=y
CONFIG_FWNODE_MDIO=y
CONFIG_ACPI_MDIO=y
CONFIG_MDIO_DEVRES=y
# CONFIG_MDIO_BITBANG is not set
# CONFIG_MDIO_BCM_UNIMAC is not set
# CONFIG_MDIO_MVUSB is not set
# CONFIG_MDIO_THUNDER is not set

#
# MDIO Multiplexers
#

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
CONFIG_USB_RTL8152=y
# CONFIG_USB_LAN78XX is not set
CONFIG_USB_USBNET=y
CONFIG_USB_NET_AX8817X=y
CONFIG_USB_NET_AX88179_178A=y
# CONFIG_USB_NET_CDCETHER is not set
# CONFIG_USB_NET_CDC_EEM is not set
# CONFIG_USB_NET_CDC_NCM is not set
# CONFIG_USB_NET_HUAWEI_CDC_NCM is not set
# CONFIG_USB_NET_CDC_MBIM is not set
# CONFIG_USB_NET_DM9601 is not set
# CONFIG_USB_NET_SR9700 is not set
# CONFIG_USB_NET_SR9800 is not set
# CONFIG_USB_NET_SMSC75XX is not set
# CONFIG_USB_NET_SMSC95XX is not set
# CONFIG_USB_NET_GL620A is not set
# CONFIG_USB_NET_NET1080 is not set
# CONFIG_USB_NET_PLUSB is not set
# CONFIG_USB_NET_MCS7830 is not set
# CONFIG_USB_NET_RNDIS_HOST is not set
# CONFIG_USB_NET_CDC_SUBSET is not set
# CONFIG_USB_NET_ZAURUS is not set
# CONFIG_USB_NET_CX82310_ETH is not set
# CONFIG_USB_NET_KALMIA is not set
# CONFIG_USB_NET_QMI_WWAN is not set
# CONFIG_USB_HSO is not set
# CONFIG_USB_NET_INT51X1 is not set
# CONFIG_USB_IPHETH is not set
# CONFIG_USB_SIERRA_NET is not set
# CONFIG_USB_NET_CH9200 is not set
# CONFIG_USB_NET_AQC111 is not set
# CONFIG_WLAN is not set
# CONFIG_WAN is not set

#
# Wireless WAN
#
# CONFIG_WWAN is not set
# end of Wireless WAN

# CONFIG_VMXNET3 is not set
# CONFIG_FUJITSU_ES is not set
CONFIG_HYPERV_NET=y
# CONFIG_NETDEVSIM is not set
CONFIG_NET_FAILOVER=m
# CONFIG_ISDN is not set

#
# Input device support
#
CONFIG_INPUT=y
CONFIG_INPUT_LEDS=y
CONFIG_INPUT_FF_MEMLESS=m
CONFIG_INPUT_SPARSEKMAP=m
# CONFIG_INPUT_MATRIXKMAP is not set
CONFIG_INPUT_VIVALDIFMAP=y

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=y
# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
CONFIG_INPUT_JOYDEV=m
CONFIG_INPUT_EVDEV=y
# CONFIG_INPUT_EVBUG is not set

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
# CONFIG_KEYBOARD_ADP5588 is not set
# CONFIG_KEYBOARD_ADP5589 is not set
# CONFIG_KEYBOARD_APPLESPI is not set
CONFIG_KEYBOARD_ATKBD=y
# CONFIG_KEYBOARD_QT1050 is not set
# CONFIG_KEYBOARD_QT1070 is not set
# CONFIG_KEYBOARD_QT2160 is not set
# CONFIG_KEYBOARD_DLINK_DIR685 is not set
# CONFIG_KEYBOARD_LKKBD is not set
# CONFIG_KEYBOARD_GPIO is not set
# CONFIG_KEYBOARD_GPIO_POLLED is not set
# CONFIG_KEYBOARD_TCA6416 is not set
# CONFIG_KEYBOARD_TCA8418 is not set
# CONFIG_KEYBOARD_MATRIX is not set
# CONFIG_KEYBOARD_LM8323 is not set
# CONFIG_KEYBOARD_LM8333 is not set
# CONFIG_KEYBOARD_MAX7359 is not set
# CONFIG_KEYBOARD_MCS is not set
# CONFIG_KEYBOARD_MPR121 is not set
# CONFIG_KEYBOARD_NEWTON is not set
# CONFIG_KEYBOARD_OPENCORES is not set
# CONFIG_KEYBOARD_SAMSUNG is not set
# CONFIG_KEYBOARD_STOWAWAY is not set
# CONFIG_KEYBOARD_SUNKBD is not set
# CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
# CONFIG_KEYBOARD_XTKBD is not set
# CONFIG_KEYBOARD_CYPRESS_SF is not set
CONFIG_INPUT_MOUSE=y
CONFIG_MOUSE_PS2=y
CONFIG_MOUSE_PS2_ALPS=y
CONFIG_MOUSE_PS2_BYD=y
CONFIG_MOUSE_PS2_LOGIPS2PP=y
CONFIG_MOUSE_PS2_SYNAPTICS=y
CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS=y
CONFIG_MOUSE_PS2_CYPRESS=y
CONFIG_MOUSE_PS2_LIFEBOOK=y
CONFIG_MOUSE_PS2_TRACKPOINT=y
CONFIG_MOUSE_PS2_ELANTECH=y
CONFIG_MOUSE_PS2_ELANTECH_SMBUS=y
CONFIG_MOUSE_PS2_SENTELIC=y
# CONFIG_MOUSE_PS2_TOUCHKIT is not set
CONFIG_MOUSE_PS2_FOCALTECH=y
CONFIG_MOUSE_PS2_VMMOUSE=y
CONFIG_MOUSE_PS2_SMBUS=y
CONFIG_MOUSE_SERIAL=m
# CONFIG_MOUSE_APPLETOUCH is not set
# CONFIG_MOUSE_BCM5974 is not set
CONFIG_MOUSE_CYAPA=m
CONFIG_MOUSE_ELAN_I2C=m
CONFIG_MOUSE_ELAN_I2C_I2C=y
CONFIG_MOUSE_ELAN_I2C_SMBUS=y
CONFIG_MOUSE_VSXXXAA=m
# CONFIG_MOUSE_GPIO is not set
CONFIG_MOUSE_SYNAPTICS_I2C=m
# CONFIG_MOUSE_SYNAPTICS_USB is not set
# CONFIG_INPUT_JOYSTICK is not set
# CONFIG_INPUT_TABLET is not set
# CONFIG_INPUT_TOUCHSCREEN is not set
# CONFIG_INPUT_MISC is not set
CONFIG_RMI4_CORE=m
CONFIG_RMI4_I2C=m
CONFIG_RMI4_SPI=m
CONFIG_RMI4_SMB=m
CONFIG_RMI4_F03=y
CONFIG_RMI4_F03_SERIO=m
CONFIG_RMI4_2D_SENSOR=y
CONFIG_RMI4_F11=y
CONFIG_RMI4_F12=y
CONFIG_RMI4_F30=y
CONFIG_RMI4_F34=y
# CONFIG_RMI4_F3A is not set
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
CONFIG_SERIO_RAW=m
CONFIG_SERIO_ALTERA_PS2=m
# CONFIG_SERIO_PS2MULT is not set
CONFIG_SERIO_ARC_PS2=m
CONFIG_HYPERV_KEYBOARD=m
# CONFIG_SERIO_GPIO_PS2 is not set
# CONFIG_USERIO is not set
# CONFIG_GAMEPORT is not set
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=y
CONFIG_VT=y
CONFIG_CONSOLE_TRANSLATIONS=y
CONFIG_VT_CONSOLE=y
CONFIG_VT_CONSOLE_SLEEP=y
CONFIG_HW_CONSOLE=y
CONFIG_VT_HW_CONSOLE_BINDING=y
CONFIG_UNIX98_PTYS=y
# CONFIG_LEGACY_PTYS is not set
CONFIG_LEGACY_TIOCSTI=y
CONFIG_LDISC_AUTOLOAD=y

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=y
# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
CONFIG_SERIAL_8250_PNP=y
# CONFIG_SERIAL_8250_16550A_VARIANTS is not set
# CONFIG_SERIAL_8250_FINTEK is not set
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_8250_DMA=y
CONFIG_SERIAL_8250_PCILIB=y
CONFIG_SERIAL_8250_PCI=y
CONFIG_SERIAL_8250_EXAR=y
CONFIG_SERIAL_8250_NR_UARTS=64
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
CONFIG_SERIAL_8250_EXTENDED=y
CONFIG_SERIAL_8250_MANY_PORTS=y
# CONFIG_SERIAL_8250_PCI1XXXX is not set
CONFIG_SERIAL_8250_SHARE_IRQ=y
# CONFIG_SERIAL_8250_DETECT_IRQ is not set
CONFIG_SERIAL_8250_RSA=y
CONFIG_SERIAL_8250_DWLIB=y
CONFIG_SERIAL_8250_DW=y
# CONFIG_SERIAL_8250_RT288X is not set
CONFIG_SERIAL_8250_LPSS=y
CONFIG_SERIAL_8250_MID=y
CONFIG_SERIAL_8250_PERICOM=y

#
# Non-8250 serial port support
#
# CONFIG_SERIAL_MAX3100 is not set
# CONFIG_SERIAL_MAX310X is not set
# CONFIG_SERIAL_UARTLITE is not set
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
# CONFIG_SERIAL_JSM is not set
# CONFIG_SERIAL_LANTIQ is not set
# CONFIG_SERIAL_SCCNXP is not set
# CONFIG_SERIAL_SC16IS7XX is not set
# CONFIG_SERIAL_ALTERA_JTAGUART is not set
# CONFIG_SERIAL_ALTERA_UART is not set
CONFIG_SERIAL_ARC=m
CONFIG_SERIAL_ARC_NR_PORTS=1
# CONFIG_SERIAL_RP2 is not set
# CONFIG_SERIAL_FSL_LPUART is not set
# CONFIG_SERIAL_FSL_LINFLEXUART is not set
# CONFIG_SERIAL_SPRD is not set
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
CONFIG_SERIAL_NONSTANDARD=y
# CONFIG_MOXA_INTELLIO is not set
# CONFIG_MOXA_SMARTIO is not set
CONFIG_SYNCLINK_GT=m
CONFIG_N_HDLC=m
CONFIG_N_GSM=m
CONFIG_NOZOMI=m
# CONFIG_NULL_TTY is not set
CONFIG_HVC_DRIVER=y
# CONFIG_SERIAL_DEV_BUS is not set
# CONFIG_TTY_PRINTK is not set
CONFIG_PRINTER=m
# CONFIG_LP_CONSOLE is not set
CONFIG_PPDEV=m
CONFIG_VIRTIO_CONSOLE=m
CONFIG_IPMI_HANDLER=m
CONFIG_IPMI_DMI_DECODE=y
CONFIG_IPMI_PLAT_DATA=y
CONFIG_IPMI_PANIC_EVENT=y
CONFIG_IPMI_PANIC_STRING=y
CONFIG_IPMI_DEVICE_INTERFACE=m
CONFIG_IPMI_SI=m
CONFIG_IPMI_SSIF=m
CONFIG_IPMI_WATCHDOG=m
CONFIG_IPMI_POWEROFF=m
CONFIG_HW_RANDOM=y
CONFIG_HW_RANDOM_TIMERIOMEM=m
CONFIG_HW_RANDOM_INTEL=m
# CONFIG_HW_RANDOM_AMD is not set
# CONFIG_HW_RANDOM_BA431 is not set
CONFIG_HW_RANDOM_VIA=m
CONFIG_HW_RANDOM_VIRTIO=y
# CONFIG_HW_RANDOM_XIPHERA is not set
# CONFIG_APPLICOM is not set
# CONFIG_MWAVE is not set
CONFIG_DEVMEM=y
CONFIG_NVRAM=y
CONFIG_DEVPORT=y
CONFIG_HPET=y
CONFIG_HPET_MMAP=y
# CONFIG_HPET_MMAP_DEFAULT is not set
CONFIG_HANGCHECK_TIMER=m
CONFIG_UV_MMTIMER=m
CONFIG_TCG_TPM=y
CONFIG_HW_RANDOM_TPM=y
CONFIG_TCG_TIS_CORE=y
CONFIG_TCG_TIS=y
# CONFIG_TCG_TIS_SPI is not set
# CONFIG_TCG_TIS_I2C is not set
# CONFIG_TCG_TIS_I2C_CR50 is not set
CONFIG_TCG_TIS_I2C_ATMEL=m
CONFIG_TCG_TIS_I2C_INFINEON=m
CONFIG_TCG_TIS_I2C_NUVOTON=m
CONFIG_TCG_NSC=m
CONFIG_TCG_ATMEL=m
CONFIG_TCG_INFINEON=m
CONFIG_TCG_CRB=y
# CONFIG_TCG_VTPM_PROXY is not set
# CONFIG_TCG_TIS_ST33ZP24_I2C is not set
# CONFIG_TCG_TIS_ST33ZP24_SPI is not set
CONFIG_TELCLOCK=m
# CONFIG_XILLYBUS is not set
# CONFIG_XILLYUSB is not set
# end of Character devices

#
# I2C support
#
CONFIG_I2C=y
CONFIG_ACPI_I2C_OPREGION=y
CONFIG_I2C_BOARDINFO=y
CONFIG_I2C_COMPAT=y
CONFIG_I2C_CHARDEV=m
CONFIG_I2C_MUX=m

#
# Multiplexer I2C Chip support
#
# CONFIG_I2C_MUX_GPIO is not set
# CONFIG_I2C_MUX_LTC4306 is not set
# CONFIG_I2C_MUX_PCA9541 is not set
# CONFIG_I2C_MUX_PCA954x is not set
# CONFIG_I2C_MUX_REG is not set
CONFIG_I2C_MUX_MLXCPLD=m
# end of Multiplexer I2C Chip support

CONFIG_I2C_HELPER_AUTO=y
CONFIG_I2C_SMBUS=m
CONFIG_I2C_ALGOBIT=y
CONFIG_I2C_ALGOPCA=m

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
CONFIG_I2C_I801=m
CONFIG_I2C_ISCH=m
CONFIG_I2C_ISMT=m
CONFIG_I2C_PIIX4=m
CONFIG_I2C_NFORCE2=m
CONFIG_I2C_NFORCE2_S4985=m
# CONFIG_I2C_NVIDIA_GPU is not set
# CONFIG_I2C_SIS5595 is not set
# CONFIG_I2C_SIS630 is not set
CONFIG_I2C_SIS96X=m
CONFIG_I2C_VIA=m
CONFIG_I2C_VIAPRO=m

#
# ACPI drivers
#
CONFIG_I2C_SCMI=m

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
# CONFIG_I2C_CBUS_GPIO is not set
CONFIG_I2C_DESIGNWARE_CORE=m
# CONFIG_I2C_DESIGNWARE_SLAVE is not set
CONFIG_I2C_DESIGNWARE_PLATFORM=m
CONFIG_I2C_DESIGNWARE_BAYTRAIL=y
# CONFIG_I2C_DESIGNWARE_PCI is not set
# CONFIG_I2C_EMEV2 is not set
# CONFIG_I2C_GPIO is not set
# CONFIG_I2C_OCORES is not set
CONFIG_I2C_PCA_PLATFORM=m
CONFIG_I2C_SIMTEC=m
# CONFIG_I2C_XILINX is not set

#
# External I2C/SMBus adapter drivers
#
# CONFIG_I2C_DIOLAN_U2C is not set
# CONFIG_I2C_CP2615 is not set
CONFIG_I2C_PARPORT=m
# CONFIG_I2C_PCI1XXXX is not set
# CONFIG_I2C_ROBOTFUZZ_OSIF is not set
# CONFIG_I2C_TAOS_EVM is not set
# CONFIG_I2C_TINY_USB is not set

#
# Other I2C/SMBus bus drivers
#
CONFIG_I2C_MLXCPLD=m
# CONFIG_I2C_VIRTIO is not set
# end of I2C Hardware Bus support

CONFIG_I2C_STUB=m
# CONFIG_I2C_SLAVE is not set
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
# end of I2C support

# CONFIG_I3C is not set
CONFIG_SPI=y
# CONFIG_SPI_DEBUG is not set
CONFIG_SPI_MASTER=y
# CONFIG_SPI_MEM is not set

#
# SPI Master Controller Drivers
#
# CONFIG_SPI_ALTERA is not set
# CONFIG_SPI_AXI_SPI_ENGINE is not set
# CONFIG_SPI_BITBANG is not set
# CONFIG_SPI_BUTTERFLY is not set
# CONFIG_SPI_CADENCE is not set
# CONFIG_SPI_DESIGNWARE is not set
# CONFIG_SPI_GPIO is not set
# CONFIG_SPI_LM70_LLP is not set
# CONFIG_SPI_MICROCHIP_CORE is not set
# CONFIG_SPI_MICROCHIP_CORE_QSPI is not set
# CONFIG_SPI_LANTIQ_SSC is not set
# CONFIG_SPI_OC_TINY is not set
# CONFIG_SPI_PCI1XXXX is not set
# CONFIG_SPI_PXA2XX is not set
# CONFIG_SPI_SC18IS602 is not set
# CONFIG_SPI_SIFIVE is not set
# CONFIG_SPI_MXIC is not set
# CONFIG_SPI_XCOMM is not set
# CONFIG_SPI_XILINX is not set
# CONFIG_SPI_ZYNQMP_GQSPI is not set
# CONFIG_SPI_AMD is not set

#
# SPI Multiplexer support
#
# CONFIG_SPI_MUX is not set

#
# SPI Protocol Masters
#
# CONFIG_SPI_SPIDEV is not set
# CONFIG_SPI_LOOPBACK_TEST is not set
# CONFIG_SPI_TLE62X0 is not set
# CONFIG_SPI_SLAVE is not set
CONFIG_SPI_DYNAMIC=y
# CONFIG_SPMI is not set
# CONFIG_HSI is not set
CONFIG_PPS=y
# CONFIG_PPS_DEBUG is not set

#
# PPS clients support
#
# CONFIG_PPS_CLIENT_KTIMER is not set
CONFIG_PPS_CLIENT_LDISC=m
CONFIG_PPS_CLIENT_PARPORT=m
CONFIG_PPS_CLIENT_GPIO=m

#
# PPS generators support
#

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK=y
CONFIG_PTP_1588_CLOCK_OPTIONAL=y
# CONFIG_DP83640_PHY is not set
# CONFIG_PTP_1588_CLOCK_INES is not set
CONFIG_PTP_1588_CLOCK_KVM=m
# CONFIG_PTP_1588_CLOCK_IDT82P33 is not set
# CONFIG_PTP_1588_CLOCK_IDTCM is not set
# CONFIG_PTP_1588_CLOCK_VMW is not set
# end of PTP clock support

CONFIG_PINCTRL=y
# CONFIG_DEBUG_PINCTRL is not set
# CONFIG_PINCTRL_AMD is not set
# CONFIG_PINCTRL_CY8C95X0 is not set
# CONFIG_PINCTRL_MCP23S08 is not set
# CONFIG_PINCTRL_SX150X is not set

#
# Intel pinctrl drivers
#
# CONFIG_PINCTRL_BAYTRAIL is not set
# CONFIG_PINCTRL_CHERRYVIEW is not set
# CONFIG_PINCTRL_LYNXPOINT is not set
# CONFIG_PINCTRL_ALDERLAKE is not set
# CONFIG_PINCTRL_BROXTON is not set
# CONFIG_PINCTRL_CANNONLAKE is not set
# CONFIG_PINCTRL_CEDARFORK is not set
# CONFIG_PINCTRL_DENVERTON is not set
# CONFIG_PINCTRL_ELKHARTLAKE is not set
# CONFIG_PINCTRL_EMMITSBURG is not set
# CONFIG_PINCTRL_GEMINILAKE is not set
# CONFIG_PINCTRL_ICELAKE is not set
# CONFIG_PINCTRL_JASPERLAKE is not set
# CONFIG_PINCTRL_LAKEFIELD is not set
# CONFIG_PINCTRL_LEWISBURG is not set
# CONFIG_PINCTRL_METEORLAKE is not set
# CONFIG_PINCTRL_SUNRISEPOINT is not set
# CONFIG_PINCTRL_TIGERLAKE is not set
# end of Intel pinctrl drivers

#
# Renesas pinctrl drivers
#
# end of Renesas pinctrl drivers

CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_GPIO_ACPI=y
# CONFIG_DEBUG_GPIO is not set
CONFIG_GPIO_SYSFS=y
CONFIG_GPIO_CDEV=y
CONFIG_GPIO_CDEV_V1=y

#
# Memory mapped GPIO drivers
#
# CONFIG_GPIO_AMDPT is not set
# CONFIG_GPIO_DWAPB is not set
# CONFIG_GPIO_EXAR is not set
# CONFIG_GPIO_GENERIC_PLATFORM is not set
CONFIG_GPIO_ICH=m
# CONFIG_GPIO_MB86S7X is not set
# CONFIG_GPIO_AMD_FCH is not set
# end of Memory mapped GPIO drivers

#
# Port-mapped I/O GPIO drivers
#
# CONFIG_GPIO_VX855 is not set
# CONFIG_GPIO_F7188X is not set
# CONFIG_GPIO_IT87 is not set
# CONFIG_GPIO_SCH is not set
# CONFIG_GPIO_SCH311X is not set
# CONFIG_GPIO_WINBOND is not set
# CONFIG_GPIO_WS16C48 is not set
# end of Port-mapped I/O GPIO drivers

#
# I2C GPIO expanders
#
# CONFIG_GPIO_FXL6408 is not set
# CONFIG_GPIO_MAX7300 is not set
# CONFIG_GPIO_MAX732X is not set
# CONFIG_GPIO_PCA953X is not set
# CONFIG_GPIO_PCA9570 is not set
# CONFIG_GPIO_PCF857X is not set
# CONFIG_GPIO_TPIC2810 is not set
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
# CONFIG_GPIO_ELKHARTLAKE is not set
# end of MFD GPIO expanders

#
# PCI GPIO expanders
#
# CONFIG_GPIO_AMD8111 is not set
# CONFIG_GPIO_BT8XX is not set
# CONFIG_GPIO_ML_IOH is not set
# CONFIG_GPIO_PCI_IDIO_16 is not set
# CONFIG_GPIO_PCIE_IDIO_24 is not set
# CONFIG_GPIO_RDC321X is not set
# end of PCI GPIO expanders

#
# SPI GPIO expanders
#
# CONFIG_GPIO_MAX3191X is not set
# CONFIG_GPIO_MAX7301 is not set
# CONFIG_GPIO_MC33880 is not set
# CONFIG_GPIO_PISOSR is not set
# CONFIG_GPIO_XRA1403 is not set
# end of SPI GPIO expanders

#
# USB GPIO expanders
#
# end of USB GPIO expanders

#
# Virtual GPIO drivers
#
# CONFIG_GPIO_AGGREGATOR is not set
# CONFIG_GPIO_LATCH is not set
# CONFIG_GPIO_MOCKUP is not set
# CONFIG_GPIO_VIRTIO is not set
# CONFIG_GPIO_SIM is not set
# end of Virtual GPIO drivers

# CONFIG_W1 is not set
CONFIG_POWER_RESET=y
# CONFIG_POWER_RESET_RESTART is not set
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
CONFIG_POWER_SUPPLY_HWMON=y
# CONFIG_IP5XXX_POWER is not set
# CONFIG_TEST_POWER is not set
# CONFIG_CHARGER_ADP5061 is not set
# CONFIG_BATTERY_CW2015 is not set
# CONFIG_BATTERY_DS2780 is not set
# CONFIG_BATTERY_DS2781 is not set
# CONFIG_BATTERY_DS2782 is not set
# CONFIG_BATTERY_SAMSUNG_SDI is not set
# CONFIG_BATTERY_SBS is not set
# CONFIG_CHARGER_SBS is not set
# CONFIG_MANAGER_SBS is not set
# CONFIG_BATTERY_BQ27XXX is not set
# CONFIG_BATTERY_MAX17040 is not set
# CONFIG_BATTERY_MAX17042 is not set
# CONFIG_CHARGER_MAX8903 is not set
# CONFIG_CHARGER_LP8727 is not set
# CONFIG_CHARGER_GPIO is not set
# CONFIG_CHARGER_LT3651 is not set
# CONFIG_CHARGER_LTC4162L is not set
# CONFIG_CHARGER_MAX77976 is not set
# CONFIG_CHARGER_BQ2415X is not set
# CONFIG_CHARGER_BQ24257 is not set
# CONFIG_CHARGER_BQ24735 is not set
# CONFIG_CHARGER_BQ2515X is not set
# CONFIG_CHARGER_BQ25890 is not set
# CONFIG_CHARGER_BQ25980 is not set
# CONFIG_CHARGER_BQ256XX is not set
# CONFIG_BATTERY_GAUGE_LTC2941 is not set
# CONFIG_BATTERY_GOLDFISH is not set
# CONFIG_BATTERY_RT5033 is not set
# CONFIG_CHARGER_RT9455 is not set
# CONFIG_CHARGER_BD99954 is not set
# CONFIG_BATTERY_UG3105 is not set
CONFIG_HWMON=y
CONFIG_HWMON_VID=m
# CONFIG_HWMON_DEBUG_CHIP is not set

#
# Native drivers
#
CONFIG_SENSORS_ABITUGURU=m
CONFIG_SENSORS_ABITUGURU3=m
# CONFIG_SENSORS_AD7314 is not set
CONFIG_SENSORS_AD7414=m
CONFIG_SENSORS_AD7418=m
CONFIG_SENSORS_ADM1025=m
CONFIG_SENSORS_ADM1026=m
CONFIG_SENSORS_ADM1029=m
CONFIG_SENSORS_ADM1031=m
# CONFIG_SENSORS_ADM1177 is not set
CONFIG_SENSORS_ADM9240=m
CONFIG_SENSORS_ADT7X10=m
# CONFIG_SENSORS_ADT7310 is not set
CONFIG_SENSORS_ADT7410=m
CONFIG_SENSORS_ADT7411=m
CONFIG_SENSORS_ADT7462=m
CONFIG_SENSORS_ADT7470=m
CONFIG_SENSORS_ADT7475=m
# CONFIG_SENSORS_AHT10 is not set
# CONFIG_SENSORS_AQUACOMPUTER_D5NEXT is not set
# CONFIG_SENSORS_AS370 is not set
CONFIG_SENSORS_ASC7621=m
# CONFIG_SENSORS_AXI_FAN_CONTROL is not set
CONFIG_SENSORS_K8TEMP=m
CONFIG_SENSORS_APPLESMC=m
CONFIG_SENSORS_ASB100=m
CONFIG_SENSORS_ATXP1=m
# CONFIG_SENSORS_CORSAIR_CPRO is not set
# CONFIG_SENSORS_CORSAIR_PSU is not set
# CONFIG_SENSORS_DRIVETEMP is not set
CONFIG_SENSORS_DS620=m
CONFIG_SENSORS_DS1621=m
# CONFIG_SENSORS_DELL_SMM is not set
CONFIG_SENSORS_I5K_AMB=m
CONFIG_SENSORS_F71805F=m
CONFIG_SENSORS_F71882FG=m
CONFIG_SENSORS_F75375S=m
CONFIG_SENSORS_FSCHMD=m
# CONFIG_SENSORS_FTSTEUTATES is not set
CONFIG_SENSORS_GL518SM=m
CONFIG_SENSORS_GL520SM=m
CONFIG_SENSORS_G760A=m
# CONFIG_SENSORS_G762 is not set
# CONFIG_SENSORS_HIH6130 is not set
CONFIG_SENSORS_IBMAEM=m
CONFIG_SENSORS_IBMPEX=m
CONFIG_SENSORS_I5500=m
CONFIG_SENSORS_CORETEMP=m
CONFIG_SENSORS_IT87=m
CONFIG_SENSORS_JC42=m
# CONFIG_SENSORS_POWR1220 is not set
CONFIG_SENSORS_LINEAGE=m
# CONFIG_SENSORS_LTC2945 is not set
# CONFIG_SENSORS_LTC2947_I2C is not set
# CONFIG_SENSORS_LTC2947_SPI is not set
# CONFIG_SENSORS_LTC2990 is not set
# CONFIG_SENSORS_LTC2992 is not set
CONFIG_SENSORS_LTC4151=m
CONFIG_SENSORS_LTC4215=m
# CONFIG_SENSORS_LTC4222 is not set
CONFIG_SENSORS_LTC4245=m
# CONFIG_SENSORS_LTC4260 is not set
CONFIG_SENSORS_LTC4261=m
# CONFIG_SENSORS_MAX1111 is not set
# CONFIG_SENSORS_MAX127 is not set
CONFIG_SENSORS_MAX16065=m
CONFIG_SENSORS_MAX1619=m
CONFIG_SENSORS_MAX1668=m
CONFIG_SENSORS_MAX197=m
# CONFIG_SENSORS_MAX31722 is not set
# CONFIG_SENSORS_MAX31730 is not set
# CONFIG_SENSORS_MAX31760 is not set
# CONFIG_MAX31827 is not set
# CONFIG_SENSORS_MAX6620 is not set
# CONFIG_SENSORS_MAX6621 is not set
CONFIG_SENSORS_MAX6639=m
CONFIG_SENSORS_MAX6650=m
CONFIG_SENSORS_MAX6697=m
# CONFIG_SENSORS_MAX31790 is not set
# CONFIG_SENSORS_MC34VR500 is not set
CONFIG_SENSORS_MCP3021=m
# CONFIG_SENSORS_TC654 is not set
# CONFIG_SENSORS_TPS23861 is not set
# CONFIG_SENSORS_MR75203 is not set
# CONFIG_SENSORS_ADCXX is not set
CONFIG_SENSORS_LM63=m
# CONFIG_SENSORS_LM70 is not set
CONFIG_SENSORS_LM73=m
CONFIG_SENSORS_LM75=m
CONFIG_SENSORS_LM77=m
CONFIG_SENSORS_LM78=m
CONFIG_SENSORS_LM80=m
CONFIG_SENSORS_LM83=m
CONFIG_SENSORS_LM85=m
CONFIG_SENSORS_LM87=m
CONFIG_SENSORS_LM90=m
CONFIG_SENSORS_LM92=m
CONFIG_SENSORS_LM93=m
CONFIG_SENSORS_LM95234=m
CONFIG_SENSORS_LM95241=m
CONFIG_SENSORS_LM95245=m
CONFIG_SENSORS_PC87360=m
CONFIG_SENSORS_PC87427=m
# CONFIG_SENSORS_NCT6683 is not set
CONFIG_SENSORS_NCT6775_CORE=m
CONFIG_SENSORS_NCT6775=m
# CONFIG_SENSORS_NCT6775_I2C is not set
# CONFIG_SENSORS_NCT7802 is not set
# CONFIG_SENSORS_NCT7904 is not set
# CONFIG_SENSORS_NPCM7XX is not set
# CONFIG_SENSORS_NZXT_KRAKEN2 is not set
# CONFIG_SENSORS_NZXT_SMART2 is not set
# CONFIG_SENSORS_OCC_P8_I2C is not set
# CONFIG_SENSORS_OXP is not set
CONFIG_SENSORS_PCF8591=m
# CONFIG_PMBUS is not set
# CONFIG_SENSORS_SBTSI is not set
# CONFIG_SENSORS_SBRMI is not set
CONFIG_SENSORS_SHT15=m
CONFIG_SENSORS_SHT21=m
# CONFIG_SENSORS_SHT3x is not set
# CONFIG_SENSORS_SHT4x is not set
# CONFIG_SENSORS_SHTC1 is not set
CONFIG_SENSORS_SIS5595=m
CONFIG_SENSORS_DME1737=m
CONFIG_SENSORS_EMC1403=m
# CONFIG_SENSORS_EMC2103 is not set
# CONFIG_SENSORS_EMC2305 is not set
CONFIG_SENSORS_EMC6W201=m
CONFIG_SENSORS_SMSC47M1=m
CONFIG_SENSORS_SMSC47M192=m
CONFIG_SENSORS_SMSC47B397=m
CONFIG_SENSORS_SCH56XX_COMMON=m
CONFIG_SENSORS_SCH5627=m
CONFIG_SENSORS_SCH5636=m
# CONFIG_SENSORS_STTS751 is not set
# CONFIG_SENSORS_SMM665 is not set
# CONFIG_SENSORS_ADC128D818 is not set
CONFIG_SENSORS_ADS7828=m
# CONFIG_SENSORS_ADS7871 is not set
CONFIG_SENSORS_AMC6821=m
CONFIG_SENSORS_INA209=m
CONFIG_SENSORS_INA2XX=m
# CONFIG_SENSORS_INA238 is not set
# CONFIG_SENSORS_INA3221 is not set
# CONFIG_SENSORS_TC74 is not set
CONFIG_SENSORS_THMC50=m
CONFIG_SENSORS_TMP102=m
# CONFIG_SENSORS_TMP103 is not set
# CONFIG_SENSORS_TMP108 is not set
CONFIG_SENSORS_TMP401=m
CONFIG_SENSORS_TMP421=m
# CONFIG_SENSORS_TMP464 is not set
# CONFIG_SENSORS_TMP513 is not set
CONFIG_SENSORS_VIA_CPUTEMP=m
CONFIG_SENSORS_VIA686A=m
CONFIG_SENSORS_VT1211=m
CONFIG_SENSORS_VT8231=m
# CONFIG_SENSORS_W83773G is not set
CONFIG_SENSORS_W83781D=m
CONFIG_SENSORS_W83791D=m
CONFIG_SENSORS_W83792D=m
CONFIG_SENSORS_W83793=m
CONFIG_SENSORS_W83795=m
# CONFIG_SENSORS_W83795_FANCTRL is not set
CONFIG_SENSORS_W83L785TS=m
CONFIG_SENSORS_W83L786NG=m
CONFIG_SENSORS_W83627HF=m
CONFIG_SENSORS_W83627EHF=m
# CONFIG_SENSORS_XGENE is not set

#
# ACPI drivers
#
CONFIG_SENSORS_ACPI_POWER=m
CONFIG_SENSORS_ATK0110=m
# CONFIG_SENSORS_ASUS_WMI is not set
# CONFIG_SENSORS_ASUS_EC is not set
# CONFIG_SENSORS_HP_WMI is not set
CONFIG_THERMAL=y
# CONFIG_THERMAL_NETLINK is not set
# CONFIG_THERMAL_STATISTICS is not set
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
CONFIG_THERMAL_HWMON=y
CONFIG_THERMAL_ACPI=y
CONFIG_THERMAL_WRITABLE_TRIPS=y
CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=y
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
# CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
# CONFIG_THERMAL_DEFAULT_GOV_BANG_BANG is not set
CONFIG_THERMAL_GOV_FAIR_SHARE=y
CONFIG_THERMAL_GOV_STEP_WISE=y
CONFIG_THERMAL_GOV_BANG_BANG=y
CONFIG_THERMAL_GOV_USER_SPACE=y
# CONFIG_THERMAL_EMULATION is not set

#
# Intel thermal drivers
#
CONFIG_INTEL_POWERCLAMP=m
CONFIG_X86_THERMAL_VECTOR=y
CONFIG_INTEL_TCC=y
CONFIG_X86_PKG_TEMP_THERMAL=m
# CONFIG_INTEL_SOC_DTS_THERMAL is not set

#
# ACPI INT340X thermal drivers
#
# CONFIG_INT340X_THERMAL is not set
# end of ACPI INT340X thermal drivers

CONFIG_INTEL_PCH_THERMAL=m
# CONFIG_INTEL_TCC_COOLING is not set
# CONFIG_INTEL_HFI_THERMAL is not set
# end of Intel thermal drivers

CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
# CONFIG_WATCHDOG_NOWAYOUT is not set
CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=y
CONFIG_WATCHDOG_OPEN_TIMEOUT=0
CONFIG_WATCHDOG_SYSFS=y
# CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT is not set

#
# Watchdog Pretimeout Governors
#
# CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set

#
# Watchdog Device Drivers
#
CONFIG_SOFT_WATCHDOG=m
CONFIG_WDAT_WDT=m
# CONFIG_XILINX_WATCHDOG is not set
# CONFIG_ZIIRAVE_WATCHDOG is not set
# CONFIG_CADENCE_WATCHDOG is not set
# CONFIG_DW_WATCHDOG is not set
# CONFIG_MAX63XX_WATCHDOG is not set
# CONFIG_ACQUIRE_WDT is not set
# CONFIG_ADVANTECH_WDT is not set
# CONFIG_ADVANTECH_EC_WDT is not set
CONFIG_ALIM1535_WDT=m
CONFIG_ALIM7101_WDT=m
# CONFIG_EBC_C384_WDT is not set
# CONFIG_EXAR_WDT is not set
CONFIG_F71808E_WDT=m
# CONFIG_SP5100_TCO is not set
CONFIG_SBC_FITPC2_WATCHDOG=m
# CONFIG_EUROTECH_WDT is not set
CONFIG_IB700_WDT=m
CONFIG_IBMASR=m
# CONFIG_WAFER_WDT is not set
CONFIG_I6300ESB_WDT=y
CONFIG_IE6XX_WDT=m
CONFIG_ITCO_WDT=y
CONFIG_ITCO_VENDOR_SUPPORT=y
CONFIG_IT8712F_WDT=m
CONFIG_IT87_WDT=m
CONFIG_HP_WATCHDOG=m
CONFIG_HPWDT_NMI_DECODING=y
# CONFIG_SC1200_WDT is not set
# CONFIG_PC87413_WDT is not set
CONFIG_NV_TCO=m
# CONFIG_60XX_WDT is not set
# CONFIG_CPU5_WDT is not set
CONFIG_SMSC_SCH311X_WDT=m
# CONFIG_SMSC37B787_WDT is not set
# CONFIG_TQMX86_WDT is not set
CONFIG_VIA_WDT=m
CONFIG_W83627HF_WDT=m
CONFIG_W83877F_WDT=m
CONFIG_W83977F_WDT=m
CONFIG_MACHZ_WDT=m
# CONFIG_SBC_EPX_C3_WATCHDOG is not set
CONFIG_INTEL_MEI_WDT=m
# CONFIG_NI903X_WDT is not set
# CONFIG_NIC7018_WDT is not set
# CONFIG_MEN_A21_WDT is not set

#
# PCI-based Watchdog Cards
#
CONFIG_PCIPCWATCHDOG=m
CONFIG_WDTPCI=m

#
# USB-based Watchdog Cards
#
# CONFIG_USBPCWATCHDOG is not set
CONFIG_SSB_POSSIBLE=y
# CONFIG_SSB is not set
CONFIG_BCMA_POSSIBLE=y
# CONFIG_BCMA is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
# CONFIG_MFD_AS3711 is not set
# CONFIG_MFD_SMPRO is not set
# CONFIG_PMIC_ADP5520 is not set
# CONFIG_MFD_AAT2870_CORE is not set
# CONFIG_MFD_BCM590XX is not set
# CONFIG_MFD_BD9571MWV is not set
# CONFIG_MFD_AXP20X_I2C is not set
# CONFIG_MFD_MADERA is not set
# CONFIG_PMIC_DA903X is not set
# CONFIG_MFD_DA9052_SPI is not set
# CONFIG_MFD_DA9052_I2C is not set
# CONFIG_MFD_DA9055 is not set
# CONFIG_MFD_DA9062 is not set
# CONFIG_MFD_DA9063 is not set
# CONFIG_MFD_DA9150 is not set
# CONFIG_MFD_DLN2 is not set
# CONFIG_MFD_MC13XXX_SPI is not set
# CONFIG_MFD_MC13XXX_I2C is not set
# CONFIG_MFD_MP2629 is not set
# CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
CONFIG_LPC_ICH=m
CONFIG_LPC_SCH=m
CONFIG_MFD_INTEL_LPSS=y
CONFIG_MFD_INTEL_LPSS_ACPI=y
CONFIG_MFD_INTEL_LPSS_PCI=y
# CONFIG_MFD_INTEL_PMC_BXT is not set
# CONFIG_MFD_IQS62X is not set
# CONFIG_MFD_JANZ_CMODIO is not set
# CONFIG_MFD_KEMPLD is not set
# CONFIG_MFD_88PM800 is not set
# CONFIG_MFD_88PM805 is not set
# CONFIG_MFD_88PM860X is not set
# CONFIG_MFD_MAX14577 is not set
# CONFIG_MFD_MAX77541 is not set
# CONFIG_MFD_MAX77693 is not set
# CONFIG_MFD_MAX77843 is not set
# CONFIG_MFD_MAX8907 is not set
# CONFIG_MFD_MAX8925 is not set
# CONFIG_MFD_MAX8997 is not set
# CONFIG_MFD_MAX8998 is not set
# CONFIG_MFD_MT6360 is not set
# CONFIG_MFD_MT6370 is not set
# CONFIG_MFD_MT6397 is not set
# CONFIG_MFD_MENF21BMC is not set
# CONFIG_MFD_OCELOT is not set
# CONFIG_EZX_PCAP is not set
# CONFIG_MFD_VIPERBOARD is not set
# CONFIG_MFD_RETU is not set
# CONFIG_MFD_PCF50633 is not set
# CONFIG_MFD_SY7636A is not set
# CONFIG_MFD_RDC321X is not set
# CONFIG_MFD_RT4831 is not set
# CONFIG_MFD_RT5033 is not set
# CONFIG_MFD_RT5120 is not set
# CONFIG_MFD_RC5T583 is not set
# CONFIG_MFD_SI476X_CORE is not set
CONFIG_MFD_SM501=m
CONFIG_MFD_SM501_GPIO=y
# CONFIG_MFD_SKY81452 is not set
# CONFIG_MFD_SYSCON is not set
# CONFIG_MFD_TI_AM335X_TSCADC is not set
# CONFIG_MFD_LP3943 is not set
# CONFIG_MFD_LP8788 is not set
# CONFIG_MFD_TI_LMU is not set
# CONFIG_MFD_PALMAS is not set
# CONFIG_TPS6105X is not set
# CONFIG_TPS65010 is not set
# CONFIG_TPS6507X is not set
# CONFIG_MFD_TPS65086 is not set
# CONFIG_MFD_TPS65090 is not set
# CONFIG_MFD_TI_LP873X is not set
# CONFIG_MFD_TPS6586X is not set
# CONFIG_MFD_TPS65910 is not set
# CONFIG_MFD_TPS65912_I2C is not set
# CONFIG_MFD_TPS65912_SPI is not set
# CONFIG_MFD_TPS6594_I2C is not set
# CONFIG_MFD_TPS6594_SPI is not set
# CONFIG_TWL4030_CORE is not set
# CONFIG_TWL6040_CORE is not set
# CONFIG_MFD_WL1273_CORE is not set
# CONFIG_MFD_LM3533 is not set
# CONFIG_MFD_TQMX86 is not set
CONFIG_MFD_VX855=m
# CONFIG_MFD_ARIZONA_I2C is not set
# CONFIG_MFD_ARIZONA_SPI is not set
# CONFIG_MFD_WM8400 is not set
# CONFIG_MFD_WM831X_I2C is not set
# CONFIG_MFD_WM831X_SPI is not set
# CONFIG_MFD_WM8350_I2C is not set
# CONFIG_MFD_WM8994 is not set
# CONFIG_MFD_ATC260X_I2C is not set
# CONFIG_MFD_INTEL_M10_BMC_SPI is not set
# end of Multifunction device drivers

# CONFIG_REGULATOR is not set
CONFIG_RC_CORE=m
CONFIG_LIRC=y
CONFIG_RC_MAP=m
CONFIG_RC_DECODERS=y
CONFIG_IR_IMON_DECODER=m
CONFIG_IR_JVC_DECODER=m
CONFIG_IR_MCE_KBD_DECODER=m
CONFIG_IR_NEC_DECODER=m
CONFIG_IR_RC5_DECODER=m
CONFIG_IR_RC6_DECODER=m
# CONFIG_IR_RCMM_DECODER is not set
CONFIG_IR_SANYO_DECODER=m
# CONFIG_IR_SHARP_DECODER is not set
CONFIG_IR_SONY_DECODER=m
# CONFIG_IR_XMP_DECODER is not set
CONFIG_RC_DEVICES=y
CONFIG_IR_ENE=m
CONFIG_IR_FINTEK=m
# CONFIG_IR_IGORPLUGUSB is not set
# CONFIG_IR_IGUANA is not set
# CONFIG_IR_IMON is not set
# CONFIG_IR_IMON_RAW is not set
CONFIG_IR_ITE_CIR=m
# CONFIG_IR_MCEUSB is not set
CONFIG_IR_NUVOTON=m
# CONFIG_IR_REDRAT3 is not set
CONFIG_IR_SERIAL=m
CONFIG_IR_SERIAL_TRANSMITTER=y
# CONFIG_IR_STREAMZAP is not set
# CONFIG_IR_TOY is not set
# CONFIG_IR_TTUSBIR is not set
CONFIG_IR_WINBOND_CIR=m
# CONFIG_RC_ATI_REMOTE is not set
# CONFIG_RC_LOOPBACK is not set
# CONFIG_RC_XBOX_DVD is not set

#
# CEC support
#
# CONFIG_MEDIA_CEC_SUPPORT is not set
# end of CEC support

CONFIG_MEDIA_SUPPORT=m
CONFIG_MEDIA_SUPPORT_FILTER=y
CONFIG_MEDIA_SUBDRV_AUTOSELECT=y

#
# Media device types
#
# CONFIG_MEDIA_CAMERA_SUPPORT is not set
# CONFIG_MEDIA_ANALOG_TV_SUPPORT is not set
# CONFIG_MEDIA_DIGITAL_TV_SUPPORT is not set
# CONFIG_MEDIA_RADIO_SUPPORT is not set
# CONFIG_MEDIA_SDR_SUPPORT is not set
# CONFIG_MEDIA_PLATFORM_SUPPORT is not set
# CONFIG_MEDIA_TEST_SUPPORT is not set
# end of Media device types

#
# Media drivers
#

#
# Drivers filtered as selected at 'Filter media drivers'
#

#
# Media drivers
#
# CONFIG_MEDIA_USB_SUPPORT is not set
# CONFIG_MEDIA_PCI_SUPPORT is not set
# end of Media drivers

#
# Media ancillary drivers
#
# end of Media ancillary drivers

#
# Graphics support
#
CONFIG_APERTURE_HELPERS=y
CONFIG_VIDEO_CMDLINE=y
CONFIG_VIDEO_NOMODESET=y
# CONFIG_AGP is not set
CONFIG_INTEL_GTT=m
CONFIG_VGA_SWITCHEROO=y
CONFIG_DRM=m
CONFIG_DRM_MIPI_DSI=y
CONFIG_DRM_KMS_HELPER=m
# CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS is not set
# CONFIG_DRM_DEBUG_MODESET_LOCK is not set
CONFIG_DRM_FBDEV_EMULATION=y
CONFIG_DRM_FBDEV_OVERALLOC=100
# CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM is not set
CONFIG_DRM_LOAD_EDID_FIRMWARE=y
CONFIG_DRM_DISPLAY_HELPER=m
CONFIG_DRM_DISPLAY_DP_HELPER=y
CONFIG_DRM_DISPLAY_HDCP_HELPER=y
CONFIG_DRM_DISPLAY_HDMI_HELPER=y
CONFIG_DRM_DP_AUX_CHARDEV=y
# CONFIG_DRM_DP_CEC is not set
CONFIG_DRM_TTM=m
CONFIG_DRM_BUDDY=m
CONFIG_DRM_VRAM_HELPER=m
CONFIG_DRM_TTM_HELPER=m
CONFIG_DRM_GEM_SHMEM_HELPER=m

#
# I2C encoder or helper chips
#
# CONFIG_DRM_I2C_CH7006 is not set
# CONFIG_DRM_I2C_SIL164 is not set
# CONFIG_DRM_I2C_NXP_TDA998X is not set
# CONFIG_DRM_I2C_NXP_TDA9950 is not set
# end of I2C encoder or helper chips

#
# ARM devices
#
# end of ARM devices

# CONFIG_DRM_RADEON is not set
# CONFIG_DRM_AMDGPU is not set
# CONFIG_DRM_NOUVEAU is not set
CONFIG_DRM_I915=m
CONFIG_DRM_I915_FORCE_PROBE=""
CONFIG_DRM_I915_CAPTURE_ERROR=y
CONFIG_DRM_I915_COMPRESS_ERROR=y
CONFIG_DRM_I915_USERPTR=y
# CONFIG_DRM_I915_GVT_KVMGT is not set

#
# drm/i915 Debugging
#
# CONFIG_DRM_I915_WERROR is not set
# CONFIG_DRM_I915_DEBUG is not set
# CONFIG_DRM_I915_DEBUG_MMIO is not set
# CONFIG_DRM_I915_SW_FENCE_DEBUG_OBJECTS is not set
# CONFIG_DRM_I915_SW_FENCE_CHECK_DAG is not set
# CONFIG_DRM_I915_DEBUG_GUC is not set
# CONFIG_DRM_I915_SELFTEST is not set
# CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINTS is not set
# CONFIG_DRM_I915_DEBUG_VBLANK_EVADE is not set
# CONFIG_DRM_I915_DEBUG_RUNTIME_PM is not set
# end of drm/i915 Debugging

#
# drm/i915 Profile Guided Optimisation
#
CONFIG_DRM_I915_REQUEST_TIMEOUT=20000
CONFIG_DRM_I915_FENCE_TIMEOUT=10000
CONFIG_DRM_I915_USERFAULT_AUTOSUSPEND=250
CONFIG_DRM_I915_HEARTBEAT_INTERVAL=2500
CONFIG_DRM_I915_PREEMPT_TIMEOUT=640
CONFIG_DRM_I915_PREEMPT_TIMEOUT_COMPUTE=7500
CONFIG_DRM_I915_MAX_REQUEST_BUSYWAIT=8000
CONFIG_DRM_I915_STOP_TIMEOUT=100
CONFIG_DRM_I915_TIMESLICE_DURATION=1
# end of drm/i915 Profile Guided Optimisation

# CONFIG_DRM_VGEM is not set
# CONFIG_DRM_VKMS is not set
# CONFIG_DRM_VMWGFX is not set
# CONFIG_DRM_GMA500 is not set
# CONFIG_DRM_UDL is not set
CONFIG_DRM_AST=m
# CONFIG_DRM_MGAG200 is not set
CONFIG_DRM_QXL=m
CONFIG_DRM_VIRTIO_GPU=m
CONFIG_DRM_VIRTIO_GPU_KMS=y
CONFIG_DRM_PANEL=y

#
# Display Panels
#
# CONFIG_DRM_PANEL_AUO_A030JTN01 is not set
# CONFIG_DRM_PANEL_ORISETECH_OTA5601A is not set
# CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN is not set
# CONFIG_DRM_PANEL_WIDECHIPS_WS2401 is not set
# end of Display Panels

CONFIG_DRM_BRIDGE=y
CONFIG_DRM_PANEL_BRIDGE=y

#
# Display Interface Bridges
#
# CONFIG_DRM_ANALOGIX_ANX78XX is not set
# end of Display Interface Bridges

# CONFIG_DRM_ETNAVIV is not set
CONFIG_DRM_BOCHS=m
CONFIG_DRM_CIRRUS_QEMU=m
# CONFIG_DRM_GM12U320 is not set
# CONFIG_DRM_PANEL_MIPI_DBI is not set
# CONFIG_DRM_SIMPLEDRM is not set
# CONFIG_TINYDRM_HX8357D is not set
# CONFIG_TINYDRM_ILI9163 is not set
# CONFIG_TINYDRM_ILI9225 is not set
# CONFIG_TINYDRM_ILI9341 is not set
# CONFIG_TINYDRM_ILI9486 is not set
# CONFIG_TINYDRM_MI0283QT is not set
# CONFIG_TINYDRM_REPAPER is not set
# CONFIG_TINYDRM_ST7586 is not set
# CONFIG_TINYDRM_ST7735R is not set
# CONFIG_DRM_VBOXVIDEO is not set
# CONFIG_DRM_GUD is not set
# CONFIG_DRM_SSD130X is not set
# CONFIG_DRM_HYPERV is not set
# CONFIG_DRM_LEGACY is not set
CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=y

#
# Frame buffer Devices
#
CONFIG_FB_NOTIFY=y
CONFIG_FB=y
# CONFIG_FIRMWARE_EDID is not set
CONFIG_FB_CFB_FILLRECT=y
CONFIG_FB_CFB_COPYAREA=y
CONFIG_FB_CFB_IMAGEBLIT=y
CONFIG_FB_SYS_FILLRECT=y
CONFIG_FB_SYS_COPYAREA=y
CONFIG_FB_SYS_IMAGEBLIT=y
# CONFIG_FB_FOREIGN_ENDIAN is not set
CONFIG_FB_SYS_FOPS=y
CONFIG_FB_DEFERRED_IO=y
CONFIG_FB_IO_HELPERS=y
CONFIG_FB_SYS_HELPERS=y
CONFIG_FB_SYS_HELPERS_DEFERRED=y
# CONFIG_FB_MODE_HELPERS is not set
CONFIG_FB_TILEBLITTING=y

#
# Frame buffer hardware drivers
#
# CONFIG_FB_CIRRUS is not set
# CONFIG_FB_PM2 is not set
# CONFIG_FB_CYBER2000 is not set
# CONFIG_FB_ARC is not set
# CONFIG_FB_ASILIANT is not set
# CONFIG_FB_IMSTT is not set
# CONFIG_FB_VGA16 is not set
# CONFIG_FB_UVESA is not set
CONFIG_FB_VESA=y
CONFIG_FB_EFI=y
# CONFIG_FB_N411 is not set
# CONFIG_FB_HGA is not set
# CONFIG_FB_OPENCORES is not set
# CONFIG_FB_S1D13XXX is not set
# CONFIG_FB_NVIDIA is not set
# CONFIG_FB_RIVA is not set
# CONFIG_FB_I740 is not set
# CONFIG_FB_LE80578 is not set
# CONFIG_FB_MATROX is not set
# CONFIG_FB_RADEON is not set
# CONFIG_FB_ATY128 is not set
# CONFIG_FB_ATY is not set
# CONFIG_FB_S3 is not set
# CONFIG_FB_SAVAGE is not set
# CONFIG_FB_SIS is not set
# CONFIG_FB_VIA is not set
# CONFIG_FB_NEOMAGIC is not set
# CONFIG_FB_KYRO is not set
# CONFIG_FB_3DFX is not set
# CONFIG_FB_VOODOO1 is not set
# CONFIG_FB_VT8623 is not set
# CONFIG_FB_TRIDENT is not set
# CONFIG_FB_ARK is not set
# CONFIG_FB_PM3 is not set
# CONFIG_FB_CARMINE is not set
# CONFIG_FB_SM501 is not set
# CONFIG_FB_SMSCUFX is not set
# CONFIG_FB_UDL is not set
# CONFIG_FB_IBM_GXT4500 is not set
# CONFIG_FB_VIRTUAL is not set
# CONFIG_FB_METRONOME is not set
# CONFIG_FB_MB862XX is not set
CONFIG_FB_HYPERV=m
# CONFIG_FB_SIMPLE is not set
# CONFIG_FB_SSD1307 is not set
# CONFIG_FB_SM712 is not set
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
CONFIG_LCD_CLASS_DEVICE=m
# CONFIG_LCD_L4F00242T03 is not set
# CONFIG_LCD_LMS283GF05 is not set
# CONFIG_LCD_LTV350QV is not set
# CONFIG_LCD_ILI922X is not set
# CONFIG_LCD_ILI9320 is not set
# CONFIG_LCD_TDO24M is not set
# CONFIG_LCD_VGG2432A4 is not set
CONFIG_LCD_PLATFORM=m
# CONFIG_LCD_AMS369FG06 is not set
# CONFIG_LCD_LMS501KF03 is not set
# CONFIG_LCD_HX8357 is not set
# CONFIG_LCD_OTM3225A is not set
CONFIG_BACKLIGHT_CLASS_DEVICE=y
# CONFIG_BACKLIGHT_KTD253 is not set
# CONFIG_BACKLIGHT_KTZ8866 is not set
# CONFIG_BACKLIGHT_PWM is not set
CONFIG_BACKLIGHT_APPLE=m
# CONFIG_BACKLIGHT_QCOM_WLED is not set
# CONFIG_BACKLIGHT_SAHARA is not set
# CONFIG_BACKLIGHT_ADP8860 is not set
# CONFIG_BACKLIGHT_ADP8870 is not set
# CONFIG_BACKLIGHT_LM3630A is not set
# CONFIG_BACKLIGHT_LM3639 is not set
CONFIG_BACKLIGHT_LP855X=m
# CONFIG_BACKLIGHT_GPIO is not set
# CONFIG_BACKLIGHT_LV5207LP is not set
# CONFIG_BACKLIGHT_BD6107 is not set
# CONFIG_BACKLIGHT_ARCXCNN is not set
# end of Backlight & LCD device support

CONFIG_HDMI=y

#
# Console display driver support
#
CONFIG_VGA_CONSOLE=y
CONFIG_DUMMY_CONSOLE=y
CONFIG_DUMMY_CONSOLE_COLUMNS=80
CONFIG_DUMMY_CONSOLE_ROWS=25
CONFIG_FRAMEBUFFER_CONSOLE=y
# CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION is not set
CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
# CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER is not set
# end of Console display driver support

CONFIG_LOGO=y
# CONFIG_LOGO_LINUX_MONO is not set
# CONFIG_LOGO_LINUX_VGA16 is not set
CONFIG_LOGO_LINUX_CLUT224=y
# end of Graphics support

# CONFIG_DRM_ACCEL is not set
# CONFIG_SOUND is not set
CONFIG_HID_SUPPORT=y
CONFIG_HID=y
CONFIG_HID_BATTERY_STRENGTH=y
CONFIG_HIDRAW=y
CONFIG_UHID=m
CONFIG_HID_GENERIC=y

#
# Special HID drivers
#
CONFIG_HID_A4TECH=m
# CONFIG_HID_ACCUTOUCH is not set
CONFIG_HID_ACRUX=m
# CONFIG_HID_ACRUX_FF is not set
CONFIG_HID_APPLE=m
# CONFIG_HID_APPLEIR is not set
CONFIG_HID_ASUS=m
CONFIG_HID_AUREAL=m
CONFIG_HID_BELKIN=m
# CONFIG_HID_BETOP_FF is not set
# CONFIG_HID_BIGBEN_FF is not set
CONFIG_HID_CHERRY=m
# CONFIG_HID_CHICONY is not set
# CONFIG_HID_CORSAIR is not set
# CONFIG_HID_COUGAR is not set
# CONFIG_HID_MACALLY is not set
CONFIG_HID_CMEDIA=m
# CONFIG_HID_CP2112 is not set
# CONFIG_HID_CREATIVE_SB0540 is not set
CONFIG_HID_CYPRESS=m
CONFIG_HID_DRAGONRISE=m
# CONFIG_DRAGONRISE_FF is not set
# CONFIG_HID_EMS_FF is not set
# CONFIG_HID_ELAN is not set
CONFIG_HID_ELECOM=m
# CONFIG_HID_ELO is not set
# CONFIG_HID_EVISION is not set
CONFIG_HID_EZKEY=m
# CONFIG_HID_FT260 is not set
CONFIG_HID_GEMBIRD=m
CONFIG_HID_GFRM=m
# CONFIG_HID_GLORIOUS is not set
# CONFIG_HID_HOLTEK is not set
# CONFIG_HID_VIVALDI is not set
# CONFIG_HID_GT683R is not set
CONFIG_HID_KEYTOUCH=m
CONFIG_HID_KYE=m
# CONFIG_HID_UCLOGIC is not set
CONFIG_HID_WALTOP=m
# CONFIG_HID_VIEWSONIC is not set
# CONFIG_HID_VRC2 is not set
# CONFIG_HID_XIAOMI is not set
CONFIG_HID_GYRATION=m
CONFIG_HID_ICADE=m
CONFIG_HID_ITE=m
CONFIG_HID_JABRA=m
CONFIG_HID_TWINHAN=m
CONFIG_HID_KENSINGTON=m
CONFIG_HID_LCPOWER=m
CONFIG_HID_LED=m
CONFIG_HID_LENOVO=m
# CONFIG_HID_LETSKETCH is not set
CONFIG_HID_LOGITECH=m
CONFIG_HID_LOGITECH_DJ=m
CONFIG_HID_LOGITECH_HIDPP=m
# CONFIG_LOGITECH_FF is not set
# CONFIG_LOGIRUMBLEPAD2_FF is not set
# CONFIG_LOGIG940_FF is not set
# CONFIG_LOGIWHEELS_FF is not set
CONFIG_HID_MAGICMOUSE=y
# CONFIG_HID_MALTRON is not set
# CONFIG_HID_MAYFLASH is not set
# CONFIG_HID_MEGAWORLD_FF is not set
# CONFIG_HID_REDRAGON is not set
CONFIG_HID_MICROSOFT=m
CONFIG_HID_MONTEREY=m
CONFIG_HID_MULTITOUCH=m
# CONFIG_HID_NINTENDO is not set
CONFIG_HID_NTI=m
# CONFIG_HID_NTRIG is not set
CONFIG_HID_ORTEK=m
CONFIG_HID_PANTHERLORD=m
# CONFIG_PANTHERLORD_FF is not set
# CONFIG_HID_PENMOUNT is not set
CONFIG_HID_PETALYNX=m
CONFIG_HID_PICOLCD=m
CONFIG_HID_PICOLCD_FB=y
CONFIG_HID_PICOLCD_BACKLIGHT=y
CONFIG_HID_PICOLCD_LCD=y
CONFIG_HID_PICOLCD_LEDS=y
CONFIG_HID_PICOLCD_CIR=y
CONFIG_HID_PLANTRONICS=m
# CONFIG_HID_PXRC is not set
# CONFIG_HID_RAZER is not set
CONFIG_HID_PRIMAX=m
# CONFIG_HID_RETRODE is not set
# CONFIG_HID_ROCCAT is not set
CONFIG_HID_SAITEK=m
CONFIG_HID_SAMSUNG=m
# CONFIG_HID_SEMITEK is not set
# CONFIG_HID_SIGMAMICRO is not set
# CONFIG_HID_SONY is not set
CONFIG_HID_SPEEDLINK=m
# CONFIG_HID_STEAM is not set
CONFIG_HID_STEELSERIES=m
CONFIG_HID_SUNPLUS=m
CONFIG_HID_RMI=m
CONFIG_HID_GREENASIA=m
# CONFIG_GREENASIA_FF is not set
CONFIG_HID_HYPERV_MOUSE=m
CONFIG_HID_SMARTJOYPLUS=m
# CONFIG_SMARTJOYPLUS_FF is not set
CONFIG_HID_TIVO=m
CONFIG_HID_TOPSEED=m
# CONFIG_HID_TOPRE is not set
CONFIG_HID_THINGM=m
CONFIG_HID_THRUSTMASTER=m
# CONFIG_THRUSTMASTER_FF is not set
# CONFIG_HID_UDRAW_PS3 is not set
# CONFIG_HID_U2FZERO is not set
# CONFIG_HID_WACOM is not set
CONFIG_HID_WIIMOTE=m
CONFIG_HID_XINMO=m
CONFIG_HID_ZEROPLUS=m
# CONFIG_ZEROPLUS_FF is not set
CONFIG_HID_ZYDACRON=m
CONFIG_HID_SENSOR_HUB=y
CONFIG_HID_SENSOR_CUSTOM_SENSOR=m
CONFIG_HID_ALPS=m
# CONFIG_HID_MCP2221 is not set
# end of Special HID drivers

#
# HID-BPF support
#
# CONFIG_HID_BPF is not set
# end of HID-BPF support

#
# USB HID support
#
CONFIG_USB_HID=y
# CONFIG_HID_PID is not set
# CONFIG_USB_HIDDEV is not set
# end of USB HID support

CONFIG_I2C_HID=m
# CONFIG_I2C_HID_ACPI is not set
# CONFIG_I2C_HID_OF is not set

#
# Intel ISH HID support
#
# CONFIG_INTEL_ISH_HID is not set
# end of Intel ISH HID support

#
# AMD SFH HID Support
#
# CONFIG_AMD_SFH_HID is not set
# end of AMD SFH HID Support

CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_COMMON=y
# CONFIG_USB_LED_TRIG is not set
# CONFIG_USB_ULPI_BUS is not set
# CONFIG_USB_CONN_GPIO is not set
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB=y
CONFIG_USB_PCI=y
CONFIG_USB_ANNOUNCE_NEW_DEVICES=y

#
# Miscellaneous USB options
#
CONFIG_USB_DEFAULT_PERSIST=y
# CONFIG_USB_FEW_INIT_RETRIES is not set
# CONFIG_USB_DYNAMIC_MINORS is not set
# CONFIG_USB_OTG is not set
# CONFIG_USB_OTG_PRODUCTLIST is not set
# CONFIG_USB_OTG_DISABLE_EXTERNAL_HUB is not set
CONFIG_USB_LEDS_TRIGGER_USBPORT=y
CONFIG_USB_AUTOSUSPEND_DELAY=2
CONFIG_USB_MON=y

#
# USB Host Controller Drivers
#
# CONFIG_USB_C67X00_HCD is not set
CONFIG_USB_XHCI_HCD=y
# CONFIG_USB_XHCI_DBGCAP is not set
CONFIG_USB_XHCI_PCI=y
# CONFIG_USB_XHCI_PCI_RENESAS is not set
# CONFIG_USB_XHCI_PLATFORM is not set
CONFIG_USB_EHCI_HCD=y
CONFIG_USB_EHCI_ROOT_HUB_TT=y
CONFIG_USB_EHCI_TT_NEWSCHED=y
CONFIG_USB_EHCI_PCI=y
# CONFIG_USB_EHCI_FSL is not set
# CONFIG_USB_EHCI_HCD_PLATFORM is not set
# CONFIG_USB_OXU210HP_HCD is not set
# CONFIG_USB_ISP116X_HCD is not set
# CONFIG_USB_MAX3421_HCD is not set
CONFIG_USB_OHCI_HCD=y
CONFIG_USB_OHCI_HCD_PCI=y
# CONFIG_USB_OHCI_HCD_PLATFORM is not set
CONFIG_USB_UHCI_HCD=y
# CONFIG_USB_SL811_HCD is not set
# CONFIG_USB_R8A66597_HCD is not set
# CONFIG_USB_HCD_TEST_MODE is not set

#
# USB Device Class drivers
#
# CONFIG_USB_ACM is not set
# CONFIG_USB_PRINTER is not set
# CONFIG_USB_WDM is not set
# CONFIG_USB_TMC is not set

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
#

#
# also be needed; see USB_STORAGE Help for more info
#
CONFIG_USB_STORAGE=m
# CONFIG_USB_STORAGE_DEBUG is not set
# CONFIG_USB_STORAGE_REALTEK is not set
# CONFIG_USB_STORAGE_DATAFAB is not set
# CONFIG_USB_STORAGE_FREECOM is not set
# CONFIG_USB_STORAGE_ISD200 is not set
# CONFIG_USB_STORAGE_USBAT is not set
# CONFIG_USB_STORAGE_SDDR09 is not set
# CONFIG_USB_STORAGE_SDDR55 is not set
# CONFIG_USB_STORAGE_JUMPSHOT is not set
# CONFIG_USB_STORAGE_ALAUDA is not set
# CONFIG_USB_STORAGE_ONETOUCH is not set
# CONFIG_USB_STORAGE_KARMA is not set
# CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
# CONFIG_USB_STORAGE_ENE_UB6250 is not set
# CONFIG_USB_UAS is not set

#
# USB Imaging devices
#
# CONFIG_USB_MDC800 is not set
# CONFIG_USB_MICROTEK is not set
# CONFIG_USBIP_CORE is not set

#
# USB dual-mode controller drivers
#
# CONFIG_USB_CDNS_SUPPORT is not set
# CONFIG_USB_MUSB_HDRC is not set
# CONFIG_USB_DWC3 is not set
# CONFIG_USB_DWC2 is not set
# CONFIG_USB_CHIPIDEA is not set
# CONFIG_USB_ISP1760 is not set

#
# USB port drivers
#
# CONFIG_USB_SERIAL is not set

#
# USB Miscellaneous drivers
#
# CONFIG_USB_USS720 is not set
# CONFIG_USB_EMI62 is not set
# CONFIG_USB_EMI26 is not set
# CONFIG_USB_ADUTUX is not set
# CONFIG_USB_SEVSEG is not set
# CONFIG_USB_LEGOTOWER is not set
# CONFIG_USB_LCD is not set
# CONFIG_USB_CYPRESS_CY7C63 is not set
# CONFIG_USB_CYTHERM is not set
# CONFIG_USB_IDMOUSE is not set
# CONFIG_USB_APPLEDISPLAY is not set
# CONFIG_APPLE_MFI_FASTCHARGE is not set
# CONFIG_USB_SISUSBVGA is not set
# CONFIG_USB_LD is not set
# CONFIG_USB_TRANCEVIBRATOR is not set
# CONFIG_USB_IOWARRIOR is not set
# CONFIG_USB_TEST is not set
# CONFIG_USB_EHSET_TEST_FIXTURE is not set
# CONFIG_USB_ISIGHTFW is not set
# CONFIG_USB_YUREX is not set
# CONFIG_USB_EZUSB_FX2 is not set
# CONFIG_USB_HUB_USB251XB is not set
# CONFIG_USB_HSIC_USB3503 is not set
# CONFIG_USB_HSIC_USB4604 is not set
# CONFIG_USB_LINK_LAYER_TEST is not set
# CONFIG_USB_CHAOSKEY is not set

#
# USB Physical Layer drivers
#
# CONFIG_NOP_USB_XCEIV is not set
# CONFIG_USB_GPIO_VBUS is not set
# CONFIG_USB_ISP1301 is not set
# end of USB Physical Layer drivers

# CONFIG_USB_GADGET is not set
CONFIG_TYPEC=y
# CONFIG_TYPEC_TCPM is not set
CONFIG_TYPEC_UCSI=y
# CONFIG_UCSI_CCG is not set
CONFIG_UCSI_ACPI=y
# CONFIG_UCSI_STM32G0 is not set
# CONFIG_TYPEC_TPS6598X is not set
# CONFIG_TYPEC_RT1719 is not set
# CONFIG_TYPEC_STUSB160X is not set
# CONFIG_TYPEC_WUSB3801 is not set

#
# USB Type-C Multiplexer/DeMultiplexer Switch support
#
# CONFIG_TYPEC_MUX_FSA4480 is not set
# CONFIG_TYPEC_MUX_GPIO_SBU is not set
# CONFIG_TYPEC_MUX_PI3USB30532 is not set
# CONFIG_TYPEC_MUX_NB7VPQ904M is not set
# end of USB Type-C Multiplexer/DeMultiplexer Switch support

#
# USB Type-C Alternate Mode drivers
#
# CONFIG_TYPEC_DP_ALTMODE is not set
# end of USB Type-C Alternate Mode drivers

# CONFIG_USB_ROLE_SWITCH is not set
CONFIG_MMC=m
CONFIG_MMC_BLOCK=m
CONFIG_MMC_BLOCK_MINORS=8
CONFIG_SDIO_UART=m
# CONFIG_MMC_TEST is not set

#
# MMC/SD/SDIO Host Controller Drivers
#
# CONFIG_MMC_DEBUG is not set
CONFIG_MMC_SDHCI=m
CONFIG_MMC_SDHCI_IO_ACCESSORS=y
CONFIG_MMC_SDHCI_PCI=m
CONFIG_MMC_RICOH_MMC=y
CONFIG_MMC_SDHCI_ACPI=m
CONFIG_MMC_SDHCI_PLTFM=m
# CONFIG_MMC_SDHCI_F_SDH30 is not set
# CONFIG_MMC_WBSD is not set
# CONFIG_MMC_TIFM_SD is not set
# CONFIG_MMC_SPI is not set
# CONFIG_MMC_CB710 is not set
# CONFIG_MMC_VIA_SDMMC is not set
# CONFIG_MMC_VUB300 is not set
# CONFIG_MMC_USHC is not set
# CONFIG_MMC_USDHI6ROL0 is not set
CONFIG_MMC_CQHCI=m
# CONFIG_MMC_HSQ is not set
# CONFIG_MMC_TOSHIBA_PCI is not set
# CONFIG_MMC_MTK is not set
# CONFIG_MMC_SDHCI_XENON is not set
# CONFIG_SCSI_UFSHCD is not set
# CONFIG_MEMSTICK is not set
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
# CONFIG_LEDS_CLASS_FLASH is not set
# CONFIG_LEDS_CLASS_MULTICOLOR is not set
# CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set

#
# LED drivers
#
# CONFIG_LEDS_APU is not set
# CONFIG_LEDS_AW200XX is not set
CONFIG_LEDS_LM3530=m
# CONFIG_LEDS_LM3532 is not set
# CONFIG_LEDS_LM3642 is not set
# CONFIG_LEDS_PCA9532 is not set
# CONFIG_LEDS_GPIO is not set
CONFIG_LEDS_LP3944=m
# CONFIG_LEDS_LP3952 is not set
# CONFIG_LEDS_LP50XX is not set
# CONFIG_LEDS_PCA955X is not set
# CONFIG_LEDS_PCA963X is not set
# CONFIG_LEDS_DAC124S085 is not set
# CONFIG_LEDS_PWM is not set
# CONFIG_LEDS_BD2606MVV is not set
# CONFIG_LEDS_BD2802 is not set
CONFIG_LEDS_INTEL_SS4200=m
CONFIG_LEDS_LT3593=m
# CONFIG_LEDS_TCA6507 is not set
# CONFIG_LEDS_TLC591XX is not set
# CONFIG_LEDS_LM355x is not set
# CONFIG_LEDS_IS31FL319X is not set

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
CONFIG_LEDS_BLINKM=m
CONFIG_LEDS_MLXCPLD=m
# CONFIG_LEDS_MLXREG is not set
# CONFIG_LEDS_USER is not set
# CONFIG_LEDS_NIC78BX is not set

#
# Flash and Torch LED drivers
#

#
# RGB LED drivers
#

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
CONFIG_LEDS_TRIGGER_TIMER=m
CONFIG_LEDS_TRIGGER_ONESHOT=m
# CONFIG_LEDS_TRIGGER_DISK is not set
CONFIG_LEDS_TRIGGER_HEARTBEAT=m
CONFIG_LEDS_TRIGGER_BACKLIGHT=m
# CONFIG_LEDS_TRIGGER_CPU is not set
# CONFIG_LEDS_TRIGGER_ACTIVITY is not set
CONFIG_LEDS_TRIGGER_DEFAULT_ON=m

#
# iptables trigger is under Netfilter config (LED target)
#
CONFIG_LEDS_TRIGGER_TRANSIENT=m
CONFIG_LEDS_TRIGGER_CAMERA=m
# CONFIG_LEDS_TRIGGER_PANIC is not set
# CONFIG_LEDS_TRIGGER_NETDEV is not set
# CONFIG_LEDS_TRIGGER_PATTERN is not set
# CONFIG_LEDS_TRIGGER_AUDIO is not set
# CONFIG_LEDS_TRIGGER_TTY is not set

#
# Simple LED drivers
#
# CONFIG_ACCESSIBILITY is not set
# CONFIG_INFINIBAND is not set
CONFIG_EDAC_ATOMIC_SCRUB=y
CONFIG_EDAC_SUPPORT=y
CONFIG_EDAC=y
CONFIG_EDAC_LEGACY_SYSFS=y
# CONFIG_EDAC_DEBUG is not set
CONFIG_EDAC_GHES=y
CONFIG_EDAC_E752X=m
CONFIG_EDAC_I82975X=m
CONFIG_EDAC_I3000=m
CONFIG_EDAC_I3200=m
CONFIG_EDAC_IE31200=m
CONFIG_EDAC_X38=m
CONFIG_EDAC_I5400=m
CONFIG_EDAC_I7CORE=m
CONFIG_EDAC_I5100=m
CONFIG_EDAC_I7300=m
CONFIG_EDAC_SBRIDGE=m
CONFIG_EDAC_SKX=m
# CONFIG_EDAC_I10NM is not set
CONFIG_EDAC_PND2=m
# CONFIG_EDAC_IGEN6 is not set
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
CONFIG_RTC_INTF_DEV=y
# CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
# CONFIG_RTC_DRV_TEST is not set

#
# I2C RTC drivers
#
# CONFIG_RTC_DRV_ABB5ZES3 is not set
# CONFIG_RTC_DRV_ABEOZ9 is not set
# CONFIG_RTC_DRV_ABX80X is not set
CONFIG_RTC_DRV_DS1307=m
# CONFIG_RTC_DRV_DS1307_CENTURY is not set
CONFIG_RTC_DRV_DS1374=m
# CONFIG_RTC_DRV_DS1374_WDT is not set
CONFIG_RTC_DRV_DS1672=m
CONFIG_RTC_DRV_MAX6900=m
CONFIG_RTC_DRV_RS5C372=m
CONFIG_RTC_DRV_ISL1208=m
CONFIG_RTC_DRV_ISL12022=m
CONFIG_RTC_DRV_X1205=m
CONFIG_RTC_DRV_PCF8523=m
# CONFIG_RTC_DRV_PCF85063 is not set
# CONFIG_RTC_DRV_PCF85363 is not set
CONFIG_RTC_DRV_PCF8563=m
CONFIG_RTC_DRV_PCF8583=m
CONFIG_RTC_DRV_M41T80=m
CONFIG_RTC_DRV_M41T80_WDT=y
CONFIG_RTC_DRV_BQ32K=m
# CONFIG_RTC_DRV_S35390A is not set
CONFIG_RTC_DRV_FM3130=m
# CONFIG_RTC_DRV_RX8010 is not set
CONFIG_RTC_DRV_RX8581=m
CONFIG_RTC_DRV_RX8025=m
CONFIG_RTC_DRV_EM3027=m
# CONFIG_RTC_DRV_RV3028 is not set
# CONFIG_RTC_DRV_RV3032 is not set
# CONFIG_RTC_DRV_RV8803 is not set
# CONFIG_RTC_DRV_SD3078 is not set

#
# SPI RTC drivers
#
# CONFIG_RTC_DRV_M41T93 is not set
# CONFIG_RTC_DRV_M41T94 is not set
# CONFIG_RTC_DRV_DS1302 is not set
# CONFIG_RTC_DRV_DS1305 is not set
# CONFIG_RTC_DRV_DS1343 is not set
# CONFIG_RTC_DRV_DS1347 is not set
# CONFIG_RTC_DRV_DS1390 is not set
# CONFIG_RTC_DRV_MAX6916 is not set
# CONFIG_RTC_DRV_R9701 is not set
CONFIG_RTC_DRV_RX4581=m
# CONFIG_RTC_DRV_RS5C348 is not set
# CONFIG_RTC_DRV_MAX6902 is not set
# CONFIG_RTC_DRV_PCF2123 is not set
# CONFIG_RTC_DRV_MCP795 is not set
CONFIG_RTC_I2C_AND_SPI=y

#
# SPI and I2C RTC drivers
#
CONFIG_RTC_DRV_DS3232=m
CONFIG_RTC_DRV_DS3232_HWMON=y
# CONFIG_RTC_DRV_PCF2127 is not set
CONFIG_RTC_DRV_RV3029C2=m
# CONFIG_RTC_DRV_RV3029_HWMON is not set
# CONFIG_RTC_DRV_RX6110 is not set

#
# Platform RTC drivers
#
CONFIG_RTC_DRV_CMOS=y
CONFIG_RTC_DRV_DS1286=m
CONFIG_RTC_DRV_DS1511=m
CONFIG_RTC_DRV_DS1553=m
# CONFIG_RTC_DRV_DS1685_FAMILY is not set
CONFIG_RTC_DRV_DS1742=m
CONFIG_RTC_DRV_DS2404=m
CONFIG_RTC_DRV_STK17TA8=m
# CONFIG_RTC_DRV_M48T86 is not set
CONFIG_RTC_DRV_M48T35=m
CONFIG_RTC_DRV_M48T59=m
CONFIG_RTC_DRV_MSM6242=m
CONFIG_RTC_DRV_BQ4802=m
CONFIG_RTC_DRV_RP5C01=m

#
# on-CPU RTC drivers
#
# CONFIG_RTC_DRV_FTRTC010 is not set

#
# HID Sensor RTC drivers
#
# CONFIG_RTC_DRV_GOLDFISH is not set
CONFIG_DMADEVICES=y
# CONFIG_DMADEVICES_DEBUG is not set

#
# DMA Devices
#
CONFIG_DMA_ENGINE=y
CONFIG_DMA_VIRTUAL_CHANNELS=y
CONFIG_DMA_ACPI=y
# CONFIG_ALTERA_MSGDMA is not set
CONFIG_INTEL_IDMA64=m
# CONFIG_INTEL_IDXD is not set
# CONFIG_INTEL_IDXD_COMPAT is not set
CONFIG_INTEL_IOATDMA=m
# CONFIG_PLX_DMA is not set
# CONFIG_XILINX_XDMA is not set
# CONFIG_AMD_PTDMA is not set
# CONFIG_QCOM_HIDMA_MGMT is not set
# CONFIG_QCOM_HIDMA is not set
CONFIG_DW_DMAC_CORE=y
CONFIG_DW_DMAC=m
CONFIG_DW_DMAC_PCI=y
# CONFIG_DW_EDMA is not set
CONFIG_HSU_DMA=y
# CONFIG_SF_PDMA is not set
# CONFIG_INTEL_LDMA is not set

#
# DMA Clients
#
CONFIG_ASYNC_TX_DMA=y
CONFIG_DMATEST=m
CONFIG_DMA_ENGINE_RAID=y

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
# CONFIG_SW_SYNC is not set
# CONFIG_UDMABUF is not set
# CONFIG_DMABUF_MOVE_NOTIFY is not set
# CONFIG_DMABUF_DEBUG is not set
# CONFIG_DMABUF_SELFTESTS is not set
# CONFIG_DMABUF_HEAPS is not set
# CONFIG_DMABUF_SYSFS_STATS is not set
# end of DMABUF options

CONFIG_DCA=m
# CONFIG_AUXDISPLAY is not set
# CONFIG_PANEL is not set
# CONFIG_UIO is not set
CONFIG_VFIO=m
CONFIG_VFIO_CONTAINER=y
CONFIG_VFIO_IOMMU_TYPE1=m
CONFIG_VFIO_NOIOMMU=y
CONFIG_VFIO_VIRQFD=y

#
# VFIO support for PCI devices
#
CONFIG_VFIO_PCI_CORE=m
CONFIG_VFIO_PCI_MMAP=y
CONFIG_VFIO_PCI_INTX=y
CONFIG_VFIO_PCI=m
# CONFIG_VFIO_PCI_VGA is not set
# CONFIG_VFIO_PCI_IGD is not set
# end of VFIO support for PCI devices

CONFIG_IRQ_BYPASS_MANAGER=m
# CONFIG_VIRT_DRIVERS is not set
CONFIG_VIRTIO_ANCHOR=y
CONFIG_VIRTIO=y
CONFIG_VIRTIO_PCI_LIB=y
CONFIG_VIRTIO_PCI_LIB_LEGACY=y
CONFIG_VIRTIO_MENU=y
CONFIG_VIRTIO_PCI=y
CONFIG_VIRTIO_PCI_LEGACY=y
# CONFIG_VIRTIO_PMEM is not set
CONFIG_VIRTIO_BALLOON=m
# CONFIG_VIRTIO_MEM is not set
CONFIG_VIRTIO_INPUT=m
# CONFIG_VIRTIO_MMIO is not set
CONFIG_VIRTIO_DMA_SHARED_BUFFER=m
# CONFIG_VDPA is not set
CONFIG_VHOST_IOTLB=m
CONFIG_VHOST_TASK=y
CONFIG_VHOST=m
CONFIG_VHOST_MENU=y
CONFIG_VHOST_NET=m
CONFIG_VHOST_VSOCK=m
# CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set

#
# Microsoft Hyper-V guest support
#
CONFIG_HYPERV=y
# CONFIG_HYPERV_VTL_MODE is not set
CONFIG_HYPERV_TIMER=y
CONFIG_HYPERV_UTILS=m
CONFIG_HYPERV_BALLOON=m
# end of Microsoft Hyper-V guest support

# CONFIG_GREYBUS is not set
# CONFIG_COMEDI is not set
# CONFIG_STAGING is not set
# CONFIG_CHROME_PLATFORMS is not set
# CONFIG_MELLANOX_PLATFORM is not set
CONFIG_SURFACE_PLATFORMS=y
# CONFIG_SURFACE3_WMI is not set
# CONFIG_SURFACE_3_POWER_OPREGION is not set
# CONFIG_SURFACE_GPE is not set
# CONFIG_SURFACE_HOTPLUG is not set
# CONFIG_SURFACE_PRO3_BUTTON is not set
CONFIG_X86_PLATFORM_DEVICES=y
CONFIG_ACPI_WMI=m
CONFIG_WMI_BMOF=m
# CONFIG_HUAWEI_WMI is not set
# CONFIG_UV_SYSFS is not set
CONFIG_MXM_WMI=m
# CONFIG_NVIDIA_WMI_EC_BACKLIGHT is not set
# CONFIG_XIAOMI_WMI is not set
# CONFIG_GIGABYTE_WMI is not set
# CONFIG_YOGABOOK is not set
CONFIG_ACERHDF=m
# CONFIG_ACER_WIRELESS is not set
CONFIG_ACER_WMI=m
# CONFIG_ADV_SWBUTTON is not set
CONFIG_APPLE_GMUX=m
CONFIG_ASUS_LAPTOP=m
# CONFIG_ASUS_WIRELESS is not set
# CONFIG_ASUS_WMI is not set
# CONFIG_ASUS_TF103C_DOCK is not set
# CONFIG_MERAKI_MX100 is not set
CONFIG_EEEPC_LAPTOP=m
# CONFIG_X86_PLATFORM_DRIVERS_DELL is not set
CONFIG_AMILO_RFKILL=m
CONFIG_FUJITSU_LAPTOP=m
CONFIG_FUJITSU_TABLET=m
# CONFIG_GPD_POCKET_FAN is not set
# CONFIG_X86_PLATFORM_DRIVERS_HP is not set
# CONFIG_WIRELESS_HOTKEY is not set
# CONFIG_IBM_RTL is not set
CONFIG_IDEAPAD_LAPTOP=m
# CONFIG_LENOVO_YMC is not set
CONFIG_SENSORS_HDAPS=m
# CONFIG_THINKPAD_ACPI is not set
# CONFIG_THINKPAD_LMI is not set
# CONFIG_INTEL_ATOMISP2_PM is not set
# CONFIG_INTEL_IFS is not set
# CONFIG_INTEL_SAR_INT1092 is not set
CONFIG_INTEL_PMC_CORE=m

#
# Intel Speed Select Technology interface support
#
# CONFIG_INTEL_SPEED_SELECT_INTERFACE is not set
# end of Intel Speed Select Technology interface support

CONFIG_INTEL_WMI=y
# CONFIG_INTEL_WMI_SBL_FW_UPDATE is not set
CONFIG_INTEL_WMI_THUNDERBOLT=m

#
# Intel Uncore Frequency Control
#
# CONFIG_INTEL_UNCORE_FREQ_CONTROL is not set
# end of Intel Uncore Frequency Control

CONFIG_INTEL_HID_EVENT=m
CONFIG_INTEL_VBTN=m
# CONFIG_INTEL_INT0002_VGPIO is not set
CONFIG_INTEL_OAKTRAIL=m
# CONFIG_INTEL_PUNIT_IPC is not set
CONFIG_INTEL_RST=m
# CONFIG_INTEL_SMARTCONNECT is not set
CONFIG_INTEL_TURBO_MAX_3=y
# CONFIG_INTEL_VSEC is not set
# CONFIG_MSI_EC is not set
CONFIG_MSI_LAPTOP=m
CONFIG_MSI_WMI=m
# CONFIG_PCENGINES_APU2 is not set
# CONFIG_BARCO_P50_GPIO is not set
CONFIG_SAMSUNG_LAPTOP=m
CONFIG_SAMSUNG_Q10=m
CONFIG_TOSHIBA_BT_RFKILL=m
# CONFIG_TOSHIBA_HAPS is not set
# CONFIG_TOSHIBA_WMI is not set
CONFIG_ACPI_CMPC=m
CONFIG_COMPAL_LAPTOP=m
# CONFIG_LG_LAPTOP is not set
CONFIG_PANASONIC_LAPTOP=m
CONFIG_SONY_LAPTOP=m
CONFIG_SONYPI_COMPAT=y
# CONFIG_SYSTEM76_ACPI is not set
CONFIG_TOPSTAR_LAPTOP=m
# CONFIG_SERIAL_MULTI_INSTANTIATE is not set
CONFIG_MLX_PLATFORM=m
CONFIG_INTEL_IPS=m
# CONFIG_INTEL_SCU_PCI is not set
# CONFIG_INTEL_SCU_PLATFORM is not set
# CONFIG_SIEMENS_SIMATIC_IPC is not set
# CONFIG_WINMATE_FM07_KEYS is not set
CONFIG_P2SB=y
CONFIG_HAVE_CLK=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y
# CONFIG_LMK04832 is not set
# CONFIG_COMMON_CLK_MAX9485 is not set
# CONFIG_COMMON_CLK_SI5341 is not set
# CONFIG_COMMON_CLK_SI5351 is not set
# CONFIG_COMMON_CLK_SI544 is not set
# CONFIG_COMMON_CLK_CDCE706 is not set
# CONFIG_COMMON_CLK_CS2000_CP is not set
# CONFIG_COMMON_CLK_PWM is not set
# CONFIG_XILINX_VCU is not set
# CONFIG_HWSPINLOCK is not set

#
# Clock Source drivers
#
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

# CONFIG_IOMMU_DEBUGFS is not set
# CONFIG_IOMMU_DEFAULT_DMA_STRICT is not set
CONFIG_IOMMU_DEFAULT_DMA_LAZY=y
# CONFIG_IOMMU_DEFAULT_PASSTHROUGH is not set
CONFIG_IOMMU_DMA=y
# CONFIG_AMD_IOMMU is not set
CONFIG_DMAR_TABLE=y
CONFIG_INTEL_IOMMU=y
# CONFIG_INTEL_IOMMU_SVM is not set
# CONFIG_INTEL_IOMMU_DEFAULT_ON is not set
CONFIG_INTEL_IOMMU_FLOPPY_WA=y
CONFIG_INTEL_IOMMU_SCALABLE_MODE_DEFAULT_ON=y
CONFIG_INTEL_IOMMU_PERF_EVENTS=y
# CONFIG_IOMMUFD is not set
CONFIG_IRQ_REMAP=y
CONFIG_HYPERV_IOMMU=y
# CONFIG_VIRTIO_IOMMU is not set

#
# Remoteproc drivers
#
# CONFIG_REMOTEPROC is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
# CONFIG_RPMSG_QCOM_GLINK_RPM is not set
# CONFIG_RPMSG_VIRTIO is not set
# end of Rpmsg drivers

# CONFIG_SOUNDWIRE is not set

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

# CONFIG_WPCM450_SOC is not set

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

# CONFIG_PM_DEVFREQ is not set
# CONFIG_EXTCON is not set
# CONFIG_MEMORY is not set
# CONFIG_IIO is not set
CONFIG_NTB=m
# CONFIG_NTB_MSI is not set
# CONFIG_NTB_AMD is not set
# CONFIG_NTB_IDT is not set
# CONFIG_NTB_INTEL is not set
# CONFIG_NTB_EPF is not set
# CONFIG_NTB_SWITCHTEC is not set
# CONFIG_NTB_PINGPONG is not set
# CONFIG_NTB_TOOL is not set
# CONFIG_NTB_PERF is not set
# CONFIG_NTB_TRANSPORT is not set
CONFIG_PWM=y
CONFIG_PWM_SYSFS=y
# CONFIG_PWM_DEBUG is not set
# CONFIG_PWM_CLK is not set
# CONFIG_PWM_DWC is not set
CONFIG_PWM_LPSS=m
CONFIG_PWM_LPSS_PCI=m
CONFIG_PWM_LPSS_PLATFORM=m
# CONFIG_PWM_PCA9685 is not set

#
# IRQ chip support
#
# end of IRQ chip support

# CONFIG_IPACK_BUS is not set
# CONFIG_RESET_CONTROLLER is not set

#
# PHY Subsystem
#
# CONFIG_GENERIC_PHY is not set
# CONFIG_USB_LGM_PHY is not set
# CONFIG_PHY_CAN_TRANSCEIVER is not set

#
# PHY drivers for Broadcom platforms
#
# CONFIG_BCM_KONA_USB2_PHY is not set
# end of PHY drivers for Broadcom platforms

# CONFIG_PHY_PXA_28NM_HSIC is not set
# CONFIG_PHY_PXA_28NM_USB2 is not set
# CONFIG_PHY_INTEL_LGM_EMMC is not set
# end of PHY Subsystem

CONFIG_POWERCAP=y
CONFIG_INTEL_RAPL_CORE=m
CONFIG_INTEL_RAPL=m
CONFIG_IDLE_INJECT=y
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

CONFIG_LIBNVDIMM=m
CONFIG_BLK_DEV_PMEM=m
CONFIG_ND_CLAIM=y
CONFIG_ND_BTT=m
CONFIG_BTT=y
CONFIG_ND_PFN=m
CONFIG_NVDIMM_PFN=y
CONFIG_NVDIMM_DAX=y
CONFIG_NVDIMM_KEYS=y
# CONFIG_NVDIMM_SECURITY_TEST is not set
CONFIG_DAX=y
CONFIG_DEV_DAX=m
CONFIG_DEV_DAX_PMEM=m
CONFIG_DEV_DAX_HMEM=m
CONFIG_DEV_DAX_HMEM_DEVICES=y
CONFIG_DEV_DAX_KMEM=m
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y

#
# Layout Types
#
# CONFIG_NVMEM_LAYOUT_SL28_VPD is not set
# CONFIG_NVMEM_LAYOUT_ONIE_TLV is not set
# end of Layout Types

# CONFIG_NVMEM_RMEM is not set

#
# HW tracing support
#
# CONFIG_STM is not set
# CONFIG_INTEL_TH is not set
# end of HW tracing support

# CONFIG_FPGA is not set
# CONFIG_SIOX is not set
# CONFIG_SLIMBUS is not set
# CONFIG_INTERCONNECT is not set
# CONFIG_COUNTER is not set
# CONFIG_MOST is not set
# CONFIG_PECI is not set
# CONFIG_HTE is not set
# end of Device Drivers

#
# File systems
#
CONFIG_DCACHE_WORD_ACCESS=y
# CONFIG_VALIDATE_FS_PARSER is not set
CONFIG_FS_IOMAP=y
CONFIG_LEGACY_DIRECT_IO=y
CONFIG_EXT2_FS=m
# CONFIG_EXT2_FS_XATTR is not set
# CONFIG_EXT3_FS is not set
CONFIG_EXT4_FS=y
CONFIG_EXT4_FS_POSIX_ACL=y
CONFIG_EXT4_FS_SECURITY=y
# CONFIG_EXT4_DEBUG is not set
CONFIG_JBD2=y
# CONFIG_JBD2_DEBUG is not set
CONFIG_FS_MBCACHE=y
# CONFIG_REISERFS_FS is not set
# CONFIG_JFS_FS is not set
CONFIG_XFS_FS=m
CONFIG_XFS_SUPPORT_V4=y
CONFIG_XFS_SUPPORT_ASCII_CI=y
CONFIG_XFS_QUOTA=y
CONFIG_XFS_POSIX_ACL=y
CONFIG_XFS_RT=y
CONFIG_XFS_DRAIN_INTENTS=y
CONFIG_XFS_ONLINE_SCRUB=y
# CONFIG_XFS_ONLINE_REPAIR is not set
CONFIG_XFS_WARN=y
# CONFIG_XFS_DEBUG is not set
# CONFIG_GFS2_FS is not set
CONFIG_OCFS2_FS=m
CONFIG_OCFS2_FS_O2CB=m
CONFIG_OCFS2_FS_STATS=y
# CONFIG_OCFS2_DEBUG_MASKLOG is not set
# CONFIG_OCFS2_DEBUG_FS is not set
CONFIG_BTRFS_FS=m
CONFIG_BTRFS_FS_POSIX_ACL=y
# CONFIG_BTRFS_FS_CHECK_INTEGRITY is not set
# CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
# CONFIG_BTRFS_DEBUG is not set
# CONFIG_BTRFS_ASSERT is not set
# CONFIG_BTRFS_FS_REF_VERIFY is not set
# CONFIG_NILFS2_FS is not set
CONFIG_F2FS_FS=m
CONFIG_F2FS_STAT_FS=y
CONFIG_F2FS_FS_XATTR=y
CONFIG_F2FS_FS_POSIX_ACL=y
# CONFIG_F2FS_FS_SECURITY is not set
# CONFIG_F2FS_CHECK_FS is not set
# CONFIG_F2FS_FAULT_INJECTION is not set
# CONFIG_F2FS_FS_COMPRESSION is not set
CONFIG_F2FS_IOSTAT=y
# CONFIG_F2FS_UNFAIR_RWSEM is not set
CONFIG_FS_DAX=y
CONFIG_FS_DAX_PMD=y
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
CONFIG_EXPORTFS_BLOCK_OPS=y
CONFIG_FILE_LOCKING=y
CONFIG_FS_ENCRYPTION=y
CONFIG_FS_ENCRYPTION_ALGS=y
# CONFIG_FS_VERITY is not set
CONFIG_FSNOTIFY=y
CONFIG_DNOTIFY=y
CONFIG_INOTIFY_USER=y
CONFIG_FANOTIFY=y
CONFIG_FANOTIFY_ACCESS_PERMISSIONS=y
CONFIG_QUOTA=y
CONFIG_QUOTA_NETLINK_INTERFACE=y
# CONFIG_QUOTA_DEBUG is not set
CONFIG_QUOTA_TREE=y
# CONFIG_QFMT_V1 is not set
CONFIG_QFMT_V2=y
CONFIG_QUOTACTL=y
CONFIG_AUTOFS4_FS=y
CONFIG_AUTOFS_FS=y
CONFIG_FUSE_FS=m
CONFIG_CUSE=m
# CONFIG_VIRTIO_FS is not set
CONFIG_OVERLAY_FS=m
# CONFIG_OVERLAY_FS_REDIRECT_DIR is not set
# CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW is not set
# CONFIG_OVERLAY_FS_INDEX is not set
# CONFIG_OVERLAY_FS_XINO_AUTO is not set
# CONFIG_OVERLAY_FS_METACOPY is not set

#
# Caches
#
CONFIG_NETFS_SUPPORT=m
# CONFIG_NETFS_STATS is not set
# CONFIG_FSCACHE is not set
# end of Caches

#
# CD-ROM/DVD Filesystems
#
# CONFIG_ISO9660_FS is not set
CONFIG_UDF_FS=m
# end of CD-ROM/DVD Filesystems

#
# DOS/FAT/EXFAT/NT Filesystems
#
CONFIG_FAT_FS=m
CONFIG_MSDOS_FS=m
CONFIG_VFAT_FS=m
CONFIG_FAT_DEFAULT_CODEPAGE=437
CONFIG_FAT_DEFAULT_IOCHARSET="ascii"
# CONFIG_FAT_DEFAULT_UTF8 is not set
# CONFIG_EXFAT_FS is not set
# CONFIG_NTFS_FS is not set
# CONFIG_NTFS3_FS is not set
# end of DOS/FAT/EXFAT/NT Filesystems

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
CONFIG_PROC_KCORE=y
CONFIG_PROC_VMCORE=y
CONFIG_PROC_VMCORE_DEVICE_DUMP=y
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
CONFIG_PROC_CHILDREN=y
CONFIG_PROC_PID_ARCH_STATUS=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
CONFIG_TMPFS_POSIX_ACL=y
CONFIG_TMPFS_XATTR=y
# CONFIG_TMPFS_INODE64 is not set
CONFIG_HUGETLBFS=y
CONFIG_HUGETLB_PAGE=y
CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP=y
# CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON is not set
CONFIG_MEMFD_CREATE=y
CONFIG_ARCH_HAS_GIGANTIC_PAGE=y
CONFIG_CONFIGFS_FS=y
CONFIG_EFIVAR_FS=y
# end of Pseudo filesystems

CONFIG_MISC_FILESYSTEMS=y
# CONFIG_ORANGEFS_FS is not set
# CONFIG_ADFS_FS is not set
# CONFIG_AFFS_FS is not set
# CONFIG_ECRYPT_FS is not set
# CONFIG_HFS_FS is not set
# CONFIG_HFSPLUS_FS is not set
# CONFIG_BEFS_FS is not set
# CONFIG_BFS_FS is not set
# CONFIG_EFS_FS is not set
CONFIG_CRAMFS=m
CONFIG_CRAMFS_BLOCKDEV=y
CONFIG_SQUASHFS=m
# CONFIG_SQUASHFS_FILE_CACHE is not set
CONFIG_SQUASHFS_FILE_DIRECT=y
CONFIG_SQUASHFS_DECOMP_SINGLE=y
# CONFIG_SQUASHFS_CHOICE_DECOMP_BY_MOUNT is not set
CONFIG_SQUASHFS_COMPILE_DECOMP_SINGLE=y
# CONFIG_SQUASHFS_COMPILE_DECOMP_MULTI is not set
# CONFIG_SQUASHFS_COMPILE_DECOMP_MULTI_PERCPU is not set
CONFIG_SQUASHFS_XATTR=y
CONFIG_SQUASHFS_ZLIB=y
# CONFIG_SQUASHFS_LZ4 is not set
CONFIG_SQUASHFS_LZO=y
CONFIG_SQUASHFS_XZ=y
# CONFIG_SQUASHFS_ZSTD is not set
# CONFIG_SQUASHFS_4K_DEVBLK_SIZE is not set
# CONFIG_SQUASHFS_EMBEDDED is not set
CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3
# CONFIG_VXFS_FS is not set
# CONFIG_MINIX_FS is not set
# CONFIG_OMFS_FS is not set
# CONFIG_HPFS_FS is not set
# CONFIG_QNX4FS_FS is not set
# CONFIG_QNX6FS_FS is not set
# CONFIG_ROMFS_FS is not set
CONFIG_PSTORE=y
CONFIG_PSTORE_DEFAULT_KMSG_BYTES=10240
CONFIG_PSTORE_DEFLATE_COMPRESS=y
# CONFIG_PSTORE_LZO_COMPRESS is not set
# CONFIG_PSTORE_LZ4_COMPRESS is not set
# CONFIG_PSTORE_LZ4HC_COMPRESS is not set
# CONFIG_PSTORE_842_COMPRESS is not set
# CONFIG_PSTORE_ZSTD_COMPRESS is not set
CONFIG_PSTORE_COMPRESS=y
CONFIG_PSTORE_DEFLATE_COMPRESS_DEFAULT=y
CONFIG_PSTORE_COMPRESS_DEFAULT="deflate"
# CONFIG_PSTORE_CONSOLE is not set
# CONFIG_PSTORE_PMSG is not set
# CONFIG_PSTORE_FTRACE is not set
CONFIG_PSTORE_RAM=m
# CONFIG_PSTORE_BLK is not set
# CONFIG_SYSV_FS is not set
# CONFIG_UFS_FS is not set
# CONFIG_EROFS_FS is not set
CONFIG_NETWORK_FILESYSTEMS=y
CONFIG_NFS_FS=y
# CONFIG_NFS_V2 is not set
CONFIG_NFS_V3=y
CONFIG_NFS_V3_ACL=y
CONFIG_NFS_V4=m
# CONFIG_NFS_SWAP is not set
CONFIG_NFS_V4_1=y
CONFIG_NFS_V4_2=y
CONFIG_PNFS_FILE_LAYOUT=m
CONFIG_PNFS_BLOCK=m
CONFIG_PNFS_FLEXFILE_LAYOUT=m
CONFIG_NFS_V4_1_IMPLEMENTATION_ID_DOMAIN="kernel.org"
# CONFIG_NFS_V4_1_MIGRATION is not set
CONFIG_NFS_V4_SECURITY_LABEL=y
CONFIG_ROOT_NFS=y
# CONFIG_NFS_USE_LEGACY_DNS is not set
CONFIG_NFS_USE_KERNEL_DNS=y
CONFIG_NFS_DISABLE_UDP_SUPPORT=y
# CONFIG_NFS_V4_2_READ_PLUS is not set
CONFIG_NFSD=m
# CONFIG_NFSD_V2 is not set
CONFIG_NFSD_V3_ACL=y
CONFIG_NFSD_V4=y
CONFIG_NFSD_PNFS=y
# CONFIG_NFSD_BLOCKLAYOUT is not set
CONFIG_NFSD_SCSILAYOUT=y
# CONFIG_NFSD_FLEXFILELAYOUT is not set
# CONFIG_NFSD_V4_2_INTER_SSC is not set
CONFIG_NFSD_V4_SECURITY_LABEL=y
CONFIG_GRACE_PERIOD=y
CONFIG_LOCKD=y
CONFIG_LOCKD_V4=y
CONFIG_NFS_ACL_SUPPORT=y
CONFIG_NFS_COMMON=y
CONFIG_NFS_V4_2_SSC_HELPER=y
CONFIG_SUNRPC=y
CONFIG_SUNRPC_GSS=m
CONFIG_SUNRPC_BACKCHANNEL=y
CONFIG_RPCSEC_GSS_KRB5=m
CONFIG_RPCSEC_GSS_KRB5_CRYPTOSYSTEM=y
# CONFIG_RPCSEC_GSS_KRB5_ENCTYPES_DES is not set
CONFIG_RPCSEC_GSS_KRB5_ENCTYPES_AES_SHA1=y
# CONFIG_RPCSEC_GSS_KRB5_ENCTYPES_CAMELLIA is not set
# CONFIG_RPCSEC_GSS_KRB5_ENCTYPES_AES_SHA2 is not set
# CONFIG_SUNRPC_DEBUG is not set
# CONFIG_CEPH_FS is not set
CONFIG_CIFS=m
CONFIG_CIFS_STATS2=y
CONFIG_CIFS_ALLOW_INSECURE_LEGACY=y
CONFIG_CIFS_UPCALL=y
CONFIG_CIFS_XATTR=y
CONFIG_CIFS_POSIX=y
# CONFIG_CIFS_DEBUG is not set
CONFIG_CIFS_DFS_UPCALL=y
# CONFIG_CIFS_SWN_UPCALL is not set
# CONFIG_SMB_SERVER is not set
CONFIG_SMBFS=m
# CONFIG_CODA_FS is not set
# CONFIG_AFS_FS is not set
# CONFIG_9P_FS is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="utf8"
CONFIG_NLS_CODEPAGE_437=y
CONFIG_NLS_CODEPAGE_737=m
CONFIG_NLS_CODEPAGE_775=m
CONFIG_NLS_CODEPAGE_850=m
CONFIG_NLS_CODEPAGE_852=m
CONFIG_NLS_CODEPAGE_855=m
CONFIG_NLS_CODEPAGE_857=m
CONFIG_NLS_CODEPAGE_860=m
CONFIG_NLS_CODEPAGE_861=m
CONFIG_NLS_CODEPAGE_862=m
CONFIG_NLS_CODEPAGE_863=m
CONFIG_NLS_CODEPAGE_864=m
CONFIG_NLS_CODEPAGE_865=m
CONFIG_NLS_CODEPAGE_866=m
CONFIG_NLS_CODEPAGE_869=m
CONFIG_NLS_CODEPAGE_936=m
CONFIG_NLS_CODEPAGE_950=m
CONFIG_NLS_CODEPAGE_932=m
CONFIG_NLS_CODEPAGE_949=m
CONFIG_NLS_CODEPAGE_874=m
CONFIG_NLS_ISO8859_8=m
CONFIG_NLS_CODEPAGE_1250=m
CONFIG_NLS_CODEPAGE_1251=m
CONFIG_NLS_ASCII=y
CONFIG_NLS_ISO8859_1=m
CONFIG_NLS_ISO8859_2=m
CONFIG_NLS_ISO8859_3=m
CONFIG_NLS_ISO8859_4=m
CONFIG_NLS_ISO8859_5=m
CONFIG_NLS_ISO8859_6=m
CONFIG_NLS_ISO8859_7=m
CONFIG_NLS_ISO8859_9=m
CONFIG_NLS_ISO8859_13=m
CONFIG_NLS_ISO8859_14=m
CONFIG_NLS_ISO8859_15=m
CONFIG_NLS_KOI8_R=m
CONFIG_NLS_KOI8_U=m
CONFIG_NLS_MAC_ROMAN=m
CONFIG_NLS_MAC_CELTIC=m
CONFIG_NLS_MAC_CENTEURO=m
CONFIG_NLS_MAC_CROATIAN=m
CONFIG_NLS_MAC_CYRILLIC=m
CONFIG_NLS_MAC_GAELIC=m
CONFIG_NLS_MAC_GREEK=m
CONFIG_NLS_MAC_ICELAND=m
CONFIG_NLS_MAC_INUIT=m
CONFIG_NLS_MAC_ROMANIAN=m
CONFIG_NLS_MAC_TURKISH=m
CONFIG_NLS_UTF8=m
# CONFIG_DLM is not set
# CONFIG_UNICODE is not set
CONFIG_IO_WQ=y
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
# CONFIG_KEYS_REQUEST_CACHE is not set
CONFIG_PERSISTENT_KEYRINGS=y
CONFIG_TRUSTED_KEYS=y
CONFIG_TRUSTED_KEYS_TPM=y
CONFIG_ENCRYPTED_KEYS=y
# CONFIG_USER_DECRYPTED_DATA is not set
# CONFIG_KEY_DH_OPERATIONS is not set
# CONFIG_SECURITY_DMESG_RESTRICT is not set
CONFIG_SECURITY=y
CONFIG_SECURITYFS=y
CONFIG_SECURITY_NETWORK=y
CONFIG_SECURITY_NETWORK_XFRM=y
CONFIG_SECURITY_PATH=y
CONFIG_INTEL_TXT=y
CONFIG_LSM_MMAP_MIN_ADDR=65535
CONFIG_HARDENED_USERCOPY=y
CONFIG_FORTIFY_SOURCE=y
# CONFIG_STATIC_USERMODEHELPER is not set
CONFIG_SECURITY_SELINUX=y
CONFIG_SECURITY_SELINUX_BOOTPARAM=y
CONFIG_SECURITY_SELINUX_DEVELOP=y
CONFIG_SECURITY_SELINUX_AVC_STATS=y
CONFIG_SECURITY_SELINUX_SIDTAB_HASH_BITS=9
CONFIG_SECURITY_SELINUX_SID2STR_CACHE_SIZE=256
# CONFIG_SECURITY_SMACK is not set
# CONFIG_SECURITY_TOMOYO is not set
CONFIG_SECURITY_APPARMOR=y
# CONFIG_SECURITY_APPARMOR_DEBUG is not set
CONFIG_SECURITY_APPARMOR_INTROSPECT_POLICY=y
CONFIG_SECURITY_APPARMOR_HASH=y
CONFIG_SECURITY_APPARMOR_HASH_DEFAULT=y
CONFIG_SECURITY_APPARMOR_EXPORT_BINARY=y
CONFIG_SECURITY_APPARMOR_PARANOID_LOAD=y
# CONFIG_SECURITY_LOADPIN is not set
CONFIG_SECURITY_YAMA=y
# CONFIG_SECURITY_SAFESETID is not set
# CONFIG_SECURITY_LOCKDOWN_LSM is not set
# CONFIG_SECURITY_LANDLOCK is not set
CONFIG_INTEGRITY=y
CONFIG_INTEGRITY_SIGNATURE=y
CONFIG_INTEGRITY_ASYMMETRIC_KEYS=y
CONFIG_INTEGRITY_TRUSTED_KEYRING=y
# CONFIG_INTEGRITY_PLATFORM_KEYRING is not set
CONFIG_INTEGRITY_AUDIT=y
# CONFIG_IMA is not set
# CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT is not set
# CONFIG_EVM is not set
CONFIG_DEFAULT_SECURITY_SELINUX=y
# CONFIG_DEFAULT_SECURITY_APPARMOR is not set
# CONFIG_DEFAULT_SECURITY_DAC is not set
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,selinux,smack,tomoyo,apparmor,bpf"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_CC_HAS_AUTO_VAR_INIT_PATTERN=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO_BARE=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO=y
# CONFIG_INIT_STACK_NONE is not set
# CONFIG_INIT_STACK_ALL_PATTERN is not set
CONFIG_INIT_STACK_ALL_ZERO=y
# CONFIG_GCC_PLUGIN_STACKLEAK is not set
# CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
# CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
CONFIG_CC_HAS_ZERO_CALL_USED_REGS=y
# CONFIG_ZERO_CALL_USED_REGS is not set
# end of Memory initialization

CONFIG_RANDSTRUCT_NONE=y
# CONFIG_RANDSTRUCT_FULL is not set
# CONFIG_RANDSTRUCT_PERFORMANCE is not set
# end of Kernel hardening options
# end of Security options

CONFIG_XOR_BLOCKS=m
CONFIG_ASYNC_CORE=m
CONFIG_ASYNC_MEMCPY=m
CONFIG_ASYNC_XOR=m
CONFIG_ASYNC_PQ=m
CONFIG_ASYNC_RAID6_RECOV=m
CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_SIG2=y
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
CONFIG_CRYPTO_KPP=m
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
CONFIG_CRYPTO_USER=m
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
CONFIG_CRYPTO_PCRYPT=m
CONFIG_CRYPTO_CRYPTD=y
CONFIG_CRYPTO_AUTHENC=m
# CONFIG_CRYPTO_TEST is not set
CONFIG_CRYPTO_SIMD=y
# end of Crypto core or helper

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=m
# CONFIG_CRYPTO_DH_RFC7919_GROUPS is not set
CONFIG_CRYPTO_ECC=m
CONFIG_CRYPTO_ECDH=m
# CONFIG_CRYPTO_ECDSA is not set
# CONFIG_CRYPTO_ECRDSA is not set
# CONFIG_CRYPTO_SM2 is not set
# CONFIG_CRYPTO_CURVE25519 is not set
# end of Public-key cryptography

#
# Block ciphers
#
CONFIG_CRYPTO_AES=y
# CONFIG_CRYPTO_AES_TI is not set
CONFIG_CRYPTO_ANUBIS=m
# CONFIG_CRYPTO_ARIA is not set
CONFIG_CRYPTO_BLOWFISH=m
CONFIG_CRYPTO_BLOWFISH_COMMON=m
CONFIG_CRYPTO_CAMELLIA=m
CONFIG_CRYPTO_CAST_COMMON=m
CONFIG_CRYPTO_CAST5=m
CONFIG_CRYPTO_CAST6=m
CONFIG_CRYPTO_DES=m
CONFIG_CRYPTO_FCRYPT=m
CONFIG_CRYPTO_KHAZAD=m
CONFIG_CRYPTO_SEED=m
CONFIG_CRYPTO_SERPENT=m
CONFIG_CRYPTO_SM4=m
CONFIG_CRYPTO_SM4_GENERIC=m
CONFIG_CRYPTO_TEA=m
CONFIG_CRYPTO_TWOFISH=m
CONFIG_CRYPTO_TWOFISH_COMMON=m
# end of Block ciphers

#
# Length-preserving ciphers and modes
#
# CONFIG_CRYPTO_ADIANTUM is not set
CONFIG_CRYPTO_ARC4=m
CONFIG_CRYPTO_CHACHA20=m
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CFB=y
CONFIG_CRYPTO_CTR=y
CONFIG_CRYPTO_CTS=m
CONFIG_CRYPTO_ECB=y
# CONFIG_CRYPTO_HCTR2 is not set
# CONFIG_CRYPTO_KEYWRAP is not set
CONFIG_CRYPTO_LRW=m
CONFIG_CRYPTO_OFB=m
CONFIG_CRYPTO_PCBC=m
CONFIG_CRYPTO_XTS=m
# end of Length-preserving ciphers and modes

#
# AEAD (authenticated encryption with associated data) ciphers
#
# CONFIG_CRYPTO_AEGIS128 is not set
# CONFIG_CRYPTO_CHACHA20POLY1305 is not set
CONFIG_CRYPTO_CCM=m
CONFIG_CRYPTO_GCM=y
CONFIG_CRYPTO_GENIV=y
CONFIG_CRYPTO_SEQIV=y
CONFIG_CRYPTO_ECHAINIV=m
CONFIG_CRYPTO_ESSIV=m
# end of AEAD (authenticated encryption with associated data) ciphers

#
# Hashes, digests, and MACs
#
CONFIG_CRYPTO_BLAKE2B=m
CONFIG_CRYPTO_CMAC=m
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_MD4=m
CONFIG_CRYPTO_MD5=y
CONFIG_CRYPTO_MICHAEL_MIC=m
# CONFIG_CRYPTO_POLY1305 is not set
CONFIG_CRYPTO_RMD160=m
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
CONFIG_CRYPTO_SHA3=y
# CONFIG_CRYPTO_SM3_GENERIC is not set
# CONFIG_CRYPTO_STREEBOG is not set
CONFIG_CRYPTO_VMAC=m
CONFIG_CRYPTO_WP512=m
CONFIG_CRYPTO_XCBC=m
CONFIG_CRYPTO_XXHASH=m
# end of Hashes, digests, and MACs

#
# CRCs (cyclic redundancy checks)
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32=m
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_CRC64_ROCKSOFT=m
# end of CRCs (cyclic redundancy checks)

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=y
CONFIG_CRYPTO_LZO=y
# CONFIG_CRYPTO_842 is not set
# CONFIG_CRYPTO_LZ4 is not set
# CONFIG_CRYPTO_LZ4HC is not set
# CONFIG_CRYPTO_ZSTD is not set
# end of Compression

#
# Random number generation
#
CONFIG_CRYPTO_ANSI_CPRNG=m
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
CONFIG_CRYPTO_DRBG_HASH=y
CONFIG_CRYPTO_DRBG_CTR=y
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
# CONFIG_CRYPTO_JITTERENTROPY_TESTINTERFACE is not set
# end of Random number generation

#
# Userspace interface
#
CONFIG_CRYPTO_USER_API=y
# CONFIG_CRYPTO_USER_API_HASH is not set
CONFIG_CRYPTO_USER_API_SKCIPHER=y
CONFIG_CRYPTO_USER_API_RNG=y
# CONFIG_CRYPTO_USER_API_RNG_CAVP is not set
CONFIG_CRYPTO_USER_API_AEAD=y
CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE=y
# CONFIG_CRYPTO_STATS is not set
# end of Userspace interface

CONFIG_CRYPTO_HASH_INFO=y

#
# Accelerated Cryptographic Algorithms for CPU (x86)
#
# CONFIG_CRYPTO_CURVE25519_X86 is not set
CONFIG_CRYPTO_AES_NI_INTEL=y
CONFIG_CRYPTO_BLOWFISH_X86_64=m
CONFIG_CRYPTO_CAMELLIA_X86_64=m
CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=m
CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64=m
CONFIG_CRYPTO_CAST5_AVX_X86_64=m
CONFIG_CRYPTO_CAST6_AVX_X86_64=m
# CONFIG_CRYPTO_DES3_EDE_X86_64 is not set
CONFIG_CRYPTO_SERPENT_SSE2_X86_64=m
CONFIG_CRYPTO_SERPENT_AVX_X86_64=m
CONFIG_CRYPTO_SERPENT_AVX2_X86_64=m
# CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64 is not set
# CONFIG_CRYPTO_SM4_AESNI_AVX2_X86_64 is not set
CONFIG_CRYPTO_TWOFISH_X86_64=m
CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=m
CONFIG_CRYPTO_TWOFISH_AVX_X86_64=m
# CONFIG_CRYPTO_ARIA_AESNI_AVX_X86_64 is not set
# CONFIG_CRYPTO_ARIA_AESNI_AVX2_X86_64 is not set
# CONFIG_CRYPTO_ARIA_GFNI_AVX512_X86_64 is not set
CONFIG_CRYPTO_CHACHA20_X86_64=m
# CONFIG_CRYPTO_AEGIS128_AESNI_SSE2 is not set
# CONFIG_CRYPTO_NHPOLY1305_SSE2 is not set
# CONFIG_CRYPTO_NHPOLY1305_AVX2 is not set
# CONFIG_CRYPTO_BLAKE2S_X86 is not set
# CONFIG_CRYPTO_POLYVAL_CLMUL_NI is not set
# CONFIG_CRYPTO_POLY1305_X86_64 is not set
CONFIG_CRYPTO_SHA1_SSSE3=y
CONFIG_CRYPTO_SHA256_SSSE3=y
CONFIG_CRYPTO_SHA512_SSSE3=m
# CONFIG_CRYPTO_SM3_AVX_X86_64 is not set
CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL=m
CONFIG_CRYPTO_CRC32C_INTEL=m
CONFIG_CRYPTO_CRC32_PCLMUL=m
CONFIG_CRYPTO_CRCT10DIF_PCLMUL=m
# end of Accelerated Cryptographic Algorithms for CPU (x86)

# CONFIG_CRYPTO_HW is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
CONFIG_X509_CERTIFICATE_PARSER=y
# CONFIG_PKCS8_PRIVATE_KEY_PARSER is not set
CONFIG_PKCS7_MESSAGE_PARSER=y
# CONFIG_PKCS7_TEST_KEY is not set
CONFIG_SIGNED_PE_FILE_VERIFICATION=y
# CONFIG_FIPS_SIGNATURE_SELFTEST is not set

#
# Certificates for signature checking
#
CONFIG_MODULE_SIG_KEY="certs/signing_key.pem"
CONFIG_MODULE_SIG_KEY_TYPE_RSA=y
# CONFIG_MODULE_SIG_KEY_TYPE_ECDSA is not set
CONFIG_SYSTEM_TRUSTED_KEYRING=y
CONFIG_SYSTEM_TRUSTED_KEYS=""
# CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
# CONFIG_SECONDARY_TRUSTED_KEYRING is not set
CONFIG_SYSTEM_BLACKLIST_KEYRING=y
CONFIG_SYSTEM_BLACKLIST_HASH_LIST=""
# CONFIG_SYSTEM_REVOCATION_LIST is not set
# CONFIG_SYSTEM_BLACKLIST_AUTH_UPDATE is not set
# end of Certificates for signature checking

CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_RAID6_PQ=m
CONFIG_RAID6_PQ_BENCHMARK=y
# CONFIG_PACKING is not set
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
CONFIG_CORDIC=m
# CONFIG_PRIME_NUMBERS is not set
CONFIG_RATIONAL=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_GENERIC_IOMAP=y
CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y
CONFIG_ARCH_HAS_FAST_MULTIPLIER=y
CONFIG_ARCH_USE_SYM_ANNOTATIONS=y

#
# Crypto library routines
#
CONFIG_CRYPTO_LIB_UTILS=y
CONFIG_CRYPTO_LIB_AES=y
CONFIG_CRYPTO_LIB_ARC4=m
CONFIG_CRYPTO_LIB_GF128MUL=y
CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
CONFIG_CRYPTO_ARCH_HAVE_LIB_CHACHA=m
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=m
# CONFIG_CRYPTO_LIB_CHACHA is not set
# CONFIG_CRYPTO_LIB_CURVE25519 is not set
CONFIG_CRYPTO_LIB_DES=m
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=11
# CONFIG_CRYPTO_LIB_POLY1305 is not set
# CONFIG_CRYPTO_LIB_CHACHA20POLY1305 is not set
CONFIG_CRYPTO_LIB_SHA1=y
CONFIG_CRYPTO_LIB_SHA256=y
# end of Crypto library routines

CONFIG_CRC_CCITT=y
CONFIG_CRC16=y
CONFIG_CRC_T10DIF=y
CONFIG_CRC64_ROCKSOFT=m
CONFIG_CRC_ITU_T=m
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
CONFIG_CRC32_SLICEBY8=y
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
# CONFIG_CRC32_BIT is not set
CONFIG_CRC64=m
# CONFIG_CRC4 is not set
CONFIG_CRC7=m
CONFIG_LIBCRC32C=m
CONFIG_CRC8=m
CONFIG_XXHASH=y
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_COMPRESS=y
CONFIG_LZO_DECOMPRESS=y
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
CONFIG_DECOMPRESS_BZIP2=y
CONFIG_DECOMPRESS_LZMA=y
CONFIG_DECOMPRESS_XZ=y
CONFIG_DECOMPRESS_LZO=y
CONFIG_DECOMPRESS_LZ4=y
CONFIG_DECOMPRESS_ZSTD=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_REED_SOLOMON=m
CONFIG_REED_SOLOMON_ENC8=y
CONFIG_REED_SOLOMON_DEC8=y
CONFIG_TEXTSEARCH=y
CONFIG_TEXTSEARCH_KMP=m
CONFIG_TEXTSEARCH_BM=m
CONFIG_TEXTSEARCH_FSM=m
CONFIG_INTERVAL_TREE=y
CONFIG_XARRAY_MULTI=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_DMA_OPS=y
CONFIG_NEED_SG_DMA_FLAGS=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_ARCH_DMA_ADDR_T_64BIT=y
CONFIG_SWIOTLB=y
# CONFIG_DMA_API_DEBUG is not set
# CONFIG_DMA_MAP_BENCHMARK is not set
CONFIG_SGL_ALLOC=y
CONFIG_CHECK_SIGNATURE=y
CONFIG_CPUMASK_OFFSTACK=y
# CONFIG_FORCE_NR_CPUS is not set
CONFIG_CPU_RMAP=y
CONFIG_DQL=y
CONFIG_GLOB=y
# CONFIG_GLOB_SELFTEST is not set
CONFIG_NLATTR=y
CONFIG_CLZ_TAB=y
CONFIG_IRQ_POLL=y
CONFIG_MPILIB=y
CONFIG_SIGNATURE=y
CONFIG_OID_REGISTRY=y
CONFIG_UCS2_STRING=y
CONFIG_HAVE_GENERIC_VDSO=y
CONFIG_GENERIC_GETTIMEOFDAY=y
CONFIG_GENERIC_VDSO_TIME_NS=y
CONFIG_FONT_SUPPORT=y
# CONFIG_FONTS is not set
CONFIG_FONT_8x8=y
CONFIG_FONT_8x16=y
CONFIG_SG_POOL=y
CONFIG_ARCH_HAS_PMEM_API=y
CONFIG_MEMREGION=y
CONFIG_ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION=y
CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=y
CONFIG_ARCH_HAS_COPY_MC=y
CONFIG_ARCH_STACKWALK=y
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
# CONFIG_STACKTRACE_BUILD_ID is not set
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
CONFIG_BOOT_PRINTK_DELAY=y
CONFIG_DYNAMIC_DEBUG=y
CONFIG_DYNAMIC_DEBUG_CORE=y
CONFIG_SYMBOLIC_ERRNAME=y
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
# CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT is not set
CONFIG_DEBUG_INFO_DWARF4=y
# CONFIG_DEBUG_INFO_DWARF5 is not set
CONFIG_DEBUG_INFO_REDUCED=y
CONFIG_DEBUG_INFO_COMPRESSED_NONE=y
# CONFIG_DEBUG_INFO_COMPRESSED_ZLIB is not set
# CONFIG_DEBUG_INFO_SPLIT is not set
CONFIG_PAHOLE_HAS_SPLIT_BTF=y
CONFIG_PAHOLE_HAS_LANG_EXCLUDE=y
# CONFIG_GDB_SCRIPTS is not set
CONFIG_FRAME_WARN=2048
CONFIG_STRIP_ASM_SYMS=y
# CONFIG_READABLE_ASM is not set
# CONFIG_HEADERS_INSTALL is not set
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
# CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_64B is not set
CONFIG_OBJTOOL=y
# CONFIG_VMLINUX_MAP is not set
# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
CONFIG_MAGIC_SYSRQ=y
CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
CONFIG_MAGIC_SYSRQ_SERIAL=y
CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE=""
CONFIG_DEBUG_FS=y
CONFIG_DEBUG_FS_ALLOW_ALL=y
# CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
# CONFIG_DEBUG_FS_ALLOW_NONE is not set
CONFIG_HAVE_ARCH_KGDB=y
# CONFIG_KGDB is not set
CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
# CONFIG_UBSAN is not set
CONFIG_HAVE_ARCH_KCSAN=y
CONFIG_HAVE_KCSAN_COMPILER=y
# CONFIG_KCSAN is not set
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
# CONFIG_PAGE_EXTENSION is not set
# CONFIG_DEBUG_PAGEALLOC is not set
# CONFIG_SLUB_DEBUG is not set
# CONFIG_PAGE_OWNER is not set
# CONFIG_PAGE_TABLE_CHECK is not set
# CONFIG_PAGE_POISONING is not set
# CONFIG_DEBUG_PAGE_REF is not set
# CONFIG_DEBUG_RODATA_TEST is not set
CONFIG_ARCH_HAS_DEBUG_WX=y
# CONFIG_DEBUG_WX is not set
CONFIG_GENERIC_PTDUMP=y
# CONFIG_PTDUMP_DEBUGFS is not set
CONFIG_HAVE_DEBUG_KMEMLEAK=y
# CONFIG_DEBUG_KMEMLEAK is not set
# CONFIG_PER_VMA_LOCK_STATS is not set
# CONFIG_DEBUG_OBJECTS is not set
# CONFIG_SHRINKER_DEBUG is not set
# CONFIG_DEBUG_STACK_USAGE is not set
# CONFIG_SCHED_STACK_END_CHECK is not set
CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=y
# CONFIG_DEBUG_VM is not set
# CONFIG_DEBUG_VM_PGTABLE is not set
CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
# CONFIG_DEBUG_VIRTUAL is not set
# CONFIG_DEBUG_MEMORY_INIT is not set
# CONFIG_DEBUG_PER_CPU_MAPS is not set
CONFIG_HAVE_ARCH_KASAN=y
CONFIG_HAVE_ARCH_KASAN_VMALLOC=y
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
# CONFIG_KASAN is not set
CONFIG_HAVE_ARCH_KFENCE=y
# CONFIG_KFENCE is not set
CONFIG_HAVE_ARCH_KMSAN=y
# end of Memory Debugging

# CONFIG_DEBUG_SHIRQ is not set

#
# Debug Oops, Lockups and Hangs
#
CONFIG_PANIC_ON_OOPS=y
CONFIG_PANIC_ON_OOPS_VALUE=1
CONFIG_PANIC_TIMEOUT=0
CONFIG_LOCKUP_DETECTOR=y
CONFIG_SOFTLOCKUP_DETECTOR=y
# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
CONFIG_HAVE_HARDLOCKUP_DETECTOR_BUDDY=y
CONFIG_HARDLOCKUP_DETECTOR=y
# CONFIG_HARDLOCKUP_DETECTOR_PREFER_BUDDY is not set
CONFIG_HARDLOCKUP_DETECTOR_PERF=y
# CONFIG_HARDLOCKUP_DETECTOR_BUDDY is not set
# CONFIG_HARDLOCKUP_DETECTOR_ARCH is not set
CONFIG_HARDLOCKUP_DETECTOR_COUNTS_HRTIMER=y
CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=y
CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=y
CONFIG_DETECT_HUNG_TASK=y
CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=480
# CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
CONFIG_WQ_WATCHDOG=y
# CONFIG_WQ_CPU_INTENSIVE_REPORT is not set
# CONFIG_TEST_LOCKUP is not set
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
CONFIG_SCHED_DEBUG=y
CONFIG_SCHED_INFO=y
CONFIG_SCHEDSTATS=y
# end of Scheduler Debugging

# CONFIG_DEBUG_TIMEKEEPING is not set

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
# CONFIG_PROVE_LOCKING is not set
# CONFIG_LOCK_STAT is not set
# CONFIG_DEBUG_RT_MUTEXES is not set
# CONFIG_DEBUG_SPINLOCK is not set
# CONFIG_DEBUG_MUTEXES is not set
# CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
# CONFIG_DEBUG_RWSEMS is not set
# CONFIG_DEBUG_LOCK_ALLOC is not set
# CONFIG_DEBUG_ATOMIC_SLEEP is not set
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
# CONFIG_LOCK_TORTURE_TEST is not set
# CONFIG_WW_MUTEX_SELFTEST is not set
# CONFIG_SCF_TORTURE_TEST is not set
# CONFIG_CSD_LOCK_WAIT_DEBUG is not set
# end of Lock Debugging (spinlocks, mutexes, etc...)

# CONFIG_NMI_CHECK_CPU is not set
# CONFIG_DEBUG_IRQFLAGS is not set
CONFIG_STACKTRACE=y
# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
# CONFIG_DEBUG_KOBJECT is not set

#
# Debug kernel data structures
#
CONFIG_DEBUG_LIST=y
# CONFIG_DEBUG_PLIST is not set
# CONFIG_DEBUG_SG is not set
# CONFIG_DEBUG_NOTIFIERS is not set
CONFIG_BUG_ON_DATA_CORRUPTION=y
# CONFIG_DEBUG_MAPLE_TREE is not set
# end of Debug kernel data structures

# CONFIG_DEBUG_CREDENTIALS is not set

#
# RCU Debugging
#
# CONFIG_RCU_SCALE_TEST is not set
# CONFIG_RCU_TORTURE_TEST is not set
# CONFIG_RCU_REF_SCALE_TEST is not set
CONFIG_RCU_CPU_STALL_TIMEOUT=60
CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=0
# CONFIG_RCU_CPU_STALL_CPUTIME is not set
# CONFIG_RCU_TRACE is not set
# CONFIG_RCU_EQS_DEBUG is not set
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
CONFIG_HAVE_FUNCTION_GRAPH_RETVAL=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS=y
CONFIG_HAVE_DYNAMIC_FTRACE_NO_PATCHABLE=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_FENTRY=y
CONFIG_HAVE_OBJTOOL_MCOUNT=y
CONFIG_HAVE_OBJTOOL_NOP_MCOUNT=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_HAVE_BUILDTIME_MCOUNT_SORT=y
CONFIG_BUILDTIME_MCOUNT_SORT=y
CONFIG_TRACER_MAX_TRACE=y
CONFIG_TRACE_CLOCK=y
CONFIG_RING_BUFFER=y
CONFIG_EVENT_TRACING=y
CONFIG_CONTEXT_SWITCH_TRACER=y
CONFIG_TRACING=y
CONFIG_GENERIC_TRACER=y
CONFIG_TRACING_SUPPORT=y
CONFIG_FTRACE=y
# CONFIG_BOOTTIME_TRACING is not set
CONFIG_FUNCTION_TRACER=y
CONFIG_FUNCTION_GRAPH_TRACER=y
# CONFIG_FUNCTION_GRAPH_RETVAL is not set
CONFIG_DYNAMIC_FTRACE=y
CONFIG_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
CONFIG_DYNAMIC_FTRACE_WITH_ARGS=y
# CONFIG_FPROBE is not set
CONFIG_FUNCTION_PROFILER=y
CONFIG_STACK_TRACER=y
# CONFIG_IRQSOFF_TRACER is not set
CONFIG_SCHED_TRACER=y
CONFIG_HWLAT_TRACER=y
# CONFIG_OSNOISE_TRACER is not set
# CONFIG_TIMERLAT_TRACER is not set
# CONFIG_MMIOTRACE is not set
CONFIG_FTRACE_SYSCALLS=y
CONFIG_TRACER_SNAPSHOT=y
# CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP is not set
CONFIG_BRANCH_PROFILE_NONE=y
# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
# CONFIG_BLK_DEV_IO_TRACE is not set
CONFIG_KPROBE_EVENTS=y
# CONFIG_KPROBE_EVENTS_ON_NOTRACE is not set
CONFIG_UPROBE_EVENTS=y
CONFIG_BPF_EVENTS=y
CONFIG_DYNAMIC_EVENTS=y
CONFIG_PROBE_EVENTS=y
CONFIG_BPF_KPROBE_OVERRIDE=y
CONFIG_FTRACE_MCOUNT_RECORD=y
CONFIG_FTRACE_MCOUNT_USE_CC=y
CONFIG_TRACING_MAP=y
CONFIG_SYNTH_EVENTS=y
# CONFIG_USER_EVENTS is not set
CONFIG_HIST_TRIGGERS=y
# CONFIG_TRACE_EVENT_INJECT is not set
# CONFIG_TRACEPOINT_BENCHMARK is not set
CONFIG_RING_BUFFER_BENCHMARK=m
# CONFIG_TRACE_EVAL_MAP_FILE is not set
# CONFIG_FTRACE_RECORD_RECURSION is not set
# CONFIG_FTRACE_STARTUP_TEST is not set
# CONFIG_FTRACE_SORT_STARTUP_TEST is not set
# CONFIG_RING_BUFFER_STARTUP_TEST is not set
# CONFIG_RING_BUFFER_VALIDATE_TIME_DELTAS is not set
# CONFIG_PREEMPTIRQ_DELAY_TEST is not set
# CONFIG_SYNTH_EVENT_GEN_TEST is not set
# CONFIG_KPROBE_EVENT_GEN_TEST is not set
# CONFIG_HIST_TRIGGERS_DEBUG is not set
# CONFIG_RV is not set
CONFIG_PROVIDE_OHCI1394_DMA_INIT=y
# CONFIG_SAMPLES is not set
CONFIG_HAVE_SAMPLE_FTRACE_DIRECT=y
CONFIG_HAVE_SAMPLE_FTRACE_DIRECT_MULTI=y
CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y
CONFIG_STRICT_DEVMEM=y
# CONFIG_IO_STRICT_DEVMEM is not set

#
# x86 Debugging
#
CONFIG_EARLY_PRINTK_USB=y
CONFIG_X86_VERBOSE_BOOTUP=y
CONFIG_EARLY_PRINTK=y
CONFIG_EARLY_PRINTK_DBGP=y
CONFIG_EARLY_PRINTK_USB_XDBC=y
# CONFIG_EFI_PGT_DUMP is not set
# CONFIG_DEBUG_TLBFLUSH is not set
CONFIG_HAVE_MMIOTRACE_SUPPORT=y
# CONFIG_X86_DECODER_SELFTEST is not set
CONFIG_IO_DELAY_0X80=y
# CONFIG_IO_DELAY_0XED is not set
# CONFIG_IO_DELAY_UDELAY is not set
# CONFIG_IO_DELAY_NONE is not set
CONFIG_DEBUG_BOOT_PARAMS=y
# CONFIG_CPA_DEBUG is not set
# CONFIG_DEBUG_ENTRY is not set
# CONFIG_DEBUG_NMI_SELFTEST is not set
# CONFIG_X86_DEBUG_FPU is not set
# CONFIG_PUNIT_ATOM_DEBUG is not set
CONFIG_UNWINDER_ORC=y
# CONFIG_UNWINDER_FRAME_POINTER is not set
# CONFIG_UNWINDER_GUESS is not set
# end of x86 Debugging

#
# Kernel Testing and Coverage
#
# CONFIG_KUNIT is not set
# CONFIG_NOTIFIER_ERROR_INJECTION is not set
CONFIG_FUNCTION_ERROR_INJECTION=y
# CONFIG_FAULT_INJECTION is not set
CONFIG_ARCH_HAS_KCOV=y
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
# CONFIG_KCOV is not set
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
# CONFIG_ASYNC_RAID6_TEST is not set
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
# CONFIG_TEST_LIVEPATCH is not set
# CONFIG_TEST_MEMINIT is not set
# CONFIG_TEST_HMM is not set
# CONFIG_TEST_FREE_PAGES is not set
# CONFIG_TEST_FPU is not set
# CONFIG_TEST_CLOCKSOURCE_WATCHDOG is not set
CONFIG_ARCH_USE_MEMTEST=y
# CONFIG_MEMTEST is not set
# CONFIG_HYPERV_TESTING is not set
# end of Kernel Testing and Coverage

#
# Rust hacking
#
# end of Rust hacking
# end of Kernel hacking

--eiWryPIrJOFvxlHA
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="job-script"

#!/bin/sh

export_top_env()
{
	export suite='hackbench'
	export testcase='hackbench'
	export category='benchmark'
	export disable_latency_stats=1
	export nr_threads=224
	export iterations=4
	export job_origin='hackbench-socket.icl.yaml'
	export queue_cmdline_keys='branch
commit
kbuild_queue_analysis'
	export queue='validate'
	export testbox='lkp-spr-r02'
	export tbox_group='lkp-spr-r02'
	export submit_id='64bc9bdcb724c00daee255e1'
	export job_file='/lkp/jobs/queued/validate/lkp-spr-r02/hackbench-performance-socket-4-threads-100%-debian-11.1-x86_64-20220510.cgz-147f3efaa241-20230723-69038-33omb3-5.yaml'
	export id='15e659aa4e28a48584a08956011803f0b510e458'
	export queuer_version='/zday/lkp'
	export model='Sapphire Rapids'
	export nr_node=2
	export nr_cpu=224
	export memory='256G'
	export nr_ssd_partitions=3
	export ssd_partitions='/dev/disk/by-id/nvme-INTEL_SSDPE2KX040T7_PHLF7414019R4P0IGN-part1
/dev/disk/by-id/nvme-INTEL_SSDPE2KX040T7_PHLF7414019R4P0IGN-part2
/dev/disk/by-id/nvme-INTEL_SSDPE2KX040T7_PHLF7414019R4P0IGN-part3'
	export rootfs_partition='/dev/disk/by-id/nvme-INTEL_SSDPE2KX040T7_PHLF7414019R4P0IGN-part4'
	export kernel_cmdline_hw='acpi_rsdp=0x70e47014'
	export result_service='tmpfs'
	export LKP_SERVER='10.239.97.5'
	export avoid_nfs=1
	export brand='Intel(R) Xeon(R) Platinum 8480CTDX'
	export belongs_to='lkp'
	export need_kconfig=\{\"XFS_DEBUG\"\=\>\"n\"\}'
'\{\"XFS_WARN\"\=\>\"y\"\}'
'\{\"PM_DEBUG\"\=\>\"n\"\}'
'\{\"PM_SLEEP_DEBUG\"\=\>\"n\"\}'
'\{\"DEBUG_ATOMIC_SLEEP\"\=\>\"n\"\}'
'\{\"DEBUG_SPINLOCK_SLEEP\"\=\>\"n\"\}'
'\{\"CIFS_DEBUG\"\=\>\"n\"\}'
'\{\"SCSI_DEBUG\"\=\>\"n\"\}'
'\{\"NFS_DEBUG\"\=\>\"n\"\}'
'\{\"SUNRPC_DEBUG\"\=\>\"n\"\}'
'\{\"DM_DEBUG\"\=\>\"n\"\}'
'\{\"DEBUG_SHIRQ\"\=\>\"n\"\}'
'\{\"OCFS2_DEBUG_MASKLOG\"\=\>\"n\"\}'
'\{\"DEBUG_MEMORY_INIT\"\=\>\"n\"\}'
'\{\"SLUB_DEBUG\"\=\>\"n\"\}'
'\{\"EXPERT\"\=\>\"y\"\}'
'\{\"PREEMPT_VOLUNTARY\"\=\>\"y\"\}'
'\{\"PREEMPT_NONE\"\=\>\"n\"\}'
'\{\"PREEMPT\"\=\>\"n\"\}'
'\{\"PREEMPT_RT\"\=\>\"n\"\}'
'\{\"PREEMPT_DYNAMIC\"\=\>\"n\"\}'
'\{\"PREEMPT_VOLUNTARY_BEHAVIOUR\"\=\>\"y\"\}'
'\{\"PREEMPT_BEHAVIOUR\"\=\>\"n\"\}'
'\{\"PREEMPT_NONE_BEHAVIOUR\"\=\>\"n\"\}'
'\{\"PREEMPT_DYNAMIC\"\=\>\"n\"\}'
'\{\"PREEMPT_VOLUNTARY\"\=\>\"y\"\}'
'\{\"PREEMPT_NONE\"\=\>\"n\"\}'
'\{\"PREEMPT\"\=\>\"n\"\}'
'\{\"PREEMPT_RT\"\=\>\"n\"\}
	export commit='147f3efaa24182a21706bca15eab2f3f4630b5fe'
	export netconsole_port=6675
	export ucode='0x2b000181'
	export kconfig='x86_64-rhel-8.3'
	export enqueue_time='2023-07-23 11:17:48 +0800'
	export _id='64bc9bddb724c00daee255e3'
	export _rt='/result/hackbench/performance-socket-4-threads-100%/lkp-spr-r02/debian-11.1-x86_64-20220510.cgz/x86_64-rhel-8.3/gcc-12/147f3efaa24182a21706bca15eab2f3f4630b5fe'
	export compiler='gcc-12'
	export head_commit='cd875ef432fda9d248c23f18d539b75794046b6f'
	export base_commit='fdf0eaf11452d72945af31804e2a1048ee1b574c'
	export branch='tip/sched/eevdf'
	export rootfs='debian-11.1-x86_64-20220510.cgz'
	export user='lkp'
	export scheduler_version='/lkp/lkp/src'
	export arch='x86_64'
	export max_uptime=2100
	export initrd='/osimage/debian/debian-11.1-x86_64-20220510.cgz'
	export bootloader_append='root=/dev/ram0
RESULT_ROOT=/result/hackbench/performance-socket-4-threads-100%/lkp-spr-r02/debian-11.1-x86_64-20220510.cgz/x86_64-rhel-8.3/gcc-12/147f3efaa24182a21706bca15eab2f3f4630b5fe/3
BOOT_IMAGE=/pkg/linux/x86_64-rhel-8.3/gcc-12/147f3efaa24182a21706bca15eab2f3f4630b5fe/vmlinuz-6.5.0-rc2-00020-g147f3efaa241
branch=tip/sched/eevdf
job=/lkp/jobs/scheduled/lkp-spr-r02/hackbench-performance-socket-4-threads-100%-debian-11.1-x86_64-20220510.cgz-147f3efaa241-20230723-69038-33omb3-5.yaml
user=lkp
ARCH=x86_64
kconfig=x86_64-rhel-8.3
commit=147f3efaa24182a21706bca15eab2f3f4630b5fe
nmi_watchdog=0
acpi_rsdp=0x70e47014
max_uptime=2100
LKP_SERVER=10.239.97.5
nokaslr
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
	export modules_initrd='/pkg/linux/x86_64-rhel-8.3/gcc-12/147f3efaa24182a21706bca15eab2f3f4630b5fe/modules.cgz'
	export bm_initrd='/osimage/deps/debian-11.1-x86_64-20220510.cgz/run-ipconfig_20220515.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/lkp_20220513.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/rsync-rootfs_20220515.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/hackbench_20221214.cgz,/osimage/pkg/debian-11.1-x86_64-20220510.cgz/hackbench-x86_64-2.3-1_20220518.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/mpstat_20220516.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/turbostat_20220514.cgz,/osimage/pkg/debian-11.1-x86_64-20220510.cgz/turbostat-x86_64-210e04ff7681-1_20220518.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/perf_20230522.cgz,/osimage/pkg/debian-11.1-x86_64-20220510.cgz/perf-x86_64-00c7b5f4ddc5-1_20230402.cgz,/osimage/pkg/debian-11.1-x86_64-20220510.cgz/sar-x86_64-c5bb321-1_20220518.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/hw_20220526.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/rootfs_20220515.cgz'
	export ucode_initrd='/osimage/ucode/intel-ucode-20230406.cgz'
	export lkp_initrd='/osimage/user/lkp/lkp-x86_64.cgz'
	export site='lkp-wsx01'
	export LKP_CGI_PORT=80
	export LKP_CIFS_PORT=139
	export job_initrd='/lkp/jobs/scheduled/lkp-spr-r02/hackbench-performance-socket-4-threads-100%-debian-11.1-x86_64-20220510.cgz-147f3efaa241-20230723-69038-33omb3-5.cgz'
	export last_kernel='6.5.0-rc2-07633-gcd875ef432fd'
	export acpi_rsdp='0x70e47014'
	export repeat_to=6
	export kbuild_queue_analysis=1
	export kernel='/pkg/linux/x86_64-rhel-8.3/gcc-12/147f3efaa24182a21706bca15eab2f3f4630b5fe/vmlinuz-6.5.0-rc2-00020-g147f3efaa241'
	export result_root='/result/hackbench/performance-socket-4-threads-100%/lkp-spr-r02/debian-11.1-x86_64-20220510.cgz/x86_64-rhel-8.3/gcc-12/147f3efaa24182a21706bca15eab2f3f4630b5fe/3'

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

	run_setup $LKP_SRC/setup/cpufreq_governor 'performance'

	run_setup $LKP_SRC/setup/sanity-check

	run_monitor $LKP_SRC/monitors/wrapper kmsg
	run_monitor $LKP_SRC/monitors/no-stdout/wrapper boot-time
	run_monitor $LKP_SRC/monitors/wrapper uptime
	run_monitor $LKP_SRC/monitors/wrapper iostat
	run_monitor $LKP_SRC/monitors/wrapper heartbeat
	run_monitor $LKP_SRC/monitors/wrapper vmstat
	run_monitor $LKP_SRC/monitors/wrapper numa-numastat
	run_monitor $LKP_SRC/monitors/wrapper numa-vmstat
	run_monitor $LKP_SRC/monitors/wrapper numa-meminfo
	run_monitor $LKP_SRC/monitors/wrapper proc-vmstat
	run_monitor $LKP_SRC/monitors/wrapper proc-stat
	run_monitor $LKP_SRC/monitors/wrapper meminfo
	run_monitor $LKP_SRC/monitors/wrapper slabinfo
	run_monitor $LKP_SRC/monitors/wrapper interrupts
	run_monitor $LKP_SRC/monitors/wrapper lock_stat
	run_monitor lite_mode=1 $LKP_SRC/monitors/wrapper perf-sched
	run_monitor $LKP_SRC/monitors/wrapper softirqs
	run_monitor $LKP_SRC/monitors/one-shot/wrapper bdi_dev_mapping
	run_monitor $LKP_SRC/monitors/wrapper diskstats
	run_monitor $LKP_SRC/monitors/wrapper nfsstat
	run_monitor $LKP_SRC/monitors/wrapper cpuidle
	run_monitor $LKP_SRC/monitors/wrapper cpufreq-stats
	run_monitor $LKP_SRC/monitors/wrapper turbostat
	run_monitor $LKP_SRC/monitors/wrapper sched_debug
	run_monitor $LKP_SRC/monitors/wrapper perf-stat
	run_monitor $LKP_SRC/monitors/wrapper mpstat
	run_monitor $LKP_SRC/monitors/no-stdout/wrapper perf-c2c
	run_monitor debug_mode=0 $LKP_SRC/monitors/no-stdout/wrapper perf-profile
	run_monitor $LKP_SRC/monitors/wrapper oom-killer
	run_monitor $LKP_SRC/monitors/plain/watchdog

	run_test mode='threads' ipc='socket' $LKP_SRC/tests/wrapper hackbench
}

extract_stats()
{
	export stats_part_begin=
	export stats_part_end=

	env mode='threads' ipc='socket' $LKP_SRC/stats/wrapper hackbench
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper boot-time
	$LKP_SRC/stats/wrapper uptime
	$LKP_SRC/stats/wrapper iostat
	$LKP_SRC/stats/wrapper vmstat
	$LKP_SRC/stats/wrapper numa-numastat
	$LKP_SRC/stats/wrapper numa-vmstat
	$LKP_SRC/stats/wrapper numa-meminfo
	$LKP_SRC/stats/wrapper proc-vmstat
	$LKP_SRC/stats/wrapper meminfo
	$LKP_SRC/stats/wrapper slabinfo
	$LKP_SRC/stats/wrapper interrupts
	$LKP_SRC/stats/wrapper lock_stat
	env lite_mode=1 $LKP_SRC/stats/wrapper perf-sched
	$LKP_SRC/stats/wrapper softirqs
	$LKP_SRC/stats/wrapper diskstats
	$LKP_SRC/stats/wrapper nfsstat
	$LKP_SRC/stats/wrapper cpuidle
	$LKP_SRC/stats/wrapper turbostat
	$LKP_SRC/stats/wrapper sched_debug
	$LKP_SRC/stats/wrapper perf-stat
	$LKP_SRC/stats/wrapper mpstat
	$LKP_SRC/stats/wrapper perf-c2c
	env debug_mode=0 $LKP_SRC/stats/wrapper perf-profile

	$LKP_SRC/stats/wrapper time hackbench.time
	$LKP_SRC/stats/wrapper dmesg
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper last_state
	$LKP_SRC/stats/wrapper stderr
	$LKP_SRC/stats/wrapper time
}

"$@"

--eiWryPIrJOFvxlHA
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="job.yaml"

---

#! jobs/hackbench-socket.icl.yaml
suite: hackbench
testcase: hackbench
category: benchmark
disable_latency_stats: 1
nr_threads: 100%
iterations: 4
hackbench:
  mode: threads
  ipc: socket
job_origin: hackbench-socket.icl.yaml

#! queue options
queue_cmdline_keys:
- branch
- commit
- kbuild_queue_analysis
queue: bisect
testbox: lkp-spr-r02
tbox_group: lkp-spr-r02
submit_id: 64bc88beb724c06eccc918cc
job_file: "/lkp/jobs/scheduled/lkp-spr-r02/hackbench-performance-socket-4-threads-100%-debian-11.1-x86_64-20220510.cgz-147f3efaa241-20230723-28364-6a9nto-1.yaml"
id: 1f7590759b653f38a22ab5ac51be4f01c88f27c0
queuer_version: "/zday/lkp"

#! /db/releases/20230718173807/lkp-src/hosts/lkp-spr-r02
model: Sapphire Rapids
nr_node: 2
nr_cpu: 224
memory: 256G
nr_ssd_partitions: 3
ssd_partitions:
- "/dev/disk/by-id/nvme-INTEL_SSDPE2KX040T7_PHLF7414019R4P0IGN-part1"
- "/dev/disk/by-id/nvme-INTEL_SSDPE2KX040T7_PHLF7414019R4P0IGN-part2"
- "/dev/disk/by-id/nvme-INTEL_SSDPE2KX040T7_PHLF7414019R4P0IGN-part3"
rootfs_partition: "/dev/disk/by-id/nvme-INTEL_SSDPE2KX040T7_PHLF7414019R4P0IGN-part4"
kernel_cmdline_hw: acpi_rsdp=0x70e47014
result_service: tmpfs
LKP_SERVER: 10.239.97.5
avoid_nfs: 1
brand: Intel(R) Xeon(R) Platinum 8480CTDX
belongs_to: lkp

#! /db/releases/20230718173807/lkp-src/include/category/benchmark
need_kconfig:
- XFS_DEBUG: n
- XFS_WARN: y
- PM_DEBUG: n
- PM_SLEEP_DEBUG: n
- DEBUG_ATOMIC_SLEEP: n
- DEBUG_SPINLOCK_SLEEP: n
- CIFS_DEBUG: n
- SCSI_DEBUG: n
- NFS_DEBUG: n
- SUNRPC_DEBUG: n
- DM_DEBUG: n
- DEBUG_SHIRQ: n
- OCFS2_DEBUG_MASKLOG: n
- DEBUG_MEMORY_INIT: n
- SLUB_DEBUG: n
- EXPERT: y
- PREEMPT_VOLUNTARY: y
- PREEMPT_NONE: n
- PREEMPT: n
- PREEMPT_RT: n
- PREEMPT_DYNAMIC: n
- PREEMPT_VOLUNTARY_BEHAVIOUR: y
- PREEMPT_BEHAVIOUR: n
- PREEMPT_NONE_BEHAVIOUR: n
- PREEMPT_DYNAMIC: n
- PREEMPT_VOLUNTARY: y
- PREEMPT_NONE: n
- PREEMPT: n
- PREEMPT_RT: n
kmsg:
boot-time:
uptime:
iostat:
heartbeat:
vmstat:
numa-numastat:
numa-vmstat:
numa-meminfo:
proc-vmstat:
proc-stat:
meminfo:
slabinfo:
interrupts:
lock_stat:
perf-sched:
  lite_mode: 1
softirqs:
bdi_dev_mapping:
diskstats:
nfsstat:
cpuidle:
cpufreq-stats:
turbostat:
sched_debug:
perf-stat:
mpstat:
perf-c2c:
perf-profile:
  debug_mode: 0

#! /db/releases/20230718173807/lkp-src/include/category/ALL
cpufreq_governor: performance
sanity-check:

#! /db/releases/20230718173807/lkp-src/include/queue/cyclic
commit: 147f3efaa24182a21706bca15eab2f3f4630b5fe

#! /db/releases/20230718173807/lkp-src/include/testbox/lkp-spr-r02
netconsole_port: 6675
ucode: '0x2b000181'
kconfig: x86_64-rhel-8.3
enqueue_time: 2023-07-23 09:56:14.384107210 +08:00
_id: 64bc88bfb724c06eccc918cd
_rt: "/result/hackbench/performance-socket-4-threads-100%/lkp-spr-r02/debian-11.1-x86_64-20220510.cgz/x86_64-rhel-8.3/gcc-12/147f3efaa24182a21706bca15eab2f3f4630b5fe"
compiler: gcc-12
head_commit: cd875ef432fda9d248c23f18d539b75794046b6f
base_commit: fdf0eaf11452d72945af31804e2a1048ee1b574c
branch: linux-devel/devel-hourly-20230721-143654
rootfs: debian-11.1-x86_64-20220510.cgz

#! schedule options
user: lkp
scheduler_version: "/lkp/lkp/src"
arch: x86_64
max_uptime: 2100
initrd: "/osimage/debian/debian-11.1-x86_64-20220510.cgz"
bootloader_append:
- root=/dev/ram0
- RESULT_ROOT=/result/hackbench/performance-socket-4-threads-100%/lkp-spr-r02/debian-11.1-x86_64-20220510.cgz/x86_64-rhel-8.3/gcc-12/147f3efaa24182a21706bca15eab2f3f4630b5fe/0
- BOOT_IMAGE=/pkg/linux/x86_64-rhel-8.3/gcc-12/147f3efaa24182a21706bca15eab2f3f4630b5fe/vmlinuz-6.5.0-rc2-00020-g147f3efaa241
- branch=linux-devel/devel-hourly-20230721-143654
- job=/lkp/jobs/scheduled/lkp-spr-r02/hackbench-performance-socket-4-threads-100%-debian-11.1-x86_64-20220510.cgz-147f3efaa241-20230723-28364-6a9nto-1.yaml
- user=lkp
- ARCH=x86_64
- kconfig=x86_64-rhel-8.3
- commit=147f3efaa24182a21706bca15eab2f3f4630b5fe
- nmi_watchdog=0
- acpi_rsdp=0x70e47014
- max_uptime=2100
- LKP_SERVER=10.239.97.5
- nokaslr
- selinux=0
- debug
- apic=debug
- sysrq_always_enabled
- rcupdate.rcu_cpu_stall_timeout=100
- net.ifnames=0
- printk.devkmsg=on
- panic=-1
- softlockup_panic=1
- nmi_watchdog=panic
- oops=panic
- load_ramdisk=2
- prompt_ramdisk=0
- drbd.minor_count=8
- systemd.log_level=err
- ignore_loglevel
- console=tty0
- earlyprintk=ttyS0,115200
- console=ttyS0,115200
- vga=normal
- rw
modules_initrd: "/pkg/linux/x86_64-rhel-8.3/gcc-12/147f3efaa24182a21706bca15eab2f3f4630b5fe/modules.cgz"
bm_initrd: "/osimage/deps/debian-11.1-x86_64-20220510.cgz/lkp_20220513.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/run-ipconfig_20220515.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/rsync-rootfs_20220515.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/hackbench_20221214.cgz,/osimage/pkg/debian-11.1-x86_64-20220510.cgz/hackbench-x86_64-2.3-1_20220518.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/mpstat_20220516.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/turbostat_20220514.cgz,/osimage/pkg/debian-11.1-x86_64-20220510.cgz/turbostat-x86_64-210e04ff7681-1_20220518.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/perf_20230522.cgz,/osimage/pkg/debian-11.1-x86_64-20220510.cgz/perf-x86_64-00c7b5f4ddc5-1_20230402.cgz,/osimage/pkg/debian-11.1-x86_64-20220510.cgz/sar-x86_64-c5bb321-1_20220518.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/hw_20220526.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/rootfs_20220515.cgz"
ucode_initrd: "/osimage/ucode/intel-ucode-20230406.cgz"
lkp_initrd: "/osimage/user/lkp/lkp-x86_64.cgz"
site: lkp-wsx01

#! /db/releases/20230721222328/lkp-src/include/site/lkp-wsx01
LKP_CGI_PORT: 80
LKP_CIFS_PORT: 139
oom-killer:
watchdog:
job_initrd: "/lkp/jobs/scheduled/lkp-spr-r02/hackbench-performance-socket-4-threads-100%-debian-11.1-x86_64-20220510.cgz-147f3efaa241-20230723-28364-6a9nto-1.cgz"
last_kernel: 6.5.0-rc2
acpi_rsdp: '0x70e47014'
repeat_to: 3

#! user overrides
kbuild_queue_analysis: 1
kernel: "/pkg/linux/x86_64-rhel-8.3/gcc-12/147f3efaa24182a21706bca15eab2f3f4630b5fe/vmlinuz-6.5.0-rc2-00020-g147f3efaa241"
result_root: "/result/hackbench/performance-socket-4-threads-100%/lkp-spr-r02/debian-11.1-x86_64-20220510.cgz/x86_64-rhel-8.3/gcc-12/147f3efaa24182a21706bca15eab2f3f4630b5fe/0"
dequeue_time: 2023-07-23 10:07:38.152971526 +08:00
job_state: finished
loadavg: 1800.25 3669.79 2012.55 1/1959 53235
start_time: '1690078172'
end_time: '1690078529'
version: "/lkp/lkp/.src-20230723-000404:21afd11b9aae:4b685812345f"

--eiWryPIrJOFvxlHA
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="reproduce"


for cpu_dir in /sys/devices/system/cpu/cpu[0-9]*
do
	online_file="$cpu_dir"/online
	[ -f "$online_file" ] && [ "$(cat "$online_file")" -eq 0 ] && continue

	file="$cpu_dir"/cpufreq/scaling_governor
	[ -f "$file" ] && echo "performance" > "$file"
done

 "/usr/bin/hackbench" "-g" "224" "-f" "20" "--threads" "-l" "30000" "-s" "100"
 "/usr/bin/hackbench" "-g" "224" "-f" "20" "--threads" "-l" "30000" "-s" "100"
 "/usr/bin/hackbench" "-g" "224" "-f" "20" "--threads" "-l" "30000" "-s" "100"
 "/usr/bin/hackbench" "-g" "224" "-f" "20" "--threads" "-l" "30000" "-s" "100"

--eiWryPIrJOFvxlHA--
