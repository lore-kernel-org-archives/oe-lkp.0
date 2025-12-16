Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB91F339701
	for <oe-lkp@lists.linux.dev>; Tue, 16 Dec 2025 07:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765871063; cv=fail; b=lZwjTv6uTQjNMVVOvZ3nfVSHMDpjueBvSWi6EExuVfcXp13prnzhXICZd2nLgEt6wVsD74NsMql2ytppB0ILNkWC6dwBevtJc2ZthcPxarfvYTbv/XQh/njCMedYT2YkHk5jEeh9WH7fEvqG83BH6o+RJaocfB3/B/i2tvfC5wA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765871063; c=relaxed/simple;
	bh=QVitVzvKnvuwftZnY+LFDRKXabBlBjFr8kWM86wsv0o=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=c2AuHvxhGU/Ec+UOpMLwn2/8wcMu+ZanThhEh/YShcZZzDQ+mdbM0+QVrzVtqh0OGcSE06qe66ZcJDugrxfRbZlDcHuyn6XwU1mBnF9JsMJeGY8ZmRUh3j09r7fuZ2LptClMcjyOD13jTi1I2s1gwRhnycZ2dfYVJXS0/eNOg48=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iAPB6rmO; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iAPB6rmO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765871061; x=1797407061;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QVitVzvKnvuwftZnY+LFDRKXabBlBjFr8kWM86wsv0o=;
  b=iAPB6rmOyd6clnNN5E6G3ifbJF7JxMeEhPJJ1sHgjgPpCrRmZ/Zdp58u
   SE+c1PJCroPwJAGPRHT/ZgUFezrr2twsjQP1cI1SeBXBlDTY06dunptS3
   xeYBzJcgTYr7gETmjY/DQCfWFKo4a2GhZzJ1VqPYrB4cGvtaXtWbrYN6a
   WfZ84MffCJYX1WC0gxSWeb06CfBJbkcIOZc/+yvBDFQDACDiRNC88Y6JN
   cvxyHGYUheaOjHOirpBfkMrHVOwlwnYizdBxNU6AEfbOtHays4co9u4dW
   pPDUMRBp+MuH+6G4b+mmrRunr1MY9u0IvVle/Xcysh89NxlomTw1DRQAR
   Q==;
