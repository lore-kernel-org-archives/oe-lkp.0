Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8583E274670
	for <oe-lkp@lists.linux.dev>; Tue, 30 Dec 2025 06:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767077117; cv=fail; b=G4+6bI2RckcwRhoAezX4HmbO6S1cyROdlUgx6sBX6PNv3lRxtXfcZDuK20uQDIpE8W7zdmhgXBxmlURyYZVSwUzhgolMNgVMsqWkWWonUzNV9AABK83zx5woLwhspknRembxsu4gVl6C25Em9lVZXkh+ILb+wgBqvnJdUE940hc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767077117; c=relaxed/simple;
	bh=lwFwmd/F0O0758ZLNg+wtSQuogDMzhWtkL0vnqOBMEg=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=qV00AEYapgVeKgwy95V1NIKO//uNfbOK78wlzSy2x0NSK1ayLOMHKSFf3iCE/E8oTSROx2VWLzmFEBlWxYxHh+QtJZdEf5xTU/bXRvTEPKgBBZs+dv/Tq1BsIpl3OnMufMjMosWcWzrhmhxFSYffBatulf42ZqqqNIsL39t/kcw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=amrEzTVm; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="amrEzTVm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767077111; x=1798613111;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=lwFwmd/F0O0758ZLNg+wtSQuogDMzhWtkL0vnqOBMEg=;
  b=amrEzTVmHyXnsBdl7035E3RO07/zT63uqKbr/B30PLNoMjEBU6poNVPr
   XCVr/j8y9oHnrUq5CcrxNTDq5GxGdihURq9q/hTL4sj5zDIIe5LtNG7wz
   +jnOgwamBpsaZHRhL3LELuXSIW36xBnXN5NVd8FEywxtoxyFz14wrF3SR
   4/13bg2O3KMVyRwcLJH1CnFbkRmTiT+HULjphAZeZodpgVmO6ZwBOCvMc
   mxsSsphgV5TE0KINXkcYhuWUVPFLfW02wEMK8KREa3PQP07KnePqnyI0a
   Ew+8s4rm0aPoWniY/IC6jqLZI9YeSXC5lnGPoLPlUidfhj1L5DIJJ3sHE
   w==;
