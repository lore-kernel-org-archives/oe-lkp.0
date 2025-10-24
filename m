Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61111FC3
	for <oe-lkp@lists.linux.dev>; Fri, 24 Oct 2025 05:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761283781; cv=fail; b=TLO7aEZXnPk0AO26TzT2b8SPFrgfPN/8+riuryQmoZDZ/wL11i+iavOPKZS+rS1ZlBPH5wl51e3lW6QwMyBzBNJpIo8w5GjXAccgZ8syTnPi5ehHDM9zZ50FTclEvHjNGOSSyHPwckaP1doLWRXXMF8KJWcQEpAXUQhHYE5QhMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761283781; c=relaxed/simple;
	bh=7pYnNLtG+rGI+NpilOcLujgW7ynbsR81POVJDP6eNU4=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=P/9YCs/+qLnkfBmdeHTryU0a5LsHdx1kDzoQ0mWFR7NypEubJfMTNozOYAP4kiSYUxdm/0nv38djHN4XHIC0yWomX9//EtrxJvTWwMSy0/7k2CfWr6kCdq3EaMc8lG/UZG4oolMv89WK/NpczFODGeDkjWok8Si21fKEA5ZdpTM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kd69w4YC; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kd69w4YC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761283772; x=1792819772;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=7pYnNLtG+rGI+NpilOcLujgW7ynbsR81POVJDP6eNU4=;
  b=kd69w4YC3PZ0Pm5bwLHrdu3JY2d7I9OzD2+D6YphRmeYVCPRgXJl1ePi
   X30L808FTd401JWp+kbo5mNvCuCnP8DwoikbYRY6+qAIZsokqJ72gk2ua
   eHYpZYNlGEoBPc9Jj4SwMfC21OwKRDbzolKk/Ons++Oe2J4+isLYhmd23
   L+v11NdacPHWwXESjFXC9xOi8Nk4jQ/aAAA1QFRC247HzjAXjSuvpyPRW
   SN9nj8ajEhgHh/XZp09cnS90ZOycV2qQ0lih6C5Wlyaizb4P5UZf74l9z
   6ykIZK6MNfHVn97E2XMt0vle/RIXz575LeDEOey9gIYFgDwU20zNRnnA/
   A==;
X-CSE-ConnectionGUID: 2lWz/8bASNO034owrWRgpw==
X-CSE-MsgGUID: fYY3iDVNQ0eoHw07ZuPDdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67328880"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="67328880"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 22:29:32 -0700
X-CSE-ConnectionGUID: 8gQfHV9bQGScLpgjFQUPyQ==
X-CSE-MsgGUID: ajZK3v72SNGkzbKpvf4WgQ==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 22:29:32 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 22:29:31 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 22:29:31 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.23)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 22:29:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DOyYUBrg4gEa7YcUdUrQjZKeuNo7kBBZ4buc8k5mfAJWURJVUuGn4/fK0oh+eumkinmkzNfzUnS9rkSdpVAnVkePEFCzgOX5387kjZTe5pfElZx72TErmoGh84rzhy+w4mqPZB6WtlHE85+htu23cWIIrntz4AA8P4RIFBhjgbFPmMHdupunA29KsR7Y9ZEYqqfWNDaGaG0VbeLcv0B5eKY4UoTmevULIeydW5X5AfSKFl3n7WSPyUfQrdzStPt5N12+j0flyeZWMDFxlJ8Ivnksalrj+QW+21gfprcpMFk3Rhb9rOpM64poxYiDX+533QcNVTywD2vhJgmkC/0RUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZV5zSwXaRFhhuDnkqk+q337HwoorAobww5MU7JRIfKA=;
 b=q/FsVxFsmBdDM5HdxxkvA6GGqKW4o/2Y+1G9pIRVEes7jD48E73MT5CKzee5rmPEWSz5CsfcN2fZCBBjFN0Jw+ImcJXgeubRU5N9NoWVaodndA6pbUnLooqrDJLnoHqqAZLMtM0Tscl7nq1pMfg+cGcs1ardjT8ep/i/cg3OahIVZqq2hqfpHxFdLoVrAT/WDcVjbw5bWtjbPSL8WcWoHbhqSNHKb4kccG1iE329Xd2QfKzu3pzFC9Ocdv7IsQ2gtjLDW/3Jr8GMzMNwExMsDglxR+Sg3gLG9jJgfVmKwG4EZ3zSWhs1Ov28WANA/CLjy40nXM86tqseBP3FtxXSrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MN2PR11MB4599.namprd11.prod.outlook.com (2603:10b6:208:26d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 05:29:28 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 05:29:28 +0000
Date: Fri, 24 Oct 2025 13:29:20 +0800
From: kernel test robot <oliver.sang@intel.com>
To: <jason.zeng@intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [bytedance:5.15-velinux] [sched/fair]  7e2540f462:
 hackbench.throughput 117.8% improvement
Message-ID: <202510241342.e994fd3c-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KU0P306CA0033.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:29::15) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MN2PR11MB4599:EE_
X-MS-Office365-Filtering-Correlation-Id: e21e7d06-f3c6-4d87-d12b-08de12be4ce4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?6a/BATXpgNos2MrWn43WJafZmuH9hgQxVz8df0tkt3eGxpEiQC0dRJSphi?=
 =?iso-8859-1?Q?yPlr9krzO/EfqRRBS9iipPqXvzxCV81AadiBywn/uBk09qlNwh2uSarBtg?=
 =?iso-8859-1?Q?w9FF5r5wFPjtBDdC2iiAUYZN1c2TRGj+NHtlHX45ipFVjoqvqb2oW5JFrP?=
 =?iso-8859-1?Q?BN0ErJNWCnH3F5ZXyAnGlRv3fCUzZOAwRRiZ0IN5WDtC2UGucQT+r1F+0j?=
 =?iso-8859-1?Q?328of76Y77kcqMPLRE0yWwnnoE5cBZQJN9y8wQdwO5ZT7njYXu6xFRNoxu?=
 =?iso-8859-1?Q?bSLRNSEn7oZJvbZTuqjWBLKkPJOP3sYM+JEIVaCaaG3/mHrRPu/bZ3Uz4t?=
 =?iso-8859-1?Q?DquqHlXE2VZaUj2jh6ZcLrg13a8nuKhn46aP4rfQ0mK8WTEld3Yd0h3vNu?=
 =?iso-8859-1?Q?tzZ7BW7wKJVbOTtfgTfq5h/ySTAH/9TvYr2R1LpJjVzclmnaStAqvNhL+M?=
 =?iso-8859-1?Q?A6Gmpmxg1pEgzIMIP9cDHGwAPNlHeI5c55WhCjVcYkjBAakXfFIS3yQio6?=
 =?iso-8859-1?Q?VuiYqPl7kVpHTW1fBX7FMxljx8xT48x+dhcV8S9GyA0LDisbJr7WP6AorG?=
 =?iso-8859-1?Q?FRvE/HRdM4FWRZxV/4hid3zRexG6lH6n76KN6wNdLo5KbYLtRn3Y818jaF?=
 =?iso-8859-1?Q?/m09lB3czSwfITt8rhSXfXvnRaWQIHny2R1TEjKZtmUB8yn/5ccOE8E5+Y?=
 =?iso-8859-1?Q?rUNifDKNifhx8kFnCDxCpMGSTBiHd68t9viX9o0hwHiniYQJJ3fcIb0TZQ?=
 =?iso-8859-1?Q?qFhqkJb7Rl+mW4q7m+P3k9LTTDiGocyPw4lN5zpFGyRzoCNSjEptF3Vlko?=
 =?iso-8859-1?Q?CyZN+5EnO+7K+s/jSt6eQ7tAoXyeGZabNl72uZ3Yt5G8JsIba+zMrbIMBn?=
 =?iso-8859-1?Q?yTHuFc+RPstf6uySMAkQfWywiBAN0/dUzsqGI92a0uUQc6yANk5UJvqpeu?=
 =?iso-8859-1?Q?2tovSIyVNFet/Fe2113vh449ShHmgU68tXgFEh4AtRt1P7o7sUwn5MD8Rr?=
 =?iso-8859-1?Q?3SnOxLw5efcGh69Uo6/cVa9FjenAq3v87R5rrfJQ7tsLb+yMVGjCU+2KmW?=
 =?iso-8859-1?Q?Zizt7ZVBiRIi73BaqiAU5Kg4te5PAF3M2nNlCE14zUPnFhmUkeJ7wqCxKF?=
 =?iso-8859-1?Q?vzjG6jAsAtkjI99t348lmcplzfI+R+ClmWXxTUZuLSXubWEwylhJ/hzOm8?=
 =?iso-8859-1?Q?JI8BYiohN6+0f9RCjf5TPIeW1iHVr56B3yUKDJa2P226E/8CSWPZZM956Q?=
 =?iso-8859-1?Q?n3fzK7xR9xpQZGt2jRW5J+BvZR5Gu1zi1jkA3W9DOS65b3YC4H+i4RWN39?=
 =?iso-8859-1?Q?EGSg1+4u64po0Qj3Nk9NLD/F8tuAHwuX+YDigimaOAnBPr76LjyYYrXBOY?=
 =?iso-8859-1?Q?FzSoANvhsklIRerlzHGX/YEUQ7gW7CFO7ijccUpFlSMUcrG+11o3Fvhd7t?=
 =?iso-8859-1?Q?lO6VCUdkt5Tbu/JfNjriE3XNsHjAWW+oeUkEDZ/yeBCC9wBl7TX41XD6Vd?=
 =?iso-8859-1?Q?7c++XsZHDGn2YaCFO5LpbrPRKZ7tN01PPjgE7JWasLqQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?b5WVtbWAbwSqEk02sLL1vKIkgoym+lpalOkSx0Fmvl4S1Z+wYE1hW7+hqn?=
 =?iso-8859-1?Q?x6QaHABPcq8QR4GjqGRdUQzkgp60mWUL+VTDtA11P9gpvm3+kY3xBHlAXS?=
 =?iso-8859-1?Q?WBECM9xjop7ZZX70f83upCXKqYyHyorFcjihcYXprA4xjtbXMj5v/kXQhe?=
 =?iso-8859-1?Q?fvs90EWfPm9WUx4N5mcHmmFz9jxjI3/JnaIJmy1SgPeURpMpom+TRXbLJs?=
 =?iso-8859-1?Q?ONNnMzwgmIq1s4nJXmdumXqDnOt+/aPLKZFin2k/drx3nF6CAXItUCVmwH?=
 =?iso-8859-1?Q?B8RKI6PuBtzcm9VDPfBQt6CLJcUj8AWN5NfJZiR386F1EoEjGPWtFc5pwT?=
 =?iso-8859-1?Q?MMzP6Mu2W3vVIZxS6jrjVnWrybGlvluqaKWYx7wH4IzFjdo1evno5zEkbz?=
 =?iso-8859-1?Q?Cnu4yktm3X8vYz9nU2ECxi7gZtD0Ywrq1Gq0pHgTPZ42xo4eU9G0EVygQ3?=
 =?iso-8859-1?Q?HE/5x4cgHB6rairCmUF0KmnY1kME5Pnc+J2BoE7XvJNQtt6nUyFN+v5OVA?=
 =?iso-8859-1?Q?aRLKZlhAZMkTVyfdUz1HPvHCwzFg2u5bQyb7ZznEyHgMtPDvs4ddxjxPEu?=
 =?iso-8859-1?Q?kg5JC1wjS5J3zZK1GwoRbDdavBU9FnEyZ7jyIeFSB9BUzRY0cvO/k+jZqK?=
 =?iso-8859-1?Q?ovrCjAyPtaBSUlmySnJzhdP2qTCXoQQi0XOTXhpBsRXy4MQjIGUSgn6Kea?=
 =?iso-8859-1?Q?6tPvh6AJ1jg1yGuES+QUgMDhlaR57ozb8Enn/gg0pS8Vt75msFmfZeiM7b?=
 =?iso-8859-1?Q?+5nSd6mjKgTnUqAyiisdlpiiJmLeso0Y2hTscuHsdhQ0aFior6+vKgjcdi?=
 =?iso-8859-1?Q?OxzHq6XYhO/6SbpbzzMO9RF19h5j7OY4fzvD5stTSj5UmCbb1QZ4uycJQg?=
 =?iso-8859-1?Q?KDatMbOeS0oXWn6uaEYN9h8p55UfItQxTuJUM/qeaqGB0zKHU5E8dkOOh2?=
 =?iso-8859-1?Q?LV9yrl+kPo1T4lENhc2okGLmlMe55IIAC89FrMbSXUvp1OK6aEw0RnhN21?=
 =?iso-8859-1?Q?LUaYi+Xyc5tKe/DghS2nMzL3AMytAEpSydOEJobrIH6yZlCk6DlXv5ycT1?=
 =?iso-8859-1?Q?bqylLdmVME8iRA9sPGDTQlbVgalEIyDrYEMPwRaROOnGh3nB3vfqucqb5F?=
 =?iso-8859-1?Q?M7vvxhklfUuYJXwNbzxQ/H7VwNmxi2Kx/eNTUQMCb5f3l9tkV1l+9e7ZfI?=
 =?iso-8859-1?Q?CdqwpMqu4G/w4xzaV6PTMTerW7bWZA2gda6HpRxC3gSivzQcopjgz0dNAE?=
 =?iso-8859-1?Q?vvIcpu07MG40E5ZrHlLsrxk8ZSRUmixI9wFjBMUAEQdekwo7ce6IJCOCW3?=
 =?iso-8859-1?Q?Ewcb/VPH5OTevpXAKPIADRpbCrlRidaBOqNlaPWKd6R9AMOEX5GQlKJXYA?=
 =?iso-8859-1?Q?DSjTPRHR/vEVCyE6gDa4d14kuc+yrI8s2APfiUbROhAtpNZ5jiXcT7iYMc?=
 =?iso-8859-1?Q?D1qY7qyebBcwfQ0MbN4KPkiI2AaAirvhx20N03w2gfk0UhC5bes8/A0Tws?=
 =?iso-8859-1?Q?NXOP3hwfVtz1bJQkjHkx4JbuPDsyVuzDKx1YWcAJApUilG3b+PMD65U9zX?=
 =?iso-8859-1?Q?bpkiVj9Km2h1ySTQN9kQ0OvnWjzaNFH007P11YILHkFe/lLobZTvtqNyKe?=
 =?iso-8859-1?Q?tIntyGSwVyIlVHpj93FdeyFOlVut9Wx7+G8Z8bPq2kUehRDdUi7dp4Tw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e21e7d06-f3c6-4d87-d12b-08de12be4ce4
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 05:29:28.5447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JmdcfQd+Dab3eHP6Jvz72zxd0ejFCn8FcDSwMOMr8I+snZ1zkLROCMppj+c4b59Ea6kp07wMSS2Fx808wEpJ5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4599
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 117.8% improvement of hackbench.throughput on:


commit: 7e2540f4625d5b6fe2e68833226c235ceafae382 ("sched/fair: Ratelimit update to tg->load_avg")
https://github.com/bytedance/kernel.git 5.15-velinux

testcase: hackbench
config: x86_64-bytedance-5.15-velinux
compiler: gcc-12
test machine: 256 threads 2 sockets Intel(R) Xeon(R) 6767P  CPU @ 2.4GHz (Granite Rapids) with 256G memory
parameters:

	nr_threads: 100%
	iterations: 8
	mode: threads
	ipc: pipe
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+----------------------------------------------------------------------------------------------+
| testcase: change | hackbench: hackbench.throughput 121.6% improvement                                           |
| test machine     | 256 threads 2 sockets Intel(R) Xeon(R) 6767P  CPU @ 2.4GHz (Granite Rapids) with 256G memory |
| test parameters  | cpufreq_governor=performance                                                                 |
|                  | ipc=pipe                                                                                     |
|                  | iterations=8                                                                                 |
|                  | mode=process                                                                                 |
|                  | nr_threads=100%                                                                              |
+------------------+----------------------------------------------------------------------------------------------+
| testcase: change | unixbench: unixbench.throughput 99.6% improvement                                            |
| test machine     | 256 threads 2 sockets Intel(R) Xeon(R) 6767P  CPU @ 2.4GHz (Granite Rapids) with 256G memory |
| test parameters  | cpufreq_governor=performance                                                                 |
|                  | nr_task=100%                                                                                 |
|                  | runtime=300s                                                                                 |
|                  | test=context1                                                                                |
+------------------+----------------------------------------------------------------------------------------------+
| testcase: change | hackbench: hackbench.throughput 12.6% improvement                                            |
| test machine     | 256 threads 2 sockets Intel(R) Xeon(R) 6767P  CPU @ 2.4GHz (Granite Rapids) with 256G memory |
| test parameters  | cpufreq_governor=performance                                                                 |
|                  | ipc=pipe                                                                                     |
|                  | iterations=8                                                                                 |
|                  | mode=process                                                                                 |
|                  | nr_threads=1600%                                                                             |
+------------------+----------------------------------------------------------------------------------------------+




Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20251024/202510241342.e994fd3c-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/ipc/iterations/kconfig/mode/nr_threads/rootfs/tbox_group/testcase:
  gcc-12/performance/pipe/8/x86_64-bytedance-5.15-velinux/threads/100%/debian-13-x86_64-20250902.cgz/lkp-gnr-2sp3/hackbench

commit: 
  c2f4451f9e ("Bluetooth: L2CAP: handle NULL sock pointer in l2cap_sock_alloc")
  7e2540f462 ("sched/fair: Ratelimit update to tg->load_avg")

