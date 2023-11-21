Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E83318048
	for <oe-lkp@lists.linux.dev>; Tue, 21 Nov 2023 08:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ipjrAYpS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700554986; x=1732090986;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=RoH2sJuaCAWNynaGd5gv/cAdLc6GeyQ8/hx+nsNp9fU=;
  b=ipjrAYpSRZj1s8w6eNFCmErnii2hUbz0Zu3LAP2Aaqwt25vsyrzFVR++
   HXXxm4V/7b7t/WArj4h6cEGCABj6+5C7fUmx0oXJk4OFC2HuR7ITa3qkO
   IMRd4HM+g973AVkSIF9wW+V0MCV+tkn6/SqDYtbARGcadco5Zfh+XDFMT
   qFPoKmN1fvIDg+B0aJx1wlgBIZY+f3QR8PBIfPYJg+F2uxzxsQgy6PBQA
   WHAYI7NLxQCz6VeP/yGWBjsNxTvR/OaE8du8KvcixeFTeovsD1phKPrJA
   cIW1Wug3FRkNaSbjPHGmLDw+4fGyAh1tbhgov+EU+LHQLN6woZMZVR6gm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="391568960"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="391568960"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 00:23:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="770179366"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="770179366"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 Nov 2023 00:23:04 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 21 Nov 2023 00:23:04 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 21 Nov 2023 00:23:03 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 21 Nov 2023 00:23:03 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 21 Nov 2023 00:23:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g/nCRFELx/Nw+wIrSmD9vz+dk9cRVzEuc1Y/AOZk79zSJCwIlX5u5OK9n0WP7mFn+I/NdhuERtQBFXyIIx+7GB7XAV5kOfeIj3dCXy3WraoXhMxKGl7E1mYaS74JUP5CSXSJqQc8c6m+Vgqtpi4qP1n9Nc8PfBuShyB/RiVK7PpWzAKEz2xwayMM4jnWTCiX7Vw8DGVZPUQvVTUhJC7YhbF3DeiZrEvufsPKWho7RV6so6MGMIoMVo69OPsCpNfIy0K6Tae0wGdEwgVvOoeaGbIQ/TIDpbr1g/wDhGj95MXnyhiD9N2VESSExdyxLiaZdBeHozq0dEc6sRMd4vhFhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rMxF2X4HGYLEzLbuHo52vpzo3TZbtm8QrJBGpOV9Tzk=;
 b=KOWbZW8NC28EyHcXgvwFPxFuZt39tW9LOc1/7D7dxlI9f/xh8r0sZXHAi9biLOhRUwDBR6Kdpa7VOer6V5xCxf72g//ZIduRA3HMJ8eCa1ik6W5mwFtY+uwv08EAWfUAVB82TNa/vBpDk8aos1qIECHKhyu+SVNphKpv2n0Z+PyPTuiy00pcRzxKEJejR4PWHf20iO4DHXopotn6EHrlCnPdH5/wAJ/GH+KFIMO/bP+ZzyfGp2VnVJifbKqOFxjUwp2nvnk/uAM+QFi4lFwYNQXI/q8q3I/p55+73WLu1LTi8APfRRKoM5Bd/XE27oWQDo7UKXZv4nlaGQt0hOwKZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MW4PR11MB6666.namprd11.prod.outlook.com (2603:10b6:303:1eb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Tue, 21 Nov
 2023 08:22:59 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::1236:9a2e:5acd:a7f]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::1236:9a2e:5acd:a7f%3]) with mapi id 15.20.7002.027; Tue, 21 Nov 2023
 08:22:59 +0000
Date: Tue, 21 Nov 2023 16:22:49 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Chengming Zhou <zhouchengming@bytedance.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Linux Memory Management List
	<linux-mm@kvack.org>, Vlastimil Babka <vbabka@suse.cz>, Hyeonggon Yoo
	<42.hyeyoo@gmail.com>, <ying.huang@intel.com>, <feng.tang@intel.com>,
	<fengwei.yin@intel.com>, <oliver.sang@intel.com>
Subject: [linux-next:master] [slub]  c8d312e039:  hackbench.throughput 13.0%
 improvement
