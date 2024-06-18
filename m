Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018B54C9D
	for <oe-lkp@lists.linux.dev>; Tue, 18 Jun 2024 02:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718678571; cv=fail; b=HM6w978sl9Z6xX0rlk86SObaIIa1n3OUvlXmSMuNHYQHv3nLs8ylpKpyiN7jhq4W9bUzElLJXepdoQKe1Ph5sFwlAL4ZQEttgb12e392d89vQ9yZ+kss4jPQeGL4+wOBKoJ6M6SEPDJYD1E+4SDNU9SXYSYR+V1hVJKkPfmYxZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718678571; c=relaxed/simple;
	bh=rty6eA2ONvbuas9GDFyBEr3tvuZdVmyqZ1h5PM/4+lw=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=vC7cUELJPmQU49V+NIqfNOWR0pTW2MqHz6Ku0kC7FIEjlmpn6DfHCuELDbq0lswkVhUcvkVp+YkHkT2nbGxIvVkzkFl9OlgcDf4ES12ezh2pNyXU8p3Q8R5XGoNSD+Ofp+2mizT/xww92JS70Y8RNSqpzyrJdH98p6MEHFzY8GY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VV01/z9b; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VV01/z9b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718678569; x=1750214569;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rty6eA2ONvbuas9GDFyBEr3tvuZdVmyqZ1h5PM/4+lw=;
  b=VV01/z9brgUlobkzrXF2zyvq4SbwAh0Djyr5TUT6hGJmrBnthCnSWoDo
   8kfNharTFcyzlIPyUOsuQ96zezwp5qtwY04frsydvXFnlV2ZVnCHT8Wna
   u7KutkKkY2T0jfKach0x1bV9qvFuqWAlR7+d1pJ7b3c1QOzlEogpkUTAf
   47C9t+o0Lk1ZUtN2TltiVDiE2sylQDXiYLhqObSYujHgE6n+HAAj4UKdv
   ZOsG3/i3rGXTt+o6FafNpsXO2AVVhNzhxAk081rxDPCakm/B1A+75Ojqw
   lhvtUFaChen743usMWZkxqbJQXXjR2T+wxLR1OdSNzl6gOlnExn6mbLen
   Q==;
X-CSE-ConnectionGUID: gToBxh56RXGI6wR/FMlOrA==
X-CSE-MsgGUID: 0oehvyhFQEOzFCs2ZoYgXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="26945542"
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; 
   d="scan'208";a="26945542"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 19:42:48 -0700
X-CSE-ConnectionGUID: rIoYA8VAQ6e8WczmI2tNPg==
X-CSE-MsgGUID: p4s+KGMvTIiHyfTH5Nbgjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; 
   d="scan'208";a="46512628"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 17 Jun 2024 19:42:48 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 19:42:47 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 17 Jun 2024 19:42:47 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 17 Jun 2024 19:42:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z8Z6JI6YLHXO8+llbkertgYaKLbYdfpKI0DiP9xIFfYjZkou4D+dF2iSifaQ37SfTcG4Fx8zsuDd0/BoQcJqf8rd5kU6cN+F7pPDoW9Yp5lPbjxBdb+VQJc/JEs9DoGsmIPU8OP0W+EbpzMIQVBDEim7g0AeHJLBfBosksNItbL0mQJkzvUA/Gy5brsudQACOR5afKFkCQt0XH/yH8qnT+sCJ8mJlbZnw0pCQ2k79CrMUHvJcAlQhlWgsTs5hPVMxCD8xnkzXVeTyW2P81EBTm4UYqpvBw+1qb4oVGFdebLbSIVPzYSE2+MUHoriPvUa2mZa/3WZeYvLdfIckoBI4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GLglOWBx2vmoykG1OgeKt3FTqhBW3+M3706TB9kXdKI=;
 b=Yvmm/wrKdQ6Lc011MtI60tjPHewdxEaZgc9P0CPCYDKXXhlqwCEn5W2XVXLaelad0+qv5FPSGZCJyTaV7sncoRz0+lT+XQb0r8bH2UqdvCT6vlouIw5yjHdwoPpSJWGElEc67Z6gr1mZ9zRVa71t/2cBwc43+79R4fGVerrXxpi8C5+BxQ0MBoNQ08Ti7ijmUsQ9pZqvGmX6aPfegJcvKBIfo/pf061d1+4YZYvR7EuGtZs73SVgUFCJH1j95JqvenRRMoin4q8t67exRzU1qYFov8Ioa/BZV8WHRg/UaKPY+UGxocuTSSCTlp8yXNza1xl95ZgfJSBnVNq0S8+QZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SA3PR11MB7488.namprd11.prod.outlook.com (2603:10b6:806:313::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Tue, 18 Jun
 2024 02:42:40 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%2]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 02:42:40 +0000
