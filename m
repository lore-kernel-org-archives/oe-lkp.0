Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB7F1F933
	for <oe-lkp@lists.linux.dev>; Tue, 19 Dec 2023 15:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gpojYvRw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703000516; x=1734536516;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=5XnRVAu9XMI/8HMhywIC+bN1Xg3D0UVvNplZhBu5xQM=;
  b=gpojYvRwuryYeo5KgjhK/e8MHiJG4Khn6JAzb6wfn9zHeZoGacsQVVOX
   wpQr5XJkG38zYUyN2X9siN/AGPcjWiHkDU3L0GUIR1gCtHbvc4L/iE3TG
   oG0BxKjK/c+Xgs+2w4bRGIycMWMCx1xlI/JImi5aMpzfi+Y9ZBWB5W6GN
   KbSIbvWqNyDCIWRLaa2N1oO0c7anhwHftcDRfdcUPKip00TIzk1bjVTK5
   8yL90ww8epWbX+bX6h2jOGenAwszWWOlfWY1rUb0qIuJ6NWymld0Uid1m
   SrHJudBHk5+fcAea/54VPKgOlkQEFuI1u46AXZL2r1/tlDKd0RvXXubaS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="2529050"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="2529050"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 07:41:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="919651692"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="919651692"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 Dec 2023 07:41:54 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Dec 2023 07:41:53 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 19 Dec 2023 07:41:53 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 19 Dec 2023 07:41:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d1lSeI3a574k1PwrNhD8XjjgOtbq3dZfLE/XW19EaT+zb5Ql0wk7Zz7f2KoJNi2GXxHF/b+5d7Hskz/27Qlvpp4+Cym83dezBAPgfsKxJs0Po4wILIlkbZ7iKK1W6ohV47iL8ihyWTuyOzfXUVU4kKU0ZZCSKSwVSuu12tiAYSlp5LBV+obCw9Qqy0EaADMDKP8F2/ZpC+2x9/NAnm9cQN1mw1xO2Is9G5btLzYv8cdmKJtlduumkLf7+EOWGU9ceUQhr43HDHKesVZVMGWnMS0ior/zJHGlcAgu24atgPj3MZTn+K2EKAM0NnUR3YageuOBy8HkubTellYzmTsbig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PwGEHQUKdEJGsBPLt1oWZ4ZsawFqo/g/wc9yJ927nLM=;
 b=a1Au+1S9xo2CfVsAx26wVAHVESONkTl4DeXb/u0KzP3vmroA6rdisTQbICduPdcu36oLaHEz4XCCC3BimzUii9fwiuAL4SLUSTyYWi7SwX0Oe9qnprJkdFSy1CHQW+b1bfkAx6SaLMD7kwXVwXXe49qSpqT9aKzxsKbmupTXV/fERWnK+rGXlXny8iHThJnb0clD8VIDS+P7fWYhMOoQKD4sQVr8GhsmAGoZaW5RLcAQp88A4okesI+MkjRJFAncf8lA/6KPMos5Hqp2pYQKdihb1cHqPqGTj/giwL/mPLKWW5EBhdPm33P2jiHb/TGzAi/w1wr6vBQ6kisYb35nxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SJ1PR11MB6298.namprd11.prod.outlook.com (2603:10b6:a03:457::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Tue, 19 Dec
 2023 15:41:45 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::1236:9a2e:5acd:a7f]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::1236:9a2e:5acd:a7f%3]) with mapi id 15.20.7091.034; Tue, 19 Dec 2023
 15:41:45 +0000
Date: Tue, 19 Dec 2023 23:41:35 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Rik van Riel <riel@surriel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Linux Memory Management List
	<linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, Yang Shi
	<shy828301@gmail.com>, Matthew Wilcox <willy@infradead.org>, "Christopher
 Lameter" <cl@linux.com>, <ying.huang@intel.com>, <feng.tang@intel.com>,
	<fengwei.yin@intel.com>, <oliver.sang@intel.com>
Subject: [linux-next:master] [mm]  1111d46b5c:  stress-ng.pthread.ops_per_sec
 -84.3% regression
Message-ID: <202312192310.56367035-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::14) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SJ1PR11MB6298:EE_
X-MS-Office365-Filtering-Correlation-Id: e36ac650-668f-45d2-6d27-08dc00a90124
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lVqo3fNF9EaYmEQu20wCix9AwpmsyhN6NN2uBFXNvPzv98TOxEhK4hdgocBS8/hbvaov2K/5x0ILXUC24J7Sz4L76EXmAQCrCI7DXmqFNgjswRLBjAGiLEpg7rxZ192mny0HaxSwPImTS4SIwZD9BUb1DH7+krxhG4wmi2CUSFFIqZzTpQe1lt1oybZ/A1tn/u6FLXF1j6b5LN+DQlNE5CsrDKO5N0rV8oQFBrwWs/l6R5klbAqA7kcm/Hn49qTN0V/x7y+x1//kg+KvtSwjbIzvhJEnhqLLgo+ZfjrQBLLXlEZuStDW3D+Uv/NZTb+L5Lusx/PrnjeAg76wSdYLhFJq0P5RBOKIT84ghKoQ6BXwTc+NkTaThZXM9JB5dH6TZFRcvCds/71RpaH0GKJF1/de0QmLved1ENE/7aKoH9k1Ba/lK9wPxbqkw7sR9IVTVVW+w8LKbWkvUELxSdbNbgXLmhxhj69akqimYaD2H0DCg0rOBnD1QkSp+vYNu39t7US1OCN5+i3uONiUjkqjAFSUi0ie+MwHo3MMJADK3aoQPe6OZ4xWhu0R+s/j2jEtY6bVeVSWvdW336J3GqJOt/yr46lu1WANUhndyrMbRr/esLt23UtA2oe8LWKpMR689ghKQxkBuuL361z8JSR2Kg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(396003)(346002)(39860400002)(366004)(230473577357003)(230922051799003)(230373577357003)(186009)(1800799012)(64100799003)(451199024)(83380400001)(6916009)(2616005)(38100700002)(41300700001)(30864003)(478600001)(82960400001)(66946007)(66556008)(66476007)(316002)(54906003)(966005)(6486002)(4326008)(8936002)(8676002)(26005)(2906002)(1076003)(86362001)(107886003)(6666004)(6506007)(36756003)(5660300002)(6512007)(559001)(579004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?F6dgR2yl/FXGovhhZSAqA/Sx7y8TNWCsPh7gxHcBzXpbq1+idZ1B6fHkeH?=
 =?iso-8859-1?Q?CQHXiBUc6166A5xM3YeKo1o4rWFN15hJBA78MS21B5JRc+YjLNwX/r3XqV?=
 =?iso-8859-1?Q?b7ixracSsvirO4ppKhmpPhQRxiUlmAMkcbtquUHS6SNk2eTs+jjNkTIDDD?=
 =?iso-8859-1?Q?7hlg6QZTvjkXc+DUTRVtGd5NTXfczXXn5TTqValil3IUXVxWBMxKXHAtWk?=
 =?iso-8859-1?Q?h05Wp0jClNsHBC94XNBDLpsKCxSgF6Wb4YiZrrO4mhvilEJhy484x8AsmY?=
 =?iso-8859-1?Q?nx7y0NWaegDbiu06PAAUOsnIbz/0jK8YUtVpzhL/O52lKxI6gbuu6htxot?=
 =?iso-8859-1?Q?m/8/0uqvGr6fc29OPm+ngI2hVWDyzoqyTU7b0kKXwbFy/K2dqYY5G/WEgf?=
 =?iso-8859-1?Q?PqyuUIY4Z7QtR9hsJ1mc/l0kPDxBXk9fEDjuVs/8KA1On5l2z3r//5ju+D?=
 =?iso-8859-1?Q?f+Zi+9ZoUfWZRoSEZgYktDudcdVRWARlGpfSJ1Grbg/nTx/+2eDVuj6aL3?=
 =?iso-8859-1?Q?ABoh47QEiLSasgfozX889HtYQW2khSILkqeNsRAb0/+VZv0X5wb1rk1D8v?=
 =?iso-8859-1?Q?X7zSrFXUh5yQNaLoqNbZtY80wl6PgBTFYKIy0VAo3j6wE3N93ZRJ92oYum?=
 =?iso-8859-1?Q?fiUy0uevv/A9Vq8xg7NLooNRxVPIZbVOSrlcqQmEBGovGXhft1SCN/1sr4?=
 =?iso-8859-1?Q?bN+Ob9s2cOfA4aLwN41cy7lQKkCKtANHLoiNR6e6VYSF6Bc7h6p+BmUCE3?=
 =?iso-8859-1?Q?+MWRQLhyfU2SfxuzXdeibpon9awXcFWTRT8TJa/iwskhhVwmkotIQ6DhfG?=
 =?iso-8859-1?Q?jTWi2yoz/v9gRx14lZDhkVJ014OlIpKcN7AXD58mao6REqhGmMJq/mZ+Xh?=
 =?iso-8859-1?Q?+l/dwFoe9F/tu2+QIf+ugZ+gtvEyDqvo/MTNu13QUXtKruyhlJVZrxmuAH?=
 =?iso-8859-1?Q?Hrsy6HCPMyETh8jdJ24e8oh5j7ZLx6TBIWhmYkzLzBTf5Yqx5XLFMbL/sw?=
 =?iso-8859-1?Q?B1Y5COnoygmNefbOmkW2zIcYrwWBgfEt1mUc54I5UPBKpMiHFggYTjqnmU?=
 =?iso-8859-1?Q?EELWCLZ2CJ0k//jY86g8FTmhZQVtOWKTwB3XIHxBPYAF7lsazC7JrUwQit?=
 =?iso-8859-1?Q?XLF2m59ZY8qXaw26r8a3vSZRGbDvyXXX2SUt/SQWaOJvlpOP7YVhsEgS4T?=
 =?iso-8859-1?Q?Hm1vaW0DbtV27yKdQh8yN9a3HSAtrMfky5o/LrMhp329l1XzzsWNP4RIfh?=
 =?iso-8859-1?Q?aw1CB+op0gwdlUxsl66dtsmFggdPPLxQnFylQU5v2WF72j6hNhUVWh5aq7?=
 =?iso-8859-1?Q?DCfM4seEAA+Al+utITp0fcumZjj4GsrZZ7aiW0sdF6XiFr/NsVbr8qHIp4?=
 =?iso-8859-1?Q?UrW1xtJ6kMgVz21P+ZwPq7Afqw7pGlQgxueKDWDI+tyob65CPvi0VeGqd/?=
 =?iso-8859-1?Q?UYxrVDnl/+ThsC7i2ibMzIGSFQOaLERnjuJUe8skIvNNMAbmGOAqQMWWDe?=
 =?iso-8859-1?Q?ZhXX2fDMwP+G3CwEwMfLLmE4AxXM3FyCLvU/3owIPs2jl340yPW2WowXIY?=
 =?iso-8859-1?Q?v8GpNCJQD5K/d3W1OyMQW8guKLCrMxBECMPBK6VO4vQp88RMT4unTdpTuH?=
 =?iso-8859-1?Q?mUDqNerwCxquk1HDEKpQQr4eUNoaORIlIfBVnW1kDLzBOBt33yW+lSuw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e36ac650-668f-45d2-6d27-08dc00a90124
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2023 15:41:45.4771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pq18HqSAPldNPCDFzbh0BA2w+aeTSQm6KnqXzJW69DUXFeU6DIEDEjxR0DN1syDjPmuxhMz3V8y7j/N5u6DfZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6298
X-OriginatorOrg: intel.com



Hello,

for this commit, we reported
"[mm]  96db82a66d:  will-it-scale.per_process_ops -95.3% regression"
in Aug, 2022 when it's in linux-next/master
https://lore.kernel.org/all/YwIoiIYo4qsYBcgd@xsang-OptiPlex-9020/

later, we reported
"[mm] f35b5d7d67: will-it-scale.per_process_ops -95.5% regression"
in Oct, 2022 when it's in linus/master
https://lore.kernel.org/all/202210181535.7144dd15-yujie.liu@intel.com/

and the commit was reverted finally by
commit 0ba09b1733878afe838fe35c310715fda3d46428
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun Dec 4 12:51:59 2022 -0800

now we noticed it goes into linux-next/master again.

we are not sure if there is an agreement that the benefit of this commit
has already overweight performance drop in some mirco benchmark.

we also noticed from https://lore.kernel.org/all/20231214223423.1133074-1-yang@os.amperecomputing.com/
that
"This patch was applied to v6.1, but was reverted due to a regression
report.  However it turned out the regression was not due to this patch.
I ping'ed Andrew to reapply this patch, Andrew may forget it.  This
patch helps promote THP, so I rebased it onto the latest mm-unstable."

however, unfortunately, in our latest tests, we still observed below regression
upon this commit. just FYI.



kernel test robot noticed a -84.3% regression of stress-ng.pthread.ops_per_sec on:


commit: 1111d46b5cbad57486e7a3fab75888accac2f072 ("mm: align larger anonymous mappings on THP boundaries")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

testcase: stress-ng
test machine: 36 threads 1 sockets Intel(R) Core(TM) i9-10980XE CPU @ 3.00GHz (Cascade Lake) with 128G memory
parameters:

	nr_threads: 1
	disk: 1HDD
	testtime: 60s
	fs: ext4
	class: os
	test: pthread
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+-----------------------------------------------------------------------------------------------+
| testcase: change | stream: stream.triad_bandwidth_MBps -12.1% regression                                         |
| test machine     | 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 512G memory   |
| test parameters  | array_size=50000000                                                                           |
|                  | cpufreq_governor=performance                                                                  |
|                  | iterations=10x                                                                                |
|                  | loop=100                                                                                      |
|                  | nr_threads=25%                                                                                |
|                  | omp=true                                                                                      |
+------------------+-----------------------------------------------------------------------------------------------+
| testcase: change | phoronix-test-suite: phoronix-test-suite.ramspeed.Average.Integer.mb_s -3.5% regression       |
| test machine     | 12 threads 1 sockets Intel(R) Core(TM) i7-8700 CPU @ 3.20GHz (Coffee Lake) with 16G memory    |
| test parameters  | cpufreq_governor=performance                                                                  |
|                  | option_a=Average                                                                              |
|                  | option_b=Integer                                                                              |
|                  | test=ramspeed-1.4.3                                                                           |
+------------------+-----------------------------------------------------------------------------------------------+
| testcase: change | phoronix-test-suite: phoronix-test-suite.ramspeed.Average.FloatingPoint.mb_s -3.0% regression |
| test machine     | 12 threads 1 sockets Intel(R) Core(TM) i7-8700 CPU @ 3.20GHz (Coffee Lake) with 16G memory    |
| test parameters  | cpufreq_governor=performance                                                                  |
|                  | option_a=Average                                                                              |
|                  | option_b=Floating Point                                                                       |
|                  | test=ramspeed-1.4.3                                                                           |
+------------------+-----------------------------------------------------------------------------------------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202312192310.56367035-oliver.sang@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20231219/202312192310.56367035-oliver.sang@intel.com

=========================================================================================
class/compiler/cpufreq_governor/disk/fs/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  os/gcc-12/performance/1HDD/ext4/x86_64-rhel-8.3/1/debian-11.1-x86_64-20220510.cgz/lkp-csl-d02/pthread/stress-ng/60s

commit: 
  30749e6fbb ("mm/memory: replace kmap() with kmap_local_page()")
  1111d46b5c ("mm: align larger anonymous mappings on THP boundaries")

