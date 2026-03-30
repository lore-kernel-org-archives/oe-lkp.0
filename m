Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B860D3D3CF6
	for <oe-lkp@lists.linux.dev>; Mon, 30 Mar 2026 13:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774876724; cv=fail; b=RSIiIYoA/U/DsF4Gf4Iw89Kv2RBLCptX7H0CgkTDJ76JB4e28z3n670yJEfnVX4XwZIPGR4jqrthqetKRMbfibffD1PsES/ZSY4uWvB8CSGLOROHQPJwaeulKdnae2nL5uNiKyoyiBFmto6TfwtZY087IS4pznQN9J2BLDiW02M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774876724; c=relaxed/simple;
	bh=hObpHxzJcoiTW6A1BCy58rcUGw01Exxr5bXiIsBodlc=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=gkVL3wHaz/hGPnD7XnHra27W9V0fRHhRLOLSVUJkIjNWrt7dC/kjc7geN8+NaEOR4w16N4N5byys/hwCbjPO/mXOp70lwXa1BRkXwEmX4dieKiIOHbQgRuECUfvCPNblXZdJpgvpOF+CW7Dt15Z4n+u8TlCMv3d8ljUEK77GZYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YxdbtHxL; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YxdbtHxL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774876721; x=1806412721;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=hObpHxzJcoiTW6A1BCy58rcUGw01Exxr5bXiIsBodlc=;
  b=YxdbtHxLc5vpB+fp1Pkey/caUUoHpbueKwdLZppx6kXt+szZ6NbT2uzR
   YobG/vTVAh/8P83QNufbf0nGEyaeV5AXH4uBR8qD1iES9gEUXomXrRXk3
   n9fDxUpP4EzynSOtAZ6yV7Sl4vxM+JGDeGdIAp3nLojFQAx2Xn97QZOo7
   kQvrtw5kmT+dA8NzliYAAulGdrIHhG8ftbJ2hZypu+wo30Uk2Bw1av/2D
   cYgYZXn3O5LhMq9+q6FZxWNXxX7xWltt9s5o55SuRYiqLz50VpCojrtYf
   UkmktUX2eW40U5e00rqyWilXA+4NEX+02FtfeTqstz6CCC44Yz1dCys9C
   Q==;
X-CSE-ConnectionGUID: svTV5sx3RSS9izhOHNJM2A==
X-CSE-MsgGUID: sDe/J7iPRD6GKlLYhUk5uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75578785"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="75578785"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 06:18:41 -0700
X-CSE-ConnectionGUID: uxe9JkGbQyiN1WNDW5yJwQ==
X-CSE-MsgGUID: RqQOz5SST/SqzHFUQjh6qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="256562829"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 06:18:40 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 06:18:39 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 30 Mar 2026 06:18:39 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.14) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 06:18:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lc20E2Fw9pil+kB64Emx6JcWxHVhDnI4A16VsgOm0XvUKHd2G1OdW4Q9BOB8D2sreZwzzZeGNt7XVGGQLpbSv5GOLOio0Sm5tZJ5QwhJ/RtLZg+KAMLISQj1IDIg2MtPpmyZq+q9FnjbZsn423cih4BbOwrP4CKJ+EGfudojxBFsgLEsmwR05TwdiCOPyY/+pB2JxRnjsd1p+/rvXKTarVDA7MNiRzHrRhyY9PvcVlv/MVRGgulbMRdvzNq6C+d7VH76kaaNiKcO5hCdc+zkCVLaj8gsnTQzQVEEPju3rWFIzBthM1E3uS8vFODSt1UzGbCjl78dWt7XgHdyS8EHFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TjMGsLdnP0cZOJTdzUWXW4ic+HtXaHLxpxtOw4bJpjA=;
 b=l1zNWxmPX84nyWoxf3qDtk6hIzKpe+G9ADfAhgB/yJfGlB6kXtZvrHcMbm/GoIXgT1t7OSIkKSIObxdA7Qtetrnfo8RyksBXh8Lkmc7LBwFQEomgB2xgItesYSz/4eIXHZzc1dU15frU2/GaAgrsk8vbsp5ZUClhv861SrY0bEpwa+k/HTQAn6ZHDR1wgt0IDDrd1mRGcsgXHr6C6/9PWniFjKfqAoQBLthbIHk4d41wkDsLODmO7kTDCHmodWZGbkkHUnom/7VSChMMj7gPMRUffOV3xSMdh6e/fxQ3m77qzQ7K9vTts/FbPZ4DrU9g0mCYERvoalI0R/gzMIPD7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by SA1PR11MB5826.namprd11.prod.outlook.com (2603:10b6:806:235::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 13:18:35 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%3]) with mapi id 15.20.9769.006; Mon, 30 Mar 2026
 13:18:35 +0000
Date: Mon, 30 Mar 2026 21:18:28 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Matthew Wilcox <willy@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	<oliver.sang@intel.com>
Subject: [tip:locking/core] [locking/rwsem]  1ea4b47350:
 stress-ng.bigheap.realloc_calls_per_sec 12.1% improvement
Message-ID: <202603302100.d3ef7f01-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: TP0P295CA0044.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:4::6)
 To PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|SA1PR11MB5826:EE_
