Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C9329413
	for <oe-lkp@lists.linux.dev>; Wed, 12 Jun 2024 04:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718167799; cv=fail; b=gzeOshytSZezUJDJEr641j92qaAEoWohCcpzwY5DDRhUgs/dcwd28g/TGq6Pou0HI556PUwul2+aUMsapL+4/iY8oCUlANpwen/HJW0xYJIILneRw3ZU0Uzh1tTp7j5spulF3wVcyAPJ+vGQ9MkcIXuewUnMNjLsI2HzWSWUE5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718167799; c=relaxed/simple;
	bh=PV4SIq1XGJIeMtH1PObYNXf46PF39MBbcrR/DV7vhMk=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=jkc+DfBfi1DdCT8xQBRw4UHOg/a/VgNAZuGkTBwFtebT5Xgy9rnr84oJtJDoCCsqzLwKAqBFzjb5//79Q8BLXHj6ZBzyEDrsGqaH4Qb3HQ8pU1GfEuI1NlE+ILt/Gefm/r3gCzyoa0a58w8ypkNLTYag+JwnYPGXPi/60ikQk8k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fzdeA5eo; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fzdeA5eo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718167798; x=1749703798;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PV4SIq1XGJIeMtH1PObYNXf46PF39MBbcrR/DV7vhMk=;
  b=fzdeA5eodZC0gR7jisub+psUtzrS/+bI+rd0tO1iKCKj/vgFSL/8ztNQ
   HivwpYmxbtK98kj23YNAaG1Ywn1Jn6Q6VPCyETCATeulInbK5f9SUWagY
   UjXg3I3mL2lgOq91Uc53d/JC9gxWDAWZJVO2txlcH0qPMmMyBWxVJ/JoE
   mOWNoHViwDAbnY2P6I7L+1d/0UQsA3OiX23vkC5xcdzkCZ0HW3RkDhYd2
   VYD8dQlt2ndvu3tYntBiMUmbxhpPZiGjhtLuF0FUaL8FZmK5NBBpPS70o
   gVFqfsHTaIvGlsR9JsZtHqSYcHGefhfiv4jxIkdLrBB3vw9+60nfAcmfa
   g==;
X-CSE-ConnectionGUID: Et1qNoq0QtKvE+Hu5HSYWg==
X-CSE-MsgGUID: iPyTZC4oQJOHtjcOq5PX3w==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="40319702"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; 
   d="scan'208";a="40319702"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 21:49:57 -0700
X-CSE-ConnectionGUID: CD/xy6FjSwyJC4cMwbdJQg==
X-CSE-MsgGUID: EGDXmiAtRxCkwBOLG9pyuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; 
   d="scan'208";a="70455297"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 11 Jun 2024 21:49:57 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 11 Jun 2024 21:49:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 11 Jun 2024 21:49:55 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 11 Jun 2024 21:49:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SF2XmYPMVk4gYCv3lLWrPTUAt+aRvSs8fqoCXVoRw8nVZ3xSuYj/O9Y2ddjueCSwFw3lT0OfSMAob76zIMN4m3y3D3EMv/nmWTKN2z78Ogb8YNn3hoaVW2o4xRPsGV57JvVBcpwpkV5meMjjsvnFukHmw353ghb0GK5XKWdeXv7UpCWtphWfCUn9QvCAkXa92oD3Mx5ysGfePnh4aemKGZkUPDiuj66bUjAmtgX+DhYiB3adYMQJnEeYMqB6u1dKcIv1k5RSSYmrGCJqH6ZL88vf1TBX8a8nspHfzIks0cxE5N2oG2uDUitHefRWW1USRtGD/o2CIhtWuQ8N4vvjOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ATZg+mR47FQsm7QZnaiFrGdAMD/W9iiLg9OZv5VGXu4=;
 b=TnmpNqthQ2/JWYVJimgj4yh7et3mvsA8Xshbkrkh4wUNk02tLYB9yDEQrBMELtovXpCww0AmexbRNEyVy7NwyML5MUIjUbMp3NdofVXtu/VwByA5oRRkn3/gGL/fK1iUZE7AzkHrDqdL6Rv4E8jQSMI+85b6CTyruOmA3j7Prdw3LObb/9AY0tPq4mwJdtIjAvEqPhfnMQeimbuEdGxZ9mlQr5cLFdw6W8Lmq4D57TRZZdJDLcvjRCZaSToyDzStLU5vF8qDeHrTpwAm/RaxoNc0W/ExY/N9pwHbrV5fqkkhLJHcLcvoc4gMbrnxRQuGqtRAysKUAI+wt1tcuotL1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MN2PR11MB4709.namprd11.prod.outlook.com (2603:10b6:208:267::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Wed, 12 Jun
 2024 04:49:49 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%2]) with mapi id 15.20.7633.037; Wed, 12 Jun 2024
 04:49:49 +0000
