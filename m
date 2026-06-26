Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E9D3AB5CA
	for <oe-lkp@lists.linux.dev>; Fri, 26 Jun 2026 09:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782465692; cv=fail; b=m5vABfCJYggG2bbV1vzox2Ipxse04ZQRKjA3iOFo47WweKggxoeJdBlLXhVEjuhCnnmfrg3YASEHsBCDEb/JtKMUQ6JBAwqUZ1HF0SQaJLTHf+aoOdRVBwH6YGXfY/x3vfV4+wWkCHodrDOCLILl/D1o8WPiUqT+8hah6NMe5xg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782465692; c=relaxed/simple;
	bh=yw1Hh3Ry49kMsVwPLe3o+KlyAY5QTuzGr6m0PPAMABI=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=fjnnrZQEXT9+O+3gtA0Kkj5BYBu8K2LuYB2tox1Wa0BXdTFutcnfsdFKl74stLNxGEAH6knuOB+iHujsYgUAgm7D9TH2ThZ7JzED2sp/Ql0IPVuoEXmqXT55mVbn6dpOrRsq0U1wMRXuzdkG7ovBuq0HvoFligpL9p6oej+rQps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EW+UCtv/; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EW+UCtv/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782465691; x=1814001691;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yw1Hh3Ry49kMsVwPLe3o+KlyAY5QTuzGr6m0PPAMABI=;
  b=EW+UCtv/xRyhl2nI7mcw3dyZdG5RYlN/dF/9jiH7/QYKTXqP9TB+WBKE
   L+CFj2GmpcSMpwShnzHTlz7loU+EZPeKbNcqALplsNcWZgYU1LXlD+rLa
   cgcPK62DWIxgRaVaBClUk/UJMWz3ugUsZrGp5dnuMmyPp8ixe75Fxx8IB
   jsxVmlfOtOx+IVlyj2MA9gzzCcrA6LGSdT6gNqd5gyv6oLToHYZc6trIu
   Btt8FMb7+ar28XZsrAc8YQHhbLzQxa+XIj75rjneejOBjFVtXHM14A+/f
   6EcgpQRbSEz0irqDgB9TVYfC+DEBnNmEB7ZpeyzZvmdB4pqUiJCMd2USe
   Q==;
X-CSE-ConnectionGUID: FUcHE7N8QZybqHQzAnT8og==
X-CSE-MsgGUID: k3mlKzsUSFeeBWjjud9ODA==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="83267704"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="83267704"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 02:21:26 -0700
X-CSE-ConnectionGUID: zlU/McLmR8yX99P08GOK0A==
X-CSE-MsgGUID: KKVLBU5RQn6ucsr2sw0ZjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="256179027"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 02:21:27 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 26 Jun 2026 02:21:26 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 26 Jun 2026 02:21:26 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.11) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 26 Jun 2026 02:21:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JYv/CabYDpQ08k7Q/TDravDmktfv5ubVp0zEHFlVO6erO8fW+JfiAfvTdJ0/IPDDXsRb/EdqLP+feQos6CaKALi5G67GrSeVWHZfO7Kv69Z0B4cfRPT0cNzreSTfycsrYhjhQwAKTBqBHBheBLx0Cd66mwANTFoBedrbaw5DXs9DhomrhUHRN4fXpGHwU9b4103WEDsiMUsCK6K4gTkPCf6rgRGVkvbUXCvZviFpkG3ofqWYfkY09WmX2M+6263UI8+3v4WNChTcVy7hBIAVxS79iqpefQPTcr+EXnXHhet8kzdWUVfM3XYvqXsWSjm1pQ+S/oQ9Si7mUWKIXDe/GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UaVIgCLxi6VDxAteHDo81ktfo7O1kRuNldxfV2jmNjc=;
 b=v4w6CscURRfDFK7nJpKfSertIeX4FcosyLbYrVNk7B98PQ53GFZQGT7yPkHWKKhoJiEXMTwhvZybvg9JJkJODmf/MQ71GMLTddi7mwX+3eGyC8Yg0s6Lma/jTlQ2UpHzLl4/tQGHNNhFpYSn6zUZGap5mhSkTRLwmEOT9bWV+FOy+indC/JzzNxdFLro5wlnyIFpLpteyBJUhxDaG894kWb2kklISeERgNChhMHA8onenLAXxRUW1LP7sSoC6XnulBBqg+drW7/L7NwRiGtqb++RV+CHaqvHVnB9FdFu9UCxJ6EAdYYAAd1ZP0JWZqzzMW5/az94rrmz6op3kvArEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by PH7PR11MB7025.namprd11.prod.outlook.com (2603:10b6:510:208::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 09:21:23 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%5]) with mapi id 15.21.0159.013; Fri, 26 Jun 2026
 09:21:23 +0000
