Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1F81D7996
	for <oe-lkp@lists.linux.dev>; Fri, 22 Nov 2024 10:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732269837; cv=fail; b=rVKDHzOnymvCpgqK6//I6zjWfn0IvMN57YTrCxeRUPjedL3EPgHllxX4WH//AEIi2Gl4vBtFO/Ye27tp/YDeHH9ypeSHMonY98jt2wlDg11dghZj2R+8mugryZ6ObJu0afXVIBfg0jykTvj83948JPvTs4CCiFKq8vVtt8Pa1iY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732269837; c=relaxed/simple;
	bh=1MGDYiUJwc0kyq7SvZ3U/ENf7JkzLlDxwlJbgafa+nY=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Yo24eyFSHHpBtBSaAju9pGFtGtNng5LAseQ+mkxBi1g7uvGM/TCO2KwLb9jp4o0miA5wRe4SoQ8qkc/ydjoHYYYORPazhM82Z0TcFKIR8TFS/lhmQoC5tGrKDaxkWhzVjJe/w5IxjPfRWpzY/9zCC5f7d9HfiX8UtutikG6nIWk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y+D7jnZ+; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y+D7jnZ+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732269835; x=1763805835;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1MGDYiUJwc0kyq7SvZ3U/ENf7JkzLlDxwlJbgafa+nY=;
  b=Y+D7jnZ+QVK68oenRq8/kkWoa7vSvMghwp/BE3e9OyoGfa09mRxKozuH
   AMQqdjYuVdC8RR/Mh8EkbN+8Po2Aymu/CC5uyfVgXGX9mqasr80OAGVNs
   68GSa0QRi8R1h4GNL5itw5YfyqJTBgVqEuKSPgJQEj9PycDPYSD7JMHNY
   jAam9NMTEIz4VBtjbpPvIJ+kJElxYJfs4Tz3wrAsG1Sqv2NcxdBQ5nton
   aCHyBs2CoiNmrMfz7Vb0ejcNMClN0BJgDpvNIMjbsL6i6gyvSb031TNdy
   B4Sqtji/dV0eqUEshu6bHEvCQFc4odgTbeKaAlpGeiuRZvYYU/p9pvUpZ
   w==;
X-CSE-ConnectionGUID: Pr9Lnn3vQXmer38FbcGIYQ==
X-CSE-MsgGUID: XVhPGFfLRwyTJbGVWmF1yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="54926941"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="54926941"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 02:03:55 -0800
X-CSE-ConnectionGUID: bFnqDiJ9TaShbPfiYG3+tQ==
X-CSE-MsgGUID: 9SMy/tu4RUChdJUnVImdVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="121402281"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 22 Nov 2024 02:03:55 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 22 Nov 2024 02:03:53 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 22 Nov 2024 02:03:53 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 22 Nov 2024 02:03:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EY68L3ivXgEAdat4GmMSmdTRAMeVlqW8I2t1hIxNY9BAjwBF7SUGlkcUNeKdagXRYGNvAPwm55UvloNAX020lmNiiXuvWk1TupcPigk3PpkX3ERSHYCErkWPuloq51a+9fJrTjle1ejhdUjqdHYjovJwIBunUmYTh31048J+ugGNkQ1cEKYJ0YY1cBIK072V1fSXy2fUhCVlt/GErviJkqr8FDRloM7As6w5WqIE4kHbCOApNV46KGFuLi0T7bNGOvYDZUMO8NVS8fMpjmN+wCDa0Cqh+ZWDK4TpGB6rqTZ1oDGZZPxSxOfOFEzcYt+8pspwshTdXOu//umbpwfN/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3kgyOsb/u6MvTpO4yhsSK48zLtbUlheeL9EcLDKjPd4=;
 b=SrL3FT0JcAeAAMvYUALU7lrLJUm3zxmsiyVSNrq3GsWI8o9QsmkSYI7stCifrs6a3UMRqQzklfCOCC3fdEoaHT4B7dGCkGugjjnswjCEuCLXANWXL7tmw52Z8g+boVC2PXdixOg4k0RtDdx+UwT01Q0TuwOOrVtFQ7WQbOKJzLZej3I/mEK1t740bwr///OVCMDBMVaCJ5PntJTW5uPy3VF65yA09+SLqk3nGo5luSLKBQ/JMSveg34jE+muCNbfrp/wwr689zsRIOIhX02OsDvdXCj+OJqkxUqQWDAOCHsdFtIbLR6kRzolhzoOKrKlEJ2Vo/noz5dvB4iO+6oTTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by IA1PR11MB7176.namprd11.prod.outlook.com (2603:10b6:208:418::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.27; Fri, 22 Nov
 2024 10:03:46 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8158.024; Fri, 22 Nov 2024
 10:03:46 +0000