c2f4451f9e7b5c73 7e2540f4625d5b6fe2e68833226 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
  12103328 ±  3%     +34.3%   16252365 ±  9%  cpuidle..usage
    626.78           -30.7%     434.36        uptime.boot
   1952947 ± 11%     -57.7%     825225 ± 19%  numa-meminfo.node1.Active
   1952814 ± 11%     -57.7%     825095 ± 19%  numa-meminfo.node1.Active(anon)
    488679 ± 11%     -57.2%     209369 ± 18%  numa-vmstat.node1.nr_active_anon
    488679 ± 11%     -57.2%     209369 ± 18%  numa-vmstat.node1.nr_zone_active_anon
      2.29 ±  4%      +2.2        4.51 ±  6%  mpstat.cpu.all.idle%
      0.00 ± 47%      -0.0        0.00        mpstat.cpu.all.soft%
      3.78 ±  2%      +4.8        8.60        mpstat.cpu.all.usr%
   1977713 ± 11%     -58.0%     829764 ± 18%  meminfo.Active
   1977087 ± 11%     -58.1%     829372 ± 18%  meminfo.Active(anon)
    130404           +18.2%     154201        meminfo.KernelStack
      1631           -67.2%     535.12 ±  5%  meminfo.Mlocked
      4.33 ± 12%    +154.2%      11.01 ± 36%  perf-sched.total_wait_and_delay.average.ms
      2.99 ± 12%    +185.6%       8.55 ± 37%  perf-sched.total_wait_time.average.ms
      4.33 ± 12%    +154.2%      11.01 ± 36%  perf-sched.wait_and_delay.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      2.99 ± 12%    +185.6%       8.55 ± 37%  perf-sched.wait_time.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      3597            -1.4%       3548        turbostat.Bzy_MHz
      2.36 ±  2%      +2.2        4.59 ±  3%  turbostat.C1%
      1.92 ±  2%    +114.4%       4.10 ±  3%  turbostat.CPU%c1
      0.32 ±  3%    +144.4%       0.77        turbostat.IPC
    634.15            +7.6%     682.38        turbostat.PkgWatt
     17.48            +1.9%      17.82        turbostat.RAMWatt
    752825 ±  2%    +117.8%    1639819 ±  3%  hackbench.throughput
    668687 ±  2%    +116.2%    1445645        hackbench.throughput_avg
    752825 ±  2%    +117.8%    1639819 ±  3%  hackbench.throughput_best
    584946 ± 10%    +114.5%    1254837 ±  6%  hackbench.throughput_worst
    363.14 ±  2%     -53.2%     170.08        hackbench.time.elapsed_time
    363.14 ±  2%     -53.2%     170.08        hackbench.time.elapsed_time.max
 3.824e+09           +17.0%  4.476e+09 ±  2%  hackbench.time.involuntary_context_switches
     25031            -2.2%      24487        hackbench.time.percent_of_cpu_this_job_got
     87548 ±  3%     -56.6%      37997        hackbench.time.system_time
      3354            +8.9%       3653        hackbench.time.user_time
 5.697e+09           +12.7%  6.421e+09        hackbench.time.voluntary_context_switches
    491573 ± 11%     -56.9%     211740 ± 17%  proc-vmstat.nr_active_anon
    130376           +17.8%     153621        proc-vmstat.nr_kernel_stack
    407.97           -66.6%     136.33 ±  4%  proc-vmstat.nr_mlock
     53415            -1.9%      52397        proc-vmstat.nr_slab_reclaimable
    136837            +1.6%     139064        proc-vmstat.nr_slab_unreclaimable
    491573 ± 11%     -56.9%     211740 ± 17%  proc-vmstat.nr_zone_active_anon
 1.662e+08 ±  2%      -3.3%  1.607e+08        proc-vmstat.numa_hit
 1.659e+08 ±  2%      -3.2%  1.606e+08        proc-vmstat.numa_local
   1015484 ±  4%     -65.4%     351327 ± 73%  proc-vmstat.pgactivate
 1.663e+08 ±  2%      -3.3%  1.608e+08        proc-vmstat.pgalloc_normal
   1741792           -25.6%    1295315        proc-vmstat.pgfault
 1.649e+08 ±  2%      -3.5%  1.592e+08        proc-vmstat.pgfree
     37298 ±  3%     -43.3%      21136 ±  2%  proc-vmstat.pgreuse
      0.40 ± 12%     -32.4%       0.27 ±  6%  perf-stat.i.MPKI
 5.978e+10 ±  3%    +134.1%  1.399e+11        perf-stat.i.branch-instructions
      0.80            -0.1        0.71        perf-stat.i.branch-miss-rate%
 3.931e+08 ±  3%    +139.2%  9.404e+08        perf-stat.i.branch-misses
      4.16 ±  7%      +0.7        4.86 ±  8%  perf-stat.i.cache-miss-rate%
  65102839 ±  7%     +89.5%  1.234e+08 ±  8%  perf-stat.i.cache-misses
  1.63e+09           +87.7%  3.059e+09        perf-stat.i.cache-references
  26109649 ±  3%    +141.7%   63110851        perf-stat.i.context-switches
      5.94 ±  3%     -75.1%       1.48        perf-stat.i.cpi
 9.035e+11            -3.8%  8.695e+11        perf-stat.i.cpu-cycles
   3563632           +77.3%    6319370        perf-stat.i.cpu-migrations
     18370 ±  8%     -50.2%       9141 ± 10%  perf-stat.i.cycles-between-cache-misses
 2.813e+11 ±  3%    +134.1%  6.585e+11        perf-stat.i.instructions
      0.31 ±  3%    +139.2%       0.75        perf-stat.i.ipc
      2.29 ±  4%    +126.3%       5.19 ±  7%  perf-stat.i.major-faults
    115.88 ±  3%    +134.2%     271.39        perf-stat.i.metric.K/sec
      4567           +64.3%       7506 ±  3%  perf-stat.i.minor-faults
      4570           +64.4%       7511 ±  3%  perf-stat.i.page-faults
      0.23 ±  7%     -21.2%       0.18 ±  8%  perf-stat.overall.MPKI
      0.65            +0.0        0.66        perf-stat.overall.branch-miss-rate%
      3.16 ±  2%     -58.9%       1.30        perf-stat.overall.cpi
     13807 ±  7%     -47.8%       7207 ±  6%  perf-stat.overall.cycles-between-cache-misses
      0.32 ±  2%    +143.1%       0.77        perf-stat.overall.ipc
 6.054e+10 ±  2%    +133.9%  1.416e+11        perf-stat.ps.branch-instructions
 3.937e+08 ±  2%    +139.2%  9.415e+08        perf-stat.ps.branch-misses
  65481157 ±  7%     +84.4%  1.207e+08 ±  7%  perf-stat.ps.cache-misses
 1.623e+09           +78.2%  2.892e+09        perf-stat.ps.cache-references
  26192969 ±  3%    +143.5%   63779984        perf-stat.ps.context-switches
 8.992e+11            -3.8%  8.655e+11        perf-stat.ps.cpu-cycles
   3527215           +69.8%    5989368        perf-stat.ps.cpu-migrations
  2.85e+11 ±  2%    +133.9%  6.666e+11        perf-stat.ps.instructions
      2.18 ±  3%    +111.7%       4.62        perf-stat.ps.major-faults
      4428           +53.7%       6804        perf-stat.ps.minor-faults
      4430           +53.7%       6809        perf-stat.ps.page-faults
 1.037e+14            +9.9%   1.14e+14        perf-stat.total.instructions
    670.58 ± 21%     -75.9%     161.33 ±115%  sched_debug.cfs_rq:/.load.min
  43759560 ±  6%     -63.7%   15897567        sched_debug.cfs_rq:/.min_vruntime.avg
  48252050 ±  6%     -62.8%   17956758        sched_debug.cfs_rq:/.min_vruntime.max
  36718240 ±  7%     -63.0%   13590089 ±  3%  sched_debug.cfs_rq:/.min_vruntime.min
   2016123 ± 28%     -47.7%    1054909 ± 15%  sched_debug.cfs_rq:/.min_vruntime.stddev
      0.84           -19.0%       0.68        sched_debug.cfs_rq:/.nr_running.avg
      1073 ± 31%     -53.7%     496.50 ± 66%  sched_debug.cfs_rq:/.runnable_avg.min
  -7427660           -73.2%   -1994025        sched_debug.cfs_rq:/.spread0.min
   1999805 ± 28%     -47.7%    1044981 ± 16%  sched_debug.cfs_rq:/.spread0.stddev
    866.42 ±  2%     -19.7%     695.69        sched_debug.cfs_rq:/.util_avg.avg
    337.67 ± 19%     -63.2%     124.39 ± 27%  sched_debug.cfs_rq:/.util_avg.min
    131.39 ±  7%     +25.8%     165.32 ±  3%  sched_debug.cfs_rq:/.util_avg.stddev
    467.03 ±  5%     -25.8%     346.52 ±  5%  sched_debug.cfs_rq:/.util_est_enqueued.avg
      1270 ±  4%     -11.2%       1127 ±  7%  sched_debug.cfs_rq:/.util_est_enqueued.max
     27.41 ± 50%     -73.0%       7.39 ±123%  sched_debug.cfs_rq:/.util_est_enqueued.min
   1676063 ±  7%     -35.6%    1079600 ± 10%  sched_debug.cpu.avg_idle.max
     10176 ± 30%     -62.3%       3837 ± 28%  sched_debug.cpu.avg_idle.min
    275707 ±  4%     -31.0%     190243 ±  6%  sched_debug.cpu.avg_idle.stddev
    421526 ±  2%     -23.2%     323734        sched_debug.cpu.clock.avg
    422128 ±  2%     -23.2%     324082        sched_debug.cpu.clock.max
    420675 ±  2%     -23.2%     323257        sched_debug.cpu.clock.min
    421526 ±  2%     -23.2%     323734        sched_debug.cpu.clock_task.avg
    422128 ±  2%     -23.2%     324082        sched_debug.cpu.clock_task.max
    420675 ±  2%     -23.2%     323257        sched_debug.cpu.clock_task.min
     46153 ±  5%     -25.1%      34550        sched_debug.cpu.curr->pid.avg
     52494 ±  4%     -21.8%      41052        sched_debug.cpu.curr->pid.max
     19315 ± 40%     -80.0%       3865 ± 97%  sched_debug.cpu.curr->pid.min
    615565 ±  4%     -18.2%     503710        sched_debug.cpu.max_idle_balance_cost.avg
   1437032 ±  6%     -58.1%     602012 ± 10%  sched_debug.cpu.max_idle_balance_cost.max
    156228 ± 14%     -91.7%      13031 ± 68%  sched_debug.cpu.max_idle_balance_cost.stddev
  17150799 ±  6%     -11.9%   15108033        sched_debug.cpu.nr_switches.avg
  21004040 ±  9%     -15.6%   17723642 ±  2%  sched_debug.cpu.nr_switches.max
   2211583 ± 30%     -57.4%     941209 ±  9%  sched_debug.cpu.nr_switches.stddev
      0.47 ± 74%    +252.9%       1.67 ± 68%  sched_debug.cpu.nr_uninterruptible.min
    420661 ±  2%     -23.2%     323248        sched_debug.cpu_clk
    420359 ±  2%     -23.2%     322944        sched_debug.ktime
      0.00 ±  5%    +104.9%       0.00        sched_debug.rt_rq:.rt_nr_migratory.avg
      0.16 ±  5%    +104.9%       0.33        sched_debug.rt_rq:.rt_nr_migratory.max
      0.01 ±  5%    +104.9%       0.02        sched_debug.rt_rq:.rt_nr_migratory.stddev
      0.00 ±  5%    +104.9%       0.00        sched_debug.rt_rq:.rt_nr_running.avg
      0.16 ±  5%    +104.9%       0.33        sched_debug.rt_rq:.rt_nr_running.max
      0.01 ±  5%    +104.9%       0.02        sched_debug.rt_rq:.rt_nr_running.stddev
    421885 ±  2%     -23.0%     325006        sched_debug.sched_clk
     22.30 ±  6%     -20.2        2.14 ±  9%  perf-profile.calltrace.cycles-pp.update_cfs_group.enqueue_task_fair.enqueue_task.ttwu_do_activate.try_to_wake_up
     27.18 ±  6%     -18.4        8.76 ±  6%  perf-profile.calltrace.cycles-pp.enqueue_task_fair.enqueue_task.ttwu_do_activate.try_to_wake_up.autoremove_wake_function
     28.18 ±  6%     -17.2       11.01 ±  5%  perf-profile.calltrace.cycles-pp.enqueue_task.ttwu_do_activate.try_to_wake_up.autoremove_wake_function.__wake_up_common
     19.31 ± 12%     -17.1        2.17 ±  9%  perf-profile.calltrace.cycles-pp.update_cfs_group.dequeue_task_fair.__schedule.schedule.pipe_read
     28.21 ±  6%     -17.1       11.09 ±  5%  perf-profile.calltrace.cycles-pp.ttwu_do_activate.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock
     21.32 ± 11%     -14.2        7.09 ±  5%  perf-profile.calltrace.cycles-pp.dequeue_task_fair.__schedule.schedule.pipe_read.new_sync_read
     29.80 ±  9%     -11.9       17.91 ±  5%  perf-profile.calltrace.cycles-pp.__schedule.schedule.pipe_read.new_sync_read.vfs_read
     30.00 ±  9%     -11.6       18.40 ±  5%  perf-profile.calltrace.cycles-pp.schedule.pipe_read.new_sync_read.vfs_read.ksys_read
     38.65            -9.3       29.33 ±  2%  perf-profile.calltrace.cycles-pp.pipe_read.new_sync_read.vfs_read.ksys_read.do_syscall_64
     39.26            -9.0       30.29 ±  2%  perf-profile.calltrace.cycles-pp.new_sync_read.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
     39.98            -8.6       31.42 ±  2%  perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
     41.35            -7.8       33.52 ±  2%  perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
     35.34 ± 10%      -6.7       28.66 ±  8%  perf-profile.calltrace.cycles-pp.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock.pipe_write
     35.38 ± 10%      -6.6       28.78 ±  8%  perf-profile.calltrace.cycles-pp.autoremove_wake_function.__wake_up_common.__wake_up_common_lock.pipe_write.new_sync_write
     35.61 ± 10%      -6.1       29.56 ±  8%  perf-profile.calltrace.cycles-pp.__wake_up_common.__wake_up_common_lock.pipe_write.new_sync_write.vfs_write
      5.83 ±  9%      -4.2        1.67 ± 28%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.raw_spin_rq_lock_nested.__schedule.schedule
      7.32 ± 10%      -3.5        3.82 ± 14%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.raw_spin_rq_lock_nested.try_to_wake_up.autoremove_wake_function
     94.51            -3.2       91.28        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.90 ± 32%      -3.2        0.75 ± 56%  perf-profile.calltrace.cycles-pp.__schedule.schedule.pipe_write.new_sync_write.vfs_write
      4.88 ±  6%      -3.1        1.74 ±  9%  perf-profile.calltrace.cycles-pp._raw_spin_lock.raw_spin_rq_lock_nested.__schedule.schedule.pipe_read
      4.89 ±  6%      -3.1        1.75 ±  9%  perf-profile.calltrace.cycles-pp.raw_spin_rq_lock_nested.__schedule.schedule.pipe_read.new_sync_read
      7.42 ± 10%      -3.1        4.30 ± 11%  perf-profile.calltrace.cycles-pp.raw_spin_rq_lock_nested.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock
      7.42 ± 10%      -3.1        4.29 ± 11%  perf-profile.calltrace.cycles-pp._raw_spin_lock.raw_spin_rq_lock_nested.try_to_wake_up.autoremove_wake_function.__wake_up_common
      3.93 ± 32%      -3.1        0.85 ± 36%  perf-profile.calltrace.cycles-pp.schedule.pipe_write.new_sync_write.vfs_write.ksys_write
     95.10            -3.0       92.08        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
     45.14 ±  3%      -2.8       42.30 ±  4%  perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      4.01 ± 32%      -2.8        1.22 ± 27%  perf-profile.calltrace.cycles-pp.__wake_up_common_lock.pipe_read.new_sync_read.vfs_read.ksys_read
      3.92 ± 32%      -2.8        1.12 ± 29%  perf-profile.calltrace.cycles-pp.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock.pipe_read
      3.94 ± 32%      -2.8        1.14 ± 29%  perf-profile.calltrace.cycles-pp.__wake_up_common.__wake_up_common_lock.pipe_read.new_sync_read.vfs_read
      3.93 ± 32%      -2.8        1.13 ± 29%  perf-profile.calltrace.cycles-pp.autoremove_wake_function.__wake_up_common.__wake_up_common_lock.pipe_read.new_sync_read
      2.84 ± 19%      -1.9        0.90 ± 11%  perf-profile.calltrace.cycles-pp.update_load_avg.enqueue_entity.enqueue_task_fair.enqueue_task.ttwu_do_activate
      1.06 ± 26%      -0.5        0.58 ± 49%  perf-profile.calltrace.cycles-pp.raw_spin_rq_lock_nested.__schedule.schedule.exit_to_user_mode_loop.exit_to_user_mode_prepare
      1.06 ± 26%      -0.5        0.58 ± 49%  perf-profile.calltrace.cycles-pp._raw_spin_lock.raw_spin_rq_lock_nested.__schedule.schedule.exit_to_user_mode_loop
      0.68 ± 17%      -0.3        0.36 ± 71%  perf-profile.calltrace.cycles-pp.update_load_avg.set_next_entity.pick_next_task_fair.pick_next_task.__schedule
      1.14 ± 10%      +0.3        1.46 ±  7%  perf-profile.calltrace.cycles-pp.pick_next_task_fair.pick_next_task.__schedule.schedule.pipe_read
      1.19 ± 10%      +0.4        1.57 ±  6%  perf-profile.calltrace.cycles-pp.pick_next_task.__schedule.schedule.pipe_read.new_sync_read
      0.76 ± 24%      +0.4        1.16 ± 13%  perf-profile.calltrace.cycles-pp.__fdget_pos.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.67 ± 50%      +0.4        1.11 ± 14%  perf-profile.calltrace.cycles-pp.touch_atime.pipe_read.new_sync_read.vfs_read.ksys_read
      0.34 ±100%      +0.4        0.79 ± 17%  perf-profile.calltrace.cycles-pp.file_update_time.pipe_write.new_sync_write.vfs_write.ksys_write
      0.61 ± 49%      +0.5        1.08 ± 12%  perf-profile.calltrace.cycles-pp.__fget_light.__fdget_pos.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.17 ±141%      +0.5        0.65 ± 13%  perf-profile.calltrace.cycles-pp.mutex_lock.pipe_read.new_sync_read.vfs_read.ksys_read
      0.09 ±223%      +0.5        0.61 ± 14%  perf-profile.calltrace.cycles-pp.handle_internal_command.main
      0.09 ±223%      +0.5        0.61 ± 14%  perf-profile.calltrace.cycles-pp.main
      0.09 ±223%      +0.5        0.61 ± 14%  perf-profile.calltrace.cycles-pp.run_builtin.handle_internal_command.main
      0.54 ±  4%      +0.6        1.16 ± 10%  perf-profile.calltrace.cycles-pp.pick_next_task_fair.pick_next_task.__schedule.schedule.exit_to_user_mode_loop
      0.00            +0.6        0.63 ±  6%  perf-profile.calltrace.cycles-pp.update_rq_clock.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock
      0.00            +0.6        0.63 ± 10%  perf-profile.calltrace.cycles-pp.fput.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.6        0.63 ±  9%  perf-profile.calltrace.cycles-pp.perf_trace_sched_wakeup_template.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock
      0.00            +0.6        0.63 ±  6%  perf-profile.calltrace.cycles-pp.__switch_to
      0.00            +0.6        0.64 ± 10%  perf-profile.calltrace.cycles-pp.__get_user_8.rseq_get_rseq_cs.rseq_ip_fixup.__rseq_handle_notify_resume.exit_to_user_mode_loop
      0.59 ±  4%      +0.7        1.27 ±  9%  perf-profile.calltrace.cycles-pp.pick_next_task.__schedule.schedule.exit_to_user_mode_loop.exit_to_user_mode_prepare
      0.44 ± 44%      +0.7        1.13 ±  5%  perf-profile.calltrace.cycles-pp.rseq_ip_fixup.__rseq_handle_notify_resume.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      0.00            +0.7        0.69 ±  7%  perf-profile.calltrace.cycles-pp.prepare_task_switch.__schedule.schedule.exit_to_user_mode_loop.exit_to_user_mode_prepare
      0.00            +0.7        0.70 ±  8%  perf-profile.calltrace.cycles-pp.update_load_avg.dequeue_task_fair.__schedule.schedule.pipe_read
      0.00            +0.7        0.72 ±  8%  perf-profile.calltrace.cycles-pp.rseq_get_rseq_cs.rseq_ip_fixup.__rseq_handle_notify_resume.exit_to_user_mode_loop.exit_to_user_mode_prepare
      0.00            +0.7        0.74 ±  7%  perf-profile.calltrace.cycles-pp.check_preempt_wakeup.check_preempt_curr.ttwu_do_wakeup.try_to_wake_up.autoremove_wake_function
      0.00            +0.7        0.74 ± 18%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock
      0.82 ± 24%      +0.8        1.62 ±  6%  perf-profile.calltrace.cycles-pp.copy_user_enhanced_fast_string.copy_page_to_iter.pipe_read.new_sync_read.vfs_read
      0.00            +0.8        0.80 ±  2%  perf-profile.calltrace.cycles-pp.save_fpregs_to_fpstate
      0.74 ±  4%      +0.8        1.55 ±  4%  perf-profile.calltrace.cycles-pp.__rseq_handle_notify_resume.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.00            +0.8        0.84 ±  8%  perf-profile.calltrace.cycles-pp.check_preempt_curr.ttwu_do_wakeup.try_to_wake_up.autoremove_wake_function.__wake_up_common
      0.62 ±  4%      +0.9        1.47 ±  8%  perf-profile.calltrace.cycles-pp.psi_group_change.psi_task_change.enqueue_task.ttwu_do_activate.try_to_wake_up
      0.00            +0.9        0.85 ± 12%  perf-profile.calltrace.cycles-pp.update_load_avg.enqueue_task_fair.enqueue_task.ttwu_do_activate.try_to_wake_up
      0.00            +0.9        0.87 ±  8%  perf-profile.calltrace.cycles-pp.reweight_entity.enqueue_task_fair.enqueue_task.ttwu_do_activate.try_to_wake_up
      0.00            +0.9        0.89 ±  6%  perf-profile.calltrace.cycles-pp.prepare_task_switch.__schedule.schedule.pipe_read.new_sync_read
      0.00            +0.9        0.91 ±  7%  perf-profile.calltrace.cycles-pp.reweight_entity.dequeue_task_fair.__schedule.schedule.pipe_read
      0.00            +0.9        0.93 ±  9%  perf-profile.calltrace.cycles-pp.ttwu_do_wakeup.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock
      0.00            +1.0        0.96 ± 11%  perf-profile.calltrace.cycles-pp.update_curr.enqueue_entity.enqueue_task_fair.enqueue_task.ttwu_do_activate
      0.00            +1.0        0.98 ±  9%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.prepare_to_wait_event.pipe_read.new_sync_read.vfs_read
      1.33 ± 25%      +1.0        2.31 ±  8%  perf-profile.calltrace.cycles-pp.copy_page_to_iter.pipe_read.new_sync_read.vfs_read.ksys_read
      0.54 ±  4%      +1.0        1.52 ±  3%  perf-profile.calltrace.cycles-pp.psi_group_change.psi_task_switch.__schedule.schedule.pipe_read
      0.74 ±  4%      +1.0        1.73 ±  7%  perf-profile.calltrace.cycles-pp.restore_fpregs_from_fpstate.switch_fpu_return.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      1.18 ±  8%      +1.0        2.23 ±  9%  perf-profile.calltrace.cycles-pp.dequeue_entity.dequeue_task_fair.__schedule.schedule.pipe_read
      0.78 ±  4%      +1.0        1.82 ±  9%  perf-profile.calltrace.cycles-pp.psi_task_change.enqueue_task.ttwu_do_activate.try_to_wake_up.autoremove_wake_function
      0.46 ± 44%      +1.1        1.52 ± 18%  perf-profile.calltrace.cycles-pp.wake_affine.select_task_rq_fair.try_to_wake_up.autoremove_wake_function.__wake_up_common
      0.00            +1.1        1.07 ±  8%  perf-profile.calltrace.cycles-pp.__switch_to_asm
      0.00            +1.1        1.10 ± 18%  perf-profile.calltrace.cycles-pp.task_h_load.wake_affine.select_task_rq_fair.try_to_wake_up.autoremove_wake_function
      0.00            +1.1        1.11 ±  9%  perf-profile.calltrace.cycles-pp.update_curr.dequeue_entity.dequeue_task_fair.__schedule.schedule
      0.76 ± 23%      +1.2        1.92 ±  5%  perf-profile.calltrace.cycles-pp.mutex_lock.pipe_write.new_sync_write.vfs_write.ksys_write
      0.88 ±  4%      +1.2        2.08 ±  7%  perf-profile.calltrace.cycles-pp.switch_fpu_return.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.17 ±141%      +1.3        1.47 ±  7%  perf-profile.calltrace.cycles-pp.prepare_to_wait_event.pipe_read.new_sync_read.vfs_read.ksys_read
      0.84 ±  4%      +1.4        2.26 ±  4%  perf-profile.calltrace.cycles-pp.psi_task_switch.__schedule.schedule.pipe_read.new_sync_read
      1.11 ± 19%      +1.6        2.69 ±  3%  perf-profile.calltrace.cycles-pp.__fget_files.__fget_light.__fdget_pos.ksys_write.do_syscall_64
      1.21 ± 19%      +1.6        2.84 ±  3%  perf-profile.calltrace.cycles-pp.__fget_light.__fdget_pos.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.59 ± 12%      +1.6        4.23 ±  8%  perf-profile.calltrace.cycles-pp.__schedule.schedule.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      1.28 ± 20%      +1.7        2.94 ±  4%  perf-profile.calltrace.cycles-pp.__fdget_pos.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.69 ± 11%      +1.7        4.41 ±  8%  perf-profile.calltrace.cycles-pp.schedule.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.31 ±100%      +1.8        2.08 ±  7%  perf-profile.calltrace.cycles-pp.mutex_unlock.pipe_write.new_sync_write.vfs_write.ksys_write
      3.86 ±  8%      +3.3        7.12 ±  6%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      5.05 ±  6%      +4.6        9.66 ±  5%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      5.43 ±  4%      +4.9       10.37 ±  4%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +7.0        6.95 ± 43%  perf-profile.calltrace.cycles-pp.select_idle_sibling.select_task_rq_fair.try_to_wake_up.autoremove_wake_function.__wake_up_common
      1.04 ±  9%      +7.8        8.84 ± 32%  perf-profile.calltrace.cycles-pp.select_task_rq_fair.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock
     45.30 ±  6%     -40.4        4.93 ± 11%  perf-profile.children.cycles-pp.update_cfs_group
     27.25 ±  6%     -18.0        9.29 ±  6%  perf-profile.children.cycles-pp.enqueue_task_fair
     24.80 ±  5%     -17.3        7.54 ±  5%  perf-profile.children.cycles-pp.dequeue_task_fair
     28.24 ±  6%     -16.8       11.46 ±  6%  perf-profile.children.cycles-pp.enqueue_task
     28.27 ±  6%     -16.7       11.53 ±  6%  perf-profile.children.cycles-pp.ttwu_do_activate
     36.42 ±  5%     -13.0       23.42 ±  4%  perf-profile.children.cycles-pp.__schedule
     36.64 ±  5%     -12.9       23.76 ±  4%  perf-profile.children.cycles-pp.schedule
     39.32 ±  6%      -9.4       29.92 ±  7%  perf-profile.children.cycles-pp.autoremove_wake_function
     38.79            -9.3       29.52 ±  2%  perf-profile.children.cycles-pp.pipe_read
     39.32 ±  6%      -9.2       30.10 ±  7%  perf-profile.children.cycles-pp.try_to_wake_up
     39.32            -9.0       30.36 ±  2%  perf-profile.children.cycles-pp.new_sync_read
     39.56 ±  6%      -8.8       30.71 ±  7%  perf-profile.children.cycles-pp.__wake_up_common
     40.09 ±  6%      -8.6       31.50 ±  7%  perf-profile.children.cycles-pp.__wake_up_common_lock
     40.04            -8.5       31.50 ±  2%  perf-profile.children.cycles-pp.vfs_read
     41.43            -7.8       33.62 ±  2%  perf-profile.children.cycles-pp.ksys_read
     13.48 ±  9%      -7.4        6.12 ± 13%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
     13.72 ±  9%      -6.7        7.00 ± 11%  perf-profile.children.cycles-pp.raw_spin_rq_lock_nested
     13.75 ±  9%      -6.6        7.20 ± 11%  perf-profile.children.cycles-pp._raw_spin_lock
     44.16 ±  3%      -3.2       40.97 ±  5%  perf-profile.children.cycles-pp.pipe_write
     94.92            -3.1       91.78        perf-profile.children.cycles-pp.do_syscall_64
     95.37            -3.0       92.40        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.46 ±  6%      -0.2        0.32 ± 19%  perf-profile.children.cycles-pp.task_tick_fair
      0.52 ±  6%      -0.1        0.38 ± 16%  perf-profile.children.cycles-pp.scheduler_tick
      0.14 ± 17%      -0.1        0.07 ± 55%  perf-profile.children.cycles-pp.__task_rq_lock
      0.07            +0.0        0.09 ±  8%  perf-profile.children.cycles-pp.fault_in_iov_iter_readable
      0.07 ±  5%      +0.0        0.09 ±  8%  perf-profile.children.cycles-pp.fault_in_readable
      0.07 ±  7%      +0.0        0.09 ±  8%  perf-profile.children.cycles-pp.__get_user_nocheck_1
      0.18 ±  3%      +0.0        0.21 ±  6%  perf-profile.children.cycles-pp.generic_file_write_iter
      0.17 ±  2%      +0.0        0.21 ±  7%  perf-profile.children.cycles-pp.__generic_file_write_iter
      0.17 ±  4%      +0.0        0.20 ±  6%  perf-profile.children.cycles-pp.generic_perform_write
      0.02 ± 99%      +0.0        0.07 ± 11%  perf-profile.children.cycles-pp.copy_page_from_iter_atomic
      0.10 ± 23%      +0.0        0.14 ± 16%  perf-profile.children.cycles-pp.amd_clear_divider
      0.06 ±  7%      +0.0        0.11 ± 10%  perf-profile.children.cycles-pp.generic_update_time
      0.05 ±  8%      +0.0        0.10 ±  5%  perf-profile.children.cycles-pp.perf_trace_sched_switch
      0.05 ±  7%      +0.0        0.10 ±  5%  perf-profile.children.cycles-pp.native_load_tls
      0.05 ±  8%      +0.0        0.10 ±  4%  perf-profile.children.cycles-pp.__bitmap_and
      0.01 ±223%      +0.0        0.06 ± 11%  perf-profile.children.cycles-pp.irq_exit_rcu
      0.12 ±  6%      +0.1        0.17 ± 14%  perf-profile.children.cycles-pp.check_spread
      0.04 ± 71%      +0.1        0.08 ±  5%  perf-profile.children.cycles-pp.perf_trace_buf_alloc
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.perf_swevent_event
      0.00            +0.1        0.05 ±  7%  perf-profile.children.cycles-pp.xfd_validate_state
      0.06 ±  7%      +0.1        0.12 ±  6%  perf-profile.children.cycles-pp.perf_trace_sched_stat_runtime
      0.00            +0.1        0.05 ±  8%  perf-profile.children.cycles-pp.perf_trace_run_bpf_submit
      0.06 ±  6%      +0.1        0.12 ±  8%  perf-profile.children.cycles-pp.__cgroup_account_cputime
      0.06            +0.1        0.12 ± 10%  perf-profile.children.cycles-pp.rb_insert_color
      0.00            +0.1        0.06        perf-profile.children.cycles-pp.is_cpu_allowed
      0.00            +0.1        0.06 ±  6%  perf-profile.children.cycles-pp.raw_spin_rq_unlock
      0.09 ±  9%      +0.1        0.16 ± 11%  perf-profile.children.cycles-pp.__mark_inode_dirty
      0.12 ± 22%      +0.1        0.20 ± 15%  perf-profile.children.cycles-pp.rcu_read_unlock_strict
      0.00            +0.1        0.07 ±  8%  perf-profile.children.cycles-pp.dequeue_task
      0.10 ±  9%      +0.1        0.17 ±  7%  perf-profile.children.cycles-pp.write
      0.00            +0.1        0.07 ±  6%  perf-profile.children.cycles-pp.sched_clock
      0.00            +0.1        0.08 ±  6%  perf-profile.children.cycles-pp.blkcg_maybe_throttle_current
      0.05 ± 78%      +0.1        0.13 ± 14%  perf-profile.children.cycles-pp.cmd_sched
      0.00            +0.1        0.08 ±  8%  perf-profile.children.cycles-pp.perf_exclude_event
      0.13 ± 13%      +0.1        0.21 ±  8%  perf-profile.children.cycles-pp.read
      0.07 ±  6%      +0.1        0.16 ±  3%  perf-profile.children.cycles-pp.cgroup_rstat_updated
      0.06 ± 14%      +0.1        0.14 ± 28%  perf-profile.children.cycles-pp.remove_entity_load_avg
      0.01 ±223%      +0.1        0.09 ± 11%  perf-profile.children.cycles-pp.anon_pipe_buf_release
      0.06 ±  6%      +0.1        0.15 ± 10%  perf-profile.children.cycles-pp.perf_trace_buf_update
      0.07 ±  5%      +0.1        0.16 ±  3%  perf-profile.children.cycles-pp.__cgroup_account_cputime_field
      0.00            +0.1        0.09 ±  5%  perf-profile.children.cycles-pp.place_entity
      0.10 ±  3%      +0.1        0.19 ±  7%  perf-profile.children.cycles-pp.rb_erase
      0.06 ±  6%      +0.1        0.15 ± 15%  perf-profile.children.cycles-pp.mem_cgroup_handle_over_high
      0.00            +0.1        0.09 ±  6%  perf-profile.children.cycles-pp.rcu_note_context_switch
      0.01 ±223%      +0.1        0.10 ± 12%  perf-profile.children.cycles-pp.clockevents_program_event
      0.02 ±146%      +0.1        0.11 ± 17%  perf-profile.children.cycles-pp.add_callchain_ip
      0.00            +0.1        0.09 ± 14%  perf-profile.children.cycles-pp.wake_q_add
      0.11 ±  8%      +0.1        0.21 ±  4%  perf-profile.children.cycles-pp.__rdgsbase_inactive
      0.00            +0.1        0.10 ± 12%  perf-profile.children.cycles-pp.ktime_get
      0.02 ±143%      +0.1        0.12 ± 15%  perf-profile.children.cycles-pp.thread__resolve_callchain_sample
      0.14 ± 21%      +0.1        0.24 ±  7%  perf-profile.children.cycles-pp.kill_fasync
      0.10 ±  6%      +0.1        0.20 ±  4%  perf-profile.children.cycles-pp.finish_wait
      0.05 ±  7%      +0.1        0.16 ±  7%  perf-profile.children.cycles-pp.rb_next
      0.00            +0.1        0.10 ± 11%  perf-profile.children.cycles-pp.tracing_gen_ctx_irq_test
      0.07            +0.1        0.18 ±  6%  perf-profile.children.cycles-pp.clear_buddies
      0.04 ±142%      +0.1        0.14 ± 47%  perf-profile.children.cycles-pp.perf_c2c__record
      0.01 ±223%      +0.1        0.12 ± 26%  perf-profile.children.cycles-pp.cpus_share_cache
      0.21 ± 27%      +0.1        0.32 ± 15%  perf-profile.children.cycles-pp.ktime_get_coarse_real_ts64
      0.14 ±  6%      +0.1        0.26 ±  5%  perf-profile.children.cycles-pp.__calc_delta
      0.02 ±144%      +0.1        0.14 ± 32%  perf-profile.children.cycles-pp.cpumask_next
      0.02 ±141%      +0.1        0.14 ± 27%  perf-profile.children.cycles-pp.native_irq_return_iret
      0.12 ±  5%      +0.1        0.24 ±  4%  perf-profile.children.cycles-pp.account_run_delay_time
      0.27 ± 18%      +0.1        0.39 ± 11%  perf-profile.children.cycles-pp.receiver
      0.28 ± 18%      +0.1        0.41 ± 12%  perf-profile.children.cycles-pp.sender
      0.03 ±143%      +0.1        0.16 ± 18%  perf-profile.children.cycles-pp.__thread__resolve_callchain
      0.03 ±143%      +0.1        0.16 ± 18%  perf-profile.children.cycles-pp.sample__for_each_callchain_node
      0.05 ± 84%      +0.1        0.18 ± 17%  perf-profile.children.cycles-pp.perf_session__process_user_event
      0.05 ± 84%      +0.1        0.18 ± 17%  perf-profile.children.cycles-pp.perf_session__deliver_event
      0.04 ±107%      +0.1        0.17 ± 18%  perf-profile.children.cycles-pp.build_id__mark_dso_hit
      0.05 ± 84%      +0.1        0.18 ± 17%  perf-profile.children.cycles-pp.__ordered_events__flush
      0.07 ± 15%      +0.1        0.20 ± 25%  perf-profile.children.cycles-pp.asm_sysvec_reschedule_ipi
      0.15 ±  6%      +0.1        0.29 ±  3%  perf-profile.children.cycles-pp.__put_user_nocheck_8
      0.13 ± 46%      +0.1        0.27 ± 29%  perf-profile.children.cycles-pp.reader__read_event
      0.13 ± 46%      +0.1        0.27 ± 26%  perf-profile.children.cycles-pp.perf_session__process_events
      0.13 ± 46%      +0.1        0.27 ± 26%  perf-profile.children.cycles-pp.record__finish_output
      0.20 ±  6%      +0.2        0.35 ±  5%  perf-profile.children.cycles-pp.__wrgsbase_inactive
      0.21 ±  5%      +0.2        0.37 ±  4%  perf-profile.children.cycles-pp.___perf_sw_event
      0.45 ± 13%      +0.2        0.61 ± 14%  perf-profile.children.cycles-pp.handle_internal_command
      0.45 ± 13%      +0.2        0.61 ± 14%  perf-profile.children.cycles-pp.main
      0.45 ± 13%      +0.2        0.61 ± 14%  perf-profile.children.cycles-pp.run_builtin
      0.44 ± 12%      +0.2        0.61 ± 13%  perf-profile.children.cycles-pp.cmd_record
      0.12 ±  5%      +0.2        0.29 ±  6%  perf-profile.children.cycles-pp.pick_next_entity
      0.13 ±  9%      +0.2        0.30 ± 15%  perf-profile.children.cycles-pp.resched_curr
      0.06 ±  7%      +0.2        0.25 ± 16%  perf-profile.children.cycles-pp.ttwu_queue_wakelist
      0.30 ± 28%      +0.2        0.49 ± 15%  perf-profile.children.cycles-pp.syscall_enter_from_user_mode
      0.10 ± 10%      +0.2        0.30 ± 27%  perf-profile.children.cycles-pp.migrate_task_rq_fair
      0.47 ±  5%      +0.2        0.69 ± 13%  perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      0.34 ±  3%      +0.2        0.56 ± 10%  perf-profile.children.cycles-pp.put_prev_entity
      0.12 ±  6%      +0.2        0.35 ± 14%  perf-profile.children.cycles-pp.cpuacct_charge
      0.16 ± 11%      +0.2        0.40 ± 27%  perf-profile.children.cycles-pp.set_task_cpu
      0.17 ±  5%      +0.3        0.42 ±  9%  perf-profile.children.cycles-pp.perf_tp_event
      0.17 ± 20%      +0.3        0.42 ±  6%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
      1.10 ±  8%      +0.3        1.36 ±  6%  perf-profile.children.cycles-pp.set_next_entity
      0.29 ±  7%      +0.3        0.56 ±  3%  perf-profile.children.cycles-pp.native_sched_clock
      0.00            +0.3        0.27 ± 16%  perf-profile.children.cycles-pp.wake_up_q
      0.00            +0.3        0.28 ± 23%  perf-profile.children.cycles-pp.mutex_spin_on_owner
      0.01 ±223%      +0.3        0.35 ± 43%  perf-profile.children.cycles-pp._find_next_bit
      0.36 ±  6%      +0.3        0.71 ±  4%  perf-profile.children.cycles-pp.sched_clock_cpu
      0.17 ± 12%      +0.3        0.52 ±  9%  perf-profile.children.cycles-pp.set_next_buddy
      0.78 ± 25%      +0.4        1.15 ± 14%  perf-profile.children.cycles-pp.touch_atime
      0.32 ±  5%      +0.4        0.68 ±  7%  perf-profile.children.cycles-pp.perf_trace_sched_wakeup_template
      0.01 ±223%      +0.4        0.38 ± 43%  perf-profile.children.cycles-pp.sched_ttwu_pending
      0.06 ± 13%      +0.4        0.44 ± 14%  perf-profile.children.cycles-pp.__mutex_unlock_slowpath
      0.28 ±  3%      +0.4        0.67 ±  9%  perf-profile.children.cycles-pp.__get_user_8
      0.21 ±  6%      +0.4        0.61 ± 15%  perf-profile.children.cycles-pp._raw_spin_lock_irq
      0.10 ± 76%      +0.4        0.50 ± 43%  perf-profile.children.cycles-pp.page_counter_uncharge
      0.38 ±  2%      +0.4        0.80 ±  5%  perf-profile.children.cycles-pp.check_preempt_wakeup
      0.32 ±  3%      +0.4        0.74 ±  8%  perf-profile.children.cycles-pp.rseq_get_rseq_cs
      0.00            +0.4        0.42 ± 43%  perf-profile.children.cycles-pp.osq_lock
      0.21 ±  7%      +0.4        0.63 ± 14%  perf-profile.children.cycles-pp.psi_flags_change
      0.40 ±  6%      +0.4        0.82        perf-profile.children.cycles-pp.save_fpregs_to_fpstate
      0.12 ± 75%      +0.4        0.56 ± 44%  perf-profile.children.cycles-pp.uncharge_batch
      0.12 ± 75%      +0.4        0.57 ± 43%  perf-profile.children.cycles-pp.__mem_cgroup_uncharge
      0.12 ± 75%      +0.5        0.57 ± 43%  perf-profile.children.cycles-pp.__put_page
      0.02 ±142%      +0.5        0.48 ± 43%  perf-profile.children.cycles-pp.__sysvec_call_function_single
      0.02 ±142%      +0.5        0.50 ± 42%  perf-profile.children.cycles-pp.sysvec_call_function_single
      0.72 ± 21%      +0.5        1.21 ± 10%  perf-profile.children.cycles-pp.fput
      0.42 ±  2%      +0.5        0.92 ±  7%  perf-profile.children.cycles-pp.check_preempt_curr
      0.46 ±  5%      +0.5        0.96 ±  2%  perf-profile.children.cycles-pp.__update_load_avg_se
      0.46 ±  2%      +0.6        1.01 ±  8%  perf-profile.children.cycles-pp.ttwu_do_wakeup
      0.02 ±144%      +0.6        0.58 ± 41%  perf-profile.children.cycles-pp.asm_sysvec_call_function_single
      0.23 ±  6%      +0.6        0.81 ±  6%  perf-profile.children.cycles-pp.update_min_vruntime
      0.48 ±  4%      +0.6        1.08 ±  3%  perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
      0.48 ±  3%      +0.6        1.10 ±  8%  perf-profile.children.cycles-pp.__switch_to_asm
      0.53 ±  3%      +0.6        1.16 ±  5%  perf-profile.children.cycles-pp.rseq_ip_fixup
      0.11 ± 32%      +0.6        0.76 ±111%  perf-profile.children.cycles-pp.switch_mm_irqs_off
      0.56 ±  4%      +0.7        1.23 ±  4%  perf-profile.children.cycles-pp.__switch_to
      0.40 ±  8%      +0.7        1.11 ± 18%  perf-profile.children.cycles-pp.task_h_load
      0.43 ±  4%      +0.8        1.23 ±  5%  perf-profile.children.cycles-pp.update_rq_clock
      0.76 ±  4%      +0.8        1.59 ±  4%  perf-profile.children.cycles-pp.__rseq_handle_notify_resume
      1.85 ±  5%      +0.9        2.80 ±  7%  perf-profile.children.cycles-pp.pick_next_task_fair
      0.06 ±  7%      +1.0        1.02 ± 32%  perf-profile.children.cycles-pp.__mutex_lock
      1.55 ± 26%      +1.0        2.52 ± 10%  perf-profile.children.cycles-pp.copy_user_enhanced_fast_string
      1.39 ± 25%      +1.0        2.38 ±  8%  perf-profile.children.cycles-pp.copy_page_to_iter
      0.54 ±  7%      +1.0        1.54 ± 18%  perf-profile.children.cycles-pp.wake_affine
      0.74 ±  4%      +1.0        1.75 ±  7%  perf-profile.children.cycles-pp.restore_fpregs_from_fpstate
      0.66 ±  4%      +1.0        1.67 ±  2%  perf-profile.children.cycles-pp.prepare_task_switch
      0.57 ±  5%      +1.0        1.61 ±  6%  perf-profile.children.cycles-pp.prepare_to_wait_event
      1.91 ±  5%      +1.1        2.97 ±  7%  perf-profile.children.cycles-pp.pick_next_task
      1.31 ±  5%      +1.1        2.37 ±  7%  perf-profile.children.cycles-pp.dequeue_entity
      0.90 ±  3%      +1.1        2.00 ±  7%  perf-profile.children.cycles-pp.psi_task_change
      0.54            +1.1        1.65 ± 27%  perf-profile.children.cycles-pp.finish_task_switch
      0.89 ±  4%      +1.2        2.10 ±  7%  perf-profile.children.cycles-pp.switch_fpu_return
      0.70 ±  6%      +1.3        1.96 ±  7%  perf-profile.children.cycles-pp.reweight_entity
      1.26 ± 23%      +1.4        2.68 ±  8%  perf-profile.children.cycles-pp.mutex_lock
      1.13 ±  5%      +1.7        2.79 ±  4%  perf-profile.children.cycles-pp.psi_task_switch
      0.84 ± 18%      +1.7        2.56 ±  5%  perf-profile.children.cycles-pp.mutex_unlock
      0.84 ±  4%      +1.7        2.58 ±  9%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      1.71 ± 21%      +1.8        3.51 ±  6%  perf-profile.children.cycles-pp.__fget_files
      1.33 ±  5%      +1.9        3.20 ±  4%  perf-profile.children.cycles-pp.psi_group_change
      0.15 ± 19%      +1.9        2.04 ± 35%  perf-profile.children.cycles-pp.available_idle_cpu
      1.98 ± 21%      +2.0        4.02 ±  6%  perf-profile.children.cycles-pp.__fget_light
      2.14 ± 21%      +2.1        4.22 ±  6%  perf-profile.children.cycles-pp.__fdget_pos
      1.31 ±  4%      +2.2        3.53 ±  6%  perf-profile.children.cycles-pp.update_curr
      3.88 ±  8%      +3.3        7.17 ±  6%  perf-profile.children.cycles-pp.exit_to_user_mode_loop
      5.12 ±  5%      +4.6        9.76 ±  5%  perf-profile.children.cycles-pp.exit_to_user_mode_prepare
      5.55 ±  4%      +5.0       10.54 ±  4%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      0.11 ±  6%      +6.0        6.07 ± 49%  perf-profile.children.cycles-pp.select_idle_cpu
      0.40 ± 22%      +6.8        7.24 ± 42%  perf-profile.children.cycles-pp.select_idle_sibling
      1.11 ± 10%      +8.0        9.15 ± 31%  perf-profile.children.cycles-pp.select_task_rq_fair
     45.28 ±  6%     -40.4        4.90 ± 11%  perf-profile.self.cycles-pp.update_cfs_group
     13.48 ±  9%      -7.4        6.11 ± 13%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      4.31 ± 17%      -2.1        2.18 ± 14%  perf-profile.self.cycles-pp.update_load_avg
      0.06 ±  7%      +0.0        0.08 ±  8%  perf-profile.self.cycles-pp.__get_user_nocheck_1
      0.05            +0.0        0.09 ±  6%  perf-profile.self.cycles-pp.perf_trace_sched_switch
      0.05 ± 47%      +0.0        0.09 ± 14%  perf-profile.self.cycles-pp.rcu_read_unlock_strict
      0.11 ±  6%      +0.0        0.15 ± 16%  perf-profile.self.cycles-pp.check_spread
      0.02 ±141%      +0.0        0.06 ± 13%  perf-profile.self.cycles-pp.__x64_sys_read
      0.06 ±  9%      +0.0        0.10 ±  4%  perf-profile.self.cycles-pp.perf_trace_sched_stat_runtime
      0.05 ±  7%      +0.0        0.10 ±  3%  perf-profile.self.cycles-pp.__bitmap_and
      0.03 ± 70%      +0.0        0.08 ±  5%  perf-profile.self.cycles-pp.__wake_up_common_lock
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.perf_trace_run_bpf_submit
      0.05 ±  8%      +0.1        0.10 ±  4%  perf-profile.self.cycles-pp.sched_clock_cpu
      0.00            +0.1        0.05 ±  7%  perf-profile.self.cycles-pp.is_cpu_allowed
      0.06 ±  9%      +0.1        0.11 ± 11%  perf-profile.self.cycles-pp.rb_insert_color
      0.14 ± 23%      +0.1        0.20 ± 15%  perf-profile.self.cycles-pp.rcu_all_qs
      0.00            +0.1        0.06 ± 11%  perf-profile.self.cycles-pp.__cgroup_account_cputime
      0.00            +0.1        0.06 ± 11%  perf-profile.self.cycles-pp.account_run_delay_time
      0.00            +0.1        0.06 ± 11%  perf-profile.self.cycles-pp.autoremove_wake_function
      0.00            +0.1        0.06 ±  6%  perf-profile.self.cycles-pp.perf_exclude_event
      0.00            +0.1        0.06 ±  6%  perf-profile.self.cycles-pp.raw_spin_rq_lock_nested
      0.06 ±  7%      +0.1        0.13 ±  3%  perf-profile.self.cycles-pp.rseq_ip_fixup
      0.00            +0.1        0.06 ±  7%  perf-profile.self.cycles-pp.blkcg_maybe_throttle_current
      0.00            +0.1        0.06 ± 11%  perf-profile.self.cycles-pp.dequeue_task
      0.00            +0.1        0.07 ±  7%  perf-profile.self.cycles-pp.__cgroup_account_cputime_field
      0.07 ± 10%      +0.1        0.14 ±  5%  perf-profile.self.cycles-pp.perf_trace_sched_wakeup_template
      0.09 ± 10%      +0.1        0.16 ±  6%  perf-profile.self.cycles-pp.write
      0.09 ± 12%      +0.1        0.16 ± 11%  perf-profile.self.cycles-pp.__mark_inode_dirty
      0.00            +0.1        0.07 ±  5%  perf-profile.self.cycles-pp.rseq_get_rseq_cs
      0.12 ± 13%      +0.1        0.19 ±  7%  perf-profile.self.cycles-pp.read
      0.01 ±223%      +0.1        0.08 ± 13%  perf-profile.self.cycles-pp.anon_pipe_buf_release
      0.05 ±  8%      +0.1        0.13 ±  3%  perf-profile.self.cycles-pp.cgroup_rstat_updated
      0.01 ±223%      +0.1        0.08 ±  4%  perf-profile.self.cycles-pp.native_load_tls
      0.00            +0.1        0.07 ±  6%  perf-profile.self.cycles-pp.ttwu_do_activate
      0.00            +0.1        0.08 ±  6%  perf-profile.self.cycles-pp.place_entity
      0.09 ±  5%      +0.1        0.17 ± 10%  perf-profile.self.cycles-pp.rb_erase
      0.06 ±  9%      +0.1        0.14 ± 16%  perf-profile.self.cycles-pp.mem_cgroup_handle_over_high
      0.07 ±  5%      +0.1        0.15 ± 10%  perf-profile.self.cycles-pp.put_prev_entity
      0.00            +0.1        0.08 ±  8%  perf-profile.self.cycles-pp.rcu_note_context_switch
      0.10 ±  6%      +0.1        0.18 ± 10%  perf-profile.self.cycles-pp.enqueue_task
      0.10 ±  6%      +0.1        0.19 ±  5%  perf-profile.self.cycles-pp.set_next_entity
      0.09 ± 21%      +0.1        0.18 ±  8%  perf-profile.self.cycles-pp.kill_fasync
      0.11 ±  6%      +0.1        0.20 ±  4%  perf-profile.self.cycles-pp.__rdgsbase_inactive
      0.00            +0.1        0.09 ± 21%  perf-profile.self.cycles-pp.ttwu_do_wakeup
      0.00            +0.1        0.09 ± 11%  perf-profile.self.cycles-pp.wake_q_add
      0.24 ± 21%      +0.1        0.34 ± 13%  perf-profile.self.cycles-pp.sender
      0.09 ±  5%      +0.1        0.19 ±  5%  perf-profile.self.cycles-pp.psi_task_change
      0.20 ± 20%      +0.1        0.30 ± 15%  perf-profile.self.cycles-pp.exit_to_user_mode_prepare
      0.00            +0.1        0.10 ± 10%  perf-profile.self.cycles-pp.ktime_get
      0.00            +0.1        0.10 ± 16%  perf-profile.self.cycles-pp.tracing_gen_ctx_irq_test
      0.06 ±  6%      +0.1        0.16 ±  6%  perf-profile.self.cycles-pp.clear_buddies
      0.15 ± 28%      +0.1        0.25 ± 13%  perf-profile.self.cycles-pp.ktime_get_coarse_real_ts64
      0.06 ±  6%      +0.1        0.16 ±  6%  perf-profile.self.cycles-pp.pick_next_task
      0.14 ±  5%      +0.1        0.24 ±  3%  perf-profile.self.cycles-pp.___perf_sw_event
      0.22 ± 20%      +0.1        0.33 ± 12%  perf-profile.self.cycles-pp.receiver
      0.04 ± 45%      +0.1        0.15 ±  9%  perf-profile.self.cycles-pp.rb_next
      0.13 ±  7%      +0.1        0.24 ±  6%  perf-profile.self.cycles-pp.__calc_delta
      0.00            +0.1        0.11 ± 12%  perf-profile.self.cycles-pp.check_preempt_curr
      0.06 ±  6%      +0.1        0.17 ± 16%  perf-profile.self.cycles-pp.wake_affine
      0.00            +0.1        0.11 ± 25%  perf-profile.self.cycles-pp.cpus_share_cache
      0.02 ±141%      +0.1        0.14 ± 27%  perf-profile.self.cycles-pp.native_irq_return_iret
      0.06            +0.1        0.19 ±  9%  perf-profile.self.cycles-pp.ttwu_queue_wakelist
      0.17 ±  4%      +0.1        0.30 ±  9%  perf-profile.self.cycles-pp.check_preempt_wakeup
      0.12 ±  6%      +0.1        0.25 ± 13%  perf-profile.self.cycles-pp._raw_spin_unlock_irqrestore
      0.15 ±  6%      +0.1        0.29 ±  3%  perf-profile.self.cycles-pp.__put_user_nocheck_8
      0.00            +0.2        0.15 ± 25%  perf-profile.self.cycles-pp.migrate_task_rq_fair
      0.10 ±  4%      +0.2        0.26 ±  7%  perf-profile.self.cycles-pp.pick_next_entity
      0.19 ±  6%      +0.2        0.34 ±  4%  perf-profile.self.cycles-pp.__wrgsbase_inactive
      0.11 ±  6%      +0.2        0.27 ± 10%  perf-profile.self.cycles-pp.perf_tp_event
      0.38 ± 22%      +0.2        0.54 ± 16%  perf-profile.self.cycles-pp.do_syscall_64
      0.22 ± 27%      +0.2        0.38 ± 11%  perf-profile.self.cycles-pp.syscall_enter_from_user_mode
      0.18 ± 16%      +0.2        0.36 ±  7%  perf-profile.self.cycles-pp.touch_atime
      0.13 ±  9%      +0.2        0.30 ± 15%  perf-profile.self.cycles-pp.resched_curr
      0.11 ±  5%      +0.2        0.30 ±  4%  perf-profile.self.cycles-pp.dequeue_entity
      0.16 ±  3%      +0.2        0.36 ± 11%  perf-profile.self.cycles-pp.select_task_rq_fair
      0.14 ±  5%      +0.2        0.34 ±  4%  perf-profile.self.cycles-pp.switch_fpu_return
      0.22 ±  6%      +0.2        0.43 ±  4%  perf-profile.self.cycles-pp.__rseq_handle_notify_resume
      0.24 ± 16%      +0.2        0.46 ±  8%  perf-profile.self.cycles-pp.__fget_light
      0.44 ± 24%      +0.2        0.66 ± 16%  perf-profile.self.cycles-pp.new_sync_write
      0.12 ±  5%      +0.2        0.34 ± 14%  perf-profile.self.cycles-pp.cpuacct_charge
      0.26 ±  6%      +0.2        0.48 ±  8%  perf-profile.self.cycles-pp.pick_next_task_fair
      0.00            +0.2        0.23 ± 26%  perf-profile.self.cycles-pp.__mutex_lock
      0.14 ± 20%      +0.2        0.38 ±  6%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
      0.28 ±  6%      +0.3        0.53 ±  3%  perf-profile.self.cycles-pp.native_sched_clock
      0.00            +0.3        0.27 ± 24%  perf-profile.self.cycles-pp.mutex_spin_on_owner
      0.18 ±  7%      +0.3        0.45 ±  5%  perf-profile.self.cycles-pp.prepare_to_wait_event
      0.24 ±  5%      +0.3        0.52 ±  7%  perf-profile.self.cycles-pp.psi_task_switch
      0.01 ±223%      +0.3        0.29 ± 42%  perf-profile.self.cycles-pp._find_next_bit
      0.48 ± 20%      +0.3        0.77 ± 11%  perf-profile.self.cycles-pp.new_sync_read
      0.22 ±  4%      +0.3        0.52 ±  8%  perf-profile.self.cycles-pp.schedule
      0.16 ± 13%      +0.3        0.51 ±  9%  perf-profile.self.cycles-pp.set_next_buddy
      0.49 ± 19%      +0.4        0.84 ±  7%  perf-profile.self.cycles-pp.vfs_read
      0.28 ±  4%      +0.4        0.65 ± 10%  perf-profile.self.cycles-pp.__get_user_8
      0.08 ± 91%      +0.4        0.45 ± 44%  perf-profile.self.cycles-pp.page_counter_uncharge
      0.20 ±  4%      +0.4        0.59 ± 14%  perf-profile.self.cycles-pp._raw_spin_lock_irq
      0.38 ±  6%      +0.4        0.77 ±  2%  perf-profile.self.cycles-pp.save_fpregs_to_fpstate
      0.19 ±  7%      +0.4        0.60 ± 14%  perf-profile.self.cycles-pp.psi_flags_change
      0.00            +0.4        0.41 ± 43%  perf-profile.self.cycles-pp.osq_lock
      0.68 ± 21%      +0.4        1.12 ± 10%  perf-profile.self.cycles-pp.fput
      0.42 ±  5%      +0.5        0.89 ±  3%  perf-profile.self.cycles-pp.__update_load_avg_se
      0.84 ±  8%      +0.5        1.33 ± 14%  perf-profile.self.cycles-pp.try_to_wake_up
      0.18 ± 22%      +0.5        0.68 ±  4%  perf-profile.self.cycles-pp.select_idle_sibling
      0.24 ±  8%      +0.5        0.78 ± 15%  perf-profile.self.cycles-pp.__wake_up_common
      0.21 ±  6%      +0.5        0.76 ±  5%  perf-profile.self.cycles-pp.dequeue_task_fair
      0.21 ±  6%      +0.6        0.77 ±  6%  perf-profile.self.cycles-pp.update_min_vruntime
      0.46 ±  5%      +0.6        1.05 ±  3%  perf-profile.self.cycles-pp.__update_load_avg_cfs_rq
      0.34 ±  3%      +0.6        0.94 ±  4%  perf-profile.self.cycles-pp.exit_to_user_mode_loop
      0.48 ±  3%      +0.6        1.09 ±  8%  perf-profile.self.cycles-pp.__switch_to_asm
      0.11 ± 28%      +0.6        0.74 ±112%  perf-profile.self.cycles-pp.switch_mm_irqs_off
      0.53 ±  4%      +0.6        1.18 ±  5%  perf-profile.self.cycles-pp.__switch_to
      0.29 ± 10%      +0.6        0.94 ± 13%  perf-profile.self.cycles-pp.reweight_entity
      0.25 ±  8%      +0.7        0.92 ±  7%  perf-profile.self.cycles-pp.update_rq_clock
      0.39 ±  7%      +0.7        1.10 ± 18%  perf-profile.self.cycles-pp.task_h_load
      0.37 ±  5%      +0.8        1.12 ±  5%  perf-profile.self.cycles-pp.prepare_task_switch
      0.15 ±  3%      +0.9        1.06 ± 34%  perf-profile.self.cycles-pp.finish_task_switch
      1.50 ± 26%      +0.9        2.44 ± 10%  perf-profile.self.cycles-pp.copy_user_enhanced_fast_string
      0.38 ±  4%      +0.9        1.32 ±  8%  perf-profile.self.cycles-pp.enqueue_task_fair
      0.29 ±  4%      +1.0        1.25 ± 11%  perf-profile.self.cycles-pp._raw_spin_lock
      0.88 ± 17%      +1.0        1.87 ±  5%  perf-profile.self.cycles-pp.pipe_read
      0.47 ±  6%      +1.0        1.46 ± 10%  perf-profile.self.cycles-pp.enqueue_entity
      0.73 ±  5%      +1.0        1.73 ±  8%  perf-profile.self.cycles-pp.restore_fpregs_from_fpstate
      0.72 ±  4%      +1.2        1.92 ±  8%  perf-profile.self.cycles-pp.update_curr
      0.87 ± 23%      +1.2        2.11 ±  4%  perf-profile.self.cycles-pp.pipe_write
      1.00 ± 23%      +1.3        2.32 ±  6%  perf-profile.self.cycles-pp.mutex_lock
      0.79 ±  4%      +1.5        2.34 ± 11%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.78 ±  4%      +1.6        2.38 ± 12%  perf-profile.self.cycles-pp.__schedule
      0.80 ± 18%      +1.7        2.49 ±  5%  perf-profile.self.cycles-pp.mutex_unlock
      1.64 ± 21%      +1.8        3.40 ±  6%  perf-profile.self.cycles-pp.__fget_files
      1.31 ±  5%      +1.8        3.13 ±  4%  perf-profile.self.cycles-pp.psi_group_change
      0.14 ± 21%      +1.8        1.96 ± 35%  perf-profile.self.cycles-pp.available_idle_cpu
      0.05            +4.0        4.03 ± 51%  perf-profile.self.cycles-pp.select_idle_cpu


