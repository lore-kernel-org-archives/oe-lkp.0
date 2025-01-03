Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7D018E361
	for <oe-lkp@lists.linux.dev>; Fri,  3 Jan 2025 08:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735893546; cv=fail; b=Y++QykI03VXdfWtI+/0++/7PXPACISeHR9veuGhOreg6m8Yf56r4PsZH9lgZScbRKJqb5uzhTOpDqWe2Fzuq1GnxO8H2ESlHAGiogNb2DxQOcMJRUklnBeo+I6pe0ThmlF+8kkj05CJ47NESwuWeXXlhRWJDBc/Cs6QHtPBTEsI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735893546; c=relaxed/simple;
	bh=qpIvBFWTzB7diQH73USgR07nNShfFh62rXqwDO8T2Oc=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BuMi9C61culA4NapAlopu+zVwcOVJpA5vLrcrVXbSS/P6Ov5wWhKQC9ZivLR8g7XwdkljSYBVJj9+811glkbXcet1lQcpjOCPTh1TnqUsqH3bHhOjEzDCkom7Eea0JsxV3sv3Fr46FEeD+nB6ZJ5JdkSRht43WGxRevbzCptCr4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HD9IbXpn; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HD9IbXpn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735893545; x=1767429545;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=qpIvBFWTzB7diQH73USgR07nNShfFh62rXqwDO8T2Oc=;
  b=HD9IbXpn4BMIdetM3SNN3hrXMwWMpe6w4grt/3bk4SPvukMbrH/a5C/m
   GE5yaImEMw+1IUolxKHRlIOXEX7HrClmTEOpAD3s9l2YxduuB7NqA5MMP
   J0LMyaJmtpyDBUx0Yj1jLUb4m/04iqHQ9yToD6jKpapyX53fkQsvUI/g7
   c8nZAzBp9YpjVR9WeW4srz9aWONIzx45FUGz5BcfsHPXOchOw6AbNQ4zy
   5axfBQ6ZHbhneZWwGo+lC3zVgYebfBbe6dq/z0jswfLaeDXbdWclo9YxL
   5qBTTzuWVfpRff96RCY7wiOVHlB9Z02kJkgZAgzMOQNgBcS5j2yP0FAF0
   A==;
X-CSE-ConnectionGUID: 5d+qEk1NQwCb+anzr5r8YA==
X-CSE-MsgGUID: QLeuUhHoRJGmSJSGCRZbdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="36366544"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="36366544"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 00:39:04 -0800
X-CSE-ConnectionGUID: g1QvVt4iSCmHVXMlpGA9ug==
X-CSE-MsgGUID: uBEhZRICQfqZhZOz0IjXPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102615594"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Jan 2025 00:39:05 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 3 Jan 2025 00:39:03 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 3 Jan 2025 00:39:03 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 3 Jan 2025 00:39:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YusQUpx6hdR2wrfSY/2a5ZgdNIE2lTFJcE3sOQHvY9Kjlyb1gzDV6NqRjbudk/a+tYtnPHoUtg0Vo2KHvWqWL+FRkvGTmQg0breCZL+aTwctHO3K55Q4jCBPg2R+YaxMAoneOcdAxw4V0V8SnuBWgooi/DXwK/jp/yiIVz8sKfH+JIQqINWTudteE17UrjFMZ0nby6pHEUIwIqv+mBHg7cgECwAkDN3ptxG2xmjPDgt/QAs3E80BNUWQax3ZKjY0gKxOSB+i9E4hWwY4vHHDSS2DEMduEkBcIRVC7ZtgoEcGEhHxrTR/mWi/pMcFy3LK7uehr/Ca87liozi2pIQTsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IrAGur2l2xQUyXr85lcc5Kx3CIVZh8QbjD4+It0QIEc=;
 b=taYigRpAvNdM42xIAOQIsDBeaUr3uyOFTHq0DiuZq7Y9B3B3N19BCSzvvXyDT3SXKXS1Y0ehBIcDMCSjfhNNcao+lS08NzgUOKeVO//PfkkbMEJFAi746SyKw67fxGluzlzGxO6y1AIw+/FW0uqfFqRXhPeBAZAyPmd7MTdt9nkuO0NCaoCkaCoX1OlWibEvosM5oQ+EYhmnYd/5Gvr28eIpSUGOmV5ACknVod0fLvkw1kpYGcT1H6Fc///LdVA/PJipkNKOxR5OR8M5IPNRYjZg9i7tC2we9wPPwgxH84xyk+dA5fBRlQglw/vazjF2xwVUPe3G2Ub2ovakvmeFMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by LV3PR11MB8482.namprd11.prod.outlook.com (2603:10b6:408:1bb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.14; Fri, 3 Jan
 2025 08:38:53 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8314.012; Fri, 3 Jan 2025
 08:38:52 +0000
