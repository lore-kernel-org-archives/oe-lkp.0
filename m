Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8435393DC1
	for <oe-lkp@lists.linux.dev>; Thu, 26 Feb 2026 07:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772092036; cv=fail; b=UlDp8uVEMCD1jql7sw9EHxB0zr75gXa6JolMo6zfUwfApVvYh9XYYIZBlCMq+AKRvWnrh2QUm12M1OGJcu6KKEaSEWvybWbL4BYKjEPOTrAXFVv1P207+yTS1isUFbeYF4ifyn1d/Uvrw6eSsAykSIujqyjwMAEvRRZNfPrzJ6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772092036; c=relaxed/simple;
	bh=RNKhv5SBKmX4aPRqwa7s0hX2c4HHk7vtzHxXSXRlRa8=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Di5zDg36e1ySMiQMxPyRCbU0R/uuhoxcTcb9iWBfY40XzbegLIe3JP39CCUV68BHtxkrFy1Ti6tAaLTcMeSb7KMP4asBXCs8h6JK+drhxDpWzaeQ+VxwuEGWP9WzVTrNNLI0IsxASDGgeBokSTYIeMieykXDJ+W1Ekv5GMzSwk0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VkgOp7B+; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VkgOp7B+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772092033; x=1803628033;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=RNKhv5SBKmX4aPRqwa7s0hX2c4HHk7vtzHxXSXRlRa8=;
  b=VkgOp7B+mpBLAOuEuePBkWFfZKImeOAybukoiz6vXVUihiwAcvT2EfyN
   PlSNpjkR5enBBT3+5OFEWh8UdZY8CRxMLomSbqhOZFx+S5YnJ4qdaBpIh
   yP8hPvpQKS9FZ5gNGH2muimz3K46dmCd9cNXP3E055IkUuw2ddyKRSEA8
   lnAIrgsxMG5rxX7lcblO8+lQOnQs9w+D1nLrBYM8f/Zvt2MCeSnQboW2n
   14Q7FBty5sRKIcqmpmrnvypr8GKGA3sjHsK2cQLR1V4iwvs2HFgy4O4rI
   iQ3EG8PjljcgtGHcqdZ6caRQOU15bTXWVc+qmrJFLzaYadAXDbCNSv8LD
   w==;
X-CSE-ConnectionGUID: 4TVo28gcQXaQF1iUoaqtXg==
X-CSE-MsgGUID: YQnURYhcSkenmVuhNryifA==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="90555697"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="90555697"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 23:47:12 -0800
X-CSE-ConnectionGUID: sFOHmWgoRC+DsudB0Mha5A==
X-CSE-MsgGUID: pDa/uICmSnKa/IdabrEKCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="220986692"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 23:47:12 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Feb 2026 23:47:11 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 25 Feb 2026 23:47:11 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.27) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 23:47:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T9DKyWmGZHPMfTbM2Yl7B4YFRk3aHc5THxq3rx23ZTQ7wiU/k+MaHgn7ShSHFOeEgJzI4r2bnn0k6mqoZT70QEyAHUwscb7dlNwejU5cdhGxw+Ak4hVGmai7tbmcXjDA1nRoZxUdCLMydLOCQk0GcdXY/oi+HAyX7/bRQLERh3obU5nBiSLMDj98jMhIHCHKj2Pj25VKq3ncdT9xNlp46JXtlomnoeudzWTWk8g6z5fr6GdKv2uzBj/qy1g9iKtdk+lta3nfLSo4cQmjb0zQ+lBonya+qOByDZs8j4pd4ftDIHby2t9QZon6tzGsAuu7ADxQ+p+kLAxOMZGmqp6aVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3j/M1pLAKDPBJQtr+x1xa+6BsHN92XL16hFt/7htQT8=;
 b=PKoxG+gMjnYAhW8176AVdz0sKlvDBZUyHGm26ULrXY32NLod+1+JLVd5unZsfwfeLHX5e4TrO+QF1lKKy6agPrtmbxxgIzgEn7bd14BzfBZZiWQqFFnJ6LzocOT8RIi9idD2DqwB95fRqSfJwuwwSm5Z+9+3Pqv9sgjvnMEbaKNd9CvdK4a0/qkMaGK+9S3fMAT5MTMuTcis5uXvDfxPL400/iWcPobnIWXNppf9fZuaGLD3CdXChCBu/B+R9aPkrpABb+L3dHVyic7PomYWGSHmIC8PjGVB+zzxN7cIwE1Whi3H6hbOc9MyGR4032pbnO+HZR73adfmMic7E0U7dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SJ0PR11MB4958.namprd11.prod.outlook.com (2603:10b6:a03:2ae::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 07:47:09 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::e4de:b1d:5557:7257]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::e4de:b1d:5557:7257%5]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 07:47:09 +0000
