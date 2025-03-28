Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E8D79CF
	for <oe-lkp@lists.linux.dev>; Fri, 28 Mar 2025 06:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743141974; cv=fail; b=Lc3CC/4OwqKK8huA1hAEEL+ODdLxN5HoSfIGuiLA9E0J15tYkk9hwItXCauVAkIhS+Pfhv5rjV+oEtjiXu9H1WVIuxDjty/MbfO9H49BNl66GwDzBXCYS3+zqYvTpCRE3WtytnWhXUVpyLMERuGGUHmmeadfASd219OczEAcZ4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743141974; c=relaxed/simple;
	bh=aLxBbVlqSPMtNdwbRUZCA0PQ16RTkLEmHS9sEJMaZCI=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pwIC6DJnrCB0YPAns4RGdQoLQqHZMudeibv9wgjzC+HWfgdvmRWG0T2mSHdsfG7QQJfjOxo7se7ggqOwZx5JKbLAaKPwqHaKvLB30IXIDScmE/LAEbID/43j2u3OC1K8lgBEyfiyBg1bDBSxXhLUdqrMJsJN7L3n4FQmGmS/Pjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kF6L2lNX; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kF6L2lNX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743141973; x=1774677973;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=aLxBbVlqSPMtNdwbRUZCA0PQ16RTkLEmHS9sEJMaZCI=;
  b=kF6L2lNXs8ibSvloIcAKaHfzoW7xjIlUd0tuVRjsY2+gA8InkB5MDNQb
   TzSQQ+eyVuJQjY9s4n+8PqWAc8MHjFPh9kQRPe4I2NxkMrMEhIj3FthoB
   RJhAd2gq46lqcuN5ClkwPvbOPnJvX87futN1/vRuQCA7pbvlUoPkWkfpi
   N0NxuAvLv2aLQH//f76Icr3p54AaMXq2gVCgGog8aTGNe5N4JJrgocE1i
   Q3IP5KZ327Kh29gqSK+B0mIjI4cgbSSeqnptF3GAUTN+jdlj3T3NBA14H
   aYxIz3QL+8WGGRoseMcItRzp+41xqfMD07KtrrcnTYKVL/pF/nGWTD19q
   w==;
X-CSE-ConnectionGUID: xPfoRxYbReKprzLpgG368Q==
X-CSE-MsgGUID: zqGbGT2dRlmex0/DmKV+Ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="48278693"
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; 
   d="scan'208";a="48278693"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 23:06:12 -0700
