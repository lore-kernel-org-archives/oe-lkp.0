Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967CC1F03C8
	for <oe-lkp@lists.linux.dev>; Fri, 21 Mar 2025 09:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742547705; cv=fail; b=nYO/QL26yptv+3wnStnv2aUHwNzw2sFlkdoccGoXBZhDIVa67GolA13N2eeOvCImymL6eS7HiAm5/fU3imYAIJp4SbGwbF/J8T28xk792hDwbx6FokUCs/A1ECjTCZ9wz6i5Ny4JY0VO60QrkELWoBtmHUYdh8jATeRX0aQB/vg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742547705; c=relaxed/simple;
	bh=b1mCJ6IKHNcz9FRC9gMw5hmWH6RQA36ogVwD6LnfCgk=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=nm3ADlfVLT0wSDqGCBw68s3fWCFHLnV2EsBRz+TVQ265lJnKWDtiuVcNsX6IIqr7gpBU75WmDrJ6gAGQ/p6Nmd/EmXAl1OW5giC/kEXujE3m8Px73FIPjA5TDAdwBfGYfJXxJQ+QYbXU9AAg20H+Dr2mBnwMt8mG7gr1hgv4QwQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n/94MLSt; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n/94MLSt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742547702; x=1774083702;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b1mCJ6IKHNcz9FRC9gMw5hmWH6RQA36ogVwD6LnfCgk=;
  b=n/94MLStNZLSko6juuXUyFgsocQ41b83Za76WFy/ERxJDhRUH4Yps13K
   TQUyyMu5gJIQb7PnVQiR6iJWficqT+ktmsKalN+6ihGawmuiIktWbHLQG
   CXYfT4XzPE+KFq4Rh9UEfDzuvS/f7OOn7pDaL2cL99sQDumbGHKz4zFMA
   lJBd/uBMKGErEyEYtTfoz7lJSaJUBmRcTvCYZ0z9yCpSUeYbP8bqIU4sw
   flRYcvc4gjFkcsl3wOMFQ9cKg3jRFs5M2E//Bh7h/ZoHg1i1t5zA8XsNp
   DCQOmV89/jaBHVn3bIw4kHm8EqzQD0XSCNo+SiXwQVA/IFxxz5QkMv5kh
   w==;
X-CSE-ConnectionGUID: K8XpU0HSQ/CjogePcNCCXw==
X-CSE-MsgGUID: SRB3YTb9TTinJRhbSYQ5MA==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="69161012"
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; 
   d="scan'208";a="69161012"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 02:01:42 -0700
