Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE716334C33
	for <oe-lkp@lists.linux.dev>; Fri, 21 Nov 2025 07:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763708412; cv=fail; b=XJVEo3Bfr4pqpC2+60uosV0bozs04Ne/XSyFJl7CfwtZeBA9b8/np/soMj5WU/wCqM2IBei4LSNF/ky2ugPWhJ4XhouTT9z2GO6vp7x0S2dcvTltgehkNFMedm0JHE2T9mYTDR0KPrAaqrSeXfOWqPpRB1fVmaiMEqg614h23lc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763708412; c=relaxed/simple;
	bh=85VNyYdg1c/cPNwdrd80SbdPanrW7oqJpULEHhZPWMk=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=czXABlcrBRcDaAaOHmaGHLAhU1+Xhg5o/7ZnCal057zC8vsqIcVHQWLVKP8QOoyrg0OQYQ7dqvu5UhFAVTt0gc1RutMN2IVIKAa5ZRL1A1MoxBWqOczPPVaJMm1YwU8zFAxXU51mDGdBtH2bkEYtLYl+Kxwf88OifKJYqgo/Etg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BBaIdpf8; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BBaIdpf8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763708402; x=1795244402;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=85VNyYdg1c/cPNwdrd80SbdPanrW7oqJpULEHhZPWMk=;
  b=BBaIdpf8m61Q4AadfzxVtsFZT2N6EAD5+zyPWz6Wuz12ONh9uBaKAS8G
   Bkz8ZQjqRSa4azOZETiirJy+uNsnTUNB02zv+IAQ7M8yIzZPJChXszU84
   ju8nE0sdNm+EnOyJ35RX1F1Z/qeWvgyvLxIoZFa1TUdtR1Yc0VbrP4UeZ
   1bPaUwV1fySFGedHXmJBwc3u8d2KNMxQM+m2gO5jGF/B4Udie8eSFW/H1
   HleKbIqk/Pf4EcC3mg656QfreZSlmIi34Qc5aQD+IX9PZ5CKx4H5XeSXO
   qgpcjj7KQmPmRBs/Urh6Ur66jNXd2JXPAMDUMbVcw6Mgsw0iny7D/IJGw
   A==;
