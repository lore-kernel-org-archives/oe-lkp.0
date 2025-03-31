Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30FB21B8F2
	for <oe-lkp@lists.linux.dev>; Mon, 31 Mar 2025 14:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743431871; cv=fail; b=aZkpWCIXnURJlcWCPQGHNlkxg1A6cfc/RZ+MahhCna7+OM7KMXmD+/O1HBNkbNTZBaB880h/bK9zvv7jjRQmfa9APs6PyOni83mTzhJygPtjwgQv03ceS8YBZ/ljfCa6NanxvEo+0+OJR1Qbw3QEom0ys5ALu09ABiKCs8v795g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743431871; c=relaxed/simple;
	bh=p9dhMg5YB50c1467BtgTYr8JR+qcXFuaROtBJMzo+0U=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=GEIAGMdOAxVZEgvmKI+dq/2//w9+HZ92AL4zDE9co/PrlvvjB4RwPXSu5wm7zVOjyOg8+VcNXuDleh3cdtQgGB6z78lckzZMc90Y/mo2d0J1XfTrL3J9VwancRHBcjpdE/SLZ3tfwx2XZK9wun37jN6u7pc2MeCzZ5qdCMDJwPo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cLIljhey; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cLIljhey"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743431870; x=1774967870;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p9dhMg5YB50c1467BtgTYr8JR+qcXFuaROtBJMzo+0U=;
  b=cLIljheyg8aTX4fp7Lq3PC1XAtq/Gco5Ti0oRAlhDzIbk6aj2qW8mz1h
   kk5NieZ3mRx1o47WIF2XWHJPv6O9CQDxONSoilmz2FbcfT9f2ZWGB6u4e
   gLAoaDDPIWTe+WxlfyrA/27TIBat0PBoORijfpZjO/Ptlm2s9Qga78qgt
   rz5WF6KnSTQ44/2/SGsa/IFDxR5OkG26QOJTg2XU+cUvbWQtVfco9kA/3
   +YZxR7ZsFc/LAQzmnds7cZoNgti5LX4Blurkmf4IWcXBmcX9F3TSZgPSc
   UT0+4wdTyQYSSp+JzuKagjW3twPapUyhQJFggHfAR8gr5dQg11VwLnpfT
   g==;
X-CSE-ConnectionGUID: est3vvDWRz+n9vp9OvzFoQ==
X-CSE-MsgGUID: Lj090b2PQtSbJsauNxTHng==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="48387456"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="48387456"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 07:37:49 -0700
X-CSE-ConnectionGUID: tqmWPYtdTcaFe1rlXHHDNw==
X-CSE-MsgGUID: 73cdnVQkQWmZZPL6N9nSig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="126092495"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 07:37:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 31 Mar 2025 07:37:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 07:37:48 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 07:37:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BBJZDk+xp/12lv2Dt1Pwkffu9CwkYZ3b3sZS8xAKX4ISG2AFjR2Tvs/HyKuBpZEvowsRCYOujIQL5P7UXo2AYNk6df2Itg7UTbemSz835P1C/J2Qov0NipY4CjJMYBukH902OqLrv9BjNTLxq9m40cGzV3IKixyVs8pAvNzMDOPfZyr+Pn7l7EMmGcbplYqh0DTozPBoSLuX5FYcMAEuwk1o8+HRea+FNpnKR9MzJNch6PkI8HATW/83RZwIK1SOrlgCSVc9b6LaT/XSoaDd/drxN9XmbWyJ+8Zx2zg1KxPQSqjHaLvIDXX4Ypu4m8ESubb1J4gYYFwuioeaLlqnFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7oNXUp9un+3JfyHWQuuFumRLM+uon8u9Gqk9VzZ4e/8=;
 b=PuxgQEAVnj5VWY3zNTs6X0sf6AoK8yRaF/wn9DpTMP8in8Cs6u8i8SC06SLfjCNVAYol+8ZBW8MXxxnrgSMPDnxxXngrlGIYoNNeIMbaXG+8TPHxa4ET+GbxT7/6woywHv2p19GbWD+2SHg5Iar7sQdM7w/d7guu7u2gTuz/92avZaXxDgQI/+yGs1LbSdzb/eJ+YNVl0vOIJFi/nF6Wj8erLHGIegZWdXZoqjFDX/nFfk1+PCwsr+yVUGJF+GC6yETvkCQpFsY1NIEe9LZ9jdSOk5j0z0b8OTld6ejRmBYen8JdRtkTQ4boB938nJQnL6ccDU5yIecGk+EVcEyx5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Mon, 31 Mar
 2025 14:37:30 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 14:37:30 +0000
