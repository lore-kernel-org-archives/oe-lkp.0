Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAA4256A
	for <oe-lkp@lists.linux.dev>; Tue, 21 May 2024 07:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716277125; cv=fail; b=TBoFXHuMBr2yu3JYQF7ZISJBt87nbaaf383JyQEJ2ZYdgG96u6ZvOBg9BxDzdWol9Hhv4Fm3Yeqt5QoGlMT2EysldupJWyYJJpfT9gdEEmV3bVaJSaZhAPIghYlBqdOIuAPaKy0oA4h9NW49Zc4Og1OyQvlWGNomWBnUxy6ofvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716277125; c=relaxed/simple;
	bh=1EbqtY2qZOyTk8cNymN2Ic1ahbhsj9x3Wv+DgcSSnJo=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=FOiWyATWh4MUa/yqpcG6gv4xAnlvlvgGht4KNhdMUZ0qFCn8cCYzs3Vtskl2lFm4Ey+xwL7S1wyH09ojkhDQ7oi0u41Ac1QecmjD+NkGmJ7IpR82feOmeu2tUxWyDy0Dr9+V1NT3M9hAVNqZpvOUDF560n0VD8k0+xc/T5xblR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GJMUWktj; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GJMUWktj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716277124; x=1747813124;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1EbqtY2qZOyTk8cNymN2Ic1ahbhsj9x3Wv+DgcSSnJo=;
  b=GJMUWktjLv8dP/xjT6f2GezR77UECniEyibschmU/zymEg3fAvhnTKz7
   wZ+ZfxHwjqxWunMwFNkoYsTV9PxCE+q/RbFfqUMtSNYIhGoTrrj6fEZzj
   gwiXVTumc+JzY3yQHiCd8bv5al9wJ5aQm4C2yFh0f1vsu1oNJ5RBJR/MK
   Prn2S5/mb3+geFTHsBUOr9PiDfSDhg5J67TSJTK46okPpMyHOVcnVn1l7
   z2P6fIbmLklrDbaO2kItJNnnwghi57uN0M1qSMEoOewCbhZFdEb6s+yGg
   cX7myLIh2OouWyZOnIplgPlezzu/Djo08prfkHeL0frQHz3sjENKggrub
   g==;
X-CSE-ConnectionGUID: 38tUMSb+TD6SDbbJVwi02g==
X-CSE-MsgGUID: E+PRmYeyRzKAACvTi9SptQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12297554"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; 
   d="scan'208";a="12297554"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2024 00:38:43 -0700
X-CSE-ConnectionGUID: RC6JgpkRR0y5mKVMyfxM/A==
X-CSE-MsgGUID: 0b+/bl5sQLqRBHczDFS+ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; 
   d="scan'208";a="32856014"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 May 2024 00:38:42 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 00:38:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 00:38:41 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 21 May 2024 00:38:41 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 21 May 2024 00:38:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dBfeO8VeMcbmBAMtd3H+mchhmwpAjwPPLLSpX03rMDEKUZfpUTKGp9Hm8WHbalekDi2y7gqP2dvyEJV6x5EaalN/mCF/J4A0oxqm9UBUoit9+aeLzt2i5g2i+SXGVjDyZxEFl4Llg7jIYCT2aZHNoncAL4ZaMqjdX0Z+i/VMqQxuiubqQYgQWP3hFd5sTiRlOqiefUvk9tIqT8IwZ/+/NYenBwyOCa8pFqoORaJT/6fdCD4sw/7YJw4Pn1HWsXLZRdGygfdheHzlmn9DAVAK9A6JXr0qk0RyVpGoiZ23q0EWccj9iY18lzu/bCLEBHixSW2vogDdwYzKXbRc+hzt1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TXd+lcEGD92jl+J1iZ+BHnRb3zg2/sVxYjtr5QjG3Vw=;
 b=Gfv57oIbNTQmHZTiHMudTDeEScjliju0eBJ8XUCDv4N0hTHrFNmZ8Qr7XG2g3ZBq3rbWzcApqZbSPrc74rfHQI/7yljr4d9fUoNeXSKJihLAvUJeDIg4uBg8H8ZMxBX2QH30WGYpAxqc0/qyNHlW81Jy5YuAAXEVr8i5oUYp9uSn09F+md/8COLp9h43JXoUFzKoOapO8GyPTHYSZs3PQq2AT/egQo5qn7JcH8B7GrSbTvjzY3+dIwJf55V/vqqyqKWC4mqa/ujk4hnWETcYJ1WwuPfVt1Om7ZpJtXEDUEyWcgi1KSODWJJxixbb9FQGKXHe8ZviYJ9IEl6pQm3Gag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH7PR11MB5913.namprd11.prod.outlook.com (2603:10b6:510:137::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 07:38:39 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%2]) with mapi id 15.20.7587.030; Tue, 21 May 2024
 07:38:39 +0000
