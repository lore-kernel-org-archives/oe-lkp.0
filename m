Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFCF29405
	for <oe-lkp@lists.linux.dev>; Fri, 10 May 2024 09:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715333569; cv=fail; b=HmvB1EXl+LVAVLrTBKaUZ/EknySdtydk1X0g8jrf/3sx6yvo7zdEziRHi86B6cx48fsM02/IRcqMDR6Ua1sd/+gSe5Eb1orHQNy8u7zX+4+DCrLAQA1nEMX/igkgbLMqGuYDpRSiuWX5QETVQkYcwvarWHyThW5HKZRPXYgcI5A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715333569; c=relaxed/simple;
	bh=5h8U9UaHtkuXy3xhbRgrF5wXhtXVKi+WPLE0pe1cFYI=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=nhXe5SR2ACVxMzAy+mfB1WQMq6aQUYx9ZUXdUxk/AgEuFuNATnpCPma0D/nDGvUMkauJHS3DdLV4n7BTYUxYqzjmaDYm7qp1oi+8mAxsPNkUIB3Lf50OnZnVTmE1eg39x6yqciRGZt+mWR1jzz/c+k9MRMWC60NcUKSMqxfKCJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bzqep5cy; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bzqep5cy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715333568; x=1746869568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5h8U9UaHtkuXy3xhbRgrF5wXhtXVKi+WPLE0pe1cFYI=;
  b=Bzqep5cyY3V4yGsokrvXc/JX6Hc2Axa2DPs3kXlB+gXBt7yKsMKIFnXC
   BRFYecHwVcWUIpoAmvyFNxLQZpEZd0QliHXjspJzzkxiDrSogvSaQOYST
   K5gPNzD32D9XLX3SCtA1azWAujOjjgssa1r+gUtlj7eiZYoTLjAZwAkfE
   GO9Dvjz6UTy0ms69cw9zNKt9wEhadSW06E+EU9L4ptpHVkGg2opFTy2iW
   Rfo0fdSQoqWE53S9oRZHzpMPaLRh8qlHp5rutjzwx3y/Y77oynhgtAP6T
   9DVIPrWqeF8siH59UMo09NBNq14DUHVToTq23hcEYrHlNByuPbYiSln0a
   A==;
X-CSE-ConnectionGUID: KK6UkXmHSEanjMMqa9K58g==
X-CSE-MsgGUID: hJ5riGZ8S8GUVUwf8Tn6RA==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="22711361"
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; 
   d="scan'208";a="22711361"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 02:32:48 -0700
X-CSE-ConnectionGUID: Bb3U4Y14TDWBjo7fU9P/ew==
X-CSE-MsgGUID: qnpaSAbXRK6NInHzMrvH3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; 
   d="scan'208";a="30115820"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 May 2024 02:32:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 10 May 2024 02:32:46 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 10 May 2024 02:32:46 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 10 May 2024 02:32:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FXETgWXvO9eqKXJnOQ1CMSOk4EA/NcWcfxyegv2ofvCYqDBR6vSWSinegA3HAk7yL1I48mHpcApluutjje03o8vS1Q6Hu8ANmpEm8w7EhObuVXkmYtUpSFDdjpQVhPSpKZXvB4+wGzTnTGjZIj3BB3u4ONeSIWX/czhB+XfbyMq1yR4bZdSGz5f899JbXfb2ckf51gvVXdka+mgC/yfryiMS6Y66VYYrpJk3FgDIlQ5vcStwcGiRolJphnSO5hnxotJSzjl8NQfBDe6zK3pHb7OefdT1sbfFhzc0LFFRcypSqwKK0tjfjgDQO9O0j+D33L6j2ZiNHwPN65Ads1/KOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LKgMLDk9EpYMbhS28BwXtJ88M7eaueT9wkfAfwmXVUo=;
 b=dc4LiMn7Alzvg88OLrQ0fYV3/6YQK49DL8F8rqM7hP92+wpajvrZWwO0UL4NMH1YYO52c4q9VkYZhJfemD8rNtra4d6DBYBwSY/LQVLFjno6xmjdPsMi9oz+f++is72+d9vY7Y0ULEwhTAxRNxaRwDDwojdNZOdFpBSTta40XpGyuIfgpsYMLGik7dBSMiO9blD98xQEtqfA72e3yzkZGZF4tiuX5jaCCmo3diY72glcii5ykYm0bZIg0lMbAopfweWUS++1e8R9tq5S3Yo45jGDDjCrN176GfDbc+vbsCusMMaUFHb6Kv2k8jivJWsjFHkGqxDdQT6qMAnxf3fibQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by DM4PR11MB8130.namprd11.prod.outlook.com (2603:10b6:8:181::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Fri, 10 May
 2024 09:32:42 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45%4]) with mapi id 15.20.7544.047; Fri, 10 May 2024
 09:32:42 +0000
