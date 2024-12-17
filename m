Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003C51F427C
	for <oe-lkp@lists.linux.dev>; Tue, 17 Dec 2024 13:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734443189; cv=fail; b=S5HBrXz8uAQZgfwkRvU7BDS/xNpCFjAa0zpSMuExT2/DridQ3driXXjb5FwVH7MyyhaPOrhhSV0pa45ElwHrAw96zeQYRbp5jGrDLNQ9Iyircxq3YphIRrEI30+myQBPrFTeiFz8RuM2xU+uSSUNsFdOYQqPsYUZx33MqUQV/yY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734443189; c=relaxed/simple;
	bh=6OfqvDnYBXUY9ZS6dMmzSczZUTTegTUpz3dqhh50bRo=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=V+I8u4sg/VDY/kgS8ZpRxl8I1KoMjYMMRRFo2TG4fd2CF74EzpScQJiOViL1xpBurXN6uCawRkew0G7moWr0usbTHbEn5e3ffJvvOOedu/vQinaLz/SGaChDfqwA8zZ81xcob+A+riMO771w7TEFwjHkFUiZ3cHNzNVZejaXJFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OGxw5oyE; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OGxw5oyE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734443188; x=1765979188;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6OfqvDnYBXUY9ZS6dMmzSczZUTTegTUpz3dqhh50bRo=;
  b=OGxw5oyE5AylKdllHtcwPd0jKrnfqio+xqbK3XlltSd3fMxcb+wMJZ2U
   kLBGz3WhRfUfICNHytvq34SR7P6UP4HO3pAko645wBvvI1rzrbxZL7xaB
   cDaGqAOeDy+1kB3kLy+uTQx2RgOxLET7DAjvH3hZYnRTvTBPIhoiIdfRv
   mA+wbEne33BHWhAo7THVVYTyjwUXMKrGgo4TVR3jgnDH7V+/khTEQBPvQ
   M+I0uYbFtyOkXp2opvfI/FpwPi9xVrc69O2vKRqBA55+7SV+xzgyD7H20
   mfHuO7KY/FE/q85b3Vxd0sDo7cr2KRnh+ZOyPVoXAlVX1b09/oxlHs7wx
   A==;
X-CSE-ConnectionGUID: OSRc61RhTHC2RSbGaryZMg==
X-CSE-MsgGUID: +Xc4N60/TT+jJD+VXNH6Pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45875786"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="45875786"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 05:46:27 -0800
X-CSE-ConnectionGUID: RutCdBJiQfuvHkM0Fm7RJQ==
X-CSE-MsgGUID: LRxL6iNnSxmMUC3pIqPlPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="97323524"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 17 Dec 2024 05:46:25 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 17 Dec 2024 05:46:25 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 17 Dec 2024 05:46:25 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 17 Dec 2024 05:45:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IxftRfm/P4BfM68tX3PQSREhiJ9F/c6yUm+i/1AoJxrFgVMufbzBXsD8V/lkwP0tWIdmXue7tE9rZ50k5oL5fKgqtudjswnTr4H4G3c5UEypMtF9Goh67PYW7+KHMazW+vOLhTR5g22iyi0GHdC/vF3BLssxMqvU9eXx3X/u3oRU9KS0ZUP0l3+SPy/DjyWS/Kb4n3BmSv1Wucqv/xhBK5MACFM+D3AGmDTFSjaFNS1BFdGFawWU2I+VEqMAfQfa241QgEAk9n0uo+RFqrOY/Cqlpgw0tTfKqil6a16xIwlxDcbrF3blZuvejhSJigOkOsptOZz3dmOWEB8ItqFtEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fqtY4U1ctPHod2axA+GTrs/njX7gbxxP4ybjBGahgvw=;
 b=BZh7nmgYWEr0/TXD5ilw89oexFFbK7bhbqHtgSwrQLnRzvIR7elkv0pNReAMWS7BLgW27aUhXtiLgMLm3C5V8zzhs3NEa9O2oPRg32hK1OHDSLqJFPQcQz+Y4ASzM27cJ7Qg1sQAgaPTfH6eu6GJpj8L/5jZ+u942Y3i5Q0yvCa2CLUQXmCkEr8ZIs5o6x79hFaaUpH6HQn3PxA1RYeFvKYdyvBsAvo2hV5dd555I4kxPC1x/R9RWJcA9X+pLfFTN8iXmgPaA+izifNt6dJtgRJBkQdGzb3RALpdSmSNEUGzucJafb6ZhfRfAYQ89rFAhjgilMfz2V4EjL9iXSjMuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SA3PR11MB8119.namprd11.prod.outlook.com (2603:10b6:806:2f2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.20; Tue, 17 Dec
 2024 13:45:51 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%6]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 13:45:51 +0000
