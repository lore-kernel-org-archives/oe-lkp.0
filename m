Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A742594B5
	for <oe-lkp@lists.linux.dev>; Fri, 20 Dec 2024 03:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734665588; cv=fail; b=mGqQ1Zd7VhYFEvqJvQknAcKyFi/lNs6oJ7Br6qe4je7mG3SNPQRjNuR+jDvGnNdNFJS+oPFDoZeQoSQkVZ6VbExZ//LiY+qdeu0rRIk0K/ow/Ho/tglpg6T4Af2gTKk/AI1cj40LB6BIvHM9NbF7hS1nenghTrjOvyNP0DFjW9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734665588; c=relaxed/simple;
	bh=CaJavsw555oEFKn0F07KQlv6I3kI1ATP9khzaBsiPX0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Zz1SeQqy0+wv7t0kS087Ue1nzhqrA8utouk2cB4nE9nVyrkRn2yA4D6NGEKG+BoyUd22nbCcNi0XIaRP6IJs/A6GUNT9/Ac4g95HyfDVY/D5kMQHcrPKofcTaEmSsI4fgamKhra04h0uZQnmyhnZ9bAGz/CMJNVRrFzo7PRRZNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c56HS22Y; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c56HS22Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734665585; x=1766201585;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=CaJavsw555oEFKn0F07KQlv6I3kI1ATP9khzaBsiPX0=;
  b=c56HS22YGVYk4YY5HTnpWAMq1N9suQdH2yga2e0TOH51J8/FbGuwbClb
   PhTo1XjP/rKVV3gIYLLTFVbQQrahjxo3oAlKjAnTRK5JyhjfrcE08g+Jy
   bkaW6Ux7+DzfjFR7n1p1xpiSwryUzPzbqjuhUnwGqOkezhxkmp3YOfGgv
   DJDN3sriJEwN2NWmvQUL7eZbit7786lHmv9iXORwJLzj8OwsmJaK3Axx3
   7hVORG0uTq7UNdIR9XosdF7ExQCrZSxCICYBViQPldyoXUQqfWW5i+Ifz
   pnDZ8/njuartgeCzs4qFsGPqPVYQ4qUveQM6JrzOWuYGSHGk14tWOwVqd
   g==;
X-CSE-ConnectionGUID: YTs7s/lmRxStH4m4Bn4nMA==
X-CSE-MsgGUID: rnxqgihsSuqMjGDIhf5i3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="35101648"
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; 
   d="scan'208";a="35101648"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 19:33:05 -0800
X-CSE-ConnectionGUID: zBWdsKxGQlys4BfK79Pa5w==
X-CSE-MsgGUID: 8QPSCi6ATyqiGS6EDL2WHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="135714525"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 Dec 2024 19:33:05 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 19:33:05 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 19:33:05 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 19:33:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K1rPXD1mTM16BRlW9VfRtx4JKgBmsSJ4YmLaUNsc5m2oni+0E3fDafh1CBexM4YYpRSmkgzmKdkUaZSZz7rhAzF8KFe7edYs2yyUemEjnZMmTaFAgNJ53LmwGWhYpEaZJE508SD6UbHoKCHJGN+VZRgTYmGNua5KRC73Ct/XvczMU9WDMnCx3K8CgnZgQNLoh01DdO4fy+/EGDJf/3ft1LneVAZibO2I79oglSfLNYbLG59fta+hk125juSoJBtYoqSit0O9LJht71LcxyFfe62kLxNJXZZtPeMTLUaaHCT/pqEa+/3okKIO0NKR1iwtEobVzVjYgCoPs/q8sxZeSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ysu/RSP+GzmxAdiNGTvhXWZ0gHSu7ciA5JfNXUXRqd8=;
 b=TERjlvmUhjAoMA5aHw11SvqqlMH5dXXVL2/Exj4QIcj/aFYvkJoQKu/jMaRSWreo/JeAt+YdN3UYRDLb+nVmaPhIP12yAWIP/8DPvtP7Cm4W14ROsA9iOdTCMx/iGQbgv3NWxIKxHnsbgKsxN+x8/NJq98M8cFX3wT0kDDc1noqA5uSjV6qFjJUDL4GQSljZJSBdLqLx+ZCfxoC358puYHKcVCUuZoXHFBedE7E4QVQ4Dg+zumcpLDRk20jz5hNcZv3j2CrlzCntL7EbzlhMmA11/YqanG5YEpcoWU2B3igPeGkn1fCDlUv68UY842pqFy1N4Kpi5cBhs/tNt4PS7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CY8PR11MB7923.namprd11.prod.outlook.com (2603:10b6:930:7e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Fri, 20 Dec
 2024 03:32:14 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%6]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 03:32:14 +0000
Date: Fri, 20 Dec 2024 11:32:06 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [bigeasy-staging:futex_local_v4.5] [futex]  51319c5cb6:
 stress-ng.pthread.ops_per_sec 68.4% regression