Date: Fri, 10 May 2024 17:32:39 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Mike Rapoport <rppt@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:execmem/x86-rox/rfc-v2] [x86/module] 6e2766e629:
 BUG:unable_to_handle_page_fault_for_address
Message-ID: <202405101709.37715bca-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR01CA0039.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::16) To SA1PR11MB8393.namprd11.prod.outlook.com
 (2603:10b6:806:373::21)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8393:EE_|DM4PR11MB8130:EE_
X-MS-Office365-Filtering-Correlation-Id: 93877466-5a66-4d6b-baf2-08dc70d423ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8mCwvVy+rgG7vXopFQ6OmLYH/2DRxiwmLb+kRbIrYSKQIciT+5saVKniqBJe?=
 =?us-ascii?Q?8Zc6p64X69cflD0dHTLDmi2LqrWzvCTfEGDiZHTM0KQqBuzPSOVk9h/qR3At?=
 =?us-ascii?Q?a4+NpETXwm04BKan+Ovj/K+OS8iAyEWyT/re5m1GW+hnJ0TqUoTPY+zC7v30?=
 =?us-ascii?Q?PpUMF0xUXK3enspNzPDrg35sRQtuxJPZ1LNiv4/1e2cvWqJqpKe5J0TmndHf?=
 =?us-ascii?Q?4luVKltXrNhiBr7zpqDJ6Rsam5+w5/z15B9SrdmgDSMfplcFsGtDTJcETwQf?=
 =?us-ascii?Q?IMJjWYaZBiySPkT/eRQpt+lo2k10tmwNAPlzfT6ebBwsnOjv8737UUN+CZJY?=
 =?us-ascii?Q?YgV5iLSeeMWzFBwTmQYesBC70R16U+Cak2Hsrxkg4Xg3spyL9PnkwGLj94S3?=
 =?us-ascii?Q?+kNkAaUK1gD7i8jnI5DIInh6jdgoeY0cpv/FJClUKKlENrMCQGbMbqTJb4St?=
 =?us-ascii?Q?CsMCpOoIkLDaQstsLbdqwPeexMP8xEcMtNvjNPOWuO4oxZTr1qQqtDmW8ziB?=
 =?us-ascii?Q?lmQSyfI663xorBYpHNcP5ULRrd59RE3sQkhzV1tGEOMN6+NrXlHyu+PiXstH?=
 =?us-ascii?Q?T32PakBhB3h3Do5EBQJBV7yQNrXTLl6qUkEL3km+A0TN0dTpvmKldDM1kEAU?=
 =?us-ascii?Q?eN/lk7eHpN37ZB5hwoNAYOI7mdb6gqh2VwCSdN3kdPUUkOImDJemEf5I13jP?=
 =?us-ascii?Q?/MKeCIriD8LHaEU72d9xNdhaELv8L/RVfvVWRq3EINgodPSLt71cGb0lMmzP?=
 =?us-ascii?Q?gj1NcxQqff3nfhHxfAasywSvDZFlE0nRpvWDggdQXu2/H9GJ0NlUd/qlS2BC?=
 =?us-ascii?Q?j5YUkS4l20NHq6i8xTc7fBm8a5D/IFme11xDF2UJL9slgZ4LMijDDt40hfIz?=
 =?us-ascii?Q?gQF3gWOi7DY3+4gl5E3ieu1lxPcvNFi2/GHCOAncPa4fRnBSQXSp2OYTq7ct?=
 =?us-ascii?Q?xXKd9NPFkQ0Qh2l6KfRhIccEcQ0o4tBF59tCJtVmftdETVabyDxVvXQCxYL2?=
 =?us-ascii?Q?jsDLDyvAEhOBHxamKDFy+dL2F6M92UZtcJzPQXMSKLfnCqka6Jqjo7sDFEao?=
 =?us-ascii?Q?4vR5T9BjkERJ04f9A4OvsuXQqFoIkUC+/ls3WUFMPp9GsTM9A+jlI9tUXRry?=
 =?us-ascii?Q?TGgfd3Qzd/NrZ5raLV4NLGaAcw4qscA0t2ObIZari7wqaGSkwEhzHusC3lja?=
 =?us-ascii?Q?BBzxX6p9SZ2I3gA7rhjFP9LCbTKBo4yty4GmX83YbS3QOoux88YJU8F5Og8?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?THYipAPnA2Ql9/5kNLdXJ38NQVIBciwovBT8L/S06FLA+9/XccaigzgbYngU?=
 =?us-ascii?Q?HbTvaF+3Ojc1PxwfKQ2+ffotmGNgrxJCIkfRqR4HOLc2vXJoWD41QVOL50xX?=
 =?us-ascii?Q?RjCLhmsKoy2yMZ34+Ge0oaUevkv016vECZKvoWiu0yOwZCtdOqS59ZE27rlZ?=
 =?us-ascii?Q?da6eNCQ2GStnwzkrl0uc9r6fx3Xr5nB3/HDPmMAfRa+zTwHi3J/Rj0wSsOC2?=
 =?us-ascii?Q?i9ikGRsAhPYeD6NwsskneqEVCjn7vstIfeQ2JKPNrbeLfCvt+7kavClGmQe0?=
 =?us-ascii?Q?KrZWpckfQxxXdkssMFC7+nRwG+iYRLFs7fiP4JQwZTnSEPk4y+L/PlZBS/wR?=
 =?us-ascii?Q?FPNqzhg88GLeIu/2qJwFmMmB3RLGFVW0mNU8Lgk5hDWzXO9uzhYZ2CR09MkU?=
 =?us-ascii?Q?KxPGAcJ38BMsWMh+PEeWRVcLpI2ESod4JA2AhrHF/+0GCPQ0sU7Os7MB9rOF?=
 =?us-ascii?Q?DZq29oYun/l17reOjHuhpL0NmbYvsQrgZSNFBoHq5R9bIYCQHVLCKKz6ZyS3?=
 =?us-ascii?Q?6MAxLCFzjXWnqQN8aYB8gh/FPMjrf/HmiBvxmWCjFeknfYLsibFnJkvMkBT3?=
 =?us-ascii?Q?qPaBFpetvg4htRWP0YpUvalOBruxGpow3IgvMKjsaiItHCggQlbSmPccapc6?=
 =?us-ascii?Q?+MFCtw/Y1dD7/4ipWOVmuv4OqpAqCxgiLOPEmTko6oMbtTZ/7jFWAS3+S2pA?=
 =?us-ascii?Q?GqoPZlAscIF/75ZKm30Fz+Du8PO4ybR8TwHYzpApKLmjGs1DYVgZ7+kTYDgV?=
 =?us-ascii?Q?8tmAV0NZ7qykt1D47WCpF28xikGcMW92292PVRuqvO3kYTMvmuwf5mmbug9i?=
 =?us-ascii?Q?6UXIiPYJlqSMByy+wJGQR0yR2UZ3LRZyMBTwfUC847qYrQiysxeJsCybwmMl?=
 =?us-ascii?Q?Du6dKgpuqBNIW/EX8YlmHj2uvBb41wtPY12hx4xYAPVEg5t5k4mRlogBxPGK?=
 =?us-ascii?Q?YGKfYEb0jA7tmeYFp7LkPBuqZ/JYEhGfQ6OJrBQO59bGkQGz6Q1U2sdqEGvO?=
 =?us-ascii?Q?qZS7J+5t/mZi81y0Vdm1zDEgCEABIoR9jZ0BMdizPOi85R3lbO4/cpMq2eS2?=
 =?us-ascii?Q?4sdPyRVabnSlD4Mxwukzx0JHZ3a1CNrqifBOi/EEsTwuzLObtE/qLZ97nFZG?=
 =?us-ascii?Q?G15DF00wjjXmBShx7WkPgefnhxjiR0NYFxB+tC+vsRAr3ljOfXJe4kb/G155?=
 =?us-ascii?Q?vGOibN6M8XrunoRZ33aojLSOuQm9Podpd5+ZAvEgMrDVemRp0QgMrgEL8lkE?=
 =?us-ascii?Q?R3+mzpXBe06P78Bg6HFv7TU//3lDhF2sUfjJtnafKl67PrHs/MCJ0IBtuQRD?=
 =?us-ascii?Q?wQkSA/EpIBmGFIAtL3NjPlyuQj/B5PzYBvuOqWhb7nPUOnS7etzxqdAe6MaB?=
 =?us-ascii?Q?y1JVBj3nFIdR65ul1UiBEQKJx0dl6sNrfOYG9Xlwg4jUIsOv+YbYiZZyUoGB?=
 =?us-ascii?Q?hiU2cPL/jb/G/5Dg07912h7vElCB5Edtyh8gkBNbuvw8cCjYEMHLLIPYWSMC?=
 =?us-ascii?Q?TmY6ctYzmsJ0ztFyqBHdCRDAeQfG+mENzYnEQkXrrdxvW3ZMNKk+f+WBsL7c?=
 =?us-ascii?Q?F2A9kJMKxBMdFQTBA9n0kzMtaOnxzEWXZZJclqOL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93877466-5a66-4d6b-baf2-08dc70d423ff
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8393.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2024 09:32:42.0805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pmf3RI0nF7Khg06rRv2oC2ypmzAZ9kpvedHLbBNelBOlWFZP07RuBzsaKJlmy+w4FmzLjxVz9lRcsllgUeuj6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8130
X-OriginatorOrg: intel.com