Date: Tue, 21 May 2024 15:38:31 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [linyunsheng:page_frag_cache_v4_0509] [net] c868933189:
 BUG:KASAN:use-after-free_in_copy_to_iter
Message-ID: <202405211419.6ff21df5-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SGXP274CA0002.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::14)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH7PR11MB5913:EE_
X-MS-Office365-Filtering-Correlation-Id: 728500ed-37b6-4100-c885-08dc796907ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ROT4bSY2g7xgVDDc0t2FxTrLVcMfj2xwpSk5bnTBqoxwTQUzAlrewt4X8uev?=
 =?us-ascii?Q?RMS0/eNwA6aR2TKzg4gJzyiTUVK9i+xrThuwqOhbJ0Af4KzOEAGoboKZcN8s?=
 =?us-ascii?Q?Go7xhEgQRbRszOj8rr6sPOkBUqJinlI80KW13cc+UEqgsNxwKcoz0b6YXna1?=
 =?us-ascii?Q?rX+DTfr8ojfwpaOtEk6T5NJuQ+w/S1bK9rybTmhVZ5RRkB5nuV4BCjcTXpuz?=
 =?us-ascii?Q?+X8eAmSSbKk03Lwk0aUjMSsSFjTKzps0bUNBXIjFKtUtyPnzNbKD2XQBdVUX?=
 =?us-ascii?Q?imdG1/QUd9kTNS0AafRuanI773DaJE0q4svhENuz/oxoyaNJiuAyh98adntc?=
 =?us-ascii?Q?oLJ1wKFtU2KtynrYK0AYao+OHLufR2yMzftg/TysUqiOdz1IN8X0eYqPzqhT?=
 =?us-ascii?Q?cjNgYSovedlB+oJSaPGr2D6gt9Gysm9TsijtAAszo4PPN61L5xBQ0vQGHYz/?=
 =?us-ascii?Q?uoW8pk+SYS3yEMZvwR8TehhKZTcazOHYuL6SFSb2EaNsETLIoc5DX4/Mablo?=
 =?us-ascii?Q?UpQ02F/v/O1hDEFdZ7bqyWCpYI8AYe5qSR2ipyuwPLsXGbUp6jKfZgtBOidV?=
 =?us-ascii?Q?aUmgrrS24hVOhJVIMhga+oJNA/bFwVXGpDVsJIZ2T/tunsg68rB5vRebUh2B?=
 =?us-ascii?Q?Oov1fT1o5DAAipGKmTn1uAdm1W02NYFkBItRV2CE4bTdFz5Jr5lQo/lzuRT4?=
 =?us-ascii?Q?RVtBp/UEyvwBaL6DkfPixGacZHFSVT+S1xDOL6Wif5Q2M+SWYJTAKhxWxELc?=
 =?us-ascii?Q?x85xH3p/jA4N/RP3CSaHtdvgJSUspgr3Tt334uENSY1iY4XgZyLH241hp8TY?=
 =?us-ascii?Q?nlGSWFOq286eu0u3gD4mFB/tmSTKjGIpKtfmo9pn3gCNCc98hlID13muImsP?=
 =?us-ascii?Q?no43LEmkMdD0ZcmYnAppL29IpojE6ucHFDvZoJaOp7W03DH6umUQttWsI4TC?=
 =?us-ascii?Q?IOKq0WVJE0C4tmRWq6arc5M5cd4N0uE7JVoPbwdMdKSX4vSuTg4+/LCVxs9R?=
 =?us-ascii?Q?uOFq0UgbPc0yR3mushwPpsoVwR5qvQjjJtxvsVxHS3TR15/ZwUlkAEGmrRAE?=
 =?us-ascii?Q?GjiXKzghi0Kv5RZKX24+ZQJjBQKWOANfYzTcHElA870Vh9/j8u859DhUR/Zq?=
 =?us-ascii?Q?xu598/hvA5vbJfwaEByU8zb63Sy6uQPi13IUWTwUzlie2j1CgJMoI4buAPf1?=
 =?us-ascii?Q?jA9wmzZuQpTUa6EaoBMO8VtQ3tRQOu3HP+9nzyzbOxJlvgjhTSBySo0dgJY?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sU2z/h6SOjvOucCZ3UfmQ1QB1KHCDIsW6uZ5YHG3+IioYHDN7e3rhLApX7SK?=
 =?us-ascii?Q?iGPf48Y3QQuG0NIrrdUqdDFI223Ll1Ypmoulo0PB1jd7vFtPCELy2eWpx73A?=
 =?us-ascii?Q?OXo6mfsCmQnMZIDce2PSVndO9pcogHX0nMGS851cQ60i3ii+564km/x3SELO?=
 =?us-ascii?Q?LlI14TCQTSovhTiHJtkpx5NLQT/AO5l+9T61k3f8/5ZR7Nd7iEeabT+MSMpL?=
 =?us-ascii?Q?G/hcNtJnbQ7q+AD1yyJfpKpK6or40/zsw9Dd6GCgg+7n5/MnkA0tNNs+n7ZM?=
 =?us-ascii?Q?94Bu0sL9UOZDXoIWYbL3lRMh0AeUayJcfBuXneKPY/S1Gt5Gs4M3i4wI0T33?=
 =?us-ascii?Q?W46h/5aQv6BTLSGHRoaWwmFTBc6jDAoLvT2E11WdeAgA2uUi1aevnSRIPbjh?=
 =?us-ascii?Q?rJERhMSVdjtaaVcFUrR0AVymRX9Os0IUkk4edUAfv7hEpHbPKkxdCmTWkmNV?=
 =?us-ascii?Q?1xPFotrOkqxpBMBSC0j0tVcSoQZBAwuRRhIWJmUqcm9EndFlSJLpyBhltt8H?=
 =?us-ascii?Q?89hJLQu9w8cp2mbLUn6d+P8ID00Osch/k8Nj5CHY0cKjvmcfsiQyAOg7Hkzo?=
 =?us-ascii?Q?P7GUh2P83wwkE/3mKZNVCOapr+QDtwiIuhsOZDWZ1C9GpOFh0qNv07+9dD8x?=
 =?us-ascii?Q?sYfhQIM/OT2XCuRDCVUPq9LEvGOxKia1t12KHk/az/m31OF8jiokrYTsWnzw?=
 =?us-ascii?Q?5Q0QrD8FBOA/AO+KBraGzuZsVcLcJQnKenXKnPrg7+Pug11LYlQy1coRa4Ig?=
 =?us-ascii?Q?QwgwlAWu7igW0gtKIpp/9CuacZFWOCoQMyojBIMzmtQVKInRxG7a+ln90vE4?=
 =?us-ascii?Q?hQf4i8c69Wn+o7vQvUTyiEfM3Obe9Qdn5zGxWyrYQl1Z1fwrQvkXzVKU4q0J?=
 =?us-ascii?Q?lRz0vKsa19Gu6xqfv2keTUp4gbaB/M5y1UmCjsbXphRRzj1l3TFKlSr5W4D4?=
 =?us-ascii?Q?9x4wFoOjpjMThfT/ocpbWNEBXhLLmqTWdCkiuF18NC+3gI6Xd4m58Fk4lRKt?=
 =?us-ascii?Q?JKx+IztLMB4VaibTcm03lrIitOelqSOSyZyb5KYtDyoHSNb3a/pqQPq92Ik0?=
 =?us-ascii?Q?xwc3UdrsFKM9FAjr4Ozcvzqo4Rcc9ZJWL4VpydBZe0elr1zf1JlFIhFLHzcB?=
 =?us-ascii?Q?XePCdS0d43mjjuDOqxeskuWY54m/UNWEVUfMmUiCCxIYRa5oXtv16PND3Agm?=
 =?us-ascii?Q?g9xd+K2nZJSIyHXnPH71uT75XiFwdqmQWim29kyaAg88cbYSITDRjE25S8zv?=
 =?us-ascii?Q?reIrbDZ8yPhNxMy6GIHb5DV4C7f450c0dcUcfU5QgPERSD1tgXk2H3Mkmo0Y?=
 =?us-ascii?Q?5y7xdG23cEFN7Flu8V4oIGeufe5WozhXqTFEHEdDp7ChPU8zeeRllqnSqIVm?=
 =?us-ascii?Q?HwRfunONrFRyb8nFMfJvDvXU6EGbzZZ4mvzvWdd7hVvHGkyPhrqNjgSxjHzK?=
 =?us-ascii?Q?u0KwtV4lmYI76NiM01mPQG/CkkCl9+NZXd6Od0OIGKgGFT3TJ2JYtwednCgH?=
 =?us-ascii?Q?B9QDlFYlUVpim3ca3Asudt7o8Q+qjYtMHOeubnRMan9c9YhBdXIKXnZmCgv/?=
 =?us-ascii?Q?besFzyXFDWDIWslsm9B6n+e2NtCLfPRlUmlr+E/DuSaAUyf0gSd6WnIOHBrs?=
 =?us-ascii?Q?ZA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 728500ed-37b6-4100-c885-08dc796907ca
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 07:38:39.0261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZvkKbabdimvYLY9zFXEzmac3qnReqSnXmtWi+/NfDzx/SxGYErx7eDcjkGpzmrMK02odb0d96S/nbTLeZjnjMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5913
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:KASAN:use-after-free_in_copy_to_iter" on:

commit: c868933189e44e45cf7ff0088d9bc5f77bf63e83 ("net: replace page_frag with page_frag_cache")
https://github.com/gestionlin/linux.git page_frag_cache_v4_0509

in testcase: ltp
version: ltp-x86_64-14c1f76-1_20240511
with following parameters:

	disk: 1HDD
	fs: xfs
	test: syscalls-01



compiler: gcc-13
test machine: 4 threads 1 sockets Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz (Ivy Bridge) with 8G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202405211419.6ff21df5-oliver.sang@intel.com


kern :err : [  596.121731] BUG: KASAN: use-after-free in _copy_to_iter (arch/x86/include/asm/uaccess_64.h:105 arch/x86/include/asm/uaccess_64.h:105 arch/x86/include/asm/uaccess_64.h:131 lib/iov_iter.c:25 include/linux/iov_iter.h:29 include/linux/iov_iter.h:245 include/linux/iov_iter.h:271 lib/iov_iter.c:185) 

kern  :err   : [  596.130162] Read of size 4096 at addr ffff8881fae4a000 by task splice05/6895

kern  :err   : [  596.130172] CPU: 0 PID: 6895 Comm: splice05 Tainted: G S                 6.9.0-rc7-00067-gc868933189e4 #1
kern  :err   : [  596.130178] Hardware name: Hewlett-Packard HP Pro 3340 MT/17A1, BIOS 8.07 01/24/2013
kern  :err   : [  596.130182] Call Trace:
kern  :err   : [  596.130186]  <TASK>
kern :err : [  596.130189] dump_stack_lvl (lib/dump_stack.c:117) 
user  :notice: [  596.139983] rt_sigaction01    0  TINFO  :  sa.sa_flags = SA_RESETHAND
kern :err : [  596.147255] print_address_description+0x30/0x410 

