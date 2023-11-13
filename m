Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B986720B2E
	for <oe-lkp@lists.linux.dev>; Mon, 13 Nov 2023 14:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WjXq+C1y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699887168; x=1731423168;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=cABFXQ3mSab3IdnVwxaW5GgoY8Rqt1dgSrLSqKLly8k=;
  b=WjXq+C1yuLxYuwc82ET7MJA6IazRm/r+7/GxYlh+GsxoZzwqpFFyuJ3+
   +lhOFlj4lNaoFuiYMYukNBhm2DgiqI+C9+JJqtnHuGHX3GIctnbqkKC75
   fz3Ta+uZ5veq04CBYp21YNqWGVdzJUcr6e5XNCEM7BuwPN00uf5YzHL2T
   PksAEpRXfPjYGrOSmkeB5JfGqBqE56Br2/3d2Z5F0WMfLxb0IJa2utHrL
   Ojfhij7d0bPhtAE+7BblPNyVQOKuZysl5dFY4+GpKD/9puKCdnemzjstb
   MLK+J/A1adMWmxx6yeGtz9WIxL/JrWdwTcd/sYbbdhYlLciuNh5mUwNnY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="9088754"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="9088754"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 06:52:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="908068686"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="908068686"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Nov 2023 06:52:46 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 06:52:46 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 06:52:45 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 13 Nov 2023 06:52:45 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 13 Nov 2023 06:52:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EkGihVpvFclsiXWwoZd/nabgjbV9iHdqpkaggXIjL1UmzWKw7gaJKz80G5UVAZ9i178c7qY1D7HapI76HNTy0QmwJhFEHHKOXbKAPI397O04F4ijH0Nx7VJufYKjK8CzS9HgzAXRz7kgMaKnBOXWmPOkfA8qV5mhRSoin8sNb0JQARmuTa7O3+ca7TYy6oDLwwcVuKxf2DHp+tJrq3nd7y0uxZuOGDXhH6vsQQ0F6JwxiFomPMmMpq5PWSW9KV4pFKabDtfdmNCQ7Zmv7qYGHUOJDkxpxCUApx+ShTfDbbH2YmQ1rAgJZzqVAimy8q9DGUwdEA9vRXYlAsMdqX0evw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i0YoqVaeshN0Q8Z85YPtNbhWOUPdNFFoNcFedfadGYM=;
 b=Mpph1C+7Dwb5SuJfdQdLfvFshAxCv7Vah/hcT4w7AW5xdFIQK/wdZKINy6Y2hDnRyLDbNWdwbrz4wvwrHFtVD6XqmmiIk9nogsl4YpIWqDqj/hUc9+AwxS0N2rDVQsqFcZfFZZHF/2gGHXCyqOq9lbXxd8GmlkvppmSFJ+0gGhZref3j6+vYYKAe1DiiAkhBdA1v6ycj6lDvlN8Mz2kbN9CwUp23rvjwPLSAnvDs/oZfW/oAkTPC0OaDSzGbKB30iwmYsUTE390016sdRRADRdtjxj7oHBhSrA4I7W4gWtaZN4msL/M2SHeAKRAYRFF4LFbgQeoniLRUroBuCzblvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by SJ0PR11MB4782.namprd11.prod.outlook.com (2603:10b6:a03:2df::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 14:52:41 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::b8:30e8:1502:b2a7]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::b8:30e8:1502:b2a7%4]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 14:52:41 +0000
Date: Mon, 13 Nov 2023 22:52:34 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [peterz-queue:sched/eevdf] [sched/fair]  80a1fb6b3d:
 lmbench3.TCP.socket.bandwidth.10MB.MB/sec -11.2% regression
Message-ID: <202311132202.1eabb13e-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR06CA0005.apcprd06.prod.outlook.com
 (2603:1096:4:186::12) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|SJ0PR11MB4782:EE_