X-CSE-ConnectionGUID: MZlJIPMCRmy+Kg3vVQ76SQ==
X-CSE-MsgGUID: XYTcT+lvRyuBTpCs50r8Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="69654037"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="69654037"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 23:00:01 -0800
X-CSE-ConnectionGUID: y6wKSQcCT6qdCsWr4W23ig==
X-CSE-MsgGUID: lrKecmZZTJKrBBdx51b/rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="191645128"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 23:00:00 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 22:59:59 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 22:59:59 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.64) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 22:59:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=urZZLd8+Bx7z5Qz4nOlS0ySS1tSSmNpCSfCMajD/jqiAamQJtbzdpcBVfjIlNBwWXhdSqPMlRHfvHqLhpndDJfcttL67ckXh5fS1JmJMeYEOzj0imDTJqH4AdIq1FxMjuC2qdTJ9Ed7VYdUy0LbZMiHZ3Hn16poguvj9prpF9bx4B/ofpws1A/mW5zuOZHuTrvFKXahlYVv+/9U776kNF4KjQmHFmCE9wJjIqYr/HzTT50Uad/chuZdTbxWNsaIl0upbwjGCOQLnR5xA480gK0zQstp9Iy/5Dbj+ZV1FBXEDVC883wxXGNPkeSAueUxWZvRYQgbXBH3m5OTUQW7Ztg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7rObUEVKCkTRHCYQTsO9nJJ9vM5+tr7Rvs4DVHRKcLk=;
 b=UeDiYDRztDITuBGOGpZAnhSCQ1LrTPr6AVerXOXTbFGHtyJrC+2K7ThPKpJLg/9/y4V2ne0PXumo9fHQ747fAB1wjpvRT9TqegKciCzq/HxKqoRn0cSXqGGVbhekxjuupi7Fm0FMpVEmLF91wEId9JpR46EEWF3h1gNcmv4gDZL3F9viqauXgmLKzah1bUhrlQKq2IgLlOz4UsTCpjSUmBJAKMqK0aWip89VzWQ8MUcvF8zbEhL9HjNneHulA6YC8Q6tzCxABGH7wp1OgGmZTOVpcKzR40MzlJ3vl5jtwp7dBOr6y2rCof9hD+S/gnvWzMh/QX686R4MTgozk4+oeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MW4PR11MB7053.namprd11.prod.outlook.com (2603:10b6:303:221::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 06:59:57 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 06:59:57 +0000
Date: Fri, 21 Nov 2025 14:59:48 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Mel Gorman <mgorman@techsingularity.net>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	<aubrey.li@linux.intel.com>, <yu.c.chen@intel.com>, <oliver.sang@intel.com>
Subject: [tip:sched/core] [sched/fair]  e837456fdc:  pts.quadray.1.1080p.fps
 23.2% improvement
Message-ID: <202511211403.39a71f1e-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR03CA0114.apcprd03.prod.outlook.com
 (2603:1096:4:91::18) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MW4PR11MB7053:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ffe6b43-26e7-496b-1191-08de28cb94bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?3EH7RwYG78Dy6pBkGm3MtQcBFWZl03G7a7yC6OgCoptmbSRqy/+fm75KCF?=
 =?iso-8859-1?Q?dJZ4bK30QiTiM5kkU5Ht3fNzK7kYt/RCMqNKe8houcmszaatuEPV6bZEKD?=
 =?iso-8859-1?Q?CoSxzSYI6DVygrtfikXaKlE99wddosP7rpWo78dSLBfVdLQTsDQ4WSIJ2v?=
 =?iso-8859-1?Q?h1b5P57Xjq1b8ACyRI/RVeJelhV3G3Z+vCRGKTy1q2dXdWxJo+aBYw5eWu?=
 =?iso-8859-1?Q?kTF3wX2AVJgtLMtRBy2k5LB8583gMgSXwpTPHBYqgU8uTC1Iz289Y/Qxp/?=
 =?iso-8859-1?Q?5uVORTTq+ZfquoYz3SY+AgR+tQj26GbJ9CHH8VMOLEATGxm9gSDn3Q9Cyo?=
 =?iso-8859-1?Q?co0fStQ0flKqlF5b8rnt1QT3zddvX0IFt+6mR/dPZZuYkByottlq4A9rSd?=
 =?iso-8859-1?Q?NH5g2Q5Xj/hO3yQpuHa5JIN4OUCdX8aPjEY+OR5WT42TZ0c1oMZksAO6ea?=
 =?iso-8859-1?Q?givfKyQtFfLfQoTsPp8mfq6z6PosCvr8TVgr8WctqUpNQjp58pzV4YCxbv?=
 =?iso-8859-1?Q?yZffwWjQGmDED/jL9uL+ljdNsNULEOoy3pxBYCyv7ooJYgj5ak4oL9yEN5?=
 =?iso-8859-1?Q?JoKiAXhpN1S2iWZQum4ixTvu5kQzTnnyJzrrICEGt84isMm8e70dWuIBDB?=
 =?iso-8859-1?Q?Qlxh1ZRGUSpeQ4yWrSmDvKFnTTgpTUrd4NZxFi9aM3U6ZCeBISEiDX1Wse?=
 =?iso-8859-1?Q?UE8wn87dSUr1NYZxmu9AjdYc53UuZHPstCC5+3XNnd3STfj/Aj6z+EOxlW?=
 =?iso-8859-1?Q?eJGUMxgIPPcQ10vkx0Mv4WEexYBEBsLB0Zhx5DQyMel3ez2kraIv3bwzUw?=
 =?iso-8859-1?Q?ZxFXC9jn8lNpw8ef8ND9uKS6kVzKsK8/PwXX2bA2c721e2pVjXG5nMYB8F?=
 =?iso-8859-1?Q?OsDjOOfoZZamXRewjbHg7/L+/RzRPbVA+Mzd3U8EnwP6YyBgYGGeU/UQ/9?=
 =?iso-8859-1?Q?RG6KYg29X28fXFkUZLKw6T/CidC/hDjaDqyGORJ1F96S4h6MBGJ71xAcKI?=
 =?iso-8859-1?Q?YA1tbkI25PoqND3Xcjs8Ec7rvqL/tGEXgDWY4irkEoiKk8owvE0hiTZ2Ly?=
 =?iso-8859-1?Q?LFeRz40EM5QN+IQzvprGAUMm74AaT9UE+M7Nu6haHPOEfeoYxbaLM9fahe?=
 =?iso-8859-1?Q?uZyCeCJHkOtI7cqO/VIPiZxScm+0k33lj7lV2y4g23uMwZSGOQDx3I/G2T?=
 =?iso-8859-1?Q?vNXQAotJSmEs6g6FeSfvicqoPVjlI81/l4RWLYcgKlz48vG+Xzr3PZhkkK?=
 =?iso-8859-1?Q?e9pL9cl+dtDFqWIJk3FbNp5eLK6baZp9VnbLl+HyidWvPpr+1uOfNYJQEy?=
 =?iso-8859-1?Q?MVUDJZqZwyyo+HbA8kYJwR4gMxfh9itm5u6FDl4uSQ1qGYmM9TpUkGh5RK?=
 =?iso-8859-1?Q?ldB9Z6JWo/7Wd5LfFAOkBkXMMFkere0bGJ7TabqQVO3rZ19Ju0neRMA53C?=
 =?iso-8859-1?Q?YI6v/cWpepEDzgyB/KDlNC8fYV55CXX20oOTHxIZ3eZauv5TzBVwGxCmp0?=
 =?iso-8859-1?Q?/ZHThfiSYo3sSqWgQ3ebvtUdfJj3JhWOEMaLPRE/X7sg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?VpwHmINS8yZia6QCX8OizUdV5Kn/NBBXM1oVDqYG3KQmiUazWbDhPKhsUK?=
 =?iso-8859-1?Q?vEtkMDsqTluNJJc42hAZNzkNvSyrXNfCwdF8w1VdZC4aSQN6A87BhlKzaw?=
 =?iso-8859-1?Q?5oA5M3Qao1Vh+soHTtJXPYjDbSoy+ApF84VNDBeUlAcMSWvTh1QU6Vdc+v?=
 =?iso-8859-1?Q?kh5m1EDiA2WWK62ZE/lqXPtvb07EVQ63hUfl/JxMz3ArujtNmK7Ri1Ssf0?=
 =?iso-8859-1?Q?h3Qnf9prQz2B5xqHDW3q7mfBV1ZTajYxSBGuxPu8+cbSe3RyyTXPzjBFIb?=
 =?iso-8859-1?Q?0JjqIWq+QCrf6777emlVl423RBv276T/n9u/ghG+nW6TjrKg9VA4t0p3Rx?=
 =?iso-8859-1?Q?ywV7890e4voo7Xyca5tb9bm+LwnPJnXoTAFEBMfKDanJcrhoDVCW8H/Usc?=
 =?iso-8859-1?Q?kJgHd/Keh0+UGwt58KGhAOyILWa4NmzC8KOy/1A2vO+vVMM7ZZVsXA8MW2?=
 =?iso-8859-1?Q?lFEYz3afAOh5mrGHo4fKyC/5G6CqrwaZjwiHiyqbToTaTDVv82SN/YmMvP?=
 =?iso-8859-1?Q?NhB572A6atbSyEHbPnljbxOhQMnGamVtXENKrZVyU8CheBNlUV1MKYTpBz?=
 =?iso-8859-1?Q?hLU0n45/OVwzBQ6tBIIkx1j/Cc6PgS/GgmXm1Bl3fUXLcQRvvKIYdbXedv?=
 =?iso-8859-1?Q?Tg9RyTfFqANXc/6Tdms0eMcMjScmwsQP7JJ9TNTpqhs/QSkFNnl5oibgmc?=
 =?iso-8859-1?Q?2bC2b51om6LRWLiJoFDcBJpu9VMp19MoExTzE8p+FKbLJ7lEXcS6D1z4sp?=
 =?iso-8859-1?Q?IkgICJg2d9oJNSi8fIXvhBrCdRNRv+qJFph9kbVok+430rA0f3KJfeFl/n?=
 =?iso-8859-1?Q?UqOiPs9qrbPrYPOxGtMVPXXNIPdJBAca65W2SZ+YqfmZ4tPGMEPSEni8WX?=
 =?iso-8859-1?Q?iAQPWOJ7hkDzoEgZKLdeUI2lpORs5z2q3JSYkCZeix3rQWYqO9Z3FFeR4w?=
 =?iso-8859-1?Q?6Qb3+wAzkg8My/kGai0IOBYNxw4uYyPnQGuM8H+USMNXCOicopBh4qLI1C?=
 =?iso-8859-1?Q?Bt5El5zmyMQ48y7534IR3Soqq3T1xpUx1CjW9ukPEuh+sGL/p5q6qDUmmc?=
 =?iso-8859-1?Q?Jg6P+YSZqu/rYBmxdAvciwp3F+Y1twspxFghqcYZBXFCNL9N1M840sWf2t?=
 =?iso-8859-1?Q?BYZkPu6RwdYbFV3Qo9mAxeuDCUzEZ7u1YytOOE13Cgd7b0iE+OyqYrNZpq?=
 =?iso-8859-1?Q?lub+fNelBwDawgzzROZ5vCVqJybFbGVNmIfs9hFB6fWOjYluqL7u6DzKB9?=
 =?iso-8859-1?Q?IOVuStrQuOrXmz2mpshYxLS+/vnR0lxAT9+NMAogus0rxlVdJTnPXAtXMF?=
 =?iso-8859-1?Q?JPJ8j5J/jDy6tXks5ny812MmoOq5p8l/YcEcHO++cmfoxyIVXZyzfELj2x?=
 =?iso-8859-1?Q?zi6rfDmJ/oB7VzUfwcaF2+HD/RWaeiaFGQ69BPTgv3qvxT4Jn2axRmuhMs?=
 =?iso-8859-1?Q?zyvsoVENm217elhn6XxV9GtyBF70Dpe42yostws2Q/HidjbhIV2M1udfQ4?=
 =?iso-8859-1?Q?mQb+d4XJZXBGlTpSKvcXJstf1wuPKup5SNZR8ahXFUeHV8+yz+0SvI8XhP?=
 =?iso-8859-1?Q?88CiHmKwDkB0+pUrZyq7d8QFKSmZRARXMnIKHu9/insdvphA6nOoXB703O?=
 =?iso-8859-1?Q?OmPN6sXb7VEtyYclHZUrCPWSaNhIvEykgEi5dyolXw0kB4hLAsaVFaMQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ffe6b43-26e7-496b-1191-08de28cb94bb
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 06:59:57.3269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jyVYUvqjkE1MAU8UIYBTECf3gHAKbxatnz2BGDIMIkjVoyTg9OzfRbi98UPU6PSEbCZdWUd5NgfF9h8Uc7LQDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7053
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 23.2% improvement of pts.quadray.1.1080p.fps on:


commit: e837456fdca81899a3c8e47b3fd39e30eae6e291 ("sched/fair: Reimplement NEXT_BUDDY to align with EEVDF goals")
https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git sched/core


testcase: pts
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz (Cascade Lake) with 512G memory
parameters:

	need_x: true
	test: quadray-1.0.0
	option_a: 5
	option_b: 1080p
	cpufreq_governor: performance



Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20251121/202511211403.39a71f1e-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/need_x/option_a/option_b/rootfs/tbox_group/test/testcase:
  gcc-14/performance/x86_64-rhel-9.4/true/5/1080p/debian-12-x86_64-phoronix/lkp-csl-2sp7/quadray-1.0.0/pts

commit: 
  aceccac58a ("sched/fair: Enable scheduler feature NEXT_BUDDY")
  e837456fdc ("sched/fair: Reimplement NEXT_BUDDY to align with EEVDF goals")

aceccac58ad76305 e837456fdca81899a3c8e47b3fd 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
  15179434 ± 18%     +51.8%   23046485 ± 15%  meminfo.DirectMap2M
      0.37            +0.0        0.41        mpstat.cpu.all.sys%
   1055135 ± 31%     -53.4%     492047 ± 91%  numa-meminfo.node0.Shmem
    263798 ± 31%     -53.4%     122995 ± 91%  numa-vmstat.node0.nr_shmem
     21104            +9.2%      23039        vmstat.system.cs
    371194            +1.8%     378021        proc-vmstat.nr_shmem
      4628            +2.9%       4762        proc-vmstat.numa_huge_pte_updates
     18161 ±  6%     +22.2%      22195 ± 11%  sched_debug.cfs_rq:/system.slice.avg_vruntime.stddev
     18051 ±  6%     +22.4%      22090 ± 11%  sched_debug.cfs_rq:/system.slice.zero_vruntime.stddev
     16231           +11.2%      18053        sched_debug.cpu.nr_switches.avg
      6.26 ± 10%     -19.7%       5.03 ± 10%  sched_debug.cpu.nr_uninterruptible.stddev
     39.69 ±  2%     +23.2%      48.89        pts.quadray.1.1080p.fps
      3245            +2.4%       3323        pts.time.percent_of_cpu_this_job_got
     39.97 ±  2%     +14.1%      45.62        pts.time.system_time
      4456            +2.2%       4555        pts.time.user_time
   1290701            +9.9%    1419060        pts.time.voluntary_context_switches
  6.13e+09            +2.8%  6.299e+09        perf-stat.i.branch-instructions
     21517            +9.0%      23449        perf-stat.i.context-switches
 6.949e+10            +2.3%  7.108e+10        perf-stat.i.cpu-cycles
    203.07            +7.8%     218.95        perf-stat.i.cpu-migrations
      8980 ±  2%      -7.8%       8279        perf-stat.i.cycles-between-cache-misses
 2.515e+10            +2.9%  2.589e+10        perf-stat.i.dTLB-loads
  8.21e+09            +2.7%  8.429e+09        perf-stat.i.dTLB-stores
 6.904e+10            +2.9%  7.102e+10        perf-stat.i.instructions
      0.72            +2.3%       0.74        perf-stat.i.metric.GHz
    514.91 ±  2%      -9.4%     466.42 ±  5%  perf-stat.i.metric.K/sec
    412.78            +2.9%     424.58        perf-stat.i.metric.M/sec
    372305 ±  2%     +20.8%     449603 ±  5%  perf-stat.i.node-store-misses
      1.81            -0.0        1.77        perf-stat.overall.branch-miss-rate%
     57.23 ±  2%      +4.3       61.51 ±  3%  perf-stat.overall.node-store-miss-rate%
 6.085e+09            +2.8%  6.254e+09        perf-stat.ps.branch-instructions
     21348            +9.0%      23273        perf-stat.ps.context-switches
   6.9e+10            +2.3%  7.059e+10        perf-stat.ps.cpu-cycles
    201.61            +7.8%     217.38        perf-stat.ps.cpu-migrations
 2.498e+10            +2.9%  2.571e+10        perf-stat.ps.dTLB-loads
 8.154e+09            +2.7%  8.373e+09        perf-stat.ps.dTLB-stores
 6.855e+10            +2.9%  7.053e+10        perf-stat.ps.instructions
    369608 ±  2%     +20.8%     446351 ±  5%  perf-stat.ps.node-store-misses
 9.519e+12            +3.0%  9.803e+12        perf-stat.total.instructions
      0.00 ±223%   +1490.9%       0.03 ±109%  perf-sched.sch_delay.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.01 ±  9%     -94.7%       0.00 ±111%  perf-sched.sch_delay.avg.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap.drm_gem_fb_vunmap.drm_atomic_helper_commit_planes
      0.06 ± 21%     -86.5%       0.01 ± 17%  perf-sched.sch_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.__x64_sys_nanosleep.do_syscall_64
      0.12 ± 31%     -89.2%       0.01 ± 68%  perf-sched.sch_delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
      0.06 ± 67%     -67.6%       0.02 ± 40%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.03 ±  2%     -36.3%       0.02 ±  3%  perf-sched.sch_delay.avg.ms.futex_do_wait.__futex_wait.futex_wait.do_futex
      0.21 ± 12%     -87.8%       0.03 ±  7%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
      0.05 ± 14%     -78.5%       0.01 ± 14%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.do_epoll_pwait.part
      0.03 ± 43%     -70.0%       0.01 ±  9%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_poll
      0.22 ± 56%     -94.6%       0.01 ± 41%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_select
      0.02 ± 27%     -54.8%       0.01 ±  6%  perf-sched.sch_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      0.00 ±223%   +3636.4%       0.07 ±169%  perf-sched.sch_delay.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1.11 ± 92%     -98.3%       0.02 ± 11%  perf-sched.sch_delay.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      2.06 ±  6%     -98.4%       0.03 ± 15%  perf-sched.sch_delay.max.ms.do_nanosleep.hrtimer_nanosleep.__x64_sys_nanosleep.do_syscall_64
      3.22 ±  4%     -63.6%       1.17 ± 98%  perf-sched.sch_delay.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
      0.67 ±129%    +808.5%       6.12 ± 52%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.00 ±223%   +4066.7%       0.04 ±153%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
      0.02 ± 32%    +715.6%       0.12 ±149%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
      2.22 ± 14%     -43.5%       1.25 ± 30%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.do_epoll_pwait.part
      1.84 ± 48%     -91.5%       0.16 ±169%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_poll
      1.68 ± 55%     -94.8%       0.09 ±164%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_select
      0.35 ±130%     -93.5%       0.02 ± 25%  perf-sched.sch_delay.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      1.34 ± 35%     -97.2%       0.04 ± 48%  perf-sched.sch_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      0.03 ±  3%     -37.6%       0.02 ±  3%  perf-sched.total_sch_delay.average.ms
      8.33 ±  4%     -18.9%       6.76 ±  3%  perf-sched.total_wait_and_delay.average.ms
    162856           +20.3%     195924        perf-sched.total_wait_and_delay.count.ms
      8.30 ±  4%     -18.8%       6.74 ±  3%  perf-sched.total_wait_time.average.ms
    213.84 ± 51%     -87.7%      26.25 ± 77%  perf-sched.wait_and_delay.avg.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
     15.84 ±  2%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap.drm_gem_fb_vunmap.drm_atomic_helper_commit_planes
    800.53           -15.3%     677.82 ± 13%  perf-sched.wait_and_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      2.37 ±  2%     -21.9%       1.85        perf-sched.wait_and_delay.avg.ms.futex_do_wait.__futex_wait.futex_wait.do_futex
      1.38 ±  9%     -51.8%       0.67 ± 42%  perf-sched.wait_and_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
     38.24 ±  7%     -12.2%      33.58 ±  7%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
     61.60 ±  3%     -24.2%      46.70 ±  2%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_poll
     13.33 ± 24%    +217.5%      42.33 ±  9%  perf-sched.wait_and_delay.count.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      0.33 ±141%   +5300.0%      18.00 ± 12%  perf-sched.wait_and_delay.count.__cond_resched.mutex_lock.perf_poll.do_poll.constprop
    196.50 ±  2%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.ww_mutex_lock.drm_gem_vunmap.drm_gem_fb_vunmap.drm_atomic_helper_commit_planes
    152066 ±  2%     +19.5%     181763        perf-sched.wait_and_delay.count.futex_do_wait.__futex_wait.futex_wait.do_futex
      1290 ±  6%     +27.7%       1647 ± 12%  perf-sched.wait_and_delay.count.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
    272.83           +16.9%     319.00 ±  2%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
    238.33 ±  4%     +24.8%     297.33        perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_poll
      2356 ± 47%     -66.5%     788.64 ± 92%  perf-sched.wait_and_delay.max.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
     44.95 ±147%   +2131.0%       1002 ± 69%  perf-sched.wait_and_delay.max.ms.__cond_resched.mutex_lock.perf_poll.do_poll.constprop
     59.34 ± 41%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap.drm_gem_fb_vunmap.drm_atomic_helper_commit_planes
      0.01 ±146%  +30486.1%       1.84 ± 31%  perf-sched.wait_time.avg.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
    213.84 ± 51%     -87.7%      26.25 ± 77%  perf-sched.wait_time.avg.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
     15.82 ±  2%     -96.0%       0.63 ± 66%  perf-sched.wait_time.avg.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap.drm_gem_fb_vunmap.drm_atomic_helper_commit_planes
    800.27           -15.3%     677.81 ± 13%  perf-sched.wait_time.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.61 ±  5%     +15.0%       0.70 ±  7%  perf-sched.wait_time.avg.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.34 ±  2%     -21.8%       1.83        perf-sched.wait_time.avg.ms.futex_do_wait.__futex_wait.futex_wait.do_futex
      1.05 ±  2%    +199.9%       3.15        perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      0.11 ± 17%   +1066.9%       1.23 ± 12%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
      0.47 ± 38%    +148.3%       1.17 ± 30%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
     38.23 ±  7%     -12.2%      33.58 ±  7%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
     61.57 ±  3%     -24.2%      46.69 ±  2%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_poll
      0.00 ± 49%   +5108.3%       0.10 ± 73%  perf-sched.wait_time.avg.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
      0.01 ±142%  +28030.6%       2.30 ± 23%  perf-sched.wait_time.max.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
      2356 ± 47%     -66.5%     788.64 ± 92%  perf-sched.wait_time.max.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
     45.07 ±146%   +2125.3%       1002 ± 69%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.perf_poll.do_poll.constprop
     11.69 ±  6%     -17.3%       9.67 ±  9%  perf-sched.wait_time.max.ms.do_nanosleep.hrtimer_nanosleep.__x64_sys_nanosleep.do_syscall_64
    237.73 ±143%    +561.4%       1572 ± 61%  perf-sched.wait_time.max.ms.futex_do_wait.__futex_wait.futex_wait.do_futex
      3.69 ±  4%   +1614.4%      63.33 ± 48%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
      3.90 ± 26%    +959.8%      41.38 ±100%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
      0.04 ± 50%   +5947.9%       2.19 ± 52%  perf-sched.wait_time.max.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