kern :err : [  596.159708] ? _copy_to_iter (arch/x86/include/asm/uaccess_64.h:105 arch/x86/include/asm/uaccess_64.h:105 arch/x86/include/asm/uaccess_64.h:131 lib/iov_iter.c:25 include/linux/iov_iter.h:29 include/linux/iov_iter.h:245 include/linux/iov_iter.h:271 lib/iov_iter.c:185) 
kern :err : [  596.159720] print_report (mm/kasan/report.c:489) 
kern :err : [  596.159727] ? kasan_addr_to_slab (mm/kasan/common.c:37) 
kern :err : [  596.159734] ? _copy_to_iter (arch/x86/include/asm/uaccess_64.h:105 arch/x86/include/asm/uaccess_64.h:105 arch/x86/include/asm/uaccess_64.h:131 lib/iov_iter.c:25 include/linux/iov_iter.h:29 include/linux/iov_iter.h:245 include/linux/iov_iter.h:271 lib/iov_iter.c:185) 
user  :notice: [  596.171467] rt_sigaction01    0  TINFO  :  Signal Handler Called with signal number 45
kern :err : [  596.174198] kasan_report (mm/kasan/report.c:603) 
kern :err : [  596.174211] ? _copy_to_iter (arch/x86/include/asm/uaccess_64.h:105 arch/x86/include/asm/uaccess_64.h:105 arch/x86/include/asm/uaccess_64.h:131 lib/iov_iter.c:25 include/linux/iov_iter.h:29 include/linux/iov_iter.h:245 include/linux/iov_iter.h:271 lib/iov_iter.c:185) 
kern :err : [  596.174219] kasan_check_range (mm/kasan/generic.c:175 (discriminator 1) mm/kasan/generic.c:189 (discriminator 1)) 