Date: Mon, 31 Mar 2025 22:37:22 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [jarkko-tpmdd:keys-graveyard] [keys]  aa52a1fbfc:
 WARNING:inconsistent_lock_state
Message-ID: <202503312252.bef52733-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0055.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::16) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH7PR11MB6522:EE_
X-MS-Office365-Filtering-Correlation-Id: 9aacb7bb-7851-481e-c1e7-08dd706190c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Qd2b85s2YCcLIsEQpPaXdK5+qWJbICAoWd7aSaXTPjQKHkTF9ICum3PBWTt+?=
 =?us-ascii?Q?0YgfK7O6KM7bIKkTPYYRrMd0mJBiRQNXGosjKO07LDffwg2aJ0B0KEWBTfns?=
 =?us-ascii?Q?luzfzGhqlU4fTann5OzhG0U7DqbUiKelYjWxYpgR7qNbDfnVj4qqoG1zdyO4?=
 =?us-ascii?Q?F0aNyuMk60Pfu3XDwYU8j+vLCVUl0AgGjsQe6f2NLtNuwR/6B3tVHdIUyme6?=
 =?us-ascii?Q?wv2dh0ZeSLpt1yi9RFF9lg7LAA+YOEAmznRDbEZAYYbflTJhvJLWpi5oE5YS?=
 =?us-ascii?Q?KMlACDEfmLCvIPVj3Cs7Ebp4mscn9KOkSjgZeGKkgh5Zk3UCdfe85dTxuESo?=
 =?us-ascii?Q?6X9AIVuyIhXdjIMC5XWjroIWgcdK13EEAbgoPb6v5egSh3KGV8Loa48LMJR5?=
 =?us-ascii?Q?YPcRMpw+bsNZSb6bHQlUzP7a++LaOrJnVevo+ONfgHL/SIFxPFe+vJP6JZrg?=
 =?us-ascii?Q?Q/CgHQbVllnJusPQYZlKzsYH1wnfqHgKJqoh4pJEj7GOFCo4dBXo/2PZRe0h?=
 =?us-ascii?Q?8MdcX6nbeUY3P7ZeM9/ue7S1yJdUEoeAuPAXIPVusARSF1PkDnXuCGxOR1ql?=
 =?us-ascii?Q?BUw+80Jtacn+BPWQOnbSyc5elqALfaMQfcfRe+nLLNzI3s4RQf+LAvGRL2cr?=
 =?us-ascii?Q?jqe2ulcbKZyP00rgbfJr4KOGYALoedgtBYaOgtnqZ/MttPj4zCF9T5UjgsRF?=
 =?us-ascii?Q?LEainAqIcGihJaD2G3VUVoBCXfy+RxPbTPkiclz6gsi5CXBo/8didue/L2I4?=
 =?us-ascii?Q?/5kJ++62+l/VCwkLfMfklQDNKqZBxeoKkchcKMCIzhUEuigrrSfx9RrmuZii?=
 =?us-ascii?Q?HbUiSxqZvLXvSdKVc9swbLbpdI8cDcOFbZp38Fb1wk8b56gNuqPPx56B+w0g?=
 =?us-ascii?Q?84P7ckVE7XkxH27F4VPwT4YDoH3+Rro5fewWlcyW/os/wLXRBRi1I3i/ausI?=
 =?us-ascii?Q?1ZLZcmpW/qtgopm0zqAJkoa/eK+McAGJXKtD3QDcPRHkxHMVn0Q7XwnPdDKz?=
 =?us-ascii?Q?DEn7CBTdkWRZAzqakG1/N1FhjKUB1Jt+S0VxUhy1pbTKxtWSuIdEdIPKdE25?=
 =?us-ascii?Q?hXVLzwtzGCKNeMsqaGfgOoIVSgydtOJo+qtrFPifAc7XsTNBQy+1cIY3NIif?=
 =?us-ascii?Q?vfkddUwA9WGSRjN/fszCFaJ03EL/vqgf9tW9M842FJUhj0/4K/ctoqUsTyEp?=
 =?us-ascii?Q?3pRoktk0XuylZb4EJVSPlOzvatkDevonet8GzcyYnU3EDyCKUks9/KpPqR2e?=
 =?us-ascii?Q?jqTJe4A0FYLlppHkjJyAk7yRsX5OttvQ/BC04zdgbO9QS55kMN2gJgubMHEs?=
 =?us-ascii?Q?o2tJ+PHWs4KyZPmQMk401g3oZfJ03CK7EhqQVZFe0feqDA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CZGvcauK6DhLYZNnz4fRuSylHa9Ib/zpXWY1dLboJuuzxjo73mBaZR90acq/?=
 =?us-ascii?Q?+ddVjrMGQI3WjK/qoorVkFCCpOMN7rAsE6xdK+Bc80RLlXOqnGI8Xk9wVKCR?=
 =?us-ascii?Q?46+3UHgW2eQ4qgxwkOp5Mig56R3DrnHmhS/duPuwBT1j/qv0A996RlkAKJzv?=
 =?us-ascii?Q?g0E250SAFaRhP9dK+A9kGvgSO0OBrnQKNnQH5OYVlpBVAp0GuP6VVDH3zXaH?=
 =?us-ascii?Q?31VkNM4TS+Pw+XtrF66s7tiJLRl3a46Fw0ys7qDSjwR8qkj05GkBZg/vcPds?=
 =?us-ascii?Q?zeaRny+daiz/97hbvI95+AcygnxBvPw5HG5zWp+W30VgrVgzWVP1of9IWwhi?=
 =?us-ascii?Q?SPb9wgnjka1lpaJ1fsVbCDtwsvNaC0WqoER8urzA47NActiDqsqw6wn8yKNg?=
 =?us-ascii?Q?URRsWpHm/SeN4/sEicCDSfDsUtHzRLtJECeYZKDQvS5NpVblYXJJSR5FrHeV?=
 =?us-ascii?Q?k1wkdVaKrdcXvdjHGwRy1dsKffgMSDh9+AxygjJq3w38mJEv7d0rbPgn4k1D?=
 =?us-ascii?Q?RjxF6tzxihu4VZNO1/mDD/wGMKG+lyJVtcUfvbS9PelQaBTt1+LML6OWXsIT?=
 =?us-ascii?Q?FZRjrq2/Bppeu3k13x/3crhIdCTvHVCeINSNf9xyepLcwg29x6MJ7FrPMEmV?=
 =?us-ascii?Q?Tm6m8VuuUJUcFjw7k29+aqliNfXiDDCe8JcpfxPB3nvYPAuLi1KgsPRM3y3b?=
 =?us-ascii?Q?bFdO6sWlkvq5LGKtd7orX64TCZVkQTVNSJ6jXjwFfiegkMQq02t7LA4QNaEW?=
 =?us-ascii?Q?tNr8RnCWGVepi9TgA83R8BTBCXs/+5yixBpf+oe0QQmVvhmYabj9p/DwLwBe?=
 =?us-ascii?Q?ekQlQWFksOlza6re56ZTgsb+FwZWlsmUJkmQHLjuUJ/2UudnlJnstNyH6O6K?=
 =?us-ascii?Q?MDo7F/DvKPeQ+b9Wle93ioqJm4J5WwUVwnothiU4GbRPKOao9fvmqIpBilax?=
 =?us-ascii?Q?dMIEMby0Q6Qm64MgsSzMrFssaUHB+Eu2q7HkHRXQgXv15jF6jVo1jRZ8zmx+?=
 =?us-ascii?Q?9HvaSYmJRfk1RbVojtAWwuKpUgUdrcwC2tByVn59/xaclkRK/aD+AU1EXCJp?=
 =?us-ascii?Q?mM09MzfEFMHbBpWDIdnACQVhFFT8tpyNXsPXa9USj6UhzeM+jlPhGMi/ajSh?=
 =?us-ascii?Q?GDTjMzrKoifI9XlyHiPJDxV/49fBD9yELUhzGpVNxHBTWCxURc8zpdUoU6aG?=
 =?us-ascii?Q?BreKcBJkmjC1SCdlTroS2J55EkY5EX/c4LHgOw57BbUzWo6aanP/DeFbOPIo?=
 =?us-ascii?Q?RpZ+VM3xQwsOELcNxq+LMY8Dka9Dhn4r1phAsaZ4WNdgiLMmccNAQ9nsp3Lw?=
 =?us-ascii?Q?PV1qZJp9ZJ0kvYp3itLBzTUk7SsXkmlEGHZ5x8o2K133xjEGhOFct5HKhKl3?=
 =?us-ascii?Q?d0/CAtCmr7KqBIujR3THMxIoeWs2M33Hn9x+SxdHTKrk02/EvJq9mk6PJ6ZH?=
 =?us-ascii?Q?KFGIyCnWa2gfW+tarsD0nhwOrEwzv15D/+581cv68q7iZLZzdRNK8IIluAr1?=
 =?us-ascii?Q?XG8vwEoV+fyS3xvUM24nwl2pJIFuj1KM2XylcLca0mgWOQ/yki3St44YMNEf?=
 =?us-ascii?Q?wQf5tFnNRQqX0R3F8gWyGd5PJa404j3ck3ilFujb2S9tgNJV7q8YF7A8MPH8?=
 =?us-ascii?Q?ZA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aacb7bb-7851-481e-c1e7-08dd706190c9
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 14:37:30.1161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OSRMhr6MEB4ds41JtFvNmrz3WETvdNUeXECXFIoLJw258yJICtA/XxhXgx4v/tGvWhPbgfpFVAMLY/6Y7XAcnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6522
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:inconsistent_lock_state" on:

commit: aa52a1fbfc9a9fcfe467c256dc2d91d8333db80e ("keys: Add a list for unreferenced keys")
https://git.kernel.org/cgit/linux/kernel/git/jarkko/linux-tpmdd.git keys-graveyard

in testcase: boot

config: i386-randconfig-141-20250330
compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+-------------------------------------------------+------------+------------+
|                                                 | 980a573621 | aa52a1fbfc |
+-------------------------------------------------+------------+------------+
| WARNING:inconsistent_lock_state                 | 0          | 21         |
| inconsistent{SOFTIRQ-ON-W}->{IN-SOFTIRQ-W}usage | 0          | 21         |
+-------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202503312252.bef52733-lkp@intel.com


[   10.186009][    C0] WARNING: inconsistent lock state
[   10.186875][    C0] 6.14.0-05893-gaa52a1fbfc9a #1 Tainted: G                T
[   10.188003][    C0] --------------------------------
[   10.188912][    C0] inconsistent {SOFTIRQ-ON-W} -> {IN-SOFTIRQ-W} usage.
[   10.189954][    C0] ksoftirqd/0/14 [HC0[0]:SC1[1]:HE1:SE0] takes:
[ 10.190715][ C0] 432b47f0 (key_serial_lock){+.?.}-{3:3}, at: key_put (security/keys/key.c:663 security/keys/key.c:647) 
[   10.191504][    C0] {SOFTIRQ-ON-W} state was registered at:
[   10.192152][    C0] irq event stamp: 101196
[ 10.192693][ C0] hardirqs last enabled at (101196): _raw_spin_unlock_irqrestore (arch/x86/include/asm/irqflags.h:42 arch/x86/include/asm/irqflags.h:97 arch/x86/include/asm/irqflags.h:155 include/linux/spinlock_api_smp.h:151 kernel/locking/spinlock.c:194) 
[ 10.193640][ C0] hardirqs last disabled at (101195): _raw_spin_lock_irqsave (arch/x86/include/asm/preempt.h:80 include/linux/spinlock_api_smp.h:109 kernel/locking/spinlock.c:162) 
[ 10.194643][ C0] softirqs last enabled at (101168): handle_softirqs (kernel/softirq.c:408 kernel/softirq.c:589) 
[ 10.195866][ C0] softirqs last disabled at (101173): run_ksoftirqd (kernel/softirq.c:418 kernel/softirq.c:951 kernel/softirq.c:942) 
[   10.197069][    C0]
[   10.197069][    C0] other info that might help us debug this:
[   10.198605][    C0]  Possible unsafe locking scenario:
[   10.198605][    C0]
[   10.199624][    C0]        CPU0
[   10.200118][    C0]        ----
[   10.200607][    C0]   lock(key_serial_lock);
[   10.201190][    C0]   <Interrupt>
[   10.201699][    C0]     lock(key_serial_lock);
[   10.202284][    C0]
[   10.202284][    C0]  *** DEADLOCK ***
[   10.202284][    C0]
[   10.203553][    C0] 1 lock held by ksoftirqd/0/14:
[ 10.204145][ C0] #0: 431e5c64 (rcu_callback){....}-{0:0}, at: rcu_lock_acquire (include/linux/rcupdate.h:330) 
[   10.204992][    C0]
[   10.204992][    C0] stack backtrace:
[   10.205856][    C0] CPU: 0 UID: 0 PID: 14 Comm: ksoftirqd/0 Tainted: G                T  6.14.0-05893-gaa52a1fbfc9a #1 PREEMPT(full)
[   10.207648][    C0] Tainted: [T]=RANDSTRUCT
[   10.208460][    C0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   10.209410][    C0] Call Trace:
[ 10.209878][ C0] ? dump_stack_lvl (lib/dump_stack.c:124) 
[ 10.210436][ C0] ? dump_stack (lib/dump_stack.c:130) 
[ 10.210988][ C0] ? print_usage_bug (kernel/locking/lockdep.c:4147 kernel/locking/lockdep.c:4295) 
[ 10.211641][ C0] ? print_usage_bug (kernel/locking/lockdep.c:4011 (discriminator 1)) 
[ 10.212244][ C0] ? valid_state (kernel/locking/lockdep.c:4058) 
[ 10.212822][ C0] ? mark_lock_irq (kernel/locking/lockdep.c:4268) 
[ 10.213418][ C0] ? mark_lock (kernel/locking/lockdep.c:4754) 
[ 10.213985][ C0] ? mark_usage (kernel/locking/lockdep.c:4643) 
[ 10.214568][ C0] ? __lock_acquire (kernel/locking/lockdep.c:5189) 
[ 10.215145][ C0] ? key_put (security/keys/key.c:663 security/keys/key.c:647) 
[ 10.215661][ C0] ? lock_acquire (kernel/locking/lockdep.c:472 kernel/locking/lockdep.c:5868 kernel/locking/lockdep.c:5823) 
[ 10.216212][ C0] ? key_put (security/keys/key.c:663 security/keys/key.c:647) 
[ 10.216721][ C0] ? __lock_release+0x48/0x104 
[ 10.217314][ C0] ? _raw_spin_lock (include/linux/spinlock_api_smp.h:134 kernel/locking/spinlock.c:154) 
[ 10.217874][ C0] ? key_put (security/keys/key.c:663 security/keys/key.c:647) 
[ 10.218407][ C0] ? key_put (security/keys/key.c:663 security/keys/key.c:647) 
[ 10.218934][ C0] ? put_cred_rcu (kernel/cred.c:80) 
[ 10.219497][ C0] ? rcu_do_batch (include/linux/rcupdate.h:341 kernel/rcu/tree.c:2570) 
[ 10.220063][ C0] ? rcu_core (kernel/rcu/tree.c:2826) 
[ 10.220629][ C0] ? rcu_core_si (kernel/rcu/tree.c:2842) 
[ 10.221170][ C0] ? handle_softirqs (arch/x86/include/asm/atomic.h:23 include/linux/atomic/atomic-arch-fallback.h:457 include/linux/jump_label.h:262 include/trace/events/irq.h:142 kernel/softirq.c:562) 
[ 10.221774][ C0] ? run_ksoftirqd (kernel/softirq.c:418 kernel/softirq.c:951 kernel/softirq.c:942) 
[ 10.222312][ C0] ? smpboot_thread_fn (kernel/smpboot.c:164 (discriminator 3)) 
[ 10.222909][ C0] ? kthread (kernel/kthread.c:466) 
[ 10.223434][ C0] ? sort_range (kernel/smpboot.c:107) 
[ 10.223956][ C0] ? kthread_is_per_cpu (kernel/kthread.c:413) 
[ 10.224522][ C0] ? ret_from_fork (arch/x86/kernel/process.c:159) 
[ 10.225067][ C0] ? kthread_is_per_cpu (kernel/kthread.c:413) 
[ 10.225638][ C0] ? ret_from_fork_asm (arch/x86/entry/entry_32.S:737) 
[ 10.226210][ C0] ? entry_INT80_32 (arch/x86/entry/entry_32.S:942) 



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250331/202503312252.bef52733-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

