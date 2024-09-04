Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3602F443D
	for <oe-lkp@lists.linux.dev>; Wed,  4 Sep 2024 02:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725416885; cv=fail; b=RQdN6YFmdpuiJcYVf6LIMGRByBBYGXjFupYUFi4ekgbrxOwcSsqPxfXhvVqGqMF9e/BkRN4p1gdoWHc4y1A9IC47ujA7EYSbwBuKQrf+CbCDCAUTrWO6PhN4i8BnBz2i64CWN/qab4kmw3B2dnE/yNlOsSMcdlwS2AkXE9OXhg4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725416885; c=relaxed/simple;
	bh=AxFXy3LRSj1csout3lsYRVXHAXv0T2WtwAaWj0QSuFk=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bAwB7LQSYjMMD/cf0EF2b1YP5yz3jvOOfibkxIorruLZkK/JmYNdBZj8N90ohtEOJRIb5wlukoDhXcJ5VRxl11mnFWal7t7b5EBMEd0UsuvyOhPpuQsY1S0saaRQ440d5Cf49nK2TShjdyNCaUYvAlG49SMB997iJxfgxUCa0GA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XSKE9OA9; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XSKE9OA9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725416883; x=1756952883;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=AxFXy3LRSj1csout3lsYRVXHAXv0T2WtwAaWj0QSuFk=;
  b=XSKE9OA9UnsIAGfe4VxZOd1lK8nB+EB8r6rojkIjXWZSZLxcX/lHkdYU
   0S5WsRqlbnRa5o8Tw7b2vgt+DWFt3lN4TGm7sXUYAhpUWr8zFpvM9D9TV
   p2JPVGOmQ19klYsDKjSKaKR2PQhFv0yBPZgOugMs7O6Aw6nl9WoiX27it
   Iq2yu5SRcIiyaSP8rhA2+T4moYe3mGDOfeLkinNbnNsgEtIPtaHzjSYTc
   5YdXyb3CAht1mWbnlsPOv4fVGLq5Kwb6Xkn3Vb8fY1Pj9xO0A9pZOLb8E
   FptP1n9w6c4bKDObnrWHIL+ThjiV4jYyaSv+LCzSdMe6Xg06Lgm7pWjaG
   w==;
X-CSE-ConnectionGUID: f6rHEcuxRmeKmx3dgr9fig==
X-CSE-MsgGUID: PXhDF8BBQ/+A6kRRXiPxKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="34713980"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; 
   d="scan'208";a="34713980"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 19:27:33 -0700
