Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B7CB676
	for <oe-lkp@lists.linux.dev>; Wed, 13 Nov 2024 14:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731507134; cv=fail; b=H6hw8ajFyJaxkgDswhUfB0NOrj29KZGYtzRnMId44D8OL7mXV2mPL2+0XdYL2qeFEmL/ZRiiebT1CjNbkxwfiuz4LZFCTGwopGTY78nj/rLWR+ETcMwRHyOFd8WHmykjK8qqTo/8hHBuqInFqOyAvak8vtDIY4fyr+gohKmv7as=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731507134; c=relaxed/simple;
	bh=qN2vgEOB5rQ2hu7chFwpZa9Z7rAj3fVVQPRq3EkQl00=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=ZES/Xbg1doSBI9MsVHsATMw9IBt69DI4r33cQvVawxrAhjms3BLW54+x2bAD+fp/+SB+KMokIDgXkUuFqxfQ6R9JDnYRnwcyKIVCVdpuElhAgnPC7c5w3XrpMJbFXQmi7NVG4ZJQ4gvbepFlVD6BjL/1kSvBMSjgtr6Tcdc5uDw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y2i2tRhg; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y2i2tRhg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731507133; x=1763043133;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qN2vgEOB5rQ2hu7chFwpZa9Z7rAj3fVVQPRq3EkQl00=;
  b=Y2i2tRhgEAuaWLlN+nYEt75dd3zojsPj1Vevv0HvqSt/vfBeAfKpGh10
   q1JodhHaYTG2iCZIX8rxUVCr5mDwmN2zymW8kNm/dCg6TEy4t1ZH4sqw1
   OhrAj8M5vhWQwCBWj5jlVF4vkMfqLOVBw1A2w/UtVaErzXMwOxk0oly8R
   tc+aSwdZkVedWzsEGfux6lwB3i25Dld+xNbHvdD/EXu5VofFQH562Ma+H
   Y2icZ1zmgPn2i4glOxXOEN321QSsM5/r2sETeI2jiuJ2cbH9QpaQH7CJV
   KYuSiJVIcKQz/rp2YI68BYdNQ8JofAFwMJoLA5V4/BbAfnpfKkEQa5pJo
   w==;
