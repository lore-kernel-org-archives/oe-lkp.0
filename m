Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34034687
	for <oe-lkp@lists.linux.dev>; Fri, 26 Apr 2024 02:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714099648; cv=fail; b=NozszzyU4XtGqYJXsRKiKbxOuTglu52qJ+6Hd8+kUuFMCV/cdU36A3f/kv3wLIIH32FOlhs9/HdrLRaeLzEbrdrlNnXjWH5uaw/PFm8Qh2Deyk+/77FfJsf6b2ev6BaGNWp2xB38++/tW1IGN0oEhKHIp7ITGaXviM9ytkiVWYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714099648; c=relaxed/simple;
	bh=LF4PP+eAQOvk6QDn3lGkPbeAUtEYd+lyibBqzgGqztA=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=FKpdPq/5Aa58svMbJMCDI4xGCQYddqN7Vwnwz71Hbt6PqaMixHwVvRnPebNpWpqEgwp9DS7COXT7knIRR+kNwTWt9gJr99QJQtZLkdzsd7LewZyg5usrsBtFViHmP/U77OkpHBMLB3N1i2cbX2J5wNnmfjzr6+5i4cHcTAtccyg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lz6+6Guq; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lz6+6Guq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714099644; x=1745635644;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=LF4PP+eAQOvk6QDn3lGkPbeAUtEYd+lyibBqzgGqztA=;
  b=lz6+6GuqCbwIQ1DeKHy/msZN/m8DFK1PP7meQwTSBM4QZMCUMgOmajvj
   7jKF5D1FECfTgnciG8R82va5dJwnTNuMKPsxNDWWrQIDIlDA9QJ83e9So
   RzRif/cqvCxfQ6AlgP4VamSZlFxYbdfjsQJt54dYIsRv/LgtaRSlWKXIz
   QHh+lTtVyc+Nu2hjy5lO29L4kNo9Cf79x6XJyGu10Ypc2Ldqje2cjEy5/
   fUy2II22HOJJdmMl4c891ReeqbocbRLmA8jmflxgPZBI4ZDaJuSZMedE2
   mZkAOSsipIN+JNErFoMInLdfLqIysV86fKmhC0bvvUo/qaYaBiAQucbBo
   A==;
X-CSE-ConnectionGUID: wnUHeVTiTeuLtvNEH3+pYw==
X-CSE-MsgGUID: wLet6OTKRvW9CpmBUGtvkQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9752448"
X-IronPort-AV: E=Sophos;i="6.07,231,1708416000"; 
   d="scan'208";a="9752448"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 19:47:23 -0700
X-CSE-ConnectionGUID: CF9LUyInST+HrX77k2jbKA==
X-CSE-MsgGUID: f9j9AJ1dQlmAy2AHydE2rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,231,1708416000"; 
   d="scan'208";a="29941204"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 25 Apr 2024 19:47:22 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Apr 2024 19:47:22 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 25 Apr 2024 19:47:22 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 25 Apr 2024 19:47:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MQ8OGHmMqhKmlplMVp9AhQi6eOIiSYMK3YQvDojKbYjKrO52vX1i2uXErOD6vBVvQmLvhbH7MvXN586uPnbc96IioV0G9lG3+oq3dV8PdDJV/NA0NG1gOymh6qnYG0yURXXqsDnWaIWGxH5IsZumiu7JBuKFtsOayFRdfaG9cMHyRGKpg7qZCxLw639EfJ+c2nPiZdXZxbIgUavE/xEHxwB3piYh8RiFdsXglDocVjsHBvyIfvNkxPNFVjt8NHnIi1kAM/qSdRq+59pwLOMBsyS/yE8nD/Frj2A0V3UrnUDzlIGGhvDqL7TqW1R8CM9XQi25IoKKKIRtylBdnn7lDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qnGbnr7AQlrL4nkIJv6KPmhOJKgWcBse6LeBPa5860s=;
 b=XKNJxfZsCsIGGFKskO53JuxfEgBBjM0u5LDsr3cZ5p3YNyb5cddx4N2T396cWtoouulvVwumc9ctrpeiLfjzaBdar/OmYtmjardtOAhfhQuINrBSSo03FK0yjego/JD7x3VqQLFF0afllmqAn6IslOcxZZ/lHet+/aqBVfWH6lJUXXAJOSEd6nx4RTHFfp4ceREAAaHNDDs/2AB0ftYRJ1QUILXdMoJ7InyAwUsC9jeVgigLZFTifgVvE12nRb0XtJu7ZPmk8IyPvnvKoZCMHFTVn7gLV5TuBf/iKsrVZmOgugLVHcL/0FQzxu5ZgZtGUEEnJpw/pQa4XUIosZNu/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CY5PR11MB6512.namprd11.prod.outlook.com (2603:10b6:930:40::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.24; Fri, 26 Apr
 2024 02:47:11 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::58dd:99ca:74a6:2e3e%3]) with mapi id 15.20.7519.021; Fri, 26 Apr 2024
 02:47:11 +0000
Date: Fri, 26 Apr 2024 10:47:04 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Matthew Wilcox <willy@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [willy-pagecache:vma-lock] [mm]  06d7da17eb:
 vm-scalability.throughput 226.9% improvement
