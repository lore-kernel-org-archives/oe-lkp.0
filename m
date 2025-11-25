Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E91B1D435F
	for <oe-lkp@lists.linux.dev>; Tue, 25 Nov 2025 09:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764063680; cv=fail; b=YPcBTdF+3L7VWkSXzhPEpNKBDuA44OPhUHFiZSgPBfWre/uyOMsPEpmCjhcid5FnsEHYRMWlQ8bvdhgr20cj2PKCSd5ESlra6P5gk7K3jyzxACiX/L6uksY8vm2mEUr4e0Q5NqteQWHzRiwXeSdN3vypX737F2OjzNAD2tpcoEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764063680; c=relaxed/simple;
	bh=tPSGKSh6rbfF4eWoNB498TDGCnUKbV8sL8MTHgFY6Ns=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=N5N3h3M+GfCNxrsB2mykP4apyDOWKx2McckGKtHZQZZUSK8Mhoz0oxjImfyjM9nH6YiA+2wGm1JVDSrMRwFzjnINqM9jqs5lzVmPg3BwIkps3Ol92DUtGDrc+KelYGaYMgYW3B71cwEf66NmxkTI36gkx39XuivbV90+k7ki4aE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IP9FPFX+; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IP9FPFX+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764063678; x=1795599678;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=tPSGKSh6rbfF4eWoNB498TDGCnUKbV8sL8MTHgFY6Ns=;
  b=IP9FPFX+rwEy8p1APuH+OPETVYzQIeYfRP0du6IQ5ktktGbs6sB0WW5I
   oTAQvQFERlDXMA/s2JhM3fJMOCSPD/uce5QrMl6Gu8rpqoU8qsUc6PH+j
   ok0cRFozvzszwsLJz1hwZ/vGnmBJ1lQG+N/Ar5ACtyRbDaDYW+Dn9icWe
   E0CqDh7MVpwCI0fdahArEC+LT7jUu/xqC9j2gXA/BQ1UTudrjc6n3eEeW
   QRYJB+Tsan200ktNHbEdabTrbXoXF5EIqcEKZ5viwwQcdOsyAz6dPePc1
   4xM6ZKHhwF9UrT6dsp6v0WwZbocyj1DICiEc1xWzgHpHQ0vVKz1J6/0qJ
   w==;
