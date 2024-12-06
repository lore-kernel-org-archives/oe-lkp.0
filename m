Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3244437A
	for <oe-lkp@lists.linux.dev>; Fri,  6 Dec 2024 02:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733452453; cv=fail; b=jsFo2Q8cdo3uRQxUUh8H635V2GCdX1qaKZDDGjbqJfZsNYCCl63vJ0bUCk7rwFQRjOPJpEAR6BBfV6bKEVMQMQKsB4RZ+isF/4xn1T4MIM9TPVcp0luMmkPUp0JZWCFNDoD0OWZ1CX03o64cWd5iAyErNgOjstrX75Cauzv+/MQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733452453; c=relaxed/simple;
	bh=txrm3w5ZeZzwDcfU7RazANZqZC+ADw5NO6jYJsWhqHk=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EyT1n3kMY/GG2FKNN1xrG9fu1h1VDjNbvfgUfcbKcGf5CleH+nlZAJboFpmzcjebno5XoT1olm0u0UOqP7Yj1DxrQ3MJKpTKZHxbZYclbX/mSps6eCcywsydTTKOnjTfu2JcOpMej6+Ev/E1IiWkDBG2Zh6cYR3Ey7yaQ40lqdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J5Wz0yqI; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J5Wz0yqI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733452452; x=1764988452;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=txrm3w5ZeZzwDcfU7RazANZqZC+ADw5NO6jYJsWhqHk=;
  b=J5Wz0yqIrMt8thiOzpJLfMr8Y4aldROiu7Kp7nOTspfPVWDyW80pKTKp
   5aIEqGnOxdHsssIE7Yrboa0r1TjCbncr8R32lLxCVkYt/5edIlzxbZ+Yo
   bhWLU+7arDkfcv5Kclr56DpD7qq5y0Mfh4v8ZTVRl/C+SMIKo9qkLZwRN
   0N3QoMsRaO57OllIZqgec26atnv2Itiz2hcDNR+fJQr7oSYZIDtdmTq2u
   BCspeW+THf4/599+cH1GVj/658vitgOBYVf80fMsqiF4NzvZoiqvX6I+m
   zEzpyNGQHQ9vgT1gJgZoyJ9LASgEgot3RpS5aqt5yofFreMUnadr+7tqX
   w==;
X-CSE-ConnectionGUID: ihViJ/tgS0GI92rVhCtefw==
X-CSE-MsgGUID: lUlFOOKkSFS9Oe8+kM7XQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="59196054"
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="59196054"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 18:34:11 -0800
X-CSE-ConnectionGUID: 8lXGuS6eSaaxWK3ZQyY8Zw==
X-CSE-MsgGUID: cWHx0uqdTViZnKJ5j5Rp/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="94475003"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Dec 2024 18:34:11 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Dec 2024 18:34:10 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Dec 2024 18:34:10 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Dec 2024 18:34:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NObRBL3XtRAbUymemfJ+MIZwKz/dUVgyu3hI/z6ZXtv30/0QyL0qFBKmEhwYnrrDHOJh5IGBe/ijD7WJUTvoZv20NlVueBFTsGW39rGD1pxLsertxmHU1j/JW9+YwahS9CxuHaWf+fF2SJ+YdtMQMGq2EWy4rfwEPrtnvtK5SxQLaB1buQv1CgDQ2yDxE2j/gZYvsIG2vnMhSU41e5j8pxUGw17uVGpLXfwm4D4x79++OUYqH2T9EW2ByR6cQQy2IS2f84NbourD4UW4GVS4gm2ilQywPSKrJTBTBfyMSFoUCeDzkLyzEz9eETXvtjvxK3FtlEiHDSoOrXDRkRrXsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vKJfjJNf6GDBPdyxqORFD2/12Fco5uMd3y02yqfR2DE=;
 b=qObybbbm3IrRBnrnHFoYLzK6F2HnU2Mxn5y1+QBTSKm2eNCWblxxHvNrVFmnYOQ1QR5i3dknZD5vjPX9grAssFduqb7w7B+A5Jsrc2gZEZzfOEWQjPzJeY9YAYRkun4zWTqCWoj+edncns9RJLLxSvS6BXBwcNdvInUNW7z4heUG+hci27GuKaypyc2bP+/by+VAWrlc+zbi8LMF0OiCtmv+csMkfWszOJAv7P3m4P/33A1L3KI6zbFBU1O+4xY7CtXMq8or/dxEj1myg1Opt0BWLB6xabqo/CNdYvC4D+EIr1YwTtV7l5Q6gR0l4GzyFp9+WiPUXZBVCVaFO+9cgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by BL1PR11MB5237.namprd11.prod.outlook.com (2603:10b6:208:310::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Fri, 6 Dec
 2024 02:34:07 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%6]) with mapi id 15.20.8230.010; Fri, 6 Dec 2024
 02:34:07 +0000
