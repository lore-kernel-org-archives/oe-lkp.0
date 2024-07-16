Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F00F1990A1
	for <oe-lkp@lists.linux.dev>; Tue, 16 Jul 2024 13:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721136659; cv=fail; b=mi5EqIsWep+uz5FcueRQ9pIo6ZvMtCalqHROUnuiDKBTuPTaVrvJMlCQB98o31WLhghsDHWCRAGGZmS86zwfnT/ArkPkV1nRP8vTBFZRoum0oBcdwOi+Y2l/As1tvu7/xv/myBpTt6oMTkAAJLnfAbf1pQbyVyjFnEVw/0v+q6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721136659; c=relaxed/simple;
	bh=jRHsGJY0b+S2eHAoTLPGqELFGKWVEhxNqD6S3fxk96M=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=tNHn5rncl/HbseyXzBWvSv8qSsh9VHXdl9xVTPAU4NBYwITHcJmQ6Scf//BQJmoXcyjXRJ9mIQCizxGydRiZsFLHE02Sm9zIzsJkzHMqSaazRJBNPqnUbn1FII1F1W5AbvSh4lNfHUhK6pSDSOcUyKMorMqK99bxktu2/A8dYFk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IDNa2tz7; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IDNa2tz7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721136658; x=1752672658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jRHsGJY0b+S2eHAoTLPGqELFGKWVEhxNqD6S3fxk96M=;
  b=IDNa2tz7vQN2GZXXB7yQUbnkVXfg6y+2ZrOubDxlcsDUMjSeFzB8pyxb
   XuaCtqc92hKS/l0VQpEsqpMIIu+PBYagZc06xtW3WMEnvFWmM9nI0/Ujp
   q0FQ2lvBy/FHyK8fYhZbB0hPJT0i4GVMIbokZIuMZ4UKZOBC0IcbT7lrH
   zrWwASU/BIk3ZuyP1ZnjkBI3GtWKzyHtciQMif+7zdJcQrR5+bhVz1G2L
   XSWgTvswP41UUq4BkU2O0GSZ414nvTqBosPCNcelUtfvWsPpPeqtQzo3W
   LDMNXiqQkKAxH6qWnzplUr/GSh1xXTgXCPLLPOpepaD3dwjVIx0l5MoEt
   A==;
