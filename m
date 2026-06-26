Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAF826E173
	for <oe-lkp@lists.linux.dev>; Fri, 26 Jun 2026 06:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782456882; cv=fail; b=J4835FfYQ+hETkjhxTVkRCs0iNlF/zVQglvEv+OU+FIiprAXvvDLcGhvQMwXPtttpevvhGiaiu9I3dyI1nDxWuJ2eRm5jr9iuEkGDD4SOtwT13nTe4cN5AbJXeNeOHCUyuU4k4ythrSUrHQw4CExYlHROsYL0l2gPvO0zpAQH9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782456882; c=relaxed/simple;
	bh=Dcipue3RRptRkHE+K75AParNhadICOkAJR4Ve2i32P4=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=LbH8xwhJiYzTgmElsLkNOPJVHsMgZBSUtlFH0lD0tARkULqw0+h8pnXwDsdi9UHoEVyjp3DmIIeGfPuGGskWlBR5Qeu9j710scLbezx1Sub1r8sE1denH29tuIYpPmABAmY+nzfW6FtX3h4l/ovW0YXywBw6QRiwfJJo6GUnf1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lzep3X4g; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lzep3X4g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782456881; x=1813992881;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Dcipue3RRptRkHE+K75AParNhadICOkAJR4Ve2i32P4=;
  b=Lzep3X4gwzvEs8QlSmTnC4dJLIyHyyw3tw6elJTSGQnjkWZkb9Q/HFBI
   BalkHDJ6h6JcPJG+ms1W+Cj95pjoVthH7cTYttBhcFyKY0KZhHx7Qkm0O
   vGc8EsJFGQ55sA76CEpIgs1tLkQvFieRC6gSLz71JQ9cFYePeIcP5FyRP
   xdDxCZd2jq+oTNkFftw5kDGeeRxx5ujXFhi8LQ6djqQ8AyXxdK7YCt0zv
   AgldNwk/kOyGbapBmVWBehbhWHoGQQRCLza2FyO8o7KlfUKvLMprhykwN
   o43dpT9h3d6FyJhk1fXFPFreLWPLIephPmqa89lkXpsjXZlkqnU4jiBCF
   w==;
X-CSE-ConnectionGUID: UrBhgcJKR/aCKuCxG/BoGw==
X-CSE-MsgGUID: CBGJrc9gSJODzkJgFOmO4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="83258214"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="83258214"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 23:54:41 -0700
X-CSE-ConnectionGUID: 73M7oeWCREOQ35feGrEozA==
X-CSE-MsgGUID: 9lQ1OX3EQ1iHh6Cx7xMNWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="255676277"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 23:54:41 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 23:54:40 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 25 Jun 2026 23:54:40 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.32) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 23:54:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LGovcRd377y33sSkHwo1RG+Q+en9d6hLKwbvGGnTfnkGSnVaZaCD2cL5YptEsW6Co02s5lKA6MAneJK3/NwdSxGnuyBZOFwuQIS7wM1ZmT+iKNKEs897r2Uh7wJisF1IfCdugN5YaYd45gBApmTx7ty8A8tF2fg0dKyyOBHNmCh70X3xukPK0jUWrAUga8fgAisSHMk/ATARkWrjco/kTtrPPjUKRyj9SCGMv1R1WoLqYyewTD5sl/K77Sst3oPpopilQuCqk+M293GFD1nbyaYjuNLPeXfZyG4AF/6mTnSQgirmT7RjMlDYo5yQZ/iIu/vD4dx6m1XcSB4OeX4ZKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=505UopfO/dCjDXrdRP8hT14CMmNCi04t+OuZiEXqIy8=;
 b=CDDJwX/+lRdoe7S6CTEx9i6s0BqugWMy/UigV6Q2Q1avUkkAinDpEF8uRrSkeATUkYYhK5U4+vGcj/8XagPPbcljLuis0jEyJ0D+ViwKpmUU4BwGLXjhIhPrgmwQNSwf5XB9GbYtrjOomrU+fvRAR3AIQsUCho0dzJ3ePjvc4faVXL8HAzw3kTy777Q0aBOFUHi8MMnx6vGU5Iv2nwjYY0L4pnjfVWdBiGkggNbGiodYJks65tbNup6k45/stN5NoIOAkYzLdRYfGdEdmYReV9dS+dsZ9+jZoE6XjmS+RVRYIV6ZJLDSw9tk/nEpkPAI3eKz0bHpvL/zW9ViPkoILg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by CH3PR11MB7275.namprd11.prod.outlook.com (2603:10b6:610:14c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 06:54:37 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%5]) with mapi id 15.21.0159.013; Fri, 26 Jun 2026
 06:54:36 +0000
