Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5057E189BB0
	for <oe-lkp@lists.linux.dev>; Thu, 20 Nov 2025 06:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763618742; cv=fail; b=WD5KilpmG8cGkurtQixSvp6jWfjnQeJR1eIkIhkgbX7QIfrDPGyL2DnW2vIJBZVSTabOKewULY5Pez7a+UN9MqnMDDmo3tmMRnWrCGeb62Kb0JlvHvm0axR+9LWxjpxQuL4SVDln9xtUrnKDBw70I9921SuTlN2k6IY5XSCqnBw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763618742; c=relaxed/simple;
	bh=E5nFVAGGdu9FuO8ssR93GoV8PwSMwG8Nl6wJYp4QXZ0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=b0C/Lp4LjRtm8igykyz+CGgMUSBy+YFemyA8uC33SWf3iBMz874OnaghlUY2GWg+6cDV0omXsaylnUsOVSAPok0Ij9T70Hm8M9+LrcsWZUa+6QXDRKXloxFgmgkrkzmCdKb124e3XmM4dvRgABuz0w6GIuk8XbFh9W1h4iSLq9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U13giUm/; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U13giUm/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763618740; x=1795154740;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=E5nFVAGGdu9FuO8ssR93GoV8PwSMwG8Nl6wJYp4QXZ0=;
  b=U13giUm/ndOgaysgh/3l7Bnup4NeugWNJ1b6Ba6QuaZXKY5eLFM1RL+n
   wE6wpGAgRetbeBXxRcSSsorMlR2+BVGBcGwAF1OTqmjAI2EvXpkbTu21b
   uwikn2KDm6jRcUTtGd5w42K9mO3kic/+nJnvtyhFeu+o6Z0MsGCd3hvnX
   w4hPiIY/hdymRIzDKIxsNizvuHDcy73STC3JxXhx3UX0JjNZ7BDiSaaqv
   fs/Ulx5Rh+N+EXWxKeq6dC8LrYfwcIGnlReZGF1KskNcPw8/sLfhcSlJ/
   +n4BuIFCOtExhHDq4LqQEf3ugI075u56RGe7Y+098zJNh8z9AE8ITgy/x
   g==;