30749e6fbb3d391a 1111d46b5cbad57486e7a3fab75 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
  13405796           -65.5%    4620124        cpuidle..usage
      8.00            +8.2%       8.66 ±  2%  iostat.cpu.system
      1.61           -60.6%       0.63        iostat.cpu.user
    597.50 ± 14%     -64.3%     213.50 ± 14%  perf-c2c.DRAM.local
      1882 ± 14%     -74.7%     476.83 ±  7%  perf-c2c.HITM.local
   3768436           -12.9%    3283395        vmstat.memory.cache
    355105           -75.7%      86344 ±  3%  vmstat.system.cs
    385435           -20.7%     305714 ±  3%  vmstat.system.in
      1.13            -0.2        0.88        mpstat.cpu.all.irq%
      0.29            -0.2        0.10 ±  2%  mpstat.cpu.all.soft%
      6.76 ±  2%      +1.1        7.88 ±  2%  mpstat.cpu.all.sys%
      1.62            -1.0        0.62 ±  2%  mpstat.cpu.all.usr%
   2234397           -84.3%     350161 ±  5%  stress-ng.pthread.ops
     37237           -84.3%       5834 ±  5%  stress-ng.pthread.ops_per_sec
    294706 ±  2%     -68.0%      94191 ±  6%  stress-ng.time.involuntary_context_switches
     41442 ±  2%   +5023.4%    2123284        stress-ng.time.maximum_resident_set_size
   4466457           -83.9%     717053 ±  5%  stress-ng.time.minor_page_faults
    243.33           +13.5%     276.17 ±  3%  stress-ng.time.percent_of_cpu_this_job_got
    131.64           +27.7%     168.11 ±  3%  stress-ng.time.system_time
     19.73           -82.1%       3.53 ±  4%  stress-ng.time.user_time
   7715609           -80.2%    1530125 ±  4%  stress-ng.time.voluntary_context_switches
    494566           -59.5%     200338 ±  3%  meminfo.Active
    478287           -61.5%     184050 ±  3%  meminfo.Active(anon)
     58549 ± 17%   +1532.8%     956006 ± 14%  meminfo.AnonHugePages
    424631          +194.9%    1252445 ± 10%  meminfo.AnonPages
   3677263           -13.0%    3197755        meminfo.Cached
   5829485 ±  4%     -19.0%    4724784 ± 10%  meminfo.Committed_AS
    692486          +108.6%    1444669 ±  8%  meminfo.Inactive
    662179          +113.6%    1414338 ±  9%  meminfo.Inactive(anon)
    182416           -50.2%      90759        meminfo.Mapped
   4614466           +10.0%    5076604 ±  2%  meminfo.Memused
      6985           +47.6%      10307 ±  4%  meminfo.PageTables
    718445           -66.7%     238913 ±  3%  meminfo.Shmem
     35906           -20.7%      28471 ±  3%  meminfo.VmallocUsed
   4838522           +25.6%    6075302        meminfo.max_used_kB
    488.83           -20.9%     386.67 ±  2%  turbostat.Avg_MHz
     12.95            -2.7       10.26 ±  2%  turbostat.Busy%
   7156734           -87.2%     919149 ±  4%  turbostat.C1
     10.59            -8.9        1.65 ±  5%  turbostat.C1%
   3702647           -55.1%    1663518 ±  2%  turbostat.C1E
     32.99           -20.6       12.36 ±  3%  turbostat.C1E%
   1161078           +64.5%    1909611        turbostat.C6
     44.25           +31.8       76.10        turbostat.C6%
      0.18           -33.3%       0.12        turbostat.IPC
  74338573 ±  2%     -33.9%   49159610 ±  4%  turbostat.IRQ
   1381661           -91.0%     124075 ±  6%  turbostat.POLL
      0.26            -0.2        0.04 ± 12%  turbostat.POLL%
     96.15            -5.4%      90.95        turbostat.PkgWatt
     12.12           +19.3%      14.46        turbostat.RAMWatt
    119573           -61.5%      46012 ±  3%  proc-vmstat.nr_active_anon
    106168          +195.8%     314047 ± 10%  proc-vmstat.nr_anon_pages
     28.60 ± 17%   +1538.5%     468.68 ± 14%  proc-vmstat.nr_anon_transparent_hugepages
    923365           -13.0%     803489        proc-vmstat.nr_file_pages
    165571          +113.5%     353493 ±  9%  proc-vmstat.nr_inactive_anon
     45605           -50.2%      22690        proc-vmstat.nr_mapped
      1752           +47.1%       2578 ±  4%  proc-vmstat.nr_page_table_pages
    179613           -66.7%      59728 ±  3%  proc-vmstat.nr_shmem
     21490            -2.4%      20981        proc-vmstat.nr_slab_reclaimable
     28260            -7.3%      26208        proc-vmstat.nr_slab_unreclaimable
    119573           -61.5%      46012 ±  3%  proc-vmstat.nr_zone_active_anon
    165570          +113.5%     353492 ±  9%  proc-vmstat.nr_zone_inactive_anon
  17343640           -76.3%    4116748 ±  4%  proc-vmstat.numa_hit
  17364975           -76.3%    4118098 ±  4%  proc-vmstat.numa_local
    249252           -66.2%      84187 ±  2%  proc-vmstat.pgactivate
  27528916          +567.1%  1.836e+08 ±  5%  proc-vmstat.pgalloc_normal
   4912427           -79.2%    1019949 ±  3%  proc-vmstat.pgfault
  27227124          +574.1%  1.835e+08 ±  5%  proc-vmstat.pgfree
      8728         +3896.4%     348802 ±  5%  proc-vmstat.thp_deferred_split_page
      8730         +3895.3%     348814 ±  5%  proc-vmstat.thp_fault_alloc
      8728         +3896.4%     348802 ±  5%  proc-vmstat.thp_split_pmd
    316745           -21.5%     248756 ±  4%  sched_debug.cfs_rq:/.avg_vruntime.avg
    112735 ±  4%     -34.3%      74061 ±  6%  sched_debug.cfs_rq:/.avg_vruntime.min
      0.49 ±  6%     -17.2%       0.41 ±  8%  sched_debug.cfs_rq:/.h_nr_running.stddev
     12143 ±120%     -99.9%      15.70 ±116%  sched_debug.cfs_rq:/.left_vruntime.avg
    414017 ±126%     -99.9%     428.50 ±102%  sched_debug.cfs_rq:/.left_vruntime.max
     68492 ±125%     -99.9%      78.15 ±106%  sched_debug.cfs_rq:/.left_vruntime.stddev
     41917 ± 24%     -48.3%      21690 ± 57%  sched_debug.cfs_rq:/.load.avg
    176151 ± 30%     -56.9%      75963 ± 57%  sched_debug.cfs_rq:/.load.stddev
      6489 ± 17%     -29.0%       4608 ± 12%  sched_debug.cfs_rq:/.load_avg.max
      4.42 ± 45%     -81.1%       0.83 ± 74%  sched_debug.cfs_rq:/.load_avg.min
      1112 ± 17%     -31.0%     767.62 ± 11%  sched_debug.cfs_rq:/.load_avg.stddev
    316745           -21.5%     248756 ±  4%  sched_debug.cfs_rq:/.min_vruntime.avg
    112735 ±  4%     -34.3%      74061 ±  6%  sched_debug.cfs_rq:/.min_vruntime.min
      0.49 ±  6%     -17.2%       0.41 ±  8%  sched_debug.cfs_rq:/.nr_running.stddev
     12144 ±120%     -99.9%      15.70 ±116%  sched_debug.cfs_rq:/.right_vruntime.avg
    414017 ±126%     -99.9%     428.50 ±102%  sched_debug.cfs_rq:/.right_vruntime.max
     68492 ±125%     -99.9%      78.15 ±106%  sched_debug.cfs_rq:/.right_vruntime.stddev
     14.25 ± 44%     -76.6%       3.33 ± 58%  sched_debug.cfs_rq:/.runnable_avg.min
     11.58 ± 49%     -77.7%       2.58 ± 58%  sched_debug.cfs_rq:/.util_avg.min
    423972 ± 23%     +59.3%     675379 ±  3%  sched_debug.cpu.avg_idle.avg
      5720 ± 43%    +439.5%      30864        sched_debug.cpu.avg_idle.min
     99.79 ±  2%     -23.7%      76.11 ±  2%  sched_debug.cpu.clock_task.stddev
    162475 ± 49%     -95.8%       6813 ± 26%  sched_debug.cpu.curr->pid.avg
   1061268           -84.0%     170212 ±  4%  sched_debug.cpu.curr->pid.max
    365404 ± 20%     -91.3%      31839 ± 10%  sched_debug.cpu.curr->pid.stddev
      0.51 ±  3%     -20.1%       0.41 ±  9%  sched_debug.cpu.nr_running.stddev
    311923           -74.2%      80615 ±  2%  sched_debug.cpu.nr_switches.avg
    565973 ±  4%     -77.8%     125597 ± 10%  sched_debug.cpu.nr_switches.max
    192666 ±  4%     -70.6%      56695 ±  6%  sched_debug.cpu.nr_switches.min
     67485 ±  8%     -79.9%      13558 ± 10%  sched_debug.cpu.nr_switches.stddev
      2.62          +102.1%       5.30        perf-stat.i.MPKI
  2.09e+09           -47.6%  1.095e+09 ±  4%  perf-stat.i.branch-instructions
      1.56            -0.5        1.01        perf-stat.i.branch-miss-rate%
  31951200           -60.9%   12481432 ±  2%  perf-stat.i.branch-misses
     19.38           +23.7       43.08        perf-stat.i.cache-miss-rate%
  26413597            -5.7%   24899132 ±  4%  perf-stat.i.cache-misses
 1.363e+08           -58.3%   56906133 ±  4%  perf-stat.i.cache-references
    370628           -75.8%      89743 ±  3%  perf-stat.i.context-switches
      1.77           +65.1%       2.92 ±  2%  perf-stat.i.cpi
 1.748e+10           -21.8%  1.367e+10 ±  2%  perf-stat.i.cpu-cycles
     61611           -79.1%      12901 ±  6%  perf-stat.i.cpu-migrations
    716.97 ±  2%     -17.2%     593.35 ±  2%  perf-stat.i.cycles-between-cache-misses
      0.12 ±  4%      -0.1        0.05        perf-stat.i.dTLB-load-miss-rate%
   3066100 ±  3%     -81.3%     573066 ±  5%  perf-stat.i.dTLB-load-misses
 2.652e+09           -50.1%  1.324e+09 ±  4%  perf-stat.i.dTLB-loads
      0.08 ±  2%      -0.0        0.03        perf-stat.i.dTLB-store-miss-rate%
   1168195 ±  2%     -82.9%     199438 ±  5%  perf-stat.i.dTLB-store-misses
 1.478e+09           -56.8%  6.384e+08 ±  3%  perf-stat.i.dTLB-stores
   8080423           -73.2%    2169371 ±  3%  perf-stat.i.iTLB-load-misses
   5601321           -74.3%    1440571 ±  2%  perf-stat.i.iTLB-loads
 1.028e+10           -49.7%  5.173e+09 ±  4%  perf-stat.i.instructions
      1450           +73.1%       2511 ±  2%  perf-stat.i.instructions-per-iTLB-miss
      0.61           -35.9%       0.39        perf-stat.i.ipc
      0.48           -21.4%       0.38 ±  2%  perf-stat.i.metric.GHz
    616.28           -17.6%     507.69 ±  4%  perf-stat.i.metric.K/sec
    175.16           -50.8%      86.18 ±  4%  perf-stat.i.metric.M/sec
     76728           -80.8%      14724 ±  4%  perf-stat.i.minor-faults
   5600408           -61.4%    2160997 ±  5%  perf-stat.i.node-loads
   8873996           +52.1%   13499744 ±  5%  perf-stat.i.node-stores
    112409           -81.9%      20305 ±  4%  perf-stat.i.page-faults
      2.55           +89.6%       4.83        perf-stat.overall.MPKI
      1.51            -0.4        1.13        perf-stat.overall.branch-miss-rate%
     19.26           +24.5       43.71        perf-stat.overall.cache-miss-rate%
      1.70           +56.4%       2.65        perf-stat.overall.cpi
    665.84           -17.5%     549.51 ±  2%  perf-stat.overall.cycles-between-cache-misses
      0.12 ±  4%      -0.1        0.04        perf-stat.overall.dTLB-load-miss-rate%
      0.08 ±  2%      -0.0        0.03        perf-stat.overall.dTLB-store-miss-rate%
     59.16            +0.9       60.04        perf-stat.overall.iTLB-load-miss-rate%
      1278           +86.1%       2379 ±  2%  perf-stat.overall.instructions-per-iTLB-miss
      0.59           -36.1%       0.38        perf-stat.overall.ipc
 2.078e+09           -48.3%  1.074e+09 ±  4%  perf-stat.ps.branch-instructions
  31292687           -61.2%   12133349 ±  2%  perf-stat.ps.branch-misses
  26057291            -5.9%   24512034 ±  4%  perf-stat.ps.cache-misses
 1.353e+08           -58.6%   56072195 ±  4%  perf-stat.ps.cache-references
    365254           -75.8%      88464 ±  3%  perf-stat.ps.context-switches
 1.735e+10           -22.4%  1.346e+10 ±  2%  perf-stat.ps.cpu-cycles
     60838           -79.1%      12727 ±  6%  perf-stat.ps.cpu-migrations
   3056601 ±  4%     -81.5%     565354 ±  4%  perf-stat.ps.dTLB-load-misses
 2.636e+09           -50.7%    1.3e+09 ±  4%  perf-stat.ps.dTLB-loads
   1155253 ±  2%     -83.0%     196581 ±  5%  perf-stat.ps.dTLB-store-misses
 1.473e+09           -57.4%  6.268e+08 ±  3%  perf-stat.ps.dTLB-stores
   7997726           -73.3%    2131477 ±  3%  perf-stat.ps.iTLB-load-misses
   5521346           -74.3%    1418623 ±  2%  perf-stat.ps.iTLB-loads
 1.023e+10           -50.4%  5.073e+09 ±  4%  perf-stat.ps.instructions
     75671           -80.9%      14479 ±  4%  perf-stat.ps.minor-faults
   5549722           -61.4%    2141750 ±  4%  perf-stat.ps.node-loads
   8769156           +51.6%   13296579 ±  5%  perf-stat.ps.node-stores
    110795           -82.0%      19977 ±  4%  perf-stat.ps.page-faults
 6.482e+11           -50.7%  3.197e+11 ±  4%  perf-stat.total.instructions
      0.00 ± 37%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.allocate_slab
      0.01 ± 18%   +8373.1%       0.73 ± 49%  perf-sched.sch_delay.avg.ms.__cond_resched.down_read.do_madvise.__x64_sys_madvise.do_syscall_64
      0.01 ± 16%   +4600.0%       0.38 ± 24%  perf-sched.sch_delay.avg.ms.__cond_resched.down_read.exit_mm.do_exit.__x64_sys_exit
      0.01 ±204%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.down_write.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap
      0.01 ±  8%   +3678.9%       0.36 ± 79%  perf-sched.sch_delay.avg.ms.__cond_resched.exit_signals.do_exit.__x64_sys_exit.do_syscall_64
      0.01 ± 14%     -38.5%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc.security_file_alloc.init_file.alloc_empty_file
      0.01 ±  5%   +2946.2%       0.26 ± 43%  perf-sched.sch_delay.avg.ms.__cond_resched.mutex_lock.futex_exit_release.exit_mm_release.exit_mm
      0.00 ± 14%    +125.0%       0.01 ± 12%  perf-sched.sch_delay.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.02 ±170%     -83.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.switch_task_namespaces.__do_sys_setns.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00 ± 69%   +6578.6%       0.31 ±  4%  perf-sched.sch_delay.avg.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.zap_page_range_single.madvise_vma_behavior
      0.00          +100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.unmap_vmas.unmap_region.do_vmi_align_munmap.do_vmi_munmap
      0.02 ± 86%   +4234.4%       0.65 ±  4%  perf-sched.sch_delay.avg.ms.__cond_resched.zap_page_range_single.madvise_vma_behavior.do_madvise.__x64_sys_madvise
      0.01 ±  6%   +6054.3%       0.47        perf-sched.sch_delay.avg.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
      0.00 ± 14%    +195.2%       0.01 ± 89%  perf-sched.sch_delay.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.00 ±102%    +340.0%       0.01 ± 85%  perf-sched.sch_delay.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      0.00          +100.0%       0.00        perf-sched.sch_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.00 ± 11%     +66.7%       0.01 ± 21%  perf-sched.sch_delay.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      0.01 ± 89%   +1096.1%       0.15 ± 30%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      0.00          +141.7%       0.01 ± 61%  perf-sched.sch_delay.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      0.00 ±223%   +9975.0%       0.07 ±203%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
      0.00 ± 10%    +789.3%       0.04 ± 69%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.00 ± 31%   +6691.3%       0.26 ±  5%  perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.do_madvise
      0.00 ± 28%  +14612.5%       0.59 ±  4%  perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.exit_mm
      0.00 ± 24%   +4904.2%       0.20 ±  4%  perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read_killable.lock_mm_and_find_vma
      0.00 ± 28%    +450.0%       0.01 ± 74%  perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write_killable.__vm_munmap
      0.00 ± 17%    +984.6%       0.02 ± 79%  perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.00 ± 20%    +231.8%       0.01 ± 89%  perf-sched.sch_delay.avg.ms.schedule_timeout.io_schedule_timeout.__wait_for_common.submit_bio_wait
      0.00          +350.0%       0.01 ± 16%  perf-sched.sch_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      0.02 ± 16%    +320.2%       0.07 ±  2%  perf-sched.sch_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.02 ±  2%    +282.1%       0.09 ±  5%  perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.00 ± 14%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.allocate_slab
      0.05 ± 35%   +3784.5%       1.92 ± 16%  perf-sched.sch_delay.max.ms.__cond_resched.down_read.do_madvise.__x64_sys_madvise.do_syscall_64
      0.29 ±128%    +563.3%       1.92 ±  7%  perf-sched.sch_delay.max.ms.__cond_resched.down_read.exit_mm.do_exit.__x64_sys_exit
      0.14 ±217%     -99.7%       0.00 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.down_write.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap
      0.03 ± 49%     -74.0%       0.01 ± 51%  perf-sched.sch_delay.max.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
      0.01 ± 54%     -57.4%       0.00 ± 75%  perf-sched.sch_delay.max.ms.__cond_resched.dput.__ns_get_path.ns_get_path.proc_ns_get_link
      0.12 ± 21%    +873.0%       1.19 ± 60%  perf-sched.sch_delay.max.ms.__cond_resched.exit_signals.do_exit.__x64_sys_exit.do_syscall_64
      2.27 ±220%     -99.7%       0.01 ± 19%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc.create_new_namespaces.__do_sys_setns.do_syscall_64
      0.02 ± 36%     -54.4%       0.01 ± 55%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc.getname_flags.part.0
      0.04 ± 36%     -77.1%       0.01 ± 31%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc.security_file_alloc.init_file.alloc_empty_file
      0.12 ± 32%   +1235.8%       1.58 ± 31%  perf-sched.sch_delay.max.ms.__cond_resched.mutex_lock.futex_exit_release.exit_mm_release.exit_mm
      2.25 ±218%     -99.3%       0.02 ± 52%  perf-sched.sch_delay.max.ms.__cond_resched.switch_task_namespaces.__do_sys_setns.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.01 ± 85%  +19836.4%       2.56 ±  7%  perf-sched.sch_delay.max.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.zap_page_range_single.madvise_vma_behavior
      0.03 ± 70%     -93.6%       0.00 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.unmap_page_range.zap_page_range_single.madvise_vma_behavior.do_madvise
      0.10 ± 16%   +2984.2%       3.21 ±  6%  perf-sched.sch_delay.max.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
      0.01 ± 20%    +883.9%       0.05 ±177%  perf-sched.sch_delay.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.01 ± 15%    +694.7%       0.08 ±123%  perf-sched.sch_delay.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      0.00 ±223%   +6966.7%       0.07 ±199%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
      0.01 ± 38%   +8384.6%       0.55 ± 72%  perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.01 ± 13%  +12995.7%       1.51 ±103%  perf-sched.sch_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    117.80 ± 56%     -96.4%       4.26 ± 36%  perf-sched.sch_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.01 ± 68%    +331.9%       0.03        perf-sched.total_sch_delay.average.ms
      4.14          +242.6%      14.20 ±  4%  perf-sched.total_wait_and_delay.average.ms
    700841           -69.6%     212977 ±  3%  perf-sched.total_wait_and_delay.count.ms
      4.14          +242.4%      14.16 ±  4%  perf-sched.total_wait_time.average.ms
     11.68 ±  8%    +213.3%      36.59 ± 28%  perf-sched.wait_and_delay.avg.ms.__cond_resched.apparmor_file_alloc_security.security_file_alloc.init_file.alloc_empty_file
     10.00 ±  2%    +226.1%      32.62 ± 20%  perf-sched.wait_and_delay.avg.ms.__cond_resched.dentry_kill.dput.__fput.__x64_sys_close
     10.55 ±  3%    +259.8%      37.96 ±  7%  perf-sched.wait_and_delay.avg.ms.__cond_resched.dput.nd_jump_link.proc_ns_get_link.pick_link
      9.80 ± 12%    +196.5%      29.07 ± 32%  perf-sched.wait_and_delay.avg.ms.__cond_resched.dput.pick_link.step_into.open_last_lookups
      9.80 ±  4%    +234.9%      32.83 ± 14%  perf-sched.wait_and_delay.avg.ms.__cond_resched.dput.terminate_walk.path_openat.do_filp_open
     10.32 ±  2%    +223.8%      33.42 ±  6%  perf-sched.wait_and_delay.avg.ms.__cond_resched.kmem_cache_alloc.alloc_empty_file.path_openat.do_filp_open
      8.15 ± 14%    +271.3%      30.25 ± 35%  perf-sched.wait_and_delay.avg.ms.__cond_resched.kmem_cache_alloc.create_new_namespaces.__do_sys_setns.do_syscall_64
      9.60 ±  4%    +240.8%      32.73 ± 16%  perf-sched.wait_and_delay.avg.ms.__cond_resched.kmem_cache_alloc.getname_flags.part.0
     10.37 ±  4%    +232.0%      34.41 ± 10%  perf-sched.wait_and_delay.avg.ms.__cond_resched.kmem_cache_alloc.security_file_alloc.init_file.alloc_empty_file
      7.32 ± 46%    +269.7%      27.07 ± 49%  perf-sched.wait_and_delay.avg.ms.__cond_resched.shmem_inode_acct_blocks.shmem_alloc_and_add_folio.shmem_get_folio_gfp.shmem_write_begin
      9.88          +236.2%      33.23 ±  4%  perf-sched.wait_and_delay.avg.ms.__cond_resched.slab_pre_alloc_hook.constprop.0.kmem_cache_alloc_lru
      4.44 ±  4%    +379.0%      21.27 ± 18%  perf-sched.wait_and_delay.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     10.05 ±  2%    +235.6%      33.73 ± 11%  perf-sched.wait_and_delay.avg.ms.__cond_resched.switch_task_namespaces.__do_sys_setns.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.03          +462.6%       0.15 ±  6%  perf-sched.wait_and_delay.avg.ms.do_task_dead.do_exit.__x64_sys_exit.do_syscall_64.entry_SYSCALL_64_after_hwframe
      6.78 ±  4%    +482.1%      39.46 ±  3%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      3.17          +683.3%      24.85 ±  8%  perf-sched.wait_and_delay.avg.ms.futex_wait_queue.__futex_wait.futex_wait.do_futex
     36.64 ± 13%    +244.7%     126.32 ±  6%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      9.81          +302.4%      39.47 ±  4%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.do_sigtimedwait.__x64_sys_rt_sigtimedwait.do_syscall_64
      1.05           +48.2%       1.56        perf-sched.wait_and_delay.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.do_madvise
      0.93           +14.2%       1.06 ±  2%  perf-sched.wait_and_delay.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read_killable.lock_mm_and_find_vma
      9.93          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.schedule_timeout.ext4_lazyinit_thread.part.0.kthread
     12.02 ±  3%    +139.8%      28.83 ±  6%  perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      6.09 ±  2%    +403.0%      30.64 ±  5%  perf-sched.wait_and_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     23.17 ± 19%     -83.5%       3.83 ±143%  perf-sched.wait_and_delay.count.__cond_resched.__alloc_pages.alloc_pages_mpol.shmem_alloc_folio.shmem_alloc_and_add_folio
     79.83 ±  9%     -55.1%      35.83 ± 16%  perf-sched.wait_and_delay.count.__cond_resched.dentry_kill.dput.__fput.__x64_sys_close
     14.83 ± 14%     -59.6%       6.00 ± 56%  perf-sched.wait_and_delay.count.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
      8.50 ± 17%     -80.4%       1.67 ± 89%  perf-sched.wait_and_delay.count.__cond_resched.dput.__ns_get_path.ns_get_path.proc_ns_get_link
    114.00 ± 14%     -62.4%      42.83 ± 11%  perf-sched.wait_and_delay.count.__cond_resched.dput.nd_jump_link.proc_ns_get_link.pick_link
     94.67 ±  7%     -48.1%      49.17 ± 13%  perf-sched.wait_and_delay.count.__cond_resched.dput.terminate_walk.path_openat.do_filp_open
     59.83 ± 13%     -76.0%      14.33 ± 48%  perf-sched.wait_and_delay.count.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
    103.00 ± 12%     -48.1%      53.50 ± 20%  perf-sched.wait_and_delay.count.__cond_resched.kmem_cache_alloc.alloc_empty_file.path_openat.do_filp_open
     19.33 ± 16%     -56.0%       8.50 ± 29%  perf-sched.wait_and_delay.count.__cond_resched.kmem_cache_alloc.create_new_namespaces.__do_sys_setns.do_syscall_64
     68.17 ± 11%     -39.1%      41.50 ± 19%  perf-sched.wait_and_delay.count.__cond_resched.kmem_cache_alloc.security_file_alloc.init_file.alloc_empty_file
     36.67 ± 22%     -79.1%       7.67 ± 46%  perf-sched.wait_and_delay.count.__cond_resched.mutex_lock.perf_poll.do_poll.constprop
    465.50 ±  9%     -47.4%     244.83 ± 11%  perf-sched.wait_and_delay.count.__cond_resched.slab_pre_alloc_hook.constprop.0.kmem_cache_alloc_lru
     14492 ±  3%     -96.3%     533.67 ± 10%  perf-sched.wait_and_delay.count.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    128.67 ±  7%     -53.5%      59.83 ± 10%  perf-sched.wait_and_delay.count.__cond_resched.switch_task_namespaces.__do_sys_setns.do_syscall_64.entry_SYSCALL_64_after_hwframe
      7.67 ± 34%     -80.4%       1.50 ±107%  perf-sched.wait_and_delay.count.__cond_resched.vunmap_p4d_range.__vunmap_range_noflush.remove_vm_area.vfree
    147533           -81.0%      28023 ±  5%  perf-sched.wait_and_delay.count.do_task_dead.do_exit.__x64_sys_exit.do_syscall_64.entry_SYSCALL_64_after_hwframe
      4394 ±  4%     -78.5%     942.83 ±  7%  perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
    228791           -79.3%      47383 ±  4%  perf-sched.wait_and_delay.count.futex_wait_queue.__futex_wait.futex_wait.do_futex
    368.50 ±  2%     -67.1%     121.33 ±  3%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
    147506           -81.0%      28010 ±  5%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.do_sigtimedwait.__x64_sys_rt_sigtimedwait.do_syscall_64
      5387 ±  6%     -16.7%       4488 ±  5%  perf-sched.wait_and_delay.count.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.do_madvise
      8303 ±  2%     -56.9%       3579 ±  5%  perf-sched.wait_and_delay.count.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read_killable.lock_mm_and_find_vma
     14.67 ±  7%    -100.0%       0.00        perf-sched.wait_and_delay.count.schedule_timeout.ext4_lazyinit_thread.part.0.kthread
    370.50 ±141%    +221.9%       1192 ±  5%  perf-sched.wait_and_delay.count.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     24395 ±  2%     -51.2%      11914 ±  6%  perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     31053 ±  2%     -80.5%       6047 ±  5%  perf-sched.wait_and_delay.count.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     16.41 ±  2%    +342.7%      72.65 ± 29%  perf-sched.wait_and_delay.max.ms.__cond_resched.apparmor_file_alloc_security.security_file_alloc.init_file.alloc_empty_file
     16.49 ±  3%    +463.3%      92.90 ± 27%  perf-sched.wait_and_delay.max.ms.__cond_resched.dentry_kill.dput.__fput.__x64_sys_close
     17.32 ±  5%    +520.9%     107.52 ± 14%  perf-sched.wait_and_delay.max.ms.__cond_resched.dput.nd_jump_link.proc_ns_get_link.pick_link
     15.38 ±  6%    +325.2%      65.41 ± 22%  perf-sched.wait_and_delay.max.ms.__cond_resched.dput.pick_link.step_into.open_last_lookups
     16.73 ±  4%    +456.2%      93.04 ± 11%  perf-sched.wait_and_delay.max.ms.__cond_resched.dput.terminate_walk.path_openat.do_filp_open
     17.14 ±  3%    +510.6%     104.68 ± 14%  perf-sched.wait_and_delay.max.ms.__cond_resched.kmem_cache_alloc.alloc_empty_file.path_openat.do_filp_open
     15.70 ±  4%    +379.4%      75.25 ± 28%  perf-sched.wait_and_delay.max.ms.__cond_resched.kmem_cache_alloc.create_new_namespaces.__do_sys_setns.do_syscall_64
     15.70 ±  3%    +422.1%      81.97 ± 19%  perf-sched.wait_and_delay.max.ms.__cond_resched.kmem_cache_alloc.getname_flags.part.0
     16.38          +528.4%     102.91 ± 21%  perf-sched.wait_and_delay.max.ms.__cond_resched.kmem_cache_alloc.security_file_alloc.init_file.alloc_empty_file
     45.20 ± 48%    +166.0%     120.23 ± 27%  perf-sched.wait_and_delay.max.ms.__cond_resched.shmem_inode_acct_blocks.shmem_alloc_and_add_folio.shmem_get_folio_gfp.shmem_write_begin
     17.25          +495.5%     102.71 ±  2%  perf-sched.wait_and_delay.max.ms.__cond_resched.slab_pre_alloc_hook.constprop.0.kmem_cache_alloc_lru
    402.57 ± 15%     -52.8%     189.90 ± 14%  perf-sched.wait_and_delay.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     16.96 ±  4%    +521.3%     105.40 ± 15%  perf-sched.wait_and_delay.max.ms.__cond_resched.switch_task_namespaces.__do_sys_setns.do_syscall_64.entry_SYSCALL_64_after_hwframe
     28.45          +517.3%     175.65 ± 14%  perf-sched.wait_and_delay.max.ms.do_task_dead.do_exit.__x64_sys_exit.do_syscall_64.entry_SYSCALL_64_after_hwframe
     22.49          +628.5%     163.83 ± 16%  perf-sched.wait_and_delay.max.ms.futex_wait_queue.__futex_wait.futex_wait.do_futex
     26.53 ± 30%    +326.9%     113.25 ± 16%  perf-sched.wait_and_delay.max.ms.schedule_hrtimeout_range_clock.do_sigtimedwait.__x64_sys_rt_sigtimedwait.do_syscall_64
     15.54          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.schedule_timeout.ext4_lazyinit_thread.part.0.kthread
      1.67 ±141%    +284.6%       6.44 ±  4%  perf-sched.wait_and_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      0.07 ± 34%     -93.6%       0.00 ±105%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.alloc_pages_mpol.pte_alloc_one.__pte_alloc
     10.21 ± 15%    +295.8%      40.43 ± 50%  perf-sched.wait_time.avg.ms.__cond_resched.__fput.__x64_sys_close.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.89 ± 40%     -99.8%       0.01 ±113%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.allocate_slab
     11.67 ±  8%    +213.5%      36.58 ± 28%  perf-sched.wait_time.avg.ms.__cond_resched.apparmor_file_alloc_security.security_file_alloc.init_file.alloc_empty_file
      9.98 ±  2%    +226.8%      32.61 ± 20%  perf-sched.wait_time.avg.ms.__cond_resched.dentry_kill.dput.__fput.__x64_sys_close
      1.03           +71.2%       1.77 ± 20%  perf-sched.wait_time.avg.ms.__cond_resched.down_read.do_madvise.__x64_sys_madvise.do_syscall_64
      0.06 ± 79%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_write.__split_vma.vma_modify.mprotect_fixup
      0.05 ± 22%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_write.vma_expand.mmap_region.do_mmap
      0.08 ± 82%     -98.2%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
     10.72 ± 10%    +166.9%      28.61 ± 29%  perf-sched.wait_time.avg.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
     10.53 ±  3%    +260.5%      37.95 ±  7%  perf-sched.wait_time.avg.ms.__cond_resched.dput.nd_jump_link.proc_ns_get_link.pick_link
      9.80 ± 12%    +196.6%      29.06 ± 32%  perf-sched.wait_time.avg.ms.__cond_resched.dput.pick_link.step_into.open_last_lookups
      9.80 ±  4%    +235.1%      32.82 ± 14%  perf-sched.wait_time.avg.ms.__cond_resched.dput.terminate_walk.path_openat.do_filp_open
      9.50 ± 12%    +281.9%      36.27 ± 70%  perf-sched.wait_time.avg.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
     10.31 ±  2%    +223.9%      33.40 ±  6%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.alloc_empty_file.path_openat.do_filp_open
      8.04 ± 15%    +276.1%      30.25 ± 35%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.create_new_namespaces.__do_sys_setns.do_syscall_64
      9.60 ±  4%    +240.9%      32.72 ± 16%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.getname_flags.part.0
      0.06 ± 66%     -98.3%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.mas_alloc_nodes.mas_preallocate.__split_vma
     10.36 ±  4%    +232.1%      34.41 ± 10%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.security_file_alloc.init_file.alloc_empty_file
      0.08 ± 50%     -95.7%       0.00 ±100%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.vm_area_dup.__split_vma.vma_modify
      0.01 ± 49%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_node.alloc_vmap_area.__get_vm_area_node.__vmalloc_node_range
      0.03 ± 73%     -87.4%       0.00 ±145%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_node.dup_task_struct.copy_process.kernel_clone
      8.01 ± 25%    +238.0%      27.07 ± 49%  perf-sched.wait_time.avg.ms.__cond_resched.shmem_inode_acct_blocks.shmem_alloc_and_add_folio.shmem_get_folio_gfp.shmem_write_begin
      9.86          +237.0%      33.23 ±  4%  perf-sched.wait_time.avg.ms.__cond_resched.slab_pre_alloc_hook.constprop.0.kmem_cache_alloc_lru
      4.44 ±  4%    +379.2%      21.26 ± 18%  perf-sched.wait_time.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     10.03          +236.3%      33.73 ± 11%  perf-sched.wait_time.avg.ms.__cond_resched.switch_task_namespaces.__do_sys_setns.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.97 ±  8%     -87.8%       0.12 ±221%  perf-sched.wait_time.avg.ms.__cond_resched.unmap_page_range.zap_page_range_single.madvise_vma_behavior.do_madvise
      0.02 ± 13%   +1846.8%       0.45 ± 11%  perf-sched.wait_time.avg.ms.__cond_resched.unmap_vmas.unmap_region.do_vmi_align_munmap.do_vmi_munmap
      1.01           +64.7%       1.66        perf-sched.wait_time.avg.ms.__cond_resched.zap_page_range_single.madvise_vma_behavior.do_madvise.__x64_sys_madvise
      0.75 ±  4%    +852.1%       7.10 ±  5%  perf-sched.wait_time.avg.ms.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.03          +462.6%       0.15 ±  6%  perf-sched.wait_time.avg.ms.do_task_dead.do_exit.__x64_sys_exit.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.24 ±  4%     +25.3%       0.30 ±  8%  perf-sched.wait_time.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      1.98 ± 15%    +595.7%      13.80 ± 90%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      2.78 ± 14%    +444.7%      15.12 ± 16%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function
      6.77 ±  4%    +483.0%      39.44 ±  3%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      3.17          +684.7%      24.85 ±  8%  perf-sched.wait_time.avg.ms.futex_wait_queue.__futex_wait.futex_wait.do_futex
     36.64 ± 13%    +244.7%     126.32 ±  6%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      9.79          +303.0%      39.45 ±  4%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.do_sigtimedwait.__x64_sys_rt_sigtimedwait.do_syscall_64
      1.05           +23.8%       1.30        perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.do_madvise
      0.86          +101.2%       1.73 ±  3%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.exit_mm
      0.11 ± 21%    +438.9%       0.61 ± 15%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write_killable.__vm_munmap
      0.32 ±  4%     +28.5%       0.41 ± 13%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
     12.00 ±  3%    +139.6%      28.76 ±  6%  perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      6.07 ±  2%    +403.5%      30.56 ±  5%  perf-sched.wait_time.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.38 ± 41%     -98.8%       0.00 ±105%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.alloc_pages_mpol.pte_alloc_one.__pte_alloc
      0.36 ± 34%     -84.3%       0.06 ±200%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.alloc_pages_mpol.vma_alloc_folio.do_anonymous_page
      0.36 ± 51%     -92.9%       0.03 ±114%  perf-sched.wait_time.max.ms.__cond_resched.__anon_vma_prepare.do_anonymous_page.__handle_mm_fault.handle_mm_fault
     15.98 ±  5%    +361.7%      73.80 ± 23%  perf-sched.wait_time.max.ms.__cond_resched.__fput.__x64_sys_close.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.51 ± 14%     -92.8%       0.04 ±196%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.__vmalloc_area_node.__vmalloc_node_range
      8.56 ± 11%     -99.9%       0.01 ±126%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.allocate_slab
      0.43 ± 32%     -68.2%       0.14 ±119%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_node_trace.__get_vm_area_node.__vmalloc_node_range
      0.46 ± 20%     -89.3%       0.05 ±184%  perf-sched.wait_time.max.ms.__cond_resched.__vmalloc_area_node.__vmalloc_node_range.alloc_thread_stack_node.dup_task_struct
     16.40 ±  2%    +342.9%      72.65 ± 29%  perf-sched.wait_time.max.ms.__cond_resched.apparmor_file_alloc_security.security_file_alloc.init_file.alloc_empty_file
      0.31 ± 63%     -76.2%       0.07 ±169%  perf-sched.wait_time.max.ms.__cond_resched.cgroup_css_set_fork.cgroup_can_fork.copy_process.kernel_clone
      0.14 ± 93%    +258.7%       0.49 ± 14%  perf-sched.wait_time.max.ms.__cond_resched.clear_huge_page.__do_huge_pmd_anonymous_page.__handle_mm_fault.handle_mm_fault
     16.49 ±  3%    +463.5%      92.89 ± 27%  perf-sched.wait_time.max.ms.__cond_resched.dentry_kill.dput.__fput.__x64_sys_close
      1.09          +171.0%       2.96 ± 10%  perf-sched.wait_time.max.ms.__cond_resched.down_read.do_madvise.__x64_sys_madvise.do_syscall_64
      1.16 ±  7%    +155.1%       2.97 ±  4%  perf-sched.wait_time.max.ms.__cond_resched.down_read.exit_mm.do_exit.__x64_sys_exit
      0.19 ± 78%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_write.__split_vma.vma_modify.mprotect_fixup
      0.33 ± 35%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_write.vma_expand.mmap_region.do_mmap
      0.20 ±101%     -99.3%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.vm_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
     17.31 ±  5%    +521.0%     107.51 ± 14%  perf-sched.wait_time.max.ms.__cond_resched.dput.nd_jump_link.proc_ns_get_link.pick_link
     15.38 ±  6%    +325.3%      65.40 ± 22%  perf-sched.wait_time.max.ms.__cond_resched.dput.pick_link.step_into.open_last_lookups
     16.72 ±  4%    +456.6%      93.04 ± 11%  perf-sched.wait_time.max.ms.__cond_resched.dput.terminate_walk.path_openat.do_filp_open
      1.16 ±  2%     +88.7%       2.20 ± 33%  perf-sched.wait_time.max.ms.__cond_resched.exit_signals.do_exit.__x64_sys_exit.do_syscall_64
     53.96 ± 32%    +444.0%     293.53 ±109%  perf-sched.wait_time.max.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
     17.13 ±  2%    +511.2%     104.68 ± 14%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.alloc_empty_file.path_openat.do_filp_open
     15.69 ±  4%    +379.5%      75.25 ± 28%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.create_new_namespaces.__do_sys_setns.do_syscall_64
     15.70 ±  3%    +422.2%      81.97 ± 19%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.getname_flags.part.0
      0.27 ± 80%     -99.6%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.mas_alloc_nodes.mas_preallocate.__split_vma
     16.37          +528.6%     102.90 ± 21%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.security_file_alloc.init_file.alloc_empty_file
      0.44 ± 33%     -99.1%       0.00 ±104%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.vm_area_dup.__split_vma.vma_modify
      0.02 ± 83%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_node.alloc_vmap_area.__get_vm_area_node.__vmalloc_node_range
      0.08 ± 83%     -95.4%       0.00 ±147%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_node.dup_task_struct.copy_process.kernel_clone
      1.16 ±  2%    +134.7%       2.72 ± 19%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.futex_exit_release.exit_mm_release.exit_mm
     49.88 ± 25%    +141.0%     120.23 ± 27%  perf-sched.wait_time.max.ms.__cond_resched.shmem_inode_acct_blocks.shmem_alloc_and_add_folio.shmem_get_folio_gfp.shmem_write_begin
     17.24          +495.7%     102.70 ±  2%  perf-sched.wait_time.max.ms.__cond_resched.slab_pre_alloc_hook.constprop.0.kmem_cache_alloc_lru
    402.56 ± 15%     -52.8%     189.89 ± 14%  perf-sched.wait_time.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     16.96 ±  4%    +521.4%     105.39 ± 15%  perf-sched.wait_time.max.ms.__cond_resched.switch_task_namespaces.__do_sys_setns.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.06          +241.7%       3.61 ±  4%  perf-sched.wait_time.max.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.zap_page_range_single.madvise_vma_behavior
      1.07           -88.9%       0.12 ±221%  perf-sched.wait_time.max.ms.__cond_resched.unmap_page_range.zap_page_range_single.madvise_vma_behavior.do_madvise
      0.28 ± 27%    +499.0%       1.67 ± 18%  perf-sched.wait_time.max.ms.__cond_resched.unmap_vmas.unmap_region.do_vmi_align_munmap.do_vmi_munmap
      1.21 ±  2%    +207.2%       3.71 ±  3%  perf-sched.wait_time.max.ms.__cond_resched.zap_page_range_single.madvise_vma_behavior.do_madvise.__x64_sys_madvise
     13.43 ± 26%     +38.8%      18.64        perf-sched.wait_time.max.ms.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     28.45          +517.3%     175.65 ± 14%  perf-sched.wait_time.max.ms.do_task_dead.do_exit.__x64_sys_exit.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.79 ± 10%     +62.2%       1.28 ± 25%  perf-sched.wait_time.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
     13.22 ±  2%    +317.2%      55.16 ± 35%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function
    834.29 ± 28%     -48.5%     429.53 ± 94%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
     22.48          +628.6%     163.83 ± 16%  perf-sched.wait_time.max.ms.futex_wait_queue.__futex_wait.futex_wait.do_futex
     22.74 ± 18%    +398.0%     113.25 ± 16%  perf-sched.wait_time.max.ms.schedule_hrtimeout_range_clock.do_sigtimedwait.__x64_sys_rt_sigtimedwait.do_syscall_64
      7.72 ±  7%     +80.6%      13.95 ±  2%  perf-sched.wait_time.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write_killable.__vm_munmap
      0.74 ±  4%     +77.2%       1.31 ± 32%  perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      5.01           +14.1%       5.72 ±  2%  perf-sched.wait_time.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     44.98           -19.7       25.32 ±  2%  perf-profile.calltrace.cycles-pp.secondary_startup_64_no_verify
     43.21           -19.6       23.65 ±  3%  perf-profile.calltrace.cycles-pp.start_secondary.secondary_startup_64_no_verify
     43.21           -19.6       23.65 ±  3%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     43.18           -19.5       23.63 ±  3%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     40.30           -17.5       22.75 ±  3%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     41.10           -17.4       23.66 ±  2%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
     39.55           -17.3       22.24 ±  3%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
     24.76 ±  2%      -8.5       16.23 ±  3%  perf-profile.calltrace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      8.68 ±  4%      -6.5        2.22 ±  6%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.intel_idle_irq.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      7.23 ±  4%      -5.8        1.46 ±  8%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
      7.23 ±  4%      -5.8        1.46 ±  8%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
      7.11 ±  4%      -5.7        1.39 ±  7%  perf-profile.calltrace.cycles-pp.__x64_sys_exit.do_syscall_64.entry_SYSCALL_64_after_hwframe
      7.09 ±  4%      -5.7        1.39 ±  7%  perf-profile.calltrace.cycles-pp.do_exit.__x64_sys_exit.do_syscall_64.entry_SYSCALL_64_after_hwframe
      6.59 ±  3%      -5.1        1.47 ±  7%  perf-profile.calltrace.cycles-pp.ret_from_fork_asm
      6.59 ±  3%      -5.1        1.47 ±  7%  perf-profile.calltrace.cycles-pp.ret_from_fork.ret_from_fork_asm
      6.59 ±  3%      -5.1        1.47 ±  7%  perf-profile.calltrace.cycles-pp.kthread.ret_from_fork.ret_from_fork_asm
      5.76 ±  2%      -5.0        0.80 ±  9%  perf-profile.calltrace.cycles-pp.start_thread
      7.43 ±  2%      -4.9        2.52 ±  7%  perf-profile.calltrace.cycles-pp.intel_idle_irq.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      5.51 ±  3%      -4.8        0.70 ±  7%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.start_thread
      5.50 ±  3%      -4.8        0.70 ±  7%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.start_thread
      5.48 ±  3%      -4.8        0.69 ±  7%  perf-profile.calltrace.cycles-pp.__x64_sys_exit.do_syscall_64.entry_SYSCALL_64_after_hwframe.start_thread
      5.42 ±  3%      -4.7        0.69 ±  7%  perf-profile.calltrace.cycles-pp.do_exit.__x64_sys_exit.do_syscall_64.entry_SYSCALL_64_after_hwframe.start_thread
      5.90 ±  5%      -3.9        2.01 ±  4%  perf-profile.calltrace.cycles-pp.flush_tlb_mm_range.tlb_finish_mmu.zap_page_range_single.madvise_vma_behavior.do_madvise
      4.18 ±  5%      -3.8        0.37 ± 71%  perf-profile.calltrace.cycles-pp.exit_notify.do_exit.__x64_sys_exit.do_syscall_64.entry_SYSCALL_64_after_hwframe
      5.76 ±  5%      -3.8        1.98 ±  4%  perf-profile.calltrace.cycles-pp.on_each_cpu_cond_mask.flush_tlb_mm_range.tlb_finish_mmu.zap_page_range_single.madvise_vma_behavior
      5.04 ±  7%      -3.7        1.32 ±  9%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__clone
      5.03 ±  7%      -3.7        1.32 ±  9%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__clone
      5.02 ±  7%      -3.7        1.32 ±  9%  perf-profile.calltrace.cycles-pp.__do_sys_clone.do_syscall_64.entry_SYSCALL_64_after_hwframe.__clone
      5.02 ±  7%      -3.7        1.32 ±  9%  perf-profile.calltrace.cycles-pp.kernel_clone.__do_sys_clone.do_syscall_64.entry_SYSCALL_64_after_hwframe.__clone
      5.62 ±  5%      -3.7        1.96 ±  3%  perf-profile.calltrace.cycles-pp.smp_call_function_many_cond.on_each_cpu_cond_mask.flush_tlb_mm_range.tlb_finish_mmu.zap_page_range_single
      4.03 ±  4%      -3.1        0.92 ±  7%  perf-profile.calltrace.cycles-pp.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      6.03 ±  5%      -3.1        2.94 ±  3%  perf-profile.calltrace.cycles-pp.tlb_finish_mmu.zap_page_range_single.madvise_vma_behavior.do_madvise.__x64_sys_madvise
      3.43 ±  5%      -2.8        0.67 ± 13%  perf-profile.calltrace.cycles-pp.run_ksoftirqd.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      3.43 ±  5%      -2.8        0.67 ± 13%  perf-profile.calltrace.cycles-pp.__do_softirq.run_ksoftirqd.smpboot_thread_fn.kthread.ret_from_fork
      3.41 ±  5%      -2.7        0.66 ± 13%  perf-profile.calltrace.cycles-pp.rcu_core.__do_softirq.run_ksoftirqd.smpboot_thread_fn.kthread
      3.40 ±  5%      -2.7        0.66 ± 13%  perf-profile.calltrace.cycles-pp.rcu_do_batch.rcu_core.__do_softirq.run_ksoftirqd.smpboot_thread_fn
      3.67 ±  7%      -2.7        0.94 ± 10%  perf-profile.calltrace.cycles-pp.copy_process.kernel_clone.__do_sys_clone.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.92 ±  7%      -2.4        0.50 ± 46%  perf-profile.calltrace.cycles-pp.stress_pthread
      2.54 ±  6%      -2.2        0.38 ± 70%  perf-profile.calltrace.cycles-pp.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      2.46 ±  6%      -1.8        0.63 ± 10%  perf-profile.calltrace.cycles-pp.dup_task_struct.copy_process.kernel_clone.__do_sys_clone.do_syscall_64
      3.00 ±  6%      -1.6        1.43 ±  7%  perf-profile.calltrace.cycles-pp.__munmap
      2.96 ±  6%      -1.5        1.42 ±  7%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__munmap
      2.96 ±  6%      -1.5        1.42 ±  7%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
      2.95 ±  6%      -1.5        1.41 ±  7%  perf-profile.calltrace.cycles-pp.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
      2.95 ±  6%      -1.5        1.41 ±  7%  perf-profile.calltrace.cycles-pp.__vm_munmap.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
      2.02 ±  4%      -1.5        0.52 ± 46%  perf-profile.calltrace.cycles-pp.__lll_lock_wait
      1.78 ±  3%      -1.5        0.30 ±100%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__lll_lock_wait
      1.77 ±  3%      -1.5        0.30 ±100%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__lll_lock_wait
      1.54 ±  6%      -1.3        0.26 ±100%  perf-profile.calltrace.cycles-pp.schedule_idle.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
      2.54 ±  6%      -1.2        1.38 ±  6%  perf-profile.calltrace.cycles-pp.do_vmi_munmap.__vm_munmap.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.51 ±  6%      -1.1        1.37 ±  7%  perf-profile.calltrace.cycles-pp.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap.__x64_sys_munmap.do_syscall_64
      1.13            -0.7        0.40 ± 70%  perf-profile.calltrace.cycles-pp.exit_mm.do_exit.__x64_sys_exit.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.15 ±  5%      -0.7        0.46 ± 45%  perf-profile.calltrace.cycles-pp.llist_add_batch.smp_call_function_many_cond.on_each_cpu_cond_mask.flush_tlb_mm_range.tlb_finish_mmu
      1.58 ±  5%      -0.6        0.94 ±  7%  perf-profile.calltrace.cycles-pp.unmap_region.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap.__x64_sys_munmap
      0.99 ±  5%      -0.5        0.51 ± 45%  perf-profile.calltrace.cycles-pp.__do_softirq.irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
      1.01 ±  5%      -0.5        0.54 ± 45%  perf-profile.calltrace.cycles-pp.irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
      0.82 ±  4%      -0.2        0.59 ±  5%  perf-profile.calltrace.cycles-pp.default_send_IPI_mask_sequence_phys.smp_call_function_many_cond.on_each_cpu_cond_mask.flush_tlb_mm_range.tlb_finish_mmu
      0.00            +0.5        0.54 ±  5%  perf-profile.calltrace.cycles-pp.flush_tlb_func.__flush_smp_call_function_queue.__sysvec_call_function.sysvec_call_function.asm_sysvec_call_function
      0.00            +0.6        0.60 ±  5%  perf-profile.calltrace.cycles-pp.release_pages.tlb_batch_pages_flush.tlb_finish_mmu.zap_page_range_single.madvise_vma_behavior
      0.00            +0.6        0.61 ±  6%  perf-profile.calltrace.cycles-pp.release_pages.tlb_batch_pages_flush.tlb_finish_mmu.unmap_region.do_vmi_align_munmap
      0.00            +0.6        0.62 ±  6%  perf-profile.calltrace.cycles-pp.tlb_batch_pages_flush.tlb_finish_mmu.unmap_region.do_vmi_align_munmap.do_vmi_munmap
      0.53 ±  5%      +0.6        1.17 ± 13%  perf-profile.calltrace.cycles-pp.tick_nohz_highres_handler.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      1.94 ±  2%      +0.7        2.64 ±  9%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      0.00            +0.7        0.73 ±  5%  perf-profile.calltrace.cycles-pp.__mod_memcg_lruvec_state.__mod_lruvec_page_state.page_remove_rmap.zap_pte_range.zap_pmd_range
      0.00            +0.8        0.75 ± 20%  perf-profile.calltrace.cycles-pp.__cond_resched.clear_huge_page.__do_huge_pmd_anonymous_page.__handle_mm_fault.handle_mm_fault
      2.02 ±  2%      +0.8        2.85 ±  9%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      0.74 ±  5%      +0.8        1.57 ± 11%  perf-profile.calltrace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      0.00            +0.9        0.90 ±  4%  perf-profile.calltrace.cycles-pp.tlb_batch_pages_flush.tlb_finish_mmu.zap_page_range_single.madvise_vma_behavior.do_madvise
      0.00            +0.9        0.92 ± 13%  perf-profile.calltrace.cycles-pp.scheduler_tick.update_process_times.tick_sched_handle.tick_nohz_highres_handler.__hrtimer_run_queues
      0.86 ±  4%      +1.0        1.82 ± 10%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
      0.86 ±  4%      +1.0        1.83 ± 10%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
      0.00            +1.0        0.98 ±  7%  perf-profile.calltrace.cycles-pp.smp_call_function_many_cond.on_each_cpu_cond_mask.flush_tlb_mm_range.pmdp_invalidate.__split_huge_pmd_locked
      0.09 ±223%      +1.0        1.07 ± 11%  perf-profile.calltrace.cycles-pp.update_process_times.tick_sched_handle.tick_nohz_highres_handler.__hrtimer_run_queues.hrtimer_interrupt
      0.00            +1.0        0.99 ±  6%  perf-profile.calltrace.cycles-pp.on_each_cpu_cond_mask.flush_tlb_mm_range.pmdp_invalidate.__split_huge_pmd_locked.__split_huge_pmd
      0.00            +1.0        1.00 ±  7%  perf-profile.calltrace.cycles-pp.flush_tlb_mm_range.pmdp_invalidate.__split_huge_pmd_locked.__split_huge_pmd.zap_pmd_range
      0.09 ±223%      +1.0        1.10 ± 12%  perf-profile.calltrace.cycles-pp.tick_sched_handle.tick_nohz_highres_handler.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt
      0.00            +1.0        1.01 ±  6%  perf-profile.calltrace.cycles-pp.pmdp_invalidate.__split_huge_pmd_locked.__split_huge_pmd.zap_pmd_range.unmap_page_range
      0.00            +1.1        1.10 ±  5%  perf-profile.calltrace.cycles-pp.__flush_smp_call_function_queue.__sysvec_call_function.sysvec_call_function.asm_sysvec_call_function.native_queued_spin_lock_slowpath
      0.00            +1.1        1.12 ±  5%  perf-profile.calltrace.cycles-pp.__sysvec_call_function.sysvec_call_function.asm_sysvec_call_function.native_queued_spin_lock_slowpath._raw_spin_lock
      0.00            +1.2        1.23 ±  4%  perf-profile.calltrace.cycles-pp.page_add_anon_rmap.__split_huge_pmd_locked.__split_huge_pmd.zap_pmd_range.unmap_page_range
      0.00            +1.3        1.32 ±  4%  perf-profile.calltrace.cycles-pp.sysvec_call_function.asm_sysvec_call_function.native_queued_spin_lock_slowpath._raw_spin_lock.__split_huge_pmd
      0.00            +1.4        1.38 ±  5%  perf-profile.calltrace.cycles-pp.__mod_lruvec_page_state.page_remove_rmap.zap_pte_range.zap_pmd_range.unmap_page_range
      0.00            +2.4        2.44 ± 10%  perf-profile.calltrace.cycles-pp.asm_sysvec_call_function.native_queued_spin_lock_slowpath._raw_spin_lock.__split_huge_pmd.zap_pmd_range
      0.00            +3.1        3.10 ±  5%  perf-profile.calltrace.cycles-pp.page_remove_rmap.zap_pte_range.zap_pmd_range.unmap_page_range.zap_page_range_single
      0.00            +3.5        3.52 ±  5%  perf-profile.calltrace.cycles-pp.__split_huge_pmd_locked.__split_huge_pmd.zap_pmd_range.unmap_page_range.zap_page_range_single
      0.88 ±  4%      +3.8        4.69 ±  4%  perf-profile.calltrace.cycles-pp.zap_pte_range.zap_pmd_range.unmap_page_range.zap_page_range_single.madvise_vma_behavior
      6.30 ±  6%     +13.5       19.85 ±  7%  perf-profile.calltrace.cycles-pp.__clone
      0.00           +16.7       16.69 ±  7%  perf-profile.calltrace.cycles-pp.clear_page_erms.clear_huge_page.__do_huge_pmd_anonymous_page.__handle_mm_fault.handle_mm_fault
      1.19 ± 29%     +17.1       18.32 ±  7%  perf-profile.calltrace.cycles-pp.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.00           +17.6       17.56 ±  7%  perf-profile.calltrace.cycles-pp.clear_huge_page.__do_huge_pmd_anonymous_page.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      0.63 ±  7%     +17.7       18.35 ±  7%  perf-profile.calltrace.cycles-pp.asm_exc_page_fault.__clone
      0.59 ±  5%     +17.8       18.34 ±  7%  perf-profile.calltrace.cycles-pp.exc_page_fault.asm_exc_page_fault.__clone
      0.59 ±  5%     +17.8       18.34 ±  7%  perf-profile.calltrace.cycles-pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.__clone
      0.00           +17.9       17.90 ±  7%  perf-profile.calltrace.cycles-pp.__do_huge_pmd_anonymous_page.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault
      0.36 ± 71%     +18.0       18.33 ±  7%  perf-profile.calltrace.cycles-pp.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.__clone
      0.00           +32.0       32.03 ±  2%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.__split_huge_pmd.zap_pmd_range.unmap_page_range
      0.00           +32.6       32.62 ±  2%  perf-profile.calltrace.cycles-pp._raw_spin_lock.__split_huge_pmd.zap_pmd_range.unmap_page_range.zap_page_range_single
      0.00           +36.2       36.19 ±  2%  perf-profile.calltrace.cycles-pp.__split_huge_pmd.zap_pmd_range.unmap_page_range.zap_page_range_single.madvise_vma_behavior
      7.97 ±  4%     +36.6       44.52 ±  2%  perf-profile.calltrace.cycles-pp.__madvise
      7.91 ±  4%     +36.6       44.46 ±  2%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__madvise
      7.90 ±  4%     +36.6       44.46 ±  2%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__madvise
      7.87 ±  4%     +36.6       44.44 ±  2%  perf-profile.calltrace.cycles-pp.__x64_sys_madvise.do_syscall_64.entry_SYSCALL_64_after_hwframe.__madvise
      7.86 ±  4%     +36.6       44.44 ±  2%  perf-profile.calltrace.cycles-pp.do_madvise.__x64_sys_madvise.do_syscall_64.entry_SYSCALL_64_after_hwframe.__madvise
      7.32 ±  4%     +36.8       44.07 ±  2%  perf-profile.calltrace.cycles-pp.madvise_vma_behavior.do_madvise.__x64_sys_madvise.do_syscall_64.entry_SYSCALL_64_after_hwframe
      7.25 ±  4%     +36.8       44.06 ±  2%  perf-profile.calltrace.cycles-pp.zap_page_range_single.madvise_vma_behavior.do_madvise.__x64_sys_madvise.do_syscall_64
      1.04 ±  4%     +40.0       41.08 ±  2%  perf-profile.calltrace.cycles-pp.unmap_page_range.zap_page_range_single.madvise_vma_behavior.do_madvise.__x64_sys_madvise
      1.00 ±  3%     +40.1       41.06 ±  2%  perf-profile.calltrace.cycles-pp.zap_pmd_range.unmap_page_range.zap_page_range_single.madvise_vma_behavior.do_madvise
     44.98           -19.7       25.32 ±  2%  perf-profile.children.cycles-pp.secondary_startup_64_no_verify
     44.98           -19.7       25.32 ±  2%  perf-profile.children.cycles-pp.cpu_startup_entry
     44.96           -19.6       25.31 ±  2%  perf-profile.children.cycles-pp.do_idle
     43.21           -19.6       23.65 ±  3%  perf-profile.children.cycles-pp.start_secondary
     41.98           -17.6       24.40 ±  2%  perf-profile.children.cycles-pp.cpuidle_idle_call
     41.21           -17.3       23.86 ±  2%  perf-profile.children.cycles-pp.cpuidle_enter
     41.20           -17.3       23.86 ±  2%  perf-profile.children.cycles-pp.cpuidle_enter_state
     12.69 ±  3%     -10.6        2.12 ±  6%  perf-profile.children.cycles-pp.do_exit
     12.60 ±  3%     -10.5        2.08 ±  7%  perf-profile.children.cycles-pp.__x64_sys_exit
     24.76 ±  2%      -8.5       16.31 ±  2%  perf-profile.children.cycles-pp.intel_idle
     12.34 ±  2%      -8.4        3.90 ±  5%  perf-profile.children.cycles-pp.intel_idle_irq
      6.96 ±  4%      -5.4        1.58 ±  7%  perf-profile.children.cycles-pp.ret_from_fork_asm
      6.69 ±  4%      -5.2        1.51 ±  7%  perf-profile.children.cycles-pp.ret_from_fork
      6.59 ±  3%      -5.1        1.47 ±  7%  perf-profile.children.cycles-pp.kthread
      5.78 ±  2%      -5.0        0.80 ±  8%  perf-profile.children.cycles-pp.start_thread
      4.68 ±  4%      -4.5        0.22 ± 10%  perf-profile.children.cycles-pp._raw_spin_lock_irq
      5.03 ±  7%      -3.7        1.32 ±  9%  perf-profile.children.cycles-pp.__do_sys_clone
      5.02 ±  7%      -3.7        1.32 ±  9%  perf-profile.children.cycles-pp.kernel_clone
      4.20 ±  5%      -3.7        0.53 ±  9%  perf-profile.children.cycles-pp.exit_notify
      4.67 ±  5%      -3.6        1.10 ±  9%  perf-profile.children.cycles-pp.rcu_core
      4.60 ±  4%      -3.5        1.06 ± 10%  perf-profile.children.cycles-pp.rcu_do_batch
      4.89 ±  5%      -3.4        1.44 ± 11%  perf-profile.children.cycles-pp.__do_softirq
      5.64 ±  3%      -3.2        2.39 ±  6%  perf-profile.children.cycles-pp.__schedule
      6.27 ±  5%      -3.2        3.03 ±  4%  perf-profile.children.cycles-pp.flush_tlb_mm_range
      4.03 ±  4%      -3.1        0.92 ±  7%  perf-profile.children.cycles-pp.smpboot_thread_fn
      6.68 ±  4%      -3.1        3.61 ±  3%  perf-profile.children.cycles-pp.tlb_finish_mmu
      6.04 ±  5%      -3.1        2.99 ±  4%  perf-profile.children.cycles-pp.on_each_cpu_cond_mask
      6.04 ±  5%      -3.0        2.99 ±  4%  perf-profile.children.cycles-pp.smp_call_function_many_cond
      3.77 ±  2%      -3.0        0.73 ± 16%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      7.78            -3.0        4.77 ±  5%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      3.43 ±  5%      -2.8        0.67 ± 13%  perf-profile.children.cycles-pp.run_ksoftirqd
      3.67 ±  7%      -2.7        0.94 ± 10%  perf-profile.children.cycles-pp.copy_process
      2.80 ±  6%      -2.5        0.34 ± 15%  perf-profile.children.cycles-pp.queued_write_lock_slowpath
      3.41 ±  2%      -2.5        0.96 ± 16%  perf-profile.children.cycles-pp.do_futex
      3.06 ±  5%      -2.4        0.68 ± 16%  perf-profile.children.cycles-pp.free_unref_page_commit
      3.02 ±  5%      -2.4        0.67 ± 16%  perf-profile.children.cycles-pp.free_pcppages_bulk
      2.92 ±  7%      -2.3        0.58 ± 14%  perf-profile.children.cycles-pp.stress_pthread
      3.22 ±  3%      -2.3        0.90 ± 18%  perf-profile.children.cycles-pp.__x64_sys_futex
      2.52 ±  5%      -2.2        0.35 ±  7%  perf-profile.children.cycles-pp.release_task
      2.54 ±  6%      -2.0        0.53 ± 10%  perf-profile.children.cycles-pp.worker_thread
      3.12 ±  5%      -1.9        1.17 ± 11%  perf-profile.children.cycles-pp.free_unref_page
      2.31 ±  6%      -1.9        0.45 ± 11%  perf-profile.children.cycles-pp.process_one_work
      2.47 ±  6%      -1.8        0.63 ± 10%  perf-profile.children.cycles-pp.dup_task_struct
      2.19 ±  5%      -1.8        0.41 ± 12%  perf-profile.children.cycles-pp.delayed_vfree_work
      2.14 ±  5%      -1.7        0.40 ± 11%  perf-profile.children.cycles-pp.vfree
      3.19 ±  2%      -1.6        1.58 ±  8%  perf-profile.children.cycles-pp.schedule
      2.06 ±  3%      -1.6        0.46 ±  7%  perf-profile.children.cycles-pp.__sigtimedwait
      3.02 ±  6%      -1.6        1.44 ±  7%  perf-profile.children.cycles-pp.__munmap
      1.94 ±  4%      -1.6        0.39 ± 14%  perf-profile.children.cycles-pp.__unfreeze_partials
      2.95 ±  6%      -1.5        1.41 ±  7%  perf-profile.children.cycles-pp.__x64_sys_munmap
      2.95 ±  6%      -1.5        1.41 ±  7%  perf-profile.children.cycles-pp.__vm_munmap
      2.14 ±  3%      -1.5        0.60 ± 21%  perf-profile.children.cycles-pp.futex_wait
      2.08 ±  4%      -1.5        0.60 ± 19%  perf-profile.children.cycles-pp.__lll_lock_wait
      2.04 ±  3%      -1.5        0.56 ± 20%  perf-profile.children.cycles-pp.__futex_wait
      1.77 ±  5%      -1.5        0.32 ± 10%  perf-profile.children.cycles-pp.remove_vm_area
      1.86 ±  5%      -1.4        0.46 ± 10%  perf-profile.children.cycles-pp.open64
      1.74 ±  4%      -1.4        0.37 ±  7%  perf-profile.children.cycles-pp.__x64_sys_rt_sigtimedwait
      1.71 ±  4%      -1.4        0.36 ±  8%  perf-profile.children.cycles-pp.do_sigtimedwait
      1.79 ±  5%      -1.3        0.46 ±  9%  perf-profile.children.cycles-pp.__x64_sys_openat
      1.78 ±  5%      -1.3        0.46 ±  8%  perf-profile.children.cycles-pp.do_sys_openat2
      1.61 ±  4%      -1.3        0.32 ± 12%  perf-profile.children.cycles-pp.poll_idle
      1.65 ±  9%      -1.3        0.37 ± 14%  perf-profile.children.cycles-pp.pthread_create@@GLIBC_2.2.5
      1.56 ±  8%      -1.2        0.35 ±  7%  perf-profile.children.cycles-pp.alloc_thread_stack_node
      2.32 ±  3%      -1.2        1.13 ±  8%  perf-profile.children.cycles-pp.pick_next_task_fair
      2.59 ±  6%      -1.2        1.40 ±  7%  perf-profile.children.cycles-pp.do_vmi_munmap
      1.55 ±  4%      -1.2        0.40 ± 19%  perf-profile.children.cycles-pp.futex_wait_queue
      1.37 ±  5%      -1.1        0.22 ± 12%  perf-profile.children.cycles-pp.find_unlink_vmap_area
      2.52 ±  6%      -1.1        1.38 ±  6%  perf-profile.children.cycles-pp.do_vmi_align_munmap
      1.53 ±  5%      -1.1        0.39 ±  8%  perf-profile.children.cycles-pp.do_filp_open
      1.52 ±  5%      -1.1        0.39 ±  7%  perf-profile.children.cycles-pp.path_openat
      1.25 ±  3%      -1.1        0.14 ± 12%  perf-profile.children.cycles-pp.sigpending
      1.58 ±  5%      -1.1        0.50 ±  6%  perf-profile.children.cycles-pp.schedule_idle
      1.29 ±  5%      -1.1        0.21 ± 21%  perf-profile.children.cycles-pp.__mprotect
      1.40 ±  8%      -1.1        0.32 ±  4%  perf-profile.children.cycles-pp.__vmalloc_node_range
      2.06 ±  3%      -1.0        1.02 ±  9%  perf-profile.children.cycles-pp.newidle_balance
      1.04 ±  3%      -1.0        0.08 ± 23%  perf-profile.children.cycles-pp.__x64_sys_rt_sigpending
      1.14 ±  6%      -1.0        0.18 ± 18%  perf-profile.children.cycles-pp.__x64_sys_mprotect
      1.13 ±  6%      -1.0        0.18 ± 17%  perf-profile.children.cycles-pp.do_mprotect_pkey
      1.30 ±  7%      -0.9        0.36 ± 10%  perf-profile.children.cycles-pp.wake_up_new_task
      1.14 ±  9%      -0.9        0.22 ± 16%  perf-profile.children.cycles-pp.do_anonymous_page
      0.95 ±  3%      -0.9        0.04 ± 71%  perf-profile.children.cycles-pp.do_sigpending
      1.24 ±  3%      -0.9        0.34 ±  9%  perf-profile.children.cycles-pp.futex_wake
      1.02 ±  6%      -0.9        0.14 ± 15%  perf-profile.children.cycles-pp.mprotect_fixup
      1.91 ±  2%      -0.9        1.06 ±  9%  perf-profile.children.cycles-pp.load_balance
      1.38 ±  5%      -0.8        0.53 ±  6%  perf-profile.children.cycles-pp.select_task_rq_fair
      1.14 ±  4%      -0.8        0.31 ± 12%  perf-profile.children.cycles-pp.__pthread_mutex_unlock_usercnt
      2.68 ±  3%      -0.8        1.91 ±  6%  perf-profile.children.cycles-pp.__flush_smp_call_function_queue
      1.00 ±  4%      -0.7        0.26 ± 10%  perf-profile.children.cycles-pp.flush_smp_call_function_queue
      1.44 ±  3%      -0.7        0.73 ± 10%  perf-profile.children.cycles-pp.find_busiest_group
      0.81 ±  6%      -0.7        0.10 ± 18%  perf-profile.children.cycles-pp.vma_modify
      1.29 ±  3%      -0.7        0.60 ±  8%  perf-profile.children.cycles-pp.exit_mm
      1.40 ±  3%      -0.7        0.71 ± 10%  perf-profile.children.cycles-pp.update_sd_lb_stats
      0.78 ±  7%      -0.7        0.10 ± 19%  perf-profile.children.cycles-pp.__split_vma
      0.90 ±  8%      -0.7        0.22 ± 10%  perf-profile.children.cycles-pp.__vmalloc_area_node
      0.75 ±  4%      -0.7        0.10 ±  5%  perf-profile.children.cycles-pp.__exit_signal
      1.49 ±  2%      -0.7        0.84 ±  7%  perf-profile.children.cycles-pp.try_to_wake_up
      0.89 ±  7%      -0.6        0.24 ± 10%  perf-profile.children.cycles-pp.find_idlest_cpu
      1.59 ±  5%      -0.6        0.95 ±  7%  perf-profile.children.cycles-pp.unmap_region
      0.86 ±  3%      -0.6        0.22 ± 26%  perf-profile.children.cycles-pp.pthread_cond_timedwait@@GLIBC_2.3.2
      1.59 ±  3%      -0.6        0.95 ±  9%  perf-profile.children.cycles-pp.irq_exit_rcu
      1.24 ±  3%      -0.6        0.61 ± 10%  perf-profile.children.cycles-pp.update_sg_lb_stats
      0.94 ±  5%      -0.6        0.32 ± 11%  perf-profile.children.cycles-pp.do_task_dead
      0.87 ±  3%      -0.6        0.25 ± 19%  perf-profile.children.cycles-pp.perf_iterate_sb
      0.82 ±  4%      -0.6        0.22 ± 10%  perf-profile.children.cycles-pp.sched_ttwu_pending
      1.14 ±  3%      -0.6        0.54 ± 10%  perf-profile.children.cycles-pp.activate_task
      0.84            -0.6        0.25 ± 10%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      0.81 ±  6%      -0.6        0.22 ± 11%  perf-profile.children.cycles-pp.find_idlest_group
      0.75 ±  5%      -0.6        0.18 ± 14%  perf-profile.children.cycles-pp.step_into
      0.74 ±  8%      -0.6        0.18 ± 14%  perf-profile.children.cycles-pp.__alloc_pages_bulk
      0.74 ±  6%      -0.5        0.19 ± 11%  perf-profile.children.cycles-pp.update_sg_wakeup_stats
      0.72 ±  5%      -0.5        0.18 ± 15%  perf-profile.children.cycles-pp.pick_link
      1.06 ±  2%      -0.5        0.52 ±  9%  perf-profile.children.cycles-pp.enqueue_task_fair
      0.77 ±  6%      -0.5        0.23 ± 12%  perf-profile.children.cycles-pp.unmap_vmas
      0.76 ±  2%      -0.5        0.22 ±  8%  perf-profile.children.cycles-pp.exit_to_user_mode_prepare
      0.94 ±  2%      -0.5        0.42 ± 10%  perf-profile.children.cycles-pp.dequeue_task_fair
      0.65 ±  5%      -0.5        0.15 ± 18%  perf-profile.children.cycles-pp.open_last_lookups
      1.37 ±  3%      -0.5        0.87 ±  4%  perf-profile.children.cycles-pp.llist_add_batch
      0.70 ±  4%      -0.5        0.22 ± 19%  perf-profile.children.cycles-pp.memcpy_orig
      0.91 ±  4%      -0.5        0.44 ±  7%  perf-profile.children.cycles-pp.update_load_avg
      0.67            -0.5        0.20 ±  8%  perf-profile.children.cycles-pp.switch_fpu_return
      0.88 ±  3%      -0.5        0.42 ±  8%  perf-profile.children.cycles-pp.enqueue_entity
      0.91 ±  4%      -0.5        0.45 ± 12%  perf-profile.children.cycles-pp.ttwu_do_activate
      0.77 ±  4%      -0.5        0.32 ± 10%  perf-profile.children.cycles-pp.schedule_hrtimeout_range_clock
      0.63 ±  5%      -0.4        0.20 ± 21%  perf-profile.children.cycles-pp.arch_dup_task_struct
      0.74 ±  3%      -0.4        0.32 ± 15%  perf-profile.children.cycles-pp.dequeue_entity
      0.62 ±  5%      -0.4        0.21 ±  5%  perf-profile.children.cycles-pp.finish_task_switch
      0.56            -0.4        0.16 ±  7%  perf-profile.children.cycles-pp.restore_fpregs_from_fpstate
      0.53 ±  4%      -0.4        0.13 ±  9%  perf-profile.children.cycles-pp.syscall
      0.50 ±  9%      -0.4        0.11 ± 18%  perf-profile.children.cycles-pp.__get_vm_area_node
      0.51 ±  3%      -0.4        0.12 ± 12%  perf-profile.children.cycles-pp.__slab_free
      0.52 ±  2%      -0.4        0.14 ± 10%  perf-profile.children.cycles-pp.kmem_cache_free
      0.75 ±  3%      -0.4        0.37 ±  9%  perf-profile.children.cycles-pp.exit_mm_release
      0.50 ±  6%      -0.4        0.12 ± 21%  perf-profile.children.cycles-pp.do_send_specific
      0.74 ±  3%      -0.4        0.37 ±  8%  perf-profile.children.cycles-pp.futex_exit_release
      0.45 ± 10%      -0.4        0.09 ± 17%  perf-profile.children.cycles-pp.alloc_vmap_area
      0.47 ±  3%      -0.4        0.11 ± 20%  perf-profile.children.cycles-pp.tgkill
      0.68 ± 11%      -0.4        0.32 ± 12%  perf-profile.children.cycles-pp.__mmap
      0.48 ±  3%      -0.4        0.13 ±  6%  perf-profile.children.cycles-pp.entry_SYSCALL_64
      0.76 ±  5%      -0.3        0.41 ± 10%  perf-profile.children.cycles-pp.wake_up_q
      0.42 ±  7%      -0.3        0.08 ± 22%  perf-profile.children.cycles-pp.__close
      0.49 ±  7%      -0.3        0.14 ± 25%  perf-profile.children.cycles-pp.kmem_cache_alloc
      0.49 ±  9%      -0.3        0.15 ± 14%  perf-profile.children.cycles-pp.mas_store_gfp
      0.46 ±  4%      -0.3        0.12 ± 23%  perf-profile.children.cycles-pp.perf_event_task_output
      0.44 ± 10%      -0.3        0.10 ± 28%  perf-profile.children.cycles-pp.pthread_sigqueue
      0.46 ±  4%      -0.3        0.12 ± 15%  perf-profile.children.cycles-pp.link_path_walk
      0.42 ±  8%      -0.3        0.10 ± 20%  perf-profile.children.cycles-pp.proc_ns_get_link
      0.63 ± 10%      -0.3        0.32 ± 12%  perf-profile.children.cycles-pp.vm_mmap_pgoff
      0.45 ±  4%      -0.3        0.14 ± 13%  perf-profile.children.cycles-pp.sched_move_task
      0.36 ±  8%      -0.3        0.06 ± 49%  perf-profile.children.cycles-pp.__x64_sys_close
      0.46 ±  8%      -0.3        0.17 ± 14%  perf-profile.children.cycles-pp.prctl
      0.65 ±  3%      -0.3        0.35 ±  7%  perf-profile.children.cycles-pp.futex_cleanup
      0.42 ±  7%      -0.3        0.12 ± 15%  perf-profile.children.cycles-pp.mas_store_prealloc
      0.49 ±  5%      -0.3        0.20 ± 13%  perf-profile.children.cycles-pp.__rmqueue_pcplist
      0.37 ±  7%      -0.3        0.08 ± 16%  perf-profile.children.cycles-pp.do_tkill
      0.36 ± 10%      -0.3        0.08 ± 20%  perf-profile.children.cycles-pp.ns_get_path
      0.37 ±  4%      -0.3        0.09 ± 18%  perf-profile.children.cycles-pp.setns
      0.67 ±  3%      -0.3        0.41 ±  8%  perf-profile.children.cycles-pp.hrtimer_wakeup
      0.35 ±  5%      -0.3        0.10 ± 16%  perf-profile.children.cycles-pp.__task_pid_nr_ns
      0.41 ±  5%      -0.3        0.16 ± 12%  perf-profile.children.cycles-pp.mas_wr_bnode
      0.35 ±  4%      -0.3        0.10 ± 20%  perf-profile.children.cycles-pp.rcu_cblist_dequeue
      0.37 ±  5%      -0.2        0.12 ± 17%  perf-profile.children.cycles-pp.exit_task_stack_account
      0.56 ±  4%      -0.2        0.31 ± 12%  perf-profile.children.cycles-pp.select_task_rq
      0.29 ±  6%      -0.2        0.05 ± 46%  perf-profile.children.cycles-pp.mas_wr_store_entry
      0.34 ±  4%      -0.2        0.10 ± 27%  perf-profile.children.cycles-pp.perf_event_task
      0.39 ±  9%      -0.2        0.15 ± 12%  perf-profile.children.cycles-pp.__switch_to_asm
      0.35 ±  5%      -0.2        0.11 ± 11%  perf-profile.children.cycles-pp.account_kernel_stack
      0.30 ±  7%      -0.2        0.06 ± 48%  perf-profile.children.cycles-pp.__ns_get_path
      0.31 ±  9%      -0.2        0.07 ± 17%  perf-profile.children.cycles-pp.free_vmap_area_noflush
      0.31 ±  5%      -0.2        0.08 ± 19%  perf-profile.children.cycles-pp.__do_sys_setns
      0.33 ±  7%      -0.2        0.10 ±  7%  perf-profile.children.cycles-pp.__free_one_page
      0.31 ± 11%      -0.2        0.08 ± 13%  perf-profile.children.cycles-pp.__pte_alloc
      0.36 ±  6%      -0.2        0.13 ± 12%  perf-profile.children.cycles-pp.switch_mm_irqs_off
      0.27 ± 12%      -0.2        0.05 ± 71%  perf-profile.children.cycles-pp.__fput
      0.53 ±  9%      -0.2        0.31 ± 12%  perf-profile.children.cycles-pp.do_mmap
      0.27 ± 12%      -0.2        0.05 ± 77%  perf-profile.children.cycles-pp.__x64_sys_rt_tgsigqueueinfo
      0.28 ±  5%      -0.2        0.06 ± 50%  perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.34 ± 10%      -0.2        0.12 ± 29%  perf-profile.children.cycles-pp.futex_wait_setup
      0.27 ±  6%      -0.2        0.06 ± 45%  perf-profile.children.cycles-pp.__x64_sys_tgkill
      0.31 ±  7%      -0.2        0.11 ± 18%  perf-profile.children.cycles-pp.__switch_to
      0.26 ±  8%      -0.2        0.06 ± 21%  perf-profile.children.cycles-pp.__call_rcu_common
      0.33 ±  9%      -0.2        0.13 ± 18%  perf-profile.children.cycles-pp.__do_sys_prctl
      0.28 ±  5%      -0.2        0.08 ± 17%  perf-profile.children.cycles-pp.mm_release
      0.52 ±  2%      -0.2        0.32 ±  9%  perf-profile.children.cycles-pp.__get_user_8
      0.24 ± 10%      -0.2        0.04 ± 72%  perf-profile.children.cycles-pp.dput
      0.25 ± 14%      -0.2        0.05 ± 46%  perf-profile.children.cycles-pp.perf_event_mmap
      0.24 ±  7%      -0.2        0.06 ± 50%  perf-profile.children.cycles-pp.mas_walk
      0.28 ±  6%      -0.2        0.10 ± 24%  perf-profile.children.cycles-pp.rmqueue_bulk
      0.23 ± 15%      -0.2        0.05 ± 46%  perf-profile.children.cycles-pp.perf_event_mmap_event
      0.25 ± 15%      -0.2        0.08 ± 45%  perf-profile.children.cycles-pp.___slab_alloc
      0.20 ± 14%      -0.2        0.03 ±100%  perf-profile.children.cycles-pp.lookup_fast
      0.20 ± 10%      -0.2        0.04 ± 75%  perf-profile.children.cycles-pp.memcg_slab_post_alloc_hook
      0.28 ±  7%      -0.2        0.12 ± 24%  perf-profile.children.cycles-pp.prepare_task_switch
      0.22 ± 11%      -0.2        0.05 ±  8%  perf-profile.children.cycles-pp.ttwu_queue_wakelist
      0.63 ±  5%      -0.2        0.47 ± 12%  perf-profile.children.cycles-pp.llist_reverse_order
      0.25 ± 11%      -0.2        0.09 ± 34%  perf-profile.children.cycles-pp.futex_q_lock
      0.21 ±  6%      -0.2        0.06 ± 47%  perf-profile.children.cycles-pp.kmem_cache_alloc_node
      0.18 ± 11%      -0.2        0.03 ±100%  perf-profile.children.cycles-pp.alloc_empty_file
      0.19 ±  5%      -0.2        0.04 ± 71%  perf-profile.children.cycles-pp.__put_task_struct
      0.19 ± 15%      -0.2        0.03 ± 70%  perf-profile.children.cycles-pp.asm_sysvec_call_function_single
      0.24 ±  6%      -0.2        0.09 ± 20%  perf-profile.children.cycles-pp.___perf_sw_event
      0.18 ±  7%      -0.2        0.03 ±100%  perf-profile.children.cycles-pp.perf_event_fork
      0.19 ± 11%      -0.1        0.04 ± 71%  perf-profile.children.cycles-pp.select_idle_core
      0.30 ± 11%      -0.1        0.15 ±  7%  perf-profile.children.cycles-pp.pte_alloc_one
      0.25 ±  6%      -0.1        0.11 ± 10%  perf-profile.children.cycles-pp.set_next_entity
      0.20 ± 10%      -0.1        0.06 ± 49%  perf-profile.children.cycles-pp.__perf_event_header__init_id
      0.18 ± 15%      -0.1        0.03 ±101%  perf-profile.children.cycles-pp.__radix_tree_lookup
      0.22 ± 11%      -0.1        0.08 ± 21%  perf-profile.children.cycles-pp.mas_spanning_rebalance
      0.20 ±  9%      -0.1        0.06 ±  9%  perf-profile.children.cycles-pp.stress_pthread_func
      0.18 ± 12%      -0.1        0.04 ± 73%  perf-profile.children.cycles-pp.__getpid
      0.16 ± 13%      -0.1        0.02 ± 99%  perf-profile.children.cycles-pp.walk_component
      0.28 ±  5%      -0.1        0.15 ± 13%  perf-profile.children.cycles-pp.update_curr
      0.25 ±  5%      -0.1        0.11 ± 22%  perf-profile.children.cycles-pp.balance_fair
      0.16 ±  9%      -0.1        0.03 ±100%  perf-profile.children.cycles-pp.futex_wake_mark
      0.16 ± 12%      -0.1        0.04 ± 71%  perf-profile.children.cycles-pp.get_futex_key
      0.17 ±  6%      -0.1        0.05 ± 47%  perf-profile.children.cycles-pp.memcg_account_kmem
      0.25 ± 11%      -0.1        0.12 ± 11%  perf-profile.children.cycles-pp._find_next_bit
      0.15 ± 13%      -0.1        0.02 ± 99%  perf-profile.children.cycles-pp.do_open
      0.20 ±  8%      -0.1        0.08 ± 16%  perf-profile.children.cycles-pp.mas_rebalance
      0.17 ± 13%      -0.1        0.05 ± 45%  perf-profile.children.cycles-pp.__memcg_kmem_charge_page
      0.33 ±  6%      -0.1        0.21 ± 10%  perf-profile.children.cycles-pp.select_idle_sibling
      0.14 ± 11%      -0.1        0.03 ±100%  perf-profile.children.cycles-pp.get_user_pages_fast
      0.18 ±  7%      -0.1        0.07 ± 14%  perf-profile.children.cycles-pp.mas_alloc_nodes
      0.14 ± 11%      -0.1        0.03 ±101%  perf-profile.children.cycles-pp.set_task_cpu
      0.14 ± 12%      -0.1        0.03 ±101%  perf-profile.children.cycles-pp.vm_unmapped_area
      0.38 ±  6%      -0.1        0.27 ±  7%  perf-profile.children.cycles-pp.native_sched_clock
      0.16 ± 10%      -0.1        0.05 ± 47%  perf-profile.children.cycles-pp.arch_get_unmapped_area_topdown
      0.36 ±  9%      -0.1        0.25 ± 12%  perf-profile.children.cycles-pp.mmap_region
      0.23 ±  7%      -0.1        0.12 ±  9%  perf-profile.children.cycles-pp.available_idle_cpu
      0.13 ± 11%      -0.1        0.02 ± 99%  perf-profile.children.cycles-pp.internal_get_user_pages_fast
      0.16 ± 10%      -0.1        0.06 ± 18%  perf-profile.children.cycles-pp.get_unmapped_area
      0.50 ±  7%      -0.1        0.40 ±  6%  perf-profile.children.cycles-pp.menu_select
      0.24 ±  9%      -0.1        0.14 ± 13%  perf-profile.children.cycles-pp.rmqueue
      0.17 ± 14%      -0.1        0.07 ± 26%  perf-profile.children.cycles-pp.perf_event_comm
      0.17 ± 15%      -0.1        0.07 ± 23%  perf-profile.children.cycles-pp.perf_event_comm_event
      0.17 ± 11%      -0.1        0.07 ± 14%  perf-profile.children.cycles-pp.pick_next_entity
      0.13 ± 14%      -0.1        0.03 ±102%  perf-profile.children.cycles-pp.perf_output_begin
      0.23 ±  6%      -0.1        0.13 ± 21%  perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
      0.14 ± 18%      -0.1        0.04 ± 72%  perf-profile.children.cycles-pp.perf_event_comm_output
      0.21 ±  9%      -0.1        0.12 ±  9%  perf-profile.children.cycles-pp.update_rq_clock
      0.16 ±  8%      -0.1        0.06 ± 19%  perf-profile.children.cycles-pp.mas_split
      0.13 ± 14%      -0.1        0.04 ± 71%  perf-profile.children.cycles-pp.raw_spin_rq_lock_nested
      0.13 ±  6%      -0.1        0.04 ± 71%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.13 ±  7%      -0.1        0.04 ± 72%  perf-profile.children.cycles-pp.mas_topiary_replace
      0.14 ±  8%      -0.1        0.06 ±  9%  perf-profile.children.cycles-pp.mas_preallocate
      0.16 ± 11%      -0.1        0.07 ± 18%  perf-profile.children.cycles-pp.__pick_eevdf
      0.11 ± 14%      -0.1        0.02 ± 99%  perf-profile.children.cycles-pp.mas_empty_area_rev
      0.25 ±  7%      -0.1        0.17 ± 10%  perf-profile.children.cycles-pp.select_idle_cpu
      0.14 ± 12%      -0.1        0.06 ± 14%  perf-profile.children.cycles-pp.cpu_stopper_thread
      0.14 ± 10%      -0.1        0.06 ± 13%  perf-profile.children.cycles-pp.active_load_balance_cpu_stop
      0.14 ± 14%      -0.1        0.06 ± 11%  perf-profile.children.cycles-pp.os_xsave
      0.18 ±  6%      -0.1        0.11 ± 14%  perf-profile.children.cycles-pp.idle_cpu
      0.17 ±  4%      -0.1        0.10 ± 15%  perf-profile.children.cycles-pp.hrtimer_start_range_ns
      0.11 ± 14%      -0.1        0.03 ±100%  perf-profile.children.cycles-pp.__pthread_mutex_lock
      0.32 ±  5%      -0.1        0.25 ±  5%  perf-profile.children.cycles-pp.sched_clock
      0.11 ±  6%      -0.1        0.03 ± 70%  perf-profile.children.cycles-pp.wakeup_preempt
      0.23 ±  7%      -0.1        0.16 ± 13%  perf-profile.children.cycles-pp.update_rq_clock_task
      0.13 ±  8%      -0.1        0.06 ± 16%  perf-profile.children.cycles-pp.local_clock_noinstr
      0.11 ± 10%      -0.1        0.04 ± 71%  perf-profile.children.cycles-pp.kmem_cache_alloc_bulk
      0.34 ±  4%      -0.1        0.27 ±  6%  perf-profile.children.cycles-pp.sched_clock_cpu
      0.11 ±  9%      -0.1        0.04 ± 76%  perf-profile.children.cycles-pp.avg_vruntime
      0.15 ±  8%      -0.1        0.08 ± 14%  perf-profile.children.cycles-pp.update_cfs_group
      0.10 ±  8%      -0.1        0.04 ± 71%  perf-profile.children.cycles-pp.__kmem_cache_alloc_bulk
      0.13 ±  8%      -0.1        0.06 ± 11%  perf-profile.children.cycles-pp.sched_use_asym_prio
      0.09 ± 12%      -0.1        0.02 ± 99%  perf-profile.children.cycles-pp.getname_flags
      0.18 ±  9%      -0.1        0.12 ± 12%  perf-profile.children.cycles-pp.__update_load_avg_se
      0.11 ±  8%      -0.1        0.05 ± 46%  perf-profile.children.cycles-pp.place_entity
      0.08 ± 12%      -0.0        0.02 ± 99%  perf-profile.children.cycles-pp.folio_add_lru_vma
      0.10 ±  7%      -0.0        0.05 ± 46%  perf-profile.children.cycles-pp._find_next_and_bit
      0.10 ±  6%      -0.0        0.06 ± 24%  perf-profile.children.cycles-pp.reweight_entity
      0.03 ± 70%      +0.0        0.08 ± 14%  perf-profile.children.cycles-pp.perf_rotate_context
      0.19 ± 10%      +0.1        0.25 ±  7%  perf-profile.children.cycles-pp.irqtime_account_irq
      0.08 ± 11%      +0.1        0.14 ± 21%  perf-profile.children.cycles-pp.perf_mux_hrtimer_handler
      0.00            +0.1        0.06 ± 14%  perf-profile.children.cycles-pp.rcu_pending
      0.10 ± 17%      +0.1        0.16 ± 13%  perf-profile.children.cycles-pp.rebalance_domains
      0.14 ± 16%      +0.1        0.21 ± 12%  perf-profile.children.cycles-pp.downgrade_write
      0.14 ± 14%      +0.1        0.21 ± 10%  perf-profile.children.cycles-pp.down_read_killable
      0.00            +0.1        0.07 ± 11%  perf-profile.children.cycles-pp.free_tail_page_prepare
      0.02 ±141%      +0.1        0.09 ± 20%  perf-profile.children.cycles-pp.rcu_sched_clock_irq
      0.01 ±223%      +0.1        0.08 ± 25%  perf-profile.children.cycles-pp.arch_scale_freq_tick
      0.55 ±  9%      +0.1        0.62 ±  9%  perf-profile.children.cycles-pp.__alloc_pages
      0.34 ±  5%      +0.1        0.41 ±  9%  perf-profile.children.cycles-pp.clock_nanosleep
      0.00            +0.1        0.08 ± 23%  perf-profile.children.cycles-pp.tick_nohz_next_event
      0.70 ±  2%      +0.1        0.78 ±  5%  perf-profile.children.cycles-pp.flush_tlb_func
      0.14 ± 10%      +0.1        0.23 ± 13%  perf-profile.children.cycles-pp.__intel_pmu_enable_all
      0.07 ± 19%      +0.1        0.17 ± 17%  perf-profile.children.cycles-pp.cgroup_rstat_updated
      0.04 ± 71%      +0.1        0.14 ± 11%  perf-profile.children.cycles-pp.tick_nohz_get_sleep_length
      0.25 ±  9%      +0.1        0.38 ± 11%  perf-profile.children.cycles-pp.down_read
      0.43 ±  9%      +0.1        0.56 ± 10%  perf-profile.children.cycles-pp.get_page_from_freelist
      0.00            +0.1        0.15 ±  6%  perf-profile.children.cycles-pp.vm_normal_page
      0.31 ±  7%      +0.2        0.46 ±  9%  perf-profile.children.cycles-pp.native_flush_tlb_local
      0.00            +0.2        0.16 ±  8%  perf-profile.children.cycles-pp.__tlb_remove_page_size
      0.28 ± 11%      +0.2        0.46 ± 13%  perf-profile.children.cycles-pp.vma_alloc_folio
      0.00            +0.2        0.24 ±  5%  perf-profile.children.cycles-pp._compound_head
      0.07 ± 16%      +0.2        0.31 ±  6%  perf-profile.children.cycles-pp.__mod_node_page_state
      0.38 ±  5%      +0.2        0.62 ±  7%  perf-profile.children.cycles-pp.perf_adjust_freq_unthr_context
      0.22 ± 12%      +0.2        0.47 ± 10%  perf-profile.children.cycles-pp.schedule_preempt_disabled
      0.38 ±  5%      +0.3        0.64 ±  7%  perf-profile.children.cycles-pp.perf_event_task_tick
      0.00            +0.3        0.27 ±  5%  perf-profile.children.cycles-pp.free_swap_cache
      0.30 ± 10%      +0.3        0.58 ± 10%  perf-profile.children.cycles-pp.rwsem_down_read_slowpath
      0.00            +0.3        0.30 ±  4%  perf-profile.children.cycles-pp.free_pages_and_swap_cache
      0.09 ± 10%      +0.3        0.42 ±  7%  perf-profile.children.cycles-pp.__mod_lruvec_state
      0.00            +0.3        0.34 ±  9%  perf-profile.children.cycles-pp.deferred_split_folio
      0.00            +0.4        0.36 ± 13%  perf-profile.children.cycles-pp.prep_compound_page
      0.09 ± 10%      +0.4        0.50 ±  9%  perf-profile.children.cycles-pp.free_unref_page_prepare
      0.00            +0.4        0.42 ± 11%  perf-profile.children.cycles-pp.do_huge_pmd_anonymous_page
      1.67 ±  3%      +0.4        2.12 ±  8%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.63 ±  3%      +0.5        1.11 ± 12%  perf-profile.children.cycles-pp.scheduler_tick
      1.93 ±  3%      +0.5        2.46 ±  8%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      1.92 ±  3%      +0.5        2.45 ±  8%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.73 ±  3%      +0.6        1.31 ± 11%  perf-profile.children.cycles-pp.update_process_times
      0.74 ±  3%      +0.6        1.34 ± 11%  perf-profile.children.cycles-pp.tick_sched_handle
      0.20 ±  8%      +0.6        0.83 ± 18%  perf-profile.children.cycles-pp.__cond_resched
      0.78 ±  4%      +0.6        1.43 ± 12%  perf-profile.children.cycles-pp.tick_nohz_highres_handler
      0.12 ±  7%      +0.7        0.81 ±  5%  perf-profile.children.cycles-pp.__mod_memcg_lruvec_state
      0.28 ±  7%      +0.9        1.23 ±  4%  perf-profile.children.cycles-pp.release_pages
      0.00            +1.0        1.01 ±  6%  perf-profile.children.cycles-pp.pmdp_invalidate
      0.35 ±  6%      +1.2        1.56 ±  5%  perf-profile.children.cycles-pp.__mod_lruvec_page_state
      0.30 ±  8%      +1.2        1.53 ±  4%  perf-profile.children.cycles-pp.tlb_batch_pages_flush
      0.00            +1.3        1.26 ±  4%  perf-profile.children.cycles-pp.page_add_anon_rmap
      0.09 ± 11%      +3.1        3.20 ±  5%  perf-profile.children.cycles-pp.page_remove_rmap
      1.60 ±  2%      +3.4        5.04 ±  4%  perf-profile.children.cycles-pp.zap_pte_range
      0.03 ±100%      +3.5        3.55 ±  5%  perf-profile.children.cycles-pp.__split_huge_pmd_locked
     41.36           +11.6       52.92 ±  2%  perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     41.22           +11.7       52.88 ±  2%  perf-profile.children.cycles-pp.do_syscall_64
      6.42 ±  6%     +13.5       19.88 ±  7%  perf-profile.children.cycles-pp.__clone
      0.82 ±  6%     +16.2       16.98 ±  7%  perf-profile.children.cycles-pp.clear_page_erms
      2.62 ±  5%     +16.4       19.04 ±  7%  perf-profile.children.cycles-pp.asm_exc_page_fault
      2.18 ±  5%     +16.8       18.94 ±  7%  perf-profile.children.cycles-pp.exc_page_fault
      2.06 ±  6%     +16.8       18.90 ±  7%  perf-profile.children.cycles-pp.do_user_addr_fault
      1.60 ±  8%     +17.0       18.60 ±  7%  perf-profile.children.cycles-pp.handle_mm_fault
      1.52 ±  7%     +17.1       18.58 ±  7%  perf-profile.children.cycles-pp.__handle_mm_fault
      0.30 ±  7%     +17.4       17.72 ±  7%  perf-profile.children.cycles-pp.clear_huge_page
      0.31 ±  8%     +17.6       17.90 ±  7%  perf-profile.children.cycles-pp.__do_huge_pmd_anonymous_page
     11.66 ±  3%     +22.2       33.89 ±  2%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      3.29 ±  3%     +30.2       33.46        perf-profile.children.cycles-pp._raw_spin_lock
      0.04 ± 71%     +36.2       36.21 ±  2%  perf-profile.children.cycles-pp.__split_huge_pmd
      8.00 ±  4%     +36.5       44.54 ±  2%  perf-profile.children.cycles-pp.__madvise
      7.87 ±  4%     +36.6       44.44 ±  2%  perf-profile.children.cycles-pp.__x64_sys_madvise
      7.86 ±  4%     +36.6       44.44 ±  2%  perf-profile.children.cycles-pp.do_madvise
      7.32 ±  4%     +36.8       44.07 ±  2%  perf-profile.children.cycles-pp.madvise_vma_behavior
      7.26 ±  4%     +36.8       44.06 ±  2%  perf-profile.children.cycles-pp.zap_page_range_single
      1.78           +39.5       41.30 ±  2%  perf-profile.children.cycles-pp.unmap_page_range
      1.72           +39.6       41.28 ±  2%  perf-profile.children.cycles-pp.zap_pmd_range
     24.76 ±  2%      -8.5       16.31 ±  2%  perf-profile.self.cycles-pp.intel_idle
     11.46 ±  2%      -7.8        3.65 ±  5%  perf-profile.self.cycles-pp.intel_idle_irq
      3.16 ±  7%      -2.1        1.04 ±  6%  perf-profile.self.cycles-pp.smp_call_function_many_cond
      1.49 ±  4%      -1.2        0.30 ± 12%  perf-profile.self.cycles-pp.poll_idle
      1.15 ±  3%      -0.6        0.50 ±  9%  perf-profile.self.cycles-pp._raw_spin_lock
      0.60 ±  6%      -0.6        0.03 ±100%  perf-profile.self.cycles-pp.queued_write_lock_slowpath
      0.69 ±  4%      -0.5        0.22 ± 20%  perf-profile.self.cycles-pp.memcpy_orig
      0.66 ±  7%      -0.5        0.18 ± 11%  perf-profile.self.cycles-pp.update_sg_wakeup_stats
      0.59 ±  4%      -0.5        0.13 ±  8%  perf-profile.self.cycles-pp._raw_spin_lock_irq
      0.86 ±  3%      -0.4        0.43 ± 12%  perf-profile.self.cycles-pp.update_sg_lb_stats
      0.56            -0.4        0.16 ±  7%  perf-profile.self.cycles-pp.restore_fpregs_from_fpstate
      0.48 ±  3%      -0.4        0.12 ± 10%  perf-profile.self.cycles-pp.__slab_free
      1.18 ±  2%      -0.4        0.82 ±  3%  perf-profile.self.cycles-pp.llist_add_batch
      0.54 ±  5%      -0.3        0.19 ±  6%  perf-profile.self.cycles-pp.__schedule
      0.47 ±  7%      -0.3        0.18 ± 13%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.34 ±  5%      -0.2        0.09 ± 18%  perf-profile.self.cycles-pp.kmem_cache_free
      0.43 ±  4%      -0.2        0.18 ± 11%  perf-profile.self.cycles-pp.update_load_avg
      0.35 ±  4%      -0.2        0.10 ± 23%  perf-profile.self.cycles-pp.rcu_cblist_dequeue
      0.38 ±  9%      -0.2        0.15 ± 10%  perf-profile.self.cycles-pp.__switch_to_asm
      0.33 ±  5%      -0.2        0.10 ± 16%  perf-profile.self.cycles-pp.__task_pid_nr_ns
      0.36 ±  6%      -0.2        0.13 ± 14%  perf-profile.self.cycles-pp.switch_mm_irqs_off
      0.31 ±  6%      -0.2        0.09 ±  6%  perf-profile.self.cycles-pp.__free_one_page
      0.28 ±  5%      -0.2        0.06 ± 50%  perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.27 ± 13%      -0.2        0.06 ± 23%  perf-profile.self.cycles-pp.pthread_create@@GLIBC_2.2.5
      0.30 ±  7%      -0.2        0.10 ± 19%  perf-profile.self.cycles-pp.__switch_to
      0.27 ±  4%      -0.2        0.10 ± 17%  perf-profile.self.cycles-pp.finish_task_switch
      0.23 ±  7%      -0.2        0.06 ± 50%  perf-profile.self.cycles-pp.mas_walk
      0.22 ±  9%      -0.2        0.05 ± 48%  perf-profile.self.cycles-pp.__clone
      0.63 ±  5%      -0.2        0.46 ± 12%  perf-profile.self.cycles-pp.llist_reverse_order
      0.20 ±  4%      -0.2        0.04 ± 72%  perf-profile.self.cycles-pp.entry_SYSCALL_64
      0.24 ± 10%      -0.1        0.09 ± 19%  perf-profile.self.cycles-pp.rmqueue_bulk
      0.18 ± 13%      -0.1        0.03 ±101%  perf-profile.self.cycles-pp.__radix_tree_lookup
      0.18 ± 11%      -0.1        0.04 ± 71%  perf-profile.self.cycles-pp.stress_pthread_func
      0.36 ±  8%      -0.1        0.22 ± 11%  perf-profile.self.cycles-pp.menu_select
      0.22 ±  4%      -0.1        0.08 ± 19%  perf-profile.self.cycles-pp.___perf_sw_event
      0.20 ± 13%      -0.1        0.07 ± 20%  perf-profile.self.cycles-pp.start_thread
      0.16 ± 13%      -0.1        0.03 ±101%  perf-profile.self.cycles-pp.alloc_vmap_area
      0.17 ± 10%      -0.1        0.04 ± 73%  perf-profile.self.cycles-pp.kmem_cache_alloc
      0.14 ±  9%      -0.1        0.03 ±100%  perf-profile.self.cycles-pp.futex_wake
      0.17 ±  4%      -0.1        0.06 ± 11%  perf-profile.self.cycles-pp.dequeue_task_fair
      0.23 ±  6%      -0.1        0.12 ± 11%  perf-profile.self.cycles-pp.available_idle_cpu
      0.22 ± 13%      -0.1        0.11 ± 12%  perf-profile.self.cycles-pp._find_next_bit
      0.21 ±  7%      -0.1        0.10 ±  6%  perf-profile.self.cycles-pp.__rmqueue_pcplist
      0.37 ±  7%      -0.1        0.26 ±  8%  perf-profile.self.cycles-pp.native_sched_clock
      0.22 ±  7%      -0.1        0.12 ± 21%  perf-profile.self.cycles-pp.__update_load_avg_cfs_rq
      0.19 ±  7%      -0.1        0.10 ± 11%  perf-profile.self.cycles-pp.enqueue_entity
      0.15 ±  5%      -0.1        0.06 ± 45%  perf-profile.self.cycles-pp.enqueue_task_fair
      0.15 ± 11%      -0.1        0.06 ± 17%  perf-profile.self.cycles-pp.__pick_eevdf
      0.13 ± 13%      -0.1        0.05 ± 72%  perf-profile.self.cycles-pp.prepare_task_switch
      0.17 ± 10%      -0.1        0.08 ±  8%  perf-profile.self.cycles-pp.update_rq_clock_task
      0.54 ±  4%      -0.1        0.46 ±  6%  perf-profile.self.cycles-pp.__flush_smp_call_function_queue
      0.14 ± 14%      -0.1        0.06 ± 11%  perf-profile.self.cycles-pp.os_xsave
      0.11 ± 10%      -0.1        0.03 ± 70%  perf-profile.self.cycles-pp.try_to_wake_up
      0.10 ±  8%      -0.1        0.03 ±100%  perf-profile.self.cycles-pp.futex_wait
      0.14 ±  9%      -0.1        0.07 ± 10%  perf-profile.self.cycles-pp.update_curr
      0.18 ±  9%      -0.1        0.11 ± 14%  perf-profile.self.cycles-pp.idle_cpu
      0.11 ± 11%      -0.1        0.04 ± 76%  perf-profile.self.cycles-pp.avg_vruntime
      0.15 ± 10%      -0.1        0.08 ± 14%  perf-profile.self.cycles-pp.update_cfs_group
      0.09 ±  9%      -0.1        0.03 ±100%  perf-profile.self.cycles-pp.reweight_entity
      0.12 ± 13%      -0.1        0.06 ±  8%  perf-profile.self.cycles-pp.do_idle
      0.18 ± 10%      -0.1        0.12 ± 13%  perf-profile.self.cycles-pp.__update_load_avg_se
      0.09 ± 17%      -0.1        0.04 ± 71%  perf-profile.self.cycles-pp.cpuidle_idle_call
      0.10 ± 11%      -0.0        0.06 ± 45%  perf-profile.self.cycles-pp.update_rq_clock
      0.12 ± 15%      -0.0        0.07 ± 16%  perf-profile.self.cycles-pp.update_sd_lb_stats
      0.09 ±  5%      -0.0        0.05 ± 46%  perf-profile.self.cycles-pp._find_next_and_bit
      0.01 ±223%      +0.1        0.08 ± 25%  perf-profile.self.cycles-pp.arch_scale_freq_tick
      0.78 ±  4%      +0.1        0.87 ±  4%  perf-profile.self.cycles-pp.default_send_IPI_mask_sequence_phys
      0.14 ± 10%      +0.1        0.23 ± 13%  perf-profile.self.cycles-pp.__intel_pmu_enable_all
      0.06 ± 46%      +0.1        0.15 ± 19%  perf-profile.self.cycles-pp.cgroup_rstat_updated
      0.19 ±  3%      +0.1        0.29 ±  4%  perf-profile.self.cycles-pp.cpuidle_enter_state
      0.00            +0.1        0.10 ± 11%  perf-profile.self.cycles-pp.__mod_lruvec_state
      0.00            +0.1        0.11 ± 18%  perf-profile.self.cycles-pp.__tlb_remove_page_size
      0.00            +0.1        0.12 ±  9%  perf-profile.self.cycles-pp.vm_normal_page
      0.23 ±  7%      +0.1        0.36 ±  8%  perf-profile.self.cycles-pp.perf_adjust_freq_unthr_context
      0.20 ±  8%      +0.2        0.35 ±  7%  perf-profile.self.cycles-pp.__mod_lruvec_page_state
      1.12 ±  2%      +0.2        1.28 ±  4%  perf-profile.self.cycles-pp.zap_pte_range
      0.31 ±  8%      +0.2        0.46 ±  9%  perf-profile.self.cycles-pp.native_flush_tlb_local
      0.00            +0.2        0.16 ±  5%  perf-profile.self.cycles-pp._compound_head
      0.06 ± 17%      +0.2        0.26 ±  4%  perf-profile.self.cycles-pp.__mod_node_page_state
      0.00            +0.2        0.24 ±  6%  perf-profile.self.cycles-pp.free_swap_cache
      0.00            +0.3        0.27 ± 15%  perf-profile.self.cycles-pp.clear_huge_page
      0.00            +0.3        0.27 ± 11%  perf-profile.self.cycles-pp.deferred_split_folio
      0.00            +0.4        0.36 ± 13%  perf-profile.self.cycles-pp.prep_compound_page
      0.05 ± 47%      +0.4        0.43 ±  9%  perf-profile.self.cycles-pp.free_unref_page_prepare
      0.08 ±  7%      +0.5        0.57 ± 23%  perf-profile.self.cycles-pp.__cond_resched
      0.08 ± 12%      +0.5        0.58 ±  5%  perf-profile.self.cycles-pp.release_pages
      0.10 ± 10%      +0.5        0.63 ±  6%  perf-profile.self.cycles-pp.__mod_memcg_lruvec_state
      0.00            +1.1        1.11 ±  7%  perf-profile.self.cycles-pp.__split_huge_pmd_locked
      0.00            +1.2        1.18 ±  4%  perf-profile.self.cycles-pp.page_add_anon_rmap
      0.03 ±101%      +1.3        1.35 ±  7%  perf-profile.self.cycles-pp.page_remove_rmap
      0.82 ±  5%     +16.1       16.88 ±  7%  perf-profile.self.cycles-pp.clear_page_erms
     11.65 ±  3%     +20.2       31.88 ±  2%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath


