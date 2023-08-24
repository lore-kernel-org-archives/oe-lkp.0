Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167553D90
	for <oe-lkp@lists.linux.dev>; Thu, 24 Aug 2023 08:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692864019; x=1724400019;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=CbrA+HYGlfOKbvl6olr0Ybu3Qa1X2A+g3yYuEY6TdGA=;
  b=lRP3uptkgcPIiny1IQxtqzP4w+YacEsrWltUqdi03AKe6UNWqtwKtWYh
   HPnkKYHEff46LfXNKRSYoTG2pLxOoBYPrZssVzTvTHxMfv/6h2H8i19+8
   YA/+A0iSwhjyH8XXdycxWN5cUpp2jJNNsjK/ssEEHIt/Xc9ssU+sVagbW
   ggeuXkyO53wkKy//M0sURsdHVHZXa1vvBXyYpi65RQrU3crIRtfSmBWUm
   hDGhAwygUAiSmAevEHwsrJFB0e1frLpNMk4keg1G1zs85d7VUlfmpmucY
   dYeL941+D/oDz8VyrGZfMv2tpfaeGy6ViFYEW2VUxVrd2js3Rztj3bOJI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="378127262"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="378127262"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 01:00:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="910811676"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="910811676"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga005.jf.intel.com with ESMTP; 24 Aug 2023 01:00:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 24 Aug 2023 01:00:17 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 24 Aug 2023 01:00:17 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 24 Aug 2023 01:00:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jIrWGk6dm/fpcX1ItEiZmmD7CP/c6/iF58Xd8LrjRnFXXI4JYZFZJx0WQGGEBzVk8utiwuTylYz3IpDjazAGC9TU4TDKskb1ypGajGSNoe8A8mLY4Xvie2U6PU+gUMCLTB3ED4mvnHE4lMoWykWUj6MVjpgzFvz6o/RjAFkRlqwbxkW7OAe0q0LfcheTrsagq7x6JKE04t5rstDNDwe9HJvz2NwqIGrZgI18v211/8DJK/K2qFth9KZGmgMSuduZSxul3VRt98AfKqqKttftck4ChgBO3qon6jimCPWQBS9XYSGCI3kxiCxI33HpK9oVCDj3XjjVbrUR8xCfB4ahJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uaAT9WUZVUmgw6nf4U6UbbPOtPaJvSGh+Topp7/GAXs=;
 b=k15LKPLsRBcKETlCLVqYKP84dMrnhMi5y1uzUGVB/drjfF/97bP3KBqBlnHuVJhIsQfMaX9rWObHo7358FFqUvLtVYdGrM3uFR/v8rtBhNDu+6g9+rVKUqVEuQX+Jgu8HpxseWe6ZMyKAxOyMcBNkdLAbZBCdkGoqeiewFmDdgRASbkZIKnC9SUi0qEAvIL6qUw+gq820V3BOp0mM8chnlnVFvYzJD6JOsB/wSnb6K96r9zicvP6rvzf6usMhcLBe+6EvQbZ7b8yMXL28E8WMk8Q0+n3BVydmEyvJYbTEHFSIYwmslvZ4QfsM54QRXWawNtB0VgKRzGsufFybdh5WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by PH0PR11MB5095.namprd11.prod.outlook.com (2603:10b6:510:3b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 08:00:16 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::73c6:1231:e700:924]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::73c6:1231:e700:924%4]) with mapi id 15.20.6699.026; Thu, 24 Aug 2023
 08:00:15 +0000
Date: Thu, 24 Aug 2023 16:00:05 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [amir73il:start-write-safe] [splice]  d64418da1e:
 stress-ng.sendfile.ops_per_sec 4.4% improvement
Message-ID: <202308241559.bf924011-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KL1PR01CA0045.apcprd01.prod.exchangelabs.com
 (2603:1096:820:1::33) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|PH0PR11MB5095:EE_
