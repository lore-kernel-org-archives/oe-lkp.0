Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF08328467C
	for <oe-lkp@lists.linux.dev>; Tue, 16 Sep 2025 08:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758010266; cv=fail; b=AO0IfqOLln00g1EV7kVNsQPfTrotJAr4yrWGzuF7rOqZrkGt1hZuhb/ikN++uOvdTTSsoZrprKCZvG4nh6I/vEAWyjd4R4JrwkGD3OYoi3G+oJG+44uhmxwxwkKAcZlzsnSSTTWWUHLOytKLX4Am7dd13KHEKuPv1VdLrbFsXgM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758010266; c=relaxed/simple;
	bh=SVu8DAmco6cXNYNhUxzhUZFbxIgC95ZVWPM8grBiVEs=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=eMxcalLc2mJmEO7sfItguZD2fvGPd32otd1lQ01BX1dhvRZyPzXDLu1xturpFB+h5tu/ExVnZ2ywK+R52VlfUEZQr73jTNU8P1YGCYRN5PQ7qfuBzxtJ0+5+pVXEbRATPgPUj7zEGlmwR5yq5hYd4Qqp3jNaNbzXvLZsJMc45dM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B8ar/dbO; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B8ar/dbO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758010262; x=1789546262;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SVu8DAmco6cXNYNhUxzhUZFbxIgC95ZVWPM8grBiVEs=;
  b=B8ar/dbOgL1GXHI96zfqombFpdPHMHh1rxdn1yGuIEixahkIg6UqDZbn
   ZmEP+RdRwbvxgJkKhQHWbmTzqkSQlX0LNYKF768JesotHdsSWpqCZ1WvB
   hPIVh2MKPQKFrDbrK2JIz97duXwyMUCF6r91DqB1d+ZlHJVQ2mN/DbZ7s
   5W6sNZ1KkS/JP5xfyMYObQKw566zspRo/pOy7yMkGZwomJIV8mnRqNH5l
   sksSSrOGaC7LtfaaBC6aGPNaCPzEhjdT0K1meQWSyEMSBEWFLKPHnJxb+
   Q50RRb33LtrD2vLFHNsaVHRdUzWeFCZlbyy8UZXE2iyQ4Ol1iLg25D1M1
   A==;
X-CSE-ConnectionGUID: foU67pogSf2OEhtMue5ftg==
X-CSE-MsgGUID: OVHhAxCwTS2B3wjgaFj9Sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="60354544"
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; 
   d="scan'208";a="60354544"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 01:11:01 -0700
X-CSE-ConnectionGUID: M2yxbzFbRBO9vI9WQOk5kQ==
X-CSE-MsgGUID: vrE0ibGhR9SP3xMT3j6mhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; 
   d="scan'208";a="174686799"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 01:11:01 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 01:11:00 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 16 Sep 2025 01:11:00 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.39) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 01:10:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fa7QrInw42geuf1rCknyl5pqq9ICES/sVrElN41BXO4al1OCnUGqy9hAM/td+g0D2rq8FmVEALaX3qKWa8R50ZYUcO3Fhru5ciVwVuToSzLMbzmzZdU5e1g48DkElv7ctm7wsxU0tTBE1nV+/DRPoqe1y8z/pic0yFPHH29Y/d70qaPjw2V15gW+4pEbjUyfnqsTkpzgOd4c/S+m9z0MQ6uQSIg8SQFQO+drw4lqppgItHr8s8PR6p2j27CKhzMHvvZof6r4J3KS/439pLdkn+FrW62SW4fx8A0u4RtbsLxW2ATSxsOk4LQ75fjzgi2MOfpKvy6157M0qNvIzhGDZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2jtuFh63i//n5BkdHzYptgwZdi4sGCi9nP0amVN1dDU=;
 b=vb/EyZQHI4TdoGPDFUH0Z8/HNAw7mmy57LMnzaK5V1OLTT7wyKnAZktOu8+m35+IxJx0NQ2k7/7ZQwoc3mzR+z6d9VA4kbZ/48dHtTSZVPN0e8PWmSKYEa2vOJL3eRWU99rwpZHXfKP/tSx0Mzn7Oj8qXB5Zu4ChEweVa2Abi7uoxOzTI1ZqA2UeYtodmRTdzIAhTqbKVxai9bzAXMH9nax89+93fj5ONe4K1D5q4CqXPSp49qEeSg5KvwVeAUyczb3fj3oYa//XvTT+xAmZ3E77dOKcDURr5u/NPZ3OO0pmTWyKs1B2iCR6a+x//LSWCH0+rpdCm8l6T5NMfUmFyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SA2PR11MB4777.namprd11.prod.outlook.com (2603:10b6:806:115::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Tue, 16 Sep
 2025 08:10:56 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 08:10:56 +0000
