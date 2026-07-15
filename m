Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD8D2F7EE7
	for <oe-lkp@lists.linux.dev>; Wed, 15 Jul 2026 06:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784096783; cv=fail; b=kIHPe9iZQbqKPZi02yw31qQlrVkjSTNXZ5rUgtgyjMJt9Z9NjCg+07Wmg+w2rdD+BRJxAo/S6h1HWj5VJNBPZCBRfnmuzKS8D8JG3fSnSk8aNL+cW+r4nV3ydD00GqMoiIx1rx/5qGSmTitP0ICJvzadGhJc2/rZJxWD0ytW4Ug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784096783; c=relaxed/simple;
	bh=OPmkM4+e7RPZNn25fwdMU3VqpicqOUPb+vbCzsR7Cus=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=aVoA2lXJJ3J4OLF+bbjtptK92h0tBRguvxi32tXsPt5glxr8zpnYr6en+4Zw6wtJcOnO6JJyZ9QVSQXv9AqJLocku4ptPjMAj8Whc0ibvvCAEFJAp5iFB5zy8w/xjp88laDNn3JRLU3PIrWxEsBsyULb6m8m9bDyqDAoI6QZ2PE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mspXJY/S; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mspXJY/S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784096781; x=1815632781;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OPmkM4+e7RPZNn25fwdMU3VqpicqOUPb+vbCzsR7Cus=;
  b=mspXJY/SgvWtyyKdExXaFMHzln8fEADYRaCxocXoVHhcXM/D/wFzhM/K
   UHdInNsg2F4kG3AtQJrX3IPmZQNOI99ZPh52HpRvb3yGFFeGQIYfWfZwd
   TDUlPPvx8vj39nheGOAkMC8z3IavKuCFep6vaJw+XVGtcPizm0XmMXG6R
   oAnQL6feUTd2ep6ILLhKGCQoZR2hewkW7CcdbtDTEGRO8hGBsfW9LyTL5
   QhbZg5vW++P5tRrsR37UI8rYulEDNhwE30MLOUmEC23vhZ2chaGem0wQ9
   wjy3n9VMIsvanx9wjJU1iaq4JUi4JpH0EpTA/lu+k6VAMQQNIGF7Xm1ov
   w==;
X-CSE-ConnectionGUID: fM5CxmuDQB6275wwfM4yiw==
X-CSE-MsgGUID: ZyyucH7fTfqittK1l8u96Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="83846358"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="83846358"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 23:26:20 -0700
X-CSE-ConnectionGUID: u0SUFk/NTz2R77B4XVFFJQ==
X-CSE-MsgGUID: 47jM1gCeTy2f77qg+eqgCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="279359640"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 23:26:20 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 23:26:20 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 14 Jul 2026 23:26:20 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.33) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 23:26:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FhpEpeDbNYPb/ph1kS8ZdRHI5xP68rTKbNRuJIkpcXGNhJ1WlmJaCqjfALyI0ONSf+06pY/tCoJlicf2xcXYnn2azS0RVHjIawwf2msvdXKalYEnUMv4E932K6hT6E9b30ASWB+VQZ22lDNZYCZPIXf6eBdgkF5pEY1AiDLxGFbBLrcT8fQeN/2UzSMOgrnmT9K7MeylyKAlwiobG5LosEk2ObRfad4QZqbPmww9uYQsUfOoC3jyvj7v3pZxRryYAP3OIMHFwEe2kELQ0R1Bz3LEyhW6NwdoGPOojmoM7mNu76j44QU6m0ZJHNpIMmRQwPtPDXTz+XGYTmsAvuFcig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6JYN0y3xvn29+08oFwgTFh0VKRdTInQIiUlbEG/czpU=;
 b=iA4SgvGKfa9FPveOHH3CDGA8LlD/CrrdKbKHyDy9EQqY1FJAQ13yUm+Ws2LOfeHhXmy5k1pHWBn6YwB1wkdVTtNf0j5n6Lk+9DKHEOjxWrQMUlx2ch3ByPWm19/ITAPSAUUHulKo5lqGlga44dmX/eYCmKHJuz+fw35dlZzL7NxWE3cwAnAZhuPGSafX4okdjuY932wto6muod0+l72OIGaaPEqqXk8dc1P5Jzo4GkLlPEUvFzD6EHU3qzdU8gAtBjSzvFLu01F3q0PSf6MOOrdiz23CDUXerT1KEFOMhoMHBJVT/liPeIaFgX5O3OOVJ3khlL2jbLNxAm4pt+YOng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by CH3PR11MB8591.namprd11.prod.outlook.com (2603:10b6:610:1af::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Wed, 15 Jul
 2026 06:26:18 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%5]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 06:26:17 +0000
