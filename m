Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFF011185
	for <oe-lkp@lists.linux.dev>; Mon, 18 Dec 2023 08:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SNY0PLf6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702887479; x=1734423479;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=vINd+agS5uqpNH6upcQk/VGA8B5OiqEvUB9uhDcZHRE=;
  b=SNY0PLf6Cp+SJub8GOa3NtwVqAbVEedWjak6oxKfXfQcgSU9MRCXk0rj
   Zsh4ctesv3CEwzY1tHxR7h3o/lX1gHSvMnMVD0K4VwrD3KyGtMBarqzDT
   dCCcRXH6Hz7eZbETg9tOvaTlZRDB7O4komek6br0XXpZVVZ1QPPSVsEkZ
   9dLF65I1AIZ+kBEUz6bK91V+LOAJ4NbDxWzDry50tLrawHkpJBEZYPMfE
   DelWkYbBD6XTFpowwM+lIWZlOxzUAvI2b/RhjB2ntOiUnsspdXodEOVQl
   1EUBKmjA/LmW41xU6JewI9Wk1JOFlZ4Dsy1eK4+7ZivsbONUJssxCNr8g
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="461924438"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="461924438"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 00:17:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="804443704"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="804443704"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 18 Dec 2023 00:17:21 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Dec 2023 00:17:20 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Dec 2023 00:17:20 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Dec 2023 00:17:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UkaI6WQiEyBwInskxbrnLZuCDBbieSx8yOeIaBrnHJoVQEjci2eCQlVwvkm+GNR1iJ5M+dD803RnCF3nD5JZwP2vGGuBQ/YFLrHmNVlMSM3dV33aDTAh3KJFb0PcUB3epNaLHsLKroqai8Rn9YWTPC4V7O+gRREXoVP9Togd9OGVPRgia1kDqKUlxwe8c1KdkSDzRr4ljmswbu4OrPsegzCVYNuZ29niVWVSJaZ0w4nLtrSjFJU4eJFsewY4nPmQJjjP+dcg4NE0pZgnFW4ghcHnJ8QpkP4Br5RZUKQZ/ZEvtKtvwE/TTlXUKpAtpSsE3gLIbAKBQnkkDDMjAuaeMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rwj4sJfUF4VxrT1NyhyV/o8sgUUlHO2N+YiLgoh6SsE=;
 b=eb8EADBvS65D+6lEEbxXenTawirUyGIrT45K9ROLbLXcIEs6xRix+jZamCyOeOp4VhK2w4ikqEoZ2Sh01kGWucGSD28lG/kqlzvhCqOTnL7yRr/omDPmxJXnljRab4aqkFLBSaOKZl41+Gkhc/gRlOInJikz11X5FsOTQ+AlF9DHtTB5pOTR/lLXFpS1Q1MeDRouEn5HHylzlbW1G70LGx9Vz8U5LgpOD62WYFjGJW0SaABBV9KCy2/uQEFNUPzpGEW1LtIITwr8X7K7z71w2iEWvEXg0phRh/zBf7nVXTg02qHnkkAp7KH1C2jynB9g+BNuKrFDd3FhxkT9S0ubmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by IA1PR11MB7269.namprd11.prod.outlook.com (2603:10b6:208:42b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37; Mon, 18 Dec
 2023 08:17:15 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::1236:9a2e:5acd:a7f]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::1236:9a2e:5acd:a7f%3]) with mapi id 15.20.7091.034; Mon, 18 Dec 2023
 08:17:15 +0000
Date: Mon, 18 Dec 2023 16:17:08 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [amir73il:sb_write_barrier] [fs]  753d63fa0e:
 phoronix-test-suite.iozone.1MB.2GB.WritePerformance.mb_s -95.7% regression