X-CSE-ConnectionGUID: GwbykoKbTq+iKyMQ32Fjhw==
X-CSE-MsgGUID: 9WdhazaYSTuupp8zUS5wMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; 
   d="scan'208";a="125157848"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Mar 2025 23:06:12 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 27 Mar 2025 23:06:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 27 Mar 2025 23:06:10 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Mar 2025 23:06:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MbFC2pZEinCFFLzWVRDU3zEZ6as8/9r44BvndXn1jP3w1YXswmeVGH3K3j4o+SLEtxONdCOvXXd4pdq12i8jEuxUOzC5F2Aw9SvQczsMH+RhlhDf3xAA9OUoUzBcZKI6STL5jacejx/fDqRqi8TvPE1rvUPGAwBoR6pvb6nFmVCblCNvWJPbVf2En1ztBrgBmfo//hI31cWDfBzZWYJ2o1afqm+Va4fJTkfmay99/JIKBq1l1F8R90qUORCFtN2mnWz0ulgCqND40OFJ14TgwEXYL2b1KNb+38zEginbYmU57woW5fG0lAchJqI+gEBqUAH26hvwCly+Myt0s9gVnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tRjCZSSbFy+l5Zv2tYwq8eHKdsUp8AsmSZhpsAUFh8c=;
 b=fFrkZyl19RpDiRT1V3/2WpjIQvglFha0gPWgleACmCPnYo98BcW2tCBWRmv48oEpaSCG6oPJcs1omNXJ2ioIxZoEX9UL1ougaRAgvlkXkv09jjvDM6wo2f/kvM6A9zRu9kKN0bDQe9HKWUChR3UghYICWWM1+SgEuCkT8ugPZp97/1MMlEei6/B1gIuUn0QLGei3CI9CeXJXpZtsGagHiJ3MWg+aAB+tYshndkDp4LNLy9A/LtnF0Mm9Dbj/W7qUhcpLR+vdAdpdmw1V/uuL3XnZPaCTuSdTbnPVQJyLW4sxFgy1pBz1uli6zQJhHDP3HJU59j+LpBHNg4LGDLnEug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CYYPR11MB8308.namprd11.prod.outlook.com (2603:10b6:930:b9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 06:06:07 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 06:06:07 +0000
Date: Fri, 28 Mar 2025 14:05:59 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: Re: [linux-next:master] [landlock]  9d65581539:
 WARNING:suspicious_RCU_usage
Message-ID: <Z+Y8R5AEXabED4FD@xsang-OptiPlex-9020>
References: <202503261510.f9652c11-lkp@intel.com>
 <20250327.ahthiSoh4Nec@digikod.net>
 <Z+YQ1Un2QgAYvmos@xsang-OptiPlex-9020>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z+YQ1Un2QgAYvmos@xsang-OptiPlex-9020>
X-ClientProxiedBy: SI2PR01CA0013.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::9) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CYYPR11MB8308:EE_
X-MS-Office365-Filtering-Correlation-Id: e0e867ae-6bf2-45d1-babb-08dd6dbea11b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Cryxv4RVFG/2iCHUPpuY4IK/loAltweBAFzILX3CO7j2HYPiRnC73s13OT?=
 =?iso-8859-1?Q?Xx/KhOcyUDg9sq1dgnYhfdTxSKLiA0UPcaiR9xrQdgSIkBxDXcnB22aV0c?=
 =?iso-8859-1?Q?1Wa05MELr8Kd8baeyOLW/vQScJphvxfuc88RA54Gp0iYFMQO9K5vYASzJ0?=
 =?iso-8859-1?Q?ESsJnj2hDG2D2tHS7N0x90uZRpWUUItjncCGKdkQyJahy/3JPUNBf2/VH3?=
 =?iso-8859-1?Q?W694kgEaUlHYAG/ZFOFzNSTsMAeWNQJwKthdBhrgprhpl07a78op6FA063?=
 =?iso-8859-1?Q?t+yhOalXXJgdSWxPH3nQBmLIL+4cYrGPdBp0F6snWI6r+10MQgx/dcJwPk?=
 =?iso-8859-1?Q?boPuBTnd4jm1x6q3AkJvyQzD/23dm3T2H6wkPha4f9XXYkkjh1aJUl6fb0?=
 =?iso-8859-1?Q?XVBEC8VYPr6d/+u8vQlHERbM7IzR1rq0W2i4z2JV9M/T1CxLFz+x0Vngnr?=
 =?iso-8859-1?Q?URYfLrKYIm9jhJ1ToJR7GP1LJA0FEBpDt+nACyigqqo7CMkmkyfDGUOU+V?=
 =?iso-8859-1?Q?NAanmmY772RdJ71bizAnFLMw8+SAKMTnmLCqnQu+cHk0kSpygqIYPEZShi?=
 =?iso-8859-1?Q?BQP4cMs1LXmgxVuCGeuEoM38ikBL9mGRHkf6qDfTc+2KMe4g5dFDTG1PKu?=
 =?iso-8859-1?Q?giLZxiz7JI3hlKr29Wr/TeD6VykS5Y0WyRHATpPEhi86o5XYg+/90mcH3k?=
 =?iso-8859-1?Q?QJbAzd4xT8UpQsVaivjOr3DxqIzZP58xgjOL8sq0stWwlTFv/Ad1du0a9A?=
 =?iso-8859-1?Q?k0gL9ynrU+zolFwHHFZgXLbUXhOhF0L1HpRIq4eWG+Zv3zkRX33k7rdMU9?=
 =?iso-8859-1?Q?Uz4dcJC1l7JdxcfNjZRV1x3kc5O7mZsBuGyWZInggBTpzTmqcjaY8tlj5I?=
 =?iso-8859-1?Q?6x/vIdn9fgjaJOqgwiuUnFdG5c8T1JP4AYJomwTka6HwgBm10hvk/9U9dm?=
 =?iso-8859-1?Q?4MYeGnlcNykGxDlbWMILsNB8HqkD2I6QXzl+VbuLlhsLr8ymkeW6Qq08Zl?=
 =?iso-8859-1?Q?arsMdIo3vvAl5+mm8t3SHc83sNr9U1o2Y5/xdd5ZoODWnqmCKEQvSTGILA?=
 =?iso-8859-1?Q?T5foLMMdHB3WulFUDLxpmzybEzJCErFalVj/T2dr/ABCr/ApSH41mWnfyA?=
 =?iso-8859-1?Q?clfd4w3ZiP762ZFbLyzfo9ndiognlvFsPG5oL7plsIAFDYv2B+cVpyZ5+L?=
 =?iso-8859-1?Q?dy/W5qc0hlTuOuTpKpq+G7FehGncJsbbfWOhfQ4x81oQYfWDluMf0k0jHa?=
 =?iso-8859-1?Q?+cCNwm7vljFymE+zRmPw1L2YG6HshfEWI819876JksIxb+twJIccr1YIzm?=
 =?iso-8859-1?Q?1IYwK+MS4yz+wFXwTf8VG30eK9yKdcQ2XeUY533YpWbUXPVR7OJeYZXcOu?=
 =?iso-8859-1?Q?GwuMhbP7kQtNQ2ENYnNnAc1w6C37RNXQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?f8YYk2Af6rYarLplCcwlbE2xZmzCysG6AY7MxCT7n52tYz/pkL5+4X6PDY?=
 =?iso-8859-1?Q?maOv1tcm/P1j+FD7gapTMg0jJaXGsROHNmA78A6z7uyuupymp23s2mYHl1?=
 =?iso-8859-1?Q?IK2HQcPky6/+A9ieqwZnXVScddel9TmvvGfLL1AGQ9X+ud2to7NSk8NkO9?=
 =?iso-8859-1?Q?pAm0fHm25V+aBq3IIw4QqHxAWSE56TESEW2hrIdQDrV/glukQubuAJVeTq?=
 =?iso-8859-1?Q?CrZbe3p5xuQo1MZ3GDalCzVzfQ+j562uyhNsPxL/1vllNkt9poiDxfBsN0?=
 =?iso-8859-1?Q?7KVi09JEUNEp6Y9Rx+BillDKBeOOjfiQ4a/sAcpV0sliOXmakPN20Q7VyW?=
 =?iso-8859-1?Q?1yXT1oATEkGnCRYhfgGAOH7QNUr5lSQyWFtAouBTd7M5rXaj0pkOztW8WR?=
 =?iso-8859-1?Q?N+ut+s1BQiKBVBXbkDv6xGjFRoMRGTnGW9bcmSIWyMnjyA9sX23Jl/GOGO?=
 =?iso-8859-1?Q?aRmiHTJnDp/M4rdteyty4q3tapKHrgGSJkp3gofcRBdBQruH+u+ec2MT44?=
 =?iso-8859-1?Q?QJeK24rSvyTIeN6/ZLhcHMUcRQ7h69CH8ss5UVvKR/1nItfIkfjm7TdeCK?=
 =?iso-8859-1?Q?eW02+KAfYbM5NgXGnvq9nKb4R9EyLBBIRQmSr9XRssgMWizfVEOTN2J5fu?=
 =?iso-8859-1?Q?ubiZIUiR2+n+l2YfDI3oBmlc8JVn4zqIUrAaR0u/hv+whXYWHUlR3eO4js?=
 =?iso-8859-1?Q?1WZAWDHc4owuQjuN9237X/DB379EuyKDst8w91droQOFRajGkZgkRSCssO?=
 =?iso-8859-1?Q?zsH3paTLHOE+qVVirMGz0LPKqtQUbthzu3G4oAA/ft2a+RPAfpnLIOQKT5?=
 =?iso-8859-1?Q?CJJJ9PD8APwK4oALFYldj8leZZVKUiikTrzI4S7CwAUhfBeB/+T4kHgxDG?=
 =?iso-8859-1?Q?yV4nz/VKWLvuiIvj3PcrJX+cPxPzDtGNiAxmOiWEUyOXHZZxWB9sOGk+dy?=
 =?iso-8859-1?Q?8mCbEtQfWYniYf2cGvAzRSBXWJTcQmID+OoYTO+IGCKZFLwn9C9NNf1n5S?=
 =?iso-8859-1?Q?qzNii7AFWus6t6YoKmuLOlfn/XuKOwvGKJbco1X9/bmkxLx0bBUOu7jw8U?=
 =?iso-8859-1?Q?vRFsP3JKRPD+kweVg5VFjZNroEsbe55dGv6r0MpbIU6Vs4LEyAuvHhqMf9?=
 =?iso-8859-1?Q?4FKxoxFPsqWCbncv/aeHgtm1khem1uNhXztJEYmGc4/0pe7DbVHb5FXypi?=
 =?iso-8859-1?Q?lsGocPlcx8zQBQCoLOML6AnexJ1CeNNJKq+3WqPAYJ0SXGI9aqFB23yx9O?=
 =?iso-8859-1?Q?F3vBPlaZIArFYNwajtqsqjtaX/yyd0vvkZ9IDQ/9qlVHLggR4HIIg/yPmZ?=
 =?iso-8859-1?Q?bPo9i8N/h0zmEWwN4whifvZ/o9Pd1yzNansSaoAy65MyVlHJiuriOLQenB?=
 =?iso-8859-1?Q?oCeXRe7UccFFlNGkF+SAHs1ijbw+Z1OR+iOGUlVBCssUZNQUQjyjiG5ths?=
 =?iso-8859-1?Q?KmBcCDtP/kFXo+2e0oOZ6UPa1t9kXQNx9/T+3R88jGwq6pGu92Dno1D/z8?=
 =?iso-8859-1?Q?TuY8V+1BWcZKcV4pMHY1HBWFvZKAZU8Xv77vaj3jCQCRXhYh34aVTuFjRI?=
 =?iso-8859-1?Q?P2abb6bkBmEBOQBYbY5/FSzGc1CPuwYujZXymoEFrx79lQmzs7MmxVm4mM?=
 =?iso-8859-1?Q?JeQIc385Z2Vtqx7TZwYzqXPsBENUh8kqoMClwM31VLimKnBax02YCOYA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e0e867ae-6bf2-45d1-babb-08dd6dbea11b
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 06:06:07.3948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eo513HlkoL2K2uKwZAM88C7TvoGAcg3GJCKxpulMuB4GT+tZhMpy4F5JdPNaGXwi5JKkMAcIvIM46ySNBpT+7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8308
X-OriginatorOrg: intel.com

