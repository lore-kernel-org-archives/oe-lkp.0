Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92943A4F4D
	for <oe-lkp@lists.linux.dev>; Tue,  3 Feb 2026 14:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770128014; cv=fail; b=PJQi7lWUKBo85ttwHFPbG48GrXiN4DboYehroXl4iXBTXI5Qe0vcsXoHoc+6X8vTZtGZLxZtJPUjSDkWk+VNfV9hNOFx5LiGQsKTXvlo9yCyHGeBfbhDw5x7sLGmsXdcVXjbqpnY24OnUputP0eYHpQWdK+BX8IyRhdb6Vtk+TQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770128014; c=relaxed/simple;
	bh=3Lru2P7z8bbs7EBKecwGB+Pq0/vLq590fZwMbMCNy0w=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=TK9bouNTa+9jub6NuaWDhpRHQyrcpBKies73dxtKN55zVSFTI1miAwXQitZmmhaE31KL41u1ZVKtchxdZlTTXhRl6MWUOo2odpXmqJ5AkFUiFAJVNBLYctX0qqCZjOzV6j8ZfAWfiHkKx1uFAFvvGaTqpLUwBbHExI3BPKrQREU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OS3WY2dF; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OS3WY2dF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770128012; x=1801664012;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3Lru2P7z8bbs7EBKecwGB+Pq0/vLq590fZwMbMCNy0w=;
  b=OS3WY2dFEYKgn45l8dee0cCPu+7QzdmIbYlVoRz1/LAVtmeI100rivge
   PBy+KleZKv3ux9Xf/JCu7n7RfAJZwYqE0+xyB7uSQ4e0cLmmb75zx0vfU
   831SLZyhFdhFBc0vrF03V5pNifLkXCY1edkrWffbsDsvfzkBah3/BxTT+
   bvPnCopJWg9bgINiusNq6gz/UDmCF3J5E4XHEDcjbhWUuSOjJMVNUr48x
   iljPlPQ0eQRbJ7bk3Ntik+nkJtCBB5HaHbUmSHT21puwKCUCfATsyFAEP
   Wo59I370d3yOVLOcyDILRw66cjKxNolGeImrJ5tUYbQEemsiI2sE32um9
   g==;
X-CSE-ConnectionGUID: /40RoUDDTIGaSz+JA3aaeA==
X-CSE-MsgGUID: TbRjxxqgQnKKDNmCinXjww==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="96755107"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="96755107"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 06:13:31 -0800
X-CSE-ConnectionGUID: AmytfevGStmA8rc4rpdZvQ==
X-CSE-MsgGUID: dRQt/d/ZT7yS89n8PXyCEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="209152552"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 06:13:31 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 3 Feb 2026 06:13:30 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 3 Feb 2026 06:13:30 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.11) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 3 Feb 2026 06:13:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hxt0BGJTbgzGVXChsee1MCpZQIeZcxRnzu2496QJMxFEnMvqwDb4XNAbGn0ZXYzAI3jR1sO3afDBDI4XS2k80PRV0/kY0YNJhFfVK2okP+yIuIQNrvimconuBHoVmpSGqq9obZUW42Y576E1BoJJ1eCPC3gsMuVMdIGg6knF57uIRQbwWX9ibAHFFa93XnjfLc5fcPXrJFmrNLNrPiQ++zr7g9uaZEw4w6vjdGivoXZsZTctqK1roMaslwW68IosOwYbUiCul9sJW31K6jTtjEZ68tBzYiIFtgWqMqFpmah1RpeFyFjlNNEWM5e4xn7JRSvYBVMSQCXCehZVZGKp2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d3EtP0b4hRYVgHuCA2MBoICcgTYFopKr5m5f67XoKXc=;
 b=Y0SM+bbXf2pnscV47g6I2TyXvCEZSAH4mozIGCSYymi0hGtxJT+KclZctLGBGLVdXDuYqNghAgFecLGKvoA4hBuMUIKYaF0wDBzNEqZIoqTUGKIV3ALOwNvppMYRV2EQZB+TcxnZao93Bn514PKSVdrjEOqqR7GT9/p6BhzW4RpDcyW0Y8mEqHIiiKRTY48SLAAE10SRrh0ktwK51puT7L3xU7nRQVLwyXsLzEh1Ghicv0r85YzDc5hyL4kh2rkG8S3o99dPZqLw+LRpD6MThqIHrqwyncaN043sJjfeRnFlDrLN6o8pTb6qV4bJc2thVA+/jb1njB954/kU5VamZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MN6PR11MB8219.namprd11.prod.outlook.com (2603:10b6:208:471::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 14:13:27 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::e4de:b1d:5557:7257]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::e4de:b1d:5557:7257%5]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 14:13:26 +0000
