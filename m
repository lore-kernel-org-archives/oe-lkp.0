Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B878B197558
	for <oe-lkp@lists.linux.dev>; Mon, 24 Feb 2025 08:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740386214; cv=fail; b=EjmaQIrBxBNwaDHekz5iKH7dDAvwoRewq+zBinI2nrrEqdRCX/zWWJ/Ij5sLkPhEAWml6LcsaDu4rvrSFTGR7kqvMNJ1jbvIZHAagT/KEjVmay+oNWz3oFGtHSvTP6N+cYioPAGk1xFIXmVroeVh1JRuGTQT2u8qciWwDOOIjZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740386214; c=relaxed/simple;
	bh=JgEShANiDxhmrfaIF0XXGWxByXdUdlycwbPkFhXqlls=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=g4/D63GlAfm5PDhMBApsXM2AnXIHi22gpj+x9n31M2e09Qx/f9UwZS65crjpUVrSlmOo4LGjvmZFXFoyej7Mr6pr4hWgz9OIDx82QLON7yQjG6vGfRXclsCEn2Z31YL7EJk2AImLC+LPbX5Eq1fJpE97HBRX2mzRYBNZSRkNtUM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y3ofHhlI; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y3ofHhlI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740386213; x=1771922213;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JgEShANiDxhmrfaIF0XXGWxByXdUdlycwbPkFhXqlls=;
  b=Y3ofHhlISO7e1abVx/0r4WuyyFrV9am743R6NoVuRMXItVx05S1EE2WF
   plD2y2JvEpLvX0Jhu4cssOfR5Ko2pqkQV+x15NS101wlrX8TUSfTb/AzY
   c7ftwpn4Q4AAy7x8/RVTOWHUWyZ5C4Zl3XzJ+XZGKG8ete0viZQvZuFVV
   WFLqGQXaiRBItGFqVYQF7Raf7+Q6IFLAJ3njAzy2u0M4tWNVQ9s5i14UH
   5fszEnee8pvipIFUxemDpUTNmtZl5NBH8IAXP75VydeY5uz3/V5jUab6D
   eWXI85ANnyBz3sbWsMpXQrx/TQvacuR6+lXNN8LtMKtCJGqMpePD7wfHY
   Q==;
X-CSE-ConnectionGUID: /FBd13Z/T8aEMM5pVtKE9g==
X-CSE-MsgGUID: sFQloOY0SZ+wGCZnks878g==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="41146492"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="41146492"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 00:36:52 -0800
X-CSE-ConnectionGUID: pcolgXhwQPuB7qgZtWHW4w==
X-CSE-MsgGUID: AmdkhvbuQMWBqWMbYrsmWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="115791917"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 00:36:52 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 24 Feb 2025 00:36:51 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Feb 2025 00:36:51 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Feb 2025 00:36:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ErnXMrmSzXGw4LlSvmF0Vonf6cMA2oM6RbcpyUVpsF9nlaDi+jYokJioD9k85ljSrjruKUh5Xszv7kqCwEPW/kCtxfqes61//te1ilDbNw8oHSCubQH0+TJ4vAjdL9f46vnb6j59LXO17mwtSGDIID9hOPP9+DOv1NyGExRUb+tTb176zaof6lX2YqEURctmx8TpmfEMriY6z5FhabHNLxBPwQOLhCGePlE9nFyJycYcHKfPHCMbUCiHgDSkizzrrFOcsjTMnxcuIy0hO+Ev5+PNh/JY++SfQWZMZcjIhn9KM/bYqOhsAUG/wbCx3c1V6dacXBeaXJjzMkYksyWYCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rcZT5sC3QDXh0FI5BPwvpfDrVly1nbPz8Qo9pk02q9w=;
 b=qjwsdkCn8xZnlsRNyaJR1hN1eOHcc2RTYm0zxBjOlPH7ROlksnd+BYnd66KL6WENzuQF6HOsuI61548x0kTPkKGLW4bcqTSbSkD5JBpELW0Ru/DvNqhGaNPoHviQjNjf+Rck/ZtDhOt7r+Pte9lemgXWSYlmxCZBbLA0oYR2cxvnxU4ct6iOWTuDxKtoYp48Ch/bTGoXmmspbSsQfKoHE3md/coQ60pKdTDqwazUkVs4URNp6G89rFBpfUk9iIhSqlj6OaUc3EN4ZnU7kdwPGY+RKlEeMJ7/girAiLt6uhmO8WnW//ou9ioj0C9wqGDcoYZy6gg9mNOTx/KrLl8iMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by IA0PR11MB7953.namprd11.prod.outlook.com (2603:10b6:208:40d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Mon, 24 Feb
 2025 08:36:26 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 08:36:26 +0000
