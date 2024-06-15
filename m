Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3343919D8A3
	for <oe-lkp@lists.linux.dev>; Sat, 15 Jun 2024 03:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718421704; cv=fail; b=DlhoYJUvzSmogTtiCk09cWbOyy9PmVQiNb6DT78T7yh+qEareyqyMKmPfMDPHKOMGAxiHl5OlmwEkZX4PD6yIlFg57SPLtNFAS4FxcRcj4DQI5Wvl4D07RvjPf8LMd7cc+e3HA0ptmDVskb7MUVhSOjzzUxsIPurlkMqEE4U830=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718421704; c=relaxed/simple;
	bh=oaPZypGmmS+A/QfZeZ9yAlZMKR+eZbC7guJk5PFUxkY=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=sKuEtFGh3sscueKZhF/QN/vH0gP+A5sPFpKSZWEglBNb9SNJem0MGRP81Rb+DppD947a7Q+IPZByEUkoKSvg95IWal1jRExvTkcfO2L7QtYgERfF3rh434g2a5uV7fDlXWLZeof6K9qyMtc3SWC8xe0nXxobhghRbQtSgy5hn8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wqkwq/4i; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wqkwq/4i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718421702; x=1749957702;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oaPZypGmmS+A/QfZeZ9yAlZMKR+eZbC7guJk5PFUxkY=;
  b=Wqkwq/4iZ11C/DVkQW/mNh+hRTr5HTvUEYSfgYwT+nqAa8lhE0uT7jCs
   aLOmaYWJmcKEBchTajg8uu1RI6NdpSrpNftueldMs3ee/Zl8l8IZCCejL
   gRQd7di3hck27pxhGAbEHIGG5qWypeK0SzqAAC6UiHefLrEprN7CzipJX
   W+nUT+TNPMRFD+WgHYSUMhuxF6FPa/8crBuPBG+nwRrCtnB1VbDOGnIdA
   PBmJgtMejAqjGxLO4DPCiIeyh97wqWJK0uFvlr6kRp5fIvBM3YJn8UOvY
   pB3YG9OteVE1J7hiJnE75iAOR6nlQfwDHRtF69/3Z0msr5RltnIpxnh8t
   g==;
X-CSE-ConnectionGUID: z9le3PhiTqWeYHVm4KG76w==
X-CSE-MsgGUID: cgsuWxIfRfaPeec8cC1IcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="32871949"
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; 
   d="scan'208";a="32871949"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 20:21:41 -0700
X-CSE-ConnectionGUID: S1ULeot+SdGsCON9ByrdaA==
X-CSE-MsgGUID: QHrlo5DrTXKB3fB6c70bRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; 
   d="scan'208";a="40557759"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 14 Jun 2024 20:21:41 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 14 Jun 2024 20:21:40 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 14 Jun 2024 20:21:40 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Jun 2024 20:21:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KIZci9fKG9UUyYLPoeMe2eLBG3bMbu1K8owhZZp6ifzqnLohApBHjs3mvIy2iBxYFjX38H+LP615jHKGLRvz4GGRO/2jqBZ2W+3hVLPuaA7opYlDE2iBaQRYbR3W7BtWFOUSzPjg58vx45trv+N47EQ3o5IR5G/PpLS49h7B6aSnsRpzCzdY7OlVo0nSrL3iTa4xg4nZfXNp0dSNe85UWE+8bOgASYdoXIR1WajcweTvCkfV4dq7c2+UuvVUHCGo5n8imKbmTgSm2f9ukiDs8uKF3OlABiMT1nAa+Z+vgQ15udMXoGWs7VOuHdJ4070AgvGT7Z1wgs74Oc2i9egOKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NNzRdJOf0Tu8H0WaGDPBYjonFx97uMV5OHYFnFjKzgE=;
 b=cUvXAylTK/1xzkAvV0CZDvhEkkq2pz1fY4Yas07ELgVcQ1wjznF5xb0r5QLacPtDuLd/umoNmPIZonaw8+fd/fg2ia8j5L1rwaFxrQ1Ns1SmrsjzPoNsIE50KI2V7QNtJ0Afm6SWLRwzIioPjnQ0LmqiYQ7zjQsRBBh/X4Qjy1c1mPJLEHfkhQ2LrRHfPhhUW5Z3L9kHgutQLlAC4u/Zw0fA+uQkpQ2xFsQXD1ykK8CDc/SSf1X3hC3W3qCZqC6YVlKXRR0Nxcz131k8qZgiR0QfgIAa0RZX3/n2XMAi5ldzZ2TcUg8vH/aJWOVr3pixGKRmNFOGFtsfW9oJT2reiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DM4PR11MB6384.namprd11.prod.outlook.com (2603:10b6:8:8a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.24; Sat, 15 Jun
 2024 03:21:33 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%2]) with mapi id 15.20.7677.026; Sat, 15 Jun 2024
 03:21:33 +0000
