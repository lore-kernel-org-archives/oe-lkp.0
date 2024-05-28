Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B38C13C67D
	for <oe-lkp@lists.linux.dev>; Tue, 28 May 2024 08:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716885506; cv=fail; b=CqfHEFmmyudLCd6kju1auFI7cmkqq/F2LS9hQFh8k0kNGu6ldTtqf8sqJhoBO2zFFNsMMSdci8KYJTP15xZZtx0qq/YOPEKSTFDiR7fjDzrEqCEsX4olQD96fIvz2OIlq0RtUH+Ma8h4ypJzbPnIvOC1q6QjwNSgvjNZHZHncxM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716885506; c=relaxed/simple;
	bh=gQkfRS6vmHDzxrx/vo3KPyBoja25/SOvl00X1eeCsG4=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Cc+iR30AKoXcRc5vp74ud8SM/9oEM1dd9crqOzfUb6J8pN6iwFt1oa8mROlKNjMbr/1hqIqqKRYm7/nPeUNKSabpBuE5yz32ageavaLSlZM1HrCgyyTs2KC6UhKvSz1mBJzd9/QilTZrPMvhstk2eWf/G2y6SN3q5e4qKHnC/VU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JTQrza8v; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JTQrza8v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716885505; x=1748421505;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gQkfRS6vmHDzxrx/vo3KPyBoja25/SOvl00X1eeCsG4=;
  b=JTQrza8vwzU1HNr7ez622iLydn1q8HCBoIhZyW3Fm7bTFcnZflPmhBCq
   spHr+CEF+KDF5ac27ZZQ3ROipyoMVKVeOn7SP5TJ1QqBg8HH9FKFXiCuU
   6tnjIFIQuHwjvFgTi8FQqiWuLJpSvZGCXC/F3TUcU4oW+j4NjPKEf10gb
   XdaZIKv/LW84BrGZY7MdHbjxt41+GXVGQPRglX/B1ibZ+JvaayT14Pzlz
   ASlSMUoeEDCP1kKC4e6LQeQjlll7+UwjfDACrJ0Dl+/Gy2OUZr/fMQC9P
   gX8nxwuT5YLTxcqnA2GnGCo11HFcv2GWsw/tJXsWtTCnBUctw0cx+rqnh
   g==;
X-CSE-ConnectionGUID: s3y2e4gxRLGDMM4txF36QQ==
X-CSE-MsgGUID: v0lLwBpnQ6WuIXQ5SEqqNQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13384976"
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; 
   d="scan'208";a="13384976"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 01:38:24 -0700
X-CSE-ConnectionGUID: jYIBiC+ATO6A/NOWbSUJaw==
X-CSE-MsgGUID: tXcB+lsbRnimvOUXMHwPxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; 
   d="scan'208";a="34906147"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 28 May 2024 01:38:24 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 01:38:23 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 01:38:22 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 28 May 2024 01:38:22 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 28 May 2024 01:38:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cF/6OCi1+l/rDMohiCnuQay2FMbThHTWEntz4v3q5fIRa6UCkRxMxP1gYdf6EEoI20yVGyLo7AyVKU89s3pZ0Embe21WZ24M5Oz4ORzULxTkQyUwbjY6LGhwncL9+ubhHpOJfJztnglsa3h3F09F9ACB6MXEKevODuPqOG5Ho5L5kSjfCsrF3+Eg06AfB/UNKxHna3ohftUiufLaIXLAid9F8AY11zOLjBt1dUpWtPMQBYcslMg0vcSEGtGAWtQaSG52xoOuzvgBV7GquuPWgaDGgnUXYAXCVtyi2SMBU/wEyedgoLiY4MNbrCr9OltqIcU/9VuXe3/nwxHvNKHouQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DIqk/DhamzR0nDsDt9o2VrKeRPPunck11gKAFB4aVb0=;
 b=iISjY4yTaRa3dDO2+UEn4sKqP4a/0HJ+2CcyIxXnXKrCmVorJTEBoqbz4VGHIYe0hZfshbCect1/2ek1PT5+tDbqeQDWhwJhz/zmIstX8lz6DjnXhTJe8V9Wto0ah3El4tbuLMTLhdzcKcJOB/bQn7/lehfVfLHTiUwZrEnUN0Th5SgN+WJlLssC8QUCl6YUJEqef+pZrP5BNpjkZs0JYpGNr3Q7zyO8Vg9/6sVgtZJ8u5xTz8rBVC7beq/Axd0hpgRLfP2Od4Ixt+RBd6fM0ytGCYxnFjpmVQgoASX5uh+0IuQdd6fhRwmnA4zs/WNLpIIXu+D6U4f2sjrqJdE75w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SA1PR11MB7087.namprd11.prod.outlook.com (2603:10b6:806:2b5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 08:38:20 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%2]) with mapi id 15.20.7611.025; Tue, 28 May 2024
 08:38:20 +0000
