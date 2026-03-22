Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD00A346A1D
	for <oe-lkp@lists.linux.dev>; Sun, 22 Mar 2026 13:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774186777; cv=fail; b=qtuHgj9cfMmztshOgzAmc6Ri0zAuiFK4Gn78x9y7CE0y6qR1nsT267zZcmMaVGK4P2c7MutVnZy3mb21E0S51xUMt5aECw8pCY17xF7f0XGM/8up56oxG3n+WjP3gGujYSiHiMtgweEIiM0wXnBkc77Wy5gZ7TwZMGm8gDPUJEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774186777; c=relaxed/simple;
	bh=ScLniCFvJEpXDKyAcsMcd4/9atrdrXOPU+XfAOVSm0k=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=U/6RFepTYwkCsNu3h2gavN9x/1mxi91mUUqNqQxy4BdX8Z6uUo+EyJUGn/V+HRzjYEvsei/ZS6VxRHM1KEPM3RE+ZpTW4on8tkx7qVld/8CDwKdMUfvYIsmb+xaLHbzMaVNty5HLVIlrZmlcZOJsQoz7Jxk9euI+zvBgcMIRxiE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IxxwijyE; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IxxwijyE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774186776; x=1805722776;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ScLniCFvJEpXDKyAcsMcd4/9atrdrXOPU+XfAOVSm0k=;
  b=IxxwijyEA6PUhhS2sMxMBJy5WoQ90X1vdttuvVN1/5VY4Gy9z9t7tByk
   USTeETMlMxOlaHwLfVNrURmESVck5WXcZ1Fl6qEluXz+uWqtM1cZ0w8CR
   zoeOUxPvbqSHVAX4N4IC6TfZj1ZxVdCIlcTIf+y1+bpl794/xrBETZIN+
   WZ7SKzkYIByyhkE/9y48+RVht0zg6AGMZjplpaLjXDcvGho9aQkGSWhF0
   cUR+Mcr+ZPU6OXxkCGcuFhP5uGohmHvURx9A5FTAxwy1D2/W1cuKZdygH
   3OnIhban3848I4mF0ZA7pbQPe26c/ULGnZeEibxUtqyNe1usgjWpYispO
   A==;
X-CSE-ConnectionGUID: J22nRCfHQPeRw3c0MqdeXA==
X-CSE-MsgGUID: ZKjxT1u4S/GxDoAt8TBN7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="74917830"
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="74917830"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 06:39:36 -0700
X-CSE-ConnectionGUID: 6fngSagwQQiSC9cq5u/43A==
X-CSE-MsgGUID: Fwc3HFQ6R4eOEP5BipeR/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="222982920"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 06:39:36 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 22 Mar 2026 06:39:34 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 22 Mar 2026 06:39:34 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.25) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 22 Mar 2026 06:39:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YUys2wFfVjHr+z6LtqPdJNqOxfhw/QbatV592ZSeDWILlDtzSH/QYc/q9Tn1eCaCEoFQ/SWZSzBWGQAYC/lYZ/a+MLeE91uOQ4TVSKX4IcVFecPfu8NKDrRgnyJo7QgG0cTtj1A26LRRXrhqyhn6oMpYlvjD/mPW+xBS4oFZ9gHYM2vgtswzkaoCtzDqBKlIqr+vnnFZ4o0XGi6epnvnYs5cGPOBJT4KzwtcEAlSRTShKAe8U8HWyOUd6w/G7zh7/QqXNcEq9kWS/VASMSFnuqmRqgNgMwFCBTXqr/CV4YKCBbNRQ1Slga9sEFEcCSa5aW5wJ7xU8xikSmnW+BkqrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ib1wKaFJ/MEXB78vwV60Di15ZDafeEmAr9GECvnufsU=;
 b=lKMaXgrSxmpwQtP9UcAgLioI5x4S/SElDWhm2kQRtAy+J1t9f3e6ZQe6w/bE9cMXiA5xXgeWjtY+g0yv3Dz0MwJnOytf9NgxvFLjlW8El5dpMce8J3MJyndUzhAyia4Ssu/+fiA6ad80XePgbXk2cDxFVV/8RaR4QM7PnsIGoPl/Qo7gbkgJDETqUGSfuNgJdzs/Dmdr9LCecFHdiUBMVe4OSpHHiakkM0aeBcWATjoBgM2uaqIKwfS23F6Hy38C2bd+mtGx8eG/XqB+jeL+tcVlW3Noa2htGtjrHIyImsWYWk4kGKZNyLusE8qibEsAV8G7vPbxdAgsEb6c+VxxAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by DM6PR11MB4674.namprd11.prod.outlook.com (2603:10b6:5:2a0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Sun, 22 Mar
 2026 13:39:32 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::106e:78dd:4c96:d707%3]) with mapi id 15.20.9745.012; Sun, 22 Mar 2026
 13:39:31 +0000
