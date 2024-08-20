Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AB4189BBD
	for <oe-lkp@lists.linux.dev>; Tue, 20 Aug 2024 08:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724141345; cv=fail; b=ZRhVuEQHrp5FmqrtmKhUJdeGiItSiZNhEgbCPgDPLU2kctNa+67+WjKfMttwNdEbBYk+n6mYVd0Mc12F+1fi5AeZxHzB/zntq6Boc+/mKsp3XnF0obyFAFiqp+RCJWztfq5hu2hRH5uqZHb4qFFxaOUT/PukREnpJBK7vlvUd2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724141345; c=relaxed/simple;
	bh=GK7qgiV4j2CLFmbRvdQAP4cIXiCg98EjdFMY0mUMsyg=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=ThPQ595pu8nVrRrDcriC500ZECERXBbf1TVXFqqiqsU+KZtmaxR1//n9IUATk0Y3aCQDSnmnuZjTMXc5D8vTSfKZkfcCJjflHolAyeNOce2quiuTD/P3eotdQconsU9jgiy6qDOqZ8RotLFcIqmgqhiP5X21fV2mrHDa4XaLs1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GEmGm95f; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GEmGm95f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724141344; x=1755677344;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=GK7qgiV4j2CLFmbRvdQAP4cIXiCg98EjdFMY0mUMsyg=;
  b=GEmGm95fCWmbLi5+/cK7MmNSKSeHv+zNM2SYOn8pQb5N5EybiKdGZxvg
   4bHg7hI/RAcwHMIoDnEB19eWw0hot2IMEpS898pPiVLpD2TEXMErMkX5B
   A9M47lfPmNIZja+iUMhjC0JGZyQGwWkqGbtK7VxHUBHNShPj2A9vJikwB
   /TYHQkkUZOl3FGonTOh9O3eKg+QeJFZ9x1BeQ0cabAGBdSZh79EL6P4gb
   sRYllLYcmPGIn7XTguEVPloJhwp+OyrZXuGNeHde5DRfFo87XDDIYWGkB
   6iBnVgAyZ2uxOBu4c5sTCmPKV1joWT5wYmSI9+twO+AwUiVKHyRe4i4I3
   A==;
X-CSE-ConnectionGUID: RMoSPQMxR5+X6NnDg2vbww==
X-CSE-MsgGUID: wx6VqlAMTJ6yUMOtzMZ6bQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="44947239"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; 
   d="scan'208";a="44947239"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 01:09:01 -0700
