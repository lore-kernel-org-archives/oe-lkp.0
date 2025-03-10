Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D954217A2EE
	for <oe-lkp@lists.linux.dev>; Mon, 10 Mar 2025 05:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741584442; cv=fail; b=HCzn2ipxJj0ILS3nhdXAP9HjC9GQ5zXkGmuM6Yz+J7RhP49Jehr7bpWREljIch+Gg17cH5oUc5ECmN6gRxEL0kUPu2bdKbWYUkVIvHuO41zZ+PXccfjfVjwBTKjBbamg71Pm0kG0GuUe8KCzROapK4cjNKQNKYZ9lRaFCY1BTTc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741584442; c=relaxed/simple;
	bh=lNiW/8DMzrhgMnRU3Jb+wyV5EB1RkmedfICqRQm9RZ4=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=G5a6qHoRmSXciGbpGgBCo9ZAXuTvDMsUxWBLGcZNk+FofKJrQOgDsyb+ppNRLA7m4Z52ktikzm7oOexe2/xHw9h2Mk2d/+B4foKwyj1OETx1i52fPw/8QoiKYfx0wrBTLLxhEULqgOXCL5r8t2tyuJUqJJrVe44sPzzWc6GTqpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UnbiPAyH; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UnbiPAyH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741584441; x=1773120441;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lNiW/8DMzrhgMnRU3Jb+wyV5EB1RkmedfICqRQm9RZ4=;
  b=UnbiPAyHexFo6IxNJwmReHHONwgOrW5BoycPlk3e77ieg1zYgT0nktdq
   6BZTOOiVS6mu4xmvpi+XbnZ5hYugxyb0BPnNKoO/la0J7VqJNLy79tblx
   MmNrkSP7QjvebHFtcQ5f3IUUl2/xlpMy/qbHFm/G/2GqLLEv5rzXVL32e
   YmWL5w58CbNqaSUok7yQM/G08XxneQ7IcauwX8CRsE6KthGkbrL4sD0Az
   KC0hAXoloR3aq7lNn4Ibf9yFlBnD50t8BlZJY5mLkD8YPW8B3A8Hq16Pg
   ZmmnC1iIS3JgSVRyvCIvmLBGdDLyIVY13YdHORFvQJXGjbXFMSrr21K3Z
   A==;
