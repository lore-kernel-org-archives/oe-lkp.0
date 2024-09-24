Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3CD8C07
	for <oe-lkp@lists.linux.dev>; Tue, 24 Sep 2024 05:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727154169; cv=fail; b=hqi6iK1FiC123kjBo9Hk8ybYrDZiAHFqMieY09SceqYGy1+N5CNAdaoG6NRC9J0YSeKLYQgl9Cx8OeabHkQRiA/jfirg/2/R0ALDhpA/VgzoI0Zg8kZNinwYT3ojeNNb8wuscDF+6Mdj1RgcqNoAZKq/j9SUo56XWG6QmxVuJ6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727154169; c=relaxed/simple;
	bh=nkcaoBoH+5twns+GwYPqP8UqKD/2uyZHqVEUw5bS8Zg=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=kK1npu2faCn7mbbgJLld8PbG3YMOcp3s1JNGszWp7NeLoEIJGBX0IhPfByUpj9nG19BrxSWB+N0OyHgGTqnqa8JepGnnOZKibjA4hMWl2RP5BD37/OXvSc/dB3dkZQgHLWEL/6AX8/uczFJ96OF8/naty+bRHAxypoPs8kUjeGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B4f31OI1; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B4f31OI1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727154167; x=1758690167;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nkcaoBoH+5twns+GwYPqP8UqKD/2uyZHqVEUw5bS8Zg=;
  b=B4f31OI1cQ1igYHbpTB9D6+MajA/GcMIq0h2R22dk+7dYi72SxYCjHTd
   6HU4c+TyPQM7f0McbP3Asrlj/ImfK2qsKKqQfIwSj6E1R+wpncG8JEibS
   BUMg1kTqycYCZ9O+kuoP+bfrVVoE9ottoTjmfnCDTFbK/H+8zrIOeEjNT
   FA3yFusF2wEB1GfH+Ox7BEqB7nyFJ3Vv3CR3eoUaeHBzA4OvqnA0eGKAv
   7HFX+07kDBS7SjTFjKsABUHTPbLf8ygKwPcv2TjHWpkSwOiYEDFnaNpYx
   vBoF5i6dUrOdDkZQN7XBiD13U7pygSZOXKg7d+7uq2obAYvF8cZsW/ym/
   w==;