X-CSE-ConnectionGUID: n4GkL4jLRuGNH47hzRl8AQ==
X-CSE-MsgGUID: NqXXeN7QQ8OnyqOBt0vUzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="55351419"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="55351419"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 23:44:20 -0800
X-CSE-ConnectionGUID: u+9aFfJPSYyc0TUs6Dd9/A==
X-CSE-MsgGUID: Y7Xok1fATqGs+YGnxrGB9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="202358304"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 23:44:20 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 23:44:19 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 23:44:19 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.4) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 23:44:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TJ7baAZ5W2dIoTsCJgTCEfWE0e7g8hw6LWqukKU7du34NwqZkT3Ih+InxOwNac377+NEPbRjPWmo6XRnxprUqKx8MOZOQphHeGIbJ2toiSb+LgY6IBnt0hfWrnMPUBFhGK3FdSyyg01uJbX6J9VZHGp15zP1vmqvIPXKJokqXDuBJOnbNGKplpVHd93LsPZqolQdywx32v9cIQ4Q7MzjT28BEoRXApIeVzpMT6kC09Y2+tzDFOKKywI5vx+F8bFqR56KVPycAvshLm+XA9W2AbKww5pd5a9kk/q7wNv77ByHH9l++DDYo4zyyxLjCiiHL56vwWWHWBqYuMGJ34ygvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=okAZMxgggnVjsXvRimmDc+QutGd1gAvHzskeazCXgVk=;
 b=GANeYvE7l4q+PO9PFQKkDe1TsD9S05obKQqDr7cn4y27gs23ugGB5tJF5NCMtqurs2Bbx5zKn671lI7dnIVN1tJxBiyG7MQiSUnQhe/a0er1G1frEfyxI7IUjVwkTKPLszFUYZ5DIQ1xN85U+D3iZJ4RFNqjSQLrCAH2xt7yPaXzAJXxlSWn2+bGySCc78BkgGriump9ADOSSI59DwzbYNB3acHDSwNQ5PDCQIMtZdn8kEyiGKAmAXak4r1omHdvLX/PnARUN9/8z/PQrf81qGZ7IkhOT/ZnGjqPONeMbJ5Yl+E5fus6AmQeelb1QANh0CVllD7Bhxulvuab1UkD1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SN7PR11MB7603.namprd11.prod.outlook.com (2603:10b6:806:32b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 07:44:14 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 07:44:12 +0000
Date: Tue, 16 Dec 2025 15:43:59 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Pingfan Liu <piliu@redhat.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Tejun Heo <tj@kernel.org>, Waiman Long <longman@redhat.com>, Chen Ridong
	<chenridong@huaweicloud.com>, Peter Zijlstra <peterz@infradead.org>, "Juri
 Lelli" <juri.lelli@redhat.com>, Pierre Gondois <pierre.gondois@arm.com>,
	"Ingo Molnar" <mingo@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel
 Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
	<aubrey.li@linux.intel.com>, <yu.c.chen@intel.com>, <oliver.sang@intel.com>
Subject: [linus:master] [sched/deadline]  318e18ed22:
 BUG:soft_lockup-CPU##stuck_for#s![swapper:#]
Message-ID: <202512161547.cd3a9187-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: KL1PR01CA0071.apcprd01.prod.exchangelabs.com
 (2603:1096:820:5::35) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SN7PR11MB7603:EE_
X-MS-Office365-Filtering-Correlation-Id: 1979a6b6-6522-495f-6c9c-08de3c76e7c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+XfqXcGBBBnaaSHraKH7Thx4gX6Rp41wbl1Kc/RH+LOJa/rOgNNr/ooADBsZ?=
 =?us-ascii?Q?M0h5+GNAE4Ds3UKjDDWQEv3wj4rYp8jbAKfODnfakbjps2Ojc4ZuurFA93Oa?=
 =?us-ascii?Q?cMhkO5dKAXTRk8wWJFFmk10+ldTq+zRf2jc6BeE6FZK+kjqkuuMeC44bQzdQ?=
 =?us-ascii?Q?FfaYL6OXkps2p3+pDIZMt7llQDSRAPsWr3gl4hKKa31lj8IbRlFUBU0MzbwM?=
 =?us-ascii?Q?BZYVjrpc8VpDrsdfTL19uJXbnHgVgQmBJ21c4ObzKjdPGOr+zS6tOE18pabZ?=
 =?us-ascii?Q?RNxlXZr5qVjKW9lCiNQcSKhyo8Z0p/cqiXSR+47ubc3pCdgPSkqS/dgCjDR3?=
 =?us-ascii?Q?5FJHMAJ3zc9b4Xn0e32CxvQbHjiaoBG8sH7IKPle5uY5qr/m2H8OBplO11HK?=
 =?us-ascii?Q?/tF6AmsTldXE9VJRjkW2flpM678t/ZxSlyIDjnyMbjJAOMvkh7TW2ALn95RN?=
 =?us-ascii?Q?L1tgPNw7FJT6hzNSa6QoyjmN66BPlbyi5jG/n4ALEct2c92ZiTm6cuXqbhHh?=
 =?us-ascii?Q?5xT9IS31zcU8my9L857X4ParJGg/QP0NE36XeX7VQuG6Pjlm+nghEJvZHDNz?=
 =?us-ascii?Q?FMfzu7ZADAyp5lVFA6maPPYqAOo5fdgVvSWUXZtBOyPo75hFoL01ILjJpLi/?=
 =?us-ascii?Q?G2vdvlAew4+ARlIb7goAEb0CYGzR8J+SbKmtPYUdw5Wgx0eVHuAUzeCnnZGm?=
 =?us-ascii?Q?AZBbUJcXNOAisNTmgo3b4KAi5Tz8dKbALS3QFkf16IaKQyfy+QNdm0/C8Z8t?=
 =?us-ascii?Q?lQnD/F8Lt8qgyOy7H5fVs8If1UBuKlETz2pF77yV4Epbe4TvddxZqsDjoufN?=
 =?us-ascii?Q?krs+Imf8jUilJZAD9RJTQ//odFl3TB419zUyjS2Am0jkr7/Q1wDKx9tDbHjY?=
 =?us-ascii?Q?E1UC4IqwJingQgWsAEX/wVHv61xoithqrDmybq5aML6B/kG2hU+foovRVXyO?=
 =?us-ascii?Q?4nOaNwiGpqYPYKGu9doR1NW0P7TAWL01iOGObue/zsFZmwLJXuqfAzwY98/1?=
 =?us-ascii?Q?18Z/IA8ziF3Uk5VCMHTDStiQyyrXcn7mkJD8CcN+ZvikHReAenLYz1Z2TAgx?=
 =?us-ascii?Q?AqFCb/YTqiyoTWmfsuQ7ewSoKSi0SqLPQuN4Eo4yE6vLvDmD9u6hLxxCVPz1?=
 =?us-ascii?Q?aWwv6wuhyPYn1T3tlgU64wOTSpfm9x4lV/1hB3v8iPOSXJXjC48Sn0cRDGCC?=
 =?us-ascii?Q?6fV32L3X8dxiNnSgxYNZwvqWGlCBDM9+lRqAcu3AHm1kqKOwxfG5MEDARuGp?=
 =?us-ascii?Q?bUPgjD/CMOvn97lgQv6S7XpXxYQtbWMebvIcdKAloAN6Y6Atg3cj5NEqJGpx?=
 =?us-ascii?Q?suAK8huLPpAF3lOWzp43HPAUH01mhzTbglSEARvXSLmCNEP51y3GtVNWnqmR?=
 =?us-ascii?Q?Zeqa7Y66US0e6kAn/TezIxnnspUCFI0nmdX5cUfJfM+3/ixpxKn5IiLlLlxl?=
 =?us-ascii?Q?ir1nmfR56CAD+sbkQBtI/0YajGWr/Kg4+c9gcMVaQ9EyE+rGdPkwOg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RUD00U/P08L3Vpmuc4B/KSka3tzv7YFQOYRtfCU5wq5CAP61/g/HvKaZQEeZ?=
 =?us-ascii?Q?n5coiwWZYlII22cBBSt28lkx57C0p6wFdAaxBYH2VyUNMBA5UEFDHpIv+iEZ?=
 =?us-ascii?Q?oHPhkfT+vD1m5tNTuy6YbnjQ3/uCocVkU2RLfRFs1CuJI98Mmztu8XQEeUdO?=
 =?us-ascii?Q?DyvKYiEDDJUewO7T3Knq9ZKFsyT7qVj8fhUim9pgM/TjYS60dz1Lo7ikJfam?=
 =?us-ascii?Q?JZzcMMBEtXxhmhqDL3o6MF5/IpJ8Jw0M75q/HhyTeB9qBFajcbkLg7k3dBvs?=
 =?us-ascii?Q?cIhB/UN5EI6vmpIZfTuSyaB4SjyY/PBXrWOVlGJMnlYBdcJlCPMgUuE2L2Tv?=
 =?us-ascii?Q?JqrFzidPPu0gsUdquOWnbWE9S718n95uP8J/pGKYK49/ZZ2K4a9zbpmirn94?=
 =?us-ascii?Q?29LCRYK/y4Nl6+LM+l4vXBT/6gr0bb6yDQvK96qtung+Tu5sTZ4CgEmte1OP?=
 =?us-ascii?Q?xyhG1d1jOSzrjIFp7pR5ljvFngN4T0mU6IF5JiUJJ9rINAVDOSYR+EpnXZlz?=
 =?us-ascii?Q?HBeqiPx+kpsqfswx91CLaEqqSnUiropI9fB7ar7HpXh+Vz7e1jLpGR73Jruk?=
 =?us-ascii?Q?WHX+zo1O3teXikBZgXIjBaARJ01XyIygcVu4KSbOy+4CnqgN0AsPdBp8qiaJ?=
 =?us-ascii?Q?rJ6Uq4It3OyQgPHg6rhdJSs72WFaV101GtK6KoUsrtbuvmvVF9NKqZOCvTSx?=
 =?us-ascii?Q?uFaR7eJAamzday3wRQkGycbrVokkfKc80MZg1Vi+cmr6vfaQYCu99prY0O+n?=
 =?us-ascii?Q?PvNMDSBLo7SfgeqZek5VKwRWawsH5wPWfcJHdl4HK2lTOqoc3988qXcjeyH2?=
 =?us-ascii?Q?2uFtUy7CnSpbnSVZCa7E7uOPFlmD9gsya3yO6Nv8tPZ/7yvcwXQswsm6S/iF?=
 =?us-ascii?Q?vkyTIK2F9wb9aF4JGdrhAmfsRRz0o6qIcX4xwP+Hmbow5ijAeFfjjWgbiNsc?=
 =?us-ascii?Q?XedYwGiUz7gDlAEMTabauPz+HxGccCqLq85a7saATiDXHa+6NDzZIMYqlt/V?=
 =?us-ascii?Q?vKQDezWOwPNcuNNOXkD7vvxntfliIUc7T9qVz6qUe3JEYJOnKHZkpFkbkjOY?=
 =?us-ascii?Q?yH5ykex8OzhpPUyepecONi+EEOWsefzYCRjoy+HyaQXFQbtqGlza5td5XFc4?=
 =?us-ascii?Q?rHGXxH4329P1o2gn7f6/4RDVkmOZE2p0mwnWpuVv2cAtSt4OZcUyV+Nv3jwn?=
 =?us-ascii?Q?mEx0/Ey644X0ootYbZhiysuR07rkUHSZuO6HbymAj34usd4rOXRkXmbUhpjs?=
 =?us-ascii?Q?0KmtorvM/YvAsSZL7pEXsVL1mqTXuvv7YqxgPsmEXwHZUR7ZQgfoMo6h89p5?=
 =?us-ascii?Q?6lo85cmuqXVnco9GYrUB1uffA7t5E80ex3BAwg6RwhZXPDAHqrXqVhnU8m0h?=
 =?us-ascii?Q?ggSJThdWPgKCx9Ss9I1HXUnw+bO2q5GD/UlQV4NU/wpgthP3EhSE0yTdGSDq?=
 =?us-ascii?Q?tstQm8n9V7fAXLzqiiMfJg7UnqmGKRAVZzDpbTn35VOdP6vAXcaWapYvLKnJ?=
 =?us-ascii?Q?rW8VGiZSOrjfRQ1svQ2QjHsGMncZGAdsSe9RzUKqbq5GeNU2H64FIwqBCle6?=
 =?us-ascii?Q?o68K1flSnRpcpjGqwjR0JKHxf0oFXVSE/fU2hCwqrWRA/7gzrer5w0yszILh?=
 =?us-ascii?Q?dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1979a6b6-6522-495f-6c9c-08de3c76e7c5
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 07:44:12.8757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nUl+paAn5KkDoqU5Ty1kFupT6Y2gsU44A1X/cJXjXY2EbmHXJsSxH5CoDARk+IoH5Qcb7Jxfa3P3J1pMTW84fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7603
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:soft_lockup-CPU##stuck_for#s![swapper:#]" on:

commit: 318e18ed22e89397635e15095c014accaf47ed30 ("sched/deadline: Walk up cpuset hierarchy to decide root domain when hot-unplug")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[test failed on linus/master      d358e5254674b70f34c847715ca509e46eb81e6f]
[test failed on linux-next/master 5ce74bc1b7cb2732b22f9c93082545bc655d6547]

in testcase: trinity
version: trinity-static-i386-x86_64-f93256fb_2019-08-28
with following parameters:

	runtime: 300s
	group: group-03
	nr_groups: 5


config: i386-randconfig-r071-20250410
compiler: gcc-14
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G

(please refer to attached dmesg/kmsg for entire log/backtrace)


we don't have enough knowledge to analyze the relation between the change
and the issue, so we run tests up to 1000 times. the issue can be reproduced
65 times out of 1000 runs. while parent always keeps clean.

=========================================================================================
tbox_group/testcase/rootfs/kconfig/compiler/runtime/group/nr_groups:
  vm-snb/trinity/openwrt-i386-generic-20190428.cgz/i386-randconfig-r071-20250410/gcc-14/300s/group-03/5


1f382215119a0bc1 318e18ed22e89397635e15095c0
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :1000         8%          82:1000  dmesg.BUG:kernel_hang_in_boot_stage
           :1000         7%          69:1000  dmesg.BUG:soft_lockup-CPU##stuck_for#s![swapper:#]   <----
           :1000         8%          82:1000  dmesg.BUG:workqueue_lockup-pool
           :1000         7%          69:1000  dmesg.EIP:tick_clock_notify
           :1000         2%          15:1000  dmesg.INFO:rcu_preempt_detected_stalls_on_CPUs/tasks
           :1000         5%          53:1000  dmesg.INFO:task_blocked_for_more_than#seconds
           :1000         7%          69:1000  dmesg.Kernel_panic-not_syncing:softlockup:hung_tasks



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202512161547.cd3a9187-lkp@intel.com


[  699.774873][    C0] watchdog: BUG: soft lockup - CPU#0 stuck for 626s! [swapper/0:1]
[  699.775553][    C0] CPU#0 Utilization every 96000ms during lockup:
[  699.775553][    C0] 	#1:  26% system,	  0% softirq,	  0% hardirq,	  0% idle
[  699.775553][    C0] 	#2:  25% system,	  0% softirq,	  0% hardirq,	  0% idle
[  699.775553][    C0] 	#3:  25% system,	  0% softirq,	  0% hardirq,	  0% idle
[  699.775553][    C0] 	#4:  34% system,	  0% softirq,	  0% hardirq,	  0% idle
[  699.775553][    C0] 	#5: 100% system,	  0% softirq,	  0% hardirq,	  0% idle
[  699.775553][    C0] Modules linked in:
[  699.775553][    C0] irq event stamp: 201566
[  699.775553][    C0] hardirqs last  enabled at (201565): timekeeping_notify (arch/x86/include/asm/irqflags.h:42 arch/x86/include/asm/irqflags.h:119 arch/x86/include/asm/irqflags.h:159 include/linux/stop_machine.h:172 include/linux/stop_machine.h:179 kernel/time/timekeeping.c:1634)
[  699.775553][    C0] hardirqs last disabled at (201566): sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1052)
[  699.775553][    C0] softirqs last  enabled at (200324): handle_softirqs (kernel/softirq.c:469 (discriminator 2) kernel/softirq.c:650 (discriminator 2))
[  699.775553][    C0] softirqs last disabled at (200309): __do_softirq (kernel/softirq.c:657)
[  699.775553][    C0] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.18.0-rc2-00020-g318e18ed22e8 #1 PREEMPT(full)
[  699.775553][    C0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[  699.775553][    C0] EIP: tick_clock_notify (arch/x86/include/asm/bitops.h:55 include/asm-generic/bitops/instrumented-atomic.h:29 kernel/time/tick-sched.c:1633)
[  699.775553][    C0] Code: 8b 45 e4 89 1d 24 d5 6a 83 a3 38 d5 6a 83 89 15 3c d5 6a 83 83 c4 10 5b 5e 5f 5d c3 2e 8d b4 26 00 00 00 00 8d b6 00 00 00 00 <80> 0d 44 d5 6a 83 01 c3 2e 8d b4 26 00 00 00 00 80 0d 44 d5 6a 83
All code
========
   0:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   3:	89 1d 24 d5 6a 83    	mov    %ebx,-0x7c952adc(%rip)        # 0xffffffff836ad52d
   9:	a3 38 d5 6a 83 89 15 	movabs %eax,0xd53c1589836ad538
  10:	3c d5 
  12:	6a 83                	push   $0xffffffffffffff83
  14:	83 c4 10             	add    $0x10,%esp
  17:	5b                   	pop    %rbx
  18:	5e                   	pop    %rsi
  19:	5f                   	pop    %rdi
  1a:	5d                   	pop    %rbp
  1b:	c3                   	ret
  1c:	2e 8d b4 26 00 00 00 	cs lea 0x0(%rsi,%riz,1),%esi
  23:	00 
  24:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
  2a:*	80 0d 44 d5 6a 83 01 	orb    $0x1,-0x7c952abc(%rip)        # 0xffffffff836ad575		<-- trapping instruction
  31:	c3                   	ret
  32:	2e 8d b4 26 00 00 00 	cs lea 0x0(%rsi,%riz,1),%esi
  39:	00 
  3a:	80                   	.byte 0x80
  3b:	0d 44 d5 6a 83       	or     $0x836ad544,%eax

Code starting with the faulting instruction
===========================================
   0:	80 0d 44 d5 6a 83 01 	orb    $0x1,-0x7c952abc(%rip)        # 0xffffffff836ad54b
   7:	c3                   	ret
   8:	2e 8d b4 26 00 00 00 	cs lea 0x0(%rsi,%riz,1),%esi
   f:	00 
  10:	80                   	.byte 0x80
  11:	0d 44 d5 6a 83       	or     $0x836ad544,%eax
[  699.775553][    C0] EAX: 0003135d EBX: 8322ef00 ECX: 00000006 EDX: 82f6bcac
[  699.775553][    C0] ESI: 00000200 EDI: 836ac3e0 EBP: 84c97ed8 ESP: 84c97ebc
[  699.775553][    C0] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00000202
[  699.775553][    C0] CR0: 80050033 CR2: ffdaa000 CR3: 03aeb000 CR4: 000406d0
[  699.775553][    C0] Call Trace:
[  699.775553][    C0]  ? timekeeping_notify (kernel/time/timekeeping.c:1636)
[  699.775553][    C0]  __clocksource_select (kernel/time/clocksource.c:1069 (discriminator 1))
[  699.775553][    C0]  ? boot_override_clock (kernel/time/clocksource.c:1101)
[  699.775553][    C0]  clocksource_select (kernel/time/clocksource.c:1086)
[  699.775553][    C0]  clocksource_done_booting (kernel/time/clocksource.c:1110)
[  699.775553][    C0]  do_one_initcall (init/main.c:1283)
[  699.775553][    C0]  ? rdinit_setup (init/main.c:1331)
[  699.775553][    C0]  do_initcalls (init/main.c:1344 (discriminator 3) init/main.c:1361 (discriminator 3))
[  699.775553][    C0]  kernel_init_freeable (init/main.c:1597)
[  699.775553][    C0]  ? rest_init (init/main.c:1475)
[  699.775553][    C0]  kernel_init (init/main.c:1485)
[  699.775553][    C0]  ret_from_fork (arch/x86/kernel/process.c:164)
[  699.775553][    C0]  ? rest_init (init/main.c:1475)
[  699.775553][    C0]  ret_from_fork_asm (arch/x86/entry/entry_32.S:737)
[  699.775553][    C0]  entry_INT80_32 (arch/x86/entry/entry_32.S:945)
[  699.775553][    C0] Kernel panic - not syncing: softlockup: hung tasks
[  699.775553][    C0] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G             L      6.18.0-rc2-00020-g318e18ed22e8 #1 PREEMPT(full)
[  699.775553][    C0] Tainted: [L]=SOFTLOCKUP
[  699.775553][    C0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[  699.775553][    C0] Call Trace:
[  699.775553][    C0]  dump_stack_lvl (lib/dump_stack.c:122)
[  699.775553][    C0]  dump_stack (lib/dump_stack.c:130)
[  699.775553][    C0]  vpanic (kernel/panic.c:487)
[  699.775553][    C0]  panic (kernel/panic.c:626)
[  699.775553][    C0]  watchdog_timer_fn (kernel/watchdog.c:753)
[  699.775553][    C0]  __hrtimer_run_queues+0x125/0x1e0
[  699.775553][    C0]  ? schedule_work (drivers/usb/core/hub.c:925)
[  699.775553][    C0]  hrtimer_run_queues (kernel/time/hrtimer.c:1999)
[  699.775553][    C0]  update_process_times (kernel/time/timer.c:2416 kernel/time/timer.c:2472)
[  699.775553][    C0]  tick_periodic (kernel/time/tick-common.c:103)
[  699.775553][    C0]  tick_handle_periodic (kernel/time/tick-common.c:144)
[  699.775553][    C0]  ? vmware_sched_clock (arch/x86/kernel/apic/apic.c:1052)
[  699.775553][    C0]  __sysvec_apic_timer_interrupt (arch/x86/include/asm/trace/irq_vectors.h:40 (discriminator 4) arch/x86/include/asm/trace/irq_vectors.h:40 (discriminator 4) arch/x86/kernel/apic/apic.c:1059 (discriminator 4))
[  699.775553][    C0]  sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1052 (discriminator 2) arch/x86/kernel/apic/apic.c:1052 (discriminator 2))
[  699.775553][    C0]  handle_exception (arch/x86/entry/entry_32.S:1055)
[  699.775553][    C0] EIP: tick_clock_notify (arch/x86/include/asm/bitops.h:55 include/asm-generic/bitops/instrumented-atomic.h:29 kernel/time/tick-sched.c:1633)
[  699.775553][    C0] Code: 8b 45 e4 89 1d 24 d5 6a 83 a3 38 d5 6a 83 89 15 3c d5 6a 83 83 c4 10 5b 5e 5f 5d c3 2e 8d b4 26 00 00 00 00 8d b6 00 00 00 00 <80> 0d 44 d5 6a 83 01 c3 2e 8d b4 26 00 00 00 00 80 0d 44 d5 6a 83
All code
========
   0:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   3:	89 1d 24 d5 6a 83    	mov    %ebx,-0x7c952adc(%rip)        # 0xffffffff836ad52d
   9:	a3 38 d5 6a 83 89 15 	movabs %eax,0xd53c1589836ad538
  10:	3c d5 
  12:	6a 83                	push   $0xffffffffffffff83
  14:	83 c4 10             	add    $0x10,%esp
  17:	5b                   	pop    %rbx
  18:	5e                   	pop    %rsi
  19:	5f                   	pop    %rdi
  1a:	5d                   	pop    %rbp
  1b:	c3                   	ret
  1c:	2e 8d b4 26 00 00 00 	cs lea 0x0(%rsi,%riz,1),%esi
  23:	00 
  24:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
  2a:*	80 0d 44 d5 6a 83 01 	orb    $0x1,-0x7c952abc(%rip)        # 0xffffffff836ad575		<-- trapping instruction
  31:	c3                   	ret
  32:	2e 8d b4 26 00 00 00 	cs lea 0x0(%rsi,%riz,1),%esi
  39:	00 
  3a:	80                   	.byte 0x80
  3b:	0d 44 d5 6a 83       	or     $0x836ad544,%eax

Code starting with the faulting instruction
===========================================
   0:	80 0d 44 d5 6a 83 01 	orb    $0x1,-0x7c952abc(%rip)        # 0xffffffff836ad54b
   7:	c3                   	ret
   8:	2e 8d b4 26 00 00 00 	cs lea 0x0(%rsi,%riz,1),%esi
   f:	00 
  10:	80                   	.byte 0x80
  11:	0d 44 d5 6a 83       	or     $0x836ad544,%eax


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20251216/202512161547.cd3a9187-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