X-CSE-ConnectionGUID: IGhzJSyhQAeCm3x2Oho0kw==
X-CSE-MsgGUID: IGmuM604SfCJdt7Tpfaufg==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="69933808"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="69933808"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 01:41:18 -0800
X-CSE-ConnectionGUID: izXTzJG2RG66FS7zmB6g4w==
X-CSE-MsgGUID: eA70uRT7RlOc5tyZHPeBlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="192404249"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 01:41:18 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 01:41:17 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 01:41:17 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.71) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 01:41:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EZ7OgPR6gJpPHnHcLc6pVMxbw0swTwGByQJoPyhq3drVZXSbHck/o0YeBLo73vCcZLylWoSM6+TEA12HUAhk8cXxuwNmBnGXSaDhocq8cxrmsm08qwxuEWUcxguxe+FXyeUGuFnp1+puIzsGAzpBvy7KmfkRvhjkS9BgmoB9CTQl5RZv1TSzo1T6gP9/H+7pXmenkMGUkVkinn9j3YUO7fZDMSRIgovdqHvy+chJloVRy2mzzG7h/Zb0KDlJfGjS5PT8bYi6MVLKtjX3mXYfNt75Eohoc6Nm3o3wq0MLH1NqYa68ZjKVMctXyeo8HuVUiavg4m84zUfq0UeEqW1vtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oiM2y40lvzIDAfJe9hjjydViBQ/dnqEhKho+hoMGVJ0=;
 b=yfJzY/W7TfXgV1yiTbgORZPPc7wR8vAbySGzeuRWSI19HQn9cHanGSvnbSYHdJJT1BkxqGqrWXWhseG0o48/t2sGY1sJlpD9kwgsAJbzREQRNuGG2QdQlbaCwe3nS7f2Eb6898qPE2wl0EWgnUmeFyye+UDGHqC6H2fFO7iHnc7j94IQkcvT7jsfHBeSc7sdao2nJyr86SRVtQMGvwE9NzyuirLl1yfMoUqB3H1D5Aps2PE7hJkJaWqIs5hKuXsdSO1tLv7C009zBeC0B+xSACSwfCNHd86PZrPB8XZH4+M+bwDqb/4Q6d1UxBoiaymIUD1huZiYY74MMmddtWQ0Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by BY1PR11MB8031.namprd11.prod.outlook.com (2603:10b6:a03:529::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 09:41:10 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9366.009; Tue, 25 Nov 2025
 09:41:09 +0000
Date: Tue, 25 Nov 2025 17:41:00 +0800
From: kerne test robot <oliver.sang@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Chris Mason
	<clm@meta.com>, <aubrey.li@linux.intel.com>, <yu.c.chen@intel.com>,
	<oliver.sang@intel.com>
Subject: [tip:sched/core] [sched/fair]  33cf66d883: vm-scalability.throughput
 3.9% improvement
Message-ID: <202511251755.6e00cfb9-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0046.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::18) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|BY1PR11MB8031:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cc937e1-8ff4-405f-85fd-08de2c06c3b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?nslMtAQrlMMDWN6fRZsAQ0zT62RDxjJyJh34z2hUZH7u2Up8lQ5+iUkDD2?=
 =?iso-8859-1?Q?/rTGYDFJ9UEM0Ec3FF8GDphZD12am+Ae5SdIJ3EGIUq+HepDwsbP8z0HvB?=
 =?iso-8859-1?Q?FZ8HorF0StipsDqesJNUrhYWCAyxGrVD/0V7GHi++gS8XuPeN2Hthsa5Ie?=
 =?iso-8859-1?Q?ne8Ba4PLuHQJazFQa8Q3iSarYzJTPOGkpYpyJRJCxXwI64sM7nQ6BE3vzb?=
 =?iso-8859-1?Q?a9NeQTJ/4cTp1n7ViJwBSkbHmBf3RjMYtw+aGivI4PXHiSTW8OJfp2iZru?=
 =?iso-8859-1?Q?KTPhLVPWD/JpU8oLBE6TZjgdTSAn9UC858zasCcK3JUAta9Es8gUMjD8sJ?=
 =?iso-8859-1?Q?g3lV98wvgTOrdXRL8qcLu9va2jjyNk1NtIuBwiQVSJw6D9j627fkQP8Q0A?=
 =?iso-8859-1?Q?HToTF9+SApF6U4uu/WHqETZUinpjTKiHSvYlni6yDGYiSv9R3/0jeDKSwd?=
 =?iso-8859-1?Q?hPx1NHVTF/HK1ATdHmTYZRtVCA8sfVFxy5HK4kM3/0Y0AssC9BwAB6B7/r?=
 =?iso-8859-1?Q?tqt1OdOCpnpBI37iARKK1KR9PI5xrFUTjj238kFyylHnoOJf8xq7llDb4V?=
 =?iso-8859-1?Q?jzQDAXjPlNNElm1Z81Ep4e511qEHk+j4RtzYpCK39T4f1DoqH2ixOW/+70?=
 =?iso-8859-1?Q?1LIQpSmEv37Wi3WSXsjJ11Elw9TPtfGO7ZXfLjQCN+qO2uNFxIpbZWq0ZZ?=
 =?iso-8859-1?Q?1Ypd5/QO3Y7hsyM35iv4TaKF6q9ftd37G8OXbATiTNR40YHwY6TubpEAur?=
 =?iso-8859-1?Q?zDlsmSzqNyh9UJu/9Wn7Zr+SLqkcal+RvscIIiLgBa04GS1ZjifSi9hxxi?=
 =?iso-8859-1?Q?b7yNrlArn/LgYWsm5i8bB1bw8abPm0iVHVTZs2cEPp4Hcpg9cSfbPnKEIX?=
 =?iso-8859-1?Q?GCeWZ0RmcTZ7yPF3zHGpP5iCJREiG5C5rsvByf/Jwf9ibGtHlGYTlkpAZD?=
 =?iso-8859-1?Q?Mv2/kcyIYun1RpU2KhKRzAP6rX2Y2NZppfczPNu1Wq8/Fj0s8QR5U6Nfbi?=
 =?iso-8859-1?Q?dCMD3CG2Nf9tpbOQ99Gn0DZfo/B+z6ak6Kxg+swTaNEobQFHLVBF40kwCq?=
 =?iso-8859-1?Q?nt0KYGmeifyw2bJa6xT2DVgXchCQpkZS7ZLkATG9k9FWE1M/5PYunNwPlp?=
 =?iso-8859-1?Q?hWXWkbuCCzEYn+bEWVu8l0WquKcUFAiqVPUvhtZ3CarbRJ/imupLP3mq++?=
 =?iso-8859-1?Q?LRpE5PzbwOCh8HFxAs4NvNOComAT3IX3RNNVkyOYtSJuYPqD1xIaPeRqY+?=
 =?iso-8859-1?Q?JyyvCm40SuHBU1OGkgui+hrHcmWzNBr2sOjHXDCHklHtUcTJbxU8mlR7A2?=
 =?iso-8859-1?Q?OyYUW5wEyT1YR0hZEeQLjaB7bbHpk5ZB90OZOHqUiso1bg60Tx2F6y4Q32?=
 =?iso-8859-1?Q?8XvK2Rqdd4GvPnk2wZmvovuZtmfRlPnZdFnumuvDm4AI7wsh4yrbQj4Bgt?=
 =?iso-8859-1?Q?EkRGcfRJH3yerXFcsEDYsZoYGn98wdxjQBSfOs5Fm9kO/EPApnjy97Rjau?=
 =?iso-8859-1?Q?25KyksUwfzKlkdi6+8BsC9NNhw5uG6rmXEDtOBS7M8hA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?HcxBlKroEshenmldAQtaCXnxzscdse3VcXVmHw6YjdvAzTSnE5wA4W09ka?=
 =?iso-8859-1?Q?MyfiSYQNJ0MqDFy3kYxdZq4lWA0uZ9EyounHr2jVwIkMi0DFQp0+hTqGaO?=
 =?iso-8859-1?Q?He+dzEydeJqyI1jyIiPnFZwgFhEublhJsMHLWk8lfvNex5E2G5+8wYrRDs?=
 =?iso-8859-1?Q?Jb5M68z4pXskiYp6aayZMyMC2qyzKD7vb/YjFKUkmfQHoVLpIVhHExgkHI?=
 =?iso-8859-1?Q?z8jubWzIT3st974OkJtE2rs9EWRS3ZAh0asHYvQKfjms4C8brJsU7JmFZT?=
 =?iso-8859-1?Q?Nw8w7XelHFsnxC19wLIHKB01AQfQCa4kFMWBbRMDC25LEhdLKPrZJBNAAf?=
 =?iso-8859-1?Q?2sbYjrNtwkvXVafF90C8GmiDwQ+8nJ1sV794SAFpWe0fFhNU3m0VDsMbQa?=
 =?iso-8859-1?Q?bugslnFwTePz1JGYVBzVEWED0UUmeuyYAFM9OBIXSdrj2n16hjfgQYjFti?=
 =?iso-8859-1?Q?2FH7cyp+c1AGFupbX/tqeM7Fh3/GTVvxd30t67ImGcDKPVn2fA5y8L4WsU?=
 =?iso-8859-1?Q?Rsd1v0dLbCMcpA1paaiyFVcoFR6Oyjxs68LGZWvPu0nNGHTEDhmKNcc7kD?=
 =?iso-8859-1?Q?1levQf+4KEVqck1qGyJR5QimCpWZvdMRM7AzkOqvNxQa9APBWMCbEwyCj9?=
 =?iso-8859-1?Q?TdyzSr3XMj8RGmeSm+0WCaNUlQtdytwAar+qFEheXpFjNdxexbKKzrApSr?=
 =?iso-8859-1?Q?07Uua2f/82cZZ7IR/xBqtO2curg/SwRkrZl4MzPii1/zyl4+IHahL3jZ8n?=
 =?iso-8859-1?Q?BZqKpL8F7YCMtfs4wx6ChYlJ6zF8uit0Xgtyw2CQsx+8/t9KXweAz63C9Y?=
 =?iso-8859-1?Q?rCbLS0gdpJTGSSigExTRVcVVlSdMydZLA0ZA2zB8y9Q+u6P7fqXuFL3oRs?=
 =?iso-8859-1?Q?fLOjYSiZcn/5M6fLgOB5mMkv841QqpA9NDuIbOiMEtVGa+eS8EPsz703y7?=
 =?iso-8859-1?Q?DbdObr6J0EwuhbqnPXuiY5XRHxVuKBRi2pPBE+o54KAD6hXXdzoUzpOjs7?=
 =?iso-8859-1?Q?/YGM7gtTzmF9EgMP/OoDeraW7I7xNypNy8bXqgCOzgHisqI4ex6A9TxJ0I?=
 =?iso-8859-1?Q?TEjb8p9RIFwnNt9fHdETfMAA9GNjYtztYsWwXm5nsulhLM+5Owpg+CYYWl?=
 =?iso-8859-1?Q?lwozUB/Qnl7H5j/wMWWEPkydvK3z+Bsaio3bxv1O03gLAq2SOspsyjaLE2?=
 =?iso-8859-1?Q?hRPDY9ItYy2QWu9w0rjp0hBFng2ig+Verb1r+5/MTAGCNKn+Y/QLA3Ckma?=
 =?iso-8859-1?Q?vkhXfVxHlJbYJ5c7CotMrqAMXxQVCKpVf6wtbIQSYQdxBg8swjbScz5fNb?=
 =?iso-8859-1?Q?El2q+aoOB80Lv5WlmcY414GVUbNTxSAi960d6QhuG9RRWNr/o6G9QzcbWk?=
 =?iso-8859-1?Q?k6QAeWZh0O4X1enraiZwd6HmmDRi7ys89Bey0M3AnhLOTfspkQKwv8ju3V?=
 =?iso-8859-1?Q?c3u7lUDDwQPBGrCl66rdbT/G1Y7LFg1msq/cju2HNJ2zXZ/IQ2nXsKkka2?=
 =?iso-8859-1?Q?2uV6Plpe07XJgnd7q/0WqTFU5sXTh0rx0KdN0HXHn3uv5G1Xbf1X6DNfVJ?=
 =?iso-8859-1?Q?ywpg1X5XwlWsvIl080ut/ygjXpx37dQ2KK6aFjCfXZVtQeR1PxiJgjfT6V?=
 =?iso-8859-1?Q?LfFxrbEYNhMv5JA4ElqUZem0Exe5HsS06hYPPsOYhHGr2h2YaUx77f6Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cc937e1-8ff4-405f-85fd-08de2c06c3b6
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 09:41:09.9251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wzYaV73Uj+NDi503+Vnk9xkOFfZq5VACfq/eHJSIwAG/ru9CfgDEiPDlQrnV51X67WIHUL4IuTC65l6nIYkQww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8031
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 3.9% improvement of vm-scalability.throughput on:


commit: 33cf66d88306663d16e4759e9d24766b0aaa2e17 ("sched/fair: Proportional newidle balance")
https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git sched/core


testcase: vm-scalability
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 224 threads 4 sockets Intel(R) Xeon(R) Platinum 8380H CPU @ 2.90GHz (Cooper Lake) with 192G memory
parameters:

	runtime: 300s
	size: 8T
	test: anon-w-seq-mt
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+----------------------------------------------------------------------------------------------------+
| testcase: change | vm-scalability: vm-scalability.throughput 6.9% improvement                                         |
| test machine     | 224 threads 4 sockets Intel(R) Xeon(R) Platinum 8380H CPU @ 2.90GHz (Cooper Lake) with 192G memory |
| test parameters  | cpufreq_governor=performance                                                                       |
|                  | runtime=300s                                                                                       |
|                  | size=8T                                                                                            |
|                  | test=anon-w-seq                                                                                    |
+------------------+----------------------------------------------------------------------------------------------------+


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20251125/202511251755.6e00cfb9-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/rootfs/runtime/size/tbox_group/test/testcase:
  gcc-14/performance/x86_64-rhel-9.4/debian-13-x86_64-20250902.cgz/300s/8T/lkp-cpl-4sp2/anon-w-seq-mt/vm-scalability

