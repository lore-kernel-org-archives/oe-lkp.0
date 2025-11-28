Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323502D3A7B
	for <oe-lkp@lists.linux.dev>; Fri, 28 Nov 2025 06:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764313014; cv=fail; b=cWs1CN/++Ali6Zrbn4/ZYYyiFXXYXqhZ+4X0UIcBEgm2HrkGYqUUtWUuX5r1S3bsG5jl9w8WTQDYXCwN82z09zTmel3wUJqC/GFTGaBA6eJVWDLlgISDSquktsu+C/c8ajYa6qanf5On01JJpwMnjBlFj5p5t3U1Y5tmf9Nz+Lc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764313014; c=relaxed/simple;
	bh=XAMa/jD1phRChUkXbFg12z/HcT/Ix6PTCJVUtZ+yokM=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=WGAbckg3TpeFOqsvPA6o1DmRMAHwg8JLs8c3iIWyvaAVVsZUdkZxiCbP7fksI3yYksRVxWmy1l4iBa4Djdmhq6RhryHUiJpIVggqFdfix9+xKEUbFGT/vS0kox6C9o4j6/HUYzauvJz7T8qqRYJOgdBDLDxxnOHFQ+CRr3JnMJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=URU0IJdW; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="URU0IJdW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764313013; x=1795849013;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=XAMa/jD1phRChUkXbFg12z/HcT/Ix6PTCJVUtZ+yokM=;
  b=URU0IJdWlQB9R6ggb3tkoB1CwyTG8qBEhVu1DUaT3zy5YZtGS6baKIkJ
   hd5hP8lTmi5YYZfx5F6MPqV6uTP43s+87sPWsunAZdHETYPBX53+ECv8N
   wVfE5TRLCR473XB7dC/JTk1rpP/fDmfOVtNHhgVgJiVD3mS2iXB8Ad/z7
   J+3iO1l+97DDPOBKvWZ70jw+bgeZ5MYmRDaWs3gkz9kVDori5raBFft1p
   jZZZOdw4J8Wk9sNYSFELKaCEKQQ4C3ohWruUR/Itl/VzyoEubrJQBa6Zt
   cENmJmU3lM8JLiNaraHvveXsfgBvvgSIGpgB4dZTkW4wBnI98pAlRh+W5
   g==;
