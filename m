Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BEC58ABF
	for <oe-lkp@lists.linux.dev>; Tue, 13 Aug 2024 07:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723534348; cv=fail; b=A+M2NnIzyLVkP2PydczV96Aa1moKJ5WgiLyIjzLI1WODbM5dgBQnR+pfPJySd+n7csPGz24joqIi/ZQoQH3viDVwDqijNds3EcFq7Fs91cNB4kUxNrkeGAKYUckhElk4TorWOLrOoW0Z+wQwZJTEOFPoIZW2v0olUU0T3I79nKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723534348; c=relaxed/simple;
	bh=Bm79zl73gWrfTgiIJCKZ0RTMAVXauNKyx7SrxoxezlE=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hcek/xewSrb7OyN58HXrffwmvFd8Z79a/blE7orEhiRrSoFEn0rcRAuHQNVJWLRQynqp75TfFOZlL+oz5MBBNh0QL2jPe7HSdB9Obm54ZCsmSbpxqJBTK6I2sT/AoPry0EfGiwFYozXJg+kzGV3pammvZaE24kENFqdxHgvxUUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YJI9/8rE; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YJI9/8rE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723534347; x=1755070347;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Bm79zl73gWrfTgiIJCKZ0RTMAVXauNKyx7SrxoxezlE=;
  b=YJI9/8rEMVt67PUZr24rP1XGTPEFwMqjL+mBKDImVoFvZXZs5OviKYRt
   NsRgKkvNYCP5x8mGZsBwghX+C6w+lAPY8a7FTNdjo6thoA73zFrMgkOd9
   Gby5FLlAakR9P9R+hUYdRIqUgBUdbVaOvwFiihclNLZRFsQYzzWHyHfNd
   2ze1lDucdxFyby+j/W/BIlQbFiCoLwTaogmLKSeRNol3NCWjQF6aWnmQq
   D5CUz674VDV6VsrDuMXFR1oIL6e5nKEH8u6yWa00ch9G/HOJwxYYwRbAe
   d9cX60GjaO1ZFX7XT62jMKKqLKYIS26LmV+I+FcQV7OQ7xVs557VhayaK
   A==;
