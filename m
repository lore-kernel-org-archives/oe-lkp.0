Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18621A2C11
	for <oe-lkp@lists.linux.dev>; Wed, 10 Dec 2025 13:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765373848; cv=fail; b=V49oFSfWypGugfibBwYHfkMuaagA1EbU7W9JrtJP4bUFw7k5QuE4XovHzp5Cn2yWBpaCR3/YkHALhcWyb3LjYxz4t64s70Ftgzg7bGZlTkHjVbRo+qeGJOvkXRT9zC0q4SkPcfqQuodVynY7VV+eX+j9dcoLQlny0CzqiC3vPII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765373848; c=relaxed/simple;
	bh=ZWSMP1VZICk67fheFP9+UrJAfxAwmwvOeP1B3HAUG3Q=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Ld/pu34mMnmFmt4s06fw9CBBMWlLC9PiYKQen8lxsyISkdT5Nirutcy2ls5WAP6VKBo15CWSUL2yzdK/Qi5uiRH/Dml+Ul/LiTg7rbAvG3xT6JWBVGMwprGnzGQCa76RsxiRTpyWJlmTIjEGfA6DK74XhPSLIwluOkWmh7dWqjI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JQee3d08; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JQee3d08"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765373846; x=1796909846;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZWSMP1VZICk67fheFP9+UrJAfxAwmwvOeP1B3HAUG3Q=;
  b=JQee3d08Hm4gL0gKG122Gq6y/TeXt4t7dOhmB1GeWp5GbglKXmB38/Ym
   1bYLys7wqNXGxHUR+QpP0AMLYwmoYkZFopBCUua7UhyVaKzgI21xkKB2M
   3kMjuhiWjTBS9rxlazRiMtP4nifyJOo++/XM5nhuLQvB3Gvf6UcbSAOvA
   4HQYS2aaYzhk0QTdsKGAKgbN/xKnuPeOKJ9dGE0zO2cMxCITBDaGgKsbN
   arGmebApA3fXeVe9Bv7GVdNx2JT8zRtfs9CJuiIgWkrbq6kLIV4L0TZZX
   7B2X8xcSynrQkul8/4yVsslHCueJM8BdqPquujCqaCJwTjUFS4W7Q9itm
   Q==;
X-CSE-ConnectionGUID: t1d/X07PR2WwXwgXwK3Yrg==
X-CSE-MsgGUID: WDnaUn50TZiyBTcLVKR/1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="78705693"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="78705693"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 05:37:25 -0800
X-CSE-ConnectionGUID: Hin8lL50Rsi/jzgqSTU3CQ==
X-CSE-MsgGUID: pTkMU0BHSjeCUnVRPkoruQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="201436535"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 05:37:25 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 10 Dec 2025 05:37:24 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 10 Dec 2025 05:37:24 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.51) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 10 Dec 2025 05:37:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ge6fvOH3MWNvM7qik+JI/jFY6ie4DDrybb2iPR24E0l9oKQ3Tp+Iu+0qyumyuAL1EcfcLGa/1mYA+rBqazJojeAF4+Fdpi/GBtFmo84oNXybVYFz/NtPseD+2cdXzaL0dcf9dwFzXSMHANtf3/VwdLKPq9cejlzs6+J8fhjOEOhkN2tCgtiXpafnRCvlHOibBFsIurxKg2vHy0+ryBgg6aSFFPKlN43lREtrze4ssoSZDRcPkkWxIb8zJ1Uq/3iT2e9hkhMjZ8Fk3jzZWMpmIFymERLKdYQ5PNekEkfHEaw3lAb6N0GMSdoznkdpdVOSBmfPm/YxAIQSfrqZDsrBSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lABmoWUP4kHAaa9RJen09C3B5AYZUcT5+AiMVExBL/Y=;
 b=t3sJ9gzCJVbqjEV6i9YVyGqRdjfBKJHqcGyVwV/iUzcAwoLWpAc0KEmFnjdtNPkyTQ5PofaYwuUdoKLzVxer9xO2+z9ecKU7MZ9BaMHMX0MZDZGt55y1N0jTyRec+j+/U/yPM0/IsDMLCwOwWDIN5Xw3Efcz66uFclf9IJ0fEphO4F83TSMCTi08lt2MDvUuoWWUjSD+78zezaNQrdXVNWt7tpAob4l1l3ddFodiQh+kHdQhOgpb6KTv6EcAWcpu7lVtPZnpGIsD42H/a6v//ZM8PW66Vc3oPuv6b8UdRy9qhvLKWhpEj8myI1jUxrLj+KW468TgTwycBzuFA6HfAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DM6PR11MB4660.namprd11.prod.outlook.com (2603:10b6:5:2ad::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Wed, 10 Dec
 2025 13:37:17 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 13:37:16 +0000
