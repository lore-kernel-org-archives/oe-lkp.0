Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA2E1B424A
	for <oe-lkp@lists.linux.dev>; Thu, 24 Apr 2025 06:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745474800; cv=fail; b=tB853mAErTznXvovxu1NaDHxJNxLGOpdeEhVgKfbrVwfB71p0UMaplbCLLVhBnxWmL5aPmKkl3y+JT0XDXyKTTgq2e5dBjB5KH1iUlN0VeqDpyEvQCYiG4P9WwZnc8Hhs6HGO29jYDoyh/2ODpqvq7lZBNf8PezcaEPV8jXDGbQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745474800; c=relaxed/simple;
	bh=LG5OgvCEyln7lUXwxTaxNZWLQowfEtv4ciP17Vx9aEg=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=bwwBTR/7/9UIryeFgYQee6zPSLS4rnTG/nKx1kWcSyPlGVHqyVZFVEuhFpUJ1Sj+uBLSrqB0ShnkFjqI+tV2O9dAnAG7d71K/QnwoFKM3fHI3u5U+0OQACSHj8vpyj83RXMLz609Bfp5T5EFIFsZkdCL0NUjfDdfn8PBT2Xs3Ws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GCsV1fs7; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GCsV1fs7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745474798; x=1777010798;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LG5OgvCEyln7lUXwxTaxNZWLQowfEtv4ciP17Vx9aEg=;
  b=GCsV1fs72cBfCIUwspum6LT+OfkhuNYhjvnoY4/1ksOabE/nxzNO0viQ
   jCOnXwAofUw0ERSlHDZlh0qLRmqkbcJg/W8ib/l2LtVGzli7rP3M3sfKS
   n6we152tJDLQBzDIY3Ceog/DAujZ+jpEOSm86ETJSP+KblZytUxYNiWk4
   j6WFslwcwpWqe8HktIhZ4BpMcpM4MMXGs2Nq3LFWZ7KAERpf1VFomyDzg
   mjvu9LcneLggerI44+omPCWkUhamXQbYUBi7MpADv1hRdNKHEtFvm/e2T
   i+JfHhu1kG23N3TTO3facFO4mu0+LmNxMYfWuC4IrbCJsEmSqFgIGEZaS
   A==;
X-CSE-ConnectionGUID: 0ihN6nsZSW2rm4+8LEz91A==
X-CSE-MsgGUID: /S+Ls6DTRGScuXtY6/mq4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="72467472"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; 
   d="scan'208";a="72467472"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 23:06:36 -0700