Date: Fri, 3 Jan 2025 16:38:42 +0800
From: kernel test robot <oliver.sang@intel.com>
To: <kingdix10@qq.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<akpm@linux-foundation.org>, <andriy.shevchenko@linux.intel.com>,
	<ilpo.jarvinen@linux.intel.com>, <bhelgaas@google.com>,
	<mika.westerberg@linux.intel.com>, <huang.ying.caritas@gmail.com>,
	<jhubbard@nvidia.com>, <peterz@infradead.org>, King Dix <kingdix10@qq.com>,
	<oliver.sang@intel.com>
Subject: Re: [PATCH] resource: use kstrdup_const to prevent wild pointer
 issues
Message-ID: <202501031658.51df654c-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <tencent_3BD5C192A0E62121DE44D1A05A9C9ECB7C06@qq.com>
X-ClientProxiedBy: SI2PR02CA0044.apcprd02.prod.outlook.com
 (2603:1096:4:196::17) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|LV3PR11MB8482:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cd903d9-4180-46eb-572e-08dd2bd20d7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7axCqf20WtNkAi3Ikv61w/sfhi8/7GYQ96wAEAKMTwenciyprxYuZUX2GyHv?=
 =?us-ascii?Q?PeN4qfNYepQVsD5/dF+2HrEqgStZ3HgoD0EsVc/4vzdINh/YGMHiLcvjz8EV?=
 =?us-ascii?Q?v3QVrv3/ixj8YtfMS93rS4jxTzdcq01kVDrnOnSyV6bIYgXIFSab+KkEi9WF?=
 =?us-ascii?Q?6ZVmAsAQFMzmCReO/smNVt+5yHGxaZY9IbSTblbFT7aDG92HU6Q79SBBN2fn?=
 =?us-ascii?Q?wUc7dzxj0MVkmv4KTWaCCdnJ1aBupMvgwINANDwVPyVjasJwiwI5CiSOBYks?=
 =?us-ascii?Q?X4zpLFNCTcXm5x12peaZcCcUzVM72hwu9mhpZTEKccdA1NCMzzfh7qJvGVhb?=
 =?us-ascii?Q?+iuahFeLhb11ctN4fmdUFMUSKlfn+tRHEzvFnynFLlcEXaCmFnS8V03Q8bfz?=
 =?us-ascii?Q?SBJjExFL6I+VM63XSmtyGKNaA0PPcG+vb/LkuysqtfExM6zTqRDgKMbfeIPK?=
 =?us-ascii?Q?/ij+RlNLVvfz5BZIwrpP+sNHCgWihL4xegQrWfcAkmi9dJ9Oi2eTdZ8l8lld?=
 =?us-ascii?Q?UN4pp9FW0o8F+cLmePnTlT7LJ+mSA9CQZCqNq5/tcHKAzctjj+e++/O9czjn?=
 =?us-ascii?Q?rWulrCiyXqHGhuUARMw3lxkT5pA1WIwU/G+XJ8xyZy+9chF7qICWhR88nEyJ?=
 =?us-ascii?Q?otfvC87bB2Ejif+vlLG/9uDe+/nSdhbK3QrvW9QVNaVl35zotmnhm97AomS9?=
 =?us-ascii?Q?3zv+wY5RTThKxRiBrIZJ7rsYyeMn1JiqRdmpm9sZbXLIPW9yst1Vuv1hrr/K?=
 =?us-ascii?Q?00Pva7KpPjLVIVA9Hnj5ktXvU1Lb050ROnGgmSNoi/rd/U/c+cyMwN5wIj0w?=
 =?us-ascii?Q?xqqGM6sX3k++KmrllF+rv0qZLDDlxL3bAJ8VTRk8/9YEsOnWSAFuYb+/9SA1?=
 =?us-ascii?Q?FJQhqrOK4uVFDUYho9ISZeRLKmd1Dwb+9TgNK3wg5NBKZkGbg0UnY9LWc3Hb?=
 =?us-ascii?Q?jt5udUUNix/a4Bgowm5YP5kqef/Vp089wNdYCn5ASq7FypP6PpNKfJJhlUck?=
 =?us-ascii?Q?JiChppVKd8/I9ddDIqIpueFgzxJChZAEXbc54mA08l34ZkH+9EazLUUgaWEU?=
 =?us-ascii?Q?rcTxgXnE3Pp9sCBW5m4kP9cnvcvSn7LAW3jZoxEJdWUeyRBOp8d5m7cpuuC3?=
 =?us-ascii?Q?lNSFLPgi0oJvftRLGJryPp+sU90gt1gg67cGCQNQ0AU66Dfup4L4amOEWYIo?=
 =?us-ascii?Q?4XJ7HmpqwMcB+X6J5ENm0xVPMKNYxvWbPg4z/iHvviPPh71DUMHznAE03PrQ?=
 =?us-ascii?Q?YNOWqHwTDy5ZGTqctLdBvFgdSsuSNQWv+Bp9yXtPkPr+mDGHhSqQPA/efduw?=
 =?us-ascii?Q?CxCX2gTkEDKyi/XySFmEl3MrDpAhvqyuUwF/KN0juhqqew=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PYSvBQnJI/9azJT4STdnssUanDkutQgWrJcmpwSPz062XQXiUcefUB7gsJIG?=
 =?us-ascii?Q?CLH11VJoB0SNZf0To/t+QmICmzQbvPQ/xkK6UTYVCMHKARgoHXHTOdcIZ5jk?=
 =?us-ascii?Q?Pt6771808vVtAdsoqYXnjz4KqjRhaIYbsmyw61UyPf6kmlma7W7kpftTS/XI?=
 =?us-ascii?Q?hRBSQXESfoB5SxpVzCLfy7DdoSyQpS8EYf9PtjB4H8VPOEOlcpanzyiKurQW?=
 =?us-ascii?Q?dpkaWhxjBqZu9uogmkRHawYWLdbPvbJMJ+Mr6igisX+lcRuDouOaamo+OFJP?=
 =?us-ascii?Q?J2pm1eHwTAjix7X7JjIzzOFQSX/izgbyCKPyE4SPy3Tb+4JfdMAPrPTR4mYx?=
 =?us-ascii?Q?E9dqNekSAlac6PV66tw20PKERvrp2xtJ9OtyYIlLTrd37GIGihE0rsmKXeTW?=
 =?us-ascii?Q?AFvJMo190jNl9laZxt5iGUEAJdtDpFmvGIDjo4/ace98eCu3H4D6PEaK4mGg?=
 =?us-ascii?Q?GmekEq4mXBOZHb8R9v/SiR9hIWCxXdww0kTFiforr5X7Krw2GnH34pAR6ULL?=
 =?us-ascii?Q?Op1lLt3wUoAK+sPDJ3prP3XadZa2OOOroHSlH7bhbL5g1fhECIvlxyktXt7g?=
 =?us-ascii?Q?EsUrKottuI8VOkrL+zve7ZjDyfTNOQg6lvtX7cbnUFU7Wv1+FJQc+/xCmimh?=
 =?us-ascii?Q?FqwJoghhC6wi5fufY1BwcwxNiCIVCFxroXObOBG3Bz+ru2iK1BjtWIdP1U/N?=
 =?us-ascii?Q?7v+Mh16R4nOq1MTIwrdcUtLJVNzdTv+nABTz8H8S8Av7GGWhRhkGsKsraNK/?=
 =?us-ascii?Q?hvAX3elIgbwhodfDL36/C3+Xu19fx5eGaYRfItNbo4Vx7gXNX90lcOxPQFFS?=
 =?us-ascii?Q?cTzsE+pIaqV0AkuS+OTqQx9+v28Q0uRBqFIpXGX6/uX1zF66Mvp0dbmQP729?=
 =?us-ascii?Q?VDTyxXuBazeZza+8OL91FuCr4HvhXXcsst/UcigFLXPrntLdRN1xXRYbzDzB?=
 =?us-ascii?Q?xyNDB0Q2SqeaBq8VLyllchb0B6x/5Ba/hh35EmSeimVV4lw5y27E8i7NRRdf?=
 =?us-ascii?Q?vFqgbalbGW95PcukWzO36w/2977zKgLksVL1/+xNrDJ7v4Q6iNDyF/JLydUZ?=
 =?us-ascii?Q?fYRABmc93GEvdzG/5rSiT5/kD0J0RYT67VhIbd2NQwYHygC1Tj/sea6AMRcQ?=
 =?us-ascii?Q?xOO46XC9lfQdasKo06Bk9JNBcx5OJ+rauumCzW/pxQ4mStWmi7S3g2rkEK7Y?=
 =?us-ascii?Q?vYiwrl9gwa99innNN9ywkDNvBLckvPI5iH3a5xeVUxqHLh5wASwMX7GFb6Hg?=
 =?us-ascii?Q?I3AlOzQoVLTFpnKTXkQPa54sKWxSvK8nQTHhCVoQxf6WDgb13qZ31eJv3k2x?=
 =?us-ascii?Q?ZtQZ3rm1MC6MsS53B9XDM9bASXPA7y6OJXR3vemyQeALRRZ78cFZp0bqP/5W?=
 =?us-ascii?Q?ifRfOk5oVeQehddJJERsg7oPwsP09o1Z73AtetdUecSDu+nMcttc0YyOZsIL?=
 =?us-ascii?Q?SgMRt3NdjNTJwpms3M1rqWwybCn1m0rZ7p/8lEUncEKhTdy3MSXFiY9/Dc/A?=
 =?us-ascii?Q?10Vf/FWagnjGjMgDbg1VQAyqZ3OAwrpjscyRvnYy9TGNI61c3UKuUabOBe+S?=
 =?us-ascii?Q?kzc84SgVZ8uRdUDwqTvlrH+9/7zgL0kzirIj08ubluIkeCVVBMwQLOij9hvC?=
 =?us-ascii?Q?pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cd903d9-4180-46eb-572e-08dd2bd20d7d
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2025 08:38:52.9171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mQglmsnn+Ikv1RsRn5wBJ3hTat783VCxX1Mrzpd4pmTxg58qq/UJxPRldGLr4rmHh0VqzWfPCHExLxrl366ffw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8482
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:sleeping_function_called_from_invalid_context_at_include/linux/sched/mm.h" on:

commit: 85f3f9e1bca4488dcf0032c11c2d0b59352971a0 ("[PATCH] resource: use kstrdup_const to prevent wild pointer issues")
url: https://github.com/intel-lab-lkp/linux/commits/kingdix10-qq-com/resource-use-kstrdup_const-to-prevent-wild-pointer-issues/20250101-215639
base: https://git.kernel.org/cgit/linux/kernel/git/akpm/mm.git mm-everything
patch link: https://lore.kernel.org/all/tencent_3BD5C192A0E62121DE44D1A05A9C9ECB7C06@qq.com/
patch subject: [PATCH] resource: use kstrdup_const to prevent wild pointer issues

in testcase: boot

config: x86_64-randconfig-161-20250102
compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+-------------------------------------------------------------------------------+------------+------------+
|                                                                               | d77847ea04 | 85f3f9e1bc |
+-------------------------------------------------------------------------------+------------+------------+
| BUG:sleeping_function_called_from_invalid_context_at_include/linux/sched/mm.h | 0          | 18         |
+-------------------------------------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202501031658.51df654c-lkp@intel.com


[   24.398603][    T1] BUG: sleeping function called from invalid context at include/linux/sched/mm.h:321
[   24.399830][    T1] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 1, name: swapper/0
[   24.400487][    T1] preempt_count: 1, expected: 0
[   24.400919][    T1] RCU nest depth: 0, expected: 0
[   24.401295][    T1] 2 locks held by swapper/0/1:
[ 24.401659][ T1] #0: ffff8881003600f0 (&dev->mutex){....}-{4:4}, at: __driver_attach (drivers/base/dd.c:1216 drivers/base/dd.c:1156)
[ 24.402502][ T1] #1: ffffffff95689c58 (resource_lock){++++}-{3:3}, at: __request_region (kernel/resource.c:1264 kernel/resource.c:1330)
[   24.403255][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G        W       T  6.13.0-rc4-00416-g85f3f9e1bca4 #2
[   24.404161][    T1] Tainted: [W]=WARN, [T]=RANDSTRUCT
[   24.404599][    T1] Call Trace:
[   24.404862][    T1]  <TASK>
[ 24.404862][ T1] dump_stack_lvl (lib/dump_stack.c:123)
[ 24.404862][ T1] dump_stack (lib/dump_stack.c:130)
[ 24.404862][ T1] __might_resched (kernel/sched/core.c:8767)
[ 24.404862][ T1] slab_alloc_node+0x12d/0x1b0
[ 24.404862][ T1] ? kstrdup_const (mm/util.c:101)
[ 24.404862][ T1] __kmalloc_node_track_caller_noprof (mm/slub.c:4293 mm/slub.c:4313)
[ 24.404862][ T1] kstrdup (mm/util.c:61 mm/util.c:81)
[ 24.404862][ T1] kstrdup_const (mm/util.c:101)
[ 24.404862][ T1] __request_region (kernel/resource.c:1266 kernel/resource.c:1330)
[ 24.404862][ T1] ? device_register (drivers/base/core.c:3748)
[ 24.404862][ T1] ? wake_up_q (kernel/sched/core.c:7088)
[ 24.404862][ T1] __parport_pc_probe_port (drivers/parport/parport_pc.c:2073)
[ 24.404862][ T1] ? __dev_printk (drivers/base/core.c:4962)
[ 24.404862][ T1] ? _dev_info (drivers/base/core.c:5004)
[ 24.404862][ T1] ? pnp_device_probe (drivers/pnp/driver.c:95)
[ 24.404862][ T1] parport_pc_pnp_probe (drivers/parport/parport_pc.c:2917)
[ 24.404862][ T1] parport_pc_pnp_probe (drivers/parport/parport_pc.c:3039)
[ 24.404862][ T1] pnp_device_probe (drivers/pnp/driver.c:111)
[ 24.404862][ T1] really_probe (drivers/base/dd.c:579 drivers/base/dd.c:658)
[ 24.404862][ T1] __driver_probe_device (drivers/base/dd.c:800)
[ 24.404862][ T1] driver_probe_device (drivers/base/dd.c:830)
[ 24.404862][ T1] __driver_attach (drivers/base/dd.c:1217 drivers/base/dd.c:1156)
[ 24.404862][ T1] ? __device_attach_driver (drivers/base/dd.c:1157)
[ 24.404862][ T1] bus_for_each_dev (drivers/base/bus.c:369)
[ 24.404862][ T1] driver_attach (drivers/base/dd.c:1235)
[ 24.404862][ T1] bus_add_driver (drivers/base/bus.c:675)
[ 24.404862][ T1] driver_register (drivers/base/driver.c:246)
[ 24.404862][ T1] pnp_register_driver (drivers/pnp/driver.c:281)
[ 24.404862][ T1] parport_pc_find_ports (drivers/parport/parport_pc.c:3118)
[ 24.404862][ T1] ? driver_register (drivers/base/driver.c:258)
[ 24.404862][ T1] parport_pc_init (drivers/parport/parport_pc.c:3380)
[ 24.404862][ T1] ? parport_pc_find_ports (drivers/parport/parport_pc.c:3354)
[ 24.404862][ T1] do_one_initcall (init/main.c:1266)
[ 24.404862][ T1] ? rcu_is_watching (arch/x86/include/asm/atomic.h:23 include/linux/atomic/atomic-arch-fallback.h:457 include/linux/context_tracking.h:128 kernel/rcu/tree.c:737)
[ 24.404862][ T1] do_initcalls (init/main.c:1327 init/main.c:1344)
[ 24.404862][ T1] ? rdinit_setup (init/main.c:1314)
[ 24.404862][ T1] ? rest_init (init/main.c:1458)
[ 24.404862][ T1] kernel_init_freeable (init/main.c:1581)
[ 24.404862][ T1] kernel_init (init/main.c:1468)
[ 24.404862][ T1] ret_from_fork (arch/x86/kernel/process.c:153)
[ 24.404862][ T1] ? rest_init (init/main.c:1458)
[ 24.404862][ T1] ret_from_fork_asm (arch/x86/entry/entry_64.S:254)
[   24.404862][    T1]  </TASK>


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250103/202501031658.51df654c-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