X-CSE-ConnectionGUID: B8//oZiCSI2TvgQYLpFoEg==
X-CSE-MsgGUID: 33FuAgJFRwGEmVlIvgIFZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31573261"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31573261"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 06:12:13 -0800
X-CSE-ConnectionGUID: 5SSV5AEfSuSMkDfXnW5CMQ==
X-CSE-MsgGUID: EqVtIPlxRyyDkixNFdum1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="92815628"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Nov 2024 06:12:13 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 13 Nov 2024 06:12:11 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 13 Nov 2024 06:12:11 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 13 Nov 2024 06:12:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AzEe/KMYapGuBuqKCLfX4LCvnDAYgzPKrXQ/okGaEuw/Vl476QTrWW48QEY9d8u4GZB1QV/ndJhg1jFOvorthAUpVHOJdY86UmH/1zJUmxm5jhKQlyU4RXDCvD8D1Bdtd9wI/y88U4DDb9jioFbGg1gfJdZNG6BJ/zP6iLBFb0T0/AG3FCnYyzpX5cwF24wwU5ICm/oZazjUOpIBBGrKp2Cfik76a3UX/lsQzHaZVAJZ8Mon26tAGcHHVGIkTiMcsau9I5VM3jMqEfg9FmQ1RrZJpj1qS1Rlbw4sHSFHJwGSm0UHf9SPvDHK6GdNAGa6Ydlgs/PEGSJXwZOOKvAJnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7kuYJQhbswtUNCO0xMtnhkrQ4VhstrBCFZp23w+2ucg=;
 b=ej7MBVOb87wgd7TPhvT/j+uKSvZJAp/HjwqM3p+K5dPoVx3A9jnpKXQnyXvO7PaclVN/SF/5VfHQSaJlTGQGeoWPod2IcOXgcZvvQjU9BfC5Ch55Fs38fwKd7F+ziSds9ZMJfINcDGm7QThoMD+ZkxwnHWjmamB/T6g4HvXCcGfg/bBAnEcdJC7dJYD/L2rJwO+N/4rsuUaa0Fc5egp6AWY4vIQ7aeRioSnS9ck3xVUc/Cnl5rlClGZ5M28DTaR4UJqCbwjRMLx2f1HHbKcdfhHXK3im28i33tqSDImPakfiRBFvNQ5UCNAdUlxQOb5wXh1U+jfaBcOJ6GdKKgtOkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CY8PR11MB7875.namprd11.prod.outlook.com (2603:10b6:930:6c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.16; Wed, 13 Nov
 2024 14:12:06 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8158.013; Wed, 13 Nov 2024
 14:12:06 +0000
Date: Wed, 13 Nov 2024 22:11:57 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Christoph Hellwig <hch@lst.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Christoph Hellwig <hch@lst.de>,
	<oliver.sang@intel.com>
Subject: [hch-misc:writeback-cleanups] [writeback]  c308b0f0da:
 Oops:general_protection_fault,probably_for_non-canonical_address#:#[##]PREEMPT_SMP_KASAN_PTI
Message-ID: <202411132255.6c7b6093-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0019.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::15) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CY8PR11MB7875:EE_
X-MS-Office365-Filtering-Correlation-Id: 36449d9b-7ec0-4bef-ea78-08dd03ed276e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Zyi+Qv/Jfq96iesbprwAV7lYpfsmHTL3OMZZDKJHkiTkeunACPCa3oC6ckVr?=
 =?us-ascii?Q?IzsTCCkQ/KCoCuPV/zRGBzXF2p6nooDHYvrrfCq0i0hEAf0hg21RlndbUPY4?=
 =?us-ascii?Q?hcvbcRllonvOlTdwB5vUAQh9TrAfpbQIITjtaWxpbE2QdLxgcv51kZ/TLt6J?=
 =?us-ascii?Q?EAENG740G+qbhF1llVen6b9LhWsNO+55pFdxN1bCB1bN+evj6+cXy7zd1wAq?=
 =?us-ascii?Q?a6BoyCvf/ONSnK1q0Byfsyg4gtzQcfRRJ331/CeSEpe45aMMVCUlVc0HnQUH?=
 =?us-ascii?Q?Xl+bX1F2sL7zsZosJHw52S7xvkYWinj7gBWVkTc3OxKp00imlIMLZj0RA3fv?=
 =?us-ascii?Q?9l19YOpmBlQSomh8xJzLWcVZ13AvttadWQv73JKnlzctXJU35d5BeQxwvjt2?=
 =?us-ascii?Q?lk/OAp/I86n+XRXNuOTgCj45GYHrTz/hPKi8ZPSiLUADlBCSdtfb0F3r7ifP?=
 =?us-ascii?Q?dgyZ0POJhgkKd9K07m7WfXNrQ4nIYWk026Pt9CCs7UdR1ETdSi9/l9pO7CkU?=
 =?us-ascii?Q?uKX/5pGOAh88PGD7KboZtkIpHylY11CoijgcbYeSv9JQOdczYkSWNYhzgdG9?=
 =?us-ascii?Q?hoVjZ+eEBzr0kDHl0JNOTyoOVPApTAinnxzSejgupxuTtnm8XDVepiOT5vzk?=
 =?us-ascii?Q?BE06zi6CLIwH992nWi7WSrGPtJjAecke13zkqS4ANwsWA4JQg3PVUmktGN54?=
 =?us-ascii?Q?L5nV8HvWpqaDUcTzSmXueFxNj5AyuiJWWCLykYzHOU8ghFGhQYG5wB96+jSg?=
 =?us-ascii?Q?w2ybs/4ozlYEK6v4si5xWxTDuda6cbtEOpuxd/lB49ud7KeAZunRrgSfeeoT?=
 =?us-ascii?Q?uDmfTSR5UeacAdYfcK+j+OZEFxZvjqHNxyYXpywfOD0Q7QClF+uVHmEIXm5h?=
 =?us-ascii?Q?7rOnFi3d6XskDI4TypH1fOygft2QKaZCCJYtj3SMY/s3yk0Y8Ol8aZwxmfy7?=
 =?us-ascii?Q?z1wDG4LoKxOle8PHZtRAjPeZziJyPAZxbwiv6meYoS1Q5uJ6jC2KgMTqUjbe?=
 =?us-ascii?Q?q7dHzze65ZNDTySubhVAVYivMbn51nwrK17Ec5msb9m8lppHRjDnebif6cdM?=
 =?us-ascii?Q?KU8Z5Vvpl5Uoemw3F6NKqGYQ9fp/kwtY6YIbDTJ7aXtwRhI2r7r33vabH3Vm?=
 =?us-ascii?Q?IVyGLJluq1BUsrM5P0+nqZ8hkCTRg+EZFqtuiwz6SbtNo/JbhTquICVnlVTj?=
 =?us-ascii?Q?cD1ZUFQvbHNLJWhclRAt3EUoU0682aPfb+XpkdjuaisDxpTHI9+/0PpsCQhu?=
 =?us-ascii?Q?X0e55pm0NpMXyujrvVeh8moRfzUWddM3PTbkJv3ejQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AoI09NWsQg0YY8+25sk8hzx2hctJUczJjEO8IeCk/d130Xl9ZTvPwZkMajXr?=
 =?us-ascii?Q?gzy8u2qzclGY+PGkSMTt68NbgWvDKSOHGNtUyasSLoC1T2AEVopyj+KSblHF?=
 =?us-ascii?Q?l/Lg559Kpj/Dx5wrJRas3doxD3eoCOHBgWHlQurFtv42BDXoDzB1Um9inTpP?=
 =?us-ascii?Q?yXrH30/RbX35Vu17dX46YuyhDEaiwee400ZFxDZJuqBQfWLWUGoBII2FWtNC?=
 =?us-ascii?Q?00s6r7RLbyfKVD/XGBQ2BFSTCOkHJYJAZOEpTh47GgJtyjJzwYWR+tSbUVnr?=
 =?us-ascii?Q?e6P9YhFbYFO92CWyG5RZLzZ/lm1tdvqv6dbiRPoBijCv9muggMMf+Cw9BUEC?=
 =?us-ascii?Q?w7bEzLYvvow39azqG083cRkJvVei/L/X4tV0jLA8XwAGx+TbLg4EzrYUIgZA?=
 =?us-ascii?Q?RLtBrlw2KiZEmwXqoMygFsNQSG3h7ujeiaebFxc9WFfmxAuurWCXyqV/Ekx2?=
 =?us-ascii?Q?ZyFrV9E5otkrnewrGKD930+zGb8u6B9khkMqde62hfbDZng4b1k8POfpxC9S?=
 =?us-ascii?Q?6mpUDEj3PJ9KEf3r3xIk/i42EBiphd+g+xBXlSLzCwMYH16RvZudgNugHmsD?=
 =?us-ascii?Q?MMAjQM7G3cw4sDnkSg5liw1SfbMPASPyMiTtjqoPutV16o7pHdWweRQ6+YLC?=
 =?us-ascii?Q?/F+kuNDZLmipqLgVlCBPiWXRdqoaGmiOp2eN105O6y2Iqlchu07Q/mkm5VBh?=
 =?us-ascii?Q?k8Ms5C564mb8AmxzJ/69FJiVy8S/Vna1V5MqzeSVZbrBTByJrMVJaZF8ACi7?=
 =?us-ascii?Q?R9H9XiBFgpmzyBxR8ZXNWfZbFriHUe4LL/2Bg6V5S8xaObgztbPWpBlJsXjs?=
 =?us-ascii?Q?jrRQubLcuQ2Fyjtyc1N/ZDhYS2fX2AeitA668F/SgFogyB2AFLjinwBQilhg?=
 =?us-ascii?Q?nhfq19kor7FStUK0/Orj5BQdTunvirXQqEwAKepuzYDTkEWjNT50oqEfai70?=
 =?us-ascii?Q?GkGMaCkzM/IQsg6AqkmUGrVfP2f1Bybhi0dwsaRQSqlAjr5zA3YNBEX81DxE?=
 =?us-ascii?Q?QccDRT7I0W/1kEDPeWkCsTfCSwSSapszO5EGiUDdDN7wJfJNBYXWFB6OONfB?=
 =?us-ascii?Q?O1WDSoJ27pm9y1N2O+3vnWU6zf/Up1fw9REzChb1qkigyXKm7hcgOdPAbqVa?=
 =?us-ascii?Q?ntGxHD0q+sQJyTkbdh22fhIqE5tHoDqmV6k9NAhcDV5QBGeKEL2fjhBJYlmy?=
 =?us-ascii?Q?UZrjO98IKgVkjWAo6Qsm5CHyW+9FwfaGDvQ5bZZILmh5UkM+ihN1kTTkjuM/?=
 =?us-ascii?Q?xQkSzH2G7piJEP5H4YF4tVMwmEJW2g093PfYHFM+WwUP1qqz34B8ZoZYRAZp?=
 =?us-ascii?Q?JTyNvPdSJwSO054hXIw6IG/3RO1mYYPu3qu/ejFoD/GMoDiSsSq0e09vMLlg?=
 =?us-ascii?Q?Ra/qvWWwD/m4xri18t6/dorrypgx31+xWpCOkSJjLdeQD3a3n13MlFTuWUVB?=
 =?us-ascii?Q?BMKnrq5cEt5VtQ1BnQqFlW9EA6+2GAz6hFCzUeG70ux4DOPIBZXJ8CdLB+hb?=
 =?us-ascii?Q?6Vq7ei8ZQ9JIbh9MjYV5MNOBSoykXNI4DEvCz1JFyIUgoYWRjkubFhKbVK1g?=
 =?us-ascii?Q?EIzBYKK7I9CZqjWLVHqk+sy2+Lz0s++kwfawVL8GwknB16mMB04/32LHaaQL?=
 =?us-ascii?Q?Zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 36449d9b-7ec0-4bef-ea78-08dd03ed276e
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 14:12:06.3404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TgWkO3Iu2dZiF6fEZKq70tQVncpmd0Hl+iP3PbI0xqgi+Z9Yw1QLakeQxBdcPS2o1FFCIMbhMw+rdwcfAZRggw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7875
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "Oops:general_protection_fault,probably_for_non-canonical_address#:#[##]PREEMPT_SMP_KASAN_PTI" on:

commit: c308b0f0da5f63483755bb25e1f6eab2800297b5 ("writeback: split wbc_attach_and_unlock_inode")
git://git.infradead.org/users/hch/misc.git writeback-cleanups

in testcase: ltp
version: ltp-x86_64-14c1f76-1_20241102
with following parameters:

	test: commands



config: x86_64-rhel-8.3-ltp
compiler: gcc-12
test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-3770K CPU @ 3.50GHz (Ivy Bridge) with 16G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202411132255.6c7b6093-oliver.sang@intel.com


[  236.465894][ T6003] BTRFS info (device loop0): first mount of filesystem ab40839e-44f8-49b3-bef4-1503b21f5135
[  236.466163][ T6003] BTRFS info (device loop0): using crc32c (crc32c-intel) checksum algorithm
[  236.466351][ T6003] BTRFS info (device loop0): using free-space-tree
[  236.479363][ T6003] BTRFS info (device loop0): checking UUID tree
[  237.619850][ T6183] BTRFS info (device loop0): last unmount of filesystem ab40839e-44f8-49b3-bef4-1503b21f5135
[  237.855429][   T70] Oops: general protection fault, probably for non-canonical address 0xdffffc0000000049: 0000 [#1] PREEMPT SMP KASAN PTI
[  237.855713][   T70] KASAN: null-ptr-deref in range [0x0000000000000248-0x000000000000024f]
[  237.855897][   T70] CPU: 6 UID: 0 PID: 70 Comm: kworker/u32:5 Tainted: G S                 6.12.0-rc6-00003-gc308b0f0da5f #1
[  237.856121][   T70] Tainted: [S]=CPU_OUT_OF_SPEC
[  237.856225][   T70] Hardware name:  /DZ77BH-55K, BIOS BHZ7710H.86A.0097.2012.1228.1346 12/28/2012
[  237.856401][   T70] Workqueue: writeback wb_workfn (flush-7:0)
[ 237.856539][ T70] RIP: 0010:wbc_switch_dying_wb (kbuild/src/consumer/include/linux/percpu-refcount.h:365 kbuild/src/consumer/include/linux/backing-dev-defs.h:270 kbuild/src/consumer/fs/fs-writeback.c:762) 
[ 237.856667][ T70] Code: 03 80 3c 02 00 0f 85 0e 01 00 00 48 8b ab 48 01 00 00 48 b8 00 00 00 00 00 fc ff df 48 8d bd 48 02 00 00 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 db 00 00 00 f6 85 48 02 00 00 02 75 09 5b 5d 41
All code
========
   0:	03 80 3c 02 00 0f    	add    0xf00023c(%rax),%eax
   6:	85 0e                	test   %ecx,(%rsi)
   8:	01 00                	add    %eax,(%rax)
   a:	00 48 8b             	add    %cl,-0x75(%rax)
   d:	ab                   	stos   %eax,%es:(%rdi)
   e:	48 01 00             	add    %rax,(%rax)
  11:	00 48 b8             	add    %cl,-0x48(%rax)
  14:	00 00                	add    %al,(%rax)
  16:	00 00                	add    %al,(%rax)
  18:	00 fc                	add    %bh,%ah
  1a:	ff                   	(bad)  
  1b:	df 48 8d             	fisttps -0x73(%rax)
  1e:	bd 48 02 00 00       	mov    $0x248,%ebp
  23:	48 89 fa             	mov    %rdi,%rdx
  26:	48 c1 ea 03          	shr    $0x3,%rdx
  2a:*	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)		<-- trapping instruction
  2e:	0f 85 db 00 00 00    	jne    0x10f
  34:	f6 85 48 02 00 00 02 	testb  $0x2,0x248(%rbp)
  3b:	75 09                	jne    0x46
  3d:	5b                   	pop    %rbx
  3e:	5d                   	pop    %rbp
  3f:	41                   	rex.B

