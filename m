Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2737E1A29D
	for <oe-lkp@lists.linux.dev>; Fri, 20 Oct 2023 14:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cBWC+4Fq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697811702; x=1729347702;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=HwPqNee0Aq14r7GmElVUppBycRDsZSDbVsGrD1HkA4c=;
  b=cBWC+4FqeJat+pRnPW88/4ajUn0Bcyk02DxGpVJGtW3CDytw0zneut6E
   yi4olyftzHd06zBfuFixImJJuQJX0kOeaKC3PFX7xb04E0nruSbnoaPO0
   U3E8RwtySF8cF4sBkJIj46DYYOeabR7ehypGreFnOsk8759bAGMvmvnPe
   CZ4YaZs+vDkJ2Thw+zVLrgr0nugYOeWIvjgOw8piX8dJiRQIbIn9GOMqq
   L9QVufvjl6Lym5FNL5tFdw5dB5vWLC6ubE9+MCkUcorgpV+v4mG/2r3Kx
   g78u/pzPYUxaYJWtN4TCS2HfdNMks/EQQD0bQW3yCDW99yvyJD4ff3Kl4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="390388333"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="390388333"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 07:21:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="750937242"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="750937242"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Oct 2023 07:21:41 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 20 Oct 2023 07:21:40 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 20 Oct 2023 07:21:40 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 20 Oct 2023 07:21:40 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 20 Oct 2023 07:21:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JlnErvz5JCPmvdZiAjDKog/Dn6Zwr+61Igc4EVut69kXqNXa/PlgbEYXWvYCV9BIvyMRGD/Rc8g6nlKDr45dpqDzVSgrUSTYIT2StwVaE86N4WlHxskX5cXJQUcFxuybbj4RZ2LjHhtQU5soBWdiWFQyxEqrDeFoXGb9Y9Ii85pThJ4vhOE9JY0rirAhNZff2pIIHtrrYIBnbBg7Yh7HxRrX2ZOPK1QBuRrf45DGPVdkCFH9ImSrJs598LT54iQwg5H7PbRe78DqsY1TnIi9951cxiyEyOmepzBHqs9L5x0oO0+hBS6zJ8M6RfQXLj6FBV88zqht1vXuA6Yip82DYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EDFqGc5ZmYqm4YFOsYysGXxix4aNyLKoZIm/XdpGOPc=;
 b=Xeoj2uXcXotlNiwiaoz4tlQTr3oQnRj0ClRqGX2NaZKlTlCC8bkX6o5N5kPNiRev/Wrm9HVpbsgQr4voAyOg3sOWcXBpLh7vKUJt9clpu5JkSzcb4oRVSpd6wsmKnQyOJx/ma9FXktN/5zAWmEFW7BV5DQt6KW8KdNJOC2TCHJXvS5KIwdGj+b182WE6YhuDzGWimXg11D4JLpvPazVmB+pZW6CDLNQqGa+HBY67owkkUmPmsiQ9ccv/QeAVBTErDhY9tc+jdVZU71VoWOgZLp5y7wmlQRgXouePR8tuysEvhHzw+4XlafjYioTXCeiW116KaYb9r7AjDSCsmNhflA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by DM4PR11MB5439.namprd11.prod.outlook.com (2603:10b6:5:39b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Fri, 20 Oct
 2023 14:21:37 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::134a:412c:eb02:ae17]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::134a:412c:eb02:ae17%5]) with mapi id 15.20.6863.046; Fri, 20 Oct 2023
 14:21:37 +0000
Date: Fri, 20 Oct 2023 22:21:28 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Linux Memory Management List
	<linux-mm@kvack.org>, Feng Tang <feng.tang@intel.com>, Jay Patel
	<jaypatel@linux.ibm.com>, <ying.huang@intel.com>, <fengwei.yin@intel.com>,
	<oliver.sang@intel.com>
Subject: [linux-next:master] [mm/slub]  5886fc82b6:
 will-it-scale.per_process_ops -3.7% regression