X-CSE-ConnectionGUID: tq00FcWqSaGMLVaRNi9/lQ==
X-CSE-MsgGUID: 5ael84w9RO6BUQIE329H1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; 
   d="scan'208";a="65831756"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Sep 2024 19:27:33 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Sep 2024 19:27:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Sep 2024 19:27:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Sep 2024 19:27:32 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Sep 2024 19:27:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gWVDgpC68XukLfysEZhSRGVfDPsyGn1nMF5Jku8kUj3KFE4SRlJLfxeCkwMJ11OpLtn5LNYPqIVnIXKdx5d0v1fKiVLNjxtj5FgYxHc50QJl7oxZvKtCA0AbzTy60CSiC73CD9XrAoelu2AGPv9BikAli4G9yI7lJYuYhGuLTQAGkIF71/TooXgLVwkIPkux2ImFPs32Gb2gNDsD1+xizRzlFh2CKuBaEFj+udvG7ma3KfqhlbBcpnSfO/SlWL333dB0Jp2tc9qJneWsNSxJLlE5NSa67Pnsv/79BPtY+Swpo8u9ftzafYg583xZvabd6vL5erKkODOoPfjbeJTC1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WWaq2PbmO52m72qs/9Qf4bhiaI9UVA4E0SWe5MZ72Jg=;
 b=uw3KJBOGJrZZuUqyWi6E3QrCrCWIpM5wDek/T2y+ektxuA7V9+yEDkFpHrShe/tPJ5kOgLk3wkBqmDbQpxLsbyeKw1HbYXoj1Gc2DNJVFvgGOwQWuXia4bBGvpBjixwUna76N+adwfYhFfZW3RdEGhO3dFxqGMGNcr2yaCvMWxWkLsVg3JRQ0n0fQ3RCArsQCduMn1CFj6aIolMrsG0f5O+c80oE6L5u05wgFWa5N7Gjom0S1r2ia7ZWnz3BwPX3YC8rFLKLBIjNn1AL/jNdbnu868PEbpb7tHLCriZlKVjcATzxKkqT8Kf/xFqDHN2M6PwZkL40KnuR6TO86O8fIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH0PR11MB5205.namprd11.prod.outlook.com (2603:10b6:510:3d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Wed, 4 Sep
 2024 02:27:29 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.7918.020; Wed, 4 Sep 2024
 02:27:29 +0000
Date: Wed, 4 Sep 2024 10:27:17 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: "Zheng, Wu" <wu.zheng@intel.com>
CC: "Liu, Aure" <aurelianliu@tencent.com>,
	=?utf-8?B?amFzcGVyd2FuZyjnjovkvbMp?= <jasperwang@tencent.com>,
	=?utf-8?B?a2FpeHV4aWEo5aSP5byA5petKQ==?= <kaixuxia@tencent.com>, "Liu, Frank"
	<frankjpliu@tencent.com>, =?utf-8?B?a2Fzb25nKOWui+aBuuedvyk=?=
	<kasong@tencent.com>, "Chen, Saga" <sagazchen@tencent.com>,
	=?utf-8?B?a2VybmVseGluZyjpgqLkuIfph4wp?= <kernelxing@tencent.com>,
	=?utf-8?B?ZGVzaGVuZ3d1KOWQtOW+t+iDnCk=?= <deshengwu@tencent.com>,
	=?utf-8?B?Zmx5aW5ncGVuZyjlva3mtakp?= <flyingpeng@tencent.com>, "Zeng, Jason"
	<jason.zeng@intel.com>, "Jia, Yingbao" <yingbao.jia@intel.com>, "Jia, Pei P"
	<pei.p.jia@intel.com>, oe-lkp <oe-lkp@lists.linux.dev>, lkp <lkp@intel.com>,
	<feng.tang@intel.com>, <oliver.sang@intel.com>
Subject: Re: =?utf-8?B?5Zue5aSN77yaW0ludGVybmV0XVtv?=
 =?utf-8?Q?pencloudos=3Anext=5D_=5Bhrtimers?= =?utf-8?Q?=5D?=  53f408cad0:
 stress-ng.sockfd.ops_per_sec 13.8% improvement
Message-ID: <ZtfFhdi6up28VVW4@xsang-OptiPlex-9020>
References: <tencent_0072AD566D2F623120E0A213@qq.com>
 <LV3PR11MB850757DC8FEF98852AF804F49D8E2@LV3PR11MB8507.namprd11.prod.outlook.com>
 <ZtfBePyM0Ki/0TzR@xsang-OptiPlex-9020>
Content-Type: multipart/mixed; boundary="mOiCGsqk8wVvmVTE"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZtfBePyM0Ki/0TzR@xsang-OptiPlex-9020>
X-ClientProxiedBy: SG2PR04CA0209.apcprd04.prod.outlook.com
 (2603:1096:4:187::12) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH0PR11MB5205:EE_
X-MS-Office365-Filtering-Correlation-Id: e2ceb552-3922-4207-13b5-08dccc891f56
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?akVWd1FQeFZTenRxczRNM2ZjTkV2aEhxcjh6dy94TXJmVDVyZ0pyWTk4NVhO?=
 =?utf-8?B?dFRaRUNoMDVmUzFKVExhTUtQdy9pLzRsR01GTGpLblV2d1VmajQvWXJpK3d2?=
 =?utf-8?B?TTFkN3VKNWhpSlVBelhSQnZPczNEQlV1V0xaRUNZeDVMckw0OTFsbTBYcnJC?=
 =?utf-8?B?VTkrMnd3Nnp5djZ3NmhQYmVGNW9VM01LV0I4N05IVVBPMFB1Yk1mRHArekhD?=
 =?utf-8?B?eEV3dWQ5TFlDcUoxdnV0aVVuZmhWbTJTcEIySytuYWhad0dtckxKSGZBZHBC?=
 =?utf-8?B?SWwzSENNU3FXaGhCZ0ExTTVTVjZjOEhDKzlnc0ZvM21rZzdUZnYrajl0WVpD?=
 =?utf-8?B?ZHpqT3hQTUdIQ3oyOTVsRUhpbVRGejVmYUZRNldQMjNmSHNZTkQ1Q3h1VlZ3?=
 =?utf-8?B?bHV4V0pPOVF6NjNad2JXREcxUEtPS1NIZEVaRU9KS01EM2ptWUswV1dmQXJ2?=
 =?utf-8?B?aTAvSzJaYnREU1AxNVozTnp6Vkt1anFqUFh3UFo5MW1mM3Zyc2ZVNjNoRVNQ?=
 =?utf-8?B?SXNJZGR3c1BORVFvcDdOTDgwSGZxa1FrWnhRS0lxUk5odnpQaTVYTzd1UVN3?=
 =?utf-8?B?QWUzZkVZVUdVdENiaUZSVGY3d1o3bFgxOEVadC85NGNUSkhveFN3U3ZKUTdi?=
 =?utf-8?B?QnExdHhwNGpkWWIzcFFxSUlHdkJka1BsYWowWVFRUzQ2ZHMvYURQRDhEWmE4?=
 =?utf-8?B?aFlMMGIzUTBwZ0xvSjNqa2NkTUV6MkkrTmNJTFREMXl3UzF3ZEJWbUx5K0N3?=
 =?utf-8?B?QS8xQmt5anRNbFRuWjY2R1ExSW02TjRMWXc4TmlTcTVqMmFiNkswQzh0Ympm?=
 =?utf-8?B?YTVsTDIwLyt5ZUtvdGdZVFNZR3gyZXNTU1ZocUNiMkI1S09tUnBOT3pXWGl6?=
 =?utf-8?B?U2J5Q21vY3lIYW13T0ZVQUpTN1AzcmQ0ZGJrTHZvb0NrNlJuNXJzOVBKRGhk?=
 =?utf-8?B?WHVYQkl5QzUxM202Q0t1cmFnWTI2SlJ0Z0NMbzJZaEVjRjBmNDg3K2F4dC9M?=
 =?utf-8?B?SkdTa0p6Ukk1MktZc0JYMHprVGt3Z1lvTlRFVGlIR0FGL2pSRTFoenhlTmY3?=
 =?utf-8?B?MWJ6bEN4TEMzL1kxSThmSFQ3L0FYMG5wdFBYM1NIaDFqcEFNOFhMeEw2emtD?=
 =?utf-8?B?TlJ6VTBFUmFJalI0MlE5OXhxeWZFVFRYekRndGk4aWJDRHdMWUJTWS9zeWJE?=
 =?utf-8?B?aWFQanZpR1U2Umk4dUhJWU4vOXRMU2R0cyt5akhFT1puNm4wRDBIcTlJckE5?=
 =?utf-8?B?R0JwcFRnblcvNDY1OUtNbHVnSzFCQWRJTmU4MnIvU0toTXpDdGZvT2RXejNY?=
 =?utf-8?B?TXRkYmlhbDg1SkRITlkzemhFZHZGUjMrYWtBRE41TDQ5aDhMRVRwQkd6MjF2?=
 =?utf-8?B?ZGVscDBwV3plaVY5NEtOT1ZQSzh6cWxXSU8rYVVLdDMxejRYTE9ycFc3ajl2?=
 =?utf-8?B?YU41SDRYVnRLM09tYm84LzQ0aENaUlVWR2lQVjg5b3hDdG1RY2ZMTEsrVDRI?=
 =?utf-8?B?WE5td1UySHBoT2FFK1dVd2RzY1Nnbm5aUkt1MlN6NXlLZnNBY0liMjZsZkUv?=
 =?utf-8?B?bmVMd0NXRmxVQ2VyRGozQXFiSnJCMnpyOFdJWW1zZE4yMFQwUVYza3NqakZL?=
 =?utf-8?B?bkl0MHg1Y1BDRHNhK0FRQmJ5aDE4Q2M4YVFWeDh0ZG1OUDRwcHdTbkpsYzF4?=
 =?utf-8?B?OGpqcndhNlE5TjhVeGpvZjVrb2xVT3cwSVowMkNQSmN5Q2hwSWxiL0xCdUlE?=
 =?utf-8?Q?ZxFnQIPjH0bxKBGUg3dbtSZvVHmeJpMEcXJqGHr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WExPR25JdzdURTExUkwzQUdFTjl0YWcrSk54ZWF5b0IzMFFITU56Q2M2ZlRD?=
 =?utf-8?B?ZXhVL3hpckNmSS80WW1HVk84T2thOWVQZ0YzSGVTSkY3SDNoZ3BubFdEOVUz?=
 =?utf-8?B?Y2xLbmp5NFplM0RCUmVZeThjUEY4RG1EL2lrMDBOOUpqVlN5eWQwM2NGRE84?=
 =?utf-8?B?M1VVWnE4ZU0xZVBCZjRXekdLai82NmN0NGllRWZjRndJYVdSeXYzZFFsdmZM?=
 =?utf-8?B?MHIxNngrWTZXbERBc1lJZWt0amR0aUswS3cwa2xRdStLUGRpNHVhRjNVK2RX?=
 =?utf-8?B?V0FhWndkU2x3NHg5Y3UyMjF6MFFtdTUvODQzNlh6eEk2WlNPeWsveVpCMXlq?=
 =?utf-8?B?MThmdnZjNS9LUUgwbE9CRDhnK1Nnbm04SldRY2ZPTlpocVJGa2VkSU92SVRz?=
 =?utf-8?B?Z3hNQ01tQkp3NDN2YURES1JPbzlYYjF0SWZKd0tmdUpieU93NjdoSWwyQzE4?=
 =?utf-8?B?eWU1cS9EbFByT1liRHd1dTRta3JyblVoTXlPK0NtMUxpR3VQVkhFVUFOLzFK?=
 =?utf-8?B?b00va2NWN1c5a3kwaFA3MGZwblE4eFlkUUlRdUhVUEhrcUFLRkRiTm84QVlS?=
 =?utf-8?B?Rk9yWm1KQTZPOXZZeTVJVTVGckFhTzgxRHZPMXJpM2ltc29PaW1nbFZwby8x?=
 =?utf-8?B?Nm1uRGxDd1RrT3ZoRXhzTmdDc2VuempUME5NV3lCK2krR3plL3NmMkxKWm9Q?=
 =?utf-8?B?Rkh3K1hqUk9GOXBveEM4NHJvZFRPTEtBTDZ5MEx4clRpWW1ybVZXWmxtS3FI?=
 =?utf-8?B?czd1ZWd4RkY4V2tiSlcvSmEvTjlvK3JXUTdHRFBEMHZPRU0yOTdJTXEyckp6?=
 =?utf-8?B?RnJ6S1M1QWpMZkNmTldjalN1SG1iM0s5a21PQ0k3NWhHdVBWMUJIK2FIYTBT?=
 =?utf-8?B?WTFvZkxqNGVpZ0tkeHBpVWZPb3dkM3pGRE44K0Rza3VYcUY0M2JIY1hhbnd1?=
 =?utf-8?B?UElaT0JOQ3dSK09yOHY2L2RNNFFhWVZrTjZDa3JJTkt2NzhnMGwwWGJZNjhH?=
 =?utf-8?B?QVZDT0k3dncwYjd1ZTUwUVVWWk9lK3AxZ2wyU3RLWmlNU3JCNTlLN2VUQjFM?=
 =?utf-8?B?VWNoMklBSXFkQUFqUEg1cm9TaUp0Qk1hVjFOc21Kd0FVNjhIUUhGbytneEpv?=
 =?utf-8?B?Y2VjQlEwcSticmJwR3RYNFVZTG55ajBrZ01YQzFES1JyNFpKb1ByMXByblZu?=
 =?utf-8?B?ME9WU3laY1M2L2Voc2kzN0VjblFielJ2T0hxMi9UZi9DL1ZnOGlrY28rUEto?=
 =?utf-8?B?UUtLY3A5dWo3NkhMMGRERGlKWkk4bmNDWlI5ck4rdDhaeW93N0l5bmNYZS9y?=
 =?utf-8?B?dmZuTFZQVWx5Wmc3aWJhWElrTDQwclUzU3EzU2JqRjlDOWJhK0hJTThINm5G?=
 =?utf-8?B?STFuQVg2ZjVVQ0lBSjV3dVkzaDNMaEJES0ZjaS9UbDY4RjFCcHpxU2tjaFlk?=
 =?utf-8?B?T0F2bTBVT2x6UmhET3Z5U1BmSzlTUjFCOFdZaDUzUG4zMDFTWDZkUDU4QThF?=
 =?utf-8?B?R0hSVlpkRit6d3ZvQWllVGpmK0F0T0I4QW9ZcmRqNVhYWG9jRXNPZEd5Rk81?=
 =?utf-8?B?d0U2SWJ0MFM3MjN1UGV6RUlBbXdrM05ISndMeG9QUFNtbllJK0VaMkdEdDdu?=
 =?utf-8?B?b1FESnBmS20zaGhWaytvRTA2bGY1QnZ2Z1Zub1hmUlc2TnE5UkhGQnpIWk9I?=
 =?utf-8?B?TlA3eXUzNXhhM3dKUGM2V0tWNUVLWUt2VVNGM21KOFNEQWRkcGZZRW5nWjFF?=
 =?utf-8?B?MXlKcEoyc1JEdjkva1lMZFZxZ1pXVnRRSHRDYWRGcFdnZ0RLZjJoMzB1KzNQ?=
 =?utf-8?B?endNR2tTN2xka3Mwc3JwN0ZlZ2RneVpZQ3hVYXRteS9yR2o5VVBVNk8rdnZJ?=
 =?utf-8?B?OHlWa0hNL1l3YnAreXlyU0d0OTBwUkVXcEE4emRoUDM1T0xMNkdublRTQW1T?=
 =?utf-8?B?aC9PZTlMODNxa015RGMxazF0RmZSNFZCeGxJK2dISk9nZngzb0lERU1FMW43?=
 =?utf-8?B?SDNOeVQyV0E1b0wweE9GWm1UQ1RDNCszRFJ6ellBaHJsS3F0a2tOU0FRdldr?=
 =?utf-8?B?SkViQ04xak9MZkVpZEZIUldiUDlQZmYvMEJWRGRiY0MxYmJOWVpJd2FqZkcv?=
 =?utf-8?B?aGRSdllDOU9BK09GVERVYmlDQlY5Z3BIaEo3d3kxZjRhN2RaN2JyV1kzWER2?=
 =?utf-8?B?U0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2ceb552-3922-4207-13b5-08dccc891f56
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 02:27:29.1482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sGPqsGuxeLZvtRu9Q1QmlyGQTtmhG5kSPW7RIh0F+1Fz0+OKH6Eg6CQ0OiPenGvZ6/aac2ysDlh4aUvATzN3Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5205
X-OriginatorOrg: intel.com

--mOiCGsqk8wVvmVTE
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

sorry, missed the Feng's patch, attached.

On Wed, Sep 04, 2024 at 10:10:00AM +0800, Oliver Sang wrote:
> hi, all,
> 
> On Wed, Aug 21, 2024 at 11:45:45AM +0800, Zheng, Wu wrote:
> > >Push pending hrtimers away from outgoing CPU earlier，测试过程中，如果没有
> > hotplug，是不是不应该有性能变化
> > 
> > 查看了一下代码，确实应该只有在cpu hotplug的时候，才会运行patch中修改的代码。
> > 
> > 不过，在patch中新增加了对cpu状态CPUHP_AP_HRTIMERS_DYING的一个handle，
> > 
> > 是否这个improving performance的原因。
> > 
> > 另外，和Oliver对过了，这个improving的data应该是多次测试后的结果。
> 
> Wu, you are right!
> for original report, both 53f408cad0 and parent tested 6 times.
> (in fact, for all performance report from 0day, 6 is mininum run times for a
> commit)
> 
> the data for 53f408cad0:
>   "stress-ng.sockfd.ops_per_sec": [
>     806893.21,   <--- one unstable data, but still distinct enough comparing to c94c44685d
>     890668.75,
>     890737.88,
>     890370.42,
>     888873.71,
>     892069.45
>   ],
> 
> the data for parent (c94c44685d):
>   "stress-ng.sockfd.ops_per_sec": [
>     772950.12,
>     774262.88,
>     748388.34,
>     774652.04,
>     776115.25,
>     777131.75
>   ],
> 
> 
> based on your feedback, we checked code alignment further. by attached patch
> from Feng Tang (Cced, our expert about code alignment issues, and is working
> on patch-set for mitigating this kind of issues, Thanks a lot, Feng!)
> 
> and we run tests up to 20 times for both commits, the performance difference
> is just in noise now. so the original report is less meaningful. sorry for
> any confusion caused.
> 
> below some details.
> 
> original 53f408cad0 and its parent looks like below in branch:
> 
> * 53f408cad05b hrtimers: Push pending hrtimers away from outgoing CPU earlier
> * c94c44685d80 scsi: sd: Fix sshdr use in sd_suspend_common()
> * dd3438abfb85 vdpa/mlx5: preserve CVQ vringh index
> 
> we inserted the code alignment patch from Feng before c94c44685d80, then the
> commits in branch became below:
> 
> * f8057ff406bab9 hrtimers: Push pending hrtimers away from outgoing CPU earlier
> * 620c3bf8aa2f2e scsi: sd: Fix sshdr use in sd_suspend_common()
> * 4fe88ea078d804 align kernel/exit.c    <----- attached patch from Feng
> * dd3438abfb85f6 vdpa/mlx5: preserve CVQ vringh index
> 
> then we run same test upon new f8057ff406bab9 and 620c3bf8aa2f2e up to 20 times
> 
> =========================================================================================
> compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
>   gcc-12/performance/x86_64-oc_stream_base_config/100%/debian-12-x86_64-20240206.cgz/lkp-emr-2sp1/sockfd/stress-ng/60s
> 
> commit:
>   620c3bf8aa2f2e ("scsi: sd: Fix sshdr use in sd_suspend_common()")
>   f8057ff406bab9 ("hrtimers: Push pending hrtimers away from outgoing CPU earlier")
> 
> 620c3bf8aa2f2e37 f8057ff406bab9ca3e6c19548fc
> ---------------- ---------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>          20:20           0%          20:20    stress-ng.sockfd.pass
>          %stddev     %change         %stddev
>              \          |                \
>   53177039 ±  3%      -1.5%   52396229 ±  5%  stress-ng.sockfd.ops
>     886042 ±  3%      -1.5%     873038 ±  5%  stress-ng.sockfd.ops_per_sec
> 
> 
> also captured raw data as below FYI.
> 
> although there are random unstable data, generally speaking, there is no obvious
> performance difference between these 2 new commits now.
> 
> for f8057ff406bab9 (saw several not stable data):
>   "stress-ng.sockfd.ops_per_sec": [
>     788846.43,   <---
>     870181.86,
>     800294.02,   <---
>     897801.49,
>     896612.93,
>     894245.37,
>     896740.75,
>     894682.9,
>     814902.28,   <---
>     896683.88,
>     896215.86,
>     895695.55,
>     895589.53,
>     897497.99,
>     895326.19,
>     896870.11,
>     897734.02,
>     739848.46,   <---
>     899569.27,
>     895426.67
>   ],
> 
> for 620c3bf8aa2f2e (there are also unstable data):
>   "stress-ng.sockfd.ops_per_sec": [
>     896915.05,
>     895960.77,
>     896191.9,
>     897573.54,
>     897191.51,
>     898619.02,
>     902343.05,
>     897126.19,
>     887130.05,
>     884084.2,
>     804080.41,   <---
>     896124.17,
>     894256.43,
>     898721.35,
>     894504.22,
>     897396.18,
>     896682.74,
>     894763.47,
>     898041.33,
>     793150.46    <---
>   ],
> 
> 
> > 
> >  
> > 
> > Best Regards
> > 
> > Zheng Wu
> > 
> > From: aurelianliu(刘诗) <aurelianliu@tencent.com>
> > Sent: Tuesday, August 20, 2024 4:24 PM
> > To: Sang, Oliver <oliver.sang@intel.com>; jasperwang(王佳)
> > <jasperwang@tencent.com>; kaixuxia(夏开旭) <kaixuxia@tencent.com>; Liu, Frank
> > <frankjpliu@tencent.com>; kasong(宋恺睿) <kasong@tencent.com>; Chen, Saga
> > <sagazchen@tencent.com>; kernelxing(邢万里) <kernelxing@tencent.com>; deshengwu
> > (吴德胜) <deshengwu@tencent.com>; flyingpeng(彭浩) <flyingpeng@tencent.com>;
> > Zeng, Jason <jason.zeng@intel.com>; Zheng, Wu <wu.zheng@intel.com>; Jia,
> > Yingbao <yingbao.jia@intel.com>; Jia, Pei P <pei.p.jia@intel.com>
> > Cc: oe-lkp <oe-lkp@lists.linux.dev>; lkp <lkp@intel.com>; Sang, Oliver
> > <oliver.sang@intel.com>
> > Subject: 回复：[Internet][opencloudos:next] [hrtimers] 53f408cad0:
> > stress-ng.sockfd.ops_per_sec 13.8% improvement
> > 
> >  
> > 
> > 这里有一个疑问：
> > 
> > Push pending hrtimers away from outgoing CPU earlier，测试过程中，如果没有
> > hotplug，是不是不应该有性能变化
> > 
> >  
> > 
> >  
> > 
> > Sang, Oliver<oliver.sang@intel.com> 在 2024年8月20日周二 16:09 写道：
> > 
> > 
> > 
> > Hello,
> > 
> > kernel test robot noticed a 13.8% improvement of stress-ng.sockfd.ops_per_sec
> > on:
> > 
> > 
> > commit: 53f408cad05bb987af860af22f4151e5a18e6ee8 ("hrtimers: Push pending
> > hrtimers away from outgoing CPU earlier")
> > https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
> > 
> > testcase: stress-ng
> > test machine: 256 threads 4 sockets INTEL(R) XEON(R) PLATINUM 8592+ (Emerald
> > Rapids) with 256G memory
> > parameters:
> > 
> > nr_threads: 100%
> > testtime: 60s
> > test: sockfd
> > cpufreq_governor: performance
> > 
> > 
> > 
> > 
> > 
> > 
> > Details are as below:
> > -------------------------------------------------------------------------------------------------->
> > 
> > 
> > The kernel config and materials to reproduce are available at:
> > https://download.01.org/0day-ci/archive/20240820/
> > 202408201523.11994461-oliver.sang@intel.com
> > 
> > ===============================================================================
> > ==========
> > compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/
> > testtime:
> >   gcc-12/performance/x86_64-oc_stream_base_config/100%/
> > debian-12-x86_64-20240206.cgz/lkp-emr-2sp1/sockfd/stress-ng/60s
> > 
> > commit:
> >   c94c44685d ("scsi: sd: Fix sshdr use in sd_suspend_common()")
> >   53f408cad0 ("hrtimers: Push pending hrtimers away from outgoing CPU earlier")
> > 
> > c94c44685d801334 53f408cad05bb987af860af22f4
> > ---------------- ---------------------------
> >          %stddev     %change         %stddev
> >              \          |                \ 
> >      52019          +192.9%     152364 ±145%  vmstat.system.cs
> >     248.33 ±  7%     -19.9%     198.83 ± 16%  perf-c2c.DRAM.local
> >      11510 ±  2%     +20.0%      13813 ± 13%  perf-c2c.HITM.local
> >      25227           +17.0%      29523 ± 12%  perf-c2c.HITM.total
> >   46241536           +13.8%   52608779 ±  3%  stress-ng.sockfd.ops
> >     770583           +13.8%     876602 ±  3%  stress-ng.sockfd.ops_per_sec
> >     709901 ±  2%    +473.7%    4072397 ±177% 
> > stress-ng.time.voluntary_context_switches
> >    2221056            +4.0%    2309588        proc-vmstat.numa_hit
> >    1824201            +4.8%    1912626        proc-vmstat.numa_local
> >    3416606           +10.0%    3757450        proc-vmstat.pgalloc_normal
> >    2811184           +12.0%    3147390        proc-vmstat.pgfree
> >  1.646e+10            +3.2%  1.699e+10        perf-stat.i.branch-instructions
> >   41247621 ±  2%      +7.5%   44359189 ±  2%  perf-stat.i.cache-misses
> >   89628939           +11.4%   99819592 ±  2%  perf-stat.i.cache-references
> >      54186          +182.9%     153293 ±141%  perf-stat.i.context-switches
> >      10.31            -3.2%       9.98        perf-stat.i.cpi
> >       3124           +19.5%       3733 ± 12%  perf-stat.i.cpu-migrations
> >      18733            -7.2%      17380 ±  2% 
> > perf-stat.i.cycles-between-cache-misses
> >  7.027e+10            +3.9%  7.304e+10        perf-stat.i.instructions
> >       0.12            +3.0%       0.12        perf-stat.i.ipc
> >      10.43            -2.9%      10.13        perf-stat.overall.cpi
> >      17676 ±  2%      -5.7%      16664 ±  2% 
> > perf-stat.overall.cycles-between-cache-misses
> >       0.10            +3.0%       0.10        perf-stat.overall.ipc
> >  1.606e+10            +2.4%  1.645e+10        perf-stat.ps.branch-instructions
> >  4.528e+11 ±223%    +422.8%  2.367e+12 ± 82%  perf-stat.ps.branch-misses
> >   40486476 ±  2%      +6.2%   42992791 ±  2%  perf-stat.ps.cache-misses
> >   87229061           +10.7%   96531559 ±  2%  perf-stat.ps.cache-references
> >      52859          +194.7%     155786 ±145%  perf-stat.ps.context-switches
> >       3038           +16.6%       3543 ±  8%  perf-stat.ps.cpu-migrations
> >   6.86e+10            +3.1%   7.07e+10        perf-stat.ps.instructions
> >  4.235e+12            +2.5%   4.34e+12        perf-stat.total.instructions
> >       0.16 ±  3%      -0.1        0.09 ±  8% 
> > perf-profile.children.cycles-pp.free_uid
> >       0.22            -0.1        0.15 ±  9% 
> > perf-profile.children.cycles-pp.__scm_destroy
> >       0.15            -0.1        0.09 ±  8% 
> > perf-profile.children.cycles-pp.refcount_dec_not_one
> >       0.14 ±  3%      -0.0        0.10 ±  9% 
> > perf-profile.children.cycles-pp.scm_detach_fds
> >       0.16 ±  3%      -0.0        0.12 ±  9% 
> > perf-profile.children.cycles-pp.__scm_recv_common
> >       0.08            -0.0        0.05 ± 44% 
> > perf-profile.children.cycles-pp.scm_fp_dup
> >       0.14 ±  2%      -0.0        0.13 ±  2% 
> > perf-profile.children.cycles-pp.__scm_send
> >       0.11 ±  3%      +3.6        3.74 ±215% 
> > perf-profile.children.cycles-pp.do_dentry_open
> >       0.11 ±  3%      +3.6        3.74 ±215% 
> > perf-profile.children.cycles-pp.vfs_open
> >       0.06            +3.7        3.72 ±219% 
> > perf-profile.children.cycles-pp.____fput
> >       0.06            +3.7        3.72 ±219% 
> > perf-profile.children.cycles-pp.__fput
> >       0.08            +3.7        3.75 ±217% 
> > perf-profile.children.cycles-pp.syscall
> >       0.08            +3.7        3.75 ±217% 
> > perf-profile.children.cycles-pp.task_work_run
> >       0.18 ±  2%      +7.2        7.41 ±217% 
> > perf-profile.children.cycles-pp.do_open
> >       0.00            +7.3        7.28 ±222% 
> > perf-profile.children.cycles-pp.lockref_put_or_lock
> >       0.00            +7.3        7.29 ±221% 
> > perf-profile.children.cycles-pp.dput
> >       0.31           +10.8       11.13 ±216% 
> > perf-profile.children.cycles-pp.do_filp_open
> >       0.30           +10.8       11.13 ±216% 
> > perf-profile.children.cycles-pp.path_openat
> >       0.35           +10.8       11.18 ±216% 
> > perf-profile.children.cycles-pp.do_sys_openat2
> >       0.36           +10.8       11.19 ±215% 
> > perf-profile.children.cycles-pp.__x64_sys_openat
> >       0.39           +10.8       11.22 ±215% 
> > perf-profile.children.cycles-pp.open64
> >       0.15            -0.1        0.08 ±  8% 
> > perf-profile.self.cycles-pp.refcount_dec_not_one
> >       0.07            -0.0        0.05       
> > perf-profile.self.cycles-pp.__scm_send
> >      96.72            +0.1       96.81       
> > perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
> > 
> > 
> > 
> > 
> > Disclaimer:
> > Results have been estimated based on internal Intel analysis and are provided
> > for informational purposes only. Any difference in system hardware or software
> > design or configuration may affect actual performance.
> > 
> > 
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> > 
> > SECURITY NOTE: file ~/.netrc must not be accessible by others

--mOiCGsqk8wVvmVTE
Content-Type: text/x-diff; charset="us-ascii"
Content-Disposition: attachment; filename="align-exit.c.patch"

commit afc83980ee5b64b79f50225cb395843ecceed88b
Author: Feng Tang <feng.tang@intel.com>
Date:   Wed Aug 28 20:36:19 2024 +0800

    align kernel/exit.c
    
    Signed-off-by: Feng Tang <feng.tang@intel.com>

diff --git a/kernel/exit.c b/kernel/exit.c
index edb50b4c9972..8164f9f5b3e1 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -1925,3 +1925,16 @@ __weak __function_aligned void abort(void)
 	panic("Oops failed to kill thread");
 }
 EXPORT_SYMBOL(abort);
+
+struct pcpu_isolation {
+	unsigned long data;
+} ____cacheline_aligned_in_smp;
+
+#define DEFINE_ALIGN_ISOLATIONS(name) \
+	void name ## _text_align(void); \
+	void __attribute__((aligned(4096))) name ## _text_align(void) {} \
+	long name ## _data_align __attribute__((aligned(4096))) = 1; \
+	long name ## _bss_align __attribute__((aligned(4096))); \
+	DEFINE_PER_CPU(struct pcpu_isolation, name ## _pcp_align);
+
+DEFINE_ALIGN_ISOLATIONS(kexit);

--mOiCGsqk8wVvmVTE--
