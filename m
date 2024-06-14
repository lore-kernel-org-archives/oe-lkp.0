Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B0014883F
	for <oe-lkp@lists.linux.dev>; Fri, 14 Jun 2024 07:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718349711; cv=fail; b=PejR5gFHGfHu9TI+85X0nFQ1T7BqFmewtnvrubQSuxhDhJTgG8HLSHyQCb3EqMfEzRt0Haaf3eIl1rml+QIj1vVgKSqXiPcMWUehzavBkkwnc363Dgo5CregKiDyS0/dLs8F/9KU1iavwzk19t7vJvIfjw2z3NEPS+M7JHGabIE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718349711; c=relaxed/simple;
	bh=i2SLAG4YqEsQ8KIoO6+sFomTG8CTVayBL2dRw6JUBbY=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=kJu/JumA8JZmNWu6hrFpOKnmZEVM+NLL9gj/d38LgMUlh0RMqJKHGn5uNwdiMFiX3xuqc4mf56lc8qaHw2QpcLdKMEI6q3WQKlbSIW2yR+MHlxE2Ax4UMzXOsRut4zazvcQ7eCE4BPeT7rfC0W4+y+Po1C3VnvspWbknB2wSe4o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hRGg3s8E; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hRGg3s8E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718349710; x=1749885710;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i2SLAG4YqEsQ8KIoO6+sFomTG8CTVayBL2dRw6JUBbY=;
  b=hRGg3s8EMkLUOjt2v32Jz36oJyGkFcVc2vVt3atW/CF5pn6juidHHpuP
   gG45lYm1bSspw8hOhzFPEsgoW6gGMs25qhGb6B/EEi+lPWhC4wXXTg0a7
   sXe84dWMjzZFbZTECWmqTEBmIb0yn/SFJyKd5bmPvw/nDmTb/iybUwnH2
   BgyBpgJGqJMZj24nvlYYcLtqmuCcWpMJSFMn33METhXdf7L6B1kY/FJok
   o+3DL5fFvD+uJ4LnA7WLKmjCX6QLtXALuAn9YdwzY/b6Sh52cjnCADWO7
   Z3oj81LDOtrm+uTtxzW1VB8MokUzUU9iMmLCXUNflDNd2yAJkOUBELroJ
   Q==;
X-CSE-ConnectionGUID: CDgMQ5yjSFWiGRR4raKH1g==
X-CSE-MsgGUID: GEv62ARTQgK9Yvo+kUlXgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="12070191"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="12070191"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 00:21:49 -0700
X-CSE-ConnectionGUID: yNNcUPBYT9WHNpEjByiPUg==
X-CSE-MsgGUID: Y0CiFa2hTiSatv6je18aMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="40519410"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 14 Jun 2024 00:21:49 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 14 Jun 2024 00:21:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 14 Jun 2024 00:21:48 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 14 Jun 2024 00:21:48 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Jun 2024 00:21:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y9XxS44mwKgsm09eXXKU8uesCSzNk4k1mG3Onx7u3VAYJadgLjtt6MUAec6q3mj01IdlduHkrWHBqd71RvtxlwU8+GwxfnAc0IANOZrlcdtW5r9CjyiKeLKwyo7wUWXdUrHkbEZeLaUwOGqCfqKkdeh93BsBA0zq/Ez+6+FLVsua5IfeRgUVkBAiXhN5IoPmjbi72oFuIaTlbUZP8ia99+aeAaNtNv/XvLilsL8rUtyAydGR2ab6peAQh6QYJkDJnJEnrErrsTa/suflbiZ7eOFmiqaOug4WjIxwHKScC/wswxEVDiv1FmPs84CRihb9pdynzB3M4NWxLiceKI7QhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x6OIAXHEnDG7K1c1IVo45ENcOmfreMzvvn/vERogKWA=;
 b=AzairkCOGw8XOacWI7naYEU2YCQEwtOCfCee6ey4bCD5h5yjxkuUSa2IiYLZlcHiw1ypqrUkKOOtl6LYfJRT9Fuf4XhIyp1/VIB08yS96lqYmmZMqntoo0ZsG5Y9hHxSYGr2qVeNhFAYhZzoH+G8lgBJJhD+lESVxhoJ37487ApDoNsoVh/KKXiXjVevIkYaeIykVQ/nMHOwEFPSuKQ4Aox2sb5ilMZL/4G8eMxh/3WAbusyhhuvXN5eTD8t/r7EFtFjAXKDVDtunFSF0yR+iyecAhYF8SDCSnqbW6bTOY9fYctbXAZl4yV6CRtIHCV1j2A7Heo8YXV6WtHxmB7n3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DS0PR11MB8764.namprd11.prod.outlook.com (2603:10b6:8:192::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.24; Fri, 14 Jun
 2024 07:21:46 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%2]) with mapi id 15.20.7633.037; Fri, 14 Jun 2024
 07:21:46 +0000