***************************************************************************************************
lkp-spr-2sp4: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 512G memory
=========================================================================================
array_size/compiler/cpufreq_governor/iterations/kconfig/loop/nr_threads/omp/rootfs/tbox_group/testcase:
  50000000/gcc-12/performance/10x/x86_64-rhel-8.3/100/25%/true/debian-11.1-x86_64-20220510.cgz/lkp-spr-2sp4/stream

commit: 
  30749e6fbb ("mm/memory: replace kmap() with kmap_local_page()")
  1111d46b5c ("mm: align larger anonymous mappings on THP boundaries")

30749e6fbb3d391a 1111d46b5cbad57486e7a3fab75 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     10.50 ± 14%     +55.6%      16.33 ± 16%  perf-c2c.DRAM.local
      6724           -11.4%       5954 ±  2%  vmstat.system.cs
 2.746e+09           +16.7%  3.205e+09 ±  2%  cpuidle..time
   2771516           +16.0%    3213723 ±  2%  cpuidle..usage
      0.06 ±  4%      -0.0        0.05 ±  5%  mpstat.cpu.all.soft%
      0.47 ±  2%      -0.1        0.39 ±  2%  mpstat.cpu.all.sys%
      0.01 ± 85%   +1700.0%       0.20 ±188%  perf-sched.sch_delay.avg.ms.syslog_print.do_syslog.kmsg_read.vfs_read
     15.11 ± 13%     -28.8%      10.76 ± 34%  perf-sched.wait_and_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     15.09 ± 13%     -30.3%      10.51 ± 38%  perf-sched.wait_time.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
   1023952           +13.4%    1161219        meminfo.AnonHugePages
   1319741           +10.8%    1461995        meminfo.AnonPages
   1331039           +11.2%    1480149        meminfo.Inactive
   1330865           +11.2%    1479975        meminfo.Inactive(anon)
   1266202           +16.0%    1469399 ±  2%  turbostat.C1E
   1509871           +16.6%    1760853 ±  2%  turbostat.C6
   3521203           +17.4%    4134075 ±  3%  turbostat.IRQ
    580.32            -3.8%     558.30        turbostat.PkgWatt
     77.42           -14.0%      66.60 ±  2%  turbostat.RAMWatt
    330416           +10.8%     366020        proc-vmstat.nr_anon_pages
    500.90           +13.4%     567.99        proc-vmstat.nr_anon_transparent_hugepages
    333197           +11.2%     370536        proc-vmstat.nr_inactive_anon
    333197           +11.2%     370536        proc-vmstat.nr_zone_inactive_anon
    129879 ± 11%     -46.7%      69207 ± 12%  proc-vmstat.numa_pages_migrated
   3879028            +5.9%    4109180        proc-vmstat.pgalloc_normal
   3403414            +6.6%    3628929        proc-vmstat.pgfree
    129879 ± 11%     -46.7%      69207 ± 12%  proc-vmstat.pgmigrate_success
      5763            +9.8%       6327        proc-vmstat.thp_fault_alloc
    350993           -15.6%     296081 ±  2%  stream.add_bandwidth_MBps
    349830           -16.1%     293492 ±  2%  stream.add_bandwidth_MBps_harmonicMean
    333973           -20.5%     265439 ±  3%  stream.copy_bandwidth_MBps
    332930           -21.7%     260548 ±  3%  stream.copy_bandwidth_MBps_harmonicMean
    302788           -16.2%     253817 ±  2%  stream.scale_bandwidth_MBps
    302157           -17.1%     250577 ±  2%  stream.scale_bandwidth_MBps_harmonicMean
   1177276            +9.3%    1286614        stream.time.maximum_resident_set_size
      5038            +1.1%       5095        stream.time.percent_of_cpu_this_job_got
    694.19 ±  2%     +19.5%     829.85 ±  2%  stream.time.user_time
    339047           -12.1%     298061        stream.triad_bandwidth_MBps
    338186           -12.4%     296218        stream.triad_bandwidth_MBps_harmonicMean
      8.42 ±100%      -8.4        0.00        perf-profile.calltrace.cycles-pp.asm_sysvec_reschedule_ipi
      8.42 ±100%      -8.4        0.00        perf-profile.calltrace.cycles-pp.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      8.42 ±100%      -8.4        0.00        perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      8.42 ±100%      -8.4        0.00        perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      8.42 ±100%      -8.4        0.00        perf-profile.calltrace.cycles-pp.arch_do_signal_or_restart.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      8.42 ±100%      -8.4        0.00        perf-profile.calltrace.cycles-pp.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode
      0.84 ±103%      +1.7        2.57 ± 59%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      0.84 ±103%      +1.7        2.57 ± 59%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      0.31 ±223%      +2.0        2.33 ± 44%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
      0.31 ±223%      +2.0        2.33 ± 44%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
      3.07 ± 56%      +2.8        5.88 ± 28%  perf-profile.calltrace.cycles-pp.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64.entry_SYSCALL_64_after_hwframe
      8.42 ±100%      -8.4        0.00        perf-profile.children.cycles-pp.asm_sysvec_reschedule_ipi
      8.42 ±100%      -8.1        0.36 ±223%  perf-profile.children.cycles-pp.irqentry_exit_to_user_mode
     12.32 ± 25%      -6.6        5.69 ± 69%  perf-profile.children.cycles-pp.vsnprintf
     12.76 ± 27%      -6.6        6.19 ± 67%  perf-profile.children.cycles-pp.seq_printf
      3.07 ± 56%      +2.8        5.88 ± 28%  perf-profile.children.cycles-pp.__x64_sys_exit_group
     40.11           -11.0%      35.71 ±  2%  perf-stat.i.MPKI
 1.563e+10           -12.3%  1.371e+10 ±  2%  perf-stat.i.branch-instructions
 3.721e+09 ±  2%     -23.2%  2.858e+09 ±  4%  perf-stat.i.cache-misses
 4.471e+09 ±  3%     -22.7%  3.458e+09 ±  4%  perf-stat.i.cache-references
      5970 ±  5%     -15.9%       5021 ±  4%  perf-stat.i.context-switches
      1.66 ±  2%     +15.8%       1.92 ±  2%  perf-stat.i.cpi
     41.83 ±  4%     +30.6%      54.63 ±  4%  perf-stat.i.cycles-between-cache-misses
 2.282e+10 ±  2%     -14.5%  1.952e+10 ±  2%  perf-stat.i.dTLB-loads
    572602 ±  3%      -9.2%     519922 ±  5%  perf-stat.i.dTLB-store-misses
 1.483e+10 ±  2%     -15.7%   1.25e+10 ±  2%  perf-stat.i.dTLB-stores
 9.179e+10           -13.7%  7.924e+10 ±  2%  perf-stat.i.instructions
      0.61           -13.4%       0.52 ±  2%  perf-stat.i.ipc
    373.79 ±  4%     -37.8%     232.60 ±  9%  perf-stat.i.metric.K/sec
    251.45           -13.4%     217.72 ±  2%  perf-stat.i.metric.M/sec
     21446 ±  3%     -24.1%      16278 ±  8%  perf-stat.i.minor-faults
     15.07 ±  5%      -6.0        9.10 ± 10%  perf-stat.i.node-load-miss-rate%
  68275790 ±  5%     -44.9%   37626128 ± 12%  perf-stat.i.node-load-misses
     21448 ±  3%     -24.1%      16281 ±  8%  perf-stat.i.page-faults
     40.71           -11.3%      36.10 ±  2%  perf-stat.overall.MPKI
      1.67           +15.3%       1.93 ±  2%  perf-stat.overall.cpi
     41.07 ±  3%     +30.1%      53.42 ±  4%  perf-stat.overall.cycles-between-cache-misses
      0.00 ±  2%      +0.0        0.00 ±  2%  perf-stat.overall.dTLB-store-miss-rate%
      0.60           -13.2%       0.52 ±  2%  perf-stat.overall.ipc
     15.19 ±  5%      -6.2        9.03 ± 11%  perf-stat.overall.node-load-miss-rate%
   1.4e+10            -9.3%  1.269e+10        perf-stat.ps.branch-instructions
 3.352e+09 ±  3%     -20.9%  2.652e+09 ±  4%  perf-stat.ps.cache-misses
 4.026e+09 ±  3%     -20.3%  3.208e+09 ±  4%  perf-stat.ps.cache-references
      4888 ±  4%     -10.8%       4362 ±  3%  perf-stat.ps.context-switches
    206092            +2.1%     210375        perf-stat.ps.cpu-clock
 1.375e+11            +2.8%  1.414e+11        perf-stat.ps.cpu-cycles
    258.23 ±  5%      +8.8%     280.85 ±  4%  perf-stat.ps.cpu-migrations
 2.048e+10           -11.7%  1.809e+10 ±  2%  perf-stat.ps.dTLB-loads
 1.333e+10 ±  2%     -13.0%   1.16e+10 ±  2%  perf-stat.ps.dTLB-stores
 8.231e+10           -10.8%  7.342e+10        perf-stat.ps.instructions
     15755 ±  3%     -16.3%      13187 ±  6%  perf-stat.ps.minor-faults
  61706790 ±  6%     -43.8%   34699716 ± 11%  perf-stat.ps.node-load-misses
     15757 ±  3%     -16.3%      13189 ±  6%  perf-stat.ps.page-faults
    206092            +2.1%     210375        perf-stat.ps.task-clock
 1.217e+12            +4.1%  1.267e+12 ±  2%  perf-stat.total.instructions



