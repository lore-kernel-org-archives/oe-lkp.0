Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757D93DBA0
	for <oe-lkp@lists.linux.dev>; Tue, 10 Mar 2026 14:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773153999; cv=fail; b=Q1yCUJVEFZNI+39ff6n8x1p/MP0ruFqsBHxO3qcvWJsGbdy5f8IcEwQx8orSzIUeYNEdDplwrS5Lfbz3SNs5IMjgHc4BepY+8jF0HABq9h3MqIRL48jnCBzY4BwWIzLlI07um5IM5XMrFnQEfPIZYy7ORGeO6Hn9pqxxQyJdVmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773153999; c=relaxed/simple;
	bh=udXypfARVy6NfYfooGnvrdHt9aLSDIutJU5aTDU3ksI=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=B3wrTLgpZrhQ/RYjxtB1dgMOWQhkWeCnoeJPjmcCqmYdTdDHAfPcNsjuMn/YoO6ZLE8JwWNGDbmFAQNanhaBmYvdgieJNdgyznyNwmd7cFpr209GbfVn/bFsMLUgx/T+3u5ELIvABlCD6HaehmmGTLzLRp/Gaoxb3zM8huiRndg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eNuL0uFK; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eNuL0uFK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773153996; x=1804689996;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=udXypfARVy6NfYfooGnvrdHt9aLSDIutJU5aTDU3ksI=;
  b=eNuL0uFKMhj/2ExgHJIe9O12QTzZh1uF0RO92ieGNVsnOt1bPWGiqN+5
   o5GUOLeSecDaY7epaFYAX20xxyGfohCm8JAVlYp8BvUPU9bQXGg6EbJc2
   U2HSR8uNw0QPSztC7gtVp29lcbepIGOJVHip/9l4jCIyb+TydEknp1KO5
   BO+dZ6myB3PaeSGnSKHWlTnA5tv3KEJdx2ySbAuRW1PbOmD7fgetaitiW
   WjEHu3hQnRv9aqA74p9zIKJ4mC2QVzUyj8lQxe/h7cn0fDcA8ImrEtlIU
   pJ98uWq6NuOd09z5Hhz6MZhQRdTygcIAV1Q5MQBWv1EkVrGUNHIo60K8X
   A==;
