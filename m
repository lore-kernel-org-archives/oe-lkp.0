Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D9C13AF6
	for <oe-lkp@lists.linux.dev>; Fri, 20 Oct 2023 09:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E/rUHhIx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697795717; x=1729331717;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=QCr+y1FDLbr8k2M9vIpW6hDJq7v6RnokpVOpRVfGiCQ=;
  b=E/rUHhIxJn6oJp+0Ixk+HWYfQppw8TJXyHgpsACLI5IrJHFsCmSwWmiB
   ufnC8T5CcOlKKKFs+qP+UpR2Q1YQdLhrrlJwWdFyU1XLhMv1kgO7/KlbZ
   HWxHxMBdsGsklh38+PxJjU9XVoPj3OoUkQwR8RSzRkIo9iHXQmVDROr4U
   10OT/iod4xTL87LW7VHgQKXoArsUCXc5pTclK88uD8U2gcq8sryfEih2T
   NTdzS/uhwfnhxChgDjbgy7ZmHIM997hxnFujQC6mcEiaeGXdY90G0+q/X
   5aW3IC8TXndVDn75+UV2McrdVPL+0BVSn7UAoOQHkZyadhTrq+2HRmM8Y
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="8033023"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="8033023"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 02:55:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="827679485"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="827679485"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Oct 2023 02:55:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 20 Oct 2023 02:55:16 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 20 Oct 2023 02:55:16 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 20 Oct 2023 02:55:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ci2RythLcvijQoJHsxA380/RhIPRTkJXZHWikqiBxfSUVTSx7s/WXgiRDNA+EAl6cNXQOEhNRB8W3kidpVy3s/AdC9CIk6pADJgkjRfFhMsDgsgyZBJWdCc1DBzrMvg+pTpve28iYfsJRplRswKp7ff3UR9RYjvfUJtVAJ3juaOHqz8Hz7cFUggLF1mGxgxvkj4f1HStkx3hZEcCjH5CBdYe40XbS4dtcyYPMmb8lZiu+r7oXPHL+Ey2aGEtecmPxOlBfLDATCTCX1WgtWA8UiYbG16q8QdXiDBDzcLBVajNUhQXZb8Twug6Rz+dVxjdmiuLkbspyiu9pKSLOgtksg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AS+ftRtyZKMb2nz5eZXBrG1QxgjYqlm8MDQM8vU/NF8=;
 b=SsvJtdetF3ChYWG+B9/c50vHqLrfkjypxwr4xx9DGvsrg+zkGlIeIIL21ZN41f2LIUS9fX/2zu6B0cnwuua1utO/d/MMrbaV3g+AvxsVKjtKt6ace27xpIxmiV5uP0aZsr+iQline2ShRDjBqZT6i/oPeoSLoIpfSOR1sLthqeUB45FN2j2OeBNZ0BX3uFnd1Illyrk/oYdk1gPvrjpgxjk0hrayi/WwDcsc2Z7jAjGNEszXj55XZJoP0u28ml5CDVuLgyc5zhSDGF3RosGV8G14ncnLA+Ynt/uvA1Eow40LzS1wO9ptM9tmNqEark3c7BAR3OjTAl4yqf8pe3cURg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by IA1PR11MB7919.namprd11.prod.outlook.com (2603:10b6:208:3fa::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Fri, 20 Oct
 2023 09:55:12 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::134a:412c:eb02:ae17]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::134a:412c:eb02:ae17%5]) with mapi id 15.20.6863.046; Fri, 20 Oct 2023
 09:55:12 +0000
Date: Fri, 20 Oct 2023 17:55:02 +0800
From: kernel test robot <oliver.sang@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-mm@kvack.org>,
	<ying.huang@intel.com>, <feng.tang@intel.com>, <fengwei.yin@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>, "Matthew Wilcox (Oracle)"
	<willy@infradead.org>, Suren Baghdasaryan <surenb@google.com>,
	<oliver.sang@intel.com>
Subject: Re: [PATCH v2 5/6] mm: Handle read faults under the VMA lock
Message-ID: <202310201715.3f52109d-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231006195318.4087158-6-willy@infradead.org>
X-ClientProxiedBy: KL1PR0401CA0029.apcprd04.prod.outlook.com
 (2603:1096:820:e::16) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|IA1PR11MB7919:EE_