***************************************************************************************************
lkp-cfl-d1: 12 threads 1 sockets Intel(R) Core(TM) i7-8700 CPU @ 3.20GHz (Coffee Lake) with 16G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/option_a/option_b/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-8.3/Average/Integer/debian-x86_64-phoronix/lkp-cfl-d1/ramspeed-1.4.3/phoronix-test-suite

commit: 
  30749e6fbb ("mm/memory: replace kmap() with kmap_local_page()")
  1111d46b5c ("mm: align larger anonymous mappings on THP boundaries")

30749e6fbb3d391a 1111d46b5cbad57486e7a3fab75 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    232.12 ±  7%     -12.0%     204.18 ±  8%  sched_debug.cfs_rq:/.load_avg.stddev
      6797            -3.3%       6576        vmstat.system.cs
     15161            -0.9%      15029        vmstat.system.in
    349927           +44.3%     504820        meminfo.AnonHugePages
    507807           +27.1%     645169        meminfo.AnonPages
   1499332           +10.2%    1652612        meminfo.Inactive(anon)
      8.67 ± 62%    +184.6%      24.67 ± 25%  turbostat.C10
      1.50            -0.1        1.45        turbostat.C1E%
      3.30            -3.2%       3.20        turbostat.RAMWatt
      1.40 ± 14%      -0.3        1.09 ± 13%  perf-profile.calltrace.cycles-pp.asm_exc_page_fault
      1.44 ± 12%      -0.3        1.12 ± 13%  perf-profile.children.cycles-pp.asm_exc_page_fault
      0.03 ±141%      +0.1        0.10 ± 30%  perf-profile.children.cycles-pp.next_uptodate_folio
      0.02 ±141%      +0.1        0.10 ± 22%  perf-profile.children.cycles-pp.rcu_nocb_flush_deferred_wakeup
      0.02 ±143%      +0.1        0.10 ± 25%  perf-profile.self.cycles-pp.next_uptodate_folio
      0.01 ±223%      +0.1        0.09 ± 19%  perf-profile.self.cycles-pp.rcu_nocb_flush_deferred_wakeup
     19806            -3.5%      19109        phoronix-test-suite.ramspeed.Average.Integer.mb_s
    283.70            +3.8%     294.50        phoronix-test-suite.time.elapsed_time
    283.70            +3.8%     294.50        phoronix-test-suite.time.elapsed_time.max
    120454            +1.6%     122334        phoronix-test-suite.time.maximum_resident_set_size
    281337           -54.8%     127194        phoronix-test-suite.time.minor_page_faults
    259.13            +4.1%     269.81        phoronix-test-suite.time.user_time
    126951           +27.0%     161291        proc-vmstat.nr_anon_pages
    170.86           +44.3%     246.49        proc-vmstat.nr_anon_transparent_hugepages
    355917            -1.0%     352250        proc-vmstat.nr_dirty_background_threshold
    712705            -1.0%     705362        proc-vmstat.nr_dirty_threshold
   3265201            -1.1%    3228465        proc-vmstat.nr_free_pages
    374833           +10.2%     413153        proc-vmstat.nr_inactive_anon
      1767            +4.8%       1853        proc-vmstat.nr_page_table_pages
    374833           +10.2%     413153        proc-vmstat.nr_zone_inactive_anon
    854665           -34.3%     561406        proc-vmstat.numa_hit
    854632           -34.3%     561397        proc-vmstat.numa_local
   5548755            +1.1%    5610598        proc-vmstat.pgalloc_normal
   1083315           -26.2%     799129        proc-vmstat.pgfault
    113425            +3.7%     117656        proc-vmstat.pgreuse
      9025            +7.6%       9714        proc-vmstat.thp_fault_alloc
      3.38            +0.1        3.45        perf-stat.i.branch-miss-rate%
 4.135e+08            -3.2%  4.003e+08        perf-stat.i.cache-misses
 5.341e+08            -2.7%  5.197e+08        perf-stat.i.cache-references
      6832            -3.4%       6600        perf-stat.i.context-switches
      4.06            +3.1%       4.19        perf-stat.i.cpi
    438639 ±  5%     -18.7%     356730 ±  6%  perf-stat.i.dTLB-load-misses
 1.119e+09            -3.8%  1.077e+09        perf-stat.i.dTLB-loads
      0.02 ± 15%      -0.0        0.01 ± 26%  perf-stat.i.dTLB-store-miss-rate%
     80407 ± 10%     -63.5%      29387 ± 23%  perf-stat.i.dTLB-store-misses
 7.319e+08            -3.8%  7.043e+08        perf-stat.i.dTLB-stores
     57.72            +0.8       58.52        perf-stat.i.iTLB-load-miss-rate%
    129846            -3.8%     124973        perf-stat.i.iTLB-load-misses
    144448            -5.3%     136837        perf-stat.i.iTLB-loads
 2.389e+09            -3.5%  2.305e+09        perf-stat.i.instructions
      0.28            -2.9%       0.27        perf-stat.i.ipc
    220.59            -3.4%     213.11        perf-stat.i.metric.M/sec
      3610           -31.2%       2483        perf-stat.i.minor-faults
  49238342            +1.1%   49776834        perf-stat.i.node-loads
  98106028            -3.1%   95018390        perf-stat.i.node-stores
      3615           -31.2%       2487        perf-stat.i.page-faults
      3.65            +3.7%       3.78        perf-stat.overall.cpi
     21.08            +3.3%      21.79        perf-stat.overall.cycles-between-cache-misses
      0.04 ±  5%      -0.0        0.03 ±  6%  perf-stat.overall.dTLB-load-miss-rate%
      0.01 ± 10%      -0.0        0.00 ± 23%  perf-stat.overall.dTLB-store-miss-rate%
      0.27            -3.6%       0.26        perf-stat.overall.ipc
 4.122e+08            -3.2%   3.99e+08        perf-stat.ps.cache-misses
 5.324e+08            -2.7%  5.181e+08        perf-stat.ps.cache-references
      6809            -3.4%       6580        perf-stat.ps.context-switches
    437062 ±  5%     -18.7%     355481 ±  6%  perf-stat.ps.dTLB-load-misses
 1.115e+09            -3.8%  1.073e+09        perf-stat.ps.dTLB-loads
     80134 ± 10%     -63.5%      29283 ± 23%  perf-stat.ps.dTLB-store-misses
 7.295e+08            -3.8%  7.021e+08        perf-stat.ps.dTLB-stores
    129362            -3.7%     124535        perf-stat.ps.iTLB-load-misses
    143865            -5.2%     136338        perf-stat.ps.iTLB-loads
 2.381e+09            -3.5%  2.297e+09        perf-stat.ps.instructions
      3596           -31.2%       2473        perf-stat.ps.minor-faults
  49081949            +1.1%   49621463        perf-stat.ps.node-loads
  97795918            -3.1%   94724831        perf-stat.ps.node-stores
      3600           -31.2%       2477        perf-stat.ps.page-faults