***************************************************************************************************
lkp-gnr-2sp3: 256 threads 2 sockets Intel(R) Xeon(R) 6767P  CPU @ 2.4GHz (Granite Rapids) with 256G memory
=========================================================================================
compiler/cpufreq_governor/ipc/iterations/kconfig/mode/nr_threads/rootfs/tbox_group/testcase:
  gcc-12/performance/pipe/8/x86_64-bytedance-5.15-velinux/process/100%/debian-13-x86_64-20250902.cgz/lkp-gnr-2sp3/hackbench

commit: 
  c2f4451f9e ("Bluetooth: L2CAP: handle NULL sock pointer in l2cap_sock_alloc")
  7e2540f462 ("sched/fair: Ratelimit update to tg->load_avg")

c2f4451f9e7b5c73 7e2540f4625d5b6fe2e68833226 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
  20833488 ±  5%    +111.6%   44092619 ±  4%  cpuidle..usage
    579.21 ±  3%     -29.7%     407.31        uptime.boot
   1438275 ± 23%     -63.8%     521235 ± 35%  numa-meminfo.node1.Active
   1438030 ± 23%     -63.8%     521073 ± 35%  numa-meminfo.node1.Active(anon)
   2746311 ± 10%     -29.8%    1927407 ± 14%  numa-meminfo.node1.Mapped
    359121 ± 23%     -63.1%     132694 ± 36%  numa-vmstat.node1.nr_active_anon
    687031 ± 10%     -29.8%     482587 ± 14%  numa-vmstat.node1.nr_mapped
    359121 ± 23%     -63.1%     132693 ± 36%  numa-vmstat.node1.nr_zone_active_anon
      3.40 ±  9%      +4.0        7.45 ±  2%  mpstat.cpu.all.idle%
      0.00 ± 51%      -0.0        0.00 ±141%  mpstat.cpu.all.soft%
     91.89            -9.6       82.31        mpstat.cpu.all.sys%
      4.70 ±  5%      +5.5       10.24        mpstat.cpu.all.usr%
      3596            -1.5%       3541        turbostat.Bzy_MHz
      3.68 ±  9%      +4.2        7.89 ±  3%  turbostat.C1%
      2.83 ±  8%    +134.8%       6.65 ±  4%  turbostat.CPU%c1
      0.33 ±  5%    +140.7%       0.80        turbostat.IPC
    956739 ± 48%  +2.4e+06     3359381 ±  2%  turbostat.PKG_%
    625.70            +7.4%     671.72        turbostat.PkgWatt
   1439166 ± 23%     -64.0%     517668 ± 34%  meminfo.Active
   1438673 ± 23%     -64.1%     517175 ± 34%  meminfo.Active(anon)
    246764 ±  2%     -10.1%     221851 ±  2%  meminfo.KReclaimable
    131308 ±  2%     +20.6%     158297        meminfo.KernelStack
   3327098 ± 10%     -26.2%    2456460 ± 13%  meminfo.Mapped
    203193 ±  2%     +23.7%     251424        meminfo.PageTables
    246764 ±  2%     -10.1%     221851 ±  2%  meminfo.SReclaimable
    904966 ±  6%    +121.6%    2004976 ±  7%  hackbench.throughput
    778908 ±  6%    +123.8%    1743138        hackbench.throughput_avg
    904966 ±  6%    +121.6%    2004976 ±  7%  hackbench.throughput_best
    640821 ± 14%    +121.1%    1416951 ±  6%  hackbench.throughput_worst
    315.58 ±  6%     -54.5%     143.73        hackbench.time.elapsed_time
    315.58 ±  6%     -54.5%     143.73        hackbench.time.elapsed_time.max
 3.281e+09 ±  2%      +3.9%  3.411e+09        hackbench.time.involuntary_context_switches
     24720            -3.9%      23752        hackbench.time.percent_of_cpu_this_job_got
     73571 ±  7%     -58.8%      30303        hackbench.time.system_time
      4460 ±  2%     -14.0%       3836        hackbench.time.user_time
    360927 ± 23%     -63.7%     130868 ± 36%  proc-vmstat.nr_active_anon
    130680 ±  2%     +21.3%     158462        proc-vmstat.nr_kernel_stack
    833840 ±  9%     -26.8%     610517 ± 13%  proc-vmstat.nr_mapped
     50488 ±  3%     +24.8%      62993        proc-vmstat.nr_page_table_pages
     61699 ±  2%     -10.1%      55495 ±  2%  proc-vmstat.nr_slab_reclaimable
    197120            +3.1%     203293        proc-vmstat.nr_slab_unreclaimable
    360927 ± 23%     -63.7%     130868 ± 36%  proc-vmstat.nr_zone_active_anon
    612037 ± 75%     -78.8%     129660 ±144%  proc-vmstat.pgactivate
   4371437            -8.9%    3980546        proc-vmstat.pgfault
 1.564e+08 ±  2%      -4.7%  1.491e+08 ±  3%  proc-vmstat.pgfree
    177207            -6.6%     165523 ±  3%  proc-vmstat.pgreuse
      0.38 ± 14%     -26.0%       0.28 ±  5%  perf-stat.i.MPKI
 6.202e+10 ±  4%    +125.3%  1.398e+11        perf-stat.i.branch-instructions
      0.75            -0.1        0.62        perf-stat.i.branch-miss-rate%
 3.755e+08 ±  4%    +119.3%  8.235e+08        perf-stat.i.branch-misses
      4.22 ±  6%      +0.7        4.90 ±  5%  perf-stat.i.cache-miss-rate%
  58349889 ±  7%     +83.0%  1.068e+08 ±  5%  perf-stat.i.cache-misses
 1.498e+09 ±  2%     +76.5%  2.644e+09 ±  3%  perf-stat.i.cache-references
  26074865 ±  4%    +122.2%   57950783        perf-stat.i.context-switches
      5.49 ±  3%     -74.3%       1.41        perf-stat.i.cpi
 8.955e+11            -6.4%  8.382e+11        perf-stat.i.cpu-cycles
   3505706           +53.4%    5376417 ±  3%  perf-stat.i.cpu-migrations
     19369 ±  4%     -47.9%      10085 ±  3%  perf-stat.i.cycles-between-cache-misses
 2.948e+11 ±  4%    +125.3%  6.642e+11        perf-stat.i.instructions
      0.33 ±  5%    +133.1%       0.77        perf-stat.i.ipc
     34.54 ± 22%    +252.4%     121.72 ± 27%  perf-stat.i.major-faults
    115.63 ±  4%    +113.9%     247.37        perf-stat.i.metric.K/sec
     14297 ±  6%    +119.5%      31376        perf-stat.i.minor-faults
     14331 ±  6%    +119.8%      31498        perf-stat.i.page-faults
      0.20 ± 13%     -23.3%       0.15 ±  3%  perf-stat.overall.MPKI
      3.00 ±  5%     -58.3%       1.25        perf-stat.overall.cpi
     15225 ±  9%     -46.2%       8193 ±  3%  perf-stat.overall.cycles-between-cache-misses
      0.33 ±  5%    +138.9%       0.80        perf-stat.overall.ipc
  6.26e+10 ±  5%    +125.1%  1.409e+11        perf-stat.ps.branch-instructions
 3.753e+08 ±  4%    +120.6%  8.278e+08        perf-stat.ps.branch-misses
  58871719 ±  8%     +73.9%  1.024e+08 ±  3%  perf-stat.ps.cache-misses
 1.502e+09 ±  3%     +69.0%  2.537e+09 ±  3%  perf-stat.ps.cache-references
  26126345 ±  5%    +125.0%   58774460        perf-stat.ps.context-switches
  8.89e+11            -5.8%  8.378e+11        perf-stat.ps.cpu-cycles
   3454640           +50.3%    5192572 ±  3%  perf-stat.ps.cpu-migrations
 2.976e+11 ±  5%    +125.2%  6.701e+11        perf-stat.ps.instructions
     31.65 ± 19%    +210.5%      98.26 ± 25%  perf-stat.ps.major-faults
     13348 ±  5%     +97.4%      26350        perf-stat.ps.minor-faults
     13380 ±  5%     +97.7%      26449        perf-stat.ps.page-faults
  9.39e+13            +3.2%  9.692e+13        perf-stat.total.instructions
      2.93 ± 18%     +46.8%       4.30 ± 10%  sched_debug.cfs_rq:/.h_nr_running.stddev
    255320 ± 62%    +131.5%     591014 ± 43%  sched_debug.cfs_rq:/.load.max
     17542 ± 62%    +118.9%      38395 ± 45%  sched_debug.cfs_rq:/.load.stddev
    202.94 ± 31%     +96.4%     398.56 ± 34%  sched_debug.cfs_rq:/.load_avg.max
     16.71 ± 28%     +86.7%      31.21 ± 35%  sched_debug.cfs_rq:/.load_avg.stddev
  38554133 ± 10%     -59.4%   15634213        sched_debug.cfs_rq:/.min_vruntime.avg
  42761098 ± 10%     -57.7%   18091099 ±  2%  sched_debug.cfs_rq:/.min_vruntime.max
  30407647 ± 13%     -56.7%   13176353 ±  2%  sched_debug.cfs_rq:/.min_vruntime.min
      0.08 ± 15%     +29.4%       0.10 ± 11%  sched_debug.cfs_rq:/.nr_running.stddev
      5196 ± 16%     +25.5%       6520 ±  9%  sched_debug.cfs_rq:/.runnable_avg.avg
     10316 ± 18%     +30.1%      13421 ±  9%  sched_debug.cfs_rq:/.runnable_avg.max
      1596 ± 11%     +25.3%       2000 ±  7%  sched_debug.cfs_rq:/.runnable_avg.stddev
  -8365601           -78.5%   -1800275        sched_debug.cfs_rq:/.spread0.min
    295.17 ± 29%     -69.3%      90.50 ± 46%  sched_debug.cfs_rq:/.util_avg.min
    414.08 ± 12%     -22.5%     321.02 ±  3%  sched_debug.cfs_rq:/.util_est_enqueued.avg
     23.88 ± 38%     -76.5%       5.61 ±125%  sched_debug.cfs_rq:/.util_est_enqueued.min
   1882452 ± 19%     -37.1%    1183337 ± 21%  sched_debug.cpu.avg_idle.max
    328077 ± 11%     -29.9%     229962 ±  8%  sched_debug.cpu.avg_idle.stddev
    405110 ±  3%     -20.0%     324252        sched_debug.cpu.clock.avg
    405698 ±  3%     -19.9%     324778        sched_debug.cpu.clock.max
    404481 ±  3%     -20.1%     323374        sched_debug.cpu.clock.min
    405110 ±  3%     -20.0%     324252        sched_debug.cpu.clock_task.avg
    405698 ±  3%     -19.9%     324778        sched_debug.cpu.clock_task.max
    404481 ±  3%     -20.1%     323374        sched_debug.cpu.clock_task.min
     53298 ±  5%      -9.0%      48521 ±  2%  sched_debug.cpu.curr->pid.max
     19052 ± 42%     -68.8%       5953 ± 94%  sched_debug.cpu.curr->pid.min
    687702 ±  9%     -25.1%     515334 ±  5%  sched_debug.cpu.max_idle_balance_cost.avg
   1769952 ± 16%     -60.7%     696059 ± 37%  sched_debug.cpu.max_idle_balance_cost.max
    226440 ± 31%     -86.2%      31178 ±158%  sched_debug.cpu.max_idle_balance_cost.stddev
      2.94 ± 18%     +47.9%       4.34 ± 10%  sched_debug.cpu.nr_running.stddev
  18641069 ±  4%     -11.5%   16498500 ±  3%  sched_debug.cpu.nr_switches.max
    404469 ±  3%     -20.1%     323342        sched_debug.cpu_clk
    404165 ±  3%     -20.1%     323039        sched_debug.ktime
      0.00 ±  8%     +87.5%       0.00        sched_debug.rt_rq:.rt_nr_migratory.avg
      0.18 ±  8%     +87.5%       0.33        sched_debug.rt_rq:.rt_nr_migratory.max
      0.01 ±  8%     +87.5%       0.02        sched_debug.rt_rq:.rt_nr_migratory.stddev
      0.00 ±  8%     +87.5%       0.00        sched_debug.rt_rq:.rt_nr_running.avg
      0.18 ±  8%     +87.5%       0.33        sched_debug.rt_rq:.rt_nr_running.max
      0.01 ±  8%     +87.5%       0.02        sched_debug.rt_rq:.rt_nr_running.stddev
    405886 ±  3%     -20.0%     324769        sched_debug.sched_clk
     95.53 ±  2%     -32.2       63.34 ± 44%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.create_worker
     95.79 ±  2%     -31.6       64.15 ± 44%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.create_worker
     97.19           -28.1       69.09 ± 44%  perf-profile.calltrace.cycles-pp.create_worker
     34.01 ± 16%     -26.0        8.04 ±  2%  perf-profile.calltrace.cycles-pp.enqueue_task_fair.enqueue_task.ttwu_do_activate.try_to_wake_up.autoremove_wake_function
     34.71 ± 15%     -24.5       10.20 ±  2%  perf-profile.calltrace.cycles-pp.enqueue_task.ttwu_do_activate.try_to_wake_up.autoremove_wake_function.__wake_up_common
     34.73 ± 15%     -24.4       10.30 ±  2%  perf-profile.calltrace.cycles-pp.ttwu_do_activate.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock
     24.24 ± 17%     -22.5        1.79 ± 11%  perf-profile.calltrace.cycles-pp.update_cfs_group.enqueue_task_fair.enqueue_task.ttwu_do_activate.try_to_wake_up
     23.91 ± 19%     -22.1        1.85 ± 11%  perf-profile.calltrace.cycles-pp.update_cfs_group.dequeue_task_fair.__schedule.schedule.pipe_read
     48.18 ±  8%     -21.2       27.03 ±  8%  perf-profile.calltrace.cycles-pp.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock.pipe_write
     48.22 ±  8%     -21.1       27.16 ±  8%  perf-profile.calltrace.cycles-pp.autoremove_wake_function.__wake_up_common.__wake_up_common_lock.pipe_write.new_sync_write
     49.20 ±  8%     -20.6       28.60 ±  8%  perf-profile.calltrace.cycles-pp.__wake_up_common_lock.pipe_write.new_sync_write.vfs_write.ksys_write
     48.43 ±  8%     -20.5       27.92 ±  8%  perf-profile.calltrace.cycles-pp.__wake_up_common.__wake_up_common_lock.pipe_write.new_sync_write.vfs_write
     51.73 ±  3%     -20.3       31.40 ± 43%  perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.create_worker
     26.72 ± 16%     -20.2        6.54 ±  3%  perf-profile.calltrace.cycles-pp.dequeue_task_fair.__schedule.schedule.pipe_read.new_sync_read
     51.90 ±  3%     -19.9       32.01 ± 43%  perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.create_worker
     34.10 ± 11%     -17.1       17.02 ±  3%  perf-profile.calltrace.cycles-pp.__schedule.schedule.pipe_read.new_sync_read.vfs_read
     34.31 ± 11%     -16.8       17.49 ±  3%  perf-profile.calltrace.cycles-pp.schedule.pipe_read.new_sync_read.vfs_read.ksys_read
     37.04 ±  4%     -15.1       21.95 ± 45%  perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.create_worker
     37.28 ±  4%     -14.6       22.70 ± 45%  perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.create_worker
     51.38 ±  4%     -10.6       40.81 ±  3%  perf-profile.calltrace.cycles-pp.pipe_write.new_sync_write.vfs_write.ksys_write.do_syscall_64
     51.57 ±  4%      -9.9       41.64 ±  3%  perf-profile.calltrace.cycles-pp.new_sync_write.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      8.24 ± 22%      -7.6        0.64 ± 46%  perf-profile.calltrace.cycles-pp.update_load_avg.enqueue_entity.enqueue_task_fair.enqueue_task.ttwu_do_activate
     36.80 ±  5%      -7.3       29.49 ±  2%  perf-profile.calltrace.cycles-pp.pipe_read.new_sync_read.vfs_read.ksys_read.do_syscall_64
     36.97 ±  4%      -6.7       30.30 ±  2%  perf-profile.calltrace.cycles-pp.new_sync_read.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      8.82 ± 20%      -5.7        3.13 ±  5%  perf-profile.calltrace.cycles-pp.enqueue_entity.enqueue_task_fair.enqueue_task.ttwu_do_activate.try_to_wake_up
      8.58 ± 18%      -4.8        3.74 ±  5%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.raw_spin_rq_lock_nested.try_to_wake_up.autoremove_wake_function
      8.69 ± 17%      -4.5        4.15 ±  4%  perf-profile.calltrace.cycles-pp._raw_spin_lock.raw_spin_rq_lock_nested.try_to_wake_up.autoremove_wake_function.__wake_up_common
      8.69 ± 17%      -4.5        4.16 ±  4%  perf-profile.calltrace.cycles-pp.raw_spin_rq_lock_nested.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock
      5.55 ± 17%      -4.2        1.39 ± 24%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.raw_spin_rq_lock_nested.__schedule.schedule
      2.63 ± 28%      -2.2        0.40 ± 71%  perf-profile.calltrace.cycles-pp._raw_spin_lock.raw_spin_rq_lock_nested.__schedule.schedule.exit_to_user_mode_loop
      2.64 ± 28%      -2.2        0.41 ± 71%  perf-profile.calltrace.cycles-pp.raw_spin_rq_lock_nested.__schedule.schedule.exit_to_user_mode_loop.exit_to_user_mode_prepare
      3.04 ± 20%      -1.4        1.65 ±  5%  perf-profile.calltrace.cycles-pp._raw_spin_lock.raw_spin_rq_lock_nested.__schedule.schedule.pipe_read
      3.04 ± 20%      -1.4        1.66 ±  5%  perf-profile.calltrace.cycles-pp.raw_spin_rq_lock_nested.__schedule.schedule.pipe_read.new_sync_read
      1.98 ± 19%      -1.3        0.68 ± 46%  perf-profile.calltrace.cycles-pp.set_next_entity.pick_next_task_fair.pick_next_task.__schedule.schedule
      1.62 ± 17%      -1.0        0.62 ± 46%  perf-profile.calltrace.cycles-pp.update_load_avg.dequeue_entity.dequeue_task_fair.__schedule.schedule
      2.23 ± 15%      -1.0        1.28 ± 10%  perf-profile.calltrace.cycles-pp.pick_next_task_fair.pick_next_task.__schedule.schedule.pipe_read
      2.26 ± 14%      -0.9        1.38 ± 10%  perf-profile.calltrace.cycles-pp.pick_next_task.__schedule.schedule.pipe_read.new_sync_read
      0.00            +0.6        0.60 ±  3%  perf-profile.calltrace.cycles-pp.__switch_to
      0.46 ± 45%      +0.7        1.12 ± 11%  perf-profile.calltrace.cycles-pp.pick_next_task.__schedule.schedule.exit_to_user_mode_loop.exit_to_user_mode_prepare
      0.35 ± 71%      +0.7        1.02 ± 11%  perf-profile.calltrace.cycles-pp.pick_next_task_fair.pick_next_task.__schedule.schedule.exit_to_user_mode_loop
      0.09 ±223%      +0.7        0.77 ± 19%  perf-profile.calltrace.cycles-pp.copy_user_enhanced_fast_string.copy_page_from_iter.pipe_write.new_sync_write.vfs_write
      0.00            +0.7        0.73 ± 17%  perf-profile.calltrace.cycles-pp.file_update_time.pipe_write.new_sync_write.vfs_write.ksys_write
      0.00            +0.7        0.74 ±  3%  perf-profile.calltrace.cycles-pp.load_new_mm_cr3.switch_mm_irqs_off.__schedule.schedule.exit_to_user_mode_loop
      0.09 ±223%      +0.7        0.83 ± 18%  perf-profile.calltrace.cycles-pp.touch_atime.pipe_read.new_sync_read.vfs_read.ksys_read
      0.00            +0.8        0.75 ±  3%  perf-profile.calltrace.cycles-pp.save_fpregs_to_fpstate
      4.25 ±  8%      +0.8        5.00 ±  2%  perf-profile.calltrace.cycles-pp.__schedule.schedule.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      0.08 ±223%      +0.8        0.88 ± 19%  perf-profile.calltrace.cycles-pp.rseq_get_rseq_cs.rseq_ip_fixup.__rseq_handle_notify_resume.exit_to_user_mode_loop.exit_to_user_mode_prepare
      0.00            +0.8        0.82 ± 19%  perf-profile.calltrace.cycles-pp.__get_user_8.rseq_get_rseq_cs.rseq_ip_fixup.__rseq_handle_notify_resume.exit_to_user_mode_loop
      0.00            +0.8        0.84 ± 20%  perf-profile.calltrace.cycles-pp.task_h_load.wake_affine.select_task_rq_fair.try_to_wake_up.autoremove_wake_function
      4.30 ±  7%      +0.9        5.17 ±  2%  perf-profile.calltrace.cycles-pp.schedule.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.09 ±223%      +0.9        0.96 ±  5%  perf-profile.calltrace.cycles-pp.load_new_mm_cr3.switch_mm_irqs_off.__schedule.schedule.pipe_read
      0.00            +0.9        0.94 ± 17%  perf-profile.calltrace.cycles-pp.switch_mm_irqs_off.__schedule.schedule.exit_to_user_mode_loop.exit_to_user_mode_prepare
      0.00            +1.0        1.01 ± 12%  perf-profile.calltrace.cycles-pp.update_curr.dequeue_entity.dequeue_task_fair.__schedule.schedule
      0.10 ±223%      +1.1        1.17 ± 16%  perf-profile.calltrace.cycles-pp.switch_mm_irqs_off.__schedule.schedule.pipe_read.new_sync_read
      0.41 ± 74%      +1.1        1.54 ± 10%  perf-profile.calltrace.cycles-pp.restore_fpregs_from_fpstate.switch_fpu_return.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.10 ±223%      +1.2        1.25 ±  3%  perf-profile.calltrace.cycles-pp.__switch_to_asm
      0.12 ±223%      +1.2        1.30 ± 11%  perf-profile.calltrace.cycles-pp.psi_group_change.psi_task_change.enqueue_task.ttwu_do_activate.try_to_wake_up
      0.13 ±223%      +1.2        1.32 ±  7%  perf-profile.calltrace.cycles-pp.psi_group_change.psi_task_switch.__schedule.schedule.pipe_read
      0.53 ± 48%      +1.2        1.72 ±  2%  perf-profile.calltrace.cycles-pp.psi_task_change.enqueue_task.ttwu_do_activate.try_to_wake_up.autoremove_wake_function
      0.19 ±142%      +1.2        1.38 ±  6%  perf-profile.calltrace.cycles-pp.wake_affine.select_task_rq_fair.try_to_wake_up.autoremove_wake_function.__wake_up_common
      0.55 ± 51%      +1.2        1.75 ± 10%  perf-profile.calltrace.cycles-pp.__rseq_handle_notify_resume.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.12 ±223%      +1.2        1.36 ± 10%  perf-profile.calltrace.cycles-pp.rseq_ip_fixup.__rseq_handle_notify_resume.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      0.11 ±223%      +1.2        1.35 ± 10%  perf-profile.calltrace.cycles-pp.prepare_to_wait_event.pipe_read.new_sync_read.vfs_read.ksys_read
      0.15 ±223%      +1.3        1.41 ± 15%  perf-profile.calltrace.cycles-pp.copy_page_from_iter.pipe_write.new_sync_write.vfs_write.ksys_write
      0.58 ± 50%      +1.4        1.95 ±  2%  perf-profile.calltrace.cycles-pp.switch_fpu_return.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.45 ± 84%      +1.6        2.09 ±  2%  perf-profile.calltrace.cycles-pp.psi_task_switch.__schedule.schedule.pipe_read.new_sync_read
      0.17 ±223%      +1.8        1.99 ± 13%  perf-profile.calltrace.cycles-pp.copy_user_enhanced_fast_string.copy_page_to_iter.pipe_read.new_sync_read.vfs_read
      0.16 ±223%      +2.2        2.32 ±  7%  perf-profile.calltrace.cycles-pp.mutex_unlock.pipe_write.new_sync_write.vfs_write.ksys_write
      0.18 ±223%      +2.5        2.66 ±  5%  perf-profile.calltrace.cycles-pp.mutex_lock.pipe_write.new_sync_write.vfs_write.ksys_write
      0.24 ±223%      +2.6        2.82 ±  7%  perf-profile.calltrace.cycles-pp.copy_page_to_iter.pipe_read.new_sync_read.vfs_read.ksys_read
      5.23 ±  2%      +2.9        8.10 ±  2%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.08 ±223%      +3.6        3.72 ± 95%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.08 ±223%      +3.9        3.94 ± 96%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.01 ±137%      +6.3        8.34 ± 28%  perf-profile.calltrace.cycles-pp.select_task_rq_fair.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock
      0.19 ±143%      +9.4        9.57 ±109%  perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.19 ±143%      +9.6        9.84 ±110%  perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.85 ± 23%     +24.7       25.58 ±112%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.85 ± 23%     +25.0       25.87 ±112%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
     49.68 ± 16%     -45.2        4.52 ±  5%  perf-profile.children.cycles-pp.update_cfs_group
     97.07           -28.9       68.16 ± 44%  perf-profile.children.cycles-pp.create_worker
     34.55 ± 13%     -25.8        8.74 ±  3%  perf-profile.children.cycles-pp.enqueue_task_fair
     35.26 ± 13%     -24.4       10.86 ±  3%  perf-profile.children.cycles-pp.enqueue_task
     35.27 ± 13%     -24.3       10.96 ±  3%  perf-profile.children.cycles-pp.ttwu_do_activate
     48.68 ±  7%     -20.0       28.69 ±  7%  perf-profile.children.cycles-pp.autoremove_wake_function
     27.09 ± 14%     -19.9        7.15 ±  3%  perf-profile.children.cycles-pp.dequeue_task_fair
     48.69 ±  7%     -19.8       28.86 ±  7%  perf-profile.children.cycles-pp.try_to_wake_up
     48.89 ±  6%     -19.4       29.47 ±  7%  perf-profile.children.cycles-pp.__wake_up_common
     49.68 ±  6%     -19.4       30.27 ±  7%  perf-profile.children.cycles-pp.__wake_up_common_lock
     39.49 ±  9%     -15.9       23.61 ±  3%  perf-profile.children.cycles-pp.__schedule
     39.55 ±  9%     -15.6       23.92 ±  3%  perf-profile.children.cycles-pp.schedule
     51.42 ±  4%     -10.4       41.02 ±  3%  perf-profile.children.cycles-pp.pipe_write
     51.80 ±  4%      -9.8       42.00 ±  3%  perf-profile.children.cycles-pp.new_sync_write
     51.97 ±  3%      -9.2       42.77 ±  3%  perf-profile.children.cycles-pp.vfs_write
     52.15 ±  3%      -8.5       43.60 ±  2%  perf-profile.children.cycles-pp.ksys_write
     14.54 ± 16%      -8.4        6.13 ±  6%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
     12.72 ± 18%      -8.4        4.37 ±  4%  perf-profile.children.cycles-pp.update_load_avg
     14.74 ± 15%      -7.9        6.86 ±  5%  perf-profile.children.cycles-pp.raw_spin_rq_lock_nested
     14.79 ± 15%      -7.7        7.06 ±  4%  perf-profile.children.cycles-pp._raw_spin_lock
     37.14 ±  5%      -7.4       29.70 ±  2%  perf-profile.children.cycles-pp.pipe_read
     96.67 ±  2%      -7.2       89.51        perf-profile.children.cycles-pp.do_syscall_64
     37.28 ±  5%      -6.9       30.37 ±  2%  perf-profile.children.cycles-pp.new_sync_read
     96.90 ±  2%      -6.5       90.40        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     37.53 ±  4%      -5.9       31.60 ±  2%  perf-profile.children.cycles-pp.vfs_read
      9.18 ± 15%      -5.6        3.54 ±  4%  perf-profile.children.cycles-pp.enqueue_entity
     37.77 ±  4%      -5.2       32.62 ±  2%  perf-profile.children.cycles-pp.ksys_read
      2.18 ± 14%      -0.9        1.26 ±  3%  perf-profile.children.cycles-pp.set_next_entity
      0.92 ± 20%      -0.6        0.36 ±  9%  perf-profile.children.cycles-pp.scheduler_tick
      0.83 ± 20%      -0.5        0.30 ± 11%  perf-profile.children.cycles-pp.task_tick_fair
      0.96 ± 18%      -0.4        0.52 ±  7%  perf-profile.children.cycles-pp.tick_sched_handle
      0.95 ± 19%      -0.4        0.51 ±  7%  perf-profile.children.cycles-pp.update_process_times
      0.96 ± 18%      -0.4        0.55 ±  6%  perf-profile.children.cycles-pp.tick_sched_timer
      0.97 ± 18%      -0.4        0.56 ±  6%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      1.02 ± 16%      -0.3        0.72 ±  7%  perf-profile.children.cycles-pp.hrtimer_interrupt
      1.03 ± 16%      -0.3        0.72 ±  7%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      1.07 ± 15%      -0.3        0.80 ±  6%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      1.09 ± 15%      -0.3        0.82 ±  6%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.23 ± 12%      -0.1        0.11 ±  6%  perf-profile.children.cycles-pp.__task_rq_lock
      0.06 ±  9%      +0.0        0.08 ± 10%  perf-profile.children.cycles-pp.perf_mmap__read_head
      0.06 ±  6%      +0.0        0.09 ±  9%  perf-profile.children.cycles-pp.__get_user_nocheck_1
      0.03 ±100%      +0.0        0.08 ±  6%  perf-profile.children.cycles-pp.copy_page_from_iter_atomic
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.xfd_validate_state
      0.00            +0.1        0.05 ±  7%  perf-profile.children.cycles-pp.schedule_preempt_disabled
      0.00            +0.1        0.05 ±  7%  perf-profile.children.cycles-pp.sysvec_reschedule_ipi
      0.10 ± 12%      +0.1        0.16 ±  6%  perf-profile.children.cycles-pp.check_spread
      0.00            +0.1        0.06 ±  8%  perf-profile.children.cycles-pp.raw_spin_rq_unlock
      0.00            +0.1        0.07 ±  7%  perf-profile.children.cycles-pp.dequeue_task
      0.04 ± 71%      +0.1        0.10 ±  9%  perf-profile.children.cycles-pp.generic_update_time
      0.00            +0.1        0.07 ± 16%  perf-profile.children.cycles-pp.nohz_balancer_kick
      0.00            +0.1        0.07 ± 18%  perf-profile.children.cycles-pp.llist_reverse_order
      0.00            +0.1        0.07 ±  5%  perf-profile.children.cycles-pp.sched_clock
      0.01 ±223%      +0.1        0.08 ± 23%  perf-profile.children.cycles-pp.__alloc_pages
      0.00            +0.1        0.07 ±  6%  perf-profile.children.cycles-pp.perf_exclude_event
      0.01 ±223%      +0.1        0.08 ±  5%  perf-profile.children.cycles-pp.place_entity
      0.08 ±  5%      +0.1        0.16 ±  8%  perf-profile.children.cycles-pp.remove_entity_load_avg
      0.00            +0.1        0.08 ± 29%  perf-profile.children.cycles-pp.is_cpu_allowed
      0.05 ±  7%      +0.1        0.14 ±  4%  perf-profile.children.cycles-pp.cpus_share_cache
      0.00            +0.1        0.09 ±  7%  perf-profile.children.cycles-pp.rcu_note_context_switch
      0.01 ±223%      +0.1        0.10 ±  7%  perf-profile.children.cycles-pp.rcu_read_unlock_strict
      0.03 ±100%      +0.1        0.12 ±  6%  perf-profile.children.cycles-pp.rb_insert_color
      0.00            +0.1        0.09 ±  9%  perf-profile.children.cycles-pp.wake_q_add
      0.06 ± 14%      +0.1        0.16 ±  6%  perf-profile.children.cycles-pp.__mark_inode_dirty
      0.00            +0.1        0.10 ± 15%  perf-profile.children.cycles-pp.__x2apic_send_IPI_dest
      0.00            +0.1        0.10 ± 21%  perf-profile.children.cycles-pp.tracing_gen_ctx_irq_test
      0.01 ±223%      +0.1        0.10 ±  7%  perf-profile.children.cycles-pp.__bitmap_and
      0.01 ±223%      +0.1        0.11 ± 11%  perf-profile.children.cycles-pp.__x64_sys_read
      0.00            +0.1        0.10 ± 17%  perf-profile.children.cycles-pp.native_write_msr
      0.19 ± 16%      +0.1        0.29 ± 11%  perf-profile.children.cycles-pp.resched_curr
      0.01 ±223%      +0.1        0.12 ±  9%  perf-profile.children.cycles-pp.__x64_sys_write
      0.01 ±223%      +0.1        0.11 ±  8%  perf-profile.children.cycles-pp.anon_pipe_buf_release
      0.00            +0.1        0.11 ± 47%  perf-profile.children.cycles-pp.wait_consider_task
      0.00            +0.1        0.11 ± 12%  perf-profile.children.cycles-pp.clockevents_program_event
      0.00            +0.1        0.11 ± 47%  perf-profile.children.cycles-pp.do_wait
      0.00            +0.1        0.11 ± 47%  perf-profile.children.cycles-pp.kernel_wait4
      0.00            +0.1        0.11 ± 12%  perf-profile.children.cycles-pp.ktime_get
      0.01 ±223%      +0.1        0.13 ±  9%  perf-profile.children.cycles-pp.__cgroup_account_cputime
      0.06 ± 51%      +0.1        0.18 ±  4%  perf-profile.children.cycles-pp.rb_erase
      0.01 ±223%      +0.1        0.13 ± 22%  perf-profile.children.cycles-pp.perf_trace_buf_update
      0.01 ±223%      +0.1        0.13 ±  8%  perf-profile.children.cycles-pp.__cgroup_account_cputime_field
      0.01 ±223%      +0.1        0.14 ±  5%  perf-profile.children.cycles-pp.cgroup_rstat_updated
      0.01 ±223%      +0.1        0.14 ±  4%  perf-profile.children.cycles-pp.native_load_tls
      0.01 ±223%      +0.1        0.14 ±  5%  perf-profile.children.cycles-pp.rb_next
      0.02 ±142%      +0.1        0.15 ±  6%  perf-profile.children.cycles-pp.mem_cgroup_handle_over_high
      0.06 ± 56%      +0.1        0.20 ±  4%  perf-profile.children.cycles-pp.__rdgsbase_inactive
      0.07 ± 17%      +0.1        0.21 ±  7%  perf-profile.children.cycles-pp.asm_sysvec_reschedule_ipi
      0.01 ±223%      +0.1        0.15 ±  4%  perf-profile.children.cycles-pp.clear_buddies
      0.02 ±223%      +0.1        0.16 ± 10%  perf-profile.children.cycles-pp.amd_clear_divider
      0.06 ± 53%      +0.1        0.20 ±  4%  perf-profile.children.cycles-pp.finish_wait
      0.00            +0.1        0.14 ± 14%  perf-profile.children.cycles-pp.flush_smp_call_function_queue
      0.01 ±223%      +0.1        0.15 ±  4%  perf-profile.children.cycles-pp.native_irq_return_iret
      0.02 ±223%      +0.1        0.16 ± 14%  perf-profile.children.cycles-pp.fsnotify_perm
      0.08 ± 81%      +0.2        0.23 ± 38%  perf-profile.children.cycles-pp.__ordered_events__flush
      0.06 ± 59%      +0.2        0.21 ±  6%  perf-profile.children.cycles-pp.account_run_delay_time
      0.02 ±223%      +0.2        0.17 ± 14%  perf-profile.children.cycles-pp.iov_iter_init
      0.09 ± 39%      +0.2        0.25 ±  2%  perf-profile.children.cycles-pp.__calc_delta
      0.02 ±223%      +0.2        0.18 ± 12%  perf-profile.children.cycles-pp.page_copy_sane
      0.02 ±223%      +0.2        0.20 ±  9%  perf-profile.children.cycles-pp.inode_needs_update_time
      0.08 ± 22%      +0.2        0.27 ±  4%  perf-profile.children.cycles-pp.pick_next_entity
      0.13 ± 10%      +0.2        0.33 ±  4%  perf-profile.children.cycles-pp.migrate_task_rq_fair
      0.31 ±  9%      +0.2        0.52 ±  5%  perf-profile.children.cycles-pp.put_prev_entity
      0.10 ± 34%      +0.2        0.31 ±  3%  perf-profile.children.cycles-pp.__put_user_nocheck_8
      0.02 ±223%      +0.2        0.24 ± 14%  perf-profile.children.cycles-pp.rw_verify_area
      0.03 ±223%      +0.2        0.24 ± 10%  perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.05 ± 87%      +0.2        0.28 ±  7%  perf-profile.children.cycles-pp.kill_fasync
      0.02 ±223%      +0.2        0.26 ± 12%  perf-profile.children.cycles-pp.fpregs_assert_state_consistent
      0.20 ±  8%      +0.2        0.44 ±  5%  perf-profile.children.cycles-pp.set_task_cpu
      0.10 ± 36%      +0.2        0.34 ±  4%  perf-profile.children.cycles-pp.__wrgsbase_inactive
      0.02 ±223%      +0.2        0.27 ± 13%  perf-profile.children.cycles-pp.security_file_permission
      0.16 ± 23%      +0.2        0.40 ±  4%  perf-profile.children.cycles-pp.___perf_sw_event
      0.10 ± 21%      +0.2        0.35 ±  4%  perf-profile.children.cycles-pp.cpuacct_charge
      0.02 ±223%      +0.2        0.27 ±  5%  perf-profile.children.cycles-pp.wake_up_q
      0.04 ±133%      +0.3        0.31 ± 11%  perf-profile.children.cycles-pp.rcu_all_qs
      0.02 ±223%      +0.3        0.29 ±  9%  perf-profile.children.cycles-pp.select_idle_core
      0.62 ±  9%      +0.3        0.90 ±  4%  perf-profile.children.cycles-pp.finish_task_switch
      0.11 ± 32%      +0.3        0.38 ± 20%  perf-profile.children.cycles-pp.perf_tp_event
      0.05 ±136%      +0.3        0.36 ± 12%  perf-profile.children.cycles-pp.ktime_get_coarse_real_ts64
      0.03 ±223%      +0.3        0.34 ±  7%  perf-profile.children.cycles-pp.ttwu_queue_wakelist
      0.02 ±223%      +0.3        0.36 ± 11%  perf-profile.children.cycles-pp.mutex_spin_on_owner
      0.38 ± 15%      +0.3        0.72 ±  3%  perf-profile.children.cycles-pp.check_preempt_wakeup
      0.12 ± 43%      +0.4        0.47 ±  6%  perf-profile.children.cycles-pp.set_next_buddy
      0.16 ± 34%      +0.4        0.55 ±  4%  perf-profile.children.cycles-pp.native_sched_clock
      0.02 ±223%      +0.4        0.42 ±  5%  perf-profile.children.cycles-pp.__mutex_unlock_slowpath
      0.03 ±223%      +0.4        0.44 ± 17%  perf-profile.children.cycles-pp.osq_lock
      0.07 ±110%      +0.4        0.48 ±  6%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
      0.18 ± 35%      +0.4        0.63 ± 23%  perf-profile.children.cycles-pp.perf_trace_sched_wakeup_template
      0.15 ± 29%      +0.4        0.60 ±  6%  perf-profile.children.cycles-pp.psi_flags_change
      0.41 ± 17%      +0.5        0.87 ±  3%  perf-profile.children.cycles-pp.check_preempt_curr
      0.18 ± 24%      +0.5        0.64 ±  2%  perf-profile.children.cycles-pp._raw_spin_lock_irq
      0.21 ± 34%      +0.5        0.71 ±  4%  perf-profile.children.cycles-pp.sched_clock_cpu
      0.43 ± 18%      +0.5        0.95 ±  3%  perf-profile.children.cycles-pp.ttwu_do_wakeup
      0.09 ±107%      +0.5        0.61 ± 10%  perf-profile.children.cycles-pp.syscall_enter_from_user_mode
      0.25 ± 36%      +0.5        0.78 ±  3%  perf-profile.children.cycles-pp.save_fpregs_to_fpstate
      0.03 ±223%      +0.5        0.56 ± 41%  perf-profile.children.cycles-pp.page_counter_uncharge
      0.32 ± 36%      +0.6        0.90 ±  2%  perf-profile.children.cycles-pp.__update_load_avg_se
      0.03 ±223%      +0.6        0.63 ± 39%  perf-profile.children.cycles-pp.uncharge_batch
      0.14 ± 82%      +0.6        0.74 ± 11%  perf-profile.children.cycles-pp.__cond_resched
      0.03 ±223%      +0.6        0.64 ± 39%  perf-profile.children.cycles-pp.__mem_cgroup_uncharge
      0.03 ±223%      +0.6        0.64 ± 39%  perf-profile.children.cycles-pp.__put_page
      0.18 ± 43%      +0.6        0.78 ±  3%  perf-profile.children.cycles-pp.update_min_vruntime
      0.34 ± 23%      +0.6        0.96 ±  3%  perf-profile.children.cycles-pp.__get_user_8
      0.14 ± 93%      +0.6        0.77 ± 12%  perf-profile.children.cycles-pp.current_time
      0.15 ± 88%      +0.6        0.78 ± 12%  perf-profile.children.cycles-pp.atime_needs_update
      0.35 ± 34%      +0.6        1.00 ±  6%  perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
      0.34 ± 20%      +0.7        1.00 ±  8%  perf-profile.children.cycles-pp.task_h_load
      0.36 ± 23%      +0.7        1.03 ±  3%  perf-profile.children.cycles-pp.rseq_get_rseq_cs
      0.21 ± 66%      +0.7        0.89 ± 10%  perf-profile.children.cycles-pp.file_update_time
      0.16 ±106%      +0.7        0.88 ± 13%  perf-profile.children.cycles-pp.entry_SYSCALL_64
      0.21 ± 78%      +0.8        0.99 ± 11%  perf-profile.children.cycles-pp.touch_atime
      0.34 ± 32%      +0.8        1.13 ±  3%  perf-profile.children.cycles-pp.__switch_to
      0.27 ± 58%      +0.8        1.08 ±  6%  perf-profile.children.cycles-pp.__fget_light
      0.31 ± 51%      +0.9        1.18 ±  3%  perf-profile.children.cycles-pp.update_rq_clock
      0.40 ± 29%      +0.9        1.28 ±  3%  perf-profile.children.cycles-pp.__switch_to_asm
      0.48 ± 20%      +0.9        1.42 ±  6%  perf-profile.children.cycles-pp.wake_affine
      0.50 ± 26%      +1.0        1.46 ±  3%  perf-profile.children.cycles-pp.rseq_ip_fixup
      0.31 ± 63%      +1.0        1.30 ±  7%  perf-profile.children.cycles-pp.__fdget_pos
      0.56 ± 23%      +1.1        1.65 ±  3%  perf-profile.children.cycles-pp.restore_fpregs_from_fpstate
      0.48 ± 36%      +1.1        1.58 ±  2%  perf-profile.children.cycles-pp.prepare_task_switch
      0.07 ±194%      +1.2        1.22 ± 12%  perf-profile.children.cycles-pp.__mutex_lock
      0.68 ± 26%      +1.2        1.84 ±  4%  perf-profile.children.cycles-pp.load_new_mm_cr3
      0.58 ± 38%      +1.2        1.79 ±  6%  perf-profile.children.cycles-pp.reweight_entity
      0.38 ± 45%      +1.2        1.62        perf-profile.children.cycles-pp.prepare_to_wait_event
      0.63 ± 27%      +1.2        1.88 ±  3%  perf-profile.children.cycles-pp.__rseq_handle_notify_resume
      0.28 ±103%      +1.3        1.58 ± 12%  perf-profile.children.cycles-pp.copy_page_from_iter
      0.64 ± 24%      +1.3        1.94 ±  3%  perf-profile.children.cycles-pp.psi_task_change
      0.66 ± 24%      +1.3        1.98 ±  3%  perf-profile.children.cycles-pp.switch_fpu_return
      0.35 ± 89%      +1.5        1.80 ± 11%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.43 ±165%      +1.5        1.98 ± 27%  perf-profile.children.cycles-pp.available_idle_cpu
      1.02 ± 26%      +1.9        2.88 ±  4%  perf-profile.children.cycles-pp.switch_mm_irqs_off
      0.70 ± 42%      +1.9        2.64 ±  2%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      0.72 ± 42%      +2.0        2.68 ±  2%  perf-profile.children.cycles-pp.psi_task_switch
      0.90 ± 37%      +2.2        3.06 ±  2%  perf-profile.children.cycles-pp.psi_group_change
      0.56 ± 77%      +2.4        2.96 ±  7%  perf-profile.children.cycles-pp.copy_page_to_iter
      0.95 ± 32%      +2.4        3.36 ±  4%  perf-profile.children.cycles-pp.update_curr
      0.49 ± 68%      +2.4        2.93 ±  4%  perf-profile.children.cycles-pp.mutex_unlock
      0.61 ± 76%      +2.5        3.15 ±  8%  perf-profile.children.cycles-pp.copy_user_enhanced_fast_string
      5.47 ±  2%      +2.7        8.21 ±  3%  perf-profile.children.cycles-pp.exit_to_user_mode_loop
      0.58 ± 74%      +3.0        3.60 ±  5%  perf-profile.children.cycles-pp.mutex_lock
      6.25 ±  3%      +4.5       10.77 ±  2%  perf-profile.children.cycles-pp.exit_to_user_mode_prepare
      6.41 ±  5%      +5.3       11.66 ±  2%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      2.09 ±139%      +6.5        8.56 ± 27%  perf-profile.children.cycles-pp.select_task_rq_fair
     49.67 ± 16%     -45.2        4.49 ±  5%  perf-profile.self.cycles-pp.update_cfs_group
     11.95 ± 21%      -9.8        2.14 ±  5%  perf-profile.self.cycles-pp.update_load_avg
     14.54 ± 16%      -8.4        6.12 ±  6%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      0.06 ±  9%      +0.0        0.08 ±  8%  perf-profile.self.cycles-pp.perf_mmap__read_head
      0.06 ±  7%      +0.0        0.09 ±  4%  perf-profile.self.cycles-pp.set_task_cpu
      0.06 ±  6%      +0.0        0.09 ± 10%  perf-profile.self.cycles-pp.__get_user_nocheck_1
      0.10 ±  9%      +0.0        0.14 ±  7%  perf-profile.self.cycles-pp.check_spread
      0.00            +0.1        0.05 ±  8%  perf-profile.self.cycles-pp.account_run_delay_time
      0.01 ±223%      +0.1        0.06 ±  7%  perf-profile.self.cycles-pp.blkcg_maybe_throttle_current
      0.00            +0.1        0.06        perf-profile.self.cycles-pp.perf_exclude_event
      0.00            +0.1        0.06 ±  6%  perf-profile.self.cycles-pp.dequeue_task
      0.00            +0.1        0.06 ± 14%  perf-profile.self.cycles-pp.nohz_balancer_kick
      0.00            +0.1        0.06 ±  7%  perf-profile.self.cycles-pp.__cgroup_account_cputime_field
      0.00            +0.1        0.06 ± 11%  perf-profile.self.cycles-pp.__x64_sys_read
      0.00            +0.1        0.06 ±  7%  perf-profile.self.cycles-pp.rseq_get_rseq_cs
      0.00            +0.1        0.07        perf-profile.self.cycles-pp.autoremove_wake_function
      0.00            +0.1        0.07 ± 16%  perf-profile.self.cycles-pp.flush_smp_call_function_queue
      0.00            +0.1        0.07        perf-profile.self.cycles-pp.raw_spin_rq_lock_nested
      0.00            +0.1        0.07 ± 18%  perf-profile.self.cycles-pp.llist_reverse_order
      0.00            +0.1        0.07 ± 10%  perf-profile.self.cycles-pp.__x64_sys_write
      0.00            +0.1        0.07 ±  6%  perf-profile.self.cycles-pp.place_entity
      0.00            +0.1        0.08 ± 12%  perf-profile.self.cycles-pp.__cgroup_account_cputime
      0.01 ±223%      +0.1        0.08 ±  5%  perf-profile.self.cycles-pp.__wake_up_common_lock
      0.01 ±223%      +0.1        0.08 ± 11%  perf-profile.self.cycles-pp.amd_clear_divider
      0.00            +0.1        0.08 ± 30%  perf-profile.self.cycles-pp.is_cpu_allowed
      0.06 ± 11%      +0.1        0.14 ±  3%  perf-profile.self.cycles-pp.put_prev_entity
      0.00            +0.1        0.08 ±  5%  perf-profile.self.cycles-pp.rcu_note_context_switch
      0.00            +0.1        0.08 ±  5%  perf-profile.self.cycles-pp.wake_q_add
      0.00            +0.1        0.08 ±  5%  perf-profile.self.cycles-pp.ttwu_do_wakeup
      0.00            +0.1        0.09 ± 21%  perf-profile.self.cycles-pp.tracing_gen_ctx_irq_test
      0.04 ± 44%      +0.1        0.13 ±  5%  perf-profile.self.cycles-pp.cpus_share_cache
      0.01 ±223%      +0.1        0.10 ±  8%  perf-profile.self.cycles-pp.__bitmap_and
      0.06 ± 14%      +0.1        0.16 ±  6%  perf-profile.self.cycles-pp.__mark_inode_dirty
      0.19 ± 16%      +0.1        0.28 ± 11%  perf-profile.self.cycles-pp.resched_curr
      0.01 ±223%      +0.1        0.10 ±  9%  perf-profile.self.cycles-pp.anon_pipe_buf_release
      0.00            +0.1        0.10 ± 15%  perf-profile.self.cycles-pp.native_write_msr
      0.01 ±223%      +0.1        0.11 ±  8%  perf-profile.self.cycles-pp.cgroup_rstat_updated
      0.01 ±223%      +0.1        0.10 ±  4%  perf-profile.self.cycles-pp.rb_insert_color
      0.01 ±223%      +0.1        0.10 ±  7%  perf-profile.self.cycles-pp.sched_clock_cpu
      0.01 ±223%      +0.1        0.11 ± 14%  perf-profile.self.cycles-pp.page_copy_sane
      0.01 ±223%      +0.1        0.11 ±  3%  perf-profile.self.cycles-pp.check_preempt_curr
      0.00            +0.1        0.10 ± 44%  perf-profile.self.cycles-pp.wait_consider_task
      0.00            +0.1        0.11 ± 11%  perf-profile.self.cycles-pp.ktime_get
      0.06 ± 52%      +0.1        0.17 ±  4%  perf-profile.self.cycles-pp.rb_erase
      0.01 ±223%      +0.1        0.12 ±  3%  perf-profile.self.cycles-pp.native_load_tls
      0.01 ±223%      +0.1        0.12 ± 23%  perf-profile.self.cycles-pp.perf_trace_sched_wakeup_template
      0.01 ±223%      +0.1        0.12 ±  3%  perf-profile.self.cycles-pp.rseq_ip_fixup
      0.07 ± 26%      +0.1        0.18 ±  2%  perf-profile.self.cycles-pp.set_next_entity
      0.00            +0.1        0.11 ± 28%  perf-profile.self.cycles-pp.ttwu_do_activate
      0.01 ±223%      +0.1        0.13 ± 14%  perf-profile.self.cycles-pp.iov_iter_init
      0.08 ± 25%      +0.1        0.20 ±  8%  perf-profile.self.cycles-pp.psi_task_change
      0.01 ±223%      +0.1        0.13 ±  5%  perf-profile.self.cycles-pp.clear_buddies
      0.01 ±223%      +0.1        0.13 ±  6%  perf-profile.self.cycles-pp.rb_next
      0.06 ± 51%      +0.1        0.18 ±  4%  perf-profile.self.cycles-pp.enqueue_task
      0.01 ±223%      +0.1        0.14 ± 14%  perf-profile.self.cycles-pp.touch_atime
      0.02 ±223%      +0.1        0.14 ± 16%  perf-profile.self.cycles-pp.fsnotify_perm
      0.04 ± 79%      +0.1        0.17 ±  6%  perf-profile.self.cycles-pp.wake_affine
      0.01 ±223%      +0.1        0.14 ±  4%  perf-profile.self.cycles-pp.mem_cgroup_handle_over_high
      0.05 ± 56%      +0.1        0.19 ±  5%  perf-profile.self.cycles-pp.__rdgsbase_inactive
      0.01 ±223%      +0.1        0.15 ±  4%  perf-profile.self.cycles-pp.native_irq_return_iret
      0.02 ±223%      +0.1        0.16 ±  4%  perf-profile.self.cycles-pp.pick_next_task
      0.08 ± 38%      +0.1        0.22 ±  3%  perf-profile.self.cycles-pp.__calc_delta
      0.08 ± 25%      +0.2        0.24 ±  5%  perf-profile.self.cycles-pp._raw_spin_unlock_irqrestore
      0.12 ± 17%      +0.2        0.28 ±  4%  perf-profile.self.cycles-pp.check_preempt_wakeup
      0.01 ±223%      +0.2        0.17 ±  2%  perf-profile.self.cycles-pp.migrate_task_rq_fair
      0.02 ±223%      +0.2        0.18 ± 14%  perf-profile.self.cycles-pp.rw_verify_area
      0.02 ±223%      +0.2        0.18 ± 10%  perf-profile.self.cycles-pp.inode_needs_update_time
      0.11 ± 21%      +0.2        0.28 ±  2%  perf-profile.self.cycles-pp.___perf_sw_event
      0.07 ± 31%      +0.2        0.24 ± 21%  perf-profile.self.cycles-pp.perf_tp_event
      0.07 ± 26%      +0.2        0.24 ±  4%  perf-profile.self.cycles-pp.pick_next_entity
      0.02 ±223%      +0.2        0.20 ± 13%  perf-profile.self.cycles-pp.file_update_time
      0.02 ±223%      +0.2        0.20 ±  7%  perf-profile.self.cycles-pp.ttwu_queue_wakelist
      0.02 ±146%      +0.2        0.21 ±  5%  perf-profile.self.cycles-pp.kill_fasync
      0.02 ±223%      +0.2        0.21 ± 12%  perf-profile.self.cycles-pp.fpregs_assert_state_consistent
      0.02 ±223%      +0.2        0.22 ± 14%  perf-profile.self.cycles-pp.security_file_permission
      0.02 ±223%      +0.2        0.22 ± 13%  perf-profile.self.cycles-pp.__fdget_pos
      0.02 ±223%      +0.2        0.22 ± 10%  perf-profile.self.cycles-pp.rcu_all_qs
      0.10 ± 31%      +0.2        0.30 ±  4%  perf-profile.self.cycles-pp.__put_user_nocheck_8
      0.02 ±223%      +0.2        0.24 ± 10%  perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.01 ±223%      +0.2        0.23 ± 13%  perf-profile.self.cycles-pp.native_safe_halt
      0.10 ± 35%      +0.2        0.32 ±  2%  perf-profile.self.cycles-pp.switch_fpu_return
      0.10 ± 37%      +0.2        0.33 ±  4%  perf-profile.self.cycles-pp.__wrgsbase_inactive
      0.07 ± 59%      +0.2        0.30 ±  2%  perf-profile.self.cycles-pp.dequeue_entity
      0.10 ± 22%      +0.2        0.34 ±  4%  perf-profile.self.cycles-pp.cpuacct_charge
      0.12 ± 26%      +0.2        0.36 ±  5%  perf-profile.self.cycles-pp.select_task_rq_fair
      0.21 ± 16%      +0.2        0.46 ±  4%  perf-profile.self.cycles-pp.pick_next_task_fair
      0.02 ±223%      +0.3        0.28 ± 13%  perf-profile.self.cycles-pp.ktime_get_coarse_real_ts64
      0.10 ± 35%      +0.3        0.36 ±  3%  perf-profile.self.cycles-pp.finish_task_switch
      0.03 ±223%      +0.3        0.29 ± 12%  perf-profile.self.cycles-pp.ksys_write
      0.07 ± 88%      +0.3        0.34 ±  9%  perf-profile.self.cycles-pp.ksys_read
      0.07 ± 85%      +0.3        0.34 ± 10%  perf-profile.self.cycles-pp.exit_to_user_mode_prepare
      0.13 ± 33%      +0.3        0.41 ±  4%  perf-profile.self.cycles-pp.__rseq_handle_notify_resume
      0.06 ±112%      +0.3        0.34 ± 10%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.01 ±223%      +0.3        0.31 ± 11%  perf-profile.self.cycles-pp.__mutex_lock
      0.05 ±143%      +0.3        0.36 ± 12%  perf-profile.self.cycles-pp.__cond_resched
      0.08 ± 91%      +0.3        0.39 ± 12%  perf-profile.self.cycles-pp.atime_needs_update
      0.02 ±223%      +0.3        0.35 ± 11%  perf-profile.self.cycles-pp.mutex_spin_on_owner
      0.11 ± 41%      +0.3        0.46 ±  6%  perf-profile.self.cycles-pp.set_next_buddy
      0.10 ± 44%      +0.3        0.44 ±  3%  perf-profile.self.cycles-pp.prepare_to_wait_event
      0.13 ± 35%      +0.4        0.50 ±  4%  perf-profile.self.cycles-pp.schedule
      0.06 ±109%      +0.4        0.43 ±  5%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
      0.16 ± 33%      +0.4        0.53 ±  3%  perf-profile.self.cycles-pp.native_sched_clock
      0.15 ± 28%      +0.4        0.52 ±  5%  perf-profile.self.cycles-pp.psi_task_switch
      0.07 ±128%      +0.4        0.45 ± 13%  perf-profile.self.cycles-pp.current_time
      0.07 ±130%      +0.4        0.48 ± 12%  perf-profile.self.cycles-pp.copy_page_from_iter
      0.02 ±223%      +0.4        0.44 ± 17%  perf-profile.self.cycles-pp.osq_lock
      0.14 ± 28%      +0.4        0.57 ±  6%  perf-profile.self.cycles-pp.psi_flags_change
      0.05 ±145%      +0.4        0.48 ±  9%  perf-profile.self.cycles-pp.syscall_enter_from_user_mode
      0.16 ± 65%      +0.4        0.60 ± 12%  perf-profile.self.cycles-pp.select_idle_sibling
      0.14 ± 78%      +0.4        0.58 ± 12%  perf-profile.self.cycles-pp.vfs_write
      0.18 ± 24%      +0.5        0.63 ±  2%  perf-profile.self.cycles-pp._raw_spin_lock_irq
      0.13 ± 78%      +0.5        0.60 ±  9%  perf-profile.self.cycles-pp.new_sync_read
      0.14 ± 69%      +0.5        0.62 ±  9%  perf-profile.self.cycles-pp.do_syscall_64
      0.02 ±223%      +0.5        0.52 ± 42%  perf-profile.self.cycles-pp.page_counter_uncharge
      0.16 ± 61%      +0.5        0.66 ±  9%  perf-profile.self.cycles-pp.new_sync_write
      0.13 ± 90%      +0.5        0.63 ±  9%  perf-profile.self.cycles-pp.copy_page_to_iter
      0.24 ± 37%      +0.5        0.76 ±  2%  perf-profile.self.cycles-pp.save_fpregs_to_fpstate
      0.17 ± 59%      +0.5        0.71 ±  6%  perf-profile.self.cycles-pp.dequeue_task_fair
      0.30 ± 35%      +0.5        0.84 ±  2%  perf-profile.self.cycles-pp.__update_load_avg_se
      0.21 ± 27%      +0.6        0.78 ±  3%  perf-profile.self.cycles-pp.__wake_up_common
      0.27 ± 46%      +0.6        0.84 ± 11%  perf-profile.self.cycles-pp.reweight_entity
      0.16 ± 44%      +0.6        0.74 ±  3%  perf-profile.self.cycles-pp.update_min_vruntime
      0.33 ± 23%      +0.6        0.94 ±  3%  perf-profile.self.cycles-pp.__get_user_8
      0.34 ± 34%      +0.6        0.96 ±  6%  perf-profile.self.cycles-pp.__update_load_avg_cfs_rq
      0.24 ± 42%      +0.6        0.88 ±  3%  perf-profile.self.cycles-pp.exit_to_user_mode_loop
      0.21 ± 58%      +0.6        0.86 ±  6%  perf-profile.self.cycles-pp.update_rq_clock
      0.34 ± 20%      +0.7        0.99 ±  8%  perf-profile.self.cycles-pp.task_h_load
      0.33 ± 25%      +0.7        1.01 ±  3%  perf-profile.self.cycles-pp.switch_mm_irqs_off
      0.19 ± 64%      +0.7        0.88 ±  6%  perf-profile.self.cycles-pp.vfs_read
      0.16 ±106%      +0.7        0.88 ± 13%  perf-profile.self.cycles-pp.entry_SYSCALL_64
      0.25 ± 55%      +0.7        0.97 ±  5%  perf-profile.self.cycles-pp.__fget_light
      0.24 ± 62%      +0.7        0.97 ±  9%  perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.31 ± 37%      +0.7        1.06 ±  3%  perf-profile.self.cycles-pp.prepare_task_switch
      0.32 ± 32%      +0.8        1.07 ±  3%  perf-profile.self.cycles-pp.__switch_to
      0.39 ± 28%      +0.9        1.28 ±  3%  perf-profile.self.cycles-pp.__switch_to_asm
      0.30 ± 66%      +0.9        1.19 ± 10%  perf-profile.self.cycles-pp._raw_spin_lock
      0.38 ± 29%      +1.0        1.36 ±  3%  perf-profile.self.cycles-pp.enqueue_entity
      0.30 ± 40%      +1.0        1.30 ±  2%  perf-profile.self.cycles-pp.enqueue_task_fair
      0.55 ± 22%      +1.1        1.63 ±  3%  perf-profile.self.cycles-pp.restore_fpregs_from_fpstate
      0.68 ± 26%      +1.1        1.82 ±  4%  perf-profile.self.cycles-pp.load_new_mm_cr3
      0.53 ± 30%      +1.3        1.80 ±  5%  perf-profile.self.cycles-pp.update_curr
      0.68 ± 28%      +1.4        2.08 ±  2%  perf-profile.self.cycles-pp.__schedule
      0.34 ± 90%      +1.5        1.80 ± 11%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.38 ± 56%      +1.5        1.84 ±  4%  perf-profile.self.cycles-pp.pipe_read
      0.41 ±166%      +1.5        1.90 ± 27%  perf-profile.self.cycles-pp.available_idle_cpu
      0.31 ± 82%      +1.6        1.93 ±  8%  perf-profile.self.cycles-pp.pipe_write
      0.62 ± 30%      +1.7        2.34 ±  2%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.88 ± 37%      +2.1        2.99 ±  2%  perf-profile.self.cycles-pp.psi_group_change
      0.47 ± 68%      +2.4        2.85 ±  4%  perf-profile.self.cycles-pp.mutex_unlock
      0.60 ± 75%      +2.5        3.06 ±  8%  perf-profile.self.cycles-pp.copy_user_enhanced_fast_string
      0.50 ± 73%      +2.7        3.19 ±  4%  perf-profile.self.cycles-pp.mutex_lock