Message-ID: <202310202221.fdbcbe56-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KL1P15301CA0051.APCP153.PROD.OUTLOOK.COM
 (2603:1096:820:3d::23) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|DM4PR11MB5439:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cca47bb-7dbf-483b-aa3b-08dbd177dea4
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mzc6UMF78cAzXSVVCUw2ouZYvtXFgjb7XqKlqbPVkUBGtntZJJWnSaDzKklDBr5g8NpAuvHzWAlmhT769BKdSF2bPplWbGA4NPg5SOOExrC5IGxoCU+cIs9DtEgZJR924WtyctQz1pTvtmxNLR7PRGzmDgoFMLzqVR2434R4BAABr71obBFjsUHTkFUX1mPRW55FmAzNOT+WgO8zmNumOAqwYDXBQvo1QKmghhLvauyYnNKHR9MCObWruKoPV8j1gSa6aCY5A7cstitVKTPvhXmkR8CTO1jNuFSwZGChAOba8lQGS1Ni2tGLqx4oJhpJggdozhPp1i2c9VuN7s5s7JaatdMod+mO34mJIQbDdzeLpS+E/ETwPDCAtS9xcGPQraLD+0obgAlVGAjlxmbwYcPqIjTq6orJnKI+anmjhsjAdbQsYlSK0Z/hsSRA2DT9pkgowVzVV0gOTSMv9qQSwRpADGOIt5sAXJYHwDmOFGQTFrTB4uVfu6K0mCWBttcADec0+La9WOqqQ4xG3Az1DBRnZypw4vliCE/dgGye3rvVuoL3vQa7QZT3BLigziDyV77Ap4Xi4iNun23xt7AcuA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(376002)(396003)(366004)(346002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(6512007)(966005)(6486002)(6916009)(66556008)(66946007)(54906003)(316002)(26005)(107886003)(1076003)(86362001)(83380400001)(38100700002)(2616005)(66476007)(36756003)(82960400001)(478600001)(2906002)(5660300002)(6506007)(41300700001)(8936002)(8676002)(6666004)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?dlT5eFUU1MyW3cXjmMyrOnHxCCisiPlyKu/Zz8W8B9isJOyj1OGesd7dM/?=
 =?iso-8859-1?Q?Gc0K4X/7MRr4Vo70oDjPCrMuQchxBzH/4FKMByXPG8E92Zu8DjzRYP6zDw?=
 =?iso-8859-1?Q?xMPm1ogdC66E5bMpRVnWEFBUVYHKje18WuP1kJRKdww/1Rv+bbeSkJolLW?=
 =?iso-8859-1?Q?4RqV4lSpH8vRCCIelJsF5S3PJ2CSmWkjDk/BhlEPtJ9FCJ9loLFYGmpc2S?=
 =?iso-8859-1?Q?rOuWk/IZoZlKXNema7WEd45I2094hPJ4LlF3JU97le0oCYe2lmtAgscIU8?=
 =?iso-8859-1?Q?XUl/b93FyAOY5SQyEnGfrPY8K5y4rhcH1qCBUxz6eiam5zQyAsFakYO0He?=
 =?iso-8859-1?Q?mti1ZxS7vxFsHN6nC1QKP+4l1xMMBtuAGLGGEn6orK3qwT6QAvkvIygFwf?=
 =?iso-8859-1?Q?yoxOBZyzqBW0XDZOqex3L7uLVJwfYWxiby2/URj5Atwvy8XzgrIsscB27C?=
 =?iso-8859-1?Q?aKRJ3VsYi7xWuyVk0BuV+dxP/JZUO+Lz+rd8Of6XT8pj82dGeQ+5f5xysE?=
 =?iso-8859-1?Q?oqphvgHeuPRk+thHRa25oPxdOtspjQ86i32x8aFNtYvZqePaOho/5qRQxX?=
 =?iso-8859-1?Q?upco8vwFYBF34jU+NQQeN8vLXWjMeE9YK1bVN2mFZt10vwstixFw8BZkrP?=
 =?iso-8859-1?Q?C9DkEkWXZsKYtvDKtZqKzusr4al3EFgqV2s+sZrbfoYjS1t0Y4Mvf5mUlZ?=
 =?iso-8859-1?Q?DVu1c9SFgdv5QrrwgO0M+Gy6TVNQu74gQhAVNlsdN/ob8QACvO8iP2rygD?=
 =?iso-8859-1?Q?wJBHrGad6dZyv70ds/BIfoXBleiaHqxlSFIav/xtS0vm6mRw/elnwRF5Ld?=
 =?iso-8859-1?Q?+0esnOTiRlEO2fEEixVOOjKaNP1Bxq2GWKA0ndptOr26hTEngMzoNjGW1z?=
 =?iso-8859-1?Q?D2IPxjWjYgRlUBcRTs7Dur1qFdqxJzYersooQLnjVvVrLIL7UOXE3ADP9R?=
 =?iso-8859-1?Q?spzvREnvHrgOws81HSUdkbesHI0Sq5IjXGfusT/XHATFS7wH7RsNDvDMbF?=
 =?iso-8859-1?Q?7Z0fduJsrbOMdmH2f/ZOXc8zomUk20VNRI+AtDuHnFwN9mMkFX69dsQlNT?=
 =?iso-8859-1?Q?fESsGR7GCmF7eRRwCR6PsuV3MtbZk110apPsdE/zToX/WMJlYh9DWAA50d?=
 =?iso-8859-1?Q?34F1aSAbZLxXWG0iHXYWyfkGGL8vMsDci3vyKRcZHPYJj0ZoHG+DqEEWGZ?=
 =?iso-8859-1?Q?Xcpij3oUXhwD23nqbbgnondhK37LMSfpbaGlR7F1rl8eaItNpF3GItEl5R?=
 =?iso-8859-1?Q?LWPrVsmmy4ATEGlBFF3eg+/xCIzMy9AmXsXkqlqKD3bku16A56pDrPeRMV?=
 =?iso-8859-1?Q?xffKIW/t9Vvqvdjp95+KVctGnbmQau2GDOaDo3//jMICoiz65le35mPovT?=
 =?iso-8859-1?Q?/23WyYdYsgPF1h7EtqaPYScYs9HiDDwPjioJAanKSWJp6citFZO+v5lFHd?=
 =?iso-8859-1?Q?6n411AL6Rjcvy/K1RGhr1N8Sjer02oJB3VFoq9z+hCK+dra1azAkHLHH6Q?=
 =?iso-8859-1?Q?wAZLs0Q6OdbmVsfF+DjMeKMiptH/0ZNg1I1KEtJrmFhe8ZkXAI74i3XnYW?=
 =?iso-8859-1?Q?yUSmJBMUw4vuav3KVuVin78krO1eUfBRKJpXls02sFJg0R9Mf8TjQlJJl7?=
 =?iso-8859-1?Q?zN9j9p8cv+XxDupzpYK6fjoZf4xVOhwxzr47sryTTc3vCucR2Ky+YhMg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cca47bb-7dbf-483b-aa3b-08dbd177dea4
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 14:21:37.4549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J4d2NonwVUzq931qL3KqcycXMD8Q4TQqJx+q2CpsA9MGtDymfBuO+TXj+CI7k2jTCOscQ0mJ8LECSVHkzev4FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5439
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a -3.7% regression of will-it-scale.per_process_ops on:


commit: 5886fc82b6e3166dd1ba876809888fc39028d626 ("mm/slub: attempt to find layouts up to 1/2 waste in calculate_order()")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

testcase: will-it-scale
test machine: 224 threads 4 sockets Intel(R) Xeon(R) Platinum 8380H CPU @ 2.90GHz (Cooper Lake) with 192G memory
parameters:

	nr_task: 50%
	mode: process
	test: poll2
	cpufreq_governor: performance




If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202310202221.fdbcbe56-oliver.sang@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20231020/202310202221.fdbcbe56-oliver.sang@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-8.3/process/50%/debian-11.1-x86_64-20220510.cgz/lkp-cpl-4sp2/poll2/will-it-scale

commit: 
  0fe2735d5e ("mm/slub: remove min_objects loop from calculate_order()")
  5886fc82b6 ("mm/slub: attempt to find layouts up to 1/2 waste in calculate_order()")

0fe2735d5e2e0060 5886fc82b6e3166dd1ba8768098 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     28.08            +1.1%      28.40        boot-time.dhcp
      6.17 ± 10%     -15.4%       5.22 ± 10%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      6.17 ± 10%     -15.4%       5.22 ± 10%  perf-sched.wait_time.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
  98376568            -3.7%   94713387        will-it-scale.112.processes
    878361            -3.7%     845654        will-it-scale.per_process_ops
  98376568            -3.7%   94713387        will-it-scale.workload
     81444            +4.8%      85370        proc-vmstat.nr_active_anon
     85071            +4.8%      89137        proc-vmstat.nr_shmem
     81444            +4.8%      85370        proc-vmstat.nr_zone_active_anon
     79205            +3.8%      82205        proc-vmstat.pgactivate
      5.18            -0.4        4.79 ±  2%  perf-profile.calltrace.cycles-pp.__fdget.do_poll.do_sys_poll.__x64_sys_poll.do_syscall_64
      2.18            -0.2        2.03 ±  2%  perf-profile.calltrace.cycles-pp.__check_object_size.do_sys_poll.__x64_sys_poll.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.29            -0.1        2.19        perf-profile.calltrace.cycles-pp.__entry_text_start.__poll
      0.83            -0.1        0.76 ±  3%  perf-profile.calltrace.cycles-pp.__check_heap_object.__check_object_size.do_sys_poll.__x64_sys_poll.do_syscall_64
      0.90            -0.1        0.84 ±  2%  perf-profile.calltrace.cycles-pp.check_heap_object.__check_object_size.do_sys_poll.__x64_sys_poll.do_syscall_64
      0.66 ±  2%      -0.1        0.61 ±  2%  perf-profile.calltrace.cycles-pp.__virt_addr_valid.check_heap_object.__check_object_size.do_sys_poll.__x64_sys_poll
      0.66            -0.0        0.61 ±  3%  perf-profile.calltrace.cycles-pp.kfree.do_sys_poll.__x64_sys_poll.do_syscall_64.entry_SYSCALL_64_after_hwframe
     47.75            +1.3       49.07        perf-profile.calltrace.cycles-pp.do_poll.do_sys_poll.__x64_sys_poll.do_syscall_64.entry_SYSCALL_64_after_hwframe
     22.63            +2.1       24.74        perf-profile.calltrace.cycles-pp.__fget_light.do_poll.do_sys_poll.__x64_sys_poll.do_syscall_64
      5.17            -0.4        4.78 ±  2%  perf-profile.children.cycles-pp.__fdget
      2.35            -0.2        2.18 ±  2%  perf-profile.children.cycles-pp.__check_object_size
      0.84            -0.1        0.77 ±  3%  perf-profile.children.cycles-pp.__check_heap_object
      1.48            -0.1        1.41        perf-profile.children.cycles-pp.__entry_text_start
      0.94            -0.1        0.87 ±  2%  perf-profile.children.cycles-pp.check_heap_object
      1.57            -0.1        1.51 ±  2%  perf-profile.children.cycles-pp.__kmalloc
      0.68 ±  2%      -0.1        0.63        perf-profile.children.cycles-pp.__virt_addr_valid
      0.66            -0.0        0.61 ±  3%  perf-profile.children.cycles-pp.kfree
      0.83            -0.0        0.79 ±  2%  perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
     22.29            +1.7       24.01        perf-profile.children.cycles-pp.__fget_light
     48.12            +1.7       49.84        perf-profile.children.cycles-pp.do_poll
      7.66            -0.4        7.22        perf-profile.self.cycles-pp.do_sys_poll
      2.58 ±  2%      -0.2        2.38 ±  2%  perf-profile.self.cycles-pp.__fdget
      2.23            -0.1        2.12 ±  2%  perf-profile.self.cycles-pp._copy_from_user
      1.07 ±  3%      -0.1        0.98 ±  2%  perf-profile.self.cycles-pp.__poll
      0.84            -0.1        0.77 ±  2%  perf-profile.self.cycles-pp.__check_heap_object
      0.66 ±  2%      -0.1        0.61 ±  2%  perf-profile.self.cycles-pp.__virt_addr_valid
      0.65            -0.0        0.61 ±  3%  perf-profile.self.cycles-pp.kfree
      0.80            -0.0        0.76 ±  2%  perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.67 ±  2%      -0.0        0.64        perf-profile.self.cycles-pp.__entry_text_start
     19.62            +1.9       21.54        perf-profile.self.cycles-pp.__fget_light
 2.225e+11            -3.7%  2.143e+11        perf-stat.i.branch-instructions
 5.573e+08            -3.2%  5.393e+08        perf-stat.i.branch-misses
   2332742 ±  2%      -6.6%    2179079        perf-stat.i.cache-misses
  13799351            -3.9%   13256775        perf-stat.i.cache-references
      0.32            +5.0%       0.34        perf-stat.i.cpi
 3.863e+11            +1.2%  3.908e+11        perf-stat.i.cpu-cycles
    174616 ±  3%      +9.1%     190529 ±  2%  perf-stat.i.cycles-between-cache-misses
 2.777e+11            -3.7%  2.675e+11        perf-stat.i.dTLB-loads
 1.689e+11            -3.7%  1.627e+11        perf-stat.i.dTLB-stores
  50719249            -2.8%   49295350        perf-stat.i.iTLB-load-misses
   2674672           -14.5%    2285560        perf-stat.i.iTLB-loads
 1.206e+12            -3.7%  1.161e+12        perf-stat.i.instructions
      3.12            -4.8%       2.97        perf-stat.i.ipc
      1.24            -4.0%       1.19        perf-stat.i.metric.G/sec
      1.72            +1.1%       1.74        perf-stat.i.metric.GHz
     76.66            -5.6%      72.34        perf-stat.i.metric.K/sec
      1743            -3.5%       1683        perf-stat.i.metric.M/sec
    594324            -2.9%     576831        perf-stat.i.node-load-misses
      0.32            +5.0%       0.34        perf-stat.overall.cpi
    165074 ±  2%      +8.2%     178683        perf-stat.overall.cycles-between-cache-misses
      3.12            -4.8%       2.97        perf-stat.overall.ipc
 2.217e+11            -3.7%  2.135e+11        perf-stat.ps.branch-instructions
 5.554e+08            -3.2%  5.375e+08        perf-stat.ps.branch-misses
   2333651 ±  2%      -6.6%    2179985        perf-stat.ps.cache-misses
  13948192            -3.9%   13410551        perf-stat.ps.cache-references
 3.849e+11            +1.2%  3.894e+11        perf-stat.ps.cpu-cycles
 2.767e+11            -3.7%  2.665e+11        perf-stat.ps.dTLB-loads
 1.683e+11            -3.7%  1.621e+11        perf-stat.ps.dTLB-stores
  50558427            -2.8%   49131845        perf-stat.ps.iTLB-load-misses
   2664632           -14.5%    2276961 ±  2%  perf-stat.ps.iTLB-loads
 1.201e+12            -3.7%  1.157e+12        perf-stat.ps.instructions
    592459            -2.9%     575320        perf-stat.ps.node-load-misses
 3.621e+14            -3.6%  3.492e+14        perf-stat.total.instructions




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

