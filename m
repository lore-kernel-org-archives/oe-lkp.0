Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A551204687
	for <oe-lkp@lists.linux.dev>; Thu, 27 Mar 2025 08:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743063662; cv=fail; b=bBfY3PJNOFg8G//F5XmHeik+UL4K4ika8eowtGr/tO7LhYRPxowdWd0h3s9i2QQLuBWuxfiZmgs5es27du923L0ANOJu+FfUKNLySHxAaKGjDoSR6D1xPVJhNsBOoKZ/v4V/3eHUTYaZSdci3xutwdjXZz2391Ld9yoPdErbQFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743063662; c=relaxed/simple;
	bh=RJ8+861xFrHHxsnHS8Ix0reNO9Q2QLwHy5PBMATlvYg=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=nF4G+Ol4taiMvLLy06weKnb2Gn2koxibf9dl3iGaXX6Gh2qPFRxtNaAFhiwxGWdDUA9HvIFL1tbGuq5eqaeGPjSnW07mplD8MK8rOwZc1c6XbW5jCjWAplsC/mzN9d01yJY+VXPRQlxYWkuHK2v9Vv4LgT/NkzpdFmZeZDTgPAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c9jHk1V9; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c9jHk1V9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743063658; x=1774599658;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=RJ8+861xFrHHxsnHS8Ix0reNO9Q2QLwHy5PBMATlvYg=;
  b=c9jHk1V9jeaEcKU0yLtWs18rPrdMyNubV8H1AR85qjDS3Hh2oy6ppogD
   EyGjoclSjg6QJIGUwQ6vHeBaFg+7fymP7mQgMY76ycFM0pEuoVbH7RvYM
   lFG/XyVZXgnatHj9/qJL2FV1ZB+tfJN0E2fBDLri2ioWW0EwgMVUbjmPV
   +c1/Sg6rEIhTBNw0zbuSqyt2rFLZ67TgPb0TqGWC+YjKtl53VvRGW//cT
   ZfFApCECiqauHcxOBcG8RqWZnlxErW/GtLOMvlCnp/21rv1Zx1xltIY45
   gcW0+E8nGGK7lhP59bwskQ5y1wCX22VkfYgXYcNkfTimWTBI3KFz0N/Ut
   w==;