Message-ID: <202412201111.1290bdf8-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0015.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::18) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CY8PR11MB7923:EE_
X-MS-Office365-Filtering-Correlation-Id: c78f4154-1a88-4126-707e-08dd20a6e520
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?2Q5ibsf1VuIOzOMrGUikgmGg7Ksr/3M1hRX3ChZmtqGmd2/fLnZ1U/bJoI?=
 =?iso-8859-1?Q?iXbvVIv2wY+4mQpjimkVEiG7hn1yOZkeqalfbk+BR9Z6HtWcrzRVCnIup1?=
 =?iso-8859-1?Q?TpGjSqEbMLnKbjVFDqQ+5N/Oue1ahgDtqLJTVWXZDycJToDm3BAgOlv+x/?=
 =?iso-8859-1?Q?uHRiu5wIyge/PBmIvtcvfuifob5zMH4UJ8dcYq7BDGsh0tr+6y1MWSa1PU?=
 =?iso-8859-1?Q?C/L5nqt+TmyE5aNFfmB5JmRdOT9ZIxAJRVGzZSCk+uIHLFthn2YHWWZkx2?=
 =?iso-8859-1?Q?dOx25leQ0ZXwD7fg7EJirLm+WS6OAuBEdRrEu97DnuA+RRgAX+9q9oizp+?=
 =?iso-8859-1?Q?jl0cDSmYeMtBHH08YQn36IeEdNNdWXXdt3dojsTReWxFXlD7F/XaBw7v7N?=
 =?iso-8859-1?Q?JgE63l4G/OSPezbo72kpoB5YofLWEC2gcil9vyOHYPIvs73R2ts1hTVBQs?=
 =?iso-8859-1?Q?aMsL0zyBPZrz9Lc30o30Pg00MW0DGHjFKE2BLr4sXCimYC9iI4F/YFqZKG?=
 =?iso-8859-1?Q?9uwvYInX5OzxvOsJujfhjPeupSsahIGxyUHkO3/o8yhkj0pqkwihkWBXbt?=
 =?iso-8859-1?Q?qcyPHSutR7pkcJx94OH6wJYanNQORumNCzQ30I1ER2Tc9z/Nm4cnzVSg9u?=
 =?iso-8859-1?Q?D2fw2rwIGnuSo+X870RlknhUvF8u3mPFYk+u7S4hkFwnPITUiB0SshnvgW?=
 =?iso-8859-1?Q?We1Qg4E7IrxLQSfvB/zlIMV4QGfNZe6jNbxms2pgd1wqVun5tI9wmpVqyE?=
 =?iso-8859-1?Q?hgU3HBS2a29nqYOO829UpSi6jhs2hc6BWxFsBdycITFMTKOsnaJLAMcdJ8?=
 =?iso-8859-1?Q?P/nIQ2wf2ZAgvNMJ5H5JvHNOcTsNfI6qSJ00nycoAlEIJqvBNOx2Gr9mV1?=
 =?iso-8859-1?Q?nZ0pdpAZS/v86AkQe6o6chcFTw6tvTYintwAPT29Gg0vIDvp9EVxKqYJpz?=
 =?iso-8859-1?Q?GHjfstMfT1qA6AbP28Yx2Mh2I42pv4eKZOWLAEYQcW0CrvribUfs5KzM4B?=
 =?iso-8859-1?Q?Bf7w0S1+OTum649a2Dnrow1zyizv8gHdHmP1Rqu8aOCY8Wsre2ndwKoL/I?=
 =?iso-8859-1?Q?2HU/xgfVMShd4xEviygHfsdUiSYSuoUL9BNvdkaWUAZzkv+xtImloj2cUQ?=
 =?iso-8859-1?Q?GMzFsaSEdu7Ku39M+8keqE3epdJhCW4Hwy1VpnYJeaH87ZrEfXEu9Z6YcO?=
 =?iso-8859-1?Q?Hf5AWVpffiIpU2L7LDxwSSolpni5Jm4zp5GSTr9mqUi3aEVOjfwYrb4bFm?=
 =?iso-8859-1?Q?u+HuiBxRbIX9ahrsb3/6XMSjXgOmWcfGhDWb36Qwr0pXvDjL59KRRBDZWO?=
 =?iso-8859-1?Q?SEWzUt9P9HOy4Nr0/rV0AS6KT//N67Zwr09JXBa7jlX9TiVOVoZUOGnRGG?=
 =?iso-8859-1?Q?Q7U7vJULcskOmjnuLNTpiz1DglyGOnB3t8cZNxrN2Ury2BiN/u5GTew5CC?=
 =?iso-8859-1?Q?5g+wuCyHy6WX7IfLri/HyYFUzTgTywoYCsHdwQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?2YKjb5sx/pPiFQAXngvjNAal/ioXjIFsetqUPuwg04VrOjV56ATDnrwHB4?=
 =?iso-8859-1?Q?VJFxmTaOIJcfoIkl2hAOtQwRJ22vx5pBt/o/hXk84D0iYWmQYbqHsuO3VO?=
 =?iso-8859-1?Q?WPlKPuT64Hm5W+YVgf8mxilqwsGZEkMpj8a/O8m+YOXnpno3SbIhnktpM8?=
 =?iso-8859-1?Q?H4KAMh1Ex8EYvS8s/CxPHJvmq9dntlDAKvqzaauAUU6URqz3XvKW+WtlD3?=
 =?iso-8859-1?Q?syZbpkXAkk/RnFceaB33XIdCUaPtdYyAE0JdLRAXmdZx3aQxNCZu1xKwez?=
 =?iso-8859-1?Q?ZVNzxwiwpYqYL2kwO8y2i7aaxnp5dW/9uCO8BB7uUGF/Hsjj/Y5qwbmnAD?=
 =?iso-8859-1?Q?zR+Rd5xdHFjFkYTMdE2FmCbSW1rzBzDMU5kwnkDGRPy6AZ3Z3oAfeOH1xO?=
 =?iso-8859-1?Q?c3LlZSroDWeCtcsyyvkR7mktx/cF+BKpOqxZbnI5q/xiYyDEGOOKpNUZwt?=
 =?iso-8859-1?Q?yWXZ9M/8BPaahD0keViswyytYwrwFeSszk+ngNXd9RZKeSr0A55s9+7XbQ?=
 =?iso-8859-1?Q?QDGu2RUawvPPbVgp6cWuo3n7ZnEZyhTARQexXgD3AoiP9lpd5Af4wSMzIk?=
 =?iso-8859-1?Q?tUpdO7qlyW28uup/l/YyPCjCiBcfgr2l7Z/tBIKYBwyLIHvsPm+7mnP4Q/?=
 =?iso-8859-1?Q?codZIWFbL4bLh8L3m4QYq6B2mTnBly9MUorIM9dM4zQR0hM+DpbHDpQAJu?=
 =?iso-8859-1?Q?uLNwK2z7jkyHlLeGeVM7bP7USmk9VEpZQirMrHI6cg9qWkvDK9x8+50Wd+?=
 =?iso-8859-1?Q?T2/i8DdveooywtqNdS0aov8oBGfcWJwHNaRSVRUDHb3SQ79rhqLHSgzE2g?=
 =?iso-8859-1?Q?Ltaf4mHmem+BiRq6EQj3BxhGC77lQrxcDVbZCyv4TFu2OqyVRxd523fw6v?=
 =?iso-8859-1?Q?Dc6H8OT8rodhbVXVSdFSnzZ97p/Tlsi1x2Cy4ECWOtotjLSp9DuyJtsbvl?=
 =?iso-8859-1?Q?H+wl/0Zo7Z5vw5m67cUtazDN2lSq2wp76Mt1EWdpGbBW+1fgae4PCo/jQt?=
 =?iso-8859-1?Q?tb8RQw1pUkG8g1+9gWsy8W/6ZktQms4HqXdYZqg/UkO9FEUDORym2zceFd?=
 =?iso-8859-1?Q?2aSoLdRBkI1T7gL4UOx32uapLfCcO+yCwFhDukqURG+6FqdbO8YmmG4ZTw?=
 =?iso-8859-1?Q?GMwptMnblBONNk/naVQVpHnjqkD6geiXJSZ306HKhgAGsXgecrhI/UAD30?=
 =?iso-8859-1?Q?IypBVfDdsNaV2c7XG7uuOnybuBqsLDCdnx8YIGUxUkLr81ySYJwyBC5qBb?=
 =?iso-8859-1?Q?4DsRod34/rqArai1rEaQLjH6NPTvaJmsLe65cStKcbiwEn/y9TPpG/Iu9g?=
 =?iso-8859-1?Q?U2u0OC78dfrYfMs3d2LKXwHpc/yMsH88V3sG7wtuGF016NOQ7aPyUu18Tb?=
 =?iso-8859-1?Q?icADGeOBOyXVmnoNGZA+AVThV2lENamJjM+0QNux7yYD5XWi3jZKkAdKkG?=
 =?iso-8859-1?Q?mK7rs992NNi2icltsiDMrxfvsnjENGu4NJZfGgeEi6WCTsIR3I4/Iw7bAz?=
 =?iso-8859-1?Q?dEfHHfz68Gqb/BnZzBMrTF1Im49GaAC6gdP68WBuO1ebSgTxggpxnB1cVy?=
 =?iso-8859-1?Q?eiy593KWsWLeRg1gTHHOZwuDLEb1BlYas3r94pMpE/F+riziqSkoghcQrf?=
 =?iso-8859-1?Q?cd3K9nDLWcS6kmp7M4ydkdk9LVa8WHnEWjikzyixGgApbxu1wVtSOKyg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c78f4154-1a88-4126-707e-08dd20a6e520
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 03:32:14.0632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +iL4PK8bIL9mVGXKh0IVx9waE/qUj/+kZ2KGLCqtHzlpX4vDZfmC1ksBdaMKUcvBHN5iuyOoUFJqGYY8B72xzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7923
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 68.4% regression of stress-ng.pthread.ops_per_sec on:


commit: 51319c5cb6c2f84994a14d11de0fc26321bed99d ("futex: Resize futex hash table based on number of threads.")
https://git.kernel.org/cgit/linux/kernel/git/bigeasy/staging.git futex_local_v4.5

testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: pthread
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+-----------------------------------------------------------------------------------------------+
| testcase: change | phoronix-test-suite: phoronix-test-suite.hmmer.0.seconds 1.1% improvement                     |
| test machine     | 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz (Cascade Lake) with 512G memory |
| test parameters  | cpufreq_governor=performance                                                                  |
|                  | test=hmmer-1.3.0                                                                              |
+------------------+-----------------------------------------------------------------------------------------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202412201111.1290bdf8-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241220/202412201111.1290bdf8-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-12/performance/x86_64-rhel-9.4/100%/debian-12-x86_64-20240206.cgz/lkp-spr-r02/pthread/stress-ng/60s

commit: 
  7ee6fb8b90 ("futex: Allow to make the number of slots invariant.")
  51319c5cb6 ("futex: Resize futex hash table based on number of threads.")

7ee6fb8b9098b494 51319c5cb6c2f84994a14d11de0 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
   6627322 ± 10%    +251.8%   23313668 ±  6%  cpuidle..usage
      1736 ±  5%   +3154.7%      56524        vmstat.procs.r
   1002783         +2452.7%   25598086        vmstat.system.cs
    771802            +6.1%     819086 ±  3%  vmstat.system.in
      0.52            +0.3        0.80 ±  3%  mpstat.cpu.all.irq%
      0.38 ±  5%      -0.1        0.31 ±  2%  mpstat.cpu.all.soft%
      1.93            -0.6        1.37 ±  2%  mpstat.cpu.all.usr%
      3.00          +946.7%      31.40 ± 47%  mpstat.max_utilization.seconds
  47826564           -63.6%   17393274        numa-numastat.node0.local_node
  47971208           -63.6%   17481098        numa-numastat.node0.numa_hit
  48725840           -56.2%   21335379        numa-numastat.node1.local_node
  48820666           -56.0%   21480221        numa-numastat.node1.numa_hit
     14704 ± 14%   +1161.9%     185562 ± 19%  perf-c2c.DRAM.local
      8884 ± 11%    +122.1%      19735 ± 22%  perf-c2c.DRAM.remote
     18619 ± 16%     +85.0%      34442 ± 16%  perf-c2c.HITM.local
     23012 ± 15%     +72.0%      39590 ± 17%  perf-c2c.HITM.total
    158127 ±  5%    +844.8%    1493924        stress-ng.pthread.nanosecs_to_start_a_pthread
  14216310           -68.3%    4502293        stress-ng.pthread.ops
    236217           -68.4%      74641        stress-ng.pthread.ops_per_sec
   6089793           +53.8%    9365827        stress-ng.time.involuntary_context_switches
  29592487           -62.3%   11154596        stress-ng.time.minor_page_faults
     12550           +65.4%      20762        stress-ng.time.percent_of_cpu_this_job_got
      7446           +67.5%      12474        stress-ng.time.system_time
    148.96           -22.7%     115.15 ±  4%  stress-ng.time.user_time
  32596229         +4863.2%  1.618e+09        stress-ng.time.voluntary_context_switches
 1.203e+09           +13.5%  1.366e+09        meminfo.Committed_AS
   1765877           +48.7%    2626290        meminfo.KernelStack
 2.375e+08           -12.3%  2.084e+08        meminfo.MemAvailable
 2.386e+08           -12.2%  2.094e+08        meminfo.MemFree
  25069098          +116.3%   54220471 ±  2%  meminfo.Memused
    600220           +11.1%     667063        meminfo.PageTables
   1554027         +1803.4%   29578809        meminfo.SUnreclaim
   1742425         +1609.4%   29784893        meminfo.Slab
   2087786           +39.8%    2919074        meminfo.VmallocUsed
  25723708          +121.6%   57009983 ±  2%  meminfo.max_used_kB
   5926603           -12.2%    5201076        proc-vmstat.nr_dirty_background_threshold
  11867698           -12.2%   10414870        proc-vmstat.nr_dirty_threshold
  59637204           -12.2%   52373165        proc-vmstat.nr_free_pages
   1768077           +47.7%    2611820 ±  2%  proc-vmstat.nr_kernel_stack
    151037           +10.1%     166306        proc-vmstat.nr_page_table_pages
     47080            +9.4%      51522 ±  2%  proc-vmstat.nr_slab_reclaimable
    390988         +1788.4%    7383371        proc-vmstat.nr_slab_unreclaimable
    511222 ±  9%    +165.0%    1354873 ±  4%  proc-vmstat.numa_hint_faults
    247485 ± 14%    +339.1%    1086767 ±  4%  proc-vmstat.numa_hint_faults_local
  96792237           -59.7%   38965430        proc-vmstat.numa_hit
  96552764           -59.9%   38732763        proc-vmstat.numa_local
    941658 ±  7%    +103.8%    1918950 ±  5%  proc-vmstat.numa_pte_updates
 1.006e+08          +226.2%   3.28e+08        proc-vmstat.pgalloc_normal
  30885650           -60.0%   12353268        proc-vmstat.pgfault
  96122369          +231.3%  3.185e+08        proc-vmstat.pgfree
   6602207 ± 13%     -30.1%    4612202 ± 25%  numa-meminfo.node0.Active
   6602207 ± 13%     -30.1%    4612202 ± 25%  numa-meminfo.node0.Active(anon)
   6714218 ± 12%     -43.0%    3828145 ± 30%  numa-meminfo.node0.FilePages
    869403 ±  2%     +61.0%    1399453 ±  7%  numa-meminfo.node0.KernelStack
 1.171e+08           -10.2%  1.051e+08        numa-meminfo.node0.MemFree
  14536244 ±  6%     +82.2%   26479857 ±  6%  numa-meminfo.node0.MemUsed
    299690 ±  4%     +19.1%     357071 ±  8%  numa-meminfo.node0.PageTables
    807013 ±  2%   +1742.8%   14871318        numa-meminfo.node0.SUnreclaim
   3325647 ± 25%     -72.0%     932404 ± 68%  numa-meminfo.node0.Shmem
    929664 ±  2%   +1512.6%   14991361        numa-meminfo.node0.Slab
   6263155 ± 13%     +40.0%    8770034 ± 16%  numa-meminfo.node1.Active
   6263155 ± 13%     +40.0%    8770034 ± 16%  numa-meminfo.node1.Active(anon)
   3258450 ± 22%    +105.0%    6678806 ± 23%  numa-meminfo.node1.FilePages
    889836 ±  3%     +37.2%    1220450 ±  7%  numa-meminfo.node1.KernelStack
 1.215e+08           -14.1%  1.044e+08        numa-meminfo.node1.MemFree
  10518712 ±  7%    +162.6%   27626797 ±  6%  numa-meminfo.node1.MemUsed
    752184 ±  3%   +1845.1%   14630586        numa-meminfo.node1.SUnreclaim
   3122767 ± 24%     +93.7%    6050307 ± 15%  numa-meminfo.node1.Shmem
    817807 ±  3%   +1699.5%   14716687        numa-meminfo.node1.Slab
   1649885 ± 13%     -30.4%    1148379 ± 24%  numa-vmstat.node0.nr_active_anon
   1681113 ± 12%     -43.0%     957709 ± 29%  numa-vmstat.node0.nr_file_pages
  29269344           -10.2%   26291832        numa-vmstat.node0.nr_free_pages
    875736 ±  4%     +59.5%    1396687 ±  7%  numa-vmstat.node0.nr_kernel_stack
    174604 ± 10%     -21.2%     137674 ± 19%  numa-vmstat.node0.nr_mapped
     74543 ±  4%     +19.0%      88714 ±  8%  numa-vmstat.node0.nr_page_table_pages
    833970 ± 25%     -72.0%     233774 ± 68%  numa-vmstat.node0.nr_shmem
    200505         +1753.1%    3715504        numa-vmstat.node0.nr_slab_unreclaimable
   1649883 ± 13%     -30.4%    1148372 ± 24%  numa-vmstat.node0.nr_zone_active_anon
  47972558           -63.6%   17481338        numa-vmstat.node0.numa_hit
  47827904           -63.6%   17393514        numa-vmstat.node0.numa_local
   1564782 ± 13%     +40.5%    2198813 ± 16%  numa-vmstat.node1.nr_active_anon
    819006 ± 22%    +105.1%    1679544 ± 23%  numa-vmstat.node1.nr_file_pages
  30387636           -14.1%   26098851        numa-vmstat.node1.nr_free_pages
    875763 ±  4%     +38.5%    1212808 ±  7%  numa-vmstat.node1.nr_kernel_stack
    785085 ± 24%     +93.9%    1522420 ± 15%  numa-vmstat.node1.nr_shmem
    186484 ±  3%   +1860.4%    3655787        numa-vmstat.node1.nr_slab_unreclaimable
   1564782 ± 13%     +40.5%    2198807 ± 16%  numa-vmstat.node1.nr_zone_active_anon
  48822084           -56.0%   21481434        numa-vmstat.node1.numa_hit
  48727258           -56.2%   21336593        numa-vmstat.node1.numa_local
      4.45          +142.1%      10.76        perf-stat.i.MPKI
  2.11e+10          +124.6%  4.738e+10        perf-stat.i.branch-instructions
      0.69            +0.1        0.81        perf-stat.i.branch-miss-rate%
 1.389e+08          +149.4%  3.465e+08        perf-stat.i.branch-misses
     38.81           +26.8       65.60        perf-stat.i.cache-miss-rate%
 4.202e+08          +490.4%  2.481e+09        perf-stat.i.cache-misses
  1.08e+09          +247.2%  3.751e+09        perf-stat.i.cache-references
   1032046         +2567.4%   27529155        perf-stat.i.context-switches
      6.56           -59.7%       2.65        perf-stat.i.cpi
    331767          +360.0%    1526105 ±  4%  perf-stat.i.cpu-migrations
      1470           -81.9%     266.14        perf-stat.i.cycles-between-cache-misses
 9.481e+10          +152.8%  2.396e+11        perf-stat.i.instructions
      0.16          +149.3%       0.39        perf-stat.i.ipc
     11.59         +1027.5%     130.68        perf-stat.i.metric.K/sec
    511111           -59.1%     209090        perf-stat.i.minor-faults
    742440           -62.1%     281069        perf-stat.i.page-faults
      6.59           -69.7%       1.99 ± 50%  perf-stat.overall.cpi
      1478           -86.5%     199.17 ± 50%  perf-stat.overall.cycles-between-cache-misses
    490890           -68.6%     154372 ± 50%  perf-stat.ps.minor-faults
    715995           -70.7%     209669 ± 50%  perf-stat.ps.page-faults
  19288614 ± 24%     -53.4%    8988794 ±  2%  sched_debug.cfs_rq:/.avg_vruntime.max
   2084347 ±  8%     +71.6%    3577758 ±  9%  sched_debug.cfs_rq:/.avg_vruntime.min
   1586306 ± 20%     -53.4%     739820 ±  5%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      1.81 ± 14%    +430.3%       9.61 ± 37%  sched_debug.cfs_rq:/.h_nr_running.avg
     36.33 ± 48%    +923.9%     372.00 ± 13%  sched_debug.cfs_rq:/.h_nr_running.max
      4.14 ± 31%    +909.7%      41.80 ± 24%  sched_debug.cfs_rq:/.h_nr_running.stddev
  11695168 ± 36%     -44.4%    6499344 ± 10%  sched_debug.cfs_rq:/.left_deadline.max
   2365150 ±  8%     -12.1%    2078148 ± 12%  sched_debug.cfs_rq:/.left_deadline.stddev
  11682476 ± 36%     -44.4%    6497263 ± 10%  sched_debug.cfs_rq:/.left_vruntime.max
   2364078 ±  8%     -12.1%    2077864 ± 12%  sched_debug.cfs_rq:/.left_vruntime.stddev
   1524013 ± 10%     -27.3%    1107410 ±  2%  sched_debug.cfs_rq:/.load.max
  19288614 ± 24%     -53.4%    8988852 ±  2%  sched_debug.cfs_rq:/.min_vruntime.max
   2084347 ±  8%     +71.6%    3577758 ±  9%  sched_debug.cfs_rq:/.min_vruntime.min
   1586307 ± 20%     -53.4%     739814 ±  5%  sched_debug.cfs_rq:/.min_vruntime.stddev
      4.98 ± 45%     +97.5%       9.83 ± 37%  sched_debug.cfs_rq:/.removed.runnable_avg.avg
    367.83 ± 20%     +80.1%     662.30 ± 18%  sched_debug.cfs_rq:/.removed.runnable_avg.max
     36.85 ± 29%     +77.8%      65.51 ± 26%  sched_debug.cfs_rq:/.removed.runnable_avg.stddev
  11682479 ± 36%     -44.4%    6497263 ± 10%  sched_debug.cfs_rq:/.right_vruntime.max
   2364086 ±  8%     -12.1%    2078765 ± 12%  sched_debug.cfs_rq:/.right_vruntime.stddev
    753.78 ±  8%    +229.0%       2480 ± 39%  sched_debug.cfs_rq:/.runnable_avg.avg
      8411 ± 46%    +636.9%      61984 ± 43%  sched_debug.cfs_rq:/.runnable_avg.max
    871.19 ± 32%    +765.9%       7543 ± 39%  sched_debug.cfs_rq:/.runnable_avg.stddev
      5.06 ±127%   +9495.6%     485.06 ±143%  sched_debug.cfs_rq:/.spread.avg
    862.98 ±160%  +11728.8%     102080 ±150%  sched_debug.cfs_rq:/.spread.max
     61.14 ±150%  +11099.1%       6846 ±149%  sched_debug.cfs_rq:/.spread.stddev
    394.27           -21.0%     311.61 ±  5%  sched_debug.cfs_rq:/.util_avg.avg
      1715 ± 33%     -27.8%       1237 ± 12%  sched_debug.cfs_rq:/.util_avg.max
    280.86 ±  9%     -18.2%     229.80 ±  7%  sched_debug.cfs_rq:/.util_avg.stddev
      1338 ± 23%    +126.0%       3025 ± 16%  sched_debug.cfs_rq:/.util_est.max
    221.61 ±  6%     +70.1%     376.99 ± 18%  sched_debug.cfs_rq:/.util_est.stddev
    171.01 ±  3%     -47.8%      89.30 ± 21%  sched_debug.cpu.clock.stddev
    394914 ±  9%     -85.2%      58515 ± 54%  sched_debug.cpu.curr->pid.avg
      1.81 ± 14%    +430.8%       9.63 ± 38%  sched_debug.cpu.nr_running.avg
     36.33 ± 48%    +920.3%     370.70 ± 14%  sched_debug.cpu.nr_running.max
      4.13 ± 31%    +911.8%      41.75 ± 24%  sched_debug.cpu.nr_running.stddev
    141577         +2513.8%    3700534        sched_debug.cpu.nr_switches.avg
    304773 ±  4%   +1358.2%    4444193        sched_debug.cpu.nr_switches.max
     85203 ± 16%   +2768.7%    2444199 ± 13%  sched_debug.cpu.nr_switches.min
     43599 ± 11%    +692.4%     345497 ± 17%  sched_debug.cpu.nr_switches.stddev
    499.92 ±  8%     -57.4%     212.80 ±  8%  sched_debug.cpu.nr_uninterruptible.max
   -448.00           -55.5%    -199.20        sched_debug.cpu.nr_uninterruptible.min
    172.83 ± 13%     -64.2%      61.85 ±  7%  sched_debug.cpu.nr_uninterruptible.stddev