Message-ID: <202311211510.d06bb4ec-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0006.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::22) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MW4PR11MB6666:EE_
X-MS-Office365-Filtering-Correlation-Id: 69cf4698-ef80-4c68-728f-08dbea6b11c4
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: obhdMH1JimDW295c3WLzHfuidCHk0ntAka/NLW/dnWyH0+jjuqPBdmYiIT8Q2kg7yOeTXaibJ51wYSFJwXMeab9a9MEgdV/1+Kocek8kzPIDG+d/8IaoU3rA94aGqki7pOLK3Cz+pAJJJX2Kc5Pctp9bR3V4pGtdzmwww/CFfW5j6dXkghm/R+wW9y3mFwcVHbvsAIiQeOjoDI0cUvNLxLMHETGZ9m8fhTsD+SQbE2z8YPcvZBkgbP3Icd3zpqf26p+OHl3qXm4lq3xfAehZP3hivxQaRLlOsy8Gkio5i5/syhxNhLU+3F2h+vOoame9pMqC8w0AFcxFY3CJaM07xtFeIsGh54mgBTsI5TpTtnPTFmkOI1ilQRkSZR4NEojunKS9Mq/BRHOJ8nC4WAw0P14tNEjPvqGZPEURFRkT3KbublHWy01pN9NsrjLIhpoKNVTBHzoWOFjWPWqfSBrXSbTei0V2ebtvogoGiBZA09wW6Aad4Tgb3Wa7hohrK8VCLbd64gfQ37d0qAxMFGV2gy7teO2pAjfHMwK47KyQNaX0qH8pZfBtslptMAXPFktQoDgEXU/E/m/JmbnNFpWDtf6GzWA5qXJlK15PWZ9YH6CmRezxyjhhfIH3QVchqpgc0W2atO7r0GdlrRxxy+wHhg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(346002)(366004)(376002)(230473577357003)(230373577357003)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(66946007)(66556008)(66476007)(54906003)(38100700002)(36756003)(82960400001)(86362001)(6512007)(26005)(83380400001)(1076003)(6506007)(2616005)(107886003)(6666004)(19627235002)(6486002)(966005)(30864003)(2906002)(6916009)(316002)(478600001)(8936002)(8676002)(4326008)(5660300002)(41300700001)(579004)(559001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?QHle88AU4+yetUSGoXlnryKTrnviSKeGbt7VFGKVWd69fowTXckPFhr2SY?=
 =?iso-8859-1?Q?6jFOc/XlMbBh02F1i33Hb8s8TxgfXAofNOrEFBT7gq8qJFRE11MFzh7R5R?=
 =?iso-8859-1?Q?+ZoIKg0gLxFYpkuAlQgNaEmUVFagS+YUDFYz8bg8kkNnyCk8utjBD9AoG0?=
 =?iso-8859-1?Q?XiF6SJBxsVQCCj+NdpAfYRaNXMU9VWlfqpoCvGL5r5WgPkR1RGKDNI6U40?=
 =?iso-8859-1?Q?Q8hfyI8rMGZwxXegaVnz8NoV4lNYYcjb0IsXrmbuU8xbtI5EQ5uubR2tDe?=
 =?iso-8859-1?Q?aCdKnVPMZD0EXd3zvRBDXizDlW2dP/EsuH3LsR073qfuIGCLfD5wH/yeoX?=
 =?iso-8859-1?Q?HpRpygKZqN/Mnxy+2PRXSwsKJkdveHEBpicxBQ+29oxmDLcuolOYsGaTgX?=
 =?iso-8859-1?Q?D8tV4TyRp1atZgqwt4JkcIEzv7GuQMrXYVTzVKtOfKy3EI2AoytCkMuciX?=
 =?iso-8859-1?Q?RM2FcpBoi6ntSypFxv/jeEU+K5i+lnPi8aqV5kL1M8a5AAs2sZ0rnp8+wr?=
 =?iso-8859-1?Q?n1OfpviJ7laRNrn46GjbqO0tMp8yLdFLSzPEuOtUcnimDm8VThorrmTc3r?=
 =?iso-8859-1?Q?8FuOCVG0+dzJUMi7Y7uMtyBUk+vAFmvv/HeOlLFy3/crr6BP2bdp0I6lQW?=
 =?iso-8859-1?Q?ohTmGELRPfZHH3P4MNYDpiHE1P4nZtXanGZ8bgKabA0C4vaj/aI8Lv/OK2?=
 =?iso-8859-1?Q?0YiJlQt9jIzfwY/gRsLrmC8q4eoCchYoAcfvL8K2g3mRBLeSJjvggmHUIX?=
 =?iso-8859-1?Q?6l7LTtzgqMLlnl5Nsm12y6e21/5+LXeSGPEc1Wq88bJ0J+CdwxJmf0Gy4x?=
 =?iso-8859-1?Q?iM8PqTmYtvN0dT23mrg7i+cXyM6wyAxIn3qu+QA20MacDAP0Osh+TCUXSK?=
 =?iso-8859-1?Q?6UTYhUTxfO1XLB7b67wp5O0fSjIU4I7VusMJLbCYA8heVgjneD9cweBijx?=
 =?iso-8859-1?Q?tq1VZ4MxRDWZGcc5iMv/j086hLWOKzbEYajBb0u1M5TyrF8Y06SDX/pwZ8?=
 =?iso-8859-1?Q?6zcg9bNF0En6oy/qD/m927T8PdjzyoABR3p7QFgCXmFEAYdXL+2LJ84FJ+?=
 =?iso-8859-1?Q?XKnCUy1CujHe5l5f/7aY2IQKnMx2/psLxPnNrJpF/Z9j5X9p0yCnzJKQcA?=
 =?iso-8859-1?Q?cJ1Y0wnftqiiD2EJ7x/rPDhAJQM4JAR9zYPL8Xq6GjBcBPJ9QO+gwKNUPO?=
 =?iso-8859-1?Q?XPofD+AaB7emLFoTG0z4WcqP/biCyb1ES/4AV6OpKUoVjxz02GKCZQjkIp?=
 =?iso-8859-1?Q?pwkgcStBQHnyQ5so3vRvIlOsnYxnWp8YRw0bEt8rc6G8YOM85Ea3x3mTzq?=
 =?iso-8859-1?Q?CoWUMlzGdTn7cDuPFhDIC3uiqTZ0FmAXAM0nQpHjSq/42NCo708BF+M75S?=
 =?iso-8859-1?Q?Ea2P1rLRqB7aTCdSXfAsU1e6MU4QDjjoHa045N0vmx+OEKIqPJmmHsszNE?=
 =?iso-8859-1?Q?KFFtefuadOLbyEevs1taaAXC/cnTSr3Su6WvLuKFyJp95mKL0jeoI+CXcO?=
 =?iso-8859-1?Q?Tl2oxqGllE9dOdhmUhng0ET2AU862Y5sMwA41Yixmcd/PiWrBhVH0HHHzz?=
 =?iso-8859-1?Q?iRBwohcKElp1T0hVlNXqwVncuSj9EbvQYEsq2taBuVSThMwFBGnRD8BLKk?=
 =?iso-8859-1?Q?vneXRYjSi2raU1RwRZ8z3FBbhhuz1PgYqP5hXNNW8bEnWUvqw70iXFWg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 69cf4698-ef80-4c68-728f-08dbea6b11c4
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 08:22:58.9703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t3uTyJ+AsxUuJ0MpL8n09/4+XOD7y3fUWlrXhjkzWFN5rk+E5ISV7ScnlFTGUXvFfWiEi7jpXq0Cu8fJVHpNOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6666
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 13.0% improvement of hackbench.throughput on:


commit: c8d312e039030edab25836a326bcaeb2a3d4db14 ("slub: Delay freezing of partial slabs")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

testcase: hackbench
test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory
parameters:

	nr_threads: 50%
	iterations: 4
	mode: threads
	ipc: socket
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+-----------------------------------------------------------------------------------------------+
| testcase: change | hackbench: hackbench.throughput 3.8% improvement                                              |
| test machine     | 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2.00GHz (Ice Lake) with 256G memory    |
| test parameters  | cpufreq_governor=performance                                                                  |
|                  | ipc=socket                                                                                    |
|                  | iterations=4                                                                                  |
|                  | mode=process                                                                                  |
|                  | nr_threads=50%                                                                                |
+------------------+-----------------------------------------------------------------------------------------------+




Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20231121/202311211510.d06bb4ec-oliver.sang@intel.com

=========================================================================================
compiler/cpufreq_governor/ipc/iterations/kconfig/mode/nr_threads/rootfs/tbox_group/testcase:
  gcc-12/performance/socket/4/x86_64-rhel-8.3/threads/50%/debian-11.1-x86_64-20220510.cgz/lkp-spr-r02/hackbench

commit: 
  00b15a19ee ("slub: Introduce freeze_slab()")
  c8d312e039 ("slub: Delay freezing of partial slabs")

00b15a19ee543f01 c8d312e039030edab25836a326b 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    523889 ± 21%     -36.5%     332913 ± 34%  numa-meminfo.node1.AnonPages.max
      2087 ±  8%     +12.8%       2354 ±  7%  perf-c2c.DRAM.remote
   4331250 ±  7%     -16.1%    3631875 ±  7%  proc-vmstat.unevictable_pgs_scanned
     11778 ±  9%     +17.8%      13873        sched_debug.cpu.curr->pid.avg
     67435 ± 17%     +39.2%      93869 ± 17%  sched_debug.cpu.nr_switches.stddev
   4695177 ±  3%     +19.5%    5609624        vmstat.system.cs
    869277 ±  2%     +19.4%    1037802        vmstat.system.in
      1.04            +0.2        1.20        mpstat.cpu.all.irq%
      0.03 ±  4%      +0.0        0.04 ±  2%  mpstat.cpu.all.soft%
      5.13 ±  3%      +1.0        6.15        mpstat.cpu.all.usr%
      0.17 ± 13%      +0.1        0.22 ±  6%  turbostat.C1%
      0.32           +13.4%       0.37        turbostat.IPC
     90.44 ±  2%     +14.7      105.11        turbostat.PKG_%
    599288 ±  4%     +23.3%     739042 ±  6%  turbostat.POLL
     21.01            +3.7%      21.78        turbostat.RAMWatt
    617318           +13.0%     697416        hackbench.throughput
    598514           +14.4%     684462        hackbench.throughput_avg
    617318           +13.0%     697416        hackbench.throughput_best
    572244           +15.1%     658588        hackbench.throughput_worst
    176.95           -12.4%     154.95        hackbench.time.elapsed_time
    176.95           -12.4%     154.95        hackbench.time.elapsed_time.max
 1.656e+08            +2.8%  1.702e+08        hackbench.time.involuntary_context_switches
     36017           -14.0%      30972        hackbench.time.system_time
      1987            +3.3%       2052        hackbench.time.user_time
 6.275e+10 ±  4%     +13.2%  7.102e+10        perf-stat.i.branch-instructions
 3.082e+08 ±  4%     +12.1%  3.453e+08        perf-stat.i.branch-misses
      3.22 ±  5%      +0.2        3.46 ±  2%  perf-stat.i.cache-miss-rate%
  76571285 ±  4%     +20.7%   92432946 ±  2%  perf-stat.i.cache-misses
 2.504e+09 ±  4%     +14.6%  2.869e+09        perf-stat.i.cache-references
   4755923 ±  4%     +19.4%    5677973        perf-stat.i.context-switches
      1.87 ±  3%     -12.9%       1.63        perf-stat.i.cpi
    568753 ±  4%     +13.6%     646372        perf-stat.i.cpu-migrations
      8666 ±  4%     -18.8%       7037 ±  2%  perf-stat.i.cycles-between-cache-misses
   9208258 ±  8%     +30.2%   11991181 ± 11%  perf-stat.i.dTLB-load-misses
 9.064e+10 ±  4%     +14.0%  1.033e+11        perf-stat.i.dTLB-loads
   5.5e+10 ±  4%     +16.3%  6.398e+10        perf-stat.i.dTLB-stores
 3.356e+11 ±  4%     +13.9%  3.824e+11        perf-stat.i.instructions
      0.54           +14.1%       0.62        perf-stat.i.ipc
    940.99 ±  4%     +14.3%       1075        perf-stat.i.metric.M/sec
      8058 ±  5%     +16.9%       9418 ±  3%  perf-stat.i.minor-faults
  13116654 ±  3%     +17.3%   15384778 ±  4%  perf-stat.i.node-load-misses
      8058 ±  5%     +16.9%       9418 ±  3%  perf-stat.i.page-faults
      0.23 ±  2%      +5.6%       0.24 ±  2%  perf-stat.overall.MPKI
      1.83           -11.2%       1.62        perf-stat.overall.cpi
      7976 ±  2%     -16.0%       6703 ±  2%  perf-stat.overall.cycles-between-cache-misses
      0.55           +12.6%       0.62        perf-stat.overall.ipc
 6.256e+10 ±  3%     +12.9%  7.061e+10        perf-stat.ps.branch-instructions
 3.071e+08 ±  3%     +11.7%  3.431e+08        perf-stat.ps.branch-misses
  76645185 ±  3%     +20.0%   91985443 ±  2%  perf-stat.ps.cache-misses
 2.501e+09 ±  3%     +14.1%  2.854e+09        perf-stat.ps.cache-references
   4734725 ±  3%     +19.3%    5647562        perf-stat.ps.context-switches
    568804 ±  3%     +13.1%     643041        perf-stat.ps.cpu-migrations
   9839896 ±  8%     +30.4%   12827789 ± 10%  perf-stat.ps.dTLB-load-misses
 9.038e+10 ±  3%     +13.7%  1.027e+11        perf-stat.ps.dTLB-loads
 5.484e+10 ±  3%     +16.0%  6.362e+10        perf-stat.ps.dTLB-stores
 3.347e+11 ±  3%     +13.6%  3.802e+11        perf-stat.ps.instructions
      7688 ±  5%     +14.4%       8792 ±  3%  perf-stat.ps.minor-faults
  13160460 ±  3%     +16.3%   15304482 ±  4%  perf-stat.ps.node-load-misses
      7688 ±  5%     +14.4%       8792 ±  3%  perf-stat.ps.page-faults
 6.072e+13            -2.0%  5.948e+13        perf-stat.total.instructions
     11.63 ± 13%      -5.3        6.38 ±  6%  perf-profile.calltrace.cycles-pp.__unfreeze_partials.skb_release_data.consume_skb.unix_stream_read_generic.unix_stream_recvmsg
     11.28 ± 14%      -5.2        6.10 ±  6%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__unfreeze_partials.skb_release_data.consume_skb
     11.39 ± 14%      -5.2        6.24 ±  6%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__unfreeze_partials.skb_release_data.consume_skb.unix_stream_read_generic
     16.09 ±  9%      -4.4       11.70 ±  2%  perf-profile.calltrace.cycles-pp.skb_release_data.consume_skb.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
     21.92            -3.8       18.15 ±  2%  perf-profile.calltrace.cycles-pp.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
     22.11            -3.7       18.37 ±  2%  perf-profile.calltrace.cycles-pp.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter.vfs_write
     19.14 ±  7%      -3.7       15.40        perf-profile.calltrace.cycles-pp.consume_skb.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      7.82 ± 13%      -3.5        4.32 ±  6%  perf-profile.calltrace.cycles-pp.get_partial_node.___slab_alloc.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve
      7.47 ± 14%      -3.4        4.04 ±  6%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.get_partial_node.___slab_alloc.__kmem_cache_alloc_node.__kmalloc_node_track_caller
      7.44 ± 14%      -3.4        4.02 ±  6%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.get_partial_node.___slab_alloc.__kmem_cache_alloc_node
      8.31 ± 13%      -3.4        4.96 ±  5%  perf-profile.calltrace.cycles-pp.___slab_alloc.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
     23.82            -3.3       20.51 ±  2%  perf-profile.calltrace.cycles-pp.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write
     45.82            -3.2       42.59        perf-profile.calltrace.cycles-pp.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter.vfs_read
     46.08            -3.2       42.90        perf-profile.calltrace.cycles-pp.unix_stream_recvmsg.sock_recvmsg.sock_read_iter.vfs_read.ksys_read
     46.71            -3.1       43.66        perf-profile.calltrace.cycles-pp.sock_recvmsg.sock_read_iter.vfs_read.ksys_read.do_syscall_64
     47.22            -3.0       44.24        perf-profile.calltrace.cycles-pp.sock_read_iter.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      9.54 ± 12%      -2.9        6.60 ±  8%  perf-profile.calltrace.cycles-pp.__unfreeze_partials.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      9.20 ± 12%      -2.9        6.33 ±  8%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__unfreeze_partials.unix_stream_read_generic.unix_stream_recvmsg
     10.74 ±  9%      -2.9        7.88 ±  3%  perf-profile.calltrace.cycles-pp.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb.alloc_skb_with_frags
      9.31 ± 12%      -2.9        6.46 ±  8%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__unfreeze_partials.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
     11.03 ±  9%      -2.8        8.21 ±  3%  perf-profile.calltrace.cycles-pp.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
     11.30 ±  9%      -2.8        8.54 ±  3%  perf-profile.calltrace.cycles-pp.kmalloc_reserve.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg
     48.67            -2.7       45.95        perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read
     49.78            -2.5       47.27        perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read.start_thread
     50.67            -2.3       48.33        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read.start_thread
     50.86            -2.3       48.56        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__libc_read.start_thread
     52.23            -2.1       50.15        perf-profile.calltrace.cycles-pp.__libc_read.start_thread
      6.40 ± 11%      -2.0        4.45 ±  8%  perf-profile.calltrace.cycles-pp.get_partial_node.___slab_alloc.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags
      6.07 ± 12%      -1.9        4.17 ±  8%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.get_partial_node.___slab_alloc.kmem_cache_alloc_node.__alloc_skb
      6.04 ± 12%      -1.9        4.15 ±  8%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.get_partial_node.___slab_alloc.kmem_cache_alloc_node
      6.86 ± 11%      -1.8        5.04 ±  7%  perf-profile.calltrace.cycles-pp.___slab_alloc.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
     35.95            -0.3       35.65        perf-profile.calltrace.cycles-pp.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write.do_syscall_64
      0.53            +0.1        0.61        perf-profile.calltrace.cycles-pp.mod_objcg_state.kmem_cache_free.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      0.52            +0.1        0.60        perf-profile.calltrace.cycles-pp.mod_objcg_state.__kmem_cache_free.skb_release_data.consume_skb.unix_stream_read_generic
      0.54            +0.1        0.63        perf-profile.calltrace.cycles-pp.unix_write_space.sock_wfree.unix_destruct_scm.skb_release_head_state.consume_skb
      0.55            +0.1        0.65        perf-profile.calltrace.cycles-pp._copy_from_iter.skb_copy_datagram_from_iter.unix_stream_sendmsg.sock_write_iter.vfs_write
      0.65            +0.1        0.75        perf-profile.calltrace.cycles-pp.__check_object_size.skb_copy_datagram_from_iter.unix_stream_sendmsg.sock_write_iter.vfs_write
      0.59 ±  6%      +0.1        0.70 ±  7%  perf-profile.calltrace.cycles-pp.__fdget_pos.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read
      0.58            +0.1        0.70        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read.start_thread
      0.60            +0.1        0.73        perf-profile.calltrace.cycles-pp.__pthread_enable_asynccancel.start_thread
      0.52            +0.1        0.66 ±  2%  perf-profile.calltrace.cycles-pp.dequeue_task_fair.__schedule.schedule.schedule_timeout.unix_stream_data_wait
      0.60 ±  3%      +0.2        0.75 ±  3%  perf-profile.calltrace.cycles-pp.security_socket_sendmsg.sock_write_iter.vfs_write.ksys_write.do_syscall_64
      1.01            +0.2        1.18        perf-profile.calltrace.cycles-pp.__slab_free.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      0.45 ± 44%      +0.2        0.62 ±  7%  perf-profile.calltrace.cycles-pp.__fget_light.__fdget_pos.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.84            +0.2        1.01        perf-profile.calltrace.cycles-pp.memcg_slab_post_alloc_hook.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      0.73            +0.2        0.92        perf-profile.calltrace.cycles-pp.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_wake_up.autoremove_wake_function
      0.76            +0.2        0.95        perf-profile.calltrace.cycles-pp.activate_task.ttwu_do_activate.try_to_wake_up.autoremove_wake_function.__wake_up_common
      1.38            +0.2        1.61        perf-profile.calltrace.cycles-pp.skb_copy_datagram_from_iter.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write
      0.89            +0.2        1.12        perf-profile.calltrace.cycles-pp.ttwu_do_activate.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_sync_key
      1.72            +0.3        1.98        perf-profile.calltrace.cycles-pp.__entry_text_start.__libc_write.start_thread
      1.69            +0.3        1.95        perf-profile.calltrace.cycles-pp.__entry_text_start.__libc_read.start_thread
      1.24            +0.3        1.50        perf-profile.calltrace.cycles-pp.memcg_slab_post_alloc_hook.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      1.12            +0.3        1.43 ±  2%  perf-profile.calltrace.cycles-pp.skb_set_owner_w.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter.vfs_write
      1.77 ±  2%      +0.4        2.13 ±  3%  perf-profile.calltrace.cycles-pp.__slab_free.skb_release_data.consume_skb.unix_stream_read_generic.unix_stream_recvmsg
      1.98            +0.4        2.37        perf-profile.calltrace.cycles-pp.__kmem_cache_free.skb_release_data.consume_skb.unix_stream_read_generic.unix_stream_recvmsg
      1.64 ±  3%      +0.4        2.04 ±  5%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.skb_queue_tail.unix_stream_sendmsg.sock_write_iter.vfs_write
      1.60            +0.4        2.00        perf-profile.calltrace.cycles-pp.__schedule.schedule.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic
      1.80            +0.4        2.21 ±  2%  perf-profile.calltrace.cycles-pp.__pthread_disable_asynccancel.start_thread
      1.73 ±  3%      +0.4        2.14 ±  5%  perf-profile.calltrace.cycles-pp.skb_queue_tail.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write
      1.64            +0.4        2.05        perf-profile.calltrace.cycles-pp.schedule.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
      2.00            +0.4        2.43 ±  2%  perf-profile.calltrace.cycles-pp.check_heap_object.__check_object_size.simple_copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter
      1.74            +0.4        2.18        perf-profile.calltrace.cycles-pp.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      1.76            +0.4        2.21 ±  2%  perf-profile.calltrace.cycles-pp.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_sync_key.sock_def_readable
      1.80            +0.5        2.25 ±  2%  perf-profile.calltrace.cycles-pp.autoremove_wake_function.__wake_up_common.__wake_up_sync_key.sock_def_readable.unix_stream_sendmsg
      1.88            +0.5        2.35 ±  2%  perf-profile.calltrace.cycles-pp.__wake_up_common.__wake_up_sync_key.sock_def_readable.unix_stream_sendmsg.sock_write_iter
      2.24            +0.5        2.71 ±  3%  perf-profile.calltrace.cycles-pp._copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic
      2.50            +0.5        3.02        perf-profile.calltrace.cycles-pp.__check_object_size.simple_copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor
      0.08 ±223%      +0.5        0.60        perf-profile.calltrace.cycles-pp.security_socket_recvmsg.sock_recvmsg.sock_read_iter.vfs_read.ksys_read
      2.13            +0.5        2.65        perf-profile.calltrace.cycles-pp.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      0.00            +0.5        0.52        perf-profile.calltrace.cycles-pp.mutex_lock.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      2.62            +0.5        3.15        perf-profile.calltrace.cycles-pp.simple_copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic
      0.00            +0.5        0.54        perf-profile.calltrace.cycles-pp.pick_next_task_fair.__schedule.schedule.schedule_timeout.unix_stream_data_wait
      2.50            +0.5        3.04 ±  2%  perf-profile.calltrace.cycles-pp.sock_wfree.unix_destruct_scm.skb_release_head_state.consume_skb.unix_stream_read_generic
      0.00            +0.5        0.54        perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read
      0.00            +0.5        0.55 ±  2%  perf-profile.calltrace.cycles-pp.skb_unlink.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      0.00            +0.6        0.56 ±  2%  perf-profile.calltrace.cycles-pp.enqueue_entity.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_wake_up
      2.01 ±  2%      +0.6        2.56 ±  4%  perf-profile.calltrace.cycles-pp.__get_file_rcu.__fget_light.__fdget_pos.ksys_write.do_syscall_64
      2.63            +0.6        3.20 ±  2%  perf-profile.calltrace.cycles-pp.unix_destruct_scm.skb_release_head_state.consume_skb.unix_stream_read_generic.unix_stream_recvmsg
      0.00            +0.6        0.56        perf-profile.calltrace.cycles-pp.obj_cgroup_charge.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      2.70            +0.6        3.28 ±  2%  perf-profile.calltrace.cycles-pp.skb_release_head_state.consume_skb.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      2.20 ±  3%      +0.6        2.78 ±  5%  perf-profile.calltrace.cycles-pp.__fget_light.__fdget_pos.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.27 ±  3%      +0.6        2.86 ±  5%  perf-profile.calltrace.cycles-pp.__fdget_pos.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
      0.00            +0.6        0.59 ±  5%  perf-profile.calltrace.cycles-pp.aa_sk_perm.security_socket_sendmsg.sock_write_iter.vfs_write.ksys_write
      2.17            +0.6        2.77 ±  2%  perf-profile.calltrace.cycles-pp.__wake_up_sync_key.sock_def_readable.unix_stream_sendmsg.sock_write_iter.vfs_write
      2.63 ±  2%      +0.8        3.43 ±  3%  perf-profile.calltrace.cycles-pp._raw_spin_lock.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write
      4.44            +0.8        5.26        perf-profile.calltrace.cycles-pp.kmem_cache_free.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
     41.38            +1.0       42.34        perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write.start_thread
      3.78 ±  2%      +1.0        4.79 ±  3%  perf-profile.calltrace.cycles-pp.sock_def_readable.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write
      5.02            +1.0        6.05 ±  2%  perf-profile.calltrace.cycles-pp.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic.unix_stream_recvmsg
      5.12            +1.0        6.16 ±  2%  perf-profile.calltrace.cycles-pp.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      5.18            +1.1        6.23 ±  2%  perf-profile.calltrace.cycles-pp.unix_stream_read_actor.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
     42.11            +1.1       43.19        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write.start_thread
     42.31            +1.1       43.42        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__libc_write.start_thread
     43.43            +1.3       44.75        perf-profile.calltrace.cycles-pp.__libc_write.start_thread
     34.93 ±  2%     -13.0       21.96 ±  6%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
     36.94 ±  2%     -12.7       24.29 ±  5%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
     21.20 ±  2%      -8.2       12.99 ±  6%  perf-profile.children.cycles-pp.__unfreeze_partials
     14.30 ±  2%      -5.4        8.85 ±  6%  perf-profile.children.cycles-pp.get_partial_node
     15.17 ±  2%      -5.2       10.00 ±  5%  perf-profile.children.cycles-pp.___slab_alloc
     16.12 ±  9%      -4.4       11.74 ±  2%  perf-profile.children.cycles-pp.skb_release_data
     22.00            -3.8       18.23 ±  2%  perf-profile.children.cycles-pp.__alloc_skb
     22.14            -3.7       18.40 ±  2%  perf-profile.children.cycles-pp.alloc_skb_with_frags
     19.18 ±  7%      -3.7       15.45        perf-profile.children.cycles-pp.consume_skb
     23.86            -3.3       20.56 ±  2%  perf-profile.children.cycles-pp.sock_alloc_send_pskb
     45.98            -3.2       42.76        perf-profile.children.cycles-pp.unix_stream_read_generic
     46.11            -3.2       42.92        perf-profile.children.cycles-pp.unix_stream_recvmsg
     46.76            -3.0       43.71        perf-profile.children.cycles-pp.sock_recvmsg
     47.25            -3.0       44.26        perf-profile.children.cycles-pp.sock_read_iter
     10.86 ±  9%      -2.8        8.01 ±  3%  perf-profile.children.cycles-pp.__kmem_cache_alloc_node
     11.08 ±  9%      -2.8        8.26 ±  3%  perf-profile.children.cycles-pp.__kmalloc_node_track_caller
     11.35 ±  9%      -2.8        8.60 ±  3%  perf-profile.children.cycles-pp.kmalloc_reserve
     48.74            -2.7       46.03        perf-profile.children.cycles-pp.vfs_read
     49.84            -2.5       47.33        perf-profile.children.cycles-pp.ksys_read
     53.04            -2.0       51.06        perf-profile.children.cycles-pp.__libc_read
     93.00            -1.3       91.74        perf-profile.children.cycles-pp.do_syscall_64
     93.28            -1.2       92.07        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     36.13            -0.3       35.85        perf-profile.children.cycles-pp.unix_stream_sendmsg
      0.06            -0.0        0.05        perf-profile.children.cycles-pp.native_irq_return_iret
      0.05            +0.0        0.06        perf-profile.children.cycles-pp.__x64_sys_read
      0.05            +0.0        0.06        perf-profile.children.cycles-pp.native_sched_clock
      0.05            +0.0        0.06        perf-profile.children.cycles-pp.__x64_sys_write
      0.06            +0.0        0.07 ±  5%  perf-profile.children.cycles-pp.update_min_vruntime
      0.13            +0.0        0.14 ±  2%  perf-profile.children.cycles-pp.unix_scm_to_skb
      0.07 ±  6%      +0.0        0.09 ±  8%  perf-profile.children.cycles-pp.cgroup_rstat_updated
      0.06            +0.0        0.07 ±  6%  perf-profile.children.cycles-pp.check_preempt_wakeup_fair
      0.11 ±  4%      +0.0        0.12 ±  3%  perf-profile.children.cycles-pp.maybe_add_creds
      0.07 ±  5%      +0.0        0.09 ±  8%  perf-profile.children.cycles-pp.os_xsave
      0.10 ±  4%      +0.0        0.12        perf-profile.children.cycles-pp.is_vmalloc_addr
      0.07 ±  7%      +0.0        0.08 ±  5%  perf-profile.children.cycles-pp.cpuacct_charge
      0.05 ±  8%      +0.0        0.07        perf-profile.children.cycles-pp.put_prev_entity
      0.08 ±  4%      +0.0        0.10 ±  3%  perf-profile.children.cycles-pp.fsnotify_perm
      0.32            +0.0        0.34        perf-profile.children.cycles-pp.__list_del_entry_valid_or_report
      0.13 ±  3%      +0.0        0.15 ±  2%  perf-profile.children.cycles-pp.rw_verify_area
      0.05            +0.0        0.07 ± 10%  perf-profile.children.cycles-pp.available_idle_cpu
      0.13 ±  3%      +0.0        0.15 ±  3%  perf-profile.children.cycles-pp.__mod_memcg_state
      0.10 ±  3%      +0.0        0.12 ±  3%  perf-profile.children.cycles-pp.refill_stock
      0.16 ±  3%      +0.0        0.18 ±  2%  perf-profile.children.cycles-pp.put_cpu_partial
      0.15            +0.0        0.17 ±  3%  perf-profile.children.cycles-pp.__scm_recv_common
      0.12            +0.0        0.14        perf-profile.children.cycles-pp.security_socket_getpeersec_dgram
      0.11 ±  3%      +0.0        0.13 ±  3%  perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
      0.07 ±  5%      +0.0        0.09 ±  5%  perf-profile.children.cycles-pp.update_rq_clock
      0.14 ±  2%      +0.0        0.16 ±  4%  perf-profile.children.cycles-pp.kfree
      0.12 ±  4%      +0.0        0.15 ±  2%  perf-profile.children.cycles-pp.check_stack_object
      0.12            +0.0        0.14 ±  3%  perf-profile.children.cycles-pp.current_obj_cgroup
      0.13 ±  4%      +0.0        0.16 ±  3%  perf-profile.children.cycles-pp.try_charge_memcg
      0.09 ±  4%      +0.0        0.11 ±  4%  perf-profile.children.cycles-pp.asm_sysvec_reschedule_ipi
      0.06            +0.0        0.08 ±  8%  perf-profile.children.cycles-pp.cpuidle_enter
      0.15 ±  2%      +0.0        0.18 ±  2%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
      0.16 ±  2%      +0.0        0.18 ±  2%  perf-profile.children.cycles-pp.__build_skb_around
      0.16 ±  3%      +0.0        0.19 ±  6%  perf-profile.children.cycles-pp.load_balance
      0.12 ±  4%      +0.0        0.15 ±  3%  perf-profile.children.cycles-pp.__mod_memcg_lruvec_state
      0.12            +0.0        0.15 ±  3%  perf-profile.children.cycles-pp.__dequeue_entity
      0.07            +0.0        0.10 ±  4%  perf-profile.children.cycles-pp.select_idle_sibling
      0.07 ±  7%      +0.0        0.09 ± 10%  perf-profile.children.cycles-pp.cpuidle_idle_call
      0.06 ±  6%      +0.0        0.08 ±  8%  perf-profile.children.cycles-pp.cpuidle_enter_state
      0.28            +0.0        0.31 ±  3%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.15 ±  3%      +0.0        0.18 ±  2%  perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.12 ±  3%      +0.0        0.15 ±  3%  perf-profile.children.cycles-pp.prepare_task_switch
      0.16 ±  2%      +0.0        0.19        perf-profile.children.cycles-pp.__update_load_avg_se
      0.21            +0.0        0.24        perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      0.13 ±  2%      +0.0        0.16 ±  2%  perf-profile.children.cycles-pp.__switch_to
      0.18 ±  2%      +0.0        0.21        perf-profile.children.cycles-pp.wait_for_unix_gc
      0.16 ±  3%      +0.0        0.20        perf-profile.children.cycles-pp.reweight_entity
      0.12 ±  5%      +0.0        0.16 ±  3%  perf-profile.children.cycles-pp.update_rq_clock_task
      0.22            +0.0        0.25        perf-profile.children.cycles-pp.memcg_account_kmem
      0.14 ±  2%      +0.0        0.17 ±  2%  perf-profile.children.cycles-pp.finish_task_switch
      0.12 ±  4%      +0.0        0.16        perf-profile.children.cycles-pp.__switch_to_asm
      0.15 ±  3%      +0.0        0.18 ±  4%  perf-profile.children.cycles-pp.wake_affine
      0.24            +0.0        0.27        perf-profile.children.cycles-pp.syscall_enter_from_user_mode
      0.13            +0.0        0.17 ±  2%  perf-profile.children.cycles-pp.wakeup_preempt
      0.20 ±  2%      +0.0        0.25        perf-profile.children.cycles-pp.restore_fpregs_from_fpstate
      0.20            +0.0        0.24        perf-profile.children.cycles-pp.kmalloc_slab
      0.32            +0.0        0.37        perf-profile.children.cycles-pp.__virt_addr_valid
      0.25            +0.0        0.29 ±  2%  perf-profile.children.cycles-pp.obj_cgroup_uncharge_pages
      0.22 ±  2%      +0.0        0.27 ±  3%  perf-profile.children.cycles-pp.set_next_entity
      0.18 ±  2%      +0.0        0.23        perf-profile.children.cycles-pp.pick_next_entity
      0.10 ±  5%      +0.0        0.15 ± 10%  perf-profile.children.cycles-pp.secondary_startup_64_no_verify
      0.10 ±  5%      +0.0        0.15 ± 10%  perf-profile.children.cycles-pp.cpu_startup_entry
      0.10 ±  5%      +0.0        0.15 ± 10%  perf-profile.children.cycles-pp.do_idle
      0.10 ±  5%      +0.0        0.15 ± 10%  perf-profile.children.cycles-pp.start_secondary
      0.16 ±  3%      +0.0        0.20 ±  2%  perf-profile.children.cycles-pp.kmalloc_size_roundup
      0.28 ±  2%      +0.0        0.33        perf-profile.children.cycles-pp.aa_file_perm
      0.20            +0.1        0.25        perf-profile.children.cycles-pp.__pick_eevdf
      0.00            +0.1        0.05 ±  7%  perf-profile.children.cycles-pp.finish_wait
      0.29            +0.1        0.34        perf-profile.children.cycles-pp.mutex_unlock
      0.29            +0.1        0.34 ±  2%  perf-profile.children.cycles-pp.__get_task_ioprio
      0.20 ±  2%      +0.1        0.25 ±  2%  perf-profile.children.cycles-pp.__enqueue_entity
      0.00            +0.1        0.06 ±  8%  perf-profile.children.cycles-pp.intel_idle
      0.32            +0.1        0.38        perf-profile.children.cycles-pp.exit_to_user_mode_loop
      0.25            +0.1        0.32 ±  2%  perf-profile.children.cycles-pp.select_task_rq_fair
      0.50            +0.1        0.57        perf-profile.children.cycles-pp.refill_obj_stock
      0.32            +0.1        0.38        perf-profile.children.cycles-pp.switch_fpu_return
      0.27 ±  2%      +0.1        0.34 ±  2%  perf-profile.children.cycles-pp.prepare_to_wait
      0.45 ±  3%      +0.1        0.52        perf-profile.children.cycles-pp.__check_heap_object
      0.38            +0.1        0.45        perf-profile.children.cycles-pp.rcu_all_qs
      0.28            +0.1        0.36 ±  2%  perf-profile.children.cycles-pp.select_task_rq
      0.31            +0.1        0.38 ±  2%  perf-profile.children.cycles-pp.dequeue_entity
      0.47            +0.1        0.56        perf-profile.children.cycles-pp.mutex_lock
      0.36            +0.1        0.45 ±  3%  perf-profile.children.cycles-pp.update_curr
      0.22 ±  5%      +0.1        0.31 ±  6%  perf-profile.children.cycles-pp.task_tick_fair
      0.56            +0.1        0.66        perf-profile.children.cycles-pp._copy_from_iter
      0.48            +0.1        0.57        perf-profile.children.cycles-pp.skb_unlink
      0.55            +0.1        0.65        perf-profile.children.cycles-pp.unix_write_space
      0.25 ±  5%      +0.1        0.35 ±  6%  perf-profile.children.cycles-pp.scheduler_tick
      0.08 ±  5%      +0.1        0.18 ±  2%  perf-profile.children.cycles-pp.__list_add_valid_or_report
      0.26 ±  4%      +0.1        0.36 ±  4%  perf-profile.children.cycles-pp.update_cfs_group
      0.28 ±  4%      +0.1        0.38 ±  5%  perf-profile.children.cycles-pp.update_process_times
      0.28 ±  4%      +0.1        0.39 ±  6%  perf-profile.children.cycles-pp.tick_sched_handle
      0.53            +0.1        0.64        perf-profile.children.cycles-pp.update_load_avg
      0.51 ±  2%      +0.1        0.62        perf-profile.children.cycles-pp.security_socket_recvmsg
      0.32 ±  4%      +0.1        0.44 ±  5%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.29 ±  4%      +0.1        0.40 ±  6%  perf-profile.children.cycles-pp.tick_nohz_highres_handler
      0.35 ±  3%      +0.1        0.47 ±  5%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.36 ±  3%      +0.1        0.48 ±  5%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.43 ±  3%      +0.1        0.55 ±  5%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.40 ±  3%      +0.1        0.52 ±  5%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.70 ±  4%      +0.1        0.82 ±  3%  perf-profile.children.cycles-pp.apparmor_file_permission
      0.72            +0.1        0.85        perf-profile.children.cycles-pp.__cond_resched
      0.52            +0.1        0.65 ±  2%  perf-profile.children.cycles-pp.enqueue_entity
      0.62            +0.1        0.76        perf-profile.children.cycles-pp.__pthread_enable_asynccancel
      0.83            +0.1        0.98        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.83            +0.2        0.98        perf-profile.children.cycles-pp.obj_cgroup_charge
      0.81            +0.2        0.96        perf-profile.children.cycles-pp.exit_to_user_mode_prepare
      0.62 ±  3%      +0.2        0.78 ±  3%  perf-profile.children.cycles-pp.security_socket_sendmsg
      0.62            +0.2        0.77        perf-profile.children.cycles-pp.dequeue_task_fair
      0.91 ±  3%      +0.2        1.06 ±  2%  perf-profile.children.cycles-pp.security_file_permission
      0.73            +0.2        0.89        perf-profile.children.cycles-pp.pick_next_task_fair
      0.60            +0.2        0.77        perf-profile.children.cycles-pp.fput
      1.12            +0.2        1.32        perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      0.85            +0.2        1.06        perf-profile.children.cycles-pp.enqueue_task_fair
      0.84 ±  3%      +0.2        1.05 ±  2%  perf-profile.children.cycles-pp.aa_sk_perm
      0.88            +0.2        1.10        perf-profile.children.cycles-pp.activate_task
      1.43            +0.2        1.66        perf-profile.children.cycles-pp.skb_copy_datagram_from_iter
      1.00            +0.3        1.25        perf-profile.children.cycles-pp.ttwu_do_activate
      1.77            +0.3        2.06        perf-profile.children.cycles-pp.mod_objcg_state
      1.93            +0.3        2.23        perf-profile.children.cycles-pp.__entry_text_start
      1.14            +0.3        1.46 ±  2%  perf-profile.children.cycles-pp.skb_set_owner_w
      2.01            +0.4        2.41        perf-profile.children.cycles-pp.__kmem_cache_free
      1.82            +0.4        2.23 ±  2%  perf-profile.children.cycles-pp.__pthread_disable_asynccancel
      1.76 ±  3%      +0.4        2.17 ±  5%  perf-profile.children.cycles-pp.skb_queue_tail
      2.13            +0.4        2.57        perf-profile.children.cycles-pp.memcg_slab_post_alloc_hook
      2.26            +0.5        2.73 ±  3%  perf-profile.children.cycles-pp._copy_to_iter
      1.98            +0.5        2.46        perf-profile.children.cycles-pp.schedule_timeout
      1.94            +0.5        2.43 ±  2%  perf-profile.children.cycles-pp.try_to_wake_up
      1.98            +0.5        2.47 ±  2%  perf-profile.children.cycles-pp.autoremove_wake_function
      2.44            +0.5        2.94        perf-profile.children.cycles-pp.check_heap_object
      2.06            +0.5        2.58 ±  2%  perf-profile.children.cycles-pp.__wake_up_common
      2.15            +0.5        2.68        perf-profile.children.cycles-pp.unix_stream_data_wait
      2.16            +0.5        2.69        perf-profile.children.cycles-pp.schedule
      2.65            +0.5        3.18        perf-profile.children.cycles-pp.simple_copy_to_iter
      2.80            +0.5        3.34 ±  2%  perf-profile.children.cycles-pp.__slab_free
      2.17            +0.5        2.71        perf-profile.children.cycles-pp.__schedule
      2.54            +0.6        3.09 ±  2%  perf-profile.children.cycles-pp.sock_wfree
      2.66            +0.6        3.23 ±  2%  perf-profile.children.cycles-pp.unix_destruct_scm
      2.73            +0.6        3.30 ±  2%  perf-profile.children.cycles-pp.skb_release_head_state
      3.34            +0.6        3.98        perf-profile.children.cycles-pp.__check_object_size
      2.36            +0.6        3.00 ±  2%  perf-profile.children.cycles-pp.__wake_up_sync_key
      2.40 ±  2%      +0.6        3.04 ±  4%  perf-profile.children.cycles-pp.__get_file_rcu
      2.78 ±  3%      +0.7        3.46 ±  4%  perf-profile.children.cycles-pp.__fget_light
      2.91 ±  3%      +0.7        3.62 ±  4%  perf-profile.children.cycles-pp.__fdget_pos
      4.48            +0.8        5.30        perf-profile.children.cycles-pp.kmem_cache_free
     41.46            +1.0       42.42        perf-profile.children.cycles-pp.ksys_write
      3.46            +1.0        4.44 ±  3%  perf-profile.children.cycles-pp._raw_spin_lock
      3.80 ±  2%      +1.0        4.82 ±  3%  perf-profile.children.cycles-pp.sock_def_readable
      5.05            +1.0        6.08 ±  2%  perf-profile.children.cycles-pp.__skb_datagram_iter
      5.14            +1.0        6.19 ±  2%  perf-profile.children.cycles-pp.skb_copy_datagram_iter
      5.20            +1.1        6.26 ±  2%  perf-profile.children.cycles-pp.unix_stream_read_actor
     44.28            +1.4       45.71        perf-profile.children.cycles-pp.__libc_write
     34.92 ±  2%     -13.0       21.95 ±  6%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      0.37            -0.3        0.09        perf-profile.self.cycles-pp.__unfreeze_partials
      0.38            -0.1        0.28 ±  2%  perf-profile.self.cycles-pp.get_partial_node
      0.06            -0.0        0.05        perf-profile.self.cycles-pp.native_irq_return_iret
      0.05            +0.0        0.06        perf-profile.self.cycles-pp.unix_stream_read_actor
      0.05            +0.0        0.06        perf-profile.self.cycles-pp.skb_free_head
      0.07            +0.0        0.08        perf-profile.self.cycles-pp.put_pid
      0.08            +0.0        0.09        perf-profile.self.cycles-pp.is_vmalloc_addr
      0.11 ±  3%      +0.0        0.12        perf-profile.self.cycles-pp.unix_scm_to_skb
      0.05            +0.0        0.06 ±  6%  perf-profile.self.cycles-pp.___perf_sw_event
      0.10            +0.0        0.11 ±  4%  perf-profile.self.cycles-pp.skb_queue_tail
      0.07            +0.0        0.08 ±  5%  perf-profile.self.cycles-pp.fsnotify_perm
      0.05            +0.0        0.06 ±  7%  perf-profile.self.cycles-pp.enqueue_entity
      0.08 ±  6%      +0.0        0.09        perf-profile.self.cycles-pp.refill_stock
      0.10 ±  3%      +0.0        0.11 ±  4%  perf-profile.self.cycles-pp.check_stack_object
      0.10 ±  4%      +0.0        0.12        perf-profile.self.cycles-pp.rw_verify_area
      0.10 ±  4%      +0.0        0.11 ±  3%  perf-profile.self.cycles-pp.skb_unlink
      0.07            +0.0        0.08 ±  5%  perf-profile.self.cycles-pp.prepare_task_switch
      0.07            +0.0        0.08 ±  5%  perf-profile.self.cycles-pp.os_xsave
      0.06 ±  9%      +0.0        0.07        perf-profile.self.cycles-pp.update_min_vruntime
      0.12            +0.0        0.14 ±  3%  perf-profile.self.cycles-pp.__scm_recv_common
      0.32            +0.0        0.33        perf-profile.self.cycles-pp.__list_del_entry_valid_or_report
      0.13            +0.0        0.15 ±  3%  perf-profile.self.cycles-pp.__kmalloc_node_track_caller
      0.09            +0.0        0.11 ±  4%  perf-profile.self.cycles-pp.memcg_account_kmem
      0.09            +0.0        0.11 ±  4%  perf-profile.self.cycles-pp.security_socket_getpeersec_dgram
      0.06 ±  7%      +0.0        0.08 ±  4%  perf-profile.self.cycles-pp.kmalloc_size_roundup
      0.06 ±  7%      +0.0        0.08 ±  4%  perf-profile.self.cycles-pp.cpuacct_charge
      0.08 ±  4%      +0.0        0.10 ±  3%  perf-profile.self.cycles-pp.maybe_add_creds
      0.08 ±  4%      +0.0        0.10 ±  5%  perf-profile.self.cycles-pp.prepare_to_wait
      0.11 ±  3%      +0.0        0.13 ±  3%  perf-profile.self.cycles-pp.__update_load_avg_cfs_rq
      0.09 ±  4%      +0.0        0.11 ±  4%  perf-profile.self.cycles-pp.__mod_memcg_state
      0.14            +0.0        0.16        perf-profile.self.cycles-pp.kmalloc_reserve
      0.09            +0.0        0.11        perf-profile.self.cycles-pp.current_obj_cgroup
      0.08 ±  5%      +0.0        0.10 ±  4%  perf-profile.self.cycles-pp.reweight_entity
      0.11 ±  4%      +0.0        0.13 ±  3%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
      0.08            +0.0        0.10        perf-profile.self.cycles-pp.pick_next_task_fair
      0.16            +0.0        0.18 ±  2%  perf-profile.self.cycles-pp.skb_copy_datagram_from_iter
      0.14 ±  3%      +0.0        0.16 ±  3%  perf-profile.self.cycles-pp.__fdget_pos
      0.10 ±  5%      +0.0        0.12 ±  4%  perf-profile.self.cycles-pp.try_charge_memcg
      0.15            +0.0        0.17 ±  2%  perf-profile.self.cycles-pp.put_cpu_partial
      0.10 ±  3%      +0.0        0.12 ±  3%  perf-profile.self.cycles-pp.unix_destruct_scm
      0.10 ±  4%      +0.0        0.12 ±  4%  perf-profile.self.cycles-pp.security_socket_sendmsg
      0.09 ±  4%      +0.0        0.11        perf-profile.self.cycles-pp.__dequeue_entity
      0.06            +0.0        0.08 ±  4%  perf-profile.self.cycles-pp.dequeue_task_fair
      0.18 ±  2%      +0.0        0.20        perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.13            +0.0        0.15 ±  3%  perf-profile.self.cycles-pp.__build_skb_around
      0.10 ±  4%      +0.0        0.12        perf-profile.self.cycles-pp.finish_task_switch
      0.09 ±  5%      +0.0        0.12 ±  4%  perf-profile.self.cycles-pp.__mod_memcg_lruvec_state
      0.12 ±  3%      +0.0        0.15 ±  3%  perf-profile.self.cycles-pp.security_socket_recvmsg
      0.12 ±  3%      +0.0        0.14 ±  3%  perf-profile.self.cycles-pp.kfree
      0.08 ±  5%      +0.0        0.11 ±  4%  perf-profile.self.cycles-pp.__wake_up_common
      0.16 ±  2%      +0.0        0.19        perf-profile.self.cycles-pp.__skb_datagram_iter
      0.14 ±  3%      +0.0        0.17 ±  2%  perf-profile.self.cycles-pp.alloc_skb_with_frags
      0.14 ±  3%      +0.0        0.16 ±  5%  perf-profile.self.cycles-pp.unix_stream_recvmsg
      0.09 ±  5%      +0.0        0.12 ±  3%  perf-profile.self.cycles-pp.enqueue_task_fair
      0.11 ±  4%      +0.0        0.13 ±  2%  perf-profile.self.cycles-pp.schedule_timeout
      0.15            +0.0        0.18 ±  2%  perf-profile.self.cycles-pp.exit_to_user_mode_prepare
      0.27            +0.0        0.30 ±  3%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.13            +0.0        0.16 ±  4%  perf-profile.self.cycles-pp.__switch_to
      0.10 ±  3%      +0.0        0.13 ±  2%  perf-profile.self.cycles-pp.switch_fpu_return
      0.16 ±  2%      +0.0        0.19 ±  3%  perf-profile.self.cycles-pp.sock_recvmsg
      0.15 ±  3%      +0.0        0.18 ±  2%  perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.14 ±  2%      +0.0        0.17        perf-profile.self.cycles-pp.__update_load_avg_se
      0.20            +0.0        0.23 ±  2%  perf-profile.self.cycles-pp.syscall_enter_from_user_mode
      0.12 ±  4%      +0.0        0.14 ±  3%  perf-profile.self.cycles-pp.try_to_wake_up
      0.03 ± 70%      +0.0        0.06 ±  7%  perf-profile.self.cycles-pp.available_idle_cpu
      0.18 ±  2%      +0.0        0.21        perf-profile.self.cycles-pp._raw_spin_unlock_irqrestore
      0.20            +0.0        0.23        perf-profile.self.cycles-pp.ksys_read
      0.11 ±  6%      +0.0        0.14 ±  3%  perf-profile.self.cycles-pp.update_rq_clock_task
      0.20            +0.0        0.23 ±  2%  perf-profile.self.cycles-pp.ksys_write
      0.12 ±  3%      +0.0        0.16 ±  2%  perf-profile.self.cycles-pp.__switch_to_asm
      0.23            +0.0        0.27 ±  2%  perf-profile.self.cycles-pp.security_file_permission
      0.20 ±  2%      +0.0        0.24 ±  2%  perf-profile.self.cycles-pp.restore_fpregs_from_fpstate
      0.30            +0.0        0.34 ±  2%  perf-profile.self.cycles-pp.__virt_addr_valid
      0.17            +0.0        0.21        perf-profile.self.cycles-pp.kmalloc_slab
      0.18 ±  2%      +0.0        0.22        perf-profile.self.cycles-pp.__pick_eevdf
      0.23 ±  2%      +0.0        0.28        perf-profile.self.cycles-pp.rcu_all_qs
      0.25 ±  2%      +0.0        0.29        perf-profile.self.cycles-pp.aa_file_perm
      0.30            +0.0        0.34        perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.25            +0.0        0.30 ±  2%  perf-profile.self.cycles-pp.__get_task_ioprio
      0.17 ±  2%      +0.0        0.22 ±  3%  perf-profile.self.cycles-pp.update_curr
      0.28            +0.0        0.33        perf-profile.self.cycles-pp.mutex_unlock
      0.36            +0.1        0.41        perf-profile.self.cycles-pp.do_syscall_64
      0.19 ±  2%      +0.1        0.25        perf-profile.self.cycles-pp.__enqueue_entity
      0.33 ±  2%      +0.1        0.39 ±  2%  perf-profile.self.cycles-pp.consume_skb
      0.00            +0.1        0.06 ±  8%  perf-profile.self.cycles-pp.intel_idle
      0.28 ±  3%      +0.1        0.34 ±  2%  perf-profile.self.cycles-pp.sock_alloc_send_pskb
      0.34            +0.1        0.40        perf-profile.self.cycles-pp.unix_write_space
      0.37            +0.1        0.44        perf-profile.self.cycles-pp.__check_object_size
      0.31            +0.1        0.38        perf-profile.self.cycles-pp.mutex_lock
      0.26            +0.1        0.32        perf-profile.self.cycles-pp.update_load_avg
      0.47            +0.1        0.54        perf-profile.self.cycles-pp.refill_obj_stock
      0.48 ±  2%      +0.1        0.55 ±  2%  perf-profile.self.cycles-pp.sock_read_iter
      0.40 ±  6%      +0.1        0.46 ±  5%  perf-profile.self.cycles-pp.apparmor_file_permission
      0.42 ±  3%      +0.1        0.48        perf-profile.self.cycles-pp.__check_heap_object
      0.37            +0.1        0.44        perf-profile.self.cycles-pp.__cond_resched
      0.45            +0.1        0.53        perf-profile.self.cycles-pp.__entry_text_start
      0.44            +0.1        0.52 ±  3%  perf-profile.self.cycles-pp.skb_release_data
      0.49            +0.1        0.58        perf-profile.self.cycles-pp.obj_cgroup_charge
      0.31 ±  3%      +0.1        0.41 ±  5%  perf-profile.self.cycles-pp.__schedule
      0.54            +0.1        0.63        perf-profile.self.cycles-pp._copy_from_iter
      0.08            +0.1        0.18 ±  2%  perf-profile.self.cycles-pp.__list_add_valid_or_report
      0.26 ±  3%      +0.1        0.36 ±  5%  perf-profile.self.cycles-pp.update_cfs_group
      0.54            +0.1        0.64        perf-profile.self.cycles-pp.sock_write_iter
      0.66            +0.1        0.77        perf-profile.self.cycles-pp.__kmem_cache_alloc_node
      0.60            +0.1        0.72        perf-profile.self.cycles-pp.__pthread_enable_asynccancel
      0.62            +0.1        0.75        perf-profile.self.cycles-pp.kmem_cache_alloc_node
      0.97            +0.1        1.11        perf-profile.self.cycles-pp.__libc_read
      0.81            +0.1        0.95        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.80            +0.1        0.94        perf-profile.self.cycles-pp.vfs_read
      0.99            +0.2        1.15        perf-profile.self.cycles-pp.__libc_write
      0.57            +0.2        0.73        perf-profile.self.cycles-pp.fput
      0.76            +0.2        0.92        perf-profile.self.cycles-pp.vfs_write
      0.62 ±  4%      +0.2        0.80 ±  3%  perf-profile.self.cycles-pp.aa_sk_perm
      1.10            +0.2        1.34        perf-profile.self.cycles-pp.__kmem_cache_free
      1.60            +0.3        1.85        perf-profile.self.cycles-pp.mod_objcg_state
      0.86            +0.3        1.14        perf-profile.self.cycles-pp.___slab_alloc
      1.12            +0.3        1.43        perf-profile.self.cycles-pp.skb_set_owner_w
      1.38            +0.3        1.70        perf-profile.self.cycles-pp.memcg_slab_post_alloc_hook
      1.67            +0.4        2.04 ±  2%  perf-profile.self.cycles-pp.__alloc_skb
      1.59 ±  3%      +0.4        1.99 ±  6%  perf-profile.self.cycles-pp.sock_def_readable
      1.73            +0.4        2.14 ±  2%  perf-profile.self.cycles-pp.__pthread_disable_asynccancel
      2.00            +0.4        2.43 ±  2%  perf-profile.self.cycles-pp.check_heap_object
      1.98 ±  2%      +0.5        2.43 ±  2%  perf-profile.self.cycles-pp.sock_wfree
      2.02 ±  2%      +0.5        2.49 ±  5%  perf-profile.self.cycles-pp.unix_stream_sendmsg
      2.22            +0.5        2.70 ±  3%  perf-profile.self.cycles-pp._copy_to_iter
      2.76            +0.5        3.29 ±  2%  perf-profile.self.cycles-pp.__slab_free
      2.58 ±  2%      +0.6        3.13 ±  4%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      2.60            +0.6        3.18 ±  3%  perf-profile.self.cycles-pp.unix_stream_read_generic
      2.36 ±  2%      +0.6        2.99 ±  4%  perf-profile.self.cycles-pp.__get_file_rcu
      3.61            +0.7        4.30 ±  2%  perf-profile.self.cycles-pp.kmem_cache_free
      2.82            +0.7        3.55 ±  3%  perf-profile.self.cycles-pp._raw_spin_lock


***************************************************************************************************
lkp-icl-2sp2: 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2.00GHz (Ice Lake) with 256G memory
=========================================================================================
compiler/cpufreq_governor/ipc/iterations/kconfig/mode/nr_threads/rootfs/tbox_group/testcase:
  gcc-12/performance/socket/4/x86_64-rhel-8.3/process/50%/debian-11.1-x86_64-20220510.cgz/lkp-icl-2sp2/hackbench

commit: 
  00b15a19ee ("slub: Introduce freeze_slab()")
  c8d312e039 ("slub: Delay freezing of partial slabs")

00b15a19ee543f01 c8d312e039030edab25836a326b 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      1492 ±  9%     +71.4%       2558 ± 29%  turbostat.POLL
   5914740 ±  7%     +17.5%    6949608 ±  8%  vmstat.memory.cache
    448744            +3.8%     465846        hackbench.throughput
    441391            +3.8%     457980        hackbench.throughput_avg
    448744            +3.8%     465846        hackbench.throughput_best
    427227            +4.7%     447449        hackbench.throughput_worst
  83156624            -1.8%   81700614        hackbench.time.involuntary_context_switches
     16199            -4.5%      15469        hackbench.time.system_time
      0.54 ±  4%      -0.0        0.51        perf-stat.i.branch-miss-rate%
      2280 ± 44%     -22.9%       1758 ±  2%  perf-stat.i.cycles-between-cache-misses
      0.53            -0.0        0.51        perf-stat.overall.branch-miss-rate%
      1.36            -3.9%       1.30        perf-stat.overall.cpi
      1822            -3.5%       1758        perf-stat.overall.cycles-between-cache-misses
      0.74            +4.1%       0.77        perf-stat.overall.ipc
   5777253 ±  7%     +17.8%    6802747 ±  8%  meminfo.Cached
   4716622 ±  7%     +22.9%    5794899 ± 10%  meminfo.Committed_AS
   3306409 ± 14%     +38.3%    4572192 ± 13%  meminfo.Inactive
   3306021 ± 14%     +38.3%    4571804 ± 13%  meminfo.Inactive(anon)
   8940810 ±  4%     +12.4%   10051649 ±  5%  meminfo.Memused
   3088924 ± 13%     +33.2%    4114417 ± 14%  meminfo.Shmem
   9221505 ±  4%     +11.3%   10259268 ±  5%  meminfo.max_used_kB
   1444106 ±  7%     +17.8%    1701674 ±  8%  proc-vmstat.nr_file_pages
    825202 ± 14%     +38.6%    1143844 ± 13%  proc-vmstat.nr_inactive_anon
    772022 ± 13%     +33.4%    1029591 ± 14%  proc-vmstat.nr_shmem
     33082            +1.6%      33620        proc-vmstat.nr_slab_reclaimable
    825202 ± 14%     +38.6%    1143844 ± 13%  proc-vmstat.nr_zone_inactive_anon
   2333093 ±  5%     +15.4%    2693344 ±  7%  proc-vmstat.numa_hit
   2199304 ±  5%     +16.2%    2554985 ±  7%  proc-vmstat.numa_local
   3312352 ±  3%      +9.3%    3621949 ±  5%  proc-vmstat.pgalloc_normal
   2086440 ±  5%      -8.4%    1911146        proc-vmstat.pgfree
     10.82 ±216%     -99.9%       0.01 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.memcg_slab_post_alloc_hook
      1.29 ±  8%     -89.8%       0.13 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      1.46 ±  9%     -83.0%       0.25 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.aa_sk_perm.security_socket_recvmsg.sock_recvmsg.sock_read_iter
      1.88 ±113%     -98.6%       0.03 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.exit_mmap.__mmput.exit_mm.do_exit
      0.82 ± 16%     -87.3%       0.10 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      0.97 ± 35%     -85.2%       0.14 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.wait_for_unix_gc.unix_stream_sendmsg.sock_write_iter.vfs_write
      1.29 ±130%     -99.7%       0.00 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
     13.65 ± 64%     -97.0%       0.41 ±223%  perf-sched.sch_delay.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      4.64 ± 28%     -83.9%       0.75 ±223%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      6.59 ± 12%     -87.2%       0.84 ±223%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      0.94 ± 18%     -86.3%       0.13 ±223%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
     32.34 ± 99%     -93.9%       1.99 ±223%  perf-sched.sch_delay.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
     14.51 ± 84%     -96.9%       0.45 ±223%  perf-sched.sch_delay.avg.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      3.08 ± 37%     -96.5%       0.11 ±223%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
      0.48 ±122%     -89.9%       0.05 ±223%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      5.98 ±135%     -99.4%       0.04 ±223%  perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.unlink_anon_vmas
     24.69 ±149%     -99.3%       0.16 ±223%  perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      6.64 ± 29%     -86.6%       0.89 ±223%  perf-sched.sch_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      7.86 ±  3%     -84.7%       1.20 ±223%  perf-sched.sch_delay.avg.ms.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
      1.04 ± 11%     -86.4%       0.14 ±223%  perf-sched.sch_delay.avg.ms.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
      2.99 ± 91%     -99.9%       0.00 ±223%  perf-sched.sch_delay.avg.ms.syslog_print.do_syslog.kmsg_read.vfs_read
      0.45 ± 78%     -91.8%       0.04 ±223%  perf-sched.sch_delay.avg.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
     14.68 ± 78%     -99.6%       0.07 ±223%  perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     87.77 ±213%     -99.7%       0.23 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.memcg_slab_post_alloc_hook
      0.34 ±101%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
     39.05 ±129%     -98.8%       0.48 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.exit_mmap.__mmput.exit_mm.do_exit
    434.35 ± 30%     -90.7%      40.29 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
    302.77 ± 53%     -85.7%      43.20 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.mutex_lock.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
     47.44 ±153%     -99.6%       0.19 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
    844.60 ± 68%     -94.1%      49.49 ±223%  perf-sched.sch_delay.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
    542.84 ± 41%     -87.6%      67.21 ±223%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      2386 ± 52%     -92.8%     171.54 ±223%  perf-sched.sch_delay.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
    234.85 ±122%     -94.3%      13.50 ±223%  perf-sched.sch_delay.max.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      5.27 ± 40%     -89.0%       0.58 ±223%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.do_select.core_sys_select.kern_select
    167.84 ±134%     -99.4%       1.01 ±223%  perf-sched.sch_delay.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.unlink_anon_vmas
    718.40 ± 10%     -86.9%      94.02 ±223%  perf-sched.sch_delay.max.ms.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
      0.75 ± 78%     -94.1%       0.04 ±223%  perf-sched.sch_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      3.20 ± 81%     -99.9%       0.00 ±223%  perf-sched.sch_delay.max.ms.syslog_print.do_syslog.kmsg_read.vfs_read
      4.72 ± 84%     -91.2%       0.41 ±223%  perf-sched.sch_delay.max.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
      2577 ± 60%     -97.9%      54.50 ±223%  perf-sched.sch_delay.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      1.46 ± 12%     -86.0%       0.20 ±223%  perf-sched.total_sch_delay.average.ms
      3445 ± 15%     -90.3%     335.24 ±223%  perf-sched.total_sch_delay.max.ms
      4.59 ± 11%     -85.6%       0.66 ±223%  perf-sched.total_wait_and_delay.average.ms
      3.13 ± 11%     -85.4%       0.46 ±223%  perf-sched.total_wait_time.average.ms
      7.32 ± 13%     -82.1%       1.31 ±223%  perf-sched.wait_and_delay.avg.ms.__cond_resched.aa_sk_perm.security_socket_sendmsg.sock_write_iter.vfs_write
     33.50 ± 19%     -86.8%       4.42 ±223%  perf-sched.wait_and_delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
     41.53 ± 58%     -94.3%       2.35 ±223%  perf-sched.wait_and_delay.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
     16.23 ± 16%     -86.5%       2.20 ±223%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
     21.47 ±  7%     -86.7%       2.86 ±223%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      3.02 ± 16%     -86.2%       0.42 ±223%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
    111.86 ± 47%     -85.5%      16.22 ±223%  perf-sched.wait_and_delay.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
     41.81 ± 48%     -94.7%       2.20 ±223%  perf-sched.wait_and_delay.avg.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
    466.43 ± 41%     -98.7%       5.96 ±223%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
    517.70 ± 26%     -94.5%      28.29 ±223%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
     19.49 ±107%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.unlink_anon_vmas
    130.50 ± 66%     -96.7%       4.25 ±223%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    827.96 ± 22%     -84.2%     130.69 ±223%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
     22.22 ± 19%     -86.4%       3.03 ±223%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     23.97 ±  3%     -84.5%       3.70 ±223%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
      3.05 ± 11%     -86.2%       0.42 ±223%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
    699.70 ±  8%     -89.9%      70.43 ±223%  perf-sched.wait_and_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     57.50 ±105%    -100.0%       0.00        perf-sched.wait_and_delay.count.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.unlink_anon_vmas
    506.78 ± 90%     -90.8%      46.75 ±223%  perf-sched.wait_and_delay.max.ms.__cond_resched.__put_anon_vma.unlink_anon_vmas.free_pgtables.exit_mmap
      1145 ±  2%     -83.6%     187.73 ±223%  perf-sched.wait_and_delay.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      1425 ± 55%     -88.1%     170.08 ±223%  perf-sched.wait_and_delay.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      1687 ± 69%     -89.5%     176.52 ±223%  perf-sched.wait_and_delay.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      1142 ± 37%     -88.1%     135.48 ±223%  perf-sched.wait_and_delay.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      4606 ± 21%     -85.4%     674.23 ±223%  perf-sched.wait_and_delay.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
    528.00 ±104%     -94.0%      31.50 ±223%  perf-sched.wait_and_delay.max.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      1506 ± 33%     -88.9%     166.94 ±223%  perf-sched.wait_and_delay.max.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
    359.82 ±121%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.unlink_anon_vmas
      1932 ± 23%     -82.6%     336.00 ±223%  perf-sched.wait_and_delay.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      1457 ± 10%     -87.1%     188.18 ±223%  perf-sched.wait_and_delay.max.ms.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
      4952 ± 31%     -88.1%     587.66 ±223%  perf-sched.wait_and_delay.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      2.12 ± 53%     -94.2%       0.12 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.alloc_pages_mpol.shmem_alloc_folio.shmem_alloc_and_add_folio
     12.37 ±201%     -99.9%       0.02 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages.alloc_pages_mpol.vma_alloc_folio.wp_page_copy
     20.52 ± 86%     -97.2%       0.57 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.allocate_slab
      3.06 ±  6%     -88.2%       0.36 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      2.82 ±  9%     -85.4%       0.41 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.aa_sk_perm.security_socket_recvmsg.sock_recvmsg.sock_read_iter
      5.25 ± 12%     -82.8%       0.90 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.aa_sk_perm.security_socket_sendmsg.sock_write_iter.vfs_write
      0.50 ±108%     -99.4%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.down_read.acct_collect.do_exit.do_group_exit
      2.67 ±145%     -99.8%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.unlink_anon_vmas.free_pgtables.exit_mmap
      0.97 ±156%     -99.8%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
      1.53 ± 44%     -87.3%       0.19 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      0.22 ±117%     -97.4%       0.01 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc.alloc_empty_file.path_openat.do_filp_open
      2.74 ± 10%     -84.9%       0.41 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      0.74 ±140%     -94.7%       0.04 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.migrate_pages_batch.migrate_pages.migrate_misplaced_folio.do_numa_page
      1.75 ± 12%     -84.8%       0.27 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      4.91 ± 86%     -94.0%       0.30 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.rmap_walk_anon.try_to_migrate.migrate_folio_unmap.migrate_pages_batch
      1.59 ± 41%     -87.0%       0.21 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.shmem_inode_acct_blocks.shmem_alloc_and_add_folio.shmem_get_folio_gfp.shmem_write_begin
      0.06 ± 91%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.shift_arg_pages.setup_arg_pages
      0.08 ± 93%     -87.7%       0.01 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.unmap_vmas.exit_mmap.__mmput.exit_mm
      0.07 ± 78%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.unmap_vmas.unmap_region.constprop.0
      2.38 ± 23%     -85.0%       0.36 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.wait_for_unix_gc.unix_stream_sendmsg.sock_write_iter.vfs_write
      2.47 ±154%     -99.2%       0.02 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      2.61 ±109%     -99.0%       0.03 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
     27.00 ± 17%     -88.0%       3.25 ±223%  perf-sched.wait_time.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
     27.88 ± 56%     -93.0%       1.94 ±223%  perf-sched.wait_time.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
     11.59 ± 19%     -87.5%       1.45 ±223%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
     14.88 ±  6%     -86.5%       2.01 ±223%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
      2.09 ± 15%     -86.1%       0.29 ±223%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
     27.30 ± 37%     -93.6%       1.75 ±223%  perf-sched.wait_time.avg.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
    465.41 ± 41%     -98.8%       5.36 ±223%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
    517.22 ± 26%     -94.5%      28.24 ±223%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
     13.51 ± 96%     -95.9%       0.55 ±223%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.unlink_anon_vmas
    105.81 ± 47%     -96.1%       4.09 ±223%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    827.95 ± 22%     -84.2%     130.67 ±223%  perf-sched.wait_time.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
     15.58 ± 17%     -86.3%       2.14 ±223%  perf-sched.wait_time.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     16.10 ±  3%     -84.5%       2.50 ±223%  perf-sched.wait_time.avg.ms.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
      2.01 ± 11%     -86.2%       0.28 ±223%  perf-sched.wait_time.avg.ms.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
      0.16 ± 76%     -99.1%       0.00 ±223%  perf-sched.wait_time.avg.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
    685.02 ±  8%     -89.7%      70.37 ±223%  perf-sched.wait_time.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
    247.60 ± 69%     -85.0%      37.19 ±223%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.alloc_pages_mpol.shmem_alloc_folio.shmem_alloc_and_add_folio
    193.46 ±189%    -100.0%       0.08 ±223%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages.alloc_pages_mpol.vma_alloc_folio.wp_page_copy
    170.06 ± 94%     -96.5%       5.94 ±223%  perf-sched.wait_time.max.ms.__cond_resched.__kmem_cache_alloc_node.__kmalloc_node.memcg_alloc_slab_cgroups.allocate_slab
    353.19 ± 71%     -86.8%      46.75 ±223%  perf-sched.wait_time.max.ms.__cond_resched.__put_anon_vma.unlink_anon_vmas.free_pgtables.exit_mmap
      1145 ±  2%     -83.6%     187.73 ±223%  perf-sched.wait_time.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      2.91 ±140%     -99.7%       0.01 ±223%  perf-sched.wait_time.max.ms.__cond_resched.down_read.acct_collect.do_exit.do_group_exit
     16.59 ±159%    -100.0%       0.01 ±223%  perf-sched.wait_time.max.ms.__cond_resched.down_write.unlink_anon_vmas.free_pgtables.exit_mmap
      1.59 ± 98%     -99.9%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
     55.59 ± 80%     -86.7%       7.40 ±223%  perf-sched.wait_time.max.ms.__cond_resched.exit_mmap.__mmput.exit_mm.do_exit
      0.37 ± 93%     -98.5%       0.01 ±223%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc.alloc_empty_file.path_openat.do_filp_open
    620.61 ± 26%     -88.4%      71.76 ±223%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      3.36 ±152%     -96.8%       0.11 ±223%  perf-sched.wait_time.max.ms.__cond_resched.migrate_pages_batch.migrate_pages.migrate_misplaced_folio.do_numa_page
    134.38 ±117%     -95.1%       6.60 ±223%  perf-sched.wait_time.max.ms.__cond_resched.rmap_walk_anon.try_to_migrate.migrate_folio_unmap.migrate_pages_batch
    116.95 ±144%     -97.1%       3.42 ±223%  perf-sched.wait_time.max.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.exit_mmap.__mmput
      0.07 ± 84%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.tlb_batch_pages_flush.tlb_finish_mmu.shift_arg_pages.setup_arg_pages
      0.13 ± 84%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.unmap_vmas.unmap_region.constprop.0
    366.28 ± 24%     -81.8%      66.58 ±223%  perf-sched.wait_time.max.ms.__cond_resched.wait_for_unix_gc.unix_stream_sendmsg.sock_write_iter.vfs_write
     29.17 ±158%     -99.7%       0.08 ±223%  perf-sched.wait_time.max.ms.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
    100.14 ±128%     -99.3%       0.73 ±223%  perf-sched.wait_time.max.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
      1420 ± 55%     -88.2%     168.37 ±223%  perf-sched.wait_time.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
    417.03 ± 26%     -86.6%      55.67 ±223%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
    828.97 ± 30%     -91.5%      70.61 ±223%  perf-sched.wait_time.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
    303.65 ± 86%     -94.1%      18.00 ±223%  perf-sched.wait_time.max.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      1503 ± 33%     -88.9%     166.86 ±223%  perf-sched.wait_time.max.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
    199.45 ±107%     -93.2%      13.49 ±223%  perf-sched.wait_time.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.unlink_anon_vmas
      1932 ± 23%     -82.6%     336.00 ±223%  perf-sched.wait_time.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
    781.42 ± 12%     -84.4%     121.90 ±223%  perf-sched.wait_time.max.ms.schedule_timeout.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
    822.69 ±  9%     -87.9%      99.56 ±223%  perf-sched.wait_time.max.ms.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
      0.82 ± 78%     -98.4%       0.01 ±223%  perf-sched.wait_time.max.ms.wait_for_partner.fifo_open.do_dentry_open.do_open
      4444 ± 13%     -86.8%     587.66 ±223%  perf-sched.wait_time.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      3.68 ±  7%      -1.5        2.22 ±  7%  perf-profile.calltrace.cycles-pp.__unfreeze_partials.skb_release_data.consume_skb.unix_stream_read_generic.unix_stream_recvmsg
      3.38 ±  8%      -1.4        2.02 ±  8%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__unfreeze_partials.skb_release_data.consume_skb
      3.46 ±  8%      -1.3        2.13 ±  7%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__unfreeze_partials.skb_release_data.consume_skb.unix_stream_read_generic
     10.21 ±  2%      -1.2        9.04        perf-profile.calltrace.cycles-pp.skb_release_data.consume_skb.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      3.06 ±  8%      -1.1        1.96 ±  5%  perf-profile.calltrace.cycles-pp.__unfreeze_partials.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
     14.35            -1.0       13.34        perf-profile.calltrace.cycles-pp.consume_skb.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      2.76 ±  9%      -1.0        1.76 ±  5%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__unfreeze_partials.unix_stream_read_generic.unix_stream_recvmsg
      2.84 ±  9%      -1.0        1.86 ±  5%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__unfreeze_partials.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      2.50 ±  7%      -1.0        1.55 ±  7%  perf-profile.calltrace.cycles-pp.get_partial_node.___slab_alloc.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve
     16.14            -0.9       15.20        perf-profile.calltrace.cycles-pp.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
     16.46            -0.9       15.54        perf-profile.calltrace.cycles-pp.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter.vfs_write
     41.42            -0.9       40.52        perf-profile.calltrace.cycles-pp.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter.vfs_read
      2.24 ±  7%      -0.9        1.35 ±  8%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.get_partial_node.___slab_alloc.__kmem_cache_alloc_node.__kmalloc_node_track_caller
      2.22 ±  7%      -0.9        1.34 ±  8%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.get_partial_node.___slab_alloc.__kmem_cache_alloc_node
     41.86            -0.9       40.98        perf-profile.calltrace.cycles-pp.unix_stream_recvmsg.sock_recvmsg.sock_read_iter.vfs_read.ksys_read
      2.98 ±  6%      -0.9        2.11 ±  6%  perf-profile.calltrace.cycles-pp.___slab_alloc.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
     19.50            -0.8       18.71        perf-profile.calltrace.cycles-pp.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write
     43.08            -0.8       42.30        perf-profile.calltrace.cycles-pp.sock_recvmsg.sock_read_iter.vfs_read.ksys_read.do_syscall_64
     44.05            -0.7       43.31        perf-profile.calltrace.cycles-pp.sock_read_iter.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.06 ±  8%      -0.7        1.36 ±  4%  perf-profile.calltrace.cycles-pp.get_partial_node.___slab_alloc.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags
      7.16 ±  2%      -0.7        6.50 ±  2%  perf-profile.calltrace.cycles-pp.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb.alloc_skb_with_frags
      1.82 ±  9%      -0.6        1.17 ±  5%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.get_partial_node.___slab_alloc.kmem_cache_alloc_node.__alloc_skb
      7.65 ±  2%      -0.6        7.01        perf-profile.calltrace.cycles-pp.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      1.80 ±  9%      -0.6        1.16 ±  5%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.get_partial_node.___slab_alloc.kmem_cache_alloc_node
      2.54 ±  6%      -0.6        1.90 ±  3%  perf-profile.calltrace.cycles-pp.___slab_alloc.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
     46.80            -0.6       46.18        perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read
      8.22 ±  2%      -0.6        7.61        perf-profile.calltrace.cycles-pp.kmalloc_reserve.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg
     47.75            -0.6       47.20        perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read
     49.22            -0.5       48.74        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read
     49.54            -0.5       49.08        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__libc_read
      6.01 ±  2%      -0.4        5.57        perf-profile.calltrace.cycles-pp.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg
     52.34            -0.3       52.03        perf-profile.calltrace.cycles-pp.__libc_read
      0.58            +0.0        0.60        perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
      0.60            +0.0        0.62        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.skb_unlink.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      0.57            +0.0        0.60        perf-profile.calltrace.cycles-pp.mod_objcg_state.memcg_slab_post_alloc_hook.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags
      0.83            +0.0        0.86        perf-profile.calltrace.cycles-pp.mod_objcg_state.__kmem_cache_free.skb_release_data.consume_skb.unix_stream_read_generic
      0.74            +0.0        0.77        perf-profile.calltrace.cycles-pp.skb_unlink.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      0.76            +0.0        0.79        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
      0.90            +0.0        0.94 ±  2%  perf-profile.calltrace.cycles-pp.security_file_permission.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.61            +0.0        0.64        perf-profile.calltrace.cycles-pp.__build_skb_around.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg
      0.54            +0.0        0.58        perf-profile.calltrace.cycles-pp.obj_cgroup_charge.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      0.65            +0.0        0.68        perf-profile.calltrace.cycles-pp.mutex_lock.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      0.89            +0.0        0.92        perf-profile.calltrace.cycles-pp.unix_write_space.sock_wfree.unix_destruct_scm.skb_release_head_state.consume_skb
      0.71            +0.0        0.75        perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read
      0.78            +0.0        0.81        perf-profile.calltrace.cycles-pp.mod_objcg_state.kmem_cache_free.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      0.75            +0.0        0.79        perf-profile.calltrace.cycles-pp.obj_cgroup_charge.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      0.57            +0.0        0.60 ±  2%  perf-profile.calltrace.cycles-pp.enqueue_entity.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_wake_up
      0.64            +0.0        0.68        perf-profile.calltrace.cycles-pp.check_heap_object.__check_object_size.skb_copy_datagram_from_iter.unix_stream_sendmsg.sock_write_iter
      0.68            +0.0        0.72 ±  3%  perf-profile.calltrace.cycles-pp.dequeue_task_fair.__schedule.schedule.schedule_timeout.unix_stream_data_wait
      0.92            +0.1        0.98        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_read
      0.63            +0.1        0.69 ±  3%  perf-profile.calltrace.cycles-pp.aa_sk_perm.security_socket_recvmsg.sock_recvmsg.sock_read_iter.vfs_read
      0.96            +0.1        1.02 ±  2%  perf-profile.calltrace.cycles-pp.activate_task.ttwu_do_activate.try_to_wake_up.autoremove_wake_function.__wake_up_common
      0.91            +0.1        0.97 ±  2%  perf-profile.calltrace.cycles-pp.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_wake_up.autoremove_wake_function
      1.14            +0.1        1.20        perf-profile.calltrace.cycles-pp.ttwu_do_activate.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_sync_key
      1.68            +0.1        1.75        perf-profile.calltrace.cycles-pp.memcg_slab_post_alloc_hook.__kmem_cache_alloc_node.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb
      1.84            +0.1        1.92        perf-profile.calltrace.cycles-pp.__entry_text_start.__libc_write
      1.70            +0.1        1.77        perf-profile.calltrace.cycles-pp.__slab_free.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      1.59            +0.1        1.67        perf-profile.calltrace.cycles-pp.memcg_slab_post_alloc_hook.kmem_cache_alloc_node.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      1.91            +0.1        1.98        perf-profile.calltrace.cycles-pp.__slab_free.skb_release_data.consume_skb.unix_stream_read_generic.unix_stream_recvmsg
      0.93            +0.1        1.01        perf-profile.calltrace.cycles-pp.security_socket_recvmsg.sock_recvmsg.sock_read_iter.vfs_read.ksys_read
      1.24            +0.1        1.32        perf-profile.calltrace.cycles-pp.__check_object_size.skb_copy_datagram_from_iter.unix_stream_sendmsg.sock_write_iter.vfs_write
      1.75            +0.1        1.86        perf-profile.calltrace.cycles-pp.__entry_text_start.__libc_read
      2.40            +0.1        2.52        perf-profile.calltrace.cycles-pp.check_heap_object.__check_object_size.simple_copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter
      2.41            +0.1        2.54 ±  2%  perf-profile.calltrace.cycles-pp.__schedule.schedule.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic
      3.05            +0.1        3.18        perf-profile.calltrace.cycles-pp.skb_copy_datagram_from_iter.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write
      2.45            +0.1        2.59 ±  2%  perf-profile.calltrace.cycles-pp.schedule.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg
      3.48            +0.1        3.62 ±  2%  perf-profile.calltrace.cycles-pp.unix_destruct_scm.skb_release_head_state.consume_skb.unix_stream_read_generic.unix_stream_recvmsg
      2.55            +0.1        2.70 ±  2%  perf-profile.calltrace.cycles-pp.schedule_timeout.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      3.58            +0.2        3.73        perf-profile.calltrace.cycles-pp.__kmem_cache_free.skb_release_data.consume_skb.unix_stream_read_generic.unix_stream_recvmsg
      3.07            +0.2        3.23 ±  2%  perf-profile.calltrace.cycles-pp.unix_stream_data_wait.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      3.19            +0.2        3.36        perf-profile.calltrace.cycles-pp.__check_object_size.simple_copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor
      3.43            +0.2        3.62        perf-profile.calltrace.cycles-pp.simple_copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic
      3.44            +0.2        3.66 ±  2%  perf-profile.calltrace.cycles-pp._copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic
      5.51            +0.3        5.76        perf-profile.calltrace.cycles-pp.kmem_cache_free.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      7.13            +0.4        7.56        perf-profile.calltrace.cycles-pp.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic.unix_stream_recvmsg
      7.33            +0.4        7.77        perf-profile.calltrace.cycles-pp.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      7.43            +0.4        7.87        perf-profile.calltrace.cycles-pp.unix_stream_read_actor.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
     11.75 ±  3%      -3.9        7.87 ±  4%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
     14.09 ±  2%      -3.8       10.26 ±  3%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      6.76 ±  3%      -2.6        4.19 ±  6%  perf-profile.children.cycles-pp.__unfreeze_partials
      4.66 ±  3%      -1.7        2.98 ±  5%  perf-profile.children.cycles-pp.get_partial_node
      5.53 ±  2%      -1.5        4.02 ±  4%  perf-profile.children.cycles-pp.___slab_alloc
     10.25 ±  2%      -1.2        9.08        perf-profile.children.cycles-pp.skb_release_data
     14.45            -1.0       13.44        perf-profile.children.cycles-pp.consume_skb
     16.26            -0.9       15.32        perf-profile.children.cycles-pp.__alloc_skb
     16.53            -0.9       15.61        perf-profile.children.cycles-pp.alloc_skb_with_frags
     41.65            -0.9       40.76        perf-profile.children.cycles-pp.unix_stream_read_generic
     41.90            -0.9       41.03        perf-profile.children.cycles-pp.unix_stream_recvmsg
     19.57            -0.8       18.78        perf-profile.children.cycles-pp.sock_alloc_send_pskb
     43.15            -0.8       42.37        perf-profile.children.cycles-pp.sock_recvmsg
     44.10            -0.7       43.36        perf-profile.children.cycles-pp.sock_read_iter
      7.32 ±  2%      -0.7        6.66        perf-profile.children.cycles-pp.__kmem_cache_alloc_node
      7.75 ±  2%      -0.6        7.11        perf-profile.children.cycles-pp.__kmalloc_node_track_caller
     46.92            -0.6       46.30        perf-profile.children.cycles-pp.vfs_read
      8.32 ±  2%      -0.6        7.72        perf-profile.children.cycles-pp.kmalloc_reserve
     47.82            -0.6       47.26        perf-profile.children.cycles-pp.ksys_read
      6.16 ±  2%      -0.4        5.72        perf-profile.children.cycles-pp.kmem_cache_alloc_node
     93.67            -0.3       93.33        perf-profile.children.cycles-pp.do_syscall_64
     94.20            -0.3       93.88        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     52.43            -0.3       52.12        perf-profile.children.cycles-pp.__libc_read
      0.10 ±  7%      -0.0        0.07 ±  5%  perf-profile.children.cycles-pp.get_any_partial
      0.18 ±  2%      +0.0        0.20 ±  2%  perf-profile.children.cycles-pp.wake_affine
      0.30            +0.0        0.31        perf-profile.children.cycles-pp.__scm_recv_common
      0.22            +0.0        0.23 ±  2%  perf-profile.children.cycles-pp.kfree
      0.17 ±  2%      +0.0        0.19 ±  3%  perf-profile.children.cycles-pp.__switch_to
      0.29            +0.0        0.31 ±  2%  perf-profile.children.cycles-pp.restore_fpregs_from_fpstate
      0.34            +0.0        0.35        perf-profile.children.cycles-pp.wait_for_unix_gc
      0.22 ±  2%      +0.0        0.24 ±  2%  perf-profile.children.cycles-pp.check_stack_object
      0.46 ±  2%      +0.0        0.48        perf-profile.children.cycles-pp.rcu_all_qs
      0.26            +0.0        0.28 ±  3%  perf-profile.children.cycles-pp.current_obj_cgroup
      0.48            +0.0        0.51        perf-profile.children.cycles-pp.mutex_unlock
      0.33 ±  2%      +0.0        0.36        perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      0.68            +0.0        0.71        perf-profile.children.cycles-pp.update_load_avg
      0.35            +0.0        0.38 ±  2%  perf-profile.children.cycles-pp.kmalloc_size_roundup
      0.42            +0.0        0.44        perf-profile.children.cycles-pp.syscall_enter_from_user_mode
      0.40            +0.0        0.43        perf-profile.children.cycles-pp.kmalloc_slab
      0.40            +0.0        0.42 ±  2%  perf-profile.children.cycles-pp.aa_file_perm
      0.40            +0.0        0.43        perf-profile.children.cycles-pp.switch_fpu_return
      0.67            +0.0        0.70        perf-profile.children.cycles-pp.exit_to_user_mode_loop
      0.79            +0.0        0.81        perf-profile.children.cycles-pp.skb_unlink
      0.48            +0.0        0.51 ±  2%  perf-profile.children.cycles-pp.__get_task_ioprio
      0.54 ±  2%      +0.0        0.56        perf-profile.children.cycles-pp.update_curr
      0.29            +0.0        0.32 ±  2%  perf-profile.children.cycles-pp.__list_del_entry_valid_or_report
      0.48 ±  2%      +0.0        0.50        perf-profile.children.cycles-pp.dequeue_entity
      0.50            +0.0        0.53 ±  2%  perf-profile.children.cycles-pp.switch_mm_irqs_off
      0.64            +0.0        0.67        perf-profile.children.cycles-pp.__build_skb_around
      0.91            +0.0        0.95        perf-profile.children.cycles-pp.unix_write_space
      0.70            +0.0        0.74        perf-profile.children.cycles-pp.enqueue_entity
      0.73            +0.0        0.77        perf-profile.children.cycles-pp.refill_obj_stock
      0.69            +0.0        0.74        perf-profile.children.cycles-pp.mutex_lock
      0.86            +0.0        0.91        perf-profile.children.cycles-pp.dequeue_task_fair
      0.78            +0.1        0.83        perf-profile.children.cycles-pp.__check_heap_object
      0.14 ±  3%      +0.1        0.19 ±  3%  perf-profile.children.cycles-pp.__list_add_valid_or_report
      1.44            +0.1        1.49        perf-profile.children.cycles-pp.apparmor_file_permission
      1.18 ±  2%      +0.1        1.24        perf-profile.children.cycles-pp.security_socket_sendmsg
      1.20            +0.1        1.26        perf-profile.children.cycles-pp.activate_task
      1.11            +0.1        1.17        perf-profile.children.cycles-pp.enqueue_task_fair
      1.22            +0.1        1.28        perf-profile.children.cycles-pp.__cond_resched
      1.36            +0.1        1.42        perf-profile.children.cycles-pp.exit_to_user_mode_prepare
      1.83            +0.1        1.90        perf-profile.children.cycles-pp.security_file_permission
      1.32            +0.1        1.40        perf-profile.children.cycles-pp.ttwu_do_activate
      1.36            +0.1        1.44        perf-profile.children.cycles-pp.obj_cgroup_charge
      0.98            +0.1        1.06        perf-profile.children.cycles-pp.security_socket_recvmsg
      1.85            +0.1        1.94        perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      1.54            +0.1        1.63        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      2.14            +0.1        2.24        perf-profile.children.cycles-pp.__entry_text_start
      1.58 ±  2%      +0.1        1.68 ±  2%  perf-profile.children.cycles-pp.aa_sk_perm
      2.81            +0.1        2.94        perf-profile.children.cycles-pp.mod_objcg_state
      3.26            +0.1        3.40 ±  2%  perf-profile.children.cycles-pp.sock_wfree
      3.68            +0.1        3.82        perf-profile.children.cycles-pp.skb_release_head_state
      3.13            +0.1        3.27        perf-profile.children.cycles-pp.skb_copy_datagram_from_iter
      3.65            +0.2        3.80        perf-profile.children.cycles-pp.__slab_free
      3.06            +0.2        3.22        perf-profile.children.cycles-pp.schedule_timeout
      3.36            +0.2        3.52        perf-profile.children.cycles-pp.memcg_slab_post_alloc_hook
      3.64            +0.2        3.80        perf-profile.children.cycles-pp.__kmem_cache_free
      3.09            +0.2        3.25 ±  2%  perf-profile.children.cycles-pp.unix_stream_data_wait
      3.18            +0.2        3.34        perf-profile.children.cycles-pp.check_heap_object
      3.42            +0.2        3.60        perf-profile.children.cycles-pp.schedule
      3.44            +0.2        3.61        perf-profile.children.cycles-pp.__schedule
      4.34            +0.2        4.52 ±  2%  perf-profile.children.cycles-pp._raw_spin_lock
      3.47            +0.2        3.66        perf-profile.children.cycles-pp.simple_copy_to_iter
      3.46            +0.2        3.69 ±  2%  perf-profile.children.cycles-pp._copy_to_iter
      5.58            +0.3        5.84        perf-profile.children.cycles-pp.kmem_cache_free
      4.77            +0.3        5.05        perf-profile.children.cycles-pp.__check_object_size
      7.19            +0.4        7.62        perf-profile.children.cycles-pp.__skb_datagram_iter
      7.37            +0.4        7.81        perf-profile.children.cycles-pp.skb_copy_datagram_iter
      7.47            +0.4        7.92        perf-profile.children.cycles-pp.unix_stream_read_actor
     11.73 ±  3%      -3.9        7.85 ±  5%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      0.35 ±  2%      -0.3        0.06 ±  7%  perf-profile.self.cycles-pp.__unfreeze_partials
      0.30            -0.1        0.16 ±  3%  perf-profile.self.cycles-pp.get_partial_node
      0.23            +0.0        0.24        perf-profile.self.cycles-pp.__scm_recv_common
      0.12            +0.0        0.13        perf-profile.self.cycles-pp.pick_next_task_fair
      0.20            +0.0        0.21        perf-profile.self.cycles-pp.kfree
      0.17            +0.0        0.18 ±  2%  perf-profile.self.cycles-pp.check_stack_object
      0.16 ±  2%      +0.0        0.18 ±  2%  perf-profile.self.cycles-pp.kmalloc_size_roundup
      0.30            +0.0        0.31        perf-profile.self.cycles-pp.sock_recvmsg
      0.24            +0.0        0.25        perf-profile.self.cycles-pp.__kmalloc_node_track_caller
      0.17 ±  2%      +0.0        0.18 ±  2%  perf-profile.self.cycles-pp.rw_verify_area
      0.11 ±  3%      +0.0        0.12 ±  3%  perf-profile.self.cycles-pp.try_charge_memcg
      0.25 ±  2%      +0.0        0.27 ±  2%  perf-profile.self.cycles-pp.exit_to_user_mode_prepare
      0.23 ±  2%      +0.0        0.25 ±  3%  perf-profile.self.cycles-pp.__enqueue_entity
      0.21            +0.0        0.23 ±  3%  perf-profile.self.cycles-pp.current_obj_cgroup
      0.26            +0.0        0.28 ±  2%  perf-profile.self.cycles-pp.ksys_read
      0.28 ±  2%      +0.0        0.30        perf-profile.self.cycles-pp.kmalloc_reserve
      0.30            +0.0        0.31        perf-profile.self.cycles-pp.alloc_skb_with_frags
      0.28            +0.0        0.30        perf-profile.self.cycles-pp._raw_spin_unlock_irqrestore
      0.30            +0.0        0.32        perf-profile.self.cycles-pp.__skb_datagram_iter
      0.42            +0.0        0.44 ±  2%  perf-profile.self.cycles-pp.__get_task_ioprio
      0.30            +0.0        0.32        perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.24            +0.0        0.26        perf-profile.self.cycles-pp.update_curr
      0.46            +0.0        0.48        perf-profile.self.cycles-pp.mutex_unlock
      0.36            +0.0        0.38        perf-profile.self.cycles-pp.syscall_enter_from_user_mode
      0.44 ±  2%      +0.0        0.47        perf-profile.self.cycles-pp.mutex_lock
      0.34 ±  2%      +0.0        0.36        perf-profile.self.cycles-pp.skb_copy_datagram_from_iter
      0.56            +0.0        0.58 ±  2%  perf-profile.self.cycles-pp.__virt_addr_valid
      0.50            +0.0        0.52 ±  2%  perf-profile.self.cycles-pp.switch_mm_irqs_off
      0.61            +0.0        0.64        perf-profile.self.cycles-pp.do_syscall_64
      0.29            +0.0        0.32        perf-profile.self.cycles-pp.__list_del_entry_valid_or_report
      0.56            +0.0        0.59        perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.48            +0.0        0.51        perf-profile.self.cycles-pp.sock_alloc_send_pskb
      0.92            +0.0        0.95        perf-profile.self.cycles-pp.__libc_write
      0.53            +0.0        0.57        perf-profile.self.cycles-pp.unix_write_space
      0.42            +0.0        0.45 ±  2%  perf-profile.self.cycles-pp.__schedule
      0.59            +0.0        0.62        perf-profile.self.cycles-pp.__build_skb_around
      0.68            +0.0        0.72        perf-profile.self.cycles-pp.refill_obj_stock
      0.94            +0.0        0.98        perf-profile.self.cycles-pp.sock_read_iter
      0.68            +0.0        0.72        perf-profile.self.cycles-pp.__check_object_size
      0.70            +0.0        0.74        perf-profile.self.cycles-pp.__cond_resched
      0.89            +0.0        0.94        perf-profile.self.cycles-pp.obj_cgroup_charge
      0.13            +0.1        0.18 ±  3%  perf-profile.self.cycles-pp.__list_add_valid_or_report
      0.73            +0.1        0.78        perf-profile.self.cycles-pp.__check_heap_object
      1.43            +0.1        1.49        perf-profile.self.cycles-pp.vfs_read
      1.11            +0.1        1.17        perf-profile.self.cycles-pp.kmem_cache_alloc_node
      1.18            +0.1        1.24        perf-profile.self.cycles-pp.__alloc_skb
      1.24            +0.1        1.30        perf-profile.self.cycles-pp.sock_write_iter
      1.37            +0.1        1.44        perf-profile.self.cycles-pp.vfs_write
      1.48            +0.1        1.56        perf-profile.self.cycles-pp.__kmem_cache_alloc_node
      1.21 ±  2%      +0.1        1.30 ±  2%  perf-profile.self.cycles-pp.aa_sk_perm
      1.49            +0.1        1.58        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      2.18            +0.1        2.28        perf-profile.self.cycles-pp.memcg_slab_post_alloc_hook
      2.21            +0.1        2.32        perf-profile.self.cycles-pp.__kmem_cache_free
      2.51            +0.1        2.63        perf-profile.self.cycles-pp.mod_objcg_state
      2.34            +0.1        2.47        perf-profile.self.cycles-pp.check_heap_object
      3.46            +0.1        3.59 ±  2%  perf-profile.self.cycles-pp._raw_spin_lock
      3.42            +0.1        3.57        perf-profile.self.cycles-pp.unix_stream_read_generic
      3.59            +0.2        3.74        perf-profile.self.cycles-pp.__slab_free
      0.86            +0.2        1.02        perf-profile.self.cycles-pp.___slab_alloc
      4.32            +0.2        4.52        perf-profile.self.cycles-pp.kmem_cache_free
      3.42            +0.2        3.64 ±  2%  perf-profile.self.cycles-pp._copy_to_iter



Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

