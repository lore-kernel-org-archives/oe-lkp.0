Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EC62F9990
	for <oe-lkp@lists.linux.dev>; Tue,  2 Sep 2025 14:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756823744; cv=fail; b=UwPCd5btgat6md1so57qMsmgD/2LlqIffkFfF0wdmyBHxS7qHVh6QJQeqHSKQ5QMtlshwbCStFlHalpR08aX5+dAISYNl3d9CBLYZyPKLdwkTz6OcY/miYGQyUP4YF0GDh82oPILkIBb18XlQyrRAE8nVyeM0NtANkOeWye/4GY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756823744; c=relaxed/simple;
	bh=kRuyr8ZsEiuK1OdwHaCFzotpTgZ7pojl4Hzdz4QKyYc=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=tCoH4IyYCqvl31ltopbUiAMF/cN8MCbA+pod+cUGOgjtREqU9Wd+ph7H/woddM+NUdrtsPvs+n3ALzxf5miiFqExGmXCom6FscjbVQPn4e0y/4sRFY1Y+D+QS76F92YUv+b5uEL5i1ra++mUfEbpzyE2Z+LVh/fRkPssLDqLyJ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FfCfuIwU; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FfCfuIwU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756823743; x=1788359743;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kRuyr8ZsEiuK1OdwHaCFzotpTgZ7pojl4Hzdz4QKyYc=;
  b=FfCfuIwUm/vPPoarE4gx8a3w/t5vI/VpriIfb1UHUOoTkRHP7ZI+ZFBl
   0WH4SmJZWPFVY5Mg5j6uB9R/ajUnAWY/d1SIgFhNIIqCi2OQ59H0QtGnA
   IKSPXkM/evijRmm5Fpj7f4A3+G8HnYDJmxFP31Tr/4a4cgXWydjlzwLD6
   2jly0z6XTOq29Xbzw9zRkna7AN202/qvPZHPOI+Ye52islu8BanRm0i6h
   n6RCytxmTA9AAtECeWJsnFUJqPNAcVS7o29oivSRhOZj9/GR7+0BsgCsy
   DU6oF2vmoyIz5b/kVNKRmpRil7zqBaM//b0/XIAdj2x7O1B5hZd8oViLD
   Q==;