Message-ID: <202404261055.c5e24608-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::18) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CY5PR11MB6512:EE_
X-MS-Office365-Filtering-Correlation-Id: d35dc999-113d-48fa-7d6e-08dc659b2be6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?2QoFvzgKmn5l3ktgvNeZkH+jE20X5G9mmjKXQ09quMI45zPv3w7ciEIF5Q?=
 =?iso-8859-1?Q?PufK40kwDdcYboqwa8RPS434SnbZD0vYOhNUolP38d4LVe1PeN/nlWBdC4?=
 =?iso-8859-1?Q?UBwJnPtfh2wYod8wHpcXKOr5Jv409aq2zaTRYAN4vLdRpwhcus2+moX5N/?=
 =?iso-8859-1?Q?/spcH+2OzUC+F5KrHSB1dlcFafwL3Tucoj5kKhghcrHxpI0xzKTy665qyN?=
 =?iso-8859-1?Q?mA3gFkvqxKl8Wl7kwolCAAvGETFaXu7cB2w9at/NFya4tjvUD+ena4byKX?=
 =?iso-8859-1?Q?dR7QdwGw76L2hqFQCzwGeBTwO/svS69kDbDS/nDBR6SWwuqrQVxsi7pV0I?=
 =?iso-8859-1?Q?BMwZfWVlb+K5YuRqt05xbusR9U4lW7DRWGGO9N1aVHU8Nnr8M391ASDIWl?=
 =?iso-8859-1?Q?INiNhbkCwLjJG2eiG3O9vXjXxTOnf6b9C/nFCmOLkSX8YDE5uTKvZF6Tta?=
 =?iso-8859-1?Q?6TSCndPVMJ3v9qyvbDyZZbKqXfzVAaXHqKoxbP5QvOIRXI0Ntx4HkvYYT+?=
 =?iso-8859-1?Q?3lK1jfWQ1jkeqeE2sfaj7u6+woDQwGseW/ZlkzDEl6xqb3A61oTszX7uFb?=
 =?iso-8859-1?Q?GNVa72uCDijynOPs8FMEMa2iVUiVYjShF1i3uAOvbluMBqE8PosRAalTWn?=
 =?iso-8859-1?Q?kXKY8+w1EZm62hveShinU6SwTzmilhzzQSJbTRpbDYkAKP023xbY5pFo/b?=
 =?iso-8859-1?Q?ZcyalZCvGznD0xWI/EYZxVM3zem+o7bilkvLctMGHOXHCIiWpNaGknHQ5Y?=
 =?iso-8859-1?Q?9f5vcKCIf34pDuTbNnegpHSypoj3JdAVNiA/L/RQuEGwkarLCVfNK2x3YK?=
 =?iso-8859-1?Q?PAF8qQj47nirWZjjVeZqjGHcWlsGPIh7z3JlW6FPzdwV8uZNJavUdJDqtA?=
 =?iso-8859-1?Q?tnaC/WqspvZq2YuSd58xq9C7QRakFyMUX5efG/J72dQvJeIFmZmLsCHs0q?=
 =?iso-8859-1?Q?fO8QnT9cA5o3ak4Upjnrt23EPZloTiT3zp3ekxiMlb6R7LJ+ezyWyjsVtD?=
 =?iso-8859-1?Q?2irrf2Qu8gKczY0xSWHb071bi7b73FfZXICrOBC4nzRJKfbQFT2r9lyL4B?=
 =?iso-8859-1?Q?0d/9iAEm215jFCm7L+N5AYFGhP/f8RoB0yhkama98FKsiQL1R9cKdFUO3e?=
 =?iso-8859-1?Q?d4fe/Qdq+91Ckp8gPEFlYLnUwuiuG8DXMQsI7fFQ2QGgBZgJJoyOUyfDcw?=
 =?iso-8859-1?Q?HMvvEHEzzNHRtQONeSjzzl8+/u64t1aX9q6s2YI2xTwqVGCod41zyRbUWU?=
 =?iso-8859-1?Q?PnDoPEToy0tEQvbSH/kV7SYbWQoGax9slz5WNp8s4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?MeTPJyskrRlc0i4UdThliQ/iZMFENVlC0lNtjH0Z4RCoQHI9GRtqBJjiRK?=
 =?iso-8859-1?Q?pkQdAIGDL7a27bF6XXKHXh6/5V99sOkSfyLDpitNNfYVjDBB4Sm0wwFBz3?=
 =?iso-8859-1?Q?Mr9L0Xrdlk57CwGTCSPeluo/7R1Hn0mvd3IEZ4GrOb9LQNz9i3P4iIshUv?=
 =?iso-8859-1?Q?GyOyBsKpIbcPtJThbyr/1+DCYErMzM/3EANu/dJ7wY+Pe3f4IFSnaLJdXE?=
 =?iso-8859-1?Q?Fc/Qtt6mx6FBbMKD+X0ggFOW5TioVvcuwlCzxqK3mZ7ybc+THE2XNgjzkA?=
 =?iso-8859-1?Q?4waFViPRVK1FcUO0Z8P54PJfvM/DNKAmI5USaObtnwlBIVZMFE27yVo1IQ?=
 =?iso-8859-1?Q?tI3VrWYzuirhowVXelefUpPbusDcUuldCrNx03akJSjUI2JeA/mQH1q7zW?=
 =?iso-8859-1?Q?LRzSnTk7kkcupYXuPtLIwtxLZzbsw9aaz+VrBTDkkWOyx9nAKACDZoYAMQ?=
 =?iso-8859-1?Q?1lyuCGsPMiOyy86rgB26G7TdfPVikiF8L/oM3ss6gJzRalaJqXnZt4u40/?=
 =?iso-8859-1?Q?DOodGcxm8HknCgbObFwqKqh91F4gcrxsS9txwxhsryMseHc72G1FhAjc6m?=
 =?iso-8859-1?Q?DA9wL6wr6g4cN2fj2KKbn0+lmtLfhzm0E2Wd27dzpiVLMaivKddlOcU7fz?=
 =?iso-8859-1?Q?MRnQkibHhqOGd4h5AAuruf6p0d5praJHx7kUAsjQ/E1HQStc8T+4SIj2A/?=
 =?iso-8859-1?Q?nHbKhsXBADyl/ni8d62b4XMyn0WuE9cpAfoZ7J9A2SJCYrWfTsIqfRsJ0Y?=
 =?iso-8859-1?Q?1O96vkhoI5e8JtBBKb2gE8Zi/Iy1HzN4j6t46hIs/vDGYIAqheIEtbObAE?=
 =?iso-8859-1?Q?Zvh2cm7FMSlT+vVwwoIelKLB5rkRXI2pKvBL7JpkT7Ho5WLNrz++vbVgEz?=
 =?iso-8859-1?Q?hqsm32HU2nXcmkEbQIYzjIm85VZe7T3WoZ4u56pD2HgXX62rxnXb0pUS5D?=
 =?iso-8859-1?Q?upS/05A5KRkztWCeMZd4em/kmFR/YimeFz0wjaZJm1uwYO9Y7bOWYtizYj?=
 =?iso-8859-1?Q?YOwiElHbjQiLvao+XZrGff0CR1HQCTSEKlQPFbiI0dM7oEBP1fr6gdSRgl?=
 =?iso-8859-1?Q?SEJYV7EGe9xaUnJRiWEUhyHHj1aOm31o77E4Zib38vMbnXto2779B+cuHp?=
 =?iso-8859-1?Q?G/m0UuII0062LpeyQLewbqMlkxU5x23Zu6CB7sOHmyXQPK3Ecq2SUfecRo?=
 =?iso-8859-1?Q?HSuQ15P/FqM4rjL583bt1mnU+UpIHGS1Rd6P7RGpPTeWNvPmGYbpG8Iify?=
 =?iso-8859-1?Q?ImDny/ZvF8ibUspzD2fAI6fQpCbiu4gEkBkv6HwD8UejOX0kD34lH25H3j?=
 =?iso-8859-1?Q?M21FxCvehN/bFuk2upvjEHRFXTUhxilZ37VSHRq60An1anDi0Xa2nGwEf9?=
 =?iso-8859-1?Q?Ymurx8OyDGUe/wknrI3jT/xd51BWL+oH7iRd00IUCZyuEFjhaginR6HLLc?=
 =?iso-8859-1?Q?TDmxc9Jnjh2wnCzpZ2EnC78AqCvMkII2FVgfX6fCpVnlTM5pPrvl8LS9si?=
 =?iso-8859-1?Q?SK+SijIp9IR15Ft7xR4rFA0Kw1l3nTpnnlam+kffNdAUMD3FNbW5ntXY4+?=
 =?iso-8859-1?Q?m1PaYIOfvSJt14lDnh+sGXlQ6kCvwwjjFqn/RYmfr3SH/ZfmWZh4gtXJAu?=
 =?iso-8859-1?Q?zjm4KxnXS7veRjdW48ausCqHN/EUFiTSrSu6LdK7QbzB/9IgRc3QBA0Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d35dc999-113d-48fa-7d6e-08dc659b2be6
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 02:47:11.4510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dP5yct/4tf9uZ4gmMuJQt8pBtQCr8Jq3M8in7evjotK9uxdm6N5O6qzSAc/ZdE0Qol5rRdOLCZT/Mx4BF1S+7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6512
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 226.9% improvement of vm-scalability.throughput on:


commit: 06d7da17eb40ba4d1b68f894ee16a8df78a4442f ("mm: Delay the check for a NULL anon_vma")
git://git.infradead.org/users/willy/pagecache vma-lock

testcase: vm-scalability
test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 512G memory
parameters:

	runtime: 300s
	test: small-allocs-mt
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+-------------------------------------------------------------------------------------------+
| testcase: change | vm-scalability: vm-scalability.throughput 208.9% improvement                              |
| test machine     | 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory |
| test parameters  | cpufreq_governor=performance                                                              |
|                  | runtime=300s                                                                              |
|                  | test=small-allocs-mt                                                                      |
+------------------+-------------------------------------------------------------------------------------------+




Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240426/202404261055.c5e24608-oliver.sang@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/rootfs/runtime/tbox_group/test/testcase:
  gcc-13/performance/x86_64-rhel-8.3/debian-12-x86_64-20240206.cgz/300s/lkp-spr-2sp4/small-allocs-mt/vm-scalability

commit: 
  b6adf494d7 ("mm: Assert the mmap_lock is held in __anon_vma_prepare()")
  06d7da17eb ("mm: Delay the check for a NULL anon_vma")

