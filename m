Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D592D5C68
	for <oe-lkp@lists.linux.dev>; Tue,  9 Dec 2025 14:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765289340; cv=fail; b=DgJfb2s58mQHCIOMEPJXl7tnOzQNDyDJTSIOYB2tPIdJ+JlvIZHLqZABzoOwFqD299zNnKfzi7xY2RzO1TcIjV/pOBf2ymbRu2cckYZBVgWrt0MffMi4JCKGDGuvIZxbu/am8s+9/mX/quPS7NZMMCtGpvYO1wbhKwO+UKceBR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765289340; c=relaxed/simple;
	bh=mkY71+7oZ+SjVSKplACeAuls2pi0NZgF7oEi/Zc+iHU=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Pz9caEAw0s/V7xSpihhqMXsF76wqjd2QkGwHVS2vKJsXuGUliSqKAjofoT82IoZ9XBA8mugsm8GalpJ4c5C5Ny+LYVctQvy1OriIJi2FhaXN4jkI2Sx3F7SnJG41xqrJ6u0a2rxrGjgUWDP2OYuZNvm9SLr82PHixOtBDyRplqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SQrdbT3b; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SQrdbT3b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765289330; x=1796825330;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=mkY71+7oZ+SjVSKplACeAuls2pi0NZgF7oEi/Zc+iHU=;
  b=SQrdbT3ba3XiOdvHDf3MhjehtU8EoPbUn/xtO3d0Ti72+YFd+unob9PM
   EK/YqmarvDtv53PrA/dh6FejHlGHDR3E+7zFV/kNlxw6DlBQXg2oDIgfR
   7FoIvULW05X2PyxhlPcZme0abZgZiTH7yyPwyabCsJaGDQsz6SdrjGaH1
   C8Ly7P/NJ3neAVOLHCPR2pkhCrcvjrWJutFQD6JUbOuR23kvPSsH5yXYq
   3OBrs73qq0J78ENLV4iOFK7dbaBmRS9A4oX2R7qXvptXZ0ll7ftUeePRl
   ZuLHJZFGSGjqy/KoP2jesFjnePPgUpTTD9H7poC6gw4GLrr8jExxyDtsj
   Q==;
X-CSE-ConnectionGUID: 09vgZXy/T9mP7/0jfE6uSg==
X-CSE-MsgGUID: ZvNzmCFEQiG3TwU2cWCuCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="71103384"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="71103384"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 06:08:49 -0800
X-CSE-ConnectionGUID: U9ri2sanTmepRgIzEwD8kA==
X-CSE-MsgGUID: B+CH8tpmTiOxejMVycuEIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="200416473"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 06:08:49 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 06:08:48 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 06:08:48 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.34) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 06:08:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ymp9knDqDGKQvUGWl3Hbp0WGmWttUDeQUVxnLyHHZvY09JkBgvJURpdkMtrDxs2JpFb62OE3ekYNC7t9ZgY9o8PXKHPGi46afhe4hfQEChX6u8+e5JhSiF0SLLKyM0UXaQw1XxZ3hadUCZVstJgTrwK0qvOMiTHt1WKZO6UMKWGIFZWBfGowjvrIfeD8T7ZDmdKtVVMpFNoTzMKBsa12EVk8vmmUf4NxHCtwMsEfnSr/z3FPUNsy/5y9qOKAJq9h3jWYsMJDxBqDib8K1hFgUw3EA6VnpIfpyjLdPbp60iiqnifwQgaE40XsC5d8qtqsyh7dFtQhbjGcLCIURJ1rgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9i+Z5y/iEdj/Sc0UQ2miriJCxrwWkZuw24mVvjbNmQo=;
 b=RMEcxHkI5/1hx/4Y+i9Ova64J+0RewQaf63jQtk67hqnWStmKW1lqfrCQ1NPc4HC6d5BgfXVBvy3nqN511B8Dpe4JM2pEq2P5613LKjEmWPEuYWCZmkF3eMcpLa8+3YgmlF3k1DTRec/B26g+ZqKAQZ/9I5ksADedm0/9YC7YOY//GvpPCP1i6wyztzz4/RLb1HIsfO9Vw+tbbVIjmSxWMfn5bqsNBbT8C8u5UzJaQvGW7hJvv64j01xxezYvsUt+aK+23tPrAWwRhEznTCxtqiseEnpM4BXc8bj14RwRSPtFnlYI5g/maDUont7d2l/rVh8MksCHTDGyMlrWU+Hzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CH3PR11MB8362.namprd11.prod.outlook.com (2603:10b6:610:175::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Tue, 9 Dec
 2025 14:08:43 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9412.005; Tue, 9 Dec 2025
 14:08:43 +0000
Date: Tue, 9 Dec 2025 22:08:31 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Mel Gorman <mgorman@techsingularity.net>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, <aubrey.li@linux.intel.com>,
	<yu.c.chen@intel.com>, <oliver.sang@intel.com>
Subject: [linus:master] [sched/fair]  e837456fdc:  netperf.Throughput_Mbps
 47.0% regression
Message-ID: <202512091444.3c9d880d-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KL1P15301CA0042.APCP153.PROD.OUTLOOK.COM
 (2603:1096:820:6::30) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CH3PR11MB8362:EE_
X-MS-Office365-Filtering-Correlation-Id: d46d634a-87b5-4ee7-7b93-08de372c7541
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?/6P6ZE5MfNdLLExTv88Pk92V+QUiwFd2zb1SroYM9/3+rgb+K+UyYUC+nd?=
 =?iso-8859-1?Q?HcLg4pPA5TLcbuPwPsYmRrr08Ho7VLCudFhA/DJOmz9b2OPiHjJ3l76iBM?=
 =?iso-8859-1?Q?oZy59u0Yp01K5X0jrkyXPNZf4IjpKCnkQV5z/fie1G93as6YjE8E1TqfHd?=
 =?iso-8859-1?Q?NQWaerwUfiVlUvogG9Toxc2FWnauRJFXdLHB0I3ut60C2Krcy1dXqRAIg+?=
 =?iso-8859-1?Q?2zNernXySt/MQp8bAZLGZtqrVRua+FfEndVGv81vWt49A5aI0bg3Bn5p3R?=
 =?iso-8859-1?Q?xMbFKiiwdZubwSo3rlq+JxyGD3fQaJL5oiGw3REBvInJwTqxX4np67iUqB?=
 =?iso-8859-1?Q?eGFPQlChfgY6WFI+OKaF/y6pQDjlPu1H7pzgYSxPjKmdywKaGYOmCDuRL6?=
 =?iso-8859-1?Q?J0r4V1T8Tu0peGpQXg1h3qmGCSZdRY0FvElEaPP9RgBl3Cf7edUSvjSkZE?=
 =?iso-8859-1?Q?fJPCgNGThcp3ZQT4fFKAsIArfzbG2LPpc9y1MWf07e31xgFBo8+cScJWBU?=
 =?iso-8859-1?Q?z31IQMf14l9wWZIMqofQSXiAkMP2PIQlZfTCkh78u+wuKw/3/ounke9cJc?=
 =?iso-8859-1?Q?+mVR1vvDpn3WtzVGIrL0Yowf9DoUy7xHLx/g7xqNmVceh5rYmnZR2lyPdx?=
 =?iso-8859-1?Q?V4z16bwmQPxMg9t6ExfgkSG8D5tjhmHB7MYwLz4P/xS2mZet91tU1nBdXF?=
 =?iso-8859-1?Q?niletbZzXkij6mdSyxnFMCoRUcJH/7Hcrt9/zLf+0GkCuGW6+rqSSJn7xv?=
 =?iso-8859-1?Q?4Mx09AU5MGWkT3D+t8XpHU/HC37kS6wrWZ+ODYk8a2w8PTLvW3hdOD55Nd?=
 =?iso-8859-1?Q?/+pGXTETapuNqPx9fZCUgcRNij9ifq+CrtbLmHjR4kmuLONHyE15jr0DdD?=
 =?iso-8859-1?Q?/M+GbfF65DUMuFBSB13cbGoz9cX4rrSbfNAOHt7BsaSiuWM00/KWHa3u4Z?=
 =?iso-8859-1?Q?k3iRH8RpbsvLTMinFvE5ad6nwYq+0X8eT8+TtjatPhECchnEXIlM9CfGKc?=
 =?iso-8859-1?Q?s3+NF+flI8YJb9v5zwltUwnB/Tcp56q15ka4+f2R7Met7TEk1gLMcs1f3+?=
 =?iso-8859-1?Q?BRN0KW7Pbol/LYcADe/A3ITyETK8h5giXM2Z9yekuNgUq6RS5Ftwa0IQiT?=
 =?iso-8859-1?Q?HcEO/wnNl63Nl7sMIicnqfQZQLoOdBQFteoTi/EtLqM3YDID5V6Q6p++Lk?=
 =?iso-8859-1?Q?3uE6pT/HUXGoKTH7LOwf1rxwZMrapmUZ8qfye67lC5toEHUCEucmwdN68T?=
 =?iso-8859-1?Q?QwtwV6RLLKurl8++6E+T0wWGLLUMZ78S7Ptx0/cxeCttZ88Pc+OATi0Ttu?=
 =?iso-8859-1?Q?Kqwaoqh6gcQvOTcVKBOlANv/+UstX0E0vEdUmaMyNP69ockEKCks4L8ogl?=
 =?iso-8859-1?Q?OJzASz+Xa0Jxu/HHdexeAMC/nfBWPDtTTqIZepvbyYJKnN0p8fxOvjXQZA?=
 =?iso-8859-1?Q?vF85EIWU7sXXM3fFF8o21Qai8UEoGwAi5mhPgeplmwl+b1LF0ibq9L+/3r?=
 =?iso-8859-1?Q?vtbM4JRh21jv17HpDybx5SqwNDnDteLOSUW5IZGX7Qdw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?RRXP5WHb2UALtE4a5Ve1I60HrzMXNafBivmyvpbV/dMXjDJE9lUPBBar5e?=
 =?iso-8859-1?Q?xNacUPdmxC/Tmnx5UCWOmvsrt2Wqp0zJgnHgZkke2PDIjYJsFiHjuegcVU?=
 =?iso-8859-1?Q?z6VOS37Cr95buutt5ZC3ljP3cgYIDnzrAtkDQucvfd+9IBsm/jAn25Ojch?=
 =?iso-8859-1?Q?i1KfXEJf8cmmkKxRWy2CoUcnxfdcWY1OlVasRCXr3o4L20L/FqqBPFcr1X?=
 =?iso-8859-1?Q?PkucRUYT1dUWi65nNS/JTD+VfzAe403a4nuPO4/5V/eXNgbQf3ZAX9ojqA?=
 =?iso-8859-1?Q?sM0+kQtmtMIs8QQ59z9SibwTvbbgqRab40r2KK2nP1pYOz7vZ/X+1znqAJ?=
 =?iso-8859-1?Q?c6Q8eHL+GuYiWDvZzip9qc8BIGue6Riz4IxOwA7GG0et+T7cVTdmRTeT7J?=
 =?iso-8859-1?Q?RYzrN5xKgtAEUmFRNSRZsU6vZhd564CveSyfw3R2imEADU62AXuKBgGHRi?=
 =?iso-8859-1?Q?H/20AWUKlcjqN9EiOhj9HRBwCiwqMEWoA+38ACQGILKde0RyJwYZu3iHcv?=
 =?iso-8859-1?Q?7yg01DjrVaonyU+2x02+orL4jeVcyv1wbCKANyevQJ0qgTWR8pMH/85iIy?=
 =?iso-8859-1?Q?AS5yxLvJlr9vyA1Zbbj+S7wx2gUUBjdjAXpunthD4gczLs7y5T6TnTPZMe?=
 =?iso-8859-1?Q?CCYythXtvy2DQYpR/p5VeTwHi5gTcOjtppS/Kzwf3em5dgAUw3g2kn7Flk?=
 =?iso-8859-1?Q?lzCFHiTteGM1jW/e8MtWY9zM586s4pJ2s1cgI6uwKkDEIOQQqvLzyThFQI?=
 =?iso-8859-1?Q?/FHuR/0cF4s7NsOTl/qBK+2w+fY/Fcw954mto68bSP8zBJVHgWJl3lB1Ts?=
 =?iso-8859-1?Q?DyGUGAbrpvGWb3hqBaeycj4kVEQX8loz64XPZljGiygresysvcTmjrPsh3?=
 =?iso-8859-1?Q?Wnk5PQZZHICC3BJ9n5oNQS6G5T4pkQ9vxc6j/1ZrNZkmt+pG/WLcyyaNux?=
 =?iso-8859-1?Q?TMUXpQIwN5f7nLu3PL1Ez1w8alACEcmfenXIrYLXJufmPgEYIUBo21/wht?=
 =?iso-8859-1?Q?LO0852PfXZRWA6IfaFj2ZKZdQrs439njiV38rlRoPxByIG5XDewdZ0h5CF?=
 =?iso-8859-1?Q?RuUGmdqPiPc3EcdwKj8SU/LyE3HVEndfN8QBOBrK+DI2uMIrgbXhUDvX+0?=
 =?iso-8859-1?Q?6CLuhsuI+V9pNIk/WVMGBoDmEmqxMo+v6HdptWNs4vk71+HgT5IR1Hs4Sg?=
 =?iso-8859-1?Q?PqDtyQgiJDOC2hRGB3Rhr14n0CkdT3q1gFP7lf6fvLGW79SUyEBlgyJLJZ?=
 =?iso-8859-1?Q?6boEH5fNaDtN8rBS4PR2g60zN7kGAjnVYNJzApovqa8O8svTEmwj8sAweI?=
 =?iso-8859-1?Q?CDB1bRqHEOAnIwysXXLbAU3WEfFbxeNDIEGhLO3ph/xHihUyjtcERkBFsL?=
 =?iso-8859-1?Q?KwmggBZkDyzNdrH9oCJuZ28yWdN9ZHwDIwsTKAO+0poeR1tWpnxDPXTnFm?=
 =?iso-8859-1?Q?CdvOi9bXIuRpTsUJLr7QI9Wi7g1ju4Zd3ERHOJ+znCjjvLV0TLqF/9vl7s?=
 =?iso-8859-1?Q?X7Izqlhzv+tleQN1Sy3rQVNQ61uRIHJJjNz57elGEIwi+MXnpgOvweFAws?=
 =?iso-8859-1?Q?OnhndGxI6lVg2Li85Ygcjj7/NLZs7aQx9u6wh0Zu8h5b//NuS2dP69DoQC?=
 =?iso-8859-1?Q?9FhwUfl7OFMGa4aW7PtvDN1ysHgk5CsXaZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d46d634a-87b5-4ee7-7b93-08de372c7541
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 14:08:42.9837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G+pFv5gkHJtxrZzt0FwxzQ8Hqch8wI7hpFsA+xEtJ010x8l5dxBBo42IZnKWRkIKXmdc2pxjYVtu2JxV/XqfNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8362
X-OriginatorOrg: intel.com



Hello,

for this commit, we reported both improvement and regression before:
https://lore.kernel.org/all/202511211403.39a71f1e-lkp@intel.com/
https://lore.kernel.org/all/202511242155.286a5a75-lkp@intel.com/

now the commit is merged in mainline, we captured it as the 'first-bad-commit'
in more micro-benchmark tests, still both improvement and regression.

we just want to supply more information here, in case somebody has interest
to dig further. below full report FYI.


kernel test robot noticed a 47.0% regression of netperf.Throughput_Mbps on:


commit: e837456fdca81899a3c8e47b3fd39e30eae6e291 ("sched/fair: Reimplement NEXT_BUDDY to align with EEVDF goals")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[still regression on linus/master      c2f2b01b74be8b40a2173372bcd770723f87e7b2]
[still regressoin on linux-next/master 82bcd04d124a4d84580ea4a8ba6b120db5f512e7]

testcase: netperf
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 256 threads 2 sockets Intel(R) Xeon(R) 6767P  CPU @ 2.4GHz (Granite Rapids) with 256G memory
parameters:

	ip: ipv4
	runtime: 300s
	nr_threads: 200%
	cluster: cs-localhost
	test: TCP_MAERTS
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+-----------------------------------------------------------------------------------------------+
| testcase: change | netperf: netperf.Throughput_Mbps  45.9% regression                                            |
| test machine     | 256 threads 2 sockets Intel(R) Xeon(R) 6767P  CPU @ 2.4GHz (Granite Rapids) with 256G memory  |
| test parameters  | cluster=cs-localhost                                                                          |
|                  | cpufreq_governor=performance                                                                  |
|                  | ip=ipv4                                                                                       |
|                  | nr_threads=200%                                                                               |
|                  | runtime=300s                                                                                  |
|                  | test=TCP_STREAM                                                                               |
+------------------+-----------------------------------------------------------------------------------------------+
| testcase: change | netperf: netperf.Throughput_Mbps 62.8% improvement                                            |
| test machine     | 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory     |
| test parameters  | cluster=cs-localhost                                                                          |
|                  | cpufreq_governor=performance                                                                  |
|                  | ip=ipv4                                                                                       |
|                  | nr_threads=200%                                                                               |
|                  | runtime=300s                                                                                  |
|                  | test=UDP_STREAM                                                                               |
+------------------+-----------------------------------------------------------------------------------------------+
| testcase: change | pts: pts.memcached.1:100.ops_sec 50.3% improvement                                            |
| test machine     | 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz (Cascade Lake) with 512G memory |
| test parameters  | cpufreq_governor=performance                                                                  |
|                  | option_a=1:100                                                                                |
|                  | test=memcached-1.2.0                                                                          |
+------------------+-----------------------------------------------------------------------------------------------+
| testcase: change | stress-ng: stress-ng.flock.ops_per_sec  6.2% regression                                       |
| test machine     | 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory     |
| test parameters  | cpufreq_governor=performance                                                                  |
|                  | disk=1HDD                                                                                     |
|                  | fs=xfs                                                                                        |
|                  | nr_threads=100%                                                                               |
|                  | test=flock                                                                                    |
|                  | testtime=60s                                                                                  |
+------------------+-----------------------------------------------------------------------------------------------+
| testcase: change | schbench: schbench.request_latency_max_us 84.5% regression                                    |
| test machine     | 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory   |
| test parameters  | cpufreq_governor=performance                                                                  |
|                  | iterations=3x                                                                                 |
|                  | message_threads=10%                                                                           |
|                  | runtime=300s                                                                                  |
|                  | worker_threads=128                                                                            |
+------------------+-----------------------------------------------------------------------------------------------+
| testcase: change | hackbench: hackbench.throughput  14.6% regression                                             |
| test machine     | 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory   |
| test parameters  | cpufreq_governor=performance                                                                  |
|                  | ipc=socket                                                                                    |
|                  | iterations=4                                                                                  |
|                  | mode=threads                                                                                  |
|                  | nr_threads=50%                                                                                |
+------------------+-----------------------------------------------------------------------------------------------+
| testcase: change | stress-ng: stress-ng.seccomp.ops_per_sec 44.8% improvement                                    |
| test machine     | 256 threads 2 sockets Intel(R) Xeon(R) 6767P  CPU @ 2.4GHz (Granite Rapids) with 256G memory  |
| test parameters  | cpufreq_governor=performance                                                                  |
|                  | nr_threads=100%                                                                               |
|                  | test=seccomp                                                                                  |
|                  | testtime=60s                                                                                  |
+------------------+-----------------------------------------------------------------------------------------------+
| testcase: change | stress-ng: stress-ng.vma.ops_per_sec  15.7% regression                                        |
| test machine     | 192 threads 2 sockets Intel(R) Xeon(R) 6740E  CPU @ 2.4GHz (Sierra Forest) with 256G memory   |
| test parameters  | cpufreq_governor=performance                                                                  |
|                  | nr_threads=100%                                                                               |
|                  | test=vma                                                                                      |
|                  | testtime=60s                                                                                  |
+------------------+-----------------------------------------------------------------------------------------------+
| testcase: change | stress-ng: stress-ng.clock.ops_per_sec  3.4% regression                                       |
| test machine     | 256 threads 2 sockets Intel(R) Xeon(R) 6768P  CPU @ 2.4GHz (Granite Rapids) with 64G memory   |
| test parameters  | cpufreq_governor=performance                                                                  |
|                  | nr_threads=100%                                                                               |
|                  | test=clock                                                                                    |
|                  | testtime=60s                                                                                  |
+------------------+-----------------------------------------------------------------------------------------------+
| testcase: change | pts: pts.quadray.1.1080p.fps 23.2% improvement                                                |
| test machine     | 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz (Cascade Lake) with 512G memory |
| test parameters  | cpufreq_governor=performance                                                                  |
|                  | need_x=true                                                                                   |
|                  | option_a=5                                                                                    |
|                  | option_b=1080p                                                                                |
|                  | test=quadray-1.0.0                                                                            |
+------------------+-----------------------------------------------------------------------------------------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202512091444.3c9d880d-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20251209/202512091444.3c9d880d-lkp@intel.com

=========================================================================================
cluster/compiler/cpufreq_governor/ip/kconfig/nr_threads/rootfs/runtime/tbox_group/test/testcase:
  cs-localhost/gcc-14/performance/ipv4/x86_64-rhel-9.4/200%/debian-13-x86_64-20250902.cgz/300s/lkp-gnr-2sp3/TCP_MAERTS/netperf

commit: 
  aceccac58a ("sched/fair: Enable scheduler feature NEXT_BUDDY")
  e837456fdc ("sched/fair: Reimplement NEXT_BUDDY to align with EEVDF goals")

aceccac58ad76305 e837456fdca81899a3c8e47b3fd 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
   1598446 ± 14%     +46.0%    2333081 ± 15%  cpuidle..usage
     13.40 ±  5%      -8.6        4.84 ±  4%  mpstat.cpu.all.soft%
     83.93            +9.3       93.24        mpstat.cpu.all.sys%
      1.37 ±  7%      -0.7        0.65 ±  5%  mpstat.cpu.all.usr%
     18202 ±  6%     +66.8%      30368 ± 16%  perf-c2c.DRAM.local
     19625 ±  4%     +35.0%      26499 ± 10%  perf-c2c.HITM.local
     21129 ±  5%     +33.0%      28110 ± 10%  perf-c2c.HITM.total
 1.096e+09 ± 17%     -30.4%  7.633e+08        numa-numastat.node0.local_node
 1.096e+09 ± 17%     -30.4%  7.633e+08        numa-numastat.node0.numa_hit
 1.255e+09 ± 14%     -39.6%  7.573e+08        numa-numastat.node1.local_node
 1.255e+09 ± 14%     -39.6%  7.575e+08        numa-numastat.node1.numa_hit
      3546            +1.5%       3600        turbostat.Bzy_MHz
      0.32 ±  6%     -60.0%       0.13        turbostat.IPC
    694.85            -1.5%     684.10        turbostat.PkgWatt
     36.37 ±  2%     +22.0%      44.37 ±  3%  turbostat.RAMWatt
   5142303 ± 11%     -35.7%    3308567        meminfo.Active
   5142286 ± 11%     -35.7%    3308551        meminfo.Active(anon)
   7620103 ±  7%     -22.8%    5881893        meminfo.Cached
   5588116 ± 10%     -32.8%    3754898        meminfo.Committed_AS
   1861051 ± 20%     -51.1%     909816 ± 16%  meminfo.Mapped
  12643696 ±  5%     -13.6%   10930197 ±  2%  meminfo.Memused
   3969568 ± 14%     -43.8%    2231357 ±  2%  meminfo.Shmem
  12847854 ±  4%     -13.2%   11150669        meminfo.max_used_kB
    374834 ± 24%    +163.4%     987448 ± 30%  numa-meminfo.node0.Active
    374825 ± 24%    +163.4%     987441 ± 30%  numa-meminfo.node0.Active(anon)
      9135 ± 27%   +4238.7%     396372 ± 75%  numa-meminfo.node0.Shmem
   4768498 ± 11%     -51.3%    2320618 ± 10%  numa-meminfo.node1.Active
   4768491 ± 11%     -51.3%    2320609 ± 10%  numa-meminfo.node1.Active(anon)
    351570 ± 21%     -51.5%     170408 ± 72%  numa-meminfo.node1.AnonHugePages
    951006 ± 10%     -42.6%     546286 ± 41%  numa-meminfo.node1.AnonPages.max
   1847754 ± 20%     -63.4%     676397 ± 34%  numa-meminfo.node1.Mapped
   3961311 ± 14%     -53.7%    1834235 ± 14%  numa-meminfo.node1.Shmem
      4897 ±  4%     -47.0%       2597        netperf.ThroughputBoth_Mbps
   2507618 ±  4%     -47.0%    1329802        netperf.ThroughputBoth_total_Mbps
      4897 ±  4%     -47.0%       2597        netperf.Throughput_Mbps
   2507618 ±  4%     -47.0%    1329802        netperf.Throughput_total_Mbps
   2076823 ± 16%     -91.3%     180999 ± 10%  netperf.time.involuntary_context_switches
      6264            +5.8%       6627        netperf.time.percent_of_cpu_this_job_got
     18680            +7.4%      20071        netperf.time.system_time
    307.76 ±  5%     -87.1%      39.73 ±  3%  netperf.time.user_time
 2.101e+09 ±  7%     -99.1%   18669943        netperf.time.voluntary_context_switches
 5.739e+09 ±  4%     -47.0%  3.044e+09        netperf.workload
     93701 ± 24%    +163.4%     246853 ± 30%  numa-vmstat.node0.nr_active_anon
      2283 ± 27%   +4239.7%      99100 ± 75%  numa-vmstat.node0.nr_shmem
     93701 ± 24%    +163.4%     246853 ± 30%  numa-vmstat.node0.nr_zone_active_anon
 1.096e+09 ± 17%     -30.4%  7.633e+08        numa-vmstat.node0.numa_hit
 1.096e+09 ± 17%     -30.4%  7.633e+08        numa-vmstat.node0.numa_local
   1191967 ± 11%     -51.3%     580540 ± 10%  numa-vmstat.node1.nr_active_anon
    171.62 ± 21%     -51.5%      83.27 ± 72%  numa-vmstat.node1.nr_anon_transparent_hugepages
    461580 ± 20%     -63.3%     169207 ± 34%  numa-vmstat.node1.nr_mapped
    990171 ± 14%     -53.6%     458979 ± 14%  numa-vmstat.node1.nr_shmem
   1191966 ± 11%     -51.3%     580540 ± 10%  numa-vmstat.node1.nr_zone_active_anon
 1.255e+09 ± 14%     -39.6%  7.575e+08        numa-vmstat.node1.numa_hit
 1.255e+09 ± 14%     -39.6%  7.573e+08        numa-vmstat.node1.numa_local
   1285377 ± 10%     -35.7%     826978        proc-vmstat.nr_active_anon
    294171            -8.1%     270295        proc-vmstat.nr_anon_pages
   1904855 ±  7%     -22.8%    1470324        proc-vmstat.nr_file_pages
    463998 ± 20%     -51.0%     227291 ± 16%  proc-vmstat.nr_mapped
    992220 ± 14%     -43.8%     557689 ±  2%  proc-vmstat.nr_shmem
     47193            -2.0%      46246        proc-vmstat.nr_slab_reclaimable
   1285377 ± 10%     -35.7%     826978        proc-vmstat.nr_zone_active_anon
 2.351e+09 ±  3%     -35.3%  1.521e+09        proc-vmstat.numa_hit
 2.351e+09 ±  3%     -35.3%  1.521e+09        proc-vmstat.numa_local
 1.877e+10 ±  3%     -35.3%  1.214e+10        proc-vmstat.pgalloc_normal
   1507834 ±  4%      -9.1%    1370206 ±  2%  proc-vmstat.pgfault
 1.877e+10 ±  3%     -35.3%  1.214e+10        proc-vmstat.pgfree
  40155285 ±  2%     +18.0%   47383779 ±  4%  sched_debug.cfs_rq:/.avg_vruntime.avg
  54921439 ±  5%     +22.8%   67460414 ±  5%  sched_debug.cfs_rq:/.avg_vruntime.max
      0.05 ± 15%     +42.3%       0.07 ± 18%  sched_debug.cfs_rq:/.nr_queued.stddev
    412.47 ± 14%     -27.3%     299.94 ± 28%  sched_debug.cfs_rq:/.util_avg.min
  40138229 ±  2%     +17.9%   47329219 ±  4%  sched_debug.cfs_rq:/.zero_vruntime.avg
  54910963 ±  5%     +22.8%   67405218 ±  5%  sched_debug.cfs_rq:/.zero_vruntime.max
     91.56 ±  4%     -26.4%      67.36 ±  4%  sched_debug.cpu.clock.stddev
      5309 ± 41%     -79.5%       1086 ± 41%  sched_debug.cpu.clock_task.stddev
      0.00 ±  3%     -25.5%       0.00 ±  4%  sched_debug.cpu.next_balance.stddev
   8352108 ±  9%     -99.1%      72458 ±  2%  sched_debug.cpu.nr_switches.avg
  17635518 ±  7%     -99.2%     144211 ± 10%  sched_debug.cpu.nr_switches.max
   1636650 ± 52%     -96.8%      52839 ±  3%  sched_debug.cpu.nr_switches.min
   4328702 ± 33%     -99.8%      10406 ± 22%  sched_debug.cpu.nr_switches.stddev
      0.75 ± 23%    +468.2%       4.26 ±  3%  perf-sched.sch_delay.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      4737 ± 13%     -94.3%     270.98 ±126%  perf-sched.sch_delay.max.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      0.75 ± 23%    +468.2%       4.26 ±  3%  perf-sched.total_sch_delay.average.ms
      4737 ± 13%     -94.3%     270.98 ±126%  perf-sched.total_sch_delay.max.ms
      2.62 ± 22%    +520.6%      16.29 ±  4%  perf-sched.total_wait_and_delay.average.ms
   3723014 ± 22%     -84.3%     582932 ±  5%  perf-sched.total_wait_and_delay.count.ms
      8204 ± 30%     -43.1%       4671 ±  7%  perf-sched.total_wait_and_delay.max.ms
      1.87 ± 22%    +541.5%      12.03 ±  4%  perf-sched.total_wait_time.average.ms
      5575 ± 10%     -16.2%       4670 ±  7%  perf-sched.total_wait_time.max.ms
      2.62 ± 22%    +520.6%      16.29 ±  4%  perf-sched.wait_and_delay.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
   3723014 ± 22%     -84.3%     582932 ±  5%  perf-sched.wait_and_delay.count.[unknown].[unknown].[unknown].[unknown].[unknown]
      8204 ± 30%     -43.1%       4671 ±  7%  perf-sched.wait_and_delay.max.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      1.87 ± 22%    +541.5%      12.03 ±  4%  perf-sched.wait_time.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      5575 ± 10%     -16.2%       4670 ±  7%  perf-sched.wait_time.max.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      3.43 ±  3%    +265.7%      12.55 ±  4%  perf-stat.i.MPKI
 5.748e+10 ±  4%     -56.5%  2.501e+10        perf-stat.i.branch-instructions
      0.36            -0.2        0.18        perf-stat.i.branch-miss-rate%
 2.038e+08 ±  5%     -77.9%   45080938        perf-stat.i.branch-misses
     17.25 ±  4%      +4.7       21.93 ±  3%  perf-stat.i.cache-miss-rate%
 9.909e+08 ±  3%     +46.8%  1.454e+09 ±  4%  perf-stat.i.cache-misses
 5.777e+09           +15.1%   6.65e+09        perf-stat.i.cache-references
  13861493 ±  8%     -99.1%     119418 ±  2%  perf-stat.i.context-switches
      3.13 ±  5%    +152.0%       7.90        perf-stat.i.cpi
     9e+11            +1.5%  9.137e+11        perf-stat.i.cpu-cycles
    916.92 ±  3%     -30.4%     638.30 ±  4%  perf-stat.i.cycles-between-cache-misses
 2.916e+11 ±  5%     -60.4%  1.154e+11        perf-stat.i.instructions
      0.33 ±  6%     -60.4%       0.13        perf-stat.i.ipc
     54.12 ±  7%    -100.0%       0.02 ± 50%  perf-stat.i.metric.K/sec
      3.40 ±  3%    +270.4%      12.61 ±  4%  perf-stat.overall.MPKI
      0.35            -0.2        0.18        perf-stat.overall.branch-miss-rate%
     17.17 ±  4%      +4.7       21.87 ±  4%  perf-stat.overall.cache-miss-rate%
      3.10 ±  6%    +155.8%       7.92        perf-stat.overall.cpi
    909.11 ±  3%     -30.8%     629.52 ±  4%  perf-stat.overall.cycles-between-cache-misses
      0.32 ±  6%     -61.1%       0.13        perf-stat.overall.ipc
     15322           -25.3%      11450        perf-stat.overall.path-length
 5.725e+10 ±  4%     -56.5%  2.489e+10        perf-stat.ps.branch-instructions
  2.03e+08 ±  5%     -77.9%   44848434        perf-stat.ps.branch-misses
 9.871e+08 ±  2%     +46.7%  1.448e+09 ±  4%  perf-stat.ps.cache-misses
 5.754e+09           +15.0%  6.617e+09        perf-stat.ps.cache-references
  13805295 ±  7%     -99.1%     118634 ±  2%  perf-stat.ps.context-switches
 8.964e+11            +1.4%  9.093e+11        perf-stat.ps.cpu-cycles
 2.905e+11 ±  5%     -60.5%  1.148e+11        perf-stat.ps.instructions
      4504 ±  4%      -9.2%       4090 ±  2%  perf-stat.ps.minor-faults
      4504 ±  4%      -9.2%       4090 ±  2%  perf-stat.ps.page-faults
 8.799e+13 ±  5%     -60.4%  3.485e+13        perf-stat.total.instructions
     14.71 ±  5%      -9.8        4.87 ±  5%  perf-profile.calltrace.cycles-pp.__dev_queue_xmit.ip_finish_output2.ip_output.__ip_queue_xmit.__tcp_transmit_skb
     13.65 ±  5%      -9.0        4.68 ±  5%  perf-profile.calltrace.cycles-pp.__local_bh_enable_ip.__dev_queue_xmit.ip_finish_output2.ip_output.__ip_queue_xmit
     13.64 ±  5%      -9.0        4.68 ±  5%  perf-profile.calltrace.cycles-pp.do_softirq.__local_bh_enable_ip.__dev_queue_xmit.ip_finish_output2.ip_output
     13.60 ±  5%      -8.9        4.67 ±  5%  perf-profile.calltrace.cycles-pp.handle_softirqs.do_softirq.__local_bh_enable_ip.__dev_queue_xmit.ip_finish_output2
     13.32 ±  5%      -8.7        4.62 ±  5%  perf-profile.calltrace.cycles-pp.net_rx_action.handle_softirqs.do_softirq.__local_bh_enable_ip.__dev_queue_xmit
     11.45 ±  5%      -7.2        4.27 ±  6%  perf-profile.calltrace.cycles-pp.__napi_poll.net_rx_action.handle_softirqs.do_softirq.__local_bh_enable_ip
     11.44 ±  5%      -7.2        4.26 ±  6%  perf-profile.calltrace.cycles-pp.process_backlog.__napi_poll.net_rx_action.handle_softirqs.do_softirq
     10.66 ±  6%      -7.1        3.53 ±  5%  perf-profile.calltrace.cycles-pp.ip_finish_output2.ip_output.__ip_queue_xmit.__tcp_transmit_skb.tcp_write_xmit
     11.23 ±  5%      -7.0        4.23 ±  6%  perf-profile.calltrace.cycles-pp.__netif_receive_skb_one_core.process_backlog.__napi_poll.net_rx_action.handle_softirqs
     10.84 ±  5%      -6.7        4.16 ±  6%  perf-profile.calltrace.cycles-pp.ip_local_deliver.__netif_receive_skb_one_core.process_backlog.__napi_poll.net_rx_action
     10.82 ±  5%      -6.7        4.16 ±  6%  perf-profile.calltrace.cycles-pp.ip_local_deliver_finish.ip_local_deliver.__netif_receive_skb_one_core.process_backlog.__napi_poll
     10.79 ±  5%      -6.6        4.15 ±  6%  perf-profile.calltrace.cycles-pp.ip_protocol_deliver_rcu.ip_local_deliver_finish.ip_local_deliver.__netif_receive_skb_one_core.process_backlog
     10.65 ±  5%      -6.5        4.11 ±  6%  perf-profile.calltrace.cycles-pp.tcp_v4_rcv.ip_protocol_deliver_rcu.ip_local_deliver_finish.ip_local_deliver.__netif_receive_skb_one_core
     10.07 ±  4%      -6.1        4.02 ±  6%  perf-profile.calltrace.cycles-pp.tcp_v4_do_rcv.tcp_v4_rcv.ip_protocol_deliver_rcu.ip_local_deliver_finish.ip_local_deliver
      9.94 ±  4%      -6.0        3.98 ±  6%  perf-profile.calltrace.cycles-pp.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv.ip_protocol_deliver_rcu.ip_local_deliver_finish
      7.01 ±  6%      -4.4        2.60 ±  7%  perf-profile.calltrace.cycles-pp.tcp_data_queue.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv.ip_protocol_deliver_rcu
     29.45            -4.3       25.20        perf-profile.calltrace.cycles-pp.send_tcp_maerts.main
     29.44            -4.2       25.19        perf-profile.calltrace.cycles-pp.send_omni_inner.send_tcp_maerts.main
     29.18            -4.0       25.13        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.send_omni_inner.send_tcp_maerts.main
     29.16            -4.0       25.13        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.send_omni_inner.send_tcp_maerts.main
     28.62            -3.6       25.05        perf-profile.calltrace.cycles-pp.__x64_sys_recvfrom.do_syscall_64.entry_SYSCALL_64_after_hwframe.send_omni_inner.send_tcp_maerts
     28.60            -3.6       25.05        perf-profile.calltrace.cycles-pp.__sys_recvfrom.__x64_sys_recvfrom.do_syscall_64.entry_SYSCALL_64_after_hwframe.send_omni_inner
     28.44            -3.4       25.02        perf-profile.calltrace.cycles-pp.sock_recvmsg.__sys_recvfrom.__x64_sys_recvfrom.do_syscall_64.entry_SYSCALL_64_after_hwframe
     28.42            -3.4       25.01        perf-profile.calltrace.cycles-pp.inet_recvmsg.sock_recvmsg.__sys_recvfrom.__x64_sys_recvfrom.do_syscall_64
     28.41            -3.4       25.01        perf-profile.calltrace.cycles-pp.tcp_recvmsg.inet_recvmsg.sock_recvmsg.__sys_recvfrom.__x64_sys_recvfrom
      7.24 ±  2%      -3.3        3.96 ±  5%  perf-profile.calltrace.cycles-pp.tcp_write_xmit.tcp_sendmsg_locked.tcp_sendmsg.__sys_sendto.__x64_sys_sendto
     28.09            -3.3       24.83        perf-profile.calltrace.cycles-pp.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg.sock_recvmsg.__sys_recvfrom
      6.98 ±  3%      -3.2        3.80 ±  6%  perf-profile.calltrace.cycles-pp.tcp_wmem_schedule.tcp_sendmsg_locked.tcp_sendmsg.__sys_sendto.__x64_sys_sendto
      6.96 ±  3%      -3.2        3.78 ±  6%  perf-profile.calltrace.cycles-pp.__sk_mem_schedule.tcp_wmem_schedule.tcp_sendmsg_locked.tcp_sendmsg.__sys_sendto
      6.86 ±  3%      -3.2        3.70 ±  5%  perf-profile.calltrace.cycles-pp.__tcp_transmit_skb.tcp_write_xmit.tcp_sendmsg_locked.tcp_sendmsg.__sys_sendto
      6.94 ±  3%      -3.2        3.78 ±  6%  perf-profile.calltrace.cycles-pp.__sk_mem_raise_allocated.__sk_mem_schedule.tcp_wmem_schedule.tcp_sendmsg_locked.tcp_sendmsg
      4.53 ±  4%      -3.1        1.38 ±  6%  perf-profile.calltrace.cycles-pp.__tcp_transmit_skb.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg.sock_recvmsg
      6.68 ±  3%      -3.1        3.59 ±  5%  perf-profile.calltrace.cycles-pp.__ip_queue_xmit.__tcp_transmit_skb.tcp_write_xmit.tcp_sendmsg_locked.tcp_sendmsg
      6.61 ±  3%      -3.1        3.54 ±  5%  perf-profile.calltrace.cycles-pp.ip_output.__ip_queue_xmit.__tcp_transmit_skb.tcp_write_xmit.tcp_sendmsg_locked
      4.35 ±  4%      -3.0        1.38 ±  6%  perf-profile.calltrace.cycles-pp.__ip_queue_xmit.__tcp_transmit_skb.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg
      4.24 ±  4%      -2.9        1.37 ±  6%  perf-profile.calltrace.cycles-pp.ip_output.__ip_queue_xmit.__tcp_transmit_skb.tcp_recvmsg_locked.tcp_recvmsg
      4.20 ±  4%      -2.8        1.37 ±  6%  perf-profile.calltrace.cycles-pp.ip_finish_output2.ip_output.__ip_queue_xmit.__tcp_transmit_skb.tcp_recvmsg_locked
      5.41 ±  5%      -2.2        3.19 ±  8%  perf-profile.calltrace.cycles-pp.mem_cgroup_sk_charge.__sk_mem_raise_allocated.__sk_mem_schedule.tcp_wmem_schedule.tcp_sendmsg_locked
      4.48 ±  7%      -2.2        2.29 ± 11%  perf-profile.calltrace.cycles-pp.__sk_mem_schedule.tcp_try_rmem_schedule.tcp_data_queue.tcp_rcv_established.tcp_v4_do_rcv
      4.48 ±  7%      -2.2        2.30 ± 11%  perf-profile.calltrace.cycles-pp.tcp_try_rmem_schedule.tcp_data_queue.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv
      4.47 ±  7%      -2.2        2.29 ± 11%  perf-profile.calltrace.cycles-pp.__sk_mem_raise_allocated.__sk_mem_schedule.tcp_try_rmem_schedule.tcp_data_queue.tcp_rcv_established
      4.04 ±  4%      -1.9        2.13 ± 12%  perf-profile.calltrace.cycles-pp.mem_cgroup_sk_charge.__sk_mem_raise_allocated.__sk_mem_schedule.tcp_try_rmem_schedule.tcp_data_queue
      4.18 ±  6%      -1.9        2.33 ± 11%  perf-profile.calltrace.cycles-pp.page_counter_try_charge.try_charge_memcg.mem_cgroup_sk_charge.__sk_mem_raise_allocated.__sk_mem_schedule
      3.82 ±  4%      -1.8        2.02 ± 11%  perf-profile.calltrace.cycles-pp.try_charge_memcg.mem_cgroup_sk_charge.__sk_mem_raise_allocated.__sk_mem_schedule.tcp_try_rmem_schedule
      4.43 ±  5%      -1.7        2.72 ±  8%  perf-profile.calltrace.cycles-pp.try_charge_memcg.mem_cgroup_sk_charge.__sk_mem_raise_allocated.__sk_mem_schedule.tcp_wmem_schedule
      2.70 ±  7%      -1.3        1.44 ± 23%  perf-profile.calltrace.cycles-pp.__sk_mem_reduce_allocated.tcp_clean_rtx_queue.tcp_ack.tcp_rcv_established.tcp_v4_do_rcv
      2.98 ±  6%      -1.2        1.80 ±  9%  perf-profile.calltrace.cycles-pp.__sk_mem_reduce_allocated.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg.sock_recvmsg
      2.21 ±  8%      -1.1        1.15 ± 22%  perf-profile.calltrace.cycles-pp.page_counter_uncharge.drain_stock.refill_stock.__sk_mem_reduce_allocated.tcp_clean_rtx_queue
      2.34 ±  4%      -1.1        1.29 ±  7%  perf-profile.calltrace.cycles-pp.tcp_ack.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv.ip_protocol_deliver_rcu
      2.26 ±  8%      -1.0        1.25 ± 24%  perf-profile.calltrace.cycles-pp.refill_stock.__sk_mem_reduce_allocated.tcp_clean_rtx_queue.tcp_ack.tcp_rcv_established
      2.24 ±  8%      -1.0        1.24 ± 23%  perf-profile.calltrace.cycles-pp.drain_stock.refill_stock.__sk_mem_reduce_allocated.tcp_clean_rtx_queue.tcp_ack
      2.24 ±  4%      -1.0        1.28 ±  7%  perf-profile.calltrace.cycles-pp.tcp_clean_rtx_queue.tcp_ack.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv
      5.52 ±  5%      -0.9        4.63        perf-profile.calltrace.cycles-pp.skb_do_copy_data_nocache.tcp_sendmsg_locked.tcp_sendmsg.__sys_sendto.__x64_sys_sendto
      5.30 ±  5%      -0.8        4.51        perf-profile.calltrace.cycles-pp._copy_from_iter.skb_do_copy_data_nocache.tcp_sendmsg_locked.tcp_sendmsg.__sys_sendto
      2.24 ±  7%      -0.7        1.50 ± 10%  perf-profile.calltrace.cycles-pp.refill_stock.__sk_mem_reduce_allocated.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg
      2.20 ±  7%      -0.7        1.49 ± 10%  perf-profile.calltrace.cycles-pp.drain_stock.refill_stock.__sk_mem_reduce_allocated.tcp_recvmsg_locked.tcp_recvmsg
      2.18 ±  6%      -0.7        1.48 ± 10%  perf-profile.calltrace.cycles-pp.page_counter_uncharge.drain_stock.refill_stock.__sk_mem_reduce_allocated.tcp_recvmsg_locked
     55.28            +3.4       58.66        perf-profile.calltrace.cycles-pp.tcp_sendmsg_locked.tcp_sendmsg.__sys_sendto.__x64_sys_sendto.do_syscall_64
     11.73 ±  5%      +3.7       15.42 ±  3%  perf-profile.calltrace.cycles-pp.skb_attempt_defer_free.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg.sock_recvmsg
     11.68 ±  5%      +3.7       15.38 ±  3%  perf-profile.calltrace.cycles-pp.skb_release_data.skb_attempt_defer_free.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg
     11.33 ±  5%      +3.7       15.04 ±  3%  perf-profile.calltrace.cycles-pp.free_pcppages_bulk.free_frozen_page_commit.__free_frozen_pages.skb_release_data.skb_attempt_defer_free
     11.47 ±  5%      +3.7       15.20 ±  3%  perf-profile.calltrace.cycles-pp.free_frozen_page_commit.__free_frozen_pages.skb_release_data.skb_attempt_defer_free.tcp_recvmsg_locked
     11.59 ±  5%      +3.7       15.33 ±  3%  perf-profile.calltrace.cycles-pp.__free_frozen_pages.skb_release_data.skb_attempt_defer_free.tcp_recvmsg_locked.tcp_recvmsg
     10.99 ±  4%      +3.9       14.92 ±  2%  perf-profile.calltrace.cycles-pp.release_sock.tcp_sendmsg.__sys_sendto.__x64_sys_sendto.do_syscall_64
     10.74 ±  4%      +3.9       14.68 ±  2%  perf-profile.calltrace.cycles-pp.__release_sock.release_sock.tcp_sendmsg.__sys_sendto.__x64_sys_sendto
      9.79 ±  5%      +4.8       14.57 ±  2%  perf-profile.calltrace.cycles-pp.tcp_rcv_established.tcp_v4_do_rcv.__release_sock.release_sock.tcp_sendmsg
      9.78 ±  5%      +4.8       14.57 ±  2%  perf-profile.calltrace.cycles-pp.tcp_v4_do_rcv.__release_sock.release_sock.tcp_sendmsg.__sys_sendto
      8.76 ±  7%      +5.7       14.46 ±  2%  perf-profile.calltrace.cycles-pp.tcp_ack.tcp_rcv_established.tcp_v4_do_rcv.__release_sock.release_sock
      8.70 ±  7%      +5.8       14.46 ±  2%  perf-profile.calltrace.cycles-pp.tcp_clean_rtx_queue.tcp_ack.tcp_rcv_established.tcp_v4_do_rcv.__release_sock
      7.39 ±  8%      +6.3       13.66 ±  2%  perf-profile.calltrace.cycles-pp.skb_release_data.__kfree_skb.tcp_clean_rtx_queue.tcp_ack.tcp_rcv_established
      7.44 ±  8%      +6.3       13.77 ±  2%  perf-profile.calltrace.cycles-pp.__kfree_skb.tcp_clean_rtx_queue.tcp_ack.tcp_rcv_established.tcp_v4_do_rcv
      7.28 ±  8%      +6.4       13.67 ±  2%  perf-profile.calltrace.cycles-pp.__free_frozen_pages.skb_release_data.__kfree_skb.tcp_clean_rtx_queue.tcp_ack
      6.93 ±  9%      +6.4       13.34 ±  2%  perf-profile.calltrace.cycles-pp.free_pcppages_bulk.free_frozen_page_commit.__free_frozen_pages.skb_release_data.__kfree_skb
      7.13 ±  8%      +6.4       13.54 ±  2%  perf-profile.calltrace.cycles-pp.free_frozen_page_commit.__free_frozen_pages.skb_release_data.__kfree_skb.tcp_clean_rtx_queue
     66.85            +7.0       73.84        perf-profile.calltrace.cycles-pp.__x64_sys_sendto.do_syscall_64.entry_SYSCALL_64_after_hwframe.recv_omni.process_requests
     66.82            +7.0       73.83        perf-profile.calltrace.cycles-pp.__sys_sendto.__x64_sys_sendto.do_syscall_64.entry_SYSCALL_64_after_hwframe.recv_omni
     66.50            +7.2       73.69        perf-profile.calltrace.cycles-pp.tcp_sendmsg.__sys_sendto.__x64_sys_sendto.do_syscall_64.entry_SYSCALL_64_after_hwframe
     17.98 ±  5%     +10.1       28.09        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.free_pcppages_bulk.free_frozen_page_commit.__free_frozen_pages
     18.00 ±  5%     +10.1       28.12        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.free_pcppages_bulk.free_frozen_page_commit.__free_frozen_pages.skb_release_data
     29.28 ±  4%     +15.6       44.84        perf-profile.calltrace.cycles-pp.sk_page_frag_refill.tcp_sendmsg_locked.tcp_sendmsg.__sys_sendto.__x64_sys_sendto
     29.27 ±  4%     +15.6       44.84        perf-profile.calltrace.cycles-pp.skb_page_frag_refill.sk_page_frag_refill.tcp_sendmsg_locked.tcp_sendmsg.__sys_sendto
     29.18 ±  4%     +15.6       44.79        perf-profile.calltrace.cycles-pp.alloc_pages_noprof.skb_page_frag_refill.sk_page_frag_refill.tcp_sendmsg_locked.tcp_sendmsg
     29.16 ±  4%     +15.6       44.78        perf-profile.calltrace.cycles-pp.alloc_pages_mpol.alloc_pages_noprof.skb_page_frag_refill.sk_page_frag_refill.tcp_sendmsg_locked
     29.14 ±  4%     +15.6       44.76        perf-profile.calltrace.cycles-pp.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.skb_page_frag_refill.sk_page_frag_refill
     29.08 ±  4%     +15.6       44.72        perf-profile.calltrace.cycles-pp.get_page_from_freelist.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.skb_page_frag_refill
     27.58 ±  4%     +16.0       43.55        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.rmqueue_bulk.__rmqueue_pcplist.rmqueue_pcplist
     27.62 ±  4%     +16.0       43.60        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.rmqueue_bulk.__rmqueue_pcplist.rmqueue_pcplist.rmqueue
     28.29 ±  4%     +16.0       44.26        perf-profile.calltrace.cycles-pp.rmqueue.get_page_from_freelist.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof
     28.16 ±  4%     +16.0       44.17        perf-profile.calltrace.cycles-pp.rmqueue_pcplist.rmqueue.get_page_from_freelist.__alloc_frozen_pages_noprof.alloc_pages_mpol
     28.09 ±  4%     +16.0       44.14        perf-profile.calltrace.cycles-pp.__rmqueue_pcplist.rmqueue_pcplist.rmqueue.get_page_from_freelist.__alloc_frozen_pages_noprof
     28.04 ±  4%     +16.1       44.09        perf-profile.calltrace.cycles-pp.rmqueue_bulk.__rmqueue_pcplist.rmqueue_pcplist.rmqueue.get_page_from_freelist
     16.04 ±  4%     -10.7        5.37 ±  5%  perf-profile.children.cycles-pp.__tcp_transmit_skb
     15.44 ±  4%     -10.2        5.25 ±  5%  perf-profile.children.cycles-pp.__ip_queue_xmit
     15.15 ±  4%     -10.0        5.18 ±  5%  perf-profile.children.cycles-pp.ip_output
     15.05 ±  4%      -9.9        5.17 ±  5%  perf-profile.children.cycles-pp.ip_finish_output2
     14.89 ±  4%      -9.7        5.14 ±  5%  perf-profile.children.cycles-pp.__dev_queue_xmit
     13.87 ±  4%      -8.9        4.95 ±  5%  perf-profile.children.cycles-pp.__local_bh_enable_ip
     13.79 ±  4%      -8.9        4.93 ±  5%  perf-profile.children.cycles-pp.do_softirq
     13.86 ±  4%      -8.8        5.11 ±  5%  perf-profile.children.cycles-pp.handle_softirqs
     13.57 ±  4%      -8.6        5.02 ±  5%  perf-profile.children.cycles-pp.net_rx_action
     12.48 ±  4%      -8.0        4.44 ±  4%  perf-profile.children.cycles-pp.tcp_write_xmit
     11.64 ±  4%      -7.2        4.44 ±  6%  perf-profile.children.cycles-pp.__napi_poll
     11.62 ±  4%      -7.2        4.44 ±  6%  perf-profile.children.cycles-pp.process_backlog
     11.41 ±  4%      -7.0        4.40 ±  6%  perf-profile.children.cycles-pp.__netif_receive_skb_one_core
     11.02 ±  4%      -6.7        4.32 ±  6%  perf-profile.children.cycles-pp.ip_local_deliver
     10.99 ±  4%      -6.7        4.32 ±  6%  perf-profile.children.cycles-pp.ip_local_deliver_finish
     10.97 ±  4%      -6.7        4.32 ±  6%  perf-profile.children.cycles-pp.ip_protocol_deliver_rcu
     10.84 ±  4%      -6.6        4.28 ±  6%  perf-profile.children.cycles-pp.tcp_v4_rcv
     12.56 ±  3%      -6.0        6.55 ±  7%  perf-profile.children.cycles-pp.__sk_mem_schedule
     12.53 ±  3%      -6.0        6.54 ±  7%  perf-profile.children.cycles-pp.__sk_mem_raise_allocated
     10.58 ±  5%      -4.8        5.79 ±  8%  perf-profile.children.cycles-pp.mem_cgroup_sk_charge
      5.26 ±  8%      -4.8        0.49        perf-profile.children.cycles-pp.__tcp_push_pending_frames
      7.41 ±  4%      -4.6        2.86 ±  7%  perf-profile.children.cycles-pp.tcp_data_queue
     29.64            -4.4       25.25        perf-profile.children.cycles-pp.send_tcp_maerts
     29.66            -4.4       25.31        perf-profile.children.cycles-pp.send_omni_inner
     29.15            -4.0       25.17        perf-profile.children.cycles-pp.__x64_sys_recvfrom
     29.14            -4.0       25.17        perf-profile.children.cycles-pp.__sys_recvfrom
     28.98            -3.8       25.14        perf-profile.children.cycles-pp.sock_recvmsg
     28.95            -3.8       25.13        perf-profile.children.cycles-pp.inet_recvmsg
     28.94            -3.8       25.13        perf-profile.children.cycles-pp.tcp_recvmsg
      8.93 ±  4%      -3.8        5.17 ±  8%  perf-profile.children.cycles-pp.try_charge_memcg
     28.64            -3.7       24.95        perf-profile.children.cycles-pp.tcp_recvmsg_locked
      6.99 ±  3%      -3.2        3.80 ±  6%  perf-profile.children.cycles-pp.tcp_wmem_schedule
      5.44 ±  4%      -2.8        2.66 ±  7%  perf-profile.children.cycles-pp.tcp_try_rmem_schedule
      2.87 ±  8%      -2.7        0.12 ±  3%  perf-profile.children.cycles-pp.__schedule
      2.62 ±  8%      -2.5        0.10        perf-profile.children.cycles-pp.schedule
      5.81 ±  6%      -2.3        3.47 ±  9%  perf-profile.children.cycles-pp.__sk_mem_reduce_allocated
      2.23 ±  8%      -2.1        0.08 ±  4%  perf-profile.children.cycles-pp.sk_wait_data
      2.00 ±  8%      -1.9        0.08        perf-profile.children.cycles-pp.wait_woken
      4.66 ±  4%      -1.9        2.76 ±  8%  perf-profile.children.cycles-pp.page_counter_try_charge
      1.90 ±  8%      -1.8        0.08 ±  4%  perf-profile.children.cycles-pp.schedule_timeout
      2.52 ± 30%      -1.7        0.84 ± 23%  perf-profile.children.cycles-pp.mod_memcg_state
      4.59 ±  6%      -1.6        3.04 ± 10%  perf-profile.children.cycles-pp.refill_stock
      1.65 ±  8%      -1.5        0.10 ±  4%  perf-profile.children.cycles-pp.sock_def_readable
      1.60 ±  8%      -1.5        0.09 ±  4%  perf-profile.children.cycles-pp.__wake_up_sync_key
      4.52 ±  6%      -1.5        3.02 ± 10%  perf-profile.children.cycles-pp.drain_stock
      4.58 ±  6%      -1.5        3.10 ±  9%  perf-profile.children.cycles-pp.page_counter_uncharge
      1.56 ±  8%      -1.5        0.08 ±  4%  perf-profile.children.cycles-pp.__wake_up_common
      1.51 ±  8%      -1.4        0.06 ±  6%  perf-profile.children.cycles-pp.try_to_wake_up
     20.20 ±  3%      -1.3       18.86 ±  2%  perf-profile.children.cycles-pp.tcp_v4_do_rcv
      1.64 ±  4%      -1.3        0.31 ±  3%  perf-profile.children.cycles-pp.tcp_stream_alloc_skb
      1.83 ±  8%      -1.3        0.56 ±  7%  perf-profile.children.cycles-pp.skb_defer_free_flush
      1.38 ±  7%      -1.2        0.14        perf-profile.children.cycles-pp.exit_to_user_mode_loop
      1.17 ±  7%      -1.0        0.16 ±  2%  perf-profile.children.cycles-pp.__alloc_skb
      5.54 ±  5%      -0.9        4.63        perf-profile.children.cycles-pp.skb_do_copy_data_nocache
      0.92 ±  8%      -0.8        0.09        perf-profile.children.cycles-pp.kmem_cache_alloc_node_noprof
      5.31 ±  5%      -0.8        4.52        perf-profile.children.cycles-pp._copy_from_iter
      0.90 ± 31%      -0.7        0.23 ± 22%  perf-profile.children.cycles-pp.mem_cgroup_sk_uncharge
      0.77 ±  7%      -0.6        0.14        perf-profile.children.cycles-pp._find_next_bit
      0.53 ±  6%      -0.4        0.10 ±  5%  perf-profile.children.cycles-pp.dev_hard_start_xmit
      0.50 ±  9%      -0.4        0.08        perf-profile.children.cycles-pp.kmem_cache_free
      0.49 ±  6%      -0.4        0.09 ±  5%  perf-profile.children.cycles-pp.loopback_xmit
      0.45 ±  7%      -0.4        0.07 ±  5%  perf-profile.children.cycles-pp.arch_exit_to_user_mode_prepare
      0.39 ±  7%      -0.3        0.06        perf-profile.children.cycles-pp.__cond_resched
      0.42 ±  6%      -0.2        0.16 ±  3%  perf-profile.children.cycles-pp.ktime_get
      0.31 ±  5%      -0.2        0.06 ±  9%  perf-profile.children.cycles-pp.__netif_rx
      0.30 ±  5%      -0.2        0.06 ± 13%  perf-profile.children.cycles-pp.netif_rx_internal
      0.28 ±  5%      -0.2        0.06 ±  9%  perf-profile.children.cycles-pp.enqueue_to_backlog
      0.52 ±  4%      -0.2        0.32        perf-profile.children.cycles-pp.__check_object_size
      0.22 ±  7%      -0.2        0.04 ± 44%  perf-profile.children.cycles-pp.__inet_lookup_skb
      0.33 ±  6%      -0.2        0.16 ±  2%  perf-profile.children.cycles-pp.__zone_watermark_ok
      0.21 ±  6%      -0.2        0.05 ±  7%  perf-profile.children.cycles-pp.tcp_mstamp_refresh
      0.48 ± 10%      -0.2        0.33 ± 22%  perf-profile.children.cycles-pp.cmd_record
      0.43 ±  6%      -0.1        0.28 ±  2%  perf-profile.children.cycles-pp._raw_spin_lock_bh
      0.23 ±  5%      -0.1        0.09        perf-profile.children.cycles-pp.read_tsc
      0.35 ±  4%      -0.1        0.22 ± 24%  perf-profile.children.cycles-pp.record__mmap_read_evlist
      0.40 ±  5%      -0.1        0.27        perf-profile.children.cycles-pp.check_heap_object
      0.21 ±  8%      -0.1        0.08        perf-profile.children.cycles-pp.fdget
      0.34 ±  4%      -0.1        0.21 ± 23%  perf-profile.children.cycles-pp.perf_mmap__push
      0.35 ±  4%      -0.1        0.22 ± 24%  perf-profile.children.cycles-pp.handle_internal_command
      0.35 ±  4%      -0.1        0.22 ± 24%  perf-profile.children.cycles-pp.run_builtin
      0.21 ±  3%      -0.1        0.09        perf-profile.children.cycles-pp.sk_reset_timer
      0.34 ±  5%      -0.1        0.23        perf-profile.children.cycles-pp.simple_copy_to_iter
      0.27 ±  3%      -0.1        0.16 ±  3%  perf-profile.children.cycles-pp.tcp_event_new_data_sent
      0.19 ±  5%      -0.1        0.08 ±  4%  perf-profile.children.cycles-pp.lock_sock_nested
      0.25 ±  5%      -0.1        0.15 ± 22%  perf-profile.children.cycles-pp.record__pushfn
      0.19 ±  3%      -0.1        0.09        perf-profile.children.cycles-pp.__mod_timer
      0.14 ±  3%      -0.1        0.04 ± 44%  perf-profile.children.cycles-pp.send_data
      0.14 ±  7%      -0.1        0.05        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.23 ±  6%      -0.1        0.14 ± 21%  perf-profile.children.cycles-pp.ksys_write
      0.21 ±  5%      -0.1        0.13 ± 21%  perf-profile.children.cycles-pp.vfs_write
      0.16 ±  3%      -0.1        0.08        perf-profile.children.cycles-pp.tcp_send_mss
      0.20 ±  5%      -0.1        0.13 ± 20%  perf-profile.children.cycles-pp.shmem_file_write_iter
      0.14 ±  5%      -0.1        0.06 ±  7%  perf-profile.children.cycles-pp.tcp_current_mss
      0.12 ±  5%      -0.1        0.05        perf-profile.children.cycles-pp.__virt_addr_valid
      0.10 ±  3%      -0.1        0.03 ± 70%  perf-profile.children.cycles-pp.tcp_queue_rcv
      0.19 ±  6%      -0.1        0.12 ± 18%  perf-profile.children.cycles-pp.generic_perform_write
      0.12 ±  7%      -0.1        0.07 ±  5%  perf-profile.children.cycles-pp.sock_rfree
      0.11 ±  8%      -0.0        0.06 ± 21%  perf-profile.children.cycles-pp.copy_folio_from_iter_atomic
      0.07 ± 10%      -0.0        0.03 ±100%  perf-profile.children.cycles-pp.perf_mmap__read_head
      0.07 ±  6%      -0.0        0.03 ± 70%  perf-profile.children.cycles-pp.tcp_tso_segs
      0.26 ±  7%      -0.0        0.23        perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.26 ±  8%      -0.0        0.22        perf-profile.children.cycles-pp.hrtimer_interrupt
      0.36 ±  6%      -0.0        0.33        perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.12 ±  3%      -0.0        0.09        perf-profile.children.cycles-pp.task_mm_cid_work
      0.12 ±  3%      -0.0        0.09 ±  4%  perf-profile.children.cycles-pp.task_work_run
      0.07 ±  6%      -0.0        0.05 ±  7%  perf-profile.children.cycles-pp.prep_new_page
      0.21 ±  3%      -0.0        0.19        perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.14 ±  3%      -0.0        0.13        perf-profile.children.cycles-pp._raw_spin_trylock
      0.08            -0.0        0.07        perf-profile.children.cycles-pp.__mod_zone_page_state
      0.08 ± 33%      +0.1        0.15 ± 15%  perf-profile.children.cycles-pp.asm_sysvec_call_function_single
      0.08 ± 32%      +0.1        0.15 ± 15%  perf-profile.children.cycles-pp.sysvec_call_function_single
      0.12 ± 24%      +0.1        0.20 ± 13%  perf-profile.children.cycles-pp.__irq_exit_rcu
      0.09 ± 30%      +0.1        0.17 ± 13%  perf-profile.children.cycles-pp.free_one_page
     98.39            +1.1       99.48        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     98.30            +1.2       99.46        perf-profile.children.cycles-pp.do_syscall_64
     55.39            +3.3       58.68        perf-profile.children.cycles-pp.tcp_sendmsg_locked
     11.82 ±  5%      +3.7       15.49 ±  2%  perf-profile.children.cycles-pp.skb_attempt_defer_free
     11.23 ±  4%      +3.8       15.08        perf-profile.children.cycles-pp.release_sock
     10.93 ±  4%      +3.9       14.81 ±  2%  perf-profile.children.cycles-pp.__release_sock
     11.25 ±  5%      +4.5       15.78 ±  2%  perf-profile.children.cycles-pp.tcp_ack
     10.98 ±  6%      +4.8       15.74 ±  2%  perf-profile.children.cycles-pp.tcp_clean_rtx_queue
     68.67            +5.6       74.28        perf-profile.children.cycles-pp.recv_omni
     68.68            +5.6       74.29        perf-profile.children.cycles-pp.process_requests
      7.75 ±  7%      +6.2       13.96 ±  2%  perf-profile.children.cycles-pp.__kfree_skb
     66.94            +6.9       73.85        perf-profile.children.cycles-pp.__x64_sys_sendto
     66.92            +6.9       73.84        perf-profile.children.cycles-pp.__sys_sendto
     66.60            +7.1       73.70        perf-profile.children.cycles-pp.tcp_sendmsg
     19.59 ±  4%     +10.0       29.55        perf-profile.children.cycles-pp.skb_release_data
     19.17 ±  5%     +10.2       29.34        perf-profile.children.cycles-pp.__free_frozen_pages
     18.52 ±  5%     +10.2       28.71        perf-profile.children.cycles-pp.free_pcppages_bulk
     18.88 ±  5%     +10.2       29.08        perf-profile.children.cycles-pp.free_frozen_page_commit
     29.28 ±  4%     +15.6       44.85        perf-profile.children.cycles-pp.sk_page_frag_refill
     29.28 ±  4%     +15.6       44.84        perf-profile.children.cycles-pp.skb_page_frag_refill
     29.18 ±  4%     +15.6       44.79        perf-profile.children.cycles-pp.alloc_pages_noprof
     29.18 ±  4%     +15.6       44.80        perf-profile.children.cycles-pp.alloc_pages_mpol
     29.16 ±  4%     +15.6       44.78        perf-profile.children.cycles-pp.__alloc_frozen_pages_noprof
     29.10 ±  4%     +15.6       44.75        perf-profile.children.cycles-pp.get_page_from_freelist
     28.31 ±  4%     +16.0       44.28        perf-profile.children.cycles-pp.rmqueue
     28.17 ±  4%     +16.0       44.20        perf-profile.children.cycles-pp.rmqueue_pcplist
     28.10 ±  4%     +16.1       44.16        perf-profile.children.cycles-pp.__rmqueue_pcplist
     28.06 ±  4%     +16.1       44.13        perf-profile.children.cycles-pp.rmqueue_bulk
     46.24 ±  4%     +26.1       72.29        perf-profile.children.cycles-pp._raw_spin_lock_irqsave
     45.94 ±  4%     +26.2       72.14        perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      4.61 ±  4%      -1.9        2.73 ±  8%  perf-profile.self.cycles-pp.page_counter_try_charge
      4.25 ±  4%      -1.8        2.41 ±  8%  perf-profile.self.cycles-pp.try_charge_memcg
      2.29 ±  7%      -1.5        0.78 ±  9%  perf-profile.self.cycles-pp.__sk_mem_raise_allocated
      4.54 ±  6%      -1.5        3.07 ± 10%  perf-profile.self.cycles-pp.page_counter_uncharge
      1.81 ± 41%      -1.1        0.68 ± 26%  perf-profile.self.cycles-pp.mod_memcg_state
      5.28 ±  5%      -0.8        4.50        perf-profile.self.cycles-pp._copy_from_iter
      0.93 ±  6%      -0.7        0.18 ±  5%  perf-profile.self.cycles-pp.skb_defer_free_flush
      0.69 ±  7%      -0.6        0.13 ±  2%  perf-profile.self.cycles-pp._find_next_bit
      0.60 ± 11%      -0.5        0.05        perf-profile.self.cycles-pp.kmem_cache_alloc_node_noprof
      0.46 ± 10%      -0.4        0.05        perf-profile.self.cycles-pp.kmem_cache_free
      1.04 ±  4%      -0.3        0.73        perf-profile.self.cycles-pp.tcp_sendmsg_locked
      0.35 ± 16%      -0.3        0.08 ±  5%  perf-profile.self.cycles-pp.__dev_queue_xmit
      0.31 ±  7%      -0.2        0.06 ±  6%  perf-profile.self.cycles-pp.__tcp_transmit_skb
      0.27 ±  7%      -0.2        0.09 ±  4%  perf-profile.self.cycles-pp.tcp_write_xmit
      0.33 ±  6%      -0.2        0.16        perf-profile.self.cycles-pp.__zone_watermark_ok
      0.31 ±  4%      -0.2        0.14        perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.38 ±  3%      -0.1        0.25        perf-profile.self.cycles-pp.get_page_from_freelist
      0.24 ±  5%      -0.1        0.10 ± 13%  perf-profile.self.cycles-pp.__sk_mem_reduce_allocated
      0.19 ±  6%      -0.1        0.06 ±  8%  perf-profile.self.cycles-pp.__alloc_skb
      0.21 ±  7%      -0.1        0.08 ±  4%  perf-profile.self.cycles-pp.fdget
      0.22 ±  5%      -0.1        0.09 ±  5%  perf-profile.self.cycles-pp.read_tsc
      0.39 ±  5%      -0.1        0.28        perf-profile.self.cycles-pp._raw_spin_lock_bh
      0.19 ±  9%      -0.1        0.08 ±  4%  perf-profile.self.cycles-pp.ktime_get
      0.18 ±  6%      -0.1        0.08 ±  4%  perf-profile.self.cycles-pp.recv_omni
      0.14 ±  6%      -0.1        0.05        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.21 ±  5%      -0.1        0.13 ±  3%  perf-profile.self.cycles-pp.skb_release_data
      0.14 ±  6%      -0.1        0.06        perf-profile.self.cycles-pp.tcp_clean_rtx_queue
      0.13 ±  5%      -0.1        0.05        perf-profile.self.cycles-pp.arch_exit_to_user_mode_prepare
      0.22 ±  4%      -0.1        0.15        perf-profile.self.cycles-pp.free_frozen_page_commit
      0.12 ±  6%      -0.1        0.05        perf-profile.self.cycles-pp.__virt_addr_valid
      0.12 ±  6%      -0.1        0.06 ±  9%  perf-profile.self.cycles-pp.__sys_sendto
      0.14 ±  5%      -0.1        0.09        perf-profile.self.cycles-pp.rmqueue
      0.12 ±  4%      -0.0        0.07 ±  5%  perf-profile.self.cycles-pp.sock_rfree
      0.11 ±  8%      -0.0        0.06 ± 21%  perf-profile.self.cycles-pp.copy_folio_from_iter_atomic
      0.07 ± 10%      -0.0        0.03 ±100%  perf-profile.self.cycles-pp.perf_mmap__read_head
      0.25 ±  4%      -0.0        0.21        perf-profile.self.cycles-pp.check_heap_object
      0.10 ±  5%      -0.0        0.06 ±  9%  perf-profile.self.cycles-pp.skb_page_frag_refill
      0.11 ±  6%      -0.0        0.07        perf-profile.self.cycles-pp.__skb_datagram_iter
      0.08 ±  5%      -0.0        0.05        perf-profile.self.cycles-pp.__check_object_size
      0.11            -0.0        0.09 ±  5%  perf-profile.self.cycles-pp.task_mm_cid_work
      0.07 ±  5%      -0.0        0.05        perf-profile.self.cycles-pp.prep_new_page
      0.14            -0.0        0.13 ±  2%  perf-profile.self.cycles-pp._raw_spin_trylock
      0.08            -0.0        0.07        perf-profile.self.cycles-pp.__mod_zone_page_state
      0.28            +0.0        0.32        perf-profile.self.cycles-pp.rmqueue_bulk
     45.94 ±  4%     +26.2       72.14        perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath


***************************************************************************************************
lkp-gnr-2sp3: 256 threads 2 sockets Intel(R) Xeon(R) 6767P  CPU @ 2.4GHz (Granite Rapids) with 256G memory
=========================================================================================
cluster/compiler/cpufreq_governor/ip/kconfig/nr_threads/rootfs/runtime/tbox_group/test/testcase:
  cs-localhost/gcc-14/performance/ipv4/x86_64-rhel-9.4/200%/debian-13-x86_64-20250902.cgz/300s/lkp-gnr-2sp3/TCP_STREAM/netperf

commit: 
  aceccac58a ("sched/fair: Enable scheduler feature NEXT_BUDDY")
  e837456fdc ("sched/fair: Reimplement NEXT_BUDDY to align with EEVDF goals")

aceccac58ad76305 e837456fdca81899a3c8e47b3fd 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
   1553228 ± 10%     +36.2%    2115806 ± 15%  cpuidle..usage
     12.46 ±  4%      -7.4        5.05 ±  6%  mpstat.cpu.all.soft%
      1.35 ±  3%      -0.7        0.69 ±  4%  mpstat.cpu.all.usr%
  1.25e+09 ± 12%     -39.0%  7.618e+08 ±  2%  numa-numastat.node0.local_node
  1.25e+09 ± 12%     -39.0%  7.619e+08 ±  2%  numa-numastat.node0.numa_hit
 1.065e+09 ± 11%     -29.0%  7.561e+08        numa-numastat.node1.local_node
 1.065e+09 ± 11%     -29.0%  7.562e+08        numa-numastat.node1.numa_hit
     14585 ± 34%    +117.1%      31667 ±  9%  perf-c2c.DRAM.local
      3149 ± 37%     +61.0%       5070 ± 18%  perf-c2c.DRAM.remote
     15071 ± 34%     +63.8%      24689 ± 14%  perf-c2c.HITM.local
     16087 ± 35%     +62.5%      26140 ± 14%  perf-c2c.HITM.total
      3541            +1.6%       3600        turbostat.Bzy_MHz
      0.32 ±  3%     -60.3%       0.12 ±  4%  turbostat.IPC
     79.67            +2.7%      81.83        turbostat.PkgTmp
    694.80            -1.3%     685.92        turbostat.PkgWatt
     37.60 ±  3%     +18.9%      44.72 ±  3%  turbostat.RAMWatt
     40464 ± 96%    +575.7%     273413 ± 59%  numa-meminfo.node0.Mapped
      9920 ± 32%   +4863.9%     492464 ± 55%  numa-meminfo.node0.Shmem
   4338411 ± 11%     -48.7%    2227755 ± 14%  numa-meminfo.node1.Active
   4338403 ± 11%     -48.7%    2227745 ± 14%  numa-meminfo.node1.Active(anon)
   1758440 ± 20%     -64.1%     630457 ± 19%  numa-meminfo.node1.Mapped
   3684000 ± 12%     -55.4%    1643006 ± 19%  numa-meminfo.node1.Shmem
   4883294 ±  9%     -34.1%    3215664        meminfo.Active
   4883278 ±  9%     -34.1%    3215648        meminfo.Active(anon)
   1194475 ±  2%      -9.2%    1084946        meminfo.AnonPages
   7343367 ±  6%     -21.2%    5785347        meminfo.Cached
   5330328 ±  8%     -31.3%    3664160        meminfo.Committed_AS
   1799269 ± 20%     -49.8%     903678 ± 15%  meminfo.Mapped
  12433241 ±  4%     -11.8%   10961480 ±  2%  meminfo.Memused
   3692830 ± 12%     -42.2%    2134810 ±  2%  meminfo.Shmem
  12646768 ±  3%     -12.3%   11087520        meminfo.max_used_kB
      4788 ±  2%     -45.9%       2592        netperf.ThroughputBoth_Mbps
   2451925 ±  2%     -45.9%    1327516        netperf.ThroughputBoth_total_Mbps
      4788 ±  2%     -45.9%       2592        netperf.Throughput_Mbps
   2451925 ±  2%     -45.9%    1327516        netperf.Throughput_total_Mbps
 1.973e+09 ±  4%     -99.3%   14757325 ±  2%  netperf.time.involuntary_context_switches
     15751           +10.5%      17404        netperf.time.percent_of_cpu_this_job_got
     47137           +11.5%      52558        netperf.time.system_time
    589.30 ±  4%     -58.9%     241.98        netperf.time.user_time
   3535741 ±  4%     -46.1%    1904273 ± 15%  netperf.time.voluntary_context_switches
 5.612e+09 ±  2%     -45.9%  3.038e+09        netperf.workload
     10239 ± 96%    +568.7%      68466 ± 59%  numa-vmstat.node0.nr_mapped
      2479 ± 32%   +4868.6%     123202 ± 55%  numa-vmstat.node0.nr_shmem
  1.25e+09 ± 12%     -39.0%  7.619e+08 ±  2%  numa-vmstat.node0.numa_hit
  1.25e+09 ± 12%     -39.0%  7.618e+08 ±  2%  numa-vmstat.node0.numa_local
   1084343 ± 11%     -48.6%     556887 ± 14%  numa-vmstat.node1.nr_active_anon
    439827 ± 20%     -64.1%     157957 ± 19%  numa-vmstat.node1.nr_mapped
    920740 ± 12%     -55.4%     410693 ± 18%  numa-vmstat.node1.nr_shmem
   1084342 ± 11%     -48.6%     556886 ± 14%  numa-vmstat.node1.nr_zone_active_anon
 1.065e+09 ± 11%     -29.0%  7.562e+08        numa-vmstat.node1.numa_hit
 1.065e+09 ± 11%     -29.0%   7.56e+08        numa-vmstat.node1.numa_local
      0.84 ± 22%    +396.4%       4.19 ±  6%  perf-sched.sch_delay.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      5126 ± 34%     -93.7%     323.88 ± 81%  perf-sched.sch_delay.max.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      0.84 ± 22%    +396.4%       4.19 ±  6%  perf-sched.total_sch_delay.average.ms
      5126 ± 34%     -93.7%     323.88 ± 81%  perf-sched.total_sch_delay.max.ms
      2.96 ± 22%    +442.1%      16.04 ±  6%  perf-sched.total_wait_and_delay.average.ms
   3555550 ± 19%     -83.6%     582274 ±  6%  perf-sched.total_wait_and_delay.count.ms
     10303 ± 33%     -57.0%       4429 ±  5%  perf-sched.total_wait_and_delay.max.ms
      2.11 ± 23%    +460.4%      11.85 ±  6%  perf-sched.total_wait_time.average.ms
      6056 ± 17%     -26.9%       4429 ±  5%  perf-sched.total_wait_time.max.ms
      2.96 ± 22%    +442.1%      16.04 ±  6%  perf-sched.wait_and_delay.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
   3555550 ± 19%     -83.6%     582274 ±  6%  perf-sched.wait_and_delay.count.[unknown].[unknown].[unknown].[unknown].[unknown]
     10303 ± 33%     -57.0%       4429 ±  5%  perf-sched.wait_and_delay.max.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      2.11 ± 23%    +460.4%      11.85 ±  6%  perf-sched.wait_time.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      6056 ± 17%     -26.9%       4429 ±  5%  perf-sched.wait_time.max.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
   1221086 ±  9%     -34.2%     804035        proc-vmstat.nr_active_anon
    298560 ±  2%      -9.2%     271207        proc-vmstat.nr_anon_pages
   1836173 ±  6%     -21.2%    1446490        proc-vmstat.nr_file_pages
    450416 ± 20%     -49.8%     226121 ± 15%  proc-vmstat.nr_mapped
    923538 ± 12%     -42.2%     533855 ±  2%  proc-vmstat.nr_shmem
     46899            -2.0%      45956        proc-vmstat.nr_slab_reclaimable
   1221086 ±  9%     -34.2%     804035        proc-vmstat.nr_zone_active_anon
    166141 ± 35%     -59.2%      67706 ± 41%  proc-vmstat.numa_hint_faults
    153718 ± 39%     -65.4%      53234 ± 54%  proc-vmstat.numa_hint_faults_local
 2.315e+09 ±  2%     -34.4%  1.518e+09        proc-vmstat.numa_hit
 2.315e+09 ±  2%     -34.4%  1.518e+09        proc-vmstat.numa_local
    301207 ± 24%     -49.8%     151228 ± 16%  proc-vmstat.numa_pte_updates
 1.849e+10 ±  2%     -34.4%  1.212e+10        proc-vmstat.pgalloc_normal
   1515920 ±  3%     -12.3%    1329112 ±  2%  proc-vmstat.pgfault
 1.849e+10 ±  2%     -34.4%  1.212e+10        proc-vmstat.pgfree
  39619924           +19.1%   47193342 ±  3%  sched_debug.cfs_rq:/.avg_vruntime.avg
  54788550 ±  3%     +22.3%   66989123 ±  5%  sched_debug.cfs_rq:/.avg_vruntime.max
    377.78 ± 21%     -31.3%     259.69 ± 13%  sched_debug.cfs_rq:/.util_avg.min
  39600858           +19.0%   47143769 ±  3%  sched_debug.cfs_rq:/.zero_vruntime.avg
  54779261 ±  3%     +22.2%   66941118 ±  5%  sched_debug.cfs_rq:/.zero_vruntime.max
     90.07 ± 10%     -20.8%      71.30 ±  3%  sched_debug.cpu.clock.stddev
      3419 ± 44%     -66.5%       1145 ± 47%  sched_debug.cpu.clock_task.stddev
      0.00 ± 10%     -20.2%       0.00 ±  3%  sched_debug.cpu.next_balance.stddev
   7893547 ±  6%     -99.1%      72654 ±  2%  sched_debug.cpu.nr_switches.avg
  18321735 ±  4%     -99.1%     169087 ± 20%  sched_debug.cpu.nr_switches.max
   1981343 ± 35%     -97.2%      54534 ± 10%  sched_debug.cpu.nr_switches.min
   3553502 ± 28%     -99.6%      13048 ± 25%  sched_debug.cpu.nr_switches.stddev
      0.00 ± 35%     +87.5%       0.00 ± 20%  sched_debug.rt_rq:.rt_nr_running.avg
      0.22 ± 35%     +87.5%       0.42 ± 20%  sched_debug.rt_rq:.rt_nr_running.max
      0.01 ± 35%     +87.5%       0.03 ± 20%  sched_debug.rt_rq:.rt_nr_running.stddev
      3.58 ±  5%    +258.1%      12.82 ±  3%  perf-stat.i.MPKI
 5.617e+10 ±  2%     -55.7%  2.488e+10        perf-stat.i.branch-instructions
      0.35            -0.2        0.18        perf-stat.i.branch-miss-rate%
 1.935e+08 ±  3%     -77.3%   43865964        perf-stat.i.branch-misses
     17.11 ±  2%      +5.2       22.28 ±  3%  perf-stat.i.cache-miss-rate%
 1.005e+09 ±  3%     +47.1%  1.477e+09 ±  4%  perf-stat.i.cache-misses
 5.901e+09           +12.6%  6.647e+09        perf-stat.i.cache-references
  13105502 ±  4%     -99.1%     118914 ±  2%  perf-stat.i.context-switches
      3.21 ±  3%    +147.5%       7.94        perf-stat.i.cpi
 8.993e+11            +1.6%  9.135e+11        perf-stat.i.cpu-cycles
    902.91 ±  3%     -30.4%     628.78 ±  4%  perf-stat.i.cycles-between-cache-misses
 2.838e+11 ±  3%     -59.6%  1.147e+11        perf-stat.i.instructions
      0.32 ±  3%     -59.6%       0.13        perf-stat.i.ipc
     51.15 ±  4%    -100.0%       0.02 ± 40%  perf-stat.i.metric.K/sec
      4583 ±  3%     -12.8%       3996 ±  3%  perf-stat.i.minor-faults
      4583 ±  3%     -12.8%       3996 ±  3%  perf-stat.i.page-faults
      3.54 ±  5%    +263.3%      12.88 ±  3%  perf-stat.overall.MPKI
      0.34            -0.2        0.18        perf-stat.overall.branch-miss-rate%
     17.02 ±  2%      +5.2       22.22 ±  3%  perf-stat.overall.cache-miss-rate%
      3.17 ±  3%    +151.1%       7.97        perf-stat.overall.cpi
    896.34 ±  3%     -30.9%     619.58 ±  4%  perf-stat.overall.cycles-between-cache-misses
      0.32 ±  3%     -60.2%       0.13        perf-stat.overall.ipc
     15229           -25.3%      11379        perf-stat.overall.path-length
 5.593e+10 ±  2%     -55.7%  2.478e+10        perf-stat.ps.branch-instructions
 1.927e+08 ±  3%     -77.3%   43698386        perf-stat.ps.branch-misses
     1e+09 ±  3%     +47.1%  1.472e+09 ±  4%  perf-stat.ps.cache-misses
 5.876e+09           +12.7%  6.622e+09        perf-stat.ps.cache-references
  13049883 ±  4%     -99.1%     118750 ±  2%  perf-stat.ps.context-switches
 8.955e+11            +1.6%  9.099e+11        perf-stat.ps.cpu-cycles
 2.826e+11 ±  3%     -59.6%  1.143e+11        perf-stat.ps.instructions
      4539 ±  3%     -13.8%       3913 ±  2%  perf-stat.ps.minor-faults
      4539 ±  3%     -13.8%       3913 ±  2%  perf-stat.ps.page-faults
 8.548e+13 ±  3%     -59.5%  3.458e+13        perf-stat.total.instructions
     13.61 ±  3%      -8.7        4.94 ±  8%  perf-profile.calltrace.cycles-pp.__dev_queue_xmit.ip_finish_output2.ip_output.__ip_queue_xmit.__tcp_transmit_skb
     12.65 ±  3%      -7.9        4.75 ±  8%  perf-profile.calltrace.cycles-pp.__local_bh_enable_ip.__dev_queue_xmit.ip_finish_output2.ip_output.__ip_queue_xmit
     12.64 ±  3%      -7.9        4.75 ±  8%  perf-profile.calltrace.cycles-pp.do_softirq.__local_bh_enable_ip.__dev_queue_xmit.ip_finish_output2.ip_output
     12.60 ±  3%      -7.9        4.74 ±  8%  perf-profile.calltrace.cycles-pp.handle_softirqs.do_softirq.__local_bh_enable_ip.__dev_queue_xmit.ip_finish_output2
     12.34 ±  3%      -7.6        4.69 ±  8%  perf-profile.calltrace.cycles-pp.net_rx_action.handle_softirqs.do_softirq.__local_bh_enable_ip.__dev_queue_xmit
     29.70            -7.1       22.58 ± 13%  perf-profile.calltrace.cycles-pp.accept_connection.accept_connections.main
     29.70            -7.1       22.58 ± 13%  perf-profile.calltrace.cycles-pp.accept_connections.main
     29.70            -7.1       22.58 ± 13%  perf-profile.calltrace.cycles-pp.process_requests.spawn_child.accept_connection.accept_connections.main
     29.70            -7.1       22.58 ± 13%  perf-profile.calltrace.cycles-pp.spawn_child.accept_connection.accept_connections.main
     10.57 ±  4%      -6.2        4.34 ±  9%  perf-profile.calltrace.cycles-pp.__napi_poll.net_rx_action.handle_softirqs.do_softirq.__local_bh_enable_ip
     10.56 ±  4%      -6.2        4.34 ±  9%  perf-profile.calltrace.cycles-pp.process_backlog.__napi_poll.net_rx_action.handle_softirqs.do_softirq
      9.83 ±  3%      -6.2        3.67 ±  7%  perf-profile.calltrace.cycles-pp.ip_finish_output2.ip_output.__ip_queue_xmit.__tcp_transmit_skb.tcp_write_xmit
     10.35 ±  4%      -6.0        4.30 ±  9%  perf-profile.calltrace.cycles-pp.__netif_receive_skb_one_core.process_backlog.__napi_poll.net_rx_action.handle_softirqs
     10.01 ±  4%      -5.8        4.23 ±  9%  perf-profile.calltrace.cycles-pp.ip_local_deliver.__netif_receive_skb_one_core.process_backlog.__napi_poll.net_rx_action
      9.99 ±  4%      -5.8        4.23 ±  9%  perf-profile.calltrace.cycles-pp.ip_local_deliver_finish.ip_local_deliver.__netif_receive_skb_one_core.process_backlog.__napi_poll
      9.97 ±  4%      -5.8        4.22 ±  9%  perf-profile.calltrace.cycles-pp.ip_protocol_deliver_rcu.ip_local_deliver_finish.ip_local_deliver.__netif_receive_skb_one_core.process_backlog
      9.82 ±  4%      -5.6        4.19 ±  9%  perf-profile.calltrace.cycles-pp.tcp_v4_rcv.ip_protocol_deliver_rcu.ip_local_deliver_finish.ip_local_deliver.__netif_receive_skb_one_core
     29.70            -5.4       24.34 ± 10%  perf-profile.calltrace.cycles-pp.recv_omni.process_requests.spawn_child.accept_connection.accept_connections
      9.29 ±  4%      -5.2        4.09 ±  9%  perf-profile.calltrace.cycles-pp.tcp_v4_do_rcv.tcp_v4_rcv.ip_protocol_deliver_rcu.ip_local_deliver_finish.ip_local_deliver
      9.19 ±  4%      -5.1        4.06 ± 10%  perf-profile.calltrace.cycles-pp.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv.ip_protocol_deliver_rcu.ip_local_deliver_finish
     29.45            -4.2       25.25        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.recv_omni.process_requests.spawn_child.accept_connection
     29.43            -4.2       25.24        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.recv_omni.process_requests.spawn_child
      6.53 ±  5%      -3.8        2.74 ±  9%  perf-profile.calltrace.cycles-pp.tcp_data_queue.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv.ip_protocol_deliver_rcu
     28.92            -3.8       25.17        perf-profile.calltrace.cycles-pp.__x64_sys_recvfrom.do_syscall_64.entry_SYSCALL_64_after_hwframe.recv_omni.process_requests
     28.91            -3.7       25.17        perf-profile.calltrace.cycles-pp.__sys_recvfrom.__x64_sys_recvfrom.do_syscall_64.entry_SYSCALL_64_after_hwframe.recv_omni
     28.76            -3.6       25.13        perf-profile.calltrace.cycles-pp.sock_recvmsg.__sys_recvfrom.__x64_sys_recvfrom.do_syscall_64.entry_SYSCALL_64_after_hwframe
     28.74            -3.6       25.13        perf-profile.calltrace.cycles-pp.inet_recvmsg.sock_recvmsg.__sys_recvfrom.__x64_sys_recvfrom.do_syscall_64
     28.72            -3.6       25.13        perf-profile.calltrace.cycles-pp.tcp_recvmsg.inet_recvmsg.sock_recvmsg.__sys_recvfrom.__x64_sys_recvfrom
     28.42            -3.5       24.94        perf-profile.calltrace.cycles-pp.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg.sock_recvmsg.__sys_recvfrom
      4.22 ±  3%      -2.9        1.31 ± 16%  perf-profile.calltrace.cycles-pp.__tcp_transmit_skb.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg.sock_recvmsg
      4.06 ±  3%      -2.8        1.30 ± 16%  perf-profile.calltrace.cycles-pp.__ip_queue_xmit.__tcp_transmit_skb.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg
      3.96 ±  3%      -2.7        1.30 ± 16%  perf-profile.calltrace.cycles-pp.ip_output.__ip_queue_xmit.__tcp_transmit_skb.tcp_recvmsg_locked.tcp_recvmsg
      3.93 ±  3%      -2.6        1.30 ± 16%  perf-profile.calltrace.cycles-pp.ip_finish_output2.ip_output.__ip_queue_xmit.__tcp_transmit_skb.tcp_recvmsg_locked
      6.70 ±  3%      -2.6        4.10 ±  6%  perf-profile.calltrace.cycles-pp.tcp_write_xmit.tcp_sendmsg_locked.tcp_sendmsg.__sys_sendto.__x64_sys_sendto
      6.51 ±  5%      -2.5        4.02 ±  8%  perf-profile.calltrace.cycles-pp.tcp_wmem_schedule.tcp_sendmsg_locked.tcp_sendmsg.__sys_sendto.__x64_sys_sendto
      6.49 ±  5%      -2.5        4.00 ±  8%  perf-profile.calltrace.cycles-pp.__sk_mem_schedule.tcp_wmem_schedule.tcp_sendmsg_locked.tcp_sendmsg.__sys_sendto
      6.33 ±  3%      -2.5        3.84 ±  7%  perf-profile.calltrace.cycles-pp.__tcp_transmit_skb.tcp_write_xmit.tcp_sendmsg_locked.tcp_sendmsg.__sys_sendto
      6.47 ±  5%      -2.5        4.00 ±  8%  perf-profile.calltrace.cycles-pp.__sk_mem_raise_allocated.__sk_mem_schedule.tcp_wmem_schedule.tcp_sendmsg_locked.tcp_sendmsg
      6.16 ±  3%      -2.4        3.73 ±  7%  perf-profile.calltrace.cycles-pp.__ip_queue_xmit.__tcp_transmit_skb.tcp_write_xmit.tcp_sendmsg_locked.tcp_sendmsg
      6.08 ±  3%      -2.4        3.68 ±  7%  perf-profile.calltrace.cycles-pp.ip_output.__ip_queue_xmit.__tcp_transmit_skb.tcp_write_xmit.tcp_sendmsg_locked
      5.02 ±  6%      -1.6        3.39 ± 10%  perf-profile.calltrace.cycles-pp.mem_cgroup_sk_charge.__sk_mem_raise_allocated.__sk_mem_schedule.tcp_wmem_schedule.tcp_sendmsg_locked
      4.11 ±  8%      -1.5        2.60 ± 10%  perf-profile.calltrace.cycles-pp.tcp_try_rmem_schedule.tcp_data_queue.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv
      4.02 ±  4%      -1.4        2.59 ± 10%  perf-profile.calltrace.cycles-pp.__sk_mem_raise_allocated.__sk_mem_schedule.tcp_try_rmem_schedule.tcp_data_queue.tcp_rcv_established
      4.02 ±  4%      -1.4        2.60 ± 10%  perf-profile.calltrace.cycles-pp.__sk_mem_schedule.tcp_try_rmem_schedule.tcp_data_queue.tcp_rcv_established.tcp_v4_do_rcv
      3.70 ±  4%      -1.3        2.42 ± 11%  perf-profile.calltrace.cycles-pp.mem_cgroup_sk_charge.__sk_mem_raise_allocated.__sk_mem_schedule.tcp_try_rmem_schedule.tcp_data_queue
      4.00 ±  3%      -1.2        2.77 ± 10%  perf-profile.calltrace.cycles-pp.page_counter_try_charge.try_charge_memcg.mem_cgroup_sk_charge.__sk_mem_raise_allocated.__sk_mem_schedule
      4.09 ±  3%      -1.2        2.88 ± 10%  perf-profile.calltrace.cycles-pp.try_charge_memcg.mem_cgroup_sk_charge.__sk_mem_raise_allocated.__sk_mem_schedule.tcp_wmem_schedule
      3.48 ±  4%      -1.2        2.29 ± 11%  perf-profile.calltrace.cycles-pp.try_charge_memcg.mem_cgroup_sk_charge.__sk_mem_raise_allocated.__sk_mem_schedule.tcp_try_rmem_schedule
      2.63 ±  4%      -1.0        1.58 ± 25%  perf-profile.calltrace.cycles-pp.__sk_mem_reduce_allocated.tcp_clean_rtx_queue.tcp_ack.tcp_rcv_established.tcp_v4_do_rcv
      2.20 ±  4%      -1.0        1.23 ± 16%  perf-profile.calltrace.cycles-pp.tcp_ack.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv.ip_protocol_deliver_rcu
      2.80 ±  6%      -1.0        1.84 ± 19%  perf-profile.calltrace.cycles-pp.__sk_mem_reduce_allocated.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg.sock_recvmsg
      2.11 ±  4%      -0.9        1.22 ± 16%  perf-profile.calltrace.cycles-pp.tcp_clean_rtx_queue.tcp_ack.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv
      2.19 ±  3%      -0.7        1.45 ± 25%  perf-profile.calltrace.cycles-pp.refill_stock.__sk_mem_reduce_allocated.tcp_clean_rtx_queue.tcp_ack.tcp_rcv_established
      2.16 ±  3%      -0.7        1.44 ± 25%  perf-profile.calltrace.cycles-pp.drain_stock.refill_stock.__sk_mem_reduce_allocated.tcp_clean_rtx_queue.tcp_ack
      5.31            -0.7        4.60        perf-profile.calltrace.cycles-pp.skb_do_copy_data_nocache.tcp_sendmsg_locked.tcp_sendmsg.__sys_sendto.__x64_sys_sendto
      2.14 ±  3%      -0.7        1.43 ± 24%  perf-profile.calltrace.cycles-pp.page_counter_uncharge.drain_stock.refill_stock.__sk_mem_reduce_allocated.tcp_clean_rtx_queue
      5.10            -0.6        4.48        perf-profile.calltrace.cycles-pp._copy_from_iter.skb_do_copy_data_nocache.tcp_sendmsg_locked.tcp_sendmsg.__sys_sendto
      2.09 ±  5%      -0.6        1.54 ± 20%  perf-profile.calltrace.cycles-pp.refill_stock.__sk_mem_reduce_allocated.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg
      2.05 ±  5%      -0.5        1.52 ± 20%  perf-profile.calltrace.cycles-pp.drain_stock.refill_stock.__sk_mem_reduce_allocated.tcp_recvmsg_locked.tcp_recvmsg
      2.03 ±  5%      -0.5        1.51 ± 20%  perf-profile.calltrace.cycles-pp.page_counter_uncharge.drain_stock.refill_stock.__sk_mem_reduce_allocated.tcp_recvmsg_locked
     13.02 ±  4%      +2.3       15.30 ±  4%  perf-profile.calltrace.cycles-pp.skb_attempt_defer_free.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg.sock_recvmsg
     12.97 ±  4%      +2.3       15.26 ±  4%  perf-profile.calltrace.cycles-pp.skb_release_data.skb_attempt_defer_free.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg
     12.60 ±  4%      +2.3       14.93 ±  4%  perf-profile.calltrace.cycles-pp.free_pcppages_bulk.free_frozen_page_commit.__free_frozen_pages.skb_release_data.skb_attempt_defer_free
     12.88 ±  4%      +2.3       15.21 ±  4%  perf-profile.calltrace.cycles-pp.__free_frozen_pages.skb_release_data.skb_attempt_defer_free.tcp_recvmsg_locked.tcp_recvmsg
     12.75 ±  4%      +2.3       15.08 ±  4%  perf-profile.calltrace.cycles-pp.free_frozen_page_commit.__free_frozen_pages.skb_release_data.skb_attempt_defer_free.tcp_recvmsg_locked
     55.16            +3.3       58.50        perf-profile.calltrace.cycles-pp.tcp_sendmsg_locked.tcp_sendmsg.__sys_sendto.__x64_sys_sendto.do_syscall_64
     10.61 ±  2%      +3.9       14.55        perf-profile.calltrace.cycles-pp.__release_sock.release_sock.tcp_sendmsg.__sys_sendto.__x64_sys_sendto
     10.84 ±  2%      +3.9       14.79        perf-profile.calltrace.cycles-pp.release_sock.tcp_sendmsg.__sys_sendto.__x64_sys_sendto.do_syscall_64
      9.77 ±  3%      +4.7       14.44        perf-profile.calltrace.cycles-pp.tcp_rcv_established.tcp_v4_do_rcv.__release_sock.release_sock.tcp_sendmsg
      9.77 ±  3%      +4.7       14.44        perf-profile.calltrace.cycles-pp.tcp_v4_do_rcv.__release_sock.release_sock.tcp_sendmsg.__sys_sendto
     68.31            +5.4       73.75        perf-profile.calltrace.cycles-pp.send_tcp_stream.main
     68.29            +5.4       73.74        perf-profile.calltrace.cycles-pp.send_omni_inner.send_tcp_stream.main
      8.83 ±  3%      +5.5       14.33        perf-profile.calltrace.cycles-pp.tcp_ack.tcp_rcv_established.tcp_v4_do_rcv.__release_sock.release_sock
      8.77 ±  3%      +5.6       14.32        perf-profile.calltrace.cycles-pp.tcp_clean_rtx_queue.tcp_ack.tcp_rcv_established.tcp_v4_do_rcv.__release_sock
     67.68            +5.8       73.49        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.send_omni_inner.send_tcp_stream.main
     67.64            +5.8       73.47        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.send_omni_inner.send_tcp_stream.main
      7.56 ±  4%      +5.9       13.48        perf-profile.calltrace.cycles-pp.skb_release_data.__kfree_skb.tcp_clean_rtx_queue.tcp_ack.tcp_rcv_established
      7.61 ±  4%      +6.0       13.58        perf-profile.calltrace.cycles-pp.__kfree_skb.tcp_clean_rtx_queue.tcp_ack.tcp_rcv_established.tcp_v4_do_rcv
      7.46 ±  4%      +6.0       13.49        perf-profile.calltrace.cycles-pp.__free_frozen_pages.skb_release_data.__kfree_skb.tcp_clean_rtx_queue.tcp_ack
      7.12 ±  5%      +6.0       13.16        perf-profile.calltrace.cycles-pp.free_pcppages_bulk.free_frozen_page_commit.__free_frozen_pages.skb_release_data.__kfree_skb
      7.32 ±  4%      +6.0       13.36        perf-profile.calltrace.cycles-pp.free_frozen_page_commit.__free_frozen_pages.skb_release_data.__kfree_skb.tcp_clean_rtx_queue
     66.66            +7.0       73.62        perf-profile.calltrace.cycles-pp.__x64_sys_sendto.do_syscall_64.entry_SYSCALL_64_after_hwframe.send_omni_inner.send_tcp_stream
     66.63            +7.0       73.61        perf-profile.calltrace.cycles-pp.__sys_sendto.__x64_sys_sendto.do_syscall_64.entry_SYSCALL_64_after_hwframe.send_omni_inner
     66.31            +7.1       73.46        perf-profile.calltrace.cycles-pp.tcp_sendmsg.__sys_sendto.__x64_sys_sendto.do_syscall_64.entry_SYSCALL_64_after_hwframe
     19.44 ±  3%      +8.4       27.80 ±  2%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.free_pcppages_bulk.free_frozen_page_commit.__free_frozen_pages
     19.48 ±  3%      +8.4       27.83 ±  2%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.free_pcppages_bulk.free_frozen_page_commit.__free_frozen_pages.skb_release_data
     30.92 ±  3%     +13.3       44.19        perf-profile.calltrace.cycles-pp.sk_page_frag_refill.tcp_sendmsg_locked.tcp_sendmsg.__sys_sendto.__x64_sys_sendto
     30.91 ±  3%     +13.3       44.18        perf-profile.calltrace.cycles-pp.skb_page_frag_refill.sk_page_frag_refill.tcp_sendmsg_locked.tcp_sendmsg.__sys_sendto
     30.81 ±  3%     +13.3       44.13        perf-profile.calltrace.cycles-pp.alloc_pages_noprof.skb_page_frag_refill.sk_page_frag_refill.tcp_sendmsg_locked.tcp_sendmsg
     30.79 ±  3%     +13.3       44.12        perf-profile.calltrace.cycles-pp.alloc_pages_mpol.alloc_pages_noprof.skb_page_frag_refill.sk_page_frag_refill.tcp_sendmsg_locked
     30.77 ±  3%     +13.3       44.11        perf-profile.calltrace.cycles-pp.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.skb_page_frag_refill.sk_page_frag_refill
     30.71 ±  3%     +13.4       44.07        perf-profile.calltrace.cycles-pp.get_page_from_freelist.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.skb_page_frag_refill
     29.25 ±  3%     +13.7       42.90        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.rmqueue_bulk.__rmqueue_pcplist.rmqueue_pcplist
     29.29 ±  3%     +13.7       42.95        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.rmqueue_bulk.__rmqueue_pcplist.rmqueue_pcplist.rmqueue
     29.96 ±  3%     +13.7       43.62        perf-profile.calltrace.cycles-pp.rmqueue.get_page_from_freelist.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof
     29.82 ±  3%     +13.7       43.52        perf-profile.calltrace.cycles-pp.rmqueue_pcplist.rmqueue.get_page_from_freelist.__alloc_frozen_pages_noprof.alloc_pages_mpol
     29.70 ±  3%     +13.7       43.44        perf-profile.calltrace.cycles-pp.rmqueue_bulk.__rmqueue_pcplist.rmqueue_pcplist.rmqueue.get_page_from_freelist
     29.76 ±  3%     +13.7       43.49        perf-profile.calltrace.cycles-pp.__rmqueue_pcplist.rmqueue_pcplist.rmqueue.get_page_from_freelist.__alloc_frozen_pages_noprof
     14.77 ±  3%      -9.1        5.63 ±  6%  perf-profile.children.cycles-pp.__tcp_transmit_skb
     14.21 ±  3%      -8.7        5.50 ±  7%  perf-profile.children.cycles-pp.__ip_queue_xmit
     13.95 ±  3%      -8.5        5.44 ±  7%  perf-profile.children.cycles-pp.ip_output
     13.85 ±  3%      -8.4        5.42 ±  7%  perf-profile.children.cycles-pp.ip_finish_output2
     13.71 ±  3%      -8.3        5.40 ±  7%  perf-profile.children.cycles-pp.__dev_queue_xmit
     12.80 ±  3%      -7.6        5.21 ±  7%  perf-profile.children.cycles-pp.__local_bh_enable_ip
     12.72 ±  3%      -7.5        5.18 ±  7%  perf-profile.children.cycles-pp.do_softirq
     12.80 ±  3%      -7.4        5.36 ±  7%  perf-profile.children.cycles-pp.handle_softirqs
     12.52 ±  3%      -7.2        5.28 ±  7%  perf-profile.children.cycles-pp.net_rx_action
     11.49 ±  3%      -6.9        4.63 ±  6%  perf-profile.children.cycles-pp.tcp_write_xmit
     10.64 ±  4%      -5.9        4.70 ±  8%  perf-profile.children.cycles-pp.__napi_poll
     10.62 ±  4%      -5.9        4.69 ±  8%  perf-profile.children.cycles-pp.process_backlog
     10.42 ±  4%      -5.8        4.65 ±  8%  perf-profile.children.cycles-pp.__netif_receive_skb_one_core
     10.08 ±  4%      -5.5        4.58 ±  8%  perf-profile.children.cycles-pp.ip_local_deliver
     10.06 ±  4%      -5.5        4.58 ±  8%  perf-profile.children.cycles-pp.ip_local_deliver_finish
     10.04 ±  4%      -5.5        4.57 ±  8%  perf-profile.children.cycles-pp.ip_protocol_deliver_rcu
      9.91 ±  4%      -5.4        4.53 ±  8%  perf-profile.children.cycles-pp.tcp_v4_rcv
     29.70            -5.4       24.34 ± 10%  perf-profile.children.cycles-pp.accept_connections
     11.68 ±  5%      -4.7        6.99 ±  9%  perf-profile.children.cycles-pp.__sk_mem_schedule
     11.66 ±  5%      -4.7        6.98 ±  9%  perf-profile.children.cycles-pp.__sk_mem_raise_allocated
     29.70            -4.4       25.31        perf-profile.children.cycles-pp.accept_connection
     29.70            -4.4       25.31        perf-profile.children.cycles-pp.process_requests
     29.70            -4.4       25.31        perf-profile.children.cycles-pp.recv_omni
     29.70            -4.4       25.31        perf-profile.children.cycles-pp.spawn_child
      4.76 ±  4%      -4.3        0.50 ±  3%  perf-profile.children.cycles-pp.__tcp_push_pending_frames
     29.21            -4.0       25.18        perf-profile.children.cycles-pp.__x64_sys_recvfrom
     29.20            -4.0       25.18        perf-profile.children.cycles-pp.__sys_recvfrom
     29.05            -3.9       25.14        perf-profile.children.cycles-pp.sock_recvmsg
     29.02            -3.9       25.14        perf-profile.children.cycles-pp.inet_recvmsg
     29.02            -3.9       25.14        perf-profile.children.cycles-pp.tcp_recvmsg
     28.73            -3.8       24.95        perf-profile.children.cycles-pp.tcp_recvmsg_locked
      6.76 ±  5%      -3.7        3.03 ±  9%  perf-profile.children.cycles-pp.tcp_data_queue
      9.77 ±  6%      -3.6        6.19 ± 10%  perf-profile.children.cycles-pp.mem_cgroup_sk_charge
      8.22 ±  3%      -2.7        5.51 ± 10%  perf-profile.children.cycles-pp.try_charge_memcg
      6.56 ±  6%      -2.5        4.05 ±  8%  perf-profile.children.cycles-pp.tcp_wmem_schedule
      2.59 ±  4%      -2.5        0.12 ±  3%  perf-profile.children.cycles-pp.__schedule
      2.36 ±  4%      -2.3        0.10        perf-profile.children.cycles-pp.schedule
      5.00 ±  5%      -2.2        2.84 ± 10%  perf-profile.children.cycles-pp.tcp_try_rmem_schedule
      1.96 ±  4%      -1.9        0.08        perf-profile.children.cycles-pp.sk_wait_data
      1.78 ±  4%      -1.7        0.08        perf-profile.children.cycles-pp.wait_woken
      5.44 ±  5%      -1.7        3.76 ± 11%  perf-profile.children.cycles-pp.__sk_mem_reduce_allocated
      1.69 ±  4%      -1.6        0.08        perf-profile.children.cycles-pp.schedule_timeout
      2.34 ± 33%      -1.4        0.92 ± 13%  perf-profile.children.cycles-pp.mod_memcg_state
      1.48 ±  5%      -1.4        0.11 ±  4%  perf-profile.children.cycles-pp.sock_def_readable
      4.32 ±  3%      -1.4        2.95 ± 10%  perf-profile.children.cycles-pp.page_counter_try_charge
      1.44 ±  5%      -1.3        0.09 ±  5%  perf-profile.children.cycles-pp.__wake_up_sync_key
      1.40 ±  5%      -1.3        0.08        perf-profile.children.cycles-pp.__wake_up_common
      1.36 ±  5%      -1.3        0.06 ±  7%  perf-profile.children.cycles-pp.try_to_wake_up
      1.78 ±  2%      -1.2        0.56 ±  5%  perf-profile.children.cycles-pp.skb_defer_free_flush
      1.50 ±  5%      -1.2        0.32 ±  3%  perf-profile.children.cycles-pp.tcp_stream_alloc_skb
      1.27 ±  3%      -1.1        0.14 ±  3%  perf-profile.children.cycles-pp.exit_to_user_mode_loop
      4.29 ±  4%      -1.0        3.29 ± 12%  perf-profile.children.cycles-pp.refill_stock
      4.22 ±  4%      -1.0        3.26 ± 12%  perf-profile.children.cycles-pp.drain_stock
      4.27 ±  4%      -0.9        3.35 ± 12%  perf-profile.children.cycles-pp.page_counter_uncharge
      1.08 ±  4%      -0.9        0.16 ±  2%  perf-profile.children.cycles-pp.__alloc_skb
      0.83 ±  5%      -0.7        0.09 ±  5%  perf-profile.children.cycles-pp.kmem_cache_alloc_node_noprof
      5.37            -0.7        4.64        perf-profile.children.cycles-pp.skb_do_copy_data_nocache
      5.14            -0.6        4.52        perf-profile.children.cycles-pp._copy_from_iter
      0.74 ±  2%      -0.6        0.14        perf-profile.children.cycles-pp._find_next_bit
      0.82 ± 33%      -0.6        0.25 ± 14%  perf-profile.children.cycles-pp.mem_cgroup_sk_uncharge
      0.66 ± 21%      -0.5        0.14 ± 70%  perf-profile.children.cycles-pp.css_rstat_updated
      0.51 ±  2%      -0.4        0.10 ±  4%  perf-profile.children.cycles-pp.dev_hard_start_xmit
      0.46 ±  2%      -0.4        0.09 ±  5%  perf-profile.children.cycles-pp.loopback_xmit
      0.45 ±  5%      -0.4        0.08        perf-profile.children.cycles-pp.kmem_cache_free
      0.42 ±  2%      -0.4        0.07        perf-profile.children.cycles-pp.arch_exit_to_user_mode_prepare
      0.36 ±  3%      -0.3        0.06        perf-profile.children.cycles-pp.__cond_resched
      0.30            -0.2        0.06 ±  7%  perf-profile.children.cycles-pp.__netif_rx
      0.40            -0.2        0.17 ±  2%  perf-profile.children.cycles-pp.ktime_get
      0.29            -0.2        0.06 ± 11%  perf-profile.children.cycles-pp.netif_rx_internal
      0.28            -0.2        0.06 ± 11%  perf-profile.children.cycles-pp.enqueue_to_backlog
      0.49 ±  2%      -0.2        0.32        perf-profile.children.cycles-pp.__check_object_size
      0.32 ±  2%      -0.2        0.16 ±  2%  perf-profile.children.cycles-pp.__zone_watermark_ok
      0.20 ±  3%      -0.2        0.05        perf-profile.children.cycles-pp.__inet_lookup_skb
      0.20 ±  3%      -0.1        0.06 ±  9%  perf-profile.children.cycles-pp.tcp_mstamp_refresh
      0.22 ±  2%      -0.1        0.09        perf-profile.children.cycles-pp.read_tsc
      0.41 ±  2%      -0.1        0.28 ±  3%  perf-profile.children.cycles-pp._raw_spin_lock_bh
      0.20 ±  2%      -0.1        0.08        perf-profile.children.cycles-pp.fdget
      0.32 ±  9%      -0.1        0.19 ± 15%  perf-profile.children.cycles-pp.record__mmap_read_evlist
      0.31 ± 10%      -0.1        0.19 ± 13%  perf-profile.children.cycles-pp.perf_mmap__push
      0.32 ± 10%      -0.1        0.20 ± 13%  perf-profile.children.cycles-pp.handle_internal_command
      0.32 ± 10%      -0.1        0.20 ± 13%  perf-profile.children.cycles-pp.run_builtin
      0.38            -0.1        0.27        perf-profile.children.cycles-pp.check_heap_object
      0.20            -0.1        0.09        perf-profile.children.cycles-pp.sk_reset_timer
      0.27            -0.1        0.16 ±  4%  perf-profile.children.cycles-pp.tcp_event_new_data_sent
      0.18 ±  3%      -0.1        0.08 ±  4%  perf-profile.children.cycles-pp.lock_sock_nested
      0.19 ±  2%      -0.1        0.09 ±  5%  perf-profile.children.cycles-pp.__mod_timer
      0.32 ±  2%      -0.1        0.23        perf-profile.children.cycles-pp.simple_copy_to_iter
      0.14 ±  3%      -0.1        0.05        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.22 ± 11%      -0.1        0.14 ± 12%  perf-profile.children.cycles-pp.record__pushfn
      0.20 ± 10%      -0.1        0.13 ± 13%  perf-profile.children.cycles-pp.ksys_write
      0.19 ± 10%      -0.1        0.12 ± 12%  perf-profile.children.cycles-pp.vfs_write
      0.15 ±  4%      -0.1        0.08 ±  6%  perf-profile.children.cycles-pp.tcp_send_mss
      0.18 ±  9%      -0.1        0.11 ± 13%  perf-profile.children.cycles-pp.shmem_file_write_iter
      0.12 ±  4%      -0.1        0.05        perf-profile.children.cycles-pp.__virt_addr_valid
      0.13 ±  5%      -0.1        0.06 ±  6%  perf-profile.children.cycles-pp.tcp_current_mss
      0.09 ±  5%      -0.1        0.02 ± 99%  perf-profile.children.cycles-pp.tcp_queue_rcv
      0.17 ± 10%      -0.1        0.11 ± 11%  perf-profile.children.cycles-pp.generic_perform_write
      0.09 ± 10%      -0.1        0.04 ± 71%  perf-profile.children.cycles-pp.copy_folio_from_iter_atomic
      0.12 ±  6%      -0.0        0.07 ± 10%  perf-profile.children.cycles-pp.sock_rfree
      0.07 ±  5%      -0.0        0.03 ± 70%  perf-profile.children.cycles-pp.tcp_tso_segs
      0.26 ±  4%      -0.0        0.23 ±  2%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.25 ±  4%      -0.0        0.22 ±  2%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.11 ±  3%      -0.0        0.09        perf-profile.children.cycles-pp.task_mm_cid_work
      0.11 ±  3%      -0.0        0.09        perf-profile.children.cycles-pp.task_work_run
      0.15 ±  3%      -0.0        0.13 ±  5%  perf-profile.children.cycles-pp._raw_spin_trylock
      0.07            -0.0        0.05 ±  7%  perf-profile.children.cycles-pp.prep_new_page
      0.35 ±  3%      -0.0        0.33        perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.08            -0.0        0.07        perf-profile.children.cycles-pp.__mod_zone_page_state
      0.19 ± 10%      +0.1        0.24 ± 12%  perf-profile.children.cycles-pp.napi_consume_skb
      0.08 ± 11%      +0.1        0.15 ± 14%  perf-profile.children.cycles-pp.sysvec_call_function_single
      0.08 ± 11%      +0.1        0.15 ± 13%  perf-profile.children.cycles-pp.asm_sysvec_call_function_single
      0.11 ±  8%      +0.1        0.19 ±  9%  perf-profile.children.cycles-pp.__irq_exit_rcu
      0.09 ± 10%      +0.1        0.17 ± 10%  perf-profile.children.cycles-pp.free_one_page
     98.46            +1.0       99.48        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     98.38            +1.1       99.46        perf-profile.children.cycles-pp.do_syscall_64
     13.02 ±  4%      +2.3       15.30 ±  4%  perf-profile.children.cycles-pp.skb_attempt_defer_free
     55.65            +3.1       58.72        perf-profile.children.cycles-pp.tcp_sendmsg_locked
     11.15 ±  2%      +3.9       15.07        perf-profile.children.cycles-pp.release_sock
     10.86 ±  2%      +3.9       14.80        perf-profile.children.cycles-pp.__release_sock
     11.21 ±  2%      +4.6       15.85 ±  2%  perf-profile.children.cycles-pp.tcp_ack
     10.96 ±  2%      +4.9       15.81 ±  2%  perf-profile.children.cycles-pp.tcp_clean_rtx_queue
     68.78            +5.5       74.32        perf-profile.children.cycles-pp.send_omni_inner
     68.66            +5.6       74.24        perf-profile.children.cycles-pp.send_tcp_stream
      7.93 ±  4%      +6.0       13.90        perf-profile.children.cycles-pp.__kfree_skb
     67.12            +6.8       73.87        perf-profile.children.cycles-pp.__x64_sys_sendto
     67.10            +6.8       73.86        perf-profile.children.cycles-pp.__sys_sendto
     66.78            +6.9       73.72        perf-profile.children.cycles-pp.tcp_sendmsg
     20.99 ±  3%      +8.3       29.30 ±  2%  perf-profile.children.cycles-pp.skb_release_data
     20.58 ±  3%      +8.5       29.08 ±  2%  perf-profile.children.cycles-pp.__free_frozen_pages
     19.95 ±  3%      +8.5       28.46 ±  2%  perf-profile.children.cycles-pp.free_pcppages_bulk
     20.30 ±  3%      +8.5       28.83 ±  2%  perf-profile.children.cycles-pp.free_frozen_page_commit
     31.13 ±  3%     +13.3       44.42        perf-profile.children.cycles-pp.sk_page_frag_refill
     31.12 ±  3%     +13.3       44.42        perf-profile.children.cycles-pp.skb_page_frag_refill
     31.01 ±  3%     +13.4       44.36        perf-profile.children.cycles-pp.alloc_pages_noprof
     31.02 ±  3%     +13.4       44.38        perf-profile.children.cycles-pp.alloc_pages_mpol
     30.99 ±  3%     +13.4       44.36        perf-profile.children.cycles-pp.__alloc_frozen_pages_noprof
     30.93 ±  3%     +13.4       44.32        perf-profile.children.cycles-pp.get_page_from_freelist
     30.17 ±  3%     +13.7       43.86        perf-profile.children.cycles-pp.rmqueue
     30.03 ±  3%     +13.7       43.77        perf-profile.children.cycles-pp.rmqueue_pcplist
     29.96 ±  3%     +13.8       43.73        perf-profile.children.cycles-pp.__rmqueue_pcplist
     29.92 ±  3%     +13.8       43.70        perf-profile.children.cycles-pp.rmqueue_bulk
     49.50 ±  3%     +22.1       71.62        perf-profile.children.cycles-pp._raw_spin_lock_irqsave
     49.22 ±  3%     +22.3       71.47        perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      2.18 ±  6%      -1.4        0.82 ±  6%  perf-profile.self.cycles-pp.__sk_mem_raise_allocated
      4.28 ±  3%      -1.4        2.92 ± 10%  perf-profile.self.cycles-pp.page_counter_try_charge
      3.88 ±  4%      -1.3        2.55 ± 11%  perf-profile.self.cycles-pp.try_charge_memcg
      4.24 ±  4%      -0.9        3.32 ± 12%  perf-profile.self.cycles-pp.page_counter_uncharge
      0.91 ±  2%      -0.7        0.19        perf-profile.self.cycles-pp.skb_defer_free_flush
      5.12            -0.6        4.50        perf-profile.self.cycles-pp._copy_from_iter
      0.66 ±  2%      -0.5        0.13 ±  2%  perf-profile.self.cycles-pp._find_next_bit
      0.64 ± 21%      -0.5        0.14 ± 70%  perf-profile.self.cycles-pp.css_rstat_updated
      0.53 ±  7%      -0.5        0.05        perf-profile.self.cycles-pp.kmem_cache_alloc_node_noprof
      0.41 ±  6%      -0.4        0.05        perf-profile.self.cycles-pp.kmem_cache_free
      1.02            -0.3        0.74        perf-profile.self.cycles-pp.tcp_sendmsg_locked
      0.28 ±  4%      -0.2        0.06        perf-profile.self.cycles-pp.__tcp_transmit_skb
      0.30 ± 10%      -0.2        0.08 ±  4%  perf-profile.self.cycles-pp.__dev_queue_xmit
      0.32 ±  3%      -0.2        0.16        perf-profile.self.cycles-pp.__zone_watermark_ok
      0.30            -0.2        0.14        perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.23 ±  4%      -0.1        0.09        perf-profile.self.cycles-pp.tcp_write_xmit
      0.25            -0.1        0.11 ±  9%  perf-profile.self.cycles-pp.__sk_mem_reduce_allocated
      0.19 ±  4%      -0.1        0.06 ±  8%  perf-profile.self.cycles-pp.__alloc_skb
      0.38            -0.1        0.24 ±  2%  perf-profile.self.cycles-pp.get_page_from_freelist
      0.21 ±  2%      -0.1        0.09 ±  5%  perf-profile.self.cycles-pp.read_tsc
      0.20            -0.1        0.08        perf-profile.self.cycles-pp.fdget
      0.19            -0.1        0.09        perf-profile.self.cycles-pp.send_omni_inner
      0.38 ±  2%      -0.1        0.28 ±  2%  perf-profile.self.cycles-pp._raw_spin_lock_bh
      0.18 ±  3%      -0.1        0.08 ±  8%  perf-profile.self.cycles-pp.ktime_get
      0.12 ±  3%      -0.1        0.03 ± 70%  perf-profile.self.cycles-pp.do_syscall_64
      0.13 ±  3%      -0.1        0.05        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.20 ±  2%      -0.1        0.13 ±  2%  perf-profile.self.cycles-pp.skb_release_data
      0.12 ±  3%      -0.1        0.05        perf-profile.self.cycles-pp.arch_exit_to_user_mode_prepare
      0.13 ±  2%      -0.1        0.06        perf-profile.self.cycles-pp.tcp_clean_rtx_queue
      0.21 ±  2%      -0.1        0.15        perf-profile.self.cycles-pp.free_frozen_page_commit
      0.11            -0.1        0.05        perf-profile.self.cycles-pp.__virt_addr_valid
      0.11 ±  4%      -0.1        0.06 ±  8%  perf-profile.self.cycles-pp.__sys_sendto
      0.09 ± 11%      -0.1        0.04 ± 71%  perf-profile.self.cycles-pp.copy_folio_from_iter_atomic
      0.10 ±  4%      -0.0        0.06 ± 13%  perf-profile.self.cycles-pp.skb_page_frag_refill
      0.14 ±  2%      -0.0        0.09        perf-profile.self.cycles-pp.rmqueue
      0.12 ±  6%      -0.0        0.07 ± 10%  perf-profile.self.cycles-pp.sock_rfree
      0.08 ±  4%      -0.0        0.05        perf-profile.self.cycles-pp.__check_object_size
      0.10            -0.0        0.07        perf-profile.self.cycles-pp.__skb_datagram_iter
      0.24 ±  3%      -0.0        0.21        perf-profile.self.cycles-pp.check_heap_object
      0.10 ±  4%      -0.0        0.08 ±  4%  perf-profile.self.cycles-pp.task_mm_cid_work
      0.07            -0.0        0.05        perf-profile.self.cycles-pp.prep_new_page
      0.14 ±  3%      -0.0        0.12 ±  3%  perf-profile.self.cycles-pp.__free_frozen_pages
      0.08            -0.0        0.07        perf-profile.self.cycles-pp.__mod_zone_page_state
      0.28            +0.0        0.31        perf-profile.self.cycles-pp.rmqueue_bulk
     49.22 ±  3%     +22.3       71.47        perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath



***************************************************************************************************
lkp-icl-2sp7: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory
=========================================================================================
cluster/compiler/cpufreq_governor/ip/kconfig/nr_threads/rootfs/runtime/tbox_group/test/testcase:
  cs-localhost/gcc-14/performance/ipv4/x86_64-rhel-9.4/200%/debian-13-x86_64-20250902.cgz/300s/lkp-icl-2sp7/UDP_STREAM/netperf

commit: 
  aceccac58a ("sched/fair: Enable scheduler feature NEXT_BUDDY")
  e837456fdc ("sched/fair: Reimplement NEXT_BUDDY to align with EEVDF goals")

aceccac58ad76305 e837456fdca81899a3c8e47b3fd 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      0.41           +15.7%       0.48        turbostat.IPC
  38905511 ±  2%     -32.1%   26434178        turbostat.IRQ
      0.51 ±  3%      -0.1        0.43 ±  5%  mpstat.cpu.all.irq%
     10.83            +1.4       12.25        mpstat.cpu.all.soft%
      4.82            -1.0        3.84        mpstat.cpu.all.usr%
    346.00 ± 54%     -73.9%      90.17 ± 12%  perf-c2c.DRAM.local
    293.33 ±  6%     -25.0%     220.00 ±  7%  perf-c2c.DRAM.remote
    316.83 ± 14%     -40.7%     187.83 ±  4%  perf-c2c.HITM.local
   2237868 ±  7%     -66.6%     746407 ± 31%  numa-meminfo.node1.Active
   2237861 ±  7%     -66.6%     746399 ± 31%  numa-meminfo.node1.Active(anon)
    920097 ±  5%     -91.4%      79445 ± 36%  numa-meminfo.node1.Mapped
   1827808 ±  4%     -80.4%     359128 ± 21%  numa-meminfo.node1.Shmem
 9.868e+08           +59.2%  1.571e+09        numa-numastat.node0.local_node
 9.872e+08           +59.3%  1.572e+09        numa-numastat.node0.numa_hit
 9.894e+08           +58.0%  1.564e+09        numa-numastat.node1.local_node
 9.897e+08           +58.1%  1.565e+09        numa-numastat.node1.numa_hit
   2698776 ±  3%     -52.5%    1282346        meminfo.Active
   2698759 ±  3%     -52.5%    1282330        meminfo.Active(anon)
   5507214           -24.8%    4141246        meminfo.Cached
   2895007 ±  3%     -49.2%    1470651        meminfo.Committed_AS
    965473 ±  4%     -86.6%     129611 ±  3%  meminfo.Mapped
   7744696           -20.9%    6123507        meminfo.Memused
   1857326 ±  4%     -73.5%     491359 ±  2%  meminfo.Shmem
   7904102           -18.6%    6430487        meminfo.max_used_kB
 9.872e+08           +59.2%  1.572e+09        numa-vmstat.node0.numa_hit
 9.868e+08           +59.2%  1.571e+09        numa-vmstat.node0.numa_local
    559266 ±  6%     -66.6%     186538 ± 31%  numa-vmstat.node1.nr_active_anon
    229976 ±  5%     -91.3%      19968 ± 36%  numa-vmstat.node1.nr_mapped
    456763 ±  4%     -80.4%      89691 ± 21%  numa-vmstat.node1.nr_shmem
    559265 ±  6%     -66.6%     186538 ± 31%  numa-vmstat.node1.nr_zone_active_anon
 9.897e+08           +58.1%  1.565e+09        numa-vmstat.node1.numa_hit
 9.894e+08           +58.0%  1.563e+09        numa-vmstat.node1.numa_local
     34140           +25.1%      42724        netperf.ThroughputBoth_Mbps
   4358661           +25.5%    5468692        netperf.ThroughputBoth_total_Mbps
      8055           -96.9%     247.87        netperf.ThroughputRecv_Mbps
   1028447           -96.9%      31727        netperf.ThroughputRecv_total_Mbps
     26085           +62.8%      42476        netperf.Throughput_Mbps
   3330213           +63.3%    5436965        netperf.Throughput_total_Mbps
 5.371e+08           -99.0%    5541031 ±  2%  netperf.time.involuntary_context_switches
      4320           +25.2%       5411        netperf.time.percent_of_cpu_this_job_got
     12574           +25.3%      15761        netperf.time.system_time
    450.18           +22.0%     549.00        netperf.time.user_time
 2.495e+09           +25.5%  3.131e+09        netperf.workload
      0.27 ±  6%   +1161.7%       3.40 ±  8%  perf-sched.sch_delay.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      2794 ± 38%     -90.5%     265.06 ± 93%  perf-sched.sch_delay.max.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      0.27 ±  6%   +1161.7%       3.40 ±  8%  perf-sched.total_sch_delay.average.ms
      2794 ± 38%     -90.5%     265.06 ± 93%  perf-sched.total_sch_delay.max.ms
      0.91 ±  6%   +1352.6%      13.20 ±  8%  perf-sched.total_wait_and_delay.average.ms
   2462084 ±  5%     -92.3%     190024 ±  9%  perf-sched.total_wait_and_delay.count.ms
      6494 ± 26%     -46.2%       3496 ± 22%  perf-sched.total_wait_and_delay.max.ms
      0.64 ±  6%   +1433.6%       9.80 ±  8%  perf-sched.total_wait_time.average.ms
      0.91 ±  6%   +1352.6%      13.20 ±  8%  perf-sched.wait_and_delay.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
   2462084 ±  5%     -92.3%     190024 ±  9%  perf-sched.wait_and_delay.count.[unknown].[unknown].[unknown].[unknown].[unknown]
      6494 ± 26%     -46.2%       3496 ± 22%  perf-sched.wait_and_delay.max.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      0.64 ±  6%   +1433.6%       9.80 ±  8%  perf-sched.wait_time.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
    674539 ±  3%     -52.5%     320570        proc-vmstat.nr_active_anon
    211249            -6.0%     198638        proc-vmstat.nr_anon_pages
   1376660           -24.8%    1035301        proc-vmstat.nr_file_pages
    241501 ±  4%     -86.6%      32481 ±  4%  proc-vmstat.nr_mapped
      6132            -8.8%       5591        proc-vmstat.nr_page_table_pages
    464187 ±  4%     -73.5%     122828 ±  2%  proc-vmstat.nr_shmem
     24038            -3.0%      23313        proc-vmstat.nr_slab_reclaimable
    674539 ±  3%     -52.5%     320570        proc-vmstat.nr_zone_active_anon
     80418 ± 37%     -60.3%      31908 ± 44%  proc-vmstat.numa_hint_faults
     57550 ± 48%     -81.8%      10457 ± 46%  proc-vmstat.numa_hint_faults_local
 1.977e+09           +58.7%  3.137e+09        proc-vmstat.numa_hit
 1.976e+09           +58.6%  3.134e+09        proc-vmstat.numa_local
 1.579e+10           +58.6%  2.504e+10        proc-vmstat.pgalloc_normal
   1101653 ±  2%      -8.2%    1011454 ±  2%  proc-vmstat.pgfault
 1.579e+10           +58.6%  2.504e+10        proc-vmstat.pgfree
      0.97 ± 15%     +42.9%       1.39 ±  5%  sched_debug.cfs_rq:/.h_nr_queued.min
      0.62 ±  5%     -27.8%       0.45 ± 10%  sched_debug.cfs_rq:/.h_nr_queued.stddev
      0.86 ± 20%     +61.3%       1.39 ±  5%  sched_debug.cfs_rq:/.h_nr_runnable.min
      0.63 ±  5%     -28.9%       0.45 ± 10%  sched_debug.cfs_rq:/.h_nr_runnable.stddev
      6985 ±  9%     +18.9%       8302 ± 10%  sched_debug.cfs_rq:/.load.min
      2378           +11.4%       2650        sched_debug.cfs_rq:/.runnable_avg.avg
      1087 ±  6%     +30.0%       1413 ±  7%  sched_debug.cfs_rq:/.runnable_avg.min
    117.90 ±  3%      -9.9%     106.19 ±  7%  sched_debug.cfs_rq:/.util_avg.stddev
     77.97 ± 13%     +68.2%     131.17 ± 17%  sched_debug.cfs_rq:/.util_est.min
     15.15 ±  8%     -38.5%       9.33 ± 14%  sched_debug.cpu.clock.stddev
      1.17 ± 14%     +31.0%       1.53 ±  4%  sched_debug.cpu.nr_running.min
      0.60 ±  6%     -28.3%       0.43 ± 10%  sched_debug.cpu.nr_running.stddev
   8447772           -98.8%     104295 ±  3%  sched_debug.cpu.nr_switches.avg
  10523551           -98.1%     198136 ± 15%  sched_debug.cpu.nr_switches.max
   7002565 ±  3%     -98.9%      78989        sched_debug.cpu.nr_switches.min
    828947 ± 24%     -97.0%      24655 ± 20%  sched_debug.cpu.nr_switches.stddev
    -25.50           -54.8%     -11.53        sched_debug.cpu.nr_uninterruptible.min
      0.22 ± 24%     -51.4%       0.11 ±  3%  perf-stat.i.MPKI
 1.635e+10           +13.3%  1.852e+10        perf-stat.i.branch-instructions
      0.98            -0.1        0.89        perf-stat.i.branch-miss-rate%
 1.597e+08            +3.2%  1.648e+08        perf-stat.i.branch-misses
      1.48 ± 20%      +3.0        4.52        perf-stat.i.cache-miss-rate%
  17122920 ± 24%     -48.6%    8805315        perf-stat.i.cache-misses
 1.456e+09           -86.0%  2.034e+08        perf-stat.i.cache-references
   3589108           -98.8%      42008 ±  3%  perf-stat.i.context-switches
      2.42           -13.6%       2.09        perf-stat.i.cpi
     13131 ± 18%     +95.0%      25609        perf-stat.i.cycles-between-cache-misses
 8.152e+10           +15.4%  9.407e+10        perf-stat.i.instructions
      0.42           +15.2%       0.48        perf-stat.i.ipc
     56.08           -99.8%       0.14 ± 22%  perf-stat.i.metric.K/sec
      3305 ±  2%      -9.0%       3008 ±  2%  perf-stat.i.minor-faults
      3305 ±  2%      -9.0%       3008 ±  2%  perf-stat.i.page-faults
      0.21 ± 25%     -55.5%       0.09 ±  2%  perf-stat.overall.MPKI
      0.98            -0.1        0.89        perf-stat.overall.branch-miss-rate%
      1.18 ± 25%      +3.2        4.33        perf-stat.overall.cache-miss-rate%
      2.41           -13.3%       2.09        perf-stat.overall.cpi
     12049 ± 19%     +85.5%      22350        perf-stat.overall.cycles-between-cache-misses
      0.41           +15.3%       0.48        perf-stat.overall.ipc
      9845            -7.9%       9062        perf-stat.overall.path-length
  1.63e+10           +13.2%  1.846e+10        perf-stat.ps.branch-instructions
 1.592e+08            +3.2%  1.643e+08        perf-stat.ps.branch-misses
  17062129 ± 24%     -48.6%    8773490        perf-stat.ps.cache-misses
 1.451e+09           -86.0%  2.027e+08        perf-stat.ps.cache-references
   3577249           -98.8%      41877 ±  3%  perf-stat.ps.context-switches
 8.125e+10           +15.4%  9.375e+10        perf-stat.ps.instructions
      3291 ±  2%      -8.9%       2997 ±  2%  perf-stat.ps.minor-faults
      3291 ±  2%      -8.9%       2997 ±  2%  perf-stat.ps.page-faults
 2.456e+13           +15.5%  2.837e+13        perf-stat.total.instructions
     21.14           -19.9        1.21 ±  4%  perf-profile.calltrace.cycles-pp.recv_omni.process_requests.spawn_child.accept_connection.accept_connections
     20.32           -19.1        1.18 ±  4%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.recv_omni.process_requests.spawn_child.accept_connection
     20.29           -19.1        1.18 ±  4%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.recv_omni.process_requests.spawn_child
     19.26           -18.1        1.15 ±  4%  perf-profile.calltrace.cycles-pp.__x64_sys_recvfrom.do_syscall_64.entry_SYSCALL_64_after_hwframe.recv_omni.process_requests
     19.21           -18.1        1.14 ±  4%  perf-profile.calltrace.cycles-pp.__sys_recvfrom.__x64_sys_recvfrom.do_syscall_64.entry_SYSCALL_64_after_hwframe.recv_omni
     18.60           -17.5        1.12 ±  4%  perf-profile.calltrace.cycles-pp.sock_recvmsg.__sys_recvfrom.__x64_sys_recvfrom.do_syscall_64.entry_SYSCALL_64_after_hwframe
     18.52           -17.4        1.11 ±  4%  perf-profile.calltrace.cycles-pp.inet_recvmsg.sock_recvmsg.__sys_recvfrom.__x64_sys_recvfrom.do_syscall_64
     18.40           -17.3        1.11 ±  4%  perf-profile.calltrace.cycles-pp.udp_recvmsg.inet_recvmsg.sock_recvmsg.__sys_recvfrom.__x64_sys_recvfrom
     16.85 ± 25%     -15.6        1.21 ±  4%  perf-profile.calltrace.cycles-pp.accept_connection.accept_connections.main
     16.85 ± 25%     -15.6        1.21 ±  4%  perf-profile.calltrace.cycles-pp.accept_connections.main
     16.85 ± 25%     -15.6        1.21 ±  4%  perf-profile.calltrace.cycles-pp.process_requests.spawn_child.accept_connection.accept_connections.main
     16.85 ± 25%     -15.6        1.21 ±  4%  perf-profile.calltrace.cycles-pp.spawn_child.accept_connection.accept_connections.main
     13.66           -12.7        0.92 ±  4%  perf-profile.calltrace.cycles-pp.skb_copy_datagram_iter.udp_recvmsg.inet_recvmsg.sock_recvmsg.__sys_recvfrom
     13.64           -12.7        0.92 ±  4%  perf-profile.calltrace.cycles-pp.__skb_datagram_iter.skb_copy_datagram_iter.udp_recvmsg.inet_recvmsg.sock_recvmsg
     13.21           -12.3        0.90 ±  4%  perf-profile.calltrace.cycles-pp._copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.udp_recvmsg.inet_recvmsg
      4.29 ±100%      -4.3        0.00        perf-profile.calltrace.cycles-pp.accept_connection.accept_connections
      4.29 ±100%      -4.3        0.00        perf-profile.calltrace.cycles-pp.accept_connections
      4.29 ±100%      -4.3        0.00        perf-profile.calltrace.cycles-pp.process_requests.spawn_child.accept_connection.accept_connections
      4.29 ±100%      -4.3        0.00        perf-profile.calltrace.cycles-pp.spawn_child.accept_connection.accept_connections
      5.60            -0.8        4.80        perf-profile.calltrace.cycles-pp.udp_queue_rcv_one_skb.udp_unicast_rcv_skb.__udp4_lib_rcv.ip_protocol_deliver_rcu.ip_local_deliver_finish
      5.68            -0.7        4.94        perf-profile.calltrace.cycles-pp.udp_unicast_rcv_skb.__udp4_lib_rcv.ip_protocol_deliver_rcu.ip_local_deliver_finish.ip_local_deliver
      6.64            -0.3        6.33        perf-profile.calltrace.cycles-pp.__udp4_lib_rcv.ip_protocol_deliver_rcu.ip_local_deliver_finish.ip_local_deliver.__netif_receive_skb_one_core
      0.57            +0.1        0.67 ±  2%  perf-profile.calltrace.cycles-pp.rmqueue_pcplist.rmqueue.get_page_from_freelist.__alloc_frozen_pages_noprof.alloc_pages_mpol
      0.63            +0.2        0.78        perf-profile.calltrace.cycles-pp.rmqueue.get_page_from_freelist.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof
      0.58            +0.2        0.80        perf-profile.calltrace.cycles-pp.irqtime_account_irq.handle_softirqs.do_softirq.__local_bh_enable_ip.__dev_queue_xmit
      0.55            +0.2        0.80        perf-profile.calltrace.cycles-pp.check_heap_object.__check_object_size.ip_generic_getfrag.__ip_append_data.ip_make_skb
      0.63            +0.3        0.92        perf-profile.calltrace.cycles-pp.move_addr_to_kernel.__sys_sendto.__x64_sys_sendto.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.59 ±  3%      +0.3        0.91 ±  2%  perf-profile.calltrace.cycles-pp.ip_rcv.__netif_receive_skb_one_core.process_backlog.__napi_poll.net_rx_action
      0.59 ±  2%      +0.3        0.91        perf-profile.calltrace.cycles-pp.__udp4_lib_lookup.__udp4_lib_rcv.ip_protocol_deliver_rcu.ip_local_deliver_finish.ip_local_deliver
      8.26            +0.3        8.58        perf-profile.calltrace.cycles-pp.__netif_receive_skb_one_core.process_backlog.__napi_poll.net_rx_action.handle_softirqs
      1.13            +0.4        1.50        perf-profile.calltrace.cycles-pp.get_page_from_freelist.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.skb_page_frag_refill
      0.73            +0.4        1.11        perf-profile.calltrace.cycles-pp.__check_object_size.ip_generic_getfrag.__ip_append_data.ip_make_skb.udp_sendmsg
      1.06 ±  3%      +0.4        1.44 ±  2%  perf-profile.calltrace.cycles-pp.fib_table_lookup.ip_route_output_key_hash_rcu.ip_route_output_flow.udp_sendmsg.__sys_sendto
      0.87 ±  3%      +0.4        1.28        perf-profile.calltrace.cycles-pp.skb_defer_free_flush.net_rx_action.handle_softirqs.do_softirq.__local_bh_enable_ip
      1.39            +0.4        1.82        perf-profile.calltrace.cycles-pp.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.skb_page_frag_refill.sk_page_frag_refill
      8.81            +0.5        9.27        perf-profile.calltrace.cycles-pp.process_backlog.__napi_poll.net_rx_action.handle_softirqs.do_softirq
      8.90            +0.5        9.36        perf-profile.calltrace.cycles-pp.__napi_poll.net_rx_action.handle_softirqs.do_softirq.__local_bh_enable_ip
      1.22 ±  2%      +0.5        1.69 ±  2%  perf-profile.calltrace.cycles-pp.ip_route_output_key_hash_rcu.ip_route_output_flow.udp_sendmsg.__sys_sendto.__x64_sys_sendto
      1.52            +0.5        2.03        perf-profile.calltrace.cycles-pp.alloc_pages_mpol.alloc_pages_noprof.skb_page_frag_refill.sk_page_frag_refill.__ip_append_data
      1.16            +0.5        1.68        perf-profile.calltrace.cycles-pp.loopback_xmit.dev_hard_start_xmit.__dev_queue_xmit.ip_finish_output2.ip_output
      1.58            +0.5        2.12        perf-profile.calltrace.cycles-pp.alloc_pages_noprof.skb_page_frag_refill.sk_page_frag_refill.__ip_append_data.ip_make_skb
      0.00            +0.5        0.55        perf-profile.calltrace.cycles-pp.sched_clock_cpu.irqtime_account_irq.handle_softirqs.do_softirq.__local_bh_enable_ip
      0.00            +0.6        0.57 ±  3%  perf-profile.calltrace.cycles-pp.enqueue_to_backlog.netif_rx_internal.__netif_rx.loopback_xmit.dev_hard_start_xmit
      1.32            +0.6        1.92        perf-profile.calltrace.cycles-pp.dev_hard_start_xmit.__dev_queue_xmit.ip_finish_output2.ip_output.ip_send_skb
      0.00            +0.6        0.62        perf-profile.calltrace.cycles-pp.kmalloc_reserve.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb.__ip_append_data
      0.00            +0.6        0.64        perf-profile.calltrace.cycles-pp.__netif_receive_skb_core.__netif_receive_skb_one_core.process_backlog.__napi_poll.net_rx_action
      0.00            +0.6        0.64 ±  2%  perf-profile.calltrace.cycles-pp.netif_rx_internal.__netif_rx.loopback_xmit.dev_hard_start_xmit.__dev_queue_xmit
      0.00            +0.6        0.65        perf-profile.calltrace.cycles-pp._copy_from_user.move_addr_to_kernel.__sys_sendto.__x64_sys_sendto.do_syscall_64
      0.00            +0.7        0.65        perf-profile.calltrace.cycles-pp.validate_xmit_skb.__dev_queue_xmit.ip_finish_output2.ip_output.ip_send_skb
      0.00            +0.7        0.66        perf-profile.calltrace.cycles-pp.kmem_cache_alloc_node_noprof.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb.__ip_append_data
      1.23            +0.7        1.90        perf-profile.calltrace.cycles-pp.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb.__ip_append_data.ip_make_skb
      0.00            +0.7        0.70 ±  2%  perf-profile.calltrace.cycles-pp.__netif_rx.loopback_xmit.dev_hard_start_xmit.__dev_queue_xmit.ip_finish_output2
      1.76 ±  2%      +0.7        2.46        perf-profile.calltrace.cycles-pp.ip_route_output_flow.udp_sendmsg.__sys_sendto.__x64_sys_sendto.do_syscall_64
      0.00            +0.7        0.73        perf-profile.calltrace.cycles-pp.clear_bhb_loop.send_omni_inner.send_udp_stream.main
      1.33            +0.7        2.07        perf-profile.calltrace.cycles-pp.alloc_skb_with_frags.sock_alloc_send_pskb.__ip_append_data.ip_make_skb.udp_sendmsg
      1.82            +0.7        2.57        perf-profile.calltrace.cycles-pp.sock_alloc_send_pskb.__ip_append_data.ip_make_skb.udp_sendmsg.__sys_sendto
      0.00            +0.7        0.74        perf-profile.calltrace.cycles-pp._find_next_bit.skb_defer_free_flush.net_rx_action.handle_softirqs.do_softirq
      1.96            +0.8        2.72        perf-profile.calltrace.cycles-pp.skb_page_frag_refill.sk_page_frag_refill.__ip_append_data.ip_make_skb.udp_sendmsg
      2.02            +0.8        2.82        perf-profile.calltrace.cycles-pp.sk_page_frag_refill.__ip_append_data.ip_make_skb.udp_sendmsg.__sys_sendto
      0.72 ±  2%      +0.8        1.56        perf-profile.calltrace.cycles-pp.__free_frozen_pages.skb_release_data.sk_skb_reason_drop.udp_queue_rcv_one_skb.udp_unicast_rcv_skb
     10.10            +1.0       11.14        perf-profile.calltrace.cycles-pp.net_rx_action.handle_softirqs.do_softirq.__local_bh_enable_ip.__dev_queue_xmit
     11.06            +1.4       12.43        perf-profile.calltrace.cycles-pp.handle_softirqs.do_softirq.__local_bh_enable_ip.__dev_queue_xmit.ip_finish_output2
     11.30            +1.4       12.69        perf-profile.calltrace.cycles-pp.__local_bh_enable_ip.__dev_queue_xmit.ip_finish_output2.ip_output.ip_send_skb
     11.22            +1.4       12.62        perf-profile.calltrace.cycles-pp.do_softirq.__local_bh_enable_ip.__dev_queue_xmit.ip_finish_output2.ip_output
      1.32            +1.5        2.84        perf-profile.calltrace.cycles-pp.skb_release_data.sk_skb_reason_drop.udp_queue_rcv_one_skb.udp_unicast_rcv_skb.__udp4_lib_rcv
      1.37            +1.6        2.95        perf-profile.calltrace.cycles-pp.sk_skb_reason_drop.udp_queue_rcv_one_skb.udp_unicast_rcv_skb.__udp4_lib_rcv.ip_protocol_deliver_rcu
     13.44            +2.5       15.97        perf-profile.calltrace.cycles-pp.__dev_queue_xmit.ip_finish_output2.ip_output.ip_send_skb.udp_send_skb
     14.01            +2.8       16.77        perf-profile.calltrace.cycles-pp.ip_finish_output2.ip_output.ip_send_skb.udp_send_skb.udp_sendmsg
     14.42            +3.0       17.43        perf-profile.calltrace.cycles-pp.ip_output.ip_send_skb.udp_send_skb.udp_sendmsg.__sys_sendto
     14.84            +3.2       18.03        perf-profile.calltrace.cycles-pp.ip_send_skb.udp_send_skb.udp_sendmsg.__sys_sendto.__x64_sys_sendto
     15.30            +3.4       18.68        perf-profile.calltrace.cycles-pp.udp_send_skb.udp_sendmsg.__sys_sendto.__x64_sys_sendto.do_syscall_64
      8.49 ±  3%      +4.8       13.30        perf-profile.calltrace.cycles-pp.__ip_select_ident.__ip_make_skb.ip_make_skb.udp_sendmsg.__sys_sendto
      8.93 ±  3%      +5.0       13.92        perf-profile.calltrace.cycles-pp.__ip_make_skb.ip_make_skb.udp_sendmsg.__sys_sendto.__x64_sys_sendto
     92.28 ±  4%      +6.5       98.80        perf-profile.calltrace.cycles-pp.main
     34.49            +9.8       44.25        perf-profile.calltrace.cycles-pp._copy_from_iter.ip_generic_getfrag.__ip_append_data.ip_make_skb.udp_sendmsg
     35.44           +10.2       45.66        perf-profile.calltrace.cycles-pp.ip_generic_getfrag.__ip_append_data.ip_make_skb.udp_sendmsg.__sys_sendto
     41.30           +12.8       54.08        perf-profile.calltrace.cycles-pp.__ip_append_data.ip_make_skb.udp_sendmsg.__sys_sendto.__x64_sys_sendto
     50.63           +18.2       68.86        perf-profile.calltrace.cycles-pp.ip_make_skb.udp_sendmsg.__sys_sendto.__x64_sys_sendto.do_syscall_64
     72.90           +21.2       94.06        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.send_omni_inner.send_udp_stream.main
     73.01           +21.2       94.21        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.send_omni_inner.send_udp_stream.main
     75.40           +22.1       97.54        perf-profile.calltrace.cycles-pp.send_omni_inner.send_udp_stream.main
     75.43           +22.2       97.59        perf-profile.calltrace.cycles-pp.send_udp_stream.main
     68.95           +22.6       91.51        perf-profile.calltrace.cycles-pp.udp_sendmsg.__sys_sendto.__x64_sys_sendto.do_syscall_64.entry_SYSCALL_64_after_hwframe
     70.77           +23.0       93.80        perf-profile.calltrace.cycles-pp.__sys_sendto.__x64_sys_sendto.do_syscall_64.entry_SYSCALL_64_after_hwframe.send_omni_inner
     70.69           +23.3       93.95        perf-profile.calltrace.cycles-pp.__x64_sys_sendto.do_syscall_64.entry_SYSCALL_64_after_hwframe.send_omni_inner.send_udp_stream
     21.14           -19.9        1.24        perf-profile.children.cycles-pp.accept_connection
     21.14           -19.9        1.24        perf-profile.children.cycles-pp.accept_connections
     21.14           -19.9        1.24        perf-profile.children.cycles-pp.process_requests
     21.14           -19.9        1.24        perf-profile.children.cycles-pp.recv_omni
     21.14           -19.9        1.24        perf-profile.children.cycles-pp.spawn_child
     19.76           -18.6        1.18        perf-profile.children.cycles-pp.__x64_sys_recvfrom
     19.70           -18.5        1.18        perf-profile.children.cycles-pp.__sys_recvfrom
     19.09           -17.9        1.16        perf-profile.children.cycles-pp.sock_recvmsg
     19.01           -17.9        1.15        perf-profile.children.cycles-pp.inet_recvmsg
     18.90           -17.8        1.15        perf-profile.children.cycles-pp.udp_recvmsg
     13.67           -12.7        0.94        perf-profile.children.cycles-pp.skb_copy_datagram_iter
     13.64           -12.7        0.94        perf-profile.children.cycles-pp.__skb_datagram_iter
     13.23           -12.3        0.92        perf-profile.children.cycles-pp._copy_to_iter
      4.81            -4.7        0.15 ±  5%  perf-profile.children.cycles-pp.schedule
      4.79            -4.6        0.15 ±  4%  perf-profile.children.cycles-pp.__schedule
      4.19            -4.0        0.14 ±  4%  perf-profile.children.cycles-pp.__skb_recv_udp
      3.37            -3.3        0.10 ±  7%  perf-profile.children.cycles-pp.__skb_wait_for_more_packets
      3.44            -3.0        0.44 ±  2%  perf-profile.children.cycles-pp.__udp_enqueue_schedule_skb
      3.02            -2.9        0.10 ±  5%  perf-profile.children.cycles-pp.schedule_timeout
      2.99            -2.9        0.10 ±  4%  perf-profile.children.cycles-pp.exit_to_user_mode_loop
      2.58            -2.5        0.07 ±  5%  perf-profile.children.cycles-pp.sock_def_readable
      2.52            -2.5        0.07 ±  8%  perf-profile.children.cycles-pp.__wake_up_sync_key
      2.47            -2.4        0.07 ±  7%  perf-profile.children.cycles-pp.__wake_up_common
      2.43            -2.4        0.06 ±  7%  perf-profile.children.cycles-pp.autoremove_wake_function
      2.38 ±  2%      -2.3        0.06 ±  7%  perf-profile.children.cycles-pp.try_to_wake_up
      5.72            -0.8        4.91        perf-profile.children.cycles-pp.udp_queue_rcv_one_skb
      0.83            -0.8        0.06 ±  8%  perf-profile.children.cycles-pp.skb_attempt_defer_free
      5.78            -0.8        5.01        perf-profile.children.cycles-pp.udp_unicast_rcv_skb
      0.96            -0.7        0.29        perf-profile.children.cycles-pp.arch_exit_to_user_mode_prepare
      0.54 ± 27%      -0.5        0.07 ±  6%  perf-profile.children.cycles-pp.cmd_record
      6.76            -0.3        6.44        perf-profile.children.cycles-pp.__udp4_lib_rcv
      7.26            -0.3        6.99        perf-profile.children.cycles-pp.ip_local_deliver
      7.08            -0.3        6.81        perf-profile.children.cycles-pp.ip_protocol_deliver_rcu
      7.14            -0.2        6.90        perf-profile.children.cycles-pp.ip_local_deliver_finish
      0.44 ±  2%      -0.2        0.27        perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      0.65 ±  3%      -0.1        0.56 ±  4%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.56 ±  3%      -0.1        0.50 ±  4%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.39 ±  3%      -0.1        0.33 ±  6%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.57            -0.1        0.51        perf-profile.children.cycles-pp.fdget
      0.32 ±  3%      -0.1        0.26 ±  4%  perf-profile.children.cycles-pp.update_process_times
      0.16 ±  3%      -0.0        0.11 ±  3%  perf-profile.children.cycles-pp.inet_sendmsg
      0.36            -0.0        0.32 ±  3%  perf-profile.children.cycles-pp.skb_set_owner_w
      0.36 ±  2%      -0.0        0.32 ±  6%  perf-profile.children.cycles-pp.tick_nohz_handler
      0.07 ±  5%      -0.0        0.05        perf-profile.children.cycles-pp.security_sk_classify_flow
      0.05 ±  8%      +0.0        0.07 ±  5%  perf-profile.children.cycles-pp.import_ubuf
      0.49            +0.0        0.51        perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.05            +0.0        0.07 ±  5%  perf-profile.children.cycles-pp.is_vmalloc_addr
      0.16            +0.0        0.18 ±  2%  perf-profile.children.cycles-pp.ipv4_mtu
      0.50            +0.0        0.52        perf-profile.children.cycles-pp.__virt_addr_valid
      0.11 ±  3%      +0.0        0.14        perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.06 ±  7%      +0.0        0.09 ±  4%  perf-profile.children.cycles-pp.x64_sys_call
      0.07 ±  5%      +0.0        0.10 ±  9%  perf-profile.children.cycles-pp.__xfrm_policy_check2
      0.10 ±  3%      +0.0        0.13 ±  3%  perf-profile.children.cycles-pp.check_stack_object
      0.08 ±  6%      +0.0        0.11 ±  7%  perf-profile.children.cycles-pp.eth_type_trans
      0.18 ±  2%      +0.0        0.22        perf-profile.children.cycles-pp.entry_SYSCALL_64
      0.09 ±  5%      +0.0        0.13        perf-profile.children.cycles-pp.raw_v4_input
      0.05 ±  8%      +0.0        0.09        perf-profile.children.cycles-pp.kfree
      0.04 ± 44%      +0.0        0.08 ±  4%  perf-profile.children.cycles-pp.validate_xmit_xfrm
      0.10            +0.0        0.14 ±  2%  perf-profile.children.cycles-pp.skb_clone_tx_timestamp
      0.06            +0.0        0.10 ±  3%  perf-profile.children.cycles-pp.skb_pull_rcsum
      0.09 ±  4%      +0.0        0.13 ±  2%  perf-profile.children.cycles-pp.udp4_hwcsum
      0.06            +0.0        0.10        perf-profile.children.cycles-pp.ip_finish_output
      0.08            +0.0        0.12 ±  3%  perf-profile.children.cycles-pp.__build_skb_around
      0.05            +0.0        0.10 ±  5%  perf-profile.children.cycles-pp.neigh_hh_output
      0.12 ±  4%      +0.0        0.17 ±  2%  perf-profile.children.cycles-pp.compute_score
      0.31            +0.0        0.36 ±  2%  perf-profile.children.cycles-pp._raw_spin_lock_irq
      0.06            +0.1        0.11        perf-profile.children.cycles-pp.skb_csum_hwoffload_help
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.__mem_cgroup_uncharge
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.security_sock_rcv_skb
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.skb_put
      0.05 ±  7%      +0.1        0.10 ±  4%  perf-profile.children.cycles-pp.__usecs_to_jiffies
      0.08            +0.1        0.13 ±  2%  perf-profile.children.cycles-pp.policy_nodemask
      0.11 ±  3%      +0.1        0.16 ±  2%  perf-profile.children.cycles-pp.__zone_watermark_ok
      0.09            +0.1        0.14 ±  3%  perf-profile.children.cycles-pp.__folio_put
      0.01 ±223%      +0.1        0.06 ±  6%  perf-profile.children.cycles-pp.demo_interval_tick
      0.48            +0.1        0.54        perf-profile.children.cycles-pp.sched_clock
      0.23 ±  2%      +0.1        0.28        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.17 ±  2%      +0.1        0.22 ±  2%  perf-profile.children.cycles-pp.udp4_csum_init
      0.00            +0.1        0.06 ±  6%  perf-profile.children.cycles-pp.ktime_get_update_offsets_now
      0.17 ±  2%      +0.1        0.23 ±  2%  perf-profile.children.cycles-pp.free_frozen_page_commit
      0.54            +0.1        0.60        perf-profile.children.cycles-pp.sched_clock_cpu
      0.14 ±  3%      +0.1        0.20 ±  2%  perf-profile.children.cycles-pp.ip_send_check
      0.00            +0.1        0.06        perf-profile.children.cycles-pp.netdev_core_pick_tx
      0.08            +0.1        0.14        perf-profile.children.cycles-pp.ip_skb_dst_mtu
      0.10            +0.1        0.16 ±  2%  perf-profile.children.cycles-pp.xfrm_lookup_with_ifid
      0.00            +0.1        0.06 ±  6%  perf-profile.children.cycles-pp.inet_lookup_reuseport
      0.23 ±  3%      +0.1        0.29        perf-profile.children.cycles-pp.siphash_3u32
      0.11 ±  3%      +0.1        0.18 ±  2%  perf-profile.children.cycles-pp._find_first_bit
      0.41            +0.1        0.48        perf-profile.children.cycles-pp.native_sched_clock
      0.00            +0.1        0.07        perf-profile.children.cycles-pp.qdisc_pkt_len_init
      0.13 ±  3%      +0.1        0.20        perf-profile.children.cycles-pp.sk_filter_trim_cap
      0.07 ±  5%      +0.1        0.14 ±  3%  perf-profile.children.cycles-pp.skb_network_protocol
      0.17            +0.1        0.24 ±  2%  perf-profile.children.cycles-pp.dst_release
      0.24            +0.1        0.31        perf-profile.children.cycles-pp.sendto
      0.18            +0.1        0.26        perf-profile.children.cycles-pp.ip_setup_cork
      0.13 ±  2%      +0.1        0.20 ±  2%  perf-profile.children.cycles-pp.xfrm_lookup_route
      0.15 ±  2%      +0.1        0.23 ±  2%  perf-profile.children.cycles-pp.__rmqueue_pcplist
      0.20            +0.1        0.28        perf-profile.children.cycles-pp.ipv4_pktinfo_prepare
      0.24            +0.1        0.33        perf-profile.children.cycles-pp.__ip_local_out
      0.22 ±  2%      +0.1        0.30        perf-profile.children.cycles-pp.prep_new_page
      0.47            +0.1        0.56        perf-profile.children.cycles-pp.send_data
      0.34            +0.1        0.44 ±  2%  perf-profile.children.cycles-pp.__mkroute_output
      0.11            +0.1        0.21        perf-profile.children.cycles-pp.rcu_all_qs
      0.14 ±  2%      +0.1        0.24        perf-profile.children.cycles-pp.__ip_finish_output
      0.16 ±  3%      +0.1        0.26        perf-profile.children.cycles-pp.free_tail_page_prepare
      0.78            +0.1        0.89        perf-profile.children.cycles-pp.check_heap_object
      0.29            +0.1        0.41        perf-profile.children.cycles-pp.sock_wfree
      0.19 ±  3%      +0.1        0.30 ±  3%  perf-profile.children.cycles-pp.__get_pfnblock_flags_mask
      0.60            +0.1        0.72        perf-profile.children.cycles-pp.rmqueue_pcplist
      0.22            +0.1        0.34        perf-profile.children.cycles-pp.__cond_resched
      0.21            +0.1        0.34        perf-profile.children.cycles-pp.ip_rcv_core
      0.32 ±  4%      +0.1        0.46 ±  3%  perf-profile.children.cycles-pp.ip_rcv_finish_core
      0.66            +0.2        0.82        perf-profile.children.cycles-pp.rmqueue
      0.19            +0.2        0.35 ±  2%  perf-profile.children.cycles-pp.netif_skb_features
      0.58            +0.2        0.75        perf-profile.children.cycles-pp.clear_bhb_loop
      0.34 ±  2%      +0.2        0.52 ±  2%  perf-profile.children.cycles-pp.udp4_lib_lookup2
      0.42            +0.2        0.61 ±  2%  perf-profile.children.cycles-pp.enqueue_to_backlog
      0.47            +0.2        0.66        perf-profile.children.cycles-pp._copy_from_user
      0.45            +0.2        0.67 ±  2%  perf-profile.children.cycles-pp.netif_rx_internal
      1.15            +0.2        1.38        perf-profile.children.cycles-pp.__check_object_size
      0.62            +0.2        0.85        perf-profile.children.cycles-pp.irqtime_account_irq
      0.48            +0.2        0.72        perf-profile.children.cycles-pp.__netif_rx
      0.42            +0.2        0.66        perf-profile.children.cycles-pp.__netif_receive_skb_core
      1.21            +0.2        1.46        perf-profile.children.cycles-pp.its_return_thunk
      0.39            +0.3        0.65        perf-profile.children.cycles-pp.kmalloc_reserve
      0.66            +0.3        0.96        perf-profile.children.cycles-pp.move_addr_to_kernel
      8.39            +0.3        8.69        perf-profile.children.cycles-pp.__netif_receive_skb_one_core
      0.38            +0.3        0.69 ±  2%  perf-profile.children.cycles-pp.validate_xmit_skb
      0.62 ±  2%      +0.3        0.94        perf-profile.children.cycles-pp.ip_rcv
      0.62            +0.3        0.94        perf-profile.children.cycles-pp.__udp4_lib_lookup
      0.45            +0.3        0.79        perf-profile.children.cycles-pp._find_next_bit
      0.82            +0.4        1.21        perf-profile.children.cycles-pp.kmem_cache_alloc_node_noprof
      1.18            +0.4        1.57        perf-profile.children.cycles-pp.get_page_from_freelist
      1.08 ±  2%      +0.4        1.48 ±  2%  perf-profile.children.cycles-pp.fib_table_lookup
      1.43            +0.4        1.86        perf-profile.children.cycles-pp.__alloc_frozen_pages_noprof
      8.96            +0.4        9.39        perf-profile.children.cycles-pp.process_backlog
      0.93 ±  3%      +0.4        1.38        perf-profile.children.cycles-pp.skb_defer_free_flush
      9.02            +0.4        9.47        perf-profile.children.cycles-pp.__napi_poll
      1.25 ±  2%      +0.5        1.72        perf-profile.children.cycles-pp.ip_route_output_key_hash_rcu
      0.53 ±  2%      +0.5        1.02        perf-profile.children.cycles-pp.kmem_cache_free
      1.56            +0.5        2.08        perf-profile.children.cycles-pp.alloc_pages_mpol
      1.62            +0.5        2.16        perf-profile.children.cycles-pp.alloc_pages_noprof
      1.16            +0.6        1.71        perf-profile.children.cycles-pp.__free_frozen_pages
      1.22            +0.6        1.77        perf-profile.children.cycles-pp.loopback_xmit
      1.34            +0.6        1.96        perf-profile.children.cycles-pp.dev_hard_start_xmit
      1.27            +0.7        1.96        perf-profile.children.cycles-pp.__alloc_skb
      1.80            +0.7        2.50        perf-profile.children.cycles-pp.ip_route_output_flow
      1.36            +0.8        2.11        perf-profile.children.cycles-pp.alloc_skb_with_frags
      1.86            +0.8        2.62        perf-profile.children.cycles-pp.sock_alloc_send_pskb
      2.00            +0.8        2.77        perf-profile.children.cycles-pp.skb_page_frag_refill
      2.07            +0.8        2.88        perf-profile.children.cycles-pp.sk_page_frag_refill
      2.12            +0.8        2.94        perf-profile.children.cycles-pp.skb_release_data
     10.30            +1.0       11.33        perf-profile.children.cycles-pp.net_rx_action
     95.34            +1.0       96.38        perf-profile.children.cycles-pp.do_syscall_64
     95.69            +1.0       96.74        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     11.50            +1.3       12.84        perf-profile.children.cycles-pp.__local_bh_enable_ip
     11.26            +1.4       12.61        perf-profile.children.cycles-pp.handle_softirqs
     11.38            +1.4       12.77        perf-profile.children.cycles-pp.do_softirq
      1.40            +1.6        3.00        perf-profile.children.cycles-pp.sk_skb_reason_drop
     13.65            +2.5       16.18        perf-profile.children.cycles-pp.__dev_queue_xmit
     14.22            +2.7       16.95        perf-profile.children.cycles-pp.ip_finish_output2
     14.63            +3.0       17.63        perf-profile.children.cycles-pp.ip_output
     15.08            +3.2       18.24        perf-profile.children.cycles-pp.ip_send_skb
     15.53            +3.4       18.89        perf-profile.children.cycles-pp.udp_send_skb
      8.61 ±  3%      +4.9       13.46        perf-profile.children.cycles-pp.__ip_select_ident
      9.07 ±  2%      +5.0       14.12        perf-profile.children.cycles-pp.__ip_make_skb
     92.36 ±  4%      +6.5       98.88        perf-profile.children.cycles-pp.main
     34.80            +9.8       44.58        perf-profile.children.cycles-pp._copy_from_iter
     35.72           +10.3       46.00        perf-profile.children.cycles-pp.ip_generic_getfrag
     41.62           +12.9       54.48        perf-profile.children.cycles-pp.__ip_append_data
     50.99           +18.1       69.06        perf-profile.children.cycles-pp.ip_make_skb
     76.42           +22.1       98.52        perf-profile.children.cycles-pp.send_omni_inner
     76.11           +22.3       98.44        perf-profile.children.cycles-pp.send_udp_stream
     69.09           +22.5       91.60        perf-profile.children.cycles-pp.udp_sendmsg
     70.81           +23.0       93.86        perf-profile.children.cycles-pp.__sys_sendto
     71.03           +23.1       94.11        perf-profile.children.cycles-pp.__x64_sys_sendto
     13.16           -12.2        0.92        perf-profile.self.cycles-pp._copy_to_iter
      0.53 ±  2%      -0.2        0.34 ±  2%  perf-profile.self.cycles-pp.__udp_enqueue_schedule_skb
      0.42 ±  2%      -0.2        0.26        perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.56            -0.1        0.50        perf-profile.self.cycles-pp.fdget
      0.35            -0.0        0.31 ±  3%  perf-profile.self.cycles-pp.skb_set_owner_w
      0.28            -0.0        0.24        perf-profile.self.cycles-pp.arch_exit_to_user_mode_prepare
      0.11            -0.0        0.07        perf-profile.self.cycles-pp.__local_bh_enable_ip
      0.11            -0.0        0.07        perf-profile.self.cycles-pp.inet_sendmsg
      0.48            -0.0        0.45        perf-profile.self.cycles-pp._raw_spin_trylock
      0.10            -0.0        0.08        perf-profile.self.cycles-pp.ip_local_deliver
      0.05            +0.0        0.07 ±  7%  perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.07 ±  5%      +0.0        0.09 ±  5%  perf-profile.self.cycles-pp.ip_local_deliver_finish
      0.06            +0.0        0.08 ±  4%  perf-profile.self.cycles-pp.alloc_pages_noprof
      0.15            +0.0        0.17 ±  2%  perf-profile.self.cycles-pp.ipv4_mtu
      0.11 ±  3%      +0.0        0.13 ±  2%  perf-profile.self.cycles-pp.__ip_local_out
      0.08            +0.0        0.10 ±  4%  perf-profile.self.cycles-pp.__cond_resched
      0.08            +0.0        0.11 ±  4%  perf-profile.self.cycles-pp.check_stack_object
      0.08 ±  4%      +0.0        0.11        perf-profile.self.cycles-pp.skb_clone_tx_timestamp
      0.05            +0.0        0.08        perf-profile.self.cycles-pp.ip_finish_output
      0.05            +0.0        0.08        perf-profile.self.cycles-pp.policy_nodemask
      0.05            +0.0        0.08        perf-profile.self.cycles-pp.x64_sys_call
      0.06 ±  7%      +0.0        0.09 ± 10%  perf-profile.self.cycles-pp.__xfrm_policy_check2
      0.08            +0.0        0.11        perf-profile.self.cycles-pp.udp4_hwcsum
      0.24            +0.0        0.27 ±  2%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.05            +0.0        0.08 ±  4%  perf-profile.self.cycles-pp.__folio_put
      0.07 ±  5%      +0.0        0.10 ±  8%  perf-profile.self.cycles-pp.eth_type_trans
      0.09 ±  5%      +0.0        0.12        perf-profile.self.cycles-pp.raw_v4_input
      0.12 ±  3%      +0.0        0.16 ±  3%  perf-profile.self.cycles-pp.do_softirq
      0.18 ±  2%      +0.0        0.22        perf-profile.self.cycles-pp.entry_SYSCALL_64
      0.20 ±  3%      +0.0        0.24        perf-profile.self.cycles-pp.__x64_sys_sendto
      0.05            +0.0        0.09 ±  5%  perf-profile.self.cycles-pp.neigh_hh_output
      0.06            +0.0        0.10 ±  4%  perf-profile.self.cycles-pp.ipv4_pktinfo_prepare
      0.05            +0.0        0.09 ±  4%  perf-profile.self.cycles-pp.skb_pull_rcsum
      0.30            +0.0        0.34 ±  2%  perf-profile.self.cycles-pp._raw_spin_lock_irq
      0.06            +0.0        0.10 ±  3%  perf-profile.self.cycles-pp.sk_page_frag_refill
      0.06 ±  6%      +0.0        0.10 ±  3%  perf-profile.self.cycles-pp.alloc_pages_mpol
      0.07 ±  5%      +0.0        0.11 ±  3%  perf-profile.self.cycles-pp.__build_skb_around
      0.12            +0.0        0.16 ±  2%  perf-profile.self.cycles-pp.compute_score
      0.14 ±  2%      +0.0        0.18 ±  2%  perf-profile.self.cycles-pp.sock_alloc_send_pskb
      0.06 ±  8%      +0.0        0.10 ±  3%  perf-profile.self.cycles-pp.__ip_finish_output
      0.06 ±  9%      +0.0        0.10 ±  4%  perf-profile.self.cycles-pp.skb_csum_hwoffload_help
      0.09 ±  5%      +0.0        0.13        perf-profile.self.cycles-pp._find_first_bit
      0.10 ±  3%      +0.0        0.14 ±  3%  perf-profile.self.cycles-pp.__zone_watermark_ok
      0.16 ±  3%      +0.0        0.21 ±  3%  perf-profile.self.cycles-pp.udp4_csum_init
      0.05            +0.0        0.10 ±  4%  perf-profile.self.cycles-pp.__usecs_to_jiffies
      0.10 ±  5%      +0.0        0.14 ±  3%  perf-profile.self.cycles-pp.ip_setup_cork
      0.07            +0.0        0.12 ±  3%  perf-profile.self.cycles-pp.rmqueue
      0.08 ±  4%      +0.0        0.13        perf-profile.self.cycles-pp.ip_rcv
      0.10 ±  4%      +0.0        0.15 ±  5%  perf-profile.self.cycles-pp.sk_filter_trim_cap
      0.06            +0.1        0.11        perf-profile.self.cycles-pp.kmalloc_reserve
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.is_vmalloc_addr
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.netdev_core_pick_tx
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.netif_rx_internal
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.udp_unicast_rcv_skb
      0.24            +0.1        0.29 ±  2%  perf-profile.self.cycles-pp.__alloc_frozen_pages_noprof
      0.00            +0.1        0.05 ±  7%  perf-profile.self.cycles-pp.demo_interval_tick
      0.00            +0.1        0.05 ±  7%  perf-profile.self.cycles-pp.inet_lookup_reuseport
      0.22 ±  2%      +0.1        0.28        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.02 ±141%      +0.1        0.07 ±  5%  perf-profile.self.cycles-pp.kfree
      0.00            +0.1        0.06 ±  8%  perf-profile.self.cycles-pp.ktime_get_update_offsets_now
      0.13 ±  3%      +0.1        0.18 ±  2%  perf-profile.self.cycles-pp.ip_send_check
      0.10 ±  3%      +0.1        0.16 ±  3%  perf-profile.self.cycles-pp.xfrm_lookup_with_ifid
      0.00            +0.1        0.06 ±  6%  perf-profile.self.cycles-pp.sk_skb_reason_drop
      0.40            +0.1        0.46        perf-profile.self.cycles-pp.send_data
      0.22 ±  4%      +0.1        0.28        perf-profile.self.cycles-pp.siphash_3u32
      0.13 ±  2%      +0.1        0.19 ±  3%  perf-profile.self.cycles-pp.dev_hard_start_xmit
      0.15            +0.1        0.21        perf-profile.self.cycles-pp.dst_release
      0.16            +0.1        0.22        perf-profile.self.cycles-pp.free_frozen_page_commit
      0.07            +0.1        0.13        perf-profile.self.cycles-pp.ip_skb_dst_mtu
      0.40            +0.1        0.46        perf-profile.self.cycles-pp.native_sched_clock
      0.44            +0.1        0.50        perf-profile.self.cycles-pp.do_syscall_64
      0.19 ±  2%      +0.1        0.26 ±  2%  perf-profile.self.cycles-pp.irqtime_account_irq
      0.00            +0.1        0.06 ±  6%  perf-profile.self.cycles-pp.qdisc_pkt_len_init
      0.06 ±  6%      +0.1        0.12 ±  3%  perf-profile.self.cycles-pp.skb_network_protocol
      0.08            +0.1        0.14 ±  3%  perf-profile.self.cycles-pp.alloc_skb_with_frags
      0.10 ±  3%      +0.1        0.16 ±  3%  perf-profile.self.cycles-pp.move_addr_to_kernel
      0.22 ±  2%      +0.1        0.28 ±  2%  perf-profile.self.cycles-pp.sendto
      0.22 ±  2%      +0.1        0.28        perf-profile.self.cycles-pp.check_heap_object
      0.11 ±  3%      +0.1        0.18 ±  2%  perf-profile.self.cycles-pp.rmqueue_pcplist
      0.00            +0.1        0.07        perf-profile.self.cycles-pp.validate_xmit_xfrm
      0.21            +0.1        0.28        perf-profile.self.cycles-pp.__udp4_lib_rcv
      0.14 ±  2%      +0.1        0.22 ±  3%  perf-profile.self.cycles-pp.__rmqueue_pcplist
      0.16 ±  2%      +0.1        0.24        perf-profile.self.cycles-pp.ip_route_output_key_hash_rcu
      0.20 ±  2%      +0.1        0.28        perf-profile.self.cycles-pp.prep_new_page
      0.19            +0.1        0.27        perf-profile.self.cycles-pp.ip_send_skb
      0.11 ±  4%      +0.1        0.20 ±  2%  perf-profile.self.cycles-pp.free_tail_page_prepare
      0.14            +0.1        0.22        perf-profile.self.cycles-pp.ip_generic_getfrag
      0.30            +0.1        0.38 ±  3%  perf-profile.self.cycles-pp.__mkroute_output
      0.26 ±  2%      +0.1        0.34 ±  2%  perf-profile.self.cycles-pp.__check_object_size
      0.26            +0.1        0.34        perf-profile.self.cycles-pp.process_backlog
      0.13 ±  3%      +0.1        0.21 ±  2%  perf-profile.self.cycles-pp.ip_make_skb
      0.21 ±  2%      +0.1        0.30        perf-profile.self.cycles-pp.get_page_from_freelist
      0.10            +0.1        0.19 ±  2%  perf-profile.self.cycles-pp.rcu_all_qs
      0.32 ±  2%      +0.1        0.42        perf-profile.self.cycles-pp.handle_softirqs
      0.11 ±  4%      +0.1        0.21 ±  3%  perf-profile.self.cycles-pp.netif_skb_features
      0.19 ±  2%      +0.1        0.29        perf-profile.self.cycles-pp.udp_queue_rcv_one_skb
      0.18 ±  3%      +0.1        0.28 ±  4%  perf-profile.self.cycles-pp.udp4_lib_lookup2
      0.13            +0.1        0.23 ±  3%  perf-profile.self.cycles-pp.validate_xmit_skb
      0.17 ±  2%      +0.1        0.27 ±  5%  perf-profile.self.cycles-pp.enqueue_to_backlog
      0.28            +0.1        0.39        perf-profile.self.cycles-pp.sock_wfree
      0.65            +0.1        0.77        perf-profile.self.cycles-pp.its_return_thunk
      0.31            +0.1        0.42        perf-profile.self.cycles-pp.net_rx_action
      0.18 ±  3%      +0.1        0.30 ±  3%  perf-profile.self.cycles-pp.__get_pfnblock_flags_mask
      0.21 ±  2%      +0.1        0.33        perf-profile.self.cycles-pp.ip_route_output_flow
      0.22            +0.1        0.35        perf-profile.self.cycles-pp.ip_output
      0.20            +0.1        0.33        perf-profile.self.cycles-pp.ip_rcv_core
      0.32 ±  4%      +0.1        0.45 ±  3%  perf-profile.self.cycles-pp.ip_rcv_finish_core
      0.29            +0.1        0.43        perf-profile.self.cycles-pp.skb_defer_free_flush
      0.32            +0.1        0.46        perf-profile.self.cycles-pp.__ip_make_skb
      0.29            +0.1        0.43 ±  2%  perf-profile.self.cycles-pp.loopback_xmit
      0.37            +0.2        0.52        perf-profile.self.cycles-pp.udp_send_skb
      0.34            +0.2        0.49        perf-profile.self.cycles-pp.__dev_queue_xmit
      0.26            +0.2        0.42        perf-profile.self.cycles-pp.__udp4_lib_lookup
      0.50            +0.2        0.66 ±  2%  perf-profile.self.cycles-pp.ip_finish_output2
      0.59            +0.2        0.76        perf-profile.self.cycles-pp.send_omni_inner
      0.57            +0.2        0.74        perf-profile.self.cycles-pp.clear_bhb_loop
      0.42            +0.2        0.60        perf-profile.self.cycles-pp.__sys_sendto
      0.46            +0.2        0.65        perf-profile.self.cycles-pp._copy_from_user
      0.30            +0.2        0.50        perf-profile.self.cycles-pp.__alloc_skb
      0.38            +0.2        0.60        perf-profile.self.cycles-pp.skb_page_frag_refill
      0.42            +0.2        0.65        perf-profile.self.cycles-pp.__netif_receive_skb_core
      0.60            +0.3        0.86        perf-profile.self.cycles-pp.kmem_cache_alloc_node_noprof
      0.53            +0.3        0.82        perf-profile.self.cycles-pp.__free_frozen_pages
      0.43            +0.3        0.75        perf-profile.self.cycles-pp._find_next_bit
      0.57            +0.3        0.91        perf-profile.self.cycles-pp.udp_sendmsg
      0.83 ±  2%      +0.4        1.19 ±  2%  perf-profile.self.cycles-pp.fib_table_lookup
      0.50 ±  2%      +0.5        0.96        perf-profile.self.cycles-pp.kmem_cache_free
      1.93            +1.0        2.92        perf-profile.self.cycles-pp.__ip_append_data
      8.32 ±  3%      +4.8       13.10 ±  2%  perf-profile.self.cycles-pp.__ip_select_ident
     34.57            +9.7       44.31        perf-profile.self.cycles-pp._copy_from_iter



***************************************************************************************************
lkp-csl-2sp7: 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz (Cascade Lake) with 512G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/option_a/rootfs/tbox_group/test/testcase:
  gcc-14/performance/x86_64-rhel-9.4/1:100/debian-12-x86_64-phoronix/lkp-csl-2sp7/memcached-1.2.0/pts

commit: 
  aceccac58a ("sched/fair: Enable scheduler feature NEXT_BUDDY")
  e837456fdc ("sched/fair: Reimplement NEXT_BUDDY to align with EEVDF goals")

aceccac58ad76305 e837456fdca81899a3c8e47b3fd 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    122.94 ±103%   +1692.0%       2202 ±159%  sched_debug.cfs_rq:/system.slice/containerd.service.se->vruntime.stddev
   1359837 ±  2%     -73.3%     363361 ±  3%  vmstat.system.cs
     21.27            +2.4       23.69        mpstat.cpu.all.soft%
     11.15            -2.1        9.06 ±  3%  mpstat.cpu.all.usr%
   2339124 ± 11%     -50.0%    1169318 ±  7%  numa-numastat.node1.local_node
   2362680 ± 11%     -48.0%    1229534 ±  4%  numa-numastat.node1.numa_hit
   2969191           +50.3%    4462160 ±  4%  pts.memcached.1:100.ops_sec
     95335 ±  7%     -46.8%      50697 ±  6%  pts.time.involuntary_context_switches
      1881           -32.5%       1270 ±  2%  pts.time.percent_of_cpu_this_job_got
      1082           -34.5%     708.80 ±  2%  pts.time.system_time
    557.55           -29.2%     394.90 ±  3%  pts.time.user_time
  60998396 ±  2%     -73.5%   16144192 ±  3%  pts.time.voluntary_context_switches
   7461123 ±  5%     -43.2%    4239875 ± 20%  numa-meminfo.node1.Active
   6055259 ±  8%     -52.7%    2866851 ± 18%  numa-meminfo.node1.Active(anon)
   6974235 ±  8%     -44.4%    3879618 ± 23%  numa-meminfo.node1.FilePages
   1305115 ± 15%     -56.2%     571915 ± 43%  numa-meminfo.node1.Mapped
   8691911 ±  5%     -38.1%    5382980 ± 19%  numa-meminfo.node1.MemUsed
      9602 ± 16%     -26.7%       7038 ± 25%  numa-meminfo.node1.PageTables
   5540188 ±  7%     -55.3%    2476071 ± 15%  numa-meminfo.node1.Shmem
   1510439 ±  8%     -52.5%     717358 ± 18%  numa-vmstat.node1.nr_active_anon
   1740136 ±  8%     -44.2%     970699 ± 23%  numa-vmstat.node1.nr_file_pages
    324315 ± 15%     -56.6%     140892 ± 44%  numa-vmstat.node1.nr_mapped
      2396 ± 15%     -26.7%       1756 ± 24%  numa-vmstat.node1.nr_page_table_pages
   1381672 ±  7%     -55.1%     619800 ± 15%  numa-vmstat.node1.nr_shmem
   1510438 ±  8%     -52.5%     717357 ± 18%  numa-vmstat.node1.nr_zone_active_anon
   2361963 ± 11%     -47.9%    1230040 ±  4%  numa-vmstat.node1.numa_hit
   2338408 ± 11%     -50.0%    1169823 ±  7%  numa-vmstat.node1.numa_local
   9365462 ±  7%     -30.8%    6481236        meminfo.Active
   7076850 ±  9%     -40.8%    4192245 ±  2%  meminfo.Active(anon)
   8487136 ±  8%     -33.4%    5650662        meminfo.Cached
   9672035 ±  7%     -30.5%    6722693        meminfo.Committed_AS
  13973162 ± 13%     +46.2%   20432554 ± 15%  meminfo.DirectMap2M
   1370297 ± 12%     -50.7%     676124 ± 37%  meminfo.Mapped
  14807589 ±  4%     -20.3%   11794381        meminfo.Memused
     15786 ±  2%     -11.6%      13953 ±  4%  meminfo.PageTables
   6142767 ± 11%     -46.2%    3305998 ±  2%  meminfo.Shmem
  14900395 ±  4%     -19.4%   12005235        meminfo.max_used_kB
      9.61 ±119%      -7.0        2.62 ±141%  perf-profile.calltrace.cycles-pp.setlocale
      5.73 ± 98%      -5.7        0.00        perf-profile.calltrace.cycles-pp.__mmap.setlocale
      5.34 ±115%      -5.3        0.00        perf-profile.calltrace.cycles-pp.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
      4.50 ±100%      -3.6        0.93 ±223%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
      5.00 ±120%      -1.7        3.28 ±146%  perf-profile.calltrace.cycles-pp.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe.__open64_nocancel
      9.61 ±119%      -7.0        2.62 ±141%  perf-profile.children.cycles-pp.setlocale
      5.73 ± 98%      -5.7        0.00        perf-profile.children.cycles-pp.__mmap
      5.34 ±115%      -5.3        0.00        perf-profile.children.cycles-pp.ksys_mmap_pgoff
      4.50 ±100%      -3.6        0.93 ±223%  perf-profile.children.cycles-pp.exit_to_user_mode_loop
      5.34 ±115%      -3.4        1.95 ±146%  perf-profile.children.cycles-pp.do_mmap
      5.34 ±115%      -3.4        1.95 ±146%  perf-profile.children.cycles-pp.vm_mmap_pgoff
      4.34 ± 75%      -2.9        1.42 ±141%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      5.00 ±120%      -1.7        3.28 ±146%  perf-profile.children.cycles-pp.__open64_nocancel
   1766718 ±  9%     -40.8%    1046113 ±  2%  proc-vmstat.nr_active_anon
    234652            -5.0%     222873 ±  2%  proc-vmstat.nr_anon_pages
   2120097 ±  8%     -33.4%    1411327        proc-vmstat.nr_file_pages
    340996 ± 13%     -50.1%     170220 ± 36%  proc-vmstat.nr_mapped
      3960 ±  2%     -11.4%       3508 ±  4%  proc-vmstat.nr_page_table_pages
   1533041 ± 11%     -46.2%     824233 ±  3%  proc-vmstat.nr_shmem
     25198            -6.0%      23695        proc-vmstat.nr_slab_reclaimable
   1766718 ±  9%     -40.8%    1046113 ±  2%  proc-vmstat.nr_zone_active_anon
   2861460 ±  9%     -40.4%    1704574        proc-vmstat.numa_hit
   2762172 ±  9%     -41.9%    1606011 ±  2%  proc-vmstat.numa_local
      6226 ± 66%    +137.2%      14768 ± 60%  proc-vmstat.numa_pages_migrated
   2949856 ±  9%     -39.3%    1790434        proc-vmstat.pgalloc_normal
    619350           +20.1%     743861 ±  7%  proc-vmstat.pgfree
      6226 ± 66%    +137.2%      14768 ± 60%  proc-vmstat.pgmigrate_success
      1.43 ±  5%     -20.0%       1.14 ± 10%  perf-stat.i.MPKI
      2.67            -0.1        2.57        perf-stat.i.branch-miss-rate%
 1.957e+08           -11.5%  1.731e+08 ±  4%  perf-stat.i.branch-misses
  1.08e+08 ±  4%     -23.6%   82490800 ± 13%  perf-stat.i.cache-misses
  3.51e+08 ±  2%     -22.7%  2.714e+08 ± 10%  perf-stat.i.cache-references
   1414873 ±  2%     -73.2%     379244 ±  3%  perf-stat.i.context-switches
 1.839e+11            +1.7%   1.87e+11        perf-stat.i.cpu-cycles
      1664 ±  3%     +24.2%       2067 ±  9%  perf-stat.i.cycles-between-cache-misses
      0.09 ±  9%      -0.0        0.07 ± 14%  perf-stat.i.dTLB-load-miss-rate%
  14978264 ±  7%     -23.4%   11469106 ± 18%  perf-stat.i.dTLB-load-misses
     32.66 ±  5%     +11.5       44.19 ±  3%  perf-stat.i.iTLB-load-miss-rate%
 1.801e+08 ±  2%     -47.5%   94572414 ±  5%  perf-stat.i.iTLB-loads
      1.92            +1.7%       1.95        perf-stat.i.metric.GHz
    471.74 ±  6%     -17.0%     391.46 ±  6%  perf-stat.i.metric.K/sec
     73.89            +6.4       80.28 ±  2%  perf-stat.i.node-load-miss-rate%
  17666322 ±  3%     -17.2%   14635326 ±  3%  perf-stat.i.node-load-misses
   4565905 ±  6%     -57.6%    1936318 ± 33%  perf-stat.i.node-loads
   8406475 ±  2%     -19.3%    6786845 ±  4%  perf-stat.i.node-store-misses
    427338 ±  7%     -19.1%     345530 ±  8%  perf-stat.i.node-stores
      1.38            -0.1        1.25        perf-stat.overall.branch-miss-rate%
      1705 ±  4%     +35.1%       2304 ± 12%  perf-stat.overall.cycles-between-cache-misses
      0.08 ±  6%      -0.0        0.06 ± 17%  perf-stat.overall.dTLB-load-miss-rate%
     32.31 ±  2%     +14.0       46.31 ±  3%  perf-stat.overall.iTLB-load-miss-rate%
    777.78            +5.8%     822.85        perf-stat.overall.instructions-per-iTLB-miss
     79.47            +9.0       88.44 ±  3%  perf-stat.overall.node-load-miss-rate%
 1.937e+08           -11.6%  1.712e+08 ±  4%  perf-stat.ps.branch-misses
 1.071e+08 ±  4%     -23.7%   81653244 ± 13%  perf-stat.ps.cache-misses
  3.48e+08 ±  2%     -22.8%  2.686e+08 ± 10%  perf-stat.ps.cache-references
   1403207 ±  2%     -73.2%     375398 ±  3%  perf-stat.ps.context-switches
 1.823e+11            +1.5%  1.851e+11        perf-stat.ps.cpu-cycles
  14850142 ±  7%     -23.6%   11352008 ± 18%  perf-stat.ps.dTLB-load-misses
 1.786e+08 ±  2%     -47.6%   93617316 ±  5%  perf-stat.ps.iTLB-loads
  17518527 ±  3%     -17.3%   14487934 ±  3%  perf-stat.ps.node-load-misses
   4526358 ±  6%     -57.7%    1916392 ± 33%  perf-stat.ps.node-loads
   8337028 ±  2%     -19.4%    6719158 ±  4%  perf-stat.ps.node-store-misses
    424368 ±  7%     -19.1%     343354 ±  8%  perf-stat.ps.node-stores
      0.07 ± 45%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.__wait_for_common.wait_for_completion_state.kernel_clone.__x64_sys_vfork
      0.02 ± 22%   +2025.0%       0.40 ±140%  perf-sched.sch_delay.avg.ms.__cond_resched.lock_sock_nested.tcp_sendmsg.sock_write_iter.do_iter_readv_writev
      0.03 ± 46%    +354.0%       0.14 ± 91%  perf-sched.sch_delay.avg.ms.__cond_resched.mutex_lock.ep_send_events.ep_poll.do_epoll_wait
      0.34 ± 23%    +117.2%       0.73 ± 11%  perf-sched.sch_delay.avg.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      3.92 ±112%     -99.6%       0.01 ± 31%  perf-sched.sch_delay.avg.ms.anon_pipe_read.fifo_pipe_read.vfs_read.ksys_read
      6.16 ± 70%     -56.0%       2.71 ±138%  perf-sched.sch_delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
      0.15 ± 23%     -74.2%       0.04 ± 82%  perf-sched.sch_delay.avg.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00 ± 76%   +5728.6%       0.07 ± 26%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.31 ± 79%     -82.2%       0.06 ± 65%  perf-sched.sch_delay.avg.ms.futex_do_wait.__futex_wait.futex_wait.do_futex
      0.01 ± 21%    +905.7%       0.15 ± 39%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
      0.01 ± 30%    +543.4%       0.08 ± 43%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
      0.03 ± 22%    +410.8%       0.14 ±  5%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.11 ±104%     -84.1%       0.02 ± 15%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.do_epoll_pwait.part
      0.25 ± 47%     -73.4%       0.07 ± 86%  perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      1.02 ±187%     -98.4%       0.02 ±  4%  perf-sched.sch_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     12.43 ± 60%     -87.2%       1.60 ±219%  perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.17 ± 11%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.__wait_for_common.wait_for_completion_state.kernel_clone.__x64_sys_vfork
      0.87 ± 59%   +4234.6%      37.88 ±126%  perf-sched.sch_delay.max.ms.__cond_resched.lock_sock_nested.tcp_sendmsg.____sys_sendmsg.___sys_sendmsg
      0.11 ± 31%  +11880.7%      13.26 ±159%  perf-sched.sch_delay.max.ms.__cond_resched.lock_sock_nested.tcp_sendmsg.sock_write_iter.do_iter_readv_writev
      1429 ±101%     -99.9%       1.89 ± 73%  perf-sched.sch_delay.max.ms.anon_pipe_read.fifo_pipe_read.vfs_read.ksys_read
      2.79 ± 37%     -61.5%       1.07 ± 90%  perf-sched.sch_delay.max.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
    298.08 ± 45%     -65.0%     104.33 ± 84%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.08 ±136%   +1974.8%       1.74 ±150%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown].[unknown]
    110.07 ± 50%     -72.6%      30.13 ±147%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      0.08 ±140%   +3210.6%       2.65 ± 50%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
      0.11 ± 51%   +1155.8%       1.34 ± 81%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
      1212 ±111%     -86.3%     166.01 ± 60%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
    101.63 ±104%     -99.2%       0.79 ±182%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.do_epoll_pwait.part
    167.67 ±163%    -100.0%       0.06 ± 40%  perf-sched.sch_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      1226 ± 82%     -91.9%      99.02 ±215%  perf-sched.sch_delay.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.02 ± 26%    +774.2%       0.14 ±  5%  perf-sched.total_sch_delay.average.ms
      0.23 ± 17%    +311.5%       0.95 ±  6%  perf-sched.total_wait_and_delay.average.ms
   9519968 ± 14%     -74.7%    2405801 ±  5%  perf-sched.total_wait_and_delay.count.ms
      0.21 ± 16%    +277.0%       0.81 ±  6%  perf-sched.total_wait_time.average.ms
      2.39 ±180%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.__lock_sock_fast.tcp_ioctl.sk_ioctl.sock_ioctl
      9.10 ±  8%     -21.0%       7.19 ± 11%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      2.02 ± 76%    +152.4%       5.09 ± 23%  perf-sched.wait_and_delay.avg.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      3.03 ±104%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.kmem_cache_alloc_node_noprof.__alloc_skb.tcp_stream_alloc_skb.tcp_sendmsg_locked
      2.80 ± 87%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.lock_sock_nested.tcp_sendmsg.____sys_sendmsg.___sys_sendmsg
    109.17 ± 61%     -69.4%      33.46 ± 21%  perf-sched.wait_and_delay.avg.ms.anon_pipe_read.fifo_pipe_read.vfs_read.ksys_read
      0.05 ± 17%    +674.3%       0.42 ± 15%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      8.74 ± 32%     -65.1%       3.05 ± 12%  perf-sched.wait_and_delay.avg.ms.futex_do_wait.__futex_wait.futex_wait.do_futex
      1.48 ± 74%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
      0.09 ± 19%    +312.2%       0.35 ±  5%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
     17.65 ± 76%     -91.3%       1.54 ±  6%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
     73.71 ± 17%    +390.1%     361.27 ±  9%  perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     46.33 ± 17%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.__lock_sock_fast.tcp_ioctl.sk_ioctl.sock_ioctl
     10.83 ± 23%    +263.1%      39.33 ± 41%  perf-sched.wait_and_delay.count.__cond_resched.__wait_for_common.stop_two_cpus.migrate_swap.task_numa_migrate
      0.50 ±152%   +1100.0%       6.00 ± 68%  perf-sched.wait_and_delay.count.__cond_resched.kfree_rcu_monitor.process_one_work.worker_thread.kthread
    188.17 ± 16%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.kmem_cache_alloc_node_noprof.__alloc_skb.tcp_stream_alloc_skb.tcp_sendmsg_locked
     85.33 ± 18%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.lock_sock_nested.tcp_sendmsg.____sys_sendmsg.___sys_sendmsg
     45.67 ± 15%     -72.6%      12.50 ±141%  perf-sched.wait_and_delay.count.__cond_resched.lock_sock_nested.tcp_sendmsg.sock_write_iter.do_iter_readv_writev
    509.33 ± 36%    +153.2%       1289 ± 18%  perf-sched.wait_and_delay.count.anon_pipe_read.fifo_pipe_read.vfs_read.ksys_read
    328.17 ± 25%     -67.8%     105.83 ±141%  perf-sched.wait_and_delay.count.do_nanosleep.hrtimer_nanosleep.__x64_sys_nanosleep.do_syscall_64
   4693523 ± 14%     -99.2%      37691 ± 12%  perf-sched.wait_and_delay.count.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      1235 ± 22%    +227.3%       4043 ± 18%  perf-sched.wait_and_delay.count.futex_do_wait.__futex_wait.futex_wait.do_futex
    785.17 ± 17%    -100.0%       0.00        perf-sched.wait_and_delay.count.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
   4800389 ± 14%     -51.2%    2344892 ±  5%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
     18.33 ± 13%     +46.4%      26.83 ± 35%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_poll
     12736 ± 13%     -81.9%       2311 ±  5%  perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     78.29 ±198%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.__lock_sock_fast.tcp_ioctl.sk_ioctl.sock_ioctl
    245.42 ±150%    +664.9%       1877 ± 68%  perf-sched.wait_and_delay.max.ms.__cond_resched.kfree_rcu_monitor.process_one_work.worker_thread.kthread
    174.25 ±114%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.kmem_cache_alloc_node_noprof.__alloc_skb.tcp_stream_alloc_skb.tcp_sendmsg_locked
    117.08 ±104%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.lock_sock_nested.tcp_sendmsg.____sys_sendmsg.___sys_sendmsg
    162.16 ± 90%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
      2168 ± 31%     -53.6%       1007        perf-sched.wait_and_delay.max.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_poll
      1175 ± 31%     -49.9%     588.84 ± 31%  perf-sched.wait_and_delay.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      9.10 ±  8%     -21.0%       7.19 ± 11%  perf-sched.wait_time.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
     34.26 ±217%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__wait_for_common.wait_for_completion_state.kernel_clone.__x64_sys_vfork
      2.02 ± 76%    +152.4%       5.09 ± 23%  perf-sched.wait_time.avg.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      2.39 ±105%     -88.5%       0.28 ± 28%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_node_noprof.__alloc_skb.tcp_stream_alloc_skb.tcp_sendmsg_locked
      2.76 ± 89%     -89.0%       0.30 ± 53%  perf-sched.wait_time.avg.ms.__cond_resched.lock_sock_nested.tcp_sendmsg.____sys_sendmsg.___sys_sendmsg
    105.25 ± 64%     -68.2%      33.44 ± 21%  perf-sched.wait_time.avg.ms.anon_pipe_read.fifo_pipe_read.vfs_read.ksys_read
      0.05 ± 16%    +563.8%       0.35 ± 14%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      8.43 ± 30%     -64.5%       2.99 ± 13%  perf-sched.wait_time.avg.ms.futex_do_wait.__futex_wait.futex_wait.do_futex
      1.26 ± 73%     -75.0%       0.32 ± 22%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
      0.06 ± 17%    +264.2%       0.21 ±  5%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
     17.40 ± 77%     -91.5%       1.48 ±  8%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
     73.53 ± 17%    +390.9%     360.95 ±  9%  perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.53 ± 87%     -83.0%       0.09 ±150%  perf-sched.wait_time.avg.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
     55.29 ±188%     -94.6%       2.98 ± 75%  perf-sched.wait_time.max.ms.__cond_resched.__lock_sock_fast.tcp_ioctl.sk_ioctl.sock_ioctl
    169.44 ±219%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__wait_for_common.wait_for_completion_state.kernel_clone.__x64_sys_vfork
    245.25 ±150%    +665.4%       1877 ± 68%  perf-sched.wait_time.max.ms.__cond_resched.kfree_rcu_monitor.process_one_work.worker_thread.kthread
      1175 ± 31%     -49.9%     588.83 ± 31%  perf-sched.wait_time.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork



***************************************************************************************************
lkp-icl-2sp8: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory
=========================================================================================
compiler/cpufreq_governor/disk/fs/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/1HDD/xfs/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-icl-2sp8/flock/stress-ng/60s

commit: 
  aceccac58a ("sched/fair: Enable scheduler feature NEXT_BUDDY")
  e837456fdc ("sched/fair: Reimplement NEXT_BUDDY to align with EEVDF goals")

aceccac58ad76305 e837456fdca81899a3c8e47b3fd 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    500210 ±  3%     +12.9%     564792 ±  6%  numa-numastat.node1.numa_hit
     43.74            -2.2       41.53        turbostat.C1%
      5051 ±  5%     -11.2%       4486 ±  5%  uptime.idle
     44.96            -4.7%      42.85        iostat.cpu.idle
     51.38            +4.1%      53.50        iostat.cpu.system
    741099 ± 11%     -18.1%     607212 ± 10%  numa-meminfo.node0.Shmem
    810129 ±  9%     +18.2%     957293 ±  6%  numa-meminfo.node1.Shmem
    185412 ± 11%     -18.1%     151915 ± 10%  numa-vmstat.node0.nr_shmem
    202794 ±  9%     +18.1%     239546 ±  6%  numa-vmstat.node1.nr_shmem
     37105 ±  3%     +13.3%      42047        sched_debug.cfs_rq:/.avg_vruntime.avg
    366.07 ± 16%     +42.2%     520.44 ± 18%  sched_debug.cfs_rq:/.avg_vruntime.min
     37059 ±  3%     +13.3%      41996        sched_debug.cfs_rq:/.zero_vruntime.avg
    365.95 ± 16%     +42.0%     519.52 ± 18%  sched_debug.cfs_rq:/.zero_vruntime.min
     50063            +3.8%      51961        stress-ng.flock.nanosecs_per_flock_lock_call
     12253           +12.2%      13749        stress-ng.flock.nanosecs_per_flock_unlock_call
 2.151e+08            -6.2%  2.017e+08        stress-ng.flock.ops
   3585763            -6.2%    3362435        stress-ng.flock.ops_per_sec
   1143087          +471.7%    6534724        stress-ng.time.involuntary_context_switches
      3406            +4.1%       3544        stress-ng.time.percent_of_cpu_this_job_got
      1982            +4.3%       2068        stress-ng.time.system_time
  40633837            -1.2%   40148548        stress-ng.time.voluntary_context_switches
      1.10 ±  3%      +0.0        1.14        perf-stat.i.branch-miss-rate%
  86031231 ±  4%      +3.8%   89289287        perf-stat.i.branch-misses
   1229642            +4.7%    1287313        perf-stat.i.context-switches
      4.22            +3.6%       4.37        perf-stat.i.cpi
 1.385e+11            +3.6%  1.435e+11        perf-stat.i.cpu-cycles
    242348            +1.8%     246698        perf-stat.i.cpu-migrations
      2436            +3.5%       2522        perf-stat.i.cycles-between-cache-misses
      0.25            -2.8%       0.25        perf-stat.i.ipc
     22.98            +4.2%      23.94        perf-stat.i.metric.K/sec
      1.10 ±  3%      +0.0        1.14        perf-stat.overall.branch-miss-rate%
      4.17            +3.4%       4.32        perf-stat.overall.cpi
      2445            +3.6%       2532        perf-stat.overall.cycles-between-cache-misses
      0.24            -3.3%       0.23        perf-stat.overall.ipc
  84386979 ±  4%      +3.7%   87501889        perf-stat.ps.branch-misses
   1209733            +4.6%    1265660        perf-stat.ps.context-switches
 1.362e+11            +3.6%  1.411e+11        perf-stat.ps.cpu-cycles
    238437            +1.7%     242532        perf-stat.ps.cpu-migrations
     30.28            -2.2       28.08        perf-profile.calltrace.cycles-pp.__percpu_down_read.flock_lock_inode.locks_lock_inode_wait.__do_sys_flock.do_syscall_64
     26.27            -2.0       24.26        perf-profile.calltrace.cycles-pp.percpu_rwsem_wait.__percpu_down_read.flock_lock_inode.locks_lock_inode_wait.__do_sys_flock
     24.22            -1.9       22.35        perf-profile.calltrace.cycles-pp._raw_spin_lock_irq.percpu_rwsem_wait.__percpu_down_read.flock_lock_inode.locks_lock_inode_wait
     23.98            -1.8       22.13        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.percpu_rwsem_wait.__percpu_down_read.flock_lock_inode
      7.77            -0.6        7.16        perf-profile.calltrace.cycles-pp.common_startup_64
      7.71            -0.6        7.10        perf-profile.calltrace.cycles-pp.asm_sysvec_call_function_single.pv_native_safe_halt.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter
      7.62            -0.6        7.02        perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.common_startup_64
      7.63            -0.6        7.03        perf-profile.calltrace.cycles-pp.start_secondary.common_startup_64
      7.60            -0.6        7.00        perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      6.45            -0.5        5.94        perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      5.68            -0.4        5.24        perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
      5.65            -0.4        5.22        perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
      5.50            -0.4        5.08        perf-profile.calltrace.cycles-pp.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      5.49            -0.4        5.07        perf-profile.calltrace.cycles-pp.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      5.49            -0.4        5.07        perf-profile.calltrace.cycles-pp.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter
      2.45            -0.2        2.29        perf-profile.calltrace.cycles-pp.pv_native_safe_halt.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state
      1.83            -0.1        1.71        perf-profile.calltrace.cycles-pp.sysvec_call_function_single.asm_sysvec_call_function_single.pv_native_safe_halt.acpi_safe_halt.acpi_idle_do_entry
      1.30            -0.1        1.18        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.flock
      2.46            -0.1        2.35        perf-profile.calltrace.cycles-pp.seq_read_iter.proc_reg_read_iter.vfs_read.ksys_read.do_syscall_64
      2.47            -0.1        2.36        perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.47            -0.1        2.36        perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.47            -0.1        2.36        perf-profile.calltrace.cycles-pp.proc_reg_read_iter.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.52            -0.1        2.42        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.52            -0.1        2.42        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.84            -0.1        0.74        perf-profile.calltrace.cycles-pp.clear_bhb_loop.flock
      1.46            -0.1        1.37        perf-profile.calltrace.cycles-pp.__sysvec_call_function_single.sysvec_call_function_single.asm_sysvec_call_function_single.pv_native_safe_halt.acpi_safe_halt
      0.78            -0.1        0.69        perf-profile.calltrace.cycles-pp.locks_start.seq_read_iter.proc_reg_read_iter.vfs_read.ksys_read
      0.76            -0.1        0.68        perf-profile.calltrace.cycles-pp.percpu_down_write.locks_start.seq_read_iter.proc_reg_read_iter.vfs_read
      1.40            -0.1        1.32        perf-profile.calltrace.cycles-pp.__flush_smp_call_function_queue.__sysvec_call_function_single.sysvec_call_function_single.asm_sysvec_call_function_single.pv_native_safe_halt
      0.95            -0.1        0.88        perf-profile.calltrace.cycles-pp.schedule.percpu_rwsem_wait.__percpu_down_read.flock_lock_inode.locks_lock_inode_wait
      2.85            -0.1        2.79        perf-profile.calltrace.cycles-pp.rcuwait_wake_up.__percpu_down_read.flock_lock_inode.locks_lock_inode_wait.__do_sys_flock
      0.92            -0.1        0.85        perf-profile.calltrace.cycles-pp.__schedule.schedule.percpu_rwsem_wait.__percpu_down_read.flock_lock_inode
      0.80            -0.1        0.74        perf-profile.calltrace.cycles-pp.schedule_idle.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      0.78            -0.1        0.72        perf-profile.calltrace.cycles-pp.__schedule.schedule_idle.do_idle.cpu_startup_entry.start_secondary
      1.13            -0.1        1.07        perf-profile.calltrace.cycles-pp.sched_ttwu_pending.__flush_smp_call_function_queue.__sysvec_call_function_single.sysvec_call_function_single.asm_sysvec_call_function_single
      2.83            -0.1        2.78        perf-profile.calltrace.cycles-pp.try_to_wake_up.rcuwait_wake_up.__percpu_down_read.flock_lock_inode.locks_lock_inode_wait
      2.72            -0.1        2.66        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.try_to_wake_up.rcuwait_wake_up.__percpu_down_read.flock_lock_inode
      2.60            -0.0        2.56        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.try_to_wake_up.rcuwait_wake_up.__percpu_down_read
      0.91            -0.0        0.87        perf-profile.calltrace.cycles-pp.ttwu_do_activate.sched_ttwu_pending.__flush_smp_call_function_queue.__sysvec_call_function_single.sysvec_call_function_single
      2.72            -0.0        2.68        perf-profile.calltrace.cycles-pp.rcuwait_wake_up.flock_lock_inode.locks_lock_inode_wait.__do_sys_flock.do_syscall_64
      0.81            -0.0        0.77        perf-profile.calltrace.cycles-pp.schedule.locks_lock_inode_wait.__do_sys_flock.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.78            -0.0        0.74        perf-profile.calltrace.cycles-pp.__schedule.schedule.locks_lock_inode_wait.__do_sys_flock.do_syscall_64
      0.64            -0.0        0.61        perf-profile.calltrace.cycles-pp.enqueue_task.ttwu_do_activate.sched_ttwu_pending.__flush_smp_call_function_queue.__sysvec_call_function_single
      0.60            -0.0        0.57        perf-profile.calltrace.cycles-pp.enqueue_task_fair.enqueue_task.ttwu_do_activate.sched_ttwu_pending.__flush_smp_call_function_queue
      3.13            +0.8        3.90        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.locks_move_blocks.flock_lock_inode.locks_lock_inode_wait
      3.16            +0.8        3.93        perf-profile.calltrace.cycles-pp._raw_spin_lock.locks_move_blocks.flock_lock_inode.locks_lock_inode_wait.__do_sys_flock
      3.17            +0.8        3.94        perf-profile.calltrace.cycles-pp.locks_move_blocks.flock_lock_inode.locks_lock_inode_wait.__do_sys_flock.do_syscall_64
     85.48            +0.9       86.39        perf-profile.calltrace.cycles-pp.flock
     10.26            +0.9       11.18        perf-profile.calltrace.cycles-pp.locks_unlink_lock_ctx.flock_lock_inode.locks_lock_inode_wait.__do_sys_flock.do_syscall_64
      9.09            +0.9       10.03        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.locks_unlink_lock_ctx.flock_lock_inode.locks_lock_inode_wait
      9.24            +0.9       10.18        perf-profile.calltrace.cycles-pp._raw_spin_lock.locks_unlink_lock_ctx.flock_lock_inode.locks_lock_inode_wait.__do_sys_flock
     82.26            +1.0       83.24        perf-profile.calltrace.cycles-pp.__do_sys_flock.do_syscall_64.entry_SYSCALL_64_after_hwframe.flock
     81.58            +1.1       82.64        perf-profile.calltrace.cycles-pp.locks_lock_inode_wait.__do_sys_flock.do_syscall_64.entry_SYSCALL_64_after_hwframe.flock
     80.41            +1.1       81.47        perf-profile.calltrace.cycles-pp.flock_lock_inode.locks_lock_inode_wait.__do_sys_flock.do_syscall_64.entry_SYSCALL_64_after_hwframe
     83.63            +1.1       84.70        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.flock
     83.46            +1.1       84.55        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.flock
     32.18            +1.7       33.93        perf-profile.calltrace.cycles-pp._raw_spin_lock.flock_lock_inode.locks_lock_inode_wait.__do_sys_flock.do_syscall_64
     31.71            +1.8       33.46        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.flock_lock_inode.locks_lock_inode_wait.__do_sys_flock
     30.29            -2.2       28.09        perf-profile.children.cycles-pp.__percpu_down_read
     26.49            -2.0       24.45        perf-profile.children.cycles-pp.percpu_rwsem_wait
     24.42            -1.9       22.53        perf-profile.children.cycles-pp._raw_spin_lock_irq
      7.77            -0.6        7.16        perf-profile.children.cycles-pp.common_startup_64
      7.77            -0.6        7.16        perf-profile.children.cycles-pp.cpu_startup_entry
      7.75            -0.6        7.14        perf-profile.children.cycles-pp.do_idle
      7.63            -0.6        7.03        perf-profile.children.cycles-pp.start_secondary
      6.57            -0.5        6.06        perf-profile.children.cycles-pp.cpuidle_idle_call
      5.79            -0.4        5.34        perf-profile.children.cycles-pp.cpuidle_enter
      5.76            -0.4        5.32        perf-profile.children.cycles-pp.cpuidle_enter_state
      5.60            -0.4        5.17        perf-profile.children.cycles-pp.acpi_idle_do_entry
      5.60            -0.4        5.18        perf-profile.children.cycles-pp.acpi_idle_enter
      5.58            -0.4        5.16        perf-profile.children.cycles-pp.pv_native_safe_halt
      5.59            -0.4        5.17        perf-profile.children.cycles-pp.acpi_safe_halt
      5.10            -0.3        4.77        perf-profile.children.cycles-pp.asm_sysvec_call_function_single
      6.13            -0.2        5.98        perf-profile.children.cycles-pp.rcuwait_wake_up
      7.88            -0.1        7.74        perf-profile.children.cycles-pp.try_to_wake_up
      6.12            -0.1        5.99        perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      2.47            -0.1        2.36        perf-profile.children.cycles-pp.vfs_read
      2.47            -0.1        2.36        perf-profile.children.cycles-pp.seq_read_iter
      2.47            -0.1        2.36        perf-profile.children.cycles-pp.ksys_read
      2.47            -0.1        2.36        perf-profile.children.cycles-pp.proc_reg_read_iter
      0.85            -0.1        0.75        perf-profile.children.cycles-pp.clear_bhb_loop
      0.78            -0.1        0.69        perf-profile.children.cycles-pp.locks_start
      0.78            -0.1        0.68        perf-profile.children.cycles-pp.percpu_down_write
      2.55            -0.1        2.46        perf-profile.children.cycles-pp.perf_session__process_events
      2.55            -0.1        2.46        perf-profile.children.cycles-pp.reader__read_event
      2.05            -0.1        1.98        perf-profile.children.cycles-pp.sysvec_call_function_single
      0.82            -0.1        0.75        perf-profile.children.cycles-pp.entry_SYSCALL_64
      0.82            -0.1        0.76        perf-profile.children.cycles-pp.schedule_idle
      1.66            -0.1        1.61        perf-profile.children.cycles-pp.__sysvec_call_function_single
      1.64            -0.0        1.58        perf-profile.children.cycles-pp.__flush_smp_call_function_queue
      0.76            -0.0        0.71        perf-profile.children.cycles-pp.dequeue_entities
      0.75            -0.0        0.70        perf-profile.children.cycles-pp.try_to_block_task
      0.72            -0.0        0.68        perf-profile.children.cycles-pp.dequeue_task_fair
      0.61            -0.0        0.57        perf-profile.children.cycles-pp.dequeue_entity
      0.36            -0.0        0.33        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      2.43            -0.0        2.39        perf-profile.children.cycles-pp.__wake_up
      1.33            -0.0        1.30        perf-profile.children.cycles-pp.sched_ttwu_pending
      0.23 ±  2%      -0.0        0.20 ±  2%  perf-profile.children.cycles-pp.tick_nohz_idle_stop_tick
      0.23            -0.0        0.20 ±  2%  perf-profile.children.cycles-pp.tick_nohz_stop_tick
      1.12            -0.0        1.09        perf-profile.children.cycles-pp.__locks_wake_up_blocks
      0.26            -0.0        0.24        perf-profile.children.cycles-pp.stress_time_now_timespec
      0.24            -0.0        0.21        perf-profile.children.cycles-pp.kmem_cache_alloc_noprof
      0.95            -0.0        0.93        perf-profile.children.cycles-pp.autoremove_wake_function
      0.20            -0.0        0.18 ±  2%  perf-profile.children.cycles-pp.locks_init_lock
      0.36            -0.0        0.33 ±  2%  perf-profile.children.cycles-pp.menu_select
      0.33 ±  2%      -0.0        0.31        perf-profile.children.cycles-pp.its_return_thunk
      0.31            -0.0        0.29        perf-profile.children.cycles-pp.ttwu_queue_wakelist
      0.21 ±  2%      -0.0        0.19 ±  3%  perf-profile.children.cycles-pp.fdget
      0.48            -0.0        0.46        perf-profile.children.cycles-pp.arch_exit_to_user_mode_prepare
      0.12 ±  3%      -0.0        0.10 ±  3%  perf-profile.children.cycles-pp.tick_nohz_restart_sched_tick
      0.16 ±  3%      -0.0        0.14        perf-profile.children.cycles-pp.locks_dispose_list
      0.20 ±  2%      -0.0        0.18 ±  2%  perf-profile.children.cycles-pp.update_rq_clock_task
      0.17 ±  2%      -0.0        0.15 ±  3%  perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.14            -0.0        0.12 ±  4%  perf-profile.children.cycles-pp.tick_nohz_idle_exit
      0.15 ±  2%      -0.0        0.14 ±  2%  perf-profile.children.cycles-pp.llist_reverse_order
      0.13            -0.0        0.12 ±  3%  perf-profile.children.cycles-pp.hrtimer_start_range_ns
      0.11 ±  3%      -0.0        0.10        perf-profile.children.cycles-pp.set_next_task_fair
      0.15 ±  2%      -0.0        0.14        perf-profile.children.cycles-pp.kmem_cache_free
      0.15 ±  2%      -0.0        0.14        perf-profile.children.cycles-pp.tick_irq_enter
      0.09            -0.0        0.08        perf-profile.children.cycles-pp.__task_rq_lock
      0.08            -0.0        0.07        perf-profile.children.cycles-pp.locks_release_private
      0.14            +0.0        0.15        perf-profile.children.cycles-pp.switch_fpu_return
      0.08 ±  4%      +0.0        0.10 ±  5%  perf-profile.children.cycles-pp.evlist__parse_sample
      0.13 ±  2%      +0.0        0.15 ±  3%  perf-profile.children.cycles-pp.__rseq_handle_notify_resume
      0.22 ±  3%      +0.0        0.23        perf-profile.children.cycles-pp.pick_task_fair
      0.70            +0.0        0.73        perf-profile.children.cycles-pp.__pick_next_task
      0.59            +0.0        0.62        perf-profile.children.cycles-pp.pick_next_task_fair
      0.21 ±  2%      +0.0        0.25 ±  2%  perf-profile.children.cycles-pp.__cond_resched
      0.00            +0.1        0.06        perf-profile.children.cycles-pp.put_prev_entity
      0.30 ±  2%      +0.2        0.46        perf-profile.children.cycles-pp.exit_to_user_mode_loop
      3.17            +0.8        3.95        perf-profile.children.cycles-pp.locks_move_blocks
     86.13            +0.9       87.00        perf-profile.children.cycles-pp.flock
     10.27            +0.9       11.19        perf-profile.children.cycles-pp.locks_unlink_lock_ctx
     86.23            +1.0       87.19        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     82.31            +1.0       83.28        perf-profile.children.cycles-pp.__do_sys_flock
     86.06            +1.0       87.04        perf-profile.children.cycles-pp.do_syscall_64
     81.62            +1.0       82.66        perf-profile.children.cycles-pp.locks_lock_inode_wait
     80.50            +1.1       81.55        perf-profile.children.cycles-pp.flock_lock_inode
     73.64            +1.5       75.17        perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
     45.06            +3.4       48.50        perf-profile.children.cycles-pp._raw_spin_lock
      3.36            -0.3        3.08        perf-profile.self.cycles-pp.pv_native_safe_halt
      1.14            -0.1        1.01        perf-profile.self.cycles-pp.__percpu_down_read
      0.84            -0.1        0.74        perf-profile.self.cycles-pp.clear_bhb_loop
      0.90            -0.1        0.83        perf-profile.self.cycles-pp.flock_lock_inode
      0.74            -0.1        0.68        perf-profile.self.cycles-pp.flock
      0.68            -0.0        0.63        perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      1.01            -0.0        0.97        perf-profile.self.cycles-pp._raw_spin_lock
      0.36            -0.0        0.32        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.49            -0.0        0.46        perf-profile.self.cycles-pp.percpu_rwsem_wait
      0.20            -0.0        0.17 ±  2%  perf-profile.self.cycles-pp.__do_sys_flock
      0.32            -0.0        0.29        perf-profile.self.cycles-pp.arch_exit_to_user_mode_prepare
      0.26            -0.0        0.24 ±  2%  perf-profile.self.cycles-pp._raw_spin_lock_irq
      0.19            -0.0        0.17 ±  2%  perf-profile.self.cycles-pp.locks_init_lock
      0.24            -0.0        0.22 ±  2%  perf-profile.self.cycles-pp.entry_SYSCALL_64
      0.30            -0.0        0.28        perf-profile.self.cycles-pp.do_syscall_64
      0.22 ±  2%      -0.0        0.20 ±  2%  perf-profile.self.cycles-pp.rcuwait_wake_up
      0.22            -0.0        0.20        perf-profile.self.cycles-pp.stress_time_now_timespec
      0.20 ±  2%      -0.0        0.18 ±  2%  perf-profile.self.cycles-pp.fdget
      0.18 ±  2%      -0.0        0.17        perf-profile.self.cycles-pp.percpu_down_write
      0.17            -0.0        0.16 ±  3%  perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.11 ±  4%      -0.0        0.10        perf-profile.self.cycles-pp.cpuidle_idle_call
      0.10            -0.0        0.09        perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.16            -0.0        0.15        perf-profile.self.cycles-pp.update_rq_clock_task
      0.09            -0.0        0.08        perf-profile.self.cycles-pp.x64_sys_call
      0.12            -0.0        0.11        perf-profile.self.cycles-pp.kmem_cache_free
      0.06            -0.0        0.05        perf-profile.self.cycles-pp.do_idle
      0.06            -0.0        0.05        perf-profile.self.cycles-pp.poll_idle
     73.23            +1.4       74.67        perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath



***************************************************************************************************
lkp-spr-r02: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory
=========================================================================================
compiler/cpufreq_governor/iterations/kconfig/message_threads/rootfs/runtime/tbox_group/testcase/worker_threads:
  gcc-14/performance/3x/x86_64-rhel-9.4/10%/debian-13-x86_64-20250902.cgz/300s/lkp-spr-r02/schbench/128

commit: 
  aceccac58a ("sched/fair: Enable scheduler feature NEXT_BUDDY")
  e837456fdc ("sched/fair: Reimplement NEXT_BUDDY to align with EEVDF goals")

aceccac58ad76305 e837456fdca81899a3c8e47b3fd 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
   9616588 ± 16%     +37.3%   13206732 ± 11%  meminfo.DirectMap2M
      0.06            +0.0        0.09        mpstat.cpu.all.sys%
    416384 ±  3%     +12.0%     466180        perf-c2c.HITM.total
      0.92           -17.6%       0.76        turbostat.IPC
     65.96           -27.0%      48.12        turbostat.PkgWatt
   6893366 ±  7%     +32.9%    9158770 ±  9%  proc-vmstat.numa_pages_migrated
  12492167 ±  3%     +18.1%   14758679 ±  5%  proc-vmstat.pgalloc_normal
  11909257 ±  5%     +21.3%   14440850 ±  5%  proc-vmstat.pgfree
   6893366 ±  7%     +32.9%    9158770 ±  9%  proc-vmstat.pgmigrate_success
     13201 ±  7%     +33.6%      17632 ±  9%  proc-vmstat.thp_migration_success
     36.71            -4.3       32.43        perf-profile.calltrace.cycles-pp.worker_thread
     58.80            +4.3       63.12        perf-profile.calltrace.cycles-pp.pthread_mutex_trylock
     41.71            -4.3       37.41        perf-profile.children.cycles-pp.worker_thread
      0.08 ±  9%      -0.0        0.06 ± 10%  perf-profile.children.cycles-pp.task_tick_fair
      0.23 ±  4%      -0.0        0.21 ±  3%  perf-profile.children.cycles-pp.update_process_times
      0.12 ±  6%      -0.0        0.10 ±  6%  perf-profile.children.cycles-pp.sched_tick
     58.69            +4.3       62.99        perf-profile.children.cycles-pp.pthread_mutex_trylock
     40.91            -4.3       36.60        perf-profile.self.cycles-pp.worker_thread
     57.68            +4.3       61.95        perf-profile.self.cycles-pp.pthread_mutex_trylock
    170035           +26.3%     214784        schbench.request_end_latency_50%_us_max
    574054           +16.7%     669900        schbench.request_end_latency_90%_us_max
   1291059           +51.9%    1960755        schbench.request_end_latency_99%_us_max
   2195456           +95.3%    4287692        schbench.request_end_latency_99.9%_us_max
    166430           +25.6%     208971        schbench.request_latency_50%_us
    602125            +8.5%     653599        schbench.request_latency_90%_us
      3.96 ±  5%      -1.7        2.30 ± 10%  schbench.request_latency_90%_us_stddev%
   1384537           +29.8%    1796745        schbench.request_latency_99%_us
      6.48 ±  7%      +0.8        7.29 ±  6%  schbench.request_latency_99%_us_stddev%
   2339224           +58.6%    3709751        schbench.request_latency_99.9%_us
      7.13 ± 11%      +5.6       12.74 ±  7%  schbench.request_latency_99.9%_us_stddev%
   6275030 ±  5%     +84.5%   11576234 ±  4%  schbench.request_latency_max_us
      8.65 ± 37%     +17.8       26.43 ± 12%  schbench.request_latency_max_us_stddev%
  66343190           +16.9%   77547512        schbench.time.involuntary_context_switches
     74.52           +99.4%     148.60 ±  2%  schbench.time.system_time
  23812451           -34.0%   15711129        schbench.time.voluntary_context_switches
     10198 ±  9%    -100.0%       2.10 ± 14%  schbench.wakeup_end_latency_50%_us_max
     40384           -15.6%      34099        schbench.wakeup_end_latency_90%_us_max
      0.56 ± 46%      +0.4        0.92 ±  9%  schbench.wakeup_end_latency_90%_us_stddev%
     55027           -22.9%      42444        schbench.wakeup_end_latency_99%_us_max
     70502           -23.3%      54067        schbench.wakeup_end_latency_99.9%_us_max
      5267 ±  4%     -99.9%       3.70 ±  4%  schbench.wakeup_latency_50%_us
     42242           -17.2%      34985        schbench.wakeup_latency_90%_us
     58703           -24.1%      44550        schbench.wakeup_latency_99%_us
     77479           -19.8%      62161 ±  3%  schbench.wakeup_latency_99.9%_us
     11.62 ± 17%     +11.2       22.86 ± 30%  schbench.wakeup_latency_99.9%_us_stddev%
      0.03 ±  2%     +34.0%       0.04 ±  2%  perf-stat.i.MPKI
 8.861e+10           -15.0%  7.536e+10        perf-stat.i.branch-instructions
      0.02            +0.0        0.02        perf-stat.i.branch-miss-rate%
  15718668            -9.0%   14299831        perf-stat.i.branch-misses
  18987883 ±  2%     +11.1%   21098603 ±  2%  perf-stat.i.cache-misses
 9.235e+08           +15.3%  1.065e+09 ±  2%  perf-stat.i.cache-references
    100957            +3.5%     104530        perf-stat.i.context-switches
      1.09           +21.5%       1.32        perf-stat.i.cpi
      9051           -11.3%       8024        perf-stat.i.cpu-migrations
     37600 ±  2%      -9.2%      34140 ±  3%  perf-stat.i.cycles-between-cache-misses
 5.973e+11           -17.7%  4.915e+11        perf-stat.i.instructions
      0.92           -17.7%       0.76        perf-stat.i.ipc
      4246            -2.2%       4152        perf-stat.i.minor-faults
      4246            -2.2%       4152        perf-stat.i.page-faults
      0.03 ±  2%     +35.3%       0.04 ±  2%  perf-stat.overall.MPKI
      0.02            +0.0        0.02 ±  2%  perf-stat.overall.branch-miss-rate%
      1.08           +21.5%       1.32        perf-stat.overall.cpi
     34177 ±  2%     -10.2%      30693 ±  2%  perf-stat.overall.cycles-between-cache-misses
      0.92           -17.7%       0.76        perf-stat.overall.ipc
 8.849e+10           -15.0%  7.526e+10        perf-stat.ps.branch-instructions
  15642159            -8.6%   14294381        perf-stat.ps.branch-misses
  18928889 ±  2%     +11.4%   21083723 ±  2%  perf-stat.ps.cache-misses
 9.226e+08           +15.3%  1.063e+09 ±  2%  perf-stat.ps.cache-references
    100807            +3.6%     104397        perf-stat.ps.context-switches
      9032           -11.3%       8014        perf-stat.ps.cpu-migrations
 5.965e+11           -17.7%  4.909e+11        perf-stat.ps.instructions
 5.388e+14           -17.7%  4.435e+14        perf-stat.total.instructions
  85193593           +14.9%   97867783        sched_debug.cfs_rq:/.avg_vruntime.min
   3132564 ±  3%     -57.9%    1317492 ± 10%  sched_debug.cfs_rq:/.avg_vruntime.stddev
     19.49 ±  2%     -20.7%      15.46 ±  2%  sched_debug.cfs_rq:/.h_nr_queued.max
      1.27 ± 18%    +318.4%       5.30 ± 10%  sched_debug.cfs_rq:/.h_nr_queued.min
      2.86 ±  2%     -58.9%       1.18 ±  4%  sched_debug.cfs_rq:/.h_nr_queued.stddev
     19.47           -20.6%      15.46 ±  2%  sched_debug.cfs_rq:/.h_nr_runnable.max
      1.25 ± 18%    +322.9%       5.30 ± 10%  sched_debug.cfs_rq:/.h_nr_runnable.min
      2.87 ±  2%     -58.9%       1.18 ±  4%  sched_debug.cfs_rq:/.h_nr_runnable.stddev
    480.25 ± 19%    +305.1%       1945 ± 11%  sched_debug.cfs_rq:/.load.min
      1.90 ±  6%     +29.5%       2.46 ±  4%  sched_debug.cfs_rq:/.load_avg.min
     19964           -20.9%      15796 ±  2%  sched_debug.cfs_rq:/.runnable_avg.max
      1279 ± 20%    +323.2%       5415 ± 10%  sched_debug.cfs_rq:/.runnable_avg.min
      2921 ±  2%     -58.9%       1200 ±  4%  sched_debug.cfs_rq:/.runnable_avg.stddev
      1536 ±  2%     -20.8%       1217 ±  2%  sched_debug.cfs_rq:/.util_avg.max
    360.83 ±  9%     +82.3%     657.79 ±  6%  sched_debug.cfs_rq:/.util_avg.min
    141.34 ±  3%     -58.8%      58.24 ±  5%  sched_debug.cfs_rq:/.util_avg.stddev
      7601           -39.8%       4573        sched_debug.cfs_rq:/.util_est.avg
     12398           -43.1%       7056        sched_debug.cfs_rq:/.util_est.max
    761.10 ± 22%    +142.2%       1843 ±  8%  sched_debug.cfs_rq:/.util_est.min
      1754 ±  3%     -55.9%     773.35 ±  2%  sched_debug.cfs_rq:/.util_est.stddev
  85124903           +14.9%   97804039        sched_debug.cfs_rq:/.zero_vruntime.min
   3132850 ±  3%     -57.9%    1319836 ± 10%  sched_debug.cfs_rq:/.zero_vruntime.stddev
    823079 ±  2%     -15.2%     697607 ±  3%  sched_debug.cpu.avg_idle.avg
     89184 ± 20%     -61.0%      34799 ± 17%  sched_debug.cpu.avg_idle.min
    982877 ±  3%     -17.7%     808532 ±  2%  sched_debug.cpu.max_idle_balance_cost.max
     97853 ±  7%     -23.6%      74750 ±  6%  sched_debug.cpu.max_idle_balance_cost.stddev
     19.48 ±  2%     -20.6%      15.46 ±  2%  sched_debug.cpu.nr_running.max
      1.32 ± 19%    +307.1%       5.37 ±  9%  sched_debug.cpu.nr_running.min
      2.86 ±  2%     -59.0%       1.17 ±  4%  sched_debug.cpu.nr_running.stddev
    217457           +15.6%     251289        sched_debug.cpu.nr_switches.max
      4477 ±  3%     +85.7%       8314        sched_debug.cpu.nr_switches.stddev



***************************************************************************************************
lkp-spr-r02: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory
=========================================================================================
compiler/cpufreq_governor/ipc/iterations/kconfig/mode/nr_threads/rootfs/tbox_group/testcase:
  gcc-14/performance/socket/4/x86_64-rhel-9.4/threads/50%/debian-13-x86_64-20250902.cgz/lkp-spr-r02/hackbench

commit: 
  aceccac58a ("sched/fair: Enable scheduler feature NEXT_BUDDY")
  e837456fdc ("sched/fair: Reimplement NEXT_BUDDY to align with EEVDF goals")

aceccac58ad76305 e837456fdca81899a3c8e47b3fd 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 2.835e+09           -12.4%  2.483e+09 ±  4%  cpuidle..time
    176039           +15.4%     203225        meminfo.AnonHugePages
    246.45           +13.9%     280.68        uptime.boot
      3589 ± 21%    +672.7%      27737 ±113%  perf-c2c.DRAM.remote
      1667 ± 41%   +1086.1%      19778 ±117%  perf-c2c.HITM.remote
    181124            +7.2%     194122 ±  2%  perf-c2c.HITM.total
      6.20 ±  2%      -1.6        4.60 ±  5%  mpstat.cpu.all.idle%
      0.44 ±  2%      -0.0        0.40 ±  3%  mpstat.cpu.all.irq%
      0.06            -0.0        0.04 ±  2%  mpstat.cpu.all.soft%
      3.63            -0.4        3.21        mpstat.cpu.all.usr%
    105501            +1.2%     106742        proc-vmstat.nr_kernel_stack
     59331 ± 25%     +29.4%      76771 ± 11%  proc-vmstat.numa_pages_migrated
   2451189 ±  2%     +28.6%    3152939 ±  5%  proc-vmstat.pgfree
     59331 ± 25%     +29.4%      76771 ± 11%  proc-vmstat.pgmigrate_success
     63579 ±  3%      +7.5%      68371 ±  3%  proc-vmstat.pgreuse
    738291           +56.7%    1156830 ±  7%  sched_debug.cfs_rq:/.avg_vruntime.avg
    497546 ±  2%     +66.7%     829448 ±  7%  sched_debug.cfs_rq:/.avg_vruntime.min
      1479 ±  2%     -20.6%       1175 ± 14%  sched_debug.cfs_rq:/.util_est.avg
    736352           +56.4%    1151556 ±  7%  sched_debug.cfs_rq:/.zero_vruntime.avg
    495934 ±  2%     +66.3%     824663 ±  6%  sched_debug.cfs_rq:/.zero_vruntime.min
   1841427 ±  8%     +24.8%    2297860 ±  6%  sched_debug.cpu.avg_idle.max
      0.47            -0.2        0.32 ±  7%  turbostat.C1%
      2.87 ±  2%      -0.6        2.22 ±  9%  turbostat.C1E%
      2.87            -0.7        2.18 ±  2%  turbostat.C6%
      1.77 ±  2%     -24.5%       1.34 ±  6%  turbostat.CPU%c1
      0.93 ±  5%     -20.3%       0.74 ±  9%  turbostat.CPU%c6
      0.49           -11.5%       0.44        turbostat.IPC
 1.979e+08           +32.6%  2.625e+08        turbostat.IRQ
    680.37            -2.3%     664.56        turbostat.PkgWatt
     20.58            -2.3%      20.10        turbostat.RAMWatt
    535388           -14.6%     457188        hackbench.throughput
    527033           -14.6%     449974        hackbench.throughput_avg
    535388           -14.6%     457188        hackbench.throughput_best
    516857           -14.7%     441103        hackbench.throughput_worst
    200.37           +17.0%     234.48        hackbench.time.elapsed_time
    200.37           +17.0%     234.48        hackbench.time.elapsed_time.max
 1.812e+08           +55.5%  2.818e+08 ±  2%  hackbench.time.involuntary_context_switches
     20873            +1.7%      21218        hackbench.time.percent_of_cpu_this_job_got
     40414           +19.5%      48301        hackbench.time.system_time
      1410            +3.0%       1452        hackbench.time.user_time
 8.166e+08           +18.7%  9.697e+08        hackbench.time.voluntary_context_switches
 5.692e+10            -9.6%  5.146e+10        perf-stat.i.branch-instructions
      0.49            +0.0        0.51        perf-stat.i.branch-miss-rate%
 2.679e+08            -5.9%  2.521e+08        perf-stat.i.branch-misses
  77421715 ±  2%     -10.8%   69021827 ±  7%  perf-stat.i.cache-misses
 2.327e+09           -16.3%  1.948e+09        perf-stat.i.cache-references
   5271626            +5.8%    5575147        perf-stat.i.context-switches
      2.02           +13.3%       2.29        perf-stat.i.cpi
 6.118e+11            +1.5%  6.211e+11        perf-stat.i.cpu-cycles
     10250 ±  2%     +30.0%      13327 ±  4%  perf-stat.i.cycles-between-cache-misses
 3.031e+11           -10.4%  2.716e+11        perf-stat.i.instructions
      0.50           -11.6%       0.44        perf-stat.i.ipc
     25.76            +5.3%      27.12        perf-stat.i.metric.K/sec
      6555 ±  5%     -10.7%       5854 ±  6%  perf-stat.i.minor-faults
      6555 ±  5%     -10.7%       5854 ±  6%  perf-stat.i.page-faults
      0.47            +0.0        0.49        perf-stat.overall.branch-miss-rate%
      2.02           +13.2%       2.29        perf-stat.overall.cpi
      8022 ±  2%     +14.5%       9182 ±  7%  perf-stat.overall.cycles-between-cache-misses
      0.50           -11.7%       0.44        perf-stat.overall.ipc
 5.665e+10            -9.5%  5.125e+10        perf-stat.ps.branch-instructions
  2.66e+08            -5.8%  2.506e+08        perf-stat.ps.branch-misses
  75995573 ±  2%     -10.9%   67721227 ±  6%  perf-stat.ps.cache-misses
 2.312e+09           -16.2%  1.936e+09        perf-stat.ps.cache-references
   5236058            +5.8%    5541265        perf-stat.ps.context-switches
 6.092e+11            +1.6%  6.187e+11        perf-stat.ps.cpu-cycles
 3.016e+11           -10.3%  2.705e+11        perf-stat.ps.instructions
      6318 ±  6%     -10.1%       5677 ±  6%  perf-stat.ps.minor-faults
      6318 ±  6%     -10.1%       5677 ±  6%  perf-stat.ps.page-faults
 6.069e+13            +4.9%  6.364e+13        perf-stat.total.instructions
      4.99 ±  3%      -1.0        3.98        perf-profile.calltrace.cycles-pp.unix_stream_read_actor.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      4.94 ±  3%      -1.0        3.94        perf-profile.calltrace.cycles-pp.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      4.86 ±  3%      -1.0        3.87        perf-profile.calltrace.cycles-pp.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic.unix_stream_recvmsg
      2.55 ± 11%      -0.6        1.95        perf-profile.calltrace.cycles-pp._raw_spin_lock.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write
      2.59 ±  2%      -0.5        2.04        perf-profile.calltrace.cycles-pp.simple_copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic
      2.48 ±  2%      -0.5        1.95        perf-profile.calltrace.cycles-pp.__check_object_size.simple_copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor
      2.26 ±  2%      -0.5        1.78        perf-profile.calltrace.cycles-pp.__memcg_slab_free_hook.kmem_cache_free.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      1.75 ±  7%      -0.5        1.28 ±  3%  perf-profile.calltrace.cycles-pp.fdget_pos.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.36 ±  3%      -0.5        1.89        perf-profile.calltrace.cycles-pp.skb_release_head_state.consume_skb.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      2.29 ±  3%      -0.5        1.83        perf-profile.calltrace.cycles-pp.unix_destruct_scm.skb_release_head_state.consume_skb.unix_stream_read_generic.unix_stream_recvmsg
      2.17 ±  4%      -0.4        1.74        perf-profile.calltrace.cycles-pp.sock_wfree.unix_destruct_scm.skb_release_head_state.consume_skb.unix_stream_read_generic
      2.02 ±  2%      -0.4        1.58        perf-profile.calltrace.cycles-pp.check_heap_object.__check_object_size.simple_copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter
     41.28            -0.4       40.89        perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.97 ±  4%      -0.4        1.59        perf-profile.calltrace.cycles-pp._copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.unix_stream_read_actor.unix_stream_read_generic
      1.28 ±  4%      -0.2        1.04        perf-profile.calltrace.cycles-pp.__memcg_slab_free_hook.kfree.skb_release_data.consume_skb.unix_stream_read_generic
      1.08 ±  5%      -0.2        0.86        perf-profile.calltrace.cycles-pp.__slab_free.kfree.skb_release_data.consume_skb.unix_stream_read_generic
      1.26 ±  2%      -0.2        1.04        perf-profile.calltrace.cycles-pp.skb_copy_datagram_from_iter.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write
      0.92 ±  7%      -0.2        0.70 ±  2%  perf-profile.calltrace.cycles-pp.skb_set_owner_w.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter.vfs_write
      1.14 ±  4%      -0.2        0.93 ±  2%  perf-profile.calltrace.cycles-pp.__memcg_slab_post_alloc_hook.__kmalloc_node_track_caller_noprof.kmalloc_reserve.__alloc_skb.alloc_skb_with_frags
      0.91 ±  4%      -0.2        0.76 ±  2%  perf-profile.calltrace.cycles-pp.__memcg_slab_post_alloc_hook.kmem_cache_alloc_node_noprof.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      0.67 ±  5%      -0.1        0.53        perf-profile.calltrace.cycles-pp.__slab_free.kmem_cache_free.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
      0.82 ±  3%      -0.1        0.72 ±  2%  perf-profile.calltrace.cycles-pp.arch_exit_to_user_mode_prepare.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.64 ±  7%      -0.1        0.54        perf-profile.calltrace.cycles-pp._raw_spin_lock.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter
      0.78 ±  2%      +0.1        0.84 ±  3%  perf-profile.calltrace.cycles-pp.enqueue_task_fair.enqueue_task.ttwu_do_activate.try_to_wake_up.autoremove_wake_function
      0.54 ±  3%      +0.1        0.65 ±  3%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
     38.41            +0.3       38.71        perf-profile.calltrace.cycles-pp.sock_write_iter.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
     96.33            +0.4       96.69        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
     96.02            +0.4       96.43        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
     37.72            +0.4       38.14        perf-profile.calltrace.cycles-pp.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write.do_syscall_64
      0.26 ±100%      +0.6        0.84 ±  9%  perf-profile.calltrace.cycles-pp.__switch_to
     52.61            +0.9       53.56        perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
     51.75            +1.1       52.88        perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
     51.10            +1.2       52.34        perf-profile.calltrace.cycles-pp.sock_read_iter.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
     50.66            +1.3       51.97        perf-profile.calltrace.cycles-pp.sock_recvmsg.sock_read_iter.vfs_read.ksys_read.do_syscall_64
     50.47            +1.3       51.81        perf-profile.calltrace.cycles-pp.unix_stream_recvmsg.sock_recvmsg.sock_read_iter.vfs_read.ksys_read
     50.24            +1.4       51.62        perf-profile.calltrace.cycles-pp.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.sock_read_iter.vfs_read
     29.14 ±  2%      +1.7       30.82        perf-profile.calltrace.cycles-pp.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter.vfs_write.ksys_write
     10.97 ± 14%      +2.3       13.22 ±  5%  perf-profile.calltrace.cycles-pp.___slab_alloc.__kmalloc_node_track_caller_noprof.kmalloc_reserve.__alloc_skb.alloc_skb_with_frags
     10.46 ± 15%      +2.3       12.72 ±  5%  perf-profile.calltrace.cycles-pp.get_partial_node.___slab_alloc.__kmalloc_node_track_caller_noprof.kmalloc_reserve.__alloc_skb
     26.90 ±  3%      +2.3       29.15        perf-profile.calltrace.cycles-pp.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter.vfs_write
      9.97 ± 15%      +2.3       12.23 ±  6%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.get_partial_node.___slab_alloc.__kmalloc_node_track_caller_noprof.kmalloc_reserve
      9.94 ± 15%      +2.3       12.20 ±  6%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.get_partial_node.___slab_alloc.__kmalloc_node_track_caller_noprof
     26.74 ±  3%      +2.3       29.03        perf-profile.calltrace.cycles-pp.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb.unix_stream_sendmsg.sock_write_iter
     15.48 ± 15%      +3.4       18.89 ±  5%  perf-profile.calltrace.cycles-pp.__put_partials.kfree.skb_release_data.consume_skb.unix_stream_read_generic
     15.26 ± 15%      +3.4       18.67 ±  5%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__put_partials.kfree.skb_release_data.consume_skb
     15.12 ± 15%      +3.4       18.54 ±  5%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__put_partials.kfree.skb_release_data
      5.01 ±  3%      -1.0        4.00        perf-profile.children.cycles-pp.unix_stream_read_actor
      4.97 ±  3%      -1.0        3.96        perf-profile.children.cycles-pp.skb_copy_datagram_iter
      4.89 ±  3%      -1.0        3.89        perf-profile.children.cycles-pp.__skb_datagram_iter
      3.61 ±  3%      -0.7        2.87        perf-profile.children.cycles-pp.__memcg_slab_free_hook
      3.22 ±  2%      -0.7        2.56        perf-profile.children.cycles-pp.__check_object_size
      3.72 ±  9%      -0.6        3.12 ±  2%  perf-profile.children.cycles-pp._raw_spin_lock
      2.29 ±  8%      -0.6        1.70 ±  4%  perf-profile.children.cycles-pp.fdget_pos
      2.61 ±  2%      -0.6        2.06        perf-profile.children.cycles-pp.simple_copy_to_iter
      2.40 ±  2%      -0.5        1.90        perf-profile.children.cycles-pp.check_heap_object
      2.38 ±  3%      -0.5        1.91        perf-profile.children.cycles-pp.skb_release_head_state
      2.32 ±  3%      -0.5        1.86        perf-profile.children.cycles-pp.unix_destruct_scm
      2.20 ±  3%      -0.4        1.75        perf-profile.children.cycles-pp.sock_wfree
     41.38            -0.4       40.98        perf-profile.children.cycles-pp.ksys_write
      1.98 ±  4%      -0.4        1.60        perf-profile.children.cycles-pp._copy_to_iter
      2.12 ±  4%      -0.4        1.75 ±  2%  perf-profile.children.cycles-pp.__memcg_slab_post_alloc_hook
      1.78 ±  5%      -0.4        1.42        perf-profile.children.cycles-pp.__slab_free
      1.30 ±  3%      -0.2        1.06        perf-profile.children.cycles-pp.skb_copy_datagram_from_iter
      0.48 ± 47%      -0.2        0.26 ±  4%  perf-profile.children.cycles-pp.common_startup_64
      0.48 ± 47%      -0.2        0.26 ±  4%  perf-profile.children.cycles-pp.cpu_startup_entry
      0.48 ± 47%      -0.2        0.26 ±  4%  perf-profile.children.cycles-pp.do_idle
      0.47 ± 49%      -0.2        0.25 ±  3%  perf-profile.children.cycles-pp.start_secondary
      0.93 ±  6%      -0.2        0.71 ±  2%  perf-profile.children.cycles-pp.skb_set_owner_w
      0.94 ±  4%      -0.2        0.77 ±  2%  perf-profile.children.cycles-pp.obj_cgroup_charge_account
      0.76 ±  3%      -0.1        0.62 ±  2%  perf-profile.children.cycles-pp.__account_obj_stock
      0.77 ±  2%      -0.1        0.63        perf-profile.children.cycles-pp.refill_obj_stock
      0.29 ± 46%      -0.1        0.15 ±  4%  perf-profile.children.cycles-pp.cpuidle_idle_call
      0.26 ± 48%      -0.1        0.13 ±  4%  perf-profile.children.cycles-pp.cpuidle_enter
      0.25 ± 48%      -0.1        0.13 ±  4%  perf-profile.children.cycles-pp.cpuidle_enter_state
      0.85 ±  2%      -0.1        0.74 ±  2%  perf-profile.children.cycles-pp.arch_exit_to_user_mode_prepare
      0.54 ±  6%      -0.1        0.44 ±  2%  perf-profile.children.cycles-pp.fput
      0.67 ±  2%      -0.1        0.56 ±  2%  perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.50 ±  3%      -0.1        0.40        perf-profile.children.cycles-pp.unix_write_space
      0.50 ±  3%      -0.1        0.41        perf-profile.children.cycles-pp._copy_from_iter
      0.17 ± 64%      -0.1        0.08 ±  6%  perf-profile.children.cycles-pp.intel_idle
      0.41 ±  4%      -0.1        0.32 ±  3%  perf-profile.children.cycles-pp.__check_heap_object
      0.46 ±  6%      -0.1        0.38 ±  2%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.49 ±  6%      -0.1        0.41 ±  2%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.41 ±  7%      -0.1        0.34 ±  2%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.39 ±  3%      -0.1        0.32 ±  2%  perf-profile.children.cycles-pp.rw_verify_area
      0.31 ± 31%      -0.1        0.25 ±  3%  perf-profile.children.cycles-pp.prepare_to_wait
      0.36 ±  7%      -0.1        0.29 ±  3%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.40 ±  6%      -0.1        0.33 ±  2%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.35 ±  7%      -0.1        0.28 ±  3%  perf-profile.children.cycles-pp.tick_nohz_handler
      0.34 ±  7%      -0.1        0.27 ±  2%  perf-profile.children.cycles-pp.update_process_times
      0.35 ±  3%      -0.1        0.29        perf-profile.children.cycles-pp.entry_SYSCALL_64
      0.09 ± 51%      -0.1        0.03 ± 70%  perf-profile.children.cycles-pp.flush_smp_call_function_queue
      0.36 ±  3%      -0.1        0.30 ±  2%  perf-profile.children.cycles-pp.mutex_lock
      0.34 ±  2%      -0.0        0.29 ±  2%  perf-profile.children.cycles-pp.__cond_resched
      0.30 ±  2%      -0.0        0.25 ±  2%  perf-profile.children.cycles-pp.__virt_addr_valid
      0.25 ±  3%      -0.0        0.20 ±  3%  perf-profile.children.cycles-pp.sender
      0.29 ±  2%      -0.0        0.24 ±  2%  perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.15 ±  7%      -0.0        0.11 ±  4%  perf-profile.children.cycles-pp.unix_maybe_add_creds
      0.18 ±  9%      -0.0        0.14 ±  4%  perf-profile.children.cycles-pp.mod_memcg_lruvec_state
      0.22 ±  4%      -0.0        0.19        perf-profile.children.cycles-pp.mutex_unlock
      0.22 ±  2%      -0.0        0.18 ±  3%  perf-profile.children.cycles-pp.scm_recv_unix
      0.17 ±  7%      -0.0        0.13 ±  3%  perf-profile.children.cycles-pp.obj_cgroup_uncharge_pages
      0.21 ±  8%      -0.0        0.17 ±  4%  perf-profile.children.cycles-pp.sched_tick
      0.18            -0.0        0.15 ±  2%  perf-profile.children.cycles-pp.rcu_all_qs
      0.19 ±  3%      -0.0        0.16 ±  4%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.12 ±  4%      -0.0        0.09        perf-profile.children.cycles-pp.sched_balance_rq
      0.15 ±  3%      -0.0        0.12 ±  4%  perf-profile.children.cycles-pp.x64_sys_call
      0.18 ±  2%      -0.0        0.15 ±  5%  perf-profile.children.cycles-pp.receiver
      0.13 ±  5%      -0.0        0.10 ± 10%  perf-profile.children.cycles-pp.mod_memcg_state
      0.14 ±  3%      -0.0        0.12        perf-profile.children.cycles-pp.security_file_permission
      0.14 ±  4%      -0.0        0.12 ±  4%  perf-profile.children.cycles-pp.__build_skb_around
      0.09 ±  4%      -0.0        0.07 ±  5%  perf-profile.children.cycles-pp.sched_balance_newidle
      0.14 ±  2%      -0.0        0.12 ±  4%  perf-profile.children.cycles-pp.__scm_recv_common
      0.10 ±  4%      -0.0        0.08 ±  5%  perf-profile.children.cycles-pp.try_charge_memcg
      0.10            -0.0        0.08 ±  4%  perf-profile.children.cycles-pp.put_pid
      0.10 ±  3%      -0.0        0.08        perf-profile.children.cycles-pp.manage_oob
      0.10 ±  4%      -0.0        0.08        perf-profile.children.cycles-pp.is_vmalloc_addr
      0.09 ±  4%      -0.0        0.07 ±  5%  perf-profile.children.cycles-pp.security_socket_recvmsg
      0.11 ±  4%      -0.0        0.09        perf-profile.children.cycles-pp.unix_scm_to_skb
      0.09 ±  5%      -0.0        0.07 ±  5%  perf-profile.children.cycles-pp.read@plt
      0.06 ±  7%      -0.0        0.05        perf-profile.children.cycles-pp.read
      0.09            -0.0        0.08 ±  4%  perf-profile.children.cycles-pp.check_preempt_wakeup_fair
      0.06 ±  6%      -0.0        0.05        perf-profile.children.cycles-pp.kmalloc_size_roundup
      0.06            -0.0        0.05        perf-profile.children.cycles-pp.skb_free_head
      0.06            -0.0        0.05        perf-profile.children.cycles-pp.skb_put
      0.11            -0.0        0.10        perf-profile.children.cycles-pp.check_stack_object
      0.10 ±  4%      +0.0        0.12 ±  4%  perf-profile.children.cycles-pp.asm_sysvec_reschedule_ipi
      0.07 ±  5%      +0.0        0.10 ±  3%  perf-profile.children.cycles-pp.__pick_eevdf
      0.19 ±  4%      +0.0        0.22 ±  4%  perf-profile.children.cycles-pp.pick_task_fair
      0.08 ± 22%      +0.1        0.13 ±  9%  perf-profile.children.cycles-pp.get_any_partial
      0.54 ±  3%      +0.1        0.65 ±  3%  perf-profile.children.cycles-pp.exit_to_user_mode_loop
      0.48 ±  4%      +0.1        0.60 ±  5%  perf-profile.children.cycles-pp.raw_spin_rq_lock_nested
     38.44            +0.3       38.74        perf-profile.children.cycles-pp.sock_write_iter
      0.52 ±  7%      +0.3        0.87 ±  9%  perf-profile.children.cycles-pp.__switch_to
     96.42            +0.4       96.77        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     96.17            +0.4       96.56        perf-profile.children.cycles-pp.do_syscall_64
     37.86            +0.4       38.26        perf-profile.children.cycles-pp.unix_stream_sendmsg
     52.68            +0.9       53.61        perf-profile.children.cycles-pp.ksys_read
     51.79            +1.1       52.90        perf-profile.children.cycles-pp.vfs_read
     51.12            +1.2       52.36        perf-profile.children.cycles-pp.sock_read_iter
     50.70            +1.3       52.00        perf-profile.children.cycles-pp.sock_recvmsg
     50.49            +1.3       51.83        perf-profile.children.cycles-pp.unix_stream_recvmsg
     50.37            +1.4       51.73        perf-profile.children.cycles-pp.unix_stream_read_generic
     29.18 ±  2%      +1.7       30.85        perf-profile.children.cycles-pp.sock_alloc_send_pskb
     26.93 ±  3%      +2.3       29.18        perf-profile.children.cycles-pp.alloc_skb_with_frags
     26.79 ±  3%      +2.3       29.07        perf-profile.children.cycles-pp.__alloc_skb
     21.25 ±  4%      +3.2       24.49        perf-profile.children.cycles-pp.___slab_alloc
     20.37 ±  5%      +3.3       23.67        perf-profile.children.cycles-pp.get_partial_node
     30.02 ±  4%      +4.9       34.96        perf-profile.children.cycles-pp.__put_partials
     49.69 ±  4%      +8.1       57.82        perf-profile.children.cycles-pp._raw_spin_lock_irqsave
     49.65 ±  4%      +8.2       57.81        perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      3.03 ±  5%      -0.6        2.44        perf-profile.self.cycles-pp._raw_spin_lock
      2.22 ±  8%      -0.6        1.64 ±  4%  perf-profile.self.cycles-pp.fdget_pos
      2.74 ±  2%      -0.6        2.16        perf-profile.self.cycles-pp.__memcg_slab_free_hook
      1.99 ±  2%      -0.4        1.56        perf-profile.self.cycles-pp.check_heap_object
      1.96 ±  4%      -0.4        1.58        perf-profile.self.cycles-pp._copy_to_iter
      1.74 ±  5%      -0.4        1.39        perf-profile.self.cycles-pp.__slab_free
      1.85 ±  3%      -0.3        1.51        perf-profile.self.cycles-pp.unix_stream_read_generic
      1.68 ±  4%      -0.3        1.34        perf-profile.self.cycles-pp.sock_wfree
      1.07 ±  8%      -0.3        0.78        perf-profile.self.cycles-pp.sock_def_readable
      1.64 ±  2%      -0.3        1.36        perf-profile.self.cycles-pp.__alloc_skb
      1.36            -0.3        1.08        perf-profile.self.cycles-pp.kmem_cache_free
      1.01 ±  5%      -0.3        0.76 ±  2%  perf-profile.self.cycles-pp.sock_alloc_send_pskb
      0.91 ±  6%      -0.2        0.70 ±  2%  perf-profile.self.cycles-pp.skb_set_owner_w
      1.19 ±  4%      -0.2        0.99 ±  2%  perf-profile.self.cycles-pp.__memcg_slab_post_alloc_hook
      0.84 ±  5%      -0.2        0.66        perf-profile.self.cycles-pp.unix_stream_sendmsg
      0.52 ±  7%      -0.1        0.41        perf-profile.self.cycles-pp.fput
      0.56 ±  2%      -0.1        0.45 ±  2%  perf-profile.self.cycles-pp.kmem_cache_alloc_node_noprof
      0.58 ±  2%      -0.1        0.47        perf-profile.self.cycles-pp.arch_exit_to_user_mode_prepare
      0.66 ±  2%      -0.1        0.56        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.53 ±  2%      -0.1        0.43        perf-profile.self.cycles-pp.sock_write_iter
      0.60 ±  2%      -0.1        0.51 ±  2%  perf-profile.self.cycles-pp.__kmalloc_node_track_caller_noprof
      0.51 ±  3%      -0.1        0.42 ±  3%  perf-profile.self.cycles-pp.__account_obj_stock
      0.17 ± 64%      -0.1        0.08 ±  6%  perf-profile.self.cycles-pp.intel_idle
      0.49 ±  2%      -0.1        0.40        perf-profile.self.cycles-pp._copy_from_iter
      0.47 ±  2%      -0.1        0.38        perf-profile.self.cycles-pp.vfs_write
      0.39 ±  4%      -0.1        0.30 ±  3%  perf-profile.self.cycles-pp.__check_heap_object
      0.48 ±  3%      -0.1        0.40 ±  3%  perf-profile.self.cycles-pp.vfs_read
      0.52 ±  2%      -0.1        0.44 ±  2%  perf-profile.self.cycles-pp.do_syscall_64
      0.42 ±  3%      -0.1        0.34 ±  2%  perf-profile.self.cycles-pp.sock_read_iter
      0.34 ±  5%      -0.1        0.26        perf-profile.self.cycles-pp.skb_release_data
      0.31 ±  2%      -0.1        0.24 ±  2%  perf-profile.self.cycles-pp.__skb_datagram_iter
      0.35 ±  3%      -0.1        0.29        perf-profile.self.cycles-pp.entry_SYSCALL_64
      0.34 ±  4%      -0.1        0.28        perf-profile.self.cycles-pp.obj_cgroup_charge_account
      0.35 ±  3%      -0.1        0.30        perf-profile.self.cycles-pp.refill_obj_stock
      0.33 ±  3%      -0.1        0.28        perf-profile.self.cycles-pp.__check_object_size
      0.86            -0.1        0.81        perf-profile.self.cycles-pp.___slab_alloc
      0.32 ±  3%      -0.1        0.26        perf-profile.self.cycles-pp.unix_write_space
      0.28 ±  3%      -0.0        0.23 ±  3%  perf-profile.self.cycles-pp.__virt_addr_valid
      0.28 ±  3%      -0.0        0.23        perf-profile.self.cycles-pp.kfree
      0.23 ±  3%      -0.0        0.18 ±  4%  perf-profile.self.cycles-pp.sender
      0.27 ±  3%      -0.0        0.23 ±  2%  perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.24 ±  3%      -0.0        0.20 ±  2%  perf-profile.self.cycles-pp.rw_verify_area
      0.23 ±  3%      -0.0        0.19        perf-profile.self.cycles-pp.kmalloc_reserve
      0.24 ±  4%      -0.0        0.20 ±  3%  perf-profile.self.cycles-pp.mutex_lock
      0.14 ±  9%      -0.0        0.10        perf-profile.self.cycles-pp.unix_maybe_add_creds
      0.20 ±  3%      -0.0        0.16 ±  2%  perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.19 ±  3%      -0.0        0.16 ±  2%  perf-profile.self.cycles-pp.ksys_write
      0.20 ±  3%      -0.0        0.17 ±  2%  perf-profile.self.cycles-pp.mutex_unlock
      0.17 ±  2%      -0.0        0.14 ±  2%  perf-profile.self.cycles-pp.__cond_resched
      0.18 ±  3%      -0.0        0.15 ±  2%  perf-profile.self.cycles-pp.ksys_read
      0.15 ±  3%      -0.0        0.12 ±  3%  perf-profile.self.cycles-pp.alloc_skb_with_frags
      0.14 ±  3%      -0.0        0.12 ±  8%  perf-profile.self.cycles-pp.mod_memcg_lruvec_state
      0.15 ±  3%      -0.0        0.12 ±  4%  perf-profile.self.cycles-pp.skb_copy_datagram_from_iter
      0.19 ±  3%      -0.0        0.16 ±  4%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.12 ±  4%      -0.0        0.10        perf-profile.self.cycles-pp.security_file_permission
      0.16 ±  2%      -0.0        0.14 ±  5%  perf-profile.self.cycles-pp.receiver
      0.15 ±  4%      -0.0        0.13 ±  5%  perf-profile.self.cycles-pp.sock_recvmsg
      0.12 ±  4%      -0.0        0.10 ±  3%  perf-profile.self.cycles-pp.__build_skb_around
      0.13 ±  3%      -0.0        0.10 ±  4%  perf-profile.self.cycles-pp.x64_sys_call
      0.11            -0.0        0.09        perf-profile.self.cycles-pp.__scm_recv_common
      0.10 ±  7%      -0.0        0.08 ± 12%  perf-profile.self.cycles-pp.mod_memcg_state
      0.12 ±  4%      -0.0        0.10 ±  4%  perf-profile.self.cycles-pp.rcu_all_qs
      0.11 ±  4%      -0.0        0.10 ±  5%  perf-profile.self.cycles-pp.unix_stream_recvmsg
      0.08            -0.0        0.06 ±  7%  perf-profile.self.cycles-pp.try_charge_memcg
      0.10 ±  4%      -0.0        0.09 ±  5%  perf-profile.self.cycles-pp.unix_destruct_scm
      0.10 ±  5%      -0.0        0.08        perf-profile.self.cycles-pp.unix_scm_to_skb
      0.07 ±  7%      -0.0        0.05 ±  7%  perf-profile.self.cycles-pp.consume_skb
      0.08 ±  5%      -0.0        0.07        perf-profile.self.cycles-pp.manage_oob
      0.07 ±  5%      -0.0        0.06        perf-profile.self.cycles-pp.is_vmalloc_addr
      0.08 ±  4%      -0.0        0.07        perf-profile.self.cycles-pp.skb_copy_datagram_iter
      0.06            -0.0        0.05        perf-profile.self.cycles-pp.simple_copy_to_iter
      0.06            -0.0        0.05        perf-profile.self.cycles-pp.skb_release_head_state
      0.05            +0.0        0.08 ±  4%  perf-profile.self.cycles-pp.__pick_eevdf
      0.51 ±  7%      +0.3        0.86 ±  9%  perf-profile.self.cycles-pp.__switch_to
     49.64 ±  4%      +8.2       57.81        perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath



***************************************************************************************************
lkp-gnr-2sp3: 256 threads 2 sockets Intel(R) Xeon(R) 6767P  CPU @ 2.4GHz (Granite Rapids) with 256G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-gnr-2sp3/seccomp/stress-ng/60s

commit: 
  aceccac58a ("sched/fair: Enable scheduler feature NEXT_BUDDY")
  e837456fdc ("sched/fair: Reimplement NEXT_BUDDY to align with EEVDF goals")

aceccac58ad76305 e837456fdca81899a3c8e47b3fd 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      2433 ± 53%     +80.0%       4378 ±  7%  perf-c2c.DRAM.local
 9.275e+09           -67.3%  3.032e+09 ±  3%  cpuidle..time
   9467994           -49.6%    4771783        cpuidle..usage
  25228927 ±  6%     +70.5%   43014709        numa-numastat.node1.local_node
  25464109 ±  5%     +69.3%   43104569        numa-numastat.node1.numa_hit
    235041           -62.3%      88703 ± 75%  numa-numastat.node1.other_node
     58.25           -39.7       18.51 ±  5%  mpstat.cpu.all.idle%
      1.20 ±  3%      -0.4        0.76        mpstat.cpu.all.irq%
      0.33            -0.2        0.14        mpstat.cpu.all.soft%
     39.61           +40.3       79.87        mpstat.cpu.all.sys%
      0.60 ±  2%      +0.1        0.72        mpstat.cpu.all.usr%
     46.11           +89.5%      87.39        mpstat.max_utilization_pct
     54.00           -63.8%      19.55 ±  3%  perf-sched.total_wait_and_delay.average.ms
    255105          +119.8%     560626        perf-sched.total_wait_and_delay.count.ms
     53.76           -64.0%      19.33 ±  3%  perf-sched.total_wait_time.average.ms
     54.00           -63.8%      19.55 ±  3%  perf-sched.wait_and_delay.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
    255105          +119.8%     560626        perf-sched.wait_and_delay.count.[unknown].[unknown].[unknown].[unknown].[unknown]
     53.76           -64.0%      19.33 ±  3%  perf-sched.wait_time.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
    407501 ± 10%     +44.8%     590213        stress-ng.seccomp.ops
      6802 ± 10%     +44.8%       9852        stress-ng.seccomp.ops_per_sec
    747493 ± 11%    +117.2%    1623530        stress-ng.time.involuntary_context_switches
  37320759 ± 10%     +43.2%   53444648        stress-ng.time.minor_page_faults
      6879           +77.2%      12189        stress-ng.time.percent_of_cpu_this_job_got
      4096           +77.7%       7280        stress-ng.time.system_time
    667626 ±  7%    +120.0%    1468937        stress-ng.time.voluntary_context_switches
   1450070 ±  2%     +42.7%    2069587        meminfo.Active
   1450054 ±  2%     +42.7%    2069571        meminfo.Active(anon)
   4240376           +13.7%    4821922        meminfo.Cached
   8527530 ±  9%     +16.4%    9929386 ± 10%  meminfo.DirectMap2M
     97047           -12.1%      85321        meminfo.KernelStack
    285374 ± 11%     +66.3%     474505 ±  2%  meminfo.Mapped
     89256 ±  2%     +25.1%     111693 ±  2%  meminfo.PageTables
   1004920           +22.1%    1226909        meminfo.SUnreclaim
    560788 ±  5%    +103.7%    1142335        meminfo.Shmem
   1187842           +18.5%    1407902        meminfo.Slab
     49116 ±  3%     -11.6%      43412 ±  5%  numa-meminfo.node0.KernelStack
    494693           +24.2%     614481 ±  2%  numa-meminfo.node0.SUnreclaim
    593883 ±  3%     +16.2%     690125 ±  2%  numa-meminfo.node0.Slab
   1018284 ±  8%     +44.5%    1471291 ±  8%  numa-meminfo.node1.Active
   1018280 ±  8%     +44.5%    1471282 ±  8%  numa-meminfo.node1.Active(anon)
     47982 ±  4%     -12.7%      41890 ±  6%  numa-meminfo.node1.KernelStack
   4808096 ± 25%     +33.6%    6424882 ± 24%  numa-meminfo.node1.MemUsed
    510344 ±  2%     +20.0%     612484 ±  2%  numa-meminfo.node1.SUnreclaim
    536614 ±  3%     +89.2%    1015239 ± 13%  numa-meminfo.node1.Shmem
    594088 ±  3%     +20.8%     717832 ±  2%  numa-meminfo.node1.Slab
     49132 ±  3%     -11.3%      43564 ±  5%  numa-vmstat.node0.nr_kernel_stack
    123766           +24.3%     153830 ±  2%  numa-vmstat.node0.nr_slab_unreclaimable
    255432 ±  8%     +44.3%     368683 ±  9%  numa-vmstat.node1.nr_active_anon
     48087 ±  4%     -13.1%      41780 ±  6%  numa-vmstat.node1.nr_kernel_stack
    134910 ±  3%     +88.5%     254319 ± 13%  numa-vmstat.node1.nr_shmem
    127916 ±  2%     +19.8%     153180 ±  2%  numa-vmstat.node1.nr_slab_unreclaimable
    255397 ±  8%     +44.3%     368623 ±  9%  numa-vmstat.node1.nr_zone_active_anon
  25463549 ±  5%     +69.3%   43103549        numa-vmstat.node1.numa_hit
  25228367 ±  6%     +70.5%   43013689        numa-vmstat.node1.numa_local
    235041           -62.3%      88703 ± 75%  numa-vmstat.node1.numa_other
      1367 ± 11%    +113.1%       2913        turbostat.Avg_MHz
     37.98 ± 11%     +43.0       80.94        turbostat.Busy%
     62.70 ±  6%     -43.6       19.05 ±  3%  turbostat.C1%
     39.26 ± 21%     -86.7%       5.23 ± 11%  turbostat.CPU%c1
     57.50 ±  2%     +20.0%      69.00        turbostat.CoreTmp
      0.46 ±  4%      -8.4%       0.42        turbostat.IPC
     58.50           +17.7%      68.83        turbostat.PkgTmp
    350.50           +56.7%     549.25        turbostat.PkgWatt
     21.94           +14.9%      25.22        turbostat.RAMWatt
    437.25           +46.3%     639.66        turbostat.SysWatt
    363085 ±  2%     +42.7%     518239        proc-vmstat.nr_active_anon
    223943            +4.2%     233409        proc-vmstat.nr_anon_pages
   1060369           +13.7%    1205975        proc-vmstat.nr_file_pages
     97143           -12.2%      85307        proc-vmstat.nr_kernel_stack
     71709 ± 11%     +66.0%     119020 ±  2%  proc-vmstat.nr_mapped
     22477 ±  2%     +24.1%      27896 ±  2%  proc-vmstat.nr_page_table_pages
    140471 ±  5%    +103.7%     286077        proc-vmstat.nr_shmem
     45736            -1.1%      45246        proc-vmstat.nr_slab_reclaimable
    251374           +22.1%     306828        proc-vmstat.nr_slab_unreclaimable
    363083 ±  2%     +42.7%     518239        proc-vmstat.nr_zone_active_anon
     35451 ± 21%     +76.3%      62507 ± 13%  proc-vmstat.numa_hint_faults
     34858 ± 21%     +78.6%      62246 ± 13%  proc-vmstat.numa_hint_faults_local
  60847366 ± 10%     +44.3%   87826541        proc-vmstat.numa_hit
  60575546 ± 10%     +44.5%   87554442        proc-vmstat.numa_local
     35672 ± 17%    +126.5%      80786 ± 30%  proc-vmstat.numa_pte_updates
 2.876e+08 ± 10%     +44.8%  4.165e+08        proc-vmstat.pgalloc_normal
  37756340 ±  9%     +42.8%   53934362        proc-vmstat.pgfault
 2.867e+08 ± 10%     +44.9%  4.153e+08        proc-vmstat.pgfree
   1554038 ± 10%     +42.1%    2208662        proc-vmstat.pgreuse
    384720 ± 10%     +45.0%     557812        proc-vmstat.thp_fault_alloc
      1.94           -17.4%       1.60        perf-stat.i.MPKI
 4.258e+10           +82.3%  7.761e+10        perf-stat.i.branch-instructions
      0.13            -0.0        0.11        perf-stat.i.branch-miss-rate%
  53967934           +62.9%   87898801        perf-stat.i.branch-misses
     43.68            -1.4       42.26        perf-stat.i.cache-miss-rate%
 3.281e+08           +55.0%  5.087e+08        perf-stat.i.cache-misses
 7.502e+08           +60.5%  1.204e+09        perf-stat.i.cache-references
     74532           +99.6%     148773        perf-stat.i.context-switches
      2.31            +3.2%       2.38        perf-stat.i.cpi
 3.921e+11           +93.3%  7.577e+11        perf-stat.i.cpu-cycles
     10170          +176.4%      28106        perf-stat.i.cpu-migrations
      1194           +24.8%       1490        perf-stat.i.cycles-between-cache-misses
 1.697e+11           +87.7%  3.185e+11        perf-stat.i.instructions
      0.43            -3.0%       0.42        perf-stat.i.ipc
      4.33           +59.7%       6.91        perf-stat.i.metric.K/sec
    554283           +59.9%     886068        perf-stat.i.minor-faults
    554283           +59.9%     886069        perf-stat.i.page-faults
      1.93           -17.4%       1.60        perf-stat.overall.MPKI
      0.13            -0.0        0.11        perf-stat.overall.branch-miss-rate%
     43.72            -1.5       42.20        perf-stat.overall.cache-miss-rate%
      2.31            +3.0%       2.38        perf-stat.overall.cpi
      1194           +24.7%       1489        perf-stat.overall.cycles-between-cache-misses
      0.43            -2.9%       0.42        perf-stat.overall.ipc
 4.168e+10           +82.5%  7.605e+10        perf-stat.ps.branch-instructions
  52784346           +63.1%   86090729        perf-stat.ps.branch-misses
 3.211e+08           +55.2%  4.984e+08        perf-stat.ps.cache-misses
 7.346e+08           +60.8%  1.181e+09        perf-stat.ps.cache-references
     72925           +99.9%     145756        perf-stat.ps.context-switches
 3.835e+11           +93.5%  7.421e+11        perf-stat.ps.cpu-cycles
      9954          +176.4%      27513        perf-stat.ps.cpu-migrations
 1.661e+11           +87.9%  3.121e+11        perf-stat.ps.instructions
      0.56 ± 35%     +76.4%       0.99 ± 21%  perf-stat.ps.major-faults
    542548           +60.1%     868738        perf-stat.ps.minor-faults
    542549           +60.1%     868739        perf-stat.ps.page-faults
 8.466e+12 ± 20%    +125.3%  1.907e+13        perf-stat.total.instructions
    453176 ± 99%    +475.1%    2606381        sched_debug.cfs_rq:/.avg_vruntime.avg
    813145 ± 96%    +293.0%    3195619 ±  5%  sched_debug.cfs_rq:/.avg_vruntime.max
    333902 ±103%    +437.2%    1793764 ± 10%  sched_debug.cfs_rq:/.avg_vruntime.min
     36095 ± 95%    +176.0%      99628 ±  4%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      0.15 ± 75%    +252.8%       0.52 ±  5%  sched_debug.cfs_rq:/.h_nr_queued.avg
      0.14 ± 76%    +240.2%       0.48 ±  5%  sched_debug.cfs_rq:/.h_nr_runnable.avg
     58386 ±100%   +1051.7%     672427 ±  7%  sched_debug.cfs_rq:/.left_deadline.avg
    480561 ± 99%    +545.2%    3100708 ±  6%  sched_debug.cfs_rq:/.left_deadline.max
    150944 ±100%    +655.6%    1140587 ±  2%  sched_debug.cfs_rq:/.left_deadline.stddev
     58380 ±100%   +1051.7%     672392 ±  7%  sched_debug.cfs_rq:/.left_vruntime.avg
    480500 ± 99%    +545.3%    3100538 ±  6%  sched_debug.cfs_rq:/.left_vruntime.max
    150927 ±100%    +655.7%    1140527 ±  2%  sched_debug.cfs_rq:/.left_vruntime.stddev
     49538 ± 96%    +348.9%     222359 ±  7%  sched_debug.cfs_rq:/.load.avg
    127330 ± 81%    +156.9%     327090 ±  5%  sched_debug.cfs_rq:/.load.stddev
     65.61 ± 57%    +236.7%     220.88 ±  3%  sched_debug.cfs_rq:/.load_avg.avg
      1062 ±  4%     +18.2%       1255 ±  3%  sched_debug.cfs_rq:/.load_avg.max
      0.16 ± 78%    +255.8%       0.58 ±  6%  sched_debug.cfs_rq:/.nr_queued.avg
     58380 ±100%   +1051.7%     672393 ±  7%  sched_debug.cfs_rq:/.right_vruntime.avg
    480500 ± 99%    +545.3%    3100542 ±  6%  sched_debug.cfs_rq:/.right_vruntime.max
    150927 ±100%    +655.7%    1140530 ±  2%  sched_debug.cfs_rq:/.right_vruntime.stddev
    171.42 ± 52%    +144.0%     418.28 ±  2%  sched_debug.cfs_rq:/.runnable_avg.avg
    909.08 ±  7%     +45.7%       1324 ±  9%  sched_debug.cfs_rq:/.runnable_avg.max
    182.27 ± 13%     +29.4%     235.91 ±  4%  sched_debug.cfs_rq:/.runnable_avg.stddev
      0.21 ±132%    +627.8%       1.52 ± 34%  sched_debug.cfs_rq:/.spread.avg
     21.13 ±117%    +275.5%      79.33 ± 22%  sched_debug.cfs_rq:/.spread.max
      1.91 ±123%    +346.4%       8.53 ± 27%  sched_debug.cfs_rq:/.spread.stddev
    169.29 ± 51%    +142.5%     410.47 ±  2%  sched_debug.cfs_rq:/.util_avg.avg
    903.33 ±  6%     +39.1%       1256 ±  6%  sched_debug.cfs_rq:/.util_avg.max
    181.46 ± 13%     +27.0%     230.49 ±  3%  sched_debug.cfs_rq:/.util_avg.stddev
     11.69 ± 69%    +590.7%      80.76 ± 13%  sched_debug.cfs_rq:/.util_est.avg
    461.33 ± 21%     +63.6%     754.92 ± 25%  sched_debug.cfs_rq:/.util_est.max
     52.29 ± 37%    +130.9%     120.73 ± 10%  sched_debug.cfs_rq:/.util_est.stddev
    453134 ± 99%    +475.2%    2606219        sched_debug.cfs_rq:/.zero_vruntime.avg
    813104 ± 96%    +293.0%    3195602 ±  5%  sched_debug.cfs_rq:/.zero_vruntime.max
    333902 ±103%    +437.2%    1793764 ± 10%  sched_debug.cfs_rq:/.zero_vruntime.min
     36083 ± 95%    +176.1%      99618 ±  4%  sched_debug.cfs_rq:/.zero_vruntime.stddev
     23391 ±100%    +509.0%     142451 ±  6%  sched_debug.cpu.curr->pid.avg
     99875 ± 91%    +201.9%     301553        sched_debug.cpu.curr->pid.max
     39968 ± 96%    +260.0%     143897        sched_debug.cpu.curr->pid.stddev
      0.14 ± 78%    +257.1%       0.51 ±  6%  sched_debug.cpu.nr_running.avg
      6105 ± 71%    +212.8%      19098        sched_debug.cpu.nr_switches.avg
     64794 ±  6%     +17.3%      76021        sched_debug.cpu.nr_switches.max
      3003 ± 91%    +388.1%      14660 ±  5%  sched_debug.cpu.nr_switches.min
     52.83 ± 25%    +433.4%     281.83 ± 21%  sched_debug.cpu.nr_uninterruptible.max
    -36.00          +387.3%    -175.42        sched_debug.cpu.nr_uninterruptible.min
     10.79 ± 39%    +437.7%      58.04        sched_debug.cpu.nr_uninterruptible.stddev
      5.39            -3.7        1.69 ±  3%  perf-profile.calltrace.cycles-pp.bpf_prog_alloc.bpf_prog_create_from_user.seccomp_set_mode_filter.do_syscall_64.entry_SYSCALL_64_after_hwframe
      6.09            -3.6        2.49 ±  2%  perf-profile.calltrace.cycles-pp._Fork
      5.88            -3.5        2.40 ±  2%  perf-profile.calltrace.cycles-pp.__do_sys_clone.do_syscall_64.entry_SYSCALL_64_after_hwframe._Fork
      5.88            -3.5        2.40 ±  2%  perf-profile.calltrace.cycles-pp.kernel_clone.__do_sys_clone.do_syscall_64.entry_SYSCALL_64_after_hwframe._Fork
      5.89            -3.5        2.41 ±  2%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe._Fork
      5.89            -3.5        2.41 ±  2%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe._Fork
      5.58            -3.3        2.29 ±  2%  perf-profile.calltrace.cycles-pp.copy_process.kernel_clone.__do_sys_clone.do_syscall_64.entry_SYSCALL_64_after_hwframe
      5.38            -3.2        2.20 ±  2%  perf-profile.calltrace.cycles-pp.dup_mm.copy_process.kernel_clone.__do_sys_clone.do_syscall_64
      4.90 ±  2%      -2.8        2.07 ±  3%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
      4.90 ±  2%      -2.8        2.07 ±  3%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
      4.86            -2.8        2.04 ±  2%  perf-profile.calltrace.cycles-pp.dup_mmap.dup_mm.copy_process.kernel_clone.__do_sys_clone
      4.29 ±  3%      -2.5        1.80 ±  3%  perf-profile.calltrace.cycles-pp.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe
      4.29 ±  2%      -2.5        1.80 ±  3%  perf-profile.calltrace.cycles-pp.__x64_sys_exit_group.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe
      4.29 ±  2%      -2.5        1.80 ±  3%  perf-profile.calltrace.cycles-pp.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call.do_syscall_64
      4.29 ±  2%      -2.5        1.80 ±  3%  perf-profile.calltrace.cycles-pp.do_group_exit.__x64_sys_exit_group.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.96 ±  3%      -2.3        1.67 ±  3%  perf-profile.calltrace.cycles-pp.exit_mm.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
      3.95 ±  3%      -2.3        1.67 ±  3%  perf-profile.calltrace.cycles-pp.__mmput.exit_mm.do_exit.do_group_exit.__x64_sys_exit_group
      3.93 ±  3%      -2.3        1.66 ±  3%  perf-profile.calltrace.cycles-pp.exit_mmap.__mmput.exit_mm.do_exit.do_group_exit
      2.88 ±  2%      -2.0        0.90 ±  2%  perf-profile.calltrace.cycles-pp.bpf_prog_alloc_no_stats.bpf_prog_alloc.bpf_prog_create_from_user.seccomp_set_mode_filter.do_syscall_64
      2.85            -1.8        1.02        perf-profile.calltrace.cycles-pp.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      2.85            -1.7        1.12        perf-profile.calltrace.cycles-pp.anon_vma_fork.dup_mmap.dup_mm.copy_process.kernel_clone
      2.38 ±  3%      -1.7        0.68 ±  2%  perf-profile.calltrace.cycles-pp.pcpu_alloc_noprof.bpf_prog_alloc_no_stats.bpf_prog_alloc.bpf_prog_create_from_user.seccomp_set_mode_filter
      2.34            -1.6        0.70 ±  6%  perf-profile.calltrace.cycles-pp.pcpu_alloc_noprof.bpf_prog_alloc.bpf_prog_create_from_user.seccomp_set_mode_filter.do_syscall_64
      2.31            -1.4        0.90        perf-profile.calltrace.cycles-pp.anon_vma_clone.anon_vma_fork.dup_mmap.dup_mm.copy_process
      1.86            -1.1        0.74        perf-profile.calltrace.cycles-pp.free_pgtables.exit_mmap.__mmput.exit_mm.do_exit
      2.19            -1.1        1.10        perf-profile.calltrace.cycles-pp.stress_seccomp
      2.10            -1.1        1.02        perf-profile.calltrace.cycles-pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.stress_seccomp
      2.10            -1.1        1.02        perf-profile.calltrace.cycles-pp.exc_page_fault.asm_exc_page_fault.stress_seccomp
      2.10            -1.1        1.03        perf-profile.calltrace.cycles-pp.asm_exc_page_fault.stress_seccomp
      2.08            -1.1        1.02        perf-profile.calltrace.cycles-pp.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.stress_seccomp
      2.00            -1.0        0.98        perf-profile.calltrace.cycles-pp.__do_huge_pmd_anonymous_page.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault
      1.95            -1.0        0.96        perf-profile.calltrace.cycles-pp.vma_alloc_anon_folio_pmd.__do_huge_pmd_anonymous_page.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      1.89            -1.0        0.94        perf-profile.calltrace.cycles-pp.folio_zero_user.vma_alloc_anon_folio_pmd.__do_huge_pmd_anonymous_page.__handle_mm_fault.handle_mm_fault
      1.44            -0.9        0.53        perf-profile.calltrace.cycles-pp.anon_vma_interval_tree_insert.anon_vma_clone.anon_vma_fork.dup_mmap.dup_mm
      1.24 ±  8%      -0.8        0.40 ± 70%  perf-profile.calltrace.cycles-pp.unmap_page_range.unmap_vmas.exit_mmap.__mmput.exit_mm
      1.23 ±  8%      -0.8        0.39 ± 70%  perf-profile.calltrace.cycles-pp.zap_pmd_range.unmap_page_range.unmap_vmas.exit_mmap.__mmput
      1.36            -0.8        0.52        perf-profile.calltrace.cycles-pp.unlink_anon_vmas.free_pgtables.exit_mmap.__mmput.exit_mm
      1.19 ±  9%      -0.8        0.38 ± 70%  perf-profile.calltrace.cycles-pp.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_vmas.exit_mmap
      1.72            -0.8        0.90        perf-profile.calltrace.cycles-pp.clear_page_erms.folio_zero_user.vma_alloc_anon_folio_pmd.__do_huge_pmd_anonymous_page.__handle_mm_fault
      1.40 ±  7%      -0.8        0.64 ±  8%  perf-profile.calltrace.cycles-pp.unmap_vmas.exit_mmap.__mmput.exit_mm.do_exit
      4.03            -0.7        3.38        perf-profile.calltrace.cycles-pp.do_jit.bpf_int_jit_compile.bpf_prog_select_runtime.bpf_prepare_filter.bpf_prog_create_from_user
      1.81            -0.3        1.54        perf-profile.calltrace.cycles-pp.bpf_convert_filter.bpf_prepare_filter.bpf_prog_create_from_user.seccomp_set_mode_filter.do_syscall_64
     47.69            +3.6       51.29        perf-profile.calltrace.cycles-pp.syscall
     47.67            +3.6       51.27        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
     47.67            +3.6       51.27        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.syscall
     47.62            +3.6       51.25        perf-profile.calltrace.cycles-pp.seccomp_set_mode_filter.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
     47.48            +3.7       51.14        perf-profile.calltrace.cycles-pp.bpf_prog_create_from_user.seccomp_set_mode_filter.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
     42.02            +7.4       49.41        perf-profile.calltrace.cycles-pp.bpf_prepare_filter.bpf_prog_create_from_user.seccomp_set_mode_filter.do_syscall_64.entry_SYSCALL_64_after_hwframe
     33.33            +7.9       41.24        perf-profile.calltrace.cycles-pp.kthread.ret_from_fork.ret_from_fork_asm
     33.33            +7.9       41.24        perf-profile.calltrace.cycles-pp.ret_from_fork.ret_from_fork_asm
     33.33            +7.9       41.24        perf-profile.calltrace.cycles-pp.ret_from_fork_asm
     39.53            +7.9       47.45        perf-profile.calltrace.cycles-pp.bpf_prog_select_runtime.bpf_prepare_filter.bpf_prog_create_from_user.seccomp_set_mode_filter.do_syscall_64
     39.52            +7.9       47.45        perf-profile.calltrace.cycles-pp.bpf_int_jit_compile.bpf_prog_select_runtime.bpf_prepare_filter.bpf_prog_create_from_user.seccomp_set_mode_filter
     33.30            +7.9       41.23        perf-profile.calltrace.cycles-pp.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     32.86            +8.2       41.08        perf-profile.calltrace.cycles-pp.process_one_work.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     32.10            +8.7       40.78        perf-profile.calltrace.cycles-pp.bpf_jit_free.process_one_work.worker_thread.kthread.ret_from_fork
     32.10            +8.7       40.78        perf-profile.calltrace.cycles-pp.bpf_jit_binary_pack_free.bpf_jit_free.process_one_work.worker_thread.kthread
     31.91            +8.8       40.67        perf-profile.calltrace.cycles-pp.bpf_prog_pack_free.bpf_jit_binary_pack_free.bpf_jit_free.process_one_work.worker_thread
     31.45            +9.0       40.47        perf-profile.calltrace.cycles-pp.__mutex_lock.bpf_prog_pack_free.bpf_jit_binary_pack_free.bpf_jit_free.process_one_work
     34.57            +9.0       43.62        perf-profile.calltrace.cycles-pp.bpf_jit_binary_pack_alloc.bpf_int_jit_compile.bpf_prog_select_runtime.bpf_prepare_filter.bpf_prog_create_from_user
     34.45            +9.1       43.56        perf-profile.calltrace.cycles-pp.bpf_prog_pack_alloc.bpf_jit_binary_pack_alloc.bpf_int_jit_compile.bpf_prog_select_runtime.bpf_prepare_filter
     34.06            +9.2       43.31        perf-profile.calltrace.cycles-pp.__mutex_lock.bpf_prog_pack_alloc.bpf_jit_binary_pack_alloc.bpf_int_jit_compile.bpf_prog_select_runtime
     30.73            +9.3       40.00        perf-profile.calltrace.cycles-pp.osq_lock.__mutex_lock.bpf_prog_pack_free.bpf_jit_binary_pack_free.bpf_jit_free
     33.39            +9.4       42.84        perf-profile.calltrace.cycles-pp.osq_lock.__mutex_lock.bpf_prog_pack_alloc.bpf_jit_binary_pack_alloc.bpf_int_jit_compile
      5.40            -3.7        1.70 ±  3%  perf-profile.children.cycles-pp.bpf_prog_alloc
      5.22            -3.7        1.57 ±  3%  perf-profile.children.cycles-pp.pcpu_alloc_noprof
      6.10            -3.6        2.50 ±  2%  perf-profile.children.cycles-pp._Fork
      5.88            -3.5        2.40 ±  2%  perf-profile.children.cycles-pp.__do_sys_clone
      5.89            -3.5        2.41 ±  2%  perf-profile.children.cycles-pp.kernel_clone
      5.58            -3.3        2.29 ±  2%  perf-profile.children.cycles-pp.copy_process
      5.38            -3.2        2.20 ±  2%  perf-profile.children.cycles-pp.dup_mm
     58.99            -3.0       55.98        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     58.99            -3.0       55.98        perf-profile.children.cycles-pp.do_syscall_64
      4.05            -3.0        1.06        perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      4.86            -2.8        2.04 ±  2%  perf-profile.children.cycles-pp.dup_mmap
      4.61 ±  2%      -2.7        1.96 ±  3%  perf-profile.children.cycles-pp.x64_sys_call
      4.60 ±  2%      -2.6        1.95 ±  3%  perf-profile.children.cycles-pp.__x64_sys_exit_group
      4.60 ±  2%      -2.6        1.95 ±  3%  perf-profile.children.cycles-pp.do_group_exit
      4.60 ±  2%      -2.6        1.95 ±  3%  perf-profile.children.cycles-pp.do_exit
      3.59            -2.6        1.00        perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      3.16 ±  2%      -2.5        0.68 ±  2%  perf-profile.children.cycles-pp.__pi_memset
      2.63            -2.3        0.30 ±  2%  perf-profile.children.cycles-pp.do_idle
      2.63            -2.3        0.30 ±  2%  perf-profile.children.cycles-pp.common_startup_64
      2.63            -2.3        0.30 ±  2%  perf-profile.children.cycles-pp.cpu_startup_entry
      2.62            -2.3        0.30 ±  2%  perf-profile.children.cycles-pp.start_secondary
      3.97 ±  3%      -2.3        1.67 ±  3%  perf-profile.children.cycles-pp.exit_mm
      3.95 ±  3%      -2.3        1.67 ±  3%  perf-profile.children.cycles-pp.__mmput
      3.93 ±  3%      -2.3        1.66 ±  3%  perf-profile.children.cycles-pp.exit_mmap
      2.53            -2.3        0.27 ±  2%  perf-profile.children.cycles-pp.cpuidle_idle_call
      2.41            -2.2        0.26 ±  2%  perf-profile.children.cycles-pp.cpuidle_enter
      2.41            -2.2        0.26 ±  2%  perf-profile.children.cycles-pp.cpuidle_enter_state
      2.40            -2.1        0.26 ±  2%  perf-profile.children.cycles-pp.acpi_idle_enter
      2.39            -2.1        0.25 ±  2%  perf-profile.children.cycles-pp.acpi_idle_do_entry
      2.39            -2.1        0.25 ±  2%  perf-profile.children.cycles-pp.acpi_safe_halt
      2.39            -2.1        0.25 ±  2%  perf-profile.children.cycles-pp.pv_native_safe_halt
      2.88 ±  2%      -2.0        0.90        perf-profile.children.cycles-pp.bpf_prog_alloc_no_stats
      2.74            -1.9        0.82        perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      2.73            -1.9        0.82        perf-profile.children.cycles-pp.hrtimer_interrupt
      3.54            -1.8        1.74        perf-profile.children.cycles-pp.asm_exc_page_fault
      3.40            -1.8        1.64        perf-profile.children.cycles-pp.do_user_addr_fault
      3.40            -1.8        1.65        perf-profile.children.cycles-pp.exc_page_fault
      2.85            -1.7        1.12        perf-profile.children.cycles-pp.anon_vma_fork
      3.20            -1.6        1.56        perf-profile.children.cycles-pp.handle_mm_fault
      3.16            -1.6        1.54        perf-profile.children.cycles-pp.__handle_mm_fault
      2.37            -1.6        0.74        perf-profile.children.cycles-pp.__hrtimer_run_queues
      2.31            -1.6        0.72        perf-profile.children.cycles-pp.tick_nohz_handler
      2.19            -1.5        0.70        perf-profile.children.cycles-pp.update_process_times
      2.31            -1.4        0.90        perf-profile.children.cycles-pp.anon_vma_clone
      1.86            -1.1        0.74        perf-profile.children.cycles-pp.free_pgtables
      2.20            -1.1        1.11        perf-profile.children.cycles-pp.stress_seccomp
      2.00            -1.0        0.98        perf-profile.children.cycles-pp.__do_huge_pmd_anonymous_page
      1.95            -1.0        0.96        perf-profile.children.cycles-pp.vma_alloc_anon_folio_pmd
      1.91            -1.0        0.94        perf-profile.children.cycles-pp.folio_zero_user
      1.45 ±  2%      -1.0        0.49        perf-profile.children.cycles-pp.sched_tick
      1.44            -0.9        0.53        perf-profile.children.cycles-pp.anon_vma_interval_tree_insert
      1.36            -0.8        0.52        perf-profile.children.cycles-pp.unlink_anon_vmas
      1.77            -0.8        0.94        perf-profile.children.cycles-pp.clear_page_erms
      1.21            -0.8        0.43 ±  2%  perf-profile.children.cycles-pp.down_write
      1.40 ±  7%      -0.8        0.64 ±  8%  perf-profile.children.cycles-pp.unmap_vmas
      0.91            -0.8        0.15 ±  6%  perf-profile.children.cycles-pp.process_simple
      0.91            -0.8        0.15 ±  6%  perf-profile.children.cycles-pp.ordered_events__queue
      0.90            -0.8        0.15 ±  5%  perf-profile.children.cycles-pp.queue_event
      1.27            -0.7        0.57        perf-profile.children.cycles-pp.__schedule
      1.26 ±  7%      -0.7        0.57        perf-profile.children.cycles-pp.cmd_record
      1.24 ±  8%      -0.7        0.57 ±  9%  perf-profile.children.cycles-pp.unmap_page_range
      1.23 ±  8%      -0.7        0.56 ±  9%  perf-profile.children.cycles-pp.zap_pmd_range
      1.20 ±  9%      -0.7        0.54 ± 10%  perf-profile.children.cycles-pp.zap_pte_range
      4.12            -0.7        3.47        perf-profile.children.cycles-pp.do_jit
      0.79            -0.6        0.17 ±  2%  perf-profile.children.cycles-pp.__irq_exit_rcu
      0.78 ±  2%      -0.6        0.16 ±  3%  perf-profile.children.cycles-pp.handle_softirqs
      1.21            -0.6        0.60        perf-profile.children.cycles-pp.mutex_spin_on_owner
      0.92 ±  2%      -0.6        0.33 ±  3%  perf-profile.children.cycles-pp.rwsem_down_write_slowpath
      0.84            -0.6        0.26        perf-profile.children.cycles-pp._raw_spin_lock
      0.98            -0.6        0.40        perf-profile.children.cycles-pp.sched_balance_rq
      0.99            -0.5        0.46        perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      0.95            -0.5        0.43        perf-profile.children.cycles-pp.__pick_next_task
      0.94            -0.5        0.43        perf-profile.children.cycles-pp.pick_next_task_fair
      0.90            -0.5        0.39        perf-profile.children.cycles-pp.sched_balance_newidle
      0.82            -0.5        0.33        perf-profile.children.cycles-pp.update_sd_lb_stats
      0.82            -0.5        0.34        perf-profile.children.cycles-pp.sched_balance_find_src_group
      0.92            -0.5        0.44        perf-profile.children.cycles-pp.schedule
      0.83 ± 12%      -0.5        0.36 ± 13%  perf-profile.children.cycles-pp.zap_present_ptes
      0.79            -0.5        0.32        perf-profile.children.cycles-pp.update_sg_lb_stats
      0.91            -0.5        0.46        perf-profile.children.cycles-pp.perf_session__process_events
      0.91            -0.5        0.46        perf-profile.children.cycles-pp.record__finish_output
      0.91            -0.5        0.46        perf-profile.children.cycles-pp.reader__read_event
      0.77            -0.4        0.34        perf-profile.children.cycles-pp.__vmalloc_node_noprof
      0.77            -0.4        0.34        perf-profile.children.cycles-pp.__vmalloc_node_range_noprof
      0.69            -0.4        0.28        perf-profile.children.cycles-pp.bpf_jit_binary_pack_finalize
      0.77            -0.4        0.36        perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      0.65            -0.4        0.27        perf-profile.children.cycles-pp.bpf_arch_text_copy
      0.65            -0.4        0.27        perf-profile.children.cycles-pp.text_poke_copy
      0.65 ±  2%      -0.4        0.27 ±  2%  perf-profile.children.cycles-pp.__vma_start_write
      0.71 ±  3%      -0.4        0.36        perf-profile.children.cycles-pp.task_tick_fair
      0.51 ±  3%      -0.4        0.16 ±  2%  perf-profile.children.cycles-pp.mm_init
      0.51 ±  2%      -0.3        0.18 ±  4%  perf-profile.children.cycles-pp.rwsem_spin_on_owner
      0.44            -0.3        0.13 ±  3%  perf-profile.children.cycles-pp.free_percpu
      0.35 ±  2%      -0.3        0.05 ±  7%  perf-profile.children.cycles-pp.ktime_get
      0.59 ±  9%      -0.3        0.29 ± 15%  perf-profile.children.cycles-pp.copy_p4d_range
      0.59 ±  8%      -0.3        0.30 ± 14%  perf-profile.children.cycles-pp.copy_page_range
      0.50 ±  2%      -0.3        0.20 ±  2%  perf-profile.children.cycles-pp.__tlb_batch_free_encoded_pages
      0.50 ±  2%      -0.3        0.20 ±  2%  perf-profile.children.cycles-pp.free_pages_and_swap_cache
      0.57            -0.3        0.28        perf-profile.children.cycles-pp.__alloc_frozen_pages_noprof
      0.55            -0.3        0.27        perf-profile.children.cycles-pp.alloc_pages_mpol
      0.35            -0.3        0.07 ±  5%  perf-profile.children.cycles-pp.raw_spin_rq_lock_nested
      0.51            -0.3        0.23 ±  2%  perf-profile.children.cycles-pp.kmem_cache_free
      0.52 ±  2%      -0.3        0.24 ±  4%  perf-profile.children.cycles-pp.do_pte_missing
      0.52 ±  2%      -0.3        0.24 ±  2%  perf-profile.children.cycles-pp.do_read_fault
      0.50 ±  3%      -0.3        0.23 ±  3%  perf-profile.children.cycles-pp.filemap_map_pages
      1.86            -0.3        1.60        perf-profile.children.cycles-pp.bpf_convert_filter
      0.53 ±  9%      -0.3        0.26 ± 15%  perf-profile.children.cycles-pp.copy_pte_range
      0.40            -0.3        0.13        perf-profile.children.cycles-pp.__bpf_prog_free
      0.51            -0.3        0.24        perf-profile.children.cycles-pp.__text_poke
      1.12            -0.3        0.87        perf-profile.children.cycles-pp.__pi_memcpy
      0.36 ± 26%      -0.2        0.12 ±  4%  perf-profile.children.cycles-pp.handle_internal_command
      0.36 ± 26%      -0.2        0.12 ±  4%  perf-profile.children.cycles-pp.main
      0.36 ± 26%      -0.2        0.12 ±  4%  perf-profile.children.cycles-pp.run_builtin
      0.44            -0.2        0.19        perf-profile.children.cycles-pp.get_page_from_freelist
      0.42            -0.2        0.18        perf-profile.children.cycles-pp.bpf_arch_text_invalidate
      0.42            -0.2        0.18        perf-profile.children.cycles-pp.text_poke_set
      0.38            -0.2        0.14 ±  2%  perf-profile.children.cycles-pp.__get_vm_area_node
      0.29 ±  3%      -0.2        0.05 ±  8%  perf-profile.children.cycles-pp.clockevents_program_event
      0.37            -0.2        0.14        perf-profile.children.cycles-pp.alloc_vmap_area
      0.47            -0.2        0.24 ±  2%  perf-profile.children.cycles-pp.wp_page_copy
      0.38 ±  3%      -0.2        0.16 ±  4%  perf-profile.children.cycles-pp.next_uptodate_folio
      0.45 ±  4%      -0.2        0.23        perf-profile.children.cycles-pp.update_cfs_group
      0.43            -0.2        0.21        perf-profile.children.cycles-pp.bpf_prog_realloc
      0.38            -0.2        0.16 ±  2%  perf-profile.children.cycles-pp.kernel_wait4
      0.32 ± 32%      -0.2        0.10 ±  4%  perf-profile.children.cycles-pp.record__mmap_read_evlist
      0.30 ±  3%      -0.2        0.08 ±  4%  perf-profile.children.cycles-pp.tmigr_requires_handle_remote
      0.37            -0.2        0.15 ±  3%  perf-profile.children.cycles-pp.do_wait
      0.43 ±  2%      -0.2        0.21 ±  2%  perf-profile.children.cycles-pp.kmem_cache_alloc_noprof
      0.29 ±  3%      -0.2        0.08 ±  4%  perf-profile.children.cycles-pp.get_jiffies_update
      0.41 ± 13%      -0.2        0.20 ± 20%  perf-profile.children.cycles-pp.copy_present_ptes
      0.30 ± 32%      -0.2        0.10 ±  3%  perf-profile.children.cycles-pp.perf_mmap__push
      0.35            -0.2        0.14 ±  3%  perf-profile.children.cycles-pp.__anon_vma_interval_tree_remove
      0.33 ±  3%      -0.2        0.14 ±  4%  perf-profile.children.cycles-pp.folios_put_refs
      0.39            -0.2        0.20        perf-profile.children.cycles-pp.__vmalloc_area_node
      0.31            -0.2        0.12 ±  3%  perf-profile.children.cycles-pp.rmqueue
      0.30            -0.2        0.11 ±  3%  perf-profile.children.cycles-pp.wake_up_new_task
      0.30 ±  3%      -0.2        0.12 ±  3%  perf-profile.children.cycles-pp.tlb_finish_mmu
      0.30 ±  2%      -0.2        0.13 ±  2%  perf-profile.children.cycles-pp.vm_area_dup
      0.34            -0.2        0.17 ±  2%  perf-profile.children.cycles-pp.vfree
      0.24 ±  2%      -0.2        0.07        perf-profile.children.cycles-pp.__percpu_counter_init_many
      0.32            -0.2        0.15        perf-profile.children.cycles-pp._exit
      0.26            -0.2        0.09 ±  4%  perf-profile.children.cycles-pp.__cond_resched
      0.28            -0.2        0.12 ±  3%  perf-profile.children.cycles-pp.select_task_rq_fair
      0.33            -0.2        0.17 ±  2%  perf-profile.children.cycles-pp.alloc_pages_noprof
      0.28            -0.2        0.13        perf-profile.children.cycles-pp.text_poke_copy_locked
      0.20 ±  2%      -0.2        0.06 ±  9%  perf-profile.children.cycles-pp.idle_cpu
      0.21            -0.1        0.07        perf-profile.children.cycles-pp.asm_sysvec_call_function_single
      0.24            -0.1        0.10        perf-profile.children.cycles-pp.rcu_core
      0.22 ±  2%      -0.1        0.08        perf-profile.children.cycles-pp.__kmem_cache_alloc_bulk
      0.22 ±  2%      -0.1        0.08        perf-profile.children.cycles-pp.__pcs_replace_empty_main
      0.23            -0.1        0.10 ±  5%  perf-profile.children.cycles-pp.finish_task_switch
      0.22 ±  2%      -0.1        0.08        perf-profile.children.cycles-pp.do_task_dead
      0.22 ±  2%      -0.1        0.09        perf-profile.children.cycles-pp.tlb_flush_mmu
      0.22            -0.1        0.09 ±  4%  perf-profile.children.cycles-pp.rmqueue_pcplist
      0.24            -0.1        0.11        perf-profile.children.cycles-pp.remove_vm_area
      0.22            -0.1        0.09 ±  4%  perf-profile.children.cycles-pp.sched_balance_find_dst_group
      0.21            -0.1        0.08        perf-profile.children.cycles-pp.unuse_temporary_mm
      0.21            -0.1        0.08        perf-profile.children.cycles-pp.update_sg_wakeup_stats
      0.22            -0.1        0.09 ±  4%  perf-profile.children.cycles-pp.__pte_offset_map_lock
      0.23 ±  6%      -0.1        0.11 ± 19%  perf-profile.children.cycles-pp.folio_remove_rmap_ptes
      0.20 ±  2%      -0.1        0.08 ±  4%  perf-profile.children.cycles-pp.__mmdrop
      0.21            -0.1        0.09 ±  5%  perf-profile.children.cycles-pp.up_write
      0.24 ±  3%      -0.1        0.12        perf-profile.children.cycles-pp.update_load_avg
      0.20 ±  2%      -0.1        0.08 ±  5%  perf-profile.children.cycles-pp.__slab_free
      0.21            -0.1        0.09        perf-profile.children.cycles-pp.acct_collect
      0.20 ±  2%      -0.1        0.09        perf-profile.children.cycles-pp.insert_vmap_area
      0.16 ±  2%      -0.1        0.05        perf-profile.children.cycles-pp.sysvec_call_function_single
      0.22 ±  2%      -0.1        0.11        perf-profile.children.cycles-pp.__memcg_slab_free_hook
      0.13 ± 26%      -0.1        0.02 ± 99%  perf-profile.children.cycles-pp.shmem_file_write_iter
      0.18 ±  2%      -0.1        0.07 ±  5%  perf-profile.children.cycles-pp.__rmqueue_pcplist
      0.13 ±  2%      -0.1        0.02 ± 99%  perf-profile.children.cycles-pp.__rb_erase_color
      0.18            -0.1        0.08        perf-profile.children.cycles-pp.unlink_file_vma_batch_process
      0.15 ± 28%      -0.1        0.05 ±  8%  perf-profile.children.cycles-pp.ksys_write
      0.15 ± 28%      -0.1        0.05 ±  8%  perf-profile.children.cycles-pp.record__pushfn
      0.15 ± 25%      -0.1        0.05        perf-profile.children.cycles-pp.vfs_write
      0.16 ±  3%      -0.1        0.07        perf-profile.children.cycles-pp.unlink_file_vma_batch_add
      0.18 ±  2%      -0.1        0.09        perf-profile.children.cycles-pp.rcu_do_batch
      0.16 ±  3%      -0.1        0.06 ±  7%  perf-profile.children.cycles-pp.native_irq_return_iret
      0.15            -0.1        0.06        perf-profile.children.cycles-pp.unmap_single_vma
      0.14 ±  3%      -0.1        0.05        perf-profile.children.cycles-pp.mutex_unlock
      0.14 ±  3%      -0.1        0.06 ±  6%  perf-profile.children.cycles-pp.lock_vma_under_rcu
      0.13 ±  2%      -0.1        0.05 ±  7%  perf-profile.children.cycles-pp.pcpu_alloc_area
      0.19            -0.1        0.11 ±  4%  perf-profile.children.cycles-pp._find_next_zero_bit
      0.24            -0.1        0.16        perf-profile.children.cycles-pp.__mutex_unlock_slowpath
      0.15 ±  3%      -0.1        0.07        perf-profile.children.cycles-pp.__x64_sys_openat
      0.15 ±  3%      -0.1        0.07        perf-profile.children.cycles-pp.do_sys_openat2
      0.14 ±  3%      -0.1        0.07        perf-profile.children.cycles-pp.vma_interval_tree_insert_after
      0.12 ±  4%      -0.1        0.05 ±  7%  perf-profile.children.cycles-pp.update_curr
      0.13 ±  2%      -0.1        0.06        perf-profile.children.cycles-pp.find_unlink_vmap_area
      0.14 ±  2%      -0.1        0.07        perf-profile.children.cycles-pp.mas_store
      0.13            -0.1        0.06        perf-profile.children.cycles-pp.__percpu_counter_sum
      0.13            -0.1        0.06        perf-profile.children.cycles-pp.vma_alloc_folio_noprof
      0.11            -0.1        0.04 ± 44%  perf-profile.children.cycles-pp.mutex_lock
      0.12 ±  4%      -0.1        0.06        perf-profile.children.cycles-pp.switch_mm_irqs_off
      0.21            -0.1        0.15        perf-profile.children.cycles-pp.bitmap_find_next_zero_area_off
      0.10            -0.1        0.04 ± 44%  perf-profile.children.cycles-pp.path_openat
      0.16            -0.1        0.10 ±  3%  perf-profile.children.cycles-pp.try_to_wake_up
      0.25            -0.1        0.19        perf-profile.children.cycles-pp._find_next_bit
      0.10            -0.1        0.05        perf-profile.children.cycles-pp.do_filp_open
      0.10            -0.1        0.05        perf-profile.children.cycles-pp.free_frozen_page_commit
      0.08 ±  5%      -0.0        0.03 ± 70%  perf-profile.children.cycles-pp.__flush_smp_call_function_queue
      0.50            -0.0        0.45        perf-profile.children.cycles-pp.emit_mov_imm32
      0.10 ±  5%      -0.0        0.05        perf-profile.children.cycles-pp.vma_interval_tree_remove
      0.11 ±  3%      -0.0        0.07 ±  5%  perf-profile.children.cycles-pp.__wp_page_copy_user
      0.11 ±  3%      -0.0        0.07 ±  5%  perf-profile.children.cycles-pp.copy_mc_enhanced_fast_string
      0.10            -0.0        0.06        perf-profile.children.cycles-pp.__free_frozen_pages
      0.11 ±  3%      -0.0        0.07        perf-profile.children.cycles-pp.__memcg_slab_post_alloc_hook
      0.09 ±  5%      -0.0        0.05        perf-profile.children.cycles-pp.flush_tlb_mm_range
      0.09            -0.0        0.06        perf-profile.children.cycles-pp.__memcg_kmem_charge_page
      0.10            -0.0        0.07        perf-profile.children.cycles-pp.wake_up_q
      0.07 ±  5%      -0.0        0.05        perf-profile.children.cycles-pp.mas_find
      0.07 ±  7%      -0.0        0.05        perf-profile.children.cycles-pp.prep_new_page
      0.20 ±  2%      -0.0        0.19        perf-profile.children.cycles-pp.schedule_preempt_disabled
      0.06 ±  7%      -0.0        0.05        perf-profile.children.cycles-pp.kfree
      0.10 ±  3%      -0.0        0.09        perf-profile.children.cycles-pp.seccomp_attach_filter
      0.00            +0.1        0.06 ±  8%  perf-profile.children.cycles-pp.thread__find_map
      0.00            +0.1        0.06        perf-profile.children.cycles-pp.maps__put
      0.00            +0.1        0.06 ±  7%  perf-profile.children.cycles-pp.callchain_cursor_reset
      0.00            +0.1        0.09 ±  4%  perf-profile.children.cycles-pp.map_symbol__exit
      0.00            +0.2        0.17 ±  2%  perf-profile.children.cycles-pp.add_callchain_ip
      0.00            +0.2        0.17 ±  2%  perf-profile.children.cycles-pp.thread__resolve_callchain_sample
      0.00            +0.2        0.24        perf-profile.children.cycles-pp.__thread__resolve_callchain
      0.00            +0.2        0.24        perf-profile.children.cycles-pp.sample__for_each_callchain_node
      0.00            +0.3        0.26        perf-profile.children.cycles-pp.build_id__mark_dso_hit
      0.00            +0.3        0.29        perf-profile.children.cycles-pp.perf_session__deliver_event
      0.00            +0.3        0.30 ±  2%  perf-profile.children.cycles-pp.__ordered_events__flush
      0.00            +0.3        0.30 ±  2%  perf-profile.children.cycles-pp.perf_session__process_user_event
     47.70            +3.6       51.30        perf-profile.children.cycles-pp.syscall
     47.62            +3.6       51.25        perf-profile.children.cycles-pp.seccomp_set_mode_filter
     47.48            +3.7       51.14        perf-profile.children.cycles-pp.bpf_prog_create_from_user
     42.02            +7.4       49.41        perf-profile.children.cycles-pp.bpf_prepare_filter
     33.46            +7.8       41.29        perf-profile.children.cycles-pp.ret_from_fork
     33.46            +7.8       41.29        perf-profile.children.cycles-pp.ret_from_fork_asm
     33.33            +7.9       41.24        perf-profile.children.cycles-pp.kthread
     39.53            +7.9       47.45        perf-profile.children.cycles-pp.bpf_int_jit_compile
     39.53            +7.9       47.45        perf-profile.children.cycles-pp.bpf_prog_select_runtime
     33.30            +7.9       41.23        perf-profile.children.cycles-pp.worker_thread
     32.86            +8.2       41.08        perf-profile.children.cycles-pp.process_one_work
     32.10            +8.7       40.78        perf-profile.children.cycles-pp.bpf_jit_free
     32.10            +8.7       40.78        perf-profile.children.cycles-pp.bpf_jit_binary_pack_free
     31.91            +8.8       40.67        perf-profile.children.cycles-pp.bpf_prog_pack_free
     34.57            +9.0       43.62        perf-profile.children.cycles-pp.bpf_jit_binary_pack_alloc
     34.45            +9.1       43.56        perf-profile.children.cycles-pp.bpf_prog_pack_alloc
     66.72           +17.3       84.07        perf-profile.children.cycles-pp.__mutex_lock
     65.08           +18.0       83.06        perf-profile.children.cycles-pp.osq_lock
      3.05 ±  2%      -2.4        0.64 ±  2%  perf-profile.self.cycles-pp.__pi_memset
      1.41            -0.9        0.52        perf-profile.self.cycles-pp.anon_vma_interval_tree_insert
      1.72            -0.8        0.93        perf-profile.self.cycles-pp.clear_page_erms
      0.88            -0.7        0.15 ±  5%  perf-profile.self.cycles-pp.queue_event
      1.18            -0.6        0.59        perf-profile.self.cycles-pp.mutex_spin_on_owner
      0.78            -0.5        0.24        perf-profile.self.cycles-pp._raw_spin_lock
      3.22            -0.5        2.76        perf-profile.self.cycles-pp.do_jit
      0.76            -0.4        0.36        perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      0.64            -0.4        0.27 ±  3%  perf-profile.self.cycles-pp.__vma_start_write
      0.60            -0.4        0.23        perf-profile.self.cycles-pp.update_sg_lb_stats
      0.58 ± 18%      -0.3        0.24 ± 14%  perf-profile.self.cycles-pp.zap_present_ptes
      0.50 ±  2%      -0.3        0.18 ±  3%  perf-profile.self.cycles-pp.rwsem_spin_on_owner
      0.34 ±  2%      -0.3        0.05        perf-profile.self.cycles-pp.ktime_get
      0.32            -0.3        0.05        perf-profile.self.cycles-pp.pv_native_safe_halt
      1.03            -0.2        0.78        perf-profile.self.cycles-pp.__pi_memcpy
      0.90 ±  2%      -0.2        0.66 ±  6%  perf-profile.self.cycles-pp.pcpu_alloc_noprof
      0.45 ±  3%      -0.2        0.23        perf-profile.self.cycles-pp.update_cfs_group
      0.40 ± 13%      -0.2        0.18 ± 16%  perf-profile.self.cycles-pp.copy_present_ptes
      0.29 ±  3%      -0.2        0.08 ±  4%  perf-profile.self.cycles-pp.get_jiffies_update
      0.34            -0.2        0.14        perf-profile.self.cycles-pp.__anon_vma_interval_tree_remove
      0.33 ±  3%      -0.2        0.14 ±  5%  perf-profile.self.cycles-pp.next_uptodate_folio
      0.28            -0.2        0.10 ±  4%  perf-profile.self.cycles-pp.down_write
      0.28            -0.2        0.12        perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      1.29            -0.2        1.13        perf-profile.self.cycles-pp.bpf_convert_filter
      0.28            -0.2        0.12 ±  4%  perf-profile.self.cycles-pp.dup_mmap
      0.20            -0.2        0.05        perf-profile.self.cycles-pp.idle_cpu
      0.20            -0.1        0.07        perf-profile.self.cycles-pp.update_sg_wakeup_stats
      0.19 ±  2%      -0.1        0.06        perf-profile.self.cycles-pp.unuse_temporary_mm
      0.20 ±  2%      -0.1        0.08 ±  4%  perf-profile.self.cycles-pp.up_write
      0.19 ±  2%      -0.1        0.08 ±  6%  perf-profile.self.cycles-pp.unlink_anon_vmas
      0.22 ±  5%      -0.1        0.10 ± 19%  perf-profile.self.cycles-pp.folio_remove_rmap_ptes
      0.19 ±  2%      -0.1        0.08        perf-profile.self.cycles-pp.__slab_free
      0.22            -0.1        0.11        perf-profile.self.cycles-pp.anon_vma_clone
      0.20            -0.1        0.09        perf-profile.self.cycles-pp.__mutex_lock
      0.16 ±  2%      -0.1        0.06        perf-profile.self.cycles-pp.__kmem_cache_alloc_bulk
      0.17 ±  5%      -0.1        0.07 ±  7%  perf-profile.self.cycles-pp.free_pages_and_swap_cache
      0.18 ±  2%      -0.1        0.08        perf-profile.self.cycles-pp.insert_vmap_area
      0.14 ±  3%      -0.1        0.04 ± 44%  perf-profile.self.cycles-pp.mutex_unlock
      0.16 ±  3%      -0.1        0.06 ±  7%  perf-profile.self.cycles-pp.native_irq_return_iret
      0.15 ±  3%      -0.1        0.06        perf-profile.self.cycles-pp.unmap_single_vma
      0.16 ±  2%      -0.1        0.08 ±  6%  perf-profile.self.cycles-pp.__memcg_slab_free_hook
      0.14 ±  7%      -0.1        0.06 ±  9%  perf-profile.self.cycles-pp.folios_put_refs
      0.16 ±  3%      -0.1        0.08 ±  5%  perf-profile.self.cycles-pp.update_load_avg
      0.18 ±  2%      -0.1        0.11        perf-profile.self.cycles-pp._find_next_zero_bit
      0.14            -0.1        0.07        perf-profile.self.cycles-pp.vma_interval_tree_insert_after
      0.12 ±  3%      -0.1        0.06        perf-profile.self.cycles-pp.switch_mm_irqs_off
      0.11            -0.1        0.05        perf-profile.self.cycles-pp.__percpu_counter_sum
      0.09 ±  5%      -0.1        0.04 ± 44%  perf-profile.self.cycles-pp.vma_interval_tree_remove
      0.20 ±  2%      -0.0        0.15        perf-profile.self.cycles-pp._find_next_bit
      0.11 ±  3%      -0.0        0.06 ±  7%  perf-profile.self.cycles-pp.copy_mc_enhanced_fast_string
      0.09 ±  9%      -0.0        0.06        perf-profile.self.cycles-pp.zap_pte_range
      0.42            -0.0        0.39        perf-profile.self.cycles-pp.emit_mov_imm32
      0.08            -0.0        0.06 ±  6%  perf-profile.self.cycles-pp.kmem_cache_alloc_noprof
      0.09 ±  4%      -0.0        0.07        perf-profile.self.cycles-pp.stress_seccomp
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.maps__put
     63.82           +18.5       82.33        perf-profile.self.cycles-pp.osq_lock



***************************************************************************************************
lkp-srf-2sp3: 192 threads 2 sockets Intel(R) Xeon(R) 6740E  CPU @ 2.4GHz (Sierra Forest) with 256G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-srf-2sp3/vma/stress-ng/60s

commit: 
  aceccac58a ("sched/fair: Enable scheduler feature NEXT_BUDDY")
  e837456fdc ("sched/fair: Reimplement NEXT_BUDDY to align with EEVDF goals")

aceccac58ad76305 e837456fdca81899a3c8e47b3fd 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    288249 ± 15%     +27.6%     367792 ±  9%  meminfo.Mapped
      6.54            -1.6        4.90        mpstat.cpu.all.usr%
  35125479 ±  3%     -12.6%   30697797 ± 12%  turbostat.IRQ
  60374783 ±  4%    +181.8%  1.701e+08        numa-numastat.node0.local_node
  60448608 ±  4%    +181.6%  1.702e+08        numa-numastat.node0.numa_hit
  49927302 ±  4%    +209.7%  1.546e+08        numa-numastat.node1.local_node
  50057121 ±  4%    +209.1%  1.547e+08        numa-numastat.node1.numa_hit
    145789 ± 23%     +22.7%     178841 ±  2%  numa-meminfo.node0.KernelStack
      7424 ± 16%     +20.6%       8953        numa-meminfo.node0.Mlocked
    115106 ± 29%     +21.8%     140197 ±  5%  numa-meminfo.node0.PageTables
     84445 ± 40%     -37.8%      52496 ±  9%  numa-meminfo.node1.KernelStack
      5231 ± 24%     -28.9%       3717 ±  4%  numa-meminfo.node1.Mlocked
     56823 ± 66%     -44.4%      31571 ±  7%  numa-meminfo.node1.PageTables
    357187 ± 15%     -19.8%     286431 ±  2%  numa-meminfo.node1.SUnreclaim
    435547 ±  9%     -17.5%     359382 ±  4%  numa-meminfo.node1.Slab
    145452 ± 23%     +21.7%     176995 ±  2%  numa-vmstat.node0.nr_kernel_stack
      1849 ± 16%     +19.9%       2216        numa-vmstat.node0.nr_mlock
  60473892 ±  4%    +181.5%  1.702e+08        numa-vmstat.node0.numa_hit
  60400068 ±  4%    +181.7%  1.701e+08        numa-vmstat.node0.numa_local
     83995 ± 41%     -37.9%      52188 ±  9%  numa-vmstat.node1.nr_kernel_stack
      1301 ± 24%     -29.0%     924.28 ±  3%  numa-vmstat.node1.nr_mlock
     14126 ± 66%     -44.6%       7832 ±  7%  numa-vmstat.node1.nr_page_table_pages
     89064 ± 14%     -19.7%      71511 ±  2%  numa-vmstat.node1.nr_slab_unreclaimable
  50071573 ±  4%    +209.1%  1.548e+08        numa-vmstat.node1.numa_hit
  49941755 ±  4%    +209.7%  1.547e+08        numa-vmstat.node1.numa_local
     71626 ± 16%     +28.2%      91801 ±  8%  proc-vmstat.nr_mapped
    205237            -2.3%     200558        proc-vmstat.nr_slab_unreclaimable
 1.105e+08          +194.0%  3.249e+08        proc-vmstat.numa_hit
 1.103e+08          +194.3%  3.246e+08        proc-vmstat.numa_local
   1442055           +22.8%    1770229        proc-vmstat.pgactivate
 1.121e+08          +190.9%  3.261e+08        proc-vmstat.pgalloc_normal
  42259716           -13.0%   36783940        proc-vmstat.pgfault
 1.108e+08          +193.1%  3.248e+08        proc-vmstat.pgfree
  19630909           -13.4%   17004560        proc-vmstat.unevictable_pgs_culled
  19645179           -13.4%   17017567        proc-vmstat.unevictable_pgs_mlocked
  19644094           -13.4%   17016848        proc-vmstat.unevictable_pgs_munlocked
  19629794           -13.4%   17003815        proc-vmstat.unevictable_pgs_rescued
   9642339           +16.1%   11197296        sched_debug.cfs_rq:/.avg_vruntime.max
   1518279 ±  5%     +71.1%    2598133 ±  2%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      5979 ± 18%     -56.9%       2579 ± 61%  sched_debug.cfs_rq:/.util_est.max
    885.32 ± 18%     -56.0%     389.20 ± 56%  sched_debug.cfs_rq:/.util_est.stddev
   9640918           +16.1%   11194743        sched_debug.cfs_rq:/.zero_vruntime.max
   1518592 ±  5%     +71.1%    2598610 ±  2%  sched_debug.cfs_rq:/.zero_vruntime.stddev
      8973 ± 63%     -51.8%       4325 ± 11%  sched_debug.cpu.avg_idle.min
     20173 ±  5%     +93.0%      38930 ±  2%  sched_debug.cpu.nr_switches.avg
     16636          +100.1%      33287        sched_debug.cpu.nr_switches.min
    702.75 ± 15%     -56.9%     302.58 ± 22%  sched_debug.cpu.nr_uninterruptible.max
   -613.25           -53.9%    -282.75        sched_debug.cpu.nr_uninterruptible.min
    210.30 ±  3%     -55.5%      93.51 ±  8%  sched_debug.cpu.nr_uninterruptible.stddev
   3877245 ±  2%     +79.1%    6943839        stress-ng.time.involuntary_context_switches
  41798251           -13.3%   36256650        stress-ng.time.minor_page_faults
     10725            +2.1%      10946        stress-ng.time.system_time
    760.57           -25.8%     564.01        stress-ng.time.user_time
   2942653 ±  3%    +142.6%    7139013 ±  3%  stress-ng.time.voluntary_context_switches
   7939558 ±  2%     -61.1%    3091890        stress-ng.vma.accesses_per_second
      2828           -31.7%       1931        stress-ng.vma.madvices_per_second
    926.46          +349.2%       4161        stress-ng.vma.mincore_per_second
      2356           -33.4%       1569        stress-ng.vma.mlocks_per_second
      6047           -18.5%       4930        stress-ng.vma.mmaps_per_second
      2199           -34.4%       1443        stress-ng.vma.mprotect_per_second
      2448          +372.5%      11570        stress-ng.vma.msync_per_second
     14402           -46.8%       7656        stress-ng.vma.munlocks_per_second
     71972           -37.2%      45164        stress-ng.vma.munmaps_per_second
  71019247           -15.7%   59904512        stress-ng.vma.ops
   1182343           -15.7%     997255        stress-ng.vma.ops_per_sec
     11977          +346.3%      53459        stress-ng.vma.pagemap-scans_per_second
      0.31            +0.1        0.37        perf-stat.i.branch-miss-rate%
 1.848e+08           +18.6%  2.192e+08        perf-stat.i.branch-misses
     20.01 ±  4%      +4.6       24.60 ±  2%  perf-stat.i.cache-miss-rate%
 1.498e+08 ±  2%     -22.6%  1.159e+08 ±  3%  perf-stat.i.cache-references
    117706 ±  4%    +100.5%     235995        perf-stat.i.context-switches
      2.11            -1.0%       2.09        perf-stat.i.cpi
     17637           -27.4%      12808 ±  4%  perf-stat.i.cpu-migrations
 2.867e+11            +1.0%  2.896e+11        perf-stat.i.instructions
     37.05            +2.8%      38.07        perf-stat.i.metric.K/sec
     41207           -14.9%      35074 ±  2%  perf-stat.i.minor-faults
      0.31            +0.1        0.37        perf-stat.overall.branch-miss-rate%
     20.08 ±  4%      +4.5       24.56 ±  3%  perf-stat.overall.cache-miss-rate%
      2.11            -1.0%       2.09        perf-stat.overall.cpi
      0.47            +1.0%       0.48        perf-stat.overall.ipc
  1.81e+08           +18.6%  2.147e+08        perf-stat.ps.branch-misses
 1.462e+08 ±  2%     -22.4%  1.135e+08 ±  3%  perf-stat.ps.cache-references
    114871 ±  4%    +100.7%     230499        perf-stat.ps.context-switches
     17112           -27.8%      12346 ±  4%  perf-stat.ps.cpu-migrations
     39527           -15.0%      33599 ±  2%  perf-stat.ps.minor-faults
      3.58 ± 44%      +1.6        5.20 ± 13%  perf-profile.calltrace.cycles-pp.seq_read_iter.seq_read.vfs_read.ksys_read.do_syscall_64
      3.58 ± 44%      +1.6        5.20 ± 13%  perf-profile.calltrace.cycles-pp.seq_read.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.61 ± 44%      +1.9        5.50 ± 23%  perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.59 ± 44%      +1.9        5.48 ± 23%  perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.05 ± 45%      +0.0        0.10 ± 11%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.00            +0.1        0.07 ± 30%  perf-profile.children.cycles-pp.fdget
      0.13 ± 44%      +0.1        0.20 ± 36%  perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.00            +0.1        0.11 ± 60%  perf-profile.children.cycles-pp.kfree
      0.12 ± 44%      +0.1        0.24        perf-profile.children.cycles-pp.down_read
      0.07 ± 45%      +0.1        0.19 ± 98%  perf-profile.children.cycles-pp.schedule
      0.00            +0.2        0.16 ±155%  perf-profile.children.cycles-pp.rmqueue
      0.00            +0.2        0.20 ± 90%  perf-profile.children.cycles-pp.__check_object_size
      0.00            +0.2        0.23 ±174%  perf-profile.children.cycles-pp.__pick_next_task
      0.06 ± 45%      +0.2        0.30 ±  8%  perf-profile.children.cycles-pp.get_free_pages_noprof
      0.07 ± 45%      +0.3        0.35 ±142%  perf-profile.children.cycles-pp.__cond_resched
      0.05 ± 44%      +0.3        0.36 ±154%  perf-profile.children.cycles-pp.get_page_from_freelist
      0.07 ± 45%      +0.3        0.38 ± 41%  perf-profile.children.cycles-pp.alloc_pages_noprof
      0.06 ± 45%      +0.3        0.38 ±141%  perf-profile.children.cycles-pp.__alloc_frozen_pages_noprof
      0.08 ± 44%      +0.4        0.42 ±123%  perf-profile.children.cycles-pp.alloc_pages_mpol
      0.07 ± 45%      +0.5        0.57 ±177%  perf-profile.children.cycles-pp.__schedule
      3.58 ± 44%      +1.6        5.20 ± 13%  perf-profile.children.cycles-pp.seq_read
      3.58 ± 44%      +1.8        5.41 ± 21%  perf-profile.children.cycles-pp.seq_read_iter
      3.59 ± 44%      +1.9        5.48 ± 23%  perf-profile.children.cycles-pp.vfs_read
      3.61 ± 44%      +1.9        5.51 ± 23%  perf-profile.children.cycles-pp.ksys_read
      0.05 ± 45%      +0.0        0.10 ± 11%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.10 ± 44%      +0.1        0.17 ± 52%  perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.00            +0.1        0.07 ± 30%  perf-profile.self.cycles-pp.fdget
      0.00            +0.1        0.08 ± 23%  perf-profile.self.cycles-pp.kfree
      0.05 ± 45%      +0.1        0.13 ± 81%  perf-profile.self.cycles-pp.__cond_resched
      0.04 ± 44%      +0.2        0.19 ± 11%  perf-profile.self.cycles-pp.down_read
      0.09 ± 44%      +0.3        0.38 ± 30%  perf-profile.self.cycles-pp.up_read
      0.16 ± 44%      +0.3        0.47 ±118%  perf-profile.self.cycles-pp._raw_spin_lock



***************************************************************************************************
lkp-gnr-2sp4: 256 threads 2 sockets Intel(R) Xeon(R) 6768P  CPU @ 2.4GHz (Granite Rapids) with 64G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-gnr-2sp4/clock/stress-ng/60s

commit: 
  aceccac58a ("sched/fair: Enable scheduler feature NEXT_BUDDY")
  e837456fdc ("sched/fair: Reimplement NEXT_BUDDY to align with EEVDF goals")

aceccac58ad76305 e837456fdca81899a3c8e47b3fd 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 1.032e+09 ±  3%     +28.0%  1.321e+09 ±  2%  cpuidle..time
    897841 ±  5%     -15.0%     763285 ±  7%  numa-numastat.node0.local_node
    896471 ±  5%     -14.8%     763770 ±  7%  numa-vmstat.node0.numa_local
     45743            +1.1%      46225        proc-vmstat.nr_kernel_stack
      5.60            +2.0        7.57        mpstat.cpu.all.idle%
      0.77 ±  3%      +0.1        0.90        mpstat.cpu.all.irq%
     59739 ±  2%     -11.1%      53102 ±  4%  perf-c2c.HITM.local
     17302 ±  2%      -9.8%      15614 ±  3%  perf-c2c.HITM.remote
     77041 ±  2%     -10.8%      68716 ±  3%  perf-c2c.HITM.total
   5452857            -3.4%    5269019        stress-ng.clock.ops
     90934            -3.4%      87863        stress-ng.clock.ops_per_sec
     84662           +20.6%     102102 ±  3%  stress-ng.time.involuntary_context_switches
     24199            -2.3%      23648        stress-ng.time.percent_of_cpu_this_job_got
     14530            -2.3%      14199        stress-ng.time.system_time
      0.30 ± 44%      +0.1        0.40        turbostat.C1%
      0.95 ± 44%      +0.4        1.34 ±  3%  turbostat.C1E%
      2.01 ± 44%      +2.2        4.17 ±  3%  turbostat.C6%
      0.36 ± 44%    +121.2%       0.80 ±  4%  turbostat.CPU%c1
      2.07 ± 48%     +62.7%       3.37 ±  2%  turbostat.CPU%c6
     75763           -10.4%      67848        sched_debug.cfs_rq:/.avg_vruntime.avg
     33867 ±  4%     -15.8%      28530 ±  7%  sched_debug.cfs_rq:/.avg_vruntime.min
     75459           -10.4%      67579        sched_debug.cfs_rq:/.zero_vruntime.avg
     33783 ±  4%     -16.3%      28291 ±  7%  sched_debug.cfs_rq:/.zero_vruntime.min
    110597 ± 16%     +41.9%     156958 ± 12%  sched_debug.cpu.max_idle_balance_cost.stddev
    -36.17           -30.4%     -25.17        sched_debug.cpu.nr_uninterruptible.min
     14.46 ±  6%     -20.0%      11.57 ± 10%  sched_debug.cpu.nr_uninterruptible.stddev
 4.239e+10            -2.3%   4.14e+10        perf-stat.i.branch-instructions
      0.08            +0.0        0.08        perf-stat.i.branch-miss-rate%
  33247700            +2.5%   34067265        perf-stat.i.branch-misses
     28.18            -0.8       27.42        perf-stat.i.cache-miss-rate%
  90091009            -3.5%   86913480        perf-stat.i.cache-misses
 3.205e+08            -1.0%  3.175e+08        perf-stat.i.cache-references
 8.768e+11            -2.2%  8.572e+11        perf-stat.i.cpu-cycles
      1621            -8.3%       1486        perf-stat.i.cpu-migrations
      9765            +1.6%       9920        perf-stat.i.cycles-between-cache-misses
 2.121e+11            -2.4%   2.07e+11        perf-stat.i.instructions
      0.42            -1.2%       0.42        perf-stat.overall.MPKI
      0.08            +0.0        0.08        perf-stat.overall.branch-miss-rate%
     28.11            -0.7       27.37        perf-stat.overall.cache-miss-rate%
      9732            +1.4%       9867        perf-stat.overall.cycles-between-cache-misses
 4.168e+10            -2.3%   4.07e+10        perf-stat.ps.branch-instructions
  32683973            +2.4%   33483421        perf-stat.ps.branch-misses
  88576640            -3.6%   85423812        perf-stat.ps.cache-misses
 3.151e+08            -0.9%  3.121e+08        perf-stat.ps.cache-references
  8.62e+11            -2.2%  8.429e+11        perf-stat.ps.cpu-cycles
      1594            -8.2%       1463        perf-stat.ps.cpu-migrations
 2.085e+11            -2.4%  2.036e+11        perf-stat.ps.instructions
 1.262e+13            -2.3%  1.233e+13        perf-stat.total.instructions



***************************************************************************************************
lkp-csl-2sp7: 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz (Cascade Lake) with 512G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/need_x/option_a/option_b/rootfs/tbox_group/test/testcase:
  gcc-14/performance/x86_64-rhel-9.4/true/5/1080p/debian-12-x86_64-phoronix/lkp-csl-2sp7/quadray-1.0.0/pts

commit: 
  aceccac58a ("sched/fair: Enable scheduler feature NEXT_BUDDY")
  e837456fdc ("sched/fair: Reimplement NEXT_BUDDY to align with EEVDF goals")

aceccac58ad76305 e837456fdca81899a3c8e47b3fd 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
  15179434 ± 18%     +51.8%   23046485 ± 15%  meminfo.DirectMap2M
      0.37            +0.0        0.41        mpstat.cpu.all.sys%
   1055135 ± 31%     -53.4%     492047 ± 91%  numa-meminfo.node0.Shmem
    263798 ± 31%     -53.4%     122995 ± 91%  numa-vmstat.node0.nr_shmem
     21104            +9.2%      23039        vmstat.system.cs
    371194            +1.8%     378021        proc-vmstat.nr_shmem
      4628            +2.9%       4762        proc-vmstat.numa_huge_pte_updates
     18161 ±  6%     +22.2%      22195 ± 11%  sched_debug.cfs_rq:/system.slice.avg_vruntime.stddev
     18051 ±  6%     +22.4%      22090 ± 11%  sched_debug.cfs_rq:/system.slice.zero_vruntime.stddev
     16231           +11.2%      18053        sched_debug.cpu.nr_switches.avg
      6.26 ± 10%     -19.7%       5.03 ± 10%  sched_debug.cpu.nr_uninterruptible.stddev
     39.69 ±  2%     +23.2%      48.89        pts.quadray.1.1080p.fps
      3245            +2.4%       3323        pts.time.percent_of_cpu_this_job_got
     39.97 ±  2%     +14.1%      45.62        pts.time.system_time
      4456            +2.2%       4555        pts.time.user_time
   1290701            +9.9%    1419060        pts.time.voluntary_context_switches
  6.13e+09            +2.8%  6.299e+09        perf-stat.i.branch-instructions
     21517            +9.0%      23449        perf-stat.i.context-switches
 6.949e+10            +2.3%  7.108e+10        perf-stat.i.cpu-cycles
    203.07            +7.8%     218.95        perf-stat.i.cpu-migrations
      8980 ±  2%      -7.8%       8279        perf-stat.i.cycles-between-cache-misses
 2.515e+10            +2.9%  2.589e+10        perf-stat.i.dTLB-loads
  8.21e+09            +2.7%  8.429e+09        perf-stat.i.dTLB-stores
 6.904e+10            +2.9%  7.102e+10        perf-stat.i.instructions
      0.72            +2.3%       0.74        perf-stat.i.metric.GHz
    514.91 ±  2%      -9.4%     466.42 ±  5%  perf-stat.i.metric.K/sec
    412.78            +2.9%     424.58        perf-stat.i.metric.M/sec
    372305 ±  2%     +20.8%     449603 ±  5%  perf-stat.i.node-store-misses
      1.81            -0.0        1.77        perf-stat.overall.branch-miss-rate%
     57.23 ±  2%      +4.3       61.51 ±  3%  perf-stat.overall.node-store-miss-rate%
 6.085e+09            +2.8%  6.254e+09        perf-stat.ps.branch-instructions
     21348            +9.0%      23273        perf-stat.ps.context-switches
   6.9e+10            +2.3%  7.059e+10        perf-stat.ps.cpu-cycles
    201.61            +7.8%     217.38        perf-stat.ps.cpu-migrations
 2.498e+10            +2.9%  2.571e+10        perf-stat.ps.dTLB-loads
 8.154e+09            +2.7%  8.373e+09        perf-stat.ps.dTLB-stores
 6.855e+10            +2.9%  7.053e+10        perf-stat.ps.instructions
    369608 ±  2%     +20.8%     446351 ±  5%  perf-stat.ps.node-store-misses
 9.519e+12            +3.0%  9.803e+12        perf-stat.total.instructions
      0.00 ±223%   +1490.9%       0.03 ±109%  perf-sched.sch_delay.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.01 ±  9%     -94.7%       0.00 ±111%  perf-sched.sch_delay.avg.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap.drm_gem_fb_vunmap.drm_atomic_helper_commit_planes
      0.06 ± 21%     -86.5%       0.01 ± 17%  perf-sched.sch_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.__x64_sys_nanosleep.do_syscall_64
      0.12 ± 31%     -89.2%       0.01 ± 68%  perf-sched.sch_delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
      0.06 ± 67%     -67.6%       0.02 ± 40%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.03 ±  2%     -36.3%       0.02 ±  3%  perf-sched.sch_delay.avg.ms.futex_do_wait.__futex_wait.futex_wait.do_futex
      0.21 ± 12%     -87.8%       0.03 ±  7%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
      0.05 ± 14%     -78.5%       0.01 ± 14%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.do_epoll_pwait.part
      0.03 ± 43%     -70.0%       0.01 ±  9%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_poll
      0.22 ± 56%     -94.6%       0.01 ± 41%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_select
      0.02 ± 27%     -54.8%       0.01 ±  6%  perf-sched.sch_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      0.00 ±223%   +3636.4%       0.07 ±169%  perf-sched.sch_delay.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1.11 ± 92%     -98.3%       0.02 ± 11%  perf-sched.sch_delay.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      2.06 ±  6%     -98.4%       0.03 ± 15%  perf-sched.sch_delay.max.ms.do_nanosleep.hrtimer_nanosleep.__x64_sys_nanosleep.do_syscall_64
      3.22 ±  4%     -63.6%       1.17 ± 98%  perf-sched.sch_delay.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
      0.67 ±129%    +808.5%       6.12 ± 52%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.00 ±223%   +4066.7%       0.04 ±153%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
      0.02 ± 32%    +715.6%       0.12 ±149%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
      2.22 ± 14%     -43.5%       1.25 ± 30%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.do_epoll_pwait.part
      1.84 ± 48%     -91.5%       0.16 ±169%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_poll
      1.68 ± 55%     -94.8%       0.09 ±164%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_select
      0.35 ±130%     -93.5%       0.02 ± 25%  perf-sched.sch_delay.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      1.34 ± 35%     -97.2%       0.04 ± 48%  perf-sched.sch_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      0.03 ±  3%     -37.6%       0.02 ±  3%  perf-sched.total_sch_delay.average.ms
      8.33 ±  4%     -18.9%       6.76 ±  3%  perf-sched.total_wait_and_delay.average.ms
    162856           +20.3%     195924        perf-sched.total_wait_and_delay.count.ms
      8.30 ±  4%     -18.8%       6.74 ±  3%  perf-sched.total_wait_time.average.ms
    213.84 ± 51%     -87.7%      26.25 ± 77%  perf-sched.wait_and_delay.avg.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
     15.84 ±  2%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap.drm_gem_fb_vunmap.drm_atomic_helper_commit_planes
    800.53           -15.3%     677.82 ± 13%  perf-sched.wait_and_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      2.37 ±  2%     -21.9%       1.85        perf-sched.wait_and_delay.avg.ms.futex_do_wait.__futex_wait.futex_wait.do_futex
      1.38 ±  9%     -51.8%       0.67 ± 42%  perf-sched.wait_and_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
     38.24 ±  7%     -12.2%      33.58 ±  7%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
     61.60 ±  3%     -24.2%      46.70 ±  2%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_poll
     13.33 ± 24%    +217.5%      42.33 ±  9%  perf-sched.wait_and_delay.count.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      0.33 ±141%   +5300.0%      18.00 ± 12%  perf-sched.wait_and_delay.count.__cond_resched.mutex_lock.perf_poll.do_poll.constprop
    196.50 ±  2%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.ww_mutex_lock.drm_gem_vunmap.drm_gem_fb_vunmap.drm_atomic_helper_commit_planes
    152066 ±  2%     +19.5%     181763        perf-sched.wait_and_delay.count.futex_do_wait.__futex_wait.futex_wait.do_futex
      1290 ±  6%     +27.7%       1647 ± 12%  perf-sched.wait_and_delay.count.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
    272.83           +16.9%     319.00 ±  2%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
    238.33 ±  4%     +24.8%     297.33        perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_poll
      2356 ± 47%     -66.5%     788.64 ± 92%  perf-sched.wait_and_delay.max.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
     44.95 ±147%   +2131.0%       1002 ± 69%  perf-sched.wait_and_delay.max.ms.__cond_resched.mutex_lock.perf_poll.do_poll.constprop
     59.34 ± 41%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap.drm_gem_fb_vunmap.drm_atomic_helper_commit_planes
      0.01 ±146%  +30486.1%       1.84 ± 31%  perf-sched.wait_time.avg.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
    213.84 ± 51%     -87.7%      26.25 ± 77%  perf-sched.wait_time.avg.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
     15.82 ±  2%     -96.0%       0.63 ± 66%  perf-sched.wait_time.avg.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap.drm_gem_fb_vunmap.drm_atomic_helper_commit_planes
    800.27           -15.3%     677.81 ± 13%  perf-sched.wait_time.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.61 ±  5%     +15.0%       0.70 ±  7%  perf-sched.wait_time.avg.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.34 ±  2%     -21.8%       1.83        perf-sched.wait_time.avg.ms.futex_do_wait.__futex_wait.futex_wait.do_futex
      1.05 ±  2%    +199.9%       3.15        perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      0.11 ± 17%   +1066.9%       1.23 ± 12%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
      0.47 ± 38%    +148.3%       1.17 ± 30%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
     38.23 ±  7%     -12.2%      33.58 ±  7%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
     61.57 ±  3%     -24.2%      46.69 ±  2%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_poll
      0.00 ± 49%   +5108.3%       0.10 ± 73%  perf-sched.wait_time.avg.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
      0.01 ±142%  +28030.6%       2.30 ± 23%  perf-sched.wait_time.max.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
      2356 ± 47%     -66.5%     788.64 ± 92%  perf-sched.wait_time.max.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
     45.07 ±146%   +2125.3%       1002 ± 69%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock.perf_poll.do_poll.constprop
     11.69 ±  6%     -17.3%       9.67 ±  9%  perf-sched.wait_time.max.ms.do_nanosleep.hrtimer_nanosleep.__x64_sys_nanosleep.do_syscall_64
    237.73 ±143%    +561.4%       1572 ± 61%  perf-sched.wait_time.max.ms.futex_do_wait.__futex_wait.futex_wait.do_futex
      3.69 ±  4%   +1614.4%      63.33 ± 48%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
      3.90 ± 26%    +959.8%      41.38 ±100%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
      0.04 ± 50%   +5947.9%       2.19 ± 52%  perf-sched.wait_time.max.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open





Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