X-CSE-ConnectionGUID: +jItnuEpSiSp5V81L4+Mvw==
X-CSE-MsgGUID: eiIZ4/T+SPW9wQt4elSbsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21837754"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="21837754"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 00:32:25 -0700
X-CSE-ConnectionGUID: gktUJz9WRiWJssJR8stwug==
X-CSE-MsgGUID: BJaeo3/YRaypWS+nFFuyCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="89238206"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Aug 2024 00:32:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 13 Aug 2024 00:32:21 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 13 Aug 2024 00:32:21 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 13 Aug 2024 00:31:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nfe3EfLlrm1qpas/yZJ90zBm85gvEw9w7E4EUh+yR9Moo33EvDQrOT5aRUobpK25YSsd773qMDy0jFuFFCTKmNY0YzRIGcAq0QkE2FV23sxz6/daKkiCWjUkyHEFJG6uG3OxaNkZYthoMbDKQgWNlMb1kwEXAQcmOhV9YGaF1IUfSU4um6WK5x3qEGKjPXqd+5ag7Elff7Whi/mwXH3t+fF4yZS/5WdBrMz8Y+0aVcv3IfAqtBlno2utWRKFc0tdGGIAzhmHmhKhcDuplEpw2T14Sl5v9b41WDloOeGpz6dCt0ioaLF7AyUYS0byu+5V2OPrAvvildAAL98ERYl9SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WBejm1/prXoU5q1pr6Yh6Gw2uYH6AL14uJdqnu4SrfA=;
 b=IfcmXXYwgHL9la1mncJqWv7cIgq5EixzX4k24KURkyM+U/1eE/2I30taU4XYC4L6BE3S3iOzMgDXIpOQUs95GfzjLR29wHHUxJKQ9cyfHUqyCacVSyU57fYFUn8tdAZOavo4prXwYbAmlNtlnIjRjG03d2xIkjAYRc59KZjZVfdnWHlaqUtWCSC/ID4itRJbPzLU0O/4FtVfbpUf5rCdZvxQS/xdSFoc4SFrBUqoPJ+XTwziPvaV9EAeCUUMiRduISs6JMkEuanc4NRAv36c2l4HcRX3s0PacY1SUn5PmHfyurn9Fv3+MncIOjcjJUMnOloeGGDjx+cNjO9SMNR3rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SJ0PR11MB5790.namprd11.prod.outlook.com (2603:10b6:a03:422::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.31; Tue, 13 Aug
 2024 07:31:40 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.7828.023; Tue, 13 Aug 2024
 07:31:40 +0000
Date: Tue, 13 Aug 2024 15:31:32 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Mateusz Guzik <mjguzik@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: Re: are complete benchmark results available somewhere?
Message-ID: <ZrsL1LqUHjPT0ZkE@xsang-OptiPlex-9020>
References: <ahhsblwfjo6he4xnxdztjcscvuc7zhevbx4nnxneyh7qstietr@oei4nio6223d>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ahhsblwfjo6he4xnxdztjcscvuc7zhevbx4nnxneyh7qstietr@oei4nio6223d>
X-ClientProxiedBy: SI2PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:4:195::19) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SJ0PR11MB5790:EE_
X-MS-Office365-Filtering-Correlation-Id: f912e6b9-b8b7-49fe-5067-08dcbb69f8e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0mwVYJwLX3uUCm1W1/u+uJGYMP17457EpC8YP3Ksesd8sYkyF0rcXEdExmDU?=
 =?us-ascii?Q?p6g7gXnnM21VIwNsPsWldDToW9fJzCB7YXymuFhSozgZnv04a3nmjtP27aUr?=
 =?us-ascii?Q?1175MzsUP3SVGi3uDhvH1Orx1cgcMsRicsoNHvtrV6ZfXBcwTQKoCQq6CHPF?=
 =?us-ascii?Q?R+Zl5nc6qMELivSgdxVfsn5970w68xKvGVT5j950WMtDXEkepHgf8c5XYa46?=
 =?us-ascii?Q?nmrlof6cfabbS0t0Eghw3GjGoHvbW6te3cvU0d7L/jQJGIbtjHbjZZetsnsS?=
 =?us-ascii?Q?VdNYBPkU7kNqBYU/TJipSFAZllIMqkgREdhbbldzO943nw6HfdiJX1Dj+HRf?=
 =?us-ascii?Q?Ut05B6CuncvpURO8eEbOvnUN3rsqBBoFHlwelBqfEXF59nQJJHcZZov/IMsC?=
 =?us-ascii?Q?sC61gIGOcwXabN88pU4SFLUAX/xe3C/C2ctYOEbH4RhDYb1nrpSgJAIf7M8Y?=
 =?us-ascii?Q?Vz1691jsrw8Jj2Yj6LvDFLx6VZF7c/1nWkpUGBDLtmGaTdf5HVIPr5IbPz7M?=
 =?us-ascii?Q?JeQYaftXeV6MU3+gWmDxBXpbxMc4XsjG2dPj3XEteA11VIXLqOO9uvORQLD7?=
 =?us-ascii?Q?7FPTAHq07Q8oiszsLOvN9Enp8tnXTf2mO/8KhLNb0OIESk/bLlJIpa2hm4AO?=
 =?us-ascii?Q?UwjeKsshBndboogkq2iI0jolbinCdUIqDWxSKhbKmoed+arGHBau0vAbbX+G?=
 =?us-ascii?Q?DRozRPwKsDps7XolEcM445IzZ50fbDsLaB5CCeLPIdvPH5ENpD4DH/Pst18K?=
 =?us-ascii?Q?uUQY5uZAMvSciElorEw0s4MHI4fNvF9LlVJfX0bNeXi8OYaeCMsLsDmWCyCM?=
 =?us-ascii?Q?SCkKHS484P8uTsLZs1g4RpGuzcpTbflA7RWM3br0csM3dhiehht8jcTmSJ/x?=
 =?us-ascii?Q?5pQ0M2SqQfwX7m1IwqvCE+Ws83s+ga6R1Ztvup+VvH8qFojelUdqq3RSZBk9?=
 =?us-ascii?Q?TXU2SHiDMBu6H42L4vyIeFpD4Ass7X9BQOtDYKyiPsPk7nO3lsly20HuiYs2?=
 =?us-ascii?Q?Y67RjSb2PkkVUFUFGp1eoMKnhD9Uvu+6YFSI2tlV6LX3eS088LS+rm4rYlm9?=
 =?us-ascii?Q?R5eqW0E/nt+gw0fiYZvNiCDfETdot3vqCUR1fZuxhl+hMneGtZ+HKvkJc3L2?=
 =?us-ascii?Q?+GvEsg1trRgDW0IRWBbHZ/g0gigO51A6gxJknpGU5p1HZ/tVi++oCC9mrcpu?=
 =?us-ascii?Q?caSX05UwoSMzUw8Y6vMpLTzghRn41B4q5s3XYugbIsNW2LQQE2z/MZGDi1kX?=
 =?us-ascii?Q?Opn3WDzgddB/MIMXTkaw85KSei/NHDR8t7LY30w5m4ZXVKFAd91A6hGO6jJ6?=
 =?us-ascii?Q?CnM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dRUlUbKDQ3MKM26hcCv0/E6Z6V0nSYg3GXO9JMU65aJU8b+LWEec58x/AP/3?=
 =?us-ascii?Q?52SuWIDDeDqd/angphY0e8WAttbggbRHDdMfDedw0ltqCeSQVV5Z5655kZSM?=
 =?us-ascii?Q?e0kjPYwIZEfVgp/Zt1L6yOuoOZoiEbK5o5NH3Ja6RqkEvJYKfuZYa+DVy4VM?=
 =?us-ascii?Q?rtBBlsKkk7FdBNaD1Tmd9I9SZ/wsFX9xetrG3O7TAzy01X6GBqb6zY4V/CGw?=
 =?us-ascii?Q?ynYeYg/3T/j8euDGmKYGoKrQ+kk9ZA80sJP4a4wjtuKZo8bSSjyUGlNiUpXE?=
 =?us-ascii?Q?+rurck9kew7Iy4C1HjMEdAgVHntAqS+lBhd0bYIA7Ii4s2kAAUDNhI9fP/t2?=
 =?us-ascii?Q?jUoToiyFvts8z+dZaM3fjhBHsgzbenMvSDNq/sYORKvQoSOJNUFKEfl9lDaY?=
 =?us-ascii?Q?gZfqONfXqcWM2Ol56LT50lcVNfuYjnS1jpuLRJPezEzsDC722tObUtJPjaMU?=
 =?us-ascii?Q?JvczCKnqXhfuQ1cIAyl45QHPv9q/L8oDvC44OkmrXnpnGJm8ikfaKnEwtrRv?=
 =?us-ascii?Q?P9qp6PbG7ZR/C1wH+sVb/Oux7+5SWQ3Jr5hiB16PDfXf/S3aOPKSAPRDLmoL?=
 =?us-ascii?Q?+Ti+tC9ujzVeFkoaPA/bAIkwjwP7kdh5T1LoVoi0mPh7HiahSsOiVimBVlOz?=
 =?us-ascii?Q?/nCn+z9i0oC8m7g3RwYSNj1hjP0ozwne5CsH3iNBJphLpNaqIh4sdfmXyIy8?=
 =?us-ascii?Q?2nje9NontAET5SFMqbgVvceDuIRGiml2wjZO05mXhxC1f9VpPUt2IKuSy2Jb?=
 =?us-ascii?Q?3hU5DSUjeGl2r2tJgg9ZBRtrcQKup9bokU0v8gLqYvHMjdRUWVRNN9Ry3/au?=
 =?us-ascii?Q?6WyoFnjOiPu37RLF05YyqLRFlYMBcMkv0FokT3I17Cjf/D+4Zz7AuZl7LjC0?=
 =?us-ascii?Q?Ufl2rpJQr+DPP3LECIlWz44fk444/Az6zk8wLjyNEzkY93zpoRX0vvSqPDwl?=
 =?us-ascii?Q?j0DXaq0Nx5GXpuy/1faq/Kf73xKeAL9JJPaXzRmQBDeLLk7RYA4n5Y9FG22Q?=
 =?us-ascii?Q?l4cMoUnwTjBsF4Coh304q75xTajEzkaZ+mFEXFNvzabbAb0ka/7B85hWKK+P?=
 =?us-ascii?Q?34pWrOZZ491XG+jISaXgDx22JZA0geDC/IXEDw0FzcjvHgNEByBT66ITzPsG?=
 =?us-ascii?Q?5wyO1Y/qRGXnht16zziexjmpmO8SSgpx23xUMZO2cmFmeA347W2ayVVWNTCx?=
 =?us-ascii?Q?8UkxiKZUdeDuyU4FNTvcoXzP1uur4kRfL2tmL89Q1T24cdw2SUcik4LLAwu7?=
 =?us-ascii?Q?ajbEctGnG/ioEiy40DQoi5KuVdPB6LvYWtlcJT0g8VRc4BuixEyYIpSW44wY?=
 =?us-ascii?Q?QpA8+tV71DJMVziF63O+6DEv7zU/QkuCwym6ubYqYDh73VHloFWFb8dz2LwU?=
 =?us-ascii?Q?hnlrjm9W5pk8c1LyXzwlWy4jrnY5kxjsCFV6q6NmHhlWUnI1NNFBAcT04tAW?=
 =?us-ascii?Q?LnN6cdoA/ODLAwxMIOIoCnL+HYQQ+k9LPyHDv3AoBQrITngTI+xktJFRHSdx?=
 =?us-ascii?Q?hKqHk19cL9tvI5qQxIzFkF3bTCSDKVDLEpopz2KTKrR8czPp1rtnMi1oMFo2?=
 =?us-ascii?Q?sZNhAMV6dgIK/4upZEc86nJmMuML5SQYVBOb/t2o4RfSofzF8zd3so9nDS0O?=
 =?us-ascii?Q?Rg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f912e6b9-b8b7-49fe-5067-08dcbb69f8e9
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 07:31:40.2747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N2b1Uy7/SeYcem3NaBNy4roN7D9fpmnJvzo07+1EYXjYsSETPm4eYDcHKugcIqQFcRovJYkWJwYdmawqzz1hSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5790
X-OriginatorOrg: intel.com

