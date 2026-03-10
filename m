Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D15D27EFFA
	for <oe-lkp@lists.linux.dev>; Tue, 10 Mar 2026 01:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773105240; cv=fail; b=CIBH5TJCR5aw1UBKMCERou1lhwTICcleIR0Aj86iEozpqVhr885eRQhgX75jtAVQu/xZlM8aL71EDW28QQ20C74YLaP3SM9YvzVNSUSJrm8R4UGJJgUM3+hQQnceUqQsubX2xm6KSuVWAb21vNaiqsXOxEc4GjGk4DmJ/HwCycg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773105240; c=relaxed/simple;
	bh=VUY3iblF0zat9bMqKhpYr1JM6gUdBieF4sGQuiPsSM4=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=koUUu+44Au3rb6vLXHvkRg88uJHfJURKXgiCWBAKTwXuZPqKuUtaA/0teowK7RrorRfysvfAVx9QcCZGR/ugztz9x/Ms9gPchpFdszIeRGo7zML/10buG3x76Lfwi3DLEFpisWHTW0q9DwEeh5vVOifxqgmfniJr5tDEUnBadMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YFGTtzlM; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YFGTtzlM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773105237; x=1804641237;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=VUY3iblF0zat9bMqKhpYr1JM6gUdBieF4sGQuiPsSM4=;
  b=YFGTtzlMDud0DszWOZotgq/1GMrBHAbn+ziLaq+FcbhyMCMSzd4PSfWw
   +AJui4m9lfTGHbZgAYA1sg+GcBOMGZPrbtjnKPgYG7bUxno3YtKUgOu0V
   dmfkLl0MjyWBr82EzVpa4idK92mPfwCrUg3y8Ig70EV5T993BGQrtK+b5
   Ii53Oy45VlFjZUJp6Rjhau+42U7v8bTpgmsAjiuwamtz4GIce2t1t4Fku
   /HwUmj4YpozSjjMd2RbykXV9LOBESpfwj5dttrtLCkZbUWiv0jNSPp5rP
   I36RlXmPV0VtM8rA4t0c/KVYwyfMJWo9dr1tZsniFbAKKQ3YVuTRfKXAD
   g==;
