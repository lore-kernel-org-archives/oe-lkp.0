Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D59158520
	for <oe-lkp@lists.linux.dev>; Fri, 29 Nov 2024 07:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732866041; cv=fail; b=Q87GB9nCZPxqGSeoU81f8UV+TW59Gg8DYmL2jyWu2XOb3qSpuEZDOck4oVcvknh9zLf7Oc+HO9euoBcvlgvH0Qp/Z3uL90v9cGc/+W5yIqs9lJiEuJD0bziorQgs1ZQGwA5gb4LDEjx5q+/z8aIJXnAfU0nDeABRsJmotVb+ARw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732866041; c=relaxed/simple;
	bh=yT50GFJMTPEd4rDOrwOqogORUdOAKFHQiYW3wUuE45E=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=f1XjuAjRwpDVDXSasgETjcxB+fIKlPIirTBkhGgd9zvL1dnK0fR4okH8oOhncpeWNyV7KgI7a4HpnpvRKYlNiKPjmYN8HFypBbbDumEBjsW2vhOrre7SO+wDaRGBzaXx1CagX6zgtbqjune1Mnlm9W5q65OK3/pKCj7Exj9ErLk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n47Z3KOe; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n47Z3KOe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732866038; x=1764402038;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yT50GFJMTPEd4rDOrwOqogORUdOAKFHQiYW3wUuE45E=;
  b=n47Z3KOelxpuapJm5ryFYcQSqoxcslpl8tW+pLFyYZH1bshXU3QQfZH+
   xto8bjcyBKKrfqRNzY/ou4PRJPGFdw3WmsjqvcIqHBlxe+TOn6NYBc/Bh
   2Mw02bVMBKTGJOMHtPXOs3IQbYuPaP5hUOuLbbzWpSlPn6U4gVUFxsMrz
   DdoaxbVV4u0Ikuh5gxUB6/dcpZgWxlKXBSABmctHWI70EJYWjjqI0DqqK
   JFo1zkmj7ks7ydmv6RC5Dh4ZFazOTuRIu+gaCuTeYI6o8WkgKl/NV06ix
   3ak3h+XIohYJkRIN3Vw5iZE0FNV5KZzH6x4xiwzDpklCAeSrnPcx/gF8+
   w==;
X-CSE-ConnectionGUID: +9ANwBRwS3qiJtvXYYVc1w==
X-CSE-MsgGUID: CNZ/zX1lTXSx+pe5XBfVtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="33029909"
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="33029909"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 23:40:38 -0800
X-CSE-ConnectionGUID: Ug+A0PEFRt6hSZBOBn+/Yg==
X-CSE-MsgGUID: x9SCRcFdQISpn/9gZhIp0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="92328779"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 28 Nov 2024 23:40:38 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 28 Nov 2024 23:40:37 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 28 Nov 2024 23:40:37 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 28 Nov 2024 23:40:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xF0PNiO6q/WvUXBaJTFSm77ZVYm8dWuFKBcewZkCtRjMgnN8c+8+fdOa+d2GvZhgeauKjvb3iGbn+KQU2S+fC2vH6e91xKzYkKjokK5kxic2bzIGUa240BCSimcIFteGs/yJ6kTj1WhzSRE6YHqQJhuwVuotPtv15R4Xp2uidWlR1udbAu0gEX3MLN9RHiNBUmPgdnH83Xkq3Le7Ca/QEmCTGwgem4RLyyZ6DGUEifq2ji0LbKTr0wNBsIHn6W1IemrTVnE3OK9QVJ8ZCoIMS0ArF0VGsZ7HiSiwqK7DpLDkFOFOd7/sBxYXUNSGwgghh6p1vx2YemjA88dDiwbb6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tRM8NafjTBOcoHKUg8M1meQVOam0zZLP20bpHstx4nM=;
 b=BrAonP6fTM8ypvOAnQL/Vhh7VabJyi5jhMHxrJMlabAi/KozpT14AkXvBZEMtfe4jLkOVIYDD5XyaPLslBIr2p4ZRLV4SNBnOXcjTz35FUdVx+bb9bJ9Rxvi27fLZAB3HtEXVlpLV/lM/Vn1wexye/he/4BCNs5CXXSNEOTcahiyLgGmcbtW6gitTmmnqXKvItK6oBFh6OwoLFEaJfjkZFB6ayhy2iRJ6zJm9eHSRYXxzT53jQpwg4HiVT3YXQ2I/rIOTCkweYF5IORYoYw/YK3sIQHYZgWOp1MOOf4Zv319nNtYeYtooksb2WKenodECqyENkm0Ufju6zR1PmtPig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CH3PR11MB7347.namprd11.prod.outlook.com (2603:10b6:610:14f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.15; Fri, 29 Nov
 2024 07:40:35 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%6]) with mapi id 15.20.8207.010; Fri, 29 Nov 2024
 07:40:35 +0000