Hello,

kernel test robot noticed "BUG:unable_to_handle_page_fault_for_address" on:

commit: 6e2766e6297f77c7bbadeabedaa4e45877ef9692 ("x86/module: enable ROX caches for module text")
https://git.kernel.org/cgit/linux/kernel/git/rppt/linux.git execmem/x86-rox/rfc-v2

in testcase: boot

compiler: clang-18
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202405101709.37715bca-lkp@intel.com


[  186.815140][   T67] BUG: unable to handle page fault for address: ef20095d
[  186.816059][   T67] #PF: supervisor write access in kernel mode
[  186.816831][   T67] #PF: error_code(0x0003) - permissions violation
[  186.817629][   T67] *pdpt = 000000000e7f5001 *pde = 00000000233da067 *pte = 00000000abe64121
[  186.818715][   T67] Oops: 0003 [#1] PREEMPT SMP
[  186.819299][   T67] CPU: 1 PID: 67 Comm: modprobe Tainted: G        W        N 6.9.0-rc4-00023-g6e2766e6297f #1
[  186.820586][   T67] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 186.821902][ T67] EIP: apply_relocate (arch/x86/kernel/module.c:?) 
[ 186.822391][ T67] Code: 8d 54 f0 14 8d 0c 89 8d 4c c8 0c 89 4d e8 31 db 89 45 ec 89 55 f0 eb 24 90 90 90 90 90 c1 e6 04 8b 44 31 04 29 d0 89 d1 03 01 <89> 02 43 8b 55 f0 8b 02 c1 e8 03 39 c3 8b 45 ec 73 3a 8b 4a 08 8d
All code
========
   0:	8d 54 f0 14          	lea    0x14(%rax,%rsi,8),%edx
   4:	8d 0c 89             	lea    (%rcx,%rcx,4),%ecx
   7:	8d 4c c8 0c          	lea    0xc(%rax,%rcx,8),%ecx
   b:	89 4d e8             	mov    %ecx,-0x18(%rbp)
   e:	31 db                	xor    %ebx,%ebx
  10:	89 45 ec             	mov    %eax,-0x14(%rbp)
  13:	89 55 f0             	mov    %edx,-0x10(%rbp)
  16:	eb 24                	jmp    0x3c
  18:	90                   	nop
  19:	90                   	nop
  1a:	90                   	nop
  1b:	90                   	nop
  1c:	90                   	nop
  1d:	c1 e6 04             	shl    $0x4,%esi
  20:	8b 44 31 04          	mov    0x4(%rcx,%rsi,1),%eax
  24:	29 d0                	sub    %edx,%eax
  26:	89 d1                	mov    %edx,%ecx
  28:	03 01                	add    (%rcx),%eax
  2a:*	89 02                	mov    %eax,(%rdx)		<-- trapping instruction
  2c:	43 8b 55 f0          	rex.XB mov -0x10(%r13),%edx
  30:	8b 02                	mov    (%rdx),%eax
  32:	c1 e8 03             	shr    $0x3,%eax
  35:	39 c3                	cmp    %eax,%ebx
  37:	8b 45 ec             	mov    -0x14(%rbp),%eax
  3a:	73 3a                	jae    0x76
  3c:	8b 4a 08             	mov    0x8(%rdx),%ecx
  3f:	8d                   	.byte 0x8d