X-MS-Office365-Filtering-Correlation-Id: b0e6af86-44b4-444b-cc54-08dbe4582f73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7eX9XaprbxHTFcLzPFxBkRwnWklSxlDmoNwWxBh71ZdkL5PBFx10GG8dV1ne+PAfodexuXxK5p9hG7CPIZdA9oe2CUSnHD1zdbnH7YhFf3TN4qDE8SzGXLsohubDKgl9Y+MMWv1LfgoIYYCvCTIVUiTrpQbSB73YylNMkLfVng4cC6tEALEYIlhaQRUbT+PO2/igdRBCg+6YtF/h3qvQ2/wHjp2e/27EIeH4Un0AGAAGrWU1HE9yHSkF9MpTsRt/BAFsQmX/PMPPn6Q04hn00caswDfkmoSe7eZ06hOd4XRZk4QEFHp9Yms2oYyPm6nJqVJsr65L2B1+YbsnJPa7/QkBkKTv8KDZz2az7aV6Lz2J+bKoolXZHCqfKaTKrZo2jGrQZkhb2CM6xjZhyyFO85PqxvYZwu6S7pOs5Jp9MIUqhfCliEL3PRp9k0amtQ7xZ/yS0KkvDRyxMfP7CPK5WALd9Yyb+ucGJUWiBiiJfyltL0hhTFmZTfGDlKzxkfRxgX6mICTb0JgyoqI4iM9itB7ZU8fP9gLEZYJUpk3M4+PXMxiC4qcHR0PLTT+/v3PSjkhUFYRLAmD6dNjsUryLGUYoyaJalzkcxy6Vgu5CySy/erztBYIgRTGE+T3rIaXnsFqxBHlRNJJ2ri5Ytk8zYQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(376002)(366004)(346002)(230922051799003)(230373577357003)(230473577357003)(64100799003)(1800799009)(186009)(451199024)(2906002)(30864003)(6666004)(6506007)(478600001)(86362001)(1076003)(107886003)(26005)(6916009)(2616005)(6512007)(316002)(66476007)(66556008)(66946007)(6486002)(966005)(19627235002)(82960400001)(38100700002)(83380400001)(5660300002)(8936002)(36756003)(8676002)(4326008)(41300700001)(84970400001)(559001)(579004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?zgYB+00Y+qEKrXSeXd52YkUaaeykzoMiRbrMND/K2jotvFOSH1mVu6g7Qd?=
 =?iso-8859-1?Q?xAojdZ6IM2/V29mitDNvGE0q5LKCJGNtjP+3P1/BRFHc2h1BcrI/gChF3s?=
 =?iso-8859-1?Q?YAwEYLpBuBDyk8x40S4y62zQnSkmlOG+3RenKtfIWGZCIc+JL8RZNdPZIa?=
 =?iso-8859-1?Q?iOLfjKVLVlFYr7RI1630LkufmPFNTp8qO71ydnzqSLBs1TLXbNwcABSJ3g?=
 =?iso-8859-1?Q?uFbptg3BMTKQiUrsVoPmaHugRepyrVaiqF3N8L7aVsGRhxvSbB1+1fQvZ4?=
 =?iso-8859-1?Q?2ydJg4i6wfUC8X3faNQnwTKUjXGplIOD69HIWhQwjpBGhA+whjbrX98F/e?=
 =?iso-8859-1?Q?LBsZ+Xeb91KCkABiMdXdUo4UzuBw8AGyLcsEREvSQ+zg0cSNpJv5uXaN4t?=
 =?iso-8859-1?Q?ifDoNY+Z5GZRWTylAWI7cEjVPqw1clIVhTPVuaDImdtFn1vuZK/T2HWVdQ?=
 =?iso-8859-1?Q?xdh6g0TtD/SZnlzz4SVQzj9k2hVbLtxZDC/kP+ltwA8ViNnDI0Q4fCTy/7?=
 =?iso-8859-1?Q?c7vrsbNlrs/ea0VderfFQkAy/ohuzKkye2QUDgji5zKtIcWmxVwT1QjOO2?=
 =?iso-8859-1?Q?p0VD0qMdUTp+jheH++l0cSHwGX+OOrL6COSZb4kUK47otvnuabjhBnFtiy?=
 =?iso-8859-1?Q?zwBtqAgOWMNtFzhSi2K6m5JUZIvBIXjbMdgVObJK6wxscv4fcjqDsU3G6C?=
 =?iso-8859-1?Q?plQQVd7TOwVNXd+PRWPK5Adzbvvi+CnBCyq2j6PCiK17e4SBoKF83zM4lz?=
 =?iso-8859-1?Q?uJA8/3MHfoMXbhD31pwndQruoX8DNx44QAi6CJ8TSx3TPy6j+SyEuHessr?=
 =?iso-8859-1?Q?eMED4FHzZsbQo55GeFGpt4O2LjjmweCcA0z3odGqWoxnGYKyVraUyHHPVN?=
 =?iso-8859-1?Q?409mxz/TZBy9hD8tsAtQpSoUFSkVGuJ0j3SQYM+MU18OfOvlNMKNirOEDi?=
 =?iso-8859-1?Q?NlQk0oJgxpG3HiAeQaJ0nQ+KCezZD8hevUnmH6GFJ+LNBrDyQGEP6ZJWvF?=
 =?iso-8859-1?Q?sLw1D9fU98EaNw842ByMf+th1vJJMsdXhD5ko/l8LO/OcqubCN+IEN4ZHz?=
 =?iso-8859-1?Q?55YhN1ZVDtmKOmQYb/1wsHT4BJerlpt3HhGX3NH5R24+VcrP3SVxHQkaXN?=
 =?iso-8859-1?Q?ga1uWvY6JxvufiP+pCCOWnI+tbi2/q6zdGmzmL7kdtYcpwPX5xuUxnnpaz?=
 =?iso-8859-1?Q?qRSn8Iuea/BwbQfsxPM1sSfWty0B+cAplzCCmF92BwsPrXbNWxL4hS0E0q?=
 =?iso-8859-1?Q?QvZu3BycS9z9UfkqUtLChL32/bhKX2HPIb+N/ZWu/eZ4io29hOLs6AqHKw?=
 =?iso-8859-1?Q?owEa+0RnOLVw85rk/2e7Phh6Ao943Dnfkn+oJSTsykW5HmnMfQV9uV22CT?=
 =?iso-8859-1?Q?4GgZSnEoZ7uEArUQn8NHf+W0gsK3LotOkahjVG4Jb4xdjGqEeJWiokMMWp?=
 =?iso-8859-1?Q?L8/C69Xle7ehpMkMvn1SzC4X5KiiHYbr5kk0sqd6E2pERNOEozPRtdd3Hi?=
 =?iso-8859-1?Q?JAEnCtEQOPI9t6y6iJupwnV8IuKZR2IxnzXZ7mjXMGeiCxa9ezRITrELPZ?=
 =?iso-8859-1?Q?GuECdnXTkGa6OuECIWhS7ZKjJ74LdeExmoKk1J3ZFB2TUMPNcRyrW3FwCL?=
 =?iso-8859-1?Q?PaYRvGKUzELvBFh0OO2WsKT0rw/edJmFgZbkCoIJFsgl2bkagyqsJ34w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b0e6af86-44b4-444b-cc54-08dbe4582f73
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 14:52:41.1597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uYsLIttkBMyl2F03MK9OsItumzNgeAzj5fCXacb2YNL60EU5Pk3AuCckbVamsV3WPs/lfP+OkxtWDYJi4EOGQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4782
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a -11.2% regression of lmbench3.TCP.socket.bandwidth.10MB.MB/sec on:


commit: 80a1fb6b3d64dbeafe3f699748d29179131a3080 ("sched/fair: Add trivial fair server")
https://git.kernel.org/cgit/linux/kernel/git/peterz/queue.git sched/eevdf

testcase: lmbench3
test machine: 48 threads 2 sockets Intel(R) Xeon(R) CPU E5-2697 v2 @ 2.70GHz (Ivy Bridge-EP) with 112G memory
parameters:

	test_memory_size: 50%
	nr_threads: 1
	mode: development
	test: TCP
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+--------------------------------------------------------------------------------------------+
| testcase: change | adrestia: adrestia.wakeup_cost_periodic_us 133.3% regression                               |
| test machine     | 8 threads 1 sockets Intel(R) Core(TM) i7-4770K CPU @ 3.50GHz (Haswell) with 8G memory      |
| test parameters  | cpufreq_governor=performance                                                               |
|                  | nr_threads=100                                                                             |
+------------------+--------------------------------------------------------------------------------------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202311132202.1eabb13e-oliver.sang@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20231113/202311132202.1eabb13e-oliver.sang@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_threads/rootfs/tbox_group/test/test_memory_size/testcase:
  gcc-12/performance/x86_64-rhel-8.3/development/1/debian-11.1-x86_64-20220510.cgz/lkp-ivb-2ep1/TCP/50%/lmbench3

commit: 
  837b5e5eb8 ("sched/deadline: Introduce deadline servers")
  80a1fb6b3d ("sched/fair: Add trivial fair server")

837b5e5eb8eec6d0 80a1fb6b3d64dbeafe3f699748d 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
  10989170 ±  7%     +39.1%   15281375 ± 31%  cpuidle..usage
      4072 ±110%   +1077.6%      47954 ± 40%  sched_debug.cpu.max_idle_balance_cost.stddev
    798.85 ± 37%    +313.4%       3302 ± 89%  sched_debug.cpu.nr_switches.min
     22185 ±  6%    +343.7%      98441 ± 19%  meminfo.Active
     21294 ±  6%    +358.1%      97552 ± 19%  meminfo.Active(anon)
     22761 ±  6%    +341.4%     100479 ± 18%  meminfo.Shmem
     19993 ±  7%    +368.9%      93747 ± 19%  numa-meminfo.node1.Active
     19280 ±  7%    +384.9%      93482 ± 20%  numa-meminfo.node1.Active(anon)
     20415 ±  6%    +370.3%      96021 ± 19%  numa-meminfo.node1.Shmem
      4817 ±  7%    +385.0%      23366 ± 20%  numa-vmstat.node1.nr_active_anon
      5102 ±  6%    +370.4%      24003 ± 19%  numa-vmstat.node1.nr_shmem
      4817 ±  7%    +385.0%      23366 ± 20%  numa-vmstat.node1.nr_zone_active_anon
      1.59 ±  5%     +81.2%       2.88 ± 13%  vmstat.procs.r
     51860 ±  5%     -31.7%      35411 ± 23%  vmstat.system.cs
     48849           +78.9%      87368 ±  8%  vmstat.system.in
     24576 ±  6%    +140.2%      59037 ± 23%  turbostat.C1E
      0.09 ±  6%      +0.0        0.14 ± 11%  turbostat.C1E%
   6858510 ±  8%    +158.3%   17717813 ± 26%  turbostat.IRQ
     30311 ± 15%   +1551.0%     500443 ±  6%  turbostat.POLL
      0.00 ±152%      +0.0        0.02 ± 25%  turbostat.POLL%
     14.77           +12.9%      16.68        lmbench3.TCP.localhost.latency
      5170           -11.2%       4591 ±  5%  lmbench3.TCP.socket.bandwidth.10MB.MB/sec
    130.11 ±  5%     +23.2%     160.24 ±  9%  lmbench3.time.elapsed_time
    130.11 ±  5%     +23.2%     160.24 ±  9%  lmbench3.time.elapsed_time.max
    924.80 ±  8%   +1043.5%      10575 ± 11%  lmbench3.time.involuntary_context_switches
    651776            +0.9%     657325        lmbench3.time.minor_page_faults
   1862703 ±  4%      -8.3%    1707320 ±  3%  lmbench3.time.voluntary_context_switches
      5323 ±  6%    +358.0%      24381 ± 19%  proc-vmstat.nr_active_anon
    677885            +2.9%     697307        proc-vmstat.nr_file_pages
      5690 ±  6%    +341.3%      25114 ± 18%  proc-vmstat.nr_shmem
      5323 ±  6%    +358.0%      24381 ± 19%  proc-vmstat.nr_zone_active_anon
     19211 ±  5%     +17.4%      22554 ±  7%  proc-vmstat.numa_huge_pte_updates
   9881073 ±  5%     +17.6%   11616589 ±  7%  proc-vmstat.numa_pte_updates
      8254 ±  2%    +261.7%      29853 ± 12%  proc-vmstat.pgactivate
   1142589 ±  2%     +15.3%    1317289 ± 13%  proc-vmstat.pgfault
     22349 ±  5%     +37.1%      30645 ± 26%  proc-vmstat.pgreuse
      1167 ±  4%      +5.0%       1225 ±  2%  proc-vmstat.unevictable_pgs_culled
  33065559 ±  4%     -13.8%   28491307 ± 13%  perf-stat.i.branch-misses
     53094 ±  5%     -32.3%      35964 ± 23%  perf-stat.i.context-switches
     68.78 ±  2%    +138.7%     164.19 ±  9%  perf-stat.i.cpu-migrations
    923.62            -8.6%     843.76 ±  9%  perf-stat.i.cycles-between-cache-misses
  9.91e+08 ±  4%     -15.7%   8.35e+08 ± 18%  perf-stat.i.dTLB-loads
   2625921 ±  5%     -18.8%    2131798 ± 16%  perf-stat.i.dTLB-store-misses
 7.418e+08 ±  4%     -14.9%  6.315e+08 ± 14%  perf-stat.i.dTLB-stores
    461.72 ±  4%     +23.0%     567.97 ±  5%  perf-stat.i.metric.K/sec
     34.98 ±  3%      +5.1       40.11 ±  5%  perf-stat.i.node-load-miss-rate%
    103413 ± 36%    +285.1%     398237 ± 48%  perf-stat.i.node-store-misses
      0.35 ±  2%      -0.0        0.34 ±  3%  perf-stat.overall.dTLB-store-miss-rate%
      1.54 ± 34%      +5.5        7.06 ± 34%  perf-stat.overall.node-store-miss-rate%
  32848650 ±  4%     -13.7%   28347126 ± 13%  perf-stat.ps.branch-misses
     52541 ±  5%     -32.1%      35688 ± 23%  perf-stat.ps.context-switches
     68.33 ±  2%    +139.1%     163.37 ±  9%  perf-stat.ps.cpu-migrations
 9.841e+08 ±  4%     -15.6%  8.307e+08 ± 18%  perf-stat.ps.dTLB-loads
   2606037 ±  5%     -18.6%    2121205 ± 16%  perf-stat.ps.dTLB-store-misses
 7.363e+08 ±  4%     -14.7%  6.282e+08 ± 14%  perf-stat.ps.dTLB-stores
    102590 ± 35%    +285.6%     395600 ± 48%  perf-stat.ps.node-store-misses
      1.32 ± 24%      -0.6        0.67 ± 34%  perf-profile.children.cycles-pp.rep_movs_alternative
      0.50 ± 33%      -0.3        0.18 ± 39%  perf-profile.children.cycles-pp._copy_to_iter
      0.45 ± 36%      -0.3        0.13 ± 57%  perf-profile.children.cycles-pp.copyout
      0.07 ± 45%      +0.1        0.15 ± 34%  perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
      0.08 ± 29%      +0.1        0.17 ± 33%  perf-profile.children.cycles-pp.kthread
      0.08 ± 30%      +0.1        0.17 ± 34%  perf-profile.children.cycles-pp.ret_from_fork
      0.08 ± 30%      +0.1        0.17 ± 34%  perf-profile.children.cycles-pp.ret_from_fork_asm
      0.17 ± 17%      +0.1        0.29 ± 17%  perf-profile.children.cycles-pp.native_irq_return_iret
      0.00            +0.1        0.14 ± 77%  perf-profile.children.cycles-pp.set_next_entity
      0.00            +0.2        0.16 ± 46%  perf-profile.children.cycles-pp.put_prev_task_fair
      0.00            +0.2        0.16 ± 57%  perf-profile.children.cycles-pp.newidle_balance
      0.07 ± 68%      +0.2        0.29 ± 72%  perf-profile.children.cycles-pp.update_load_avg
      0.00            +0.2        0.24 ± 52%  perf-profile.children.cycles-pp.pick_task_dl
      0.25 ± 19%      +0.3        0.52 ± 15%  perf-profile.children.cycles-pp.lapic_next_deadline
      0.04 ± 86%      +0.3        0.33 ± 31%  perf-profile.children.cycles-pp.task_tick_fair
      0.00            +0.3        0.34 ± 68%  perf-profile.children.cycles-pp.hrtimer_start_range_ns
      0.42 ± 15%      +0.3        0.76 ± 13%  perf-profile.children.cycles-pp.clockevents_program_event
      0.00            +0.4        0.37 ± 83%  perf-profile.children.cycles-pp.pick_next_task_fair
      0.00            +0.4        0.37 ± 31%  perf-profile.children.cycles-pp.hrtick
      0.01 ±299%      +0.5        0.46 ± 33%  perf-profile.children.cycles-pp.irqentry_exit_to_user_mode
      0.00            +0.6        0.62 ± 45%  perf-profile.children.cycles-pp.pick_next_task_dl
      0.00            +0.6        0.64 ± 38%  perf-profile.children.cycles-pp.exit_to_user_mode_loop
      0.13 ± 17%      +0.6        0.78 ± 31%  perf-profile.children.cycles-pp.exit_to_user_mode_prepare
      0.11 ± 34%      +1.1        1.22 ±129%  perf-profile.children.cycles-pp.schedule
      0.20 ± 22%      +1.7        1.90 ±131%  perf-profile.children.cycles-pp.__schedule
      1.20 ± 25%      -0.6        0.56 ± 37%  perf-profile.self.cycles-pp.rep_movs_alternative
      0.06 ± 58%      +0.1        0.15 ± 31%  perf-profile.self.cycles-pp.__update_load_avg_cfs_rq
      0.01 ±299%      +0.1        0.11 ± 82%  perf-profile.self.cycles-pp.update_load_avg
      0.17 ± 17%      +0.1        0.29 ± 17%  perf-profile.self.cycles-pp.native_irq_return_iret
      0.24 ± 20%      +0.3        0.51 ± 15%  perf-profile.self.cycles-pp.lapic_next_deadline
      0.02 ±  5%     -81.4%       0.00 ± 14%  perf-sched.sch_delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      0.02 ±  7%     +45.1%       0.02 ± 12%  perf-sched.sch_delay.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      0.00           +47.5%       0.01 ±  5%  perf-sched.sch_delay.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      0.01 ± 13%     -50.8%       0.01 ± 28%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      1.45 ±289%     -99.4%       0.01 ±210%  perf-sched.sch_delay.avg.ms.syslog_print.do_syslog.kmsg_read.vfs_read
      0.03 ± 13%     -99.6%       0.00 ±300%  perf-sched.sch_delay.avg.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
      0.01 ±124%    +387.3%       0.03 ±  7%  perf-sched.sch_delay.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.01 ±156%    +575.0%       0.10 ± 21%  perf-sched.sch_delay.max.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      0.12 ± 13%     -62.9%       0.05 ± 23%  perf-sched.sch_delay.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      0.09 ± 27%     +44.2%       0.13 ± 11%  perf-sched.sch_delay.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      0.09 ± 32%     -96.0%       0.00 ±200%  perf-sched.sch_delay.max.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
    129.16 ±  3%     -26.8%      94.55 ±  2%  perf-sched.total_wait_and_delay.average.ms
      3810           +61.2%       6143 ±  3%  perf-sched.total_wait_and_delay.count.ms
      4983           -39.5%       3016 ± 24%  perf-sched.total_wait_and_delay.max.ms
    129.15 ±  3%     -26.8%      94.54 ±  2%  perf-sched.total_wait_time.average.ms
      4983           -39.5%       3016 ± 24%  perf-sched.total_wait_time.max.ms
     32.76 ±  5%     -55.9%      14.43 ±  4%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      0.56 ±  4%     +98.2%       1.12 ±  2%  perf-sched.wait_and_delay.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      4.29 ±  8%     -17.7%       3.53 ±  6%  perf-sched.wait_and_delay.avg.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
    583.69 ±  3%     -33.8%     386.15 ± 15%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      0.63 ±  4%     +76.2%       1.11        perf-sched.wait_and_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
     29.03 ± 15%     -40.4%      17.30 ± 24%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    623.88 ±  7%     -67.9%     199.98 ±  4%  perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    469.42 ±  7%     +15.3%     541.30 ±  2%  perf-sched.wait_and_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      4.10 ±201%   +4297.6%     180.30 ± 28%  perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
     20.60 ±  3%     +98.5%      40.90 ± 16%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
    167.50 ± 15%     +72.7%     289.30 ± 24%  perf-sched.wait_and_delay.count.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    361.30 ±  8%    +240.1%       1228 ±  6%  perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    261.10 ±  9%     +28.6%     335.70 ±  2%  perf-sched.wait_and_delay.count.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      4983           -79.9%       1000        perf-sched.wait_and_delay.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
     21.38 ±  2%     +78.1%      38.08 ±  3%  perf-sched.wait_and_delay.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      0.01 ±200%   +8768.5%       1.32 ±144%  perf-sched.wait_and_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      1.37 ±  7%     +71.6%       2.35 ±  5%  perf-sched.wait_and_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.09 ± 32%     -48.2%       0.05 ±  9%  perf-sched.wait_and_delay.max.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
     32.76 ±  5%     -56.0%      14.43 ±  4%  perf-sched.wait_time.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
     16.68 ± 12%     -89.5%       1.75 ±268%  perf-sched.wait_time.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      0.55 ±  4%     +99.9%       1.09 ±  2%  perf-sched.wait_time.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      4.28 ±  8%     -17.8%       3.52 ±  6%  perf-sched.wait_time.avg.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
    583.67 ±  3%     -33.8%     386.14 ± 15%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      0.61 ±  5%     +78.9%       1.09        perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
     29.01 ± 15%     -40.4%      17.28 ± 24%  perf-sched.wait_time.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    623.86 ±  7%     -67.9%     199.97 ±  4%  perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     15.80 ± 28%     -88.9%       1.76 ±267%  perf-sched.wait_time.avg.ms.syslog_print.do_syslog.kmsg_read.vfs_read
    469.40 ±  7%     +15.3%     541.27 ±  2%  perf-sched.wait_time.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      4983           -79.9%       1000        perf-sched.wait_time.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
     55.91           -89.5%       5.86 ±280%  perf-sched.wait_time.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
     21.34 ±  2%     +78.3%      38.05 ±  3%  perf-sched.wait_time.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      0.01 ±134%  +83934.9%      12.52 ±289%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.20 ±  7%     -20.9%       0.16 ± 14%  perf-sched.wait_time.max.ms.ipmi_thread.kthread.ret_from_fork.ret_from_fork_asm
      1.32 ±  5%     +73.0%       2.29 ±  5%  perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
     50.70 ± 30%     -88.4%       5.87 ±280%  perf-sched.wait_time.max.ms.syslog_print.do_syslog.kmsg_read.vfs_read
      0.00 ±200%   +1860.0%       0.05 ±  9%  perf-sched.wait_time.max.ms.wait_for_partner.fifo_open.do_dentry_open.do_open


***************************************************************************************************
lkp-hsw-d04: 8 threads 1 sockets Intel(R) Core(TM) i7-4770K CPU @ 3.50GHz (Haswell) with 8G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/testcase:
  gcc-12/performance/x86_64-rhel-8.3/100/debian-11.1-x86_64-20220510.cgz/lkp-hsw-d04/adrestia

commit: 
  837b5e5eb8 ("sched/deadline: Introduce deadline servers")
  80a1fb6b3d ("sched/fair: Add trivial fair server")

837b5e5eb8eec6d0 80a1fb6b3d64dbeafe3f699748d 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      0.43 ± 12%    +328.9%       1.85 ±  5%  vmstat.procs.r
     10843          +336.0%      47282        vmstat.system.in
      0.81 ±  9%      +0.4        1.25        mpstat.cpu.all.irq%
      0.05 ±  2%      +0.0        0.06        mpstat.cpu.all.soft%
      2.69 ±  7%      +1.2        3.88        mpstat.cpu.all.sys%
      1.57 ±  7%      +0.2        1.82 ±  4%  mpstat.cpu.all.usr%
    534.01            +3.4%     552.06        adrestia.time.elapsed_time
    534.01            +3.4%     552.06        adrestia.time.elapsed_time.max
    138.00 ±  6%  +1.1e+05%     150811 ±  2%  adrestia.time.involuntary_context_switches
     35.00           +22.9%      43.00        adrestia.time.percent_of_cpu_this_job_got
    126.44           +35.3%     171.12        adrestia.time.system_time
     64.37            +8.2%      69.66 ±  4%  adrestia.time.user_time
      3.00          +133.3%       7.00        adrestia.wakeup_cost_periodic_us
    339.60 ±  6%     +36.5%     463.40        turbostat.Avg_MHz
      9.05 ±  6%      +3.3       12.38        turbostat.Busy%
  15751443           -15.0%   13389775        turbostat.C1
     50.68 ±  7%     -17.8       32.91 ±  3%  turbostat.C1%
   2761471           -59.4%    1121889        turbostat.C1E
      3.63 ±  7%      -2.0        1.61        turbostat.C1E%
   2121421           -22.1%    1653050        turbostat.C3
     84118 ±  2%    +691.4%     665709        turbostat.C6
      0.90 ±  7%      +8.7        9.65        turbostat.C6%
   1047748 ± 36%     +72.6%    1808036 ±  5%  turbostat.C7s
     73.29 ±  7%     -23.9%      55.75 ±  2%  turbostat.CPU%c1
      7.71 ±  6%     +35.3%      10.42        turbostat.CPU%c3
      0.09 ±  7%   +7855.6%       7.16        turbostat.CPU%c6
   6135197 ±  6%    +338.4%   26895159        turbostat.IRQ
  44640334           +10.7%   49429178        turbostat.POLL
      1.98 ±  8%      +0.8        2.80        turbostat.POLL%
     48565 ±  3%     +16.5%      56588        sched_debug.cfs_rq:/.avg_vruntime.avg
     31794 ±  7%     +31.5%      41816 ±  8%  sched_debug.cfs_rq:/.avg_vruntime.min
     48565 ±  3%     +16.5%      56588        sched_debug.cfs_rq:/.min_vruntime.avg
     31794 ±  7%     +31.5%      41811 ±  8%  sched_debug.cfs_rq:/.min_vruntime.min
     42.23 ± 48%     -69.7%      12.80 ± 89%  sched_debug.cfs_rq:/.removed.load_avg.avg
    321.99 ± 51%     -68.2%     102.38 ± 89%  sched_debug.cfs_rq:/.removed.load_avg.max
    107.97 ± 50%     -68.6%      33.86 ± 89%  sched_debug.cfs_rq:/.removed.load_avg.stddev
     19.19 ± 55%     -70.9%       5.58 ±103%  sched_debug.cfs_rq:/.removed.runnable_avg.avg
    152.72 ± 56%     -70.8%      44.66 ±103%  sched_debug.cfs_rq:/.removed.runnable_avg.max
     50.53 ± 56%     -70.8%      14.77 ±103%  sched_debug.cfs_rq:/.removed.runnable_avg.stddev
     19.01 ± 56%     -71.5%       5.41 ±108%  sched_debug.cfs_rq:/.removed.util_avg.avg
    151.76 ± 57%     -71.5%      43.28 ±108%  sched_debug.cfs_rq:/.removed.util_avg.max
     50.20 ± 57%     -71.5%      14.31 ±108%  sched_debug.cfs_rq:/.removed.util_avg.stddev
    290789 ± 24%     -24.0%     220891 ±  4%  sched_debug.cpu.avg_idle.avg
    932676 ±  2%     -18.8%     757517 ±  8%  sched_debug.cpu.avg_idle.max
    288735 ±  4%     -17.8%     237197 ±  6%  sched_debug.cpu.avg_idle.stddev
      0.48 ± 11%     +59.9%       0.76 ± 17%  sched_debug.cpu.nr_running.avg
      1.39 ±  8%     +77.3%       2.46 ± 13%  sched_debug.cpu.nr_running.max
      0.53 ±  9%     +81.2%       0.96 ± 14%  sched_debug.cpu.nr_running.stddev
     66.31 ± 24%     -42.4%      38.20 ± 32%  sched_debug.cpu.nr_uninterruptible.max
      0.01 ± 23%     -54.8%       0.00 ± 14%  perf-sched.sch_delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      0.01 ± 55%     -66.7%       0.00 ± 20%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.00          +100.0%       0.00        perf-sched.sch_delay.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      0.01 ± 33%     -69.2%       0.00 ± 84%  perf-sched.sch_delay.avg.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
      0.00          +100.0%       0.00        perf-sched.total_sch_delay.average.ms
      0.44 ±  7%     +21.4%       0.53 ± 10%  perf-sched.wait_and_delay.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      0.35           +23.1%       0.43 ±  8%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    502.06 ±  3%     -42.6%     288.30 ± 11%  perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     93.40 ±  4%     +78.2%     166.40 ±  9%  perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1190 ± 62%     +85.6%       2209 ± 33%  perf-sched.wait_and_delay.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.97 ± 10%     +57.0%       1.52 ± 23%  perf-sched.wait_and_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.43 ±  7%     +21.9%       0.52 ± 11%  perf-sched.wait_time.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      0.01 ±178%  +23380.6%       3.15 ± 65%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      0.00 ±133%  +1.4e+05%       0.86 ± 87%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.35           +23.4%       0.43 ±  8%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    502.05 ±  3%     -42.6%     288.29 ± 11%  perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.00 ± 63%    +540.0%       0.01 ± 15%  perf-sched.wait_time.avg.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
      1190 ± 62%     +85.6%       2209 ± 33%  perf-sched.wait_time.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.01 ±159%  +81047.3%      12.01 ± 52%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      0.00 ±122%  +1.2e+06%       9.31 ± 63%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.97 ± 10%     +56.6%       1.51 ± 24%  perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.01 ± 42%    +107.0%       0.02 ±  6%  perf-sched.wait_time.max.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
 3.758e+08 ±  7%     +24.7%  4.686e+08        perf-stat.i.branch-instructions
   5644510 ±  6%     +66.8%    9416820 ±  2%  perf-stat.i.branch-misses
    243151 ±  7%     +37.5%     334402        perf-stat.i.cache-misses
  13321740 ±  4%     +70.2%   22679135        perf-stat.i.cache-references
 2.691e+09 ±  6%     +37.8%  3.708e+09        perf-stat.i.cpu-cycles
    701.43 ±  7%   +2113.4%      15525        perf-stat.i.cpu-migrations
    723725 ±  6%     +48.0%    1071102 ± 12%  perf-stat.i.dTLB-load-misses
  4.57e+08 ±  7%     +25.3%  5.726e+08        perf-stat.i.dTLB-loads
    405856 ±  6%     +25.7%     510074 ±  4%  perf-stat.i.dTLB-store-misses
 2.846e+08 ±  6%     +24.8%  3.551e+08        perf-stat.i.dTLB-stores
 1.713e+09 ±  7%     +25.1%  2.144e+09        perf-stat.i.instructions
      2815 ±  4%     +41.1%       3971 ±  2%  perf-stat.i.instructions-per-iTLB-miss
      0.34 ±  6%     +37.8%       0.46        perf-stat.i.metric.GHz
    141.28 ±  7%     +25.5%     177.34        perf-stat.i.metric.M/sec
      1.50 ±  3%      +0.5        2.01        perf-stat.overall.branch-miss-rate%
      1.84 ± 12%      -0.4        1.48 ±  2%  perf-stat.overall.cache-miss-rate%
      1.57           +10.0%       1.73        perf-stat.overall.cpi
      0.16            +0.0        0.19 ± 11%  perf-stat.overall.dTLB-load-miss-rate%
     41.38            +3.4       44.76        perf-stat.overall.iTLB-load-miss-rate%
      2997           +26.3%       3785        perf-stat.overall.instructions-per-iTLB-miss
      0.64            -9.1%       0.58        perf-stat.overall.ipc
 3.752e+08 ±  7%     +24.7%  4.678e+08        perf-stat.ps.branch-instructions
   5637809 ±  6%     +66.8%    9402578 ±  2%  perf-stat.ps.branch-misses
    242846 ±  7%     +37.5%     333900        perf-stat.ps.cache-misses
  13298995 ±  4%     +70.2%   22639518        perf-stat.ps.cache-references
 2.687e+09 ±  6%     +37.8%  3.702e+09        perf-stat.ps.cpu-cycles
    700.14 ±  7%   +2113.5%      15497        perf-stat.ps.cpu-migrations
    722454 ±  6%     +48.0%    1069218 ± 12%  perf-stat.ps.dTLB-load-misses
 4.563e+08 ±  7%     +25.3%  5.716e+08        perf-stat.ps.dTLB-loads
    405155 ±  6%     +25.7%     509189 ±  4%  perf-stat.ps.dTLB-store-misses
 2.842e+08 ±  6%     +24.8%  3.546e+08        perf-stat.ps.dTLB-stores
 1.711e+09 ±  7%     +25.1%  2.141e+09        perf-stat.ps.instructions
 9.597e+11           +26.5%  1.214e+12        perf-stat.total.instructions
     33.74 ±  5%      -9.6       24.15        perf-profile.calltrace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
     56.18 ±  4%      -7.9       48.25        perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
     48.42 ±  2%      -5.6       42.85 ±  4%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
     50.76 ±  2%      -5.5       45.31 ±  4%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     66.67 ±  4%      -5.3       61.40        perf-profile.calltrace.cycles-pp.secondary_startup_64_no_verify
      5.69 ±  6%      -1.1        4.59 ±  5%  perf-profile.calltrace.cycles-pp.__libc_write.start_thread
      4.40 ±  6%      -0.8        3.60 ±  6%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write.start_thread
      4.45 ±  6%      -0.8        3.67 ±  5%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__libc_write.start_thread
      1.92 ± 12%      -0.4        1.50 ±  7%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read.start_thread
      1.41 ±  5%      -0.4        1.02 ±  9%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write.start_thread
      1.28 ± 10%      +0.3        1.53 ±  5%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
      1.30 ± 11%      +0.3        1.56 ±  6%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
      0.59 ± 50%      +0.5        1.13 ±  4%  perf-profile.calltrace.cycles-pp.select_task_rq.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock
      0.53 ± 51%      +0.6        1.09 ±  7%  perf-profile.calltrace.cycles-pp.select_task_rq_fair.select_task_rq.try_to_wake_up.autoremove_wake_function.__wake_up_common
      0.00            +0.6        0.59 ± 10%  perf-profile.calltrace.cycles-pp.finish_task_switch.__schedule.schedule.pipe_read.vfs_read
      1.89 ± 22%      +0.6        2.54 ±  6%  perf-profile.calltrace.cycles-pp.__wake_up_common.__wake_up_common_lock.pipe_write.vfs_write.ksys_write
      0.00            +0.7        0.68 ±  9%  perf-profile.calltrace.cycles-pp.select_idle_sibling.select_task_rq_fair.select_task_rq.try_to_wake_up.autoremove_wake_function
      0.00            +0.7        0.69 ± 12%  perf-profile.calltrace.cycles-pp.pick_next_task_fair.pick_task_dl.pick_next_task_dl.__schedule.schedule_idle
      1.64 ± 23%      +0.7        2.36 ±  6%  perf-profile.calltrace.cycles-pp.autoremove_wake_function.__wake_up_common.__wake_up_common_lock.pipe_write.vfs_write
      1.53 ± 25%      +0.8        2.29 ±  5%  perf-profile.calltrace.cycles-pp.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock.pipe_write
      0.00            +0.8        0.81 ± 14%  perf-profile.calltrace.cycles-pp.cpudl_clear.__dequeue_dl_entity.dl_server_stop.dequeue_task_fair.__schedule
      0.00            +0.8        0.81 ± 25%  perf-profile.calltrace.cycles-pp.hrtimer_start_range_ns.pick_next_task_dl.__schedule.schedule_idle.do_idle
      2.02 ± 23%      +0.8        2.84 ±  6%  perf-profile.calltrace.cycles-pp.__wake_up_common_lock.pipe_write.vfs_write.ksys_write.do_syscall_64
      0.00            +0.8        0.82 ±  9%  perf-profile.calltrace.cycles-pp.pick_task_dl.pick_next_task_dl.__schedule.schedule_idle.do_idle
      2.72 ±  5%      +0.9        3.58 ±  9%  perf-profile.calltrace.cycles-pp.__flush_smp_call_function_queue.flush_smp_call_function_queue.do_idle.cpu_startup_entry.start_secondary
      0.00            +0.9        0.91 ± 14%  perf-profile.calltrace.cycles-pp.__dequeue_dl_entity.dl_server_stop.dequeue_task_fair.__schedule.schedule
      1.69 ± 11%      +1.1        2.77 ±  2%  perf-profile.calltrace.cycles-pp.enqueue_task_fair.activate_task.ttwu_do_activate.sched_ttwu_pending.__flush_smp_call_function_queue
      2.36 ±  8%      +1.1        3.45 ±  2%  perf-profile.calltrace.cycles-pp.sched_ttwu_pending.__flush_smp_call_function_queue.flush_smp_call_function_queue.do_idle.cpu_startup_entry
      0.00            +1.1        1.11 ±  5%  perf-profile.calltrace.cycles-pp.update_blocked_averages.newidle_balance.pick_next_task_fair.__schedule.schedule
      1.89 ±  8%      +1.1        3.02 ±  2%  perf-profile.calltrace.cycles-pp.ttwu_do_activate.sched_ttwu_pending.__flush_smp_call_function_queue.flush_smp_call_function_queue.do_idle
      1.73 ±  9%      +1.1        2.86 ±  2%  perf-profile.calltrace.cycles-pp.activate_task.ttwu_do_activate.sched_ttwu_pending.__flush_smp_call_function_queue.flush_smp_call_function_queue
      0.00            +1.1        1.14 ± 14%  perf-profile.calltrace.cycles-pp.dl_server_stop.dequeue_task_fair.__schedule.schedule.pipe_read
      2.90 ±  7%      +1.1        4.04 ±  6%  perf-profile.calltrace.cycles-pp.flush_smp_call_function_queue.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
      2.37 ±  8%      +1.4        3.74 ± 10%  perf-profile.calltrace.cycles-pp.schedule_idle.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
      2.26 ±  8%      +1.4        3.66 ± 10%  perf-profile.calltrace.cycles-pp.__schedule.schedule_idle.do_idle.cpu_startup_entry.start_secondary
      2.23 ±  5%      +1.6        3.80 ±  7%  perf-profile.calltrace.cycles-pp.dequeue_task_fair.__schedule.schedule.pipe_read.vfs_read
      0.00            +1.9        1.90 ± 14%  perf-profile.calltrace.cycles-pp.pick_next_task_dl.__schedule.schedule_idle.do_idle.cpu_startup_entry
      0.00            +2.8        2.84 ± 11%  perf-profile.calltrace.cycles-pp.update_sg_lb_stats.update_sd_lb_stats.find_busiest_group.load_balance.newidle_balance
      0.00            +3.6        3.58 ± 10%  perf-profile.calltrace.cycles-pp.update_sd_lb_stats.find_busiest_group.load_balance.newidle_balance.pick_next_task_fair
      0.00            +3.9        3.91 ± 10%  perf-profile.calltrace.cycles-pp.find_busiest_group.load_balance.newidle_balance.pick_next_task_fair.__schedule
      0.00            +6.1        6.11 ±  6%  perf-profile.calltrace.cycles-pp.load_balance.newidle_balance.pick_next_task_fair.__schedule.schedule
     19.65            +6.8       26.47        perf-profile.calltrace.cycles-pp.start_thread
      0.00            +7.8        7.83 ±  5%  perf-profile.calltrace.cycles-pp.newidle_balance.pick_next_task_fair.__schedule.schedule.pipe_read
      0.00            +7.9        7.91 ±  4%  perf-profile.calltrace.cycles-pp.pick_next_task_fair.__schedule.schedule.pipe_read.vfs_read
     13.30 ±  3%      +8.1       21.36        perf-profile.calltrace.cycles-pp.__libc_read.start_thread
     11.18 ±  4%      +8.5       19.65        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__libc_read.start_thread
     10.98 ±  4%      +8.6       19.55        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read.start_thread
      9.93 ±  4%      +8.6       18.57        perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read
      8.88 ±  6%      +9.0       17.84        perf-profile.calltrace.cycles-pp.pipe_read.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      8.83 ±  4%      +9.0       17.86        perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read.start_thread
      4.68 ±  4%      +9.7       14.34        perf-profile.calltrace.cycles-pp.schedule.pipe_read.vfs_read.ksys_read.do_syscall_64
      4.59 ±  4%      +9.7       14.26        perf-profile.calltrace.cycles-pp.__schedule.schedule.pipe_read.vfs_read.ksys_read
     33.75 ±  5%      -9.6       24.15        perf-profile.children.cycles-pp.intel_idle
     56.46 ±  4%      -7.9       48.59        perf-profile.children.cycles-pp.cpuidle_enter
     56.42 ±  4%      -7.9       48.56        perf-profile.children.cycles-pp.cpuidle_enter_state
     59.19 ±  4%      -7.8       51.36        perf-profile.children.cycles-pp.cpuidle_idle_call
     66.67 ±  4%      -5.3       61.40        perf-profile.children.cycles-pp.secondary_startup_64_no_verify
     66.67 ±  4%      -5.3       61.40        perf-profile.children.cycles-pp.cpu_startup_entry
     66.64 ±  4%      -5.3       61.37        perf-profile.children.cycles-pp.do_idle
      6.04 ± 10%      -1.4        4.65 ±  4%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      2.21 ± 14%      -0.8        1.40 ±  7%  perf-profile.children.cycles-pp.__entry_text_start
      1.97 ± 14%      -0.6        1.41 ±  9%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      1.25 ± 12%      -0.4        0.88 ±  8%  perf-profile.children.cycles-pp.__fdget_pos
      1.15 ± 11%      -0.3        0.83 ±  9%  perf-profile.children.cycles-pp.__fget_light
      1.05 ± 15%      -0.3        0.77 ±  9%  perf-profile.children.cycles-pp.generic_update_time
      0.55 ± 19%      -0.3        0.28 ± 11%  perf-profile.children.cycles-pp.mutex_unlock
      0.89 ±  8%      -0.2        0.64 ± 10%  perf-profile.children.cycles-pp.security_file_permission
      0.55 ± 25%      -0.2        0.31 ± 16%  perf-profile.children.cycles-pp.__mark_inode_dirty
      0.76 ±  9%      -0.2        0.59 ±  8%  perf-profile.children.cycles-pp.apparmor_file_permission
      0.32 ±  9%      -0.1        0.18 ± 22%  perf-profile.children.cycles-pp.__mnt_want_write
      0.37 ± 12%      -0.1        0.23 ± 22%  perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.30 ± 18%      -0.1        0.20 ± 31%  perf-profile.children.cycles-pp.restore_fpregs_from_fpstate
      0.26 ±  8%      -0.1        0.18 ± 19%  perf-profile.children.cycles-pp.__dequeue_entity
      0.32 ± 15%      -0.1        0.26 ± 21%  perf-profile.children.cycles-pp.tick_nohz_idle_exit
      0.09 ± 29%      -0.0        0.05 ± 52%  perf-profile.children.cycles-pp.filemap_map_pages
      0.04 ± 83%      +0.1        0.09 ± 15%  perf-profile.children.cycles-pp.update_curr_se
      0.00            +0.1        0.07 ± 12%  perf-profile.children.cycles-pp.tick_check_oneshot_broadcast_this_cpu
      0.00            +0.1        0.07 ± 17%  perf-profile.children.cycles-pp.rcu_sched_clock_irq
      0.00            +0.1        0.07 ± 19%  perf-profile.children.cycles-pp.irqentry_exit
      0.00            +0.1        0.07 ± 20%  perf-profile.children.cycles-pp.__update_load_avg_blocked_se
      0.04 ± 83%      +0.1        0.12 ± 10%  perf-profile.children.cycles-pp.tick_nohz_stop_idle
      0.10 ± 22%      +0.1        0.18 ± 12%  perf-profile.children.cycles-pp.hrtimer_next_event_without
      0.01 ±200%      +0.1        0.09 ± 12%  perf-profile.children.cycles-pp.error_entry
      0.00            +0.1        0.08 ± 33%  perf-profile.children.cycles-pp.hrtimer_active
      0.00            +0.1        0.09 ± 23%  perf-profile.children.cycles-pp.fair_server_pick
      0.00            +0.1        0.09 ± 30%  perf-profile.children.cycles-pp.ct_nmi_enter
      0.00            +0.1        0.09 ± 21%  perf-profile.children.cycles-pp.cpudl_heapify_up
      0.08 ± 60%      +0.1        0.16 ± 30%  perf-profile.children.cycles-pp.common_nsleep
      0.08 ± 60%      +0.1        0.16 ± 30%  perf-profile.children.cycles-pp.do_nanosleep
      0.08 ± 60%      +0.1        0.16 ± 30%  perf-profile.children.cycles-pp.hrtimer_nanosleep
      0.00            +0.1        0.09 ± 27%  perf-profile.children.cycles-pp.resched_curr
      0.00            +0.1        0.09 ± 18%  perf-profile.children.cycles-pp.update_dl_rq_load_avg
      0.04 ± 84%      +0.1        0.14 ± 37%  perf-profile.children.cycles-pp.__enqueue_entity
      0.12 ± 29%      +0.1        0.23 ± 33%  perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      0.00            +0.1        0.10 ± 36%  perf-profile.children.cycles-pp.can_migrate_task
      0.08 ± 69%      +0.1        0.19 ± 35%  perf-profile.children.cycles-pp.__x64_sys_clock_nanosleep
      0.13 ± 39%      +0.1        0.25 ± 29%  perf-profile.children.cycles-pp.put_prev_entity
      0.08 ± 66%      +0.1        0.19 ± 17%  perf-profile.children.cycles-pp.wakeup_preempt
      0.00            +0.1        0.11 ± 10%  perf-profile.children.cycles-pp.tick_program_event
      0.03 ±133%      +0.1        0.15 ± 17%  perf-profile.children.cycles-pp.remove_entity_load_avg
      0.00            +0.1        0.12 ± 44%  perf-profile.children.cycles-pp.should_we_balance
      0.10 ± 35%      +0.1        0.21 ± 39%  perf-profile.children.cycles-pp.__update_idle_core
      0.07 ± 23%      +0.1        0.19 ±  6%  perf-profile.children.cycles-pp.__hrtimer_next_event_base
      0.00            +0.1        0.12 ± 40%  perf-profile.children.cycles-pp.rb_insert_color
      0.00            +0.1        0.12 ± 38%  perf-profile.children.cycles-pp.pick_next_task_stop
      0.03 ±123%      +0.1        0.15 ± 20%  perf-profile.children.cycles-pp.ktime_get_update_offsets_now
      0.00            +0.1        0.13 ± 42%  perf-profile.children.cycles-pp.update_rt_rq_load_avg
      0.00            +0.1        0.13 ± 27%  perf-profile.children.cycles-pp.irqentry_enter
      0.01 ±200%      +0.1        0.14 ± 18%  perf-profile.children.cycles-pp._find_next_bit
      0.00            +0.1        0.13 ± 16%  perf-profile.children.cycles-pp.task_non_contending
      0.00            +0.1        0.14 ± 26%  perf-profile.children.cycles-pp.task_h_load
      0.00            +0.1        0.14 ± 23%  perf-profile.children.cycles-pp.cpudl_heapify
      0.01 ±200%      +0.2        0.17 ± 21%  perf-profile.children.cycles-pp.hrtimer_update_next_event
      0.57 ± 10%      +0.2        0.73 ±  9%  perf-profile.children.cycles-pp.irq_exit_rcu
      0.11 ± 30%      +0.2        0.27 ± 16%  perf-profile.children.cycles-pp.irqtime_account_irq
      0.15 ± 30%      +0.2        0.31 ± 17%  perf-profile.children.cycles-pp.__cond_resched
      0.00            +0.2        0.17 ± 26%  perf-profile.children.cycles-pp.__remove_hrtimer
      0.00            +0.2        0.17 ± 17%  perf-profile.children.cycles-pp.update_sd_pick_busiest
      0.04 ±124%      +0.2        0.22 ± 16%  perf-profile.children.cycles-pp.migrate_task_rq_fair
      0.05 ± 83%      +0.2        0.23 ± 13%  perf-profile.children.cycles-pp.tick_irq_enter
      0.00            +0.2        0.20 ± 16%  perf-profile.children.cycles-pp.find_busiest_queue
      0.31 ± 23%      +0.2        0.51 ± 19%  perf-profile.children.cycles-pp.__x86_indirect_thunk_rax
      0.06 ± 58%      +0.2        0.27 ± 24%  perf-profile.children.cycles-pp.wake_affine
      0.00            +0.2        0.21 ± 27%  perf-profile.children.cycles-pp.rb_erase
      0.06 ± 70%      +0.2        0.28 ± 31%  perf-profile.children.cycles-pp.update_irq_load_avg
      0.06 ± 81%      +0.2        0.28 ± 19%  perf-profile.children.cycles-pp.irq_enter_rcu
      0.46 ± 15%      +0.2        0.69 ± 19%  perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
      0.03 ±125%      +0.2        0.27 ± 24%  perf-profile.children.cycles-pp.select_idle_core
      0.15 ± 44%      +0.2        0.39 ± 16%  perf-profile.children.cycles-pp.native_irq_return_iret
      0.06 ± 92%      +0.2        0.30 ± 22%  perf-profile.children.cycles-pp.set_task_cpu
      0.18 ± 38%      +0.3        0.43 ±  6%  perf-profile.children.cycles-pp.update_rq_clock
      0.00            +0.3        0.25 ± 24%  perf-profile.children.cycles-pp.delay_tsc
      0.05 ± 51%      +0.3        0.31 ± 37%  perf-profile.children.cycles-pp.timerqueue_add
      0.04 ± 85%      +0.3        0.31 ± 22%  perf-profile.children.cycles-pp.timerqueue_del
      0.00            +0.3        0.28 ± 12%  perf-profile.children.cycles-pp.task_tick_fair
      0.01 ±200%      +0.3        0.29 ± 16%  perf-profile.children.cycles-pp.irqentry_exit_to_user_mode
      0.00            +0.3        0.28 ± 25%  perf-profile.children.cycles-pp.hrtick_start
      0.37 ± 13%      +0.3        0.68 ±  9%  perf-profile.children.cycles-pp.select_idle_sibling
      0.04 ±141%      +0.3        0.35 ± 25%  perf-profile.children.cycles-pp.cpu_util
      0.08 ± 26%      +0.3        0.40 ± 33%  perf-profile.children.cycles-pp.enqueue_hrtimer
      0.00            +0.3        0.32 ± 17%  perf-profile.children.cycles-pp.io_serial_in
      0.37 ± 24%      +0.3        0.70 ±  9%  perf-profile.children.cycles-pp.sched_clock
      0.49 ± 16%      +0.4        0.84 ± 10%  perf-profile.children.cycles-pp.read_tsc
      0.00            +0.4        0.35 ± 20%  perf-profile.children.cycles-pp.idle_cpu
      0.00            +0.4        0.36 ± 17%  perf-profile.children.cycles-pp.hrtimer_try_to_cancel
      0.43 ± 20%      +0.4        0.81 ±  9%  perf-profile.children.cycles-pp.sched_clock_cpu
      0.25 ± 41%      +0.4        0.64 ± 13%  perf-profile.children.cycles-pp.update_rq_clock_task
      0.63 ±  5%      +0.4        1.03 ± 12%  perf-profile.children.cycles-pp.exit_to_user_mode_prepare
      0.00            +0.4        0.41 ±  8%  perf-profile.children.cycles-pp._find_next_and_bit
      0.03 ±125%      +0.4        0.46 ± 14%  perf-profile.children.cycles-pp.select_idle_cpu
      0.00            +0.4        0.42 ± 19%  perf-profile.children.cycles-pp.task_contending
      0.70 ± 14%      +0.4        1.14 ±  4%  perf-profile.children.cycles-pp.select_task_rq
      0.65 ± 19%      +0.4        1.09 ±  7%  perf-profile.children.cycles-pp.select_task_rq_fair
      0.09 ± 33%      +0.5        0.54 ± 19%  perf-profile.children.cycles-pp.__sysvec_call_function_single
      0.00            +0.5        0.46 ± 15%  perf-profile.children.cycles-pp.detach_tasks
      0.63 ± 19%      +0.5        1.09 ±  9%  perf-profile.children.cycles-pp.ktime_get
      1.50 ± 11%      +0.5        2.01 ±  7%  perf-profile.children.cycles-pp.update_load_avg
      0.12 ± 21%      +0.5        0.64 ± 14%  perf-profile.children.cycles-pp.__update_blocked_fair
      0.12 ± 30%      +0.5        0.65 ± 17%  perf-profile.children.cycles-pp.sysvec_call_function_single
      0.00            +0.6        0.57 ± 13%  perf-profile.children.cycles-pp.exit_to_user_mode_loop
      0.00            +0.6        0.58 ±  9%  perf-profile.children.cycles-pp.wait_for_lsr
      0.15 ± 30%      +0.6        0.73 ± 12%  perf-profile.children.cycles-pp.asm_sysvec_call_function_single
      0.00            +0.6        0.59 ±  9%  perf-profile.children.cycles-pp.serial8250_console_write
      0.00            +0.6        0.59 ± 14%  perf-profile.children.cycles-pp.cpudl_set
      0.00            +0.6        0.60 ± 10%  perf-profile.children.cycles-pp.asm_sysvec_irq_work
      0.00            +0.6        0.60 ± 10%  perf-profile.children.cycles-pp.sysvec_irq_work
      0.00            +0.6        0.60 ± 10%  perf-profile.children.cycles-pp.__sysvec_irq_work
      0.00            +0.6        0.60 ± 10%  perf-profile.children.cycles-pp.irq_work_run
      0.00            +0.6        0.60 ± 10%  perf-profile.children.cycles-pp.irq_work_single
      0.00            +0.6        0.60 ± 10%  perf-profile.children.cycles-pp._printk
      0.00            +0.6        0.60 ± 10%  perf-profile.children.cycles-pp.vprintk_emit
      0.00            +0.6        0.60 ± 10%  perf-profile.children.cycles-pp.console_unlock
      0.00            +0.6        0.60 ± 10%  perf-profile.children.cycles-pp.console_flush_all
      0.00            +0.6        0.61 ±  9%  perf-profile.children.cycles-pp.irq_work_run_list
      0.00            +0.6        0.63 ±  9%  perf-profile.children.cycles-pp.hrtick
      1.91 ± 22%      +0.6        2.56 ±  6%  perf-profile.children.cycles-pp.__wake_up_common
      0.00            +0.7        0.66 ±  7%  perf-profile.children.cycles-pp.cpupri_set
      0.46 ± 15%      +0.7        1.17 ±  9%  perf-profile.children.cycles-pp.finish_task_switch
      1.65 ± 23%      +0.7        2.37 ±  6%  perf-profile.children.cycles-pp.autoremove_wake_function
      0.86 ± 16%      +0.7        1.58 ± 15%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      1.61 ± 24%      +0.8        2.39 ±  4%  perf-profile.children.cycles-pp.try_to_wake_up
      0.00            +0.8        0.83 ± 13%  perf-profile.children.cycles-pp.cpudl_clear
      0.17 ± 12%      +0.9        1.03 ± 43%  perf-profile.children.cycles-pp.clockevents_program_event
      0.01 ±200%      +0.9        0.91 ± 16%  perf-profile.children.cycles-pp.raw_spin_rq_lock_nested
      2.17 ± 21%      +0.9        3.11 ±  5%  perf-profile.children.cycles-pp.__wake_up_common_lock
      1.24 ±  8%      +1.0        2.19        perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.00            +1.0        0.96 ± 12%  perf-profile.children.cycles-pp.__dequeue_dl_entity
      0.52 ± 14%      +1.0        1.55 ±  8%  perf-profile.children.cycles-pp._raw_spin_lock
      0.00            +1.0        1.03 ± 12%  perf-profile.children.cycles-pp.enqueue_dl_entity
      0.00            +1.1        1.06 ± 17%  perf-profile.children.cycles-pp.__hrtimer_start_range_ns
      0.01 ±200%      +1.1        1.09 ± 12%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      0.00            +1.1        1.10 ± 12%  perf-profile.children.cycles-pp.pick_task_dl
      0.18 ± 13%      +1.2        1.36 ±  4%  perf-profile.children.cycles-pp.update_blocked_averages
      0.00            +1.2        1.19 ± 12%  perf-profile.children.cycles-pp.dl_server_stop
      3.20 ±  3%      +1.3        4.53 ±  4%  perf-profile.children.cycles-pp.__flush_smp_call_function_queue
      3.32 ±  4%      +1.4        4.70 ±  4%  perf-profile.children.cycles-pp.flush_smp_call_function_queue
      2.77 ±  9%      +1.4        4.21 ±  7%  perf-profile.children.cycles-pp.schedule_idle
      2.74 ±  5%      +1.5        4.20 ±  4%  perf-profile.children.cycles-pp.sched_ttwu_pending
      0.00            +1.6        1.62 ± 23%  perf-profile.children.cycles-pp.hrtimer_start_range_ns
      2.01 ±  7%      +1.6        3.65 ±  3%  perf-profile.children.cycles-pp.enqueue_task_fair
      2.25 ±  6%      +1.6        3.89 ±  5%  perf-profile.children.cycles-pp.ttwu_do_activate
      1.54 ±  6%      +1.7        3.23 ±  6%  perf-profile.children.cycles-pp.hrtimer_interrupt
      2.07 ±  7%      +1.7        3.79 ±  4%  perf-profile.children.cycles-pp.activate_task
      1.57 ±  7%      +1.7        3.29 ±  6%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      2.28 ±  6%      +1.8        4.05 ±  6%  perf-profile.children.cycles-pp.dequeue_task_fair
      2.26 ±  4%      +2.4        4.63 ±  5%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.00            +2.6        2.63 ± 12%  perf-profile.children.cycles-pp.pick_next_task_dl
      0.08 ± 96%      +2.9        3.01 ± 12%  perf-profile.children.cycles-pp.update_sg_lb_stats
      2.48 ±  3%      +3.3        5.79 ±  4%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.12 ± 73%      +3.6        3.75 ± 10%  perf-profile.children.cycles-pp.update_sd_lb_stats
      0.15 ± 56%      +3.9        4.07 ± 10%  perf-profile.children.cycles-pp.find_busiest_group
      0.22 ± 40%      +6.2        6.43 ±  6%  perf-profile.children.cycles-pp.load_balance
     17.73 ±  4%      +6.5       24.27 ±  2%  perf-profile.children.cycles-pp.__libc_read
     25.57 ±  8%      +6.8       32.38        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     19.65            +6.8       26.47        perf-profile.children.cycles-pp.start_thread
     25.19 ±  8%      +6.9       32.09        perf-profile.children.cycles-pp.do_syscall_64
      1.54 ± 16%      +7.5        9.03 ±  4%  perf-profile.children.cycles-pp.pick_next_task_fair
      0.28 ± 29%      +7.7        7.97 ±  5%  perf-profile.children.cycles-pp.newidle_balance
     10.89 ±  4%      +8.3       19.20        perf-profile.children.cycles-pp.ksys_read
     10.03 ±  4%      +8.7       18.69        perf-profile.children.cycles-pp.vfs_read
      9.02 ±  5%      +8.9       17.93        perf-profile.children.cycles-pp.pipe_read
      4.76 ±  4%     +10.3       15.10        perf-profile.children.cycles-pp.schedule
      7.39 ±  5%     +11.9       19.34 ±  2%  perf-profile.children.cycles-pp.__schedule
     33.74 ±  5%      -9.6       24.14        perf-profile.self.cycles-pp.intel_idle
      5.36 ± 12%      -1.6        3.76 ±  4%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      1.90 ± 14%      -0.7        1.19 ± 10%  perf-profile.self.cycles-pp.__entry_text_start
      1.96 ± 15%      -0.6        1.40 ±  9%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      1.12 ±  9%      -0.3        0.77 ±  9%  perf-profile.self.cycles-pp.__fget_light
      0.55 ± 19%      -0.3        0.26 ± 13%  perf-profile.self.cycles-pp.mutex_unlock
      0.54 ± 24%      -0.2        0.31 ± 15%  perf-profile.self.cycles-pp.__mark_inode_dirty
      0.60 ± 11%      -0.2        0.38 ± 20%  perf-profile.self.cycles-pp.mutex_lock
      0.36 ± 26%      -0.2        0.19 ± 50%  perf-profile.self.cycles-pp.do_idle
      0.32 ±  9%      -0.1        0.17 ± 22%  perf-profile.self.cycles-pp.__mnt_want_write
      0.36 ±  9%      -0.1        0.23 ± 26%  perf-profile.self.cycles-pp.__pthread_enable_asynccancel
      0.30 ± 11%      -0.1        0.20 ± 25%  perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.30 ± 18%      -0.1        0.20 ± 31%  perf-profile.self.cycles-pp.restore_fpregs_from_fpstate
      0.28 ±  5%      -0.1        0.19 ± 11%  perf-profile.self.cycles-pp.__flush_smp_call_function_queue
      0.03 ± 82%      +0.1        0.09 ±  9%  perf-profile.self.cycles-pp.update_curr_se
      0.06 ± 58%      +0.1        0.12 ± 23%  perf-profile.self.cycles-pp.select_idle_sibling
      0.00            +0.1        0.07 ± 11%  perf-profile.self.cycles-pp.tick_nohz_stop_idle
      0.01 ±200%      +0.1        0.09 ± 23%  perf-profile.self.cycles-pp.error_entry
      0.00            +0.1        0.07 ± 20%  perf-profile.self.cycles-pp.__update_load_avg_blocked_se
      0.00            +0.1        0.07 ± 36%  perf-profile.self.cycles-pp.hrtimer_active
      0.04 ± 85%      +0.1        0.11 ± 29%  perf-profile.self.cycles-pp.irqtime_account_irq
      0.01 ±200%      +0.1        0.09 ± 35%  perf-profile.self.cycles-pp.sysvec_apic_timer_interrupt
      0.00            +0.1        0.08 ± 27%  perf-profile.self.cycles-pp.ct_nmi_enter
      0.00            +0.1        0.08 ± 28%  perf-profile.self.cycles-pp.resched_curr
      0.00            +0.1        0.09 ± 34%  perf-profile.self.cycles-pp.can_migrate_task
      0.00            +0.1        0.09 ± 21%  perf-profile.self.cycles-pp.cpudl_heapify_up
      0.00            +0.1        0.09 ± 22%  perf-profile.self.cycles-pp.update_dl_rq_load_avg
      0.16 ± 18%      +0.1        0.26 ± 26%  perf-profile.self.cycles-pp.newidle_balance
      0.00            +0.1        0.10 ± 21%  perf-profile.self.cycles-pp.tick_program_event
      0.03 ±124%      +0.1        0.13 ± 36%  perf-profile.self.cycles-pp.__enqueue_entity
      0.00            +0.1        0.10 ± 28%  perf-profile.self.cycles-pp.select_idle_cpu
      0.06 ± 94%      +0.1        0.16 ± 19%  perf-profile.self.cycles-pp.__hrtimer_run_queues
      0.00            +0.1        0.11 ± 31%  perf-profile.self.cycles-pp.hrtick
      0.00            +0.1        0.11 ± 39%  perf-profile.self.cycles-pp.pick_next_task_stop
      0.00            +0.1        0.11 ± 39%  perf-profile.self.cycles-pp.rb_insert_color
      0.00            +0.1        0.11 ± 32%  perf-profile.self.cycles-pp.update_blocked_averages
      0.02 ±200%      +0.1        0.13 ± 50%  perf-profile.self.cycles-pp.clockevents_program_event
      0.05 ± 91%      +0.1        0.17 ± 24%  perf-profile.self.cycles-pp.__wake_up_common_lock
      0.00            +0.1        0.12 ± 29%  perf-profile.self.cycles-pp.pick_next_task_dl
      0.00            +0.1        0.12 ± 10%  perf-profile.self.cycles-pp.detach_tasks
      0.01 ±200%      +0.1        0.14 ± 21%  perf-profile.self.cycles-pp._find_next_bit
      0.00            +0.1        0.13 ± 42%  perf-profile.self.cycles-pp.update_rt_rq_load_avg
      0.04 ± 83%      +0.1        0.17 ± 16%  perf-profile.self.cycles-pp.__hrtimer_next_event_base
      0.02 ±200%      +0.1        0.15 ± 13%  perf-profile.self.cycles-pp.hrtimer_interrupt
      0.00            +0.1        0.14 ± 26%  perf-profile.self.cycles-pp.task_h_load
      0.00            +0.1        0.14 ± 23%  perf-profile.self.cycles-pp.cpudl_heapify
      0.00            +0.2        0.15 ± 18%  perf-profile.self.cycles-pp.enqueue_dl_entity
      0.01 ±200%      +0.2        0.16 ±  9%  perf-profile.self.cycles-pp.update_rq_clock
      0.00            +0.2        0.16 ± 18%  perf-profile.self.cycles-pp.find_busiest_queue
      0.15 ± 33%      +0.2        0.31 ±  9%  perf-profile.self.cycles-pp.ktime_get
      0.28 ± 27%      +0.2        0.45 ± 17%  perf-profile.self.cycles-pp.__x86_indirect_thunk_rax
      0.00            +0.2        0.17 ± 21%  perf-profile.self.cycles-pp.update_sd_pick_busiest
      0.00            +0.2        0.19 ± 23%  perf-profile.self.cycles-pp.cpudl_set
      0.00            +0.2        0.19 ± 31%  perf-profile.self.cycles-pp.rb_erase
      0.03 ±122%      +0.2        0.23 ± 32%  perf-profile.self.cycles-pp.timerqueue_add
      0.06 ± 70%      +0.2        0.27 ± 33%  perf-profile.self.cycles-pp.update_irq_load_avg
      0.00            +0.2        0.22 ± 26%  perf-profile.self.cycles-pp.__hrtimer_start_range_ns
      0.07 ± 15%      +0.2        0.30 ± 22%  perf-profile.self.cycles-pp.__update_blocked_fair
      0.15 ± 44%      +0.2        0.39 ± 16%  perf-profile.self.cycles-pp.native_irq_return_iret
      0.19 ± 29%      +0.3        0.44 ± 29%  perf-profile.self.cycles-pp.update_rq_clock_task
      0.00            +0.3        0.25 ± 24%  perf-profile.self.cycles-pp.delay_tsc
      0.00            +0.3        0.27 ± 30%  perf-profile.self.cycles-pp.find_busiest_group
      0.04 ±141%      +0.3        0.34 ± 27%  perf-profile.self.cycles-pp.cpu_util
      0.00            +0.3        0.32 ± 17%  perf-profile.self.cycles-pp.io_serial_in
      0.00            +0.3        0.34 ± 22%  perf-profile.self.cycles-pp.idle_cpu
      0.44 ± 17%      +0.3        0.79 ± 11%  perf-profile.self.cycles-pp.read_tsc
      0.00            +0.4        0.37 ±  8%  perf-profile.self.cycles-pp._find_next_and_bit
      0.42 ± 29%      +0.4        0.80 ± 19%  perf-profile.self.cycles-pp.update_load_avg
      0.00            +0.4        0.41 ± 18%  perf-profile.self.cycles-pp.cpudl_clear
      0.00            +0.4        0.44 ± 23%  perf-profile.self.cycles-pp.load_balance
      0.85 ± 17%      +0.5        1.35 ± 15%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.02 ±125%      +0.6        0.58 ± 14%  perf-profile.self.cycles-pp.update_sd_lb_stats
      0.00            +0.7        0.66 ±  7%  perf-profile.self.cycles-pp.cpupri_set
      0.01 ±200%      +1.1        1.09 ± 12%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      0.05 ±127%      +2.0        2.09 ± 13%  perf-profile.self.cycles-pp.update_sg_lb_stats





Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