Date: Tue, 18 Jun 2024 10:42:30 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Xiu Jianfeng <xiujianfeng@huawei.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Linux Memory Management List
	<linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, Muchun Song
	<muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
	<oliver.sang@intel.com>
Subject: [linux-next:master] [mm/hugetlb_cgroup]  11308a02a5:
 BUG:key#has_not_been_registered
Message-ID: <202406181046.8d8b2492-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR06CA0007.apcprd06.prod.outlook.com
 (2603:1096:4:186::9) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SA3PR11MB7488:EE_
X-MS-Office365-Filtering-Correlation-Id: 35c0277a-713f-4e0e-3c17-08dc8f405236
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|366013|1800799021;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JjKtKKDWp9rlS2xd3e64QlS5X0fEHD8YMy7+nJdFkB23g5EAGlZmbbltDru3?=
 =?us-ascii?Q?ikkOiR7tABRdKcm4GihQeq+jtL/UVr8/dno37EqXFccZg5OQMzuOarokq9mQ?=
 =?us-ascii?Q?GpDYRD9ysALmkAWWc9y2UHXcASeY9BFABwa1Q8OueS3Ql7WCb63Q81SgMFFj?=
 =?us-ascii?Q?3LtTpVduGHF2M6Pn3BcID3phnSF+WtSY1/clwt8F2jVCRxQtRoY8JOEjPDxI?=
 =?us-ascii?Q?UFGjItR3ZrZE6JxQBUABClFZtltqY9NgFrQaBx9dypS8ZqzdANSv3ffa6bjC?=
 =?us-ascii?Q?B6tS+w27wJWsiJCouTEYHhnf8T7YxQVvOjQsmU0G31QCAFBBuASlu2DmoMpg?=
 =?us-ascii?Q?JoQJ/2W0WlUFI7JsNsQMelHC1+vaE9NkJMVIK+DLlbnvsH7FDHVI7Ngbwc+A?=
 =?us-ascii?Q?wW2XRFE4TsEm8MTaY8KknhelZypycmqZchnXKj8i+LteUPdVN6pHOg4I+jg6?=
 =?us-ascii?Q?ZeTzvXMEdOOHqi+0L0RkyblxkGMon+UT1FMByhP52spmUMRmFYJKmdYdAWW6?=
 =?us-ascii?Q?2fCXnD7q+LPGtmEp9Jgul3IgWtf7ulraSYpfN4W8CI4f6G45AoB6tMf/kXvM?=
 =?us-ascii?Q?bxt7Xs9G5eAynycsHqZx5e7HVOMRtceljoBJW362gWKs2o4HKP6Xj3WQV0So?=
 =?us-ascii?Q?+DVjIjtYBtjiym0+ZpFfR1ObjFE8WA0dwyEJFrvng/XCM11LhPYe3m2fu374?=
 =?us-ascii?Q?Ldac+kQaYDPmjDQNURucxwcsOtyVPqwRHshwxcAqCkXRkNws85HZ+XQUMZNn?=
 =?us-ascii?Q?8i7niG8ccOFoRArCWAsV6WM1ll26BNYbL9GYrzMAx/qSECbKO7Y8M0r1DwS9?=
 =?us-ascii?Q?asL9TbK76jSU6P3Hfa1rcmX23Lh9SM/+nc1a8CCURq2kr9ko3A/Nuc9o+Zk4?=
 =?us-ascii?Q?oqbG8E+wT2yfUmwfyaXG7dQpwrmph0VXOY5P+qneZe2hzHnTFgPbn0SgBFzS?=
 =?us-ascii?Q?F8z6zrUG4zpFu0AMMvH7bWggdlOzBvk7gdUWcHNr5KG0ruKP5PU3J3SEucLl?=
 =?us-ascii?Q?OkQoqTRGL8NGJAFh3R2dP5hMcKJkxTtr/zVeK/vKXi9P66bmK41SIWINqE1/?=
 =?us-ascii?Q?WQn1Z+BGTukLXuTw9yGYS36LDDFX0jSHj+0WEEVHERuwD9rosmBJXSB2IqvT?=
 =?us-ascii?Q?UcWyWie+UI9NA0/gq+iq4N042F4Y3mBU0IB3v7dEJfiAaMVK9RzhcIPjXqv8?=
 =?us-ascii?Q?E5NoRfYWcvA0GD1wAAol9YN4T5nIUs63Vt38P3xsx1bGzXay7gbPqKlTczod?=
 =?us-ascii?Q?X4FE6HtMbOVSBcZARVCfFT/EUYQ6/cqwFzHmx2XMYA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(366013)(1800799021);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BD/JCY8ao4mzcnZtkXoxN+LhIXtrdRsFHvgEFkUbFJNz7k3wWhvolwsKz06q?=
 =?us-ascii?Q?/NCtaHnXchst/dqioHgYTpw0wqb+p9bPLQT0n4sVETvPixD2mXTTzD/vfyeW?=
 =?us-ascii?Q?vQxXQJ2ar9BI97U15SkE39/spSk8dDogcYNZgQXL8A2iZC4NhQCutK6s0GnC?=
 =?us-ascii?Q?7mfNbfpQZbN76vNcE+IKuLrH8jEMdKXxuy9HVzme6AcytKR4U9LxoXZkYBow?=
 =?us-ascii?Q?XAsaLf5NySKAAdTfV9/Fy9YQ9uEbGtWnQXHhJgybZ7aSKYEPi0flxYBqo8EA?=
 =?us-ascii?Q?719ShIBSTNJaUMBZoHWEi0CmbmO818iMf7vl00BkR0AqEP2ztfHcVTUbC1az?=
 =?us-ascii?Q?JfOnUnJWIos7Zv9Phm8/DtGuLYxX94PrKV55VPbpUmBwsDan07DIf4+bU6cx?=
 =?us-ascii?Q?dAt6i9h2CCOsxNQD8LvqNNdYv73j6Dwdgzuu8A7eGBNu+E3ZNVbu1brA822L?=
 =?us-ascii?Q?PsVYYZizVez4SNiph8UG8UrMpY/wVHwuGFeq3X9xvjSUBJYw4s0zuMG71xN+?=
 =?us-ascii?Q?G2VJRj4b9+4jnIIJN0Ywhos/u+OyNDlbu9pF0pV9ci8Y7S31Ukwymf6Qzgmv?=
 =?us-ascii?Q?iw9GtIr4YBlUjUrAF3fvFMwbcovdcK//gPd6peaMIUPI0HD/r7Iv5KzJKdkq?=
 =?us-ascii?Q?A8ErN9uf9rLF9nDLnMAjsLTrpcNEuHrZJ6sncgjhAInSerepVdzQTh8NcS6t?=
 =?us-ascii?Q?SZ28vi7IiJXve8qPXfmakKfwW3hJzGcjVUn4zrpZZSbd+J4GGJNZUUq+zIR2?=
 =?us-ascii?Q?9eREdX42jQrcauNqe7eJDsqX1LpC8HYyUu2L4E2yrvvAFznHV6TSgW6pWbI9?=
 =?us-ascii?Q?2IDTLOI+/1ZS/gNeN/fxm1EPUGKIIu0iWOo9QInSaLAGVNmJr28aUzOWoNxd?=
 =?us-ascii?Q?fWUBtKY/S+kBlnFWq0NKq+kTfs7DCHHHa7Exn8vAipIXkzCJ1Q3VQksqfXBf?=
 =?us-ascii?Q?5Yr0oauNtJkPO6kWJ8fuI8ptBgk9Zz5bk6vmj+AiqPGcwqBJBxXUeJE8Sep5?=
 =?us-ascii?Q?Gg5LO6tFdkIRlmzBuXE5hEDKL9Q6IW/OPejxbWLiFYh78xk4I96BmiN1tP7Z?=
 =?us-ascii?Q?DPeeuAR9PXCUb650EDMxr4GGcFjDQpAXJ3BQOZ4nU4Ck2B6Xwlx9xXTHrgnm?=
 =?us-ascii?Q?ctAOma2FKNpytLCqYtQ0iGO2p5a3pdg2/JNpJ4Tc4PB/LOpjnMAP5twSlWAY?=
 =?us-ascii?Q?IChzFP3btb+dyzRUz85Tc0nLxAnlfly8NEjfqVu5jx9AhjC0Q1xwYqKpfMaj?=
 =?us-ascii?Q?xft4T7TmjkN4D/1UVeaYebNL7PkAhmOYfrivjfTm1yhNIKCjICBO8OJwLz5y?=
 =?us-ascii?Q?Fak5GdBEG1Qr1z5lm+/UtIzd/4vrgD3ZgwvVPvrHT5MO1Rc+VqVidQZzrOgF?=
 =?us-ascii?Q?ruRpyksDvf2auFfRtvxybUDxyUnzkZQaGb0mIwBI5HOS8RctliRalsSG0FUq?=
 =?us-ascii?Q?+l+sYi+vKdcGsbeN2wJkhklW5vpf5XmA/OggfH82IzFvhOExF45OxWr5EKIm?=
 =?us-ascii?Q?IVVuBff4Uz4zv0tyj7ZhqG+JpTEYj9hnjwknb4U8RGT+DMpb7m0CnmurjeHk?=
 =?us-ascii?Q?fFb5Y8cEoQlj+Y9tudbNcrv/fTALS/+vNFj9egO6Keb/w6G5XS78vdHtAThh?=
 =?us-ascii?Q?zA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35c0277a-713f-4e0e-3c17-08dc8f405236
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 02:42:40.1152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LrcbEmFJDcJTxW8lBUo2ter/bByahz35HldGLsYm3ppOyUFZZ5s36jgV7zwRtoC4J3kmWE2O45YzEtrZYY1Ayg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7488
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:key#has_not_been_registered" on:

commit: 11308a02a56ccd8b3523d5472bd89bc91888edfb ("mm/hugetlb_cgroup: switch to the new cftypes")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

in testcase: boot

compiler: clang-18
test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+------------------------------------------------------------+------------+------------+
|                                                            | e18df2889f | 11308a02a5 |
+------------------------------------------------------------+------------+------------+
| BUG:key#has_not_been_registered                            | 0          | 6          |
| WARNING:at_kernel/locking/lockdep.c:#lockdep_init_map_type | 0          | 6          |
| EIP:lockdep_init_map_type                                  | 0          | 6          |
+------------------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202406181046.8d8b2492-oliver.sang@intel.com


[   17.312964][    T1] BUG: key c3daa090 has not been registered!
[   17.313956][    T1] ------------[ cut here ]------------
[   17.314778][    T1] DEBUG_LOCKS_WARN_ON(1)
[ 17.314828][ T1] WARNING: CPU: 1 PID: 1 at kernel/locking/lockdep.c:4895 lockdep_init_map_type (kernel/locking/lockdep.c:4895) 
[   17.317059][    T1] Modules linked in:
[   17.317706][    T1] CPU: 1 PID: 1 Comm: init Not tainted 6.10.0-rc3-00221-g11308a02a56c #1
[   17.319005][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 17.320620][ T1] EIP: lockdep_init_map_type (kernel/locking/lockdep.c:4895) 
[ 17.321551][ T1] Code: 93 62 c3 00 75 d7 e8 e2 71 4b 00 85 c0 74 ce 83 3d ec c4 e8 c2 00 75 c5 68 bb ef 81 c2 68 ed f4 8c c2 e8 26 74 f8 ff 83 c4 08 <0f> 0b eb af 51 68 e8 f8 8c c2 e8 f8 4d 0a 01 83 c4 08 83 3d 80 93
All code
========
   0:	93                   	xchg   %eax,%ebx
   1:	62 c3                	(bad)
   3:	00 75 d7             	add    %dh,-0x29(%rbp)
   6:	e8 e2 71 4b 00       	call   0x4b71ed
   b:	85 c0                	test   %eax,%eax
   d:	74 ce                	je     0xffffffffffffffdd
   f:	83 3d ec c4 e8 c2 00 	cmpl   $0x0,-0x3d173b14(%rip)        # 0xffffffffc2e8c502
  16:	75 c5                	jne    0xffffffffffffffdd
  18:	68 bb ef 81 c2       	push   $0xffffffffc281efbb
  1d:	68 ed f4 8c c2       	push   $0xffffffffc28cf4ed
  22:	e8 26 74 f8 ff       	call   0xfffffffffff8744d
  27:	83 c4 08             	add    $0x8,%esp
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	eb af                	jmp    0xffffffffffffffdd
  2e:	51                   	push   %rcx
  2f:	68 e8 f8 8c c2       	push   $0xffffffffc28cf8e8
  34:	e8 f8 4d 0a 01       	call   0x10a4e31
  39:	83 c4 08             	add    $0x8,%esp
  3c:	83                   	.byte 0x83
  3d:	3d                   	.byte 0x3d
  3e:	80                   	.byte 0x80
  3f:	93                   	xchg   %eax,%ebx

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	eb af                	jmp    0xffffffffffffffb3
   4:	51                   	push   %rcx
   5:	68 e8 f8 8c c2       	push   $0xffffffffc28cf8e8
   a:	e8 f8 4d 0a 01       	call   0x10a4e07
   f:	83 c4 08             	add    $0x8,%esp
  12:	83                   	.byte 0x83
  13:	3d                   	.byte 0x3d
  14:	80                   	.byte 0x80
  15:	93                   	xchg   %eax,%ebx