hi, Mickaël Salaün,

On Fri, Mar 28, 2025 at 11:00:37AM +0800, Oliver Sang wrote:
> hi, Mickaël Salaün,
> 
> On Thu, Mar 27, 2025 at 07:41:08PM +0100, Mickaël Salaün wrote:
> > Hi Olivier,
> > 
> > I pushed an updated yesterday in linux-next that should fix this issue
> > and this other issue too:
> > https://lore.kernel.org/all/20250326.yee0ba6Yai3m@digikod.net/
> > 
> > Could you please confirm that these issues are really fixed? Or
> > otherwise, please let me know when I should expect (or not) an email
> > from kernel test robot. :)
> 
> ok, we've started the tests for both issues. upon the commit:
> db8da9da41bce (tag: next-20250327, linux-next/master) Add linux-next specific files for 20250327

sorry that due to unknown reason, we cannot build sucessfully upon db8da9da41bce
for both tests (which are using randconfig). could you give us the commit-id
of your fix? we could try test upon that fix commit again.

> 
> if this is not the correct commit to check, please let us know. thanks!
> 
> > 
> > Regards,
> >  Mickaël
> > 
> > On Wed, Mar 26, 2025 at 04:00:12PM +0800, kernel test robot wrote:
> > > 
> > > hi, Mickaël Salaün,
> > > 
> > > we just reported a random
> > > "Oops:general_protection_fault,probably_for_non-canonical_address#:#[##]SMP_KASAN"
> > > issue in
> > > https://lore.kernel.org/all/202503261534.22d970e8-lkp@intel.com/
> > > 
> > > now we noticed this commit is also in linux-next/master.
> > > 
> > > we don't have enough knowledge to check the difference, but we found a
> > > persistent issue for this commit.
> > > 
> > > 6d9ac5e4d70eba3e 9d65581539252fdb1666917a095
> > > ---------------- ---------------------------
> > >        fail:runs  %reproduction    fail:runs
> > >            |             |             |
> > >            :6          100%           6:6     dmesg.WARNING:suspicious_RCU_usage
> > >            :6          100%           6:6     dmesg.boot_failures
> > >            :6          100%           6:6     dmesg.kernel/pid.c:#suspicious_rcu_dereference_check()usage
> > > 
> > > below full report FYI.
> > > 
> > > 
> > > Hello,
> > > 
> > > kernel test robot noticed "WARNING:suspicious_RCU_usage" on:
> > > 
> > > commit: 9d65581539252fdb1666917a09549c13090fe9e5 ("landlock: Always allow signals between threads of the same process")
> > > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> > > 
> > > [test failed on linux-next/master eb4bc4b07f66f01618d9cb1aa4eaef59b1188415]
> > > 
> > > in testcase: trinity
> > > version: trinity-x86_64-ba2360ed-1_20241228
> > > with following parameters:
> > > 
> > > 	runtime: 300s
> > > 	group: group-00
> > > 	nr_groups: 5
> > > 
> > > 
> > > 
> > > config: x86_64-randconfig-101-20250325
> > > compiler: gcc-12
> > > test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
> > > 
> > > (please refer to attached dmesg/kmsg for entire log/backtrace)
> > > 
> > > 
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > > | Closes: https://lore.kernel.org/oe-lkp/202503261510.f9652c11-lkp@intel.com
> > > 
> > > 
> > > [  166.893101][ T3747] WARNING: suspicious RCU usage
> > > [  166.893462][ T3747] 6.14.0-rc5-00006-g9d6558153925 #1 Not tainted
> > > [  166.893895][ T3747] -----------------------------
> > > [  166.894239][ T3747] kernel/pid.c:414 suspicious rcu_dereference_check() usage!
> > > [  166.894747][ T3747]
> > > [  166.894747][ T3747] other info that might help us debug this:
> > > [  166.894747][ T3747]
> > > [  166.895450][ T3747]
> > > [  166.895450][ T3747] rcu_scheduler_active = 2, debug_locks = 1
> > > [  166.896030][ T3747] 3 locks held by trinity-c2/3747:
> > > [ 166.896415][ T3747] #0: ffff888114a5a930 (&group->mark_mutex){+.+.}-{4:4}, at: fcntl_dirnotify (include/linux/sched/mm.h:332 include/linux/sched/mm.h:386 include/linux/fsnotify_backend.h:279 fs/notify/dnotify/dnotify.c:329) 
> > > [ 166.897165][ T3747] #1: ffff888148bbea60 (&mark->lock){+.+.}-{3:3}, at: fcntl_dirnotify (fs/notify/dnotify/dnotify.c:349) 
> > > [ 166.897831][ T3747] #2: ffff888108a53220 (&f_owner->lock){....}-{3:3}, at: __f_setown (fs/fcntl.c:137) 
> > > [  166.898481][ T3747]
> > > [  166.898481][ T3747] stack backtrace:
> > > [  166.898901][ T3747] CPU: 0 UID: 65534 PID: 3747 Comm: trinity-c2 Not tainted 6.14.0-rc5-00006-g9d6558153925 #1
> > > [  166.898908][ T3747] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> > > [  166.898912][ T3747] Call Trace:
> > > [  166.898916][ T3747]  <TASK>
> > > [ 166.898921][ T3747] dump_stack_lvl (lib/dump_stack.c:123) 
> > > [ 166.898932][ T3747] lockdep_rcu_suspicious (kernel/locking/lockdep.c:6848) 
> > > [ 166.898945][ T3747] pid_task (kernel/pid.c:414 (discriminator 11)) 
> > > [ 166.898954][ T3747] hook_file_set_fowner (security/landlock/fs.c:1651 (discriminator 9)) 
> > > [ 166.898963][ T3747] security_file_set_fowner (arch/x86/include/asm/atomic.h:23 (discriminator 4) include/linux/atomic/atomic-arch-fallback.h:457 (discriminator 4) include/linux/jump_label.h:262 (discriminator 4) security/security.c:3062 (discriminator 4)) 
> > > [ 166.898969][ T3747] __f_setown (fs/fcntl.c:145) 
> > > [ 166.898980][ T3747] fcntl_dirnotify (fs/notify/dnotify/dnotify.c:233 fs/notify/dnotify/dnotify.c:371) 
> > > [ 166.898996][ T3747] do_fcntl (fs/fcntl.c:539) 
> > > [ 166.899002][ T3747] ? f_getown (fs/fcntl.c:448) 
> > > [ 166.899007][ T3747] ? check_prev_add (kernel/locking/lockdep.c:3862) 
> > > [ 166.899011][ T3747] ? do_syscall_64 (arch/x86/entry/common.c:102) 
> > > [ 166.899023][ T3747] ? syscall_exit_to_user_mode (include/linux/entry-common.h:361 kernel/entry/common.c:220) 
> > > [ 166.899038][ T3747] __x64_sys_fcntl (fs/fcntl.c:591 fs/fcntl.c:576 fs/fcntl.c:576) 
> > > [ 166.899050][ T3747] do_syscall_64 (arch/x86/entry/common.c:52 arch/x86/entry/common.c:83) 
> > > [ 166.899062][ T3747] ? find_held_lock (kernel/locking/lockdep.c:5341) 
> > > [ 166.899072][ T3747] ? __lock_release+0x10b/0x440 
> > > [ 166.899076][ T3747] ? __task_pid_nr_ns (include/linux/rcupdate.h:347 include/linux/rcupdate.h:880 kernel/pid.c:514) 
> > > [ 166.899082][ T3747] ? reacquire_held_locks (kernel/locking/lockdep.c:5502) 
> > > [ 166.899087][ T3747] ? lockdep_hardirqs_on (kernel/locking/lockdep.c:4470) 
> > > [ 166.899093][ T3747] ? do_syscall_64 (arch/x86/entry/common.c:102) 
> > > [ 166.899099][ T3747] ? do_syscall_64 (arch/x86/entry/common.c:102) 
> > > [ 166.899111][ T3747] ? syscall_exit_to_user_mode (include/linux/entry-common.h:361 kernel/entry/common.c:220) 
> > > [ 166.899119][ T3747] ? lockdep_hardirqs_on_prepare (kernel/locking/lockdep.c:469 kernel/locking/lockdep.c:4409) 
> > > [ 166.899124][ T3747] ? do_syscall_64 (arch/x86/entry/common.c:102) 
> > > [ 166.899129][ T3747] ? lockdep_hardirqs_on (kernel/locking/lockdep.c:4470) 
> > > [ 166.899134][ T3747] ? do_syscall_64 (arch/x86/entry/common.c:102) 
> > > [ 166.899139][ T3747] ? do_int80_emulation (arch/x86/include/asm/atomic.h:23 include/linux/atomic/atomic-arch-fallback.h:457 include/linux/jump_label.h:262 arch/x86/entry/common.c:230) 
> > > [ 166.899149][ T3747] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130) 
> > > [  166.899155][ T3747] RIP: 0033:0x7f55ad007719
> > > [ 166.899159][ T3747] Code: 08 89 e8 5b 5d c3 66 2e 0f 1f 84 00 00 00 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d b7 06 0d 00 f7 d8 64 89 01 48
> > > All code
> > > ========
> > >    0:	08 89 e8 5b 5d c3    	or     %cl,-0x3ca2a418(%rcx)
> > >    6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
> > >    d:	00 00 00 
> > >   10:	90                   	nop
> > >   11:	48 89 f8             	mov    %rdi,%rax
> > >   14:	48 89 f7             	mov    %rsi,%rdi
> > >   17:	48 89 d6             	mov    %rdx,%rsi
> > >   1a:	48 89 ca             	mov    %rcx,%rdx
> > >   1d:	4d 89 c2             	mov    %r8,%r10
> > >   20:	4d 89 c8             	mov    %r9,%r8
> > >   23:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
> > >   28:	0f 05                	syscall
> > >   2a:*	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax		<-- trapping instruction
> > >   30:	73 01                	jae    0x33
> > >   32:	c3                   	ret
> > >   33:	48 8b 0d b7 06 0d 00 	mov    0xd06b7(%rip),%rcx        # 0xd06f1
> > >   3a:	f7 d8                	neg    %eax
> > >   3c:	64 89 01             	mov    %eax,%fs:(%rcx)
> > >   3f:	48                   	rex.W
> > > 
> > > Code starting with the faulting instruction
> > > ===========================================
> > >    0:	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax
> > >    6:	73 01                	jae    0x9
> > >    8:	c3                   	ret
> > >    9:	48 8b 0d b7 06 0d 00 	mov    0xd06b7(%rip),%rcx        # 0xd06c7
> > >   10:	f7 d8                	neg    %eax
> > >   12:	64 89 01             	mov    %eax,%fs:(%rcx)
> > >   15:	48                   	rex.W
> > > [  166.899164][ T3747] RSP: 002b:00007ffff6eefb48 EFLAGS: 00000246 ORIG_RAX: 0000000000000048
> > > [  166.899168][ T3747] RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 00007f55ad007719
> > > [  166.899172][ T3747] RDX: 0000000000000027 RSI: 0000000000000402 RDI: 0000000000000043
> > > [  166.899174][ T3747] RBP: 00007f55ab92f058 R08: 0000000099999999 R09: 00000000377dd000
> > > [  166.899177][ T3747] R10: 0000000084848484 R11: 0000000000000246 R12: 0000000000000048
> > > [  166.899180][ T3747] R13: 00007f55acf036c0 R14: 00007f55ab92f058 R15: 00007f55ab92f000
> > > [  166.899203][ T3747]  </TASK>
> > > 
> > > 
> > > The kernel config and materials to reproduce are available at:
> > > https://download.01.org/0day-ci/archive/20250326/202503261510.f9652c11-lkp@intel.com
> > > 
> > > 
> > > 
> > > -- 
> > > 0-DAY CI Kernel Test Service
> > > https://github.com/intel/lkp-tests/wiki
> > > 
> > > 