Date: Sat, 15 Jun 2024 11:21:24 +0800
From: kernel test robot <oliver.sang@intel.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Linux Memory Management List
	<linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, "Lorenzo
 Stoakes" <lstoakes@gmail.com>, Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@suse.cz>, <oliver.sang@intel.com>
Subject: [linux-next:master] [mm/mmap]  1c29a32ce6:
 BUG:Bad_page_cache_in_process
Message-ID: <202406151149.22b3f2e7-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::12) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DM4PR11MB6384:EE_
X-MS-Office365-Filtering-Correlation-Id: 76da712f-5177-44d2-9e96-08dc8cea41bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8WSdYJd24bhXwINozZthooQEbjVqcTJNC1/kom+POCvW52LhT4dlERpCgF10?=
 =?us-ascii?Q?Iu1AZk7QcmlDdzOQvhnfc4+4sPfbczcubTvmbbn8m1mjnynjXgK4io9UxV6o?=
 =?us-ascii?Q?m2qJTN9/40OFDJf2uXWGbdzSCeYfJgQbviEvnjf00948rUz2dSvD5yDeuooz?=
 =?us-ascii?Q?Z0n0AW4qXTl2a10dWtEO46AN94mR/35q1r3udsk1wMUf4HX/nP+3E/PWaI4j?=
 =?us-ascii?Q?VCX58xFxXSAhaHOo8vqzTy9TNuj1LJrJvj4yb3IrfTUShG9p7olWWYCC1JFx?=
 =?us-ascii?Q?6PgF0F8j4QMJ4tHfKmSeJQM1gTanI1ufomQfvtNHAcKEgEWqRrTwkAcVRnY1?=
 =?us-ascii?Q?y5Ex1sDCdDf1addjVGKJBoIkH9ow/2x4A/r9FiFbqypxKoTTy5eF4rCuC1Rk?=
 =?us-ascii?Q?hw9W/VfzQEUiAAFU/bXa5DTxdtcS7DYXHeu7udl3t5kTCQ6OKzteMzcuPQc9?=
 =?us-ascii?Q?nmkYtSToAxPtNrh3KCKbZBmC+thgYAPsoKfKZ6/Bibs0Jk3hQGZU/by5srwb?=
 =?us-ascii?Q?7/EYWxM5gZgaA7mKUOWO85OPLK8gPsYhbZEKyS4VQe/U5x8dn5puL5n7noTO?=
 =?us-ascii?Q?1BhlJtB0Xrf1/1aveXQUdpVth4cbqNhUrfxBHb5LBnGTEdkNwiZTPN7eFRgw?=
 =?us-ascii?Q?xbZyTfi2dUakgoKJQBoUJMU/BkvAAN6elfQl169IdhD7rI25rCY2DaDP6ICw?=
 =?us-ascii?Q?MjYNQvgTD8f+B8cR9sF3l4gz7Fo0XyMER41da5INHolyIa7nbUcBE1YbDSQy?=
 =?us-ascii?Q?oSZhv2NSmhKvhNfBI424oxaCDYlduVa3SnPkyxymtnWbt3w+l9186j/FIJAI?=
 =?us-ascii?Q?I9zREuRFn7L8sdHGHYKvZwaUnRhC1uHj6FdccJGYRt6nL4W/gJs8gZCm3NoC?=
 =?us-ascii?Q?BQqSvTN/NtrGYO7prrWemcPQQgpqP08wnlA8t9jt6AZhFJytzg9qKD5OpEid?=
 =?us-ascii?Q?dGQT5u8cWqWD+AOy/JVcZAlndamDvASNqbpEJcpLzwZX1t5P1m8n8jqYlXiL?=
 =?us-ascii?Q?sVYGNyNh3yShu+dxhW2D0lwdfacaZlrZGUtARwT0ZyHhzy/BTOR2pGgIVwI7?=
 =?us-ascii?Q?ISRugUpjmcQXJqHzn5iZijyb04CmE7euGIzdTEROX2pzyAWR9fvzsUDxXPoW?=
 =?us-ascii?Q?Z7CakP5hb5iU8/U6UWQMmYJFoF9nraFxsUmhKwfYxFwC8nyCMg1ywcrKAv2f?=
 =?us-ascii?Q?WR5VN+5WkPFtyBDkmbBudy1l4LB4Ald20Azpt3lQeEzUaxUGQCAlprWl/elk?=
 =?us-ascii?Q?BpXS30SmpU4aIlUUJVXdxDG/tsOOPZA8z0kHYHxzhg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(1800799021);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ra61uQ3NGn1QBrv9RH+ihypR0IfTydWxNy68qCThEn8x/oamj+rIWG0jphag?=
 =?us-ascii?Q?raIh9mW7m+5GkWD9NTcpnI9jOYQqG6KTGWxzB0AOThJslfaL47qsQavU7bjM?=
 =?us-ascii?Q?7cXx9MyhQMnFTxniXD1RYkRPb/ELIJQbQAT6Ns0gRbaUOMWEvxVn81tx0ThL?=
 =?us-ascii?Q?FhdisvWBZiWwPQ8pBBIwaAQHAjoiwnNS23211QVX+NAQqBUMXXayZNG1stqf?=
 =?us-ascii?Q?Ljpw0rkXGCQqVMQNT6PdGtnffwTGEE052QkYL8caN0gV+3gfch2tDoJg0Fdv?=
 =?us-ascii?Q?ndM6AByO8t+FQtud1Faz2p61dcQvIq+NJOQ8WjJSLuGFjAtDtndNmFbaTTM8?=
 =?us-ascii?Q?BrLaf/CmyDKXDXudZVOsgL1bZpXAGxAAthiW452+M+2wkC+YQ+jW4sXi6ui/?=
 =?us-ascii?Q?wz4jCxVFPy/ueofY7uzQzkyPvSAVEC85sjyY9MGVgb6mcZ3Hc59cOC45Sq1i?=
 =?us-ascii?Q?OkTUUZ01IhwMmrfLdqfg6NMQmI/23FqhfZQj9hiN4/fesBsG6qQU+LFCpi9v?=
 =?us-ascii?Q?rdIyyFwTJ5KRmtqMURa6U38HAOnSvn2b6GH7fks/N9aStiNPQ4vHBPf9ch/s?=
 =?us-ascii?Q?zJJ+QsNn6hE+iQm98IPLgAZE+TrIHD40Gy7FUgoBYadjdzYf48Wx56FVhUEI?=
 =?us-ascii?Q?h3XuTxNdgZrERe0f9EZVZVFm5UE8YvvB/JKjExjNgEbkLquJT2ILly5He952?=
 =?us-ascii?Q?Tzw1N4fo7zjzUWJB6Jap4Mz1Kn3vuVqievi1qE0XVJjrZHnVskdJgyHd7mC9?=
 =?us-ascii?Q?9/MGqbeXuJeUVLJqmBMDVSg4mHV/DCyMu/8kJrzRBUjyHNf5ojnUeCW6Az30?=
 =?us-ascii?Q?7Ad3s9V24WHBWOfNvioJf+oBsyEI0NPDtyis9Jo7H542ne6gbkJVMeRR0hGw?=
 =?us-ascii?Q?3l/ixqnhoO5u5sSFGyuVcbHNn38kKhIxMI3bLm/2FGURDzdPYHssDfBlkkDM?=
 =?us-ascii?Q?AC+wNtGIeYHgnfLMZ27zmDitOR6G0EIgX4tCLG14+Ej1bhdx2nV1uNDH7tYJ?=
 =?us-ascii?Q?wISwg3gMTo91riy1aq6+U+WEqhkyT2yin5jChvmHQRUHgy1Ucn17AD2U3nCQ?=
 =?us-ascii?Q?+qFgX/YzMolU9VuRdHp1EHYul/zroYG2FYC1vEB8gj8J4urRsjTmiAiTlOfZ?=
 =?us-ascii?Q?NEsr5MVJGj0F/GQG04LadzOE7khJGvknQrZObzc/x+IBMsK0jLqGyt0wureJ?=
 =?us-ascii?Q?Nj3OkTkjjBCJqPk5DJiI2DDfZo+eYJNDLKdLlfBGicUmu3h7VvFYiQRsa84B?=
 =?us-ascii?Q?mkTDYU9OT5i/Q/lB4BonNP+2ybu3T7b4ocAFlnihghx87kgIggAOZd9qkOod?=
 =?us-ascii?Q?WK3dzSJp4KR9kR5n9umdHM7mp38Rgq4BUDwfp4qmP2J9sFN5mfyS+V3eK2Xm?=
 =?us-ascii?Q?ebY2BPkZUoe4IOT++qD9lZBogWspr4BUZMcEne3PU5ypRk6NMfj2DabpHPQz?=
 =?us-ascii?Q?doyoEXiYw3CWHmkpyIM8Fp4Mw/rJhsQNQuc4hsPpuhMEBS4IIvU7Z0yX1cog?=
 =?us-ascii?Q?u0TuWFwQ8RzPgN3HU+vh/LsHU3fUk2b5JAanLUbldLH/OEUno9gs4+Phaoei?=
 =?us-ascii?Q?EKn0rawwRULddYypkyDWMc4s1OJd4ee/KrTxFec7B+dtXt7ZJs9fv2isEFOh?=
 =?us-ascii?Q?Qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 76da712f-5177-44d2-9e96-08dc8cea41bb
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2024 03:21:33.4187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j1ZA3QLdPuzJ0DIC6XmrOkHTYnPqgREP8rCMvGP5Ih42BjN2lWFLRASKLVDWTxzOuGYCSmEJ0GU8Rh10d72sWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6384
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:Bad_page_cache_in_process" on:

commit: 1c29a32ce65f4cd0f1c0f9cab128b1215647be4b ("mm/mmap: use split munmap calls for MAP_FIXED")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

[test failed on linux-next/master 6906a84c482f098d31486df8dc98cead21cce2d0]

in testcase: trinity
version: 
with following parameters:

	runtime: 300s
	group: group-04
	nr_groups: 5



compiler: clang-18
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


we noticed this issue does not always happen on 1c29a32ce6, but keeps clean
in our tests.

245d2058fb8a2aef 1c29a32ce65f4cd0f1c0f9cab12
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :20          40%           8:20    dmesg.BUG:Bad_page_cache_in_process


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202406151149.22b3f2e7-lkp@intel.com


[   50.563540][ T3511] BUG: Bad page cache in process trinity-main  pfn:184ba4
[   50.564103][ T3511] page: refcount:3 mapcount:1 mapping:00000000add575cf index:0x0 pfn:0x184ba4
[   50.564617][ T3511] aops:shmem_aops ino:41b
[   50.564870][ T3511] flags: 0x800000000004002d(locked|referenced|uptodate|lru|swapbacked|zone=2)
[   50.565372][ T3511] raw: 800000000004002d ffffea000612e8c8 ffffea000612e948 ffff8881276339c8
[   50.565855][ T3511] raw: 0000000000000000 0000000000000000 0000000300000000 0000000000000000
[   50.566337][ T3511] page dumped because: still mapped when deleted
[   50.566694][ T3511] page_owner tracks the page as allocated
[   50.567064][ T3511] page last allocated via order 0, migratetype Movable, gfp_mask 0x140cca(GFP_HIGHUSER_MOVABLE|__GFP_COMP), pid 3511, tgid 3511 (trinity-main), ts 50545206746, free_ts 0
[ 50.568015][ T3511] post_alloc_hook (mm/page_alloc.c:1453) 
[ 50.568356][ T3511] get_page_from_freelist (mm/page_alloc.c:? mm/page_alloc.c:3448) 
[ 50.568679][ T3511] __alloc_pages_noprof (mm/page_alloc.c:4707) 
[ 50.568976][ T3511] __folio_alloc_noprof (mm/page_alloc.c:4738) 
[ 50.569264][ T3511] shmem_get_folio_gfp (mm/shmem.c:1785 mm/shmem.c:2189) 
[ 50.569556][ T3511] shmem_fault (mm/shmem.c:2389) 
[ 50.569811][ T3511] __do_fault (mm/memory.c:4647) 
[ 50.570062][ T3511] do_pte_missing (mm/memory.c:5049) 
[ 50.570336][ T3511] handle_mm_fault (mm/memory.c:5503) 
[ 50.570616][ T3511] __get_user_pages (mm/gup.c:1292) 
[ 50.570896][ T3511] __mm_populate (mm/gup.c:2029) 
[ 50.571161][ T3511] vm_mmap_pgoff (include/linux/mm.h:?) 
[ 50.571426][ T3511] do_syscall_64 (arch/x86/entry/common.c:?) 
[ 50.571688][ T3511] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130) 
[   50.572026][ T3511] page_owner free stack trace missing
[   50.572333][ T3511] CPU: 1 PID: 3511 Comm: trinity-main Tainted: G            E      6.10.0-rc3-00201-g1c29a32ce65f #1
[   50.572955][ T3511] Call Trace:
[   50.573159][ T3511]  <TASK>
[ 50.573331][ T3511] dump_stack_lvl (lib/dump_stack.c:116) 
[ 50.573597][ T3511] filemap_unaccount_folio (mm/filemap.c:168) 
[ 50.573916][ T3511] __filemap_remove_folio (mm/filemap.c:139) 
[ 50.574223][ T3511] ? do_raw_spin_lock (arch/x86/include/asm/atomic.h:107) 
[ 50.574534][ T3511] filemap_remove_folio (include/linux/spinlock.h:401 mm/filemap.c:265) 
[ 50.574832][ T3511] truncate_inode_folio (mm/truncate.c:?) 
[ 50.575178][ T3511] shmem_undo_range (mm/shmem.c:1010) 
[ 50.575468][ T3511] ? lock_release (kernel/locking/lockdep.c:?) 
[ 50.575747][ T3511] ? mark_lock (arch/x86/include/asm/bitops.h:227 arch/x86/include/asm/bitops.h:239 include/asm-generic/bitops/instrumented-non-atomic.h:142 kernel/locking/lockdep.c:228 kernel/locking/lockdep.c:4656) 
[ 50.576031][ T3511] shmem_evict_inode (mm/shmem.c:1123 mm/shmem.c:1250) 
[ 50.576319][ T3511] ? evict (fs/inode.c:666) 
[ 50.576576][ T3511] ? do_raw_spin_unlock (arch/x86/include/asm/atomic.h:23) 
[ 50.576895][ T3511] evict (fs/inode.c:?) 
[ 50.577219][ T3511] __dentry_kill (fs/dcache.c:?) 
[ 50.577598][ T3511] ? rcu_read_unlock (include/linux/rcupdate.h:339 include/linux/rcupdate.h:812) 
[ 50.577989][ T3511] ? dput (include/linux/rcupdate.h:329 include/linux/rcupdate.h:781 fs/dcache.c:838) 
[ 50.578311][ T3511] ? dput (include/linux/rcupdate.h:329 include/linux/rcupdate.h:781 fs/dcache.c:838) 
[ 50.578635][ T3511] dput (fs/dcache.c:846) 
[ 50.578952][ T3511] __fput (fs/file_table.c:431) 
[ 50.579298][ T3511] task_work_run (kernel/task_work.c:181) 
[ 50.579687][ T3511] resume_user_mode_work (include/linux/resume_user_mode.h:?) 
[ 50.580111][ T3511] syscall_exit_to_user_mode (kernel/entry/common.c:124 include/linux/entry-common.h:328 kernel/entry/common.c:207 kernel/entry/common.c:218) 
[ 50.580532][ T3511] do_syscall_64 (arch/x86/entry/common.c:102) 
[ 50.580915][ T3511] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 50.581311][ T3511] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130) 
[   50.581837][ T3511] RIP: 0033:0x46356a
[ 50.582185][ T3511] Code: 89 f5 41 54 49 89 fc 55 53 74 35 49 63 e8 48 63 da 4d 89 f9 49 89 e8 4d 63 d6 48 89 da 4c 89 ee 4c 89 e7 b8 09 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 4e 5b 5d 41 5c 41 5d 41 5e 41 5f c3 0f 1f 00
All code
========
   0:	89 f5                	mov    %esi,%ebp
   2:	41 54                	push   %r12
   4:	49 89 fc             	mov    %rdi,%r12
   7:	55                   	push   %rbp
   8:	53                   	push   %rbx
   9:	74 35                	je     0x40
   b:	49 63 e8             	movslq %r8d,%rbp
   e:	48 63 da             	movslq %edx,%rbx
  11:	4d 89 f9             	mov    %r15,%r9
  14:	49 89 e8             	mov    %rbp,%r8
  17:	4d 63 d6             	movslq %r14d,%r10
  1a:	48 89 da             	mov    %rbx,%rdx
  1d:	4c 89 ee             	mov    %r13,%rsi
  20:	4c 89 e7             	mov    %r12,%rdi
  23:	b8 09 00 00 00       	mov    $0x9,%eax
  28:	0f 05                	syscall
  2a:*	48 3d 00 f0 ff ff    	cmp    $0xfffffffffffff000,%rax		<-- trapping instruction
  30:	77 4e                	ja     0x80
  32:	5b                   	pop    %rbx
  33:	5d                   	pop    %rbp
  34:	41 5c                	pop    %r12
  36:	41 5d                	pop    %r13
  38:	41 5e                	pop    %r14
  3a:	41 5f                	pop    %r15
  3c:	c3                   	ret
  3d:	0f 1f 00             	nopl   (%rax)