commit: 
  08d473dd87 ("sched/fair: Small cleanup to update_newidle_cost()")
  33cf66d883 ("sched/fair: Proportional newidle balance")

08d473dd8718e4a4 33cf66d88306663d16e4759e9d2 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    140169 ± 11%     +20.4%     168807 ± 11%  numa-meminfo.node0.Slab
     38.84            +3.1       41.95        turbostat.C1%
     35883 ± 16%     -38.7%      22013 ± 12%  sched_debug.cpu.max_idle_balance_cost.stddev
      0.25 ± 33%     -55.9%       0.11 ± 58%  sched_debug.cpu.nr_uninterruptible.avg
    -89.12           -21.9%     -69.57        sched_debug.cpu.nr_uninterruptible.min
  32696319          +205.2%   99805183        sched_debug.sysctl_sched.sysctl_sched_features
     30.68            -0.4       30.28        perf-profile.calltrace.cycles-pp.do_rw_once
      0.59            -0.0        0.56        perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.do_rw_once
      0.07 ±  8%      -0.0        0.02 ± 99%  perf-profile.children.cycles-pp.schedule
      0.08 ±  6%      -0.0        0.05        perf-profile.children.cycles-pp.sched_balance_rq
      0.08 ±  8%      -0.0        0.06 ±  6%  perf-profile.children.cycles-pp.__schedule
      0.06            -0.0        0.05        perf-profile.self.cycles-pp.___perf_sw_event
      0.05            +0.0        0.06        perf-profile.self.cycles-pp.mas_walk
      0.08 ±  2%     -10.1%       0.07        vm-scalability.free_time
    348488            +1.7%     354569        vm-scalability.median
  93790815            +3.9%   97486053        vm-scalability.throughput
    383366 ±  5%     +27.3%     487878 ±  2%  vm-scalability.time.involuntary_context_switches
     13116            -5.1%      12451        vm-scalability.time.percent_of_cpu_this_job_got
     18386            -4.5%      17565        vm-scalability.time.system_time
     21178            -5.2%      20069        vm-scalability.time.user_time
    274218            -2.3%     267786        vm-scalability.time.voluntary_context_switches
   8334443            -6.2%    7821786        proc-vmstat.nr_active_anon
   8182472            -6.2%    7672252        proc-vmstat.nr_anon_pages
     15772            -6.3%      14776        proc-vmstat.nr_anon_transparent_hugepages
   3714681            +1.1%    3753946        proc-vmstat.nr_dirty_background_threshold
   7438445            +1.1%    7517071        proc-vmstat.nr_dirty_threshold
  37387239            +1.0%   37779422        proc-vmstat.nr_free_pages
  37148190            +1.1%   37546282        proc-vmstat.nr_free_pages_blocks
     17965            -5.9%      16898        proc-vmstat.nr_page_table_pages
   8334431            -6.2%    7821774        proc-vmstat.nr_zone_active_anon
      3.38            -2.0%       3.31        perf-stat.i.MPKI
 6.728e+10            -2.0%  6.591e+10        perf-stat.i.branch-instructions
      0.06            -0.0        0.06 ±  2%  perf-stat.i.branch-miss-rate%
  26644187           -11.1%   23698025 ±  2%  perf-stat.i.branch-misses
     66.58            -1.2       65.43        perf-stat.i.cache-miss-rate%
 7.144e+08            -3.9%  6.868e+08        perf-stat.i.cache-misses
  1.07e+09            -2.3%  1.045e+09        perf-stat.i.cache-references
      8866 ±  2%      +3.7%       9196        perf-stat.i.context-switches
      2.51            -4.4%       2.40        perf-stat.i.cpi
  5.33e+11            -6.2%  4.999e+11        perf-stat.i.cpu-cycles
    665.04            -8.8%     606.57        perf-stat.i.cpu-migrations
    743.32            -2.5%     724.57        perf-stat.i.cycles-between-cache-misses
 2.109e+11            -2.1%  2.066e+11        perf-stat.i.instructions
      0.40            +4.7%       0.42        perf-stat.i.ipc
      3.39            -2.0%       3.33        perf-stat.overall.MPKI
      0.03            -0.0        0.03        perf-stat.overall.branch-miss-rate%
     66.92            -1.2       65.75        perf-stat.overall.cache-miss-rate%
      2.53            -4.6%       2.42        perf-stat.overall.cpi
    746.31            -2.6%     726.93        perf-stat.overall.cycles-between-cache-misses
      0.39            +4.8%       0.41        perf-stat.overall.ipc
  22267708            -8.1%   20466034        perf-stat.ps.branch-misses
 6.891e+08            -2.4%  6.726e+08        perf-stat.ps.cache-misses
      8639            +3.3%       8927        perf-stat.ps.context-switches
 5.143e+11            -4.9%  4.889e+11        perf-stat.ps.cpu-cycles
    624.80            -6.6%     583.36        perf-stat.ps.cpu-migrations