Date: Thu, 26 Feb 2026 15:46:59 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Blake Jones <blakejones@google.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, Madadi Vineeth Reddy
	<vineethr@linux.ibm.com>, Josh Don <joshdon@google.com>,
	<aubrey.li@linux.intel.com>, <yu.c.chen@intel.com>, <oliver.sang@intel.com>
Subject: [linus:master] [sched]  89951fc1f8: stress-ng.enosys.ops_per_sec
 4.7% improvement
Message-ID: <202602261519.645f013d-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: SI1PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::14) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SJ0PR11MB4958:EE_
X-MS-Office365-Filtering-Correlation-Id: 7937707f-2277-436e-bee7-08de750b3ea1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: Jjlunom/8JUxEd01ZzoUaQ12Dl5Vhh30h/entFK5KqBI1g5ijtSfsJtH2f94tL6CpB58nBQqgVylHJqL8ntFrRC4h8PNUBb+BtvlMw7iknooZ8MOsXhZ9m5w8lUOGtNQQXGfF4XTHQqcktnSlfNaAjcuJfChowwwsoPvJiut7DelVxmRrHrZ9tGIIGNJUTOPB3uC1PANFPHngg4Ww8UVUBhwTtfCksvBY4wyPE3j0Fz+JYIqUFrIyljPwmWuBpD8rGZumD0VmOc8VJp9DlAKRwJ07k4kpHgoLMjuOafWioAgXmFGX72GZnY3GyDa0MQaG6uYoq9rzUQNopI7wZkSKLGFlWv+wQyXECny23RpvQuuCPsqwy3EczeXJ748ZVuJtQHyaaEVJVARWRroJJ0W83cupFRRa850yNi6hkh+RXoHhKwcixj5ZOLMp8yluhXhB5NfvldYIHdXNYSyWzJhzXHL2Q6tBQF23Ueer0okcYPFjFW6rDs1PZ4cBSK3R3AtlCHLqbBTZ0+goUlyFd8Y/RIdiPqwCU/L4vGzismm10PoVfRZZQXHRdu8cfghZGh093g2TITNt2OWeLkTjeG+0ZldEb4oMtXM9iEo1Zm//xEeckBPuzamhWA30e+TXo74BtlKkuHOlXZ9KMETT6+sd0HBfuLlhm/9ah8Z6cl2qcOzHnPIsUBVku05L00Q8uZ+PrHSDQ8vaZcmYKMyHsiQrrP8/9rpvugguyX4fKHn62SpLyZCTWgHSw6AR2l5G1pr
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?FE1QweopRLmThxckM2MUsmXKa8M7Kewz5sp1iJf4X1BqrHYVNpn8rS56K6?=
 =?iso-8859-1?Q?oKKolfkJ5YZQaYeQrzE9LmygwRleJijZvVMtzeHhhsJ6/xJeGBBcQfQA2Z?=
 =?iso-8859-1?Q?0N2PWu1P1OlXpUDMv5eWj5431nS+qBPauFkVKM7I8kTUExEBzlDN0zm/2x?=
 =?iso-8859-1?Q?Q4tCmHToGhr2+tKYSeGuHJ2rxNIEB3JwAF33ZGncIaaLrjsRS9fJrdvcb0?=
 =?iso-8859-1?Q?FOGtJa99RqA2X9pcHyvC5uDHcqM7Sk45F5VPkK92MCpiouPfR7qSLKoqmK?=
 =?iso-8859-1?Q?L1hwkKAN81MxCVUilDk7WimfbtahD555yIjId8Fb1mLSX0Ozl9VGuNLzAm?=
 =?iso-8859-1?Q?dE9wSVEhCHD3vOf6ZQnAY9dLNggWQrPfre+E6dMYZyai6CM0Cjm3RKc8fu?=
 =?iso-8859-1?Q?KJTqGqF22YKjCYycrdZVy6ktnLaHz5GprijueRNVzdp6AdE3A4CR0GrUNq?=
 =?iso-8859-1?Q?5BVLfy7R2//dm3v6FsmkToLdm22BEpOJ9DOAQECHv1NyElgX0jopK70AjY?=
 =?iso-8859-1?Q?Pv8iHEvPlk4rPKoErg1WjhXkflfNGpOUZbEfPFCem0+t1bOx6xgSaSjUG/?=
 =?iso-8859-1?Q?y+OcyGy3kFN9rCUf2fmvUiopOe3R/Z9P0eOnux+mkQZwY5aWrajQdBma2a?=
 =?iso-8859-1?Q?RUMSF09fQYglE5IGNuib2r5T+Vwhd12Rx0otsxOLPQltOQr5mTY+gULrxM?=
 =?iso-8859-1?Q?wUX/8EeFXG1lGwjMscMir/71Y6M+RuYgSBZhxLZ3Ns1i5Bn9G5GlkdxyVH?=
 =?iso-8859-1?Q?B3/lfbjSMpsWJV6FVi6JYu2gp4XrRhMUxBapKybPMIBjx6Hv3pSqA5ccOa?=
 =?iso-8859-1?Q?QHNb5rmup1+JoMzLzps3wvLrOP7RlFLGnJuCxiZXf3kaEGQlfoBNjwrOgk?=
 =?iso-8859-1?Q?dBjLpsjfkCE8juiahJHzycMEWZz1Duhy7u/GsRiTiGtlzf/vMDLH4Rqb3c?=
 =?iso-8859-1?Q?tSNn6LEUlwWvNXMdsZQ7aFUcO33nDEvlTlyyB05R2FoPfyUslE0CA3K3RC?=
 =?iso-8859-1?Q?z433dBb56u7j4eauBB9sSOaqrts/PvbQPhAwedKJmRWDihIuCDRdtEPlr7?=
 =?iso-8859-1?Q?gelpH5lAD95IA2sl+FI4wbTOM4dGYYs+LtnxX8+aZMfaHrh6wn9Ic2DY5O?=
 =?iso-8859-1?Q?im9qIMwecfp0vgGbThYmdpJq3PNz6i4nHY2wr/WJD9EYP+f+TA7utY8OiG?=
 =?iso-8859-1?Q?nNM8yEF2hJBpM7IL68URDF2Frqv+EoRtA0hfV3GFYNpxf9S0TVliElh39N?=
 =?iso-8859-1?Q?TSJI9S43g+6MP4iO3cOUEW/bzlR7B4tGBZyjvJEExA/7MPNLEo5O6UoPAH?=
 =?iso-8859-1?Q?iHXWY/VU/44WnL3e27e1/XMvldmU2gnRghi53fnU0Oi6GfQ8PYuhCRchOk?=
 =?iso-8859-1?Q?lA48Bms5htJGQaM4fk2PIPTR/Pny7Zozz87fwuBtmesiuuMAatDEqVoxQA?=
 =?iso-8859-1?Q?5aNDo2+KMi7CND//AXpQdNTcSW2zzRGYSTPf5NZIzMw3ZgFlP9G/sHKHeB?=
 =?iso-8859-1?Q?9j7lkukm0XVLTjYZrQtgjEPqugMzjLkHH9zI2P4nwJr6F8BOL2Ho1wjDdn?=
 =?iso-8859-1?Q?yGJ5zyqjWJp78fvKyX/27e3FU0s+i5EFVb7jtfmQ+WNlD3Wsbkt/11bqB4?=
 =?iso-8859-1?Q?b4eIjxeuZYDQh6sOnIWwuvlxVvFJSIQGjzaQMnxfytPAP/Jm3Esbjt6m3n?=
 =?iso-8859-1?Q?BZg7Qz5m+mKz/AMtn8IVmxgTSbROi3YdkBf9XjRVKUehalNMFJPAwkt5/e?=
 =?iso-8859-1?Q?pIeEztzfRIXlVqgfF/aR+xyHyWWpvYVmBr6+2UB57n5r6m3iXFUW6Sg54G?=
 =?iso-8859-1?Q?M2OwIzYzSg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7937707f-2277-436e-bee7-08de750b3ea1
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 07:47:09.2934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kXeAbXCBQT3DwtYqXMC/IS8GS46EJ+whFdVbvrckc9UBYIZ43J3AzcMuwACck3Zm/2pU3eD+W+MeDm9IAzuGow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4958
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 4.7% improvement of stress-ng.enosys.ops_per_sec on:


commit: 89951fc1f8201df27366ac1eed1ddc9ee0f47729 ("sched: Reorder some fields in struct rq")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master


testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 256 threads 4 sockets INTEL(R) XEON(R) PLATINUM 8592+ (Emerald Rapids) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: enosys
	cpufreq_governor: performance



Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260226/202602261519.645f013d-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-emr-2sp1/enosys/stress-ng/60s

commit: 
  55b39b0cf1 ("sched/fair: Use cpumask_weight_and() in sched_balance_find_dst_group()")
  89951fc1f8 ("sched: Reorder some fields in struct rq")

55b39b0cf183b9c6 89951fc1f8201df27366ac1eed1 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 8.757e+08            +4.7%  9.169e+08        stress-ng.enosys.ops
  14602390            +4.7%   15290136        stress-ng.enosys.ops_per_sec
    114078            +4.7%     119451        stress-ng.enosys.syscalls_per_second
   3314145            +4.6%    3466972        stress-ng.time.minor_page_faults
      8699            -1.4%       8575        stress-ng.time.system_time
      1649            +4.8%       1728        stress-ng.time.user_time
 1.661e+09            +5.0%  1.744e+09        stress-ng.time.voluntary_context_switches
 9.917e+08            +6.4%  1.055e+09        cpuidle..usage
  44556222            +3.9%   46298755        vmstat.system.cs
      1.05            -0.0        1.00        turbostat.C1E%
      0.56            +4.7%       0.58        turbostat.IPC
      2.20            +0.4        2.56 ±  2%  turbostat.POLL%
 7.024e+10            +4.2%   7.32e+10        perf-stat.i.branch-instructions
 5.411e+08            +3.7%  5.613e+08        perf-stat.i.branch-misses
     27.00            +3.6       30.63        perf-stat.i.cache-miss-rate%
 1.393e+09            +4.5%  1.456e+09        perf-stat.i.cache-misses
 5.185e+09            -8.1%  4.764e+09        perf-stat.i.cache-references
  46807212            +4.5%   48921785        perf-stat.i.context-switches
      1.92            -4.3%       1.83        perf-stat.i.cpi
  12283691            +5.4%   12944082        perf-stat.i.cpu-migrations
    466.69            -4.3%     446.75        perf-stat.i.cycles-between-cache-misses
 3.489e+11            +4.3%  3.639e+11        perf-stat.i.instructions
      0.54            +4.2%       0.57        perf-stat.i.ipc
    230.75            +4.7%     241.60        perf-stat.i.metric.K/sec
     26.88            +3.7       30.56        perf-stat.overall.cache-miss-rate%
      1.85            -4.2%       1.77        perf-stat.overall.cpi
    462.88            -4.3%     442.84        perf-stat.overall.cycles-between-cache-misses
      0.54            +4.3%       0.56        perf-stat.overall.ipc
  6.91e+10            +4.2%  7.201e+10        perf-stat.ps.branch-instructions
  5.32e+08            +3.7%  5.518e+08        perf-stat.ps.branch-misses
  1.37e+09            +4.5%  1.431e+09        perf-stat.ps.cache-misses
 5.098e+09            -8.1%  4.684e+09        perf-stat.ps.cache-references
  46015345            +4.5%   48090269        perf-stat.ps.context-switches
  12075501            +5.4%   12723669        perf-stat.ps.cpu-migrations
 3.432e+11            +4.3%  3.579e+11        perf-stat.ps.instructions
 2.085e+13            +4.7%  2.183e+13        perf-stat.total.instructions




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