Date: Fri, 26 Jun 2026 14:54:29 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>, =?utf-8?Q?=C5=81ukasz?= Bartosik
	<ukaszb@chromium.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [jimc:jb-fix] [dynamic_debug]  d405145208:
 Oops:general_protection_fault,probably_for_non-canonical_address#:#[##]SMP_KASAN
Message-ID: <202606261437.36507000-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: SG2P153CA0018.APCP153.PROD.OUTLOOK.COM (2603:1096::28) To
 PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|CH3PR11MB7275:EE_
X-MS-Office365-Filtering-Correlation-Id: a7a59750-4c86-4bd4-3de4-08ded34fc932
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|3023799007|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: uG0FqzpxFYm96l4tWhO2/jXqbKmSjWd5yXkR6iyrfrOB0mkGRef8WzXKMQArm++dCICMhaY0u7YfyxMOPe4oBtHSXf/yY6YmoPW9llpkRkqpjnlRkzbJLHZRfwusc8NBKtniiss52udGrsqVtNpqo/bdoMh3JQLzmAUSvJXIGaLVd0iuVx1q+GD+2gUyYHmsDmz7L/LkhxBRsZ7e6cGuZYo33vfZOyretmy1UxVtkYMWVWUpDJyLL+pJKTAtqPk+NCK8H1N2IHHCmgyO4avTjemMomvite0hNujk7dyMqaxDjC+XA3RsY1tzeHrcJBRELP76L5VjA9P4HLnLSfG7/7k/HcPHObCCXAS0d6FP7in9doLNK0jpICBipeGv5U742lsSnzExyPk4mLjRHwDLGhMYsJpz1ocz2GZ1VGxiFBEnpX8Zc0duXNjnspx7f+nAvtJq8S4BFXQGb6HL49QTNs1bzRqmwd6XV4Q+sJcyixdlTcrIR5s/5h6W1U39RWK9HSO78AFgAaGMzedFX5B2xyL+QpG4XNWy8ZsKT3iiJrOMMg8IJ8XOV2CsIJkmzUcCYY6mYyUry40guf3yi2hJYAaWZaXZPgxiKC6VszZgueCIY/PziHbqnj6uW4QpC8WA
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(3023799007)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?19BbT71dRf2sUaCyV+xZFqbc+VfujoZgUyDyqQpR0ADUMNZ2tLsaiqLBGmoM?=
 =?us-ascii?Q?fRVqgFHRl1DOWcXFmgK/3+J37NC+kYN6N0vgiSZjBO1MixvSbffGOsPJc+vw?=
 =?us-ascii?Q?fRuO8shkRnlYW4DlRcwuBG1WajByoRGmNSOLRsiYyCQWXUkIQ0V54WCHlx6P?=
 =?us-ascii?Q?yRQaifEW42IVAcAfMdjHMsnCpDdoomJw4owlPbX2A4DGudx+WTepM/n6bUe9?=
 =?us-ascii?Q?wyRs61rTEID1SkSrtI3M8jap+j/g9y0til2MW7Cm60xAWD3d4hnUF1TWOlp/?=
 =?us-ascii?Q?1AgACf/CuaYYNGT2y42DfqtK3tgNM0bd3vmJYLuqIrKdZTIQiU6GocO7X/QA?=
 =?us-ascii?Q?6BqnqhlwjYmbMBYpO0WFMTuqBp3/SA/ZekM50z3LgcJZsZorVTgRXBPAIQa0?=
 =?us-ascii?Q?48VofSMqxn6z3RwbrfZLtT0mh4/hOQpzqe2PBuVoI4NdrG/vgo4aDi63CdOA?=
 =?us-ascii?Q?+eg2pAv39YZN4UMlVkGgbcGhXCjlrSqQ9QueAhwgt+H9jPi+NGHLFBPxA81P?=
 =?us-ascii?Q?ahuYPf0nEkBOTrla0ojxiwg6c1SGS0kW2ctGs/ZiomLUhCbzMsg3BZ71dxfs?=
 =?us-ascii?Q?ZQJcanMQCXmYBb34Aq/MwBfy5ZQrF/nfS8uox536DjVCWlq/XGHn9HTMNxTv?=
 =?us-ascii?Q?W5d0jDYinpuDZ/GgihDmpx+JoH1jU/EZJS+u0BNtKVH3X7DixhvRevmTNa9s?=
 =?us-ascii?Q?59sdDPyoKaHVp+QNwB4uuLACQtmPdFXOu7GYGcsaSW62Pg009csfSBAEHtGk?=
 =?us-ascii?Q?KuB7GMuqwcUV86aNW+pAZ176kVf4lUSnqMO2R5oVZvf54PTlCg1kiqJBcNB3?=
 =?us-ascii?Q?8SAnKjcSMnMueV0G8T1Ot+1aA0qT+Pga5XtKg1Jd7msKiM+s23gVN5akrmA/?=
 =?us-ascii?Q?naHrvtAw822Xjd5/XctfNsEx+eI9ETCE0uofyar4BucpQqVXqbTJrX3qwIRj?=
 =?us-ascii?Q?vxDey6Isw8WwscqNLH4LTaAVASjdGLKlEb/oJ2rzMxAtUtCHBGFAt/wTt7sd?=
 =?us-ascii?Q?54ZMbOOh2ofNdRqqALcO+Ug8duXcQWQB+C+AY7yzQ8gfHXMnX1CuxBlssxI7?=
 =?us-ascii?Q?aaGyV0rDgNIq4lpyeMJj79FRm83L8GuIiJITzPIjGXYDS0cpkHlI7P2n/Gxs?=
 =?us-ascii?Q?8EAiQwYGVkCt6eyQpzdcLkXTry5yMzmXVLPoeNLrFtAEVz9/PLzOO+5WdqMG?=
 =?us-ascii?Q?CSGLKgyvVJWHm6GZf3b7DqrxybOVsezDiIQf0tvllRf0BKyopgH/B1DKfG3f?=
 =?us-ascii?Q?4UuzmnibRupBGijcFOdcQjrTcWLrUMY42x1wkC99zQfySMO0Qw7fsJb8pN28?=
 =?us-ascii?Q?SlNzpH7TF2gGe0A1DNSb3iikj4CTdFEBrl4RlV5mG3xqyuFdFeeq+R4GIHVv?=
 =?us-ascii?Q?DVpBtL+jiDFRGdW0pEP4b/GS5f4QhVYgoCu05kl1aGUu+117Op1jzMLyfHTi?=
 =?us-ascii?Q?myXkGYSbUQ7HWHl9hl4f5SCdE6CCb2ki2+MFtxwQoYkwDZHBVcs04p6bvCyr?=
 =?us-ascii?Q?ooE5+4NLlUvqPaKXg8s2cHB8r1eIjewVrvO8a/72SWRB2uQA4+frqIN3rGUg?=
 =?us-ascii?Q?uUz3bYY4c9hQkrhbch+9qWg7tQo05NDhHNqk1CKoU+MBtu3L3/VNkWxtkfsy?=
 =?us-ascii?Q?MhsVr8wxqjW3eEB3dxyhKltFEX19ysO2XUEFzGx4HaU1YCMM3gF+DRDumHke?=
 =?us-ascii?Q?HSPlv+cy9C6wcXunzo/oQmXgQZtyNH+uaMFP8OyIgcN5BXjXD3DQ7Xkwbr8e?=
 =?us-ascii?Q?2d6FYWRykg=3D=3D?=