Date: Wed, 15 Jul 2026 14:26:12 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Chao Yu <chao@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Chao Yu <chao@kernel.org>,
	<oliver.sang@intel.com>
Subject: [chao:bugfix/common] [f2fs]  cf29f79136:
 BUG:KASAN:null-ptr-deref_in_kthread_stop
Message-ID: <202607151422.5161cc44-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: TP0P295CA0008.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:2::20) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|CH3PR11MB8591:EE_
X-MS-Office365-Filtering-Correlation-Id: bec1b5a8-0981-46fd-9ca6-08dee239fa6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|3023799007|11063799006|56012099006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: dljOkdDLefBCAyGXqhTM1w7pSKX9D7ESd/cMnEfStpQ2Q89omlL9rQ5BRC5RyXGvpg26AHIM4sWsyEIYn7HfQYxe89oGNqwb72Hk64nbmPTvcSyB4oOwrDjCLPKcAV4BXgYljPdcEsistzNLD5OLpo2plJMHliy+rDePCoHVtZ0kGVJHhoKdyFyENKpSLnS75fWLaczRry6RdH2UZ8e4rp/ZBLc+o+Vu9xxwbjvF9E5lcMAnoxleat3YAfWQO0yjYhUuT2E0Y6/Jv9Qlhs4O7v29Gf0FaNR2yQqGZzjclvKQ3CzFzWfmFXZ7D4ahL92hrGiNl0MP8sbkQPSEJMmNQuVsJC+OcEjbDzuS3H1iil8og/7Msms8Z5GJpHe//0sp1j6hOMI9M7zFP7Nddqhn+clOAKVggapulrNWgmXIPMy2AiuClMB1IoSgVlx0EXLFvz06LaDxe94+kZTWoEQNrMAiDA4Q0bMEUZFdbSDB4+2PrgQDlogpXthlr4WxrJExTGLKH/jMU/+IsMiIdHtOTaomhx1l7Sw4azXzC1iS6VOCSku1MKGDm6bWMbXjSmvNSv4Mu2ukAXmd+mQEdfS4fhFM+ozrzCgPqyuO0iTCss7S2Lc20xbp/VaGONpDW4He
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(3023799007)(11063799006)(56012099006)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qlropa8DsnZcsWW02uDr89nQE0BWX+X8NqjZbgV9K30gZBToTYlym+hSmF3k?=
 =?us-ascii?Q?DDQj0jeeWy74PbutmhcCcojkMahYodO/bthc8NjO8hsmSPcRp9NILTPvp1T9?=
 =?us-ascii?Q?3Gkc1wu1MFscWTSL6NHEnCd0/qtShjSNLRTvAfaCVO1W9mPzh9xesXEetgoV?=
 =?us-ascii?Q?O38WWLlKUcPeZkJb+XF1QGc4EdrGSPp6KziI0U3BCUNTH9mS/agCaHcBzmXx?=
 =?us-ascii?Q?7YnwLcNPEaWe9u7Fg6A7Wzrg6hJ0o0NRxS5WT3g0csMZsOZSKEXSuQNSzkzI?=
 =?us-ascii?Q?drfPhKTLTOS36bt7PYXp1V99xaKpr/6lYpG3n9Kou1VSBw4MDb+58eegDA4W?=
 =?us-ascii?Q?3htS4y0QsBI18fGSLIJeffAcdRz7HwkQfWDgSpBBZJGi47jy/U1px9oe5PUO?=
 =?us-ascii?Q?AwsMoV/+rkUnK+lTsPiHJLhdvltrKk52+A31pS3xHZ1tlmhcUaP58g3yY1z+?=
 =?us-ascii?Q?YHUXR8r7b154pZ2D8Ln4rgXFRIsfT9R58+IAzvTZwK5C8uLDf/r/Lw9BEgmS?=
 =?us-ascii?Q?UUnLIEao9obQk3/DCuvl6/opdl6DTztQ/6Pz3VQLkx8QrLvUj8WJOq7OEQk7?=
 =?us-ascii?Q?NLuwj4YW+/iTXly0GexiEAl+qPVabrW9UwBf5RZcP2REcP7Tiyt7ZnzZTdwr?=
 =?us-ascii?Q?+sCX59rg3ujUuBW+5sf4i9lL2P6kXnwZKH3DdF+Gz9UyGJul1VQCGSJJ32Tp?=
 =?us-ascii?Q?Fh1RqVatIqNRYh6v78VrS/x+vl0eBlmxMBQlLaCm6GKaOX4+PMHNYO6n99Zr?=
 =?us-ascii?Q?X7cFGjPHWmRvg8fXaxjyyYRoVKcgbsiaMaeCb2n0HEwmGjHUno654+o4OlDd?=
 =?us-ascii?Q?Ns7GrP0Mdoxowi2BHfvj/1jCsHeKL/jDt4zIi3Bmmf2adtTA0g/zqL6A06Bv?=
 =?us-ascii?Q?MO/ijhRul1wKrF2aKMCzEuVPyktK07K5lbShgtQRXXPmgjyYV2AFt6MgiV2s?=
 =?us-ascii?Q?r3uduiNDFv6AhZuVAuvHfiL3zmyzjv6pYoioyZ/HKLt23xyhaomJ3TRyvvHQ?=
 =?us-ascii?Q?PbPlSsz3neU4Puv7tQRnpORs3xNDf0J5QJ0Tsvw8GgnbcuxASJidXvaZWlTK?=
 =?us-ascii?Q?z7ewzSHWJsrKyqqCzKbQZJy//jqUDRdTMFRaXRhGL1cxCI3zVD0S3On38S8T?=
 =?us-ascii?Q?+OG3XaReXZfHUT7NT80/1mK+7Q/t/FXO1m4mNThLrFWgcawiLl4znfT15zNv?=
 =?us-ascii?Q?9AxJ5SeCU+w8pEvt6FTCecn+HEI9Iji8lRUwNniJ9acf9LTJkB2amWoCGHSB?=
 =?us-ascii?Q?TjdCcSZJSzpVXItMIw1j32lIAqFZg/6qnjdbHn7f8gnvWI3BMnwgTx9Y829b?=
 =?us-ascii?Q?nzb+tEoDo1OQOxwlR8EEeZjIN5bnn5i2OvzFhbbOXKZM4CTm/CG+TfJL/t+G?=
 =?us-ascii?Q?8w2arsR5u+MgZNQjF4hpYmKdEreGOeSenu/gSupShEh0kc8/qlQSsibIPhPl?=
 =?us-ascii?Q?wAhJhsyG9JYOw366R0F6eJ5LmEFtPSFVPs16l57bVQUAxwBR0PMgUC3+N1W4?=
 =?us-ascii?Q?s674K2/rXFpuNdDFL9dp1bElcgbRwHt00s0IMs4BQy1PzaSOQCaxrY3jg9am?=
 =?us-ascii?Q?N7wKxqa71Hxv4Y/FW6KW8CFH31B+I1PzQDBfrD2QPC+ZJNhiANvald364Ymy?=
 =?us-ascii?Q?v8lk2as1yDVtqAct+ldQz1CTsIGHvzGWaNK95zJ2iGSTO/ujxTqDdSCvKqk3?=
 =?us-ascii?Q?79Z0jiy9L1U6XHjKGbLBNdVYxZSRY6EfTc9J/iZZ7LWmvBpr3kcm8cTx4uDy?=
 =?us-ascii?Q?l+fXqrtpZw=3D=3D?=