Message-ID: <202312181550.3fa030a7-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0025.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::10) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|IA1PR11MB7269:EE_
X-MS-Office365-Filtering-Correlation-Id: 0aa643db-49f2-4a74-77df-08dbffa1be48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /EmJWuJTYxdxYFETpI4LWj1FCPoWUHvNl5rEsB1/uHtYZ4KaNG/s6fKEy6n6dBIRk337kI+krbJAO8uQpP3vdpgE86oe7TSk0JnQ8E7QQ55PkzthUr8CF4R9j/UqaA+b90QhWUW+XRKG1YA1RYDUaFlza0deq5IfitaACdOhgXWI2xGImLF4nKQZyd36ftYJXDGSkDZqbQF+4hksuD+8CJzPo0z9K0t9jPpX0Jz2wOccZuCHOk4Dd7+vkUAW42/ueCnj2x5a6ZJ4LuznO+8IlBJMgeIxukRd9LoCCVSsp30hVQWHTjpVYHbWZUF7m6fkmHaX6ru4ISyRxryNM0a13XBIb8xPdxWVVSRsqbADRS7cS0D6S3E7xVTQFFqNhoGclm4tnSMWfLW5eoslOU9bs4N6pDBOcdmIQL0HxmzOAoqtkvqxasAVk5ePY1qZsS10QLCu2q0lshebpVkEN+u8nnS0v/mxkk1eexTwYqBIcp49R2KY4i4vV+T+imCKKRIXgpwPidnWAYcU4zB1hnARJN2dvfXQS/RrewckrNhIwjon5cZsu/gULQOYvTWeM5Q36uvZnNR0Tti/8K+a1QTbiaYtGUtJv+9qBKoG0vxmS248fYqTIA3Rhfl8cgyrlzJemveN+Gywjv72pLDvEE+c4g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(346002)(376002)(39860400002)(230473577357003)(230922051799003)(230373577357003)(186009)(64100799003)(451199024)(1800799012)(82960400001)(86362001)(36756003)(38100700002)(83380400001)(107886003)(26005)(2616005)(1076003)(316002)(478600001)(966005)(19627235002)(66946007)(2906002)(30864003)(66556008)(66476007)(6916009)(6666004)(6512007)(6506007)(6486002)(5660300002)(8936002)(4326008)(8676002)(41300700001)(559001)(579004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?4DClwUibQUOn4sVlhU2APszvKL3werKKMI9SjQPiwKdft+9AoBNdKjU1Ji?=
 =?iso-8859-1?Q?nrJNHMaEgSOQXKnfJpW8J62h4uA7dmv+nAxqYYG5PeTtJYXtT+2QX5sZx2?=
 =?iso-8859-1?Q?Uej6AlPni0tXmFypqYs0kGRFiOfh3n6VWGC5nCI4cN0SAVKvDygzuZBjdB?=
 =?iso-8859-1?Q?RXfCu78oALRzF1ZSPyVs1zwzFQloNlbBmQjz0D1fRbZCqMMtUcZ7hDTcn/?=
 =?iso-8859-1?Q?/5xVnze3dE43b7bV11WruqDGySbxN+4dVUS2hURk3FvrsHpkGtOpwoqEUX?=
 =?iso-8859-1?Q?+6W13/6jgK2yvpTs1BgFuLF0hFXSYFQ7Sozo8Mgu1SsSNT9pRNPm6jkrDF?=
 =?iso-8859-1?Q?0Ofvt5jV7YPNgSkm6v1k6dSy4sfGRZtRC+M+AO8LVmHmE44ucSGdWw0glA?=
 =?iso-8859-1?Q?IEd6YcgA+UCgR3+lR9tWkPQS87Rl6as0OPS16FWg9c6gYcUVW/xqlFKCOE?=
 =?iso-8859-1?Q?67l6mjG4cBIJeoaV1GCOF1MzukuqNTHaaChoaV+qY6jVsHza+OOW6Y7SQj?=
 =?iso-8859-1?Q?CvYpWyA1PxDlBhRZNssD/9RlQQ1JHrM38fT6OneIFDDJ45L9qplFGplX3n?=
 =?iso-8859-1?Q?QiZoL9cFS8+rXPPp9zkXSA0nMq/tLQwFADsbBwDDLKSEDEn/qR0PJec1zV?=
 =?iso-8859-1?Q?RZvCN17us/m44fnkK2AA7BMvfV96tGXgktprk9uDzwyDMWJ7gkSNeXpKIB?=
 =?iso-8859-1?Q?WU24EqG4RWVJar8ro+T6N+GwohRxtHNIKpf7hBZzE6XEmkPDhU5UJMQH8h?=
 =?iso-8859-1?Q?Yfcwb/q14oiUD8KRF4LEpHOoa4dz+KWzaDEAp+Ji4ckLQc5fnmaEUFmgyt?=
 =?iso-8859-1?Q?KeUvTLqGM1yInk3x62FRCqreOj3eBL7LwePZUh0yUKR+NTpQZcVCxSYCiW?=
 =?iso-8859-1?Q?vlYbuCh8zhGfPqEedHH7Lz4pxeTjkYU2xeWSdHln+jsz2M5I2onoGqVRHt?=
 =?iso-8859-1?Q?+v31jXz42LXQNorSaZKLSoxHceM+nBF6KbyJ/UjpDqeG1zpNvsp2qhRhj0?=
 =?iso-8859-1?Q?v8XfFj8pJa8LPTXSsqBZYNWncyFkTVeXy/jCOcMpD1noFJnoKjloQmz1+n?=
 =?iso-8859-1?Q?hwXhXs6CDvMa+LqpGL6+lDQMxLSSswkF5u3BDKMCKQh3C0pPjFAyze38HH?=
 =?iso-8859-1?Q?9iiWgjqVPU4U7b//hC+EHUsGuheSfBc6TbNiu2CeJtHoeQh3fWuEeFUnQj?=
 =?iso-8859-1?Q?nvyb/DJLvHqU/Vt56bUWZ5EfLeqUyogEkXIEV24LirjpnZU2wCZ5YEO3cK?=
 =?iso-8859-1?Q?LZXk6lK7fD6gxDMJU60a91zvPbjW2cK7jB1P2+07TGGPmbt5LkkxxSOY2B?=
 =?iso-8859-1?Q?Vtm/84+yBfc0bquPzcisyPw0imGW5yj7NYUvUMhGNCkkyonBnnOTQ3VkQB?=
 =?iso-8859-1?Q?C2z+cNBUeTZncgRSOUQR5uVzpzvt3qoTbw+E/O6cc2gMJnAt0NPRbqiNaP?=
 =?iso-8859-1?Q?5sHWBBVe8ceDc0+5w3EMlR+Ht8+CMIzs0yPvvRfUk/uoHp64r4RZjMvmXS?=
 =?iso-8859-1?Q?FclSigUOt6FFFeFDYk6Ov5irbJFAvgqwG2y5WN9rTBQDL7MlMn1JehIelc?=
 =?iso-8859-1?Q?Zr4N/6mvEV7sACMRONBuxbEFTIe9BDFlt/0Tx1mP+wPbjSrEY6tsbHmBfX?=
 =?iso-8859-1?Q?+ioy6LDQ0KW0IK9/vKgy/E+nS/vbD1vigU5rbYceinWKCO6+0x7xx5fw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aa643db-49f2-4a74-77df-08dbffa1be48
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 08:17:15.6381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lC+Yhl8H2+AIeCJTGcmTgbD328T5HWibHlH5c1sVvCm/XjkxhlYt0nblFu1ameXe4qYH3/xULme+9IyFHe0sAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7269
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a -95.7% regression of phoronix-test-suite.iozone.1MB.2GB.WritePerformance.mb_s on:


commit: 753d63fa0e79bb7ad14f0351b800f856b5364ec3 ("fs: add srcu variants for mnt_{want,drop}_write() helpers")
https://github.com/amir73il/linux sb_write_barrier

testcase: phoronix-test-suite
test machine: 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz (Cascade Lake) with 512G memory
parameters:

	test: iozone-1.9.5
	option_a: 1MB
	option_b: 2GB
	option_c: Write Performance
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+---------------------------------------------------------------------------------------------------+
| testcase: change | phoronix-test-suite: phoronix-test-suite.iozone.4Kb.2GB.WritePerformance.mb_s -93.5% regression   |
| test machine     | 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz (Cascade Lake) with 512G memory     |
| test parameters  | cpufreq_governor=performance                                                                      |
|                  | option_a=4Kb                                                                                      |
|                  | option_b=2GB                                                                                      |
|                  | option_c=Write Performance                                                                        |
|                  | test=iozone-1.9.5                                                                                 |
+------------------+---------------------------------------------------------------------------------------------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202312181550.3fa030a7-oliver.sang@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20231218/202312181550.3fa030a7-oliver.sang@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/option_a/option_b/option_c/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-8.3/1MB/2GB/Write Performance/debian-x86_64-phoronix/lkp-csl-2sp7/iozone-1.9.5/phoronix-test-suite

commit: 
  e89b095059 ("fs: implement 'vfs write barriers'")
  753d63fa0e ("fs: add srcu variants for mnt_{want,drop}_write() helpers")

e89b095059a2ddd1 753d63fa0e79bb7ad14f0351b80 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     37.09           -29.0%      26.34        boot-time.boot
      3069 ±  2%     -33.2%       2050 ±  2%  boot-time.idle
 2.866e+09 ±  2%    +290.7%   1.12e+10        cpuidle..time
   3027636 ±  2%    +289.3%   11785222        cpuidle..usage
     73.67 ± 24%     -61.1%      28.67 ± 14%  perf-c2c.DRAM.remote
     55.17 ±  7%     +29.9%      71.67 ±  9%  perf-c2c.HITM.local
     69.45          +115.1%     149.42        uptime.boot
      6065          +120.7%      13385        uptime.idle
      0.13 ± 54%      +0.7        0.88        mpstat.cpu.all.iowait%
      0.12 ±  2%      +0.0        0.14 ±  2%  mpstat.cpu.all.soft%
      0.36 ±  2%      -0.2        0.15        mpstat.cpu.all.sys%
      0.51            -0.3        0.21 ±  2%  mpstat.cpu.all.usr%
     95625 ± 52%    +442.6%     518909 ± 73%  numa-meminfo.node0.Active
     41898 ± 95%     -96.2%       1594 ± 22%  numa-meminfo.node0.Active(anon)
     53726 ± 28%    +862.9%     517314 ± 73%  numa-meminfo.node0.Active(file)
      4.69 ±223%  +7.7e+06%     362269 ± 99%  numa-meminfo.node0.Dirty
    706586 ± 32%     -62.9%     262072 ± 22%  numa-meminfo.node0.Inactive(anon)
    510520 ± 40%     -98.8%       6351 ± 14%  numa-meminfo.node0.Shmem
      3106 ± 11%     -61.7%       1188 ±  7%  vmstat.io.bi
     12.48 ±223%  +8.3e+05%     103238        vmstat.io.bo
      0.44 ± 40%    +103.3%       0.88 ±  2%  vmstat.procs.b
      1.44 ±  7%     -69.9%       0.43 ±  4%  vmstat.procs.r
      2549 ±  2%     -22.7%       1970 ±  8%  vmstat.system.cs
     95167            +3.3%      98260        vmstat.system.in
      3052           -95.7%     131.80        phoronix-test-suite.iozone.1MB.2GB.WritePerformance.mb_s
     29.05          +311.7%     119.60        phoronix-test-suite.time.elapsed_time
     29.05          +311.7%     119.60        phoronix-test-suite.time.elapsed_time.max
    167808 ±  7%     +61.6%     271240 ±  5%  phoronix-test-suite.time.file_system_inputs
    629.33 ±223%    +4e+06%   25257445        phoronix-test-suite.time.file_system_outputs
     26.83           -66.5%       9.00        phoronix-test-suite.time.percent_of_cpu_this_job_got
      2755          +357.4%      12601 ± 68%  phoronix-test-suite.time.voluntary_context_switches
    171848 ±  8%    +486.8%    1008466        meminfo.Active
     76613 ± 18%     -69.7%      23194 ±  2%  meminfo.Active(anon)
     95235          +934.6%     985271        meminfo.Active(file)
     71847 ± 19%     +68.6%     121147 ± 15%  meminfo.AnonHugePages
   2407590           -28.1%    1731602        meminfo.Committed_AS
      4.69 ±223%  +1.5e+07%     725593        meminfo.Dirty
   2745467           -27.3%    1994885        meminfo.Inactive
   1565883           -41.2%     919981        meminfo.Inactive(anon)
   1179583            -8.9%    1074904        meminfo.Inactive(file)
     71527            -9.0%      65063        meminfo.KReclaimable
     71527            -9.0%      65063        meminfo.SReclaimable
   1178661           -59.7%     475526        meminfo.Shmem
   5106745            -9.7%    4609300        meminfo.max_used_kB
     10492 ± 95%     -96.2%     398.56 ± 22%  numa-vmstat.node0.nr_active_anon
     13431 ± 28%    +864.8%     129588 ± 73%  numa-vmstat.node0.nr_active_file
     84.67 ±223%  +1.9e+06%    1581180 ± 99%  numa-vmstat.node0.nr_dirtied
      1.17 ±223%  +7.8e+06%      90810 ± 99%  numa-vmstat.node0.nr_dirty
    176660 ± 32%     -62.9%      65523 ± 22%  numa-vmstat.node0.nr_inactive_anon
    127661 ± 40%     -98.8%       1588 ± 14%  numa-vmstat.node0.nr_shmem
     84.67 ±223%  +1.9e+06%    1579533 ± 99%  numa-vmstat.node0.nr_written
     10492 ± 95%     -96.2%     398.56 ± 22%  numa-vmstat.node0.nr_zone_active_anon
     13431 ± 28%    +864.8%     129588 ± 73%  numa-vmstat.node0.nr_zone_active_file
    176660 ± 32%     -62.9%      65523 ± 22%  numa-vmstat.node0.nr_zone_inactive_anon
      0.91 ±223%  +1.1e+07%     103105 ± 99%  numa-vmstat.node0.nr_zone_write_pending
      0.00       +1.6e+108%    1581089 ± 99%  numa-vmstat.node1.nr_dirtied
      0.00       +1.6e+108%    1579670 ± 99%  numa-vmstat.node1.nr_written
     75.17           -14.2%      64.50        turbostat.Avg_MHz
      1454           -17.7%       1197        turbostat.Bzy_MHz
      0.06 ± 11%      -0.0        0.02        turbostat.C1%
     34176 ±  6%    +452.8%     188930 ±  2%  turbostat.C1E
      0.39 ± 16%      +0.7        1.10        turbostat.C1E%
   2925898 ±  2%    +292.5%   11485398        turbostat.C6
     27.10           +14.6%      31.06        turbostat.CPU%c6
     48.17 ±  3%     -10.7%      43.00        turbostat.CoreTmp
   3052191 ±  2%    +294.0%   12024782        turbostat.IRQ
      6237 ±  3%    +342.2%      27579 ± 24%  turbostat.POLL
      7.21 ±  3%     -82.1%       1.29 ±  7%  turbostat.Pkg%pc6
     48.33 ±  3%     -11.4%      42.83 ±  2%  turbostat.PkgTmp
    103.56           -16.0%      86.96        turbostat.PkgWatt
    139.27            +4.2%     145.09        turbostat.RAMWatt
     19263 ± 18%     -69.9%       5799 ±  2%  proc-vmstat.nr_active_anon
     23809          +934.0%     246183        proc-vmstat.nr_active_file
     84.67 ±223%  +3.7e+06%    3162259        proc-vmstat.nr_dirtied
      1.17 ±223%  +1.5e+07%     181458        proc-vmstat.nr_dirty
    613530            +3.3%     633750        proc-vmstat.nr_file_pages
    391490           -41.3%     229996        proc-vmstat.nr_inactive_anon
    294896            -8.9%     268662        proc-vmstat.nr_inactive_file
    294799           -59.7%     118883        proc-vmstat.nr_shmem
     17882            -9.0%      16265        proc-vmstat.nr_slab_reclaimable
     84.67 ±223%  +3.7e+06%    3159203        proc-vmstat.nr_written
     19263 ± 18%     -69.9%       5799 ±  2%  proc-vmstat.nr_zone_active_anon
     23809          +934.0%     246183        proc-vmstat.nr_zone_active_file
    391490           -41.3%     229996        proc-vmstat.nr_zone_inactive_anon
    294896            -8.9%     268662        proc-vmstat.nr_zone_inactive_file
      0.91 ±223%  +2.3e+07%     206505        proc-vmstat.nr_zone_write_pending
   2010268           +13.0%    2271060        proc-vmstat.numa_hit
   1985012           +13.1%    2245863        proc-vmstat.numa_local
     21937 ± 12%    +148.8%      54579 ± 19%  proc-vmstat.numa_pte_updates
   2085907           +14.4%    2385806        proc-vmstat.pgalloc_normal
    524059           +68.7%     884340        proc-vmstat.pgfault
   1961741           +16.3%    2281051        proc-vmstat.pgfree
    100706 ± 13%     +48.7%     149726 ±  7%  proc-vmstat.pgpgin
    423.33 ±223%    +3e+06%   12663711        proc-vmstat.pgpgout
     58430          +103.3%     118768        proc-vmstat.pgreuse
    422144          +165.9%    1122304        proc-vmstat.unevictable_pgs_scanned
      2856 ±  2%     +70.9%       4881 ±  9%  sched_debug.cfs_rq:/.avg_vruntime.avg
     16495 ± 23%     +88.0%      31018 ± 17%  sched_debug.cfs_rq:/.avg_vruntime.max
    899.69 ± 19%     +42.9%       1285 ±  8%  sched_debug.cfs_rq:/.avg_vruntime.min
      2466 ± 10%    +122.6%       5491 ± 17%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      4131 ± 93%    +401.5%      20719 ± 24%  sched_debug.cfs_rq:/.load.avg
      2856 ±  2%     +70.9%       4881 ±  9%  sched_debug.cfs_rq:/.min_vruntime.avg
     16495 ± 23%     +88.0%      31018 ± 17%  sched_debug.cfs_rq:/.min_vruntime.max
    899.69 ± 19%     +42.9%       1285 ±  8%  sched_debug.cfs_rq:/.min_vruntime.min
      2466 ± 10%    +122.6%       5491 ± 17%  sched_debug.cfs_rq:/.min_vruntime.stddev
     43.89 ± 50%     -66.6%      14.65 ± 50%  sched_debug.cfs_rq:/.removed.load_avg.avg
      1021           -55.6%     453.56 ± 55%  sched_debug.cfs_rq:/.removed.load_avg.max
    198.74 ± 24%     -60.2%      79.04 ± 52%  sched_debug.cfs_rq:/.removed.load_avg.stddev
    515.33           -55.8%     227.89 ± 55%  sched_debug.cfs_rq:/.removed.runnable_avg.max
     85.73 ± 25%     -54.6%      38.93 ± 51%  sched_debug.cfs_rq:/.removed.runnable_avg.stddev
    515.33           -55.8%     227.89 ± 55%  sched_debug.cfs_rq:/.removed.util_avg.max
     85.73 ± 25%     -54.6%      38.93 ± 51%  sched_debug.cfs_rq:/.removed.util_avg.stddev
    217.84 ± 16%     -59.0%      89.24 ± 18%  sched_debug.cfs_rq:/.runnable_avg.avg
      1112 ± 17%     -31.4%     763.56 ±  8%  sched_debug.cfs_rq:/.runnable_avg.max
    264.40 ± 11%     -37.6%     165.06 ±  9%  sched_debug.cfs_rq:/.runnable_avg.stddev
    217.45 ± 16%     -59.1%      88.98 ± 18%  sched_debug.cfs_rq:/.util_avg.avg
      1112 ± 17%     -31.4%     763.17 ±  8%  sched_debug.cfs_rq:/.util_avg.max
    264.26 ± 11%     -37.6%     164.87 ±  9%  sched_debug.cfs_rq:/.util_avg.stddev
     18.96 ± 24%     -66.2%       6.41 ± 40%  sched_debug.cfs_rq:/.util_est_enqueued.avg
    738.33 ±  7%     -68.6%     231.72 ± 43%  sched_debug.cfs_rq:/.util_est_enqueued.max
     95.58 ±  9%     -63.8%      34.56 ± 43%  sched_debug.cfs_rq:/.util_est_enqueued.stddev
    873182 ±  2%      +9.6%     956657        sched_debug.cpu.avg_idle.avg
     21685 ±188%    +729.4%     179862 ± 77%  sched_debug.cpu.avg_idle.min
    219372 ±  9%     -40.1%     131417 ± 23%  sched_debug.cpu.avg_idle.stddev
     39047          +127.2%      88702        sched_debug.cpu.clock.avg
     39052          +127.2%      88708        sched_debug.cpu.clock.max
     39035          +127.2%      88696        sched_debug.cpu.clock.min
     38907          +123.4%      86914        sched_debug.cpu.clock_task.avg
     39029          +123.9%      87402        sched_debug.cpu.clock_task.max
     33042 ±  2%    +145.3%      81048        sched_debug.cpu.clock_task.min
      2329          +113.1%       4963        sched_debug.cpu.curr->pid.max
    577.69 ±  6%     +17.0%     676.10 ± 14%  sched_debug.cpu.curr->pid.stddev
      0.08 ± 12%     -56.9%       0.04 ± 23%  sched_debug.cpu.nr_running.avg
      0.28 ±  7%     -38.5%       0.17 ± 12%  sched_debug.cpu.nr_running.stddev
      1000          +109.4%       2094 ±  3%  sched_debug.cpu.nr_switches.avg
      6876 ±  3%    +147.6%      17023 ± 18%  sched_debug.cpu.nr_switches.max
    199.00 ±  9%    +140.5%     478.50 ±  4%  sched_debug.cpu.nr_switches.min
      1143 ±  7%    +120.5%       2521 ± 10%  sched_debug.cpu.nr_switches.stddev
      0.11 ± 19%     -55.9%       0.05 ± 18%  sched_debug.cpu.nr_uninterruptible.avg
     39040          +127.2%      88697        sched_debug.cpu_clk
     38362          +129.4%      88018        sched_debug.ktime
     39612          +125.4%      89275        sched_debug.sched_clk
      2.76 ±  2%     +93.7%       5.34        perf-stat.i.MPKI
 5.916e+08           -46.9%  3.143e+08        perf-stat.i.branch-instructions
      6.89 ±  2%      +1.8        8.69        perf-stat.i.branch-miss-rate%
  29892027           -28.5%   21364440        perf-stat.i.branch-misses
      6.08            +0.3        6.35        perf-stat.i.cache-miss-rate%
   4571171 ±  2%      +7.3%    4907108        perf-stat.i.cache-misses
      4.26 ±  2%     +31.7%       5.62        perf-stat.i.cpi
  6.02e+09           -11.8%  5.309e+09        perf-stat.i.cpu-cycles
      1687 ±  2%     -25.1%       1263        perf-stat.i.cycles-between-cache-misses
      0.68 ±  3%      +0.2        0.85        perf-stat.i.dTLB-load-miss-rate%
 6.693e+08           -43.0%  3.817e+08        perf-stat.i.dTLB-loads
      0.11 ±  3%      +0.0        0.15        perf-stat.i.dTLB-store-miss-rate%
    177468 ±  2%      +4.6%     185639        perf-stat.i.dTLB-store-misses
 3.107e+08           -43.0%  1.772e+08        perf-stat.i.dTLB-stores
     71.51            +1.3       72.84        perf-stat.i.iTLB-load-miss-rate%
   1139022           -24.3%     862689        perf-stat.i.iTLB-load-misses
    487409 ±  2%     -30.1%     340931 ±  2%  perf-stat.i.iTLB-loads
 2.875e+09           -46.2%  1.547e+09        perf-stat.i.instructions
      2304           -30.4%       1603        perf-stat.i.instructions-per-iTLB-miss
      0.43           -38.6%       0.27        perf-stat.i.ipc
      1.72 ± 29%     -53.6%       0.80 ±  7%  perf-stat.i.major-faults
      0.06           -11.7%       0.06        perf-stat.i.metric.GHz
      1086 ±  3%     -17.8%     892.84        perf-stat.i.metric.K/sec
     16.08           -43.9%       9.03        perf-stat.i.metric.M/sec
      9502           -44.3%       5291        perf-stat.i.minor-faults
     63.41 ±  3%     -32.8       30.62 ±  2%  perf-stat.i.node-load-miss-rate%
    170802 ±  5%     -42.4%      98305 ±  2%  perf-stat.i.node-load-misses
    124238 ± 11%    +138.8%     296639        perf-stat.i.node-loads
     71001 ±  8%     -31.5%      48603 ± 13%  perf-stat.i.node-store-misses
    687261 ±  3%     -66.2%     232411 ±  2%  perf-stat.i.node-stores
      9504           -44.3%       5291        perf-stat.i.page-faults
      1.59           +99.4%       3.17        perf-stat.overall.MPKI
      5.05            +1.7        6.80        perf-stat.overall.branch-miss-rate%
      5.76            +0.5        6.22        perf-stat.overall.cache-miss-rate%
      2.10           +63.8%       3.43        perf-stat.overall.cpi
      1318 ±  2%     -17.9%       1082        perf-stat.overall.cycles-between-cache-misses
      0.30 ±  2%      +0.2        0.55        perf-stat.overall.dTLB-load-miss-rate%
      0.06 ±  2%      +0.0        0.10        perf-stat.overall.dTLB-store-miss-rate%
     70.04            +1.6       71.68        perf-stat.overall.iTLB-load-miss-rate%
      2520           -28.9%       1792        perf-stat.overall.instructions-per-iTLB-miss
      0.48           -38.9%       0.29        perf-stat.overall.ipc
     57.98 ±  6%     -33.1       24.89 ±  2%  perf-stat.overall.node-load-miss-rate%
      9.38 ±  9%      +7.9       17.29 ± 12%  perf-stat.overall.node-store-miss-rate%
 5.706e+08           -45.4%  3.115e+08        perf-stat.ps.branch-instructions
  28834890           -26.6%   21174096        perf-stat.ps.branch-misses
   4411972 ±  2%     +10.3%    4864521        perf-stat.ps.cache-misses
  76565874            +2.2%   78230800        perf-stat.ps.cache-references
     92772            +2.6%      95201        perf-stat.ps.cpu-clock
 5.814e+09            -9.5%  5.264e+09        perf-stat.ps.cpu-cycles
    103.14            +2.5%     105.71        perf-stat.ps.cpu-migrations
   1929069 ±  3%      +7.9%    2082298        perf-stat.ps.dTLB-load-misses
 6.456e+08           -41.4%  3.784e+08        perf-stat.ps.dTLB-loads
    171457 ±  2%      +7.4%     184089        perf-stat.ps.dTLB-store-misses
 2.998e+08           -41.4%  1.757e+08        perf-stat.ps.dTLB-stores
   1100032           -22.2%     855436        perf-stat.ps.iTLB-load-misses
    470582 ±  2%     -28.2%     338056 ±  2%  perf-stat.ps.iTLB-loads
 2.773e+09           -44.7%  1.533e+09        perf-stat.ps.instructions
      1.66 ± 29%     -52.3%       0.79 ±  7%  perf-stat.ps.major-faults
      9170           -42.8%       5246        perf-stat.ps.minor-faults
    164841 ±  5%     -40.9%      97466 ±  2%  perf-stat.ps.node-load-misses
    119857 ± 11%    +145.4%     294074        perf-stat.ps.node-loads
     68512 ±  8%     -29.7%      48185 ± 13%  perf-stat.ps.node-store-misses
    663053 ±  3%     -65.3%     230289 ±  2%  perf-stat.ps.node-stores
      9172           -42.8%       5246        perf-stat.ps.page-faults
     92772            +2.6%      95201        perf-stat.ps.task-clock
 8.218e+10          +123.6%  1.837e+11        perf-stat.total.instructions
     50.06 ± 37%     -43.5        6.53 ± 16%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
     50.06 ± 37%     -43.5        6.54 ± 16%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
     26.86 ± 38%     -26.9        0.00        perf-profile.calltrace.cycles-pp.do_group_exit.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop.exit_to_user_mode_prepare
     26.86 ± 38%     -26.9        0.00        perf-profile.calltrace.cycles-pp.do_exit.do_group_exit.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop
     25.46 ± 28%     -25.5        0.00        perf-profile.calltrace.cycles-pp.exit_mmap.__mmput.exit_mm.do_exit.do_group_exit
     24.42 ± 37%     -24.4        0.00        perf-profile.calltrace.cycles-pp.exit_mm.do_exit.do_group_exit.get_signal.arch_do_signal_or_restart
     24.42 ± 37%     -24.4        0.00        perf-profile.calltrace.cycles-pp.__mmput.exit_mm.do_exit.do_group_exit.get_signal
     23.66 ± 40%     -23.7        0.00        perf-profile.calltrace.cycles-pp.unmap_vmas.exit_mmap.__mmput.exit_mm.do_exit
     23.66 ± 40%     -23.7        0.00        perf-profile.calltrace.cycles-pp.unmap_page_range.unmap_vmas.exit_mmap.__mmput.exit_mm
     23.66 ± 40%     -23.7        0.00        perf-profile.calltrace.cycles-pp.zap_pmd_range.unmap_page_range.unmap_vmas.exit_mmap.__mmput
     22.38 ± 44%     -22.4        0.00        perf-profile.calltrace.cycles-pp.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_vmas.exit_mmap
     18.62 ± 79%     -18.6        0.00        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
     16.42 ±101%     -16.4        0.00        perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
     16.42 ±101%     -16.4        0.00        perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
     16.42 ±101%     -16.4        0.00        perf-profile.calltrace.cycles-pp.arch_do_signal_or_restart.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
     16.42 ±101%     -16.4        0.00        perf-profile.calltrace.cycles-pp.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
     11.89 ± 58%     -11.9        0.00        perf-profile.calltrace.cycles-pp.tlb_batch_pages_flush.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_vmas
     10.44 ±125%     -10.4        0.00        perf-profile.calltrace.cycles-pp.asm_sysvec_reschedule_ipi
     10.44 ±125%     -10.4        0.00        perf-profile.calltrace.cycles-pp.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
     10.44 ±125%     -10.4        0.00        perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
     10.44 ±125%     -10.4        0.00        perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
     10.44 ±125%     -10.4        0.00        perf-profile.calltrace.cycles-pp.arch_do_signal_or_restart.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
     10.44 ±125%     -10.4        0.00        perf-profile.calltrace.cycles-pp.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode
      9.68 ± 73%      -9.7        0.00        perf-profile.calltrace.cycles-pp.release_pages.tlb_batch_pages_flush.zap_pte_range.zap_pmd_range.unmap_page_range
      9.46 ± 63%      -9.5        0.00        perf-profile.calltrace.cycles-pp.shmem_file_write_iter.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      9.46 ± 63%      -9.5        0.00        perf-profile.calltrace.cycles-pp.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write.do_syscall_64
      8.76 ± 82%      -8.8        0.00        perf-profile.calltrace.cycles-pp.free_unref_page_list.release_pages.tlb_batch_pages_flush.zap_pte_range.zap_pmd_range
      7.19 ±102%      -7.2        0.00        perf-profile.calltrace.cycles-pp._compound_head.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_vmas
      7.07 ± 84%      -7.1        0.00        perf-profile.calltrace.cycles-pp.free_unref_page_commit.free_unref_page_list.release_pages.tlb_batch_pages_flush.zap_pte_range
      6.74 ±116%      -6.7        0.00        perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      6.74 ±116%      -6.7        0.00        perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      6.74 ±116%      -6.7        0.00        perf-profile.calltrace.cycles-pp.proc_reg_read_iter.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      6.74 ±116%      -6.7        0.00        perf-profile.calltrace.cycles-pp.seq_read_iter.proc_reg_read_iter.vfs_read.ksys_read.do_syscall_64
      5.39 ± 84%      -5.4        0.00        perf-profile.calltrace.cycles-pp.free_pcppages_bulk.free_unref_page_commit.free_unref_page_list.release_pages.tlb_batch_pages_flush
      4.82 ± 82%      -4.8        0.00        perf-profile.calltrace.cycles-pp.asm_exc_page_fault.fault_in_readable.fault_in_iov_iter_readable.generic_perform_write.shmem_file_write_iter
      3.89 ± 74%      -3.9        0.00        perf-profile.calltrace.cycles-pp.fault_in_iov_iter_readable.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      3.54 ± 71%      -3.5        0.00        perf-profile.calltrace.cycles-pp.__free_one_page.free_pcppages_bulk.free_unref_page_commit.free_unref_page_list.release_pages
      3.48 ±104%      -3.5        0.00        perf-profile.calltrace.cycles-pp.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      3.25 ±101%      -3.2        0.00        perf-profile.calltrace.cycles-pp.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.25 ±101%      -3.2        0.00        perf-profile.calltrace.cycles-pp.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.25 ±101%      -3.2        0.00        perf-profile.calltrace.cycles-pp.do_filp_open.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.25 ±101%      -3.2        0.00        perf-profile.calltrace.cycles-pp.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat.do_syscall_64
      0.00            +0.6        0.58 ±  7%  perf-profile.calltrace.cycles-pp.irqtime_account_irq.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
      0.00            +0.6        0.62 ± 13%  perf-profile.calltrace.cycles-pp.ct_idle_exit.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      0.00            +0.6        0.63 ±  9%  perf-profile.calltrace.cycles-pp.update_blocked_averages.run_rebalance_domains.__do_softirq.irq_exit_rcu.sysvec_apic_timer_interrupt
      0.00            +0.6        0.64 ±  9%  perf-profile.calltrace.cycles-pp.lapic_next_deadline.clockevents_program_event.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      0.00            +0.7        0.66 ± 21%  perf-profile.calltrace.cycles-pp.ktime_get.tick_irq_enter.irq_enter_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      0.00            +0.7        0.66 ± 11%  perf-profile.calltrace.cycles-pp.cpuidle_governor_latency_req.menu_select.cpuidle_idle_call.do_idle.cpu_startup_entry
      0.00            +0.7        0.67 ±  7%  perf-profile.calltrace.cycles-pp.timerqueue_add.enqueue_hrtimer.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt
      0.00            +0.7        0.68 ±  7%  perf-profile.calltrace.cycles-pp.run_rebalance_domains.__do_softirq.irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      0.00            +0.7        0.69 ±  8%  perf-profile.calltrace.cycles-pp.update_rq_clock_task.scheduler_tick.update_process_times.tick_sched_handle.tick_nohz_highres_handler
      0.00            +0.7        0.73 ±  7%  perf-profile.calltrace.cycles-pp.enqueue_hrtimer.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      0.00            +0.8        0.76 ±  4%  perf-profile.calltrace.cycles-pp.timerqueue_del.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      0.00            +0.8        0.78 ±  8%  perf-profile.calltrace.cycles-pp.update_sd_lb_stats.find_busiest_group.load_balance.rebalance_domains.__do_softirq
      0.00            +0.8        0.82 ±  8%  perf-profile.calltrace.cycles-pp.clockevents_program_event.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      0.00            +0.8        0.85 ±  5%  perf-profile.calltrace.cycles-pp.find_busiest_group.load_balance.rebalance_domains.__do_softirq.irq_exit_rcu
      0.00            +0.9        0.86 ±  7%  perf-profile.calltrace.cycles-pp.rcu_pending.rcu_sched_clock_irq.update_process_times.tick_sched_handle.tick_nohz_highres_handler
      0.00            +1.0        0.95 ± 15%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.rest_init
      0.00            +1.0        1.01 ± 14%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.rest_init.arch_call_rest_init
      0.00            +1.0        1.02 ± 15%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.rest_init.arch_call_rest_init.start_kernel.x86_64_start_reservations
      0.00            +1.0        1.02 ± 15%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.rest_init.arch_call_rest_init.start_kernel
      0.00            +1.0        1.02 ± 15%  perf-profile.calltrace.cycles-pp.x86_64_start_kernel.secondary_startup_64_no_verify
      0.00            +1.0        1.02 ± 15%  perf-profile.calltrace.cycles-pp.x86_64_start_reservations.x86_64_start_kernel.secondary_startup_64_no_verify
      0.00            +1.0        1.02 ± 15%  perf-profile.calltrace.cycles-pp.start_kernel.x86_64_start_reservations.x86_64_start_kernel.secondary_startup_64_no_verify
      0.00            +1.0        1.02 ± 15%  perf-profile.calltrace.cycles-pp.arch_call_rest_init.start_kernel.x86_64_start_reservations.x86_64_start_kernel.secondary_startup_64_no_verify
      0.00            +1.0        1.02 ± 15%  perf-profile.calltrace.cycles-pp.rest_init.arch_call_rest_init.start_kernel.x86_64_start_reservations.x86_64_start_kernel
      0.00            +1.0        1.03 ±  7%  perf-profile.calltrace.cycles-pp.rcu_sched_clock_irq.update_process_times.tick_sched_handle.tick_nohz_highres_handler.__hrtimer_run_queues
      0.00            +1.0        1.05 ± 20%  perf-profile.calltrace.cycles-pp.crc_pcl.crc32c_pcl_intel_digest.btrfs_csum_one_bio.btrfs_submit_chunk.btrfs_submit_bio
      0.00            +1.1        1.06 ± 21%  perf-profile.calltrace.cycles-pp.crc32c_pcl_intel_digest.btrfs_csum_one_bio.btrfs_submit_chunk.btrfs_submit_bio.submit_one_bio
      0.00            +1.1        1.07 ± 21%  perf-profile.calltrace.cycles-pp.btrfs_csum_one_bio.btrfs_submit_chunk.btrfs_submit_bio.submit_one_bio.submit_extent_page
      0.00            +1.1        1.08 ± 21%  perf-profile.calltrace.cycles-pp.btrfs_submit_chunk.btrfs_submit_bio.submit_one_bio.submit_extent_page.__extent_writepage_io
      0.00            +1.1        1.08 ± 21%  perf-profile.calltrace.cycles-pp.submit_one_bio.submit_extent_page.__extent_writepage_io.__extent_writepage.extent_write_cache_pages
      0.00            +1.1        1.08 ± 21%  perf-profile.calltrace.cycles-pp.btrfs_submit_bio.submit_one_bio.submit_extent_page.__extent_writepage_io.__extent_writepage
      0.00            +1.1        1.12 ± 21%  perf-profile.calltrace.cycles-pp.submit_extent_page.__extent_writepage_io.__extent_writepage.extent_write_cache_pages.extent_writepages
      0.00            +1.2        1.21 ±  6%  perf-profile.calltrace.cycles-pp.perf_rotate_context.perf_mux_hrtimer_handler.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt
      0.00            +1.2        1.23 ±  4%  perf-profile.calltrace.cycles-pp.load_balance.rebalance_domains.__do_softirq.irq_exit_rcu.sysvec_apic_timer_interrupt
      0.00            +1.2        1.24 ±  5%  perf-profile.calltrace.cycles-pp.tick_nohz_next_event.tick_nohz_get_sleep_length.menu_select.cpuidle_idle_call.do_idle
      0.00            +1.5        1.54 ± 21%  perf-profile.calltrace.cycles-pp.__extent_writepage_io.__extent_writepage.extent_write_cache_pages.extent_writepages.do_writepages
      0.00            +1.7        1.69 ±  5%  perf-profile.calltrace.cycles-pp.perf_mux_hrtimer_handler.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      0.00            +1.7        1.70 ±  4%  perf-profile.calltrace.cycles-pp.rebalance_domains.__do_softirq.irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      0.00            +1.8        1.84 ± 18%  perf-profile.calltrace.cycles-pp.__extent_writepage.extent_write_cache_pages.extent_writepages.do_writepages.filemap_fdatawrite_wbc
      0.00            +1.9        1.86 ±  8%  perf-profile.calltrace.cycles-pp.tick_irq_enter.irq_enter_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
      0.00            +1.9        1.91 ±  8%  perf-profile.calltrace.cycles-pp.irq_enter_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
      0.00            +1.9        1.94 ±  3%  perf-profile.calltrace.cycles-pp.tick_nohz_get_sleep_length.menu_select.cpuidle_idle_call.do_idle.cpu_startup_entry
      0.00            +2.0        2.04 ± 18%  perf-profile.calltrace.cycles-pp.extent_write_cache_pages.extent_writepages.do_writepages.filemap_fdatawrite_wbc.__filemap_fdatawrite_range
      0.00            +2.0        2.05 ± 18%  perf-profile.calltrace.cycles-pp.start_ordered_ops.btrfs_sync_file.__x64_sys_fsync.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +2.0        2.05 ± 18%  perf-profile.calltrace.cycles-pp.__filemap_fdatawrite_range.start_ordered_ops.btrfs_sync_file.__x64_sys_fsync.do_syscall_64
      0.00            +2.0        2.05 ± 18%  perf-profile.calltrace.cycles-pp.filemap_fdatawrite_wbc.__filemap_fdatawrite_range.start_ordered_ops.btrfs_sync_file.__x64_sys_fsync
      0.00            +2.0        2.05 ± 18%  perf-profile.calltrace.cycles-pp.do_writepages.filemap_fdatawrite_wbc.__filemap_fdatawrite_range.start_ordered_ops.btrfs_sync_file
      0.00            +2.0        2.05 ± 18%  perf-profile.calltrace.cycles-pp.extent_writepages.do_writepages.filemap_fdatawrite_wbc.__filemap_fdatawrite_range.start_ordered_ops
      0.00            +2.0        2.05 ± 19%  perf-profile.calltrace.cycles-pp.rep_movs_alternative.copy_page_from_iter_atomic.btrfs_copy_from_user.btrfs_buffered_write.btrfs_do_write_iter
      0.00            +2.1        2.09 ± 18%  perf-profile.calltrace.cycles-pp.__x64_sys_fsync.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +2.1        2.09 ± 18%  perf-profile.calltrace.cycles-pp.btrfs_sync_file.__x64_sys_fsync.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +2.1        2.10 ± 19%  perf-profile.calltrace.cycles-pp.copy_page_from_iter_atomic.btrfs_copy_from_user.btrfs_buffered_write.btrfs_do_write_iter.vfs_write
      0.00            +2.1        2.12 ± 19%  perf-profile.calltrace.cycles-pp.btrfs_copy_from_user.btrfs_buffered_write.btrfs_do_write_iter.vfs_write.ksys_write
      0.00            +2.7        2.71 ±  4%  perf-profile.calltrace.cycles-pp.__do_softirq.irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
      0.00            +3.1        3.10 ±  3%  perf-profile.calltrace.cycles-pp.scheduler_tick.update_process_times.tick_sched_handle.tick_nohz_highres_handler.__hrtimer_run_queues
      0.00            +3.2        3.20 ±  3%  perf-profile.calltrace.cycles-pp.irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
      0.00            +3.3        3.31 ± 19%  perf-profile.calltrace.cycles-pp.btrfs_do_write_iter.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +3.3        3.31 ± 19%  perf-profile.calltrace.cycles-pp.btrfs_buffered_write.btrfs_do_write_iter.vfs_write.ksys_write.do_syscall_64
      0.00            +4.2        4.16 ±  4%  perf-profile.calltrace.cycles-pp.menu_select.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
      0.93 ±223%      +5.3        6.22 ±  4%  perf-profile.calltrace.cycles-pp.tick_sched_handle.tick_nohz_highres_handler.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt
      0.00            +5.6        5.57 ±  4%  perf-profile.calltrace.cycles-pp.update_process_times.tick_sched_handle.tick_nohz_highres_handler.__hrtimer_run_queues.hrtimer_interrupt
      0.93 ±223%      +6.2        7.13 ±  2%  perf-profile.calltrace.cycles-pp.tick_nohz_highres_handler.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      1.85 ±141%      +9.3       11.15 ±  2%  perf-profile.calltrace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      0.93 ±223%     +12.5       13.40 ±  2%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
      0.93 ±223%     +12.7       13.66 ±  2%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
      0.93 ±223%     +19.5       20.44 ±  2%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      0.93 ±223%     +22.6       23.52 ±  2%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
     33.05 ± 31%     +26.6       59.64        perf-profile.calltrace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
     33.98 ± 35%     +50.3       84.32        perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
     33.98 ± 35%     +51.0       85.03        perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
     35.26 ± 36%     +55.3       90.54        perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     35.26 ± 36%     +56.5       91.74        perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     35.26 ± 36%     +56.5       91.79        perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     35.26 ± 36%     +56.5       91.79        perf-profile.calltrace.cycles-pp.start_secondary.secondary_startup_64_no_verify
     35.26 ± 36%     +57.5       92.81        perf-profile.calltrace.cycles-pp.secondary_startup_64_no_verify
     50.06 ± 37%     -43.5        6.53 ± 16%  perf-profile.children.cycles-pp.do_syscall_64
     50.06 ± 37%     -43.5        6.54 ± 16%  perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     27.90 ± 30%     -27.8        0.08 ± 13%  perf-profile.children.cycles-pp.do_group_exit
     27.90 ± 30%     -27.8        0.08 ± 13%  perf-profile.children.cycles-pp.do_exit
     26.86 ± 38%     -26.9        0.00        perf-profile.children.cycles-pp.exit_to_user_mode_prepare
     26.86 ± 38%     -26.9        0.00        perf-profile.children.cycles-pp.exit_to_user_mode_loop
     26.86 ± 38%     -26.9        0.00        perf-profile.children.cycles-pp.arch_do_signal_or_restart
     26.86 ± 38%     -26.9        0.00        perf-profile.children.cycles-pp.get_signal
     25.46 ± 28%     -25.4        0.05 ± 46%  perf-profile.children.cycles-pp.exit_mm
     25.46 ± 28%     -25.3        0.18 ± 11%  perf-profile.children.cycles-pp.__mmput
     25.46 ± 28%     -25.3        0.18 ± 11%  perf-profile.children.cycles-pp.exit_mmap
     23.66 ± 40%     -23.6        0.08 ± 17%  perf-profile.children.cycles-pp.zap_pte_range
     23.66 ± 40%     -23.6        0.08 ± 20%  perf-profile.children.cycles-pp.unmap_page_range
     23.66 ± 40%     -23.6        0.08 ± 20%  perf-profile.children.cycles-pp.zap_pmd_range
     23.66 ± 40%     -23.6        0.08 ± 22%  perf-profile.children.cycles-pp.unmap_vmas
     12.93 ± 41%     -12.9        0.00        perf-profile.children.cycles-pp.tlb_batch_pages_flush
     10.44 ±125%     -10.4        0.00        perf-profile.children.cycles-pp.asm_sysvec_reschedule_ipi
      9.46 ± 63%      -9.5        0.00        perf-profile.children.cycles-pp.shmem_file_write_iter
      9.46 ± 63%      -9.5        0.00        perf-profile.children.cycles-pp.generic_perform_write
      8.76 ± 82%      -8.8        0.00        perf-profile.children.cycles-pp.free_unref_page_list
      7.07 ± 84%      -7.1        0.00        perf-profile.children.cycles-pp.free_unref_page_commit
      6.74 ±116%      -6.7        0.00        perf-profile.children.cycles-pp.proc_reg_read_iter
      6.62 ± 20%      -6.3        0.35 ± 16%  perf-profile.children.cycles-pp.asm_exc_page_fault
      5.91 ±109%      -5.9        0.00        perf-profile.children.cycles-pp._compound_head
      5.39 ± 84%      -5.4        0.00        perf-profile.children.cycles-pp.free_pcppages_bulk
      3.89 ± 74%      -3.9        0.00        perf-profile.children.cycles-pp.fault_in_iov_iter_readable
      3.89 ± 74%      -3.9        0.00        perf-profile.children.cycles-pp.fault_in_readable
      3.54 ± 71%      -3.5        0.00        perf-profile.children.cycles-pp.__free_one_page
      0.00            +0.1        0.06 ±  7%  perf-profile.children.cycles-pp.update_group_capacity
      0.00            +0.1        0.07 ± 23%  perf-profile.children.cycles-pp.filemap_get_folios_contig
      0.00            +0.1        0.08 ± 29%  perf-profile.children.cycles-pp.error_return
      0.00            +0.1        0.08 ± 35%  perf-profile.children.cycles-pp.nohz_balancer_kick
      0.00            +0.1        0.08 ± 23%  perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
      0.00            +0.1        0.08 ± 16%  perf-profile.children.cycles-pp.update_dl_rq_load_avg
      0.00            +0.1        0.08 ± 22%  perf-profile.children.cycles-pp.process_one_work
      0.00            +0.1        0.08 ±  8%  perf-profile.children.cycles-pp.__mod_node_page_state
      0.00            +0.1        0.09 ± 13%  perf-profile.children.cycles-pp.tick_check_broadcast_expired
      0.00            +0.1        0.09 ± 34%  perf-profile.children.cycles-pp.rcu_needs_cpu
      0.00            +0.1        0.09 ± 15%  perf-profile.children.cycles-pp.ct_idle_enter
      0.00            +0.1        0.09 ± 11%  perf-profile.children.cycles-pp.__mod_lruvec_state
      0.00            +0.1        0.10 ± 31%  perf-profile.children.cycles-pp.rcu_core
      0.00            +0.1        0.10 ± 18%  perf-profile.children.cycles-pp.hrtimer_forward
      0.00            +0.1        0.10 ± 23%  perf-profile.children.cycles-pp.intel_pmu_disable_all
      0.00            +0.1        0.10 ± 24%  perf-profile.children.cycles-pp.dup_mmap
      0.00            +0.1        0.10 ± 24%  perf-profile.children.cycles-pp.worker_thread
      0.00            +0.1        0.10 ± 26%  perf-profile.children.cycles-pp.percpu_counter_add_batch
      0.00            +0.1        0.11 ± 24%  perf-profile.children.cycles-pp.folio_account_dirtied
      0.00            +0.1        0.12 ± 14%  perf-profile.children.cycles-pp.dup_mm
      0.00            +0.1        0.12 ± 19%  perf-profile.children.cycles-pp.restore_regs_and_return_to_kernel
      0.00            +0.1        0.12 ± 10%  perf-profile.children.cycles-pp.rcu_preempt_deferred_qs
      0.00            +0.1        0.12 ± 17%  perf-profile.children.cycles-pp.perf_adjust_freq_unthr_context
      0.00            +0.1        0.13 ± 18%  perf-profile.children.cycles-pp.ct_nmi_exit
      0.00            +0.1        0.13 ± 25%  perf-profile.children.cycles-pp._find_next_and_bit
      0.00            +0.1        0.13 ± 24%  perf-profile.children.cycles-pp.folio_clear_dirty_for_io
      0.00            +0.1        0.13 ± 30%  perf-profile.children.cycles-pp.task_tick_idle
      0.00            +0.1        0.14 ± 10%  perf-profile.children.cycles-pp.copy_process
      0.00            +0.1        0.14 ± 14%  perf-profile.children.cycles-pp.ct_irq_enter
      0.00            +0.1        0.14 ± 28%  perf-profile.children.cycles-pp.cpuidle_reflect
      0.00            +0.1        0.14 ± 15%  perf-profile.children.cycles-pp.sched_clock_noinstr
      0.00            +0.1        0.14 ± 12%  perf-profile.children.cycles-pp.exec_mmap
      0.00            +0.1        0.14 ± 11%  perf-profile.children.cycles-pp.__do_sys_clone
      0.00            +0.1        0.14 ± 11%  perf-profile.children.cycles-pp.kernel_clone
      0.00            +0.1        0.14 ± 17%  perf-profile.children.cycles-pp.trigger_load_balance
      0.00            +0.1        0.15 ± 29%  perf-profile.children.cycles-pp.account_process_tick
      0.00            +0.2        0.15 ± 18%  perf-profile.children.cycles-pp.xas_descend
      0.00            +0.2        0.15 ±  9%  perf-profile.children.cycles-pp.begin_new_exec
      0.00            +0.2        0.15 ± 14%  perf-profile.children.cycles-pp.should_we_balance
      0.00            +0.2        0.16 ± 22%  perf-profile.children.cycles-pp.hrtimer_get_next_event
      0.00            +0.2        0.16 ± 21%  perf-profile.children.cycles-pp.find_lock_delalloc_range
      0.00            +0.2        0.16 ± 14%  perf-profile.children.cycles-pp.update_rq_clock
      0.00            +0.2        0.17 ± 17%  perf-profile.children.cycles-pp.tick_nohz_tick_stopped
      0.00            +0.2        0.17 ± 32%  perf-profile.children.cycles-pp.folio_activate_fn
      0.00            +0.2        0.17 ± 24%  perf-profile.children.cycles-pp.check_tsc_unstable
      0.00            +0.2        0.17 ± 19%  perf-profile.children.cycles-pp.rcu_nocb_flush_deferred_wakeup
      0.00            +0.2        0.17 ± 32%  perf-profile.children.cycles-pp.ct_nmi_enter
      0.00            +0.2        0.18 ±  9%  perf-profile.children.cycles-pp.menu_reflect
      0.00            +0.2        0.18 ± 15%  perf-profile.children.cycles-pp.irqentry_exit
      0.00            +0.2        0.18 ± 12%  perf-profile.children.cycles-pp.error_entry
      0.00            +0.2        0.18 ± 17%  perf-profile.children.cycles-pp.idle_cpu
      0.00            +0.2        0.20 ±  8%  perf-profile.children.cycles-pp.irq_work_needs_cpu
      0.00            +0.2        0.20 ± 19%  perf-profile.children.cycles-pp.native_apic_mem_eoi
      0.00            +0.2        0.20 ± 21%  perf-profile.children.cycles-pp.cpuidle_not_available
      0.00            +0.2        0.20 ± 21%  perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      0.00            +0.2        0.20 ± 29%  perf-profile.children.cycles-pp.tick_nohz_irq_exit
      0.00            +0.2        0.21 ± 19%  perf-profile.children.cycles-pp.__folio_start_writeback
      0.00            +0.2        0.22 ± 20%  perf-profile.children.cycles-pp.filemap_get_entry
      0.00            +0.2        0.22 ± 12%  perf-profile.children.cycles-pp.task_tick_mm_cid
      0.00            +0.2        0.22 ± 12%  perf-profile.children.cycles-pp.timekeeping_max_deferment
      0.00            +0.2        0.22 ± 19%  perf-profile.children.cycles-pp._raw_spin_trylock
      0.00            +0.2        0.23 ± 22%  perf-profile.children.cycles-pp.leave_mm
      0.00            +0.2        0.23 ±  7%  perf-profile.children.cycles-pp.irq_work_tick
      0.00            +0.2        0.24 ± 22%  perf-profile.children.cycles-pp.__folio_end_writeback
      0.00            +0.2        0.24 ± 12%  perf-profile.children.cycles-pp.ct_kernel_exit
      0.00            +0.2        0.24 ± 27%  perf-profile.children.cycles-pp.pm_qos_read_value
      0.00            +0.2        0.24 ± 19%  perf-profile.children.cycles-pp.x86_pmu_disable
      0.00            +0.2        0.24 ± 18%  perf-profile.children.cycles-pp.get_cpu_device
      0.00            +0.2        0.25 ± 16%  perf-profile.children.cycles-pp.ct_kernel_exit_state
      0.00            +0.3        0.26 ± 14%  perf-profile.children.cycles-pp.__update_blocked_fair
      0.00            +0.3        0.26 ± 15%  perf-profile.children.cycles-pp.writepage_delalloc
      0.00            +0.3        0.27 ± 16%  perf-profile.children.cycles-pp.xas_load
      0.00            +0.3        0.29 ± 12%  perf-profile.children.cycles-pp.folio_end_writeback
      0.00            +0.3        0.29 ± 22%  perf-profile.children.cycles-pp.__folio_mark_dirty
      0.00            +0.3        0.30 ± 33%  perf-profile.children.cycles-pp.folio_activate
      0.00            +0.3        0.30 ± 12%  perf-profile.children.cycles-pp.rb_insert_color
      0.00            +0.3        0.30 ± 25%  perf-profile.children.cycles-pp.calc_global_load_tick
      0.00            +0.3        0.30 ± 18%  perf-profile.children.cycles-pp.btrfs_set_range_writeback
      0.00            +0.3        0.30 ± 15%  perf-profile.children.cycles-pp.perf_event_task_tick
      0.00            +0.3        0.33 ±  5%  perf-profile.children.cycles-pp.nr_iowait_cpu
      0.00            +0.4        0.35 ±  5%  perf-profile.children.cycles-pp.rb_erase
      0.00            +0.4        0.35 ±  8%  perf-profile.children.cycles-pp.rb_next
      0.00            +0.4        0.36 ± 15%  perf-profile.children.cycles-pp.irqtime_account_process_tick
      0.00            +0.4        0.37 ± 13%  perf-profile.children.cycles-pp.blk_update_request
      0.00            +0.4        0.37 ± 13%  perf-profile.children.cycles-pp.__btrfs_bio_end_io
      0.00            +0.4        0.37 ± 13%  perf-profile.children.cycles-pp.end_bio_extent_writepage
      0.00            +0.4        0.38 ± 13%  perf-profile.children.cycles-pp.scsi_io_completion
      0.00            +0.4        0.38 ± 13%  perf-profile.children.cycles-pp.scsi_end_request
      0.00            +0.4        0.38 ± 13%  perf-profile.children.cycles-pp.blk_complete_reqs
      0.00            +0.4        0.38 ± 21%  perf-profile.children.cycles-pp.filemap_dirty_folio
      0.00            +0.4        0.39 ± 13%  perf-profile.children.cycles-pp.check_cpu_stall
      0.00            +0.4        0.40 ± 19%  perf-profile.children.cycles-pp.ct_kernel_enter
      0.00            +0.4        0.42 ± 30%  perf-profile.children.cycles-pp.tick_sched_do_timer
      0.00            +0.4        0.42 ± 12%  perf-profile.children.cycles-pp.tsc_verify_tsc_adjust
      0.00            +0.4        0.42 ± 27%  perf-profile.children.cycles-pp.folio_mark_accessed
      0.00            +0.4        0.42 ±  6%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      0.00            +0.4        0.43 ± 14%  perf-profile.children.cycles-pp.__intel_pmu_enable_all
      0.00            +0.4        0.43 ±  8%  perf-profile.children.cycles-pp.ktime_get_update_offsets_now
      0.00            +0.4        0.43 ± 11%  perf-profile.children.cycles-pp.arch_cpu_idle_enter
      0.00            +0.4        0.44 ± 17%  perf-profile.children.cycles-pp.irqentry_enter
      0.00            +0.5        0.46 ± 10%  perf-profile.children.cycles-pp.tick_nohz_stop_idle
      0.00            +0.5        0.46 ± 17%  perf-profile.children.cycles-pp.get_next_timer_interrupt
      0.00            +0.5        0.47 ± 19%  perf-profile.children.cycles-pp.btrfs_dirty_pages
      0.00            +0.5        0.48 ± 17%  perf-profile.children.cycles-pp.hrtimer_update_next_event
      0.00            +0.5        0.48 ±  7%  perf-profile.children.cycles-pp.native_irq_return_iret
      0.00            +0.5        0.51 ±  8%  perf-profile.children.cycles-pp.local_clock_noinstr
      0.00            +0.5        0.51 ± 10%  perf-profile.children.cycles-pp.hrtimer_next_event_without
      0.00            +0.5        0.53 ±  8%  perf-profile.children.cycles-pp.sched_clock
      0.00            +0.6        0.55 ±  5%  perf-profile.children.cycles-pp.update_irq_load_avg
      0.00            +0.6        0.55 ± 10%  perf-profile.children.cycles-pp.tick_check_oneshot_broadcast_this_cpu
      0.00            +0.6        0.56 ± 14%  perf-profile.children.cycles-pp.read_tsc
      0.00            +0.6        0.56 ± 15%  perf-profile.children.cycles-pp._raw_spin_lock
      0.00            +0.6        0.61 ±  6%  perf-profile.children.cycles-pp.__hrtimer_next_event_base
      0.00            +0.6        0.62 ± 26%  perf-profile.children.cycles-pp.prepare_pages
      0.00            +0.6        0.63 ± 13%  perf-profile.children.cycles-pp.ct_idle_exit
      0.00            +0.6        0.64 ± 10%  perf-profile.children.cycles-pp.update_blocked_averages
      0.00            +0.7        0.66 ±  9%  perf-profile.children.cycles-pp.lapic_next_deadline
      0.00            +0.7        0.67 ± 12%  perf-profile.children.cycles-pp.cpuidle_governor_latency_req
      0.00            +0.7        0.68 ± 24%  perf-profile.children.cycles-pp.__filemap_get_folio
      0.00            +0.7        0.68 ±  7%  perf-profile.children.cycles-pp.run_rebalance_domains
      0.00            +0.7        0.68 ± 25%  perf-profile.children.cycles-pp.pagecache_get_page
      0.00            +0.7        0.69 ±  7%  perf-profile.children.cycles-pp.timerqueue_add
      0.00            +0.7        0.69 ±  4%  perf-profile.children.cycles-pp.native_sched_clock
      0.00            +0.7        0.69 ±  5%  perf-profile.children.cycles-pp.sched_clock_cpu
      0.00            +0.7        0.74 ±  7%  perf-profile.children.cycles-pp.enqueue_hrtimer
      0.00            +0.8        0.75 ±  7%  perf-profile.children.cycles-pp.update_rq_clock_task
      0.00            +0.8        0.76 ± 17%  perf-profile.children.cycles-pp.arch_scale_freq_tick
      0.00            +0.8        0.78 ±  4%  perf-profile.children.cycles-pp.timerqueue_del
      0.00            +0.9        0.86 ±  8%  perf-profile.children.cycles-pp.clockevents_program_event
      0.00            +0.9        0.87 ±  7%  perf-profile.children.cycles-pp.rcu_pending
      0.00            +0.9        0.93 ±  5%  perf-profile.children.cycles-pp.irqtime_account_irq
      0.00            +1.0        1.02 ± 15%  perf-profile.children.cycles-pp.x86_64_start_kernel
      0.00            +1.0        1.02 ± 15%  perf-profile.children.cycles-pp.x86_64_start_reservations
      0.00            +1.0        1.02 ± 15%  perf-profile.children.cycles-pp.start_kernel
      0.00            +1.0        1.02 ± 15%  perf-profile.children.cycles-pp.arch_call_rest_init
      0.00            +1.0        1.02 ± 15%  perf-profile.children.cycles-pp.rest_init
      0.00            +1.0        1.05 ±  8%  perf-profile.children.cycles-pp.rcu_sched_clock_irq
      0.00            +1.1        1.05 ± 20%  perf-profile.children.cycles-pp.crc_pcl
      0.00            +1.1        1.06 ± 21%  perf-profile.children.cycles-pp.crc32c_pcl_intel_digest
      0.00            +1.1        1.08 ± 21%  perf-profile.children.cycles-pp.btrfs_csum_one_bio
      0.00            +1.1        1.08 ± 21%  perf-profile.children.cycles-pp.btrfs_submit_chunk
      0.00            +1.1        1.08 ± 21%  perf-profile.children.cycles-pp.submit_one_bio
      0.00            +1.1        1.08 ± 21%  perf-profile.children.cycles-pp.btrfs_submit_bio
      0.00            +1.1        1.12 ± 21%  perf-profile.children.cycles-pp.submit_extent_page
      0.00            +1.2        1.23 ±  7%  perf-profile.children.cycles-pp.perf_rotate_context
      0.00            +1.3        1.32 ±  5%  perf-profile.children.cycles-pp.tick_nohz_next_event
      0.00            +1.3        1.35 ± 11%  perf-profile.children.cycles-pp.ktime_get
      0.00            +1.5        1.55 ± 21%  perf-profile.children.cycles-pp.__extent_writepage_io
      0.00            +1.7        1.73 ±  5%  perf-profile.children.cycles-pp.perf_mux_hrtimer_handler
      0.00            +1.7        1.73 ±  4%  perf-profile.children.cycles-pp.rebalance_domains
      0.00            +1.8        1.84 ± 18%  perf-profile.children.cycles-pp.__extent_writepage
      0.00            +1.9        1.91 ±  8%  perf-profile.children.cycles-pp.tick_irq_enter
      0.00            +1.9        1.93 ±  8%  perf-profile.children.cycles-pp.irq_enter_rcu
      0.00            +2.0        1.99 ±  3%  perf-profile.children.cycles-pp.tick_nohz_get_sleep_length
      0.00            +2.0        2.05 ± 18%  perf-profile.children.cycles-pp.start_ordered_ops
      0.00            +2.0        2.05 ± 18%  perf-profile.children.cycles-pp.extent_writepages
      0.00            +2.0        2.05 ± 18%  perf-profile.children.cycles-pp.extent_write_cache_pages
      0.00            +2.1        2.05 ± 18%  perf-profile.children.cycles-pp.__filemap_fdatawrite_range
      0.00            +2.1        2.05 ± 18%  perf-profile.children.cycles-pp.filemap_fdatawrite_wbc
      0.00            +2.1        2.05 ± 18%  perf-profile.children.cycles-pp.do_writepages
      0.00            +2.1        2.09 ± 18%  perf-profile.children.cycles-pp.__x64_sys_fsync
      0.00            +2.1        2.09 ± 18%  perf-profile.children.cycles-pp.btrfs_sync_file
      0.00            +2.1        2.12 ± 19%  perf-profile.children.cycles-pp.btrfs_copy_from_user
      0.00            +3.1        3.12 ±  4%  perf-profile.children.cycles-pp.__do_softirq
      0.00            +3.2        3.19 ±  3%  perf-profile.children.cycles-pp.scheduler_tick
      0.00            +3.3        3.31 ± 19%  perf-profile.children.cycles-pp.btrfs_do_write_iter
      0.00            +3.3        3.31 ± 19%  perf-profile.children.cycles-pp.btrfs_buffered_write
      0.00            +3.5        3.45 ±  7%  perf-profile.children.cycles-pp.irq_exit_rcu
      0.00            +4.2        4.24 ±  5%  perf-profile.children.cycles-pp.menu_select
      0.93 ±223%      +5.4        6.33 ±  4%  perf-profile.children.cycles-pp.tick_sched_handle
      0.00            +5.7        5.74 ±  4%  perf-profile.children.cycles-pp.update_process_times
      0.93 ±223%      +6.4        7.29 ±  2%  perf-profile.children.cycles-pp.tick_nohz_highres_handler
      1.85 ±141%      +9.6       11.41 ±  2%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      1.85 ±141%     +11.8       13.65 ±  2%  perf-profile.children.cycles-pp.hrtimer_interrupt
      1.85 ±141%     +12.0       13.89 ±  2%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      1.85 ±141%     +18.9       20.76 ±  2%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      1.85 ±141%     +20.7       22.52 ±  2%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
     33.05 ± 31%     +26.7       59.72        perf-profile.children.cycles-pp.intel_idle
     33.98 ± 35%     +51.8       85.79        perf-profile.children.cycles-pp.cpuidle_enter_state
     33.98 ± 35%     +52.0       85.98        perf-profile.children.cycles-pp.cpuidle_enter
     35.26 ± 36%     +56.4       91.64        perf-profile.children.cycles-pp.cpuidle_idle_call
     35.26 ± 36%     +56.5       91.79        perf-profile.children.cycles-pp.start_secondary
     35.26 ± 36%     +57.5       92.80        perf-profile.children.cycles-pp.do_idle
     35.26 ± 36%     +57.5       92.81        perf-profile.children.cycles-pp.secondary_startup_64_no_verify
     35.26 ± 36%     +57.5       92.81        perf-profile.children.cycles-pp.cpu_startup_entry
      3.54 ± 71%      -3.5        0.00        perf-profile.self.cycles-pp.__free_one_page
      3.25 ±101%      -3.2        0.02 ±142%  perf-profile.self.cycles-pp.zap_pte_range
      0.00            +0.1        0.05 ±  7%  perf-profile.self.cycles-pp.update_group_capacity
      0.00            +0.1        0.06 ± 19%  perf-profile.self.cycles-pp.ct_idle_enter
      0.00            +0.1        0.07 ± 29%  perf-profile.self.cycles-pp.folio_clear_dirty_for_io
      0.00            +0.1        0.07 ± 34%  perf-profile.self.cycles-pp.nohz_balancer_kick
      0.00            +0.1        0.08 ± 22%  perf-profile.self.cycles-pp.hrtimer_forward
      0.00            +0.1        0.08 ± 10%  perf-profile.self.cycles-pp.__mod_node_page_state
      0.00            +0.1        0.08 ± 23%  perf-profile.self.cycles-pp.__update_load_avg_cfs_rq
      0.00            +0.1        0.08 ± 29%  perf-profile.self.cycles-pp.hrtimer_next_event_without
      0.00            +0.1        0.08 ± 16%  perf-profile.self.cycles-pp.update_dl_rq_load_avg
      0.00            +0.1        0.09 ± 10%  perf-profile.self.cycles-pp.tick_check_broadcast_expired
      0.00            +0.1        0.09 ± 35%  perf-profile.self.cycles-pp.update_blocked_averages
      0.00            +0.1        0.09 ± 37%  perf-profile.self.cycles-pp.local_clock_noinstr
      0.00            +0.1        0.09 ± 34%  perf-profile.self.cycles-pp.rcu_needs_cpu
      0.00            +0.1        0.09 ± 30%  perf-profile.self.cycles-pp.xas_load
      0.00            +0.1        0.09 ± 11%  perf-profile.self.cycles-pp.ct_irq_enter
      0.00            +0.1        0.10 ± 21%  perf-profile.self.cycles-pp.tick_nohz_tick_stopped
      0.00            +0.1        0.10 ± 23%  perf-profile.self.cycles-pp.intel_pmu_disable_all
      0.00            +0.1        0.10 ± 18%  perf-profile.self.cycles-pp.tick_nohz_irq_exit
      0.00            +0.1        0.10 ± 25%  perf-profile.self.cycles-pp.sched_clock_noinstr
      0.00            +0.1        0.10 ± 23%  perf-profile.self.cycles-pp.clockevents_program_event
      0.00            +0.1        0.10 ± 23%  perf-profile.self.cycles-pp.__do_softirq
      0.00            +0.1        0.11 ± 30%  perf-profile.self.cycles-pp.ct_kernel_exit
      0.00            +0.1        0.12 ± 20%  perf-profile.self.cycles-pp.restore_regs_and_return_to_kernel
      0.00            +0.1        0.12 ± 20%  perf-profile.self.cycles-pp.ct_nmi_exit
      0.00            +0.1        0.12 ± 25%  perf-profile.self.cycles-pp.ct_idle_exit
      0.00            +0.1        0.12 ± 10%  perf-profile.self.cycles-pp.rcu_preempt_deferred_qs
      0.00            +0.1        0.12 ± 18%  perf-profile.self.cycles-pp.trigger_load_balance
      0.00            +0.1        0.12 ± 33%  perf-profile.self.cycles-pp.cpuidle_reflect
      0.00            +0.1        0.12 ± 17%  perf-profile.self.cycles-pp.perf_adjust_freq_unthr_context
      0.00            +0.1        0.13 ± 25%  perf-profile.self.cycles-pp._find_next_and_bit
      0.00            +0.1        0.13 ± 30%  perf-profile.self.cycles-pp.task_tick_idle
      0.00            +0.1        0.13 ± 21%  perf-profile.self.cycles-pp.filemap_get_entry
      0.00            +0.1        0.14 ± 35%  perf-profile.self.cycles-pp.account_process_tick
      0.00            +0.1        0.14 ± 15%  perf-profile.self.cycles-pp.xas_descend
      0.00            +0.1        0.14 ± 19%  perf-profile.self.cycles-pp.tick_nohz_stop_idle
      0.00            +0.1        0.14 ± 16%  perf-profile.self.cycles-pp.tick_nohz_get_sleep_length
      0.00            +0.2        0.15 ± 13%  perf-profile.self.cycles-pp.sched_clock
      0.00            +0.2        0.15 ± 31%  perf-profile.self.cycles-pp.rcu_sched_clock_irq
      0.00            +0.2        0.15 ± 26%  perf-profile.self.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.00            +0.2        0.16 ± 16%  perf-profile.self.cycles-pp.irq_exit_rcu
      0.00            +0.2        0.16 ± 25%  perf-profile.self.cycles-pp.check_tsc_unstable
      0.00            +0.2        0.16 ± 15%  perf-profile.self.cycles-pp.menu_reflect
      0.00            +0.2        0.16 ± 15%  perf-profile.self.cycles-pp.timerqueue_del
      0.00            +0.2        0.16 ± 12%  perf-profile.self.cycles-pp.perf_mux_hrtimer_handler
      0.00            +0.2        0.17 ± 17%  perf-profile.self.cycles-pp.rcu_nocb_flush_deferred_wakeup
      0.00            +0.2        0.17 ± 33%  perf-profile.self.cycles-pp.ct_nmi_enter
      0.00            +0.2        0.17 ± 26%  perf-profile.self.cycles-pp.__update_blocked_fair
      0.00            +0.2        0.18 ±  7%  perf-profile.self.cycles-pp.irq_work_needs_cpu
      0.00            +0.2        0.18 ± 16%  perf-profile.self.cycles-pp.sched_clock_cpu
      0.00            +0.2        0.18 ± 20%  perf-profile.self.cycles-pp.irqentry_enter
      0.00            +0.2        0.18 ± 14%  perf-profile.self.cycles-pp.error_entry
      0.00            +0.2        0.18 ± 19%  perf-profile.self.cycles-pp.timekeeping_max_deferment
      0.00            +0.2        0.18 ± 20%  perf-profile.self.cycles-pp.idle_cpu
      0.00            +0.2        0.18 ± 16%  perf-profile.self.cycles-pp.perf_event_task_tick
      0.00            +0.2        0.18 ± 12%  perf-profile.self.cycles-pp.cpuidle_governor_latency_req
      0.00            +0.2        0.18 ±  6%  perf-profile.self.cycles-pp.cpuidle_enter
      0.00            +0.2        0.19 ± 21%  perf-profile.self.cycles-pp._raw_spin_unlock_irqrestore
      0.00            +0.2        0.19 ± 20%  perf-profile.self.cycles-pp.cpuidle_not_available
      0.00            +0.2        0.19 ± 14%  perf-profile.self.cycles-pp.update_sd_lb_stats
      0.00            +0.2        0.19 ± 23%  perf-profile.self.cycles-pp.hrtimer_update_next_event
      0.00            +0.2        0.20 ± 19%  perf-profile.self.cycles-pp.native_apic_mem_eoi
      0.00            +0.2        0.20 ± 23%  perf-profile.self.cycles-pp.get_next_timer_interrupt
      0.00            +0.2        0.20 ± 11%  perf-profile.self.cycles-pp.do_idle
      0.00            +0.2        0.20 ± 14%  perf-profile.self.cycles-pp.load_balance
      0.00            +0.2        0.20 ± 12%  perf-profile.self.cycles-pp.irq_work_tick
      0.00            +0.2        0.21 ± 14%  perf-profile.self.cycles-pp.task_tick_mm_cid
      0.00            +0.2        0.21 ± 12%  perf-profile.self.cycles-pp.ct_kernel_exit_state
      0.00            +0.2        0.22 ± 11%  perf-profile.self.cycles-pp.tick_nohz_highres_handler
      0.00            +0.2        0.22 ± 23%  perf-profile.self.cycles-pp.leave_mm
      0.00            +0.2        0.22 ± 12%  perf-profile.self.cycles-pp.update_rq_clock_task
      0.00            +0.2        0.22 ± 19%  perf-profile.self.cycles-pp._raw_spin_trylock
      0.00            +0.2        0.23 ± 18%  perf-profile.self.cycles-pp.hrtimer_interrupt
      0.00            +0.2        0.24 ± 27%  perf-profile.self.cycles-pp.pm_qos_read_value
      0.00            +0.2        0.24 ± 22%  perf-profile.self.cycles-pp.ct_kernel_enter
      0.00            +0.2        0.24 ± 19%  perf-profile.self.cycles-pp.x86_pmu_disable
      0.00            +0.2        0.24 ± 18%  perf-profile.self.cycles-pp.get_cpu_device
      0.00            +0.3        0.26 ± 12%  perf-profile.self.cycles-pp.rebalance_domains
      0.00            +0.3        0.26 ± 17%  perf-profile.self.cycles-pp.tick_irq_enter
      0.00            +0.3        0.26 ± 10%  perf-profile.self.cycles-pp.tsc_verify_tsc_adjust
      0.00            +0.3        0.29 ± 11%  perf-profile.self.cycles-pp.rb_insert_color
      0.00            +0.3        0.30 ± 26%  perf-profile.self.cycles-pp.calc_global_load_tick
      0.00            +0.3        0.33 ±  5%  perf-profile.self.cycles-pp.nr_iowait_cpu
      0.00            +0.3        0.34 ±  6%  perf-profile.self.cycles-pp.rb_erase
      0.00            +0.3        0.34 ±  8%  perf-profile.self.cycles-pp.rb_next
      0.00            +0.3        0.35 ±  8%  perf-profile.self.cycles-pp.ktime_get_update_offsets_now
      0.00            +0.4        0.36 ± 37%  perf-profile.self.cycles-pp.tick_sched_do_timer
      0.00            +0.4        0.36 ± 15%  perf-profile.self.cycles-pp.irqtime_account_process_tick
      0.00            +0.4        0.38 ± 10%  perf-profile.self.cycles-pp.sysvec_apic_timer_interrupt
      0.00            +0.4        0.39 ± 11%  perf-profile.self.cycles-pp.tick_nohz_next_event
      0.00            +0.4        0.39 ± 13%  perf-profile.self.cycles-pp.check_cpu_stall
      0.00            +0.4        0.40 ±  7%  perf-profile.self.cycles-pp.timerqueue_add
      0.00            +0.4        0.40 ± 11%  perf-profile.self.cycles-pp.perf_rotate_context
      0.00            +0.4        0.41 ± 11%  perf-profile.self.cycles-pp.scheduler_tick
      0.00            +0.4        0.42 ±  6%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.00            +0.4        0.43 ± 14%  perf-profile.self.cycles-pp.__intel_pmu_enable_all
      0.00            +0.4        0.44 ±  7%  perf-profile.self.cycles-pp.irqtime_account_irq
      0.00            +0.5        0.45 ±  9%  perf-profile.self.cycles-pp.rcu_pending
      0.00            +0.5        0.48 ±  7%  perf-profile.self.cycles-pp.native_irq_return_iret
      0.00            +0.5        0.48 ± 10%  perf-profile.self.cycles-pp.update_process_times
      0.00            +0.5        0.50 ± 13%  perf-profile.self.cycles-pp.__hrtimer_next_event_base
      0.00            +0.5        0.54 ± 16%  perf-profile.self.cycles-pp._raw_spin_lock
      0.00            +0.5        0.54 ± 13%  perf-profile.self.cycles-pp.read_tsc
      0.00            +0.5        0.55 ± 10%  perf-profile.self.cycles-pp.tick_check_oneshot_broadcast_this_cpu
      0.00            +0.6        0.55 ±  5%  perf-profile.self.cycles-pp.update_irq_load_avg
      0.00            +0.6        0.59 ±  7%  perf-profile.self.cycles-pp.cpuidle_idle_call
      0.00            +0.6        0.63 ± 11%  perf-profile.self.cycles-pp.__hrtimer_run_queues
      0.00            +0.7        0.66 ±  9%  perf-profile.self.cycles-pp.lapic_next_deadline
      0.00            +0.7        0.67 ±  5%  perf-profile.self.cycles-pp.native_sched_clock
      0.00            +0.8        0.76 ± 17%  perf-profile.self.cycles-pp.arch_scale_freq_tick
      0.00            +0.8        0.84 ± 15%  perf-profile.self.cycles-pp.ktime_get
      0.00            +1.0        1.05 ± 20%  perf-profile.self.cycles-pp.crc_pcl
      0.00            +1.5        1.49 ±  9%  perf-profile.self.cycles-pp.menu_select
      0.00            +2.3        2.34 ±  3%  perf-profile.self.cycles-pp.cpuidle_enter_state
     33.05 ± 31%     +26.7       59.72        perf-profile.self.cycles-pp.intel_idle


***************************************************************************************************
lkp-csl-2sp7: 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz (Cascade Lake) with 512G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/option_a/option_b/option_c/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-8.3/4Kb/2GB/Write Performance/debian-x86_64-phoronix/lkp-csl-2sp7/iozone-1.9.5/phoronix-test-suite

commit: 
  e89b095059 ("fs: implement 'vfs write barriers'")
  753d63fa0e ("fs: add srcu variants for mnt_{want,drop}_write() helpers")

e89b095059a2ddd1 753d63fa0e79bb7ad14f0351b80 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     26.67 ± 18%     -61.2%      10.33 ± 35%  perf-c2c.DRAM.local
     37.37           -29.0%      26.52        boot-time.boot
      3094           -33.2%       2066 ±  2%  boot-time.idle
 3.034e+09          +282.7%  1.161e+10        cpuidle..time
   3200785          +281.2%   12202451        cpuidle..usage
     71.69          +114.8%     153.98        uptime.boot
      6274          +120.1%      13808        uptime.idle
      0.09 ±  5%      +0.8        0.87        mpstat.cpu.all.iowait%
      0.12            +0.0        0.14        mpstat.cpu.all.soft%
      0.39            -0.2        0.17        mpstat.cpu.all.sys%
      0.50            -0.3        0.21        mpstat.cpu.all.usr%
     67926 ± 54%    +423.9%     355852 ± 85%  numa-meminfo.node0.Active
     47177 ± 50%    +649.7%     353673 ± 86%  numa-meminfo.node0.Active(file)
    913999 ± 35%     -60.7%     359636 ± 50%  numa-meminfo.node0.Inactive(anon)
    665096 ± 52%     -87.8%      80980 ±206%  numa-meminfo.node0.Shmem
     49941 ± 47%   +1155.6%     627065 ± 49%  numa-meminfo.node1.Active(file)
     24317 ± 35%    +124.8%      54672 ± 43%  numa-meminfo.node1.AnonHugePages
      2641           -54.8%       1195 ±  3%  vmstat.io.bi
      0.03        +3.4e+08%      99531        vmstat.io.bo
      0.28 ±  8%    +215.7%       0.89 ±  4%  vmstat.procs.b
      1.41 ±  3%     -67.9%       0.45 ±  6%  vmstat.procs.r
      2405 ±  6%     -20.9%       1904 ±  5%  vmstat.system.cs
     95532            +2.6%      98022        vmstat.system.in
      1949           -93.5%     126.26        phoronix-test-suite.iozone.4Kb.2GB.WritePerformance.mb_s
     31.00          +299.9%     123.98        phoronix-test-suite.time.elapsed_time
     31.00          +299.9%     123.98        phoronix-test-suite.time.elapsed_time.max
    155688           +77.5%     276286 ±  4%  phoronix-test-suite.time.file_system_inputs
     32.33           -62.9%      12.00        phoronix-test-suite.time.percent_of_cpu_this_job_got
      7.68           +73.8%      13.36        phoronix-test-suite.time.system_time
      2720          +239.3%       9232 ± 71%  phoronix-test-suite.time.voluntary_context_switches
    174442 ± 15%    +473.8%    1001027        meminfo.Active
     77888 ± 33%     -68.9%      24199 ±  2%  meminfo.Active(anon)
     96554          +911.7%     976827        meminfo.Active(file)
     75042 ± 19%     +71.3%     128579 ± 14%  meminfo.AnonHugePages
   2529719           -31.5%    1732667        meminfo.Committed_AS
   2859422           -29.3%    2020479        meminfo.Inactive
   1661399           -44.6%     920207        meminfo.Inactive(anon)
     72864           -10.4%      65255        meminfo.KReclaimable
     72864           -10.4%      65255        meminfo.SReclaimable
   1273413           -62.6%     476491        meminfo.Shmem
   5251895           -11.4%    4655535        meminfo.max_used_kB
     11794 ± 50%    +648.6%      88295 ± 86%  numa-vmstat.node0.nr_active_file
      0.00       +8.8e+107%     878681 ±145%  numa-vmstat.node0.nr_dirtied
    228484 ± 35%     -60.7%      89908 ± 50%  numa-vmstat.node0.nr_inactive_anon
    166350 ± 52%     -87.8%      20245 ±206%  numa-vmstat.node0.nr_shmem
      0.00       +8.8e+107%     877931 ±145%  numa-vmstat.node0.nr_written
     11794 ± 50%    +648.6%      88295 ± 86%  numa-vmstat.node0.nr_zone_active_file
    228484 ± 35%     -60.7%      89908 ± 50%  numa-vmstat.node0.nr_zone_inactive_anon
     12485 ± 47%   +1154.4%     156616 ± 49%  numa-vmstat.node1.nr_active_file
      0.00       +2.3e+108%    2286296 ± 55%  numa-vmstat.node1.nr_dirtied
      0.00       +2.3e+108%    2283465 ± 55%  numa-vmstat.node1.nr_written
     12485 ± 47%   +1154.4%     156616 ± 49%  numa-vmstat.node1.nr_zone_active_file
     74.83           -14.3%      64.17        turbostat.Avg_MHz
      1461           -17.4%       1207        turbostat.Bzy_MHz
      0.05 ±  8%      -0.0        0.02 ± 20%  turbostat.C1%
     32516 ± 11%    +502.6%     195932 ±  2%  turbostat.C1E
      0.33 ±  3%      +0.7        1.08        turbostat.C1E%
   3090704          +285.1%   11903096        turbostat.C6
     26.74           +15.5%      30.88        turbostat.CPU%c6
     48.83 ±  2%     -10.2%      43.83        turbostat.CoreTmp
   3215853          +287.1%   12449398        turbostat.IRQ
      6318 ± 11%    +290.9%      24698 ± 12%  turbostat.POLL
      6.99 ±  4%     -81.7%       1.28 ±  5%  turbostat.Pkg%pc6
     48.83 ±  2%     -10.9%      43.50        turbostat.PkgTmp
    105.08           -16.0%      88.26        turbostat.PkgWatt
    139.33            +4.2%     145.15        turbostat.RAMWatt
     19314 ± 35%     -68.8%       6034 ±  2%  proc-vmstat.nr_active_anon
     24138          +914.0%     244768        proc-vmstat.nr_active_file
      0.00       +3.2e+108%    3164972        proc-vmstat.nr_dirtied
    415381           -44.6%     230091        proc-vmstat.nr_inactive_anon
    299505            -8.0%     275578        proc-vmstat.nr_inactive_file
    318240           -62.6%     119109        proc-vmstat.nr_shmem
     18217           -10.4%      16314        proc-vmstat.nr_slab_reclaimable
      0.00       +3.2e+108%    3161395        proc-vmstat.nr_written
     19314 ± 35%     -68.8%       6034 ±  2%  proc-vmstat.nr_zone_active_anon
     24138          +914.0%     244768        proc-vmstat.nr_zone_active_file
    415381           -44.6%     230091        proc-vmstat.nr_zone_inactive_anon
    299505            -8.0%     275578        proc-vmstat.nr_zone_inactive_file
   2018641           +13.3%    2287184        proc-vmstat.numa_hit
   1985823           +15.5%    2294487 ±  3%  proc-vmstat.numa_local
   2087693           +15.0%    2401278        proc-vmstat.pgalloc_normal
    529581           +70.7%     904046        proc-vmstat.pgfault
   1966058           +17.0%    2300608        proc-vmstat.pgfree
     89760           +72.3%     154644 ±  4%  proc-vmstat.pgpgin
      0.00       +1.3e+109%   12673456        proc-vmstat.pgpgout
     59723          +103.8%     121724        proc-vmstat.pgreuse
    430336          +167.2%    1149824        proc-vmstat.unevictable_pgs_scanned
      2862 ±  6%     +72.7%       4942 ± 12%  sched_debug.cfs_rq:/.avg_vruntime.avg
     13388 ± 11%    +120.9%      29573 ± 26%  sched_debug.cfs_rq:/.avg_vruntime.max
    877.51 ± 10%     +36.8%       1200 ± 15%  sched_debug.cfs_rq:/.avg_vruntime.min
      2307 ± 10%    +143.3%       5614 ± 23%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      4112 ± 95%    +571.7%      27620 ± 18%  sched_debug.cfs_rq:/.load.avg
     24689 ±148%    +364.9%     114772 ± 16%  sched_debug.cfs_rq:/.load.stddev
     80.16 ± 22%     -49.8%      40.25 ± 15%  sched_debug.cfs_rq:/.load_avg.avg
      1378 ± 25%     -35.3%     891.39 ±  8%  sched_debug.cfs_rq:/.load_avg.max
    261.41 ± 11%     -37.3%     164.02 ±  9%  sched_debug.cfs_rq:/.load_avg.stddev
      2862 ±  6%     +72.7%       4942 ± 12%  sched_debug.cfs_rq:/.min_vruntime.avg
     13388 ± 11%    +120.9%      29573 ± 26%  sched_debug.cfs_rq:/.min_vruntime.max
    877.51 ± 10%     +36.8%       1200 ± 15%  sched_debug.cfs_rq:/.min_vruntime.min
      2307 ± 10%    +143.3%       5614 ± 23%  sched_debug.cfs_rq:/.min_vruntime.stddev
      0.08 ± 17%     -16.7%       0.07 ± 10%  sched_debug.cfs_rq:/.nr_running.avg
     56.41 ± 31%     -71.8%      15.91 ± 24%  sched_debug.cfs_rq:/.removed.load_avg.avg
      1024           -66.7%     341.33        sched_debug.cfs_rq:/.removed.load_avg.max
    229.26 ± 15%     -69.0%      71.16 ± 11%  sched_debug.cfs_rq:/.removed.load_avg.stddev
     24.41 ± 34%     -73.7%       6.43 ± 30%  sched_debug.cfs_rq:/.removed.runnable_avg.avg
    519.33           -69.0%     160.83 ± 15%  sched_debug.cfs_rq:/.removed.runnable_avg.max
    100.55 ± 18%     -70.5%      29.69 ± 21%  sched_debug.cfs_rq:/.removed.runnable_avg.stddev
     24.41 ± 34%     -73.7%       6.43 ± 30%  sched_debug.cfs_rq:/.removed.util_avg.avg
    519.33           -69.0%     160.83 ± 15%  sched_debug.cfs_rq:/.removed.util_avg.max
    100.55 ± 18%     -70.5%      29.69 ± 21%  sched_debug.cfs_rq:/.removed.util_avg.stddev
    250.82 ±  4%     -65.4%      86.85 ± 21%  sched_debug.cfs_rq:/.runnable_avg.avg
      1037 ±  2%     -26.0%     767.50 ±  8%  sched_debug.cfs_rq:/.runnable_avg.max
    270.87           -41.9%     157.44 ±  5%  sched_debug.cfs_rq:/.runnable_avg.stddev
    250.40 ±  4%     -65.4%      86.70 ± 21%  sched_debug.cfs_rq:/.util_avg.avg
      1037 ±  2%     -26.1%     767.00 ±  8%  sched_debug.cfs_rq:/.util_avg.max
    270.57           -41.8%     157.40 ±  5%  sched_debug.cfs_rq:/.util_avg.stddev
     19.78 ± 27%     -64.6%       7.01 ± 33%  sched_debug.cfs_rq:/.util_est_enqueued.avg
    789.00           -74.9%     197.78 ± 23%  sched_debug.cfs_rq:/.util_est_enqueued.max
    101.51 ± 11%     -67.2%      33.28 ± 25%  sched_debug.cfs_rq:/.util_est_enqueued.stddev
    858300           +11.4%     956177        sched_debug.cpu.avg_idle.avg
    220618 ± 11%     -42.5%     126920 ± 16%  sched_debug.cpu.avg_idle.stddev
     39475          +124.9%      88796        sched_debug.cpu.clock.avg
     39480          +124.9%      88802        sched_debug.cpu.clock.max
     39470          +124.9%      88783        sched_debug.cpu.clock.min
     39334          +121.2%      87021        sched_debug.cpu.clock_task.avg
     39456          +121.6%      87432        sched_debug.cpu.clock_task.max
     33343          +143.2%      81080        sched_debug.cpu.clock_task.min
    176.17 ± 22%     -35.3%     113.98 ± 10%  sched_debug.cpu.curr->pid.avg
      2339          +111.5%       4948        sched_debug.cpu.curr->pid.max
     35739 ± 18%     -53.7%      16562 ± 54%  sched_debug.cpu.max_idle_balance_cost.stddev
      0.08 ± 20%     -50.7%       0.04 ± 13%  sched_debug.cpu.nr_running.avg
      0.27 ±  8%     -31.6%       0.18 ±  8%  sched_debug.cpu.nr_running.stddev
      1002          +101.6%       2021 ±  2%  sched_debug.cpu.nr_switches.avg
      7712 ± 10%    +116.3%      16678 ± 18%  sched_debug.cpu.nr_switches.max
    195.00 ±  5%    +133.0%     454.44 ±  4%  sched_debug.cpu.nr_switches.min
      1126 ±  3%    +105.6%       2317 ±  8%  sched_debug.cpu.nr_switches.stddev
      0.09 ±  5%     -38.6%       0.05 ± 23%  sched_debug.cpu.nr_uninterruptible.avg
     39472          +124.9%      88784        sched_debug.cpu_clk
     38793          +127.1%      88106        sched_debug.ktime
     40044          +123.2%      89363        sched_debug.sched_clk
      2.23          +122.9%       4.97        perf-stat.i.MPKI
 5.997e+08           -45.2%  3.287e+08        perf-stat.i.branch-instructions
      6.68            +1.7        8.39        perf-stat.i.branch-miss-rate%
  28803253           -27.3%   20933397        perf-stat.i.branch-misses
      5.18            +0.9        6.11        perf-stat.i.cache-miss-rate%
   3331470 ±  3%     +36.8%    4557216        perf-stat.i.cache-misses
  71954328            +6.2%   76437650        perf-stat.i.cache-references
      4.15 ±  2%     +30.5%       5.42        perf-stat.i.cpi
 5.982e+09           -11.4%  5.303e+09        perf-stat.i.cpu-cycles
      1889 ±  3%     -30.2%       1319        perf-stat.i.cycles-between-cache-misses
      0.66 ±  4%      +0.1        0.81        perf-stat.i.dTLB-load-miss-rate%
 7.062e+08           -42.2%   4.08e+08        perf-stat.i.dTLB-loads
      0.10            +0.0        0.14        perf-stat.i.dTLB-store-miss-rate%
    173368            +5.4%     182770        perf-stat.i.dTLB-store-misses
 3.374e+08           -41.7%  1.967e+08        perf-stat.i.dTLB-stores
     76.08            -3.0       73.08        perf-stat.i.iTLB-load-miss-rate%
   1734649 ±  2%     -47.7%     908083        perf-stat.i.iTLB-load-misses
    501759 ±  2%     -30.0%     351120        perf-stat.i.iTLB-loads
 2.929e+09           -44.3%  1.633e+09        perf-stat.i.instructions
      1894           -15.3%       1604        perf-stat.i.instructions-per-iTLB-miss
      0.45           -37.0%       0.28        perf-stat.i.ipc
      0.06           -11.3%       0.06        perf-stat.i.metric.GHz
      1035 ±  3%     -17.0%     859.31        perf-stat.i.metric.K/sec
     16.80           -42.5%       9.66        perf-stat.i.metric.M/sec
      9094           -42.2%       5253        perf-stat.i.minor-faults
     62.33 ±  2%     -30.7       31.61 ±  3%  perf-stat.i.node-load-miss-rate%
    159065 ±  5%     -37.0%     100152 ±  5%  perf-stat.i.node-load-misses
    122263 ±  6%    +134.9%     287218 ±  2%  perf-stat.i.node-loads
     71928 ± 11%     -32.9%      48263 ±  7%  perf-stat.i.node-store-misses
    204138 ±  4%     -57.5%      86790 ±  9%  perf-stat.i.node-stores
      9096           -42.2%       5254        perf-stat.i.page-faults
      1.14 ±  2%    +145.4%       2.79        perf-stat.overall.MPKI
      4.80            +1.6        6.37        perf-stat.overall.branch-miss-rate%
      4.63 ±  2%      +1.3        5.96        perf-stat.overall.cache-miss-rate%
      2.04           +58.9%       3.25        perf-stat.overall.cpi
      1798 ±  3%     -35.3%       1163        perf-stat.overall.cycles-between-cache-misses
      0.28 ±  3%      +0.2        0.50        perf-stat.overall.dTLB-load-miss-rate%
      0.05            +0.0        0.09        perf-stat.overall.dTLB-store-miss-rate%
     77.56            -5.4       72.12        perf-stat.overall.iTLB-load-miss-rate%
      1688            +6.5%       1797        perf-stat.overall.instructions-per-iTLB-miss
      0.49           -37.1%       0.31        perf-stat.overall.ipc
     56.55 ±  4%     -30.7       25.85 ±  4%  perf-stat.overall.node-load-miss-rate%
     26.01 ±  7%      +9.8       35.85 ±  9%  perf-stat.overall.node-store-miss-rate%
 5.799e+08           -43.8%  3.258e+08        perf-stat.ps.branch-instructions
  27846698           -25.5%   20756514        perf-stat.ps.branch-misses
   3222777 ±  3%     +40.2%    4519893        perf-stat.ps.cache-misses
  69651736            +8.9%   75819709        perf-stat.ps.cache-references
     92961            +2.4%      95232        perf-stat.ps.cpu-clock
  5.79e+09            -9.2%  5.259e+09        perf-stat.ps.cpu-cycles
    103.44            +3.0%     106.56        perf-stat.ps.cpu-migrations
   1934038 ±  2%      +4.8%    2027270        perf-stat.ps.dTLB-load-misses
  6.83e+08           -40.8%  4.046e+08        perf-stat.ps.dTLB-loads
    167844            +8.0%     181298        perf-stat.ps.dTLB-store-misses
 3.264e+08           -40.3%   1.95e+08        perf-stat.ps.dTLB-stores
   1678426 ±  2%     -46.3%     900696        perf-stat.ps.iTLB-load-misses
    485566 ±  2%     -28.3%     348241        perf-stat.ps.iTLB-loads
 2.833e+09           -42.8%  1.619e+09        perf-stat.ps.instructions
      8800           -40.8%       5209        perf-stat.ps.minor-faults
    153879 ±  5%     -35.5%      99317 ±  5%  perf-stat.ps.node-load-misses
    118236 ±  7%    +140.9%     284876 ±  2%  perf-stat.ps.node-loads
     69613 ± 11%     -31.3%      47858 ±  7%  perf-stat.ps.node-store-misses
    197332 ±  4%     -56.4%      86042 ±  9%  perf-stat.ps.node-stores
      8801           -40.8%       5210        perf-stat.ps.page-faults
     92961            +2.4%      95232        perf-stat.ps.task-clock
 8.915e+10          +126.1%  2.016e+11        perf-stat.total.instructions
     45.91 ± 36%     -37.0        8.91 ± 17%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
     45.91 ± 36%     -37.0        8.93 ± 18%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
     27.31 ± 17%     -27.3        0.00        perf-profile.calltrace.cycles-pp.exit_mmap.__mmput.exit_mm.do_exit.do_group_exit
     26.02 ± 33%     -26.0        0.00        perf-profile.calltrace.cycles-pp.do_group_exit.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop.exit_to_user_mode_prepare
     26.02 ± 33%     -26.0        0.00        perf-profile.calltrace.cycles-pp.do_exit.do_group_exit.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop
     23.12 ± 35%     -23.1        0.00        perf-profile.calltrace.cycles-pp.exit_mm.do_exit.do_group_exit.get_signal.arch_do_signal_or_restart
     23.12 ± 35%     -23.1        0.00        perf-profile.calltrace.cycles-pp.__mmput.exit_mm.do_exit.do_group_exit.get_signal
     22.91 ± 29%     -22.9        0.00        perf-profile.calltrace.cycles-pp.unmap_vmas.exit_mmap.__mmput.exit_mm.do_exit
     22.91 ± 29%     -22.9        0.00        perf-profile.calltrace.cycles-pp.unmap_page_range.unmap_vmas.exit_mmap.__mmput.exit_mm
     22.91 ± 29%     -22.9        0.00        perf-profile.calltrace.cycles-pp.zap_pmd_range.unmap_page_range.unmap_vmas.exit_mmap.__mmput
     22.91 ± 29%     -22.9        0.00        perf-profile.calltrace.cycles-pp.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_vmas.exit_mmap
     16.19 ± 87%     -16.2        0.00        perf-profile.calltrace.cycles-pp.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
     16.19 ± 87%     -16.2        0.00        perf-profile.calltrace.cycles-pp.asm_sysvec_reschedule_ipi
     16.19 ± 87%     -16.2        0.00        perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
     16.19 ± 87%     -16.2        0.00        perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
     16.19 ± 87%     -16.2        0.00        perf-profile.calltrace.cycles-pp.arch_do_signal_or_restart.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi
     16.19 ± 87%     -16.2        0.00        perf-profile.calltrace.cycles-pp.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_user_mode
     12.08 ± 46%     -12.1        0.00        perf-profile.calltrace.cycles-pp.tlb_batch_pages_flush.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_vmas
     10.55 ± 52%     -10.6        0.00        perf-profile.calltrace.cycles-pp.release_pages.tlb_batch_pages_flush.zap_pte_range.zap_pmd_range.unmap_page_range
      8.88 ± 77%      -8.9        0.00        perf-profile.calltrace.cycles-pp.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write.do_syscall_64
      8.88 ± 77%      -8.9        0.00        perf-profile.calltrace.cycles-pp.shmem_file_write_iter.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      5.08 ±101%      -5.1        0.00        perf-profile.calltrace.cycles-pp._compound_head.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_vmas
      0.00            +0.6        0.58 ± 11%  perf-profile.calltrace.cycles-pp.lapic_next_deadline.clockevents_program_event.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      0.00            +0.6        0.60 ±  8%  perf-profile.calltrace.cycles-pp.run_posix_cpu_timers.tick_sched_handle.tick_nohz_highres_handler.__hrtimer_run_queues.hrtimer_interrupt
      0.00            +0.6        0.61 ±  8%  perf-profile.calltrace.cycles-pp.cpuidle_governor_latency_req.menu_select.cpuidle_idle_call.do_idle.cpu_startup_entry
      0.00            +0.7        0.66 ± 14%  perf-profile.calltrace.cycles-pp.run_rebalance_domains.__do_softirq.irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      0.00            +0.7        0.67 ±  6%  perf-profile.calltrace.cycles-pp.timerqueue_add.enqueue_hrtimer.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt
      0.00            +0.7        0.68 ± 13%  perf-profile.calltrace.cycles-pp.timerqueue_del.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      0.00            +0.7        0.70        perf-profile.calltrace.cycles-pp.update_sd_lb_stats.find_busiest_group.load_balance.rebalance_domains.__do_softirq
      0.00            +0.7        0.72 ± 10%  perf-profile.calltrace.cycles-pp.arch_scale_freq_tick.scheduler_tick.update_process_times.tick_sched_handle.tick_nohz_highres_handler
      0.00            +0.7        0.74 ±  7%  perf-profile.calltrace.cycles-pp.enqueue_hrtimer.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      0.00            +0.8        0.75 ±  3%  perf-profile.calltrace.cycles-pp.find_busiest_group.load_balance.rebalance_domains.__do_softirq.irq_exit_rcu
      0.00            +0.8        0.76 ±  8%  perf-profile.calltrace.cycles-pp.update_rq_clock_task.scheduler_tick.update_process_times.tick_sched_handle.tick_nohz_highres_handler
      0.00            +0.8        0.77 ± 17%  perf-profile.calltrace.cycles-pp.rcu_pending.rcu_sched_clock_irq.update_process_times.tick_sched_handle.tick_nohz_highres_handler
      0.00            +0.8        0.79 ± 10%  perf-profile.calltrace.cycles-pp.clockevents_program_event.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      0.00            +0.9        0.90 ± 18%  perf-profile.calltrace.cycles-pp.crc_pcl.crc32c_pcl_intel_digest.btrfs_csum_one_bio.btrfs_submit_chunk.btrfs_submit_bio
      0.00            +0.9        0.91 ± 18%  perf-profile.calltrace.cycles-pp.crc32c_pcl_intel_digest.btrfs_csum_one_bio.btrfs_submit_chunk.btrfs_submit_bio.submit_one_bio
      0.00            +0.9        0.92 ± 23%  perf-profile.calltrace.cycles-pp.rep_movs_alternative.copy_page_from_iter_atomic.btrfs_copy_from_user.btrfs_buffered_write.btrfs_do_write_iter
      0.00            +0.9        0.92 ± 19%  perf-profile.calltrace.cycles-pp.btrfs_csum_one_bio.btrfs_submit_chunk.btrfs_submit_bio.submit_one_bio.submit_extent_page
      0.00            +0.9        0.93 ± 24%  perf-profile.calltrace.cycles-pp.__clear_extent_bit.btrfs_dirty_pages.btrfs_buffered_write.btrfs_do_write_iter.vfs_write
      0.00            +0.9        0.94 ± 19%  perf-profile.calltrace.cycles-pp.submit_one_bio.submit_extent_page.__extent_writepage_io.__extent_writepage.extent_write_cache_pages
      0.00            +0.9        0.94 ± 19%  perf-profile.calltrace.cycles-pp.btrfs_submit_bio.submit_one_bio.submit_extent_page.__extent_writepage_io.__extent_writepage
      0.00            +0.9        0.94 ± 19%  perf-profile.calltrace.cycles-pp.btrfs_submit_chunk.btrfs_submit_bio.submit_one_bio.submit_extent_page.__extent_writepage_io
      0.00            +0.9        0.95 ± 14%  perf-profile.calltrace.cycles-pp.rcu_sched_clock_irq.update_process_times.tick_sched_handle.tick_nohz_highres_handler.__hrtimer_run_queues
      0.00            +1.0        0.97 ± 19%  perf-profile.calltrace.cycles-pp.submit_extent_page.__extent_writepage_io.__extent_writepage.extent_write_cache_pages.extent_writepages
      0.00            +1.1        1.12 ± 21%  perf-profile.calltrace.cycles-pp.copy_page_from_iter_atomic.btrfs_copy_from_user.btrfs_buffered_write.btrfs_do_write_iter.vfs_write
      0.00            +1.1        1.13 ± 11%  perf-profile.calltrace.cycles-pp.tick_nohz_next_event.tick_nohz_get_sleep_length.menu_select.cpuidle_idle_call.do_idle
      0.00            +1.1        1.13 ±  6%  perf-profile.calltrace.cycles-pp.load_balance.rebalance_domains.__do_softirq.irq_exit_rcu.sysvec_apic_timer_interrupt
      0.00            +1.1        1.14 ± 21%  perf-profile.calltrace.cycles-pp.btrfs_copy_from_user.btrfs_buffered_write.btrfs_do_write_iter.vfs_write.ksys_write
      0.00            +1.2        1.17 ±  9%  perf-profile.calltrace.cycles-pp.perf_rotate_context.perf_mux_hrtimer_handler.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt
      0.00            +1.3        1.32 ± 20%  perf-profile.calltrace.cycles-pp.__extent_writepage_io.__extent_writepage.extent_write_cache_pages.extent_writepages.do_writepages
      0.00            +1.5        1.53 ± 19%  perf-profile.calltrace.cycles-pp.__extent_writepage.extent_write_cache_pages.extent_writepages.do_writepages.filemap_fdatawrite_wbc
      0.00            +1.6        1.58 ±  5%  perf-profile.calltrace.cycles-pp.rebalance_domains.__do_softirq.irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      0.00            +1.6        1.63 ±  8%  perf-profile.calltrace.cycles-pp.perf_mux_hrtimer_handler.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      0.00            +1.7        1.72 ± 20%  perf-profile.calltrace.cycles-pp.btrfs_dirty_pages.btrfs_buffered_write.btrfs_do_write_iter.vfs_write.ksys_write
      0.00            +1.7        1.72 ± 19%  perf-profile.calltrace.cycles-pp.extent_write_cache_pages.extent_writepages.do_writepages.filemap_fdatawrite_wbc.__filemap_fdatawrite_range
      0.00            +1.7        1.72 ± 19%  perf-profile.calltrace.cycles-pp.__filemap_fdatawrite_range.start_ordered_ops.btrfs_sync_file.__x64_sys_fsync.do_syscall_64
      0.00            +1.7        1.72 ± 19%  perf-profile.calltrace.cycles-pp.filemap_fdatawrite_wbc.__filemap_fdatawrite_range.start_ordered_ops.btrfs_sync_file.__x64_sys_fsync
      0.00            +1.7        1.72 ± 19%  perf-profile.calltrace.cycles-pp.do_writepages.filemap_fdatawrite_wbc.__filemap_fdatawrite_range.start_ordered_ops.btrfs_sync_file
      0.00            +1.7        1.72 ± 19%  perf-profile.calltrace.cycles-pp.start_ordered_ops.btrfs_sync_file.__x64_sys_fsync.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +1.7        1.72 ± 19%  perf-profile.calltrace.cycles-pp.extent_writepages.do_writepages.filemap_fdatawrite_wbc.__filemap_fdatawrite_range.start_ordered_ops
      0.00            +1.8        1.77 ± 20%  perf-profile.calltrace.cycles-pp.__x64_sys_fsync.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +1.8        1.77 ± 20%  perf-profile.calltrace.cycles-pp.btrfs_sync_file.__x64_sys_fsync.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +1.8        1.80 ± 10%  perf-profile.calltrace.cycles-pp.tick_irq_enter.irq_enter_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
      0.00            +1.8        1.84 ±  8%  perf-profile.calltrace.cycles-pp.tick_nohz_get_sleep_length.menu_select.cpuidle_idle_call.do_idle.cpu_startup_entry
      0.00            +1.8        1.84 ±  9%  perf-profile.calltrace.cycles-pp.irq_enter_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
      0.00            +2.5        2.55 ±  6%  perf-profile.calltrace.cycles-pp.__do_softirq.irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
      0.00            +3.0        2.96 ±  4%  perf-profile.calltrace.cycles-pp.irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
      0.00            +5.2        5.16 ± 20%  perf-profile.calltrace.cycles-pp.btrfs_buffered_write.btrfs_do_write_iter.vfs_write.ksys_write.do_syscall_64
      0.00            +5.2        5.23 ± 20%  perf-profile.calltrace.cycles-pp.btrfs_do_write_iter.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.39 ±223%      +9.4       10.82        perf-profile.calltrace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      0.70 ±223%     +12.3       13.02 ±  2%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
      0.70 ±223%     +12.6       13.25 ±  2%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
      1.39 ±223%     +18.3       19.65 ±  3%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      2.84 ±141%     +19.8       22.65 ±  3%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
     29.72 ± 28%     +28.5       58.20        perf-profile.calltrace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
     31.84 ± 28%     +50.9       82.76        perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
     31.11 ± 28%     +51.1       82.20        perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
     32.63 ± 24%     +55.4       88.01        perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     33.32 ± 25%     +56.0       89.29        perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     33.32 ± 25%     +56.0       89.36        perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
     33.32 ± 25%     +56.0       89.36        perf-profile.calltrace.cycles-pp.start_secondary.secondary_startup_64_no_verify
     33.32 ± 25%     +57.0       90.31        perf-profile.calltrace.cycles-pp.secondary_startup_64_no_verify
     45.91 ± 36%     -37.0        8.91 ± 17%  perf-profile.children.cycles-pp.do_syscall_64
     45.91 ± 36%     -37.0        8.93 ± 18%  perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     31.74 ± 13%     -31.7        0.07 ± 19%  perf-profile.children.cycles-pp.do_exit
     31.74 ± 13%     -31.7        0.07 ± 18%  perf-profile.children.cycles-pp.do_group_exit
     27.31 ± 17%     -27.3        0.04 ± 45%  perf-profile.children.cycles-pp.exit_mm
     27.31 ± 17%     -27.1        0.18 ± 22%  perf-profile.children.cycles-pp.__mmput
     27.31 ± 17%     -27.1        0.18 ± 22%  perf-profile.children.cycles-pp.exit_mmap
     26.75 ± 34%     -26.7        0.01 ±223%  perf-profile.children.cycles-pp.exit_to_user_mode_prepare
     26.02 ± 33%     -26.0        0.00        perf-profile.children.cycles-pp.exit_to_user_mode_loop
     26.02 ± 33%     -26.0        0.00        perf-profile.children.cycles-pp.arch_do_signal_or_restart
     26.02 ± 33%     -26.0        0.00        perf-profile.children.cycles-pp.get_signal
     22.91 ± 29%     -22.9        0.06 ± 50%  perf-profile.children.cycles-pp.zap_pte_range
     22.91 ± 29%     -22.9        0.06 ± 50%  perf-profile.children.cycles-pp.unmap_page_range
     22.91 ± 29%     -22.9        0.06 ± 50%  perf-profile.children.cycles-pp.zap_pmd_range
     22.91 ± 29%     -22.8        0.06 ± 51%  perf-profile.children.cycles-pp.unmap_vmas
     18.44 ± 79%     -18.4        0.00        perf-profile.children.cycles-pp.irqentry_exit_to_user_mode
     16.19 ± 87%     -16.2        0.00        perf-profile.children.cycles-pp.asm_sysvec_reschedule_ipi
     14.33 ± 46%     -14.3        0.02 ±142%  perf-profile.children.cycles-pp.tlb_batch_pages_flush
      8.88 ± 77%      -8.9        0.00        perf-profile.children.cycles-pp.generic_perform_write
      8.88 ± 77%      -8.9        0.00        perf-profile.children.cycles-pp.shmem_file_write_iter
      5.08 ±101%      -5.1        0.00        perf-profile.children.cycles-pp._compound_head
      0.00            +0.1        0.06 ± 21%  perf-profile.children.cycles-pp.nohz_balancer_kick
      0.00            +0.1        0.08 ± 16%  perf-profile.children.cycles-pp.next_uptodate_folio
      0.00            +0.1        0.08 ± 27%  perf-profile.children.cycles-pp.sched_idle_set_state
      0.00            +0.1        0.08 ± 23%  perf-profile.children.cycles-pp.btrfs_calculate_inode_block_rsv_size
      0.00            +0.1        0.08 ± 34%  perf-profile.children.cycles-pp.__xa_set_mark
      0.00            +0.1        0.08 ± 25%  perf-profile.children.cycles-pp.tick_check_broadcast_expired
      0.00            +0.1        0.08 ± 33%  perf-profile.children.cycles-pp.arch_cpu_idle_exit
      0.00            +0.1        0.08 ± 31%  perf-profile.children.cycles-pp.rcu_core
      0.00            +0.1        0.09 ± 23%  perf-profile.children.cycles-pp.kmem_cache_free
      0.00            +0.1        0.09 ± 25%  perf-profile.children.cycles-pp.ct_idle_enter
      0.00            +0.1        0.09 ± 24%  perf-profile.children.cycles-pp.rcu_needs_cpu
      0.00            +0.1        0.09 ± 33%  perf-profile.children.cycles-pp.btrfs_set_delalloc_extent
      0.00            +0.1        0.09 ± 27%  perf-profile.children.cycles-pp.folio_account_dirtied
      0.00            +0.1        0.09 ± 18%  perf-profile.children.cycles-pp.schedule
      0.00            +0.1        0.09 ± 30%  perf-profile.children.cycles-pp.update_rt_rq_load_avg
      0.00            +0.1        0.10 ± 20%  perf-profile.children.cycles-pp._find_next_and_bit
      0.00            +0.1        0.10 ± 30%  perf-profile.children.cycles-pp.set_state_bits
      0.00            +0.1        0.10 ± 28%  perf-profile.children.cycles-pp.btrfs_delalloc_release_extents
      0.00            +0.1        0.10 ± 27%  perf-profile.children.cycles-pp.percpu_counter_add_batch
      0.00            +0.1        0.11 ± 12%  perf-profile.children.cycles-pp.restore_regs_and_return_to_kernel
      0.00            +0.1        0.11 ± 15%  perf-profile.children.cycles-pp.folio_clear_dirty_for_io
      0.00            +0.1        0.11 ± 33%  perf-profile.children.cycles-pp.folio_activate_fn
      0.00            +0.1        0.11 ± 56%  perf-profile.children.cycles-pp.free_extent_state
      0.00            +0.1        0.11 ± 32%  perf-profile.children.cycles-pp.worker_thread
      0.00            +0.1        0.11 ±  9%  perf-profile.children.cycles-pp.ct_nmi_exit
      0.00            +0.1        0.11 ± 23%  perf-profile.children.cycles-pp.dup_mm
      0.00            +0.1        0.11 ±  9%  perf-profile.children.cycles-pp.rcu_preempt_deferred_qs
      0.00            +0.1        0.11 ± 36%  perf-profile.children.cycles-pp.workingset_activation
      0.00            +0.1        0.12 ± 33%  perf-profile.children.cycles-pp.find_lock_delalloc_range
      0.00            +0.1        0.12 ± 22%  perf-profile.children.cycles-pp.ct_irq_enter
      0.00            +0.1        0.12 ± 20%  perf-profile.children.cycles-pp.sched_clock_noinstr
      0.00            +0.1        0.12 ± 29%  perf-profile.children.cycles-pp.btrfs_check_data_free_space
      0.00            +0.1        0.12 ± 18%  perf-profile.children.cycles-pp.tick_program_event
      0.00            +0.1        0.12 ± 17%  perf-profile.children.cycles-pp.cpuidle_reflect
      0.00            +0.1        0.13 ±  8%  perf-profile.children.cycles-pp.filemap_map_pages
      0.00            +0.1        0.13 ± 27%  perf-profile.children.cycles-pp.exec_mmap
      0.00            +0.1        0.13 ± 30%  perf-profile.children.cycles-pp.trigger_load_balance
      0.00            +0.1        0.13 ± 30%  perf-profile.children.cycles-pp.idle_cpu
      0.00            +0.1        0.14 ± 37%  perf-profile.children.cycles-pp.task_tick_idle
      0.00            +0.1        0.14 ± 23%  perf-profile.children.cycles-pp.begin_new_exec
      0.00            +0.1        0.14 ± 22%  perf-profile.children.cycles-pp.copy_process
      0.00            +0.1        0.14 ± 16%  perf-profile.children.cycles-pp.irqentry_exit
      0.00            +0.1        0.14 ± 24%  perf-profile.children.cycles-pp.should_we_balance
      0.00            +0.1        0.15 ±  7%  perf-profile.children.cycles-pp.tick_nohz_tick_stopped
      0.00            +0.1        0.15 ± 12%  perf-profile.children.cycles-pp.ct_nmi_enter
      0.00            +0.1        0.15 ± 22%  perf-profile.children.cycles-pp.hrtimer_get_next_event
      0.00            +0.1        0.15 ± 32%  perf-profile.children.cycles-pp.check_tsc_unstable
      0.00            +0.2        0.15 ± 22%  perf-profile.children.cycles-pp.__do_sys_clone
      0.00            +0.2        0.15 ± 22%  perf-profile.children.cycles-pp.kernel_clone
      0.00            +0.2        0.15 ± 46%  perf-profile.children.cycles-pp.btrfs_set_extent_delalloc
      0.00            +0.2        0.16 ± 23%  perf-profile.children.cycles-pp.__reserve_bytes
      0.00            +0.2        0.16 ± 24%  perf-profile.children.cycles-pp.lock_extent
      0.00            +0.2        0.16 ±  9%  perf-profile.children.cycles-pp.menu_reflect
      0.00            +0.2        0.16 ± 12%  perf-profile.children.cycles-pp.cpuidle_not_available
      0.00            +0.2        0.16 ± 19%  perf-profile.children.cycles-pp._raw_spin_lock_irq
      0.00            +0.2        0.17 ± 27%  perf-profile.children.cycles-pp.rcu_nocb_flush_deferred_wakeup
      0.00            +0.2        0.17 ± 22%  perf-profile.children.cycles-pp.__folio_start_writeback
      0.00            +0.2        0.18 ± 23%  perf-profile.children.cycles-pp.irq_work_needs_cpu
      0.00            +0.2        0.18 ± 21%  perf-profile.children.cycles-pp.timekeeping_max_deferment
      0.00            +0.2        0.18 ± 18%  perf-profile.children.cycles-pp.native_apic_mem_eoi
      0.00            +0.2        0.18 ± 41%  perf-profile.children.cycles-pp.btrfs_get_extent
      0.00            +0.2        0.18 ± 14%  perf-profile.children.cycles-pp.update_rq_clock
      0.00            +0.2        0.18 ± 17%  perf-profile.children.cycles-pp.call_cpuidle
      0.00            +0.2        0.19 ± 20%  perf-profile.children.cycles-pp.writepage_delalloc
      0.00            +0.2        0.19 ± 18%  perf-profile.children.cycles-pp.task_tick_mm_cid
      0.00            +0.2        0.20 ± 36%  perf-profile.children.cycles-pp.clear_state_bit
      0.00            +0.2        0.20 ± 21%  perf-profile.children.cycles-pp.tick_nohz_irq_exit
      0.00            +0.2        0.20 ± 18%  perf-profile.children.cycles-pp.filemap_get_entry
      0.00            +0.2        0.21 ± 12%  perf-profile.children.cycles-pp.kthread
      0.00            +0.2        0.22 ± 10%  perf-profile.children.cycles-pp.ret_from_fork_asm
      0.00            +0.2        0.22 ± 10%  perf-profile.children.cycles-pp.ret_from_fork
      0.00            +0.2        0.22 ± 20%  perf-profile.children.cycles-pp.pm_qos_read_value
      0.00            +0.2        0.22 ± 29%  perf-profile.children.cycles-pp.__folio_end_writeback
      0.00            +0.2        0.22 ± 14%  perf-profile.children.cycles-pp.ct_kernel_exit_state
      0.00            +0.2        0.22 ± 21%  perf-profile.children.cycles-pp.__folio_mark_dirty
      0.00            +0.2        0.22 ± 14%  perf-profile.children.cycles-pp._raw_spin_trylock
      0.00            +0.2        0.22 ± 17%  perf-profile.children.cycles-pp.lock_and_cleanup_extent_if_need
      0.00            +0.2        0.22 ± 27%  perf-profile.children.cycles-pp.folio_batch_move_lru
      0.00            +0.2        0.23 ± 20%  perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      0.00            +0.2        0.23 ± 15%  perf-profile.children.cycles-pp.calc_global_load_tick
      0.00            +0.2        0.23 ± 19%  perf-profile.children.cycles-pp.leave_mm
      0.00            +0.2        0.23 ± 11%  perf-profile.children.cycles-pp.ct_kernel_exit
      0.00            +0.2        0.23 ± 30%  perf-profile.children.cycles-pp.folio_activate
      0.00            +0.2        0.24 ± 16%  perf-profile.children.cycles-pp.error_entry
      0.00            +0.2        0.24 ± 20%  perf-profile.children.cycles-pp.btrfs_set_range_writeback
      0.00            +0.2        0.24 ± 11%  perf-profile.children.cycles-pp.x86_pmu_disable
      0.00            +0.2        0.24 ± 24%  perf-profile.children.cycles-pp.set_extent_bit
      0.00            +0.2        0.24 ± 21%  perf-profile.children.cycles-pp.xas_load
      0.00            +0.2        0.24 ± 11%  perf-profile.children.cycles-pp.get_cpu_device
      0.00            +0.3        0.26 ± 23%  perf-profile.children.cycles-pp.folio_end_writeback
      0.00            +0.3        0.26 ± 19%  perf-profile.children.cycles-pp.__update_blocked_fair
      0.00            +0.3        0.28 ± 17%  perf-profile.children.cycles-pp.irq_work_tick
      0.00            +0.3        0.29 ± 20%  perf-profile.children.cycles-pp.rb_insert_color
      0.00            +0.3        0.29 ± 23%  perf-profile.children.cycles-pp.rb_erase
      0.00            +0.3        0.30 ± 17%  perf-profile.children.cycles-pp.filemap_dirty_folio
      0.00            +0.3        0.32 ± 22%  perf-profile.children.cycles-pp.check_cpu_stall
      0.00            +0.3        0.32 ± 14%  perf-profile.children.cycles-pp.nr_iowait_cpu
      0.00            +0.3        0.32 ± 19%  perf-profile.children.cycles-pp.__btrfs_bio_end_io
      0.00            +0.3        0.32 ± 19%  perf-profile.children.cycles-pp.end_bio_extent_writepage
      0.00            +0.3        0.33 ± 19%  perf-profile.children.cycles-pp.blk_update_request
      0.00            +0.3        0.33 ± 20%  perf-profile.children.cycles-pp.scsi_io_completion
      0.00            +0.3        0.33 ± 20%  perf-profile.children.cycles-pp.scsi_end_request
      0.00            +0.3        0.34 ± 20%  perf-profile.children.cycles-pp.blk_complete_reqs
      0.00            +0.3        0.34 ± 13%  perf-profile.children.cycles-pp.rb_next
      0.00            +0.3        0.34 ±  4%  perf-profile.children.cycles-pp.irqtime_account_process_tick
      0.00            +0.4        0.35 ± 15%  perf-profile.children.cycles-pp.ct_kernel_enter
      0.00            +0.4        0.36 ± 27%  perf-profile.children.cycles-pp.btrfs_delalloc_reserve_metadata
      0.00            +0.4        0.39 ± 20%  perf-profile.children.cycles-pp.__set_extent_bit
      0.00            +0.4        0.39 ± 28%  perf-profile.children.cycles-pp.folio_mark_accessed
      0.00            +0.4        0.40 ± 10%  perf-profile.children.cycles-pp.irqentry_enter
      0.00            +0.4        0.41 ± 13%  perf-profile.children.cycles-pp.__intel_pmu_enable_all
      0.00            +0.4        0.42 ± 17%  perf-profile.children.cycles-pp.hrtimer_update_next_event
      0.00            +0.4        0.44 ±  8%  perf-profile.children.cycles-pp.sched_clock
      0.00            +0.4        0.44 ± 15%  perf-profile.children.cycles-pp.tsc_verify_tsc_adjust
      0.00            +0.4        0.44 ± 22%  perf-profile.children.cycles-pp.tick_sched_do_timer
      0.00            +0.4        0.44 ± 10%  perf-profile.children.cycles-pp.tick_nohz_stop_idle
      0.00            +0.4        0.44 ± 17%  perf-profile.children.cycles-pp.ktime_get_update_offsets_now
      0.00            +0.4        0.45 ± 14%  perf-profile.children.cycles-pp.arch_cpu_idle_enter
      0.00            +0.5        0.46 ± 10%  perf-profile.children.cycles-pp.get_next_timer_interrupt
      0.00            +0.5        0.52 ±  5%  perf-profile.children.cycles-pp.hrtimer_next_event_without
      0.00            +0.5        0.53 ±  7%  perf-profile.children.cycles-pp.local_clock_noinstr
      0.00            +0.6        0.55 ±  9%  perf-profile.children.cycles-pp.read_tsc
      0.00            +0.6        0.58 ±  8%  perf-profile.children.cycles-pp.sched_clock_cpu
      0.00            +0.6        0.59 ± 12%  perf-profile.children.cycles-pp.tick_check_oneshot_broadcast_this_cpu
      0.00            +0.6        0.60 ± 13%  perf-profile.children.cycles-pp.ct_idle_exit
      0.00            +0.6        0.60 ± 24%  perf-profile.children.cycles-pp.prepare_pages
      0.00            +0.6        0.61 ± 10%  perf-profile.children.cycles-pp.lapic_next_deadline
      0.00            +0.6        0.61 ± 25%  perf-profile.children.cycles-pp.__filemap_get_folio
      0.00            +0.6        0.61 ±  8%  perf-profile.children.cycles-pp.run_posix_cpu_timers
      0.00            +0.6        0.61 ± 24%  perf-profile.children.cycles-pp.pagecache_get_page
      0.00            +0.6        0.62 ± 11%  perf-profile.children.cycles-pp.update_irq_load_avg
      0.00            +0.6        0.62 ±  5%  perf-profile.children.cycles-pp.__hrtimer_next_event_base
      0.00            +0.6        0.63 ± 16%  perf-profile.children.cycles-pp.update_blocked_averages
      0.00            +0.6        0.64 ±  8%  perf-profile.children.cycles-pp.cpuidle_governor_latency_req
      0.00            +0.7        0.66 ±  4%  perf-profile.children.cycles-pp.native_sched_clock
      0.00            +0.7        0.66 ± 16%  perf-profile.children.cycles-pp.run_rebalance_domains
      0.00            +0.7        0.68 ±  8%  perf-profile.children.cycles-pp.timerqueue_add
      0.00            +0.7        0.71 ± 13%  perf-profile.children.cycles-pp.timerqueue_del
      0.00            +0.7        0.72 ± 21%  perf-profile.children.cycles-pp.alloc_extent_state
      0.00            +0.7        0.75 ±  7%  perf-profile.children.cycles-pp.enqueue_hrtimer
      0.00            +0.7        0.75 ±  9%  perf-profile.children.cycles-pp.arch_scale_freq_tick
      0.00            +0.8        0.78 ± 18%  perf-profile.children.cycles-pp.rcu_pending
      0.00            +0.8        0.83 ±  9%  perf-profile.children.cycles-pp.update_rq_clock_task
      0.00            +0.8        0.83 ±  8%  perf-profile.children.cycles-pp.clockevents_program_event
      0.00            +0.9        0.90 ± 18%  perf-profile.children.cycles-pp.crc_pcl
      0.00            +0.9        0.91 ± 18%  perf-profile.children.cycles-pp.crc32c_pcl_intel_digest
      0.00            +0.9        0.92 ± 19%  perf-profile.children.cycles-pp.btrfs_csum_one_bio
      0.00            +0.9        0.94 ± 19%  perf-profile.children.cycles-pp.submit_one_bio
      0.00            +0.9        0.95 ± 23%  perf-profile.children.cycles-pp.x86_64_start_kernel
      0.00            +0.9        0.95 ± 23%  perf-profile.children.cycles-pp.x86_64_start_reservations
      0.00            +0.9        0.95 ± 23%  perf-profile.children.cycles-pp.start_kernel
      0.00            +0.9        0.95 ± 23%  perf-profile.children.cycles-pp.arch_call_rest_init
      0.00            +0.9        0.95 ± 23%  perf-profile.children.cycles-pp.rest_init
      0.00            +0.9        0.95 ± 19%  perf-profile.children.cycles-pp.btrfs_submit_bio
      0.00            +0.9        0.95 ± 19%  perf-profile.children.cycles-pp.btrfs_submit_chunk
      0.00            +1.0        0.95 ±  6%  perf-profile.children.cycles-pp._raw_spin_lock
      0.00            +1.0        0.96 ± 15%  perf-profile.children.cycles-pp.rcu_sched_clock_irq
      0.00            +1.0        0.97 ± 19%  perf-profile.children.cycles-pp.submit_extent_page
      0.00            +1.1        1.15 ± 21%  perf-profile.children.cycles-pp.btrfs_copy_from_user
      0.00            +1.2        1.20 ±  9%  perf-profile.children.cycles-pp.perf_rotate_context
      0.00            +1.2        1.21 ± 10%  perf-profile.children.cycles-pp.tick_nohz_next_event
      0.00            +1.2        1.25 ±  8%  perf-profile.children.cycles-pp.ktime_get
      0.00            +1.3        1.28 ± 24%  perf-profile.children.cycles-pp.__clear_extent_bit
      0.00            +1.3        1.32 ± 20%  perf-profile.children.cycles-pp.__extent_writepage_io
      0.00            +1.5        1.53 ± 19%  perf-profile.children.cycles-pp.__extent_writepage
      0.00            +1.6        1.63 ±  4%  perf-profile.children.cycles-pp.rebalance_domains
      0.00            +1.7        1.66 ±  8%  perf-profile.children.cycles-pp.perf_mux_hrtimer_handler
      0.00            +1.7        1.72 ± 20%  perf-profile.children.cycles-pp.btrfs_dirty_pages
      0.00            +1.7        1.72 ± 19%  perf-profile.children.cycles-pp.start_ordered_ops
      0.00            +1.7        1.72 ± 19%  perf-profile.children.cycles-pp.extent_writepages
      0.00            +1.7        1.72 ± 19%  perf-profile.children.cycles-pp.extent_write_cache_pages
      0.00            +1.7        1.74 ± 19%  perf-profile.children.cycles-pp.__filemap_fdatawrite_range
      0.00            +1.7        1.74 ± 19%  perf-profile.children.cycles-pp.filemap_fdatawrite_wbc
      0.00            +1.7        1.74 ± 19%  perf-profile.children.cycles-pp.do_writepages
      0.00            +1.8        1.77 ± 20%  perf-profile.children.cycles-pp.__x64_sys_fsync
      0.00            +1.8        1.77 ± 20%  perf-profile.children.cycles-pp.btrfs_sync_file
      0.00            +1.8        1.84 ±  9%  perf-profile.children.cycles-pp.tick_irq_enter
      0.00            +1.9        1.86 ±  9%  perf-profile.children.cycles-pp.irq_enter_rcu
      0.00            +1.9        1.88 ±  7%  perf-profile.children.cycles-pp.tick_nohz_get_sleep_length
      0.00            +2.9        2.93 ±  7%  perf-profile.children.cycles-pp.__do_softirq
      0.00            +3.1        3.10 ±  5%  perf-profile.children.cycles-pp.irq_exit_rcu
      0.00            +5.2        5.17 ± 20%  perf-profile.children.cycles-pp.btrfs_buffered_write
      0.00            +5.2        5.23 ± 20%  perf-profile.children.cycles-pp.btrfs_do_write_iter
      1.39 ±223%      +9.6       11.04        perf-profile.children.cycles-pp.__hrtimer_run_queues
      1.39 ±223%     +11.8       13.23 ±  2%  perf-profile.children.cycles-pp.hrtimer_interrupt
      1.39 ±223%     +12.1       13.45 ±  2%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      2.08 ±223%     +17.9       19.95 ±  3%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      2.81 ±164%     +18.9       21.67 ±  3%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
     29.72 ± 28%     +28.5       58.26        perf-profile.children.cycles-pp.intel_idle
     31.84 ± 28%     +51.6       83.47        perf-profile.children.cycles-pp.cpuidle_enter_state
     31.84 ± 28%     +51.8       83.64        perf-profile.children.cycles-pp.cpuidle_enter
     33.32 ± 25%     +56.0       89.36        perf-profile.children.cycles-pp.start_secondary
     32.63 ± 24%     +56.4       89.05        perf-profile.children.cycles-pp.cpuidle_idle_call
     33.32 ± 25%     +57.0       90.31        perf-profile.children.cycles-pp.secondary_startup_64_no_verify
     33.32 ± 25%     +57.0       90.31        perf-profile.children.cycles-pp.cpu_startup_entry
     33.32 ± 25%     +57.0       90.31        perf-profile.children.cycles-pp.do_idle
      5.08 ±101%      -5.1        0.00        perf-profile.self.cycles-pp._compound_head
      0.00            +0.1        0.06 ± 21%  perf-profile.self.cycles-pp.nohz_balancer_kick
      0.00            +0.1        0.07 ± 29%  perf-profile.self.cycles-pp.ct_idle_enter
      0.00            +0.1        0.07 ± 18%  perf-profile.self.cycles-pp.vfs_write
      0.00            +0.1        0.07 ± 21%  perf-profile.self.cycles-pp.update_blocked_averages
      0.00            +0.1        0.08 ± 27%  perf-profile.self.cycles-pp.xas_load
      0.00            +0.1        0.08 ± 10%  perf-profile.self.cycles-pp.tick_nohz_tick_stopped
      0.00            +0.1        0.08 ± 17%  perf-profile.self.cycles-pp.update_rq_clock
      0.00            +0.1        0.09 ± 18%  perf-profile.self.cycles-pp.ct_irq_enter
      0.00            +0.1        0.09 ± 24%  perf-profile.self.cycles-pp.rcu_needs_cpu
      0.00            +0.1        0.09 ± 16%  perf-profile.self.cycles-pp.sched_clock_noinstr
      0.00            +0.1        0.09 ± 27%  perf-profile.self.cycles-pp.local_clock_noinstr
      0.00            +0.1        0.09 ± 30%  perf-profile.self.cycles-pp.update_rt_rq_load_avg
      0.00            +0.1        0.10 ± 23%  perf-profile.self.cycles-pp.__do_softirq
      0.00            +0.1        0.10 ± 13%  perf-profile.self.cycles-pp.hrtimer_next_event_without
      0.00            +0.1        0.10 ± 34%  perf-profile.self.cycles-pp.filemap_get_entry
      0.00            +0.1        0.10 ± 31%  perf-profile.self.cycles-pp.percpu_counter_add_batch
      0.00            +0.1        0.10 ± 20%  perf-profile.self.cycles-pp._find_next_and_bit
      0.00            +0.1        0.10 ± 14%  perf-profile.self.cycles-pp.ct_nmi_exit
      0.00            +0.1        0.10 ± 23%  perf-profile.self.cycles-pp.cpuidle_reflect
      0.00            +0.1        0.10 ± 25%  perf-profile.self.cycles-pp.clockevents_program_event
      0.00            +0.1        0.10 ± 15%  perf-profile.self.cycles-pp.restore_regs_and_return_to_kernel
      0.00            +0.1        0.10 ± 26%  perf-profile.self.cycles-pp.trigger_load_balance
      0.00            +0.1        0.10 ± 58%  perf-profile.self.cycles-pp.free_extent_state
      0.00            +0.1        0.11 ±  9%  perf-profile.self.cycles-pp.rcu_preempt_deferred_qs
      0.00            +0.1        0.11 ± 14%  perf-profile.self.cycles-pp.sched_clock
      0.00            +0.1        0.11 ± 22%  perf-profile.self.cycles-pp.tick_program_event
      0.00            +0.1        0.12 ± 19%  perf-profile.self.cycles-pp.btrfs_buffered_write
      0.00            +0.1        0.12 ± 23%  perf-profile.self.cycles-pp.ct_idle_exit
      0.00            +0.1        0.12 ± 24%  perf-profile.self.cycles-pp.tick_nohz_get_sleep_length
      0.00            +0.1        0.12 ± 24%  perf-profile.self.cycles-pp.btrfs_delalloc_reserve_metadata
      0.00            +0.1        0.12 ± 25%  perf-profile.self.cycles-pp.ct_kernel_exit
      0.00            +0.1        0.13 ± 16%  perf-profile.self.cycles-pp.menu_reflect
      0.00            +0.1        0.13 ± 29%  perf-profile.self.cycles-pp.idle_cpu
      0.00            +0.1        0.13 ± 18%  perf-profile.self.cycles-pp.tick_nohz_highres_handler
      0.00            +0.1        0.14 ± 35%  perf-profile.self.cycles-pp.task_tick_idle
      0.00            +0.1        0.14 ± 12%  perf-profile.self.cycles-pp.tick_nohz_stop_idle
      0.00            +0.1        0.14 ± 13%  perf-profile.self.cycles-pp.irq_exit_rcu
      0.00            +0.1        0.14 ± 34%  perf-profile.self.cycles-pp.check_tsc_unstable
      0.00            +0.1        0.14 ± 28%  perf-profile.self.cycles-pp.timekeeping_max_deferment
      0.00            +0.1        0.14 ± 12%  perf-profile.self.cycles-pp.ct_nmi_enter
      0.00            +0.1        0.14 ± 17%  perf-profile.self.cycles-pp._raw_spin_lock_irq
      0.00            +0.1        0.15 ± 20%  perf-profile.self.cycles-pp.sched_clock_cpu
      0.00            +0.2        0.15 ± 14%  perf-profile.self.cycles-pp.cpuidle_not_available
      0.00            +0.2        0.15 ± 18%  perf-profile.self.cycles-pp.hrtimer_update_next_event
      0.00            +0.2        0.16 ± 22%  perf-profile.self.cycles-pp.rcu_sched_clock_irq
      0.00            +0.2        0.16 ± 22%  perf-profile.self.cycles-pp.irq_work_needs_cpu
      0.00            +0.2        0.16 ± 32%  perf-profile.self.cycles-pp.rcu_nocb_flush_deferred_wakeup
      0.00            +0.2        0.16 ± 23%  perf-profile.self.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.00            +0.2        0.16 ± 22%  perf-profile.self.cycles-pp.cpuidle_enter
      0.00            +0.2        0.16 ± 18%  perf-profile.self.cycles-pp.perf_mux_hrtimer_handler
      0.00            +0.2        0.16 ± 18%  perf-profile.self.cycles-pp.call_cpuidle
      0.00            +0.2        0.16 ± 18%  perf-profile.self.cycles-pp.update_sd_lb_stats
      0.00            +0.2        0.18 ± 22%  perf-profile.self.cycles-pp.irqentry_enter
      0.00            +0.2        0.18 ± 16%  perf-profile.self.cycles-pp.__update_blocked_fair
      0.00            +0.2        0.18 ± 21%  perf-profile.self.cycles-pp.cpuidle_governor_latency_req
      0.00            +0.2        0.18 ± 17%  perf-profile.self.cycles-pp.native_apic_mem_eoi
      0.00            +0.2        0.18 ± 20%  perf-profile.self.cycles-pp.timerqueue_del
      0.00            +0.2        0.18 ± 16%  perf-profile.self.cycles-pp.task_tick_mm_cid
      0.00            +0.2        0.20 ± 18%  perf-profile.self.cycles-pp.ct_kernel_exit_state
      0.00            +0.2        0.20 ± 26%  perf-profile.self.cycles-pp.copy_page_from_iter_atomic
      0.00            +0.2        0.21 ± 22%  perf-profile.self.cycles-pp._raw_spin_unlock_irqrestore
      0.00            +0.2        0.21 ± 23%  perf-profile.self.cycles-pp.perf_event_task_tick
      0.00            +0.2        0.21 ± 14%  perf-profile.self.cycles-pp.do_idle
      0.00            +0.2        0.22 ± 19%  perf-profile.self.cycles-pp.ct_kernel_enter
      0.00            +0.2        0.22 ± 20%  perf-profile.self.cycles-pp.pm_qos_read_value
      0.00            +0.2        0.22 ± 13%  perf-profile.self.cycles-pp._raw_spin_trylock
      0.00            +0.2        0.22 ± 20%  perf-profile.self.cycles-pp.leave_mm
      0.00            +0.2        0.22 ± 13%  perf-profile.self.cycles-pp.calc_global_load_tick
      0.00            +0.2        0.23 ± 14%  perf-profile.self.cycles-pp.load_balance
      0.00            +0.2        0.23 ± 19%  perf-profile.self.cycles-pp.get_next_timer_interrupt
      0.00            +0.2        0.23 ± 18%  perf-profile.self.cycles-pp.error_entry
      0.00            +0.2        0.24 ± 17%  perf-profile.self.cycles-pp.update_rq_clock_task
      0.00            +0.2        0.24 ± 12%  perf-profile.self.cycles-pp.x86_pmu_disable
      0.00            +0.2        0.24 ± 11%  perf-profile.self.cycles-pp.hrtimer_interrupt
      0.00            +0.2        0.24 ±  9%  perf-profile.self.cycles-pp.get_cpu_device
      0.00            +0.2        0.25 ± 17%  perf-profile.self.cycles-pp.tick_irq_enter
      0.00            +0.3        0.25 ± 13%  perf-profile.self.cycles-pp.rebalance_domains
      0.00            +0.3        0.26 ± 20%  perf-profile.self.cycles-pp.irq_work_tick
      0.00            +0.3        0.28 ± 19%  perf-profile.self.cycles-pp.rb_insert_color
      0.00            +0.3        0.28 ± 23%  perf-profile.self.cycles-pp.rb_erase
      0.00            +0.3        0.30 ± 22%  perf-profile.self.cycles-pp.tsc_verify_tsc_adjust
      0.00            +0.3        0.32 ± 14%  perf-profile.self.cycles-pp.nr_iowait_cpu
      0.00            +0.3        0.32 ± 22%  perf-profile.self.cycles-pp.check_cpu_stall
      0.00            +0.3        0.32 ± 12%  perf-profile.self.cycles-pp.rb_next
      0.00            +0.3        0.34 ± 32%  perf-profile.self.cycles-pp.__clear_extent_bit
      0.00            +0.3        0.34 ±  4%  perf-profile.self.cycles-pp.irqtime_account_process_tick
      0.00            +0.3        0.35 ± 20%  perf-profile.self.cycles-pp.ktime_get_update_offsets_now
      0.00            +0.4        0.35 ± 20%  perf-profile.self.cycles-pp.tick_nohz_next_event
      0.00            +0.4        0.38 ± 23%  perf-profile.self.cycles-pp.tick_sched_do_timer
      0.00            +0.4        0.38 ± 14%  perf-profile.self.cycles-pp.scheduler_tick
      0.00            +0.4        0.40 ± 17%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.00            +0.4        0.41 ± 10%  perf-profile.self.cycles-pp.timerqueue_add
      0.00            +0.4        0.41 ± 13%  perf-profile.self.cycles-pp.__intel_pmu_enable_all
      0.00            +0.4        0.43 ± 18%  perf-profile.self.cycles-pp.rcu_pending
      0.00            +0.4        0.44 ± 17%  perf-profile.self.cycles-pp.perf_rotate_context
      0.00            +0.4        0.44 ±  8%  perf-profile.self.cycles-pp.sysvec_apic_timer_interrupt
      0.00            +0.5        0.47 ± 23%  perf-profile.self.cycles-pp.kmem_cache_alloc
      0.00            +0.5        0.52 ± 10%  perf-profile.self.cycles-pp.__hrtimer_next_event_base
      0.00            +0.5        0.54 ±  9%  perf-profile.self.cycles-pp.read_tsc
      0.00            +0.5        0.54 ± 18%  perf-profile.self.cycles-pp.update_process_times
      0.00            +0.6        0.58 ± 13%  perf-profile.self.cycles-pp.tick_check_oneshot_broadcast_this_cpu
      0.00            +0.6        0.60 ±  9%  perf-profile.self.cycles-pp.__hrtimer_run_queues
      0.00            +0.6        0.61 ± 10%  perf-profile.self.cycles-pp.lapic_next_deadline
      0.00            +0.6        0.61 ±  8%  perf-profile.self.cycles-pp.run_posix_cpu_timers
      0.00            +0.6        0.62 ± 11%  perf-profile.self.cycles-pp.update_irq_load_avg
      0.00            +0.6        0.64 ±  5%  perf-profile.self.cycles-pp.native_sched_clock
      0.00            +0.7        0.66 ±  9%  perf-profile.self.cycles-pp.cpuidle_idle_call
      0.00            +0.7        0.75 ±  9%  perf-profile.self.cycles-pp.arch_scale_freq_tick
      0.00            +0.8        0.78 ± 14%  perf-profile.self.cycles-pp.ktime_get
      0.00            +0.9        0.90 ± 18%  perf-profile.self.cycles-pp.crc_pcl
      0.00            +0.9        0.93 ±  6%  perf-profile.self.cycles-pp._raw_spin_lock
     29.72 ± 28%     +28.5       58.26        perf-profile.self.cycles-pp.intel_idle



Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