***************************************************************************************************
lkp-cpl-4sp2: 224 threads 4 sockets Intel(R) Xeon(R) Platinum 8380H CPU @ 2.90GHz (Cooper Lake) with 192G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/rootfs/runtime/size/tbox_group/test/testcase:
  gcc-14/performance/x86_64-rhel-9.4/debian-13-x86_64-20250902.cgz/300s/8T/lkp-cpl-4sp2/anon-w-seq/vm-scalability

commit: 
  08d473dd87 ("sched/fair: Small cleanup to update_newidle_cost()")
  33cf66d883 ("sched/fair: Proportional newidle balance")

08d473dd8718e4a4 33cf66d88306663d16e4759e9d2 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
  12868898 ±  8%     -13.6%   11117210 ±  6%  meminfo.DirectMap2M
     22.51 ±  2%      +5.1       27.56        mpstat.cpu.all.idle%
      4570 ±  6%      -8.2%       4195 ±  5%  perf-c2c.DRAM.remote
  32696319          +205.2%   99805183        sched_debug.sysctl_sched.sysctl_sched_features
     25712           +13.8%      29272        uptime.idle
 1.544e+10 ±  2%     +22.7%  1.895e+10        cpuidle..time
  16705139 ±  2%     +21.5%   20304654        cpuidle..usage
   9686016 ±  9%     -11.2%    8601707 ± 10%  numa-meminfo.node0.AnonHugePages
   9810366 ±  9%     -11.5%    8680271 ± 10%  numa-meminfo.node0.AnonPages
      2.08 ± 10%     +38.9%       2.88 ± 14%  perf-sched.sch_delay.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      2.08 ± 10%     +38.9%       2.88 ± 14%  perf-sched.total_sch_delay.average.ms
     22.68 ±  2%      +5.2       27.82        turbostat.C1%
     22.38 ±  2%     +22.6%      27.43        turbostat.CPU%c1
   5618917            -8.7%    5131336 ±  3%  turbostat.NMI
    847.70            -1.8%     832.15        turbostat.PkgWatt
     43.20            -1.3%      42.66        turbostat.RAMWatt
      0.01            -7.0%       0.01        vm-scalability.free_time
    347285            +3.1%     358120        vm-scalability.median
      2.87 ±  5%      +0.5        3.42 ±  9%  vm-scalability.median_stddev%
      7.35 ±  6%      +1.6        8.98 ±  6%  vm-scalability.stddev%
  82530869            +6.9%   88238114        vm-scalability.throughput
    766040 ±  2%      +6.1%     812920        vm-scalability.time.involuntary_context_switches
     16652            -6.7%      15540        vm-scalability.time.percent_of_cpu_this_job_got
     23121            -6.3%      21670        vm-scalability.time.system_time
     27174            -7.0%      25266        vm-scalability.time.user_time
    108375            +3.4%     112073        vm-scalability.time.voluntary_context_switches
   9573443            -7.9%    8820226        proc-vmstat.nr_active_anon
   9381538            -7.9%    8641925        proc-vmstat.nr_anon_pages
     18112            -8.0%      16669        proc-vmstat.nr_anon_transparent_hugepages
   3615325            +1.6%    3673671        proc-vmstat.nr_dirty_background_threshold
   7239491            +1.6%    7356326        proc-vmstat.nr_dirty_threshold
  36406902            +1.6%   36983177        proc-vmstat.nr_free_pages
  36161545            +1.6%   36744053        proc-vmstat.nr_free_pages_blocks
     18649            -5.6%      17609        proc-vmstat.nr_page_table_pages
    145727            -4.0%     139928 ±  2%  proc-vmstat.nr_shmem
   9573428            -7.9%    8820214        proc-vmstat.nr_zone_active_anon
   4676636           -12.0%    4113946        proc-vmstat.numa_huge_pte_updates
 2.395e+09           -12.0%  2.106e+09        proc-vmstat.numa_pte_updates
      3.69            -2.6%       3.59        perf-stat.i.MPKI
  25933220 ±  2%      -7.5%   23983956        perf-stat.i.branch-misses
     72.64            -1.7       70.92        perf-stat.i.cache-miss-rate%
 8.254e+08            -3.3%  7.985e+08        perf-stat.i.cache-misses
      8791            +6.3%       9344        perf-stat.i.context-switches
      3.00            -6.3%       2.81        perf-stat.i.cpi
 6.733e+11            -7.0%  6.262e+11        perf-stat.i.cpu-cycles
    812.82            -3.9%     781.10        perf-stat.i.cycles-between-cache-misses
      0.34            +7.0%       0.36        perf-stat.i.ipc
      3.70            -2.5%       3.61        perf-stat.overall.MPKI
      0.03            -0.0        0.03        perf-stat.overall.branch-miss-rate%
     72.83            -1.7       71.16        perf-stat.overall.cache-miss-rate%
      3.01            -6.2%       2.83        perf-stat.overall.cpi
    814.12            -3.8%     783.11        perf-stat.overall.cycles-between-cache-misses
      0.33            +6.6%       0.35        perf-stat.overall.ipc
  22052951            -7.8%   20340363        perf-stat.ps.branch-misses
 7.949e+08            -2.8%  7.728e+08        perf-stat.ps.cache-misses
      8696            +4.7%       9105        perf-stat.ps.context-switches
 6.471e+11            -6.5%  6.052e+11        perf-stat.ps.cpu-cycles
    569.36            +1.4%     577.21        perf-stat.ps.cpu-migrations
     32.67            -0.9       31.80        perf-profile.calltrace.cycles-pp.do_rw_once
     44.13            -0.4       43.74        perf-profile.calltrace.cycles-pp.asm_exc_page_fault.do_access
     44.00            -0.4       43.62        perf-profile.calltrace.cycles-pp.exc_page_fault.asm_exc_page_fault.do_access
     44.00            -0.4       43.62        perf-profile.calltrace.cycles-pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.do_access
     43.80            -0.4       43.41        perf-profile.calltrace.cycles-pp.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
     43.86            -0.4       43.48        perf-profile.calltrace.cycles-pp.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.do_access
     43.70            -0.4       43.32        perf-profile.calltrace.cycles-pp.__do_huge_pmd_anonymous_page.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault
     43.13            -0.4       42.77        perf-profile.calltrace.cycles-pp.vma_alloc_anon_folio_pmd.__do_huge_pmd_anonymous_page.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
     39.61            -0.3       39.28        perf-profile.calltrace.cycles-pp.clear_page_erms.folio_zero_user.vma_alloc_anon_folio_pmd.__do_huge_pmd_anonymous_page.__handle_mm_fault
     41.47            -0.3       41.16        perf-profile.calltrace.cycles-pp.folio_zero_user.vma_alloc_anon_folio_pmd.__do_huge_pmd_anonymous_page.__handle_mm_fault.handle_mm_fault
      1.33 ± 21%      +1.1        2.48 ± 17%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
      1.34 ± 21%      +1.1        2.48 ± 17%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
      1.33 ± 21%      +1.1        2.48 ± 16%  perf-profile.calltrace.cycles-pp.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter
      1.33 ± 21%      +1.2        2.48 ± 17%  perf-profile.calltrace.cycles-pp.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      1.33 ± 21%      +1.2        2.48 ± 17%  perf-profile.calltrace.cycles-pp.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      1.36 ± 21%      +1.2        2.52 ± 16%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.common_startup_64
      1.36 ± 21%      +1.2        2.52 ± 16%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      1.36 ± 21%      +1.2        2.52 ± 16%  perf-profile.calltrace.cycles-pp.start_secondary.common_startup_64
      1.35 ± 21%      +1.2        2.51 ± 16%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      1.37 ± 21%      +1.2        2.53 ± 16%  perf-profile.calltrace.cycles-pp.common_startup_64
      2.50 ± 21%      +2.2        4.71 ± 16%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.pv_native_safe_halt.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter
     42.55            -0.5       42.01        perf-profile.children.cycles-pp.do_rw_once
     44.04            -0.4       43.65        perf-profile.children.cycles-pp.exc_page_fault
     44.19            -0.4       43.80        perf-profile.children.cycles-pp.asm_exc_page_fault
     44.04            -0.4       43.65        perf-profile.children.cycles-pp.do_user_addr_fault
     43.89            -0.4       43.51        perf-profile.children.cycles-pp.handle_mm_fault
     43.82            -0.4       43.44        perf-profile.children.cycles-pp.__handle_mm_fault
     43.70            -0.4       43.32        perf-profile.children.cycles-pp.__do_huge_pmd_anonymous_page
     43.13            -0.4       42.77        perf-profile.children.cycles-pp.vma_alloc_anon_folio_pmd
     42.23            -0.3       41.88        perf-profile.children.cycles-pp.folio_zero_user
     39.95            -0.3       39.62        perf-profile.children.cycles-pp.clear_page_erms
      0.08            -0.0        0.07        perf-profile.children.cycles-pp.___perf_sw_event
      0.45 ± 12%      +0.1        0.54 ± 12%  perf-profile.children.cycles-pp.drm_atomic_helper_commit
      0.45 ± 11%      +0.1        0.54 ± 12%  perf-profile.children.cycles-pp.drm_atomic_commit
      0.48 ± 11%      +0.1        0.57 ± 13%  perf-profile.children.cycles-pp.worker_thread
      0.45 ± 11%      +0.1        0.54 ± 13%  perf-profile.children.cycles-pp.drm_atomic_helper_dirtyfb
      0.45 ± 11%      +0.1        0.54 ± 13%  perf-profile.children.cycles-pp.drm_fb_helper_damage_work
      0.45 ± 11%      +0.1        0.54 ± 13%  perf-profile.children.cycles-pp.drm_fbdev_shmem_helper_fb_dirty
      0.47 ± 11%      +0.1        0.56 ± 12%  perf-profile.children.cycles-pp.process_one_work
      3.27 ±  9%      +1.1        4.34 ±  9%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      1.34 ± 21%      +1.2        2.49 ± 17%  perf-profile.children.cycles-pp.acpi_safe_halt
      1.34 ± 21%      +1.2        2.49 ± 17%  perf-profile.children.cycles-pp.pv_native_safe_halt
      1.34 ± 21%      +1.2        2.49 ± 17%  perf-profile.children.cycles-pp.acpi_idle_do_entry
      1.34 ± 21%      +1.2        2.49 ± 17%  perf-profile.children.cycles-pp.acpi_idle_enter
      1.34 ± 21%      +1.2        2.50 ± 16%  perf-profile.children.cycles-pp.cpuidle_enter
      1.34 ± 21%      +1.2        2.50 ± 16%  perf-profile.children.cycles-pp.cpuidle_enter_state
      1.36 ± 21%      +1.2        2.52 ± 16%  perf-profile.children.cycles-pp.start_secondary
      1.36 ± 21%      +1.2        2.52 ± 16%  perf-profile.children.cycles-pp.cpuidle_idle_call
      1.37 ± 21%      +1.2        2.53 ± 16%  perf-profile.children.cycles-pp.common_startup_64
      1.37 ± 21%      +1.2        2.53 ± 16%  perf-profile.children.cycles-pp.cpu_startup_entry
      1.37 ± 21%      +1.2        2.53 ± 16%  perf-profile.children.cycles-pp.do_idle
     40.98            -0.6       40.37        perf-profile.self.cycles-pp.do_rw_once
     39.02            -0.3       38.71        perf-profile.self.cycles-pp.clear_page_erms
      0.99            -0.0        0.94        perf-profile.self.cycles-pp.folio_zero_user
      0.44 ± 12%      +0.1        0.53 ± 12%  perf-profile.self.cycles-pp.memcpy_toio
      1.24 ± 21%      +1.1        2.34 ± 16%  perf-profile.self.cycles-pp.pv_native_safe_halt





Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