X-MS-Office365-Filtering-Correlation-Id: a4201ae6-57e6-4b81-1165-08de8e5ed89e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 1Nep+CmgHhdwcV4WKi7r166AZe0DkYgvas+rOyp/BvSv9sIGPfs1ZA0yCDDaDz7blj1Sz9QR9Xtn5XFPTvdaPIhXcnGX6ffH7gvLcBd87lNWAvXY7vjD6SGShHBhaEWeD+093p7muJ9yA3C5DBfmUiAZq+Zf2jr9LIsBfbIZme3H/2YYMLpIYdV9kDhgmkMmlABTyQ0MsgKcIp09rifnUH8xZR+AZvJBcbXz/zv5wVbPbiYHOyqWWxb7UhmtOotTaxhKtzLur4udSpS7wbhGDg7xoA651Pkm5i2XZKT6YrBW3vCTvD+giYjWornLIXMkMZAj4OdfzgsfTJ0zspYzWYKJrsvJdHAYh/JcyvjGo5VyLTjOo26Oza/pXL/Ze4T4gsqgLwKRjmxNitcLObIJ0xDMBssuJY1BxuRmSbCgQOKPtngeT8h3/HTxR24qngcUr19aIO2epqFrpvsdIz1Bq18mwQNU6NAbTfKf2PTCSQz3juGFwfWiZT2Ongrevc5Q4VGl8hdqQ1W2V3N9lkBSUjx9eRhc+C3vZDk7xX3CGQdO8EU8gHYxnBSA2vyBoj8FvvFRr2t6fmdMFtn5ZxmD4IeYbxBbQFPnjUZMROFugElTMZk/dj2gTgT417gMmCZc8TrrRkqf3LU+2kgmYHUgQ1kjEssoE3szLVsrs866NVSQGB6CmjNiCOEXm5BV8ZX5
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?DZfcw2FDkmDlAXOaDK/54U4VwjPe7EybjhdSWxqKFTYXWZvT2mVL6Jf2Tn?=
 =?iso-8859-1?Q?+VN5sqfD70CFUdIvnI+DHQowovTtNjj3n/3hTY2QtinxVdeI008uSoARgD?=
 =?iso-8859-1?Q?Zt84xlcl1mfOxFqoehQd13JXzp+VSqZlJdgpFRBdjJT2yNfliyuXDezddJ?=
 =?iso-8859-1?Q?uB4k+LBydi4V3fcfpRtVcnxKFtAj1plrXOj9UYKT/UqDZJtgcnwSftUmJI?=
 =?iso-8859-1?Q?MMQO8CrDgYDZvhF3vlR8HFx92dd4z/0fY/azIGe+JDeEMwVwI8vVU7M13r?=
 =?iso-8859-1?Q?Diyqa5+/6DKfe62gRCpF9yWcw3WlA/Wb9MMytA74Gl7E8q1t2NDV6tHxE8?=
 =?iso-8859-1?Q?hyChMx+ZafhDpan57kyMzKCb3eM/rPQggvh2zCDvP7FnVtoPaRhuaZ2maf?=
 =?iso-8859-1?Q?6/Ql3aOUs+nbc+nU0cjCCe3pTtVXqznkAOVTcwFiDZKr2azuYPMMSae+t0?=
 =?iso-8859-1?Q?Q5SOYUgrGL5imZ+J3ahTSF/2mJt15MYZsjBllNFPrPG9kC/+ivTxyTeKmb?=
 =?iso-8859-1?Q?LTximhoGO7ltvyczUpBM/tvRDq1C6jWq+KLqbOEob1daDJTnqEJdFIwJlQ?=
 =?iso-8859-1?Q?ow9Cf8pRB4tnX9NtiU0FR13et/8LAwJ9v04znuMaRxOJBg9Rfpr7NUudw4?=
 =?iso-8859-1?Q?fHhZhmf1cOYwpRxKJnRzdl3oUCMMyZbv6AEx8hS1q7wVvc5ZgD0ZtzzhjM?=
 =?iso-8859-1?Q?wOZ0ROzeU4FHGhqGN2Ra2+sEErENJiWHRBFZlGq7zAQylSoIkmfXUxYTCK?=
 =?iso-8859-1?Q?mUcWqdyn5brcZ+PYFGnlU+nGyqZyKc+0XqSBIAPbEyzgXfcZdo6qAhYsw2?=
 =?iso-8859-1?Q?s9oGPi1KzmJGGT0kQ134FCx5KBMQg6o503KSbRPiLPnbOTJCnbG4ANQ3Qy?=
 =?iso-8859-1?Q?d4MQojs/kf/VR4gi1Hp25Nvq9Ph9///kDK04InMeWSUfG/AEIqxrJXT9f/?=
 =?iso-8859-1?Q?r5Xm/FqR0qzTZnUl8Cw1KPQVruZHVyLZ9UMjZfOJYVSjAjabzMghIjOgcU?=
 =?iso-8859-1?Q?65kRHGxHt6pBPXH0r9SJ1u5Lv8c8KGwV48hh4tFpw0QHZPwQjd8ChUE18o?=
 =?iso-8859-1?Q?6Z9iTvrwLRX0eISZFI/qyZBElwahbUtc9s5xUir0PZNvlJ1Q4k/4MBmRFD?=
 =?iso-8859-1?Q?9GJxOroW28dSPzYd2pvBv0Js5tqlx42gfolPdNVI0KK690KZvg0pwcgA/f?=
 =?iso-8859-1?Q?aDiKe3uHr5I8UtNzxoCXo0b2O2kq2ZIhDI630xZ07kxzjqyMZgNfYlgwfx?=
 =?iso-8859-1?Q?in+NAwNsv8UHJKqG2XYYh8LU2drKb2tFED+RynTnQX7M80pSKYpLnbRiMU?=
 =?iso-8859-1?Q?1dRRRg0/tA9PsbtEqOqumsYBtT5Quc+9z7d1TjD+xJsOfPpCKXOa93XNSm?=
 =?iso-8859-1?Q?HL8jq7KlkTV+50VcUi9+io8g3ZdYX0Azls+IJikMJgu7WC+Oa49ff33wmB?=
 =?iso-8859-1?Q?SHSbQfExQSbY0pHBdcBdtJqM/25nTYqxlAsZchNiZSYAeveWUEQ96Dn+5r?=
 =?iso-8859-1?Q?KGj6y/MEdk0qh8RysBERUuIs3a+OxYChMfHpQBbixb7DOvrDaz60E2RYu7?=
 =?iso-8859-1?Q?2Fmddbzwosi7JcjklsGIKszz/lpD4JDko0pDEvSD6c+ET8w81EfAWi5hNj?=
 =?iso-8859-1?Q?iqTY0I2X0JIYuGlpngwSndLLhYkU9cccmSQoWhz4jxaJfsIMrHc5NVE2IK?=
 =?iso-8859-1?Q?Ewb3SEetEXtdGHyefenkQhCqGl4JkKv3+oPOIgC7Ni0ywjp9st+qQOnO4j?=
 =?iso-8859-1?Q?K7XxDoTEidN9zOJGjGtSqyfFWNRamm6v7vfEQD43H7uSgl2z2Ds/WjYM5j?=
 =?iso-8859-1?Q?0j3Wt8Um2Q=3D=3D?=