b6adf494d78314b6 06d7da17eb40ba4d1b68f894ee1 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     74523           -67.2%      24454        uptime.idle
  6.34e+10           -78.8%  1.342e+10        cpuidle..time
 1.701e+08           -89.6%   17747986 ±  2%  cpuidle..usage
    906035 ±  5%     +90.8%    1728983 ±  7%  numa-numastat.node0.local_node
   1046067 ±  4%     +77.3%    1854474 ±  3%  numa-numastat.node0.numa_hit
   1311558 ±  3%     +59.1%    2086157 ±  6%  numa-numastat.node1.local_node
   1410254 ±  2%     +55.5%    2192628 ±  2%  numa-numastat.node1.numa_hit
      6425 ±  4%     -16.7%       5355 ±  3%  perf-c2c.DRAM.remote
      7051 ±  3%     -25.8%       5231 ±  3%  perf-c2c.HITM.local
      4511 ±  4%     -34.8%       2940 ±  2%  perf-c2c.HITM.remote
     11563 ±  3%     -29.3%       8172 ±  3%  perf-c2c.HITM.total
     90.71           -80.4%      17.78        vmstat.cpu.id
      8.99 ±  3%    +805.0%      81.38        vmstat.cpu.sy
     19.84 ± 10%    +824.7%     183.50        vmstat.procs.r
    698619           -87.6%      86741 ±  2%  vmstat.system.cs
    227194            +6.3%     241573        vmstat.system.in
     90.65           -73.4       17.27        mpstat.cpu.all.idle%
      0.20 ±  5%      +0.3        0.50 ±  2%  mpstat.cpu.all.irq%
      0.08            -0.0        0.07        mpstat.cpu.all.soft%
      8.77 ±  3%     +72.6       81.33        mpstat.cpu.all.sys%
      0.31            +0.5        0.83        mpstat.cpu.all.usr%
    215.33 ± 12%     -38.0%     133.50 ± 34%  mpstat.max_utilization.seconds
     11.08 ±  2%    +772.7%      96.67        mpstat.max_utilization_pct
    907614           -12.3%     795617        meminfo.Active
    907482           -12.3%     795486        meminfo.Active(anon)
    130738 ±  4%     +12.4%     147011 ±  5%  meminfo.Mapped
   9309220           +55.5%   14472405        meminfo.Memused
    498476          +223.2%    1611222        meminfo.PageTables
   2111517          +192.8%    6182069        meminfo.SUnreclaim
   2263824          +179.8%    6333898        meminfo.Slab
   9568677           +57.6%   15076828        meminfo.max_used_kB
    248208          +225.0%     806656        numa-meminfo.node0.PageTables
   1034116          +199.6%    3098428        numa-meminfo.node0.SUnreclaim
   1125682          +183.8%    3194597        numa-meminfo.node0.Slab
    863270 ±  8%     -18.1%     706715 ±  3%  numa-meminfo.node1.Active
    863210 ±  8%     -18.1%     706649 ±  3%  numa-meminfo.node1.Active(anon)
    249620          +222.9%     805984        numa-meminfo.node1.PageTables
   1076184          +186.6%    3084567        numa-meminfo.node1.SUnreclaim
   1136926          +176.2%    3140231        numa-meminfo.node1.Slab
     62102          +224.4%     201448        numa-vmstat.node0.nr_page_table_pages
    258627          +199.5%     774500        numa-vmstat.node0.nr_slab_unreclaimable
   1045168 ±  4%     +77.4%    1854224 ±  3%  numa-vmstat.node0.numa_hit
    905137 ±  5%     +91.0%    1728733 ±  7%  numa-vmstat.node0.numa_local
    215659 ±  8%     -17.9%     176972 ±  3%  numa-vmstat.node1.nr_active_anon
     62453          +222.3%     201271        numa-vmstat.node1.nr_page_table_pages
    269139          +186.5%     771014        numa-vmstat.node1.nr_slab_unreclaimable
    215659 ±  8%     -17.9%     176972 ±  3%  numa-vmstat.node1.nr_zone_active_anon
   1409093 ±  2%     +55.5%    2191166 ±  2%  numa-vmstat.node1.numa_hit
   1310396 ±  3%     +59.1%    2084707 ±  6%  numa-vmstat.node1.numa_local
      8530          +226.9%      27887        vm-scalability.median
   1910909          +226.9%    6246734        vm-scalability.throughput
    314.36            +9.6%     344.62        vm-scalability.time.elapsed_time
    314.36            +9.6%     344.62        vm-scalability.time.elapsed_time.max
    663.67 ±  5%   +7551.9%      50783        vm-scalability.time.involuntary_context_switches
 1.276e+08          +226.9%  4.172e+08        vm-scalability.time.minor_page_faults
      2140 ±  2%    +761.1%      18433        vm-scalability.time.percent_of_cpu_this_job_got
      6569 ±  2%    +858.6%      62975        vm-scalability.time.system_time
    161.49          +242.2%     552.58        vm-scalability.time.user_time
 1.105e+08           -86.7%   14697764 ±  2%  vm-scalability.time.voluntary_context_switches
 5.743e+08          +226.9%  1.877e+09        vm-scalability.workload
    226935           -12.3%     198989        proc-vmstat.nr_active_anon
  12879162            -1.0%   12750211        proc-vmstat.nr_dirty_background_threshold
  25789814            -1.0%   25531597        proc-vmstat.nr_dirty_threshold
   1074059            -1.7%    1055610        proc-vmstat.nr_file_pages
 1.295e+08            -1.0%  1.282e+08        proc-vmstat.nr_free_pages
    243814            +4.6%     255031        proc-vmstat.nr_inactive_anon
     33032 ±  4%     +11.1%      36709 ±  5%  proc-vmstat.nr_mapped
    124572          +223.7%     403234        proc-vmstat.nr_page_table_pages
    308933            -6.0%     290477        proc-vmstat.nr_shmem
    527641          +192.9%    1545582        proc-vmstat.nr_slab_unreclaimable
    226935           -12.3%     198989        proc-vmstat.nr_zone_active_anon
    243814            +4.6%     255031        proc-vmstat.nr_zone_inactive_anon
     82731 ± 16%     -65.0%      28974 ± 47%  proc-vmstat.numa_hint_faults
     50675 ± 24%     -59.5%      20504 ± 45%  proc-vmstat.numa_hint_faults_local
   2458414           +64.7%    4049539        proc-vmstat.numa_hit
   2219686           +72.0%    3817577        proc-vmstat.numa_local
    485406 ±  2%     -49.9%     243333 ± 30%  proc-vmstat.numa_pte_updates
    290930            +3.3%     300617        proc-vmstat.pgactivate
   3016705           +84.0%    5551173        proc-vmstat.pgalloc_normal
 1.291e+08          +224.2%  4.186e+08        proc-vmstat.pgfault
   2592277 ±  2%     +95.8%    5075265        proc-vmstat.pgfree
      1.07           -11.4%       0.95        perf-stat.i.MPKI
 4.303e+09          +611.1%   3.06e+10        perf-stat.i.branch-instructions
      0.43            -0.3        0.15        perf-stat.i.branch-miss-rate%
  19064779           -29.7%   13393929        perf-stat.i.branch-misses
     30.45            +7.7       38.18        perf-stat.i.cache-miss-rate%
  15794717           +17.1%   18496465        perf-stat.i.cache-misses
    706504           -88.1%      84094 ±  2%  perf-stat.i.context-switches
      4.09 ±  2%     -19.8%       3.28        perf-stat.i.cpi
 6.907e+10 ±  2%    +645.0%  5.145e+11        perf-stat.i.cpu-cycles
      1955           -76.9%     451.18        perf-stat.i.cpu-migrations
      4450 ±  2%    +512.0%      27236        perf-stat.i.cycles-between-cache-misses
  1.67e+10          +751.2%  1.422e+11        perf-stat.i.instructions
      0.27 ±  2%     +39.1%       0.37        perf-stat.i.ipc
      0.03 ± 37%    +142.9%       0.08 ± 31%  perf-stat.i.major-faults
      6.82           +51.2%      10.31        perf-stat.i.metric.K/sec
    411063          +181.7%    1158109        perf-stat.i.minor-faults
    411063          +181.7%    1158110        perf-stat.i.page-faults
      0.95           -86.8%       0.12        perf-stat.overall.MPKI
      0.44            -0.4        0.04        perf-stat.overall.branch-miss-rate%
     29.03            +3.9       32.95        perf-stat.overall.cache-miss-rate%
      4.13 ±  2%     -12.3%       3.62        perf-stat.overall.cpi
      4366 ±  2%    +565.6%      29061        perf-stat.overall.cycles-between-cache-misses
      0.24 ±  2%     +14.0%       0.28        perf-stat.overall.ipc
      9135          +199.3%      27347        perf-stat.overall.path-length
 4.285e+09          +646.7%  3.199e+10        perf-stat.ps.branch-instructions
  19006353           -29.6%   13372254        perf-stat.ps.branch-misses
  15744973           +17.7%   18532137        perf-stat.ps.cache-misses
  54240830            +3.7%   56254046        perf-stat.ps.cache-references
    703147           -87.6%      87147 ±  2%  perf-stat.ps.context-switches
 6.875e+10 ±  2%    +683.3%  5.385e+11        perf-stat.ps.cpu-cycles
      1948           -76.5%     457.14        perf-stat.ps.cpu-migrations
 1.663e+10          +793.4%  1.486e+11        perf-stat.ps.instructions
      0.03 ± 37%    +126.8%       0.08 ± 32%  perf-stat.ps.major-faults
    409108          +196.1%    1211563        perf-stat.ps.minor-faults
    409108          +196.1%    1211564        perf-stat.ps.page-faults
 5.247e+12          +878.5%  5.134e+13        perf-stat.total.instructions
    335413 ±  5%   +9958.6%   33737897        sched_debug.cfs_rq:/.avg_vruntime.avg
    495046 ±  8%   +6770.8%   34013537        sched_debug.cfs_rq:/.avg_vruntime.max
    317459 ±  5%   +9262.1%   29720916        sched_debug.cfs_rq:/.avg_vruntime.min
     18070 ±  5%   +1726.6%     330082 ±  7%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      0.10 ± 11%    +721.6%       0.79 ±  2%  sched_debug.cfs_rq:/.h_nr_running.avg
      1.00           +69.4%       1.69 ±  8%  sched_debug.cfs_rq:/.h_nr_running.max
      0.29 ±  4%     -15.4%       0.25 ± 10%  sched_debug.cfs_rq:/.h_nr_running.stddev
      6.88 ± 15%    +122.1%      15.28 ± 87%  sched_debug.cfs_rq:/.load_avg.avg
    335413 ±  5%   +9958.6%   33737897        sched_debug.cfs_rq:/.min_vruntime.avg
    495046 ±  8%   +6770.8%   34013538        sched_debug.cfs_rq:/.min_vruntime.max
    317459 ±  5%   +9262.1%   29720916        sched_debug.cfs_rq:/.min_vruntime.min
     18070 ±  5%   +1726.6%     330082 ±  7%  sched_debug.cfs_rq:/.min_vruntime.stddev
      0.10 ± 11%    +714.0%       0.79        sched_debug.cfs_rq:/.nr_running.avg
      0.29 ±  4%     -21.1%       0.23 ± 13%  sched_debug.cfs_rq:/.nr_running.stddev
    103.95 ±  3%    +679.9%     810.70        sched_debug.cfs_rq:/.runnable_avg.avg
    764.53 ±  5%    +122.0%       1697 ±  3%  sched_debug.cfs_rq:/.runnable_avg.max
      7.25 ±147%   +2188.5%     165.92 ± 29%  sched_debug.cfs_rq:/.runnable_avg.min
     73.92 ±  3%    +104.3%     150.99 ±  6%  sched_debug.cfs_rq:/.runnable_avg.stddev
    103.68 ±  3%    +676.5%     805.15        sched_debug.cfs_rq:/.util_avg.avg
    764.39 ±  5%    +106.4%       1577 ±  6%  sched_debug.cfs_rq:/.util_avg.max
      7.25 ±147%   +1892.0%     144.42 ± 32%  sched_debug.cfs_rq:/.util_avg.min
     73.79 ±  3%     +95.2%     144.07 ±  7%  sched_debug.cfs_rq:/.util_avg.stddev
      9.64 ± 11%   +7825.0%     764.08        sched_debug.cfs_rq:/.util_est.avg
    234.92 ±  7%    +509.0%       1430 ± 10%  sched_debug.cfs_rq:/.util_est.max
     35.12 ±  4%    +513.4%     215.42 ± 12%  sched_debug.cfs_rq:/.util_est.stddev
    594748           +41.9%     843772        sched_debug.cpu.avg_idle.avg
    905212 ±  5%     +18.9%    1075937 ±  7%  sched_debug.cpu.avg_idle.max
    118694 ± 12%     -96.5%       4212        sched_debug.cpu.avg_idle.min
     79158 ±  5%    +284.1%     304031 ±  3%  sched_debug.cpu.avg_idle.stddev
     13.69           +19.0%      16.30 ±  8%  sched_debug.cpu.clock.stddev
    636.82 ±  8%    +752.2%       5426        sched_debug.cpu.curr->pid.avg
     10191           -10.4%       9134 ±  7%  sched_debug.cpu.curr->pid.max
      1943 ±  3%     -23.1%       1493 ± 13%  sched_debug.cpu.curr->pid.stddev
      0.00 ±  6%    +164.5%       0.00 ± 40%  sched_debug.cpu.next_balance.stddev
      0.09 ±  8%    +749.5%       0.79        sched_debug.cpu.nr_running.avg
      1.00           +69.4%       1.69 ±  8%  sched_debug.cpu.nr_running.max
      0.29 ±  3%     -14.6%       0.24 ± 10%  sched_debug.cpu.nr_running.stddev
    488871           -86.4%      66243 ±  2%  sched_debug.cpu.nr_switches.avg
    508846           -59.9%     203810 ± 11%  sched_debug.cpu.nr_switches.max
    447153           -90.9%      40770 ±  5%  sched_debug.cpu.nr_switches.min
      6511 ± 12%    +166.2%      17331 ±  4%  sched_debug.cpu.nr_switches.stddev
      0.75           -92.1%       0.06 ± 26%  sched_debug.cpu.nr_uninterruptible.avg
     40.86 ±  9%    +370.0%     192.03 ± 22%  sched_debug.cpu.nr_uninterruptible.max
    -15.06          +324.4%     -63.89        sched_debug.cpu.nr_uninterruptible.min
      6.99 ±  7%    +336.4%      30.50 ±  6%  sched_debug.cpu.nr_uninterruptible.stddev
      0.00 ±101%  +2.8e+05%       0.36 ± 51%  sched_debug.rt_rq:.rt_time.avg
      0.03 ±101%  +2.8e+05%      81.08 ± 51%  sched_debug.rt_rq:.rt_time.max
      0.00 ±101%  +2.8e+05%       5.41 ± 51%  sched_debug.rt_rq:.rt_time.stddev
     74.54           -73.7        0.87        perf-profile.calltrace.cycles-pp.do_access
     72.57           -72.6        0.00        perf-profile.calltrace.cycles-pp.exc_page_fault.asm_exc_page_fault.do_access
     73.28           -72.6        0.70        perf-profile.calltrace.cycles-pp.asm_exc_page_fault.do_access
     72.55           -72.5        0.00        perf-profile.calltrace.cycles-pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.do_access
     69.93           -69.9        0.00        perf-profile.calltrace.cycles-pp.lock_mm_and_find_vma.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.do_access
     69.12           -69.1        0.00        perf-profile.calltrace.cycles-pp.down_read_killable.lock_mm_and_find_vma.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
     68.78           -68.8        0.00        perf-profile.calltrace.cycles-pp.rwsem_down_read_slowpath.down_read_killable.lock_mm_and_find_vma.do_user_addr_fault.exc_page_fault
     65.78           -65.8        0.00        perf-profile.calltrace.cycles-pp._raw_spin_lock_irq.rwsem_down_read_slowpath.down_read_killable.lock_mm_and_find_vma.do_user_addr_fault
     65.43           -65.4        0.00        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.rwsem_down_read_slowpath.down_read_killable.lock_mm_and_find_vma
     13.67           -13.7        0.00        perf-profile.calltrace.cycles-pp.__mmap
     13.56           -13.6        0.00        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__mmap
     13.56           -13.6        0.00        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__mmap
     13.54           -13.5        0.00        perf-profile.calltrace.cycles-pp.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe.__mmap
     13.50           -13.5        0.00        perf-profile.calltrace.cycles-pp.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe.__mmap
     10.72 ±  3%     -10.7        0.00        perf-profile.calltrace.cycles-pp.common_startup_64
     10.68 ±  3%     -10.7        0.00        perf-profile.calltrace.cycles-pp.start_secondary.common_startup_64
     10.67 ±  3%     -10.7        0.00        perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.common_startup_64
     10.66 ±  3%     -10.7        0.00        perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      7.96 ±  4%      -8.0        0.00        perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      7.38 ±  4%      -7.4        0.00        perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
      7.20 ±  4%      -7.2        0.00        perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
      7.15 ±  3%      -7.2        0.00        perf-profile.calltrace.cycles-pp._raw_spin_lock_irq.rwsem_down_write_slowpath.down_write_killable.vm_mmap_pgoff.ksys_mmap_pgoff
      7.05 ±  3%      -7.0        0.00        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.rwsem_down_write_slowpath.down_write_killable.vm_mmap_pgoff
      1.04 ±  3%      -0.5        0.53        perf-profile.calltrace.cycles-pp.do_rw_once
      0.00            +0.6        0.56 ±  5%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.osq_lock
      0.00            +0.6        0.57 ±  5%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.osq_lock.rwsem_optimistic_spin
      0.00            +0.6        0.64 ±  4%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.osq_lock.rwsem_optimistic_spin.rwsem_down_write_slowpath
      0.00            +0.7        0.66 ±  5%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.osq_lock.rwsem_optimistic_spin.rwsem_down_write_slowpath.down_write_killable
     11.22           +86.5       97.68        perf-profile.calltrace.cycles-pp.down_write_killable.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
     11.14           +86.5       97.66        perf-profile.calltrace.cycles-pp.rwsem_down_write_slowpath.down_write_killable.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64
      3.17 ±  2%     +94.0       97.12        perf-profile.calltrace.cycles-pp.osq_lock.rwsem_optimistic_spin.rwsem_down_write_slowpath.down_write_killable.vm_mmap_pgoff
      3.45 ±  2%     +94.1       97.59        perf-profile.calltrace.cycles-pp.rwsem_optimistic_spin.rwsem_down_write_slowpath.down_write_killable.vm_mmap_pgoff.ksys_mmap_pgoff
      0.00           +98.2       98.15        perf-profile.calltrace.cycles-pp.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00           +98.2       98.16        perf-profile.calltrace.cycles-pp.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00           +98.2       98.17        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00           +98.2       98.17        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
     74.52           -73.4        1.12        perf-profile.children.cycles-pp.do_access
     72.96           -73.0        0.00        perf-profile.children.cycles-pp._raw_spin_lock_irq
     73.39           -72.7        0.74        perf-profile.children.cycles-pp.asm_exc_page_fault
     72.63           -72.6        0.06 ±  6%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
     72.58           -72.1        0.49        perf-profile.children.cycles-pp.exc_page_fault
     72.57           -72.1        0.49        perf-profile.children.cycles-pp.do_user_addr_fault
     69.93           -69.9        0.00        perf-profile.children.cycles-pp.lock_mm_and_find_vma
     69.12           -69.1        0.00        perf-profile.children.cycles-pp.down_read_killable
     68.81           -68.8        0.00        perf-profile.children.cycles-pp.rwsem_down_read_slowpath
     13.67           -13.7        0.00        perf-profile.children.cycles-pp.__mmap
     10.72 ±  3%     -10.6        0.12 ±  3%  perf-profile.children.cycles-pp.common_startup_64
     10.72 ±  3%     -10.6        0.12 ±  3%  perf-profile.children.cycles-pp.cpu_startup_entry
     10.72 ±  3%     -10.6        0.12 ±  3%  perf-profile.children.cycles-pp.do_idle
     10.68 ±  3%     -10.6        0.12 ±  3%  perf-profile.children.cycles-pp.start_secondary
      8.00 ±  4%      -7.9        0.08 ±  4%  perf-profile.children.cycles-pp.cpuidle_idle_call
      7.42 ±  4%      -7.3        0.08        perf-profile.children.cycles-pp.cpuidle_enter
      7.41 ±  4%      -7.3        0.08        perf-profile.children.cycles-pp.cpuidle_enter_state
      3.11 ±  3%      -3.0        0.07        perf-profile.children.cycles-pp.__schedule
      2.91 ±  9%      -2.2        0.72 ±  4%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      2.69 ± 10%      -2.0        0.69 ±  4%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      1.91 ±  3%      -1.9        0.05 ±  8%  perf-profile.children.cycles-pp.schedule
      1.39 ±  3%      -1.3        0.09        perf-profile.children.cycles-pp.up_write
      1.61 ±  3%      -0.9        0.72        perf-profile.children.cycles-pp.do_rw_once
      1.49 ± 19%      -0.9        0.60 ±  4%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      1.43 ± 19%      -0.8        0.60 ±  5%  perf-profile.children.cycles-pp.hrtimer_interrupt
      1.08 ±  3%      -0.8        0.26 ±  2%  perf-profile.children.cycles-pp.handle_mm_fault
      0.99 ±  3%      -0.8        0.23 ±  4%  perf-profile.children.cycles-pp.__handle_mm_fault
      0.83 ±  4%      -0.7        0.09 ±  4%  perf-profile.children.cycles-pp.irq_exit_rcu
      0.80 ±  5%      -0.7        0.09 ±  5%  perf-profile.children.cycles-pp.__do_softirq
      0.72 ±  3%      -0.6        0.11 ±  4%  perf-profile.children.cycles-pp._raw_spin_lock
      0.91 ±  3%      -0.5        0.40        perf-profile.children.cycles-pp.do_mmap
      0.90 ± 15%      -0.4        0.50 ±  6%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.68 ±  3%      -0.4        0.31        perf-profile.children.cycles-pp.mmap_region
      0.41 ± 34%      -0.4        0.05        perf-profile.children.cycles-pp.clockevents_program_event
      0.54 ±  2%      -0.4        0.18 ±  3%  perf-profile.children.cycles-pp.lock_vma_under_rcu
      0.85 ± 16%      -0.4        0.50 ±  6%  perf-profile.children.cycles-pp.tick_nohz_handler
      0.44 ±  2%      -0.3        0.09 ±  5%  perf-profile.children.cycles-pp.update_load_avg
      0.73 ± 14%      -0.3        0.47 ±  5%  perf-profile.children.cycles-pp.update_process_times
      0.32 ±  3%      -0.2        0.08 ±  4%  perf-profile.children.cycles-pp.native_irq_return_iret
      0.27 ±  4%      -0.2        0.07        perf-profile.children.cycles-pp.rcu_core
      0.29 ±  3%      -0.2        0.11        perf-profile.children.cycles-pp.do_anonymous_page
      0.25 ±  3%      -0.2        0.09 ±  5%  perf-profile.children.cycles-pp.vma_interval_tree_insert
      0.26 ±  3%      -0.2        0.10 ±  5%  perf-profile.children.cycles-pp.__pte_offset_map_lock
      0.23 ± 47%      -0.2        0.08 ± 14%  perf-profile.children.cycles-pp.tmigr_requires_handle_remote
      0.22 ± 49%      -0.1        0.08 ± 14%  perf-profile.children.cycles-pp.get_jiffies_update
      0.22 ±  4%      -0.1        0.08 ±  4%  perf-profile.children.cycles-pp.get_unmapped_area
      0.21 ±  6%      -0.1        0.08 ±  4%  perf-profile.children.cycles-pp.sync_regs
      0.20 ±  5%      -0.1        0.07        perf-profile.children.cycles-pp.vm_unmapped_area
      0.20 ±  4%      -0.1        0.08 ±  6%  perf-profile.children.cycles-pp.arch_get_unmapped_area_topdown
      0.18 ±  5%      -0.1        0.06        perf-profile.children.cycles-pp.mas_empty_area_rev
      0.17 ±  5%      -0.1        0.06 ±  6%  perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
      0.16 ±  3%      -0.1        0.07 ±  5%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      0.14 ±  4%      -0.1        0.05        perf-profile.children.cycles-pp.mas_rev_awalk
      0.16 ±  4%      -0.1        0.09 ±  5%  perf-profile.children.cycles-pp.mas_walk
      0.11 ±  6%      -0.1        0.05 ±  7%  perf-profile.children.cycles-pp.mas_store_prealloc
      0.03 ± 70%      +0.0        0.07 ±  5%  perf-profile.children.cycles-pp.kmem_cache_free
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.__put_partials
      0.00            +0.1        0.06 ±  9%  perf-profile.children.cycles-pp.shmem_file_write_iter
      0.00            +0.1        0.06 ±  8%  perf-profile.children.cycles-pp.vfs_write
      0.00            +0.1        0.06 ± 11%  perf-profile.children.cycles-pp.ksys_write
      0.00            +0.1        0.07 ±  7%  perf-profile.children.cycles-pp.record__pushfn
      0.00            +0.1        0.07 ±  7%  perf-profile.children.cycles-pp.write
      0.00            +0.1        0.07 ±  7%  perf-profile.children.cycles-pp.writen
      0.00            +0.1        0.11 ±  7%  perf-profile.children.cycles-pp.perf_mmap__push
      0.00            +0.1        0.12 ±  9%  perf-profile.children.cycles-pp.record__mmap_read_evlist
      0.00            +0.1        0.12 ±  6%  perf-profile.children.cycles-pp.__cmd_record
      0.00            +0.1        0.12 ±  6%  perf-profile.children.cycles-pp.cmd_record
      0.00            +0.1        0.12 ±  7%  perf-profile.children.cycles-pp.main
      0.00            +0.1        0.12 ±  7%  perf-profile.children.cycles-pp.run_builtin
      0.18 ±  3%      +0.2        0.42        perf-profile.children.cycles-pp.rwsem_spin_on_owner
      0.00            +0.3        0.27 ±  6%  perf-profile.children.cycles-pp.task_tick_fair
     13.63           +84.6       98.24        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     13.63           +84.6       98.24        perf-profile.children.cycles-pp.do_syscall_64
     13.54           +84.6       98.16        perf-profile.children.cycles-pp.ksys_mmap_pgoff
     13.51           +84.6       98.15        perf-profile.children.cycles-pp.vm_mmap_pgoff
     11.22           +86.5       97.68        perf-profile.children.cycles-pp.down_write_killable
     11.14           +86.5       97.66        perf-profile.children.cycles-pp.rwsem_down_write_slowpath
      3.17 ±  2%     +94.0       97.14        perf-profile.children.cycles-pp.osq_lock
      3.46 ±  2%     +94.1       97.59        perf-profile.children.cycles-pp.rwsem_optimistic_spin
     72.63           -72.6        0.06 ±  6%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      1.47 ±  3%      -0.8        0.62        perf-profile.self.cycles-pp.do_rw_once
      0.64 ±  3%      -0.5        0.09 ±  5%  perf-profile.self.cycles-pp._raw_spin_lock
      0.65 ±  5%      -0.5        0.11 ±  9%  perf-profile.self.cycles-pp.__handle_mm_fault
      0.62 ±  3%      -0.4        0.27        perf-profile.self.cycles-pp.do_access
      0.35 ±  2%      -0.3        0.08 ±  4%  perf-profile.self.cycles-pp.lock_vma_under_rcu
      0.32 ±  3%      -0.2        0.08 ±  4%  perf-profile.self.cycles-pp.native_irq_return_iret
      0.25 ±  3%      -0.2        0.08 ±  5%  perf-profile.self.cycles-pp.vma_interval_tree_insert
      0.22 ± 49%      -0.1        0.08 ± 12%  perf-profile.self.cycles-pp.get_jiffies_update
      0.21 ±  6%      -0.1        0.07 ±  6%  perf-profile.self.cycles-pp.sync_regs
      0.16 ±  2%      -0.1        0.06 ±  6%  perf-profile.self.cycles-pp.__update_load_avg_cfs_rq
      0.16 ±  4%      -0.1        0.09 ±  4%  perf-profile.self.cycles-pp.mas_walk
      0.17 ±  2%      +0.3        0.42        perf-profile.self.cycles-pp.rwsem_spin_on_owner
      3.17 ±  2%     +93.3       96.49        perf-profile.self.cycles-pp.osq_lock