X-MS-Office365-Filtering-Correlation-Id: 71de2f4f-598f-47fa-593b-08dbd152a61b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d37SzE6p3qBS5hh9isSvQItWpCICf6ap3IWZnRINuPYfMY1Xbt2Inj19alPbnHmsJWir6/sajIkTSej0I22aHtrn72z0XAcMq/21eudGZOhSXr1azVz8F0SFX1zW88DgoLlA1yWZqSRur/NKy8rxEVrS0/QykqP5K48BY8+5vV3wdcvdgF2GcQNkp8VEOjVYjwRHw3Ms0wMyi1zYNKR74vBG767UMG37NZukcGM7WHywcYtmKBexvfFkV6QnU6cI25lkoWUdyLArQbSJJc+QvnePstIhiQDc+43I0mPmeEs3EUX0hjPYpd83nN/I+3EsWmctYzlzsnwPsjs+MuqhBmasiamfW/XdKPczKwVlWdt40qPWFri4iGJDh9O7poNpwhmIsmETRJ2nO7dTN145ZQoioXwXqzgk+7OU2+kkgx0OJb4nj3CdS50Zfd9cKDVtekoWqr9Lh1t/oruwBmkEDfuGJZyW0kTAClfelEI2yko8xn98LH+ucaq7lGl8YDLsduj+43wM1Uj1H6dLO3c5V3HBsClZ21FPUiBh8ljcU3G4l0l7l3cXrWTy6yjJ3Gl3NDZ9pZXXBoUMFbpMtVA2Lg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(376002)(346002)(136003)(366004)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(41300700001)(478600001)(6486002)(966005)(6666004)(6916009)(66946007)(66556008)(54906003)(316002)(66476007)(86362001)(82960400001)(8676002)(2906002)(8936002)(38100700002)(36756003)(5660300002)(4326008)(30864003)(19627235002)(83380400001)(107886003)(1076003)(26005)(2616005)(6512007)(6506007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?6KBStX7RD461xxZPkFgKx7FMcLEQqcOOE4BDCuL3VHVwp3UyvCC5K/POum?=
 =?iso-8859-1?Q?f3pbBSsCPedPj0QAAnPsPR8KNaw6gvBtoT0dh+NUrVvWIEoe7LMyVR0xWM?=
 =?iso-8859-1?Q?7MGP1Eo1Bxg7CHbA0ZMPxTCaR2rfkir7JzlFncKHA7mOAXHhwWy0b/R3I7?=
 =?iso-8859-1?Q?m4/GOR5Gh7KyoErFAQpojX2tI1s1o8z9CkRBHUFpOUpT1gXeR63VQS7FcA?=
 =?iso-8859-1?Q?y/z0SrnWjHM8ZMwnMFcBPriP0aixpeHZcaf2IWn9pk0AjFlToRxL0dhN0h?=
 =?iso-8859-1?Q?IVdExDWtFaLN0TpaADGZMnEa2mDKs+uHWpM+ovdtlByM9wuzOc9ulWdYEP?=
 =?iso-8859-1?Q?oWcQePLg/PRmHhcZs0tK27l9uyaH4oCb3y0V5dDUMrvPQACSw1ug48ZSqA?=
 =?iso-8859-1?Q?1iIID7lbWpH+jVBJZYcIYNj9OKx0npt9u+g73W8KN33VaCoN22OfJtVFWl?=
 =?iso-8859-1?Q?tN9drcFcxksNv2kZAVHfb5edMyfE96BGhoE1P76ASKLAbDHL5bZ3AWJ//D?=
 =?iso-8859-1?Q?1ClaNkRp/9MWvObpj4E3DCoQmqqh6lODAmMv0LvlT3bVwEJty2lWR6CxaS?=
 =?iso-8859-1?Q?0R1K8caKE50YV9APJ0cvAORudsmUSlV0pgJG2W7HCNQa2wEwLnrDKcwf6E?=
 =?iso-8859-1?Q?8jhu8gO7TGjI5lgglil1cWr7TwdamaL/A7OZ1YhYO1EXionPNO5ifpZml+?=
 =?iso-8859-1?Q?VvVKXqYKp88xXGzDE6oRVjp+IuA9NaTUFzY9lo1r9HcCnBGs11BxCqwjaj?=
 =?iso-8859-1?Q?wfze8/f0LNVAyReXlaifUGoxJs2P6z1SzLe4dQVallnTXz5wYAQnG8b2yM?=
 =?iso-8859-1?Q?UvIGVKpTW9oCXNe4x+7YReMrcy5uJjiIfZtI4zXIPc3winss/FTnGVXVFS?=
 =?iso-8859-1?Q?bN/BcXzhptNp8VbDy+gunvpSbW4jGIa/6YB5Ag5B55PQgUw4r+tt/IY4qZ?=
 =?iso-8859-1?Q?rTyBLFSxvVFipIldE5fKlVapcuyhXOirhQe2E8rdkLXHV/rnxDtqy41VkT?=
 =?iso-8859-1?Q?H7HCuiB4i3zfcbeQywtz2CkolNoBHU4XfpJPOVkCD7awTJJYhUAFWu0Hlc?=
 =?iso-8859-1?Q?KYSDWx8sod1FcQdBOYfVlSpbXVPpgBnrcgrxDKG+9tBrC2vaknmc7LVhsy?=
 =?iso-8859-1?Q?Wifu5r3vYvcefkKNCuqok/JAgxYiON5bXoY9ySHgHpmk1UHYLGeRjHhf36?=
 =?iso-8859-1?Q?emjWMxWckYyBvmK498EGKaHxZFWKj3x1aIoiT4FwCnfkiL1+d85HCAtA6Y?=
 =?iso-8859-1?Q?G2pi+9oTlrbiBuh34gb6PrijgQGAwN3Ksl4g6C37Sb/KhZU4k8mOgZCa6v?=
 =?iso-8859-1?Q?FaaSAgQfc+kaoqJ9W/tqWEhZhODHOMmh+pwOzuENPXaogcuSY5FUiN2mXc?=
 =?iso-8859-1?Q?ctWZ4ZehuJAuhWr5uTljWqHdvYMJHVkWJ5klTTzPAzNHL6rsRVUVUQ27fS?=
 =?iso-8859-1?Q?cQBx2oCy14/k/jNCtwhGad7ciGosLJO5Ni6eE2ChbptcIRByZx2qLgH03+?=
 =?iso-8859-1?Q?e5WrJMKp8fuDajeAU7D3T943TVsgmAVtOXoRfoINUJCTXWCxjxoP7HaK27?=
 =?iso-8859-1?Q?21FbmUL2l9f3M6wtTLLTFwfEdLy42Rtb9d+sdEu1xwPcBqjrhjol32hFQU?=
 =?iso-8859-1?Q?PyASPRaiXV6TS57kEhp4wWGBIfPZade8laVM2ALDsptUzaue/oHdS9CQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 71de2f4f-598f-47fa-593b-08dbd152a61b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 09:55:11.1509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6cZUYj0j5ckwzO6NepUq0WDU5mzlf0HNZcvmIEI+aO+lykya54+LsyCrVTtA9EWoHPAqN5iHToi21dKgO/4PNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7919
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 46.0% improvement of vm-scalability.throughput on:


commit: 39fbbca087dd149cdb82f08e7b92d62395c21ecf ("[PATCH v2 5/6] mm: Handle read faults under the VMA lock")
url: https://github.com/intel-lab-lkp/linux/commits/Matthew-Wilcox-Oracle/mm-Make-lock_folio_maybe_drop_mmap-VMA-lock-aware/20231007-035513
base: v6.6-rc4
patch link: https://lore.kernel.org/all/20231006195318.4087158-6-willy@infradead.org/
patch subject: [PATCH v2 5/6] mm: Handle read faults under the VMA lock

testcase: vm-scalability
test machine: 96 threads 2 sockets Intel(R) Xeon(R) Platinum 8260L CPU @ 2.40GHz (Cascade Lake) with 128G memory
parameters:

	runtime: 300s
	size: 2T
	test: shm-pread-seq-mt
	cpufreq_governor: performance

test-description: The motivation behind this suite is to exercise functions and regions of the mm/ of the Linux kernel which are of interest to us.
test-url: https://git.kernel.org/cgit/linux/kernel/git/wfg/vm-scalability.git/





Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20231020/202310201715.3f52109d-oliver.sang@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/rootfs/runtime/size/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-8.3/debian-11.1-x86_64-20220510.cgz/300s/2T/lkp-csl-2sp3/shm-pread-seq-mt/vm-scalability

commit: 
  90e99527c7 ("mm: Handle COW faults under the VMA lock")
  39fbbca087 ("mm: Handle read faults under the VMA lock")

90e99527c746cd9e 39fbbca087dd149cdb82f08e7b9 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     34.69 ± 23%     +72.5%      59.82 ±  2%  vm-scalability.free_time
    173385           +45.6%     252524        vm-scalability.median
  16599151           +46.0%   24242352        vm-scalability.throughput
    390.45            +6.9%     417.32        vm-scalability.time.elapsed_time
    390.45            +6.9%     417.32        vm-scalability.time.elapsed_time.max
     45781 ±  2%     +16.3%      53251 ±  2%  vm-scalability.time.involuntary_context_switches
 4.213e+09           +50.1%  6.325e+09        vm-scalability.time.maximum_resident_set_size
 5.316e+08           +47.3%   7.83e+08        vm-scalability.time.minor_page_faults
      6400            -8.0%       5890        vm-scalability.time.percent_of_cpu_this_job_got
     21673           -10.2%      19455        vm-scalability.time.system_time
      3319           +54.4%       5126        vm-scalability.time.user_time
 2.321e+08 ±  2%     +27.2%  2.953e+08 ±  5%  vm-scalability.time.voluntary_context_switches
 5.004e+09           +42.2%  7.116e+09        vm-scalability.workload
     13110           +24.0%      16254        uptime.idle
  1.16e+10           +24.5%  1.444e+10        cpuidle..time
 2.648e+08 ±  3%     +16.3%  3.079e+08 ±  5%  cpuidle..usage
     22.86            +6.3       29.17        mpstat.cpu.all.idle%
      8.29 ±  5%      -1.2        7.13 ±  7%  mpstat.cpu.all.iowait%
     58.63            -9.2       49.38        mpstat.cpu.all.sys%
      9.05            +4.0       13.09        mpstat.cpu.all.usr%
   8721571 ±  5%     +44.8%   12630342 ±  2%  numa-numastat.node0.local_node
   8773210 ±  5%     +44.8%   12706884 ±  2%  numa-numastat.node0.numa_hit
   7793725 ±  5%     +51.3%   11793573        numa-numastat.node1.local_node
   7842342 ±  5%     +50.7%   11816543        numa-numastat.node1.numa_hit
     23.17           +26.8%      29.37        vmstat.cpu.id
  31295414           +50.9%   47211341        vmstat.memory.cache
  95303378           -18.8%   77355720        vmstat.memory.free
   1176885 ±  2%     +19.2%    1402891 ±  3%  vmstat.system.cs
    194658            +5.4%     205149 ±  2%  vmstat.system.in
   9920198 ± 10%     -48.9%    5071533 ± 15%  turbostat.C1
      0.51 ± 12%      -0.3        0.21 ± 12%  turbostat.C1%
   1831098 ± 15%     -72.0%     512888 ± 19%  turbostat.C1E
      0.14 ± 13%      -0.1        0.06 ± 11%  turbostat.C1E%
   8736699           +36.3%   11905646        turbostat.C6
     22.74            +6.3       29.02        turbostat.C6%
     17.82           +25.5%      22.37        turbostat.CPU%c1
      5.36           +28.2%       6.87        turbostat.CPU%c6
      0.07           +42.9%       0.10        turbostat.IPC
  77317703           +12.3%   86804635 ±  3%  turbostat.IRQ
 2.443e+08 ±  3%     +18.9%  2.904e+08 ±  6%  turbostat.POLL
      4.80           +30.2%       6.24        turbostat.Pkg%pc2
    266.73            -1.3%     263.33        turbostat.PkgWatt
      0.00           -25.0%       0.00        perf-sched.sch_delay.avg.ms.io_schedule.folio_wait_bit_common.shmem_get_folio_gfp.shmem_fault
      0.06 ± 11%     -21.8%       0.04 ±  9%  perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     26.45 ±  9%     -16.0%      22.21 ±  6%  perf-sched.sch_delay.max.ms.io_schedule.folio_wait_bit_common.shmem_get_folio_gfp.shmem_fault
      0.00           -25.0%       0.00        perf-sched.total_sch_delay.average.ms
    106.37 ±167%     -79.1%      22.21 ±  6%  perf-sched.total_sch_delay.max.ms
      0.46 ±  2%     -16.0%       0.39 ±  5%  perf-sched.total_wait_and_delay.average.ms
   2202457 ±  2%     +26.1%    2776824 ±  3%  perf-sched.total_wait_and_delay.count.ms
      0.45 ±  2%     -15.9%       0.38 ±  5%  perf-sched.total_wait_time.average.ms
      0.02 ±  2%     -19.8%       0.01 ±  2%  perf-sched.wait_and_delay.avg.ms.io_schedule.folio_wait_bit_common.shmem_get_folio_gfp.shmem_fault
    494.65 ±  4%     +10.6%     546.88 ±  3%  perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
   2196122 ±  2%     +26.1%    2770017 ±  3%  perf-sched.wait_and_delay.count.io_schedule.folio_wait_bit_common.shmem_get_folio_gfp.shmem_fault
      0.01 ±  3%     -19.5%       0.01        perf-sched.wait_time.avg.ms.io_schedule.folio_wait_bit_common.shmem_get_folio_gfp.shmem_fault
    494.63 ±  4%     +10.6%     546.87 ±  3%  perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.22 ± 42%     -68.8%       0.07 ±125%  perf-sched.wait_time.max.ms.__cond_resched.stop_one_cpu.migrate_task_to.task_numa_migrate.isra
  11445425           +82.1%   20837223        meminfo.Active
  11444642           +82.1%   20836443        meminfo.Active(anon)
  31218122           +51.0%   47138293        meminfo.Cached
  30006048           +53.7%   46116816        meminfo.Committed_AS
  17425032           +37.4%   23950392        meminfo.Inactive
  17423257           +37.5%   23948613        meminfo.Inactive(anon)
    164910           +21.8%     200913        meminfo.KReclaimable
  26336530           +57.6%   41514589        meminfo.Mapped
  94668993           -19.0%   76693589        meminfo.MemAvailable
  95202238           -18.9%   77208832        meminfo.MemFree
  36610737           +49.1%   54604143        meminfo.Memused
   4072810           +50.1%    6114589        meminfo.PageTables
    164910           +21.8%     200913        meminfo.SReclaimable
  28535318           +55.8%   44455489        meminfo.Shmem
    367289           +10.1%     404373        meminfo.Slab
  37978157           +50.2%   57055526        meminfo.max_used_kB
   2860756           +82.1%    5208445        proc-vmstat.nr_active_anon
   2361286           -19.0%    1912151        proc-vmstat.nr_dirty_background_threshold
   4728345           -19.0%    3828978        proc-vmstat.nr_dirty_threshold
   7804148           +51.0%   11783823        proc-vmstat.nr_file_pages
  23801109           -18.9%   19303173        proc-vmstat.nr_free_pages
   4355690           +37.5%    5986921        proc-vmstat.nr_inactive_anon
   6583645           +57.6%   10377790        proc-vmstat.nr_mapped
   1018109           +50.1%    1528565        proc-vmstat.nr_page_table_pages
   7133183           +55.8%   11112858        proc-vmstat.nr_shmem
     41226           +21.8%      50226        proc-vmstat.nr_slab_reclaimable
   2860756           +82.1%    5208445        proc-vmstat.nr_zone_active_anon
   4355690           +37.5%    5986921        proc-vmstat.nr_zone_inactive_anon
    112051            +3.8%     116273        proc-vmstat.numa_hint_faults
  16618553           +47.6%   24525492        proc-vmstat.numa_hit
  16518296           +47.9%   24425975        proc-vmstat.numa_local
  11052273           +49.9%   16566743        proc-vmstat.pgactivate
  16757533           +47.2%   24672644        proc-vmstat.pgalloc_normal
 5.329e+08           +47.2%  7.844e+08        proc-vmstat.pgfault
  16101786           +48.3%   23877738        proc-vmstat.pgfree
   3302784            +6.0%    3500288        proc-vmstat.unevictable_pgs_scanned
   6101287 ±  7%     +81.3%   11062634 ±  3%  numa-meminfo.node0.Active
   6101026 ±  7%     +81.3%   11062389 ±  3%  numa-meminfo.node0.Active(anon)
  17217355 ±  5%     +46.3%   25196100 ±  3%  numa-meminfo.node0.FilePages
   9363213 ±  7%     +31.9%   12347562 ±  2%  numa-meminfo.node0.Inactive
   9362621 ±  7%     +31.9%   12347130 ±  2%  numa-meminfo.node0.Inactive(anon)
  14211196 ±  7%     +51.2%   21487599        numa-meminfo.node0.Mapped
  45879058 ±  2%     -19.6%   36888633 ±  2%  numa-meminfo.node0.MemFree
  19925073 ±  5%     +45.1%   28915498 ±  3%  numa-meminfo.node0.MemUsed
   2032891           +50.5%    3060344        numa-meminfo.node0.PageTables
  15318197 ±  6%     +52.0%   23276446 ±  2%  numa-meminfo.node0.Shmem
   5342463 ±  7%     +82.9%    9769639 ±  4%  numa-meminfo.node1.Active
   5341941 ±  7%     +82.9%    9769104 ±  4%  numa-meminfo.node1.Active(anon)
  13998966 ±  8%     +56.6%   21919509 ±  3%  numa-meminfo.node1.FilePages
   8060699 ±  7%     +43.7%   11584190 ±  2%  numa-meminfo.node1.Inactive
   8059515 ±  7%     +43.7%   11582844 ±  2%  numa-meminfo.node1.Inactive(anon)
  12125745 ±  7%     +65.0%   20005342        numa-meminfo.node1.Mapped
  49326340 ±  2%     -18.2%   40347902 ±  2%  numa-meminfo.node1.MemFree
  16682503 ±  7%     +53.8%   25660941 ±  3%  numa-meminfo.node1.MemUsed
   2039529           +49.6%    3051247        numa-meminfo.node1.PageTables
  13214266 ±  7%     +60.1%   21155303 ±  2%  numa-meminfo.node1.Shmem
    156378 ± 13%     +21.1%     189316 ±  9%  numa-meminfo.node1.Slab
   1525784 ±  7%     +81.4%    2767183 ±  3%  numa-vmstat.node0.nr_active_anon
   4304756 ±  5%     +46.4%    6302189 ±  3%  numa-vmstat.node0.nr_file_pages
  11469263 ±  2%     -19.6%    9218468 ±  2%  numa-vmstat.node0.nr_free_pages
   2340569 ±  7%     +32.0%    3088383 ±  2%  numa-vmstat.node0.nr_inactive_anon
   3553304 ±  7%     +51.3%    5375214        numa-vmstat.node0.nr_mapped
    508315           +50.6%     765564        numa-vmstat.node0.nr_page_table_pages
   3829966 ±  6%     +52.0%    5822276 ±  2%  numa-vmstat.node0.nr_shmem
   1525783 ±  7%     +81.4%    2767184 ±  3%  numa-vmstat.node0.nr_zone_active_anon
   2340569 ±  7%     +32.0%    3088382 ±  2%  numa-vmstat.node0.nr_zone_inactive_anon
   8773341 ±  5%     +44.8%   12707017 ±  2%  numa-vmstat.node0.numa_hit
   8721702 ±  5%     +44.8%   12630474 ±  2%  numa-vmstat.node0.numa_local
   1335910 ±  7%     +82.9%    2443778 ±  4%  numa-vmstat.node1.nr_active_anon
   3500040 ±  8%     +56.7%    5482887 ±  3%  numa-vmstat.node1.nr_file_pages
  12331163 ±  2%     -18.2%   10083422 ±  2%  numa-vmstat.node1.nr_free_pages
   2014795 ±  7%     +43.8%    2897243 ±  2%  numa-vmstat.node1.nr_inactive_anon
   3031806 ±  7%     +65.1%    5004449        numa-vmstat.node1.nr_mapped
    510000           +49.7%     763297        numa-vmstat.node1.nr_page_table_pages
   3303865 ±  7%     +60.2%    5291835 ±  2%  numa-vmstat.node1.nr_shmem
   1335910 ±  7%     +82.9%    2443778 ±  4%  numa-vmstat.node1.nr_zone_active_anon
   2014795 ±  7%     +43.8%    2897242 ±  2%  numa-vmstat.node1.nr_zone_inactive_anon
   7842425 ±  5%     +50.7%   11816530        numa-vmstat.node1.numa_hit
   7793808 ±  5%     +51.3%   11793555        numa-vmstat.node1.numa_local
   9505083           +21.3%   11532590 ±  3%  sched_debug.cfs_rq:/.avg_vruntime.avg
   9551715           +21.4%   11595502 ±  3%  sched_debug.cfs_rq:/.avg_vruntime.max
   9426050           +21.4%   11443528 ±  3%  sched_debug.cfs_rq:/.avg_vruntime.min
     19249 ±  4%     +28.3%      24698 ± 10%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      0.79           -30.7%       0.55 ±  8%  sched_debug.cfs_rq:/.h_nr_running.avg
     12458 ± 12%     +70.8%      21277 ± 22%  sched_debug.cfs_rq:/.load.avg
     13767 ± 95%    +311.7%      56677 ± 29%  sched_debug.cfs_rq:/.load.stddev
   9505083           +21.3%   11532590 ±  3%  sched_debug.cfs_rq:/.min_vruntime.avg
   9551715           +21.4%   11595502 ±  3%  sched_debug.cfs_rq:/.min_vruntime.max
   9426050           +21.4%   11443528 ±  3%  sched_debug.cfs_rq:/.min_vruntime.min
     19249 ±  4%     +28.3%      24698 ± 10%  sched_debug.cfs_rq:/.min_vruntime.stddev
      0.78           -30.7%       0.54 ±  8%  sched_debug.cfs_rq:/.nr_running.avg
    170.67           -21.4%     134.10 ±  6%  sched_debug.cfs_rq:/.removed.load_avg.max
    708.55           -32.2%     480.43 ±  7%  sched_debug.cfs_rq:/.runnable_avg.avg
      1510 ±  3%     -12.5%       1320 ±  4%  sched_debug.cfs_rq:/.runnable_avg.max
    219.68 ±  7%     -12.7%     191.74 ±  5%  sched_debug.cfs_rq:/.runnable_avg.stddev
    707.51           -32.3%     479.05 ±  7%  sched_debug.cfs_rq:/.util_avg.avg
      1506 ±  3%     -12.6%       1317 ±  4%  sched_debug.cfs_rq:/.util_avg.max
    219.64 ±  7%     -13.0%     191.15 ±  5%  sched_debug.cfs_rq:/.util_avg.stddev
    564.18 ±  2%     -32.4%     381.24 ±  8%  sched_debug.cfs_rq:/.util_est_enqueued.avg
      1168 ±  7%     -14.8%     995.94 ±  7%  sched_debug.cfs_rq:/.util_est_enqueued.max
    235.45 ±  5%     -21.4%     185.13 ±  7%  sched_debug.cfs_rq:/.util_est_enqueued.stddev
    149234 ±  5%    +192.0%     435707 ± 10%  sched_debug.cpu.avg_idle.avg
    404765 ± 17%     +47.3%     596259 ± 15%  sched_debug.cpu.avg_idle.max
      5455 ±  4%   +3302.8%     185624 ± 34%  sched_debug.cpu.avg_idle.min
    201990           +24.9%     252309 ±  5%  sched_debug.cpu.clock.avg
    201997           +24.9%     252315 ±  5%  sched_debug.cpu.clock.max
    201983           +24.9%     252303 ±  5%  sched_debug.cpu.clock.min
      3.80 ±  2%     -10.1%       3.42 ±  3%  sched_debug.cpu.clock.stddev
    200296           +24.8%     249952 ±  5%  sched_debug.cpu.clock_task.avg
    200541           +24.8%     250280 ±  5%  sched_debug.cpu.clock_task.max
    194086           +25.5%     243582 ±  5%  sched_debug.cpu.clock_task.min
      4069           -32.7%       2739 ±  8%  sched_debug.cpu.curr->pid.avg
      8703           +15.2%      10027 ±  3%  sched_debug.cpu.curr->pid.max
      0.00 ±  6%     -27.2%       0.00 ±  5%  sched_debug.cpu.next_balance.stddev
      0.78           -32.7%       0.52 ±  8%  sched_debug.cpu.nr_running.avg
      0.33 ±  6%     -13.9%       0.29 ±  5%  sched_debug.cpu.nr_running.stddev
   2372181 ±  2%     +57.6%    3737590 ±  8%  sched_debug.cpu.nr_switches.avg
   2448893 ±  2%     +58.5%    3880813 ±  8%  sched_debug.cpu.nr_switches.max
   2290032 ±  2%     +55.9%    3570559 ±  8%  sched_debug.cpu.nr_switches.min
     36185 ± 10%     +74.8%      63244 ±  8%  sched_debug.cpu.nr_switches.stddev
      0.10 ± 19%    +138.0%       0.23 ± 19%  sched_debug.cpu.nr_uninterruptible.avg
    201984           +24.9%     252304 ±  5%  sched_debug.cpu_clk
    201415           +25.0%     251735 ±  5%  sched_debug.ktime
    202543           +24.8%     252867 ±  5%  sched_debug.sched_clk
      3.84 ±  2%     -14.1%       3.30 ±  2%  perf-stat.i.MPKI
 1.679e+10           +30.1%  2.186e+10        perf-stat.i.branch-instructions
      0.54 ±  2%      -0.1        0.45        perf-stat.i.branch-miss-rate%
  75872684            -2.6%   73927540        perf-stat.i.branch-misses
     31.85            -1.1       30.75        perf-stat.i.cache-miss-rate%
   1184992 ±  2%     +19.1%    1411069 ±  3%  perf-stat.i.context-switches
      3.49           -29.3%       2.47        perf-stat.i.cpi
 2.265e+11            -8.1%  2.081e+11        perf-stat.i.cpu-cycles
    950.46 ±  3%     -11.6%     840.03 ±  2%  perf-stat.i.cycles-between-cache-misses
   9514714 ± 12%     +27.3%   12109471 ± 10%  perf-stat.i.dTLB-load-misses
 1.556e+10           +29.9%  2.022e+10        perf-stat.i.dTLB-loads
   1575276 ±  5%     +35.8%    2138868 ±  5%  perf-stat.i.dTLB-store-misses
 3.396e+09           +21.6%  4.129e+09        perf-stat.i.dTLB-stores
     79.97            +2.8       82.74        perf-stat.i.iTLB-load-miss-rate%
   4265612            +8.4%    4624960 ±  2%  perf-stat.i.iTLB-load-misses
    712599 ±  8%     -38.4%     438645 ±  7%  perf-stat.i.iTLB-loads
  5.59e+10           +27.7%  7.137e+10        perf-stat.i.instructions
     12120           +11.6%      13525 ±  2%  perf-stat.i.instructions-per-iTLB-miss
      0.35           +32.7%       0.46        perf-stat.i.ipc
      0.04 ± 38%    +119.0%       0.08 ± 33%  perf-stat.i.major-faults
      2.36            -8.1%       2.17        perf-stat.i.metric.GHz
    863.69            +7.5%     928.37        perf-stat.i.metric.K/sec
    378.76           +28.8%     487.87        perf-stat.i.metric.M/sec
   1359089           +37.9%    1874285        perf-stat.i.minor-faults
     84.30            -2.8       81.50        perf-stat.i.node-load-miss-rate%
     89.54            -2.5       87.09        perf-stat.i.node-store-miss-rate%
   1359089           +37.9%    1874285        perf-stat.i.page-faults
      3.65 ±  3%     -22.5%       2.82 ±  4%  perf-stat.overall.MPKI
      0.45            -0.1        0.34        perf-stat.overall.branch-miss-rate%
     32.64            -1.7       30.98        perf-stat.overall.cache-miss-rate%
      4.05           -28.0%       2.92        perf-stat.overall.cpi
      1113 ±  3%      -7.1%       1034 ±  3%  perf-stat.overall.cycles-between-cache-misses
      0.05 ±  5%      +0.0        0.05 ±  5%  perf-stat.overall.dTLB-store-miss-rate%
     85.73            +5.6       91.37        perf-stat.overall.iTLB-load-miss-rate%
     13110 ±  2%     +17.8%      15440 ±  2%  perf-stat.overall.instructions-per-iTLB-miss
      0.25           +39.0%       0.34        perf-stat.overall.ipc
      4378            -4.2%       4195        perf-stat.overall.path-length
 1.679e+10           +30.2%  2.186e+10        perf-stat.ps.branch-instructions
  75862675            -2.6%   73920168        perf-stat.ps.branch-misses
   1184994 ±  2%     +19.1%    1411192 ±  3%  perf-stat.ps.context-switches
 2.265e+11            -8.1%  2.082e+11        perf-stat.ps.cpu-cycles
   9518014 ± 12%     +27.3%   12118863 ± 10%  perf-stat.ps.dTLB-load-misses
 1.556e+10           +29.9%  2.022e+10        perf-stat.ps.dTLB-loads
   1575414 ±  5%     +35.8%    2139373 ±  5%  perf-stat.ps.dTLB-store-misses
 3.396e+09           +21.6%  4.129e+09        perf-stat.ps.dTLB-stores
   4265139            +8.4%    4625090 ±  2%  perf-stat.ps.iTLB-load-misses
    711002 ±  8%     -38.5%     437258 ±  7%  perf-stat.ps.iTLB-loads
  5.59e+10           +27.7%  7.137e+10        perf-stat.ps.instructions
      0.04 ± 37%    +118.9%       0.08 ± 33%  perf-stat.ps.major-faults
   1359186           +37.9%    1874615        perf-stat.ps.minor-faults
   1359186           +37.9%    1874615        perf-stat.ps.page-faults
 2.191e+13           +36.3%  2.986e+13        perf-stat.total.instructions
     74.66            -6.7       67.93        perf-profile.calltrace.cycles-pp.exc_page_fault.asm_exc_page_fault.do_access
     74.61            -6.7       67.89        perf-profile.calltrace.cycles-pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.do_access
     53.18            -6.3       46.88        perf-profile.calltrace.cycles-pp.filemap_map_pages.do_read_fault.do_fault.__handle_mm_fault.handle_mm_fault
     35.54            -6.1       29.43        perf-profile.calltrace.cycles-pp.next_uptodate_folio.filemap_map_pages.do_read_fault.do_fault.__handle_mm_fault
     76.49            -5.4       71.07        perf-profile.calltrace.cycles-pp.asm_exc_page_fault.do_access
     79.82            -3.9       75.89        perf-profile.calltrace.cycles-pp.do_access
     70.02            -3.8       66.23        perf-profile.calltrace.cycles-pp.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
     70.39            -3.7       66.70        perf-profile.calltrace.cycles-pp.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.do_access
     68.31            -2.8       65.51        perf-profile.calltrace.cycles-pp.do_fault.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault
     68.29            -2.8       65.50        perf-profile.calltrace.cycles-pp.do_read_fault.do_fault.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      0.65 ±  7%      -0.3        0.37 ± 71%  perf-profile.calltrace.cycles-pp.finish_task_switch.__schedule.schedule.io_schedule.folio_wait_bit_common
      1.94 ±  6%      -0.2        1.71 ±  6%  perf-profile.calltrace.cycles-pp.__schedule.schedule.io_schedule.folio_wait_bit_common.shmem_get_folio_gfp
      1.96 ±  6%      -0.2        1.74 ±  6%  perf-profile.calltrace.cycles-pp.io_schedule.folio_wait_bit_common.shmem_get_folio_gfp.shmem_fault.__do_fault
      1.95 ±  6%      -0.2        1.74 ±  6%  perf-profile.calltrace.cycles-pp.schedule.io_schedule.folio_wait_bit_common.shmem_get_folio_gfp.shmem_fault
      0.86            +0.1        1.00 ±  2%  perf-profile.calltrace.cycles-pp.folio_add_file_rmap_range.set_pte_range.filemap_map_pages.do_read_fault.do_fault
      0.56            +0.2        0.72 ±  4%  perf-profile.calltrace.cycles-pp.sched_ttwu_pending.__flush_smp_call_function_queue.flush_smp_call_function_queue.do_idle.cpu_startup_entry
      1.16 ±  3%      +0.2        1.33 ±  2%  perf-profile.calltrace.cycles-pp.set_pte_range.filemap_map_pages.do_read_fault.do_fault.__handle_mm_fault
      0.71 ±  2%      +0.2        0.92 ±  3%  perf-profile.calltrace.cycles-pp.__flush_smp_call_function_queue.flush_smp_call_function_queue.do_idle.cpu_startup_entry.start_secondary
      0.78            +0.2        1.02 ±  4%  perf-profile.calltrace.cycles-pp.flush_smp_call_function_queue.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
      0.44 ± 44%      +0.3        0.73 ±  3%  perf-profile.calltrace.cycles-pp.set_pte_range.finish_fault.do_read_fault.do_fault.__handle_mm_fault
      0.89 ±  9%      +0.3        1.24 ±  8%  perf-profile.calltrace.cycles-pp.finish_fault.do_read_fault.do_fault.__handle_mm_fault.handle_mm_fault
      1.23            +0.4        1.59        perf-profile.calltrace.cycles-pp.irqentry_exit_to_user_mode.asm_exc_page_fault.do_access
      0.18 ±141%      +0.4        0.57 ±  5%  perf-profile.calltrace.cycles-pp.try_to_wake_up.wake_page_function.__wake_up_common.folio_wake_bit.filemap_map_pages
      1.50            +0.6        2.05        perf-profile.calltrace.cycles-pp.filemap_get_entry.shmem_get_folio_gfp.shmem_fault.__do_fault.do_read_fault
      0.00            +0.6        0.56 ±  4%  perf-profile.calltrace.cycles-pp.wake_page_function.__wake_up_common.folio_wake_bit.do_read_fault.do_fault
      0.09 ±223%      +0.6        0.69 ±  4%  perf-profile.calltrace.cycles-pp.__wake_up_common.folio_wake_bit.do_read_fault.do_fault.__handle_mm_fault
      0.00            +0.6        0.60        perf-profile.calltrace.cycles-pp.folio_add_file_rmap_range.set_pte_range.finish_fault.do_read_fault.do_fault
      2.98 ±  3%      +0.7        3.66 ±  2%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.folio_wait_bit_common.shmem_get_folio_gfp.shmem_fault
      3.39 ±  3%      +0.8        4.21        perf-profile.calltrace.cycles-pp._raw_spin_lock_irq.folio_wait_bit_common.shmem_get_folio_gfp.shmem_fault.__do_fault
      7.48            +0.9        8.41        perf-profile.calltrace.cycles-pp.folio_wait_bit_common.shmem_get_folio_gfp.shmem_fault.__do_fault.do_read_fault
      2.25 ±  6%      +1.0        3.30 ±  3%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.folio_wake_bit.do_read_fault.do_fault
      2.44 ±  5%      +1.1        3.56 ±  2%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.folio_wake_bit.do_read_fault.do_fault.__handle_mm_fault
      3.11 ±  4%      +1.4        4.52        perf-profile.calltrace.cycles-pp.folio_wake_bit.do_read_fault.do_fault.__handle_mm_fault.handle_mm_fault
     10.14            +1.9       12.06        perf-profile.calltrace.cycles-pp.shmem_get_folio_gfp.shmem_fault.__do_fault.do_read_fault.do_fault
     10.26            +2.0       12.25        perf-profile.calltrace.cycles-pp.shmem_fault.__do_fault.do_read_fault.do_fault.__handle_mm_fault
     10.29            +2.0       12.29        perf-profile.calltrace.cycles-pp.__do_fault.do_read_fault.do_fault.__handle_mm_fault.handle_mm_fault
      9.69            +5.5       15.21 ±  2%  perf-profile.calltrace.cycles-pp.do_rw_once
     74.66            -6.7       67.94        perf-profile.children.cycles-pp.exc_page_fault
     74.62            -6.7       67.90        perf-profile.children.cycles-pp.do_user_addr_fault
     53.19            -6.3       46.89        perf-profile.children.cycles-pp.filemap_map_pages
     35.56            -6.1       29.44        perf-profile.children.cycles-pp.next_uptodate_folio
     76.51            -6.0       70.48        perf-profile.children.cycles-pp.asm_exc_page_fault
     70.02            -3.8       66.24        perf-profile.children.cycles-pp.__handle_mm_fault
     70.40            -3.7       66.71        perf-profile.children.cycles-pp.handle_mm_fault
     81.33            -3.5       77.78        perf-profile.children.cycles-pp.do_access
     68.32            -2.8       65.52        perf-profile.children.cycles-pp.do_fault
     68.30            -2.8       65.50        perf-profile.children.cycles-pp.do_read_fault
      2.07 ±  7%      -2.0        0.12 ±  6%  perf-profile.children.cycles-pp.down_read_trylock
      1.28 ±  4%      -1.1        0.16 ±  4%  perf-profile.children.cycles-pp.up_read
      0.65 ± 12%      -0.4        0.28 ± 15%  perf-profile.children.cycles-pp.intel_idle_irq
      1.96 ±  6%      -0.2        1.74 ±  6%  perf-profile.children.cycles-pp.schedule
      1.96 ±  6%      -0.2        1.74 ±  6%  perf-profile.children.cycles-pp.io_schedule
      0.36 ±  7%      -0.2        0.15 ±  3%  perf-profile.children.cycles-pp.mtree_range_walk
      0.30 ±  8%      -0.2        0.13 ± 14%  perf-profile.children.cycles-pp.mm_cid_get
      0.12 ± 12%      -0.1        0.03 ±100%  perf-profile.children.cycles-pp.update_sg_lb_stats
      0.16 ±  9%      -0.1        0.07 ± 15%  perf-profile.children.cycles-pp.load_balance
      0.14 ± 10%      -0.1        0.05 ± 46%  perf-profile.children.cycles-pp.update_sd_lb_stats
      0.20 ± 10%      -0.1        0.11 ±  8%  perf-profile.children.cycles-pp.newidle_balance
      0.14 ± 10%      -0.1        0.06 ± 17%  perf-profile.children.cycles-pp.find_busiest_group
      0.33 ±  6%      -0.0        0.28 ±  5%  perf-profile.children.cycles-pp.pick_next_task_fair
      0.05            +0.0        0.06        perf-profile.children.cycles-pp.nohz_run_idle_balance
      0.06            +0.0        0.08 ±  6%  perf-profile.children.cycles-pp.__update_load_avg_se
      0.04 ± 44%      +0.0        0.06        perf-profile.children.cycles-pp.reweight_entity
      0.09 ±  7%      +0.0        0.11 ±  4%  perf-profile.children.cycles-pp.xas_descend
      0.08 ±  5%      +0.0        0.10 ±  4%  perf-profile.children.cycles-pp.update_curr
      0.09 ±  7%      +0.0        0.11 ±  3%  perf-profile.children.cycles-pp.prepare_task_switch
      0.10 ±  4%      +0.0        0.12 ±  3%  perf-profile.children.cycles-pp.call_function_single_prep_ipi
      0.08 ±  4%      +0.0        0.10 ±  5%  perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
      0.04 ± 44%      +0.0        0.06 ±  7%  perf-profile.children.cycles-pp.sched_clock
      0.13 ±  7%      +0.0        0.16 ±  4%  perf-profile.children.cycles-pp.__sysvec_call_function_single
      0.08 ±  6%      +0.0        0.10 ±  3%  perf-profile.children.cycles-pp.set_next_entity
      0.16 ±  4%      +0.0        0.19 ±  3%  perf-profile.children.cycles-pp.__switch_to
      0.09 ±  4%      +0.0        0.12 ±  4%  perf-profile.children.cycles-pp.llist_reverse_order
      0.04 ± 44%      +0.0        0.07 ±  5%  perf-profile.children.cycles-pp.place_entity
      0.14 ±  3%      +0.0        0.16 ±  3%  perf-profile.children.cycles-pp.llist_add_batch
      0.09 ±  5%      +0.0        0.12 ±  6%  perf-profile.children.cycles-pp.available_idle_cpu
      0.15 ±  4%      +0.0        0.18 ±  4%  perf-profile.children.cycles-pp.sysvec_call_function_single
      0.08 ±  5%      +0.0        0.12 ±  6%  perf-profile.children.cycles-pp.wake_affine
      0.08            +0.0        0.11        perf-profile.children.cycles-pp.__list_del_entry_valid_or_report
      0.11 ±  4%      +0.0        0.14 ±  3%  perf-profile.children.cycles-pp.update_rq_clock_task
      0.11 ±  4%      +0.0        0.14 ±  4%  perf-profile.children.cycles-pp.__switch_to_asm
      0.04 ± 44%      +0.0        0.07 ±  6%  perf-profile.children.cycles-pp.folio_add_lru
      0.06 ±  7%      +0.0        0.10 ±  6%  perf-profile.children.cycles-pp.shmem_add_to_page_cache
      0.18 ±  5%      +0.0        0.22 ±  4%  perf-profile.children.cycles-pp.asm_sysvec_call_function_single
      0.02 ±141%      +0.0        0.06 ±  6%  perf-profile.children.cycles-pp.tick_nohz_idle_exit
      0.12 ±  3%      +0.0        0.17 ±  5%  perf-profile.children.cycles-pp.select_task_rq_fair
      0.13 ±  3%      +0.0        0.18 ±  6%  perf-profile.children.cycles-pp.select_task_rq
      0.23 ±  3%      +0.1        0.29 ±  3%  perf-profile.children.cycles-pp.__smp_call_single_queue
      0.20 ±  3%      +0.1        0.26 ±  3%  perf-profile.children.cycles-pp.update_load_avg
      0.01 ±223%      +0.1        0.07 ± 18%  perf-profile.children.cycles-pp.shmem_alloc_and_acct_folio
      0.26 ±  2%      +0.1        0.34 ±  3%  perf-profile.children.cycles-pp.dequeue_entity
      0.29 ±  3%      +0.1        0.37 ±  4%  perf-profile.children.cycles-pp.dequeue_task_fair
      0.17 ±  3%      +0.1        0.26 ±  2%  perf-profile.children.cycles-pp.sync_regs
      0.34 ±  2%      +0.1        0.42 ±  4%  perf-profile.children.cycles-pp.ttwu_queue_wakelist
      0.28 ±  3%      +0.1        0.37 ±  4%  perf-profile.children.cycles-pp.enqueue_entity
      0.28 ±  3%      +0.1        0.38 ±  6%  perf-profile.children.cycles-pp.__perf_sw_event
      0.32 ±  2%      +0.1        0.42 ±  5%  perf-profile.children.cycles-pp.___perf_sw_event
      0.34 ±  3%      +0.1        0.44 ±  4%  perf-profile.children.cycles-pp.enqueue_task_fair
      0.36 ±  2%      +0.1        0.46 ±  3%  perf-profile.children.cycles-pp.activate_task
      0.24 ±  2%      +0.1        0.35        perf-profile.children.cycles-pp.native_irq_return_iret
      0.30 ±  6%      +0.1        0.42 ± 10%  perf-profile.children.cycles-pp.xas_load
      0.31            +0.1        0.43 ±  3%  perf-profile.children.cycles-pp.folio_unlock
      0.44 ±  2%      +0.1        0.56 ±  4%  perf-profile.children.cycles-pp.ttwu_do_activate
      0.40 ±  6%      +0.2        0.56 ±  5%  perf-profile.children.cycles-pp._compound_head
      1.52            +0.2        1.68 ±  4%  perf-profile.children.cycles-pp.wake_page_function
      0.68 ±  3%      +0.2        0.86 ±  4%  perf-profile.children.cycles-pp.try_to_wake_up
      0.66 ±  2%      +0.2        0.84 ±  3%  perf-profile.children.cycles-pp.sched_ttwu_pending
      0.85 ±  2%      +0.2        1.09 ±  3%  perf-profile.children.cycles-pp.__flush_smp_call_function_queue
      0.79 ±  2%      +0.2        1.03 ±  4%  perf-profile.children.cycles-pp.flush_smp_call_function_queue
      1.83            +0.3        2.08 ±  4%  perf-profile.children.cycles-pp.__wake_up_common
      1.29            +0.3        1.60        perf-profile.children.cycles-pp.folio_add_file_rmap_range
      0.89 ±  9%      +0.4        1.24 ±  8%  perf-profile.children.cycles-pp.finish_fault
      1.24            +0.4        1.60        perf-profile.children.cycles-pp.irqentry_exit_to_user_mode
      1.68 ±  3%      +0.4        2.06 ±  2%  perf-profile.children.cycles-pp.set_pte_range
      1.50            +0.6        2.06        perf-profile.children.cycles-pp.filemap_get_entry
      3.42 ±  3%      +0.8        4.24        perf-profile.children.cycles-pp._raw_spin_lock_irq
      7.48            +0.9        8.41        perf-profile.children.cycles-pp.folio_wait_bit_common
      9.67 ±  4%      +1.4       11.07 ±  2%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
     12.08 ±  3%      +1.8       13.84        perf-profile.children.cycles-pp.folio_wake_bit
     10.15            +1.9       12.07        perf-profile.children.cycles-pp.shmem_get_folio_gfp
     11.80 ±  4%      +1.9       13.74 ±  2%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
     10.26            +2.0       12.25        perf-profile.children.cycles-pp.shmem_fault
     10.29            +2.0       12.29        perf-profile.children.cycles-pp.__do_fault
      8.59            +5.3       13.94 ±  2%  perf-profile.children.cycles-pp.do_rw_once
     35.10            -6.1       28.98 ±  2%  perf-profile.self.cycles-pp.next_uptodate_folio
      2.06 ±  7%      -1.9        0.11 ±  4%  perf-profile.self.cycles-pp.down_read_trylock
      1.28 ±  4%      -1.1        0.16 ±  3%  perf-profile.self.cycles-pp.up_read
      1.66 ±  6%      -1.0        0.68 ±  3%  perf-profile.self.cycles-pp.__handle_mm_fault
      7.20            -0.7        6.55        perf-profile.self.cycles-pp.filemap_map_pages
      0.64 ± 12%      -0.4        0.28 ± 15%  perf-profile.self.cycles-pp.intel_idle_irq
      0.36 ±  7%      -0.2        0.15        perf-profile.self.cycles-pp.mtree_range_walk
      0.30 ±  8%      -0.2        0.13 ± 14%  perf-profile.self.cycles-pp.mm_cid_get
      0.71 ±  8%      -0.1        0.59 ±  7%  perf-profile.self.cycles-pp.__schedule
      0.05 ±  8%      +0.0        0.06 ±  7%  perf-profile.self.cycles-pp.ttwu_do_activate
      0.08 ±  5%      +0.0        0.10 ±  4%  perf-profile.self.cycles-pp.do_idle
      0.06 ±  6%      +0.0        0.08 ±  6%  perf-profile.self.cycles-pp.enqueue_task_fair
      0.05 ±  8%      +0.0        0.07 ±  8%  perf-profile.self.cycles-pp.__update_load_avg_se
      0.09 ±  5%      +0.0        0.10 ±  4%  perf-profile.self.cycles-pp.xas_descend
      0.04 ± 44%      +0.0        0.06        perf-profile.self.cycles-pp.reweight_entity
      0.05 ±  7%      +0.0        0.07 ±  9%  perf-profile.self.cycles-pp.set_pte_range
      0.08 ±  6%      +0.0        0.10 ±  5%  perf-profile.self.cycles-pp.update_load_avg
      0.10 ±  4%      +0.0        0.12 ±  3%  perf-profile.self.cycles-pp.call_function_single_prep_ipi
      0.07 ±  5%      +0.0        0.09 ±  5%  perf-profile.self.cycles-pp.__update_load_avg_cfs_rq
      0.08 ±  6%      +0.0        0.10 ±  6%  perf-profile.self.cycles-pp.flush_smp_call_function_queue
      0.10 ±  4%      +0.0        0.13 ±  2%  perf-profile.self.cycles-pp.__flush_smp_call_function_queue
      0.16 ±  4%      +0.0        0.19 ±  3%  perf-profile.self.cycles-pp.__switch_to
      0.14 ±  3%      +0.0        0.16 ±  3%  perf-profile.self.cycles-pp.llist_add_batch
      0.09 ±  5%      +0.0        0.12 ±  6%  perf-profile.self.cycles-pp.available_idle_cpu
      0.08 ±  5%      +0.0        0.12 ±  6%  perf-profile.self.cycles-pp.enqueue_entity
      0.08 ±  5%      +0.0        0.12 ±  4%  perf-profile.self.cycles-pp.llist_reverse_order
      0.10 ±  4%      +0.0        0.13 ±  3%  perf-profile.self.cycles-pp.update_rq_clock_task
      0.08            +0.0        0.11        perf-profile.self.cycles-pp.__list_del_entry_valid_or_report
      0.11 ±  4%      +0.0        0.14 ±  4%  perf-profile.self.cycles-pp.__switch_to_asm
      0.09 ±  5%      +0.0        0.12 ±  8%  perf-profile.self.cycles-pp.ttwu_queue_wakelist
      0.12 ±  4%      +0.0        0.16 ±  6%  perf-profile.self.cycles-pp.xas_load
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.sched_ttwu_pending
      0.00            +0.1        0.06        perf-profile.self.cycles-pp.asm_exc_page_fault
      0.11 ±  4%      +0.1        0.18 ±  4%  perf-profile.self.cycles-pp.shmem_fault
      0.17 ±  3%      +0.1        0.26 ±  2%  perf-profile.self.cycles-pp.sync_regs
      0.31 ±  2%      +0.1        0.40 ±  5%  perf-profile.self.cycles-pp.___perf_sw_event
      0.31 ±  2%      +0.1        0.40 ±  3%  perf-profile.self.cycles-pp.__wake_up_common
      0.24 ±  2%      +0.1        0.35        perf-profile.self.cycles-pp.native_irq_return_iret
      0.31            +0.1        0.43 ±  3%  perf-profile.self.cycles-pp.folio_unlock
      0.44 ±  3%      +0.1        0.57 ±  2%  perf-profile.self.cycles-pp._raw_spin_lock_irq
      0.68 ±  3%      +0.1        0.83 ±  2%  perf-profile.self.cycles-pp.folio_wake_bit
      0.85            +0.2        1.00 ±  3%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.40 ±  5%      +0.2        0.56 ±  5%  perf-profile.self.cycles-pp._compound_head
      1.29            +0.3        1.59        perf-profile.self.cycles-pp.folio_add_file_rmap_range
      0.99            +0.3        1.30 ±  2%  perf-profile.self.cycles-pp.shmem_get_folio_gfp
      2.08            +0.3        2.39 ±  2%  perf-profile.self.cycles-pp.folio_wait_bit_common
      1.18            +0.4        1.55        perf-profile.self.cycles-pp.irqentry_exit_to_user_mode
      1.43            +0.5        1.90        perf-profile.self.cycles-pp.filemap_get_entry
      3.93            +1.9        5.85        perf-profile.self.cycles-pp.do_access
     11.80 ±  4%      +1.9       13.74 ±  2%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      6.55            +4.5       11.08 ±  2%  perf-profile.self.cycles-pp.do_rw_once




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

