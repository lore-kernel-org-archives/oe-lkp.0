Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F303ED5CE
	for <oe-lkp@lists.linux.dev>; Tue, 24 Mar 2026 13:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774360386; cv=fail; b=QWfvPsp0R7INv6bG2O3+RYhqtiNZdmuotSaGKV5CeInnIHTnq9u0/sRz2dFae7dn9LbEB6IA6xz+vj5gBI1YFosdfIdC27hus6c2ZFhfwr29if1lVPLakPAY0/Ej7D9AWTcxDoYjr+NAM1YmskAeAmyujFWeK1inB5OmdJ3IHvQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774360386; c=relaxed/simple;
	bh=Dpd/okW8viypIsvE9qWRgemXZD9LcLp9Gc4IwYCwmHk=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=VI19Gk7xmyN2A6dsFOyPrhUUWEwuAMEGewY0CDdYjXGcrS5NmwZFZ2IlUOKiOEFckeQudlBBUFidvc7StfTzseA1kGZlzv04SEygx6HrswySmX13OPo9m9lIlDhxngnhsFNnhXzONRI/HJI3ziOTeqYOO4PRhsvwTGAXY1BmJ30=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HNb7Nebv; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HNb7Nebv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774360384; x=1805896384;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=Dpd/okW8viypIsvE9qWRgemXZD9LcLp9Gc4IwYCwmHk=;
  b=HNb7NebvRq1rZG93HFtJZ3wUGz36RLAnu0EVzeLFhSdGPjXzMWKb5rRA
   UqgmC0jWQKUOAQQo8HpRhU2CGULYId4ggHwff6G3eB/1OwPy3Idm2JoLl
   Uvv/MZEmzDC4fIlNBtOMEsHHFJPBNAlNWpj0fH1ipB6hqRuzOepfzHiKi
   eL9M+qwg990B/pI3h4ON8t+xdBNvn4KKQha0zh+GB35xJJpKO2H/vvSMm
   X6fEmwT4m0kzTwNHlOGbRzCzBz0dvxtGhFIoAnPeI0QdaqYuqTNzOZwFG
   nFuGVAIX735inIDzLK6djW/6w+cDlC7WQi0QSzNwsQu1LbUNxMaDEpZrP
   w==;
X-CSE-ConnectionGUID: mYlH5gCTRNOkMj3z4RQ+hA==
X-CSE-MsgGUID: FvlAq0NiRnOhIaTMPJLJUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75445432"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="75445432"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 06:53:03 -0700
X-CSE-ConnectionGUID: kPYUXpYuQ1+Kf6qWlrVN8Q==
X-CSE-MsgGUID: oQlCWUXaSzSPp9WQVWpjBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="229273318"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 06:53:03 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 06:53:02 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 24 Mar 2026 06:53:02 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.35) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 06:53:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FxyO48Fb4PlsACvqUDt7/KZneWgujD9ZzPJgLjXMq9EpgNNJMryskibNnkoXXM1mCQHjORDdCRPsgMesPkplCQkDfK6qyrsQoO3FdAxu/zffJMi/R5Y2J6/jZP+308vEH49sMYOWL2G6ILxlYmaS/tq85Yk2MwQgcPtG8xdaoyOei6qFCNYQ9vO5nOdeMTEGVZM2xsbkNu3QYdp3OfK1K9SyjbM0M/wL9He066qtnL2TGbwYdeTjujMfaPskNY3EOzoG/niq7CqkcvWwDZX9CDOUseuJbGKJqdiqYy5wzwbaCYX/xXaRGe+iOiB+YLkTYM1b0HKS0lmL4+mVS/s4Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hFYV3M7XwUkM/+3xzogMt0QZa9J8XZ+jXjOnBxBGfuk=;
 b=EHtHx8bPusDeSNYJf24tEXC0liXi0uggOMyLQesklqul46jI9s9AjEbCYb7K3ahr6A5VGGWusCkPAiyHXtFz1rSC49izwiCQnmRTes4u4Vi4UkkDfvqVFtQSkStrBG+kRFq+TJDmXC3GvRYESzla+q1swf+8pOcnxZ4KsI+V9OMZ/JeidVEUD1aVwBA4L3lFh2PqZHV11WHQ3xpsKa8Z2sQVzAiSI4PuMttqJ+a+6eiFrJO6ZEoWEXtZzqTSCYh2RiMHYxxGpb0wO3UdoJeioXPhXccL5mVIpig7fYWku5FMtDQxpMQf6UxgNnnyljScK9XXjwgbHwaIDdEZ0BOfcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by IA3PR11MB9016.namprd11.prod.outlook.com (2603:10b6:208:582::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Tue, 24 Mar
 2026 13:52:54 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%3]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 13:52:53 +0000
Date: Tue, 24 Mar 2026 21:52:45 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	<oliver.sang@intel.com>
Subject: [tip:sched/hrtick] [x86/apic]  92d0e753d5:
 stress-ng.timermix.ops_per_sec 2.2% improvement
Message-ID: <202603242136.51c7f0d3-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: SG2PR04CA0168.apcprd04.prod.outlook.com (2603:1096:4::30)
 To PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|IA3PR11MB9016:EE_
