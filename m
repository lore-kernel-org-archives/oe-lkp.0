Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280632753FD
	for <oe-lkp@lists.linux.dev>; Fri, 14 Feb 2025 03:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739502287; cv=fail; b=B+tAAnoPGGOh7wd++MAYZp2P2wfcJYjECl44psfSDp8lxHnGg5RLeWfIpEd+MlVz9rqE5T0HK3F2htqsZom4HLxcRR16gnzy3k+7Xq4CsmBySWAsNZx4DPYlxsT16DIgo6eOeHWj7oVsJLDEd08Z97gaDq1EPv67lfHMvxtgDNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739502287; c=relaxed/simple;
	bh=+tMGIQ3wymhTi6ymZ/qWeX+WdKcEx3CtN22bpykl5to=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=G/zRPcA2AXMvUrE7F7zkjQWisEQLMeHsBvfEUP7lInhFTn9VWZBszIRAmn1IPTZBfcTvyTiMwxPWICoMWfD3vzq1zLxLi0wN/Q+VlW8njpWyf+eFs+HpoJQHV2h6xZVeqyksJoKGipJgdxJAxe9n4cuNbQES3OtbX1c53Fw8w5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NLP/M6OY; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NLP/M6OY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739502285; x=1771038285;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+tMGIQ3wymhTi6ymZ/qWeX+WdKcEx3CtN22bpykl5to=;
  b=NLP/M6OY4sxoRjPUgHwhlDDMga9ONJICyB62itpBdgDKh/DgYTQdCTkG
   55a920VaMqdCTpO6ocT9bqxnSMI+dksi4ZyqSTVxPQEeW/OHMXUXyB2qH
   XUI1QVPmbVNPVJqZiPK3tpjClUN0mW93pBdGbiml2dAC+jG0+UCdGU7r4
   Krg7vbd0XfaR6TmQB17g4Dc1+RgArjnSkufDxg8WEQxgeiV9q4kBOsfO6
   WpVCWU74hDr6y0TAYRKvgyV0Xnb64nQDjI75aNc1vWBTrq/PMUZzsxT4R
   QHvhgulwWWcWfHfgu32OGvlFg/B2LVIBtPfRanPnEWJNjMkukgzJ522ts
   w==;
X-CSE-ConnectionGUID: UbIHMLsYQ2S6cwZ80T3Bkw==
X-CSE-MsgGUID: udAOKF3RRii1oGxpN8QANA==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="43893132"
X-IronPort-AV: E=Sophos;i="6.13,284,1732608000"; 
   d="scan'208";a="43893132"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 19:04:44 -0800
X-CSE-ConnectionGUID: a26ODhjgQ8mPms/jjOjt+w==
X-CSE-MsgGUID: CToxWVG6RgC/qdUc5Pd7dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,284,1732608000"; 
   d="scan'208";a="113514842"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 19:04:43 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 13 Feb 2025 19:04:42 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 13 Feb 2025 19:04:42 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Feb 2025 19:04:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ez4UFtOCx2TyEaCDoVvlLM6UCYP29f5GHVebNst5akNKDAo+OVLY9itQY+K2/QPOf5chO7qz1+ZFMbOe6Oi+3MRY+/uo61akzWCGkajyO4hG2DZcd764L2llVAbI0CYioPYtS7FKEPryyoyxS35qGTxfZTnkxit9SX93yIsBPUm/SQX/7E2TctO9yEyNZPS79mrmCpEDmIAJvCtq2231gZwGBAfCCS9BCXSYu+VmLY8l/hJyInL/fEm7I7DGQP/GBm4UZIDt6Ptf0/V7W3fFYXoy3XWaxhZTTfU2kuE+aov8xhYUWyEdOfCN5MGtzWEYuVnGLHgbjjR6OQEjDak3hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ATGM7Uw6A5IezKLu6YEw4BuYzqdmDX7u06bW3M6BU8=;
 b=B2xZh2B44sFa3yo3MBQvgTKPEiLNbmcAZ//vLDyseaGJxIVk9+Tx1iw1DaKB8SjCrOSRe2MDvjfiTpQtC47kvDEe42W607gTJjQGqS89y3UmHHKTOqiUG0wGiH+wsgZt6ZWo9Acw53/iPBKI29EQ6VmQf5ZPmRvGiRsCYJ3H6AkAE3Kyl/8LEvvpvCPXWo2CXZhbmiaQL9jr3zSN2FotL398aFVUg68gGrAlNwV/vd3NTHbxTN9tPXwS30PeQqs5ISv/yqC1cJrhFbctyIEma+neBzaISZ/mjToxdr3QuTEwDCaPP988Xxn6TZODRbHwtNl5E0hL++tbsKsb10+6dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CO1PR11MB5011.namprd11.prod.outlook.com (2603:10b6:303:6d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Fri, 14 Feb
 2025 03:04:40 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8445.013; Fri, 14 Feb 2025
 03:04:40 +0000
