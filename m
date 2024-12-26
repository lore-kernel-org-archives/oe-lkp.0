Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60199C133
	for <oe-lkp@lists.linux.dev>; Thu, 26 Dec 2024 02:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735181497; cv=fail; b=PcpWFnQhiNunsrRCK5KDnR9A7SMjzC7iaVzrHFbYd+5UX0ebKhI27BRpP5CtnDdozfYxSJkh45UrtcaarAiMSxeKEmbmcvcMM0MP532sc8uxenf5VonyPVk9lC/zxSQYogogzcc4nB1aXCTO+PBcLbttbjiEG4NYjHWrp9YsoNw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735181497; c=relaxed/simple;
	bh=4QuNfHbXrqW52Nu4J+KBnN+DUga9qQJHOxgf04PPFc4=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KZ6J93UjqeLGO/65jZRS04ZJMRmFcg1iSd9zmfCRY9iekgEhsAh/JCyMuBQA6Ln3wkdSHn172f9rDhhR328q6Cjqw4gKRA4n75corEQJtp/0QGwNLozpoFRZ8J1rfqFs2dNhKM6aCDz6TYYYhaqNSXxOVv0hX1MqP0ODkV7Z/lk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=doXFT0Yv; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="doXFT0Yv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735181494; x=1766717494;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=4QuNfHbXrqW52Nu4J+KBnN+DUga9qQJHOxgf04PPFc4=;
  b=doXFT0Yveu8XSMNQLv7Ru/S6MYs85SfVssm18t5Apc+x+WmkkBVHezDx
   AgdEhbvvIsInqkZon9x9DaJJpq4fiwUx9xdyhdPt+7nRF/O3RU8UqJiGB
   tSILSiEMXQ/IrG8MFQFPBF2Znw6Xdylb15Arf3hADz/89M1Dxh1t7rLSo
   sVwRTSSEeOyBvewuJNJs80jAjMV2y2Yk1cwCkWaanHX9CIsJ1/QG1rptJ
   xqt/oQNPcm81HaAYEDz0TKIU/DOZfzUI0e186HR7nOj6l3ublh3b4U1Tn
   UHmU/FGE6uPsScNdyq/sr/YjgzJSjOmPwleDIxDD6EjGrQVSkhyapzxjB
   Q==;
X-CSE-ConnectionGUID: KwAMZ3tpTjmYetSK6d3uBA==
X-CSE-MsgGUID: ILiUcBQQSViHXTlKrTHxkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="46094361"
X-IronPort-AV: E=Sophos;i="6.12,265,1728975600"; 
   d="scan'208";a="46094361"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2024 18:51:34 -0800
X-CSE-ConnectionGUID: HnRzvLOoQDKk8gCnTXEvIA==
X-CSE-MsgGUID: /dv6kDCMRw6kU2MD7cNIgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="123093622"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 25 Dec 2024 18:51:33 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 25 Dec 2024 18:51:33 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 25 Dec 2024 18:51:33 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 25 Dec 2024 18:51:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MpZVtcNemaPeS9CgHaEj8Rnkv8ffRZsQxRQyg5o/rKA4v4jbB1KCM5D2zYYN3JDSvtCfS3gbBZRLDo7b6UmwPJwmUk6JrVoZNen3qbfB81IC/10vUiVIlpdPb4PmxNxYLo7LvI0o2UtsOy2FhzxibJhuCzAHM0C62NoaI9hjVulolrp/ATzmXlf/qfmdwJ47OuwJWkEvsqwNfpYVWbkAb5rq4/yUpEMK+D0Mv8nRjHkbGUU0hewjurW3jlmLMmstz7AkoKqpWIor7svnZNx/LwlZCG4DbZD2tKd9srSXFTrZlwMAHbQIr+BBdZ32C6DW3WFZPq5vwWhUwNoH2Uwk6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iW7qbirAjQNghphLA8tVrNoFap9AehboBjtwEW/PyU0=;
 b=xFcL/39ZaQhW+EwvV1BR1RSWt5r75Y9HZlHOFx55V85l2NM+P88UA57G9LF0Tt0gBCTY9lOTWtmudEtAzHXOKoj48udD/BDr6o6jjnEyAXlxVeRU+GCoqMem66Pajj7VFrGl6GuIoyJldXv7lZxGcT8fwPlsIqGNt4sk9aGAxFlmXVcPL5CdCbKpKeKh3gFGem9HjOWgmTWSbFEjQGmQie3XkLCXE/thc6ph3p8XmFSns3f0lptbd/xBBE5eRk8q0UtGxrcBbrnlJcASA8h6rHoM318Lz6LKH+bQbVMLNRFdF8cAYnkJRHHmY4iP/iLlWeZSHWs6UN2jIv3D9RmKbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH7PR11MB5793.namprd11.prod.outlook.com (2603:10b6:510:13a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.21; Thu, 26 Dec
 2024 02:51:26 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%6]) with mapi id 15.20.8293.000; Thu, 26 Dec 2024
 02:51:26 +0000