Date: Tue, 3 Feb 2026 22:13:19 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<aubrey.li@linux.intel.com>, <yu.c.chen@intel.com>, <oliver.sang@intel.com>
Subject: [peterz-queue:sched/hrtick] [sched/fair]  fb047eb995:
 Oops:general_protection_fault,probably_for_non-canonical_address#:#[##]KASAN_PTI
Message-ID: <202602032236.bcc0d1b7-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: TY4P286CA0050.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::19) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MN6PR11MB8219:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d445f6c-c614-4be2-7fc0-08de632e662d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DMZT7ZHxutuRe57HyH8EuEeOMui/Cho+opaIL3GyjrYo5LGYLLVNnP16xiWt?=
 =?us-ascii?Q?5DvrYpKUJJZl7VmWCrH8OmfnxPWijSdtvY62BzIWg1wDFQdSfe/7wdUs/gzW?=
 =?us-ascii?Q?1jeMohDuAQtfBNJa7M4S5+tL0OVZO6x7O7yMQJCS4xnVy+pu+AnSQxAHRkA2?=
 =?us-ascii?Q?qAoSyLuabYJ+O3NHSsz71JNkr+r/FBgR528ac880x3SF2hGCxkxhFcVF41Xk?=
 =?us-ascii?Q?2kfnOnkUSNPzbVQF4p8sJWqVMUHnJoMRtsjZDf1diqYzscv+2J80vNmUWVT1?=
 =?us-ascii?Q?ca7yoIZQmjk6f3BtfOJg5MtlYPND2dCuawdoXFjEVFLKCR5WiMQNMpTdsFS3?=
 =?us-ascii?Q?zDhW4c8VvR6k5uc/ylQJo79MaKikbF8y/+kVlhyW7p4Hm60V3LWfbxrHprGg?=
 =?us-ascii?Q?EsH+AZDckk70SIb4/8A2w59eN+qd0B9OOR+dAonNxxcuz0Hke74w8uZ7U1oc?=
 =?us-ascii?Q?kw2oddXUXE+M+yK9JBvnDZjSktTJwiMwhHZZRwaCOT1pwcvZDou6GdvNjF1A?=
 =?us-ascii?Q?dL9YIrILtZ0ArJ93p1qGQQzr0BIc8lDRSUJK6nqcIrymUchE2xjICF7IiXaE?=
 =?us-ascii?Q?cDek87GKdvTPdSsDwS234DI1Rmjzwd/aSlu2d1tRmko6RX79jDNG/4aZSy5c?=
 =?us-ascii?Q?n3bwK9/eiblUUWasNlN7yhpYd+zffbc1FdaFl2g7MdnigdJiYwy+ThOG4kvG?=
 =?us-ascii?Q?LfAGxBwKxSdTYi6QSz5vcZM+pZMdWIASEtmUIF/pBX9puRfIrychADxywghg?=
 =?us-ascii?Q?SRwqO8PM1V9N5/YQg+6Y4elpeukPX5QKolRD9RCEoQ1LJf3pRoRTdmDhQA3T?=
 =?us-ascii?Q?0xgcv/hCNTapGEkwfnLZnUwm19vUvEZD+8FuOrlkm8/SBhml9Mfu8oynW6Bj?=
 =?us-ascii?Q?2vC7k3U2w7w1W/GnGcDPFBs848hMS3IurLR6OeVIiv4GkMPYnMDIEZcMN25P?=
 =?us-ascii?Q?/7FzuW3GK2i3lbdcLQ0Fh/uDhVK3Ao1e0C9r4FSDhhXZYKddGVzEDxC7nhqL?=
 =?us-ascii?Q?g3SOBxeor/zquNn90EJjZSNlkmNl0PIZdwhRn5FpHvTM0tVwSMhTvnORlRPy?=
 =?us-ascii?Q?FG10uFgoMY34FCUogZO43olqQ24cvdlo/IMgNB6sUs51lZeanA2fJEhNjiRo?=
 =?us-ascii?Q?fqD5pjD8SKKA+fRHSiTaniTMCYeCZA8nZ3L0m2ds08VgTPEgJftp+ocvuaRA?=
 =?us-ascii?Q?7gE0uFDe9xQkuu8eUXNm6fu9T+ZOeJ9VttshNeBLBXD58CHlaWD0Jb0f2Aks?=
 =?us-ascii?Q?vmxLCFEe1GwWs7XTgpFp6otQguRXTHQlL0oqQgI8H3t7+AfSiyUHPCMgSJH9?=
 =?us-ascii?Q?UeG63/2lpx4bwB5FWvmqLPbCe+J7KLJ9coWc7qE8k26MsZ/NuV1oJLGjsDoo?=
 =?us-ascii?Q?jNl0C6wEFafH5IGieTfYO9MHkYVZsyq3/Bl3DkZPVylfViAccwxJSZ14/FrG?=
 =?us-ascii?Q?3j5fs3ORpiKTOrquM3dHL8Xq7YNKvaCoQ+bsdkQ5Z/S2+sGXOHFbiYoni5gY?=
 =?us-ascii?Q?A/Uy6L0WdrjF5hHzxBKAyaGRAOZ4QUX5zXUU6mIzb0hLsCmLMesCokmsUBNN?=
 =?us-ascii?Q?IlQFH4AIoQDN7MiOBhGASGKaI6CtWrs14Zxr5PHw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j3aJYXilqVnrxeObe5AY7oMcCBUCwTf22WIHQA7okzI4WSwky/R4sSHuWAmx?=
 =?us-ascii?Q?BAtmo25gAcVgBD8vEkNSkbhCgSIjh8BIzDjn/OlrXtcUxWPf1AT++ogcal9T?=
 =?us-ascii?Q?WvbO7YDUl2uy631eV/p21tZx2biJiLtx9GltiLKWQmF63kUnx5hKUU64Wb64?=
 =?us-ascii?Q?KLQIBdc9QdMqVazhDLau4WrFr6Ax0s477UEBFvodis9HlBquTm3x2A/rD+4s?=
 =?us-ascii?Q?Rpl1gZcN78uuAerWLC8lE0U3/uLKF6iBvVIDtJDpDkTdfCmObbPAwjRKHeMm?=
 =?us-ascii?Q?Bdq5hJ7t2rswk99OWYXwaOnbO+kEBidokYEbt20NfCYg7ZYqbZT2UPCefuKk?=
 =?us-ascii?Q?eO+MqTfktumuz6XH4i08K5/bpse7KbVdqpdwEWWmv8WplnNSErCTQURUwiF0?=
 =?us-ascii?Q?Ht2x50+LxSm/CrvM/T/NnSD6G4Urz9gDUj0RS+v+qdJnvTj4bD2xwXxI07cv?=
 =?us-ascii?Q?fG483jRw6YEZx77aAFkKx/N3xXEMeL20E7dGBdu/HDrXWybZihPkl2iL9jHt?=
 =?us-ascii?Q?76NGD/1HKM7X43TqD6dloXPZ7NinPDAaRP39k8mLpXzqaUUfy3v12loqds57?=
 =?us-ascii?Q?hSKTLqnbZPJmdJ5qNVwoBRzfJyCvKjBJfJTzo/Triu+oo9/AiXQq8+1Aea3d?=
 =?us-ascii?Q?pnDY0BkWry83Gz6JU+ghhZKk9a8hKtWtmm96v2BdLieKjWg9JGcgc2vxoy1Q?=
 =?us-ascii?Q?5OJHPm0a7xALx2iieJev3DYkzUbCszd8qLD3wN/L09XJ+YGEKQa9hndHemkt?=
 =?us-ascii?Q?lGz5sLKEabc1I37XhD18i3fQzSSpVIcVOpCv+AbN7L9cgo5+Y8RIDzxwBeFq?=
 =?us-ascii?Q?pwf3IEEw3L92F6c0z51hlChTujL+KveXUWYJsjF/G21fxW0rxNZpTfdi0U4Q?=
 =?us-ascii?Q?PLdQm5wxAK39owylCSJOtjFlLdFZG+dl0GrI605FT8sNxFNB/jHnmOOUiuYX?=
 =?us-ascii?Q?ZuyvsJBkbuPOfoONbw5kaxjIiaJ15drAMvgjYgDnSVsFfIthrz5C7Ekrol8e?=
 =?us-ascii?Q?NESLRrjOR9Klofjy3oZUl5+DIC+iwCwr5Gd+0KBCMDcPOnacUBWt6nt6Jhmq?=
 =?us-ascii?Q?hl9Kw71/6TrmhpCn3oGx5x114aiKCkZ1xmuVUPyjl8IGlUpdfP/DrLxuwer9?=
 =?us-ascii?Q?OFk/BcoOu3C3nwJaMqzzRZvUkvrVXjbSBkzAzScLQOO1XA6YXHvKCYBvkFG4?=
 =?us-ascii?Q?tTdH4OUkHe9H1rS48dd9clHScaLiMa/eXt3P+4gWC90Q7OQVSr3vAObwwO4H?=
 =?us-ascii?Q?tQSN4pd6am/8+KlSiPE3dQCkWmbLw06TvxS1sC+pOGgAc+C93+jvfO5UjNul?=
 =?us-ascii?Q?7NjYbsxmOb9cEnBaWcJgj4nKqkhwnvdFE/H4qaBEesiIwIOnjmgz1cHcSm3X?=
 =?us-ascii?Q?/0N/Cyp1GMM8zxfjlsP0TBLfedMwnkyJy5hG2ZBZNbe5aKY7DZBBNYFAnL3C?=
 =?us-ascii?Q?1Ii8y3OnhRft0OjBlm3WgGP3fCHQ4tXPIQR41IumDeuMu7tLBK1+3IOVMyMu?=
 =?us-ascii?Q?QZNZ6YOou5dBUaBb11HWf2l/a6WREVeA25Mugkb/oJGCq1JI70NM2Ica5/iy?=
 =?us-ascii?Q?mg2SWhoNrBWZsQXWP1vxUOigCVrIIeioKT0QPiA1Sw9EGi1E3YjTOW5eYZ/Q?=
 =?us-ascii?Q?/PRFAJSeXKO+S02ZR/XzvH5+DRPNXEFJDlLd+sWBuWzOZK1onpU6RVUuz/A/?=
 =?us-ascii?Q?TiHQ7G359AofMTIjYFW0htSsvemqe+yKmvMSyF2NRzUGPsD2oHDvNUK+9/iF?=
 =?us-ascii?Q?Fq5atG2KhA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d445f6c-c614-4be2-7fc0-08de632e662d
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 14:13:26.8904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YwjB48TeFx21AvlR+AEV7XTqGtYoRnIuxNfgFV9YfZ2vfQX0UcWVPNbinXYDt2CJ3wI1wPVPU3XmLt3tTK7GzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8219
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "Oops:general_protection_fault,probably_for_non-canonical_address#:#[##]KASAN_PTI" on:

commit: fb047eb995aea53b2ddc61661210e507d098248e ("sched/fair: Increase weight bits for avg_vruntime")
https://git.kernel.org/cgit/linux/kernel/git/peterz/queue.git sched/hrtick

in testcase: trinity
version: 
with following parameters:

	runtime: 300s
	group: group-01
	nr_groups: 5



config: x86_64-randconfig-123-20250522
compiler: gcc-14
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+----------------------------------------------------------------------------------+------------+------------+
|                                                                                  | 854e0fe280 | fb047eb995 |
+----------------------------------------------------------------------------------+------------+------------+
| boot_failures                                                                    | 0          | 6          |
| Oops:general_protection_fault,probably_for_non-canonical_address#:#[##]KASAN_PTI | 0          | 6          |
| KASAN:null-ptr-deref_in_range[#-#]                                               | 0          | 6          |
| RIP:pick_task_fair                                                               | 0          | 6          |
| Kernel_panic-not_syncing:Fatal_exception                                         | 0          | 6          |
+----------------------------------------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202602032236.bcc0d1b7-lkp@intel.com



[  110.120926][ T3839] Oops: general protection fault, probably for non-canonical address 0xdffffc000000000a: 0000 [#1] KASAN PTI
[  110.121772][ T3839] KASAN: null-ptr-deref in range [0x0000000000000050-0x0000000000000057]
[  110.122306][ T3839] CPU: 0 UID: 0 PID: 3839 Comm: kworker/u4:3 Not tainted 6.19.0-rc1-00053-gfb047eb995ae #1 PREEMPT(lazy)
[  110.123021][ T3839] Workqueue:  0x0 (events_unbound)
[  110.123364][ T3839] RIP: 0010:pick_task_fair (kernel/sched/fair.c:5544 kernel/sched/fair.c:8967)
[  110.123759][ T3839] Code: 00 85 c0 0f 85 f0 00 00 00 be 01 00 00 00 4c 89 ff e8 41 4b fd ff 48 8d 78 51 48 89 c6 48 89 f8 48 89 fa 48 c1 e8 03 83 e2 07 <42> 0f b6 04 30 38 d0 7f 08 84 c0 0f 85 e2 01 00 00 80 7e 51 00 0f
All code
========
   0:	00 85 c0 0f 85 f0    	add    %al,-0xf7af040(%rbp)
   6:	00 00                	add    %al,(%rax)
   8:	00 be 01 00 00 00    	add    %bh,0x1(%rsi)
   e:	4c 89 ff             	mov    %r15,%rdi
  11:	e8 41 4b fd ff       	call   0xfffffffffffd4b57
  16:	48 8d 78 51          	lea    0x51(%rax),%rdi
  1a:	48 89 c6             	mov    %rax,%rsi
  1d:	48 89 f8             	mov    %rdi,%rax
  20:	48 89 fa             	mov    %rdi,%rdx
  23:	48 c1 e8 03          	shr    $0x3,%rax
  27:	83 e2 07             	and    $0x7,%edx
  2a:*	42 0f b6 04 30       	movzbl (%rax,%r14,1),%eax		<-- trapping instruction
  2f:	38 d0                	cmp    %dl,%al
  31:	7f 08                	jg     0x3b
  33:	84 c0                	test   %al,%al
  35:	0f 85 e2 01 00 00    	jne    0x21d
  3b:	80 7e 51 00          	cmpb   $0x0,0x51(%rsi)
  3f:	0f                   	.byte 0xf

Code starting with the faulting instruction
===========================================
   0:	42 0f b6 04 30       	movzbl (%rax,%r14,1),%eax
   5:	38 d0                	cmp    %dl,%al
   7:	7f 08                	jg     0x11
   9:	84 c0                	test   %al,%al
   b:	0f 85 e2 01 00 00    	jne    0x1f3
  11:	80 7e 51 00          	cmpb   $0x0,0x51(%rsi)
  15:	0f                   	.byte 0xf
[  110.125105][ T3839] RSP: 0018:ffff88811d317bf0 EFLAGS: 00010002
[  110.125497][ T3839] RAX: 000000000000000a RBX: ffffffff86b454c0 RCX: 1ffffffff1022aa7
[  110.126030][ T3839] RDX: 0000000000000001 RSI: 0000000000000000 RDI: 0000000000000051
[  110.126528][ T3839] RBP: fffffbfff0d68aba R08: ffffffff86b454c0 R09: 0000000000000000
[  110.127026][ T3839] R10: ffffffff86b45648 R11: 0000000000000000 R12: ffffffff86b455d0
[  110.127525][ T3839] R13: 0000000000000000 R14: dffffc0000000000 R15: ffff88811ea67000
[  110.128095][ T3839] FS:  0000000000000000(0000) GS:0000000000000000(0000) knlGS:0000000000000000
[  110.128732][ T3839] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  110.129171][ T3839] CR2: 000000000a561000 CR3: 000000011b972000 CR4: 00000000000406b0
[  110.129707][ T3839] Call Trace:
[  110.129919][ T3839]  <TASK>
[  110.130113][ T3839]  pick_next_task_fair (kernel/sched/fair.c:8990)
[  110.130436][ T3839]  ? dequeue_task_fair (kernel/sched/fair.c:7184 (discriminator 1))
[  110.130758][ T3839]  __pick_next_task+0x75/0x5b0
[  110.131130][ T3839]  __schedule (kernel/sched/core.c:6813)
[  110.131414][ T3839]  ? schedule (kernel/sched/core.c:6908 (discriminator 1) kernel/sched/core.c:6966 (discriminator 1))
[  110.131721][ T3839]  ? __pfx___schedule (kernel/sched/core.c:6725)
[  110.132063][ T3839]  ? local_clock_noinstr (kernel/sched/clock.c:304 (discriminator 1))
[  110.132429][ T3839]  ? local_clock (arch/x86/include/asm/preempt.h:95 (discriminator 1) kernel/sched/clock.c:319 (discriminator 1))
[  110.132750][ T3839]  ? __lock_release+0x119/0x2b0
[  110.133127][ T3839]  schedule (arch/x86/include/asm/preempt.h:85 (discriminator 13) kernel/sched/core.c:6953 (discriminator 13) kernel/sched/core.c:6967 (discriminator 13))
[  110.133390][ T3839]  ? worker_thread (kernel/workqueue.c:3434 (discriminator 3))
[  110.133741][ T3839]  worker_thread (kernel/workqueue.c:3437)
[  110.134034][ T3839]  ? __kthread_parkme (arch/x86/include/asm/bitops.h:202 (discriminator 1) arch/x86/include/asm/bitops.h:232 (discriminator 1) include/asm-generic/bitops/instrumented-non-atomic.h:142 (discriminator 1) kernel/kthread.c:290 (discriminator 1))
[  110.134347][ T3839]  ? __pfx_worker_thread (kernel/workqueue.c:3367)
[  110.134676][ T3839]  kthread (kernel/kthread.c:463)
[  110.134934][ T3839]  ? local_clock_noinstr (kernel/sched/clock.c:304 (discriminator 1))
[  110.135259][ T3839]  ? __pfx_kthread (kernel/kthread.c:412)
[  110.135549][ T3839]  ? ret_from_fork (arch/x86/kernel/process.c:157 (discriminator 1))
[  110.135898][ T3839]  ? lockdep_hardirqs_on_prepare (kernel/locking/lockdep.c:4351 kernel/locking/lockdep.c:4410)
[  110.136315][ T3839]  ? __pfx_kthread (kernel/kthread.c:412)
[  110.136642][ T3839]  ret_from_fork (arch/x86/kernel/process.c:164)
[  110.136985][ T3839]  ? __pfx_ret_from_fork (arch/x86/kernel/process.c:153)
[  110.137309][ T3839]  ? __switch_to (arch/x86/include/asm/bitops.h:202 (discriminator 1) arch/x86/include/asm/bitops.h:232 (discriminator 1) include/asm-generic/bitops/instrumented-non-atomic.h:142 (discriminator 1) include/linux/thread_info.h:133 (discriminator 1) include/linux/sched.h:2012 (discriminator 1) arch/x86/include/asm/fpu/sched.h:34 (discriminator 1) arch/x86/kernel/process_64.c:619 (discriminator 1))
[  110.137605][ T3839]  ? __switch_to_asm (arch/x86/entry/entry_64.S:207)
[  110.137954][ T3839]  ? __pfx_kthread (kernel/kthread.c:412)
[  110.138243][ T3839]  ret_from_fork_asm (arch/x86/entry/entry_64.S:259)
[  110.138551][ T3839]  </TASK>
[  110.138776][ T3839] Modules linked in:
[  110.139037][ T3839] ---[ end trace 0000000000000000 ]---
[  110.139382][ T3839] RIP: 0010:pick_task_fair (kernel/sched/fair.c:5544 kernel/sched/fair.c:8967)
[  110.139749][ T3839] Code: 00 85 c0 0f 85 f0 00 00 00 be 01 00 00 00 4c 89 ff e8 41 4b fd ff 48 8d 78 51 48 89 c6 48 89 f8 48 89 fa 48 c1 e8 03 83 e2 07 <42> 0f b6 04 30 38 d0 7f 08 84 c0 0f 85 e2 01 00 00 80 7e 51 00 0f
All code
========
   0:	00 85 c0 0f 85 f0    	add    %al,-0xf7af040(%rbp)
   6:	00 00                	add    %al,(%rax)
   8:	00 be 01 00 00 00    	add    %bh,0x1(%rsi)
   e:	4c 89 ff             	mov    %r15,%rdi
  11:	e8 41 4b fd ff       	call   0xfffffffffffd4b57
  16:	48 8d 78 51          	lea    0x51(%rax),%rdi
  1a:	48 89 c6             	mov    %rax,%rsi
  1d:	48 89 f8             	mov    %rdi,%rax
  20:	48 89 fa             	mov    %rdi,%rdx
  23:	48 c1 e8 03          	shr    $0x3,%rax
  27:	83 e2 07             	and    $0x7,%edx
  2a:*	42 0f b6 04 30       	movzbl (%rax,%r14,1),%eax		<-- trapping instruction
  2f:	38 d0                	cmp    %dl,%al
  31:	7f 08                	jg     0x3b
  33:	84 c0                	test   %al,%al
  35:	0f 85 e2 01 00 00    	jne    0x21d
  3b:	80 7e 51 00          	cmpb   $0x0,0x51(%rsi)
  3f:	0f                   	.byte 0xf

Code starting with the faulting instruction
===========================================
   0:	42 0f b6 04 30       	movzbl (%rax,%r14,1),%eax
   5:	38 d0                	cmp    %dl,%al
   7:	7f 08                	jg     0x11
   9:	84 c0                	test   %al,%al
   b:	0f 85 e2 01 00 00    	jne    0x1f3
  11:	80 7e 51 00          	cmpb   $0x0,0x51(%rsi)
  15:	0f                   	.byte 0xf


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260203/202602032236.bcc0d1b7-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