***************************************************************************************************
lkp-cfl-d1: 12 threads 1 sockets Intel(R) Core(TM) i7-8700 CPU @ 3.20GHz (Coffee Lake) with 16G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/option_a/option_b/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-8.3/Average/Floating Point/debian-x86_64-phoronix/lkp-cfl-d1/ramspeed-1.4.3/phoronix-test-suite

commit: 
  30749e6fbb ("mm/memory: replace kmap() with kmap_local_page()")
  1111d46b5c ("mm: align larger anonymous mappings on THP boundaries")

30749e6fbb3d391a 1111d46b5cbad57486e7a3fab75 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    167.28 ±  5%     -13.1%     145.32 ±  6%  sched_debug.cfs_rq:/.util_est_enqueued.avg
      6845            -2.5%       6674        vmstat.system.cs
    351910 ±  2%     +40.2%     493341        meminfo.AnonHugePages
    505908           +27.2%     643328        meminfo.AnonPages
   1497656           +10.2%    1650453        meminfo.Inactive(anon)
     18957 ± 13%     +26.3%      23947 ± 17%  turbostat.C1
      1.52            -0.0        1.48        turbostat.C1E%
      3.32            -2.9%       3.23        turbostat.RAMWatt
     19978            -3.0%      19379        phoronix-test-suite.ramspeed.Average.FloatingPoint.mb_s
    280.71            +3.3%     289.93        phoronix-test-suite.time.elapsed_time
    280.71            +3.3%     289.93        phoronix-test-suite.time.elapsed_time.max
    120465            +1.5%     122257        phoronix-test-suite.time.maximum_resident_set_size
    281047           -54.7%     127190        phoronix-test-suite.time.minor_page_faults
    257.03            +3.5%     265.95        phoronix-test-suite.time.user_time
    126473           +27.2%     160831        proc-vmstat.nr_anon_pages
    171.83 ±  2%     +40.2%     240.89        proc-vmstat.nr_anon_transparent_hugepages
    355973            -1.0%     352304        proc-vmstat.nr_dirty_background_threshold
    712818            -1.0%     705471        proc-vmstat.nr_dirty_threshold
   3265800            -1.1%    3228879        proc-vmstat.nr_free_pages
    374410           +10.2%     412613        proc-vmstat.nr_inactive_anon
      1770            +4.4%       1848        proc-vmstat.nr_page_table_pages
    374410           +10.2%     412613        proc-vmstat.nr_zone_inactive_anon
    852082           -34.9%     555093        proc-vmstat.numa_hit
    852125           -34.9%     555018        proc-vmstat.numa_local
   1078293           -26.6%     791038        proc-vmstat.pgfault
    112693            +2.9%     116004        proc-vmstat.pgreuse
      9025            +7.6%       9713        proc-vmstat.thp_fault_alloc
      3.63 ±  6%      +0.6        4.25 ±  9%  perf-profile.calltrace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      0.25 ± 55%      -0.2        0.08 ± 68%  perf-profile.children.cycles-pp.ret_from_fork_asm
      0.25 ± 55%      -0.2        0.08 ± 68%  perf-profile.children.cycles-pp.ret_from_fork
      0.23 ± 56%      -0.2        0.07 ± 69%  perf-profile.children.cycles-pp.kthread
      0.14 ± 36%      -0.1        0.05 ±120%  perf-profile.children.cycles-pp.do_anonymous_page
      0.14 ± 35%      -0.1        0.05 ± 76%  perf-profile.children.cycles-pp.copy_mc_enhanced_fast_string
      0.04 ± 72%      +0.0        0.08 ± 19%  perf-profile.children.cycles-pp.try_to_wake_up
      0.04 ±118%      +0.1        0.10 ± 36%  perf-profile.children.cycles-pp.update_rq_clock
      0.07 ± 79%      +0.1        0.17 ± 21%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      7.99 ± 11%      +1.0        9.02 ±  5%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.23 ± 28%      -0.1        0.14 ± 49%  perf-profile.self.cycles-pp.irqentry_exit_to_user_mode
      0.14 ± 35%      -0.1        0.05 ± 76%  perf-profile.self.cycles-pp.copy_mc_enhanced_fast_string
      0.06 ± 79%      +0.1        0.16 ± 21%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.21 ± 34%      +0.2        0.36 ± 18%  perf-profile.self.cycles-pp.ktime_get
 1.187e+08            -4.6%  1.133e+08        perf-stat.i.branch-instructions
      3.36            +0.1        3.42        perf-stat.i.branch-miss-rate%
   5492420            -3.9%    5275592        perf-stat.i.branch-misses
 4.148e+08            -2.8%  4.034e+08        perf-stat.i.cache-misses
 5.251e+08            -2.6%  5.114e+08        perf-stat.i.cache-references
      6880            -2.5%       6711        perf-stat.i.context-switches
      4.30            +2.9%       4.43        perf-stat.i.cpi
      0.10 ±  7%      -0.0        0.09 ±  2%  perf-stat.i.dTLB-load-miss-rate%
    472268 ±  6%     -19.9%     378489        perf-stat.i.dTLB-load-misses
 8.107e+08            -3.4%  7.831e+08        perf-stat.i.dTLB-loads
      0.02 ± 16%      -0.0        0.01 ±  2%  perf-stat.i.dTLB-store-miss-rate%
     90535 ± 11%     -59.8%      36371 ±  2%  perf-stat.i.dTLB-store-misses
 5.323e+08            -3.3%  5.145e+08        perf-stat.i.dTLB-stores
    129981            -3.0%     126061        perf-stat.i.iTLB-load-misses
    143662            -3.1%     139223        perf-stat.i.iTLB-loads
 2.253e+09            -3.6%  2.172e+09        perf-stat.i.instructions
      0.26            -3.2%       0.25        perf-stat.i.ipc
      4.71 ±  2%      -6.4%       4.41 ±  2%  perf-stat.i.major-faults
    180.03            -3.0%     174.57        perf-stat.i.metric.M/sec
      3627           -30.8%       2510 ±  2%  perf-stat.i.minor-faults
      3632           -30.8%       2514 ±  2%  perf-stat.i.page-faults
      3.88            +3.6%       4.02        perf-stat.overall.cpi
     21.08            +2.7%      21.65        perf-stat.overall.cycles-between-cache-misses
      0.06 ±  6%      -0.0        0.05        perf-stat.overall.dTLB-load-miss-rate%
      0.02 ± 11%      -0.0        0.01 ±  2%  perf-stat.overall.dTLB-store-miss-rate%
      0.26            -3.5%       0.25        perf-stat.overall.ipc
 1.182e+08            -4.6%  1.128e+08        perf-stat.ps.branch-instructions
   5468166            -4.0%    5251939        perf-stat.ps.branch-misses
 4.135e+08            -2.7%  4.021e+08        perf-stat.ps.cache-misses
 5.234e+08            -2.6%  5.098e+08        perf-stat.ps.cache-references
      6859            -2.5%       6685        perf-stat.ps.context-switches
    470567 ±  6%     -19.9%     377127        perf-stat.ps.dTLB-load-misses
 8.079e+08            -3.4%  7.805e+08        perf-stat.ps.dTLB-loads
     90221 ± 11%     -59.8%      36239 ±  2%  perf-stat.ps.dTLB-store-misses
 5.305e+08            -3.3%  5.128e+08        perf-stat.ps.dTLB-stores
    129499            -3.0%     125601        perf-stat.ps.iTLB-load-misses
    143121            -3.1%     138638        perf-stat.ps.iTLB-loads
 2.246e+09            -3.6%  2.165e+09        perf-stat.ps.instructions
      4.69 ±  2%      -6.3%       4.39 ±  2%  perf-stat.ps.major-faults
      3613           -30.8%       2500 ±  2%  perf-stat.ps.minor-faults
      3617           -30.8%       2504 ±  2%  perf-stat.ps.page-faults





Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