Date: Thu, 26 Dec 2024 10:51:16 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Yu Zhao <yuzhao@google.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Kairui Song
	<kasong@tencent.com>, Kalesh Singh <kaleshsingh@google.com>,
	<linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>,
	<linux-kernel@vger.kernel.org>, <oliver.sang@intel.com>
Subject: Re: [PATCH mm-unstable v3 6/6] mm/mglru: rework workingset protection
Message-ID: <Z2zEpHPMjCdwQzpi@xsang-OptiPlex-9020>
References: <20241207221522.2250311-7-yuzhao@google.com>
 <202412231601.f1eb8f84-lkp@intel.com>
 <Z2sFzKmHPI0kI_fq@google.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z2sFzKmHPI0kI_fq@google.com>
X-ClientProxiedBy: SI1PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::11) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH7PR11MB5793:EE_
X-MS-Office365-Filtering-Correlation-Id: 73d7a00a-0f1a-4c0e-aebc-08dd255830a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?lpQypoVll0OUKapoFSezKCvGPEXxErQX4QCDjGxzq5tgjOGuXrGPpkT1in?=
 =?iso-8859-1?Q?EIvyiDK4yE2r5KYEG2Y5K6HLYTxq95T8ztfkBGaI+GjJpmYTyKRJGua285?=
 =?iso-8859-1?Q?ytAGBW/R1Ftv9yfQ3r7GBK2C08t9I6Dw2e1697pes5NDKOLm1weWTvQHzM?=
 =?iso-8859-1?Q?/54ySR1J6coq84RapPFjdoDJZBkFmHNVSuH+OTH66AkdiIYz4GDJ75gZQR?=
 =?iso-8859-1?Q?67gQ33+s10aZE+h2DSmUNiAcTZhFMrRqtTKnmVBKltrKQsTGLqMIxuyn7v?=
 =?iso-8859-1?Q?tZi5sO3KhnrjfTjIoZZ1O8oFKF5RRcGAooQAKhcYH/YQE4z1y524tGt9+R?=
 =?iso-8859-1?Q?OoKi9nfty1OZW65oxaGKB4/Ll3HfaTcQtaUpiQxIZB6+Q4Worur0Xc34Ju?=
 =?iso-8859-1?Q?Xc0tfxXshCbqAhp7tqDF/Gy6jNGngvy9ul8m9GO5k/7JdsgM3VRxYYVBaO?=
 =?iso-8859-1?Q?T7UyvCgt5HPnHDMgtuN+pRWnI05DbwID2s/kCnRnWB4MINwcro7XZIeeIY?=
 =?iso-8859-1?Q?87GtVYUluE+S1Ucw188TAe04v+M+A0DfKjJsXnVSRtSJ2FxTnIMgizH30+?=
 =?iso-8859-1?Q?151vCLEkClCPbg9TKgGjOteaBlwjmJmlHDYQwgej6sCAK+uQrrq7z6yjge?=
 =?iso-8859-1?Q?Elfl1NsP3DOA6G6H9wnpIh+MUa7uGIlvOV7nplEbXbWFsrLrLvvKzQk18J?=
 =?iso-8859-1?Q?HhhaBFQLscvCv1zTR0xA5q/vxzp0VCN0oSNErFTF3Eub5tWDErnRIap7+K?=
 =?iso-8859-1?Q?E7riTtdgsoZx/lMU7gVFTogU7iAVgK9fWy66VTRJ+is2gjdjzzse5dNC0C?=
 =?iso-8859-1?Q?ajGCXWsDh8Ma90NBHpm4ZwCnz716q0HRV3ENrBTFYqMgGj0wiKUnF2Zujl?=
 =?iso-8859-1?Q?ECFfsaQViBDc3nMuWthAaAUVn78Ad6C+gFLdZEaHfW38brJXwGqS2gCQA3?=
 =?iso-8859-1?Q?A89HMfoSnQbpYOBLVpsaI2tRprZ32rH9BZrQQrUbNsfkJCU7pLMCyHYqY8?=
 =?iso-8859-1?Q?Xn6mvEhDDUTp74o1WPybBHx9AhMkEtnjyVKbiZ2owt8P9gxuA2ecvLRwzF?=
 =?iso-8859-1?Q?wwgtHfyq0U1ClMyJQlAUqQCL3Ee+68IurK0jwxltaCyT3ts9SatjgNFvUH?=
 =?iso-8859-1?Q?awAIIhhG8kH44y+k+04VavaVk01j8OAbfEb+QR8EhuOUynb8D8TuRyIod/?=
 =?iso-8859-1?Q?Oo1FbJWqfbwxt0rJy1Okv1kENQKWkcz8PrUKbheuIdrpBwkOfs1PIByzKC?=
 =?iso-8859-1?Q?rXVM0g4OTgwBHjxvZUHY+16At89rjLAdfewVNH2GIIJFo9FT8xDuTJJpXG?=
 =?iso-8859-1?Q?pYyjhxpbfJV6L77qK1WCsHSNdt56w5g83WI/xUqxHpX7/z1KFzZko24Pat?=
 =?iso-8859-1?Q?fdnwmNX2RqBNGmhja/mdWfIMO2L/nzyJXYEp2veGIvBwPHfoJpTrUy1kTH?=
 =?iso-8859-1?Q?PsGuHujFC3s7s7u2oku4pP+0Hi/wTMpsNtFB5A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?pBXK3TozMHRWp+KGplvYoH/r/s9y+SHxZhkJEMa0N5ULc26i/2Vr+4Zvnt?=
 =?iso-8859-1?Q?mL18G+6vKvGhHr2PCFX0fI/9rAv+A2ftRIShPyHayVvDPp02cfXd7+a+ev?=
 =?iso-8859-1?Q?S5qWAylTAeTeh3rXA3qLMBnw6BxNTeWJHPYqP3ADzs8JHcakU18q6GyVuM?=
 =?iso-8859-1?Q?qEfHx9S2FIOq1AlLgDRg+W/FJoH5cDwD87CslVUZCu7V3S107Ao4qOBBia?=
 =?iso-8859-1?Q?TykyFUHBUTdISJj4GofoOs+Dz4ixPEpxL278h32yKr1y168g5u22vSwXbo?=
 =?iso-8859-1?Q?tOml1mQTofDvdxQgga6jgV1M09L5RyA0vk9CLI5taM7bzJnGQEM59wynV/?=
 =?iso-8859-1?Q?8OnguEV9RQ42NyDOJ9klegT4jpZGonSQOr5LYd+dkP/rIfgsHKnK0cXDHn?=
 =?iso-8859-1?Q?b7buKYfhi5aDSa2xSUFc0E12xKgpopCiDqdI2YJsWZ/va34pP3whW7Kutb?=
 =?iso-8859-1?Q?01Ed3uLWcXmNhvIH1bYZDD2K9BdQD+mXiulHTosM079kJizswlZT+dURQB?=
 =?iso-8859-1?Q?w619oxyc1h5yu/e9XOwYuZdf8ntP1zIGDRuX5opk45Qq5edtkHWSy1ppAZ?=
 =?iso-8859-1?Q?LVUpdLWbjXnLao+JT6vyL7Z1TJngFtLlTBc0tzoXvsxKsrs9t/3fC0uSaE?=
 =?iso-8859-1?Q?vSk0OsmkwSzfDxRk6FRu+Ceez8kKeTtMp+UGbd9pkn/HPwneylQQ/S2UTb?=
 =?iso-8859-1?Q?W8CEBsRADz4TjmSfmxXNwIdejyObTI4uYPWsLT2P3ajz/5tNb5kOFVWtBm?=
 =?iso-8859-1?Q?CUdorWCEhyX8kuX+5lKF48cqeBvhYU6taKF4BHVDZtNeT76wudRjzo/pKF?=
 =?iso-8859-1?Q?Ath0XqMC1uMaHO1CNxt9x7XDNQAZAtirP4tPB4b9g11cyQJDDiG5XaGvdw?=
 =?iso-8859-1?Q?otV5bQZKgDAf09qaChrX80/hn1tZldxmx7e8lrXmNEv50EydA4ztmlFGSt?=
 =?iso-8859-1?Q?QeGq5/YYOVepipuIZYfCej4IfvEu6nS0vmBWUOmENTdHZkEd0+7BXtQSZy?=
 =?iso-8859-1?Q?SBR1qLkJX65QVTBlzMwM9EmuhwhCa+jmdDl+IjZMvZvsi2FEgQoL464P1G?=
 =?iso-8859-1?Q?9qFjVx2nIX0oilQ6TK5gvzIKaDTd8Qgz9a39DFfm19UA6xOOsp+C5F/yE8?=
 =?iso-8859-1?Q?SBNMN0fj+RVzfKNhavZp+zNu5O5CLKVZBtT4YtSNk7YrkghQQQk9XV8QjZ?=
 =?iso-8859-1?Q?Gwbny6yFj3LyFPRPxe1irT58twHlwr0QQnv95m53YPlCzKVONiWCTOQkgA?=
 =?iso-8859-1?Q?jEsAa6SiTSIFtAiOGYDFlWem6O/lNl3Vhfi7mxH3aXefM7Owgk3jlyLQCU?=
 =?iso-8859-1?Q?hT1vyOP6Sk451DFgMoKc78mCQDTwiShoyuoXaRE5exUnNeNe/YyVLl1+D5?=
 =?iso-8859-1?Q?nVjfFJLz1lCL/PpfL4c8CTcLpMtBMQ8waXojBJO8XGHQvBNPt9QM9LOCY7?=
 =?iso-8859-1?Q?+xwPftJuya3DtUv38J318b6dubgFxYO33Gq07Q7bm0jikAu6D85lRwKYFz?=
 =?iso-8859-1?Q?t8Km9R+dN2xIGESuv1vai5Z7aBjgVMdrt7s2I9yTZs0xFTsHtAXfjHxKjT?=
 =?iso-8859-1?Q?06LrLG4RQtGna4fILKT1bxk650BSU1rJMaeznnYJnyOXjwilcYu0U86EzQ?=
 =?iso-8859-1?Q?yTr2IZ4MbweyYRtg7TuuuyDZW26wAIdbwonIZo9QXrJ3RLa82+iOWKoQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73d7a00a-0f1a-4c0e-aebc-08dd255830a5
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2024 02:51:26.0782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 10dbkoYe5AWd1x233pXMgAJsquxgb7hRmg964O178jpkhXxVLD5JFPuJ7rbCay/Erdss6Xgr4/fEfx6qftyffQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5793
X-OriginatorOrg: intel.com