***************************************************************************************************
lkp-gnr-2sp3: 256 threads 2 sockets Intel(R) Xeon(R) 6767P  CPU @ 2.4GHz (Granite Rapids) with 256G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
  gcc-12/performance/x86_64-bytedance-5.15-velinux/100%/debian-13-x86_64-20250902.cgz/300s/lkp-gnr-2sp3/context1/unixbench

commit: 
  c2f4451f9e ("Bluetooth: L2CAP: handle NULL sock pointer in l2cap_sock_alloc")
  7e2540f462 ("sched/fair: Ratelimit update to tg->load_avg")

c2f4451f9e7b5c73 7e2540f4625d5b6fe2e68833226 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 6.891e+08          +100.7%  1.383e+09        cpuidle..usage
    101335           +23.0%     124690        uptime.idle
   1100188 ±  8%     -46.6%     587826 ±  3%  meminfo.Active
   1099692 ±  8%     -46.6%     587330 ±  3%  meminfo.Active(anon)
   3522363 ±  2%     +29.5%    4563019        meminfo.Mapped
   1095707 ±  8%     -46.8%     582796 ±  3%  numa-meminfo.node1.Active
   1095625 ±  8%     -46.8%     582796 ±  3%  numa-meminfo.node1.Active(anon)
   3023941 ±  3%     +34.3%    4060462 ±  2%  numa-meminfo.node1.Mapped
    273881 ±  8%     -46.8%     145677 ±  3%  numa-vmstat.node1.nr_active_anon
    755249 ±  3%     +34.4%    1014711 ±  2%  numa-vmstat.node1.nr_mapped
    273881 ±  8%     -46.8%     145677 ±  3%  numa-vmstat.node1.nr_zone_active_anon
    333.33 ± 11%     -60.6%     131.17 ± 10%  perf-c2c.DRAM.local
      3201 ± 12%     -88.1%     380.67 ± 27%  perf-c2c.DRAM.remote
    114359 ± 11%     -80.3%      22537 ± 38%  perf-c2c.HITM.local
      1565 ± 12%     -88.6%     179.17 ± 26%  perf-c2c.HITM.remote
    115925 ± 11%     -80.4%      22716 ± 38%  perf-c2c.HITM.total
     50.71           +14.6       65.29        mpstat.cpu.all.idle%
      0.12 ±  6%      -0.1        0.00 ±141%  mpstat.cpu.all.soft%
     46.73           -15.7       31.01        mpstat.cpu.all.sys%
      2.45            +1.2        3.69        mpstat.cpu.all.usr%
    226.83           -65.7%      77.83        mpstat.max_utilization.seconds
     71.34           -12.7%      62.30        mpstat.max_utilization_pct
    274821 ±  8%     -46.6%     146856 ±  3%  proc-vmstat.nr_active_anon
    270819            +3.5%     280372        proc-vmstat.nr_anon_pages
     50247            -1.3%      49602        proc-vmstat.nr_kernel_stack
    880984 ±  2%     +29.5%    1141293        proc-vmstat.nr_mapped
    274821 ±  8%     -46.6%     146856 ±  3%  proc-vmstat.nr_zone_active_anon
     80115 ± 50%     -45.8%      43427 ±  4%  proc-vmstat.pgactivate
      3936           +99.6%       7858        unixbench.score
   1574507           +99.6%    3143468        unixbench.throughput
     55614           +50.8%      83889        unixbench.time.involuntary_context_switches
      5804           -23.8%       4423        unixbench.time.percent_of_cpu_this_job_got
     22382           -29.2%      15855        unixbench.time.system_time
    840.59          +102.5%       1702        unixbench.time.user_time
 4.704e+08          +100.0%  9.408e+08        unixbench.time.voluntary_context_switches
 6.293e+08           +98.1%  1.246e+09        unixbench.workload
      2341           -35.4%       1512        turbostat.Avg_MHz
     65.05           -23.0       42.02        turbostat.Busy%
     61.58            +2.7       64.30        turbostat.C1%
     24.34           +17.0%      28.46        turbostat.CPU%c1
      0.07          +200.0%       0.21        turbostat.IPC
 8.606e+08           +72.1%  1.482e+09        turbostat.IRQ
  10521047 ±  4%     -45.7%    5707783 ±  4%  turbostat.NMI
      0.03            +0.0        0.05        turbostat.POLL%
     68.33            -8.8%      62.33        turbostat.PkgTmp
    464.23           -17.6%     382.56        turbostat.PkgWatt
    554.08           -14.5%     473.90        turbostat.SysWatt
 9.128e+09           +90.8%  1.741e+10        perf-stat.i.branch-instructions
 1.102e+08           +82.6%  2.012e+08        perf-stat.i.branch-misses
      3.61 ±  3%      -0.4        3.17 ±  5%  perf-stat.i.cache-miss-rate%
  17367469 ±  2%     -17.5%   14320683        perf-stat.i.cache-misses
 1.118e+09 ±  2%     +11.8%   1.25e+09        perf-stat.i.cache-references
   4064321          +102.3%    8223796        perf-stat.i.context-switches
     13.38           -53.4%       6.24        perf-stat.i.cpi
 6.314e+11           -20.3%   5.03e+11        perf-stat.i.cpu-cycles
   1731082          +120.5%    3817870        perf-stat.i.cpu-migrations
 4.279e+10           +92.4%  8.234e+10        perf-stat.i.instructions
      0.18 ±  3%     +30.1%       0.24 ±  4%  perf-stat.i.ipc
      2.61 ±  2%      -6.2%       2.45        perf-stat.i.major-faults
     22.65          +107.6%      47.03        perf-stat.i.metric.K/sec
      0.40 ±  2%     -64.3%       0.14 ± 44%  perf-stat.overall.MPKI
      1.21            -0.2        0.96 ± 44%  perf-stat.overall.branch-miss-rate%
      1.54 ±  2%      -0.6        0.95 ± 44%  perf-stat.overall.cache-miss-rate%
     14.77           -65.5%       5.09 ± 44%  perf-stat.overall.cpi
     27873           -21.4%      21905 ± 44%  perf-stat.overall.path-length
  17678151 ±  2%     -32.8%   11878214 ± 44%  perf-stat.ps.cache-misses
 6.456e+11           -35.0%  4.194e+11 ± 44%  perf-stat.ps.cpu-cycles
      2.54           -20.2%       2.02 ± 44%  perf-stat.ps.major-faults
   2688207 ±  8%     -86.1%     373603 ± 29%  sched_debug.cfs_rq:/.MIN_vruntime.avg
  13268174 ± 15%     -64.9%    4663006 ± 28%  sched_debug.cfs_rq:/.MIN_vruntime.max
   4695500 ± 10%     -74.6%    1191334 ± 27%  sched_debug.cfs_rq:/.MIN_vruntime.stddev
      0.53 ±  5%     -36.4%       0.33 ± 13%  sched_debug.cfs_rq:/.h_nr_running.avg
      4174 ± 17%     +27.7%       5331 ±  9%  sched_debug.cfs_rq:/.load.avg
      4.66 ±  8%     +33.3%       6.22 ± 11%  sched_debug.cfs_rq:/.load_avg.avg
    223.88 ± 12%    +130.1%     515.21 ± 27%  sched_debug.cfs_rq:/.load_avg.max
     19.87 ± 11%    +102.2%      40.17 ± 26%  sched_debug.cfs_rq:/.load_avg.stddev
   2688207 ±  8%     -86.1%     373603 ± 29%  sched_debug.cfs_rq:/.max_vruntime.avg
  13268174 ± 15%     -64.9%    4663006 ± 28%  sched_debug.cfs_rq:/.max_vruntime.max
   4695500 ± 10%     -74.6%    1191334 ± 27%  sched_debug.cfs_rq:/.max_vruntime.stddev
  18953027           -60.9%    7406188        sched_debug.cfs_rq:/.min_vruntime.avg
  24170265 ±  4%     -56.8%   10452822 ±  6%  sched_debug.cfs_rq:/.min_vruntime.max
  16842404 ±  6%     -60.2%    6704791        sched_debug.cfs_rq:/.min_vruntime.min
    580298 ± 13%     -41.8%     338006 ±  6%  sched_debug.cfs_rq:/.min_vruntime.stddev
      0.38 ±  5%     -37.0%       0.24 ± 14%  sched_debug.cfs_rq:/.nr_running.avg
    625.08 ±  4%     -61.8%     239.08 ± 23%  sched_debug.cfs_rq:/.runnable_avg.avg
      1995 ±  4%     -38.8%       1220 ±  8%  sched_debug.cfs_rq:/.runnable_avg.max
    204.93 ± 20%     -60.7%      80.52 ± 12%  sched_debug.cfs_rq:/.runnable_avg.min
    290.09 ±  2%     -43.3%     164.61 ± 12%  sched_debug.cfs_rq:/.runnable_avg.stddev
   5309634 ± 21%     -44.5%    2947539 ± 23%  sched_debug.cfs_rq:/.spread0.max
  -2023141           -60.3%    -803460        sched_debug.cfs_rq:/.spread0.min
    580610 ± 13%     -41.7%     338523 ±  6%  sched_debug.cfs_rq:/.spread0.stddev
    407.68 ±  4%     -38.3%     251.72 ± 16%  sched_debug.cfs_rq:/.util_avg.avg
      1186 ±  2%     -10.5%       1062 ±  6%  sched_debug.cfs_rq:/.util_avg.max
    148.28 ±  2%     -36.3%      94.44 ± 13%  sched_debug.cfs_rq:/.util_avg.stddev
     98.56 ±  5%     -83.5%      16.30 ± 57%  sched_debug.cfs_rq:/.util_est_enqueued.avg
    128.27 ±  3%     -48.4%      66.21 ± 21%  sched_debug.cfs_rq:/.util_est_enqueued.stddev
    290272 ± 27%     +66.7%     483773 ± 13%  sched_debug.cpu.avg_idle.avg
    790969 ± 11%     -31.2%     544567 ±  9%  sched_debug.cpu.avg_idle.max
     16270 ± 10%     +62.8%      26482 ± 47%  sched_debug.cpu.avg_idle.min
    143745 ± 13%     -55.4%      64175 ± 11%  sched_debug.cpu.avg_idle.stddev
   1194380 ±  4%     -56.5%     520044        sched_debug.cpu.max_idle_balance_cost.max
     79469 ±  4%     -97.5%       1991 ± 57%  sched_debug.cpu.max_idle_balance_cost.stddev
      0.42 ±  4%     -23.4%       0.33 ± 16%  sched_debug.cpu.nr_running.avg
   2914689           +97.8%    5766053        sched_debug.cpu.nr_switches.avg
   3387972           +76.9%    5994431        sched_debug.cpu.nr_switches.max
   2119523 ± 14%    +114.7%    4551004 ±  5%  sched_debug.cpu.nr_switches.min
    303595 ±  7%     -52.0%     145654 ±  7%  sched_debug.cpu.nr_switches.stddev
      0.00 ± 31%    -100.0%       0.00        sched_debug.rt_rq:.rt_nr_migratory.avg
      0.17 ± 31%    -100.0%       0.00        sched_debug.rt_rq:.rt_nr_migratory.max
      0.01 ± 31%    -100.0%       0.00        sched_debug.rt_rq:.rt_nr_migratory.stddev
      0.00 ± 31%    -100.0%       0.00        sched_debug.rt_rq:.rt_nr_running.avg
      0.17 ± 31%    -100.0%       0.00        sched_debug.rt_rq:.rt_nr_running.max
      0.01 ± 31%    -100.0%       0.00        sched_debug.rt_rq:.rt_nr_running.stddev
      0.19 ± 16%    -100.0%       0.00        sched_debug.rt_rq:.rt_time.avg
     49.82 ± 16%    -100.0%       0.00        sched_debug.rt_rq:.rt_time.max
      3.11 ± 16%    -100.0%       0.00        sched_debug.rt_rq:.rt_time.stddev
     36.14           -31.6        4.58        perf-profile.calltrace.cycles-pp.enqueue_task_fair.enqueue_task.ttwu_do_activate.sched_ttwu_pending.__sysvec_call_function_single
     43.68           -31.5       12.18        perf-profile.calltrace.cycles-pp.native_safe_halt.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter
     36.28           -31.0        5.24        perf-profile.calltrace.cycles-pp.enqueue_task.ttwu_do_activate.sched_ttwu_pending.__sysvec_call_function_single.sysvec_call_function_single
     36.28           -31.0        5.26        perf-profile.calltrace.cycles-pp.ttwu_do_activate.sched_ttwu_pending.__sysvec_call_function_single.sysvec_call_function_single.asm_sysvec_call_function_single
     32.86           -29.8        3.10        perf-profile.calltrace.cycles-pp.enqueue_entity.enqueue_task_fair.enqueue_task.ttwu_do_activate.sched_ttwu_pending
     36.73           -29.6        7.14        perf-profile.calltrace.cycles-pp.sched_ttwu_pending.__sysvec_call_function_single.sysvec_call_function_single.asm_sysvec_call_function_single.native_safe_halt
     37.03           -28.0        9.00        perf-profile.calltrace.cycles-pp.__sysvec_call_function_single.sysvec_call_function_single.asm_sysvec_call_function_single.native_safe_halt.acpi_idle_do_entry
     37.22           -27.5        9.72        perf-profile.calltrace.cycles-pp.sysvec_call_function_single.asm_sysvec_call_function_single.native_safe_halt.acpi_idle_do_entry.acpi_idle_enter
     25.27           -20.2        5.11        perf-profile.calltrace.cycles-pp.dequeue_task_fair.__schedule.schedule.pipe_read.new_sync_read
     17.27           -16.5        0.74 ±  2%  perf-profile.calltrace.cycles-pp.update_cfs_group.enqueue_entity.enqueue_task_fair.enqueue_task.ttwu_do_activate
     20.11           -16.4        3.76        perf-profile.calltrace.cycles-pp.dequeue_entity.dequeue_task_fair.__schedule.schedule.pipe_read
     27.65           -15.2       12.41        perf-profile.calltrace.cycles-pp.__schedule.schedule.pipe_read.new_sync_read.vfs_read
     16.14           -14.9        1.20        perf-profile.calltrace.cycles-pp.update_load_avg.enqueue_entity.enqueue_task_fair.enqueue_task.ttwu_do_activate
     27.71           -14.9       12.79        perf-profile.calltrace.cycles-pp.schedule.pipe_read.new_sync_read.vfs_read.ksys_read
     54.98           -14.8       40.18        perf-profile.calltrace.cycles-pp.secondary_startup_64_no_verify
     54.74           -14.8       39.98        perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.secondary_startup_64_no_verify
     54.76           -14.8       40.01        perf-profile.calltrace.cycles-pp.cpu_startup_entry.secondary_startup_64_no_verify
     14.95           -14.0        0.96 ±  2%  perf-profile.calltrace.cycles-pp.update_cfs_group.dequeue_entity.dequeue_task_fair.__schedule.schedule
     28.77            -9.9       18.85        perf-profile.calltrace.cycles-pp.pipe_read.new_sync_read.vfs_read.ksys_read.do_syscall_64
     44.76            -9.9       34.87        perf-profile.calltrace.cycles-pp.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
     44.76            -9.9       34.89        perf-profile.calltrace.cycles-pp.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
     28.89            -9.8       19.14        perf-profile.calltrace.cycles-pp.new_sync_read.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
     44.87            -9.7       35.14        perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
     44.87            -9.7       35.15        perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.secondary_startup_64_no_verify
     45.21            -9.5       35.68        perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.secondary_startup_64_no_verify
     29.01            -9.0       20.03        perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
     29.07            -8.9       20.14        perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
      6.42            -6.4        0.00        perf-profile.calltrace.cycles-pp.update_load_avg.set_next_entity.pick_next_task_fair.pick_next_task.__schedule
      5.98            -6.0        0.00        perf-profile.calltrace.cycles-pp.pick_next_task.__schedule.schedule_idle.do_idle.cpu_startup_entry
      5.96            -6.0        0.00        perf-profile.calltrace.cycles-pp.pick_next_task_fair.pick_next_task.__schedule.schedule_idle.do_idle
      5.93            -5.9        0.00        perf-profile.calltrace.cycles-pp.set_next_entity.pick_next_task_fair.pick_next_task.__schedule.schedule_idle
      7.39            -4.1        3.30        perf-profile.calltrace.cycles-pp.__schedule.schedule_idle.do_idle.cpu_startup_entry.secondary_startup_64_no_verify
      7.42            -4.1        3.34        perf-profile.calltrace.cycles-pp.schedule_idle.do_idle.cpu_startup_entry.secondary_startup_64_no_verify
      4.72            -3.2        1.50        perf-profile.calltrace.cycles-pp.update_load_avg.dequeue_entity.dequeue_task_fair.__schedule.schedule
      0.62            -0.1        0.52 ±  4%  perf-profile.calltrace.cycles-pp.pick_next_task_fair.pick_next_task.__schedule.schedule.pipe_read
      0.66            -0.0        0.61 ±  3%  perf-profile.calltrace.cycles-pp.pick_next_task.__schedule.schedule.pipe_read.new_sync_read
      0.84 ±  4%      +0.4        1.21        perf-profile.calltrace.cycles-pp.handle_internal_command.main
      0.84 ±  4%      +0.4        1.21        perf-profile.calltrace.cycles-pp.run_builtin.handle_internal_command.main
      0.00            +0.5        0.51        perf-profile.calltrace.cycles-pp.perf_mmap__push.record__mmap_read_evlist.cmd_record.run_builtin.handle_internal_command
      0.00            +0.5        0.52        perf-profile.calltrace.cycles-pp.cmd_record.run_builtin.handle_internal_command.main
      0.00            +0.5        0.52        perf-profile.calltrace.cycles-pp.record__mmap_read_evlist.cmd_record.run_builtin.handle_internal_command.main
      0.00            +0.6        0.56 ±  2%  perf-profile.calltrace.cycles-pp.resched_curr.check_preempt_curr.ttwu_do_wakeup.sched_ttwu_pending.__sysvec_call_function_single
      0.00            +0.6        0.56        perf-profile.calltrace.cycles-pp.task_h_load.wake_affine.select_task_rq_fair.try_to_wake_up.autoremove_wake_function
      0.00            +0.6        0.58        perf-profile.calltrace.cycles-pp.irqentry_enter.sysvec_call_function_single.asm_sysvec_call_function_single.native_safe_halt.acpi_idle_do_entry
      0.00            +0.6        0.61 ±  2%  perf-profile.calltrace.cycles-pp.__softirqentry_text_start.irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.native_safe_halt
      0.00            +0.6        0.62        perf-profile.calltrace.cycles-pp.__fget_light.__fdget_pos.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.6        0.62 ±  2%  perf-profile.calltrace.cycles-pp.irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.native_safe_halt.acpi_idle_do_entry
      0.00            +0.6        0.63        perf-profile.calltrace.cycles-pp.__fdget_pos.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.6        0.63        perf-profile.calltrace.cycles-pp._raw_spin_lock.raw_spin_rq_lock_nested.__schedule.schedule.pipe_read
      0.00            +0.6        0.64        perf-profile.calltrace.cycles-pp.__switch_to
      0.00            +0.6        0.64        perf-profile.calltrace.cycles-pp.psi_group_change.psi_task_switch.__schedule.schedule.pipe_read
      0.00            +0.7        0.67        perf-profile.calltrace.cycles-pp.check_preempt_curr.ttwu_do_wakeup.sched_ttwu_pending.__sysvec_call_function_single.sysvec_call_function_single
      0.00            +0.7        0.68        perf-profile.calltrace.cycles-pp.__update_load_avg_cfs_rq.update_load_avg.dequeue_entity.dequeue_task_fair.__schedule
      0.00            +0.7        0.69        perf-profile.calltrace.cycles-pp.cmd_record.cmd_sched.run_builtin.handle_internal_command.main
      0.00            +0.7        0.69        perf-profile.calltrace.cycles-pp.cmd_sched.run_builtin.handle_internal_command.main
      0.00            +0.7        0.69        perf-profile.calltrace.cycles-pp.perf_session__process_events.record__finish_output.cmd_record.cmd_sched.run_builtin
      0.00            +0.7        0.69        perf-profile.calltrace.cycles-pp.reader__read_event.perf_session__process_events.record__finish_output.cmd_record.cmd_sched
      0.00            +0.7        0.69        perf-profile.calltrace.cycles-pp.record__finish_output.cmd_record.cmd_sched.run_builtin.handle_internal_command
      0.00            +0.7        0.69        perf-profile.calltrace.cycles-pp.ttwu_do_wakeup.sched_ttwu_pending.__sysvec_call_function_single.sysvec_call_function_single.asm_sysvec_call_function_single
      0.00            +0.7        0.74        perf-profile.calltrace.cycles-pp.mutex_lock.pipe_write.new_sync_write.vfs_write.ksys_write
      0.00            +0.7        0.74        perf-profile.calltrace.cycles-pp.psi_task_switch.__schedule.schedule.pipe_read.new_sync_read
      0.00            +0.8        0.76        perf-profile.calltrace.cycles-pp.update_curr.dequeue_entity.dequeue_task_fair.__schedule.schedule
      0.00            +0.8        0.80        perf-profile.calltrace.cycles-pp.psi_group_change.psi_task_switch.__schedule.schedule_idle.do_idle
      0.00            +0.9        0.86        perf-profile.calltrace.cycles-pp.psi_task_switch.__schedule.schedule_idle.do_idle.cpu_startup_entry
      0.00            +0.9        0.86 ±  3%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.native_safe_halt.acpi_idle_do_entry.acpi_idle_enter
      0.00            +0.9        0.86        perf-profile.calltrace.cycles-pp.raw_spin_rq_lock_nested.__schedule.schedule.pipe_read.new_sync_read
      0.00            +0.9        0.87        perf-profile.calltrace.cycles-pp.wake_affine.select_task_rq_fair.try_to_wake_up.autoremove_wake_function.__wake_up_common
      0.00            +0.9        0.91        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock
      0.00            +0.9        0.91        perf-profile.calltrace.cycles-pp.mutex_unlock.pipe_write.new_sync_write.vfs_write.ksys_write
      0.00            +1.0        0.96        perf-profile.calltrace.cycles-pp.__get_user_8.rseq_get_rseq_cs.rseq_ip_fixup.__rseq_handle_notify_resume.exit_to_user_mode_loop
      0.00            +1.0        0.97        perf-profile.calltrace.cycles-pp.__update_idle_core.pick_next_task_idle.__schedule.schedule.pipe_read
      0.00            +1.0        0.98        perf-profile.calltrace.cycles-pp.rseq_get_rseq_cs.rseq_ip_fixup.__rseq_handle_notify_resume.exit_to_user_mode_loop.exit_to_user_mode_prepare
      0.00            +1.0        1.00        perf-profile.calltrace.cycles-pp.pick_next_task_idle.__schedule.schedule.pipe_read.new_sync_read
      0.00            +1.0        1.03        perf-profile.calltrace.cycles-pp.finish_task_switch.__schedule.schedule.pipe_read.new_sync_read
      0.00            +1.0        1.03        perf-profile.calltrace.cycles-pp.llist_add_batch.__smp_call_single_queue.ttwu_queue_wakelist.try_to_wake_up.autoremove_wake_function
      0.00            +1.0        1.03        perf-profile.calltrace.cycles-pp.__smp_call_single_queue.ttwu_queue_wakelist.try_to_wake_up.autoremove_wake_function.__wake_up_common
      0.00            +1.1        1.05        perf-profile.calltrace.cycles-pp.rseq_ip_fixup.__rseq_handle_notify_resume.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
      0.00            +1.1        1.07        perf-profile.calltrace.cycles-pp.llist_reverse_order.flush_smp_call_function_queue.__sysvec_call_function_single.sysvec_call_function_single.asm_sysvec_call_function_single
      0.00            +1.1        1.11        perf-profile.calltrace.cycles-pp.__rseq_handle_notify_resume.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.00            +1.1        1.11        perf-profile.calltrace.cycles-pp.native_write_msr.__x2apic_send_IPI_dest.ttwu_queue_wakelist.try_to_wake_up.autoremove_wake_function
      0.00            +1.2        1.21        perf-profile.calltrace.cycles-pp.copy_user_generic_unrolled.copy_page_to_iter.pipe_read.new_sync_read.vfs_read
      0.00            +1.2        1.23        perf-profile.calltrace.cycles-pp.migrate_task_rq_fair.set_task_cpu.try_to_wake_up.autoremove_wake_function.__wake_up_common
      0.75            +1.3        2.00        perf-profile.calltrace.cycles-pp._find_next_bit.cpumask_next.select_idle_core.select_idle_cpu.select_idle_sibling
      0.00            +1.3        1.26        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.prepare_to_wait_event.pipe_read.new_sync_read.vfs_read
      0.77            +1.3        2.06        perf-profile.calltrace.cycles-pp.cpumask_next.select_idle_core.select_idle_cpu.select_idle_sibling.select_task_rq_fair
      0.00            +1.3        1.30        perf-profile.calltrace.cycles-pp.copy_page_to_iter.pipe_read.new_sync_read.vfs_read.ksys_read
      0.00            +1.3        1.34 ±  2%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.native_safe_halt.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state
      0.00            +1.4        1.38        perf-profile.calltrace.cycles-pp.set_task_cpu.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock
      0.00            +1.6        1.57        perf-profile.calltrace.cycles-pp.prepare_to_wait_event.pipe_read.new_sync_read.vfs_read.ksys_read
      0.84 ±  4%      +1.6        2.45        perf-profile.calltrace.cycles-pp.main
      0.00            +1.8        1.78        perf-profile.calltrace.cycles-pp.flush_smp_call_function_queue.__sysvec_call_function_single.sysvec_call_function_single.asm_sysvec_call_function_single.native_safe_halt
      0.00            +1.9        1.91        perf-profile.calltrace.cycles-pp.restore_fpregs_from_fpstate.switch_fpu_return.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.00            +1.9        1.91        perf-profile.calltrace.cycles-pp.__switch_to_asm
      0.00            +2.0        2.00        perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +2.2        2.25        perf-profile.calltrace.cycles-pp.switch_fpu_return.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +2.5        2.52        perf-profile.calltrace.cycles-pp.__x2apic_send_IPI_dest.ttwu_queue_wakelist.try_to_wake_up.autoremove_wake_function.__wake_up_common
      0.54            +2.8        3.37        perf-profile.calltrace.cycles-pp.ttwu_queue_wakelist.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock
      0.64            +3.8        4.42        perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.66            +3.8        4.49        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.48            +6.3        8.80        perf-profile.calltrace.cycles-pp.available_idle_cpu.select_idle_core.select_idle_cpu.select_idle_sibling.select_task_rq_fair
      4.27            +7.5       11.80        perf-profile.calltrace.cycles-pp.select_idle_core.select_idle_cpu.select_idle_sibling.select_task_rq_fair.try_to_wake_up
      5.87            +7.6       13.46        perf-profile.calltrace.cycles-pp.select_idle_cpu.select_idle_sibling.select_task_rq_fair.try_to_wake_up.autoremove_wake_function
      6.26            +8.9       15.11        perf-profile.calltrace.cycles-pp.select_idle_sibling.select_task_rq_fair.try_to_wake_up.autoremove_wake_function.__wake_up_common
      6.53            +9.6       16.13        perf-profile.calltrace.cycles-pp.select_task_rq_fair.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock
     45.24           +10.1       55.34        perf-profile.calltrace.cycles-pp.asm_sysvec_call_function_single.native_safe_halt.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state
     43.13           +10.7       53.84        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
     43.18           +10.8       53.96        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
     11.89           +11.7       23.57        perf-profile.calltrace.cycles-pp.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock.pipe_write
     11.97           +11.9       23.86        perf-profile.calltrace.cycles-pp.autoremove_wake_function.__wake_up_common.__wake_up_common_lock.pipe_write.new_sync_write
     12.15           +12.8       24.98        perf-profile.calltrace.cycles-pp.__wake_up_common.__wake_up_common_lock.pipe_write.new_sync_write.vfs_write
     12.53           +13.0       25.52        perf-profile.calltrace.cycles-pp.__wake_up_common_lock.pipe_write.new_sync_write.vfs_write.ksys_write
     13.01           +14.9       27.89        perf-profile.calltrace.cycles-pp.pipe_write.new_sync_write.vfs_write.ksys_write.do_syscall_64
     13.07           +15.2       28.24        perf-profile.calltrace.cycles-pp.new_sync_write.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
     13.14           +15.2       28.35        perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
     13.30           +15.7       29.00        perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
     43.91           -41.5        2.36        perf-profile.children.cycles-pp.update_cfs_group
     40.62           -35.7        4.92        perf-profile.children.cycles-pp.enqueue_task_fair
     40.78           -35.1        5.65        perf-profile.children.cycles-pp.enqueue_task
     40.70           -35.0        5.65        perf-profile.children.cycles-pp.ttwu_do_activate
     39.26           -31.8        7.48        perf-profile.children.cycles-pp.sched_ttwu_pending
     34.70           -31.4        3.30        perf-profile.children.cycles-pp.enqueue_entity
     38.07           -28.9        9.18        perf-profile.children.cycles-pp.__sysvec_call_function_single
     38.26           -28.4        9.91        perf-profile.children.cycles-pp.sysvec_call_function_single
     27.94           -24.7        3.28        perf-profile.children.cycles-pp.update_load_avg
     25.33           -20.2        5.16        perf-profile.children.cycles-pp.dequeue_task_fair
     35.09           -19.3       15.77        perf-profile.children.cycles-pp.__schedule
     20.12           -16.3        3.78        perf-profile.children.cycles-pp.dequeue_entity
     27.72           -14.9       12.80        perf-profile.children.cycles-pp.schedule
     54.98           -14.8       40.18        perf-profile.children.cycles-pp.cpu_startup_entry
     54.98           -14.8       40.18        perf-profile.children.cycles-pp.secondary_startup_64_no_verify
     54.96           -14.8       40.17        perf-profile.children.cycles-pp.do_idle
     45.28           -11.6       33.67        perf-profile.children.cycles-pp.asm_sysvec_call_function_single
     44.93           -10.0       34.97        perf-profile.children.cycles-pp.native_safe_halt
     44.93            -9.9       35.01        perf-profile.children.cycles-pp.acpi_idle_do_entry
     44.94            -9.9       35.02        perf-profile.children.cycles-pp.acpi_idle_enter
     28.78            -9.9       18.89        perf-profile.children.cycles-pp.pipe_read
     45.05            -9.8       35.28        perf-profile.children.cycles-pp.cpuidle_enter_state
     45.05            -9.8       35.29        perf-profile.children.cycles-pp.cpuidle_enter
     28.89            -9.7       19.15        perf-profile.children.cycles-pp.new_sync_read
     45.39            -9.6       35.83        perf-profile.children.cycles-pp.cpuidle_idle_call
     29.01            -9.0       20.04        perf-profile.children.cycles-pp.vfs_read
     29.07            -8.9       20.15        perf-profile.children.cycles-pp.ksys_read
      6.50            -6.2        0.32        perf-profile.children.cycles-pp.set_next_entity
      6.62            -5.8        0.78 ±  2%  perf-profile.children.cycles-pp.pick_next_task_fair
      6.66            -5.7        0.94 ±  2%  perf-profile.children.cycles-pp.pick_next_task
      7.46            -4.1        3.36        perf-profile.children.cycles-pp.schedule_idle
      1.60            -1.3        0.27        perf-profile.children.cycles-pp.flush_smp_call_function_from_idle
      0.76 ±  2%      -0.6        0.21        perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      0.78 ±  2%      -0.5        0.28 ±  2%  perf-profile.children.cycles-pp.update_process_times
      0.78 ±  2%      -0.5        0.28 ±  2%  perf-profile.children.cycles-pp.tick_sched_handle
      0.59            -0.5        0.08 ±  4%  perf-profile.children.cycles-pp.task_tick_fair
      0.79            -0.5        0.32 ±  4%  perf-profile.children.cycles-pp.tick_sched_timer
      0.80            -0.5        0.34 ±  4%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.63            -0.4        0.18 ±  2%  perf-profile.children.cycles-pp.scheduler_tick
      0.87            -0.4        0.52 ±  4%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.86            -0.3        0.51 ±  5%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.32            -0.3        0.06        perf-profile.children.cycles-pp.run_rebalance_domains
      0.32            -0.2        0.09 ±  5%  perf-profile.children.cycles-pp.update_blocked_averages
      0.32            -0.1        0.18        perf-profile.children.cycles-pp.load_balance
      0.14 ±  9%      -0.1        0.02 ± 99%  perf-profile.children.cycles-pp.nohz_balancer_kick
      0.40            -0.1        0.32        perf-profile.children.cycles-pp.cpumask_next_wrap
      0.22 ±  2%      -0.1        0.16        perf-profile.children.cycles-pp.start_kernel
      0.09 ±  5%      +0.0        0.12 ±  6%  perf-profile.children.cycles-pp.entry_SYSCALL_64
      0.07 ±  7%      +0.0        0.10 ± 13%  perf-profile.children.cycles-pp.clockevents_program_event
      0.07            +0.0        0.10 ±  4%  perf-profile.children.cycles-pp.tick_irq_enter
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.__calc_delta
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.__put_user_nocheck_8
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.__rdgsbase_inactive
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.finish_wait
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.rcu_idle_exit
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.rcu_read_unlock_strict
      0.00            +0.1        0.05 ±  7%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
      0.00            +0.1        0.06 ±  6%  perf-profile.children.cycles-pp.ktime_get_update_offsets_now
      0.07 ± 16%      +0.1        0.13 ±  4%  perf-profile.children.cycles-pp.copy_page_from_iter_atomic
      0.05            +0.1        0.11        perf-profile.children.cycles-pp.place_entity
      0.00            +0.1        0.06        perf-profile.children.cycles-pp.__cond_resched
      0.00            +0.1        0.06        perf-profile.children.cycles-pp.hrtimer_next_event_without
      0.00            +0.1        0.06 ±  6%  perf-profile.children.cycles-pp.cpuacct_charge
      0.05            +0.1        0.11 ±  3%  perf-profile.children.cycles-pp.update_sd_lb_stats
      0.05            +0.1        0.11 ±  4%  perf-profile.children.cycles-pp.find_busiest_group
      0.00            +0.1        0.07 ±  7%  perf-profile.children.cycles-pp.attach_entity_load_avg
      0.00            +0.1        0.07 ±  5%  perf-profile.children.cycles-pp.read_tsc
      0.05            +0.1        0.12        perf-profile.children.cycles-pp.copy_page_from_iter
      0.08 ± 17%      +0.1        0.15 ±  2%  perf-profile.children.cycles-pp.fault_in_readable
      0.08 ± 17%      +0.1        0.15 ±  3%  perf-profile.children.cycles-pp.fault_in_iov_iter_readable
      0.00            +0.1        0.07 ± 20%  perf-profile.children.cycles-pp.current_time
      0.00            +0.1        0.07        perf-profile.children.cycles-pp.get_next_timer_interrupt
      0.00            +0.1        0.07        perf-profile.children.cycles-pp.native_apic_msr_eoi_write
      0.00            +0.1        0.07        perf-profile.children.cycles-pp.syscall_enter_from_user_mode
      0.07            +0.1        0.14        perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.00            +0.1        0.08 ±  4%  perf-profile.children.cycles-pp.psi_flags_change
      0.00            +0.1        0.08        perf-profile.children.cycles-pp.__wrgsbase_inactive
      0.00            +0.1        0.08        perf-profile.children.cycles-pp.generic_update_time
      0.00            +0.1        0.08        perf-profile.children.cycles-pp.idle_cpu
      0.08 ± 13%      +0.1        0.16 ±  2%  perf-profile.children.cycles-pp.copy_user_enhanced_fast_string
      1.17            +0.1        1.26        perf-profile.children.cycles-pp.finish_task_switch
      0.07            +0.1        0.16 ±  3%  perf-profile.children.cycles-pp.read
      0.04 ± 45%      +0.1        0.13 ±  2%  perf-profile.children.cycles-pp.perf_mmap__read_head
      0.29 ± 13%      +0.1        0.38        perf-profile.children.cycles-pp.record__pushfn
      0.11 ±  3%      +0.1        0.21        perf-profile.children.cycles-pp.__update_load_avg_se
      0.06            +0.1        0.16 ±  2%  perf-profile.children.cycles-pp.__mark_inode_dirty
      0.00            +0.1        0.10 ±  3%  perf-profile.children.cycles-pp.anon_pipe_buf_release
      0.00            +0.1        0.10        perf-profile.children.cycles-pp.poll_idle
      0.05 ± 45%      +0.1        0.15 ±  2%  perf-profile.children.cycles-pp.__get_user_nocheck_1
      0.24 ± 13%      +0.1        0.34        perf-profile.children.cycles-pp.generic_file_write_iter
      0.00            +0.1        0.11 ±  3%  perf-profile.children.cycles-pp.update_sg_lb_stats
      0.22 ± 13%      +0.1        0.34        perf-profile.children.cycles-pp.__generic_file_write_iter
      0.22 ± 14%      +0.1        0.33        perf-profile.children.cycles-pp.generic_perform_write
      0.00            +0.1        0.11 ±  4%  perf-profile.children.cycles-pp.send_call_function_single_ipi
      0.17 ±  4%      +0.1        0.29        perf-profile.children.cycles-pp.load_new_mm_cr3
      0.03 ± 70%      +0.1        0.15        perf-profile.children.cycles-pp.save_fpregs_to_fpstate
      0.00            +0.1        0.13        perf-profile.children.cycles-pp.tracing_gen_ctx_irq_test
      0.00            +0.1        0.13 ±  2%  perf-profile.children.cycles-pp.tick_nohz_next_event
      0.00            +0.1        0.13 ±  3%  perf-profile.children.cycles-pp.check_spread
      0.11 ±  3%      +0.1        0.25        perf-profile.children.cycles-pp.native_sched_clock
      0.00            +0.1        0.14 ±  6%  perf-profile.children.cycles-pp.inode_needs_update_time
      0.07            +0.1        0.21        perf-profile.children.cycles-pp.tick_nohz_get_sleep_length
      0.00            +0.1        0.14 ±  2%  perf-profile.children.cycles-pp.perf_trace_buf_update
      0.07            +0.1        0.21 ±  6%  perf-profile.children.cycles-pp.ktime_get
      0.36 ± 14%      +0.2        0.51        perf-profile.children.cycles-pp.perf_mmap__push
      0.37 ± 13%      +0.2        0.52        perf-profile.children.cycles-pp.record__mmap_read_evlist
      0.06 ±  6%      +0.2        0.22 ±  2%  perf-profile.children.cycles-pp.___perf_sw_event
      0.38            +0.2        0.54        perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      0.11 ±  4%      +0.2        0.27 ±  3%  perf-profile.children.cycles-pp.file_update_time
      0.18 ±  2%      +0.2        0.35        perf-profile.children.cycles-pp.__bitmap_andnot
      0.07            +0.2        0.24        perf-profile.children.cycles-pp.update_min_vruntime
      0.13 ±  2%      +0.2        0.31        perf-profile.children.cycles-pp.sched_clock_cpu
      0.16 ±  2%      +0.2        0.34        perf-profile.children.cycles-pp.reweight_entity
      0.06 ±  9%      +0.2        0.24 ±  4%  perf-profile.children.cycles-pp.atime_needs_update
      0.08 ±121%      +0.2        0.28 ± 42%  perf-profile.children.cycles-pp.add_callchain_ip
      0.09 ±124%      +0.2        0.29 ± 42%  perf-profile.children.cycles-pp.thread__resolve_callchain_sample
      0.00            +0.2        0.21 ±  2%  perf-profile.children.cycles-pp.mem_cgroup_handle_over_high
      0.46            +0.2        0.69        perf-profile.children.cycles-pp.cmd_sched
      0.46            +0.2        0.69        perf-profile.children.cycles-pp.perf_session__process_events
      0.46            +0.2        0.69        perf-profile.children.cycles-pp.reader__read_event
      0.46            +0.2        0.69        perf-profile.children.cycles-pp.record__finish_output
      0.06            +0.2        0.29        perf-profile.children.cycles-pp.cpus_share_cache
      0.20 ±  2%      +0.2        0.42 ±  2%  perf-profile.children.cycles-pp.remove_entity_load_avg
      0.16 ±  2%      +0.2        0.40        perf-profile.children.cycles-pp.menu_select
      0.18 ±  2%      +0.2        0.42        perf-profile.children.cycles-pp.nohz_run_idle_balance
      0.09            +0.2        0.33        perf-profile.children.cycles-pp.perf_tp_event
      0.11 ±123%      +0.2        0.35 ± 43%  perf-profile.children.cycles-pp.__thread__resolve_callchain
      0.11 ±124%      +0.2        0.36 ± 43%  perf-profile.children.cycles-pp.sample__for_each_callchain_node
      0.13            +0.3        0.39        perf-profile.children.cycles-pp.psi_task_change
      0.09            +0.3        0.35 ±  3%  perf-profile.children.cycles-pp.touch_atime
      0.07            +0.3        0.34        perf-profile.children.cycles-pp._raw_spin_lock_irq
      0.12 ±124%      +0.3        0.39 ± 42%  perf-profile.children.cycles-pp.build_id__mark_dso_hit
      0.13            +0.3        0.43        perf-profile.children.cycles-pp.perf_trace_sched_wakeup_template
      0.13 ±124%      +0.3        0.43 ± 43%  perf-profile.children.cycles-pp.perf_session__deliver_event
      0.09            +0.3        0.41        perf-profile.children.cycles-pp.irqentry_exit
      0.76            +0.3        1.10 ±  2%  perf-profile.children.cycles-pp.__softirqentry_text_start
      0.26 ±  2%      +0.3        0.60        perf-profile.children.cycles-pp.switch_mm_irqs_off
      0.11            +0.3        0.46        perf-profile.children.cycles-pp.rcu_dynticks_inc
      0.13 ±125%      +0.3        0.48 ± 43%  perf-profile.children.cycles-pp.__ordered_events__flush
      0.13 ±125%      +0.3        0.48 ± 43%  perf-profile.children.cycles-pp.perf_session__process_user_event
      0.00            +0.4        0.36 ±  5%  perf-profile.children.cycles-pp.newidle_balance
      0.83 ±  4%      +0.4        1.20        perf-profile.children.cycles-pp.cmd_record
      0.84 ±  4%      +0.4        1.21        perf-profile.children.cycles-pp.handle_internal_command
      0.84 ±  4%      +0.4        1.21        perf-profile.children.cycles-pp.run_builtin
      0.77            +0.4        1.16        perf-profile.children.cycles-pp.irq_exit_rcu
      0.11 ±  3%      +0.4        0.51        perf-profile.children.cycles-pp.native_irq_return_iret
      0.10 ±  3%      +0.4        0.55        perf-profile.children.cycles-pp.prepare_task_switch
      0.20 ±  2%      +0.4        0.64        perf-profile.children.cycles-pp.resched_curr
      0.11 ±  3%      +0.5        0.57        perf-profile.children.cycles-pp.task_h_load
      0.21            +0.5        0.69        perf-profile.children.cycles-pp.check_preempt_curr
      0.19 ±  2%      +0.5        0.68        perf-profile.children.cycles-pp.__fget_light
      0.11            +0.5        0.60        perf-profile.children.cycles-pp.irqentry_enter
      0.20 ±  3%      +0.5        0.70        perf-profile.children.cycles-pp.__fdget_pos
      0.22            +0.5        0.72        perf-profile.children.cycles-pp.ttwu_do_wakeup
      1.69            +0.5        2.20        perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.97 ±  2%      +0.6        1.55        perf-profile.children.cycles-pp.raw_spin_rq_lock_nested
      0.36            +0.6        0.97 ±  2%  perf-profile.children.cycles-pp.rebalance_domains
      0.28            +0.6        0.90        perf-profile.children.cycles-pp.update_rq_clock
      0.16 ±  3%      +0.7        0.83        perf-profile.children.cycles-pp.mutex_lock
      0.18 ±  2%      +0.7        0.88        perf-profile.children.cycles-pp.wake_affine
      0.35 ±  2%      +0.8        1.11        perf-profile.children.cycles-pp.update_curr
      1.05            +0.8        1.82        perf-profile.children.cycles-pp._raw_spin_lock
      0.25            +0.8        1.03        perf-profile.children.cycles-pp.llist_add_batch
      0.25            +0.8        1.04        perf-profile.children.cycles-pp.__smp_call_single_queue
      0.16 ±  2%      +0.8        0.97        perf-profile.children.cycles-pp.__get_user_8
      0.17 ±  2%      +0.8        0.98        perf-profile.children.cycles-pp.rseq_get_rseq_cs
      0.19            +0.9        1.06        perf-profile.children.cycles-pp.rseq_ip_fixup
      0.35 ±  2%      +0.9        1.24        perf-profile.children.cycles-pp.migrate_task_rq_fair
      0.50            +0.9        1.38        perf-profile.children.cycles-pp.set_task_cpu
      0.09 ±  5%      +0.9        0.98        perf-profile.children.cycles-pp.__update_idle_core
      0.00            +0.9        0.90 ±  2%  perf-profile.children.cycles-pp._raw_spin_trylock
      0.22 ±  2%      +0.9        1.12        perf-profile.children.cycles-pp.__rseq_handle_notify_resume
      0.09            +0.9        1.00        perf-profile.children.cycles-pp.pick_next_task_idle
      0.30            +0.9        1.21        perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
      0.18 ±  2%      +0.9        1.11        perf-profile.children.cycles-pp.mutex_unlock
      0.16 ±  3%      +1.0        1.14        perf-profile.children.cycles-pp.__switch_to
      0.15            +1.0        1.12        perf-profile.children.cycles-pp.llist_reverse_order
      0.21            +1.1        1.28        perf-profile.children.cycles-pp.copy_user_generic_unrolled
      0.22            +1.1        1.30        perf-profile.children.cycles-pp.copy_page_to_iter
      0.29            +1.3        1.57        perf-profile.children.cycles-pp.prepare_to_wait_event
      0.28            +1.3        1.62        perf-profile.children.cycles-pp.psi_task_switch
      0.84            +1.3        2.18        perf-profile.children.cycles-pp.cpumask_next
      0.91            +1.4        2.26        perf-profile.children.cycles-pp._find_next_bit
      0.32            +1.4        1.67        perf-profile.children.cycles-pp.psi_group_change
      1.09 ±  3%      +1.4        2.46        perf-profile.children.cycles-pp.main
      0.28            +1.6        1.86        perf-profile.children.cycles-pp.flush_smp_call_function_queue
      0.25            +1.7        1.91        perf-profile.children.cycles-pp.restore_fpregs_from_fpstate
      0.26            +1.7        1.92        perf-profile.children.cycles-pp.__switch_to_asm
      0.13 ±  3%      +1.7        1.83        perf-profile.children.cycles-pp.__x2apic_send_IPI_dest
      0.08            +1.7        1.81        perf-profile.children.cycles-pp.native_write_msr
      0.32            +1.7        2.06        perf-profile.children.cycles-pp.exit_to_user_mode_loop
      0.30            +2.0        2.32        perf-profile.children.cycles-pp.switch_fpu_return
      0.60            +2.1        2.66        perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      0.54            +2.8        3.37        perf-profile.children.cycles-pp.ttwu_queue_wakelist
      0.64            +3.8        4.42        perf-profile.children.cycles-pp.exit_to_user_mode_prepare
      0.67            +3.8        4.50        perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      3.43            +7.0       10.45        perf-profile.children.cycles-pp.available_idle_cpu
      4.30            +7.6       11.87        perf-profile.children.cycles-pp.select_idle_core
      5.90            +7.6       13.52        perf-profile.children.cycles-pp.select_idle_cpu
      6.26            +8.9       15.12        perf-profile.children.cycles-pp.select_idle_sibling
      6.54            +9.6       16.14        perf-profile.children.cycles-pp.select_task_rq_fair
     43.42           +10.8       54.24        perf-profile.children.cycles-pp.do_syscall_64
     43.47           +10.9       54.34        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     11.92           +11.7       23.58        perf-profile.children.cycles-pp.try_to_wake_up
     11.97           +11.9       23.87        perf-profile.children.cycles-pp.autoremove_wake_function
     12.15           +12.8       24.98        perf-profile.children.cycles-pp.__wake_up_common
     12.54           +13.0       25.53        perf-profile.children.cycles-pp.__wake_up_common_lock
     13.02           +14.9       27.90        perf-profile.children.cycles-pp.pipe_write
     13.31           +15.3       28.59        perf-profile.children.cycles-pp.new_sync_write
     13.39           +15.3       28.70        perf-profile.children.cycles-pp.vfs_write
     13.57           +15.8       29.37        perf-profile.children.cycles-pp.ksys_write
     43.91           -41.6        2.36 ±  2%  perf-profile.self.cycles-pp.update_cfs_group
     27.43           -26.0        1.48        perf-profile.self.cycles-pp.update_load_avg
      5.87            -4.9        0.92        perf-profile.self.cycles-pp.asm_sysvec_call_function_single
      1.86            -0.8        1.05        perf-profile.self.cycles-pp.try_to_wake_up
      0.76 ±  2%      -0.6        0.21        perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      0.82            -0.2        0.58        perf-profile.self.cycles-pp.select_idle_core
      0.29            -0.1        0.17 ±  2%  perf-profile.self.cycles-pp.cpumask_next_wrap
      0.05            +0.0        0.06        perf-profile.self.cycles-pp.pick_next_task_fair
      0.09 ±  5%      +0.0        0.12 ±  6%  perf-profile.self.cycles-pp.entry_SYSCALL_64
      0.07            +0.0        0.10 ±  4%  perf-profile.self.cycles-pp.vfs_write
      0.07 ±  6%      +0.0        0.11        perf-profile.self.cycles-pp.cpuidle_idle_call
      0.05            +0.0        0.09        perf-profile.self.cycles-pp.cpumask_next
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.__rdgsbase_inactive
      0.00            +0.1        0.05        perf-profile.self.cycles-pp._raw_spin_unlock_irqrestore
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.check_preempt_curr
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.sched_clock_cpu
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
      0.05            +0.1        0.10 ±  3%  perf-profile.self.cycles-pp.place_entity
      0.01 ±223%      +0.1        0.06        perf-profile.self.cycles-pp.set_next_entity
      0.00            +0.1        0.06 ±  8%  perf-profile.self.cycles-pp.ksys_read
      0.00            +0.1        0.06 ±  8%  perf-profile.self.cycles-pp.ktime_get_update_offsets_now
      0.00            +0.1        0.06        perf-profile.self.cycles-pp.__rseq_handle_notify_resume
      0.00            +0.1        0.06        perf-profile.self.cycles-pp.copy_page_to_iter
      0.00            +0.1        0.06        perf-profile.self.cycles-pp.do_syscall_64
      0.00            +0.1        0.06        perf-profile.self.cycles-pp.remove_entity_load_avg
      0.07            +0.1        0.13        perf-profile.self.cycles-pp.select_task_rq_fair
      0.00            +0.1        0.06        perf-profile.self.cycles-pp.syscall_enter_from_user_mode
      0.00            +0.1        0.06 ±  6%  perf-profile.self.cycles-pp.cpuacct_charge
      0.05            +0.1        0.11 ±  3%  perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.07            +0.1        0.13 ±  2%  perf-profile.self.cycles-pp.menu_select
      0.00            +0.1        0.06 ±  7%  perf-profile.self.cycles-pp.attach_entity_load_avg
      0.00            +0.1        0.06 ±  7%  perf-profile.self.cycles-pp.read_tsc
      0.00            +0.1        0.07        perf-profile.self.cycles-pp.native_apic_msr_eoi_write
      0.00            +0.1        0.07        perf-profile.self.cycles-pp.perf_trace_sched_wakeup_template
      0.07            +0.1        0.14        perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.00            +0.1        0.07 ±  5%  perf-profile.self.cycles-pp.psi_flags_change
      0.07            +0.1        0.15 ±  3%  perf-profile.self.cycles-pp.read
      0.00            +0.1        0.08 ±  4%  perf-profile.self.cycles-pp.idle_cpu
      0.00            +0.1        0.08        perf-profile.self.cycles-pp.__wrgsbase_inactive
      0.08 ± 10%      +0.1        0.16 ±  4%  perf-profile.self.cycles-pp.copy_user_enhanced_fast_string
      0.04 ± 45%      +0.1        0.13        perf-profile.self.cycles-pp.perf_mmap__read_head
      0.11            +0.1        0.20        perf-profile.self.cycles-pp.__update_load_avg_se
      0.00            +0.1        0.09 ±  4%  perf-profile.self.cycles-pp.update_sg_lb_stats
      0.07 ±  5%      +0.1        0.16 ±  4%  perf-profile.self.cycles-pp.pipe_write
      0.00            +0.1        0.09 ±  4%  perf-profile.self.cycles-pp.psi_task_switch
      0.00            +0.1        0.09 ±  5%  perf-profile.self.cycles-pp.psi_task_change
      0.00            +0.1        0.10 ±  5%  perf-profile.self.cycles-pp.anon_pipe_buf_release
      0.06            +0.1        0.16 ±  2%  perf-profile.self.cycles-pp.__mark_inode_dirty
      0.00            +0.1        0.11 ±  4%  perf-profile.self.cycles-pp.wake_affine
      0.00            +0.1        0.11 ±  4%  perf-profile.self.cycles-pp.send_call_function_single_ipi
      0.17 ±  5%      +0.1        0.28        perf-profile.self.cycles-pp.load_new_mm_cr3
      0.02 ± 99%      +0.1        0.14 ±  3%  perf-profile.self.cycles-pp.__get_user_nocheck_1
      0.00            +0.1        0.12        perf-profile.self.cycles-pp.pick_next_task
      0.00            +0.1        0.12 ±  3%  perf-profile.self.cycles-pp.do_idle
      0.11            +0.1        0.24        perf-profile.self.cycles-pp.native_sched_clock
      0.00            +0.1        0.13        perf-profile.self.cycles-pp.tracing_gen_ctx_irq_test
      0.06            +0.1        0.19        perf-profile.self.cycles-pp.perf_tp_event
      0.00            +0.1        0.13 ±  2%  perf-profile.self.cycles-pp.check_spread
      0.00            +0.1        0.13 ±  5%  perf-profile.self.cycles-pp.inode_needs_update_time
      0.02 ±141%      +0.1        0.15        perf-profile.self.cycles-pp.save_fpregs_to_fpstate
      0.10 ±  4%      +0.1        0.25 ±  3%  perf-profile.self.cycles-pp.new_sync_read
      0.00            +0.1        0.15 ±  3%  perf-profile.self.cycles-pp.mem_cgroup_handle_over_high
      0.00            +0.1        0.15 ±  2%  perf-profile.self.cycles-pp.___perf_sw_event
      0.00            +0.1        0.15 ±  7%  perf-profile.self.cycles-pp.ktime_get
      0.13 ±  2%      +0.2        0.28        perf-profile.self.cycles-pp.reweight_entity
      0.48            +0.2        0.64        perf-profile.self.cycles-pp.select_idle_cpu
      0.07            +0.2        0.23 ±  2%  perf-profile.self.cycles-pp.update_min_vruntime
      0.16 ±  2%      +0.2        0.33        perf-profile.self.cycles-pp.__bitmap_andnot
      0.02 ±141%      +0.2        0.21 ±  2%  perf-profile.self.cycles-pp.atime_needs_update
      0.00            +0.2        0.20 ±  9%  perf-profile.self.cycles-pp.newidle_balance
      0.06 ±  6%      +0.2        0.27        perf-profile.self.cycles-pp.prepare_to_wait_event
      0.09            +0.2        0.31        perf-profile.self.cycles-pp.switch_mm_irqs_off
      0.06 ±  6%      +0.2        0.29        perf-profile.self.cycles-pp.cpus_share_cache
      0.05            +0.2        0.29        perf-profile.self.cycles-pp.autoremove_wake_function
      0.08            +0.2        0.32        perf-profile.self.cycles-pp.ttwu_queue_wakelist
      0.07 ±  5%      +0.3        0.33        perf-profile.self.cycles-pp._raw_spin_lock_irq
      0.05 ±  8%      +0.3        0.33        perf-profile.self.cycles-pp.new_sync_write
      0.06 ±  8%      +0.3        0.35        perf-profile.self.cycles-pp.schedule
      0.06 ±  6%      +0.3        0.40        perf-profile.self.cycles-pp.prepare_task_switch
      0.11 ±  4%      +0.3        0.45        perf-profile.self.cycles-pp.rcu_dynticks_inc
      0.00            +0.3        0.35        perf-profile.self.cycles-pp.enqueue_task
      0.11            +0.4        0.50        perf-profile.self.cycles-pp.dequeue_entity
      0.11 ±  3%      +0.4        0.51        perf-profile.self.cycles-pp.native_irq_return_iret
      0.00            +0.4        0.40        perf-profile.self.cycles-pp.nohz_run_idle_balance
      0.05            +0.4        0.47        perf-profile.self.cycles-pp.sched_ttwu_pending
      0.05            +0.4        0.48        perf-profile.self.cycles-pp.switch_fpu_return
      0.19 ±  2%      +0.4        0.64        perf-profile.self.cycles-pp.resched_curr
      0.11 ±  4%      +0.5        0.56        perf-profile.self.cycles-pp.task_h_load
      0.09            +0.5        0.56        perf-profile.self.cycles-pp.irqentry_enter
      0.18 ±  2%      +0.5        0.66        perf-profile.self.cycles-pp.__fget_light
      0.09            +0.5        0.58        perf-profile.self.cycles-pp.dequeue_task_fair
      0.19 ±  3%      +0.6        0.75        perf-profile.self.cycles-pp.enqueue_entity
      0.23 ±  2%      +0.6        0.80        perf-profile.self.cycles-pp.update_rq_clock
      0.21 ±  3%      +0.6        0.81        perf-profile.self.cycles-pp.update_curr
      0.13 ±  2%      +0.6        0.74        perf-profile.self.cycles-pp.flush_smp_call_function_queue
      0.14 ±  2%      +0.7        0.79        perf-profile.self.cycles-pp.mutex_lock
      0.15            +0.7        0.82        perf-profile.self.cycles-pp.select_idle_sibling
      0.13            +0.7        0.81        perf-profile.self.cycles-pp.finish_task_switch
      0.12 ±  4%      +0.7        0.81        perf-profile.self.cycles-pp.migrate_task_rq_fair
      0.08            +0.7        0.78        perf-profile.self.cycles-pp.exit_to_user_mode_loop
      0.06 ±  6%      +0.7        0.78        perf-profile.self.cycles-pp.__update_idle_core
      0.10 ±  5%      +0.8        0.85        perf-profile.self.cycles-pp.vfs_read
      0.25            +0.8        1.03        perf-profile.self.cycles-pp.llist_add_batch
      0.16 ±  2%      +0.8        0.95        perf-profile.self.cycles-pp.__get_user_8
      0.00            +0.8        0.84 ±  2%  perf-profile.self.cycles-pp._raw_spin_trylock
      0.30            +0.9        1.20        perf-profile.self.cycles-pp.__update_load_avg_cfs_rq
      0.18 ±  2%      +0.9        1.09        perf-profile.self.cycles-pp.mutex_unlock
      0.18            +0.9        1.11        perf-profile.self.cycles-pp.__wake_up_common
      0.16            +1.0        1.11        perf-profile.self.cycles-pp.__switch_to
      0.24            +1.0        1.21        perf-profile.self.cycles-pp.main
      0.15            +1.0        1.12        perf-profile.self.cycles-pp.llist_reverse_order
      0.20 ±  2%      +1.0        1.25        perf-profile.self.cycles-pp.copy_user_generic_unrolled
      0.18 ±  2%      +1.1        1.27        perf-profile.self.cycles-pp.enqueue_task_fair
      0.88            +1.3        2.20        perf-profile.self.cycles-pp._find_next_bit
      0.31            +1.3        1.66        perf-profile.self.cycles-pp.psi_group_change
      0.28            +1.4        1.63        perf-profile.self.cycles-pp._raw_spin_lock
      0.24 ±  2%      +1.6        1.83        perf-profile.self.cycles-pp.restore_fpregs_from_fpstate
      0.25            +1.7        1.92        perf-profile.self.cycles-pp.__switch_to_asm
      0.08            +1.7        1.81        perf-profile.self.cycles-pp.native_write_msr
      0.26            +2.0        2.24        perf-profile.self.cycles-pp.pipe_read
      0.59            +2.0        2.62        perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.51            +2.2        2.70        perf-profile.self.cycles-pp.__schedule
      3.41            +7.0       10.41        perf-profile.self.cycles-pp.available_idle_cpu
      1.07           +21.7       22.74        perf-profile.self.cycles-pp.native_safe_halt