Date: Fri, 29 Nov 2024 15:40:27 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Joel Fernandes <joel@joelfernandes.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [jfern:tick/remove-last-tick-compare]  e615c721a4:
 WARNING:at_kernel/time/tick-sched.c:#tick_nohz_restart_sched_tick
Message-ID: <202411291552.a79b898a-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0060.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::17) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CH3PR11MB7347:EE_
X-MS-Office365-Filtering-Correlation-Id: 65176f41-fcf3-4153-d8e7-08dd10491c4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?q3F+XTTxKgOY3VEEsglzhGgQorx66+w3KhJYmmCiwaFd2qJm9HEZbMC6uAWo?=
 =?us-ascii?Q?bIxC3Rdu2H50+8DuQU/28o92ChHKrnG/+Ipkud7zKYmbbWkZ+H/9VZ4TPMF6?=
 =?us-ascii?Q?6/TA/aZUxUm9RgzgjS7of9b9VgA5cFWIsEfMbNu9bbAK89c16CEC9wfbdkjn?=
 =?us-ascii?Q?Zo25FadXuHGjRjcUKzwZBIyQlOBmHvef8nm968eV0OVTIdoLqkD0InYuIUd9?=
 =?us-ascii?Q?YUpahmhfRI6Zpai02onfxMmn2JtgC+QEYwstYXRsOp5XzXDKxBWfThB2vRzI?=
 =?us-ascii?Q?HRCrTctOKM/weWIpdi0TIYbVjbhSQzqlk6ScQVOaa1yjJjM05y7KwIj/1Fjf?=
 =?us-ascii?Q?+ODC4hTTfWW98jZe37XDkCYxsjhqQ+t52kXMIA+mPTQP7pdmSSMv9Y63lQVR?=
 =?us-ascii?Q?HLiuk3m8mqJTxUCscNDmGhBDfhvROKylVXT7tyGN5o+QPQkWjOh+N9Y7gEXW?=
 =?us-ascii?Q?PwsK6ew1O4cz+P+mle9fhPP01/TTI1C2H6SE8P2hYl/sU86j9WTfCapQuSSn?=
 =?us-ascii?Q?UQE7u8Xya5lxuN120pNvsNkR4GChIcJXgARLXJ8LNaiGmU2CeeJk4MgppBgs?=
 =?us-ascii?Q?8/EK6llVCpII9xhQt+NWUe+BpqL5gA7adQFx+99U1Gh1s0m4mH2xRH6/TzE/?=
 =?us-ascii?Q?cPvc7B6sopk3hpVV5Rbg/jjI/k/03+EzbMriwWs7u4GX0avEbuaNfoBSWMmu?=
 =?us-ascii?Q?Pq7PKnk3pYeeiP0W2Dr7OwX27fsky+t5ASORKMdpZmInwpSLnGkJdhEbHuDB?=
 =?us-ascii?Q?lEjn7Ebi/SghOdWuRh4YyetRPXzbLxTCazXJRjrmFfBFoqMt7imIGCrOLaSS?=
 =?us-ascii?Q?8S6G5VK/Lp3iMOv1RUle41EaqCdT5BJFlUfD6D9yp79Xd1VM6GqETfdCChLa?=
 =?us-ascii?Q?bI5zZDbhABVXNFHmhuVtX3rNPX4SiIoQVQ71nHKD5aqtVP8bP/ZnS7Rm60KB?=
 =?us-ascii?Q?u6F6tHyTrYVpmk6qZad5E0gDF9ypgM+9Vy4/3StFSIYUzwSzvsnIgWqxnPvf?=
 =?us-ascii?Q?VS4GOmINSz2A+sdn0lRwg9FU3PD+CRFhos/5EMUgruroLBMAzx1fWsR8iSrH?=
 =?us-ascii?Q?5G3Q+3Y03owPYphZ+1XUdHLChpi0GVe/jIF2Gdly5SIoCJ4p2W87u+5K2i/P?=
 =?us-ascii?Q?y6okwIOBqOQlq+7lqtfy0JeJ8WcGSG9D7ZvqTEveaIl7Y+TX+RvEa7G02LXW?=
 =?us-ascii?Q?31r7e546n0CON3M2pbVseAsk+vSrJHS7nxlWN/+zjr5MLNU7sg6wIk4yb5l2?=
 =?us-ascii?Q?T+X3dLeQb24LuWp5ZuJBc1hTIWSkGghPV2sV27nvx2sDvZwrUI1Pc8tSZyQX?=
 =?us-ascii?Q?0xctdDNj820FIPmVQECBlNfp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Oc53hU4Q0eaaF1yktZYdY76GIl/Y9TdOUd0zoHxs3qVimY6Yuqe0V5+DTvA3?=
 =?us-ascii?Q?ZqfktBU5NkckB6Dy9UFRn4+Oh1iiN7CreDxocBVAT3e/7LEp3Rcv7AUezMVX?=
 =?us-ascii?Q?izbroWeVk5IgbnUtlZOF3IMfYyWUrN5bMdAe7OguFczWT4/G/MUnXeuAS+v2?=
 =?us-ascii?Q?tom958eh6E1INaT1hT4PtRwKRwKlkqrK/RpKbgh5jcAiPJ18e8od+1c8COT7?=
 =?us-ascii?Q?l0bzBh1cM0ijxiw3LmKvdiL6NaRrQSDYjZOwqud1f1oK8CpO0wa6MMrFVgbf?=
 =?us-ascii?Q?GzZJekaHmUUSNAX4bjy/DrwH1qvnOultbzDGYP5s0vKIPv+rxpLjuHRE5p+n?=
 =?us-ascii?Q?M0ruhPYoOvM3DRDxuRHijdH410Q+eeqKmD3EbJcTSzs2bFvtgqQ1UW5v3bxB?=
 =?us-ascii?Q?P/YR9Hs+mgQNHdExQoW1a5lsPb8L2io2eXK6fbZTgRr9PKfGbtM/Vz5g2dy2?=
 =?us-ascii?Q?fPCMvUe9Id5vTIeXRLrn/JfW7FnSlJv1TFyq+w4/SzNkHp684t5uq1f5x4KO?=
 =?us-ascii?Q?uRIQ5/4P0lUH4WLNeAV4rSY8I1uE+Wrqjn1MSy5bxm4IiBJF4lYf/GbEHk/9?=
 =?us-ascii?Q?Dgs6ZjlFgiiwqSw6OkSlLzGjgaF+doboQV0VtGrvlrJosG3/F2PtQd199VNc?=
 =?us-ascii?Q?Yc7i474j8BiPF5tNtIE1L16sYsxCZPCbebNFRSScNzSYvY5FJx6z9JYQSp7v?=
 =?us-ascii?Q?yZBAg6NMcPT7n1kuGFakuyL4IpORqp7AZowjMQJ/VWC1WwBg/EOw6/dvID67?=
 =?us-ascii?Q?jj4rtBzXQ539M7yxdUiH5bWTfrzH7VimvomlU/BXrblbs7zmESlo1nc/d7CU?=
 =?us-ascii?Q?T4KL21qSfu91jP99A1e7ykB/+45jr4zK7VLs9gD9IFrwPEfbYEhem/7Cu85X?=
 =?us-ascii?Q?emvSBCAR+UtTN+qLFtGycaE53h/R4kyCcgxJIltj1wil7Gq2glBpBeSZx/MB?=
 =?us-ascii?Q?RjK8Np7kOy91UNb9BVSlMCsSDbJ/5MzjpUOVsCGngr4ifUPp96ELIPcDKKjy?=
 =?us-ascii?Q?A+k+hszyd5GX+xMbwsBVzCrCMYGS6eu2Nf1TUwbrhnVLdH9iEclKCFKEeVE2?=
 =?us-ascii?Q?JQEJoKchYrRSefGGbG2/9BVGYGuNv4a6aO+vMq1jnzAlTVpqxOiWNs4qWFT5?=
 =?us-ascii?Q?4i60lqm4dlsG7Rwrj/PujyiiTRItCFLMIMpUNnNhhyDvMprFQeSCpIAV1mv7?=
 =?us-ascii?Q?htHS5Mcdya4lnGCeBwooj+TWh5QO7GLKa32rO0MrPbJgavv4rGdfy/Hn6jvC?=
 =?us-ascii?Q?3ZlN1mxvWV0yyGpfcihJMMK9Zf5cKl5w9X4r2MBdU3t2WL/l+6jfqGorjzaI?=
 =?us-ascii?Q?jsDOTLeJu7kyODLDW4MrAiDQiljmCPwiEqxkG3CNkFyXVWR+Y013GNE/Pjfb?=
 =?us-ascii?Q?OHSZZ86CWZwoRgv3as/ZZC8az8U/L/2Ui5bB2nrZw4xhiGztO1SRxJml3Fx/?=
 =?us-ascii?Q?bRzcu1vFUCfpePUgv4uTQhIRbNgU+m2NMDKj1dWlyefuTbR/CODaIoI78SRu?=
 =?us-ascii?Q?6d2cvnckZ+IyrbewsCEAwldx+aovNhLAU0nkxIVKUnRGkR3isXBO8Y0Eh4Lv?=
 =?us-ascii?Q?j29IfE+o0DIXgDjR2V/KnMdej2MH7hPaD5i1g8CqwImVfKDC9KnpC3POQyAw?=
 =?us-ascii?Q?tA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 65176f41-fcf3-4153-d8e7-08dd10491c4a
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2024 07:40:35.3179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H+HbrEDbVRw0HHsxdOcGHLk0WcQ2sOARq8FFYjhDemYNS9DTpPEJHBuDrA8BnwFxnWQQuapPLQ+nTsWYMAYa6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7347
X-OriginatorOrg: intel.com