hi, Yu Zhao,

On Tue, Dec 24, 2024 at 12:04:44PM -0700, Yu Zhao wrote:
> On Mon, Dec 23, 2024 at 04:44:44PM +0800, kernel test robot wrote:
> > 
> > 
> > Hello,
> > 
> > kernel test robot noticed a 5.7% regression of will-it-scale.per_process_ops on:
> 
> Thanks, Oliver!
> 
> > commit: 3b7734aa8458b62ecbfd785ca7918e831565006e ("[PATCH mm-unstable v3 6/6] mm/mglru: rework workingset protection")
> > url: https://github.com/intel-lab-lkp/linux/commits/Yu-Zhao/mm-mglru-clean-up-workingset/20241208-061714
> > base: v6.13-rc1
> > patch link: https://lore.kernel.org/all/20241207221522.2250311-7-yuzhao@google.com/
> > patch subject: [PATCH mm-unstable v3 6/6] mm/mglru: rework workingset protection
> > 
> > testcase: will-it-scale
> > config: x86_64-rhel-9.4
> > compiler: gcc-12
> > test machine: 104 threads 2 sockets (Skylake) with 192G memory
> > parameters:
> > 
> > 	nr_task: 100%
> > 	mode: process
> > 	test: pread2
> > 	cpufreq_governor: performance
> 
> I think this is very likely caused by my change to folio_mark_accessed()
> that unncessarily dirties cache lines shared between different cores.
> 
> Could you try the following fix please?