X-CSE-ConnectionGUID: pQ/DrOnsT3ytuKaLpS9CkA==
X-CSE-MsgGUID: tYtcR6ZMTHmN6j6pM3lqAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="74060333"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="74060333"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 18:13:56 -0700
X-CSE-ConnectionGUID: mqxihfDhSSy/mVvKJrjvWQ==
X-CSE-MsgGUID: hsHTs5fmRmC0+ml1lQ3I7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="219898923"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 18:13:56 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 18:13:54 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 9 Mar 2026 18:13:54 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.46) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 18:13:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ShOHm4xBH6XMSUEo0IaKQRwTM+DnLT0PPpD0zJHaGfjk+w2SlpY5bzS3R4KIlwpmjigtkfAEdk6sMaW/mKt3mxhfuqIYoJZkgH7KQhW660QKg35zVMlmeqf2HNSZJC/Qr75qGO9yZQvd2RmJgOecc15nDi0cVEBy431tV/vFBHo5He94UaCx7IDEbpxeU9YOD1+IZZLqxhvgQi/WLYfMKCuC8tye44jBm7wUvB8yS3dY5kzWlxT2PwTDMt8ZWM/1gEpOraajXZXJvPpDA/Bim0txwOMXi3FxJiz94c57wwh0PdvJbmHv2z8C9abm9r4XNtpazveYDdKDjwSj/XkCSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gNqyUzJk5+VJjoLWAL+AQNwoeqQKMuRc8neLtsyeW8M=;
 b=RUeJl6uXENCH9ga+WicuTC1syNrpxzagTKScbYhY6H0cq7m14b59Md8YmfUG3eXRLmZn2IQkrxik+Tr/014EwV/SbKulotI3LGbwrFsAKv5ubh4Q4xiybav6FhXAnDtPNsiJ78dI93hJmB7kQQ6X0Zn1LG3A14TJjoN1OPamTxe+GxKzX3iuiUwAWpzRsZu/UCgLl7fmgpa6dODWHH2ItDvYuLJI1E4fma1K3igZgexvV7JBlJnHwF1CDMWGWTG1Ki2ZTsx0DfIV1d2bi1JLrO5XB4W7jCzt67b9/gttFFUR9D27cprcV4Ak93+8mAYCzctSI7qMcbJ9z/rEA632jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB4033.namprd11.prod.outlook.com (2603:10b6:405:78::25)
 by CY5PR11MB6137.namprd11.prod.outlook.com (2603:10b6:930:2b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 01:13:45 +0000
Received: from BN6PR11MB4033.namprd11.prod.outlook.com
 ([fe80::2c28:2983:2947:24b1]) by BN6PR11MB4033.namprd11.prod.outlook.com
 ([fe80::2c28:2983:2947:24b1%6]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 01:13:45 +0000
Date: Tue, 10 Mar 2026 09:13:37 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>, Mario Roy <marioeroy@gmail.com>, "Mohamed Abuelfotoh,
 Hazem" <abuehaze@amazon.com>, <aubrey.li@linux.intel.com>,
	<yu.c.chen@intel.com>, <oliver.sang@intel.com>
Subject: [tip:sched/core] [sched/fair]  9fe89f022c: stress-ng.shm.ops_per_sec
 2.8% regression
Message-ID: <202603091533.5ff6238-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: TP0P295CA0017.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::11) To BN6PR11MB4033.namprd11.prod.outlook.com
 (2603:10b6:405:78::25)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PR11MB4033:EE_|CY5PR11MB6137:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a5f3c87-cd3e-4a75-59c4-08de7e4246b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: T9c6ZumKeDySFRxfSjOWl8LKe7a2w2u7XhQLGa6pvTYxLEcIC6QC1LFUfVcWbHqC8Vz4XbR4ZumQO73ZIdbLgXHwC3GXgoYLkXWLn9T8ePFhbAFxkg5m5rOXG70CEsBvv+X4JX/rEDi+d3O6dHtMCpcrfWcKyi4c+f7oLNYLQXYW+s6H5RhON24v+4Tp5yG0L4G4gHLzc/2jlkt1cEGOkJVMiNCnA30aFhGr4hndQUhqMvaE3RwlGUpE5YNTwOz6lI0cmwSsQkkK0rfzjoNQXYkOgj26GNZg4SnEavQUb+LNWgqHSJQF7GTIfy7Xt7Kqs9CtokAGR+l+bo6QqSWOjUmQl+6Zi+91SI6WDpybvfaESwmIJEfcw3Xgmhz3iBf/3cHvNlUnxrD60Z29ICbri0+B9b02EXImVyuIUeBkOayLdcCSVrD3COwX2qaQgg+evV+fZVMyxAPfj2+k1+orzYOWgmozcTwkGzRO1+xb9ydWBS3PrNR6XQbev1pFJdjFfNdncqvnu/bBMdecz/vh3J/xTvo0T4ulboXI7hv2nF0iwgq76Dbb2cZtDQQX2+5xWzRGy13LiuBAAuZTC9WCLhqydzpMrM0fgAQ3EkBTy5LQiSBPvWe5aUynJLYEQGdfYLXSmFrWBKfW9CgEcj2RUlTgsapK9O20smlgOmeKwxJf+j+h8lGGbJW7f5RQwua5
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB4033.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?KBr8WE6QCALi6BLLMxSnkpQ/hBv69pJDJ0eVB68ZebW6blmpCb/KgR6NZB?=
 =?iso-8859-1?Q?1FBBCHL3ZQmtZuQbHO1Afzk/7dFyhC9tqEQuMr0R2Tx3zxbH9KhYW54eR0?=
 =?iso-8859-1?Q?6I1kPQglX4CwKPs4gzky4DOy1pBphxFQUd51QdZI843joJZyNO8aqGFE35?=
 =?iso-8859-1?Q?11CIlHPEyam8NiOpGFqrYoJOE+dzC1fMvcDo049YVQJitjg4HM5XkWMBnS?=
 =?iso-8859-1?Q?K5UF2vK5elbQEvxD7JRNczVtcp4gqQftd8eejODdNst01E0oIQ0zAVJuBh?=
 =?iso-8859-1?Q?nDRZLY71lAAk6FL0f+CAFh2rM1D//DMTOo1S+K2UdRrTUJLRoH2QnTVU/n?=
 =?iso-8859-1?Q?O3TPzl/zoXqeplgQnwBa+sRFfOY4nklONECtBOkqk6vLPzU+coctOowJ2L?=
 =?iso-8859-1?Q?ksEkqB7BjGvwkH/GcusqmiGz2G9UkqgAJxUa1MmdWZy6/dXb7QFQUIXHjz?=
 =?iso-8859-1?Q?Z09LL9yeKrTOoc6Oqtl4SFNrtCry8vlkXsggHxnbYpZU2l3aE7b/fnyQce?=
 =?iso-8859-1?Q?WWcJ+bFmwW6UQv3RUbo7KUnmq9deE/ajS7l50sRVD2L9lM4A3JMGKdoPnI?=
 =?iso-8859-1?Q?oYkUUTktUhTcv+FsWDjF/gY+JA9cNNHybo4Ng4fX270E3sWjfuUNzsihFP?=
 =?iso-8859-1?Q?GG19zEBJ1awbvVeBu4FksvW33K6Pva0vwogEX3TbA/RxzivKTXUXwZxnG+?=
 =?iso-8859-1?Q?l/iZcMOJ7lgiZdDye+xopvRmL0rIoYVNe23WeitugSki95zR5gsDSoM94u?=
 =?iso-8859-1?Q?Mt9Dq+xfColFLIYv3CAZxVi/ZQ/gU2E8xTL/jaX++MxMOK+epqEzHTbKLO?=
 =?iso-8859-1?Q?mBRzKmCEx+7mUjud+ps8LAFB8dj23GfttKSM/OLrtg1y+nuUDnGhtY9oE6?=
 =?iso-8859-1?Q?WYsjQq7bzGU5OaBtUYlZh6SyMXn360CN7lZWjzs33XiwYHJhxBJQzZCmpk?=
 =?iso-8859-1?Q?7JTHVYP2AuW8PGUki/7nwgKEsFdQNyaTAdd8sUQ8aqJmwYwfEg0wIl2uce?=
 =?iso-8859-1?Q?qHL+2brphY5eyQoKkbaPDyUbCAC+jSa1cmjMc4iVKstHwYHdJhtpragKml?=
 =?iso-8859-1?Q?K2/BfzuUamLqQwF3dQd74grqCJuXOkjOuIDPdyxlM50SDppESCYxgqL5iH?=
 =?iso-8859-1?Q?MkM9c0M09toM5BtrFXdjrHUFp2zd7STb6+ADbuM2YHE8K3k1sWvCGD8NiA?=
 =?iso-8859-1?Q?VPcJlHfShRZboCK1MRdWzRW1T2tUZ+7y2CmZAjQmv8OlM0li2k1Ol5B6Ry?=
 =?iso-8859-1?Q?HBt/gMkdaoeX5jPPYk/X1SZ5k+u+zfb2QT4LzV530NNj/ibkGDg++ddo+2?=
 =?iso-8859-1?Q?EooVL74oBHfw0Qzm9gNKV1W/BKFjjliCJwKgmTjb2IePWWx197h3CTncry?=
 =?iso-8859-1?Q?kyIq94j+kRQF8ZmXuaS7E4i9v4aVxhNtRwY9BVhC7skHx0DV8SmrDUpcjt?=
 =?iso-8859-1?Q?LwbQSr9VYCjB0nMWpRNTn5mG1swdaPm79NzdFk3DvYNhNRWZqy3wMDvHGE?=
 =?iso-8859-1?Q?4IT6EQTQjvGFRbPufYuNcfBeSLWcGPkj/5Pl7kTaWl1Isw40JL9PZTzq9s?=
 =?iso-8859-1?Q?qraVRxLWJEZO4i8u0R7XOSpiQyEKQQKAlvBgeTgLRxnyiA+TIUsjrbwBc2?=
 =?iso-8859-1?Q?pnEuWLPbbUKqKnCEnYi3tepfKQsCEyicmF/rWhzVGC1d/Twwh340f7qhGb?=
 =?iso-8859-1?Q?gYVQr85b6yOTG/8vFA+EkJkv82ZotM4y2VCX4FhxKXigN/YLTYmvmembVv?=
 =?iso-8859-1?Q?th/pbRso1aAOXDCN1/ZzdVgY3Ez52EF7nSLXe3oIY5U2l0orOxuNqI0kJY?=
 =?iso-8859-1?Q?dIrM4eOOMw=3D=3D?=
X-Exchange-RoutingPolicyChecked: TULdY2hRsnKWni4OUP3Bs1yPPLj51MVrTIVGc4VESfG3jCTBBS5+L0Sax3uG+RXEbcjyiIB1GzTGuKu3U+bd0GcSuKcADLlvqNAhwnHS9X5gV0aGA7pOjBeRO8AA5Vm0+Q6EZ75IICXDbBA10OiZQiG/G/u4WNysLGE636frd4Vw+E9WjFdC4DwsXZD8NBgTpX+VaeeDputK4X16FxXshh+t2qVduq0SYiJTlBg3VoWfRab1WolnTmC1lnJ5Uibr4oNHqO2zzgpgJJfU+DdciycWCWbPYtaaWUPljp0v2M8bXeR4R4B/Fo0kVizUiERX6rqXKzDhI7xJNiIcgRDqtw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a5f3c87-cd3e-4a75-59c4-08de7e4246b9
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB4033.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 01:13:45.6009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RDsPNH+sZ8U+MAwyMgVeblBQASfqFh2+YaaGqIbm0D5x3/IU3Ix6K22DYSDumQrFcAU3kN+gPMe544AvuMrrUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6137
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 2.8% regression of stress-ng.shm.ops_per_sec on:


commit: 9fe89f022c05d99c052d6bc088b82d4ff83bf463 ("sched/fair: More complex proportional newidle balance")
https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git sched/core

testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 192 threads 2 sockets Intel(R) Xeon(R) 6740E  CPU @ 2.4GHz (Sierra Forest) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: shm
	cpufreq_governor: performance


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202603091533.5ff6238-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260309/202603091533.5ff6238-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-srf-2sp3/shm/stress-ng/60s

commit: 
  3b68df9781 ("rseq: slice ext: Ensure rseq feature size differs from original rseq size")
  9fe89f022c ("sched/fair: More complex proportional newidle balance")

3b68df978133ac3d 9fe89f022c05d99c052d6bc088b 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
   1311128            -2.8%    1274240        stress-ng.shm.ops
     21868            -2.8%      21253        stress-ng.shm.ops_per_sec
   2855521            -6.5%    2669677        stress-ng.time.involuntary_context_switches
 3.642e+08            -2.9%  3.538e+08        stress-ng.time.minor_page_faults
   3129464            -1.0%    3097974        stress-ng.time.voluntary_context_switches
   1478057           -11.1%    1314061        cpuidle..usage
      0.29            +0.1        0.36 ±  3%  mpstat.cpu.all.soft%
     38.74            -1.2%      38.29        turbostat.RAMWatt
    148897            -5.6%     140512        vmstat.system.cs
      0.12           -20.2%       0.10        perf-sched.sch_delay.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
      0.12           -20.2%       0.10        perf-sched.total_sch_delay.average.ms
    713793            -5.3%     676066        perf-sched.total_wait_and_delay.count.ms
    713793            -5.3%     676066        perf-sched.wait_and_delay.count.[unknown].[unknown].[unknown].[unknown].[unknown]
 3.426e+10            -1.7%  3.367e+10        perf-stat.i.branch-instructions
      0.23            +0.0        0.24        perf-stat.i.branch-miss-rate%
  77812969            +3.1%   80201846        perf-stat.i.branch-misses
 1.273e+09            -1.7%  1.252e+09        perf-stat.i.cache-misses
 2.059e+09            -2.2%  2.014e+09        perf-stat.i.cache-references
    154818            -5.6%     146154        perf-stat.i.context-switches
      3.35            +2.1%       3.42        perf-stat.i.cpi
     13618           +45.6%      19821        perf-stat.i.cpu-migrations
    450.98            +2.0%     459.92        perf-stat.i.cycles-between-cache-misses
 1.715e+11            -1.8%  1.684e+11        perf-stat.i.instructions
      0.30            -2.1%       0.29        perf-stat.i.ipc
     64.33            -2.4%      62.78        perf-stat.i.metric.K/sec
   6175905            -2.4%    6025197        perf-stat.i.minor-faults
   6175906            -2.4%    6025199        perf-stat.i.page-faults
      0.23            +0.0        0.24        perf-stat.overall.branch-miss-rate%
      3.36            +2.2%       3.43        perf-stat.overall.cpi
    452.14            +2.0%     461.22        perf-stat.overall.cycles-between-cache-misses
      0.30            -2.1%       0.29        perf-stat.overall.ipc
  75143235            +4.4%   78447635        perf-stat.ps.branch-misses
    149715            -4.4%     143121        perf-stat.ps.context-switches
 1.856e+11            +1.3%   1.88e+11        perf-stat.ps.cpu-clock
 5.572e+11            +1.6%   5.66e+11        perf-stat.ps.cpu-cycles
     13181           +47.7%      19471        perf-stat.ps.cpu-migrations
 1.856e+11            +1.3%   1.88e+11        perf-stat.ps.task-clock
     10.74            -0.3       10.41        perf-profile.calltrace.cycles-pp._Fork.stress_run
     10.43            -0.3       10.14        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe._Fork.stress_run
     10.43            -0.3       10.14        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe._Fork.stress_run
     10.43            -0.3       10.14        perf-profile.calltrace.cycles-pp.__do_sys_clone.do_syscall_64.entry_SYSCALL_64_after_hwframe._Fork.stress_run
     10.42            -0.3       10.13        perf-profile.calltrace.cycles-pp.kernel_clone.__do_sys_clone.do_syscall_64.entry_SYSCALL_64_after_hwframe._Fork
      9.90            -0.3        9.63        perf-profile.calltrace.cycles-pp.dup_mm.copy_process.kernel_clone.__do_sys_clone.do_syscall_64
     10.22            -0.3        9.94        perf-profile.calltrace.cycles-pp.copy_process.kernel_clone.__do_sys_clone.do_syscall_64.entry_SYSCALL_64_after_hwframe
     36.50            -0.3       36.23        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
     36.50            -0.3       36.23        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
      9.50            -0.3        9.23        perf-profile.calltrace.cycles-pp.dup_mmap.dup_mm.copy_process.kernel_clone.__do_sys_clone
     20.39            -0.3       20.13        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.__page_cache_release.folios_put_refs.shmem_undo_range
     12.04            -0.2       11.86        perf-profile.calltrace.cycles-pp.__mmput.exit_mm.do_exit.do_group_exit.__x64_sys_exit_group
     12.04            -0.2       11.87        perf-profile.calltrace.cycles-pp.exit_mm.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
     12.02            -0.2       11.84        perf-profile.calltrace.cycles-pp.exit_mmap.__mmput.exit_mm.do_exit.do_group_exit
      8.07            -0.2        7.90        perf-profile.calltrace.cycles-pp.folio_lruvec_lock_irqsave.folio_batch_move_lru.__folio_batch_add_and_move.set_pte_range.finish_fault
      8.07            -0.2        7.90        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.folio_lruvec_lock_irqsave.folio_batch_move_lru.__folio_batch_add_and_move.set_pte_range
      9.67            -0.2        9.50        perf-profile.calltrace.cycles-pp.__x64_sys_fallocate.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      9.67            -0.2        9.50        perf-profile.calltrace.cycles-pp.vfs_fallocate.__x64_sys_fallocate.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      9.67            -0.2        9.51        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      9.67            -0.2        9.51        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.syscall
      3.70            -0.2        3.54 ±  2%  perf-profile.calltrace.cycles-pp.anon_vma_fork.dup_mmap.dup_mm.copy_process.kernel_clone
      9.67            -0.2        9.51        perf-profile.calltrace.cycles-pp.syscall
      2.85            -0.1        2.72        perf-profile.calltrace.cycles-pp.anon_vma_clone.anon_vma_fork.dup_mmap.dup_mm.copy_process
      2.76            -0.1        2.63        perf-profile.calltrace.cycles-pp.free_pgtables.exit_mmap.__mmput.exit_mm.do_exit
      2.14            -0.1        2.04        perf-profile.calltrace.cycles-pp.unlink_anon_vmas.free_pgtables.exit_mmap.__mmput.exit_mm
      2.32            -0.1        2.24        perf-profile.calltrace.cycles-pp.copy_mc_enhanced_fast_string.do_fault.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      1.22            -0.1        1.16        perf-profile.calltrace.cycles-pp.anon_vma_interval_tree_insert.anon_vma_clone.anon_vma_fork.dup_mmap.dup_mm
      2.20            -0.0        2.15        perf-profile.calltrace.cycles-pp.shmem_setattr.notify_change.do_truncate.do_ftruncate.do_sys_ftruncate
      1.46            -0.0        1.42        perf-profile.calltrace.cycles-pp.__x64_sys_madvise.do_syscall_64.entry_SYSCALL_64_after_hwframe.__madvise.stress_run
      1.46            -0.0        1.42        perf-profile.calltrace.cycles-pp.do_madvise.__x64_sys_madvise.do_syscall_64.entry_SYSCALL_64_after_hwframe.__madvise
      1.22            -0.0        1.19        perf-profile.calltrace.cycles-pp.faultin_page_range.madvise_do_behavior.do_madvise.__x64_sys_madvise.do_syscall_64
      1.06            -0.0        1.03        perf-profile.calltrace.cycles-pp.handle_mm_fault.__get_user_pages.faultin_page_range.madvise_do_behavior.do_madvise
      1.09            -0.0        1.06        perf-profile.calltrace.cycles-pp.__get_user_pages.faultin_page_range.madvise_do_behavior.do_madvise.__x64_sys_madvise
      1.46            -0.0        1.43        perf-profile.calltrace.cycles-pp.__madvise.stress_run
      1.46            -0.0        1.42        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__madvise.stress_run
      0.64            -0.0        0.61        perf-profile.calltrace.cycles-pp.__anon_vma_interval_tree_remove.unlink_anon_vmas.free_pgtables.exit_mmap.__mmput
      1.06            -0.0        1.03        perf-profile.calltrace.cycles-pp.__handle_mm_fault.handle_mm_fault.__get_user_pages.faultin_page_range.madvise_do_behavior
      1.45            -0.0        1.42        perf-profile.calltrace.cycles-pp.madvise_do_behavior.do_madvise.__x64_sys_madvise.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.46            -0.0        1.43        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__madvise.stress_run
      1.04            -0.0        1.02        perf-profile.calltrace.cycles-pp.do_fault.__handle_mm_fault.handle_mm_fault.__get_user_pages.faultin_page_range
      0.56            +0.1        0.61        perf-profile.calltrace.cycles-pp.unmap_page_range.unmap_vmas.unmap_region.vms_complete_munmap_vmas.do_vmi_align_munmap
      0.56            +0.1        0.62        perf-profile.calltrace.cycles-pp.unmap_vmas.unmap_region.vms_complete_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap
      0.56            +0.1        0.61        perf-profile.calltrace.cycles-pp.zap_pmd_range.unmap_page_range.unmap_vmas.unmap_region.vms_complete_munmap_vmas
      0.56            +0.1        0.61        perf-profile.calltrace.cycles-pp.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_vmas.unmap_region
      0.56 ±  3%      +0.2        0.78 ±  7%  perf-profile.calltrace.cycles-pp.rmqueue.get_page_from_freelist.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_mpol_noprof
      0.66 ±  2%      +0.2        0.89 ±  6%  perf-profile.calltrace.cycles-pp.shmem_alloc_folio.shmem_alloc_and_add_folio.shmem_get_folio_gfp.shmem_fallocate.vfs_fallocate
      0.63 ±  2%      +0.2        0.86 ±  6%  perf-profile.calltrace.cycles-pp.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_mpol_noprof.shmem_alloc_folio.shmem_alloc_and_add_folio
      0.65 ±  2%      +0.2        0.88 ±  6%  perf-profile.calltrace.cycles-pp.folio_alloc_mpol_noprof.shmem_alloc_folio.shmem_alloc_and_add_folio.shmem_get_folio_gfp.shmem_fallocate
      0.60 ±  3%      +0.2        0.84 ±  7%  perf-profile.calltrace.cycles-pp.get_page_from_freelist.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_mpol_noprof.shmem_alloc_folio
      0.64 ±  2%      +0.2        0.88 ±  6%  perf-profile.calltrace.cycles-pp.alloc_pages_mpol.folio_alloc_mpol_noprof.shmem_alloc_folio.shmem_alloc_and_add_folio.shmem_get_folio_gfp
      0.61 ±  3%      +0.3        0.87 ±  7%  perf-profile.calltrace.cycles-pp.vma_alloc_folio_noprof.do_fault.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      0.58 ±  3%      +0.3        0.84 ±  7%  perf-profile.calltrace.cycles-pp.__alloc_frozen_pages_noprof.alloc_pages_mpol.vma_alloc_folio_noprof.do_fault.__handle_mm_fault
      0.60 ±  3%      +0.3        0.85 ±  7%  perf-profile.calltrace.cycles-pp.alloc_pages_mpol.vma_alloc_folio_noprof.do_fault.__handle_mm_fault.handle_mm_fault
      0.54 ±  3%      +0.3        0.80 ±  7%  perf-profile.calltrace.cycles-pp.get_page_from_freelist.__alloc_frozen_pages_noprof.alloc_pages_mpol.vma_alloc_folio_noprof.do_fault
     11.28            +0.4       11.66        perf-profile.calltrace.cycles-pp.__tlb_batch_free_encoded_pages.tlb_finish_mmu.unmap_region.vms_complete_munmap_vmas.do_vmi_align_munmap
     11.26            +0.4       11.65        perf-profile.calltrace.cycles-pp.folios_put_refs.free_pages_and_swap_cache.__tlb_batch_free_encoded_pages.tlb_finish_mmu.unmap_region
     11.28            +0.4       11.66        perf-profile.calltrace.cycles-pp.free_pages_and_swap_cache.__tlb_batch_free_encoded_pages.tlb_finish_mmu.unmap_region.vms_complete_munmap_vmas
     11.29            +0.4       11.68        perf-profile.calltrace.cycles-pp.tlb_finish_mmu.unmap_region.vms_complete_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap
     12.01            +0.4       12.44        perf-profile.calltrace.cycles-pp.__munmap.stress_run
     11.97            +0.4       12.41        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap.stress_run
     11.96            +0.4       12.40        perf-profile.calltrace.cycles-pp.__vm_munmap.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
     11.96            +0.4       12.40        perf-profile.calltrace.cycles-pp.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap.stress_run
     11.95            +0.4       12.39        perf-profile.calltrace.cycles-pp.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap.__x64_sys_munmap.do_syscall_64
     11.87            +0.4       12.31        perf-profile.calltrace.cycles-pp.unmap_region.vms_complete_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap
     11.96            +0.4       12.40        perf-profile.calltrace.cycles-pp.do_vmi_munmap.__vm_munmap.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe
     11.97            +0.4       12.41        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__munmap.stress_run
     11.88            +0.4       12.33        perf-profile.calltrace.cycles-pp.vms_complete_munmap_vmas.do_vmi_align_munmap.do_vmi_munmap.__vm_munmap.__x64_sys_munmap
     51.72            +0.5       52.20        perf-profile.calltrace.cycles-pp.stress_run
     11.08            +0.5       11.57        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink.stress_run
     11.08            +0.5       11.57        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.unlink.stress_run
     11.08            +0.5       11.57        perf-profile.calltrace.cycles-pp.unlink.stress_run
     11.07            +0.5       11.57        perf-profile.calltrace.cycles-pp.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink.stress_run
     10.98            +0.5       11.48        perf-profile.calltrace.cycles-pp.evict.filename_unlinkat.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe
     10.98            +0.5       11.47        perf-profile.calltrace.cycles-pp.shmem_evict_inode.evict.filename_unlinkat.__x64_sys_unlink.do_syscall_64
     10.96            +0.5       11.46        perf-profile.calltrace.cycles-pp.shmem_undo_range.shmem_evict_inode.evict.filename_unlinkat.__x64_sys_unlink
     11.07            +0.5       11.57        perf-profile.calltrace.cycles-pp.filename_unlinkat.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink
     10.22            +0.5       10.72        perf-profile.calltrace.cycles-pp.folios_put_refs.shmem_undo_range.shmem_evict_inode.evict.filename_unlinkat
      0.00            +0.7        0.70 ±  8%  perf-profile.calltrace.cycles-pp.rmqueue.get_page_from_freelist.__alloc_frozen_pages_noprof.alloc_pages_mpol.vma_alloc_folio_noprof
      0.00            +0.8        0.76 ± 20%  perf-profile.calltrace.cycles-pp.free_unref_folios.folios_put_refs.free_pages_and_swap_cache.__tlb_batch_free_encoded_pages.tlb_finish_mmu
      0.00            +0.8        0.84 ± 18%  perf-profile.calltrace.cycles-pp.free_pcppages_bulk.free_frozen_page_commit.free_unref_folios.folios_put_refs.shmem_undo_range
      0.00            +0.9        0.90 ± 18%  perf-profile.calltrace.cycles-pp.free_frozen_page_commit.free_unref_folios.folios_put_refs.shmem_undo_range.shmem_evict_inode
      0.00            +0.9        0.94 ± 17%  perf-profile.calltrace.cycles-pp.free_unref_folios.folios_put_refs.shmem_undo_range.shmem_evict_inode.evict
      0.18 ±141%      +1.2        1.39 ±  8%  perf-profile.calltrace.cycles-pp.__rmqueue_pcplist.rmqueue.get_page_from_freelist.__alloc_frozen_pages_noprof.alloc_pages_mpol
     10.82            -0.3       10.49        perf-profile.children.cycles-pp._Fork
     10.43            -0.3       10.13        perf-profile.children.cycles-pp.kernel_clone
     10.43            -0.3       10.14        perf-profile.children.cycles-pp.__do_sys_clone
      9.90            -0.3        9.63        perf-profile.children.cycles-pp.dup_mm
     10.22            -0.3        9.94        perf-profile.children.cycles-pp.copy_process
      9.50            -0.3        9.24        perf-profile.children.cycles-pp.dup_mmap
     12.04            -0.2       11.86        perf-profile.children.cycles-pp.__mmput
     12.02            -0.2       11.84        perf-profile.children.cycles-pp.exit_mmap
      9.67            -0.2        9.51        perf-profile.children.cycles-pp.syscall
      3.70            -0.2        3.54 ±  2%  perf-profile.children.cycles-pp.anon_vma_fork
      2.86            -0.1        2.72        perf-profile.children.cycles-pp.anon_vma_clone
      2.78            -0.1        2.66        perf-profile.children.cycles-pp.free_pgtables
      2.15            -0.1        2.05        perf-profile.children.cycles-pp.unlink_anon_vmas
      2.52            -0.1        2.43        perf-profile.children.cycles-pp.copy_mc_enhanced_fast_string
      1.23            -0.1        1.17        perf-profile.children.cycles-pp.anon_vma_interval_tree_insert
      0.82 ±  2%      -0.1        0.76 ±  2%  perf-profile.children.cycles-pp.rwsem_spin_on_owner
      0.38 ±  9%      -0.1        0.33 ±  8%  perf-profile.children.cycles-pp.wp_page_copy
      0.25            -0.0        0.22 ±  2%  perf-profile.children.cycles-pp.schedule_tail
      1.46            -0.0        1.42        perf-profile.children.cycles-pp.__x64_sys_madvise
      1.46            -0.0        1.42        perf-profile.children.cycles-pp.do_madvise
      1.22            -0.0        1.19        perf-profile.children.cycles-pp.faultin_page_range
      1.09            -0.0        1.06        perf-profile.children.cycles-pp.__get_user_pages
      1.46            -0.0        1.43        perf-profile.children.cycles-pp.__madvise
      0.64            -0.0        0.61        perf-profile.children.cycles-pp.__anon_vma_interval_tree_remove
      0.56            -0.0        0.52        perf-profile.children.cycles-pp._raw_spin_lock
      1.45            -0.0        1.42        perf-profile.children.cycles-pp.madvise_do_behavior
      0.68            -0.0        0.65        perf-profile.children.cycles-pp.truncate_inode_folio
      0.59            -0.0        0.56        perf-profile.children.cycles-pp.__vma_start_write
      0.38 ±  2%      -0.0        0.35        perf-profile.children.cycles-pp.__vma_start_exclude_readers
      0.47            -0.0        0.44        perf-profile.children.cycles-pp.up_write
      0.61            -0.0        0.59        perf-profile.children.cycles-pp.filemap_remove_folio
      0.18            -0.0        0.16 ±  2%  perf-profile.children.cycles-pp.select_task_rq_fair
      0.20            -0.0        0.18 ±  2%  perf-profile.children.cycles-pp.wake_up_new_task
      0.10 ±  3%      -0.0        0.08        perf-profile.children.cycles-pp.common_startup_64
      0.10 ±  3%      -0.0        0.08        perf-profile.children.cycles-pp.cpu_startup_entry
      0.10 ±  3%      -0.0        0.08        perf-profile.children.cycles-pp.do_idle
      0.36            -0.0        0.34        perf-profile.children.cycles-pp.pte_offset_map_lock
      0.10 ±  3%      -0.0        0.08        perf-profile.children.cycles-pp.start_secondary
      0.16            -0.0        0.14        perf-profile.children.cycles-pp.update_sg_wakeup_stats
      0.08 ±  4%      -0.0        0.06        perf-profile.children.cycles-pp.cpuidle_idle_call
      0.16 ±  2%      -0.0        0.14 ±  3%  perf-profile.children.cycles-pp.sched_balance_find_dst_group
      0.06            -0.0        0.04 ± 44%  perf-profile.children.cycles-pp.acpi_idle_do_entry
      0.06            -0.0        0.04 ± 44%  perf-profile.children.cycles-pp.acpi_safe_halt
      0.06            -0.0        0.04 ± 44%  perf-profile.children.cycles-pp.pv_native_safe_halt
      0.45            -0.0        0.43        perf-profile.children.cycles-pp.__filemap_remove_folio
      0.40            -0.0        0.38        perf-profile.children.cycles-pp.lru_add
      0.41            -0.0        0.40        perf-profile.children.cycles-pp.__memcg_slab_post_alloc_hook
      0.08 ±  6%      -0.0        0.06 ±  6%  perf-profile.children.cycles-pp.__put_user_4
      0.06 ±  7%      -0.0        0.05        perf-profile.children.cycles-pp.cpuidle_enter
      0.06 ±  7%      -0.0        0.05        perf-profile.children.cycles-pp.cpuidle_enter_state
      0.18            -0.0        0.17 ±  2%  perf-profile.children.cycles-pp.__percpu_counter_init_many
      0.24 ±  2%      -0.0        0.23 ±  2%  perf-profile.children.cycles-pp.finish_task_switch
      0.06 ±  6%      -0.0        0.05        perf-profile.children.cycles-pp.acpi_idle_enter
      0.28            -0.0        0.26        perf-profile.children.cycles-pp.lru_gen_add_folio
      0.28            -0.0        0.27        perf-profile.children.cycles-pp.xas_store
      0.22            -0.0        0.21        perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.10            -0.0        0.09        perf-profile.children.cycles-pp._raw_spin_trylock
      0.08            -0.0        0.07        perf-profile.children.cycles-pp.__anon_vma_interval_tree_augment_rotate
      0.12            -0.0        0.11        perf-profile.children.cycles-pp.folio_unlock
      0.08            +0.0        0.09 ±  5%  perf-profile.children.cycles-pp.ksys_read
      0.07 ±  5%      +0.0        0.09 ±  5%  perf-profile.children.cycles-pp.vfs_read
      0.06 ±  6%      +0.0        0.08 ±  4%  perf-profile.children.cycles-pp.anon_pipe_read
      0.06 ± 11%      +0.0        0.09 ± 13%  perf-profile.children.cycles-pp.__free_frozen_pages
      0.08 ±  4%      +0.0        0.11        perf-profile.children.cycles-pp.flush_tlb_mm_range
      0.06 ±  9%      +0.0        0.09        perf-profile.children.cycles-pp.on_each_cpu_cond_mask
      0.06 ±  9%      +0.0        0.09        perf-profile.children.cycles-pp.smp_call_function_many_cond
      0.08            +0.0        0.12        perf-profile.children.cycles-pp.do_wait
      0.09            +0.0        0.13        perf-profile.children.cycles-pp.kernel_wait4
      0.05            +0.0        0.10 ±  4%  perf-profile.children.cycles-pp.do_task_dead
      0.10 ±  7%      +0.0        0.14 ±  3%  perf-profile.children.cycles-pp.__free_one_page
      0.00            +0.1        0.06 ±  8%  perf-profile.children.cycles-pp.__vmalloc_area_node
      0.18 ±  2%      +0.1        0.24 ±  2%  perf-profile.children.cycles-pp.schedule
      0.05            +0.1        0.12        perf-profile.children.cycles-pp.update_sg_lb_stats
      0.06            +0.1        0.13 ±  3%  perf-profile.children.cycles-pp.sched_balance_find_src_group
      0.06 ±  6%      +0.1        0.13 ±  2%  perf-profile.children.cycles-pp.update_sd_lb_stats
      0.08            +0.1        0.17 ±  2%  perf-profile.children.cycles-pp.sched_balance_rq
      0.10 ±  3%      +0.1        0.19 ±  3%  perf-profile.children.cycles-pp.pick_next_task_fair
      0.07 ±  5%      +0.1        0.16 ±  2%  perf-profile.children.cycles-pp.sched_balance_newidle
      0.10            +0.1        0.19 ±  2%  perf-profile.children.cycles-pp.__pick_next_task
      0.27            +0.1        0.37        perf-profile.children.cycles-pp.__schedule
      0.12 ±  7%      +0.1        0.22 ±  6%  perf-profile.children.cycles-pp.__del_page_from_free_list
     84.08            +0.1       84.21        perf-profile.children.cycles-pp.do_syscall_64
     84.08            +0.1       84.22        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.56 ±  2%      +0.2        0.74 ±  9%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.38 ±  2%      +0.2        0.56 ± 11%  perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
      0.58 ±  2%      +0.2        0.76 ±  9%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.11 ±  8%      +0.2        0.30 ± 22%  perf-profile.children.cycles-pp.tlb_remove_table_rcu
      0.33 ±  3%      +0.2        0.52 ± 13%  perf-profile.children.cycles-pp.__irq_exit_rcu
      0.33 ±  2%      +0.2        0.52 ± 13%  perf-profile.children.cycles-pp.handle_softirqs
      0.29 ±  3%      +0.2        0.49 ± 15%  perf-profile.children.cycles-pp.rcu_do_batch
      0.00            +0.2        0.20 ± 32%  perf-profile.children.cycles-pp.free_one_page
      0.30 ±  3%      +0.2        0.50 ± 14%  perf-profile.children.cycles-pp.rcu_core
      0.88 ±  2%      +0.2        1.10 ±  5%  perf-profile.children.cycles-pp.shmem_alloc_folio
      0.85 ±  2%      +0.2        1.08 ±  5%  perf-profile.children.cycles-pp.folio_alloc_mpol_noprof
      0.66 ±  2%      +0.3        0.93 ±  6%  perf-profile.children.cycles-pp.vma_alloc_folio_noprof
     24.51            +0.3       24.82        perf-profile.children.cycles-pp.shmem_undo_range
     15.72            +0.3       16.06        perf-profile.children.cycles-pp.free_pages_and_swap_cache
     15.72            +0.3       16.06        perf-profile.children.cycles-pp.__tlb_batch_free_encoded_pages
     15.75            +0.3       16.10        perf-profile.children.cycles-pp.tlb_finish_mmu
     12.01            +0.4       12.45        perf-profile.children.cycles-pp.__munmap
     11.96            +0.4       12.40        perf-profile.children.cycles-pp.__vm_munmap
     11.96            +0.4       12.40        perf-profile.children.cycles-pp.__x64_sys_munmap
     11.95            +0.4       12.39        perf-profile.children.cycles-pp.do_vmi_align_munmap
     11.87            +0.4       12.31        perf-profile.children.cycles-pp.unmap_region
     11.96            +0.4       12.40        perf-profile.children.cycles-pp.do_vmi_munmap
     11.88            +0.4       12.33        perf-profile.children.cycles-pp.vms_complete_munmap_vmas
     51.72            +0.5       52.20        perf-profile.children.cycles-pp.stress_run
     11.08            +0.5       11.57        perf-profile.children.cycles-pp.unlink
     11.07            +0.5       11.57        perf-profile.children.cycles-pp.__x64_sys_unlink
     10.98            +0.5       11.48        perf-profile.children.cycles-pp.evict
     10.98            +0.5       11.47        perf-profile.children.cycles-pp.shmem_evict_inode
     11.07            +0.5       11.57        perf-profile.children.cycles-pp.filename_unlinkat
      1.24 ±  3%      +0.5        1.76 ±  8%  perf-profile.children.cycles-pp.rmqueue
      1.96 ±  2%      +0.5        2.49 ±  5%  perf-profile.children.cycles-pp.alloc_pages_mpol
      1.08 ±  3%      +0.5        1.61 ±  8%  perf-profile.children.cycles-pp.__rmqueue_pcplist
      1.90 ±  2%      +0.5        2.44 ±  5%  perf-profile.children.cycles-pp.__alloc_frozen_pages_noprof
      1.73 ±  2%      +0.5        2.27 ±  6%  perf-profile.children.cycles-pp.get_page_from_freelist
      0.23 ± 13%      +0.5        0.78 ± 17%  perf-profile.children.cycles-pp.rmqueue_bulk
     62.83            +0.7       63.50        perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
     62.93            +0.7       63.61        perf-profile.children.cycles-pp._raw_spin_lock_irqsave
     36.86            +0.7       37.55        perf-profile.children.cycles-pp.folios_put_refs
      0.47 ± 12%      +1.1        1.60 ± 19%  perf-profile.children.cycles-pp.free_pcppages_bulk
      0.64 ±  8%      +1.1        1.78 ± 18%  perf-profile.children.cycles-pp.free_unref_folios
      0.54 ± 11%      +1.2        1.72 ± 19%  perf-profile.children.cycles-pp.free_frozen_page_commit
      2.73            -0.1        2.60        perf-profile.self.cycles-pp.shmem_get_folio_gfp
      2.52            -0.1        2.42        perf-profile.self.cycles-pp.copy_mc_enhanced_fast_string
      1.22            -0.1        1.16        perf-profile.self.cycles-pp.anon_vma_interval_tree_insert
      0.81 ±  2%      -0.0        0.76 ±  2%  perf-profile.self.cycles-pp.rwsem_spin_on_owner
      0.64            -0.0        0.61        perf-profile.self.cycles-pp.__anon_vma_interval_tree_remove
      0.84            -0.0        0.81        perf-profile.self.cycles-pp.__rmqueue_pcplist
      0.54            -0.0        0.51        perf-profile.self.cycles-pp._raw_spin_lock
      0.17 ±  5%      -0.0        0.14 ±  3%  perf-profile.self.cycles-pp.copy_pte_range
      0.38            -0.0        0.35        perf-profile.self.cycles-pp.anon_vma_clone
      0.67            -0.0        0.65        perf-profile.self.cycles-pp.dup_mmap
      0.46            -0.0        0.43        perf-profile.self.cycles-pp.up_write
      0.40            -0.0        0.38        perf-profile.self.cycles-pp.down_write
      0.15 ±  2%      -0.0        0.13        perf-profile.self.cycles-pp.update_sg_wakeup_stats
      0.37            -0.0        0.36        perf-profile.self.cycles-pp.__memcg_slab_post_alloc_hook
      0.10            -0.0        0.09 ±  5%  perf-profile.self.cycles-pp._raw_spin_trylock
      0.17 ±  2%      -0.0        0.16        perf-profile.self.cycles-pp.kmem_cache_free
      0.08            -0.0        0.07        perf-profile.self.cycles-pp.__anon_vma_interval_tree_augment_rotate
      0.12            -0.0        0.11        perf-profile.self.cycles-pp.lru_add
      0.06            +0.0        0.07        perf-profile.self.cycles-pp.rmqueue
      0.18 ±  2%      +0.0        0.21        perf-profile.self.cycles-pp.get_page_from_freelist
      0.26 ±  4%      +0.0        0.29        perf-profile.self.cycles-pp.zap_pte_range
      0.05            +0.0        0.08 ±  5%  perf-profile.self.cycles-pp.smp_call_function_many_cond
      0.10 ±  7%      +0.0        0.14 ±  4%  perf-profile.self.cycles-pp.__free_one_page
      0.14 ±  3%      +0.1        0.19 ±  3%  perf-profile.self.cycles-pp.free_pcppages_bulk
      0.05            +0.1        0.11        perf-profile.self.cycles-pp.update_sg_lb_stats
      0.12 ±  7%      +0.1        0.22 ±  6%  perf-profile.self.cycles-pp.__del_page_from_free_list
     62.83            +0.7       63.50        perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