Code starting with the faulting instruction
===========================================
   0:	89 02                	mov    %eax,(%rdx)
   2:	43 8b 55 f0          	rex.XB mov -0x10(%r13),%edx
   6:	8b 02                	mov    (%rdx),%eax
   8:	c1 e8 03             	shr    $0x3,%eax
   b:	39 c3                	cmp    %eax,%ebx
   d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  10:	73 3a                	jae    0x4c
  12:	8b 4a 08             	mov    0x8(%rdx),%ecx
  15:	8d                   	.byte 0x8d
[  186.823986][   T67] EAX: bbd19ccc EBX: 00000000 ECX: ef063258 EDX: ef20095d
[  186.824574][   T67] ESI: 00000250 EDI: 00000001 EBP: e14a3d8c ESP: e14a3d70
[  186.825153][   T67] DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068 EFLAGS: 00010287
[  186.825775][   T67] CR0: 80050033 CR2: ef20095d CR3: 0134adc0 CR4: 000406b0
[  186.826356][   T67] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[  186.826936][   T67] DR6: fffe0ff0 DR7: 00000400
[  186.827317][   T67] Call Trace:
[ 186.827584][ T67] ? __die_body (arch/x86/kernel/dumpstack.c:478 arch/x86/kernel/dumpstack.c:420) 
[ 186.827941][ T67] ? __die (arch/x86/kernel/dumpstack.c:434) 
[ 186.828266][ T67] ? page_fault_oops (arch/x86/mm/fault.c:709) 
[ 186.828672][ T67] ? kernelmode_fixup_or_oops (arch/x86/mm/fault.c:767) 
[ 186.829126][ T67] ? __bad_area_nosemaphore (arch/x86/mm/fault.c:814) 
[ 186.829572][ T67] ? bad_area_nosemaphore (arch/x86/mm/fault.c:863) 
[ 186.829990][ T67] ? do_kern_addr_fault (arch/x86/mm/fault.c:1223) 
[ 186.830400][ T67] ? exc_page_fault (arch/x86/mm/fault.c:?) 
[ 186.830783][ T67] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1518) 
[ 186.831287][ T67] ? handle_exception (arch/x86/entry/entry_32.S:1047) 
[ 186.831698][ T67] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1518) 
[ 186.832201][ T67] ? apply_relocate (arch/x86/kernel/module.c:?) 
[ 186.832557][ T67] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1518) 
[ 186.833023][ T67] ? apply_relocate (arch/x86/kernel/module.c:?) 
[ 186.833379][ T67] apply_relocations (kernel/module/main.c:1508) 
[ 186.833740][ T67] load_module (kernel/module/main.c:2987) 
[ 186.834089][ T67] __ia32_sys_init_module (kernel/module/main.c:3125 kernel/module/main.c:3105 kernel/module/main.c:3105) 
[ 186.834497][ T67] ia32_sys_call (arch/x86/entry/syscall_32.c:42) 
[ 186.834857][ T67] do_int80_syscall_32 (arch/x86/entry/common.c:?) 
[ 186.835230][ T67] ? __this_cpu_preempt_check (lib/smp_processor_id.c:67) 
[ 186.835643][ T67] ? lock_release (kernel/locking/lockdep.c:467) 
[ 186.835997][ T67] ? insert_page_into_pte_locked (include/linux/rcupdate.h:338) 
[ 186.836461][ T67] ? rcu_lock_release (include/linux/rcupdate.h:340) 
[ 186.836828][ T67] ? handle_mm_fault (mm/memory.c:4886) 
[ 186.837209][ T67] ? do_user_addr_fault (include/linux/mmap_lock.h:?) 
[ 186.837601][ T67] ? __this_cpu_preempt_check (lib/smp_processor_id.c:67) 
[ 186.838013][ T67] ? lock_release (kernel/locking/lockdep.c:467) 
[ 186.838365][ T67] ? do_user_addr_fault (include/linux/mmap_lock.h:?) 
[ 186.838757][ T67] ? irqentry_exit (kernel/entry/common.c:367) 
[ 186.839104][ T67] ? __this_cpu_preempt_check (lib/smp_processor_id.c:67) 
[ 186.839517][ T67] ? lockdep_hardirqs_on (kernel/locking/lockdep.c:4421) 
[ 186.839911][ T67] ? irqentry_exit_to_user_mode (kernel/entry/common.c:234) 
[ 186.840353][ T67] ? irqentry_exit (kernel/entry/common.c:367) 
[ 186.840700][ T67] ? exc_page_fault (arch/x86/mm/fault.c:1567) 
[ 186.841056][ T67] entry_INT80_32 (arch/x86/entry/entry_32.S:944) 
[  186.841411][   T67] EIP: 0xb7fb31b2
[ 186.841685][ T67] Code: 89 c2 31 c0 89 d7 f3 aa 8b 44 24 1c 89 30 c6 40 04 00 83 c4 2c 89 f0 5b 5e 5f 5d c3 90 90 90 90 90 90 90 90 90 90 90 90 cd 80 <c3> 8d b6 00 00 00 00 8d bc 27 00 00 00 00 8b 1c 24 c3 8d b6 00 00
All code
========
   0:	89 c2                	mov    %eax,%edx
   2:	31 c0                	xor    %eax,%eax
   4:	89 d7                	mov    %edx,%edi
   6:	f3 aa                	rep stos %al,%es:(%rdi)
   8:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
   c:	89 30                	mov    %esi,(%rax)
   e:	c6 40 04 00          	movb   $0x0,0x4(%rax)
  12:	83 c4 2c             	add    $0x2c,%esp
  15:	89 f0                	mov    %esi,%eax
  17:	5b                   	pop    %rbx
  18:	5e                   	pop    %rsi
  19:	5f                   	pop    %rdi
  1a:	5d                   	pop    %rbp
  1b:	c3                   	ret
  1c:	90                   	nop
  1d:	90                   	nop
  1e:	90                   	nop
  1f:	90                   	nop
  20:	90                   	nop
  21:	90                   	nop
  22:	90                   	nop
  23:	90                   	nop
  24:	90                   	nop
  25:	90                   	nop
  26:	90                   	nop
  27:	90                   	nop
  28:	cd 80                	int    $0x80
  2a:*	c3                   	ret		<-- trapping instruction
  2b:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
  31:	8d bc 27 00 00 00 00 	lea    0x0(%rdi,%riz,1),%edi
  38:	8b 1c 24             	mov    (%rsp),%ebx
  3b:	c3                   	ret
  3c:	8d                   	.byte 0x8d
  3d:	b6 00                	mov    $0x0,%dh
	...

Code starting with the faulting instruction
===========================================
   0:	c3                   	ret
   1:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
   7:	8d bc 27 00 00 00 00 	lea    0x0(%rdi,%riz,1),%edi
   e:	8b 1c 24             	mov    (%rsp),%ebx
  11:	c3                   	ret
  12:	8d                   	.byte 0x8d
  13:	b6 00                	mov    $0x0,%dh


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240510/202405101709.37715bca-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