Date: Fri, 22 Nov 2024 18:03:37 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-mm@kvack.org>,
	<oliver.sang@intel.com>
Subject: [vbabka:slub-percpu-sheaves-v1r5] [TESTING, HACK] 3340b9085e:
 BUG:kernel_NULL_pointer_dereference,address
Message-ID: <202411221731.acb4de27-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR03CA0096.apcprd03.prod.outlook.com
 (2603:1096:4:7c::24) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|IA1PR11MB7176:EE_
X-MS-Office365-Filtering-Correlation-Id: 65c4e4a2-4145-491c-5a65-08dd0adcf3f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NcK4dgW/3vbBhZ8ouUR6LI+fT8C4bpClId1f0TD7cPO03KXAjBufC95KypuI?=
 =?us-ascii?Q?e75KH8pzRMBFn6vbGAt6oIFSXuygZxDSIW8HokRgqFd2deuCbWrB36pezC0G?=
 =?us-ascii?Q?IUyTS3b13VxTk13eBrWYQR4DuP8jdzuu6JfD9rilcAcrEEsyQThIqGbMvQJZ?=
 =?us-ascii?Q?C5hIaEsoSlMbfqijDKNdd5dz2aC86+EGqFQ6XqZqTBRlAPwzfK2m+rHWv4LB?=
 =?us-ascii?Q?1f+Vy2OPLOin3SV/2Y7z03ce8bkWyY5Okzv8e1iAQNSEacVxG8hk5zIitcg7?=
 =?us-ascii?Q?XFp8AKIdxmI6Fb0/wmvZj1lzVTu69S/uUAgQJuHOXDcyGAXOrKPN34UQT4Ys?=
 =?us-ascii?Q?efRYnyBTkwW+8yyb/8rFPe5k6aIkJha6YC9B6dUGzH0BpU4SRhb0eLtBlUhG?=
 =?us-ascii?Q?NBMhE7cNhahpgOxoi8scA58qZzKHxUtKt5vKME1Qp7cU7rDWfV4X+TyYCA4h?=
 =?us-ascii?Q?AEA3ExvNDyjpiD2aBBEuLJb4UPBJressEr7IExfq6zJ8Z57oU2Cpam+dOGIw?=
 =?us-ascii?Q?p8OitzK2MacqIqacD0G3+8hhHtbmUc+jSrhSuU92bPNjpPEhXnGP8t5KBySM?=
 =?us-ascii?Q?Xi11vo7MU3FdkYZCY/JbVCg8tGxLr61/859nmTXCIujtLbRBCE1o0whV37nb?=
 =?us-ascii?Q?RWtWzJTI5wFrp3cpysE/Tm0wPoLo01mFZzII5rrDX8vO35ppF+Mw5bMPOqRk?=
 =?us-ascii?Q?Oagtros7uks1F6+tjZ+j/IRtLXNDAkuWXAfpJi0Y3laeBnKqkegtq14kns22?=
 =?us-ascii?Q?XjTwJsDhivKrYm9DYui57n6kScOnfRLQ9N1WXgnWin0sUBuxI83Ox7wPDHYo?=
 =?us-ascii?Q?qbQDj9GwglKx8NpHUZwL2T0wNQYfas1Qga6EI3Av31es+Q4rQVr07oEDD4oO?=
 =?us-ascii?Q?ZjfIFcq6ts/IQIXCFyGyDj6/e/y6b0A1HXBe1T/gAYdqjJnB0nnS51Y2PkGh?=
 =?us-ascii?Q?slDx5fU1xv3hFTE5bTAznvWESPmDEV1uqD9eGvpiLhAuNO6WqLQ10LyWNyRI?=
 =?us-ascii?Q?ZAQnqUAyDsv2pc80oMXXqUFfp1xwPng7ja//opxzPdCESEm+gxIsjuL3k8LR?=
 =?us-ascii?Q?dSlGghXyTvj74dDfc2sKH97FNWlxK2210OcUmH8ZdX0TClFxMsU/sa3O5m9C?=
 =?us-ascii?Q?MkKyP7K7NSqtV36e2H7yZF/GdHcrvSHq4uqFG5E7quQPCH12xCE3Sl5hehir?=
 =?us-ascii?Q?wG0k5X2a88SKdAiRV3biU/Yy+CMUnFjo3qcWzSPeO4JzAu1ren/tPr+RUAgu?=
 =?us-ascii?Q?+9UAfy7VVQkFzLD7NnFssgRUgczQAx224ngNLVNcjA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n06vh/KQBmcJXZyQWS0Vr2JmMzQ5M1wx9YnJFGDH7Zw0ojmp5jt5CEGZT0sx?=
 =?us-ascii?Q?v+InIDaZUmIuygapboKZJ70IoCL8zMSycK2AhQcCryyhGnLsrteA8LTopliR?=
 =?us-ascii?Q?qzCdjSO64yqJ+oRfbqfMt6eq+9Z3XgaRnuHFRtXmeo3A9m9Uwpux7B9d2CmG?=
 =?us-ascii?Q?9tfBZ0X0uud0lPL/iBIEjJkh9Qgudg82iSQReynUvadtnghTgfHzKtlJZSc/?=
 =?us-ascii?Q?KuNJJWlW8W+6eF6yBn+cEbjr+s18PrzmKMAZPFrpEf9xtds+J+mKBERd0WZA?=
 =?us-ascii?Q?JIcTn1t3DmHYFfckTErJ3ea5F0t0HXZNQILn3xDrdOrDPWI4iSemVJu5Tsqq?=
 =?us-ascii?Q?tfvE+rjz94VM0MKFH8DuNeRyOQrKTdcuDL6s+SxVjSphsx9H6SDwy6aJdAB5?=
 =?us-ascii?Q?vRsu13VyXPLXOKyXDOD8ipusWXSYaa43K0cJQ2bwDXZwoB8hUNCSEAdswI0L?=
 =?us-ascii?Q?9bwwZOdidF1mu9/CN6ePRbX8eTcRJXelGPv441n5CNlZo3MrNlQMmuTueAUU?=
 =?us-ascii?Q?ft2q9uwhRGf2DvKUzxRfKgwoyWhYsPyRlSc/e9VRypHtxzdkTfgA0xytyCXI?=
 =?us-ascii?Q?5h7Mf40CcgEtyP43nkdu2/K6jmEpfquSh0jID6sDAkDeCXlzvpKqG52mjAel?=
 =?us-ascii?Q?tN/ObWJxCj+hoWSs0GDOw4Ytx7109ovLl7T+pNwbls4dvx8zTRN139foZgVr?=
 =?us-ascii?Q?e/s6t3qKR2yom8Pra/sIbhcPAwYALGn/jqujyY9NTLdqHRUHY9x2sWvQGA9r?=
 =?us-ascii?Q?bJfAE6UscGVvwQ1r3ymxjteIGpS+qp7YmbiG9ZD5M4QVJTWl+sU+/uIjxodP?=
 =?us-ascii?Q?h9QSK2qGkqysMbjW57Pm9gEvS7HSNSKgFLzfTo4q7IC2/0SxF1RoNpcd7vIR?=
 =?us-ascii?Q?gHQuLFawRjqYfKxiFSHmSdaynrow2klT40TxC5B2ujZpxnsTFl6ovmHgwA+4?=
 =?us-ascii?Q?JtNBgPGismUCIqxrp+z8iMRG6uG3uUC9/9ZJ/XSev4FHt6mMIaxRQBlfZDea?=
 =?us-ascii?Q?9J3YhhGwD/KR5tocZ14X+qa9dTLh/bdSsb+l66VWNRkmtTbHnuCCIiJAY2FJ?=
 =?us-ascii?Q?5/4890fJ90MDwqNdnj+BLnfQ8crrxU9h/X8oMoTAaT/QVPvRxLsfBStoDqT5?=
 =?us-ascii?Q?wg3uxUOOzBOM0LGtyuMrDvLsqVkHwAPImPhjfrIUi1HxL0T8uJgYQjkk6EIf?=
 =?us-ascii?Q?dWUjd4eGHcVsgE2UGDQjwLnk16mYXLZlz1WlVFcFTdVkg24wNYzGFNUTmW7N?=
 =?us-ascii?Q?1+wjF2RIy9GW4LJlviVpbQMLAhwOZKLspjCIbMm8CEKQpjEnUsjLvSsS5AqN?=
 =?us-ascii?Q?EM2lK/QmG6McYbfffmMyRZkNNsvhk8laptMglQf357SVt7tdxruM2Kb3l56J?=
 =?us-ascii?Q?h1rS0Y2xQMVwIeE/E1FNqM1f3GJIbVwPzRQK01WakD+lXi9p5t6qhDXv7hfR?=
 =?us-ascii?Q?v4YPJtkD2WOCcr6UJdg6tSYmhXvkpHmQ2MlXspAv2SEi4+hlQU162UUpLhSy?=
 =?us-ascii?Q?OmAmeYVY9aj4c8lQalT8T/VLyvBEK417DYjratzgWqv/0jY2tLfEMXEtE3iy?=
 =?us-ascii?Q?BGQMzI7mma4C3qW4cdNjzzkssIHdoTLQOntgz3I0l55U0fj7IvHoSZP35+Nx?=
 =?us-ascii?Q?pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 65c4e4a2-4145-491c-5a65-08dd0adcf3f5
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 10:03:46.0050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2FEmspPurIRH9I1wI2kNNy2DWmqxQVrgxr78jJ3IjpA7Ie8eoCDNIBcDQ3hDqN6Lb5oPBZxLbsdkaJ3eGPsqpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7176
X-OriginatorOrg: intel.com