kern :err : [  596.185797] _copy_to_iter (arch/x86/include/asm/uaccess_64.h:105 arch/x86/include/asm/uaccess_64.h:105 arch/x86/include/asm/uaccess_64.h:131 lib/iov_iter.c:25 include/linux/iov_iter.h:29 include/linux/iov_iter.h:245 include/linux/iov_iter.h:271 lib/iov_iter.c:185) 
kern :err : [  596.185809] ? __pfx_mutex_unlock (kernel/locking/mutex.c:543) 
kern :err : [  596.185817] ? __pfx__copy_to_iter (lib/iov_iter.c:180) 
kern :err : [  596.185823] ? unix_stream_read_generic (include/net/scm.h:77 net/unix/af_unix.c:2902) 
user  :notice: [  596.194387] rt_sigaction01    0  TINFO  :  signal: 45
kern :err : [  596.194462] ? __pfx___might_resched (kernel/sched/core.c:10152) 

kern :err : [  596.203442] copy_page_to_iter (lib/iov_iter.c:364 lib/iov_iter.c:349) 
kern :err : [  596.203453] pipe_read (fs/pipe.c:328 (discriminator 1)) 
kern :err : [  596.203464] ? __pfx_pipe_read (fs/pipe.c:252) 
user  :notice: [  596.211572] rt_sigaction01   58  TPASS  :  rt_sigaction call succeeded: result = 0
kern :err : [  596.212955] ? __pfx_unix_stream_splice_read (net/unix/af_unix.c:2965) 

kern :err : [  596.225843] ? mutex_unlock (arch/x86/include/asm/atomic64_64.h:109 (discriminator 5) include/linux/atomic/atomic-arch-fallback.h:4329 (discriminator 5) include/linux/atomic/atomic-long.h:1506 (discriminator 5) include/linux/atomic/atomic-instrumented.h:4481 (discriminator 5) kernel/locking/mutex.c:181 (discriminator 5) kernel/locking/mutex.c:545 (discriminator 5)) 
kern :err : [  596.225853] ? __pfx_mutex_unlock (kernel/locking/mutex.c:543) 
kern :err : [  596.225859] ? rw_verify_area (arch/x86/include/asm/atomic64_64.h:15 include/linux/atomic/atomic-arch-fallback.h:2583 include/linux/atomic/atomic-long.h:38 include/linux/atomic/atomic-instrumented.h:3189 include/linux/fsnotify.h:23 include/linux/fsnotify.h:68 include/linux/fsnotify.h:106 include/linux/fsnotify.h:98 include/linux/fsnotify.h:128 fs/read_write.c:381) 
kern :err : [  596.225866] vfs_read (include/linux/fs.h:2104 fs/read_write.c:395 fs/read_write.c:476) 
user  :notice: [  596.233846] rt_sigaction01    0  TINFO  :  sa.sa_flags = SA_RESETHAND|SA_SIGINFO
kern :err : [  596.235359] ? do_splice (arch/x86/include/asm/atomic64_64.h:15 include/linux/atomic/atomic-arch-fallback.h:2583 include/linux/atomic/atomic-long.h:38 include/linux/atomic/atomic-instrumented.h:3189 include/linux/fsnotify.h:23 include/linux/fsnotify.h:68 include/linux/fsnotify.h:106 include/linux/fsnotify.h:98 include/linux/fsnotify.h:355 fs/splice.c:1396) 