X-CSE-ConnectionGUID: R9bweB1JRc+gq159ZSDdGA==
X-CSE-MsgGUID: B1Us6mDZRoeR47O3fdE92g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="81684933"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="81684933"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 07:35:42 -0700
X-CSE-ConnectionGUID: xxeP2a6AQT6N9M42f5Q19g==
X-CSE-MsgGUID: m189xLqWSNWtg5eC3W78Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="208484306"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 07:35:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 07:35:41 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 2 Sep 2025 07:35:41 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.49) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 07:35:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q4o7/19bnlf0NV6c40pJy/FwBG0GnhwhNgumzj02rI4CCmzquHpqfwmReibH2y/YHJRT1y0Rhq3ctZ0AG8lyVOG2uKngTWabxmL+eD6qFBlbQd/LD4wije0zWgTW3aPqQQOG8ypku5STCJb0iOoGUN90LdErIqJh5bhBjxQ0Y74U0lWSaQtH2iFnF8TAa1MWWM2SYU66hHFYoObdm7hVYMEmR6hwuIem/pVKWDZGrcOFaa8TtoSOGDNZ/wdqrTVC4H4iEI50RWN24Z+5n1p/nljEhT55C4uCxy18KsLRyYy7ToF4jpoAlDbnup0jZJqC1RheayQkGWKNelZEq6j2wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nRYXQFyo2VJU4ahlUEQ+xF1Pzl6X4Q1qLpiyzSeFUHg=;
 b=qDVUPv8jT7VqBHsbcasB9h5AWjvKIiwSSy9N+NqWMoDGaD8zoyXJEAMLy2mO2onXubyIZqNpmGj+vcucvE+iRbItwW1pU9zxMuBPi/ivRklobwK8uFTgg9F3O/r7otAHFIjf4zBQIeq8KpsZC0RC0oBRaIY2bv38oCyEv26KOrkAo/6WDzw7fspwU2lep5ANxvVvAZIBD/ZNdyles8oBpZbvRluu8wdZxs2MkdPYFcrZICF+zlgNOv/0/6ZK2PYwCaQMJgSsqNUYE6pjqn2tm1sVfjSWWEQfekPU5N5g6NaLv2Sewuh7Okfs3iEYnM35fIe2a9sp4FWHLkTdA5BoIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CY8PR11MB7686.namprd11.prod.outlook.com (2603:10b6:930:70::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 14:35:34 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 14:35:34 +0000
Date: Tue, 2 Sep 2025 22:35:26 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Matthew Wilcox <willy@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [willy-pagecache:slab-future] [slab]  d7a6fafee0: RIP:__ksize
Message-ID: <202509022248.dbe9cc08-lkp@intel.com>
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
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CY8PR11MB7686:EE_
X-MS-Office365-Filtering-Correlation-Id: bb59e6b2-f2b8-46b6-ca8f-08ddea2df9bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?y3OLUhsa6uuRiXVYvR0/Hctg0K9EGyJWsReQQw6rg1+9MKfxfDnEQB1ImMR0?=
 =?us-ascii?Q?oXAy8Dp5d83E3YDcs31dBX4NNldDFfXX+SziVRm/lg3gfMNj2Yrxz6sPNVIV?=
 =?us-ascii?Q?nvwvje+nqYkWK5RJVzzHYLAy9pLRFeVyGWJS0WOD9UMDnYNbh/Fpz0+tQBIz?=
 =?us-ascii?Q?nNVP5QJ5NUlRAZ0Ovkq+hrfSYEyUw0clCDUHLn6o8Apugeed0mSWuferY5lD?=
 =?us-ascii?Q?D8k18sXkWvj0H/KFInWwmx9ScHBCrxsdH5F7393smAOZKbWNorjjiF7lsqr0?=
 =?us-ascii?Q?swzI8Te/qNWXIMmOVqqYTaiGL4uT9NOoZSehFRAgB6aEXRY/Bz9qZ/dAZeQ4?=
 =?us-ascii?Q?bylS9CUh2IPVuKFlb3M0sPwj7PMgXtNB2KIzQpFLfCtwdseBJem2bEeL/fr2?=
 =?us-ascii?Q?IEuVXM/OiZm15RO6IZyDYDojL+jVMinQEHxYNdqF3LQvtR1+Z7z46wlBXTgo?=
 =?us-ascii?Q?I3pPs4k2pPczRWMiTTGOraquWK9BAKR8jNPQ8MFyH6sY0TkZ8fg69KEAgYB/?=
 =?us-ascii?Q?T9rBEV111NoCYUsRNcgiYXWZQVCpnwqI6nFgsks5gOQeTp3HNt/RNlBya4BI?=
 =?us-ascii?Q?wFnZeRoiAVMqY2MeGxHDRLZ4hAQDKFj1GB3tIxKrY+Njq9FRCB6q/XVc/kEP?=
 =?us-ascii?Q?erhR0VxSzFB0GfPSY58npNtnQ+zlgQHJIkP7u/IfOeLZ/rF3tyMoCthOccbU?=
 =?us-ascii?Q?YKYIfnVCMwSG8IJtyDUF1X0/QJYW3PbR44+LLiMEuKNJ7n1+OvpofS84215D?=
 =?us-ascii?Q?AE3NcBUVAR1T4UOISVoO8R9opjtqPsAUM2uF/LqviciX3tEr48N+TF3NQCva?=
 =?us-ascii?Q?OWcQ3ZJ8xnEAMhVuvTxNERIrpJTvxIx7M5DzBKh568BvMQbvd/BmLMpLcbWQ?=
 =?us-ascii?Q?bLsHPccgwFU5YhsZm01GIfOhhQp1/VSO9wSLSgCZBo10VBxOav6D6vIa2W2E?=
 =?us-ascii?Q?izPEzPi2K4sNzSsLGVDNMRgTlAcu3/eT0nTbW5xmqkz2J/krmgJhcWseWW/C?=
 =?us-ascii?Q?1yjY5jSzIZWH6QCSSZTVaMs9AGpdC9FtU+AxQScXsJ9c8lHd+71kuR/0UUYQ?=
 =?us-ascii?Q?JGLIbANcGz58T6N1n/m5YD7pn6zv0PKR/GlnSthsHGcEiS/5xFVmxbm/Z+8/?=
 =?us-ascii?Q?RBVO/r6K4L3z9OTQUWCE+chcVyZwR9hBTkKmfKD/UiHmbBGQuQ+pqEXrOPfE?=
 =?us-ascii?Q?m+nzHszco7nsDWksA/cHG8iOxLLr7GSSi4CssSyEvgcZIralPFQVWlGO27tD?=
 =?us-ascii?Q?zO5BVNDmtbjdIJKEZMM3paVW7XN2tOMDjYEsF7rccyfQPp6o3cpT2ssbtkXm?=
 =?us-ascii?Q?2zD3pTH+xaIG5hQMDaur1ge8oGFgsLH9DsJdEnmR4yfUNa24gBEryB/lAagb?=
 =?us-ascii?Q?5RQwlqUIWD0yeP0gvbpHCnUvyKtX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3BITMGE8Qum4jor3zIZq0I8JzY0CE+WmC47tXsttpEPDBZg2JlKNVpMvm4Kv?=
 =?us-ascii?Q?CQcbT3uOA4IlR7ZI1C4KX6E6BvoCn5x8/vVac/nls9Y8ffSqD9aYCZ/T5RqY?=
 =?us-ascii?Q?qdTQn41cPjTHIb4IapAdHW0b6YeZWKop+FkB4QhmUKpa5g2bCzko9NUK3Yzv?=
 =?us-ascii?Q?EJ+OlMenXhmWWY+YcmA3FaUYB3StssXv71yxRKWSz4XZmoxD8q7vjbDegFu/?=
 =?us-ascii?Q?O3w4qq++0b/VjY/APX6XdfGxp8Ojed8IhFHbHbViuJgJbjZdCAYiBR50lZmC?=
 =?us-ascii?Q?ZwSeL9rtrxcz+hcuWD7fVUu4lyNsHgQPKG8blWZo2t1JJSSLHXJn5GcKaoL1?=
 =?us-ascii?Q?WS2jEvx+yqIbSYZlgZSx2RprfCOQCn5tBLFvZCUGe7Krvqs/ktfpwNqh03cZ?=
 =?us-ascii?Q?FHJ0lTDOdt7uLZd0/VEAZh+oCKfLDyFkELsVlMLL/viqASqDODOq5u3RkYTL?=
 =?us-ascii?Q?yLxUQW2L5NqnkqMd+q7p8+cGI49LEyZ8qaL+j0mf5KAGKrf+oYhvrK6xDbfa?=
 =?us-ascii?Q?VtiPkgleepVDYna8JBKg878sQAiQCFhTUz2t3ZDnKgmQdaP/Bp01ysKSppQs?=
 =?us-ascii?Q?l5nQJRAP71rwQs3KHDiinIMbHZGM+iOM3khI/VH+KJHF1yg+wNGip7fyNFyl?=
 =?us-ascii?Q?NqAPoPDzqvp7/zTzckG0y8p8BXTxg7Whtch4CQ9LZhuMqY5UMYHX7cPOVwgC?=
 =?us-ascii?Q?uFOTg03D/gGdT2vAYjkV7ysAYuwpWtndQgTu75dlVo6f7jgeZFl5SrObgjXv?=
 =?us-ascii?Q?Ypz5TGpf59FTG1D9JfZomhMOFhAGYh7GKQG57GX6NH5QB3pdjMp61rPnfA2e?=
 =?us-ascii?Q?86kGcD6GnrvrCrJedWMchVQ1SNSwz9pvf9eiokgJz/aFoQHqbFbDmyI+/+if?=
 =?us-ascii?Q?849NfcCOuDLELGnglxalYk+3qKWOxf0AW9/Mam4OPCPXgSYyFcI1ZNOYJsDI?=
 =?us-ascii?Q?BE53ZfqRwn1sZH6dUOKc7/pVfpIhkaHektNS2h2yR9uQdrf00YszYLQ7ZiCC?=
 =?us-ascii?Q?dkNnxm4aOU603oGfmjkPasqOydcme8vdIrOEXf3QDD0otg3aARnTUc/KGfWl?=
 =?us-ascii?Q?z0sKmyLavxvPKZVdlkVddhBkMBU9yOJylmTj+8EW2k0ITVcBbIrNutsFTe8b?=
 =?us-ascii?Q?cv2aTbihXkhdrSHr/jP7N1swnywqWEv5DVh/V2F114avsssfzVFAaB4MhX6R?=
 =?us-ascii?Q?AErcVklmt+rc93CbAg6odic/DsDLhnacX8CFmUEAtvUhttM9kI3cwbdElEiw?=
 =?us-ascii?Q?cCbqhBrC5TmL2rpaMl8MQ8MNauh4/ari3Ev6OzQc9dVw9Mt5QPTqT79aNA8O?=
 =?us-ascii?Q?SvsgAwUMiysDZ3i/MepSbmDa95yvyvqstRPvunQOSH+ilJRJMQmZhvXUDjJc?=
 =?us-ascii?Q?qsqG/0/PqmYgmkWwajKZrVytbd8GXbZRAH1gqUpeR1nDLN+JUtDoN9dsmvlZ?=
 =?us-ascii?Q?joDCyNpZC6miPCo7F9W7HzsuO5LUSj7u6frKerbvDhGd6gi9J76ICwVpmc4z?=
 =?us-ascii?Q?Ox7/zyKPLbI8THQBey8/B8mJcrqYlaJpJ65ycGXmo9Fw8P6SdaJy2BKozCQf?=
 =?us-ascii?Q?uG+G01+uUYehKC+TBidVzM7+kf/ZSGzd0GRPodi7xxog55vaqe7BXgkpA5rR?=
 =?us-ascii?Q?+Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb59e6b2-f2b8-46b6-ca8f-08ddea2df9bf
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 14:35:34.2361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f3C8PFd9C/015E4Mp2AHTDfhHp2BtCwxcaqSHNRv2ksma1jwbepXEKqEZDdLYvyRQ6K17+1OUuy/a9VofqVMEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7686
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "RIP:__ksize" on:

commit: d7a6fafee020f8dbe5863d2b6c2e8af5560df707 ("slab: Remove folio references from __ksize()")
git://git.infradead.org/users/willy/pagecache slab-future

in testcase: boot

config: x86_64-rhel-9.4-rust
compiler: clang-20
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202509022248.dbe9cc08-lkp@intel.com


[   33.277388][    T1] ------------[ cut here ]------------
[ 33.279697][ T1] WARNING: mm/slab_common.c:1016 at __ksize+0xf2/0x120, CPU#0: swapper/0/1 
[   33.285126][    T1] Modules linked in:
[   33.286841][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.17.0-rc3-next-20250829-00007-gd7a6fafee020 #1 PREEMPT(voluntary)
[   33.291730][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 33.295871][ T1] RIP: 0010:__ksize (mm/slab_common.c:1016) 
[ 33.297925][ T1] Code: 40 b8 00 10 00 00 48 d3 e0 48 3d 00 20 00 00 76 3b 49 29 f8 49 c1 e0 06 49 01 d0 4c 39 c6 74 cf 0f 0b 31 c0 c3 cc cc cc cc cc <0f> 0b 49 f7 00 40 00 00 00 75 04 31 c9 eb 05 41 0f b6 48 40 b8 00
All code
========
   0:	40 b8 00 10 00 00    	rex mov $0x1000,%eax
   6:	48 d3 e0             	shl    %cl,%rax
   9:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
   f:	76 3b                	jbe    0x4c
  11:	49 29 f8             	sub    %rdi,%r8
  14:	49 c1 e0 06          	shl    $0x6,%r8
  18:	49 01 d0             	add    %rdx,%r8
  1b:	4c 39 c6             	cmp    %r8,%rsi
  1e:	74 cf                	je     0xffffffffffffffef
  20:	0f 0b                	ud2
  22:	31 c0                	xor    %eax,%eax
  24:	c3                   	ret
  25:	cc                   	int3
  26:	cc                   	int3
  27:	cc                   	int3
  28:	cc                   	int3
  29:	cc                   	int3
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	49 f7 00 40 00 00 00 	testq  $0x40,(%r8)
  33:	75 04                	jne    0x39
  35:	31 c9                	xor    %ecx,%ecx
  37:	eb 05                	jmp    0x3e
  39:	41 0f b6 48 40       	movzbl 0x40(%r8),%ecx
  3e:	b8                   	.byte 0xb8
	...

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	49 f7 00 40 00 00 00 	testq  $0x40,(%r8)
   9:	75 04                	jne    0xf
   b:	31 c9                	xor    %ecx,%ecx
   d:	eb 05                	jmp    0x14
   f:	41 0f b6 48 40       	movzbl 0x40(%r8),%ecx
  14:	b8                   	.byte 0xb8
	...
[   33.305617][    T1] RSP: 0000:ffffd2b500013758 EFLAGS: 00010206
[   33.308164][    T1] RAX: 00000000ff000000 RBX: ffff8afbc1151000 RCX: 00000000ffffff01
[   33.311355][    T1] RDX: ffff8afac0000000 RSI: ffff8afbc1151000 RDI: fffff31e80000000
[   33.314664][    T1] RBP: 00000000ffffffea R08: fffff31e84045440 R09: 0000000000000000
[   33.317962][    T1] R10: ffff8afbc1151000 R11: ffffffff89ff2090 R12: ffff8afbc3133220
[   33.322047][    T1] R13: ffff8afc76ef1108 R14: ffff8afbc3133e00 R15: ffff8afbc1151800
[   33.325523][    T1] FS:  0000000000000000(0000) GS:ffff8aff63a29000(0000) knlGS:0000000000000000
[   33.329151][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   33.331822][    T1] CR2: ffff8afefffff000 CR3: 00000002e1e20000 CR4: 00000000000406f0
[   33.335127][    T1] Call Trace:
[   33.340398][    T1]  <TASK>
[ 33.341827][ T1] kfree_sensitive (mm/slab_common.c:1234) 
[ 33.343783][ T1] mpi_free (lib/crypto/mpi/mpiutil.c:?) 
[ 33.345494][ T1] rsa_enc (crypto/rsa.c:62) 
[ 33.347230][ T1] rsassa_pkcs1_verify (include/linux/crypto.h:383 crypto/rsassa-pkcs1.c:256) 
[ 33.349482][ T1] public_key_verify_signature (crypto/asymmetric_keys/public_key.c:432) 
[ 33.352192][ T1] ? __kmalloc_noprof (include/linux/kernel.h:?) 
[ 33.354454][ T1] ? asymmetric_key_generate_id (crypto/asymmetric_keys/asymmetric_type.c:147) 
[ 33.357247][ T1] x509_check_for_self_signed (crypto/asymmetric_keys/x509_public_key.c:126) 
[ 33.359744][ T1] x509_cert_parse (crypto/asymmetric_keys/x509_cert_parser.c:130) 
[ 33.361690][ T1] x509_key_preparse (crypto/asymmetric_keys/x509_public_key.c:157) 
[ 33.368645][ T1] asymmetric_key_preparse (crypto/asymmetric_keys/asymmetric_type.c:409) 
[ 33.371160][ T1] __key_create_or_update (security/keys/key.c:858) 
[ 33.373639][ T1] key_create_or_update (security/keys/key.c:1021) 
[ 33.376003][ T1] x509_load_certificate_list (crypto/asymmetric_keys/x509_loader.c:31) 
[ 33.378485][ T1] ? load_module_cert (certs/system_keyring.c:280) 
[ 33.380708][ T1] do_one_initcall (init/main.c:1281) 
[ 33.382872][ T1] ? crng_make_state (include/linux/spinlock.h:406 drivers/char/random.c:363) 
[ 33.385184][ T1] ? get_random_u32 (include/linux/string.h:366 include/crypto/chacha.h:119 drivers/char/random.c:425 drivers/char/random.c:554) 
[ 33.387436][ T1] ? __get_random_u32_below (drivers/char/random.c:568) 
[ 33.389903][ T1] ? allocate_slab (mm/slub.c:3073) 
[ 33.392145][ T1] ? sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1050) 
[ 33.394715][ T1] ? asm_sysvec_apic_timer_interrupt (arch/x86/include/asm/idtentry.h:697) 
[ 33.397519][ T1] ? strlen (lib/string.c:420) 
[ 33.399382][ T1] ? parameq (kernel/params.c:90 kernel/params.c:99) 
[ 33.401356][ T1] ? do_initcall_level (init/main.c:1327) 
[ 33.403660][ T1] ? parse_args (kernel/params.c:153) 
[ 33.405789][ T1] do_initcall_level (init/main.c:1342) 
[ 33.408096][ T1] do_initcalls (init/main.c:1356) 
[ 33.410025][ T1] kernel_init_freeable (init/main.c:1593) 
[ 33.412141][ T1] ? rest_init (init/main.c:1473) 
[ 33.414170][ T1] kernel_init (init/main.c:1483) 
[ 33.416292][ T1] ret_from_fork (arch/x86/kernel/process.c:154) 
[ 33.418432][ T1] ? rest_init (init/main.c:1473) 
[ 33.420469][ T1] ret_from_fork_asm (arch/x86/entry/entry_64.S:255) 
[   33.422651][    T1]  </TASK>
[   33.424207][    T1] ---[ end trace 0000000000000000 ]---


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250902/202509022248.dbe9cc08-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