Hello,


from commit message, we are not very clear the purpose of this HACK patch.
we just make this report FYI what we observed in our tests.
if less useful, please just ignore. thanks


kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,address" on:

commit: 3340b9085e6f2a812039ed0a9ca03e8e26cc01ba ("TESTING, HACK: sheaves for everyone")
https://git.kernel.org/cgit/linux/kernel/git/vbabka/linux.git slub-percpu-sheaves-v1r5

in testcase: boot

config: i386-randconfig-005-20241113
compiler: gcc-12
test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+---------------------------------------------+------------+------------+
|                                             | 0382bfb32e | 3340b9085e |
+---------------------------------------------+------------+------------+
| boot_successes                              | 18         | 0          |
| boot_failures                               | 0          | 18         |
| BUG:kernel_NULL_pointer_dereference,address | 0          | 18         |
| Oops                                        | 0          | 18         |
| EIP:__queue_work                            | 0          | 18         |
| Kernel_panic-not_syncing:Fatal_exception    | 0          | 18         |
+---------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202411221731.acb4de27-lkp@intel.com


[    2.886567][    T1] BUG: kernel NULL pointer dereference, address: 000000f0
[    2.887104][    T1] #PF: supervisor read access in kernel mode
[    2.887541][    T1] #PF: error_code(0x0000) - not-present page
[    2.887977][    T1] *pde = 00000000
[    2.888270][    T1] Oops: Oops: 0000 [#1] PREEMPT
[    2.888628][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper Not tainted 6.12.0-rc7-00008-g3340b9085e6f #1
[    2.889305][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 2.890854][ T1] EIP: __queue_work (kernel/workqueue.c:2256 (discriminator 49)) 
[ 2.891479][ T1] Code: f6 0f 95 c2 31 c9 6a 00 e8 19 49 0f 00 85 f6 58 0f 85 10 02 00 00 31 d2 31 c9 b8 b8 de da c2 6a 00 e8 00 49 0f 00 58 8b 45 f0 <f7> 80 f0 00 00 00 00 80 01 00 0f 85 0c 04 00 00 b8 a0 de da c2 31
All code
========
   0:	f6 0f 95             	testb  $0x95,(%rdi)
   3:	c2 31 c9             	ret    $0xc931
   6:	6a 00                	push   $0x0
   8:	e8 19 49 0f 00       	call   0xf4926
   d:	85 f6                	test   %esi,%esi
   f:	58                   	pop    %rax
  10:	0f 85 10 02 00 00    	jne    0x226
  16:	31 d2                	xor    %edx,%edx
  18:	31 c9                	xor    %ecx,%ecx
  1a:	b8 b8 de da c2       	mov    $0xc2dadeb8,%eax
  1f:	6a 00                	push   $0x0
  21:	e8 00 49 0f 00       	call   0xf4926
  26:	58                   	pop    %rax
  27:	8b 45 f0             	mov    -0x10(%rbp),%eax
  2a:*	f7 80 f0 00 00 00 00 	testl  $0x18000,0xf0(%rax)		<-- trapping instruction
  31:	80 01 00 
  34:	0f 85 0c 04 00 00    	jne    0x446
  3a:	b8 a0 de da c2       	mov    $0xc2dadea0,%eax
  3f:	31                   	.byte 0x31

Code starting with the faulting instruction
===========================================
   0:	f7 80 f0 00 00 00 00 	testl  $0x18000,0xf0(%rax)
   7:	80 01 00 
   a:	0f 85 0c 04 00 00    	jne    0x41c
  10:	b8 a0 de da c2       	mov    $0xc2dadea0,%eax
  15:	31                   	.byte 0x31
[    2.891706][    T1] EAX: 00000000 EBX: c2c42920 ECX: 00000006 EDX: 00000000
[    2.891706][    T1] ESI: 00000000 EDI: 00000000 EBP: c4119e50 ESP: c4119e2c
[    2.891706][    T1] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00010082
[    2.891706][    T1] CR0: 80050033 CR2: 000000f0 CR3: 02fb7000 CR4: 00040690
[    2.891706][    T1] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[    2.891706][    T1] DR6: fffe0ff0 DR7: 00000400
[    2.891706][    T1] Call Trace:
[ 2.891706][ T1] ? show_regs (arch/x86/kernel/dumpstack.c:479 arch/x86/kernel/dumpstack.c:465) 
[ 2.891706][ T1] ? __die (arch/x86/kernel/dumpstack.c:421 arch/x86/kernel/dumpstack.c:434) 
[ 2.891706][ T1] ? page_fault_oops (arch/x86/mm/fault.c:710) 
[ 2.891706][ T1] ? kernelmode_fixup_or_oops+0x88/0xa0 
[ 2.891706][ T1] ? __bad_area_nosemaphore+0x127/0x1b0 
[ 2.891706][ T1] ? bad_area_nosemaphore (arch/x86/mm/fault.c:835) 
[ 2.891706][ T1] ? do_user_addr_fault (arch/x86/mm/fault.c:1280 (discriminator 1)) 
[ 2.891706][ T1] ? __this_cpu_preempt_check (lib/smp_processor_id.c:67) 
[ 2.891706][ T1] ? exc_page_fault (arch/x86/include/asm/irqflags.h:26 arch/x86/include/asm/irqflags.h:87 arch/x86/include/asm/irqflags.h:147 arch/x86/mm/fault.c:1489 arch/x86/mm/fault.c:1539) 
[ 2.891706][ T1] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1494) 
[ 2.891706][ T1] ? handle_exception (arch/x86/entry/entry_32.S:1055) 
[ 2.891706][ T1] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1494) 
[ 2.891706][ T1] ? __queue_work (kernel/workqueue.c:2256 (discriminator 49)) 
[ 2.891706][ T1] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1494) 
[ 2.891706][ T1] ? __queue_work (kernel/workqueue.c:2256 (discriminator 49)) 
[ 2.891706][ T1] ? clear_pending_if_disabled (kernel/workqueue.c:2356 (discriminator 2)) 
[ 2.891706][ T1] queue_work_on (kernel/workqueue.c:2394) 
[ 2.891706][ T1] flush_all_cpus_locked (mm/slub.c:3892) 
[ 2.891706][ T1] __kmem_cache_shrink (mm/slub.c:7006) 
[ 2.891706][ T1] kmem_cache_shrink (mm/slab_common.c:566) 
[ 2.891706][ T1] acpi_os_purge_cache (drivers/acpi/osl.c:1575) 
[ 2.891706][ T1] acpi_purge_cached_objects (drivers/acpi/acpica/utxface.c:238) 
[ 2.891706][ T1] acpi_initialize_objects (drivers/acpi/acpica/utxfinit.c:253) 
[ 2.891706][ T1] acpi_bus_init (drivers/acpi/bus.c:1368) 
[ 2.891706][ T1] ? kobject_create_and_add (lib/kobject.c:799) 
[ 2.891706][ T1] acpi_init (drivers/acpi/bus.c:1452) 
[ 2.891706][ T1] ? acpi_bus_init (drivers/acpi/bus.c:1438) 
[ 2.891706][ T1] do_one_initcall (init/main.c:1269) 
[ 2.891706][ T1] ? acpi_bus_init (drivers/acpi/bus.c:1438) 
[ 2.891706][ T1] ? rcu_is_watching (kernel/rcu/tree.c:739) 
[ 2.891706][ T1] ? trace_initcall_level (include/trace/events/initcall.h:10 (discriminator 63)) 
[ 2.891706][ T1] do_initcalls (init/main.c:1330 init/main.c:1347) 
[ 2.891706][ T1] kernel_init_freeable (init/main.c:1582) 
[ 2.891706][ T1] ? rest_init (init/main.c:1461) 
[ 2.891706][ T1] kernel_init (init/main.c:1471) 
[ 2.891706][ T1] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 2.891706][ T1] ? rest_init (init/main.c:1461) 
[ 2.891706][ T1] ret_from_fork_asm (arch/x86/entry/entry_32.S:737) 
[ 2.891706][ T1] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[    2.891706][    T1] Modules linked in:
[    2.891706][    T1] CR2: 00000000000000f0
[    2.891706][    T1] ---[ end trace 0000000000000000 ]---
[ 2.891706][ T1] EIP: __queue_work (kernel/workqueue.c:2256 (discriminator 49)) 
[ 2.891706][ T1] Code: f6 0f 95 c2 31 c9 6a 00 e8 19 49 0f 00 85 f6 58 0f 85 10 02 00 00 31 d2 31 c9 b8 b8 de da c2 6a 00 e8 00 49 0f 00 58 8b 45 f0 <f7> 80 f0 00 00 00 00 80 01 00 0f 85 0c 04 00 00 b8 a0 de da c2 31
All code
========
   0:	f6 0f 95             	testb  $0x95,(%rdi)
   3:	c2 31 c9             	ret    $0xc931
   6:	6a 00                	push   $0x0
   8:	e8 19 49 0f 00       	call   0xf4926
   d:	85 f6                	test   %esi,%esi
   f:	58                   	pop    %rax
  10:	0f 85 10 02 00 00    	jne    0x226
  16:	31 d2                	xor    %edx,%edx
  18:	31 c9                	xor    %ecx,%ecx
  1a:	b8 b8 de da c2       	mov    $0xc2dadeb8,%eax
  1f:	6a 00                	push   $0x0
  21:	e8 00 49 0f 00       	call   0xf4926
  26:	58                   	pop    %rax
  27:	8b 45 f0             	mov    -0x10(%rbp),%eax
  2a:*	f7 80 f0 00 00 00 00 	testl  $0x18000,0xf0(%rax)		<-- trapping instruction
  31:	80 01 00 
  34:	0f 85 0c 04 00 00    	jne    0x446
  3a:	b8 a0 de da c2       	mov    $0xc2dadea0,%eax
  3f:	31                   	.byte 0x31

Code starting with the faulting instruction
===========================================
   0:	f7 80 f0 00 00 00 00 	testl  $0x18000,0xf0(%rax)
   7:	80 01 00 
   a:	0f 85 0c 04 00 00    	jne    0x41c
  10:	b8 a0 de da c2       	mov    $0xc2dadea0,%eax
  15:	31                   	.byte 0x31


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241122/202411221731.acb4de27-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