***************************************************************************************************
lkp-icl-2sp9: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/rootfs/runtime/tbox_group/test/testcase:
  gcc-13/performance/x86_64-rhel-8.3/debian-12-x86_64-20240206.cgz/300s/lkp-icl-2sp9/small-allocs-mt/vm-scalability

commit: 
  b6adf494d7 ("mm: Assert the mmap_lock is held in __anon_vma_prepare()")
  06d7da17eb ("mm: Delay the check for a NULL anon_vma")

b6adf494d78314b6 06d7da17eb40ba4d1b68f894ee1 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     17955           -61.1%       6980        uptime.idle
 1.611e+10           -69.1%  4.982e+09        cpuidle..time
 1.853e+08           -92.3%   14289120 ±  3%  cpuidle..usage
     11230           -20.6%       8914 ±  3%  perf-c2c.HITM.remote
     27682           -12.1%      24320 ±  2%  perf-c2c.HITM.total
    848844 ±  2%    +128.5%    1939396 ±  2%  numa-numastat.node0.local_node
    883369          +124.3%    1981542        numa-numastat.node0.numa_hit
   1319303           +58.6%    2092949 ±  2%  numa-numastat.node1.local_node
   1351183           +56.7%    2117225 ±  2%  numa-numastat.node1.numa_hit
     78.83           -71.8%      22.21        vmstat.cpu.id
     19.93          +272.2%      74.18        vmstat.cpu.sy
     12.17 ±  7%    +311.6%      50.10        vmstat.procs.r
   1067521           -92.6%      79321 ±  3%  vmstat.system.cs
    602485           -81.7%     110420        vmstat.system.in
     78.73           -56.9       21.82        mpstat.cpu.all.idle%
      0.97            -0.7        0.29        mpstat.cpu.all.irq%
      0.08            -0.0        0.07        mpstat.cpu.all.soft%
     19.00           +55.2       74.19        mpstat.cpu.all.sys%
      1.23            +2.4        3.64        mpstat.cpu.all.usr%
     25.38          +270.9%      94.11        mpstat.max_utilization_pct
   1196280           -65.2%     416708        meminfo.Active
   1195992           -65.2%     416549        meminfo.Active(anon)
   4439550           -18.5%    3619917        meminfo.Cached
   2629628           -32.9%    1763715        meminfo.Committed_AS
     69593           -40.1%      41658        meminfo.Mapped
   9113710           +65.8%   15109985        meminfo.Memused
    690373          +211.0%    2147376        meminfo.PageTables
   2511830          +211.4%    7822144        meminfo.SUnreclaim
   1379430           -59.4%     560283        meminfo.Shmem
   2606486          +203.7%    7914759        meminfo.Slab
   9217244           +72.2%   15868922        meminfo.max_used_kB
     41551          +208.9%     128340        vm-scalability.median
      7.22 ± 14%      +6.5       13.71 ±  7%  vm-scalability.stddev%
   2659286          +208.9%    8214820        vm-scalability.throughput
    317.52           +10.4%     350.62        vm-scalability.time.elapsed_time
    317.52           +10.4%     350.62        vm-scalability.time.elapsed_time.max
    600.00 ±  5%   +9879.2%      59875        vm-scalability.time.involuntary_context_switches
 1.776e+08          +208.9%  5.487e+08        vm-scalability.time.minor_page_faults
      1278          +289.3%       4976        vm-scalability.time.percent_of_cpu_this_job_got
      3852          +332.8%      16671        vm-scalability.time.system_time
    208.45          +274.3%     780.21        vm-scalability.time.user_time
 1.708e+08           -92.0%   13751285 ±  3%  vm-scalability.time.voluntary_context_switches
 7.991e+08          +208.9%  2.469e+09        vm-scalability.workload
     26462 ± 30%    +355.1%     120436 ± 13%  numa-meminfo.node0.Active
     26355 ± 30%    +356.6%     120335 ± 13%  numa-meminfo.node0.Active(anon)
   3744138 ± 24%     +88.4%    7053908 ± 10%  numa-meminfo.node0.MemUsed
    342419          +214.8%    1077823        numa-meminfo.node0.PageTables
   1259794          +212.4%    3935134        numa-meminfo.node0.SUnreclaim
     52164 ± 87%    +265.6%     190719 ± 34%  numa-meminfo.node0.Shmem
   1306848          +205.1%    3986890        numa-meminfo.node0.Slab
   1170263           -74.7%     295991 ±  6%  numa-meminfo.node1.Active
   1170083           -74.7%     295932 ±  6%  numa-meminfo.node1.Active(anon)
     42683 ± 13%     -62.3%      16073 ± 20%  numa-meminfo.node1.Mapped
   5368570 ± 17%     +50.2%    8064145 ± 10%  numa-meminfo.node1.MemUsed
    348271 ±  2%    +207.6%    1071248        numa-meminfo.node1.PageTables
   1250327          +211.4%    3893129        numa-meminfo.node1.SUnreclaim
   1327536 ±  3%     -72.2%     369272 ± 18%  numa-meminfo.node1.Shmem
   1297929          +203.1%    3933988        numa-meminfo.node1.Slab
      6574 ± 30%    +357.4%      30074 ± 13%  numa-vmstat.node0.nr_active_anon
     85549 ±  2%    +214.6%     269122        numa-vmstat.node0.nr_page_table_pages
     13054 ± 87%    +265.4%      47702 ± 34%  numa-vmstat.node0.nr_shmem
    314916          +212.2%     983311        numa-vmstat.node0.nr_slab_unreclaimable
      6574 ± 30%    +357.4%      30074 ± 13%  numa-vmstat.node0.nr_zone_active_anon
    882369          +124.5%    1980880        numa-vmstat.node0.numa_hit
    847844 ±  2%    +128.7%    1938734 ±  2%  numa-vmstat.node0.numa_local
    292334           -74.7%      74088 ±  6%  numa-vmstat.node1.nr_active_anon
     10960 ± 14%     -63.8%       3968 ± 21%  numa-vmstat.node1.nr_mapped
     87015 ±  2%    +207.4%     267494        numa-vmstat.node1.nr_page_table_pages
    331863 ±  3%     -72.2%      92348 ± 18%  numa-vmstat.node1.nr_shmem
    312570          +211.2%     972821        numa-vmstat.node1.nr_slab_unreclaimable
    292334           -74.7%      74088 ±  6%  numa-vmstat.node1.nr_zone_active_anon
   1349954           +56.7%    2115569 ±  2%  numa-vmstat.node1.numa_hit
   1318072           +58.7%    2091293 ±  2%  numa-vmstat.node1.numa_local
    299113           -65.2%     104075        proc-vmstat.nr_active_anon
   6328555            -2.4%    6178825        proc-vmstat.nr_dirty_background_threshold
  12672583            -2.4%   12372759        proc-vmstat.nr_dirty_threshold
   1110217           -18.5%     905199        proc-vmstat.nr_file_pages
  63662675            -2.4%   62163313        proc-vmstat.nr_free_pages
    207228            -5.4%     196031        proc-vmstat.nr_inactive_anon
     15199            -1.4%      14990        proc-vmstat.nr_kernel_stack
     17628           -39.2%      10716        proc-vmstat.nr_mapped
    172696          +210.3%     535803        proc-vmstat.nr_page_table_pages
    344923           -59.4%     140027        proc-vmstat.nr_shmem
     23663            -2.2%      23153        proc-vmstat.nr_slab_reclaimable
    627282          +211.9%    1956390        proc-vmstat.nr_slab_unreclaimable
    299113           -65.2%     104075        proc-vmstat.nr_zone_active_anon
    207228            -5.4%     196031        proc-vmstat.nr_zone_inactive_anon
   2236707           +83.3%    4100262        proc-vmstat.numa_hit
   2170302           +85.9%    4033840        proc-vmstat.numa_local
    389394 ±  2%     -62.6%     145653 ±  5%  proc-vmstat.pgactivate
   2904299          +102.3%    5874354        proc-vmstat.pgalloc_normal
 1.786e+08          +207.8%  5.497e+08        proc-vmstat.pgfault
   2441060          +132.2%    5667896        proc-vmstat.pgfree
      1.70 ±  4%     -35.6%       1.09 ±  2%  perf-stat.i.MPKI
 4.873e+09          +228.7%  1.602e+10        perf-stat.i.branch-instructions
      0.43            -0.3        0.15        perf-stat.i.branch-miss-rate%
  21584013           -42.2%   12485827        perf-stat.i.branch-misses
     40.69            +6.3       47.01        perf-stat.i.cache-miss-rate%
   1078369           -92.6%      79670 ±  3%  perf-stat.i.context-switches
      3.03           -15.7%       2.55        perf-stat.i.cpi
 5.702e+10          +215.8%  1.801e+11        perf-stat.i.cpu-cycles
      2722 ±  4%     -89.6%     284.25 ±  2%  perf-stat.i.cpu-migrations
      1990 ±  5%    +195.6%       5883 ±  3%  perf-stat.i.cycles-between-cache-misses
 1.856e+10          +252.1%  6.536e+10        perf-stat.i.instructions
      0.37           +26.4%       0.46        perf-stat.i.ipc
      0.01 ± 68%    +943.9%       0.15 ± 14%  perf-stat.i.major-faults
     34.41           +45.2%      49.98        perf-stat.i.metric.K/sec
    562396          +177.8%    1562226        perf-stat.i.minor-faults
    562396          +177.8%    1562226        perf-stat.i.page-faults
      1.52 ±  5%     -71.2%       0.44 ±  2%  perf-stat.overall.MPKI
      0.44            -0.4        0.08        perf-stat.overall.branch-miss-rate%
     38.89            +4.0       42.88        perf-stat.overall.cache-miss-rate%
      3.07           -10.2%       2.76        perf-stat.overall.cpi
      2025 ±  5%    +211.2%       6303 ±  3%  perf-stat.overall.cycles-between-cache-misses
      0.33           +11.4%       0.36        perf-stat.overall.ipc
      7377           +26.2%       9311        perf-stat.overall.path-length
 4.855e+09          +229.7%  1.601e+10        perf-stat.ps.branch-instructions
  21554937           -42.1%   12473394        perf-stat.ps.branch-misses
   1073957           -92.6%      79637 ±  3%  perf-stat.ps.context-switches
  5.68e+10          +216.9%    1.8e+11        perf-stat.ps.cpu-cycles
      2738 ±  5%     -89.6%     284.08 ±  2%  perf-stat.ps.cpu-migrations
  1.85e+10          +253.1%  6.531e+10        perf-stat.ps.instructions
      0.01 ± 68%    +946.4%       0.15 ± 15%  perf-stat.ps.major-faults
    560100          +178.8%    1561640        perf-stat.ps.minor-faults
    560100          +178.8%    1561641        perf-stat.ps.page-faults
 5.896e+12          +289.9%  2.299e+13        perf-stat.total.instructions
    483686         +1579.1%    8121726        sched_debug.cfs_rq:/.avg_vruntime.avg
    561686 ±  2%   +1361.1%    8207028        sched_debug.cfs_rq:/.avg_vruntime.max
    468154         +1582.7%    7877712        sched_debug.cfs_rq:/.avg_vruntime.min
     18117 ± 10%    +179.2%      50584 ±  2%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      0.24 ± 11%    +223.0%       0.77 ± 10%  sched_debug.cfs_rq:/.h_nr_running.avg
      1.03 ±  6%     +81.1%       1.86 ± 13%  sched_debug.cfs_rq:/.h_nr_running.max
      0.42 ±  4%     -29.5%       0.30 ± 16%  sched_debug.cfs_rq:/.h_nr_running.stddev
      1.28 ± 14%    +530.4%       8.06 ± 19%  sched_debug.cfs_rq:/.load_avg.min
    483686         +1579.1%    8121726        sched_debug.cfs_rq:/.min_vruntime.avg
    561686 ±  2%   +1361.1%    8207028        sched_debug.cfs_rq:/.min_vruntime.max
    468154         +1582.7%    7877712        sched_debug.cfs_rq:/.min_vruntime.min
     18117 ± 10%    +179.2%      50584 ±  2%  sched_debug.cfs_rq:/.min_vruntime.stddev
      0.24 ± 11%    +215.2%       0.75 ± 10%  sched_debug.cfs_rq:/.nr_running.avg
      0.42 ±  4%     -47.7%       0.22 ± 19%  sched_debug.cfs_rq:/.nr_running.stddev
    270.42          +218.0%     859.87 ±  2%  sched_debug.cfs_rq:/.runnable_avg.avg
    617.81 ±  4%    +168.7%       1660 ±  3%  sched_debug.cfs_rq:/.runnable_avg.max
     44.31 ± 61%    +476.7%     255.53 ± 36%  sched_debug.cfs_rq:/.runnable_avg.min
    106.53 ±  6%     +76.9%     188.47 ± 10%  sched_debug.cfs_rq:/.runnable_avg.stddev
    269.85          +214.6%     849.07 ±  2%  sched_debug.cfs_rq:/.util_avg.avg
    617.75 ±  4%    +159.0%       1600 ±  3%  sched_debug.cfs_rq:/.util_avg.max
     44.31 ± 60%    +379.6%     212.50 ± 46%  sched_debug.cfs_rq:/.util_avg.min
    106.57 ±  6%     +72.9%     184.25 ± 11%  sched_debug.cfs_rq:/.util_avg.stddev
     49.69 ± 10%   +1250.9%     671.34 ± 10%  sched_debug.cfs_rq:/.util_est.avg
    367.69 ±  9%    +240.3%       1251 ±  8%  sched_debug.cfs_rq:/.util_est.max
    102.66 ±  4%    +103.6%     209.05 ± 16%  sched_debug.cfs_rq:/.util_est.stddev
    188245          +207.7%     579233 ±  7%  sched_debug.cpu.avg_idle.avg
    314020 ± 12%    +223.8%    1016940 ±  2%  sched_debug.cpu.avg_idle.max
     48870 ±  6%     -92.1%       3879 ±  2%  sched_debug.cpu.avg_idle.min
     54347 ±  6%    +618.7%     390582 ±  2%  sched_debug.cpu.avg_idle.stddev
      1.48 ±  3%     +80.6%       2.68 ± 10%  sched_debug.cpu.clock.stddev
    711.92 ±  7%    +202.4%       2152 ± 10%  sched_debug.cpu.curr->pid.avg
      1348           -36.6%     854.78 ± 16%  sched_debug.cpu.curr->pid.stddev
      0.00 ± 39%    +125.9%       0.00 ± 31%  sched_debug.cpu.next_balance.stddev
      0.25 ±  7%    +210.8%       0.77 ± 10%  sched_debug.cpu.nr_running.avg
      1.03 ±  6%     +83.8%       1.89 ± 11%  sched_debug.cpu.nr_running.max
      0.43 ±  2%     -30.2%       0.30 ± 16%  sched_debug.cpu.nr_running.stddev
   2626862           -91.6%     220090 ±  3%  sched_debug.cpu.nr_switches.avg
   2651045           -87.1%     342508 ±  6%  sched_debug.cpu.nr_switches.max
   2522596           -93.6%     161790 ±  4%  sched_debug.cpu.nr_switches.min
     25115 ±  9%     +43.3%      35978 ± 10%  sched_debug.cpu.nr_switches.stddev
      0.65 ±  2%     -79.2%       0.14 ± 55%  sched_debug.cpu.nr_uninterruptible.avg
     31.06 ± 49%    +409.1%     158.11 ± 11%  sched_debug.cpu.nr_uninterruptible.max
    -25.14          +265.5%     -91.89        sched_debug.cpu.nr_uninterruptible.min
      9.78 ± 37%    +403.5%      49.25 ±  7%  sched_debug.cpu.nr_uninterruptible.stddev
     59.37           -54.5        4.82        perf-profile.calltrace.cycles-pp.do_access
     56.91           -54.2        2.73        perf-profile.calltrace.cycles-pp.asm_exc_page_fault.do_access
     55.42           -53.5        1.96 ±  2%  perf-profile.calltrace.cycles-pp.exc_page_fault.asm_exc_page_fault.do_access
     55.35           -53.4        1.94 ±  2%  perf-profile.calltrace.cycles-pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.do_access
     49.60           -49.6        0.00        perf-profile.calltrace.cycles-pp.lock_mm_and_find_vma.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.do_access
     48.04           -48.0        0.00        perf-profile.calltrace.cycles-pp.down_read_killable.lock_mm_and_find_vma.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
     47.40           -47.4        0.00        perf-profile.calltrace.cycles-pp.rwsem_down_read_slowpath.down_read_killable.lock_mm_and_find_vma.do_user_addr_fault.exc_page_fault
     41.75           -41.8        0.00        perf-profile.calltrace.cycles-pp._raw_spin_lock_irq.rwsem_down_read_slowpath.down_read_killable.lock_mm_and_find_vma.do_user_addr_fault
     40.48           -40.5        0.00        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.rwsem_down_read_slowpath.down_read_killable.lock_mm_and_find_vma
     21.24           -21.2        0.00        perf-profile.calltrace.cycles-pp.__mmap
     21.08           -21.1        0.00        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__mmap
     21.08           -21.1        0.00        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__mmap
     21.03           -21.0        0.00        perf-profile.calltrace.cycles-pp.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe.__mmap
     20.97           -21.0        0.00        perf-profile.calltrace.cycles-pp.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe.__mmap
     18.03           -18.0        0.00        perf-profile.calltrace.cycles-pp.asm_sysvec_call_function_single.acpi_safe_halt.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter
     17.47           -17.5        0.00        perf-profile.calltrace.cycles-pp.common_startup_64
     17.19           -17.2        0.00        perf-profile.calltrace.cycles-pp.start_secondary.common_startup_64
     17.18           -17.2        0.00        perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.common_startup_64
     17.16           -17.2        0.00        perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.common_startup_64
     14.97           -15.0        0.00        perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.common_startup_64
     14.25           -14.3        0.00        perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
     14.19           -14.2        0.00        perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
     13.57           -13.6        0.00        perf-profile.calltrace.cycles-pp.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      8.13 ±  2%      -8.1        0.00        perf-profile.calltrace.cycles-pp._raw_spin_lock_irq.rwsem_down_write_slowpath.down_write_killable.vm_mmap_pgoff.ksys_mmap_pgoff
      7.97 ±  2%      -8.0        0.00        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.rwsem_down_write_slowpath.down_write_killable.vm_mmap_pgoff
      5.97            -6.0        0.00        perf-profile.calltrace.cycles-pp.acpi_safe_halt.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      2.34 ±  2%      -1.2        1.09 ±  3%  perf-profile.calltrace.cycles-pp.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.do_access
      2.07 ±  2%      -1.2        0.85 ±  4%  perf-profile.calltrace.cycles-pp.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      1.58            -0.9        0.70        perf-profile.calltrace.cycles-pp.lock_vma_under_rcu.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.do_access
      0.64 ±  4%      -0.4        0.26 ±100%  perf-profile.calltrace.cycles-pp.do_anonymous_page.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault
      1.59            -0.1        1.48        perf-profile.calltrace.cycles-pp.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.14            -0.0        1.09        perf-profile.calltrace.cycles-pp.mmap_region.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64
      1.20            +0.4        1.55        perf-profile.calltrace.cycles-pp.rwsem_spin_on_owner.rwsem_optimistic_spin.rwsem_down_write_slowpath.down_write_killable.vm_mmap_pgoff
      2.28            +0.9        3.21        perf-profile.calltrace.cycles-pp.do_rw_once
     17.49           +73.1       90.62        perf-profile.calltrace.cycles-pp.down_write_killable.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
     17.34           +73.2       90.57        perf-profile.calltrace.cycles-pp.rwsem_down_write_slowpath.down_write_killable.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64
      7.01           +81.8       88.79        perf-profile.calltrace.cycles-pp.osq_lock.rwsem_optimistic_spin.rwsem_down_write_slowpath.down_write_killable.vm_mmap_pgoff
      8.59           +81.8       90.43        perf-profile.calltrace.cycles-pp.rwsem_optimistic_spin.rwsem_down_write_slowpath.down_write_killable.vm_mmap_pgoff.ksys_mmap_pgoff
      0.00           +92.4       92.36        perf-profile.calltrace.cycles-pp.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00           +92.4       92.42        perf-profile.calltrace.cycles-pp.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00           +92.4       92.44        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00           +92.4       92.44        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
     59.07           -54.3        4.82        perf-profile.children.cycles-pp.do_access
     56.71           -53.9        2.83        perf-profile.children.cycles-pp.asm_exc_page_fault
     55.44           -53.5        1.97 ±  2%  perf-profile.children.cycles-pp.exc_page_fault
     55.39           -53.4        1.95 ±  2%  perf-profile.children.cycles-pp.do_user_addr_fault
     49.89           -49.9        0.00        perf-profile.children.cycles-pp._raw_spin_lock_irq
     49.60           -49.6        0.00        perf-profile.children.cycles-pp.lock_mm_and_find_vma
     48.76           -48.6        0.16 ±  8%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
     48.05           -48.1        0.00        perf-profile.children.cycles-pp.down_read_killable
     47.42           -47.4        0.00        perf-profile.children.cycles-pp.rwsem_down_read_slowpath
     21.25           -21.3        0.00        perf-profile.children.cycles-pp.__mmap
     17.47           -17.0        0.46 ±  2%  perf-profile.children.cycles-pp.common_startup_64
     17.47           -17.0        0.46 ±  2%  perf-profile.children.cycles-pp.cpu_startup_entry
     17.45           -17.0        0.46 ±  2%  perf-profile.children.cycles-pp.do_idle
     17.19           -16.7        0.45 ±  3%  perf-profile.children.cycles-pp.start_secondary
     15.22           -14.8        0.41 ±  3%  perf-profile.children.cycles-pp.cpuidle_idle_call
     14.48           -14.1        0.40 ±  3%  perf-profile.children.cycles-pp.cpuidle_enter
     14.42           -14.0        0.40 ±  3%  perf-profile.children.cycles-pp.cpuidle_enter_state
     13.79           -13.4        0.39 ±  2%  perf-profile.children.cycles-pp.acpi_idle_enter
     13.77           -13.4        0.39 ±  3%  perf-profile.children.cycles-pp.acpi_safe_halt
     11.27           -11.0        0.28 ±  2%  perf-profile.children.cycles-pp.asm_sysvec_call_function_single
      5.02 ±  2%      -4.9        0.13        perf-profile.children.cycles-pp.__schedule
      3.97            -3.9        0.10        perf-profile.children.cycles-pp.sysvec_call_function_single
      3.24            -3.2        0.08 ±  4%  perf-profile.children.cycles-pp.__sysvec_call_function_single
      3.18 ±  2%      -3.1        0.09        perf-profile.children.cycles-pp.schedule_preempt_disabled
      3.17 ±  2%      -3.1        0.10 ±  5%  perf-profile.children.cycles-pp.schedule
      3.09            -3.0        0.08        perf-profile.children.cycles-pp.__flush_smp_call_function_queue
      2.33            -2.3        0.06        perf-profile.children.cycles-pp.sched_ttwu_pending
      1.86            -1.8        0.05        perf-profile.children.cycles-pp.ttwu_do_activate
      1.90            -1.8        0.13 ± 10%  perf-profile.children.cycles-pp.rwsem_wake
      1.90            -1.6        0.28 ±  4%  perf-profile.children.cycles-pp.up_write
      1.51            -1.4        0.06 ±  7%  perf-profile.children.cycles-pp.wake_up_q
      1.45            -1.4        0.06 ±  7%  perf-profile.children.cycles-pp.try_to_wake_up
      1.62 ±  4%      -1.3        0.36 ±  3%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      2.36 ±  2%      -1.3        1.10 ±  3%  perf-profile.children.cycles-pp.handle_mm_fault
      2.09 ±  2%      -1.2        0.86 ±  4%  perf-profile.children.cycles-pp.__handle_mm_fault
      1.58            -0.9        0.70        perf-profile.children.cycles-pp.lock_vma_under_rcu
      0.94 ±  8%      -0.6        0.33 ±  3%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.79            -0.5        0.26        perf-profile.children.cycles-pp.native_irq_return_iret
      0.76 ±  3%      -0.3        0.44 ±  3%  perf-profile.children.cycles-pp._raw_spin_lock
      0.40 ±  2%      -0.3        0.09        perf-profile.children.cycles-pp.irq_exit_rcu
      0.51 ± 15%      -0.3        0.24 ±  4%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.49 ± 15%      -0.3        0.23 ±  5%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.31 ±  2%      -0.2        0.11        perf-profile.children.cycles-pp.__do_softirq
      0.60 ±  4%      -0.2        0.45 ±  4%  perf-profile.children.cycles-pp.__pte_offset_map_lock
      0.64 ±  4%      -0.1        0.51 ±  3%  perf-profile.children.cycles-pp.do_anonymous_page
      1.60            -0.1        1.49        perf-profile.children.cycles-pp.do_mmap
      0.27 ± 10%      -0.1        0.17 ±  6%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.38            -0.1        0.28        perf-profile.children.cycles-pp.vm_unmapped_area
      0.48 ±  2%      -0.1        0.38 ±  3%  perf-profile.children.cycles-pp.mas_walk
      0.26 ± 10%      -0.1        0.16 ±  6%  perf-profile.children.cycles-pp.tick_nohz_handler
      0.17 ±  4%      -0.1        0.08 ± 13%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      0.30 ±  3%      -0.1        0.22 ±  3%  perf-profile.children.cycles-pp.___perf_sw_event
      0.33            -0.1        0.24        perf-profile.children.cycles-pp.mas_empty_area_rev
      0.18 ±  2%      -0.1        0.09 ±  4%  perf-profile.children.cycles-pp.rcu_core
      0.39            -0.1        0.31        perf-profile.children.cycles-pp.arch_get_unmapped_area_topdown
      0.35 ±  2%      -0.1        0.28        perf-profile.children.cycles-pp.sync_regs
      0.12 ±  3%      -0.1        0.06 ±  6%  perf-profile.children.cycles-pp.osq_unlock
      0.20 ±  7%      -0.1        0.14 ±  6%  perf-profile.children.cycles-pp.update_process_times
      0.40 ±  2%      -0.1        0.34        perf-profile.children.cycles-pp.get_unmapped_area
      1.15            -0.1        1.09        perf-profile.children.cycles-pp.mmap_region
      0.31 ±  3%      -0.1        0.25        perf-profile.children.cycles-pp.vma_interval_tree_insert
      0.26            -0.1        0.20        perf-profile.children.cycles-pp.mas_rev_awalk
      0.12 ±  3%      -0.0        0.08        perf-profile.children.cycles-pp.__rb_insert_augmented
      0.12            -0.0        0.09 ±  4%  perf-profile.children.cycles-pp.perf_event_mmap
      0.12 ±  4%      -0.0        0.09        perf-profile.children.cycles-pp.perf_event_mmap_event
      0.08 ±  5%      -0.0        0.06        perf-profile.children.cycles-pp.handle_pte_fault
      0.09 ±  7%      -0.0        0.07 ±  5%  perf-profile.children.cycles-pp.mas_preallocate
      0.08 ±  4%      -0.0        0.06 ±  6%  perf-profile.children.cycles-pp.mas_alloc_nodes
      0.09            -0.0        0.08        perf-profile.children.cycles-pp.mas_wr_bnode
      0.06 ±  6%      +0.0        0.07 ±  6%  perf-profile.children.cycles-pp.vm_area_alloc
      0.20 ±  2%      +0.0        0.22 ±  2%  perf-profile.children.cycles-pp.mas_store_prealloc
      0.09 ±  4%      +0.0        0.12 ±  6%  perf-profile.children.cycles-pp.mas_wr_store_entry
      0.08 ±  5%      +0.0        0.11 ±  3%  perf-profile.children.cycles-pp.mas_wr_node_store
      0.04 ± 44%      +0.0        0.07 ±  5%  perf-profile.children.cycles-pp.down_write
      0.19 ±  3%      +0.0        0.23 ±  4%  perf-profile.children.cycles-pp.__perf_sw_event
      0.00            +0.1        0.05 ±  8%  perf-profile.children.cycles-pp.task_tick_fair
      0.00            +0.1        0.06 ±  8%  perf-profile.children.cycles-pp.__call_rcu_common
      1.20            +0.4        1.56        perf-profile.children.cycles-pp.rwsem_spin_on_owner
      3.36            +0.4        3.76        perf-profile.children.cycles-pp.do_rw_once
     21.18           +71.3       92.48        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     21.17           +71.3       92.48        perf-profile.children.cycles-pp.do_syscall_64
     21.04           +71.4       92.42        perf-profile.children.cycles-pp.ksys_mmap_pgoff
     20.98           +71.4       92.36        perf-profile.children.cycles-pp.vm_mmap_pgoff
     17.49           +73.1       90.62        perf-profile.children.cycles-pp.down_write_killable
     17.34           +73.2       90.57        perf-profile.children.cycles-pp.rwsem_down_write_slowpath
      7.01           +81.8       88.80        perf-profile.children.cycles-pp.osq_lock
      8.64           +81.8       90.43        perf-profile.children.cycles-pp.rwsem_optimistic_spin
     48.76           -48.6        0.16 ±  8%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      8.50            -8.3        0.21 ±  3%  perf-profile.self.cycles-pp.acpi_safe_halt
      1.34 ±  2%      -1.1        0.28 ±  8%  perf-profile.self.cycles-pp.__handle_mm_fault
      1.07 ±  3%      -0.8        0.30 ±  5%  perf-profile.self.cycles-pp.lock_vma_under_rcu
      0.79            -0.5        0.26        perf-profile.self.cycles-pp.native_irq_return_iret
      0.50            -0.2        0.30 ±  2%  perf-profile.self.cycles-pp._raw_spin_lock
      0.15 ±  2%      -0.1        0.05        perf-profile.self.cycles-pp.down_write_killable
      0.47 ±  2%      -0.1        0.38 ±  3%  perf-profile.self.cycles-pp.mas_walk
      0.35 ±  2%      -0.1        0.28        perf-profile.self.cycles-pp.sync_regs
      0.12 ±  3%      -0.1        0.06 ±  6%  perf-profile.self.cycles-pp.osq_unlock
      0.11 ±  4%      -0.1        0.05 ± 45%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.25 ±  2%      -0.1        0.20 ±  3%  perf-profile.self.cycles-pp.___perf_sw_event
      0.30 ±  3%      -0.1        0.25        perf-profile.self.cycles-pp.vma_interval_tree_insert
      0.11            -0.0        0.08        perf-profile.self.cycles-pp.__rb_insert_augmented
      0.19 ±  3%      -0.0        0.16 ±  2%  perf-profile.self.cycles-pp.mas_rev_awalk
      0.06 ±  6%      -0.0        0.05        perf-profile.self.cycles-pp.handle_mm_fault
      0.02 ± 99%      +0.0        0.07 ±  8%  perf-profile.self.cycles-pp.down_write
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.mas_wr_node_store
      1.10            +0.1        1.16        perf-profile.self.cycles-pp.do_access
      0.07 ±  9%      +0.1        0.16 ±  3%  perf-profile.self.cycles-pp.up_write
      3.00            +0.2        3.22        perf-profile.self.cycles-pp.do_rw_once
      1.16            +0.4        1.55        perf-profile.self.cycles-pp.rwsem_spin_on_owner
      6.99           +81.6       88.57        perf-profile.self.cycles-pp.osq_lock



Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