Date: Tue, 17 Dec 2024 21:45:42 +0800
From: kernel test robot <oliver.sang@intel.com>
To: <linux+lkp@weissschuh.net>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [thomas-weissschuh:b4/sysfs-const-bin_attr-misc-drivers] [misc]
 6b727c4363: BUG:kernel_NULL_pointer_dereference,address
Message-ID: <202412172123.51ce950b-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2P153CA0012.APCP153.PROD.OUTLOOK.COM (2603:1096::22) To
 LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SA3PR11MB8119:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e341d06-826b-4d2d-405e-08dd1ea11e93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kwUzwZHsFdFwwySflozCTVL/5CX9Qj915B0vqRPKKnq9gQZBg9LsJ/rLnSka?=
 =?us-ascii?Q?25aFFBJMvoBr3WeGzbWfCZqJ95+GbAV92v6FockBkNF19u4i6Pst8zLrXcu2?=
 =?us-ascii?Q?fm1Zn1z6UCdlgIH+KHbkbaI49M3grkPYC3v0UkYW4h8ZCShOeB6vejU6Z9Xa?=
 =?us-ascii?Q?xw3eH5ist+jiC+1BDfGGPPxuQKPZvtkqO4e035riG8vsok3nm97wBjF5HEHG?=
 =?us-ascii?Q?APyS7KfzLgsNutUJ5Kuwrb3LsgjuteZq5DfEotbzWyBTqfNcB/wM2l9QPiO3?=
 =?us-ascii?Q?p74biKCd2vpEOFiPyt7ealb4tG22Js1DSVO2cuZ3EYZL4xstFfmPXir07TWr?=
 =?us-ascii?Q?fwrPJ6J78Qj2PNzOQLVGiF8eGV9vA5Y0klwnksRYdEdSLliiXDgsEl80aIDM?=
 =?us-ascii?Q?m6uYTF4gebahondX0Gs+m6P88K2axjQGvAi1rHjB+3hzwiFLSKr2y76q/LEG?=
 =?us-ascii?Q?3qi/VQ+XLZ4Lk6tEIFfJeRz7uox6dTHiEeL2Glf/PW2XngoXPJYMvQtsEUcO?=
 =?us-ascii?Q?/Ys5jHYUskKrzn0lvL8EHqK5TSdvhfxTUnpelz3wejjVTItBXwnT0P9VO/xD?=
 =?us-ascii?Q?VsTqz3MjUA0lu+ANZvioq/aI9McYChkQjFSvDlcJ4Gb9HmYe4HT6H4qrWE4e?=
 =?us-ascii?Q?xS+QUU0YxAEnzwmjU2cWvbVxgyszF/FGhCLIT+8noPEzUWzI+jcXt0krqp5/?=
 =?us-ascii?Q?wGPOyRpXYahJ3GLK7/S2Iyjfst6x4hxmyc773W9SU1l2fwzmtq6pFqsotkHs?=
 =?us-ascii?Q?9AQMfsKoV1ypL4siVFZfHdxyAvq0m9KQwy1ggMWLKxEFGPSWRyuvQ8f1808u?=
 =?us-ascii?Q?WkwssZBWQizcLQthaQ8fqoNBIOIXPIv7qJiO+WrqvULJPRGWuAsj/eXZboRR?=
 =?us-ascii?Q?0it3TD37MRKhAbWtBsS0qaKyfHkuEFbzPMRR4sn9y0Jk5HmHBU3nOaG1vwgy?=
 =?us-ascii?Q?GAsz2zSExGXsqHu9AkrzkK3TajemD+uxskAb4aEvYvOTVtJw0tGd2k+SQOtN?=
 =?us-ascii?Q?AHHzV/T1m1OhFnwgNWT+IoKmmt9ed2jtdeAoZktgNuMz2Yj/Ws0+H7o+KuJC?=
 =?us-ascii?Q?B83ODuhwisicOOONGRN73uHBsjVNjfCwTEvkxrfmG1yKs6bwRLjTn7jKhiSJ?=
 =?us-ascii?Q?s/gvnU3XDljOY3BniXyqglWMHy+zDOrtC/+zGj5iYoAbRR4wbmriJd9xjhNe?=
 =?us-ascii?Q?NPkXuMecDlXJgbrmiZd37Mr4vJetJFVUa4TyDIymM4Z38H9j6F6f8LgEj5eU?=
 =?us-ascii?Q?yrEeayoJsxS7gIamdz6UhiEAwd5NA6eak5ULk1NvOdH5Cf7bGxLbHxOIcfvE?=
 =?us-ascii?Q?v6hR7XUu4gxU5byc9lTrW+JiiG58BqTSm6KJAgsq26pf1g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HCGjHaZk1NgkGt+fzio6VsP3qaeNSiPQszAaHpAfh2kNgobTnZlZwPLDe3KA?=
 =?us-ascii?Q?yQbz8/XpQT5khGGaB+NBS4ln2Bz7Kw1zx2gQCbQhNGQ1s5D00+OvH4uIfhcH?=
 =?us-ascii?Q?JwTKVVe/hG/6PcTuPInwl9CF8q0KjqWrL21BT5kovoy+vgSr/SRnoFW8m340?=
 =?us-ascii?Q?KqPDDqAl8lRjelPgA/d1syvJfPUcminQt/IoJXibyF/NJRyLM3KJUn7q7otO?=
 =?us-ascii?Q?6aNw+XSYSaMCDeUQpXjbBTfhnY8mptLpqsgrDszOMWg7tU3m4OITBr7gB3Kx?=
 =?us-ascii?Q?/N7ZHbzjxUh9+8TpJ0ZgfKwIlAtjKJs63UIHThZTT4hTqUcMhat8lsFICS0Q?=
 =?us-ascii?Q?g5tyW9UE2X1oEsbyX82J7aTKuVHdi21F67coD8AuG1DOyFMiFHuoq0n2V4iq?=
 =?us-ascii?Q?UI7k7fdxVKCeQEa4sKO7ySEPdoKDh1fFZBuHq/fOSQ4Ww/CovyuHz2kAXQK4?=
 =?us-ascii?Q?ZcpjOJ9lYr2vuFrmj7oGtnW/q1UcydEtTR+oO4wqsbNEoPs3JKDaxrHZFAkO?=
 =?us-ascii?Q?LNBeyyTZNZnxnx+fxumaxzxXANPejaKtlHWc/1EXn8gscfL7InwPhBal27GQ?=
 =?us-ascii?Q?25MLXslRETYvY6GdhkdV7DPwe3U03tQS8rZehC7jkIwjJitA/sa0wefLIDJh?=
 =?us-ascii?Q?CV348xpkAzclf2XAe31jItqZA6aGCIymATeOrfHd6NiDPjzTlDIwaZZmx4Q1?=
 =?us-ascii?Q?B6wPP/0YMFTVSWL7BUUpBrHIkgGZgi9RQZxehGvBQkfP7ZhUnqXoqZ9ysI9Z?=
 =?us-ascii?Q?fYyOBZKdziZVQfr8Fh8VEza4HMMDFc6o+bBAG95GMGyI1rWYJbaCaNYS3zyj?=
 =?us-ascii?Q?Rkh5PNN12nakXVJ4Qu04QLYMp+eGXC5dn6Axx+7BuKEEaM85zvBQ51gT8QaK?=
 =?us-ascii?Q?3frOej/3+6n0knbzbhStHHpUd78qTRDNqWzCBg45CLRqgzr2UBdkuZ3XygKk?=
 =?us-ascii?Q?ABojNAOB/+Yq2fE15SdmUDZz0+LbNEFLly1WpXhV8FcEWDnYYX/f+I5z8vdb?=
 =?us-ascii?Q?qtDaZ4FXQz/hEFB327bufq9i0DKr4SAruS19g703EE2nNpIonFQwiuYosUe6?=
 =?us-ascii?Q?g7vN5iOFVyPudpwGzw/ghVKXn+tzlletc2en1vAYX1wLDbvOwQ1yAyATPHrx?=
 =?us-ascii?Q?d5G0kZ09CY5/NQbMOXeVrWDOUl7sXObm7yHif2Jhe8EPxRdc/oDmHHhD0W8v?=
 =?us-ascii?Q?duaVJ3wm27ixkcq39g5xTldO+Zr7Faf9YUP6dZHg/104NFd8O3Ad3rPuBAF+?=
 =?us-ascii?Q?nCOUSJHUb5MhcmdKfRkRl9YoSP4rlFhwUCol84mqPfMjL2FfALvXWYj/UcOF?=
 =?us-ascii?Q?7Vojn/G26MazhmJ3d7UA/OpvJuQE/T01aMCP1E7S4H1ML/B/WOnovOlI+WWl?=
 =?us-ascii?Q?9XeOR+TfpjLjrdzOd+x7UVmdr4b8rY3K2FteXDjnAIg6cBfgCfaOxN2Z3X1Q?=
 =?us-ascii?Q?GZIebOVEm3YxcF5BuZcRqPotkVwa0MGsGzzrI8KmglRH+xSNjy8ssBlMN7Y4?=
 =?us-ascii?Q?60eiakz/rilobuZRpldvBcVjbP00NI/OMQbrmOERn4G6VoSF2pSmAXDd6rq7?=
 =?us-ascii?Q?N++WHnQwgcU5rDJDtznjm1quvWFGfPUwuc71rNaPzHnwqUrFY7cts5TQJEck?=
 =?us-ascii?Q?pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e341d06-826b-4d2d-405e-08dd1ea11e93
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 13:45:51.1248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q2+l6K9iOuLipiqVBO43Kx1jW5ETjfjM17jHqHX63qYJkFpGQGxevPMcA58vE0puOiRMQI35Lcpmn2PYI596tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8119
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,address" on:

commit: 6b727c4363e9f98ba2473be67b1b369ea3bec764 ("misc: c2port: Calculate bin_attribute size through group callback")
https://git.kernel.org/cgit/linux/kernel/git/thomas.weissschuh/linux.git b4/sysfs-const-bin_attr-misc-drivers

in testcase: boot

config: i386-randconfig-052-20241216
compiler: gcc-11
test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+------------------------------------------------+------------+------------+
|                                                | c6b7c45fb4 | 6b727c4363 |
+------------------------------------------------+------------+------------+
| BUG:kernel_NULL_pointer_dereference,address    | 0          | 18         |
| Oops                                           | 0          | 18         |
| EIP:c2port_bin_attr_size                       | 0          | 18         |
| Kernel_panic-not_syncing:Fatal_exception       | 0          | 18         |
+------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202412172123.51ce950b-lkp@intel.com


[    8.459997][    T1] BUG: kernel NULL pointer dereference, address: 00000002
[    8.460915][    T1] #PF: supervisor read access in kernel mode
[    8.461649][    T1] #PF: error_code(0x0000) - not-present page
[    8.461772][    T1] *pdpt = 0000000000000000 *pde = f000ff53f000ff53
[    8.461772][    T1] Oops: Oops: 0000 [#1] SMP
[    8.461772][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G                T  6.13.0-rc2-00367-g6b727c4363e9-dirty #1 c98edbedbb6969f633ed5a9f353ab3662886b9bd
[    8.461772][    T1] Tainted: [T]=RANDSTRUCT
[    8.461772][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 8.461772][ T1] EIP: c2port_bin_attr_size (drivers/misc/c2port/core.c:883)
[ 8.461772][ T1] Code: 8b 45 f0 e8 b6 43 75 00 89 d8 e8 d9 fd ff ff 8d 65 f4 89 f8 5b 5e 5f 5d c3 55 89 e5 81 fa 00 70 41 83 75 12 8b 40 40 8b 50 28 <0f> b7 42 02 0f b7 12 0f af c2 eb 03 8b 42 14 5d c3 55 89 e5 53 85
All code
========
   0:	8b 45 f0             	mov    -0x10(%rbp),%eax
   3:	e8 b6 43 75 00       	call   0x7543be
   8:	89 d8                	mov    %ebx,%eax
   a:	e8 d9 fd ff ff       	call   0xfffffffffffffde8
   f:	8d 65 f4             	lea    -0xc(%rbp),%esp
  12:	89 f8                	mov    %edi,%eax
  14:	5b                   	pop    %rbx
  15:	5e                   	pop    %rsi
  16:	5f                   	pop    %rdi
  17:	5d                   	pop    %rbp
  18:	c3                   	ret
  19:	55                   	push   %rbp
  1a:	89 e5                	mov    %esp,%ebp
  1c:	81 fa 00 70 41 83    	cmp    $0x83417000,%edx
  22:	75 12                	jne    0x36
  24:	8b 40 40             	mov    0x40(%rax),%eax
  27:	8b 50 28             	mov    0x28(%rax),%edx
  2a:*	0f b7 42 02          	movzwl 0x2(%rdx),%eax		<-- trapping instruction
  2e:	0f b7 12             	movzwl (%rdx),%edx
  31:	0f af c2             	imul   %edx,%eax
  34:	eb 03                	jmp    0x39
  36:	8b 42 14             	mov    0x14(%rdx),%eax
  39:	5d                   	pop    %rbp
  3a:	c3                   	ret
  3b:	55                   	push   %rbp
  3c:	89 e5                	mov    %esp,%ebp
  3e:	53                   	push   %rbx
  3f:	85                   	.byte 0x85

Code starting with the faulting instruction
===========================================
   0:	0f b7 42 02          	movzwl 0x2(%rdx),%eax
   4:	0f b7 12             	movzwl (%rdx),%edx
   7:	0f af c2             	imul   %edx,%eax
   a:	eb 03                	jmp    0xf
   c:	8b 42 14             	mov    0x14(%rdx),%eax
   f:	5d                   	pop    %rbp
  10:	c3                   	ret
  11:	55                   	push   %rbp
  12:	89 e5                	mov    %esp,%ebp
  14:	53                   	push   %rbx
  15:	85                   	.byte 0x85
[    8.461772][    T1] EAX: 854ecd80 EBX: 00000000 ECX: 00000000 EDX: 00000000
[    8.461772][    T1] ESI: 83416fa8 EDI: 8197699b EBP: 801ffdb4 ESP: 801ffdb4
[    8.461772][    T1] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010246
[    8.461772][    T1] CR0: 80050033 CR2: 00000002 CR3: 037fa000 CR4: 000406b0
[    8.461772][    T1] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[    8.461772][    T1] DR6: fffe0ff0 DR7: 00000400
[    8.461772][    T1] Call Trace:
[ 8.461772][ T1] ? show_regs (arch/x86/kernel/dumpstack.c:478)
[ 8.461772][ T1] ? __die_body (arch/x86/kernel/dumpstack.c:421)
[ 8.461772][ T1] ? __die (arch/x86/kernel/dumpstack.c:435)
[ 8.461772][ T1] ? page_fault_oops (arch/x86/mm/fault.c:712)
[ 8.461772][ T1] ? kernelmode_fixup_or_oops+0x46/0x4e
[ 8.461772][ T1] ? __bad_area_nosemaphore+0x2b/0x1c6
[ 8.461772][ T1] ? __lock_release+0xb8/0x165
[ 8.461772][ T1] ? kernfs_activate (fs/kernfs/dir.c:1410)
[ 8.461772][ T1] ? bad_area_nosemaphore (arch/x86/mm/fault.c:835)
[ 8.461772][ T1] ? do_user_addr_fault (arch/x86/mm/fault.c:1280 (discriminator 1))
[ 8.461772][ T1] ? exc_page_fault (arch/x86/include/asm/irqflags.h:26 arch/x86/include/asm/irqflags.h:87 arch/x86/include/asm/irqflags.h:147 arch/x86/mm/fault.c:1489 arch/x86/mm/fault.c:1539)
[ 8.461772][ T1] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1494)
[ 8.461772][ T1] ? handle_exception (arch/x86/entry/entry_32.S:1055)
[ 8.461772][ T1] ? als_lux0_input_data_show (drivers/misc/c2port/core.c:879)
[ 8.461772][ T1] ? kernfs_path_from_node_locked (fs/kernfs/dir.c:178)
[ 8.461772][ T1] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1494)
[ 8.461772][ T1] ? c2port_bin_attr_size (drivers/misc/c2port/core.c:883)
[ 8.461772][ T1] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1494)
[ 8.461772][ T1] ? c2port_bin_attr_size (drivers/misc/c2port/core.c:883)
[ 8.461772][ T1] create_files (fs/sysfs/group.c:102)
[ 8.461772][ T1] internal_create_group (fs/sysfs/group.c:183)
[ 8.461772][ T1] internal_create_groups (fs/sysfs/group.c:224)
[ 8.461772][ T1] sysfs_create_groups (fs/sysfs/group.c:250)
[ 8.461772][ T1] device_add_attrs (drivers/base/core.c:2812 drivers/base/core.c:2876)
[ 8.461772][ T1] ? sysfs_do_create_link (fs/sysfs/symlink.c:80)
[ 8.461772][ T1] device_add (drivers/base/core.c:3619)
[ 8.461772][ T1] ? kfree_const (mm/util.c:44)
[ 8.461772][ T1] device_create_groups_vargs (drivers/base/core.c:4392)
[ 8.461772][ T1] device_create (drivers/base/core.c:4435)
[ 8.461772][ T1] c2port_device_register (drivers/misc/c2port/core.c:928)
[ 8.461772][ T1] duramar2150_c2port_init (drivers/misc/c2port/c2port-duramar2150.c:127)
[ 8.461772][ T1] ? c2port_init (drivers/misc/c2port/c2port-duramar2150.c:119)
[ 8.461772][ T1] do_one_initcall (init/main.c:1266)
[ 8.461772][ T1] do_initcalls (init/main.c:1327 init/main.c:1344)
[ 8.461772][ T1] ? irq_to_desc (kernel/irq/irqdesc.c:452)
[ 8.461772][ T1] kernel_init_freeable (init/main.c:1579)
[ 8.461772][ T1] ? rest_init (init/main.c:1458)
[ 8.461772][ T1] kernel_init (init/main.c:1468)
[ 8.461772][ T1] ret_from_fork (arch/x86/kernel/process.c:153)
[ 8.461772][ T1] ? rest_init (init/main.c:1458)
[ 8.461772][ T1] ret_from_fork_asm (arch/x86/entry/entry_32.S:737)
[ 8.461772][ T1] entry_INT80_32 (arch/x86/entry/entry_32.S:942)
[    8.461772][    T1] Modules linked in:
[    8.461772][    T1] CR2: 0000000000000002
[    8.461772][    T1] ---[ end trace 0000000000000000 ]---
[ 8.461772][ T1] EIP: c2port_bin_attr_size (drivers/misc/c2port/core.c:883)
[ 8.461772][ T1] Code: 8b 45 f0 e8 b6 43 75 00 89 d8 e8 d9 fd ff ff 8d 65 f4 89 f8 5b 5e 5f 5d c3 55 89 e5 81 fa 00 70 41 83 75 12 8b 40 40 8b 50 28 <0f> b7 42 02 0f b7 12 0f af c2 eb 03 8b 42 14 5d c3 55 89 e5 53 85
All code
========
   0:	8b 45 f0             	mov    -0x10(%rbp),%eax
   3:	e8 b6 43 75 00       	call   0x7543be
   8:	89 d8                	mov    %ebx,%eax
   a:	e8 d9 fd ff ff       	call   0xfffffffffffffde8
   f:	8d 65 f4             	lea    -0xc(%rbp),%esp
  12:	89 f8                	mov    %edi,%eax
  14:	5b                   	pop    %rbx
  15:	5e                   	pop    %rsi
  16:	5f                   	pop    %rdi
  17:	5d                   	pop    %rbp
  18:	c3                   	ret
  19:	55                   	push   %rbp
  1a:	89 e5                	mov    %esp,%ebp
  1c:	81 fa 00 70 41 83    	cmp    $0x83417000,%edx
  22:	75 12                	jne    0x36
  24:	8b 40 40             	mov    0x40(%rax),%eax
  27:	8b 50 28             	mov    0x28(%rax),%edx
  2a:*	0f b7 42 02          	movzwl 0x2(%rdx),%eax		<-- trapping instruction
  2e:	0f b7 12             	movzwl (%rdx),%edx
  31:	0f af c2             	imul   %edx,%eax
  34:	eb 03                	jmp    0x39
  36:	8b 42 14             	mov    0x14(%rdx),%eax
  39:	5d                   	pop    %rbp
  3a:	c3                   	ret
  3b:	55                   	push   %rbp
  3c:	89 e5                	mov    %esp,%ebp
  3e:	53                   	push   %rbx
  3f:	85                   	.byte 0x85

Code starting with the faulting instruction
===========================================
   0:	0f b7 42 02          	movzwl 0x2(%rdx),%eax
   4:	0f b7 12             	movzwl (%rdx),%edx
   7:	0f af c2             	imul   %edx,%eax
   a:	eb 03                	jmp    0xf
   c:	8b 42 14             	mov    0x14(%rdx),%eax
   f:	5d                   	pop    %rbp
  10:	c3                   	ret
  11:	55                   	push   %rbp
  12:	89 e5                	mov    %esp,%ebp
  14:	53                   	push   %rbx
  15:	85                   	.byte 0x85


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241217/202412172123.51ce950b-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