X-Exchange-RoutingPolicyChecked: ZY1bWwLGh2H9zxHzoBplmnfa5lLjk4NtG+5Hv5n31VtX2ds2wB7lp+XdGcFpDfvA96Mh72gKaghQBg0GF5Hr+4DEgeR9fkwQ//R4XYLs36021YJwbk2DY2XrwZLkfNHxWXocSEFyA+CiLCbkBgMycquMzdd/JqYC8x3AfmgFYcbzD6lPxdyf7O2uVz76fL5tmeWVX8aF4hs2nR6OAXSTPteLealePcAuITjuUTQ+y20pOzfDTPXBFT8vY2SbF492ILkG+PZ7nVWSFaM87Qxn+2aAqB7pvSrIEpqfjF1VYjPHTLoQmILxdT0usUekmgxAXucMHSt95zbxXAMscRCEBg==
X-MS-Exchange-CrossTenant-Network-Message-Id: a4201ae6-57e6-4b81-1165-08de8e5ed89e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 13:18:35.0104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1sieds4RQwyfDto/2bhcFnoIah49/Svln/VZ4eQds5hGvA7gRJl6oljEcAzNzmob200h9uWpsQxUcSHaxhNReQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5826
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 12.1% improvement of stress-ng.bigheap.realloc_calls_per_sec on:


commit: 1ea4b473504b6dc6a0d21c298519aff2d52433c9 ("locking/rwsem: Remove the list_head from struct rw_semaphore")
https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git locking/core


testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 256 threads 4 sockets INTEL(R) XEON(R) PLATINUM 8592+ (Emerald Rapids) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: bigheap
	cpufreq_governor: performance



Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260330/202603302100.d3ef7f01-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-emr-2sp1/bigheap/stress-ng/60s

commit: 
  b91d5d4bcf ("rust: atomic: Update a safety comment in impl of `fetch_add()`")
  1ea4b47350 ("locking/rwsem: Remove the list_head from struct rw_semaphore")