X-CSE-ConnectionGUID: mZbwztpZS5KkCrgYDe/BkQ==
X-CSE-MsgGUID: 8LOxfr7hQOGJu80XtMk/6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; 
   d="scan'208";a="128575328"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 02:01:41 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Fri, 21 Mar 2025 02:01:41 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 21 Mar 2025 02:01:41 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 21 Mar 2025 02:01:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xBHECCLhNiy7HUuPWVYh6tBWhCYqoDrltu3qaoEibcVQms6dY5934u8DBdqyXegSHv/Af9Jq7wVn7WB2x6vmN1SD+vGxYnwHYHVL+zDBp+G7hxB2d7f+p2y/EMXYvt3BHvjmbG61KKVkv6Nr32AC3AYG0CHVJhYAlso6j2okIjfASWEMsW5wfkcbJ3Oti0HwCE9btR16Bj18PIE3lltMBhQN7gaOy0kCFNQHsNuk2JUp36bbLOojRMYrgRGBwHCNuWHTHdhdH339g6gUo/K5uBzbt93ijhPj00x78Hrvgd0NcZ2guEUx0Yu+i2hfvOJEvtKrfA+dxIrNybYoI4eaxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WlnYYFI6YXZ4hCCkI0O1fhb9V1TF6nugEo7Emu3psGc=;
 b=R+6KLWJn8P5/XxpdbsIy/bDWUx5wVqrCmVZi9tvp2nk40MPMXi/gm0meEB3syL/2Z3VgKZcBihDCvMUhJHy7IArkzKNNScmSM37RaedTYLigPMcZzVVqdL5NnRc5Ks7CObsErkBrdvV8EW/Fuzc2nMgHQU0tGoTTXy6Xz7ShyO3GIihPLyFdUcuat2Uy4gUls69DjDJv656gdiPXX8FtLxxG/mB60weERg7mHah1I8ozvroODaOJE/eJ15XblTqUdfdOng/l/avzqbVWd/Zkir8ydyP0GrGRIqlSJ/RNYk2p/FBVeoGvm89/DedrcuW2PZTL1PYB89gl6kRnUAjg/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by LV8PR11MB8536.namprd11.prod.outlook.com (2603:10b6:408:1ec::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Fri, 21 Mar
 2025 09:01:33 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8534.034; Fri, 21 Mar 2025
 09:01:33 +0000
Date: Fri, 21 Mar 2025 17:01:25 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [arm-integrator:kb-ctor-test] [mm]  a95a2d7776:
 BUG:Bad_page_state_in_process
Message-ID: <202503211612.e11bd73f-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:194::17) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|LV8PR11MB8536:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ce615b6-a32f-4108-c2a1-08dd6856fa36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kYUnnj54jBIGkSOHE12OCauoLCnyICR0rphVkL0jz+Zd4dEfYRbmyyKxP4Xr?=
 =?us-ascii?Q?icdeEbCU5FyhEXKPonCFyy6MhUYB2fH7NVPnbezxcKQqdl5XxiQ6VTQPMR2X?=
 =?us-ascii?Q?Qe9n0LT1UP3ZAZ9/FaTYGQXWou+n87UpAnX6C8ASjcAENowZE5fAX2/lYNoT?=
 =?us-ascii?Q?81zkx6ITOH5XDyA5lUR+xnNFhUWURqh24WaQPEbek+qhTVEIOYLyBB+YwTvd?=
 =?us-ascii?Q?dYJoxIsJl7K+rl3ucyuzLQc74TLQe9xxKmHkyRS5zU48BTT+zUu2veQIgbBt?=
 =?us-ascii?Q?viRFQ5zAbtmtVBpXOlokZs2xSBz0fYFrZJ/rIJC5Ed/r0fy98salC7Tc98ku?=
 =?us-ascii?Q?IhWQL0+n8xiwRiLH67209gdTs34qiEF9qS3uW4vtFnbHSiroe14xQXEmBwfV?=
 =?us-ascii?Q?PPhpgduShBmmVUro/FFThfDgjcXB0LLkw/6vh0VPPrjJKShHBwzO9ywvXwMd?=
 =?us-ascii?Q?uDD70xVB1CJ4r7Jsb5RtbTjUht/gC/saetiSTMFXua4aLenGQCSRVQSCZeD1?=
 =?us-ascii?Q?2r3KOwp/N+FWN7q/Pk5yfNXcXRnuJzQhyOM+xSPi9D7rXnfEdGI/M34dj0cu?=
 =?us-ascii?Q?px8qUFvRRlJ+OeYWjZESbDhDFvlptAe6W6EfubH4BMEG3rtA0uAmsz7wW2qv?=
 =?us-ascii?Q?eFSyEZea+JwOHpcZpHwFtUQnMANzQZHfYrIG1gq8P6+7tX+Qu71jlgxamfnh?=
 =?us-ascii?Q?zUBVO71qqFbyQVgrLK3rBT++pLE9Z8zTt+fROXj5deQQ8ee6Ks5g+W5b7Rce?=
 =?us-ascii?Q?IfncM+E9uUW/y1cpLgALUEGAQPDRYMVU4+HRiskzvYLePOIqpG1awXqnhv2Z?=
 =?us-ascii?Q?o7hzoCe8P5MlfuPZexx/hMR6RZgoWzsnPFCc3MntokhdJTgGCuZ2H0ypsmp6?=
 =?us-ascii?Q?7QpiSbjTxVZDCM8Q7i3daZ8ch0+6OAWAGxuOLz1QUTyN3CCMLVYemGj4Xxhj?=
 =?us-ascii?Q?OGRs3FC1xXbWE13RFwGi5Ywv8Mx8hvvKx3ayvTgy2BO0PoCTnN17KbJ1x6Vp?=
 =?us-ascii?Q?/z64n3N/U6SpVv1yUb6dcHDKbX7q2lqhJn70+OsngDRYUwG7bXgkYG+3G12H?=
 =?us-ascii?Q?T2mRXuVz8TWMOuIE25gCSpoTqb0OOVlXpKgDMJw2Oulyi8mIZXc2EhwzTE3T?=
 =?us-ascii?Q?JOXc7F7gXOS9f/+DjrgdwbJxj96aTOMbvWH7yuFtAyBtrC7Xxo68b5y9yTAE?=
 =?us-ascii?Q?S2MSX5h6Oe94af4reLBijkbWXJfUFCLyDkqdF9E2D2VFpQ9HFoPkW2JW1IWt?=
 =?us-ascii?Q?ocmF5yFJ2R+DW1pvT54yu7Tdz6pasFBfby729H+IR2v0D7VXLwU/Q1FWz3Rm?=
 =?us-ascii?Q?BLRNDUeqqmuYsfe0M4jQ1sYX6bAUJcNhyJVbKp5SbkrdAA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?spX4ak2+uz4SFrFWmK8APcPWVL4YGTmg9qn5FDYjdpU3AGOwz262AyqN4eSh?=
 =?us-ascii?Q?m+O/9BjxC/F82ukgi8hzAt4Vlj1aBVrQIPjKRDwV2Ohxm2qrQEtnkJ4d//rn?=
 =?us-ascii?Q?bhuSA0fxUJDWuM1Wy2areWLylRSZu9Fyqz05c2Vmm8eyf42xFjhZDMwHAZfg?=
 =?us-ascii?Q?7Fbe6/HpLf7UjGidoxsyOnUHuzMLvKqz7JYaYohZk7qeNJx5k+bVVMm5PlF6?=
 =?us-ascii?Q?EmYIxcHUgWxJ9niHFSPAsA997575rhlGQynj5svwTiZYpn75Yr8KtQN4Pi4k?=
 =?us-ascii?Q?STA8KJ/K9sX9hUpTXM0rNhzmfKG1Il0gFOOzrNuiWNfnBUOv0J/vh2XYPzxP?=
 =?us-ascii?Q?QWCIMLeyE/pc5orufT5VmPG6IofNz44ct+nYV6y/CiL1Rb+0JcgGP5l1UcPM?=
 =?us-ascii?Q?/ZcXR7jiKX2uimYgxZkcfBTcz+kMCxyyS7AVPzSiVG2+GpI4jtkOtVJ7tkQT?=
 =?us-ascii?Q?n3v9UJxtW+tzFIrUGGmPZiNyaeF/c2oDE/tJEwzdQwaM0hfIQOOvmp3UaUYZ?=
 =?us-ascii?Q?RqfsHUN4ZBhfx/nKrtpS6i6sXQwpJzqTc/B5fYSyBJAQgTif8ZWuqsJxVOaG?=
 =?us-ascii?Q?StMp2BJPtusQjCqtl9yAShIV6Ptve+1wY8fWlQ3Pk2H1L/Ku4gp+ZbFOWZoh?=
 =?us-ascii?Q?gPHOevo7hB08387hsMyg2fbzwwMmafy5GL/M8AzBNH7VSKcsyRA8WGm4W0Ss?=
 =?us-ascii?Q?pD6wwr9XdDCrL1kB3bhNtTIOosyvDn4YPgO0ytgRj1yZwc0MewccdnDcd4aj?=
 =?us-ascii?Q?PlwbY7Pc84NdJ5p1TOopr27PSsoUEOplvBrw4kDUi4nsNBKAutQpvhB2Ze8v?=
 =?us-ascii?Q?uanjCpCizYqWWEo1GpTPGEy2oHbUG+kYTjAvAeUsD+xi4Bdcn0+Aq7rbb3CE?=
 =?us-ascii?Q?PORWX3LBjE6SDZRBhUaHImlqkea9ltJfPTkMlt2sZOSt4d32n/qJGVr8POSZ?=
 =?us-ascii?Q?1H/zJgmSmTCX64Euu2OQqnrGaQa9XU+BmgqHgX+vDZr7WKYzm6mCHELaRv7K?=
 =?us-ascii?Q?wNREUfq6uQylflIHJixoHkF45k9EHdcqSGJKJ5RL/Va9Y7FRbUGV0niax9Dy?=
 =?us-ascii?Q?QEY0mwEEHFmC8Yx99fuUgv2mQQzFw8Hja78UpSOVOCT6QyS6AIjIWTypyLPW?=
 =?us-ascii?Q?vnb3SePZ+j1TX5Q0619C/K2O+poltji7RcMm9cHXDdVnZsbi0xPVM+ZOm/RG?=
 =?us-ascii?Q?CyRTPSwHEABJ+7m6OhjB8hXYGfk1+AsFQJaUhrS5/bNawptgtOgxsvpMz/Tn?=
 =?us-ascii?Q?lug15bqzYbUXB4q0hksh8Wx/ze41Q7+PghFxX0Mtgs3IF6/QYFjWgPxq8SRm?=
 =?us-ascii?Q?f175QLWfOYJf3GFs2fUoJxsKdfYEtGbUXpEj/z5jXfJobMfuiS2wsCDqhn7T?=
 =?us-ascii?Q?QQM2FEZWwGFahClKYW5RkDMhH3aHp9loNuUSOBPHqRXdvZ+GlftMjb61mcaa?=
 =?us-ascii?Q?bTqpr1fEt/fQN0cfSd8EOxmyM9SB+dkV9SFsGea+6EehavSFP6Upl68Xw8fk?=
 =?us-ascii?Q?cAS2wBTIUXbHa2iPbMi1wiVQZTxLR9D1ITxd0kpPoEghCob7LjSPxLWs//hT?=
 =?us-ascii?Q?5J9XD9cljw5fRTvxBLfLOd3oNBeK/635L08yrEgdYCv3+Y+ITVec2dS/vZFj?=
 =?us-ascii?Q?OQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ce615b6-a32f-4108-c2a1-08dd6856fa36
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 09:01:33.4845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E2sniSXse2eICC3Sa+bY41quJu6RuGvHE80Ug2ebaha/o6QmffQCTeQPg3NkNJZCJH4aJBL4r9vHMFAiSV57zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8536
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:Bad_page_state_in_process" on:

commit: a95a2d77760758cdd6379716428c4382d365eeb6 ("mm: Call ctor/dtor for kernel PTEs")
https://git.kernel.org/cgit/linux/kernel/git/linusw/linux-integrator.git kb-ctor-test

in testcase: trinity
version: 
with following parameters:

	runtime: 600s



config: x86_64-randconfig-001-20250317-CONFIG_PINCTRL_AMD
compiler: clang-20
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+--------------------------------------------------+------------+------------+
|                                                  | 0e59cb8322 | a95a2d7776 |
+--------------------------------------------------+------------+------------+
| BUG:Bad_page_state_in_process                    | 0          | 15         |
+--------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202503211612.e11bd73f-lkp@intel.com


[   43.101131][  T102] BUG: Bad page state in process udevd  pfn:13fae7
[   43.101632][  T102] page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x13fae7
[   43.102241][  T102] flags: 0x8000000000000000(zone=2)
[   43.102594][  T102] page_type: f2(table)
[   43.102881][  T102] raw: 8000000000000000 0000000000000000 dead000000000122 0000000000000000
[   43.103464][  T102] raw: 0000000000000000 0000000000000000 00000000f2000000 0000000000000000
[   43.104031][  T102] page dumped because: nonzero mapcount
[   43.104403][  T102] page_owner tracks the page as allocated
[   43.104803][  T102] page last allocated via order 0, migratetype Unmovable, gfp_mask 0x40dc0(GFP_KERNEL|__GFP_COMP|__GFP_ZERO), pid 101, tgid 101 (udevd), ts 42486952320, free_ts 0
[ 43.105918][ T102] prep_new_page (ld-temp.o:?) 
[ 43.106282][ T102] get_page_from_freelist (ld-temp.o:?) 
[ 43.106667][ T102] __alloc_frozen_pages_noprof (ld-temp.o:?) 
[ 43.107047][ T102] __alloc_pages_noprof (ld-temp.o:?) 
[ 43.107407][ T102] __pte_alloc_kernel (ld-temp.o:?) 
[ 43.107774][ T102] __vmap_pages_range_noflush (ld-temp.o:?) 
[ 43.108150][ T102] __vmalloc_node_range_noprof (ld-temp.o:?) 
[ 43.108787][ T102] vmalloc_noprof (ld-temp.o:?) 
[ 43.109104][ T102] kernel_read_file (ld-temp.o:?) 
[ 43.109471][ T102] __se_sys_finit_module (ld-temp.o:?) 
[ 43.110539][ T102] do_int80_emulation (ld-temp.o:?) 
[ 43.110933][ T102] asm_int80_emulation (arch/x86/include/asm/idtentry.h:626) 
[   43.111271][  T102] page_owner free stack trace missing
[   43.111645][  T102] Modules linked in: bochs(+) drm_shmem_helper sysimgblt syscopyarea sysfillrect fb_sys_fops drm_client_lib drm_kms_helper fb drm polyval_clmulni polyval_generic sha512_ssse3 sha1_ssse3 font drm_panel_orientation_quirks rapl usblp backlight i2c_piix4 serio_raw i2c_core parport_pc
[   43.113491][  T102] CPU: 0 UID: 0 PID: 102 Comm: udevd Tainted: G                T  6.14.0-rc6-00002-ga95a2d777607 #1 4555c09398d9f8416e3faf72f33a35420434152b
[   43.114470][  T102] Tainted: [T]=RANDSTRUCT
[   43.114772][  T102] Call Trace:
[   43.115001][  T102]  <TASK>
[ 43.115213][ T102] dump_stack_lvl (ld-temp.o:?) 
[ 43.115576][ T102] bad_page (ld-temp.o:?) 
[ 43.115858][ T102] free_frozen_pages (ld-temp.o:?) 
[ 43.116195][ T102] ? __virt_addr_valid (ld-temp.o:?) 
[ 43.116561][ T102] pmd_free_pte_page (ld-temp.o:?) 
[ 43.116881][ T102] vmap_range_noflush (ld-temp.o:?) 
[ 43.117238][ T102] __ioremap_caller (ld-temp.o:?) 
[ 43.117608][ T102] ? bochs_pci_probe (drivers/gpu/drm/tiny/bochs.c:282) bochs 
[ 43.118285][ T102] __devm_ioremap (ld-temp.o:?) 
[ 43.118763][ T102] bochs_pci_probe (drivers/gpu/drm/tiny/bochs.c:282) bochs 
[ 43.119389][ T102] pci_device_probe (ld-temp.o:?) 
[ 43.119740][ T102] really_probe (ld-temp.o:?) 
[ 43.120081][ T102] driver_probe_device (ld-temp.o:?) 
[ 43.120427][ T102] __driver_attach (ld-temp.o:?) 
[ 43.120757][ T102] ? driver_attach (ld-temp.o:?) 
[ 43.121076][ T102] bus_for_each_dev (ld-temp.o:?) 
[ 43.121412][ T102] bus_add_driver (ld-temp.o:?) 
[ 43.121751][ T102] driver_register (ld-temp.o:?) 
[   43.122076][  T102]  ? 0xffffffffc033e000
[ 43.122363][ T102] do_one_initcall (init/main.c:1257) 
[ 43.122756][ T102] ? __lock_acquire (ld-temp.o:?) 
[ 43.123191][ T102] ? __lock_acquire (ld-temp.o:?) 
[ 43.123548][ T102] ? save_stack (ld-temp.o:?) 
[ 43.123869][ T102] ? __slab_alloc_node (ld-temp.o:?) 
[ 43.124224][ T102] ? lock_acquire (ld-temp.o:?) 
[ 43.124544][ T102] ? __slab_alloc_node (ld-temp.o:?) 
[ 43.124886][ T102] ? __slab_alloc_node (ld-temp.o:?) 
[ 43.125225][ T102] ? kvm_sched_clock_read (ld-temp.o:?) 
[ 43.125582][ T102] ? local_clock_noinstr (ld-temp.o:?) 
[ 43.125919][ T102] ? lockdep_hardirqs_on (ld-temp.o:?) 
[ 43.126267][ T102] ? _raw_spin_unlock_irqrestore (ld-temp.o:?) 
[ 43.126689][ T102] ? __slab_alloc_node (ld-temp.o:?) 
[ 43.127038][ T102] ? do_init_module (ld-temp.o:?) 
[ 43.127378][ T102] ? slab_alloc_node (ld-temp.o:?) 
[ 43.127705][ T102] do_init_module (ld-temp.o:?) 
[ 43.128019][ T102] __se_sys_finit_module (ld-temp.o:?) 
[ 43.128428][ T102] do_int80_emulation (ld-temp.o:?) 
[ 43.128776][ T102] asm_int80_emulation (arch/x86/include/asm/idtentry.h:626) 
[   43.129125][  T102] RIP: 0023:0xf7de3222
[ 43.129419][ T102] Code: 06 89 8a f0 02 00 00 c3 55 57 56 53 8b 6c 24 2c 8b 7c 24 28 8b 74 24 24 8b 54 24 20 8b 4c 24 1c 8b 5c 24 18 8b 44 24 14 cd 80 <5b> 5e 5f 5d 3d 01 f0 ff ff 0f 83 8f b5 f3 ff c3 66 90 66 90 66 90
All code
========
   0:	06                   	(bad)
   1:	89 8a f0 02 00 00    	mov    %ecx,0x2f0(%rdx)
   7:	c3                   	ret
   8:	55                   	push   %rbp
   9:	57                   	push   %rdi
   a:	56                   	push   %rsi
   b:	53                   	push   %rbx
   c:	8b 6c 24 2c          	mov    0x2c(%rsp),%ebp
  10:	8b 7c 24 28          	mov    0x28(%rsp),%edi
  14:	8b 74 24 24          	mov    0x24(%rsp),%esi
  18:	8b 54 24 20          	mov    0x20(%rsp),%edx
  1c:	8b 4c 24 1c          	mov    0x1c(%rsp),%ecx
  20:	8b 5c 24 18          	mov    0x18(%rsp),%ebx
  24:	8b 44 24 14          	mov    0x14(%rsp),%eax
  28:	cd 80                	int    $0x80
  2a:*	5b                   	pop    %rbx		<-- trapping instruction
  2b:	5e                   	pop    %rsi
  2c:	5f                   	pop    %rdi
  2d:	5d                   	pop    %rbp
  2e:	3d 01 f0 ff ff       	cmp    $0xfffff001,%eax
  33:	0f 83 8f b5 f3 ff    	jae    0xfffffffffff3b5c8
  39:	c3                   	ret
  3a:	66 90                	xchg   %ax,%ax
  3c:	66 90                	xchg   %ax,%ax
  3e:	66 90                	xchg   %ax,%ax

Code starting with the faulting instruction
===========================================
   0:	5b                   	pop    %rbx
   1:	5e                   	pop    %rsi
   2:	5f                   	pop    %rdi
   3:	5d                   	pop    %rbp
   4:	3d 01 f0 ff ff       	cmp    $0xfffff001,%eax
   9:	0f 83 8f b5 f3 ff    	jae    0xfffffffffff3b59e
   f:	c3                   	ret
  10:	66 90                	xchg   %ax,%ax
  12:	66 90                	xchg   %ax,%ax
  14:	66 90                	xchg   %ax,%ax
[   43.130736][  T102] RSP: 002b:00000000ffec57cc EFLAGS: 00000292 ORIG_RAX: 000000000000015e
[   43.131340][  T102] RAX: ffffffffffffffda RBX: 0000000000000016 RCX: 00000000f7eae1e3
[   43.131887][  T102] RDX: 0000000000000000 RSI: 00000000565fac90 RDI: 00000000565f5650
[   43.132434][  T102] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
[   43.132982][  T102] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
[   43.133516][  T102] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
[   43.134120][  T102]  </TASK>
[   43.134394][  T102] Disabling lock debugging due to kernel taint


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250321/202503211612.e11bd73f-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