Date: Fri, 26 Jun 2026 17:21:17 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>, =?utf-8?Q?=C5=81ukasz?= Bartosik
	<ukaszb@chromium.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [jimc:dd-rust-parse-2b] [dynamic_debug]  f9ffb9cd4c:
 BUG:kernel_NULL_pointer_dereference,address
Message-ID: <202606261624.8bb81239-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: TP0P295CA0050.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:3::6)
 To PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|PH7PR11MB7025:EE_
X-MS-Office365-Filtering-Correlation-Id: f209b545-8109-4125-7c0b-08ded3644aa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|56012099006|11063799006|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info: qWHetO2Dj7BYd5u3oBVKEleZQxOAr7oiglAY1g7182FpmseDMGdmHR2/CcKvCkRLqsFn7a2agIxodqEI6Eq6vn0s7XyAgqmHZtNaOa30KlLhi/4ceJQSgVDsbJZ1uD7FZ/+NyPbOCJ49J6WpihK5pg6Gvdvs1frnGxYq7ndVhVXAu4POjWNz63Pfy7gl6BR5ILTjB4eh43NOQ9H4GDYUcVuSuX87rhIhcPiy5JZjh6DnYBahZRcCX8H9m0eD7nKvgWpllAtCTnhswmb2to0+gJ43EG0QcYQN1mr5sCv+HYfJ/xAdBmRjnG5TEwsHqLl817M+CsHfxf/61I+97cECrAKt7lihL9RSc1+gLyEe8Fg5ju6P+KIEFFK9T9BUztFmstlHQBWSNL8rdNfzPhdqQySUDhV4HmS+ald0DJ+7paorbYYRRalMuAGpFIYv4gPtNEAiF67idix3FlNrbwwe3abm5Js7MqLUlyiBXIaTX78P74RH3EchrgUhgxNykT84C/U3Fwi/cuILSE/wAlaKJsLB1tH4mYVZwYNNK0bp+UBrwUFLOqkDCLB2zumYMYxOLNsRDb3jXdbneKzFUw/YW2pei4v7U+66XZvHcdCAgO/NosSRabh7fHYpblTjPTha
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(56012099006)(11063799006)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RnlKC3sgXIiUt4LHMn0o2CWYHxdJ4F4UGGMvb6DAUT9ulYfTY34jIgfxyZYJ?=
 =?us-ascii?Q?+XKBTXeBAHrMz7A0EHibWvPJwyoAxkVnKicr+qveQ6EpmI6vCw0LHJwQ0wBZ?=
 =?us-ascii?Q?1F4ugkTdS6J4q8IupygHfJR368ZCU3UVrToVqoZR84992JcZRnDYRNjzsp9V?=
 =?us-ascii?Q?U3ydo2OV63cmQF8YyWDTsvAeVDKcaewn2ZGgnUbIfyRuxoPCICeviRlV0hTW?=
 =?us-ascii?Q?WM+oZOGE34jcQdKbIwY4YV+PRehVRguxb7HIR7SwWQknsFX43rex5wm9lvYZ?=
 =?us-ascii?Q?oZOYEq5s8DdNRXhot4dX2rhWJFVesgsoDtGGUawn2hhikm/qy/AmFb4C/Fut?=
 =?us-ascii?Q?1SzANE1sqiciZ/qaC3Txx4jsvg/m+yzzw2GKdrFq5fou0agpwOLGEPyZMoGj?=
 =?us-ascii?Q?P78LxK4/0pU0E9KHEYsCm4azPZK/YpiLEWXbQPnKRMM93MU+ngZ92w5/y9ts?=
 =?us-ascii?Q?UJdeZrt9xp4orL4uZgBB9kMetuMcYAJioPmF6a6MUpzbHKbYaOTTtwMLPP9E?=
 =?us-ascii?Q?lVmp5LPwzMMnr3NkQptD9ftoCR9+34lvohhb99gO3HGnFzZjuXr7Xv1evYty?=
 =?us-ascii?Q?5ZUCDyuOO/btXrZe4mdMO7238qJQ6e8ahGnPTUW0XJQ9e8+6vLWgSOSwcJDP?=
 =?us-ascii?Q?DnrVWXHuwHa3qNpzDFbCw3SLWxglb0/kxmVFp/NwnR8MQOqy7nlEM1yezi75?=
 =?us-ascii?Q?HOEVsdvU8zIIbCAS1lbi/dB5WXbxZT6ZxzgaFTCAqeLEYG06Xui9MdMpGa0M?=
 =?us-ascii?Q?7PKrJLce01nRkiYNY7NSZ+zhiuFMaAjokXMqJTEuUZ5529iZqXMjlwWzqrKm?=
 =?us-ascii?Q?u4iCoItWRbmAmio18N0mBtl/T8S00FTRU2iirX6P25PSCQoPSsZTjFoHub4A?=
 =?us-ascii?Q?R/yVd3kXrzUC2BSMpezsfJbTNWDYg37qFHRnfS8mQXuPwWwPhQgr+pNiErd8?=
 =?us-ascii?Q?wuxRe/NZ5WfxAUDKkLHh3wFTUaIjJMAtvATy2VfR5dcpuxvYDGDW7eN91vZ6?=
 =?us-ascii?Q?vl7pMpZc5AYgILq3QjCWuCyYqzvkIyBSbDMmZePsYX9RPWpN7B6ujY1JS4Ze?=
 =?us-ascii?Q?G4n4WQ83JB2oKW/r5sahginVaNsU50PPqF/GwhOlFQEz0RUN+gbtBXuNvt+e?=
 =?us-ascii?Q?pFWRXKBFm7aTgQSQlskWernwQWOL96dvCo6SBkhdb5s4qc1KLSfpC+2R9CH8?=
 =?us-ascii?Q?3edbQG+rDiaEox8ilEWQXbMo2hrWifoSft6zigjIAtj9u+9bpO12eYFpSaMn?=
 =?us-ascii?Q?dym8wkOmOjQF0gitl918vuRJS9zPAxpxjN18NlFlqO3FTRkOaC3AiHBIJwBx?=
 =?us-ascii?Q?raABDDnLuoV1iuiK3MZsbWWN9sQPZuDxRJv2wDaMvb+5ZA9iDRNAtjqjmqAZ?=
 =?us-ascii?Q?mer7ylFVYHxtnO3BcTAn87sbO5huqWHkmepEPQdovvgQ+qQc6CNV00pfofPK?=
 =?us-ascii?Q?vj0sJA37AusxMf50RPrviU0YlVrC7j8ELC7KNf0cbLUPmYmaFzl2RYmrKXES?=
 =?us-ascii?Q?Flozx28HkJCBZkjPexbaDKhZP3hbS7wqUeFvNGQ/JvRAWRUTz4fXucCZ49NX?=
 =?us-ascii?Q?ewB/3228gHUbZVWJK3fi5SttUBKiZAs23s7Hr0x73xXIlf7LjcLdTY4Iwmbk?=
 =?us-ascii?Q?tqUO6ORoes9x1c6hwPFn1vWrHgJyPvihFSfUalENriUBzjfjluV7dW41Zc75?=
 =?us-ascii?Q?gYt3A1ikaGqoC7jpY9k25PcW25Ble9SMW3AhzFkGKuWuJfSv8ELTO+zV4P7T?=
 =?us-ascii?Q?8rbD3BLM8w=3D=3D?=