X-CSE-ConnectionGUID: SCgXJQmpTNCsO2k89h7lng==
X-CSE-MsgGUID: mMNGvMBgQt2+l3c42GO8Og==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44504507"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="44504507"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 01:20:57 -0700
X-CSE-ConnectionGUID: UGETy6dBRQK6HHWNzxo/dg==
X-CSE-MsgGUID: MMtik9FMT++E7B+ZdVqzTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="130130935"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 01:20:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 27 Mar 2025 01:20:55 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Mar 2025 01:20:55 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Mar 2025 01:20:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A/bcj2ayqVZ1K0WurGot5C8Ac3PEFJGmXEBDQ0fZ4dLo40gFNcWCV3VFY2OxXGXrHxPSE9lThoygWzciJ3oKh0L0f5HF09FFbGnNoWbQ3AmfC/GMv6FqrXzPX5jrEuW4xAk1kDhlTIYvcVSuTc9uRjQmnSzx/QInc6KlPTLra0ZPy3CFhEjF8GpwvHCIFzksrIzmhTn6jdmNSC9YWg3L88qoRtjgyRTG1MqpkLqHuMjoJX/7NPSUw1wwEZ003QqIkSKFKzrhUHiQ2ElxRdPuFbeGU2AHwW4VMwfdq+PCZtiqZZgEfHFgnOv4CMHSNR2WRDjLKsu6T3AVn4suJSXWig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KeOImhumqBkMD45747AX+OYxXA6K1Z1NUHqDfnmbgiM=;
 b=kkkX9ZxKTVw58ZAcT9pw2AwJ+gWMQ2rAmUqrMidsQxP3b0dFkvu9H85C0j0WThAEw3478iy5itV6pcYqtaJsSy1AdPoirfxtKKeqkO2/c1ZSIeeY/0YFFU/qLYx+IHqJ2lTl/hmXlL/nxEbx2OkDErs3PLl/Zw5y+4pz2xcHphrScLERUakd/dBN32eOZ70AD3TxD7P3vP66cqqmjaJiTbCzVGQnkNQmJh5B1ajWEXdzo1kbn4FMJBsMTn6j1QiAtucdrs7ar93nkqje8ISvrMchkOXNprcb4q0u4wuO5tkeWx6VuliZbLTFYlzgdwBSkJlM0L+H86dyc/MiGfz0hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by IA4PR11MB9129.namprd11.prod.outlook.com (2603:10b6:208:55e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 08:20:51 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 08:20:51 +0000
Date: Thu, 27 Mar 2025 16:20:41 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Johannes Weiner <hannes@cmpxchg.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Andrew Morton
	<akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, "Brendan
 Jackman" <jackmanb@google.com>, <linux-mm@kvack.org>, <oliver.sang@intel.com>
Subject: [linux-next:master] [mm]  c2f6ea38fc:  vm-scalability.throughput
 56.4% regression
Message-ID: <202503271547.fc08b188-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KU1PR03CA0036.apcprd03.prod.outlook.com
 (2603:1096:802:19::24) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|IA4PR11MB9129:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f0e765d-034e-4c4c-89b3-08dd6d08492b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Ft3cPqL4R/MNe5HGYItwWj/t8UTpu8zHHk3C3jbJsNbitsNe96ElYVQnFl?=
 =?iso-8859-1?Q?7gu2bPw8E/poybjaVat1ZlwfJ92fO7XWZ795n8d4Ur2d07idfXCcb/aLPI?=
 =?iso-8859-1?Q?u+w2eppYsZ7UsSDT5bZSoeAnK+XQ3qITzCqK2GD79XAIIxLdVSLcFhU4j1?=
 =?iso-8859-1?Q?0d+asogaEoplB4uyTV7nLCayc2YNRijcoDqTX3M9JdjEkflOKcJfcqpU2N?=
 =?iso-8859-1?Q?asKCylWWy484b24FVKrVZlB7umVcQJPaUigHWDBeONVKIAsFRutDlM8SsE?=
 =?iso-8859-1?Q?RqxCqJywciNwuWISDUzhW6zm3YIbBgGQ27hZie8LyX4b3cJ4BzxIzL7EDJ?=
 =?iso-8859-1?Q?VnRAr0SNDfje23Abt51h4pa5NwCfuRWNjw0rURe+umicV3lW99mXtDB6Ie?=
 =?iso-8859-1?Q?h5Hy5aF/jUzjXvUoSPqrvwEd6eH00WVVr4azgK1IcFH/JeHkD7Ofu0+etN?=
 =?iso-8859-1?Q?/38nTueZeZ4J9SoDXcp1PMhrC6/83BLA7v+dEGqbqtVlCFSHY0zTrhTDLy?=
 =?iso-8859-1?Q?69i6SPGnjHQo/j5LJ4zDc8s3+VxI0tzAN/ZWm2f0m8sWH8T43pNCIMb/p4?=
 =?iso-8859-1?Q?R1a1jPksLnsS0PyQDXJF7oCuL/ZMqCuFg1iKxuJ2/z/qdek1JOM+HxnX2H?=
 =?iso-8859-1?Q?RijBGbvupLnh44kwh2QjQxUsM0OyJCwbizC+8NjdQlTBbC8ww9d9PScSaY?=
 =?iso-8859-1?Q?mScujL0QplcQsBqv4A0XzZRKSRQCci5fpap2bbOEwHazq0ZCFae7TgFrh0?=
 =?iso-8859-1?Q?Ieb6kUNUTdNPBkWdjzztSiAtsZBj8xvcBzU7imU5+wEhkK21Yg9nJYVEmC?=
 =?iso-8859-1?Q?s4cQ6BAuP4KPCE6j1mVDDi/7P6UAyI530PVZGrd99PpTA20cWNj6v1pC94?=
 =?iso-8859-1?Q?s1aF2YPs+9ykve5z39Erqb0WrkKH+UIihxZ0iHYRWmPwUbpA0cG44U7jGQ?=
 =?iso-8859-1?Q?SKd1hnWOspgqyQKlxiv5PNcX2UZ2doG2+OZItoYDZG/RZcriMkH1JXfzF9?=
 =?iso-8859-1?Q?xm++vgnVj3h3n/Pc1FzKeZF7EygDBQ4r7rxwAhPeFDF95+yjR1SFspmzpk?=
 =?iso-8859-1?Q?f1gKvhZbAawTlgCx8qdGmc1pZlr88vMrlwEnUN0dAw1fy+A5cNJphxq83y?=
 =?iso-8859-1?Q?bxOSV4Bk1ZwxxGdN65Z8thYYQu415oFX1kQQMyyk+Tg1rbJFWENoQezjNH?=
 =?iso-8859-1?Q?d7FncD7g2lcLGBTPyAMgJwyN3hUvTXSUX9hwwiXGO75PgliHtYXuyBL3Zl?=
 =?iso-8859-1?Q?kdt8WEyTNTR4RZn6uPk81NgvNAoozxygnur6QrR5U3YrxCSdfWb44DLoWJ?=
 =?iso-8859-1?Q?j0Ap2lkFxOdUr3eunH+iXM4K4P3n46oV3iDtsKDO5cUhVO+q7sHirnG1L9?=
 =?iso-8859-1?Q?JW0CB1huEhobws/iAQ+napdVq49g5vCQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?2CJbX6bTLzkiYxRk0uW/YU5pvC7ATkZ/bkUS0g+WwSprzzTduNWeNQXW+E?=
 =?iso-8859-1?Q?QsT9hc8mL+zDfiWcTyk7mz9s/NmTvLew6WugOyS70my+cSzYTb87YLQvT1?=
 =?iso-8859-1?Q?3W/oHZ+34qk3VcfYtmLdGn9V8x8OAHJmQs087/CPOndZDjTVry0RrkR4Hx?=
 =?iso-8859-1?Q?QcqfaukMzKNlDEx+Baon1FdVhgOIjm3RxhH1XK4UxAuGBZ76UhVrlcY7l1?=
 =?iso-8859-1?Q?OIiUIZiqVlosHb3hOYs221/OfYS0Ys7kyUbBSaRBswxHCeBcpwK1WXX0aS?=
 =?iso-8859-1?Q?Lyj4JUEV2ynLSXGRQtsh4NUUGYtQXUGi+1AG0HgFIqftMWNmZNNiAt2o5V?=
 =?iso-8859-1?Q?qRq6MHbxZQgXIKBBSx0b56k1mkiIevjPbYtONoTqrQJmHmWodzWWKxJ6lM?=
 =?iso-8859-1?Q?uG7jTUodam20xn93KRI6ACGBVXjG2c+CUm6NjFb4sbBXD9D7odpnzYW4xc?=
 =?iso-8859-1?Q?2jR34aRflIWXSTC0L0jvaaWn1rmfl1bJvrlxacvY+eA2qZLukAljqn1uGU?=
 =?iso-8859-1?Q?85OqRVUESUPQS+7vcxZdGtiqioV/hi0Rg3eLlgw/j9h1bSp5wE0ayszDP0?=
 =?iso-8859-1?Q?WPw6T4CJrUmBSqKFuliJlYMSntylIKsvHW+hujebjLlwLIojU5D53velcq?=
 =?iso-8859-1?Q?ys0Y7XOXnON1BqWhafQ2nnl8ojJbgGDYxcA23NnhTmDxMa8RICbk3qL2F9?=
 =?iso-8859-1?Q?zkpWUDCFR/ZkF/KT36hTYP+kckUGiiWfLOmD+mo2bBpRWFQQ5HVqZMbyN/?=
 =?iso-8859-1?Q?qavBWzFt3aW2KMw1wAxY9SvTXqf+KAWm83i8vCC9ypSWnn75ZeJGEuuKUy?=
 =?iso-8859-1?Q?LBIdsMeNYp9UTxas4ATnHiBQvGZxB5qGI7SxfPBnNWC1FtmjIF/G97NMUF?=
 =?iso-8859-1?Q?+/0NE7Ltxw8E6uk1EQbUEqlH2pqWTdcedJxLtsrxfA5FK5UptCSql+EQu7?=
 =?iso-8859-1?Q?l5IW5KuhgdV57dyFWW+jP36YjSnHmJ5YTaOQgcbNfedX/fxq06K040psrE?=
 =?iso-8859-1?Q?t4juHjhaz447s/hPtT1G0aWBcDyrWFFc2xHtdVrTji1cuF3TD8mx+zLsIT?=
 =?iso-8859-1?Q?i28j3P5zTlzZiZywbrupxSSLxW1I29zHa8E6YZNE0UEFVTm/jktwdZo230?=
 =?iso-8859-1?Q?xFMVFdlcdyt3Is5EOEApad1KW8H3OBaWVy3c0vGLxKt1VSg3HdNFWi1VLk?=
 =?iso-8859-1?Q?f0N6trEZkqZ8/WvI+ac2du2Ih8Y9htnzrAcyhpkUcr26Fof27EB8wL37Lh?=
 =?iso-8859-1?Q?m+1M374c3uUpiuQWsvukXLWn3LcivpWkPqJbFtd/B6m+n+ti1DeKoPJqyy?=
 =?iso-8859-1?Q?9qG7thKcKjf9pGggMTAuzWPHTN9t+lvWYBoBS4mm2uK066KE8x10qsJQ2h?=
 =?iso-8859-1?Q?yut1zV7gSLICVMssDUPB5dpa/pt8ITOiVOMS8CMmO8k/IDwuBcUu2VH7Fr?=
 =?iso-8859-1?Q?Ph+M8LR5VAIgBUisd3RoIPuw6Ud2X0Whx4X0qJsVa/iwB4PP5X/PFPgfD6?=
 =?iso-8859-1?Q?DC2KJUuigAlcQppkZ9GiKs6hTXTMbJoR32k+IS8xvGQhHOjU3W9RLqouC+?=
 =?iso-8859-1?Q?TPrPGh9KUOkdihN1d4I1PdhK+iJNSU30OuI8zlEBttbeY8zK3A4OdogC9P?=
 =?iso-8859-1?Q?he0cX6R0HaDZPlWq7TrLfJ0ACVW9F+bGBDEOdVuh0ge4SRm15CgQCsZQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f0e765d-034e-4c4c-89b3-08dd6d08492b
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 08:20:51.7259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /tPheflnjPI0bjXFMAe2Pg/Tgfbqs9CfMPIsJlknzxn2ZmXJQNNpyrZ8w/2SGtXj5fclf7p9bwAd4JE/OJUHxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9129
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 56.4% regression of vm-scalability.throughput on:


commit: c2f6ea38fc1b640aa7a2e155cc1c0410ff91afa2 ("mm: page_alloc: don't steal single pages from biggest buddy")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

testcase: vm-scalability
config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 224 threads 4 sockets Intel(R) Xeon(R) Platinum 8380H CPU @ 2.90GHz (Cooper Lake) with 192G memory
parameters:

	runtime: 300s
	test: lru-file-mmap-read
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+--------------------------------------------------------------------------------------------------------+
| testcase: change | vm-scalability: vm-scalability.throughput  15.2% regression                                            |
| test machine     | 192 threads 2 sockets Intel(R) Xeon(R) Platinum 8468V  CPU @ 2.4GHz (Sapphire Rapids) with 384G memory |
| test parameters  | cpufreq_governor=performance                                                                           |
|                  | runtime=300s                                                                                           |
|                  | test=lru-file-readonce                                                                                 |
+------------------+--------------------------------------------------------------------------------------------------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202503271547.fc08b188-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250327/202503271547.fc08b188-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/rootfs/runtime/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-9.4/debian-12-x86_64-20240206.cgz/300s/lkp-cpl-4sp2/lru-file-mmap-read/vm-scalability

commit: 
  f3b92176f4 ("tools/selftests: add guard region test for /proc/$pid/pagemap")
  c2f6ea38fc ("mm: page_alloc: don't steal single pages from biggest buddy")

f3b92176f4f7100f c2f6ea38fc1b640aa7a2e155cc1 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 1.702e+10 ± 12%     -53.7%  7.876e+09 ±  5%  cpuidle..time
   3890512 ±  5%     -48.0%    2022625 ± 19%  cpuidle..usage
    320.71 ±  5%     +18.2%     379.03        uptime.boot
     26286 ±  8%     -33.8%      17404 ±  4%  uptime.idle
     28.91 ±  7%     -59.9%      11.58 ±  7%  vmstat.cpu.id
    166.61 ±  2%     +25.4%     208.98        vmstat.procs.r
    550402 ±  6%     -39.8%     331592 ±  2%  vmstat.system.in
     28.49 ±  8%     -17.4       11.09 ±  7%  mpstat.cpu.all.idle%
      0.05 ±  2%      -0.0        0.04 ±  8%  mpstat.cpu.all.soft%
     68.92 ±  3%     +17.8       86.74        mpstat.cpu.all.sys%
      2.23 ±  6%      -0.4        1.85        mpstat.cpu.all.usr%
    765416 ±  4%     +13.2%     866765 ±  3%  meminfo.Active(anon)
     16677 ±  3%      +6.3%      17724 ±  7%  meminfo.AnonHugePages
 1.435e+08           +13.2%  1.623e+08        meminfo.Mapped
  20964191 ±  2%     -44.7%   11597836 ±  4%  meminfo.MemFree
    852601 ±  7%     +12.8%     962045 ±  4%  meminfo.Shmem
   4896915 ±  5%     -39.0%    2988750 ±  8%  numa-meminfo.node0.MemFree
  12227553 ±  3%     +12.0%   13694479 ±  4%  numa-meminfo.node1.Active
  35323186 ±  3%     +15.9%   40935721 ±  2%  numa-meminfo.node1.Mapped
   5320950 ±  6%     -43.3%    3017277 ±  5%  numa-meminfo.node1.MemFree
    677517 ±  8%     +13.1%     766377 ±  5%  numa-meminfo.node2.KReclaimable
  35949507 ±  3%     +13.6%   40822797 ±  3%  numa-meminfo.node2.Mapped
   5273037 ±  8%     -42.7%    3019409 ±  4%  numa-meminfo.node2.MemFree
    677517 ±  8%     +13.1%     766377 ±  5%  numa-meminfo.node2.SReclaimable
    850745 ±  7%     +11.1%     945010 ±  4%  numa-meminfo.node2.Slab
  12355499           +11.5%   13779785 ±  4%  numa-meminfo.node3.Active
  11930599 ±  2%     +11.0%   13243137 ±  3%  numa-meminfo.node3.Active(file)
  35933100 ±  4%     +14.0%   40967998        numa-meminfo.node3.Mapped
   5570339 ±  4%     -46.1%    3002472 ±  3%  numa-meminfo.node3.MemFree
      0.12 ±  2%     -51.3%       0.06 ±  3%  vm-scalability.free_time
    121005 ±  3%     -58.8%      49845        vm-scalability.median
      4346 ± 16%   -2970.6        1376 ± 17%  vm-scalability.stddev%
  25525364 ±  3%     -56.4%   11135467        vm-scalability.throughput
    274.21 ±  6%     +20.6%     330.73        vm-scalability.time.elapsed_time
    274.21 ±  6%     +20.6%     330.73        vm-scalability.time.elapsed_time.max
    327511           +46.7%     480523 ±  7%  vm-scalability.time.involuntary_context_switches
      1348 ±  3%    +344.1%       5987 ±  3%  vm-scalability.time.major_page_faults
  10706144 ±  4%     -73.6%    2825142 ± 18%  vm-scalability.time.maximum_resident_set_size
  93328020           -34.2%   61436664        vm-scalability.time.minor_page_faults
     15802 ±  2%     +24.3%      19641        vm-scalability.time.percent_of_cpu_this_job_got
     41920 ±  4%     +51.6%      63539        vm-scalability.time.system_time
      1352            +5.2%       1422        vm-scalability.time.user_time
 4.832e+09           -30.7%  3.346e+09        vm-scalability.workload
  53331064 ±  4%     -40.0%   32001591 ±  2%  numa-numastat.node0.local_node
  11230540 ± 10%     -14.4%    9615282        numa-numastat.node0.numa_foreign
  53443666 ±  4%     -40.0%   32082061 ±  2%  numa-numastat.node0.numa_hit
  18920287 ±  9%     -43.6%   10668582 ±  4%  numa-numastat.node0.numa_miss
  19025905 ±  9%     -43.5%   10749724 ±  3%  numa-numastat.node0.other_node
  56535277 ±  4%     -42.5%   32511952 ±  3%  numa-numastat.node1.local_node
  14228056 ±  6%     -29.9%    9967849 ±  3%  numa-numastat.node1.numa_foreign
  56618771 ±  4%     -42.4%   32596415 ±  3%  numa-numastat.node1.numa_hit
  53165000 ±  5%     -38.0%   32981697 ±  2%  numa-numastat.node2.local_node
  13182856 ±  7%     -22.6%   10202650 ±  5%  numa-numastat.node2.numa_foreign
  53265107 ±  5%     -37.9%   33065351 ±  2%  numa-numastat.node2.numa_hit
  12626193 ±  4%     -23.6%    9641387 ±  5%  numa-numastat.node2.numa_miss
  12723206 ±  4%     -23.5%    9727091 ±  5%  numa-numastat.node2.other_node
  53553158 ±  4%     -38.8%   32791369        numa-numastat.node3.local_node
  14822055 ± 13%     -32.0%   10075025 ±  4%  numa-numastat.node3.numa_foreign
  53612301 ±  4%     -38.7%   32888921        numa-numastat.node3.numa_hit
  26042583 ±  5%     +24.2%   32343080 ± 10%  sched_debug.cfs_rq:/.avg_vruntime.avg
  28289592 ±  6%     +20.6%   34111958 ± 11%  sched_debug.cfs_rq:/.avg_vruntime.max
   5569284 ± 52%     -96.3%     205900 ± 37%  sched_debug.cfs_rq:/.avg_vruntime.min
   2663785 ± 13%     +37.7%    3669196 ±  6%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      0.60 ±  7%     +41.6%       0.85 ±  2%  sched_debug.cfs_rq:/.h_nr_queued.avg
      1.55 ±  8%     +29.4%       2.01 ±  5%  sched_debug.cfs_rq:/.h_nr_queued.max
      0.29 ±  6%     -29.3%       0.21 ±  9%  sched_debug.cfs_rq:/.h_nr_queued.stddev
      0.60 ±  7%     +41.6%       0.85        sched_debug.cfs_rq:/.h_nr_runnable.avg
      1.52 ±  9%     +32.2%       2.01 ±  5%  sched_debug.cfs_rq:/.h_nr_runnable.max
      0.29 ±  6%     -29.5%       0.21 ± 10%  sched_debug.cfs_rq:/.h_nr_runnable.stddev
     33.98 ± 16%     -16.6%      28.35 ±  6%  sched_debug.cfs_rq:/.load_avg.avg
  26042586 ±  5%     +24.2%   32343084 ± 10%  sched_debug.cfs_rq:/.min_vruntime.avg
  28289592 ±  6%     +20.6%   34111958 ± 11%  sched_debug.cfs_rq:/.min_vruntime.max
   5569284 ± 52%     -96.3%     205900 ± 37%  sched_debug.cfs_rq:/.min_vruntime.min
   2663785 ± 13%     +37.7%    3669195 ±  6%  sched_debug.cfs_rq:/.min_vruntime.stddev
      0.59 ±  7%     +38.8%       0.82        sched_debug.cfs_rq:/.nr_queued.avg
      0.26 ±  6%     -59.4%       0.11 ± 26%  sched_debug.cfs_rq:/.nr_queued.stddev
    625.72 ±  7%     +41.3%     883.96        sched_debug.cfs_rq:/.runnable_avg.avg
      1492 ±  5%     +31.8%       1967 ±  3%  sched_debug.cfs_rq:/.runnable_avg.max
    284.33 ±  6%     -29.2%     201.27 ±  8%  sched_debug.cfs_rq:/.runnable_avg.stddev
    613.28 ±  7%     +38.6%     850.28        sched_debug.cfs_rq:/.util_avg.avg
      1227 ±  3%     +12.3%       1377 ±  3%  sched_debug.cfs_rq:/.util_avg.max
    250.81 ±  4%     -54.7%     113.67 ± 16%  sched_debug.cfs_rq:/.util_avg.stddev
      1293 ±  8%     +34.5%       1739 ±  5%  sched_debug.cfs_rq:/.util_est.max
    113130 ± 21%     +55.7%     176123 ± 28%  sched_debug.cpu.avg_idle.min
     17.82 ± 12%    +263.4%      64.74 ± 14%  sched_debug.cpu.clock.stddev
    157562 ±  7%      +7.5%     169450 ±  9%  sched_debug.cpu.clock_task.min
      3198 ±  4%     +52.1%       4863        sched_debug.cpu.curr->pid.avg
      1544 ±  5%     -41.8%     898.71 ±  9%  sched_debug.cpu.curr->pid.stddev
      0.00 ± 26%    +198.9%       0.00 ± 15%  sched_debug.cpu.next_balance.stddev
      0.56 ±  4%     +52.3%       0.85        sched_debug.cpu.nr_running.avg
      1.68 ± 13%     +22.8%       2.07 ±  6%  sched_debug.cpu.nr_running.max
      0.30 ±  8%     -27.8%       0.21 ±  9%  sched_debug.cpu.nr_running.stddev
   1226884 ±  5%     -36.0%     785027 ±  8%  numa-vmstat.node0.nr_free_pages
  11230540 ± 10%     -14.4%    9615282        numa-vmstat.node0.numa_foreign
  53443303 ±  4%     -40.0%   32082034 ±  2%  numa-vmstat.node0.numa_hit
  53330701 ±  4%     -40.0%   32001564 ±  2%  numa-vmstat.node0.numa_local
  18920287 ±  9%     -43.6%   10668582 ±  4%  numa-vmstat.node0.numa_miss
  19025905 ±  9%     -43.5%   10749724 ±  3%  numa-vmstat.node0.numa_other
   2404851 ± 17%     -81.8%     436913 ± 19%  numa-vmstat.node0.workingset_nodereclaim
   3035160 ±  3%     +12.0%    3400384 ±  4%  numa-vmstat.node1.nr_active_file
   1332733 ±  6%     -40.3%     795144 ±  6%  numa-vmstat.node1.nr_free_pages
   8817580 ±  3%     +15.4%   10171927 ±  2%  numa-vmstat.node1.nr_mapped
   3039792 ±  3%     +12.1%    3406582 ±  4%  numa-vmstat.node1.nr_zone_active_file
  14228056 ±  6%     -29.9%    9967849 ±  3%  numa-vmstat.node1.numa_foreign
  56618372 ±  4%     -42.4%   32596203 ±  3%  numa-vmstat.node1.numa_hit
  56534878 ±  4%     -42.5%   32511740 ±  3%  numa-vmstat.node1.numa_local
    954127 ± 20%     -73.1%     256611 ± 34%  numa-vmstat.node1.workingset_nodereclaim
   3046975 ±  3%     +12.3%    3422217 ±  3%  numa-vmstat.node2.nr_active_file
   1320090 ±  8%     -39.7%     796670 ±  4%  numa-vmstat.node2.nr_free_pages
   8977022 ±  3%     +13.0%   10145019 ±  3%  numa-vmstat.node2.nr_mapped
    169424 ±  8%     +12.7%     191016 ±  5%  numa-vmstat.node2.nr_slab_reclaimable
   3051630 ±  3%     +12.4%    3431556 ±  3%  numa-vmstat.node2.nr_zone_active_file
  13182856 ±  7%     -22.6%   10202650 ±  5%  numa-vmstat.node2.numa_foreign
  53264088 ±  5%     -37.9%   33064447 ±  2%  numa-vmstat.node2.numa_hit
  53163982 ±  5%     -38.0%   32980793 ±  2%  numa-vmstat.node2.numa_local
  12626193 ±  4%     -23.6%    9641387 ±  5%  numa-vmstat.node2.numa_miss
  12723206 ±  4%     -23.5%    9727091 ±  5%  numa-vmstat.node2.numa_other
    919386 ± 31%     -64.5%     326738 ± 18%  numa-vmstat.node2.workingset_nodereclaim
   3025992            +9.3%    3308587 ±  3%  numa-vmstat.node3.nr_active_file
   1395961 ±  3%     -43.3%     791816 ±  3%  numa-vmstat.node3.nr_free_pages
   8971283 ±  4%     +13.5%   10181092        numa-vmstat.node3.nr_mapped
   3030697            +9.4%    3314830 ±  3%  numa-vmstat.node3.nr_zone_active_file
  14822055 ± 13%     -32.0%   10075025 ±  4%  numa-vmstat.node3.numa_foreign
  53610436 ±  4%     -38.7%   32888516        numa-vmstat.node3.numa_hit
  53551293 ±  4%     -38.8%   32790963        numa-vmstat.node3.numa_local
    925252 ± 26%     -66.0%     314477 ± 22%  numa-vmstat.node3.workingset_nodereclaim
      5.95 ±  3%     -22.1%       4.63 ±  4%  perf-stat.i.MPKI
  3.24e+10 ±  3%     -41.7%  1.888e+10        perf-stat.i.branch-instructions
      0.33            +0.0        0.34        perf-stat.i.branch-miss-rate%
  95838227 ±  2%     -45.2%   52482057        perf-stat.i.branch-misses
     66.91            +3.8       70.68        perf-stat.i.cache-miss-rate%
 6.536e+08 ±  4%     -56.4%  2.852e+08        perf-stat.i.cache-misses
 1.004e+09 ±  4%     -59.5%  4.069e+08        perf-stat.i.cache-references
      5.02 ±  3%    +111.1%      10.59        perf-stat.i.cpi
    225243            +1.0%     227600        perf-stat.i.cpu-clock
 5.886e+11 ±  2%     +23.7%   7.28e+11        perf-stat.i.cpu-cycles
    290.25 ±  2%      -7.7%     267.91 ±  2%  perf-stat.i.cpu-migrations
    859.86 ±  2%    +201.8%       2594        perf-stat.i.cycles-between-cache-misses
 1.172e+11 ±  2%     -42.6%  6.733e+10        perf-stat.i.instructions
      0.33 ±  3%     -35.8%       0.21        perf-stat.i.ipc
      5.53 ±  7%    +240.6%      18.83 ±  3%  perf-stat.i.major-faults
      2.83 ± 12%     -81.7%       0.52 ±  3%  perf-stat.i.metric.K/sec
    346126 ±  7%     -43.9%     194284        perf-stat.i.minor-faults
    346131 ±  7%     -43.9%     194303        perf-stat.i.page-faults
    225243            +1.0%     227600        perf-stat.i.task-clock
      5.70 ±  2%     -26.5%       4.19        perf-stat.overall.MPKI
      0.30            -0.0        0.28        perf-stat.overall.branch-miss-rate%
     64.60            +5.2       69.79        perf-stat.overall.cache-miss-rate%
      5.28 ±  2%    +116.9%      11.46        perf-stat.overall.cpi
    927.91          +194.9%       2736        perf-stat.overall.cycles-between-cache-misses
      0.19 ±  2%     -53.9%       0.09        perf-stat.overall.ipc
  3.23e+10 ±  3%     -42.4%  1.859e+10        perf-stat.ps.branch-instructions
  97953773 ±  2%     -46.6%   52288618        perf-stat.ps.branch-misses
 6.662e+08 ±  4%     -58.2%  2.782e+08        perf-stat.ps.cache-misses
 1.031e+09 ±  4%     -61.3%  3.986e+08        perf-stat.ps.cache-references
 6.177e+11 ±  2%     +23.2%  7.612e+11        perf-stat.ps.cpu-cycles
    285.57 ±  2%     -10.4%     255.87 ±  2%  perf-stat.ps.cpu-migrations
 1.169e+11 ±  2%     -43.2%  6.643e+10        perf-stat.ps.instructions
      4.92 ±  6%    +266.3%      18.02 ±  3%  perf-stat.ps.major-faults
    344062 ±  6%     -45.4%     188002        perf-stat.ps.minor-faults
    344067 ±  6%     -45.4%     188020        perf-stat.ps.page-faults
 3.215e+13 ±  3%     -31.3%  2.208e+13        perf-stat.total.instructions
   4828005 ±  2%     -36.7%    3055295        proc-vmstat.allocstall_movable
     19547 ±  3%    +181.7%      55069        proc-vmstat.allocstall_normal
 1.308e+08 ± 18%     +81.5%  2.373e+08 ± 18%  proc-vmstat.compact_daemon_free_scanned
 1.503e+08 ± 13%     -82.4%   26384666 ± 37%  proc-vmstat.compact_daemon_migrate_scanned
      2891 ± 12%     -97.4%      76.17 ± 29%  proc-vmstat.compact_daemon_wake
   1520826 ± 19%     -99.9%       1855 ± 38%  proc-vmstat.compact_fail
 1.762e+08 ± 14%     +35.6%  2.388e+08 ± 18%  proc-vmstat.compact_free_scanned
  33090251 ± 10%     -40.6%   19664055 ± 31%  proc-vmstat.compact_isolated
 1.826e+10 ±  5%     -99.7%   49399799 ± 29%  proc-vmstat.compact_migrate_scanned
   2450182 ± 21%     -99.4%      15045 ± 15%  proc-vmstat.compact_stall
    929355 ± 26%     -98.6%      13190 ± 13%  proc-vmstat.compact_success
      3716 ± 15%     -96.4%     134.00 ± 18%  proc-vmstat.kswapd_low_wmark_hit_quickly
    191553 ±  3%     +13.4%     217163 ±  3%  proc-vmstat.nr_active_anon
  12143003 ±  2%      +8.5%   13179985 ±  2%  proc-vmstat.nr_active_file
  41767951            +5.4%   44014874        proc-vmstat.nr_file_pages
   5235973 ±  2%     -43.9%    2939596 ±  2%  proc-vmstat.nr_free_pages
  28515253            +4.1%   29688629        proc-vmstat.nr_inactive_file
     42800            +2.6%      43922        proc-vmstat.nr_kernel_stack
  35859536           +12.9%   40468962        proc-vmstat.nr_mapped
    672657 ±  2%      +5.5%     709985        proc-vmstat.nr_page_table_pages
    213344 ±  7%     +12.8%     240725 ±  4%  proc-vmstat.nr_shmem
    746816 ±  2%      +4.2%     777915        proc-vmstat.nr_slab_reclaimable
    192129 ±  3%     +13.1%     217232 ±  3%  proc-vmstat.nr_zone_active_anon
  12164300 ±  2%      +8.6%   13206949 ±  2%  proc-vmstat.nr_zone_active_file
  28495099            +4.1%   29661915        proc-vmstat.nr_zone_inactive_file
  53463509 ±  2%     -25.4%   39860806        proc-vmstat.numa_foreign
     46231 ± 15%     -74.8%      11635 ± 61%  proc-vmstat.numa_hint_faults
     36770 ± 26%     -84.6%       5645 ± 68%  proc-vmstat.numa_hint_faults_local
 2.169e+08 ±  3%     -39.8%  1.306e+08        proc-vmstat.numa_hit
 2.166e+08 ±  3%     -39.8%  1.303e+08        proc-vmstat.numa_local
  53459124 ±  2%     -25.4%   39858740        proc-vmstat.numa_miss
  53809139 ±  2%     -25.3%   40207081        proc-vmstat.numa_other
      6545 ± 80%     -92.1%     517.83 ± 48%  proc-vmstat.numa_pages_migrated
    136643 ± 40%     -70.2%      40747 ± 85%  proc-vmstat.numa_pte_updates
      3746 ± 15%     -96.0%     149.50 ± 17%  proc-vmstat.pageoutrun
  94282999           -24.3%   71368473        proc-vmstat.pgactivate
  10012599 ±  4%     -43.2%    5686084 ±  3%  proc-vmstat.pgalloc_dma32
 1.069e+09           -34.4%  7.014e+08        proc-vmstat.pgalloc_normal
  94463121           -33.7%   62613232        proc-vmstat.pgfault
 1.095e+09           -34.6%  7.165e+08        proc-vmstat.pgfree
      1339 ±  3%    +346.2%       5975 ±  3%  proc-vmstat.pgmajfault
     74970 ± 36%     -95.3%       3527 ± 22%  proc-vmstat.pgmigrate_fail
  16249857 ± 11%     -39.5%    9827004 ± 31%  proc-vmstat.pgmigrate_success
      2211            +6.1%       2345        proc-vmstat.pgpgin
  20426382 ± 10%     -45.8%   11078695        proc-vmstat.pgrefill
 1.191e+09           -26.3%  8.784e+08        proc-vmstat.pgscan_direct
 1.394e+09           -33.9%  9.209e+08        proc-vmstat.pgscan_file
 2.027e+08 ±  8%     -79.0%   42500310 ±  3%  proc-vmstat.pgscan_kswapd
      8913 ±  5%     -27.3%       6476 ±  3%  proc-vmstat.pgskip_normal
 8.692e+08           -28.3%  6.229e+08        proc-vmstat.pgsteal_direct
 1.041e+09           -36.9%  6.566e+08        proc-vmstat.pgsteal_file
 1.714e+08 ±  7%     -80.3%   33771596 ±  4%  proc-vmstat.pgsteal_kswapd
  24999520 ± 10%     -76.1%    5984550 ±  5%  proc-vmstat.slabs_scanned
   5158406 ±  6%     -74.7%    1306603 ±  4%  proc-vmstat.workingset_nodereclaim
   3779163 ±  3%      +7.9%    4077693        proc-vmstat.workingset_nodes
      1.45 ± 30%    +133.0%       3.39 ± 27%  perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.pte_alloc_one
      2.39 ±  5%    +135.5%       5.63 ± 11%  perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof.page_cache_ra_order
      2.32 ± 14%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_pages_direct_compact.__alloc_pages_slowpath.constprop.0
      2.56 ± 10%    +126.4%       5.80 ± 10%  perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_pages_slowpath.constprop.0.__alloc_frozen_pages_noprof
      2.04 ± 15%    +244.6%       7.04 ±115%  perf-sched.sch_delay.avg.ms.__cond_resched.__kmalloc_noprof.ifs_alloc.isra.0
      1.52 ± 38%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.__reset_isolation_suitable.compact_zone.compact_zone_order.try_to_compact_pages
      0.00 ±223%  +1.9e+06%      27.79 ±210%  perf-sched.sch_delay.avg.ms.__cond_resched.__vmalloc_area_node.__vmalloc_node_range_noprof.alloc_thread_stack_node.dup_task_struct
      2.27 ± 87%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.down_read.split_huge_page_to_list_to_order.migrate_pages_batch.migrate_pages_sync
      2.44 ± 21%    +114.5%       5.24 ± 10%  perf-sched.sch_delay.avg.ms.__cond_resched.down_read.xfs_ilock_for_iomap.xfs_read_iomap_begin.iomap_iter
      0.01 ± 64%  +14883.3%       1.05 ±135%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      4.10 ± 35%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.isolate_freepages_block.fast_isolate_freepages.isolate_freepages.compaction_alloc
      3.31 ± 61%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.isolate_freepages_block.isolate_freepages.compaction_alloc.migrate_folio_unmap
      2.20 ± 12%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.isolate_migratepages.compact_zone.compact_zone_order.try_to_compact_pages
      2.18 ± 14%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.isolate_migratepages_block.isolate_migratepages.compact_zone.compact_zone_order
      0.50 ±215%  +18617.1%      94.12 ±210%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.alloc_pid.copy_process.kernel_clone
      0.74 ±150%    +236.4%       2.50 ± 62%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.vma_shrink
      2.69 ± 23%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.migrate_pages_batch.migrate_pages_sync.migrate_pages.compact_zone
      0.05 ±223%   +4260.6%       2.05 ±100%  perf-sched.sch_delay.avg.ms.__cond_resched.mutex_lock_killable.pcpu_alloc_noprof.mm_init.dup_mm
      2.96 ± 14%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.rmap_walk_anon.try_to_migrate.migrate_folio_unmap.migrate_pages_batch
      1.66 ± 21%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.shadow_lru_isolate.__list_lru_walk_one.list_lru_walk_one_irq.do_shrink_slab
      2.61 ±  5%     +81.1%       4.73 ± 10%  perf-sched.sch_delay.avg.ms.__cond_resched.shrink_folio_list.evict_folios.try_to_shrink_lruvec.shrink_one
      0.86 ± 93%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.io_schedule.migration_entry_wait_on_locked.migration_entry_wait.do_swap_page
      2.53 ± 15%    +133.5%       5.91 ± 41%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
      2.82 ± 16%    +130.6%       6.49 ± 40%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      1.31 ±141%    +251.7%       4.62 ±100%  perf-sched.sch_delay.avg.ms.pipe_write.vfs_write.ksys_write.do_syscall_64
      0.79 ± 43%   +1820.1%      15.24 ±188%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      6.19 ±169%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.__drain_all_pages
      0.11 ±130%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.schedule_timeout.kswapd_try_to_sleep.kswapd.kthread
      0.59 ± 23%    +224.0%       1.91 ± 26%  perf-sched.sch_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1.26 ± 24%    +181.3%       3.54 ± 23%  perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      2.38 ± 60%    +527.9%      14.95 ± 78%  perf-sched.sch_delay.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.__pmd_alloc
      4.40 ± 38%    +250.7%      15.42 ± 19%  perf-sched.sch_delay.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.pte_alloc_one
     18.01 ± 57%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.__alloc_pages_direct_compact.__alloc_pages_slowpath.constprop.0
    128.58 ± 48%    +493.6%     763.29 ± 40%  perf-sched.sch_delay.max.ms.__cond_resched.__alloc_pages_slowpath.constprop.0.__alloc_frozen_pages_noprof
      6.41 ± 42%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.__reset_isolation_suitable.compact_zone.compact_zone_order.try_to_compact_pages
      0.00 ±223%  +1.2e+07%     186.87 ±216%  perf-sched.sch_delay.max.ms.__cond_resched.__vmalloc_area_node.__vmalloc_node_range_noprof.alloc_thread_stack_node.dup_task_struct
      3.42 ± 46%   +1591.8%      57.78 ±149%  perf-sched.sch_delay.max.ms.__cond_resched.change_pmd_range.isra.0.change_pud_range
      4.63 ± 77%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.down_read.split_huge_page_to_list_to_order.migrate_pages_batch.migrate_pages_sync
     20.61 ± 74%    +914.8%     209.17 ±121%  perf-sched.sch_delay.max.ms.__cond_resched.down_read.xfs_ilock_for_iomap.xfs_read_iomap_begin.iomap_iter
      0.03 ±168%  +25398.1%       8.84 ±113%  perf-sched.sch_delay.max.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      9.80 ± 40%     -65.4%       3.39 ±129%  perf-sched.sch_delay.max.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
     23.01 ±114%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.isolate_freepages_block.fast_isolate_freepages.isolate_freepages.compaction_alloc
      5.92 ± 48%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.isolate_freepages_block.isolate_freepages.compaction_alloc.migrate_folio_unmap
     25.32 ± 28%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.isolate_migratepages.compact_zone.compact_zone_order.try_to_compact_pages
     17.84 ± 26%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.isolate_migratepages_block.isolate_migratepages.compact_zone.compact_zone_order
      0.51 ±210%  +36510.2%     187.87 ±210%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.alloc_pid.copy_process.kernel_clone
      0.74 ±150%    +731.1%       6.18 ± 68%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.vma_shrink
      9.68 ± 42%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.migrate_pages_batch.migrate_pages_sync.migrate_pages.compact_zone
      0.05 ±223%  +10820.9%       5.13 ±101%  perf-sched.sch_delay.max.ms.__cond_resched.mutex_lock_killable.pcpu_alloc_noprof.mm_init.dup_mm
      7.52 ± 19%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.rmap_walk_anon.try_to_migrate.migrate_folio_unmap.migrate_pages_batch
     26.92 ± 77%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.shadow_lru_isolate.__list_lru_walk_one.list_lru_walk_one_irq.do_shrink_slab
      1.21 ± 71%  +17474.9%     213.15 ±210%  perf-sched.sch_delay.max.ms.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      5.86 ± 47%    +207.0%      18.00 ± 94%  perf-sched.sch_delay.max.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
     15.65 ±168%    -100.0%       0.00        perf-sched.sch_delay.max.ms.io_schedule.migration_entry_wait_on_locked.migration_entry_wait.do_swap_page
      1.31 ±141%    +356.6%       6.00 ± 82%  perf-sched.sch_delay.max.ms.pipe_write.vfs_write.ksys_write.do_syscall_64
      4.84 ± 74%   +3625.1%     180.43 ±206%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
     62.50 ±201%    -100.0%       0.00        perf-sched.sch_delay.max.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.__drain_all_pages
      0.86 ±151%    -100.0%       0.00        perf-sched.sch_delay.max.ms.schedule_timeout.kswapd_try_to_sleep.kswapd.kthread
    184.61 ± 15%    +245.5%     637.81 ± 19%  perf-sched.sch_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    184.34 ± 18%    +264.7%     672.25 ± 31%  perf-sched.sch_delay.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      1.66 ±  9%     +93.7%       3.21 ± 20%  perf-sched.total_sch_delay.average.ms
    662.36 ± 55%     +73.5%       1148 ±  9%  perf-sched.total_sch_delay.max.ms
      4.79 ±  5%    +135.3%      11.27 ± 11%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof.page_cache_ra_order
      5.31 ±  6%    +123.3%      11.86 ± 12%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__alloc_pages_slowpath.constprop.0.__alloc_frozen_pages_noprof
      4.08 ± 15%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.__kmalloc_noprof.ifs_alloc.isra.0
      6.19 ± 13%     +69.9%      10.51 ± 19%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      3.23 ± 75%    +224.3%      10.49 ± 10%  perf-sched.wait_and_delay.avg.ms.__cond_resched.down_read.xfs_ilock_for_iomap.xfs_read_iomap_begin.iomap_iter
      4.40 ± 12%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.isolate_migratepages.compact_zone.compact_zone_order.try_to_compact_pages
      4.58 ± 20%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.isolate_migratepages_block.isolate_migratepages.compact_zone.compact_zone_order
      5.21 ±  5%    +132.3%      12.11 ±  8%  perf-sched.wait_and_delay.avg.ms.__cond_resched.shrink_folio_list.evict_folios.try_to_shrink_lruvec.shrink_one
      4.92 ± 22%    +130.6%      11.35 ± 29%  perf-sched.wait_and_delay.avg.ms.__cond_resched.try_to_shrink_lruvec.shrink_one.shrink_many.shrink_node
      4.40 ± 18%    +241.9%      15.06 ± 39%  perf-sched.wait_and_delay.avg.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      4.99 ± 16%    +136.4%      11.80 ± 41%  perf-sched.wait_and_delay.avg.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
      5.66 ± 16%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
     49.92 ± 40%     -58.5%      20.72 ± 31%  perf-sched.wait_and_delay.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      5.67 ±  7%    +233.8%      18.94 ± 43%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    308.58 ±  7%     +52.0%     469.04 ±  3%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      5.96 ±  4%     +34.5%       8.01 ± 22%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    621.78 ±  7%     +35.1%     839.89 ± 10%  perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    148.00 ± 23%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.__kmalloc_noprof.ifs_alloc.isra.0
     70.50 ± 72%    +505.7%     427.00 ± 29%  perf-sched.wait_and_delay.count.__cond_resched.down_read.xfs_ilock_for_iomap.xfs_read_iomap_begin.iomap_iter
    394.83 ± 11%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.isolate_migratepages.compact_zone.compact_zone_order.try_to_compact_pages
    696.83 ± 25%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.isolate_migratepages_block.isolate_migratepages.compact_zone.compact_zone_order
      0.17 ±223%   +2800.0%       4.83 ± 45%  perf-sched.wait_and_delay.count.__cond_resched.mutex_lock_killable.pcpu_alloc_noprof.mm_init.dup_mm
     50.00 ± 18%     -74.0%      13.00 ± 65%  perf-sched.wait_and_delay.count.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    135.83 ±  6%     -89.7%      14.00 ±223%  perf-sched.wait_and_delay.count.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
    168.50 ± 16%    -100.0%       0.00        perf-sched.wait_and_delay.count.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      1644 ± 45%    +103.2%       3340 ± 25%  perf-sched.wait_and_delay.count.pipe_read.vfs_read.ksys_read.do_syscall_64
      2500 ± 15%     -49.3%       1268 ± 11%  perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    494.23 ± 70%    +158.3%       1276 ± 27%  perf-sched.wait_and_delay.max.ms.__cond_resched.__alloc_pages_slowpath.constprop.0.__alloc_frozen_pages_noprof
     43.31 ± 65%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.__kmalloc_noprof.ifs_alloc.isra.0
     32.05 ±114%   +1205.3%     418.33 ±121%  perf-sched.wait_and_delay.max.ms.__cond_resched.down_read.xfs_ilock_for_iomap.xfs_read_iomap_begin.iomap_iter
     50.65 ± 28%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.isolate_migratepages.compact_zone.compact_zone_order.try_to_compact_pages
    196.51 ±182%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.isolate_migratepages_block.isolate_migratepages.compact_zone.compact_zone_order
    167.85 ±223%    +511.9%       1027        perf-sched.wait_and_delay.max.ms.__cond_resched.mutex_lock_killable.pcpu_alloc_noprof.mm_init.dup_mm
    401.00 ± 36%    +238.8%       1358 ± 29%  perf-sched.wait_and_delay.max.ms.__cond_resched.shrink_folio_list.evict_folios.try_to_shrink_lruvec.shrink_one
     44.08 ± 33%    +151.5%     110.86 ± 31%  perf-sched.wait_and_delay.max.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
     54.90 ± 67%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      1475 ±  5%     +51.9%       2241 ± 19%  perf-sched.wait_and_delay.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
     44.18 ± 28%    +522.5%     275.00 ±119%  perf-sched.wait_and_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      1.44 ± 29%   +1635.4%      24.97 ±130%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.pte_alloc_one
      2.40 ±  5%    +135.1%       5.63 ± 11%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof.page_cache_ra_order
      2.32 ± 14%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages_direct_compact.__alloc_pages_slowpath.constprop.0
      2.75 ±  5%    +120.5%       6.06 ± 16%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_pages_slowpath.constprop.0.__alloc_frozen_pages_noprof
      0.18 ±223%   +1644.4%       3.11 ± 99%  perf-sched.wait_time.avg.ms.__cond_resched.__get_user_pages.get_user_pages_remote.get_arg_page.copy_string_kernel
      2.04 ± 15%    +244.6%       7.04 ±115%  perf-sched.wait_time.avg.ms.__cond_resched.__kmalloc_noprof.ifs_alloc.isra.0
      1.52 ± 38%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__reset_isolation_suitable.compact_zone.compact_zone_order.try_to_compact_pages
      0.00 ±223%  +9.9e+06%     149.06 ± 94%  perf-sched.wait_time.avg.ms.__cond_resched.__vmalloc_area_node.__vmalloc_node_range_noprof.alloc_thread_stack_node.dup_task_struct
      4.65 ±  9%     +43.8%       6.68 ± 13%  perf-sched.wait_time.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
     28.89 ±104%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_read.split_huge_page_to_list_to_order.migrate_pages_batch.migrate_pages_sync
      2.45 ± 21%    +114.3%       5.24 ± 10%  perf-sched.wait_time.avg.ms.__cond_resched.down_read.xfs_ilock_for_iomap.xfs_read_iomap_begin.iomap_iter
      0.00 ±203%  +40515.4%       0.88 ±155%  perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
    131.00 ±166%     -98.4%       2.13 ±155%  perf-sched.wait_time.avg.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
     45.09 ±137%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.isolate_freepages_block.fast_isolate_freepages.isolate_freepages.compaction_alloc
      3.35 ± 59%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.isolate_freepages_block.isolate_freepages.compaction_alloc.migrate_folio_unmap
      2.20 ± 12%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.isolate_migratepages.compact_zone.compact_zone_order.try_to_compact_pages
      2.40 ± 27%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.isolate_migratepages_block.isolate_migratepages.compact_zone.compact_zone_order
      0.74 ±150%    +235.3%       2.49 ± 62%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.vma_shrink
     20.77 ± 70%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.migrate_pages_batch.migrate_pages_sync.migrate_pages.compact_zone
      2.96 ± 14%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.rmap_walk_anon.try_to_migrate.migrate_folio_unmap.migrate_pages_batch
      1.66 ± 21%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.shadow_lru_isolate.__list_lru_walk_one.list_lru_walk_one_irq.do_shrink_slab
    175.04 ± 74%     -98.4%       2.81 ± 89%  perf-sched.wait_time.avg.ms.__cond_resched.shmem_inode_acct_blocks.shmem_alloc_and_add_folio.shmem_get_folio_gfp.shmem_write_begin
      2.60 ±  4%    +183.8%       7.38 ±  9%  perf-sched.wait_time.avg.ms.__cond_resched.shrink_folio_list.evict_folios.try_to_shrink_lruvec.shrink_one
      2.24 ± 15%    +242.5%       7.68 ± 40%  perf-sched.wait_time.avg.ms.__cond_resched.try_to_shrink_lruvec.shrink_one.shrink_many.shrink_node
      4.03 ± 21%    +250.4%      14.12 ± 40%  perf-sched.wait_time.avg.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.86 ± 93%    -100.0%       0.00        perf-sched.wait_time.avg.ms.io_schedule.migration_entry_wait_on_locked.migration_entry_wait.do_swap_page
      2.46 ± 18%    +139.4%       5.90 ± 41%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
      2.84 ± 16%    +128.4%       6.49 ± 40%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
     49.54 ± 40%     -59.5%      20.06 ± 31%  perf-sched.wait_time.avg.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
     98.02 ± 46%    -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.__drain_all_pages
      4.70 ±  9%    +270.7%      17.43 ± 40%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    304.70 ±  7%     +51.9%     462.85 ±  2%  perf-sched.wait_time.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.12 ±120%    -100.0%       0.00        perf-sched.wait_time.avg.ms.schedule_timeout.kswapd_try_to_sleep.kswapd.kthread
      5.17 ±  2%     +29.1%       6.67 ± 14%  perf-sched.wait_time.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    621.19 ±  7%     +34.9%     837.98 ± 10%  perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    167.70 ±222%    +410.0%     855.18 ± 44%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.__pmd_alloc
      4.40 ± 38%   +7795.2%     347.10 ±135%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.pte_alloc_one
     18.01 ± 57%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__alloc_pages_direct_compact.__alloc_pages_slowpath.constprop.0
      0.54 ±223%    +931.2%       5.52 ± 90%  perf-sched.wait_time.max.ms.__cond_resched.__get_user_pages.get_user_pages_remote.get_arg_page.copy_string_kernel
      6.41 ± 42%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__reset_isolation_suitable.compact_zone.compact_zone_order.try_to_compact_pages
      0.00 ±223%  +4.6e+07%     697.43 ± 69%  perf-sched.wait_time.max.ms.__cond_resched.__vmalloc_area_node.__vmalloc_node_range_noprof.alloc_thread_stack_node.dup_task_struct
      3.42 ± 46%   +1591.8%      57.78 ±149%  perf-sched.wait_time.max.ms.__cond_resched.change_pmd_range.isra.0.change_pud_range
    106.54 ±138%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_read.split_huge_page_to_list_to_order.migrate_pages_batch.migrate_pages_sync
     20.61 ± 74%    +914.8%     209.17 ±121%  perf-sched.wait_time.max.ms.__cond_resched.down_read.xfs_ilock_for_iomap.xfs_read_iomap_begin.iomap_iter
      0.03 ±202%  +24357.2%       7.34 ±134%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      1310 ±138%     -99.7%       3.39 ±129%  perf-sched.wait_time.max.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
    215.44 ± 60%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.isolate_freepages_block.fast_isolate_freepages.isolate_freepages.compaction_alloc
      6.01 ± 47%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.isolate_freepages_block.isolate_freepages.compaction_alloc.migrate_folio_unmap
     25.32 ± 28%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.isolate_migratepages.compact_zone.compact_zone_order.try_to_compact_pages
    181.35 ±201%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.isolate_migratepages_block.isolate_migratepages.compact_zone.compact_zone_order
    335.43 ±141%    +156.3%     859.60 ± 44%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_noprof.alloc_pid.copy_process.kernel_clone
      0.74 ±150%    +731.1%       6.18 ± 68%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.vma_shrink
    304.80 ± 58%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.migrate_pages_batch.migrate_pages_sync.migrate_pages.compact_zone
    167.80 ±223%    +511.9%       1026        perf-sched.wait_time.max.ms.__cond_resched.mutex_lock_killable.pcpu_alloc_noprof.mm_init.dup_mm
      7.52 ± 19%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.rmap_walk_anon.try_to_migrate.migrate_folio_unmap.migrate_pages_batch
     26.92 ± 77%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.shadow_lru_isolate.__list_lru_walk_one.list_lru_walk_one_irq.do_shrink_slab
    200.50 ± 36%    +513.0%       1228 ± 31%  perf-sched.wait_time.max.ms.__cond_resched.shrink_folio_list.evict_folios.try_to_shrink_lruvec.shrink_one
     25.24 ±105%   +2617.2%     685.79 ± 68%  perf-sched.wait_time.max.ms.__cond_resched.try_to_shrink_lruvec.shrink_one.shrink_many.shrink_node
     42.20 ± 40%    +160.7%     110.01 ± 32%  perf-sched.wait_time.max.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
     15.65 ±168%    -100.0%       0.00        perf-sched.wait_time.max.ms.io_schedule.migration_entry_wait_on_locked.migration_entry_wait.do_swap_page
      1475 ±  5%     +51.9%       2241 ± 19%  perf-sched.wait_time.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
    365.80 ± 22%    -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.__drain_all_pages
     35.15 ± 40%    +673.9%     272.04 ±121%  perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.90 ±143%    -100.0%       0.00        perf-sched.wait_time.max.ms.schedule_timeout.kswapd_try_to_sleep.kswapd.kthread
     21.49 ± 11%     -21.5        0.00        perf-profile.calltrace.cycles-pp.__alloc_pages_direct_compact.__alloc_pages_slowpath.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof
     20.75 ± 11%     -20.8        0.00        perf-profile.calltrace.cycles-pp.try_to_compact_pages.__alloc_pages_direct_compact.__alloc_pages_slowpath.__alloc_frozen_pages_noprof.alloc_pages_mpol
     20.75 ± 11%     -20.7        0.00        perf-profile.calltrace.cycles-pp.compact_zone.compact_zone_order.try_to_compact_pages.__alloc_pages_direct_compact.__alloc_pages_slowpath
     20.75 ± 11%     -20.7        0.00        perf-profile.calltrace.cycles-pp.compact_zone_order.try_to_compact_pages.__alloc_pages_direct_compact.__alloc_pages_slowpath.__alloc_frozen_pages_noprof
     19.28 ± 11%     -19.3        0.00        perf-profile.calltrace.cycles-pp.isolate_migratepages.compact_zone.compact_zone_order.try_to_compact_pages.__alloc_pages_direct_compact
     14.19 ±  7%     -14.2        0.00        perf-profile.calltrace.cycles-pp.get_page_from_freelist.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof.page_cache_ra_order
     13.84 ±  7%     -13.8        0.00        perf-profile.calltrace.cycles-pp.rmqueue.get_page_from_freelist.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof
     12.76 ± 16%     -12.8        0.00        perf-profile.calltrace.cycles-pp.isolate_migratepages_block.isolate_migratepages.compact_zone.compact_zone_order.try_to_compact_pages
     11.50 ±  8%     -11.5        0.00        perf-profile.calltrace.cycles-pp.__rmqueue_pcplist.rmqueue.get_page_from_freelist.__alloc_frozen_pages_noprof.alloc_pages_mpol
     11.47 ±  8%     -11.5        0.00        perf-profile.calltrace.cycles-pp.rmqueue_bulk.__rmqueue_pcplist.rmqueue.get_page_from_freelist.__alloc_frozen_pages_noprof
      6.99 ± 20%      -5.6        1.35 ± 11%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.folio_batch_move_lru.__folio_batch_add_and_move
      5.65 ± 78%      -5.5        0.17 ±223%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state
      6.86 ± 17%      -5.4        1.48 ± 10%  perf-profile.calltrace.cycles-pp.__folio_batch_add_and_move.filemap_add_folio.page_cache_ra_order.filemap_fault.__do_fault
      6.84 ± 18%      -5.4        1.47 ± 10%  perf-profile.calltrace.cycles-pp.folio_batch_move_lru.__folio_batch_add_and_move.filemap_add_folio.page_cache_ra_order.filemap_fault
      6.49 ± 18%      -5.1        1.37 ± 11%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.folio_batch_move_lru.__folio_batch_add_and_move.filemap_add_folio
      6.50 ± 18%      -5.1        1.37 ± 10%  perf-profile.calltrace.cycles-pp.folio_lruvec_lock_irqsave.folio_batch_move_lru.__folio_batch_add_and_move.filemap_add_folio.page_cache_ra_order
      7.18 ± 16%      -5.1        2.12 ±  6%  perf-profile.calltrace.cycles-pp.filemap_add_folio.page_cache_ra_order.filemap_fault.__do_fault.do_read_fault
      2.02 ± 21%      -1.0        1.06 ±  8%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irq.evict_folios.try_to_shrink_lruvec.shrink_one.shrink_many
      2.01 ± 21%      -1.0        1.05 ±  8%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.evict_folios.try_to_shrink_lruvec.shrink_one
      1.33 ±  7%      -0.9        0.45 ± 44%  perf-profile.calltrace.cycles-pp.read_pages.page_cache_ra_order.filemap_fault.__do_fault.do_read_fault
      1.32 ±  7%      -0.9        0.45 ± 44%  perf-profile.calltrace.cycles-pp.iomap_readahead.read_pages.page_cache_ra_order.filemap_fault.__do_fault
      1.24 ±  6%      -0.7        0.58 ±  5%  perf-profile.calltrace.cycles-pp.do_rw_once
      2.27 ±  8%      -0.4        1.84 ±  3%  perf-profile.calltrace.cycles-pp.kthread.ret_from_fork.ret_from_fork_asm
      2.27 ±  8%      -0.4        1.84 ±  3%  perf-profile.calltrace.cycles-pp.ret_from_fork.ret_from_fork_asm
      2.27 ±  8%      -0.4        1.84 ±  3%  perf-profile.calltrace.cycles-pp.ret_from_fork_asm
      0.00            +0.6        0.63 ±  7%  perf-profile.calltrace.cycles-pp.__filemap_add_folio.filemap_add_folio.page_cache_ra_order.filemap_fault.__do_fault
      0.00            +0.6        0.64 ±  6%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.unreserve_highatomic_pageblock.__alloc_pages_slowpath.__alloc_frozen_pages_noprof.alloc_pages_mpol
      0.00            +0.6        0.64 ±  6%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.unreserve_highatomic_pageblock.__alloc_pages_slowpath.__alloc_frozen_pages_noprof
      0.00            +0.6        0.64 ±  5%  perf-profile.calltrace.cycles-pp.unreserve_highatomic_pageblock.__alloc_pages_slowpath.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof
      0.00            +0.7        0.66 ±  2%  perf-profile.calltrace.cycles-pp.prep_move_freepages_block.try_to_steal_block.rmqueue_bulk.__rmqueue_pcplist.rmqueue
      0.00            +0.7        0.70 ±  3%  perf-profile.calltrace.cycles-pp.try_to_free_pages.__alloc_pages_slowpath.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof
      0.00            +0.8        0.75 ±  2%  perf-profile.calltrace.cycles-pp.try_to_steal_block.rmqueue_bulk.__rmqueue_pcplist.rmqueue.get_page_from_freelist
      0.00            +1.3        1.32 ±  7%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.free_one_page.free_unref_folios.shrink_folio_list
      0.00            +1.3        1.32 ±  7%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.free_one_page.free_unref_folios.shrink_folio_list.evict_folios
      0.00            +1.3        1.32 ±  7%  perf-profile.calltrace.cycles-pp.free_one_page.free_unref_folios.shrink_folio_list.evict_folios.try_to_shrink_lruvec
      0.88 ± 11%      +2.2        3.08        perf-profile.calltrace.cycles-pp.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.pte_alloc_one.do_read_fault
      0.88 ± 11%      +2.2        3.08        perf-profile.calltrace.cycles-pp.alloc_pages_mpol.alloc_pages_noprof.pte_alloc_one.do_read_fault.do_pte_missing
      0.88 ± 11%      +2.2        3.08        perf-profile.calltrace.cycles-pp.alloc_pages_noprof.pte_alloc_one.do_read_fault.do_pte_missing.__handle_mm_fault
      0.88 ± 11%      +2.2        3.08        perf-profile.calltrace.cycles-pp.pte_alloc_one.do_read_fault.do_pte_missing.__handle_mm_fault.handle_mm_fault
      0.00            +2.4        2.37 ±  2%  perf-profile.calltrace.cycles-pp.get_page_from_freelist.__alloc_pages_slowpath.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof
      0.00            +2.8        2.78 ± 10%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.rmqueue.get_page_from_freelist.__alloc_pages_slowpath.__alloc_frozen_pages_noprof
      0.00            +2.8        2.78 ± 10%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.rmqueue.get_page_from_freelist.__alloc_pages_slowpath
      0.00            +3.1        3.08        perf-profile.calltrace.cycles-pp.__alloc_pages_slowpath.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.pte_alloc_one
     93.16 ±  2%      +3.5       96.62        perf-profile.calltrace.cycles-pp.do_access
     92.48 ±  2%      +3.8       96.30        perf-profile.calltrace.cycles-pp.asm_exc_page_fault.do_access
     92.40 ±  2%      +3.8       96.24        perf-profile.calltrace.cycles-pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.do_access
     92.40 ±  2%      +3.8       96.25        perf-profile.calltrace.cycles-pp.exc_page_fault.asm_exc_page_fault.do_access
     92.36 ±  2%      +3.9       96.23        perf-profile.calltrace.cycles-pp.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.do_access
     92.33 ±  2%      +3.9       96.21        perf-profile.calltrace.cycles-pp.do_pte_missing.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault
     92.33 ±  2%      +3.9       96.21        perf-profile.calltrace.cycles-pp.do_read_fault.do_pte_missing.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
     92.35 ±  2%      +4.0       96.31        perf-profile.calltrace.cycles-pp.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
     17.84 ±  9%      +5.3       23.12        perf-profile.calltrace.cycles-pp.arch_tlbbatch_flush.try_to_unmap_flush.shrink_folio_list.evict_folios.try_to_shrink_lruvec
     17.84 ±  9%      +5.3       23.12        perf-profile.calltrace.cycles-pp.on_each_cpu_cond_mask.arch_tlbbatch_flush.try_to_unmap_flush.shrink_folio_list.evict_folios
     17.83 ±  9%      +5.3       23.11        perf-profile.calltrace.cycles-pp.smp_call_function_many_cond.on_each_cpu_cond_mask.arch_tlbbatch_flush.try_to_unmap_flush.shrink_folio_list
     17.84 ±  9%      +5.3       23.12        perf-profile.calltrace.cycles-pp.try_to_unmap_flush.shrink_folio_list.evict_folios.try_to_shrink_lruvec.shrink_one
      0.00            +5.7        5.72 ± 10%  perf-profile.calltrace.cycles-pp.__alloc_pages_slowpath.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof.page_cache_ra_unbounded
      0.00            +5.7        5.73 ± 10%  perf-profile.calltrace.cycles-pp.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof.page_cache_ra_unbounded.filemap_fault
      0.00            +5.7        5.73 ± 10%  perf-profile.calltrace.cycles-pp.alloc_pages_mpol.folio_alloc_noprof.page_cache_ra_unbounded.filemap_fault.__do_fault
      0.00            +5.7        5.73 ± 10%  perf-profile.calltrace.cycles-pp.folio_alloc_noprof.page_cache_ra_unbounded.filemap_fault.__do_fault.do_read_fault
      0.00            +5.7        5.75 ± 10%  perf-profile.calltrace.cycles-pp.page_cache_ra_unbounded.filemap_fault.__do_fault.do_read_fault.do_pte_missing
     22.03 ±  7%      +7.3       29.35 ±  2%  perf-profile.calltrace.cycles-pp.free_frozen_page_commit.free_unref_folios.shrink_folio_list.evict_folios.try_to_shrink_lruvec
     21.90 ±  7%      +7.4       29.28 ±  2%  perf-profile.calltrace.cycles-pp.free_pcppages_bulk.free_frozen_page_commit.free_unref_folios.shrink_folio_list.evict_folios
     21.68 ±  7%      +7.5       29.17 ±  2%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.free_pcppages_bulk.free_frozen_page_commit.free_unref_folios.shrink_folio_list
     21.65 ±  7%      +7.5       29.16 ±  2%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.free_pcppages_bulk.free_frozen_page_commit.free_unref_folios
     22.13 ±  7%      +8.7       30.85 ±  2%  perf-profile.calltrace.cycles-pp.free_unref_folios.shrink_folio_list.evict_folios.try_to_shrink_lruvec.shrink_one
     45.19 ±  8%     +11.0       56.15        perf-profile.calltrace.cycles-pp.try_to_free_pages.__alloc_pages_slowpath.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof
     45.07 ±  8%     +11.7       56.81        perf-profile.calltrace.cycles-pp.do_try_to_free_pages.try_to_free_pages.__alloc_pages_slowpath.__alloc_frozen_pages_noprof.alloc_pages_mpol
     45.06 ±  8%     +11.7       56.80        perf-profile.calltrace.cycles-pp.shrink_node.do_try_to_free_pages.try_to_free_pages.__alloc_pages_slowpath.__alloc_frozen_pages_noprof
     45.04 ±  8%     +11.7       56.79        perf-profile.calltrace.cycles-pp.shrink_many.shrink_node.do_try_to_free_pages.try_to_free_pages.__alloc_pages_slowpath
     45.03 ±  8%     +11.8       56.79        perf-profile.calltrace.cycles-pp.shrink_one.shrink_many.shrink_node.do_try_to_free_pages.try_to_free_pages
     46.17 ±  7%     +12.2       58.42        perf-profile.calltrace.cycles-pp.evict_folios.try_to_shrink_lruvec.shrink_one.shrink_many.shrink_node
     44.27 ±  8%     +12.4       56.63        perf-profile.calltrace.cycles-pp.try_to_shrink_lruvec.shrink_one.shrink_many.shrink_node.do_try_to_free_pages
     43.67 ±  7%     +13.4       57.06        perf-profile.calltrace.cycles-pp.shrink_folio_list.evict_folios.try_to_shrink_lruvec.shrink_one.shrink_many
     68.15 ±  2%     +16.1       84.30        perf-profile.calltrace.cycles-pp.__alloc_pages_slowpath.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof.page_cache_ra_order
     10.91 ± 10%     +20.1       31.00        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.rmqueue_bulk.__rmqueue_pcplist.rmqueue.get_page_from_freelist
     10.90 ± 10%     +20.1       30.99        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.rmqueue_bulk.__rmqueue_pcplist.rmqueue
      0.42 ± 72%     +31.5       31.88        perf-profile.calltrace.cycles-pp.rmqueue_bulk.__rmqueue_pcplist.rmqueue.get_page_from_freelist.__alloc_pages_slowpath
      0.43 ± 72%     +31.5       31.90        perf-profile.calltrace.cycles-pp.__rmqueue_pcplist.rmqueue.get_page_from_freelist.__alloc_pages_slowpath.__alloc_frozen_pages_noprof
      0.91 ± 19%     +31.6       32.48        perf-profile.calltrace.cycles-pp.get_page_from_freelist.__alloc_pages_slowpath.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof
      0.84 ± 20%     +33.9       34.72        perf-profile.calltrace.cycles-pp.rmqueue.get_page_from_freelist.__alloc_pages_slowpath.__alloc_frozen_pages_noprof.alloc_pages_mpol
     21.49 ± 11%     -21.5        0.00        perf-profile.children.cycles-pp.__alloc_pages_direct_compact
     20.91 ± 11%     -20.9        0.03 ±223%  perf-profile.children.cycles-pp.compact_zone
     20.76 ± 11%     -20.8        0.00        perf-profile.children.cycles-pp.try_to_compact_pages
     20.75 ± 11%     -20.8        0.00        perf-profile.children.cycles-pp.compact_zone_order
     19.29 ± 11%     -19.3        0.00        perf-profile.children.cycles-pp.isolate_migratepages
     12.77 ± 16%     -12.8        0.00        perf-profile.children.cycles-pp.isolate_migratepages_block
      7.53 ± 17%      -5.7        1.87 ± 10%  perf-profile.children.cycles-pp.__folio_batch_add_and_move
      7.54 ± 17%      -5.7        1.88 ± 10%  perf-profile.children.cycles-pp.folio_batch_move_lru
      7.14 ± 18%      -5.4        1.76 ± 10%  perf-profile.children.cycles-pp.folio_lruvec_lock_irqsave
      7.20 ± 16%      -5.1        2.14 ±  6%  perf-profile.children.cycles-pp.filemap_add_folio
      2.80 ± 18%      -1.3        1.46 ±  8%  perf-profile.children.cycles-pp._raw_spin_lock_irq
      1.35 ±  7%      -0.8        0.53 ±  5%  perf-profile.children.cycles-pp.iomap_readahead
      1.35 ±  7%      -0.8        0.54 ±  5%  perf-profile.children.cycles-pp.read_pages
      1.49 ±  6%      -0.8        0.70 ±  5%  perf-profile.children.cycles-pp.do_rw_once
      1.26 ±  7%      -0.8        0.50 ±  5%  perf-profile.children.cycles-pp.iomap_readpage_iter
      1.08 ±  8%      -0.6        0.44 ±  6%  perf-profile.children.cycles-pp.zero_user_segments
      1.08 ±  7%      -0.6        0.44 ±  6%  perf-profile.children.cycles-pp.memset_orig
      0.75 ± 37%      -0.6        0.13 ±109%  perf-profile.children.cycles-pp.shrink_slab_memcg
      0.71 ± 39%      -0.6        0.12 ±110%  perf-profile.children.cycles-pp.do_shrink_slab
      2.27 ±  8%      -0.4        1.84 ±  3%  perf-profile.children.cycles-pp.kthread
      2.27 ±  8%      -0.4        1.85 ±  3%  perf-profile.children.cycles-pp.ret_from_fork
      2.27 ±  8%      -0.4        1.86 ±  3%  perf-profile.children.cycles-pp.ret_from_fork_asm
      1.42 ± 14%      -0.2        1.18 ±  4%  perf-profile.children.cycles-pp._raw_spin_lock
      0.32 ± 10%      -0.2        0.11 ±  6%  perf-profile.children.cycles-pp.__filemap_remove_folio
      0.48 ± 18%      -0.2        0.29 ±  7%  perf-profile.children.cycles-pp.try_to_unmap
      0.33 ±  9%      -0.2        0.14 ±  6%  perf-profile.children.cycles-pp.isolate_folios
      0.32 ±  9%      -0.2        0.14 ±  7%  perf-profile.children.cycles-pp.scan_folios
      0.26 ± 15%      -0.2        0.09 ± 12%  perf-profile.children.cycles-pp.asm_sysvec_call_function
      0.24 ±  8%      -0.2        0.07 ±  6%  perf-profile.children.cycles-pp.lru_add
      0.23 ±  8%      -0.2        0.08 ± 10%  perf-profile.children.cycles-pp.lru_gen_add_folio
      0.59 ± 10%      -0.1        0.45 ±  6%  perf-profile.children.cycles-pp.__drain_all_pages
      0.21 ±  5%      -0.1        0.07 ±  6%  perf-profile.children.cycles-pp.iomap_release_folio
      0.22 ±  8%      -0.1        0.09 ±  6%  perf-profile.children.cycles-pp.__free_one_page
      0.20 ±  9%      -0.1        0.08 ±  8%  perf-profile.children.cycles-pp.lru_gen_del_folio
      0.18 ±  6%      -0.1        0.07 ±  6%  perf-profile.children.cycles-pp.filemap_map_pages
      0.23 ±  7%      -0.1        0.13 ±  5%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.18 ±  7%      -0.1        0.07 ± 15%  perf-profile.children.cycles-pp.__lruvec_stat_mod_folio
      0.25 ± 13%      -0.1        0.15 ±  8%  perf-profile.children.cycles-pp.folio_remove_rmap_ptes
      0.14 ± 11%      -0.1        0.04 ± 72%  perf-profile.children.cycles-pp.__mod_memcg_lruvec_state
      0.20 ±  6%      -0.1        0.12 ±  4%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.19 ±  7%      -0.1        0.11 ±  4%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.14 ± 19%      -0.1        0.08 ±  8%  perf-profile.children.cycles-pp.get_pfn_folio
      0.10 ± 18%      -0.1        0.04 ± 44%  perf-profile.children.cycles-pp.__flush_smp_call_function_queue
      0.16 ±  4%      -0.1        0.09 ±  5%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.12 ± 20%      -0.1        0.06 ±  9%  perf-profile.children.cycles-pp.sysvec_call_function
      0.51 ±  5%      -0.1        0.45 ±  6%  perf-profile.children.cycles-pp.drain_pages_zone
      0.10 ± 17%      -0.1        0.04 ± 44%  perf-profile.children.cycles-pp.__sysvec_call_function
      0.12 ±  6%      -0.0        0.08 ±  6%  perf-profile.children.cycles-pp.tick_nohz_handler
      0.11 ±  6%      -0.0        0.07 ±  8%  perf-profile.children.cycles-pp.update_process_times
      0.08 ±  5%      -0.0        0.05 ±  7%  perf-profile.children.cycles-pp.sched_tick
      0.10 ± 17%      +0.0        0.12 ±  8%  perf-profile.children.cycles-pp.vfs_write
      0.07 ± 18%      +0.0        0.11 ±  9%  perf-profile.children.cycles-pp.generic_perform_write
      0.08 ± 14%      +0.0        0.12 ±  8%  perf-profile.children.cycles-pp.record__pushfn
      0.08 ± 14%      +0.0        0.12 ±  8%  perf-profile.children.cycles-pp.writen
      0.07 ± 20%      +0.0        0.12 ± 10%  perf-profile.children.cycles-pp.shmem_file_write_iter
      0.13 ± 10%      +0.0        0.17 ±  7%  perf-profile.children.cycles-pp.perf_mmap__push
      0.14 ± 10%      +0.0        0.18 ±  6%  perf-profile.children.cycles-pp.record__mmap_read_evlist
      0.00            +0.1        0.05 ±  7%  perf-profile.children.cycles-pp.exec_binprm
      0.00            +0.1        0.05 ±  7%  perf-profile.children.cycles-pp.load_elf_binary
      0.00            +0.1        0.05 ±  8%  perf-profile.children.cycles-pp.bprm_execve
      0.03 ±100%      +0.1        0.09 ±  9%  perf-profile.children.cycles-pp.shmem_alloc_and_add_folio
      0.03 ±100%      +0.1        0.09 ± 11%  perf-profile.children.cycles-pp.shmem_get_folio_gfp
      0.03 ±100%      +0.1        0.09 ± 11%  perf-profile.children.cycles-pp.shmem_write_begin
      0.00            +0.1        0.06 ± 25%  perf-profile.children.cycles-pp.alloc_anon_folio
      0.01 ±223%      +0.1        0.07 ± 14%  perf-profile.children.cycles-pp.shmem_alloc_folio
      0.00            +0.1        0.07 ± 18%  perf-profile.children.cycles-pp.copy_string_kernel
      0.00            +0.1        0.07 ± 26%  perf-profile.children.cycles-pp.do_anonymous_page
      0.00            +0.1        0.08 ± 16%  perf-profile.children.cycles-pp.__get_user_pages
      0.00            +0.1        0.08 ± 16%  perf-profile.children.cycles-pp.get_arg_page
      0.00            +0.1        0.08 ± 16%  perf-profile.children.cycles-pp.get_user_pages_remote
      0.00            +0.1        0.08 ± 14%  perf-profile.children.cycles-pp.do_sync_mmap_readahead
      0.27 ± 24%      +0.1        0.40 ±  8%  perf-profile.children.cycles-pp.do_syscall_64
      0.27 ± 24%      +0.1        0.40 ±  8%  perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.00            +0.1        0.13 ± 11%  perf-profile.children.cycles-pp.vma_alloc_folio_noprof
      0.00            +0.2        0.16 ± 12%  perf-profile.children.cycles-pp.__x64_sys_execve
      0.00            +0.2        0.16 ± 12%  perf-profile.children.cycles-pp.do_execveat_common
      0.00            +0.2        0.16 ± 12%  perf-profile.children.cycles-pp.execve
      0.46 ± 22%      +0.2        0.65 ±  6%  perf-profile.children.cycles-pp.xas_store
      0.01 ±223%      +0.2        0.20 ±  9%  perf-profile.children.cycles-pp.folio_alloc_mpol_noprof
      0.30 ± 32%      +0.3        0.60 ±  7%  perf-profile.children.cycles-pp.xas_create
      0.29 ± 34%      +0.4        0.64 ±  7%  perf-profile.children.cycles-pp.__filemap_add_folio
      0.35 ± 17%      +0.4        0.70 ±  2%  perf-profile.children.cycles-pp.prep_move_freepages_block
      0.14 ± 70%      +0.4        0.55 ±  8%  perf-profile.children.cycles-pp.xas_alloc
      0.22 ± 51%      +0.4        0.62 ±  8%  perf-profile.children.cycles-pp.___slab_alloc
      0.14 ± 70%      +0.5        0.60 ±  8%  perf-profile.children.cycles-pp.kmem_cache_alloc_lru_noprof
      0.14 ± 72%      +0.5        0.60 ±  8%  perf-profile.children.cycles-pp.allocate_slab
      0.05 ±223%      +0.7        0.71 ±  5%  perf-profile.children.cycles-pp.unreserve_highatomic_pageblock
      0.00            +0.8        0.80        perf-profile.children.cycles-pp.try_to_steal_block
      0.00            +1.5        1.50 ±  7%  perf-profile.children.cycles-pp.free_one_page
      0.88 ± 11%      +2.2        3.12        perf-profile.children.cycles-pp.pte_alloc_one
      0.89 ± 11%      +2.4        3.29        perf-profile.children.cycles-pp.alloc_pages_noprof
     93.43 ±  2%      +3.3       96.74        perf-profile.children.cycles-pp.do_access
     92.33 ±  2%      +4.0       96.28        perf-profile.children.cycles-pp.do_read_fault
     92.33 ±  2%      +4.0       96.31        perf-profile.children.cycles-pp.do_pte_missing
     92.49 ±  2%      +4.0       96.52        perf-profile.children.cycles-pp.asm_exc_page_fault
     92.41 ±  2%      +4.0       96.46        perf-profile.children.cycles-pp.exc_page_fault
     92.41 ±  2%      +4.0       96.46        perf-profile.children.cycles-pp.do_user_addr_fault
     92.37 ±  2%      +4.1       96.52        perf-profile.children.cycles-pp.handle_mm_fault
     92.35 ±  2%      +4.2       96.51        perf-profile.children.cycles-pp.__handle_mm_fault
      0.30 ± 15%      +5.5        5.78 ± 10%  perf-profile.children.cycles-pp.page_cache_ra_unbounded
     17.97 ±  9%      +5.6       23.56        perf-profile.children.cycles-pp.try_to_unmap_flush
     17.97 ±  9%      +5.6       23.56        perf-profile.children.cycles-pp.arch_tlbbatch_flush
     17.97 ±  9%      +5.6       23.58        perf-profile.children.cycles-pp.on_each_cpu_cond_mask
     17.97 ±  9%      +5.6       23.58        perf-profile.children.cycles-pp.smp_call_function_many_cond
     82.68 ±  2%      +7.8       90.43        perf-profile.children.cycles-pp.folio_alloc_noprof
     22.07 ±  7%      +7.9       29.92 ±  2%  perf-profile.children.cycles-pp.free_frozen_page_commit
     22.20 ±  7%      +7.9       30.09 ±  2%  perf-profile.children.cycles-pp.free_pcppages_bulk
     22.13 ±  7%      +9.3       31.42 ±  2%  perf-profile.children.cycles-pp.free_unref_folios
     83.71 ±  2%     +10.8       94.50        perf-profile.children.cycles-pp.alloc_pages_mpol
     83.71 ±  2%     +10.8       94.52        perf-profile.children.cycles-pp.__alloc_frozen_pages_noprof
     47.00 ±  8%     +12.0       58.98        perf-profile.children.cycles-pp.shrink_node
     46.98 ±  8%     +12.0       58.97        perf-profile.children.cycles-pp.shrink_many
     46.97 ±  8%     +12.0       58.96        perf-profile.children.cycles-pp.shrink_one
     45.19 ±  8%     +12.0       57.22        perf-profile.children.cycles-pp.try_to_free_pages
     45.07 ±  8%     +12.1       57.18        perf-profile.children.cycles-pp.do_try_to_free_pages
     46.21 ±  7%     +12.6       58.81        perf-profile.children.cycles-pp.try_to_shrink_lruvec
     46.18 ±  7%     +12.6       58.79        perf-profile.children.cycles-pp.evict_folios
     43.67 ±  7%     +13.7       57.42        perf-profile.children.cycles-pp.shrink_folio_list
     16.71 ±  7%     +18.9       35.65        perf-profile.children.cycles-pp.rmqueue
     17.15 ±  6%     +18.9       36.10        perf-profile.children.cycles-pp.get_page_from_freelist
     52.45 ±  6%     +19.0       71.46        perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
     12.76 ±  7%     +20.1       32.82 ±  2%  perf-profile.children.cycles-pp.__rmqueue_pcplist
     12.73 ±  7%     +20.1       32.81 ±  2%  perf-profile.children.cycles-pp.rmqueue_bulk
     48.52 ±  6%     +20.4       68.92        perf-profile.children.cycles-pp._raw_spin_lock_irqsave
     68.16 ±  2%     +26.1       94.26        perf-profile.children.cycles-pp.__alloc_pages_slowpath
     11.45 ± 16%     -11.4        0.00        perf-profile.self.cycles-pp.isolate_migratepages_block
      1.24 ±  6%      -0.7        0.58 ±  5%  perf-profile.self.cycles-pp.do_rw_once
      1.07 ±  7%      -0.6        0.44 ±  6%  perf-profile.self.cycles-pp.memset_orig
      0.69 ±  6%      -0.4        0.32 ±  5%  perf-profile.self.cycles-pp.do_access
      0.18 ±  9%      -0.1        0.06 ±  9%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.14 ±  5%      -0.1        0.05 ±  8%  perf-profile.self.cycles-pp.xas_create
      0.13 ± 12%      -0.1        0.04 ± 71%  perf-profile.self.cycles-pp.__mod_memcg_lruvec_state
      0.18 ±  8%      -0.1        0.09 ±  6%  perf-profile.self.cycles-pp.rmqueue_bulk
      0.16 ±  8%      -0.1        0.08 ±  6%  perf-profile.self.cycles-pp.__free_one_page
      0.12 ±  8%      -0.1        0.04 ± 71%  perf-profile.self.cycles-pp.lru_gen_del_folio
      0.14 ±  7%      -0.1        0.06 ±  9%  perf-profile.self.cycles-pp.lru_gen_add_folio
      0.23 ± 14%      -0.1        0.16 ±  5%  perf-profile.self.cycles-pp.get_page_from_freelist
      0.14 ± 18%      -0.1        0.08 ±  9%  perf-profile.self.cycles-pp.get_pfn_folio
      0.19 ± 12%      -0.1        0.12 ±  7%  perf-profile.self.cycles-pp.folio_remove_rmap_ptes
      0.10 ± 17%      -0.1        0.04 ± 44%  perf-profile.self.cycles-pp.try_to_unmap_one
      0.00            +0.1        0.09        perf-profile.self.cycles-pp.try_to_steal_block
      0.35 ± 17%      +0.4        0.70 ±  2%  perf-profile.self.cycles-pp.prep_move_freepages_block
     17.81 ±  9%      +5.7       23.46        perf-profile.self.cycles-pp.smp_call_function_many_cond
     52.45 ±  6%     +19.0       71.46        perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath


***************************************************************************************************
igk-spr-2sp2: 192 threads 2 sockets Intel(R) Xeon(R) Platinum 8468V  CPU @ 2.4GHz (Sapphire Rapids) with 384G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/rootfs/runtime/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-9.4/debian-12-x86_64-20240206.cgz/300s/igk-spr-2sp2/lru-file-readonce/vm-scalability

commit: 
  f3b92176f4 ("tools/selftests: add guard region test for /proc/$pid/pagemap")
  c2f6ea38fc ("mm: page_alloc: don't steal single pages from biggest buddy")

f3b92176f4f7100f c2f6ea38fc1b640aa7a2e155cc1 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      3202            -6.9%       2980 ±  2%  vmstat.system.cs
 7.028e+09           +29.3%  9.086e+09 ±  7%  cpuidle..time
   1047570 ±  3%     +25.5%    1314776 ±  6%  cpuidle..usage
     41.33 ± 14%     -53.2%      19.33 ± 16%  perf-c2c.DRAM.remote
     21.83 ± 17%     -74.8%       5.50 ± 46%  perf-c2c.HITM.remote
    201.11           +16.3%     233.86 ±  2%  uptime.boot
     15372           +13.3%      17409 ±  3%  uptime.idle
     23.54            +3.1       26.67 ±  5%  mpstat.cpu.all.idle%
      0.17            -0.0        0.14        mpstat.cpu.all.irq%
      0.62 ±  2%      -0.1        0.54 ±  3%  mpstat.cpu.all.usr%
    712161 ± 32%     -34.2%     468595 ± 51%  numa-meminfo.node1.Active
    712138 ± 32%     -34.2%     468480 ± 51%  numa-meminfo.node1.Active(anon)
   2258228 ±  2%     +10.1%    2487327 ±  3%  numa-meminfo.node1.KReclaimable
   2258228 ±  2%     +10.1%    2487327 ±  3%  numa-meminfo.node1.SReclaimable
    448452 ±  2%     +10.1%     493655 ±  2%  numa-meminfo.node1.SUnreclaim
   2706681 ±  2%     +10.1%    2980983 ±  3%  numa-meminfo.node1.Slab
  78825258 ±  3%     +16.7%   91989281 ±  7%  numa-numastat.node0.local_node
  16019412 ±  3%     +13.1%   18117651 ±  4%  numa-numastat.node0.numa_foreign
  78871842 ±  3%     +16.8%   92109551 ±  7%  numa-numastat.node0.numa_hit
  16334963 ±  5%     +10.6%   18070987 ±  6%  numa-numastat.node0.other_node
  80193700 ±  2%     +11.5%   89391630 ±  5%  numa-numastat.node1.local_node
  80342559 ±  2%     +11.4%   89475337 ±  5%  numa-numastat.node1.numa_hit
  16019690 ±  3%     +13.1%   18117126 ±  4%  numa-numastat.node1.numa_miss
  16166856 ±  3%     +12.5%   18195515 ±  4%  numa-numastat.node1.other_node
    192310           -15.0%     163540 ±  5%  vm-scalability.median
    536.92 ± 10%    +914.2        1451 ± 25%  vm-scalability.stddev%
  36820572           -15.2%   31208067 ±  3%  vm-scalability.throughput
    151.36           +21.7%     184.20 ±  3%  vm-scalability.time.elapsed_time
    151.36           +21.7%     184.20 ±  3%  vm-scalability.time.elapsed_time.max
    181674 ±  2%      +7.0%     194475 ±  2%  vm-scalability.time.involuntary_context_switches
     14598            -2.3%      14263 ±  2%  vm-scalability.time.percent_of_cpu_this_job_got
     21967           +19.0%      26130 ±  3%  vm-scalability.time.system_time
    130.36            +9.7%     143.04 ±  2%  vm-scalability.time.user_time
  16019412 ±  3%     +13.1%   18117651 ±  4%  numa-vmstat.node0.numa_foreign
  78871330 ±  3%     +16.8%   92109252 ±  7%  numa-vmstat.node0.numa_hit
  78824746 ±  3%     +16.7%   91988983 ±  7%  numa-vmstat.node0.numa_local
  16334963 ±  5%     +10.6%   18070986 ±  6%  numa-vmstat.node0.numa_other
    178237 ± 32%     -34.3%     117055 ± 51%  numa-vmstat.node1.nr_active_anon
    564233 ±  2%      +9.9%     620083 ±  4%  numa-vmstat.node1.nr_slab_reclaimable
    112131 ±  2%     +10.1%     123460 ±  2%  numa-vmstat.node1.nr_slab_unreclaimable
    178236 ± 32%     -34.3%     117054 ± 51%  numa-vmstat.node1.nr_zone_active_anon
  80341637 ±  2%     +11.4%   89474464 ±  5%  numa-vmstat.node1.numa_hit
  80192814 ±  2%     +11.5%   89390757 ±  5%  numa-vmstat.node1.numa_local
  16019690 ±  3%     +13.1%   18117126 ±  4%  numa-vmstat.node1.numa_miss
  16166856 ±  3%     +12.5%   18195515 ±  4%  numa-vmstat.node1.numa_other
   5631918            -1.3%    5555930        proc-vmstat.allocstall_movable
      5122 ±  3%     -16.0%       4304 ±  2%  proc-vmstat.allocstall_normal
      4666 ±  9%     -35.6%       3003 ± 13%  proc-vmstat.compact_stall
      4606 ±  8%     -35.3%       2979 ± 13%  proc-vmstat.compact_success
  83931769            +1.2%   84976863        proc-vmstat.nr_file_pages
  12838642 ±  2%      -8.3%   11776847 ±  2%  proc-vmstat.nr_free_pages
  82959915            +1.3%   84000092        proc-vmstat.nr_inactive_file
      6856            -2.9%       6655        proc-vmstat.nr_page_table_pages
    236984            +8.8%     257869 ±  3%  proc-vmstat.nr_slab_unreclaimable
  82959915            +1.3%   84000093        proc-vmstat.nr_zone_inactive_file
  32308635 ±  2%     +11.6%   36069701 ±  4%  proc-vmstat.numa_foreign
 1.592e+08           +14.1%  1.816e+08 ±  6%  proc-vmstat.numa_hit
  1.59e+08           +14.1%  1.814e+08 ±  6%  proc-vmstat.numa_local
  32308325 ±  2%     +11.6%   36068017 ±  4%  proc-vmstat.numa_miss
  32501819 ±  2%     +11.6%   36266501 ±  4%  proc-vmstat.numa_other
    831409            +9.6%     911004        proc-vmstat.pgfault
     39247            +8.7%      42679        proc-vmstat.pgreuse
 7.585e+08            -1.9%  7.442e+08        proc-vmstat.pgscan_direct
      3177           +50.4%       4778 ± 16%  proc-vmstat.pgscan_khugepaged
 2.212e+08 ±  2%      +6.6%  2.357e+08        proc-vmstat.pgscan_kswapd
 7.585e+08            -1.9%  7.442e+08        proc-vmstat.pgsteal_direct
      3177           +50.4%       4778 ± 16%  proc-vmstat.pgsteal_khugepaged
 2.212e+08 ±  2%      +6.6%  2.357e+08        proc-vmstat.pgsteal_kswapd
 1.272e+10            -2.5%   1.24e+10        perf-stat.i.branch-instructions
      0.25            -0.0        0.24        perf-stat.i.branch-miss-rate%
  26666399            -6.3%   24985765        perf-stat.i.branch-misses
 3.576e+08            -9.7%  3.228e+08 ±  2%  perf-stat.i.cache-misses
 5.327e+08           -10.2%  4.782e+08 ±  2%  perf-stat.i.cache-references
      3040            -5.2%       2882        perf-stat.i.context-switches
 4.277e+11            -2.1%  4.187e+11        perf-stat.i.cpu-cycles
      1096            +9.0%       1194 ±  4%  perf-stat.i.cycles-between-cache-misses
 5.707e+10            -4.2%  5.466e+10        perf-stat.i.instructions
      0.34 ±  2%      -7.2%       0.32 ±  2%  perf-stat.i.ipc
      4750 ±  2%      -8.8%       4331 ±  2%  perf-stat.i.minor-faults
      4750 ±  2%      -8.8%       4331 ±  2%  perf-stat.i.page-faults
      6.26            -5.7%       5.90        perf-stat.overall.MPKI
      0.21            -0.0        0.20        perf-stat.overall.branch-miss-rate%
      1198            +8.5%       1299 ±  3%  perf-stat.overall.cycles-between-cache-misses
      2030           +16.3%       2361 ±  2%  perf-stat.overall.path-length
 1.268e+10            -2.4%  1.238e+10        perf-stat.ps.branch-instructions
  26571078            -6.4%   24874399        perf-stat.ps.branch-misses
 3.561e+08            -9.6%  3.218e+08 ±  2%  perf-stat.ps.cache-misses
 5.307e+08           -10.1%  4.768e+08 ±  2%  perf-stat.ps.cache-references
      3018            -5.2%       2861        perf-stat.ps.context-switches
 5.689e+10            -4.1%  5.454e+10        perf-stat.ps.instructions
      4695 ±  2%      -8.9%       4276 ±  2%  perf-stat.ps.minor-faults
      4696 ±  2%      -8.9%       4276 ±  2%  perf-stat.ps.page-faults
 8.721e+12           +16.3%  1.014e+13 ±  2%  perf-stat.total.instructions
   5824122          +111.8%   12334075 ±  9%  sched_debug.cfs_rq:/.avg_vruntime.avg
   5983673          +112.3%   12702755 ± 11%  sched_debug.cfs_rq:/.avg_vruntime.max
    473360 ±  6%     +43.4%     678799 ± 20%  sched_debug.cfs_rq:/.avg_vruntime.min
    558928          +120.8%    1234340 ± 14%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      9656 ± 21%     +40.5%      13563 ± 17%  sched_debug.cfs_rq:/.load.avg
   5824122          +111.8%   12334076 ±  9%  sched_debug.cfs_rq:/.min_vruntime.avg
   5983673          +112.3%   12702755 ± 11%  sched_debug.cfs_rq:/.min_vruntime.max
    473360 ±  6%     +43.4%     678799 ± 20%  sched_debug.cfs_rq:/.min_vruntime.min
    558928          +120.8%    1234340 ± 14%  sched_debug.cfs_rq:/.min_vruntime.stddev
    509.42           -44.2%     284.44 ± 44%  sched_debug.cfs_rq:/.removed.load_avg.max
     81.20 ± 22%     -50.6%      40.15 ± 49%  sched_debug.cfs_rq:/.removed.load_avg.stddev
    264.92 ±  2%     -42.8%     151.44 ± 44%  sched_debug.cfs_rq:/.removed.runnable_avg.max
     39.89 ± 24%     -50.3%      19.84 ± 49%  sched_debug.cfs_rq:/.removed.runnable_avg.stddev
    264.92 ±  2%     -42.8%     151.44 ± 44%  sched_debug.cfs_rq:/.removed.util_avg.max
     39.89 ± 24%     -50.3%      19.84 ± 49%  sched_debug.cfs_rq:/.removed.util_avg.stddev
    168193 ± 25%     -41.8%      97847 ± 10%  sched_debug.cpu.avg_idle.stddev
     78410           +44.6%     113363 ±  9%  sched_debug.cpu.clock.avg
     78447           +44.6%     113399 ±  9%  sched_debug.cpu.clock.max
     78369           +44.6%     113320 ±  9%  sched_debug.cpu.clock.min
     78152           +44.7%     113050 ±  9%  sched_debug.cpu.clock_task.avg
     78337           +44.6%     113246 ±  9%  sched_debug.cpu.clock_task.max
     64029           +54.4%      98835 ± 10%  sched_debug.cpu.clock_task.min
      5986 ±  5%     +22.6%       7336 ±  6%  sched_debug.cpu.curr->pid.max
      1647 ±  5%     +30.4%       2148 ±  6%  sched_debug.cpu.nr_switches.avg
    411.83 ± 10%     +50.3%     619.04 ± 13%  sched_debug.cpu.nr_switches.min
     78370           +44.6%     113320 ±  9%  sched_debug.cpu_clk
     77323           +45.2%     112275 ±  9%  sched_debug.ktime
     79511           +44.0%     114523 ±  9%  sched_debug.sched_clk
      0.06 ±223%   +1403.4%       0.89 ± 69%  perf-sched.sch_delay.avg.ms.__cond_resched.__get_user_pages.get_user_pages_remote.get_arg_page.copy_string_kernel
      0.20 ±  4%     +21.1%       0.24 ±  7%  perf-sched.sch_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      1.78 ±  2%     +11.5%       1.98 ±  4%  perf-sched.sch_delay.avg.ms.__cond_resched.shrink_folio_list.evict_folios.try_to_shrink_lruvec.shrink_one
      0.65 ± 13%    +136.2%       1.55 ± 22%  perf-sched.sch_delay.avg.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      0.50 ± 18%    +129.5%       1.14 ± 36%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range.do_poll.constprop.0.do_sys_poll
      0.27 ±  5%    +188.1%       0.78 ± 35%  perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.06 ±  9%     +72.5%       0.10 ± 27%  perf-sched.sch_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      0.07 ± 14%    +160.2%       0.18 ± 33%  perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.76 ±113%    +443.8%       4.12 ±108%  perf-sched.sch_delay.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.pte_alloc_one
     22.48 ± 13%    +126.8%      50.99 ± 23%  perf-sched.sch_delay.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof.page_cache_ra_order
      0.12 ±223%   +1193.5%       1.50 ± 88%  perf-sched.sch_delay.max.ms.__cond_resched.__get_user_pages.get_user_pages_remote.get_arg_page.copy_string_kernel
     15.39 ± 15%     +53.8%      23.66 ± 24%  perf-sched.sch_delay.max.ms.__cond_resched.__kmalloc_noprof.ifs_alloc.isra.0
      7.07 ± 29%    +124.7%      15.88 ± 35%  perf-sched.sch_delay.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
     12.90 ±  7%    +148.0%      31.99 ± 21%  perf-sched.sch_delay.max.ms.__cond_resched.down_read.xfs_ilock_for_iomap.xfs_read_iomap_begin.iomap_iter
     16.03 ± 11%    +181.2%      45.07 ± 28%  perf-sched.sch_delay.max.ms.__cond_resched.shrink_folio_list.evict_folios.try_to_shrink_lruvec.shrink_one
      4.24 ±  9%    +290.8%      16.56 ± 48%  perf-sched.sch_delay.max.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      3.03 ± 21%    +711.4%      24.62 ± 75%  perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.31 ± 48%    +792.7%       2.78 ±107%  perf-sched.sch_delay.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      7.87 ± 39%    +237.7%      26.58 ± 61%  perf-sched.sch_delay.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      3633 ± 10%     +34.4%       4883 ±  6%  perf-sched.total_wait_and_delay.max.ms
      3633 ± 10%     +34.4%       4882 ±  6%  perf-sched.total_wait_time.max.ms
      3.93 ±  2%     +59.5%       6.27 ± 33%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      0.97 ± 15%    +187.7%       2.78 ± 24%  perf-sched.wait_and_delay.avg.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      4.31 ±  4%     +67.7%       7.23 ± 17%  perf-sched.wait_and_delay.avg.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      4.28           +14.3%       4.90 ±  6%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    814.17 ± 11%     -33.9%     538.50 ± 23%  perf-sched.wait_and_delay.count.__cond_resched.down_read.xfs_ilock_for_iomap.xfs_read_iomap_begin.iomap_iter
     44.95 ± 13%    +126.8%     101.97 ± 23%  perf-sched.wait_and_delay.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof.page_cache_ra_order
     30.78 ± 15%     +53.8%      47.32 ± 24%  perf-sched.wait_and_delay.max.ms.__cond_resched.__kmalloc_noprof.ifs_alloc.isra.0
     25.79 ±  7%    +148.0%      63.97 ± 21%  perf-sched.wait_and_delay.max.ms.__cond_resched.down_read.xfs_ilock_for_iomap.xfs_read_iomap_begin.iomap_iter
      8.38 ± 10%    +295.4%      33.13 ± 48%  perf-sched.wait_and_delay.max.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
     28.53 ± 54%    +177.7%      79.24 ± 51%  perf-sched.wait_and_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      3.73 ±  2%     +61.6%       6.02 ± 34%  perf-sched.wait_time.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      0.31 ± 19%    +296.2%       1.23 ± 27%  perf-sched.wait_time.avg.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      0.30 ±131%  +45762.6%     136.52 ±161%  perf-sched.wait_time.avg.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
      4.00 ±  4%     +71.1%       6.85 ± 18%  perf-sched.wait_time.avg.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      4.23           +13.6%       4.80 ±  5%  perf-sched.wait_time.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     22.48 ± 13%    +126.8%      50.99 ± 23%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof.page_cache_ra_order
     15.39 ± 15%     +53.8%      23.66 ± 24%  perf-sched.wait_time.max.ms.__cond_resched.__kmalloc_noprof.ifs_alloc.isra.0
     12.90 ±  7%    +148.0%      31.99 ± 21%  perf-sched.wait_time.max.ms.__cond_resched.down_read.xfs_ilock_for_iomap.xfs_read_iomap_begin.iomap_iter
      4.19 ± 10%    +295.4%      16.56 ± 48%  perf-sched.wait_time.max.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      0.31 ±124%  +1.1e+05%     343.77 ±137%  perf-sched.wait_time.max.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
     36.95 ± 29%     +89.2%      69.93 ± 38%  perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone





Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