X-CSE-ConnectionGUID: ALcR7nIFTK+Ilr1hRKAnYQ==
X-CSE-MsgGUID: yD0WMlz/Tkaoa4rbxIZ00A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; 
   d="scan'208";a="163556231"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 23:06:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 23 Apr 2025 23:06:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 23 Apr 2025 23:06:30 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 23 Apr 2025 23:06:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nvnZIAsYAoX7hjmiFA66qsnQNaWmQM/c59i5Li8R+B8kkj8vXuOO33HG3etB21mTN/n6vyLyQhoYDxczWQIUO9n+O4Pnfanqcip3bXdseujIitJeAMnoPp2bflk/iF/E6zgiDPAnJpfRXX47R0jviEYhksYtfea9YVMbwUrZz55GTvoaQJe+lM5FywJvCxamNF6mylyy9CGZi3EvRFa6IbTGJvjop41VaF3Ntq5Q6Npdjr2kcSF5SxZaQWCGaUv2IwjSIroED7H6mkPHf8VXedHdRy8bdfaNBOVyAEA5NMHbpes0NiXYChm/SiU1NJ48J+KsbzdTAuiJu7hSpJp/VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dvq0+nSbO2MYoqlnJ36yMYj3mfZldrgTeVcp+T4pLoo=;
 b=gN+IZOCOrgV4Q50L2r2wjtg0i/rGREjydKDWu1WGKQw3HePRdhZ9pORTJDXYgjUoHHvIimhx4zmnV4BIeKbzAwgUJafJuJ00z/l+J1cLdndJX2TG2vJw/G3+qSNSt6DKayawmtiMUdYmhjaHyM+gSdn7DOJsj3cOvnjDZEXoLnaAQeU3Z5Nft813xNipE90haZVLqZ7fJSZek2MM22yH65YqrOpIu6vYDxb/haZIMOO3qJjLpyJ1uafPlGr9u4UZNUm0Zhj7C1r1rpWAIEroTQX7vraIZGzILk/0fFzVKTmmWSkEwNmayc/ceouw/yFQYa7TaJNVmuq6ebQIReu2NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CYXPR11MB8712.namprd11.prod.outlook.com (2603:10b6:930:df::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 06:05:45 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8678.025; Thu, 24 Apr 2025
 06:05:45 +0000
Date: Thu, 24 Apr 2025 14:05:37 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [peterz-queue:sched/hrtick] [entry,hrtimer,x86] 4a683282cd:
 INFO:rcu_sched_detected_stalls_on_CPUs/tasks
Message-ID: <202504241308.26441226-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR02CA0087.apcprd02.prod.outlook.com
 (2603:1096:4:90::27) To SJ2PR11MB8587.namprd11.prod.outlook.com
 (2603:10b6:a03:568::21)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CYXPR11MB8712:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a6b5dbd-a138-42c0-7a39-08dd82f60cb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4rNjX9jIn/jcGm3We2XfABOvsP7NliaKHTwY6EiOx5k/mKF2UHxYzu0c9fOr?=
 =?us-ascii?Q?+HaDTb2i8rBfb7ZM3WyUsR1WnBcr8hkbYEw7ck0NjO2sAGs9h25EpVQp5zu5?=
 =?us-ascii?Q?Rv8KjpwGQWGONRDEoXOEMUkk3WZ7eyHskpt0fm8jBntukDl2ClH9tHy6t35B?=
 =?us-ascii?Q?S+Sd9lE7Lov8xw/BKo6vmRQlQQh4ImEwMsF0qJu9SEeyWeAhmKjNiusGWxr3?=
 =?us-ascii?Q?P75ZZjAznsgGPAnmsvbYZYxm3kIgASA9SoZ8i/iY5SjVlEo5yu9DDBIBELzc?=
 =?us-ascii?Q?h0c29LJzZbjOx7/rwE7dQqhFJshBKoyYNIU1D6IL3H0xHPXs8OHqViKjzjWE?=
 =?us-ascii?Q?rxibw8L9UdWnHQsvwqItpJDfmb01nGwyYaQtjcExFL9Bpkbe4HMheE1WEC8F?=
 =?us-ascii?Q?A/fFEHjIatHutqFNtqyjvh4YjXpJjNd17UAsVZC/rPxsOX3kwq/FaQ+3TIta?=
 =?us-ascii?Q?EfEuhoyTlrCJvtymTXhk/heAJPxp/Gwm0L1xJ5MQfSOYfpp9sBqo/7LD0YMO?=
 =?us-ascii?Q?zbb7WAYh4BGl5cJi9KxX+NYK0LBRqNFuglYNUl5pefNxmdk0Fw6Ptby8p3hO?=
 =?us-ascii?Q?9Mp7i9Ug3jRA/wZ8KIpzX0w3j+FxmUMl7jFPa8fA0VTSUGPOfmM8Q5n4Mut5?=
 =?us-ascii?Q?QpullclXGdhg7VxbtKog/A3j5yoex0n9SHW6Eizsdth4xUbC1IHSfVSxflLD?=
 =?us-ascii?Q?ahJd5OObWqeOiOvG6tPB0sNY+uk4SvMMLImM2skDMzSjdWOXH+P/orU8Kvuy?=
 =?us-ascii?Q?849PsYcvQx6kNNVuF/rN9CQImFNwUEqr78H9zZODug3eP6V0Fz/DUuicfMjT?=
 =?us-ascii?Q?sCbbsnFKu9GWxs4vYJ8f32xcQK2McnLQzmSlFx1ZZ0K4/cAQC1q4vOIEdfKG?=
 =?us-ascii?Q?nznN+7F+GeWCMskJE38z8c83sylBwE62yvKd9uuEpiSig8Gr9zFJSve4pBjQ?=
 =?us-ascii?Q?aSdjruuM9GFcgf++UU3IH3GRl22d30TDSI1ax/DeJZbUg6RupJBWjCoXGYCC?=
 =?us-ascii?Q?JMY/WKitx3RlfkzBYJCtDz1xhvqbbmhN5RdPiyDtxflxmhEqcZqARCDZ4qf4?=
 =?us-ascii?Q?F4H+uWqxPiIlnrGcYm6P5T8VaOcz2uRqDTh4q5Bos6rd7ic73MRmdZtlaBkS?=
 =?us-ascii?Q?zRmJmrL3+zWPYQakPoeWI10mwkZ7p7tPE7ugPwOjSG0QMdS2nT4093kfzmJ3?=
 =?us-ascii?Q?GbMXLs0FwggmU1/CrgFm07l0ZlyChLTMcWorRHmQ1IzeUn2Yu94Xo0kf7v5K?=
 =?us-ascii?Q?8StNf5YmMB7WmVpLnSyN2LrJ9qoI7hnuwJ1vlSYiPmKSQcG9QpRykKc6cQsm?=
 =?us-ascii?Q?FdOgVMp2JakGghI0tCT8sw4U0lrkbOnggLrqrnr+TpWkf6UmFgUEGX3Kg8YR?=
 =?us-ascii?Q?CT8KE/u3gD9e77iw7TZ5V2smcgok?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rwEwBPKJVk28/3ZwOBFiLb1AWs+sNEBE02rIOC1rCm9hyVszmd1ChH9++6I8?=
 =?us-ascii?Q?IVDXJNU1RYTNJmlvmoxYCW8k84Fv8+s0SO3W92OPIGTv6hc8bfTnjkAg4KhZ?=
 =?us-ascii?Q?sulouIwGDknCd6ViGsMZ1pPcGGGtutTnPLGON/BU76rYRMpwqljoUmIcIkZp?=
 =?us-ascii?Q?2TX5Us9qcWjM50LT4PAIUeI1Y1cQ9ao3ZhxvmTPcsSDCOYUpVwDcc8GzsXQ5?=
 =?us-ascii?Q?zup6Gm5gW2cEMtd9Lu15GmCB3YaRpDDVHdqoaqiSBFE3Bn/ZKmcZiOGhnanH?=
 =?us-ascii?Q?YpolRDESKH2bERSEpur+v6rh6EUsvZtmody1ps5tOh5BbJ7D+ZQJosn34O6h?=
 =?us-ascii?Q?2gBY84DFo6VhHpbtri2Uph4oE/gMMF8iY8RkJFWCIv9JsvOxYpbwNIltHNNn?=
 =?us-ascii?Q?eI/zR70fVbGDUQQBtK6VDRfZmkvsmoZ2PpNZIIz4UcPk2iirpG7YNe3ypfc0?=
 =?us-ascii?Q?zp269NW2t3khRBpROdFmHryNYDXgNHtyGi3MHjQ8Ne7nWKB7ja3vu2pB1DQG?=
 =?us-ascii?Q?7VpCftBNcfRdlZKMb0aJeQ8xmpNRqwrLPhjxgGcyIfQDUD11mP9zZrIsBO3E?=
 =?us-ascii?Q?x/m4q1IvZOSbFdxMV9ENFJp6el6K0GoMgWcYxk4AkktlAw0DdbZKcB2LfMam?=
 =?us-ascii?Q?bjiaZ2GXWejDae0RzQvktS6zCjcITd3sGDEsVKCmhwiwGQ/Lndqh1cd/Vj4a?=
 =?us-ascii?Q?E8sElpdXNp4BXqVMbW+u+7fGIUpYuNPLUaUGh2LGamt4yc3k5Hsw+6SAtSVZ?=
 =?us-ascii?Q?Aq49OF37+la3f+Bx5BdvqhWnt2De0vf1eRBGb7U42l9nKBP34Qw7SXzJlQ0k?=
 =?us-ascii?Q?k1CCvZqgL9u1ogl+1Y+G/qz9eE+GG72H3Y/wI8Y0DJ9oS5iQM7tFxA3xtlsM?=
 =?us-ascii?Q?ZoY1BCaG40LtC9KV1Q3WJ6Oge+Vm77/WZOCbwbu6KBPbbFgYkzHbkrjD6nGY?=
 =?us-ascii?Q?MO542hOOjbA86wMDEpphi9VsSdJnwWekWGZKXsdfGCvVUNeoeYY4obRNpfoP?=
 =?us-ascii?Q?NKZ1HDD5F9EPXlJQyAaQjoD7qaAjrSQBKoCcYfCLI6l+QqtdEfTEIxNnw8eL?=
 =?us-ascii?Q?qMtfmdUTZ26u4ddyC2c7NaRKnX3Qr00AyYc7IB4774eNLIbmG1qWSaPqhAb2?=
 =?us-ascii?Q?THitpuI0Rkp1xXda/c9+4XuVzC5juuQ+XvLoAjAu5iuJ1FpbK/SccvDED7NR?=
 =?us-ascii?Q?kCPrwwIUbfjsgrnI/Q9No0DwrJiL+lHRcFQvk890E27FMlY1Wkp/pyPcDJrW?=
 =?us-ascii?Q?ElvorcfAGa7uqZUABelExc/0Xv7f5WS3z2dizqbH4q3nygQ6O6lA5tpidf1Z?=
 =?us-ascii?Q?aFw/VhSCCoQ4LaQt0GpmYMNnz/tdPk8IBKbTOWtDLnZkeF25A8HD27wLsdDo?=
 =?us-ascii?Q?i3q2MC81MK7TPTP6H/J5ACJ6L8Z2j+kg9wY+OizqowdTL3c5UE8Oj3y3HLcg?=
 =?us-ascii?Q?999bgUBEjAFEWLMcajrxkLMfXHealzUyYnHU6BHE55j8KWHHZhPAHdS6Va7z?=
 =?us-ascii?Q?VjHCpMg3KOiNRwFPH3R+wWpbmHBmW++D9DKE3HiFKZpm0S7D0k8hBDPcJalZ?=
 =?us-ascii?Q?S18ZuB7+9MEkkY6NROFdjnsCOKUKO8S5GeoHAtdSps2lXVkg2pfkRFQ1HNOn?=
 =?us-ascii?Q?vQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a6b5dbd-a138-42c0-7a39-08dd82f60cb8
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8587.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 06:05:45.7162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CMXjfrKJcS1xMn693DOq8DxXp+3nB3T0IRjq5SVI8+Lszz1UQ65gleivqFo892rFoJSpk1s8OtI4LP8ZPIdnyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8712
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "INFO:rcu_sched_detected_stalls_on_CPUs/tasks" on:

commit: 4a683282cde4cb1f2e346544a0b1f84f36389df3 ("entry,hrtimer,x86: Push reprogramming timers into the interrupt return path")
https://git.kernel.org/cgit/linux/kernel/git/peterz/queue.git sched/hrtick

in testcase: vm-scalability
version: vm-scalability-x86_64-6f4ef16-0_20241103
with following parameters:

	runtime: 300s
	test: mremap-xread-rand-mt
	cpufreq_governor: performance



config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 96 threads 2 sockets Intel(R) Xeon(R) Platinum 8260L CPU @ 2.40GHz (Cascade Lake) with 128G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202504241308.26441226-lkp@intel.com


[  302.926021][   C83] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[  302.933066][   C83] rcu: 	13-...!: (98 ticks this GP) idle=6674/1/0x4000000000000002 softirq=20508/20512 fqs=117
[  302.943609][   C83] rcu: 	46-...!: (96 ticks this GP) idle=7c8c/1/0x4000000000000002 softirq=21010/21015 fqs=117
[  302.954075][   C83] rcu: 	90-...!: (96 ticks this GP) idle=7734/1/0x4000000000000002 softirq=21308/21313 fqs=117
[  302.964538][   C83] rcu: 	(detected by 83, t=100038 jiffies, g=22093, q=970 ncpus=96)
[  302.972646][   C83] Sending NMI from CPU 83 to CPUs 13:
[  312.996955][   C83] Sending NMI from CPU 83 to CPUs 46:
[  323.021594][   C83] Sending NMI from CPU 83 to CPUs 90:
[  333.046096][   C83] rcu: rcu_sched kthread timer wakeup didn't happen for 129584 jiffies! g22093 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402
[  333.075287][   C83] rcu: 	Possible timer handling issue on cpu=45 timer-softirq=795
[  333.083244][   C83] rcu: rcu_sched kthread starved for 129622 jiffies! g22093 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402 ->cpu=45
[  333.094756][   C83] rcu: 	Unless rcu_sched kthread gets sufficient CPU time, OOM is now expected behavior.
[  333.104710][   C83] rcu: RCU grace-period kthread stack dump:
[  333.110761][   C83] task:rcu_sched       state:I stack:0     pid:15    tgid:15    ppid:2      task_flags:0x208040 flags:0x00004000
[  333.123135][   C83] Call Trace:
[  333.126603][   C83]  <TASK>
[ 333.129713][ C83] __schedule (kernel/sched/core.c:5388 kernel/sched/core.c:6773) 
[ 333.134221][ C83] schedule (arch/x86/include/asm/bitops.h:206 arch/x86/include/asm/bitops.h:238 include/linux/thread_info.h:192 include/linux/thread_info.h:208 include/linux/sched.h:2176 kernel/sched/core.c:6853 kernel/sched/core.c:6866) 
[ 333.138380][ C83] schedule_timeout (include/linux/timer.h:185 kernel/time/sleep_timeout.c:100) 
[ 333.143309][ C83] ? __pfx_process_timeout (kernel/time/sleep_timeout.c:24) 
[ 333.148752][ C83] rcu_gp_fqs_loop (kernel/rcu/tree.c:2046 (discriminator 13)) 
[ 333.153666][ C83] ? __pfx_rcu_gp_kthread (kernel/rcu/tree.c:2223) 
[ 333.159014][ C83] rcu_gp_kthread (kernel/rcu/tree.c:2251) 
[ 333.163751][ C83] kthread (kernel/kthread.c:464) 
[ 333.167882][ C83] ? __pfx_kthread (kernel/kthread.c:413) 
[ 333.172620][ C83] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 333.177173][ C83] ? __pfx_kthread (kernel/kthread.c:413) 
[ 333.181889][ C83] ret_from_fork_asm (arch/x86/entry/entry_64.S:258) 
[  333.186784][   C83]  </TASK>
[  333.189935][   C83] rcu: Stack dump where RCU GP kthread last ran:
[  333.196379][   C83] Sending NMI from CPU 83 to CPUs 45:
j
input_data: 0x0000005f7ef4d2cc
input_len: 0x0000000000e59c10
output: 0x0000005f7c000000
output_len: 0x0000000003d48cac
kernel_total_size: 0x0000000003430000
needed_size: 0x0000000003e00000
trampoline_32bit: 0x0000000000000000


KASLR disabled: 'nokaslr' on cmdline.




The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250424/202504241308.26441226-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

