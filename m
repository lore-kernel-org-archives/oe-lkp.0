Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1123BBE5
	for <oe-lkp@lists.linux.dev>; Wed, 31 Jul 2024 05:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722403665; cv=fail; b=rdOK6NAWUaxrhgZq1tbq02HcLItlsrQxegz371iIqWXw9aI6zL2coXQnBCGSsj58KEb6BOXb1igQKaWFH4zqekbQoruqHS7lNqyFapTZMt67P2NV1DZU67zoBYxPkqEqpSd6whgJkJ5kZNpPqksTaC1FaXSqcMU9kNnnv2bxRqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722403665; c=relaxed/simple;
	bh=21dQ5UJT6epVxT+csCK1I6yj572pLDaWQ/C9ril8QmU=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=UljFTYiynXCsc/PwdnJAPuvctxyJA/KBD7taBSmLoxTSdaDahndO7BZqtDRi/UBigGuCoUahXCq2c6R6remwuZHdCrbPMMbxGqyCecddVQMzmjr1UKmECRJevalObhok8trMsUX/FKT3Tv2QiEoHW4ArBCZy/L4y0xemiP9x87s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jRN9pAoL; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jRN9pAoL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722403663; x=1753939663;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=21dQ5UJT6epVxT+csCK1I6yj572pLDaWQ/C9ril8QmU=;
  b=jRN9pAoLJVeyflkIiewamzXKgLzbrXDiFgfEgpmO0RUEPefunMfNg8Lt
   48HNYoftWTRAD3wcnmcLiYJVkReQr+HGFHW6CAmLfW/UV0qAJhkQ6cPOZ
   WvcijJBa9aZYLPFE8V2HEIwU4lYQN/1HM8ydfrIrTxIyjPuUXu0Ql1h5J
   ejttOArXULL1i0NPR1780cptXjQa0xpn6vcQsGg5U0gxKYWr/mkdrUWAC
   65BBtBc0Oaw97rN/2OKuOpxg0NA0NtkU1BG8ukNYF63Yh+jvlaojVYr2d
   qlbgHJ94Xckzq5ukVby6ThREkY5v16gKRThb5eoMNnWmCc33PEq+CvBcb
   g==;
X-CSE-ConnectionGUID: 9rWwnSY9QDaY53/MTlSIcA==
X-CSE-MsgGUID: l2NVgGe7RHOmrhTFDW9htw==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="19851583"
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; 
   d="scan'208";a="19851583"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 22:27:42 -0700
