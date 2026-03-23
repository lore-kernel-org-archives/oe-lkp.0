Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACFA35DA7C
	for <oe-lkp@lists.linux.dev>; Mon, 23 Mar 2026 07:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774250213; cv=fail; b=dzNbWr9WpnVMBa9si4kQU5lALPka4B4dl+VjXSqygl8N5VyuD/tEqpT1qgFCdakQmYehDhIcVVwUqxdi8GCk+gPCZPRwdlQ5nKw+CqOJEuEflTdAD8Q9nUxdNTZYXhnyDyscru4Os9BUy0IBw06bT+P8WglhyvS8IRXkQ4q4IZo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774250213; c=relaxed/simple;
	bh=4ti4L7OOsdDDxJhE4hVap/6yjigVYFAaGSEDXQtYZFU=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=EnQIj0BS3aWa1PTJ67Ora+pHb18AXj5nhySP3emacn6zJXGwVOU2/z+H/Bxc1BITTMor+SycXlojjVb/Mh+fUKref8IBElJD0NbmBOHzhatF0+voqsNaP6zjlajsOBIAbyax7IPNINB6ZnunGt6S40ErLXkHgYY5bTOzHP96LcM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eMtsG1o8; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eMtsG1o8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774250209; x=1805786209;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=4ti4L7OOsdDDxJhE4hVap/6yjigVYFAaGSEDXQtYZFU=;
  b=eMtsG1o89/Rb/VKuHX8vcQ77PsTDHnJebdX5Q759tssb4n6xIAFnIBZC
   z4HjqL4AeFYMmWu/B4KmZNk09/zTz5Jy4OHhDVUDvxCFiEyQ3OdUCpfFe
   PzWry5rCsHqla2XK8lHMfJc4Cx8eVyAKyL5neaYoompc3rHMRE4HfX8Q0
   F9E2eOx0drFmoHbRJwPaP8Sb7HkSfwthHk+DpA68+yDVOyzDUrEQfvbhf
   E2B5JkVyvKKf0az+zVGSXMP0qcLptYDMJ4HunkBB5oIY+FIj/QgEeEf80
   kBYvruM9ngLusMQobLoj4XuJw4lr89EwHk88WB7YsOJAvYQR3PLP6cI51
   w==;
X-CSE-ConnectionGUID: jUDh6AjoRp6g4xEFeVmUsA==
X-CSE-MsgGUID: x2t66JNDQdClQgDoLfnsrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="74261600"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="74261600"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 00:16:48 -0700
X-CSE-ConnectionGUID: XJ6E5YvIQ/KddPOPhOi1iw==
X-CSE-MsgGUID: JEojtdUtToSuqGOtug1TsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="228412550"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 00:16:48 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 00:16:47 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 23 Mar 2026 00:16:47 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.42) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 00:16:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MeC7jk4DFR8wBHKNN/4svdpUirPXRFhbOgEi7KRWkYUBihST7kAo3eNqx4fYqU+tJI+wLpGFvZ3B9oH4r/L6EpMlRhpR7jHNgeAnXixQu+6nXRa+zouQJA6ed4Lgf7pJqxFmsoleO1utOgFFL9c7o5d9BYqC0irqwgdIqyNnk9YXgj3tOhNMTakO76FjF6zoh8qKXznj1oZoNVv7ajTKI5vmc8bSGg/A5PvGUlrp1TGTlgobOTnVSO0dTraPnzpKLE+GAOBP3E6TGxaJ6t3mweWH/mF6EZ8dq5wvNdfSchUnUwhyrm6tOFsog+tCIW1D1vAvsN/djpaJM52vOd08fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YN/CEGcSAcDVCB5USBUF6DIPdzmtVjo5ByJUvRmI4CQ=;
 b=dOm2+Nhgnf9z0mzCf1QyCYa180WAleNnajimgVn9wR8iAA3fZuonStvJrqW8WAu3dqLkJ5OTQ1tg75CR8IHzbnDsbnS8DEUaT3EzILvTHcvo/HAjr6h6TjPtom2srAmTHXYTlnDXdPxg+AWokhy8LSza1gu99+rhNzF6tE3cvITEI2A97+PVD8Umm3mmAQlzlcsxbVLNNO043a+iTQNPHEUDLouP2+gU39whbLvnF21wl1XHUoCi4ILI94ls+3IksEIxoH5YHKUGjPoCsV4o8BoY5oN0Sd/57l7BCrG6YAl6ssd/yRuBo9nYEIPPKtQl230Ms57zO0e2+HvrmuZsAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by SJ2PR11MB7501.namprd11.prod.outlook.com (2603:10b6:a03:4d2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Mon, 23 Mar
 2026 07:16:43 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%3]) with mapi id 15.20.9745.012; Mon, 23 Mar 2026
 07:16:43 +0000