X-Exchange-RoutingPolicyChecked: CkTCzPVKgQ6723twjYoJ0n4aA9koW5ARAVnZzlD/bJP3qYAKBqOiptQ9c0YLEhl8A3uv3Py5U32EOV93Vqsz7//n81RWP9DVOAXmkClba89TOs7BUYjwkBuCiToFSSn7SfQohNeExYa44enaRAAKk/Qd6yfcQmhnlUfzwm/x1XycUOavGJaGfV3ayvMj4GJ3QP4jtYOXbVShVQvIxmTy421DIpSGHy7w1si12v6GfmML8sFgZ/ATOtrlgZ67UZ4AXzmVZr7chXceSpOgKypaLpkIdz7VQba58xh5VQBKRjqV7QZ4aBcu+DydIdZz8amcgruKFXLfNcLv28XMmeiuRg==
X-MS-Exchange-CrossTenant-Network-Message-Id: bec1b5a8-0981-46fd-9ca6-08dee239fa6e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 06:26:17.8235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VPRu3jZi1dPaV6WaK5O6oAZtrppUxWZUjrtvqaUEpXtYQPFDjhDMquL6/R8pO1CuzqE4LK9vppmenC5ZREzbAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8591
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:KASAN:null-ptr-deref_in_kthread_stop" on:

commit: cf29f791365285201d5910134a8ce6ec846265b6 ("f2fs: embed f2fs_gc_kthread in f2fs_sb_info")
https://git.kernel.org/cgit/linux/kernel/git/chao/linux.git bugfix/common

in testcase: xfstests
version: xfstests-x86_64-ffc8bad1-1_20260702
with following parameters:

	disk: 4HDD
	fs: f2fs
	test: generic-group-00



config: x86_64-rhel-9.4-func
compiler: gcc-14
test machine: 8 threads Intel(R) Core(TM) i7-6700 CPU @ 3.40GHz (Skylake) with 28G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202607151422.5161cc44-lkp@intel.com



[   79.877831][ T7985] BUG: KASAN: null-ptr-deref in kthread_stop (linux/instrumented.h:112 linux/atomic/atomic-instrumented.h:252 linux/refcount.h:283 linux/refcount.h:366 linux/refcount.h:383 linux/sched/task.h:116 kthread.c:754)
[   79.884648][ T7985] Write of size 4 at addr 0000000000000028 by task umount/7985
[   79.892072][ T7985]
[   79.894267][ T7985] CPU: 2 UID: 0 PID: 7985 Comm: umount Tainted: G S                  7.2.0-rc1+ #1 PREEMPT(lazy)
[   79.894272][ T7985] Tainted: [S]=CPU_OUT_OF_SPEC
[   79.894273][ T7985] Hardware name: Dell Inc. OptiPlex 7040/0Y7WYT, BIOS 1.2.8 01/26/2016
[   79.894275][ T7985] Call Trace:
[   79.894276][ T7985]  <TASK>
[   79.894277][ T7985]  dump_stack_lvl (dump_stack.c:94 dump_stack.c:120)
[   79.894281][ T7985]  ? kthread_stop (linux/instrumented.h:112 linux/atomic/atomic-instrumented.h:252 linux/refcount.h:283 linux/refcount.h:366 linux/refcount.h:383 linux/sched/task.h:116 kthread.c:754)
[   79.894284][ T7985]  kasan_report (kasan/report.c:595)
[   79.894289][ T7985]  ? kthread_stop (linux/instrumented.h:112 linux/atomic/atomic-instrumented.h:252 linux/refcount.h:283 linux/refcount.h:366 linux/refcount.h:383 linux/sched/task.h:116 kthread.c:754)
[   79.894292][ T7985]  kasan_check_range (kasan/generic.c:186 kasan/generic.c:200)
[   79.894294][ T7985]  kthread_stop (linux/instrumented.h:112 linux/atomic/atomic-instrumented.h:252 linux/refcount.h:283 linux/refcount.h:366 linux/refcount.h:383 linux/sched/task.h:116 kthread.c:754)
[   79.894298][ T7985] f2fs_stop_gc_thread (f2fs/gc.c:240) f2fs
[   79.894364][ T7985] kill_f2fs_super (f2fs/super.c:5573) f2fs
[   79.894423][ T7985]  ? __pfx_kill_f2fs_super (linux/srcutree.h:292 (discriminator 2)) f2fs
[   79.894526][ T7985]  ? __virt_addr_valid (linux/mmzone.h:2187 (discriminator 1) linux/mmzone.h:2269 (discriminator 1) x86/mm/physaddr.c:54 (discriminator 1))
[   79.894529][ T7985]  ? rcu_segcblist_enqueue (linux/instrumented.h:112 linux/atomic/atomic-instrumented.h:3260 rcu/rcu_segcblist.c:214 rcu/rcu_segcblist.c:231 rcu/rcu_segcblist.c:332)
[   79.894532][ T7985]  ? __call_rcu_common+0x341/0x970
[   79.894535][ T7985]  ? mutex_unlock (linux/instrumented.h:55 linux/atomic/atomic-instrumented.h:4480 locking/mutex.c:172 locking/mutex.c:579)
[   79.894538][ T7985]  ? __pfx_mutex_unlock (trace/events/lock.h:140 (discriminator 15))
[   79.894541][ T7985]  ? __pfx___call_rcu_common+0x10/0x10
[   79.894544][ T7985]  deactivate_locked_super (super.c:477)
[   79.894547][ T7985]  cleanup_mnt (namespace.c:1317)
[   79.894551][ T7985]  task_work_run (task_work.c:233)
[   79.894553][ T7985]  ? path_umount (namespace.c:1411 namespace.c:2051)
[   79.894555][ T7985]  ? __pfx_task_work_run (task_work.c:190)
[   79.894558][ T7985]  ? __x64_sys_umount (namespace.c:2070 namespace.c:2075 namespace.c:2073 namespace.c:2073)
[   79.894560][ T7985]  exit_to_user_mode_loop (linux/resume_user_mode.h:50 entry/common.c:70 entry/common.c:101)
[   79.894564][ T7985]  ? __do_sys_getegid (sys.c:1048 (discriminator 2))
[   79.894567][ T7985]  do_syscall_64 (linux/irq-entry-common.h:207 linux/irq-entry-common.h:230 linux/entry-common.h:318 x86/entry/syscall_64.c:100)
[   79.894570][ T7985]  ? __x64_sys_access (open.c:547 open.c:545 open.c:545)
[   79.894573][ T7985]  ? do_syscall_64 (linux/irq-entry-common.h:210 linux/irq-entry-common.h:230 linux/entry-common.h:318 x86/entry/syscall_64.c:100)
[   79.894575][ T7985]  ? do_syscall_64 (linux/irq-entry-common.h:210 linux/irq-entry-common.h:230 linux/entry-common.h:318 x86/entry/syscall_64.c:100)
[   79.894578][ T7985]  ? do_syscall_64 (linux/irq-entry-common.h:210 linux/irq-entry-common.h:230 linux/entry-common.h:318 x86/entry/syscall_64.c:100)
[   79.894580][ T7985]  ? do_syscall_64 (linux/randomize_kstack.h:57 x86/entry/syscall_64.c:92)
[   79.894583][ T7985]  entry_SYSCALL_64_after_hwframe (x86/entry/entry_64.S:121)
[   79.894586][ T7985] RIP: 0033:0x7fbb5f66d257
[   79.894588][ T7985] Code: 0d 00 f7 d8 64 89 02 b8 ff ff ff ff c3 66 0f 1f 44 00 00 31 f6 e9 09 00 00 00 66 0f 1f 84 00 00 00 00 00 b8 a6 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 8b 15 89 3b 0d 00 f7 d8 64 89 02 b8
All code
========
   0:	0d 00 f7 d8 64       	or     $0x64d8f700,%eax
   5:	89 02                	mov    %eax,(%rdx)
   7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   c:	c3                   	ret
   d:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  13:	31 f6                	xor    %esi,%esi
  15:	e9 09 00 00 00       	jmp    0x23
  1a:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  21:	00 00 
  23:	b8 a6 00 00 00       	mov    $0xa6,%eax
  28:	0f 05                	syscall
  2a:*	48 3d 00 f0 ff ff    	cmp    $0xfffffffffffff000,%rax		<-- trapping instruction
  30:	77 01                	ja     0x33
  32:	c3                   	ret
  33:	48 8b 15 89 3b 0d 00 	mov    0xd3b89(%rip),%rdx        # 0xd3bc3
  3a:	f7 d8                	neg    %eax
  3c:	64 89 02             	mov    %eax,%fs:(%rdx)
  3f:	b8                   	.byte 0xb8