yes, this patch can recover the performance fully (as below (1)). thanks!

Tested-by: kernel test robot <oliver.sang@intel.com>

=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-9.4/process/100%/debian-12-x86_64-20240206.cgz/lkp-skl-fpga01/pread2/will-it-scale

commit:
  4a202aca7c ("mm/mglru: rework refault detection")
  3b7734aa84 ("mm/mglru: rework workingset protection")
  c5346da9fe  <-- fix patch from you

4a202aca7c7d9f99 3b7734aa8458b62ecbfd785ca79 c5346da9fe00d3b303057d93fd9
---------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \
      1.03 ±  3%      -0.1        0.92 ±  5%      -0.0        0.98 ±  6%  mpstat.cpu.all.usr%
    144371            -0.5%     143667 ±  2%      -2.0%     141486        vmstat.system.in
    335982           -60.7%     132060 ± 15%     -61.7%     128640 ± 14%  proc-vmstat.nr_active_anon
    335982           -60.7%     132060 ± 15%     -61.7%     128640 ± 14%  proc-vmstat.nr_zone_active_anon
   1343709           -60.7%     528460 ± 15%     -61.7%     514494 ± 14%  meminfo.Active
   1343709           -60.7%     528460 ± 15%     -61.7%     514494 ± 14%  meminfo.Active(anon)
    259.96        +3.2e+05%     821511 ± 11%  +3.2e+05%     829732 ±  9%  meminfo.Inactive
   1401961            -5.7%    1321692 ±  2%      -0.1%    1399905        will-it-scale.104.processes
     13479            -5.7%      12708 ±  2%      -0.1%      13460        will-it-scale.per_process_ops    <----- (1)
   1401961            -5.7%    1321692 ±  2%      -0.1%    1399905        will-it-scale.workload
    138691 ± 43%     -75.8%      33574 ± 55%     -54.9%      62588 ± 61%  numa-vmstat.node0.nr_active_anon
    138691 ± 43%     -75.8%      33574 ± 55%     -54.9%      62588 ± 61%  numa-vmstat.node0.nr_zone_active_anon
    197311 ± 30%     -50.1%      98494 ± 18%     -66.5%      66034 ± 50%  numa-vmstat.node1.nr_active_anon
    197311 ± 30%     -50.1%      98494 ± 18%     -66.5%      66034 ± 50%  numa-vmstat.node1.nr_zone_active_anon
      0.29 ± 14%     +20.8%       0.35 ±  7%     -14.6%       0.25 ± 31%  perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      1.02 ± 21%     +50.7%       1.54 ± 23%     -10.2%       0.92 ± 19%  perf-sched.sch_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    476.63 ± 10%     -12.7%     415.87 ± 28%     -31.2%     327.79 ± 35%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
    476.50 ± 10%     -12.7%     415.80 ± 28%     -31.2%     327.69 ± 35%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
    554600 ± 43%     -75.8%     134360 ± 55%     -54.8%     250416 ± 61%  numa-meminfo.node0.Active
    554600 ± 43%     -75.8%     134360 ± 55%     -54.8%     250416 ± 61%  numa-meminfo.node0.Active(anon)
    173.31 ± 70%  +1.4e+05%     247821 ± 50%  +1.9e+05%     338038 ± 45%  numa-meminfo.node0.Inactive
    789291 ± 30%     -50.1%     394029 ± 18%     -66.5%     264180 ± 50%  numa-meminfo.node1.Active
    789291 ± 30%     -50.1%     394029 ± 18%     -66.5%     264180 ± 50%  numa-meminfo.node1.Active(anon)
     86.66 ±141%  +6.6e+05%     573998 ± 27%  +5.7e+05%     491639 ± 33%  numa-meminfo.node1.Inactive
 2.657e+09            -2.2%  2.598e+09 ±  2%      -2.4%  2.592e+09 ±  2%  perf-stat.i.branch-instructions
 1.156e+10            -2.3%   1.13e+10 ±  2%      -2.5%  1.127e+10 ±  2%  perf-stat.i.instructions
      0.01 ± 50%     -66.9%       0.00 ± 82%     -72.9%       0.00 ±110%  perf-stat.i.major-faults
 2.648e+09           -18.7%  2.152e+09 ± 44%      -2.4%  2.584e+09 ±  2%  perf-stat.ps.branch-instructions
 1.152e+10           -18.8%  9.358e+09 ± 44%      -2.5%  1.123e+10 ±  2%  perf-stat.ps.instructions
      0.01 ± 50%     -73.6%       0.00 ±112%     -72.8%       0.00 ±110%  perf-stat.ps.major-faults
     38.95            -0.9       38.09            +0.0       38.96        perf-profile.calltrace.cycles-pp._raw_spin_lock_irq.folio_wait_bit_common.shmem_get_folio_gfp.shmem_file_read_iter.vfs_read
     38.83            -0.9       37.97            +0.0       38.84        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.folio_wait_bit_common.shmem_get_folio_gfp.shmem_file_read_iter
     39.70            -0.8       38.86            +0.0       39.71        perf-profile.calltrace.cycles-pp.folio_wait_bit_common.shmem_get_folio_gfp.shmem_file_read_iter.vfs_read.__x64_sys_pread64
     41.03            -0.8       40.26            +0.0       41.04        perf-profile.calltrace.cycles-pp.shmem_get_folio_gfp.shmem_file_read_iter.vfs_read.__x64_sys_pread64.do_syscall_64
      0.91            +0.0        0.95            -0.0        0.91 ±  2%  perf-profile.calltrace.cycles-pp.filemap_get_entry.shmem_get_folio_gfp.shmem_file_read_iter.vfs_read.__x64_sys_pread64
     53.14            +0.5       53.66            -0.0       53.13        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.folio_wake_bit.shmem_file_read_iter.vfs_read
     53.24            +0.5       53.76            -0.0       53.23        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.folio_wake_bit.shmem_file_read_iter.vfs_read.__x64_sys_pread64
     53.84            +0.5       54.38            -0.0       53.82        perf-profile.calltrace.cycles-pp.folio_wake_bit.shmem_file_read_iter.vfs_read.__x64_sys_pread64.do_syscall_64
     38.96            -0.9       38.09            +0.0       38.96        perf-profile.children.cycles-pp._raw_spin_lock_irq
     39.71            -0.8       38.87            +0.0       39.72        perf-profile.children.cycles-pp.folio_wait_bit_common
     41.04            -0.8       40.26            +0.0       41.05        perf-profile.children.cycles-pp.shmem_get_folio_gfp
     92.00            -0.3       91.67            -0.0       92.00        perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      0.22            -0.0        0.18 ±  3%      -0.0        0.22 ±  3%  perf-profile.children.cycles-pp._copy_to_iter
      0.22 ±  2%      -0.0        0.19 ±  2%      -0.0        0.22 ±  2%  perf-profile.children.cycles-pp.copy_page_to_iter
      0.20 ±  2%      -0.0        0.16 ±  4%      -0.0        0.19 ±  2%  perf-profile.children.cycles-pp.rep_movs_alternative
      0.91            +0.0        0.96            -0.0        0.91 ±  2%  perf-profile.children.cycles-pp.filemap_get_entry
      0.00            +0.3        0.35            +0.0        0.01 ±299%  perf-profile.children.cycles-pp.folio_mark_accessed
     53.27            +0.5       53.80            -0.0       53.26        perf-profile.children.cycles-pp._raw_spin_lock_irqsave
     53.86            +0.5       54.40            -0.0       53.84        perf-profile.children.cycles-pp.folio_wake_bit
     92.00            -0.3       91.67            -0.0       92.00        perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      0.19            -0.0        0.16 ±  3%      +0.0        0.19 ±  2%  perf-profile.self.cycles-pp.rep_movs_alternative
      0.41            +0.0        0.44            +0.0        0.41 ±  3%  perf-profile.self.cycles-pp.shmem_get_folio_gfp
      0.37 ±  2%      +0.0        0.40            +0.0        0.38 ±  2%  perf-profile.self.cycles-pp.folio_wait_bit_common
      0.90            +0.0        0.94            -0.0        0.90 ±  2%  perf-profile.self.cycles-pp.filemap_get_entry
      0.61            +0.1        0.68            +0.0        0.61 ±  2%  perf-profile.self.cycles-pp.shmem_file_read_iter
      0.00            +0.3        0.34 ±  2%      +0.0        0.00        perf-profile.self.cycles-pp.folio_mark_accessed


> 
> diff --git a/mm/swap.c b/mm/swap.c
> index 062c8565b899..54bce14fef30 100644
> --- a/mm/swap.c
> +++ b/mm/swap.c
> @@ -395,7 +395,8 @@ static void lru_gen_inc_refs(struct folio *folio)
>  
>  	do {
>  		if ((old_flags & LRU_REFS_MASK) == LRU_REFS_MASK) {
> -			folio_set_workingset(folio);
> +			if (!folio_test_workingset(folio))
> +				folio_set_workingset(folio);
>  			return;
>  		}
>  