X-CSE-ConnectionGUID: gVSG5TYDQiufdVI59BsKUg==
X-CSE-MsgGUID: FUfoVI3TQ1C4v9mEaTSZMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="41726737"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="41726737"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 22:27:20 -0700
X-CSE-ConnectionGUID: BQz6T3lBRdiPx47JLgx+Ew==
X-CSE-MsgGUID: sieFQNu3Twq2pxC1BDCWKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="124885811"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 22:27:20 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Sun, 9 Mar 2025 22:27:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 9 Mar 2025 22:27:19 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 9 Mar 2025 22:27:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R3OTiVEBmR2AWSpmTix2PqyCrAZ7qObG1ZOLvmywG52X0PnsthtCh08fWR/yI1s9k+c2h2QOwwOyRXNziEDpj52f2dN+NlHRULS6XRwb68pLHU4/iYmXPlt7Ega0TcC4HrLsXCXVnXqZ6VH3QhKvXR/zQKb7lAeTzi2QOb1c6jRMblAsdMWmh3HhAhCQ5S3VtKZ4wbcwJtprEgPwHlGIGkzzAwq2FcEEiZMgXMOQsJ3FfOkFbXpsVB+XoTvPvo4vMTDcPaWKGAFdCzVJKlp+pjie/xpLf2My38Ii6908thSFl0CDG/GWsSaeT1DlIh97LZNtpQ7MVV5eKiM3SIxCUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rmTVK5nIIGFvfs+Hb3n7yWdN1xomHoA7T9URr2nb1Fo=;
 b=RhJNxQd4eWiLvLt1fSQYLlppLsaF4/PGK2q16YBhrQQbHG36PlWeNE9/nHYdhlZDSvyOA1aFfxgTqDhciDSOPB8Tvh5aolrYRNvxz9bLrwdDlha5Ns9YYgRmtSGTVnC2tuw3odH7FdP9+lOJqP2h/IfWXwmw0hbCDA+6BZq74DAU2fZ0wXi3VAMqEQWo6tIz8WkxN6LGb1aJLFCMaXXU845M+ZhHi9CF0aTIf4pQtZ6uDidpZRPnOZHETd2MwMF3c1r97c63pyZ7FrSLEPEt6XUSRadSt2Q9sCe2R8tnrKUXr90Nc5e78JvmgLkhODzydWUXVp1XVaFIzWs+UnJziQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH0PR11MB4773.namprd11.prod.outlook.com (2603:10b6:510:33::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 05:27:17 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 05:27:16 +0000
Date: Mon, 10 Mar 2025 13:27:06 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Andrew Morton
	<akpm@linux-foundation.org>, Harry Yoo <harry.yoo@oracle.com>, Jann Horn
	<jannh@google.com>, Liam Howlett <liam.howlett@oracle.com>, Vlastimil Babka
	<vbabka@suse.cz>, Yosry Ahmed <yosry.ahmed@linux.dev>, <linux-mm@kvack.org>,
	<oliver.sang@intel.com>
Subject: [linux-next:master] [mm/mremap]  c1cda7af3f:
 Oops:general_protection_fault,probably_for_non-canonical_address#:#[##]PREEMPT_SMP_KASAN
Message-ID: <202503101328.442cc724-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0019.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::15) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH0PR11MB4773:EE_
X-MS-Office365-Filtering-Correlation-Id: 76ba1d47-fc53-4347-df6c-08dd5f94389d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eGAyZL8ctPaUJTicFT9+qdvEUelShdUB/2aVR5Z/zQrHDHpr1tqNubCQNQJb?=
 =?us-ascii?Q?ycuMLhrgjSWKSf6GlfjccdlcMweDBc8BMhaY5TEoox4ZJlSwE0pbI8g9JO53?=
 =?us-ascii?Q?3nlR0xzJIAv+BjrYFPmYC/xzm3fh+HAuEFnobZA/RuCg4qsQkrhfibAuX2QX?=
 =?us-ascii?Q?aQmyTbS1lkGCS5L9j07dWkSTqu7lukt/1dKp+HGMHo2vnwmaUQW0s7v1bRh7?=
 =?us-ascii?Q?kuSM8lfgCHC/43zONecWTbIUO+XyG196idl75rdmvZN/lzxV2Ak/1ax2nSFZ?=
 =?us-ascii?Q?dDVtoZiNgvk2kLN17Cl5ZQsfERbj9y/LkolUoIQFLY8ALXjZOcaP/yhG5mm9?=
 =?us-ascii?Q?pKvP7DOoj3Nwtx7nR1xneAOOIVkonsPu9waWhFYKAp4fpI9qebfDEitgQl8F?=
 =?us-ascii?Q?CPhaEO9dWqJPPWst2fUKFTt7bZpvxBMNITP1cgTPHcp3BBiEF3a9hqpm3OHo?=
 =?us-ascii?Q?1lFeRieOiHosl9hj51d4BaOZQqHu3Y6uZMtDA3PTyk3844+sB261uVXzE96g?=
 =?us-ascii?Q?08VFOMlfELPpaiuF9fklisVu/qqr9aatwGQoo1c2/ApYedJdUJRTiv/RBg++?=
 =?us-ascii?Q?S0y0wwp9ReW52HzSSx2k5exvHpJVSKCEvmG7vrQzL/HKRA+Lp5C8sSMVU6Us?=
 =?us-ascii?Q?jZf8DGLQh5Lzk6kX3H98j3lPwv+G04NuVuhQAaX/xkKsPLh+o12JGPupYlP2?=
 =?us-ascii?Q?WN1tEZgM4MpNAJmTdVjux7AtYxYQOI6b6qterQyyBqtKg+cDyWwAIua8NzHC?=
 =?us-ascii?Q?2hFZKDY28iMFDSMrTTRdAo5cTFwV/82s/WT4pEj0RBSavsXzAv7jpMcdng6T?=
 =?us-ascii?Q?l+GIuo/P2GtluF1TIR4wBDZ90IHIDcmGLYCHr04X6zh+lHRBKz1nuosaJajF?=
 =?us-ascii?Q?ctR+mp5Xyl/w/VjdqxQ3rnZfVaqS+btBgUbl6HgtZuK8pMjFFOytCsMrbthY?=
 =?us-ascii?Q?JEfYVj8m+RJYKlR3i2ytSgnPN1zoSjlsn9t33LDZSyO0yLT9Z4h0BhtEDYJj?=
 =?us-ascii?Q?8P7MmGFHq4NAiez+RYxz3uEB/MNARkc8YHrdaG+JvgIkVtKcJTxmrXGdTiPk?=
 =?us-ascii?Q?0oHNg74IvT3FgKm5R5NRrS8aXlsbKgYE8crR5ObGYFh0yKI/NJVnSCi8KKkN?=
 =?us-ascii?Q?xgjbDV6Aog6ss5OAUYmNZF241MfDKszg+LBoOwJ95cb6EZ4Y1sRPjxB9BLFj?=
 =?us-ascii?Q?Nx+jWXzQOHqYz9VDxfxxV/C5pNPwQ29ahmAWDbZiH2KayMjzAZ/gjbcJw5SW?=
 =?us-ascii?Q?rUSlMYRrbLho56eRzxCgdV9h6SuMHYv4+4j+sMl6lR4kMf+WVwyCm/YGJbz0?=
 =?us-ascii?Q?BCpW/DwKJBpJGOtgWv6gq2OXgZ3yB+TUUr4P+DuIsuGBZA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?omYMYZOdsNBayCJPOhpoDYrls+DnHPbPwT6wCEIoKFTXiUoLzJVL5HZzgqRe?=
 =?us-ascii?Q?u7505ih/1opvngyp0cvh06voJScKBmaB44+wWf4maMX056FRH3yAKQpz/A2P?=
 =?us-ascii?Q?5rRATHnRx6s+sIIJO6RZkAz+GOcN3QBaiFgT8Z3oTEELDWrpqT4gwG1s/MRd?=
 =?us-ascii?Q?fp3J5DlYW/bOUhFv76HjgvGPCesZaeVtw4FF7wz8d/rOc9sHQjpr2jOPTqoY?=
 =?us-ascii?Q?ibuhqYpkq51f05dlwcaT4uayGJd+UnHS1atvpnRrq4WpzH9jaD/ijgEomS3X?=
 =?us-ascii?Q?FhLB4/S6tyQv22/ssNWYW/G+/8rB/CvZbjkrTcc8aSKw68y5orvqm2Zog5Lq?=
 =?us-ascii?Q?kx2iQehb5wNJXcRbB0L2OExLwtfd949Z3Q3nXtEapISlGRsvqCCctp/DFDf9?=
 =?us-ascii?Q?A0ZLTyn65knQaAB4U/fY5GMFjK/VzcyPINjJ2/oz4N/IA29J4+MP1KZjWlTf?=
 =?us-ascii?Q?HtxqYNbij2BbBHUiNKucoRIXfhBVgiMpUK+o969SmWPMRH9a1Daa44iSg89h?=
 =?us-ascii?Q?IVeakAwbujFoXLkrIQsJx8n7abb3vgI2gPAU8yua2UY+NaCOFeUlBJGg3m16?=
 =?us-ascii?Q?cV1gLabpy+X8iuy2r6wAYzm36f6Yz2LrDOx4MEgZ84oMw2oH/FHquXCMshGd?=
 =?us-ascii?Q?b2yCUc58UQ7PJag0WvKc37Tu9nfeizGE0/c+3kSg57r53aEGREryitu4hCKj?=
 =?us-ascii?Q?GgpYHu3gISOSgSYdrgu7TmBXOs7V4rImXO1M0vjESYgOK8tFkXNGCk1Zsm9f?=
 =?us-ascii?Q?+VQ3lrUqRkkjUO0RWozWWcEpPlVHKLvkxIChyfS0FyqjHk3ZTmoDsVTCylmZ?=
 =?us-ascii?Q?6MuVV4OQ55OOwICmY6YT/t5n/jMk53cLIPClKEtmlOMqN71rWRmm/8c1sC70?=
 =?us-ascii?Q?AcZrDfm7lxSnsV15lOB+rI9cqdYO+nlESgAEBeEUMHRIN6+4Xx7pqc1fQCq4?=
 =?us-ascii?Q?LiSz02NrQo5HMQWjA555RLef/HW6KVEyNlgtDg+4z93RNBGPOUeTDaV1ci/K?=
 =?us-ascii?Q?br3qldcJvgqnE/Br50wQij5UjNh2L6dT4QCdmQbRGpSfqItfd8TZLvirAa1H?=
 =?us-ascii?Q?JcjdAFcqdLUvYbvUzApQaNXA/Uv7PcwgWxzqtkYkqBVQLTrq02Ao7Ud9v53j?=
 =?us-ascii?Q?6PJftpyS4f/lOZYY3UBowcaAM67cIPCXyJEQOhZt51dlrS/18cy/idl0Kd/1?=
 =?us-ascii?Q?ZYZVupZM0c/TqQHRX3bvCQzKYIbrgobxSjjKxGdiJjypt4+2ulQZM1Mj9Y+n?=
 =?us-ascii?Q?tSmkw1n7vHgrTKCE7nWYZBCvAd0/L/BWRNSbkxM2Qtmo+kzbFhix9DScfZRD?=
 =?us-ascii?Q?t1lVj4SPAdENUxYSTNyEnPcvN78/S88eFWLqqLw6u5ATgk3hNCBVBj6zxa8C?=
 =?us-ascii?Q?gahQzIF/Hkg6/i0K04Se9/m6kEJUBuSALee6JmzG99Up8PTsJGrd3EqBYy7F?=
 =?us-ascii?Q?7Yt/6NQ7eemS0CGpz1+BReWd/7q4L4iAnx/an+N181E3+F9NkBGfOUibCtOD?=
 =?us-ascii?Q?YuVm2Vl0lOKDMTAuhvGb6DbhNa4MSxuQLPqxoH4OrQBe6uCq8Rpy9IRv/7c7?=
 =?us-ascii?Q?VU5CWSBtif2qoWplhSVGjfaHMO2nJm6l+azJIg8qYfABvpR/2K2ptiUm+hI7?=
 =?us-ascii?Q?ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 76ba1d47-fc53-4347-df6c-08dd5f94389d
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 05:27:16.7929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gDDp70wdGusuuZVqTNpjUy7vZz7gJ/64FPXI3XTVfeuyVnTx0uxGvL0ya4x2uU7yI9sizWBbW6BIkDA5sOr5eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4773
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "Oops:general_protection_fault,probably_for_non-canonical_address#:#[##]PREEMPT_SMP_KASAN" on:

commit: c1cda7af3fc96879b4b2d217b1e8a4ab5fa70df5 ("mm/mremap: introduce and use vma_remap_struct threaded state")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

[test failed on linux-next/master 0a2f889128969dab41861b6e40111aa03dc57014]

in testcase: trinity
version: trinity-x86_64-ba2360ed-1_20241228
with following parameters:

	runtime: 300s
	group: group-01
	nr_groups: 5



config: x86_64-randconfig-161-20250305
compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202503101328.442cc724-lkp@intel.com


[  386.012648][T30778] Oops: general protection fault, probably for non-canonical address 0xdffffc0000000004: 0000 [#1] PREEMPT SMP KASAN
[  386.013652][T30778] KASAN: null-ptr-deref in range [0x0000000000000020-0x0000000000000027]
[  386.014339][T30778] CPU: 0 UID: 65534 PID: 30778 Comm: trinity-c2 Not tainted 6.14.0-rc3-00386-gc1cda7af3fc9 #1 678ccffbca77f1cea62114cb252a9002fbee4b41
[  386.015339][T30778] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[386.016126][T30778] RIP: 0010:resize_is_valid (kbuild/src/consumer/mm/mremap.c:1010 (discriminator 1)) 
[ 386.016591][T30778] Code: 00 74 05 e8 7d 4a 07 00 4d 85 ff 4c 8b 73 10 0f 85 f2 00 00 00 49 8d 7c 24 20 b8 ff ff 37 00 48 c1 e0 2a 48 89 fa 48 c1 ea 03 <80> 3c 02 00 74 05 e8 50 4a 07 00 41 f6 44 24 20 88 75 6a 80 3d b4
All code
========
   0:	00 74 05 e8          	add    %dh,-0x18(%rbp,%rax,1)
   4:	7d 4a                	jge    0x50
   6:	07                   	(bad)
   7:	00 4d 85             	add    %cl,-0x7b(%rbp)
   a:	ff 4c 8b 73          	decl   0x73(%rbx,%rcx,4)
   e:	10 0f                	adc    %cl,(%rdi)
  10:	85 f2                	test   %esi,%edx
  12:	00 00                	add    %al,(%rax)
  14:	00 49 8d             	add    %cl,-0x73(%rcx)
  17:	7c 24                	jl     0x3d
  19:	20 b8 ff ff 37 00    	and    %bh,0x37ffff(%rax)
  1f:	48 c1 e0 2a          	shl    $0x2a,%rax
  23:	48 89 fa             	mov    %rdi,%rdx
  26:	48 c1 ea 03          	shr    $0x3,%rdx
  2a:*	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)		<-- trapping instruction
  2e:	74 05                	je     0x35
  30:	e8 50 4a 07 00       	call   0x74a85
  35:	41 f6 44 24 20 88    	testb  $0x88,0x20(%r12)
  3b:	75 6a                	jne    0xa7
  3d:	80                   	.byte 0x80
  3e:	3d                   	.byte 0x3d
  3f:	b4                   	.byte 0xb4