X-MS-Office365-Filtering-Correlation-Id: c4532077-d0f7-4876-1d67-08dba47826a0
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gf4iOaQYjK5TxezyrWmwWqqE15YbQ8Vk5BID6X/9wtreOi1/mQQW7rCEllEtj5YTo8TEOsnTcCyoVHCA8QcDZciP2IpKpqYMUyFCSx/2b4TCfrntwwQzgMcNjtwlGfBz+ndt0eIow4xDhi3V+KPWrR7y4ho0n0F3b7r1hiFh1N3TpF6DWcS7v3jPEZQu1DLBM3ROL+MP214WJIS9aL9MvY5Cee9byC1Qr8G8SgM6+Y0bOy6zRw5jBL9UjOP1lGaeKpxcl2PBDAnhe+VzSkXdibVx/y+4rA2jlhXSy7RtI+XgH1vvjhL4G9U52PnsCoXiq1aR/bcHMJNmtHGGSYkvgLkCL+qT+9vJCqRwiJMHbg8J3pIs/zW+F3uK8oFEhANhurH6QDFkdrmLNSAfiJVnlW8YJHQr6bjdaKDUX5ji8zJ3T6Py8WZhdpQ04mQYy+BWLmwqSaVz8jfl8kAWp3wWBJ+HojiXfO39K7gcuh9MBl44S2IkxRLi3YNdqrRHcnJ9ss/1DKE7qgV3UosG4pZBaBxIGxy+BWXTNwMGEn3ONfZggj8Rvu9J4qP2LAfIQKdOOLP/Uy3tMV+dt9/9E1dTWg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(346002)(366004)(39860400002)(376002)(186009)(1800799009)(451199024)(2616005)(8936002)(4326008)(8676002)(83380400001)(5660300002)(107886003)(1076003)(36756003)(26005)(6666004)(38100700002)(82960400001)(66946007)(66556008)(66476007)(6916009)(316002)(478600001)(966005)(41300700001)(6512007)(2906002)(6486002)(86362001)(6506007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?A8yN81CtoBbOcI/OuRyg2MAkqx4YgEAJPK2JuurAUZPxRUadPyllIY6t8X?=
 =?iso-8859-1?Q?KCzYIvXv+dRTUPYDKQBiR5fpDimtmiHT9g/tvqWZEXP56Z7edRKzBaEeD8?=
 =?iso-8859-1?Q?9Q7wCLVvDaCtm6dCLZKzTmh4Z06s5TQvjdfZrYIGjv83oiI13aXW8VgAwQ?=
 =?iso-8859-1?Q?GibRth1hoGXs2PENW2e+KTaCg8/S9KL6tf8VDHopi3Y/768HgNSGwVHBYS?=
 =?iso-8859-1?Q?1The4g2QaESgt70Hs9DlZtNe0Yr8+Zn2wxakYVMSMb9BSQuGXltvNC7Kmc?=
 =?iso-8859-1?Q?AZ6ZfyxyhO3iZDFpOGSn3/+7rnlAIG5f4X/Lv8xp4N/xtJdULeNlutSga1?=
 =?iso-8859-1?Q?vqhk3YG8x0A7PQhDYUm65ZzlSnhOGkC2H2kUXQScKZVMxyf3SeJlhtbQkt?=
 =?iso-8859-1?Q?WaSlAmMJupbNanSxy97y+a5o5mOUHLeNaNzVcbsfe8IwRWnD/JbtpJcsEa?=
 =?iso-8859-1?Q?pAnvxD8NTb5I2/r/aDNgFpBBtqfinXz+Hgxkz/DBiJc8G7WTMpfF/aMFjg?=
 =?iso-8859-1?Q?DrDwsgwgRgraiabd9onwBXrAiFvDxKMOd29qg2PKVPxwGBXep9vQk9WQGa?=
 =?iso-8859-1?Q?OrSMKsawd1LyQ71mGpTAJSb/kFT/lbIcq4wF9JlvdrEnXcmRpW2qSOliMp?=
 =?iso-8859-1?Q?4LuDPATTVtbidCiEPLxsqcO3gRtqC7ZExAi8VMYcLiZrXRE4ekEGt2gwiT?=
 =?iso-8859-1?Q?Z+x33nXcg3ITn+1DeAKpN2jKHGu5ybFx+adLRBFuWIsYApyWP3JMlcX+hM?=
 =?iso-8859-1?Q?lLk2Z+xlYyrL5BbCmCLfUYCv8PZqxEY5RnJK20HJVqqGQYrcZi6xyBPT6q?=
 =?iso-8859-1?Q?coVyWhgYKpdj5+Xj0orVxGwh52NDeOHWRlXIT4M9Amv2e/+3iOyEAHwFOG?=
 =?iso-8859-1?Q?1JooH82RObGmEymZL7A6PgnXuIW2aocgX0b1xGrN0rA2tsCA1qxwgQEzfx?=
 =?iso-8859-1?Q?UNmGC77pnd7JxpgBrQSzt3Yr2sbvfXWHkzbZhTdm7rbwd+tN4Wesv2o2XA?=
 =?iso-8859-1?Q?+UrLpBazi4i5HGqJtxJnamkCV4CIsBMwkgDAMT2D6VJqFzrzNb6wgEWAHj?=
 =?iso-8859-1?Q?Ryeg1ds3QsExc1IOXOY0zVCL3Sx3o/1rkhpl1HKiL1OuGQwn1iR7CPecNF?=
 =?iso-8859-1?Q?HqyAxRSvRhC6KmZtUZmh7j28NKUARqqIJDdZxKdO41ANwiaOu2J18MPe2f?=
 =?iso-8859-1?Q?999YQJBjf0bPurNTTa2w2lVhc78mAvEOfXs+hIa1RQc9f91VDDfLblOvEd?=
 =?iso-8859-1?Q?dpSul2rFvmXBb/IVL3MXWXNybspkNhTZPzVrBaCcUdUYJwL0eWdRXhl7cQ?=
 =?iso-8859-1?Q?x3gKI9JFH6pEdrl9afqFmWgKn3JUAPdW2/m+hiMyzI6vr+/4kZQr3Ji6o5?=
 =?iso-8859-1?Q?9bGATO4BHFnpKPtM8hJNGMOw2gVQ4pguCi/VI1hbSnSHH4k0gq4b5dZ0Po?=
 =?iso-8859-1?Q?r1tcJnIzDnB6YnSH57FYX1oYDUDvUSj0BGN1wXRjPL6wqgeopRjLE5iHpf?=
 =?iso-8859-1?Q?pKzNP/P72X7JaQXl2jlGtaj6s06rizexW2puJ1c6QqNJUjI6jGtrOrr/EJ?=
 =?iso-8859-1?Q?rAgXFhjlF6NE3gXdodezWu2iZuLYHxWmRXfWxFbFb9fA51dCvjyNTscNxD?=
 =?iso-8859-1?Q?leIBUKxiQ3sPKW10i3lZR+gR5ybtCE8nNXATEy7lI413Yz2sQ4paV4VQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4532077-d0f7-4876-1d67-08dba47826a0
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 08:00:15.5002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fcLqJls26OeYKLaXShs97zSHk412pIoUSvyiqgUD+w+eN/Qlohcz1OXos2z+NjqkLer5BiNTiWwn/5+OgPGWmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5095
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 4.4% improvement of stress-ng.sendfile.ops_per_sec on:


commit: d64418da1ed5b07a2b6e58997aaa3ab0fed6b311 ("splice: move permission hook out of splice_direct_to_actor()")
https://github.com/amir73il/linux start-write-safe

testcase: stress-ng
test machine: 36 threads 1 sockets Intel(R) Core(TM) i9-10980XE CPU @ 3.00GHz (Cascade Lake) with 128G memory
parameters:

	nr_threads: 1
	testtime: 60s
	class: pipe
	test: sendfile
	cpufreq_governor: performance






Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20230824/202308241559.bf924011-oliver.sang@intel.com

=========================================================================================
class/compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  pipe/gcc-12/performance/x86_64-rhel-8.3/1/debian-11.1-x86_64-20220510.cgz/lkp-csl-d02/sendfile/stress-ng/60s

commit: 
  4ff22b2fb7 ("splice: remove permission hook from do_splice_direct()")
  d64418da1e ("splice: move permission hook out of splice_direct_to_actor()")

4ff22b2fb7d5bcc0 d64418da1ed5b07a2b6e58997aa 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      6022 ±  9%     -11.8%       5312 ±  2%  sched_debug.cpu.nr_switches.stddev
    794164 ±  2%      +4.7%     831533        perf-stat.i.iTLB-load-misses
    781755 ±  2%      +4.7%     818525        perf-stat.ps.iTLB-load-misses
     78788            +4.4%      82233        stress-ng.sendfile.MB_per_sec_sent_to_/dev/null
   1181084            +4.4%    1232690        stress-ng.sendfile.ops
     19684            +4.4%      20544        stress-ng.sendfile.ops_per_sec
      0.56 ±  9%      -0.1        0.42 ± 14%  perf-profile.children.cycles-pp.xas_descend
      0.00            +0.2        0.16 ± 27%  perf-profile.children.cycles-pp.do_splice_read
      0.10 ± 19%      +0.0        0.15 ± 17%  perf-profile.self.cycles-pp.rcu_all_qs
      0.00            +0.2        0.16 ± 27%  perf-profile.self.cycles-pp.do_splice_read




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

