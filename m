Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A43E337692
	for <oe-lkp@lists.linux.dev>; Fri, 23 Jan 2026 07:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769152900; cv=fail; b=b5gT/uPzCUaC6wRLMtKdQheqyqp5pzqDA2HS7y2AP2uGbGgqDLkELOf0wHS9EROIExcMWW26FPsmM78c2UvrbPN1brCKwbBGcFqqO46Of/CNktWa4Os3pIREfbB9Yo9IBCO+JrA2h3eiZk0CC86veteMRSvanQVlUxnm+rjgMSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769152900; c=relaxed/simple;
	bh=nQHgT6qQ7M17QBMcwk9eLmzqmzrizGCi2jqK12XHzl0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=mNwq4iCfD+DpcpvF7oIYT2WZebFqmm5KKYaQj8zg/RsDAD01Ud4rSlESU0aFkygAZJkRaWM9PTRXsFWLXpQxlOq60uTMDtmOr1PllTtNyuULMPe0MCqs0uc6XwapE1c3Per1OOs/BUBjbxdMrwRdpBeyGhw2dRe+AUWPneQsfuE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IgLekQZd; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IgLekQZd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769152899; x=1800688899;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nQHgT6qQ7M17QBMcwk9eLmzqmzrizGCi2jqK12XHzl0=;
  b=IgLekQZdNgDfQdWU0uhqEu6IiyM3P100mBGZ7nYaqYkIhD9+8q31+n85
   /tBt6vO1fjnW5t7GRyOmMTUKW+VcQF4mrersr2aU/OZDoVwW+7n4h8f7T
   vJCdtsQQCTr+cH2YthYLk9z9zONzsprMEX2rSA/TMKqq3frEDtqeZ5S3M
   UdDgE91JHU98+PeALOmeHqfDIecsZYkUFaTYGgkxYrlzlUkfnSNx+e9J0
   8scU8JVH0y8hd8cxCFaG3E2YV9jte4n+WPJCfcq3Wc18J8sQR2dO4XVbr
   B7IJiVvGYQPHVVp4gXowcf01HxFZbCUBBWU9olFubm9p9MIoZh1u7F0cR
   g==;
X-CSE-ConnectionGUID: FwQqqP5yRkKfvkp7iLkMpg==
X-CSE-MsgGUID: esUYoHqZR1WN6NPknS3rDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="70314026"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="70314026"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 23:21:38 -0800
X-CSE-ConnectionGUID: brqrVMI6SvqRJ7u7OAOeMg==
X-CSE-MsgGUID: sTT9i/7jSpqsKl+7xQmAEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="207218795"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 23:21:36 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 23:21:35 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 22 Jan 2026 23:21:35 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.66) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 23:21:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vdHFGZtFaacpJlhWgnQ9yyQdWEHpnH8zESR4BcjC1KjyuCVlyB7/2am/FlPNxxo9JNWU74EGTj1kKZ0yhmiaBYikGcyjg2L/lGUvehGEmJXVPO+ofUbVRMpeoARQdHkf1ayWH8mp81suY7H8GCUXIrzXA4trzJwKxwYghNa0MgAulYPQNFcdSHxMy0KZQjtZof4zEgVmWYVToaFxWETxjdLfClKGb5j4DYuV6GSdZHcyJbu2k3sTxCEKFubsrFRbQg1AH/VSM8H91CxUciTAT0GuybYYn//kjcU+dI+fJeOkV3VajJdjN/Ns0DUU8IIl3t7fP/qhSCnTinZIzG/9Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8w4VRMslBCislIISK6BpZk4oAYrhWPJeDx0dcvrLhjk=;
 b=bW/U+JNQ03D/VxG6m0fwskxTPmJDwYC2KOSLjb0KJ2krlCWF2YUFlBuDQlfAEzy2UveKqavGaU70cPgeFmTKyM4e7m6/3iUoZcdwnbKcAGo73XEFZ5wllralJAMXfIHUfqD6q91mdTUH0fQdG+gGRAzsXW3Sh13MZ6TfWDfpn+nwaqenxiF1l5tYQvBk/OkGFSReev6sBC/OdMNB474MD79CMYxgwHdgGJaN/rlLtR8ug19f6IFN6EAFkZG+tivJnFttAlWjL4Y9qMr9i98PdtPS751jzr5sZmNV5mVfIs5G06FZVLZOYeahlHAOZ6rKunvPZ3jV4ZFNyKxHaqoCIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SJ5PPFEC87B8781.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::85c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.9; Fri, 23 Jan
 2026 07:21:28 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 07:21:28 +0000