X-CSE-ConnectionGUID: 53rf9fEPR+iSG7Yhfi1+wA==
X-CSE-MsgGUID: Y0FKGlM7Rri4xAXy+nT5fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; 
   d="scan'208";a="54608737"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 30 Jul 2024 22:27:41 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 30 Jul 2024 22:27:41 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 30 Jul 2024 22:27:41 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 30 Jul 2024 22:27:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wZtw6CHfTh6JlM3zfzqp1pUmwG7+/jVnfbz1KvUXY+I9I7T3AxsIUkmILSfGnYSNnlzJbSOZsiMRCd3/5c2hYut4z+RsMIf0cgtcw6wIvczJx8CMRsPOnAIPFkWfaOn7dLBSg1XGLc8/7133vFmYh7rOu26Teuj2PsXp+ZNSEgUpZjllbNaP0jiRHIIMHAROUwKZy/go5mRZSWdFn0RRdZyam3SzPTy39qIRpM6eWw8GGbh8BR1DuttdIKJdcF0g7XmTl2EDD028e+n0bHS6RPBEKAYcFehzIeVPeabGLr3normESRkFG8W9z8tTE2aU/AvVEbiS78XyaYzP83Xyhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3lEKd3HC3QE/V0K3ZGgsdbuqbfIrVcRoR6Mi2qHGUkw=;
 b=VBUO+DMSlOeVJTzodF7+NS0eP+zcN8MKLZeK4Lm3MAVRuuvJlXi/rFIaC0VvYELGsWBBrsqd8W9NJG8jdfYGzcL9pS8c9GUHVwORfhrIRRFwRV47uHjSPOkcMebVLFACaem6y9F7HzDdlzgOEBC8+g4OyVN+gwxW6WVV4bMMQEG51bQTxHRidxfk/ZXnxw0dANK0zWQOBMnUsOm+c6OnhI3rrvLx65SPXuhnHxDWuKthdJc7Y7P7DKCa8lIbu4b+Evk8bLEtylMe8o7Ef0AqSqDFxA05wuoFn00YFw9D4/wvh53LXrA5IrBRIa7MV50Y21LunDbuxSF3eEOKwE2HSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SA0PR11MB4638.namprd11.prod.outlook.com (2603:10b6:806:73::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Wed, 31 Jul
 2024 05:27:38 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.7807.026; Wed, 31 Jul 2024
 05:27:38 +0000
Date: Wed, 31 Jul 2024 13:27:25 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Jann Horn <jannh@google.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Linux Memory Management List
	<linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, "Andrey
 Konovalov" <andreyknvl@gmail.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Christoph Lameter <cl@linux.com>, David Rientjes <rientjes@google.com>,
	Dmitry Vyukov <dvyukov@google.com>, Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	Joonsoo Kim <iamjoonsoo.kim@lge.com>, Marco Elver <elver@google.com>, "Pekka
 Enberg" <penberg@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>, <kasan-dev@googlegroups.com>,
	<oliver.sang@intel.com>
Subject: [linux-next:master] [slub]  d543c8fb9c:
 BUG_filp(Not_tainted):Bulk_free_expected#objects_but_found
Message-ID: <202407311019.5ea52390-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR01CA0054.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::22) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SA0PR11MB4638:EE_
X-MS-Office365-Filtering-Correlation-Id: 33474b62-e97b-4c30-70ff-08dcb1217dae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BxuWXhEvtPCxDBXjEdJbaotmBzWIwIGxvLRnZL7dVsvEr2zpQSYZxNXO3p9E?=
 =?us-ascii?Q?DA4caDAMVmrRsZbDhgi5Ev+PRJSKlWIDSN+0kEGFJxyc3qjV4yHiH60bOr/o?=
 =?us-ascii?Q?JkL4bjtMZfoz9nlBVivatgN52JwpsOtuFcIreunnXOyc3ZKgfikz+h9dgBkq?=
 =?us-ascii?Q?pG278KRd96jNX2INT5yAzNrJ/sHD+RMtKFz+C+MYRn+toc3lhc5HsV0vyH8w?=
 =?us-ascii?Q?2lUfU+sZ3SRXM6L+h0KnV2xqnpxtSlwWZABLBKnngmrqsExKpAc67AfRRYdG?=
 =?us-ascii?Q?GHKJKgjfC6+wFMDSWc5I3bJsJkchNfMQMYguZc+R9qCUaeOst7lIXMSOy3CI?=
 =?us-ascii?Q?v8Nw9qi0kVfzZxNV8EyxIXmwa1sIkoB+ftkom3G/JfOZSTinlgi0keMMgs+r?=
 =?us-ascii?Q?CBuIyJcr23RhCTQc8Q+srSIl1amLGmpaOLu3E0SbOInCaR0uQhYg8gdF7JN1?=
 =?us-ascii?Q?VvzQ3IuAsFJys7NXgP+zdPdIHBNm/knwC3I8uY1zmqH4l325QsOc5DFGACjP?=
 =?us-ascii?Q?iLBwTLcqA+s3XwRG97Syg6M0/5dxNoRYIQMqKKSlf+T8aWDY1ii0Vk3b+oz+?=
 =?us-ascii?Q?pWzrSX4SZ2hwqIGvyQ8Ueeuy5E4qhKbmcXDNX837RQ7SXk1WLewEGiaeVTl7?=
 =?us-ascii?Q?pbn754m42PSyWmemh9F7vLWcVzwO9Nye7z74AMYZ+HBUZFBvXdFJFt4SVKn5?=
 =?us-ascii?Q?VUUcLiwqqdyc6XRbItAh2xvVZrKzdJtO0QVL3aJkKeqiDU2kWQzspb4hjpo2?=
 =?us-ascii?Q?W9Da1GOzZOi4hIAZN/5TRooqOjZL3DQXJm6bcke09D5JVKkakWw7z2kHHjxn?=
 =?us-ascii?Q?10/mpiVvY9uPl634d3qTYkQUYZMV/gaw3DFfhJXz+tqRZDvk90o5JdE/GoMX?=
 =?us-ascii?Q?nTSCzUx+rb2qAQ8zo1MWrNxpgPF6nBUKSE2HM4L1HwpzG14HMvFKLF+K4tti?=
 =?us-ascii?Q?mdKXy5v4WyZSt+yl+vHraZchv92WFk4wavCo9hUGz52qr9l8MYrR/OFgMw//?=
 =?us-ascii?Q?+7CSd8nHERH5yT2c3T2B+iJQ40lzDurSACA/u7qSs+C+4Qe8NVcMw6S1/y1S?=
 =?us-ascii?Q?S49iy4v9FXh/tjAbzNf8NNrnsZaBokQBGQakIDyii+EKC+0L8B6jPL4drrVh?=
 =?us-ascii?Q?vXc7/8sdEkucVaXwPXz6982BA9S57gAwqRZkgZmiaE1FlA4u0BU+XeAQaU3u?=
 =?us-ascii?Q?jPXz90Ra6lX+qEl2C7Sf4x4w9wXMrQBY6mAhxkaaYqs5bIxN7iLP80Lz8kzR?=
 =?us-ascii?Q?dwOV7AuVzyRxN/n9xtNwKsvWFTK6oRcBsGVieArvZ2WjxCGMMkcftCTCMTZW?=
 =?us-ascii?Q?A8BXSkz52TJfBULRgf2iKaxu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WZHmGUdADWN/EXEj3/5o6N6kwAjlgoKaLvap28rhZA4bsVS9uWUpBdRFAc5u?=
 =?us-ascii?Q?rlIRHDvv7b0qDh5/t0PcDY4Q18oMn+i/rjyYBS5LkXtppwceV7pleOOAipAv?=
 =?us-ascii?Q?88NmTUTpiXXHv75neAyt7hqMXFJdsgtPcDNghMSKtvhmKu2BIT6kz6qwUoFe?=
 =?us-ascii?Q?mUNJJa6ucf14NLraQnVc4tB1qjXchcaKL15iESH9x5AZh9KI8GefrEkZdo6m?=
 =?us-ascii?Q?tXQckvd8HtJTKo//eMgqCJEXg/rCbYryEIajyeQ4QlvSCG1vzKXDeeFW9tib?=
 =?us-ascii?Q?sJ/FYPnx1yFMKctY1a/+hM0UCAXO0qUD3aGYTb7JxwlyI/GDYUrbAPAMDPmy?=
 =?us-ascii?Q?7cWpv4HDPbUT3z9HQs4I4uWrUAWywKMRcB5BS6HBkagqYup+OoI0/Xf72e8p?=
 =?us-ascii?Q?+LfDwrmRLNIguiNoA8jNGCBuT8WifJ24IRFrAZxaK9Km7FuyDiqoXcdIWErG?=
 =?us-ascii?Q?pgkaUpzhOMHt9KjwdvJlBeNouXNj21KFVpobiwVuiHZ9EyWD6nil8rCXR2TJ?=
 =?us-ascii?Q?sm569O1R2yHtlkEAFaFTchAhnojIpV6nz/+rtmXSg6EYSHSKCXYqgEIC/qms?=
 =?us-ascii?Q?wjOHu/3UD/uzQ6vjuX6mCqq3Iwb8/oFrtv0hQLFhpoukKSyLeB/UUqkBStdk?=
 =?us-ascii?Q?+sNDjf/owPEBCeYQBzURP64yEoAp515MGfiYotfiMe8XlDg5m2WFCaYNw47Y?=
 =?us-ascii?Q?rHk7HOSxiKRacQGO3I33q23yJkwuoL5fq0ZmtZQj5fqSz8L+2gR/vorzoUCz?=
 =?us-ascii?Q?ZSNPENjSPS5Y0Er4aBbEBOTKasnRvmLqX6Ow+1zBK/PKnln8QshDaYhu3AXq?=
 =?us-ascii?Q?BpAXNhjhbaRakV29YGX9dv2HOodPypmUeHSdMOVcMOzv5gHrfBtHxvAVT9jR?=
 =?us-ascii?Q?JkIEcd3N+xSNiPb5H9WaAnKjT6m/KTy4uLSEsln6NTaWlvyQCbpapprngkYg?=
 =?us-ascii?Q?EjnLmUeRMugOYA1mZyplRwbYvqe/DmuDX/QBUeClcBVnmsj2K7MOv9rKc95P?=
 =?us-ascii?Q?W/RP/yguTzaAMq1Bc57N5gn9E+Ludg62WCrE1m/SFjOGb+l13RsFHKQJkbyC?=
 =?us-ascii?Q?a9xD6wGyhQ8xCyb54zGXM/uP+pv+pzlcjJzJnBEIhTEyxnGyBmMqQzAHZuHz?=
 =?us-ascii?Q?TAvvBrCBb7TTSyUiM5d+RkXf/X23gD1ZfxPssBN+J2Bml9VokmorOOvfS4BQ?=
 =?us-ascii?Q?ZnqECUnZ0vDW5DW4iqU0vYd2C/LX1SFKzgkko4at7FUFJauv7oMyI/nMkz6q?=
 =?us-ascii?Q?zrPYqxNyMqx/b9QzFXZ5NbhF9wXJuxJO0CxPvtQxlwM7W5xMTOw8497K450k?=
 =?us-ascii?Q?9HkuMo0n+lTGp00jg4j2DyNwxlb6MPJHuZnjwoJ8Dwme7Jw0qfPj4kbt9KRc?=
 =?us-ascii?Q?8/UfyIIl76brIy4aGEtE1FtsHI2+XxM//bK6jag86mlfNPqnnitwIz+JRTTr?=
 =?us-ascii?Q?b1iA103ohkh87Uk+dBTybQMm1g9YG11nJVFiIoiNfW7ugcdk4DzI8sEUcXPU?=
 =?us-ascii?Q?hujsvydQU6mUYzKWZAtNKjlkIPOJHzQFnuXjJAZdFbfC4xdw70msvZE5c0zd?=
 =?us-ascii?Q?jbbuk/iN+3MNOpUEGLDp6IWqTyMTaMbW5Z4y+SBB5QARlB06j4pM9ibMZ2b0?=
 =?us-ascii?Q?3Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33474b62-e97b-4c30-70ff-08dcb1217dae
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 05:27:38.3369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GBPv8qubab6sOcsDnzpc0rVXA1FYlaraypASp2OwIPcOE5S0/CSsCpQpsjsMs5l1y1QIdxRENgFg5aL4CwKe3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4638
X-OriginatorOrg: intel.com