***************************************************************************************************
lkp-gnr-2sp3: 256 threads 2 sockets Intel(R) Xeon(R) 6767P  CPU @ 2.4GHz (Granite Rapids) with 256G memory
=========================================================================================
compiler/cpufreq_governor/ipc/iterations/kconfig/mode/nr_threads/rootfs/tbox_group/testcase:
  gcc-12/performance/pipe/8/x86_64-bytedance-5.15-velinux/process/1600%/debian-13-x86_64-20250902.cgz/lkp-gnr-2sp3/hackbench

commit: 
  c2f4451f9e ("Bluetooth: L2CAP: handle NULL sock pointer in l2cap_sock_alloc")
  7e2540f462 ("sched/fair: Ratelimit update to tg->load_avg")

c2f4451f9e7b5c73 7e2540f4625d5b6fe2e68833226 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
  16244076 ± 13%    +356.6%   74167320 ± 22%  cpuidle..usage
    394.17 ±155%    +609.9%       2798 ± 77%  perf-c2c.DRAM.remote
    712.83 ±  8%     -18.3%     582.50 ± 13%  perf-c2c.HITM.local
      0.01 ± 10%      +0.0        0.02 ± 11%  mpstat.cpu.all.soft%
     42.80 ±  3%      -4.3       38.53 ±  3%  mpstat.cpu.all.sys%
      4.56            +0.5        5.04 ±  2%  mpstat.cpu.all.usr%
     52.68 ±  2%      +3.5       56.20 ±  2%  turbostat.C1%
      0.66 ±  2%     +22.1%       0.81        turbostat.IPC
  95430334 ±  6%     +58.9%  1.517e+08 ± 17%  turbostat.IRQ
   8700803 ±  6%     -61.9%    3317997 ± 31%  turbostat.NMI
    797358 ±  7%     -51.4%     387879 ± 18%  meminfo.Active
    796787 ±  7%     -51.4%     387305 ± 18%  meminfo.Active(anon)
   4384894           -10.3%    3935199        meminfo.Cached
    336739 ±  7%     -47.4%     177016 ± 16%  meminfo.Mapped
    870201 ±  8%     -51.7%     420483 ± 17%  meminfo.Shmem
    116551 ±  3%     -22.7%      90062 ± 31%  numa-meminfo.node0.Mapped
    838102 ±  5%     -54.5%     381720 ± 18%  numa-meminfo.node1.Active
    837814 ±  5%     -54.5%     381432 ± 18%  numa-meminfo.node1.Active(anon)
    220710 ± 12%     -59.5%      89452 ± 24%  numa-meminfo.node1.Mapped
    906849 ±  6%     -54.5%     412261 ± 17%  numa-meminfo.node1.Shmem
     28772 ±  2%     -20.9%      22755 ± 31%  numa-vmstat.node0.nr_mapped
    196757 ±  6%     -52.4%      93726 ± 16%  numa-vmstat.node1.nr_active_anon
     51503 ± 11%     -56.6%      22349 ± 25%  numa-vmstat.node1.nr_mapped
    213185 ±  7%     -52.4%     101497 ± 16%  numa-vmstat.node1.nr_shmem
    196757 ±  6%     -52.4%      93726 ± 16%  numa-vmstat.node1.nr_zone_active_anon
   2286714 ±  3%     +12.6%    2575149 ±  3%  hackbench.throughput
   2057979 ±  2%     +14.6%    2359258 ±  4%  hackbench.throughput_avg
   2286714 ±  3%     +12.6%    2575149 ±  3%  hackbench.throughput_best
    225.25            -6.5%     210.53        hackbench.time.elapsed_time
    225.25            -6.5%     210.53        hackbench.time.elapsed_time.max
     24520 ±  3%     -15.0%      20852 ±  3%  hackbench.time.system_time
    203901 ±  5%     -52.5%      96830 ± 18%  proc-vmstat.nr_active_anon
   1100452           -10.6%     983968        proc-vmstat.nr_file_pages
     83163 ±  9%     -45.9%      44986 ± 16%  proc-vmstat.nr_mapped
    221778 ±  6%     -52.5%     105288 ± 17%  proc-vmstat.nr_shmem
    203901 ±  5%     -52.5%      96830 ± 18%  proc-vmstat.nr_zone_active_anon
     95402 ±  8%     -32.7%      64166 ±  6%  proc-vmstat.pgactivate
  10425970 ± 13%     -41.4%    6106541 ± 41%  sched_debug.cfs_rq:/.MIN_vruntime.max
      8504 ± 27%     -42.5%       4886 ± 35%  sched_debug.cfs_rq:/.load.avg
    717963 ± 24%     -35.6%     462275 ± 29%  sched_debug.cfs_rq:/.load.max
     65316 ± 20%     -36.4%      41539 ± 24%  sched_debug.cfs_rq:/.load.stddev
  10425970 ± 13%     -41.4%    6106542 ± 41%  sched_debug.cfs_rq:/.max_vruntime.max
  12761692 ± 13%     -21.1%   10071722 ± 19%  sched_debug.cfs_rq:/.min_vruntime.avg
   5394573 ± 19%     -27.0%    3938678 ± 23%  sched_debug.cfs_rq:/.min_vruntime.stddev
   5403165 ± 19%     -27.3%    3925594 ± 23%  sched_debug.cfs_rq:/.spread0.stddev
   1115835 ± 12%     -23.3%     855333 ±  8%  sched_debug.cpu.avg_idle.avg
   3730163 ± 14%     -63.9%    1345579 ± 34%  sched_debug.cpu.avg_idle.max
    656049 ± 16%     -57.0%     281934 ± 21%  sched_debug.cpu.avg_idle.stddev
    728818 ±  8%     -29.3%     515169 ±  4%  sched_debug.cpu.max_idle_balance_cost.avg
   1953993 ± 15%     -63.7%     709965 ± 33%  sched_debug.cpu.max_idle_balance_cost.max
    288631 ± 23%     -88.5%      33156 ±132%  sched_debug.cpu.max_idle_balance_cost.stddev
      1.71 ±  5%     -13.7%       1.47 ±  3%  perf-stat.i.cpi
     14.25 ±  3%      -2.7       11.57 ±  6%  perf-stat.overall.cache-miss-rate%
      1.50 ±  2%     -17.7%       1.24        perf-stat.overall.cpi
      2709 ±  4%     -15.3%       2295 ±  2%  perf-stat.overall.cycles-between-cache-misses
      0.67 ±  2%     +21.5%       0.81        perf-stat.overall.ipc
 6.075e+10           +11.6%  6.779e+10        perf-stat.ps.branch-instructions
 1.898e+08 ±  5%     +20.8%  2.292e+08 ±  6%  perf-stat.ps.branch-misses
 1.611e+08 ±  2%      +8.1%  1.742e+08        perf-stat.ps.cache-misses
 1.133e+09 ±  5%     +33.4%  1.512e+09 ±  7%  perf-stat.ps.cache-references
  14900564 ±  5%     +18.4%   17641319 ±  5%  perf-stat.ps.context-switches
 4.363e+11 ±  3%      -8.3%  3.999e+11 ±  3%  perf-stat.ps.cpu-cycles
 2.903e+11           +11.3%  3.233e+11        perf-stat.ps.instructions
    204448            +6.6%     218031        perf-stat.ps.minor-faults
    205600            +6.7%     219439        perf-stat.ps.page-faults
 6.566e+13            +4.2%  6.844e+13        perf-stat.total.instructions
     15.61 ± 18%     -11.4        4.22 ± 12%  perf-profile.calltrace.cycles-pp.enqueue_task_fair.enqueue_task.ttwu_do_activate.try_to_wake_up.autoremove_wake_function
     16.59 ± 17%     -11.2        5.37 ± 12%  perf-profile.calltrace.cycles-pp.ttwu_do_activate.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock
     16.52 ± 17%     -11.2        5.30 ± 12%  perf-profile.calltrace.cycles-pp.enqueue_task.ttwu_do_activate.try_to_wake_up.autoremove_wake_function.__wake_up_common
     40.68 ±  6%     -11.0       29.65 ±  8%  perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
     39.40 ±  6%     -11.0       28.42 ±  8%  perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
     37.49 ±  3%     -10.8       26.71 ±  2%  perf-profile.calltrace.cycles-pp.pipe_read.new_sync_read.vfs_read.ksys_read.do_syscall_64
     38.58 ±  3%     -10.8       27.82 ±  2%  perf-profile.calltrace.cycles-pp.new_sync_read.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
     11.03 ± 24%     -10.8        0.27 ±100%  perf-profile.calltrace.cycles-pp.update_cfs_group.enqueue_task_fair.enqueue_task.ttwu_do_activate.try_to_wake_up
      8.22 ± 24%      -7.8        0.46 ± 45%  perf-profile.calltrace.cycles-pp.update_cfs_group.dequeue_task_fair.__schedule.schedule.pipe_read
      6.94 ± 47%      -6.9        0.00        perf-profile.calltrace.cycles-pp.__put_page.pipe_read.new_sync_read.vfs_read.ksys_read
      6.93 ± 47%      -6.9        0.00        perf-profile.calltrace.cycles-pp.__mem_cgroup_uncharge.__put_page.pipe_read.new_sync_read.vfs_read
      6.89 ± 47%      -6.9        0.00        perf-profile.calltrace.cycles-pp.uncharge_batch.__mem_cgroup_uncharge.__put_page.pipe_read.new_sync_read
     10.20 ± 20%      -6.7        3.51 ±  7%  perf-profile.calltrace.cycles-pp.dequeue_task_fair.__schedule.schedule.pipe_read.new_sync_read
      6.66 ± 47%      -6.7        0.00        perf-profile.calltrace.cycles-pp.page_counter_uncharge.uncharge_batch.__mem_cgroup_uncharge.__put_page.pipe_read
     15.20 ± 17%      -5.9        9.33 ±  6%  perf-profile.calltrace.cycles-pp.__schedule.schedule.pipe_read.new_sync_read.vfs_read
     15.32 ± 17%      -5.8        9.51 ±  6%  perf-profile.calltrace.cycles-pp.schedule.pipe_read.new_sync_read.vfs_read.ksys_read
      3.90 ± 21%      -2.4        1.55 ± 14%  perf-profile.calltrace.cycles-pp.dequeue_task_fair.__schedule.schedule.pipe_write.new_sync_write
      5.94 ±  9%      -1.8        4.16 ± 16%  perf-profile.calltrace.cycles-pp.__schedule.schedule.pipe_write.new_sync_write.vfs_write
      6.04 ±  9%      -1.8        4.27 ± 16%  perf-profile.calltrace.cycles-pp.schedule.pipe_write.new_sync_write.vfs_write.ksys_write
      2.92 ± 14%      -1.7        1.22 ± 29%  perf-profile.calltrace.cycles-pp.enqueue_entity.enqueue_task_fair.enqueue_task.ttwu_do_activate.try_to_wake_up
      1.88 ± 22%      -0.8        1.10 ± 21%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.raw_spin_rq_lock_nested.try_to_wake_up.autoremove_wake_function
      1.32 ± 23%      -0.5        0.77 ± 18%  perf-profile.calltrace.cycles-pp._raw_spin_lock.raw_spin_rq_lock_nested.__schedule.schedule.pipe_read
      0.98 ± 12%      -0.3        0.72 ± 13%  perf-profile.calltrace.cycles-pp.pick_next_task_fair.pick_next_task.__schedule.schedule.pipe_read
      1.01 ± 12%      -0.2        0.78 ± 13%  perf-profile.calltrace.cycles-pp.pick_next_task.__schedule.schedule.pipe_read.new_sync_read
      0.70 ± 16%      +0.3        1.04 ± 12%  perf-profile.calltrace.cycles-pp.switch_fpu_return.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.37 ± 72%      +0.3        0.72 ± 13%  perf-profile.calltrace.cycles-pp.__get_user_8.rseq_get_rseq_cs.rseq_ip_fixup.__rseq_handle_notify_resume.exit_to_user_mode_loop
      0.40 ± 72%      +0.4        0.76 ± 13%  perf-profile.calltrace.cycles-pp.rseq_get_rseq_cs.rseq_ip_fixup.__rseq_handle_notify_resume.exit_to_user_mode_loop.exit_to_user_mode_prepare
      0.41 ± 71%      +0.4        0.81 ± 12%  perf-profile.calltrace.cycles-pp.restore_fpregs_from_fpstate.switch_fpu_return.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
      0.67 ± 18%      +0.4        1.10 ±  7%  perf-profile.calltrace.cycles-pp.__switch_to_asm
      0.65 ± 12%      +0.5        1.11 ± 10%  perf-profile.calltrace.cycles-pp.psi_task_switch.__schedule.schedule.pipe_read.new_sync_read
      2.24 ± 13%      +0.5        2.76 ±  6%  perf-profile.calltrace.cycles-pp.copy_user_enhanced_fast_string.copy_page_to_iter.pipe_read.new_sync_read.vfs_read
      0.00            +0.6        0.61 ± 10%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.prepare_to_wait_event.pipe_write.new_sync_write.vfs_write
      0.10 ±223%      +0.7        0.84 ± 11%  perf-profile.calltrace.cycles-pp.psi_group_change.psi_task_switch.__schedule.schedule.pipe_read
      0.00            +0.7        0.74 ±  7%  perf-profile.calltrace.cycles-pp.prepare_to_wait_event.pipe_write.new_sync_write.vfs_write.ksys_write
      0.00            +0.8        0.77 ± 12%  perf-profile.calltrace.cycles-pp.prepare_to_wait_event.pipe_read.new_sync_read.vfs_read.ksys_read
      0.80 ± 50%      +0.8        1.64 ± 24%  perf-profile.calltrace.cycles-pp.__sysvec_call_function_single.sysvec_call_function_single.asm_sysvec_call_function_single.native_safe_halt.acpi_idle_do_entry
      0.00            +0.8        0.85 ± 26%  perf-profile.calltrace.cycles-pp.ttwu_queue_wakelist.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock
      0.00            +0.9        0.93 ± 23%  perf-profile.calltrace.cycles-pp.__schedule.schedule_idle.do_idle.cpu_startup_entry.secondary_startup_64_no_verify
      0.00            +1.0        0.96 ± 23%  perf-profile.calltrace.cycles-pp.schedule_idle.do_idle.cpu_startup_entry.secondary_startup_64_no_verify
      0.80 ± 50%      +1.0        1.79 ± 24%  perf-profile.calltrace.cycles-pp.sysvec_call_function_single.asm_sysvec_call_function_single.native_safe_halt.acpi_idle_do_entry.acpi_idle_enter
      0.00            +1.0        1.00 ± 21%  perf-profile.calltrace.cycles-pp.release_pages.tlb_finish_mmu.exit_mmap.mmput.exit_mm
      0.00            +1.1        1.08 ± 26%  perf-profile.calltrace.cycles-pp.available_idle_cpu.select_idle_core.select_idle_cpu.select_idle_sibling.select_task_rq_fair
      1.43 ± 19%      +1.1        2.52 ±  6%  perf-profile.calltrace.cycles-pp.mutex_lock.pipe_write.new_sync_write.vfs_write.ksys_write
      0.60 ± 48%      +1.1        1.70 ± 14%  perf-profile.calltrace.cycles-pp.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_vmas.exit_mmap
      0.00            +1.1        1.12 ± 23%  perf-profile.calltrace.cycles-pp.__mutex_lock.pipe_write.new_sync_write.vfs_write.ksys_write
      0.60 ± 48%      +1.1        1.72 ± 14%  perf-profile.calltrace.cycles-pp.zap_pmd_range.unmap_page_range.unmap_vmas.exit_mmap.mmput
      0.61 ± 48%      +1.1        1.73 ± 14%  perf-profile.calltrace.cycles-pp.unmap_page_range.unmap_vmas.exit_mmap.mmput.exit_mm
      0.61 ± 48%      +1.1        1.75 ± 14%  perf-profile.calltrace.cycles-pp.unmap_vmas.exit_mmap.mmput.exit_mm.do_exit
      0.90 ± 50%      +1.2        2.08 ± 24%  perf-profile.calltrace.cycles-pp.native_safe_halt.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter
      0.08 ±223%      +1.2        1.29 ± 20%  perf-profile.calltrace.cycles-pp.tlb_finish_mmu.exit_mmap.mmput.exit_mm.do_exit
      1.47 ± 21%      +1.4        2.84 ±  9%  perf-profile.calltrace.cycles-pp.mutex_unlock.pipe_write.new_sync_write.vfs_write.ksys_write
      0.00            +1.6        1.64 ± 26%  perf-profile.calltrace.cycles-pp.select_idle_core.select_idle_cpu.select_idle_sibling.select_task_rq_fair.try_to_wake_up
      0.94 ± 50%      +1.9        2.89 ± 25%  perf-profile.calltrace.cycles-pp.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      0.94 ± 50%      +2.0        2.90 ± 25%  perf-profile.calltrace.cycles-pp.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      0.95 ± 50%      +2.0        2.97 ± 25%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
      0.95 ± 50%      +2.0        2.97 ± 25%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.secondary_startup_64_no_verify
      0.96 ± 50%      +2.2        3.11 ± 25%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.secondary_startup_64_no_verify
      2.45 ± 24%      +2.3        4.73 ± 16%  perf-profile.calltrace.cycles-pp.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.46 ± 24%      +2.3        4.74 ± 16%  perf-profile.calltrace.cycles-pp.__x64_sys_exit_group.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.46 ± 24%      +2.3        4.74 ± 16%  perf-profile.calltrace.cycles-pp.do_group_exit.__x64_sys_exit_group.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.09 ±223%      +2.3        2.41 ± 22%  perf-profile.calltrace.cycles-pp.available_idle_cpu.select_idle_cpu.select_idle_sibling.select_task_rq_fair.try_to_wake_up
      1.24 ± 25%      +2.4        3.61 ± 15%  perf-profile.calltrace.cycles-pp.exit_mmap.mmput.exit_mm.do_exit.do_group_exit
      1.24 ± 25%      +2.4        3.62 ± 15%  perf-profile.calltrace.cycles-pp.mmput.exit_mm.do_exit.do_group_exit.__x64_sys_exit_group
      1.24 ± 25%      +2.4        3.62 ± 15%  perf-profile.calltrace.cycles-pp.exit_mm.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
      0.92 ± 50%      +2.4        3.33 ± 29%  perf-profile.calltrace.cycles-pp.asm_sysvec_call_function_single.native_safe_halt.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state
      1.38 ± 33%      +3.3        4.66 ± 24%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.secondary_startup_64_no_verify
      1.38 ± 33%      +3.3        4.68 ± 24%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.secondary_startup_64_no_verify
      1.39 ± 33%      +3.4        4.75 ± 24%  perf-profile.calltrace.cycles-pp.secondary_startup_64_no_verify
      1.86 ± 32%      +8.1        9.96 ± 14%  perf-profile.calltrace.cycles-pp.select_idle_cpu.select_idle_sibling.select_task_rq_fair.try_to_wake_up.autoremove_wake_function
      2.47 ± 27%      +9.0       11.52 ± 12%  perf-profile.calltrace.cycles-pp.select_idle_sibling.select_task_rq_fair.try_to_wake_up.autoremove_wake_function.__wake_up_common
      2.92 ± 19%      +9.3       12.18 ± 12%  perf-profile.calltrace.cycles-pp.select_task_rq_fair.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock
     23.88 ± 24%     -21.6        2.28 ± 12%  perf-profile.children.cycles-pp.update_cfs_group
     16.83 ± 17%     -11.4        5.45 ±  4%  perf-profile.children.cycles-pp.enqueue_task_fair
     17.76 ± 16%     -11.0        6.79 ±  4%  perf-profile.children.cycles-pp.enqueue_task
     17.81 ± 16%     -11.0        6.86 ±  4%  perf-profile.children.cycles-pp.ttwu_do_activate
     37.74 ±  3%     -10.8       26.95 ±  2%  perf-profile.children.cycles-pp.pipe_read
     38.69 ±  3%     -10.8       27.92 ±  2%  perf-profile.children.cycles-pp.new_sync_read
     41.51 ±  4%     -10.8       30.75 ±  3%  perf-profile.children.cycles-pp.ksys_read
     40.22 ±  3%     -10.7       29.48 ±  3%  perf-profile.children.cycles-pp.vfs_read
     14.16 ± 20%      -9.0        5.18 ±  4%  perf-profile.children.cycles-pp.dequeue_task_fair
     24.29 ± 13%      -7.3       16.96 ±  5%  perf-profile.children.cycles-pp.schedule
      6.98 ± 46%      -6.7        0.30 ±  9%  perf-profile.children.cycles-pp.__put_page
      6.98 ± 46%      -6.7        0.30 ±  9%  perf-profile.children.cycles-pp.__mem_cgroup_uncharge
     24.30 ± 13%      -6.7       17.64 ±  3%  perf-profile.children.cycles-pp.__schedule
      6.96 ± 46%      -6.7        0.30 ±  9%  perf-profile.children.cycles-pp.uncharge_batch
      6.77 ± 45%      -6.5        0.25 ±  9%  perf-profile.children.cycles-pp.page_counter_uncharge
     91.67            -4.8       86.88        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     90.55            -4.7       85.85        perf-profile.children.cycles-pp.do_syscall_64
      5.26 ± 12%      -2.1        3.13 ±  2%  perf-profile.children.cycles-pp.update_load_avg
      4.06 ± 13%      -1.9        2.20 ±  2%  perf-profile.children.cycles-pp.enqueue_entity
      1.24 ± 14%      -0.4        0.87 ±  5%  perf-profile.children.cycles-pp.set_next_entity
      0.30 ± 43%      -0.2        0.07 ± 11%  perf-profile.children.cycles-pp.__memcg_kmem_charge_page
      0.27 ± 44%      -0.2        0.06 ± 14%  perf-profile.children.cycles-pp.obj_cgroup_charge_pages
      0.15 ± 50%      -0.1        0.06 ± 11%  perf-profile.children.cycles-pp.memcg_account_kmem
      0.15 ± 20%      -0.1        0.08 ± 20%  perf-profile.children.cycles-pp.__task_rq_lock
      0.06 ±  6%      +0.0        0.08 ±  4%  perf-profile.children.cycles-pp.__mark_inode_dirty
      0.07 ± 15%      +0.0        0.10 ±  4%  perf-profile.children.cycles-pp.finish_wait
      0.25 ± 11%      +0.1        0.30 ±  7%  perf-profile.children.cycles-pp.kill_fasync
      0.16 ± 13%      +0.1        0.21 ±  6%  perf-profile.children.cycles-pp.psi_flags_change
      0.00            +0.1        0.06 ±  9%  perf-profile.children.cycles-pp.__rb_erase_color
      0.08 ± 20%      +0.1        0.14 ± 14%  perf-profile.children.cycles-pp.ktime_get
      0.10 ± 13%      +0.1        0.16 ±  8%  perf-profile.children.cycles-pp.cpuacct_charge
      0.04 ± 73%      +0.1        0.10 ±  6%  perf-profile.children.cycles-pp.place_entity
      0.00            +0.1        0.06 ± 11%  perf-profile.children.cycles-pp.__free_one_page
      0.03 ±103%      +0.1        0.10 ± 32%  perf-profile.children.cycles-pp.get_page_from_freelist
      0.00            +0.1        0.07 ± 25%  perf-profile.children.cycles-pp.__mod_lruvec_page_state
      0.00            +0.1        0.07 ± 29%  perf-profile.children.cycles-pp.free_vmap_area_noflush
      0.00            +0.1        0.07 ± 16%  perf-profile.children.cycles-pp.lock_page_memcg
      0.00            +0.1        0.07 ±  9%  perf-profile.children.cycles-pp.check_cpu_stall
      0.01 ±223%      +0.1        0.08 ± 12%  perf-profile.children.cycles-pp.memcg_slab_free_hook
      0.00            +0.1        0.07 ± 23%  perf-profile.children.cycles-pp.osq_unlock
      0.00            +0.1        0.08 ±  6%  perf-profile.children.cycles-pp.rcu_pending
      0.00            +0.1        0.08 ±  6%  perf-profile.children.cycles-pp.rcu_sched_clock_irq
      0.00            +0.1        0.08 ± 25%  perf-profile.children.cycles-pp.run_ksoftirqd
      0.00            +0.1        0.08 ± 29%  perf-profile.children.cycles-pp.menu_select
      0.01 ±223%      +0.1        0.09 ±  8%  perf-profile.children.cycles-pp.remove_vma
      0.00            +0.1        0.08 ± 28%  perf-profile.children.cycles-pp.smpboot_thread_fn
      0.06 ±  8%      +0.1        0.14 ± 50%  perf-profile.children.cycles-pp.load_balance
      0.00            +0.1        0.09 ± 23%  perf-profile.children.cycles-pp.irqentry_exit
      0.02 ±141%      +0.1        0.11 ± 34%  perf-profile.children.cycles-pp.remove_vm_area
      0.00            +0.1        0.09 ± 32%  perf-profile.children.cycles-pp.wait_task_zombie
      0.15 ± 15%      +0.1        0.24 ±  7%  perf-profile.children.cycles-pp.__calc_delta
      0.00            +0.1        0.09 ± 56%  perf-profile.children.cycles-pp.update_sg_lb_stats
      0.00            +0.1        0.09 ± 39%  perf-profile.children.cycles-pp.next_uptodate_page
      0.00            +0.1        0.10 ± 55%  perf-profile.children.cycles-pp.find_busiest_group
      0.00            +0.1        0.10 ± 55%  perf-profile.children.cycles-pp.update_sd_lb_stats
      0.00            +0.1        0.10 ± 25%  perf-profile.children.cycles-pp.irqentry_enter
      0.00            +0.1        0.10 ± 57%  perf-profile.children.cycles-pp.release_task
      0.00            +0.1        0.10 ± 25%  perf-profile.children.cycles-pp.rcu_dynticks_inc
      0.00            +0.1        0.11 ± 20%  perf-profile.children.cycles-pp.__bitmap_andnot
      0.00            +0.1        0.11 ± 18%  perf-profile.children.cycles-pp.cpus_share_cache
      0.01 ±223%      +0.1        0.12 ± 18%  perf-profile.children.cycles-pp.page_remove_file_rmap
      0.05 ± 73%      +0.1        0.17 ± 32%  perf-profile.children.cycles-pp.__vunmap
      0.05 ± 73%      +0.1        0.17 ± 31%  perf-profile.children.cycles-pp.free_work
      0.00            +0.1        0.12 ± 25%  perf-profile.children.cycles-pp.__update_idle_core
      0.13 ± 12%      +0.1        0.25 ± 15%  perf-profile.children.cycles-pp.task_h_load
      0.09 ± 17%      +0.1        0.22 ± 12%  perf-profile.children.cycles-pp.kmem_cache_free
      0.09 ± 23%      +0.1        0.22 ±  8%  perf-profile.children.cycles-pp.unlink_anon_vmas
      0.06 ± 51%      +0.1        0.19 ± 27%  perf-profile.children.cycles-pp.process_one_work
      0.21 ± 42%      +0.1        0.34 ± 20%  perf-profile.children.cycles-pp.mutex_spin_on_owner
      0.00            +0.1        0.13 ± 25%  perf-profile.children.cycles-pp.pick_next_task_idle
      0.04 ± 71%      +0.1        0.18 ± 23%  perf-profile.children.cycles-pp.native_irq_return_iret
      0.16 ±  8%      +0.1        0.30 ± 10%  perf-profile.children.cycles-pp._raw_spin_lock_irq
      0.07 ± 49%      +0.1        0.22 ± 24%  perf-profile.children.cycles-pp.worker_thread
      0.90 ±  8%      +0.1        1.04 ±  5%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.07 ± 51%      +0.1        0.21 ± 21%  perf-profile.children.cycles-pp.flush_smp_call_function_from_idle
      0.00            +0.1        0.15 ± 21%  perf-profile.children.cycles-pp.rwsem_optimistic_spin
      0.00            +0.2        0.15 ± 20%  perf-profile.children.cycles-pp.rwsem_down_write_slowpath
      0.38 ± 20%      +0.2        0.54 ±  7%  perf-profile.children.cycles-pp.update_min_vruntime
      0.22 ± 17%      +0.2        0.38 ±  9%  perf-profile.children.cycles-pp.resched_curr
      0.00            +0.2        0.16 ± 45%  perf-profile.children.cycles-pp.newidle_balance
      0.10 ± 29%      +0.2        0.26 ± 14%  perf-profile.children.cycles-pp.free_swap_cache
      0.10 ± 29%      +0.2        0.27 ± 14%  perf-profile.children.cycles-pp.free_pages_and_swap_cache
      0.00            +0.2        0.17 ± 45%  perf-profile.children.cycles-pp.filemap_map_pages
      0.08 ± 13%      +0.2        0.25 ± 16%  perf-profile.children.cycles-pp.free_unref_page_commit
      0.03 ±101%      +0.2        0.20 ± 15%  perf-profile.children.cycles-pp.unlink_file_vma
      0.07 ± 14%      +0.2        0.24 ± 17%  perf-profile.children.cycles-pp.free_pcppages_bulk
      0.00            +0.2        0.18 ± 44%  perf-profile.children.cycles-pp.do_fault
      0.00            +0.2        0.18 ± 44%  perf-profile.children.cycles-pp.do_read_fault
      0.00            +0.2        0.18 ± 22%  perf-profile.children.cycles-pp.remove_entity_load_avg
      0.45 ± 16%      +0.2        0.63 ±  4%  perf-profile.children.cycles-pp.check_preempt_curr
      0.83 ±  9%      +0.2        1.01 ±  5%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.00            +0.2        0.19 ± 64%  perf-profile.children.cycles-pp.copy_p4d_range
      0.00            +0.2        0.19 ± 62%  perf-profile.children.cycles-pp.copy_page_range
      0.00            +0.2        0.19 ± 27%  perf-profile.children.cycles-pp.lock_page_lruvec_irqsave
      0.48 ± 15%      +0.2        0.67 ±  3%  perf-profile.children.cycles-pp.ttwu_do_wakeup
      0.60 ± 14%      +0.2        0.80 ±  6%  perf-profile.children.cycles-pp.__update_load_avg_se
      0.00            +0.2        0.20 ± 52%  perf-profile.children.cycles-pp.update_sg_wakeup_stats
      0.00            +0.2        0.20 ± 53%  perf-profile.children.cycles-pp.find_idlest_group
      0.00            +0.2        0.20 ± 22%  perf-profile.children.cycles-pp.nohz_run_idle_balance
      0.00            +0.2        0.21 ± 20%  perf-profile.children.cycles-pp.llist_reverse_order
      0.05 ± 50%      +0.2        0.26 ± 13%  perf-profile.children.cycles-pp.rcu_core
      0.01 ±223%      +0.2        0.22 ± 47%  perf-profile.children.cycles-pp.wp_page_copy
      0.21 ±  9%      +0.2        0.43 ± 15%  perf-profile.children.cycles-pp.wake_affine
      0.00            +0.2        0.23 ± 52%  perf-profile.children.cycles-pp.wake_up_new_task
      0.01 ±223%      +0.2        0.24 ± 16%  perf-profile.children.cycles-pp.rcu_do_batch
      0.11 ± 13%      +0.2        0.34 ± 16%  perf-profile.children.cycles-pp.irq_exit_rcu
      0.56 ± 17%      +0.2        0.79 ± 10%  perf-profile.children.cycles-pp.rseq_get_rseq_cs
      0.00            +0.2        0.24 ± 36%  perf-profile.children.cycles-pp.__x2apic_send_IPI_dest
      0.10 ± 27%      +0.2        0.34 ± 26%  perf-profile.children.cycles-pp.kthread
      0.00            +0.2        0.24 ± 36%  perf-profile.children.cycles-pp.native_write_msr
      0.52 ± 17%      +0.2        0.76 ±  9%  perf-profile.children.cycles-pp.__get_user_8
      0.06 ±  8%      +0.2        0.30 ± 22%  perf-profile.children.cycles-pp.migrate_task_rq_fair
      0.58 ± 14%      +0.3        0.85 ±  7%  perf-profile.children.cycles-pp.restore_fpregs_from_fpstate
      0.09 ± 12%      +0.3        0.36 ± 22%  perf-profile.children.cycles-pp.set_task_cpu
      0.12 ± 19%      +0.3        0.40 ± 16%  perf-profile.children.cycles-pp.__softirqentry_text_start
      0.10 ± 27%      +0.3        0.40 ± 30%  perf-profile.children.cycles-pp.ret_from_fork
      0.16 ± 22%      +0.3        0.46 ± 12%  perf-profile.children.cycles-pp.free_pgtables
      0.05 ± 49%      +0.3        0.37 ± 21%  perf-profile.children.cycles-pp.flush_smp_call_function_queue
      0.86 ± 16%      +0.3        1.20 ±  8%  perf-profile.children.cycles-pp.psi_task_change
      0.72 ± 14%      +0.4        1.08 ±  7%  perf-profile.children.cycles-pp.switch_fpu_return
      0.00            +0.4        0.37 ± 61%  perf-profile.children.cycles-pp.dup_mmap
      0.52 ± 14%      +0.4        0.89        perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
      0.00            +0.4        0.39 ± 62%  perf-profile.children.cycles-pp.copy_mm
      0.06 ± 52%      +0.4        0.46 ± 43%  perf-profile.children.cycles-pp.__handle_mm_fault
      0.13 ± 28%      +0.4        0.54 ± 12%  perf-profile.children.cycles-pp.cpumask_next
      0.06 ± 51%      +0.4        0.48 ± 43%  perf-profile.children.cycles-pp.handle_mm_fault
      0.00            +0.4        0.42 ± 22%  perf-profile.children.cycles-pp.llist_add_batch
      0.00            +0.4        0.42 ± 22%  perf-profile.children.cycles-pp.__smp_call_single_queue
      0.69 ± 17%      +0.4        1.12 ±  7%  perf-profile.children.cycles-pp.__switch_to_asm
      0.19 ± 27%      +0.4        0.63 ± 19%  perf-profile.children.cycles-pp.page_remove_rmap
      0.88 ± 17%      +0.4        1.32 ±  7%  perf-profile.children.cycles-pp.prepare_task_switch
      0.08 ± 29%      +0.5        0.58 ± 43%  perf-profile.children.cycles-pp.do_user_addr_fault
      0.08 ± 28%      +0.5        0.58 ± 44%  perf-profile.children.cycles-pp.exc_page_fault
      0.00            +0.5        0.51 ± 61%  perf-profile.children.cycles-pp.copy_process
      0.53 ± 16%      +0.5        1.07 ±  4%  perf-profile.children.cycles-pp.update_rq_clock
      0.09 ± 31%      +0.6        0.65 ± 46%  perf-profile.children.cycles-pp.asm_exc_page_fault
      1.33 ± 17%      +0.6        1.91 ±  5%  perf-profile.children.cycles-pp.update_curr
      1.33 ± 25%      +0.7        2.00 ± 21%  perf-profile.children.cycles-pp.__sysvec_call_function_single
      0.21 ± 18%      +0.7        0.91 ± 15%  perf-profile.children.cycles-pp.cpumask_next_wrap
      0.06 ± 21%      +0.7        0.76 ± 23%  perf-profile.children.cycles-pp.osq_lock
      0.20 ± 20%      +0.7        0.92 ± 13%  perf-profile.children.cycles-pp._find_next_bit
      0.01 ±223%      +0.7        0.74 ± 58%  perf-profile.children.cycles-pp.__do_sys_clone
      0.24 ± 32%      +0.7        0.96 ± 23%  perf-profile.children.cycles-pp.schedule_idle
      0.01 ±223%      +0.7        0.74 ± 58%  perf-profile.children.cycles-pp.kernel_clone
      0.24 ± 28%      +0.8        1.01 ± 22%  perf-profile.children.cycles-pp.release_pages
      0.14 ± 16%      +0.8        0.97 ± 21%  perf-profile.children.cycles-pp.ttwu_queue_wakelist
      1.30 ± 15%      +0.9        2.16 ±  3%  perf-profile.children.cycles-pp.psi_task_switch
      0.99 ± 19%      +0.9        1.85 ±  5%  perf-profile.children.cycles-pp.reweight_entity
      1.34 ± 25%      +0.9        2.21 ± 22%  perf-profile.children.cycles-pp.sysvec_call_function_single
      0.01 ±223%      +0.9        0.88 ± 58%  perf-profile.children.cycles-pp._Fork
      0.35 ± 28%      +0.9        1.29 ± 20%  perf-profile.children.cycles-pp.tlb_finish_mmu
      1.43 ± 15%      +1.0        2.40 ±  3%  perf-profile.children.cycles-pp.psi_group_change
      0.59 ± 12%      +1.0        1.59 ±  6%  perf-profile.children.cycles-pp.prepare_to_wait_event
      0.67 ± 23%      +1.1        1.73 ± 14%  perf-profile.children.cycles-pp.zap_pmd_range
      0.67 ± 23%      +1.1        1.72 ± 14%  perf-profile.children.cycles-pp.zap_pte_range
      0.68 ± 24%      +1.1        1.73 ± 14%  perf-profile.children.cycles-pp.unmap_page_range
      0.68 ± 23%      +1.1        1.75 ± 14%  perf-profile.children.cycles-pp.unmap_vmas
      2.60 ± 15%      +1.1        3.72 ±  3%  perf-profile.children.cycles-pp.mutex_lock
      0.34 ± 37%      +1.2        1.49 ± 22%  perf-profile.children.cycles-pp.__mutex_lock
      2.16 ± 17%      +1.4        3.59 ±  6%  perf-profile.children.cycles-pp.mutex_unlock
      0.88 ± 11%      +1.6        2.45 ±  7%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      1.48 ± 25%      +1.6        3.10 ± 23%  perf-profile.children.cycles-pp.asm_sysvec_call_function_single
      0.10 ± 48%      +1.8        1.87 ± 23%  perf-profile.children.cycles-pp.select_idle_core
      1.02 ± 34%      +1.9        2.95 ± 26%  perf-profile.children.cycles-pp.native_safe_halt
      1.02 ± 34%      +1.9        2.96 ± 25%  perf-profile.children.cycles-pp.acpi_idle_do_entry
      1.02 ± 34%      +1.9        2.96 ± 25%  perf-profile.children.cycles-pp.acpi_idle_enter
      1.02 ± 33%      +2.0        3.04 ± 25%  perf-profile.children.cycles-pp.cpuidle_enter_state
      1.02 ± 33%      +2.0        3.04 ± 25%  perf-profile.children.cycles-pp.cpuidle_enter
      1.04 ± 33%      +2.1        3.18 ± 26%  perf-profile.children.cycles-pp.cpuidle_idle_call
      2.46 ± 24%      +2.3        4.74 ± 16%  perf-profile.children.cycles-pp.__x64_sys_exit_group
      2.46 ± 24%      +2.3        4.74 ± 16%  perf-profile.children.cycles-pp.do_group_exit
      2.46 ± 24%      +2.3        4.78 ± 16%  perf-profile.children.cycles-pp.do_exit
      1.24 ± 25%      +2.4        3.61 ± 15%  perf-profile.children.cycles-pp.exit_mmap
      1.24 ± 25%      +2.4        3.62 ± 15%  perf-profile.children.cycles-pp.mmput
      1.24 ± 25%      +2.4        3.62 ± 15%  perf-profile.children.cycles-pp.exit_mm
      1.39 ± 33%      +3.4        4.74 ± 24%  perf-profile.children.cycles-pp.do_idle
      1.39 ± 33%      +3.4        4.75 ± 24%  perf-profile.children.cycles-pp.cpu_startup_entry
      1.39 ± 33%      +3.4        4.75 ± 24%  perf-profile.children.cycles-pp.secondary_startup_64_no_verify
      0.86 ± 20%      +3.5        4.35 ± 15%  perf-profile.children.cycles-pp.available_idle_cpu
      2.08 ± 22%      +8.1       10.21 ± 13%  perf-profile.children.cycles-pp.select_idle_cpu
      2.63 ± 21%      +8.9       11.57 ± 12%  perf-profile.children.cycles-pp.select_idle_sibling
      3.00 ± 19%      +9.4       12.42 ± 13%  perf-profile.children.cycles-pp.select_task_rq_fair
     23.88 ± 24%     -21.6        2.26 ± 12%  perf-profile.self.cycles-pp.update_cfs_group
      6.60 ± 45%      -6.4        0.21 ± 10%  perf-profile.self.cycles-pp.page_counter_uncharge
      4.11 ± 13%      -2.8        1.26 ±  5%  perf-profile.self.cycles-pp.update_load_avg
      0.06 ± 11%      +0.0        0.08 ±  4%  perf-profile.self.cycles-pp.__mark_inode_dirty
      0.09 ± 17%      +0.0        0.12 ± 12%  perf-profile.self.cycles-pp.native_load_tls
      0.14 ± 13%      +0.0        0.18 ±  4%  perf-profile.self.cycles-pp.psi_flags_change
      0.15 ± 11%      +0.1        0.20 ±  4%  perf-profile.self.cycles-pp.kill_fasync
      0.02 ±141%      +0.1        0.07        perf-profile.self.cycles-pp.check_preempt_curr
      0.00            +0.1        0.06 ± 13%  perf-profile.self.cycles-pp.__free_one_page
      0.15 ± 18%      +0.1        0.21 ±  9%  perf-profile.self.cycles-pp.select_task_rq_fair
      0.09 ± 14%      +0.1        0.16 ±  9%  perf-profile.self.cycles-pp.cpuacct_charge
      0.03 ±100%      +0.1        0.09 ±  7%  perf-profile.self.cycles-pp.place_entity
      0.00            +0.1        0.06 ± 17%  perf-profile.self.cycles-pp.lock_page_memcg
      0.00            +0.1        0.06 ± 23%  perf-profile.self.cycles-pp.set_task_cpu
      0.08 ± 14%      +0.1        0.14 ±  5%  perf-profile.self.cycles-pp.enqueue_task
      0.15 ± 24%      +0.1        0.22 ± 11%  perf-profile.self.cycles-pp.psi_task_change
      0.01 ±223%      +0.1        0.08 ±  8%  perf-profile.self.cycles-pp.autoremove_wake_function
      0.00            +0.1        0.07 ±  9%  perf-profile.self.cycles-pp.check_cpu_stall
      0.00            +0.1        0.08 ±  6%  perf-profile.self.cycles-pp.cpumask_next
      0.00            +0.1        0.08 ± 27%  perf-profile.self.cycles-pp.irqentry_enter
      0.13 ± 15%      +0.1        0.22 ±  8%  perf-profile.self.cycles-pp.__calc_delta
      0.00            +0.1        0.09 ± 39%  perf-profile.self.cycles-pp.next_uptodate_page
      0.00            +0.1        0.09 ± 18%  perf-profile.self.cycles-pp.sched_ttwu_pending
      0.27 ± 14%      +0.1        0.36 ±  8%  perf-profile.self.cycles-pp.psi_task_switch
      0.14 ± 16%      +0.1        0.24 ±  5%  perf-profile.self.cycles-pp.switch_fpu_return
      0.00            +0.1        0.10 ± 27%  perf-profile.self.cycles-pp.__update_idle_core
      0.00            +0.1        0.10 ± 20%  perf-profile.self.cycles-pp.cpus_share_cache
      0.00            +0.1        0.10 ± 20%  perf-profile.self.cycles-pp.__bitmap_andnot
      0.00            +0.1        0.10 ± 22%  perf-profile.self.cycles-pp.nohz_run_idle_balance
      0.00            +0.1        0.10 ± 27%  perf-profile.self.cycles-pp.rcu_dynticks_inc
      0.19 ± 15%      +0.1        0.30 ±  4%  perf-profile.self.cycles-pp.prepare_to_wait_event
      0.01 ±223%      +0.1        0.12 ± 17%  perf-profile.self.cycles-pp.page_remove_file_rmap
      0.09 ± 23%      +0.1        0.20 ±  5%  perf-profile.self.cycles-pp.pick_next_task
      0.00            +0.1        0.12 ± 21%  perf-profile.self.cycles-pp.migrate_task_rq_fair
      0.21 ± 41%      +0.1        0.34 ± 21%  perf-profile.self.cycles-pp.mutex_spin_on_owner
      0.13 ±  9%      +0.1        0.25 ± 15%  perf-profile.self.cycles-pp.task_h_load
      0.04 ± 71%      +0.1        0.18 ± 23%  perf-profile.self.cycles-pp.native_irq_return_iret
      0.15 ±  9%      +0.1        0.29 ± 11%  perf-profile.self.cycles-pp._raw_spin_lock_irq
      0.35 ± 21%      +0.1        0.50 ±  6%  perf-profile.self.cycles-pp.update_min_vruntime
      0.22 ± 17%      +0.2        0.37 ±  9%  perf-profile.self.cycles-pp.resched_curr
      0.10 ± 12%      +0.2        0.25 ±  9%  perf-profile.self.cycles-pp.ttwu_queue_wakelist
      0.10 ± 26%      +0.2        0.26 ± 14%  perf-profile.self.cycles-pp.free_swap_cache
      0.00            +0.2        0.16 ± 23%  perf-profile.self.cycles-pp.flush_smp_call_function_queue
      0.16 ± 17%      +0.2        0.33 ±  2%  perf-profile.self.cycles-pp.dequeue_entity
      0.00            +0.2        0.18 ± 51%  perf-profile.self.cycles-pp.update_sg_wakeup_stats
      0.56 ± 14%      +0.2        0.76 ±  5%  perf-profile.self.cycles-pp.__update_load_avg_se
      0.18 ± 18%      +0.2        0.37 ±  4%  perf-profile.self.cycles-pp.finish_task_switch
      0.00            +0.2        0.20 ± 20%  perf-profile.self.cycles-pp.llist_reverse_order
      0.23 ± 10%      +0.2        0.44 ±  7%  perf-profile.self.cycles-pp.__wake_up_common
      0.00            +0.2        0.22 ± 22%  perf-profile.self.cycles-pp.select_idle_core
      0.51 ± 17%      +0.2        0.74 ±  9%  perf-profile.self.cycles-pp.__get_user_8
      0.00            +0.2        0.24 ± 36%  perf-profile.self.cycles-pp.native_write_msr
      0.38 ± 17%      +0.2        0.62 ±  5%  perf-profile.self.cycles-pp.exit_to_user_mode_loop
      0.64 ± 16%      +0.3        0.91 ±  4%  perf-profile.self.cycles-pp.update_curr
      0.57 ± 14%      +0.3        0.84 ±  7%  perf-profile.self.cycles-pp.restore_fpregs_from_fpstate
      0.12 ± 32%      +0.3        0.43 ± 19%  perf-profile.self.cycles-pp.page_remove_rmap
      0.04 ± 76%      +0.4        0.41 ± 21%  perf-profile.self.cycles-pp.__mutex_lock
      0.52 ± 15%      +0.4        0.89 ±  4%  perf-profile.self.cycles-pp.prepare_task_switch
      0.50 ± 14%      +0.4        0.87        perf-profile.self.cycles-pp.__update_load_avg_cfs_rq
      0.49 ± 16%      +0.4        0.86 ±  2%  perf-profile.self.cycles-pp.enqueue_entity
      0.12 ± 18%      +0.4        0.50 ± 15%  perf-profile.self.cycles-pp.cpumask_next_wrap
      1.35 ±  9%      +0.4        1.74 ±  4%  perf-profile.self.cycles-pp.pipe_read
      0.00            +0.4        0.42 ± 22%  perf-profile.self.cycles-pp.llist_add_batch
      0.31 ± 19%      +0.4        0.74 ±  5%  perf-profile.self.cycles-pp.select_idle_sibling
      0.68 ± 18%      +0.4        1.12 ±  7%  perf-profile.self.cycles-pp.__switch_to_asm
      0.30 ± 16%      +0.5        0.77 ±  5%  perf-profile.self.cycles-pp.dequeue_task_fair
      0.32 ± 17%      +0.5        0.83 ±  9%  perf-profile.self.cycles-pp.update_rq_clock
      0.43 ± 20%      +0.5        0.94 ±  3%  perf-profile.self.cycles-pp.enqueue_task_fair
      0.17 ± 34%      +0.6        0.72 ± 22%  perf-profile.self.cycles-pp.release_pages
      0.44 ± 23%      +0.6        1.00 ± 11%  perf-profile.self.cycles-pp.zap_pte_range
      0.18 ± 21%      +0.6        0.80 ± 14%  perf-profile.self.cycles-pp._find_next_bit
      0.04 ± 76%      +0.7        0.75 ± 23%  perf-profile.self.cycles-pp.osq_lock
      0.44 ± 19%      +0.7        1.15 ±  6%  perf-profile.self.cycles-pp.reweight_entity
      1.05 ± 15%      +0.8        1.80 ±  3%  perf-profile.self.cycles-pp.__schedule
      0.04 ± 75%      +0.8        0.81 ± 26%  perf-profile.self.cycles-pp.native_safe_halt
      1.65 ± 13%      +0.8        2.44 ±  4%  perf-profile.self.cycles-pp.pipe_write
      0.75 ± 12%      +0.8        1.56 ±  7%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      1.40 ± 15%      +0.9        2.34 ±  3%  perf-profile.self.cycles-pp.psi_group_change
      0.55 ± 18%      +1.1        1.64 ± 11%  perf-profile.self.cycles-pp._raw_spin_lock
      2.02 ± 16%      +1.1        3.16 ±  4%  perf-profile.self.cycles-pp.mutex_lock
      2.09 ± 17%      +1.4        3.50 ±  6%  perf-profile.self.cycles-pp.mutex_unlock
      0.83 ± 20%      +3.4        4.22 ± 15%  perf-profile.self.cycles-pp.available_idle_cpu
      1.11 ± 24%      +3.8        4.89 ± 13%  perf-profile.self.cycles-pp.select_idle_cpu





Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