Date: Fri, 6 Dec 2024 10:33:58 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
CC: Jeff Layton <jlayton@kernel.org>, Mike Snitzer <snitzer@redhat.com>,
	"oe-lkp@lists.linux.dev" <oe-lkp@lists.linux.dev>, "lkp@intel.com"
	<lkp@intel.com>, <oliver.sang@intel.com>
Subject: Re: [snitzer:cel-nfsd-next-6.12-rc5] [nfsd] b4be3ccf1c:
 fsmark.app_overhead 92.0% regression
Message-ID: <Z1Jilj43Pw/rblhR@xsang-OptiPlex-9020>
References: <202411071017.ddd9e9e2-oliver.sang@intel.com>
 <ZzYLKgijp6OeGF2A@tissot.1015granger.net>
 <ZzrydFbfitmuKeFd@xsang-OptiPlex-9020>
 <3E2B7563-E2B0-4C1D-A3D2-C0A2F1B27225@oracle.com>
 <Z06Qs380yk7NCNjJ@xsang-OptiPlex-9020>
 <347A9ACC-8701-4518-81B1-D099B637265D@oracle.com>
 <Z1FV5AVaNePiqTNm@xsang-OptiPlex-9020>
 <5fa3f3cf-2f95-4f0d-9625-8a171a10459f@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5fa3f3cf-2f95-4f0d-9625-8a171a10459f@oracle.com>
