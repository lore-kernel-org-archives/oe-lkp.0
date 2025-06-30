Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5413D286D70
	for <oe-lkp@lists.linux.dev>; Mon, 30 Jun 2025 13:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751291614; cv=fail; b=fAY8ggvgmiZti/SFXk5e7gKc5fhxP+fANupvE5OfURF5WNmwq1Bf+la01KI2YqPqxh0lPpvLZOV5ymbGNK2jfasWy4pBpSaVyVgvJILxnXaoV95fm9Bmx2qTnYReRfn/51LjD6RbRCpQVLa29FJisch/CxS7Bp2G1SKiK2tUgRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751291614; c=relaxed/simple;
	bh=gCu649renfYVtnmLHd0Bi9Ic6WOen9gyUI6xQvQxnYc=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=uB6xJczwhqQly2soPjidN50dWn7eliqWq5IzB2nC1jb+iMA2Mu4xc6oleZKfLX9AyEKtu/KoGB6vzLwkWNOXRHmrayimgGkerGY0rRustMJmt64zSKVUvXndXDh3IwNABhJeYsFn7d5Eqt1y/51V3XREZn4Rjxgs8CsyUF9XBPo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G+FYKMxd; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G+FYKMxd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751291612; x=1782827612;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gCu649renfYVtnmLHd0Bi9Ic6WOen9gyUI6xQvQxnYc=;
  b=G+FYKMxdKqg+G6w7qZy7myl0JdvzFy6kPm0VVZcNhNP/ks3TdVoWlHoi
   +MfTL8McvEE5/REE5JkFFxqIf8negsJbhVhXpmepX18OkIVyejEcWfsJY
   5AWXimu5Tt12oxWcLiRKTlPTB+Lybqkkj0LkpR7c4Zsba5Vv0icvEaIPi
   H40JDTDP31YmeXGeUBUEPkruI5TA6KQ5W27HycLXq611GZBQuIQJ90MgG
   jbZ8scGbn5vbFyTA+XW1sn0A+S+aJdFg5lKWyWtcGiYBCBvx+qW8lzdv2
   ABfJQdwvtudArDcHxc0fHpNVXiIyN7UZk90X09+57foROJoZhdFG9ZkSI
   A==;