Hello,

we are not sure the purpose of this commit, we just report this to you what
we observed in our tests. a WARN added in e615c721a4 hits. but we only captured
it once out of 8 runs.

51ca6cdd6d0ef665 e615c721a4296bfc7f22397e739
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :8           12%           1:8     dmesg.RIP:tick_nohz_restart_sched_tick
           :8           12%           1:8     dmesg.WARNING:at_kernel/time/tick-sched.c:#tick_nohz_restart_sched_tick

below full report just FYI.


kernel test robot noticed "WARNING:at_kernel/time/tick-sched.c:#tick_nohz_restart_sched_tick" on:

commit: e615c721a4296bfc7f22397e7391f10c224c7ba5 ("Add old code back to compare old with new code")
https://git.kernel.org/cgit/linux/kernel/git/jfern/linux.git tick/remove-last-tick-compare

in testcase: trinity
version: 
with following parameters:

	runtime: 300s
	group: group-04
	nr_groups: 5



config: x86_64-randconfig-016-20241109
compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202411291552.a79b898a-lkp@intel.com


[  445.712757][    T0] ------------[ cut here ]------------
[ 445.713411][ T0] WARNING: CPU: 1 PID: 0 at kernel/time/tick-sched.c:855 tick_nohz_restart_sched_tick (kernel/time/tick-sched.c:855 kernel/time/tick-sched.c:1116)
[  445.714445][    T0] Modules linked in:
[  445.714840][    T0] CPU: 1 PID: 0 Comm: swapper/1 Tainted: G        W          6.10.0-rc2-00832-ge615c721a429 #1
[  445.715718][    T0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 445.716609][ T0] RIP: 0010:tick_nohz_restart_sched_tick (kernel/time/tick-sched.c:855 kernel/time/tick-sched.c:1116)
[ 445.717242][ T0] Code: e1 ff ff eb 86 e8 b6 05 06 00 65 8b 05 3b 29 5c 53 85 c0 0f 84 cc fd ff ff e8 a2 05 06 00 0f 0b e9 c0 fd ff ff e8 96 05 06 00 <0f> 0b 48 8b 35 1d c7 e9 08 48 89 ea 4c 89 f9 48 8d 3d 00 00 00 00
All code
========
   0:	e1 ff                	loope  0x1
   2:	ff                   	(bad)
   3:	eb 86                	jmp    0xffffffffffffff8b
   5:	e8 b6 05 06 00       	call   0x605c0
   a:	65 8b 05 3b 29 5c 53 	mov    %gs:0x535c293b(%rip),%eax        # 0x535c294c
  11:	85 c0                	test   %eax,%eax
  13:	0f 84 cc fd ff ff    	je     0xfffffffffffffde5
  19:	e8 a2 05 06 00       	call   0x605c0
  1e:	0f 0b                	ud2
  20:	e9 c0 fd ff ff       	jmp    0xfffffffffffffde5
  25:	e8 96 05 06 00       	call   0x605c0
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	48 8b 35 1d c7 e9 08 	mov    0x8e9c71d(%rip),%rsi        # 0x8e9c750
  33:	48 89 ea             	mov    %rbp,%rdx
  36:	4c 89 f9             	mov    %r15,%rcx
  39:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 0x40

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	48 8b 35 1d c7 e9 08 	mov    0x8e9c71d(%rip),%rsi        # 0x8e9c726
   9:	48 89 ea             	mov    %rbp,%rdx
   c:	4c 89 f9             	mov    %r15,%rcx
   f:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 0x16