Date: Mon, 23 Mar 2026 15:16:35 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>, Thomas Gleixner <tglx@kernel.org>, kernel test robot
	<oliver.sang@intel.com>
Subject: [tip:sched/hrtick] [hrtimer]  92f7ee408c:
 stress-ng.timermix.ops_per_sec 23.8% improvement
Message-ID: <202603231407.332d483b-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: SGBP274CA0012.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::24)
 To PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|SJ2PR11MB7501:EE_
X-MS-Office365-Filtering-Correlation-Id: ec92df2a-c496-4fee-344e-08de88ac22d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: fFDaA4y1GIczb6AUHEYrHhK1gpx8M4aV2ci685uDtggvudVXlDHfW0Am/OpxZPjXBZPNp/SsKLn+VTkMTnILX4M4w4eZqHqy180ek8oz3+zm8/A3Wda0lz8ZlOkq8A6zkw5Ea3RsSMaXzvOaF42Hr2VFU65SFHn79W2+pX3l9+r+hyepEOIrSj8IuYw5KcaKc9OosaY6SFflaM7haN0bgAyD9RyLRamy7t3Wv/rEre7kI2ERUIBIDNuO0v1ItM9wg60olW/xctSDj3RaVRucRiU7IB2DXB4pkZYe9RbEYK4XTl7OzlqosotDemleqNA8VcsDCk4MQjciikn7FJNOiZdgEG4lbDmcc0HyzULwD6ZLXOTry0OjALxwK21NKUoRPcP+rF09K/pCe0jyTTnsU/fWdWcbAUV7oEYMYn1AmGYkDDXTl1pD7wTd3hAqyXCx8wOOQefo+gd7wCuIdfTKzUH/TXCtvSs02CvZ8cfQon9cOX/R09eTUw84WQvn2WpLsaXiL8lAPBKybfNG6IVEhQqa9B2NtcZ939Bc5DlZrRDzExwFEpvz2veOMzYcq0jq9YOWCFsRP/gHp+suyM50PNShUriWFmkRkDvBHUkqQt7TIeISLHffVSVDIGBEjbPJZwvi9rblgsq8mcbe0wkeo62V29HA5a3CeM7XlGcBAc7GA38Xk43f6kVWxHjLI3aykweXr6sR+yLgQqCgn86AeQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?+kz0Daw3N+ZEp5t3ug8OS1yMuUz+fzkcwzbU0eqGWVIRsWS5ruvuBGJpbk?=
 =?iso-8859-1?Q?JwkP2vEJae4VC707E1ihyoHg5BZtz209tO5Zhj08m0omKoyHxz7JqV8i1J?=
 =?iso-8859-1?Q?omUFHJSqp8rADYNHELaiIKIY6lulcufpzOppKISqWcTD1MDtWFrzY0sxpS?=
 =?iso-8859-1?Q?uKJCv0M4X3dq1CXpDXA9+YW5fdAtA7+XxU+f69SGX1Nvg/P7UuQRl5tX0L?=
 =?iso-8859-1?Q?/cuoLWdbV7FEgad/cFBCCrl7asiKk8XC3M9XBYkdUFR001AfPG8fWEtsJm?=
 =?iso-8859-1?Q?OFPAkVk+Fiw8pQzzxNhkAdN3IE/xvDkn5DUfLy+n8+Da9TSVxRIfNad0vy?=
 =?iso-8859-1?Q?yUwaur4BeCqlF5DdMO+Cw+4eQGkJQ3VrF3K4lG6h/hCv6HA4MRUvWxk2wR?=
 =?iso-8859-1?Q?TAR8/1qraHl/lNfA0sLWz+CBpM0WNAW3qftKV5G1cehEPOqhjv8BWtF8vK?=
 =?iso-8859-1?Q?Xe5qniaSJ9WvGbqpwNlfs8C4Cvqi63kTTtY+QMjeRSlaPfRc12xCuGhZV7?=
 =?iso-8859-1?Q?ICTXnAtQdhAoRjrKbq1OoReQeWRpOqJyI7qLRiyoiX/eYRcW3J/Ug0MqFO?=
 =?iso-8859-1?Q?LYDxSSJbwPGQzh+PyKLvYxjwlKmAQSOejDHWak7OGDUH5KrTM/ETez/yUt?=
 =?iso-8859-1?Q?emdR9+M6sdEIv4eQN6Pk4ZDhDkVXPKfqcT38gnhvV5mI48sLUGRMqxTQ2g?=
 =?iso-8859-1?Q?jEa2zQIS3PpGfEP88+c/ryxrwYS0eKip1fyGiI/d52D2zWDQgVcVTqDO+Z?=
 =?iso-8859-1?Q?27IK2VS/Rl9Q8anPrGPRD9TB98l95ltDfKf1pIkjd0U698bXmWDWV+vM91?=
 =?iso-8859-1?Q?Dy6KKRCmlvQAEKMp9eFFl7WQQHNBtZPJx/VTmdmjibZbjHDgMIzHOGamxA?=
 =?iso-8859-1?Q?z2+1C35Ye3I52DETVE1zPXu/PHmyM/pESpOIPmBxYzY5LmxzFgRXZZTAKN?=
 =?iso-8859-1?Q?RWLGjvCTGWB1v+9gxWnIKY1E8xLbQRJhSrjzxM8WnBMh7MpSZIWZsQ0vL9?=
 =?iso-8859-1?Q?zfAc8e2vXYCP/rD9Wiv2puppFmZpNQBQ/qiwncLxJmP6V/ByDMfBZikC0k?=
 =?iso-8859-1?Q?ILxIHsaBY7R87Qt/U7APXoihopkrhD4qJF7xl/2a4SO4uffj1UmOpVzuJh?=
 =?iso-8859-1?Q?GK6vWLHEgRog5g/W82TWG3R/a3v/jNpwmoksNAaHFQXUrM2242rhEJZPuU?=
 =?iso-8859-1?Q?knpYpGH0wQo/gY9QPfegIbg32Z33mV6okb4lkEnlQOvXdrCldhpD/Z2mGi?=
 =?iso-8859-1?Q?AtF5lfbfW4guk1wP02aCK2OEj8tku6VUEh1qyR7xLeS/VWeU10tx9nx9vx?=
 =?iso-8859-1?Q?lNTRkcEqI/O5v3NzOePBLvXLl5SLJbqZY6hEVODjANYIPJpQeQzd7F51i2?=
 =?iso-8859-1?Q?CsogkWrN2mS8ENa79S27RJSROBOtVER7saae8oWzE3Rf9uwQlusfHr05pD?=
 =?iso-8859-1?Q?YaM03/H1AJjMgW8Qmd4t2N6puTJDOVj6ydeLeMjVXydj1ufs9DA9NpJgYN?=
 =?iso-8859-1?Q?Itbn5WKGQPuHEGrdE+gFdlq/1a6L/0RB+61wXOz9D67ZM5q8xak7iUx5Rk?=
 =?iso-8859-1?Q?ZAA7TX7saQ8Kpq5J+gXS18sMxFCmHUDfapIqF9MvIQuCdJ5YpBt88yd8Js?=
 =?iso-8859-1?Q?nU9ZZj9NUYdeu4o9SmciYImXsFG3tH2V5PGcS0TWIla7k3eu2u9YAsTVR+?=
 =?iso-8859-1?Q?AypDgPiEBhwtHh8Fye32Z7VTD8Ly6puL0b52HQpK+Ej/BVySsA9QjL6WO9?=
 =?iso-8859-1?Q?GNn2hB9YJKDeQ/y6gWOI73ZOhrqt8T24k1nFB+PBiKJXYxABR0UwwzGFwV?=
 =?iso-8859-1?Q?nYYq/tR3Mg=3D=3D?=