Code starting with the faulting instruction
===========================================
   0:	48 3d 00 f0 ff ff    	cmp    $0xfffffffffffff000,%rax
   6:	77 01                	ja     0x9
   8:	c3                   	ret
   9:	48 8b 15 89 3b 0d 00 	mov    0xd3b89(%rip),%rdx        # 0xd3b99
  10:	f7 d8                	neg    %eax
  12:	64 89 02             	mov    %eax,%fs:(%rdx)
  15:	b8                   	.byte 0xb8
[   79.894591][ T7985] RSP: 002b:00007fff9e2b3248 EFLAGS: 00000246 ORIG_RAX: 00000000000000a6
[   79.894595][ T7985] RAX: 0000000000000000 RBX: 00005578ba7bfaf8 RCX: 00007fbb5f66d257
[   79.894597][ T7985] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00005578ba7c5030
[   79.894598][ T7985] RBP: 0000000000000000 R08: 0000000000000020 R09: 0000000000000001
[   79.894600][ T7985] R10: 0000000000000000 R11: 0000000000000246 R12: 00007fbb5f7cb26c
[   79.894601][ T7985] R13: 00005578ba7c5030 R14: 00005578ba7bfe30 R15: 00005578ba7bf9f0
[   79.894604][ T7985]  </TASK>
[   79.894605][ T7985] ==================================================================
[   80.152391][ T7985] Disabling lock debugging due to kernel taint
[   80.158468][ T7985] BUG: kernel NULL pointer dereference, address: 0000000000000028
[   80.166168][ T7985] #PF: supervisor write access in kernel mode
[   80.172112][ T7985] #PF: error_code(0x0002) - not-present page
[   80.177966][ T7985] PGD 0 P4D 0
[   80.181210][ T7985] Oops: Oops: 0002 [#1] SMP KASAN PTI
[   80.186470][ T7985] CPU: 2 UID: 0 PID: 7985 Comm: umount Tainted: G S  B               7.2.0-rc1+ #1 PREEMPT(lazy)
[   80.196958][ T7985] Tainted: [S]=CPU_OUT_OF_SPEC, [B]=BAD_PAGE
[   80.202811][ T7985] Hardware name: Dell Inc. OptiPlex 7040/0Y7WYT, BIOS 1.2.8 01/26/2016
[   80.210932][ T7985] RIP: 0010:kthread_stop (x86/include/asm/atomic.h:93 (discriminator 4) linux/atomic/atomic-arch-fallback.h:749 (discriminator 4) linux/atomic/atomic-instrumented.h:253 (discriminator 4) linux/refcount.h:283 (discriminator 4) linux/refcount.h:366 (discriminator 4) linux/refcount.h:383 (discriminator 4) linux/sched/task.h:116 (discriminator 4) kthread.c:754 (discriminator 4))
[   80.216005][ T7985] Code: 90 90 90 0f 1f 44 00 00 41 54 55 53 48 89 fb 0f 1f 44 00 00 4c 8d 63 28 be 04 00 00 00 4c 89 e7 e8 5e 02 9c 00 b8 01 00 00 00 <f0> 0f c1 43 28 85 c0 0f 84 ce 02 00 00 8d 50 01 09 c2 0f 88 98 02
All code
========
   0:	90                   	nop
   1:	90                   	nop
   2:	90                   	nop
   3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   8:	41 54                	push   %r12
   a:	55                   	push   %rbp
   b:	53                   	push   %rbx
   c:	48 89 fb             	mov    %rdi,%rbx
   f:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  14:	4c 8d 63 28          	lea    0x28(%rbx),%r12
  18:	be 04 00 00 00       	mov    $0x4,%esi
  1d:	4c 89 e7             	mov    %r12,%rdi
  20:	e8 5e 02 9c 00       	call   0x9c0283
  25:	b8 01 00 00 00       	mov    $0x1,%eax
  2a:*	f0 0f c1 43 28       	lock xadd %eax,0x28(%rbx)		<-- trapping instruction
  2f:	85 c0                	test   %eax,%eax
  31:	0f 84 ce 02 00 00    	je     0x305
  37:	8d 50 01             	lea    0x1(%rax),%edx
  3a:	09 c2                	or     %eax,%edx
  3c:	0f                   	.byte 0xf
  3d:	88                   	.byte 0x88
  3e:	98                   	cwtl
  3f:	02                   	.byte 0x2

Code starting with the faulting instruction
===========================================
   0:	f0 0f c1 43 28       	lock xadd %eax,0x28(%rbx)
   5:	85 c0                	test   %eax,%eax
   7:	0f 84 ce 02 00 00    	je     0x2db
   d:	8d 50 01             	lea    0x1(%rax),%edx
  10:	09 c2                	or     %eax,%edx
  12:	0f                   	.byte 0xf
  13:	88                   	.byte 0x88
  14:	98                   	cwtl
  15:	02                   	.byte 0x2
[   80.235571][ T7985] RSP: 0018:ffffc900020dfb98 EFLAGS: 00010246
[   80.241528][ T7985] RAX: 0000000000000001 RBX: 0000000000000000 RCX: ffffffff81534c76
[   80.249406][ T7985] RDX: 0000000000000000 RSI: 0000000000000008 RDI: ffffffff87a10b40
[   80.257270][ T7985] RBP: ffff88871df74920 R08: 0000000000000001 R09: fffffbfff0f42168
[   80.265130][ T7985] R10: ffffffff87a10b47 R11: 0000000000000001 R12: 0000000000000028
[   80.272991][ T7985] R13: ffff88871df74050 R14: ffff8881107a3388 R15: ffff8881a5f4d4ec
[   80.280849][ T7985] FS:  00007fbb5f414840(0000) GS:ffff88868c1a9000(0000) knlGS:0000000000000000
[   80.289667][ T7985] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   80.296130][ T7985] CR2: 0000000000000028 CR3: 0000000213894001 CR4: 00000000003726f0
[   80.303987][ T7985] Call Trace:
[   80.307137][ T7985]  <TASK>
[   80.309941][ T7985] f2fs_stop_gc_thread (f2fs/gc.c:240) f2fs
[   80.315425][ T7985] kill_f2fs_super (f2fs/super.c:5573) f2fs
[   80.320779][ T7985]  ? __pfx_kill_f2fs_super (linux/srcutree.h:292 (discriminator 2)) f2fs
[   80.326603][ T7985]  ? __virt_addr_valid (linux/mmzone.h:2187 (discriminator 1) linux/mmzone.h:2269 (discriminator 1) x86/mm/physaddr.c:54 (discriminator 1))
[   80.331513][ T7985]  ? rcu_segcblist_enqueue (linux/instrumented.h:112 linux/atomic/atomic-instrumented.h:3260 rcu/rcu_segcblist.c:214 rcu/rcu_segcblist.c:231 rcu/rcu_segcblist.c:332)
[   80.336672][ T7985]  ? __call_rcu_common+0x341/0x970
[   80.342702][ T7985]  ? mutex_unlock (linux/instrumented.h:55 linux/atomic/atomic-instrumented.h:4480 locking/mutex.c:172 locking/mutex.c:579)
[   80.347077][ T7985]  ? __pfx_mutex_unlock (trace/events/lock.h:140 (discriminator 15))
[   80.351979][ T7985]  ? __pfx___call_rcu_common+0x10/0x10
[   80.358360][ T7985]  deactivate_locked_super (super.c:477)
[   80.363607][ T7985]  cleanup_mnt (namespace.c:1317)
[   80.367893][ T7985]  task_work_run (task_work.c:233)
[   80.372355][ T7985]  ? path_umount (namespace.c:1411 namespace.c:2051)
[   80.376816][ T7985]  ? __pfx_task_work_run (task_work.c:190)
[   80.381803][ T7985]  ? __x64_sys_umount (namespace.c:2070 namespace.c:2075 namespace.c:2073 namespace.c:2073)
[   80.386611][ T7985]  exit_to_user_mode_loop (linux/resume_user_mode.h:50 entry/common.c:70 entry/common.c:101)
[   80.391857][ T7985]  ? __do_sys_getegid (sys.c:1048 (discriminator 2))
[   80.396579][ T7985]  do_syscall_64 (linux/irq-entry-common.h:207 linux/irq-entry-common.h:230 linux/entry-common.h:318 x86/entry/syscall_64.c:100)
[   80.401040][ T7985]  ? __x64_sys_access (open.c:547 open.c:545 open.c:545)
[   80.405762][ T7985]  ? do_syscall_64 (linux/irq-entry-common.h:210 linux/irq-entry-common.h:230 linux/entry-common.h:318 x86/entry/syscall_64.c:100)
[   80.410400][ T7985]  ? do_syscall_64 (linux/irq-entry-common.h:210 linux/irq-entry-common.h:230 linux/entry-common.h:318 x86/entry/syscall_64.c:100)
[   80.415036][ T7985]  ? do_syscall_64 (linux/irq-entry-common.h:210 linux/irq-entry-common.h:230 linux/entry-common.h:318 x86/entry/syscall_64.c:100)
[   80.419672][ T7985]  ? do_syscall_64 (linux/randomize_kstack.h:57 x86/entry/syscall_64.c:92)
[   80.424220][ T7985]  entry_SYSCALL_64_after_hwframe (x86/entry/entry_64.S:121)
[   80.429990][ T7985] RIP: 0033:0x7fbb5f66d257
[   80.434277][ T7985] Code: 0d 00 f7 d8 64 89 02 b8 ff ff ff ff c3 66 0f 1f 44 00 00 31 f6 e9 09 00 00 00 66 0f 1f 84 00 00 00 00 00 b8 a6 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 8b 15 89 3b 0d 00 f7 d8 64 89 02 b8
All code
========
   0:	0d 00 f7 d8 64       	or     $0x64d8f700,%eax
   5:	89 02                	mov    %eax,(%rdx)
   7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   c:	c3                   	ret
   d:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  13:	31 f6                	xor    %esi,%esi
  15:	e9 09 00 00 00       	jmp    0x23
  1a:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  21:	00 00 
  23:	b8 a6 00 00 00       	mov    $0xa6,%eax
  28:	0f 05                	syscall
  2a:*	48 3d 00 f0 ff ff    	cmp    $0xfffffffffffff000,%rax		<-- trapping instruction
  30:	77 01                	ja     0x33
  32:	c3                   	ret
  33:	48 8b 15 89 3b 0d 00 	mov    0xd3b89(%rip),%rdx        # 0xd3bc3
  3a:	f7 d8                	neg    %eax
  3c:	64 89 02             	mov    %eax,%fs:(%rdx)
  3f:	b8                   	.byte 0xb8

Code starting with the faulting instruction
===========================================
   0:	48 3d 00 f0 ff ff    	cmp    $0xfffffffffffff000,%rax
   6:	77 01                	ja     0x9
   8:	c3                   	ret
   9:	48 8b 15 89 3b 0d 00 	mov    0xd3b89(%rip),%rdx        # 0xd3b99
  10:	f7 d8                	neg    %eax
  12:	64 89 02             	mov    %eax,%fs:(%rdx)
  15:	b8                   	.byte 0xb8


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260715/202607151422.5161cc44-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