[  445.718917][    T0] RSP: 0018:ffffc9000018fdf8 EFLAGS: 00010046
[  445.719492][    T0] RAX: 0000000000000000 RBX: ffff8883ae5e8fa0 RCX: 0000000000000000
[  445.720191][    T0] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
[  445.720914][    T0] RBP: 00000067c2fd1f40 R08: 0000000000000000 R09: 0000000000000000
[  445.721634][    T0] R10: 0000000000000000 R11: 0000000000000000 R12: 1ffff92000031fc0
[  445.722331][    T0] R13: ffff8883ae5e8fb8 R14: ffff8883ae5e8fd0 R15: 00000067c30c6180
[  445.723044][    T0] FS:  0000000000000000(0000) GS:ffff8883ae400000(0000) knlGS:0000000000000000
[  445.723838][    T0] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  445.724441][    T0] CR2: 00007f5841900000 CR3: 000000013d74a000 CR4: 00000000000406b0
[  445.725164][    T0] Call Trace:
[  445.725490][    T0]  <TASK>
[ 445.725782][ T0] ? show_regs (arch/x86/kernel/dumpstack.c:479)
[ 445.726234][ T0] ? __warn (kernel/panic.c:693)
[ 445.726659][ T0] ? tick_nohz_restart_sched_tick (kernel/time/tick-sched.c:855 kernel/time/tick-sched.c:1116)
[ 445.727197][ T0] ? report_bug (lib/bug.c:180 lib/bug.c:219)
[ 445.727654][ T0] ? handle_bug (arch/x86/kernel/traps.c:239)
[ 445.728102][ T0] ? exc_invalid_op (arch/x86/kernel/traps.c:260 (discriminator 1))
[ 445.728558][ T0] ? asm_exc_invalid_op (arch/x86/include/asm/idtentry.h:621)
[ 445.729091][ T0] ? tick_nohz_restart_sched_tick (kernel/time/tick-sched.c:855 kernel/time/tick-sched.c:1116)
[ 445.729670][ T0] ? tick_nohz_restart_sched_tick (kernel/time/tick-sched.c:855 kernel/time/tick-sched.c:1116)
[ 445.730246][ T0] ? check_tick_dependency (kernel/time/tick-sched.c:1101)
[ 445.730788][ T0] ? kvm_clock_get_cycles (arch/x86/kernel/kvmclock.c:87)
[ 445.731315][ T0] ? ktime_get (kernel/time/timekeeping.c:854)
[ 445.731777][ T0] ? rcu_is_watching (include/linux/context_tracking.h:122 kernel/rcu/tree.c:724)
[ 445.732270][ T0] tick_nohz_idle_exit (kernel/time/tick-sched.c:1421 kernel/time/tick-sched.c:1456 kernel/time/tick-sched.c:1497)
[ 445.732772][ T0] do_idle (arch/x86/include/asm/current.h:49 include/linux/sched/idle.h:37 kernel/sched/idle.c:340)
[ 445.733198][ T0] cpu_startup_entry (kernel/sched/idle.c:423 (discriminator 1))
[ 445.733663][ T0] start_secondary (arch/x86/kernel/smpboot.c:279)
[ 445.734161][ T0] common_startup_64 (arch/x86/kernel/head_64.S:421)
[  445.734673][    T0]  </TASK>
[  445.734974][    T0] irq event stamp: 557590
[ 445.735391][ T0] hardirqs last enabled at (557589): default_idle_call (arch/x86/include/asm/irqflags.h:42 arch/x86/include/asm/irqflags.h:77 kernel/sched/idle.c:124)
[ 445.736270][ T0] hardirqs last disabled at (557590): tick_nohz_idle_exit (kernel/time/tick-sched.c:1481 (discriminator 1))
[ 445.737182][ T0] softirqs last enabled at (557494): handle_softirqs (arch/x86/include/asm/preempt.h:26 kernel/softirq.c:401 kernel/softirq.c:582)
[ 445.738101][ T0] softirqs last disabled at (557489): __irq_exit_rcu (kernel/softirq.c:589 kernel/softirq.c:428 kernel/softirq.c:637)
[  445.738965][    T0] ---[ end trace 0000000000000000 ]---



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241129/202411291552.a79b898a-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