X-MS-Office365-Filtering-Correlation-Id: 09143a3e-4dbd-45e0-5865-08de89aca56c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: JBiKX8aD02mTSR2kpF2EQQucJ69z/OR+MywsyA70w3UohhFJw+2XGhOpFkPl/YFkBXovouHgVrzj7kGr1b4ple8G10QaBdZX7oGI/7lMxfu//Fa5AanIANUUAe4tF+R4Ad5MlCmiUZJkknK5mmpHsjvnX3eIeBoHtcv4FBA0vuVaO9GwtsQTr9fWxCDnWi7r6cAUG4Qr8OnfzlYC2vbEibQzxsMNbY1juVKml9J4aMJq0gCzWbxhdQXWrEPR5GbWuKeFYArkSkiMO7HkDcJqYHhBAlRE3tvGptqjNPj7rFGG0byO8+5hIH6h3Y4lK/YqiiALWz0qQiPPBRa6gvqcUSM99CDBLTuZ3UEasr/KUyig+nG0CIJe1Du/X4eY1EUflfW0xptBj8sWrIJxF0AYFhAyxkEIXcT9/Oh8KOY3taF3WtDR0snvxgPgC312YIgyBjHnrqFazvRMBk3ySyUgh7fa4EaizuabMzXHePDqTxuqUM1rwUdoeP+XqAxi8reKajj5/RiFPv3z/BcYYLr13QK0AFEa/l1IsFzlTPyKOV9Jru1dh1VdjzpZdn/TlgeSwED7MBH5z/b3rQKZyYsedxYQxm+5WRYgdAWOeAP9rsEDWUC9qTRoBwmQBGK5DQOT2aAlo0PqGXQqH1BAG/UJ9dOk5GTmg7aFGz9COWO/p109fyFeeoLfonVqd7+lE9qq
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?UlHvilWNEGgjb5ShPP6wjnF3U5653q4+pcqSRWSp4Vi6VtU/ZaaDCJBJvx?=
 =?iso-8859-1?Q?aIn800O0/431BH+UurK8dHf3qgQaxNLHgEgUnWdnOHy5gMY5W8muKih9/d?=
 =?iso-8859-1?Q?6rsbfOY8/j3rMUBfZDcuYAmouLAu9djphmJ31p50d29vuWFXoXyYBixwxA?=
 =?iso-8859-1?Q?gLdoGZshjg8kqvklEy2g6sgqnI/YkTGeiYQZmAZE+3O6f5o9d5NjnNTdid?=
 =?iso-8859-1?Q?yyIw8yGDVeG1zQ9I3+XBNgLetvMfe+Pw7xGVxovPMOEmTFDI9JsYLB48ym?=
 =?iso-8859-1?Q?EO/o0BWqhAumr1fdhPNDT7/ps0s5TlnVPWCC0onMXQbHDnwnb/04uEIs8K?=
 =?iso-8859-1?Q?Ot59LiCcplKCGYIO2zKCF/z4SWy2IaXO4PcKnlKECe/p95kKchGg4W/uKe?=
 =?iso-8859-1?Q?Qdm5JmnpORJHRFMuSqj6rt5V4OUehQXGuUYvBY3cKyter4ZTQiUvTltq6k?=
 =?iso-8859-1?Q?5nlscito+/gBmwGlkzg4Ra/5JxhqF2g3PGgAjDaGLDRMQ1oAZJe2J5QyBy?=
 =?iso-8859-1?Q?hdjucSBT4r+mrWz9V7oOR5FsV1GioGiUHqZwjCWmEovve0z1Z4XfhGZxph?=
 =?iso-8859-1?Q?BSTSwf3zOk2v2NF1t4+ET/15Hvf+czdDHYTBG0kkO+1xGfkAx+gif3nyUF?=
 =?iso-8859-1?Q?UGa1L4NwP3Uh9uq9Jbp9LI0AmLhyjzNWJlWKsYnXX0s9Z4Rp+WjbHpOnAB?=
 =?iso-8859-1?Q?xHFjA0160YPY1yYh6k7iEhCpMWnfeaGmCX6m7WA/zzOhCcHENOJxRGh689?=
 =?iso-8859-1?Q?trhj3NBHFyyZtW82EBxKKOTIKeJhqhqHbsBpIzarVDAtvZpbyvmgW1yHl+?=
 =?iso-8859-1?Q?sk8yhn5URVXs9Ib8JnyfAhGa0hF1dph7QZILRZ2fMnCrBEPDT0KpXkNEXQ?=
 =?iso-8859-1?Q?TwpShybazXyBK7SmPwbk/UD3ofaqW//aO86fb+uWA2L9ZkMOy3Lw6lqejv?=
 =?iso-8859-1?Q?rLpRg3U1CnPI/lFYFE7Qw669qH2ZKPNDd6Jq633gQHWJ9BDNN7yFdGS5FS?=
 =?iso-8859-1?Q?ro1CPOA34qqvCi2/jCOlacPeulSVxmrbF4eGQypBeQ/+iPAiR4h2ViEK39?=
 =?iso-8859-1?Q?b2RCzfBeSMal5C28i4y05AgQmm+RRHRfv8dQe3PMqUwlJn9l78gZU6QJqV?=
 =?iso-8859-1?Q?xtCf8QaaVLVok7mO9Jv3FaOQTumWoFVvKs4R1BwlJ64fZAioRBI7a6IP/i?=
 =?iso-8859-1?Q?n0fGWovHZkMQzmdtVOW3SFbSVAsZXCsYjP6Ei2+yoeNVuLbATKlJqGsdEL?=
 =?iso-8859-1?Q?zgiPd/BuvPsbzUlDCqzNM8T+WBAL4KlKLMJ5SIKVDq2B7+DH2jGOvm9wuk?=
 =?iso-8859-1?Q?gtA08sZbStMKredX0AnKdUfroocp2a5BQi5jQCOfuZFUiE5w3IJ2zmXvw9?=
 =?iso-8859-1?Q?fSsJJxUwwEnsk6b+5CR0U8I0Qz8awAhiuSOLIXeuZEz69U9E4Ca5YR6se/?=
 =?iso-8859-1?Q?RXzQvfjUsNojJnALDejm/IjxLfoLmUDQcMD1GX84iG4z2A6leQ08nnzu8t?=
 =?iso-8859-1?Q?xwQExE1OsPR9yYt6fMS8lzBGtY6M6i3xYSptL5E7f/TTZ/pEdV7YPMgQc5?=
 =?iso-8859-1?Q?3gYM0Tl18USsvKWPu6iMx2lgJZ9375KOoXINTZnX6f3e0BBLNo9vQishHy?=
 =?iso-8859-1?Q?iU1RIr6cGsOjjoFk+xVgzltMAXDymNA3T1hbEFQlXokVFwtu3WOw3sW9l2?=
 =?iso-8859-1?Q?lDZXKvxzMMSY4NZAgC63/kPAG1q31RqHw2nwYIwo9oJgcoQr1ZBFoJLTj+?=
 =?iso-8859-1?Q?8i33GPjRQZVirT7JJK3T5W8cVUxjQKDM78fZ5fFe9ZboN/Qf8WM5Z58QPL?=
 =?iso-8859-1?Q?L0yMnSmDEg=3D=3D?=