Date: Sun, 22 Mar 2026 21:39:23 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Joel Fernandes <joel@joelfernandes.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [jfern:rcu/dev] [rcu]  02bf38db37: kernel_BUG_at_kernel/irq_work.c
Message-ID: <202603222159.5c488888-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: KU2P306CA0041.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:3c::13) To PH0PR11MB5832.namprd11.prod.outlook.com
 (2603:10b6:510:141::7)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5832:EE_|DM6PR11MB4674:EE_
X-MS-Office365-Filtering-Correlation-Id: 02c16783-536c-4c17-4ca6-08de88187293
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: syKdg2XUrGKGiJ0fHJi5fQziQyVv8QByFf9Z3Gye/tbMZBjo/jRA/+1DH6e7N376VjIqLsSZoV4SsvG1PmJ2A+P/Q5luweZ/SC+ANgZDCJwGB8nI76PmGdZW5oVWee5LKIFypttOErrLTMpM00vPo47e24vOIMZWX1DnBsRVoqA5fB4K/bAbZH8owC0YF/Iva8Ph6AQwTjAzya825TyzyobkV3DetyczDTKy3LFRWXfK9OH390CD6dVj5VCzRrijuZZLNx9cwmHNcCXin1DSkmgyQ4d9HvlDbhacHXRjUmfCz1H4v3r8/ajJDhFk0KnlKQxScI3dTN9xiOomf5MtqsOXqNFwNpjqCy1JefIRzsmYurt8XJpnYZnAi6R9momestHjkjEjDWkVW3AZ+OY9ioc1IfphNxQVoJbsSYFLX5YXJdV7PW0206mnpqJL05ahH7M/OpFubtKiD5dgeXlkBOCHbjZFZa7SQOVunewOcXLLA6/7zjqphyTFowrufjdRYRXov1LwHYul/G20J9taV/rtr8J86QCbNnXo9ltZ68R2mjFnVNCAvxbUAV3RoHAFFvLR/NX1jJRCkuQQYO7kew5E7NS8OTw04VeI0xw3RWZB9uVna5UOCkKI2mPyLLqIMk00zhdMecaxIHG+h3WRscGrDjgbWDSHL4Qc5IAU8UieAgwekBENNCClUtJuEIUu
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9fsQhaOKpf53vF9PwV+ggoz0mlVUQYsUQrsOmKuMMsaAD0/bZBdcYNe4o1gI?=
 =?us-ascii?Q?lWNKoDlmlcm0/iVb58qKb7ADFIpIguBrD08x5z0m4ATPMYnw6qzPRjTOfwj9?=
 =?us-ascii?Q?mpngF4WdyTaG9sOLaururovNqZv1wKwhtH3hL2ahqksNl6ywGAelOUEbDrOh?=
 =?us-ascii?Q?9gqlw8ZvDf7OZjkc37S7iCVPe73NKT+8zBuwlMxlmhYwvuIFkpclJnBEXYcl?=
 =?us-ascii?Q?R93Sjq7iiefslbbk9k/Kr06Wo6ikNwE2PQI7HRdZvqfrdTIIPirLht7O5ZXF?=
 =?us-ascii?Q?HEkyNuDkCtgMQZbJ1koj3df3+k3sOX1cwY2kf+A7V7BZ6lhvpQBdRQsscJJk?=
 =?us-ascii?Q?MaMJGTVqWPkuQPUHaFuFyHAADBe4ROgA0JQ+NUmBGOMW/85xoptAzfJHWpTx?=
 =?us-ascii?Q?b4pp8tiuDNjJ+ttth8bfSArPgceWjJHNAhdEK7pNqeuuwGtFt8U7XLXlzcFC?=
 =?us-ascii?Q?fJBp21d8p68Nqj9XUzFZFmJyyLuHD1z9X4tLgxi5+hK1jNsCD9oNHDTXTZ93?=
 =?us-ascii?Q?thx+GmOnPu7k6Mam6gi1w890M2B0BuK9TcjylB3M82mFJCZw5VgEWMU19hzp?=
 =?us-ascii?Q?4HmZS2dUxUM0iA5D/0WI6fZC2YAk6EczeKnS60hRfRNbw574j0bAw6XiNSdr?=
 =?us-ascii?Q?tuIvLXWELvu8BRCjNRCtYzvKxoDr8uGsjYkamggJlfOGcHYswhjxPjQBHdFF?=
 =?us-ascii?Q?B54phpXrXGzhIEDpnMYxXXH8QE64ElIV+WGdU7qh/Q/9rMZF7eUphrAfnBm0?=
 =?us-ascii?Q?B+6ArEWIELUDxjIwozvPo8kblByOUIhqCU01FPl29MMLm5OX6n0AyhATd0QM?=
 =?us-ascii?Q?CWT9Z3NhlckRpJSaf0M2ofiOSOJdzQpHlibxLe8mM+M984KdlIq4WAtcsA4P?=
 =?us-ascii?Q?YYNeenWE659Tg2sXBSRCxmujnNdLHICTUuRzWMSjqkAUGqG8B9Xui4J0liYb?=
 =?us-ascii?Q?xGNGz7h6DDTeixHocHctvxT6MR5G7L7NcVXFedEAC8O129Xio78Xfk9RyoNs?=
 =?us-ascii?Q?FWIWFe7ttq+CXZG1zZkCM7lRvPOxZ8O/vBtgYvHt4CTy4La0PQGxzNo5dk89?=
 =?us-ascii?Q?DpNv29mF4ars5pU6MvWYIejzPnWLL8AwPsYTcV4g8iYMHTsTq8uTW7TUwRHp?=
 =?us-ascii?Q?7W306jLUoCTks1sPAHcncTxsTARzCLEOJ1Z+wlsYR4om/+Jyyfw4kpnuMUoy?=
 =?us-ascii?Q?5ADoGVMkysfrsBTya9Ty8vOyMlConWvJCNUEB6Cfq0K2PBOLEk4FyZLSzP0n?=
 =?us-ascii?Q?QFaGZCQtayzPZreIsjnRxTWhCyZacuLeLav1GRr8zAbAQkhWT3+7v0Vf1jnU?=
 =?us-ascii?Q?eLG1/aBM4SaxsLfcBMBifBRjbxrifPWuTadpDl/ZUsRXI+CxiF/pDA0CAJcT?=
 =?us-ascii?Q?wIjTBvrq+beRs6sdTUiMpQDKGZ6HIZ3JGC/EbEsmse+x7CyJgiQEKkE6o1qy?=
 =?us-ascii?Q?NxnKcTFCPe57vOg+JDQa8VxuQk47Dco67bED8vhA5aa1pPc/20txV8N/BCgp?=
 =?us-ascii?Q?gTiGS9JMeoTWyPvRulGgAnXlkprs9ulZIbV1B0xVmuJpEbszIm7Zle4Bp92S?=
 =?us-ascii?Q?HpUkopvAUKOj3RfzeBaTho9w23IUgSCKDcXHmzcyCuTJWOczYftt/G1M+pWU?=
 =?us-ascii?Q?4XeDJMTvNG9qpxGjN9c4X/22H/zQ61YradVohbKvTQ+sYrJUpaYuTEiYk9Fe?=
 =?us-ascii?Q?XtirYDx9jXxP2aVnfansLNixAsYsTLuuL1P99TT6LjKwpaG+qFb7O8y9uJqE?=
 =?us-ascii?Q?ZxcR8yFSSw=3D=3D?=