X-CSE-ConnectionGUID: kgsTV20SRviOm0nbxbyKzg==
X-CSE-MsgGUID: O8lOqJT8QbqoFUqEB8ibyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="86248152"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="86248152"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 22:45:11 -0800
X-CSE-ConnectionGUID: faA/KDLLTmCXw66qXtLQxA==
X-CSE-MsgGUID: ZZw7BCpZTvGzk42FxMItaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="238587204"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 22:45:10 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 29 Dec 2025 22:45:09 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 29 Dec 2025 22:45:09 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.55) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 29 Dec 2025 22:45:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dYpao0JXoqV8Ey4j9Vtq+jgBxwF6Jtkpv+XPhB8osQjov7B+Hio/ZDHOpRuvxFTfpyR72FzhuDCgEkNVHbA4gCxdJ5G60201hMlpzz5m01J1ZvytmJ2FN2px1Tw9UD+WXmUaEqVpuCy8dALCd9sH7t4yZ90ECe5latzK5koiWulNkZK1yqx6OGm+euEIdxndLqKr/P7goie0Qrsh5jBTmYHm6TQ7EpKCORz4y09qH38/N2Gi2ew7vkoOKinHNS919IrlntU9VrDGsSEwvyUZn0GMxKe9hq74UIigDGsYgC16BzW7UdqBOsrYdOIlO5TIFvTMuNxM4dHjmpPVf2D+Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A/EauqM+e2Sq4du3wtgrMOO0mEcXISNSIzWssQwCxPg=;
 b=r9SGc20/bqz5vSKARQ40W2TGC357xlPCJJxFyzDUE04Pok9idTtsJpimaIrcsGxraC8r4YREscg7w14EDbJpB4kBuGgyfS/39bCd6ViU7uIG3kbAjbstYphs2wTd6u44bmk1jb0X9zYIxFOJGIoBOvFAfhk1vWbQAyfbAWu4947K/10qsg8TT3Jw7JEC7BIIAXGwMfQ3tHyF5nQZJ2NiNmV5/t+GE9kknB9ylHzJ5jpbLa9egrUqQlcmCqxeX1fgGfpQqjCLa8Nj9rFR7GJ+a0zxs3CyGTX3MCzjeXz+oixF/UN/qTBRUiWuOQ6jKcJ2EN3RmVF6i9tDKM0wkO+U5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CH3PR11MB8443.namprd11.prod.outlook.com (2603:10b6:610:1bd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 30 Dec
 2025 06:45:07 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9456.013; Tue, 30 Dec 2025
 06:45:07 +0000
Date: Tue, 30 Dec 2025 14:44:56 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Mel Gorman <mgorman@techsingularity.net>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, <aubrey.li@linux.intel.com>,
	<yu.c.chen@intel.com>, <oliver.sang@intel.com>
Subject: [linus:master] [sched/fair]  aceccac58a: netperf.Throughput_Mbps
 4.3% improvement
Message-ID: <202512301459.2236351a-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: KL1P15301CA0050.APCP153.PROD.OUTLOOK.COM
 (2603:1096:820:3d::16) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CH3PR11MB8443:EE_
X-MS-Office365-Filtering-Correlation-Id: 036a69ea-9659-45fb-9b9a-08de476ef80d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?3zUvHrHTngmcOYLTCaETgpt5n/0mWheLw0YbhZ3rTbNGdKvyk10LENawAf?=
 =?iso-8859-1?Q?dL0a2+GD39t7ETNAnXlzK39cUHSQJwPJFrJGdeDdoBBlUQ+4eBNSlG7aY7?=
 =?iso-8859-1?Q?77ELg1lPEFTGMKfMy+15EPZ+xbqP1J7k98qStzYJ4gVSAGQdE7nKv6l1NL?=
 =?iso-8859-1?Q?ob86AVh5D06XyKihUBbKq/UUPZcp4OPHC322w/H1wwasmmeiv4iGQs1GV4?=
 =?iso-8859-1?Q?dKgSQMGbOGD02vl8o4DGWcEu7A9b8ABLwBkmiyl4fVAGiEQoHYVWcolQWu?=
 =?iso-8859-1?Q?bKeVSOSBNPHg6bBl+sH9FVjLRHvbFVLJ6ugDRZPePXYneEhfsoPUwvZ8cT?=
 =?iso-8859-1?Q?q4ebjZBM/adb4RGYYbR0DpQwnTKAFV9MWTvSfqrM+NJvbE2yj/QAwap+hO?=
 =?iso-8859-1?Q?xly1wRq6dmMrc/xpqmnrsBKYJyA9arDBbGkqVkOeFKzAT9iFDFhUTaLX5/?=
 =?iso-8859-1?Q?XmMTHJ86TYyWFYGkmPatVWY7s9MRmDmGsWSamAEJLAntR6fck+dN0ADWQL?=
 =?iso-8859-1?Q?fBI4mphaERCzKYiqQSbbHRlTyxFgSu5E5fLCHdvhWvbv/6krA9kPYP8kmD?=
 =?iso-8859-1?Q?w3RdXIJF5ZVIUHAYb6g+M/JxuAYMK+V6LukTsBug6NjvFvKZkIBeDZ4/xX?=
 =?iso-8859-1?Q?LSRJlKvMVjs/Ism+qrq63osQQRZgly/D2Eo6XcpRG/La0KLq1RyDKWTGPq?=
 =?iso-8859-1?Q?j73wjMAwr364oN9KDCYVtXPE+Nv/pqWEKNal5Elf7tcPePIO+YJ2g07HPF?=
 =?iso-8859-1?Q?0YRDK2Zi4Hzghua1K5l//Rtz3k+b3DVulk/FOa/VH1us3a3fT6DTmbDzKs?=
 =?iso-8859-1?Q?r4j0X0gV86LNdAF6qz3j6ycRBxK5Ar1KNgph6f8/16H/48wPOThGCzhIfV?=
 =?iso-8859-1?Q?Ezgnb2Dy4Q1RuAXxdXW0Xhsgla+EHwirCs+dwe5Ny4qu4cyrEy7afhjlfN?=
 =?iso-8859-1?Q?xRv35ffFkRuZjLUCoTkSlWpstcuB2k1FEGGza9RrzV+OEY5p3MWULy0AWX?=
 =?iso-8859-1?Q?+YYkE5Jfp5JCfV4ALzFo5RpXSvYXb/02NdyQzByvOw3uQJtgQt9haoTXsH?=
 =?iso-8859-1?Q?/3IAiaQuBZ5BQiTYyeoaAwMtmvxCHQBOMgr5laTe5o1IdgeFvOkl725xjo?=
 =?iso-8859-1?Q?Bv4ZqqoDqK8BtqeVGRZtQ5k7j8PSjO1ST3uG+HD3K0kCeq/hcf+HyICZ2I?=
 =?iso-8859-1?Q?+TANVtJK1Av/RuGuVhVSCcKWhRLm5XgEID2LuMgqvFjF4MPBwHn3p3mXqi?=
 =?iso-8859-1?Q?WiMxBRkTG9GTWEbAplwu84vj+RuHk+0TN7X3x1pCRW0hMqwOL5UOakjsiJ?=
 =?iso-8859-1?Q?ZWTIR3nUzkl6du/DZ1HZDjr5rIyEgSwVRySSFImo0OCuAG4DSMs0fx3eiZ?=
 =?iso-8859-1?Q?wOVmENt+una5AaHP5he5aa4FOb8imBGg/A5E117neUBRfgoSuySDJVfC59?=
 =?iso-8859-1?Q?r0OzcfqgIKI+hlazFsstbDoBeuCabZA9QXg+3uOggJiUjFNqyoZBDYEHRC?=
 =?iso-8859-1?Q?DQ6BzjomXQ+AXvQTOTy0HMl492o1Wx1Qa+ZHUXVXRX7w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?IqXJ+GRMAVE/a5Z8/rkM8Wsxb6aNpOg9f9ExCfiyMADF+ukkRJBOjkTdMZ?=
 =?iso-8859-1?Q?F+HlDNDiAphZCZYUhrjrFuT8yoN6/2rJ/b3bIlkwCwFUXbe2fbYe2D5P+R?=
 =?iso-8859-1?Q?I7KlFZg3LDxcv5ExY2OCqy9NdW+jbkQvS6hNZ/QRVhxN3H1kJax3pBxq7+?=
 =?iso-8859-1?Q?/kX6+o6CiTJH2rdoWNZwH5NlfsBSNyIgLeEWYgfWSlBkX1gFLGk7l+pMmH?=
 =?iso-8859-1?Q?A4+/A7impoT1jYWRWXuFext5bck8NJSEJjk2ELwgalGsp1g5IfyKlcczIy?=
 =?iso-8859-1?Q?nMrv+rXDYmipTIbjnNgIaVgbkdwQY4ZcM+ymiDbLGeGVsorj+F6KDu1TFu?=
 =?iso-8859-1?Q?FARxctdSuS8EVYPYlLMjQVsMcwop9UzrTiODr3HeOex1IY4SOWB5687xEX?=
 =?iso-8859-1?Q?QI+Vrx2hNurSFJPpwVckZYFoPVDfYLA33kWeaXzZinc1/qkUsYVxRkLrHn?=
 =?iso-8859-1?Q?QktjE4wOLZAa8khL8sANUiHvW9/nTira4d4GGIp8gjxfu4c/B0O0wKIVQF?=
 =?iso-8859-1?Q?h1N6YWYuC0QRzpbdj7TMR2vjSyhDhI1Zr4IqXgUN2/O1LvAZhcLrYfiToo?=
 =?iso-8859-1?Q?pQDsP/6IJVTv2NTU37OXB1ZBZjie6nd7yb2kglHURFbqhJFwNDdGkNfAws?=
 =?iso-8859-1?Q?UhXoojo8UaAh2uj4kcgC2aSuf2FmcVvKbpqfBAQPLAZxhZ9iflU5VcS6Gp?=
 =?iso-8859-1?Q?OnhAwOmSpjT8r9Wgpf3Wl9ZtjStl1FTnlxWD72FQXuFrdG2/em7o/gNOpN?=
 =?iso-8859-1?Q?lEyYbvHX0wwBv6FqwIzdyQi5UKepfDudCZm8MSmDWa+y2r0isTv/59knyb?=
 =?iso-8859-1?Q?OB42ww3p2v7WfIJNKXOEJCNJTMN7d56zWBPax+sZDVW5ezRb+lpAQ+dOLO?=
 =?iso-8859-1?Q?ubuwHKIJ0FyrWV9xZg4IfT3iAYEJgpCSd91llQ+duMlm1zgZEUPOZ7CQfV?=
 =?iso-8859-1?Q?Q0qPzRZBR4YByHYEDOUjvBDhwKgauj+JpPEuJLAmwohK0ko+b/B/PgmTUd?=
 =?iso-8859-1?Q?773PP8oBTbaPHwQWM5DNKcdHxB+n3XsUqqY7lLFuhqdRtfW1zaodh2cvKB?=
 =?iso-8859-1?Q?EC1xw5OL0rUUoz1D+rSnvbIy7cvDLYxqzkHlNV37LJZRnop8TcU9J6CEX3?=
 =?iso-8859-1?Q?cjcvFME8iSd1hkRvSaI1Kgj+C8shSMBdlxcGBnl1d1QhsRMcT72YyR/Swp?=
 =?iso-8859-1?Q?AkfEh8INJPwyBjcN/JYrLL71Cgz+MMj+6uwEXx0kjviIrBGEeDxslecMVk?=
 =?iso-8859-1?Q?bplrHVzXN2BTpusFp/URnzNOmF/gzNffc665VKTP2uYtjHggMJ9ppQsbyd?=
 =?iso-8859-1?Q?kD1P3bFdtNhB1tefhdAKJuvOlfZeJgBTW88yddYtynvh52KRH4ZXKEJSh/?=
 =?iso-8859-1?Q?OJkFjZZGXHvmI8u2BFOsXsWARY5DUYYJrjPM+O+QcMqDCKlYJgV2RXwCtH?=
 =?iso-8859-1?Q?h4c+N5QMTfyJ9FVUTBInEvO4Ga0Rz7JwXXumwnCcVvPgtyocy1Mbc+q0mp?=
 =?iso-8859-1?Q?GaNfjQvuCu0W7Sw0p5Xr8RI1tPobpxh3eGZGutdx9QGj8hitgdBNCQPIxZ?=
 =?iso-8859-1?Q?Z/EHLKnU/LOkAMFFqxVRac1omrlMbtRdb8T+IMTgGexlztkV2RljT/Qzhm?=
 =?iso-8859-1?Q?i6iuy0somi0uMjCszmNCnZUPTKqnLyRLm/qYtLJ9kp5Um+e8j3c1RRKPMb?=
 =?iso-8859-1?Q?Ukz14g5TIjtsvSiP2ltSJEZvaahN+ZJT9i1MNvmHkFIKiEoWU/Lmm7ff8J?=
 =?iso-8859-1?Q?Sa85oRQrCJABGb1h+GuoNxfaK/TQr5DeHy/ylUcmL9U5+EiYh3sgXNyOeF?=
 =?iso-8859-1?Q?LfSmsAnOag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 036a69ea-9659-45fb-9b9a-08de476ef80d
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 06:45:07.0429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6kiBC5BjX2j5Nncm9TwJrKtq8W8HjFZ3PWG1d/sh56FajwlzFuwyq9zTUEGLyrnspoEyxuT1TbscrCFRudwV2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8443
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 4.3% improvement of netperf.Throughput_Mbps on:


commit: aceccac58ad76305d147165788ea6b939bef179b ("sched/fair: Enable scheduler feature NEXT_BUDDY")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master


testcase: netperf
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory
parameters:

	ip: ipv4
	runtime: 300s
	nr_threads: 200%
	cluster: cs-localhost
	send_size: 10K
	test: TCP_SENDFILE
	cpufreq_governor: performance



Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20251230/202512301459.2236351a-lkp@intel.com

=========================================================================================
cluster/compiler/cpufreq_governor/ip/kconfig/nr_threads/rootfs/runtime/send_size/tbox_group/test/testcase:
  cs-localhost/gcc-14/performance/ipv4/x86_64-rhel-9.4/200%/debian-13-x86_64-20250902.cgz/300s/10K/lkp-icl-2sp7/TCP_SENDFILE/netperf

commit: 
  aaab6bb54a ("sched: Increase sched_tick_remote timeout")
  aceccac58a ("sched/fair: Enable scheduler feature NEXT_BUDDY")

aaab6bb54ab9bc4c aceccac58ad76305d147165788e 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    315.01            -2.5%     307.10        turbostat.PkgWatt
   3402279           -48.3%    1760606 ±  4%  vmstat.system.cs
   1438290 ±  8%     -26.6%    1055585 ± 15%  numa-numastat.node1.local_node
   1472939 ±  9%     -25.8%    1092271 ± 14%  numa-numastat.node1.numa_hit
   1472860 ±  9%     -25.8%    1092343 ± 14%  numa-vmstat.node1.numa_hit
   1438212 ±  8%     -26.6%    1055657 ± 15%  numa-vmstat.node1.numa_local
      1.10 ±  2%     +29.0%       1.42 ± 11%  perf-sched.total_wait_and_delay.average.ms
      0.78 ±  2%     +35.4%       1.05 ± 11%  perf-sched.total_wait_time.average.ms
      1.10 ±  2%     +29.0%       1.42 ± 11%  perf-sched.wait_and_delay.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      0.78 ±  2%     +35.4%       1.05 ± 11%  perf-sched.wait_time.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      0.76 ±  5%     -15.5%       0.64 ±  8%  sched_debug.cfs_rq:/.h_nr_queued.stddev
      0.60 ±  5%     -12.2%       0.53 ±  6%  sched_debug.cfs_rq:/.h_nr_runnable.stddev
      0.77 ±  5%     -15.4%       0.65 ±  8%  sched_debug.cpu.nr_running.stddev
   7370360           -53.2%    3445960 ±  6%  sched_debug.cpu.nr_switches.avg
   9652155 ±  5%     -37.3%    6052042 ±  9%  sched_debug.cpu.nr_switches.max
   4785808 ± 12%     -60.4%    1893117 ± 31%  sched_debug.cpu.nr_switches.min
    197081            -2.4%     192423        proc-vmstat.nr_anon_pages
     75745 ± 12%     -53.7%      35051 ± 61%  proc-vmstat.numa_hint_faults
   2037334 ±  6%     -19.7%    1635822 ±  3%  proc-vmstat.numa_hit
   1971099 ±  6%     -20.4%    1569616 ±  4%  proc-vmstat.numa_local
    259855 ± 29%     -44.7%     143675 ± 43%  proc-vmstat.numa_pte_updates
   4387566 ± 14%     -47.0%    2323477 ±  5%  proc-vmstat.pgalloc_normal
   3618813 ± 17%     -57.7%    1530193 ±  5%  proc-vmstat.pgfree
     11121            +4.3%      11599        netperf.ThroughputBoth_Mbps
   1423590            +4.3%    1484701        netperf.ThroughputBoth_total_Mbps
     11121            +4.3%      11599        netperf.Throughput_Mbps
   1423590            +4.3%    1484701        netperf.Throughput_total_Mbps
 5.062e+08           -49.7%  2.545e+08 ±  4%  netperf.time.involuntary_context_switches
      3667            +3.1%       3781        netperf.time.percent_of_cpu_this_job_got
     10526            +3.4%      10886        netperf.time.system_time
    526.11            -3.2%     509.33        netperf.time.user_time
   9162123           +15.2%   10556033        netperf.time.voluntary_context_switches
 5.213e+09            +4.3%  5.437e+09        netperf.workload
      0.08 ±  4%     +12.4%       0.09        perf-stat.i.MPKI
  3.39e+10            -6.2%  3.178e+10        perf-stat.i.branch-instructions
      0.66            -0.1        0.60        perf-stat.i.branch-miss-rate%
 2.243e+08           -14.7%  1.913e+08        perf-stat.i.branch-misses
  10339362 ±  3%      +5.1%   10866145        perf-stat.i.cache-misses
 1.775e+08            +5.5%  1.872e+08        perf-stat.i.cache-references
   3424461           -48.3%    1771813 ±  4%  perf-stat.i.context-switches
      1.21            +6.7%       1.29        perf-stat.i.cpi
    595.57 ±  5%     -24.9%     447.03 ±  5%  perf-stat.i.cpu-migrations
     20185 ±  3%      -4.7%      19245        perf-stat.i.cycles-between-cache-misses
 1.626e+11            -6.5%   1.52e+11        perf-stat.i.instructions
      0.83            -6.5%       0.77        perf-stat.i.ipc
     53.51           -48.3%      27.68 ±  4%  perf-stat.i.metric.K/sec
      2939            -4.7%       2802 ±  3%  perf-stat.i.minor-faults
      2939            -4.7%       2802 ±  3%  perf-stat.i.page-faults
      0.06 ±  3%     +12.4%       0.07        perf-stat.overall.MPKI
      0.66            -0.1        0.60        perf-stat.overall.branch-miss-rate%
      1.21            +7.2%       1.29        perf-stat.overall.cpi
     19007 ±  4%      -4.8%      18099        perf-stat.overall.cycles-between-cache-misses
      0.83            -6.7%       0.77        perf-stat.overall.ipc
      9437           -10.7%       8432        perf-stat.overall.path-length
 3.379e+10            -6.3%  3.168e+10        perf-stat.ps.branch-instructions
 2.235e+08           -14.7%  1.907e+08        perf-stat.ps.branch-misses
  10302839 ±  3%      +5.1%   10830052        perf-stat.ps.cache-misses
 1.769e+08            +5.5%  1.866e+08        perf-stat.ps.cache-references
   3413010           -48.3%    1764901 ±  4%  perf-stat.ps.context-switches
    593.61 ±  5%     -24.9%     445.66 ±  5%  perf-stat.ps.cpu-migrations
 1.621e+11            -6.5%  1.515e+11        perf-stat.ps.instructions
      2925            -4.6%       2790 ±  3%  perf-stat.ps.minor-faults
      2925            -4.6%       2790 ±  3%  perf-stat.ps.page-faults
  4.92e+13            -6.8%  4.585e+13        perf-stat.total.instructions
     31.84            -2.7       29.18        perf-profile.calltrace.cycles-pp.accept_connection.accept_connections.main
     31.84            -2.7       29.18        perf-profile.calltrace.cycles-pp.accept_connections.main
     31.84            -2.7       29.18        perf-profile.calltrace.cycles-pp.process_requests.spawn_child.accept_connection.accept_connections.main
     31.84            -2.7       29.18        perf-profile.calltrace.cycles-pp.spawn_child.accept_connection.accept_connections.main
     30.99            -2.4       28.57        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.process_requests.spawn_child.accept_connection.accept_connections
     30.95            -2.4       28.54        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.process_requests.spawn_child.accept_connection
      5.78 ±  3%      -2.3        3.49 ±  6%  perf-profile.calltrace.cycles-pp.ip_output.__ip_queue_xmit.__tcp_transmit_skb.tcp_write_xmit.__tcp_push_pending_frames
     30.15            -2.1       28.04 ±  2%  perf-profile.calltrace.cycles-pp.__x64_sys_recvfrom.do_syscall_64.entry_SYSCALL_64_after_hwframe.process_requests.spawn_child
     30.09            -2.1       28.00 ±  2%  perf-profile.calltrace.cycles-pp.__sys_recvfrom.__x64_sys_recvfrom.do_syscall_64.entry_SYSCALL_64_after_hwframe.process_requests
     29.70            -2.0       27.71 ±  2%  perf-profile.calltrace.cycles-pp.sock_recvmsg.__sys_recvfrom.__x64_sys_recvfrom.do_syscall_64.entry_SYSCALL_64_after_hwframe
     29.60            -2.0       27.64 ±  2%  perf-profile.calltrace.cycles-pp.inet_recvmsg.sock_recvmsg.__sys_recvfrom.__x64_sys_recvfrom.do_syscall_64
     28.26            -1.9       26.33        perf-profile.calltrace.cycles-pp.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg.sock_recvmsg.__sys_recvfrom
     29.50            -1.9       27.57 ±  2%  perf-profile.calltrace.cycles-pp.tcp_recvmsg.inet_recvmsg.sock_recvmsg.__sys_recvfrom.__x64_sys_recvfrom
      6.52 ±  2%      -1.8        4.73 ±  2%  perf-profile.calltrace.cycles-pp.__tcp_push_pending_frames.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg.splice_to_socket
      6.31 ±  2%      -1.8        4.52 ±  2%  perf-profile.calltrace.cycles-pp.tcp_write_xmit.__tcp_push_pending_frames.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg
      4.32 ±  3%      -1.8        2.55 ±  6%  perf-profile.calltrace.cycles-pp.__tcp_transmit_skb.tcp_write_xmit.__tcp_push_pending_frames.tcp_sendmsg_locked.tcp_sendmsg
      3.97 ±  3%      -1.6        2.34 ±  6%  perf-profile.calltrace.cycles-pp.__ip_queue_xmit.__tcp_transmit_skb.tcp_write_xmit.__tcp_push_pending_frames.tcp_sendmsg_locked
      2.36 ±  3%      -1.6        0.75 ± 24%  perf-profile.calltrace.cycles-pp.__wake_up_common.__wake_up_sync_key.sock_def_readable.tcp_data_queue.tcp_rcv_established
      2.17 ± 10%      -1.5        0.66 ±  5%  perf-profile.calltrace.cycles-pp.try_to_wake_up.__wake_up_common.__wake_up_sync_key.sock_def_readable.tcp_data_queue
      3.07 ±  3%      -1.3        1.81 ±  6%  perf-profile.calltrace.cycles-pp.sk_wait_data.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg.sock_recvmsg
      6.67 ±  2%      -1.2        5.42 ±  4%  perf-profile.calltrace.cycles-pp.__tcp_transmit_skb.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg.sock_recvmsg
      2.59 ±  3%      -1.2        1.37 ±  4%  perf-profile.calltrace.cycles-pp.sock_def_readable.tcp_data_queue.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv
      2.47 ±  3%      -1.2        1.27 ±  4%  perf-profile.calltrace.cycles-pp.__wake_up_sync_key.sock_def_readable.tcp_data_queue.tcp_rcv_established.tcp_v4_do_rcv
      3.26 ±  3%      -1.2        2.11 ±  7%  perf-profile.calltrace.cycles-pp.__release_sock.release_sock.tcp_sendmsg.sock_sendmsg.splice_to_socket
     18.37            -1.1       17.24        perf-profile.calltrace.cycles-pp.__dev_queue_xmit.ip_finish_output2.ip_output.__ip_queue_xmit.__tcp_transmit_skb
      6.41 ±  3%      -1.1        5.29 ±  5%  perf-profile.calltrace.cycles-pp.__ip_queue_xmit.__tcp_transmit_skb.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg
      2.62 ±  3%      -1.1        1.54 ±  6%  perf-profile.calltrace.cycles-pp.wait_woken.sk_wait_data.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg
      3.84 ±  2%      -1.1        2.78 ±  5%  perf-profile.calltrace.cycles-pp.release_sock.tcp_sendmsg.sock_sendmsg.splice_to_socket.direct_splice_actor
      6.24 ±  3%      -1.1        5.19 ±  5%  perf-profile.calltrace.cycles-pp.ip_output.__ip_queue_xmit.__tcp_transmit_skb.tcp_recvmsg_locked.tcp_recvmsg
      2.49 ±  3%      -1.0        1.46 ±  6%  perf-profile.calltrace.cycles-pp.schedule_timeout.wait_woken.sk_wait_data.tcp_recvmsg_locked.tcp_recvmsg
      6.16 ±  3%      -1.0        5.14 ±  5%  perf-profile.calltrace.cycles-pp.ip_finish_output2.ip_output.__ip_queue_xmit.__tcp_transmit_skb.tcp_recvmsg_locked
      2.38 ±  3%      -1.0        1.40 ±  6%  perf-profile.calltrace.cycles-pp.schedule.schedule_timeout.wait_woken.sk_wait_data.tcp_recvmsg_locked
      2.34 ±  3%      -1.0        1.37 ±  6%  perf-profile.calltrace.cycles-pp.__schedule.schedule.schedule_timeout.wait_woken.sk_wait_data
      2.47 ± 10%      -1.0        1.51 ± 10%  perf-profile.calltrace.cycles-pp.__tcp_transmit_skb.tcp_write_xmit.__tcp_push_pending_frames.tcp_rcv_established.tcp_v4_do_rcv
      2.41 ±  3%      -0.9        1.51 ±  7%  perf-profile.calltrace.cycles-pp.__tcp_push_pending_frames.tcp_rcv_established.tcp_v4_do_rcv.__release_sock.release_sock
      2.39 ±  3%      -0.9        1.50 ±  7%  perf-profile.calltrace.cycles-pp.tcp_write_xmit.__tcp_push_pending_frames.tcp_rcv_established.tcp_v4_do_rcv.__release_sock
     15.89            -0.8       15.11        perf-profile.calltrace.cycles-pp.__local_bh_enable_ip.__dev_queue_xmit.ip_finish_output2.ip_output.__ip_queue_xmit
     15.77            -0.8       15.01        perf-profile.calltrace.cycles-pp.do_softirq.__local_bh_enable_ip.__dev_queue_xmit.ip_finish_output2.ip_output
      2.18 ±  3%      -0.8        1.42 ±  6%  perf-profile.calltrace.cycles-pp.tcp_rcv_established.tcp_v4_do_rcv.__release_sock.release_sock.tcp_sendmsg
      2.18 ±  3%      -0.8        1.42 ±  7%  perf-profile.calltrace.cycles-pp.tcp_v4_do_rcv.__release_sock.release_sock.tcp_sendmsg.sock_sendmsg
      2.01 ±  4%      -0.7        1.27 ±  7%  perf-profile.calltrace.cycles-pp.__ip_queue_xmit.__tcp_transmit_skb.tcp_write_xmit.__tcp_push_pending_frames.tcp_rcv_established
     15.60            -0.7       14.87        perf-profile.calltrace.cycles-pp.handle_softirqs.do_softirq.__local_bh_enable_ip.__dev_queue_xmit.ip_finish_output2
      1.44 ±  2%      -0.7        0.79 ±  6%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.sendfile64.sendfile_tcp_stream
     14.82            -0.6       14.19        perf-profile.calltrace.cycles-pp.net_rx_action.handle_softirqs.do_softirq.__local_bh_enable_ip.__dev_queue_xmit
      1.06 ±  3%      -0.6        0.50 ± 38%  perf-profile.calltrace.cycles-pp.schedule.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.sendfile64
      1.03 ±  2%      -0.5        0.49 ± 38%  perf-profile.calltrace.cycles-pp.__schedule.schedule.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.13 ±  4%      -0.4        0.68 ±  6%  perf-profile.calltrace.cycles-pp.try_to_block_task.__schedule.schedule.schedule_timeout.wait_woken
     13.72            -0.4       13.27        perf-profile.calltrace.cycles-pp.__napi_poll.net_rx_action.handle_softirqs.do_softirq.__local_bh_enable_ip
     13.64            -0.4       13.22        perf-profile.calltrace.cycles-pp.process_backlog.__napi_poll.net_rx_action.handle_softirqs.do_softirq
      1.06 ±  4%      -0.4        0.64 ±  7%  perf-profile.calltrace.cycles-pp.dequeue_task_fair.try_to_block_task.__schedule.schedule.schedule_timeout
      1.02 ±  4%      -0.4        0.62 ±  7%  perf-profile.calltrace.cycles-pp.dequeue_entities.dequeue_task_fair.try_to_block_task.__schedule.schedule
     13.22            -0.4       12.86        perf-profile.calltrace.cycles-pp.__netif_receive_skb_one_core.process_backlog.__napi_poll.net_rx_action.handle_softirqs
      1.30 ±  2%      -0.3        1.00 ±  2%  perf-profile.calltrace.cycles-pp.__alloc_skb.tcp_stream_alloc_skb.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg
      1.94            -0.3        1.67 ±  2%  perf-profile.calltrace.cycles-pp.tcp_stream_alloc_skb.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg.splice_to_socket
      0.79 ±  3%      -0.2        0.54 ±  4%  perf-profile.calltrace.cycles-pp.kmem_cache_alloc_node_noprof.__alloc_skb.tcp_stream_alloc_skb.tcp_sendmsg_locked.tcp_sendmsg
      0.58            -0.1        0.51        perf-profile.calltrace.cycles-pp.arch_exit_to_user_mode_prepare.do_syscall_64.entry_SYSCALL_64_after_hwframe.sendfile64.sendfile_tcp_stream
      0.70            +0.0        0.72        perf-profile.calltrace.cycles-pp.atime_needs_update.touch_atime.filemap_splice_read.splice_direct_to_actor.do_splice_direct
      0.79            +0.0        0.81        perf-profile.calltrace.cycles-pp.touch_atime.filemap_splice_read.splice_direct_to_actor.do_splice_direct.do_sendfile
      0.58            +0.0        0.60        perf-profile.calltrace.cycles-pp.ktime_get.tcp_write_xmit.__tcp_push_pending_frames.tcp_sendmsg_locked.tcp_sendmsg
      0.99            +0.0        1.02        perf-profile.calltrace.cycles-pp.touch_atime.splice_direct_to_actor.do_splice_direct.do_sendfile.__x64_sys_sendfile64
      0.84            +0.0        0.88        perf-profile.calltrace.cycles-pp.atime_needs_update.touch_atime.splice_direct_to_actor.do_splice_direct.do_sendfile
      1.37            +0.1        1.43        perf-profile.calltrace.cycles-pp.iov_iter_extract_pages.skb_splice_from_iter.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg
      1.27            +0.1        1.33        perf-profile.calltrace.cycles-pp.clear_bhb_loop.sendfile64.sendfile_tcp_stream.main
      0.79 ±  2%      +0.1        0.86 ±  2%  perf-profile.calltrace.cycles-pp.tcp_current_mss.tcp_send_mss.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg
      1.75            +0.1        1.82        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.sendfile64.sendfile_tcp_stream.main
      1.02            +0.1        1.10        perf-profile.calltrace.cycles-pp.tcp_send_mss.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg.splice_to_socket
      0.94            +0.1        1.04        perf-profile.calltrace.cycles-pp.folios_put_refs.filemap_splice_read.splice_direct_to_actor.do_splice_direct.do_sendfile
      0.85            +0.2        1.03 ±  3%  perf-profile.calltrace.cycles-pp.skb_attempt_defer_free.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg.sock_recvmsg
      0.79 ±  2%      +0.2        0.98 ±  3%  perf-profile.calltrace.cycles-pp.skb_release_data.skb_attempt_defer_free.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg
      1.86            +0.2        2.05        perf-profile.calltrace.cycles-pp.skb_append_pagefrags.skb_splice_from_iter.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg
      0.47 ± 37%      +0.2        0.66 ±  4%  perf-profile.calltrace.cycles-pp.tcp_event_new_data_sent.tcp_write_xmit.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg
      1.65            +0.2        1.87        perf-profile.calltrace.cycles-pp.splice_folio_into_pipe.filemap_splice_read.splice_direct_to_actor.do_splice_direct.do_sendfile
      2.12 ±  3%      +0.2        2.35 ±  3%  perf-profile.calltrace.cycles-pp.tcp_ack.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv.ip_protocol_deliver_rcu
      2.16            +0.2        2.40        perf-profile.calltrace.cycles-pp.filemap_get_read_batch.filemap_get_pages.filemap_splice_read.splice_direct_to_actor.do_splice_direct
      2.54            +0.3        2.79        perf-profile.calltrace.cycles-pp.filemap_get_pages.filemap_splice_read.splice_direct_to_actor.do_splice_direct.do_sendfile
     10.85            +0.3       11.13        perf-profile.calltrace.cycles-pp._copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.tcp_recvmsg_locked.tcp_recvmsg
      0.95 ±  2%      +0.3        1.25 ±  2%  perf-profile.calltrace.cycles-pp.page_cache_pipe_buf_release.splice_to_socket.direct_splice_actor.splice_direct_to_actor.do_splice_direct
      4.18            +0.3        4.49        perf-profile.calltrace.cycles-pp.skb_splice_from_iter.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg.splice_to_socket
      1.86 ±  3%      +0.3        2.17 ±  3%  perf-profile.calltrace.cycles-pp.tcp_clean_rtx_queue.tcp_ack.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv
      0.67 ±  8%      +0.5        1.18 ±  6%  perf-profile.calltrace.cycles-pp.page_counter_uncharge.drain_stock.refill_stock.__sk_mem_reduce_allocated.tcp_clean_rtx_queue
      0.74 ±  8%      +0.5        1.24 ±  6%  perf-profile.calltrace.cycles-pp.refill_stock.__sk_mem_reduce_allocated.tcp_clean_rtx_queue.tcp_ack.tcp_rcv_established
      0.68 ±  8%      +0.5        1.19 ±  6%  perf-profile.calltrace.cycles-pp.drain_stock.refill_stock.__sk_mem_reduce_allocated.tcp_clean_rtx_queue.tcp_ack
      0.99 ±  6%      +0.5        1.50 ±  5%  perf-profile.calltrace.cycles-pp.__sk_mem_reduce_allocated.tcp_clean_rtx_queue.tcp_ack.tcp_rcv_established.tcp_v4_do_rcv
      0.67 ±  8%      +0.5        1.21 ±  5%  perf-profile.calltrace.cycles-pp.page_counter_uncharge.drain_stock.refill_stock.__sk_mem_reduce_allocated.tcp_recvmsg_locked
      0.68 ±  8%      +0.5        1.22 ±  5%  perf-profile.calltrace.cycles-pp.drain_stock.refill_stock.__sk_mem_reduce_allocated.tcp_recvmsg_locked.tcp_recvmsg
      0.74 ±  7%      +0.5        1.28 ±  5%  perf-profile.calltrace.cycles-pp.refill_stock.__sk_mem_reduce_allocated.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg
      1.00 ±  5%      +0.6        1.56 ±  4%  perf-profile.calltrace.cycles-pp.__sk_mem_reduce_allocated.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg.sock_recvmsg
      7.54            +0.7        8.21        perf-profile.calltrace.cycles-pp.filemap_splice_read.splice_direct_to_actor.do_splice_direct.do_sendfile.__x64_sys_sendfile64
      1.30 ±  6%      +1.1        2.40 ±  4%  perf-profile.calltrace.cycles-pp.page_counter_try_charge.try_charge_memcg.mem_cgroup_sk_charge.__sk_mem_raise_allocated.__sk_mem_schedule
      1.75 ±  7%      +1.1        2.86 ±  4%  perf-profile.calltrace.cycles-pp.try_charge_memcg.mem_cgroup_sk_charge.__sk_mem_raise_allocated.__sk_mem_schedule.tcp_wmem_schedule
      2.26 ±  5%      +1.1        3.38 ±  3%  perf-profile.calltrace.cycles-pp.mem_cgroup_sk_charge.__sk_mem_raise_allocated.__sk_mem_schedule.tcp_wmem_schedule.tcp_sendmsg_locked
      1.20 ± 24%      +1.3        2.54 ± 12%  perf-profile.calltrace.cycles-pp.try_charge_memcg.mem_cgroup_sk_charge.__sk_mem_raise_allocated.__sk_mem_schedule.tcp_try_rmem_schedule
      1.32 ± 22%      +1.4        2.67 ± 11%  perf-profile.calltrace.cycles-pp.mem_cgroup_sk_charge.__sk_mem_raise_allocated.__sk_mem_schedule.tcp_try_rmem_schedule.tcp_data_queue
      1.98 ±  2%      +1.4        3.38 ±  3%  perf-profile.calltrace.cycles-pp.tcp_try_rmem_schedule.tcp_data_queue.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv
      2.54 ± 10%      +1.4        3.94 ±  7%  perf-profile.calltrace.cycles-pp.__sk_mem_raise_allocated.__sk_mem_schedule.tcp_try_rmem_schedule.tcp_data_queue.tcp_rcv_established
      2.55 ± 10%      +1.4        3.96 ±  7%  perf-profile.calltrace.cycles-pp.__sk_mem_schedule.tcp_try_rmem_schedule.tcp_data_queue.tcp_rcv_established.tcp_v4_do_rcv
      7.12 ±  3%      +2.1        9.18 ±  3%  perf-profile.calltrace.cycles-pp.ip_output.__ip_queue_xmit.__tcp_transmit_skb.tcp_write_xmit.tcp_sendmsg_locked
      7.37 ±  3%      +2.1        9.47 ±  3%  perf-profile.calltrace.cycles-pp.__ip_queue_xmit.__tcp_transmit_skb.tcp_write_xmit.tcp_sendmsg_locked.tcp_sendmsg
      8.21 ±  3%      +2.2       10.42 ±  3%  perf-profile.calltrace.cycles-pp.__tcp_transmit_skb.tcp_write_xmit.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg
      9.36 ±  3%      +2.5       11.82 ±  3%  perf-profile.calltrace.cycles-pp.tcp_write_xmit.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg.splice_to_socket
     39.14            +2.5       41.64        perf-profile.calltrace.cycles-pp.tcp_sendmsg.sock_sendmsg.splice_to_socket.direct_splice_actor.splice_direct_to_actor
     39.98            +2.5       42.50        perf-profile.calltrace.cycles-pp.sock_sendmsg.splice_to_socket.direct_splice_actor.splice_direct_to_actor.do_splice_direct
      8.64            +2.7       11.31        perf-profile.calltrace.cycles-pp.__sk_mem_raise_allocated.__sk_mem_schedule.tcp_wmem_schedule.tcp_sendmsg_locked.tcp_sendmsg
      8.74            +2.7       11.42        perf-profile.calltrace.cycles-pp.__sk_mem_schedule.tcp_wmem_schedule.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg
      8.88            +2.7       11.58        perf-profile.calltrace.cycles-pp.tcp_wmem_schedule.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg.splice_to_socket
     43.74            +2.9       46.63        perf-profile.calltrace.cycles-pp.splice_to_socket.direct_splice_actor.splice_direct_to_actor.do_splice_direct.do_sendfile
     44.23            +2.9       47.12        perf-profile.calltrace.cycles-pp.direct_splice_actor.splice_direct_to_actor.do_splice_direct.do_sendfile.__x64_sys_sendfile64
     60.46            +3.1       63.59        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.sendfile64.sendfile_tcp_stream.main
     60.67            +3.1       63.81        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.sendfile64.sendfile_tcp_stream.main
     63.34            +3.2       66.56        perf-profile.calltrace.cycles-pp.sendfile64.sendfile_tcp_stream.main
     65.55            +3.2       68.78        perf-profile.calltrace.cycles-pp.sendfile_tcp_stream.main
     34.07            +3.5       37.60        perf-profile.calltrace.cycles-pp.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg.splice_to_socket.direct_splice_actor
     53.65            +3.6       57.27        perf-profile.calltrace.cycles-pp.splice_direct_to_actor.do_splice_direct.do_sendfile.__x64_sys_sendfile64.do_syscall_64
     53.90            +3.6       57.54        perf-profile.calltrace.cycles-pp.do_splice_direct.do_sendfile.__x64_sys_sendfile64.do_syscall_64.entry_SYSCALL_64_after_hwframe
     56.36            +3.7       60.06        perf-profile.calltrace.cycles-pp.do_sendfile.__x64_sys_sendfile64.do_syscall_64.entry_SYSCALL_64_after_hwframe.sendfile64
     57.94            +3.8       61.73        perf-profile.calltrace.cycles-pp.__x64_sys_sendfile64.do_syscall_64.entry_SYSCALL_64_after_hwframe.sendfile64.sendfile_tcp_stream
      9.76            -2.9        6.91        perf-profile.children.cycles-pp.__tcp_push_pending_frames
     31.84            -2.7       29.18        perf-profile.children.cycles-pp.accept_connection
     31.84            -2.7       29.18        perf-profile.children.cycles-pp.accept_connections
     31.84            -2.7       29.18        perf-profile.children.cycles-pp.process_requests
     31.84            -2.7       29.18        perf-profile.children.cycles-pp.spawn_child
     30.62            -2.3       28.30        perf-profile.children.cycles-pp.__x64_sys_recvfrom
     30.56            -2.3       28.26        perf-profile.children.cycles-pp.__sys_recvfrom
     30.17            -2.2       27.97 ±  2%  perf-profile.children.cycles-pp.sock_recvmsg
     30.07            -2.2       27.90 ±  2%  perf-profile.children.cycles-pp.inet_recvmsg
     28.76            -2.1       26.61        perf-profile.children.cycles-pp.tcp_recvmsg_locked
     29.98            -2.1       27.84 ±  2%  perf-profile.children.cycles-pp.tcp_recvmsg
      4.76 ±  2%      -2.0        2.76 ±  6%  perf-profile.children.cycles-pp.__schedule
      4.38 ±  3%      -1.8        2.54 ±  6%  perf-profile.children.cycles-pp.schedule
     22.03            -1.7       20.30        perf-profile.children.cycles-pp.__tcp_transmit_skb
      3.55 ±  3%      -1.5        2.08 ±  6%  perf-profile.children.cycles-pp.sk_wait_data
     20.17            -1.5       18.70        perf-profile.children.cycles-pp.__ip_queue_xmit
     19.47            -1.3       18.14        perf-profile.children.cycles-pp.ip_output
     19.12            -1.3       17.84        perf-profile.children.cycles-pp.ip_finish_output2
      3.18 ±  3%      -1.3        1.91 ±  5%  perf-profile.children.cycles-pp.wait_woken
      3.05 ±  3%      -1.2        1.82 ±  6%  perf-profile.children.cycles-pp.schedule_timeout
     18.66            -1.2       17.47        perf-profile.children.cycles-pp.__dev_queue_xmit
      4.18 ±  2%      -1.1        3.08 ±  4%  perf-profile.children.cycles-pp.__release_sock
      4.98            -1.0        3.94 ±  3%  perf-profile.children.cycles-pp.release_sock
      2.21 ±  2%      -1.0        1.24 ±  6%  perf-profile.children.cycles-pp.exit_to_user_mode_loop
      2.30 ±  3%      -0.9        1.43 ±  5%  perf-profile.children.cycles-pp.try_to_wake_up
      2.42 ±  3%      -0.9        1.55 ±  5%  perf-profile.children.cycles-pp.__wake_up_common
      2.61 ±  3%      -0.9        1.75 ±  4%  perf-profile.children.cycles-pp.sock_def_readable
      2.49 ±  3%      -0.9        1.63 ±  5%  perf-profile.children.cycles-pp.__wake_up_sync_key
     16.26            -0.8       15.46        perf-profile.children.cycles-pp.__local_bh_enable_ip
     15.84            -0.8       15.07        perf-profile.children.cycles-pp.do_softirq
     15.71            -0.7       14.96        perf-profile.children.cycles-pp.handle_softirqs
     14.92            -0.6       14.27        perf-profile.children.cycles-pp.net_rx_action
      1.34 ±  2%      -0.6        0.72 ±  6%  perf-profile.children.cycles-pp.__pick_next_task
      1.44 ±  3%      -0.6        0.84 ±  6%  perf-profile.children.cycles-pp.ttwu_do_activate
      1.31 ±  2%      -0.6        0.71 ±  5%  perf-profile.children.cycles-pp.pick_next_task_fair
     13.35            -0.5       12.80        perf-profile.children.cycles-pp.tcp_v4_do_rcv
     13.02            -0.5       12.49        perf-profile.children.cycles-pp.tcp_rcv_established
      1.71            -0.5        1.25 ±  2%  perf-profile.children.cycles-pp.__alloc_skb
      1.14 ±  3%      -0.5        0.68 ±  6%  perf-profile.children.cycles-pp.enqueue_task
      1.15 ±  4%      -0.5        0.70 ±  6%  perf-profile.children.cycles-pp.try_to_block_task
     13.78            -0.5       13.33        perf-profile.children.cycles-pp.__napi_poll
     13.70            -0.4       13.27        perf-profile.children.cycles-pp.process_backlog
      1.08 ±  4%      -0.4        0.65 ±  6%  perf-profile.children.cycles-pp.enqueue_task_fair
      1.08 ±  4%      -0.4        0.66 ±  6%  perf-profile.children.cycles-pp.dequeue_task_fair
      1.04 ±  4%      -0.4        0.64 ±  6%  perf-profile.children.cycles-pp.dequeue_entities
      1.29            -0.4        0.90 ±  3%  perf-profile.children.cycles-pp.kmem_cache_alloc_node_noprof
     13.28            -0.4       12.92        perf-profile.children.cycles-pp.__netif_receive_skb_one_core
      0.84 ±  3%      -0.4        0.48 ±  6%  perf-profile.children.cycles-pp.update_curr
      0.81 ±  3%      -0.3        0.46 ±  6%  perf-profile.children.cycles-pp.switch_mm_irqs_off
      2.07            -0.3        1.75 ±  2%  perf-profile.children.cycles-pp.tcp_stream_alloc_skb
      0.72 ±  2%      -0.3        0.42 ±  6%  perf-profile.children.cycles-pp.update_load_avg
      0.65 ±  2%      -0.3        0.36 ±  6%  perf-profile.children.cycles-pp.enqueue_entity
      0.60 ±  3%      -0.3        0.34 ±  7%  perf-profile.children.cycles-pp.dequeue_entity
      0.42 ±  3%      -0.2        0.18 ±  6%  perf-profile.children.cycles-pp.pick_task_fair
      0.99            -0.2        0.77 ±  3%  perf-profile.children.cycles-pp.__cond_resched
      0.52 ±  4%      -0.2        0.30 ±  7%  perf-profile.children.cycles-pp.update_se
      0.47 ±  2%      -0.2        0.27 ±  7%  perf-profile.children.cycles-pp.__rseq_handle_notify_resume
      2.66            -0.2        2.47        perf-profile.children.cycles-pp.its_return_thunk
      0.45 ±  2%      -0.2        0.26 ±  5%  perf-profile.children.cycles-pp.set_next_entity
      0.89            -0.2        0.72        perf-profile.children.cycles-pp.arch_exit_to_user_mode_prepare
      0.66 ±  2%      -0.2        0.49 ±  2%  perf-profile.children.cycles-pp.__kfree_skb
      0.26 ±  4%      -0.2        0.08 ±  8%  perf-profile.children.cycles-pp.__pick_eevdf
      0.42 ±  3%      -0.2        0.25 ±  5%  perf-profile.children.cycles-pp.switch_fpu_return
      0.82            -0.2        0.67        perf-profile.children.cycles-pp.kmem_cache_free
      0.84 ±  2%      -0.1        0.70 ±  4%  perf-profile.children.cycles-pp.skb_defer_free_flush
      0.68 ±  7%      -0.1        0.54 ±  3%  perf-profile.children.cycles-pp.ip_rcv
      1.13            -0.1        0.99        perf-profile.children.cycles-pp.dev_hard_start_xmit
      0.32 ±  3%      -0.1        0.18 ±  4%  perf-profile.children.cycles-pp.restore_fpregs_from_fpstate
      0.38 ±  2%      -0.1        0.24 ±  6%  perf-profile.children.cycles-pp.prepare_task_switch
      0.30 ±  3%      -0.1        0.18 ±  7%  perf-profile.children.cycles-pp.rseq_ip_fixup
      0.32 ±  3%      -0.1        0.20 ±  5%  perf-profile.children.cycles-pp.put_prev_entity
      0.29 ±  3%      -0.1        0.16 ±  6%  perf-profile.children.cycles-pp.wakeup_preempt
      1.03            -0.1        0.91        perf-profile.children.cycles-pp.loopback_xmit
      0.28 ±  2%      -0.1        0.17 ±  7%  perf-profile.children.cycles-pp.__switch_to
      0.30            -0.1        0.19 ±  3%  perf-profile.children.cycles-pp.__tcp_send_ack
      0.22 ±  4%      -0.1        0.11 ±  5%  perf-profile.children.cycles-pp.__dequeue_entity
      0.24 ±  2%      -0.1        0.14 ±  5%  perf-profile.children.cycles-pp.__update_load_avg_se
      0.28 ±  5%      -0.1        0.18 ±  7%  perf-profile.children.cycles-pp.avg_vruntime
      0.19 ±  3%      -0.1        0.11 ±  8%  perf-profile.children.cycles-pp.os_xsave
      0.53            -0.1        0.44        perf-profile.children.cycles-pp.tcp_mstamp_refresh
      0.54            -0.1        0.46        perf-profile.children.cycles-pp.__inet_lookup_skb
      0.24 ± 13%      -0.1        0.16 ± 11%  perf-profile.children.cycles-pp.select_task_rq
      0.19 ±  3%      -0.1        0.11 ±  5%  perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
      0.13 ±  5%      -0.1        0.06 ±  8%  perf-profile.children.cycles-pp.vruntime_eligible
      0.41 ±  2%      -0.1        0.33 ±  4%  perf-profile.children.cycles-pp._find_next_bit
      0.19 ±  3%      -0.1        0.12 ±  5%  perf-profile.children.cycles-pp.check_preempt_wakeup_fair
      0.18 ±  3%      -0.1        0.11 ±  7%  perf-profile.children.cycles-pp.___perf_sw_event
      0.17 ±  8%      -0.1        0.10 ± 11%  perf-profile.children.cycles-pp.do_perf_trace_sched_stat_runtime
      0.21 ±  3%      -0.1        0.14 ±  7%  perf-profile.children.cycles-pp.__enqueue_entity
      0.16 ±  2%      -0.1        0.10 ±  5%  perf-profile.children.cycles-pp.rseq_get_rseq_cs
      0.44            -0.1        0.37        perf-profile.children.cycles-pp.__inet_lookup_established
      0.36            -0.1        0.29        perf-profile.children.cycles-pp.kmalloc_reserve
      0.22 ±  6%      -0.1        0.15 ±  7%  perf-profile.children.cycles-pp.recv_tcp_stream
      0.43            -0.1        0.36 ±  4%  perf-profile.children.cycles-pp.sched_clock_cpu
      0.25 ±  4%      -0.1        0.19 ±  2%  perf-profile.children.cycles-pp._raw_spin_lock
      0.20 ± 16%      -0.1        0.13 ± 15%  perf-profile.children.cycles-pp.select_task_rq_fair
      0.51 ±  2%      -0.1        0.45 ±  2%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.16 ±  7%      -0.1        0.09 ±  7%  perf-profile.children.cycles-pp.raw_spin_rq_lock_nested
      0.16 ±  5%      -0.1        0.10 ±  6%  perf-profile.children.cycles-pp.do_perf_trace_sched_wakeup_template
      1.29            -0.1        1.23        perf-profile.children.cycles-pp.ktime_get
      0.16 ±  2%      -0.1        0.10 ±  5%  perf-profile.children.cycles-pp.update_rq_clock
      0.14 ±  3%      -0.1        0.08 ±  8%  perf-profile.children.cycles-pp.rseq_update_cpu_node_id
      0.14 ±  2%      -0.1        0.08 ±  8%  perf-profile.children.cycles-pp.update_rq_clock_task
      0.33 ±  2%      -0.1        0.28 ±  4%  perf-profile.children.cycles-pp.native_sched_clock
      0.39            -0.1        0.33 ±  4%  perf-profile.children.cycles-pp.sched_clock
      0.14 ±  3%      -0.1        0.08 ±  8%  perf-profile.children.cycles-pp.__get_user_8
      0.46            -0.1        0.41        perf-profile.children.cycles-pp.skb_clone
      0.35            -0.1        0.30 ±  2%  perf-profile.children.cycles-pp.tcp_rcv_space_adjust
      0.31            -0.1        0.26        perf-profile.children.cycles-pp.validate_xmit_skb
      0.34            -0.1        0.29        perf-profile.children.cycles-pp.__netif_receive_skb_core
      0.10 ±  4%      -0.0        0.06 ±  8%  perf-profile.children.cycles-pp.__wrgsbase_inactive
      0.18 ±  8%      -0.0        0.13 ±  5%  perf-profile.children.cycles-pp.place_entity
      0.39            -0.0        0.34        perf-profile.children.cycles-pp.__netif_rx
      0.13 ±  6%      -0.0        0.08 ±  7%  perf-profile.children.cycles-pp.update_cfs_group
      0.12 ±  4%      -0.0        0.07        perf-profile.children.cycles-pp.tcp_ack_update_rtt
      0.26 ±  3%      -0.0        0.22 ±  3%  perf-profile.children.cycles-pp.mem_cgroup_sk_uncharge
      0.36            -0.0        0.32 ±  2%  perf-profile.children.cycles-pp.netif_rx_internal
      0.22            -0.0        0.18        perf-profile.children.cycles-pp.__ip_local_out
      0.10 ± 17%      -0.0        0.06 ± 17%  perf-profile.children.cycles-pp.recv
      0.15 ±  9%      -0.0        0.11 ±  5%  perf-profile.children.cycles-pp.skb_release_head_state
      0.33            -0.0        0.29        perf-profile.children.cycles-pp.enqueue_to_backlog
      0.10 ±  5%      -0.0        0.06 ±  7%  perf-profile.children.cycles-pp.finish_task_switch
      0.15 ±  8%      -0.0        0.11 ±  5%  perf-profile.children.cycles-pp.update_entity_lag
      0.61            -0.0        0.58        perf-profile.children.cycles-pp.__put_user_8
      0.07 ±  4%      -0.0        0.04 ± 57%  perf-profile.children.cycles-pp.perf_tp_event
      0.45            -0.0        0.42 ±  3%  perf-profile.children.cycles-pp.irqtime_account_irq
      0.13            -0.0        0.10 ±  4%  perf-profile.children.cycles-pp._find_first_bit
      0.24            -0.0        0.21 ±  2%  perf-profile.children.cycles-pp.rcu_all_qs
      0.19 ±  2%      -0.0        0.16 ±  2%  perf-profile.children.cycles-pp.ip_rcv_core
      0.09 ±  5%      -0.0        0.06 ±  9%  perf-profile.children.cycles-pp.rb_next
      0.07 ±  6%      -0.0        0.04 ± 57%  perf-profile.children.cycles-pp.add_wait_queue
      0.77            -0.0        0.75        perf-profile.children.cycles-pp.read_tsc
      0.14            -0.0        0.12 ±  4%  perf-profile.children.cycles-pp.__ip_finish_output
      0.10 ±  7%      -0.0        0.08 ± 14%  perf-profile.children.cycles-pp.tcp_add_backlog
      0.12 ±  5%      -0.0        0.10 ±  5%  perf-profile.children.cycles-pp.__sk_dst_check
      0.15 ±  2%      -0.0        0.12 ±  4%  perf-profile.children.cycles-pp.netif_skb_features
      0.10 ±  9%      -0.0        0.07 ±  9%  perf-profile.children.cycles-pp.__calc_delta
      0.12 ±  4%      -0.0        0.09 ±  5%  perf-profile.children.cycles-pp.sk_filter_trim_cap
      0.17            -0.0        0.15 ±  2%  perf-profile.children.cycles-pp.tcp_skb_entail
      0.13 ±  3%      -0.0        0.10 ±  4%  perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      0.09 ±  5%      -0.0        0.07 ±  5%  perf-profile.children.cycles-pp.ipv4_dst_check
      0.08            -0.0        0.06 ±  6%  perf-profile.children.cycles-pp.tcp_options_write
      0.11 ±  4%      -0.0        0.09 ±  5%  perf-profile.children.cycles-pp.tcp_v4_fill_cb
      0.12 ±  4%      -0.0        0.10 ±  3%  perf-profile.children.cycles-pp.ip_send_check
      0.11 ±  4%      -0.0        0.09 ±  5%  perf-profile.children.cycles-pp.inet_ehashfn
      0.07 ±  7%      -0.0        0.05        perf-profile.children.cycles-pp.tcp_rate_skb_delivered
      0.08 ±  6%      -0.0        0.06        perf-profile.children.cycles-pp.ip_skb_dst_mtu
      0.10 ±  5%      -0.0        0.08        perf-profile.children.cycles-pp.sock_from_file
      0.08 ±  6%      -0.0        0.06 ±  6%  perf-profile.children.cycles-pp.ip_finish_output
      0.12            -0.0        0.11 ±  4%  perf-profile.children.cycles-pp.tcp_event_data_recv
      0.07            -0.0        0.06 ±  5%  perf-profile.children.cycles-pp.__build_skb_around
      0.10 ±  3%      -0.0        0.09        perf-profile.children.cycles-pp.tcp_inbound_hash
      0.06            -0.0        0.05        perf-profile.children.cycles-pp.bpf_skops_write_hdr_opt
      0.20            +0.0        0.21        perf-profile.children.cycles-pp.security_file_permission
      0.36            +0.0        0.38        perf-profile.children.cycles-pp.xas_load
      0.08 ±  6%      +0.0        0.10 ±  5%  perf-profile.children.cycles-pp.rb_insert_color
      0.20 ±  2%      +0.0        0.22 ±  3%  perf-profile.children.cycles-pp.tcp_queue_rcv
      0.65            +0.0        0.67        perf-profile.children.cycles-pp._copy_from_user
      0.58            +0.0        0.60        perf-profile.children.cycles-pp.__mod_timer
      0.41            +0.0        0.43        perf-profile.children.cycles-pp.iov_iter_advance
      0.32            +0.0        0.34        perf-profile.children.cycles-pp.tcp_tso_segs
      0.18 ±  2%      +0.0        0.20        perf-profile.children.cycles-pp.lock_timer_base
      0.32 ±  2%      +0.0        0.34 ±  3%  perf-profile.children.cycles-pp.page_cache_pipe_buf_confirm
      0.11            +0.0        0.13 ±  3%  perf-profile.children.cycles-pp.sk_stream_wait_memory
      0.79            +0.0        0.82        perf-profile.children.cycles-pp.current_time
      0.48            +0.0        0.51        perf-profile.children.cycles-pp.rw_verify_area
      0.15 ±  3%      +0.0        0.18 ±  4%  perf-profile.children.cycles-pp.tcp_rbtree_insert
      0.76 ±  2%      +0.0        0.81 ±  2%  perf-profile.children.cycles-pp.tcp_event_new_data_sent
      0.00            +0.1        0.05 ±  6%  perf-profile.children.cycles-pp.task_tick_fair
      1.35            +0.1        1.40        perf-profile.children.cycles-pp.skb_release_data
      1.66            +0.1        1.72        perf-profile.children.cycles-pp.atime_needs_update
      1.42            +0.1        1.48        perf-profile.children.cycles-pp.iov_iter_extract_pages
      1.84            +0.1        1.90        perf-profile.children.cycles-pp.touch_atime
      0.88 ±  2%      +0.1        0.94        perf-profile.children.cycles-pp.tcp_current_mss
      1.05            +0.1        1.14        perf-profile.children.cycles-pp.tcp_send_mss
      0.97            +0.1        1.06        perf-profile.children.cycles-pp.folios_put_refs
      1.03            +0.1        1.13        perf-profile.children.cycles-pp._raw_spin_lock_bh
      2.44 ±  2%      +0.2        2.60 ±  2%  perf-profile.children.cycles-pp.tcp_clean_rtx_queue
      0.86            +0.2        1.04 ±  3%  perf-profile.children.cycles-pp.skb_attempt_defer_free
      1.91            +0.2        2.11        perf-profile.children.cycles-pp.skb_append_pagefrags
      1.69            +0.2        1.92        perf-profile.children.cycles-pp.splice_folio_into_pipe
      2.21            +0.2        2.46        perf-profile.children.cycles-pp.filemap_get_read_batch
      2.58            +0.3        2.84        perf-profile.children.cycles-pp.filemap_get_pages
     93.22            +0.3       93.48        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     10.90            +0.3       11.18        perf-profile.children.cycles-pp._copy_to_iter
      0.99            +0.3        1.29 ±  2%  perf-profile.children.cycles-pp.page_cache_pipe_buf_release
     92.82            +0.3       93.14        perf-profile.children.cycles-pp.do_syscall_64
      4.32            +0.3        4.63        perf-profile.children.cycles-pp.skb_splice_from_iter
      6.65            +0.4        7.02        perf-profile.children.cycles-pp.tcp_data_queue
      7.77            +0.7        8.46        perf-profile.children.cycles-pp.filemap_splice_read
      1.56 ±  8%      +1.1        2.64 ±  5%  perf-profile.children.cycles-pp.refill_stock
      1.39 ±  8%      +1.1        2.46 ±  6%  perf-profile.children.cycles-pp.page_counter_uncharge
      1.40 ±  8%      +1.1        2.48 ±  6%  perf-profile.children.cycles-pp.drain_stock
      2.10 ±  5%      +1.1        3.19 ±  4%  perf-profile.children.cycles-pp.__sk_mem_reduce_allocated
      1.62 ±  8%      +1.2        2.82 ±  6%  perf-profile.children.cycles-pp.page_counter_try_charge
      3.30 ±  3%      +1.3        4.58 ±  2%  perf-profile.children.cycles-pp.tcp_try_rmem_schedule
      4.31 ±  6%      +2.3        6.66 ±  4%  perf-profile.children.cycles-pp.mem_cgroup_sk_charge
      3.49 ±  8%      +2.4        5.86 ±  4%  perf-profile.children.cycles-pp.try_charge_memcg
     39.43            +2.5       41.94        perf-profile.children.cycles-pp.tcp_sendmsg
     40.24            +2.5       42.75        perf-profile.children.cycles-pp.sock_sendmsg
      8.95            +2.7       11.65        perf-profile.children.cycles-pp.tcp_wmem_schedule
     65.23            +2.8       68.06        perf-profile.children.cycles-pp.sendfile64
     44.14            +2.9       47.04        perf-profile.children.cycles-pp.splice_to_socket
     44.46            +2.9       47.37        perf-profile.children.cycles-pp.direct_splice_actor
     65.83            +3.2       69.01        perf-profile.children.cycles-pp.sendfile_tcp_stream
     34.46            +3.5       37.98        perf-profile.children.cycles-pp.tcp_sendmsg_locked
     53.93            +3.6       57.58        perf-profile.children.cycles-pp.splice_direct_to_actor
     54.15            +3.7       57.82        perf-profile.children.cycles-pp.do_splice_direct
     56.72            +3.7       60.45        perf-profile.children.cycles-pp.do_sendfile
     58.25            +3.8       62.00        perf-profile.children.cycles-pp.__x64_sys_sendfile64
     12.38            +4.0       16.38        perf-profile.children.cycles-pp.__sk_mem_raise_allocated
     12.51            +4.0       16.51        perf-profile.children.cycles-pp.__sk_mem_schedule
      0.76 ±  3%      -0.3        0.43 ±  6%  perf-profile.self.cycles-pp.switch_mm_irqs_off
      0.54 ±  3%      -0.2        0.31 ±  6%  perf-profile.self.cycles-pp.__schedule
      0.73 ±  3%      -0.2        0.55        perf-profile.self.cycles-pp.kmem_cache_alloc_node_noprof
      1.08            -0.2        0.91        perf-profile.self.cycles-pp.__tcp_transmit_skb
      0.60 ±  2%      -0.2        0.45 ±  2%  perf-profile.self.cycles-pp.kmem_cache_free
      0.32 ±  3%      -0.1        0.18 ±  4%  perf-profile.self.cycles-pp.restore_fpregs_from_fpstate
      0.18 ±  4%      -0.1        0.06 ±  8%  perf-profile.self.cycles-pp.__pick_eevdf
      0.47            -0.1        0.35 ±  2%  perf-profile.self.cycles-pp.tcp_recvmsg_locked
      0.27 ±  2%      -0.1        0.15 ±  7%  perf-profile.self.cycles-pp.update_load_avg
      1.41            -0.1        1.30        perf-profile.self.cycles-pp.its_return_thunk
      0.50            -0.1        0.39 ±  2%  perf-profile.self.cycles-pp.tcp_ack
      0.22 ±  4%      -0.1        0.12 ±  6%  perf-profile.self.cycles-pp.update_curr
      0.25 ±  2%      -0.1        0.15 ±  6%  perf-profile.self.cycles-pp.__switch_to
      0.22 ±  2%      -0.1        0.13 ±  6%  perf-profile.self.cycles-pp.__update_load_avg_se
      0.26 ±  5%      -0.1        0.16 ±  8%  perf-profile.self.cycles-pp.avg_vruntime
      0.19 ±  4%      -0.1        0.11 ±  8%  perf-profile.self.cycles-pp.os_xsave
      0.43 ±  4%      -0.1        0.35 ±  4%  perf-profile.self.cycles-pp.ip_finish_output2
      0.32            -0.1        0.24        perf-profile.self.cycles-pp.tcp_clean_rtx_queue
      0.19 ±  5%      -0.1        0.11 ±  7%  perf-profile.self.cycles-pp.update_se
      0.18 ±  3%      -0.1        0.11 ±  6%  perf-profile.self.cycles-pp.exit_to_user_mode_loop
      1.25            -0.1        1.17        perf-profile.self.cycles-pp.__skb_datagram_iter
      0.18 ±  2%      -0.1        0.10 ±  4%  perf-profile.self.cycles-pp.__update_load_avg_cfs_rq
      0.39 ±  2%      -0.1        0.32 ±  4%  perf-profile.self.cycles-pp._find_next_bit
      0.24 ±  5%      -0.1        0.17 ±  2%  perf-profile.self.cycles-pp._raw_spin_lock
      0.38            -0.1        0.32        perf-profile.self.cycles-pp.__ip_queue_xmit
      0.12 ±  2%      -0.1        0.05 ±  9%  perf-profile.self.cycles-pp.vruntime_eligible
      0.20 ±  8%      -0.1        0.14 ±  8%  perf-profile.self.cycles-pp.recv_tcp_stream
      0.30            -0.1        0.24 ±  2%  perf-profile.self.cycles-pp.net_rx_action
      0.20 ±  2%      -0.1        0.13 ±  5%  perf-profile.self.cycles-pp.prepare_task_switch
      0.13 ±  5%      -0.1        0.07 ±  7%  perf-profile.self.cycles-pp.__dequeue_entity
      0.21            -0.1        0.15 ±  4%  perf-profile.self.cycles-pp.__sys_recvfrom
      0.31 ±  2%      -0.1        0.25 ±  3%  perf-profile.self.cycles-pp.handle_softirqs
      0.09 ±  5%      -0.1        0.03 ± 77%  perf-profile.self.cycles-pp.enqueue_entity
      0.14 ±  3%      -0.1        0.08 ±  8%  perf-profile.self.cycles-pp.rseq_update_cpu_node_id
      0.38            -0.1        0.33        perf-profile.self.cycles-pp.skb_clone
      0.29            -0.1        0.23 ±  2%  perf-profile.self.cycles-pp.__alloc_skb
      0.12 ±  4%      -0.1        0.07 ±  7%  perf-profile.self.cycles-pp.sk_wait_data
      0.32 ±  2%      -0.1        0.27 ±  4%  perf-profile.self.cycles-pp.native_sched_clock
      0.13 ±  4%      -0.1        0.08 ±  6%  perf-profile.self.cycles-pp.__get_user_8
      0.14 ±  5%      -0.1        0.08 ±  8%  perf-profile.self.cycles-pp.___perf_sw_event
      0.09 ±  3%      -0.1        0.04 ± 57%  perf-profile.self.cycles-pp.dequeue_entity
      0.28            -0.1        0.22 ±  2%  perf-profile.self.cycles-pp.loopback_xmit
      0.33 ±  2%      -0.0        0.28        perf-profile.self.cycles-pp.__inet_lookup_established
      0.31            -0.0        0.26 ±  2%  perf-profile.self.cycles-pp.tcp_v4_rcv
      0.22 ±  2%      -0.0        0.18 ±  2%  perf-profile.self.cycles-pp.process_backlog
      0.07 ±  6%      -0.0        0.02 ±100%  perf-profile.self.cycles-pp.select_task_rq_fair
      0.11 ±  4%      -0.0        0.06 ±  7%  perf-profile.self.cycles-pp.enqueue_task_fair
      0.08 ± 21%      -0.0        0.04 ± 78%  perf-profile.self.cycles-pp.recv
      0.33            -0.0        0.28        perf-profile.self.cycles-pp.__netif_receive_skb_core
      0.10 ±  3%      -0.0        0.05 ±  6%  perf-profile.self.cycles-pp.schedule_timeout
      0.09 ±  7%      -0.0        0.04 ± 58%  perf-profile.self.cycles-pp.do_perf_trace_sched_stat_runtime
      0.26            -0.0        0.21 ±  2%  perf-profile.self.cycles-pp.tcp_rcv_established
      0.10 ±  5%      -0.0        0.06 ±  8%  perf-profile.self.cycles-pp.__wrgsbase_inactive
      0.12 ±  4%      -0.0        0.07 ±  8%  perf-profile.self.cycles-pp.pick_next_task_fair
      0.39            -0.0        0.35 ±  2%  perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.08            -0.0        0.04 ± 57%  perf-profile.self.cycles-pp.update_rq_clock_task
      0.24 ±  2%      -0.0        0.19 ±  4%  perf-profile.self.cycles-pp.skb_defer_free_flush
      0.13 ±  5%      -0.0        0.09 ±  7%  perf-profile.self.cycles-pp.__enqueue_entity
      0.10 ±  5%      -0.0        0.06 ±  5%  perf-profile.self.cycles-pp.pick_task_fair
      0.11 ±  3%      -0.0        0.07 ±  6%  perf-profile.self.cycles-pp.dequeue_entities
      0.12 ±  5%      -0.0        0.08 ±  9%  perf-profile.self.cycles-pp.update_cfs_group
      0.11 ±  4%      -0.0        0.08 ±  6%  perf-profile.self.cycles-pp.wait_woken
      0.09 ±  5%      -0.0        0.06 ± 10%  perf-profile.self.cycles-pp.switch_fpu_return
      0.59            -0.0        0.56        perf-profile.self.cycles-pp.__put_user_8
      0.11 ±  3%      -0.0        0.08 ±  5%  perf-profile.self.cycles-pp.__netif_receive_skb_one_core
      0.17 ±  2%      -0.0        0.14 ±  4%  perf-profile.self.cycles-pp.ip_output
      0.19            -0.0        0.16 ±  3%  perf-profile.self.cycles-pp.ip_rcv_core
      0.20            -0.0        0.17        perf-profile.self.cycles-pp.rcu_all_qs
      0.10            -0.0        0.07        perf-profile.self.cycles-pp.tcp_recvmsg
      0.10 ±  4%      -0.0        0.07 ±  6%  perf-profile.self.cycles-pp.try_to_wake_up
      0.60            -0.0        0.57        perf-profile.self.cycles-pp.do_syscall_64
      0.38            -0.0        0.35        perf-profile.self.cycles-pp.__local_bh_enable_ip
      0.77            -0.0        0.74        perf-profile.self.cycles-pp.read_tsc
      0.08 ±  4%      -0.0        0.05 ±  8%  perf-profile.self.cycles-pp.inet_recvmsg
      0.08 ±  4%      -0.0        0.05        perf-profile.self.cycles-pp.rb_next
      0.07 ±  8%      -0.0        0.04 ± 38%  perf-profile.self.cycles-pp.place_entity
      0.15 ±  2%      -0.0        0.13 ±  3%  perf-profile.self.cycles-pp.do_softirq
      0.21            -0.0        0.18 ±  2%  perf-profile.self.cycles-pp.release_sock
      0.11            -0.0        0.08 ±  5%  perf-profile.self.cycles-pp._find_first_bit
      0.10 ±  5%      -0.0        0.07        perf-profile.self.cycles-pp.ip_local_deliver
      0.08 ±  5%      -0.0        0.06 ±  5%  perf-profile.self.cycles-pp.sock_recvmsg
      0.13 ±  2%      -0.0        0.11 ±  3%  perf-profile.self.cycles-pp.enqueue_to_backlog
      0.08            -0.0        0.06 ± 10%  perf-profile.self.cycles-pp.set_next_entity
      0.11 ±  4%      -0.0        0.09 ±  5%  perf-profile.self.cycles-pp._raw_spin_unlock_irqrestore
      0.10            -0.0        0.08 ±  6%  perf-profile.self.cycles-pp.ip_protocol_deliver_rcu
      0.11            -0.0        0.09        perf-profile.self.cycles-pp.ip_send_check
      0.10            -0.0        0.08 ±  4%  perf-profile.self.cycles-pp.__ip_local_out
      0.07 ±  8%      -0.0        0.05        perf-profile.self.cycles-pp.__sk_dst_check
      0.13 ±  3%      -0.0        0.11 ±  4%  perf-profile.self.cycles-pp.tcp_schedule_loss_probe
      0.08 ±  5%      -0.0        0.07 ±  7%  perf-profile.self.cycles-pp.ipv4_dst_check
      0.14            -0.0        0.12 ±  5%  perf-profile.self.cycles-pp.irqtime_account_irq
      0.07 ±  6%      -0.0        0.05        perf-profile.self.cycles-pp.__napi_poll
      0.07            -0.0        0.05 ±  8%  perf-profile.self.cycles-pp.mem_cgroup_sk_uncharge
      0.08 ±  5%      -0.0        0.06        perf-profile.self.cycles-pp.sock_from_file
      0.10 ±  3%      -0.0        0.08 ±  5%  perf-profile.self.cycles-pp.validate_xmit_skb
      0.10 ±  5%      -0.0        0.08        perf-profile.self.cycles-pp.dev_hard_start_xmit
      0.10 ±  4%      -0.0        0.08 ±  4%  perf-profile.self.cycles-pp.inet_ehashfn
      0.08 ±  5%      -0.0        0.06 ±  5%  perf-profile.self.cycles-pp.ip_rcv
      0.09 ±  5%      -0.0        0.07        perf-profile.self.cycles-pp.netif_skb_features
      0.10            -0.0        0.08 ±  5%  perf-profile.self.cycles-pp.__inet_lookup_skb
      0.08 ±  6%      -0.0        0.06        perf-profile.self.cycles-pp.tcp_stream_alloc_skb
      0.10 ±  4%      -0.0        0.09 ±  3%  perf-profile.self.cycles-pp.tcp_v4_fill_cb
      0.07 ±  4%      -0.0        0.06 ±  5%  perf-profile.self.cycles-pp.ip_local_deliver_finish
      0.18            -0.0        0.17        perf-profile.self.cycles-pp.tcp_data_queue
      0.07            -0.0        0.06        perf-profile.self.cycles-pp.ip_skb_dst_mtu
      0.07            -0.0        0.06        perf-profile.self.cycles-pp.tcp_inbound_hash
      0.07            -0.0        0.06        perf-profile.self.cycles-pp.tcp_options_write
      0.06            -0.0        0.05        perf-profile.self.cycles-pp.raw_v4_input
      0.14            +0.0        0.15        perf-profile.self.cycles-pp.security_file_permission
      0.23            +0.0        0.24        perf-profile.self.cycles-pp.simple_copy_to_iter
      0.38            +0.0        0.39        perf-profile.self.cycles-pp.filemap_get_pages
      0.62            +0.0        0.64        perf-profile.self.cycles-pp._copy_from_user
      0.44            +0.0        0.46        perf-profile.self.cycles-pp.current_time
      0.38            +0.0        0.40        perf-profile.self.cycles-pp.iov_iter_advance
      0.29            +0.0        0.31        perf-profile.self.cycles-pp.tcp_tso_segs
      0.36            +0.0        0.38 ±  2%  perf-profile.self.cycles-pp.tcp_current_mss
      0.15 ±  5%      +0.0        0.18 ±  4%  perf-profile.self.cycles-pp.tcp_rbtree_insert
      1.00            +0.0        1.03        perf-profile.self.cycles-pp.iov_iter_extract_pages
      1.41            +0.0        1.46        perf-profile.self.cycles-pp.tcp_sendmsg_locked
      1.12            +0.1        1.18        perf-profile.self.cycles-pp.filemap_splice_read
      0.31 ±  3%      +0.1        0.37 ±  2%  perf-profile.self.cycles-pp.__sk_mem_reduce_allocated
      1.02            +0.1        1.08        perf-profile.self.cycles-pp.skb_splice_from_iter
      2.34            +0.1        2.42        perf-profile.self.cycles-pp.splice_to_socket
      0.90            +0.1        0.99        perf-profile.self.cycles-pp._raw_spin_lock_bh
      0.94            +0.1        1.04        perf-profile.self.cycles-pp.folios_put_refs
      0.99            +0.1        1.10        perf-profile.self.cycles-pp.skb_release_data
      1.82            +0.2        2.01        perf-profile.self.cycles-pp.skb_append_pagefrags
      1.85            +0.2        2.07        perf-profile.self.cycles-pp.filemap_get_read_batch
      1.61            +0.2        1.83        perf-profile.self.cycles-pp.splice_folio_into_pipe
     10.81            +0.3       11.09        perf-profile.self.cycles-pp._copy_to_iter
      0.95 ±  2%      +0.3        1.25 ±  2%  perf-profile.self.cycles-pp.page_cache_pipe_buf_release
      1.37 ±  8%      +1.1        2.44 ±  6%  perf-profile.self.cycles-pp.page_counter_uncharge
      1.82 ±  8%      +1.2        2.98 ±  3%  perf-profile.self.cycles-pp.try_charge_memcg
      1.60 ±  8%      +1.2        2.79 ±  6%  perf-profile.self.cycles-pp.page_counter_try_charge
      8.04            +1.7        9.72        perf-profile.self.cycles-pp.__sk_mem_raise_allocated




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

