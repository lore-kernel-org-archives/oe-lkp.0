Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34B21D86E1
	for <oe-lkp@lists.linux.dev>; Mon,  7 Oct 2024 14:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728311328; cv=fail; b=Xm+nedvAdMjx9AGoTgBQki3j6DchjF/W8eQKv5z76k1AB+VD2RH2yKePcDrXZtpyJQ+7pzx33jlbwm3G3zq+xT3l55SqLsq9tWQo4dBoKKy8riBcdDrqb1iiHbf/LwK1Wi1KlFlxhW75tzVCZo4vh6S1RAnXfjl0uErZKVMe29s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728311328; c=relaxed/simple;
	bh=w1v3vW1fzvxhbcZtXwABU/lzuZsq1H+mUi9SSmwAbY0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=TypfjtuFKv7klpWAQkFk7MB3yC7yOaSVlff2WSYfmNfdnm85Edd0Ir+zCdrNI6Se5afZud0sRvLpyehwJ8esXx6YtnXYXa2q5UUqo8inKh/BtXx4xnKAjzaetQNkHhiseVUxiFjjdZnUeXDFeHsRuJC46cuCDW/bC5hRdG/kVeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IxktZmaP; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IxktZmaP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728311327; x=1759847327;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w1v3vW1fzvxhbcZtXwABU/lzuZsq1H+mUi9SSmwAbY0=;
  b=IxktZmaPOiecKMHDPeFDwtCB65VcSkhzbN9G/76l/PkTR88IKHmo6xdW
   s8/uEj4ZWZNg/09JSP5GahDJ2g/VxaOPQ0rvcBWtkFH3YYVb/w/ZVq9NJ
   e2P8Du9fa8FshsLtT6zB0tCSSaEUDCKX42nAX7gR+KMxiow6fKnPQKjsF
   2PAPwsIFt4sD1M+t7G/MEpSYAfPe2s/GC+nRjeTXITAozSlZnV60JAwQ0
   ziEwuAp/uNvMrvsfAuABOoHElmJbxFleEgSmUEzhiQTpU+zzXNNznWh10
   hB38/nIAVJRt5Vkms3nHSyyCuYIrxPQsQwtGDgVJhT2tiEEa3Q45r24Ne
   w==;
X-CSE-ConnectionGUID: D/PrEdnJQu6wVIqzW1pK/w==
X-CSE-MsgGUID: eqx1vMQoTASx9XPRr2HBsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="38067230"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="38067230"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 07:28:45 -0700
X-CSE-ConnectionGUID: IpNnx/sYTPub6hYFrZB4Hw==
X-CSE-MsgGUID: Y0ES52m7RNi+y3+z5Z38VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="76323303"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Oct 2024 07:28:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 07:28:44 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 7 Oct 2024 07:28:44 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 7 Oct 2024 07:28:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pfFBtwADiJGoZ40y1rrMhny3+/Kfi2Pfvk+42UKYjMfN40UsIcFmTNsgJAxmpkosS9FN7BPOcnWbg6rP9MkSnfitLSjdMxxV3vMSaw9kqJIcfx7iNLuu7PUOuCrqOIxVyBv0KobygBQXEt/TEjYxzONX2n/qCC82+nr0vbhdtnwO/1pgeB4cwqZiRzXqF2NKwuoPr94rWdtsJilab/v6vziCoe7JWszMqwyDK7KDXBUSHsQVd/UkWAUC2kzEoh864UIGIYzIKmlGGPoO9AEJXpGrkBrp+cIx9pMPcuH4diSuQPAn+2pViSFQC2ND9FOO3c9DDRpVF1Uuhj4GsDVlUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQG5xtrKztbMZh4XqFvxJ0RIqtVuUtvJV1TKDZtT0Nc=;
 b=L7f1mQ0qNLKInSLi+OwMK62tEbk5cNX3MqLUgPAJgLQHsp3kRixMWo7Kb0qo33wU/5/DrIe0JzgKpIb4ptJhqNu43bKxtiZdDUG3GvDinvZl//iXYB51GjIQ0Ty37Z+99/aJdodYZY+7/BhyrQ91zyjjPNqC5tbpnogTBxkszt21Eoc2GgHEpc8wTAYfWt7bgPsfslQ7WEMkwdE1xal2e+H/XkOq/xPHKkpY/7BYi316X2itxBKn91QjPH1Or5B5tO6zypZSySRwSAqWmbGZz5tSBD+QCqakp5V4emON0Kqcc88ILzp94Qhoc+fkoWPugW3zTd0hsFaL/2zygRJR8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SA2PR11MB5162.namprd11.prod.outlook.com (2603:10b6:806:114::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Mon, 7 Oct
 2024 14:28:41 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8026.020; Mon, 7 Oct 2024
 14:28:41 +0000
