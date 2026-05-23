Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0A619004A
	for <oe-lkp@lists.linux.dev>; Sat, 23 May 2026 13:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779542842; cv=fail; b=lx+nCup3cck9V0IFB4Yqv6RFYIfEwlRREmzgP/Uj3rDhheYwaF0SAilVMLLc2td0XdHYiCLIpDGew/zfp+xPuz8iC5a/B8aWN7UigwEFEPnkDJ0ZkiCkcNa4bK0Nk5w4bapZ4SaViYniW4dap+1wU4NvEAiGXWynADRVRXm/8x0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779542842; c=relaxed/simple;
	bh=MpslBLOPYPCse5h3lHP+69zfMd6BGUm0shK4yY0Zkhw=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Lc43C5t27psnE44XH5v14eIaYraP2h3+dOK0oy3Emj6yBJZPu2vh26fD4u5Afn/XcmXX+EZn3jd2iMTg3VNv20MvOKctRh3e7rUIhJ4MbACuCge4aMK2tsmZ9ajDS9/mWL1H8WuTrvb0/8Q4QxaGnPui8d3f7gwXcXR/dDmB/T8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e9Lmxpzk; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e9Lmxpzk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779542839; x=1811078839;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MpslBLOPYPCse5h3lHP+69zfMd6BGUm0shK4yY0Zkhw=;
  b=e9Lmxpzkod/UmtuCqfv6ovFw8+8WGuyITcqw6gZRo+eHwbR/5JA70tua
   UkOXd6x9YFzCiu1WVea5HJpWROwjev3Q1XOIKpVtxYCnr5M9mmFqINSO2
   1RF29yFnR2t51gTlQttAjYFVLzfG8whxi9qkJ/snoYl7cqHcoMTfVZuCN
   dR+EcbA0uSHEY3t6e8o3U8ShKxs3SlRJg6EM32CwJlTMhmiq/WyQuNAdi
   RtRUhHkDriyr5AKqmm56g88f1+Mlm3gbP6lBDQRTfWsZbFy7eYAJuVSt5
   PbLAO7OAxIKBGrghAnFTGDnNR3q2y6Fyu1sFVoLtIQwE2q9fBml+cRSlU
   g==;
X-CSE-ConnectionGUID: m3GfMacdRsCTNDxxbKvjEg==
X-CSE-MsgGUID: Tt+PiUgjRIG0z8gcZpePZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="84064344"
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="84064344"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 06:27:19 -0700
X-CSE-ConnectionGUID: Z6uOVaQ+QxeIXoTMAKqkJA==
X-CSE-MsgGUID: K9k5OrMUQw2GWlVZKZmulw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="241035543"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 06:27:18 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 23 May 2026 06:27:18 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sat, 23 May 2026 06:27:18 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.4) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 23 May 2026 06:27:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F64ENhTXZAuLHo91X0Iqja5mflQpVhg7bqIzHsQ+FLn1MzGhX2FRmiJtgPhRsPLNqXxNuiCYYB7h2QvCFYSo3pm962zM4bSqE9LKCP1MEu+GEYhdN/+0R5j+E4GJBSGwZuVlf5tVjb1oMoMP7WtQ8QLHjMkzCZZnhvkxLMw3hQryh3758tWBabpAEQePhBuz2VHJ0r3ej2Ntifj6Brd6dx2LzlRvUSO6er80YhnHQJr3LR2xfJMuIra5nyB+qKjrlsfJw9RXi+hWVNo6ZFZfOlXngRV67qEMGmHuggb24RKLSWPdhdQnkv6PrGhPFmznoAC2T9dhhgn7G3edVRyV7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yh8jf0Mcny09Jw+6u8Je0vUbmPlbWKatdwFq5OLNy8A=;
 b=iV/m4/zacCzLkeJwgPF5TUwMIXcmBhqEgv24w5FnijBWUEMoUTGdLQQ5lbb9XP/XjJTAMhBJH36Gleo5eCd69YSx/OX/tKl1tTcTWlWrHuYtEADADtmzRtxkFdG3/PZ3r5t8pcQndfJ32VhlvqmrbWTQQUWcmRQ2t4tDNLVDDuA5f5CmI8ig82zlOysLHW8Ho1AseiVFWAAqZvKeuY7/zD3x3nvy5zwzI+yyLvN+QTPCFqKs54+pe8Qyw6z97xSgEJ1Bh2UgvP+Fv68ZXNgkxAM3hPX/87j4WeLOjWgaF6dB8NaDswzQ15TIpysygor8U5iR9kraiAil6lG0pNoIvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by MN0PR11MB6133.namprd11.prod.outlook.com (2603:10b6:208:3cb::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Sat, 23 May
 2026 13:27:14 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%3]) with mapi id 15.21.0048.016; Sat, 23 May 2026
 13:27:14 +0000