kern :err : [  596.242093] ? __pfx_vfs_read (fs/read_write.c:457) 
user  :notice: [  596.250305] rt_sigaction01    0  TINFO  :  Signal Handler Called with signal number 45
kern :err : [  596.251948] ? __pfx_pipe_clear_nowait (fs/splice.c:49) 

kern :err : [  596.263537] ? __do_splice (fs/splice.c:1436) 
kern :err : [  596.263548] ksys_read (fs/read_write.c:619) 
kern :err : [  596.263555] ? __pfx_ksys_read (fs/read_write.c:609) 
user  :notice: [  596.270769] rt_sigaction01    0  TINFO  :  signal: 45
kern :err : [  596.270891] ? __x64_sys_splice (include/linux/file.h:47 fs/splice.c:1654 fs/splice.c:1634 fs/splice.c:1634) 

kern :err : [  596.279871] do_syscall_64 (arch/x86/entry/common.c:52 (discriminator 1) arch/x86/entry/common.c:83 (discriminator 1)) 
kern :err : [  596.279884] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130) 
kern  :err   : [  596.279891] RIP: 0033:0x7f48ae35d19d
kern :err : [ 596.279897] Code: 31 c0 e9 c6 fe ff ff 50 48 8d 3d 66 54 0a 00 e8 49 ff 01 00 66 0f 1f 84 00 00 00 00 00 80 3d 41 24 0e 00 00 74 17 31 c0 0f 05 <48> 3d 00 f0 ff ff 77 5b c3 66 2e 0f 1f 84 00 00 00 00 00 48 83 ec
All code
========
   0:	31 c0                	xor    %eax,%eax
   2:	e9 c6 fe ff ff       	jmpq   0xfffffffffffffecd
   7:	50                   	push   %rax
   8:	48 8d 3d 66 54 0a 00 	lea    0xa5466(%rip),%rdi        # 0xa5475
   f:	e8 49 ff 01 00       	callq  0x1ff5d
  14:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  1b:	00 00 
  1d:	80 3d 41 24 0e 00 00 	cmpb   $0x0,0xe2441(%rip)        # 0xe2465
  24:	74 17                	je     0x3d
  26:	31 c0                	xor    %eax,%eax
  28:	0f 05                	syscall 
  2a:*	48 3d 00 f0 ff ff    	cmp    $0xfffffffffffff000,%rax		<-- trapping instruction
  30:	77 5b                	ja     0x8d
  32:	c3                   	retq   
  33:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  3a:	00 00 00 
  3d:	48                   	rex.W
  3e:	83                   	.byte 0x83
  3f:	ec                   	in     (%dx),%al

Code starting with the faulting instruction
===========================================
   0:	48 3d 00 f0 ff ff    	cmp    $0xfffffffffffff000,%rax
   6:	77 5b                	ja     0x63
   8:	c3                   	retq   
   9:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  10:	00 00 00 
  13:	48                   	rex.W
  14:	83                   	.byte 0x83
  15:	ec                   	in     (%dx),%al