X-Exchange-RoutingPolicyChecked: tL/EvjJyAVQ9sx2b6mkGDHDyiBf+1DcagDOQvABTvP9s1fxiQY3/2iO3zyvtXCy9X1Ux+hbsJiTZPzGjjxCTi4zF5psVIopWw4v6QN9yOhk4nMFdbIuQ5yh24ezz4nTEJUz6ZGnz3iE7aC7M6WwNr2aKUu27mtlfM161mDq1Z3EyZ7A301vMC2NP2fwBYjll8b4gdoJvVUgxRQAXacC+efVKqh1hY0xUUcQ1GzGZ8zYAKWupEmP3J0Hkt2y1v2N+4t0B0gL8vswIz0nJ9wua6v/6k/06inQzJCYjquJdhU62i1bhPzTf9wdS/AfV0ir26a/nEN6h3gA4Uk9slkbO8A==
X-MS-Exchange-CrossTenant-Network-Message-Id: a7a59750-4c86-4bd4-3de4-08ded34fc932
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 06:54:36.7441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ZjpHMA+lyPlD57/AqnuG13okqr7RVC6CgCU7GdI1PTORlG3XNSY7Kf7pY+PwpnYkq4w5dBH81ybesB/nUfALg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7275
X-OriginatorOrg: intel.com


hi, Jim Cromie,

we understand this patch is to fix the issue we reported for i386.
https://lore.kernel.org/oe-lkp/202606172227.34266a1f-lkp@intel.com/

however, we found it caused regression for x86_64. just FYI.


Hello,

kernel test robot noticed "Oops:general_protection_fault,probably_for_non-canonical_address#:#[##]SMP_KASAN" on:

commit: d4051452089e61a8aa3b39330981fc21d40aa60d ("dynamic_debug: Simplify classmap macros by removing redundant aligned(8) attributes")
https://github.com/jimc/linux.git jb-fix

in testcase: boot