Date: Fri, 23 Jan 2026 15:21:19 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Harry Yoo <harry.yoo@oracle.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Vlastimil Babka
	<vbabka@suse.cz>, <linux-mm@kvack.org>, <oliver.sang@intel.com>
Subject: [linux-next:master] [mm/slab]  4fad56bdb6:
 BUG_kmalloc-#:Padding_overwritten.#-#@offset=
Message-ID: <202601231457.f7b31e09-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: SI2PR01CA0032.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::18) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SJ5PPFEC87B8781:EE_
X-MS-Office365-Filtering-Correlation-Id: 45c50c25-dd49-4af4-98d6-08de5a500631
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YdWWwTnyaMvR3Hpb3bwcnOxgPjL9mSVoqTtBKx4j8BigTvygGCMlpnOsxkbz?=
 =?us-ascii?Q?O5riCTV2ckFfK9OIxAt8e/VrEmA3c59ZW8mXvv0KInisRNBVns65LI1BBUG5?=
 =?us-ascii?Q?JAtWtQY84pAggzTnjEy7B0wbsGTA8ZmxX9gvo+JXjGr8d5NTudd2yFK+kPy2?=
 =?us-ascii?Q?GG9zIruSis5qdpvYVyQ/vFqJd11bH44fV/jenMx8w6ydcBPt7gOAkOy1uAFM?=
 =?us-ascii?Q?P2wgAdHtfC5Z5TWJxEjGg0g7PTEuGSKye7fbZEuMG9hqQe47BuRAvp8a25LR?=
 =?us-ascii?Q?GMHWpP2j/aXK1htnYr7Uq8NF/4drHOxEarWCLr9ummkxgUMklvtVzS/eY0gm?=
 =?us-ascii?Q?70y5GgV6/EmPi0HOY9jzaCjvl7TmzNvcbOCR6msMDKHFAG8HnmgbmB03lLlV?=
 =?us-ascii?Q?Uk9P6+P4QYB5xs8i8xbxonEzEKWh6GRU8AJ2T6QB6UyDKbxI+72tjHgv5VR6?=
 =?us-ascii?Q?OV5pS10WoC4IN3Vdn2Epe0ZBofBZDiiC7vWz9kzWqKVlVHCPFNLRfypL3Zwi?=
 =?us-ascii?Q?HnN+lhbsTeSwyQa86d78FIN2Y0UMRGPXB0lmmizllwlL2YaPiZ7+MYhG1Hfd?=
 =?us-ascii?Q?WP+/31tGm7om03r3s4fqfrZkHEsJ8jgCCgExQmvQhG0zlPf0vVeGxIw4enYg?=
 =?us-ascii?Q?KUphLCgva9p3dfxWt/hwtk8H2jbb0SPE9Jp1ratRnaiaQjzGRhI/oDSYlTBa?=
 =?us-ascii?Q?gYbD3468RU+PeeHynjXzWgSDMAJQwZhbZVduUFTaYA9J7q73JmyfkKhicekD?=
 =?us-ascii?Q?/5FTF5hs/wTt/86qylcc53PcOeEYETHgtUtoQ5Elq2qWMVArXoNy/Mt9+ral?=
 =?us-ascii?Q?kdqXfXP7yDi2YkckP63uEEI2KOOGzhKjsAJV648a+6Pbe+bOcHbyj6sOQpSs?=
 =?us-ascii?Q?ZFTR+j1FOy8XqSapm8E/RR0ox4eS2vbzmZ/cNqAi47sJU07Q+ZG59yQ0bhji?=
 =?us-ascii?Q?JyS9/IqsvIpylBRC63zcRQzyLQFFCRe5mzsfr9Un55Y0Wm1sKp9/l3gGXfcu?=
 =?us-ascii?Q?9pgmv0vLQ9rwU+ItQjf6k30gam+ewpB6N/5oicrCAjSEAxt/sWbyPPglqy6G?=
 =?us-ascii?Q?l73xpyVWqjplB1bgRHe5llpFAmRd2cFf6G7ruSxsclr7KeR2DIvffqA1s3cn?=
 =?us-ascii?Q?cBZZI10ciPYEfeZ7vaDpIrGfSFx3OgnTpVzBize79rN5lNQc+EYkx69rPhzJ?=
 =?us-ascii?Q?Od8AyAAzJ6Nthn6i/ZhCFxYIwmJavqFvVPVsgTzYJC6mpQB/S67GgSdUJoDL?=
 =?us-ascii?Q?ZhWiNzCplx5Q2l2qYgEShHTlY67fZQA/CKNoDG4yhD7yBzVD/7aIcGbC1Js8?=
 =?us-ascii?Q?BAJvxSs52mj4niZollN0ltfeKrGIMHoNIu7lmird5UkVeEoh/644O+1f81cH?=
 =?us-ascii?Q?2eCci1w8xZMI0j0eluJLR48mkBCSnqcDJNJb7b6tQhAXPokqYB/oTu2kW6wf?=
 =?us-ascii?Q?xX3b/u7zSEOfcgOjIVEo+3J15URpYKsCZ0AbR9IMXRjKaIQX2rIc0Xt4kT5W?=
 =?us-ascii?Q?hkQlM62fvhoBYfOo+ru85SE+xAYAorQr/S8KlXLNo0dOEd8iXsb+ldPcLueh?=
 =?us-ascii?Q?R7jNTeZfB6aqvos1TQl+dk/CjlDgmeYXFQQgHP0gKG+BHyLJH70c8GDPgOuN?=
 =?us-ascii?Q?YCxYcN0A+EaxeY35uebicL8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xTtHc/l+THl87gw/YIXslusHj3yWoRWijoU1wMe/Nv+EFL+L2TzGnsSJ5YOf?=
 =?us-ascii?Q?XxWWsOa9U8ZEvPzttO7yhyJLBLPFT8nZxiV7IUc5m0EaNVYD7ozyVeJ9c/Gb?=
 =?us-ascii?Q?/IJmq4bYDWVKjmJxYT1e3So8S/9zVqG0aQP11MekwAZLH7SwLdq/mNlgs8lH?=
 =?us-ascii?Q?blsMclFm/4miMjfZNI3qGw7QkVuGQFMoLyKNiqqAHjMHJS0yQU+x6w/uDqiD?=
 =?us-ascii?Q?CLXmVjOkzkrV65sC3A1c3ag0DzeIxo09cWmKb/V1iNDl1mdul9ljdLRUjEK5?=
 =?us-ascii?Q?FCp0vnfv4YG2H9STxzAvea2l0m6iOkVorFhTlPY9KFkS7zuoQ0BSKHAtJAeI?=
 =?us-ascii?Q?DL8Y1qtQFGrEEndWIFtSt8mHWU4tOznFPZEvfY+27Z+3poTPb98vW8CgAdNB?=
 =?us-ascii?Q?7glSXJBeLynxmggRPEJVlNC5bx32u0yxrewqMejqpwvYIOPI3cupZhqkTYM8?=
 =?us-ascii?Q?TJWf3EuNqWrUPR8xtM8J/GhROfg8Vc+pNAhayW64DFzgyqbTC7hzSJZB44Ya?=
 =?us-ascii?Q?fHnMR2kVqu7mHXljzf6njvJ7QVmwQFc8BeznSWGbBJDnWqfWaiB/BvL7eB4N?=
 =?us-ascii?Q?6dGuZD13yMWcqrf91smsBjUCtfNputqhALya1rVkcxt99OCYLMuC5sUhxeBm?=
 =?us-ascii?Q?Q9bnWY3kE+lBFo6tYx0r4oDW9d4IpAQGb7THCNCVoiTv/2OX6Rdgy18kzW7s?=
 =?us-ascii?Q?NMrk5Lv9zMrOM1eNXttX3qTKNQ7/YqTdmEMN+TY6ZKO4Nz3umAHSenjru+r7?=
 =?us-ascii?Q?Fi/MKRMlgAizBkXLr3KBiuCETgSTCBdnnFRX33TtngFpsEcjAEKOzQ9M3jIX?=
 =?us-ascii?Q?dHhyPE+jHT+qc/rHtYcgOfNMA1DmCea5v2QrF1MY3ypkWF71vVBqRbAf7TCX?=
 =?us-ascii?Q?DYNH6GEAC1smd2Hs2AWmKq2f2YeQZYRM+NNyQBJ9NsnQmUkFFC6k6hCn5elK?=
 =?us-ascii?Q?Zkr8cRNugH57BIcHBboznMXHMd8jIayg/uUipiSxmDqlu5smrtXGzy8Rn0SE?=
 =?us-ascii?Q?xEeuwTAN1rzaWID/s6xIb4C8lINUPIUz9NQqA6b3itTNvpjeP7TVLgTvFXZF?=
 =?us-ascii?Q?OgJBoGtcJoaU4koq8SsfC8JpSbNRYOCvPnbn1t0iTsUo/HsKBqsM08BOOpeb?=
 =?us-ascii?Q?JMM0b0wMezm/TauC3DCT6g/P4ZdhdA0nMq+zR52ouqzC0OmXyo72Wtn3cSFu?=
 =?us-ascii?Q?PRShK70DQm1CypXw0V2NT7INgjHtAeuFICXN4iuCEkKbxH3O7kGRTP/+aIRh?=
 =?us-ascii?Q?LEgQ5BUpVc0l2C2wzpzi0u7yBa9/K2Zl2YT6l+wXn8ip6zkYr/Ro4BhHQ2+P?=
 =?us-ascii?Q?EmG4ICI4Qu9++XMsAJt3upPwZitn0ZmUjxmDXECGLuu+sYtMaMgVdJ014Mdq?=
 =?us-ascii?Q?FrrX/PXVitcTcS8OZxNdmionn6034XgrHaxHPv9OpAdwQ4uk409/tZytNSZR?=
 =?us-ascii?Q?s+n5CRsFxcfBoPn3B/Ez9A53BagcmhOKn9pQsrYdrnnQQwbKZgSdClUx0Q28?=
 =?us-ascii?Q?JUU6vOyYq3DRQMZ6bNTZghB5drZnu0F0JCfHh26/lanEG66yfM70XoGFjfIB?=
 =?us-ascii?Q?1Y8HBiLRez+A8fp2eJjYrvyBxmuTwOmdjbdUuFMttcjB6k7MfUhgoFHRu0/5?=
 =?us-ascii?Q?21ptJQ0o4M4zEffkBP7VqppyCtstorW7mLic7iA06qOvsIJC0WnUm5Y8j1+e?=
 =?us-ascii?Q?kAWhvE2b55RfrylzG4Vkba8nPiKnMzlt66BWG+MTKhKdAeBPKHN8MofqlgvB?=
 =?us-ascii?Q?9x+l0rJikw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45c50c25-dd49-4af4-98d6-08de5a500631
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 07:21:28.2344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ufJUam57AIkx2ze5B9BNAxBvvan4CpvEqAiWQBTgZbn2C/UGedM+teXMJ9zC2rFfPv8iE1ILkpkGv0IK4nCv9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFEC87B8781
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG_kmalloc-#:Padding_overwritten.#-#@offset=" on:

commit: 4fad56bdb6b4c4bc0ea2d919df1ae4eef7b69919 ("mm/slab: save memory by allocating slabobj_ext array from leftover")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

[test failed on linux-next/master e3b32dcb9f23e3c3927ef3eec6a5842a988fb574]

in testcase: boot

config: x86_64-randconfig-012-20260121
compiler: clang-20
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202601231457.f7b31e09-lkp@intel.com



[    3.646661][    T0] **   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
[    3.647660][    T0] **********************************************************
[    3.648834][    T0] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=2, Nodes=1
[    3.651537][    T0] Kernel/User page tables isolation: enabled
[    3.653242][    T0] =============================================================================
[    3.655191][    T0] BUG kmalloc-192 (Tainted: G                T  ): Padding overwritten. 0xffff88810006c028-0xffff88810006bfff @offset=8232
[    3.657925][    T0] -----------------------------------------------------------------------------
[    3.657925][    T0]
[    3.660319][    T0] Padding ffff88810006c028: 00 00 00 00 00 00 00 00 30 c0 06 00 81 88 ff ff  ........0.......
[    3.662476][    T0] Padding ffff88810006c038: 30 c0 06 00 81 88 ff ff 00 00 00 00 00 00 00 00  0...............
[    3.664649][    T0] Padding ffff88810006c048: 48 c0 06 00 81 88 ff ff 48 c0 06 00 81 88 ff ff  H.......H.......


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260123/202601231457.f7b31e09-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