Code starting with the faulting instruction
===========================================
   0:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
   4:	0f 85 db 00 00 00    	jne    0xe5
   a:	f6 85 48 02 00 00 02 	testb  $0x2,0x248(%rbp)
  11:	75 09                	jne    0x1c
  13:	5b                   	pop    %rbx
  14:	5d                   	pop    %rbp
  15:	41                   	rex.B
[  237.857058][   T70] RSP: 0018:ffffc90000527800 EFLAGS: 00010202
[  237.857205][   T70] RAX: dffffc0000000000 RBX: ffffc900005278f8 RCX: ffffffff83c91a85
[  237.857365][   T70] RDX: 0000000000000049 RSI: ffff888402876d18 RDI: 0000000000000248
[  237.857523][   T70] RBP: 0000000000000000 R08: 0000000000000000 R09: fffff520000a4ef9
[  237.857681][   T70] R10: 0000000000000003 R11: ffff88815ba98208 R12: ffff888402876d18
[  237.857839][   T70] R13: dffffc0000000000 R14: ffff888402876df8 R15: ffff88815ba98200
[  237.858022][   T70] FS:  0000000000000000(0000) GS:ffff88833b700000(0000) knlGS:0000000000000000
[  237.858229][   T70] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  237.858374][   T70] CR2: 00007fa0dd538a1c CR3: 000000041c05c001 CR4: 00000000001726f0
[  237.858533][   T70] Call Trace:
[  237.858616][   T70]  <TASK>
[ 237.858690][ T70] ? die_addr (kbuild/src/consumer/arch/x86/kernel/dumpstack.c:421 kbuild/src/consumer/arch/x86/kernel/dumpstack.c:460) 
[ 237.858789][ T70] ? exc_general_protection (kbuild/src/consumer/arch/x86/kernel/traps.c:751 kbuild/src/consumer/arch/x86/kernel/traps.c:693) 
[ 237.858916][ T70] ? asm_exc_general_protection (kbuild/src/consumer/arch/x86/include/asm/idtentry.h:617) 
[ 237.859041][ T70] ? _raw_spin_lock (kbuild/src/consumer/arch/x86/include/asm/atomic.h:107 kbuild/src/consumer/include/linux/atomic/atomic-arch-fallback.h:2170 kbuild/src/consumer/include/linux/atomic/atomic-instrumented.h:1302 kbuild/src/consumer/include/asm-generic/qspinlock.h:111 kbuild/src/consumer/include/linux/spinlock.h:187 kbuild/src/consumer/include/linux/spinlock_api_smp.h:134 kbuild/src/consumer/kernel/locking/spinlock.c:154) 


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241113/202411132255.6c7b6093-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