***************************************************************************************************
lkp-csl-2sp7: 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz (Cascade Lake) with 512G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-9.4/debian-12-x86_64-phoronix/lkp-csl-2sp7/hmmer-1.3.0/phoronix-test-suite

commit: 
  7ee6fb8b90 ("futex: Allow to make the number of slots invariant.")
  51319c5cb6 ("futex: Resize futex hash table based on number of threads.")

7ee6fb8b9098b494 51319c5cb6c2f84994a14d11de0 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    114508            +4.1%     119226        proc-vmstat.nr_slab_unreclaimable
     92533            +4.4%      96622        vmstat.system.cs
    324428 ± 20%     +28.8%     417804 ± 10%  numa-meminfo.node1.Inactive
    324428 ± 20%     +28.8%     417804 ± 10%  numa-meminfo.node1.Inactive(file)
     81107 ± 20%     +28.8%     104444 ± 10%  numa-vmstat.node1.nr_inactive_file
     81107 ± 20%     +28.8%     104444 ± 10%  numa-vmstat.node1.nr_zone_inactive_file
    198.40            -1.1%     196.26        phoronix-test-suite.hmmer.0.seconds
    640.39            -1.1%     633.62        phoronix-test-suite.time.elapsed_time
    640.39            -1.1%     633.62        phoronix-test-suite.time.elapsed_time.max
      0.02 ± 10%     -22.8%       0.02 ± 16%  perf-sched.sch_delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
      0.04 ±  9%     -48.3%       0.02 ± 10%  perf-sched.sch_delay.avg.ms.futex_wait_queue.__futex_wait.futex_wait.do_futex
    114.18 ±  8%     -23.7%      87.13 ±  7%  perf-sched.total_wait_and_delay.average.ms
      8149 ±  9%     +32.0%      10754 ±  6%  perf-sched.total_wait_and_delay.count.ms
    114.16 ±  9%     -23.7%      87.08 ±  7%  perf-sched.total_wait_time.average.ms
     10.10 ± 15%     -57.1%       4.33 ±  9%  perf-sched.wait_and_delay.avg.ms.futex_wait_queue.__futex_wait.futex_wait.do_futex
      1291 ± 21%    +182.2%       3645 ±  7%  perf-sched.wait_and_delay.count.futex_wait_queue.__futex_wait.futex_wait.do_futex
     10.06 ± 15%     -57.2%       4.31 ±  9%  perf-sched.wait_time.avg.ms.futex_wait_queue.__futex_wait.futex_wait.do_futex
    346.16 ±213%     -96.6%      11.64 ±  4%  perf-sched.wait_time.max.ms.io_schedule.folio_wait_bit_common.filemap_update_page.filemap_get_pages
      0.00 ±  9%     -58.7%       0.00 ± 91%  sched_debug.cfs_rq:/system.slice/epmd.service.left_deadline.avg
      0.00 ±  9%     -58.7%       0.00 ± 91%  sched_debug.cfs_rq:/system.slice/epmd.service.left_deadline.max
      0.00 ±  9%     -58.7%       0.00 ± 91%  sched_debug.cfs_rq:/system.slice/epmd.service.left_deadline.min
      0.00 ±  9%     -58.7%       0.00 ± 91%  sched_debug.cfs_rq:/system.slice/epmd.service.left_vruntime.avg
      0.00 ±  9%     -58.7%       0.00 ± 91%  sched_debug.cfs_rq:/system.slice/epmd.service.left_vruntime.max
      0.00 ±  9%     -58.7%       0.00 ± 91%  sched_debug.cfs_rq:/system.slice/epmd.service.left_vruntime.min
      0.00 ±  9%     -58.7%       0.00 ± 91%  sched_debug.cfs_rq:/system.slice/epmd.service.right_vruntime.avg
      0.00 ±  9%     -58.7%       0.00 ± 91%  sched_debug.cfs_rq:/system.slice/epmd.service.right_vruntime.max
      0.00 ±  9%     -58.7%       0.00 ± 91%  sched_debug.cfs_rq:/system.slice/epmd.service.right_vruntime.min
      1.39 ±  9%     -58.7%       0.58 ± 91%  sched_debug.cfs_rq:/system.slice/epmd.service.se->load.weight.avg
      1.39 ±  9%     -58.7%       0.58 ± 91%  sched_debug.cfs_rq:/system.slice/epmd.service.se->load.weight.max
      1.39 ±  9%     -58.7%       0.58 ± 91%  sched_debug.cfs_rq:/system.slice/epmd.service.se->load.weight.min
      0.00 ±  5%      +8.7%       0.00 ±  4%  sched_debug.cpu.next_balance.stddev
     38.50            -0.5       38.00        perf-profile.calltrace.cycles-pp.forward_engine
     20.02            -0.5       19.53        perf-profile.calltrace.cycles-pp.p7_ViterbiFilter
      0.56            -0.0        0.54        perf-profile.calltrace.cycles-pp.p7_oprofile_Convert
     19.63            +1.1       20.72        perf-profile.calltrace.cycles-pp.common_startup_64
     18.32            +1.1       19.46 ±  2%  perf-profile.calltrace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
     19.23            +1.2       20.39 ±  2%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
     19.22            +1.2       20.38 ±  2%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
     19.27            +1.2       20.43 ±  2%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.common_startup_64
     19.38            +1.2       20.54 ±  2%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.common_startup_64
     19.38            +1.2       20.54 ±  2%  perf-profile.calltrace.cycles-pp.start_secondary.common_startup_64
     19.38            +1.2       20.54 ±  2%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.common_startup_64
     38.51            -0.5       38.00        perf-profile.children.cycles-pp.forward_engine
     20.03            -0.5       19.53        perf-profile.children.cycles-pp.p7_ViterbiFilter
      0.57            -0.0        0.55        perf-profile.children.cycles-pp.p7_oprofile_Convert
     18.55            +1.1       19.63        perf-profile.children.cycles-pp.intel_idle
     19.48            +1.1       20.57        perf-profile.children.cycles-pp.cpuidle_enter
     19.48            +1.1       20.57        perf-profile.children.cycles-pp.cpuidle_enter_state
     19.52            +1.1       20.61        perf-profile.children.cycles-pp.cpuidle_idle_call
     19.63            +1.1       20.72        perf-profile.children.cycles-pp.common_startup_64
     19.63            +1.1       20.72        perf-profile.children.cycles-pp.cpu_startup_entry
     19.63            +1.1       20.72        perf-profile.children.cycles-pp.do_idle
     19.38            +1.2       20.54 ±  2%  perf-profile.children.cycles-pp.start_secondary
     38.27            -0.5       37.76        perf-profile.self.cycles-pp.forward_engine
     19.90            -0.5       19.40        perf-profile.self.cycles-pp.p7_ViterbiFilter
      0.56            -0.0        0.54        perf-profile.self.cycles-pp.p7_oprofile_Convert
     18.55            +1.1       19.63        perf-profile.self.cycles-pp.intel_idle
 2.141e+10            +0.9%   2.16e+10        perf-stat.i.branch-instructions
     92864            +4.4%      96993        perf-stat.i.context-switches
 6.607e+10            +0.9%  6.665e+10        perf-stat.i.dTLB-loads
 1.889e+10            +0.9%  1.905e+10        perf-stat.i.dTLB-stores
   1366409            +1.2%    1382929        perf-stat.i.iTLB-load-misses
   2248980            +3.8%    2334182        perf-stat.i.iTLB-loads
 2.313e+11            +0.9%  2.333e+11        perf-stat.i.instructions
      1.81            +0.9%       1.82        perf-stat.i.ipc
    609.30            +1.4%     617.69        perf-stat.i.metric.K/sec
      1107            +0.9%       1117        perf-stat.i.metric.M/sec
    957746            -3.5%     923807        perf-stat.i.node-load-misses
     48.43            -2.9       45.55        perf-stat.i.node-store-miss-rate%
    348221           +14.9%     400034        perf-stat.i.node-stores
      0.52            -1.2%       0.52        perf-stat.overall.cpi
      0.00            -0.0        0.00        perf-stat.overall.dTLB-store-miss-rate%
     37.81            -0.6       37.21        perf-stat.overall.iTLB-load-miss-rate%
      1.91            +1.2%       1.93        perf-stat.overall.ipc
     47.94            -3.2       44.70        perf-stat.overall.node-store-miss-rate%
 2.141e+10            +0.9%   2.16e+10        perf-stat.ps.branch-instructions
     92840            +4.4%      96972        perf-stat.ps.context-switches
 6.606e+10            +0.9%  6.664e+10        perf-stat.ps.dTLB-loads
 1.888e+10            +0.9%  1.905e+10        perf-stat.ps.dTLB-stores
   2247841            +3.8%    2333256        perf-stat.ps.iTLB-loads
 2.313e+11            +0.9%  2.333e+11        perf-stat.ps.instructions
    957556            -3.6%     923556        perf-stat.ps.node-load-misses
    348081           +14.9%     399895        perf-stat.ps.node-stores





Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