hi, Jann Horn,

we reported "WARNING:possible_circular_locking_dependency_detected"
issue upon v3 of this patch in
https://lore.kernel.org/all/202407291014.2ead1e72-oliver.sang@intel.com/
several days ago.

at that time, you said that real issue should be something like
"BUG filp (Not tainted): Bulk free expected 1 objects but found 2"
and you will send a fix.

now we noticed this patch in in linux-next/master, but not sure the version.

we found there are still similar issues so just send report to you FYI.



Hello,

kernel test robot noticed "BUG_filp(Not_tainted):Bulk_free_expected#objects_but_found" on:

commit: d543c8fb9c4caa95cd2799b9d3b6f6354140f4f4 ("slub: introduce CONFIG_SLUB_RCU_DEBUG")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

[test failed on linux-next/master cd19ac2f903276b820f5d0d89de0c896c27036ed]

in testcase: rcutorture
version: 
with following parameters:

	runtime: 300s
	test: cpuhotplug
	torture_type: srcud



compiler: gcc-13
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202407311019.5ea52390-lkp@intel.com


[  243.911590][    T0] masked ExtINT on CPU#1
[  244.087218][    T9] smpboot: CPU 1 is now offline
[  244.154988][  T435] smpboot: Booting Node 0 Processor 1 APIC 0x1
[  244.155553][    T0] masked ExtINT on CPU#1
[  244.226610][    C1] =============================================================================
[  244.227574][    C1] BUG filp (Not tainted): Bulk free expected 1 objects but found 2
[  244.227574][    C1]
[  244.228097][    C1] -----------------------------------------------------------------------------
[  244.228097][    C1]
[  244.228665][    C1] Slab 0xffffea0005dac500 objects=23 used=23 fp=0x0000000000000000 flags=0x8000000000000040(head|zone=2)
[  244.229241][    C1] CPU: 1 UID: 0 PID: 22 Comm: cpuhp/1 Not tainted 6.10.0-12959-gd543c8fb9c4c #1
[  244.229725][    C1] Call Trace:
[  244.229909][    C1]  <IRQ>
[ 244.230069][ C1] dump_stack_lvl (kbuild/src/consumer/lib/dump_stack.c:122) 
[ 244.230337][ C1] slab_err (kbuild/src/consumer/mm/slub.c:1149) 
[ 244.230606][ C1] ? check_object (kbuild/src/consumer/mm/slub.c:1293 kbuild/src/consumer/mm/slub.c:1391) 
[ 244.230925][ C1] free_debug_processing (kbuild/src/consumer/mm/slub.c:3378) 


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240731/202407311019.5ea52390-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