X-CSE-ConnectionGUID: +To/JpJJQW2goJza7pki9Q==
X-CSE-MsgGUID: cBrusLyPRaq46C0made6Zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="48661291"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="48661291"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 22:02:45 -0700
X-CSE-ConnectionGUID: Kl++vKuBRmCJlJbjU7r5Tg==
X-CSE-MsgGUID: Yk5L7XeAQheuj/VB0uG4QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="76065719"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 23 Sep 2024 22:02:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 23 Sep 2024 22:02:42 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 23 Sep 2024 22:02:42 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 23 Sep 2024 22:02:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UV3EsHbdckSxc+zxl/w/TECEa3tncaOsUhOVqJZdfzknaDTp+rVZNVGZuCUAzMJr9RrD7Rh86I5r6i7cRoXjP9nHs/60vOOp14FSdbgWZAEbeYnP1P3J9uAHeJNe5/NYV9WPI7Z5m1PM9HL5saQBkUS2p4nta5qSfDJcLLxRQKrNhqz/oBLDAnX2XTTSiefEEO1F/ivbSovifPzOHPCZTSST/3lBOt6Ulk4FnWTSHFsAxbhWxVOnqgF2CG/M++nkktlT6gTG+aYsm6VTgw4yDGnk2dLsnuB96325dTKXFBjDVXv7CgGLQecgGm5sg1foY6kx2QYT6oD2GJXrI4o9ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rb5ls3Lvra0nVQMaKaS096dQGvJC4fLpCak6/qXETdQ=;
 b=oW1xEL+vH73bgEAxZCViVZ+6Uq80D3luN3Jc7aXkay+ZVJ72BscyeI34g9TbRizE6lpka21agUpw3AU9N/VHXB5yPhLSMzGEBbigUGDtFbcHgFhjLZgFFCN8SUcftHXO5MEN/hmjxUJuAfW7PYYsKpqIV1T7OVKRORHbsoQYT5Rv2W0j1SQ1JPJCFOwhqtlBqgqmhXVzLOjl/GLoa/NIDnlyNXOsTLEinr0/9qzX6ZiyYEDWb4cKifSvp+liY75PpsNHtrMAQU4Z4/FMoW1pz0JXw5X2xPUN3PfF7G/JkYZ6vp2QvR1aXv+5GHxvkEtD7YU/6Gtz0NAG5aWpyAxsPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MW4PR11MB6715.namprd11.prod.outlook.com (2603:10b6:303:20e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Tue, 24 Sep
 2024 05:02:40 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.7982.022; Tue, 24 Sep 2024
 05:02:39 +0000
Date: Tue, 24 Sep 2024 13:02:30 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Leon Romanovsky <leon@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [leon-rdma:dma-split-wip] [nvme]  63cdbb87e1:
 INFO:task_blocked_for_more_than#seconds
Message-ID: <202409241232.1ba3a04e-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::11) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MW4PR11MB6715:EE_
X-MS-Office365-Filtering-Correlation-Id: 10bb3085-8c61-4ed5-f081-08dcdc561cd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yGCr4hibONrcEmmN+AnxPfeDt+Gq5WwxdHI+s2SAnNVaaDy89BTHxMu+qRy6?=
 =?us-ascii?Q?GDeBS6DhRSVrMEnhf4ny9/Mjn5ensO+vjoZS8CV2AInnj+4Qa/p5+aqoSuAx?=
 =?us-ascii?Q?1516nEPWpcQRV4Q0cmSN0OUg4E0b6yN3iMP8ZZrP9Mpw7brixJn5CWhPu9Vo?=
 =?us-ascii?Q?PGK6AlpxpI4SojiWLmUTmHToCAAZGpWofuVB1IeZWVAsZ04niaVIKKoyntyf?=
 =?us-ascii?Q?6++sKP9996b1qQt3hbLA5IULgjPtcJgRpitbQi9oXGA55QzgdVq+yNlbOmOl?=
 =?us-ascii?Q?Bp5IIMiL6JHGm01kAHN3UWe3ao8wHOEevpgorpCJHmfSbCR7dzdGfZa8APrM?=
 =?us-ascii?Q?wDxaNmflNWUwOiE+YBHUTLk7VL/FQGFTvkFUaSnDLLkFulNdbzBOV+VJZVBh?=
 =?us-ascii?Q?YJYFRjHKL0hxxnRpyG/FuNrGL6M+0+4T1v74Gpj8BtZCEVIms9MfkD29v6RU?=
 =?us-ascii?Q?eC+LIoBkqNXZXcDLvcqjut+h7iJ1AnBsBW7uJMOPj8C5nxTuMYYmRZ+zI6bd?=
 =?us-ascii?Q?8FsgQvwXFgnR3ZhN4hpVTw1aH2WEpXrjGyPg6gssJ0ilyyut51/IN+bFW/7J?=
 =?us-ascii?Q?P9AuqWg00tTKMrvdRzbYHo5E7dDae9ecBjEYFwzsYkYzRVYSLGJ/EioE6cln?=
 =?us-ascii?Q?Tz/3tFJuageTsGiBAtBEW3DILT/PSkDTz4OcSBKPsls4iEGfoXqfGbaOCLxu?=
 =?us-ascii?Q?8E1k2CkC1S7AkUq8lAMRYToaK/9ht4m8uNX1NmA2Dn8INIWpQUY8QjzOCU5b?=
 =?us-ascii?Q?IPmNUoFS+K9eXMlIPbrs5Z52aOjWM6KbZOB77ug0hSkgeUiJPEzsVcHdL7cP?=
 =?us-ascii?Q?WLe/A8tK+GQTjZS9HzsQ3fakzpzl6umx1SL9jL9dIZri2oNY9KE1zWa5fPVn?=
 =?us-ascii?Q?O/rqHWGyrgGRPm5MEKYvzDeib0RO+spz53OE6de5wY7BeUm5QDSEH7H86X42?=
 =?us-ascii?Q?0Jfxd+/FDa3gfB7g+DxphiCt0ZdP4wV6f+3fy9NgmSnnPKl2xM+hRLRt4UrU?=
 =?us-ascii?Q?xWaA4UAc7dffC3siG6SzqnjwpQ5oQhQgoPkfJcL+/RsJl41xaRN6lVwaIHPZ?=
 =?us-ascii?Q?3BvOx6Ihb8zeZqrqjzr9zxpzdfhxzVNG9LsQvdkaSJSH0CwOHkWqZe1crluC?=
 =?us-ascii?Q?6PaJ5EPPMuag4bjYSgYPc30Zm5CKbjiAHpS1+wQyj2u3qZ+PQE0XYWWen2rC?=
 =?us-ascii?Q?WjhK5wsfl5YAw15sYB0M7W2uXfrJtWbH2oer3/1UGhejbEmDRR5Ey9nzUJ7j?=
 =?us-ascii?Q?2rKw3ub1nEeUzSrIS3XhSlM1zVj1MIQcDbXJD4q+HuC1qsAI8SuzK1dpptYA?=
 =?us-ascii?Q?r5aGVKCe4WSgZZQdnLlRd1rBU6M+k6PVPtklBUTcE+MrfNg8NlVjk8mN6pGG?=
 =?us-ascii?Q?AV2kx+E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VMiFfahnCKta8drYU2J2uyH3avL2PJ6t8M5MNvBnDAU2O7dk0viHbPEptQWI?=
 =?us-ascii?Q?Rk8jFNeiD2sutBQnL2qDqcmjZTY1ehLnWEkUCyhGgXHes7DoKiPgwUixDTIx?=
 =?us-ascii?Q?u7m7V1fqUavyGbgph5htdS0uNpyl2hyTSeuP80pxRpgkKa+8IbCPBUeqe0QI?=
 =?us-ascii?Q?WO4/JCr8DNkin3Fc4wY6TeC/QM7LCa3fPG5+liZIJS1xTxHPYeRDxTSZeXvx?=
 =?us-ascii?Q?rFYT3S/lH4eV6ORcDpF3jVgR2nTFvyfWMe76+p6lJLyMoX2IhMiY+0TJ4fFu?=
 =?us-ascii?Q?B5fX73MAO+drQxcNbXzo02qJT6wEf40s8vqxRKwBwYMc0PRCxXqUn9AHY/jt?=
 =?us-ascii?Q?k1WLl6GK47AeFHrgdowoS0/1bCh0E7EI7AUaYTUcjkJ8cj8JXlEKnzfvz5WW?=
 =?us-ascii?Q?9WfU1dnqur6NLPjVn15KUMRYtn5lZItuKcjCjgH0jGlYRd48QkI2ahMH4ps2?=
 =?us-ascii?Q?JV1OO9gnZ0T9uNarZ9cDRr7QHUQm3pNkoO7m8M2IxsLyq+PRm9C3LZPkTkWI?=
 =?us-ascii?Q?gEgu/+H54VAAJjgoE+SMVRlWIU6MYng/7NVfl1LlgptyeSe0isnQeNAhkcyg?=
 =?us-ascii?Q?Jdlwi4S5R6atDDElq+cBSmXNGpAHkuhGhmRmxhpmEXgjECEgjDRCOzdETywe?=
 =?us-ascii?Q?y4R+N3w15eFN20YbJmCnsBBRxp5yE3IQS8yGf00BtYNikhNWHK8vDBTc8oz/?=
 =?us-ascii?Q?z2uDfecZnO59n+gr9Lyz1pNRIP7sgttsEKMaA4n+LJ33pE/jLEsv1ddlVORW?=
 =?us-ascii?Q?EBuYLFsrYs+jnsGOq3fpR9RlsByft9zHLMtV3z+QYvEnxVgm1IqvFYNIad1a?=
 =?us-ascii?Q?rGuQdZtiMS0uoboTzJ65wBZRO1r8ioajSuN0dcGhbUl7FW2SaqaxDIQm8JSJ?=
 =?us-ascii?Q?PbxvPIQNcXoxVccOmIErAhgT4RzFlIulvMClLuQTUWG7y9PGU100FBCgPE+u?=
 =?us-ascii?Q?r9uCXIxU2efep5iFJEnc1Y/PhNdZVofBpxH//pTMhjxQoihUOTCd8ncxbNIy?=
 =?us-ascii?Q?yudzSNCjSlsYHj89CwgyX49vfgcoQtpRJ7u3Ebj1pt1hIYukGM/0DuDJ25CL?=
 =?us-ascii?Q?q28tc094Uv1aWSMnnpqg5NvnJDp+VrjN5bH/WvBbEYiieBZatkFOH89xPlD/?=
 =?us-ascii?Q?/O7Z87XziXcfpssG31i1wL8bxRj3NdnZfuKx0bBWlIR6p+wyHe1/Apm9zSxH?=
 =?us-ascii?Q?EFYFjoKV7yZTlhojQBN4GoqAAG55wRbXB2e/6Tjtjjzv40Rv71OgV5Jz/vSa?=
 =?us-ascii?Q?7ZEQiyXInyESMD0MVe5HJaB3e3SHrYRPFclY/0nlZX9T/7qwj7R3fzV4PLpb?=
 =?us-ascii?Q?nc5mSddXO3R1tb2NdCqGBQ0P2RfrcMEEGVZARqXkN1LzFdE6T6OytmpG4wXF?=
 =?us-ascii?Q?BqLMRPv1HEFDX1gv+jNuzFqrhOrQA/lzotCJodGeZCv+uxxJWnB/r9EgNJXz?=
 =?us-ascii?Q?6w5R+0GX5n6QJGNm3fNRrdRI7lk7Vf9PDMsW992Z2AkT+3RrIOAqBeebwlBB?=
 =?us-ascii?Q?q3RLF2SpkFxAs+m7xqoPMpSfC7mznHnc+JTNyAE+L2Uvt91KBLDGhiILOchl?=
 =?us-ascii?Q?lzNABVOBLu2jZ7fYMJR4F/KVom441oId4ohJqM7rSCzYs2UIRqe/L0YQUFWo?=
 =?us-ascii?Q?0w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10bb3085-8c61-4ed5-f081-08dcdc561cd5
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 05:02:39.0204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MAgl0/DIb5T3f/3QhHZjgiNcBiOlJi+iIu53tzMxBI8utviglZ0KV2lM2YP598xtkh2i4+NraVICrDGDmks2Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6715
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "INFO:task_blocked_for_more_than#seconds" on:

commit: 63cdbb87e1b08464705fa343b65e561eb3abd5f9 ("nvme-pci: don't allow mapping of bvecs with offset")
https://git.kernel.org/cgit/linux/kernel/git/leon/linux-rdma.git dma-split-wip

in testcase: will-it-scale
version: will-it-scale-x86_64-75f66e4-1_20240303
with following parameters:

	nr_task: 100%
	mode: process
	test: read4
	cpufreq_governor: performance



compiler: gcc-12
test machine: 104 threads 2 sockets (Skylake) with 192G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202409241232.1ba3a04e-oliver.sang@intel.com


[  991.214711][  T716] INFO: task (udev-worker):1511 blocked for more than 491 seconds.
[  991.222522][  T716]       Tainted: G S                 6.11.0-rc6-00026-g63cdbb87e1b0 #1
[  991.230626][  T716] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[  991.239176][  T716] task:(udev-worker)   state:D stack:0     pid:1511  tgid:1511  ppid:991    flags:0x00004006
[  991.249205][  T716] Call Trace:
[  991.252377][  T716]  <TASK>
[ 991.255185][ T716] __schedule (kernel/sched/core.c:5188 kernel/sched/core.c:6529) 
[ 991.259410][ T716] schedule (arch/x86/include/asm/bitops.h:206 arch/x86/include/asm/bitops.h:238 include/linux/thread_info.h:184 include/linux/sched.h:2084 kernel/sched/core.c:6608 kernel/sched/core.c:6621) 
[ 991.263263][ T716] io_schedule (kernel/sched/core.c:7376 kernel/sched/core.c:7402) 
[ 991.267373][ T716] folio_wait_bit_common (mm/filemap.c:1299) 
[ 991.272548][ T716] ? __pfx_wake_page_function (mm/filemap.c:1115) 
[ 991.277965][ T716] truncate_inode_pages_range (mm/truncate.c:398) 
[ 991.283576][ T716] blkdev_flush_mapping (block/bdev.c:48 block/bdev.c:65 block/bdev.c:665) 
[ 991.288484][ T716] blkdev_put_whole (block/bdev.c:671) 
[ 991.293024][ T716] bdev_release (block/bdev.c:1097) 
[ 991.297305][ T716] blkdev_release (block/fops.c:640) 
[ 991.301675][ T716] __fput (fs/file_table.c:422) 
[ 991.305443][ T716] task_work_run (kernel/task_work.c:228 (discriminator 1)) 
[ 991.309725][ T716] do_exit (kernel/exit.c:883) 
[ 991.313661][ T716] do_group_exit (kernel/exit.c:1013) 
[ 991.317940][ T716] get_signal (kernel/signal.c:2917) 
[ 991.322135][ T716] ? vfs_read (include/linux/sched/xacct.h:14 fs/read_write.c:481) 
[ 991.326328][ T716] arch_do_signal_or_restart (arch/x86/kernel/signal.c:310) 
[ 991.331743][ T716] syscall_exit_to_user_mode (kernel/entry/common.c:111 include/linux/entry-common.h:328 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 991.337244][ T716] do_syscall_64 (arch/x86/entry/common.c:102) 
[ 991.341618][ T716] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130) 
[  991.347383][  T716] RIP: 0033:0x7fa1618f619d
[  991.351669][  T716] RSP: 002b:00007ffc004d8bf8 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
[  991.359942][  T716] RAX: 0000000000001000 RBX: 000055de2c05e2f0 RCX: 00007fa1618f619d
[  991.367785][  T716] RDX: 0000000000040000 RSI: 00007fa1604fc038 RDI: 000000000000000f
[  991.375623][  T716] RBP: 0000000000040000 R08: 00000000ffffffff R09: 0000000000000000
[  991.383465][  T716] R10: 0000000000000022 R11: 0000000000000246 R12: 00007fa1604fc010
[  991.391307][  T716] R13: 0000000000040000 R14: 000055de2c05e348 R15: 00007fa1604fc028
[  991.399143][  T716]  </TASK>
[  991.403369][  T716] INFO: task sync:13135 blocked for more than 491 seconds.
[  991.410753][  T716]       Tainted: G S                 6.11.0-rc6-00026-g63cdbb87e1b0 #1
[  991.419177][  T716] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[  991.428027][  T716] task:sync            state:D stack:0     pid:13135 tgid:13135 ppid:2334   flags:0x00000002
[  991.438340][  T716] Call Trace:
[  991.441798][  T716]  <TASK>
[ 991.444898][ T716] __schedule (kernel/sched/core.c:5188 kernel/sched/core.c:6529) 
[ 991.449387][ T716] schedule (arch/x86/include/asm/bitops.h:206 arch/x86/include/asm/bitops.h:238 include/linux/thread_info.h:184 include/linux/sched.h:2084 kernel/sched/core.c:6608 kernel/sched/core.c:6621) 
[ 991.453520][ T716] schedule_preempt_disabled (kernel/sched/core.c:6680) 
[ 991.459128][ T716] __mutex_lock+0x33e/0x630 
[ 991.464812][ T716] sync_bdevs (arch/x86/include/asm/atomic.h:23 include/linux/atomic/atomic-arch-fallback.h:457 include/linux/atomic/atomic-instrumented.h:33 block/bdev.c:1241) 
[ 991.469185][ T716] ksys_sync (fs/sync.c:106) 
[ 991.473377][ T716] __do_sys_sync (fs/sync.c:115) 
[ 991.477826][ T716] do_syscall_64 (arch/x86/entry/common.c:52 arch/x86/entry/common.c:83) 
[ 991.482447][ T716] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130) 
[  991.488449][  T716] RIP: 0033:0x7f5cc5aaeb97
[  991.492981][  T716] RSP: 002b:00007fffc8136128 EFLAGS: 00000206 ORIG_RAX: 00000000000000a2
[  991.501501][  T716] RAX: ffffffffffffffda RBX: 00007fffc8136288 RCX: 00007f5cc5aaeb97
[  991.509576][  T716] RDX: 00007f5cc5b8a201 RSI: 00007fffc8136288 RDI: 00007f5cc5b47794
[  991.517653][  T716] RBP: 0000000000000001 R08: 0000000000000000 R09: 0000000000000000
[  991.525729][  T716] R10: 00007f5cc59b9278 R11: 0000000000000206 R12: 0000000000000000
[  991.533817][  T716] R13: 00005655151e00fb R14: 0000000000000000 R15: 00005655151e2ce0
[  991.541895][  T716]  </TASK>
[ 1482.734605][  T716] INFO: task (udev-worker):1511 blocked for more than 983 seconds.
[ 1482.742610][  T716]       Tainted: G S                 6.11.0-rc6-00026-g63cdbb87e1b0 #1
[ 1482.750947][  T716] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[ 1482.759741][  T716] task:(udev-worker)   state:D stack:0     pid:1511  tgid:1511  ppid:991    flags:0x00004006
[ 1482.770014][  T716] Call Trace:
[ 1482.773412][  T716]  <TASK>
[ 1482.776471][ T716] __schedule (kernel/sched/core.c:5188 kernel/sched/core.c:6529) 
[ 1482.780905][ T716] schedule (arch/x86/include/asm/bitops.h:206 arch/x86/include/asm/bitops.h:238 include/linux/thread_info.h:184 include/linux/sched.h:2084 kernel/sched/core.c:6608 kernel/sched/core.c:6621) 
[ 1482.785018][ T716] io_schedule (kernel/sched/core.c:7376 kernel/sched/core.c:7402) 
[ 1482.789370][ T716] folio_wait_bit_common (mm/filemap.c:1299) 
[ 1482.794787][ T716] ? __pfx_wake_page_function (mm/filemap.c:1115) 
[ 1482.800466][ T716] truncate_inode_pages_range (mm/truncate.c:398) 
[ 1482.806331][ T716] blkdev_flush_mapping (block/bdev.c:48 block/bdev.c:65 block/bdev.c:665) 
[ 1482.811491][ T716] blkdev_put_whole (block/bdev.c:671) 
[ 1482.816296][ T716] bdev_release (block/bdev.c:1097) 
[ 1482.820838][ T716] blkdev_release (block/fops.c:640) 
[ 1482.825465][ T716] __fput (fs/file_table.c:422) 
[ 1482.829501][ T716] task_work_run (kernel/task_work.c:228 (discriminator 1)) 
[ 1482.834038][ T716] do_exit (kernel/exit.c:883) 
[ 1482.838202][ T716] do_group_exit (kernel/exit.c:1013) 
[ 1482.842717][ T716] get_signal (kernel/signal.c:2917) 
[ 1482.847159][ T716] ? vfs_read (include/linux/sched/xacct.h:14 fs/read_write.c:481) 
[ 1482.851597][ T716] arch_do_signal_or_restart (arch/x86/kernel/signal.c:310) 
[ 1482.857258][ T716] syscall_exit_to_user_mode (kernel/entry/common.c:111 include/linux/entry-common.h:328 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 1482.862997][ T716] do_syscall_64 (arch/x86/entry/common.c:102) 
[ 1482.867607][ T716] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130) 
[ 1482.873606][  T716] RIP: 0033:0x7fa1618f619d
[ 1482.878124][  T716] RSP: 002b:00007ffc004d8bf8 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
[ 1482.886629][  T716] RAX: 0000000000001000 RBX: 000055de2c05e2f0 RCX: 00007fa1618f619d
[ 1482.894694][  T716] RDX: 0000000000040000 RSI: 00007fa1604fc038 RDI: 000000000000000f
[ 1482.902765][  T716] RBP: 0000000000040000 R08: 00000000ffffffff R09: 0000000000000000
[ 1482.910837][  T716] R10: 0000000000000022 R11: 0000000000000246 R12: 00007fa1604fc010
[ 1482.918914][  T716] R13: 0000000000040000 R14: 000055de2c05e348 R15: 00007fa1604fc028
[ 1482.926993][  T716]  </TASK>
[ 1482.930120][  T716] INFO: task sync:13135 blocked for more than 983 seconds.
[ 1482.937434][  T716]       Tainted: G S                 6.11.0-rc6-00026-g63cdbb87e1b0 #1
[ 1482.945782][  T716] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[ 1482.954571][  T716] task:sync            state:D stack:0     pid:13135 tgid:13135 ppid:2334   flags:0x00000002
[ 1482.964844][  T716] Call Trace:
[ 1482.968271][  T716]  <TASK>
[ 1482.971340][ T716] __schedule (kernel/sched/core.c:5188 kernel/sched/core.c:6529) 
[ 1482.975802][ T716] schedule (arch/x86/include/asm/bitops.h:206 arch/x86/include/asm/bitops.h:238 include/linux/thread_info.h:184 include/linux/sched.h:2084 kernel/sched/core.c:6608 kernel/sched/core.c:6621) 
[ 1482.979901][ T716] schedule_preempt_disabled (kernel/sched/core.c:6680) 
[ 1482.985483][ T716] __mutex_lock+0x33e/0x630 
[ 1482.991147][ T716] sync_bdevs (arch/x86/include/asm/atomic.h:23 include/linux/atomic/atomic-arch-fallback.h:457 include/linux/atomic/atomic-instrumented.h:33 block/bdev.c:1241) 
[ 1482.995515][ T716] ksys_sync (fs/sync.c:106) 
[ 1482.999703][ T716] __do_sys_sync (fs/sync.c:115) 
[ 1483.004143][ T716] do_syscall_64 (arch/x86/entry/common.c:52 arch/x86/entry/common.c:83) 
[ 1483.008751][ T716] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130) 
[ 1483.014751][  T716] RIP: 0033:0x7f5cc5aaeb97
[ 1483.019271][  T716] RSP: 002b:00007fffc8136128 EFLAGS: 00000206 ORIG_RAX: 00000000000000a2
[ 1483.027786][  T716] RAX: ffffffffffffffda RBX: 00007fffc8136288 RCX: 00007f5cc5aaeb97
[ 1483.035864][  T716] RDX: 00007f5cc5b8a201 RSI: 00007fffc8136288 RDI: 00007f5cc5b47794
[ 1483.043934][  T716] RBP: 0000000000000001 R08: 0000000000000000 R09: 0000000000000000
[ 1483.052014][  T716] R10: 00007f5cc59b9278 R11: 0000000000000206 R12: 0000000000000000
[ 1483.060095][  T716] R13: 00005655151e00fb R14: 0000000000000000 R15: 00005655151e2ce0
[ 1483.068176][  T716]  </TASK>


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240924/202409241232.1ba3a04e-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