Date: Mon, 7 Oct 2024 22:28:34 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Frederic Weisbecker <fweisbec@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [frederic-dynticks:myrcu/dev] [rcu]  bfd165c0d2:
 WARNING:suspicious_RCU_usage
Message-ID: <202410072209.d93db215-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TYCP301CA0038.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::13) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SA2PR11MB5162:EE_
X-MS-Office365-Filtering-Correlation-Id: 30ffbb71-b400-457a-a381-08dce6dc573e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XCr8MwkLT2Zy13ZRABxXHcAaadynuzABBZURoXZcm9SI/vIFX2plWNieuPj8?=
 =?us-ascii?Q?2c2zBhnuVDvOH1VFiVZCCLCsTux61btHFHG78F1ToLffWdObrwuBLeEYSXdD?=
 =?us-ascii?Q?mopLCVM73T/KA+gpp9xl2K0B1RFXUFgLxXKnRd8683zsx3Ba8tFO06lrFjpq?=
 =?us-ascii?Q?+P/FFGj2P+BSCHN9sQsAzArqzbGzIhtxuut6D+CZUfTuwGFrxGOo9XWv4rmm?=
 =?us-ascii?Q?howF4HEd+G5zKu7K9ePzkmBQYXgOCjuca4qXdvlYWTHBCcPQWwBDccsGn8Zl?=
 =?us-ascii?Q?m7RTKappMADIJWV9X4d3x/VwmCgFDek6SQoT1aW9kQLIKA7pu8YvMXs388o1?=
 =?us-ascii?Q?OVCYobFmwdSistfXPTQW6b+A4jSgVLsJPXmEg133uOYzA146Eh4YW6fVsrfv?=
 =?us-ascii?Q?wmrTLdy3vVyBhR9C9e9fRCW4HoeNuwEDQJ79svVX8Y9taObolECVhDcaRtel?=
 =?us-ascii?Q?5eczz4J9HooywdKK7tek4FodBGm+WeIaqAUHNtdDcDiT10l7KUXKxi8TbeR9?=
 =?us-ascii?Q?lnLH/OnnfKlkglF1Ckycy9C5r6mcSyYM9HDlY7kSAJX+L+yNC5Fd6Zu+1ZGn?=
 =?us-ascii?Q?CJf9fiRvWFjnBplwRZ+TXXXarWp4poOeizSWwrtIyF1hBW7RLjB2yUvyzGC+?=
 =?us-ascii?Q?u506CNI3KKywTdgj98MuSZu897m2CIRw2Y2BxuBzfLtrfSRcvL5yEo1K1C2U?=
 =?us-ascii?Q?y7ADwZjZqs5z42OQl8JuwA8q7huhOS3K2o7ydTrpFed1aoBllbjy+Vs/k2nu?=
 =?us-ascii?Q?B9yOGItO1lPISzlmFeBU7BLT5+44e/dgOyy+/vJMzB7SuGRpymw14Za7DQi2?=
 =?us-ascii?Q?YIla8I+N4cdUCair3GMEbkSo3hDm/B0P/rEes4w262b/4vn9D/h85tnfT/Qk?=
 =?us-ascii?Q?J3FC3nEpFZdqGKXsYv3am0m5wHEdjsAxBX/fmomlSwElF0i1eYKSTaiwX1dt?=
 =?us-ascii?Q?do+5vZZDZWjbgC/IcMCQEsyDtUKu/Ferv1tdl00JuIi4YZQyOdIPRonhdKgn?=
 =?us-ascii?Q?pOE5kS/UE8JaUi2F7pOchS7mbX2dZMcvsUd+pPCDbGWm9/C2vRUL3PfFkVZw?=
 =?us-ascii?Q?0u/xP+lbk22fYbw5DZwxI/c7ZZKQ3cr/DGX9Y1nn6C4yCuyF0VNcKiLxzWoR?=
 =?us-ascii?Q?okYBsGIBVTtnBm0pR2zmBQ3s1osgQI0zbkRk13hOO1H1J2JeQZINAnsb7hc9?=
 =?us-ascii?Q?UKI68b8w10dvQgYiq7aO8Si+iaT/+qUjxAXKPEphtca9JUsemm1CVGnzeJ/6?=
 =?us-ascii?Q?IvZBZ6ZHcGOdkYpIwRa+g6p7EZtVzIIgT20G5DPM3k4eYIZfFp3wUR6GNF2J?=
 =?us-ascii?Q?OQc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h2iO67QopidhqOfoPl4KucQWn/5vFJGUbB/hkISrrm4XbjsopocpXjgLq5wR?=
 =?us-ascii?Q?eD0+CrFbKBw5YJDIjKjWbcZYsdnDNtBmfo//zXQ7xnDKJVcBzhKHlKJmCh3D?=
 =?us-ascii?Q?xOB3hnkyh3rNj/nBia/wueLN2kBvoN8WmYw7ES5n/F4642t586aTwakylVmm?=
 =?us-ascii?Q?nR3WkitDYgNwS6Lx3whwhf68eIwYRk/eGgOd105oTva6IQuEHKgqhu705pKJ?=
 =?us-ascii?Q?SgVB1EsS+jrRl7Qp2YOSVxB/hJDP5/FZ9wnFRp4Px9Z8nyLyXzXvI2MXXKOv?=
 =?us-ascii?Q?+v3Ed47ond9jCSalkreceWxSPovXrV/lBhOkkoY9EgOG7mt98Ov5phRcE88R?=
 =?us-ascii?Q?F+NnkByEiy+uOvG5qUQG+kCFSJj5y+/VU+Nyi7DpvD51mSGvnD5Sw2/CF6H4?=
 =?us-ascii?Q?aaOmuEy/qAR7USSiYQBEZx73YBK4XpBO9MlQpVECemR5oX2tNvouDqKpxgWW?=
 =?us-ascii?Q?72u269LSYWuq5mJkxeYqSppQfX4DwUrymZZQPhYoT194uvj5MUNVf4J6p6KS?=
 =?us-ascii?Q?8WUaPZoEhh0HRUnfjSLJqSJqlwkC+H9RkzM9c4E4Enk6Loz6yQfYuPhH3Qpq?=
 =?us-ascii?Q?1+xtKBffZZEszKngwCcPRiNasBQYhyS7pGMOcUGQfnr1H55THdGJ1HK3Y29w?=
 =?us-ascii?Q?zv1MDPP/W8jZdcPWVOUyBcwpD92D/pPlEs7qcjWvFek5t2sJCXB5Avw3yAjs?=
 =?us-ascii?Q?HKFwgLvlxAj7gHaBEYwHMDvqZlXkeM/6GDS73I43806l/KzZxMc/yDM9uwfp?=
 =?us-ascii?Q?xyvCIIX7n5KMMFGUR5J3+sqCnU6wBJrLRO1pxzbfREMpfNL5q+8LnBnfflZZ?=
 =?us-ascii?Q?R5ub5xquK0hWmJ65E/w+YQEtLQvMZhYfQRVdkSMY+aDDwo4xPogu5HIvkmfp?=
 =?us-ascii?Q?g6X3uqXB4uL/Ivu1uSaLcvogjLHUhh0HiRliBoibHWxon4JCDIn9A2lz98qn?=
 =?us-ascii?Q?Vm2ctfCJUFYWm8MpuwMyBgOWy3X0lNG+493NhhSFBLYi8ML6daUy4PT+rx8/?=
 =?us-ascii?Q?Hh2qaxMUSZ9WGeXBoNtj7382jyNIg+BzMC/3Ugo1+2LT/zQcGvtyt2P9WN0t?=
 =?us-ascii?Q?Pe2ANQxjTvekXkpgiGZNm2YbYcPCVvc+PWS/rjGEDwIcGcUUlDSUG4Pp2fg7?=
 =?us-ascii?Q?s6IKe0AF2QRmH2Q64VA3jAd/yFaoi6nz+j5RAOHjn9UuVK5ytOXctEMeiX4s?=
 =?us-ascii?Q?TVwayUEJt0qHSoVYBcx4vdBAEdvYOE5ehTMqLHVE0fKxtJ5V4j2Tq0yzleA6?=
 =?us-ascii?Q?mYWO1YVZU9DL1GEOMJAHh+veqjGpgcz21NrJTabTgykQ9q9YD6QfAp6XYi3I?=
 =?us-ascii?Q?awMdsftq3KcVNjALNpb0EElehEdlgsn4hzX0kOKTkg/JzK44tP/Fp7FollR1?=
 =?us-ascii?Q?9Ar2lhJ2qbCPs+XbjEROg7ed2A9YepgmvUeu/NfAOe9UwBp+e1qvuFxsiUjN?=
 =?us-ascii?Q?+Mw+WwfmUUrILxRL0KfsrRoUEKRBfrtjVeXzET37C6o6kgC2AptUgMMa01Hg?=
 =?us-ascii?Q?6Yzy1jEZ6QZqNlB5+zKPyEhquLFZ5ooetPWRtbi7QzN+k+wrHZvjt+9zVav7?=
 =?us-ascii?Q?Oexeaoek8rFB44OI7kJ7qJUHkRyuE0mV2rEe4e1s62J57ZjV/rU6BzFyKtxZ?=
 =?us-ascii?Q?Cg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 30ffbb71-b400-457a-a381-08dce6dc573e
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 14:28:41.3090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GMTEKYfPwZaS2s9NYH3cYUe4JO2KjSCTx5SyVVKD9Lw0QS6pi6lBIKmV+aUASI67wvfgo5FIO6I8qWnbzCszeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5162
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:suspicious_RCU_usage" on:

commit: bfd165c0d201635dad722a47ae63dbceb25a5334 ("rcu: Report callbacks enqueued on offline CPU blind spot")
https://git.kernel.org/cgit/linux/kernel/git/frederic/linux-dynticks.git myrcu/dev

in testcase: trinity
version: trinity-i386-abe9de86-1_20230429
with following parameters:

	runtime: 300s
	group: group-01
	nr_groups: 5



compiler: gcc-12
test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+-----------------------------------------------------+------------+------------+
|                                                     | af33205549 | bfd165c0d2 |
+-----------------------------------------------------+------------+------------+
| WARNING:suspicious_RCU_usage                        | 0          | 6          |
| kernel/rcu/tree.c:#Callback_enqueued_on_offline_CPU | 0          | 6          |
+-----------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202410072209.d93db215-oliver.sang@intel.com


[    0.910327][    T1] WARNING: suspicious RCU usage
[    0.910327][    T1] 6.12.0-rc1-00003-gbfd165c0d201 #1 Not tainted
[    0.910327][    T1] -----------------------------
[    0.910327][    T1] kernel/rcu/tree.c:3090 Callback enqueued on offline CPU!!
[    0.910327][    T1]
[    0.910327][    T1] other info that might help us debug this:
[    0.910327][    T1]
[    0.910327][    T1] rcu_scheduler_active = 1, debug_locks = 1
[    0.910327][    T1] 2 locks held by swapper/0/1:
[ 0.910327][ T1] #0: c35b2998 (cpu_add_remove_lock){+.+.}-{3:3}, at: cpu_up (kernel/cpu.c:1713) 
[ 0.910327][ T1] #1: c35b28d8 (cpu_hotplug_lock.rss.gp_wait.lock){....}-{2:2}, at: rcu_sync_exit (kernel/rcu/sync.c:157 (discriminator 5)) 
[    0.910327][    T1]
[    0.910327][    T1] stack backtrace:
[    0.910327][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.12.0-rc1-00003-gbfd165c0d201 #1
[    0.910327][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[    0.910327][    T1] Call Trace:
[ 0.910327][ T1] dump_stack_lvl (lib/dump_stack.c:123) 
[ 0.910327][ T1] dump_stack (lib/dump_stack.c:130) 
[ 0.910327][ T1] lockdep_rcu_suspicious (kernel/locking/lockdep.c:6822) 
[ 0.910327][ T1] ? show_rcu_tasks_gp_kthreads (kernel/rcu/sync.c:58) 
[ 0.910327][ T1] __call_rcu_common+0x1c1/0x2c0 
[ 0.910327][ T1] call_rcu (kernel/rcu/tree.c:3194) 
[ 0.910327][ T1] rcu_sync_exit (include/linux/spinlock.h:401 (discriminator 2) kernel/rcu/sync.c:166 (discriminator 2)) 
[ 0.910327][ T1] percpu_up_write (kernel/locking/percpu-rwsem.c:286) 
[ 0.910327][ T1] _cpu_up (kernel/cpu.c:1693) 
[ 0.910327][ T1] cpu_up (kernel/cpu.c:1722) 
[ 0.910327][ T1] ? vprintk_default (kernel/printk/printk.c:2423) 
[ 0.910327][ T1] bringup_nonboot_cpus (kernel/cpu.c:1788 kernel/cpu.c:1896) 
[ 0.910327][ T1] ? vprintk (kernel/printk/printk_safe.c:69) 
[ 0.910327][ T1] ? rest_init (init/main.c:1461) 
[ 0.910327][ T1] smp_init (arch/x86/include/asm/atomic.h:23 include/linux/atomic/atomic-arch-fallback.h:457 include/linux/cpumask.h:1108 kernel/smp.c:1012) 
[ 0.910327][ T1] ? mutex_unlock (kernel/locking/mutex.c:549) 
[ 0.910327][ T1] ? lockup_detector_init (kernel/watchdog.c:1269) 
[ 0.910327][ T1] kernel_init_freeable (init/main.c:1572) 
[ 0.910327][ T1] ? wait_for_completion (kernel/sched/completion.c:149) 
[ 0.910327][ T1] kernel_init (init/main.c:1471) 
[ 0.910327][ T1] ? schedule_tail (kernel/sched/core.c:5253) 
[ 0.910327][ T1] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 0.910327][ T1] ? rest_init (init/main.c:1461) 
[ 0.910327][ T1] ret_from_fork_asm (arch/x86/entry/entry_32.S:737) 
[ 0.910327][ T1] entry_INT80_32 (arch/x86/entry/entry_32.S:944) 



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241007/202410072209.d93db215-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