Code starting with the faulting instruction
===========================================
   0:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
   4:	74 05                	je     0xb
   6:	e8 50 4a 07 00       	call   0x74a5b
   b:	41 f6 44 24 20 88    	testb  $0x88,0x20(%r12)
  11:	75 6a                	jne    0x7d
  13:	80                   	.byte 0x80
  14:	3d                   	.byte 0x3d
  15:	b4                   	.byte 0xb4
[  386.018009][T30778] RSP: 0018:ffffc900088f7a78 EFLAGS: 00010202
[  386.018494][T30778] RAX: dffffc0000000000 RBX: ffffc900088f7c08 RCX: 1ffff9200111ef89
[  386.019127][T30778] RDX: 0000000000000004 RSI: ffffffff848b6760 RDI: 0000000000000020
[  386.019764][T30778] RBP: ffffc900088f7aa8 R08: fffffbfff105c033 R09: 0000000000000000
[  386.020395][T30778] R10: ffffffff8146f920 R11: fffffbfff105c032 R12: 0000000000000000
[  386.021032][T30778] R13: 0000000000400000 R14: 0000000000001000 R15: 0000000000000000
[  386.021676][T30778] FS:  00007f012ebf1740(0000) GS:ffff8883aec00000(0000) knlGS:0000000000000000
[  386.022767][T30778] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  386.023585][T30778] CR2: 00007f012e8a2efc CR3: 0000000102319000 CR4: 00000000000406b0
[  386.024598][T30778] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  386.025614][T30778] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[  386.026665][T30778] Call Trace:
[  386.027160][T30778]  <TASK>
[386.027624][T30778] ? show_regs (kbuild/src/consumer/arch/x86/kernel/dumpstack.c:479) 
[386.028222][T30778] ? __die_body (kbuild/src/consumer/arch/x86/kernel/dumpstack.c:421) 
[386.028816][T30778] ? die_addr (kbuild/src/consumer/arch/x86/kernel/dumpstack.c:455) 
[386.029399][T30778] ? exc_general_protection (kbuild/src/consumer/arch/x86/kernel/traps.c:751 kbuild/src/consumer/arch/x86/kernel/traps.c:693) 


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250310/202503101328.442cc724-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