Code starting with the faulting instruction
===========================================
   0:	48 3d 00 f0 ff ff    	cmp    $0xfffffffffffff000,%rax
   6:	77 4e                	ja     0x56
   8:	5b                   	pop    %rbx
   9:	5d                   	pop    %rbp
   a:	41 5c                	pop    %r12
   c:	41 5d                	pop    %r13
   e:	41 5e                	pop    %r14
  10:	41 5f                	pop    %r15
  12:	c3                   	ret
  13:	0f 1f 00             	nopl   (%rax)
[   50.583785][ T3511] RSP: 002b:00007fff5f8e6528 EFLAGS: 00000246 ORIG_RAX: 0000000000000009
[   50.584258][ T3511] RAX: 0000000000000000 RBX: 0000000000000001 RCX: 000000000046356a
[   50.584715][ T3511] RDX: 0000000000000001 RSI: 0000000000001000 RDI: 0000000000000000
[   50.585158][ T3511] RBP: 00000000000000c2 R08: 00000000000000c2 R09: 0000000000000000
[   50.585601][ T3511] R10: 000000000004e872 R11: 0000000000000246 R12: 0000000000000000
[   50.586046][ T3511] R13: 0000000000001000 R14: 000000000004e872 R15: 0000000000000000
[   50.586508][ T3511]  </TASK>
[   50.586684][ T3511] Disabling lock debugging due to kernel taint
[   50.710726][ T3511] UDPLite: UDP-Lite is deprecated and scheduled to be removed in 2025, please contact the netdev mailing list
[   50.712269][ T3511] trinity-main uses obsolete (PF_INET,SOCK_PACKET)
[   50.839027][ T3511] UDPLite6: UDP-Lite is deprecated and scheduled to be removed in 2025, please contact the netdev mailing list


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240615/202406151149.22b3f2e7-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