Date: Wed, 10 Dec 2025 21:37:09 +0800
From: kernel test robot <oliver.sang@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [kas:compound_head] [mm]  5de5481103:
 WARNING:at_mm/slub.c:#free_large_kmalloc
Message-ID: <202512101653.99bc860b-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR04CA0016.apcprd04.prod.outlook.com
 (2603:1096:4:197::7) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DM6PR11MB4660:EE_
X-MS-Office365-Filtering-Correlation-Id: 768fa7d7-bc76-43fc-fa6f-08de37f13bf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qoNi4MteJ1d2u43UrIm5G66WoF5GteqCeFP/Lq/d2wni6pye6wsWHllQ9pNY?=
 =?us-ascii?Q?isFSroi2WW8gaILnCU2El/1C7n+zG0r118HxmZaJf2P+kuCwHCWBg2ARrqo7?=
 =?us-ascii?Q?73RCXq0VtUJB0YXS4xLNuafeyYMyM2bDwdGiOQRFVgDftCQQ7EKNDqQWorCP?=
 =?us-ascii?Q?LkeFsGYeuU5UxKPlQR0n1W16YJqcJNxNvpTVtQpALmXHEf1cU8oVj5FhHHlw?=
 =?us-ascii?Q?4KEqvtXSYv7IWsno6g1nXPzRAH7m+Np80uI3a8ge9Kd3vm/FNkGVxXuoihxJ?=
 =?us-ascii?Q?EFQDCxHzy2iEkjHWtX5UujIwAj1znt15wkHlXNugLmM5dFqn92UungQhidSO?=
 =?us-ascii?Q?Gt+NQMbvzzkvp7CR2K4AR4zDyX/+C6BSqmn7CSeHnkWb9NRYHQL/zJOkqbQo?=
 =?us-ascii?Q?q/qGEXQfYCs6IcLBibIlVTYuQht0Rikr9OGMPK/gC3m7IltTPlkn3A7BU8Ab?=
 =?us-ascii?Q?7h00tLC3o7rqXqY3f8GMKUAHViOrBmNBC8/NOh39hBqoA6fyEsporQFGvoNr?=
 =?us-ascii?Q?fkbcQtbetNejiexl4kUvLHQZyKGW487hU15tTjHflBVMkeAcao7crylCUMRE?=
 =?us-ascii?Q?3r6j/4jiGpr+x1hWr1+e6W4Yn6NhyYFUiCMvcaF9aixCTmXzU/YMQaZtE0UG?=
 =?us-ascii?Q?V8pY5Jsp5T/2mC/SBDlAoQAGXsTdWYW+w9WrTv+qt6k6o5xjFnec32MnjRG6?=
 =?us-ascii?Q?6Gs+vnPPd0Vs4tqmqHOdYFUc3fZdLyu6/MPMbyzMBZ86+B8NUVU8BGBaOu4r?=
 =?us-ascii?Q?lhtV4AOqnZY+XU+MMKL4jWG2lLHcRJtXs4LraYykzwPNjDmu2KdtbXjeIFqE?=
 =?us-ascii?Q?6pBhrVyugKyq0Rj+u2jciSr00mCl/KSoOLJ9a5SEz+lhSmrCRS1I6SNq2ZUC?=
 =?us-ascii?Q?pza2Wb2JFvgferaR9LomEv/CDRRQCTa3zMcDC1MX73ttDixlc2ib20fDK1T7?=
 =?us-ascii?Q?RELLPq6y/975VA3+1RMfdsx2BGqTY8Utq6a4uzlDslimU9wC0Y4HjnUkJX3A?=
 =?us-ascii?Q?pHofuEi0ahRNOhl7G5DlSAWGlptkanTth68sQsXaVPcUguQZ4L8YQ5p90ugE?=
 =?us-ascii?Q?AQTekfIpmNftViQlYWIlLE6qGdeXU6k7e+hzeEHyXu+OBd4zxHGERWzITzYh?=
 =?us-ascii?Q?hUTFLwqxM5Q8t3tFzbXTcwscoACKUXfG01AqoVBkptXDwLTOJ4J154rWWY3B?=
 =?us-ascii?Q?uHQWFd9OtszpK4HmSSK7NKwFo+9UxV4LIzV1ej/K075QAsWHjUUS7nw9jQcK?=
 =?us-ascii?Q?z+l/rE4cTJhdephl9EFdxOvI3PRr3VansT9w5YjTLtKRNysc4dKSP3tcpqOl?=
 =?us-ascii?Q?ZOjM7s1rI4Ygglw2WkQRip+2NribrTj4sYhV5OLLkRE+KnnTznF228wg33V+?=
 =?us-ascii?Q?tWKgvKPhw4FS7Y0uwmf8YDzfaTJ3lqUvjWkDp7eXJZvAA1+2n+WQmXPENIX9?=
 =?us-ascii?Q?i797xps4Seyk+cH8aaX2aUTEEMdaVdn/tsqqGm8hE5bP5211iNksow=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r/xgEP8hJiMzzE/Gsc/QhVclIjbWWTU6ZdzBJEev21cqxXVON3KYtGHgy8FK?=
 =?us-ascii?Q?0QyJyV7+6vGItnxYcX/HzVkHk9RpOOJMGdCE7A8tfeOQgj65PNVJ8Q7zB7id?=
 =?us-ascii?Q?YepVzPnLgUTuE6pjOt9zsD0W6yvcYj+N69r+TO+FX6k1laui6FBgs0KKBED9?=
 =?us-ascii?Q?u/SGqohJiKpIlJIjAqPDzUyjBcSc97J3OTKk8N/1/VGCe0jnf0tuVf9tc3Mf?=
 =?us-ascii?Q?O3tMaXCIxPrr4mc/fDOr1C0cwjtnXQq0jhuCEL/yn99fBSthbKxae2m1Rypn?=
 =?us-ascii?Q?EymkQyRxtm0Tdg4tERNTv1HRdUEO2Xx4swnpnKxHlErmyo3nFuuAUuXgAjzD?=
 =?us-ascii?Q?rxR0gXE2O5GrfCMoz6YRJL1xpdy1UoSNU2rU0S5oaOb0pQ/LLO2Dv4HS5trI?=
 =?us-ascii?Q?ZzXgS7GkS3dJdwuUUtnamqCuAVEin5qUtEKKhr+GGvMzHEjJ42qRTv22zZsJ?=
 =?us-ascii?Q?BMFQ3X5NOWFHv/jIuXcyXFe1gX2qeklYQotFC1uJhd/P/luhBt2tQFtb3NfP?=
 =?us-ascii?Q?at82gSlx3nDEbIVlKwf4/+ZEJ0MgtFtv+cg25ZhyLSi8ujyw1y+Jigg1M7vg?=
 =?us-ascii?Q?32+r3zZQyiQSlCjkQccZdg82q4WwC+27yKUZJnI2OwQDBLPPNMKhYx/88Ya6?=
 =?us-ascii?Q?0P9fZ1aik5kbyIMhxsG3Cs3Hp9uUg824Ij6eDbPaVi8ELQPCPNJdm4R3wfU+?=
 =?us-ascii?Q?5oNOH1l8zgq6iRZddxh4Aqc1FT5Z4Nt+UbpvKrLArYoibdqg5maHJz4vRLPk?=
 =?us-ascii?Q?HcNrUMnqpPhhRvLSnuRZveOHNKRSQm4vWxE/trU92irCij7C3/FtVBvAFY3P?=
 =?us-ascii?Q?/vg9YR+dLMTRvYEzGdQbB4ObbGzU4PGgdpO19hpHVdckWig0G2ogoCdBRlo9?=
 =?us-ascii?Q?CIP/ijgwvQR6Sd9YO2ggLcqlS0QOGIkaKrp5Rsn9OBubycK4nrDkPsC/8Jpo?=
 =?us-ascii?Q?IWTj9X4tSOAJFEKHLdWc6Uu7f3iAzUOMm7Bj41tYKzvFysT09xJG38C8reUl?=
 =?us-ascii?Q?uQfP9ZVl82zgcSSxzdRI9Z9hzcseZ6fGoxitigLX+z8DYbI594usRTffUxhv?=
 =?us-ascii?Q?qB/cYboQZBiG0qo0ocOtoLUQbbXH4NNeD46XpK/0YTWOUDQYg6pnsHg38V+m?=
 =?us-ascii?Q?F87ZASOOEToh+579SflXk+mGAkJBBeXONIcv3IacfrGoSUfIfNccYRduQuu/?=
 =?us-ascii?Q?ZM+ASEKxPFZJS0gQjFO0stfduqHh+Fs/o+LLfE7AgcFqmUW14uaeSMVyj/Cp?=
 =?us-ascii?Q?4VJLI5BArEQ58aszGzygoXczkqt5Wr5gcvFIz1jQ+UD6v2XwUo02/t60XjGq?=
 =?us-ascii?Q?7xRLtFJ+iBzDF7rw8aCAQnnZXh5aqK9WeJto+6eunIAGFfsgq2sbQlSS3GUN?=
 =?us-ascii?Q?jXds6YPGDY5Gj8bcb0naawDF7TNiaEg4Ofdj18dS0vpCTzoufz9Yo/iLTa/7?=
 =?us-ascii?Q?YsTawUA9ijnIusxSfkQo2zYMwWEhYnRxL8bXKnhZ8jO+e8O0AIrmMtrMD0Ow?=
 =?us-ascii?Q?PK+Nc27WXmu6P7mvBv2nxVqcHcb9On2N1R2L45zBhije51KqCX5u90B+R0Qr?=
 =?us-ascii?Q?MUe5ipO+NVMK+oWuNAhECvN+tIQKKV3/haxKXunkZjn2kM607j2nUwMghAB2?=
 =?us-ascii?Q?zQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 768fa7d7-bc76-43fc-fa6f-08de37f13bf3
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 13:37:16.8874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5pVEutFE9VR/ZXYA3yngLPpkEFRv6vGWiKVc6aMorjp2k6GeVWAsBt645vmjHPN/VZPRSWYeHSDJDWbj3embdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4660
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:at_mm/slub.c:#free_large_kmalloc" on:

commit: 5de54811034e58e3c5cef4823504dd93c78fa780 ("mm: Rework compound_head() for power-of-2 sizeof(struct page)")
https://git.kernel.org/cgit/linux/kernel/git/kas/linux.git compound_head

in testcase: boot

config: i386-randconfig-017-20251208
compiler: gcc-14
test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202512101653.99bc860b-lkp@intel.com


[    0.300406][    T1] ------------[ cut here ]------------
[    0.300406][    T1] WARNING: CPU: 0 PID: 1 at mm/slub.c:6760 free_large_kmalloc (mm/slub.c:6760)
[    0.300406][    T1] Modules linked in:
[    0.300406][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.18.0-00004-g5de54811034e #1 PREEMPTLAZY  6e1696c0df2045bcd138d035908771f8466c27fc
[    0.300414][    T1] EIP: free_large_kmalloc (mm/slub.c:6760)
[    0.300818][    T1] Code: 5b 5e 5f 5d c3 2e 8d b4 26 00 00 00 00 8d 76 00 3e 8d 74 26 00 55 89 e5 57 89 d7 56 53 89 c3 e8 9c e8 ff ff 80 7b 1b f8 74 13 <0f> 0b ba ed d8 af b1 89 d8 e8 68 7f fd ff e9 8a 00 00 00 89 c6 85
All code
========
   0:	5b                   	pop    %rbx
   1:	5e                   	pop    %rsi
   2:	5f                   	pop    %rdi
   3:	5d                   	pop    %rbp
   4:	c3                   	ret
   5:	2e 8d b4 26 00 00 00 	cs lea 0x0(%rsi,%riz,1),%esi
   c:	00 
   d:	8d 76 00             	lea    0x0(%rsi),%esi
  10:	3e 8d 74 26 00       	ds lea 0x0(%rsi,%riz,1),%esi
  15:	55                   	push   %rbp
  16:	89 e5                	mov    %esp,%ebp
  18:	57                   	push   %rdi
  19:	89 d7                	mov    %edx,%edi
  1b:	56                   	push   %rsi
  1c:	53                   	push   %rbx
  1d:	89 c3                	mov    %eax,%ebx
  1f:	e8 9c e8 ff ff       	call   0xffffffffffffe8c0
  24:	80 7b 1b f8          	cmpb   $0xf8,0x1b(%rbx)
  28:	74 13                	je     0x3d
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	ba ed d8 af b1       	mov    $0xb1afd8ed,%edx
  31:	89 d8                	mov    %ebx,%eax
  33:	e8 68 7f fd ff       	call   0xfffffffffffd7fa0
  38:	e9 8a 00 00 00       	jmp    0xc7
  3d:	89 c6                	mov    %eax,%esi
  3f:	85                   	.byte 0x85

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	ba ed d8 af b1       	mov    $0xb1afd8ed,%edx
   7:	89 d8                	mov    %ebx,%eax
   9:	e8 68 7f fd ff       	call   0xfffffffffffd7f76
   e:	e9 8a 00 00 00       	jmp    0x9d
  13:	89 c6                	mov    %eax,%esi
  15:	85                   	.byte 0x85
[    0.302169][    T1] EAX: 00000000 EBX: f1801e00 ECX: 00000007 EDX: 00000000
[    0.302648][    T1] ESI: b0309000 EDI: b0309000 EBP: b02a5ee0 ESP: b02a5ed4
[    0.303315][    T1] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00010202
[    0.303837][    T1] CR0: 80050033 CR2: ffd98000 CR3: 022a0000 CR4: 000406d0
[    0.304314][    T1] Call Trace:
[    0.304416][    T1]  ? kobject_uevent_env (lib/kobject_uevent.c:640)
[    0.304777][    T1]  kfree (mm/slub.c:6844)
[    0.305033][    T1]  ? kobject_uevent_env (lib/kobject_uevent.c:640)
[    0.305404][    T1]  kobject_uevent_env (lib/kobject_uevent.c:640)
[    0.305821][    T1]  kobject_uevent (lib/kobject_uevent.c:657)
[    0.306279][    T1]  kset_register (lib/kobject.c:879)
[    0.306787][    T1]  bus_register (drivers/base/bus.c:880)
[    0.307305][    T1]  faux_bus_init (drivers/base/faux.c:245)
[    0.307822][    T1]  driver_init (drivers/base/init.c:36)
[    0.308314][    T1]  kernel_init_freeable (init/main.c:1378 init/main.c:1593)
[    0.308433][    T1]  ? rest_init (init/main.c:1475)
[    0.312434][    T1]  kernel_init (init/main.c:1485)
[    0.312949][    T1]  ret_from_fork (arch/x86/kernel/process.c:164)
[    0.313466][    T1]  ? rest_init (init/main.c:1475)
[    0.313958][    T1]  ret_from_fork_asm (arch/x86/entry/entry_32.S:737)
[    0.314514][    T1]  entry_INT80_32 (arch/x86/entry/entry_32.S:945)
[    0.315071][    T1] irq event stamp: 677
[    0.315581][    T1] hardirqs last  enabled at (685): __up_console_sem (arch/x86/include/asm/irqflags.h:42 arch/x86/include/asm/irqflags.h:119 arch/x86/include/asm/irqflags.h:159 kernel/printk/printk.c:345)
[    0.316422][    T1] hardirqs last disabled at (694): __up_console_sem (kernel/printk/printk.c:343 (discriminator 3))
[    0.317385][    T1] softirqs last  enabled at (624): handle_softirqs (kernel/softirq.c:469 (discriminator 2) kernel/softirq.c:650 (discriminator 2))
[    0.318358][    T1] softirqs last disabled at (619): __do_softirq (kernel/softirq.c:657)
[    0.319360][    T1] ---[ end trace 0000000000000000 ]---
[    0.320014][    T1] page: refcount:0 mapcount:0 mapping:(ptrval) index:0xffffffff pfn:0x302
[    0.320425][    T1] aops:0x0 ino:0
[    0.320842][    T1] flags: 0x0(zone=0)
[    0.321296][    T1] raw: 00000000 ffffff01 f1801e08 f1801e08 ffffffff 00000000 ffffffff 00000000
[    0.322308][    T1] page dumped because: Not a kmalloc allocation
[    0.323277][    T1] page: refcount:0 mapcount:0 mapping:(ptrval) index:0xffffffff pfn:0x30a
[    0.324291][    T1] aops:0x0 ino:0
[    0.324424][    T1] flags: 0x0(zone=0)
[    0.324882][    T1] raw: 00000000 ffffff01 f1801f08 f1801f08 ffffffff 00000000 ffffffff 00000000
[    0.325821][    T1] page dumped because: Not a kmalloc allocation
[    0.326440][    T1] page: refcount:0 mapcount:0 mapping:(ptrval) index:0xffffffff pfn:0x30a
[    0.327072][    T1] aops:0x0 ino:0
[    0.327315][    T1] flags: 0x0(zone=0)
[    0.327577][    T1] raw: 00000000 ffffff01 f1801f08 f1801f08 ffffffff 00000000 ffffffff 00000000
[    0.328168][    T1] page dumped because: Not a kmalloc allocation
[    0.328487][    T1] page: refcount:0 mapcount:0 mapping:(ptrval) index:0xffffffff pfn:0x30a
[    0.329056][    T1] aops:0x0 ino:0
[    0.329297][    T1] flags: 0x0(zone=0)
[    0.329580][    T1] raw: 00000000 ffffff01 f1801f08 f1801f08 ffffffff 00000000 ffffffff 00000000
[    0.330174][    T1] page dumped because: Not a kmalloc allocation
[    0.330686][    T1] page: refcount:0 mapcount:0 mapping:(ptrval) index:0xffffffff pfn:0x30a
[    0.331256][    T1] aops:0x0 ino:0
[    0.331496][    T1] flags: 0x0(zone=0)
[    0.331760][    T1] raw: 00000000 ffffff01 f1801f08 f1801f08 ffffffff 00000000 ffffffff 00000000
[    0.332355][    T1] page dumped because: Not a kmalloc allocation
[    0.332649][    T1] page: refcount:0 mapcount:0 mapping:(ptrval) index:0xffffffff pfn:0x312
[    0.333243][    T1] aops:0x0 ino:0
[    0.333487][    T1] flags: 0x0(zone=0)
[    0.333749][    T1] raw: 00000000 ffffff01 f1802008 f1802008 ffffffff 00000000 ffffffff 00000000
[    0.334383][    T1] page dumped because: Not a kmalloc allocation
[    0.334807][    T1] page: refcount:0 mapcount:0 mapping:(ptrval) index:0xffffffff pfn:0x30a
[    0.335372][    T1] aops:0x0 ino:0
[    0.335612][    T1] flags: 0x0(zone=0)
[    0.335876][    T1] raw: 00000000 ffffff01 f1801f08 f1801f08 ffffffff 00000000 ffffffff 00000000
[    0.336413][    T1] page dumped because: Not a kmalloc allocation
[    0.337047][    T1] page: refcount:0 mapcount:0 mapping:(ptrval) index:0xffffffff pfn:0x30a
[    0.337621][    T1] aops:0x0 ino:0
[    0.337895][    T1] flags: 0x0(zone=0)
[    0.338156][    T1] raw: 00000000 ffffff01 f1801f08 f1801f08 ffffffff 00000000 ffffffff 00000000
[    0.338746][    T1] page dumped because: Not a kmalloc allocation
[    0.341224][    T1] Running RCU Tasks wait API self tests
[    0.444516][    T1] Running RCU Tasks Rude wait API self tests
[    0.445152][    T1] Running RCU Tasks Trace wait API self tests
[    0.445628][    T1] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.446843][    T1] futex hash table entries: 256 (15360 bytes on 1 NUMA nodes, total 15 KiB, linear).
[    0.449135][    T1] pinctrl core: initialized pinctrl subsystem
[    0.449553][    T1] pinctrl core: failed to create debugfs directory
[    0.451376][    T1] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.454173][    T1] page: refcount:0 mapcount:0 mapping:(ptrval) index:0xffffffff pfn:0x8da
[    0.454758][    T1] aops:0x0 ino:0
[    0.455001][    T1] flags: 0x0(zone=0)
[    0.455264][    T1] raw: 00000000 ffffff01 f180d908 f180d908 ffffffff 00000000 ffffffff 00000000
[    0.455856][    T1] page dumped because: Not a kmalloc allocation
[    0.456291][    T1] page: refcount:0 mapcount:0 mapping:(ptrval) index:0xffffffff pfn:0x8da
[    0.456424][   T16] Callback from call_rcu_tasks_trace() invoked.
[    0.456897][    T1] aops:0x0 ino:0
[    0.457141][    T1] flags: 0x0(zone=0)
[    0.457402][    T1] raw: 00000000 ffffff01 f180d908 f180d908 ffffffff 00000000 ffffffff 00000000
[    0.458001][    T1] page dumped because: Not a kmalloc allocation
[    0.458427][    T1] page: refcount:0 mapcount:0 mapping:(ptrval) index:0xffffffff pfn:0x8d2
[    0.458991][    T1] aops:0x0 ino:0
[    0.459229][    T1] flags: 0x0(zone=0)
[    0.459488][    T1] raw: 00000000 ffffff01 f180d808 f180d808 ffffffff 00000000 ffffffff 00000000
[    0.460109][    T1] page dumped because: Not a kmalloc allocation
[    0.460432][    T1] thermal_sys: Registered thermal governor 'fair_share'
[    0.460436][    T1] thermal_sys: Registered thermal governor 'bang_bang'
[    0.460899][    T1] thermal_sys: Registered thermal governor 'step_wise'
[    0.461353][    T1] thermal_sys: Registered thermal governor 'user_space'
[    0.461880][    T1] EISA bus registered
[    0.462613][    T1] cpuidle: using governor ladder
[    0.462954][    T1] cpuidle: using governor teo
[    0.464109][    T1] PCI: Using configuration type 1 for base access
[    0.465094][    T1] kprobes: kprobe jump-optimization is enabled. All kprobes are optimized if possible.
[    0.465864][    T1] workqueue: round-robin CPU selection forced, expect performance impact
[    0.486995][    T1] ACPI: Added _OSI(Module Device)
[    0.487350][    T1] ACPI: Added _OSI(Processor Device)
[    0.487709][    T1] ACPI: Added _OSI(Processor Aggregator Device)
[    0.508673][    T1] ACPI: 1 ACPI AML tables successfully acquired and loaded
[    0.533188][    T1] ACPI: Interpreter enabled
[    0.533548][    T1] ACPI: PM: (supports S0 S5)
[    0.533858][    T1] ACPI: Using IOAPIC for interrupt routing
[    0.534322][    T1] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20251210/202512101653.99bc860b-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

