Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A77C22425C
	for <oe-lkp@lists.linux.dev>; Tue,  8 Apr 2025 01:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744076582; cv=fail; b=gucC9mszxSlJFqanWpPu4jAid0oNgMMoMEnAq+5sgWqkpo48TqplCSdd2TOXP3EqwEeAFH++MgODhaI7fGF17lEwPSlFDbviOBsQu2OhqqrpWfpxe86YJGlQvqq+kchZ6QGfu2zwIm7LLP9EUwAnUIylSNs4VmqgR5YYSAlq3+Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744076582; c=relaxed/simple;
	bh=E6GGzbpIQ5r9tFjRnkmpK+SHvpi83nyrthfo8VlM8OY=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=aQo6FZ3iwOlqherODi+VJw32oUsoIPDSPlTfrcMmJ7JpZQ6LSG0YDfEVfY+77+9KCQC7KBBF/cfwSDnIDC7gzcrBpT09KOh5wlpUqD67s8F+2nSXl6nZy6ozNd0D6TVZN0zIVkL5x67K/yWSYrKMoiikwqA//58hvwMEVEuqvHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FqFVaCuN; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FqFVaCuN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744076580; x=1775612580;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E6GGzbpIQ5r9tFjRnkmpK+SHvpi83nyrthfo8VlM8OY=;
  b=FqFVaCuNg869Az969TXW2XKuIl8Cpcjb/ejBk2SMDeC1egsrNiaDchGO
   hSF9li9Iym3oWd62JHQPogCYtTNFe6gXXLDJceHC6TMx2lXvz1PrFWIzk
   3HMgqFtPyUBFH9jR94/+uUYc+4bJJb80xhfJFTGqF8wEDFNoZXqdakDiq
   pYmtohH0jU8v8EKk2IoU4+Nw+kN6N42aGSLZt5a2J+Hm+6WXo2Qc4qPQd
   Bpz9juaKtGsL0GKjAet2uhqbPkYRNTIeX+d8s7rCwrgtai+q7O/lgc33L
   MlsI0Va0ccASy9iMZaMhi90ihvBFUpthzpwRyTKNNHAG/cvFhbf4ykgpd
   g==;