X-CSE-ConnectionGUID: emmhA1pYQzaLOPV+emJDZA==
X-CSE-MsgGUID: GpXoLKGWRzm/fw/gr44vpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="52748286"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="52748286"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 06:53:31 -0700
X-CSE-ConnectionGUID: 3XbHcQrqQE6of5hhrPyGlQ==
X-CSE-MsgGUID: M5xb5V7ZQRGXmtZR85RKRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="152858153"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 06:53:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 06:53:30 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 30 Jun 2025 06:53:30 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.74)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 06:53:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NTj3VQXI0/jf7w2+P7Ctbb2il/lc/BTtLx7aOHhNQHo12nOH+dbYZ17xpsgfT3QmtakzmHWg1leNl42vr+D53+1rKUfEX1yGvoqwg56ScdogIQmawnslJn5Ca/hqt2zeh1tlFJckbTnVJEVIG+H4aAZyd4AvBvv/PRXp043k2xmRbLXDFNUCnngxP/BIVOYUFNoRfv/87Br5vZhTLL3LzfejCGRg50SdILVs+CkRRTWjUdDe7oyjPhrOp3BvQx/V/XezgidbMQnAzg5sicMIsgxWR7SOO0DFbI41nV9r+whIpq3iE6cuND8yEklto/c27poslg+ukZP6lDusuNJXHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/9PwmkX8a/il4cI+tsBxQMjA4SRIN1nDDyhsDFTxkRU=;
 b=EFr5v185BCGDB16P2RwCgUN6kXzDI79jcB2neZGsUPGQGnJR5ccaamjVetZSwgsS5B7m6b7Led63rMrVogw3zEomyF1RhJfxBNyQqH7qg1OGjlK0mewQBLHyLg02zWQzWtsXynyIm6xLlekyLjFqsuW84NgTBCQXinA/UW2+Z8WlVxtrH2FTJUJ3kS/TiViwH9d0yxsoFaOOtjUS2+TI3pXd7u1YtFFhNw2u79qvIhn/wRo+ZxM8UJPdDZ5pOCOwgL3QGUcHRrDH4x3d7+51kPHJp9MU2h/MQG96i1M6fnKgrznZpduVTM7a6nLPO47lOWubzr4dd4kqbkWfPhW+gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SA2PR11MB4938.namprd11.prod.outlook.com (2603:10b6:806:fb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 30 Jun
 2025 13:53:15 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8880.026; Mon, 30 Jun 2025
 13:53:15 +0000
Date: Mon, 30 Jun 2025 21:53:06 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Frederic Weisbecker <fweisbec@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [frederic-dynticks:kthread/core] [cpu]  2ac9a5ef53:
 WARNING:at_kernel/cpu.c:#lockdep_assert_cpus_held
Message-ID: <202506301054.731c76b6-lkp@intel.com>
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
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SA2PR11MB4938:EE_
X-MS-Office365-Filtering-Correlation-Id: d915d2b3-a30f-4631-1bef-08ddb7dd75ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?G8zmy3He6i9C9FKqG5Q8/+pqTzZ1u+bsw5PPwUWJ2q29qaVmZqUQRi8uTVm0?=
 =?us-ascii?Q?j4MlhcAg4leNPbvHYCHD4yPA5hvvv1ph5KxQR1WDtnoJ3qNgjIS/2MXtbpqR?=
 =?us-ascii?Q?UfKKBHh+U6KosXz3GJy8FbvEWyvymjt1DFSdNEvRCki5FdgM0PuF5dRiilBu?=
 =?us-ascii?Q?ULDk9s6ZC9lB06AUyT3hz3Os5DIzcVqWcLjLJ2jg6oXFlKhdX8zlf/L26Szl?=
 =?us-ascii?Q?w/o7Bi1t1mlcbmg+5QcjcO2x5a9pl1ec9zhUD8Tdw70pxp73GM1GRy6eV1gY?=
 =?us-ascii?Q?BXm0HRH2ayJU3UkyOI9TiVHxZePT842UHCXr8lKFTrhwN7H/bPRUhsm9owxA?=
 =?us-ascii?Q?+6ril9oLXv/oltuXDApoJfFBtBVsu4m0ay9IauWOY8aR3azwk2TKivOcloQh?=
 =?us-ascii?Q?nkG1D4WPO/g+aFxDJGfDUoQ7knJghX8Px7e38FBq/ub81BHEyfu491tFdlJI?=
 =?us-ascii?Q?giNLLYg40Zy+5YCdM4n2yt9aCLSFxc12PTBqiYBmyZEIP8Inq9hepjrOOw6x?=
 =?us-ascii?Q?loE+FiOSiFbcuWNUw37F3UbVKPKgg+moz8ntrLGysLaeEwBBP6WR7mXQeBxx?=
 =?us-ascii?Q?61ZqsRiUD094WKavFlS/S4e31cCX3z+CgGxUU5Y9pSSASETJFmhDrtO2Kbre?=
 =?us-ascii?Q?W50clmK2BOS/8qk8Aqb6Z20P8lkdJBglEonTAO+wcBVIuU7i5DD6BRQzJ/G4?=
 =?us-ascii?Q?8+1HMxiPO6f3w3UaW9PTFcZxokPi+s2S34xIxdnw78chNrHE0GIfieyo6tny?=
 =?us-ascii?Q?VMClZa42sTeK0LQtvxQrMlsFVbcNoH2Y20s/oisJwVkz+djYhofJIpRKI2dB?=
 =?us-ascii?Q?zAbuwHIKJRmGEXsZWzv6Qx8FdzzUi/Dn8O6csLReJR40O28XJoQGX68JeWRv?=
 =?us-ascii?Q?aLNHueVhsjGVroqN4P5tq0scThvv6hCFkupmwJDzL31/8KULviXhtiKhnToE?=
 =?us-ascii?Q?N4Ee+R9AJIWSsqGfCGnrmYhSmL3uyozX2SaPOkJFhgnJ44encdG9yRXmV+pI?=
 =?us-ascii?Q?gIXvwTZrWzDpsfHUCTA0YsOTHDDsTxhw8PcMXxJJjVSWn+FcPAVnjvNDDJGz?=
 =?us-ascii?Q?2QGSVx0715mc9W9znBX9kvvOumoeZzV+5EesNuB5iRTv2hk9ULwUhZGaP6qn?=
 =?us-ascii?Q?nPdTk2MF37Hc4ghrXMdhFF3KlOmnpXJD4JxkT/qJgmueFl4L/XhRwADhpWjP?=
 =?us-ascii?Q?bKvTLPLfydi3Cnu60Hml37xNUZ6L7oulYIP4PDE2NZu+MYLj1MvdMpI6IQ43?=
 =?us-ascii?Q?SVUJCqplW8LpewQsUqzb7wiX5NXKE/wzmgl2ZuapNc9kkU++G92y85n4waei?=
 =?us-ascii?Q?ZZpDQ6I3SAlpGuthgHjRfOmb7NC+Ex1xW1svwFVzk6D3beyvpxRQKWW08cU1?=
 =?us-ascii?Q?X0VkIzhVugCyI+4i0v4euMr8cYB3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nZDAfEkYiVSg+mkvzS8+EWJeIen1k97owR5MwePsv0g+ps3cNT05x4utJvey?=
 =?us-ascii?Q?mnEhWvHmuGYeDj/eN6hvc+xe4LZY2YAzOsXk3srlRKPsXozeSwy9eQfRjT9a?=
 =?us-ascii?Q?5fT9AvtU5/IbWJVFQmu66iNEuOoSvhMTYhT4fIc5BVTPnc7TAi3q/KQ0RvFq?=
 =?us-ascii?Q?080ss7JGqkVRnKV/ZVxhAV6Des4pW4lKDKx+luO/ysj5EYJejmnSvndRhJrO?=
 =?us-ascii?Q?geyndmWOMae08Wacf/2sVb4pVG5Z4/3NMPIdjaScrzxN2GHl2zvN/qXkyssl?=
 =?us-ascii?Q?jNpsyK0Yse7xVNCDOk7P0rY2dlN8/kVHA5II9v0AQrrOPYPEDC16e7PllOz7?=
 =?us-ascii?Q?zFvVyRIYIhUm/7/zo3lc6iKNWq1rUhjLYo/DbG9zbO8+cSd4GVqKbxf7kqhm?=
 =?us-ascii?Q?2tx9YBeIFoVTLDyMKV1x4wNUlzyDKtmENxuUM7GsSIYZ1dO/J9As1vPE0cqU?=
 =?us-ascii?Q?onhBp92sDVOxt1UDoWmmucdPApYXsaR8H+lhvc9u+94vhUEcttmp4g10JfSf?=
 =?us-ascii?Q?VMtt+9DUYHh2XshqUKNypu5BUhweQWdG9TJxeGnmuSmmC0CEUPc4GSSwrl8z?=
 =?us-ascii?Q?hSbwoVOKSFUMTYoA5gROHcYSpJ8TNiA5bMTLKrQ3rNO/HM0hjF+TWmTC2Qge?=
 =?us-ascii?Q?WLnVRooaG4Re6QQE9OTkqXOdDB4FQPUZWZqnXU1fBEKQ2yxroig5jBaHkmSW?=
 =?us-ascii?Q?ObVhHBoAvy0mupZPIN1tZ4ox9Loeuhz8VPjRXZMaKo5YO3djrAcXlGPOqf1Z?=
 =?us-ascii?Q?2eI6yvF3ndoaQYY7A3hggL1dHBCPxnhGVH/Y7vaVBX8f33Obl5XQ1anLYuiA?=
 =?us-ascii?Q?VOtkjw1JY1uGrFgvbgyCkAAU87fPmDh+q55WkMfeLHsMvofVzbqr6ojUuk07?=
 =?us-ascii?Q?bAdN273dXgGFD/KMX3ImBvVCaIUdhJQtqdBsN8r0ylLC6p0gezpoSaF4HKs3?=
 =?us-ascii?Q?Im8L9Y7wU+gqvMMk7kI+lzroU8oAssNQ2xXFcC8KRXvy/K8+VGI16PLmF8Ax?=
 =?us-ascii?Q?ydFtMqtw9kjIFJ8zfym4cdlLFBIjxkOuW+9lH+eH+F0MfAQEH0gbZhvsl9+l?=
 =?us-ascii?Q?pSXNPKHtEtRIvv8lLj685Esg5M99ZLeG2OeA+OE14TsZqMT3uo+XqzDjSgzY?=
 =?us-ascii?Q?yhiBtLTbiJK/MF8DGhTQgOzCSvNsO0u2fLxXJd3qnfNZXb8wojRUmK8xQRB+?=
 =?us-ascii?Q?7hjDFuKz4pyzuqdIh3jfKR/1v7xeX8fFmMK/xTHP9DqjXWUZNnBJcdzc129W?=
 =?us-ascii?Q?/2YKURiecFUB28zju6tjZxQFw9KIzMcx6xon+wZ1mhKsfvmkXMJoawNN6Obu?=
 =?us-ascii?Q?6PYGGh9cLpDMZtFZlLOask+Pstug78I2TWyvDDpgndMgp3Y5Kyj5ZUVQcGh1?=
 =?us-ascii?Q?QmT2K3hyO5kLJ8zO7AG30t79gdx7ZSw3VUZA4AALQrXUYxHTug6JOATfc1ea?=
 =?us-ascii?Q?afzNpUjXVsZsomYg4sAyKYUsUXxY+u54FLdzaE4W0iXoH2QSozes09uiADD5?=
 =?us-ascii?Q?7oaBxJwWP6qDdM8VeJvCtG8XHHZgraWENflupyQ5cDN8sYuP2n3FcscrXuQ3?=
 =?us-ascii?Q?ysU/qxtNdF9qkacJ/nTAVzZONTyjYIoUhmKjTtMQAnm/cazGwqQHCC/ddQ6V?=
 =?us-ascii?Q?Vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d915d2b3-a30f-4631-1bef-08ddb7dd75ba
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 13:53:14.9280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m4NSEQ1TO1Tvan7O96+aUNmzMe2CTRA/ofBCADEB33/DpspE/Z7hutoa2ygRwEbUyIMqkh7/5Y+RIUf7jCI2Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4938
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:at_kernel/cpu.c:#lockdep_assert_cpus_held" on:

commit: 2ac9a5ef530ad9042abc1a8871e2a5997a236286 ("cpu: Protect against concurrent isolated cpuset change")
https://git.kernel.org/cgit/linux/kernel/git/frederic/linux-dynticks.git kthread/core

in testcase: rcutorture
version: 
with following parameters:

	runtime: 300s
	test: cpuhotplug
	torture_type: srcu



config: x86_64-randconfig-073-20250627
compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+-------------------------------------------------------------------+------------+------------+
|                                                                   | 2a52c2f8f5 | 2ac9a5ef53 |
+-------------------------------------------------------------------+------------+------------+
| boot_successes                                                    | 12         | 0          |
| boot_failures                                                     | 0          | 12         |
| WARNING:at_kernel/cpu.c:#lockdep_assert_cpus_held                 | 0          | 12         |
| RIP:lockdep_assert_cpus_held                                      | 0          | 12         |
| WARNING:suspicious_RCU_usage                                      | 0          | 12         |
| kernel/rcu/tree_plugin.h:#Unsafe_read_of_RCU_NOCB_offloaded_state | 0          | 12         |
| calltrace:__irq_exit_rcu                                          | 0          | 10         |
| calltrace:update_defense_level                                    | 0          | 1          |
| calltrace:srcu_invoke_callbacks                                   | 0          | 1          |
+-------------------------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202506301054.731c76b6-lkp@intel.com


[  124.151082][   T94] ------------[ cut here ]------------
[ 124.152095][ T94] WARNING: CPU: 0 PID: 94 at kernel/cpu.c:527 lockdep_assert_cpus_held (kernel/cpu.c:527) 
[  124.153603][   T94] Modules linked in: rcutorture torture input_leds led_class serio_raw evdev ppdev fuse ip_tables autofs4 stm_p_basic
[  124.155786][   T94] CPU: 0 UID: 0 PID: 94 Comm: kworker/0:2 Not tainted 6.16.0-rc2-00004-g2ac9a5ef530a #1 PREEMPT(voluntary)
[  124.157650][   T94] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[  124.159437][   T94] Workqueue: events work_for_cpu_fn
[ 124.160270][ T94] RIP: 0010:lockdep_assert_cpus_held (kernel/cpu.c:527) 
[ 124.161272][ T94] Code: 85 c0 75 10 5d 31 c0 31 d2 31 c9 31 f6 31 ff c3 cc cc cc cc be ff ff ff ff 48 c7 c7 e0 c4 f2 84 e8 60 be f5 02 85 c0 75 db 90 <0f> 0b 90 5d 31 c0 31 d2 31 c9 31 f6 31 ff c3 cc cc cc cc 48 c7 c7
All code
========
   0:	85 c0                	test   %eax,%eax
   2:	75 10                	jne    0x14
   4:	5d                   	pop    %rbp
   5:	31 c0                	xor    %eax,%eax
   7:	31 d2                	xor    %edx,%edx
   9:	31 c9                	xor    %ecx,%ecx
   b:	31 f6                	xor    %esi,%esi
   d:	31 ff                	xor    %edi,%edi
   f:	c3                   	ret
  10:	cc                   	int3
  11:	cc                   	int3
  12:	cc                   	int3
  13:	cc                   	int3
  14:	be ff ff ff ff       	mov    $0xffffffff,%esi
  19:	48 c7 c7 e0 c4 f2 84 	mov    $0xffffffff84f2c4e0,%rdi
  20:	e8 60 be f5 02       	call   0x2f5be85
  25:	85 c0                	test   %eax,%eax
  27:	75 db                	jne    0x4
  29:	90                   	nop
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	90                   	nop
  2d:	5d                   	pop    %rbp
  2e:	31 c0                	xor    %eax,%eax
  30:	31 d2                	xor    %edx,%edx
  32:	31 c9                	xor    %ecx,%ecx
  34:	31 f6                	xor    %esi,%esi
  36:	31 ff                	xor    %edi,%edi
  38:	c3                   	ret
  39:	cc                   	int3
  3a:	cc                   	int3
  3b:	cc                   	int3
  3c:	cc                   	int3
  3d:	48                   	rex.W
  3e:	c7                   	.byte 0xc7
  3f:	c7                   	.byte 0xc7

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	90                   	nop
   3:	5d                   	pop    %rbp
   4:	31 c0                	xor    %eax,%eax
   6:	31 d2                	xor    %edx,%edx
   8:	31 c9                	xor    %ecx,%ecx
   a:	31 f6                	xor    %esi,%esi
   c:	31 ff                	xor    %edi,%edi
   e:	c3                   	ret
   f:	cc                   	int3
  10:	cc                   	int3
  11:	cc                   	int3
  12:	cc                   	int3
  13:	48                   	rex.W
  14:	c7                   	.byte 0xc7
  15:	c7                   	.byte 0xc7
[  124.163450][   T94] RSP: 0000:ffffc90001ed79a8 EFLAGS: 00210246
[  124.164062][   T94] RAX: 0000000000000000 RBX: 1ffff920003daf37 RCX: 0000000000000000
[  124.164866][   T94] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
[  124.165666][   T94] RBP: ffffc90001ed79a8 R08: 0000000000000000 R09: 0000000000000000
[  124.166552][   T94] R10: 0000000000000000 R11: 0000000000000000 R12: ffffc90001ed7a38
[  124.167379][   T94] R13: ffffffff81458c40 R14: 0000000000000000 R15: ffffffff844673b0
[  124.168174][   T94] FS:  0000000000000000(0000) GS:ffff8884289ea000(0000) knlGS:0000000000000000
[  124.169115][   T94] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  124.169824][   T94] CR2: 00000000566f6484 CR3: 0000000157289000 CR4: 00000000000406b0
[  124.170687][   T94] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  124.171537][   T94] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[  124.172257][   T94] Call Trace:
[  124.172613][   T94]  <TASK>
[ 124.172920][ T94] stop_machine_cpuslocked (kernel/stop_machine.c:599) 
[ 124.173534][ T94] ? stop_machine_unpark (kernel/stop_machine.c:589) 
[ 124.174063][ T94] ? sched_clock_noinstr (arch/x86/kernel/tsc.c:272) 
[ 124.174645][ T94] ? __cpuhp_invoke_callback_range (kernel/cpu.c:1271) 
[ 124.175351][ T94] takedown_cpu (kernel/cpu.c:1314) 
[ 124.175836][ T94] ? _raw_spin_unlock_irq (arch/x86/include/asm/irqflags.h:42 arch/x86/include/asm/irqflags.h:119 include/linux/spinlock_api_smp.h:159 kernel/locking/spinlock.c:202) 
[ 124.176434][ T94] ? cpuhp_ap_report_dead (kernel/cpu.c:1298) 
[ 124.177008][ T94] ? trace_cpuhp_enter (include/trace/events/cpuhp.h:10 (discriminator 21)) 
[ 124.177609][ T94] cpuhp_invoke_callback (kernel/cpu.c:194 (discriminator 4)) 
[ 124.178161][ T94] ? bit_wait_timeout (kernel/sched/completion.c:110) 
[ 124.178728][ T94] ? cpuhp_ap_report_dead (kernel/cpu.c:1298) 
[ 124.179259][ T94] __cpuhp_invoke_callback_range (kernel/cpu.c:967) 
[ 124.179913][ T94] ? cpuhp_invoke_callback (kernel/cpu.c:960) 
[ 124.180527][ T94] _cpu_down_locked (kernel/cpu.c:1385 kernel/cpu.c:1443) 
[ 124.181058][ T94] ? lock_acquire (kernel/locking/lockdep.c:473 kernel/locking/lockdep.c:5873) 
[ 124.181602][ T94] __cpu_down_locked_work (kernel/cpu.c:1466) 
[ 124.182157][ T94] ? cpuhp_kick_ap_work (kernel/cpu.c:1462) 
[ 124.182728][ T94] work_for_cpu_fn (kernel/workqueue.c:6746) 
[ 124.183231][ T94] process_one_work (kernel/workqueue.c:3238) 
[ 124.183781][ T94] ? show_cpu_pools_hogs (kernel/workqueue.c:3140) 
[ 124.184334][ T94] ? assign_work (kernel/workqueue.c:1200) 
[ 124.184823][ T94] worker_thread (kernel/workqueue.c:3315 kernel/workqueue.c:3402) 
[ 124.185350][ T94] ? trace_irq_enable (include/trace/events/preemptirq.h:40 (discriminator 21)) 
[ 124.185879][ T94] ? rescuer_thread (kernel/workqueue.c:3348) 
[ 124.186416][ T94] kthread (kernel/kthread.c:464) 
[ 124.186855][ T94] ? kthread_affine_node (kernel/kthread.c:413) 
[ 124.187503][ T94] ret_from_fork (arch/x86/kernel/process.c:148) 
[ 124.187980][ T94] ? kthread_affine_node (kernel/kthread.c:413) 
[ 124.188575][ T94] ret_from_fork_asm (arch/x86/entry/entry_64.S:258) 
[  124.189109][   T94]  </TASK>
[  124.189470][   T94] irq event stamp: 347973
[ 124.189928][ T94] hardirqs last enabled at (347981): __up_console_sem (arch/x86/include/asm/irqflags.h:26 (discriminator 1) arch/x86/include/asm/irqflags.h:109 (discriminator 1) arch/x86/include/asm/irqflags.h:151 (discriminator 1) kernel/printk/printk.c:344 (discriminator 1)) 
[ 124.190949][ T94] hardirqs last disabled at (347990): __up_console_sem (kernel/printk/printk.c:342 (discriminator 1)) 
[ 124.191818][ T94] softirqs last enabled at (347934): handle_softirqs (arch/x86/include/asm/preempt.h:27 kernel/softirq.c:426 kernel/softirq.c:607) 
[ 124.192520][ T94] softirqs last disabled at (347915): __irq_exit_rcu (kernel/softirq.c:614 kernel/softirq.c:453 kernel/softirq.c:680) 
[  124.193169][   T94] ---[ end trace 0000000000000000 ]---
[  124.224990][   T22] numa_remove_cpu cpu 1 node 0: mask now 0
[  124.228350][   T94] smpboot: CPU 1 is now offline
[  124.228727][   T94]
[  124.228877][   T94] =============================


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250630/202506301054.731c76b6-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