X-Exchange-RoutingPolicyChecked: Wd46OrmL3irl233eaGQSNFePM2xB2x64lICDIcecQEUrwYfaRFagWOzQrDRFupL+9mqtAkpb63Ll5Qx0ezfnNJWwBFF61k0pViLRrGoXBaUHfFQsqDyJVGWO7UxQLzY/QduSXKqv5cFxsWgqNo1kpw+B8KD55etgwbMBzDEzSw+fN7ov1uv112causkvneFMI4r7oVJlSiSMbXltdOTAhlQTFjyGZjTlWEQT2FxVTUTlNREAM/daUl1TJs19St+ld8taZP6/dnJSCuVH0waGCObQM3nOWH+jdZCV13V60KBrmWh0b9v1eg6mH6h4TJqfyKVUO74M5qK+oxAokdlTNA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 02c16783-536c-4c17-4ca6-08de88187293
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2026 13:39:31.7491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8L+e+Phk0Df7D6qYX9kV4MBCR9qZ0EJKbjkup1IQpb5iXsVMT5Sj8hhgVt6mRxOIhgeZDb5MhQ7ks/HkmmH7KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4674
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "kernel_BUG_at_kernel/irq_work.c" on:

commit: 02bf38db37c44207e5fa4ee205148cea7588da7b ("rcu: Use an intermediate irq_work to start process_srcu()")
https://git.kernel.org/cgit/linux/kernel/git/jfern/linux.git rcu/dev