X-CSE-ConnectionGUID: Yz/qZkO7TkC3AHWtfR/NMA==
X-CSE-MsgGUID: kjE2331ISTaJRvrikW4ITA==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="76780018"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="76780018"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 22:05:40 -0800
X-CSE-ConnectionGUID: LGHgFpSmQt+hezVTx/BonQ==
X-CSE-MsgGUID: EWVwC6V5SdWIj0EWn33BaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="228583787"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 22:05:40 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 22:05:39 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 19 Nov 2025 22:05:39 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.23) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 22:05:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iJGD7fZuCU7cllJjWSO/4Sm1ZFK1FsrT2VOCpLWuXCeSpEZnP4nhZR8OAhp+iEWNDAlcmvJGq0sr4NcgANlYsCFRIkoPgCXLN/DJFMpT8ZmGHNq1PuWlBe3U2/B/4BjkCGSK3OR/W4+7xav6r8MNjvQQ3bps0e7ex+23SHPNaaQJv93Z/7613r4qWKSIntCynCaBFP/Yvw4RKqeUZaY24IdnhaJFDqgx8uksV6x7HELh9itBb6RJ1JVogyaRc0Cyt+m19Bt8SNTdanY6K+hGExEmvylK1hw4r/tYDqahoddxGp1A6JXRZ0bFhpO+E8TF9SCMiI+jrADZGUaFWylltg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rgejt27GWEg9Vd3q/JgUzdmWK4Ha9Xx6zHvXP9HCLmU=;
 b=H6K67jLVngZp5NoWQae0nFf9Mf+k13JkJFXY7VJvTpsFxIC49lDk7skjOWncs8UlHbUAViwlYLoDJ2PDOMqN5DKCMIxvNfBUi6kDtqTXnEEoVw6z4kjEfHKVEFTAxQ4cAoI3tl6xRq7OKYvSJJELCgsUcnvPMnjrvc/bZPLbnFFM5aVavOdY4IA37UkNgLchvR9HEnkc1uHkFOumcnV9Cjfk69qqS9z0PrOjB6EH0z1usZ3C0pUawkF4xtm3POtI5szZtcJB3qCcaXFldXTGy3PXg9E9l0qRrbJrieNDKUdikIlZ4j3gfQSelYAD5zYahh98NWrX9Wd3FGbsBgkOyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MW3PR11MB4763.namprd11.prod.outlook.com (2603:10b6:303:2c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 06:05:36 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 06:05:36 +0000
Date: Thu, 20 Nov 2025 14:05:30 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Mel Gorman <mgorman@techsingularity.net>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [mel:sched-preemptnext-v2r1] [sched/fair]  09f89cc1ef:
 pts.schbench.32.usec,_99.9th_latency_percentile 20.3% regression
Message-ID: <202511201346.cd26911a-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR04CA0215.apcprd04.prod.outlook.com
 (2603:1096:4:187::14) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MW3PR11MB4763:EE_
X-MS-Office365-Filtering-Correlation-Id: 75962019-3aee-46f1-0119-08de27fad2e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?SxO7rI12czyKZCaK1dEAg/dDfXl7aci7PspnznEBVgGibzOUr9g2+xPbuZ?=
 =?iso-8859-1?Q?zrWrmsjEHtbYoricpYHshiFY0ScN/LWf8OEgdZaYi+kJmo2SmU4mrhn/ch?=
 =?iso-8859-1?Q?Y/+WTMg2KoYT7GoOZZuEUc3b/QywLGO7hHS0Fcw8A2xOJehsHWunt3MPJD?=
 =?iso-8859-1?Q?anl5e6EJ8Lk2Ee3nsFQ0k3lhw2517/he0oZRmZmMlhsdtIKxVCmr/UOAEX?=
 =?iso-8859-1?Q?hMfUcRT7Ze1mSJYF+3HacFaR9EQ2FbNffUn/HZM8lJl1q55Gqe2z4G8zsq?=
 =?iso-8859-1?Q?l4ESR/6Gwg1RFWUnG2RzKfW19FTwWUpotfQAvVISNQBaZTVn3fQH+uAjJr?=
 =?iso-8859-1?Q?wnW1JRLm6GUAxv9WSwrncds54J9O9WtAAy5MuiLhoZdvAHbIy0iW+ncGeX?=
 =?iso-8859-1?Q?wuVDjr20vH74vfSFaMK1URAjClPsWLiyyP0tXXG3iKHeo97nDLrq8dmFiV?=
 =?iso-8859-1?Q?hQW0o52nL9PkBX+jQddeGtZRZxKWQBFg9SS85nQHjdCR2S9gX0UzqtrW5+?=
 =?iso-8859-1?Q?ZShg5kdrIFvIbYoQVt3vYsARqgmvxyqw3Fl21o5visCNvVWp/nJgpiP8eL?=
 =?iso-8859-1?Q?yj2pnQANmHCeQcmui3D6gLn4/vTFZxaWDW4Gx5yYs1CSS+IYjPQXViFqIW?=
 =?iso-8859-1?Q?X6d1PHH2AbFF2XHF/hhyhbijnrPAyiw0z9bIdKfGtKu5/DAIQ1oTlil7j5?=
 =?iso-8859-1?Q?4lGn4pEmIJ0MRwcE9eB9V+XG3xKOrrWKTBAAG0RKtdP2+kz5P5cI+12L5i?=
 =?iso-8859-1?Q?Ao421DKPOlFtDb7UczzQ4dfJJHzpycnfxf5zlFgtz+OmagM4o1sCoqUzcR?=
 =?iso-8859-1?Q?sh2zE0h99Jjc6myZqmGfkUcu9dMzCfBjUFGEmaO03NZOalcfNRtbmSl8P+?=
 =?iso-8859-1?Q?mVgEusOlnog1CrWOKN3tA1TRdjgvgxNjEQEBhDxrWnGII3VjXpqwN6eFeK?=
 =?iso-8859-1?Q?BxK8UXLVjLnGqc01c9/wLEh+CeI+fb6WAWj9CkAsW9vr2VAmlOYDeeOnZ+?=
 =?iso-8859-1?Q?bG2gL9nWR3L+MUX4o+e1IXCtmqb7OMVftz34d5Q9L6qb+pdmVzCajOjCdC?=
 =?iso-8859-1?Q?pF58MaiC+5YdVU0BDZF/btZclfkPnTyRtH+jQIISNVz0baoQFX4t+xilw+?=
 =?iso-8859-1?Q?KVvMYJrz45QmIT4P61hU3TkK2JqSl19zbtHlZzVIl3ctci6uLidwkcAluW?=
 =?iso-8859-1?Q?+Z6ikGmczU2PxBEMQ7tDkHdxLrV/YZMy/WmRvuc/AyJqDK4zkxV6cE2diG?=
 =?iso-8859-1?Q?zNpJXvXxR25D1euwBph850w7n3NSRFbiOvbehGaKZrXACoxcxZ65/n6JFe?=
 =?iso-8859-1?Q?HOcrAnl6mrAOoLJat262g0RWT/d5CSeOM+p//SuBZ1TFSQ6DsqPeO8H3lQ?=
 =?iso-8859-1?Q?QdPxfhfR6yrc7nshqhMUvd35q+wq00pDHooxYaa22CIFGRJY/ec63wV2Ww?=
 =?iso-8859-1?Q?1B/8VdeXm2DCtoBdUv9ej32UeCtkW2Oyc5foRkhTZM07tm4vFJQQXp6ztE?=
 =?iso-8859-1?Q?1IEHfPKp3ZEDxuZNur0hWgBvdya3zyEVUSptj3stPA+g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?GLb7Ef2ZSBeXAxyeaq9ZY2E19X2MemwX2uCPyaQsf/hFkwwolueO/y6hWK?=
 =?iso-8859-1?Q?jRpIbKDXUG2V/UUnuTsoM9IPoLaC/VALy5d18CQlshoBJzm1IFAbZ1o5Vn?=
 =?iso-8859-1?Q?Zds4yJBE2iwDyffTNEtkg1mZpvcd+E5j4meED9UgIm7M5CzXcTocGR4Hp3?=
 =?iso-8859-1?Q?N/qIIGltcx4ioWpnxYTURI6YE2jfF/nH1K8ecgpbg2EIJfSyghKKM300fU?=
 =?iso-8859-1?Q?VTt04F7uYXcOV+6TVuuiG7l5taWeicZPz6swsxLfusCWRKw/gorpGevdFJ?=
 =?iso-8859-1?Q?fMMT9LcycwFfH0Uv2SSOD7Vt37rU/nQfMP6qWsQNqBmBcVfj3kulFluW3B?=
 =?iso-8859-1?Q?N2RvysMap0x1tpfa8zdf3zO4xZMpvBN21MisE6DtoS7Xzy2Nt1w/UCZrFb?=
 =?iso-8859-1?Q?OYH2qkg+1bY1Lgs0QgIxJ80R1EcESykf0P3/iHqZU5yDdrMgYrc+YL9mZp?=
 =?iso-8859-1?Q?DiX25Fz4QUse1aXAEU2ljyrPO4VHBzQzYSwzK8JdKxpQoGrFrlriPb0Nnq?=
 =?iso-8859-1?Q?zhSU/avoHBJJFibxCh/2KXGpXIth2KoSESxt1isXRTm8s8MeTb5WPf0Wm9?=
 =?iso-8859-1?Q?8BM5+l4bKu9pjXbQhhvF+LRVYK8D1ccuXSxsjle9hMSUNh3Ic4YCPGgovp?=
 =?iso-8859-1?Q?0kckinykl5zhvz3c5+BT58VhnrU14mRD24W3AEGlXxkhQBDt+MhpwI1siX?=
 =?iso-8859-1?Q?NnbHO+LRYBybxRk0N8ZW8ziOFapxKJKP6Z1xw7caW1dxspELp6aS2YV6SD?=
 =?iso-8859-1?Q?v1apRyzFrZDbVk1VxPwDlBif1/t8rTuB+7owpf2L+KormjSdOfSiuwUX1j?=
 =?iso-8859-1?Q?lEKBf8QTnjfrNp8x+836aUf+ts+dXZkbCNIntynunUsONPbsamOgo3CBZZ?=
 =?iso-8859-1?Q?qEFId1NEzLPd59uyamMjZc8Z0qzT/XksiY8hkE1miocrVnrBfGmwgEpJ/w?=
 =?iso-8859-1?Q?kMaBpBj4tFSpMYXOfDT1NkzR1xGqg3hP7W4vuSXZRe7Wf3Py+TU+l5vfUb?=
 =?iso-8859-1?Q?M+5UXGidbstAVpMcSavdoTNQyn/CvTQ5qQIwtH31UyjiTwGlp7WaMTW9GM?=
 =?iso-8859-1?Q?0rzOiopM6IhZJMqP0DtQULvVsHfA/DGE+w+5CH4Flj2QodIicKhKAZy4NX?=
 =?iso-8859-1?Q?awMfD7xNFvVlZswdfK9jNsZTeLds/tuGwXoMx1y1/lgvQjq0O4Alzr97VH?=
 =?iso-8859-1?Q?aSC/byas5szL0cpBypW3ylLF8UXLhQP2pPC5/IaUodtWSjEjrFAM5rVe80?=
 =?iso-8859-1?Q?oqT1EbI2QceTDJXfiC+8JGd8bGSETen/mmZia/j5OikGPxaY1kYTDTCJ6O?=
 =?iso-8859-1?Q?Zpfb9xlZOdM7Jtonin7Pa0ZkuDhhVHD07IrbxOrcK/56dQ2ZlhvjyfGXrO?=
 =?iso-8859-1?Q?ROn52lay2plIa1FLkrJgksG+RNkz8SCLJPLNF/x+g4pf/uUUYR7Z3QiH9a?=
 =?iso-8859-1?Q?ZuMwXXwVg/sb1C5BW+IkJ8fogmqqmDBIa9exC0OQdP1yv5Lruy9LfK12zY?=
 =?iso-8859-1?Q?gT96v2L/m5QdLLofOnn4igXIbo4Ii44Ci/doTzUqtZ0pbIFwDpI7UdqMtr?=
 =?iso-8859-1?Q?Z7lNQjc0RqORb7r/w/HCYEkX1CxBYhV8pOtGNCtBn36E8r4LWZPiNmECNb?=
 =?iso-8859-1?Q?GJVRL4jlHk8zyXizyNXPZzJu2vGCC2WLgXrY6frs2/ydicP4uKR+Nv+w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75962019-3aee-46f1-0119-08de27fad2e6
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 06:05:36.7797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tEDO44EbUWjD3sdD+c9igJHdc+I/L07HWs+EJiYw1Bs4kcEmgngTmHQpFkjQ4j25Y726WyWdJSjL39VrQppCww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4763
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 20.3% regression of pts.schbench.32.usec,_99.9th_latency_percentile on:


commit: 09f89cc1ef832eaf976764d34e781d0dcacc9b67 ("sched/fair: Reimplement NEXT_BUDDY to align with EEVDF goals")
https://git.kernel.org/cgit/linux/kernel/git/mel/linux.git sched-preemptnext-v2r1

testcase: pts
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz (Cascade Lake) with 512G memory
parameters:

	test: schbench-1.1.0
	option_a: 32
	option_b: 32
	cpufreq_governor: performance



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202511201346.cd26911a-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20251120/202511201346.cd26911a-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/option_a/option_b/rootfs/tbox_group/test/testcase:
  gcc-14/performance/x86_64-rhel-9.4/32/32/debian-12-x86_64-phoronix/lkp-csl-2sp7/schbench-1.1.0/pts

commit: 
  472046dff7 ("sched/fair: Enable scheduler feature NEXT_BUDDY")
  09f89cc1ef ("sched/fair: Reimplement NEXT_BUDDY to align with EEVDF goals")

472046dff71dceab 09f89cc1ef832eaf976764d34e7 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     19468           +22.1%      23767        vmstat.system.cs
  2.59e+09            -9.7%  2.338e+09        cpuidle..time
   2776948            -9.7%    2506500        cpuidle..usage
     48.54            -4.7       43.80        mpstat.cpu.all.idle%
     22.40 ± 17%     +65.6%      37.10 ± 21%  mpstat.max_utilization.seconds
     37872            +3.6%      39253 ±  2%  proc-vmstat.nr_mapped
     15004 ± 44%     +85.2%      27793 ± 17%  proc-vmstat.numa_hint_faults
    938678            +2.3%     960265        proc-vmstat.numa_hit
    838158            +2.7%     860739        proc-vmstat.numa_local
    610583            +3.0%     628976        proc-vmstat.pgfault
      1810 ± 14%     -60.0%     723.87 ± 54%  sched_debug.cfs_rq:/.avg_vruntime.min
      1810 ± 14%     -60.0%     723.87 ± 54%  sched_debug.cfs_rq:/.min_vruntime.min
      1055 ± 36%     -51.4%     513.39 ± 61%  sched_debug.cfs_rq:/system.slice/containerd.service.se->vruntime.min
   1643718 ±  5%     -13.1%    1428339 ±  6%  sched_debug.cpu.avg_idle.avg
    992216 ±  4%     -15.3%     840210 ±  7%  sched_debug.cpu.max_idle_balance_cost.avg
    298.10 ±  9%     -22.7%     230.30 ± 14%  sched_debug.cpu.nr_switches.min
      3004          +213.8%       9427        pts.schbench.32.usec,_50.0th_latency_percentile
      9660 ±  3%     +60.9%      15542        pts.schbench.32.usec,_75.0th_latency_percentile
     16155           +36.3%      22016        pts.schbench.32.usec,_90.0th_latency_percentile
     38323           +20.3%      46118 ±  4%  pts.schbench.32.usec,_99.9th_latency_percentile
    646375           +41.2%     912804        pts.time.involuntary_context_switches
      4835            +9.6%       5298        pts.time.percent_of_cpu_this_job_got
      2582            +9.6%       2829        pts.time.user_time
    264445            -1.5%     260481        pts.time.voluntary_context_switches
 1.722e+10            +9.0%  1.878e+10        perf-stat.i.branch-instructions
     20009           +23.8%      24762        perf-stat.i.context-switches
 1.383e+11            +9.7%  1.516e+11        perf-stat.i.cpu-cycles
      2203 ±  2%     +25.3%       2760        perf-stat.i.cpu-migrations
     51064 ±  6%     +31.5%      67135 ±  7%  perf-stat.i.cycles-between-cache-misses
 2.038e+10            +9.1%  2.225e+10        perf-stat.i.dTLB-loads
 6.848e+09            +9.1%  7.471e+09        perf-stat.i.dTLB-stores
     39.27 ±  6%     +15.3       54.55 ±  5%  perf-stat.i.iTLB-load-miss-rate%
 8.795e+10            +9.0%  9.591e+10        perf-stat.i.instructions
      1.44            +9.7%       1.58        perf-stat.i.metric.GHz
    463.04            +9.1%     505.10        perf-stat.i.metric.M/sec
      8701            +4.1%       9058        perf-stat.i.minor-faults
    477970 ±  3%     -20.0%     382287 ±  5%  perf-stat.i.node-load-misses
    212470 ±  8%     -18.1%     174001 ± 10%  perf-stat.i.node-store-misses
      8705            +4.1%       9063        perf-stat.i.page-faults
      0.30 ±  2%      -0.0        0.27        perf-stat.overall.branch-miss-rate%
     71.60            -4.8       66.83 ±  3%  perf-stat.overall.node-load-miss-rate%
     55.21 ±  5%      -6.6       48.63 ±  6%  perf-stat.overall.node-store-miss-rate%
 1.713e+10            +8.3%  1.855e+10        perf-stat.ps.branch-instructions
     19876           +23.0%      24457        perf-stat.ps.context-switches
 1.376e+11            +8.9%  1.499e+11        perf-stat.ps.cpu-cycles
      2193 ±  2%     +24.4%       2728        perf-stat.ps.cpu-migrations
 2.028e+10            +8.4%  2.199e+10        perf-stat.ps.dTLB-loads
 6.813e+09            +8.4%  7.383e+09        perf-stat.ps.dTLB-stores
 8.749e+10            +8.3%  9.478e+10        perf-stat.ps.instructions
      8447            +4.7%       8847        perf-stat.ps.minor-faults
    470926 ±  3%     -20.3%     375205 ±  5%  perf-stat.ps.node-load-misses
    210067 ±  8%     -18.5%     171191 ± 10%  perf-stat.ps.node-store-misses
      8451            +4.7%       8852        perf-stat.ps.page-faults
 4.733e+12            +8.0%   5.11e+12        perf-stat.total.instructions
      0.11 ± 25%     -76.7%       0.03 ± 30%  perf-sched.sch_delay.avg.ms.anon_pipe_read.fifo_pipe_read.vfs_read.ksys_read
      0.02 ± 25%     -51.2%       0.01 ± 13%  perf-sched.sch_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.__x64_sys_nanosleep.do_syscall_64
      0.02 ± 55%     -65.5%       0.01 ± 68%  perf-sched.sch_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.26 ± 34%     -63.2%       0.10 ± 40%  perf-sched.sch_delay.avg.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.28 ± 20%     -63.3%       0.10 ±  9%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.05 ±  6%     -87.4%       0.01 ± 48%  perf-sched.sch_delay.avg.ms.futex_do_wait.__futex_wait.futex_wait.do_futex
      1.44 ±  5%     -86.0%       0.20 ±  5%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      1.44 ±  4%     -86.0%       0.20 ±  3%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
      0.31 ± 10%     -62.4%       0.12 ± 11%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
      0.30 ± 12%     -61.3%       0.12 ± 14%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
      0.27 ± 10%     -60.8%       0.11 ±  8%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
      0.27 ±  9%     -60.9%       0.11 ±  7%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown].[unknown]
      0.83 ± 19%     -52.3%       0.40 ± 47%  perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.01 ± 13%     +46.4%       0.02 ± 21%  perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      1.46 ± 38%     -95.3%       0.07 ±142%  perf-sched.sch_delay.max.ms.do_nanosleep.hrtimer_nanosleep.__x64_sys_nanosleep.do_syscall_64
      9.27 ± 45%    +119.8%      20.37 ± 20%  perf-sched.sch_delay.max.ms.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     48.28 ± 49%     -39.5%      29.22 ± 12%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
     21.85 ± 25%     -35.6%      14.08 ± 13%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
      0.89 ±  4%     -84.9%       0.13 ±  3%  perf-sched.total_sch_delay.average.ms
     30.16 ±  2%     -26.1%      22.29        perf-sched.total_wait_and_delay.average.ms
    156088           +29.6%     202359        perf-sched.total_wait_and_delay.count.ms
     29.28           -24.3%      22.16        perf-sched.total_wait_time.average.ms
    714.37 ± 14%     -66.2%     241.51 ± 72%  perf-sched.wait_and_delay.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     98.02 ± 20%     -54.2%      44.90 ± 25%  perf-sched.wait_and_delay.avg.ms.anon_pipe_read.fifo_pipe_read.vfs_read.ksys_read
     10.18 ±  5%     -14.4%       8.71 ±  6%  perf-sched.wait_and_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
     17.04 ± 17%     -55.0%       7.66 ±  4%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     11.48 ±  2%     -32.8%       7.71 ±  2%  perf-sched.wait_and_delay.avg.ms.futex_do_wait.__futex_wait.futex_wait.do_futex
     30.26           -27.0%      22.09        perf-sched.wait_and_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
     30.42           -26.7%      22.29        perf-sched.wait_and_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
     31.81 ±  7%     -41.4%      18.64 ±  4%  perf-sched.wait_and_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
     32.87 ±  7%     -45.2%      18.02 ±  3%  perf-sched.wait_and_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
     31.78 ±  7%     -26.2%      23.45        perf-sched.wait_and_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
     31.88 ±  6%     -26.1%      23.55 ±  2%  perf-sched.wait_and_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown].[unknown]
    139.45 ±  5%      -9.9%     125.64 ±  4%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_poll
      2.10 ± 72%    +247.6%       7.30 ± 44%  perf-sched.wait_and_delay.count.__cond_resched.kfree_rcu_monitor.process_one_work.worker_thread.kthread
      0.40 ±165%   +1050.0%       4.60 ± 70%  perf-sched.wait_and_delay.count.__cond_resched.migrate_pages_batch.migrate_pages.migrate_misplaced_folio.do_numa_page
    431.30 ± 21%    +123.3%     963.20 ± 24%  perf-sched.wait_and_delay.count.anon_pipe_read.fifo_pipe_read.vfs_read.ksys_read
      2165 ± 20%    +477.8%      12510 ±  4%  perf-sched.wait_and_delay.count.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     46617 ±  2%     +19.0%      55460        perf-sched.wait_and_delay.count.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
     45256 ±  2%     +18.6%      53674        perf-sched.wait_and_delay.count.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
      1532 ± 12%     +58.9%       2435 ± 19%  perf-sched.wait_and_delay.count.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
      1472 ± 13%     +54.8%       2278 ± 19%  perf-sched.wait_and_delay.count.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
      4347 ±  6%    +200.5%      13063 ±  3%  perf-sched.wait_and_delay.count.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
      4151 ±  5%    +201.2%      12503 ±  3%  perf-sched.wait_and_delay.count.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown].[unknown]
     16.16 ±153%    +361.1%      74.50 ± 16%  perf-sched.wait_and_delay.max.ms.__cond_resched.migrate_pages_batch.migrate_pages.migrate_misplaced_folio.do_numa_page
    110.98 ±  6%     +20.5%     133.75 ±  7%  perf-sched.wait_and_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
    712.75 ± 14%     -66.2%     241.20 ± 72%  perf-sched.wait_time.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     97.90 ± 20%     -54.2%      44.87 ± 25%  perf-sched.wait_time.avg.ms.anon_pipe_read.fifo_pipe_read.vfs_read.ksys_read
     10.16 ±  5%     -14.3%       8.71 ±  6%  perf-sched.wait_time.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
     16.76 ± 17%     -54.9%       7.56 ±  4%  perf-sched.wait_time.avg.ms.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     11.44 ±  2%     -32.6%       7.70 ±  2%  perf-sched.wait_time.avg.ms.futex_do_wait.__futex_wait.futex_wait.do_futex
     28.82           -24.0%      21.89        perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
     28.98           -23.8%      22.08        perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
     31.49 ±  7%     -41.2%      18.52 ±  4%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
     32.57 ±  7%     -45.0%      17.91 ±  3%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
     31.50 ±  7%     -25.9%      23.35        perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
     31.61 ±  6%     -25.8%      23.45 ±  2%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown].[unknown]
    139.31 ±  5%      -9.9%     125.52 ±  4%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_poll
      0.39 ± 58%     -66.4%       0.13 ± 39%  perf-sched.wait_time.avg.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
     16.15 ±153%    +361.2%      74.49 ± 16%  perf-sched.wait_time.max.ms.__cond_resched.migrate_pages_batch.migrate_pages.migrate_misplaced_folio.do_numa_page
     98.82 ±  5%     +16.0%     114.63 ±  4%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
     11.73 ±200%    +240.8%      39.96 ± 92%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_irq_work.[unknown]
    100.51 ±  4%     +24.2%     124.84 ±  6%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

