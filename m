Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0B0C2FE
	for <oe-lkp@lists.linux.dev>; Fri, 27 Oct 2023 07:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dPpQD40c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698392984; x=1729928984;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=1MF9G5tQhjVL0uCZIXC1FfX5Miu7H8xNpJ+PsfltFg0=;
  b=dPpQD40ca6xCgfctk3cUqhQIb0crB/+ZRJAoZWF7aCkZExb5KMAsxBJD
   jE8jDu0jccNP3nuwuQ3dS4dneZNOP+bKvl+FImBcsz3JEu9ZPY3QInrgk
   UkhvMjozdQdWMkCfSXaNL/8xhzBjtZnbNdcGQ16vjL6XySCrhtxT9PlLU
   L0G/0x8u22cFEOMiqkw2wTRPxzTgvn7qHOvS9t7WX/UsOsiWqSoRICHLJ
   swxT2pwz4r6Ad92Xw9H9liInEJ/ZbMQr9yN5XswoY+Xq7tVnKOb0YiUqp
   ty6r79o0T4z5t9vdHER96xg/6T+0ylbGwYpcT5MJLHoSwmC7moxXzZZPU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="372778571"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="372778571"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 00:49:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="763122489"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="763122489"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Oct 2023 00:49:41 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 27 Oct 2023 00:49:40 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 27 Oct 2023 00:49:40 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 27 Oct 2023 00:49:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NahEmG+9+M5H6Q4+CAwBWXsgW0vfFURGs/nvpIzzTLX6URee6iO9kbqlH4+DV16JaqPz2tQkWm3NdvuLeA1Tge/f+PabYA9+Y4aeoXIY4OvexMPa4bAXCGaPgWBaFHdFSea7dxJr9ujRigZ0myqd3H8FYOX+g8yNZJaCfInM6857W+wSIUTtvTrwtqsPKrgCp/XVR1hw0TKVTXzR8G+xPmyBlHLRHubRQGeiNwtb0cPrhBj+wpvEkKEqJ72rWfn1JxbljsVd16g/EMqBvkayB+HWlXvRlcs+CUaA52NyWopbdjZWKNEL0X2+GPomz+S8O7jGNh66DTLU8rVSICXEZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G161/Mz6FIwqs95Kr/6iEFwwyAwWbTXXbkkhHJ+LPnI=;
 b=jvO8hgN/+ZuiWtWDfHId7JgtP0RRpiUBjhDOuT426mv4CnttLtmpa5iwCsLaYnSPTuTxLPr99YuBUmqPLEIgGLkHWThBgoAfFopuTDgFzvn1M5BPOaEol26bqkRCtw3m7ci8bjqEWkJ5LwanEGMGaPUTJh1PpGckYJs3VEFWRxXMDYf5ogEve7ShCo7UqCj5T5eZJjiWVfA8pu39nTJBktbUT/XH/whYM3nCUaOg6ip6J1kPd9I3aVn4m0N8GD1MiAKb1rBHhXqrzDNtuXkq8D4hhEGfMOKn5hllVdNTdmejKf9CWQ7F/BWHxQIuWiC9FFKyKsCUfQU03nUtCQy3Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6308.namprd11.prod.outlook.com (2603:10b6:930:20::8)
 by BL1PR11MB5556.namprd11.prod.outlook.com (2603:10b6:208:314::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.23; Fri, 27 Oct
 2023 07:49:34 +0000
Received: from CY5PR11MB6308.namprd11.prod.outlook.com
 ([fe80::1dff:3afd:e685:103c]) by CY5PR11MB6308.namprd11.prod.outlook.com
 ([fe80::1dff:3afd:e685:103c%5]) with mapi id 15.20.6933.022; Fri, 27 Oct 2023
 07:49:33 +0000
Date: Fri, 27 Oct 2023 15:40:22 +0800
From: Feng Tang <feng.tang@intel.com>
To: "Sang, Oliver" <oliver.sang@intel.com>
CC: Vlastimil Babka <vbabka@suse.cz>, "oe-lkp@lists.linux.dev"
	<oe-lkp@lists.linux.dev>, lkp <lkp@intel.com>, Linux Memory Management List
	<linux-mm@kvack.org>, Jay Patel <jaypatel@linux.ibm.com>, "Huang, Ying"
	<ying.huang@intel.com>, "Yin, Fengwei" <fengwei.yin@intel.com>
Subject: Re: [linux-next:master] [mm/slub]  5886fc82b6:
 will-it-scale.per_process_ops -3.7% regression
Message-ID: <ZTtpZgliuj/9WTOb@feng-clx>
References: <202310202221.fdbcbe56-oliver.sang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202310202221.fdbcbe56-oliver.sang@intel.com>
X-ClientProxiedBy: KL1PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:820:d::16) To CY5PR11MB6308.namprd11.prod.outlook.com
 (2603:10b6:930:20::8)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6308:EE_|BL1PR11MB5556:EE_