X-Exchange-RoutingPolicyChecked: LCY9Wp+x07ip9IqBf/nSdlQr9bcnrJYN+RGgLTNr+MF4gtCChTKQrYGX5nGaupXYGtmErOAo7XFnuLUfnTPoxY9hSLaswSpJjzlj3nW687Refm1yX+XyquAVdAAyZe2UeVCOujKfb7gAraFalBrMu6+hm0i8CHQ7PjTcLxR6elZoopSYrTr9LX8xbLxocAB68FpSYkeypUjRijeQN5CYaXBF9w0sieU00lM60PmzjylPrtZSFiMTqsbIo58DrQEbeuuZ56noBOiT8tgYa2HyTgIkmLqO25G6FxU7yzEhcnpQvFcQvliYD2hGQ9VYUZVsXAN/0iOQlpOh9KhRs1sEAA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 09143a3e-4dbd-45e0-5865-08de89aca56c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 13:52:53.9177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6UdCLxXfnIXI2HLPVbeqZPSNEoO6cqZeW5fyfJ7oJWoAQIqtqwlavABuYlUY43EcFt7OXQnExgCBGMHQ9i91+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9016
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 2.2% improvement of stress-ng.timermix.ops_per_sec on:


commit: 92d0e753d57ec581a424d9903afff5e17bd1e6e4 ("x86/apic: Remove pointless fence in lapic_next_deadline()")
https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git sched/hrtick


testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 192 threads 2 sockets Intel(R) Xeon(R) 6740E  CPU @ 2.4GHz (Sierra Forest) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: timermix
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+---------------------------------------------------------+
| testcase: change | stress-ng: stress-ng.timer.ops_per_sec 2.7% improvement |
| test parameters  | cpufreq_governor=performance                            |
|                  | nr_threads=100%                                         |
|                  | test=timer                                              |
|                  | testtime=60s                                            |
+------------------+---------------------------------------------------------+




Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260324/202603242136.51c7f0d3-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-srf-2sp3/timermix/stress-ng/60s

commit: 
  b27801189f ("x86: Inline TSC reads in timekeeping")
  92d0e753d5 ("x86/apic: Remove pointless fence in lapic_next_deadline()")