Date: Wed, 12 Jun 2024 12:49:39 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Yosry Ahmed <yosryahmed@google.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Linux Memory Management List
	<linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, "David
 Hildenbrand" <david@redhat.com>, <oliver.sang@intel.com>
Subject: [linux-next:master] [mm]  5d4a36365b:
 kernel-selftests.cgroup.test_kmem.test_kmem_memcg_deletion.fail
Message-ID: <202406121026.579593f2-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG3P274CA0015.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::27)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MN2PR11MB4709:EE_
X-MS-Office365-Filtering-Correlation-Id: 62692a78-aa48-4923-13c7-08dc8a9b1714
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230032|1800799016|366008|376006;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?K6/qMviq74vY3MIiKgt85lLrGNTugJJaQwLgAWp9ht911loCxXhpvZ00rc9S?=
 =?us-ascii?Q?1+B9IQA8opSwltL7rOxP2WmsYbfaqLpOkRYIGWIVHz+MxoKWKmzJYtRTZcI+?=
 =?us-ascii?Q?V2MkVZbJlKWEWccDkykVJuOwSDsJiAidsKNi9KebW+D+wk3wrdvcx1rH0oSz?=
 =?us-ascii?Q?l/5hPBfejnH9S4VQ+fMA0ifV3Cdk449TxV021+p/A9FHb+GGSsLyT1chytk9?=
 =?us-ascii?Q?EZaGTxIFVd0CcPHS+VPajwOvC1ZTlFBsicDmshqKy6mJ3/CSisz+uvbKgOH+?=
 =?us-ascii?Q?S546rRwNwew8LqS0qViwhfNb3eLC1+ySDL/C6sW7ZdDohcpoq0fUjmb7NkYt?=
 =?us-ascii?Q?m55NaCJg936rD0ZWC0ABeyNAHkl4/Fg2u9TZQkA09L/Af12TKqrkRXNH1Xhr?=
 =?us-ascii?Q?6yRXp3+xDENDs56zfUSBf3u2ZX+XIteKZz0iocs1RInvHPJ79WVfm1elfH7Y?=
 =?us-ascii?Q?v54XTB16a0l7QpyFxlHv/nClN7XNA40HTdxZ0SzypPW/yDw11FAn0Zfs9T8K?=
 =?us-ascii?Q?M2RFmnLeWLMCpcmI2OYBgtgxhIjct+FOgQMlxlJ1gJZArN52ZKeZmWltgZpI?=
 =?us-ascii?Q?GoE1hMIOCCGfh94uCcHSvZmQjTZW4EwsT/wPPLMceLbQGWhqiUD3g/ocBtEW?=
 =?us-ascii?Q?PBMU0uZsHXm2tKZc0r6uQ0XRzRpQdDO3qNVznHunJhpFqYD6BAZdX5BmiMMb?=
 =?us-ascii?Q?k/XKKXscKJQeNp4IwmcTHoBuxpHoM7342oiYOiFLifUXPrvCtc1EIecTn+yX?=
 =?us-ascii?Q?Rftd98jhXDtbSyE0A3Zcc0a0rTrAHnUrFGND1TvojiZsDx3g991wlmxzN1tJ?=
 =?us-ascii?Q?Qc8Cyx+7SowV0LFT/ElJD+0uv94n55qyTxWpWxN8YqTRktyiaxMcv27Mea9J?=
 =?us-ascii?Q?tfcE9GiQy1VcVaDV2Yf3HzVyvbhqgpxjf3ClQh0uwW1iKUFfrlv1QOB2hs2C?=
 =?us-ascii?Q?g/nWnRhs6ASL7PqUfvXqEfQFRoNNCYD2prcBEM1Tf5wOJqRDxTFYpF5/sp4k?=
 =?us-ascii?Q?dXSdH5hPD95vmfzUw5kvT1p72V1EQxEMMCSHD1Ob9wmuLx6Lc3BkNjVFZQ0a?=
 =?us-ascii?Q?RjZj3D2w7P+1jnSh7H99e5TxK86uyusT9r/pP4LwNFMp5f4r6kPo2IIQpy8x?=
 =?us-ascii?Q?+ImDN+17TRBUswwuUB7yehBsXR3yVZNwmcEyTvwHCW9004q6b2OeeVD6m5UH?=
 =?us-ascii?Q?evHmI3QihiTGAGParsxdcUO6x733Ozcv2WZucB11uLqxig5yOhiP6O02GV3E?=
 =?us-ascii?Q?//BpYyEuBCMi+ifIGbu80/ABpGriUB7vZee43GEs+A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230032)(1800799016)(366008)(376006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vMLpDZSUrXneadDuwQVlw2iGPk+KvK0yk1cR6sgrmUiyt53RLKIFDEEwPNTD?=
 =?us-ascii?Q?y/bAyVLirHeHIafhYKoztb1Heq7QTGkYNqmwdSfXzFzw+11bVb9vyOA/N6+k?=
 =?us-ascii?Q?2cG93CUKll7Bf5fCn2VWPloKJXlrAcOxvQKMIyWKoazM3qcLJ9zQgZqSicYG?=
 =?us-ascii?Q?e80I/iipjDAs05lFCZRLaPzUvEcVFkXGRcuc5vpHD3DQdmBWeb+smxd2NC9E?=
 =?us-ascii?Q?TgicAOZOVbm5P8YydU/37YrNCyGdtyMns8aafZolGMdxgU9glDFlPp0ZWPRz?=
 =?us-ascii?Q?z8qU9ZJHR4gahBfgnPMiqS3qZFm7JrvOGbD4oFgwrfljhrU0CvrMvV2a/84w?=
 =?us-ascii?Q?TMRuO6ZrzLTgwLfWKl+pyHmYH4wC78oo+INUWoyA5A0WkD4eNc6yfDGTu2+J?=
 =?us-ascii?Q?3xLssWfcdPIJMUvAO72Yn0uU27C3+XBdJn5sAlsPXsJJ9sDKQs9fGQimgADR?=
 =?us-ascii?Q?BeTAht800yH1HGnjYNrHbZFNcVItYD+AvPsIT9ZhpLiPR2km5AkWYeHBMTKH?=
 =?us-ascii?Q?zkfSoNI6iB+Nw0rbq0Y8pN7VaL0pwXnsQOJ7a+1B3SQtfWYqxfpuAFHgsnRX?=
 =?us-ascii?Q?dKT9/aBcsNyLFy53Psssj0tPMFNvmMFyxNWBnpbG+tL1OFX1xHJYuy89Prlx?=
 =?us-ascii?Q?m0y8tuHesV4Akq+tTDQ+Nv2I88LWatxCg+VjIpntJEOngFgsmiaMSORtNX21?=
 =?us-ascii?Q?klL/OW1sAg09S0KJXO2yi8PBQuO2NaXZ+KVkQLszNEduOpqHCUot2OtG31y5?=
 =?us-ascii?Q?Thmn680n0GLn9ZdODx+p66v+CAQ8ox+q48Ei4wSMiQWQjFPCTb91vBKiVZAg?=
 =?us-ascii?Q?Dl+0v3WqvOXrdpHR2lcjCfLSAGFznMDztEcI7rmPuFYgSfEGSUxul3A7e0Gf?=
 =?us-ascii?Q?LNniCGsKmPCW2uP5Mv0iBeqXaUsJQCkNOd0BLRz+/ZwA9zfR0dZ+mzG3BYJ6?=
 =?us-ascii?Q?bwBpNGcqiIAD30mcWEOZBsRzsEG0ycqvaacDFBEK9imakFLQ4w004MaFea+B?=
 =?us-ascii?Q?NqrTSTRuHqf9aCcZBNxaRyuCXYAy2UHpzjGcM4V6rzKwDal3UzChRFcWpCtY?=
 =?us-ascii?Q?MWwVkN0XRr4LBdBFwHS7yrwlQ7O4GQ9pTw9d6Z4X43SSSVc7RpXEy5bI7Jzz?=
 =?us-ascii?Q?IjBVIPYB7/UMLXCkHxQoC0eAHIfWtrt+q5qYLnG0S9ZsmUZ/vdHOolH0OWzQ?=
 =?us-ascii?Q?RuTKn6PYW1kmYYh83j6v+W2Nj5EPKp42NXaENVByyzY9isHRo8i8cCTxix+d?=
 =?us-ascii?Q?Lr8qRaGxKF4eGNJwVmWsWuLYcPn8NIpv10q4NIPvsyy2d+Tlo90ra1UNIaeQ?=
 =?us-ascii?Q?tpDyXqjV0/1O2XqRnBNAaigTCAkuDwrs/OmIcVfkwUpvzQ6QBfHOzw/WEpSA?=
 =?us-ascii?Q?yV1VPWSD4Ro2zmuu6Q40gU2I7kSkJzqkbNHjmdlNLOxgAeIJ7Oxh/v7W7dz+?=
 =?us-ascii?Q?dgcUE9ftIEZi9Jk8HXFVeUzusMBWaHLfAECA49UITyxVHT51HAAssPnRMmvh?=
 =?us-ascii?Q?+KfCql7vaAm7SsTpQgy5jI+AQQNm01IiX5ra+qx0YzzKLhyoFYbjmI/ZuI5M?=
 =?us-ascii?Q?112EI/DErnzcmJgPz+EOoNBFlVTDL4wOm+b6r487/oPi/zFL41N8urmGswEk?=
 =?us-ascii?Q?+Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 62692a78-aa48-4923-13c7-08dc8a9b1714
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 04:49:49.2146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oV3jn7XIO31TeUxxZuBMP/QX3q8pxFk2Av7wJ7U+LoLxgG5ogqsSFF4SEqNnnwaf04zsHADk1iN65KwOWFp4JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4709
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "kernel-selftests.cgroup.test_kmem.test_kmem_memcg_deletion.fail" on:

commit: 5d4a36365be0fc9085c192b0015b789ddfaca1f8 ("mm: rmap: abstract updating per-node and per-memcg stats")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

[test failed on linux-next/master d35b2284e966c0bef3e2182a5c5ea02177dd32e4]

in testcase: kernel-selftests
version: kernel-selftests-x86_64-977d51cf-1_20240508
with following parameters:

	group: cgroup



compiler: gcc-13
test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-3770K CPU @ 3.50GHz (Ivy Bridge) with 16G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)


bc80784601ad8fd8 5d4a36365be0fc9085c192b0015
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :6          100%           6:6     kernel-selftests.cgroup.test_kmem.test_kmem_memcg_deletion.fail




If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202406121026.579593f2-oliver.sang@intel.com



# timeout set to 300
# selftests: cgroup: test_kmem
# not ok 1 test_kmem_basic
# memory.current = 331776
# anon + file + kernel + sock = 34463744
# anon = 34406400
# file = 0
# kernel = 57344
# sock = 0
# not ok 2 test_kmem_memcg_deletion     <-----
# ok 3 test_kmem_proc_kpagecgroup
# ok 4 test_kmem_kernel_stacks
# ok 5 test_kmem_dead_cgroups
# memory.current 20328448
# percpu 13920000
# not ok 6 test_percpu_basic
not ok 2 selftests: cgroup: test_kmem # exit=1



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240612/202406121026.579593f2-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