X-MS-Office365-Filtering-Correlation-Id: 97b3250f-86fc-4c7f-3b49-08dbd6c14251
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WseDm8j6jpIyk4zZXC6MCMhuyU2gZ8k1Gu3J1WjgkfD7xDifYmUOvbDghXadBz+TYetYfsU/jcwJYKWBBTFFgk5/exUsh1La1Sw4D2b3TLDU8nKyovGDwVtj7+1F7haIcDkr2MXiKbBAXtI7XFPyMv9hA25GdkrFeOHfMkiSNhADgvwzscnOlKlbbCieIi/aC+ll1SqML3sUp5+v52ursIxFtdIICiSpCh4SKy2Uxf+zhPUUdbenOAL1B44TcS2lP9GeXEpac23xQ7UNeJFdyNfZW/HG2a6+vgrDzuXA79kO/Qsf8ZqpqyRodGa2mC4WWuIvRc4B/qxAtY3C3F0ysviiEq5BnCghSkzPsGeGugIh4ki6597edxF1LLfoluUMUjlIGyPeCGNlaTTyqmpBS57Zkz9adS5f2yeH4Gjml9vFLY82bt/2NiVNELSmvm4lEbRu4ykHEKjlbfBkzOygQ1LbiAdyL1C2yzesknA9jylwlxLiiCtgRfbogdaqOzqUP1PiAi5aNU5+qUNURRNVgHuCphJXjSvkd256a7rSIuXMaC3DvCPqdsqKDqd5fypgL833+4TwmBJ91N/AHwFArg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6308.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(136003)(346002)(396003)(39860400002)(366004)(376002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(38100700002)(83380400001)(6506007)(9686003)(6666004)(6512007)(33716001)(66946007)(54906003)(966005)(6486002)(107886003)(82960400001)(26005)(6636002)(478600001)(316002)(66556008)(66476007)(8936002)(6862004)(4326008)(5660300002)(41300700001)(2906002)(86362001)(44832011)(8676002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXl2QUdhSjFIRUlLMGs0R25VTUhpbnorYmRncjBzWXhmTFV1U0gvSjduZk1y?=
 =?utf-8?B?aXFPeGwzdTBYcFg0Nk8venRuUUdkblo4OTZkMUE1WVFaRktEMlVzTlk4VUFr?=
 =?utf-8?B?NVB3RnVnOGtEbE42eHVUamFkRzhsN3hBOWVUeGpyWjhFUkNKWW00R3RONTc2?=
 =?utf-8?B?VWJiK2drRDN6aWU2YWg3QjlkY1lZQ3VBQ3lFRkNsbFVaVHU1QnZRQVowYXB5?=
 =?utf-8?B?ZUxaMU9TSjlFQlFYdDQ5UWNVWGVJMC95TXVvZGY1TTBYQ2RWMU9lQUxuSU9B?=
 =?utf-8?B?dzlIL2ovUTFVSnRQTndVcDlvRFhWK3Y0VEMveDhzbGdEM3RiMGpZb1ZvRS9E?=
 =?utf-8?B?LzlaZWdWSm5sMnZwOGg2VmFqeFpFMk9DcitWZWhKdHZWQSsveFNiZjF1c0xM?=
 =?utf-8?B?SDM0d3V0emJ0VmQ5YjdibU1iSG5oZ0FrMHFtMEZXa3o5NzR5NktlWERMVU5q?=
 =?utf-8?B?RzVuMVBmb29ELzl1bExLaFZUMU5BeG5GZDA0Q3dEZklwcDBCamN3REttYUE3?=
 =?utf-8?B?UEdKVGJTR1pjNFV6d2VZa1k4MVlLWjVnazRmN3ZqcFFHVGo2ejRNQUNkYVBI?=
 =?utf-8?B?bnFFbmc4d0JIeG1aamtZdXhsdFpyVDRYa3IzaXByWk55UmprM3A4a09lbXpZ?=
 =?utf-8?B?VlRYK3A4a1lVbDZ0SVhCWGNGUS82WERwNHBGRmZzdFlFanBFWk5kWHBBYTV0?=
 =?utf-8?B?aC9Gc1RoUkI3N0NtYkZPaFhwVzdqdFJ3eVcwL0NVMVIzclhsUko4bDRMKzRv?=
 =?utf-8?B?NU1DZEJNSHA5RnY3STV4dUVya1ZwNURNUCtJbG5OMm5aMXN1RGw3YmVDYXJS?=
 =?utf-8?B?eWhMaFpyWVplWFpERXF5MVc4ekhEdXNBd3JhbFExSGtaZ3UxWnFZRVZUb2ZD?=
 =?utf-8?B?Tm03ZUFwa1hRZG9SQVM2ZldQZis4MTQ0SE1kUHNWejl2UVpzK3pqOGh1ZytY?=
 =?utf-8?B?eWY0bFlmdWkyaWhFbEYyV3FGMGdXc243OFlhRDR0emlGcXc2ZndnWEV4VXlr?=
 =?utf-8?B?VmViVmVtcVM4N0o4cWFpekNZdm1jb2NLb0dScHA0Z25kc0dzVElWT2UyUWFs?=
 =?utf-8?B?bXdVQXlWRGlobzkrUyt2endJdTE1eFpjYTVSTFo5ajVXbC9kcTliK0o2dEto?=
 =?utf-8?B?Q2JlU1dwbmlWY3F5eXhpQm95Nm5NTTVOc0NvWnRuZERlbmJBQWRjMndyeGpO?=
 =?utf-8?B?c3dHczdqaDVWYVhFNjVKMnJNN01XY1lTUjRFWjVRempnemloYkdjVDRSRlZx?=
 =?utf-8?B?dHh0WU96aGJGZGF4L1p4dDRicklPTyt6WjdWRGpMMWxQb1lCdHZ1YWMwUGM3?=
 =?utf-8?B?TmhSYk5vMDRxZy9SMEVIck9qSnQ5T2t2S2FKYUh6bDdTWE05WEpKTVB4a1dh?=
 =?utf-8?B?by9Vdk5jc2xvMDZwMDJRUk1yYVZGbjdVYzdUM3NrdFlDeGtmY3R0Y1pOd1lh?=
 =?utf-8?B?OUYxSVBqWGh3akxBVGFwTEUyekhwS2dqYkw2TElQZjEwL01zZk1ETStpQS9v?=
 =?utf-8?B?TG93dGY1MEY5aUU0NXA2VGNpOW5rVVo2V0w2WkxjTXdENGtieXYzUzdCNGlm?=
 =?utf-8?B?VUViaFd1UEFsUnZkY1R0Zzlud0VndE8xUzBIVzJKSzVhZWlsZVhIM2dIbFl4?=
 =?utf-8?B?K3ZNZFEyQ0pkRmJhd3FxZjd4elY0TGV6NUl3bWM1TnpiQmdPanpvS1dtSjBo?=
 =?utf-8?B?WWY5Q1VFbmw0SDBYNlBRVDRKTE8rUEdGc1BYUldiZUxzV245bjZRVlJ6ZjRE?=
 =?utf-8?B?MVJGWmYvMkloYXdlTkUydzlySm9ma3JJRUdVdlZUS3VqRGk3Wm96Tyt4d2Np?=
 =?utf-8?B?a0FoaGZ6SUpsUGZ1T0EvZTN2NUNSYjJ1ZVZEaDhRdUQ4ZGNUOEw5SzQ5QkNN?=
 =?utf-8?B?SWtmN1VLNkhlY3A4cjc1MWpMWnArODNhb1R5aExpeGthbDdKd2l5TjQ2VHNt?=
 =?utf-8?B?TDByS1JJMHVNZzRQejNZUElNcTNEb25TRUQ0K2V6b2lQN3dwRUhWZXMwejhZ?=
 =?utf-8?B?NW13bzdsQXlMYVZzZ3FwRXBkVjNRNi9WcXZYSHd3OXk4dkJFUUU0UnZUR0Zp?=
 =?utf-8?B?S3BUM25Ga01FY2xQTThjWk9hNkNoTjlzbkptZklUNTR0N1dqTWhoWEQ4dXFp?=
 =?utf-8?Q?AH0BPld1bNDHrjLjAv/0K+iYj?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97b3250f-86fc-4c7f-3b49-08dbd6c14251
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6308.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2023 07:49:33.8902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jczYTPoQZNQehFsJbtDlN/CQ5Xo3VoG/tOkAiro3HvpMXpr0Kz+66EJVD86beN58mERc6EQJlJjtQTxjPWi/PA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5556
X-OriginatorOrg: intel.com

On Fri, Oct 20, 2023 at 10:21:28PM +0800, Sang, Oliver wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed a -3.7% regression of will-it-scale.per_process_ops on:

I was surprised to see this initially, as I know this patch which
only affects the order of a few slabs in a certain size range, and
0Day has enabled the 64 bytes alignment for function address.

One only big difference of perf hot spot is

>      19.62            +1.9       21.54        perf-profile.self.cycles-pp.__fget_light

but its code flow and data doesn't have much to do with the commit.

I manually run the test case, and didn't see the affected slabs 
actively used by checking 'slabtop'

Then I hacked to move slub.c to a very late position when linking
kernel image, so that very few other kernel modules' alignment will
be affected, and the regression is gone.

So this seems to be another strange perf change caused by text code
alignment changes. similar to another recent case of MCE patch 
https://lore.kernel.org/lkml/202310111637.dee70328-oliver.sang@intel.com/

Thanks,
Feng

>
> 
> commit: 5886fc82b6e3166dd1ba876809888fc39028d626 ("mm/slub: attempt to find layouts up to 1/2 waste in calculate_order()")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> 
> testcase: will-it-scale
> test machine: 224 threads 4 sockets Intel(R) Xeon(R) Platinum 8380H CPU @ 2.90GHz (Cooper Lake) with 192G memory
> parameters:
> 
> 	nr_task: 50%
> 	mode: process
> 	test: poll2
> 	cpufreq_governor: performance
> 
> 
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202310202221.fdbcbe56-oliver.sang@intel.com
> 
> 
> Details are as below:
> -------------------------------------------------------------------------------------------------->
> 
> 
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20231020/202310202221.fdbcbe56-oliver.sang@intel.com
> 
> =========================================================================================
> compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
>   gcc-12/performance/x86_64-rhel-8.3/process/50%/debian-11.1-x86_64-20220510.cgz/lkp-cpl-4sp2/poll2/will-it-scale
> 
> commit: 
>   0fe2735d5e ("mm/slub: remove min_objects loop from calculate_order()")
>   5886fc82b6 ("mm/slub: attempt to find layouts up to 1/2 waste in calculate_order()")
> 
> 0fe2735d5e2e0060 5886fc82b6e3166dd1ba8768098 
> ---------------- --------------------------- 
>          %stddev     %change         %stddev
>              \          |                \  
>      28.08            +1.1%      28.40        boot-time.dhcp
>       6.17 ± 10%     -15.4%       5.22 ± 10%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
>       6.17 ± 10%     -15.4%       5.22 ± 10%  perf-sched.wait_time.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
>   98376568            -3.7%   94713387        will-it-scale.112.processes
>     878361            -3.7%     845654        will-it-scale.per_process_ops
>   98376568            -3.7%   94713387        will-it-scale.workload
>      81444            +4.8%      85370        proc-vmstat.nr_active_anon
>      85071            +4.8%      89137        proc-vmstat.nr_shmem
>      81444            +4.8%      85370        proc-vmstat.nr_zone_active_anon
>      79205            +3.8%      82205        proc-vmstat.pgactivate
>       5.18            -0.4        4.79 ±  2%  perf-profile.calltrace.cycles-pp.__fdget.do_poll.do_sys_poll.__x64_sys_poll.do_syscall_64
>       2.18            -0.2        2.03 ±  2%  perf-profile.calltrace.cycles-pp.__check_object_size.do_sys_poll.__x64_sys_poll.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       2.29            -0.1        2.19        perf-profile.calltrace.cycles-pp.__entry_text_start.__poll
>       0.83            -0.1        0.76 ±  3%  perf-profile.calltrace.cycles-pp.__check_heap_object.__check_object_size.do_sys_poll.__x64_sys_poll.do_syscall_64
>       0.90            -0.1        0.84 ±  2%  perf-profile.calltrace.cycles-pp.check_heap_object.__check_object_size.do_sys_poll.__x64_sys_poll.do_syscall_64
>       0.66 ±  2%      -0.1        0.61 ±  2%  perf-profile.calltrace.cycles-pp.__virt_addr_valid.check_heap_object.__check_object_size.do_sys_poll.__x64_sys_poll
>       0.66            -0.0        0.61 ±  3%  perf-profile.calltrace.cycles-pp.kfree.do_sys_poll.__x64_sys_poll.do_syscall_64.entry_SYSCALL_64_after_hwframe
>      47.75            +1.3       49.07        perf-profile.calltrace.cycles-pp.do_poll.do_sys_poll.__x64_sys_poll.do_syscall_64.entry_SYSCALL_64_after_hwframe
>      22.63            +2.1       24.74        perf-profile.calltrace.cycles-pp.__fget_light.do_poll.do_sys_poll.__x64_sys_poll.do_syscall_64
>       5.17            -0.4        4.78 ±  2%  perf-profile.children.cycles-pp.__fdget
>       2.35            -0.2        2.18 ±  2%  perf-profile.children.cycles-pp.__check_object_size
>       0.84            -0.1        0.77 ±  3%  perf-profile.children.cycles-pp.__check_heap_object
>       1.48            -0.1        1.41        perf-profile.children.cycles-pp.__entry_text_start
>       0.94            -0.1        0.87 ±  2%  perf-profile.children.cycles-pp.check_heap_object
>       1.57            -0.1        1.51 ±  2%  perf-profile.children.cycles-pp.__kmalloc
>       0.68 ±  2%      -0.1        0.63        perf-profile.children.cycles-pp.__virt_addr_valid
>       0.66            -0.0        0.61 ±  3%  perf-profile.children.cycles-pp.kfree
>       0.83            -0.0        0.79 ±  2%  perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
>      22.29            +1.7       24.01        perf-profile.children.cycles-pp.__fget_light
>      48.12            +1.7       49.84        perf-profile.children.cycles-pp.do_poll
>       7.66            -0.4        7.22        perf-profile.self.cycles-pp.do_sys_poll
>       2.58 ±  2%      -0.2        2.38 ±  2%  perf-profile.self.cycles-pp.__fdget
>       2.23            -0.1        2.12 ±  2%  perf-profile.self.cycles-pp._copy_from_user
>       1.07 ±  3%      -0.1        0.98 ±  2%  perf-profile.self.cycles-pp.__poll
>       0.84            -0.1        0.77 ±  2%  perf-profile.self.cycles-pp.__check_heap_object
>       0.66 ±  2%      -0.1        0.61 ±  2%  perf-profile.self.cycles-pp.__virt_addr_valid
>       0.65            -0.0        0.61 ±  3%  perf-profile.self.cycles-pp.kfree
>       0.80            -0.0        0.76 ±  2%  perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
>       0.67 ±  2%      -0.0        0.64        perf-profile.self.cycles-pp.__entry_text_start
>      19.62            +1.9       21.54        perf-profile.self.cycles-pp.__fget_light
>  2.225e+11            -3.7%  2.143e+11        perf-stat.i.branch-instructions
>  5.573e+08            -3.2%  5.393e+08        perf-stat.i.branch-misses
>    2332742 ±  2%      -6.6%    2179079        perf-stat.i.cache-misses
>   13799351            -3.9%   13256775        perf-stat.i.cache-references
>       0.32            +5.0%       0.34        perf-stat.i.cpi
>  3.863e+11            +1.2%  3.908e+11        perf-stat.i.cpu-cycles
>     174616 ±  3%      +9.1%     190529 ±  2%  perf-stat.i.cycles-between-cache-misses
>  2.777e+11            -3.7%  2.675e+11        perf-stat.i.dTLB-loads
>  1.689e+11            -3.7%  1.627e+11        perf-stat.i.dTLB-stores
>   50719249            -2.8%   49295350        perf-stat.i.iTLB-load-misses
>    2674672           -14.5%    2285560        perf-stat.i.iTLB-loads
>  1.206e+12            -3.7%  1.161e+12        perf-stat.i.instructions
>       3.12            -4.8%       2.97        perf-stat.i.ipc
>       1.24            -4.0%       1.19        perf-stat.i.metric.G/sec
>       1.72            +1.1%       1.74        perf-stat.i.metric.GHz
>      76.66            -5.6%      72.34        perf-stat.i.metric.K/sec
>       1743            -3.5%       1683        perf-stat.i.metric.M/sec
>     594324            -2.9%     576831        perf-stat.i.node-load-misses
>       0.32            +5.0%       0.34        perf-stat.overall.cpi
>     165074 ±  2%      +8.2%     178683        perf-stat.overall.cycles-between-cache-misses
>       3.12            -4.8%       2.97        perf-stat.overall.ipc
>  2.217e+11            -3.7%  2.135e+11        perf-stat.ps.branch-instructions
>  5.554e+08            -3.2%  5.375e+08        perf-stat.ps.branch-misses
>    2333651 ±  2%      -6.6%    2179985        perf-stat.ps.cache-misses
>   13948192            -3.9%   13410551        perf-stat.ps.cache-references
>  3.849e+11            +1.2%  3.894e+11        perf-stat.ps.cpu-cycles
>  2.767e+11            -3.7%  2.665e+11        perf-stat.ps.dTLB-loads
>  1.683e+11            -3.7%  1.621e+11        perf-stat.ps.dTLB-stores
>   50558427            -2.8%   49131845        perf-stat.ps.iTLB-load-misses
>    2664632           -14.5%    2276961 ±  2%  perf-stat.ps.iTLB-loads
>  1.201e+12            -3.7%  1.157e+12        perf-stat.ps.instructions
>     592459            -2.9%     575320        perf-stat.ps.node-load-misses
>  3.621e+14            -3.6%  3.492e+14        perf-stat.total.instructions