X-Exchange-RoutingPolicyChecked: ZAE30Dm0RaRPIVF0fTemcE/2UP1WcomQTGiEQHyIg8CaS8ztHQ5gtCDBI8lyIYTBg1XBokX/nIzzQvFA5lThqL9fEHBrVG6SvwKN8i8sin8m+YCUfywvDDNL5hOGTRLsHpG6Nd+4RGT23M76EI7NlNpIQ3SLIkDqMQGxokZxXjAjPq5UlDpJefd7VfuSsXGLuDaylCemlBJW5kdTPfX0qCNzthVOtOMePEndv8SMJSyMCGNOZVlwTdnyV365iLiQOqZsHvhWLESbiisazFAAutBIPXJtCw5Cl00U1oQcGQQGAuigAQzVj2H0v18+B+Q618n6a+XjYRZp1uLnUBzFqQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: f209b545-8109-4125-7c0b-08ded3644aa7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 09:21:23.7261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1tyAvyeTPJl7eZk/5CTm0KgSV3yMd2t21u7EtATwNBL9re3rgsL1/no+tyL9CVnaEnldCcUMw5xGMnPeshffYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7025
X-OriginatorOrg: intel.com


hi, Jim Cromie,

we just reported
"[jimc:jb-fix] [dynamic_debug]  d405145208: Oops:general_protection_fault,probably_for_non-canonical_address#:#[##]SMP_KASAN"
in
https://lore.kernel.org/all/202606261437.36507000-lkp@intel.com/
two hours ago.