Date: Fri, 14 Feb 2025 11:04:27 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Andrew Morton
	<akpm@linux-foundation.org>, Shakeel Butt <shakeel.butt@linux.dev>, "David
 Wang" <00107082@163.com>, Kent Overstreet <kent.overstreet@linux.dev>,
	"Minchan Kim" <minchan@google.com>, Pasha Tatashin
	<pasha.tatashin@soleen.com>, "Peter Zijlstra" <peterz@infradead.org>, Sourav
 Panda <souravpanda@google.com>, Steven Rostedt <rostedt@goodmis.org>,
	Vlastimil Babka <vbabka@suse.cz>, "Yu Zhao" <yuzhao@google.com>, Zhenhua
 Huang <quic_zhenhuah@quicinc.com>, <linux-mm@kvack.org>,
	<oliver.sang@intel.com>
Subject: [linux-next:master] [alloc_tag]  0d1ae800a1:
 WARNING:at_include/linux/alloc_tag.h:#__pgalloc_tag_sub
Message-ID: <202502141006.21ae07ee-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2P153CA0040.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::9)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CO1PR11MB5011:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d96514f-e9cb-457e-c1ba-08dd4ca45268
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MpquLoCrj8ZKQCJgQ4mSBXUqXJVMabkIs9QZ2mTONFxkLys2X5it+eI2i+0C?=
 =?us-ascii?Q?B3zU8PjDEaBptSZdz3u+Hn5AuJOwQU+k82tZResUg0GsmQdYUrkXrrroeLZl?=
 =?us-ascii?Q?CfJAW3kBnkwg+o+DWYIDQ/a6R7OdWb8AAxTifultQNQQ77R5Ps+jnMBZq2Cb?=
 =?us-ascii?Q?9BcI9zxAi94m11Bz9gNINdkmAzCsyzVt+9sg4ClNWBWPilkkcFDYX5lEyRVT?=
 =?us-ascii?Q?fIbvBCkxoRWxaykHvrDcAJQgnZd3BsFkz8BwHFNyptYF8HyaZygRZxD+9LtX?=
 =?us-ascii?Q?Vx5nx3W1fWA3M5FdzwcfbMm+X2iv2MC2m/yFzUtcRuMmjVu7tl4gmWn9vQfL?=
 =?us-ascii?Q?bsfjQ5MX0gqEpSq5MXMe8oWMKhOdN3ltUDeIk4OWIP0k2Wizgj06kA7ePqg7?=
 =?us-ascii?Q?CtLfesACkgkcwivmShBOkIat4xMpV4uzc+GVfUi/E4dSPPE8Ffpgyq1axnhV?=
 =?us-ascii?Q?t2HNVgZvAaSxnkz7i5FZTvjBa2tqR7yODUe+jW6RWC9uUrstsmcmaHmI8B9c?=
 =?us-ascii?Q?DocT1yA+3T2c2lR3rDW6nVqsG6aqi3R5cbpeL2anOZnpuFoqzexUXiYDoTOY?=
 =?us-ascii?Q?SyXlmKEFeudxGGf8tjTstlPgw5RyZ/OvMYe7kqEnIsm51LLG+mJQTnoXUoHI?=
 =?us-ascii?Q?qnzyIHn6e8NaDtLJZllTw483wIW/3tSFMDh9c/aAI7GrGE5mI+R/ey4hAZGy?=
 =?us-ascii?Q?q+stietRb5OQKRxmCpwpJ3s5JakAAvovUQqNDNo8Z8f+q1HDi7eQ+VVu4nUx?=
 =?us-ascii?Q?gmLccKe2ovfQrL0IjRb41ojkS7ywMGJS1CJHslgFNRrpgERgNOkiC4yOGGqL?=
 =?us-ascii?Q?9668/3UWGBN28XTPIAciOuXa/cPihuNvGFDDkQWnNNiUQDzKcYARqvrhgxm+?=
 =?us-ascii?Q?EgSdFTG528NOCvmMd+bjmbvOsPF3k3IWDUWo+CuyjpdIP/CmLokwACG3+KzG?=
 =?us-ascii?Q?5QdgT82jktTwloalaeUq875six/2x+MxdsD/Djhig8uLMB8z9kqTEim0yDtA?=
 =?us-ascii?Q?0ErMwpcXb/xEAauAvAd34+eFogRWS9B3KmfZzT8I6HPPSMM/ti7ilgCfX1fw?=
 =?us-ascii?Q?LPDjUPjI5lbXTegYh/horWXf8tvDedo405+tygOk/NjafdrqCUH1eupSh7fa?=
 =?us-ascii?Q?stXAT2vLNA+VoPTGKvyvrfwEzUz1Uus94WFz/nazQjsWrCGTaOURp4Dbl2cJ?=
 =?us-ascii?Q?FhXoQoXl51JJlPQFgcGP84HqiLGs9DhHN5QljtkgYI9KwknjBxBnJKPjqrWH?=
 =?us-ascii?Q?pRP7QRrQNmfh5CarDJEjNvZaYbNbhSKe3PXN7xkz1AQnkMoQ/17rTXMTJLiY?=
 =?us-ascii?Q?c0bDwEZCGgHS9lJjdK2gKMvyi95IkLPGPvkPufzydGUD3w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nzNHVqnd/7r/TEyf18D8SHvm4VOAWQEq60DySAbO/qA/RDYlWTPksC7L88ZJ?=
 =?us-ascii?Q?+i72FRUxaw1voT6KTKdSDTwmd9PndFXNALwyyJL+uR3CWZS8Z1JFoFO4eexP?=
 =?us-ascii?Q?+8Ak3VDsKOmdiP9M3LgCyVlKbmJi/lVX4HR0+VtMxxLZ05Q7pC3Gav/nt5tz?=
 =?us-ascii?Q?pqcia+8TCq0yadCH6wGD4KcWREiPzxStIRN9KT1EfonQ+AVglZZrgKfsFBm2?=
 =?us-ascii?Q?iub815/6HZH9+RA3SWiP6ZfbXifMvQQJkvxxAgaO6nKa3zdqt1bhXodVA2bw?=
 =?us-ascii?Q?8XnaQBNL9UtWXSkTTx4sH1x7Ku6ufahc4jch7dSwtIUj/R5HKDrFnup/LWeL?=
 =?us-ascii?Q?vR/ClV3SIIzsCsR/hkq9SKZ0CfknF6hwF+IJ0by2q5Puy2nAe9k9z3FzeEaj?=
 =?us-ascii?Q?/PPby/21HnCcDbkV+c4/6qox6CO89ChrM4kRmSNPuq87c8jHcbZOsVIB2+oJ?=
 =?us-ascii?Q?jlwHqw/6WGRRfmj+knG7Eh/Ett3MyX1EUOIau/CF+IqfWrjdliejBDQpURxh?=
 =?us-ascii?Q?zRZe6H60JOsoCCTWHjnV4Xoy3Q8kHiPZkxQG2m0coSlB6rJo5kjFwLLvLhrt?=
 =?us-ascii?Q?bt8zZNbGDIUNb348iYbJKl83c9FgzGa6HsyK+UohHiWSh/nybL0r30FVEqPQ?=
 =?us-ascii?Q?nhRPrZFaHMscN4jHFTUcXF9zv0y//EGmjQiABR9lTQfOwvGmXKmiNmaor4UG?=
 =?us-ascii?Q?QuNXcdLylrlUI4afgw2VBjJDDAN832dwGYjVBXU1396kF4kR3rf5llv9tdeA?=
 =?us-ascii?Q?ibOfIwcq/TaOQlg3K/LrPErT7GFoiyJtG6MG0ScaiqJGwSd9TU2jyDHdpUFF?=
 =?us-ascii?Q?mHA5hsvf2GiBFWEmykENOJ/bwMPxhNy8DknbTj4m62y9ZD5S3298QTU2F9UU?=
 =?us-ascii?Q?nRBnAJObKcIPLdPOfWeQTRTXrwlfIQfK7WvPTe3ao4KlQrcbrHzsi6tw1IvP?=
 =?us-ascii?Q?nWKEqDrljLWC5MzBqgsNU8mAYyA3heTmWkmA49oFsowVyjY5PGbTcviVNedK?=
 =?us-ascii?Q?MnMiJ/higb/pd5Yr05UiImmZqzfFQYaYJrFweB3JiBmog2oD84/qMMpf2E7f?=
 =?us-ascii?Q?esr1ZlcmGBnXDSH8GsdUwKj9/qqdaHh2fo0ZqcZEWdkLMcGeAjNugm43W8s1?=
 =?us-ascii?Q?oNatuJJT9FnwP1TO4iGIvHSIjLkgwz5H43YwyzRuVkXfOUOxVDfEB+LvvVOM?=
 =?us-ascii?Q?bGEWtOrDoqKCyay9S8trh5tgnbaQTNNki4SDagA0cPTKEYWXP5dvfWGdimFp?=
 =?us-ascii?Q?0BMHqKDO+pi1PqjSikySWSiecZJ+qqBOZB3ZCpHP2UyNjIR1fkkJULDpBn7L?=
 =?us-ascii?Q?U5fKt/3jnOaiR8yGSoKIJjZNxjPLS7fAu7uBVO+TkiEOonpqNPSrKMU+MG/z?=
 =?us-ascii?Q?SmJWLfZx3uLNmTDtXTA+Yq73+FsFySmCkuekBB9R782jT7VDn4UMKoV93uRw?=
 =?us-ascii?Q?gnwwBn02jgQxi5O+1RDM51z5qSggPGbwjELEQlTltgwE8Uex21AC14nBIrtp?=
 =?us-ascii?Q?cK/awH/EvwjlkPqpUIYSWtc40Nx2gCxr9L4HbJIHyuifq6ObAU1MW0vlEC+z?=
 =?us-ascii?Q?S1EFti43mdGb59VWzgl4Bn9rkfomQdd/azDSn+zRr0R28ZaSqJapHatL3oSy?=
 =?us-ascii?Q?JA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d96514f-e9cb-457e-c1ba-08dd4ca45268
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 03:04:40.0493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mg+AlzKds3ddz8XeVOuryWXLcTwXjgfmKCgIZtbrxl2HiFYBYPvoTXM6C8ZXw0RccJ0UgydH9pS7/87NXNfmgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5011
X-OriginatorOrg: intel.com