config: x86_64-randconfig-004-20260623
compiler: gcc-14
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202606261437.36507000-lkp@intel.com



[    2.487444][    T1] Oops: general protection fault, probably for non-canonical address 0xe007ffe1e0000000: 0000 [#1] SMP KASAN
[    2.487955][    T1] KASAN: maybe wild-memory-access in range [0x00401f0f00000000-0x00401f0f00000007]
[    2.487955][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 7.1.0-00050-gd4051452089e #1 PREEMPTLAZY
[    2.487955][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[    2.487955][    T1] RIP: 0010:strcmp (kbuild/src/lib/string.c:283)
[    2.487955][    T1] Code: 41 55 41 54 53 48 89 fb 48 83 ec 08 eb 08 45 84 e4 74 65 4c 89 ee 48 89 df 48 83 c3 01 48 89 f8 48 89 fa 48 c1 e8 03 83 e2 07 <42> 0f b6 04 30 38 d0 7f 04 84 c0 75 60 48 89 f0 48 89 f2 44 0f b6
All code
========
   0:	41 55                	push   %r13
   2:	41 54                	push   %r12
   4:	53                   	push   %rbx
   5:	48 89 fb             	mov    %rdi,%rbx
   8:	48 83 ec 08          	sub    $0x8,%rsp
   c:	eb 08                	jmp    0x16
   e:	45 84 e4             	test   %r12b,%r12b
  11:	74 65                	je     0x78
  13:	4c 89 ee             	mov    %r13,%rsi
  16:	48 89 df             	mov    %rbx,%rdi
  19:	48 83 c3 01          	add    $0x1,%rbx
  1d:	48 89 f8             	mov    %rdi,%rax
  20:	48 89 fa             	mov    %rdi,%rdx
  23:	48 c1 e8 03          	shr    $0x3,%rax
  27:	83 e2 07             	and    $0x7,%edx
  2a:*	42 0f b6 04 30       	movzbl (%rax,%r14,1),%eax		<-- trapping instruction
  2f:	38 d0                	cmp    %dl,%al
  31:	7f 04                	jg     0x37
  33:	84 c0                	test   %al,%al
  35:	75 60                	jne    0x97
  37:	48 89 f0             	mov    %rsi,%rax
  3a:	48 89 f2             	mov    %rsi,%rdx
  3d:	44                   	rex.R
  3e:	0f                   	.byte 0xf
  3f:	b6                   	.byte 0xb6

Code starting with the faulting instruction
===========================================
   0:	42 0f b6 04 30       	movzbl (%rax,%r14,1),%eax
   5:	38 d0                	cmp    %dl,%al
   7:	7f 04                	jg     0xd
   9:	84 c0                	test   %al,%al
   b:	75 60                	jne    0x6d
   d:	48 89 f0             	mov    %rsi,%rax
  10:	48 89 f2             	mov    %rsi,%rdx
  13:	44                   	rex.R
  14:	0f                   	.byte 0xf
  15:	b6                   	.byte 0xb6
[    2.487955][    T1] RSP: 0000:ffffc9000001fc10 EFLAGS: 00010246
[    2.487955][    T1] RAX: 000803e1e0000000 RBX: 00401f0f00000001 RCX: 000000005555555c
[    2.487955][    T1] RDX: 0000000000000000 RSI: ffffffff88a01760 RDI: 00401f0f00000000
[    2.487955][    T1] RBP: ffffc9000001fc38 R08: 0000000000000000 R09: 0000000000000000
[    2.487955][    T1] R10: ffffc9000001fd30 R11: 0000000000000000 R12: 0000000f8d1165e8
[    2.487955][    T1] R13: ffffc9000001fd30 R14: dffffc0000000000 R15: 0000000000000000
[    2.487955][    T1] FS:  0000000000000000(0000) GS:ffff888790b4a000(0000) knlGS:0000000000000000
[    2.487955][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    2.487955][    T1] CR2: ffff88883ffff000 CR3: 000000000aee4000 CR4: 00000000000406f0
[    2.487955][    T1] Call Trace:
[    2.487955][    T1]  <TASK>
[    2.487955][    T1]  ddebug_add_module (kbuild/src/lib/dynamic_debug.c:1572 (discriminator 8))
[    2.487955][    T1]  ? __up_write (kbuild/src/include/linux/instrumented.h:112 kbuild/src/include/linux/atomic/atomic-instrumented.h:3390 kbuild/src/kernel/locking/rwsem.c:1415)
[    2.487955][    T1]  ? up_write (kbuild/src/kernel/locking/rwsem.c:1682)
[    2.487955][    T1]  dynamic_debug_init (kbuild/src/lib/dynamic_debug.c:1815)


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260626/202606261437.36507000-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