b27801189f7fc97a 92d0e753d57ec581a424d9903af 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     16781            +1.1%      16960        stress-ng.time.percent_of_cpu_this_job_got
      4902 ±  2%      -8.1%       4505        stress-ng.time.system_time
      5186 ±  2%      +9.7%       5688        stress-ng.time.user_time
    113491            +2.2%     115938        stress-ng.timermix.CLOCK_BOOTTIME_ticks_per_sec
    113612            +2.2%     116066        stress-ng.timermix.CLOCK_MONOTONIC_ticks_per_sec
    113702            +2.2%     116160        stress-ng.timermix.CLOCK_REALTIME_ticks_per_sec
    113456            +2.1%     115893        stress-ng.timermix.CLOCK_TAI_ticks_per_sec
 5.245e+09            +2.2%  5.358e+09        stress-ng.timermix.ops
  87449094            +2.2%   89334190        stress-ng.timermix.ops_per_sec
   8989707            -6.2%    8429569        turbostat.NMI
  81482294            +2.6%   83616517        vmstat.system.in
     11.59            -0.9       10.71        mpstat.cpu.all.irq%
     41.12 ±  2%      -3.2       37.90        mpstat.cpu.all.sys%
     43.83 ±  2%      +4.3       48.17        mpstat.cpu.all.usr%
 6.431e+10            +2.2%  6.576e+10        perf-stat.i.branch-instructions
      1.78            -2.0%       1.74        perf-stat.i.cpi
 3.393e+11            +2.1%  3.466e+11        perf-stat.i.instructions
      0.56            +2.0%       0.57        perf-stat.i.ipc
      1.78            -2.1%       1.74        perf-stat.overall.cpi
      0.56            +2.1%       0.58        perf-stat.overall.ipc
 6.239e+10            +1.8%  6.351e+10        perf-stat.ps.branch-instructions
 3.292e+11            +1.7%  3.347e+11        perf-stat.ps.instructions
 1.975e+13            +2.3%  2.022e+13        perf-stat.total.instructions
      2.06 ± 20%      -1.0        1.06 ± 19%  perf-profile.calltrace.cycles-pp.lapic_next_deadline.clockevents_program_event.hrtimer_start_range_ns.posixtimer_deliver_signal.dequeue_signal
      2.68 ±  2%      -0.9        1.79        perf-profile.calltrace.cycles-pp.lapic_next_deadline.clockevents_program_event.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      3.71 ±  2%      -0.8        2.94        perf-profile.calltrace.cycles-pp.clockevents_program_event.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      3.14 ± 10%      -0.7        2.46 ±  3%  perf-profile.calltrace.cycles-pp.clockevents_program_event.hrtimer_start_range_ns.posixtimer_deliver_signal.dequeue_signal.get_signal
      2.56 ± 12%      -0.6        1.94 ±  9%  perf-profile.calltrace.cycles-pp.__x64_sys_rt_sigpending.do_syscall_64.entry_SYSCALL_64_after_hwframe.sigpending
      7.74 ±  2%      -0.4        7.38        perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.sigpending
      0.62 ±  3%      +0.1        0.68        perf-profile.calltrace.cycles-pp.sched_clock_cpu.irqtime_account_irq.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.sigpending
      0.58 ±  2%      +0.1        0.64        perf-profile.calltrace.cycles-pp.irqtime_account_irq.__irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.sigpending
      0.67 ±  3%      +0.1        0.74        perf-profile.calltrace.cycles-pp.irqtime_account_irq.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.sigpending
      0.82 ±  2%      +0.1        0.89        perf-profile.calltrace.cycles-pp.ktime_get_update_offsets_now.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      0.72 ±  2%      +0.1        0.80        perf-profile.calltrace.cycles-pp.error_entry.sigpending
      0.83 ±  3%      +0.1        0.91 ±  2%  perf-profile.calltrace.cycles-pp.sync_regs.asm_sysvec_apic_timer_interrupt.sigpending
      0.75 ±  2%      +0.1        0.84 ±  2%  perf-profile.calltrace.cycles-pp.ktime_get.clockevents_program_event.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      0.89 ±  2%      +0.1        1.00        perf-profile.calltrace.cycles-pp.__irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.sigpending
      0.98 ±  2%      +0.1        1.09 ±  2%  perf-profile.calltrace.cycles-pp.posixtimer_send_sigqueue.posix_timer_fn.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt
      1.40 ±  2%      +0.1        1.54 ±  2%  perf-profile.calltrace.cycles-pp.posix_timer_fn.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      1.74 ±  3%      +0.2        1.89        perf-profile.calltrace.cycles-pp.native_apic_msr_eoi.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.sigpending
      0.34 ± 70%      +0.2        0.57 ±  2%  perf-profile.calltrace.cycles-pp.sched_clock_cpu.irqtime_account_irq.__irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      2.42 ±  2%      +0.2        2.66 ±  2%  perf-profile.calltrace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      0.26 ±100%      +0.3        0.54        perf-profile.calltrace.cycles-pp.sched_clock.sched_clock_cpu.irqtime_account_irq.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
     10.55 ±  8%      +1.5       12.04 ±  4%  perf-profile.calltrace.cycles-pp.fpu__restore_sig.restore_sigcontext.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      6.10            -2.2        3.90        perf-profile.children.cycles-pp.lapic_next_deadline
      7.71 ±  4%      -1.8        5.89        perf-profile.children.cycles-pp.clockevents_program_event
      8.53 ±  2%      -0.8        7.69        perf-profile.children.cycles-pp.hrtimer_interrupt
     10.93 ±  2%      -0.8       10.14        perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      2.77 ± 13%      -0.8        1.99 ± 10%  perf-profile.children.cycles-pp.__x64_sys_rt_sigpending
      4.98 ±  9%      -0.7        4.26        perf-profile.children.cycles-pp.hrtimer_start_range_ns
     12.98 ±  2%      -0.7       12.26        perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.07            -0.0        0.06        perf-profile.children.cycles-pp.sched_clock_noinstr
      0.08 ±  6%      +0.0        0.09        perf-profile.children.cycles-pp.sched_core_idle_cpu
      0.07 ±  6%      +0.0        0.09        perf-profile.children.cycles-pp.x64_sys_call
      0.42            +0.0        0.44        perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.23 ±  3%      +0.0        0.25 ±  2%  perf-profile.children.cycles-pp.irqentry_exit
      0.05            +0.0        0.07 ±  5%  perf-profile.children.cycles-pp._raw_spin_unlock
      1.09 ±  2%      +0.0        1.12        perf-profile.children.cycles-pp.sched_clock
      0.69            +0.0        0.72        perf-profile.children.cycles-pp._raw_spin_lock
      0.93 ±  2%      +0.0        0.96        perf-profile.children.cycles-pp.native_sched_clock
      0.93            +0.0        0.97        perf-profile.children.cycles-pp.recalc_sigpending
      0.83 ±  2%      +0.0        0.88        perf-profile.children.cycles-pp.error_entry
      1.24 ±  2%      +0.0        1.29        perf-profile.children.cycles-pp.sched_clock_cpu
      0.98            +0.0        1.03        perf-profile.children.cycles-pp.__irq_exit_rcu
      1.08 ±  2%      +0.1        1.13        perf-profile.children.cycles-pp.posixtimer_send_sigqueue
      0.94 ±  2%      +0.1        0.99        perf-profile.children.cycles-pp.__irqentry_text_end
      1.64            +0.1        1.70        perf-profile.children.cycles-pp._raw_spin_lock_irq
      1.37 ±  2%      +0.1        1.42        perf-profile.children.cycles-pp.irqtime_account_irq
      1.46            +0.1        1.52        perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      1.52 ±  2%      +0.1        1.59        perf-profile.children.cycles-pp.posix_timer_fn
      0.83 ±  3%      +0.1        0.92        perf-profile.children.cycles-pp.sync_regs
      2.69 ±  2%      +0.1        2.80        perf-profile.children.cycles-pp.__hrtimer_run_queues
      2.22            +0.1        2.34        perf-profile.children.cycles-pp.ktime_get
      2.27            +0.1        2.40 ±  2%  perf-profile.children.cycles-pp.entry_SYSCALL_64
      9.40            +0.3        9.66 ±  2%  perf-profile.children.cycles-pp.__restore_fpregs_from_user
      9.53 ±  8%      +0.9       10.46 ±  2%  perf-profile.children.cycles-pp.restore_fpregs_from_user
     12.03 ±  8%      +1.1       13.13 ±  2%  perf-profile.children.cycles-pp.fpu__restore_sig
     13.87 ±  7%      +1.2       15.09 ±  2%  perf-profile.children.cycles-pp.restore_sigcontext
      6.09            -2.2        3.90        perf-profile.self.cycles-pp.lapic_next_deadline
      0.31 ± 19%      -0.2        0.16 ± 11%  perf-profile.self.cycles-pp.__x64_sys_rt_sigpending
      0.65 ±  4%      -0.1        0.54 ±  2%  perf-profile.self.cycles-pp.do_syscall_64
      0.26            -0.0        0.23 ±  2%  perf-profile.self.cycles-pp.__x64_sys_rt_sigreturn
      0.16 ±  2%      -0.0        0.15        perf-profile.self.cycles-pp.hrtimer_start_range_ns
      0.06            -0.0        0.05        perf-profile.self.cycles-pp.get_nohz_timer_target
      0.05            +0.0        0.06        perf-profile.self.cycles-pp.hrtimer_reprogram
      0.07            +0.0        0.08        perf-profile.self.cycles-pp.x64_sys_call
      0.27 ±  2%      +0.0        0.28        perf-profile.self.cycles-pp.hrtimer_interrupt
      0.08 ±  6%      +0.0        0.09        perf-profile.self.cycles-pp.sched_core_idle_cpu
      0.11 ±  4%      +0.0        0.13        perf-profile.self.cycles-pp.__hrtimer_start_range_ns
      0.12 ±  4%      +0.0        0.14 ±  3%  perf-profile.self.cycles-pp.irqtime_account_irq
      0.20 ±  3%      +0.0        0.22 ±  4%  perf-profile.self.cycles-pp._raw_spin_unlock_irq
      0.45 ±  2%      +0.0        0.48        perf-profile.self.cycles-pp.posixtimer_deliver_signal
      0.92            +0.0        0.95        perf-profile.self.cycles-pp.recalc_sigpending
      0.55 ±  2%      +0.0        0.58        perf-profile.self.cycles-pp.get_signal
      0.91 ±  2%      +0.0        0.96        perf-profile.self.cycles-pp.native_sched_clock
      1.64            +0.0        1.68        perf-profile.self.cycles-pp._raw_spin_lock_irq
      0.83 ±  2%      +0.0        0.88        perf-profile.self.cycles-pp.error_entry
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.sigismember
      1.59            +0.1        1.64        perf-profile.self.cycles-pp.entry_SYSCALL_64
      1.45            +0.1        1.51        perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.92 ±  2%      +0.1        0.98        perf-profile.self.cycles-pp.__irqentry_text_end
      0.82 ±  2%      +0.1        0.91        perf-profile.self.cycles-pp.sync_regs
      2.21            +0.1        2.33        perf-profile.self.cycles-pp.ktime_get
      1.10 ±  2%      +0.1        1.23 ±  2%  perf-profile.self.cycles-pp.stress_timermix_timer_action
      9.40            +0.3        9.66 ±  2%  perf-profile.self.cycles-pp.__restore_fpregs_from_user
      6.10 ±  3%      +0.5        6.58        perf-profile.self.cycles-pp.sigpending