X-CSE-ConnectionGUID: iuNgnwO2SSKAHQyoPQvWuw==
X-CSE-MsgGUID: TYIofU+VR3uVBJeF4vsdnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; 
   d="scan'208";a="91415668"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Aug 2024 01:09:00 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 01:09:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 01:08:59 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 01:08:59 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 01:08:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IfqwJ7qzn7C6ILd5Cgcvh9IGvZ4QpFuuXtZnAryfXGdBV6eEcUB6i8fKgkfo4otg9L52BJWoyDTiFxeqoMTjiqF3vqeO8xSy7PMmDMgQb2f/sYL8AmQVej+a6NXaPVSHI0eSOu9hjF8SECARyHmbnXWJX2Ae0UJxUMzDyQ1unTnx46kbjVr0U4mD42ObKs9nxezeizP3JYdkEt3zpfFpitKSGcedvPQek34WgpeyO8ImliW/is3+NNWd/2VRxFw8sclqQ1tZ+08Ua9qWSmdZxJ+FiHaYWNvU7zFhxo9yghnfpni4hLrDqibS9xbEppP83+AYNTbKkn2jLWvuiYMt+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/JxbQcxtbFVoHlgJWAFfKPXvu9ekW9hgEM2YmU5dcX0=;
 b=g3DmViVCPSO+K7B2Xr14A3FBSpQjbnv1Abk8pKlzE0a23nTft76MMCDCffiQkkuBspxGnO8TUiaQhniHR+2l8QjfpcUm7/hUymh0OBeq7xxfzFbO536IIpk4Jh8iEX+KSD5O2CzZrcwWT7Q6IHoRkIh0mqQRrdf7KDR+USCbUc9rg8u7LmOS+1wnRA6Ga7iH1Blo4LbrY7QPOU8uaejZwAcRJCN3jnUTMl+3eZAyxSbSP72wQh1TZicCUbcBKWGMxcqPN4Db4AIv+it5rhtLDlF5HQts0GVzCPS0xSmQbxiIQLcVRsfMZ/CDiEW4B0P4FPaPym81/ZjR1cjD6VBxIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SA1PR11MB7087.namprd11.prod.outlook.com (2603:10b6:806:2b5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 08:08:54 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 08:08:54 +0000
Date: Tue, 20 Aug 2024 16:08:43 +0800
From: kernel test robot <oliver.sang@intel.com>
To: <jasperwang@tencent.com>, <kaixuxia@tencent.com>,
	<frankjpliu@tencent.com>, <kasong@tencent.com>, <sagazchen@tencent.com>,
	<kernelxing@tencent.com>, <aurelianliu@tencent.com>, <deshengwu@tencent.com>,
	<flyingpeng@tencent.com>, <jason.zeng@intel.com>, <wu.zheng@intel.com>,
	<yingbao.jia@intel.com>, <pei.p.jia@intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [opencloudos:next] [hrtimers]  53f408cad0:
 stress-ng.sockfd.ops_per_sec 13.8% improvement
Message-ID: <202408201523.11994461-oliver.sang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0009.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::18) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SA1PR11MB7087:EE_
X-MS-Office365-Filtering-Correlation-Id: 8515892c-f2a0-4f00-d6b6-08dcc0ef5584
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?bl+SJPJvJioveuDzsu/RwYw/sgz+ZoBo3g5mUT8fN7H1xMjK1u3WPZI90a?=
 =?iso-8859-1?Q?9cmjk5L3lbUdOfKs+YvYH/xfF+PTBNc8y6Xbljwb1RPA7ULomm1S8b5/VW?=
 =?iso-8859-1?Q?CSpuoC2PAG4CaOSGDmgdxnKpZ37YWY/3poOpvIRu5fbOHxJYNij4LJeM4L?=
 =?iso-8859-1?Q?hx26OfiL+LBqUstbhNXOSVB5zFm7tnTN67G12a+AO18u3YUTPcZGPYlnZV?=
 =?iso-8859-1?Q?rTFuVLxXt2XF2+nZsZ5uAsc9o2Xx4gfDQ7+UZsK4FZ4/V+8Mnie5KZ+Oso?=
 =?iso-8859-1?Q?gIJdNqG9msv+3eAeobb9qqDCcSaYXUaU6gNcF11XOUc/oVLK1mHHOjieIE?=
 =?iso-8859-1?Q?t0A95nLiSIMqbDUacybVipLGJPX/1X0jU4Sd/ihe54nICCPzBBbbTtdrfm?=
 =?iso-8859-1?Q?h9OF+3tLpUf03F2BmthBGf0HrFmXX7wqtBk3oKftY/4jkrCJ3U2DmNBxt6?=
 =?iso-8859-1?Q?pNr3Jxf9p/XCFYNdlMFjznjnLHGo15VSnQawkKHfLZiJYYTvpCDoZUEJDs?=
 =?iso-8859-1?Q?GiKCkruu0YDx0cfjeo6NljIXu7xItSws7DD1IPCYY8PAvvAcw6e/o0R/yW?=
 =?iso-8859-1?Q?/qquN7c5vA8u3UhOCi/Zu45pL5lUBiQMvnm9YUnGSIC5W5SaH4u22YOWIr?=
 =?iso-8859-1?Q?EXwv1td/l75Ug4qR+mEx9rYmJeyucUBhTbgWOUcHdSTRztyYFxfzT5aQcE?=
 =?iso-8859-1?Q?WvSPn8RYfrUFgViKp9ZVg2sYkkStVmVdE8WzB16f69wGHABoxPl7LXq1lo?=
 =?iso-8859-1?Q?rNVIVSMYoZQMzd6uYxuqkTTKC7YYNTDwhM3ij9gZxoJhpO+Aq2RuGenLhD?=
 =?iso-8859-1?Q?b7otGOvtf+TJIt+AdIrjAVxZiPIIMXUYi2uQxchWx85XZ51QbBRgM1OXjo?=
 =?iso-8859-1?Q?B6aPeFJsCJwFgnFt3Rofrc4sCDMeQmIk2A3jeOQrx5F2nNi2LeowDfKQkc?=
 =?iso-8859-1?Q?S6AuIKBPMn2G4HREMA6XZ8q7Hcl0HPfcaWyTDnx8y8PClgrsEIyEx0Ymiq?=
 =?iso-8859-1?Q?U7PwycHBZuS+vgfaGLv10eFtypRaziyND3MSDZ+N4j2P42Yo2mq6PoMhUx?=
 =?iso-8859-1?Q?FnMH+EpzASOAqgqKBBGQJJJe0Mt05b/dNCl8cGnl3kk2J7CmPVKtg+S+Eg?=
 =?iso-8859-1?Q?AtKe1pM2V5NQKpxMTP5WfAoQg86KmhsKToKQ1BAK6jYnzWX5GvgoaEImMO?=
 =?iso-8859-1?Q?QBZow6iItqZhMAg3E4qvMQa/1K+Mo/N5YLHeq1KYRIpgRH8T+WBEdd3UiL?=
 =?iso-8859-1?Q?12hmLmdH1i/f3W6wcZX3amRE6puoj8xn4kjHq5pbu9kldurnWgjOlOewsS?=
 =?iso-8859-1?Q?O6o8PhswrcdhpWWliT0JP6dehAVhXw2LlaZgwqgKAtAXP7gdzcpN0ZhMC1?=
 =?iso-8859-1?Q?5f6vRpfZm2cemmBA86A0yy4BpAWZpBYMaURPL4p8Hc5jZACLaj3aY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?cxE+0gXKPeZjet9SlwUqLwpCyt/+/Zhp1vxO2YHbjipmaIBMdDlJ666YlW?=
 =?iso-8859-1?Q?dzV2EIGj+QUixcxGy1Gw/2FDjJ8sH0MRxlSIilKC8lzk1PyTByPj/xt2Z2?=
 =?iso-8859-1?Q?NeK3npFCBRb9SbxsqedXqD6gn9HOf2lGKL9E52FLjffSrDAP2uIobgKZbs?=
 =?iso-8859-1?Q?o8l1AMTt54atv1p+wese/DDTbVUPEYKOSmB4bmRV+4jLA3fed+1YNVTnMb?=
 =?iso-8859-1?Q?21j0G0nXd+BceyFiN+WsO2csHzqcqa8uxIBUuzdQRGum38dVBRRvIItV5w?=
 =?iso-8859-1?Q?WOvGRCEEq92Mja/61OgBgFjyZxU0CI5wD5viCmKvX8wbwB0nhaS8c/CSio?=
 =?iso-8859-1?Q?NtaD3BZzf4j0BWkLrjOU1P+5IN4mWt/uOAUl0Ru00Tc/sdWLAt9kvgfNke?=
 =?iso-8859-1?Q?PU46jnZ8s9aoFDKjwdwP1g5pbSmRMe03JpXZ0wLG7PqrdtZsBxdC/xAIyf?=
 =?iso-8859-1?Q?VTIRtEagJVUbS7ODPVqhHIDJ5XiSsskeDZ5lQRW8BPbhYSUedTcdAAHYRS?=
 =?iso-8859-1?Q?5USo1XlT9H/sPf/p2v2bn5/lM1H7XGUvqbFuEtGo6BaghdIHSPzMX/xJNA?=
 =?iso-8859-1?Q?6x/oi4VDcztp/hzQHYdWkK0dew2xk7JU4S2CtQeG+TUwoVc/mXLTe9SQy5?=
 =?iso-8859-1?Q?SpcaqsUbNCX9F7ZkjhYglUG4cKkSrCWpknoMnmHgPjoEteaCOopkdqfq5K?=
 =?iso-8859-1?Q?oegstcTljP8bxpqvvxOVPZ7crs6xXbDah2KH8SxCVQBIsH9imPqmruuXOU?=
 =?iso-8859-1?Q?BuZHxS8kERQahJLI072ZFRZTGdGEjyB/ds8AcpcAaxynApcoENk9xIm/gJ?=
 =?iso-8859-1?Q?RxQ6JG7Sv+hy9RDVwZAdmPGtJ747mFo8I8M1/J77nAANmlOizTz1imLXro?=
 =?iso-8859-1?Q?BatcedCL1WjWSplGGawpzEwBjsPhIZA1hrSm1RJYKrnurjPs6DtBdIi+C/?=
 =?iso-8859-1?Q?oeF3ZYFgZ/FdUhodBBBFNCZ0T+Ufn1ppj3hmaAmHANjS3wYlCQcxEjMPAZ?=
 =?iso-8859-1?Q?VKEqw4gYKHHEBLPimtek7muA6Qf9u6duU7nq/tY+X/FtFyeZL9PO2TPTZO?=
 =?iso-8859-1?Q?TGh0IrU6Kn+mgCzsJu4LTsZnBX416SpTeYU17Y4+tbu6nVABLdmwxRnGIW?=
 =?iso-8859-1?Q?BSf7Z8gyBUBTQ4nnkw5wUQ6j/I2HVHe2gX0bG6XS3A6Ob9PeWFl8NyEUE+?=
 =?iso-8859-1?Q?mm49ByFecDux0BnQDMGCc0qRckZWssb1CHCBueplTqD+vJQPaPf1iEh5M+?=
 =?iso-8859-1?Q?SVDRZqQS7AKp/dkEuO8fFqDg2qRw0zg8gd5fnCYT9PnxAuLbP/1zbW5hDx?=
 =?iso-8859-1?Q?3VfgZkYLkTLsaLc4BDfzuUEhypk67VJyFRh4UYRzIdIc1fsP1ed0lbw0qt?=
 =?iso-8859-1?Q?uPWzjTuWJ2ackqXxeNPxupn4ewPQvTDPDyyf8drztnnEOj0gWBDUoRD3af?=
 =?iso-8859-1?Q?Gk9ccyIFxBuF2+XtuwE5kyufQD5ePL+s6w8IS+XddNKYkeTqXWbJD4yTEi?=
 =?iso-8859-1?Q?i2zZ7zsEga3sgp/hq/iZfokZCC/zYXxzWj5qxPJzCPvkCg/dO/C7bP6okx?=
 =?iso-8859-1?Q?qlZWz5JC3AWCYUu1zCOcMmMCis43VtBgxGbgPhY1uTuujYsqaTcPvopCjB?=
 =?iso-8859-1?Q?RXP1djfjknoog4gFoAh8OnUS8xCEs76ngYLnIgrg36Z45rgOuiiWMzqw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8515892c-f2a0-4f00-d6b6-08dcc0ef5584
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 08:08:54.7622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mYdY+1IYoon228hu6rtSO/g2F753Mb8IEfuMhbSKoc9x9y3bonq6R5b6T+WqrUDtprB/az1SSlb9N0nlEkj5TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7087
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 13.8% improvement of stress-ng.sockfd.ops_per_sec on:


commit: 53f408cad05bb987af860af22f4151e5a18e6ee8 ("hrtimers: Push pending hrtimers away from outgoing CPU earlier")
https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next

testcase: stress-ng
test machine: 256 threads 4 sockets INTEL(R) XEON(R) PLATINUM 8592+ (Emerald Rapids) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: sockfd
	cpufreq_governor: performance






Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240820/202408201523.11994461-oliver.sang@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-12/performance/x86_64-oc_stream_base_config/100%/debian-12-x86_64-20240206.cgz/lkp-emr-2sp1/sockfd/stress-ng/60s

commit: 
  c94c44685d ("scsi: sd: Fix sshdr use in sd_suspend_common()")
  53f408cad0 ("hrtimers: Push pending hrtimers away from outgoing CPU earlier")

c94c44685d801334 53f408cad05bb987af860af22f4 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     52019          +192.9%     152364 ±145%  vmstat.system.cs
    248.33 ±  7%     -19.9%     198.83 ± 16%  perf-c2c.DRAM.local
     11510 ±  2%     +20.0%      13813 ± 13%  perf-c2c.HITM.local
     25227           +17.0%      29523 ± 12%  perf-c2c.HITM.total
  46241536           +13.8%   52608779 ±  3%  stress-ng.sockfd.ops
    770583           +13.8%     876602 ±  3%  stress-ng.sockfd.ops_per_sec
    709901 ±  2%    +473.7%    4072397 ±177%  stress-ng.time.voluntary_context_switches
   2221056            +4.0%    2309588        proc-vmstat.numa_hit
   1824201            +4.8%    1912626        proc-vmstat.numa_local
   3416606           +10.0%    3757450        proc-vmstat.pgalloc_normal
   2811184           +12.0%    3147390        proc-vmstat.pgfree
 1.646e+10            +3.2%  1.699e+10        perf-stat.i.branch-instructions
  41247621 ±  2%      +7.5%   44359189 ±  2%  perf-stat.i.cache-misses
  89628939           +11.4%   99819592 ±  2%  perf-stat.i.cache-references
     54186          +182.9%     153293 ±141%  perf-stat.i.context-switches
     10.31            -3.2%       9.98        perf-stat.i.cpi
      3124           +19.5%       3733 ± 12%  perf-stat.i.cpu-migrations
     18733            -7.2%      17380 ±  2%  perf-stat.i.cycles-between-cache-misses
 7.027e+10            +3.9%  7.304e+10        perf-stat.i.instructions
      0.12            +3.0%       0.12        perf-stat.i.ipc
     10.43            -2.9%      10.13        perf-stat.overall.cpi
     17676 ±  2%      -5.7%      16664 ±  2%  perf-stat.overall.cycles-between-cache-misses
      0.10            +3.0%       0.10        perf-stat.overall.ipc
 1.606e+10            +2.4%  1.645e+10        perf-stat.ps.branch-instructions
 4.528e+11 ±223%    +422.8%  2.367e+12 ± 82%  perf-stat.ps.branch-misses
  40486476 ±  2%      +6.2%   42992791 ±  2%  perf-stat.ps.cache-misses
  87229061           +10.7%   96531559 ±  2%  perf-stat.ps.cache-references
     52859          +194.7%     155786 ±145%  perf-stat.ps.context-switches
      3038           +16.6%       3543 ±  8%  perf-stat.ps.cpu-migrations
  6.86e+10            +3.1%   7.07e+10        perf-stat.ps.instructions
 4.235e+12            +2.5%   4.34e+12        perf-stat.total.instructions
      0.16 ±  3%      -0.1        0.09 ±  8%  perf-profile.children.cycles-pp.free_uid
      0.22            -0.1        0.15 ±  9%  perf-profile.children.cycles-pp.__scm_destroy
      0.15            -0.1        0.09 ±  8%  perf-profile.children.cycles-pp.refcount_dec_not_one
      0.14 ±  3%      -0.0        0.10 ±  9%  perf-profile.children.cycles-pp.scm_detach_fds
      0.16 ±  3%      -0.0        0.12 ±  9%  perf-profile.children.cycles-pp.__scm_recv_common
      0.08            -0.0        0.05 ± 44%  perf-profile.children.cycles-pp.scm_fp_dup
      0.14 ±  2%      -0.0        0.13 ±  2%  perf-profile.children.cycles-pp.__scm_send
      0.11 ±  3%      +3.6        3.74 ±215%  perf-profile.children.cycles-pp.do_dentry_open
      0.11 ±  3%      +3.6        3.74 ±215%  perf-profile.children.cycles-pp.vfs_open
      0.06            +3.7        3.72 ±219%  perf-profile.children.cycles-pp.____fput
      0.06            +3.7        3.72 ±219%  perf-profile.children.cycles-pp.__fput
      0.08            +3.7        3.75 ±217%  perf-profile.children.cycles-pp.syscall
      0.08            +3.7        3.75 ±217%  perf-profile.children.cycles-pp.task_work_run
      0.18 ±  2%      +7.2        7.41 ±217%  perf-profile.children.cycles-pp.do_open
      0.00            +7.3        7.28 ±222%  perf-profile.children.cycles-pp.lockref_put_or_lock
      0.00            +7.3        7.29 ±221%  perf-profile.children.cycles-pp.dput
      0.31           +10.8       11.13 ±216%  perf-profile.children.cycles-pp.do_filp_open
      0.30           +10.8       11.13 ±216%  perf-profile.children.cycles-pp.path_openat
      0.35           +10.8       11.18 ±216%  perf-profile.children.cycles-pp.do_sys_openat2
      0.36           +10.8       11.19 ±215%  perf-profile.children.cycles-pp.__x64_sys_openat
      0.39           +10.8       11.22 ±215%  perf-profile.children.cycles-pp.open64
      0.15            -0.1        0.08 ±  8%  perf-profile.self.cycles-pp.refcount_dec_not_one
      0.07            -0.0        0.05        perf-profile.self.cycles-pp.__scm_send
     96.72            +0.1       96.81        perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