Date: Fri, 14 Jun 2024 15:21:38 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-mm@kvack.org>,
	<oliver.sang@intel.com>
Subject: [vbabka:slub-reservations] [mm, mempool]  3ae623ab8e:
 INFO:trying_to_register_non-static_key
Message-ID: <202406141514.6a6cf495-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2P153CA0009.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::18) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DS0PR11MB8764:EE_
X-MS-Office365-Filtering-Correlation-Id: 055a1d26-6ad3-4cc1-4e4e-08dc8c42a610
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230035|376009|1800799019|366011;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Oov9ev+PxUHAx59wJCSuJoOT12TBz/67fqKva6ZI3xBzHTn4bYA7lGM+pWdz?=
 =?us-ascii?Q?iPQGKlZ+40S0K+DZviqJ7pV9F1VH41WfQqC7+SF5PmTlKoCtz4rSbnn5FYh4?=
 =?us-ascii?Q?KaE6yuuwcXKeZcndooxs42U4HvXUvwTSuveYD3fL4sBL3y9+kGsyE7WW+Ajh?=
 =?us-ascii?Q?0NN0nwCQx4eZL7iVWnDhc+rhRXXo9bb0DIyyGKlCwe4Mq9n5TOXo6jMkd33W?=
 =?us-ascii?Q?+y7XodbCxMdfL4X9dsO2+8ZK5e9q14ef3pJKvQdXqphevNSfotgAwCmzRL4B?=
 =?us-ascii?Q?L8Fkd/QYoheGhxiVOtQJs6UG9pic9+NjGNevIhekFTaACn08BpehoL8Ljpty?=
 =?us-ascii?Q?wLH9J9nd0EISIrMamSX1x0Pt5dXvkRg4nCB3EGVwQ78qpIO0BqMTHDyGcMIH?=
 =?us-ascii?Q?QqhMRPe6f/tzu0ZrMUDxTzKI5NtU9XK/3gIwZQTRM2gD0buUUb0sq6s9P8P/?=
 =?us-ascii?Q?tz5X5SWDouOc9lNl7QV23/s2pRfAbmdSN1ldwh4m/RonLXWyoXiwXbXzbVJE?=
 =?us-ascii?Q?SHUPYh2s9nPzR0XzBNOu3P2Of8o5QwIQP0oxIVexbMbTfD1cq2XKj0SF4yW0?=
 =?us-ascii?Q?2iSzBYV9LXdrvAwm9y55F3m+RQrxPCvoUnLqFn/5tfPcEhiP2hPx4mzLmuTd?=
 =?us-ascii?Q?0czSl3PoO3xofgg5qkM68KfmuXGkw+iZJvJ0cTaiykezIq2xYzjIr3Zl6xpc?=
 =?us-ascii?Q?h3SGoV+5gtNa722/Hfx6NfN+2V/EbpEm/CS2tNgojuLrxGltUwOCavXy7jSa?=
 =?us-ascii?Q?OVDEzdNdEIP1czFgfBzkqaVUWAqDjEH8K4SO8OrpDyGAa9EFWFjp33crK8g1?=
 =?us-ascii?Q?319k+pMBjpJr/me7X0PWiVqVj9CIaBilILleghsZkWG5EBX+wY1zNZrc9g4e?=
 =?us-ascii?Q?iqUosMMS+fNmizcBW8Xox763q/sadBGd12rPTfii9vcj2b16oONWFi41gZG4?=
 =?us-ascii?Q?SGIAKhetJAKKzIy/NhIzF9ygFGM4lMe68RJwQt/PVF2lFYjEV4ECyy5e6vlA?=
 =?us-ascii?Q?3ejbjvQNPCBco+ixHqepeQTQynmYwGzM+XN6Fx5lgEXhNIV7zlXaYxxrD5nU?=
 =?us-ascii?Q?F0QwcOD3S6tEK6KATaLc1p8IMIn5lQJ/Ednqd6yRAaDnYH0WTQmwiIdgpSkH?=
 =?us-ascii?Q?HTKOfPoUneWlSMB0JVOsN2jASArzudDp7EFuQoXJuM6e5uEoOThgJjFpipby?=
 =?us-ascii?Q?wK5evuwfExHcq0g+4hRYofiCMyXrG/V0/CJiNdPQtMH+pHHLTen4UobFm16z?=
 =?us-ascii?Q?2Dm09Z3Nu2seNTyp5i9qICZb9YgC47UNkRlTBWKIhg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230035)(376009)(1800799019)(366011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QhGa/1FQY2KjltAkWwD9YmJ9R2z+4sb5pJHQSRK2ZoGf0A7ZKW2rdhl1Y7Pk?=
 =?us-ascii?Q?Fq+eWPfij9gJ9iUFYoYqNcrG5UoPyQ8hvMgAu8U8dX/3F1bx+NqG4X5IYBxC?=
 =?us-ascii?Q?biVgSM8tyDiH5SwkAoL0LSKXaOIwDlTvCgJE62DG/BnUe9GJtlk3zNaUSvrR?=
 =?us-ascii?Q?e69nZaRA2xA5VESVz3BEj1FdJTBh+5dVyQlhOqNoiGietdt6qMfWhMdUYPTk?=
 =?us-ascii?Q?LXSQwdRc2TvdVhp0B3VMowhNUmqmKZ6+coavfYtxMn2TaSz+qpphtHr9NmSr?=
 =?us-ascii?Q?6z2e4NC6MekcHUX4awUplK5t7WYTYFVbB1G7pWwiO5wCED7T4IA9YtgFDBQT?=
 =?us-ascii?Q?Sf14ntaS0U/QoqsRyOanD66r+nTSK9blSBBMfz8kEHWy0AZJfHu9ZkCMQD3r?=
 =?us-ascii?Q?celCZwDIcczi7UMOv0cP+nCWJFbw/nJrFKUL0FQDaXNdCbTPAw4eqGyh6Umn?=
 =?us-ascii?Q?0D1WoDK/74bnoX0BOuS2otuq6/gdNT3y2Wtp+FaAM3X6klGS8BIv59OG4Jze?=
 =?us-ascii?Q?zxLKFdLv+mJjLJ0LAUNcAkrF4CMXdiW6dZNG85Awvc/kEPWt3D2ECkzOFoh4?=
 =?us-ascii?Q?Y2DUg0zLpvYuFB3WooeOKOJ+0XcRRRHkvkGeF4JPygW8CFf3F6rXkKn2rFnS?=
 =?us-ascii?Q?yfv8C126I4F+rYSy4kkLfhgAhllwkOyMIcUfCA9YGL/Q330yJjPkOmnrP2Ad?=
 =?us-ascii?Q?z98rkzQNefQgXYSLpihkjXf8LantHeqcLxpRD/tzHsjdoXoy0B2i/VnBYcB8?=
 =?us-ascii?Q?AO1ckK570DU/nMz9h40IKGH/4dxcsX6KbnnjmL/IuwuhfZGSnuy//BKmbdgA?=
 =?us-ascii?Q?SCMcTPL0NXg5aFDqGmD9d5+VYbuIicXEC4kEYFYnM5LaOr2hPKf8KUD/O0bI?=
 =?us-ascii?Q?mF8e803O1z8yJFKit/1wfTrNUAomKaQv6mcEPRLwqrXGChDBkmQcW5KPIICO?=
 =?us-ascii?Q?RzzDeG0yXoPU59cfxlVVUroE1vCcLXjd0Zcm/VDDwGkARaMyf9ez9wn0io7B?=
 =?us-ascii?Q?ifosfRpbsnFe5crZ8J5+z+RvI73ZCuHqKpX8lXuW+N3ZE7Cnt7zjtGzIPXvA?=
 =?us-ascii?Q?OlrLNmeYfTczwyASBQqHUeLbOBX+EUMhIdC44s1bOBr2iBqwneH5qGaKMuhM?=
 =?us-ascii?Q?esg1QuMuxiFU1SQUcLHuiSLYe5iICDi+jnmwvBJjLgjrNW5tFL+HSrZVZl0J?=
 =?us-ascii?Q?Wubc5QWse36bapbJeeczBWojsWeLMreFxcN20YBDLcmYJOLufEMuhSAnE2OH?=
 =?us-ascii?Q?ldhEriXfbpyztw/+PhKBlClfbgdHdv2jTM5es6KY33ViT73ZqCTMODFBDCC7?=
 =?us-ascii?Q?1hnSM/Vd4Yr+vd8govVOWXVNd4ePCo0Lb1Q3TKr1w5cl1H7SwKOWwfWHVeJz?=
 =?us-ascii?Q?rE2vlqXz1f+5Eg3dpihs698NCTd1+OYOeK0ebZ1Oto8wsVJmrpqawXvMZhYS?=
 =?us-ascii?Q?2F3I+6EnLJnr34YCPYuwNZiYU56IFrrKtcWfrLp096SrYpg4hW1Ajwlpd7+g?=
 =?us-ascii?Q?i7qr+VnVhf7HVjWZI/4u7XGSnIsG2w/Y7xjUHk5jgvR67B0Wuh5R6x3fmewk?=
 =?us-ascii?Q?hPYZmsgvWHumwONwwW2iZ6X8qfRWwZZQxssLoOGnv6pTvrND3ajSfdRTY4gS?=
 =?us-ascii?Q?Lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 055a1d26-6ad3-4cc1-4e4e-08dc8c42a610
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 07:21:46.4620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Obr2evmrij5eS06HnUGgOnOPOR+KeXDkByVha2QdMuK0fZ6XTcWXmOWJ5vkz/yh18qAbDN7rJYMBJTAFapOsWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8764
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "INFO:trying_to_register_non-static_key" on:

commit: 3ae623ab8ec82241c38ef52190b96384a5d664c6 ("mm, mempool: reimplement slab mempools by kmem_cache_reserve")
https://git.kernel.org/cgit/linux/kernel/git/vbabka/linux.git slub-reservations

in testcase: boot

compiler: clang-18
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+----------------------------------------+------------+------------+
|                                        | 17f60c99bf | 3ae623ab8e |
+----------------------------------------+------------+------------+
| INFO:trying_to_register_non-static_key | 0          | 6          |
+----------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202406141514.6a6cf495-lkp@intel.com


[    2.600112][    T1] INFO: trying to register non-static key.
[    2.600690][    T1] The code is fine but needs lockdep annotation, or maybe
[    2.600690][    T1] you didn't initialize this object before use?
[    2.600690][    T1] turning off the locking correctness validator.
[    2.600690][    T1] CPU: 0 PID: 1 Comm: swapper Not tainted 6.10.0-rc1-00007-g3ae623ab8ec8 #1
[    2.600690][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[    2.600690][    T1] Call Trace:
[ 2.600690][ T1] dump_stack_lvl (lib/dump_stack.c:116) 
[ 2.600690][ T1] dump_stack (lib/dump_stack.c:123) 
[ 2.600690][ T1] assign_lock_key (kernel/locking/lockdep.c:?) 
[ 2.600690][ T1] register_lock_class (kernel/locking/lockdep.c:?) 
[ 2.600690][ T1] __lock_acquire (kernel/locking/lockdep.c:5014) 
[ 2.600690][ T1] ? __lock_acquire (kernel/locking/lockdep.c:3762) 
[ 2.600690][ T1] ? rcu_read_lock_any_held (kernel/rcu/update.c:386) 
[ 2.600690][ T1] ? __lock_acquire (kernel/locking/lockdep.c:3762) 
[ 2.600690][ T1] ? fb_io_write (drivers/video/fbdev/core/fb_io_fops.c:82) 
[ 2.600690][ T1] ? kvm_sched_clock_read (arch/x86/kernel/kvmclock.c:91) 
[ 2.600690][ T1] ? sched_clock_noinstr (arch/x86/kernel/tsc.c:266) 
[ 2.600690][ T1] ? local_clock_noinstr (kernel/sched/clock.c:269 kernel/sched/clock.c:306) 
[ 2.600690][ T1] lock_acquire (kernel/locking/lockdep.c:5754) 
[ 2.600690][ T1] ? __kmem_cache_reserve_resize (mm/slub.c:5410) 
[ 2.600690][ T1] ? trace_hardirqs_on (kernel/trace/trace_preemptirq.c:63) 
[ 2.600690][ T1] ? get_partial (mm/slub.c:2804) 
[ 2.600690][ T1] ? __kmem_cache_reserve_resize (mm/slub.c:5410) 
[ 2.600690][ T1] _raw_spin_lock_irqsave (include/linux/spinlock_api_smp.h:110 kernel/locking/spinlock.c:162) 
[ 2.600690][ T1] ? __kmem_cache_reserve_resize (mm/slub.c:5410) 
[ 2.600690][ T1] __kmem_cache_reserve_resize (mm/slub.c:5410) 
[ 2.600690][ T1] ? __kmalloc_cache_noprof (mm/slub.c:4165) 
[ 2.600690][ T1] ? __kmalloc_cache_noprof (include/trace/events/kmem.h:54) 
[ 2.600690][ T1] ? kmem_cache_reserve_create (include/linux/slab.h:? mm/slub.c:5486) 
[ 2.600690][ T1] kmem_cache_reserve_create (mm/slub.c:5494) 
[ 2.600690][ T1] mempool_create_slab_pool (mm/mempool.c:267 mm/mempool.c:324) 
[ 2.600690][ T1] dmaengine_init_unmap_pool (drivers/dma/dmaengine.c:1409) 
[ 2.600690][ T1] dma_bus_init (drivers/dma/dmaengine.c:1592) 
[ 2.600690][ T1] do_one_initcall (init/main.c:1267) 
[ 2.600690][ T1] ? dma_channel_table_init (drivers/dma/dmaengine.c:1589) 
[ 2.600690][ T1] ? kvm_sched_clock_read (arch/x86/kernel/kvmclock.c:91) 
[ 2.600690][ T1] ? sched_clock_noinstr (arch/x86/kernel/tsc.c:266) 
[ 2.600690][ T1] ? local_clock_noinstr (kernel/sched/clock.c:269 kernel/sched/clock.c:306) 
[ 2.600690][ T1] ? local_clock (arch/x86/include/asm/preempt.h:94 kernel/sched/clock.c:316) 
[ 2.600690][ T1] ? kvm_sched_clock_read (arch/x86/kernel/kvmclock.c:91) 
[ 2.600690][ T1] ? local_clock_noinstr (kernel/sched/clock.c:269 kernel/sched/clock.c:306) 
[ 2.600690][ T1] ? rcu_read_lock_any_held (kernel/rcu/update.c:386) 
[ 2.600690][ T1] ? __lock_acquire (kernel/locking/lockdep.c:3762) 
[ 2.600690][ T1] ? post_alloc_hook (include/linux/page_owner.h:?) 
[ 2.600690][ T1] ? prep_new_page (mm/page_alloc.c:1478) 
[ 2.600690][ T1] ? get_page_from_freelist (mm/page_alloc.c:3402) 
[ 2.600690][ T1] ? kvm_sched_clock_read (arch/x86/kernel/kvmclock.c:91) 
[ 2.600690][ T1] ? sched_clock_noinstr (arch/x86/kernel/tsc.c:266) 
[ 2.600690][ T1] ? local_clock_noinstr (kernel/sched/clock.c:269 kernel/sched/clock.c:306) 
[ 2.600690][ T1] ? local_clock (arch/x86/include/asm/preempt.h:94 kernel/sched/clock.c:316) 
[ 2.600690][ T1] ? next_arg (lib/cmdline.c:273) 
[ 2.600690][ T1] ? do_initcall_level (init/main.c:1313) 
[ 2.600690][ T1] ? parse_args (kernel/params.c:153) 
[ 2.600690][ T1] do_initcall_level (init/main.c:1328) 
[ 2.600690][ T1] ? rest_init (init/main.c:1459) 
[ 2.600690][ T1] do_initcalls (init/main.c:1342) 
[ 2.600690][ T1] ? rest_init (init/main.c:1459) 
[ 2.600690][ T1] do_basic_setup (init/main.c:1365) 
[ 2.600690][ T1] kernel_init_freeable (init/main.c:1582) 
[ 2.600690][ T1] kernel_init (init/main.c:1469) 
[ 2.600690][ T1] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 2.600690][ T1] ret_from_fork_asm (arch/x86/entry/entry_32.S:737) 
[ 2.600690][ T1] entry_INT80_32 (arch/x86/entry/entry_32.S:944) 



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240614/202406141514.6a6cf495-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