hi, Suren Baghdasaryan and all,

we know that this commit is not the root cause of the WARNING. it just changes
the WARNING stats bot captured.

fd942e78294214c8 0d1ae800a1923762d8240dc4987
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :6           50%           3:6     dmesg.WARNING:at_include/linux/alloc_tag.h:#__pgalloc_tag_sub
          6:6         -100%            :6     dmesg.WARNING:at_include/linux/alloc_tag.h:#pgalloc_tag_sub

we made out this report just FYI, in case anybody has interests to look further
about this existing WARNING.

below is full report.


Hello,

kernel test robot noticed "WARNING:at_include/linux/alloc_tag.h:#__pgalloc_tag_sub" on:

commit: 0d1ae800a1923762d8240dc4987761f29a35d1a9 ("alloc_tag: uninline code gated by mem_alloc_profiling_key in page allocator")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

[test failed on linux-next/master 7b7a883c7f4de1ee5040bd1c32aabaafde54d209]

in testcase: trinity
version: trinity-i386-abe9de86-1_20230429
with following parameters:

	runtime: 300s
	group: group-02
	nr_groups: 5



config: x86_64-randconfig-071-20250210
compiler: clang-19
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202502141006.21ae07ee-lkp@intel.com


[  115.486807][ T6579] ------------[ cut here ]------------
[  115.487378][ T6579] alloc_tag was not set
[ 115.487709][ T6579] WARNING: CPU: 0 PID: 6579 at include/linux/alloc_tag.h:152 __pgalloc_tag_sub (include/linux/alloc_tag.h:152) 
[  115.488409][ T6579] Modules linked in: 8021q mrp garp stp qrtr nfc caif_socket caif phonet llc2 llc sha1_ssse3 serio_raw tiny_power_button button
[  115.489418][ T6579] CPU: 0 UID: 0 PID: 6579 Comm: date Tainted: G                T  6.14.0-rc2-00048-g0d1ae800a192 #1 2337137258306bf95f42324e33e4040ee055b8c6
[  115.490636][ T6579] Tainted: [T]=RANDSTRUCT
[  115.490962][ T6579] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 115.491699][ T6579] RIP: 0010:__pgalloc_tag_sub (include/linux/alloc_tag.h:152) 
[ 115.492110][ T6579] Code: 48 83 c4 08 5b 41 5c 41 5d 41 5e 41 5f 5d c3 90 0f 0b 90 eb eb c6 05 0b ed 01 03 01 48 c7 c7 20 76 f2 ad 90 e8 81 7e c0 ff 90 <0f> 0b 90 90 4c 8b 7d d0 4d 85 ff 0f 85 25 ff ff ff e9 72 ff ff ff
All code
========
   0:	48 83 c4 08          	add    $0x8,%rsp
   4:	5b                   	pop    %rbx
   5:	41 5c                	pop    %r12
   7:	41 5d                	pop    %r13
   9:	41 5e                	pop    %r14
   b:	41 5f                	pop    %r15
   d:	5d                   	pop    %rbp
   e:	c3                   	ret
   f:	90                   	nop
  10:	0f 0b                	ud2
  12:	90                   	nop
  13:	eb eb                	jmp    0x0
  15:	c6 05 0b ed 01 03 01 	movb   $0x1,0x301ed0b(%rip)        # 0x301ed27
  1c:	48 c7 c7 20 76 f2 ad 	mov    $0xffffffffadf27620,%rdi
  23:	90                   	nop
  24:	e8 81 7e c0 ff       	call   0xffffffffffc07eaa
  29:	90                   	nop
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	90                   	nop
  2d:	90                   	nop
  2e:	4c 8b 7d d0          	mov    -0x30(%rbp),%r15
  32:	4d 85 ff             	test   %r15,%r15
  35:	0f 85 25 ff ff ff    	jne    0xffffffffffffff60
  3b:	e9 72 ff ff ff       	jmp    0xffffffffffffffb2

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	90                   	nop
   3:	90                   	nop
   4:	4c 8b 7d d0          	mov    -0x30(%rbp),%r15
   8:	4d 85 ff             	test   %r15,%r15
   b:	0f 85 25 ff ff ff    	jne    0xffffffffffffff36
  11:	e9 72 ff ff ff       	jmp    0xffffffffffffff88