Date: Sat, 23 May 2026 21:27:06 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Andrea Righi <arighi@nvidia.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>, Peter Zijlstra <peterz@infradead.org>, K Prateek Nayak
	<kprateek.nayak@amd.com>, Vincent Guittot <vincent.guittot@linaro.org>,
	<aubrey.li@linux.intel.com>, <yu.c.chen@intel.com>, <oliver.sang@intel.com>
Subject: [tip:sched/core] [sched/fair]  c9d93a73ce:
 WARNING:suspicious_RCU_usage
Message-ID: <202605232131.cfcd45a2-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: TP0P295CA0022.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::18) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|MN0PR11MB6133:EE_
X-MS-Office365-Filtering-Correlation-Id: 37d5a376-6d5e-4373-bca6-08deb8cf0064
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|11063799006|5023799004|18002099003|56012099003|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info: hxuGNgM6ejQ1QTQw5WtHNGOkJaYUCMmCOCjxFvpd4DhdmXroQj65AcnGg1zSVW9jR9iiiHaYuKwr1/KEnboSsFeUxK4VPdX94FnPV6qppuRntfGtM3Rz5aeh1tK9FCVQI/NzgTfRsiTepTVjEUOqFneJjQ/h2ItSsndr5MXboGlpowFlJkPm1MNjYmmqpWcshqEsaL2XUTCChABfrr8vpomtW2TbAAFhUGgA5rE37Tnea6he6eOC9TWhyUZ9gu+0xutlu/WSH3zB6mIqrUbK/eXYuDYdGVNPyJMJjq6PF3z6IhU+Ve4KY2hdhiwTKeLxNfB6f+DdxobzJCqQH3+Bf6Or9KPy9Y8BkCzs36g4n2ZBwsawxuKArPIBtsqGzwE7m8/DXLsL2JkwZkPufjAtkdjysnBBQClxfCsEvz7zunGC7hqv/O/ym4yYVZSfUKPbDxMC24yfGmJoMzGZhsPGhhFb+qu2pWacjI3PA7V7Wa9ND6Q/AVj1qzqUmgaLi7/CMuH9dzHSY1oxIWQvViL/0u9R9zY/vT/A52s15GTV4m+muHndDBEIv13uIQfdnOcaViOUZxMT73C2SkmAMrwlY32UCAiAmYqMOfQvwLPsp9z8TdlN1mzxhHRwkTaju5L8zqMy3OtQFObVRNDJoD0/Gw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(11063799006)(5023799004)(18002099003)(56012099003)(3023799007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bvHQOd/PHhkLn7pZ5kFO2vk5P+6ru/gOxcgE3KedvBhfW0Kt/uuRp456+NM5?=
 =?us-ascii?Q?NnO9ISBuujOL36MxrOcHIkATj/1W6VWFaRtmzMc2QkbVprOB/2KUJyXEiRPl?=
 =?us-ascii?Q?LNK4xRLwxydV9OShmTLAJTyFKY49AKaz+YUC1MBYmpkbywtrnaCtGFX3CyiV?=
 =?us-ascii?Q?KY6i+Foxnr+ze9qhYfUXVB7mIRCXqL118ugQ7YrYMe5SC1znUK5aQeivmlSd?=
 =?us-ascii?Q?/Xri7DwOLl3yh4JnX0FqVjvYyXzCUmWlsQTM7r+Jq4OtsT9ypDkKxYEUAMTW?=
 =?us-ascii?Q?n+hkRUJeMqhKsRgxNsOJh8TUx35uUZaP4lY8w5tYqZdS7utk5SolNl2FFXMX?=
 =?us-ascii?Q?xz3T1uIX09l1oAZdTo/LI61/Vv5L+bAB9vkS5P/EGx6qOl4gGi0S8tsm7pt4?=
 =?us-ascii?Q?In9JPIv2EXaL4Ezepg7tBLK2/4cvNZWh7VcQFK4crl0dsUeEoSintdVxQtME?=
 =?us-ascii?Q?pOHNloq4AfkhLOd5WexvnrkYA73T0fZ9kZuWBd2y23X/hvWNzojOIviC7w/5?=
 =?us-ascii?Q?QfCq41U8R6St7MZDc3HfqICve/Yl7Hd6B0r6P9GZCf4mxx0HvcLzMvH2Wb8b?=
 =?us-ascii?Q?gvgXSeCc2T65+sKI/K52okTEZQm5Xxbffb1v6ca+JQK3r3QxADeltvqNWrsB?=
 =?us-ascii?Q?Ce/5Oij6DXekTxIW73RlReH1N6Y+w2Y7z1ZFiJq9YVB13w44jfkNWozSg8ml?=
 =?us-ascii?Q?//mroLPpQqjVDXkSkuw64oIYgC0G3SC2HVW6CNzBCI+SMIGkFu+TgN+8MnDn?=
 =?us-ascii?Q?7wj3NKvvP5fpncb9nDpJHDi6xmshByw7YMwOjHuuAdOBntcoJtuV0t0wKIvH?=
 =?us-ascii?Q?yEBR0F0cXcU4WucJhdDJPYSO3Fa8WCAhcoC/dO+yv6TUzOvOKx35MmXGIRTV?=
 =?us-ascii?Q?bmn9NEBdKTwyASRCAZYbqSJDwbhhZ22IOLoMt6plsaDlaV9E2upbqqBa/DH5?=
 =?us-ascii?Q?4R8uT0YvB3HoEfjFU37JmipaQwQlF2Bai03amcJPwx+dGTkvredVo7COGK4H?=
 =?us-ascii?Q?2Jn/spG+ZWLu/TzzrdYTy/iZm9vmR/RLb8XrQ4c/Pq3auAKclKMbOsAhuQup?=
 =?us-ascii?Q?0B83R/xXvb7418QKr9jqT3IYxofupNfIScmZ1LhCahfphV7+ha9nSAdfGLXi?=
 =?us-ascii?Q?fXhJFgHwgzYeOezC5dpaFmsJhe0gPoyD9vq7nBklp4RuyFIhrvwX9OrNesTX?=
 =?us-ascii?Q?grXDWXInR841VZZxLcjS0GgvxwNOVkOXTaYKBcZJ3M726+vBOFt3/miAIf1b?=
 =?us-ascii?Q?4m3IG6sgjMneOHMQcKX6kKQNpfnT9BbGzQm/94wA/y43Bv1XND3LbWZKa5cE?=
 =?us-ascii?Q?Eg6caPVnG7hLHdGmiBq32VitG44z0d47i0u3hpzJS6La8K9NjKTXxz3t5d/X?=
 =?us-ascii?Q?JUXJcVtS/t2pbCQV4Y1NWQF8X47RNRNNlxQAHUswchYI1CD6K5ZfdF7Z/3UX?=
 =?us-ascii?Q?typw+8UeiYzpyj0sal8fdC1zVyeN5JVDHiFQLehoFbYSATTrDPn/tOUh7D2j?=
 =?us-ascii?Q?P2pC8154Dlu/wG/Z9kTll0q5EIwxmUaTeysHyotwoh8lSqzmo9wOezol6Tru?=
 =?us-ascii?Q?0PS3nW1pRb8wdXgqUw7pp29QnkIqIV5iGMRboFgCPTNHFc8fVH6GoQ9NMrOn?=
 =?us-ascii?Q?lZVyMMY+Tf1uJ34KWqhAu1uhBRWdB27SHpibHsFahRLRXZ9qn0MasC7QvM17?=
 =?us-ascii?Q?x5tLBUjwZ74Lw6U+nCsPKxZb8CLXrK1/RK9k9OsK/ouBGJZZV1ZwYQaij4qC?=
 =?us-ascii?Q?Q3txYUNK9A=3D=3D?=
X-Exchange-RoutingPolicyChecked: VPg+Eip3381NyIcE7SQS+cbMSn9sp8dsjrfpkKmJ3UG5K+OZ/FyzjX1Vw4u9ygEjmIcAFqnvL0uUxZSpH8+3SSHnTCCXvBVM66JBSpu8Ag8F7dfgyRE9zQlg6fcZIYfvHHj2CQv+uqz+RkSJfDk+NFcyqz4BrfoRFBB+6JMmQUz+P0zwJqQC9tjVvfHLNh3x5SXco1u6VRn3KTP3PnNk0/i54cAojJQmgoy5tKd/a8Es4DadiLYP/4CHphExdhQxSuZrT+86FwE2agoLI+9QGLsExlmVxSx2hiZDmPrABPWWAXvxnPPion+509SC58VsP91ckrlNGYpsATlhkr3J6Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 37d5a376-6d5e-4373-bca6-08deb8cf0064
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2026 13:27:13.9674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KKp2iAesUeIWdk8oFpKtnlU+7ATw6vqwOngauZ3SqUwBIy+iq9vJlB9sMdD64zZF3lArlciUZ/DnC1PfwtgMvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6133
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:suspicious_RCU_usage" on:

commit: c9d93a73ce871ca32caf9308562501290b64b955 ("sched/fair: Drop redundant RCU read lock in NOHZ kick path")
https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git sched/core


in testcase: rcutorture
version: 
with following parameters:

	runtime: 300s
	test: cpuhotplug
	torture_type: tasks-rude



config: x86_64-randconfig-001-20260521
compiler: clang-20
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G

(please refer to attached dmesg/kmsg for entire log/backtrace)


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202605232131.cfcd45a2-lkp@intel.com



[  102.159951][   T23]
[  102.160730][   T23] =============================
[  102.162072][   T23] WARNING: suspicious RCU usage
[  102.163398][   T23] 7.1.0-rc2-00011-gc9d93a73ce87 #1 Not tainted
[  102.165064][   T23] -----------------------------
[  102.167687][   T23] kernel/sched/fair.c:12793 suspicious rcu_dereference_check() usage!
[  102.169994][   T23]
[  102.169994][   T23] other info that might help us debug this:
[  102.169994][   T23]
[  102.169994][   T23] other info that might help us debug this:
[  102.169994][   T23]
[  102.169994][   T23] other info that might help us debug this:
[  102.169994][   T23]
[  102.175418][   T23]
[  102.175418][   T23] rcu_scheduler_active = 2, debug_locks = 1
[  102.175418][   T23]
[  102.175418][   T23] rcu_scheduler_active = 2, debug_locks = 1
[  102.175418][   T23]
[  102.175418][   T23] rcu_scheduler_active = 2, debug_locks = 1
[  102.180431][   T23] 2 locks held by cpuhp/1/23:
[  102.182158][   T23]  #0: ffffffff872eadf0 (cpu_hotplug_lock){++++}-{0:0}, at: cpuhp_thread_fun (cpu.c:545 cpu.c:1085)
[  102.184843][   T23]  #1: ffffffff872eaf20 (cpuhp_state-down){+.+.}-{0:0}, at: cpuhp_thread_fun (cpu.c:545 cpu.c:1085)
[  102.187589][   T23]
[  102.187589][   T23] stack backtrace:
[  102.187589][   T23]
[  102.187589][   T23] stack backtrace:
[  102.187589][   T23]
[  102.187589][   T23] stack backtrace:
[  102.189233][   T23] CPU: 1 UID: 0 PID: 23 Comm: cpuhp/1 Not tainted 7.1.0-rc2-00011-gc9d93a73ce87 #1 PREEMPT
[  102.189241][   T23] Call Trace:
[  102.189245][   T23]  <TASK>
[  102.189251][   T23]  __dump_stack (dump_stack.c:94)
[  102.189260][   T23]  dump_stack_lvl (dump_stack.c:120)
[  102.189266][   T23]  dump_stack (dump_stack.c:129)
[  102.189270][   T23]  lockdep_rcu_suspicious (locking/lockdep.c:6876)
[  102.189279][   T23]  set_cpu_sd_state_busy (sched/fair.c:12793)
[  102.189286][   T23]  nohz_balance_exit_idle (sched/fair.c:12812)
[  102.189293][   T23]  sched_cpu_deactivate (sched/core.c:8677)
[  102.189300][   T23]  ? trace_cpuhp_enter (trace/events/cpuhp.h:10)
[  102.189305][   T23]  ? balance_push_set (sched/sched.h:?)
[  102.189312][   T23]  cpuhp_invoke_callback (cpu.c:194)
[  102.189315][   T23]  ? lock_acquire (locking/lockdep.c:5868)
[  102.189321][   T23]  ? cpuhp_thread_fun (cpu.c:545 cpu.c:1085)
[  102.189326][   T23]  ? lock_acquire (locking/lockdep.c:5868)
[  102.189337][   T23]  cpuhp_thread_fun (cpu.c:1109)
[  102.189341][   T23]  ? cpuhp_thread_fun (cpu.c:545 cpu.c:1085)
[  102.189350][   T23]  ? cpuhp_should_run (cpu.c:?)
[  102.189354][   T23]  smpboot_thread_fn (smpboot.c:160)
[  102.189364][   T23]  ? smpboot_thread_fn (smpboot.c:?)
[  102.189373][   T23]  kthread (kthread.c:436)
[  102.189379][   T23]  ? smpboot_unregister_percpu_thread (smpboot.c:321)
[  102.189385][   T23]  ? kthread_unuse_mm (kthread.c:?)
[  102.189392][   T23]  ret_from_fork (x86/kernel/process.c:158)
[  102.189397][   T23]  ? kthread_unuse_mm (kthread.c:?)
[  102.189402][   T23]  ret_from_fork_asm (x86/entry/entry_64.S:245)
[  102.189416][   T23]  </TASK>


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260523/202605232131.cfcd45a2-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