***************************************************************************************************

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-srf-2sp3/timer/stress-ng/60s

commit: 
  b27801189f ("x86: Inline TSC reads in timekeeping")
  92d0e753d5 ("x86/apic: Remove pointless fence in lapic_next_deadline()")

b27801189f7fc97a 92d0e753d57ec581a424d9903af 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     16799            +1.1%      16987        stress-ng.time.percent_of_cpu_this_job_got
      9917            +1.7%      10087        stress-ng.time.system_time
    180.39 ± 10%     -31.6%     123.46 ±  7%  stress-ng.time.user_time
 5.305e+09            +2.7%  5.445e+09        stress-ng.timer.ops
  88451716            +2.7%   90801513        stress-ng.timer.ops_per_sec
   8993987            -6.3%    8425030        turbostat.NMI
  83170419            +2.4%   85130223        vmstat.system.in
     11.56            -1.0       10.54        mpstat.cpu.all.irq%
      1.84 ±  9%      -0.5        1.35 ±  5%  mpstat.cpu.all.usr%
 6.867e+10            +2.6%  7.044e+10        perf-stat.i.branch-instructions
 1.006e+08            +3.7%  1.044e+08        perf-stat.i.branch-misses
      1.67            -2.4%       1.63        perf-stat.i.cpi
 3.611e+11            +2.5%  3.701e+11        perf-stat.i.instructions
      0.60            +2.5%       0.61        perf-stat.i.ipc
      1.67            -2.5%       1.63        perf-stat.overall.cpi
      0.60            +2.5%       0.61        perf-stat.overall.ipc
 6.676e+10            +2.1%  6.817e+10        perf-stat.ps.branch-instructions
  97272637            +3.2%  1.004e+08        perf-stat.ps.branch-misses
  3.51e+11            +2.0%  3.581e+11        perf-stat.ps.instructions
     18.58 ±  4%      -5.6       13.03        perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.do_syscall_64.entry_SYSCALL_64_after_hwframe.timer_getoverrun
     10.18 ±  4%      -3.3        6.86        perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.do_syscall_64.entry_SYSCALL_64_after_hwframe.timer_getoverrun
      8.59 ±  4%      -2.9        5.71        perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.do_syscall_64.entry_SYSCALL_64_after_hwframe
      6.76 ±  3%      -2.4        4.32 ±  2%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.do_syscall_64
      2.98            -1.2        1.83        perf-profile.calltrace.cycles-pp.lapic_next_deadline.clockevents_program_event.hrtimer_start_range_ns.posixtimer_deliver_signal.dequeue_signal
      4.13            -1.1        3.04        perf-profile.calltrace.cycles-pp.clockevents_program_event.hrtimer_start_range_ns.posixtimer_deliver_signal.dequeue_signal.get_signal
      5.35            -1.1        4.30        perf-profile.calltrace.cycles-pp.hrtimer_start_range_ns.posixtimer_deliver_signal.dequeue_signal.get_signal.arch_do_signal_or_restart
      7.97 ±  2%      -1.0        7.01        perf-profile.calltrace.cycles-pp.posixtimer_deliver_signal.dequeue_signal.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop
      8.55 ±  2%      -0.9        7.66        perf-profile.calltrace.cycles-pp.dequeue_signal.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64
      9.57 ±  2%      -0.9        8.70        perf-profile.calltrace.cycles-pp.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.38 ±  3%      -0.8        1.55        perf-profile.calltrace.cycles-pp.lapic_next_deadline.clockevents_program_event.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      3.28 ±  3%      -0.7        2.55        perf-profile.calltrace.cycles-pp.clockevents_program_event.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      1.48 ±  5%      -0.4        1.12        perf-profile.calltrace.cycles-pp.native_apic_msr_eoi.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.do_syscall_64
      0.98 ±  4%      -0.3        0.72        perf-profile.calltrace.cycles-pp.posixtimer_send_sigqueue.posix_timer_fn.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt
      0.74 ±  2%      -0.2        0.54 ±  2%  perf-profile.calltrace.cycles-pp.__irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.74 ±  4%      -0.2        0.57 ±  2%  perf-profile.calltrace.cycles-pp.ktime_get_update_offsets_now.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      0.75 ±  3%      -0.0        0.70        perf-profile.calltrace.cycles-pp.__put_user_nocheck_4.copy_fpstate_to_sigframe.get_sigframe.x64_setup_rt_frame.arch_do_signal_or_restart
      0.79 ±  3%      -0.0        0.74        perf-profile.calltrace.cycles-pp.__put_user_nocheck_8.copy_fpstate_to_sigframe.get_sigframe.x64_setup_rt_frame.arch_do_signal_or_restart
      0.84            +0.0        0.89        perf-profile.calltrace.cycles-pp.ktime_get.clockevents_program_event.hrtimer_start_range_ns.posixtimer_deliver_signal.dequeue_signal
      0.93 ±  2%      +0.0        0.98        perf-profile.calltrace.cycles-pp._copy_to_user.__x64_sys_rt_sigpending.do_syscall_64.entry_SYSCALL_64_after_hwframe.sigpending
      0.76 ±  2%      +0.1        0.81 ±  2%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.timer_getoverrun
      1.09 ±  2%      +0.1        1.14        perf-profile.calltrace.cycles-pp._copy_from_user.restore_altstack.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.88 ±  2%      +0.1        0.93        perf-profile.calltrace.cycles-pp.ktime_get.common_hrtimer_rearm.posixtimer_deliver_signal.dequeue_signal.get_signal
      0.61 ±  3%      +0.1        0.68        perf-profile.calltrace.cycles-pp.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe.timer_getoverrun
      1.39 ±  2%      +0.1        1.47        perf-profile.calltrace.cycles-pp.restore_altstack.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.63 ±  2%      +0.1        1.72        perf-profile.calltrace.cycles-pp.__x64_sys_rt_sigpending.do_syscall_64.entry_SYSCALL_64_after_hwframe.sigpending
      0.93 ±  3%      +0.1        1.02 ±  2%  perf-profile.calltrace.cycles-pp.__get_user_nocheck_4.check_xstate_in_sigframe.__fpu_restore_sig.fpu__restore_sig.restore_sigcontext
      1.32 ±  2%      +0.1        1.43        perf-profile.calltrace.cycles-pp.common_hrtimer_rearm.posixtimer_deliver_signal.dequeue_signal.get_signal.arch_do_signal_or_restart
      1.60 ±  2%      +0.1        1.70        perf-profile.calltrace.cycles-pp._copy_from_user.restore_sigcontext.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.26 ±  2%      +0.1        2.38        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.sigpending
      2.28 ±  3%      +0.1        2.40 ±  2%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.stress_timer_handler
      2.45 ±  2%      +0.1        2.58        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.sigpending
      0.62 ±  5%      +0.2        0.77        perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.hash_bucket
      2.07 ±  3%      +0.2        2.26        perf-profile.calltrace.cycles-pp.__get_user_nocheck_8.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.00 ±  4%      +0.2        2.20        perf-profile.calltrace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      2.17 ±  3%      +0.2        2.38        perf-profile.calltrace.cycles-pp.check_xstate_in_sigframe.__fpu_restore_sig.fpu__restore_sig.restore_sigcontext.__x64_sys_rt_sigreturn
      2.27 ±  3%      +0.2        2.50        perf-profile.calltrace.cycles-pp.__fpu_restore_sig.fpu__restore_sig.restore_sigcontext.__x64_sys_rt_sigreturn.do_syscall_64
      0.79 ±  5%      +0.2        1.02        perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.hash_bucket.lock_timer
      0.93 ±  5%      +0.3        1.23        perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.hash_bucket.lock_timer.__x64_sys_timer_getoverrun
      1.42 ±  4%      +0.4        1.82        perf-profile.calltrace.cycles-pp.hash_bucket.lock_timer.__x64_sys_timer_getoverrun.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.11 ±200%      +0.5        0.60        perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe.timer_getoverrun
      0.00            +0.6        0.57 ±  2%  perf-profile.calltrace.cycles-pp.native_apic_msr_eoi.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.lock_timer
      8.61 ±  2%      +0.7        9.34        perf-profile.calltrace.cycles-pp.__restore_fpregs_from_user.restore_fpregs_from_user.fpu__restore_sig.restore_sigcontext.__x64_sys_rt_sigreturn
     12.21 ±  3%      +0.8       13.02        perf-profile.calltrace.cycles-pp.fpu__restore_sig.restore_sigcontext.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      9.57 ±  2%      +0.8       10.39        perf-profile.calltrace.cycles-pp.restore_fpregs_from_user.fpu__restore_sig.restore_sigcontext.__x64_sys_rt_sigreturn.do_syscall_64
      1.34 ±  5%      +1.0        2.36        perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.hash_bucket.lock_timer.__x64_sys_timer_getoverrun.do_syscall_64
     14.00 ±  2%      +1.2       15.18        perf-profile.calltrace.cycles-pp.restore_sigcontext.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.90 ±  5%      +1.2        2.11 ±  2%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.lock_timer
     18.73 ±  2%      +1.5       20.20        perf-profile.calltrace.cycles-pp.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.16 ±  5%      +1.7        2.84 ±  2%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.lock_timer.__x64_sys_timer_getoverrun
      1.37 ±  5%      +2.0        3.41 ±  2%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.lock_timer.__x64_sys_timer_getoverrun.do_syscall_64
      4.18 ±  2%      +4.0        8.14        perf-profile.calltrace.cycles-pp.lock_timer.__x64_sys_timer_getoverrun.do_syscall_64.entry_SYSCALL_64_after_hwframe.timer_getoverrun
      2.51 ±  3%      +4.1        6.58 ±  2%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.lock_timer.__x64_sys_timer_getoverrun.do_syscall_64.entry_SYSCALL_64_after_hwframe
      4.94 ±  2%      +4.6        9.50        perf-profile.calltrace.cycles-pp.__x64_sys_timer_getoverrun.do_syscall_64.entry_SYSCALL_64_after_hwframe.timer_getoverrun
      6.48            -2.5        3.98        perf-profile.children.cycles-pp.lapic_next_deadline
      8.64            -2.4        6.24        perf-profile.children.cycles-pp.clockevents_program_event
     41.55            -1.4       40.12        perf-profile.children.cycles-pp.arch_do_signal_or_restart
     41.69            -1.4       40.26        perf-profile.children.cycles-pp.exit_to_user_mode_loop
      5.68            -1.2        4.45        perf-profile.children.cycles-pp.hrtimer_start_range_ns
      8.48            -1.2        7.28        perf-profile.children.cycles-pp.posixtimer_deliver_signal
      9.09            -1.2        7.92        perf-profile.children.cycles-pp.dequeue_signal
     10.15            -1.2        8.99        perf-profile.children.cycles-pp.get_signal
      8.70 ±  3%      -1.0        7.72        perf-profile.children.cycles-pp.hrtimer_interrupt
     11.08 ±  3%      -0.8       10.26        perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
     13.08 ±  3%      -0.8       12.30        perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
     87.49            -0.5       86.98        perf-profile.children.cycles-pp.do_syscall_64
     88.02            -0.5       87.54        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.19 ±  3%      -0.0        0.17 ±  2%  perf-profile.children.cycles-pp.clockevents_program_min_delta
      0.72            -0.0        0.70        perf-profile.children.cycles-pp.__local_bh_enable_ip
      0.05            +0.0        0.06        perf-profile.children.cycles-pp._raw_spin_unlock
      0.05            +0.0        0.06        perf-profile.children.cycles-pp.sched_clock_noinstr
      0.63            +0.0        0.66        perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.19 ±  2%      +0.0        0.22        perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.78 ±  3%      +0.0        0.82 ±  2%  perf-profile.children.cycles-pp.set_current_blocked
      0.72 ±  2%      +0.0        0.76        perf-profile.children.cycles-pp.recalc_sigpending
      1.06 ±  2%      +0.1        1.12        perf-profile.children.cycles-pp._copy_to_user
      1.41 ±  2%      +0.1        1.48        perf-profile.children.cycles-pp.restore_altstack
      1.13 ±  2%      +0.1        1.21        perf-profile.children.cycles-pp.__get_user_nocheck_4
      2.04            +0.1        2.12        perf-profile.children.cycles-pp._raw_spin_lock_irq
      1.65 ±  2%      +0.1        1.74        perf-profile.children.cycles-pp.__x64_sys_rt_sigpending
      2.73            +0.1        2.84        perf-profile.children.cycles-pp.ktime_get
      0.83 ±  3%      +0.1        0.96        perf-profile.children.cycles-pp.x64_sys_call
      2.43            +0.1        2.56        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      2.80 ±  2%      +0.1        2.94        perf-profile.children.cycles-pp._copy_from_user
      2.32 ±  2%      +0.2        2.49        perf-profile.children.cycles-pp.check_xstate_in_sigframe
      2.41 ±  2%      +0.2        2.59        perf-profile.children.cycles-pp.__fpu_restore_sig
      3.85 ±  2%      +0.2        4.03        perf-profile.children.cycles-pp.entry_SYSCALL_64
      5.05            +0.2        5.24        perf-profile.children.cycles-pp.native_irq_return_iret
      0.22            +0.3        0.49 ±  5%  perf-profile.children.cycles-pp._raw_spin_unlock_irq
      9.31            +0.5        9.85        perf-profile.children.cycles-pp.__restore_fpregs_from_user
      1.77 ±  4%      +0.6        2.34        perf-profile.children.cycles-pp.hash_bucket
     10.17            +0.6       10.75        perf-profile.children.cycles-pp.restore_fpregs_from_user
     12.72 ±  2%      +0.7       13.47        perf-profile.children.cycles-pp.fpu__restore_sig
     14.75 ±  2%      +0.9       15.62        perf-profile.children.cycles-pp.restore_sigcontext
     19.52 ±  2%      +1.2       20.73        perf-profile.children.cycles-pp.__x64_sys_rt_sigreturn
      4.71 ±  2%      +4.3        9.00        perf-profile.children.cycles-pp.lock_timer
      4.99 ±  2%      +4.6        9.55        perf-profile.children.cycles-pp.__x64_sys_timer_getoverrun
      6.45            -2.5        3.97        perf-profile.self.cycles-pp.lapic_next_deadline
      4.78 ±  4%      -1.0        3.75        perf-profile.self.cycles-pp.do_syscall_64
      0.06            -0.0        0.05        perf-profile.self.cycles-pp.restore_regs_and_return_to_kernel
      0.05            +0.0        0.06        perf-profile.self.cycles-pp.hrtimer_reprogram
      0.14            +0.0        0.15 ±  2%  perf-profile.self.cycles-pp.exit_to_user_mode_loop
      0.40            +0.0        0.42        perf-profile.self.cycles-pp.hrtimer_forward
      0.26 ±  3%      +0.0        0.28        perf-profile.self.cycles-pp.__irq_exit_rcu
      0.48            +0.0        0.50        perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.24 ±  2%      +0.0        0.26        perf-profile.self.cycles-pp.__x64_sys_rt_sigreturn
      0.47            +0.0        0.50        perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.33 ±  3%      +0.0        0.36        perf-profile.self.cycles-pp.x64_sys_call
      0.19 ±  2%      +0.0        0.22        perf-profile.self.cycles-pp.syscall_return_via_sysret
      1.61            +0.0        1.65        perf-profile.self.cycles-pp.get_sigframe
      0.71 ±  2%      +0.0        0.74        perf-profile.self.cycles-pp.recalc_sigpending
      1.06 ±  2%      +0.1        1.12        perf-profile.self.cycles-pp._copy_to_user
      2.01            +0.1        2.08        perf-profile.self.cycles-pp._raw_spin_lock_irq
      1.21 ±  2%      +0.1        1.28        perf-profile.self.cycles-pp.check_xstate_in_sigframe
      1.12 ±  2%      +0.1        1.21        perf-profile.self.cycles-pp.__get_user_nocheck_4
      0.22            +0.1        0.31 ±  2%  perf-profile.self.cycles-pp._raw_spin_unlock_irq
      2.72            +0.1        2.83        perf-profile.self.cycles-pp.ktime_get
      2.43            +0.1        2.54        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      2.39            +0.1        2.51        perf-profile.self.cycles-pp.entry_SYSCALL_64
      0.59 ±  4%      +0.2        0.75        perf-profile.self.cycles-pp.hash_bucket
      2.78 ±  2%      +0.2        2.94        perf-profile.self.cycles-pp._copy_from_user
      5.03            +0.2        5.22        perf-profile.self.cycles-pp.native_irq_return_iret
      9.31            +0.5        9.85        perf-profile.self.cycles-pp.__restore_fpregs_from_user
      0.89            +1.0        1.88 ±  2%  perf-profile.self.cycles-pp.lock_timer





Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