X-CSE-ConnectionGUID: TIdTZMVSS4CBvJrozJ6RfA==
X-CSE-MsgGUID: ewBwAbcJQ3mINs6GtQzLXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="77033696"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="77033696"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 22:56:53 -0800
X-CSE-ConnectionGUID: lkIkjEP+T420vqQl3r6LRg==
X-CSE-MsgGUID: p7O7ybuvTeCzX+VnoHucwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="197719810"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 22:56:52 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 22:56:51 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 27 Nov 2025 22:56:51 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.24) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 22:56:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=np748JJ4jcUxE+xWgiSrZkswnIJSw/ElFtqHc6IfD1rcMw547zD43uTGpoQ3xlLZMxJLlwQLe++xNFqg1ieBf5RrLwF/nNIgOL6DE0zfr10cOfgzjOR3grUSUf0hF5OthRlGN4HoELIZBLz1eq5YvGcPHuvSOdHNf3upBSX1+1s8ZUh/xKCRfXGin/o1Y+bLZdCzNTtT4hrVC+lN9iOXZehfSQjjuYlmOQrPknfKS59ssPXJ0vmLlUCwYAULPHR8UzMwoRLWl8nOx+NoEOwh1f/Tjn8Rj5MdFE84UugEsZdp2yHslWb/s1w1581T2WWG7C89UhrmGnjlQEeQ8++V8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mz40c2wC3/9dTmMcXydkvy3EIs5tpFFUct0mjnVfM1Y=;
 b=WwGNnMaqI7OSbEbfpBN+0QAhCY7FVGkk2v0T+g7lSo8bO8EME5fC/dLBaGaJSJT5V4abgddmpMIvvb9BSiJn4texk3kPy1UMfvPelm6qFIvP8rRnOQjpnCLex+gP+g1Iu/m5fvO/ISIeltKJ26XjvntkqAWtCLKPeaQoWi1Rkhhu/Irc3NsastR3dordMsXKM8/wp1KsJ3pxOPy6Uzq+B6FeUpqejKzHVqWp1trRgNAn1DVdHzie6h519HFm7x5gZLT9DYbCT9Y1xMLTSKmIUOiBGBFePhYSyjTLsXyv/CU8wpK37XbYU172w2ZQ+CrUWz5HTwCK5c+LV0Td6hW0Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CYXPR11MB8712.namprd11.prod.outlook.com (2603:10b6:930:df::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Fri, 28 Nov
 2025 06:56:43 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 06:56:43 +0000
Date: Fri, 28 Nov 2025 14:56:32 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>, Joseph Salisbury <joseph.salisbury@oracle.com>, Adam Li
	<adamli@os.amperecomputing.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Hazem Mohamed Abuelfotoh <abuehaze@amazon.com>, Chris Mason <clm@meta.com>,
	<aubrey.li@linux.intel.com>, <yu.c.chen@intel.com>, <oliver.sang@intel.com>
Subject: [tip:sched/core] [sched/fair]  d206fbad93:  hackbench.throughput
 6.5% regression
Message-ID: <202511281428.bfcbd5a8-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR06CA0004.apcprd06.prod.outlook.com
 (2603:1096:4:186::20) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CYXPR11MB8712:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dce4305-b3e9-4505-baa7-08de2e4b49f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?GZC79ikFymW7i3j3wD7b7gbkVhR8UaFzXtwDwfs5bbfvtlw9QYLmDqxtdb?=
 =?iso-8859-1?Q?T82NcRPdJbas7Aa3biArIIkVyqh9y+Z1x0VVTTJPA1lf1lFdHz32ffOQvK?=
 =?iso-8859-1?Q?8vUhm3ZvTO8Eunf1A7F+tjJVaLIl8E7iLgAfxHC7UAsAz/ahweBVRejwkL?=
 =?iso-8859-1?Q?0wr2MAw6zF4zXZ9j8wiNjMjH58eFnmb+lAeKzteI3pJVBr6OqNhDFx8XPt?=
 =?iso-8859-1?Q?nF2hZnIAoc0W7aoGn36cWEPdJaILcGOdyk8EqpXc4SWiel+MqtKvMK2SdN?=
 =?iso-8859-1?Q?OrG/++Otdnex6d3mco1BFcuTrpe5d4oVc3jeYueZxVJzyJNnVM5vCF0Vem?=
 =?iso-8859-1?Q?5LvErghFlDEjSC39g9KxTE5hoA8y0aXv8kp1bEMb8FD++Lm5A6THgClSo9?=
 =?iso-8859-1?Q?/OrIuPVwcmWUinfKjhaabAv1vkkwCmu1nrjGo8U06Y0ZdAS65/xCxbHMrF?=
 =?iso-8859-1?Q?Xm+8dO28u1sY9Np4kBZzJ2xu6DcUOhvUYeHNHKs2LVbvL2p2tl2F6Q/Gxw?=
 =?iso-8859-1?Q?0u08mPH4Y5lda/8EtBXhqpOpKvtGo8EWW4ZhjEz30lJbxfaaf5Ckq2H8oZ?=
 =?iso-8859-1?Q?oZDinMXri+PzZxc/EgGSxbUGo/l7dbBlu6Tx01Vblyj5bJ19yHbxfY1ZSQ?=
 =?iso-8859-1?Q?64WrROemoERB5mT0UDjrWAL+ROZzViFgaK5Lt4vU1MdELcKJnesEREJHWS?=
 =?iso-8859-1?Q?NG3fRF/3J44sFTubj3le8RA2AQVHX5ytzA2p7gT/bd+rNLp+pZ3wBucgCD?=
 =?iso-8859-1?Q?5UoiMZAS1JjtSgbWT4uiQPEvY/LprMB+rmS50IMrpWaSgO/WfZ6VbuhhKy?=
 =?iso-8859-1?Q?vs09y9IzCS/ZTC3y21kszLhBuHukVhyeHQhvutrjD0g7AuDVtI+6qc9qPT?=
 =?iso-8859-1?Q?XfhW4TDRqVhUMD99OcsCt8l6Jjd7LCq7gMHdtnsbY/u4CvgB76lzvX47na?=
 =?iso-8859-1?Q?4zwb3WrnlqrVsy+E24bwUMnMNJspBCb3CTZpbWwJLlf/ya6UOMdircRWEw?=
 =?iso-8859-1?Q?K/SP8bhHXz9UZihttObLmhkfdhWJNB8agLPbK0PGYvjKiPLSZLszYV7xCd?=
 =?iso-8859-1?Q?0z+70BiNOQSAP60LAvp9sC22GOlRpOTJsesVo+3wn9Z1A/ETL3/RNw7KM6?=
 =?iso-8859-1?Q?38uOMte3mz3z9tA6MI501cSApeCWB+58naRiaS+HCvC/acv9prYTZK7O75?=
 =?iso-8859-1?Q?0MkpMSOD11m6uczpOfEmx55IZOq2IXX4PSLkiCSsf0saT+g6CRpm4dAn/s?=
 =?iso-8859-1?Q?sgnIidlSRT/EAe/hm3Y4q8u2velPSRQkJlvh67w/3zO63MYFJxEyC7alzD?=
 =?iso-8859-1?Q?db3znpdhDeEBKcKt2FoxFHZwvwLxKqjLJj993z0WHMYTDLefcOtIEXSJJp?=
 =?iso-8859-1?Q?plilCHpPLQJ59M0shQODXKqUOwzuKNTxMlPafdmeHynetEzttDXl6ZWaG3?=
 =?iso-8859-1?Q?uyoWsqEhu8m/m6cRFx3RPeB8Jnph4D8WcxLnFS2Lev8rOm7X9GqCT/nZTr?=
 =?iso-8859-1?Q?C++E0mky4Jeo0i2wIeA3AEjdJOc89zEKD1poijbyNE7A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?j4i+k6wudyON0D29MmjvduFEAk1VOZhIdxuiIwrptoYPn/GMd/SpYAaFa2?=
 =?iso-8859-1?Q?k+/Tf2ShnPvSo7zFVehJtsxHq4AtySOL8M/rkneXWvqIGH2/Xa4HzuQmge?=
 =?iso-8859-1?Q?0GdOJ/VhILXhjTErrfrgUr3RaEmmAcmkSgjcsWfa1AQnQy98vovvqlS2kv?=
 =?iso-8859-1?Q?pIJKrC1hpzef+dZZFH8e0CXK2zXgckaCtzpWCwswPd6HzkMk9+xkCsWnlB?=
 =?iso-8859-1?Q?rRHxAkvdsEHgsA60jlMrCMJ7V0QJC9Sgoh+f/8Jz8kW23ucjljRQPZKpzK?=
 =?iso-8859-1?Q?CXmsYJppvIG4vn3Z4qDEz7s/G0fb9Ua3XdLp6UIWSoAoztPvDFYkcv5iKB?=
 =?iso-8859-1?Q?ZRtRHGbf/yWZ+Hp0aBfjCpvNFqDBtHTUfV9PhLhiEtAb8CMjuf400rErCl?=
 =?iso-8859-1?Q?Fj/C1YVgtnIyURiDXlfluxroqnZ0M0j9o6Q4arGN/YgNTeFcEPgwkw+5ER?=
 =?iso-8859-1?Q?4XbaiNyCmU6F+d5DB9KdM3JIV+/GZoq5kEBwkVmPKfqMNthZW3ffpp5FDs?=
 =?iso-8859-1?Q?EqVbvmK+1e8YVI8TzOgPG+dmpw6N69GoGDUOHQtTaF9W7o2frh+CrWxxyc?=
 =?iso-8859-1?Q?9+I2qTmQJfwCANcTfRvRuybNuzFwK8X9OT1CKoW5hy1pIVXQRUYHHqVdiS?=
 =?iso-8859-1?Q?vGeP61tkvTMtxrxfsukwjQzVwKRl8CZyhbYpx6LpCl7VAXKQry1BkwlWMU?=
 =?iso-8859-1?Q?dTs60QXdSdX9AzMDRfBrNeLdWvTbEfYUr5UlnJ3el37hsK9WQX0uFJJe6p?=
 =?iso-8859-1?Q?+vVj1BQ2xyewWOrrqJWASsu7WnEt0ax4y4q8+FDcHSpDcUmta/4Y23e/c9?=
 =?iso-8859-1?Q?SOP071Ms90QB7/Ebe0bYMHguz+n0NNKzfgTJcfZ2Qb9rjp5FlMV+ll0z5x?=
 =?iso-8859-1?Q?TxYiVs46p1nxWp0uNpU/mBI0Fetwzvc1hGBtQpnGOMkxUhCfRWtmELlQP5?=
 =?iso-8859-1?Q?dJof++Pe0mWOKs/YvHPhDZnZ9p0Yb01Ry0+56o0Oq/sELfBbxkEXAKURhX?=
 =?iso-8859-1?Q?Sd8IXNvVW8Du0og3cawJ0IrpFg89kLrcVEGkk2AVs1wHWIkpoZA+3P/zYj?=
 =?iso-8859-1?Q?AcprtB/JyqiSSXdqezXbE3jH2reMNYgUDUfCnuTuw/K9mIZ4ZVS+1+NTEh?=
 =?iso-8859-1?Q?NRkZf0RZYYiufdcBhu2rjoqtt2sYViczVFbp1rxE6T22wzy2J3RrpkrZIl?=
 =?iso-8859-1?Q?N8qpqwE/YV8VfHcPIpqVUVB4bNB+T+VHO1h/ghXZH01RqhJQXH+cbehQav?=
 =?iso-8859-1?Q?lABpDHerBSbGlxUJs4mOj99q14rl2HwTqxvKPYJijuexAnGWbRqwmtVd70?=
 =?iso-8859-1?Q?yxLufG/xJIXK7Ue12pG3sg7g8L8jz+mvDLpEIni4QsAS3SQCpt4t2GKE6A?=
 =?iso-8859-1?Q?eOlT9ZTxn2lQT2XfuN40sQRthXiAwRUoA2bFF+JJjIO+EKL7KlUebhMbD/?=
 =?iso-8859-1?Q?uxST+h+Dq+L8FSYpnxlI376owEwRa2kV48ZWAOkxEXiH1gXz+ojEhTY1NF?=
 =?iso-8859-1?Q?/tPlxGI1Kin6Pq/nKGoDPLggsZedplUuVfRxZRQdpovPfiwbXPke6T19/E?=
 =?iso-8859-1?Q?O6QXqJylajsViGEeTaB7VRYDfiwOcEu93nA99jdmThkOPKBPHyzBYPfDv8?=
 =?iso-8859-1?Q?XS7dbdC9hnw/b9Trq/1RI1ju3uoesNjU5W4sZyaQ+0Gg9OtjpwWxB9/Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dce4305-b3e9-4505-baa7-08de2e4b49f9
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 06:56:43.4797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hnqOCkAlEVZDVWInDugrtQa+23ldicbmsTQhazES1xMn0Sm3zUGxkH9pDppN+6hOcQg+d7j33iKqA/de4umMhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8712
X-OriginatorOrg: intel.com



Hello,


for the change reverted by this commit, we reported several regressions before
[1][2][3] majorly for unixbench tests.

[1] https://lore.kernel.org/all/202507150846.538fc133-lkp@intel.com/
[2] https://lore.kernel.org/all/202507281046.e71b853a-lkp@intel.com/
[3] https://lore.kernel.org/all/202508150416.d7153a48-lkp@intel.com/

but now, for d206fbad93, we also capture a regression in hackbench tests.

below report is just FYI what's the possible performance impact of this revert
commit.


kernel test robot noticed a 6.5% regression of hackbench.throughput on:


commit: d206fbad9328ddb68ebabd7cf7413392acd38081 ("sched/fair: Revert max_newidle_lb_cost bump")
https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git sched/core

[still regression on linux-next/master ef68bf704646690aba5e81c2f7be8d6ef13d7ad8]

testcase: hackbench
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory
parameters:

	nr_threads: 50%
	iterations: 4
	mode: threads
	ipc: pipe
	cpufreq_governor: performance




If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202511281428.bfcbd5a8-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20251128/202511281428.bfcbd5a8-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/ipc/iterations/kconfig/mode/nr_threads/rootfs/tbox_group/testcase:
  gcc-14/performance/pipe/4/x86_64-rhel-9.4/threads/50%/debian-13-x86_64-20250902.cgz/lkp-icl-2sp7/hackbench

commit: 
  e837456fdc ("sched/fair: Reimplement NEXT_BUDDY to align with EEVDF goals")
  d206fbad93 ("sched/fair: Revert max_newidle_lb_cost bump")

e837456fdca81899 d206fbad9328ddb68ebabd7cf74 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 2.603e+08 ±  6%     -33.6%   1.73e+08 ±  4%  cpuidle..time
   5881942 ±  3%     -62.9%    2180816 ± 13%  cpuidle..usage
     97892 ±  5%     +17.9%     115437 ±  2%  perf-c2c.HITM.local
     98482 ±  5%     +17.6%     115850 ±  2%  perf-c2c.HITM.total
      3.99 ±  8%      -1.4        2.62 ±  3%  mpstat.cpu.all.idle%
      0.71 ±  2%      -0.1        0.64 ±  2%  mpstat.cpu.all.irq%
      0.05            -0.0        0.03 ±  2%  mpstat.cpu.all.soft%
   1305956 ±  8%     +19.7%    1562588 ± 11%  numa-meminfo.node1.Active
   1305948 ±  8%     +19.7%    1562580 ± 11%  numa-meminfo.node1.Active(anon)
    863383           +20.4%    1039636 ± 11%  numa-meminfo.node1.Shmem
    326485 ±  8%     +19.7%     390946 ± 10%  numa-vmstat.node1.nr_active_anon
    215818           +20.6%     260214 ± 11%  numa-vmstat.node1.nr_shmem
    326485 ±  8%     +19.7%     390945 ± 10%  numa-vmstat.node1.nr_zone_active_anon
   1631510           +10.4%    1801907 ±  6%  meminfo.Active
   1631494           +10.4%    1801890 ±  6%  meminfo.Active(anon)
   1772671            +9.5%    1940770 ±  5%  meminfo.Committed_AS
    909474           +19.7%    1088760 ± 10%  meminfo.Shmem
      5.36 ±107%      -3.2        2.11 ±223%  perf-profile.calltrace.cycles-pp.process_simple.reader__read_event.perf_session__process_events.record__finish_output.cmd_record
      6.59 ±100%      -2.2        4.41 ±141%  perf-profile.calltrace.cycles-pp.__ordered_events__flush.perf_session__process_user_event.reader__read_event.perf_session__process_events.record__finish_output
      6.59 ±100%      -2.2        4.41 ±141%  perf-profile.calltrace.cycles-pp.perf_session__process_user_event.reader__read_event.perf_session__process_events.record__finish_output.cmd_record
      5.36 ±107%      -3.2        2.11 ±223%  perf-profile.children.cycles-pp.process_simple
      0.34 ±  4%      -0.2        0.11 ± 14%  turbostat.C1%
      1.10            -0.8        0.28 ± 16%  turbostat.C1E%
      2.96 ±  8%      -0.6        2.38 ±  2%  turbostat.C6%
      1.25 ±  5%     -15.5%       1.05 ±  4%  turbostat.CPU%c1
    795.01 ±  4%     -10.1%     714.37 ±  2%  sched_debug.cfs_rq:/.util_est.avg
      4969 ±  9%    +122.0%      11030 ± 47%  sched_debug.cpu.avg_idle.min
      1716 ±141%    +111.4%       3628 ± 61%  sched_debug.cpu.curr->pid.min
   1063335 ±  3%     -47.4%     559053 ± 23%  sched_debug.cpu.max_idle_balance_cost.avg
    712039 ±  2%     -29.8%     500000        sched_debug.cpu.max_idle_balance_cost.min
    407716           +10.5%     450503 ±  6%  proc-vmstat.nr_active_anon
   1139851            +3.9%    1184811 ±  2%  proc-vmstat.nr_file_pages
     33054            +0.8%      33323        proc-vmstat.nr_kernel_stack
     88427 ±  2%      +6.0%      93718 ±  2%  proc-vmstat.nr_mapped
    227232           +19.8%     272194 ± 10%  proc-vmstat.nr_shmem
    407716           +10.5%     450503 ±  6%  proc-vmstat.nr_zone_active_anon
  44509495            -2.8%   43284126        proc-vmstat.numa_hit
  44442837            -2.8%   43217032        proc-vmstat.numa_local
  44571379            -2.7%   43348289        proc-vmstat.pgalloc_normal
  43993792            -2.9%   42727500        proc-vmstat.pgfree
    342580            -6.5%     320227        hackbench.throughput
    334468            -6.2%     313595        hackbench.throughput_avg
    342580            -6.5%     320227        hackbench.throughput_best
    319665            -6.4%     299259        hackbench.throughput_worst
     90.24            +6.6%      96.22        hackbench.time.elapsed_time
     90.24            +6.6%      96.22        hackbench.time.elapsed_time.max
  1.47e+08           +10.0%  1.617e+08        hackbench.time.involuntary_context_switches
     37736 ±  3%      +8.1%      40787        hackbench.time.minor_page_faults
      6097            +1.8%       6206        hackbench.time.percent_of_cpu_this_job_got
      5041            +9.1%       5501        hackbench.time.system_time
    461.18            +2.2%     471.26        hackbench.time.user_time
 4.238e+08            +4.5%  4.429e+08        hackbench.time.voluntary_context_switches
 2.525e+10            -4.4%  2.415e+10        perf-stat.i.branch-instructions
      5.10            -0.6        4.55 ±  4%  perf-stat.i.cache-miss-rate%
 3.459e+08           +12.9%  3.906e+08        perf-stat.i.cache-references
      1.83            +5.5%       1.93        perf-stat.i.cpi
  1.92e+11            +1.3%  1.946e+11        perf-stat.i.cpu-cycles
    423018           +19.6%     506120        perf-stat.i.cpu-migrations
 1.074e+11            -4.1%   1.03e+11        perf-stat.i.instructions
      0.56            -5.4%       0.53        perf-stat.i.ipc
      4.79 ±  2%      -0.7        4.14 ±  5%  perf-stat.overall.cache-miss-rate%
      1.79            +5.7%       1.89        perf-stat.overall.cpi
      0.56            -5.4%       0.53        perf-stat.overall.ipc
 2.499e+10            -4.3%  2.392e+10        perf-stat.ps.branch-instructions
  3.42e+08           +13.0%  3.865e+08        perf-stat.ps.cache-references
   1.9e+11            +1.4%  1.926e+11        perf-stat.ps.cpu-cycles
    417843           +19.8%     500456        perf-stat.ps.cpu-migrations
 1.063e+11            -4.1%   1.02e+11        perf-stat.ps.instructions
 9.709e+12            +2.4%  9.941e+12        perf-stat.total.instructions




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