user  :notice: [  596.287728] rt_sigaction01   59  TPASS  :  rt_sigaction call succeeded: result = 0
kern  :err   : [  596.292862] RSP: 002b:00007fffa9248528 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
kern  :err   : [  596.292873] RAX: ffffffffffffffda RBX: 00005612565b7004 RCX: 00007f48ae35d19d
kern  :err   : [  596.292877] RDX: 0000000000010000 RSI: 000056128341db20 RDI: 0000000000000006
kern  :err   : [  596.292881] RBP: 00005612565b7004 R08: 0000000000000006 R09: 000056128341db20
kern  :err   : [  596.292884] R10: 00007f48ae274b40 R11: 0000000000000246 R12: 0000000000000054
kern  :err   : [  596.292888] R13: 0000000000000001 R14: 0000000000000006 R15: 000056128341db20
kern  :err   : [  596.292896]  </TASK>

kern  :err   : [  596.292901] The buggy address belongs to the physical page:
kern  :warn  : [  596.292903] page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x1fae4a
kern  :warn  : [  596.292909] flags: 0x17ffffc0000000(node=0|zone=2|lastcpupid=0x1fffff)
kern  :warn  : [  596.292914] page_type: 0xffffffff()

kern  :warn  : [  596.300940] raw: 0017ffffc0000000 ffffea00073bdc88 ffffea0007912c88 0000000000000000
kern  :warn  : [  596.300946] raw: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
kern  :warn  : [  596.300949] page dumped because: kasan: bad access detected

kern  :err   : [  596.300952] Memory state around the buggy address:
kern  :err   : [  596.300956]  ffff8881fae49f00: fa fb fb fb fb fb fb fb fc fc fc fc fa fb fb fb
kern  :err   : [  596.300960]  ffff8881fae49f80: fb fb fb fb fc fc fc fc fc fc fc fc fc fc fc fc
kern  :err   : [  596.300964] >ffff8881fae4a000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
user  :notice: [  596.307142] rt_sigaction01    0  TINFO  :  sa.sa_flags = SA_RESETHAND|SA_SIGINFO
kern  :err   : [  596.310195]                    ^
kern  :err   : [  596.310202]  ffff8881fae4a080: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff

kern  :err   : [  596.318922]  ffff8881fae4a100: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
kern  :err   : [  596.318925] ==================================================================
kern  :warn  : [  596.318985] Disabling lock debugging due to kernel taint
user  :notice: [  596.329010] rt_sigaction01    0  TINFO  :  Signal Handler Called with signal number 45
user  :warn  : [  596.336213] LTP: starting tee02

user  :notice: [  596.621917] rt_sigaction01    0  TINFO  :  signal: 45

user  :notice: [  596.632139] rt_sigaction01   60  TPASS  :  rt_sigaction call succeeded: result = 0

user  :notice: [  596.647483] rt_sigaction01    0  TINFO  :  sa.sa_flags = SA_NOMASK

user  :warn  : [  596.654844] LTP: starting stat04_64 (symlink01 -T stat04_64)
user  :notice: [  596.659431] rt_sigaction01    0  TINFO  :  Signal Handler Called with signal number 45

user  :notice: [  596.676101] rt_sigaction01    0  TINFO  :  signal: 46

user  :notice: [  596.686755] rt_sigaction01   61  TPASS  :  rt_sigaction call succeeded: result = 0

user  :warn  : [  596.688138] LTP: starting sync01
user  :notice: [  596.697109] rt_sigaction01    0  TINFO  :  sa.sa_flags = SA_RESETHAND|SA_SIGINFO

user  :notice: [  596.714231] rt_sigaction01    0  TINFO  :  Signal Handler Called with signal number 46

kern  :info  : [  596.716501] loop0: detected capacity change from 0 to 614400
user  :notice: [  596.724164] rt_sigaction01    0  TINFO  :  signal: 46

user  :notice: [  596.741545] rt_sigaction01   62  TPASS  :  rt_sigaction call succeeded: result = 0

user  :notice: [  596.753781] rt_sigaction01    0  TINFO  :  sa.sa_flags = SA_RESETHAND

user  :notice: [  596.766370] rt_sigaction01    0  TINFO  :  Signal Handler Called with signal number 46

user  :notice: [  596.779134] rt_sigaction01    0  TINFO  :  signal: 46

user  :notice: [  596.789999] rt_sigaction01   63  TPASS  :  rt_sigaction call succeeded: result = 0

kern  :err   : [  596.799546] /dev/zero: Can't lookup blockdev


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240521/202405211419.6ff21df5-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