X-CSE-ConnectionGUID: dfNBcOhyTxSyVDerxD2iLg==
X-CSE-MsgGUID: yrAwYzk7QKmMF98fIMx4LQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="49285078"
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="49285078"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 18:42:59 -0700
X-CSE-ConnectionGUID: xJMaX0woQ5SoGrb9jMO4SA==
X-CSE-MsgGUID: 5QaC+j8ERm6p/o6WYhLV7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="128977945"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Apr 2025 18:42:58 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 7 Apr 2025 18:42:58 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 7 Apr 2025 18:42:58 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 7 Apr 2025 18:42:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HiXXIMJqfl2ivsq058t7cKuSs9oZMQ+87mMW4eapqW27pkXZmR3drCafUFE4dg+YrKxUT4krIceOieejRlrT4stvL99aLt6FUk5A+lwFm57tnVZ47NlJvmoHuR4l2hJidHrOLZfUT0X0SuKatfiCmR36qwgc3A9U/IuQEKnA2onbRjFhtat9+wgN/wqcRWXY/5BtJ0ijgwYK44LHq+PzFGp7+xmID6DG2AKfWWCny9nVKBiYprL6E2s9UlHpjfFVO5qk9ibgLRDppGKJrHBqnKSt50O6jgemuLZQjY+etct0Zcm2XkAX5p67LQRDwEEo8i46TKKNvNFGWSUd9d29wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=73s3m/Rx2jghQT8o40YN/tdvvTu/tO3WrgpHQ99+QXc=;
 b=j5XhPBfBnmSL4Ls0I+/rhF2Gp55PUjwEdDBjX7q+XcrJCkaMuocMnonMQctLUaIc67DJqPVJhwdNI0ZXloQE3qH+cGspZnkvF6QFLjxdUKtVY5WScENp91C6O0NbT9Z72EqELwydtVlFWSN51ACwlDVKETJIVFVFyA6OCj50EpDKi/SoZc+Lfb+zZWv9hHw5qK/bEso7BA3kCtcniVAxvudpIx73ifCHF2bgnMjSGLh2Q9F8Oc0u3lBcuxIawBTMlurkJqBHdy5013HA2IMQ2jpLja4DxM1i+TAdKJhkV65nMh9r1lT33g6yFf0SMMbR5zISIVBAtKKRGouqUsdY0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SA1PR11MB6822.namprd11.prod.outlook.com (2603:10b6:806:29f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Tue, 8 Apr
 2025 01:42:55 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8606.028; Tue, 8 Apr 2025
 01:42:54 +0000
Date: Tue, 8 Apr 2025 09:42:47 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Frederic Weisbecker <fweisbec@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [frederic-dynticks:task/work] [rcu]  1676c90fe1:
 INFO:rcu_preempt_self-detected_stall_on_CPU
Message-ID: <202504071614.5b3474f3-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR02CA0093.apcprd02.prod.outlook.com
 (2603:1096:4:90::33) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SA1PR11MB6822:EE_
X-MS-Office365-Filtering-Correlation-Id: df63c209-9a83-43f9-9947-08dd763eaea3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Yr1dfn/zoclnenYkjV8mX/KHOHW5Su8mBcVHsPzvyjAj0EHAWY1sO7RhEGiE?=
 =?us-ascii?Q?BsqdCeuvfJ80PNVJdiPUiuLPIKHb6RtKu8ePeaoELeDX3GYq8F1mzdN0RyyS?=
 =?us-ascii?Q?7hqvTra3NKDngfDR80nwAZ4BjD4oV6F0e04yEaHf2IgjoynFdkLzlK65ZVj+?=
 =?us-ascii?Q?RUZqn71H1nPPVqjtho1wgWG17MijqPZWa6UWaVrtT507NdEip4NH1ihBzwjc?=
 =?us-ascii?Q?enq9SYVLKw4/WknbI79+vj9CXACTbexXnP7W2YtPWnyKW5fJY60wrEus704+?=
 =?us-ascii?Q?Xkblq3BOCC5/dZJ9zYzxaKycv83bifb+7T+Hc990vME9kob3sDm3rba6yqpT?=
 =?us-ascii?Q?oCXrjJkGqr7z4MsEmT4OVluLYAcukJ6DGRIkQfAvlYS0IdemVT/90cInNu37?=
 =?us-ascii?Q?2BvDtZxHK9yfvICAE4nDyyqGLwneqo7E14eTBQeaE2kTs3PkPUnlpMpXA5je?=
 =?us-ascii?Q?3cu4pk4Ky5jqsdc9RkpCilWPs+TtiajStt4SNaJiXPI9a/HX94p814BaQzXo?=
 =?us-ascii?Q?fWU1tkZ+o20jPdnBhX/crNFIVWIbs2iMPqrD7n5Tr/66810iBOdCzS4z0hbE?=
 =?us-ascii?Q?7LyoxMUeWQrOlIMRLCYDslEh13yVZCP731ynQeaim1IwG1hn8MJhDYUPAuT/?=
 =?us-ascii?Q?nHNUZe8Tf/ikKrAB6ZRNxGf3SbFNAcmarq/qL8nChPQj/2Oy/Pro8h8hegVD?=
 =?us-ascii?Q?4mOUCuTTcTrLgcp5DGFnDZVD0/E8lCFFsNxSXtEkpugE8Z4i+6uVGFRWX6Tl?=
 =?us-ascii?Q?WEKgWa4UD5f30B7/O7uUuGXiAqOH62t0u5ZOSE95vBmVFI0GpfN3YMjC+pvP?=
 =?us-ascii?Q?87nkxNqHffUMhWN+xzEWW9LDkqZ15/Lfy4wOpMpVjiYTynji9zXQZLtcJWT5?=
 =?us-ascii?Q?llt2uZ0BNtqHN++edNA5iyx/qQhxCwF8tushtwmszgVpo8/zBKb+yul9zqXC?=
 =?us-ascii?Q?N0OuWldaSODmU+vcNyVCUCoxA4YqxM9rYZ5A5AfWj9TnUB+ixzekZqtd3vmW?=
 =?us-ascii?Q?OXuG12XSWY8NQNYbCOARjWj6IN2USvTxu9dIvOjWIzESAUvsfkTTEpylZDgC?=
 =?us-ascii?Q?1XcYTL3s3om8SYZMkq5eGeBesabPjAY+L4LUMQxZaBgOQqrzQ9nbSwYewfxS?=
 =?us-ascii?Q?mG1FxU3SjLyquuEaGZtWsxjhjjBdBn58EFsUd/dUHY2NN9pLT0w+PpdaJ70P?=
 =?us-ascii?Q?6/2jWrgf5PQJrJyaWGVr3Rq8sP/YNeyew5SZiTycGrWz5co0mrANFHBTSYqI?=
 =?us-ascii?Q?F0VoTaJpKkftJ8eVz6/BC/EhurtZ4khpuTzB2fiKq7eVLDvPiF2LyXhgrZiz?=
 =?us-ascii?Q?ZPedBU+NnLRqTnD3mJoUXkoJ3guGBFQ5RhiEZ14pn6wXIg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fLvNRU+t3ZRD5KP76yrb+VABw8F5BVHf9Yc+CLSJwT6XbE6BlkTA/vNj1XDo?=
 =?us-ascii?Q?yp/AtJHviQcJyCXDaoObYDdG+Rk5mCu6MLqp/3zefx/IUTSL0JiGwD0n+sWa?=
 =?us-ascii?Q?9ooxPlVDxX2UEYa3fVAkzmu3xFzPPLlWcMgHouaQ0mVqRIvM3ldfueN27URU?=
 =?us-ascii?Q?DDseUL0pb0UkhMOQ04NtityrVwK2c5VNbM3UhNl/FTacOxWcatCCHhbCsnD/?=
 =?us-ascii?Q?qKEmKYL5eUCKApOqf5kA+z2pHzQAfpakGA98Wavo9Ttj0KZocXT5D+CzoTkp?=
 =?us-ascii?Q?TmJHiUGXy3LBKQ47ROijgRhgoaoEz6l7LQLoYWiP7YNQHmxd/sPlqMnLSA/A?=
 =?us-ascii?Q?GRQdXze3DlPve5l0k0cfEelkyDtBg2Sluz2KbRp1ysBm0TBv62WadSopyARH?=
 =?us-ascii?Q?oLSE2QXHOY9GfbRgvj8u2BCI+ITWsfBYhlzQvRiT1m7s+A9uumXgmHCQQJj/?=
 =?us-ascii?Q?EufdRQfynokPDuf+fSfvQWht737nXhOpQZtBsU52+wYvSGgh/GLasVbYnmWS?=
 =?us-ascii?Q?RTOMf1UGLCbfNyV8H6C98CovevzZpLIID5OBwKKWxIdAtMJ8sn/ZYoUJ61JQ?=
 =?us-ascii?Q?VpZX2wc6Zm4iQlVlbtbOwAlr76QuuhP02NhW+oovt0x9jmiw1hpK62zMNQUR?=
 =?us-ascii?Q?GjA7AcWEtc0Qfr3gU1cnOQY+bBypu9doyrGPOiV0lgIi950y3PGGIR3tpAgI?=
 =?us-ascii?Q?LmYN/ZN3xc09JJSJEy514DREXT7v5spo0ZtiEPb3ebnPZUrj6Bu8yFdl/a63?=
 =?us-ascii?Q?Mg4Au+X4ypPayfo3DnE8Z/87ISegfyiW29kCXZJDqpv3bwS3qEF2vTqepM2x?=
 =?us-ascii?Q?29dhEVQuK6YPO9JYclb12ZzR0oN3sXI2skAQaWNCyy6I7eEuE1YLhjqgxX9I?=
 =?us-ascii?Q?ddibFX+9mpL3v5ZoR7fQ2mrxNeiJUYn0z/g9X0Vwuqi9k59wS53noMcsD7+t?=
 =?us-ascii?Q?LK41AKeid+YJOC0IAfdesirFQRKvvcjRVWg+IuoXEae9pw565KpZwkgMAD2A?=
 =?us-ascii?Q?EDMVAu6Mv2B05Y9LByYY/gTcXcHIomQuEDPPNRAAtT+nx4leHpGXKP15PUrY?=
 =?us-ascii?Q?tD21hvO3ZQ4/0miHamn5aIWk31yODbTK3EayxVDxpUPpDmDPQ3V4iQTs01KW?=
 =?us-ascii?Q?LzNnlHmU3F8Hhn89Z6dMvQlFpI365jOT/9BWR6zc9PXr4ERyFiGQwQbCm8aH?=
 =?us-ascii?Q?3yAIGMgxl9KQLXtsun97ZF+fxCpn+N2Rvv4y/ycqjnpKJXVN2jmi7AYIWiuv?=
 =?us-ascii?Q?ZHlnX/SnmPONIzg2r2EHMTDYHSqQuZ0rYvGCTHa3j8WhuKALWL/BxGbu560h?=
 =?us-ascii?Q?DD9wCVrZegOrHiniYLV8VVRc4krUUviiaaCL0bmP4CFpDTpAgIAZFMrtyyBV?=
 =?us-ascii?Q?p6CB1HS5el9V19Zs9M7hWf/Q9smAM00vJWtAJjJhWTpCj3Lo4QFUb8sdHc81?=
 =?us-ascii?Q?AwMrNEa0ZDBAMn/lXiGbuSYJDBiS6y0sOGWIGjU2bcehRRh7ljbFvAGYRjPb?=
 =?us-ascii?Q?jkrlim/v87xnyw9awYD8ddO2myWVai/upHwRjGtggEeI8g441V54s6A8Mhge?=
 =?us-ascii?Q?w9ZWw0WlWIXEVXcYsORebKY/zx7Pbz6a3sfvu0NeeeemVDSY2G4VeYJPGEQY?=
 =?us-ascii?Q?Cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df63c209-9a83-43f9-9947-08dd763eaea3
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 01:42:54.7633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bK7GwoeCmOtF8TxWXy5BmcfMPFrV29i4wnke91cBniEkwvGaLWRaWNkO4FheVUTam76Q8nv3DA54DWim20jXNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6822
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "INFO:rcu_preempt_self-detected_stall_on_CPU" on:

commit: 1676c90fe1d89536512184b181ba7947f3c94aac ("rcu: Unify root node and whole state gp sequence number")
https://git.kernel.org/cgit/linux/kernel/git/frederic/linux-dynticks.git task/work

in testcase: rcuscale
version: 
with following parameters:

	runtime: 300s
	scale_type: tasks-tracing



config: i386-randconfig-016-20250404
compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


the issue does not always happen, but with high rate. 63 times out of 100 runs
as below table. we cannot reproduce the issue on parent which also runs 100
times.

b9336300fc58caf3 1676c90fe1d89536512184b181b
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :100         63%          63:100   dmesg.INFO:rcu_preempt_self-detected_stall_on_CPU



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202504071614.5b3474f3-lkp@intel.com


[  222.902772][    C0] rcu: INFO: rcu_preempt self-detected stall on CPU
[  222.903395][    C0] rcu: 	0-....: (104997 ticks this GP) idle=9684/1/0x40000000 softirq=9708/9714 fqs=25563
[  222.904256][    C0] rcu: 	(t=105000 jiffies g=14050 q=21918 ncpus=2)
[  222.904743][    C0] CPU: 0 UID: 0 PID: 779 Comm: rcu_scale_reade Tainted: G                T  6.14.0-00007-g1676c90fe1d8 #1 1127e04463e811f7443df18d03ac4ae85f721f92
[  222.904748][    C0] Tainted: [T]=RANDSTRUCT
[  222.904749][    C0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 222.904751][ C0] EIP: rcu_scale_wait_shutdown (kernel/rcu/rcuscale.c:443) rcuscale 
[ 222.904757][ C0] Code: 89 e5 ff d1 5d 31 d2 31 c9 c3 3e 8d 74 26 00 55 a1 40 6d 5a ca c7 05 20 0c 1a ef 01 00 00 00 a3 24 0c 1a ef 89 e5 5d 31 c0 c3 <3e> 8d 74 26 00 55 89 e5 57 56 64 8b 35 00 aa fa ca 53 8a 86 d8 09
All code
========
   0:	89 e5                	mov    %esp,%ebp
   2:	ff d1                	call   *%rcx
   4:	5d                   	pop    %rbp
   5:	31 d2                	xor    %edx,%edx
   7:	31 c9                	xor    %ecx,%ecx
   9:	c3                   	ret
   a:	3e 8d 74 26 00       	ds lea 0x0(%rsi,%riz,1),%esi
   f:	55                   	push   %rbp
  10:	a1 40 6d 5a ca c7 05 	movabs 0xc2005c7ca5a6d40,%eax
  17:	20 0c 
  19:	1a ef                	sbb    %bh,%ch
  1b:	01 00                	add    %eax,(%rax)
  1d:	00 00                	add    %al,(%rax)
  1f:	a3 24 0c 1a ef 89 e5 	movabs %eax,0x315de589ef1a0c24
  26:	5d 31 
  28:*	c0 c3 3e             	rol    $0x3e,%bl		<-- trapping instruction
  2b:	8d 74 26 00          	lea    0x0(%rsi,%riz,1),%esi
  2f:	55                   	push   %rbp
  30:	89 e5                	mov    %esp,%ebp
  32:	57                   	push   %rdi
  33:	56                   	push   %rsi
  34:	64 8b 35 00 aa fa ca 	mov    %fs:-0x35055600(%rip),%esi        # 0xffffffffcafaaa3b
  3b:	53                   	push   %rbx
  3c:	8a                   	.byte 0x8a
  3d:	86 d8                	xchg   %bl,%al
  3f:	09                   	.byte 0x9

Code starting with the faulting instruction
===========================================
   0:	3e 8d 74 26 00       	ds lea 0x0(%rsi,%riz,1),%esi
   5:	55                   	push   %rbp
   6:	89 e5                	mov    %esp,%ebp
   8:	57                   	push   %rdi
   9:	56                   	push   %rsi
   a:	64 8b 35 00 aa fa ca 	mov    %fs:-0x35055600(%rip),%esi        # 0xffffffffcafaaa11
  11:	53                   	push   %rbx
  12:	8a                   	.byte 0x8a
  13:	86 d8                	xchg   %bl,%al
  15:	09                   	.byte 0x9
[  222.904759][    C0] EAX: 00000000 EBX: 00000200 ECX: 00000000 EDX: 00000000
[  222.904761][    C0] ESI: 00000000 EDI: eb9536c0 EBP: ed60bf68 ESP: ed60bf5c
[  222.904762][    C0] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00000206
[  222.904766][    C0] CR0: 80050033 CR2: 0805b750 CR3: 2ce73000 CR4: 00040690
[  222.904768][    C0] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[  222.904769][    C0] DR6: fffe0ff0 DR7: 00000400
[  222.904771][    C0] Call Trace:
[ 222.904773][ C0] ? show_regs (arch/x86/kernel/dumpstack.c:479 arch/x86/kernel/dumpstack.c:465) 
[ 222.904785][ C0] ? dump_cpu_task (kernel/sched/core.c:10087) 
[ 222.904790][ C0] ? rcu_dump_cpu_stacks (kernel/rcu/tree_stall.h:361) 
[ 222.904796][ C0] ? print_cpu_stall (kernel/rcu/tree_stall.h:690) 
[ 222.904803][ C0] ? check_cpu_stall (kernel/rcu/tree_stall.h:792) 
[ 222.904808][ C0] ? rcu_pending (kernel/rcu/rcu.h:150 (discriminator 55) kernel/rcu/tree.c:228 (discriminator 55) kernel/rcu/tree.c:3607 (discriminator 55)) 
[ 222.904813][ C0] ? rcu_sched_clock_irq (kernel/rcu/tree.c:2651) 
[ 222.904818][ C0] ? update_process_times (kernel/time/timer.c:2517) 
[ 222.904824][ C0] ? tick_nohz_handler (kernel/time/tick-sched.c:278 kernel/time/tick-sched.c:297) 
[ 222.904829][ C0] ? tick_do_update_jiffies64 (kernel/time/tick-sched.c:285) 
[ 222.904832][ C0] ? __run_hrtimer (kernel/time/hrtimer.c:1801) 
[ 222.904838][ C0] ? __hrtimer_run_queues (kernel/time/hrtimer.c:1866) 
[ 222.904845][ C0] ? hrtimer_interrupt (kernel/time/hrtimer.c:1930) 
[ 222.904852][ C0] ? sysvec_call_function_single (arch/x86/kernel/apic/apic.c:1049) 
[ 222.904858][ C0] ? __sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1056) 
[ 222.904863][ C0] ? sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1049 arch/x86/kernel/apic/apic.c:1049) 
[ 222.904866][ C0] ? handle_exception (arch/x86/entry/entry_32.S:1048) 
[ 222.904873][ C0] ? sysvec_call_function_single (arch/x86/kernel/apic/apic.c:1049) 
[ 222.904876][ C0] ? call_rcu_lazy_test1 (kernel/rcu/rcuscale.c:443) rcuscale 
[ 222.904882][ C0] ? sysvec_call_function_single (arch/x86/kernel/apic/apic.c:1049) 
[ 222.904885][ C0] ? call_rcu_lazy_test1 (kernel/rcu/rcuscale.c:443) rcuscale 
[ 222.904889][ C0] ? rcu_scale_reader (kernel/rcu/rcuscale.c:475) rcuscale 
[ 222.904894][ C0] kthread (kernel/kthread.c:466) 
[ 222.904899][ C0] ? rcu_scale_wait_shutdown (kernel/rcu/rcuscale.c:459) rcuscale 
[ 222.904902][ C0] ? kthread_affine_node (kernel/kthread.c:413) 
[ 222.904906][ C0] ret_from_fork (arch/x86/kernel/process.c:154) 
[ 222.904909][ C0] ? kthread_affine_node (kernel/kthread.c:413) 
[ 222.904912][ C0] ret_from_fork_asm (arch/x86/entry/entry_32.S:737) 
[ 222.904915][ C0] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250407/202504071614.5b3474f3-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