Date: Tue, 28 May 2024 16:38:13 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Johannes Weiner <hannes@cmpxchg.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Linux Memory Management List
	<linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, Rik van Riel
	<riel@surriel.com>, Shakeel Butt <shakeel.butt@linux.dev>, Roman Gushchin
	<roman.gushchin@linux.dev>, Facebook Kernel Team <kernel-team@fb.com>, Michal
 Hocko <mhocko@kernel.org>, <oliver.sang@intel.com>
Subject: [linux-next:master] [mm]  6be5e186fd:
 UBSAN:shift-out-of-bounds_in_mm/vmscan.c
Message-ID: <202405281603.337d8284-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TY2PR06CA0006.apcprd06.prod.outlook.com
 (2603:1096:404:42::18) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SA1PR11MB7087:EE_
X-MS-Office365-Filtering-Correlation-Id: daa86602-4d4c-490c-1773-08dc7ef18788
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cwnImttjHyup/eIj1IOcO4QOMHCG0LB5Nist11wx2cEqrJ2/lGm+t4KhOSS/?=
 =?us-ascii?Q?CVodWQxvjGyG0Ut7xf3u4wCumKERebfSBFUOelZAgFjpXNTG4uwq++CxUl4F?=
 =?us-ascii?Q?S9TvJ7mx21qtzATZUWq3AItT/yEkwN+bAfJ9OXeL/MBxF/BUcYe36t3/SdkS?=
 =?us-ascii?Q?+oFLwCGGBpp+aOgv5JnbOipCxgCcsUXtvZSggfR64DD55pP17L/BbPGjlcAO?=
 =?us-ascii?Q?pGDAQtKGr/rMzDJbwmHNz7h3KfrWi3pCipf9yKMDpAGpprMop70pVhWMOjoF?=
 =?us-ascii?Q?k+eXzmVnIkkflavga+ZB0JByqSXR4F/TFH+jy4CJzMejJiHHUHiOqltCBu15?=
 =?us-ascii?Q?qBcbZY5VHx+V1aZGRQnukEMMSqUx8l53y4BMn7zFICZnYb8dMxgcKs+vL10i?=
 =?us-ascii?Q?1ZNQ0FEGhxs0LKJcM3L+UnIV1xQnWa/WTmv+7W75v/ipcR8rDDBMCT6SvWbK?=
 =?us-ascii?Q?Pb299duiHCME1L2jqO75Dy1JsTgdEbiLVoE6kU1vLG3b+ciqhUL97tR5gbLy?=
 =?us-ascii?Q?zaXmQHPHN48Cd4rgL1M2rS9woE4jvflaqcg0dF2O4qVrQf9xnm6NpOdSlLTG?=
 =?us-ascii?Q?rSmrxgtOfokXEqdEG8GXvmSAYYnI5mbYiYXWMlp8Yjsf5NpmqiVRdby166zG?=
 =?us-ascii?Q?4wZao8Iz9YVd84IT6wpRli7qC8Dj2hDyljyGqHQPsLigRP48caDZbzoz9nE/?=
 =?us-ascii?Q?g0XRgQhZ0p4ZpTnZmw5lnbmkGnxt5j/aYpCRExnc4zWcbdUeo+ajQCnx2E5o?=
 =?us-ascii?Q?Yaxm0yK6NhE/DNY2J/Ci6DkebvuZLofuiYDf8O3oP+yAZ5FTToBU1DrdW0YN?=
 =?us-ascii?Q?02u9N2Ox/K9V5AnYk751Rkk7EAkBum1iaLjVwT9Ume/uGfH5/8uUMRMVh+Xn?=
 =?us-ascii?Q?j/cCGgNkhiBMatYzeXw6nfiEtp4DWTajwO3vfTd3bDXFFtGeG2PNDYQZ9zGu?=
 =?us-ascii?Q?q+MGMtsYJPvscCvXw4SVnXvAbeX6dV0awq3VIDL6dSCYi53xuKmfd2fWkXpg?=
 =?us-ascii?Q?zQ89LK6R1F/wK58uFh+yIB1v7bmJhKoH3UMI4KkUa03It5YEUcbT42730V+4?=
 =?us-ascii?Q?zWO69lVi2DIBTNuLAX75KPLWhzCOnX/FSLUQgQbvPq0rETikgGSuJCNrY8CE?=
 =?us-ascii?Q?1eKH+k+qcRrKNwOTZkl/ULZ7+l4c7R7hzRFLn277I4reeJ6EV3TCRy7+3B31?=
 =?us-ascii?Q?+sOzvsCFi1i05qw9DFbiZS1MwoPJ754XISNPMqddz6hFhXemk7BA/uO9/b4?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QET8MGQVGqNazxnxFxB3aEUXNJVk6fMuC7YNGq9NVzg3PiKAVJjRxoqArCfB?=
 =?us-ascii?Q?zWEKe7dXxvVsVSg36iIqKy5XsprleYYNLlYYDIDeyNu7xsspIEXdsrNhrdOS?=
 =?us-ascii?Q?2I/bwQ4QvIhfC3e6NHgGL/l31iXPP10Rp8OQ41/gE2coR1jfRLlDyBIJuB30?=
 =?us-ascii?Q?YtCTlSZuFrZD59cC9Dn0iI52eQEIsZi15OH1ikaAcd3IkPc8V8jojovbcjhv?=
 =?us-ascii?Q?/UAMZouKdoZEICTYK137EXOCVF2y0Bl/ON/7vWYx3s0rt8Vmz+o5uJyMMSUO?=
 =?us-ascii?Q?bYfzhMtbypIjr9YkHcy9M+Ik8C0cqDmDlihdxZfKZxEsiRdkjKMQJADIcG6l?=
 =?us-ascii?Q?8zk9r2HbjBx1I57LTiP2PEUqcjEbLds96aIhg+JmKwTJCUpnNKUgHYfcmwgq?=
 =?us-ascii?Q?YPURQK024IHPTEXEDrWSshmBUt/aan1Y0f2qyT6MxdUlivejg+5mgPf7pSa3?=
 =?us-ascii?Q?++U/B702cnFgoWoNYlYvbtNAvwTO35mEoRzMhHNgcBGhDjlJ5Kngr2ZWW4l1?=
 =?us-ascii?Q?+BwoTT/4oiNwxfi3SAvBvlbopiHXklS9YT3gR2xbYZT3xYaLnc+G0lsmarVm?=
 =?us-ascii?Q?+PgxbaoNbZJkCNcflIeyu5kl/12H+2Hfr6hA6+zHib5Z8+Q5+V3+X/H+7WWm?=
 =?us-ascii?Q?bESmXFELRceLVQsnQ4zevx1vdF2lY8o4GJ2H7eFao4c8E2cHGvEuTyXZVn+V?=
 =?us-ascii?Q?tgCGAUfYrMO6c2lhiwdzMG0WY2xcHuqRJjXq9R8otw5RlbqsS5OAvih/mFdv?=
 =?us-ascii?Q?yxdIDOsFDzVzxLX4Dz+HWfnt71d2DVQscxSaXdMcytcMyGK2pMNNgeMSjbkF?=
 =?us-ascii?Q?GiB5jnCicQEDY8Xq9azEPVUsUKiDEyq1Py25Ud2Bv7mBqQ1Alvpgs/DUTbwJ?=
 =?us-ascii?Q?NewFjL1aLj+eGN/HXKSjVxPoIzaVZIxNFeD+n/Cwyna1ePfkyG9KkLIHmsU2?=
 =?us-ascii?Q?9R9OCGEP/dF1/kkgDvh+9RAIlLOe83+zzv6uU0RaYFfvzARx8UKUsHitq4PL?=
 =?us-ascii?Q?eygLtxYe0i077dOaUwAQ6nZbI2gQSBl7DRd23mLaN3Ra3RMV41IJZJCbY6pE?=
 =?us-ascii?Q?YakaPaLVmZoEzL8tdhWyhPYd2qUchFo4A/FLtfJpXLyhISdrDrJ3jQ9ShtKW?=
 =?us-ascii?Q?s5m1k4kBtVAQcvBvdpjDs8yIqXRxZCb+AjVV8djdu/986MP/vmOksD8dH+AW?=
 =?us-ascii?Q?FKAc9T1Ku4LiHNiMJZ7yRg1I1nle2SJGdxrwR0AaESSKtCbAhFq72+y6ZbZd?=
 =?us-ascii?Q?49HQPHbFRkDq7e136zqixcKILQv/ZE7XJS+l+71ZGzeA0e4qInNinny4QxvV?=
 =?us-ascii?Q?UVuGJLaS7mSHSHT1FV8PcKsyRPdGYSEs4pgOhrTwwKkOt/cH1DW1JA3IDENU?=
 =?us-ascii?Q?ATujFYYJxrjW0M+1wtUbQH9q4TcHNsDnAjNVqazPsFPLdzLkRAWsRO5/BxED?=
 =?us-ascii?Q?pfoUu3nTT9JfX6uwL0wX/qf5w+Y4eWYFhbqGGfDvS+nYdRnMgGTBMd2B7GNG?=
 =?us-ascii?Q?hjHJXS1Sag/gc1s6mzw2etPbmbmPnRUMgXA/SrJULSRfiO+rwt0tYdifJESw?=
 =?us-ascii?Q?W15iP+Z9HFmU7YF7FY1hS5G1366m+z8Sc4pGHsHmORgb2nblgluRupk7Gym4?=
 =?us-ascii?Q?lQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: daa86602-4d4c-490c-1773-08dc7ef18788
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 08:38:20.8112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2nXCAuUjNBAL50MDWg+LLo01aTGIwhBtiQq1wOl1kVWQzqrDlCkU+9Yv3niOJM9a49Pv37ekyAhJXzLi8X+ijQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7087
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "UBSAN:shift-out-of-bounds_in_mm/vmscan.c" on:

commit: 6be5e186fd655df4b3ba267054de2eaaadc71340 ("mm: vmscan: restore incremental cgroup iteration")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

in testcase: trinity
version: trinity-i386-abe9de86-1_20230429
with following parameters:

	runtime: 300s
	group: group-01
	nr_groups: 5



compiler: clang-18
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+--------------------------------------------+------------+------------+
|                                            | 327eaca22f | 6be5e186fd |
+--------------------------------------------+------------+------------+
| UBSAN:shift-out-of-bounds_in_mm/vmscan.c   | 0          | 5          |
| UBSAN:shift-out-of-bounds_in_mm/shrinker.c | 0          | 4          |
+--------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202405281603.337d8284-lkp@intel.com


[   89.138129][ T3641] ------------[ cut here ]------------
[   89.139149][ T3641] UBSAN: shift-out-of-bounds in mm/vmscan.c:4702:21
[   89.140258][ T3641] shift exponent -1 is negative
[   89.140922][ T3641] CPU: 0 PID: 3641 Comm: trinity-c5 Tainted: G                T  6.9.0-11986-g6be5e186fd65 #1 b52e1df0cfc6b45fcedea06291dcc02f3c365315
[   89.142504][ T3641] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   89.143783][ T3641] Call Trace:
[ 89.144289][ T3641] dump_stack_lvl (lib/dump_stack.c:116) 
[ 89.144943][ T3641] ? vprintk (kernel/printk/printk_safe.c:?) 
[ 89.145537][ T3641] dump_stack (lib/dump_stack.c:123) 
[ 89.146140][ T3641] __ubsan_handle_shift_out_of_bounds (lib/ubsan.c:232 lib/ubsan.c:468) 
[ 89.147025][ T3641] shrink_node (mm/vmscan.c:?) 
[ 89.147693][ T3641] ? kvm_sched_clock_read (arch/x86/kernel/kvmclock.c:91) 
[ 89.148409][ T3641] ? allow_direct_reclaim (mm/vmscan.c:6355) 
[ 89.149122][ T3641] try_to_free_pages (mm/vmscan.c:? mm/vmscan.c:6503) 
[ 89.149775][ T3641] __alloc_pages_slowpath (mm/page_alloc.c:3859) 
[ 89.150449][ T3641] ? get_page_from_freelist (mm/page_alloc.c:3158) 
[ 89.151204][ T3641] __alloc_pages_noprof (mm/page_alloc.c:4673) 
[ 89.151916][ T3641] dup_task_struct (include/linux/gfp.h:269 include/linux/gfp.h:296 kernel/fork.c:358 kernel/fork.c:1115) 
[ 89.152566][ T3641] copy_process (kernel/fork.c:2221) 
[ 89.153225][ T3641] kernel_clone (kernel/fork.c:2797) 
[ 89.153860][ T3641] ? local_clock_noinstr (kernel/sched/build_utility.c:301) 
[ 89.154559][ T3641] __ia32_sys_clone (kernel/fork.c:2908) 
[ 89.155214][ T3641] ? trace_sys_enter (include/trace/events/syscalls.h:18) 
[ 89.155863][ T3641] ia32_sys_call (kbuild/obj/consumer/i386-randconfig-013-20240525/./arch/x86/include/generated/asm/syscalls_32.h:?) 
[ 89.156511][ T3641] __do_fast_syscall_32 (arch/x86/entry/common.c:?) 
[ 89.157200][ T3641] ? irqentry_exit_to_user_mode (kernel/entry/common.c:234) 
[ 89.157940][ T3641] do_fast_syscall_32 (arch/x86/entry/common.c:411) 
[ 89.158624][ T3641] do_SYSENTER_32 (arch/x86/entry/common.c:449) 
[ 89.159279][ T3641] entry_SYSENTER_32 (arch/x86/entry/entry_32.S:836) 
[   89.159946][ T3641] EIP: 0xb7f4b539
[ 89.160481][ T3641] Code: 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 0f 1f 00 58 b8 77 00 00 00 cd 80 90 0f 1f
All code
========
   0:	03 74 b4 01          	add    0x1(%rsp,%rsi,4),%esi
   4:	10 07                	adc    %al,(%rdi)
   6:	03 74 b0 01          	add    0x1(%rax,%rsi,4),%esi
   a:	10 08                	adc    %cl,(%rax)
   c:	03 74 d8 01          	add    0x1(%rax,%rbx,8),%esi
	...
  20:	00 51 52             	add    %dl,0x52(%rcx)
  23:	55                   	push   %rbp
  24:*	89 e5                	mov    %esp,%ebp		<-- trapping instruction
  26:	0f 34                	sysenter
  28:	cd 80                	int    $0x80
  2a:	5d                   	pop    %rbp
  2b:	5a                   	pop    %rdx
  2c:	59                   	pop    %rcx
  2d:	c3                   	ret
  2e:	90                   	nop
  2f:	90                   	nop
  30:	90                   	nop
  31:	90                   	nop
  32:	0f 1f 00             	nopl   (%rax)
  35:	58                   	pop    %rax
  36:	b8 77 00 00 00       	mov    $0x77,%eax
  3b:	cd 80                	int    $0x80
  3d:	90                   	nop
  3e:	0f                   	.byte 0xf
  3f:	1f                   	(bad)

Code starting with the faulting instruction
===========================================
   0:	5d                   	pop    %rbp
   1:	5a                   	pop    %rdx
   2:	59                   	pop    %rcx
   3:	c3                   	ret
   4:	90                   	nop
   5:	90                   	nop
   6:	90                   	nop
   7:	90                   	nop
   8:	0f 1f 00             	nopl   (%rax)
   b:	58                   	pop    %rax
   c:	b8 77 00 00 00       	mov    $0x77,%eax
  11:	cd 80                	int    $0x80
  13:	90                   	nop
  14:	0f                   	.byte 0xf
  15:	1f                   	(bad)
[   89.162727][ T3641] EAX: ffffffda EBX: 01200011 ECX: 00000000 EDX: 00000000
[   89.163576][ T3641] ESI: 00000000 EDI: b7f462e8 EBP: 00000000 ESP: bfe67200
[   89.164430][ T3641] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS: 00000286
[   89.165448][ T3641] ---[ end trace ]---


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240528/202405281603.337d8284-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