hi, Mateusz Guzik,

On Mon, Aug 12, 2024 at 12:45:04PM +0200, Mateusz Guzik wrote:
> I only found results for performance changes, nothing abut the current
> state of things for any particular kernel and/or machine.

do you mean for [1]?

do you mean lastest mainline data for this test when you mentioned "current
state of things"?

when we finished the bisect for this regression, we also tested head of
mainline at that time, confirmed regression still exists.

# extra tests on head commit of linus/master
# bad: [2c9b3512402ed192d1f43f4531fb5da947e72bd0] Merge tag 'for-linus' of git://git.kernel.org/pub/scm/virt/kvm/kvm


> 
> If this info is not pubicly available as is, can you do me a favor and a
> one off send me a set of results + profiles for the biggest machine you
> test on?

what do you mean 'biggest machine'? the Ice Lake machine we used for origial
report is a reletively powerful machine in our test machine pool.

due to resource constraint, we cannot run all tests on all machines, just allot
different tests to different machines. sorry that it's hard for us to allocate
lots of resources for one test upon one commit.

BTW, if your request is really for [1], Fengwei has already tested your patch
and replied you, is that well enough?

> 
> thanks

[1]
"[linus:master] [mm]  c0bff412e6:  stress-ng.clone.ops_per_sec -2.9% regression"
https://lore.kernel.org/all/202407301049.5051dc19-oliver.sang@intel.com/