in testcase: boot

config: x86_64-rhel-9.4-rust
compiler: clang-20
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+--------------------------------------------------------+------------+------------+
|                                                        | 15d921a7bb | 02bf38db37 |
+--------------------------------------------------------+------------+------------+
| kernel_BUG_at_kernel/irq_work.c                        | 0          | 12         |
| Oops:invalid_opcode:#[##]SMP_PTI                       | 0          | 12         |
| RIP:irq_work_run                                       | 0          | 12         |
| RIP:_raw_spin_unlock_irqrestore                        | 0          | 12         |
| Kernel_panic-not_syncing:Fatal_exception_in_interrupt  | 0          | 12         |
+--------------------------------------------------------+------------+------------+

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202603222159.5c488888-lkp@intel.com



[  183.137027][    C0] ------------[ cut here ]------------
[  183.145289][    C0] kernel BUG at kernel/irq_work.c:245!
[  183.156864][    C0] Oops: invalid opcode: 0000 [#1] SMP PTI
[  183.165652][    C0] CPU: 0 UID: 0 PID: 12 Comm: kworker/u8:0 Not tainted 7.0.0-rc3-00020-g02bf38db37c4 #1 PREEMPT(lazy)
[  183.180127][    C0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[  183.216556][    C0] Workqueue: events_unbound fsnotify_mark_destroy_workfn
[  183.227738][    C0] RIP: 0010:irq_work_run (kernel/irq_work.c:245)
[  183.236511][    C0] Code: 00 41 83 e7 fc 89 e8 f0 44 0f b1 7b 08 48 f7 05 66 8d fc 01 00 02 00 00 75 bc 48 83 c3 18 48 89 df e8 f0 eb e2 ff eb ae 0f 0b <0f> 0b 66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 66 66 66 66 66
All code
========
   0:	00 41 83             	add    %al,-0x7d(%rcx)
   3:	e7 fc                	out    %eax,$0xfc
   5:	89 e8                	mov    %ebp,%eax
   7:	f0 44 0f b1 7b 08    	lock cmpxchg %r15d,0x8(%rbx)
   d:	48 f7 05 66 8d fc 01 	testq  $0x200,0x1fc8d66(%rip)        # 0x1fc8d7e
  14:	00 02 00 00 
  18:	75 bc                	jne    0xffffffffffffffd6
  1a:	48 83 c3 18          	add    $0x18,%rbx
  1e:	48 89 df             	mov    %rbx,%rdi
  21:	e8 f0 eb e2 ff       	call   0xffffffffffe2ec16
  26:	eb ae                	jmp    0xffffffffffffffd6
  28:	0f 0b                	ud2
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  33:	0f 1f 84 00 00 00 00 
  3a:	00 
  3b:	66                   	data16
  3c:	66                   	data16
  3d:	66                   	data16
  3e:	66                   	data16
  3f:	66                   	data16

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
   9:	0f 1f 84 00 00 00 00 
  10:	00 
  11:	66                   	data16
  12:	66                   	data16
  13:	66                   	data16
  14:	66                   	data16
  15:	66                   	data16
[  183.274716][    C0] RSP: 0018:ffffd18940003fc0 EFLAGS: 00010206
[  183.296753][    C0] RAX: ffff8b330fb34000 RBX: 0000000000000000 RCX: 0000000000000246
[  183.314903][    C0] RDX: ffff8b2b803d0080 RSI: 0000000000000006 RDI: ffff8b2b803d0000
[  183.337107][    C0] RBP: 0000000000000022 R08: ffff8b2b803d0080 R09: ffff8b2b803d6480
[  183.353704][    C0] R10: ffff8b2b803d6480 R11: 0000000000000000 R12: 0000000000000000
[  183.371072][    C0] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000020
[  183.392885][    C0] FS:  0000000000000000(0000) GS:ffff8b330fb34000(0000) knlGS:0000000000000000
[  183.414110][    C0] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  183.423974][    C0] CR2: 00007f97ec300720 CR3: 0000000100b2e000 CR4: 00000000000006f0
[  183.438156][    C0] Call Trace:
[  183.442923][    C0]  <IRQ>
[  183.447191][    C0]  __sysvec_irq_work (arch/x86/include/asm/jump_label.h:37 arch/x86/include/asm/trace/irq_vectors.h:63 arch/x86/kernel/irq_work.c:23)
[  183.453059][    C0]  sysvec_irq_work (arch/x86/kernel/irq_work.c:17)
[  183.458722][    C0]  </IRQ>
[  183.462805][    C0]  <TASK>
[  183.466765][    C0]  asm_sysvec_irq_work (arch/x86/include/asm/idtentry.h:733)
[  183.472657][    C0] RIP: 0010:_raw_spin_unlock_irqrestore (include/linux/spinlock_api_smp.h:179)
[  183.488894][    C0] Code: 00 00 00 66 66 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 c6 07 00 0f 1f 00 f7 c6 00 02 00 00 74 01 fb 65 ff 0d d5 4f a9 01 <74> 06 e9 3e 1e 00 00 cc e8 78 6a fd fe c3 cc cc cc cc cc 66 66 66
All code
========
   0:	00 00                	add    %al,(%rax)
   2:	00 66 66             	add    %ah,0x66(%rsi)
   5:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   c:	00 00 00 
   f:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  14:	c6 07 00             	movb   $0x0,(%rdi)
  17:	0f 1f 00             	nopl   (%rax)
  1a:	f7 c6 00 02 00 00    	test   $0x200,%esi
  20:	74 01                	je     0x23
  22:	fb                   	sti
  23:	65 ff 0d d5 4f a9 01 	decl   %gs:0x1a94fd5(%rip)        # 0x1a94fff
  2a:*	74 06                	je     0x32		<-- trapping instruction
  2c:	e9 3e 1e 00 00       	jmp    0x1e6f
  31:	cc                   	int3
  32:	e8 78 6a fd fe       	call   0xfffffffffefd6aaf
  37:	c3                   	ret
  38:	cc                   	int3
  39:	cc                   	int3
  3a:	cc                   	int3
  3b:	cc                   	int3
  3c:	cc                   	int3
  3d:	66                   	data16
  3e:	66                   	data16
  3f:	66                   	data16

Code starting with the faulting instruction
===========================================
   0:	74 06                	je     0x8
   2:	e9 3e 1e 00 00       	jmp    0x1e45
   7:	cc                   	int3
   8:	e8 78 6a fd fe       	call   0xfffffffffefd6a85
   d:	c3                   	ret
   e:	cc                   	int3
   f:	cc                   	int3
  10:	cc                   	int3
  11:	cc                   	int3
  12:	cc                   	int3
  13:	66                   	data16
  14:	66                   	data16
  15:	66                   	data16
[  183.527720][    C0] RSP: 0018:ffffd1894006bd38 EFLAGS: 00000286
[  183.535070][    C0] RAX: 0000000000000001 RBX: ffffffff90315060 RCX: 000000000000083f
[  183.545762][    C0] RDX: 0000000000000000 RSI: 0000000000000286 RDI: ffff8b2b80ac6e50
[  183.556083][    C0] RBP: fffffffffffffe74 R08: ffffffff900f6a30 R09: 000000361b440d54
[  183.566699][    C0] R10: 755f73746e657665 R11: ffffffff8d6a6280 R12: 0000000000000286
[  183.577073][    C0] R13: ffffffff8f756001 R14: ffff8b2b80ac6e00 R15: fffffffffffffffc
[  183.601898][    C0]  ? kvm_restore_sched_clock_state (arch/x86/include/asm/preempt.h:80 arch/x86/kernel/kvmclock.c:79 arch/x86/kernel/kvmclock.c:87)
[  183.615642][    C0]  srcu_gp_start_if_needed (include/linux/srcutree.h:247)
[  183.658989][    C0]  __synchronize_srcu (kernel/rcu/srcutree.c:1493)
[  183.665869][    C0]  ? rcu_test_sync_prims (kernel/rcu/update.c:403)
[  183.672861][    C0]  fsnotify_mark_destroy_workfn (fs/notify/mark.c:1108)
[  183.688708][    C0]  process_scheduled_works (kernel/workqueue.c:3280)
[  183.701765][    C0]  worker_thread (include/linux/list.h:381 kernel/workqueue.c:949 kernel/workqueue.c:3440)
[  183.712073][    C0]  ? pr_cont_work (kernel/workqueue.c:3385)
[  183.723037][    C0]  kthread (kernel/kthread.c:438)
[  183.731491][    C0]  ? kthread_blkcg (kernel/kthread.c:381)
[  183.741270][    C0]  ret_from_fork (arch/x86/kernel/process.c:164)
[  183.752674][    C0]  ? kthread_blkcg (kernel/kthread.c:381)
[  183.763600][    C0]  ret_from_fork_asm (arch/x86/entry/entry_64.S:255)
[  183.774808][    C0]  </TASK>
[  183.785962][    C0] Modules linked in:
[  183.798169][    C0] ---[ end trace 0000000000000000 ]---
[  183.808284][    C0] RIP: 0010:irq_work_run (kernel/irq_work.c:245)
[  183.819822][    C0] Code: 00 41 83 e7 fc 89 e8 f0 44 0f b1 7b 08 48 f7 05 66 8d fc 01 00 02 00 00 75 bc 48 83 c3 18 48 89 df e8 f0 eb e2 ff eb ae 0f 0b <0f> 0b 66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 66 66 66 66 66
All code
========
   0:	00 41 83             	add    %al,-0x7d(%rcx)
   3:	e7 fc                	out    %eax,$0xfc
   5:	89 e8                	mov    %ebp,%eax
   7:	f0 44 0f b1 7b 08    	lock cmpxchg %r15d,0x8(%rbx)
   d:	48 f7 05 66 8d fc 01 	testq  $0x200,0x1fc8d66(%rip)        # 0x1fc8d7e
  14:	00 02 00 00 
  18:	75 bc                	jne    0xffffffffffffffd6
  1a:	48 83 c3 18          	add    $0x18,%rbx
  1e:	48 89 df             	mov    %rbx,%rdi
  21:	e8 f0 eb e2 ff       	call   0xffffffffffe2ec16
  26:	eb ae                	jmp    0xffffffffffffffd6
  28:	0f 0b                	ud2
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  33:	0f 1f 84 00 00 00 00 
  3a:	00 
  3b:	66                   	data16
  3c:	66                   	data16
  3d:	66                   	data16
  3e:	66                   	data16
  3f:	66                   	data16

Code starting with the faulting instruction


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260322/202603222159.5c488888-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