b91d5d4bcf126625 1ea4b473504b6dc6a0d21c29851 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
  65871407           +15.5%   76099620        stress-ng.bigheap.ops
   1092966           +15.3%    1260047        stress-ng.bigheap.ops_per_sec
    656434           +12.1%     735803        stress-ng.bigheap.realloc_calls_per_sec
 1.054e+09           +15.5%  1.218e+09        stress-ng.time.minor_page_faults
    375.32           +22.4%     459.54        stress-ng.time.user_time
      2.71            +0.5        3.25        mpstat.cpu.all.usr%
      2079 ± 19%     -49.5%       1049 ± 21%  perf-c2c.HITM.remote
     10266 ± 11%     -16.1%       8609 ± 10%  perf-c2c.HITM.total
     46.42 ± 22%     +68.6%      78.24 ± 24%  perf-sched.sch_delay.max.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
     46.42 ± 22%     +68.6%      78.24 ± 24%  perf-sched.total_sch_delay.max.ms
      0.18           +11.1%       0.20        turbostat.IPC
     47.04 ±  9%     +29.4       76.40 ±  5%  turbostat.PKG_%
     38.24            +4.7%      40.02        turbostat.RAMWatt
      3.31           +11.1%       3.67        perf-stat.i.MPKI
 2.849e+10            +7.2%  3.053e+10        perf-stat.i.branch-instructions
  36284203 ±  4%      +8.2%   39256911 ±  3%  perf-stat.i.branch-misses
     32.15            +4.5       36.66        perf-stat.i.cache-miss-rate%
 4.536e+08           +22.4%  5.554e+08        perf-stat.i.cache-misses
 1.395e+09            +6.7%  1.489e+09        perf-stat.i.cache-references
      5.37            -7.4%       4.98        perf-stat.i.cpi
      1896           -12.4%       1661 ±  2%  perf-stat.i.cycles-between-cache-misses
 1.376e+11            +8.7%  1.496e+11        perf-stat.i.instructions
      0.19            +8.2%       0.20        perf-stat.i.ipc
    139.10           +14.8%     159.64        perf-stat.i.metric.K/sec
  17838796           +14.9%   20500158        perf-stat.i.minor-faults
  17838796           +14.9%   20500158        perf-stat.i.page-faults
      3.26           +12.9%       3.68        perf-stat.overall.MPKI
     32.44            +4.7       37.16        perf-stat.overall.cache-miss-rate%
      5.39            -7.5%       4.98        perf-stat.overall.cpi
      1650           -18.0%       1352        perf-stat.overall.cycles-between-cache-misses
      0.19            +8.1%       0.20        perf-stat.overall.ipc
 2.751e+10            +6.6%  2.932e+10        perf-stat.ps.branch-instructions
 4.338e+08           +22.0%  5.293e+08        perf-stat.ps.cache-misses
 1.337e+09            +6.5%  1.424e+09        perf-stat.ps.cache-references
 1.329e+11            +8.1%  1.437e+11        perf-stat.ps.instructions
  17041476           +14.6%   19533609        perf-stat.ps.minor-faults
  17041476           +14.6%   19533610        perf-stat.ps.page-faults
 7.937e+12            +7.5%  8.535e+12        perf-stat.total.instructions
     52.50           -15.8       36.72 ±  6%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.si_swapinfo.do_sysinfo.__do_sys_sysinfo
     52.65           -15.8       36.88 ±  6%  perf-profile.calltrace.cycles-pp.si_swapinfo.do_sysinfo.__do_sys_sysinfo.do_syscall_64.entry_SYSCALL_64_after_hwframe
     52.65           -15.8       36.88 ±  6%  perf-profile.calltrace.cycles-pp._raw_spin_lock.si_swapinfo.do_sysinfo.__do_sys_sysinfo.do_syscall_64
     53.44            -6.8       46.66 ±  2%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.sysinfo
     53.42            -6.8       46.65 ±  2%  perf-profile.calltrace.cycles-pp.__do_sys_sysinfo.do_syscall_64.entry_SYSCALL_64_after_hwframe.sysinfo
     53.44            -6.8       46.67 ±  2%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.sysinfo
     53.47            -6.8       46.71 ±  2%  perf-profile.calltrace.cycles-pp.sysinfo
     53.25            -6.7       46.53 ±  2%  perf-profile.calltrace.cycles-pp.do_sysinfo.__do_sys_sysinfo.do_syscall_64.entry_SYSCALL_64_after_hwframe.sysinfo
      0.96            +0.1        1.09 ±  3%  perf-profile.calltrace.cycles-pp.sync_regs.asm_exc_page_fault.stress_bigheap_child
      1.67            +0.4        2.10 ±  3%  perf-profile.calltrace.cycles-pp.kernel_init_pages.prep_new_page.get_page_from_freelist.__alloc_frozen_pages_noprof.alloc_pages_mpol
      1.72            +0.4        2.15 ±  3%  perf-profile.calltrace.cycles-pp.prep_new_page.get_page_from_freelist.__alloc_frozen_pages_noprof.alloc_pages_mpol.vma_alloc_folio_noprof
      0.00            +0.6        0.56 ±  3%  perf-profile.calltrace.cycles-pp.lru_add.folio_batch_move_lru.__folio_batch_add_and_move.do_anonymous_page.__handle_mm_fault
      0.08 ±223%      +0.6        0.65 ±  2%  perf-profile.calltrace.cycles-pp.rmqueue.get_page_from_freelist.__alloc_frozen_pages_noprof.alloc_pages_mpol.vma_alloc_folio_noprof
      0.00            +0.6        0.58 ±  2%  perf-profile.calltrace.cycles-pp.folio_add_new_anon_rmap.do_anonymous_page.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      2.32            +0.7        2.98 ±  3%  perf-profile.calltrace.cycles-pp.get_page_from_freelist.__alloc_frozen_pages_noprof.alloc_pages_mpol.vma_alloc_folio_noprof.alloc_anon_folio
      2.43            +0.7        3.12 ±  3%  perf-profile.calltrace.cycles-pp.__alloc_frozen_pages_noprof.alloc_pages_mpol.vma_alloc_folio_noprof.alloc_anon_folio.do_anonymous_page
      2.50            +0.7        3.20 ±  3%  perf-profile.calltrace.cycles-pp.alloc_pages_mpol.vma_alloc_folio_noprof.alloc_anon_folio.do_anonymous_page.__handle_mm_fault
      2.60            +0.7        3.31 ±  3%  perf-profile.calltrace.cycles-pp.vma_alloc_folio_noprof.alloc_anon_folio.do_anonymous_page.__handle_mm_fault.handle_mm_fault
      0.86 ± 27%      +0.8        1.64 ± 12%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.folio_batch_move_lru.__folio_batch_add_and_move.do_anonymous_page
      0.84 ± 27%      +0.8        1.62 ± 13%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.folio_batch_move_lru.__folio_batch_add_and_move
      0.86 ± 26%      +0.8        1.65 ± 12%  perf-profile.calltrace.cycles-pp.folio_lruvec_lock_irqsave.folio_batch_move_lru.__folio_batch_add_and_move.do_anonymous_page.__handle_mm_fault
      1.51 ± 15%      +0.9        2.40 ±  9%  perf-profile.calltrace.cycles-pp.folio_batch_move_lru.__folio_batch_add_and_move.do_anonymous_page.__handle_mm_fault.handle_mm_fault
      1.82            +0.9        2.73 ±  6%  perf-profile.calltrace.cycles-pp.__mem_cgroup_charge.alloc_anon_folio.do_anonymous_page.__handle_mm_fault.handle_mm_fault
      1.60 ± 14%      +0.9        2.50 ±  8%  perf-profile.calltrace.cycles-pp.__folio_batch_add_and_move.do_anonymous_page.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      1.74            +0.9        2.66 ±  4%  perf-profile.calltrace.cycles-pp.pte_offset_map_lock.do_anonymous_page.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      0.00            +1.0        0.97 ± 54%  perf-profile.calltrace.cycles-pp.get_mem_cgroup_from_mm.__mem_cgroup_charge.alloc_anon_folio.do_anonymous_page.__handle_mm_fault
      4.52            +1.6        6.16 ±  3%  perf-profile.calltrace.cycles-pp.alloc_anon_folio.do_anonymous_page.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
     26.88            +1.7       28.56 ±  5%  perf-profile.calltrace.cycles-pp.__page_cache_release.folios_put_refs.free_pages_and_swap_cache.__tlb_batch_free_encoded_pages.tlb_flush_mmu
     28.94            +1.7       30.66 ±  5%  perf-profile.calltrace.cycles-pp.folios_put_refs.free_pages_and_swap_cache.__tlb_batch_free_encoded_pages.tlb_flush_mmu.zap_pte_range
     28.98            +1.7       30.70 ±  5%  perf-profile.calltrace.cycles-pp.free_pages_and_swap_cache.__tlb_batch_free_encoded_pages.tlb_flush_mmu.zap_pte_range.zap_pmd_range
     28.98            +1.7       30.71 ±  6%  perf-profile.calltrace.cycles-pp.__tlb_batch_free_encoded_pages.tlb_flush_mmu.zap_pte_range.zap_pmd_range.unmap_page_range
     28.98            +1.7       30.71 ±  6%  perf-profile.calltrace.cycles-pp.tlb_flush_mmu.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_vmas
     29.33            +1.7       31.07 ±  6%  perf-profile.calltrace.cycles-pp.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_vmas.unmap_region
     29.33            +1.7       31.08 ±  5%  perf-profile.calltrace.cycles-pp.unmap_page_range.unmap_vmas.unmap_region.vms_complete_munmap_vmas.do_vmi_align_munmap
     29.33            +1.7       31.08 ±  5%  perf-profile.calltrace.cycles-pp.unmap_vmas.unmap_region.vms_complete_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap
     29.33            +1.7       31.08 ±  5%  perf-profile.calltrace.cycles-pp.zap_pmd_range.unmap_page_range.unmap_vmas.unmap_region.vms_complete_munmap_vmas
     27.13            +1.8       28.93 ±  6%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.__page_cache_release.folios_put_refs
     27.15            +1.8       28.95 ±  6%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.__page_cache_release.folios_put_refs.free_pages_and_swap_cache
     27.15            +1.8       28.95 ±  6%  perf-profile.calltrace.cycles-pp.folio_lruvec_lock_irqsave.__page_cache_release.folios_put_refs.free_pages_and_swap_cache.__tlb_batch_free_encoded_pages
     29.98            +1.9       31.88 ±  6%  perf-profile.calltrace.cycles-pp.__munmap
     29.98            +1.9       31.88 ±  6%  perf-profile.calltrace.cycles-pp.__vm_munmap.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
     29.98            +1.9       31.88 ±  6%  perf-profile.calltrace.cycles-pp.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
     29.98            +1.9       31.88 ±  6%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
     29.98            +1.9       31.88 ±  6%  perf-profile.calltrace.cycles-pp.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap.__x64_sys_munmap.do_syscall_64
     29.98            +1.9       31.88 ±  6%  perf-profile.calltrace.cycles-pp.do_vmi_munmap.__vm_munmap.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe
     29.98            +1.9       31.88 ±  6%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__munmap
     29.98            +1.9       31.88 ±  6%  perf-profile.calltrace.cycles-pp.unmap_region.vms_complete_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap
     29.98            +1.9       31.88 ±  6%  perf-profile.calltrace.cycles-pp.vms_complete_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap.__x64_sys_munmap
      8.76 ±  3%      +3.7       12.48 ±  3%  perf-profile.calltrace.cycles-pp.do_anonymous_page.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault
      9.13 ±  3%      +3.8       12.91 ±  3%  perf-profile.calltrace.cycles-pp.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      9.41 ±  3%      +3.8       13.25 ±  3%  perf-profile.calltrace.cycles-pp.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.stress_bigheap_child
     10.00 ±  3%      +3.9       13.91 ±  3%  perf-profile.calltrace.cycles-pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.stress_bigheap_child
     10.06 ±  3%      +3.9       13.98 ±  3%  perf-profile.calltrace.cycles-pp.exc_page_fault.asm_exc_page_fault.stress_bigheap_child
     14.61 ±  2%      +4.5       19.13 ±  3%  perf-profile.calltrace.cycles-pp.asm_exc_page_fault.stress_bigheap_child
     14.43 ±  2%      +4.7       19.14 ±  3%  perf-profile.calltrace.cycles-pp.stress_bigheap_child
      0.49 ± 45%      +9.1        9.60 ± 24%  perf-profile.calltrace.cycles-pp.si_meminfo.do_sysinfo.__do_sys_sysinfo.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.36 ± 71%      +9.2        9.53 ± 24%  perf-profile.calltrace.cycles-pp.nr_blockdev_pages.si_meminfo.do_sysinfo.__do_sys_sysinfo.do_syscall_64
      0.18 ±141%      +9.3        9.49 ± 24%  perf-profile.calltrace.cycles-pp._raw_spin_lock.nr_blockdev_pages.si_meminfo.do_sysinfo.__do_sys_sysinfo
      0.08 ±223%      +9.3        9.40 ± 24%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.nr_blockdev_pages.si_meminfo.do_sysinfo
     52.65           -15.8       36.88 ±  6%  perf-profile.children.cycles-pp.si_swapinfo
     53.42            -6.8       46.65 ±  2%  perf-profile.children.cycles-pp.__do_sys_sysinfo
     53.48            -6.8       46.72 ±  2%  perf-profile.children.cycles-pp.sysinfo
     53.23            -6.7       46.48 ±  2%  perf-profile.children.cycles-pp._raw_spin_lock
     53.25            -6.7       46.54 ±  2%  perf-profile.children.cycles-pp.do_sysinfo
     84.09            -4.9       79.21        perf-profile.children.cycles-pp.do_syscall_64
     84.09            -4.9       79.21        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     82.57            -4.2       78.40        perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      0.30            -0.1        0.24 ±  4%  perf-profile.children.cycles-pp.expand_vma
      0.17 ±  2%      -0.1        0.11 ±  4%  perf-profile.children.cycles-pp._copy_to_user
      0.07            +0.0        0.08        perf-profile.children.cycles-pp.__pte_offset_map
      0.11            +0.0        0.12        perf-profile.children.cycles-pp.mod_lruvec_state
      0.06            +0.0        0.07        perf-profile.children.cycles-pp.arch_exit_to_user_mode_prepare
      0.06            +0.0        0.07        perf-profile.children.cycles-pp.pte_offset_map_rw_nolock
      0.07            +0.0        0.08 ±  5%  perf-profile.children.cycles-pp.irqentry_exit
      0.05            +0.0        0.06 ±  7%  perf-profile.children.cycles-pp.count_memcg_events
      0.07 ±  5%      +0.0        0.09 ±  4%  perf-profile.children.cycles-pp._raw_spin_trylock
      0.11            +0.0        0.13 ±  4%  perf-profile.children.cycles-pp.vma_merge_new_range
      0.08            +0.0        0.10        perf-profile.children.cycles-pp.__mod_zone_page_state
      0.14            +0.0        0.16 ±  4%  perf-profile.children.cycles-pp.mas_walk
      0.09 ±  4%      +0.0        0.12 ±  4%  perf-profile.children.cycles-pp.css_rstat_updated
      0.18            +0.0        0.21        perf-profile.children.cycles-pp.mod_node_page_state
      0.22            +0.0        0.25 ±  2%  perf-profile.children.cycles-pp.___perf_sw_event
      0.14 ±  4%      +0.0        0.17 ±  8%  perf-profile.children.cycles-pp.move_ptes
      0.06            +0.0        0.09 ±  4%  perf-profile.children.cycles-pp.page_counter_try_charge
      0.14            +0.0        0.17 ±  4%  perf-profile.children.cycles-pp.vma_merge_extend
      0.28            +0.0        0.32 ±  3%  perf-profile.children.cycles-pp.__perf_sw_event
      0.27            +0.0        0.31 ±  3%  perf-profile.children.cycles-pp.lock_vma_under_rcu
      0.19 ±  3%      +0.0        0.23 ±  9%  perf-profile.children.cycles-pp.copy_vma_and_data
      0.19 ±  3%      +0.0        0.23 ±  9%  perf-profile.children.cycles-pp.move_page_tables
      0.22 ±  3%      +0.0        0.26 ±  9%  perf-profile.children.cycles-pp.move_vma
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.perf_swevent_event
      0.11 ±  3%      +0.1        0.17 ±  5%  perf-profile.children.cycles-pp.expand
      0.37 ± 13%      +0.1        0.43 ±  4%  perf-profile.children.cycles-pp.cmd_record
      0.38            +0.1        0.44 ±  3%  perf-profile.children.cycles-pp.lru_gen_add_folio
      0.12 ± 48%      +0.1        0.19 ±  5%  perf-profile.children.cycles-pp.add_callchain_ip
      0.50            +0.1        0.57 ±  3%  perf-profile.children.cycles-pp.lru_add
      0.16 ± 48%      +0.1        0.24 ±  6%  perf-profile.children.cycles-pp.__thread__resolve_callchain
      0.17 ± 48%      +0.1        0.25 ±  7%  perf-profile.children.cycles-pp.sample__for_each_callchain_node
      0.32 ±  2%      +0.1        0.41 ±  3%  perf-profile.children.cycles-pp.mod_memcg_lruvec_state
      0.17 ± 49%      +0.1        0.26 ±  6%  perf-profile.children.cycles-pp.build_id__mark_dso_hit
      0.18 ± 48%      +0.1        0.28 ±  6%  perf-profile.children.cycles-pp.__ordered_events__flush
      0.18 ± 49%      +0.1        0.28 ±  6%  perf-profile.children.cycles-pp.perf_session__deliver_event
      0.36 ±  2%      +0.1        0.48 ±  2%  perf-profile.children.cycles-pp.__folio_mod_stat
      0.45            +0.1        0.57 ±  2%  perf-profile.children.cycles-pp.lruvec_stat_mod_folio
      0.46            +0.1        0.58 ±  2%  perf-profile.children.cycles-pp.folio_add_new_anon_rmap
      0.97            +0.1        1.10 ±  2%  perf-profile.children.cycles-pp.sync_regs
      0.30 ±  9%      +0.1        0.44 ±  4%  perf-profile.children.cycles-pp.rmqueue_bulk
      0.94 ±  2%      +0.1        1.08 ±  3%  perf-profile.children.cycles-pp.native_irq_return_iret
      0.35 ±  7%      +0.2        0.51 ±  3%  perf-profile.children.cycles-pp.__rmqueue_pcplist
      0.51 ±  5%      +0.2        0.69 ±  2%  perf-profile.children.cycles-pp.rmqueue
      1.70            +0.4        2.13 ±  3%  perf-profile.children.cycles-pp.kernel_init_pages
      1.74            +0.4        2.17 ±  3%  perf-profile.children.cycles-pp.prep_new_page
      0.36 ±  5%      +0.6        0.98 ± 54%  perf-profile.children.cycles-pp.get_mem_cgroup_from_mm
      2.36            +0.7        3.02 ±  3%  perf-profile.children.cycles-pp.get_page_from_freelist
      2.49            +0.7        3.18 ±  3%  perf-profile.children.cycles-pp.__alloc_frozen_pages_noprof
      2.57            +0.7        3.28 ±  3%  perf-profile.children.cycles-pp.alloc_pages_mpol
      2.61            +0.7        3.32 ±  3%  perf-profile.children.cycles-pp.vma_alloc_folio_noprof
      1.54 ± 15%      +0.9        2.44 ±  9%  perf-profile.children.cycles-pp.folio_batch_move_lru
      1.63 ± 14%      +0.9        2.53 ±  8%  perf-profile.children.cycles-pp.__folio_batch_add_and_move
      1.85            +0.9        2.76 ±  5%  perf-profile.children.cycles-pp.__mem_cgroup_charge
      1.76            +0.9        2.68 ±  4%  perf-profile.children.cycles-pp.pte_offset_map_lock
      4.55            +1.7        6.20 ±  3%  perf-profile.children.cycles-pp.alloc_anon_folio
     28.98            +1.7       30.71 ±  6%  perf-profile.children.cycles-pp.tlb_flush_mmu
     29.36            +1.7       31.11 ±  5%  perf-profile.children.cycles-pp.unmap_page_range
     29.36            +1.7       31.11 ±  5%  perf-profile.children.cycles-pp.unmap_vmas
     29.36            +1.7       31.11 ±  5%  perf-profile.children.cycles-pp.zap_pmd_range
     29.36            +1.7       31.11 ±  5%  perf-profile.children.cycles-pp.zap_pte_range
     27.51            +1.8       29.34 ±  6%  perf-profile.children.cycles-pp.__page_cache_release
     29.64            +1.9       31.52 ±  6%  perf-profile.children.cycles-pp.__tlb_batch_free_encoded_pages
     29.64            +1.9       31.52 ±  6%  perf-profile.children.cycles-pp.free_pages_and_swap_cache
     29.68            +1.9       31.56 ±  6%  perf-profile.children.cycles-pp.folios_put_refs
     29.98            +1.9       31.88 ±  6%  perf-profile.children.cycles-pp.__munmap
     29.98            +1.9       31.88 ±  6%  perf-profile.children.cycles-pp.__vm_munmap
     29.98            +1.9       31.88 ±  6%  perf-profile.children.cycles-pp.__x64_sys_munmap
     30.01            +1.9       31.91 ±  6%  perf-profile.children.cycles-pp.do_vmi_munmap
     30.02            +1.9       31.92 ±  6%  perf-profile.children.cycles-pp.do_vmi_align_munmap
     30.02            +1.9       31.92 ±  6%  perf-profile.children.cycles-pp.unmap_region
     30.02            +1.9       31.92 ±  6%  perf-profile.children.cycles-pp.vms_complete_munmap_vmas
     28.06            +2.6       30.64 ±  5%  perf-profile.children.cycles-pp.folio_lruvec_lock_irqsave
     29.68            +2.6       32.32 ±  5%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      8.82 ±  3%      +3.7       12.56 ±  3%  perf-profile.children.cycles-pp.do_anonymous_page
      9.14 ±  3%      +3.8       12.92 ±  3%  perf-profile.children.cycles-pp.__handle_mm_fault
      9.43 ±  3%      +3.8       13.27 ±  3%  perf-profile.children.cycles-pp.handle_mm_fault
     10.02 ±  3%      +3.9       13.94 ±  3%  perf-profile.children.cycles-pp.do_user_addr_fault
     10.07 ±  3%      +3.9       14.00 ±  3%  perf-profile.children.cycles-pp.exc_page_fault
     13.04 ±  2%      +4.3       17.35 ±  3%  perf-profile.children.cycles-pp.asm_exc_page_fault
     15.35 ±  2%      +4.8       20.16 ±  3%  perf-profile.children.cycles-pp.stress_bigheap_child
      0.50 ± 15%      +9.0        9.54 ± 24%  perf-profile.children.cycles-pp.nr_blockdev_pages
      0.55 ± 13%      +9.0        9.60 ± 24%  perf-profile.children.cycles-pp.si_meminfo
     82.38            -4.1       78.24        perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      0.16 ±  2%      -0.1        0.11 ±  4%  perf-profile.self.cycles-pp._copy_to_user
      0.05            +0.0        0.06        perf-profile.self.cycles-pp.__rmqueue_pcplist
      0.07            +0.0        0.08        perf-profile.self.cycles-pp._raw_spin_trylock
      0.06            +0.0        0.07 ±  5%  perf-profile.self.cycles-pp.folio_add_lru
      0.09            +0.0        0.10 ±  4%  perf-profile.self.cycles-pp.folio_add_new_anon_rmap
      0.11            +0.0        0.12 ±  4%  perf-profile.self.cycles-pp.lru_add
      0.08 ±  5%      +0.0        0.10 ±  3%  perf-profile.self.cycles-pp.rmqueue
      0.14            +0.0        0.16 ±  3%  perf-profile.self.cycles-pp.lock_vma_under_rcu
      0.11 ±  3%      +0.0        0.13 ±  2%  perf-profile.self.cycles-pp.handle_mm_fault
      0.05            +0.0        0.07 ±  7%  perf-profile.self.cycles-pp.si_meminfo
      0.13 ±  2%      +0.0        0.14 ±  3%  perf-profile.self.cycles-pp.do_user_addr_fault
      0.08            +0.0        0.10 ±  4%  perf-profile.self.cycles-pp.folio_batch_move_lru
      0.14 ±  3%      +0.0        0.16 ±  3%  perf-profile.self.cycles-pp.mas_walk
      0.07            +0.0        0.09        perf-profile.self.cycles-pp.__mod_zone_page_state
      0.07 ±  7%      +0.0        0.09 ±  5%  perf-profile.self.cycles-pp.rmqueue_bulk
      0.16            +0.0        0.18 ±  2%  perf-profile.self.cycles-pp.folios_put_refs
      0.08 ±  4%      +0.0        0.10 ±  5%  perf-profile.self.cycles-pp.alloc_anon_folio
      0.15            +0.0        0.17 ±  4%  perf-profile.self.cycles-pp.___perf_sw_event
      0.08 ± 10%      +0.0        0.10        perf-profile.self.cycles-pp.css_rstat_updated
      0.12 ±  4%      +0.0        0.15 ±  7%  perf-profile.self.cycles-pp.move_ptes
      0.06 ±  9%      +0.0        0.08 ±  5%  perf-profile.self.cycles-pp.page_counter_try_charge
      0.24 ±  4%      +0.0        0.26 ±  2%  perf-profile.self.cycles-pp.__handle_mm_fault
      0.16 ±  2%      +0.0        0.20 ±  2%  perf-profile.self.cycles-pp.mod_node_page_state
      0.23            +0.0        0.26 ±  2%  perf-profile.self.cycles-pp.lru_gen_add_folio
      0.13 ±  3%      +0.0        0.16 ±  4%  perf-profile.self.cycles-pp.get_page_from_freelist
      0.10 ±  4%      +0.0        0.14 ±  4%  perf-profile.self.cycles-pp.__alloc_frozen_pages_noprof
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.alloc_pages_mpol
      0.11 ±  4%      +0.1        0.16 ±  5%  perf-profile.self.cycles-pp.expand
      0.25 ±  2%      +0.1        0.31 ±  4%  perf-profile.self.cycles-pp.mod_memcg_lruvec_state
      0.28 ±  3%      +0.1        0.34 ±  4%  perf-profile.self.cycles-pp._raw_spin_lock
      0.16 ±  2%      +0.1        0.23 ± 15%  perf-profile.self.cycles-pp.__mem_cgroup_charge
      0.32            +0.1        0.44 ±  7%  perf-profile.self.cycles-pp.do_anonymous_page
      0.96            +0.1        1.09 ±  3%  perf-profile.self.cycles-pp.sync_regs
      0.94 ±  2%      +0.1        1.08 ±  3%  perf-profile.self.cycles-pp.native_irq_return_iret
      1.69            +0.4        2.12 ±  3%  perf-profile.self.cycles-pp.kernel_init_pages
      3.12            +0.6        3.69 ±  4%  perf-profile.self.cycles-pp.stress_bigheap_child
      0.35 ±  5%      +0.6        0.97 ± 54%  perf-profile.self.cycles-pp.get_mem_cgroup_from_mm
      1.62            +0.9        2.52 ±  4%  perf-profile.self.cycles-pp.pte_offset_map_lock




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