[  115.493423][ T6579] RSP: 0000:ffff888137d8f340 EFLAGS: 00010286
[  115.493859][ T6579] RAX: 0000000000000015 RBX: ffff8881064018f8 RCX: 0000000000000000
[  115.494407][ T6579] RDX: 0000000000000001 RSI: 0000000000000004 RDI: 0000000000000001
[  115.494963][ T6579] RBP: ffff888137d8f370 R08: ffffffffaef2cdb3 R09: 1ffffffff5de59b6
[  115.495520][ T6579] R10: dffffc0000000000 R11: fffffbfff5de59b7 R12: ffffea00040013d8
[  115.496063][ T6579] R13: dffffc0000000000 R14: 0000000000001000 R15: 0000000000000000
[  115.496621][ T6579] FS:  0000000000000000(0000) GS:ffffffffaeabf000(0000) knlGS:0000000000000000
[  115.497251][ T6579] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
[  115.497706][ T6579] CR2: 00000000ff941ee0 CR3: 0000000127139000 CR4: 00000000000406b0
[  115.498261][ T6579] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  115.498840][ T6579] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[  115.499429][ T6579] Call Trace:
[  115.499681][ T6579]  <TASK>
[ 115.499913][ T6579] ? show_regs (arch/x86/kernel/dumpstack.c:479) 
[ 115.500340][ T6579] ? __warn (kernel/panic.c:748) 
[ 115.500642][ T6579] ? __pgalloc_tag_sub (include/linux/alloc_tag.h:152) 
[ 115.501001][ T6579] ? __pgalloc_tag_sub (include/linux/alloc_tag.h:152) 
[ 115.501369][ T6579] ? report_bug (lib/bug.c:?) 
[ 115.501693][ T6579] ? handle_bug (arch/x86/kernel/traps.c:285) 
[ 115.502002][ T6579] ? exc_invalid_op (arch/x86/kernel/traps.c:309) 
[ 115.502337][ T6579] ? asm_exc_invalid_op (arch/x86/include/asm/idtentry.h:621) 
[ 115.502715][ T6579] ? __pgalloc_tag_sub (include/linux/alloc_tag.h:152) 
[ 115.503097][ T6579] free_frozen_pages (include/linux/mm.h:2250 mm/page_alloc.c:1210 mm/page_alloc.c:2738) 
[ 115.503472][ T6579] __free_slab (mm/slub.c:2669) 
[ 115.503801][ T6579] free_slab (mm/slub.c:2692) 
[ 115.504112][ T6579] discard_slab (mm/slub.c:2698) 
[ 115.504434][ T6579] __slab_free (mm/slub.c:?) 
[ 115.504772][ T6579] ? qlist_free_all (mm/kasan/quarantine.c:163) 
[ 115.505111][ T6579] ___cache_free (mm/slub.c:4575) 
[ 115.505447][ T6579] qlist_free_all (mm/kasan/quarantine.c:174) 
[ 115.505777][ T6579] kasan_quarantine_reduce (mm/kasan/quarantine.c:287) 
[ 115.506170][ T6579] __kasan_slab_alloc (mm/kasan/common.c:331) 
[ 115.506526][ T6579] kmem_cache_alloc_noprof (mm/slub.c:4129) 
[ 115.506911][ T6579] ? vm_area_dup (include/linux/sched.h:2248) 
[ 115.507234][ T6579] vm_area_dup (include/linux/sched.h:2248) 
[ 115.507551][ T6579] __split_vma (mm/vma.c:481) 
[ 115.507889][ T6579] vms_gather_munmap_vmas (mm/vma.c:1307) 
[ 115.508307][ T6579] mmap_region (mm/vma.c:2259) 
[ 115.508610][ T6579] ? __kasan_check_read (mm/kasan/shadow.c:31) 
[ 115.508961][ T6579] ? validate_chain (arch/x86/include/asm/bitops.h:227 arch/x86/include/asm/bitops.h:239 include/asm-generic/bitops/instrumented-non-atomic.h:142 kernel/locking/lockdep.c:230 kernel/locking/lockdep.c:3818 kernel/locking/lockdep.c:3874) 
[ 115.509301][ T6579] ? perf_event_mmap (kernel/events/core.c:9193) 
[ 115.509759][ T6579] do_mmap (mm/mmap.c:561) 
[ 115.510073][ T6579] vm_mmap_pgoff (mm/util.c:575) 
[ 115.510467][ T6579] ksys_mmap_pgoff (mm/mmap.c:607) 
[ 115.510820][ T6579] __ia32_sys_mmap_pgoff (mm/mmap.c:614) 
[ 115.511197][ T6579] ia32_sys_call (kbuild/obj/consumer/x86_64-randconfig-071-20250210/./arch/x86/include/generated/asm/syscalls_32.h:317) 
[ 115.511542][ T6579] do_int80_emulation (arch/x86/entry/common.c:?) 
[ 115.511914][ T6579] ? up_write (arch/x86/include/asm/preempt.h:103 kernel/locking/rwsem.c:1375 kernel/locking/rwsem.c:1630) 
[ 115.512237][ T6579] ? vm_mmap_pgoff (mm/util.c:579) 
[ 115.512587][ T6579] ? fput (arch/x86/include/asm/preempt.h:103 include/linux/preempt.h:480 include/linux/file_ref.h:161 fs/file_table.c:516) 
[ 115.512885][ T6579] ? __this_cpu_preempt_check (lib/smp_processor_id.c:67) 
[ 115.513279][ T6579] ? lockdep_hardirqs_on (kernel/locking/lockdep.c:4470) 
[ 115.513639][ T6579] ? syscall_exit_to_user_mode (kernel/entry/common.c:221) 
[ 115.514057][ T6579] ? do_int80_emulation (arch/x86/entry/common.c:257) 
[ 115.514418][ T6579] ? __this_cpu_preempt_check (lib/smp_processor_id.c:67) 
[ 115.514793][ T6579] ? trace_hardirqs_off_finish (include/trace/events/preemptirq.h:36) 
[ 115.515191][ T6579] ? do_int80_emulation (include/linux/entry-common.h:118) 
[ 115.515553][ T6579] asm_int80_emulation (arch/x86/include/asm/idtentry.h:626) 
[  115.515906][ T6579] RIP: 0023:0xf7f7ccb0
[ 115.516201][ T6579] Code: 4c 24 34 89 44 24 0c 8b 44 24 44 8b 54 24 38 8b 74 24 3c 8b 7c 24 40 a9 ff 0f 00 00 75 1c c1 e8 0c 89 c5 b8 c0 00 00 00 cd 80 <3d> 00 f0 ff ff 77 21 83 c4 1c 5b 5e 5f 5d c3 90 83 c4 1c b8 ea ff
All code
========
   0:	4c 24 34             	rex.WR and $0x34,%al
   3:	89 44 24 0c          	mov    %eax,0xc(%rsp)
   7:	8b 44 24 44          	mov    0x44(%rsp),%eax
   b:	8b 54 24 38          	mov    0x38(%rsp),%edx
   f:	8b 74 24 3c          	mov    0x3c(%rsp),%esi
  13:	8b 7c 24 40          	mov    0x40(%rsp),%edi
  17:	a9 ff 0f 00 00       	test   $0xfff,%eax
  1c:	75 1c                	jne    0x3a
  1e:	c1 e8 0c             	shr    $0xc,%eax
  21:	89 c5                	mov    %eax,%ebp
  23:	b8 c0 00 00 00       	mov    $0xc0,%eax
  28:	cd 80                	int    $0x80
  2a:*	3d 00 f0 ff ff       	cmp    $0xfffff000,%eax		<-- trapping instruction
  2f:	77 21                	ja     0x52
  31:	83 c4 1c             	add    $0x1c,%esp
  34:	5b                   	pop    %rbx
  35:	5e                   	pop    %rsi
  36:	5f                   	pop    %rdi
  37:	5d                   	pop    %rbp
  38:	c3                   	ret
  39:	90                   	nop
  3a:	83 c4 1c             	add    $0x1c,%esp
  3d:	b8                   	.byte 0xb8
  3e:	ea                   	(bad)
  3f:	ff                   	.byte 0xff

Code starting with the faulting instruction
===========================================
   0:	3d 00 f0 ff ff       	cmp    $0xfffff000,%eax
   5:	77 21                	ja     0x28
   7:	83 c4 1c             	add    $0x1c,%esp
   a:	5b                   	pop    %rbx
   b:	5e                   	pop    %rsi
   c:	5f                   	pop    %rdi
   d:	5d                   	pop    %rbp
   e:	c3                   	ret
   f:	90                   	nop
  10:	83 c4 1c             	add    $0x1c,%esp
  13:	b8                   	.byte 0xb8
  14:	ea                   	(bad)
  15:	ff                   	.byte 0xff


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250214/202502141006.21ae07ee-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