[   17.324581][    T1] EAX: b42eb320 EBX: c4e60000 ECX: c29aae84 EDX: 00000000
[   17.325660][    T1] ESI: c3daa090 EDI: c510dea8 EBP: c3ac7c68 ESP: c3ac7c50
[   17.326730][    T1] DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068 EFLAGS: 00010296
[   17.327901][    T1] CR0: 80050033 CR2: b7f2c844 CR3: 03e01de0 CR4: 000406b0
[   17.329065][    T1] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[   17.330100][    T1] DR6: fffe0ff0 DR7: 00000400
[   17.330786][    T1] Call Trace:
[ 17.331280][ T1] ? show_regs (arch/x86/kernel/dumpstack.c:478) 
[ 17.331925][ T1] ? __warn (kernel/panic.c:239 kernel/panic.c:693) 
[ 17.332528][ T1] ? lockdep_init_map_type (kernel/locking/lockdep.c:4895) 
[ 17.333339][ T1] ? report_bug (lib/bug.c:199) 
[ 17.333992][ T1] ? exc_overflow (arch/x86/kernel/traps.c:252) 
[ 17.334646][ T1] ? handle_bug (arch/x86/kernel/traps.c:?) 
[ 17.335274][ T1] ? exc_invalid_op (arch/x86/kernel/traps.c:260) 
[ 17.335969][ T1] ? handle_exception (arch/x86/entry/entry_32.S:1047) 
[ 17.336724][ T1] ? exc_overflow (arch/x86/kernel/traps.c:252) 
[ 17.337392][ T1] ? lockdep_init_map_type (kernel/locking/lockdep.c:4895) 
[ 17.338183][ T1] ? exc_overflow (arch/x86/kernel/traps.c:252) 
[ 17.338837][ T1] ? lockdep_init_map_type (kernel/locking/lockdep.c:4895) 
[ 17.339631][ T1] __kernfs_create_file (include/linux/lockdep.h:135 include/linux/lockdep.h:142 include/linux/lockdep.h:148 fs/kernfs/file.c:1046) 
[ 17.340358][ T1] cgroup_addrm_files (kernel/cgroup/cgroup.c:4201) 
[ 17.341105][ T1] css_populate_dir (kernel/cgroup/cgroup.c:?) 
[ 17.341806][ T1] cgroup_apply_control_enable (kernel/cgroup/cgroup.c:3226) 
[ 17.342663][ T1] cgroup_apply_control (kernel/cgroup/cgroup.c:3300) 
[ 17.343398][ T1] ? lockdep_hardirqs_on_prepare (kernel/locking/lockdep.c:? kernel/locking/lockdep.c:4359) 
[ 17.347609][ T1] ? _raw_spin_unlock_irq (arch/x86/include/asm/irqflags.h:42 arch/x86/include/asm/irqflags.h:77 include/linux/spinlock_api_smp.h:159 kernel/locking/spinlock.c:202) 
[ 17.348416][ T1] ? rebind_subsystems (include/linux/spinlock.h:? kernel/cgroup/cgroup.c:1861) 
[ 17.349188][ T1] ? trace_hardirqs_on (kernel/trace/trace_preemptirq.c:63) 
[ 17.349921][ T1] rebind_subsystems (kernel/cgroup/cgroup.c:1880) 
[ 17.350650][ T1] cgroup_setup_root (kernel/cgroup/cgroup.c:2118) 
[ 17.351383][ T1] cgroup1_get_tree (kernel/cgroup/cgroup-v1.c:1225) 
[ 17.352116][ T1] vfs_get_tree (fs/super.c:1781) 
[ 17.352808][ T1] do_new_mount (fs/namespace.c:3352) 
[ 17.353490][ T1] ? security_capable (security/security.c:1036) 
[ 17.354209][ T1] path_mount (fs/namespace.c:3679) 
[ 17.354846][ T1] __ia32_sys_mount (fs/namespace.c:3692 fs/namespace.c:3898 fs/namespace.c:3875 fs/namespace.c:3875) 
[ 17.355575][ T1] ? __might_fault (mm/memory.c:?) 
[ 17.356258][ T1] ia32_sys_call (arch/x86/entry/syscall_32.c:42) 
[ 17.356960][ T1] __do_fast_syscall_32 (arch/x86/entry/common.c:?) 
[ 17.357718][ T1] ? irqentry_exit_to_user_mode (kernel/entry/common.c:234) 
[ 17.358564][ T1] ? irqentry_exit (kernel/entry/common.c:367) 
[ 17.359249][ T1] do_fast_syscall_32 (arch/x86/entry/common.c:411) 
[ 17.360017][ T1] do_SYSENTER_32 (arch/x86/entry/common.c:449) 
[ 17.360693][ T1] entry_SYSENTER_32 (arch/x86/entry/entry_32.S:836) 
[   17.361438][    T1] EIP: 0xb7f5a539
[ 17.361997][ T1] Code: 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 0f 1f 00 58 b8 77 00 00 00 cd 80 90 0f 1f
All code
========
   0:	03 74 b4 01          	add    0x1(%rsp,%rsi,4),%esi
   4:	10 07                	adc    %al,(%rdi)
   6:	03 74 b0 01          	add    0x1(%rax,%rsi,4),%esi
   a:	10 08                	adc    %cl,(%rax)
   c:	03 74 d8 01          	add    0x1(%rax,%rbx,8),%esi
	...
  20:	00 51 52             	add    %dl,0x52(%rcx)
  23:	55                   	push   %rbp
  24:*	89 e5                	mov    %esp,%ebp		<-- trapping instruction
  26:	0f 34                	sysenter
  28:	cd 80                	int    $0x80
  2a:	5d                   	pop    %rbp
  2b:	5a                   	pop    %rdx
  2c:	59                   	pop    %rcx
  2d:	c3                   	ret
  2e:	90                   	nop
  2f:	90                   	nop
  30:	90                   	nop
  31:	90                   	nop
  32:	0f 1f 00             	nopl   (%rax)
  35:	58                   	pop    %rax
  36:	b8 77 00 00 00       	mov    $0x77,%eax
  3b:	cd 80                	int    $0x80
  3d:	90                   	nop
  3e:	0f                   	.byte 0xf
  3f:	1f                   	(bad)

Code starting with the faulting instruction
===========================================
   0:	5d                   	pop    %rbp
   1:	5a                   	pop    %rdx
   2:	59                   	pop    %rcx
   3:	c3                   	ret
   4:	90                   	nop
   5:	90                   	nop
   6:	90                   	nop
   7:	90                   	nop
   8:	0f 1f 00             	nopl   (%rax)
   b:	58                   	pop    %rax
   c:	b8 77 00 00 00       	mov    $0x77,%eax
  11:	cd 80                	int    $0x80
  13:	90                   	nop
  14:	0f                   	.byte 0xf
  15:	1f                   	(bad)


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240618/202406181046.8d8b2492-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

