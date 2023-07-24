Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4BBD505
	for <oe-lkp@lists.linux.dev>; Mon, 24 Jul 2023 15:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690211536; x=1721747536;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=BQ8/evnblI9rgBNwgDDhYQ9Pvc5KZzRGtTwgmVybD8g=;
  b=exI7otvS1s8lTN4t8iqvMqIUTaDg+bk2W3x+rgPSdadS9Oe8+Oe7SRti
   zbv4pzhueUYgKhlGHTXmer3ea5H/lDGbP06DAG7DXR1RqzpTM+/2NFmyy
   ikk7AY4ZKr6ra/Ul5RLYdU7z6RHgxnBktLEy7c+Bg9tQ3HUFAJTkr6uke
   Otgksraiz9erpk5wfmaHMhF5ci/LLqC/4tCs2GMAEWvsbA//c3mJFd1rm
   8fFiN6Rmo0cFGJXn5WGCyLFYAl7xpt6VDrgx8l3lAA+YwoDbHf7DUUlAi
   8mIFx7XplJxG3nsgZpjcur3fBxYUjz/J7APWHRfQmk/BqDNckj1X69bm5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="367493407"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="yaml'?scan'208";a="367493407"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 08:12:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="815866899"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="yaml'?scan'208";a="815866899"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Jul 2023 08:12:07 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 08:12:05 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 24 Jul 2023 08:12:05 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 24 Jul 2023 08:12:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FDxwSDgMRTRT75oDYmkikYn3DkKb55kcvy7TPZ45DN7WJqL3BzwXNAT6oiMopN1di2Mo8n9eYN7AVaXEMbMvAh0svtu0CiwxBOzRrU2eEnVdJhAJyrrL3O5zFq1gjtW+gJPsTlw4Up2vn/1YFLdUotVm9AsYMAHqtBapTFjIu3peJiW8kCUjQSEC3mbuJcK9Ecdv1XpcUZ6f/M7Trz32bMokijaYbwXTSskj+pV8Q20tvKJqwCjLqBLx+PABsxmAdH7vGuGiZGc2kAekxwowQ3yyDtNfsS4MxkzJK21Jp1/iuxBGpFTti5U0R61Y/bkZ93RUmHJ/SRb2uoRUw9U9BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fHDbAdnakc0CcHkZWatuDheKSJ/RlIt2cg1xNjrq9jQ=;
 b=RBSh+wOQS9ETQlerSBB2bVT2tNUNNtpr5MOB+QpUwQhgQHDnrP9jBBGj2TPOVl1YAJkgIZWENSkvyNKLozNExtfurqj9tw/fEJ1wVT6fb/udSsZRGWQ/t3oCYliuRSKAOrZl1abigO3eLxujwkt+huDRXwH8AvUdeDIaLNX+cjEyhIlwTqIGAOgNfak7OpwKfRBtOD/cOzN9yzuKOCw9+5ZSfPZ7PYhbAgpx/5UZybygZUDBaiHm8G7Fs/Oxqm2LKSbbbPJBvDu6GwhxWzFi8jXyR/KkuFMpq6gdnMI1J6syMw9vrEupEEJ0mIcaptjvrzCuyu/F0m+p2mC68p9OHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by DM4PR11MB6166.namprd11.prod.outlook.com (2603:10b6:8:ad::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 15:11:51 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::1778:c00c:d5ff:da66]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::1778:c00c:d5ff:da66%6]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 15:11:51 +0000
Date: Mon, 24 Jul 2023 23:11:40 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <ying.huang@intel.com>,
	<feng.tang@intel.com>, <fengwei.yin@intel.com>, <aubrey.li@linux.intel.com>,
	<yu.c.chen@intel.com>, <oliver.sang@intel.com>
Subject: [tip:sched/eevdf] [sched/fair]  86bfbb7ce4:  netperf.Throughput_Mbps
 -54.9% regression
Message-ID: <202307241121.c02ef0d4-oliver.sang@intel.com>
Content-Type: multipart/mixed; boundary="rPIyn3lZ0OrwwLB2"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2P153CA0003.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::20) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|DM4PR11MB6166:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b78e88c-1864-4cbf-e92e-08db8c584e34
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: suI2GZp67lf4iycwTzYkVg7N+3hMFPHFjxSDogLB5eum8O6/XV4nBRY7kKPjNYpAhHmHolqMT/9FMc5phrjl+uVb9RwfYj6pU072WmfJd+lmnSiKdWVWjzn51HGT+fFh1Q8AQSIjVuBlIO/QmXbtytTlbqvnQXAvAScmZcxuetQFl4skQeTPiNAVlyOJ5hXswn7uRcZZbTEYSdM7nGoIPaoqpnpZb5ak6ozPjVgLSVtC3+b+gfnseJ9uwoBjdwCluYV9euSAf0rJWVT0e1nZ7b1197uVb7mK+OH9xQHcIiWwfnzk98iK6Dnau08cGFGDYpxDMku9rwEg53nod0RP31nLkSal4139t+csKLVPBxwKj25MT7H9SyG3DCQ7DC3skCaBw2dCWbauO0fufoEd0DxfGjIfZtA7QPmnQqNP67lOMHFFqE7tRIXxmxnBcNXzrxXTH0XaLRa6asadzSYZpsD94tc8DaExyPZdDIKxPWZf0FsFR75Tr8vu1AAVYOscdIdLH6i65U7VZ0f3yoL0lPemhj5fMEUWR9gnhbrNMbNC+Opci7lnSG6Aot+mOiaehCUMO4pFc5CkSlzt/SLMYI6KHrbwsAOhOBgKzY4NaXrFLWlVOEzKUcXBXla1DRcoPZH8iw0linqQuEfGNnPqig==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(136003)(346002)(376002)(39860400002)(451199021)(38100700002)(235185007)(5660300002)(186003)(21490400003)(36756003)(82960400001)(2616005)(30864003)(83380400001)(2906002)(66556008)(6916009)(66946007)(66476007)(966005)(4326008)(6512007)(316002)(6666004)(6486002)(44144004)(41300700001)(86362001)(478600001)(19627235002)(8676002)(8936002)(6506007)(1076003)(26005)(2700100001)(579004)(559001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?AAq2+52XzaHCN/Dn6kbfyw3muquBI11uXLTS6tLpEfueTqeRF5OxZyEre9?=
 =?iso-8859-1?Q?s4KUy71kwPWzTv8QR8WiujXz8x7LMZeM5jP46bkn9/eG05z+W+X/bczBXH?=
 =?iso-8859-1?Q?BbolF/fAFa4K+yB4F8Dd69MwSSbwpG68nfQyErgjxhEs252Ktz4A6xPeTV?=
 =?iso-8859-1?Q?+LNqfdCnIggA+WN8hfoceLnnhA4SDfMbVDkhQ8R9yPWGkSpaWKEIclMswv?=
 =?iso-8859-1?Q?NoRJ/zNrFBJGXFIMY53GcRWuLa3KHWSQD2HNL35CQnpULuoUqZiH/yseaS?=
 =?iso-8859-1?Q?x9E1jyJLZ4+vJunmRNCU7McK16+YhFBanRESXOpGoWLpdDxdhMfd9VeyUR?=
 =?iso-8859-1?Q?7mGSwKnZsqLkDKXF0yh4E0bnO7/n0l674QnGujyKWJGan44Fju9Ev/YidS?=
 =?iso-8859-1?Q?CLlT6WokD4sFQ3TUkEkNAMrYZ1pKgQV034K/KVrbxF42pSh3/fLZw7OpvG?=
 =?iso-8859-1?Q?vlLjVoB4o4hBfI9EhCNSS78HZmFvp76Z4GlwoPIgBjc9gJ5rm5KIyAYwyE?=
 =?iso-8859-1?Q?5rMdCAt7LrLQHnhciw4zz4r27kLB34WZU++7DblBkO0MS8T/4DZB6IJCLp?=
 =?iso-8859-1?Q?Oq5oPpIKNZPDt5oNFXFnwPIjLuB3T8ylY0ou1TcUVQfPwNhH8s+7+3DosY?=
 =?iso-8859-1?Q?UxyrNvjnyGBpC8dZ8TUokvtFqeD11k2dygOw4I9fCTaJMS9naGPsSBFUNo?=
 =?iso-8859-1?Q?HbNpn3ZU17SFMgoZgC3UE/lH/NrMQ8ThoXl4/x3JRSoDZ/mSd+4UMz244N?=
 =?iso-8859-1?Q?ULEFZmAJOX+xXq1ErwtGIxor9ro5S/ZmDdMb2fg2sS984E2CbEHGSgupNg?=
 =?iso-8859-1?Q?D3r47wiGhFLMB9lhiWn/NpjsXgbM3qlk6iL2RL1a1gUzSjxAuhe/n1vfZ5?=
 =?iso-8859-1?Q?kGT2EkAGhAvj66w9SP3q6GEKmOAGDKiKa9t+UfAK8GTMlP8T8yXLb0HalP?=
 =?iso-8859-1?Q?siwW6fEZq7pga9sB7vv8ZqAUsKBiuRt5x0EgqrlsAYdepeqGyBdFufZm/g?=
 =?iso-8859-1?Q?lzJ+yapnuJWGm2+FpvPgpYp26/dPnoPJnjfBDEdh/T50plyKBiZc02id/8?=
 =?iso-8859-1?Q?lG2wJKLwLTSBZg4C5MK5hcMb5lWmpwBPQ/R/hyJ+lrUEW+M3sXUUCzZoyZ?=
 =?iso-8859-1?Q?2oYdP1Ud4JR52GhlatafujB7pGnxbOq8cwMsJx38QbIN9DsAUjDZyTSW6X?=
 =?iso-8859-1?Q?L0/2NtHgjuv8ekZzyvv7+XH4X+OmfjUGE2zkcIiZ6C6fc0bpsjsbL0rpZ7?=
 =?iso-8859-1?Q?sVXLDMGcXOjSd4SJhbpByrSGn4lOAUXuV9pdu7p9wIahHc1nxihfEQ7ZsO?=
 =?iso-8859-1?Q?c2Cag8o7HCbQpi+KhCQKckfZFnktoKgSKINHqZFfGuHngsEEmqZSUU2VzK?=
 =?iso-8859-1?Q?D4Mlzt+bdkAI+jlyMQ09l0EUhC12RwplclZ+/zwz29E8FOlFtcZenI6NOj?=
 =?iso-8859-1?Q?igQvwvYno4VgxDKzKACuX74KlIffrQfvScYnGuRp82LOp7zdsLX1urykC7?=
 =?iso-8859-1?Q?PHRPbS6RW27XeZKMlfqc70CPCUYW75rX2GkgVN8ZsrrRgOE8iDqe5x5fM+?=
 =?iso-8859-1?Q?hvKajOsyN8zP64Q8z3P3joynX5034rQgxDj1SyWNzAyn22OkEJrH2aA4F4?=
 =?iso-8859-1?Q?GgGEW62SG9ieG1z9R6Epk0Oj1n4qgoCh3vnloiatJ4zySlMG9Dqiog4Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b78e88c-1864-4cbf-e92e-08db8c584e34
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 15:11:51.0905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w6zQdE6DXE+qBrAhov1Tnzg1iTczcg2xu+CHTDr2c8CLfAUP3ZgRXUek31gPfv9SHbWyApLJWEOp2Vq1UNwzZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6166
X-OriginatorOrg: intel.com

--rPIyn3lZ0OrwwLB2
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit



Hello,

kernel test robot noticed a -54.9% regression of netperf.Throughput_Mbps on:


commit: 86bfbb7ce4f67a88df2639198169b685668e7349 ("sched/fair: Add lag based placement")
https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git sched/eevdf

testcase: netperf
test machine: 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2.00GHz (Ice Lake) with 256G memory
parameters:

	ip: ipv4
	runtime: 300s
	nr_threads: 200%
	cluster: cs-localhost
	test: TCP_MAERTS
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+---------------------------------------------------------------------------------------------+
| testcase: change | schbench: perf-c2c.HITM.total -55.9% improvement                                            |
| test machine     | 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory |
| test parameters  | cpufreq_governor=performance                                                                |
|                  | iterations=3x                                                                               |
|                  | message_threads=1                                                                           |
|                  | runtime=30s                                                                                 |
|                  | worker_threads=512                                                                          |
+------------------+---------------------------------------------------------------------------------------------+
| testcase: change | schbench: perf-c2c.HITM.total 624.0% regression                                             |
| test machine     | 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory |
| test parameters  | cpufreq_governor=performance                                                                |
|                  | iterations=3x                                                                               |
|                  | message_threads=12.5%                                                                       |
|                  | runtime=300s                                                                                |
|                  | worker_threads=16                                                                           |
+------------------+---------------------------------------------------------------------------------------------+
| testcase: change | hackbench: hackbench.throughput 259.9% improvement                                          |
| test machine     | 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory |
| test parameters  | cpufreq_governor=performance                                                                |
|                  | ipc=pipe                                                                                    |
|                  | iterations=4                                                                                |
|                  | mode=threads                                                                                |
|                  | nr_threads=100%                                                                             |
+------------------+---------------------------------------------------------------------------------------------+
| testcase: change | netperf: netperf.Throughput_Mbps -55.1% regression                                          |
| test machine     | 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2.00GHz (Ice Lake) with 256G memory  |
| test parameters  | cluster=cs-localhost                                                                        |
|                  | cpufreq_governor=performance                                                                |
|                  | ip=ipv4                                                                                     |
|                  | nr_threads=200%                                                                             |
|                  | runtime=300s                                                                                |
|                  | test=TCP_STREAM                                                                             |
+------------------+---------------------------------------------------------------------------------------------+
| testcase: change | stress-ng: stress-ng.filename.ops_per_sec -22.9% regression                                 |
| test machine     | 36 threads 1 sockets Intel(R) Core(TM) i9-9980XE CPU @ 3.00GHz (Skylake) with 32G memory    |
| test parameters  | class=filesystem                                                                            |
|                  | cpufreq_governor=performance                                                                |
|                  | disk=1SSD                                                                                   |
|                  | fs=xfs                                                                                      |
|                  | nr_threads=10%                                                                              |
|                  | test=filename                                                                               |
|                  | testtime=60s                                                                                |
+------------------+---------------------------------------------------------------------------------------------+
| testcase: change | stress-ng: stress-ng.fifo.ops_per_sec 563.7% improvement                                    |
| test machine     | 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory   |
| test parameters  | class=pipe                                                                                  |
|                  | cpufreq_governor=performance                                                                |
|                  | nr_threads=100%                                                                             |
|                  | test=fifo                                                                                   |
|                  | testtime=60s                                                                                |
+------------------+---------------------------------------------------------------------------------------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202307241121.c02ef0d4-oliver.sang@intel.com


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
cluster/compiler/cpufreq_governor/ip/kconfig/nr_threads/rootfs/runtime/tbox_group/test/testcase:
  cs-localhost/gcc-12/performance/ipv4/x86_64-rhel-8.3/200%/debian-11.1-x86_64-20220510.cgz/300s/lkp-icl-2sp2/TCP_MAERTS/netperf

commit: 
  e0c2ff903c ("sched/fair: Remove sched_feat(START_DEBIT)")
  86bfbb7ce4 ("sched/fair: Add lag based placement")

e0c2ff903c320d3f 86bfbb7ce4f67a88df263919816 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      5507 ± 11%    +487.7%      32368 ± 45%  numa-meminfo.node0.Shmem
 3.807e+08           +36.9%  5.211e+08 ± 25%  cpuidle..time
   1358773 ± 13%     +77.6%    2413779 ± 26%  cpuidle..usage
   1275061 ± 18%     -32.6%     859390 ± 12%  meminfo.Inactive
   1274810 ± 18%     -32.6%     859039 ± 12%  meminfo.Inactive(anon)
    313.33           +16.0%     363.50        vmstat.procs.r
  18163508           -95.7%     779159 ±  4%  vmstat.system.cs
    216026           -29.2%     152904        vmstat.system.in
 7.548e+08 ±  4%     -35.3%  4.886e+08        numa-numastat.node0.local_node
 7.549e+08 ±  4%     -35.3%  4.886e+08        numa-numastat.node0.numa_hit
 7.475e+08 ±  4%     -36.9%  4.713e+08        numa-numastat.node1.local_node
 7.475e+08 ±  4%     -36.9%  4.714e+08        numa-numastat.node1.numa_hit
     50.50 ± 17%  +14006.9%       7124 ± 12%  perf-c2c.DRAM.local
    731.17 ±  7%     +43.8%       1051 ±  8%  perf-c2c.DRAM.remote
      2097 ± 10%    +117.8%       4567 ±  8%  perf-c2c.HITM.local
      2403 ±  9%    +103.8%       4897 ±  8%  perf-c2c.HITM.total
      0.73 ±  2%      +0.4        1.15 ± 23%  mpstat.cpu.all.idle%
      1.43 ±  2%      +0.4        1.83        mpstat.cpu.all.irq%
     19.28           -13.6        5.66        mpstat.cpu.all.soft%
     74.32           +15.4       89.77        mpstat.cpu.all.sys%
      4.23 ±  2%      -2.6        1.58 ±  2%  mpstat.cpu.all.usr%
      1376 ± 11%    +490.2%       8121 ± 46%  numa-vmstat.node0.nr_shmem
 7.549e+08 ±  4%     -35.3%  4.886e+08        numa-vmstat.node0.numa_hit
 7.548e+08 ±  4%     -35.3%  4.886e+08        numa-vmstat.node0.numa_local
 7.475e+08 ±  4%     -36.9%  4.714e+08        numa-vmstat.node1.numa_hit
 7.475e+08 ±  4%     -36.9%  4.713e+08        numa-vmstat.node1.numa_local
   1322838 ± 13%     +79.5%    2374233 ± 26%  turbostat.C1
      0.96            +0.3        1.30 ± 25%  turbostat.C1%
      0.95           +34.8%       1.28 ± 25%  turbostat.CPU%c1
      0.24           -78.9%       0.05        turbostat.IPC
  65790651           -29.1%   46613410        turbostat.IRQ
      2621 ± 29%     +70.5%       4470 ± 27%  turbostat.POLL
     40.07 ±  4%    +242.0%     137.04        turbostat.RAMWatt
      7467           -54.9%       3370        netperf.Throughput_Mbps
   1911769           -54.9%     862884        netperf.Throughput_total_Mbps
    899472 ± 32%    +253.4%    3179110 ±  2%  netperf.time.involuntary_context_switches
      3636           +89.0%       6871        netperf.time.percent_of_cpu_this_job_got
     10253          +102.7%      20778        netperf.time.system_time
    728.58 ±  2%     -82.1%     130.54        netperf.time.user_time
 2.778e+09           -95.8%  1.158e+08 ±  4%  netperf.time.voluntary_context_switches
 4.376e+09           -54.9%  1.975e+09        netperf.workload
    318426 ± 18%     -32.5%     214905 ± 12%  proc-vmstat.nr_inactive_anon
     33993            -1.7%      33422        proc-vmstat.nr_slab_reclaimable
     76492            +1.3%      77452        proc-vmstat.nr_slab_unreclaimable
    318426 ± 18%     -32.5%     214905 ± 12%  proc-vmstat.nr_zone_inactive_anon
    173823 ± 26%     -46.9%      92385 ± 14%  proc-vmstat.numa_hint_faults
    142763 ± 21%     -58.5%      59240 ± 16%  proc-vmstat.numa_hint_faults_local
 1.502e+09           -36.1%    9.6e+08        proc-vmstat.numa_hit
 1.502e+09           -36.1%  9.598e+08        proc-vmstat.numa_local
    422687 ± 10%     -23.4%     323790 ±  6%  proc-vmstat.numa_pte_updates
    886798 ± 20%     -41.9%     515356 ±  9%  proc-vmstat.pgactivate
   1.2e+10           -36.1%  7.665e+09        proc-vmstat.pgalloc_normal
   1307766 ±  4%     -10.8%    1166206        proc-vmstat.pgfault
   1.2e+10           -36.2%   7.66e+09        proc-vmstat.pgfree
  16546425        +1.7e+05%  2.814e+10 ± 62%  sched_debug.cfs_rq:/.avg_vruntime.avg
  23665903 ±  4%  +8.8e+06%  2.083e+12 ± 45%  sched_debug.cfs_rq:/.avg_vruntime.max
   3176437 ± 12%  +7.3e+06%  2.328e+11 ± 38%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      2.10           +17.4%       2.46        sched_debug.cfs_rq:/.h_nr_running.avg
      3.53           +26.8%       4.47 ±  3%  sched_debug.cfs_rq:/.h_nr_running.max
      6537 ±223%  +9.2e+06%  6.007e+08 ±218%  sched_debug.cfs_rq:/.left_vruntime.avg
    836737 ±223%  +9.2e+06%  7.689e+10 ±218%  sched_debug.cfs_rq:/.left_vruntime.max
     73668 ±223%  +9.2e+06%  6.769e+09 ±218%  sched_debug.cfs_rq:/.left_vruntime.stddev
      8032          +277.6%      30329 ±144%  sched_debug.cfs_rq:/.load.avg
     17485 ±  6%  +16419.1%    2888525 ±192%  sched_debug.cfs_rq:/.load.max
      3037 ±  5%   +8319.5%     255737 ±191%  sched_debug.cfs_rq:/.load.stddev
  16546425        +1.7e+05%  2.814e+10 ± 62%  sched_debug.cfs_rq:/.min_vruntime.avg
  23665903 ±  4%  +8.8e+06%  2.083e+12 ± 45%  sched_debug.cfs_rq:/.min_vruntime.max
   3176437 ± 12%  +7.3e+06%  2.328e+11 ± 38%  sched_debug.cfs_rq:/.min_vruntime.stddev
      0.05 ±  6%     +49.7%       0.08 ± 22%  sched_debug.cfs_rq:/.nr_running.stddev
      6537 ±223%  +9.2e+06%  6.007e+08 ±218%  sched_debug.cfs_rq:/.right_vruntime.avg
    836737 ±223%  +9.2e+06%  7.689e+10 ±218%  sched_debug.cfs_rq:/.right_vruntime.max
     73668 ±223%  +9.2e+06%  6.769e+09 ±218%  sched_debug.cfs_rq:/.right_vruntime.stddev
      2057           +23.3%       2536        sched_debug.cfs_rq:/.runnable_avg.avg
      3192 ±  2%     +28.8%       4111 ±  4%  sched_debug.cfs_rq:/.runnable_avg.max
    548.31 ±  3%     +18.1%     647.31 ±  3%  sched_debug.cfs_rq:/.runnable_avg.stddev
    514.03 ±  3%     -38.6%     315.78 ± 17%  sched_debug.cfs_rq:/.util_avg.min
      1834 ±  5%     -14.2%       1573 ±  7%  sched_debug.cfs_rq:/.util_est_enqueued.max
    325.62 ±  3%     -37.2%     204.39 ±  5%  sched_debug.cfs_rq:/.util_est_enqueued.stddev
    329168 ±  3%     +16.8%     384517 ±  3%  sched_debug.cpu.avg_idle.avg
      5096 ±  9%    +456.3%      28349 ± 11%  sched_debug.cpu.avg_idle.min
    276305 ±  4%     -11.5%     244558 ±  4%  sched_debug.cpu.avg_idle.stddev
    174028           +11.4%     193891        sched_debug.cpu.clock_task.avg
    165142           +10.8%     183008        sched_debug.cpu.clock_task.min
      2.09           +17.6%       2.46        sched_debug.cpu.nr_running.avg
      3.50           +27.8%       4.47 ±  3%  sched_debug.cpu.nr_running.max
  20611833 ±  2%     -95.6%     911652 ±  4%  sched_debug.cpu.nr_switches.avg
  23047156           -84.3%    3613922 ±  6%  sched_debug.cpu.nr_switches.max
  15179887 ± 16%     -98.5%     227799 ± 12%  sched_debug.cpu.nr_switches.min
   1881349 ± 22%     -71.6%     533856 ±  6%  sched_debug.cpu.nr_switches.stddev
      0.00 ± 44%  +84454.0%       0.64 ± 46%  sched_debug.rt_rq:.rt_time.avg
      0.10 ± 44%  +84445.8%      81.89 ± 46%  sched_debug.rt_rq:.rt_time.max
      0.01 ± 44%  +84445.7%       7.21 ± 46%  sched_debug.rt_rq:.rt_time.stddev
  29305629          +300.0%  1.172e+08        sched_debug.sysctl_sched.sysctl_sched_features
      7.18 ±  2%    +969.2%      76.75        perf-stat.i.MPKI
  4.37e+10           -79.0%  9.161e+09        perf-stat.i.branch-instructions
      1.16            -0.4        0.76        perf-stat.i.branch-miss-rate%
 5.043e+08           -86.3%   69285075        perf-stat.i.branch-misses
      8.90 ± 27%     +51.5       60.42        perf-stat.i.cache-miss-rate%
 1.666e+08 ± 26%   +1238.2%   2.23e+09        perf-stat.i.cache-misses
 1.575e+09 ±  2%    +133.3%  3.674e+09        perf-stat.i.cache-references
  18372075           -95.7%     788491 ±  4%  perf-stat.i.context-switches
      1.42          +376.8%       6.77        perf-stat.i.cpi
    128017            +1.5%     129916        perf-stat.i.cpu-clock
    942.20 ±  3%     -20.7%     747.09 ±  2%  perf-stat.i.cpu-migrations
      4591 ±  9%     -96.2%     175.51 ± 20%  perf-stat.i.cycles-between-cache-misses
      0.02 ± 17%      -0.0        0.01 ± 17%  perf-stat.i.dTLB-load-miss-rate%
  15190050 ± 17%     -91.5%    1291324 ± 17%  perf-stat.i.dTLB-load-misses
 6.541e+10           -79.6%  1.337e+10        perf-stat.i.dTLB-loads
      0.02 ± 16%      -0.0        0.01 ± 11%  perf-stat.i.dTLB-store-miss-rate%
   8421615 ± 16%     -92.3%     651408 ± 10%  perf-stat.i.dTLB-store-misses
  3.82e+10           -80.6%  7.402e+09        perf-stat.i.dTLB-stores
 2.283e+11           -79.1%  4.781e+10        perf-stat.i.instructions
      0.71           -78.3%       0.15        perf-stat.i.ipc
    400.34 ±  5%     -48.4%     206.45 ± 15%  perf-stat.i.metric.K/sec
      1163           -76.8%     269.47        perf-stat.i.metric.M/sec
      3765 ±  4%     -13.8%       3245 ±  3%  perf-stat.i.minor-faults
     70.93 ±  6%     -69.5        1.45 ± 24%  perf-stat.i.node-load-miss-rate%
  25523474 ± 36%   +2618.3%  6.938e+08        perf-stat.i.node-loads
     50.01 ±  4%     -47.1        2.91 ± 20%  perf-stat.i.node-store-miss-rate%
   5651820 ±  6%    +238.2%   19113902 ± 20%  perf-stat.i.node-store-misses
  52120632 ± 38%   +1244.1%  7.005e+08        perf-stat.i.node-stores
      3765 ±  4%     -13.8%       3245 ±  3%  perf-stat.i.page-faults
    128017            +1.5%     129916        perf-stat.i.task-clock
      6.90 ±  2%   +1011.1%      76.69        perf-stat.overall.MPKI
      1.15            -0.4        0.75        perf-stat.overall.branch-miss-rate%
     10.67 ± 27%     +50.0       60.71        perf-stat.overall.cache-miss-rate%
      1.40          +382.0%       6.76        perf-stat.overall.cpi
      2103 ± 35%     -93.1%     145.16        perf-stat.overall.cycles-between-cache-misses
      0.02 ± 16%      -0.0        0.01 ± 17%  perf-stat.overall.dTLB-load-miss-rate%
      0.02 ± 15%      -0.0        0.01 ± 11%  perf-stat.overall.dTLB-store-miss-rate%
      0.71           -79.3%       0.15        perf-stat.overall.ipc
     22.02 ± 33%     -21.2        0.87 ±  6%  perf-stat.overall.node-load-miss-rate%
     11.55 ± 47%      -8.9        2.67 ± 20%  perf-stat.overall.node-store-miss-rate%
     15718           -53.7%       7284        perf-stat.overall.path-length
 4.354e+10           -79.3%  9.034e+09        perf-stat.ps.branch-instructions
 5.025e+08           -86.4%   68174291        perf-stat.ps.branch-misses
 1.668e+08 ± 26%   +1215.5%  2.195e+09        perf-stat.ps.cache-misses
  1.57e+09 ±  2%    +130.3%  3.615e+09        perf-stat.ps.cache-references
  18305287           -95.8%     776950 ±  4%  perf-stat.ps.context-switches
    938.59 ±  3%     -23.2%     720.40        perf-stat.ps.cpu-migrations
  15126068 ± 17%     -91.5%    1286087 ± 17%  perf-stat.ps.dTLB-load-misses
 6.517e+10           -79.8%  1.318e+10        perf-stat.ps.dTLB-loads
   8385404 ± 16%     -92.4%     639621 ± 11%  perf-stat.ps.dTLB-store-misses
 3.806e+10           -80.8%  7.295e+09        perf-stat.ps.dTLB-stores
 2.274e+11           -79.3%  4.714e+10        perf-stat.ps.instructions
      3748 ±  4%     -12.9%       3263        perf-stat.ps.minor-faults
  25603243 ± 36%   +2566.6%  6.827e+08        perf-stat.ps.node-loads
   5632698 ±  6%    +235.2%   18879944 ± 20%  perf-stat.ps.node-store-misses
  52302810 ± 38%   +1217.6%  6.891e+08        perf-stat.ps.node-stores
      3748 ±  4%     -12.9%       3263        perf-stat.ps.page-faults
 6.878e+13           -79.1%  1.439e+13        perf-stat.total.instructions
      0.04 ±207%   +8783.0%       3.41 ±  2%  perf-sched.sch_delay.avg.ms.__cond_resched.__release_sock.release_sock.tcp_recvmsg.inet_recvmsg
      0.01 ±121%  +14939.1%       1.15 ± 71%  perf-sched.sch_delay.avg.ms.__cond_resched.aa_sk_perm.security_socket_recvmsg.sock_recvmsg.__sys_recvfrom
      0.03 ±141%   +3444.7%       1.23 ± 77%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      0.01 ±  7%    +203.2%       0.02 ± 17%  perf-sched.sch_delay.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.00 ±103%  +2.1e+05%       2.75 ± 50%  perf-sched.sch_delay.avg.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      0.00 ±223%    +2e+05%       4.90 ±151%  perf-sched.sch_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.00 ± 88%  +1.4e+05%       3.20 ±108%  perf-sched.sch_delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      0.01 ± 67%  +14021.3%       1.11 ± 39%  perf-sched.sch_delay.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      0.00 ±166%  +1.5e+05%       2.19 ± 28%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      0.27 ±  6%     +99.5%       0.54 ±  2%  perf-sched.sch_delay.avg.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.01 ±102%  +1.1e+05%       9.08 ± 92%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      0.02 ± 13%  +2.4e+05%      41.17 ±146%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
      0.41 ±196%    +525.0%       2.57 ± 23%  perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.01 ± 10%    +198.3%       0.03 ± 14%  perf-sched.sch_delay.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
     79.96 ±121%     -99.5%       0.41 ± 38%  perf-sched.sch_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      0.04 ±140%   +9584.3%       3.79        perf-sched.sch_delay.avg.ms.schedule_timeout.wait_woken.sk_stream_wait_memory.tcp_sendmsg_locked
      0.22 ± 22%     +50.5%       0.34 ±  7%  perf-sched.sch_delay.avg.ms.schedule_timeout.wait_woken.sk_wait_data.tcp_recvmsg_locked
    121.52 ±223%    +768.7%       1055 ± 71%  perf-sched.sch_delay.max.ms.__cond_resched.__release_sock.release_sock.tcp_recvmsg.inet_recvmsg
      8.52 ±223%   +1792.7%     161.23 ± 14%  perf-sched.sch_delay.max.ms.__cond_resched.__skb_datagram_iter.skb_copy_datagram_iter.tcp_recvmsg_locked.tcp_recvmsg
      0.00 ±141%  +5.5e+07%       1743 ± 69%  perf-sched.sch_delay.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      0.01 ±140%  +3.1e+05%      30.74 ±120%  perf-sched.sch_delay.max.ms.__cond_resched.aa_sk_perm.security_socket_recvmsg.sock_recvmsg.__sys_recvfrom
      0.06 ±141%  +15227.5%       9.84 ± 75%  perf-sched.sch_delay.max.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      0.01 ± 19%    +436.0%       0.04 ± 23%  perf-sched.sch_delay.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.01 ±101%  +6.5e+05%      47.71 ± 64%  perf-sched.sch_delay.max.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      0.00 ±223%    +1e+06%      25.25 ±180%  perf-sched.sch_delay.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.01 ± 90%  +1.9e+06%     210.37 ±174%  perf-sched.sch_delay.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      0.02 ± 52%  +78898.0%      13.03 ±  8%  perf-sched.sch_delay.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      0.01 ±100%  +4.5e+05%      23.77 ± 46%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      2.82 ±134%  +30117.5%     851.53 ±111%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.28 ±  7%    +146.4%       0.69 ± 18%  perf-sched.sch_delay.max.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.01 ±100%  +7.9e+05%      89.66 ±142%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      0.02 ± 27%  +3.4e+05%      76.65 ±120%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
      0.93 ±173%   +4332.3%      41.24 ± 49%  perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.01 ± 25%    +504.3%       0.07 ± 32%  perf-sched.sch_delay.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
    139.28 ±161%   +1282.1%       1925 ± 37%  perf-sched.sch_delay.max.ms.schedule_timeout.wait_woken.sk_stream_wait_memory.tcp_sendmsg_locked
      2582 ± 26%     -71.8%     728.88 ± 76%  perf-sched.sch_delay.max.ms.schedule_timeout.wait_woken.sk_wait_data.tcp_recvmsg_locked
      0.12 ± 20%    +343.8%       0.51 ±  7%  perf-sched.total_sch_delay.average.ms
      0.97 ± 21%    +123.7%       2.17 ±  6%  perf-sched.total_wait_and_delay.average.ms
      0.86 ± 21%     +93.9%       1.66 ±  6%  perf-sched.total_wait_time.average.ms
      4896 ±  3%     -27.1%       3571 ± 17%  perf-sched.total_wait_time.max.ms
     55.25 ±149%     -98.2%       1.00 ±145%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.shmem_alloc_folio
      0.69 ± 22%     -91.3%       0.06 ± 20%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__release_sock.release_sock.tcp_sendmsg.sock_sendmsg
     75.81 ± 74%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
      0.49 ± 22%     -90.0%       0.05 ±  3%  perf-sched.wait_and_delay.avg.ms.__cond_resched.kmem_cache_alloc_node.__alloc_skb.tcp_stream_alloc_skb.tcp_sendmsg_locked
      0.22 ±223%   +4328.7%       9.54 ± 71%  perf-sched.wait_and_delay.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      0.53 ± 22%     +71.0%       0.91 ±  7%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
    989.34 ± 60%     -89.7%     102.33        perf-sched.wait_and_delay.avg.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
     16.52 ±165%   +1569.8%     275.86 ± 24%  perf-sched.wait_and_delay.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      1.13 ±142%   +1540.2%      18.58 ± 98%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    248.54 ± 98%     -96.9%       7.79 ±  6%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    405.08 ± 51%     +72.9%     700.35 ±  2%  perf-sched.wait_and_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      4.83 ± 36%     -75.9%       1.17 ±143%  perf-sched.wait_and_delay.count.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.shmem_alloc_folio
      1049 ±135%   +3283.2%      35512 ±  3%  perf-sched.wait_and_delay.count.__cond_resched.__release_sock.release_sock.tcp_recvmsg.inet_recvmsg
    406737 ± 24%     -41.6%     237730 ±  8%  perf-sched.wait_and_delay.count.__cond_resched.__release_sock.release_sock.tcp_sendmsg.sock_sendmsg
      2.83 ±141%  +1.9e+05%       5463 ±  7%  perf-sched.wait_and_delay.count.__cond_resched.__skb_datagram_iter.skb_copy_datagram_iter.tcp_recvmsg_locked.tcp_recvmsg
    187.67 ± 18%     +85.9%     348.83 ± 31%  perf-sched.wait_and_delay.count.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
     17.17 ± 77%    +257.3%      61.33 ±  8%  perf-sched.wait_and_delay.count.__cond_resched.aa_sk_perm.security_socket_sendmsg.sock_sendmsg.__sys_sendto
     11.67 ± 43%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
    406660 ± 24%     -41.5%     237888 ±  8%  perf-sched.wait_and_delay.count.__cond_resched.kmem_cache_alloc_node.__alloc_skb.tcp_stream_alloc_skb.tcp_sendmsg_locked
      0.50 ±223%  +12266.7%      61.83 ±  6%  perf-sched.wait_and_delay.count.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      6.50 ±102%    +789.7%      57.83 ± 10%  perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
    816196 ± 24%     -38.1%     505013 ±  7%  perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      3.17 ± 42%   +1421.1%      48.17        perf-sched.wait_and_delay.count.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
      4.67 ± 63%   +1000.0%      51.33 ±  9%  perf-sched.wait_and_delay.count.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      1.00 ±223%   +1516.7%      16.17 ±  8%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      3.33 ± 22%    +325.0%      14.17 ± 12%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      1.50 ±120%   +4800.0%      73.50 ±  2%  perf-sched.wait_and_delay.count.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      2.50 ± 85%    +666.7%      19.17 ±  4%  perf-sched.wait_and_delay.count.schedule_timeout.kcompactd.kthread.ret_from_fork
     38.00 ± 63%   +1573.2%     635.83 ±  4%  perf-sched.wait_and_delay.count.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      1989 ±134%   +5731.9%     116044        perf-sched.wait_and_delay.count.schedule_timeout.wait_woken.sk_stream_wait_memory.tcp_sendmsg_locked
   1647162 ± 24%     -36.8%    1040204 ±  7%  perf-sched.wait_and_delay.count.schedule_timeout.wait_woken.sk_wait_data.tcp_recvmsg_locked
     53.67 ± 51%   +1286.3%     744.00 ±  2%  perf-sched.wait_and_delay.count.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
    224.57 ±183%     -98.4%       3.57 ±153%  perf-sched.wait_and_delay.max.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.shmem_alloc_folio
    573.30 ± 85%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
      2526 ± 28%     -91.3%     218.88 ± 32%  perf-sched.wait_and_delay.max.ms.__cond_resched.kmem_cache_alloc_node.__alloc_skb.tcp_stream_alloc_skb.tcp_sendmsg_locked
      0.64 ±223%  +32696.7%     209.95 ±168%  perf-sched.wait_and_delay.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      2114 ± 55%     -95.0%     105.46        perf-sched.wait_and_delay.max.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
      1.47 ±117%  +54111.6%     796.55 ±154%  perf-sched.wait_and_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      2431 ± 43%     -86.4%     329.52 ± 30%  perf-sched.wait_and_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    880.69 ± 71%    +337.4%       3852 ± 37%  perf-sched.wait_and_delay.max.ms.schedule_timeout.wait_woken.sk_stream_wait_memory.tcp_sendmsg_locked
      4896 ±  3%     -40.1%       2932 ± 21%  perf-sched.wait_and_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      3.82 ± 46%    +179.3%      10.67 ± 34%  perf-sched.wait_and_delay.max.ms.syslog_print.do_syslog.kmsg_read.vfs_read
     55.25 ±149%     -97.7%       1.24 ±111%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.shmem_alloc_folio
      0.69 ± 22%     -93.4%       0.05 ± 14%  perf-sched.wait_time.avg.ms.__cond_resched.__release_sock.release_sock.tcp_sendmsg.sock_sendmsg
     22.84 ±  9%     -50.7%      11.27 ± 56%  perf-sched.wait_time.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      0.03 ±130%   +9381.9%       2.45 ± 44%  perf-sched.wait_time.avg.ms.__cond_resched.aa_sk_perm.security_socket_recvmsg.sock_recvmsg.__sys_recvfrom
      0.01 ±139%   +6315.6%       0.68 ± 80%  perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      0.01 ± 71%  +14387.1%       1.50 ± 73%  perf-sched.wait_time.avg.ms.__cond_resched.dput.__fput.task_work_run.exit_to_user_mode_loop
     75.81 ± 74%     -99.3%       0.54 ±106%  perf-sched.wait_time.avg.ms.__cond_resched.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
      0.49 ± 22%     -92.4%       0.04 ±  2%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_node.__alloc_skb.tcp_stream_alloc_skb.tcp_sendmsg_locked
      0.06 ± 32%  +13231.8%       8.44 ± 54%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_node.kmalloc_reserve.__alloc_skb.tcp_stream_alloc_skb
      0.01 ±146%  +30653.7%       2.77 ± 79%  perf-sched.wait_time.avg.ms.__cond_resched.lock_sock_nested.tcp_recvmsg.inet_recvmsg.sock_recvmsg
      0.08 ±  7%  +16776.5%      13.02 ± 46%  perf-sched.wait_time.avg.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      0.00 ±105%  +8.8e+06%     368.17 ± 73%  perf-sched.wait_time.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.01 ±148%  +3.6e+06%     306.20 ± 20%  perf-sched.wait_time.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.06 ±141%  +3.7e+05%     218.09 ±  6%  perf-sched.wait_time.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      0.35 ±117%   +2279.1%       8.44 ± 81%  perf-sched.wait_time.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      0.06 ±108%   +9095.3%       5.52 ± 76%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
    989.07 ± 60%     -89.7%     101.79        perf-sched.wait_time.avg.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
     12.29 ±166%   +2081.2%     268.02 ± 25%  perf-sched.wait_time.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      1.11 ± 53%   +1346.6%      16.01 ±111%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    168.57 ± 87%     -95.6%       7.37 ±  6%  perf-sched.wait_time.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      0.00 ± 87%   +8853.8%       0.39 ± 79%  perf-sched.wait_time.avg.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
    313.96 ± 54%    +122.1%     697.42 ±  2%  perf-sched.wait_time.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
    224.57 ±183%     -98.1%       4.38 ±119%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.shmem_alloc_folio
      0.03 ±128%  +1.8e+05%      48.83 ± 80%  perf-sched.wait_time.max.ms.__cond_resched.aa_sk_perm.security_socket_recvmsg.sock_recvmsg.__sys_recvfrom
      0.02 ±102%  +33832.0%       5.82 ±115%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      0.01 ± 71%  +50467.7%       5.23 ± 71%  perf-sched.wait_time.max.ms.__cond_resched.dput.__fput.task_work_run.exit_to_user_mode_loop
    573.30 ± 85%     -99.5%       2.90 ±110%  perf-sched.wait_time.max.ms.__cond_resched.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
      2526 ± 28%     -94.1%     149.63 ± 56%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_node.__alloc_skb.tcp_stream_alloc_skb.tcp_sendmsg_locked
      0.14 ± 30%  +25403.4%      35.28 ± 54%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_node.kmalloc_reserve.__alloc_skb.tcp_stream_alloc_skb
      0.01 ±146%  +1.3e+05%      11.60 ± 79%  perf-sched.wait_time.max.ms.__cond_resched.lock_sock_nested.tcp_recvmsg.inet_recvmsg.sock_recvmsg
      0.16 ± 13%  +42583.3%      67.23 ± 56%  perf-sched.wait_time.max.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      0.01 ±128%  +1.4e+07%     841.22 ± 44%  perf-sched.wait_time.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.01 ±148%  +1.2e+07%       1003        perf-sched.wait_time.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.17 ±141%  +9.6e+05%       1682 ± 55%  perf-sched.wait_time.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      1.04 ±127%  +19929.8%     209.31 ±169%  perf-sched.wait_time.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      0.13 ±101%    +3e+05%     378.27 ±121%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      2114 ± 55%     -95.0%     104.87        perf-sched.wait_time.max.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
      2.26 ± 50%  +33874.8%     769.02 ±161%  perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      1585 ± 35%     -83.3%     265.49 ± 14%  perf-sched.wait_time.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      4896 ±  3%     -40.1%       2932 ± 21%  perf-sched.wait_time.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.01 ± 71%  +82751.2%       5.94 ±102%  perf-sched.wait_time.max.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
     56.43           -16.1       40.33 ±  3%  perf-profile.calltrace.cycles-pp.accept_connections.main.__libc_start_main
     56.43           -16.1       40.33 ±  3%  perf-profile.calltrace.cycles-pp.accept_connection.accept_connections.main.__libc_start_main
     56.43           -16.1       40.33 ±  3%  perf-profile.calltrace.cycles-pp.spawn_child.accept_connection.accept_connections.main.__libc_start_main
     56.43           -16.1       40.33 ±  3%  perf-profile.calltrace.cycles-pp.process_requests.spawn_child.accept_connection.accept_connections.main
     18.74           -15.7        3.04 ±  4%  perf-profile.calltrace.cycles-pp.__dev_queue_xmit.ip_finish_output2.__ip_queue_xmit.__tcp_transmit_skb.tcp_write_xmit
     56.39           -15.4       40.97        perf-profile.calltrace.cycles-pp.recv_omni.process_requests.spawn_child.accept_connection.accept_connections
     20.84           -15.4        5.42 ±  5%  perf-profile.calltrace.cycles-pp.__local_bh_enable_ip.__dev_queue_xmit.ip_finish_output2.__ip_queue_xmit.__tcp_transmit_skb
     20.65           -15.2        5.41 ±  5%  perf-profile.calltrace.cycles-pp.do_softirq.__local_bh_enable_ip.__dev_queue_xmit.ip_finish_output2.__ip_queue_xmit
     20.35           -15.0        5.38 ±  5%  perf-profile.calltrace.cycles-pp.__do_softirq.do_softirq.__local_bh_enable_ip.__dev_queue_xmit.ip_finish_output2
     55.20           -14.9       40.30        perf-profile.calltrace.cycles-pp.__send.recv_omni.process_requests.spawn_child.accept_connection
     54.48           -14.6       39.90        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__send.recv_omni.process_requests.spawn_child
     18.32           -14.4        3.94        perf-profile.calltrace.cycles-pp.__napi_poll.net_rx_action.__do_softirq.do_softirq.__local_bh_enable_ip
     54.06           -14.3       39.79        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__send.recv_omni.process_requests
     18.18           -14.2        3.94        perf-profile.calltrace.cycles-pp.process_backlog.__napi_poll.net_rx_action.__do_softirq.do_softirq
     18.93           -14.0        4.96 ±  5%  perf-profile.calltrace.cycles-pp.net_rx_action.__do_softirq.do_softirq.__local_bh_enable_ip.__dev_queue_xmit
     17.25           -13.4        3.86        perf-profile.calltrace.cycles-pp.__netif_receive_skb_one_core.process_backlog.__napi_poll.net_rx_action.__do_softirq
     14.32           -12.9        1.39 ±  6%  perf-profile.calltrace.cycles-pp.ip_finish_output2.__ip_queue_xmit.__tcp_transmit_skb.tcp_write_xmit.__tcp_push_pending_frames
     51.44           -12.2       39.29        perf-profile.calltrace.cycles-pp.__sys_sendto.__x64_sys_sendto.do_syscall_64.entry_SYSCALL_64_after_hwframe.__send
     50.93           -11.6       39.33        perf-profile.calltrace.cycles-pp.__x64_sys_sendto.do_syscall_64.entry_SYSCALL_64_after_hwframe.__send.recv_omni
     49.94           -11.4       38.50        perf-profile.calltrace.cycles-pp.sock_sendmsg.__sys_sendto.__x64_sys_sendto.do_syscall_64.entry_SYSCALL_64_after_hwframe
     14.86           -11.3        3.59        perf-profile.calltrace.cycles-pp.ip_local_deliver_finish.__netif_receive_skb_one_core.process_backlog.__napi_poll.net_rx_action
     49.42           -11.2       38.18        perf-profile.calltrace.cycles-pp.tcp_sendmsg.sock_sendmsg.__sys_sendto.__x64_sys_sendto.do_syscall_64
     14.76           -11.2        3.58        perf-profile.calltrace.cycles-pp.ip_protocol_deliver_rcu.ip_local_deliver_finish.__netif_receive_skb_one_core.process_backlog.__napi_poll
     14.36           -10.8        3.54        perf-profile.calltrace.cycles-pp.tcp_v4_rcv.ip_protocol_deliver_rcu.ip_local_deliver_finish.__netif_receive_skb_one_core.process_backlog
     12.50           -10.8        1.69 ±  7%  perf-profile.calltrace.cycles-pp.release_sock.tcp_sendmsg.sock_sendmsg.__sys_sendto.__x64_sys_sendto
     12.15           -10.6        1.53 ±  7%  perf-profile.calltrace.cycles-pp.__release_sock.release_sock.tcp_sendmsg.sock_sendmsg.__sys_sendto
     12.52           -10.6        1.92 ±  4%  perf-profile.calltrace.cycles-pp.__tcp_push_pending_frames.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg.__sys_sendto
     12.39           -10.5        1.88 ±  4%  perf-profile.calltrace.cycles-pp.tcp_write_xmit.__tcp_push_pending_frames.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg
     10.88           -10.2        0.73 ±  6%  perf-profile.calltrace.cycles-pp.__tcp_transmit_skb.tcp_write_xmit.__tcp_push_pending_frames.tcp_sendmsg_locked.tcp_sendmsg
      9.65            -9.3        0.34 ± 70%  perf-profile.calltrace.cycles-pp.sk_wait_data.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg.sock_recvmsg
      9.95            -9.3        0.67 ±  6%  perf-profile.calltrace.cycles-pp.__ip_queue_xmit.__tcp_transmit_skb.tcp_write_xmit.__tcp_push_pending_frames.tcp_sendmsg_locked
     11.64 ±  2%      -8.5        3.14        perf-profile.calltrace.cycles-pp.tcp_v4_do_rcv.tcp_v4_rcv.ip_protocol_deliver_rcu.ip_local_deliver_finish.__netif_receive_skb_one_core
      8.32            -8.3        0.00        perf-profile.calltrace.cycles-pp.wait_woken.sk_wait_data.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg
     11.21 ±  2%      -8.1        3.09        perf-profile.calltrace.cycles-pp.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv.ip_protocol_deliver_rcu.ip_local_deliver_finish
      8.64 ±  3%      -8.0        0.59 ±  3%  perf-profile.calltrace.cycles-pp.tcp_data_queue.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv.ip_protocol_deliver_rcu
      7.98            -8.0        0.00        perf-profile.calltrace.cycles-pp.schedule_timeout.wait_woken.sk_wait_data.tcp_recvmsg_locked.tcp_recvmsg
      7.68            -7.7        0.00        perf-profile.calltrace.cycles-pp.schedule.schedule_timeout.wait_woken.sk_wait_data.tcp_recvmsg_locked
      7.46            -7.5        0.00        perf-profile.calltrace.cycles-pp.__schedule.schedule.schedule_timeout.wait_woken.sk_wait_data
      8.36            -7.0        1.35 ±  7%  perf-profile.calltrace.cycles-pp.tcp_v4_do_rcv.__release_sock.release_sock.tcp_sendmsg.sock_sendmsg
      8.28            -6.9        1.35 ±  7%  perf-profile.calltrace.cycles-pp.tcp_rcv_established.tcp_v4_do_rcv.__release_sock.release_sock.tcp_sendmsg
      6.45 ±  4%      -6.5        0.00        perf-profile.calltrace.cycles-pp.sock_def_readable.tcp_data_queue.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv
      6.29 ±  4%      -6.3        0.00        perf-profile.calltrace.cycles-pp.__wake_up_common_lock.sock_def_readable.tcp_data_queue.tcp_rcv_established.tcp_v4_do_rcv
      9.01            -6.1        2.88        perf-profile.calltrace.cycles-pp.__tcp_transmit_skb.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg.sock_recvmsg
      6.01 ±  4%      -6.0        0.00        perf-profile.calltrace.cycles-pp.__wake_up_common.__wake_up_common_lock.sock_def_readable.tcp_data_queue.tcp_rcv_established
      5.69 ±  5%      -5.7        0.00        perf-profile.calltrace.cycles-pp.try_to_wake_up.__wake_up_common.__wake_up_common_lock.sock_def_readable.tcp_data_queue
      6.60            -5.5        1.06 ±  7%  perf-profile.calltrace.cycles-pp.__tcp_push_pending_frames.tcp_rcv_established.tcp_v4_do_rcv.__release_sock.release_sock
      6.55            -5.5        1.06 ±  7%  perf-profile.calltrace.cycles-pp.tcp_write_xmit.__tcp_push_pending_frames.tcp_rcv_established.tcp_v4_do_rcv.__release_sock
      8.14            -4.9        3.20        perf-profile.calltrace.cycles-pp.__ip_queue_xmit.__tcp_transmit_skb.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg
      5.34            -4.5        0.81 ±  7%  perf-profile.calltrace.cycles-pp.__ip_queue_xmit.__tcp_transmit_skb.tcp_write_xmit.__tcp_push_pending_frames.tcp_rcv_established
      7.27            -4.1        3.15        perf-profile.calltrace.cycles-pp.ip_finish_output2.__ip_queue_xmit.__tcp_transmit_skb.tcp_recvmsg_locked.tcp_recvmsg
      5.85            -4.1        1.77 ±  4%  perf-profile.calltrace.cycles-pp.__tcp_transmit_skb.tcp_write_xmit.__tcp_push_pending_frames.tcp_rcv_established.tcp_v4_do_rcv
      6.95            -3.8        3.13        perf-profile.calltrace.cycles-pp.__dev_queue_xmit.ip_finish_output2.__ip_queue_xmit.__tcp_transmit_skb.tcp_recvmsg_locked
      6.42            -3.6        2.79 ±  3%  perf-profile.calltrace.cycles-pp.tcp_write_xmit.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg.__sys_sendto
      5.29            -3.4        1.88 ±  4%  perf-profile.calltrace.cycles-pp.__ip_queue_xmit.__tcp_transmit_skb.tcp_write_xmit.tcp_sendmsg_locked.tcp_sendmsg
      5.76            -3.3        2.42 ±  3%  perf-profile.calltrace.cycles-pp.__tcp_transmit_skb.tcp_write_xmit.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg
      4.96            -3.2        1.74 ±  3%  perf-profile.calltrace.cycles-pp.ip_finish_output2.__ip_queue_xmit.__tcp_transmit_skb.tcp_write_xmit.tcp_sendmsg_locked
      2.90            -2.1        0.79 ±  4%  perf-profile.calltrace.cycles-pp.tcp_stream_alloc_skb.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg.__sys_sendto
      2.41            -2.0        0.44 ± 44%  perf-profile.calltrace.cycles-pp.__alloc_skb.tcp_stream_alloc_skb.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg
      0.96 ±  4%      -0.5        0.45 ± 44%  perf-profile.calltrace.cycles-pp.__sk_mem_reduce_allocated.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg.sock_recvmsg
      0.96 ±  2%      +0.1        1.06        perf-profile.calltrace.cycles-pp.simple_copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.tcp_recvmsg_locked.tcp_recvmsg
      0.92 ±  2%      +0.2        1.14        perf-profile.calltrace.cycles-pp.tcp_ack.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv.ip_protocol_deliver_rcu
      0.75 ±  2%      +0.3        1.03 ±  2%  perf-profile.calltrace.cycles-pp.__check_object_size.simple_copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.tcp_recvmsg_locked
      0.59 ±  2%      +0.4        0.97 ±  2%  perf-profile.calltrace.cycles-pp.check_heap_object.__check_object_size.simple_copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter
      0.65            +0.4        1.06        perf-profile.calltrace.cycles-pp.tcp_clean_rtx_queue.tcp_ack.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv
     35.67            +0.5       36.18        perf-profile.calltrace.cycles-pp.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg.__sys_sendto.__x64_sys_sendto
      0.00            +0.5        0.52        perf-profile.calltrace.cycles-pp.__free_one_page.free_pcppages_bulk.free_unref_page.skb_release_data.skb_attempt_defer_free
      0.00            +0.8        0.75 ±  2%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.copyout._copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter
      0.00            +0.8        0.76 ±  2%  perf-profile.calltrace.cycles-pp.tcp_data_queue.tcp_rcv_established.tcp_v4_do_rcv.__release_sock.release_sock
      0.84 ±  3%      +0.8        1.60 ±  3%  perf-profile.calltrace.cycles-pp.mem_cgroup_charge_skmem.__sk_mem_raise_allocated.__sk_mem_schedule.tcp_wmem_schedule.tcp_sendmsg_locked
      0.00            +0.9        0.89 ±  2%  perf-profile.calltrace.cycles-pp.tcp_rcv_established.tcp_v4_do_rcv.__release_sock.release_sock.tcp_recvmsg
      0.00            +0.9        0.90 ±  2%  perf-profile.calltrace.cycles-pp.try_charge_memcg.mem_cgroup_charge_skmem.__sk_mem_raise_allocated.__sk_mem_schedule.tcp_wmem_schedule
      0.00            +1.0        0.98 ±  2%  perf-profile.calltrace.cycles-pp.tcp_v4_do_rcv.__release_sock.release_sock.tcp_recvmsg.inet_recvmsg
      0.00            +1.0        1.01        perf-profile.calltrace.cycles-pp.__release_sock.release_sock.tcp_recvmsg.inet_recvmsg.sock_recvmsg
      0.00            +1.0        1.03        perf-profile.calltrace.cycles-pp.free_unref_page_prepare.free_unref_page.skb_release_data.skb_attempt_defer_free.tcp_recvmsg_locked
      0.00            +1.1        1.06        perf-profile.calltrace.cycles-pp.release_sock.tcp_recvmsg.inet_recvmsg.sock_recvmsg.__sys_recvfrom
      0.00            +1.1        1.13        perf-profile.calltrace.cycles-pp.tcp_write_xmit.__tcp_push_pending_frames.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv
      0.00            +1.1        1.13        perf-profile.calltrace.cycles-pp.__tcp_push_pending_frames.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv.ip_protocol_deliver_rcu
      1.29 ±  2%      +1.6        2.94 ±  3%  perf-profile.calltrace.cycles-pp.tcp_wmem_schedule.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg.__sys_sendto
      1.17 ±  2%      +1.7        2.83 ±  4%  perf-profile.calltrace.cycles-pp.__sk_mem_raise_allocated.__sk_mem_schedule.tcp_wmem_schedule.tcp_sendmsg_locked.tcp_sendmsg
      1.24 ±  2%      +1.7        2.92 ±  3%  perf-profile.calltrace.cycles-pp.__sk_mem_schedule.tcp_wmem_schedule.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg
      0.00            +2.8        2.83 ±  7%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.rmqueue_bulk.rmqueue.get_page_from_freelist
      0.00            +2.9        2.87 ±  7%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.rmqueue_bulk.rmqueue.get_page_from_freelist.__alloc_pages
      0.00            +3.2        3.20 ±  6%  perf-profile.calltrace.cycles-pp.rmqueue_bulk.rmqueue.get_page_from_freelist.__alloc_pages.skb_page_frag_refill
      0.56            +3.5        4.07 ±  6%  perf-profile.calltrace.cycles-pp.__alloc_pages.skb_page_frag_refill.sk_page_frag_refill.tcp_sendmsg_locked.tcp_sendmsg
      0.00            +3.6        3.56 ±  6%  perf-profile.calltrace.cycles-pp.rmqueue.get_page_from_freelist.__alloc_pages.skb_page_frag_refill.sk_page_frag_refill
      0.96            +3.7        4.65 ±  5%  perf-profile.calltrace.cycles-pp.sk_page_frag_refill.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg.__sys_sendto
      0.92            +3.7        4.63 ±  5%  perf-profile.calltrace.cycles-pp.skb_page_frag_refill.sk_page_frag_refill.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg
      0.00            +3.9        3.88 ±  6%  perf-profile.calltrace.cycles-pp.get_page_from_freelist.__alloc_pages.skb_page_frag_refill.sk_page_frag_refill.tcp_sendmsg_locked
     93.44            +4.5       97.92        perf-profile.calltrace.cycles-pp.main.__libc_start_main
     93.51            +4.5       98.00        perf-profile.calltrace.cycles-pp.__libc_start_main
      9.42            +9.7       19.09        perf-profile.calltrace.cycles-pp.skb_do_copy_data_nocache.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg.__sys_sendto
      8.34            +9.8       18.09        perf-profile.calltrace.cycles-pp.copyin._copy_from_iter.skb_do_copy_data_nocache.tcp_sendmsg_locked.tcp_sendmsg
      8.67            +9.9       18.55        perf-profile.calltrace.cycles-pp._copy_from_iter.skb_do_copy_data_nocache.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg
      0.00           +10.0       10.04 ±  7%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.free_pcppages_bulk.free_unref_page.skb_release_data
      0.00           +10.2       10.21 ±  7%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.free_pcppages_bulk.free_unref_page.skb_release_data.skb_attempt_defer_free
      0.00           +10.8       10.82 ±  6%  perf-profile.calltrace.cycles-pp.free_pcppages_bulk.free_unref_page.skb_release_data.skb_attempt_defer_free.tcp_recvmsg_locked
      0.00           +12.2       12.17 ±  6%  perf-profile.calltrace.cycles-pp.free_unref_page.skb_release_data.skb_attempt_defer_free.tcp_recvmsg_locked.tcp_recvmsg
      0.00           +12.6       12.56 ±  5%  perf-profile.calltrace.cycles-pp.skb_release_data.skb_attempt_defer_free.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg
      0.00           +12.6       12.60 ±  5%  perf-profile.calltrace.cycles-pp.skb_attempt_defer_free.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg.sock_recvmsg
     37.01           +20.6       57.59        perf-profile.calltrace.cycles-pp.send_tcp_maerts.main.__libc_start_main
     36.96           +20.6       57.58        perf-profile.calltrace.cycles-pp.send_omni_inner.send_tcp_maerts.main.__libc_start_main
     35.76           +21.6       57.35        perf-profile.calltrace.cycles-pp.recv.send_omni_inner.send_tcp_maerts.main.__libc_start_main
     35.12           +22.0       57.10        perf-profile.calltrace.cycles-pp.__sys_recvfrom.__x64_sys_recvfrom.do_syscall_64.entry_SYSCALL_64_after_hwframe.recv
     35.23           +22.0       57.24        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.recv.send_omni_inner.send_tcp_maerts.main
     34.92           +22.4       57.32        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.recv.send_omni_inner.send_tcp_maerts
     34.72           +22.4       57.16        perf-profile.calltrace.cycles-pp.sock_recvmsg.__sys_recvfrom.__x64_sys_recvfrom.do_syscall_64.entry_SYSCALL_64_after_hwframe
     33.24           +22.6       55.85        perf-profile.calltrace.cycles-pp.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg.sock_recvmsg.__sys_recvfrom
     34.23           +22.9       57.09        perf-profile.calltrace.cycles-pp.inet_recvmsg.sock_recvmsg.__sys_recvfrom.__x64_sys_recvfrom.do_syscall_64
     33.99           +23.1       57.06        perf-profile.calltrace.cycles-pp.tcp_recvmsg.inet_recvmsg.sock_recvmsg.__sys_recvfrom.__x64_sys_recvfrom
     33.82           +23.3       57.12        perf-profile.calltrace.cycles-pp.__x64_sys_recvfrom.do_syscall_64.entry_SYSCALL_64_after_hwframe.recv.send_omni_inner
      8.98 ±  2%     +26.1       35.13        perf-profile.calltrace.cycles-pp.copyout._copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.tcp_recvmsg_locked
      9.20 ±  2%     +26.4       35.63        perf-profile.calltrace.cycles-pp._copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.tcp_recvmsg_locked.tcp_recvmsg
     10.62           +26.7       37.33        perf-profile.calltrace.cycles-pp.skb_copy_datagram_iter.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg.sock_recvmsg
     10.56           +26.7       37.31        perf-profile.calltrace.cycles-pp.__skb_datagram_iter.skb_copy_datagram_iter.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg
     31.95           -23.9        8.01        perf-profile.children.cycles-pp.__tcp_transmit_skb
     29.04           -22.0        7.06        perf-profile.children.cycles-pp.__ip_queue_xmit
     26.82           -20.1        6.71        perf-profile.children.cycles-pp.ip_finish_output2
     25.98           -19.4        6.57        perf-profile.children.cycles-pp.__dev_queue_xmit
     25.48           -18.4        7.04        perf-profile.children.cycles-pp.tcp_write_xmit
     58.14           -17.5       40.68        perf-profile.children.cycles-pp.__send
     21.24           -15.5        5.73        perf-profile.children.cycles-pp.__local_bh_enable_ip
     56.43           -15.4       40.99        perf-profile.children.cycles-pp.accept_connections
     56.43           -15.4       40.99        perf-profile.children.cycles-pp.accept_connection
     56.43           -15.4       40.99        perf-profile.children.cycles-pp.spawn_child
     56.43           -15.4       40.99        perf-profile.children.cycles-pp.process_requests
     56.40           -15.4       40.98        perf-profile.children.cycles-pp.recv_omni
     20.85           -15.2        5.67        perf-profile.children.cycles-pp.do_softirq
     19.17           -14.9        4.22 ±  2%  perf-profile.children.cycles-pp.__tcp_push_pending_frames
     20.57           -14.6        5.92        perf-profile.children.cycles-pp.__do_softirq
     20.12           -14.0        6.14 ±  2%  perf-profile.children.cycles-pp.tcp_v4_do_rcv
     19.66           -13.7        5.97 ±  2%  perf-profile.children.cycles-pp.tcp_rcv_established
     18.48           -13.6        4.88        perf-profile.children.cycles-pp.__napi_poll
     18.36           -13.5        4.87        perf-profile.children.cycles-pp.process_backlog
     19.11           -13.5        5.66        perf-profile.children.cycles-pp.net_rx_action
     17.41           -12.7        4.76        perf-profile.children.cycles-pp.__netif_receive_skb_one_core
     51.68           -12.3       39.40        perf-profile.children.cycles-pp.__x64_sys_sendto
     51.48           -12.1       39.36        perf-profile.children.cycles-pp.__sys_sendto
     12.87           -12.0        0.92 ±  4%  perf-profile.children.cycles-pp.__schedule
     49.97           -11.4       38.56        perf-profile.children.cycles-pp.sock_sendmsg
     49.50           -11.2       38.26        perf-profile.children.cycles-pp.tcp_sendmsg
     14.96           -10.6        4.39        perf-profile.children.cycles-pp.ip_local_deliver_finish
     14.90           -10.5        4.38        perf-profile.children.cycles-pp.ip_protocol_deliver_rcu
     13.32           -10.5        2.84 ±  4%  perf-profile.children.cycles-pp.release_sock
     14.56           -10.2        4.33        perf-profile.children.cycles-pp.tcp_v4_rcv
     12.58           -10.0        2.61 ±  4%  perf-profile.children.cycles-pp.__release_sock
     10.53            -9.7        0.79 ±  4%  perf-profile.children.cycles-pp.schedule
     10.01            -9.4        0.61 ±  5%  perf-profile.children.cycles-pp.sk_wait_data
      8.58            -7.9        0.68 ±  4%  perf-profile.children.cycles-pp.wait_woken
      8.23            -7.6        0.66 ±  4%  perf-profile.children.cycles-pp.schedule_timeout
      8.71 ±  3%      -6.9        1.78 ±  2%  perf-profile.children.cycles-pp.tcp_data_queue
      6.47 ±  4%      -6.0        0.42 ±  4%  perf-profile.children.cycles-pp.sock_def_readable
      6.32 ±  4%      -5.9        0.47 ±  3%  perf-profile.children.cycles-pp.__wake_up_common_lock
      6.02 ±  4%      -5.6        0.44 ±  3%  perf-profile.children.cycles-pp.__wake_up_common
      5.74 ±  5%      -5.3        0.40 ±  4%  perf-profile.children.cycles-pp.try_to_wake_up
      4.52            -4.0        0.55 ±  3%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      4.30            -3.8        0.48 ±  2%  perf-profile.children.cycles-pp.exit_to_user_mode_prepare
      3.59 ±  2%      -3.4        0.23 ±  4%  perf-profile.children.cycles-pp.ttwu_do_activate
      4.97            -3.3        1.68        perf-profile.children.cycles-pp.tcp_ack
      3.04            -2.9        0.15 ±  5%  perf-profile.children.cycles-pp.pick_next_task_fair
      3.51            -2.9        0.64 ±  3%  perf-profile.children.cycles-pp.__alloc_skb
      3.12            -2.8        0.28 ±  4%  perf-profile.children.cycles-pp.__cond_resched
      2.94 ±  2%      -2.8        0.19 ±  5%  perf-profile.children.cycles-pp.activate_task
      2.84 ±  3%      -2.7        0.18 ±  4%  perf-profile.children.cycles-pp.enqueue_task_fair
      2.81 ±  2%      -2.6        0.18 ±  4%  perf-profile.children.cycles-pp.dequeue_task_fair
      2.79            -2.5        0.30 ±  4%  perf-profile.children.cycles-pp.exit_to_user_mode_loop
      2.64            -2.5        0.17 ±  7%  perf-profile.children.cycles-pp.switch_mm_irqs_off
      3.27            -2.4        0.83 ±  2%  perf-profile.children.cycles-pp.tcp_stream_alloc_skb
      2.77            -2.3        0.46 ±  4%  perf-profile.children.cycles-pp.kmem_cache_alloc_node
      2.35 ±  2%      -2.2        0.15 ±  4%  perf-profile.children.cycles-pp.update_load_avg
      3.57            -2.1        1.44        perf-profile.children.cycles-pp.tcp_clean_rtx_queue
      1.90 ±  4%      -1.7        0.16 ±  4%  perf-profile.children.cycles-pp.update_curr
      1.95            -1.6        0.37 ±  3%  perf-profile.children.cycles-pp.dev_hard_start_xmit
      1.73 ±  2%      -1.5        0.22 ±  4%  perf-profile.children.cycles-pp.ip_rcv
      1.79            -1.5        0.34 ±  3%  perf-profile.children.cycles-pp.loopback_xmit
      1.54 ±  4%      -1.4        0.11 ±  4%  perf-profile.children.cycles-pp.enqueue_entity
      1.65            -1.4        0.26 ±  4%  perf-profile.children.cycles-pp.__kfree_skb
      1.32 ±  4%      -1.2        0.11 ±  6%  perf-profile.children.cycles-pp.dequeue_entity
      1.36            -1.2        0.15 ±  4%  perf-profile.children.cycles-pp.switch_fpu_return
      1.18            -1.1        0.06 ±  6%  perf-profile.children.cycles-pp.set_next_entity
      1.22 ±  2%      -1.1        0.11 ±  5%  perf-profile.children.cycles-pp.prepare_task_switch
      1.10 ±  3%      -1.0        0.12 ±  4%  perf-profile.children.cycles-pp.ip_rcv_finish_core
      1.10            -1.0        0.12 ±  3%  perf-profile.children.cycles-pp.restore_fpregs_from_fpstate
      1.03 ±  4%      -1.0        0.06 ± 18%  perf-profile.children.cycles-pp.dst_release
      1.92 ±  2%      -0.9        0.98 ±  4%  perf-profile.children.cycles-pp.__sk_mem_reduce_allocated
      1.01 ±  2%      -0.9        0.06 ±  7%  perf-profile.children.cycles-pp._raw_spin_lock
      0.96            -0.9        0.08 ±  4%  perf-profile.children.cycles-pp.__switch_to
      0.89 ±  4%      -0.8        0.08 ±  6%  perf-profile.children.cycles-pp.___perf_sw_event
      0.90            -0.8        0.10 ±  8%  perf-profile.children.cycles-pp.sched_clock_cpu
      0.85            -0.8        0.06 ±  7%  perf-profile.children.cycles-pp.__switch_to_asm
      0.84            -0.7        0.12 ±  4%  perf-profile.children.cycles-pp.irqtime_account_irq
      1.04 ±  6%      -0.7        0.34 ±  5%  perf-profile.children.cycles-pp.ktime_get
      0.98 ±  2%      -0.7        0.29        perf-profile.children.cycles-pp._raw_spin_lock_bh
      0.76            -0.7        0.08 ±  7%  perf-profile.children.cycles-pp.sched_clock
      0.79            -0.7        0.11 ±  5%  perf-profile.children.cycles-pp.__tcp_send_ack
      0.87 ±  4%      -0.6        0.23 ±  9%  perf-profile.children.cycles-pp.mem_cgroup_uncharge_skmem
      0.70 ± 11%      -0.6        0.06 ±  6%  perf-profile.children.cycles-pp.select_task_rq
      0.82            -0.6        0.19 ±  2%  perf-profile.children.cycles-pp.__inet_lookup_established
      0.68            -0.6        0.07 ±  5%  perf-profile.children.cycles-pp.native_sched_clock
      0.86            -0.6        0.30        perf-profile.children.cycles-pp.tcp_event_new_data_sent
      0.58 ± 13%      -0.6        0.03 ±100%  perf-profile.children.cycles-pp.select_task_rq_fair
      0.70            -0.5        0.15 ±  3%  perf-profile.children.cycles-pp.__netif_rx
      0.68            -0.5        0.13 ±  3%  perf-profile.children.cycles-pp.kmalloc_reserve
      1.04            -0.5        0.50        perf-profile.children.cycles-pp.sockfd_lookup_light
      0.67 ±  2%      -0.5        0.14        perf-profile.children.cycles-pp.tcp_mstamp_refresh
      0.66            -0.5        0.14 ±  3%  perf-profile.children.cycles-pp.netif_rx_internal
      0.78            -0.5        0.28 ±  2%  perf-profile.children.cycles-pp.kmem_cache_free
      0.68            -0.5        0.18 ±  2%  perf-profile.children.cycles-pp.read_tsc
      0.71            -0.5        0.22 ±  2%  perf-profile.children.cycles-pp.sk_reset_timer
      0.60            -0.5        0.14 ±  4%  perf-profile.children.cycles-pp.enqueue_to_backlog
      0.56            -0.5        0.10 ±  3%  perf-profile.children.cycles-pp.tcp_schedule_loss_probe
      0.65            -0.4        0.21 ±  2%  perf-profile.children.cycles-pp.__mod_timer
      0.52            -0.4        0.09 ±  6%  perf-profile.children.cycles-pp.validate_xmit_skb
      0.49            -0.4        0.08 ±  4%  perf-profile.children.cycles-pp.ip_output
      0.46            -0.4        0.07 ±  6%  perf-profile.children.cycles-pp.ip_rcv_core
      0.45            -0.4        0.06        perf-profile.children.cycles-pp._raw_spin_lock_irq
      0.50            -0.4        0.11 ±  6%  perf-profile.children.cycles-pp.__netif_receive_skb_core
      0.48 ±  3%      -0.4        0.10 ±  3%  perf-profile.children.cycles-pp.recv_data
      0.78            -0.4        0.40        perf-profile.children.cycles-pp.__fget_light
      0.44 ±  2%      -0.4        0.07        perf-profile.children.cycles-pp.ip_local_out
      0.39            -0.3        0.05 ±  8%  perf-profile.children.cycles-pp.update_rq_clock
      0.50 ±  4%      -0.3        0.16 ±  4%  perf-profile.children.cycles-pp.cgroup_rstat_updated
      0.60            -0.3        0.29 ±  2%  perf-profile.children.cycles-pp.__entry_text_start
      0.37 ±  2%      -0.3        0.06        perf-profile.children.cycles-pp.__ip_local_out
      0.42            -0.3        0.12        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.55 ±  2%      -0.3        0.28 ±  2%  perf-profile.children.cycles-pp.__virt_addr_valid
      0.33 ±  2%      -0.3        0.05        perf-profile.children.cycles-pp.update_cfs_group
      0.44            -0.3        0.16 ±  2%  perf-profile.children.cycles-pp.lock_sock_nested
      0.57            -0.3        0.31 ±  3%  perf-profile.children.cycles-pp.tcp_send_mss
      0.30 ±  2%      -0.3        0.05        perf-profile.children.cycles-pp.security_socket_recvmsg
      0.31 ±  4%      -0.3        0.06 ± 13%  perf-profile.children.cycles-pp.tcp_add_backlog
      0.54            -0.2        0.29 ±  3%  perf-profile.children.cycles-pp.tcp_current_mss
      0.44            -0.2        0.20 ±  2%  perf-profile.children.cycles-pp.aa_sk_perm
      0.29 ±  4%      -0.2        0.07 ±  7%  perf-profile.children.cycles-pp.__sk_dst_check
      0.50            -0.2        0.28 ±  7%  perf-profile.children.cycles-pp.send_data
      0.26            -0.2        0.04 ± 44%  perf-profile.children.cycles-pp.netif_skb_features
      0.32 ±  2%      -0.2        0.11        perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.26            -0.2        0.06 ±  6%  perf-profile.children.cycles-pp.sk_filter_trim_cap
      0.27 ±  4%      -0.2        0.07        perf-profile.children.cycles-pp.tcp_established_options
      0.31            -0.2        0.12 ±  4%  perf-profile.children.cycles-pp.tcp_rcv_space_adjust
      0.20 ±  2%      -0.2        0.04 ± 44%  perf-profile.children.cycles-pp.tcp_wfree
      0.36            -0.2        0.20 ±  2%  perf-profile.children.cycles-pp.__skb_clone
      0.24            -0.1        0.10        perf-profile.children.cycles-pp.rb_erase
      0.18 ±  2%      -0.1        0.06 ±  9%  perf-profile.children.cycles-pp.lock_timer_base
      0.24 ±  2%      -0.1        0.12        perf-profile.children.cycles-pp.__tcp_select_window
      1.63            -0.1        1.52        perf-profile.children.cycles-pp.__check_object_size
      0.15 ±  2%      -0.1        0.05        perf-profile.children.cycles-pp.rcu_all_qs
      0.14 ±  2%      -0.1        0.05        perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
      0.21 ±  3%      -0.1        0.13 ±  5%  perf-profile.children.cycles-pp.ipv4_mtu
      0.20 ±  3%      -0.1        0.12        perf-profile.children.cycles-pp.__list_add_valid
      0.14 ±  2%      -0.1        0.07 ±  6%  perf-profile.children.cycles-pp.alloc_pages
      0.12 ±  3%      -0.1        0.06        perf-profile.children.cycles-pp.check_stack_object
      0.53 ±  2%      -0.1        0.48        perf-profile.children.cycles-pp.__list_del_entry_valid
      0.31 ±  3%      -0.0        0.27 ±  2%  perf-profile.children.cycles-pp.tcp_check_space
      0.26 ±  2%      -0.0        0.22 ±  2%  perf-profile.children.cycles-pp.security_socket_sendmsg
      0.15 ±  3%      -0.0        0.12 ±  4%  perf-profile.children.cycles-pp._raw_spin_trylock
      0.19 ±  3%      -0.0        0.17 ±  2%  perf-profile.children.cycles-pp.tcp_tso_segs
      0.06 ±  6%      -0.0        0.04 ± 44%  perf-profile.children.cycles-pp.prep_compound_page
      0.07 ±  5%      -0.0        0.06 ±  6%  perf-profile.children.cycles-pp.__tcp_cleanup_rbuf
      0.14            +0.0        0.18 ±  2%  perf-profile.children.cycles-pp.kfree_skbmem
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.__run_timers
      0.00            +0.1        0.05 ±  7%  perf-profile.children.cycles-pp.ksys_write
      0.00            +0.1        0.05 ±  7%  perf-profile.children.cycles-pp.vfs_write
      0.01 ±223%      +0.1        0.06 ± 14%  perf-profile.children.cycles-pp.record__mmap_read_evlist
      0.00            +0.1        0.05 ± 13%  perf-profile.children.cycles-pp.record__pushfn
      0.00            +0.1        0.05 ± 13%  perf-profile.children.cycles-pp.writen
      0.00            +0.1        0.05 ± 13%  perf-profile.children.cycles-pp.__libc_write
      0.00            +0.1        0.06 ± 13%  perf-profile.children.cycles-pp.perf_mmap__push
      0.00            +0.1        0.06 ±  6%  perf-profile.children.cycles-pp.__mod_zone_page_state
      0.02 ±142%      +0.1        0.08 ±  8%  perf-profile.children.cycles-pp.run_builtin
      0.08 ±  4%      +0.1        0.14 ±  4%  perf-profile.children.cycles-pp.task_mm_cid_work
      0.30 ±  5%      +0.1        0.36 ±  5%  perf-profile.children.cycles-pp.perf_adjust_freq_unthr_context
      0.30 ±  4%      +0.1        0.36 ±  5%  perf-profile.children.cycles-pp.perf_event_task_tick
      0.08 ±  5%      +0.1        0.15 ±  4%  perf-profile.children.cycles-pp.task_work_run
      0.01 ±223%      +0.1        0.08 ±  9%  perf-profile.children.cycles-pp.cmd_record
      0.06 ±  7%      +0.1        0.14 ±  3%  perf-profile.children.cycles-pp.free_unref_page_commit
      1.00            +0.1        1.08        perf-profile.children.cycles-pp.simple_copy_to_iter
      0.06 ±  6%      +0.1        0.14 ±  5%  perf-profile.children.cycles-pp.task_tick_fair
      0.10 ±  4%      +0.1        0.19 ±  8%  perf-profile.children.cycles-pp.__intel_pmu_enable_all
      0.00            +0.1        0.09 ±  4%  perf-profile.children.cycles-pp.__slab_free
      0.00            +0.1        0.09        perf-profile.children.cycles-pp.sk_stream_write_space
      0.47            +0.1        0.57 ±  4%  perf-profile.children.cycles-pp.refill_stock
      0.00            +0.1        0.13 ± 10%  perf-profile.children.cycles-pp.propagate_protected_usage
      0.18 ±  3%      +0.1        0.32        perf-profile.children.cycles-pp.tcp_queue_rcv
      0.14 ±  3%      +0.2        0.28 ±  2%  perf-profile.children.cycles-pp.sock_rfree
      0.00            +0.2        0.15        perf-profile.children.cycles-pp.__zone_watermark_ok
      0.43 ±  5%      +0.2        0.61 ±  4%  perf-profile.children.cycles-pp.scheduler_tick
      0.00            +0.2        0.19        perf-profile.children.cycles-pp.sk_stream_wait_memory
      0.16 ±  3%      +0.2        0.35        perf-profile.children.cycles-pp.tcp_skb_entail
      0.52 ±  6%      +0.2        0.72 ±  4%  perf-profile.children.cycles-pp.update_process_times
      0.70 ±  3%      +0.2        0.92 ±  2%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.55 ±  6%      +0.2        0.76 ±  4%  perf-profile.children.cycles-pp.tick_sched_timer
      0.52 ±  6%      +0.2        0.74 ±  4%  perf-profile.children.cycles-pp.tick_sched_handle
      0.68 ±  4%      +0.2        0.90 ±  3%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.63 ±  4%      +0.2        0.85 ±  3%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.08 ±  4%      +0.2        0.30        perf-profile.children.cycles-pp.skb_clone
      1.07            +0.2        1.32        perf-profile.children.cycles-pp.check_heap_object
      0.00            +0.3        0.26        perf-profile.children.cycles-pp.skb_try_coalesce
      0.00            +0.3        0.28 ±  4%  perf-profile.children.cycles-pp.__irq_exit_rcu
      0.00            +0.3        0.28 ±  2%  perf-profile.children.cycles-pp.tcp_try_coalesce
      2.04 ±  3%      +0.4        2.39 ±  4%  perf-profile.children.cycles-pp.mem_cgroup_charge_skmem
      0.09 ± 12%      +0.4        0.46 ±  5%  perf-profile.children.cycles-pp.page_counter_uncharge
      0.09 ± 11%      +0.4        0.46 ±  5%  perf-profile.children.cycles-pp.drain_stock
      0.08 ±  4%      +0.4        0.45        perf-profile.children.cycles-pp.tcp_mtu_probe
      0.74 ±  3%      +0.4        1.16 ±  2%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.10 ± 10%      +0.5        0.57 ±  5%  perf-profile.children.cycles-pp.page_counter_try_charge
      0.00            +0.6        0.55        perf-profile.children.cycles-pp.__free_one_page
      0.00            +0.7        0.70 ±  3%  perf-profile.children.cycles-pp.napi_consume_skb
      0.79 ±  3%      +0.8        1.54 ±  2%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.00            +0.8        0.82 ±  2%  perf-profile.children.cycles-pp.tcp_try_rmem_schedule
      0.55            +0.9        1.47 ±  3%  perf-profile.children.cycles-pp.try_charge_memcg
      0.38 ±  2%      +1.0        1.33 ±  2%  perf-profile.children.cycles-pp.free_unref_page_prepare
      1.30 ±  2%      +1.7        3.02 ±  3%  perf-profile.children.cycles-pp.tcp_wmem_schedule
      1.20 ±  2%      +2.7        3.89 ±  2%  perf-profile.children.cycles-pp.__sk_mem_raise_allocated
      1.25 ±  2%      +2.7        3.99 ±  2%  perf-profile.children.cycles-pp.__sk_mem_schedule
      0.00            +3.3        3.26 ±  5%  perf-profile.children.cycles-pp.rmqueue_bulk
      0.24 ±  2%      +3.4        3.63 ±  4%  perf-profile.children.cycles-pp.rmqueue
      0.43            +3.5        3.96 ±  4%  perf-profile.children.cycles-pp.get_page_from_freelist
      0.57            +3.6        4.15 ±  4%  perf-profile.children.cycles-pp.__alloc_pages
      0.97            +3.8        4.74 ±  3%  perf-profile.children.cycles-pp.sk_page_frag_refill
      0.93            +3.8        4.71 ±  3%  perf-profile.children.cycles-pp.skb_page_frag_refill
     93.57            +4.5       98.03        perf-profile.children.cycles-pp.main
     93.51            +4.5       98.00        perf-profile.children.cycles-pp.__libc_start_main
     93.78            +4.5       98.32        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     93.10            +5.1       98.18        perf-profile.children.cycles-pp.do_syscall_64
      9.46            +9.7       19.14        perf-profile.children.cycles-pp.skb_do_copy_data_nocache
      8.44            +9.8       18.26        perf-profile.children.cycles-pp.copyin
      8.69            +9.9       18.56        perf-profile.children.cycles-pp._copy_from_iter
      0.00           +11.3       11.32 ±  6%  perf-profile.children.cycles-pp.free_pcppages_bulk
      1.54           +12.1       13.68 ±  5%  perf-profile.children.cycles-pp.skb_release_data
      0.54           +12.5       13.04 ±  5%  perf-profile.children.cycles-pp.free_unref_page
      0.21 ±  2%     +12.6       12.79 ±  6%  perf-profile.children.cycles-pp.skb_attempt_defer_free
      0.96           +12.8       13.80 ±  6%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      0.03 ± 70%     +13.4       13.44 ±  6%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
     38.94           +19.0       57.94        perf-profile.children.cycles-pp.recv
     37.22           +20.7       57.92        perf-profile.children.cycles-pp.send_tcp_maerts
     37.24           +20.7       57.95        perf-profile.children.cycles-pp.send_omni_inner
     36.37           +21.6       57.95        perf-profile.children.cycles-pp.__x64_sys_recvfrom
     36.23           +21.7       57.94        perf-profile.children.cycles-pp.__sys_recvfrom
     35.04           +22.7       57.74        perf-profile.children.cycles-pp.sock_recvmsg
     33.58           +22.9       56.50        perf-profile.children.cycles-pp.tcp_recvmsg_locked
     34.54           +23.1       57.67        perf-profile.children.cycles-pp.inet_recvmsg
     34.35           +23.3       57.65        perf-profile.children.cycles-pp.tcp_recvmsg
      9.34           +26.6       35.92        perf-profile.children.cycles-pp.copyout
      9.50           +26.6       36.09        perf-profile.children.cycles-pp._copy_to_iter
     10.86           +26.8       37.71        perf-profile.children.cycles-pp.skb_copy_datagram_iter
     10.82           +26.9       37.69        perf-profile.children.cycles-pp.__skb_datagram_iter
      2.60            -2.4        0.17 ±  7%  perf-profile.self.cycles-pp.switch_mm_irqs_off
      2.30 ±  3%      -1.6        0.67 ±  2%  perf-profile.self.cycles-pp.__dev_queue_xmit
      1.59            -1.4        0.16 ±  4%  perf-profile.self.cycles-pp.__schedule
      1.09 ±  3%      -1.0        0.12 ±  4%  perf-profile.self.cycles-pp.ip_rcv_finish_core
      1.09            -1.0        0.12 ±  3%  perf-profile.self.cycles-pp.restore_fpregs_from_fpstate
      1.00 ±  4%      -0.9        0.06 ± 13%  perf-profile.self.cycles-pp.dst_release
      0.98 ±  2%      -0.9        0.06        perf-profile.self.cycles-pp._raw_spin_lock
      0.98 ±  3%      -0.9        0.08 ±  6%  perf-profile.self.cycles-pp.update_curr
      1.17            -0.8        0.32 ±  4%  perf-profile.self.cycles-pp.kmem_cache_alloc_node
      0.92            -0.8        0.08 ±  6%  perf-profile.self.cycles-pp.__switch_to
      0.99            -0.8        0.18 ±  4%  perf-profile.self.cycles-pp.tcp_ack
      0.88 ±  3%      -0.8        0.07 ±  5%  perf-profile.self.cycles-pp.update_load_avg
      0.84            -0.8        0.06 ±  7%  perf-profile.self.cycles-pp.__switch_to_asm
      0.80 ±  4%      -0.7        0.06 ±  7%  perf-profile.self.cycles-pp.___perf_sw_event
      1.40            -0.7        0.70        perf-profile.self.cycles-pp.__tcp_transmit_skb
      0.87 ±  2%      -0.6        0.23        perf-profile.self.cycles-pp._raw_spin_lock_bh
      0.74            -0.6        0.13 ±  2%  perf-profile.self.cycles-pp.ip_finish_output2
      0.65            -0.6        0.07 ±  8%  perf-profile.self.cycles-pp.native_sched_clock
      0.68            -0.6        0.12 ±  5%  perf-profile.self.cycles-pp.tcp_v4_rcv
      0.70            -0.6        0.14 ±  2%  perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.62            -0.5        0.09 ±  4%  perf-profile.self.cycles-pp.__sys_recvfrom
      0.60            -0.5        0.08 ±  6%  perf-profile.self.cycles-pp.__do_softirq
      0.92            -0.5        0.40        perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.70 ±  6%      -0.5        0.19 ± 12%  perf-profile.self.cycles-pp.mem_cgroup_uncharge_skmem
      0.63            -0.5        0.14        perf-profile.self.cycles-pp.__ip_queue_xmit
      0.65            -0.5        0.17 ±  2%  perf-profile.self.cycles-pp.read_tsc
      0.76            -0.5        0.28 ±  2%  perf-profile.self.cycles-pp.kmem_cache_free
      0.64 ±  2%      -0.5        0.16 ±  3%  perf-profile.self.cycles-pp.__inet_lookup_established
      0.52            -0.5        0.06 ±  7%  perf-profile.self.cycles-pp.loopback_xmit
      0.52            -0.5        0.06        perf-profile.self.cycles-pp.net_rx_action
      0.50            -0.4        0.06 ±  6%  perf-profile.self.cycles-pp.process_backlog
      0.54 ±  2%      -0.4        0.11 ±  4%  perf-profile.self.cycles-pp.send_omni_inner
      0.79            -0.4        0.37 ±  2%  perf-profile.self.cycles-pp.__sys_sendto
      1.22 ±  4%      -0.4        0.80 ± 10%  perf-profile.self.cycles-pp.mem_cgroup_charge_skmem
      0.59            -0.4        0.19 ±  3%  perf-profile.self.cycles-pp.__sk_mem_reduce_allocated
      0.53            -0.4        0.14 ±  4%  perf-profile.self.cycles-pp.__alloc_skb
      0.45            -0.4        0.07 ±  6%  perf-profile.self.cycles-pp.ip_rcv_core
      0.43            -0.4        0.06 ±  6%  perf-profile.self.cycles-pp._raw_spin_lock_irq
      0.48            -0.4        0.11 ±  6%  perf-profile.self.cycles-pp.__netif_receive_skb_core
      0.76            -0.4        0.40        perf-profile.self.cycles-pp.__fget_light
      0.45 ±  5%      -0.3        0.15 ±  5%  perf-profile.self.cycles-pp.cgroup_rstat_updated
      0.38 ±  2%      -0.3        0.07 ±  5%  perf-profile.self.cycles-pp.recv_data
      0.46            -0.3        0.16 ±  3%  perf-profile.self.cycles-pp.__check_object_size
      0.35 ±  2%      -0.3        0.06 ±  9%  perf-profile.self.cycles-pp.__local_bh_enable_ip
      0.36            -0.3        0.06        perf-profile.self.cycles-pp.ip_output
      0.41            -0.3        0.12 ±  4%  perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.70            -0.3        0.42        perf-profile.self.cycles-pp.tcp_recvmsg_locked
      0.35            -0.3        0.06 ±  7%  perf-profile.self.cycles-pp.__cond_resched
      0.37            -0.3        0.10 ±  3%  perf-profile.self.cycles-pp.refill_stock
      0.41            -0.3        0.15 ±  2%  perf-profile.self.cycles-pp.tcp_rcv_established
      0.30 ±  3%      -0.3        0.04 ± 44%  perf-profile.self.cycles-pp.update_cfs_group
      0.56            -0.3        0.30        perf-profile.self.cycles-pp.tcp_clean_rtx_queue
      0.52 ±  3%      -0.3        0.26        perf-profile.self.cycles-pp.__virt_addr_valid
      0.38            -0.3        0.13 ±  2%  perf-profile.self.cycles-pp.do_syscall_64
      0.30 ±  3%      -0.2        0.06 ±  6%  perf-profile.self.cycles-pp.recv
      0.31            -0.2        0.07 ±  5%  perf-profile.self.cycles-pp.__mod_timer
      0.28            -0.2        0.05        perf-profile.self.cycles-pp.tcp_data_queue
      0.26            -0.2        0.05        perf-profile.self.cycles-pp.irqtime_account_irq
      0.32 ±  2%      -0.2        0.11        perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.50            -0.2        0.30        perf-profile.self.cycles-pp.recv_omni
      0.36 ± 17%      -0.2        0.16 ±  9%  perf-profile.self.cycles-pp.ktime_get
      0.42 ±  2%      -0.2        0.23 ±  3%  perf-profile.self.cycles-pp.__send
      0.24            -0.2        0.05        perf-profile.self.cycles-pp.tcp_event_new_data_sent
      0.25 ±  3%      -0.2        0.06 ±  7%  perf-profile.self.cycles-pp.tcp_established_options
      0.38            -0.2        0.19 ± 11%  perf-profile.self.cycles-pp.send_data
      0.23            -0.2        0.06 ±  6%  perf-profile.self.cycles-pp.enqueue_to_backlog
      0.34 ±  2%      -0.2        0.18 ±  2%  perf-profile.self.cycles-pp.aa_sk_perm
      0.52            -0.2        0.37        perf-profile.self.cycles-pp.skb_release_data
      0.70            -0.1        0.55 ±  2%  perf-profile.self.cycles-pp.tcp_write_xmit
      0.18 ±  3%      -0.1        0.05 ±  7%  perf-profile.self.cycles-pp.tcp_v4_do_rcv
      0.18 ±  2%      -0.1        0.05 ±  7%  perf-profile.self.cycles-pp.tcp_sendmsg
      0.22            -0.1        0.10        perf-profile.self.cycles-pp.rb_erase
      0.29 ±  3%      -0.1        0.17 ±  4%  perf-profile.self.cycles-pp.tcp_check_space
      0.17 ±  2%      -0.1        0.06 ±  6%  perf-profile.self.cycles-pp.release_sock
      0.22 ±  2%      -0.1        0.12 ±  4%  perf-profile.self.cycles-pp.__tcp_select_window
      0.15            -0.1        0.05        perf-profile.self.cycles-pp.sock_sendmsg
      0.21 ±  3%      -0.1        0.12 ±  3%  perf-profile.self.cycles-pp.tcp_current_mss
      0.20 ±  3%      -0.1        0.12 ±  5%  perf-profile.self.cycles-pp.ipv4_mtu
      0.25 ±  3%      -0.1        0.18 ±  2%  perf-profile.self.cycles-pp.__skb_clone
      0.09 ±  5%      -0.1        0.04 ± 44%  perf-profile.self.cycles-pp.check_stack_object
      0.16 ±  2%      -0.0        0.12 ±  4%  perf-profile.self.cycles-pp.__list_add_valid
      0.21 ±  2%      -0.0        0.17 ±  2%  perf-profile.self.cycles-pp.__entry_text_start
      0.13 ±  3%      -0.0        0.09        perf-profile.self.cycles-pp.sockfd_lookup_light
      0.14 ±  3%      -0.0        0.11        perf-profile.self.cycles-pp._raw_spin_trylock
      0.08 ±  4%      -0.0        0.05        perf-profile.self.cycles-pp.alloc_pages
      0.06            -0.0        0.05        perf-profile.self.cycles-pp.security_socket_sendmsg
      0.13 ±  2%      +0.0        0.15 ±  2%  perf-profile.self.cycles-pp.skb_do_copy_data_nocache
      0.16 ±  2%      +0.0        0.18 ±  3%  perf-profile.self.cycles-pp._copy_to_iter
      0.05            +0.0        0.08        perf-profile.self.cycles-pp.__sk_mem_schedule
      0.25            +0.0        0.29 ±  2%  perf-profile.self.cycles-pp._copy_from_iter
      0.14            +0.0        0.18 ±  2%  perf-profile.self.cycles-pp.__alloc_pages
      0.13            +0.0        0.18 ±  2%  perf-profile.self.cycles-pp.kfree_skbmem
      0.09 ±  5%      +0.0        0.14        perf-profile.self.cycles-pp.get_page_from_freelist
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.free_pcppages_bulk
      0.00            +0.1        0.06 ±  9%  perf-profile.self.cycles-pp.__mod_zone_page_state
      0.08 ±  6%      +0.1        0.14 ±  4%  perf-profile.self.cycles-pp.task_mm_cid_work
      0.05            +0.1        0.12 ±  3%  perf-profile.self.cycles-pp.free_unref_page_commit
      0.00            +0.1        0.08 ±  4%  perf-profile.self.cycles-pp.__slab_free
      0.10 ±  4%      +0.1        0.19 ±  8%  perf-profile.self.cycles-pp.__intel_pmu_enable_all
      0.00            +0.1        0.09        perf-profile.self.cycles-pp.rmqueue_bulk
      0.00            +0.1        0.13 ± 10%  perf-profile.self.cycles-pp.propagate_protected_usage
      0.10            +0.1        0.24 ±  3%  perf-profile.self.cycles-pp.rmqueue
      0.00            +0.1        0.15 ±  2%  perf-profile.self.cycles-pp.__zone_watermark_ok
      0.13 ±  2%      +0.2        0.28 ±  2%  perf-profile.self.cycles-pp.sock_rfree
      0.13 ±  3%      +0.2        0.30        perf-profile.self.cycles-pp.tcp_skb_entail
      0.28            +0.2        0.49        perf-profile.self.cycles-pp.__skb_datagram_iter
      0.07 ±  6%      +0.2        0.30 ±  2%  perf-profile.self.cycles-pp.skb_clone
      0.00            +0.3        0.25 ±  2%  perf-profile.self.cycles-pp.skb_try_coalesce
      0.21 ±  3%      +0.3        0.49 ±  2%  perf-profile.self.cycles-pp.skb_page_frag_refill
      0.08 ± 12%      +0.3        0.38 ±  6%  perf-profile.self.cycles-pp.page_counter_uncharge
      0.07 ±  8%      +0.4        0.44        perf-profile.self.cycles-pp.tcp_mtu_probe
      0.09 ± 11%      +0.4        0.51 ±  5%  perf-profile.self.cycles-pp.page_counter_try_charge
      0.00            +0.4        0.42 ±  2%  perf-profile.self.cycles-pp.__free_one_page
      0.42            +0.4        0.87 ±  2%  perf-profile.self.cycles-pp.try_charge_memcg
      0.30            +0.7        0.99        perf-profile.self.cycles-pp.check_heap_object
      0.32 ±  2%      +1.0        1.28        perf-profile.self.cycles-pp.free_unref_page_prepare
      0.31 ±  2%      +1.2        1.54 ±  4%  perf-profile.self.cycles-pp.__sk_mem_raise_allocated
      1.28            +1.6        2.90        perf-profile.self.cycles-pp.tcp_sendmsg_locked
      8.36            +9.7       18.05        perf-profile.self.cycles-pp.copyin
      0.03 ± 70%     +13.4       13.43 ±  6%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      9.26           +26.2       35.41        perf-profile.self.cycles-pp.copyout


***************************************************************************************************
lkp-spr-r02: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory
=========================================================================================
compiler/cpufreq_governor/iterations/kconfig/message_threads/rootfs/runtime/tbox_group/testcase/worker_threads:
  gcc-12/performance/3x/x86_64-rhel-8.3/1/debian-11.1-x86_64-20220510.cgz/30s/lkp-spr-r02/schbench/512

commit: 
  e0c2ff903c ("sched/fair: Remove sched_feat(START_DEBIT)")
  86bfbb7ce4 ("sched/fair: Add lag based placement")

e0c2ff903c320d3f 86bfbb7ce4f67a88df263919816 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
   1195622           +25.8%    1503508        cpuidle..usage
    350642           -16.3%     293513 ±  3%  meminfo.Mapped
     58.00           -15.5%      49.00 ± 11%  perf-c2c.DRAM.local
     10370           -58.8%       4271 ± 10%  perf-c2c.HITM.local
     10876           -55.9%       4801 ±  9%  perf-c2c.HITM.total
    443.00           -14.3%     379.80 ±  2%  vmstat.procs.r
    116616           -19.2%      94178        vmstat.system.cs
    308710            -1.9%     302906        vmstat.system.in
      2.64            -0.3        2.34        mpstat.cpu.all.idle%
      1.43            +0.3        1.69        mpstat.cpu.all.irq%
      0.03            +0.0        0.04 ±  2%  mpstat.cpu.all.soft%
      0.37            +0.0        0.40        mpstat.cpu.all.sys%
     65575           -45.0%      36087 ± 34%  numa-vmstat.node0.nr_anon_pages
     53614           +11.9%      59984 ±  3%  numa-vmstat.node0.nr_slab_unreclaimable
     31245           +96.5%      61388 ± 20%  numa-vmstat.node1.nr_anon_pages
     52749           -10.3%      47315 ±  2%  numa-vmstat.node1.nr_slab_unreclaimable
      5681           +21.6%       6907 ±  5%  turbostat.C1
    908159           +38.2%    1255329        turbostat.C1E
      1.55            +0.2        1.79 ±  2%  turbostat.C1E%
    271572           -14.9%     231143 ±  3%  turbostat.C6
      1.28            -0.2        1.05 ±  3%  turbostat.C6%
     81519           -53.4%      37952 ± 56%  numa-meminfo.node0.AnonHugePages
    262283           -44.9%     144549 ± 34%  numa-meminfo.node0.AnonPages
    214455           +11.9%     239944 ±  3%  numa-meminfo.node0.SUnreclaim
     34749          +148.1%      86209 ± 26%  numa-meminfo.node1.AnonHugePages
    124965           +96.6%     245691 ± 20%  numa-meminfo.node1.AnonPages
      4885           +13.8%       5557 ±  9%  numa-meminfo.node1.PageTables
    210990           -10.3%     189265 ±  2%  numa-meminfo.node1.SUnreclaim
    134799            +6.5%     143556        proc-vmstat.nr_active_anon
    142358            -6.1%     133676        proc-vmstat.nr_inactive_anon
     88076           -17.1%      73050 ±  3%  proc-vmstat.nr_mapped
    134799            +6.5%     143556        proc-vmstat.nr_zone_active_anon
    142358            -6.1%     133676        proc-vmstat.nr_zone_inactive_anon
    112573            -8.1%     103471 ±  4%  proc-vmstat.numa_hint_faults
     68878           -12.6%      60202 ±  5%  proc-vmstat.numa_hint_faults_local
   1007535            -1.4%     993925        proc-vmstat.pgfault
   7666911        +15001.5%  1.158e+09 ±111%  sched_debug.cfs_rq:/.avg_vruntime.avg
   9078843        +1.8e+06%  1.621e+11 ±182%  sched_debug.cfs_rq:/.avg_vruntime.max
    174389        +6.7e+06%   1.16e+10 ±167%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      1.08           -12.2%       0.94 ±  2%  sched_debug.cfs_rq:/.h_nr_running.avg
    206209           -97.5%       5183 ± 32%  sched_debug.cfs_rq:/.load.avg
  45460520           -99.3%     333229 ± 75%  sched_debug.cfs_rq:/.load.max
   3031213           -99.1%      26366 ± 72%  sched_debug.cfs_rq:/.load.stddev
      1.00           -50.0%       0.50        sched_debug.cfs_rq:/.load_avg.min
   7666911        +14999.5%  1.158e+09 ±111%  sched_debug.cfs_rq:/.min_vruntime.avg
   9078840        +1.8e+06%  1.621e+11 ±182%  sched_debug.cfs_rq:/.min_vruntime.max
    174389        +6.7e+06%   1.16e+10 ±167%  sched_debug.cfs_rq:/.min_vruntime.stddev
      4174           -37.1%       2627 ± 51%  sched_debug.cfs_rq:/.removed.load_avg.stddev
      1120           -12.4%     981.59 ±  2%  sched_debug.cfs_rq:/.runnable_avg.avg
    397.00           -23.8%     302.50 ± 21%  sched_debug.cfs_rq:/.runnable_avg.min
    521.73           -15.4%     441.52 ±  7%  sched_debug.cfs_rq:/.runnable_avg.stddev
    485.78           -13.1%     422.17 ±  2%  sched_debug.cfs_rq:/.util_est_enqueued.avg
    538915           +13.2%     609784        sched_debug.cpu.avg_idle.avg
     66152           -33.0%      44330 ± 18%  sched_debug.cpu.avg_idle.min
    142217           +20.8%     171742 ±  3%  sched_debug.cpu.avg_idle.stddev
      1.07           -12.1%       0.94 ±  2%  sched_debug.cpu.nr_running.avg
      0.57            -7.6%       0.53 ±  5%  sched_debug.cpu.nr_running.stddev
     17108           -18.8%      13891        sched_debug.cpu.nr_switches.avg
     15060           -18.3%      12306        sched_debug.cpu.nr_switches.min
     74.00           -57.4%      31.50 ± 22%  sched_debug.cpu.nr_uninterruptible.max
  29305629          +300.0%  1.172e+08        sched_debug.sysctl_sched.sysctl_sched_features
      9360           -23.5%       7163        schbench.request_end_latency_50%_us_max
      4.00            -2.6        1.43 ± 46%  schbench.request_end_latency_50%_us_stddev%
     15600           -26.4%      11484        schbench.request_end_latency_90%_us_max
      2.35            -1.7        0.69 ± 20%  schbench.request_end_latency_90%_us_stddev%
     31776           -37.2%      19948        schbench.request_end_latency_99%_us_max
     48320           +30.4%      62988 ±  2%  schbench.request_end_latency_99.9%_us_max
      8926           -20.8%       7067        schbench.request_latency_50%_us
      8.10            -5.8        2.25 ± 26%  schbench.request_latency_50%_us_stddev%
     15185           -24.4%      11478        schbench.request_latency_90%_us
      5.54            -3.3        2.19 ± 12%  schbench.request_latency_90%_us_stddev%
     30888           -35.2%      20004        schbench.request_latency_99%_us
      5.31            -1.4        3.92 ± 15%  schbench.request_latency_99%_us_stddev%
     47317           +33.0%      62912        schbench.request_latency_99.9%_us
      4.11            +3.8        7.88 ±  8%  schbench.request_latency_99.9%_us_stddev%
    117948          +295.5%     466460 ± 27%  schbench.request_latency_max_us
   2063224           -80.6%     401223        schbench.time.involuntary_context_switches
     16508            -8.9%      15040 ±  6%  schbench.time.maximum_resident_set_size
     21855            -1.0%      21632        schbench.time.percent_of_cpu_this_job_got
     64.99            +8.6%      70.59        schbench.time.system_time
   7876580            -8.7%    7188070        schbench.time.voluntary_context_switches
      2620            +9.8%       2877        schbench.wakeup_end_latency_50%_us_max
      8.92            -6.0        2.93 ± 43%  schbench.wakeup_end_latency_50%_us_stddev%
      5896            -8.5%       5396        schbench.wakeup_end_latency_90%_us_max
     11248           -18.5%       9161        schbench.wakeup_end_latency_99%_us_max
     15472           -21.5%      12144        schbench.wakeup_end_latency_99.9%_us_max
      1.29            +0.8        2.05 ± 16%  schbench.wakeup_end_latency_99.9%_us_stddev%
      2333           +20.0%       2799        schbench.wakeup_latency_50%_us
     14.03            -8.4        5.59 ± 16%  schbench.wakeup_latency_50%_us_stddev%
      5884            -8.6%       5378        schbench.wakeup_latency_90%_us
      3.09            -1.4        1.67 ± 24%  schbench.wakeup_latency_90%_us_stddev%
     11008           -17.1%       9120        schbench.wakeup_latency_99%_us
      2.07            +1.1        3.16 ± 15%  schbench.wakeup_latency_99%_us_stddev%
     15329           -20.4%      12206        schbench.wakeup_latency_99.9%_us
     33937          +422.8%     177412 ± 13%  schbench.wakeup_latency_max_us
      0.05            +8.0%       0.05        perf-stat.i.MPKI
      0.02            +0.0        0.02        perf-stat.i.branch-miss-rate%
  43896948           +16.0%   50906121        perf-stat.i.branch-misses
     10.74            -0.4       10.30        perf-stat.i.cache-miss-rate%
   9169314           +11.0%   10182328 ±  2%  perf-stat.i.cache-misses
  82082964           +16.8%   95852617        perf-stat.i.cache-references
    120322           -19.5%      96881        perf-stat.i.context-switches
      0.35            -1.8%       0.34        perf-stat.i.cpi
    224415            +1.2%     227026        perf-stat.i.cpu-clock
     40163           +13.2%      45465        perf-stat.i.cpu-migrations
     78737           -14.4%      67379        perf-stat.i.cycles-between-cache-misses
      0.00            -0.0        0.00 ±  5%  perf-stat.i.dTLB-load-miss-rate%
 4.442e+11            +1.4%  4.504e+11        perf-stat.i.dTLB-loads
      0.00            +0.0        0.00        perf-stat.i.dTLB-store-miss-rate%
   1687654           +11.3%    1878541        perf-stat.i.dTLB-store-misses
 2.246e+11            +1.1%  2.271e+11        perf-stat.i.dTLB-stores
 1.777e+12            +1.6%  1.806e+12        perf-stat.i.instructions
      2.85            +1.9%       2.91        perf-stat.i.ipc
      2.78            -1.0%       2.75        perf-stat.i.metric.GHz
    384.38           +15.1%     442.61        perf-stat.i.metric.K/sec
    162.95           +37.6%     224.18 ± 20%  perf-stat.i.metric.M/sec
     10629            +7.9%      11470 ±  3%  perf-stat.i.minor-faults
   2569157           +23.5%    3174165        perf-stat.i.node-load-misses
    114983           +14.4%     131556 ±  9%  perf-stat.i.node-loads
     10630            +7.9%      11470 ±  3%  perf-stat.i.page-faults
    224415            +1.2%     227026        perf-stat.i.task-clock
      0.05           +13.7%       0.05        perf-stat.overall.MPKI
      0.02            +0.0        0.02        perf-stat.overall.branch-miss-rate%
     11.14            -0.6       10.52        perf-stat.overall.cache-miss-rate%
      0.35            -1.9%       0.34        perf-stat.overall.cpi
     67914            -8.7%      62020        perf-stat.overall.cycles-between-cache-misses
      0.00            -0.0        0.00 ±  4%  perf-stat.overall.dTLB-load-miss-rate%
      0.00            +0.0        0.00        perf-stat.overall.dTLB-store-miss-rate%
      2.86            +2.0%       2.91        perf-stat.overall.ipc
  43267048           +15.2%   49837465        perf-stat.ps.branch-misses
   9045293            +8.2%    9787921        perf-stat.ps.cache-misses
  81160617           +14.6%   92998097        perf-stat.ps.cache-references
    118674           -20.2%      94707        perf-stat.ps.context-switches
 6.143e+11            -1.2%   6.07e+11        perf-stat.ps.cpu-cycles
     39666           +12.1%      44470        perf-stat.ps.cpu-migrations
   2876084            -8.7%    2625751 ±  4%  perf-stat.ps.dTLB-load-misses
   1662698            +9.3%    1817420        perf-stat.ps.dTLB-store-misses
      0.15           -45.4%       0.08 ± 44%  perf-stat.ps.major-faults
     10356            -3.3%      10017        perf-stat.ps.minor-faults
   2540136           +21.5%    3086649        perf-stat.ps.node-load-misses
    112971            +9.3%     123455 ±  6%  perf-stat.ps.node-loads
     10356            -3.3%      10017        perf-stat.ps.page-faults
      9.72            -6.4        3.33 ±200%  perf-profile.calltrace.cycles-pp.poll_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      6.94            -5.4        1.52 ± 61%  perf-profile.calltrace.cycles-pp.asm_exc_page_fault
      6.95            -4.6        2.32 ± 38%  perf-profile.calltrace.cycles-pp.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      5.56            -4.0        1.52 ± 61%  perf-profile.calltrace.cycles-pp.exc_page_fault.asm_exc_page_fault
      5.56            -4.0        1.52 ± 61%  perf-profile.calltrace.cycles-pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      5.56            -4.0        1.52 ± 61%  perf-profile.calltrace.cycles-pp.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
     12.50            -3.8        8.73 ± 22%  perf-profile.calltrace.cycles-pp.event_function_call.perf_event_release_kernel.perf_release.__fput.task_work_run
     12.50            -3.8        8.73 ± 22%  perf-profile.calltrace.cycles-pp.smp_call_function_single.event_function_call.perf_event_release_kernel.perf_release.__fput
      4.17            -3.4        0.81 ± 82%  perf-profile.calltrace.cycles-pp.do_fault.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault
      4.17            -3.3        0.82 ± 82%  perf-profile.calltrace.cycles-pp.__memcpy.vsnprintf.seq_printf.show_interrupts.seq_read_iter
      2.78            -2.0        0.81 ± 82%  perf-profile.calltrace.cycles-pp.do_read_fault.do_fault.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      4.17            -1.8        2.38 ± 39%  perf-profile.calltrace.cycles-pp.ring_buffer_read_head.perf_mmap__read_head.perf_mmap__push.record__mmap_read_evlist.__cmd_record
      2.78            -1.8        0.99 ± 90%  perf-profile.calltrace.cycles-pp.lookup_open.open_last_lookups.path_openat.do_filp_open.do_sys_openat2
      2.78            -1.8        1.02 ± 50%  perf-profile.calltrace.cycles-pp.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault
      0.00            +1.6        1.61 ± 39%  perf-profile.calltrace.cycles-pp.free_pgtables.exit_mmap.__mmput.exit_mm.do_exit
      0.00            +1.6        1.63 ± 43%  perf-profile.calltrace.cycles-pp.mm_init.dup_mm.copy_process.kernel_clone.__do_sys_clone
      1.39            +2.4        3.77 ± 55%  perf-profile.calltrace.cycles-pp.mutex_lock.swevent_hlist_put_cpu.sw_perf_event_destroy._free_event.perf_event_release_kernel
      1.39            +2.4        3.77 ± 55%  perf-profile.calltrace.cycles-pp.swevent_hlist_put_cpu.sw_perf_event_destroy._free_event.perf_event_release_kernel.perf_release
      2.78            +2.5        5.28 ± 46%  perf-profile.calltrace.cycles-pp.proc_single_show.seq_read_iter.seq_read.vfs_read.ksys_read
      0.00            +2.6        2.59 ± 48%  perf-profile.calltrace.cycles-pp.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +2.6        2.59 ± 48%  perf-profile.calltrace.cycles-pp.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.78            +2.7        5.51 ± 44%  perf-profile.calltrace.cycles-pp.seq_read_iter.seq_read.vfs_read.ksys_read.do_syscall_64
      2.78            +2.7        5.51 ± 44%  perf-profile.calltrace.cycles-pp.seq_read.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.39            +3.0        4.40 ± 17%  perf-profile.calltrace.cycles-pp.arch_show_interrupts.seq_read_iter.proc_reg_read_iter.vfs_read.ksys_read
      2.78            +4.2        7.02 ± 19%  perf-profile.calltrace.cycles-pp.do_filp_open.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.78            +4.2        7.02 ± 19%  perf-profile.calltrace.cycles-pp.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat.do_syscall_64
      9.72            -6.4        3.33 ±200%  perf-profile.children.cycles-pp.poll_idle
      6.94            -4.6        2.32 ± 38%  perf-profile.children.cycles-pp.__handle_mm_fault
      6.94            -4.6        2.32 ± 38%  perf-profile.children.cycles-pp.handle_mm_fault
     12.50            -3.8        8.73 ± 22%  perf-profile.children.cycles-pp.event_function_call
     12.50            -3.8        8.73 ± 22%  perf-profile.children.cycles-pp.smp_call_function_single
      8.33            -3.4        4.96 ± 21%  perf-profile.children.cycles-pp.asm_exc_page_fault
      4.17            -3.4        0.81 ± 82%  perf-profile.children.cycles-pp.do_fault
      6.94            -2.8        4.13 ± 41%  perf-profile.children.cycles-pp.exc_page_fault
      6.94            -2.8        4.13 ± 41%  perf-profile.children.cycles-pp.do_user_addr_fault
      4.17            -2.6        1.61 ± 39%  perf-profile.children.cycles-pp.__memcpy
      6.94            -2.2        4.76 ± 27%  perf-profile.children.cycles-pp.ksys_write
      6.94            -2.2        4.76 ± 27%  perf-profile.children.cycles-pp.vfs_write
      2.78            -2.0        0.73 ± 81%  perf-profile.children.cycles-pp.mutex_unlock
      2.78            -2.0        0.81 ± 82%  perf-profile.children.cycles-pp.do_read_fault
      2.78            -1.8        0.99 ± 90%  perf-profile.children.cycles-pp.lookup_open
      2.78            -1.8        1.02 ± 50%  perf-profile.children.cycles-pp.wp_page_copy
      0.00            +2.2        2.16 ± 58%  perf-profile.children.cycles-pp.__percpu_counter_init
      1.39            +2.4        3.77 ± 55%  perf-profile.children.cycles-pp.swevent_hlist_put_cpu
      0.00            +2.4        2.40 ± 45%  perf-profile.children.cycles-pp.free_pgtables
      2.78            +2.5        5.28 ± 46%  perf-profile.children.cycles-pp.proc_single_show
      1.39            +2.6        4.03 ± 54%  perf-profile.children.cycles-pp.mutex_lock
      2.78            +2.7        5.51 ± 44%  perf-profile.children.cycles-pp.seq_read
      1.39            +3.0        4.40 ± 17%  perf-profile.children.cycles-pp.arch_show_interrupts
      2.78            +4.2        7.01 ± 19%  perf-profile.children.cycles-pp.do_filp_open
      2.78            +4.2        7.01 ± 19%  perf-profile.children.cycles-pp.path_openat
      2.78            +4.7        7.51 ± 26%  perf-profile.children.cycles-pp.__x64_sys_openat
      2.78            +4.7        7.51 ± 26%  perf-profile.children.cycles-pp.do_sys_openat2
      9.72            -6.4        3.33 ±200%  perf-profile.self.cycles-pp.poll_idle
     11.11            -2.9        8.18 ± 17%  perf-profile.self.cycles-pp.smp_call_function_single
      2.78            -2.0        0.73 ± 81%  perf-profile.self.cycles-pp.mutex_unlock
      1.39            +1.6        2.99 ± 68%  perf-profile.self.cycles-pp.number
      0.00            +2.9        2.92 ± 46%  perf-profile.self.cycles-pp.mutex_lock
      0.01          -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.inotify_handle_inode_event.send_to_group
      0.01          -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.copy_pte_range.copy_p4d_range.copy_page_range.dup_mmap
      6.15          -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.filemap_read.__kernel_read.search_binary_handler.exec_binprm
      1.28           -92.3%       0.10 ±200%  perf-sched.sch_delay.avg.ms.__cond_resched.migrate_pages_batch.migrate_pages.migrate_misplaced_page.do_numa_page
      2.85          -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.rmap_walk_anon.migrate_pages_batch.migrate_pages.migrate_misplaced_page
      0.01          +867.5%       0.08 ± 53%  perf-sched.sch_delay.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      2.86          -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_gem_fb_vunmap.drm_atomic_helper_cleanup_planes
      0.02         +5854.5%       1.31 ± 20%  perf-sched.sch_delay.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      1.67           +75.3%       2.93        perf-sched.sch_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.00        +27520.0%       0.83 ± 22%  perf-sched.sch_delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      0.06          +941.7%       0.62 ± 30%  perf-sched.sch_delay.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      0.95           +70.8%       1.62 ±  2%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      0.67          +350.2%       3.00 ± 30%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function
      0.76          +235.5%       2.56 ±  8%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
      0.00          -100.0%       0.00        perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_irq_work
      1.00          +153.0%       2.53 ±  5%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      3.42           -33.4%       2.28 ±  6%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      1.27           +88.5%       2.39        perf-sched.sch_delay.avg.ms.futex_wait_queue.futex_wait.do_futex.__x64_sys_futex
      0.01        +14463.6%       1.60 ± 28%  perf-sched.sch_delay.avg.ms.io_schedule.migration_entry_wait_on_locked.migration_entry_wait.do_swap_page
      0.53           -42.3%       0.30 ± 50%  perf-sched.sch_delay.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      0.00        +17100.0%       0.17 ± 51%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      0.08          +148.7%       0.19 ± 34%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      2.42          +459.5%      13.51 ±110%  perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.exit_mm
      0.02         +5092.7%       1.14 ± 11%  perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.01          +368.9%       0.04 ±106%  perf-sched.sch_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.11          +103.8%       0.23 ± 51%  perf-sched.sch_delay.avg.ms.syslog_print.do_syslog.kmsg_read.vfs_read
      0.00        +18050.0%       0.36 ± 30%  perf-sched.sch_delay.avg.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
      0.10         +5567.7%       5.44 ± 98%  perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.02          -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.inotify_handle_inode_event.send_to_group
      0.01        +2.5e+05%      22.79 ±100%  perf-sched.sch_delay.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      0.01          -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.copy_pte_range.copy_p4d_range.copy_page_range.dup_mmap
      6.15          -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.filemap_read.__kernel_read.search_binary_handler.exec_binprm
      2.92           -96.6%       0.10 ±200%  perf-sched.sch_delay.max.ms.__cond_resched.migrate_pages_batch.migrate_pages.migrate_misplaced_page.do_numa_page
      5.70          -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.rmap_walk_anon.migrate_pages_batch.migrate_pages.migrate_misplaced_page
     11.05           -54.5%       5.03 ± 34%  perf-sched.sch_delay.max.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      2.86          -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_gem_fb_vunmap.drm_atomic_helper_cleanup_planes
      0.43         +2189.5%       9.89 ± 26%  perf-sched.sch_delay.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
    441.94           -29.0%     313.89 ± 13%  perf-sched.sch_delay.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.02        +39268.6%       8.27 ± 31%  perf-sched.sch_delay.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      0.83          +688.3%       6.57 ± 52%  perf-sched.sch_delay.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
    322.38           -27.7%     233.22 ± 24%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      0.01          -100.0%       0.00        perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_irq_work
    317.00           -39.6%     191.38 ± 25%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
    420.76           -22.4%     326.61 ± 15%  perf-sched.sch_delay.max.ms.futex_wait_queue.futex_wait.do_futex.__x64_sys_futex
      0.03        +30069.0%       9.35 ± 48%  perf-sched.sch_delay.max.ms.io_schedule.migration_entry_wait_on_locked.migration_entry_wait.do_swap_page
    998.79           -98.5%      15.10 ± 92%  perf-sched.sch_delay.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      0.01        +1.1e+05%      14.59 ± 98%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      8.80          +503.9%      53.12 ± 42%  perf-sched.sch_delay.max.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.exit_mm
      0.94          +591.9%       6.50 ± 26%  perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.01        +72406.7%       4.35 ± 35%  perf-sched.sch_delay.max.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
     11.44         +8268.2%     957.40 ± 57%  perf-sched.sch_delay.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      1.42           +83.1%       2.61 ±  2%  perf-sched.total_sch_delay.average.ms
      9.78           +19.7%      11.72        perf-sched.total_wait_and_delay.average.ms
    472047           -12.5%     413244        perf-sched.total_wait_and_delay.count.ms
      8.36            +8.9%       9.11 ±  2%  perf-sched.total_wait_time.average.ms
      1000          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.copy_pte_range.copy_p4d_range.copy_page_range.dup_mmap
    135.28          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_gem_fb_vunmap.drm_atomic_helper_cleanup_planes
      2.24           +67.4%       3.75 ±  2%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      1.87          +214.9%       5.89 ±  4%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
      2.39          +139.5%       5.73 ±  4%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      7.80           -14.7%       6.66 ±  3%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      2.97           +75.9%       5.22        perf-sched.wait_and_delay.avg.ms.futex_wait_queue.futex_wait.do_futex.__x64_sys_futex
     33.83          +418.5%     175.42 ± 40%  perf-sched.wait_and_delay.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
    612.12           +20.0%     734.42 ±  4%  perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      5.00           -96.0%       0.20 ±200%  perf-sched.wait_and_delay.count.__cond_resched.__wait_for_common.stop_two_cpus.migrate_swap.task_numa_migrate
      1.00          -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.copy_pte_range.copy_p4d_range.copy_page_range.dup_mmap
     30.00           -92.7%       2.20 ± 92%  perf-sched.wait_and_delay.count.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1.00          -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_gem_fb_vunmap.drm_atomic_helper_cleanup_planes
      6.00           -36.7%       3.80 ± 51%  perf-sched.wait_and_delay.count.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     30240           -66.1%      10255        perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
     13007           -82.3%       2296 ±  2%  perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
     13946           -77.3%       3160 ± 11%  perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
     11631           -73.0%       3145 ±  6%  perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      1910           -77.9%     421.60 ± 50%  perf-sched.wait_and_delay.count.pipe_read.vfs_read.ksys_read.do_syscall_64
    202.00           -10.3%     181.20 ±  3%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      1773           -19.5%       1427 ± 11%  perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1000          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.copy_pte_range.copy_p4d_range.copy_page_range.dup_mmap
      4130           -70.2%       1229 ± 96%  perf-sched.wait_and_delay.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    135.28          -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_gem_fb_vunmap.drm_atomic_helper_cleanup_planes
      1000           +81.9%       1818 ± 22%  perf-sched.wait_and_delay.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
    644.88           -49.2%     327.53 ± 19%  perf-sched.wait_and_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
    652.95           -50.2%     325.48 ± 53%  perf-sched.wait_and_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      0.20          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.do_anonymous_page
      3.14           -99.9%       0.00 ±200%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.__get_free_pages.__pollwait.perf_poll
      0.02          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.inotify_handle_inode_event.send_to_group
      1000          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.copy_pte_range.copy_p4d_range.copy_page_range.dup_mmap
      3.45          +111.9%       7.31 ± 22%  perf-sched.wait_time.avg.ms.__cond_resched.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
      0.04          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.mmput.exec_mmap.begin_new_exec.load_elf_binary
      2.36          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.perf_event_ctx_lock_nested.constprop.0
      2.91          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.rmap_walk_anon.migrate_pages_batch.migrate_pages.migrate_misplaced_page
      1.23          +814.9%      11.29 ±104%  perf-sched.wait_time.avg.ms.__cond_resched.shmem_get_folio_gfp.shmem_write_begin.generic_perform_write.generic_file_write_iter
      0.02          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.exit_mmap.__mmput
    132.41          -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_gem_fb_vunmap.drm_atomic_helper_cleanup_planes
      3.98           +36.2%       5.42 ± 12%  perf-sched.wait_time.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      6.77           -17.2%       5.60        perf-sched.wait_time.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.80          +882.7%       7.81 ±101%  perf-sched.wait_time.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      1.30           +64.9%       2.14 ±  2%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      0.89          +314.3%       3.69 ± 41%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function
      1.11          +200.6%       3.33 ±  3%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
      0.08          -100.0%       0.00        perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_irq_work
      1.39          +129.8%       3.20 ±  5%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      1.70           +66.6%       2.84        perf-sched.wait_time.avg.ms.futex_wait_queue.futex_wait.do_futex.__x64_sys_futex
      0.11         +2081.8%       2.49 ± 17%  perf-sched.wait_time.avg.ms.io_schedule.migration_entry_wait_on_locked.migration_entry_wait.do_swap_page
     33.31          +425.8%     175.12 ± 40%  perf-sched.wait_time.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      1.62          +190.1%       4.71 ± 49%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
      3.02          +438.0%      16.27 ±112%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.exit_mm
      0.69         +1054.7%       7.93 ±128%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    612.11           +20.0%     734.38 ±  4%  perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.01         +4686.7%       0.29 ± 58%  perf-sched.wait_time.avg.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
      0.20          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.do_anonymous_page
      3.14           -99.9%       0.00 ±200%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.__get_free_pages.__pollwait.perf_poll
      0.06          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.inotify_handle_inode_event.send_to_group
     18.58           -78.9%       3.92 ±115%  perf-sched.wait_time.max.ms.__cond_resched.__wait_for_common.stop_two_cpus.migrate_swap.task_numa_migrate
      1000          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.copy_pte_range.copy_p4d_range.copy_page_range.dup_mmap
      5.83           -91.9%       0.47 ±199%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      0.04          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.mmput.exec_mmap.begin_new_exec.load_elf_binary
      2.11           -81.3%       0.39 ±199%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.__fdget_pos.ksys_write.do_syscall_64
      4.72          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.perf_event_ctx_lock_nested.constprop.0
      5.71          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.rmap_walk_anon.migrate_pages_batch.migrate_pages.migrate_misplaced_page
      4130           -70.2%       1229 ± 96%  perf-sched.wait_time.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.02          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.exit_mmap.__mmput
    132.41          -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_gem_fb_vunmap.drm_atomic_helper_cleanup_planes
     14.01           +30.5%      18.28 ± 15%  perf-sched.wait_time.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      2.52           -42.5%       1.45 ± 22%  perf-sched.wait_time.max.ms.do_task_dead.do_exit.__x64_sys_exit.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1000           +81.8%       1817 ± 22%  perf-sched.wait_time.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
    322.50           -44.8%     177.94 ± 30%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      0.15          -100.0%       0.00        perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_irq_work
    652.95           -73.4%     173.65 ± 50%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      0.18         +5724.9%      10.31 ± 38%  perf-sched.wait_time.max.ms.io_schedule.migration_entry_wait_on_locked.migration_entry_wait.do_swap_page
      9.82          +479.5%      56.94 ± 50%  perf-sched.wait_time.max.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.exit_mm
      3.85         +5847.8%     228.93 ±169%  perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.02        +18689.0%       3.76 ± 59%  perf-sched.wait_time.max.ms.wait_for_partner.fifo_open.do_dentry_open.do_open



***************************************************************************************************
lkp-spr-r02: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory
=========================================================================================
compiler/cpufreq_governor/iterations/kconfig/message_threads/rootfs/runtime/tbox_group/testcase/worker_threads:
  gcc-12/performance/3x/x86_64-rhel-8.3/12.5%/debian-11.1-x86_64-20220510.cgz/300s/lkp-spr-r02/schbench/16

commit: 
  e0c2ff903c ("sched/fair: Remove sched_feat(START_DEBIT)")
  86bfbb7ce4 ("sched/fair: Add lag based placement")

e0c2ff903c320d3f 86bfbb7ce4f67a88df263919816 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
   1182551 ±  7%     +22.1%    1443528 ±  6%  numa-numastat.node1.numa_hit
      7767           +11.4%       8650        uptime.idle
 6.097e+08 ±  3%    +145.4%  1.496e+09 ±  7%  cpuidle..time
   3529664 ±  5%     +80.2%    6359353 ±  5%  cpuidle..usage
    440.17           -10.9%     392.00        vmstat.procs.r
    136986           -31.3%      94150        vmstat.system.cs
    273441           +24.2%     339581 ±  8%  vmstat.system.in
      0.27 ±  4%      +0.5        0.75 ±  9%  mpstat.cpu.all.idle%
      1.06            +0.2        1.24 ±  7%  mpstat.cpu.all.irq%
      0.04 ±  2%      -0.0        0.02 ±  7%  mpstat.cpu.all.soft%
      0.28            -0.1        0.21 ±  9%  mpstat.cpu.all.sys%
    463.67 ± 16%    +673.0%       3584 ± 59%  perf-c2c.DRAM.remote
      9054 ±  5%    +614.9%      64729 ± 19%  perf-c2c.HITM.local
    208.83 ± 22%   +1020.0%       2339 ± 79%  perf-c2c.HITM.remote
      9263 ±  5%    +624.0%      67068 ± 21%  perf-c2c.HITM.total
   1281699 ±  2%     -35.6%     826015 ± 10%  meminfo.Active
   1281597 ±  2%     -35.6%     825911 ± 10%  meminfo.Active(anon)
    768665 ±  2%     +17.2%     901175 ±  6%  meminfo.AnonPages
    813854           +87.8%    1528821 ± 20%  meminfo.Inactive
    813679           +87.9%    1528664 ± 20%  meminfo.Inactive(anon)
     95334 ±  4%    +753.1%     813315 ± 42%  meminfo.Mapped
   6514301           +12.6%    7336480 ±  4%  meminfo.Memused
      7136           +32.6%       9464 ±  7%  meminfo.PageTables
     91.25           -17.2       74.06 ±  7%  perf-profile.calltrace.cycles-pp.worker_thread
      3.28 ±  2%      +3.6        6.86 ±  9%  perf-profile.calltrace.cycles-pp.pthread_mutex_trylock@plt
      6.68 ±  3%     +15.4       22.08 ± 24%  perf-profile.calltrace.cycles-pp.__pthread_mutex_trylock
     92.91           -15.4       77.50 ±  6%  perf-profile.children.cycles-pp.worker_thread
      1.83 ±  2%      +2.0        3.87 ±  9%  perf-profile.children.cycles-pp.pthread_mutex_trylock@plt
      6.82 ±  3%     +15.6       22.41 ± 24%  perf-profile.children.cycles-pp.__pthread_mutex_trylock
     92.21           -15.8       76.41 ±  7%  perf-profile.self.cycles-pp.worker_thread
      0.19 ±  3%      +0.2        0.43 ± 10%  perf-profile.self.cycles-pp.pthread_mutex_trylock@plt
      6.60 ±  3%     +15.1       21.74 ± 24%  perf-profile.self.cycles-pp.__pthread_mutex_trylock
     20582 ±  6%     +60.5%      33026 ±  6%  turbostat.C1
   3240213 ±  5%     +74.4%    5650672 ±  5%  turbostat.C1E
      0.22 ±  3%      +0.3        0.48 ±  6%  turbostat.C1E%
    191528 ±  3%    +203.6%     581475 ± 11%  turbostat.C6
      0.09 ±  4%      +0.2        0.25 ± 12%  turbostat.C6%
      0.53           +77.2%       0.94 ±  5%  turbostat.CPU%c1
      1.71           -30.5%       1.19 ±  3%  turbostat.IPC
 2.507e+08           +20.1%  3.012e+08 ±  7%  turbostat.IRQ
    122.36           -12.6      109.77 ±  2%  turbostat.PKG_%
      6515 ±  9%     +96.2%      12783 ± 12%  turbostat.POLL
    101977 ± 49%     -99.2%     800.50 ±100%  numa-vmstat.node0.nr_active_anon
    765462 ±  7%     -26.5%     562274 ± 41%  numa-vmstat.node0.nr_file_pages
     13657 ±  7%    +264.8%      49817 ± 35%  numa-vmstat.node0.nr_mapped
    105157 ± 50%     -97.9%       2157 ± 93%  numa-vmstat.node0.nr_shmem
    101977 ± 49%     -99.2%     800.50 ±100%  numa-vmstat.node0.nr_zone_active_anon
    243592 ± 22%     +98.0%     482421 ± 45%  numa-vmstat.node1.nr_file_pages
    114877 ± 11%    +149.0%     286086 ± 23%  numa-vmstat.node1.nr_inactive_anon
     10181 ± 12%   +1391.1%     151815 ± 46%  numa-vmstat.node1.nr_mapped
    871.33 ±  5%     +44.8%       1261 ± 11%  numa-vmstat.node1.nr_page_table_pages
    226585 ± 22%     +61.1%     365120 ± 16%  numa-vmstat.node1.nr_shmem
    114876 ± 11%    +149.0%     286086 ± 23%  numa-vmstat.node1.nr_zone_inactive_anon
   1182480 ±  7%     +22.0%    1443181 ±  6%  numa-vmstat.node1.numa_hit
    407911 ± 49%     -99.2%       3244 ± 99%  numa-meminfo.node0.Active
    407911 ± 49%     -99.2%       3193 ±100%  numa-meminfo.node0.Active(anon)
   3061841 ±  7%     -26.5%    2248999 ± 41%  numa-meminfo.node0.FilePages
     54594 ±  7%    +261.5%     197352 ± 35%  numa-meminfo.node0.Mapped
    420621 ± 50%     -98.0%       8537 ± 92%  numa-meminfo.node0.Shmem
    628884 ± 13%     +35.0%     848952 ±  8%  numa-meminfo.node1.AnonPages.max
    974372 ± 22%     +96.6%    1915854 ± 45%  numa-meminfo.node1.FilePages
    459685 ± 11%    +147.6%    1138139 ± 22%  numa-meminfo.node1.Inactive
    459510 ± 12%    +147.7%    1138062 ± 22%  numa-meminfo.node1.Inactive(anon)
     40661 ± 12%   +1376.4%     600318 ± 46%  numa-meminfo.node1.Mapped
   2254239 ±  9%     +58.7%    3578558 ± 24%  numa-meminfo.node1.MemUsed
      3487 ±  5%     +44.8%       5049 ± 11%  numa-meminfo.node1.PageTables
    906339 ± 22%     +59.6%    1446651 ± 16%  numa-meminfo.node1.Shmem
    320405 ±  2%     -35.2%     207712 ± 11%  proc-vmstat.nr_active_anon
    192155 ±  2%     +17.4%     225594 ±  6%  proc-vmstat.nr_anon_pages
    203398           +87.5%     381398 ± 20%  proc-vmstat.nr_inactive_anon
     23824 ±  4%    +747.5%     201909 ± 42%  proc-vmstat.nr_mapped
      1783           +32.5%       2363 ±  8%  proc-vmstat.nr_page_table_pages
    105469            +1.1%     106679        proc-vmstat.nr_slab_unreclaimable
    320405 ±  2%     -35.2%     207712 ± 11%  proc-vmstat.nr_zone_active_anon
    203398           +87.5%     381398 ± 20%  proc-vmstat.nr_zone_inactive_anon
    403918 ± 12%     +44.0%     581785 ± 14%  proc-vmstat.numa_hint_faults
    368369 ± 13%     +37.6%     506765 ± 15%  proc-vmstat.numa_hint_faults_local
   2235419            +8.0%    2415025 ±  2%  proc-vmstat.numa_hit
   2003537            +9.2%    2188437 ±  2%  proc-vmstat.numa_local
    328727 ± 10%    +115.3%     707878 ±  5%  proc-vmstat.numa_pages_migrated
    278260 ±  3%     +74.8%     486343 ± 11%  proc-vmstat.pgactivate
   3055646           +17.4%    3587607 ±  2%  proc-vmstat.pgalloc_normal
   2815349 ±  2%      +6.8%    3005403 ±  3%  proc-vmstat.pgfault
   2694089 ±  2%     +14.0%    3071217 ±  2%  proc-vmstat.pgfree
    328727 ± 10%    +115.3%     707878 ±  5%  proc-vmstat.pgmigrate_success
    587.00 ± 10%    +121.4%       1299 ±  6%  proc-vmstat.thp_migration_success
   3705650            -5.4%    3504700        proc-vmstat.unevictable_pgs_scanned
 1.294e+08         +2173.4%  2.943e+09 ±127%  sched_debug.cfs_rq:/.avg_vruntime.avg
 1.722e+08 ±  2%  +2.7e+05%  4.614e+11 ±179%  sched_debug.cfs_rq:/.avg_vruntime.max
 1.169e+08           -13.8%  1.007e+08 ±  4%  sched_debug.cfs_rq:/.avg_vruntime.min
   4654566 ±  7%  +6.8e+05%  3.174e+10 ±173%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      4.16 ±  4%     -12.3%       3.65 ±  3%  sched_debug.cfs_rq:/.h_nr_running.max
      0.49 ± 13%     -51.9%       0.24 ± 23%  sched_debug.cfs_rq:/.h_nr_running.min
      0.68 ±  2%     -10.0%       0.62        sched_debug.cfs_rq:/.h_nr_running.stddev
      1199 ± 16%     -48.6%     616.84 ± 21%  sched_debug.cfs_rq:/.load.min
      1.15 ± 13%     +37.2%       1.57 ±  7%  sched_debug.cfs_rq:/.load_avg.min
 1.294e+08         +2173.4%  2.943e+09 ±127%  sched_debug.cfs_rq:/.min_vruntime.avg
 1.722e+08 ±  2%  +2.7e+05%  4.614e+11 ±179%  sched_debug.cfs_rq:/.min_vruntime.max
 1.169e+08           -13.8%  1.007e+08 ±  4%  sched_debug.cfs_rq:/.min_vruntime.min
   4654566 ±  7%  +6.8e+05%  3.174e+10 ±173%  sched_debug.cfs_rq:/.min_vruntime.stddev
      0.49 ± 13%     -51.9%       0.24 ± 23%  sched_debug.cfs_rq:/.nr_running.min
      0.06 ± 18%     +38.5%       0.09 ±  9%  sched_debug.cfs_rq:/.nr_running.stddev
      4272 ±  4%     -12.3%       3745        sched_debug.cfs_rq:/.runnable_avg.max
    678.29 ±  2%     -11.4%     601.04        sched_debug.cfs_rq:/.runnable_avg.stddev
    335.12 ±  2%     -10.2%     300.97        sched_debug.cfs_rq:/.util_avg.stddev
    170563 ± 10%     +32.6%     226192 ±  4%  sched_debug.cpu.avg_idle.avg
    537007 ±  6%     +75.6%     942880 ±  3%  sched_debug.cpu.avg_idle.max
     56354 ± 11%    +140.6%     135604 ±  4%  sched_debug.cpu.avg_idle.stddev
      4.18 ±  4%     -12.5%       3.66 ±  2%  sched_debug.cpu.nr_running.max
      0.49 ± 15%     -45.5%       0.27 ± 29%  sched_debug.cpu.nr_running.min
      0.68 ±  2%      -9.9%       0.62        sched_debug.cpu.nr_running.stddev
    276692           -36.9%     174542 ±  5%  sched_debug.cpu.nr_switches.avg
    343096 ±  4%     -21.6%     269080 ±  4%  sched_debug.cpu.nr_switches.max
    227587 ±  4%     -53.6%     105661 ± 10%  sched_debug.cpu.nr_switches.min
      8130 ±  9%    +196.3%      24089 ±  9%  sched_debug.cpu.nr_switches.stddev
  29305629          +300.0%  1.172e+08        sched_debug.sysctl_sched.sysctl_sched_features
      9509           -18.3%       7765        schbench.request_end_latency_50%_us_max
     14634           -11.3%      12981 ±  3%  schbench.request_end_latency_90%_us_max
      0.77 ± 35%      +4.3        5.10 ± 33%  schbench.request_end_latency_90%_us_stddev%
      1.34 ± 35%      +9.1       10.46 ± 37%  schbench.request_end_latency_99%_us_stddev%
     40640         +1716.9%     738389 ± 25%  schbench.request_end_latency_99.9%_us_max
      0.90 ± 36%     +32.9       33.83 ± 37%  schbench.request_end_latency_99.9%_us_stddev%
      9449           -20.1%       7545        schbench.request_latency_50%_us
      0.63 ± 24%      +1.9        2.53 ± 14%  schbench.request_latency_50%_us_stddev%
     14551           -17.2%      12052        schbench.request_latency_90%_us
      1.09 ± 27%      +3.1        4.18 ± 32%  schbench.request_latency_90%_us_stddev%
     28797            -4.5%      27514 ±  2%  schbench.request_latency_99%_us
      2.78 ± 22%      +9.8       12.56 ± 19%  schbench.request_latency_99%_us_stddev%
     40498         +1371.2%     595796 ±  9%  schbench.request_latency_99.9%_us
      2.00 ± 23%     +33.3       35.29 ± 14%  schbench.request_latency_99.9%_us_stddev%
    127216 ±  5%  +54737.3%   69762234 ± 11%  schbench.request_latency_max_us
     14.42 ± 24%     +36.9       51.32 ± 17%  schbench.request_latency_max_us_stddev%
  37581637           -49.1%   19121855        schbench.time.involuntary_context_switches
    519.02           -24.6%     391.25 ± 10%  schbench.time.system_time
  80680290           -29.7%   56750446 ±  2%  schbench.time.voluntary_context_switches
      5.33 ±  8%     +71.9%       9.17 ± 31%  schbench.wakeup_end_latency_50%_us_max
      2.95 ±141%     +33.5       36.47 ± 42%  schbench.wakeup_end_latency_50%_us_stddev%
      5576           -13.0%       4853        schbench.wakeup_end_latency_90%_us_max
      9130           -26.8%       6685 ±  3%  schbench.wakeup_end_latency_99%_us_max
      1.32 ± 23%      +5.1        6.38 ± 28%  schbench.wakeup_end_latency_99%_us_stddev%
     12810           -16.0%      10757 ±  3%  schbench.wakeup_end_latency_99.9%_us_max
      0.66 ± 17%      +5.8        6.47 ± 24%  schbench.wakeup_end_latency_99.9%_us_stddev%
      9.65 ±  7%     +30.4       40.10 ± 44%  schbench.wakeup_latency_50%_us_stddev%
      5489           -12.9%       4783        schbench.wakeup_latency_90%_us
      1.47 ±  6%      +1.0        2.46 ± 19%  schbench.wakeup_latency_90%_us_stddev%
      9114           -33.4%       6067        schbench.wakeup_latency_99%_us
      3.32 ± 15%      +2.2        5.48 ± 30%  schbench.wakeup_latency_99%_us_stddev%
     12765           -20.0%      10211        schbench.wakeup_latency_99.9%_us
      1.42 ± 24%      +5.0        6.46 ± 14%  schbench.wakeup_latency_99.9%_us_stddev%
     29793 ±  5%    +1e+05%   30902382 ± 24%  schbench.wakeup_latency_max_us
     13.69 ± 37%     +60.1       73.75 ± 36%  schbench.wakeup_latency_max_us_stddev%
      0.04          +400.1%       0.19 ±  9%  perf-stat.i.MPKI
 2.295e+11          +434.5%  1.227e+12 ± 79%  perf-stat.i.branch-instructions
      0.02            +0.0        0.02 ±  5%  perf-stat.i.branch-miss-rate%
  38784284          +515.0%  2.385e+08 ± 68%  perf-stat.i.branch-misses
      5.12            -1.8        3.31 ±  7%  perf-stat.i.cache-miss-rate%
   3512555 ±  2%   +1669.3%   62147219 ± 79%  perf-stat.i.cache-misses
  67531333         +3178.6%  2.214e+09 ± 93%  perf-stat.i.cache-references
    137347          +375.9%     653576 ± 77%  perf-stat.i.context-switches
      0.35           +38.1%       0.48        perf-stat.i.cpi
    224235          +662.4%    1709646 ± 83%  perf-stat.i.cpu-clock
   6.3e+11          +654.0%   4.75e+12 ± 84%  perf-stat.i.cpu-cycles
     56706          +374.4%     269001 ± 78%  perf-stat.i.cpu-migrations
    192900 ±  2%     -54.6%      87599 ± 10%  perf-stat.i.cycles-between-cache-misses
      0.00 ±  3%      +0.0        0.00 ±  6%  perf-stat.i.dTLB-load-miss-rate%
   1610387 ±  2%    +535.0%   10225360 ± 71%  perf-stat.i.dTLB-load-misses
 4.514e+11          +418.0%  2.338e+12 ± 78%  perf-stat.i.dTLB-loads
      0.00            +0.0        0.00 ±  2%  perf-stat.i.dTLB-store-miss-rate%
   1432063          +613.4%   10216876 ± 79%  perf-stat.i.dTLB-store-misses
 2.281e+11          +425.0%  1.197e+12 ± 79%  perf-stat.i.dTLB-stores
 1.807e+12          +411.6%  9.242e+12 ± 78%  perf-stat.i.instructions
      2.87           -27.1%       2.09        perf-stat.i.ipc
      4.02           -63.5%       1.47 ±  2%  perf-stat.i.metric.G/sec
     32.08 ± 52%   +4632.8%       1518        perf-stat.i.metric.M/sec
      3007 ±  2%   +1542.7%      49397 ± 38%  perf-stat.i.minor-faults
   1417921 ±  2%   +1785.4%   26733844 ± 88%  perf-stat.i.node-load-misses
     41259 ±  6%   +1076.8%     485530 ± 49%  perf-stat.i.node-loads
      3007 ±  2%   +1542.9%      49404 ± 38%  perf-stat.i.page-faults
    224235          +662.4%    1709646 ± 83%  perf-stat.i.task-clock
      0.04          +406.2%       0.19 ±  8%  perf-stat.overall.MPKI
      0.02            +0.0        0.02 ±  3%  perf-stat.overall.branch-miss-rate%
      5.18            -2.0        3.19 ± 13%  perf-stat.overall.cache-miss-rate%
      0.35           +39.6%       0.49 ±  2%  perf-stat.overall.cpi
    179412 ±  2%     -54.4%      81837 ± 10%  perf-stat.overall.cycles-between-cache-misses
      0.00 ±  2%      +0.0        0.00 ±  4%  perf-stat.overall.dTLB-load-miss-rate%
      0.00            +0.0        0.00        perf-stat.overall.dTLB-store-miss-rate%
      2.87           -28.3%       2.06 ±  2%  perf-stat.overall.ipc
  2.29e+11           -30.2%    1.6e+11 ±  5%  perf-stat.ps.branch-instructions
  38683099           -26.5%   28430547 ±  7%  perf-stat.ps.branch-misses
   3505842 ±  2%    +107.8%    7283948 ± 10%  perf-stat.ps.cache-misses
  67649197          +239.5%  2.296e+08 ±  7%  perf-stat.ps.cache-references
    137043           -38.1%      84890 ±  5%  perf-stat.ps.context-switches
    223739            -5.9%     210582 ±  4%  perf-stat.ps.cpu-clock
 6.287e+11            -6.2%  5.899e+11 ±  4%  perf-stat.ps.cpu-cycles
     56564           -37.5%      35350 ±  5%  perf-stat.ps.cpu-migrations
   1727450           -13.3%    1497094 ±  7%  perf-stat.ps.dTLB-load-misses
 4.504e+11           -31.9%  3.066e+11 ±  5%  perf-stat.ps.dTLB-loads
   1429372           -13.1%    1242740 ±  4%  perf-stat.ps.dTLB-store-misses
 2.276e+11           -31.0%  1.569e+11 ±  5%  perf-stat.ps.dTLB-stores
 1.803e+12           -32.7%  1.213e+12 ±  5%  perf-stat.ps.instructions
   1413780 ±  2%    +134.7%    3317592 ± 12%  perf-stat.ps.node-load-misses
     42494 ±  6%    +128.3%      97028 ± 27%  perf-stat.ps.node-loads
    223739            -5.9%     210582 ±  4%  perf-stat.ps.task-clock
 1.625e+15           -37.7%  1.013e+15 ±  9%  perf-stat.total.instructions
      3.63 ± 60%  +18504.3%     675.43 ±107%  perf-sched.sch_delay.avg.ms.__cond_resched.stop_one_cpu.migrate_task_to.task_numa_migrate.isra
      0.00 ± 70%  +1.7e+07%     348.25 ±195%  perf-sched.sch_delay.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.74 ± 63%  +1.7e+05%       1257 ± 93%  perf-sched.sch_delay.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      1.21 ±  3%   +3461.5%      43.17 ± 56%  perf-sched.sch_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      1.62 ±221%    +600.6%      11.34 ± 56%  perf-sched.sch_delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      0.14 ± 31%  +5.7e+05%     823.77 ±121%  perf-sched.sch_delay.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      2.11 ±  6%   +2409.2%      53.06 ± 62%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      2.18 ±  8%   +6912.0%     153.17 ±143%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
      2.83 ± 37%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_irq_work
      2.15 ±  2%   +1870.3%      42.42 ± 56%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      2.80 ±  2%   +2128.8%      62.35 ± 54%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.72 ±  3%   +4529.7%      33.29 ± 55%  perf-sched.sch_delay.avg.ms.futex_wait_queue.futex_wait.do_futex.__x64_sys_futex
      0.09 ±195%  +7.6e+05%     652.65 ±125%  perf-sched.sch_delay.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      0.30 ±120%  +33952.3%     102.67 ± 41%  perf-sched.sch_delay.avg.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      0.00          +2e+08%       2046 ±194%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      0.26 ± 62%  +8.9e+05%       2288 ±102%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.03 ± 72%    +8e+05%     262.35 ±124%  perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.88 ± 84%   +7103.7%      63.73 ± 50%  perf-sched.sch_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      0.08 ±170%  +9.9e+05%     778.90 ± 76%  perf-sched.sch_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.32 ± 64%  +7.6e+05%       2397 ± 52%  perf-sched.sch_delay.avg.ms.syslog_print.do_syslog.kmsg_read.vfs_read
      0.06 ±106%   +1451.8%       0.98 ±156%  perf-sched.sch_delay.avg.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
     21.02 ± 47%  +52748.7%      11110 ± 58%  perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      6.11 ± 55%  +1.4e+05%       8415 ±137%  perf-sched.sch_delay.max.ms.__cond_resched.stop_one_cpu.migrate_task_to.task_numa_migrate.isra
      0.01 ± 53%  +2.8e+07%       2342 ±204%  perf-sched.sch_delay.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     12.73 ±104%  +1.8e+05%      23093 ± 76%  perf-sched.sch_delay.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
    232.44 ± 17%  +35894.7%      83666 ± 62%  perf-sched.sch_delay.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
    168.08 ±222%    +486.4%     985.69 ± 55%  perf-sched.sch_delay.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      1.19 ± 14%  +4.4e+06%      52432 ±117%  perf-sched.sch_delay.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
    175.47 ± 29%  +60615.1%     106535 ± 71%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
     62.79 ± 38%  +97442.9%      61243 ± 94%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
      6.60 ± 23%    -100.0%       0.00        perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_irq_work
    150.03 ± 17%  +52700.9%      79217 ± 69%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
    193.52 ± 13%  +43970.2%      85286 ± 60%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
    205.68 ± 18%  +40888.1%      84306 ± 60%  perf-sched.sch_delay.max.ms.futex_wait_queue.futex_wait.do_futex.__x64_sys_futex
    182.41 ±201%  +50500.7%      92300 ± 69%  perf-sched.sch_delay.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
     18.35 ±126%  +61201.8%      11248 ± 67%  perf-sched.sch_delay.max.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      6.65 ± 86%  +1.3e+06%      84906 ± 93%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      1.17 ± 28%  +1.8e+06%      20888 ±114%  perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    127.56 ± 85%  +12411.1%      15959 ± 89%  perf-sched.sch_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     43.14 ±139%  +2.8e+05%     121682 ± 73%  perf-sched.sch_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      4.43 ± 36%  +1.6e+06%      72683 ± 88%  perf-sched.sch_delay.max.ms.syslog_print.do_syslog.kmsg_read.vfs_read
      1.25 ±106%   +4464.8%      56.90 ±198%  perf-sched.sch_delay.max.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
      2186 ± 45%   +6436.0%     142937 ± 56%  perf-sched.sch_delay.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      1.44 ±  2%   +4014.8%      59.32 ± 54%  perf-sched.total_sch_delay.average.ms
      2186 ± 45%   +6436.0%     142937 ± 56%  perf-sched.total_sch_delay.max.ms
      6.00 ±  2%   +2540.7%     158.50 ± 55%  perf-sched.total_wait_and_delay.average.ms
      4313 ±  7%   +5688.7%     249675 ± 63%  perf-sched.total_wait_and_delay.max.ms
      4.56 ±  2%   +2074.7%      99.18 ± 57%  perf-sched.total_wait_time.average.ms
      4313 ±  7%   +3100.0%     138020 ± 59%  perf-sched.total_wait_time.max.ms
      7.77 ± 84%  +92068.6%       7163 ± 77%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__wait_for_common.stop_two_cpus.migrate_swap.task_numa_migrate
     75.06 ± 67%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
    127.62 ± 71%   +5365.7%       6975 ±101%  perf-sched.wait_and_delay.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      2.32 ±141%  +1.5e+05%       3556 ± 93%  perf-sched.wait_and_delay.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      3.38 ±  3%   +3054.5%     106.74 ± 54%  perf-sched.wait_and_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
    259.38 ±  2%    +205.9%     793.37 ± 47%  perf-sched.wait_and_delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      1.93 ±223%  +1.2e+05%       2395 ± 96%  perf-sched.wait_and_delay.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      5.32 ±  6%   +2368.4%     131.36 ± 64%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      4.75 ±  2%   +2134.4%     106.13 ± 56%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      6.35 ±  2%   +2385.9%     157.82 ± 54%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      2.31 ±  3%   +3685.2%      87.34 ± 55%  perf-sched.wait_and_delay.avg.ms.futex_wait_queue.futex_wait.do_futex.__x64_sys_futex
     17.29 ± 23%  +15123.0%       2631 ±112%  perf-sched.wait_and_delay.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      5.13 ±107%   +4567.0%     239.62 ± 50%  perf-sched.wait_and_delay.avg.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
     99.04 ±  9%   +7616.8%       7643 ±103%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
    108.15 ±  5%   +5507.6%       6064 ± 96%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
    454.74          +674.2%       3520 ± 67%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
     27.86 ± 17%    +828.1%     258.60 ± 49%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    645.26 ±  5%   +1803.2%      12280 ± 73%  perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      7.47 ± 13%  +66446.6%       4969 ± 47%  perf-sched.wait_and_delay.avg.ms.syslog_print.do_syslog.kmsg_read.vfs_read
    650.55 ±  4%   +2680.6%      18089 ± 62%  perf-sched.wait_and_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     14.67 ± 35%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
     14.33 ± 31%     -93.0%       1.00 ±141%  perf-sched.wait_and_delay.count.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     16.33 ±223%    +620.4%     117.67 ± 18%  perf-sched.wait_and_delay.count.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
     18344 ±  6%     +47.7%      27098 ± 14%  perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
     28.67 ±102%    +673.8%     221.83 ± 11%  perf-sched.wait_and_delay.count.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
    135.50 ± 10%     -85.0%      20.33 ± 42%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
    188.83 ± 15%    +225.5%     614.67 ± 11%  perf-sched.wait_and_delay.count.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      1629 ±  3%     -24.6%       1228 ±  6%  perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     24.28 ± 96%  +4.8e+05%     115561 ±101%  perf-sched.wait_and_delay.max.ms.__cond_resched.__wait_for_common.stop_two_cpus.migrate_swap.task_numa_migrate
    827.51 ± 56%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
    665.81 ± 70%   +7365.6%      49706 ±132%  perf-sched.wait_and_delay.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     26.84 ±141%  +2.3e+05%      62344 ± 91%  perf-sched.wait_and_delay.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      1000        +16514.4%     166154 ± 62%  perf-sched.wait_and_delay.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      1490 ± 32%   +3544.3%      54306 ± 90%  perf-sched.wait_and_delay.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
    166.72 ±223%  +75327.4%     125754 ±103%  perf-sched.wait_and_delay.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
    588.95 ± 50%  +30345.8%     179309 ± 71%  perf-sched.wait_and_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
    298.69 ± 16%  +51732.8%     154820 ± 72%  perf-sched.wait_and_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      1000        +17190.6%     172925 ± 59%  perf-sched.wait_and_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
    386.48 ± 25%  +45933.4%     177910 ± 55%  perf-sched.wait_and_delay.max.ms.futex_wait_queue.futex_wait.do_futex.__x64_sys_futex
      1331 ±  4%  +13936.7%     186859 ± 71%  perf-sched.wait_and_delay.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
    153.17 ±106%  +13625.6%      21022 ± 79%  perf-sched.wait_and_delay.max.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      1000         +7573.5%      76803 ± 93%  perf-sched.wait_and_delay.max.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
    499.99        +32875.5%     164873 ±102%  perf-sched.wait_and_delay.max.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
    504.67        +21505.9%     109038 ± 76%  perf-sched.wait_and_delay.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
    432.16 ± 13%  +16924.0%      73571 ± 74%  perf-sched.wait_and_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      2882 ± 39%   +7850.4%     229158 ± 75%  perf-sched.wait_and_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     59.78 ± 46%  +2.8e+05%     164654 ± 83%  perf-sched.wait_and_delay.max.ms.syslog_print.do_syslog.kmsg_read.vfs_read
      4073 ±  9%   +4922.1%     204590 ± 80%  perf-sched.wait_and_delay.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     80.43 ± 88%     -82.4%      14.13 ±211%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.shmem_alloc_folio
      4.53 ± 65%  +96751.9%       4389 ± 75%  perf-sched.wait_time.avg.ms.__cond_resched.__wait_for_common.stop_two_cpus.migrate_swap.task_numa_migrate
     75.06 ± 67%     -96.8%       2.37 ±110%  perf-sched.wait_time.avg.ms.__cond_resched.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
      4.04 ± 52%  +1.2e+05%       4988 ±172%  perf-sched.wait_time.avg.ms.__cond_resched.stop_one_cpu.migrate_task_to.task_numa_migrate.isra
    127.62 ± 71%   +5092.8%       6626 ±108%  perf-sched.wait_time.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      4.32 ± 26%  +53151.7%       2298 ±105%  perf-sched.wait_time.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      2.17 ±  3%   +2827.8%      63.57 ± 53%  perf-sched.wait_time.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
    257.77 ±  3%    +203.4%     782.03 ± 48%  perf-sched.wait_time.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      2.65 ±147%  +59166.6%       1572 ± 91%  perf-sched.wait_time.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      3.21 ±  5%   +2341.5%      78.30 ± 66%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      2.61 ±  8%   +7955.1%     210.63 ±150%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
      2.95 ± 36%    -100.0%       0.00        perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_irq_work
      2.60 ±  2%   +2353.1%      63.71 ± 57%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      3.55 ±  3%   +2588.8%      95.47 ± 54%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      1.59 ±  2%   +3302.6%      54.05 ± 55%  perf-sched.wait_time.avg.ms.futex_wait_queue.futex_wait.do_futex.__x64_sys_futex
     17.20 ± 24%  +11404.7%       1979 ±108%  perf-sched.wait_time.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      7.30 ± 48%   +1776.1%     136.95 ± 57%  perf-sched.wait_time.avg.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
     99.04 ±  9%   +5551.1%       5596 ± 92%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
    107.89 ±  5%   +3400.1%       3776 ± 96%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.75 ± 35%  +1.1e+05%     795.76 ± 61%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    454.73          +642.0%       3374 ± 73%  perf-sched.wait_time.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
     26.98 ± 19%    +622.4%     194.88 ± 60%  perf-sched.wait_time.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    645.18 ±  5%   +1682.7%      11501 ± 75%  perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      7.15 ± 14%  +35853.8%       2571 ± 52%  perf-sched.wait_time.avg.ms.syslog_print.do_syslog.kmsg_read.vfs_read
      0.06 ±125%    +316.7%       0.23 ± 36%  perf-sched.wait_time.avg.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
    629.53 ±  3%   +1008.5%       6978 ± 79%  perf-sched.wait_time.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     13.58 ± 78%  +4.5e+05%      61142 ±102%  perf-sched.wait_time.max.ms.__cond_resched.__wait_for_common.stop_two_cpus.migrate_swap.task_numa_migrate
    827.51 ± 56%     -97.6%      20.00 ±161%  perf-sched.wait_time.max.ms.__cond_resched.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
      7.02 ± 48%  +5.1e+05%      35995 ±162%  perf-sched.wait_time.max.ms.__cond_resched.stop_one_cpu.migrate_task_to.task_numa_migrate.isra
    665.81 ± 70%   +7014.1%      47366 ±141%  perf-sched.wait_time.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     37.63 ± 64%  +1.2e+05%      46508 ±120%  perf-sched.wait_time.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      1000         +8499.0%      85994 ± 57%  perf-sched.wait_time.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      1490 ± 32%   +3544.3%      54306 ± 90%  perf-sched.wait_time.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
    199.38 ±180%  +43835.7%      87597 ± 98%  perf-sched.wait_time.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
    463.97 ± 81%  +19252.4%      89789 ± 71%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
     65.59 ± 38%  +94455.4%      62021 ± 98%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
      6.73 ± 22%    -100.0%       0.00        perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_irq_work
    152.42 ± 15%  +56680.9%      86546 ± 65%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      1000         +9930.1%     100310 ± 59%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
    207.26 ± 19%  +49971.5%     103777 ± 53%  perf-sched.wait_time.max.ms.futex_wait_queue.futex_wait.do_futex.__x64_sys_futex
      1331 ±  4%   +8394.1%     113074 ± 64%  perf-sched.wait_time.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
    178.66 ± 79%   +6123.7%      11119 ± 80%  perf-sched.wait_time.max.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      1000         +5697.5%      58026 ±108%  perf-sched.wait_time.max.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
    499.98        +16404.2%      82516 ±106%  perf-sched.wait_time.max.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
     11.87 ±148%  +4.9e+05%      58369 ± 86%  perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    504.66        +20141.1%     102149 ± 85%  perf-sched.wait_time.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
    391.22 ± 13%  +15615.4%      61482 ± 93%  perf-sched.wait_time.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      2882 ± 39%   +4662.9%     137283 ± 60%  perf-sched.wait_time.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     58.91 ± 46%  +1.6e+05%      92406 ± 79%  perf-sched.wait_time.max.ms.syslog_print.do_syslog.kmsg_read.vfs_read
      1.49 ±140%    +286.0%       5.73 ± 12%  perf-sched.wait_time.max.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
      4073 ±  9%   +3211.0%     134884 ± 61%  perf-sched.wait_time.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm



***************************************************************************************************
lkp-spr-r02: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory
=========================================================================================
compiler/cpufreq_governor/ipc/iterations/kconfig/mode/nr_threads/rootfs/tbox_group/testcase:
  gcc-12/performance/pipe/4/x86_64-rhel-8.3/threads/100%/debian-11.1-x86_64-20220510.cgz/lkp-spr-r02/hackbench

commit: 
  e0c2ff903c ("sched/fair: Remove sched_feat(START_DEBIT)")
  86bfbb7ce4 ("sched/fair: Add lag based placement")

e0c2ff903c320d3f 86bfbb7ce4f67a88df263919816 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    240.52 ±  6%     -64.5%      85.38        uptime.boot
 9.589e+08 ±  3%     +18.5%  1.136e+09 ±  2%  cpuidle..time
   8140496 ±  3%    +234.0%   27191256 ± 10%  cpuidle..usage
  36441858 ± 17%    +233.3%  1.215e+08 ±  4%  numa-numastat.node0.local_node
  36514830 ± 17%    +232.9%  1.216e+08 ±  4%  numa-numastat.node0.numa_hit
  36041183 ± 17%    +280.4%  1.371e+08 ±  3%  numa-numastat.node1.local_node
  36208843 ± 17%    +279.3%  1.374e+08 ±  3%  numa-numastat.node1.numa_hit
      2.08 ±  8%      +8.0       10.10 ±  6%  mpstat.cpu.all.idle%
      2.67 ±  9%      -0.9        1.81 ±  2%  mpstat.cpu.all.irq%
      0.03 ±  6%      +0.0        0.05 ±  4%  mpstat.cpu.all.soft%
     87.41           -20.1       67.34        mpstat.cpu.all.sys%
      7.82 ±  4%     +12.9       20.69        mpstat.cpu.all.usr%
    532.17 ± 94%     -91.4%      45.67 ± 33%  perf-c2c.DRAM.local
      7658 ± 39%     -98.2%     135.50 ± 67%  perf-c2c.DRAM.remote
     41269 ± 38%     -99.7%     110.83 ± 44%  perf-c2c.HITM.local
      4834 ± 43%     -98.5%      73.33 ± 58%  perf-c2c.HITM.remote
     46104 ± 33%     -99.6%     184.17 ± 40%  perf-c2c.HITM.total
      2.83 ± 13%    +370.6%      13.33 ±  3%  vmstat.cpu.id
      7.33 ±  6%    +163.6%      19.33 ±  2%  vmstat.cpu.us
   4584405 ±  2%     +18.2%    5419819 ±  3%  vmstat.memory.cache
      1721          +191.4%       5014 ±  2%  vmstat.procs.r
  29490821 ±  7%     -88.2%    3476905 ±  5%  vmstat.system.cs
   1702112 ±  9%     -67.5%     552640 ±  5%  vmstat.system.in
    333310 ± 16%     -96.1%      13013 ± 12%  meminfo.Active
    333185 ± 16%     -96.1%      12885 ± 12%  meminfo.Active(anon)
    196321 ±  5%     -49.7%      98756 ±  8%  meminfo.AnonHugePages
   4418764 ±  2%     +13.9%    5033744 ±  2%  meminfo.Cached
   2564302 ±  5%     +25.0%    3204103 ±  4%  meminfo.Committed_AS
   1860210 ±  9%     +47.9%    2751261 ±  5%  meminfo.Inactive
   1860035 ±  9%     +47.9%    2751073 ±  5%  meminfo.Inactive(anon)
   1212649 ± 10%     -64.1%     435292 ±  5%  meminfo.Mapped
   8225578 ±  2%     +10.6%    9096890        meminfo.Memused
   1707138 ±  6%     +36.0%    2322309 ±  5%  meminfo.Shmem
   1886276 ± 12%    +625.8%   13691028 ± 15%  turbostat.C1
      0.02 ± 20%      +0.5        0.54 ± 13%  turbostat.C1%
   5451850 ±  3%     +81.8%    9910593 ±  6%  turbostat.C1E
      1.08 ±  8%      +4.0        5.08 ±  2%  turbostat.C1E%
      0.97 ±  8%      +3.3        4.27 ±  2%  turbostat.C6%
      2.28 ±  7%    +338.1%      10.00        turbostat.CPU%c1
      0.25 ±  5%  +17958.8%      44.54 ± 26%  turbostat.IPC
  3.73e+08 ±  7%     -92.2%   29069078 ±  6%  turbostat.IRQ
     51.42 ± 16%     +48.3       99.76 ±  9%  turbostat.PKG_%
    294489 ± 22%    +951.0%    3094946 ± 15%  turbostat.POLL
    653.33            +1.7%     664.56        turbostat.PkgWatt
    679371 ±  5%    +259.9%    2444729        hackbench.throughput
    527309 ±  7%    +340.8%    2324462        hackbench.throughput_avg
    679371 ±  5%    +259.9%    2444729        hackbench.throughput_best
    371316 ± 18%    +469.1%    2112991 ±  2%  hackbench.throughput_worst
    202.25 ±  8%     -76.8%      47.02        hackbench.time.elapsed_time
    202.25 ±  8%     -76.8%      47.02        hackbench.time.elapsed_time.max
   2.4e+09           -99.2%   20145351 ±  4%  hackbench.time.involuntary_context_switches
    318874 ±  2%     -64.2%     114114 ±  3%  hackbench.time.minor_page_faults
     21388            -7.2%      19856        hackbench.time.percent_of_cpu_this_job_got
     39805 ±  8%     -82.1%       7131        hackbench.time.system_time
      3459 ±  3%     -36.2%       2206        hackbench.time.user_time
 3.606e+09 ±  2%     -96.6%  1.213e+08 ±  5%  hackbench.time.voluntary_context_switches
   3075482 ±  7%     -39.3%    1866765 ± 61%  numa-meminfo.node0.FilePages
    428738 ±  7%     -58.1%     179739 ±  6%  numa-meminfo.node0.Mapped
    456650 ± 61%     -80.4%      89588 ±130%  numa-meminfo.node0.Shmem
    295973 ± 22%     -97.7%       6801 ± 24%  numa-meminfo.node1.Active
    295890 ± 22%     -97.7%       6737 ± 25%  numa-meminfo.node1.Active(anon)
     95282 ± 37%     -69.6%      28949 ± 32%  numa-meminfo.node1.AnonHugePages
   1345714 ± 13%    +133.9%    3147285 ± 39%  numa-meminfo.node1.FilePages
   1201122 ± 24%    +101.1%    2415141 ±  9%  numa-meminfo.node1.Inactive
   1201009 ± 24%    +101.1%    2415051 ±  9%  numa-meminfo.node1.Inactive(anon)
    784567 ± 13%     -67.7%     253310 ± 10%  numa-meminfo.node1.Mapped
   3193943 ±  4%     +61.7%    5165392 ± 23%  numa-meminfo.node1.MemUsed
   1252916 ± 18%     +76.6%    2213027 ±  9%  numa-meminfo.node1.Shmem
    768788 ±  7%     -39.2%     467454 ± 60%  numa-vmstat.node0.nr_file_pages
    107305 ±  7%     -57.0%      46101 ±  6%  numa-vmstat.node0.nr_mapped
    114080 ± 61%     -79.7%      23158 ±132%  numa-vmstat.node0.nr_shmem
  36516544 ± 17%    +232.9%  1.216e+08 ±  4%  numa-vmstat.node0.numa_hit
  36443572 ± 17%    +233.3%  1.215e+08 ±  4%  numa-vmstat.node0.numa_local
     74240 ± 22%     -97.7%       1729 ± 22%  numa-vmstat.node1.nr_active_anon
    337185 ± 14%    +140.0%     809368 ± 37%  numa-vmstat.node1.nr_file_pages
    300717 ± 24%    +108.3%     626404 ± 10%  numa-vmstat.node1.nr_inactive_anon
    196566 ± 13%     -66.5%      65855 ±  8%  numa-vmstat.node1.nr_mapped
    313985 ± 18%     +83.4%     575803 ±  9%  numa-vmstat.node1.nr_shmem
     74240 ± 22%     -97.7%       1729 ± 22%  numa-vmstat.node1.nr_zone_active_anon
    300716 ± 24%    +108.3%     626399 ± 10%  numa-vmstat.node1.nr_zone_inactive_anon
  36208822 ± 17%    +279.3%  1.374e+08 ±  3%  numa-vmstat.node1.numa_hit
  36041163 ± 17%    +280.4%  1.371e+08 ±  3%  numa-vmstat.node1.numa_local
     83607 ± 16%     -96.1%       3238 ± 13%  proc-vmstat.nr_active_anon
    121605 ±  5%      -9.3%     110328 ±  3%  proc-vmstat.nr_anon_pages
   1105516 ±  2%     +14.5%    1266169 ±  2%  proc-vmstat.nr_file_pages
    465596 ±  9%     +49.4%     695387 ±  5%  proc-vmstat.nr_inactive_anon
    303486 ± 10%     -63.7%     110164 ±  3%  proc-vmstat.nr_mapped
    427609 ±  6%     +37.6%     588309 ±  5%  proc-vmstat.nr_shmem
     42956            -1.1%      42490        proc-vmstat.nr_slab_reclaimable
     83607 ± 16%     -96.1%       3238 ± 13%  proc-vmstat.nr_zone_active_anon
    465596 ±  9%     +49.4%     695387 ±  5%  proc-vmstat.nr_zone_inactive_anon
    451245 ± 13%     -36.9%     284919 ±  2%  proc-vmstat.numa_hint_faults
    340728 ± 19%     -53.1%     159929 ±  4%  proc-vmstat.numa_hint_faults_local
  72726126 ±  2%    +256.0%  2.589e+08        proc-vmstat.numa_hit
  72485489 ±  2%    +256.7%  2.585e+08        proc-vmstat.numa_local
     46783 ± 11%     -70.6%      13740 ± 34%  proc-vmstat.numa_pages_migrated
    698157 ±  8%     -20.8%     552785        proc-vmstat.numa_pte_updates
    135488 ± 11%     -99.6%     492.83 ± 15%  proc-vmstat.pgactivate
  72990048 ±  2%    +254.6%  2.588e+08        proc-vmstat.pgalloc_normal
   1684760 ±  4%     -37.9%    1047009        proc-vmstat.pgfault
  72040940 ±  2%    +256.0%  2.564e+08        proc-vmstat.pgfree
     46783 ± 11%     -70.6%      13740 ± 34%  proc-vmstat.pgmigrate_success
     64402 ±  7%     -55.3%      28774 ± 20%  proc-vmstat.pgreuse
    733700 ±  4%     -62.4%     275550 ±  8%  proc-vmstat.unevictable_pgs_scanned
      4.68 ±  3%     -29.5%       3.30 ±  6%  perf-stat.i.MPKI
 5.553e+10 ±  4%     +78.3%    9.9e+10        perf-stat.i.branch-instructions
      0.66 ±  3%      -0.5        0.19 ±  3%  perf-stat.i.branch-miss-rate%
 3.575e+08 ±  5%     -69.1%  1.104e+08 ±  4%  perf-stat.i.branch-misses
     11.23 ± 12%      +2.0       13.24 ±  2%  perf-stat.i.cache-miss-rate%
 1.213e+08 ± 15%     +21.5%  1.474e+08 ±  3%  perf-stat.i.cache-misses
  32693524 ±  5%     -89.1%    3563849 ±  6%  perf-stat.i.context-switches
      2.87 ±  5%     -55.3%       1.28        perf-stat.i.cpi
 6.334e+11            -7.6%  5.855e+11        perf-stat.i.cpu-cycles
   2533403 ±  6%     -76.0%     607572 ± 11%  perf-stat.i.cpu-migrations
      6567 ± 23%     -28.5%       4696 ±  2%  perf-stat.i.cycles-between-cache-misses
 7.939e+10 ±  4%     +89.2%  1.502e+11        perf-stat.i.dTLB-loads
      0.00 ±  4%      +0.0        0.01 ±  6%  perf-stat.i.dTLB-store-miss-rate%
    689491 ±  8%    +125.9%    1557589 ± 10%  perf-stat.i.dTLB-store-misses
 4.692e+10 ±  4%     +88.7%  8.853e+10        perf-stat.i.dTLB-stores
 2.774e+11 ±  4%     +83.8%  5.098e+11        perf-stat.i.instructions
      0.44 ±  4%     +95.0%       0.86        perf-stat.i.ipc
      0.05 ± 53%    +139.8%       0.12 ± 55%  perf-stat.i.major-faults
      2.82            -7.5%       2.61        perf-stat.i.metric.GHz
    366.33 ± 11%     -55.7%     162.26 ±  2%  perf-stat.i.metric.K/sec
    814.03 ±  4%     +85.1%       1506        perf-stat.i.metric.M/sec
      8343 ±  8%    +135.0%      19606 ± 13%  perf-stat.i.minor-faults
     94.12           -38.7       55.42 ±  4%  perf-stat.i.node-load-miss-rate%
  43036020 ± 17%     -67.1%   14153117 ±  5%  perf-stat.i.node-load-misses
   2451719 ± 11%    +433.0%   13067802 ±  6%  perf-stat.i.node-loads
      8343 ±  8%    +135.0%      19606 ± 13%  perf-stat.i.page-faults
      4.15 ±  3%     -39.0%       2.53 ±  6%  perf-stat.overall.MPKI
      0.63 ±  2%      -0.5        0.11 ±  4%  perf-stat.overall.branch-miss-rate%
      2.42 ±  5%     -52.4%       1.15        perf-stat.overall.cpi
      5766 ± 20%     -30.8%       3992 ±  3%  perf-stat.overall.cycles-between-cache-misses
      0.01 ± 27%      -0.0        0.00 ±  5%  perf-stat.overall.dTLB-load-miss-rate%
      0.41 ±  4%    +109.4%       0.87        perf-stat.overall.ipc
     94.52           -43.1       51.38 ±  4%  perf-stat.overall.node-load-miss-rate%
 5.247e+10 ±  4%     +85.2%  9.718e+10        perf-stat.ps.branch-instructions
 3.299e+08 ±  6%     -67.4%  1.077e+08 ±  3%  perf-stat.ps.branch-misses
  1.13e+08 ± 16%     +27.8%  1.444e+08 ±  3%  perf-stat.ps.cache-misses
 1.085e+09 ±  6%     +16.8%  1.267e+09 ±  5%  perf-stat.ps.cache-references
  29763457 ±  7%     -88.3%    3472989 ±  5%  perf-stat.ps.context-switches
    222876            -1.7%     218977        perf-stat.ps.cpu-clock
   6.3e+11            -8.6%  5.758e+11        perf-stat.ps.cpu-cycles
   2379691 ±  8%     -75.1%     592871 ±  9%  perf-stat.ps.cpu-migrations
  7.41e+10 ±  5%     +98.8%  1.473e+11        perf-stat.ps.dTLB-loads
    651771 ±  8%    +134.2%    1526629 ±  9%  perf-stat.ps.dTLB-store-misses
 4.362e+10 ±  5%     +99.0%   8.68e+10        perf-stat.ps.dTLB-stores
 2.613e+11 ±  4%     +91.4%  5.003e+11        perf-stat.ps.instructions
      7836 ±  8%    +154.0%      19905        perf-stat.ps.minor-faults
  40150372 ± 18%     -65.8%   13733653 ±  4%  perf-stat.ps.node-load-misses
   2283055 ± 14%    +469.4%   13000093 ±  5%  perf-stat.ps.node-loads
      7836 ±  8%    +154.0%      19905        perf-stat.ps.page-faults
    222876            -1.7%     218977        perf-stat.ps.task-clock
 5.285e+13 ±  3%     -54.6%  2.402e+13        perf-stat.total.instructions
  23914466 ±  3%   +1407.1%  3.604e+08 ± 25%  sched_debug.cfs_rq:/.avg_vruntime.avg
  35126345 ±  6%  +37460.4%  1.319e+10 ± 34%  sched_debug.cfs_rq:/.avg_vruntime.max
  18139757 ±  5%    -100.0%     197.50 ± 20%  sched_debug.cfs_rq:/.avg_vruntime.min
   3371084 ± 25%  +47997.3%  1.621e+09 ± 17%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      4.67 ± 25%     -98.5%       0.07 ± 11%  sched_debug.cfs_rq:/.h_nr_running.avg
     16.62 ± 29%     -88.0%       2.00 ± 28%  sched_debug.cfs_rq:/.h_nr_running.max
      2.93 ± 31%     -90.5%       0.28 ±  8%  sched_debug.cfs_rq:/.h_nr_running.stddev
    480.91 ± 65%    +366.5%       2243 ± 33%  sched_debug.cfs_rq:/.load_avg.avg
     20858 ± 11%    +318.7%      87341 ±  4%  sched_debug.cfs_rq:/.load_avg.max
      2817 ± 36%    +336.2%      12287 ± 20%  sched_debug.cfs_rq:/.load_avg.stddev
  23914466 ±  3%   +1406.9%  3.604e+08 ± 25%  sched_debug.cfs_rq:/.min_vruntime.avg
  35126345 ±  6%  +37460.4%  1.319e+10 ± 34%  sched_debug.cfs_rq:/.min_vruntime.max
  18139757 ±  5%    -100.0%     197.50 ± 20%  sched_debug.cfs_rq:/.min_vruntime.min
   3371084 ± 25%  +47991.3%  1.621e+09 ± 17%  sched_debug.cfs_rq:/.min_vruntime.stddev
      0.75 ±  2%     -90.8%       0.07 ± 11%  sched_debug.cfs_rq:/.nr_running.avg
      0.12 ± 44%    +128.8%       0.28 ±  8%  sched_debug.cfs_rq:/.nr_running.stddev
    133.96 ±  6%    +276.2%     504.00 ± 11%  sched_debug.cfs_rq:/.removed.runnable_avg.max
     17.50 ± 24%    +267.7%      64.36 ± 29%  sched_debug.cfs_rq:/.removed.runnable_avg.stddev
    133.92 ±  6%    +276.4%     504.00 ± 11%  sched_debug.cfs_rq:/.removed.util_avg.max
     17.50 ± 24%    +267.8%      64.36 ± 29%  sched_debug.cfs_rq:/.removed.util_avg.stddev
      4791 ± 25%     -96.8%     155.67 ±  3%  sched_debug.cfs_rq:/.runnable_avg.avg
     12189 ± 38%     -89.0%       1342 ± 21%  sched_debug.cfs_rq:/.runnable_avg.max
    604.08 ± 62%    -100.0%       0.00        sched_debug.cfs_rq:/.runnable_avg.min
      1941 ± 34%     -87.1%     250.76 ±  4%  sched_debug.cfs_rq:/.runnable_avg.stddev
    785.10 ±  3%     -80.5%     153.02 ±  3%  sched_debug.cfs_rq:/.util_avg.avg
    238.38 ± 63%    -100.0%       0.00        sched_debug.cfs_rq:/.util_avg.min
    166.97 ± 15%     +48.7%     248.30 ±  4%  sched_debug.cfs_rq:/.util_avg.stddev
    326.56 ± 15%     -97.8%       7.20 ± 38%  sched_debug.cfs_rq:/.util_est_enqueued.avg
      1223 ± 12%     -58.6%     506.50 ± 10%  sched_debug.cfs_rq:/.util_est_enqueued.max
    204.55 ±  5%     -72.8%      55.70 ± 22%  sched_debug.cfs_rq:/.util_est_enqueued.stddev
    445651 ±  6%    +106.6%     920880        sched_debug.cpu.avg_idle.avg
   1336974 ± 14%     +42.6%    1906857 ± 14%  sched_debug.cpu.avg_idle.max
    238870 ±  7%     -16.6%     199200 ±  8%  sched_debug.cpu.avg_idle.stddev
    132593 ±  2%     -71.5%      37769        sched_debug.cpu.clock.avg
    133813 ±  2%     -71.8%      37783        sched_debug.cpu.clock.max
    131303           -71.2%      37753        sched_debug.cpu.clock.min
    736.29 ± 63%     -99.0%       7.65 ±  9%  sched_debug.cpu.clock.stddev
    129865 ±  2%     -71.0%      37642        sched_debug.cpu.clock_task.avg
    132069 ±  2%     -71.4%      37762        sched_debug.cpu.clock_task.max
    114997           -78.2%      25068        sched_debug.cpu.clock_task.min
      1680 ± 25%     -49.4%     850.43        sched_debug.cpu.clock_task.stddev
     21245 ± 12%     -98.6%     288.92 ± 17%  sched_debug.cpu.curr->pid.avg
     26644 ±  7%     -80.5%       5186        sched_debug.cpu.curr->pid.max
      7604 ± 53%    -100.0%       0.00        sched_debug.cpu.curr->pid.min
      3443 ± 31%     -66.7%       1146 ±  7%  sched_debug.cpu.curr->pid.stddev
      0.00 ± 62%     -97.4%       0.00 ± 30%  sched_debug.cpu.next_balance.stddev
      4.63 ± 26%     -98.6%       0.07 ± 13%  sched_debug.cpu.nr_running.avg
     16.38 ± 31%     -87.8%       2.00 ± 28%  sched_debug.cpu.nr_running.max
      0.58 ± 31%    -100.0%       0.00        sched_debug.cpu.nr_running.min
      2.94 ± 32%     -90.7%       0.27 ±  9%  sched_debug.cpu.nr_running.stddev
  11862655 ±  9%    -100.0%       1063 ±  9%  sched_debug.cpu.nr_switches.avg
  14997743 ±  9%     -99.7%      48247 ± 13%  sched_debug.cpu.nr_switches.max
   7724483 ±  8%    -100.0%     129.83 ±  8%  sched_debug.cpu.nr_switches.min
   1714898 ± 30%     -99.8%       4013 ± 11%  sched_debug.cpu.nr_switches.stddev
    -40.04           -70.0%     -12.00        sched_debug.cpu.nr_uninterruptible.min
     12.93 ± 10%     -57.3%       5.53 ± 12%  sched_debug.cpu.nr_uninterruptible.stddev
    131286           -71.2%      37756        sched_debug.cpu_clk
    130075           -71.9%      36551        sched_debug.ktime
      0.63 ± 55%    -100.0%       0.00        sched_debug.rt_rq:.rt_time.avg
    140.28 ± 55%    -100.0%       0.00        sched_debug.rt_rq:.rt_time.max
      9.35 ± 55%    -100.0%       0.00        sched_debug.rt_rq:.rt_time.stddev
    132176           -70.8%      38635        sched_debug.sched_clk
  29305629          +300.0%  1.172e+08        sched_debug.sysctl_sched.sysctl_sched_features
     13.89 ±136%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.mutex_lock.pipe_read.vfs_read.ksys_read
      1.25 ±221%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.mutex_lock.pipe_write.vfs_write.ksys_write
      0.09 ±187%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      0.64 ±103%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      0.64 ± 67%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      4.89 ±180%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
      1.72 ± 82%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      0.54 ± 34%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
     13.44 ± 43%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      3.55 ±111%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.pipe_write.vfs_write.ksys_write.do_syscall_64
     42.90 ±202%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      0.03 ± 53%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
     13.71 ±195%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.pipe_read
    862.85 ±223%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.03 ± 37%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
    220.07 ± 89%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     45.86 ±141%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    839.35 ± 67%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      4798 ±126%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.mutex_lock.pipe_read.vfs_read.ksys_read
      5670 ±222%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.mutex_lock.pipe_write.vfs_write.ksys_write
      0.55 ±194%    -100.0%       0.00        perf-sched.sch_delay.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      9.26 ±149%    -100.0%       0.00        perf-sched.sch_delay.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
     52.45 ±119%    -100.0%       0.00        perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      3520 ±167%    -100.0%       0.00        perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
      1004 ±110%    -100.0%       0.00        perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
     37153 ± 43%    -100.0%       0.00        perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
     35636 ± 45%    -100.0%       0.00        perf-sched.sch_delay.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      8308 ±131%    -100.0%       0.00        perf-sched.sch_delay.max.ms.pipe_write.vfs_write.ksys_write.do_syscall_64
    959.70 ±209%    -100.0%       0.00        perf-sched.sch_delay.max.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      0.03 ± 46%    -100.0%       0.00        perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
     32.36 ±160%    -100.0%       0.00        perf-sched.sch_delay.max.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.pipe_read
      6902 ±223%    -100.0%       0.00        perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.03 ± 39%    -100.0%       0.00        perf-sched.sch_delay.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
     19816 ± 88%    -100.0%       0.00        perf-sched.sch_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     12281 ±137%    -100.0%       0.00        perf-sched.sch_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     34996 ± 60%    -100.0%       0.00        perf-sched.sch_delay.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      8.83 ± 42%    -100.0%       0.00        perf-sched.total_sch_delay.average.ms
     38100 ± 44%    -100.0%       0.00        perf-sched.total_sch_delay.max.ms
     42.34 ± 40%    -100.0%       0.00        perf-sched.total_wait_and_delay.average.ms
   2524716          -100.0%       0.00        perf-sched.total_wait_and_delay.count.ms
     74612 ± 43%    -100.0%       0.00        perf-sched.total_wait_and_delay.max.ms
     33.51 ± 40%    -100.0%       0.00        perf-sched.total_wait_time.average.ms
     39307 ± 42%    -100.0%       0.00        perf-sched.total_wait_time.max.ms
      2277 ± 74%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.shrink_dentry_list.shrink_dcache_parent.d_invalidate.proc_invalidate_siblings_dcache
     16.86 ± 39%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
     53.75 ± 43%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
     93.92 ± 40%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.pipe_write.vfs_write.ksys_write.do_syscall_64
      5095 ± 54%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      3672 ± 44%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     11.33 ± 12%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.shrink_dentry_list.shrink_dcache_parent.d_invalidate.proc_invalidate_siblings_dcache
    881180 ±  4%    -100.0%       0.00        perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
   1604798          -100.0%       0.00        perf-sched.wait_and_delay.count.pipe_read.vfs_read.ksys_read.do_syscall_64
     30808 ± 44%    -100.0%       0.00        perf-sched.wait_and_delay.count.pipe_write.vfs_write.ksys_write.do_syscall_64
    372.00 ± 13%    -100.0%       0.00        perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    125.17 ± 17%    -100.0%       0.00        perf-sched.wait_and_delay.count.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     12779 ± 71%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.shrink_dentry_list.shrink_dcache_parent.d_invalidate.proc_invalidate_siblings_dcache
     74612 ± 43%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
     70238 ± 44%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
     36709 ± 46%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.pipe_write.vfs_write.ksys_write.do_syscall_64
     47853 ± 49%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     43973 ± 45%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     13.89 ± 99%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.shmem_alloc_folio
      2.08 ±182%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.pipe_write.vfs_write.ksys_write
      5.33 ±164%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__do_fault.do_read_fault.do_fault.__handle_mm_fault
      2.02 ±157%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.sched_setaffinity.__x64_sys_sched_setaffinity
    177.12 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__mutex_lock.constprop.0.pipe_write
     84.71 ± 54%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      6.98 ±211%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_read.exit_mm.do_exit.__x64_sys_exit
      0.10 ±100%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      0.25 ± 91%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.dput.__fput.task_work_run.exit_to_user_mode_loop
      7.20 ± 96%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
      1.37 ±121%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.lock_mm_and_find_vma.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
     53.89 ±145%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.perf_event_ctx_lock_nested.constprop.0
     30.20 ± 54%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.pipe_read.vfs_read.ksys_read
     42.39 ± 47%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.pipe_write.vfs_write.ksys_write
      0.14 ±102%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock_killable.pcpu_alloc.__percpu_counter_init.mm_init
      0.84 ± 94%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.pipe_read.vfs_read.ksys_read.do_syscall_64
      2277 ± 74%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.shrink_dentry_list.shrink_dcache_parent.d_invalidate.proc_invalidate_siblings_dcache
      0.28 ±141%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
    290.43 ± 82%    -100.0%       0.00        perf-sched.wait_time.avg.ms.do_task_dead.do_exit.__x64_sys_exit.do_syscall_64.entry_SYSCALL_64_after_hwframe
     20.02 ±205%    -100.0%       0.00        perf-sched.wait_time.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      2373 ±104%    -100.0%       0.00        perf-sched.wait_time.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
    311.34 ±221%    -100.0%       0.00        perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_fault
     91.42 ±110%    -100.0%       0.00        perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      0.71 ± 47%    -100.0%       0.00        perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function
      8.77 ±119%    -100.0%       0.00        perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
     60.25 ± 87%    -100.0%       0.00        perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
     16.32 ± 39%    -100.0%       0.00        perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
     40.31 ± 43%    -100.0%       0.00        perf-sched.wait_time.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
     90.36 ± 38%    -100.0%       0.00        perf-sched.wait_time.avg.ms.pipe_write.vfs_write.ksys_write.do_syscall_64
     43.05 ±206%    -100.0%       0.00        perf-sched.wait_time.avg.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
    187.75 ±201%    -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.pipe_read
     78.90 ±119%    -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.pipe_write
     73.07 ±199%    -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    263.79 ± 91%    -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      5049 ± 54%    -100.0%       0.00        perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.74 ±188%    -100.0%       0.00        perf-sched.wait_time.avg.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
      2832 ± 42%    -100.0%       0.00        perf-sched.wait_time.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     42.64 ± 89%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.shmem_alloc_folio
     17.00 ±191%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.pipe_write.vfs_write.ksys_write
     15.03 ±133%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__do_fault.do_read_fault.do_fault.__handle_mm_fault
      7.07 ±182%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.sched_setaffinity.__x64_sys_sched_setaffinity
      5294 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__mutex_lock.constprop.0.pipe_write
      6101 ± 47%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      7.02 ±210%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_read.exit_mm.do_exit.__x64_sys_exit
      0.30 ± 74%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      0.35 ± 64%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.dput.__fput.task_work_run.exit_to_user_mode_loop
    934.74 ±208%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
     13.21 ±162%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.lock_mm_and_find_vma.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      1084 ±146%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.perf_event_ctx_lock_nested.constprop.0
      8700 ± 58%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.pipe_read.vfs_read.ksys_read
     29595 ± 38%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.pipe_write.vfs_write.ksys_write
      0.44 ±119%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.mutex_lock_killable.pcpu_alloc.__percpu_counter_init.mm_init
      9.44 ±109%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.pipe_read.vfs_read.ksys_read.do_syscall_64
     12779 ± 71%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.shrink_dentry_list.shrink_dcache_parent.d_invalidate.proc_invalidate_siblings_dcache
      0.99 ±149%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      7517 ±133%    -100.0%       0.00        perf-sched.wait_time.max.ms.do_task_dead.do_exit.__x64_sys_exit.do_syscall_64.entry_SYSCALL_64_after_hwframe
    174.36 ±212%    -100.0%       0.00        perf-sched.wait_time.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
     19025 ±101%    -100.0%       0.00        perf-sched.wait_time.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      4026 ±222%    -100.0%       0.00        perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_fault
     10068 ±132%    -100.0%       0.00        perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      1.82 ± 56%    -100.0%       0.00        perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function
      4513 ±109%    -100.0%       0.00        perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
     18238 ± 68%    -100.0%       0.00        perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
     39253 ± 42%    -100.0%       0.00        perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
     36572 ± 41%    -100.0%       0.00        perf-sched.wait_time.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
     30315 ± 46%    -100.0%       0.00        perf-sched.wait_time.max.ms.pipe_write.vfs_write.ksys_write.do_syscall_64
    937.31 ±217%    -100.0%       0.00        perf-sched.wait_time.max.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      2957 ±220%    -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.pipe_read
     14165 ±130%    -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.pipe_write
    417.66 ±209%    -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
     20537 ± 85%    -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     38202 ± 43%    -100.0%       0.00        perf-sched.wait_time.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      2.20 ±182%    -100.0%       0.00        perf-sched.wait_time.max.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
     38193 ± 42%    -100.0%       0.00        perf-sched.wait_time.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     99.51           -99.5        0.00        perf-profile.calltrace.cycles-pp.start_thread
     50.97 ±  4%     -51.0        0.00        perf-profile.calltrace.cycles-pp.__libc_write.start_thread
     47.65 ±  6%     -47.6        0.00        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__libc_write.start_thread
     47.25 ±  6%     -47.3        0.00        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write.start_thread
     43.23 ±  3%     -43.2        0.00        perf-profile.calltrace.cycles-pp.__libc_read.start_thread
     41.57 ±  8%     -41.6        0.00        perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write.start_thread
     39.80           -39.8        0.00        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__libc_read.start_thread
     39.27           -39.3        0.00        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read.start_thread
     37.50 ± 11%     -37.1        0.42 ±142%  perf-profile.calltrace.cycles-pp.pipe_write.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
     36.64           -36.6        0.00        perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read.start_thread
     35.00           -35.0        0.00        perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read
     32.43 ±  3%     -32.0        0.39 ±223%  perf-profile.calltrace.cycles-pp.pipe_read.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
     29.78 ± 17%     -29.8        0.00        perf-profile.calltrace.cycles-pp.__wake_up_common_lock.pipe_write.vfs_write.ksys_write.do_syscall_64
     29.05 ± 17%     -29.1        0.00        perf-profile.calltrace.cycles-pp.__wake_up_common.__wake_up_common_lock.pipe_write.vfs_write.ksys_write
     28.62 ± 17%     -28.6        0.00        perf-profile.calltrace.cycles-pp.autoremove_wake_function.__wake_up_common.__wake_up_common_lock.pipe_write.vfs_write
     28.45 ± 17%     -28.5        0.00        perf-profile.calltrace.cycles-pp.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock.pipe_write
     39.37 ±  9%     -27.5       11.89 ±  8%  perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
     23.50 ±  9%     -23.5        0.00        perf-profile.calltrace.cycles-pp.schedule.pipe_read.vfs_read.ksys_read.do_syscall_64
     23.22 ±  9%     -23.2        0.00        perf-profile.calltrace.cycles-pp.__schedule.schedule.pipe_read.vfs_read.ksys_read
     18.40 ± 11%     -18.4        0.00        perf-profile.calltrace.cycles-pp.ttwu_do_activate.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock
     17.70 ± 12%     -17.7        0.00        perf-profile.calltrace.cycles-pp.activate_task.ttwu_do_activate.try_to_wake_up.autoremove_wake_function.__wake_up_common
     17.46 ± 11%     -17.5        0.00        perf-profile.calltrace.cycles-pp.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_wake_up.autoremove_wake_function
     15.11 ± 13%     -15.1        0.00        perf-profile.calltrace.cycles-pp.dequeue_task_fair.__schedule.schedule.pipe_read.vfs_read
     11.86 ±  9%     -11.9        0.00        perf-profile.calltrace.cycles-pp.update_cfs_group.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_wake_up
     11.63 ± 15%     -11.6        0.00        perf-profile.calltrace.cycles-pp.update_cfs_group.dequeue_task_fair.__schedule.schedule.pipe_read
      5.27 ±  4%      -5.3        0.00        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write.start_thread
      5.05 ±  3%      -5.1        0.00        perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
      5.04 ± 12%      -5.0        0.00        perf-profile.calltrace.cycles-pp._raw_spin_lock.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock
      0.00            +2.6        2.60 ± 41%  perf-profile.calltrace.cycles-pp.do_group_exit.__x64_sys_exit_group.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +2.6        2.60 ± 41%  perf-profile.calltrace.cycles-pp.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +2.6        2.60 ± 41%  perf-profile.calltrace.cycles-pp.__x64_sys_exit_group.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +2.8        2.81 ± 48%  perf-profile.calltrace.cycles-pp.copyin.copy_page_from_iter_atomic.generic_perform_write.generic_file_write_iter.vfs_write
      0.00            +3.0        3.00 ± 32%  perf-profile.calltrace.cycles-pp.bprm_execve.do_execveat_common.__x64_sys_execve.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +3.0        3.02 ± 50%  perf-profile.calltrace.cycles-pp.copy_process.kernel_clone.__do_sys_clone.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +3.0        3.04 ± 93%  perf-profile.calltrace.cycles-pp.poll_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      0.00            +3.1        3.05 ± 48%  perf-profile.calltrace.cycles-pp.copy_page_from_iter_atomic.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
      0.00            +3.2        3.19 ± 35%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.execve
      0.00            +3.2        3.19 ± 35%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.execve
      0.00            +3.2        3.19 ± 35%  perf-profile.calltrace.cycles-pp.execve
      0.00            +3.2        3.19 ± 35%  perf-profile.calltrace.cycles-pp.__x64_sys_execve.do_syscall_64.entry_SYSCALL_64_after_hwframe.execve
      0.00            +3.2        3.19 ± 35%  perf-profile.calltrace.cycles-pp.do_execveat_common.__x64_sys_execve.do_syscall_64.entry_SYSCALL_64_after_hwframe.execve
      0.00            +3.9        3.89 ± 51%  perf-profile.calltrace.cycles-pp.asm_exc_page_fault
      0.00            +3.9        3.89 ± 39%  perf-profile.calltrace.cycles-pp.fault_in_readable.fault_in_iov_iter_readable.generic_perform_write.generic_file_write_iter.vfs_write
      0.00            +3.9        3.90 ± 45%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__libc_fork
      0.00            +3.9        3.90 ± 45%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_fork
      0.00            +3.9        3.90 ± 45%  perf-profile.calltrace.cycles-pp.__do_sys_clone.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_fork
      0.00            +3.9        3.90 ± 45%  perf-profile.calltrace.cycles-pp.kernel_clone.__do_sys_clone.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_fork
      0.00            +4.1        4.13 ± 41%  perf-profile.calltrace.cycles-pp.__libc_fork
      0.00            +4.2        4.20 ± 58%  perf-profile.calltrace.cycles-pp.asm_exc_page_fault.fault_in_readable.fault_in_iov_iter_readable.generic_perform_write.generic_file_write_iter
      0.00            +4.7        4.67 ± 45%  perf-profile.calltrace.cycles-pp.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.00            +4.7        4.72 ± 61%  perf-profile.calltrace.cycles-pp.proc_single_show.seq_read_iter.seq_read.vfs_read.ksys_read
      0.00            +4.7        4.72 ± 61%  perf-profile.calltrace.cycles-pp.proc_pid_status.proc_single_show.seq_read_iter.seq_read.vfs_read
      0.00            +4.8        4.80 ± 49%  perf-profile.calltrace.cycles-pp.fault_in_iov_iter_readable.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
      0.00            +4.8        4.82 ± 58%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
      0.00            +4.8        4.82 ± 58%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
      0.00            +4.8        4.82 ± 58%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
      0.00            +5.0        4.96 ± 58%  perf-profile.calltrace.cycles-pp.seq_read_iter.seq_read.vfs_read.ksys_read.do_syscall_64
      0.00            +5.0        4.96 ± 58%  perf-profile.calltrace.cycles-pp.seq_read.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +5.1        5.15 ± 53%  perf-profile.calltrace.cycles-pp.vsnprintf.seq_printf.show_interrupts.seq_read_iter.proc_reg_read_iter
      0.00            +5.8        5.83 ± 38%  perf-profile.calltrace.cycles-pp.seq_printf.show_interrupts.seq_read_iter.proc_reg_read_iter.vfs_read
      0.20 ±223%      +6.1        6.34 ± 43%  perf-profile.calltrace.cycles-pp.secondary_startup_64_no_verify
      0.20 ±223%      +6.1        6.34 ± 43%  perf-profile.calltrace.cycles-pp.start_secondary.secondary_startup_64_no_verify
      0.20 ±223%      +6.1        6.34 ± 43%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
      0.20 ±223%      +6.1        6.34 ± 43%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
      0.00            +6.8        6.84 ± 41%  perf-profile.calltrace.cycles-pp.smp_call_function_single.event_function_call.perf_event_release_kernel.perf_release.__fput
      0.00            +7.3        7.33 ± 39%  perf-profile.calltrace.cycles-pp.event_function_call.perf_event_release_kernel.perf_release.__fput.task_work_run
      0.00            +8.2        8.15 ± 40%  perf-profile.calltrace.cycles-pp.show_interrupts.seq_read_iter.proc_reg_read_iter.vfs_read.ksys_read
      0.00           +10.4       10.39 ± 54%  perf-profile.calltrace.cycles-pp.perf_release.__fput.task_work_run.do_exit.do_group_exit
      0.00           +10.4       10.39 ± 54%  perf-profile.calltrace.cycles-pp.perf_event_release_kernel.perf_release.__fput.task_work_run.do_exit
      0.00           +11.0       11.03 ± 28%  perf-profile.calltrace.cycles-pp.seq_read_iter.proc_reg_read_iter.vfs_read.ksys_read.do_syscall_64
      0.00           +11.0       11.03 ± 28%  perf-profile.calltrace.cycles-pp.proc_reg_read_iter.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00           +11.2       11.22 ± 45%  perf-profile.calltrace.cycles-pp.__fput.task_work_run.do_exit.do_group_exit.get_signal
      0.00           +11.4       11.42 ± 43%  perf-profile.calltrace.cycles-pp.task_work_run.do_exit.do_group_exit.get_signal.arch_do_signal_or_restart
      0.00           +11.9       11.89 ±  8%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__libc_write.writen.record__pushfn.perf_mmap__push
      0.00           +11.9       11.89 ±  8%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write.writen.record__pushfn
      0.00           +11.9       11.89 ±  8%  perf-profile.calltrace.cycles-pp.record__pushfn.perf_mmap__push.record__mmap_read_evlist.__cmd_record.cmd_record
      0.00           +11.9       11.89 ±  8%  perf-profile.calltrace.cycles-pp.writen.record__pushfn.perf_mmap__push.record__mmap_read_evlist.__cmd_record
      0.00           +11.9       11.89 ±  8%  perf-profile.calltrace.cycles-pp.__libc_write.writen.record__pushfn.perf_mmap__push.record__mmap_read_evlist
      0.00           +11.9       11.89 ±  8%  perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write.writen
      0.00           +11.9       11.89 ±  8%  perf-profile.calltrace.cycles-pp.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00           +11.9       11.89 ±  8%  perf-profile.calltrace.cycles-pp.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64
      4.46 ±  7%     +13.0       17.50 ± 28%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00           +13.5       13.46 ± 16%  perf-profile.calltrace.cycles-pp.perf_mmap__push.record__mmap_read_evlist.__cmd_record.cmd_record.run_builtin
      0.00           +13.6       13.64 ± 14%  perf-profile.calltrace.cycles-pp.record__mmap_read_evlist.__cmd_record.cmd_record.run_builtin.main
      0.00           +14.3       14.26 ± 12%  perf-profile.calltrace.cycles-pp.__cmd_record.cmd_record.run_builtin.main.__libc_start_main
      0.00           +14.3       14.26 ± 12%  perf-profile.calltrace.cycles-pp.__libc_start_main
      0.00           +14.3       14.26 ± 12%  perf-profile.calltrace.cycles-pp.main.__libc_start_main
      0.00           +14.3       14.26 ± 12%  perf-profile.calltrace.cycles-pp.run_builtin.main.__libc_start_main
      0.00           +14.3       14.26 ± 12%  perf-profile.calltrace.cycles-pp.cmd_record.run_builtin.main.__libc_start_main
      0.00           +14.8       14.76 ± 26%  perf-profile.calltrace.cycles-pp.queue_event.ordered_events__queue.process_simple.reader__read_event.perf_session__process_events
      0.00           +14.8       14.76 ± 26%  perf-profile.calltrace.cycles-pp.perf_session__process_events.record__finish_output.__cmd_record
      0.00           +14.8       14.76 ± 26%  perf-profile.calltrace.cycles-pp.reader__read_event.perf_session__process_events.record__finish_output.__cmd_record
      0.00           +14.8       14.76 ± 26%  perf-profile.calltrace.cycles-pp.process_simple.reader__read_event.perf_session__process_events.record__finish_output.__cmd_record
      0.00           +14.8       14.76 ± 26%  perf-profile.calltrace.cycles-pp.ordered_events__queue.process_simple.reader__read_event.perf_session__process_events.record__finish_output
      0.00           +15.0       14.97 ± 27%  perf-profile.calltrace.cycles-pp.__cmd_record
      0.00           +15.0       14.97 ± 27%  perf-profile.calltrace.cycles-pp.record__finish_output.__cmd_record
      0.00           +16.1       16.14 ± 29%  perf-profile.calltrace.cycles-pp.do_group_exit.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop.exit_to_user_mode_prepare
      0.00           +16.1       16.14 ± 29%  perf-profile.calltrace.cycles-pp.do_exit.do_group_exit.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop
      0.00           +16.1       16.14 ± 29%  perf-profile.calltrace.cycles-pp.arch_do_signal_or_restart.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.00           +16.1       16.14 ± 29%  perf-profile.calltrace.cycles-pp.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      0.00           +16.4       16.38 ± 17%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      0.00           +16.4       16.38 ± 17%  perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      0.00           +16.4       16.38 ± 17%  perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      0.00           +16.6       16.57 ± 18%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.read
      0.00           +16.6       16.58 ± 30%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00           +16.6       16.58 ± 30%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00           +17.0       16.97 ± 17%  perf-profile.calltrace.cycles-pp.read
      0.00           +24.4       24.37 ± 22%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00           +24.6       24.56 ± 21%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
     99.51           -99.5        0.00        perf-profile.children.cycles-pp.start_thread
     43.84 ±  3%     -43.8        0.00        perf-profile.children.cycles-pp.__libc_read
     51.57 ±  4%     -39.7       11.89 ±  8%  perf-profile.children.cycles-pp.__libc_write
     37.65 ± 11%     -37.2        0.42 ±142%  perf-profile.children.cycles-pp.pipe_write
     32.61 ±  2%     -32.2        0.39 ±223%  perf-profile.children.cycles-pp.pipe_read
     31.41 ± 15%     -31.2        0.20 ±223%  perf-profile.children.cycles-pp.__wake_up_common_lock
     30.47 ± 15%     -30.5        0.00        perf-profile.children.cycles-pp.__wake_up_common
     30.03 ± 15%     -30.0        0.00        perf-profile.children.cycles-pp.autoremove_wake_function
     29.91 ± 15%     -29.9        0.00        perf-profile.children.cycles-pp.try_to_wake_up
     29.44 ±  6%     -29.4        0.00        perf-profile.children.cycles-pp.schedule
     41.70 ±  8%     -29.4       12.31 ±  8%  perf-profile.children.cycles-pp.ksys_write
     39.51 ±  9%     -27.2       12.31 ±  8%  perf-profile.children.cycles-pp.vfs_write
     29.17 ±  6%     -27.0        2.20 ± 94%  perf-profile.children.cycles-pp.__schedule
     25.08 ± 12%     -25.1        0.00        perf-profile.children.cycles-pp.update_cfs_group
     36.73           -20.4       16.38 ± 17%  perf-profile.children.cycles-pp.ksys_read
     87.59 ±  2%     -19.8       67.78 ±  4%  perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     86.84 ±  3%     -19.4       67.40 ±  4%  perf-profile.children.cycles-pp.do_syscall_64
     19.36 ± 14%     -19.4        0.00        perf-profile.children.cycles-pp.ttwu_do_activate
     35.10           -18.7       16.38 ± 17%  perf-profile.children.cycles-pp.vfs_read
     18.63 ± 15%     -18.6        0.00        perf-profile.children.cycles-pp.activate_task
     18.39 ± 15%     -18.4        0.00        perf-profile.children.cycles-pp.enqueue_task_fair
     16.15 ± 10%     -16.2        0.00        perf-profile.children.cycles-pp.dequeue_task_fair
      7.94 ± 15%      -7.5        0.43 ±141%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      8.64 ± 13%      -6.7        1.98 ± 38%  perf-profile.children.cycles-pp._raw_spin_lock
      1.90 ±  5%      -1.1        0.83 ± 71%  perf-profile.children.cycles-pp.mutex_unlock
      0.05 ± 73%      +1.5        1.53 ± 36%  perf-profile.children.cycles-pp.__alloc_pages
      0.84 ± 30%      +2.0        2.81 ± 48%  perf-profile.children.cycles-pp.copyin
      0.00            +2.6        2.60 ± 41%  perf-profile.children.cycles-pp.__x64_sys_exit_group
      0.00            +3.0        3.00 ± 32%  perf-profile.children.cycles-pp.bprm_execve
      0.00            +3.0        3.02 ± 50%  perf-profile.children.cycles-pp.copy_process
      0.00            +3.0        3.04 ± 93%  perf-profile.children.cycles-pp.poll_idle
      0.00            +3.1        3.05 ± 48%  perf-profile.children.cycles-pp.copy_page_from_iter_atomic
      0.00            +3.2        3.19 ± 35%  perf-profile.children.cycles-pp.execve
      0.00            +3.4        3.38 ± 41%  perf-profile.children.cycles-pp.__x64_sys_execve
      0.00            +3.4        3.38 ± 41%  perf-profile.children.cycles-pp.do_execveat_common
      0.00            +3.9        3.90 ± 45%  perf-profile.children.cycles-pp.__do_sys_clone
      0.00            +3.9        3.90 ± 45%  perf-profile.children.cycles-pp.kernel_clone
      0.00            +4.1        4.13 ± 41%  perf-profile.children.cycles-pp.__libc_fork
      0.00            +4.7        4.66 ± 45%  perf-profile.children.cycles-pp.__handle_mm_fault
      0.00            +4.7        4.72 ± 61%  perf-profile.children.cycles-pp.proc_single_show
      0.00            +4.7        4.72 ± 61%  perf-profile.children.cycles-pp.proc_pid_status
      0.05 ±223%      +4.8        4.82 ± 58%  perf-profile.children.cycles-pp.cpuidle_idle_call
      0.05 ±223%      +4.8        4.82 ± 58%  perf-profile.children.cycles-pp.cpuidle_enter
      0.05 ±223%      +4.8        4.82 ± 58%  perf-profile.children.cycles-pp.cpuidle_enter_state
      0.00            +4.8        4.80 ± 49%  perf-profile.children.cycles-pp.fault_in_readable
      0.00            +4.8        4.80 ± 49%  perf-profile.children.cycles-pp.fault_in_iov_iter_readable
      0.00            +5.0        4.96 ± 58%  perf-profile.children.cycles-pp.seq_read
      0.00            +5.3        5.26 ± 54%  perf-profile.children.cycles-pp.handle_mm_fault
      0.00            +6.1        6.14 ± 53%  perf-profile.children.cycles-pp.do_user_addr_fault
      0.20 ±223%      +6.1        6.34 ± 43%  perf-profile.children.cycles-pp.secondary_startup_64_no_verify
      0.20 ±223%      +6.1        6.34 ± 43%  perf-profile.children.cycles-pp.cpu_startup_entry
      0.20 ±223%      +6.1        6.34 ± 43%  perf-profile.children.cycles-pp.do_idle
      0.20 ±223%      +6.1        6.34 ± 43%  perf-profile.children.cycles-pp.start_secondary
      0.00            +6.4        6.38 ± 53%  perf-profile.children.cycles-pp.exc_page_fault
      0.00            +7.1        7.09 ± 39%  perf-profile.children.cycles-pp.smp_call_function_single
      0.00            +7.1        7.09 ± 39%  perf-profile.children.cycles-pp.event_function_call
      0.00            +7.4        7.41 ± 41%  perf-profile.children.cycles-pp.vsnprintf
      0.00            +7.8        7.85 ± 33%  perf-profile.children.cycles-pp.seq_printf
      0.00            +8.2        8.15 ± 40%  perf-profile.children.cycles-pp.show_interrupts
      0.00            +8.6        8.64 ± 42%  perf-profile.children.cycles-pp.asm_exc_page_fault
      7.48 ±  6%     +10.0       17.50 ± 28%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      0.00           +10.4       10.39 ± 54%  perf-profile.children.cycles-pp.perf_release
      0.00           +10.4       10.39 ± 54%  perf-profile.children.cycles-pp.perf_event_release_kernel
      6.95 ±  5%     +10.6       17.50 ± 28%  perf-profile.children.cycles-pp.exit_to_user_mode_prepare
      0.00           +11.0       11.03 ± 28%  perf-profile.children.cycles-pp.proc_reg_read_iter
      0.04 ±112%     +11.9       11.89 ±  8%  perf-profile.children.cycles-pp.record__pushfn
      0.02 ±149%     +11.9       11.89 ±  8%  perf-profile.children.cycles-pp.generic_file_write_iter
      0.02 ±223%     +11.9       11.89 ±  8%  perf-profile.children.cycles-pp.generic_perform_write
      0.04 ± 83%     +12.0       12.08 ±  6%  perf-profile.children.cycles-pp.writen
      0.00           +12.5       12.54 ± 40%  perf-profile.children.cycles-pp.__fput
      4.74 ±  3%     +12.8       17.50 ± 28%  perf-profile.children.cycles-pp.exit_to_user_mode_loop
      0.00           +13.0       12.98 ± 37%  perf-profile.children.cycles-pp.task_work_run
      0.08 ± 37%     +13.4       13.46 ± 16%  perf-profile.children.cycles-pp.perf_mmap__push
      0.09 ± 34%     +13.6       13.64 ± 14%  perf-profile.children.cycles-pp.record__mmap_read_evlist
      0.10 ± 30%     +14.2       14.26 ± 12%  perf-profile.children.cycles-pp.__libc_start_main
      0.10 ± 30%     +14.2       14.26 ± 12%  perf-profile.children.cycles-pp.main
      0.10 ± 30%     +14.2       14.26 ± 12%  perf-profile.children.cycles-pp.run_builtin
      0.10 ± 27%     +14.2       14.26 ± 12%  perf-profile.children.cycles-pp.cmd_record
      0.10 ±117%     +14.7       14.76 ± 26%  perf-profile.children.cycles-pp.queue_event
      0.10 ±119%     +14.7       14.76 ± 26%  perf-profile.children.cycles-pp.process_simple
      0.10 ±117%     +14.7       14.76 ± 26%  perf-profile.children.cycles-pp.ordered_events__queue
      0.10 ±117%     +14.9       14.97 ± 27%  perf-profile.children.cycles-pp.record__finish_output
      0.10 ±117%     +14.9       14.97 ± 27%  perf-profile.children.cycles-pp.perf_session__process_events
      0.10 ±117%     +14.9       14.97 ± 27%  perf-profile.children.cycles-pp.reader__read_event
      0.00           +16.0       15.99 ± 20%  perf-profile.children.cycles-pp.seq_read_iter
      0.00           +16.1       16.14 ± 29%  perf-profile.children.cycles-pp.arch_do_signal_or_restart
      0.00           +16.1       16.14 ± 29%  perf-profile.children.cycles-pp.get_signal
      0.00           +17.2       17.16 ± 18%  perf-profile.children.cycles-pp.read
      0.00           +18.7       18.74 ± 27%  perf-profile.children.cycles-pp.do_group_exit
      0.00           +18.7       18.74 ± 27%  perf-profile.children.cycles-pp.do_exit
      0.22 ± 63%     +29.0       29.23 ± 12%  perf-profile.children.cycles-pp.__cmd_record
     25.05 ± 12%     -25.0        0.00        perf-profile.self.cycles-pp.update_cfs_group
      7.94 ± 15%      -7.5        0.43 ±141%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      1.83 ±  5%      -1.0        0.83 ± 71%  perf-profile.self.cycles-pp.mutex_unlock
      0.71 ±  5%      +0.8        1.54 ± 40%  perf-profile.self.cycles-pp._raw_spin_lock
      0.82 ± 31%      +2.0        2.81 ± 48%  perf-profile.self.cycles-pp.copyin
      0.00            +3.0        3.04 ± 93%  perf-profile.self.cycles-pp.poll_idle
      0.00            +3.6        3.61 ± 25%  perf-profile.self.cycles-pp.vsnprintf
      0.00            +6.1        6.07 ± 42%  perf-profile.self.cycles-pp.smp_call_function_single
      0.10 ±120%     +14.4       14.52 ± 27%  perf-profile.self.cycles-pp.queue_event



***************************************************************************************************
lkp-icl-2sp2: 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2.00GHz (Ice Lake) with 256G memory
=========================================================================================
cluster/compiler/cpufreq_governor/ip/kconfig/nr_threads/rootfs/runtime/tbox_group/test/testcase:
  cs-localhost/gcc-12/performance/ipv4/x86_64-rhel-8.3/200%/debian-11.1-x86_64-20220510.cgz/300s/lkp-icl-2sp2/TCP_STREAM/netperf

commit: 
  e0c2ff903c ("sched/fair: Remove sched_feat(START_DEBIT)")
  86bfbb7ce4 ("sched/fair: Add lag based placement")

e0c2ff903c320d3f 86bfbb7ce4f67a88df263919816 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 3.949e+08 ±  5%     +21.8%  4.809e+08 ± 16%  cpuidle..time
   1546317 ± 19%     +74.8%    2702408 ± 33%  cpuidle..usage
 7.402e+08 ±  3%     -34.0%  4.885e+08 ±  2%  numa-numastat.node0.local_node
 7.402e+08 ±  3%     -34.0%  4.885e+08 ±  2%  numa-numastat.node0.numa_hit
 7.682e+08 ±  2%     -38.5%  4.721e+08 ±  2%  numa-numastat.node1.local_node
 7.683e+08 ±  2%     -38.5%  4.722e+08 ±  2%  numa-numastat.node1.numa_hit
     47.00 ± 25%  +14581.9%       6900 ±  8%  perf-c2c.DRAM.local
    733.00 ± 19%     +42.8%       1047 ±  8%  perf-c2c.DRAM.remote
      1921 ± 16%    +121.6%       4257 ± 14%  perf-c2c.HITM.local
      2208 ± 17%    +107.0%       4571 ± 13%  perf-c2c.HITM.total
   5581855 ±  7%     -17.5%    4604498 ±  2%  vmstat.memory.cache
    312.67           +16.2%     363.33        vmstat.procs.r
  18407380           -95.7%     788717 ±  4%  vmstat.system.cs
    214406 ±  2%     -28.4%     153412        vmstat.system.in
      0.82 ± 14%      +0.3        1.08 ± 22%  mpstat.cpu.all.idle%
      1.46            +0.4        1.83        mpstat.cpu.all.irq%
     19.39           -13.7        5.66        mpstat.cpu.all.soft%
     74.10           +15.7       89.83        mpstat.cpu.all.sys%
      4.24            -2.6        1.60 ±  2%  mpstat.cpu.all.usr%
     84665 ± 28%     -34.3%      55610 ± 34%  numa-meminfo.node0.Mapped
     15514 ± 19%     -41.5%       9073 ± 35%  numa-meminfo.node0.PageTables
   1106227 ± 25%     -62.3%     416852 ± 28%  numa-meminfo.node1.Inactive
   1106128 ± 25%     -62.3%     416827 ± 28%  numa-meminfo.node1.Inactive(anon)
    441903 ± 33%     -50.6%     218229 ± 17%  numa-meminfo.node1.Mapped
   2751036 ± 15%     -36.3%    1753526 ±  6%  numa-meminfo.node1.Shmem
   5440888 ±  7%     -18.0%    4461659 ±  2%  meminfo.Cached
   3680890 ± 11%     -27.2%    2678189 ±  4%  meminfo.Committed_AS
   1407128 ± 18%     -45.6%     766053 ±  8%  meminfo.Inactive
   1406980 ± 18%     -45.6%     765905 ±  8%  meminfo.Inactive(anon)
    526433 ± 31%     -49.3%     266825 ± 20%  meminfo.Mapped
   2765164 ± 15%     -35.4%    1786302 ±  6%  meminfo.Shmem
   8511906 ±  4%      -7.7%    7853731        meminfo.max_used_kB
   1510638 ± 19%     +76.5%    2665615 ± 33%  turbostat.C1
      0.99 ±  5%      +0.2        1.21 ± 15%  turbostat.C1%
      0.98 ±  5%     +21.0%       1.18 ± 15%  turbostat.CPU%c1
      0.24           -78.9%       0.05        turbostat.IPC
  65297238 ±  2%     -28.4%   46768609        turbostat.IRQ
      2789 ± 25%     +77.9%       4962 ± 31%  turbostat.POLL
     71.00            +2.8%      73.00        turbostat.PkgTmp
     38.40 ±  7%    +255.9%     136.66        turbostat.RAMWatt
      7519           -55.1%       3374        netperf.Throughput_Mbps
   1925072           -55.1%     863804        netperf.Throughput_total_Mbps
 2.794e+09           -96.0%  1.105e+08 ±  4%  netperf.time.involuntary_context_switches
     70929            +1.3%      71865        netperf.time.minor_page_faults
      6453           -24.9%       4848        netperf.time.percent_of_cpu_this_job_got
     18564           -22.6%      14376        netperf.time.system_time
    919.49           -56.6%     398.78        netperf.time.user_time
    623056 ± 58%   +1050.8%    7170427        netperf.time.voluntary_context_switches
 4.406e+09           -55.1%  1.977e+09        netperf.workload
     21166 ± 28%     -33.9%      13992 ± 34%  numa-vmstat.node0.nr_mapped
      3878 ± 19%     -41.5%       2269 ± 35%  numa-vmstat.node0.nr_page_table_pages
 7.402e+08 ±  3%     -34.0%  4.885e+08 ±  2%  numa-vmstat.node0.numa_hit
 7.402e+08 ±  3%     -34.0%  4.885e+08 ±  2%  numa-vmstat.node0.numa_local
    276573 ± 25%     -62.2%     104563 ± 27%  numa-vmstat.node1.nr_inactive_anon
    110513 ± 33%     -51.1%      54078 ± 17%  numa-vmstat.node1.nr_mapped
    687503 ± 15%     -36.2%     438523 ±  7%  numa-vmstat.node1.nr_shmem
    276572 ± 25%     -62.2%     104563 ± 27%  numa-vmstat.node1.nr_zone_inactive_anon
 7.683e+08 ±  2%     -38.5%  4.722e+08 ±  2%  numa-vmstat.node1.numa_hit
 7.682e+08 ±  2%     -38.5%  4.721e+08 ±  2%  numa-vmstat.node1.numa_local
    145520            -3.6%     140296        proc-vmstat.nr_anon_pages
   1360381 ±  7%     -18.0%    1116154 ±  2%  proc-vmstat.nr_file_pages
    351577 ± 18%     -45.0%     193492 ±  7%  proc-vmstat.nr_inactive_anon
    131509 ± 31%     -48.3%      67995 ± 19%  proc-vmstat.nr_mapped
      5985 ±  2%      -4.3%       5728        proc-vmstat.nr_page_table_pages
    691449 ± 15%     -35.3%     447314 ±  6%  proc-vmstat.nr_shmem
     34122            -2.3%      33342        proc-vmstat.nr_slab_reclaimable
     76581            +1.1%      77436        proc-vmstat.nr_slab_unreclaimable
    351577 ± 18%     -45.0%     193492 ±  7%  proc-vmstat.nr_zone_inactive_anon
    193757 ± 22%     -49.8%      97300 ± 10%  proc-vmstat.numa_hint_faults
    160785 ± 20%     -61.9%      61207 ± 10%  proc-vmstat.numa_hint_faults_local
 1.508e+09           -36.3%  9.608e+08        proc-vmstat.numa_hit
 1.508e+09           -36.3%  9.606e+08        proc-vmstat.numa_local
    463087 ± 14%     -30.1%     323645 ±  3%  proc-vmstat.numa_pte_updates
    974482 ± 14%     -53.4%     453757 ± 11%  proc-vmstat.pgactivate
 1.205e+10           -36.3%  7.671e+09        proc-vmstat.pgalloc_normal
   1332311 ±  3%     -12.4%    1167219        proc-vmstat.pgfault
 1.205e+10           -36.4%  7.667e+09        proc-vmstat.pgfree
  16415150        +1.5e+05%  2.507e+10 ± 39%  sched_debug.cfs_rq:/.avg_vruntime.avg
  23800175 ±  3%  +6.9e+06%  1.633e+12 ± 44%  sched_debug.cfs_rq:/.avg_vruntime.max
  12358897 ±  5%    +144.7%   30239786 ± 58%  sched_debug.cfs_rq:/.avg_vruntime.min
   2707060 ± 23%  +6.2e+06%  1.674e+11 ± 42%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      2.08           +18.3%       2.46        sched_debug.cfs_rq:/.h_nr_running.avg
      3.53           +30.7%       4.61 ±  5%  sched_debug.cfs_rq:/.h_nr_running.max
  16415150        +1.5e+05%  2.507e+10 ± 39%  sched_debug.cfs_rq:/.min_vruntime.avg
  23800175 ±  3%  +6.9e+06%  1.633e+12 ± 44%  sched_debug.cfs_rq:/.min_vruntime.max
  12358897 ±  5%    +144.7%   30239786 ± 58%  sched_debug.cfs_rq:/.min_vruntime.min
   2707060 ± 23%  +6.2e+06%  1.674e+11 ± 42%  sched_debug.cfs_rq:/.min_vruntime.stddev
      2057           +23.4%       2538        sched_debug.cfs_rq:/.runnable_avg.avg
      3176           +33.6%       4243 ±  6%  sched_debug.cfs_rq:/.runnable_avg.max
    519.88 ±  7%     +25.8%     653.96 ±  3%  sched_debug.cfs_rq:/.runnable_avg.stddev
    510.44           -35.9%     327.25 ± 24%  sched_debug.cfs_rq:/.util_avg.min
    332.99 ± 10%     -38.6%     204.29 ±  4%  sched_debug.cfs_rq:/.util_est_enqueued.stddev
    328059 ±  4%     +16.3%     381563 ±  3%  sched_debug.cpu.avg_idle.avg
      4918 ±  8%    +503.4%      29680 ± 15%  sched_debug.cpu.avg_idle.min
      0.00 ± 11%     +29.5%       0.00 ±  9%  sched_debug.cpu.next_balance.stddev
      2.09           +18.0%       2.47        sched_debug.cpu.nr_running.avg
      3.53           +30.7%       4.61 ±  5%  sched_debug.cpu.nr_running.max
  21021726 ±  3%     -95.6%     929481 ±  4%  sched_debug.cpu.nr_switches.avg
  23134976           -84.9%    3500788 ±  7%  sched_debug.cpu.nr_switches.max
  17357764 ± 11%     -98.5%     260089 ±  5%  sched_debug.cpu.nr_switches.min
   1465948 ± 45%     -66.3%     494750 ±  6%  sched_debug.cpu.nr_switches.stddev
    -21.56           -33.6%     -14.31        sched_debug.cpu.nr_uninterruptible.min
      0.00 ± 58%  +81207.8%       0.48 ± 74%  sched_debug.rt_rq:.rt_time.avg
      0.08 ± 58%  +81191.0%      61.34 ± 74%  sched_debug.rt_rq:.rt_time.max
      0.01 ± 58%  +81190.9%       5.40 ± 74%  sched_debug.rt_rq:.rt_time.stddev
  29305629          +300.0%  1.172e+08        sched_debug.sysctl_sched.sysctl_sched_features
      6.86 ±  4%   +1010.5%      76.22        perf-stat.i.MPKI
 4.439e+10           -79.2%  9.218e+09        perf-stat.i.branch-instructions
      1.16            -0.4        0.75        perf-stat.i.branch-miss-rate%
 5.105e+08           -86.5%   69094523        perf-stat.i.branch-misses
      7.87 ± 38%     +52.7       60.60        perf-stat.i.cache-miss-rate%
 1.417e+08 ± 40%   +1466.5%   2.22e+09        perf-stat.i.cache-misses
 1.533e+09 ±  4%    +138.4%  3.656e+09        perf-stat.i.cache-references
  18620179           -95.7%     793374 ±  4%  perf-stat.i.context-switches
      1.40          +379.9%       6.74        perf-stat.i.cpi
    877.66 ±  6%     -12.7%     766.54 ±  2%  perf-stat.i.cpu-migrations
      5089 ± 13%     -96.8%     160.38 ±  4%  perf-stat.i.cycles-between-cache-misses
      0.02 ± 17%      -0.0        0.01 ± 15%  perf-stat.i.dTLB-load-miss-rate%
  14348993 ± 16%     -91.9%    1160319 ± 15%  perf-stat.i.dTLB-load-misses
 6.629e+10           -79.8%  1.338e+10        perf-stat.i.dTLB-loads
      0.02 ± 16%      -0.0        0.01 ±  4%  perf-stat.i.dTLB-store-miss-rate%
   8191642 ± 16%     -92.5%     610661 ±  3%  perf-stat.i.dTLB-store-misses
 3.871e+10           -80.8%  7.428e+09        perf-stat.i.dTLB-stores
 2.316e+11           -79.3%  4.797e+10        perf-stat.i.instructions
      0.72           -78.4%       0.16        perf-stat.i.ipc
      0.09 ± 51%     +52.6%       0.14 ± 22%  perf-stat.i.major-faults
    365.74 ±  8%     -38.1%     226.41 ± 19%  perf-stat.i.metric.K/sec
      1179           -77.0%     270.80        perf-stat.i.metric.M/sec
      3840 ±  4%     -14.1%       3298 ±  4%  perf-stat.i.minor-faults
     76.75 ±  7%     -75.4        1.34 ± 25%  perf-stat.i.node-load-miss-rate%
  20295396 ± 61%   +3295.1%  6.891e+08        perf-stat.i.node-loads
     53.25 ±  7%     -50.0        3.20 ± 26%  perf-stat.i.node-store-miss-rate%
   5337370 ± 11%    +302.3%   21473364 ± 26%  perf-stat.i.node-store-misses
  42099801 ± 64%   +1552.1%  6.955e+08        perf-stat.i.node-stores
      3840 ±  4%     -14.1%       3298 ±  4%  perf-stat.i.page-faults
      6.62 ±  5%   +1049.3%      76.12        perf-stat.overall.MPKI
      1.15            -0.4        0.75        perf-stat.overall.branch-miss-rate%
      9.34 ± 41%     +51.4       60.75        perf-stat.overall.cache-miss-rate%
      1.39          +384.0%       6.72        perf-stat.overall.cpi
      2741 ± 44%     -94.7%     145.38        perf-stat.overall.cycles-between-cache-misses
      0.02 ± 16%      -0.0        0.01 ± 15%  perf-stat.overall.dTLB-load-miss-rate%
      0.02 ± 16%      -0.0        0.01 ±  3%  perf-stat.overall.dTLB-store-miss-rate%
      0.72           -79.3%       0.15        perf-stat.overall.ipc
     30.99 ± 61%     -30.1        0.86 ±  5%  perf-stat.overall.node-load-miss-rate%
     18.84 ± 78%     -15.8        3.00 ± 27%  perf-stat.overall.node-store-miss-rate%
     15831           -53.9%       7305        perf-stat.overall.path-length
 4.424e+10           -79.4%  9.104e+09        perf-stat.ps.branch-instructions
 5.087e+08           -86.6%   68184580        perf-stat.ps.branch-misses
 1.418e+08 ± 40%   +1444.6%   2.19e+09        perf-stat.ps.cache-misses
 1.528e+09 ±  4%    +135.9%  3.605e+09        perf-stat.ps.cache-references
  18555184           -95.8%     784633 ±  4%  perf-stat.ps.context-switches
    874.23 ±  6%     -15.7%     736.78 ±  2%  perf-stat.ps.cpu-migrations
  14281812 ± 16%     -91.9%    1158035 ± 15%  perf-stat.ps.dTLB-load-misses
 6.606e+10           -80.0%  1.321e+10        perf-stat.ps.dTLB-loads
   8152664 ± 16%     -92.6%     601918 ±  4%  perf-stat.ps.dTLB-store-misses
 3.857e+10           -81.0%  7.333e+09        perf-stat.ps.dTLB-stores
 2.308e+11           -79.5%  4.736e+10        perf-stat.ps.instructions
      3826 ±  4%     -14.8%       3261        perf-stat.ps.minor-faults
  20346842 ± 61%   +3241.4%  6.799e+08        perf-stat.ps.node-loads
   5319192 ± 11%    +299.0%   21223923 ± 26%  perf-stat.ps.node-store-misses
  42214154 ± 65%   +1524.0%  6.856e+08        perf-stat.ps.node-stores
      3826 ±  4%     -14.8%       3261        perf-stat.ps.page-faults
 6.976e+13           -79.3%  1.444e+13        perf-stat.total.instructions
      0.01 ±223%  +57300.0%       3.44 ±  4%  perf-sched.sch_delay.avg.ms.__cond_resched.__release_sock.release_sock.tcp_recvmsg.inet_recvmsg
      0.08 ± 57%   +2174.3%       1.80 ± 58%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      0.01 ±  7%    +212.9%       0.02 ± 15%  perf-sched.sch_delay.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.00 ± 61%  +3.4e+05%      12.01 ±162%  perf-sched.sch_delay.avg.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      0.01 ±101%  +51987.9%       2.86 ±139%  perf-sched.sch_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.00 ± 60%  +3.2e+05%       8.02 ± 86%  perf-sched.sch_delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      0.22 ±102%    +528.8%       1.36 ± 38%  perf-sched.sch_delay.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      0.00 ± 74%  +1.9e+05%       2.80 ± 25%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      0.00 ±152%  +79466.7%       0.40 ±  7%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.28 ±  3%     +95.0%       0.54        perf-sched.sch_delay.avg.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.01 ± 70%  +88014.6%       6.02 ± 46%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      0.02 ± 52%  +1.3e+05%      32.74 ± 96%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
      0.01 ± 23%  +56956.7%       2.85 ± 25%  perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.01 ± 21%    +901.6%       0.10 ±152%  perf-sched.sch_delay.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.10 ±223%   +3593.9%       3.85 ±  2%  perf-sched.sch_delay.avg.ms.schedule_timeout.wait_woken.sk_stream_wait_memory.tcp_sendmsg_locked
      0.21 ± 20%     +74.9%       0.38 ±  8%  perf-sched.sch_delay.avg.ms.schedule_timeout.wait_woken.sk_wait_data.tcp_recvmsg_locked
      0.01 ±223%  +32327.3%       4.76 ±171%  perf-sched.sch_delay.avg.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
      0.08 ± 21%  +12051.9%       9.56 ± 62%  perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      7.25 ±223%  +13563.3%     990.27 ± 62%  perf-sched.sch_delay.max.ms.__cond_resched.__release_sock.release_sock.tcp_recvmsg.inet_recvmsg
      0.73 ±223%  +56012.3%     412.33 ± 49%  perf-sched.sch_delay.max.ms.__cond_resched.__release_sock.release_sock.tcp_sendmsg.sock_sendmsg
      9.64 ±192%   +2094.1%     211.62 ± 26%  perf-sched.sch_delay.max.ms.__cond_resched.__skb_datagram_iter.skb_copy_datagram_iter.tcp_recvmsg_locked.tcp_recvmsg
      0.16 ± 47%   +9662.1%      15.70 ± 60%  perf-sched.sch_delay.max.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      0.01 ± 50%    +443.1%       0.06 ± 42%  perf-sched.sch_delay.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.01 ± 59%    +4e+06%     557.70 ±195%  perf-sched.sch_delay.max.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      0.01 ±101%  +3.1e+05%      17.06 ±141%  perf-sched.sch_delay.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.01 ± 32%  +4.2e+06%     555.51 ± 86%  perf-sched.sch_delay.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      1.48 ±104%   +1238.2%      19.77 ± 47%  perf-sched.sch_delay.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      0.01 ± 45%    +3e+05%      25.40 ± 56%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      0.29 ±  3%    +210.4%       0.90 ± 29%  perf-sched.sch_delay.max.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.01 ± 89%  +3.8e+05%      40.67 ± 70%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      0.03 ± 60%    +3e+05%     102.17 ± 90%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
      0.01 ± 62%    +3e+05%      43.28 ± 45%  perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.01 ± 36%  +10775.9%       1.43 ±207%  perf-sched.sch_delay.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
    107.77 ±223%   +1672.3%       1910 ± 67%  perf-sched.sch_delay.max.ms.schedule_timeout.wait_woken.sk_stream_wait_memory.tcp_sendmsg_locked
      0.03 ±223%  +4.6e+05%     133.78 ±190%  perf-sched.sch_delay.max.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
      3.84        +35929.2%       1384 ± 46%  perf-sched.sch_delay.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.11 ± 19%    +425.1%       0.57 ±  7%  perf-sched.total_sch_delay.average.ms
      0.92 ± 18%    +165.0%       2.44 ±  7%  perf-sched.total_wait_and_delay.average.ms
   3725494 ± 17%     -46.3%    2000508 ±  8%  perf-sched.total_wait_and_delay.count.ms
      0.81 ± 18%    +130.1%       1.87 ±  6%  perf-sched.total_wait_time.average.ms
      5063 ±  7%     -30.6%       3516 ± 21%  perf-sched.total_wait_time.max.ms
     75.01 ± 96%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.shmem_alloc_folio
      1.36 ±223%    +606.4%       9.60 ±  4%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__release_sock.release_sock.tcp_recvmsg.inet_recvmsg
      0.66 ± 19%     -91.5%       0.06 ± 16%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__release_sock.release_sock.tcp_sendmsg.sock_sendmsg
     23.17 ± 15%     -57.2%       9.92 ± 73%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
     60.41 ±125%     -95.9%       2.47 ±169%  perf-sched.wait_and_delay.avg.ms.__cond_resched.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
      0.48 ± 26%     -87.5%       0.06 ± 16%  perf-sched.wait_and_delay.avg.ms.__cond_resched.kmem_cache_alloc_node.__alloc_skb.tcp_stream_alloc_skb.tcp_sendmsg_locked
      0.50 ± 17%    +102.6%       1.00 ±  7%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
    957.45 ± 33%     -89.3%     102.34        perf-sched.wait_and_delay.avg.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
    100.03 ±119%    +210.6%     310.73 ± 33%  perf-sched.wait_and_delay.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      0.68 ± 73%   +2251.5%      15.96 ±105%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    288.63 ± 95%     -96.9%       8.83 ±  9%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      0.82 ± 19%     +29.8%       1.07 ±  8%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.wait_woken.sk_wait_data.tcp_recvmsg_locked
     10.83 ±117%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.shmem_alloc_folio
    203.17 ±223%  +17387.6%      35529 ±  4%  perf-sched.wait_and_delay.count.__cond_resched.__release_sock.release_sock.tcp_recvmsg.inet_recvmsg
    461924 ± 17%     -53.7%     214099 ±  9%  perf-sched.wait_and_delay.count.__cond_resched.__release_sock.release_sock.tcp_sendmsg.sock_sendmsg
      1.17 ±143%  +4.7e+05%       5541 ±  4%  perf-sched.wait_and_delay.count.__cond_resched.__skb_datagram_iter.skb_copy_datagram_iter.tcp_recvmsg_locked.tcp_recvmsg
     16.67 ±103%    +265.0%      60.83 ± 12%  perf-sched.wait_and_delay.count.__cond_resched.aa_sk_perm.security_socket_sendmsg.sock_sendmsg.__sys_sendto
    461883 ± 17%     -53.6%     214238 ±  9%  perf-sched.wait_and_delay.count.__cond_resched.kmem_cache_alloc_node.__alloc_skb.tcp_stream_alloc_skb.tcp_sendmsg_locked
     15.00 ± 29%     +48.9%      22.33 ± 10%  perf-sched.wait_and_delay.count.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1.17 ±223%   +5457.1%      64.83 ±  5%  perf-sched.wait_and_delay.count.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
     13.67 ± 20%    +359.8%      62.83 ± 13%  perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
    926122 ± 17%     -50.6%     457305 ±  9%  perf-sched.wait_and_delay.count.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      4.67 ± 31%    +932.1%      48.17        perf-sched.wait_and_delay.count.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
      5.67 ± 44%    +697.1%      45.17 ±  7%  perf-sched.wait_and_delay.count.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      1.50 ±100%   +1066.7%      17.50 ±  7%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      3.33 ± 33%    +300.0%      13.33 ±  8%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      4.50 ± 81%   +1533.3%      73.50 ±  2%  perf-sched.wait_and_delay.count.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      2.33 ±104%    +750.0%      19.83 ±  3%  perf-sched.wait_and_delay.count.schedule_timeout.kcompactd.kthread.ret_from_fork
     38.33 ± 48%   +1410.9%     579.17 ±  9%  perf-sched.wait_and_delay.count.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    382.50 ±223%  +30344.0%     116448        perf-sched.wait_and_delay.count.schedule_timeout.wait_woken.sk_stream_wait_memory.tcp_sendmsg_locked
   1867261 ± 17%     -49.3%     946760 ±  8%  perf-sched.wait_and_delay.count.schedule_timeout.wait_woken.sk_wait_data.tcp_recvmsg_locked
     57.83 ± 22%   +1198.6%     751.00 ±  3%  perf-sched.wait_and_delay.count.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
    269.20 ± 95%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.shmem_alloc_folio
    199.09 ±223%   +1147.0%       2482 ± 44%  perf-sched.wait_and_delay.max.ms.__cond_resched.__release_sock.release_sock.tcp_recvmsg.inet_recvmsg
      2829 ± 32%     -70.5%     835.67 ± 49%  perf-sched.wait_and_delay.max.ms.__cond_resched.__release_sock.release_sock.tcp_sendmsg.sock_sendmsg
    313.25 ±106%     -94.6%      16.92 ±163%  perf-sched.wait_and_delay.max.ms.__cond_resched.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
      1837 ± 45%     -94.2%     105.85        perf-sched.wait_and_delay.max.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
      2.09 ± 87%  +27898.7%     584.05 ±186%  perf-sched.wait_and_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      3261 ± 62%     -88.2%     384.43 ± 32%  perf-sched.wait_and_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    218.25 ±220%   +1882.2%       4326 ± 46%  perf-sched.wait_and_delay.max.ms.schedule_timeout.wait_woken.sk_stream_wait_memory.tcp_sendmsg_locked
      5056 ±  7%     -37.8%       3143 ± 33%  perf-sched.wait_and_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      4.24 ± 52%    +151.8%      10.68 ± 55%  perf-sched.wait_and_delay.max.ms.syslog_print.do_syslog.kmsg_read.vfs_read
      4192 ± 17%     -50.8%       2064        perf-sched.wait_and_delay.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     75.01 ± 96%     -99.9%       0.06 ±124%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.shmem_alloc_folio
      0.66 ± 19%     -93.3%       0.04 ± 12%  perf-sched.wait_time.avg.ms.__cond_resched.__release_sock.release_sock.tcp_sendmsg.sock_sendmsg
     23.17 ± 15%     -70.0%       6.94 ± 60%  perf-sched.wait_time.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      0.04 ± 41%   +7334.1%       2.80 ± 80%  perf-sched.wait_time.avg.ms.__cond_resched.aa_sk_perm.security_socket_recvmsg.sock_recvmsg.__sys_recvfrom
      0.02 ± 66%   +8473.6%       1.84 ± 77%  perf-sched.wait_time.avg.ms.__cond_resched.dput.__fput.task_work_run.exit_to_user_mode_loop
     60.41 ±125%     -95.4%       2.80 ±142%  perf-sched.wait_time.avg.ms.__cond_resched.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
      0.48 ± 26%     -90.9%       0.04 ± 16%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_node.__alloc_skb.tcp_stream_alloc_skb.tcp_sendmsg_locked
      0.04 ± 42%  +18297.7%       8.00 ± 50%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_node.kmalloc_reserve.__alloc_skb.tcp_stream_alloc_skb
      0.01 ±156%  +34712.8%       4.53 ± 82%  perf-sched.wait_time.avg.ms.__cond_resched.lock_sock_nested.tcp_recvmsg.inet_recvmsg.sock_recvmsg
      0.06 ± 50%   +9040.8%       5.23 ± 51%  perf-sched.wait_time.avg.ms.__cond_resched.lock_sock_nested.tcp_sendmsg.sock_sendmsg.__sys_sendto
      0.07 ± 22%  +35348.1%      23.57 ± 59%  perf-sched.wait_time.avg.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      0.01 ±158%  +1.9e+06%     242.52 ± 64%  perf-sched.wait_time.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.03 ±115%  +6.2e+05%     207.09 ±  3%  perf-sched.wait_time.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      0.50 ± 17%     +22.4%       0.61 ±  7%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
    957.17 ± 33%     -89.4%     101.80        perf-sched.wait_time.avg.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
     70.49 ±100%    +324.2%     299.01 ± 33%  perf-sched.wait_time.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      1.01 ± 13%   +1199.6%      13.11 ±123%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    177.05 ± 86%     -95.3%       8.28 ±  9%  perf-sched.wait_time.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      0.00 ± 81%   +6022.2%       0.28 ± 68%  perf-sched.wait_time.avg.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
    269.20 ± 95%     -99.1%       2.34 ±220%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.shmem_alloc_folio
    199.09 ±223%    +754.4%       1701 ± 55%  perf-sched.wait_time.max.ms.__cond_resched.__release_sock.release_sock.tcp_recvmsg.inet_recvmsg
      2829 ± 32%     -85.0%     423.41 ± 50%  perf-sched.wait_time.max.ms.__cond_resched.__release_sock.release_sock.tcp_sendmsg.sock_sendmsg
      0.05 ± 60%  +72269.5%      33.17 ± 63%  perf-sched.wait_time.max.ms.__cond_resched.aa_sk_perm.security_socket_recvmsg.sock_recvmsg.__sys_recvfrom
      0.02 ± 62%  +30408.0%       6.97 ± 72%  perf-sched.wait_time.max.ms.__cond_resched.dput.__fput.task_work_run.exit_to_user_mode_loop
    313.25 ±106%     -93.5%      20.31 ±127%  perf-sched.wait_time.max.ms.__cond_resched.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
      0.11 ± 59%  +37913.6%      40.42 ± 48%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_node.kmalloc_reserve.__alloc_skb.tcp_stream_alloc_skb
      0.01 ±156%  +1.5e+05%      19.78 ± 75%  perf-sched.wait_time.max.ms.__cond_resched.lock_sock_nested.tcp_recvmsg.inet_recvmsg.sock_recvmsg
      0.14 ± 56%  +21788.7%      30.02 ± 70%  perf-sched.wait_time.max.ms.__cond_resched.lock_sock_nested.tcp_sendmsg.sock_sendmsg.__sys_sendto
      0.13 ± 10%  +1.8e+05%     234.68 ±146%  perf-sched.wait_time.max.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      0.01 ±158%  +6.7e+06%     835.51 ± 44%  perf-sched.wait_time.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.17 ±138%  +6.9e+05%       1155 ± 20%  perf-sched.wait_time.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      2616 ± 20%     -51.0%       1281 ± 32%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      1837 ± 45%     -94.3%     105.13        perf-sched.wait_time.max.ms.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
      2.93 ± 38%  +18802.5%     553.84 ±198%  perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      1901 ± 57%     -84.3%     298.31 ± 34%  perf-sched.wait_time.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    181.32 ±219%   +1280.5%       2503 ± 31%  perf-sched.wait_time.max.ms.schedule_timeout.wait_woken.sk_stream_wait_memory.tcp_sendmsg_locked
      5056 ±  7%     -37.8%       3143 ± 33%  perf-sched.wait_time.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.01 ± 79%  +66035.7%       4.63 ± 96%  perf-sched.wait_time.max.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
      4192 ± 17%     -50.8%       2063        perf-sched.wait_time.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     20.66           -15.6        5.04        perf-profile.calltrace.cycles-pp.__local_bh_enable_ip.__dev_queue_xmit.ip_finish_output2.__ip_queue_xmit.__tcp_transmit_skb
     20.46           -15.4        5.02        perf-profile.calltrace.cycles-pp.do_softirq.__local_bh_enable_ip.__dev_queue_xmit.ip_finish_output2.__ip_queue_xmit
     18.39 ±  2%     -15.4        2.94        perf-profile.calltrace.cycles-pp.__dev_queue_xmit.ip_finish_output2.__ip_queue_xmit.__tcp_transmit_skb.tcp_write_xmit
     20.17           -15.2        5.00        perf-profile.calltrace.cycles-pp.__do_softirq.do_softirq.__local_bh_enable_ip.__dev_queue_xmit.ip_finish_output2
     55.36           -14.9       40.42        perf-profile.calltrace.cycles-pp.send_tcp_stream.main.__libc_start_main
     55.30           -14.9       40.39        perf-profile.calltrace.cycles-pp.send_omni_inner.send_tcp_stream.main.__libc_start_main
     53.97           -14.3       39.68        perf-profile.calltrace.cycles-pp.__send.send_omni_inner.send_tcp_stream.main.__libc_start_main
     18.14           -14.2        3.94        perf-profile.calltrace.cycles-pp.__napi_poll.net_rx_action.__do_softirq.do_softirq.__local_bh_enable_ip
     18.02           -14.1        3.92        perf-profile.calltrace.cycles-pp.process_backlog.__napi_poll.net_rx_action.__do_softirq.do_softirq
     53.24           -14.0       39.27        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__send.send_omni_inner.send_tcp_stream.main
     18.75           -13.9        4.84        perf-profile.calltrace.cycles-pp.net_rx_action.__do_softirq.do_softirq.__local_bh_enable_ip.__dev_queue_xmit
     52.84           -13.7       39.16        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__send.send_omni_inner.send_tcp_stream
     17.09           -13.2        3.85        perf-profile.calltrace.cycles-pp.__netif_receive_skb_one_core.process_backlog.__napi_poll.net_rx_action.__do_softirq
     14.07 ±  2%     -12.8        1.31 ±  3%  perf-profile.calltrace.cycles-pp.ip_finish_output2.__ip_queue_xmit.__tcp_transmit_skb.tcp_write_xmit.__tcp_push_pending_frames
     49.70           -11.7       38.01        perf-profile.calltrace.cycles-pp.sock_sendmsg.__sys_sendto.__x64_sys_sendto.do_syscall_64.entry_SYSCALL_64_after_hwframe
     50.27           -11.6       38.68        perf-profile.calltrace.cycles-pp.__sys_sendto.__x64_sys_sendto.do_syscall_64.entry_SYSCALL_64_after_hwframe.__send
     49.19           -11.5       37.70        perf-profile.calltrace.cycles-pp.tcp_sendmsg.sock_sendmsg.__sys_sendto.__x64_sys_sendto.do_syscall_64
     14.75 ±  2%     -11.2        3.58        perf-profile.calltrace.cycles-pp.ip_local_deliver_finish.__netif_receive_skb_one_core.process_backlog.__napi_poll.net_rx_action
     14.66 ±  2%     -11.1        3.58        perf-profile.calltrace.cycles-pp.ip_protocol_deliver_rcu.ip_local_deliver_finish.__netif_receive_skb_one_core.process_backlog.__napi_poll
     49.76           -11.0       38.73        perf-profile.calltrace.cycles-pp.__x64_sys_sendto.do_syscall_64.entry_SYSCALL_64_after_hwframe.__send.send_omni_inner
     12.39           -10.8        1.62 ±  4%  perf-profile.calltrace.cycles-pp.release_sock.tcp_sendmsg.sock_sendmsg.__sys_sendto.__x64_sys_sendto
     14.25 ±  2%     -10.7        3.53        perf-profile.calltrace.cycles-pp.tcp_v4_rcv.ip_protocol_deliver_rcu.ip_local_deliver_finish.__netif_receive_skb_one_core.process_backlog
     12.03           -10.6        1.46 ±  5%  perf-profile.calltrace.cycles-pp.__release_sock.release_sock.tcp_sendmsg.sock_sendmsg.__sys_sendto
     12.40           -10.6        1.85 ±  2%  perf-profile.calltrace.cycles-pp.__tcp_push_pending_frames.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg.__sys_sendto
     12.27           -10.5        1.81 ±  2%  perf-profile.calltrace.cycles-pp.tcp_write_xmit.__tcp_push_pending_frames.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg
     10.80           -10.1        0.67 ±  3%  perf-profile.calltrace.cycles-pp.__tcp_transmit_skb.tcp_write_xmit.__tcp_push_pending_frames.tcp_sendmsg_locked.tcp_sendmsg
      9.96           -10.0        0.00        perf-profile.calltrace.cycles-pp.sk_wait_data.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg.sock_recvmsg
      9.87 ±  2%      -9.3        0.61 ±  2%  perf-profile.calltrace.cycles-pp.__ip_queue_xmit.__tcp_transmit_skb.tcp_write_xmit.__tcp_push_pending_frames.tcp_sendmsg_locked
      8.59            -8.6        0.00        perf-profile.calltrace.cycles-pp.wait_woken.sk_wait_data.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg
     11.54 ±  3%      -8.4        3.14        perf-profile.calltrace.cycles-pp.tcp_v4_do_rcv.tcp_v4_rcv.ip_protocol_deliver_rcu.ip_local_deliver_finish.__netif_receive_skb_one_core
      8.24            -8.2        0.00        perf-profile.calltrace.cycles-pp.schedule_timeout.wait_woken.sk_wait_data.tcp_recvmsg_locked.tcp_recvmsg
     11.12 ±  3%      -8.0        3.08        perf-profile.calltrace.cycles-pp.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv.ip_protocol_deliver_rcu.ip_local_deliver_finish
      8.56 ±  4%      -8.0        0.57 ±  3%  perf-profile.calltrace.cycles-pp.tcp_data_queue.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv.ip_protocol_deliver_rcu
      7.93            -7.9        0.00        perf-profile.calltrace.cycles-pp.schedule.schedule_timeout.wait_woken.sk_wait_data.tcp_recvmsg_locked
      7.70            -7.7        0.00        perf-profile.calltrace.cycles-pp.__schedule.schedule.schedule_timeout.wait_woken.sk_wait_data
      8.19            -6.9        1.30 ±  5%  perf-profile.calltrace.cycles-pp.tcp_v4_do_rcv.__release_sock.release_sock.tcp_sendmsg.sock_sendmsg
      8.11            -6.8        1.29 ±  5%  perf-profile.calltrace.cycles-pp.tcp_rcv_established.tcp_v4_do_rcv.__release_sock.release_sock.tcp_sendmsg
      6.49 ±  6%      -6.5        0.00        perf-profile.calltrace.cycles-pp.sock_def_readable.tcp_data_queue.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv
      9.29            -6.4        2.87        perf-profile.calltrace.cycles-pp.__tcp_transmit_skb.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg.sock_recvmsg
      6.33 ±  6%      -6.3        0.00        perf-profile.calltrace.cycles-pp.__wake_up_common_lock.sock_def_readable.tcp_data_queue.tcp_rcv_established.tcp_v4_do_rcv
      6.05 ±  6%      -6.1        0.00        perf-profile.calltrace.cycles-pp.__wake_up_common.__wake_up_common_lock.sock_def_readable.tcp_data_queue.tcp_rcv_established
      5.73 ±  7%      -5.7        0.00        perf-profile.calltrace.cycles-pp.try_to_wake_up.__wake_up_common.__wake_up_common_lock.sock_def_readable.tcp_data_queue
      6.47            -5.4        1.02 ±  5%  perf-profile.calltrace.cycles-pp.__tcp_push_pending_frames.tcp_rcv_established.tcp_v4_do_rcv.__release_sock.release_sock
      6.42            -5.4        1.02 ±  5%  perf-profile.calltrace.cycles-pp.tcp_write_xmit.__tcp_push_pending_frames.tcp_rcv_established.tcp_v4_do_rcv.__release_sock
      8.39            -5.2        3.19        perf-profile.calltrace.cycles-pp.__ip_queue_xmit.__tcp_transmit_skb.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg
      5.23 ±  2%      -4.4        0.78 ±  5%  perf-profile.calltrace.cycles-pp.__ip_queue_xmit.__tcp_transmit_skb.tcp_write_xmit.__tcp_push_pending_frames.tcp_rcv_established
      7.49            -4.3        3.15        perf-profile.calltrace.cycles-pp.ip_finish_output2.__ip_queue_xmit.__tcp_transmit_skb.tcp_recvmsg_locked.tcp_recvmsg
      7.15            -4.0        3.13        perf-profile.calltrace.cycles-pp.__dev_queue_xmit.ip_finish_output2.__ip_queue_xmit.__tcp_transmit_skb.tcp_recvmsg_locked
      5.74            -4.0        1.74 ±  2%  perf-profile.calltrace.cycles-pp.__tcp_transmit_skb.tcp_write_xmit.__tcp_push_pending_frames.tcp_rcv_established.tcp_v4_do_rcv
      6.27 ±  2%      -3.5        2.76        perf-profile.calltrace.cycles-pp.tcp_write_xmit.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg.__sys_sendto
      5.17 ±  2%      -3.3        1.85        perf-profile.calltrace.cycles-pp.__ip_queue_xmit.__tcp_transmit_skb.tcp_write_xmit.tcp_sendmsg_locked.tcp_sendmsg
      5.63 ±  2%      -3.2        2.40        perf-profile.calltrace.cycles-pp.__tcp_transmit_skb.tcp_write_xmit.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg
      4.85 ±  2%      -3.1        1.73        perf-profile.calltrace.cycles-pp.ip_finish_output2.__ip_queue_xmit.__tcp_transmit_skb.tcp_write_xmit.tcp_sendmsg_locked
      2.83            -2.0        0.78 ±  2%  perf-profile.calltrace.cycles-pp.tcp_stream_alloc_skb.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg.__sys_sendto
      2.36            -1.9        0.43 ± 44%  perf-profile.calltrace.cycles-pp.__alloc_skb.tcp_stream_alloc_skb.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg
      0.97 ±  7%      -0.6        0.36 ± 70%  perf-profile.calltrace.cycles-pp.__sk_mem_reduce_allocated.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg.sock_recvmsg
      0.98 ±  4%      +0.1        1.08 ±  2%  perf-profile.calltrace.cycles-pp.simple_copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.tcp_recvmsg_locked.tcp_recvmsg
      0.94 ±  4%      +0.2        1.15        perf-profile.calltrace.cycles-pp.tcp_ack.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv.ip_protocol_deliver_rcu
      0.76 ±  4%      +0.3        1.05        perf-profile.calltrace.cycles-pp.__check_object_size.simple_copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.tcp_recvmsg_locked
      0.60 ±  4%      +0.4        1.00 ±  2%  perf-profile.calltrace.cycles-pp.check_heap_object.__check_object_size.simple_copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter
      0.66 ±  4%      +0.4        1.07        perf-profile.calltrace.cycles-pp.tcp_clean_rtx_queue.tcp_ack.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv
      0.00            +0.5        0.53 ±  2%  perf-profile.calltrace.cycles-pp.__free_one_page.free_pcppages_bulk.free_unref_page.skb_release_data.skb_attempt_defer_free
      0.00            +0.7        0.74 ±  3%  perf-profile.calltrace.cycles-pp.tcp_data_queue.tcp_rcv_established.tcp_v4_do_rcv.__release_sock.release_sock
      0.00            +0.8        0.76        perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.copyout._copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter
      0.80 ±  4%      +0.8        1.56 ±  6%  perf-profile.calltrace.cycles-pp.mem_cgroup_charge_skmem.__sk_mem_raise_allocated.__sk_mem_schedule.tcp_wmem_schedule.tcp_sendmsg_locked
      0.00            +0.9        0.88 ±  3%  perf-profile.calltrace.cycles-pp.tcp_rcv_established.tcp_v4_do_rcv.__release_sock.release_sock.tcp_recvmsg
      0.00            +0.9        0.89 ±  4%  perf-profile.calltrace.cycles-pp.try_charge_memcg.mem_cgroup_charge_skmem.__sk_mem_raise_allocated.__sk_mem_schedule.tcp_wmem_schedule
      0.00            +1.0        0.97 ±  3%  perf-profile.calltrace.cycles-pp.tcp_v4_do_rcv.__release_sock.release_sock.tcp_recvmsg.inet_recvmsg
      0.00            +1.0        1.00 ±  3%  perf-profile.calltrace.cycles-pp.__release_sock.release_sock.tcp_recvmsg.inet_recvmsg.sock_recvmsg
      0.00            +1.0        1.05 ±  3%  perf-profile.calltrace.cycles-pp.release_sock.tcp_recvmsg.inet_recvmsg.sock_recvmsg.__sys_recvfrom
      0.00            +1.1        1.06 ±  2%  perf-profile.calltrace.cycles-pp.free_unref_page_prepare.free_unref_page.skb_release_data.skb_attempt_defer_free.tcp_recvmsg_locked
      0.00            +1.1        1.14        perf-profile.calltrace.cycles-pp.tcp_write_xmit.__tcp_push_pending_frames.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv
      0.00            +1.1        1.14        perf-profile.calltrace.cycles-pp.__tcp_push_pending_frames.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv.ip_protocol_deliver_rcu
      1.13 ±  3%      +1.7        2.79 ±  4%  perf-profile.calltrace.cycles-pp.__sk_mem_raise_allocated.__sk_mem_schedule.tcp_wmem_schedule.tcp_sendmsg_locked.tcp_sendmsg
      1.24 ±  3%      +1.7        2.90 ±  4%  perf-profile.calltrace.cycles-pp.tcp_wmem_schedule.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg.__sys_sendto
      1.18 ±  3%      +1.7        2.89 ±  4%  perf-profile.calltrace.cycles-pp.__sk_mem_schedule.tcp_wmem_schedule.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg
      0.00            +3.0        2.98 ±  5%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.rmqueue_bulk.rmqueue.get_page_from_freelist
      0.00            +3.0        3.02 ±  5%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.rmqueue_bulk.rmqueue.get_page_from_freelist.__alloc_pages
      0.00            +3.4        3.36 ±  5%  perf-profile.calltrace.cycles-pp.rmqueue_bulk.rmqueue.get_page_from_freelist.__alloc_pages.skb_page_frag_refill
      0.56 ±  2%      +3.7        4.22 ±  4%  perf-profile.calltrace.cycles-pp.__alloc_pages.skb_page_frag_refill.sk_page_frag_refill.tcp_sendmsg_locked.tcp_sendmsg
      0.00            +3.7        3.71 ±  4%  perf-profile.calltrace.cycles-pp.rmqueue.get_page_from_freelist.__alloc_pages.skb_page_frag_refill.sk_page_frag_refill
      0.94            +3.9        4.82 ±  3%  perf-profile.calltrace.cycles-pp.sk_page_frag_refill.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg.__sys_sendto
      0.90            +3.9        4.80 ±  3%  perf-profile.calltrace.cycles-pp.skb_page_frag_refill.sk_page_frag_refill.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg
      0.00            +4.0        4.04 ±  4%  perf-profile.calltrace.cycles-pp.get_page_from_freelist.__alloc_pages.skb_page_frag_refill.sk_page_frag_refill.tcp_sendmsg_locked
     92.74            +6.3       99.06        perf-profile.calltrace.cycles-pp.main.__libc_start_main
     92.78            +6.4       99.14        perf-profile.calltrace.cycles-pp.__libc_start_main
      9.11 ±  2%      +9.7       18.84        perf-profile.calltrace.cycles-pp.skb_do_copy_data_nocache.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg.__sys_sendto
      8.05 ±  2%      +9.8       17.87        perf-profile.calltrace.cycles-pp.copyin._copy_from_iter.skb_do_copy_data_nocache.tcp_sendmsg_locked.tcp_sendmsg
      8.36 ±  2%     +10.0       18.31        perf-profile.calltrace.cycles-pp._copy_from_iter.skb_do_copy_data_nocache.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg
      0.00           +10.7       10.70 ±  6%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.free_pcppages_bulk.free_unref_page.skb_release_data
      0.00           +10.9       10.86 ±  6%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.free_pcppages_bulk.free_unref_page.skb_release_data.skb_attempt_defer_free
      0.00           +11.5       11.49 ±  6%  perf-profile.calltrace.cycles-pp.free_pcppages_bulk.free_unref_page.skb_release_data.skb_attempt_defer_free.tcp_recvmsg_locked
      0.00           +12.9       12.88 ±  5%  perf-profile.calltrace.cycles-pp.free_unref_page.skb_release_data.skb_attempt_defer_free.tcp_recvmsg_locked.tcp_recvmsg
      0.00           +13.3       13.28 ±  5%  perf-profile.calltrace.cycles-pp.skb_release_data.skb_attempt_defer_free.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg
      0.00           +13.3       13.31 ±  5%  perf-profile.calltrace.cycles-pp.skb_attempt_defer_free.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg.sock_recvmsg
     37.98           +20.7       58.64        perf-profile.calltrace.cycles-pp.recv_omni.process_requests.spawn_child.accept_connection.accept_connections
     37.38 ±  3%     +21.3       58.64        perf-profile.calltrace.cycles-pp.accept_connections.main.__libc_start_main
     37.38 ±  3%     +21.3       58.64        perf-profile.calltrace.cycles-pp.accept_connection.accept_connections.main.__libc_start_main
     37.38 ±  3%     +21.3       58.64        perf-profile.calltrace.cycles-pp.spawn_child.accept_connection.accept_connections.main.__libc_start_main
     37.38 ±  3%     +21.3       58.64        perf-profile.calltrace.cycles-pp.process_requests.spawn_child.accept_connection.accept_connections.main
     36.92           +21.5       58.42        perf-profile.calltrace.cycles-pp.recv.recv_omni.process_requests.spawn_child.accept_connection
     36.24           +21.8       58.07        perf-profile.calltrace.cycles-pp.__sys_recvfrom.__x64_sys_recvfrom.do_syscall_64.entry_SYSCALL_64_after_hwframe.recv
     36.37           +21.9       58.32        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.recv.recv_omni.process_requests.spawn_child
     36.06           +22.2       58.28        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.recv.recv_omni.process_requests
     35.08           +22.8       57.88        perf-profile.calltrace.cycles-pp.sock_recvmsg.__sys_recvfrom.__x64_sys_recvfrom.do_syscall_64.entry_SYSCALL_64_after_hwframe
     33.59           +23.1       56.67        perf-profile.calltrace.cycles-pp.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg.sock_recvmsg.__sys_recvfrom
     34.91           +23.2       58.08        perf-profile.calltrace.cycles-pp.__x64_sys_recvfrom.do_syscall_64.entry_SYSCALL_64_after_hwframe.recv.recv_omni
     34.59           +23.2       57.82        perf-profile.calltrace.cycles-pp.inet_recvmsg.sock_recvmsg.__sys_recvfrom.__x64_sys_recvfrom.do_syscall_64
     34.34           +23.4       57.79        perf-profile.calltrace.cycles-pp.tcp_recvmsg.inet_recvmsg.sock_recvmsg.__sys_recvfrom.__x64_sys_recvfrom
      9.31           +26.1       35.44        perf-profile.calltrace.cycles-pp.copyout._copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.tcp_recvmsg_locked
      9.54           +26.4       35.95        perf-profile.calltrace.cycles-pp._copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.tcp_recvmsg_locked.tcp_recvmsg
     10.92           +26.7       37.59        perf-profile.calltrace.cycles-pp.skb_copy_datagram_iter.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg.sock_recvmsg
     10.86           +26.7       37.57        perf-profile.calltrace.cycles-pp.__skb_datagram_iter.skb_copy_datagram_iter.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg
     32.00           -24.2        7.81        perf-profile.children.cycles-pp.__tcp_transmit_skb
     29.08           -22.2        6.86        perf-profile.children.cycles-pp.__ip_queue_xmit
     26.87           -20.3        6.54        perf-profile.children.cycles-pp.ip_finish_output2
     26.02           -19.6        6.40        perf-profile.children.cycles-pp.__dev_queue_xmit
     25.52           -18.6        6.87        perf-profile.children.cycles-pp.tcp_write_xmit
     57.03           -16.8       40.21        perf-profile.children.cycles-pp.__send
     21.33           -15.7        5.59        perf-profile.children.cycles-pp.__local_bh_enable_ip
     20.93           -15.4        5.53        perf-profile.children.cycles-pp.do_softirq
     19.23           -15.1        4.10        perf-profile.children.cycles-pp.__tcp_push_pending_frames
     55.49           -14.9       40.58        perf-profile.children.cycles-pp.send_tcp_stream
     55.45           -14.9       40.58        perf-profile.children.cycles-pp.send_omni_inner
     20.65           -14.9        5.78        perf-profile.children.cycles-pp.__do_softirq
     20.23           -14.3        5.98        perf-profile.children.cycles-pp.tcp_v4_do_rcv
     19.77           -14.0        5.81        perf-profile.children.cycles-pp.tcp_rcv_established
     18.54           -13.8        4.76        perf-profile.children.cycles-pp.__napi_poll
     18.42           -13.7        4.75        perf-profile.children.cycles-pp.process_backlog
     19.17           -13.6        5.53        perf-profile.children.cycles-pp.net_rx_action
     17.47           -12.8        4.64        perf-profile.children.cycles-pp.__netif_receive_skb_one_core
     51.62           -12.4       39.20        perf-profile.children.cycles-pp.__x64_sys_sendto
     51.42           -12.3       39.16        perf-profile.children.cycles-pp.__sys_sendto
     12.89           -12.0        0.84 ±  3%  perf-profile.children.cycles-pp.__schedule
     49.90           -11.5       38.36        perf-profile.children.cycles-pp.sock_sendmsg
     49.43           -11.4       38.06        perf-profile.children.cycles-pp.tcp_sendmsg
     15.07 ±  2%     -10.8        4.29        perf-profile.children.cycles-pp.ip_local_deliver_finish
     15.00 ±  2%     -10.7        4.28        perf-profile.children.cycles-pp.ip_protocol_deliver_rcu
     13.37           -10.6        2.72 ±  4%  perf-profile.children.cycles-pp.release_sock
     14.66 ±  2%     -10.4        4.23        perf-profile.children.cycles-pp.tcp_v4_rcv
     12.62           -10.1        2.51 ±  4%  perf-profile.children.cycles-pp.__release_sock
     10.55            -9.8        0.73 ±  2%  perf-profile.children.cycles-pp.schedule
     10.02            -9.5        0.55 ±  3%  perf-profile.children.cycles-pp.sk_wait_data
      8.60            -8.0        0.64 ±  2%  perf-profile.children.cycles-pp.wait_woken
      8.25            -7.6        0.61 ±  2%  perf-profile.children.cycles-pp.schedule_timeout
      8.82 ±  3%      -7.1        1.70 ±  2%  perf-profile.children.cycles-pp.tcp_data_queue
      6.64 ±  5%      -6.3        0.39        perf-profile.children.cycles-pp.sock_def_readable
      6.50 ±  5%      -6.1        0.44        perf-profile.children.cycles-pp.__wake_up_common_lock
      6.20 ±  5%      -5.8        0.41        perf-profile.children.cycles-pp.__wake_up_common
      5.92 ±  6%      -5.5        0.37        perf-profile.children.cycles-pp.try_to_wake_up
      4.53            -4.0        0.52        perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      4.30            -3.8        0.45        perf-profile.children.cycles-pp.exit_to_user_mode_prepare
      3.58 ±  3%      -3.4        0.22 ±  2%  perf-profile.children.cycles-pp.ttwu_do_activate
      4.98            -3.3        1.64        perf-profile.children.cycles-pp.tcp_ack
      3.52            -2.9        0.62 ±  2%  perf-profile.children.cycles-pp.__alloc_skb
      3.14            -2.9        0.26 ±  3%  perf-profile.children.cycles-pp.__cond_resched
      3.01            -2.9        0.14 ±  4%  perf-profile.children.cycles-pp.pick_next_task_fair
      2.93 ±  4%      -2.8        0.18 ±  2%  perf-profile.children.cycles-pp.activate_task
      2.83 ±  4%      -2.7        0.17 ±  2%  perf-profile.children.cycles-pp.enqueue_task_fair
      2.81 ±  4%      -2.6        0.16 ±  3%  perf-profile.children.cycles-pp.dequeue_task_fair
      2.78            -2.5        0.28 ±  2%  perf-profile.children.cycles-pp.exit_to_user_mode_loop
      2.64            -2.5        0.15 ±  3%  perf-profile.children.cycles-pp.switch_mm_irqs_off
      3.26            -2.5        0.81        perf-profile.children.cycles-pp.tcp_stream_alloc_skb
      2.77            -2.3        0.45 ±  2%  perf-profile.children.cycles-pp.kmem_cache_alloc_node
      3.58            -2.2        1.41 ±  2%  perf-profile.children.cycles-pp.tcp_clean_rtx_queue
      2.31 ±  3%      -2.2        0.14 ±  3%  perf-profile.children.cycles-pp.update_load_avg
      1.91 ±  5%      -1.8        0.15 ±  2%  perf-profile.children.cycles-pp.update_curr
      1.94            -1.6        0.36        perf-profile.children.cycles-pp.dev_hard_start_xmit
      1.69 ±  3%      -1.5        0.21 ±  3%  perf-profile.children.cycles-pp.ip_rcv
      1.78            -1.5        0.33        perf-profile.children.cycles-pp.loopback_xmit
      1.65            -1.4        0.24        perf-profile.children.cycles-pp.__kfree_skb
      1.49 ±  5%      -1.4        0.10 ±  4%  perf-profile.children.cycles-pp.enqueue_entity
      1.37            -1.2        0.14 ±  4%  perf-profile.children.cycles-pp.switch_fpu_return
      1.30 ±  6%      -1.2        0.10 ±  3%  perf-profile.children.cycles-pp.dequeue_entity
      1.24 ±  3%      -1.1        0.10 ±  5%  perf-profile.children.cycles-pp.prepare_task_switch
      1.17            -1.1        0.05 ±  8%  perf-profile.children.cycles-pp.set_next_entity
      1.10            -1.0        0.12 ±  4%  perf-profile.children.cycles-pp.restore_fpregs_from_fpstate
      1.03            -1.0        0.06 ±  6%  perf-profile.children.cycles-pp._raw_spin_lock
      1.90 ±  5%      -1.0        0.93 ±  6%  perf-profile.children.cycles-pp.__sk_mem_reduce_allocated
      1.05 ±  5%      -0.9        0.11 ±  5%  perf-profile.children.cycles-pp.ip_rcv_finish_core
      0.94 ±  7%      -0.9        0.04 ± 45%  perf-profile.children.cycles-pp.dst_release
      0.96            -0.9        0.08 ±  6%  perf-profile.children.cycles-pp.__switch_to
      0.89 ±  4%      -0.8        0.07        perf-profile.children.cycles-pp.___perf_sw_event
      0.90            -0.8        0.09 ±  5%  perf-profile.children.cycles-pp.sched_clock_cpu
      0.86            -0.8        0.06 ±  6%  perf-profile.children.cycles-pp.__switch_to_asm
      0.78 ±  9%      -0.7        0.06 ±  9%  perf-profile.children.cycles-pp.select_task_rq
      0.84            -0.7        0.12 ±  3%  perf-profile.children.cycles-pp.irqtime_account_irq
      1.02 ±  3%      -0.7        0.32 ±  3%  perf-profile.children.cycles-pp.ktime_get
      0.77            -0.7        0.08 ±  6%  perf-profile.children.cycles-pp.sched_clock
      0.80            -0.7        0.11 ±  3%  perf-profile.children.cycles-pp.__tcp_send_ack
      0.97            -0.7        0.28 ±  2%  perf-profile.children.cycles-pp._raw_spin_lock_bh
      0.83            -0.6        0.19        perf-profile.children.cycles-pp.__inet_lookup_established
      0.85 ±  4%      -0.6        0.21 ± 11%  perf-profile.children.cycles-pp.mem_cgroup_uncharge_skmem
      0.68            -0.6        0.07 ±  5%  perf-profile.children.cycles-pp.native_sched_clock
      0.86            -0.6        0.30        perf-profile.children.cycles-pp.tcp_event_new_data_sent
      0.68            -0.5        0.13 ±  3%  perf-profile.children.cycles-pp.kmalloc_reserve
      0.69            -0.5        0.14 ±  3%  perf-profile.children.cycles-pp.__netif_rx
      1.04            -0.5        0.50        perf-profile.children.cycles-pp.sockfd_lookup_light
      0.67 ±  2%      -0.5        0.14 ±  3%  perf-profile.children.cycles-pp.tcp_mstamp_refresh
      0.79 ±  2%      -0.5        0.28 ±  2%  perf-profile.children.cycles-pp.kmem_cache_free
      0.65            -0.5        0.14 ±  2%  perf-profile.children.cycles-pp.netif_rx_internal
      0.67            -0.5        0.17 ±  2%  perf-profile.children.cycles-pp.read_tsc
      0.71            -0.5        0.22 ±  2%  perf-profile.children.cycles-pp.sk_reset_timer
      0.60            -0.5        0.13        perf-profile.children.cycles-pp.enqueue_to_backlog
      0.56            -0.5        0.10        perf-profile.children.cycles-pp.tcp_schedule_loss_probe
      0.53            -0.4        0.09 ±  4%  perf-profile.children.cycles-pp.validate_xmit_skb
      0.65            -0.4        0.21        perf-profile.children.cycles-pp.__mod_timer
      0.49            -0.4        0.08 ±  5%  perf-profile.children.cycles-pp.ip_output
      0.47            -0.4        0.07 ±  5%  perf-profile.children.cycles-pp.ip_rcv_core
      0.50            -0.4        0.11 ±  3%  perf-profile.children.cycles-pp.__netif_receive_skb_core
      0.79            -0.4        0.40        perf-profile.children.cycles-pp.__fget_light
      0.44            -0.4        0.06        perf-profile.children.cycles-pp._raw_spin_lock_irq
      0.44            -0.4        0.07 ±  7%  perf-profile.children.cycles-pp.ip_local_out
      0.47 ±  3%      -0.4        0.10 ±  6%  perf-profile.children.cycles-pp.recv_data
      0.40            -0.4        0.05        perf-profile.children.cycles-pp.update_rq_clock
      0.50 ±  6%      -0.4        0.16 ±  4%  perf-profile.children.cycles-pp.cgroup_rstat_updated
      0.37            -0.3        0.06 ±  8%  perf-profile.children.cycles-pp.__ip_local_out
      0.60            -0.3        0.29 ±  2%  perf-profile.children.cycles-pp.__entry_text_start
      0.42            -0.3        0.12 ±  4%  perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.30            -0.3        0.02 ± 99%  perf-profile.children.cycles-pp.security_socket_recvmsg
      0.32 ±  2%      -0.3        0.04 ± 45%  perf-profile.children.cycles-pp.update_cfs_group
      0.55            -0.3        0.28 ±  2%  perf-profile.children.cycles-pp.__virt_addr_valid
      0.42 ±  2%      -0.3        0.16 ±  4%  perf-profile.children.cycles-pp.lock_sock_nested
      0.29 ±  2%      -0.2        0.05 ±  8%  perf-profile.children.cycles-pp.__sk_dst_check
      0.55 ±  2%      -0.2        0.32 ±  2%  perf-profile.children.cycles-pp.tcp_send_mss
      0.43            -0.2        0.20 ±  3%  perf-profile.children.cycles-pp.aa_sk_perm
      0.28 ±  5%      -0.2        0.06 ±  9%  perf-profile.children.cycles-pp.tcp_add_backlog
      0.52 ±  2%      -0.2        0.30 ±  2%  perf-profile.children.cycles-pp.tcp_current_mss
      0.47 ±  4%      -0.2        0.25 ±  3%  perf-profile.children.cycles-pp.send_data
      0.32            -0.2        0.11 ±  3%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.27 ±  2%      -0.2        0.06 ±  7%  perf-profile.children.cycles-pp.sk_filter_trim_cap
      0.31            -0.2        0.11 ±  3%  perf-profile.children.cycles-pp.tcp_rcv_space_adjust
      0.26            -0.2        0.07 ±  5%  perf-profile.children.cycles-pp.tcp_established_options
      0.20 ±  2%      -0.2        0.02 ± 99%  perf-profile.children.cycles-pp.tcp_wfree
      0.24            -0.1        0.10 ±  3%  perf-profile.children.cycles-pp.rb_erase
      0.36            -0.1        0.23 ±  2%  perf-profile.children.cycles-pp.__skb_clone
      0.18 ±  2%      -0.1        0.05 ±  7%  perf-profile.children.cycles-pp.lock_timer_base
      0.24            -0.1        0.11 ±  3%  perf-profile.children.cycles-pp.__tcp_select_window
      1.64            -0.1        1.53        perf-profile.children.cycles-pp.__check_object_size
      0.15 ±  3%      -0.1        0.04 ± 44%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
      0.16 ±  3%      -0.1        0.05        perf-profile.children.cycles-pp.rcu_all_qs
      0.20 ±  3%      -0.1        0.12        perf-profile.children.cycles-pp.__list_add_valid
      0.20 ±  3%      -0.1        0.13 ±  5%  perf-profile.children.cycles-pp.ipv4_mtu
      0.12            -0.1        0.06        perf-profile.children.cycles-pp.check_stack_object
      0.13 ±  5%      -0.1        0.08 ±  6%  perf-profile.children.cycles-pp.alloc_pages
      0.53            -0.1        0.48        perf-profile.children.cycles-pp.__list_del_entry_valid
      0.31 ±  2%      -0.0        0.26        perf-profile.children.cycles-pp.tcp_check_space
      0.15 ±  2%      -0.0        0.11        perf-profile.children.cycles-pp._raw_spin_trylock
      0.26 ±  2%      -0.0        0.22 ±  2%  perf-profile.children.cycles-pp.security_socket_sendmsg
      0.20 ±  2%      -0.0        0.17 ±  2%  perf-profile.children.cycles-pp.tcp_tso_segs
      0.07            -0.0        0.06        perf-profile.children.cycles-pp.__tcp_cleanup_rbuf
      0.14 ±  3%      +0.0        0.18 ±  2%  perf-profile.children.cycles-pp.kfree_skbmem
      0.32 ±  7%      +0.0        0.36 ±  5%  perf-profile.children.cycles-pp.perf_event_task_tick
      0.32 ±  7%      +0.0        0.36 ±  5%  perf-profile.children.cycles-pp.perf_adjust_freq_unthr_context
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.__run_timers
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.run_timer_softirq
      0.08 ±  5%      +0.1        0.14 ±  6%  perf-profile.children.cycles-pp.task_mm_cid_work
      0.00            +0.1        0.06 ±  6%  perf-profile.children.cycles-pp.__mod_zone_page_state
      0.02 ±142%      +0.1        0.08 ± 20%  perf-profile.children.cycles-pp.cmd_record
      0.09 ±  5%      +0.1        0.15 ±  4%  perf-profile.children.cycles-pp.task_work_run
      0.02 ±142%      +0.1        0.08 ± 16%  perf-profile.children.cycles-pp.run_builtin
      0.06 ±  7%      +0.1        0.13 ±  3%  perf-profile.children.cycles-pp.free_unref_page_commit
      1.00            +0.1        1.08        perf-profile.children.cycles-pp.simple_copy_to_iter
      0.10 ±  4%      +0.1        0.19 ±  5%  perf-profile.children.cycles-pp.__intel_pmu_enable_all
      0.07 ±  7%      +0.1        0.15 ±  4%  perf-profile.children.cycles-pp.task_tick_fair
      0.46 ±  4%      +0.1        0.55 ±  7%  perf-profile.children.cycles-pp.refill_stock
      0.00            +0.1        0.09 ±  5%  perf-profile.children.cycles-pp.__slab_free
      0.00            +0.1        0.09 ±  6%  perf-profile.children.cycles-pp.sk_stream_write_space
      0.00            +0.1        0.13 ± 11%  perf-profile.children.cycles-pp.propagate_protected_usage
      0.18 ±  2%      +0.1        0.32        perf-profile.children.cycles-pp.tcp_queue_rcv
      0.00            +0.1        0.15 ±  2%  perf-profile.children.cycles-pp.__zone_watermark_ok
      0.14 ±  2%      +0.2        0.29 ±  3%  perf-profile.children.cycles-pp.sock_rfree
      0.44 ±  6%      +0.2        0.62 ±  3%  perf-profile.children.cycles-pp.scheduler_tick
      0.00            +0.2        0.19 ±  3%  perf-profile.children.cycles-pp.sk_stream_wait_memory
      0.54 ±  5%      +0.2        0.73 ±  3%  perf-profile.children.cycles-pp.update_process_times
      0.58 ±  8%      +0.2        0.77 ±  3%  perf-profile.children.cycles-pp.tick_sched_timer
      0.16 ±  2%      +0.2        0.36        perf-profile.children.cycles-pp.tcp_skb_entail
      0.72 ±  5%      +0.2        0.92 ±  2%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.70 ±  5%      +0.2        0.91 ±  2%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.54 ±  6%      +0.2        0.75 ±  3%  perf-profile.children.cycles-pp.tick_sched_handle
      0.65 ±  6%      +0.2        0.86 ±  2%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.08 ±  4%      +0.2        0.31 ±  2%  perf-profile.children.cycles-pp.skb_clone
      1.08            +0.2        1.32        perf-profile.children.cycles-pp.check_heap_object
      0.00            +0.3        0.26        perf-profile.children.cycles-pp.skb_try_coalesce
      0.00            +0.3        0.27 ±  2%  perf-profile.children.cycles-pp.__irq_exit_rcu
      0.00            +0.3        0.28        perf-profile.children.cycles-pp.tcp_try_coalesce
      2.00 ±  4%      +0.3        2.30 ±  6%  perf-profile.children.cycles-pp.mem_cgroup_charge_skmem
      0.07 ± 23%      +0.4        0.44 ±  8%  perf-profile.children.cycles-pp.page_counter_uncharge
      0.08 ± 25%      +0.4        0.45 ±  8%  perf-profile.children.cycles-pp.drain_stock
      0.08 ±  4%      +0.4        0.46        perf-profile.children.cycles-pp.tcp_mtu_probe
      0.76 ±  5%      +0.4        1.17        perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.09 ± 23%      +0.5        0.56 ±  7%  perf-profile.children.cycles-pp.page_counter_try_charge
      0.00            +0.6        0.56        perf-profile.children.cycles-pp.__free_one_page
      0.00            +0.7        0.69 ±  5%  perf-profile.children.cycles-pp.napi_consume_skb
      0.81 ±  5%      +0.7        1.54        perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.00            +0.8        0.79 ±  5%  perf-profile.children.cycles-pp.tcp_try_rmem_schedule
      0.54 ±  7%      +0.9        1.44 ±  4%  perf-profile.children.cycles-pp.try_charge_memcg
      0.38            +1.0        1.34        perf-profile.children.cycles-pp.free_unref_page_prepare
      1.28 ±  3%      +1.7        2.96 ±  4%  perf-profile.children.cycles-pp.tcp_wmem_schedule
      1.18 ±  3%      +2.6        3.81 ±  4%  perf-profile.children.cycles-pp.__sk_mem_raise_allocated
      1.23 ±  3%      +2.7        3.91 ±  4%  perf-profile.children.cycles-pp.__sk_mem_schedule
      0.00            +3.4        3.40 ±  5%  perf-profile.children.cycles-pp.rmqueue_bulk
      0.25 ±  2%      +3.5        3.76 ±  4%  perf-profile.children.cycles-pp.rmqueue
      0.43            +3.7        4.10 ±  4%  perf-profile.children.cycles-pp.get_page_from_freelist
      0.58            +3.7        4.28 ±  3%  perf-profile.children.cycles-pp.__alloc_pages
      0.97            +3.9        4.88 ±  3%  perf-profile.children.cycles-pp.sk_page_frag_refill
      0.93            +3.9        4.86 ±  3%  perf-profile.children.cycles-pp.skb_page_frag_refill
     93.76            +4.5       98.30        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     93.08            +5.1       98.16        perf-profile.children.cycles-pp.do_syscall_64
     92.82            +6.3       99.17        perf-profile.children.cycles-pp.main
     92.78            +6.4       99.14        perf-profile.children.cycles-pp.__libc_start_main
      9.35            +9.7       19.09        perf-profile.children.cycles-pp.skb_do_copy_data_nocache
      8.33            +9.9       18.21        perf-profile.children.cycles-pp.copyin
      8.58            +9.9       18.52        perf-profile.children.cycles-pp._copy_from_iter
      0.00           +11.8       11.82 ±  6%  perf-profile.children.cycles-pp.free_pcppages_bulk
      1.55           +12.6       14.19 ±  5%  perf-profile.children.cycles-pp.skb_release_data
      0.54           +13.0       13.55 ±  5%  perf-profile.children.cycles-pp.free_unref_page
      0.21           +13.1       13.32 ±  5%  perf-profile.children.cycles-pp.skb_attempt_defer_free
      0.95           +13.5       14.42 ±  6%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      0.01 ±223%     +14.1       14.07 ±  6%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
     39.84           +18.8       58.63        perf-profile.children.cycles-pp.recv
     37.99           +20.7       58.64        perf-profile.children.cycles-pp.recv_omni
     37.99           +20.7       58.64        perf-profile.children.cycles-pp.accept_connections
     37.99           +20.7       58.64        perf-profile.children.cycles-pp.accept_connection
     37.99           +20.7       58.64        perf-profile.children.cycles-pp.spawn_child
     37.99           +20.7       58.64        perf-profile.children.cycles-pp.process_requests
     36.40           +21.8       58.18        perf-profile.children.cycles-pp.__x64_sys_recvfrom
     36.27           +21.9       58.16        perf-profile.children.cycles-pp.__sys_recvfrom
     35.10           +22.9       57.97        perf-profile.children.cycles-pp.sock_recvmsg
     33.64           +23.1       56.76        perf-profile.children.cycles-pp.tcp_recvmsg_locked
     34.61           +23.3       57.90        perf-profile.children.cycles-pp.inet_recvmsg
     34.42           +23.5       57.88        perf-profile.children.cycles-pp.tcp_recvmsg
      9.39           +26.4       35.80        perf-profile.children.cycles-pp.copyout
      9.55           +26.4       35.97        perf-profile.children.cycles-pp._copy_to_iter
     10.92           +26.7       37.59        perf-profile.children.cycles-pp.skb_copy_datagram_iter
     10.88           +26.7       37.58        perf-profile.children.cycles-pp.__skb_datagram_iter
      2.60            -2.4        0.15 ±  2%  perf-profile.self.cycles-pp.switch_mm_irqs_off
      2.24 ±  4%      -1.6        0.66        perf-profile.self.cycles-pp.__dev_queue_xmit
      1.62 ±  2%      -1.5        0.15 ±  4%  perf-profile.self.cycles-pp.__schedule
      1.10            -1.0        0.12 ±  4%  perf-profile.self.cycles-pp.restore_fpregs_from_fpstate
      1.00            -0.9        0.06 ±  6%  perf-profile.self.cycles-pp._raw_spin_lock
      1.03 ±  5%      -0.9        0.11 ±  3%  perf-profile.self.cycles-pp.ip_rcv_finish_core
      0.98 ±  6%      -0.9        0.07        perf-profile.self.cycles-pp.update_curr
      0.91 ±  7%      -0.9        0.04 ± 45%  perf-profile.self.cycles-pp.dst_release
      1.17 ±  2%      -0.9        0.31 ±  3%  perf-profile.self.cycles-pp.kmem_cache_alloc_node
      0.91            -0.8        0.07 ±  5%  perf-profile.self.cycles-pp.__switch_to
      0.99            -0.8        0.17 ±  2%  perf-profile.self.cycles-pp.tcp_ack
      0.86 ±  4%      -0.8        0.06 ±  7%  perf-profile.self.cycles-pp.update_load_avg
      0.85            -0.8        0.06 ±  6%  perf-profile.self.cycles-pp.__switch_to_asm
      0.80 ±  5%      -0.7        0.06        perf-profile.self.cycles-pp.___perf_sw_event
      1.41            -0.7        0.68        perf-profile.self.cycles-pp.__tcp_transmit_skb
      0.87            -0.6        0.23 ±  2%  perf-profile.self.cycles-pp._raw_spin_lock_bh
      0.75 ±  2%      -0.6        0.13 ±  2%  perf-profile.self.cycles-pp.ip_finish_output2
      0.66            -0.6        0.07 ±  7%  perf-profile.self.cycles-pp.native_sched_clock
      0.70            -0.6        0.11 ±  3%  perf-profile.self.cycles-pp.tcp_v4_rcv
      0.69            -0.5        0.14 ±  2%  perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.61            -0.5        0.07 ±  5%  perf-profile.self.cycles-pp.__do_softirq
      0.62            -0.5        0.09 ±  4%  perf-profile.self.cycles-pp.__sys_recvfrom
      0.91            -0.5        0.40        perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.62            -0.5        0.12 ±  4%  perf-profile.self.cycles-pp.__ip_queue_xmit
      0.67 ±  5%      -0.5        0.18 ± 13%  perf-profile.self.cycles-pp.mem_cgroup_uncharge_skmem
      0.77 ±  2%      -0.5        0.27 ±  2%  perf-profile.self.cycles-pp.kmem_cache_free
      0.65            -0.5        0.16        perf-profile.self.cycles-pp.__inet_lookup_established
      0.64            -0.5        0.16 ±  3%  perf-profile.self.cycles-pp.read_tsc
      0.52 ±  2%      -0.5        0.05        perf-profile.self.cycles-pp.net_rx_action
      0.52            -0.5        0.06 ±  6%  perf-profile.self.cycles-pp.loopback_xmit
      0.50            -0.4        0.06 ±  9%  perf-profile.self.cycles-pp.process_backlog
      1.20 ±  4%      -0.4        0.76 ± 12%  perf-profile.self.cycles-pp.mem_cgroup_charge_skmem
      0.79            -0.4        0.36        perf-profile.self.cycles-pp.__sys_sendto
      0.60 ±  7%      -0.4        0.18 ±  4%  perf-profile.self.cycles-pp.__sk_mem_reduce_allocated
      0.54            -0.4        0.14        perf-profile.self.cycles-pp.__alloc_skb
      0.46            -0.4        0.07        perf-profile.self.cycles-pp.ip_rcv_core
      0.49            -0.4        0.11 ±  3%  perf-profile.self.cycles-pp.__netif_receive_skb_core
      0.77            -0.4        0.40        perf-profile.self.cycles-pp.__fget_light
      0.43            -0.4        0.06 ±  8%  perf-profile.self.cycles-pp._raw_spin_lock_irq
      0.45 ±  3%      -0.3        0.10 ±  5%  perf-profile.self.cycles-pp.recv_omni
      0.46 ±  6%      -0.3        0.14 ±  5%  perf-profile.self.cycles-pp.cgroup_rstat_updated
      0.47            -0.3        0.16 ±  2%  perf-profile.self.cycles-pp.__check_object_size
      0.36            -0.3        0.05        perf-profile.self.cycles-pp.__local_bh_enable_ip
      0.36            -0.3        0.06        perf-profile.self.cycles-pp.ip_output
      0.41            -0.3        0.12 ±  4%  perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.70            -0.3        0.41        perf-profile.self.cycles-pp.tcp_recvmsg_locked
      0.34            -0.3        0.06        perf-profile.self.cycles-pp.__cond_resched
      0.36 ±  3%      -0.3        0.08 ±  6%  perf-profile.self.cycles-pp.recv_data
      0.38            -0.3        0.10 ±  4%  perf-profile.self.cycles-pp.refill_stock
      0.41            -0.3        0.15 ±  4%  perf-profile.self.cycles-pp.tcp_rcv_established
      0.55            -0.3        0.30        perf-profile.self.cycles-pp.tcp_clean_rtx_queue
      0.38            -0.3        0.13 ±  4%  perf-profile.self.cycles-pp.do_syscall_64
      0.30            -0.2        0.04 ± 45%  perf-profile.self.cycles-pp.update_cfs_group
      0.52            -0.2        0.27 ±  2%  perf-profile.self.cycles-pp.__virt_addr_valid
      0.30 ±  3%      -0.2        0.06 ±  8%  perf-profile.self.cycles-pp.recv
      0.60 ±  2%      -0.2        0.37 ±  2%  perf-profile.self.cycles-pp.send_omni_inner
      0.30            -0.2        0.07 ±  5%  perf-profile.self.cycles-pp.__mod_timer
      0.44 ±  5%      -0.2        0.22 ±  2%  perf-profile.self.cycles-pp.__send
      0.26 ±  2%      -0.2        0.03 ± 70%  perf-profile.self.cycles-pp.irqtime_account_irq
      0.27 ±  2%      -0.2        0.05        perf-profile.self.cycles-pp.tcp_data_queue
      0.32            -0.2        0.11 ±  3%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.34 ±  5%      -0.2        0.15 ±  7%  perf-profile.self.cycles-pp.ktime_get
      0.35 ±  3%      -0.2        0.16 ±  3%  perf-profile.self.cycles-pp.send_data
      0.24            -0.2        0.06        perf-profile.self.cycles-pp.tcp_established_options
      0.23 ±  2%      -0.2        0.05        perf-profile.self.cycles-pp.tcp_event_new_data_sent
      0.23            -0.2        0.06 ±  8%  perf-profile.self.cycles-pp.enqueue_to_backlog
      0.34 ±  2%      -0.2        0.17 ±  4%  perf-profile.self.cycles-pp.aa_sk_perm
      0.70            -0.2        0.54 ±  2%  perf-profile.self.cycles-pp.tcp_write_xmit
      0.52 ±  2%      -0.2        0.36        perf-profile.self.cycles-pp.skb_release_data
      0.18 ±  5%      -0.1        0.05        perf-profile.self.cycles-pp.tcp_v4_do_rcv
      0.18 ±  2%      -0.1        0.05 ±  8%  perf-profile.self.cycles-pp.tcp_sendmsg
      0.18 ±  2%      -0.1        0.06 ±  6%  perf-profile.self.cycles-pp.release_sock
      0.22 ±  3%      -0.1        0.10        perf-profile.self.cycles-pp.rb_erase
      0.22 ±  3%      -0.1        0.11 ±  4%  perf-profile.self.cycles-pp.__tcp_select_window
      0.28 ±  2%      -0.1        0.17 ±  2%  perf-profile.self.cycles-pp.tcp_check_space
      0.15 ±  3%      -0.1        0.05        perf-profile.self.cycles-pp.sock_sendmsg
      0.20 ±  3%      -0.1        0.12        perf-profile.self.cycles-pp.tcp_current_mss
      0.19 ±  3%      -0.1        0.13 ±  5%  perf-profile.self.cycles-pp.ipv4_mtu
      0.16 ±  3%      -0.1        0.11 ±  4%  perf-profile.self.cycles-pp.__list_add_valid
      0.24            -0.0        0.20 ±  2%  perf-profile.self.cycles-pp.__skb_clone
      0.09            -0.0        0.05        perf-profile.self.cycles-pp.check_stack_object
      0.14 ±  3%      -0.0        0.11 ±  4%  perf-profile.self.cycles-pp._raw_spin_trylock
      0.21            -0.0        0.18 ±  4%  perf-profile.self.cycles-pp.__entry_text_start
      0.12 ±  4%      -0.0        0.09        perf-profile.self.cycles-pp.sockfd_lookup_light
      0.08 ±  6%      -0.0        0.05 ±  7%  perf-profile.self.cycles-pp.alloc_pages
      0.18 ±  2%      -0.0        0.17 ±  2%  perf-profile.self.cycles-pp.tcp_tso_segs
      0.06            -0.0        0.05        perf-profile.self.cycles-pp.security_socket_sendmsg
      0.13 ±  2%      +0.0        0.15 ±  2%  perf-profile.self.cycles-pp.skb_do_copy_data_nocache
      0.05            +0.0        0.08 ±  4%  perf-profile.self.cycles-pp.__sk_mem_schedule
      0.25 ±  2%      +0.0        0.29        perf-profile.self.cycles-pp._copy_from_iter
      0.14 ±  3%      +0.0        0.18 ±  2%  perf-profile.self.cycles-pp.__alloc_pages
      0.13            +0.0        0.18 ±  2%  perf-profile.self.cycles-pp.kfree_skbmem
      0.00            +0.1        0.05 ±  8%  perf-profile.self.cycles-pp.free_pcppages_bulk
      0.09            +0.1        0.14 ±  3%  perf-profile.self.cycles-pp.get_page_from_freelist
      0.00            +0.1        0.06 ±  9%  perf-profile.self.cycles-pp.__mod_zone_page_state
      0.08            +0.1        0.14 ±  5%  perf-profile.self.cycles-pp.task_mm_cid_work
      0.05            +0.1        0.12 ±  4%  perf-profile.self.cycles-pp.free_unref_page_commit
      0.00            +0.1        0.08 ±  5%  perf-profile.self.cycles-pp.__slab_free
      0.10 ±  4%      +0.1        0.19 ±  5%  perf-profile.self.cycles-pp.__intel_pmu_enable_all
      0.00            +0.1        0.09 ±  4%  perf-profile.self.cycles-pp.rmqueue_bulk
      0.00            +0.1        0.13 ± 11%  perf-profile.self.cycles-pp.propagate_protected_usage
      0.11 ±  4%      +0.1        0.24        perf-profile.self.cycles-pp.rmqueue
      0.00            +0.1        0.14 ±  2%  perf-profile.self.cycles-pp.__zone_watermark_ok
      0.13 ±  2%      +0.2        0.29 ±  3%  perf-profile.self.cycles-pp.sock_rfree
      0.13 ±  3%      +0.2        0.30        perf-profile.self.cycles-pp.tcp_skb_entail
      0.28            +0.2        0.48        perf-profile.self.cycles-pp.__skb_datagram_iter
      0.07            +0.2        0.30 ±  2%  perf-profile.self.cycles-pp.skb_clone
      0.00            +0.3        0.25        perf-profile.self.cycles-pp.skb_try_coalesce
      0.22 ±  2%      +0.3        0.50 ±  3%  perf-profile.self.cycles-pp.skb_page_frag_refill
      0.07 ± 19%      +0.3        0.36 ±  7%  perf-profile.self.cycles-pp.page_counter_uncharge
      0.07 ±  9%      +0.4        0.44 ±  2%  perf-profile.self.cycles-pp.tcp_mtu_probe
      0.08 ± 25%      +0.4        0.49 ±  6%  perf-profile.self.cycles-pp.page_counter_try_charge
      0.00            +0.4        0.43 ±  2%  perf-profile.self.cycles-pp.__free_one_page
      0.41 ±  4%      +0.4        0.85 ±  3%  perf-profile.self.cycles-pp.try_charge_memcg
      0.31 ±  2%      +0.7        1.00 ±  2%  perf-profile.self.cycles-pp.check_heap_object
      0.31            +1.0        1.29        perf-profile.self.cycles-pp.free_unref_page_prepare
      0.30 ±  2%      +1.2        1.54 ±  5%  perf-profile.self.cycles-pp.__sk_mem_raise_allocated
      1.29            +1.6        2.87        perf-profile.self.cycles-pp.tcp_sendmsg_locked
      8.25            +9.8       18.00        perf-profile.self.cycles-pp.copyin
      0.01 ±223%     +14.1       14.06 ±  6%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      9.31           +26.0       35.30        perf-profile.self.cycles-pp.copyout



***************************************************************************************************
lkp-skl-d08: 36 threads 1 sockets Intel(R) Core(TM) i9-9980XE CPU @ 3.00GHz (Skylake) with 32G memory
=========================================================================================
class/compiler/cpufreq_governor/disk/fs/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  filesystem/gcc-12/performance/1SSD/xfs/x86_64-rhel-8.3/10%/debian-11.1-x86_64-20220510.cgz/lkp-skl-d08/filename/stress-ng/60s

commit: 
  e0c2ff903c ("sched/fair: Remove sched_feat(START_DEBIT)")
  86bfbb7ce4 ("sched/fair: Add lag based placement")

e0c2ff903c320d3f 86bfbb7ce4f67a88df263919816 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
   3126357           +67.4%    5234046        cpuidle..usage
    564.83 ± 10%     +39.7%     789.00 ±  7%  perf-c2c.HITM.local
      6.88            -6.1%       6.46        iostat.cpu.system
      1.89           -11.2%       1.68        iostat.cpu.user
      0.12 ±  5%      +0.0        0.14        mpstat.cpu.all.soft%
      1.91            -0.2        1.69        mpstat.cpu.all.usr%
     45.67 ± 21%  +27664.2%      12679        vmstat.io.bo
      3.00           +33.3%       4.00        vmstat.procs.r
     38471          +233.4%     128251        vmstat.system.cs
     51378           +12.6%      57874        vmstat.system.in
    762968           -23.1%     586584        stress-ng.filename.ops
     12499           -22.9%       9643        stress-ng.filename.ops_per_sec
    245907           -26.2%     181589 ±  2%  stress-ng.time.involuntary_context_switches
    248.33           -13.8%     214.17        stress-ng.time.percent_of_cpu_this_job_got
    121.62           -12.5%     106.36        stress-ng.time.system_time
     36.48           -18.9%      29.58        stress-ng.time.user_time
     18810 ± 21%   +8130.7%    1548218        stress-ng.time.voluntary_context_switches
     76213          +198.9%     227813 ±  2%  meminfo.Active
     76023          +199.4%     227624 ±  2%  meminfo.Active(anon)
    623049           +26.5%     788148        meminfo.Committed_AS
    911973           -19.9%     730850        meminfo.KReclaimable
     43474           +16.1%      50479        meminfo.Mapped
    911973           -19.9%     730850        meminfo.SReclaimable
     84302          +193.7%     247587 ±  2%  meminfo.Shmem
   1031349           -17.8%     847286        meminfo.Slab
     69987 ±  4%   +2091.0%    1533435        turbostat.C1
      0.27 ± 17%      +3.6        3.87        turbostat.C1%
    927490           +36.4%    1264726        turbostat.C1E
      2.70 ±  2%      +5.3        7.96        turbostat.C1E%
     87.83            -8.8       79.07        turbostat.C6%
   3438801           +12.7%    3874914        turbostat.IRQ
     22106 ± 12%   +2206.5%     509904 ±  2%  turbostat.POLL
      0.01            +0.1        0.11 ±  3%  turbostat.POLL%
      0.92            +5.1%       0.97        turbostat.RAMWatt
     19005          +199.4%      56906 ±  2%  proc-vmstat.nr_active_anon
    718370            +5.7%     759192        proc-vmstat.nr_file_pages
     77875            +4.5%      81404        proc-vmstat.nr_inactive_anon
      8973            +1.7%       9122        proc-vmstat.nr_kernel_stack
     10870           +16.2%      12627        proc-vmstat.nr_mapped
     21076          +193.7%      61899 ±  2%  proc-vmstat.nr_shmem
    227987           -19.9%     182690        proc-vmstat.nr_slab_reclaimable
     29843            -2.5%      29108        proc-vmstat.nr_slab_unreclaimable
     19005          +199.4%      56906 ±  2%  proc-vmstat.nr_zone_active_anon
     77875            +4.5%      81404        proc-vmstat.nr_zone_inactive_anon
    555994 ±  3%     +36.2%     757203        proc-vmstat.numa_hit
    555976 ±  3%     +36.6%     759419        proc-vmstat.numa_local
     28723          +190.9%      83545 ±  2%  proc-vmstat.pgactivate
    994049 ±  3%      +8.8%    1081504        proc-vmstat.pgalloc_normal
    208123            +9.7%     228266        proc-vmstat.pgfault
      3112 ± 21%  +27259.1%     851598        proc-vmstat.pgpgout
      5863 ± 62%  +6.9e+08%  4.074e+10 ± 10%  sched_debug.cfs_rq:/.avg_vruntime.avg
     41221 ± 47%  +2.9e+08%  1.206e+11 ± 11%  sched_debug.cfs_rq:/.avg_vruntime.max
      1140 ± 81%  +1.7e+08%  1.934e+09 ±221%  sched_debug.cfs_rq:/.avg_vruntime.min
      8191 ± 50%  +3.3e+08%  2.689e+10 ±  9%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      1.08 ± 17%    +100.0%       2.17 ± 10%  sched_debug.cfs_rq:/.h_nr_running.max
      0.47 ±  5%     +23.2%       0.58 ±  8%  sched_debug.cfs_rq:/.h_nr_running.stddev
      9.59 ±223%  +3.4e+10%  3.238e+09 ± 40%  sched_debug.cfs_rq:/.left_vruntime.avg
    345.17 ±223%  +2.2e+10%  7.576e+10 ± 23%  sched_debug.cfs_rq:/.left_vruntime.max
     56.72 ±223%  +2.5e+10%  1.426e+10 ± 28%  sched_debug.cfs_rq:/.left_vruntime.stddev
     21676 ± 69%    +376.4%     103262 ± 32%  sched_debug.cfs_rq:/.load.avg
    267018 ±153%    +491.5%    1579510 ± 23%  sched_debug.cfs_rq:/.load.max
     56938 ±125%    +483.8%     332423 ± 23%  sched_debug.cfs_rq:/.load.stddev
      5863 ± 62%  +6.9e+08%  4.074e+10 ± 10%  sched_debug.cfs_rq:/.min_vruntime.avg
     41221 ± 47%  +2.9e+08%  1.206e+11 ± 11%  sched_debug.cfs_rq:/.min_vruntime.max
      1140 ± 81%  +1.7e+08%  1.934e+09 ±221%  sched_debug.cfs_rq:/.min_vruntime.min
      8191 ± 50%  +3.3e+08%  2.689e+10 ±  9%  sched_debug.cfs_rq:/.min_vruntime.stddev
      1.08 ± 17%    +100.0%       2.17 ± 10%  sched_debug.cfs_rq:/.nr_running.max
    255.39 ± 32%     -52.5%     121.29 ± 47%  sched_debug.cfs_rq:/.removed.load_avg.stddev
      9.59 ±223%  +3.4e+10%  3.238e+09 ± 40%  sched_debug.cfs_rq:/.right_vruntime.avg
    345.17 ±223%  +2.2e+10%  7.576e+10 ± 23%  sched_debug.cfs_rq:/.right_vruntime.max
     56.72 ±223%  +2.5e+10%  1.426e+10 ± 28%  sched_debug.cfs_rq:/.right_vruntime.stddev
    599.66 ± 20%     -33.2%     400.30 ±  3%  sched_debug.cfs_rq:/.runnable_avg.avg
    594.09 ± 21%     -36.9%     374.80 ±  3%  sched_debug.cfs_rq:/.util_avg.avg
    247004 ±  9%     +30.2%     321579 ±  5%  sched_debug.cpu.avg_idle.stddev
     38445 ± 36%     +51.5%      58261        sched_debug.cpu.clock.avg
     38446 ± 36%     +51.5%      58262        sched_debug.cpu.clock.max
     38443 ± 36%     +51.5%      58259        sched_debug.cpu.clock.min
     38341 ± 35%     +51.2%      57984        sched_debug.cpu.clock_task.avg
     38369 ± 35%     +51.3%      58037        sched_debug.cpu.clock_task.max
     37965 ± 36%     +51.8%      57616        sched_debug.cpu.clock_task.min
     68.05 ±  5%     +15.0%      78.25        sched_debug.cpu.clock_task.stddev
      1140 ± 18%     -27.9%     822.02 ± 11%  sched_debug.cpu.curr->pid.avg
      1516 ±  4%      -9.3%       1376 ±  3%  sched_debug.cpu.curr->pid.stddev
      1.08 ± 17%     +92.3%       2.08 ±  8%  sched_debug.cpu.nr_running.max
      0.48 ±  5%     +23.1%       0.58 ±  7%  sched_debug.cpu.nr_running.stddev
     16585 ±100%    +630.2%     121105        sched_debug.cpu.nr_switches.avg
     57200 ± 48%    +625.9%     415245 ±  2%  sched_debug.cpu.nr_switches.max
      5354 ±132%    +553.1%      34967 ± 10%  sched_debug.cpu.nr_switches.min
     11424 ± 53%    +631.8%      83598        sched_debug.cpu.nr_switches.stddev
     10.25 ± 23%  +39290.2%       4037 ±  3%  sched_debug.cpu.nr_uninterruptible.max
     -9.33        +11315.2%      -1065        sched_debug.cpu.nr_uninterruptible.min
      4.67 ± 16%  +22596.0%       1060 ±  2%  sched_debug.cpu.nr_uninterruptible.stddev
     38444 ± 36%     +51.5%      58260        sched_debug.cpu_clk
     38365 ± 36%     +51.7%      58181        sched_debug.ktime
     38467 ± 36%     +51.5%      58282        sched_debug.sched_clk
  29305629          +300.0%  1.172e+08        sched_debug.sysctl_sched.sysctl_sched_features
      2.82 ±  5%     +64.7%       4.65 ±  2%  perf-stat.i.MPKI
 2.435e+09            -7.6%   2.25e+09        perf-stat.i.branch-instructions
      1.27            +0.2        1.46        perf-stat.i.branch-miss-rate%
  31512917            +6.7%   33619662        perf-stat.i.branch-misses
      8.70 ±  5%      -1.1        7.60 ±  4%  perf-stat.i.cache-miss-rate%
   3025698 ±  8%     +25.5%    3795739 ±  2%  perf-stat.i.cache-misses
  34376309 ±  3%     +54.0%   52929009        perf-stat.i.cache-references
     40232          +235.7%     135062        perf-stat.i.context-switches
      1.02            +6.8%       1.09        perf-stat.i.cpi
    193.15 ± 17%    +980.6%       2087        perf-stat.i.cpu-migrations
      5682 ±  3%     -21.3%       4469        perf-stat.i.cycles-between-cache-misses
      0.04            +0.0        0.05        perf-stat.i.dTLB-load-miss-rate%
 2.969e+09            -5.6%  2.802e+09        perf-stat.i.dTLB-loads
      0.00 ± 10%      +0.0        0.00 ±  6%  perf-stat.i.dTLB-store-miss-rate%
     17022 ± 13%    +322.0%      71832 ±  6%  perf-stat.i.dTLB-store-misses
 1.826e+09            -7.1%  1.695e+09        perf-stat.i.dTLB-stores
     37.41 ± 10%     -17.3       20.15 ±  9%  perf-stat.i.iTLB-load-miss-rate%
   2410813 ± 13%    +113.2%    5141046 ±  6%  perf-stat.i.iTLB-loads
 1.238e+10            -6.6%  1.156e+10        perf-stat.i.instructions
      0.99            -6.1%       0.93        perf-stat.i.ipc
    734.16 ± 29%     -71.4%     210.03 ±  4%  perf-stat.i.metric.K/sec
    201.10            -6.1%     188.83        perf-stat.i.metric.M/sec
      1855 ±  2%     +18.1%       2190        perf-stat.i.minor-faults
    560957 ± 13%     +23.5%     692699 ±  5%  perf-stat.i.node-stores
      1855 ±  2%     +18.1%       2190        perf-stat.i.page-faults
      2.78 ±  3%     +64.9%       4.58        perf-stat.overall.MPKI
      1.29            +0.2        1.49        perf-stat.overall.branch-miss-rate%
      8.79 ±  5%      -1.6        7.18 ±  2%  perf-stat.overall.cache-miss-rate%
      1.01            +6.5%       1.08        perf-stat.overall.cpi
      4171 ±  8%     -21.3%       3282 ±  3%  perf-stat.overall.cycles-between-cache-misses
      0.04            +0.0        0.05        perf-stat.overall.dTLB-load-miss-rate%
      0.00 ± 12%      +0.0        0.00 ±  6%  perf-stat.overall.dTLB-store-miss-rate%
     38.04 ± 10%     -18.0       20.08 ±  9%  perf-stat.overall.iTLB-load-miss-rate%
      0.99            -6.1%       0.93        perf-stat.overall.ipc
 2.397e+09            -7.6%  2.215e+09        perf-stat.ps.branch-instructions
  31019919            +6.7%   33099080        perf-stat.ps.branch-misses
   2978667 ±  9%     +25.5%    3738699 ±  2%  perf-stat.ps.cache-misses
  33840628 ±  3%     +54.0%   52105149        perf-stat.ps.cache-references
     39606          +235.7%     132949        perf-stat.ps.context-switches
    190.14 ± 17%    +980.5%       2054        perf-stat.ps.cpu-migrations
 2.923e+09            -5.6%  2.759e+09        perf-stat.ps.dTLB-loads
     16756 ± 13%    +322.0%      70709 ±  6%  perf-stat.ps.dTLB-store-misses
 1.797e+09            -7.1%  1.669e+09        perf-stat.ps.dTLB-stores
   2373287 ± 13%    +113.2%    5060719 ±  6%  perf-stat.ps.iTLB-loads
 1.219e+10            -6.6%  1.138e+10        perf-stat.ps.instructions
      1825 ±  2%     +18.1%       2155        perf-stat.ps.minor-faults
    552291 ± 13%     +23.5%     682244 ±  5%  perf-stat.ps.node-stores
      1826 ±  2%     +18.0%       2156        perf-stat.ps.page-faults
 7.857e+11            -6.5%  7.347e+11        perf-stat.total.instructions
      0.00 ± 31%    +814.3%       0.01 ± 47%  perf-sched.sch_delay.avg.ms.__cond_resched.down.xfs_buf_lock.xfs_buf_find_lock.xfs_buf_lookup
      0.00 ± 10%  +16407.7%       0.72 ± 42%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write.xfs_ilock.xfs_inactive_ifree.xfs_inactive
      0.00         +2070.8%       0.09 ±137%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc.xfs_inobt_init_common.xfs_inobt_init_cursor.xfs_difree_finobt
      0.00 ± 16%  +13596.0%       0.57 ± 30%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc.xfs_inobt_init_common.xfs_inobt_init_cursor.xfs_difree_inobt
      0.00        +11870.8%       0.48 ± 17%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc.xfs_trans_alloc.xfs_inactive_ifree.xfs_inactive
      0.00 ±223%  +20566.7%       0.21 ± 40%  perf-sched.sch_delay.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.00 ± 45%  +57595.2%       2.02 ± 33%  perf-sched.sch_delay.avg.ms.__cond_resched.xfs_trans_alloc.xfs_inactive_ifree.xfs_inactive.xfs_inodegc_worker
      0.00 ±128%  +12480.0%       0.10 ± 16%  perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.xlog_cil_commit
      0.00         +1041.7%       0.02 ±  3%  perf-sched.sch_delay.avg.ms.schedule_timeout.___down_common.__down.down
      0.02 ±148%    +457.7%       0.09 ±  2%  perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.00 ±155%    +637.5%       0.02 ± 33%  perf-sched.sch_delay.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.kmem_alloc.xfs_dir_createname
      0.01 ±  7%  +22329.1%       2.06 ± 71%  perf-sched.sch_delay.max.ms.__cond_resched.down.xfs_buf_lock.xfs_buf_find_lock.xfs_buf_lookup
      0.00 ±223%    +600.0%       0.01 ±  6%  perf-sched.sch_delay.max.ms.__cond_resched.down.xlog_write_iclog.xlog_state_release_iclog.xfs_log_force
      0.00 ±101%  +71158.3%       2.85 ±222%  perf-sched.sch_delay.max.ms.__cond_resched.down.xlog_write_iclog.xlog_state_release_iclog.xlog_write_get_more_iclog_space
      0.00 ±223%   +7325.0%       0.05 ±114%  perf-sched.sch_delay.max.ms.__cond_resched.down_read.xlog_cil_commit.__xfs_trans_commit.xfs_remove
      0.00 ±141%    +372.2%       0.01 ± 55%  perf-sched.sch_delay.max.ms.__cond_resched.down_write.xfs_ilock.xfs_create.xfs_generic_create
      0.00 ±223%  +15350.0%       0.10 ±183%  perf-sched.sch_delay.max.ms.__cond_resched.down_write.xfs_ilock.xfs_iget_cache_hit.xfs_iget
      0.01        +60286.7%       3.02 ± 26%  perf-sched.sch_delay.max.ms.__cond_resched.down_write.xfs_ilock.xfs_inactive_ifree.xfs_inactive
      0.00 ±223%   +1360.0%       0.01 ± 29%  perf-sched.sch_delay.max.ms.__cond_resched.dput.__fput.task_work_run.exit_to_user_mode_loop
      0.01 ±  7%    +441.1%       0.05 ± 54%  perf-sched.sch_delay.max.ms.__cond_resched.dput.do_unlinkat.__x64_sys_unlink.do_syscall_64
      0.01 ± 37%    +353.1%       0.04 ± 69%  perf-sched.sch_delay.max.ms.__cond_resched.dput.open_last_lookups.path_openat.do_filp_open
      0.00 ±223%   +4400.0%       0.03 ± 82%  perf-sched.sch_delay.max.ms.__cond_resched.dput.step_into.open_last_lookups.path_openat
      0.00 ±223%   +2333.3%       0.01 ± 26%  perf-sched.sch_delay.max.ms.__cond_resched.dput.terminate_walk.path_openat.do_filp_open
      0.01 ± 14%    +140.7%       0.02 ± 26%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc.getname_flags.part.0
      0.00 ±223%   +1760.0%       0.02 ± 69%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc.xfs_icreate_log.xfs_ialloc_inode_init.xfs_ialloc_ag_alloc
      0.01        +29943.3%       1.50 ±142%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc.xfs_inobt_init_common.xfs_inobt_init_cursor.xfs_difree_finobt
      0.01 ± 24%  +69097.1%       3.92 ± 10%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc.xfs_inobt_init_common.xfs_inobt_init_cursor.xfs_difree_inobt
      0.01 ±  7%  +78422.6%       4.06 ±  9%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc.xfs_trans_alloc.xfs_inactive_ifree.xfs_inactive
      0.01 ± 22%  +22846.9%       1.87 ± 74%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc.xlog_ticket_alloc.xfs_log_reserve.xfs_trans_reserve
      0.00 ±223%   +1066.7%       0.02 ± 47%  perf-sched.sch_delay.max.ms.__cond_resched.mnt_want_write.open_last_lookups.path_openat.do_filp_open
      0.00 ± 45%  +69779.2%       2.80 ± 88%  perf-sched.sch_delay.max.ms.__cond_resched.process_one_work.worker_thread.kthread.ret_from_fork
      0.00 ±223%  +5.3e+05%       5.34 ±  8%  perf-sched.sch_delay.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.00 ±223%   +1360.0%       0.01 ± 27%  perf-sched.sch_delay.max.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      0.00 ± 46%  +94313.0%       3.62 ±  6%  perf-sched.sch_delay.max.ms.__cond_resched.xfs_trans_alloc.xfs_inactive_ifree.xfs_inactive.xfs_inodegc_worker
      0.00 ±141%   +3325.0%       0.02 ± 24%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      0.01 ± 76%    +415.2%       0.03 ± 18%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.00 ±100%  +1.6e+05%       3.99 ± 15%  perf-sched.sch_delay.max.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.xlog_cil_commit
      0.16 ± 15%  +33641.0%      52.75 ±113%  perf-sched.sch_delay.max.ms.schedule_timeout.___down_common.__down.down
      0.00 ± 27%   +2037.9%       0.10 ±190%  perf-sched.sch_delay.max.ms.xlog_wait_on_iclog.xfs_extent_busy_flush.xfs_alloc_ag_vextent_near.xfs_alloc_vextent_near_bno
      0.01 ± 71%    +460.6%       0.03 ±122%  perf-sched.sch_delay.max.ms.xlog_wait_on_iclog.xlog_cil_push_work.process_one_work.worker_thread
      0.01 ±103%    +252.8%       0.02        perf-sched.total_sch_delay.average.ms
      4.44 ±  2%     -38.8%       2.71 ±  3%  perf-sched.total_wait_and_delay.average.ms
    125357          +158.2%     323713 ±  2%  perf-sched.total_wait_and_delay.count.ms
      4.43 ±  2%     -39.2%       2.69 ±  3%  perf-sched.total_wait_time.average.ms
    292.56 ±  7%     -29.1%     207.45 ± 20%  perf-sched.wait_and_delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
    285.58 ±  3%     -68.4%      90.21 ±  5%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      1.73 ± 21%     -60.5%       0.68 ±  2%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.___down_common.__down.down
      4.24 ±  6%      -8.6%       3.88 ±  6%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    105.19 ±  7%     -55.0%      47.36 ±  7%  perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      7.92 ±  3%    +136.6%      18.74 ±  5%  perf-sched.wait_and_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.33 ±141%   +4350.0%      14.83 ± 40%  perf-sched.wait_and_delay.count.__cond_resched.__alloc_pages.__folio_alloc.vma_alloc_folio.shmem_alloc_folio
      0.67 ±165%  +41925.0%     280.17 ± 15%  perf-sched.wait_and_delay.count.__cond_resched.down.xlog_write_iclog.xlog_state_release_iclog.xlog_write_get_more_iclog_space
     18529           -63.6%       6738 ±  4%  perf-sched.wait_and_delay.count.__cond_resched.dput.do_unlinkat.__x64_sys_unlink.do_syscall_64
      1.17 ±125%   +3271.4%      39.33 ± 61%  perf-sched.wait_and_delay.count.__cond_resched.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
      1.00 ±182%   +1033.3%      11.33 ± 32%  perf-sched.wait_and_delay.count.__cond_resched.mutex_lock.perf_poll.do_poll.constprop
     57.50 ±  3%    +179.7%     160.83 ±  4%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      6260 ± 17%   +3232.2%     208608 ±  3%  perf-sched.wait_and_delay.count.schedule_timeout.___down_common.__down.down
      2736 ±  4%    +160.3%       7122 ±  6%  perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     18722           -20.0%      14971 ±  2%  perf-sched.wait_and_delay.count.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      2.17 ± 77%  +15869.2%     346.00 ±  3%  perf-sched.wait_and_delay.count.xlog_wait_on_iclog.xlog_cil_push_work.process_one_work.worker_thread
      0.75 ± 83%   +1113.6%       9.12 ± 40%  perf-sched.wait_and_delay.max.ms.__cond_resched.dput.do_unlinkat.__x64_sys_unlink.do_syscall_64
      1519 ± 32%     -61.9%     579.25 ± 13%  perf-sched.wait_and_delay.max.ms.schedule_timeout.___down_common.__down.down
      3770 ±  9%     -40.8%       2233 ± 26%  perf-sched.wait_and_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.09           -62.3%       0.03 ± 78%  perf-sched.wait_time.avg.ms.__cond_resched.__fput.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare
      0.09 ±  5%     -50.0%       0.04 ± 60%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.kmem_alloc.xfs_dir_lookup
      0.09 ±  3%     -59.7%       0.04 ± 51%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.kmem_alloc.xfs_dir_removename
      0.09 ±  6%     -51.2%       0.04 ± 40%  perf-sched.wait_time.avg.ms.__cond_resched.apparmor_file_alloc_security.security_file_alloc.init_file.alloc_empty_file
      0.05 ±146%   +1539.5%       0.89 ± 11%  perf-sched.wait_time.avg.ms.__cond_resched.down.xlog_write_iclog.xlog_state_release_iclog.xfs_log_force
      0.08 ±  4%     -48.4%       0.04 ± 48%  perf-sched.wait_time.avg.ms.__cond_resched.down_read.walk_component.path_lookupat.filename_lookup
      0.09 ±  9%     -70.6%       0.03 ± 58%  perf-sched.wait_time.avg.ms.__cond_resched.down_read.xfs_ilock_data_map_shared.xfs_dir_lookup.xfs_lookup
      0.09 ±  3%     -59.7%       0.03 ± 31%  perf-sched.wait_time.avg.ms.__cond_resched.down_read.xlog_cil_commit.__xfs_trans_commit.xfs_remove
      0.09           -46.0%       0.05 ± 18%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.xfs_ilock.xfs_iget_cache_hit.xfs_iget
      0.72 ±  6%   +1483.6%      11.40 ±103%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.xfs_ilock.xfs_inactive_ifree.xfs_inactive
      0.08 ±  8%     -55.7%       0.04 ± 48%  perf-sched.wait_time.avg.ms.__cond_resched.dput.lookup_open.isra.0
      0.09 ±  7%     -52.3%       0.04 ± 22%  perf-sched.wait_time.avg.ms.__cond_resched.dput.open_last_lookups.path_openat.do_filp_open
      0.09 ±  2%     -44.3%       0.05 ± 32%  perf-sched.wait_time.avg.ms.__cond_resched.dput.step_into.open_last_lookups.path_openat
      0.08 ±  8%     -71.3%       0.02 ± 45%  perf-sched.wait_time.avg.ms.__cond_resched.dput.step_into.path_lookupat.filename_lookup
      0.09 ±  6%     -59.2%       0.04 ± 64%  perf-sched.wait_time.avg.ms.__cond_resched.dput.terminate_walk.path_lookupat.filename_lookup
      0.09 ±  2%     -42.0%       0.05 ± 32%  perf-sched.wait_time.avg.ms.__cond_resched.dput.terminate_walk.path_openat.do_filp_open
      0.08 ±  9%     -55.4%       0.04 ± 50%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.security_file_alloc.init_file.alloc_empty_file
      0.16 ±223%    +520.3%       1.00 ± 30%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.xfs_icreate_log.xfs_ialloc_inode_init.xfs_ialloc_ag_alloc
      0.09 ±  4%     -32.6%       0.06 ± 18%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.xfs_inobt_init_common.xfs_inobt_init_cursor.xfs_dialloc_ag
      0.71 ±  2%     -70.0%       0.21 ± 68%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.xfs_inobt_init_common.xfs_inobt_init_cursor.xfs_difree_finobt
      0.75 ± 16%    +829.7%       6.99 ± 58%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.xfs_trans_alloc.xfs_inactive_ifree.xfs_inactive
      0.07 ± 20%     -65.0%       0.03 ± 32%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.xfs_trans_alloc.xfs_trans_alloc_dir.xfs_remove
      0.08 ±  4%     -50.8%       0.04 ± 47%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.xfs_trans_alloc.xfs_trans_alloc_icreate.xfs_create
      0.08 ±  5%     -30.6%       0.06 ± 22%  perf-sched.wait_time.avg.ms.__cond_resched.mnt_want_write.do_unlinkat.__x64_sys_unlink.do_syscall_64
      0.09 ±  3%     -61.9%       0.03 ± 21%  perf-sched.wait_time.avg.ms.__cond_resched.mnt_want_write.open_last_lookups.path_openat.do_filp_open
      0.01 ±142%    +887.9%       0.05 ± 94%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.perf_event_ctx_lock_nested.constprop.0
      0.58 ± 44%    +796.9%       5.17 ± 84%  perf-sched.wait_time.avg.ms.__cond_resched.process_one_work.worker_thread.kthread.ret_from_fork
      0.65 ±223%   +3293.2%      22.20 ± 39%  perf-sched.wait_time.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.58 ± 44%   +1845.6%      11.23 ± 43%  perf-sched.wait_time.avg.ms.__cond_resched.xfs_trans_alloc.xfs_inactive_ifree.xfs_inactive.xfs_inodegc_worker
      0.09 ±  7%     -75.7%       0.02 ± 39%  perf-sched.wait_time.avg.ms.__cond_resched.xfs_trans_alloc.xfs_trans_alloc_icreate.xfs_create.xfs_generic_create
    292.56 ±  7%     -29.1%     207.44 ± 20%  perf-sched.wait_time.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
    285.58 ±  3%     -68.4%      90.21 ±  5%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      0.18 ± 63%    +451.2%       0.98 ± 34%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.xlog_cil_commit
      1.73 ± 21%     -61.8%       0.66 ±  2%  perf-sched.wait_time.avg.ms.schedule_timeout.___down_common.__down.down
      4.23 ±  6%      -8.6%       3.87 ±  6%  perf-sched.wait_time.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    105.09 ±  7%     -55.0%      47.31 ±  7%  perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.00 ±223%   +1100.0%       0.00 ± 49%  perf-sched.wait_time.avg.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
      7.90 ±  3%    +135.9%      18.65 ±  5%  perf-sched.wait_time.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.17 ± 10%    +365.3%       0.81 ±  2%  perf-sched.wait_time.avg.ms.xlog_wait_on_iclog.xfs_extent_busy_flush.xfs_alloc_ag_vextent_near.xfs_alloc_vextent_near_bno
      0.09         +2467.0%       2.43 ±126%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc.kmem_alloc.xfs_dir_createname
      0.10 ±  6%   +1088.4%       1.18 ±138%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.kmalloc_trace.single_open.do_dentry_open
      0.86 ± 38%   +2888.8%      25.78 ±142%  perf-sched.wait_time.max.ms.__cond_resched.down.xfs_buf_lock.xfs_buf_find_lock.xfs_buf_lookup
      0.05 ±146%   +3419.1%       1.90 ±  8%  perf-sched.wait_time.max.ms.__cond_resched.down.xlog_write_iclog.xlog_state_release_iclog.xfs_log_force
      0.11 ± 14%   +1168.3%       1.37 ±103%  perf-sched.wait_time.max.ms.__cond_resched.down_read.walk_component.path_lookupat.filename_lookup
      0.14 ± 37%   +3069.1%       4.29 ± 57%  perf-sched.wait_time.max.ms.__cond_resched.down_read.xlog_cil_commit.__xfs_trans_commit.xfs_create
      0.10 ± 15%    +930.9%       1.06 ± 54%  perf-sched.wait_time.max.ms.__cond_resched.down_read.xlog_cil_commit.__xfs_trans_commit.xfs_remove
      0.25 ±138%    +420.5%       1.30 ± 64%  perf-sched.wait_time.max.ms.__cond_resched.down_write.vfs_unlink.do_unlinkat.__x64_sys_unlink
      0.10         +2561.3%       2.54 ± 65%  perf-sched.wait_time.max.ms.__cond_resched.down_write.xfs_ilock.xfs_iget_cache_hit.xfs_iget
      1.01 ± 42%   +6256.9%      64.12 ± 98%  perf-sched.wait_time.max.ms.__cond_resched.down_write.xfs_ilock.xfs_inactive_ifree.xfs_inactive
      0.10 ±  9%    +837.5%       0.94 ±100%  perf-sched.wait_time.max.ms.__cond_resched.dput.__fput.task_work_run.exit_to_user_mode_loop
      0.75 ± 83%   +1113.6%       9.11 ± 41%  perf-sched.wait_time.max.ms.__cond_resched.dput.do_unlinkat.__x64_sys_unlink.do_syscall_64
      0.72 ± 60%    +652.9%       5.45 ± 62%  perf-sched.wait_time.max.ms.__cond_resched.dput.open_last_lookups.path_openat.do_filp_open
      0.10         +2553.8%       2.53 ± 84%  perf-sched.wait_time.max.ms.__cond_resched.dput.path_put.vfs_statx.vfs_fstatat
      0.10         +2142.6%       2.13 ± 87%  perf-sched.wait_time.max.ms.__cond_resched.dput.step_into.open_last_lookups.path_openat
      0.10 ±  3%   +2192.3%       2.22 ± 44%  perf-sched.wait_time.max.ms.__cond_resched.dput.terminate_walk.path_openat.do_filp_open
      0.10 ± 14%   +3145.8%       3.31 ±101%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.alloc_empty_file.path_openat.do_filp_open
      0.11 ±  5%   +6121.1%       6.77 ± 64%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.getname_flags.part.0
      0.10 ±  6%    +968.9%       1.05 ±112%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.security_file_alloc.init_file.alloc_empty_file
      0.16 ±223%   +2135.8%       3.61 ± 68%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.xfs_icreate_log.xfs_ialloc_inode_init.xfs_ialloc_ag_alloc
      0.10         +1599.3%       1.61 ± 21%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.xfs_inobt_init_common.xfs_inobt_init_cursor.xfs_dialloc_ag
      0.71          +459.5%       3.95 ± 10%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.xfs_inobt_init_common.xfs_inobt_init_cursor.xfs_difree_inobt
      4.72 ±163%   +3334.5%     162.20 ± 40%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.xfs_trans_alloc.xfs_inactive_ifree.xfs_inactive
      0.10 ±  5%   +1324.0%       1.39 ± 53%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.xfs_trans_alloc.xfs_trans_alloc_icreate.xfs_create
      0.10 ±  6%   +1512.5%       1.61 ± 66%  perf-sched.wait_time.max.ms.__cond_resched.mnt_want_write.do_unlinkat.__x64_sys_unlink.do_syscall_64
      0.10 ± 17%    +771.8%       0.90 ± 54%  perf-sched.wait_time.max.ms.__cond_resched.mnt_want_write.open_last_lookups.path_openat.do_filp_open
      0.01 ±148%   +4946.3%       0.34 ±150%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.perf_event_ctx_lock_nested.constprop.0
      0.58 ± 44%  +46566.3%     271.05 ± 62%  perf-sched.wait_time.max.ms.__cond_resched.process_one_work.worker_thread.kthread.ret_from_fork
      0.65 ±223%  +1.2e+05%     769.71 ± 36%  perf-sched.wait_time.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.59 ± 44%   +8771.3%      52.02 ± 67%  perf-sched.wait_time.max.ms.__cond_resched.xfs_trans_alloc.xfs_inactive_ifree.xfs_inactive.xfs_inodegc_worker
      0.01 ±142%  +1.2e+06%     167.22 ±222%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_common_interrupt
      0.10        +1.1e+05%     108.02 ±197%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
     80.89 ±223%    +840.0%     760.43 ± 47%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      0.42 ± 77%  +51079.7%     213.85 ± 64%  perf-sched.wait_time.max.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.xlog_cil_commit
      1519 ± 32%     -62.0%     578.09 ± 13%  perf-sched.wait_time.max.ms.schedule_timeout.___down_common.__down.down
      0.10 ± 41%   +9351.0%       9.09 ± 35%  perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.__flush_workqueue.xlog_cil_push_now.isra
      0.94           +13.6%       1.07 ± 11%  perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      3770 ±  9%     -40.8%       2233 ± 26%  perf-sched.wait_time.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.00 ±223%    +725.0%       0.01 ± 26%  perf-sched.wait_time.max.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
      0.19 ±  6%   +2104.1%       4.15 ± 12%  perf-sched.wait_time.max.ms.xlog_wait_on_iclog.xfs_extent_busy_flush.xfs_alloc_ag_vextent_near.xfs_alloc_vextent_near_bno
     23.15            -3.1       20.08 ±  3%  perf-profile.calltrace.cycles-pp.intel_idle_ibrs.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
     11.76 ±  2%      -2.5        9.21        perf-profile.calltrace.cycles-pp.__xstat64
     19.09            -2.1       16.94        perf-profile.calltrace.cycles-pp.creat64
     17.87            -2.0       15.90        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.creat64
      9.06 ±  2%      -1.9        7.14 ±  2%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__xstat64
     17.52            -1.9       15.60        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.creat64
     16.79            -1.8       15.03        perf-profile.calltrace.cycles-pp.__x64_sys_creat.do_syscall_64.entry_SYSCALL_64_after_hwframe.creat64
     16.73            -1.7       14.98        perf-profile.calltrace.cycles-pp.do_sys_openat2.__x64_sys_creat.do_syscall_64.entry_SYSCALL_64_after_hwframe.creat64
      8.18 ±  2%      -1.7        6.46 ±  2%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__xstat64
     15.95            -1.6       14.36        perf-profile.calltrace.cycles-pp.do_filp_open.do_sys_openat2.__x64_sys_creat.do_syscall_64.entry_SYSCALL_64_after_hwframe
     15.86            -1.6       14.27        perf-profile.calltrace.cycles-pp.path_openat.do_filp_open.do_sys_openat2.__x64_sys_creat.do_syscall_64
      6.49 ±  2%      -1.3        5.16 ±  2%  perf-profile.calltrace.cycles-pp.__do_sys_newstat.do_syscall_64.entry_SYSCALL_64_after_hwframe.__xstat64
      6.15 ±  2%      -1.2        4.90 ±  3%  perf-profile.calltrace.cycles-pp.vfs_fstatat.__do_sys_newstat.do_syscall_64.entry_SYSCALL_64_after_hwframe.__xstat64
      5.64            -1.2        4.42 ±  2%  perf-profile.calltrace.cycles-pp.__close
     13.72            -1.2       12.54        perf-profile.calltrace.cycles-pp.open_last_lookups.path_openat.do_filp_open.do_sys_openat2.__x64_sys_creat
      5.54            -1.1        4.40 ±  3%  perf-profile.calltrace.cycles-pp.open64
     13.30            -1.0       12.25        perf-profile.calltrace.cycles-pp.lookup_open.open_last_lookups.path_openat.do_filp_open.do_sys_openat2
      4.69 ±  2%      -1.0        3.69 ±  2%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.open64
      4.88 ±  2%      -1.0        3.92 ±  3%  perf-profile.calltrace.cycles-pp.vfs_statx.vfs_fstatat.__do_sys_newstat.do_syscall_64.entry_SYSCALL_64_after_hwframe
      4.42            -1.0        3.47 ±  3%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.open64
      4.46 ±  3%      -0.9        3.56 ±  4%  perf-profile.calltrace.cycles-pp.filename_lookup.vfs_statx.vfs_fstatat.__do_sys_newstat.do_syscall_64
     12.44            -0.9       11.56        perf-profile.calltrace.cycles-pp.xfs_generic_create.lookup_open.open_last_lookups.path_openat.do_filp_open
      4.00 ±  3%      -0.9        3.13 ±  2%  perf-profile.calltrace.cycles-pp.read
      4.25 ±  3%      -0.9        3.39 ±  4%  perf-profile.calltrace.cycles-pp.path_lookupat.filename_lookup.vfs_statx.vfs_fstatat.__do_sys_newstat
      4.01            -0.8        3.16 ±  2%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__close
      3.91 ±  2%      -0.8        3.08 ±  3%  perf-profile.calltrace.cycles-pp.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe.open64
      3.87 ±  2%      -0.8        3.05 ±  3%  perf-profile.calltrace.cycles-pp.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe.open64
     11.84            -0.8       11.07        perf-profile.calltrace.cycles-pp.xfs_create.xfs_generic_create.lookup_open.open_last_lookups.path_openat
      3.43            -0.7        2.72 ±  3%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__close
      3.19 ±  4%      -0.7        2.48 ±  2%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.read
      3.33 ±  2%      -0.7        2.65 ±  4%  perf-profile.calltrace.cycles-pp.do_filp_open.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.26 ±  3%      -0.7        2.59 ±  3%  perf-profile.calltrace.cycles-pp.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat.do_syscall_64
      2.90 ±  5%      -0.6        2.27 ±  2%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      2.93 ±  2%      -0.6        2.33 ±  3%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__close
      2.36 ±  6%      -0.5        1.87 ±  3%  perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      4.75 ±  2%      -0.5        4.28        perf-profile.calltrace.cycles-pp.__xfs_trans_commit.xfs_create.xfs_generic_create.lookup_open.open_last_lookups
      2.28 ±  6%      -0.5        1.82 ±  3%  perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
      2.66 ±  3%      -0.4        2.21 ±  4%  perf-profile.calltrace.cycles-pp.stress_mwc32modn
      2.02 ±  7%      -0.4        1.58 ±  3%  perf-profile.calltrace.cycles-pp.seq_read_iter.seq_read.vfs_read.ksys_read.do_syscall_64
      2.06 ±  6%      -0.4        1.64 ±  4%  perf-profile.calltrace.cycles-pp.seq_read.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.71 ±  3%      -0.4        0.29 ±100%  perf-profile.calltrace.cycles-pp.__filename_parentat.do_unlinkat.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.06 ±  6%      -0.4        1.65 ±  4%  perf-profile.calltrace.cycles-pp.walk_component.path_lookupat.filename_lookup.vfs_statx.vfs_fstatat
      1.64 ±  3%      -0.4        1.23 ±  2%  perf-profile.calltrace.cycles-pp.syscall_return_via_sysret.__xstat64
      2.03 ±  4%      -0.4        1.64 ±  4%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__close
      0.66 ±  2%      -0.4        0.27 ±100%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.creat64
      2.00 ±  4%      -0.4        1.62 ±  4%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.49 ±  5%      -0.4        1.14 ±  4%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__xstat64
      2.88 ±  2%      -0.3        2.54 ±  4%  perf-profile.calltrace.cycles-pp.xfs_dialloc_ag.xfs_dialloc.xfs_create.xfs_generic_create.lookup_open
      1.86 ±  4%      -0.3        1.52 ±  5%  perf-profile.calltrace.cycles-pp.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.67 ±  4%      -0.3        0.35 ± 70%  perf-profile.calltrace.cycles-pp.xfs_trans_reserve.xfs_trans_alloc.xfs_trans_alloc_icreate.xfs_create.xfs_generic_create
      1.58 ±  5%      -0.3        1.27 ±  5%  perf-profile.calltrace.cycles-pp.__fput.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      1.40 ± 10%      -0.3        1.10 ±  6%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
      1.38 ± 10%      -0.3        1.09 ±  6%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
      0.89 ± 23%      -0.3        0.60 ±  5%  perf-profile.calltrace.cycles-pp.do_dentry_open.do_open.path_openat.do_filp_open.do_sys_openat2
      3.45 ±  3%      -0.3        3.17        perf-profile.calltrace.cycles-pp.xlog_cil_commit.__xfs_trans_commit.xfs_create.xfs_generic_create.lookup_open
      1.40 ±  4%      -0.3        1.12 ±  6%  perf-profile.calltrace.cycles-pp.link_path_walk.path_lookupat.filename_lookup.vfs_statx.vfs_fstatat
      0.64 ±  7%      -0.3        0.37 ± 70%  perf-profile.calltrace.cycles-pp.do_open.path_openat.do_filp_open.do_sys_openat2.__x64_sys_creat
      1.12 ± 10%      -0.2        0.88 ±  5%  perf-profile.calltrace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      0.69 ±  3%      -0.2        0.46 ± 44%  perf-profile.calltrace.cycles-pp.__entry_text_start.__xstat64
      1.18 ±  6%      -0.2        0.94 ±  3%  perf-profile.calltrace.cycles-pp.__lookup_slow.walk_component.path_lookupat.filename_lookup.vfs_statx
      1.11 ±  7%      -0.2        0.88 ±  6%  perf-profile.calltrace.cycles-pp.seq_show.seq_read_iter.seq_read.vfs_read.ksys_read
      1.09 ±  4%      -0.2        0.86 ±  2%  perf-profile.calltrace.cycles-pp.getname_flags.vfs_fstatat.__do_sys_newstat.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.01 ±  3%      -0.2        0.78 ±  2%  perf-profile.calltrace.cycles-pp.syscall_return_via_sysret.__close
      0.76 ± 10%      -0.2        0.54 ±  4%  perf-profile.calltrace.cycles-pp.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt
      0.81 ± 10%      -0.2        0.60 ±  4%  perf-profile.calltrace.cycles-pp.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      0.75 ±  9%      -0.2        0.54 ±  3%  perf-profile.calltrace.cycles-pp.update_process_times.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt
      0.90 ±  3%      -0.2        0.69 ±  2%  perf-profile.calltrace.cycles-pp.do_open.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat
      0.86 ±  5%      -0.2        0.65 ±  4%  perf-profile.calltrace.cycles-pp.xfs_trans_alloc_icreate.xfs_create.xfs_generic_create.lookup_open.open_last_lookups
      0.84 ±  5%      -0.2        0.63 ±  5%  perf-profile.calltrace.cycles-pp.xfs_trans_alloc.xfs_trans_alloc_icreate.xfs_create.xfs_generic_create.lookup_open
      0.64 ±  6%      -0.2        0.44 ± 45%  perf-profile.calltrace.cycles-pp.xfs_trans_alloc.xfs_inactive_ifree.xfs_inactive.xfs_inodegc_worker.process_one_work
      0.74 ±  4%      -0.2        0.54 ±  4%  perf-profile.calltrace.cycles-pp.list_sort.xfs_trans_run_precommits.__xfs_trans_commit.xfs_create.xfs_generic_create
      1.24 ±  3%      -0.2        1.05        perf-profile.calltrace.cycles-pp.xfs_difree_finobt.xfs_difree.xfs_ifree.xfs_inactive_ifree.xfs_inactive
      1.08 ±  4%      -0.2        0.90 ±  4%  perf-profile.calltrace.cycles-pp.xfs_trans_alloc_dir.xfs_remove.xfs_vn_unlink.vfs_unlink.do_unlinkat
      0.80 ±  5%      -0.2        0.62 ±  4%  perf-profile.calltrace.cycles-pp.strncpy_from_user.getname_flags.vfs_fstatat.__do_sys_newstat.do_syscall_64
      0.91 ±  7%      -0.2        0.74 ±  7%  perf-profile.calltrace.cycles-pp.seq_printf.seq_show.seq_read_iter.seq_read.vfs_read
      0.78 ±  3%      -0.2        0.61 ±  7%  perf-profile.calltrace.cycles-pp.alloc_empty_file.path_openat.do_filp_open.do_sys_openat2.__x64_sys_creat
      0.85 ±  7%      -0.2        0.69 ±  8%  perf-profile.calltrace.cycles-pp.vsnprintf.seq_printf.seq_show.seq_read_iter.seq_read
      0.80 ± 10%      -0.2        0.64 ±  7%  perf-profile.calltrace.cycles-pp.lookup_fast.walk_component.path_lookupat.filename_lookup.vfs_statx
      0.58 ±  6%      -0.2        0.43 ± 44%  perf-profile.calltrace.cycles-pp.xfs_log_reserve.xfs_trans_reserve.xfs_trans_alloc.xfs_trans_alloc_dir.xfs_remove
      1.56 ±  4%      -0.2        1.41 ±  5%  perf-profile.calltrace.cycles-pp.xfs_init_new_inode.xfs_create.xfs_generic_create.lookup_open.open_last_lookups
      0.85 ±  7%      -0.2        0.70 ±  4%  perf-profile.calltrace.cycles-pp.xfs_trans_alloc.xfs_trans_alloc_dir.xfs_remove.xfs_vn_unlink.vfs_unlink
      0.98 ±  3%      -0.1        0.83 ±  2%  perf-profile.calltrace.cycles-pp.xfs_dialloc_ag_update_inobt.xfs_dialloc_ag.xfs_dialloc.xfs_create.xfs_generic_create
      0.74 ±  3%      -0.1        0.59 ±  6%  perf-profile.calltrace.cycles-pp.xfs_dir_createname.xfs_create.xfs_generic_create.lookup_open.open_last_lookups
      0.72 ± 10%      -0.1        0.57 ±  7%  perf-profile.calltrace.cycles-pp.__d_lookup_rcu.lookup_fast.walk_component.path_lookupat.filename_lookup
      0.73 ±  3%      -0.1        0.59 ±  3%  perf-profile.calltrace.cycles-pp.xfs_dir_removename.xfs_remove.xfs_vn_unlink.vfs_unlink.do_unlinkat
      0.72 ±  5%      -0.1        0.58 ±  4%  perf-profile.calltrace.cycles-pp.stress_filename
      1.06 ±  4%      -0.1        0.94 ±  4%  perf-profile.calltrace.cycles-pp.xfs_trans_run_precommits.__xfs_trans_commit.xfs_create.xfs_generic_create.lookup_open
      0.83 ±  3%      -0.1        0.71 ±  4%  perf-profile.calltrace.cycles-pp.link_path_walk.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat
      0.71 ±  5%      -0.1        0.60 ±  5%  perf-profile.calltrace.cycles-pp.destroy_inode.do_unlinkat.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.66 ±  8%      -0.1        0.57 ±  4%  perf-profile.calltrace.cycles-pp.xfs_trans_reserve.xfs_trans_alloc.xfs_trans_alloc_dir.xfs_remove.xfs_vn_unlink
      0.64 ±  4%      -0.1        0.56 ±  2%  perf-profile.calltrace.cycles-pp.xfs_btree_lookup.xfs_dialloc_ag_update_inobt.xfs_dialloc_ag.xfs_dialloc.xfs_create
      0.84 ±  2%      -0.1        0.77 ±  4%  perf-profile.calltrace.cycles-pp.xfs_iget.xfs_init_new_inode.xfs_create.xfs_generic_create.lookup_open
      0.63 ±  4%      -0.0        0.59 ±  2%  perf-profile.calltrace.cycles-pp.xfs_iget_cache_hit.xfs_iget.xfs_init_new_inode.xfs_create.xfs_generic_create
      0.97 ±  9%      +0.2        1.21 ±  6%  perf-profile.calltrace.cycles-pp.clock_nanosleep
      0.82 ± 10%      +0.3        1.10 ±  6%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.clock_nanosleep
      0.79 ± 10%      +0.3        1.06 ±  5%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
      0.70 ±  9%      +0.3        0.97 ±  5%  perf-profile.calltrace.cycles-pp.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
      0.68 ±  9%      +0.3        0.96 ±  6%  perf-profile.calltrace.cycles-pp.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_64
      0.70 ±  9%      +0.3        0.97 ±  5%  perf-profile.calltrace.cycles-pp.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.72 ±  9%      +0.3        1.00 ±  5%  perf-profile.calltrace.cycles-pp.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
      3.47            +0.3        3.75 ±  2%  perf-profile.calltrace.cycles-pp.xfs_dialloc.xfs_create.xfs_generic_create.lookup_open.open_last_lookups
      0.78 ±  5%      +0.3        1.10 ±  5%  perf-profile.calltrace.cycles-pp.xfs_trans_run_precommits.__xfs_trans_commit.xfs_remove.xfs_vn_unlink.vfs_unlink
     10.89            +0.3       11.22        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.unlink
      0.55 ±  2%      +0.4        0.91 ±  4%  perf-profile.calltrace.cycles-pp.xfs_trans_run_precommits.__xfs_trans_commit.xfs_inactive_ifree.xfs_inactive.xfs_inodegc_worker
      0.51 ± 45%      +0.4        0.88 ±  6%  perf-profile.calltrace.cycles-pp.__schedule.schedule.do_nanosleep.hrtimer_nanosleep.common_nsleep
      0.52 ± 45%      +0.4        0.88 ±  6%  perf-profile.calltrace.cycles-pp.schedule.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
     10.60            +0.4       10.99        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink
     10.09            +0.4       10.50        perf-profile.calltrace.cycles-pp.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink
      0.18 ±141%      +0.4        0.60 ±  5%  perf-profile.calltrace.cycles-pp.__irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
      9.72            +0.5       10.18        perf-profile.calltrace.cycles-pp.do_unlinkat.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink
      1.10 ±  3%      +0.5        1.61 ±  4%  perf-profile.calltrace.cycles-pp.xlog_cil_insert_items.xlog_cil_commit.__xfs_trans_commit.xfs_remove.xfs_vn_unlink
      0.00            +0.5        0.54 ±  4%  perf-profile.calltrace.cycles-pp.update_sd_lb_stats.find_busiest_group.load_balance.newidle_balance.pick_next_task_fair
      0.00            +0.5        0.55 ±  4%  perf-profile.calltrace.cycles-pp.find_busiest_group.load_balance.newidle_balance.pick_next_task_fair.__schedule
      0.58 ±  8%      +0.6        1.14 ±  4%  perf-profile.calltrace.cycles-pp.xfs_iunlink.xfs_remove.xfs_vn_unlink.vfs_unlink.do_unlinkat
      0.85 ±  2%      +0.6        1.42 ±  5%  perf-profile.calltrace.cycles-pp.xlog_cil_insert_format_items.xlog_cil_insert_items.xlog_cil_commit.__xfs_trans_commit.xfs_remove
      0.00            +0.6        0.57 ±  5%  perf-profile.calltrace.cycles-pp.__do_softirq.__irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
      0.00            +0.6        0.60 ±  4%  perf-profile.calltrace.cycles-pp.xfs_buf_item_release.xlog_cil_commit.__xfs_trans_commit.xfs_inactive_ifree.xfs_inactive
      0.00            +0.6        0.61 ±  4%  perf-profile.calltrace.cycles-pp.xlog_cil_alloc_shadow_bufs.xlog_cil_commit.__xfs_trans_commit.xfs_remove.xfs_vn_unlink
      0.08 ±223%      +0.6        0.72 ±  5%  perf-profile.calltrace.cycles-pp.newidle_balance.pick_next_task_fair.__schedule.schedule.do_nanosleep
      0.00            +0.6        0.64 ±  6%  perf-profile.calltrace.cycles-pp.xfs_buf_item_size.xlog_cil_alloc_shadow_bufs.xlog_cil_commit.__xfs_trans_commit.xfs_inactive_ifree
      0.00            +0.6        0.64 ±  3%  perf-profile.calltrace.cycles-pp.xfs_buf_read_map.xfs_trans_read_buf_map.xfs_read_agi.xfs_ialloc_read_agi.xfs_dialloc
      0.08 ±223%      +0.6        0.73 ±  6%  perf-profile.calltrace.cycles-pp.pick_next_task_fair.__schedule.schedule.do_nanosleep.hrtimer_nanosleep
      0.00            +0.6        0.65 ±  6%  perf-profile.calltrace.cycles-pp.load_balance.newidle_balance.pick_next_task_fair.__schedule.schedule
      0.00            +0.7        0.67 ±  4%  perf-profile.calltrace.cycles-pp.xfs_buf_get_map.xfs_buf_read_map.xfs_trans_read_buf_map.xfs_read_agi.xfs_iunlink
      0.00            +0.7        0.70 ±  5%  perf-profile.calltrace.cycles-pp.xfs_buf_read_map.xfs_trans_read_buf_map.xfs_read_agi.xfs_iunlink.xfs_remove
      0.00            +0.7        0.72 ±  5%  perf-profile.calltrace.cycles-pp.__schedule.schedule.schedule_timeout.___down_common.__down
      3.09 ±  2%      +0.7        3.83        perf-profile.calltrace.cycles-pp.xfs_difree.xfs_ifree.xfs_inactive_ifree.xfs_inactive.xfs_inodegc_worker
      0.09 ±223%      +0.7        0.82 ±  3%  perf-profile.calltrace.cycles-pp.xfs_ialloc_read_agi.xfs_dialloc.xfs_create.xfs_generic_create.lookup_open
      0.00            +0.7        0.74 ±  3%  perf-profile.calltrace.cycles-pp.xfs_trans_read_buf_map.xfs_read_agi.xfs_ialloc_read_agi.xfs_dialloc.xfs_create
      0.00            +0.8        0.76 ±  5%  perf-profile.calltrace.cycles-pp.schedule.schedule_timeout.___down_common.__down.down
      0.00            +0.8        0.79 ±  3%  perf-profile.calltrace.cycles-pp.xfs_read_agi.xfs_ialloc_read_agi.xfs_dialloc.xfs_create.xfs_generic_create
      0.08 ±223%      +0.8        0.88 ±  5%  perf-profile.calltrace.cycles-pp.xlog_cil_alloc_shadow_bufs.xlog_cil_commit.__xfs_trans_commit.xfs_inactive_ifree.xfs_inactive
      0.00            +0.8        0.80 ±  5%  perf-profile.calltrace.cycles-pp.schedule_timeout.___down_common.__down.down.xfs_buf_lock
      0.00            +0.8        0.81 ±  4%  perf-profile.calltrace.cycles-pp.xfs_trans_read_buf_map.xfs_read_agi.xfs_iunlink.xfs_remove.xfs_vn_unlink
      2.27 ±  4%      +0.8        3.10 ±  3%  perf-profile.calltrace.cycles-pp.xlog_cil_commit.__xfs_trans_commit.xfs_remove.xfs_vn_unlink.vfs_unlink
      0.00            +0.8        0.85 ±  4%  perf-profile.calltrace.cycles-pp.___down_common.__down.down.xfs_buf_lock.xfs_buf_find_lock
      0.00            +0.9        0.85 ±  5%  perf-profile.calltrace.cycles-pp.__down.down.xfs_buf_lock.xfs_buf_find_lock.xfs_buf_lookup
      0.00            +0.9        0.85 ±  4%  perf-profile.calltrace.cycles-pp.xfs_read_agi.xfs_iunlink.xfs_remove.xfs_vn_unlink.vfs_unlink
      3.55 ±  3%      +0.9        4.45        perf-profile.calltrace.cycles-pp.xfs_ifree.xfs_inactive_ifree.xfs_inactive.xfs_inodegc_worker.process_one_work
      0.00            +1.0        0.97 ± 21%  perf-profile.calltrace.cycles-pp.down.xfs_buf_lock.xfs_buf_find_lock.xfs_buf_lookup.xfs_buf_get_map
      0.00            +1.0        1.00 ± 20%  perf-profile.calltrace.cycles-pp.xfs_buf_lock.xfs_buf_find_lock.xfs_buf_lookup.xfs_buf_get_map.xfs_buf_read_map
      0.00            +1.0        1.01 ±  7%  perf-profile.calltrace.cycles-pp.poll_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      1.17 ±  3%      +1.1        2.24 ±  3%  perf-profile.calltrace.cycles-pp.xlog_cil_insert_items.xlog_cil_commit.__xfs_trans_commit.xfs_inactive_ifree.xfs_inactive
      0.99 ±  4%      +1.1        2.06 ±  5%  perf-profile.calltrace.cycles-pp.xlog_cil_insert_format_items.xlog_cil_insert_items.xlog_cil_commit.__xfs_trans_commit.xfs_inactive_ifree
      6.98            +1.1        8.08        perf-profile.calltrace.cycles-pp.vfs_unlink.do_unlinkat.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +1.1        1.12 ± 25%  perf-profile.calltrace.cycles-pp.xfs_buf_find_lock.xfs_buf_lookup.xfs_buf_get_map.xfs_buf_read_map.xfs_trans_read_buf_map
      3.27 ±  2%      +1.1        4.40 ±  2%  perf-profile.calltrace.cycles-pp.__xfs_trans_commit.xfs_remove.xfs_vn_unlink.vfs_unlink.do_unlinkat
      0.00            +1.2        1.16 ±  4%  perf-profile.calltrace.cycles-pp.xfs_buf_read_map.xfs_trans_read_buf_map.xfs_read_agi.xfs_ialloc_read_agi.xfs_difree
      6.38            +1.2        7.59        perf-profile.calltrace.cycles-pp.xfs_vn_unlink.vfs_unlink.do_unlinkat.__x64_sys_unlink.do_syscall_64
      6.32            +1.2        7.55        perf-profile.calltrace.cycles-pp.xfs_remove.xfs_vn_unlink.vfs_unlink.do_unlinkat.__x64_sys_unlink
      0.00            +1.3        1.32 ±  3%  perf-profile.calltrace.cycles-pp.xfs_trans_read_buf_map.xfs_read_agi.xfs_ialloc_read_agi.xfs_difree.xfs_ifree
      0.00            +1.4        1.37 ±  3%  perf-profile.calltrace.cycles-pp.xfs_read_agi.xfs_ialloc_read_agi.xfs_difree.xfs_ifree.xfs_inactive_ifree
      0.00            +1.4        1.42 ±  2%  perf-profile.calltrace.cycles-pp.xfs_ialloc_read_agi.xfs_difree.xfs_ifree.xfs_inactive_ifree.xfs_inactive
      0.00            +1.8        1.75        perf-profile.calltrace.cycles-pp.xfs_buf_get_map.xfs_buf_read_map.xfs_trans_read_buf_map.xfs_read_agi.xfs_ialloc_read_agi
      2.71 ±  3%      +1.8        4.48 ±  3%  perf-profile.calltrace.cycles-pp.xlog_cil_commit.__xfs_trans_commit.xfs_inactive_ifree.xfs_inactive.xfs_inodegc_worker
      0.00            +1.9        1.88 ±  4%  perf-profile.calltrace.cycles-pp.intel_idle_irq.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      0.98 ± 20%      +1.9        2.90 ±  3%  perf-profile.calltrace.cycles-pp.xfs_buf_item_format_segment.xfs_buf_item_format.xlog_cil_insert_format_items.xlog_cil_insert_items.xlog_cil_commit
      0.00            +1.9        1.92 ± 11%  perf-profile.calltrace.cycles-pp.xfs_buf_lookup.xfs_buf_get_map.xfs_buf_read_map.xfs_trans_read_buf_map.xfs_read_agi
      1.30 ±  4%      +1.9        3.25 ±  3%  perf-profile.calltrace.cycles-pp.xfs_buf_item_format.xlog_cil_insert_format_items.xlog_cil_insert_items.xlog_cil_commit.__xfs_trans_commit
      3.44 ±  2%      +2.2        5.62 ±  3%  perf-profile.calltrace.cycles-pp.__xfs_trans_commit.xfs_inactive_ifree.xfs_inactive.xfs_inodegc_worker.process_one_work
      0.18 ±141%      +3.0        3.13 ± 12%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.intel_idle_irq.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      0.91 ± 15%      +3.0        3.89 ±  9%  perf-profile.calltrace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      7.79            +3.0       10.77        perf-profile.calltrace.cycles-pp.xfs_inactive_ifree.xfs_inactive.xfs_inodegc_worker.process_one_work.worker_thread
      7.84            +3.0       10.84        perf-profile.calltrace.cycles-pp.xfs_inactive.xfs_inodegc_worker.process_one_work.worker_thread.kthread
      8.04            +3.1       11.11        perf-profile.calltrace.cycles-pp.xfs_inodegc_worker.process_one_work.worker_thread.kthread.ret_from_fork
      8.90 ±  2%      +3.3       12.20        perf-profile.calltrace.cycles-pp.ret_from_fork_asm
      8.90 ±  2%      +3.3       12.20        perf-profile.calltrace.cycles-pp.ret_from_fork.ret_from_fork_asm
      8.90 ±  2%      +3.3       12.20        perf-profile.calltrace.cycles-pp.kthread.ret_from_fork.ret_from_fork_asm
      8.07 ±  2%      +3.6       11.65        perf-profile.calltrace.cycles-pp.process_one_work.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     26.97            +3.6       30.60 ±  2%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
      8.15            +3.6       11.79        perf-profile.calltrace.cycles-pp.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     26.87            +3.7       30.55 ±  3%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
     27.24            +3.9       31.12 ±  3%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     27.44            +4.8       32.19 ±  3%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     27.44            +4.8       32.21 ±  3%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     27.44            +4.8       32.21 ±  3%  perf-profile.calltrace.cycles-pp.start_secondary.secondary_startup_64_no_verify
     27.88            +4.8       32.67 ±  2%  perf-profile.calltrace.cycles-pp.secondary_startup_64_no_verify
     50.72            -5.9       44.85        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     47.99            -5.3       42.72        perf-profile.children.cycles-pp.do_syscall_64
     23.29            -2.9       20.36 ±  3%  perf-profile.children.cycles-pp.intel_idle_ibrs
     11.88 ±  2%      -2.6        9.30        perf-profile.children.cycles-pp.__xstat64
     20.64            -2.6       18.06        perf-profile.children.cycles-pp.do_sys_openat2
     19.30            -2.3       17.02 ±  2%  perf-profile.children.cycles-pp.do_filp_open
     19.16            -2.3       16.89 ±  2%  perf-profile.children.cycles-pp.path_openat
     19.14            -2.2       16.98        perf-profile.children.cycles-pp.creat64
     16.79            -1.8       15.03        perf-profile.children.cycles-pp.__x64_sys_creat
      6.56            -1.4        5.20 ±  2%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode
     14.35            -1.3       13.01        perf-profile.children.cycles-pp.open_last_lookups
      6.50 ±  2%      -1.3        5.17 ±  2%  perf-profile.children.cycles-pp.__do_sys_newstat
      6.16 ±  2%      -1.2        4.92 ±  2%  perf-profile.children.cycles-pp.vfs_fstatat
      5.72            -1.2        4.48        perf-profile.children.cycles-pp.__close
      5.58            -1.2        4.42 ±  2%  perf-profile.children.cycles-pp.open64
      4.88            -1.1        3.78 ±  2%  perf-profile.children.cycles-pp.syscall_return_via_sysret
     13.31            -1.1       12.26        perf-profile.children.cycles-pp.lookup_open
      4.89 ±  3%      -1.0        3.92 ±  3%  perf-profile.children.cycles-pp.vfs_statx
      4.47 ±  3%      -0.9        3.56 ±  3%  perf-profile.children.cycles-pp.filename_lookup
     12.45            -0.9       11.56        perf-profile.children.cycles-pp.xfs_generic_create
      4.04 ±  3%      -0.9        3.16 ±  2%  perf-profile.children.cycles-pp.read
      4.27 ±  3%      -0.9        3.40 ±  4%  perf-profile.children.cycles-pp.path_lookupat
      3.93 ±  2%      -0.8        3.09 ±  3%  perf-profile.children.cycles-pp.__x64_sys_openat
     11.85            -0.8       11.08        perf-profile.children.cycles-pp.xfs_create
      3.24 ±  2%      -0.6        2.60 ±  4%  perf-profile.children.cycles-pp.link_path_walk
      2.56            -0.6        2.01 ±  3%  perf-profile.children.cycles-pp.__entry_text_start
      2.75 ±  4%      -0.5        2.22 ±  4%  perf-profile.children.cycles-pp.walk_component
      2.22 ±  3%      -0.5        1.72 ±  3%  perf-profile.children.cycles-pp.getname_flags
      2.37 ±  6%      -0.5        1.88 ±  3%  perf-profile.children.cycles-pp.ksys_read
      2.79 ±  3%      -0.5        2.30 ±  4%  perf-profile.children.cycles-pp.stress_mwc32modn
      2.33 ±  2%      -0.5        1.86 ±  2%  perf-profile.children.cycles-pp.xfs_trans_alloc
      2.29 ±  6%      -0.5        1.82 ±  3%  perf-profile.children.cycles-pp.vfs_read
      2.06 ±  6%      -0.4        1.64 ±  4%  perf-profile.children.cycles-pp.seq_read
      2.02 ±  7%      -0.4        1.60 ±  3%  perf-profile.children.cycles-pp.seq_read_iter
      0.70 ± 20%      -0.4        0.28 ± 12%  perf-profile.children.cycles-pp.run_ksoftirqd
      2.35 ±  2%      -0.4        1.93 ±  2%  perf-profile.children.cycles-pp.kmem_cache_alloc
      1.95 ±  4%      -0.4        1.54 ±  4%  perf-profile.children.cycles-pp.lookup_fast
      2.08 ±  4%      -0.4        1.69 ±  4%  perf-profile.children.cycles-pp.exit_to_user_mode_loop
      1.56 ±  3%      -0.4        1.20 ±  5%  perf-profile.children.cycles-pp.strncpy_from_user
      1.93 ±  4%      -0.4        1.58 ±  4%  perf-profile.children.cycles-pp.task_work_run
      2.90 ±  2%      -0.3        2.55 ±  4%  perf-profile.children.cycles-pp.xfs_dialloc_ag
      0.72 ± 20%      -0.3        0.38 ±  7%  perf-profile.children.cycles-pp.smpboot_thread_fn
      2.22 ±  3%      -0.3        1.88 ±  3%  perf-profile.children.cycles-pp.exit_to_user_mode_prepare
      1.79 ±  2%      -0.3        1.45 ±  2%  perf-profile.children.cycles-pp.xfs_trans_reserve
      1.56            -0.3        1.22 ±  3%  perf-profile.children.cycles-pp.do_open
      1.63 ±  5%      -0.3        1.30 ±  4%  perf-profile.children.cycles-pp.__fput
      1.62 ±  3%      -0.3        1.32 ±  2%  perf-profile.children.cycles-pp.xfs_log_reserve
      1.29 ±  3%      -0.3        1.00 ±  3%  perf-profile.children.cycles-pp.do_dentry_open
      1.09 ±  3%      -0.3        0.80 ±  5%  perf-profile.children.cycles-pp.xfs_inobt_update
      1.36 ±  4%      -0.3        1.09 ±  5%  perf-profile.children.cycles-pp.alloc_empty_file
      1.36 ± 11%      -0.3        1.10 ±  3%  perf-profile.children.cycles-pp.__do_softirq
      0.98 ±  6%      -0.2        0.74 ±  5%  perf-profile.children.cycles-pp.dput
      0.97 ±  5%      -0.2        0.72 ±  8%  perf-profile.children.cycles-pp.__check_object_size
      1.18 ±  6%      -0.2        0.95 ±  3%  perf-profile.children.cycles-pp.__lookup_slow
      1.12 ±  7%      -0.2        0.88 ±  6%  perf-profile.children.cycles-pp.seq_show
      1.08 ± 11%      -0.2        0.86 ±  7%  perf-profile.children.cycles-pp.rcu_core
      1.14 ±  7%      -0.2        0.92 ±  7%  perf-profile.children.cycles-pp.__d_lookup_rcu
      1.04 ±  5%      -0.2        0.83 ±  4%  perf-profile.children.cycles-pp.kmem_cache_free
      1.04 ± 11%      -0.2        0.82 ±  8%  perf-profile.children.cycles-pp.rcu_do_batch
      0.86 ±  5%      -0.2        0.65 ±  4%  perf-profile.children.cycles-pp.xfs_trans_alloc_icreate
      1.25 ±  3%      -0.2        1.05        perf-profile.children.cycles-pp.xfs_difree_finobt
      1.10 ±  4%      -0.2        0.91 ±  4%  perf-profile.children.cycles-pp.xfs_trans_alloc_dir
      0.91 ±  7%      -0.2        0.74 ±  7%  perf-profile.children.cycles-pp.seq_printf
      1.04 ±  5%      -0.2        0.86 ±  7%  perf-profile.children.cycles-pp.inode_permission
      1.08 ±  3%      -0.2        0.91 ±  2%  perf-profile.children.cycles-pp.__kmem_cache_alloc_node
      0.71 ±  3%      -0.2        0.54 ±  8%  perf-profile.children.cycles-pp.__filename_parentat
      0.38 ±  8%      -0.2        0.21 ± 11%  perf-profile.children.cycles-pp.xfs_btree_update_keys
      0.72 ±  6%      -0.2        0.55 ±  9%  perf-profile.children.cycles-pp.init_file
      0.89 ±  7%      -0.2        0.72 ±  8%  perf-profile.children.cycles-pp.vsnprintf
      0.60 ±  7%      -0.2        0.44 ± 10%  perf-profile.children.cycles-pp.security_file_alloc
      0.92 ±  4%      -0.2        0.76 ±  4%  perf-profile.children.cycles-pp.d_alloc_parallel
      0.80 ±  5%      -0.2        0.64 ±  4%  perf-profile.children.cycles-pp.stress_filename
      1.57 ±  4%      -0.2        1.42 ±  5%  perf-profile.children.cycles-pp.xfs_init_new_inode
      0.74 ±  3%      -0.2        0.59 ±  6%  perf-profile.children.cycles-pp.xfs_dir_createname
      0.63 ±  3%      -0.2        0.48 ±  8%  perf-profile.children.cycles-pp.path_parentat
      0.64 ±  6%      -0.1        0.49 ±  7%  perf-profile.children.cycles-pp.xfs_inobt_init_cursor
      0.98 ±  3%      -0.1        0.84 ±  2%  perf-profile.children.cycles-pp.xfs_dialloc_ag_update_inobt
      0.67 ±  4%      -0.1        0.52 ±  8%  perf-profile.children.cycles-pp.memcg_slab_post_alloc_hook
      0.82 ±  4%      -0.1        0.68 ±  6%  perf-profile.children.cycles-pp.d_alloc
      0.74 ±  4%      -0.1        0.60 ±  3%  perf-profile.children.cycles-pp.xfs_dir_removename
      0.60 ±  6%      -0.1        0.46 ±  8%  perf-profile.children.cycles-pp.generic_permission
      0.66 ±  6%      -0.1        0.53 ±  6%  perf-profile.children.cycles-pp.xfs_trans_log_inode
      0.47 ±  7%      -0.1        0.34 ±  9%  perf-profile.children.cycles-pp.__kmalloc_node
      0.35 ±  8%      -0.1        0.22 ± 11%  perf-profile.children.cycles-pp.security_file_free
      0.57 ±  4%      -0.1        0.45 ±  3%  perf-profile.children.cycles-pp.down_read
      0.48 ±  4%      -0.1        0.35 ±  5%  perf-profile.children.cycles-pp.__legitimize_path
      0.47 ±  7%      -0.1        0.35 ±  5%  perf-profile.children.cycles-pp.evict
      1.90 ±  2%      -0.1        1.78 ±  2%  perf-profile.children.cycles-pp.xfs_btree_lookup_get_block
      1.09 ±  4%      -0.1        0.97 ±  4%  perf-profile.children.cycles-pp.xfs_inode_item_format
      0.42 ±  9%      -0.1        0.30 ± 11%  perf-profile.children.cycles-pp.mod_objcg_state
      0.54 ±  4%      -0.1        0.42 ± 10%  perf-profile.children.cycles-pp.check_heap_object
      0.55 ±  6%      -0.1        0.43 ±  9%  perf-profile.children.cycles-pp.single_release
      0.36 ±  5%      -0.1        0.25 ± 13%  perf-profile.children.cycles-pp.try_to_unlazy_next
      0.44 ±  8%      -0.1        0.32 ±  9%  perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.32 ±  8%      -0.1        0.20 ± 10%  perf-profile.children.cycles-pp.apparmor_file_free_security
      0.63 ±  7%      -0.1        0.51 ±  5%  perf-profile.children.cycles-pp.xlog_ticket_alloc
      0.41 ±  5%      -0.1        0.30 ±  7%  perf-profile.children.cycles-pp.single_open
      0.71 ±  5%      -0.1        0.60 ±  5%  perf-profile.children.cycles-pp.destroy_inode
      0.33 ±  5%      -0.1        0.22 ± 11%  perf-profile.children.cycles-pp.lockref_get_not_dead
      0.57 ± 10%      -0.1        0.46 ±  6%  perf-profile.children.cycles-pp.perf_event_task_tick
      0.72 ±  3%      -0.1        0.62 ±  6%  perf-profile.children.cycles-pp.__d_alloc
      0.24 ± 19%      -0.1        0.14 ± 20%  perf-profile.children.cycles-pp.mnt_want_write
      0.36 ±  6%      -0.1        0.26 ± 11%  perf-profile.children.cycles-pp.xfs_vn_lookup
      0.61 ±  7%      -0.1        0.50 ±  7%  perf-profile.children.cycles-pp.__cond_resched
      0.41 ± 11%      -0.1        0.31 ±  9%  perf-profile.children.cycles-pp.apparmor_file_alloc_security
      0.50 ±  7%      -0.1        0.40 ±  5%  perf-profile.children.cycles-pp.xlog_grant_add_space
      0.50 ± 10%      -0.1        0.41 ±  3%  perf-profile.children.cycles-pp.step_into
      0.59 ±  7%      -0.1        0.50 ±  4%  perf-profile.children.cycles-pp.xfs_inobt_init_common
      0.52 ±  2%      -0.1        0.42 ±  3%  perf-profile.children.cycles-pp.xfs_iget_recycle
      0.22 ±  5%      -0.1        0.12 ± 11%  perf-profile.children.cycles-pp.xfs_btree_get_leaf_keys
      0.41 ±  6%      -0.1        0.32 ±  7%  perf-profile.children.cycles-pp.__x64_sys_close
      0.62 ±  2%      -0.1        0.53 ±  6%  perf-profile.children.cycles-pp.xfs_btree_update
      0.41 ±  9%      -0.1        0.32 ± 10%  perf-profile.children.cycles-pp.get_obj_cgroup_from_current
      0.35 ±  5%      -0.1        0.27 ±  7%  perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.57 ±  5%      -0.1        0.49 ±  5%  perf-profile.children.cycles-pp.xfs_log_ticket_ungrant
      0.33 ±  4%      -0.1        0.25 ±  9%  perf-profile.children.cycles-pp.try_to_unlazy
      0.34 ± 12%      -0.1        0.25 ±  6%  perf-profile.children.cycles-pp.number
      0.36 ±  4%      -0.1        0.28 ±  5%  perf-profile.children.cycles-pp.security_file_open
      0.34 ±  5%      -0.1        0.25 ±  7%  perf-profile.children.cycles-pp.apparmor_file_open
      0.44 ±  6%      -0.1        0.36 ±  8%  perf-profile.children.cycles-pp.terminate_walk
      0.42 ±  6%      -0.1        0.34 ±  8%  perf-profile.children.cycles-pp.__kmem_cache_free
      0.10 ± 23%      -0.1        0.03 ±100%  perf-profile.children.cycles-pp.timer_delete
      0.34 ±  3%      -0.1        0.27 ± 13%  perf-profile.children.cycles-pp.__virt_addr_valid
      0.28 ± 12%      -0.1        0.21 ± 17%  perf-profile.children.cycles-pp.__check_heap_object
      0.26 ±  5%      -0.1        0.18 ± 11%  perf-profile.children.cycles-pp.fsnotify_destroy_marks
      0.84 ±  2%      -0.1        0.77 ±  5%  perf-profile.children.cycles-pp.xfs_iget
      0.20 ± 19%      -0.1        0.12 ± 20%  perf-profile.children.cycles-pp.inode_sb_list_add
      0.24 ±  7%      -0.1        0.16 ± 12%  perf-profile.children.cycles-pp.fsnotify_grab_connector
      0.22 ±  4%      -0.1        0.15 ±  9%  perf-profile.children.cycles-pp.complete_walk
      0.44 ±  7%      -0.1        0.38 ±  6%  perf-profile.children.cycles-pp.stress_mwc32
      0.33 ±  4%      -0.1        0.26 ±  8%  perf-profile.children.cycles-pp.xfs_dir2_sf_addname
      0.23 ± 11%      -0.1        0.16 ±  7%  perf-profile.children.cycles-pp.__legitimize_mnt
      0.42 ± 11%      -0.1        0.35 ±  7%  perf-profile.children.cycles-pp.xfs_inodegc_queue
      0.27 ±  6%      -0.1        0.20 ±  8%  perf-profile.children.cycles-pp.lockref_put_return
      0.25 ±  5%      -0.1        0.18 ± 12%  perf-profile.children.cycles-pp.xfs_lookup
      0.24 ±  7%      -0.1        0.18 ± 14%  perf-profile.children.cycles-pp.xfs_dir_lookup
      0.24 ±  9%      -0.1        0.18 ± 11%  perf-profile.children.cycles-pp.obj_cgroup_charge
      0.14 ± 18%      -0.1        0.08 ± 15%  perf-profile.children.cycles-pp.__mnt_want_write
      0.22 ± 10%      -0.1        0.16 ± 13%  perf-profile.children.cycles-pp.seq_open
      0.29 ±  8%      -0.1        0.24 ±  9%  perf-profile.children.cycles-pp.xfs_dir2_sf_removename
      0.31 ±  8%      -0.1        0.26 ±  4%  perf-profile.children.cycles-pp.kmem_alloc
      0.18 ± 11%      -0.1        0.13 ± 11%  perf-profile.children.cycles-pp.current_time
      0.20 ±  9%      -0.1        0.14 ± 14%  perf-profile.children.cycles-pp.__get_obj_cgroup_from_memcg
      0.17 ± 12%      -0.1        0.12 ± 12%  perf-profile.children.cycles-pp.iput
      0.18 ±  9%      -0.0        0.13 ±  6%  perf-profile.children.cycles-pp.inode_wait_for_writeback
      0.20 ± 10%      -0.0        0.16 ± 15%  perf-profile.children.cycles-pp.xfs_inode_item_size
      0.15 ± 15%      -0.0        0.10 ± 14%  perf-profile.children.cycles-pp.xfs_idata_realloc
      0.18 ±  9%      -0.0        0.13 ± 11%  perf-profile.children.cycles-pp.alloc_fd
      0.24 ±  5%      -0.0        0.19 ± 11%  perf-profile.children.cycles-pp.xfs_btree_log_recs
      0.12 ± 15%      -0.0        0.08 ± 20%  perf-profile.children.cycles-pp.common_perm_cond
      0.18 ± 11%      -0.0        0.14 ± 11%  perf-profile.children.cycles-pp.xfs_trans_ichgtime
      0.18 ± 12%      -0.0        0.13 ± 14%  perf-profile.children.cycles-pp.kmalloc_trace
      0.16 ± 13%      -0.0        0.12 ± 17%  perf-profile.children.cycles-pp.security_inode_getattr
      0.08 ± 11%      -0.0        0.04 ± 71%  perf-profile.children.cycles-pp.__d_add
      0.17 ± 12%      -0.0        0.13 ± 14%  perf-profile.children.cycles-pp.inode_init_always
      0.19 ±  5%      -0.0        0.14 ± 13%  perf-profile.children.cycles-pp.inode_maybe_inc_iversion
      0.30 ±  5%      -0.0        0.26 ±  3%  perf-profile.children.cycles-pp.memset_orig
      0.15 ±  8%      -0.0        0.11 ± 12%  perf-profile.children.cycles-pp.drop_nlink
      0.20 ±  8%      -0.0        0.16 ±  5%  perf-profile.children.cycles-pp.set_nlink
      0.18 ±  9%      -0.0        0.14 ± 10%  perf-profile.children.cycles-pp.get_random_u32
      0.34 ±  4%      -0.0        0.31 ±  4%  perf-profile.children.cycles-pp.kmem_cache_alloc_lru
      0.10 ±  4%      -0.0        0.07 ±  5%  perf-profile.children.cycles-pp.close_fd
      0.10 ± 10%      -0.0        0.06 ± 16%  perf-profile.children.cycles-pp.d_splice_alias
      0.12 ± 11%      -0.0        0.09 ±  7%  perf-profile.children.cycles-pp.security_path_unlink
      0.09 ±  9%      -0.0        0.06 ± 46%  perf-profile.children.cycles-pp.memcg_account_kmem
      0.22 ±  7%      -0.0        0.18 ±  8%  perf-profile.children.cycles-pp.up_write
      0.10 ± 19%      -0.0        0.07 ± 14%  perf-profile.children.cycles-pp.krealloc
      0.11 ± 12%      -0.0        0.08 ±  8%  perf-profile.children.cycles-pp.apparmor_path_unlink
      0.14 ±  8%      -0.0        0.12 ±  7%  perf-profile.children.cycles-pp.fput
      0.13 ± 10%      -0.0        0.11 ±  9%  perf-profile.children.cycles-pp.xfs_dir2_sf_addname_easy
      0.11 ±  9%      +0.0        0.14 ±  9%  perf-profile.children.cycles-pp.xfs_trans_buf_item_match
      0.23 ±  4%      +0.0        0.27 ±  8%  perf-profile.children.cycles-pp.__radix_tree_lookup
      0.06 ± 49%      +0.1        0.11 ± 18%  perf-profile.children.cycles-pp.update_rq_clock_task
      0.06 ± 11%      +0.1        0.12 ± 21%  perf-profile.children.cycles-pp.__queue_work
      0.00            +0.1        0.06 ± 16%  perf-profile.children.cycles-pp.restore_fpregs_from_fpstate
      0.00            +0.1        0.06 ± 16%  perf-profile.children.cycles-pp.__dequeue_entity
      0.00            +0.1        0.06 ± 13%  perf-profile.children.cycles-pp.select_task_rq_fair
      0.24 ± 17%      +0.1        0.30 ±  8%  perf-profile.children.cycles-pp.xfs_trans_dirty_buf
      0.00            +0.1        0.06 ± 16%  perf-profile.children.cycles-pp.sched_use_asym_prio
      0.08 ± 14%      +0.1        0.15 ± 16%  perf-profile.children.cycles-pp.xfs_defer_finish_noroll
      0.02 ±141%      +0.1        0.08 ± 19%  perf-profile.children.cycles-pp.__update_blocked_fair
      0.00            +0.1        0.06 ± 11%  perf-profile.children.cycles-pp.sysvec_call_function_single
      0.00            +0.1        0.06 ± 11%  perf-profile.children.cycles-pp.update_entity_lag
      0.08 ±  6%      +0.1        0.14 ± 24%  perf-profile.children.cycles-pp._raw_spin_lock_irq
      0.01 ±223%      +0.1        0.08 ±  6%  perf-profile.children.cycles-pp.__update_load_avg_se
      0.00            +0.1        0.07 ± 16%  perf-profile.children.cycles-pp.xfs_btree_dup_cursor
      0.01 ±223%      +0.1        0.08 ± 17%  perf-profile.children.cycles-pp._find_next_and_bit
      0.08 ±  8%      +0.1        0.15 ±  9%  perf-profile.children.cycles-pp.sched_clock_cpu
      0.03 ±100%      +0.1        0.10 ± 10%  perf-profile.children.cycles-pp.update_rq_clock
      0.08 ± 17%      +0.1        0.16 ± 12%  perf-profile.children.cycles-pp.native_sched_clock
      0.07 ± 11%      +0.1        0.14 ±  9%  perf-profile.children.cycles-pp.sched_clock
      0.00            +0.1        0.08 ± 14%  perf-profile.children.cycles-pp.xfs_trans_roll
      0.12 ±  8%      +0.1        0.19 ± 13%  perf-profile.children.cycles-pp.__list_del_entry_valid
      0.10 ± 30%      +0.1        0.18 ± 18%  perf-profile.children.cycles-pp.update_blocked_averages
      0.00            +0.1        0.08 ± 13%  perf-profile.children.cycles-pp.asm_sysvec_call_function_single
      0.03 ±100%      +0.1        0.11 ± 20%  perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
      0.00            +0.1        0.08 ± 14%  perf-profile.children.cycles-pp.switch_fpu_return
      0.00            +0.1        0.08 ±  8%  perf-profile.children.cycles-pp.select_task_rq
      0.04 ± 70%      +0.1        0.14 ± 11%  perf-profile.children.cycles-pp.cpu_util
      0.01 ±223%      +0.1        0.10 ±  9%  perf-profile.children.cycles-pp.__switch_to
      0.00            +0.1        0.10 ± 15%  perf-profile.children.cycles-pp.llist_add_batch
      0.04 ± 73%      +0.1        0.14 ± 14%  perf-profile.children.cycles-pp.update_curr
      0.00            +0.1        0.10 ± 10%  perf-profile.children.cycles-pp.___perf_sw_event
      0.30 ± 11%      +0.1        0.41 ±  8%  perf-profile.children.cycles-pp.menu_select
      0.00            +0.1        0.11 ± 19%  perf-profile.children.cycles-pp.xlog_write
      0.00            +0.1        0.11 ±  9%  perf-profile.children.cycles-pp.xfs_iunlink_lookup
      0.00            +0.1        0.11 ± 12%  perf-profile.children.cycles-pp.__smp_call_single_queue
      0.22 ± 12%      +0.1        0.33 ±  5%  perf-profile.children.cycles-pp.xfs_iunlink_remove
      0.00            +0.1        0.12 ± 13%  perf-profile.children.cycles-pp.xfs_ialloc_inode_init
      0.04 ± 72%      +0.1        0.16 ± 13%  perf-profile.children.cycles-pp.set_next_entity
      0.00            +0.1        0.12 ± 11%  perf-profile.children.cycles-pp.xfs_iunlink_log_inode
      0.06 ± 48%      +0.1        0.18 ± 15%  perf-profile.children.cycles-pp.idle_cpu
      0.00            +0.1        0.12 ±  6%  perf-profile.children.cycles-pp.finish_task_switch
      0.01 ±223%      +0.1        0.13 ±  6%  perf-profile.children.cycles-pp.prepare_task_switch
      0.09 ± 10%      +0.1        0.23 ±  6%  perf-profile.children.cycles-pp.xfs_buf_item_init
      0.00            +0.1        0.14 ± 12%  perf-profile.children.cycles-pp.crc_pcl
      0.02 ±142%      +0.1        0.16 ± 13%  perf-profile.children.cycles-pp.__switch_to_asm
      0.00            +0.2        0.16 ± 14%  perf-profile.children.cycles-pp.xfs_trans_committed_bulk
      0.00            +0.2        0.16 ±  9%  perf-profile.children.cycles-pp.ttwu_queue_wakelist
      0.70 ±  6%      +0.2        0.87 ±  3%  perf-profile.children.cycles-pp.__irq_exit_rcu
      0.10 ± 19%      +0.2        0.29 ±  4%  perf-profile.children.cycles-pp.update_load_avg
      0.16 ±  7%      +0.2        0.38 ±  6%  perf-profile.children.cycles-pp.xfs_buf_offset
      0.10 ± 27%      +0.2        0.33 ±  4%  perf-profile.children.cycles-pp.enqueue_entity
      0.00            +0.2        0.24 ± 10%  perf-profile.children.cycles-pp.xfs_ialloc_ag_alloc
      0.00            +0.2        0.24 ± 14%  perf-profile.children.cycles-pp.xlog_cil_process_committed
      0.00            +0.2        0.24 ± 14%  perf-profile.children.cycles-pp.xlog_cil_committed
      0.97 ±  9%      +0.2        1.22 ±  6%  perf-profile.children.cycles-pp.clock_nanosleep
      0.00            +0.3        0.25 ± 14%  perf-profile.children.cycles-pp.xlog_state_do_callback
      0.00            +0.3        0.25 ± 14%  perf-profile.children.cycles-pp.xlog_state_do_iclog_callbacks
      0.00            +0.3        0.26 ± 10%  perf-profile.children.cycles-pp.xlog_cil_push_work
      0.00            +0.3        0.26 ±  8%  perf-profile.children.cycles-pp.crc32c_pcl_intel_update
      0.00            +0.3        0.26 ± 14%  perf-profile.children.cycles-pp.xlog_ioend_work
      0.16 ± 17%      +0.3        0.42 ±  7%  perf-profile.children.cycles-pp.xfs_next_bit
      0.09 ±  8%      +0.3        0.36 ±  4%  perf-profile.children.cycles-pp.dequeue_entity
      0.12 ± 27%      +0.3        0.40 ±  5%  perf-profile.children.cycles-pp.enqueue_task_fair
      0.46 ±  4%      +0.3        0.73 ±  4%  perf-profile.children.cycles-pp.xlog_prepare_iovec
      0.68 ±  9%      +0.3        0.96 ±  6%  perf-profile.children.cycles-pp.do_nanosleep
      3.48 ±  2%      +0.3        3.75 ±  2%  perf-profile.children.cycles-pp.xfs_dialloc
      0.70 ±  9%      +0.3        0.98 ±  5%  perf-profile.children.cycles-pp.common_nsleep
      0.70 ±  9%      +0.3        0.97 ±  5%  perf-profile.children.cycles-pp.hrtimer_nanosleep
      0.72 ±  9%      +0.3        1.00 ±  5%  perf-profile.children.cycles-pp.__x64_sys_clock_nanosleep
      0.42 ±  3%      +0.3        0.70 ±  2%  perf-profile.children.cycles-pp._xfs_trans_bjoin
      0.13 ± 30%      +0.3        0.42 ±  4%  perf-profile.children.cycles-pp.activate_task
      0.00            +0.3        0.30 ± 11%  perf-profile.children.cycles-pp.sched_ttwu_pending
      0.00            +0.3        0.31 ± 12%  perf-profile.children.cycles-pp.xfs_dinode_calc_crc
      0.14 ± 21%      +0.3        0.46 ±  6%  perf-profile.children.cycles-pp.ttwu_do_activate
      0.10 ± 11%      +0.3        0.42 ±  5%  perf-profile.children.cycles-pp.dequeue_task_fair
      0.00            +0.3        0.32 ± 10%  perf-profile.children.cycles-pp.crc32c
      0.11 ± 17%      +0.3        0.46 ±  8%  perf-profile.children.cycles-pp.schedule_idle
      0.12 ±  9%      +0.4        0.49 ±  5%  perf-profile.children.cycles-pp.xfs_contig_bits
      0.00            +0.4        0.40 ± 10%  perf-profile.children.cycles-pp.flush_smp_call_function_queue
      0.00            +0.4        0.40 ± 10%  perf-profile.children.cycles-pp.__flush_smp_call_function_queue
      0.00            +0.4        0.40 ±  6%  perf-profile.children.cycles-pp.xfs_imap_to_bp
     10.09            +0.4       10.50        perf-profile.children.cycles-pp.__x64_sys_unlink
      9.73            +0.5       10.19        perf-profile.children.cycles-pp.do_unlinkat
      0.79 ±  5%      +0.5        1.30 ±  4%  perf-profile.children.cycles-pp.xfs_buf_item_size
      0.64 ±  9%      +0.5        1.16 ±  2%  perf-profile.children.cycles-pp.xfs_buf_item_release
      0.20 ± 18%      +0.5        0.73 ±  3%  perf-profile.children.cycles-pp.try_to_wake_up
      0.27 ± 10%      +0.5        0.81 ±  3%  perf-profile.children.cycles-pp.up
      0.59 ±  8%      +0.5        1.14 ±  4%  perf-profile.children.cycles-pp.xfs_iunlink
      0.33 ± 13%      +0.5        0.87        perf-profile.children.cycles-pp.xfs_buf_unlock
      2.41 ±  2%      +0.6        2.97 ±  3%  perf-profile.children.cycles-pp.xfs_trans_run_precommits
      0.50 ±  9%      +0.6        1.06 ±  3%  perf-profile.children.cycles-pp.xfs_buf_item_size_segment
      0.40 ± 16%      +0.7        1.06 ±  5%  perf-profile.children.cycles-pp.update_sg_lb_stats
      0.00            +0.7        0.68 ±  5%  perf-profile.children.cycles-pp.xfs_iunlink_log_dinode
      3.09 ±  2%      +0.7        3.83        perf-profile.children.cycles-pp.xfs_difree
      1.32 ±  5%      +0.7        2.06 ±  4%  perf-profile.children.cycles-pp.xlog_cil_alloc_shadow_bufs
      0.46 ± 17%      +0.8        1.22 ±  5%  perf-profile.children.cycles-pp.update_sd_lb_stats
      0.00            +0.8        0.76 ±  6%  perf-profile.children.cycles-pp.xfs_iunlink_item_precommit
      0.47 ± 16%      +0.8        1.24 ±  5%  perf-profile.children.cycles-pp.find_busiest_group
      0.43 ±  8%      +0.8        1.21 ±  5%  perf-profile.children.cycles-pp.memcpy_orig
      3.55 ±  3%      +0.9        4.46        perf-profile.children.cycles-pp.xfs_ifree
      0.10 ±  9%      +0.9        1.02 ±  7%  perf-profile.children.cycles-pp.poll_idle
      0.55 ± 14%      +1.0        1.50 ±  4%  perf-profile.children.cycles-pp.load_balance
      3.03 ±  7%      +1.0        4.06        perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      6.99            +1.1        8.08        perf-profile.children.cycles-pp.vfs_unlink
      0.48 ± 10%      +1.1        1.62 ±  5%  perf-profile.children.cycles-pp.newidle_balance
      6.38            +1.2        7.59        perf-profile.children.cycles-pp.xfs_vn_unlink
      6.34            +1.2        7.56        perf-profile.children.cycles-pp.xfs_remove
      0.59 ±  9%      +1.3        1.86 ±  5%  perf-profile.children.cycles-pp.pick_next_task_fair
      0.93 ±  4%      +1.3        2.24        perf-profile.children.cycles-pp.xfs_ialloc_read_agi
      3.87 ±  2%      +1.5        5.36 ±  2%  perf-profile.children.cycles-pp.xlog_cil_insert_items
      0.01 ±223%      +1.6        1.58 ±  2%  perf-profile.children.cycles-pp.schedule_timeout
      0.24 ± 10%      +1.6        1.85 ±  3%  perf-profile.children.cycles-pp.down
      3.20 ±  3%      +1.6        4.82 ±  2%  perf-profile.children.cycles-pp.xlog_cil_insert_format_items
      0.31 ±  7%      +1.6        1.94 ±  2%  perf-profile.children.cycles-pp.xfs_buf_lock
      0.00            +1.6        1.64        perf-profile.children.cycles-pp.___down_common
      0.00            +1.7        1.65        perf-profile.children.cycles-pp.__down
      0.41 ±  4%      +1.7        2.08 ±  3%  perf-profile.children.cycles-pp.xfs_buf_find_lock
      1.58 ±  3%      +1.7        3.27 ±  3%  perf-profile.children.cycles-pp.xfs_buf_item_format
      1.33 ±  2%      +1.7        3.05 ±  3%  perf-profile.children.cycles-pp.xfs_buf_item_format_segment
      1.36 ±  4%      +1.7        3.11        perf-profile.children.cycles-pp.xfs_read_agi
      0.85 ±  3%      +1.8        2.69 ±  2%  perf-profile.children.cycles-pp.xfs_buf_lookup
      1.81 ±  3%      +1.8        3.66 ±  2%  perf-profile.children.cycles-pp.xfs_buf_read_map
      0.72 ±  8%      +1.9        2.62 ±  2%  perf-profile.children.cycles-pp.schedule
      1.62 ±  2%      +1.9        3.54 ±  2%  perf-profile.children.cycles-pp.xfs_buf_get_map
      2.60 ±  3%      +2.1        4.72        perf-profile.children.cycles-pp.xfs_trans_read_buf_map
      0.88 ±  9%      +2.2        3.04 ±  2%  perf-profile.children.cycles-pp.__schedule
      8.45 ±  3%      +2.4       10.83        perf-profile.children.cycles-pp.xlog_cil_commit
      0.48 ± 14%      +2.9        3.37 ±  6%  perf-profile.children.cycles-pp.intel_idle_irq
     11.49            +2.9       14.38        perf-profile.children.cycles-pp.__xfs_trans_commit
      7.79            +3.0       10.78        perf-profile.children.cycles-pp.xfs_inactive_ifree
      7.84            +3.0       10.84        perf-profile.children.cycles-pp.xfs_inactive
      0.93 ± 15%      +3.0        3.93 ±  9%  perf-profile.children.cycles-pp.intel_idle
      8.05 ±  2%      +3.1       11.11        perf-profile.children.cycles-pp.xfs_inodegc_worker
      8.90 ±  2%      +3.3       12.20        perf-profile.children.cycles-pp.ret_from_fork
      8.90 ±  2%      +3.3       12.20        perf-profile.children.cycles-pp.ret_from_fork_asm
      8.90 ±  2%      +3.3       12.20        perf-profile.children.cycles-pp.kthread
      8.07 ±  2%      +3.6       11.65        perf-profile.children.cycles-pp.process_one_work
      8.15            +3.6       11.79        perf-profile.children.cycles-pp.worker_thread
     27.29            +3.7       30.97 ±  3%  perf-profile.children.cycles-pp.cpuidle_enter_state
     27.30            +3.7       30.98 ±  3%  perf-profile.children.cycles-pp.cpuidle_enter
     27.69            +3.9       31.57 ±  2%  perf-profile.children.cycles-pp.cpuidle_idle_call
     27.44            +4.8       32.21 ±  3%  perf-profile.children.cycles-pp.start_secondary
     27.88            +4.8       32.66 ±  2%  perf-profile.children.cycles-pp.do_idle
     27.88            +4.8       32.67 ±  2%  perf-profile.children.cycles-pp.secondary_startup_64_no_verify
     27.88            +4.8       32.67 ±  2%  perf-profile.children.cycles-pp.cpu_startup_entry
     23.28            -2.9       20.36 ±  3%  perf-profile.self.cycles-pp.intel_idle_ibrs
      4.87            -1.1        3.77 ±  2%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      4.30            -1.0        3.30 ±  2%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      2.79 ±  3%      -0.6        2.17 ±  2%  perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      2.25            -0.5        1.77 ±  4%  perf-profile.self.cycles-pp.__entry_text_start
      2.62 ±  3%      -0.5        2.16 ±  4%  perf-profile.self.cycles-pp.stress_mwc32modn
      1.39 ±  4%      -0.3        1.12 ±  4%  perf-profile.self.cycles-pp.link_path_walk
      1.12 ±  7%      -0.2        0.90 ±  7%  perf-profile.self.cycles-pp.__d_lookup_rcu
      1.23 ±  2%      -0.2        1.03 ±  4%  perf-profile.self.cycles-pp.kmem_cache_alloc
      0.74 ±  3%      -0.2        0.58 ±  5%  perf-profile.self.cycles-pp.strncpy_from_user
      0.80 ±  4%      -0.1        0.66 ±  5%  perf-profile.self.cycles-pp.kmem_cache_free
      0.77 ±  5%      -0.1        0.62 ±  4%  perf-profile.self.cycles-pp.stress_filename
      0.68 ±  6%      -0.1        0.54 ±  6%  perf-profile.self.cycles-pp.xlog_cil_insert_items
      0.52 ±  6%      -0.1        0.40 ±  7%  perf-profile.self.cycles-pp.generic_permission
      0.51 ±  3%      -0.1        0.39 ±  4%  perf-profile.self.cycles-pp.down_read
      0.32 ±  9%      -0.1        0.20 ± 10%  perf-profile.self.cycles-pp.apparmor_file_free_security
      0.33 ±  5%      -0.1        0.22 ± 11%  perf-profile.self.cycles-pp.lockref_get_not_dead
      0.37 ±  9%      -0.1        0.26 ± 11%  perf-profile.self.cycles-pp.mod_objcg_state
      0.40 ±  9%      -0.1        0.29 ± 10%  perf-profile.self.cycles-pp.apparmor_file_alloc_security
      0.49 ±  7%      -0.1        0.40 ±  4%  perf-profile.self.cycles-pp.xlog_grant_add_space
      0.44 ±  4%      -0.1        0.35 ±  9%  perf-profile.self.cycles-pp.xfs_inode_item_precommit
      0.33 ±  5%      -0.1        0.25 ±  6%  perf-profile.self.cycles-pp.apparmor_file_open
      0.44 ±  2%      -0.1        0.36 ± 12%  perf-profile.self.cycles-pp.memcg_slab_post_alloc_hook
      0.54 ±  5%      -0.1        0.46 ±  5%  perf-profile.self.cycles-pp.xfs_log_ticket_ungrant
      0.28 ± 12%      -0.1        0.21 ± 16%  perf-profile.self.cycles-pp.__check_heap_object
      0.31 ±  4%      -0.1        0.24 ±  7%  perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.16 ± 13%      -0.1        0.09 ± 17%  perf-profile.self.cycles-pp.xfs_btree_update_keys
      0.28 ± 13%      -0.1        0.20 ±  6%  perf-profile.self.cycles-pp.number
      0.30 ± 10%      -0.1        0.22 ± 11%  perf-profile.self.cycles-pp.xfs_trans_log_inode
      0.32 ±  3%      -0.1        0.25 ± 12%  perf-profile.self.cycles-pp.__virt_addr_valid
      0.22 ± 10%      -0.1        0.16 ±  9%  perf-profile.self.cycles-pp.__legitimize_mnt
      0.32 ±  9%      -0.1        0.25 ±  9%  perf-profile.self.cycles-pp.perf_adjust_freq_unthr_context
      0.12 ± 19%      -0.1        0.06 ± 53%  perf-profile.self.cycles-pp.mnt_want_write
      0.27 ±  5%      -0.1        0.20 ±  8%  perf-profile.self.cycles-pp.lockref_put_return
      0.17 ± 11%      -0.1        0.11 ± 11%  perf-profile.self.cycles-pp.xfs_generic_create
      0.22 ± 14%      -0.1        0.16 ± 20%  perf-profile.self.cycles-pp.__list_add_valid
      0.20 ± 14%      -0.1        0.14 ± 12%  perf-profile.self.cycles-pp.__xfs_trans_commit
      0.14 ± 16%      -0.1        0.08 ± 15%  perf-profile.self.cycles-pp.__mnt_want_write
      0.35 ±  8%      -0.1        0.30 ±  6%  perf-profile.self.cycles-pp.stress_mwc32
      0.20 ±  9%      -0.1        0.14 ± 14%  perf-profile.self.cycles-pp.__get_obj_cgroup_from_memcg
      0.15 ± 19%      -0.1        0.09 ± 17%  perf-profile.self.cycles-pp.__check_object_size
      0.16 ± 14%      -0.1        0.10 ± 19%  perf-profile.self.cycles-pp.current_time
      0.24 ± 11%      -0.1        0.18 ±  7%  perf-profile.self.cycles-pp.step_into
      0.21 ±  4%      -0.1        0.16 ±  4%  perf-profile.self.cycles-pp.xfs_inode_item_format
      0.16 ± 15%      -0.0        0.11 ± 15%  perf-profile.self.cycles-pp.__do_sys_newstat
      0.25 ±  7%      -0.0        0.20 ± 13%  perf-profile.self.cycles-pp.xfs_trans_del_item
      0.18 ± 11%      -0.0        0.14 ± 12%  perf-profile.self.cycles-pp.xfs_inode_item_size
      0.16 ± 13%      -0.0        0.12 ± 13%  perf-profile.self.cycles-pp.dput
      0.17 ± 13%      -0.0        0.13 ± 14%  perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.22 ± 12%      -0.0        0.18 ± 11%  perf-profile.self.cycles-pp.xlog_cil_commit
      0.12 ± 14%      -0.0        0.08 ± 23%  perf-profile.self.cycles-pp.common_perm_cond
      0.18 ±  4%      -0.0        0.14 ± 13%  perf-profile.self.cycles-pp.inode_maybe_inc_iversion
      0.11 ±  7%      -0.0        0.07 ± 21%  perf-profile.self.cycles-pp.xfs_btree_get_leaf_keys
      0.22 ±  7%      -0.0        0.18 ± 11%  perf-profile.self.cycles-pp.xfs_trans_run_precommits
      0.20 ±  8%      -0.0        0.16 ±  5%  perf-profile.self.cycles-pp.set_nlink
      0.28 ±  5%      -0.0        0.24 ±  6%  perf-profile.self.cycles-pp.memset_orig
      0.13 ± 17%      -0.0        0.09 ± 13%  perf-profile.self.cycles-pp.lookup_fast
      0.21 ±  6%      -0.0        0.18 ±  9%  perf-profile.self.cycles-pp.up_write
      0.09 ± 14%      -0.0        0.06 ± 46%  perf-profile.self.cycles-pp.do_open
      0.15 ±  9%      -0.0        0.11 ± 13%  perf-profile.self.cycles-pp.drop_nlink
      0.17 ±  7%      -0.0        0.14 ± 14%  perf-profile.self.cycles-pp.xfs_btree_lookup_get_block
      0.10 ± 14%      -0.0        0.07 ± 14%  perf-profile.self.cycles-pp.seq_show
      0.09 ± 19%      -0.0        0.06 ± 17%  perf-profile.self.cycles-pp.xfs_dir_removename
      0.11 ± 12%      -0.0        0.08 ±  6%  perf-profile.self.cycles-pp.apparmor_path_unlink
      0.10 ± 13%      -0.0        0.08 ± 19%  perf-profile.self.cycles-pp.xfs_trans_log_buf
      0.08 ± 11%      -0.0        0.06 ±  8%  perf-profile.self.cycles-pp.exit_to_user_mode_loop
      0.14 ± 10%      -0.0        0.12 ± 10%  perf-profile.self.cycles-pp.__call_rcu_common
      0.11 ±  6%      -0.0        0.08 ± 19%  perf-profile.self.cycles-pp.xfs_inode_item_format_data_fork
      0.15 ±  6%      -0.0        0.12 ± 12%  perf-profile.self.cycles-pp.security_inode_permission
      0.08 ± 13%      -0.0        0.06 ± 13%  perf-profile.self.cycles-pp.xfs_inode_item_release
      0.22 ±  3%      +0.0        0.26 ±  7%  perf-profile.self.cycles-pp.__radix_tree_lookup
      0.00            +0.1        0.06 ±  8%  perf-profile.self.cycles-pp.xfs_iget_cache_hit
      0.00            +0.1        0.06 ± 16%  perf-profile.self.cycles-pp.restore_fpregs_from_fpstate
      0.00            +0.1        0.06 ± 18%  perf-profile.self.cycles-pp.dequeue_entity
      0.38 ±  6%      +0.1        0.44 ±  3%  perf-profile.self.cycles-pp.xlog_cil_insert_format_items
      0.23 ± 16%      +0.1        0.29 ±  7%  perf-profile.self.cycles-pp.xfs_trans_dirty_buf
      0.00            +0.1        0.06 ± 13%  perf-profile.self.cycles-pp.update_entity_lag
      0.06 ± 11%      +0.1        0.13 ± 25%  perf-profile.self.cycles-pp._raw_spin_lock_irq
      0.01 ±223%      +0.1        0.07 ± 18%  perf-profile.self.cycles-pp._find_next_and_bit
      0.00            +0.1        0.06 ±  7%  perf-profile.self.cycles-pp.enqueue_task_fair
      0.01 ±223%      +0.1        0.07 ± 10%  perf-profile.self.cycles-pp.__update_load_avg_se
      0.00            +0.1        0.07 ± 11%  perf-profile.self.cycles-pp.do_idle
      0.00            +0.1        0.07 ± 17%  perf-profile.self.cycles-pp.try_to_wake_up
      0.00            +0.1        0.07 ± 15%  perf-profile.self.cycles-pp.update_curr
      0.00            +0.1        0.07 ± 19%  perf-profile.self.cycles-pp.load_balance
      0.10 ±  6%      +0.1        0.17 ± 12%  perf-profile.self.cycles-pp.__list_del_entry_valid
      0.21 ±  6%      +0.1        0.28 ± 12%  perf-profile.self.cycles-pp.xfs_perag_get
      0.00            +0.1        0.07 ± 18%  perf-profile.self.cycles-pp.pick_next_task_fair
      0.00            +0.1        0.07 ± 17%  perf-profile.self.cycles-pp.update_rq_clock_task
      0.00            +0.1        0.08 ± 20%  perf-profile.self.cycles-pp.newidle_balance
      0.08 ± 22%      +0.1        0.16 ± 12%  perf-profile.self.cycles-pp.native_sched_clock
      0.01 ±223%      +0.1        0.09 ±  6%  perf-profile.self.cycles-pp.enqueue_entity
      0.03 ±100%      +0.1        0.11 ± 20%  perf-profile.self.cycles-pp.__update_load_avg_cfs_rq
      0.04 ± 71%      +0.1        0.13 ± 11%  perf-profile.self.cycles-pp.cpu_util
      0.00            +0.1        0.10 ±  9%  perf-profile.self.cycles-pp.___perf_sw_event
      0.00            +0.1        0.10 ±  8%  perf-profile.self.cycles-pp.__switch_to
      0.00            +0.1        0.10 ± 14%  perf-profile.self.cycles-pp.llist_add_batch
      0.13 ± 14%      +0.1        0.24 ±  9%  perf-profile.self.cycles-pp.menu_select
      0.01 ±223%      +0.1        0.12 ± 14%  perf-profile.self.cycles-pp.update_load_avg
      0.01 ±223%      +0.1        0.13 ± 14%  perf-profile.self.cycles-pp.update_sd_lb_stats
      0.05 ± 50%      +0.1        0.17 ± 13%  perf-profile.self.cycles-pp.idle_cpu
      0.09 ± 14%      +0.1        0.22 ±  7%  perf-profile.self.cycles-pp.xfs_buf_item_init
      0.33 ±  7%      +0.1        0.47 ±  8%  perf-profile.self.cycles-pp.xlog_cil_alloc_shadow_bufs
      0.00            +0.1        0.14 ± 12%  perf-profile.self.cycles-pp.crc_pcl
      0.02 ±142%      +0.1        0.16 ± 13%  perf-profile.self.cycles-pp.__switch_to_asm
      0.25 ±  5%      +0.1        0.39 ±  3%  perf-profile.self.cycles-pp._xfs_trans_bjoin
      0.03 ±100%      +0.1        0.17 ± 11%  perf-profile.self.cycles-pp.__schedule
      0.37 ±  7%      +0.2        0.54 ±  4%  perf-profile.self.cycles-pp.xfs_buf_lookup
      0.14 ± 10%      +0.2        0.31 ±  7%  perf-profile.self.cycles-pp.xfs_buf_offset
      0.31 ± 10%      +0.2        0.53 ±  4%  perf-profile.self.cycles-pp.xfs_buf_item_size_segment
      0.16 ± 16%      +0.2        0.40 ±  7%  perf-profile.self.cycles-pp.xfs_next_bit
      0.44 ±  4%      +0.3        0.70 ±  4%  perf-profile.self.cycles-pp.xlog_prepare_iovec
      0.58 ±  3%      +0.3        0.89 ±  5%  perf-profile.self.cycles-pp.xfs_buf_item_format_segment
      0.10 ± 10%      +0.3        0.44 ±  4%  perf-profile.self.cycles-pp.xfs_contig_bits
      0.27 ± 19%      +0.4        0.68 ±  4%  perf-profile.self.cycles-pp.update_sg_lb_stats
      0.42 ±  8%      +0.8        1.18 ±  5%  perf-profile.self.cycles-pp.memcpy_orig
      0.10 ±  9%      +0.9        1.00 ±  7%  perf-profile.self.cycles-pp.poll_idle
      0.38 ± 19%      +2.7        3.07 ±  7%  perf-profile.self.cycles-pp.intel_idle_irq
      0.93 ± 15%      +3.0        3.93 ±  9%  perf-profile.self.cycles-pp.intel_idle



***************************************************************************************************
lkp-icl-2sp8: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory
=========================================================================================
class/compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  pipe/gcc-12/performance/x86_64-rhel-8.3/100%/debian-11.1-x86_64-20220510.cgz/lkp-icl-2sp8/fifo/stress-ng/60s

commit: 
  e0c2ff903c ("sched/fair: Remove sched_feat(START_DEBIT)")
  86bfbb7ce4 ("sched/fair: Add lag based placement")

e0c2ff903c320d3f 86bfbb7ce4f67a88df263919816 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 3.097e+08 ± 10%     -23.7%  2.364e+08        cpuidle..time
  11160799 ± 18%     -96.9%     350717 ±  7%  cpuidle..usage
    154658 ± 26%   +1601.5%    2631521 ±  3%  numa-numastat.node0.local_node
    189195 ± 12%   +1306.6%    2661245 ±  2%  numa-numastat.node0.numa_hit
      6.82 ± 13%      -1.6        5.18 ±  2%  mpstat.cpu.all.idle%
      0.93 ±  3%      -0.2        0.76        mpstat.cpu.all.irq%
      0.02 ±  8%      -0.0        0.01 ± 14%  mpstat.cpu.all.soft%
      7.85 ±  2%      +4.0       11.88        mpstat.cpu.all.usr%
   9186814 ± 22%     -64.0%    3309811        vmstat.memory.cache
    180.67           +50.2%     271.33        vmstat.procs.r
  30700079 ±  3%     -98.8%     361019 ± 37%  vmstat.system.cs
    294933 ± 12%     -47.1%     156093 ± 11%  vmstat.system.in
    262.67 ± 38%     -97.1%       7.50 ± 20%  perf-c2c.DRAM.local
    980.17 ± 26%     +91.1%       1872 ± 23%  perf-c2c.DRAM.remote
      1231 ± 25%    +337.6%       5386 ± 14%  perf-c2c.HITM.local
    647.83 ± 21%    +181.8%       1825 ± 24%  perf-c2c.HITM.remote
      1878 ± 12%    +283.8%       7211 ±  9%  perf-c2c.HITM.total
  11070661 ± 19%     -97.2%     305082 ± 10%  turbostat.C1
      7.22 ± 10%      -2.1        5.15 ±  3%  turbostat.C1%
      6.62 ± 11%     -23.0%       5.10 ±  3%  turbostat.CPU%c1
  19381905 ± 12%     -47.9%   10097899 ± 11%  turbostat.IRQ
     66365 ± 82%     -88.1%       7920 ± 79%  turbostat.POLL
     66.75            -2.1%      65.32        turbostat.RAMWatt
    112683          +539.5%     720609 ±  7%  stress-ng.fifo.fifo_8_byte_writes_per_sec
 4.363e+08 ±  2%    +563.7%  2.896e+09        stress-ng.fifo.ops
   7271628 ±  2%    +563.7%   48260297        stress-ng.fifo.ops_per_sec
 4.019e+08 ±  2%     -97.5%   10148243 ± 42%  stress-ng.time.involuntary_context_switches
      5966            +2.5%       6113        stress-ng.time.percent_of_cpu_this_job_got
      3434            -3.1%       3329        stress-ng.time.system_time
    269.37           +73.2%     466.45        stress-ng.time.user_time
 1.606e+09 ±  2%     -99.2%   13015792 ± 34%  stress-ng.time.voluntary_context_switches
     11488 ± 43%   +2150.1%     258513 ± 24%  numa-meminfo.node0.Active
     11427 ± 43%   +2161.5%     258431 ± 24%  numa-meminfo.node0.Active(anon)
    117521 ± 22%     -64.4%      41814 ± 30%  numa-meminfo.node0.Mapped
     16858 ± 33%   +1663.0%     297219 ± 24%  numa-meminfo.node0.Shmem
    349423 ± 11%     -22.9%     269301 ± 11%  numa-meminfo.node1.AnonPages.max
   7616174 ± 24%     -68.9%    2365987 ± 39%  numa-meminfo.node1.FilePages
   6269579 ± 37%     -96.5%     220579 ± 14%  numa-meminfo.node1.Inactive
   6269480 ± 37%     -96.5%     220506 ± 14%  numa-meminfo.node1.Inactive(anon)
   1829491 ± 26%     -97.0%      55327 ± 20%  numa-meminfo.node1.Mapped
   8518554 ± 22%     -63.4%    3119281 ± 31%  numa-meminfo.node1.MemUsed
   6262202 ± 32%     -97.3%     171468 ± 33%  numa-meminfo.node1.Shmem
      2861 ± 43%   +2056.2%      61688 ± 26%  numa-vmstat.node0.nr_active_anon
     29394 ± 22%     -62.2%      11107 ± 30%  numa-vmstat.node0.nr_mapped
      4218 ± 33%   +1601.4%      71776 ± 27%  numa-vmstat.node0.nr_shmem
      2861 ± 43%   +2056.2%      61688 ± 26%  numa-vmstat.node0.nr_zone_active_anon
    189071 ± 13%   +1308.1%    2662251 ±  2%  numa-vmstat.node0.numa_hit
    154534 ± 27%   +1603.5%    2632525 ±  3%  numa-vmstat.node0.numa_local
   1904315 ± 24%     -69.1%     588601 ± 40%  numa-vmstat.node1.nr_file_pages
   1567595 ± 37%     -96.5%      55001 ± 13%  numa-vmstat.node1.nr_inactive_anon
    457643 ± 26%     -96.9%      13983 ± 23%  numa-vmstat.node1.nr_mapped
   1565821 ± 32%     -97.4%      39972 ± 23%  numa-vmstat.node1.nr_shmem
   1567593 ± 37%     -96.5%      55002 ± 13%  numa-vmstat.node1.nr_zone_inactive_anon
    449588 ±  3%     -19.0%     364369        meminfo.AnonPages
   9019940 ± 22%     -64.6%    3189281        meminfo.Cached
   9951485 ± 20%     -59.2%    4061569        meminfo.Committed_AS
   6457544 ± 36%     -93.4%     427174 ±  3%  meminfo.Inactive
   6457341 ± 36%     -93.4%     426959 ±  3%  meminfo.Inactive(anon)
    119820 ±  3%     -11.2%     106362        meminfo.KReclaimable
   1945165 ± 25%     -95.0%      97312 ± 13%  meminfo.Mapped
  10765416 ± 19%     -56.4%    4688721        meminfo.Memused
     26188 ±  7%     -16.6%      21834 ±  3%  meminfo.PageTables
    119820 ±  3%     -11.2%     106362        meminfo.SReclaimable
   6276919 ± 32%     -92.9%     446262 ±  7%  meminfo.Shmem
  10844560 ± 18%     -54.7%    4910136        meminfo.max_used_kB
    112414 ±  3%     -19.5%      90510        proc-vmstat.nr_anon_pages
   6287343            +2.4%    6439087        proc-vmstat.nr_dirty_background_threshold
  12590061            +2.4%   12893918        proc-vmstat.nr_dirty_threshold
   2255451 ± 22%     -64.6%     799309        proc-vmstat.nr_file_pages
  63250334            +2.4%   64769989        proc-vmstat.nr_free_pages
   1614748 ± 36%     -93.4%     105893 ±  2%  proc-vmstat.nr_inactive_anon
    486843 ± 25%     -95.1%      23981 ± 12%  proc-vmstat.nr_mapped
      6540 ±  7%     -16.8%       5438 ±  4%  proc-vmstat.nr_page_table_pages
   1569694 ± 32%     -92.8%     113552 ±  9%  proc-vmstat.nr_shmem
     29955 ±  3%     -11.2%      26602        proc-vmstat.nr_slab_reclaimable
   1614748 ± 36%     -93.4%     105893 ±  2%  proc-vmstat.nr_zone_inactive_anon
    211018 ± 13%     -79.9%      42381 ± 14%  proc-vmstat.numa_hint_faults
    160113 ± 15%     -83.3%      26788 ± 12%  proc-vmstat.numa_hint_faults_local
   2655144 ± 26%    +110.5%    5590212        proc-vmstat.numa_hit
   2588870 ± 27%    +113.4%    5523898        proc-vmstat.numa_local
    326844 ±  9%     -55.0%     147101 ±  6%  proc-vmstat.numa_pte_updates
   2702096 ± 26%    +108.4%    5631452        proc-vmstat.pgalloc_normal
    689760 ±  6%     -38.7%     423092        proc-vmstat.pgfault
    362519 ± 11%   +1401.9%    5444523        proc-vmstat.pgfree
   1621676        +1.6e+06%  2.521e+10 ± 60%  sched_debug.cfs_rq:/.avg_vruntime.avg
   1927244 ±  5%    +5e+07%  9.628e+11 ± 78%  sched_debug.cfs_rq:/.avg_vruntime.max
   1477359           +16.4%    1719558        sched_debug.cfs_rq:/.avg_vruntime.min
     97270 ± 30%  +1.3e+08%  1.299e+11 ± 72%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      1.61 ±  3%     +51.6%       2.44        sched_debug.cfs_rq:/.h_nr_running.avg
      0.95 ±  4%     -28.3%       0.68 ±  7%  sched_debug.cfs_rq:/.h_nr_running.stddev
      0.42 ±223%    +560.0%       2.75 ±  9%  sched_debug.cfs_rq:/.load_avg.min
   1621676        +1.6e+06%  2.521e+10 ± 60%  sched_debug.cfs_rq:/.min_vruntime.avg
   1927244 ±  5%    +5e+07%  9.628e+11 ± 78%  sched_debug.cfs_rq:/.min_vruntime.max
   1477359           +16.4%    1719558        sched_debug.cfs_rq:/.min_vruntime.min
     97270 ± 30%  +1.3e+08%  1.299e+11 ± 72%  sched_debug.cfs_rq:/.min_vruntime.stddev
      1829           +42.5%       2607        sched_debug.cfs_rq:/.runnable_avg.avg
      2869 ±  2%     +30.4%       3739 ±  9%  sched_debug.cfs_rq:/.runnable_avg.max
    408.85 ± 16%     +55.4%     635.33 ±  7%  sched_debug.cfs_rq:/.runnable_avg.stddev
    398.36 ±  4%     +58.3%     630.78 ±  2%  sched_debug.cfs_rq:/.util_est_enqueued.avg
    980.50 ± 19%     +48.7%       1457 ± 20%  sched_debug.cfs_rq:/.util_est_enqueued.max
     67.67 ±135%    +220.0%     216.50 ± 51%  sched_debug.cfs_rq:/.util_est_enqueued.min
    368445 ±  2%     +13.8%     419318 ±  3%  sched_debug.cpu.avg_idle.avg
    642.50 ±141%    +222.6%       2072        sched_debug.cpu.curr->pid.min
      1.71 ±  4%     +42.7%       2.44 ±  2%  sched_debug.cpu.nr_running.avg
      1.01 ±  3%     -32.3%       0.68 ±  7%  sched_debug.cpu.nr_running.stddev
  14913470 ±  2%     -98.8%     179441 ± 35%  sched_debug.cpu.nr_switches.avg
  16029761           -88.9%    1780121 ± 52%  sched_debug.cpu.nr_switches.max
  12770801 ±  4%     -99.7%      32875 ±  3%  sched_debug.cpu.nr_switches.min
    641287 ± 18%     -54.3%     293366 ± 52%  sched_debug.cpu.nr_switches.stddev
    -14.25           +71.3%     -24.42        sched_debug.cpu.nr_uninterruptible.min
  29305629          +300.0%  1.172e+08        sched_debug.sysctl_sched.sysctl_sched_features
      0.78            -0.6        0.13 ±  7%  perf-stat.i.branch-miss-rate%
 2.898e+08           -92.5%   21860510 ±  7%  perf-stat.i.branch-misses
  32257355 ±  2%     -98.8%     376939 ± 37%  perf-stat.i.context-switches
      1.05            -2.3%       1.03        perf-stat.i.cpi
     64021            +1.4%      64949        perf-stat.i.cpu-clock
 2.152e+11            +1.2%  2.178e+11        perf-stat.i.cpu-cycles
     27526 ±104%     -90.4%       2650 ± 26%  perf-stat.i.cpu-migrations
     14650 ± 29%     -33.6%       9724 ± 21%  perf-stat.i.cycles-between-cache-misses
      0.03 ± 29%      -0.0        0.00 ±  7%  perf-stat.i.dTLB-store-miss-rate%
   9354202 ± 27%     -99.2%      71956 ±  2%  perf-stat.i.dTLB-store-misses
 3.386e+10           +11.5%  3.777e+10        perf-stat.i.dTLB-stores
 2.054e+11            +3.9%  2.135e+11        perf-stat.i.instructions
      1008 ±  7%     -78.4%     218.10 ± 20%  perf-stat.i.metric.K/sec
      2036            +2.3%       2083        perf-stat.i.metric.M/sec
      9337 ±  6%     -42.6%       5358 ±  3%  perf-stat.i.minor-faults
     73.66 ±  7%     +23.9       97.59        perf-stat.i.node-load-miss-rate%
   3844873 ± 23%     +57.4%    6050565 ± 21%  perf-stat.i.node-load-misses
   1667882 ± 31%     -94.9%      84228 ±  6%  perf-stat.i.node-loads
     65.11 ±  6%     +26.7       91.79        perf-stat.i.node-store-miss-rate%
   2825473 ± 26%    +103.6%    5752068 ± 21%  perf-stat.i.node-store-misses
   2054763 ± 20%     -81.9%     372090 ± 13%  perf-stat.i.node-stores
      9337 ±  6%     -42.6%       5358 ±  3%  perf-stat.i.page-faults
     64021            +1.4%      64949        perf-stat.i.task-clock
      0.71            -0.7        0.05 ±  8%  perf-stat.overall.branch-miss-rate%
      1.05            -2.6%       1.02        perf-stat.overall.cpi
      0.03 ± 29%      -0.0        0.00 ±  2%  perf-stat.overall.dTLB-store-miss-rate%
      0.95            +2.7%       0.98        perf-stat.overall.ipc
     69.92 ±  8%     +28.6       98.57        perf-stat.overall.node-load-miss-rate%
     57.56 ±  5%     +36.4       93.92        perf-stat.overall.node-store-miss-rate%
 2.853e+08           -92.5%   21324756 ±  7%  perf-stat.ps.branch-misses
  31782895 ±  2%     -98.8%     368465 ± 37%  perf-stat.ps.context-switches
     26778 ±104%     -90.0%       2690 ± 20%  perf-stat.ps.cpu-migrations
   9219317 ± 27%     -99.3%      69113 ±  2%  perf-stat.ps.dTLB-store-misses
 3.333e+10           +10.5%  3.683e+10        perf-stat.ps.dTLB-stores
 2.022e+11            +3.0%  2.082e+11        perf-stat.ps.instructions
      9171 ±  6%     -45.1%       5031        perf-stat.ps.minor-faults
   3786189 ± 23%     +56.0%    5905546 ± 21%  perf-stat.ps.node-load-misses
   1647753 ± 31%     -95.0%      82284 ±  5%  perf-stat.ps.node-loads
   2784086 ± 26%    +101.6%    5613482 ± 21%  perf-stat.ps.node-store-misses
   2013920 ± 20%     -82.3%     356711 ± 14%  perf-stat.ps.node-stores
      9171 ±  6%     -45.1%       5031        perf-stat.ps.page-faults
 1.273e+13            +2.0%    1.3e+13        perf-stat.total.instructions
      0.03 ±104%  +13178.9%       3.67 ±149%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      0.01 ±151%  +1.1e+05%       6.76 ±103%  perf-sched.sch_delay.avg.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      0.00 ±223%  +2.5e+05%       3.72 ± 59%  perf-sched.sch_delay.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.00 ±223%  +4.5e+05%       4.52 ± 47%  perf-sched.sch_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.00 ±223%  +1.4e+06%       4.72 ± 86%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      0.00 ±125%  +1.4e+05%       1.62 ± 29%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.00 ±133%   +5437.5%       0.22 ± 27%  perf-sched.sch_delay.avg.ms.pipe_write.vfs_write.ksys_write.do_syscall_64
      0.00 ±145%  +1.9e+05%       1.56 ±146%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      0.06 ±110%   +5563.9%       3.32 ± 11%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
      0.01 ±160%  +40955.8%       3.56 ± 34%  perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.00 ±100%  +69186.7%       1.73 ± 34%  perf-sched.sch_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.00 ±142%  +19482.8%       0.95 ± 44%  perf-sched.sch_delay.avg.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
      0.00 ±141%  +4.5e+05%      12.68 ± 38%  perf-sched.sch_delay.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      0.07 ±101%  +51004.8%      35.69 ±172%  perf-sched.sch_delay.max.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      0.00 ±141%   +8375.0%       0.17 ±215%  perf-sched.sch_delay.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.03 ±115%  +5.1e+05%     165.40 ±164%  perf-sched.sch_delay.max.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      0.00 ±223%  +7.3e+05%      10.89 ± 40%  perf-sched.sch_delay.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.00 ±223%  +1.2e+06%      11.83 ± 52%  perf-sched.sch_delay.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.00 ±223%    +3e+06%      24.68 ± 59%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      0.00 ±142%  +7.7e+06%     165.88 ±199%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      0.14 ±191%  +43114.2%      62.30 ± 55%  perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.01 ±101%  +7.2e+06%     383.00 ± 83%  perf-sched.sch_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.05 ±141%  +21386.4%      10.28 ± 58%  perf-sched.sch_delay.max.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
      0.05 ±110%   +4685.6%       2.27 ± 19%  perf-sched.total_sch_delay.average.ms
      0.16 ±106%   +3503.6%       5.87 ± 18%  perf-sched.total_wait_and_delay.average.ms
      0.12 ±105%   +3019.3%       3.60 ± 18%  perf-sched.total_wait_time.average.ms
     39.95 ±150%    +435.2%     213.78 ±  6%  perf-sched.wait_and_delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      0.07 ±108%   +4750.8%       3.34 ± 29%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
     29.10 ±123%   +1518.9%     471.02 ±  3%  perf-sched.wait_and_delay.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      0.02 ±102%   +1979.4%       0.49 ± 27%  perf-sched.wait_and_delay.avg.ms.pipe_write.vfs_write.ksys_write.do_syscall_64
      0.17 ±109%   +4062.4%       6.88 ± 10%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
     74.50 ±108%    +360.9%     343.33 ±  8%  perf-sched.wait_and_delay.count.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      0.33 ±223%   +1400.0%       5.00        perf-sched.wait_and_delay.count.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     11.33 ±141%    +832.4%     105.67 ±  2%  perf-sched.wait_and_delay.count.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      4.33 ±112%   +1011.5%      48.17        perf-sched.wait_and_delay.count.irq_thread.kthread.ret_from_fork.ret_from_fork_asm
     33040 ±105%    +194.6%      97327 ± 30%  perf-sched.wait_and_delay.count.pipe_write.vfs_write.ksys_write.do_syscall_64
      1.50 ±223%   +9566.7%     145.00 ± 15%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      2.00 ±100%    +475.0%      11.50 ±  4%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
     10.33 ±114%    +601.6%      72.50 ±  3%  perf-sched.wait_and_delay.count.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      1.83 ±142%    +990.9%      20.00        perf-sched.wait_and_delay.count.schedule_timeout.kcompactd.kthread.ret_from_fork
     57.83 ±116%    +733.1%     481.83 ± 12%  perf-sched.wait_and_delay.count.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    119.00 ±107%    +435.3%     637.00 ±  7%  perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     57.67 ±108%    +587.3%     396.33 ±  7%  perf-sched.wait_and_delay.count.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
    333.40 ±141%    +306.1%       1353 ± 43%  perf-sched.wait_and_delay.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      1790 ±101%    +113.2%       3818 ± 10%  perf-sched.wait_and_delay.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.00 ±123%  +20381.8%       0.38 ±157%  perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      0.00 ±143%  +54365.4%       2.36 ± 99%  perf-sched.wait_time.avg.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      0.00 ±223%  +1.9e+07%     515.23 ± 32%  perf-sched.wait_time.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
     19.11 ±161%    +999.1%     209.98 ±  7%  perf-sched.wait_time.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      0.01 ±144%  +29081.2%       2.33 ± 61%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
      0.08 ±221%  +30134.1%      22.93 ±162%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      0.07 ±108%   +2453.3%       1.72 ± 29%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
     24.69 ±122%   +1784.6%     465.32 ±  3%  perf-sched.wait_time.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      0.02 ±100%   +1270.9%       0.27 ± 28%  perf-sched.wait_time.avg.ms.pipe_write.vfs_write.ksys_write.do_syscall_64
      0.11 ±109%   +3236.6%       3.56 ±  9%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
      0.02 ±197%  +16054.4%       4.01 ± 85%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.pipe_write
      0.00 ±133%  +12105.6%       0.37 ± 90%  perf-sched.wait_time.avg.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
      0.01 ±124%  +31760.7%       3.24 ±135%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      0.01 ±152%    +4e+05%      22.10 ±113%  perf-sched.wait_time.max.ms.__cond_resched.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      0.00 ±223%  +3.8e+07%       1009        perf-sched.wait_time.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
    333.35 ±141%    +294.6%       1315 ± 45%  perf-sched.wait_time.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      0.01 ±145%  +1.3e+05%      10.94 ± 67%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_call_function_single
      0.23 ±222%  +95133.2%     215.39 ±170%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
    368.86 ±106%    +174.0%       1010        perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.05 ±204%  +37370.0%      17.67 ± 62%  perf-sched.wait_time.max.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.pipe_write
      0.02 ±184%  +32847.3%       5.11 ± 76%  perf-sched.wait_time.max.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
      1790 ±101%    +113.2%       3818 ± 10%  perf-sched.wait_time.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     37.89           -37.9        0.00        perf-profile.calltrace.cycles-pp.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select.__x64_sys_select
     31.41           -31.4        0.00        perf-profile.calltrace.cycles-pp.schedule.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
     30.51           -30.5        0.00        perf-profile.calltrace.cycles-pp.__schedule.schedule.schedule_hrtimeout_range_clock.do_select.core_sys_select
     44.71           -29.2       15.54 ±  3%  perf-profile.calltrace.cycles-pp.do_select.core_sys_select.kern_select.__x64_sys_select.do_syscall_64
     46.79           -21.8       25.04        perf-profile.calltrace.cycles-pp.core_sys_select.kern_select.__x64_sys_select.do_syscall_64.entry_SYSCALL_64_after_hwframe
     20.26           -15.7        4.52        perf-profile.calltrace.cycles-pp.try_to_wake_up.pollwake.__wake_up_common.__wake_up_common_lock.pipe_write
     20.78           -14.6        6.22 ±  2%  perf-profile.calltrace.cycles-pp.pollwake.__wake_up_common.__wake_up_common_lock.pipe_write.vfs_write
     48.46           -14.2       34.24        perf-profile.calltrace.cycles-pp.kern_select.__x64_sys_select.do_syscall_64.entry_SYSCALL_64_after_hwframe.__select
     21.11           -13.4        7.69 ±  2%  perf-profile.calltrace.cycles-pp.__wake_up_common.__wake_up_common_lock.pipe_write.vfs_write.ksys_write
     21.42           -11.8        9.63 ±  2%  perf-profile.calltrace.cycles-pp.__wake_up_common_lock.pipe_write.vfs_write.ksys_write.do_syscall_64
     11.46           -11.5        0.00        perf-profile.calltrace.cycles-pp.dequeue_task_fair.__schedule.schedule.schedule_hrtimeout_range_clock.do_select
     11.10           -11.1        0.00        perf-profile.calltrace.cycles-pp.ttwu_do_activate.try_to_wake_up.pollwake.__wake_up_common.__wake_up_common_lock
     10.43           -10.4        0.00        perf-profile.calltrace.cycles-pp.__select
     10.00           -10.0        0.00        perf-profile.calltrace.cycles-pp.activate_task.ttwu_do_activate.try_to_wake_up.pollwake.__wake_up_common
      9.63            -9.6        0.00        perf-profile.calltrace.cycles-pp.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_wake_up.pollwake
     42.43            -7.9       34.57        perf-profile.calltrace.cycles-pp.__x64_sys_select.do_syscall_64.entry_SYSCALL_64_after_hwframe.__select.stress_run
     43.53            -7.8       35.72        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__select.stress_run
     43.84            -7.4       36.40        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__select.stress_run
      6.47            -6.5        0.00        perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      6.24            -6.2        0.00        perf-profile.calltrace.cycles-pp.dequeue_entity.dequeue_task_fair.__schedule.schedule.schedule_hrtimeout_range_clock
      6.17            -6.2        0.00        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__select
      6.17            -6.2        0.00        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__select
      6.17            -6.2        0.00        perf-profile.calltrace.cycles-pp.__x64_sys_select.do_syscall_64.entry_SYSCALL_64_after_hwframe.__select
      5.70            -5.7        0.00        perf-profile.calltrace.cycles-pp.switch_mm_irqs_off.__schedule.schedule.schedule_hrtimeout_range_clock.do_select
     22.90            -5.6       17.34        perf-profile.calltrace.cycles-pp.pipe_write.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      5.55            -5.5        0.00        perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      5.37            -5.4        0.00        perf-profile.calltrace.cycles-pp.enqueue_entity.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_wake_up
      5.33            -5.3        0.00        perf-profile.calltrace.cycles-pp.schedule.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      5.14            -5.1        0.00        perf-profile.calltrace.cycles-pp.__schedule.schedule.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      4.98            -4.4        0.57 ±  8%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.write.stress_run
     44.82            -3.9       40.96        perf-profile.calltrace.cycles-pp.__select.stress_run
     30.48            -3.0       27.44        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.write.stress_run
     30.90            -2.8       28.14        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.write.stress_run
     24.18            -1.4       22.75        perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      1.06            -0.4        0.62        perf-profile.calltrace.cycles-pp.__fget_light.do_select.core_sys_select.kern_select.__x64_sys_select
      0.87            -0.3        0.53 ±  2%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__select.stress_run
      0.55            +0.5        1.07 ±  5%  perf-profile.calltrace.cycles-pp.security_file_permission.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.6        0.59 ±  2%  perf-profile.calltrace.cycles-pp.current_time.file_update_time.pipe_write.vfs_write.ksys_write
      0.00            +0.6        0.60 ±  3%  perf-profile.calltrace.cycles-pp.__fget_light.__fdget_pos.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.6        0.60 ±  5%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__read_chk.stress_run
      0.00            +0.6        0.61        perf-profile.calltrace.cycles-pp.current_time.atime_needs_update.touch_atime.pipe_read.vfs_read
      0.00            +0.7        0.66 ±  4%  perf-profile.calltrace.cycles-pp.mutex_unlock.pipe_read.vfs_read.ksys_read.do_syscall_64
      0.00            +0.7        0.66 ±  3%  perf-profile.calltrace.cycles-pp.mutex_unlock.pipe_write.vfs_write.ksys_write.do_syscall_64
      0.00            +0.7        0.68        perf-profile.calltrace.cycles-pp.__check_object_size.core_sys_select.kern_select.__x64_sys_select.do_syscall_64
      0.00            +0.7        0.70 ±  7%  perf-profile.calltrace.cycles-pp.__fget_light.__fdget_pos.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.53            +0.7        1.26 ±  2%  perf-profile.calltrace.cycles-pp.security_file_permission.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.7        0.74 ±  2%  perf-profile.calltrace.cycles-pp.__fdget_pos.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.__read_chk
      0.00            +0.7        0.74 ± 11%  perf-profile.calltrace.cycles-pp.fput.poll_freewait.do_select.core_sys_select.kern_select
      0.00            +0.8        0.80 ±  5%  perf-profile.calltrace.cycles-pp.apparmor_file_permission.security_file_permission.vfs_write.ksys_write.do_syscall_64
      0.00            +0.9        0.91 ±  4%  perf-profile.calltrace.cycles-pp.__fdget_pos.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      0.00            +0.9        0.94 ±  5%  perf-profile.calltrace.cycles-pp.__pollwait.pipe_poll.do_select.core_sys_select.kern_select
      0.00            +1.0        0.97 ±  2%  perf-profile.calltrace.cycles-pp.apparmor_file_permission.security_file_permission.vfs_read.ksys_read.do_syscall_64
      0.00            +1.0        0.98        perf-profile.calltrace.cycles-pp.read_tsc.ktime_get_ts64.kern_select.__x64_sys_select.do_syscall_64
      0.00            +1.0        0.98        perf-profile.calltrace.cycles-pp.read_tsc.ktime_get_ts64.select_estimate_accuracy.do_select.core_sys_select
      0.00            +1.0        0.99 ±  5%  perf-profile.calltrace.cycles-pp.mutex_lock.pipe_write.vfs_write.ksys_write.do_syscall_64
      0.00            +1.0        0.99        perf-profile.calltrace.cycles-pp.read_tsc.ktime_get_ts64.poll_select_finish.kern_select.__x64_sys_select
      0.00            +1.0        1.00 ±  4%  perf-profile.calltrace.cycles-pp.mutex_lock.pipe_read.vfs_read.ksys_read.do_syscall_64
     25.10            +1.0       26.11        perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write.stress_run
      0.00            +1.2        1.18        perf-profile.calltrace.cycles-pp.file_update_time.pipe_write.vfs_write.ksys_write.do_syscall_64
      0.00            +1.2        1.20 ± 11%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__wake_up_common_lock.pipe_write.vfs_write.ksys_write
      0.00            +1.3        1.26 ±  2%  perf-profile.calltrace.cycles-pp.memset_orig.core_sys_select.kern_select.__x64_sys_select.do_syscall_64
      0.00            +1.3        1.34        perf-profile.calltrace.cycles-pp.atime_needs_update.touch_atime.pipe_read.vfs_read.ksys_read
      0.00            +1.4        1.42 ±  2%  perf-profile.calltrace.cycles-pp._copy_to_user.poll_select_finish.kern_select.__x64_sys_select.do_syscall_64
      0.00            +1.4        1.43 ± 13%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.add_wait_queue.pipe_poll.do_select.core_sys_select
      0.00            +1.5        1.48        perf-profile.calltrace.cycles-pp.ktime_get_ts64.poll_select_finish.kern_select.__x64_sys_select.do_syscall_64
      0.00            +1.5        1.48        perf-profile.calltrace.cycles-pp.copyout._copy_to_iter.copy_page_to_iter.pipe_read.vfs_read
      0.00            +1.5        1.48        perf-profile.calltrace.cycles-pp.ktime_get_ts64.select_estimate_accuracy.do_select.core_sys_select.kern_select
      0.00            +1.5        1.49        perf-profile.calltrace.cycles-pp.ktime_get_ts64.kern_select.__x64_sys_select.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.32 ±  4%      +1.5        4.85 ±  2%  perf-profile.calltrace.cycles-pp.stress_fifo.stress_run
      0.00            +1.5        1.55        perf-profile.calltrace.cycles-pp.__fsnotify_parent.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +1.6        1.55        perf-profile.calltrace.cycles-pp.copyin._copy_from_iter.copy_page_from_iter.pipe_write.vfs_write
      0.00            +1.6        1.56 ± 18%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.remove_wait_queue.poll_freewait.do_select.core_sys_select
      0.00            +1.7        1.70        perf-profile.calltrace.cycles-pp.touch_atime.pipe_read.vfs_read.ksys_read.do_syscall_64
      0.00            +2.0        2.01        perf-profile.calltrace.cycles-pp._copy_from_user.core_sys_select.kern_select.__x64_sys_select.do_syscall_64
      0.00            +2.0        2.04 ± 16%  perf-profile.calltrace.cycles-pp.remove_wait_queue.poll_freewait.do_select.core_sys_select.kern_select
      0.00            +2.1        2.09        perf-profile.calltrace.cycles-pp._copy_from_user.kern_select.__x64_sys_select.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +2.1        2.11        perf-profile.calltrace.cycles-pp._copy_to_iter.copy_page_to_iter.pipe_read.vfs_read.ksys_read
      0.00            +2.2        2.16        perf-profile.calltrace.cycles-pp._copy_from_iter.copy_page_from_iter.pipe_write.vfs_write.ksys_write
      0.00            +2.2        2.19 ± 12%  perf-profile.calltrace.cycles-pp.add_wait_queue.pipe_poll.do_select.core_sys_select.kern_select
      0.44 ± 44%      +2.3        2.71 ±  2%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.try_to_wake_up.pollwake.__wake_up_common.__wake_up_common_lock
      0.00            +2.4        2.40        perf-profile.calltrace.cycles-pp.select_estimate_accuracy.do_select.core_sys_select.kern_select.__x64_sys_select
      0.09 ±223%      +2.5        2.61        perf-profile.calltrace.cycles-pp.copy_page_from_iter.pipe_write.vfs_write.ksys_write.do_syscall_64
      0.00            +2.6        2.60        perf-profile.calltrace.cycles-pp.copy_page_to_iter.pipe_read.vfs_read.ksys_read.do_syscall_64
      0.00            +2.7        2.71        perf-profile.calltrace.cycles-pp.__entry_text_start.__select.stress_run
      0.00            +2.7        2.72        perf-profile.calltrace.cycles-pp.__entry_text_start.__read_chk.stress_run
      0.56 ±  3%      +2.8        3.35 ± 12%  perf-profile.calltrace.cycles-pp.poll_freewait.do_select.core_sys_select.kern_select.__x64_sys_select
      0.00            +2.8        2.81        perf-profile.calltrace.cycles-pp.__entry_text_start.write.stress_run
      0.42 ± 44%      +2.9        3.34        perf-profile.calltrace.cycles-pp.__fsnotify_parent.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.66            +3.2        3.87 ±  8%  perf-profile.calltrace.cycles-pp.pipe_poll.do_select.core_sys_select.kern_select.__x64_sys_select
      0.76            +3.2        4.00        perf-profile.calltrace.cycles-pp.poll_select_finish.kern_select.__x64_sys_select.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.52            +6.5        7.99        perf-profile.calltrace.cycles-pp.pipe_read.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.10           +13.0       16.05        perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.__read_chk
      3.34           +14.1       17.46        perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.__read_chk.stress_run
     84.70           +15.0       99.70        perf-profile.calltrace.cycles-pp.stress_run
      3.53           +15.3       18.79        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__read_chk.stress_run
      3.64           +15.8       19.48        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__read_chk.stress_run
      4.52           +19.5       24.06        perf-profile.calltrace.cycles-pp.__read_chk.stress_run
     38.18           -38.0        0.19 ± 57%  perf-profile.children.cycles-pp.schedule_hrtimeout_range_clock
     36.83           -36.4        0.43 ± 38%  perf-profile.children.cycles-pp.schedule
     36.12           -35.7        0.42 ± 36%  perf-profile.children.cycles-pp.__schedule
     44.86           -29.0       15.87 ±  3%  perf-profile.children.cycles-pp.do_select
     46.87           -21.4       25.49        perf-profile.children.cycles-pp.core_sys_select
     20.50           -15.5        5.03        perf-profile.children.cycles-pp.try_to_wake_up
     55.48           -14.4       41.11        perf-profile.children.cycles-pp.__select
     20.83           -14.3        6.49 ±  2%  perf-profile.children.cycles-pp.pollwake
     48.52           -14.0       34.56        perf-profile.children.cycles-pp.kern_select
     48.64           -13.9       34.71        perf-profile.children.cycles-pp.__x64_sys_select
     21.15           -13.2        7.99        perf-profile.children.cycles-pp.__wake_up_common
     11.58           -11.5        0.10 ± 35%  perf-profile.children.cycles-pp.dequeue_task_fair
     21.47           -11.4       10.09 ±  2%  perf-profile.children.cycles-pp.__wake_up_common_lock
     11.26           -11.1        0.12 ± 40%  perf-profile.children.cycles-pp.ttwu_do_activate
     10.10           -10.0        0.09 ± 55%  perf-profile.children.cycles-pp.activate_task
      9.78            -9.7        0.08 ± 55%  perf-profile.children.cycles-pp.enqueue_task_fair
      7.32            -7.3        0.06 ± 72%  perf-profile.children.cycles-pp.update_curr
      7.24            -7.2        0.08 ± 72%  perf-profile.children.cycles-pp.switch_mm_irqs_off
      7.07            -7.0        0.10 ± 33%  perf-profile.children.cycles-pp.update_load_avg
      6.53            -6.4        0.09 ± 55%  perf-profile.children.cycles-pp.pick_next_task_fair
      7.34            -6.4        0.91 ±  9%  perf-profile.children.cycles-pp.exit_to_user_mode_prepare
      6.46            -6.4        0.05 ± 72%  perf-profile.children.cycles-pp.dequeue_entity
      5.66            -5.6        0.04 ± 71%  perf-profile.children.cycles-pp.enqueue_entity
      5.59            -5.4        0.17 ± 39%  perf-profile.children.cycles-pp.exit_to_user_mode_loop
      7.57            -5.4        2.20 ±  4%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode
     22.95            -5.3       17.61        perf-profile.children.cycles-pp.pipe_write
     35.05            -3.3       31.73        perf-profile.children.cycles-pp.write
     85.44            -2.6       82.84        perf-profile.children.cycles-pp.do_syscall_64
     86.20            -1.8       84.37        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     24.23            -1.2       23.00        perf-profile.children.cycles-pp.vfs_write
      1.09            -0.8        0.34 ± 13%  perf-profile.children.cycles-pp.__list_del_entry_valid
      0.32 ± 10%      -0.2        0.15 ±  4%  perf-profile.children.cycles-pp.__read_chk@plt
      0.35            -0.1        0.27 ±  6%  perf-profile.children.cycles-pp.__list_add_valid
      0.19            -0.0        0.14 ±  5%  perf-profile.children.cycles-pp.__x64_sys_write
      0.10 ±  8%      -0.0        0.08 ±  6%  perf-profile.children.cycles-pp.perf_event_task_tick
      0.10 ±  8%      -0.0        0.08 ±  6%  perf-profile.children.cycles-pp.perf_adjust_freq_unthr_context
      0.08 ±  7%      +0.0        0.11 ±  6%  perf-profile.children.cycles-pp.__fdget
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.ioctl
      0.06 ± 46%      +0.1        0.11 ± 14%  perf-profile.children.cycles-pp.__fdelt_warn
      0.00            +0.1        0.06 ±  6%  perf-profile.children.cycles-pp.vm_mmap_pgoff
      0.00            +0.1        0.06 ±  7%  perf-profile.children.cycles-pp.ksys_mmap_pgoff
      0.00            +0.1        0.08 ±  6%  perf-profile.children.cycles-pp.__mmap
      0.00            +0.1        0.08        perf-profile.children.cycles-pp.select@plt
      0.06 ± 14%      +0.1        0.14 ±  8%  perf-profile.children.cycles-pp.__fdelt_chk@plt
      0.00            +0.1        0.10 ± 48%  perf-profile.children.cycles-pp.autoremove_wake_function
      0.01 ±223%      +0.1        0.12 ±  4%  perf-profile.children.cycles-pp.write@plt
      0.00            +0.1        0.12 ±  4%  perf-profile.children.cycles-pp.__wake_up_sync_key
      0.00            +0.1        0.14 ± 28%  perf-profile.children.cycles-pp.__mutex_lock
      0.00            +0.1        0.14 ±  3%  perf-profile.children.cycles-pp.make_vfsgid
      0.00            +0.1        0.14 ±  3%  perf-profile.children.cycles-pp.__x64_sys_read
      0.00            +0.1        0.15 ±  3%  perf-profile.children.cycles-pp.make_vfsuid
      0.13 ±  2%      +0.2        0.36        perf-profile.children.cycles-pp.rcu_all_qs
      0.06 ±  7%      +0.2        0.31 ±  2%  perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.02 ± 99%      +0.3        0.28        perf-profile.children.cycles-pp.kill_fasync
      0.00            +0.3        0.26 ±  2%  perf-profile.children.cycles-pp.timespec64_add_safe
      0.02 ±141%      +0.3        0.30 ±  2%  perf-profile.children.cycles-pp.inode_needs_update_time
      0.09            +0.3        0.39 ±  2%  perf-profile.children.cycles-pp.check_stack_object
      0.06 ±  8%      +0.3        0.37 ±  2%  perf-profile.children.cycles-pp.rw_verify_area
      0.05 ±  7%      +0.3        0.37 ±  2%  perf-profile.children.cycles-pp.set_normalized_timespec64
      0.06 ±  9%      +0.3        0.37        perf-profile.children.cycles-pp.ktime_get_coarse_real_ts64
      0.06 ±  7%      +0.3        0.39        perf-profile.children.cycles-pp.__memset
      0.04 ± 44%      +0.3        0.38 ±  3%  perf-profile.children.cycles-pp.fsnotify_perm
      0.09            +0.5        0.56 ±  2%  perf-profile.children.cycles-pp.default_wake_function
      0.12 ±  4%      +0.5        0.62        perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
      0.09 ±  7%      +0.5        0.63 ±  2%  perf-profile.children.cycles-pp.aa_file_perm
      1.48            +0.5        2.02 ±  2%  perf-profile.children.cycles-pp.__fget_light
      0.34            +0.6        0.95        perf-profile.children.cycles-pp.__cond_resched
      0.12 ±  3%      +0.6        0.74        perf-profile.children.cycles-pp.__get_task_ioprio
      0.09 ±  4%      +0.7        0.78 ± 10%  perf-profile.children.cycles-pp.fput
      0.39 ±  4%      +0.8        1.16        perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.25 ±  3%      +0.8        1.05        perf-profile.children.cycles-pp.__check_object_size
      0.53            +0.8        1.37        perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      0.16 ±  2%      +0.8        1.01        perf-profile.children.cycles-pp.syscall_enter_from_user_mode
      0.12 ±  3%      +0.9        0.98 ±  4%  perf-profile.children.cycles-pp.__pollwait
      0.20 ±  2%      +1.1        1.33        perf-profile.children.cycles-pp.file_update_time
      0.20 ±  2%      +1.2        1.35        perf-profile.children.cycles-pp.current_time
     25.15            +1.2       26.31        perf-profile.children.cycles-pp.ksys_write
      0.19 ±  3%      +1.2        1.39 ±  3%  perf-profile.children.cycles-pp.mutex_unlock
      0.24 ±  3%      +1.2        1.46        perf-profile.children.cycles-pp.memset_orig
      0.21 ±  3%      +1.3        1.47        perf-profile.children.cycles-pp.atime_needs_update
      0.64 ±  2%      +1.3        1.94 ±  3%  perf-profile.children.cycles-pp.apparmor_file_permission
      0.26 ±  3%      +1.4        1.61        perf-profile.children.cycles-pp._copy_to_user
      0.48 ±  3%      +1.4        1.85 ±  2%  perf-profile.children.cycles-pp.__fdget_pos
      0.30 ±  5%      +1.4        1.67        perf-profile.children.cycles-pp.copyout
      1.10            +1.4        2.55 ±  3%  perf-profile.children.cycles-pp.security_file_permission
      0.29 ±  9%      +1.5        1.74        perf-profile.children.cycles-pp.copyin
      0.02 ±149%      +1.5        1.50 ± 34%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      0.26 ±  2%      +1.5        1.77        perf-profile.children.cycles-pp.touch_atime
      0.37 ±  2%      +1.8        2.14 ±  4%  perf-profile.children.cycles-pp.mutex_lock
      3.37 ±  4%      +1.8        5.14 ±  2%  perf-profile.children.cycles-pp.stress_fifo
      0.41 ±  3%      +1.8        2.18 ± 15%  perf-profile.children.cycles-pp.remove_wait_queue
      0.37 ±  3%      +1.8        2.18        perf-profile.children.cycles-pp._copy_to_iter
      0.42 ±  8%      +1.8        2.26        perf-profile.children.cycles-pp._copy_from_iter
      0.24 ±  3%      +2.1        2.32 ± 11%  perf-profile.children.cycles-pp.add_wait_queue
      0.40            +2.1        2.54        perf-profile.children.cycles-pp.select_estimate_accuracy
      0.52 ±  5%      +2.2        2.72        perf-profile.children.cycles-pp.copy_page_from_iter
      0.45 ±  2%      +2.2        2.67        perf-profile.children.cycles-pp.copy_page_to_iter
      0.49            +2.6        3.07        perf-profile.children.cycles-pp.read_tsc
      0.58 ±  3%      +2.9        3.50 ± 11%  perf-profile.children.cycles-pp.poll_freewait
      0.58            +3.2        3.75        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.69            +3.2        3.94 ±  8%  perf-profile.children.cycles-pp.pipe_poll
      0.79            +3.4        4.20        perf-profile.children.cycles-pp.poll_select_finish
      0.64 ±  2%      +3.5        4.18        perf-profile.children.cycles-pp._copy_from_user
      0.78            +3.9        4.67        perf-profile.children.cycles-pp.ktime_get_ts64
      0.79            +4.0        4.80        perf-profile.children.cycles-pp.__entry_text_start
      0.77            +4.2        5.02        perf-profile.children.cycles-pp.__fsnotify_parent
      1.80            +5.4        7.22 ±  8%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      1.58            +6.7        8.25        perf-profile.children.cycles-pp.pipe_read
      3.15           +13.2       16.34        perf-profile.children.cycles-pp.vfs_read
      3.36           +14.2       17.57        perf-profile.children.cycles-pp.ksys_read
     84.70           +15.0       99.70        perf-profile.children.cycles-pp.stress_run
      4.71           +19.5       24.17        perf-profile.children.cycles-pp.__read_chk
      7.12            -7.0        0.08 ± 73%  perf-profile.self.cycles-pp.switch_mm_irqs_off
      1.01            -0.7        0.30 ± 15%  perf-profile.self.cycles-pp.__list_del_entry_valid
      0.29 ± 10%      -0.2        0.04 ± 45%  perf-profile.self.cycles-pp.__read_chk@plt
      0.18 ±  2%      -0.1        0.07 ±  5%  perf-profile.self.cycles-pp.__x64_sys_write
      0.28 ±  2%      -0.1        0.20 ± 10%  perf-profile.self.cycles-pp.__list_add_valid
      0.12 ±  6%      +0.0        0.15 ±  2%  perf-profile.self.cycles-pp.__x64_sys_select
      0.00            +0.1        0.07        perf-profile.self.cycles-pp.__wake_up_sync_key
      0.00            +0.1        0.07 ±  6%  perf-profile.self.cycles-pp.__x64_sys_read
      0.00            +0.1        0.11        perf-profile.self.cycles-pp.make_vfsgid
      0.00            +0.1        0.11        perf-profile.self.cycles-pp.make_vfsuid
      0.09 ±  4%      +0.2        0.25        perf-profile.self.cycles-pp.rcu_all_qs
      0.28            +0.2        0.45 ±  2%  perf-profile.self.cycles-pp.pipe_poll
      0.00            +0.2        0.18 ±  2%  perf-profile.self.cycles-pp.kill_fasync
      0.00            +0.2        0.18 ±  2%  perf-profile.self.cycles-pp.__memset
      0.47 ±  2%      +0.2        0.67 ±  2%  perf-profile.self.cycles-pp.security_file_permission
      0.00            +0.2        0.22 ±  3%  perf-profile.self.cycles-pp.inode_needs_update_time
      0.00            +0.2        0.22 ±  3%  perf-profile.self.cycles-pp.timespec64_add_safe
      0.00            +0.2        0.23 ±  2%  perf-profile.self.cycles-pp.set_normalized_timespec64
      0.07 ±  5%      +0.2        0.31 ±  3%  perf-profile.self.cycles-pp.check_stack_object
      0.05            +0.2        0.30        perf-profile.self.cycles-pp.remove_wait_queue
      0.06 ±  6%      +0.2        0.31        perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.04 ± 44%      +0.3        0.29 ±  2%  perf-profile.self.cycles-pp.touch_atime
      0.02 ± 99%      +0.3        0.30        perf-profile.self.cycles-pp.ktime_get_coarse_real_ts64
      0.01 ±223%      +0.3        0.29 ±  2%  perf-profile.self.cycles-pp.rw_verify_area
      0.10 ±  5%      +0.3        0.40        perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
      0.06            +0.3        0.38        perf-profile.self.cycles-pp.poll_freewait
      0.02 ±141%      +0.3        0.34 ±  4%  perf-profile.self.cycles-pp.fsnotify_perm
      0.07            +0.4        0.42 ±  2%  perf-profile.self.cycles-pp.default_wake_function
      0.25            +0.4        0.60        perf-profile.self.cycles-pp.exit_to_user_mode_prepare
      0.21 ±  2%      +0.4        0.58        perf-profile.self.cycles-pp.__cond_resched
      0.06 ±  6%      +0.4        0.44        perf-profile.self.cycles-pp.file_update_time
      0.06 ±  7%      +0.4        0.45 ±  2%  perf-profile.self.cycles-pp.ksys_read
      0.10 ±  4%      +0.4        0.49 ±  2%  perf-profile.self.cycles-pp.copy_page_from_iter
      0.13 ±  2%      +0.4        0.53        perf-profile.self.cycles-pp._copy_from_iter
      0.08            +0.4        0.48        perf-profile.self.cycles-pp.copy_page_to_iter
      0.08 ±  5%      +0.4        0.50 ±  2%  perf-profile.self.cycles-pp.__fdget_pos
      1.43            +0.4        1.85 ±  2%  perf-profile.self.cycles-pp.__fget_light
      0.08 ±  4%      +0.4        0.52        perf-profile.self.cycles-pp._copy_to_iter
      0.15 ±  2%      +0.4        0.59        perf-profile.self.cycles-pp.__check_object_size
      0.07 ± 10%      +0.4        0.52 ±  2%  perf-profile.self.cycles-pp.aa_file_perm
      0.08            +0.5        0.56 ±  3%  perf-profile.self.cycles-pp.atime_needs_update
      0.11 ±  5%      +0.5        0.63        perf-profile.self.cycles-pp.__get_task_ioprio
      0.09 ±  4%      +0.5        0.62        perf-profile.self.cycles-pp.__wake_up_common_lock
      0.76 ±  2%      +0.6        1.33        perf-profile.self.cycles-pp.write
      0.08 ±  6%      +0.6        0.67 ±  8%  perf-profile.self.cycles-pp.add_wait_queue
      0.44 ±  2%      +0.6        1.09        perf-profile.self.cycles-pp._raw_spin_unlock_irqrestore
      0.95            +0.6        1.60 ±  2%  perf-profile.self.cycles-pp.try_to_wake_up
      0.08 ±  5%      +0.7        0.74 ± 11%  perf-profile.self.cycles-pp.fput
      0.13 ±  3%      +0.7        0.79 ±  2%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.14 ±  3%      +0.7        0.83        perf-profile.self.cycles-pp.select_estimate_accuracy
      0.14 ±  5%      +0.7        0.87        perf-profile.self.cycles-pp.syscall_enter_from_user_mode
      0.54 ±  2%      +0.7        1.28 ±  3%  perf-profile.self.cycles-pp.apparmor_file_permission
      0.56 ±  6%      +0.8        1.31        perf-profile.self.cycles-pp.__select
      0.20 ±  2%      +0.8        0.98        perf-profile.self.cycles-pp.poll_select_finish
      0.38 ±  3%      +0.8        1.16        perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.36            +0.8        1.14        perf-profile.self.cycles-pp.do_syscall_64
      0.30 ±  3%      +0.8        1.10        perf-profile.self.cycles-pp.kern_select
      0.12 ±  3%      +0.8        0.94 ±  4%  perf-profile.self.cycles-pp.__pollwait
      0.14 ±  2%      +0.8        0.98 ±  2%  perf-profile.self.cycles-pp.current_time
      0.78            +0.8        1.63        perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.25 ±  3%      +0.9        1.14 ±  2%  perf-profile.self.cycles-pp.pollwake
      0.22 ±  2%      +1.0        1.26        perf-profile.self.cycles-pp.__read_chk
      0.26            +1.1        1.31        perf-profile.self.cycles-pp.__entry_text_start
      0.21 ±  2%      +1.1        1.28        perf-profile.self.cycles-pp.memset_orig
      3.76            +1.1        4.84        perf-profile.self.cycles-pp.do_select
      0.33 ±  3%      +1.1        1.46 ±  3%  perf-profile.self.cycles-pp.__wake_up_common
      0.18 ±  5%      +1.1        1.31 ±  4%  perf-profile.self.cycles-pp.mutex_unlock
      0.26            +1.2        1.48 ±  7%  perf-profile.self.cycles-pp.mutex_lock
      0.42 ±  2%      +1.2        1.65 ±  2%  perf-profile.self.cycles-pp.pipe_read
      0.42 ±  3%      +1.3        1.68 ±  2%  perf-profile.self.cycles-pp.pipe_write
      0.29 ±  2%      +1.3        1.56        perf-profile.self.cycles-pp.ktime_get_ts64
      0.24 ±  2%      +1.3        1.55        perf-profile.self.cycles-pp._copy_to_user
      0.28 ±  5%      +1.3        1.62        perf-profile.self.cycles-pp.copyout
      0.28 ± 10%      +1.4        1.67        perf-profile.self.cycles-pp.copyin
      0.02 ±149%      +1.5        1.49 ± 34%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      0.61 ± 22%      +1.7        2.34 ±  7%  perf-profile.self.cycles-pp.ksys_write
      0.39 ±  2%      +1.9        2.24        perf-profile.self.cycles-pp.vfs_write
      3.06 ±  4%      +1.9        4.94 ±  2%  perf-profile.self.cycles-pp.stress_fifo
      0.42            +2.2        2.63        perf-profile.self.cycles-pp.vfs_read
      0.47            +2.5        2.95        perf-profile.self.cycles-pp.read_tsc
      0.56            +3.1        3.63        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.62 ±  2%      +3.4        4.06        perf-profile.self.cycles-pp._copy_from_user
      1.68            +3.8        5.44 ±  2%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      1.24            +4.0        5.25        perf-profile.self.cycles-pp.core_sys_select
      0.74            +4.1        4.86        perf-profile.self.cycles-pp.__fsnotify_parent





Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



--rPIyn3lZ0OrwwLB2
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment;
	filename="config-6.5.0-rc2-00018-g86bfbb7ce4f6"

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

--rPIyn3lZ0OrwwLB2
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="job-script"

#!/bin/sh

export_top_env()
{
	export suite='netperf'
	export testcase='netperf'
	export category='benchmark'
	export disable_latency_stats=1
	export set_nic_irq_affinity=1
	export ip='ipv4'
	export runtime=300
	export nr_threads=256
	export cluster='cs-localhost'
	export job_origin='netperf.yaml'
	export queue_cmdline_keys='branch
commit
kbuild_queue_analysis'
	export queue='validate'
	export testbox='lkp-icl-2sp2'
	export tbox_group='lkp-icl-2sp2'
	export submit_id='64bd86a5609b4ac1089898ad'
	export job_file='/lkp/jobs/queued/validate/lkp-icl-2sp2/netperf-cs-localhost-performance-ipv4-200%-300s-TCP_MAERTS-debian-11.1-x86_64-20220510.cgz-86bfbb7ce4f6-20230724-49416-roxmbx-4.yaml'
	export id='ebe3524e92584cd2ce9d5b874d209ad7c4d0a25f'
	export queuer_version='/zday/lkp'
	export model='Ice Lake'
	export nr_node=2
	export nr_cpu=128
	export memory='256G'
	export nr_ssd_partitions=4
	export ssd_partitions='/dev/disk/by-id/nvme-INTEL_SSDPE2KX040T7_PHLF7414019F4P0IGN-part2
/dev/disk/by-id/nvme-INTEL_SSDPE2KX040T7_PHLF7414019F4P0IGN-part3
/dev/disk/by-id/nvme-INTEL_SSDPE21K375GA_PHKE734100DV375AGN-part1
/dev/disk/by-id/nvme-INTEL_SSDPE21K375GA_PHKE734200JC375AGN-part1'
	export swap_partitions=
	export rootfs_partition='/dev/disk/by-id/nvme-INTEL_SSDPE2KX040T7_PHLF7414019F4P0IGN-part1'
	export brand='Intel(R) Xeon(R) Gold 6338 CPU @ 2.00GHz'
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
	export commit='86bfbb7ce4f67a88df2639198169b685668e7349'
	export netconsole_port=6680
	export ucode='0xd000389'
	export kconfig='x86_64-rhel-8.3'
	export enqueue_time='2023-07-24 03:59:33 +0800'
	export _id='64bd86a6609b4ac1089898ae'
	export _rt='/result/netperf/cs-localhost-performance-ipv4-200%-300s-TCP_MAERTS/lkp-icl-2sp2/debian-11.1-x86_64-20220510.cgz/x86_64-rhel-8.3/gcc-12/86bfbb7ce4f67a88df2639198169b685668e7349'
	export compiler='gcc-12'
	export head_commit='cd875ef432fda9d248c23f18d539b75794046b6f'
	export base_commit='fdf0eaf11452d72945af31804e2a1048ee1b574c'
	export branch='tip/sched/eevdf'
	export rootfs='debian-11.1-x86_64-20220510.cgz'
	export user='lkp'
	export LKP_SERVER='internal-lkp-server'
	export scheduler_version='/lkp/lkp/src'
	export arch='x86_64'
	export max_uptime=2100
	export initrd='/osimage/debian/debian-11.1-x86_64-20220510.cgz'
	export bootloader_append='root=/dev/ram0
RESULT_ROOT=/result/netperf/cs-localhost-performance-ipv4-200%-300s-TCP_MAERTS/lkp-icl-2sp2/debian-11.1-x86_64-20220510.cgz/x86_64-rhel-8.3/gcc-12/86bfbb7ce4f67a88df2639198169b685668e7349/3
BOOT_IMAGE=/pkg/linux/x86_64-rhel-8.3/gcc-12/86bfbb7ce4f67a88df2639198169b685668e7349/vmlinuz-6.5.0-rc2-00018-g86bfbb7ce4f6
branch=tip/sched/eevdf
job=/lkp/jobs/scheduled/lkp-icl-2sp2/netperf-cs-localhost-performance-ipv4-200%-300s-TCP_MAERTS-debian-11.1-x86_64-20220510.cgz-86bfbb7ce4f6-20230724-49416-roxmbx-4.yaml
user=lkp
ARCH=x86_64
kconfig=x86_64-rhel-8.3
commit=86bfbb7ce4f67a88df2639198169b685668e7349
nmi_watchdog=0
max_uptime=2100
LKP_SERVER=internal-lkp-server
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
	export modules_initrd='/pkg/linux/x86_64-rhel-8.3/gcc-12/86bfbb7ce4f67a88df2639198169b685668e7349/modules.cgz'
	export bm_initrd='/osimage/deps/debian-11.1-x86_64-20220510.cgz/run-ipconfig_20220515.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/lkp_20220513.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/rsync-rootfs_20220515.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/netperf_20220627.cgz,/osimage/pkg/debian-11.1-x86_64-20220510.cgz/netperf-x86_64-2.7-0_20220627.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/mpstat_20220516.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/turbostat_20220514.cgz,/osimage/pkg/debian-11.1-x86_64-20220510.cgz/turbostat-x86_64-210e04ff7681-1_20220518.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/perf_20230522.cgz,/osimage/pkg/debian-11.1-x86_64-20220510.cgz/perf-x86_64-00c7b5f4ddc5-1_20230402.cgz,/osimage/pkg/debian-11.1-x86_64-20220510.cgz/sar-x86_64-c5bb321-1_20220518.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/hw_20220526.cgz'
	export ucode_initrd='/osimage/ucode/intel-ucode-20230406.cgz'
	export lkp_initrd='/osimage/user/lkp/lkp-x86_64.cgz'
	export site='lkp-wsx01'
	export LKP_CGI_PORT=80
	export LKP_CIFS_PORT=139
	export node_roles='server client'
	export job_initrd='/lkp/jobs/scheduled/lkp-icl-2sp2/netperf-cs-localhost-performance-ipv4-200%-300s-TCP_MAERTS-debian-11.1-x86_64-20220510.cgz-86bfbb7ce4f6-20230724-49416-roxmbx-4.cgz'
	export last_kernel='6.5.0-rc2-07106-g241ca7ef5c81'
	export acpi_rsdp='0x000f05b0'
	export repeat_to=6
	export kbuild_queue_analysis=1
	export kernel='/pkg/linux/x86_64-rhel-8.3/gcc-12/86bfbb7ce4f67a88df2639198169b685668e7349/vmlinuz-6.5.0-rc2-00018-g86bfbb7ce4f6'
	export result_root='/result/netperf/cs-localhost-performance-ipv4-200%-300s-TCP_MAERTS/lkp-icl-2sp2/debian-11.1-x86_64-20220510.cgz/x86_64-rhel-8.3/gcc-12/86bfbb7ce4f67a88df2639198169b685668e7349/3'

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

	if role server
	then
		start_daemon $LKP_SRC/daemon/wrapper netserver
	fi

	if role client
	then
		run_test test='TCP_MAERTS' $LKP_SRC/tests/wrapper netperf
	fi
}

extract_stats()
{
	export stats_part_begin=
	export stats_part_end=

	env test='TCP_MAERTS' $LKP_SRC/stats/wrapper netperf
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

	$LKP_SRC/stats/wrapper time netperf.time
	$LKP_SRC/stats/wrapper dmesg
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper last_state
	$LKP_SRC/stats/wrapper stderr
	$LKP_SRC/stats/wrapper time
}

"$@"

--rPIyn3lZ0OrwwLB2
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="job.yaml"

---

#! jobs/netperf.yaml
suite: netperf
testcase: netperf
category: benchmark

# upto 90% CPU cycles may be used by latency stats
disable_latency_stats: 1
set_nic_irq_affinity: 1
ip: ipv4
runtime: 300s
nr_threads: 200%
cluster: cs-localhost
if role server:
  netserver:
if role client:
  netperf:
    test: TCP_MAERTS
job_origin: netperf.yaml

#! queue options
queue_cmdline_keys:
- branch
- commit
- kbuild_queue_analysis
queue: bisect
testbox: lkp-icl-2sp2
tbox_group: lkp-icl-2sp2
submit_id: 64bd4909609b4a2a95cd393f
job_file: "/lkp/jobs/scheduled/lkp-icl-2sp2/netperf-cs-localhost-performance-ipv4-200%-300s-TCP_MAERTS-debian-11.1-x86_64-20220510.cgz-86bfbb7ce4f6-20230723-10901-6ujq2z-0.yaml"
id: 042b6779d724fb75b73d4262bdeae2ea35fae0fe
queuer_version: "/zday/lkp"

#! /db/releases/20230719215029/lkp-src/hosts/lkp-icl-2sp2
model: Ice Lake
nr_node: 2
nr_cpu: 128
memory: 256G
nr_ssd_partitions: 4
ssd_partitions:
- "/dev/disk/by-id/nvme-INTEL_SSDPE2KX040T7_PHLF7414019F4P0IGN-part2"
- "/dev/disk/by-id/nvme-INTEL_SSDPE2KX040T7_PHLF7414019F4P0IGN-part3"
- "/dev/disk/by-id/nvme-INTEL_SSDPE21K375GA_PHKE734100DV375AGN-part1"
- "/dev/disk/by-id/nvme-INTEL_SSDPE21K375GA_PHKE734200JC375AGN-part1"
swap_partitions:
rootfs_partition: "/dev/disk/by-id/nvme-INTEL_SSDPE2KX040T7_PHLF7414019F4P0IGN-part1"
brand: Intel(R) Xeon(R) Gold 6338 CPU @ 2.00GHz

#! /db/releases/20230719215029/lkp-src/include/category/benchmark
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

#! /db/releases/20230719215029/lkp-src/include/category/ALL
cpufreq_governor: performance
sanity-check:

#! /db/releases/20230719215029/lkp-src/include/queue/cyclic
commit: 86bfbb7ce4f67a88df2639198169b685668e7349

#! /db/releases/20230719215029/lkp-src/include/testbox/lkp-icl-2sp2
netconsole_port: 6680
ucode: '0xd000389'
kconfig: x86_64-rhel-8.3
enqueue_time: 2023-07-23 23:36:41.285403324 +08:00
_id: 64bd4909609b4a2a95cd393f
_rt: "/result/netperf/cs-localhost-performance-ipv4-200%-300s-TCP_MAERTS/lkp-icl-2sp2/debian-11.1-x86_64-20220510.cgz/x86_64-rhel-8.3/gcc-12/86bfbb7ce4f67a88df2639198169b685668e7349"
compiler: gcc-12
head_commit: cd875ef432fda9d248c23f18d539b75794046b6f
base_commit: fdf0eaf11452d72945af31804e2a1048ee1b574c
branch: linux-devel/devel-hourly-20230721-143654
rootfs: debian-11.1-x86_64-20220510.cgz

#! schedule options
user: lkp
LKP_SERVER: internal-lkp-server
scheduler_version: "/lkp/lkp/src"
arch: x86_64
max_uptime: 2100
initrd: "/osimage/debian/debian-11.1-x86_64-20220510.cgz"
bootloader_append:
- root=/dev/ram0
- RESULT_ROOT=/result/netperf/cs-localhost-performance-ipv4-200%-300s-TCP_MAERTS/lkp-icl-2sp2/debian-11.1-x86_64-20220510.cgz/x86_64-rhel-8.3/gcc-12/86bfbb7ce4f67a88df2639198169b685668e7349/0
- BOOT_IMAGE=/pkg/linux/x86_64-rhel-8.3/gcc-12/86bfbb7ce4f67a88df2639198169b685668e7349/vmlinuz-6.5.0-rc2-00018-g86bfbb7ce4f6
- branch=linux-devel/devel-hourly-20230721-143654
- job=/lkp/jobs/scheduled/lkp-icl-2sp2/netperf-cs-localhost-performance-ipv4-200%-300s-TCP_MAERTS-debian-11.1-x86_64-20220510.cgz-86bfbb7ce4f6-20230723-10901-6ujq2z-0.yaml
- user=lkp
- ARCH=x86_64
- kconfig=x86_64-rhel-8.3
- commit=86bfbb7ce4f67a88df2639198169b685668e7349
- nmi_watchdog=0
- max_uptime=2100
- LKP_SERVER=internal-lkp-server
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
modules_initrd: "/pkg/linux/x86_64-rhel-8.3/gcc-12/86bfbb7ce4f67a88df2639198169b685668e7349/modules.cgz"
bm_initrd: "/osimage/deps/debian-11.1-x86_64-20220510.cgz/lkp_20220513.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/run-ipconfig_20220515.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/rsync-rootfs_20220515.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/netperf_20220627.cgz,/osimage/pkg/debian-11.1-x86_64-20220510.cgz/netperf-x86_64-2.7-0_20220627.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/mpstat_20220516.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/turbostat_20220514.cgz,/osimage/pkg/debian-11.1-x86_64-20220510.cgz/turbostat-x86_64-210e04ff7681-1_20220518.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/perf_20230522.cgz,/osimage/pkg/debian-11.1-x86_64-20220510.cgz/perf-x86_64-00c7b5f4ddc5-1_20230402.cgz,/osimage/pkg/debian-11.1-x86_64-20220510.cgz/sar-x86_64-c5bb321-1_20220518.cgz,/osimage/deps/debian-11.1-x86_64-20220510.cgz/hw_20220526.cgz"
ucode_initrd: "/osimage/ucode/intel-ucode-20230406.cgz"
lkp_initrd: "/osimage/user/lkp/lkp-x86_64.cgz"
site: lkp-wsx01

#! /db/releases/20230721222328/lkp-src/include/site/lkp-wsx01
LKP_CGI_PORT: 80
LKP_CIFS_PORT: 139
oom-killer:
watchdog:
node_roles: server client
job_initrd: "/lkp/jobs/scheduled/lkp-icl-2sp2/netperf-cs-localhost-performance-ipv4-200%-300s-TCP_MAERTS-debian-11.1-x86_64-20220510.cgz-86bfbb7ce4f6-20230723-10901-6ujq2z-0.cgz"
last_kernel: 6.5.0-rc2-01317-gaceb17b6d943
acpi_rsdp: '0x000f05b0'
repeat_to: 3

#! user overrides
kbuild_queue_analysis: 1
kernel: "/pkg/linux/x86_64-rhel-8.3/gcc-12/86bfbb7ce4f67a88df2639198169b685668e7349/vmlinuz-6.5.0-rc2-00018-g86bfbb7ce4f6"
result_root: "/result/netperf/cs-localhost-performance-ipv4-200%-300s-TCP_MAERTS/lkp-icl-2sp2/debian-11.1-x86_64-20220510.cgz/x86_64-rhel-8.3/gcc-12/86bfbb7ce4f67a88df2639198169b685668e7349/0"

#! /db/releases/20230723201600/lkp-src/include/site/lkp-wsx01
dequeue_time: 2023-07-23 23:51:40.479572770 +08:00
job_state: finished
loadavg: 102.92 183.81 95.54 1/1190 13122
start_time: '1690127606'
end_time: '1690127911'
version: "/lkp/lkp/.src-20230723-000404:21afd11b9aae:4b685812345f"

--rPIyn3lZ0OrwwLB2
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="reproduce"


for cpu_dir in /sys/devices/system/cpu/cpu[0-9]*
do
	online_file="$cpu_dir"/online
	[ -f "$online_file" ] && [ "$(cat "$online_file")" -eq 0 ] && continue

	file="$cpu_dir"/cpufreq/scaling_governor
	[ -f "$file" ] && echo "performance" > "$file"
done

netserver -4 -D
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
netperf -4 -H 127.0.0.1 -t TCP_MAERTS -c -C -l 300  &
wait

--rPIyn3lZ0OrwwLB2--
