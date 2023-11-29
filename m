Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D569E14277
	for <oe-lkp@lists.linux.dev>; Wed, 29 Nov 2023 13:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cYVR221c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701266193; x=1732802193;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=AIJ6Vz0oDMtLjhQz/a1llwYw8eg4pgc7+PpxLCqRpOo=;
  b=cYVR221c9rlinrNFvCQofYT4O8ysquvh6S2Jymgg+Z+KKMF6QIvMedlh
   JXxvmsrWYfEsZYrO5nCkmojvD1vHKxqV7wfVOtaanLDLTpNUrpgKSUbst
   dTwOZDrN8jXedX8Qhzclv3qQ1TuBdHQO+mjjAIbYBpMabglUED1G4vjKB
   IJUkdsHEHqXQQg37u3siorDLd03Z2EpRyoac/SdPaGsdDOSc1gUwftTex
   O1A6IXl4eKx8Pi646MESqrBy1w99qI4Q4YHXBbsPwj9O2bRyGpd6TocWa
   5iD2EHL0pbjIwrdyhDchEv+uWlCnylgAKCAkFzV1Q0lx3Nm9+l6473xh/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="150873"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="150873"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 05:56:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="718764712"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="718764712"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 29 Nov 2023 05:56:30 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 05:56:29 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 05:56:29 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 05:56:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=do4WUG7y8VHDiX2UNsTbqZS/QXNaAKlzpSSZg1DD6Vw424HQbS0208ck0UUD5XM0YYLeqcINJx2kb1QLR3Ha3aH8LHldFkfdiRQWp/hooOtD4LuR7wYyeuTLIH5vOEaSm94BKvjvE6kkF9Ab+KOJzAm6sV21nsZoXvApaVfRJnqB//+3qn6k+4HHn+ibFWuiLRRuM0bRP/NRzyTTXTCel0Aqor3Y+/YQVQQ2+O15Y0a5Y/PsZsKgWNArjDfHOO/Vpcc4SSCXp3U0Gx1B7RY71DJWcbT0pwROQg8ZrPCfX/b3CyqIzQLQKcVyjlV6t2mnYp4wNO+bxzu61rnYFqCSOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GVECYbvcr6+qFjdb50yWyH+MMg+is8pk2h2o79xQ5U4=;
 b=XJ3dNf2KLbjDLAul+hloCquDGUJkedO7by8LkXInNvIvQyJWp6xC+ph7ekckAEJCOKn9C3rSDx8kkhTWYPCHMmEn89+qvAWld380A+2suol+8GW5Hyo33s4gzBl3xbPWUd5GJzQkYN3QCuF8FmL2wJo5CSQf9MrWOQWg+pSGszeSVF7ka3b7bMBYA6Qvlnvg218BMXRI3eNZUxa/JIhCy4RB/g0MRVQ/o3AVYfxdI2M2nGBdKCBRyVsewjz0F1IKYFHGeGWBJo7p0GoGSXhNW9/2xn0MwxO2MqCQ72IFjUYHwd8jXWB3K7lk+opo+3pclCPPtzhhhqZgIG//RCIk1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SA0PR11MB4527.namprd11.prod.outlook.com (2603:10b6:806:72::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 13:56:26 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::1236:9a2e:5acd:a7f]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::1236:9a2e:5acd:a7f%3]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 13:56:26 +0000
Date: Wed, 29 Nov 2023 21:56:19 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [peterz-queue:sched/more] [sched/rt]  1043d3cd80:
 phoronix-test-suite.svt-hevc.1.Bosphorus1080p.frames_per_second 2.9%
 improvement