Date: Mon, 24 Feb 2025 16:36:17 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Matthew Wilcox <willy@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [willy-pagecache:folio-mk-pte] [x86]  1c336f2de2:
 WARNING:at_arch/x86/include/asm/pgtable.h:#pfn_pte
Message-ID: <202502241646.719f4651-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR01CA0148.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::28) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|IA0PR11MB7953:EE_
X-MS-Office365-Filtering-Correlation-Id: f3d71334-fdcc-40a2-ff14-08dd54ae53c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Bz2hHpioPpr+blqYlyzUfbW3HuvLdCCTwdXdyLThrRKiXRYDC5TipSFfL0IC?=
 =?us-ascii?Q?1QsPlWumGb/H/+7VHHLPiIUZL+Mn0GARtqfQxRv09Kw7m3gwMVAHG6QvuwGW?=
 =?us-ascii?Q?kArOQgPbXMBr0uudEQp9b1/bnn8mQbZh5F95E1U4p4TXuFhmWtLuX9Zlep5z?=
 =?us-ascii?Q?Fbh0Nk25ybrMPyji6CSDXgYOdMTG9hQVVJKTtDqLWFYEGLzqBV0EZqc+olvu?=
 =?us-ascii?Q?24f1oY6GiIF5ROQX953qCcgQHsK+gOAyasutATEuzwhyviP55Oqsd/AfxE95?=
 =?us-ascii?Q?mMfLJvvjfZ7v1EchRbW+2DH0RYGsib6x5OjZjLQRNTG6GJsAGGdRVz+nLuW5?=
 =?us-ascii?Q?O+2CflpAUv0d5h2AsFTLVrjuxfCfUf0D9MPDkN/pSosTFShxDmUwoqLI6zEi?=
 =?us-ascii?Q?jabLnHzIBIF8dBH3XhK/iYkoAmMwIEnzRWD1FklV3sAdKsZkay71AgKSAanF?=
 =?us-ascii?Q?2ZtVzT4ebO8/2ftkv6iZ8TOYCxEz/B38KTcAE1BP4Vsixl6/EjFa1Wze3ykV?=
 =?us-ascii?Q?P7chGRwHN/Ahln370MAnUBIEMJPpFmN8AIupoG2nvDswIIXyx3SIV+iGJWyr?=
 =?us-ascii?Q?cT4IW8bZJvoO6tMyQn8KdhJ/Yr8XBAyGWdwWz9J6lTK6HrWYmTkwsqS/LktG?=
 =?us-ascii?Q?gV5qQzGbqfl2+VDqzbZsQe+zR5alt35qgboxR22TfG0Yv7IGcRol/SWmcTDd?=
 =?us-ascii?Q?sxuJuOnLJ4CJHKo4FSWtd+s6jVOOtJVT4zHW3LsocCDQNTOlKYEoYQsf0Gli?=
 =?us-ascii?Q?/qTpqbzIXs1ZTEdHGtxGMh4k/o/3QCVPK+Yej0Go04Dt+X7ze3pfAnCAAASJ?=
 =?us-ascii?Q?L1L/hYgGTgC6RWFe8JfpS3MXP+OaqrnI17nLpL/qq52V0jcVP9huo17IDegL?=
 =?us-ascii?Q?KMtwLtZbVP62R+bvGY3XBJjixkn/SiNzu3WAdYtQzqNS6kwaMFUArawNXQsB?=
 =?us-ascii?Q?nGCJugl8SrZ3XgbWYO3j4KKwq76vmSLF86uY46s6jy+p2sD44L2Elc50wZ6X?=
 =?us-ascii?Q?H2mzLNF1cP8T1Rq1sopOZMZOQUyw5ghsG7hcoaW/JiXDTrngVU8X91FzNQCT?=
 =?us-ascii?Q?j9yyQqN2hCtKUMBOGamwzBzmXCS1I6RHQpEd6DPY5Vi9NcjZpubZfZKNOTxi?=
 =?us-ascii?Q?4+5EwRTBBmmehy6KwK/8v9agMny7s1I9jiu0L/sHyC97rOtNIXm1cVyKbmS9?=
 =?us-ascii?Q?p0qZJribeWfZeg6Z2i8ZumgdYHvKoaGC3t5rr/rJw3QR/EnJ69E5OPMgBtph?=
 =?us-ascii?Q?XJ4unfWUGdteioRf915CDBLzfcAFAjqHh5PkTJtkZB1jxqkNYCFDdgzqijCY?=
 =?us-ascii?Q?QTS585d9uQTCItItl/3ao2NmdC72+hgpMANJ3Vjp/PJChg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XIgS4ihnUqM09bRgu3sI0r9d4ewSC4RHOMBMTsXMlVwFl/MRwy8VYtpt5MHh?=
 =?us-ascii?Q?KIsnP4snUPugtybwfy7KZCiIoD98gjDxe2Gni6e0BMSmu7W/x5UNAxkTJJen?=
 =?us-ascii?Q?qUfPTwU86aCqV3p3WGrfYXUYeffTChI94MMDk3YiuOmZgBe6tk9qVftwxH92?=
 =?us-ascii?Q?+MFQiToyEKv1kuI4wrowKDSF908l0ebqOBeG7fKFsJcgvq4qdl+NdFGgvD3Z?=
 =?us-ascii?Q?AuaiwM6CBmNFtEyrWmGES/ht43w/rF3tCwX1z95ebrujrM7/U5ULpAObsGqR?=
 =?us-ascii?Q?1ee5aKNYMt0Q5IW2nG/CgUF8mePgFObZl041wJpEw2J5pgSbXdqDUAm2x89m?=
 =?us-ascii?Q?JlViJBjrq2oWmza+7BfK2aJlJA9xHutefAkKAEp1utUBChO6FhTaMemBuc2Y?=
 =?us-ascii?Q?cud9nCxfkif3JoDnNBfAu/9gr5P6D5EFb0jobVjaX5o+/r2s743JL7HJHyJL?=
 =?us-ascii?Q?o0mhRmSWu1uQhe/U7/leng0oh8YyenbsOVBieXP5dvBiPHRtg9xet1/knB3T?=
 =?us-ascii?Q?reVuLDtlHvCSUU4pAJB9aPYIwqzBKe0abuKtVuNATXtvchkZ2wotwm4ckmO6?=
 =?us-ascii?Q?kD8FcOB1UJ0uubMvb3NpXqUby567QmxE/DUGVNZ01gdkSu552btnRdH9f9tY?=
 =?us-ascii?Q?UUOFvTFhOmmiVi45ZX/hGLAJFo23EnEOiUjaUjk7hMlC7W0/mJW++bYVO5sU?=
 =?us-ascii?Q?tNcY1OcL2SJj9ugYtI463VrWtHkTdupw5jYLr2Bm/xARDe5rc0tnO6VNmqJS?=
 =?us-ascii?Q?VGKhsR51ng5QB0J/107X90Dc6/nUcJMe2BEkbFdQ67PcFv/avoLntVfloy7X?=
 =?us-ascii?Q?vOTThuCwZtw5Cavw2BXBW6pKeyg06FoKy//6MFl/Las5Hj+ACXxveTzyk6G2?=
 =?us-ascii?Q?yZ3F5o/++v8CmQz7BjGHHg48E+WfRyYdSLUsIjNmdCM9B7Brv+9gGvPzIAHu?=
 =?us-ascii?Q?R8lBD71iqhFz+AMKjovQIrqg1pm+3qIbXVgDwV8GVpRP+v8hDvd49j7ez9r9?=
 =?us-ascii?Q?ZSPZ5aArKe2ZePFz9jdRgM3rvkWAEWlU71m47Ja2xFZN2aolaH4H1POrZN8b?=
 =?us-ascii?Q?3GqUJy2RkzrrawU8H/IIxS/nzcmE3FxX9dg79Qo5z+2jqXMaogdf+2UHTyQ+?=
 =?us-ascii?Q?jeCAC+fjE5FeKppFddmBa+Xh7hBggOuVuXt51BKCGqER5ua7DzzfGbXAgQax?=
 =?us-ascii?Q?R54L+bWkrPFUQ2N2V67JSVjfq3PXg/+45xnDNBGdwhrHIVa3sUmnxOhxfrky?=
 =?us-ascii?Q?e7DgFgt6eKkItFUpJ5AE95oflT4sNec9xk8gkDtiKKCzWl7we0YqESHq99GD?=
 =?us-ascii?Q?GDDSSSD6n5kUxJ52+VX3GR8rPDNmf+4KXCFA2+AZVIoLRAcGQMZUCYfwIwqS?=
 =?us-ascii?Q?UXe0RhTCD1CnwvfTzRUaoXvTkyvAHGacLJy09yAcQEqDfb9u5INQXRkIZOKH?=
 =?us-ascii?Q?8YFEPr3kG77x10IHJtijkYZ6LhkgxWJMr75IN0BjI4DfsRbA65njXrg4PQxp?=
 =?us-ascii?Q?hpWQ+rWIZM+kUaEWhEPrb0QziiAzBXOpY40zR6ZYm1W6KAmt0CoKkBthzwty?=
 =?us-ascii?Q?2YYTfgLPIFdH9/Cv/XiL4QjdEh8Y/Pa7jskb5f0NhGYPaPSj4PwJ3dEfnWLB?=
 =?us-ascii?Q?mQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f3d71334-fdcc-40a2-ff14-08dd54ae53c6
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 08:36:26.6106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mkQAEGO8OaUzOJAV+TTos9qVmJaGa7TQf651Ywu4+Hr1oPZLS9PrIQs4k1j1tjrTzQukLWLXvh3gzSJfTsm5cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7953
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:at_arch/x86/include/asm/pgtable.h:#pfn_pte" on:

commit: 1c336f2de2d87ce26fe7ee329947292fce7b4ea7 ("x86: Remove custom definition of mk_pte()")
git://git.infradead.org/users/willy/pagecache folio-mk-pte

in testcase: boot

config: x86_64-randconfig-161-20250221
compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+----------------------------------------------------+------------+------------+
|                                                    | 6592837980 | 1c336f2de2 |
+----------------------------------------------------+------------+------------+
| WARNING:at_arch/x86/include/asm/pgtable.h:#pfn_pte | 0          | 12         |
| RIP:pfn_pte                                        | 0          | 12         |
+----------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202502241646.719f4651-lkp@intel.com


[   13.732318][    T6] ------------[ cut here ]------------
[ 13.732954][ T6] WARNING: CPU: 0 PID: 6 at arch/x86/include/asm/pgtable.h:788 pfn_pte (arch/x86/include/asm/pgtable.h:788 (discriminator 1)) 
[   13.733826][    T6] Modules linked in: fuse
[   13.734255][    T6] CPU: 0 UID: 0 PID: 6 Comm: kworker/0:0 Not tainted 6.14.0-rc3-00083-g1c336f2de2d8 #1 a9379ea928a4ac78aedb1f1a61ea7c67abed1966
[   13.735461][    T6] Workqueue: events do_free_init
[ 13.736067][ T6] RIP: 0010:pfn_pte (arch/x86/include/asm/pgtable.h:788 (discriminator 1)) 
[ 13.736670][ T6] Code: a6 f6 9f 01 01 e8 2c 06 05 00 0f 0b 48 8b 04 24 5a c3 cc 48 89 f0 53 48 89 fb 83 e0 42 48 c1 e3 0c 48 89 f7 48 83 f8 40 75 02 <0f> 0b e8 6d fe ff ff 48 31 c3 e8 96 ff ff ff 48 ba 00 f0 ff ff ff
All code
========
   0:	a6                   	cmpsb  %es:(%rdi),%ds:(%rsi)
   1:	f6 9f 01 01 e8 2c    	negb   0x2ce80101(%rdi)
   7:	06                   	(bad)
   8:	05 00 0f 0b 48       	add    $0x480b0f00,%eax
   d:	8b 04 24             	mov    (%rsp),%eax
  10:	5a                   	pop    %rdx
  11:	c3                   	ret
  12:	cc                   	int3
  13:	48 89 f0             	mov    %rsi,%rax
  16:	53                   	push   %rbx
  17:	48 89 fb             	mov    %rdi,%rbx
  1a:	83 e0 42             	and    $0x42,%eax
  1d:	48 c1 e3 0c          	shl    $0xc,%rbx
  21:	48 89 f7             	mov    %rsi,%rdi
  24:	48 83 f8 40          	cmp    $0x40,%rax
  28:	75 02                	jne    0x2c
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	e8 6d fe ff ff       	call   0xfffffffffffffe9e
  31:	48 31 c3             	xor    %rax,%rbx
  34:	e8 96 ff ff ff       	call   0xffffffffffffffcf
  39:	48                   	rex.W
  3a:	ba 00 f0 ff ff       	mov    $0xfffff000,%edx
  3f:	ff                   	.byte 0xff

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	e8 6d fe ff ff       	call   0xfffffffffffffe74
   7:	48 31 c3             	xor    %rax,%rbx
   a:	e8 96 ff ff ff       	call   0xffffffffffffffa5
   f:	48                   	rex.W
  10:	ba 00 f0 ff ff       	mov    $0xfffff000,%edx
  15:	ff                   	.byte 0xff