X-CSE-ConnectionGUID: 0OlHWYlcQvq7igU/uRk31Q==
X-CSE-MsgGUID: A3lKP8kqQQ+op/5vU4x8mQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="36116434"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="36116434"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 06:30:57 -0700
X-CSE-ConnectionGUID: WGm1GloES+WuPQqmtZF6kw==
X-CSE-MsgGUID: t91yaoa6TsGAxmCqW0Tayg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="50751606"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 16 Jul 2024 06:30:57 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 16 Jul 2024 06:30:57 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 16 Jul 2024 06:30:57 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 16 Jul 2024 06:30:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j8iO/QBMPhnKkL3KTLV15m0kSICmPNDh5LQxbqVns/zdWrdVEMDxn+204rawfG3KocBSomxOkpG100vEBHkubX9bnmaZ+uyzTTxyV8W7HjAPnMkp0QLrIS25UvPceMUzdOk1lxDS6ldN5Gac57DWjxC2EUl2uupU4y2+soULBQJJtxVaLvmDuHp1fNH/m1Y+FrSVhLiGOe8BFpqzxZMNsCyqY0DY+fw0PhTLggJfhQGh5Diwv0hpVYb2oUZZnheEeB+jZjwWN/ssFqTBCkUsnB50XT55ZPqJdiLqkmQ/FhWCczxRYqDmWJnt8ih797BmksY0TQr4+cCcRCXZjQT0NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D+tfUFaXqcrCsK+6INUy7mGjZv21RKYSfKDGoqU5fvI=;
 b=crPmNu87vRKUByMJh28nhxgdaq0t8cOz2NywYhMDKEamIBPW0sukARHF8LB+BLAyUoJ/ed4FGiGWa+JNc8B5ej6oVuHQSxeN76tyPoko5AHIDIo21ucALVetyKjMGyOSWLwi/UOldrTlECrNXUTjLKJI/SOHzHlUpaTpExx62xs2hasMLH/HVDIq22TExu4neHzV4PFM/eOOPUXzXCOUUyi7RyUvNIBKFJo2NWMXRpCLJoAtCfodHpvvatro1KGI2F335Ee4CMwpsBiK8HDkQBCuGE47bx+kA2N2OqYgPknKTRpckQl2FNnZL7ffumZ5zvO+r2aq10dndK6jTCntXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SJ2PR11MB7648.namprd11.prod.outlook.com (2603:10b6:a03:4d3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Tue, 16 Jul
 2024 13:30:51 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 13:30:51 +0000
Date: Tue, 16 Jul 2024 21:30:39 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Aristeu Rozanski <aris@redhat.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Linux Memory Management List
	<linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, Muchun Song
	<muchun.song@linux.dev>, Aristeu Rozanski <aris@ruivo.org>, David Hildenbrand
	<david@redhat.com>, Vishal Moola <vishal.moola@gmail.com>,
	<oliver.sang@intel.com>
Subject: [linux-next:master] [hugetlb]  003af997c8:
 libhugetlbfs-test.32/64bit.counters_sh.fail
Message-ID: <202407162105.5eab5c8f-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: KL1PR01CA0126.apcprd01.prod.exchangelabs.com
 (2603:1096:820:4::18) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SJ2PR11MB7648:EE_
X-MS-Office365-Filtering-Correlation-Id: b7353d32-9ddc-4978-0c37-08dca59b82bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?n7fSfqWPvOO8xrSiL/x/AHuLnudlSc+KLc/SwxeiZBEFGSSWmnV6IjTPG80F?=
 =?us-ascii?Q?o5ECXKrfYRz/4+2SNfBa8jwkSZMb1HCjeVeVwc5TOoMtLSlrMKe99wYmtQP1?=
 =?us-ascii?Q?P1gdfmZ7mWmsVwxDWAalFdX+4pzQFgsCUFDkYkmW/7n9WcsUWiANqBucDC9B?=
 =?us-ascii?Q?LdJ0v2dFO0vh10adrMcdU0Lu9WWRTCNL0Ru9et4FxbTNJbhka36zN5yXtG7t?=
 =?us-ascii?Q?dGGBb+jQ3NRKW3YFIoxXU9EgG1LcGUBxJBP7VAZFVVk6mp7vS8VZZ86VLLGM?=
 =?us-ascii?Q?tETHmmzSgsLdjWH+EvUOy+M9Xb7ve4GXnLnTKo7lEfLhpGbGGhg8OczyR7DV?=
 =?us-ascii?Q?lKzHr7jLIRgSerHT+RLPft7ng9ZiIhb/yHxhFs7DDFGN9ijlAiQokdxkfodg?=
 =?us-ascii?Q?s7rlvSxG3aNPW2Vcf4yke8+P5l8sohDZGdvVR438FQ9j7He79vdysv1V1flp?=
 =?us-ascii?Q?X7mGp7dAa9VVmSmDeUbTXN20CtpqKKexT5K5HyTkUQpM4w782+WTH+1s2Qrl?=
 =?us-ascii?Q?HpsKIGv+gr8N/CcZMAVySOLh7sy1IT6gOpouku5D0kSnbr/09gI5voB2Bq4s?=
 =?us-ascii?Q?ReCzASDvnvC/qQWnC3sez2WiZJQURUO5kZIsDhReFolnxiMYPVFuga+hedxK?=
 =?us-ascii?Q?KY5fdyCprCvGAlZQjWmIaQwJjfkHpaeFIkEaFhFPuNT1/ep83fGqa0oVJNxG?=
 =?us-ascii?Q?0/VCzagtl2TbmQIbcsF1sZjM1/RTGaBQW1gQ+UmSObpmCjJae8E4pPzAnzro?=
 =?us-ascii?Q?kVIUzcqXkcAPu6+pf44BATdIai+0puUQzOpSkVsjVkvKH6LVldh+cjON6zMp?=
 =?us-ascii?Q?g24ocZZQdMj1mxM8Qdqib9fowJWzqXgueN2kD2TDykdhULmzV6h70mPGmELP?=
 =?us-ascii?Q?Jd50vFiMGKJe+5UGcgnhaFlbtCUHQ89c4KdK+OiGQbJm9+CKfjjZhrf0p1s1?=
 =?us-ascii?Q?b7266EWyg0bDsdnDAd5xq/rXoWf+tSYp06O71Al3sWb7Cr3bX9AHAp7bkBzg?=
 =?us-ascii?Q?cPftvPnCDkd8MTY4EWncBQCFY8EPsRRfhxEEG4M6gFXRveBIeUgh7uTcBUJw?=
 =?us-ascii?Q?MbYMZCJ4OEsYEqhIR8wNKyuAlXaAqNCUJuljrRWxyEf894kB1h+Jkfph9b/H?=
 =?us-ascii?Q?8FT79otbPtFI61GgVvGFMEsG883A1YuLSnb1MuFcRKbqraekiOhVtQYr19ap?=
 =?us-ascii?Q?uW9itG5Jif9XzP2XCkDm7h8UnqJedUg5Mefg/8OSzUkk/4PCwkVidvGTGas5?=
 =?us-ascii?Q?xLQ8l2an9WgsTzTf1Sb1BzAh9Yq4D/452efl2bZ8gYMRqFP7+MBJpP+DD71x?=
 =?us-ascii?Q?n22gawHr4DlNppKQ351bNh13?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PmSwoiicS+Hd3rzXs0VNDM1H7SVqb+lvM5yvyZt6CTewUSjac6Bk0gZKpePW?=
 =?us-ascii?Q?WRv9/nQguPR3efbLbNbzpAZGQVJGMLn1LEpay52oMNP4yi90A8tanQIQXMMH?=
 =?us-ascii?Q?4XpgE3IGuj/k8UKecLZC+LBLk/n5oTbYiVbjovbCaUq6qW4jDGXHW1NHW3KY?=
 =?us-ascii?Q?2yfwzoPXTu4xL/LgKG5mX9JGHzUaI1C9Ulpte2tVTLinupZS/Ql3LrqFi+Vq?=
 =?us-ascii?Q?NXh2Lk88b8tlHn/xzYSJhsLpE+r++c/fIanQrq5DLRLEZwmkIo2SBmqpReJT?=
 =?us-ascii?Q?yEfgp9EYoObSiuyvth+m4Mg7p23wGzXRxc87MD/k0BFLIVevmHoDvziCFTxu?=
 =?us-ascii?Q?BsEPx5NEdFOwFkDqMhv1gVCi403SF+5qwcwG7vz+GIffHSz7n1wrwxTbn1xm?=
 =?us-ascii?Q?3+v51QIqWPvQKYC9HVVmNMvK/vphC9B0tX/viY95lSsOjrP0csCyRqxDIltQ?=
 =?us-ascii?Q?mXXiviikhlsBLBvE0QdyVDEAfyE+6KeIZNCSayZomXEuuEX1RR9pq9sWG/7a?=
 =?us-ascii?Q?FZ422gd9C0m/+33Av220J+iJWIw8R4gBsBl+7t7ZltgPNOZ254ifdDt5f98G?=
 =?us-ascii?Q?pSJf5Q/Bp6gTPc3h5/CWtxpWt0IeQc5pKxljjFnZPXCuuzQrudQXhP2lIvWq?=
 =?us-ascii?Q?0Jr3XAl0KcbFvrTjgRyQfEreA2OlumHGwYBvuHPpXhRl2xX7QqmOiksnxJWr?=
 =?us-ascii?Q?lUzF6DuPN5Wxo4SO1+/fISLxnGBBPzAJZx24yl1+owvO7FTPO+eY6ptRuJyI?=
 =?us-ascii?Q?u1R7NvI9nNODjbUtyDabEo6jM2Z4bChitZEBIqzsu+D9cGwE9l18Bz95wKSv?=
 =?us-ascii?Q?cwhqrrO+3CVq9T594OoTfoEsUxGjq9A+5yDklMyR3XNWJhDQWigsDySihsGg?=
 =?us-ascii?Q?FJ7XwMEcrH2sbroW4WsheW6zHFVggfD7ail7z5yZ5DUYrEESk1kSSot8Q1Pv?=
 =?us-ascii?Q?/Wq4gMIM3D9Ad1h4vPUx5zRQnehpeVp/cZMa7LHJHQ+eMYl1hl2qhsV8eT9v?=
 =?us-ascii?Q?z8p9a3BgVF/bykGudLdppoZM86VUlq3pSqvjp277BP/GYYoW3AG1Wj2TeUgo?=
 =?us-ascii?Q?0gaJtgDxktO/HhuRUbZACjFhBNnVlgQWA7QO9ynLqyCGVlLVptmPJe7Zp+Dk?=
 =?us-ascii?Q?bvyzMmJbmh/T26dB+vfPvgCx7vo8WxFnac36wkxCxU8AqAmtDx0shWH9IazH?=
 =?us-ascii?Q?DpXRU4RkHt8AYDZWD0I3knL5aECU9p2dpUyw/7TUnOadfEQUMdEBw5eK8x+o?=
 =?us-ascii?Q?EdUpGy7X20JRL3vRymktnLKdVxBG+xpWE+wC2sdklAkU3SBwQusmWueb2WJe?=
 =?us-ascii?Q?CmQVxmeELL8oJS4lhCxRb2TONNAhmDax7FWfbAkjPzLwr+FJ5On+yPHDRVX9?=
 =?us-ascii?Q?7CdPDoyR/0gG5Yx1nU9ErbIs6KtHSsp0kQEc9uJu8B2uaPzOL6iSoM2q3fkE?=
 =?us-ascii?Q?WL/8kSg8w9lVlN48y2U9XIma9svLyWFikhKlgkN4PwdQIXFHhjvUCxNBObkI?=
 =?us-ascii?Q?F9s6aUPps621vA0S228zhKYKKlepJOYkeYiH6sMZmUD11IlZLUZUI3tzeY9b?=
 =?us-ascii?Q?DqGUTh/xk1JUodNZLwN25YXJr0mBgxhqmrjo3zU832H4DaBy5rt6znmy0L76?=
 =?us-ascii?Q?9Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b7353d32-9ddc-4978-0c37-08dca59b82bd
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 13:30:51.2677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z5Er3H6HJ3AM7J+UXg2VhXROQ1L/0UUlOOojChBf7PNV9ZTyBtXnnI/eLLomsNh2H4d7qNzYcI6eGP3gwOfCUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7648
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "libhugetlbfs-test.32/64bit.counters_sh.fail" on:

commit: 003af997c8a945493859dd1a2d015cc9387ff27a ("hugetlb: force allocating surplus hugepages on mempolicy allowed nodes")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

in testcase: libhugetlbfs-test
version: libhugetlbfs-test-x86_64-1bb2d54-1_20240614
with following parameters:

	pagesize: 2MB



compiler: gcc-13
test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480+ (Sapphire Rapids) with 256G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)


the issues are random in our tests, but keep clean on parent:

64548bc5347bd051 003af997c8a945493859dd1a2d0
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :20          55%          11:20    libhugetlbfs-test.32bit.counters_sh.fail
           :20          65%          13:20    libhugetlbfs-test.64bit.counters_sh.fail



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202407162105.5eab5c8f-oliver.sang@intel.com



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240716/202407162105.5eab5c8f-oliver.sang@intel.com


counters.sh (2M: 32):	FAIL Line 349: Bad HugePages_Total: expected 1, actual 2
counters.sh (2M: 64):	FAIL Line 349: Bad HugePages_Total: expected 1, actual 2


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