X-ClientProxiedBy: SI2PR01CA0036.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::22) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|BL1PR11MB5237:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e3d81a7-2086-4edf-1905-08dd159e755e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GC0tSFCKaFxRnpJ2YeWNkzyT7JmfTuu0mVF7G5qYpiSvZ0kV3OFyjzAU+0ZA?=
 =?us-ascii?Q?rgPggOO0hAdM++RUr7tJP+pvBXlvmEjshxDTRBa44v59SgQFkH5VDNAS0RHv?=
 =?us-ascii?Q?Ve0crrjj/u8zNN7dsmBwpvzN2wdSGBfxxONYDEiQyJk9KtRVhj+wSk59uXGm?=
 =?us-ascii?Q?DcT/9f+Pumh3kI1LC3TUwBuPOifFVzQqQ8BO+iOkNwCSv/roNYWpa8gErzv6?=
 =?us-ascii?Q?3w6nhwKanztZGFYLbsil0BvhF4PDMD+IKniHwrZvzdKPiWdzJ+EvuFLeS/cj?=
 =?us-ascii?Q?xZFnp2ruzJE4Q8HH54LgyAkfwXNoBtIVLV9CyNA6yR9oxyXkQsJuqIi6ZMHv?=
 =?us-ascii?Q?b1chdC+HQDrW35R9JCFWRKbOLS3jVAm3O+nRgzbEfAIny7PQtySRjq0KBZ1p?=
 =?us-ascii?Q?YG9CWeZ51n/oC3NFGtGApgqLpx0LoiK5ZZe52UpvCKWtFNHMzYnfgK6hC5YH?=
 =?us-ascii?Q?6/aYMY6iP0seFfpJf11EfBb24xqG20CkCqQLx4GijtLKbY5QkItKsy+AkJ4y?=
 =?us-ascii?Q?MhfarP6Ok9iUdX13KF1SFa/g4a6+yc0/WVPNTpn62+iEtyFUfUcyp2C7/LvV?=
 =?us-ascii?Q?LZbWxWjFRLt0cVIes6U395SUUwWfePGO5DSxrsyuVIz8uENAtz1kRD745BPf?=
 =?us-ascii?Q?XzlwixeDwYY4h9dub6KiBMEMaZTpGDk2kAt0NX+cRnpB7DHaawV7qj6PUBcw?=
 =?us-ascii?Q?VYaPjTPv62k671sqs8imVpzc+MeQYaeWcpVIaTprSnSBHVV+jet5lNYUz50t?=
 =?us-ascii?Q?RubggdgUZqpai32x42RHh8d4Z1UQImIM0e0eA+4biUqdDDtmzXHyacY8+tvx?=
 =?us-ascii?Q?2Gr/fYF7IMQegFnIcxsmbN6lKzpPGVFdQqLl8I5lw3kaAqtTmW/W7P8pnB30?=
 =?us-ascii?Q?YK8z4ZM5BStjp85inLcYHUi52IE/36K+jF1W/Nu40zuvKDudLu9XI/5FkzG3?=
 =?us-ascii?Q?nOkqZqCAgAmrrddVz89b6v7WMG5MmVciRgGS83hQc2UAV8Ix82hn7ZRtGTGV?=
 =?us-ascii?Q?CMxEjPY2lVYDayYDMyg0xpgOUqUsXZ464FtvyuMLsTPO7i2F0gJi04ZpGlww?=
 =?us-ascii?Q?fiBlisZYdUeogZIFf6aZ33gcahZFTO+RZ+DnfHwpFPTh9mXAIWDMW9kBY8H/?=
 =?us-ascii?Q?xri4R48NnWJnUPE8yu71JN2i35XUv66dm0U1kwfZ0RPBJBCODCW1UqV/itQv?=
 =?us-ascii?Q?sHf+v3u7HiT4FQN64D9QOoi2KIRT/lIxDMx7DSm8PN21tCOiEGgEi3f0STMG?=
 =?us-ascii?Q?EMrzuoYR6oyRblcS4GGrAq51ZqaIpp92rgIgKSOXF5HVAcbCDXcatz+23uTo?=
 =?us-ascii?Q?DYQbCk5fRPwZSP2BwG413g6TByHUJOjHbi+McvVCRHLwlg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZswOi4NchV6bN8GOfmdE1nsNaWsMXTmE8iv/gpRDkVRQpi0ycbds97QZjt5q?=
 =?us-ascii?Q?EfqwyNe/g/Up3/G/1NtbU+6fzfcQItB5vTURLbQvM6dDifjgx1n1sSoppIiA?=
 =?us-ascii?Q?UApnJcfEFow9jfHYkleS+BPomnRHAS5wghHkgFXJhau6trrcRqQDHSedffEf?=
 =?us-ascii?Q?qM8ZntWKOJzA7AMqt3YIrq7L84lu1VBvIFc5xqlkFuVFfz0xyPQu0gHMrBO4?=
 =?us-ascii?Q?M+oCkTe9airqq6y5FVYRktx8a+Wg9dSHwxkBu6KieF2w28b6og1G3bbaQrj9?=
 =?us-ascii?Q?Gbaukuq2Pjytsok0C+i3RCn5Qp7bKXI4gmoPulnOq3zqO67vETs0QwgZPaMG?=
 =?us-ascii?Q?2t5pUHF3ObWMHDEAlQxM/lPQVWtMnUltynQ+3Cx7NW6t6Xsaihjg6QkCIjBe?=
 =?us-ascii?Q?n5jw3GQXq9/aQCc+4L0zz1V6YhjugVKZ1jXPBV9pzYK2G+O8BAUoFPqy4ez4?=
 =?us-ascii?Q?PwOBMzeMmVhMDKgV0LD7Eev6/9bm88g8N1q5ITFf2fwP7259+IeBf8tF3fdJ?=
 =?us-ascii?Q?CB0529ibmeIzP2w/p/jt675RgD+fPR4f4bQfClRPjDkqrTPV2mMHS9Viz9uu?=
 =?us-ascii?Q?qbnQzwQeqZV1un+KCNedpp/978BNPdfjCNYIDv9kg+kGvfpkOSg470Rnk0Bn?=
 =?us-ascii?Q?pa1sJ4vOTJIL8S4We+XsyJiEPTZvXQaYndfD3E6ZGpi7E9MJgGbPKPPzj7Ym?=
 =?us-ascii?Q?mMkxBmfCSxCOH56qhCoMV5oPNkMbCPbXqQ6MLZ0cNn4xwexFRekLicaNf/Tp?=
 =?us-ascii?Q?NmCG+3TrdnYXbno+tpb5/gSpefPIlDR4OwolSvWg3QGh3ylYQPzVSTdt35jO?=
 =?us-ascii?Q?9Z9LK2osklEwv9qoCfi4B/CUaSdBKYRMrpfoifbzC64xyWn0ZaEjCDy1xMUF?=
 =?us-ascii?Q?qVIt2u+XckO/vVoSxFrPflUmuKmGVWjC3mDk9gTTgugjvFQPJQ4x/Tvp9qjW?=
 =?us-ascii?Q?9W6bp9P8MK9N/o+UA+LxU+39D/Bhxaj+kS0dMjuHk7HwP0gkfbDdNXrAcg+2?=
 =?us-ascii?Q?XNs7yeJ/xqcnfYyCYfuaEvDKsLI+f+DD9ifA9Tdlm/husHXE2chN+w0UUDTT?=
 =?us-ascii?Q?WhklF+yhD7tUsHNftE1RSv5Ch5NE3XtoJjQZBC8wWWW0YsTCiiyUnJ9csNnE?=
 =?us-ascii?Q?Umyrqpz2AwYqB7wyuOInJ/qBl7iNHQnk9p9eDEO65toOPeRinw/oqb9u1luj?=
 =?us-ascii?Q?GrPNO4IvXvo+ByX+QhdZDj53Z6/ya9EPDncXesKKLxWYOqTIH7p3NhQRZSN5?=
 =?us-ascii?Q?VsT2Izal1q54IC24uYDbLq7Y7kye+W5rQHHV2+OgoOREN+dKVCVDIgGuiRea?=
 =?us-ascii?Q?pRly1GtZ2bH7ULXC1ZXmyZtZiloxqqqgwUTUl+B/tB8nRycZkIdTqIlTdR19?=
 =?us-ascii?Q?tTcbgScAZACbJ+O5SsPuyUGKz6dyzmAlEbDdq7ZSu8CMt4oqv1J58fFimZYX?=
 =?us-ascii?Q?2PPZfDMClW9Xg69XsHue4VQ4dQpvMWTZK1WxkGLkjThBXYoFJQTaI845Mv3B?=
 =?us-ascii?Q?G7S478PHur5NJACMNluYBpnLPOnOHJrveNCm/81gi0AAneZ49Q+uk7sGHiU2?=
 =?us-ascii?Q?TDONvqa4PKbiA1t0d/BGh0YHl7KxOj3q4jv6Sdy9NvVUWXxvkc010TZAFwYV?=
 =?us-ascii?Q?aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e3d81a7-2086-4edf-1905-08dd159e755e
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 02:34:07.5623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7fva2wSycpQdBPczcfuQ2vCPtzRuKX6CGh7SgKCEzgCAGoIOWOD81240miXFunsyOQri2mf8TKpLXxT33YqoCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5237
X-OriginatorOrg: intel.com

hi, Chuck Lever,

On Thu, Dec 05, 2024 at 10:37:10AM -0500, Chuck Lever wrote:

[...]

> 
> Earlier this week I thought I had the full set of patches to
> test and could just apply them on v6.13-rc1, but it turns out
> that I don't have them all yet. There are one or two that I
> broke while trying to prepare for v6.12, and I've misplaced
> Jeff's originals.
> 
> I will let you know when that branch is ready for a retest.
> Sorry for the noise!

Not at all! always our great pleasure that we can supply any help.

got it. just wait your notification. thanks!

> 
> 
> -- 
> Chuck Lever