X-CSE-ConnectionGUID: es+BwOT+Rga1nWwbQCE+iw==
X-CSE-MsgGUID: 1h2UQS/KSPmjOfBebWhdPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74282176"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="74282176"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 07:46:36 -0700
X-CSE-ConnectionGUID: bbI9jrwgTViiKzq2/bMAkA==
X-CSE-MsgGUID: 0Y664xPBSdGipK3yWvJf/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="220098814"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 07:46:35 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 07:46:34 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 10 Mar 2026 07:46:34 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.45)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 07:46:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YMupA/HBcIe7gXGokEkBGK9zKHlZmbu8nCvz328VIJ/jZOfor/CfexjSeX5kw9Yfv+9YcrPaa5h/R0nM4UPwfYchzx6i7k4mYEJVY9h5MGZAtTSpEHVlPUvCUzkSbdai4RSt5km7rc6kaVVVLMDAiBjw5el4byErbPKUmNGayhJCyUop5k/wUGiSXx+8cVEx/iZj5DD9Te93ifg553pemvJ5BpYZWwpJq+8N1ZznGy6wOXmLmeWpcj8pI48lijAFj/C0Cv5PrhDjj2bonykPd486Zyz+0gNvGRD1UgtfLhMBok3t43vB04srBaRJ9N9rQvDzPhhhB9VGmhlzJCZ87Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l+rqF56780YW7luCQWQ5en32FL3grtexkk6mb7VhXdQ=;
 b=X3rtEdsIgroHMvWOw/T1SOPiT9QE5EBRjxwHpIhMY1cOpI5B12+HH9uIOF31e7hcN//wZMe4JdSqVQAEar5ooa9SI0mFywrW4g/+Mt51uJCBN73nniSefmfP53jauBanNOVBYCW4J+Hwf4mbfTFVgc/tjQW+iDxRWY1hrVLtggorrGf0Ohwa6dSTk6kdCkUE/lItzaIvFvw+TFDZDqpKfO8MjUEiVxtCeT3zAlHQJi2YkFVfSFSyDuS2feUF3/WfD9V0T9CLmw+qo9OXsFz8Cg4vpPfSJ5Osu/RF39QG8ZhhPTS8mYfPkwZZt7yJXySOH/xHGdW2bq9nmbLpEuYH0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB4033.namprd11.prod.outlook.com (2603:10b6:405:78::25)
 by CH3PR11MB8155.namprd11.prod.outlook.com (2603:10b6:610:164::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 14:46:26 +0000
Received: from BN6PR11MB4033.namprd11.prod.outlook.com
 ([fe80::2c28:2983:2947:24b1]) by BN6PR11MB4033.namprd11.prod.outlook.com
 ([fe80::2c28:2983:2947:24b1%6]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 14:46:25 +0000
Date: Tue, 10 Mar 2026 22:46:16 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>, Thomas Gleixner <tglx@kernel.org>, <oliver.sang@intel.com>
Subject: [tip:sched/hrtick] [hrtimer]  2889243848:
 stress-ng.timermix.ops_per_sec 30.1% regression
Message-ID: <202603102229.74b9dee4-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: SG2PR02CA0096.apcprd02.prod.outlook.com
 (2603:1096:4:90::36) To BN6PR11MB4033.namprd11.prod.outlook.com
 (2603:10b6:405:78::25)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PR11MB4033:EE_|CH3PR11MB8155:EE_
X-MS-Office365-Filtering-Correlation-Id: c90469a6-ff4f-45a0-5613-08de7eb3cdf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: YDvg8CJ4DSBH9aS0pZfIJNc4TTHo1n1WvRiq0p92EsdSWrwAudbYYuYhc9I2zuqK9xzYDh/TK/kqYbGwZp1hlhwjgG0/TKRnPu+hIIST9tzDJa78xbgdKYkR9Pb1QszQDA/QoL9wgQXDWIQ/Qqn3MIot+mTCaFCKoyTY14w8Izcb8InPc5JYq3ALmRj9ERHRkZu1DJB9J6Y34PClYviYojkvqgZhAntjc7YxB2FzaB0Ei4MzQff0YQaaCSRxcwkzJHynYqYITbNUwwLIdM4+XLXw2K6gL89TBbV+lA0WbMcJnOlT/PaocO4Tiq98RAY9Rk45f31Cuz+pn8QJi5/k2xBy67REWY+R5Nytj21EVCZH7qes6jx1Bz+Nt1Eqt2SUU02WIIsJONRpbPZYymvyHkx+Gb3ONBJsIsoz32OWl/SuKkO379PXELGvXskU7qoBRCAlx/tXQ+NB85QwWYpChLB/R8IGglT9qStUIawz5MLJTNkzjVX+/VJuqhKYmaGn8P2rvypRE8Imx7aqkio5vaBe5PHKicmTSpPCr+4yIPliBpn4AGkkBOHpZDDalG7JfuJkPfU8mPTvR16N8c/P5Q1mjrGOoSdvFGoAiRDKRjzg3pNunrCiahD2Yi+EQWm6D4YCEknHvm4VaReSTI6D3j8Odohg2sRbj5gtGDaYIo2OcYu3uJzkiKMRaJqz/WAlLdSOStBlCBxzETGjA99dQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB4033.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?3lXV7vc1Saglg5/kLpR96UMVvlztgfq3M9mM3vim27emshuyln2t+uICP7?=
 =?iso-8859-1?Q?1fXjbKbMR6wGNW9iqI5jeEQI3vT+Kjfe2yeb3FL+8s+dpa70drvzNnglPG?=
 =?iso-8859-1?Q?4VGW8OTUhqREA2Jtt2vAy8bUKVghfvvdMOQnAP6HwGjeAuGwsFEtKYO1iN?=
 =?iso-8859-1?Q?yp+Q0JEsbkNZrLzjTN+5euoAQkV4/3Ub0fczHOhBBhIFsV8y/tltxhrexS?=
 =?iso-8859-1?Q?lK00w+cYmLL1mwyoupcrlGGFwJjBE/i7hydOAPJFZ5yIuXTKcZfK0dL0LV?=
 =?iso-8859-1?Q?bVNd28TX3e7J8WXafDOSZlmL45VfCmgI3QFtw5QgSeYIajkq/YNN4XtqLQ?=
 =?iso-8859-1?Q?Ye8UED8cpiO9IQtVrz4SDk5D7pW4VD05ZXneq6MrBSFVHvBdQD5+AKyrkv?=
 =?iso-8859-1?Q?BpEtae0OX2bWtgAhqRZjfddF5jS0gx5k0Kk9A/c5NgfAwAy55qKy8v3RPv?=
 =?iso-8859-1?Q?hUvU7gpvz6h04ihgcxb6EGDD6RlS1nnkHNADNp4TdVbhiqUe5p7GDZ6tmI?=
 =?iso-8859-1?Q?1fwGWj/TmCGBQ1nBiF6FY9EAKCe3yUzNOPG2ujTofhegDLG8ihOlXmdP1K?=
 =?iso-8859-1?Q?83MPRgNdYPziqk12MZ2SvwXWkoK9g9vdLWBD5427sS3XQczmj0V44gQe0e?=
 =?iso-8859-1?Q?7JKkuPFkpXzXdzcFWbf7xraNCfu56KbFevtSDFcc98+wd0HsxIp78QqKeK?=
 =?iso-8859-1?Q?hE5r0xhmq7HS60GwDkZfzy53JyyWtiYSf7k4i0/xc5c8Q/fW/IKTgpmyoA?=
 =?iso-8859-1?Q?TQNHHll3qz3k2FzrhTLmO495aSLyOi5KfnNq/2Uew2MN1meEIsIn5kmDwd?=
 =?iso-8859-1?Q?FeV3FB8hmaQFu4hI9zMEre8tkZtN8Bp5AdutrHaOZbFp11va5tVchnfAtk?=
 =?iso-8859-1?Q?M7pjH9gQGUomI12SA92iotpqXfSHSnNZ4DccGef116IjBOyc/TOiUHBHi0?=
 =?iso-8859-1?Q?WxcBtz7lIR+1TWNFWw7fDJPJCcBlGDWfjDEZmOVFAVXICVrkcJDNl9iOSE?=
 =?iso-8859-1?Q?WS26n+gk1a7UQRFP4HWZSUI/NlWRw1asDXrLgHPFbXM4hfE4P3HmoWrvCS?=
 =?iso-8859-1?Q?dalgp0gODsned852j82hHhqKU0VsJRUHWnQ1511fvfsIVnZvMxIFK/HYTJ?=
 =?iso-8859-1?Q?ea5lFliXUf9w7jCOV06q4NDAY6JFkZeGOCO1N/QBQnwMaAJvDp+g0IHe2V?=
 =?iso-8859-1?Q?jD/n1+n/5gwrX+z5gn15rUFNWAuelZyIpI4SjLi8G+FcUjlwl5H88KY675?=
 =?iso-8859-1?Q?2WlyjUvZvZJXPzlQcLMp6r6H2b+noeiZ7ngcNMNkqZ/Ghm8M5ktapTnT/q?=
 =?iso-8859-1?Q?wDpoyvttWIeAucU7Dstv9XVt2czohhCV46XDCGRALbU97RS8wR1TkLQkwN?=
 =?iso-8859-1?Q?pIIYDA6Ld4Pk42Ik3xhkxBYyTJdBqzIYAVmnq8NW3Z8jACnMzgTLJiSKFu?=
 =?iso-8859-1?Q?ePFb0+e0WKYBcliY2NR61KRWq4aOjXL88KNKcWFABYeZkfmZaQIo1V1R6I?=
 =?iso-8859-1?Q?dCkLsbQwLmdkTJlXVZNKnHhioxhAp5NDCLJWRTbTNFTXUwyRPQusB0VoqW?=
 =?iso-8859-1?Q?eXI3xbIaNGsXUGUTUIEDvxbDGuDooNEEJzgN9hbCIVD4Zrjxw0PmcAJmYb?=
 =?iso-8859-1?Q?FnMYChjnEWcU6Od+mCTwzaqKu2kDnMbzEA7FJ1jgti7/TXXKdMwktX1RP5?=
 =?iso-8859-1?Q?IpS3qy+YVQPGCgQW8tA5IRVhh71V8Phi4/NrwUc10wJ93ixDBRTWNjRw6P?=
 =?iso-8859-1?Q?AveXYxy0KPQHg/Ql1wxlwKV543z0s4mNsmO4M0p5vCNrH8pnAljn6wtxow?=
 =?iso-8859-1?Q?LAnr+Qbb9A=3D=3D?=
X-Exchange-RoutingPolicyChecked: FA+Nf0vN7SsZmdzkq0frctLYTSGzZz+xkOEkp3v9QUIJYuYTM0BSJdOetRcE5fnKKr6qT0axpCs8hx+lrYF0t/8pMCL33J+PErMYTcMK6Vz5zU3DNxXnbNZvnESxEXps+EyHd9ARf8bwMXGghECXX3/w0QNmHTjxQVfWpeFNmxqTooKILELyajMazT+6oPjbD+wfwPWy3AXO1GTt9wENfZdKqk9CXZZHdEYEZy1/wCVYH4oms7nQMquzrHO8HfuDjrAOILOycbOn+7WF1vs9hJV37Kuk8J/k60RbdYthUXWhvIF50WkYlYI1mr/zGMtl/40xqxrcSCLEr7BCB2t97w==
X-MS-Exchange-CrossTenant-Network-Message-Id: c90469a6-ff4f-45a0-5613-08de7eb3cdf9
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB4033.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 14:46:25.7088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f/WeSq2Nd/8uRh3ryL8KZYcbCOvdqwMIS9c+YJKTQX+oN9jsrGJeh1+/u4Kf6Qk6s+bo6N2h5Idr+bW8Zo6yEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8155
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 30.1% regression of stress-ng.timermix.ops_per_sec on:


commit: 2889243848560b6b0211aba401d2fc122070ba2f ("hrtimer: Re-arrange hrtimer_interrupt()")
https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git sched/hrtick


testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: timermix
	cpufreq_governor: performance



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202603102229.74b9dee4-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260310/202603102229.74b9dee4-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-icl-2sp8/timermix/stress-ng/60s

commit: 
  8e10f6b81a ("hrtimer: Add hrtimer_rearm tracepoint")
  2889243848 ("hrtimer: Re-arrange hrtimer_interrupt()")

8e10f6b81afbf60e 2889243848560b6b0211aba401d 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    232123 ±  7%     -78.8%      49228 ±  9%  stress-ng.time.involuntary_context_switches
     12201           +11.1%      13550        stress-ng.time.minor_page_faults
      5205           -32.9%       3490 ±  2%  stress-ng.time.percent_of_cpu_this_job_got
      2849           -33.0%       1909 ±  2%  stress-ng.time.system_time
    276.59           -32.7%     186.28 ±  2%  stress-ng.time.user_time
   3067734 ±  5%     +37.1%    4205161 ±  8%  stress-ng.time.voluntary_context_switches
    117087           -38.8%      71712 ±  2%  stress-ng.timermix.CLOCK_BOOTTIME_ticks_per_sec
    117127           -38.8%      71656 ±  2%  stress-ng.timermix.CLOCK_MONOTONIC_ticks_per_sec
    978.58           -39.3%     593.62        stress-ng.timermix.CLOCK_PROCESS_CPUTIME_ID_ticks_per_sec
    117335           -38.7%      71961        stress-ng.timermix.CLOCK_REALTIME_ticks_per_sec
    117066           -38.8%      71645 ±  2%  stress-ng.timermix.CLOCK_TAI_ticks_per_sec
    978.68           -39.3%     593.67        stress-ng.timermix.CLOCK_THREAD_CPUTIME_ID_ticks_per_sec
     10.68 ±  2%     -15.3%       9.05 ± 10%  stress-ng.timermix.ITIMER_PROF_ticks_per_sec
      1263 ±  2%     -35.2%     818.29 ± 52%  stress-ng.timermix.ITIMER_REAL_ticks_per_sec
      9.68 ±  2%     -15.1%       8.21 ± 11%  stress-ng.timermix.ITIMER_VIRTUAL_ticks_per_sec
 1.809e+09           -30.1%  1.264e+09 ±  2%  stress-ng.timermix.ops
  30158157           -30.1%   21078045 ±  2%  stress-ng.timermix.ops_per_sec
     59.00 ± 24%     -42.7%      33.83 ± 27%  perf-c2c.DRAM.local
      2972 ±  9%     +39.3%       4140 ±  6%  uptime.idle
  1.45e+08 ± 11%    +812.5%  1.323e+09 ±  4%  cpuidle..time
   2492037 ±  7%    +118.6%    5447859 ±  5%  cpuidle..usage
      2.68 ± 28%     +29.9       32.60 ±  5%  mpstat.cpu.all.idle%
     16.10            -4.1       12.04 ±  2%  mpstat.cpu.all.irq%
      0.00 ± 21%      +0.0        0.01 ± 12%  mpstat.cpu.all.soft%
     72.82           -23.7       49.15 ±  2%  mpstat.cpu.all.sys%
      8.39            -2.2        6.20        mpstat.cpu.all.usr%
      5.67 ± 19%    +847.1%      53.67 ±  5%  mpstat.max_utilization.seconds
      5.69 ± 12%    +510.7%      34.76 ±  4%  vmstat.cpu.id
     86.13           -31.3%      59.19 ±  2%  vmstat.cpu.sy
   4175472            +9.8%    4585895 ±  2%  vmstat.memory.cache
     62.71           -32.1%      42.60 ±  2%  vmstat.procs.r
     99312 ±  6%     +36.2%     135233 ±  8%  vmstat.system.cs
  28455658           -29.9%   19958244 ±  3%  vmstat.system.in
      1.58 ±  2%     -99.7%       0.00 ± 46%  perf-sched.sch_delay.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      1.58 ±  2%     -99.7%       0.00 ± 46%  perf-sched.total_sch_delay.average.ms
     88.93 ±  9%     -98.2%       1.61 ± 29%  perf-sched.total_wait_and_delay.average.ms
      6699 ±  9%   +8221.6%     557489 ± 28%  perf-sched.total_wait_and_delay.count.ms
     87.36 ±  9%     -98.2%       1.60 ± 29%  perf-sched.total_wait_time.average.ms
     88.93 ±  9%     -98.2%       1.61 ± 29%  perf-sched.wait_and_delay.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      6699 ±  9%   +8221.6%     557489 ± 28%  perf-sched.wait_and_delay.count.[unknown].[unknown].[unknown].[unknown].[unknown]
     87.36 ±  9%     -98.2%       1.60 ± 29%  perf-sched.wait_time.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      3410           -27.3%       2477 ±  2%  turbostat.Avg_MHz
     96.56           -26.8       69.72 ±  2%  turbostat.Busy%
      3.62 ± 11%     +26.9       30.49 ±  5%  turbostat.C1%
      3.16 ± 13%    +572.0%      21.21 ±  9%  turbostat.CPU%c1
      0.58            +4.9%       0.61        turbostat.IPC
 1.807e+09           -30.4%  1.257e+09 ±  3%  turbostat.IRQ
    113.70 ±  5%     -60.5       53.16 ± 13%  turbostat.PKG_%
    404.64            -8.2%     371.64        turbostat.PkgWatt
      0.02 ± 33%    +114.8%       0.05 ± 17%  perf-stat.i.MPKI
 2.909e+10           -26.6%  2.136e+10 ±  2%  perf-stat.i.branch-instructions
      0.36            +0.4        0.80 ± 12%  perf-stat.i.branch-miss-rate%
  92789452           -13.2%   80563145        perf-stat.i.branch-misses
  13395966 ±  7%     -19.0%   10855385 ±  2%  perf-stat.i.cache-references
    106482 ±  6%     +37.3%     146175 ±  9%  perf-stat.i.context-switches
      1.71            -4.2%       1.63        perf-stat.i.cpi
 2.219e+11           -28.8%   1.58e+11 ±  2%  perf-stat.i.cpu-cycles
      1654 ± 20%     -80.8%     317.81 ±  2%  perf-stat.i.cpu-migrations
 1.294e+11           -26.0%  9.585e+10 ±  2%  perf-stat.i.instructions
      0.59            +5.8%       0.62        perf-stat.i.ipc
      1.68 ±  6%     +30.1%       2.18 ± 10%  perf-stat.i.metric.K/sec
      0.31            +0.1        0.37 ±  2%  perf-stat.overall.branch-miss-rate%
      1.71            -3.7%       1.65        perf-stat.overall.cpi
      0.58            +3.9%       0.61        perf-stat.overall.ipc
 2.864e+10           -25.5%  2.133e+10 ±  2%  perf-stat.ps.branch-instructions
  90036611           -13.5%   77841621        perf-stat.ps.branch-misses
  13516993 ±  6%     -22.0%   10547777 ±  2%  perf-stat.ps.cache-references
    102237 ±  6%     +35.7%     138762 ±  8%  perf-stat.ps.context-switches
 2.184e+11           -27.7%  1.579e+11 ±  2%  perf-stat.ps.cpu-cycles
      1592 ± 19%     -80.8%     304.93 ±  3%  perf-stat.ps.cpu-migrations
 1.275e+11           -24.9%  9.574e+10 ±  2%  perf-stat.ps.instructions
 7.842e+12           -25.2%  5.869e+12 ±  2%  perf-stat.total.instructions
     34.10 ± 12%     -25.9        8.18 ±  3%  perf-profile.calltrace.cycles-pp.sigpending
     29.70 ± 13%     -25.7        3.96 ±  5%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.sigpending
     29.34 ± 14%     -25.7        3.62 ±  6%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.sigpending
     22.76 ± 16%     -22.7        0.10 ±223%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.sigpending
     22.62 ± 16%     -22.5        0.10 ±223%  perf-profile.calltrace.cycles-pp.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.sigpending
     33.06           -16.9       16.21        perf-profile.calltrace.cycles-pp.x64_setup_rt_frame.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
     28.31           -16.0       12.29        perf-profile.calltrace.cycles-pp.get_sigframe.x64_setup_rt_frame.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64
     18.06 ±  2%     -11.2        6.89        perf-profile.calltrace.cycles-pp.copy_fpstate_to_sigframe.get_sigframe.x64_setup_rt_frame.arch_do_signal_or_restart.exit_to_user_mode_loop
      8.72 ±  3%      -8.7        0.00        perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.copy_fpstate_to_sigframe.get_sigframe.x64_setup_rt_frame.arch_do_signal_or_restart
      4.88 ±  4%      -1.7        3.15        perf-profile.calltrace.cycles-pp.save_xstate_epilog.get_sigframe.x64_setup_rt_frame.arch_do_signal_or_restart.exit_to_user_mode_loop
      1.72 ±  2%      -1.4        0.28 ±100%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.get_sigframe.x64_setup_rt_frame.arch_do_signal_or_restart.exit_to_user_mode_loop
      7.86 ± 10%      -1.0        6.84        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
      7.57 ± 10%      -1.0        6.57        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.78 ±  3%      -1.0        0.79        perf-profile.calltrace.cycles-pp.__get_user_nocheck_8.copy_fpstate_to_sigframe.get_sigframe.x64_setup_rt_frame.arch_do_signal_or_restart
     18.06            -0.7       17.32        perf-profile.calltrace.cycles-pp.stress_timermix_timer_action
      6.24            -0.4        5.81        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.stress_timermix_timer_action
      6.20            -0.4        5.77        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_timermix_timer_action
      5.58            -0.4        5.16        perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_timermix_timer_action
      0.97 ± 23%      -0.4        0.56        perf-profile.calltrace.cycles-pp.__put_user_nocheck_8.copy_fpstate_to_sigframe.get_sigframe.x64_setup_rt_frame.arch_do_signal_or_restart
      5.33            -0.4        4.92        perf-profile.calltrace.cycles-pp.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_timermix_timer_action
      0.89 ± 23%      -0.3        0.55        perf-profile.calltrace.cycles-pp.__put_user_nocheck_4.copy_fpstate_to_sigframe.get_sigframe.x64_setup_rt_frame.arch_do_signal_or_restart
      6.23            -0.3        5.90        perf-profile.calltrace.cycles-pp.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.36            -0.3        3.06        perf-profile.calltrace.cycles-pp.fpu__clear_user_states.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.94            -0.1        1.82        perf-profile.calltrace.cycles-pp.clear_bhb_loop
      1.52 ±  5%      -0.1        1.40        perf-profile.calltrace.cycles-pp.restore_sigcontext.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.62            -0.1        1.52        perf-profile.calltrace.cycles-pp.__get_user_nocheck_8.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.16            -0.1        2.08        perf-profile.calltrace.cycles-pp.__x64_sys_rt_sigpending.do_syscall_64.entry_SYSCALL_64_after_hwframe.sigpending
      2.64            -0.1        2.58        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.stress_timermix_timer_action
      1.98            -0.1        1.92        perf-profile.calltrace.cycles-pp.clear_bhb_loop.sigpending
      0.99            -0.1        0.94        perf-profile.calltrace.cycles-pp.set_current_blocked.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.30            -0.0        1.25        perf-profile.calltrace.cycles-pp.signal_setup_done.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.64 ±  2%      -0.0        0.60        perf-profile.calltrace.cycles-pp.fpregs_mark_activate.fpu__clear_user_states.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64
      1.12            -0.0        1.08        perf-profile.calltrace.cycles-pp._copy_from_user.restore_sigcontext.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.56            -0.0        0.54        perf-profile.calltrace.cycles-pp.arch_exit_to_user_mode_prepare.do_syscall_64.entry_SYSCALL_64_after_hwframe.sigpending
      0.64 ±  9%      +0.1        0.77        perf-profile.calltrace.cycles-pp.__get_user_nocheck_8.save_xstate_epilog.get_sigframe.x64_setup_rt_frame.arch_do_signal_or_restart
      0.59 ±  9%      +0.3        0.92 ± 10%  perf-profile.calltrace.cycles-pp._copy_to_user.copy_siginfo_to_user.x64_setup_rt_frame.arch_do_signal_or_restart.exit_to_user_mode_loop
      0.36 ± 70%      +0.5        0.84        perf-profile.calltrace.cycles-pp.__hrtimer_start_range_ns.hrtimer_start_range_ns.posixtimer_deliver_signal.dequeue_signal.get_signal
      0.00            +0.5        0.52        perf-profile.calltrace.cycles-pp.native_sched_clock.sched_clock.sched_clock_cpu.irqtime_account_irq.__irq_exit_rcu
      0.00            +0.6        0.57        perf-profile.calltrace.cycles-pp.__put_user_nocheck_8.save_xstate_epilog.get_sigframe.x64_setup_rt_frame.arch_do_signal_or_restart
      0.00            +0.6        0.57 ±  6%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.6        0.57 ±  2%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop
      0.00            +0.6        0.58        perf-profile.calltrace.cycles-pp.__remove_hrtimer.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      0.00            +0.6        0.63        perf-profile.calltrace.cycles-pp.sched_clock.sched_clock_cpu.irqtime_account_irq.__irq_exit_rcu.sysvec_apic_timer_interrupt
      0.08 ±223%      +0.6        0.72        perf-profile.calltrace.cycles-pp.__get_user_nocheck_4.check_xstate_in_sigframe.__fpu_restore_sig.fpu__restore_sig.restore_sigcontext
      0.08 ±223%      +0.6        0.72        perf-profile.calltrace.cycles-pp._raw_spin_lock.posixtimer_deliver_signal.dequeue_signal.get_signal.arch_do_signal_or_restart
      0.00            +0.6        0.65        perf-profile.calltrace.cycles-pp.irqtime_account_irq.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt._raw_spin_unlock_irq.get_signal
      0.00            +0.7        0.71        perf-profile.calltrace.cycles-pp.sched_clock_cpu.irqtime_account_irq.__irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      0.00            +0.8        0.84 ±  2%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64
      0.00            +0.9        0.88        perf-profile.calltrace.cycles-pp.complete_signal.posixtimer_send_sigqueue.posix_timer_fn.__hrtimer_run_queues.hrtimer_interrupt
      0.00            +0.9        0.93        perf-profile.calltrace.cycles-pp.irqtime_account_irq.__irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt._raw_spin_unlock_irq
      0.00            +1.0        0.99        perf-profile.calltrace.cycles-pp.__hrtimer_next_event_base.hrtimer_update_next_event.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      0.00            +1.3        1.27        perf-profile.calltrace.cycles-pp.__irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt._raw_spin_unlock_irq.get_signal
      2.26 ±  3%      +1.3        3.55        perf-profile.calltrace.cycles-pp.posix_timer_fn.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      0.58 ±  8%      +1.4        1.97        perf-profile.calltrace.cycles-pp.native_apic_msr_eoi.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt._raw_spin_unlock_irq
      0.00            +1.5        1.49        perf-profile.calltrace.cycles-pp.hrtimer_update_next_event.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      0.00            +1.6        1.56        perf-profile.calltrace.cycles-pp.ktime_get_update_offsets_now.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      3.64 ±  7%      +1.6        5.29        perf-profile.calltrace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      1.34 ± 17%      +1.7        3.01        perf-profile.calltrace.cycles-pp.clockevents_program_event.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      1.12 ± 25%      +1.7        2.82        perf-profile.calltrace.cycles-pp.posixtimer_send_sigqueue.posix_timer_fn.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt
      4.86 ±  9%      +2.9        7.76        perf-profile.calltrace.cycles-pp.restore_sigcontext.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_timermix_itimer_action
      4.94 ±  9%      +3.0        7.88        perf-profile.calltrace.cycles-pp.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_timermix_itimer_action
      5.12 ±  2%      +7.5       12.62        perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt._raw_spin_unlock_irq
      6.45 ±  2%      +9.1       15.56        perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt._raw_spin_unlock_irq.get_signal
      7.62 ±  2%     +10.4       18.04        perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt._raw_spin_unlock_irq.get_signal.arch_do_signal_or_restart
     12.20 ±  2%     +15.5       27.70        perf-profile.calltrace.cycles-pp._raw_spin_unlock_irq.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64
     25.74           +17.6       43.33        perf-profile.calltrace.cycles-pp.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
     14.91 ±  2%     +18.7       33.65        perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt._raw_spin_unlock_irq.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop
     36.59 ±  8%     +24.4       60.98        perf-profile.calltrace.cycles-pp.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_timermix_itimer_action
     36.80 ±  8%     +24.6       61.39        perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_timermix_itimer_action
     41.81 ±  8%     +27.6       69.41        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_timermix_itimer_action
     41.82 ±  8%     +27.6       69.43        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.stress_timermix_itimer_action
     41.91 ±  8%     +27.7       69.58        perf-profile.calltrace.cycles-pp.stress_timermix_itimer_action
     34.62 ± 11%     -25.9        8.69 ±  2%  perf-profile.children.cycles-pp.sigpending
     33.66           -17.0       16.63        perf-profile.children.cycles-pp.x64_setup_rt_frame
     29.22           -16.6       12.66        perf-profile.children.cycles-pp.get_sigframe
     19.90           -12.6        7.28        perf-profile.children.cycles-pp.copy_fpstate_to_sigframe
      5.40 ±  2%      -2.1        3.32        perf-profile.children.cycles-pp.save_xstate_epilog
      5.00            -1.8        3.17        perf-profile.children.cycles-pp.__get_user_nocheck_8
      2.42 ±  2%      -1.2        1.18        perf-profile.children.cycles-pp.__put_user_nocheck_4
      2.31            -1.1        1.18        perf-profile.children.cycles-pp.__put_user_nocheck_8
     13.88            -0.7       13.23        perf-profile.children.cycles-pp.stress_timermix_timer_action
      1.23            -0.6        0.61        perf-profile.children.cycles-pp.rep_stos_alternative
     14.48            -0.5       14.01        perf-profile.children.cycles-pp.__x64_sys_rt_sigreturn
      0.97 ±  2%      -0.4        0.59        perf-profile.children.cycles-pp.__local_bh_enable_ip
      3.58 ±  2%      -0.3        3.25        perf-profile.children.cycles-pp.fpu__clear_user_states
      0.57            -0.3        0.30 ±  5%  perf-profile.children.cycles-pp.fpu__alloc_mathframe
      9.50            -0.2        9.26        perf-profile.children.cycles-pp.restore_sigcontext
      6.77            -0.2        6.58        perf-profile.children.cycles-pp.clockevents_program_event
      7.79            -0.2        7.61        perf-profile.children.cycles-pp.fpu__restore_sig
      8.73            -0.2        8.55        perf-profile.children.cycles-pp.native_irq_return_iret
      3.97            -0.2        3.79        perf-profile.children.cycles-pp.clear_bhb_loop
      9.92            -0.2        9.77        perf-profile.children.cycles-pp.dequeue_signal
      0.26 ±  4%      -0.1        0.11 ±  4%  perf-profile.children.cycles-pp.get_xsave_addr_user
      5.33            -0.1        5.21        perf-profile.children.cycles-pp.restore_fpregs_from_user
      2.60            -0.1        2.50        perf-profile.children.cycles-pp.native_apic_msr_eoi
      4.09            -0.1        3.99        perf-profile.children.cycles-pp.posix_timer_fn
      8.64            -0.1        8.54        perf-profile.children.cycles-pp.posixtimer_deliver_signal
      4.40            -0.1        4.30        perf-profile.children.cycles-pp.__restore_fpregs_from_user
      3.34            -0.1        3.25        perf-profile.children.cycles-pp.posixtimer_send_sigqueue
      1.90            -0.1        1.83        perf-profile.children.cycles-pp.irqtime_account_irq
      6.10            -0.1        6.03        perf-profile.children.cycles-pp.__hrtimer_run_queues
      2.29            -0.1        2.22        perf-profile.children.cycles-pp.__x64_sys_rt_sigpending
      0.79            -0.1        0.71        perf-profile.children.cycles-pp.ktime_expiry_to_cycles
      1.56            -0.1        1.49        perf-profile.children.cycles-pp.__irq_exit_rcu
      1.06            -0.1        1.00        perf-profile.children.cycles-pp.set_current_blocked
      2.09            -0.1        2.03        perf-profile.children.cycles-pp._raw_spin_lock_irq
      3.47            -0.1        3.40        perf-profile.children.cycles-pp.its_return_thunk
      2.25            -0.1        2.20        perf-profile.children.cycles-pp.__fpu_restore_sig
      1.20 ±  2%      -0.1        1.14        perf-profile.children.cycles-pp.recalc_sigpending
      1.39            -0.1        1.34        perf-profile.children.cycles-pp.signal_setup_done
      1.45            -0.1        1.40        perf-profile.children.cycles-pp.sched_clock_cpu
      2.14            -0.0        2.09        perf-profile.children.cycles-pp._copy_from_user
      2.07            -0.0        2.02        perf-profile.children.cycles-pp.check_xstate_in_sigframe
      1.09            -0.0        1.04        perf-profile.children.cycles-pp.fpregs_mark_activate
      1.50            -0.0        1.46        perf-profile.children.cycles-pp.common_hrtimer_rearm
      2.08            -0.0        2.04        perf-profile.children.cycles-pp.entry_SYSCALL_64
      1.27            -0.0        1.23        perf-profile.children.cycles-pp.sched_clock
      0.47 ±  2%      -0.0        0.44 ±  2%  perf-profile.children.cycles-pp.collect_signal
      1.09            -0.0        1.06        perf-profile.children.cycles-pp.complete_signal
      0.77            -0.0        0.74        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.77            -0.0        0.74        perf-profile.children.cycles-pp.__get_user_nocheck_4
      1.05            -0.0        1.03        perf-profile.children.cycles-pp.arch_exit_to_user_mode_prepare
      0.70            -0.0        0.68        perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      0.45            -0.0        0.43        perf-profile.children.cycles-pp.ktime_get_with_offset
      0.31            -0.0        0.29        perf-profile.children.cycles-pp.__check_object_size
      0.22 ±  2%      -0.0        0.21 ±  2%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.22            -0.0        0.21        perf-profile.children.cycles-pp.__irqentry_text_end
      0.22            -0.0        0.21        perf-profile.children.cycles-pp._raw_spin_unlock
      0.16 ±  2%      +0.0        0.18 ±  2%  perf-profile.children.cycles-pp.rb_erase
      0.10 ±  3%      +0.0        0.12 ±  4%  perf-profile.children.cycles-pp.tick_nohz_handler
      0.00            +0.1        0.09        perf-profile.children.cycles-pp.__hrtimer_reprogram
      0.00            +0.4        0.44 ± 12%  perf-profile.children.cycles-pp.poll_idle
      0.00            +0.5        0.48 ± 11%  perf-profile.children.cycles-pp.cpuidle_enter_state
      0.00            +0.5        0.48 ± 11%  perf-profile.children.cycles-pp.cpuidle_enter
      0.00            +0.5        0.48 ±  9%  perf-profile.children.cycles-pp.start_secondary
      0.00            +0.5        0.48 ± 11%  perf-profile.children.cycles-pp.cpuidle_idle_call
      0.00            +0.5        0.49 ± 11%  perf-profile.children.cycles-pp.common_startup_64
      0.00            +0.5        0.49 ± 11%  perf-profile.children.cycles-pp.cpu_startup_entry
      0.00            +0.5        0.49 ± 11%  perf-profile.children.cycles-pp.do_idle
      0.56            +0.6        1.17        perf-profile.children.cycles-pp.__hrtimer_next_event_base
      0.88            +0.9        1.80        perf-profile.children.cycles-pp.ktime_get_update_offsets_now
      0.85            +0.9        1.78        perf-profile.children.cycles-pp.hrtimer_update_next_event
     27.92            +1.3       29.20        perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
     18.65            +1.5       20.16        perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
     15.68            +1.6       17.32        perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
     12.58            +1.6       14.22        perf-profile.children.cycles-pp.hrtimer_interrupt
     14.73           +17.1       31.82        perf-profile.children.cycles-pp._raw_spin_unlock_irq
     26.30           +17.5       43.81        perf-profile.children.cycles-pp.get_signal
     41.91 ±  8%     +27.7       69.58        perf-profile.children.cycles-pp.stress_timermix_itimer_action
      6.86            -2.3        4.53        perf-profile.self.cycles-pp.copy_fpstate_to_sigframe
      3.61            -0.6        3.00        perf-profile.self.cycles-pp.__get_user_nocheck_8
      1.78            -0.4        1.36        perf-profile.self.cycles-pp.get_sigframe
      1.46            -0.4        1.09        perf-profile.self.cycles-pp.__put_user_nocheck_4
      1.58 ±  3%      -0.4        1.23        perf-profile.self.cycles-pp.save_xstate_epilog
      1.44            -0.3        1.10        perf-profile.self.cycles-pp.__put_user_nocheck_8
      2.93            -0.2        2.73        perf-profile.self.cycles-pp.fpu__clear_user_states
      8.72            -0.2        8.54        perf-profile.self.cycles-pp.native_irq_return_iret
      3.93            -0.2        3.75        perf-profile.self.cycles-pp.clear_bhb_loop
      0.57            -0.2        0.39 ±  2%  perf-profile.self.cycles-pp.rep_stos_alternative
      6.00            -0.1        5.88        perf-profile.self.cycles-pp.clockevents_program_event
      0.63            -0.1        0.52        perf-profile.self.cycles-pp.__local_bh_enable_ip
      2.58            -0.1        2.48        perf-profile.self.cycles-pp.native_apic_msr_eoi
      4.36            -0.1        4.27        perf-profile.self.cycles-pp.__restore_fpregs_from_user
      0.73            -0.1        0.66        perf-profile.self.cycles-pp.ktime_expiry_to_cycles
      0.29            -0.1        0.22 ±  2%  perf-profile.self.cycles-pp.fpu__alloc_mathframe
      1.96            -0.1        1.90        perf-profile.self.cycles-pp._raw_spin_lock_irq
      2.09            -0.0        2.04        perf-profile.self.cycles-pp._copy_from_user
      0.12 ±  5%      -0.0        0.07 ±  6%  perf-profile.self.cycles-pp.get_xsave_addr_user
      0.52            -0.0        0.48        perf-profile.self.cycles-pp.__x64_sys_rt_sigreturn
      0.87            -0.0        0.83        perf-profile.self.cycles-pp.fpregs_mark_activate
      1.27            -0.0        1.23        perf-profile.self.cycles-pp.sigpending
      0.73            -0.0        0.70        perf-profile.self.cycles-pp.copy_siginfo_to_user
      1.21            -0.0        1.18        perf-profile.self.cycles-pp.do_syscall_64
      0.45 ±  2%      -0.0        0.42 ±  2%  perf-profile.self.cycles-pp.collect_signal
      0.41            -0.0        0.38        perf-profile.self.cycles-pp.sysvec_apic_timer_interrupt
      0.75            -0.0        0.72        perf-profile.self.cycles-pp.__get_user_nocheck_4
      0.81            -0.0        0.78        perf-profile.self.cycles-pp.posixtimer_send_sigqueue
      0.44            -0.0        0.41        perf-profile.self.cycles-pp.irqtime_account_irq
      0.31 ±  2%      -0.0        0.28        perf-profile.self.cycles-pp.__irq_exit_rcu
      0.74            -0.0        0.72        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.51            -0.0        0.49        perf-profile.self.cycles-pp.error_entry
      0.55            -0.0        0.53        perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.38            -0.0        0.36        perf-profile.self.cycles-pp.restore_fpregs_from_user
      0.49            -0.0        0.47        perf-profile.self.cycles-pp.restore_sigcontext
      0.46            -0.0        0.44        perf-profile.self.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.34            -0.0        0.33        perf-profile.self.cycles-pp.__sysvec_apic_timer_interrupt
      0.44            -0.0        0.42        perf-profile.self.cycles-pp.ktime_get_with_offset
      0.77            -0.0        0.75        perf-profile.self.cycles-pp.posixtimer_deliver_signal
      0.22            -0.0        0.20 ±  2%  perf-profile.self.cycles-pp.sched_clock
      0.45            -0.0        0.43        perf-profile.self.cycles-pp.__x64_sys_rt_sigpending
      0.22 ±  2%      -0.0        0.21 ±  2%  perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.12            +0.0        0.13 ±  2%  perf-profile.self.cycles-pp.rb_erase
      0.17            +0.0        0.19 ±  2%  perf-profile.self.cycles-pp.hrtimer_reprogram
      0.58            +0.1        0.64        perf-profile.self.cycles-pp.arch_do_signal_or_restart
      0.00            +0.1        0.07        perf-profile.self.cycles-pp.__hrtimer_reprogram
      0.58            +0.1        0.69        perf-profile.self.cycles-pp.hrtimer_interrupt
      1.38            +0.2        1.55        perf-profile.self.cycles-pp.get_signal
      0.26            +0.3        0.55        perf-profile.self.cycles-pp.hrtimer_update_next_event
      0.00            +0.4        0.44 ± 12%  perf-profile.self.cycles-pp.poll_idle
      0.52            +0.5        1.06        perf-profile.self.cycles-pp.__hrtimer_next_event_base
      0.86            +0.9        1.76        perf-profile.self.cycles-pp.ktime_get_update_offsets_now
      4.31            +4.1        8.42        perf-profile.self.cycles-pp._raw_spin_unlock_irq




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