Date: Tue, 16 Sep 2025 16:10:48 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Yury Norov <yury.norov@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [norov:gr1] [group_cpus]  375cfe2074:
 Oops:general_protection_fault,probably_for_non-canonical_address#:#[##]SMP_KASAN_PTI
Message-ID: <202509161532.c886f932-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SGBP274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::20)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SA2PR11MB4777:EE_
X-MS-Office365-Filtering-Correlation-Id: d0b203b6-7453-4ed5-02c0-08ddf4f89019
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sV47MSn66qO7Ayk3mXKe+wj3x+n8lW1odHjL81zWz5c+PsGV/W3JCyiWIkMT?=
 =?us-ascii?Q?i5jGREjdFwd5ouXh2sb9GDs4GVV6upXtiKyDYjPQYDcrvV+RyaGbHrAzhSnj?=
 =?us-ascii?Q?0X0EpncsL5GmzS9u0vxaQ0WevkEAxGhEi3neLwmdk2ZXtjvwyVrdWOdIp9/0?=
 =?us-ascii?Q?jptG4+cbJm5b7XI/bfiiDWHkUMurKfuYKQwdWDsV86DEgPwMBX4iWobOxj8A?=
 =?us-ascii?Q?bF+EXI1gvOrc+610Dsa4frHItJpi/Q28fGRAoNPU+ZP9TZg+PsonzgujwW8G?=
 =?us-ascii?Q?R8lolW21M4soagSwSMaH12jvUmXFDU4jAXJoFbcIz3RKiFwycnXW4GZZOFmR?=
 =?us-ascii?Q?PPJxWV1DA0HL+/O5+OQ1qca7app3BWDtzMcBKWJWYqFYZUTSAeFy1PF7aIrJ?=
 =?us-ascii?Q?qyKlfUi6s+kUAAbIPiGLM3t1msGccHs7NsaQbAZjO+tgp+2VDUdDAiu4oRN8?=
 =?us-ascii?Q?ILSlsUEAVvQKXewIgdFGwwDot5/QHoXMohgewIvmQ9iCX8NjLWjZWiXOFtmG?=
 =?us-ascii?Q?sacwV+3dskHLkbr93Bxz0AwmSG+L5SCW579sVgO/aiSrV5tuZuDqvsMEX6it?=
 =?us-ascii?Q?mNjI9da85ND2jD1Tp+TUCe7JdH5X+Z8rsaDVZ0LFJJ2MdaaN5cHPYfRGstKt?=
 =?us-ascii?Q?12DLyr/1odrU8Q+cXk6CYbverTfAVdQyLwzx1cnhbQ6bBVa9JWX/iki2UPAr?=
 =?us-ascii?Q?ZJ2m1NoZgzFE/lXB3Jju2JO/38qaV8Y+nyvUV85s4kMh5JDjY1Zx2JDc6fJo?=
 =?us-ascii?Q?L3iA1CdOcDETvgScH93dWEMptY526QRZK88tyPXuV0yEeg3QRMN79nWo11ez?=
 =?us-ascii?Q?IlLxaQYJezkN9n3oGPYEBMNNIl0sYi/RPDZKXqlwTU0MMfY2qPGJLufjomvJ?=
 =?us-ascii?Q?uuBQ1f3xj+obBwA+caXJzI6n63xc75vo2phIIGnOoc9iBnVOxHcHzpSGey/A?=
 =?us-ascii?Q?XXGYBe4FTCOIpTKQO5Rw1UyT5aGV4RKo8x7xsnghTeSY4LFLBHbTGb3NmsbI?=
 =?us-ascii?Q?13ykSmg0AjNI7MaxbzXVft9vVa6wQHTCwPcssRd1VGVBsSoDq8pkaJGLeY8e?=
 =?us-ascii?Q?S8ZkNwo6PR5krk+NkKRBNbFpL28lAOjB+ctX/tHYi/rrAzSOw4SzKcfpOIrC?=
 =?us-ascii?Q?ZD9Ois5Js9Lr/V0eYBrQVoWkns2Bt0msNPHaSVwgu6kT5IdHLheGw2DSg+YM?=
 =?us-ascii?Q?l8PyywW1tDIc+Mp4QtrQC5zx52CTf28pEv3gCJqAmp7vJcaxYHOI0AGbNVqt?=
 =?us-ascii?Q?NlI5UFAmcXet1Tvjl3Dmx5phly+78dKqFKwF9VOG+CtQRJE6PshQuDWZeSU3?=
 =?us-ascii?Q?a80qs3wHXjkX6veBdPrf7dx1zx9J+T+x6XaVdIXwb1x4pqHVktkC/Sa0eZB6?=
 =?us-ascii?Q?PO7ctZm+trzD5NmSEhnpHlxX1uW8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TIIim2BdW+gBjTR6yTekRYH9+BvNBuZsYBhcFA5lLcTWmyoCtx7u4rJi7spV?=
 =?us-ascii?Q?s+cgGxqCmViKiBNmZh1JBRrFWab9eF02S663GYwgL5uyLi/Umf1OFh4qD6a6?=
 =?us-ascii?Q?GFi4likHAFYnXxERrrq5V22J58dWBOPgiGEDh7AT37cplaI+RBYIJu4Elc7f?=
 =?us-ascii?Q?IDUswikM39AoR/13SAjffUoUWhSY85sfcyZIjlPlrDy+kBvJngh6K86rMQBe?=
 =?us-ascii?Q?/zEgF1vi2ql3ru+/6SLpwNYc0/vHKeYXSzfamtkhenNYcpg2/fUDU8iTjRE0?=
 =?us-ascii?Q?uiVliq12Crd2j4UxMGb71D/HuVJfrIjOFLCaBvFSBWqg/K0gGMmXACYcm8v+?=
 =?us-ascii?Q?dufUK92RouwjWd8F90KDtyunuvXGfOygWqP707D75AnZsJwCStAtmCLAZ/6R?=
 =?us-ascii?Q?iC2W9C1DxByL/sMUX7yB6IkjIqUuDidnfn262WnmpDca+Pd+qNl707F3YgdZ?=
 =?us-ascii?Q?b0Js/nl/611s1nwUKYJ32uRp6x1SyvNWt636M5JMJjeBt8kyD4sN+e8FBnMc?=
 =?us-ascii?Q?Za1Lawewqupr9QZTeM3qhcfrthQjWCe+nqLjkb9PRtdvGNuk4d5YcrozPQjm?=
 =?us-ascii?Q?dMLJ/wcuIVWHeJdUY1lGkerKYifDBY2iaXgO8p5jz362oGWg9FqQPaTrVB7L?=
 =?us-ascii?Q?c143HOmY6Qr8PlEor0yVLoC5Cm0epsA6Hu0q5QWilrcDZy7amp0A6dZWiGv0?=
 =?us-ascii?Q?28tyKqkUow2fTyCFQ5NnBAf8PxbWUslgl7sm+Cnqhh2ZqUWyfaYhbGjPQzHl?=
 =?us-ascii?Q?2HQWNoSbdcJ6I2vQpkKt3xZpFE7Djcqc2h0WcAKWMtmIOg5kZmwi41gOkjyV?=
 =?us-ascii?Q?kUDH013YQc1MsqCkaIB5vIt58w2MYMF/pVKRRp+60iQFHQBLzDDiP3hC4VgL?=
 =?us-ascii?Q?2d/x1dMkTlgzLkj6wTEBEVRMlcPCy1ew68bnvponZ9T/xC1nGwVl96v/Veo/?=
 =?us-ascii?Q?3HOJAyCa2+Kln8xV+Tz5IhAyr3wuVy3lqcMUrIRVmm8GBP760G8o8DlXZsHG?=
 =?us-ascii?Q?uXDNqUr5S7keY701Nor94jbY62kBAbWzBuD0QbjQ6G7symXjiYMMRMAqFnEr?=
 =?us-ascii?Q?E4TcEx1s5yBewJo/nXSf1b/O/dtqg88uOUvdJelrS1wcMo0ohBi9/AdaFWe1?=
 =?us-ascii?Q?VIaV+VUs/i4R5MCKXzz/bJlwT4S2ZwqYqBUlYdh7V/FeSgNaeEOqz1V6Kyf5?=
 =?us-ascii?Q?y75wlV+2B0ONt0Dbuw7vywbldSvkBjXAzoRUL6si8AVTClBWvJyyAX77hw4J?=
 =?us-ascii?Q?1jDRdnF4QoLOLqIsk9QxqEgzLy3Wh6u8TGE4DDuE1p8wjuCb6g9NkmQHfH01?=
 =?us-ascii?Q?5ULG8hRY+eZx6QV3ENDnhbhSh7b0zkAJc5eWAuF6XD+JSYRzDf8Ld2ZnuNr7?=
 =?us-ascii?Q?UlrmRWG8j30qx7i8hbIAk6v9iWW8zVIpxVUBMUzoAtmyLnd2tU1CKttnz8rE?=
 =?us-ascii?Q?VbgEbePsaqJ78J89rVax8iysMkua7Eh+flCC3z1xJuO4elMWhxkib2OAPUk4?=
 =?us-ascii?Q?uiKOoCDylY5jyEnTR7rEZF1O7DFBnzNd9SRpmPGuiyseF2qmLcwbcnS0E2uf?=
 =?us-ascii?Q?OLLT8jIm20YoneexLBkiQsGvFJY8XNtXyTvDVPPpSQ3r3A7SzMn0+qvxEwHV?=
 =?us-ascii?Q?Yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d0b203b6-7453-4ed5-02c0-08ddf4f89019
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 08:10:56.4836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jRLjLgKWKoeqHIgChS/4VMJAHfRZxk20naMd8k7UJWNSCWPpwLnEL9c8Qgh9cVvgxAdedF5HGkMwkuAA3XWm2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4777
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "Oops:general_protection_fault,probably_for_non-canonical_address#:#[##]SMP_KASAN_PTI" on:

commit: 375cfe2074504191aca45407c88712685704513d ("group_cpus: simplify inner loop in grp_spread_init_one()")
https://github.com/norov/linux gr1

in testcase: blktests
version: blktests-x86_64-3dc59d9-1_20250912
with following parameters:

	disk: 1HDD
	test: block-027



config: x86_64-rhel-9.4-func
compiler: gcc-14
test machine: 4 threads Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz (Skylake) with 32G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202509161532.c886f932-lkp@intel.com


[   58.602657][ T1559] device offline error, dev sdr, sector 87871024 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 2
[   58.622088][ T1152] sd 4:0:0:15: [sdr] Synchronizing SCSI cache
[   58.631317][ T1562] device offline error, dev sds, sector 166321784 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 2
[   58.657368][ T1152] sd 4:0:0:16: [sds] Synchronizing SCSI cache
Startin[   35.573608][  T173] IOAPIC[2]: Set IRTE entry (P:1 FPD:0 Dst_Mode:1 Redir_hint:1 Trig_Mode:0 Dlvry_Mode:0 Avail:0 Vector:EF Dest:00000001 SID:F0F8 SQ:0 SVT:1)
[   58.678115][ T1152] Oops: general protection fault, probably for non-canonical address 0xdffffc0000000005: 0000 [#1] SMP KASAN PTI
[   35.626725][   T41] i801_smbus 0000:00:1f.4: SPD Write Disable is set
[   58.689841][ T1152] KASAN: null-ptr-deref in range [0x0000000000000028-0x000000000000002f]
[   35.635868][   T41] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
[   58.698094][ T1152] CPU: 1 UID: 0 PID: 1152 Comm: check Not tainted 6.17.0-rc4-00075-g375cfe207450 #1 PREEMPT(voluntary)
[   58.709029][ T1152] Hardware name: Dell Inc. OptiPlex 7040/0Y7WYT, BIOS 1.8.1 12/05/2017
[   35.672502][   T41] iTCO_wdt iTCO_wdt: initialized. heartbeat=30 sec (nowayout=0)
[ 58.717105][ T1152] RIP: 0010:free_percpu (kbuild/src/consumer/mm/percpu.c:1641 kbuild/src/consumer/mm/percpu.c:1629 kbuild/src/consumer/mm/percpu.c:1896) 
[   35.709716][  T201] input: PC Speaker as /devices/platform/pcspkr/input/input3
[   35.720102][   T41] i2c i2c-0: Successfully instantiated SPD at 0x50
[ 58.722758][ T1152] Code: 80 3c 02 00 0f 85 2c 04 00 00 48 8b 3b 48 01 ef e8 5b 28 0b 00 48 ba 00 00 00 00 00 fc ff df 48 8d 78 28 48 89 f9 48 c1 e9 03 <80> 3c 11 00 0f 85 c9 04 00 00 48 8b 58 28 48 b8 00 00 00 00 00 fc
All code
========
   0:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
   4:	0f 85 2c 04 00 00    	jne    0x436
   a:	48 8b 3b             	mov    (%rbx),%rdi
   d:	48 01 ef             	add    %rbp,%rdi
  10:	e8 5b 28 0b 00       	call   0xb2870
  15:	48 ba 00 00 00 00 00 	movabs $0xdffffc0000000000,%rdx
  1c:	fc ff df 
  1f:	48 8d 78 28          	lea    0x28(%rax),%rdi
  23:	48 89 f9             	mov    %rdi,%rcx
  26:	48 c1 e9 03          	shr    $0x3,%rcx
  2a:*	80 3c 11 00          	cmpb   $0x0,(%rcx,%rdx,1)		<-- trapping instruction
  2e:	0f 85 c9 04 00 00    	jne    0x4fd
  34:	48 8b 58 28          	mov    0x28(%rax),%rbx
  38:	48                   	rex.W
  39:	b8 00 00 00 00       	mov    $0x0,%eax
  3e:	00 fc                	add    %bh,%ah

Code starting with the faulting instruction
===========================================
   0:	80 3c 11 00          	cmpb   $0x0,(%rcx,%rdx,1)
   4:	0f 85 c9 04 00 00    	jne    0x4d3
   a:	48 8b 58 28          	mov    0x28(%rax),%rbx
   e:	48                   	rex.W
   f:	b8 00 00 00 00       	mov    $0x0,%eax
  14:	00 fc                	add    %bh,%ah
[   35.746995][  T203] libata version 3.00 loaded.
[   35.752488][   T41] i2c i2c-0: Successfully instantiated SPD at 0x52
[   58.742184][ T1152] RSP: 0018:ffffc90000a6f690 EFLAGS: 00010206
LKP: ttyS0: 219: current_version: f0, target_version: f0
[   58.748097][ T1152] RAX: 0000000000000000 RBX: ffff888785f5bec8 RCX: 0000000000000005
LKP: ttyS0: 219: skip deploy intel ucode as ucode is same
[   58.755914][ T1152] RDX: dffffc0000000000 RSI: 0000000000000000 RDI: 0000000000000028
[   35.791116][   T41] i2c i2c-0: Successfully instantiated SPD at 0x53
[   58.763730][ T1152] RBP: cccc5554cb56dccc R08: ffff888159d63180 R09: 0000000000000001
0m] Reached targ[   35.826309][  T175] RAPL PMU: hw unit of domain pp0-core 2^-14 Joules
[   58.771545][ T1152] R10: 0000000000000001 R11: 0000000000000000 R12: ffff888785c47000
[   58.779358][ T1152] R13: cccccccccccccccc R14: ffff888785f5bc80 R15: ffff888785c45000
[   35.849207][  T175] RAPL PMU: hw unit of domain pp1-gpu 2^-14 Joules
[   58.787170][ T1152] FS:  00007f211f564740(0000) GS:ffff8887fe921000(0000) knlGS:0000000000000000
[   35.878864][  T203] IOAPIC[2]: Set IRTE entry (P:1 FPD:0 Dst_Mode:1 Redir_hint:1 Trig_Mode:0 Dlvry_Mode:0 Avail:0 Vector:EF Dest:00000001 SID:F0F8 SQ:0 SVT:1)
[   58.795940][ T1152] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   35.893546][  T203] IOAPIC[0]: Preconfigured routing entry (2-17 -> IRQ 17 Level:1 ActiveLow:1)
[   58.802369][ T1152] CR2: 00007fb3a23956a8 CR3: 000000026db48003 CR4: 00000000003726f0
[   58.810184][ T1152] Call Trace:
[   58.813320][ T1152]  <TASK>
[ 58.816108][ T1152] ? kfree (kbuild/src/consumer/mm/slub.c:4680 (discriminator 3) kbuild/src/consumer/mm/slub.c:4879 (discriminator 3)) 
[ 58.819939][ T1152] kyber_exit_hctx (kbuild/src/consumer/include/linux/sbitmap.h:188 kbuild/src/consumer/block/kyber-iosched.c:513) 
[ 58.824464][ T1152] ? __pfx_kyber_exit_hctx (kbuild/src/consumer/block/kyber-iosched.c:508) 
md-user-sessions[   35.945592][  T203] ahci 0000:00:17.0: 4/4 ports implemented (port mask 0xf)


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250916/202509161532.c886f932-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