where I assumed the patch is a fix for i386, but maybe caused regression in
our x86_64 boot tests.

however, later, I found our bot happened to test i386 boot in another branch
and capture this change cause regression on i386 boot tests - parent can boot
successfully, but this change will break the i386 boot, too.

so report again FYI.


Hello,

kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,address" on:

commit: f9ffb9cd4ce0b19f39fd6dd5361e9d067c9be714 ("dynamic_debug: Simplify classmap macros by removing redundant aligned(8) attributes")
https://github.com/jimc/linux.git dd-rust-parse-2b

in testcase: boot

config: i386-randconfig-003-20260623
compiler: gcc-14
test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202606261624.8bb81239-lkp@intel.com



[    0.756103][    T1] BUG: kernel NULL pointer dereference, address: 00000000
[    0.758285][    T1] #PF: supervisor read access in kernel mode
[    0.759534][    T1] #PF: error_code(0x0000) - not-present page
[    0.759534][    T1] *pde = 00000000
[    0.759534][    T1] Oops: Oops: 0000 [#1] SMP
[    0.759534][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G                T   7.1.0-00050-gf9ffb9cd4ce0 #1 PREEMPT(lazy)
[    0.759534][    T1] Tainted: [T]=RANDSTRUCT
[    0.759534][    T1] EIP: strcmp (x86/lib/string_32.c:94)
[    0.759534][    T1] Code: 49 78 06 ac aa 84 c0 75 f7 31 c0 aa 83 c4 04 89 d8 5b 5e 5f 5d e9 b7 aa 01 00 8d b4 26 00 00 00 00 55 89 e5 57 89 d7 56 89 c6 <ac> ae 75 08 84 c0 75 f8 31 c0 eb 04 19 c0 0c 01 5e 5f 5d e9 8f aa
All code
========
   0:	49 78 06             	rex.WB js 0x9
   3:	ac                   	lods   %ds:(%rsi),%al
   4:	aa                   	stos   %al,%es:(%rdi)
   5:	84 c0                	test   %al,%al
   7:	75 f7                	jne    0x0
   9:	31 c0                	xor    %eax,%eax
   b:	aa                   	stos   %al,%es:(%rdi)
   c:	83 c4 04             	add    $0x4,%esp
   f:	89 d8                	mov    %ebx,%eax
  11:	5b                   	pop    %rbx
  12:	5e                   	pop    %rsi
  13:	5f                   	pop    %rdi
  14:	5d                   	pop    %rbp
  15:	e9 b7 aa 01 00       	jmp    0x1aad1
  1a:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
  21:	55                   	push   %rbp
  22:	89 e5                	mov    %esp,%ebp
  24:	57                   	push   %rdi
  25:	89 d7                	mov    %edx,%edi
  27:	56                   	push   %rsi
  28:	89 c6                	mov    %eax,%esi
  2a:*	ac                   	lods   %ds:(%rsi),%al		<-- trapping instruction
  2b:	ae                   	scas   %es:(%rdi),%al
  2c:	75 08                	jne    0x36
  2e:	84 c0                	test   %al,%al
  30:	75 f8                	jne    0x2a
  32:	31 c0                	xor    %eax,%eax
  34:	eb 04                	jmp    0x3a
  36:	19 c0                	sbb    %eax,%eax
  38:	0c 01                	or     $0x1,%al
  3a:	5e                   	pop    %rsi
  3b:	5f                   	pop    %rdi
  3c:	5d                   	pop    %rbp
  3d:	e9                   	.byte 0xe9
  3e:	8f                   	.byte 0x8f
  3f:	aa                   	stos   %al,%es:(%rdi)

Code starting with the faulting instruction
===========================================
   0:	ac                   	lods   %ds:(%rsi),%al
   1:	ae                   	scas   %es:(%rdi),%al
   2:	75 08                	jne    0xc
   4:	84 c0                	test   %al,%al
   6:	75 f8                	jne    0x0
   8:	31 c0                	xor    %eax,%eax
   a:	eb 04                	jmp    0x10
   c:	19 c0                	sbb    %eax,%eax
   e:	0c 01                	or     $0x1,%al
  10:	5e                   	pop    %rsi
  11:	5f                   	pop    %rdi
  12:	5d                   	pop    %rbp
  13:	e9                   	.byte 0xe9
  14:	8f                   	.byte 0x8f
  15:	aa                   	stos   %al,%es:(%rdi)
[    0.759534][    T1] EAX: 00000000 EBX: 00000000 ECX: 85c8fd00 EDX: 83d2281a
[    0.759534][    T1] ESI: 00000000 EDI: 83d2281a EBP: 85cc9e6c ESP: 85cc9e64
[    0.759534][    T1] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010246
[    0.759534][    T1] CR0: 80050033 CR2: 00000000 CR3: 0488f000 CR4: 00040690
[    0.759534][    T1] Call Trace:
[    0.759534][    T1]  ddebug_add_module (dynamic_debug.c:1572 (discriminator 8))
[    0.759534][    T1]  ? __lock_release+0x115/0x300
[    0.759534][    T1]  ? blocking_notifier_chain_register (notifier.c:265 notifier.c:282)
[    0.759534][    T1]  ? up_write (locking/rwsem.c:1682)
[    0.759534][    T1]  ? blocking_notifier_chain_register (notifier.c:265 notifier.c:282)
[    0.759534][    T1]  ? dynamic_debug_init_control (dynamic_debug.c:1768)
[    0.759534][    T1]  dynamic_debug_init (dynamic_debug.c:1815)
[    0.759534][    T1]  ? dynamic_debug_init_control (dynamic_debug.c:1768)
[    0.759534][    T1]  do_one_initcall (main.c:1392)
[    0.759534][    T1]  ? __register_sysctl_table (linux/spinlock.h:390 proc/proc_sysctl.c:1403)
[    0.759534][    T1]  kernel_init_freeable (main.c:1499 (discriminator 1) main.c:1692 (discriminator 1))
[    0.759534][    T1]  ? rest_init (main.c:762)
[    0.759534][    T1]  kernel_init (main.c:1593)
[    0.759534][    T1]  ret_from_fork (x86/kernel/process.c:158)
[    0.759534][    T1]  ? rest_init (main.c:762)
[    0.759534][    T1]  ret_from_fork_asm (x86/entry/entry_32.S:736)
[    0.759534][    T1]  entry_INT80_32 (x86/entry/entry_32.S:940)
[    0.759534][    T1] Modules linked in:
[    0.759534][    T1] CR2: 0000000000000000
[    0.759534][    T1] ---[ end trace 0000000000000000 ]---
[    0.759534][    T1] EIP: strcmp (x86/lib/string_32.c:94)
[    0.759534][    T1] Code: 49 78 06 ac aa 84 c0 75 f7 31 c0 aa 83 c4 04 89 d8 5b 5e 5f 5d e9 b7 aa 01 00 8d b4 26 00 00 00 00 55 89 e5 57 89 d7 56 89 c6 <ac> ae 75 08 84 c0 75 f8 31 c0 eb 04 19 c0 0c 01 5e 5f 5d e9 8f aa
All code
========
   0:	49 78 06             	rex.WB js 0x9
   3:	ac                   	lods   %ds:(%rsi),%al
   4:	aa                   	stos   %al,%es:(%rdi)
   5:	84 c0                	test   %al,%al
   7:	75 f7                	jne    0x0
   9:	31 c0                	xor    %eax,%eax
   b:	aa                   	stos   %al,%es:(%rdi)
   c:	83 c4 04             	add    $0x4,%esp
   f:	89 d8                	mov    %ebx,%eax
  11:	5b                   	pop    %rbx
  12:	5e                   	pop    %rsi
  13:	5f                   	pop    %rdi
  14:	5d                   	pop    %rbp
  15:	e9 b7 aa 01 00       	jmp    0x1aad1
  1a:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
  21:	55                   	push   %rbp
  22:	89 e5                	mov    %esp,%ebp
  24:	57                   	push   %rdi
  25:	89 d7                	mov    %edx,%edi
  27:	56                   	push   %rsi
  28:	89 c6                	mov    %eax,%esi
  2a:*	ac                   	lods   %ds:(%rsi),%al		<-- trapping instruction
  2b:	ae                   	scas   %es:(%rdi),%al
  2c:	75 08                	jne    0x36
  2e:	84 c0                	test   %al,%al
  30:	75 f8                	jne    0x2a
  32:	31 c0                	xor    %eax,%eax
  34:	eb 04                	jmp    0x3a
  36:	19 c0                	sbb    %eax,%eax
  38:	0c 01                	or     $0x1,%al
  3a:	5e                   	pop    %rsi
  3b:	5f                   	pop    %rdi
  3c:	5d                   	pop    %rbp
  3d:	e9                   	.byte 0xe9
  3e:	8f                   	.byte 0x8f
  3f:	aa                   	stos   %al,%es:(%rdi)

Code starting with the faulting instruction
===========================================
   0:	ac                   	lods   %ds:(%rsi),%al
   1:	ae                   	scas   %es:(%rdi),%al
   2:	75 08                	jne    0xc
   4:	84 c0                	test   %al,%al
   6:	75 f8                	jne    0x0
   8:	31 c0                	xor    %eax,%eax
   a:	eb 04                	jmp    0x10
   c:	19 c0                	sbb    %eax,%eax
   e:	0c 01                	or     $0x1,%al
  10:	5e                   	pop    %rsi
  11:	5f                   	pop    %rdi
  12:	5d                   	pop    %rbp
  13:	e9                   	.byte 0xe9
  14:	8f                   	.byte 0x8f
  15:	aa                   	stos   %al,%es:(%rdi)


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260626/202606261624.8bb81239-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