X-Exchange-RoutingPolicyChecked: TR0BEvneiePwbosRWbyl7dClAj57yfZOvaCe6WCfRdYXC44PDLa1MdQoZ+S6wd1MNWcXkFcrkiLKESpn0cw4d7GHDIIa7S/cgtlH6TcfcR/R1BFb8Iu9t2yOPa/Uw2RjTdOUT2VpgEuL4RkyE5S1uJFA4C8PO6sGG0lVEj0yrL+4MjIy4v+1JD/m8OJzB1ZLAcM4t7cTT43j156VRg3srJFBMOOa1zxJzzhr7bFNQDEg5mAgaWgu+YQci2A1EYlGfCjTiRyyp/LUf709zRzZTvho4MTqBR9tUlsIj4v5oFBY20nvv0Y3xThTkORlxM0cZA8E5k4JYqefFr33j5I/Fg==
X-MS-Exchange-CrossTenant-Network-Message-Id: ec92df2a-c496-4fee-344e-08de88ac22d8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 07:16:43.5234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UnGynJg8S4r9dnJXgt96r31+1kyDY5+j5mW9JJmmg7HlQTXFhLRzbPYHmmr2ATKoJ0N/31O4comCwb/QR10a+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7501
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 23.8% improvement of stress-ng.timermix.ops_per_sec on:


commit: 92f7ee408c23fcc074e4952fb6ffacdf3eb86b56 ("hrtimer: Less agressive interrupt 'hang' handling")
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



Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260323/202603231407.332d483b-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-srf-2sp3/timermix/stress-ng/60s

commit: 
  eef9f648fb ("sched/hrtick: Mark hrtick_clear() as always used")
  92f7ee408c ("hrtimer: Less agressive interrupt 'hang' handling")

eef9f648fb0e9261 92f7ee408c23fcc074e4952fb6f 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     55191            +1.9%      56222        stress-ng.time.minor_page_faults
     13705           +24.9%      17115        stress-ng.time.percent_of_cpu_this_job_got
      7596           +24.7%       9475        stress-ng.time.system_time
    643.57           +26.4%     813.59        stress-ng.time.user_time
   7013218 ±  3%     -83.0%    1195013 ±  7%  stress-ng.time.voluntary_context_switches
     93747           +25.6%     117771        stress-ng.timermix.CLOCK_BOOTTIME_ticks_per_sec
     93745           +25.7%     117867        stress-ng.timermix.CLOCK_MONOTONIC_ticks_per_sec
    784.14           +27.0%     995.58        stress-ng.timermix.CLOCK_PROCESS_CPUTIME_ID_ticks_per_sec
     93972           +25.7%     118146        stress-ng.timermix.CLOCK_REALTIME_ticks_per_sec
     93713           +25.6%     117697        stress-ng.timermix.CLOCK_TAI_ticks_per_sec
    784.22           +27.0%     995.69        stress-ng.timermix.CLOCK_THREAD_CPUTIME_ID_ticks_per_sec
      7.84 ± 10%     +85.5%      14.54 ± 17%  stress-ng.timermix.ITIMER_VIRTUAL_ticks_per_sec
   4.4e+09           +23.8%  5.449e+09        stress-ng.timermix.ops
  73363779           +23.8%   90846415        stress-ng.timermix.ops_per_sec
 2.694e+09 ±  2%     -84.1%  4.282e+08 ± 15%  cpuidle..time
  10885817 ±  3%     -92.5%     821275 ± 11%  cpuidle..usage
     24.41 ±  2%     -75.1%       6.08 ±  9%  vmstat.cpu.id
    146.27           +24.8%     182.61        vmstat.procs.r
    225376 ±  3%     -82.1%      40249 ±  7%  vmstat.system.cs
  69523712           +22.2%   84939521        vmstat.system.in
     21.93 ±  3%     -18.6        3.28        mpstat.cpu.all.idle%
      7.69            +2.1        9.81        mpstat.cpu.all.irq%
     64.54           +15.1       79.68        mpstat.cpu.all.sys%
      5.83            +1.4        7.22        mpstat.cpu.all.usr%
     34.33 ± 16%     -85.4%       5.00        mpstat.max_utilization.seconds
      2538           +20.7%       3065        turbostat.Avg_MHz
     79.48           +16.3       95.74        turbostat.Busy%
     20.37 ±  2%     -16.3        4.06 ± 21%  turbostat.C1%
     20.32 ±  3%     -80.2%       4.03 ± 21%  turbostat.CPU%c1
  4.38e+09           +23.8%  5.422e+09        turbostat.IRQ
      2.71 ±  6%      -2.7        0.00        turbostat.POLL%
    344.10           +15.6%     397.93        turbostat.PkgWatt
      0.01 ± 29%    +675.0%       0.08 ± 13%  perf-sched.sch_delay.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      0.01 ± 29%    +675.0%       0.08 ± 13%  perf-sched.total_sch_delay.average.ms
      7.77 ± 18%   +2551.8%     206.08 ±  2%  perf-sched.total_wait_and_delay.average.ms
    152368 ± 17%     -96.6%       5191        perf-sched.total_wait_and_delay.count.ms
      2375 ±  6%     +60.7%       3815 ± 15%  perf-sched.total_wait_and_delay.max.ms
      7.76 ± 18%   +2554.5%     205.99 ±  2%  perf-sched.total_wait_time.average.ms
      2374 ±  6%     +60.7%       3815 ± 15%  perf-sched.total_wait_time.max.ms
      7.77 ± 18%   +2551.8%     206.08 ±  2%  perf-sched.wait_and_delay.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
    152368 ± 17%     -96.6%       5191        perf-sched.wait_and_delay.count.[unknown].[unknown].[unknown].[unknown].[unknown]
      2375 ±  6%     +60.7%       3815 ± 15%  perf-sched.wait_and_delay.max.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      7.76 ± 18%   +2554.5%     205.99 ±  2%  perf-sched.wait_time.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      2374 ±  6%     +60.7%       3815 ± 15%  perf-sched.wait_time.max.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      0.02 ±  4%     -31.3%       0.02 ±  3%  perf-stat.i.MPKI
 5.401e+10           +27.7%    6.9e+10        perf-stat.i.branch-instructions
      0.25            -0.0        0.22        perf-stat.i.branch-miss-rate%
 1.197e+08           +24.3%  1.487e+08        perf-stat.i.branch-misses
  11654768 ±  5%     +32.5%   15440506 ±  3%  perf-stat.i.cache-references
    273890 ±  3%     -83.3%      45691 ±  7%  perf-stat.i.context-switches
      1.79            -6.3%       1.68        perf-stat.i.cpi
 4.788e+11           +25.7%  6.018e+11        perf-stat.i.cpu-cycles
    305.34 ±  2%     -12.7%     266.67        perf-stat.i.cpu-migrations
    290485 ±  3%    +357.1%    1327861 ± 81%  perf-stat.i.cycles-between-cache-misses
 2.844e+11           +28.4%  3.651e+11        perf-stat.i.instructions
      0.57            +6.2%       0.61        perf-stat.i.ipc
      1.37 ±  3%     -83.7%       0.22 ±  9%  perf-stat.i.metric.K/sec
      2721 ±  3%     +22.5%       3332 ±  4%  perf-stat.i.minor-faults
      2721 ±  3%     +22.5%       3332 ±  4%  perf-stat.i.page-faults
      0.01           -15.5%       0.01 ±  5%  perf-stat.overall.MPKI
      0.22            -0.0        0.21        perf-stat.overall.branch-miss-rate%
     21.40 ±  6%      -3.2       18.23 ±  8%  perf-stat.overall.cache-miss-rate%
      1.68            -1.6%       1.65        perf-stat.overall.cpi
    169048           +16.9%     197558 ±  5%  perf-stat.overall.cycles-between-cache-misses
      0.60            +1.7%       0.61        perf-stat.overall.ipc
 5.409e+10           +24.0%  6.706e+10        perf-stat.ps.branch-instructions
 1.186e+08           +21.5%   1.44e+08        perf-stat.ps.branch-misses
  13265941 ±  6%     +23.2%   16341982 ±  3%  perf-stat.ps.cache-references
    237189 ±  4%     -82.2%      42112 ±  6%  perf-stat.ps.context-switches
 4.777e+11           +22.5%   5.85e+11        perf-stat.ps.cpu-cycles
    279.70 ±  2%     -11.0%     248.81        perf-stat.ps.cpu-migrations
  2.85e+11           +24.5%  3.548e+11        perf-stat.ps.instructions
      2443 ±  3%     +21.5%       2968 ±  5%  perf-stat.ps.minor-faults
      2443 ±  3%     +21.5%       2968 ±  5%  perf-stat.ps.page-faults
 1.701e+13           +25.1%  2.128e+13        perf-stat.total.instructions
      4.12 ±  3%      -0.3        3.80 ±  4%  perf-profile.calltrace.cycles-pp.save_xstate_epilog.get_sigframe.x64_setup_rt_frame.arch_do_signal_or_restart.exit_to_user_mode_loop
     12.30 ± 14%      +2.7       15.03 ± 10%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.sigpending
      4.90 ±  3%      -0.5        4.40        perf-profile.children.cycles-pp.save_xstate_epilog
      2.04 ±  2%      -0.2        1.81        perf-profile.children.cycles-pp.__put_user_nocheck_4
      2.15 ±  2%      -0.2        1.99 ±  5%  perf-profile.children.cycles-pp.__put_user_nocheck_8
      2.50            -0.1        2.42        perf-profile.children.cycles-pp.entry_SYSCALL_64
      0.77 ±  2%      -0.1        0.71        perf-profile.children.cycles-pp.__local_bh_enable_ip
      1.53            -0.1        1.48        perf-profile.children.cycles-pp.fpregs_mark_activate
      1.76            -0.0        1.72        perf-profile.children.cycles-pp._raw_spin_lock_irq
      0.89 ±  2%      -0.0        0.85 ±  2%  perf-profile.children.cycles-pp.signal_setup_done
      0.16 ±  8%      -0.0        0.12 ±  6%  perf-profile.children.cycles-pp.get_xsave_addr_user
      0.86            -0.0        0.83        perf-profile.children.cycles-pp.arch_exit_to_user_mode_prepare
      0.46            -0.0        0.44        perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.00            +0.1        0.11 ± 20%  perf-profile.children.cycles-pp.add_callchain_ip
      0.00            +0.1        0.12 ± 19%  perf-profile.children.cycles-pp.thread__resolve_callchain_sample
      0.00            +0.1        0.12 ±  5%  perf-profile.children.cycles-pp.ordered_events__queue
      0.00            +0.1        0.12 ±  5%  perf-profile.children.cycles-pp.process_simple
      0.00            +0.1        0.12 ±  5%  perf-profile.children.cycles-pp.queue_event
      0.01 ±223%      +0.1        0.14 ± 21%  perf-profile.children.cycles-pp.__thread__resolve_callchain
      0.01 ±223%      +0.1        0.14 ± 21%  perf-profile.children.cycles-pp.sample__for_each_callchain_node
      0.01 ±223%      +0.1        0.15 ± 20%  perf-profile.children.cycles-pp.build_id__mark_dso_hit
      0.01 ±223%      +0.2        0.17 ± 22%  perf-profile.children.cycles-pp.perf_session__deliver_event
      0.01 ±223%      +0.2        0.17 ± 22%  perf-profile.children.cycles-pp.__ordered_events__flush
      6.06            +0.2        6.23        perf-profile.children.cycles-pp.posixtimer_deliver_signal
      6.71            +0.2        6.88        perf-profile.children.cycles-pp.dequeue_signal
      0.02 ±223%      +0.2        0.22 ± 17%  perf-profile.children.cycles-pp.reader__read_event
      0.05 ± 86%      +0.3        0.33 ± 12%  perf-profile.children.cycles-pp.cmd_record
      0.02 ±223%      +0.3        0.29 ± 13%  perf-profile.children.cycles-pp.perf_session__process_events
      0.02 ±223%      +0.3        0.29 ± 13%  perf-profile.children.cycles-pp.record__finish_output
      1.59 ±  6%      -0.1        1.50        perf-profile.self.cycles-pp.save_xstate_epilog
      1.73            -0.1        1.66        perf-profile.self.cycles-pp.entry_SYSCALL_64
      1.78            -0.1        1.72        perf-profile.self.cycles-pp.__put_user_nocheck_4
      1.81            -0.1        1.75        perf-profile.self.cycles-pp.__put_user_nocheck_8
      1.74            -0.0        1.70        perf-profile.self.cycles-pp._raw_spin_lock_irq
      1.00            -0.0        0.96        perf-profile.self.cycles-pp.fpregs_mark_activate
      0.73 ±  2%      -0.0        0.70        perf-profile.self.cycles-pp.__local_bh_enable_ip
      0.54            -0.0        0.52 ±  2%  perf-profile.self.cycles-pp.do_syscall_64
      0.24            -0.0        0.22 ±  2%  perf-profile.self.cycles-pp.sysvec_apic_timer_interrupt
      0.22            +0.0        0.23        perf-profile.self.cycles-pp._raw_spin_unlock_irqrestore
      0.49            +0.0        0.51        perf-profile.self.cycles-pp.posixtimer_send_sigqueue
      0.07 ±  7%      +0.0        0.09 ±  8%  perf-profile.self.cycles-pp.common_hrtimer_rearm
      0.00            +0.1        0.12 ±  6%  perf-profile.self.cycles-pp.queue_event




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