Message-ID: <202311291645.6c800a24-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:4:196::20) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SA0PR11MB4527:EE_
X-MS-Office365-Filtering-Correlation-Id: acdba8f0-2c45-4402-75af-08dbf0e2fac6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tyVNzFOyR4eTHp3bN8t/wOd5w6wOk/SPXEnUGaOc9Bj+H4kStLY4K1Jk3PEOKzuwH6i6UtyRX+hVwaBaqF46Uaqb4My8Y0UMP89DjB+KeKTOavPDocrd7rMLFH4IzRYWopX40ZM8FGukxeCRh2VkiYdNKpBMXR2k3noGRaP5UB/A87XHLdgW0PBG/C+jMLoVi3TlL80qOfv5FzmfLJd83e40uVhfxM0r/yAzxlTqQGZdH2py+nVb8MEPTvzUPDMRzwTQIhpiub7nueWIo59vIjHaV6EIq/Hv5WiDLMz3IfzHOJypAeszgn1CVDr0UXk4PZjfPH+lkGfBYmP5XNPIMe2TQWhfcOIIhjbLltXAmLM2VbIQqomsflKhhdfCXp3qc7VG/VPvYA21vuEdN8HLIN1DsUgE01mlrRl7kt4TPpMUQuEZs2yDdYo4n73uw4VhlbtLwFrtgwso5KHnD/0/DvEQlmtEPVab76M2X6x8mO/fRhlEus7yHcpF7TDKdKLzouSSWbcXce6z+lCWu4bV0d2RZ62X0vrl5XMgafooUfmujv998w8QQrFy2xV2EvUFWpLvsLQnfoFRKIwSW/jnaeDFKClwqoy5aTrlkdg5m3zKY3TEB1IITWjPhxD/mSoDn7Ksp70pG+0VO8mSVX6/NQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(366004)(376002)(346002)(230473577357003)(230922051799003)(230373577357003)(186009)(451199024)(64100799003)(1800799012)(26005)(6666004)(478600001)(107886003)(2616005)(6512007)(1076003)(83380400001)(6506007)(2906002)(5660300002)(6486002)(966005)(66946007)(41300700001)(30864003)(8936002)(8676002)(6916009)(66556008)(66476007)(4326008)(316002)(82960400001)(86362001)(36756003)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?gL1giV2CP+ko72Ei7IPf88+chuf9AkhF8VpD8YyCyB/LQaIR+nO8ohZ8VK?=
 =?iso-8859-1?Q?yVbJ8o9MbVCBKgBfs5bIChQZ6IwvvXNUGQRwI0bNAblZDNAcuIYyM+DDvQ?=
 =?iso-8859-1?Q?qFjKbfBvDvWRLGWZ3I5KNvK6Zi2GVAACpP72UyqUyG6N32QAk0cEcG1odW?=
 =?iso-8859-1?Q?WluliUWOvkDIt6rIzFiAq4ylVfGhCn0Ut/ql+J3xcDY9I/NbhCampShyib?=
 =?iso-8859-1?Q?sWxcjUOfxiGdj7dDZLGDaSaB9Glmg4Sverd5oXJm5n6fiw03cd47lyBmpe?=
 =?iso-8859-1?Q?FLlPF4Hf8OcdclpjZ0vZoEnufLSQQyQnVqaHHcHsFqXsnFLbLD/+Lt3h4q?=
 =?iso-8859-1?Q?Rth744j7Xj01y0bYBfbtLTiKmEHMDpmnL8MrZAEpGruNm9nSyto+5X/sbi?=
 =?iso-8859-1?Q?jb0xvDSSBDB57bzb49EcQuYvNdTFSc9yoaZH55j7Nn2Yf69J9cspW3ljvQ?=
 =?iso-8859-1?Q?olWKqTCuLXm29K6t5erdTnRGcoQI5O2DObsfmWvlzreGaiJ44US1bYzaOQ?=
 =?iso-8859-1?Q?oTHSsoJ1EQSJ+e04ORF8y8MLVgRlren3BZBEExSMmwQC6phFHQK/DTtJ6i?=
 =?iso-8859-1?Q?0dkS7dyFbs67HskZ1UnrtG+bsPx4lE72qr1dttAv/gH1VBBvODTrZip5yk?=
 =?iso-8859-1?Q?J3IOG5NzM10FDgE0XGCAlGkRCg9jOK/P1caTJLe+LtA/k+FD/W2pTKnTtX?=
 =?iso-8859-1?Q?i0OD/PjMfY7j4goSF7mAgNKl3vad+nwvdAlVT/OqG9nsTEK6CR3kYi2QE7?=
 =?iso-8859-1?Q?rhygoWKMg3wSY3bgYUEjjnLR3NyiFb6TX5nOGZmgtMFce6OTj70G8IndBu?=
 =?iso-8859-1?Q?+KDurowo9zfZi3M2VfGDH22LLnOlFM7ntg2d3jU4F6DfPvkuDoh4w9k8S1?=
 =?iso-8859-1?Q?H+YT4chLNnT9ur2w1q/yAo5cz053GGO0JhCCiiwQFqV5Mr+XskqsffSwNj?=
 =?iso-8859-1?Q?W09dhZUBPPj32WJhGRb9tf6DbiRVarXJ8iAQ7XhlDQmYUJslbrjUbE1gsC?=
 =?iso-8859-1?Q?HFi9EDyfkzj5/KfEY1lD5EEwi3/xK3kyCslUul7kydhDd1ufkG/hnZOggS?=
 =?iso-8859-1?Q?0xRU7dkDbNtKmhuB9C5S0hmI0ro7NBjaOavMwauH9foxP3kNZyJVPIJAd0?=
 =?iso-8859-1?Q?K57nGQKmMyqDpS+rMZEBYYKJGIkwHM5E2uMp8x/jXiA7EsCAilz1Q09uek?=
 =?iso-8859-1?Q?KphlWV3aHbn2M1pAZjVyy2CzVx4ZGrcpDWDhJEmZBSYaRs/mMdBbOSh7tu?=
 =?iso-8859-1?Q?/kT4c4YXrm0pn5y7zWJlCABpmer7DucQIdLCQPLNx9RknHRRdUqZAM9+b6?=
 =?iso-8859-1?Q?O1k7UhZTt5m3q30BJSZ9DdFE4tCkWN2a0DzOGbbf6tzdFRoQ414ZXIJNrb?=
 =?iso-8859-1?Q?JusIA6MSkPgruq/4YqR1+dhUVR87XKKypZHHwku0nsWQoLO49rulOPlYJB?=
 =?iso-8859-1?Q?XGxydviGXCOOXwDbhWqEKinPuKEgi5Uz2VqceCGjENxKa6Q0veeAMoAuFY?=
 =?iso-8859-1?Q?dmBKZBD//u9hyWuFJb/u2naZIOuUzciHepbg/yKtBr2tvJXOg0CWh8yTjO?=
 =?iso-8859-1?Q?UQHRWmz5JlQ04/qVMafkMvlXoAAReKtNVlPiRcLdkRlG3qtAJ01anpKViE?=
 =?iso-8859-1?Q?V2oMbR4MUIZBW5IBCN2/tdMxF9+r3sQhOT97xfS5FeZaoLI5enXlOO3g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: acdba8f0-2c45-4402-75af-08dbf0e2fac6
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 13:56:26.6931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sNEw3t7hJrDLR8RU8PMfk7vBsPYYmdgen4nrNMaedGChLPapF8BN+L1yFKmvIz9I8XLZAjyB6ugfxTUcXCNZ6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4527
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 2.9% improvement of phoronix-test-suite.svt-hevc.1.Bosphorus1080p.frames_per_second on:


commit: 1043d3cd803f423d89c50e92a65fb6ef518e9047 ("sched/rt: Remove default bandwidth control")
https://git.kernel.org/cgit/linux/kernel/git/peterz/queue.git sched/more

testcase: phoronix-test-suite
test machine: 12 threads 1 sockets Intel(R) Core(TM) i7-8700 CPU @ 3.20GHz (Coffee Lake) with 16G memory
parameters:

	test: svt-hevc-1.2.0
	cpufreq_governor: performance






Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20231129/202311291645.6c800a24-oliver.sang@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-8.3/debian-x86_64-phoronix/lkp-cfl-d1/svt-hevc-1.2.0/phoronix-test-suite

commit: 
  4ed76ea8e7 ("sched/fair: Fair server interface")
  1043d3cd80 ("sched/rt: Remove default bandwidth control")

4ed76ea8e7dc5892 1043d3cd803f423d89c50e92a65 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     31388 ±  2%     -25.9%      23259 ±  6%  meminfo.Active(anon)
    632.63 ±  9%     -30.0%     442.91 ±  7%  uptime.idle
 5.208e+08 ± 10%     -36.8%  3.291e+08 ± 10%  cpuidle..time
    886327 ±  6%     -35.2%     574696 ±  5%  cpuidle..usage
    151.50 ±  9%     -36.4%      96.33 ± 16%  perf-c2c.DRAM.local
     12.00 ± 29%     -54.2%       5.50 ± 34%  perf-c2c.HITM.local
      0.02 ±  4%      +0.0        0.02 ±  6%  mpstat.cpu.all.iowait%
      0.02 ±  3%      +0.0        0.02 ±  5%  mpstat.cpu.all.soft%
      0.21 ±  2%      +0.1        0.27 ± 16%  mpstat.cpu.all.sys%
      4.25            +2.9%       4.37        phoronix-test-suite.svt-hevc.1.Bosphorus1080p.frames_per_second
    446.88            -2.7%     434.97        phoronix-test-suite.time.elapsed_time
    446.88            -2.7%     434.97        phoronix-test-suite.time.elapsed_time.max
      4374           +70.2%       7443 ±  2%  vmstat.io.bi
      0.02 ± 30%    +246.6%       0.06 ± 20%  vmstat.procs.b
      2.42 ± 11%   +1086.8%      28.78 ±  2%  vmstat.procs.r
      1945           +39.8%       2719 ±  3%  vmstat.system.cs
     14810           +71.6%      25412        vmstat.system.in
     17386 ±  6%     -27.4%      12622 ± 15%  turbostat.C1
     11.83 ± 55%    +170.4%      32.00 ± 24%  turbostat.C10
    255209 ±  2%     -15.5%     215757 ±  3%  turbostat.C1E
      0.30            -0.1        0.25 ±  4%  turbostat.C1E%
     22110 ±  4%     -63.6%       8052 ±  6%  turbostat.C3
      0.06 ±  7%      -0.0        0.03        turbostat.C3%
    309963 ±  9%     -58.9%     127423 ± 13%  turbostat.C6
      4.78 ±  9%      -2.7        2.12 ± 14%  turbostat.C6%
      2.69 ±  5%     -32.4%       1.82 ±  5%  turbostat.CPU%c1
      0.07 ± 11%     -55.0%       0.03        turbostat.CPU%c3
      4.32 ±  9%     -52.2%       2.07 ± 14%  turbostat.CPU%c6
     37320 ±  4%     -77.6%       8355 ± 13%  turbostat.POLL
      3.70 ± 21%     -43.0%       2.11 ± 25%  turbostat.Pkg%pc2
      7846 ±  2%     -26.2%       5792 ±  5%  proc-vmstat.nr_active_anon
    664668            -6.4%     622095        proc-vmstat.nr_anon_pages
    308525            +1.4%     312813        proc-vmstat.nr_dirty_background_threshold
    617805            +1.4%     626392        proc-vmstat.nr_dirty_threshold
    898126            -2.8%     873347        proc-vmstat.nr_file_pages
   2421157            +2.7%    2486837        proc-vmstat.nr_free_pages
    844785            -5.0%     802340        proc-vmstat.nr_inactive_anon
    439266            -2.7%     427320        proc-vmstat.nr_inactive_file
      7654            -1.5%       7542        proc-vmstat.nr_kernel_stack
      3446            -4.0%       3307        proc-vmstat.nr_page_table_pages
    187324            -1.1%     185293        proc-vmstat.nr_shmem
      7846 ±  2%     -26.2%       5792 ±  5%  proc-vmstat.nr_zone_active_anon
    844784            -5.0%     802339        proc-vmstat.nr_zone_inactive_anon
    439266            -2.7%     427320        proc-vmstat.nr_zone_inactive_file
   2886194            -8.3%    2647433        proc-vmstat.numa_hit
   2886216            -8.3%    2647596        proc-vmstat.numa_local
   3111710            -7.9%    2866316        proc-vmstat.pgalloc_normal
   2750150           -14.3%    2355639        proc-vmstat.pgfault
   2587393            -9.4%    2344596        proc-vmstat.pgfree
    161773           -45.2%      88631        proc-vmstat.pgreuse
      3.18 ±  7%     +53.4%       4.88 ± 14%  perf-stat.i.MPKI
 4.044e+09           -17.3%  3.343e+09 ±  3%  perf-stat.i.branch-instructions
      2.25 ±  4%      +1.3        3.54 ± 10%  perf-stat.i.branch-miss-rate%
  80016824           -10.0%   72012661 ±  3%  perf-stat.i.branch-misses
 1.478e+08 ±  2%     -20.1%  1.181e+08 ±  4%  perf-stat.i.cache-misses
 1.377e+09           -19.4%  1.109e+09 ±  3%  perf-stat.i.cache-references
      1985          +196.9%       5895 ±  5%  perf-stat.i.context-switches
      0.85 ±  6%     +76.0%       1.50 ± 13%  perf-stat.i.cpi
     12173            +3.7%      12623        perf-stat.i.cpu-clock
 3.872e+10           -15.7%  3.263e+10 ±  2%  perf-stat.i.cpu-cycles
    241.37           -18.5%     196.72 ±  3%  perf-stat.i.cpu-migrations
    285.44 ±  2%     +28.2%     365.89 ±  8%  perf-stat.i.cycles-between-cache-misses
      0.06 ± 37%      +0.2        0.25 ± 20%  perf-stat.i.dTLB-load-miss-rate%
    910996            +3.1%     938831        perf-stat.i.dTLB-load-misses
 1.172e+10           -15.9%  9.861e+09 ±  2%  perf-stat.i.dTLB-loads
      0.03 ± 16%      +0.0        0.07 ± 19%  perf-stat.i.dTLB-store-miss-rate%
    659882            -7.3%     611432 ±  2%  perf-stat.i.dTLB-store-misses
 4.965e+09           -19.8%  3.981e+09 ±  3%  perf-stat.i.dTLB-stores
      8.84 ± 11%     +11.8       20.67 ±  8%  perf-stat.i.iTLB-load-miss-rate%
   4489221           -23.2%    3447186 ±  3%  perf-stat.i.iTLB-loads
 5.594e+10           -17.6%   4.61e+10 ±  2%  perf-stat.i.instructions
    236957 ±  7%     -26.8%     173382 ±  4%  perf-stat.i.instructions-per-iTLB-miss
      1.39           -15.4%       1.18 ±  3%  perf-stat.i.ipc
      0.63 ± 12%     -39.1%       0.38 ±  6%  perf-stat.i.major-faults
      0.59           +21.3%       0.71 ±  3%  perf-stat.i.metric.G/sec
      3.18           -21.2%       2.51 ±  3%  perf-stat.i.metric.GHz
    616.76           -17.4%     509.21 ±  4%  perf-stat.i.metric.K/sec
      1228           -43.0%     700.70 ±  3%  perf-stat.i.metric.M/sec
      5626 ±  4%    +180.3%      15768 ±  5%  perf-stat.i.minor-faults
      0.00 ± 14%      +0.0        0.00 ± 14%  perf-stat.i.node-load-miss-rate%
      5.68 ±  5%    +256.0%      20.22 ±  6%  perf-stat.i.node-load-misses
   2239893 ±  3%     -13.6%    1935971 ±  3%  perf-stat.i.node-loads
      0.00 ± 15%      +0.0        0.00 ± 14%  perf-stat.i.node-store-miss-rate%
      5.78 ± 13%    +254.6%      20.50 ±  5%  perf-stat.i.node-store-misses
  26794808 ±  2%     -21.5%   21038756 ±  4%  perf-stat.i.node-stores
      5626 ±  4%    +180.3%      15769 ±  5%  perf-stat.i.page-faults
     12173            +3.7%      12623        perf-stat.i.task-clock
      0.01            -0.0        0.01 ± 44%  perf-stat.overall.dTLB-load-miss-rate%
      0.01            -0.0        0.01 ± 44%  perf-stat.overall.dTLB-store-miss-rate%
      1916           -30.4%       1334 ± 44%  perf-stat.ps.context-switches
    899262           -18.4%     733664 ± 44%  perf-stat.ps.dTLB-load-misses
      0.61 ± 11%     -79.3%       0.13 ± 45%  perf-stat.ps.major-faults
      5950           -26.7%       4360 ± 44%  perf-stat.ps.minor-faults
      5951           -26.7%       4360 ± 44%  perf-stat.ps.page-faults
      0.31 ± 16%    +219.1%       0.99 ±  9%  sched_debug.cfs_rq:/.h_nr_running.avg
      1.15 ± 11%    +145.5%       2.81 ± 15%  sched_debug.cfs_rq:/.h_nr_running.max
      0.42 ± 10%     +99.2%       0.84 ± 13%  sched_debug.cfs_rq:/.h_nr_running.stddev
    445.97 ± 54%    +660.8%       3392 ± 17%  sched_debug.cfs_rq:/.left_deadline.avg
      2703 ± 48%    +371.4%      12744 ± 12%  sched_debug.cfs_rq:/.left_deadline.max
    836.26 ± 48%    +388.9%       4088 ± 12%  sched_debug.cfs_rq:/.left_deadline.stddev
    445.72 ± 54%    +659.0%       3383 ± 17%  sched_debug.cfs_rq:/.left_vruntime.avg
      2701 ± 48%    +370.3%      12704 ± 12%  sched_debug.cfs_rq:/.left_vruntime.max
    835.68 ± 48%    +387.5%       4074 ± 12%  sched_debug.cfs_rq:/.left_vruntime.stddev
      0.30 ± 13%    +165.1%       0.80 ±  6%  sched_debug.cfs_rq:/.nr_running.avg
      1.08 ±  8%     +67.3%       1.81 ± 16%  sched_debug.cfs_rq:/.nr_running.max
      0.41 ±  7%     +40.3%       0.58 ± 16%  sched_debug.cfs_rq:/.nr_running.stddev
     30.98 ± 33%     -59.6%      12.51 ± 71%  sched_debug.cfs_rq:/.removed.load_avg.avg
     89.75 ± 36%     -57.8%      37.84 ± 60%  sched_debug.cfs_rq:/.removed.load_avg.stddev
     14.33 ± 26%     -87.0%       1.87 ±107%  sched_debug.cfs_rq:/.removed.util_avg.avg
    135.27 ± 33%     -83.4%      22.42 ±107%  sched_debug.cfs_rq:/.removed.util_avg.max
     40.97 ± 29%     -84.9%       6.20 ±107%  sched_debug.cfs_rq:/.removed.util_avg.stddev
    445.72 ± 54%    +659.0%       3383 ± 17%  sched_debug.cfs_rq:/.right_vruntime.avg
      2701 ± 48%    +370.3%      12704 ± 12%  sched_debug.cfs_rq:/.right_vruntime.max
    835.68 ± 48%    +387.5%       4074 ± 12%  sched_debug.cfs_rq:/.right_vruntime.stddev
    971.07 ± 11%     +95.3%       1896 ±  9%  sched_debug.cfs_rq:/.runnable_avg.avg
      3761 ± 16%     +80.2%       6778 ± 14%  sched_debug.cfs_rq:/.runnable_avg.max
      1040 ± 18%     +83.0%       1904 ± 12%  sched_debug.cfs_rq:/.runnable_avg.stddev
      0.00 ±223%  +5.3e+05%       0.04 ±117%  sched_debug.cfs_rq:/.spread.avg
      0.00 ±223%    +5e+05%       0.49 ±115%  sched_debug.cfs_rq:/.spread.max
      0.00 ±223%    +5e+05%       0.14 ±115%  sched_debug.cfs_rq:/.spread.stddev
    204.39 ±  7%     +14.4%     233.83 ± 10%  sched_debug.cfs_rq:/.util_avg.avg
    684.85 ±  5%     +20.1%     822.38 ± 12%  sched_debug.cfs_rq:/.util_avg.max
    197.55 ±  3%     +21.8%     240.71 ± 13%  sched_debug.cfs_rq:/.util_avg.stddev
     24.21 ± 38%    +195.2%      71.46 ± 27%  sched_debug.cfs_rq:/.util_est_enqueued.avg
    181.17 ± 29%    +174.5%     497.25 ± 22%  sched_debug.cfs_rq:/.util_est_enqueued.max
     54.13 ± 31%    +165.1%     143.49 ± 22%  sched_debug.cfs_rq:/.util_est_enqueued.stddev
    821436 ±  2%     -25.4%     612602 ±  6%  sched_debug.cpu.avg_idle.avg
    512405 ±  6%     -61.7%     196182 ± 34%  sched_debug.cpu.avg_idle.min
    148889 ±  6%     +58.0%     235205 ± 11%  sched_debug.cpu.avg_idle.stddev
      2.32 ±157%   +6039.0%     142.42 ± 63%  sched_debug.cpu.clock.stddev
     76.90 ± 12%    +174.8%     211.30 ± 42%  sched_debug.cpu.clock_task.stddev
      1311 ± 37%    +102.6%       2657 ±  4%  sched_debug.cpu.curr->pid.avg
      4473 ±  3%     -24.5%       3377        sched_debug.cpu.curr->pid.max
     41.50 ±141%   +2610.3%       1124 ± 32%  sched_debug.cpu.curr->pid.min
      1491 ±  3%     -49.5%     752.99 ± 18%  sched_debug.cpu.curr->pid.stddev
      0.00 ± 23%    +462.8%       0.00 ± 51%  sched_debug.cpu.next_balance.stddev
      0.48 ± 27%    +253.0%       1.71 ±  9%  sched_debug.cpu.nr_running.avg
      1.56 ± 21%    +133.3%       3.65 ± 16%  sched_debug.cpu.nr_running.max
      0.02 ±223%   +2700.0%       0.58 ± 31%  sched_debug.cpu.nr_running.min
      0.52 ± 12%     +78.5%       0.93 ± 22%  sched_debug.cpu.nr_running.stddev
     54670           -12.6%      47761 ±  3%  sched_debug.cpu.nr_switches.avg
     26882 ± 19%     -44.4%      14958 ±  8%  sched_debug.cpu.nr_switches.min
      1.25 ± 19%     -43.9%       0.70 ± 11%  sched_debug.rt_rq:.rt_nr_running.avg
      2.81 ± 25%     -52.6%       1.33 ± 29%  sched_debug.rt_rq:.rt_nr_running.max
      0.54 ± 36%     -92.3%       0.04 ±141%  sched_debug.rt_rq:.rt_nr_running.min
      0.71 ± 22%     -35.1%       0.46 ± 17%  sched_debug.rt_rq:.rt_nr_running.stddev
    950.00          -100.0%       0.00        sched_debug.rt_rq:.rt_runtime.avg
    950.00          -100.0%       0.00        sched_debug.rt_rq:.rt_runtime.max
    950.00          -100.0%       0.00        sched_debug.rt_rq:.rt_runtime.min
      0.58 ± 26%    -100.0%       0.00        sched_debug.rt_rq:.rt_throttled.avg
      0.67 ± 25%    -100.0%       0.00        sched_debug.rt_rq:.rt_throttled.max
      0.35 ± 42%    -100.0%       0.00        sched_debug.rt_rq:.rt_throttled.min
      0.13 ± 61%    -100.0%       0.00        sched_debug.rt_rq:.rt_throttled.stddev
    753.76 ± 11%    -100.0%       0.00        sched_debug.rt_rq:.rt_time.avg
    762.67 ± 10%    -100.0%       0.00        sched_debug.rt_rq:.rt_time.max
    744.90 ± 11%    -100.0%       0.00        sched_debug.rt_rq:.rt_time.min
      5.29 ± 76%    -100.0%       0.00        sched_debug.rt_rq:.rt_time.stddev
     25.39 ±  5%     -20.5        4.88 ± 29%  perf-profile.calltrace.cycles-pp.secondary_startup_64_no_verify
     24.10 ±  5%     -19.5        4.63 ± 28%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
     23.29 ±  6%     -19.1        4.23 ± 34%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     23.29 ±  6%     -19.1        4.23 ± 34%  perf-profile.calltrace.cycles-pp.start_secondary.secondary_startup_64_no_verify
     23.28 ±  6%     -19.0        4.23 ± 34%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     22.87 ±  6%     -18.7        4.15 ± 33%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     22.26 ±  6%     -18.1        4.11 ± 33%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
     20.65 ±  6%     -17.4        3.24 ± 35%  perf-profile.calltrace.cycles-pp.intel_idle_ibrs.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      2.10 ± 33%      -1.6        0.52 ±103%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.rest_init.arch_call_rest_init.start_kernel.x86_64_start_reservations
      2.10 ± 33%      -1.6        0.52 ±103%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.rest_init.arch_call_rest_init.start_kernel
      2.10 ± 33%      -1.6        0.52 ±103%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.rest_init.arch_call_rest_init
      2.10 ± 33%      -1.6        0.52 ±103%  perf-profile.calltrace.cycles-pp.arch_call_rest_init.start_kernel.x86_64_start_reservations.x86_64_start_kernel.secondary_startup_64_no_verify
      2.10 ± 33%      -1.6        0.52 ±103%  perf-profile.calltrace.cycles-pp.start_kernel.x86_64_start_reservations.x86_64_start_kernel.secondary_startup_64_no_verify
      2.10 ± 33%      -1.6        0.52 ±103%  perf-profile.calltrace.cycles-pp.rest_init.arch_call_rest_init.start_kernel.x86_64_start_reservations.x86_64_start_kernel
      2.10 ± 33%      -1.6        0.52 ±103%  perf-profile.calltrace.cycles-pp.x86_64_start_kernel.secondary_startup_64_no_verify
      2.10 ± 33%      -1.6        0.52 ±103%  perf-profile.calltrace.cycles-pp.x86_64_start_reservations.x86_64_start_kernel.secondary_startup_64_no_verify
      2.01 ± 33%      -1.5        0.52 ±103%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.rest_init
      2.10 ± 20%      -0.6        1.45 ± 23%  perf-profile.calltrace.cycles-pp.asm_exc_page_fault
      0.57 ± 50%      +0.5        1.08 ± 26%  perf-profile.calltrace.cycles-pp.tick_program_event.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      0.71 ± 21%      +0.5        1.25 ± 26%  perf-profile.calltrace.cycles-pp.irqtime_account_irq.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      0.48 ± 72%      +0.6        1.09 ± 25%  perf-profile.calltrace.cycles-pp.irqtime_account_irq.irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      1.46 ± 23%      +0.7        2.16 ± 22%  perf-profile.calltrace.cycles-pp.enqueue_hrtimer.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      2.38 ± 12%      +0.7        3.12 ± 12%  perf-profile.calltrace.cycles-pp.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.34 ± 13%      +0.8        3.10 ± 11%  perf-profile.calltrace.cycles-pp.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.86 ± 16%      +0.9        4.78 ±  8%  perf-profile.calltrace.cycles-pp.error_entry
      2.18 ± 19%      +1.3        3.53 ± 14%  perf-profile.calltrace.cycles-pp.irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      3.70 ± 15%      +1.4        5.08 ± 18%  perf-profile.calltrace.cycles-pp.perf_mux_hrtimer_handler.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      3.61 ± 12%      +1.5        5.10 ± 14%  perf-profile.calltrace.cycles-pp.__irqentry_text_end
      3.33 ± 14%      +1.5        4.84 ± 16%  perf-profile.calltrace.cycles-pp.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt
      0.00            +1.8        1.77 ± 34%  perf-profile.calltrace.cycles-pp.update_curr_common.task_tick_rt.scheduler_tick.update_process_times.tick_sched_handle
      7.28 ±  7%      +2.0        9.32 ± 12%  perf-profile.calltrace.cycles-pp.scheduler_tick.update_process_times.tick_sched_handle.tick_nohz_highres_handler.__hrtimer_run_queues
     14.77 ±  7%      +3.4       18.14 ±  8%  perf-profile.calltrace.cycles-pp.update_process_times.tick_sched_handle.tick_nohz_highres_handler.__hrtimer_run_queues.hrtimer_interrupt
     15.58 ±  7%      +3.5       19.13 ±  8%  perf-profile.calltrace.cycles-pp.tick_sched_handle.tick_nohz_highres_handler.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt
     18.08 ±  8%      +4.0       22.07 ±  6%  perf-profile.calltrace.cycles-pp.tick_nohz_highres_handler.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
     27.49 ±  7%      +6.8       34.25 ±  5%  perf-profile.calltrace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
     31.94 ±  6%      +8.9       40.88 ±  5%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
     33.05 ±  6%      +9.9       42.91 ±  4%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
     36.24 ±  6%     +11.9       48.10 ±  4%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
     43.29 ±  5%     +15.4       58.72 ±  3%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt
     25.39 ±  5%     -20.5        4.88 ± 29%  perf-profile.children.cycles-pp.secondary_startup_64_no_verify
     25.39 ±  5%     -20.5        4.88 ± 29%  perf-profile.children.cycles-pp.cpu_startup_entry
     25.39 ±  5%     -20.5        4.88 ± 29%  perf-profile.children.cycles-pp.do_idle
     24.97 ±  5%     -20.2        4.80 ± 27%  perf-profile.children.cycles-pp.cpuidle_idle_call
     24.26 ±  5%     -19.5        4.76 ± 27%  perf-profile.children.cycles-pp.cpuidle_enter
     24.24 ±  5%     -19.5        4.76 ± 27%  perf-profile.children.cycles-pp.cpuidle_enter_state
     23.29 ±  6%     -19.1        4.23 ± 34%  perf-profile.children.cycles-pp.start_secondary
     20.65 ±  6%     -17.3        3.34 ± 36%  perf-profile.children.cycles-pp.intel_idle_ibrs
      2.10 ± 33%      -1.4        0.65 ± 66%  perf-profile.children.cycles-pp.start_kernel
      2.10 ± 33%      -1.4        0.65 ± 66%  perf-profile.children.cycles-pp.arch_call_rest_init
      2.10 ± 33%      -1.4        0.65 ± 66%  perf-profile.children.cycles-pp.rest_init
      2.10 ± 33%      -1.4        0.65 ± 66%  perf-profile.children.cycles-pp.x86_64_start_kernel
      2.10 ± 33%      -1.4        0.65 ± 66%  perf-profile.children.cycles-pp.x86_64_start_reservations
      2.22 ± 19%      -0.7        1.51 ± 21%  perf-profile.children.cycles-pp.asm_exc_page_fault
      0.96 ± 25%      -0.5        0.47 ± 38%  perf-profile.children.cycles-pp.do_fault
      0.88 ± 26%      -0.5        0.42 ± 54%  perf-profile.children.cycles-pp.do_read_fault
      0.73 ± 17%      -0.4        0.38 ± 56%  perf-profile.children.cycles-pp.filemap_map_pages
      0.06 ± 72%      +0.2        0.31 ± 43%  perf-profile.children.cycles-pp.mas_store
      0.11 ± 98%      +0.3        0.38 ± 71%  perf-profile.children.cycles-pp.update_curr
      0.44 ± 34%      +0.3        0.72 ± 17%  perf-profile.children.cycles-pp.find_lock_lowest_rq
      0.46 ± 33%      +0.3        0.78 ± 24%  perf-profile.children.cycles-pp.unmap_vmas
      0.65 ± 31%      +0.3        1.00 ± 23%  perf-profile.children.cycles-pp.sched_clock_cpu
      0.16 ± 73%      +0.4        0.53 ± 21%  perf-profile.children.cycles-pp.pick_next_task_fair
      0.24 ± 37%      +0.4        0.61 ± 34%  perf-profile.children.cycles-pp.perf_event_task_tick
      0.66 ± 22%      +0.4        1.08 ± 26%  perf-profile.children.cycles-pp.tick_program_event
      0.41 ± 38%      +0.4        0.82 ± 24%  perf-profile.children.cycles-pp.hrtimer_update_next_event
      0.28 ± 71%      +0.7        0.96 ± 53%  perf-profile.children.cycles-pp.exit_to_user_mode_loop
      2.38 ± 12%      +0.7        3.12 ± 12%  perf-profile.children.cycles-pp.__x64_sys_futex
      2.35 ± 12%      +0.8        3.10 ± 11%  perf-profile.children.cycles-pp.do_futex
      2.09 ± 12%      +1.1        3.23 ± 22%  perf-profile.children.cycles-pp.__schedule
      1.90 ± 15%      +1.2        3.05 ± 21%  perf-profile.children.cycles-pp.schedule
      1.44 ± 20%      +1.2        2.64 ± 22%  perf-profile.children.cycles-pp.irqtime_account_irq
      3.82 ± 14%      +1.3        5.08 ± 18%  perf-profile.children.cycles-pp.perf_mux_hrtimer_handler
      3.61 ± 12%      +1.5        5.10 ± 14%  perf-profile.children.cycles-pp.__irqentry_text_end
      7.50 ±  8%      +1.9        9.41 ± 12%  perf-profile.children.cycles-pp.scheduler_tick
      3.93 ± 13%      +2.0        5.94 ± 12%  perf-profile.children.cycles-pp.irqentry_exit_to_user_mode
     15.08 ±  8%      +3.1       18.22 ±  9%  perf-profile.children.cycles-pp.update_process_times
     15.86 ±  7%      +3.4       19.21 ±  8%  perf-profile.children.cycles-pp.tick_sched_handle
     18.33 ±  7%      +3.9       22.25 ±  6%  perf-profile.children.cycles-pp.tick_nohz_highres_handler
     27.79 ±  7%      +6.8       34.59 ±  5%  perf-profile.children.cycles-pp.__hrtimer_run_queues
     32.81 ±  6%      +8.4       41.17 ±  5%  perf-profile.children.cycles-pp.hrtimer_interrupt
     33.89 ±  6%      +9.2       43.09 ±  4%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
     37.75 ±  5%     +10.7       48.44 ±  4%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
     43.69 ±  5%     +13.4       57.05 ±  3%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
     20.65 ±  6%     -17.3        3.34 ± 36%  perf-profile.self.cycles-pp.intel_idle_ibrs
      0.14 ± 79%      +0.2        0.39 ± 40%  perf-profile.self.cycles-pp.perf_event_task_tick
      0.19 ± 83%      +0.3        0.51 ± 24%  perf-profile.self.cycles-pp.trigger_load_balance
      0.97 ± 25%      +0.3        1.30 ± 26%  perf-profile.self.cycles-pp.account_user_time
      0.63 ± 24%      +0.4        1.00 ± 23%  perf-profile.self.cycles-pp.tick_program_event
      0.53 ± 32%      +0.5        1.06 ± 18%  perf-profile.self.cycles-pp.__sysvec_apic_timer_interrupt
      0.98 ± 31%      +0.9        1.84 ± 33%  perf-profile.self.cycles-pp.irqtime_account_irq
      3.43 ± 14%      +1.3        4.69 ± 13%  perf-profile.self.cycles-pp.irqentry_exit_to_user_mode
      3.60 ± 13%      +1.5        5.10 ± 14%  perf-profile.self.cycles-pp.__irqentry_text_end




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

