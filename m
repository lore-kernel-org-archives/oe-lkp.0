Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B89A16C840
	for <oe-lkp@lists.linux.dev>; Tue, 25 Jun 2024 14:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719327347; cv=fail; b=OgYVPQqY8A3yczu5WtTPOt9JhazbH1ZiBxs4F/NIhO7r6U7CXoecvgn9Mv3H9WCbMEhTW/0/W66pniLwtEbW0VrH6Uw00zIWKcMgo/wH0XfNQQ1o0oRTtxbStGIpC7ssDWlCyGRZa4vZAE5IIt1kkuQm4OYwux2bRuzWvXTBS70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719327347; c=relaxed/simple;
	bh=/j3efPQZYX7AYnvXTTZ9kEMOp6svUko2wpHGT2nCixo=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=SUMKePcX9+XSH6dyYyf9dJMW+RpP2hhEhHmbQCjhjWFzEiKmurBA5pVG+LGe8A8xlY67taHio9+VCtXyXStqwhSGI8GKpBQhGlZbcYaD5wLTpeRpje55utYHuzeudWmFj4rtLgCFrkL8Ah2o9hd4dx23LrHBOnqqcjqvJmZSjZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OkmjejD8; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OkmjejD8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719327344; x=1750863344;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=/j3efPQZYX7AYnvXTTZ9kEMOp6svUko2wpHGT2nCixo=;
  b=OkmjejD8Xv5okxHt8LWfKjUl9Od1m2n2UEMbib2iMizYKDMmXIbVYAn/
   iZ855VjhwWZ6egolc8AdoQhlrQV0DvfGGvpwQMGjdK6BHOF4Me/57vdLB
   4kBZN2aG/Ajk/kuQyyEm4dXNXcgocIXs2zOx2LnHlD6kUSEqF0vpfKvWS
   bJ/i5wPerMeKvnEYih3diCXUZz/awRIftD9dWWbxshR++kuKbU4oQCoiG
   2N0G47gRWFjFKoTvTl+JZynMb/KdrHTh2fgoXYmNv8jQPGAZCxtLAuH5G
   SABWKjm3rSvB5pNmJ7tqSe/rxGceWMLAxQ+Cxpvki7GIj8Odidxinif/I
   w==;
X-CSE-ConnectionGUID: 68TZFcViSRKGhReUNptPXQ==
X-CSE-MsgGUID: fq0X2RgJRhGmvnTteGfGRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16179459"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; 
   d="scan'208";a="16179459"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 07:55:43 -0700
X-CSE-ConnectionGUID: fNgAO9M0S7S5bazRgcaZJw==
X-CSE-MsgGUID: w44UFdtXQIuFQjWC/CzYKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; 
   d="scan'208";a="44118185"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 25 Jun 2024 07:55:44 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 07:55:42 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 07:55:42 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 25 Jun 2024 07:55:42 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 25 Jun 2024 07:55:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M4hH53pT0bcfSncIELnDLC1Xijzxw4REoq6tDmlC7R1j8eGqLfSNPURMz8CiHEIGV6R7cVJnf/A3LKbzGfLPhKrmSDFTGUvDu0S7iRjTwj0gVwrSHtBkAF+L3mGFBme5Wx+5kM2u9YImgvsYo0D7IR75cw3u4Fl+QJQBDPHAOS8AnXsADASlusiadsB+dOHz79OBz9VEnve4iRI1bDb625zuK/bgAmPoX/rtcGEciHLeomPlJfV8L5alFEMUAl9nEskK8DBrsxqbSVIwV658uWUyuWOvZYVYqrRQrSIuwVF7QRC/EXu5jyiMoYaim5abtrO0AjWiYAcAQ/kLRrJE7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yVbStQ6PoL9ca1ydqrOv1QEGNGb5yiYyFrV7s9YTcvo=;
 b=RSuaO20+tcJREpMZN7cG5C/NNLs2fiWAhZSzYYHTtII7DEC3bPPLzh2i53UmGCs3ENW+Oc9F9W4Geg9y+TSGkwvZNEbHhHuSKtxLf92CvL3ZZRPzRgzbWXeqorNHvfdWhrufaUz4YYhg4k6NEDwLGkZFTs3c4UHXZSG6MXfOZKtFMIf+V1jO4C5oPqRbms+MYzD4qMcz7o05u3biLHN0nIgVcXm5lim9jOAgHEOX7LZ6hfK4t6ahDWltmtrZhwjFl2ezZqYPaqqzhbSUmn23REs2HFijFlaa0J4kvp+l/RIeYUk1JKyYBFLh3UT9thXg4lKFhRTGD46gn3pAkOrCCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH7PR11MB8599.namprd11.prod.outlook.com (2603:10b6:510:2ff::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Tue, 25 Jun
 2024 14:55:37 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%2]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 14:55:37 +0000
Date: Tue, 25 Jun 2024 22:55:24 +0800
From: kernel test robot <oliver.sang@intel.com>
To: <jasperwang@tencent.com>, <kaixuxia@tencent.com>,
	<frankjpliu@tencent.com>, <kasong@tencent.com>, <sagazchen@tencent.com>,
	<kernelxing@tencent.com>, <aurelianliu@tencent.com>, <jason.zeng@intel.com>,
	<wu.zheng@intel.com>, <yingbao.jia@intel.com>, <pei.p.jia@intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [opencloudos:next] [mm]  0e90412da1:  vm-scalability.throughput
 52.9% improvement