[   13.738902][    T6] RSP: 0000:ffff888100ab3ca0 EFLAGS: 00010246
[   13.739496][    T6] RAX: 0000000000000040 RBX: 0000000132477000 RCX: 0000000000132477
[   13.740202][    T6] RDX: ffff888132477000 RSI: 8000000000000060 RDI: 8000000000000060
[   13.740915][    T6] RBP: 0000000000132477 R08: 0000000000000001 R09: 0000000000000000
[   13.741687][    T6] R10: 0000000000000003 R11: ffff888132477000 R12: ffff888132477000
[   13.742266][    T6] R13: ffff888131fc63b8 R14: 8000000000000163 R15: 8000000132477163
[   13.742746][    T6] FS:  0000000000000000(0000) GS:ffffffff82665000(0000) knlGS:0000000000000000
[   13.743292][    T6] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   13.743693][    T6] CR2: 00000000f7651ef4 CR3: 0000000132447000 CR4: 00000000000406b0
[   13.744178][    T6] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   13.744657][    T6] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   13.745141][    T6] Call Trace:
[   13.745349][    T6]  <TASK>
[ 13.745555][ T6] ? __warn (kernel/panic.c:748) 
[ 13.745820][ T6] ? report_bug (lib/bug.c:201 lib/bug.c:219) 
[ 13.746098][ T6] ? pfn_pte (arch/x86/include/asm/pgtable.h:788 (discriminator 1)) 
[ 13.746368][ T6] ? handle_bug (arch/x86/kernel/traps.c:260) 
[ 13.746642][ T6] ? exc_invalid_op (arch/x86/kernel/traps.c:309 (discriminator 1)) 
[ 13.746937][ T6] ? asm_exc_invalid_op (arch/x86/include/asm/idtentry.h:574) 
[ 13.747271][ T6] ? pfn_pte (arch/x86/include/asm/pgtable.h:788 (discriminator 1)) 
[ 13.747532][ T6] __change_page_attr (arch/x86/mm/pat/set_memory.c:1673) 
[ 13.747850][ T6] __change_page_attr_set_clr (include/linux/spinlock.h:391 arch/x86/mm/pat/set_memory.c:1808) 
[ 13.748200][ T6] ? set_pages_rw (arch/x86/mm/pat/set_memory.c:2437) 
[ 13.748482][ T6] __set_pages_np (arch/x86/mm/pat/set_memory.c:2433) 
[ 13.748770][ T6] set_area_direct_map (mm/vmalloc.c:3255 (discriminator 2)) 
[ 13.749085][ T6] vfree (mm/vmalloc.c:3293 mm/vmalloc.c:3372 mm/vmalloc.c:3347) 
[ 13.749344][ T6] do_free_init (kernel/module/main.c:2940 (discriminator 3)) 
[ 13.749639][ T6] process_one_work (arch/x86/include/asm/atomic.h:23 include/linux/atomic/atomic-arch-fallback.h:457 include/linux/jump_label.h:262 include/trace/events/workqueue.h:110 kernel/workqueue.c:3241) 
[ 13.749953][ T6] process_scheduled_works (kernel/workqueue.c:3317) 
[ 13.750295][ T6] worker_thread (include/linux/list.h:373 kernel/workqueue.c:946 kernel/workqueue.c:3399) 
[ 13.750571][ T6] ? rescuer_thread (kernel/workqueue.c:3344) 
[ 13.750858][ T6] kthread (kernel/kthread.c:466) 
[ 13.751100][ T6] ? kthread_is_per_cpu (kernel/kthread.c:413) 
[ 13.751404][ T6] ? kthread_is_per_cpu (kernel/kthread.c:413) 
[ 13.751705][ T6] ret_from_fork (arch/x86/kernel/process.c:154) 
[ 13.751971][ T6] ? kthread_is_per_cpu (kernel/kthread.c:413) 
[ 13.752277][ T6] ret_from_fork_asm (arch/x86/entry/entry_64.S:257) 
[   13.752580][    T6]  </TASK>
[   13.752764][    T6] irq event stamp: 26025
[ 13.753014][ T6] hardirqs last enabled at (26033): __up_console_sem (arch/x86/include/asm/irqflags.h:26 (discriminator 1) arch/x86/include/asm/irqflags.h:87 (discriminator 1) arch/x86/include/asm/irqflags.h:147 (discriminator 1) kernel/printk/printk.c:344 (discriminator 1)) 
[ 13.753602][ T6] hardirqs last disabled at (26050): __up_console_sem (kernel/printk/printk.c:342 (discriminator 1)) 
[ 13.754155][ T6] softirqs last enabled at (26066): handle_softirqs (kernel/softirq.c:408 kernel/softirq.c:589) 
[ 13.754706][ T6] softirqs last disabled at (26059): __irq_exit_rcu (kernel/softirq.c:435 kernel/softirq.c:662) 
[   13.755252][    T6] ---[ end trace 0000000000000000 ]---


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250224/202502241646.719f4651-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