Message-ID: <202406252242.63589fe6-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR06CA0018.apcprd06.prod.outlook.com
 (2603:1096:4:186::8) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH7PR11MB8599:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b2d31ff-cf18-493f-f089-08dc9526df3b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021|921017;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?n2cERTCknwzTJogtmBpAzjkXCh1kXN3mW8qWgG4jpwD/DYDiUOzuicvmpa?=
 =?iso-8859-1?Q?qkdkWQBkhhtsYyCXyUHF3GWwgr1ioI+LfU0SqkW11dMIRaf87xSdbZf0K/?=
 =?iso-8859-1?Q?ZfDk++n6RDJUO/o3s0RICi2j5+bXh8yQOHRqdusSblt7CvyuTU3C01fWk/?=
 =?iso-8859-1?Q?HOfVIgkFjHzJpDGfiH0nG3oBpQ9WceFXYxq+klKRBME845KMrGF/6/W8OA?=
 =?iso-8859-1?Q?x7uUjEAw3ZcxlW5WQvlhQEEoaEQGQ/IgmLv+dfY6Z+Q8zLyjioxHGulo5c?=
 =?iso-8859-1?Q?BRDVf2EyzCzO2fX//MLU6FQ9+sptyh1WSkbvQZ3u1M4Vuu8r9QbLRS7vbs?=
 =?iso-8859-1?Q?VlxmoFjYHjfpvcLt5SM1xpsRRJOGkqiBAES4+lhEbvdookIv6Cqb/1Msod?=
 =?iso-8859-1?Q?eacaoArKRkhzZWb97J+QtMPCvHY4WnPjB1Sz3oBpKK1LfEoAzW4l6kC4Vb?=
 =?iso-8859-1?Q?nHGTqE9Fh6zKsG5JfBUEDOME7aV5SriS9C5p7tTlBpb2BzoUl2q14mdIPG?=
 =?iso-8859-1?Q?rNoXyO9KYooDOIILDPDT5ELqIW7Axfo8jMuwTCtumbr5O5RZt0dBgEWUfK?=
 =?iso-8859-1?Q?gFHexLgT6hNVLP1swxoOI+28iQISYjxPFViH9bKm1MGddssKOIJGunL1aZ?=
 =?iso-8859-1?Q?8zRWRZhRvbnOOeO32Rv4nmauqoG4m7sD7T3sdMBmTyg4Xbre67JFkAlMep?=
 =?iso-8859-1?Q?VipMGh5BGXmdrvPc1kE+AF98fXfcwYezIeUC1mVyPm6TPKvkCTvP8aNY7c?=
 =?iso-8859-1?Q?i15OkuO1WPLqL6zYNBbNfqSOlNkbQXY1E7XcmToh9tsGPPQTAiZX293SHG?=
 =?iso-8859-1?Q?0bVH0TTOaHeTvhPHVs/Awh9AShq/A/EwBKPplcbK8B49fbyzaE1kw1ADQ+?=
 =?iso-8859-1?Q?pupMp7l16TF9AJVgxYNfxNUXWQygvsEHnpeztQeslKzx3ZboOeHTX/5Pn0?=
 =?iso-8859-1?Q?tv4R6tjrvMbHWmmrxsmcrWgsr5DKT/LJ+VAOg+AGUJscTV1RpEMyzIXNqP?=
 =?iso-8859-1?Q?76ry79Pu321CdVc+ZiSsESuFCG7B+T+IH/WfGBnztdz3T/lfFiHpQLYoih?=
 =?iso-8859-1?Q?3Qaz/V2SvpvtsHIJ4eUo97/ftD6YChydB7/89kmKImMbCilmn9vJ5NbTO3?=
 =?iso-8859-1?Q?wnbXhv0g4AHlcb1aRB3/JGW9Vayw3Xcx3+YkaSyBS36p6aFI1V8bMo92VM?=
 =?iso-8859-1?Q?hNBbZ+JNM0rsnH7512kAP7xuwk7CQhKv1u906gi5m4Wdf4FyjWIBnkxJPr?=
 =?iso-8859-1?Q?5bAfJfN+jYcPOKj+T9XF9Iup4DjV0ThhFUcket8YvcKZzuONZQnD+wUbeH?=
 =?iso-8859-1?Q?6pbdqX5lAdis70Qw1QAiEi1LJ1Y3xWNHzEVhSQj6piOd8jx1MZjuEQ7pSO?=
 =?iso-8859-1?Q?KWxG4/g99x?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(1800799021)(921017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Hg5em8RxX9v6TAH8rHRPX61JUVeJEjd11BFM4O8xepmhO20m1DlFboGsH1?=
 =?iso-8859-1?Q?jjPLALA6WnVS5e4cdKEfvYBXh5HwXwON4l9yF0MQtyP+8WzPRr5Dx4Ym1T?=
 =?iso-8859-1?Q?gWF3tt+vaLlj+CPaDr20o5DkbUS4GMvo1DnVY1O7SNjjkGJgZRKL2RtRZo?=
 =?iso-8859-1?Q?RbyQ/uk4q6CK8wmpGf45L3VTXVDaDsESDvbdu8aiVYo5f9lYD0cT/gAJiw?=
 =?iso-8859-1?Q?g2DzL4vHTyUC/SKNFkytkQ0UDZKnjAsEo7Bx6MzXBJ2vi+glsZoAHPandQ?=
 =?iso-8859-1?Q?NY2RCXY7SNq6gKFioRq4A7O6j6vflgubH1ClSLEhjZuyd5xIdA5nI61kls?=
 =?iso-8859-1?Q?dLOjeE8yWBemWn/Pc0GmvfFH8ehSkKZr8tZQOAESQ9bKyfJi/qppgg8Z92?=
 =?iso-8859-1?Q?V+rdBY+M67cUZT5V6w7RKMv2Znss+NlYMvGkvm3+Afhtx+Z08kxa979BVX?=
 =?iso-8859-1?Q?ZpTK5mErb6WIspL/ou6mZNegiv9CCXOMjgtkerInv8ftRApWk9G6PcaByo?=
 =?iso-8859-1?Q?o2Y45ijaWsdH2IQGCdLcboNKKuphVmW/uw8cuieUlGJQLBLacmsFvxPH5y?=
 =?iso-8859-1?Q?MkgN74q8Lyzmo6yOaFlsnaTlv8CxbIyIJlpnPk/O8Ud6oTehVCu8NEFBq/?=
 =?iso-8859-1?Q?7nvc98u5aEemThsRNwzIaTNswcBhmorXCQNsQ9PMhyBqB4axqBjf6t7NUp?=
 =?iso-8859-1?Q?t1cy4RQNvCcQpmaVXBo+5IMTH79dzeSMc/RocSGz0KQQjFOUpE/e2wYi2O?=
 =?iso-8859-1?Q?9qspsUDLBS05xttshIfrHJ0AD9u3ZgG0VsSL8Tufd1yFAqfJZSezZ3UdH3?=
 =?iso-8859-1?Q?2VC2T8Tp1LRMWau7KV2qNBy3FMUpwROO3lgB6dIMlyYpqI2LvQ1eJsugWp?=
 =?iso-8859-1?Q?WFTaaGnBgU8hm5cQl5IGast1gA3Vd/glANuMv6hOCpXNl1ssE9vnOwo+qs?=
 =?iso-8859-1?Q?fXAQ7ZPGF1n2WBFrVr/RGQM6/0JX1iZcfcCWo2Wyt/ACW0YIahMtTLivSA?=
 =?iso-8859-1?Q?2fl21lHctlDSMVlYWL2W4CIA8ORQ/7ofzgAWzJqN0lHKgRatXQWxooJVAV?=
 =?iso-8859-1?Q?hvXv6nBKzL3AtHoB5Oi/GbeA65gveecinKXnMEKdaqxDtHG8X0SIkSrD1M?=
 =?iso-8859-1?Q?HMmd0MlsJKMtXZyuq1xDFXRuxEdGU7H7PK3+3HE3y3Oao1wcovvhL7QJtJ?=
 =?iso-8859-1?Q?rSzFiXap/EiTG/vf+93drrBy4cEMNEumi1kVZcgv/fft7UAtvagKBmKLl/?=
 =?iso-8859-1?Q?cjF+hEHeL0DKd73+ms2cwXwRkxbbHSLztM6HR+EC1SskUFH3GVqZhhqABw?=
 =?iso-8859-1?Q?9LNFa9oFfMeGXMWgeEsh4HSeD+QfXbhTFW9UjtGL+9F6b+lzDLw2dJw7sI?=
 =?iso-8859-1?Q?lbe2L0momegLptENz5vhlM/cEfSP+6ZO0Fy9ev++tB5OV9imp4eJkzZPwE?=
 =?iso-8859-1?Q?x5pkkLsRSqT1gge72rluR8wpNJ5J9PFxH6tUkr1ii2IFI7pUZezADE0U5Y?=
 =?iso-8859-1?Q?WOQ0emMF1RgReMnF+U5ub3Cjzjmu/vt7pcCS0BzPtaNiLXFKkOgb2eTzak?=
 =?iso-8859-1?Q?PdLuDBEmXiR3UVBIZT/lu0BE6tCczv8HFoeIp+77VrYRc0ytZReLXyDO94?=
 =?iso-8859-1?Q?vHq1GiDaklv7I37pjc4ulh04l0Rbz/qAK4uW6sCFtTePY1k8JeAkTeEA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b2d31ff-cf18-493f-f089-08dc9526df3b
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 14:55:37.5946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7n9r9UHo4U9Ycr/hnq19Xme9gu9teOV4WNJiphvV962v1tD2ZCVSsRZH0oLOWS1mSNOZ1shaVUvw50hP011X4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8599
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 52.9% improvement of vm-scalability.throughput on:


commit: 0e90412da15739ece48a37605c6bd17e62d7cc52 ("mm: increase dirty-ratio from 20 to 40")
https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next

testcase: vm-scalability
test machine: 256 threads 4 sockets INTEL(R) XEON(R) PLATINUM 8592+ (Emerald Rapids) with 256G memory
parameters:

	runtime: 300s
	size: 256G
	test: msync
	cpufreq_governor: performance






Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240625/202406252242.63589fe6-oliver.sang@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/rootfs/runtime/size/tbox_group/test/testcase:
  gcc-13/performance/x86_64-oc_stream_base_config/debian-12-x86_64-20240206.cgz/300s/256G/lkp-emr-2sp1/msync/vm-scalability

commit: 
  8a0e2d9e74 ("tkernel: netfilter: conntrack: add netagent extention slot")
  0e90412da1 ("mm: increase dirty-ratio from 20 to 40")

8a0e2d9e747f0369 0e90412da15739ece48a37605c6 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      4217 ±  3%     +37.6%       5805 ± 24%  perf-c2c.DRAM.remote
     45.98           -12.3%      40.33        vmstat.cpu.wa
   3814803            +2.8%    3920107        vmstat.io.bo
    180.39           -22.8%     139.32        vmstat.procs.b
     19544            -1.9%      19167        vmstat.system.cs
     46.28            -5.7       40.56        mpstat.cpu.all.iowait%
      0.03            +0.0        0.04 ± 10%  mpstat.cpu.all.irq%
      1.43            +0.5        1.95 ±  2%  mpstat.cpu.all.sys%
      0.28            +0.3        0.59 ±  4%  mpstat.cpu.all.usr%
    189.38 ± 32%     -77.9%      41.88 ± 91%  mpstat.max_utilization.seconds
     28.19 ±  3%     +95.0%      54.98 ± 12%  mpstat.max_utilization_pct
  83648234           -13.8%   72121342 ±  2%  meminfo.Active(file)
  19920607           +69.3%   33716385        meminfo.Dirty
  50651133 ±  3%     +20.9%   61238518 ±  2%  meminfo.Inactive
  32041306 ±  4%     +34.5%   43088304 ±  3%  meminfo.Inactive(file)
  88869298           -25.9%   65836555        meminfo.Mapped
    305131           -18.6%     248438        meminfo.PageTables
   1409002          +321.4%    5936966 ±  2%  meminfo.Writeback
     43870 ± 21%    +106.2%      90470 ± 11%  sched_debug.cfs_rq:/.avg_vruntime.avg
      6991 ± 27%    +273.7%      26126 ± 17%  sched_debug.cfs_rq:/.avg_vruntime.min
     43870 ± 21%    +106.2%      90470 ± 11%  sched_debug.cfs_rq:/.min_vruntime.avg
      6991 ± 27%    +273.7%      26126 ± 17%  sched_debug.cfs_rq:/.min_vruntime.min
     13.78 ± 23%     -21.0%      10.88 ±  5%  sched_debug.cfs_rq:/.runnable_avg.avg
    347.70 ± 24%     -30.0%     243.43 ±  6%  sched_debug.cfs_rq:/.runnable_avg.max
     39.18 ± 21%     -25.8%      29.06 ±  4%  sched_debug.cfs_rq:/.runnable_avg.stddev
    287.78 ± 25%     -22.1%     224.24 ±  2%  sched_debug.cfs_rq:/.util_avg.max
     36.55 ± 21%     -23.4%      28.00 ±  3%  sched_debug.cfs_rq:/.util_avg.stddev
      2.25 ± 54%     -48.2%       1.17 ± 11%  sched_debug.cfs_rq:/.util_est_enqueued.avg
      0.20 ± 27%     -39.8%       0.12 ±  4%  sched_debug.cpu.nr_uninterruptible.avg
     20042           +44.6%      28985        vm-scalability.median
      4.05 ± 20%      +3.2        7.26 ± 15%  vm-scalability.median_stddev%
   7937417           +52.9%   12139437        vm-scalability.throughput
    273.32            -2.8%     265.66        vm-scalability.time.elapsed_time
    273.32            -2.8%     265.66        vm-scalability.time.elapsed_time.max
     25515 ± 10%     +63.4%      41688 ±  4%  vm-scalability.time.involuntary_context_switches
    515805 ±  2%     +25.0%     644779 ±  3%  vm-scalability.time.major_page_faults
    461.12           +31.7%     607.12 ±  2%  vm-scalability.time.percent_of_cpu_this_job_got
    936.72 ±  2%     +19.7%       1121 ±  4%  vm-scalability.time.system_time
    325.13           +51.5%     492.59 ±  3%  vm-scalability.time.user_time
   1414489            +2.7%    1452487        vm-scalability.time.voluntary_context_switches
   4643077 ± 17%     +68.0%    7798220 ±  6%  numa-meminfo.node0.Dirty
  13267374 ±  6%     +16.5%   15451857 ±  3%  numa-meminfo.node0.Inactive
   8301147 ± 14%     +31.5%   10913417 ±  4%  numa-meminfo.node0.Inactive(file)
    324795 ± 18%    +325.1%    1380749 ±  6%  numa-meminfo.node0.Writeback
   5084178 ±  8%     +69.9%    8636126 ±  3%  numa-meminfo.node1.Dirty
  12660037 ±  7%     +20.2%   15220035 ±  5%  numa-meminfo.node1.Inactive
   8066663 ±  8%     +30.7%   10541528 ±  7%  numa-meminfo.node1.Inactive(file)
  22829143 ±  8%     -25.9%   16915418 ±  4%  numa-meminfo.node1.Mapped
     77389 ±  5%     -18.5%      63040 ±  4%  numa-meminfo.node1.PageTables
    357830 ±  5%    +331.1%    1542610 ±  8%  numa-meminfo.node1.Writeback
  20901559 ±  8%     -15.5%   17665514 ± 11%  numa-meminfo.node2.Active(file)
   4943851 ±  7%     +66.4%    8227536 ± 11%  numa-meminfo.node2.Dirty
  12442870 ±  2%     +22.4%   15232301 ±  3%  numa-meminfo.node2.Inactive
   7775306 ±  2%     +37.0%   10653032 ±  3%  numa-meminfo.node2.Inactive(file)
  22015775 ±  8%     -27.0%   16077427 ± 12%  numa-meminfo.node2.Mapped
     74992 ±  5%     -19.3%      60540 ±  8%  numa-meminfo.node2.PageTables
    358213 ±  7%    +289.2%    1394331 ± 11%  numa-meminfo.node2.Writeback
   5253639 ± 11%     +73.1%    9094944 ±  7%  numa-meminfo.node3.Dirty
  12283573 ±  6%     +25.2%   15377971 ±  5%  numa-meminfo.node3.Inactive
   7892391 ±  5%     +39.9%   11038526 ±  6%  numa-meminfo.node3.Inactive(file)
  23926091 ± 13%     -25.6%   17796652 ±  8%  numa-meminfo.node3.Mapped
     77193 ±  8%     -18.4%      62985 ±  6%  numa-meminfo.node3.PageTables
    360822 ± 12%    +350.5%    1625631 ±  9%  numa-meminfo.node3.Writeback
      8.30           +39.8%      11.61        perf-stat.i.MPKI
 6.823e+09            +1.9%  6.955e+09        perf-stat.i.branch-instructions
 1.849e+08            +1.8%  1.882e+08        perf-stat.i.cache-misses
     19664            -2.3%      19220        perf-stat.i.context-switches
      0.88           +18.9%       1.05        perf-stat.i.cpi
 2.402e+10           +13.6%  2.729e+10        perf-stat.i.cpu-cycles
    383.99            -2.5%     374.31        perf-stat.i.cpu-migrations
    118.07            -2.5%     115.16        perf-stat.i.cycles-between-cache-misses
 2.576e+10            +2.2%  2.633e+10        perf-stat.i.instructions
      1.25           -11.4%       1.11        perf-stat.i.ipc
      1847 ±  2%     +27.3%       2351 ±  3%  perf-stat.i.major-faults
      7.20            -1.5%       7.09        perf-stat.overall.MPKI
     57.86            +1.3       59.13        perf-stat.overall.cache-miss-rate%
      0.95           +12.3%       1.06        perf-stat.overall.cpi
    131.49           +14.0%     149.85        perf-stat.overall.cycles-between-cache-misses
      1.06           -10.9%       0.94        perf-stat.overall.ipc
      5988            +1.2%       6063        perf-stat.overall.path-length
 6.856e+09            +3.8%  7.115e+09        perf-stat.ps.branch-instructions
 1.865e+08            +2.5%  1.912e+08        perf-stat.ps.cache-misses
     19626            -2.0%      19223        perf-stat.ps.context-switches
 2.453e+10           +16.8%  2.865e+10        perf-stat.ps.cpu-cycles
    384.48            -2.2%     376.12        perf-stat.ps.cpu-migrations
 2.591e+10            +4.0%  2.696e+10        perf-stat.ps.instructions
      1882 ±  2%     +28.5%       2418 ±  3%  perf-stat.ps.major-faults
    968047            +2.7%     994165        perf-stat.ps.minor-faults
    969929            +2.7%     996584        perf-stat.ps.page-faults
   7.1e+12            +1.2%  7.188e+12        perf-stat.total.instructions
   1160114 ± 17%     +68.0%    1948777 ±  6%  numa-vmstat.node0.nr_dirty
   2070535 ± 15%     +31.8%    2728700 ±  4%  numa-vmstat.node0.nr_inactive_file
   7616815 ±  7%    +112.0%   16145142 ±  4%  numa-vmstat.node0.nr_vmscan_immediate_reclaim
     81167 ± 17%    +327.6%     347091 ±  6%  numa-vmstat.node0.nr_writeback
   2070525 ± 15%     +31.8%    2728681 ±  4%  numa-vmstat.node0.nr_zone_inactive_file
   1241331 ± 17%     +85.0%    2295894 ±  5%  numa-vmstat.node0.nr_zone_write_pending
   2170895 ± 12%     +29.8%    2818778 ±  8%  numa-vmstat.node0.workingset_refault_file
   1269277 ±  8%     +70.0%    2158377 ±  3%  numa-vmstat.node1.nr_dirty
   2018061 ±  8%     +30.7%    2637713 ±  7%  numa-vmstat.node1.nr_inactive_file
   5711780 ±  8%     -26.1%    4219726 ±  4%  numa-vmstat.node1.nr_mapped
     19350 ±  5%     -18.6%      15753 ±  4%  numa-vmstat.node1.nr_page_table_pages
   7029954 ± 16%    +125.4%   15845463 ±  3%  numa-vmstat.node1.nr_vmscan_immediate_reclaim
     88433 ±  6%    +337.3%     386747 ±  7%  numa-vmstat.node1.nr_writeback
   2018060 ±  8%     +30.7%    2637707 ±  7%  numa-vmstat.node1.nr_zone_inactive_file
   1357736 ±  7%     +87.5%    2545090 ±  4%  numa-vmstat.node1.nr_zone_write_pending
   5224793 ±  8%     -15.5%    4416816 ± 11%  numa-vmstat.node2.nr_active_file
   1236273 ±  8%     +66.4%    2056992 ± 11%  numa-vmstat.node2.nr_dirty
   1943403 ±  2%     +37.1%    2663513 ±  3%  numa-vmstat.node2.nr_inactive_file
   5507671 ±  8%     -27.1%    4014075 ± 12%  numa-vmstat.node2.nr_mapped
     18754 ±  5%     -19.3%      15131 ±  8%  numa-vmstat.node2.nr_page_table_pages
   7001196 ± 15%    +125.4%   15781849 ±  4%  numa-vmstat.node2.nr_vmscan_immediate_reclaim
     89065 ±  7%    +292.4%     349475 ± 11%  numa-vmstat.node2.nr_writeback
   5224764 ±  8%     -15.5%    4416769 ± 11%  numa-vmstat.node2.nr_zone_active_file
   1943404 ±  2%     +37.1%    2663513 ±  3%  numa-vmstat.node2.nr_zone_inactive_file
   1325351 ±  7%     +81.6%    2406434 ± 11%  numa-vmstat.node2.nr_zone_write_pending
   1778400 ±  9%     +35.2%    2403558 ± 17%  numa-vmstat.node2.workingset_refault_file
   1314189 ± 11%     +73.0%    2273965 ±  7%  numa-vmstat.node3.nr_dirty
   1974445 ±  5%     +39.9%    2761884 ±  6%  numa-vmstat.node3.nr_inactive_file
   5980210 ± 14%     -25.8%    4439943 ±  8%  numa-vmstat.node3.nr_mapped
     19291 ±  8%     -18.4%      15742 ±  6%  numa-vmstat.node3.nr_page_table_pages
   6352576 ± 19%    +141.9%   15367344 ±  3%  numa-vmstat.node3.nr_vmscan_immediate_reclaim
     92045 ± 12%    +340.5%     405491 ±  9%  numa-vmstat.node3.nr_writeback
   1974449 ±  5%     +39.9%    2761871 ±  6%  numa-vmstat.node3.nr_zone_inactive_file
   1406274 ± 11%     +90.5%    2679455 ±  7%  numa-vmstat.node3.nr_zone_write_pending
   1788987 ± 14%     +35.8%    2428714 ± 12%  numa-vmstat.node3.workingset_refault_file
      1491 ± 16%    +128.3%       3405 ± 14%  proc-vmstat.allocstall_normal
  20923605           -13.7%   18057056 ±  2%  proc-vmstat.nr_active_file
   4981268           +69.5%    8440876        proc-vmstat.nr_dirty
   6695332           +99.4%   13352287        proc-vmstat.nr_dirty_threshold
   4655819            -2.5%    4538343        proc-vmstat.nr_inactive_anon
   8010185 ±  4%     +34.6%   10783547 ±  3%  proc-vmstat.nr_inactive_file
     48580            -2.2%      47490        proc-vmstat.nr_kernel_stack
  22219077           -25.9%   16473837        proc-vmstat.nr_mapped
     76289           -18.5%      62157        proc-vmstat.nr_page_table_pages
  28000541 ±  9%    +125.5%   63139799 ±  2%  proc-vmstat.nr_vmscan_immediate_reclaim
    348929          +326.2%    1487283 ±  2%  proc-vmstat.nr_writeback
  20923652           -13.7%   18057145 ±  2%  proc-vmstat.nr_zone_active_file
   4655840            -2.5%    4538361        proc-vmstat.nr_zone_inactive_anon
   8010183 ±  4%     +34.6%   10783516 ±  3%  proc-vmstat.nr_zone_inactive_file
   5330353           +86.3%    9928233        proc-vmstat.nr_zone_write_pending
  15578072 ± 14%     -50.8%    7666472 ± 11%  proc-vmstat.numa_foreign
  31830898 ±  7%     +26.8%   40369488 ±  2%  proc-vmstat.numa_hit
  31364926 ±  7%     +27.0%   39846138 ±  2%  proc-vmstat.numa_local
  15686686 ± 15%     -50.8%    7720621 ± 12%  proc-vmstat.numa_miss
  15952680 ± 14%     -49.5%    8050298 ± 11%  proc-vmstat.numa_other
     44516 ±  4%    +820.7%     409879 ± 66%  proc-vmstat.numa_pte_updates
 3.868e+08           +11.0%  4.293e+08        proc-vmstat.pgactivate
 3.177e+08            +1.3%   3.22e+08        proc-vmstat.pgalloc_normal
 1.256e+08 ±  2%     +36.7%  1.716e+08 ±  2%  proc-vmstat.pgdeactivate
 3.189e+08            +1.3%  3.229e+08        proc-vmstat.pgfree
      3750 ±  8%     +39.2%       5219 ± 11%  proc-vmstat.pgmajfault
      2288            +4.7%       2397        proc-vmstat.pgpgin
 1.256e+08 ±  2%     +36.7%  1.716e+08 ±  2%  proc-vmstat.pgrefill
  28689981 ± 10%    +128.0%   65414454 ±  2%  proc-vmstat.pgrotated
  18525039 ± 17%    +158.2%   47838018 ±  5%  proc-vmstat.pgscan_direct
  66417132 ±  3%     +61.9%  1.076e+08        proc-vmstat.pgscan_file
  47888348 ±  3%     +24.4%   59549526 ±  3%  proc-vmstat.pgscan_kswapd
   7140404 ± 15%     +30.8%    9338067 ±  3%  proc-vmstat.pgsteal_direct
  36234957 ±  2%      +9.8%   39787030 ±  2%  proc-vmstat.pgsteal_file
   7697854 ±  2%     +31.0%   10086404 ±  5%  proc-vmstat.workingset_refault_file
     41.26           -18.8       22.44 ± 11%  perf-profile.calltrace.cycles-pp.do_access
     28.60           -12.8       15.77 ± 11%  perf-profile.calltrace.cycles-pp.asm_exc_page_fault.do_access
     27.64           -12.6       15.00 ± 11%  perf-profile.calltrace.cycles-pp.do_rw_once
     16.84            -7.8        9.05 ± 11%  perf-profile.calltrace.cycles-pp.exc_page_fault.asm_exc_page_fault.do_access
     16.72            -7.7        8.98 ± 11%  perf-profile.calltrace.cycles-pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.do_access
     14.86            -7.0        7.89 ± 11%  perf-profile.calltrace.cycles-pp.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.do_access
     13.75            -6.4        7.31 ± 11%  perf-profile.calltrace.cycles-pp.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
     12.44            -5.9        6.58 ± 11%  perf-profile.calltrace.cycles-pp.do_fault.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault
      5.10            -2.4        2.75 ± 12%  perf-profile.calltrace.cycles-pp.do_page_mkwrite.do_fault.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      4.99            -2.3        2.69 ± 12%  perf-profile.calltrace.cycles-pp.__xfs_filemap_fault.do_page_mkwrite.do_fault.__handle_mm_fault.handle_mm_fault
      3.68 ±  2%      -1.7        1.96 ± 12%  perf-profile.calltrace.cycles-pp.fault_dirty_shared_page.do_fault.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      3.63            -1.6        2.03 ± 12%  perf-profile.calltrace.cycles-pp.iomap_page_mkwrite.__xfs_filemap_fault.do_page_mkwrite.do_fault.__handle_mm_fault
      2.37 ±  6%      -1.2        1.14 ±  9%  perf-profile.calltrace.cycles-pp.__do_fault.do_fault.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      2.52 ±  3%      -1.2        1.31 ± 13%  perf-profile.calltrace.cycles-pp.balance_dirty_pages_ratelimited_flags.fault_dirty_shared_page.do_fault.__handle_mm_fault.handle_mm_fault
      2.36 ±  2%      -1.0        1.35 ± 12%  perf-profile.calltrace.cycles-pp.sync_regs.asm_exc_page_fault.do_access
      1.87 ±  8%      -1.0        0.89 ±  9%  perf-profile.calltrace.cycles-pp.filemap_fault.__do_fault.do_fault.__handle_mm_fault.handle_mm_fault
      2.02 ±  4%      -1.0        1.06 ± 13%  perf-profile.calltrace.cycles-pp.balance_dirty_pages.balance_dirty_pages_ratelimited_flags.fault_dirty_shared_page.do_fault.__handle_mm_fault
      1.73 ±  3%      -1.0        0.78 ± 11%  perf-profile.calltrace.cycles-pp.__writeback_inodes_wb.wb_writeback.wb_do_writeback.wb_workfn.process_one_work
      1.73 ±  3%      -1.0        0.78 ± 11%  perf-profile.calltrace.cycles-pp.__writeback_single_inode.writeback_sb_inodes.__writeback_inodes_wb.wb_writeback.wb_do_writeback
      1.73 ±  3%      -1.0        0.78 ± 11%  perf-profile.calltrace.cycles-pp.do_writepages.__writeback_single_inode.writeback_sb_inodes.__writeback_inodes_wb.wb_writeback
      1.73 ±  3%      -1.0        0.78 ± 11%  perf-profile.calltrace.cycles-pp.write_cache_pages.iomap_writepages.xfs_vm_writepages.do_writepages.__writeback_single_inode
      1.73 ±  3%      -1.0        0.78 ± 11%  perf-profile.calltrace.cycles-pp.writeback_sb_inodes.__writeback_inodes_wb.wb_writeback.wb_do_writeback.wb_workfn
      1.73 ±  3%      -1.0        0.78 ± 11%  perf-profile.calltrace.cycles-pp.xfs_vm_writepages.do_writepages.__writeback_single_inode.writeback_sb_inodes.__writeback_inodes_wb
      1.73 ±  3%      -1.0        0.78 ± 11%  perf-profile.calltrace.cycles-pp.iomap_writepages.xfs_vm_writepages.do_writepages.__writeback_single_inode.writeback_sb_inodes
      1.73 ±  3%      -1.0        0.78 ± 11%  perf-profile.calltrace.cycles-pp.wb_do_writeback.wb_workfn.process_one_work.worker_thread.kthread
      1.73 ±  3%      -1.0        0.78 ± 11%  perf-profile.calltrace.cycles-pp.wb_workfn.process_one_work.worker_thread.kthread.ret_from_fork
      1.73 ±  3%      -1.0        0.78 ± 11%  perf-profile.calltrace.cycles-pp.wb_writeback.wb_do_writeback.wb_workfn.process_one_work.worker_thread
      1.90            -0.8        1.08 ± 12%  perf-profile.calltrace.cycles-pp.iomap_iter.iomap_page_mkwrite.__xfs_filemap_fault.do_page_mkwrite.do_fault
      1.47            -0.6        0.83 ± 15%  perf-profile.calltrace.cycles-pp.xfs_buffered_write_iomap_begin.iomap_iter.iomap_page_mkwrite.__xfs_filemap_fault.do_page_mkwrite
      3.85 ±  6%      -0.6        3.26 ±  3%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
      0.98 ±  2%      -0.5        0.49 ± 39%  perf-profile.calltrace.cycles-pp.filemap_get_entry.__filemap_get_folio.filemap_fault.__do_fault.do_fault
      1.04 ±  2%      -0.5        0.58 ± 10%  perf-profile.calltrace.cycles-pp.__filemap_get_folio.filemap_fault.__do_fault.do_fault.__handle_mm_fault
      0.71 ±  4%      -0.4        0.28 ±100%  perf-profile.calltrace.cycles-pp.mem_cgroup_wb_stats.balance_dirty_pages.balance_dirty_pages_ratelimited_flags.fault_dirty_shared_page.do_fault
      1.26 ±  5%      -0.4        0.87 ±  4%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      1.19 ±  5%      -0.4        0.82 ±  5%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      0.65 ±  5%      +0.1        0.78 ±  6%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.rest_init
      0.68 ±  6%      +0.1        0.82 ±  6%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.rest_init.arch_call_rest_init
      0.94 ±  4%      +0.2        1.12 ±  5%  perf-profile.calltrace.cycles-pp.arch_call_rest_init.start_kernel.x86_64_start_reservations.x86_64_start_kernel.secondary_startup_64_no_verify
      0.94 ±  4%      +0.2        1.12 ±  5%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.rest_init.arch_call_rest_init.start_kernel.x86_64_start_reservations
      0.94 ±  4%      +0.2        1.12 ±  5%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.rest_init.arch_call_rest_init.start_kernel
      0.94 ±  4%      +0.2        1.12 ±  5%  perf-profile.calltrace.cycles-pp.rest_init.arch_call_rest_init.start_kernel.x86_64_start_reservations.x86_64_start_kernel
      0.94 ±  4%      +0.2        1.12 ±  5%  perf-profile.calltrace.cycles-pp.start_kernel.x86_64_start_reservations.x86_64_start_kernel.secondary_startup_64_no_verify
      0.94 ±  4%      +0.2        1.12 ±  5%  perf-profile.calltrace.cycles-pp.x86_64_start_kernel.secondary_startup_64_no_verify
      0.94 ±  4%      +0.2        1.12 ±  5%  perf-profile.calltrace.cycles-pp.x86_64_start_reservations.x86_64_start_kernel.secondary_startup_64_no_verify
      0.54 ±  3%      +0.5        1.03 ±  6%  perf-profile.calltrace.cycles-pp.filemap_get_entry.shmem_get_folio_gfp.shmem_write_begin.generic_perform_write.shmem_file_write_iter
      0.00            +0.6        0.57 ±  7%  perf-profile.calltrace.cycles-pp.io_serial_out.serial8250_console_write.console_flush_all.console_unlock.vprintk_emit
      0.83 ±  3%      +0.7        1.48 ±  6%  perf-profile.calltrace.cycles-pp.shmem_get_folio_gfp.shmem_write_begin.generic_perform_write.shmem_file_write_iter.do_iter_readv_writev
      0.90 ±  3%      +0.7        1.59 ±  6%  perf-profile.calltrace.cycles-pp.shmem_write_begin.generic_perform_write.shmem_file_write_iter.do_iter_readv_writev.do_iter_write
      0.00            +0.7        0.71 ±  8%  perf-profile.calltrace.cycles-pp.tlb_batch_pages_flush.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_vmas
      0.00            +0.7        0.75 ± 19%  perf-profile.calltrace.cycles-pp.loop_queue_rq.__blk_mq_issue_directly.blk_mq_try_issue_directly.blk_mq_submit_bio.submit_bio_noacct_nocheck
      0.00            +0.8        0.75 ± 18%  perf-profile.calltrace.cycles-pp.__blk_mq_issue_directly.blk_mq_try_issue_directly.blk_mq_submit_bio.submit_bio_noacct_nocheck.iomap_add_to_ioend
      0.00            +0.8        0.77 ± 18%  perf-profile.calltrace.cycles-pp.blk_mq_try_issue_directly.blk_mq_submit_bio.submit_bio_noacct_nocheck.iomap_add_to_ioend.iomap_writepage_map
      0.70 ± 10%      +0.9        1.56 ± 11%  perf-profile.calltrace.cycles-pp.wait_for_lsr.serial8250_console_write.console_flush_all.console_unlock.vprintk_emit
      0.60 ± 38%      +0.9        1.48 ± 13%  perf-profile.calltrace.cycles-pp.io_serial_in.wait_for_lsr.serial8250_console_write.console_flush_all.console_unlock
      0.00            +1.1        1.07 ±  6%  perf-profile.calltrace.cycles-pp.page_remove_rmap.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_vmas
      0.95 ±  9%      +1.5        2.47 ±  9%  perf-profile.calltrace.cycles-pp.serial8250_console_write.console_flush_all.console_unlock.vprintk_emit.devkmsg_emit
      0.00            +1.5        1.52 ± 17%  perf-profile.calltrace.cycles-pp.blk_mq_submit_bio.submit_bio_noacct_nocheck.iomap_add_to_ioend.iomap_writepage_map.write_cache_pages
      0.00            +1.5        1.52 ± 17%  perf-profile.calltrace.cycles-pp.submit_bio_noacct_nocheck.iomap_add_to_ioend.iomap_writepage_map.write_cache_pages.iomap_writepages
      1.01 ±  8%      +1.6        2.61 ±  9%  perf-profile.calltrace.cycles-pp.console_flush_all.console_unlock.vprintk_emit.devkmsg_emit.devkmsg_write
      1.01 ±  8%      +1.6        2.61 ±  9%  perf-profile.calltrace.cycles-pp.console_unlock.vprintk_emit.devkmsg_emit.devkmsg_write.vfs_write
      1.01 ±  8%      +1.6        2.63 ±  9%  perf-profile.calltrace.cycles-pp.devkmsg_emit.devkmsg_write.vfs_write.ksys_write.do_syscall_64
      1.01 ±  8%      +1.6        2.63 ±  9%  perf-profile.calltrace.cycles-pp.devkmsg_write.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.01 ±  8%      +1.6        2.63 ±  9%  perf-profile.calltrace.cycles-pp.vprintk_emit.devkmsg_emit.devkmsg_write.vfs_write.ksys_write
      1.03 ±  8%      +1.6        2.66 ±  9%  perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      1.03 ±  8%      +1.6        2.67 ±  8%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      1.03 ±  8%      +1.6        2.67 ±  8%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.write
      1.03 ±  8%      +1.6        2.66 ±  9%  perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      1.03 ±  8%      +1.6        2.67 ±  9%  perf-profile.calltrace.cycles-pp.write
      0.00            +1.8        1.78 ± 11%  perf-profile.calltrace.cycles-pp.native_flush_tlb_one_user.flush_tlb_func.flush_tlb_mm_range.ptep_clear_flush.page_vma_mkclean_one
      0.58 ±  5%      +1.9        2.48 ± 15%  perf-profile.calltrace.cycles-pp.iomap_writepage_map.write_cache_pages.iomap_writepages.xfs_vm_writepages.do_writepages
      0.00            +1.9        1.92 ± 16%  perf-profile.calltrace.cycles-pp.iomap_add_to_ioend.iomap_writepage_map.write_cache_pages.iomap_writepages.xfs_vm_writepages
      0.00            +2.0        1.98 ± 11%  perf-profile.calltrace.cycles-pp.flush_tlb_func.flush_tlb_mm_range.ptep_clear_flush.page_vma_mkclean_one.page_mkclean_one
      0.00            +2.5        2.52 ± 11%  perf-profile.calltrace.cycles-pp.flush_tlb_mm_range.ptep_clear_flush.page_vma_mkclean_one.page_mkclean_one.rmap_walk_file
      0.71 ± 14%      +2.7        3.38 ±  6%  perf-profile.calltrace.cycles-pp.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_vmas.exit_mmap
      0.74 ± 14%      +2.8        3.57 ±  6%  perf-profile.calltrace.cycles-pp.zap_pmd_range.unmap_page_range.unmap_vmas.exit_mmap.__mmput
      0.75 ± 14%      +2.8        3.57 ±  6%  perf-profile.calltrace.cycles-pp.unmap_page_range.unmap_vmas.exit_mmap.__mmput.exit_mm
      0.75 ± 14%      +2.8        3.57 ±  6%  perf-profile.calltrace.cycles-pp.unmap_vmas.exit_mmap.__mmput.exit_mm.do_exit
      0.78 ± 13%      +2.9        3.64 ±  6%  perf-profile.calltrace.cycles-pp.exit_mmap.__mmput.exit_mm.do_exit.do_group_exit
      0.78 ± 13%      +2.9        3.65 ±  6%  perf-profile.calltrace.cycles-pp.__mmput.exit_mm.do_exit.do_group_exit.__x64_sys_exit_group
      0.78 ± 13%      +2.9        3.65 ±  6%  perf-profile.calltrace.cycles-pp.exit_mm.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      0.80 ± 13%      +2.9        3.69 ±  6%  perf-profile.calltrace.cycles-pp.__x64_sys_exit_group.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.80 ± 13%      +2.9        3.69 ±  6%  perf-profile.calltrace.cycles-pp.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.80 ± 13%      +2.9        3.69 ±  6%  perf-profile.calltrace.cycles-pp.do_group_exit.__x64_sys_exit_group.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +2.9        2.90 ± 11%  perf-profile.calltrace.cycles-pp.ptep_clear_flush.page_vma_mkclean_one.page_mkclean_one.rmap_walk_file.folio_mkclean
      0.90 ± 11%      +2.9        3.83 ±  5%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.90 ± 11%      +2.9        3.82 ±  5%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.75 ±  2%      +2.9        3.68 ± 14%  perf-profile.calltrace.cycles-pp.page_vma_mkclean_one.page_mkclean_one.rmap_walk_file.folio_mkclean.folio_clear_dirty_for_io
      0.78 ±  2%      +2.9        3.72 ± 14%  perf-profile.calltrace.cycles-pp.page_mkclean_one.rmap_walk_file.folio_mkclean.folio_clear_dirty_for_io.write_cache_pages
      0.80 ±  2%      +3.0        3.76 ± 14%  perf-profile.calltrace.cycles-pp.rmap_walk_file.folio_mkclean.folio_clear_dirty_for_io.write_cache_pages.iomap_writepages
      0.88 ±  3%      +3.0        3.87 ± 14%  perf-profile.calltrace.cycles-pp.folio_mkclean.folio_clear_dirty_for_io.write_cache_pages.iomap_writepages.xfs_vm_writepages
      1.00 ±  3%      +3.2        4.22 ± 13%  perf-profile.calltrace.cycles-pp.folio_clear_dirty_for_io.write_cache_pages.iomap_writepages.xfs_vm_writepages.do_writepages
      2.76 ±  6%      +3.9        6.66 ±  8%  perf-profile.calltrace.cycles-pp.memcpy_toio.drm_fb_memcpy.ast_primary_plane_helper_atomic_update.drm_atomic_helper_commit_planes.drm_atomic_helper_commit_tail_rpm
      2.80 ±  6%      +4.0        6.78 ±  8%  perf-profile.calltrace.cycles-pp.ast_primary_plane_helper_atomic_update.drm_atomic_helper_commit_planes.drm_atomic_helper_commit_tail_rpm.ast_mode_config_helper_atomic_commit_tail.commit_tail
      2.80 ±  6%      +4.0        6.78 ±  8%  perf-profile.calltrace.cycles-pp.drm_fb_memcpy.ast_primary_plane_helper_atomic_update.drm_atomic_helper_commit_planes.drm_atomic_helper_commit_tail_rpm.ast_mode_config_helper_atomic_commit_tail
      2.81 ±  6%      +4.0        6.80 ±  8%  perf-profile.calltrace.cycles-pp.drm_atomic_helper_commit_planes.drm_atomic_helper_commit_tail_rpm.ast_mode_config_helper_atomic_commit_tail.commit_tail.drm_atomic_helper_commit
      2.81 ±  6%      +4.0        6.80 ±  8%  perf-profile.calltrace.cycles-pp.drm_atomic_helper_commit_tail_rpm.ast_mode_config_helper_atomic_commit_tail.commit_tail.drm_atomic_helper_commit.drm_atomic_commit
      2.83 ±  6%      +4.0        6.83 ±  8%  perf-profile.calltrace.cycles-pp.ast_mode_config_helper_atomic_commit_tail.commit_tail.drm_atomic_helper_commit.drm_atomic_commit.drm_atomic_helper_dirtyfb
      2.83 ±  6%      +4.0        6.83 ±  8%  perf-profile.calltrace.cycles-pp.commit_tail.drm_atomic_helper_commit.drm_atomic_commit.drm_atomic_helper_dirtyfb.drm_fbdev_generic_helper_fb_dirty
      2.85 ±  6%      +4.0        6.88 ±  8%  perf-profile.calltrace.cycles-pp.drm_atomic_helper_dirtyfb.drm_fbdev_generic_helper_fb_dirty.drm_fb_helper_damage_work.process_one_work.worker_thread
      2.85 ±  6%      +4.0        6.87 ±  8%  perf-profile.calltrace.cycles-pp.drm_atomic_commit.drm_atomic_helper_dirtyfb.drm_fbdev_generic_helper_fb_dirty.drm_fb_helper_damage_work.process_one_work
      2.85 ±  6%      +4.0        6.87 ±  8%  perf-profile.calltrace.cycles-pp.drm_atomic_helper_commit.drm_atomic_commit.drm_atomic_helper_dirtyfb.drm_fbdev_generic_helper_fb_dirty.drm_fb_helper_damage_work
      2.99 ±  5%      +4.1        7.12 ±  8%  perf-profile.calltrace.cycles-pp.drm_fb_helper_damage_work.process_one_work.worker_thread.kthread.ret_from_fork
      2.99 ±  5%      +4.1        7.12 ±  8%  perf-profile.calltrace.cycles-pp.drm_fbdev_generic_helper_fb_dirty.drm_fb_helper_damage_work.process_one_work.worker_thread.kthread
      8.37 ±  5%      +5.1       13.50 ±  6%  perf-profile.calltrace.cycles-pp.folio_unlock.shmem_write_end.generic_perform_write.shmem_file_write_iter.do_iter_readv_writev
      8.66 ±  5%      +5.3       13.94 ±  6%  perf-profile.calltrace.cycles-pp.shmem_write_end.generic_perform_write.shmem_file_write_iter.do_iter_readv_writev.do_iter_write
     10.05 ±  3%      +6.7       16.74 ±  5%  perf-profile.calltrace.cycles-pp.__memcpy.copy_page_from_iter_atomic.generic_perform_write.shmem_file_write_iter.do_iter_readv_writev
     10.26 ±  3%      +6.8       17.08 ±  5%  perf-profile.calltrace.cycles-pp.copy_page_from_iter_atomic.generic_perform_write.shmem_file_write_iter.do_iter_readv_writev.do_iter_write
      0.00            +6.8        6.85 ± 12%  perf-profile.calltrace.cycles-pp.write_cache_pages.iomap_writepages.xfs_vm_writepages.do_writepages.filemap_fdatawrite_wbc
      0.00            +6.9        6.85 ± 13%  perf-profile.calltrace.cycles-pp.iomap_writepages.xfs_vm_writepages.do_writepages.filemap_fdatawrite_wbc.__filemap_fdatawrite_range
      0.00            +6.9        6.90 ± 12%  perf-profile.calltrace.cycles-pp.do_writepages.filemap_fdatawrite_wbc.__filemap_fdatawrite_range.file_write_and_wait_range.xfs_file_fsync
      0.00            +6.9        6.90 ± 12%  perf-profile.calltrace.cycles-pp.xfs_vm_writepages.do_writepages.filemap_fdatawrite_wbc.__filemap_fdatawrite_range.file_write_and_wait_range
      0.00            +6.9        6.90 ± 12%  perf-profile.calltrace.cycles-pp.__filemap_fdatawrite_range.file_write_and_wait_range.xfs_file_fsync.__do_sys_msync.do_syscall_64
      0.00            +6.9        6.90 ± 12%  perf-profile.calltrace.cycles-pp.filemap_fdatawrite_wbc.__filemap_fdatawrite_range.file_write_and_wait_range.xfs_file_fsync.__do_sys_msync
      0.00            +7.0        6.96 ± 12%  perf-profile.calltrace.cycles-pp.file_write_and_wait_range.xfs_file_fsync.__do_sys_msync.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +7.0        6.97 ± 12%  perf-profile.calltrace.cycles-pp.__do_sys_msync.do_syscall_64.entry_SYSCALL_64_after_hwframe.msync
      0.00            +7.0        6.97 ± 12%  perf-profile.calltrace.cycles-pp.xfs_file_fsync.__do_sys_msync.do_syscall_64.entry_SYSCALL_64_after_hwframe.msync
      0.00            +7.0        6.98 ± 12%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.msync
      0.00            +7.0        6.98 ± 12%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.msync
      0.00            +7.0        6.98 ± 12%  perf-profile.calltrace.cycles-pp.msync
     20.13           +13.0       33.16 ±  5%  perf-profile.calltrace.cycles-pp.generic_perform_write.shmem_file_write_iter.do_iter_readv_writev.do_iter_write.lo_write_simple
     20.69           +13.4       34.08 ±  6%  perf-profile.calltrace.cycles-pp.shmem_file_write_iter.do_iter_readv_writev.do_iter_write.lo_write_simple.loop_process_work
     20.82           +13.5       34.29 ±  6%  perf-profile.calltrace.cycles-pp.do_iter_readv_writev.do_iter_write.lo_write_simple.loop_process_work.process_one_work
     21.06           +13.6       34.68 ±  6%  perf-profile.calltrace.cycles-pp.do_iter_write.lo_write_simple.loop_process_work.process_one_work.worker_thread
     21.35           +13.8       35.16 ±  6%  perf-profile.calltrace.cycles-pp.lo_write_simple.loop_process_work.process_one_work.worker_thread.kthread
     21.48           +13.8       35.32 ±  6%  perf-profile.calltrace.cycles-pp.loop_process_work.process_one_work.worker_thread.kthread.ret_from_fork
     27.29           +16.9       44.22 ±  5%  perf-profile.calltrace.cycles-pp.kthread.ret_from_fork.ret_from_fork_asm
     27.29           +16.9       44.22 ±  5%  perf-profile.calltrace.cycles-pp.ret_from_fork.ret_from_fork_asm
     27.29           +16.9       44.22 ±  5%  perf-profile.calltrace.cycles-pp.ret_from_fork_asm
     26.82           +17.0       43.84 ±  5%  perf-profile.calltrace.cycles-pp.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     26.65           +17.0       43.70 ±  5%  perf-profile.calltrace.cycles-pp.process_one_work.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     38.60           -17.4       21.15 ± 11%  perf-profile.children.cycles-pp.do_access
     32.62           -15.0       17.58 ± 11%  perf-profile.children.cycles-pp.do_rw_once
     24.26           -10.9       13.39 ± 11%  perf-profile.children.cycles-pp.asm_exc_page_fault
     16.96            -7.7        9.21 ± 11%  perf-profile.children.cycles-pp.exc_page_fault
     16.86            -7.7        9.16 ± 11%  perf-profile.children.cycles-pp.do_user_addr_fault
     15.00            -6.9        8.06 ± 11%  perf-profile.children.cycles-pp.handle_mm_fault
     13.90            -6.4        7.48 ± 11%  perf-profile.children.cycles-pp.__handle_mm_fault
     12.57            -5.9        6.71 ± 11%  perf-profile.children.cycles-pp.do_fault
      5.12            -2.4        2.76 ± 12%  perf-profile.children.cycles-pp.do_page_mkwrite
      5.11            -2.4        2.75 ± 12%  perf-profile.children.cycles-pp.__xfs_filemap_fault
      3.73 ±  2%      -1.7        1.99 ± 12%  perf-profile.children.cycles-pp.fault_dirty_shared_page
      3.67            -1.6        2.05 ± 12%  perf-profile.children.cycles-pp.iomap_page_mkwrite
      2.39 ±  6%      -1.2        1.16 ±  9%  perf-profile.children.cycles-pp.__do_fault
      2.62 ±  3%      -1.2        1.44 ± 11%  perf-profile.children.cycles-pp.balance_dirty_pages_ratelimited_flags
      2.38 ±  2%      -1.0        1.36 ± 12%  perf-profile.children.cycles-pp.sync_regs
      1.88 ±  8%      -1.0        0.90 ±  9%  perf-profile.children.cycles-pp.filemap_fault
      2.03 ±  4%      -1.0        1.06 ± 13%  perf-profile.children.cycles-pp.balance_dirty_pages
      1.73 ±  3%      -1.0        0.78 ± 11%  perf-profile.children.cycles-pp.__writeback_inodes_wb
      1.73 ±  3%      -1.0        0.78 ± 11%  perf-profile.children.cycles-pp.__writeback_single_inode
      1.73 ±  3%      -1.0        0.78 ± 11%  perf-profile.children.cycles-pp.writeback_sb_inodes
      1.73 ±  3%      -1.0        0.78 ± 11%  perf-profile.children.cycles-pp.wb_do_writeback
      1.73 ±  3%      -1.0        0.78 ± 11%  perf-profile.children.cycles-pp.wb_workfn
      1.73 ±  3%      -1.0        0.78 ± 11%  perf-profile.children.cycles-pp.wb_writeback
      2.25 ±  2%      -0.9        1.34 ±  9%  perf-profile.children.cycles-pp.native_irq_return_iret
      1.95            -0.9        1.09 ± 13%  perf-profile.children.cycles-pp.iomap_iter
      1.53            -0.7        0.86 ± 14%  perf-profile.children.cycles-pp.xfs_buffered_write_iomap_begin
      1.10 ±  8%      -0.6        0.45 ± 13%  perf-profile.children.cycles-pp.io_schedule_timeout
      1.12 ±  8%      -0.6        0.49 ± 11%  perf-profile.children.cycles-pp.schedule_timeout
      1.05 ±  2%      -0.5        0.59 ± 10%  perf-profile.children.cycles-pp.__filemap_get_folio
      0.87 ±  4%      -0.4        0.48 ± 12%  perf-profile.children.cycles-pp.filemap_dirty_folio
      0.83 ±  3%      -0.4        0.46 ± 12%  perf-profile.children.cycles-pp.finish_fault
      0.85 ±  6%      -0.4        0.50 ±  8%  perf-profile.children.cycles-pp.file_update_time
      0.94 ±  4%      -0.4        0.59 ±  9%  perf-profile.children.cycles-pp.iomap_dirty_folio
      0.53 ± 11%      -0.3        0.19 ± 15%  perf-profile.children.cycles-pp.xfs_vn_update_time
      0.66 ±  3%      -0.3        0.38 ± 10%  perf-profile.children.cycles-pp.lock_vma_under_rcu
      0.52 ±  6%      -0.3        0.26 ± 23%  perf-profile.children.cycles-pp.__count_memcg_events
      0.64 ±  4%      -0.2        0.42 ±  8%  perf-profile.children.cycles-pp.ifs_set_range_dirty
      0.56 ±  3%      -0.2        0.33 ± 18%  perf-profile.children.cycles-pp.xfs_ilock
      0.57 ±  3%      -0.2        0.34 ± 11%  perf-profile.children.cycles-pp.lock_mm_and_find_vma
      0.54 ±  4%      -0.2        0.32 ±  8%  perf-profile.children.cycles-pp.mtree_range_walk
      0.35 ± 10%      -0.2        0.13 ± 18%  perf-profile.children.cycles-pp.__xfs_trans_commit
      0.72 ±  4%      -0.2        0.50 ± 14%  perf-profile.children.cycles-pp.mem_cgroup_wb_stats
      0.47 ±  4%      -0.2        0.26 ± 13%  perf-profile.children.cycles-pp.__perf_sw_event
      0.32 ±  9%      -0.2        0.12 ± 10%  perf-profile.children.cycles-pp.run_timer_softirq
      0.44 ±  3%      -0.2        0.24 ± 11%  perf-profile.children.cycles-pp.set_pte_range
      0.24 ± 52%      -0.2        0.05 ± 40%  perf-profile.children.cycles-pp.__memset
      0.32 ±  8%      -0.2        0.13 ± 11%  perf-profile.children.cycles-pp.__run_timers
      0.40 ±  4%      -0.2        0.21 ± 14%  perf-profile.children.cycles-pp.__folio_mark_dirty
      0.66 ±  4%      -0.2        0.48 ± 14%  perf-profile.children.cycles-pp.cgroup_rstat_flush
      0.66 ±  4%      -0.2        0.48 ± 14%  perf-profile.children.cycles-pp.do_flush_stats
      0.29 ±  9%      -0.2        0.10 ± 20%  perf-profile.children.cycles-pp.xlog_cil_commit
      0.66 ±  4%      -0.2        0.47 ± 14%  perf-profile.children.cycles-pp.cgroup_rstat_flush_locked
      0.43 ±  4%      -0.2        0.24 ±  8%  perf-profile.children.cycles-pp.mas_walk
      0.42 ±  5%      -0.2        0.24 ± 10%  perf-profile.children.cycles-pp.xfs_iunlock
      0.43 ±  4%      -0.2        0.25 ± 11%  perf-profile.children.cycles-pp.handle_pte_fault
      0.44 ±  3%      -0.2        0.26 ±  9%  perf-profile.children.cycles-pp.up_read
      0.28 ± 10%      -0.2        0.11 ± 11%  perf-profile.children.cycles-pp.call_timer_fn
      0.38 ±  4%      -0.2        0.22 ± 18%  perf-profile.children.cycles-pp.xfs_ilock_for_iomap
      0.32 ±  4%      -0.2        0.17 ± 12%  perf-profile.children.cycles-pp.folio_account_dirtied
      0.35 ±  3%      -0.1        0.21 ± 11%  perf-profile.children.cycles-pp.find_vma
      0.38 ±  4%      -0.1        0.24 ± 12%  perf-profile.children.cycles-pp.___perf_sw_event
      0.33 ±  5%      -0.1        0.19 ± 10%  perf-profile.children.cycles-pp.pte_offset_map_nolock
      0.30 ±  2%      -0.1        0.16 ± 15%  perf-profile.children.cycles-pp.iomap_iter_advance
      0.32 ±  3%      -0.1        0.19 ± 10%  perf-profile.children.cycles-pp.mt_find
      0.35 ±  6%      -0.1        0.22 ±  5%  perf-profile.children.cycles-pp.try_to_wake_up
      0.21 ±  5%      -0.1        0.10 ± 18%  perf-profile.children.cycles-pp.xfs_iext_lookup_extent
      0.30 ±  3%      -0.1        0.19 ± 12%  perf-profile.children.cycles-pp.down_read_trylock
      1.31 ±  2%      -0.1        1.20 ±  4%  perf-profile.children.cycles-pp.irq_exit_rcu
      0.26 ±  5%      -0.1        0.15 ± 15%  perf-profile.children.cycles-pp.error_entry
      0.15 ± 10%      -0.1        0.04 ± 83%  perf-profile.children.cycles-pp.xlog_cil_insert_items
      0.15 ±  9%      -0.1        0.05 ± 39%  perf-profile.children.cycles-pp.xfs_trans_alloc
      0.26 ±  8%      -0.1        0.16 ± 12%  perf-profile.children.cycles-pp.__pte_offset_map
      0.18 ± 13%      -0.1        0.08 ± 11%  perf-profile.children.cycles-pp.refresh_cpu_vm_stats
      0.26 ±  3%      -0.1        0.17 ± 18%  perf-profile.children.cycles-pp.mem_cgroup_css_rstat_flush
      0.22 ±  3%      -0.1        0.12 ± 15%  perf-profile.children.cycles-pp.down_read
      0.35 ±  5%      -0.1        0.27 ±  6%  perf-profile.children.cycles-pp.__pte_offset_map_lock
      0.18 ±  6%      -0.1        0.10 ± 20%  perf-profile.children.cycles-pp.xfs_bmapi_reserve_delalloc
      0.16 ±  5%      -0.1        0.09 ± 15%  perf-profile.children.cycles-pp.fput
      0.14 ±  7%      -0.1        0.08 ± 13%  perf-profile.children.cycles-pp.access_error
      0.16 ±  7%      -0.1        0.09 ± 11%  perf-profile.children.cycles-pp.folio_add_file_rmap_range
      0.09 ±  8%      -0.1        0.03 ±100%  perf-profile.children.cycles-pp.xfs_iread_extents
      0.19 ±  9%      -0.1        0.13 ± 16%  perf-profile.children.cycles-pp.irqentry_exit_to_user_mode
      0.08 ±  7%      -0.1        0.03 ±100%  perf-profile.children.cycles-pp.xfs_mod_freecounter
      0.11 ±  4%      -0.1        0.05 ± 39%  perf-profile.children.cycles-pp.ifs_alloc
      0.52            -0.1        0.47 ±  4%  perf-profile.children.cycles-pp.xas_descend
      0.12 ±  9%      -0.1        0.07 ± 16%  perf-profile.children.cycles-pp.folio_memcg_lock
      0.12 ±  5%      -0.0        0.07 ± 17%  perf-profile.children.cycles-pp.xfs_bmbt_to_iomap
      0.07 ±  9%      -0.0        0.03 ±100%  perf-profile.children.cycles-pp.perf_swevent_event
      0.10 ±  8%      -0.0        0.06 ± 15%  perf-profile.children.cycles-pp.__irqentry_text_end
      0.10 ± 18%      -0.0        0.06 ± 12%  perf-profile.children.cycles-pp.__alloc_pages
      0.10 ±  5%      -0.0        0.06 ± 12%  perf-profile.children.cycles-pp.pte_alloc_one
      0.11 ± 10%      -0.0        0.06 ± 41%  perf-profile.children.cycles-pp.irq_enter_rcu
      0.10 ± 10%      -0.0        0.06 ± 39%  perf-profile.children.cycles-pp.tick_irq_enter
      0.12 ±  9%      -0.0        0.08 ± 14%  perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      0.10 ±  9%      -0.0        0.06 ± 40%  perf-profile.children.cycles-pp.__bitmap_set
      0.08 ±  9%      -0.0        0.04 ± 79%  perf-profile.children.cycles-pp.xfs_bmap_add_extent_hole_delay
      0.06 ±  5%      +0.0        0.08 ± 12%  perf-profile.children.cycles-pp.load_elf_binary
      0.05            +0.0        0.07 ± 11%  perf-profile.children.cycles-pp.vm_mmap_pgoff
      0.05 ±  6%      +0.0        0.08 ±  9%  perf-profile.children.cycles-pp.kernel_clone
      0.07 ±  9%      +0.0        0.10 ±  6%  perf-profile.children.cycles-pp.seq_read_iter
      0.06 ±  5%      +0.0        0.09 ± 12%  perf-profile.children.cycles-pp.exec_binprm
      0.06 ±  5%      +0.0        0.09 ± 12%  perf-profile.children.cycles-pp.search_binary_handler
      0.04 ± 37%      +0.0        0.07 ± 15%  perf-profile.children.cycles-pp.do_mmap
      0.06 ± 15%      +0.0        0.08 ± 10%  perf-profile.children.cycles-pp.tick_nohz_next_event
      0.08 ±  5%      +0.0        0.11 ± 10%  perf-profile.children.cycles-pp.bprm_execve
      0.05 ± 38%      +0.0        0.08 ± 17%  perf-profile.children.cycles-pp.mm_init
      0.04 ± 37%      +0.0        0.08 ± 14%  perf-profile.children.cycles-pp.drm_gem_shmem_vmap
      0.04 ± 37%      +0.0        0.08 ± 14%  perf-profile.children.cycles-pp.drm_gem_vmap
      0.04 ± 37%      +0.0        0.08 ± 14%  perf-profile.children.cycles-pp.drm_gem_vmap_unlocked
      0.03 ± 77%      +0.0        0.07 ± 12%  perf-profile.children.cycles-pp.filemap_map_pages
      0.12 ±  9%      +0.0        0.16 ±  7%  perf-profile.children.cycles-pp.intel_idle
      0.09 ± 16%      +0.0        0.13 ±  9%  perf-profile.children.cycles-pp.tick_nohz_get_sleep_length
      0.08 ± 17%      +0.0        0.11 ± 12%  perf-profile.children.cycles-pp.evlist_cpu_iterator__next
      0.03 ± 78%      +0.0        0.07 ± 10%  perf-profile.children.cycles-pp.do_read_fault
      0.02 ±100%      +0.0        0.06 ± 10%  perf-profile.children.cycles-pp.mmap_region
      0.09 ± 19%      +0.0        0.13 ± 13%  perf-profile.children.cycles-pp.hrtimer_start_range_ns
      0.07 ± 16%      +0.0        0.12 ± 13%  perf-profile.children.cycles-pp.generic_write_checks
      0.07 ±  4%      +0.0        0.12 ±  9%  perf-profile.children.cycles-pp.wbc_account_cgroup_owner
      0.09 ±  9%      +0.0        0.13 ± 13%  perf-profile.children.cycles-pp.balance_fair
      0.10 ± 13%      +0.0        0.15 ±  6%  perf-profile.children.cycles-pp.need_update
      0.01 ±264%      +0.1        0.06 ±  8%  perf-profile.children.cycles-pp.cpuidle_governor_latency_req
      0.01 ±264%      +0.1        0.06 ± 12%  perf-profile.children.cycles-pp.pcpu_alloc
      0.10 ± 11%      +0.1        0.14 ±  9%  perf-profile.children.cycles-pp.apparmor_file_permission
      0.01 ±264%      +0.1        0.06 ±  5%  perf-profile.children.cycles-pp.__cmd_record
      0.01 ±264%      +0.1        0.06 ±  5%  perf-profile.children.cycles-pp.cmd_record
      0.11 ± 14%      +0.1        0.16 ±  5%  perf-profile.children.cycles-pp.quiet_vmstat
      0.27 ±  3%      +0.1        0.33 ±  6%  perf-profile.children.cycles-pp.rcu_all_qs
      0.14 ±  2%      +0.1        0.20 ±  8%  perf-profile.children.cycles-pp.__x64_sys_execve
      0.14 ±  2%      +0.1        0.20 ±  8%  perf-profile.children.cycles-pp.do_execveat_common
      0.14 ±  3%      +0.1        0.20 ±  8%  perf-profile.children.cycles-pp.execve
      0.09 ±  8%      +0.1        0.14 ±  8%  perf-profile.children.cycles-pp.xfs_map_blocks
      0.12 ± 22%      +0.1        0.17 ± 11%  perf-profile.children.cycles-pp.sched_setaffinity
      0.00            +0.1        0.06 ± 12%  perf-profile.children.cycles-pp.copy_process
      0.22 ±  5%      +0.1        0.28 ± 10%  perf-profile.children.cycles-pp.smpboot_thread_fn
      0.00            +0.1        0.06 ± 14%  perf-profile.children.cycles-pp.__get_task_ioprio
      0.15 ±  9%      +0.1        0.21 ±  9%  perf-profile.children.cycles-pp.read_counters
      0.00            +0.1        0.06 ± 15%  perf-profile.children.cycles-pp.__blk_mq_alloc_requests
      0.00            +0.1        0.06 ± 15%  perf-profile.children.cycles-pp.drm_gem_shmem_vunmap
      0.00            +0.1        0.06 ± 15%  perf-profile.children.cycles-pp.drm_gem_vunmap
      0.00            +0.1        0.06 ± 15%  perf-profile.children.cycles-pp.drm_gem_vunmap_unlocked
      0.07 ± 11%      +0.1        0.13 ±  8%  perf-profile.children.cycles-pp.bvec_try_merge_page
      0.16 ± 10%      +0.1        0.22 ± 10%  perf-profile.children.cycles-pp.cmd_stat
      0.16 ± 10%      +0.1        0.22 ± 10%  perf-profile.children.cycles-pp.dispatch_events
      0.16 ± 10%      +0.1        0.22 ± 10%  perf-profile.children.cycles-pp.process_interval
      0.15 ± 11%      +0.1        0.21 ±  9%  perf-profile.children.cycles-pp.__mod_memcg_lruvec_state
      0.00            +0.1        0.06 ± 17%  perf-profile.children.cycles-pp.__wake_up_common
      0.00            +0.1        0.06 ± 19%  perf-profile.children.cycles-pp.shmem_read_folio_gfp
      0.00            +0.1        0.07 ± 14%  perf-profile.children.cycles-pp.hrtimer_cancel
      0.16 ±  7%      +0.1        0.22 ±  8%  perf-profile.children.cycles-pp.vfs_read
      0.00            +0.1        0.07 ± 12%  perf-profile.children.cycles-pp.drm_gem_get_pages
      0.00            +0.1        0.07 ± 12%  perf-profile.children.cycles-pp.drm_gem_shmem_get_pages
      0.04 ± 80%      +0.1        0.11 ± 32%  perf-profile.children.cycles-pp.poll_idle
      0.05 ± 40%      +0.1        0.12 ± 41%  perf-profile.children.cycles-pp.bit_putcs
      0.06 ± 12%      +0.1        0.13 ± 41%  perf-profile.children.cycles-pp.fbcon_putcs
      0.16 ±  6%      +0.1        0.24 ±  8%  perf-profile.children.cycles-pp.ksys_read
      0.00            +0.1        0.07 ± 24%  perf-profile.children.cycles-pp.task_work_run
      0.00            +0.1        0.07 ± 15%  perf-profile.children.cycles-pp.__tlb_remove_page_size
      0.12 ±  8%      +0.1        0.19 ±  6%  perf-profile.children.cycles-pp.__mod_node_page_state
      0.10 ±  6%      +0.1        0.17 ±  7%  perf-profile.children.cycles-pp.drm_fbdev_generic_damage_blit_real
      0.01 ±174%      +0.1        0.09 ± 41%  perf-profile.children.cycles-pp.fast_imageblit
      0.09 ± 27%      +0.1        0.17 ±  8%  perf-profile.children.cycles-pp.__sysvec_irq_work
      0.09 ± 27%      +0.1        0.17 ±  8%  perf-profile.children.cycles-pp.asm_sysvec_irq_work
      0.01 ±174%      +0.1        0.09 ± 43%  perf-profile.children.cycles-pp.drm_fbdev_generic_defio_imageblit
      0.09 ± 27%      +0.1        0.17 ±  8%  perf-profile.children.cycles-pp.irq_work_run
      0.09 ± 27%      +0.1        0.17 ±  8%  perf-profile.children.cycles-pp.irq_work_single
      0.01 ±174%      +0.1        0.09 ± 43%  perf-profile.children.cycles-pp.sys_imageblit
      0.09 ± 27%      +0.1        0.17 ±  8%  perf-profile.children.cycles-pp.sysvec_irq_work
      0.09 ± 26%      +0.1        0.17 ±  8%  perf-profile.children.cycles-pp._printk
      0.10 ± 27%      +0.1        0.17 ±  8%  perf-profile.children.cycles-pp.irq_work_run_list
      0.18 ±  7%      +0.1        0.26 ±  8%  perf-profile.children.cycles-pp.read
      0.00            +0.1        0.08 ± 14%  perf-profile.children.cycles-pp.blk_update_request
      0.06 ± 13%      +0.1        0.15 ± 38%  perf-profile.children.cycles-pp.fbcon_redraw
      0.07 ± 14%      +0.1        0.15 ± 36%  perf-profile.children.cycles-pp.vt_console_print
      0.06 ± 13%      +0.1        0.15 ± 36%  perf-profile.children.cycles-pp.con_scroll
      0.06 ± 13%      +0.1        0.15 ± 36%  perf-profile.children.cycles-pp.fbcon_scroll
      0.06 ± 13%      +0.1        0.15 ± 36%  perf-profile.children.cycles-pp.lf
      0.14 ±  6%      +0.1        0.22 ±  7%  perf-profile.children.cycles-pp.security_file_permission
      0.19 ± 12%      +0.1        0.28 ±  7%  perf-profile.children.cycles-pp.menu_select
      0.55 ±  3%      +0.1        0.64 ±  4%  perf-profile.children.cycles-pp.__cond_resched
      0.00            +0.1        0.09 ± 15%  perf-profile.children.cycles-pp.xas_find_marked
      0.00            +0.1        0.09 ± 11%  perf-profile.children.cycles-pp.tag_pages_for_writeback
      0.09 ± 10%      +0.1        0.18 ± 10%  perf-profile.children.cycles-pp.tick_nohz_restart_sched_tick
      0.12 ±  9%      +0.1        0.21 ± 12%  perf-profile.children.cycles-pp.filemap_get_folios_tag
      0.08 ±  9%      +0.1        0.18 ± 10%  perf-profile.children.cycles-pp.check_pte
      0.12 ±  8%      +0.1        0.23 ±  4%  perf-profile.children.cycles-pp.__mod_lruvec_state
      0.13 ± 11%      +0.1        0.25 ± 10%  perf-profile.children.cycles-pp.bio_add_folio
      0.00            +0.1        0.12 ± 11%  perf-profile.children.cycles-pp.blk_mq_end_request
      0.00            +0.1        0.12 ±  8%  perf-profile.children.cycles-pp.vm_normal_page
      0.13 ±  9%      +0.1        0.25 ± 10%  perf-profile.children.cycles-pp._find_next_bit
      0.00            +0.1        0.12 ± 13%  perf-profile.children.cycles-pp.__bio_split_to_limits
      0.00            +0.1        0.12 ± 36%  perf-profile.children.cycles-pp.prepare_to_wait_exclusive
      1.19 ±  4%      +0.1        1.33 ±  6%  perf-profile.children.cycles-pp.newidle_balance
      0.11 ±  9%      +0.2        0.27 ± 13%  perf-profile.children.cycles-pp.__folio_start_writeback
      0.14 ± 11%      +0.2        0.30 ± 15%  perf-profile.children.cycles-pp.wait_for_xmitr
      0.06 ± 10%      +0.2        0.22 ± 14%  perf-profile.children.cycles-pp.__flush_smp_call_function_queue
      0.00            +0.2        0.16 ± 15%  perf-profile.children.cycles-pp.sched_ttwu_pending
      0.79 ±  5%      +0.2        0.95 ±  6%  perf-profile.children.cycles-pp._nohz_idle_balance
      0.31 ±  6%      +0.2        0.47 ±  4%  perf-profile.children.cycles-pp.__mod_lruvec_page_state
      1.22 ±  3%      +0.2        1.38 ±  7%  perf-profile.children.cycles-pp.find_busiest_group
      1.20 ±  4%      +0.2        1.37 ±  7%  perf-profile.children.cycles-pp.update_sd_lb_stats
      1.13 ±  4%      +0.2        1.30 ±  7%  perf-profile.children.cycles-pp.update_sg_lb_stats
      0.05 ±  9%      +0.2        0.22 ±  8%  perf-profile.children.cycles-pp.blk_complete_reqs
      1.36 ±  4%      +0.2        1.53 ±  6%  perf-profile.children.cycles-pp.load_balance
      0.94 ±  4%      +0.2        1.12 ±  5%  perf-profile.children.cycles-pp.arch_call_rest_init
      0.94 ±  4%      +0.2        1.12 ±  5%  perf-profile.children.cycles-pp.rest_init
      0.94 ±  4%      +0.2        1.12 ±  5%  perf-profile.children.cycles-pp.start_kernel
      0.94 ±  4%      +0.2        1.12 ±  5%  perf-profile.children.cycles-pp.x86_64_start_kernel
      0.94 ±  4%      +0.2        1.12 ±  5%  perf-profile.children.cycles-pp.x86_64_start_reservations
      0.12 ± 12%      +0.2        0.30 ± 11%  perf-profile.children.cycles-pp.tick_nohz_idle_exit
      0.01 ±264%      +0.2        0.18 ±  9%  perf-profile.children.cycles-pp.free_swap_cache
      0.00            +0.2        0.19 ± 14%  perf-profile.children.cycles-pp.do_softirq
      0.01 ±264%      +0.2        0.20 ±  9%  perf-profile.children.cycles-pp.free_pages_and_swap_cache
      0.01 ±264%      +0.2        0.21 ± 14%  perf-profile.children.cycles-pp.folio_activate_fn
      0.06 ± 29%      +0.2        0.26 ± 12%  perf-profile.children.cycles-pp.folio_batch_move_lru
      0.04 ± 81%      +0.2        0.28 ± 13%  perf-profile.children.cycles-pp.folio_activate
      0.46 ± 10%      +0.3        0.74 ±  9%  perf-profile.children.cycles-pp.schedule_idle
      0.04 ± 37%      +0.4        0.40 ± 13%  perf-profile.children.cycles-pp.flush_smp_call_function_queue
      0.18 ± 13%      +0.4        0.54 ±  5%  perf-profile.children.cycles-pp.folio_mark_accessed
      0.38 ±  7%      +0.4        0.75 ±  8%  perf-profile.children.cycles-pp.page_vma_mapped_walk
      0.00            +0.5        0.45 ± 13%  perf-profile.children.cycles-pp.io_schedule
      0.13 ± 13%      +0.5        0.58 ±  8%  perf-profile.children.cycles-pp.release_pages
      0.20 ± 12%      +0.5        0.67 ±  6%  perf-profile.children.cycles-pp._compound_head
      0.11 ±  9%      +0.5        0.63 ±  6%  perf-profile.children.cycles-pp.io_serial_out
      0.00            +0.6        0.57 ± 19%  perf-profile.children.cycles-pp.rq_qos_wait
      0.15 ± 16%      +0.6        0.74 ±  8%  perf-profile.children.cycles-pp.tlb_batch_pages_flush
      0.00            +0.6        0.59 ± 18%  perf-profile.children.cycles-pp.wbt_wait
      0.00            +0.6        0.60 ± 18%  perf-profile.children.cycles-pp.__rq_qos_throttle
      0.89 ±  3%      +0.7        1.58 ±  6%  perf-profile.children.cycles-pp.shmem_get_folio_gfp
      0.92 ±  3%      +0.7        1.62 ±  6%  perf-profile.children.cycles-pp.shmem_write_begin
      0.00            +0.7        0.73 ± 19%  perf-profile.children.cycles-pp._raw_spin_lock_irq
      0.00            +0.7        0.73 ± 20%  perf-profile.children.cycles-pp.loop_queue_work
      0.06 ± 13%      +0.8        0.82 ± 21%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      0.00            +0.8        0.78 ± 20%  perf-profile.children.cycles-pp.__blk_mq_issue_directly
      0.00            +0.8        0.78 ± 20%  perf-profile.children.cycles-pp.loop_queue_rq
      0.00            +0.8        0.79 ± 20%  perf-profile.children.cycles-pp.blk_mq_try_issue_directly
      0.25 ± 11%      +0.8        1.10 ±  6%  perf-profile.children.cycles-pp.page_remove_rmap
      0.87 ±  9%      +1.0        1.91 ± 11%  perf-profile.children.cycles-pp.io_serial_in
      0.91 ±  9%      +1.1        1.98 ± 10%  perf-profile.children.cycles-pp.wait_for_lsr
      0.06 ±  8%      +1.6        1.62 ± 17%  perf-profile.children.cycles-pp.blk_mq_submit_bio
      0.06 ±  7%      +1.6        1.63 ± 17%  perf-profile.children.cycles-pp.submit_bio_noacct_nocheck
      1.03 ±  8%      +1.6        2.62 ±  9%  perf-profile.children.cycles-pp.serial8250_console_write
      1.01 ±  8%      +1.6        2.63 ±  9%  perf-profile.children.cycles-pp.devkmsg_emit
      1.01 ±  8%      +1.6        2.63 ±  9%  perf-profile.children.cycles-pp.devkmsg_write
      1.06 ±  8%      +1.6        2.70 ±  8%  perf-profile.children.cycles-pp.ksys_write
      1.06 ±  8%      +1.6        2.70 ±  8%  perf-profile.children.cycles-pp.vfs_write
      1.06 ±  8%      +1.6        2.71 ±  8%  perf-profile.children.cycles-pp.write
      0.13 ± 10%      +1.7        1.80 ± 11%  perf-profile.children.cycles-pp.native_flush_tlb_one_user
      1.10 ±  7%      +1.7        2.77 ±  8%  perf-profile.children.cycles-pp.console_flush_all
      1.10 ±  7%      +1.7        2.77 ±  8%  perf-profile.children.cycles-pp.console_unlock
      1.10 ±  7%      +1.7        2.80 ±  8%  perf-profile.children.cycles-pp.vprintk_emit
      0.32 ±  7%      +1.7        2.06 ± 15%  perf-profile.children.cycles-pp.iomap_add_to_ioend
      0.15 ± 10%      +1.9        2.00 ± 11%  perf-profile.children.cycles-pp.flush_tlb_func
      0.68 ±  5%      +2.1        2.76 ± 13%  perf-profile.children.cycles-pp.iomap_writepage_map
      0.52 ±  5%      +2.2        2.75 ± 12%  perf-profile.children.cycles-pp.flush_tlb_mm_range
      0.61 ±  5%      +2.5        3.13 ± 12%  perf-profile.children.cycles-pp.ptep_clear_flush
      0.75 ± 14%      +2.8        3.57 ±  6%  perf-profile.children.cycles-pp.unmap_page_range
      0.75 ± 14%      +2.8        3.57 ±  6%  perf-profile.children.cycles-pp.zap_pmd_range
      0.75 ± 14%      +2.8        3.57 ±  6%  perf-profile.children.cycles-pp.zap_pte_range
      0.75 ± 14%      +2.8        3.58 ±  6%  perf-profile.children.cycles-pp.unmap_vmas
      0.79 ± 13%      +2.9        3.66 ±  6%  perf-profile.children.cycles-pp.exit_mmap
      0.78 ± 13%      +2.9        3.65 ±  6%  perf-profile.children.cycles-pp.exit_mm
      0.79 ± 13%      +2.9        3.66 ±  6%  perf-profile.children.cycles-pp.__mmput
      0.81 ± 13%      +2.9        3.69 ±  6%  perf-profile.children.cycles-pp.do_exit
      0.81 ± 13%      +2.9        3.70 ±  6%  perf-profile.children.cycles-pp.__x64_sys_exit_group
      0.81 ± 13%      +2.9        3.70 ±  6%  perf-profile.children.cycles-pp.do_group_exit
      1.11 ±  6%      +3.0        4.08 ± 11%  perf-profile.children.cycles-pp.rmap_walk_file
      1.01 ±  3%      +3.0        4.00 ± 11%  perf-profile.children.cycles-pp.page_vma_mkclean_one
      1.02 ±  3%      +3.0        4.03 ± 11%  perf-profile.children.cycles-pp.page_mkclean_one
      1.14 ±  3%      +3.1        4.20 ± 11%  perf-profile.children.cycles-pp.folio_mkclean
      1.28 ±  2%      +3.3        4.53 ± 11%  perf-profile.children.cycles-pp.folio_clear_dirty_for_io
      2.80 ±  6%      +4.0        6.78 ±  8%  perf-profile.children.cycles-pp.ast_primary_plane_helper_atomic_update
      2.80 ±  6%      +4.0        6.78 ±  8%  perf-profile.children.cycles-pp.drm_fb_memcpy
      2.80 ±  6%      +4.0        6.78 ±  8%  perf-profile.children.cycles-pp.memcpy_toio
      2.81 ±  6%      +4.0        6.80 ±  8%  perf-profile.children.cycles-pp.drm_atomic_helper_commit_planes
      2.81 ±  6%      +4.0        6.80 ±  8%  perf-profile.children.cycles-pp.drm_atomic_helper_commit_tail_rpm
      2.83 ±  6%      +4.0        6.83 ±  8%  perf-profile.children.cycles-pp.ast_mode_config_helper_atomic_commit_tail
      2.83 ±  6%      +4.0        6.83 ±  8%  perf-profile.children.cycles-pp.commit_tail
      2.85 ±  6%      +4.0        6.88 ±  8%  perf-profile.children.cycles-pp.drm_atomic_helper_dirtyfb
      2.85 ±  6%      +4.0        6.87 ±  8%  perf-profile.children.cycles-pp.drm_atomic_commit
      2.85 ±  6%      +4.0        6.87 ±  8%  perf-profile.children.cycles-pp.drm_atomic_helper_commit
      2.99 ±  5%      +4.1        7.12 ±  8%  perf-profile.children.cycles-pp.drm_fb_helper_damage_work
      2.99 ±  5%      +4.1        7.12 ±  8%  perf-profile.children.cycles-pp.drm_fbdev_generic_helper_fb_dirty
      8.59 ±  5%      +5.1       13.64 ±  6%  perf-profile.children.cycles-pp.folio_unlock
      8.68 ±  5%      +5.3       13.98 ±  6%  perf-profile.children.cycles-pp.shmem_write_end
      2.11 ±  3%      +5.5        7.63 ± 11%  perf-profile.children.cycles-pp.iomap_writepages
      2.11 ±  3%      +5.5        7.63 ± 11%  perf-profile.children.cycles-pp.write_cache_pages
      2.12 ±  3%      +5.6        7.68 ± 11%  perf-profile.children.cycles-pp.do_writepages
      2.12 ±  3%      +5.6        7.68 ± 11%  perf-profile.children.cycles-pp.xfs_vm_writepages
      0.38 ± 11%      +6.5        6.90 ± 12%  perf-profile.children.cycles-pp.__filemap_fdatawrite_range
      0.38 ± 11%      +6.5        6.90 ± 12%  perf-profile.children.cycles-pp.filemap_fdatawrite_wbc
      0.40 ± 12%      +6.6        6.96 ± 12%  perf-profile.children.cycles-pp.file_write_and_wait_range
      0.40 ± 11%      +6.6        6.97 ± 12%  perf-profile.children.cycles-pp.__do_sys_msync
      0.40 ± 11%      +6.6        6.97 ± 12%  perf-profile.children.cycles-pp.xfs_file_fsync
      0.41 ± 11%      +6.6        6.98 ± 12%  perf-profile.children.cycles-pp.msync
     10.20 ±  3%      +6.8       16.99 ±  5%  perf-profile.children.cycles-pp.__memcpy
     10.30 ±  3%      +6.9       17.16 ±  5%  perf-profile.children.cycles-pp.copy_page_from_iter_atomic
      2.87 ±  7%     +11.4       14.24 ±  8%  perf-profile.children.cycles-pp.do_syscall_64
      2.88 ±  7%     +11.4       14.24 ±  8%  perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     20.20           +13.1       33.26 ±  5%  perf-profile.children.cycles-pp.generic_perform_write
     20.76           +13.4       34.18 ±  6%  perf-profile.children.cycles-pp.shmem_file_write_iter
     20.84           +13.5       34.31 ±  6%  perf-profile.children.cycles-pp.do_iter_readv_writev
     21.08           +13.6       34.70 ±  6%  perf-profile.children.cycles-pp.do_iter_write
     21.38           +13.8       35.21 ±  6%  perf-profile.children.cycles-pp.lo_write_simple
     21.48           +13.8       35.32 ±  6%  perf-profile.children.cycles-pp.loop_process_work
     27.29           +16.9       44.22 ±  5%  perf-profile.children.cycles-pp.kthread
     27.29           +16.9       44.23 ±  5%  perf-profile.children.cycles-pp.ret_from_fork
     27.29           +16.9       44.23 ±  5%  perf-profile.children.cycles-pp.ret_from_fork_asm
     26.82           +17.0       43.84 ±  5%  perf-profile.children.cycles-pp.worker_thread
     26.65           +17.0       43.70 ±  5%  perf-profile.children.cycles-pp.process_one_work
     31.29           -14.5       16.79 ± 11%  perf-profile.self.cycles-pp.do_rw_once
     10.12 ±  2%      -4.4        5.70 ± 11%  perf-profile.self.cycles-pp.do_access
      2.37 ±  2%      -1.0        1.36 ± 12%  perf-profile.self.cycles-pp.sync_regs
      2.25 ±  2%      -0.9        1.34 ±  9%  perf-profile.self.cycles-pp.native_irq_return_iret
      0.82 ±  3%      -0.4        0.45 ± 13%  perf-profile.self.cycles-pp.__handle_mm_fault
      0.53 ±  2%      -0.2        0.31 ± 12%  perf-profile.self.cycles-pp.filemap_fault
      0.52 ±  4%      -0.2        0.30 ±  9%  perf-profile.self.cycles-pp.mtree_range_walk
      0.24 ± 51%      -0.2        0.04 ± 59%  perf-profile.self.cycles-pp.__memset
      0.45 ±  4%      -0.2        0.26 ± 16%  perf-profile.self.cycles-pp.iomap_page_mkwrite
      0.40 ±  3%      -0.2        0.22 ± 11%  perf-profile.self.cycles-pp.handle_mm_fault
      0.44 ±  5%      -0.2        0.27 ± 18%  perf-profile.self.cycles-pp.balance_dirty_pages_ratelimited_flags
      0.82 ±  4%      -0.2        0.66 ±  6%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.41 ±  3%      -0.2        0.25 ±  9%  perf-profile.self.cycles-pp.up_read
      0.30 ±  3%      -0.2        0.15 ± 13%  perf-profile.self.cycles-pp.__do_fault
      0.31 ±  2%      -0.1        0.18 ± 10%  perf-profile.self.cycles-pp.xfs_buffered_write_iomap_begin
      0.28 ±  3%      -0.1        0.15 ± 13%  perf-profile.self.cycles-pp.iomap_iter_advance
      0.27 ±  5%      -0.1        0.15 ± 17%  perf-profile.self.cycles-pp.__count_memcg_events
      0.29 ±  3%      -0.1        0.17 ± 12%  perf-profile.self.cycles-pp.filemap_dirty_folio
      0.20 ±  4%      -0.1        0.10 ± 16%  perf-profile.self.cycles-pp.xfs_iext_lookup_extent
      0.28 ±  3%      -0.1        0.17 ± 12%  perf-profile.self.cycles-pp.down_read_trylock
      0.25 ±  3%      -0.1        0.14 ± 11%  perf-profile.self.cycles-pp.do_user_addr_fault
      0.26 ±  3%      -0.1        0.16 ± 17%  perf-profile.self.cycles-pp.mem_cgroup_css_rstat_flush
      0.21 ±  6%      -0.1        0.12 ± 12%  perf-profile.self.cycles-pp.do_fault
      0.25 ±  5%      -0.1        0.16 ± 14%  perf-profile.self.cycles-pp.___perf_sw_event
      0.23 ±  7%      -0.1        0.14 ± 12%  perf-profile.self.cycles-pp.__pte_offset_map
      0.22 ±  4%      -0.1        0.13 ± 15%  perf-profile.self.cycles-pp.error_entry
      0.19 ±  9%      -0.1        0.10 ± 12%  perf-profile.self.cycles-pp.__xfs_filemap_fault
      0.19 ±  5%      -0.1        0.11 ± 17%  perf-profile.self.cycles-pp.asm_exc_page_fault
      0.17 ±  7%      -0.1        0.09 ± 12%  perf-profile.self.cycles-pp.set_pte_range
      0.16 ±  6%      -0.1        0.09 ± 13%  perf-profile.self.cycles-pp.ifs_set_range_dirty
      0.17 ±  6%      -0.1        0.10 ± 17%  perf-profile.self.cycles-pp.fault_dirty_shared_page
      0.12 ± 15%      -0.1        0.05 ± 40%  perf-profile.self.cycles-pp.refresh_cpu_vm_stats
      0.14 ±  8%      -0.1        0.07 ± 16%  perf-profile.self.cycles-pp.balance_dirty_pages
      0.16 ±  6%      -0.1        0.09 ± 12%  perf-profile.self.cycles-pp.pte_offset_map_nolock
      0.15 ±  6%      -0.1        0.08 ± 15%  perf-profile.self.cycles-pp.fput
      0.15 ±  5%      -0.1        0.09 ± 15%  perf-profile.self.cycles-pp.down_read
      0.47 ±  2%      -0.1        0.40 ±  4%  perf-profile.self.cycles-pp.xas_descend
      0.14 ±  8%      -0.1        0.08 ± 16%  perf-profile.self.cycles-pp.iomap_iter
      0.13 ±  8%      -0.1        0.07 ± 12%  perf-profile.self.cycles-pp.access_error
      0.14 ±  6%      -0.1        0.08 ± 17%  perf-profile.self.cycles-pp.xfs_ilock
      0.13 ±  7%      -0.1        0.07 ± 16%  perf-profile.self.cycles-pp.__perf_sw_event
      0.08 ±  8%      -0.1        0.03 ±100%  perf-profile.self.cycles-pp.xfs_iread_extents
      0.12 ±  3%      -0.1        0.07 ± 16%  perf-profile.self.cycles-pp.lock_vma_under_rcu
      0.09 ±  8%      -0.1        0.03 ± 78%  perf-profile.self.cycles-pp.xfs_ilock_for_iomap
      0.09 ±  7%      -0.1        0.04 ± 58%  perf-profile.self.cycles-pp.ifs_alloc
      0.12 ±  6%      -0.1        0.07 ± 12%  perf-profile.self.cycles-pp.mt_find
      0.08 ± 10%      -0.1        0.03 ± 78%  perf-profile.self.cycles-pp.cgroup_rstat_flush_locked
      0.13 ±  4%      -0.1        0.08 ± 14%  perf-profile.self.cycles-pp.folio_add_file_rmap_range
      0.13 ± 11%      -0.1        0.08 ± 11%  perf-profile.self.cycles-pp.xfs_iunlock
      0.12 ±  4%      -0.0        0.07 ± 13%  perf-profile.self.cycles-pp.iomap_dirty_folio
      0.10 ±  7%      -0.0        0.05 ± 40%  perf-profile.self.cycles-pp.folio_memcg_lock
      0.11 ±  4%      -0.0        0.07 ± 19%  perf-profile.self.cycles-pp.xfs_bmbt_to_iomap
      0.10 ±  9%      -0.0        0.06 ± 17%  perf-profile.self.cycles-pp.__irqentry_text_end
      0.09 ±  7%      -0.0        0.05 ± 60%  perf-profile.self.cycles-pp.__bitmap_set
      0.10 ±  6%      -0.0        0.06 ± 17%  perf-profile.self.cycles-pp.handle_pte_fault
      0.10 ±  6%      -0.0        0.07 ± 16%  perf-profile.self.cycles-pp._raw_spin_unlock_irqrestore
      0.10 ±  9%      -0.0        0.08 ±  9%  perf-profile.self.cycles-pp.update_load_avg
      0.05 ± 39%      +0.0        0.08 ± 17%  perf-profile.self.cycles-pp.menu_select
      0.06 ± 15%      +0.0        0.10 ± 10%  perf-profile.self.cycles-pp.apparmor_file_permission
      0.06 ± 17%      +0.0        0.10 ± 10%  perf-profile.self.cycles-pp.shmem_write_begin
      0.08 ±  9%      +0.0        0.12 ± 12%  perf-profile.self.cycles-pp.folio_mkclean
      0.12 ±  9%      +0.0        0.16 ±  7%  perf-profile.self.cycles-pp.intel_idle
      0.16 ±  4%      +0.0        0.20 ±  7%  perf-profile.self.cycles-pp.rcu_all_qs
      0.07 ± 11%      +0.0        0.11 ±  6%  perf-profile.self.cycles-pp.shmem_file_write_iter
      0.19 ± 10%      +0.0        0.23 ±  6%  perf-profile.self.cycles-pp.update_rq_clock
      0.29 ±  4%      +0.0        0.33 ±  4%  perf-profile.self.cycles-pp.__cond_resched
      0.08 ± 10%      +0.0        0.13 ±  9%  perf-profile.self.cycles-pp.do_iter_readv_writev
      0.03 ± 78%      +0.0        0.08 ± 12%  perf-profile.self.cycles-pp.generic_write_checks
      0.04 ± 58%      +0.0        0.09 ± 12%  perf-profile.self.cycles-pp.security_file_permission
      0.08 ±  7%      +0.0        0.13 ± 10%  perf-profile.self.cycles-pp.do_iter_write
      0.01 ±173%      +0.0        0.06 ±  5%  perf-profile.self.cycles-pp.need_update
      0.10 ± 15%      +0.1        0.16 ±  7%  perf-profile.self.cycles-pp.__mod_memcg_lruvec_state
      0.03 ± 77%      +0.1        0.08 ±  8%  perf-profile.self.cycles-pp.xfs_map_blocks
      0.06 ±  8%      +0.1        0.12 ± 11%  perf-profile.self.cycles-pp.bio_add_folio
      0.06 ± 12%      +0.1        0.12 ± 10%  perf-profile.self.cycles-pp.bvec_try_merge_page
      0.00            +0.1        0.06 ± 14%  perf-profile.self.cycles-pp.__get_task_ioprio
      0.01 ±173%      +0.1        0.07 ± 11%  perf-profile.self.cycles-pp.wbc_account_cgroup_owner
      0.09 ±  8%      +0.1        0.15 ± 12%  perf-profile.self.cycles-pp.iomap_writepage_map
      0.00            +0.1        0.06 ± 15%  perf-profile.self.cycles-pp._raw_spin_lock_irq
      0.09 ±  7%      +0.1        0.15 ±  9%  perf-profile.self.cycles-pp.filemap_get_folios_tag
      0.12 ±  7%      +0.1        0.18 ±  7%  perf-profile.self.cycles-pp.__mod_node_page_state
      0.36 ±  3%      +0.1        0.43 ±  6%  perf-profile.self.cycles-pp.xas_load
      0.04 ± 80%      +0.1        0.11 ± 32%  perf-profile.self.cycles-pp.poll_idle
      0.01 ±264%      +0.1        0.08 ± 40%  perf-profile.self.cycles-pp.fast_imageblit
      0.06 ±  9%      +0.1        0.14 ± 13%  perf-profile.self.cycles-pp.page_vma_mkclean_one
      0.00            +0.1        0.09 ±  7%  perf-profile.self.cycles-pp.vm_normal_page
      0.00            +0.1        0.09 ± 14%  perf-profile.self.cycles-pp.xas_find_marked
      0.07 ±  9%      +0.1        0.16 ±  9%  perf-profile.self.cycles-pp.check_pte
      0.12 ±  8%      +0.1        0.21 ±  8%  perf-profile.self.cycles-pp._find_next_bit
      0.12 ±  8%      +0.1        0.22 ± 11%  perf-profile.self.cycles-pp.folio_mark_accessed
      0.69 ±  4%      +0.1        0.79 ±  6%  perf-profile.self.cycles-pp.update_sg_lb_stats
      0.14 ±  7%      +0.1        0.26 ± 11%  perf-profile.self.cycles-pp.iomap_add_to_ioend
      0.20 ±  8%      +0.1        0.32 ±  9%  perf-profile.self.cycles-pp.copy_page_from_iter_atomic
      0.17 ±  6%      +0.1        0.28 ± 11%  perf-profile.self.cycles-pp.lo_write_simple
      0.22 ±  5%      +0.1        0.34 ±  6%  perf-profile.self.cycles-pp.shmem_write_end
      0.18 ±  6%      +0.1        0.30 ±  8%  perf-profile.self.cycles-pp.shmem_get_folio_gfp
      0.17 ±  3%      +0.1        0.29 ±  7%  perf-profile.self.cycles-pp.generic_perform_write
      0.01 ±264%      +0.2        0.16 ± 14%  perf-profile.self.cycles-pp.folio_activate_fn
      0.00            +0.2        0.16 ± 10%  perf-profile.self.cycles-pp.free_swap_cache
      0.00            +0.2        0.21 ± 14%  perf-profile.self.cycles-pp.flush_tlb_func
      0.22 ±  5%      +0.2        0.47 ±  9%  perf-profile.self.cycles-pp.flush_tlb_mm_range
      0.26 ±  5%      +0.2        0.50 ± 10%  perf-profile.self.cycles-pp.page_vma_mapped_walk
      0.09 ±  6%      +0.3        0.38 ± 10%  perf-profile.self.cycles-pp.ptep_clear_flush
      0.16 ± 15%      +0.4        0.58 ±  6%  perf-profile.self.cycles-pp._compound_head
      0.12 ± 14%      +0.4        0.56 ±  8%  perf-profile.self.cycles-pp.release_pages
      0.11 ±  9%      +0.5        0.63 ±  6%  perf-profile.self.cycles-pp.io_serial_out
      0.15 ± 14%      +0.6        0.70 ±  7%  perf-profile.self.cycles-pp.zap_pte_range
      0.18 ± 10%      +0.7        0.85 ±  8%  perf-profile.self.cycles-pp.page_remove_rmap
      0.06 ± 13%      +0.8        0.82 ± 21%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      0.86 ±  9%      +1.0        1.90 ± 11%  perf-profile.self.cycles-pp.io_serial_in
      0.13 ± 10%      +1.7        1.79 ± 11%  perf-profile.self.cycles-pp.native_flush_tlb_one_user
      2.77 ±  6%      +3.9        6.72 ±  8%  perf-profile.self.cycles-pp.memcpy_toio
      8.54 ±  5%      +5.0       13.58 ±  6%  perf-profile.self.cycles-pp.folio_unlock
     10.16 ±  3%      +6.8       16.93 ±  5%  perf-profile.self.cycles-pp.__memcpy




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

