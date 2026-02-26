Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A9C2D238F
	for <oe-lkp@lists.linux.dev>; Thu, 26 Feb 2026 12:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772109788; cv=fail; b=iVk5nmiSgXmMUFiFRJXlQn3MmnsenJFNkyICwV25hOmg+sUrD5keAXYwSMPq11PQuhepy10naJL5OREYQeI8n80OcsSaSHPRuUyLYzF/gM0nVZFjY69dAuxS4MvbZxqsnEHst40+XK4Ttwkks0K7fd4odur1tNAAAM5RRU6rvCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772109788; c=relaxed/simple;
	bh=mDInnKikua1w1vSXu8xXkCKrroXLQLs0jQGQgh5a6kc=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=VhFqVOzNPe5lplDizDKTRU1EN1zShrf1sjh6EQWXygylmtJCn9S3QFXmzf11P6kdpAMbNl9lkf3O8ZVv79LQNYHe7qNUGt5vIdbKH0PMZezm69QSLRzpDMzvJ9TOHTHC6QyZAIUUD8jPeTrWofSzaiCzHeHQuNcUbylSyK7SxSk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JkUWZWaU; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JkUWZWaU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772109787; x=1803645787;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mDInnKikua1w1vSXu8xXkCKrroXLQLs0jQGQgh5a6kc=;
  b=JkUWZWaUmbbQ7S1RJmJENPAkiCgF5j+FPmJkKuBUZYb8db9ArbRXaJqq
   6tb9XFmibmzMPMnoIDmwmhTn4uLV9Zh0nQ+bguR1DN1PLI6pVfv8aYvxs
   wItjCPuV3VRkjcrGU7JQ7uSH9cnaFSozojz3FQCUHi5STdrAwvuiF3J9t
   yXb5bdEo7LH5l//UULEDYQrdi23broBNUXhhlq97TzHX8IhEAXEWlGWO5
   xgJFfh+n8sAmLcRewB/yXyl8WcpDiQKDE1aHC9GkNZGWtNHQ6cxO50fXH
   ei+HaeCBRgl0d9Cv5pMRdm3dfXxopTzfMKtMmufGlrHc8AFdjARRr64FU
   Q==;
X-CSE-ConnectionGUID: rqZ27FyXTQyVfqLaJByE5w==
X-CSE-MsgGUID: jBtcpRW/TSW3uQj4f5+ThQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="77004629"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="77004629"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 04:43:06 -0800
X-CSE-ConnectionGUID: MpaR5jbIQIauLLdt30c59A==
X-CSE-MsgGUID: 2dyvnmy7RkCplTvgsjztng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="216460279"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 04:43:06 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 04:43:05 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Feb 2026 04:43:05 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.57) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 04:43:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BHo4KuhsmsdTAzLHkH1nAopGyohCdSMWphTipbHMbAOG3C7XQk6PpuSY4KSQJ6SPY5Q38eZRIoQigKzoHg6xt4ahaCMyp3E3NqYvY+YGR6ur1P3NRmW7JMs/LyCSAlFfcPHK5XtHrJaFNidhyBIDJICmL+V+8dKWCjQCQtnlYhEzdPIVxgtttb4PD4Lpo6NJH7ZCnkaDTMHjAV9fvv9O9BfU3Oasfatkobz62XnBQq8LJB9mQJ6rbFRSmt/b3pwxaKS0xVAVudK16zYNJ8kre/sgdrYfuIZq63bCcfJrprHlf8EDdZlDo6sxvaYM+BoNU4c+90i3LCOAYK8kJtMgiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KMqaGSUHLfZ/gAaVS5phvqJN0uQqckiHLO+8EMxA7aA=;
 b=lSj+3DcJsoQp5VUNlf/8ua7Bh6n1s5WbG5nG3OYmovQZfHq33xx+euGiOx79wqXjPaTMyvZrH5iokltSkC1MtV49T81UrTgkEP+ayLUUM/reRVBdajrsbcD2u48UVZF9jMuCjThs5l3tdfBn+LikIyC62okMFEdxPlQKLNf9E6LmdRqTynjn4exnCtPykhdW6Jg3UEkLevp8IgfET+YZll741o4ro08KzQ3es3j6UAdJb1rGfLLzQVqgDzhTmXY4g8a+I6MFhmbDUWsOzjTymeV3B1YVohNlzvhTG+WgS4zXDVMz/0IWDKzeb/EQGp7nBgR0IO3uWHHFog0Bh5JiwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SJ5PPFF9DAC6756.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::863) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.17; Thu, 26 Feb
 2026 12:43:03 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::e4de:b1d:5557:7257]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::e4de:b1d:5557:7257%5]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 12:43:03 +0000
Date: Thu, 26 Feb 2026 20:42:55 +0800
From: kernel test robot <oliver.sang@intel.com>
To: <linux+lkp@weissschuh.net>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <oliver.sang@intel.com>
Subject: [thomas-weissschuh:b4/auxclock-nanosleep] aafb55d8d1:
 WARNING:possible_circular_locking_dependency_detected
Message-ID: <202602262005.2ceb43cb-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: SG2PR02CA0138.apcprd02.prod.outlook.com
 (2603:1096:4:188::12) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SJ5PPFF9DAC6756:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cb3209d-19f9-404b-04ce-08de753494ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: oOwuaf9C8oKGz2dgrja6CHKGntbjSQg1CZ8AtFOoUspn2g689o5E6ILozk+hq0M0Zexup0NzYGtJ3ulj0duVceb+D7mRmMDiKPqs/985kkUTwMibyQh7G9bPSuh8OpcH5lsL4kC7F697uviykCzQ4xK00nuUj0ozl+Z7LT56j9Wmm1jDbtriW5nnlvjm8pkRlsphfOi+IpyccbnxF7vF7YT5dm/Bh+XfIpOfuVZmF5i+hRDZOwrkQGb7/n2bi4PdCdZ3UTU8bznmg0XJBgognwX+tz+cJQHXUu59ExTXBI+gFIX9YuO8EtlXqVznkUmr4y0CsWPxgEGIPZu8Yh5N+RjYmREYkh74tV6PFk6crXacGSKnz2IfzNC6epf7Gp/rqgNVehoHWPkyD8YdTYlh9nl2ox5Hxwyccx0rCUiPeAPLDa6AM5/6rc17c9BTvwm5EyDhce5QLsyT/eocrjlHCGMO8lPYghXtDIiqPuYKg2iGMNdF4Y8FmIYIa+pTrFuZ9wE6t6g9J13rnbNAUpbdZB8OS8ZlNS2CS5615527IXnN01h1NRR3YS5d31Awbxt/KJlNbw+OtGq45LnOXxcoh71X3MCscsymVnpqhEXlbNVud0XUKrAtWajGqhxjvErYwHunwCjRoXEc8mbDYmsxFCHR2hUCVSUjdLMxWSJNxhMJiXB1jMFDRAE04IS0cdwZ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tbbzYdoW56fsjUPIanhOnb2YhIAq/krP9Hv7VVGtqczXrUIOnEsEBddoWRHh?=
 =?us-ascii?Q?agYDnI7cbE4d/jBIHx4MQ5l2Bzp3PAzsEk/AJkKpGna6779fVJjuc99PkGe7?=
 =?us-ascii?Q?IJby2qtlCC9lCd7xS3gNZOROAAVGv98f928HuzUqiFLbyCpfyw9Mjkx9gkrU?=
 =?us-ascii?Q?TPCjO1G5Rv2XGToymA1CRKf/m7Vgm5hD4f6q0Ixfm9wuKlbMhkyr3sCKx2pE?=
 =?us-ascii?Q?UpfaM+nAnX33qjk0AT6c7OL1rL/ryz5sPRJ6Dj+0gQ6bpyR9MiHn/PAqQWhD?=
 =?us-ascii?Q?3rk7vudkI9FYd6WBLuzWOwEKj2zSusEQr8N1Y/aozWkIzoKriHZ6FuJxtEcf?=
 =?us-ascii?Q?adf+kTItQvrjO21gNzIhxeg+gKLiXr8sks5fXJsP3D+xNPx+LawHka+GHC7r?=
 =?us-ascii?Q?rzzSZ2FoZyYkJnaW0cLLnj5NMP/+6+IQM+WkfNs7rBKiY0giadfa4SHCAEIk?=
 =?us-ascii?Q?F68avRw/o2jsWOyhJYW7JTMuGAIWBMHfmFWSTEX4GFCgLMCc3Zt88MCB/pn6?=
 =?us-ascii?Q?nPqEc0hE4ErO2RK2JONfIFzXXYr03Jk6MsXqC6d01dv7WQ3osB/0QilWss/0?=
 =?us-ascii?Q?OGB6ssFzK+u8CgxDF2/RbyUwrX2I+rp4egDkK5AvtB7mVIiz/R9q66I4jWE3?=
 =?us-ascii?Q?129hyhiMv0lbuaqImIHYCqw8+6aFcXeZPhXpjhxOqdm2DYjDevp5Ufx2Jc98?=
 =?us-ascii?Q?KhuKw4tcbNnMTnkn+iWzIeTuMfNmWbOj7Ui+YpuixeL+8UM2Oa55WiMhmIWM?=
 =?us-ascii?Q?KHGVVuN4xO1RhOsu7h7+GbuQLbNSH+EmtwBZtLpmpYjA5MqicPWqDLYy+2lZ?=
 =?us-ascii?Q?nqO3MiRxGC1pil6Pahtk3/9wJe34DFieErJll04ddxX/x/um0riUTLgfci6o?=
 =?us-ascii?Q?L8GT/mk2q16UGcxqTZpSn6W4oO1IzK2iL9PaNQ3qdZlqFLETTiQ+yVP3A7zS?=
 =?us-ascii?Q?50sIv3rtAbLXEfr/q+bhaGXyITg3L7W7C3Xno4Hjy0hYE9EkBP/Y2/QJr9fL?=
 =?us-ascii?Q?PdyqIm1jzQsteKabsdW9951R9k3wRlrycBHoh6POyKsvLvxyaEJ/3oTAJauY?=
 =?us-ascii?Q?Q1xQLmIGwY4sRA6G32JLqzKHW3y3xTp76rKOlIsC2za814eK8hJDsa2F3mwj?=
 =?us-ascii?Q?R86VHVAGT6XOFIb+Rbr5k4RaSG5P215vAi7TfePvEGsGiIdWGxhgGbNPtKrC?=
 =?us-ascii?Q?eY6qw+WC8WACyFoO+M546ZL5svRJlN0U3/kdVqLcIPbkCgsV1rJInKCcVOj8?=
 =?us-ascii?Q?oDiDar2bSlGaq9Km7GHgBEmnltDuHUaSf4w7nLjK6Q4bvQ9q+e9RrBsZoJMJ?=
 =?us-ascii?Q?s+kUI8qNf7ZxuOsKK0ScXpznO4aLova8XM9PiIPX6a1zYIw1mdk3zXOT2e+t?=
 =?us-ascii?Q?dMMYX5UbV7ECghxV964SrUlZ8NXhsqRNixSe5ICQKw37gvUwR9OSYjQ8OiOH?=
 =?us-ascii?Q?UXyEWs80JczvI6pvBXFAj6be2eg+SLMsjuJY5i2LQFa4Wo4QkjQlAEEZmqtw?=
 =?us-ascii?Q?apRmbPAsh4msfNogrdcx945peGGISQjnYtUtuPEtQrRaoVFAipfudFoFZrJp?=
 =?us-ascii?Q?IBMckZZbQFjK/5HujTFsxSzbJraXvvPwLJg7312IK1Kgrd024ikrWQeJU4h5?=
 =?us-ascii?Q?pyNFEKJywg7eVSo/h7tHmXsUe/JXfKm8EeznCj7nrMgIFxePV68NmfTffaOp?=
 =?us-ascii?Q?Cjfy1Z0998llwLnAhNlCtRf3DRYby9n6l00ti/O+lUeNbVVWGW7nH6x5qj2C?=
 =?us-ascii?Q?wIC1lLoD8A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cb3209d-19f9-404b-04ce-08de753494ca
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 12:43:03.0379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RbMKyTJVxWPgcc/5v+wqa1L/KuEDwQ19DQSDo8RuXYvWL2lQCJhNgaJLTcp7d/It4VFIMuL3tr/jtvr+VXODmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFF9DAC6756
X-OriginatorOrg: intel.com




Hello,


again, since we are not sure the purpose of this patch, we make out this report
again. if low value or you don't need this check, please let us know. thanks


kernel test robot noticed "WARNING:possible_circular_locking_dependency_detected" on:

commit: aafb55d8d1bf7d9b1151e988d81b0f70b81ec76c ("count wakeups")
https://git.kernel.org/cgit/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep

in testcase: boot

config: i386-randconfig-054-20260223
compiler: clang-20
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 32G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202602262005.2ceb43cb-lkp@intel.com



[   10.361682][    T1] WARNING: possible circular locking dependency detected
[   10.362400][    T1] 7.0.0-rc1-00006-gaafb55d8d1bf #1 Not tainted
[   10.363043][    T1] ------------------------------------------------------
[   10.363756][    T1] systemd/1 is trying to acquire lock:
[   10.364318][    T1] c0ceccc4 (&dev->power.lock){....}-{3:3}, at: __pm_runtime_resume (drivers/base/power/runtime.c:?)
[   10.365221][    T1]
[   10.365221][    T1] but task is already holding lock:
[   10.365973][    T1] c2bb2f60 (&port_lock_key){-...}-{3:3}, at: uart_port_ref_lock (include/linux/serial_core.h:717)
[   10.366865][    T1]
[   10.366865][    T1] which lock already depends on the new lock.
[   10.366865][    T1]
[   10.367927][    T1]
[   10.367927][    T1] the existing dependency chain (in reverse order) is:
[   10.368840][    T1]
[   10.368840][    T1] -> #3 (&port_lock_key){-...}-{3:3}:
[   10.369608][    T1]        _raw_spin_lock_irqsave (include/linux/spinlock_api_smp.h:132 kernel/locking/spinlock.c:162)
[   10.370198][    T1]        serial8250_console_write (include/linux/serial_core.h:?)
[   10.370820][    T1]        univ8250_console_write (drivers/tty/serial/8250/8250_core.c:399)
[   10.371411][    T1]        console_flush_all (kernel/printk/printk.c:3184)
[   10.371971][    T1]        console_unlock (kernel/printk/printk.c:3373 kernel/printk/printk.c:3413)
[   10.372495][    T1]        vprintk_emit (arch/x86/include/asm/preempt.h:95 kernel/printk/printk.c:2480)
[   10.373004][    T1]        vprintk_default (kernel/printk/printk.c:2494)
[   10.373530][    T1]        vprintk (kernel/printk/printk_safe.c:82)
[   10.373977][    T1]        _printk (kernel/printk/printk.c:2507)
[   10.374439][    T1]        register_console (kernel/printk/printk.c:4208)
[   10.375012][    T1]        univ8250_console_init (drivers/tty/serial/8250/8250_core.c:?)
[   10.375596][    T1]        console_init (arch/x86/include/asm/jump_label.h:37 include/trace/events/initcall.h:48 kernel/printk/printk.c:4408)
[   10.376115][    T1]        start_kernel (init/main.c:1148)
[   10.376640][    T1]        i386_start_kernel (arch/x86/kernel/head32.c:79)
[   10.377194][    T1]        startup_32_smp (arch/x86/kernel/head_32.S:293)
[   10.377730][    T1]
[   10.377730][    T1] -> #2 (console_owner){-...}-{0:0}:
[   10.378500][    T1]        console_lock_spinning_enable (kernel/printk/printk.c:1902)
[   10.379156][    T1]        console_flush_all (kernel/printk/printk.c:3182)
[   10.379720][    T1]        console_unlock (kernel/printk/printk.c:3373 kernel/printk/printk.c:3413)
[   10.380242][    T1]        vprintk_emit (arch/x86/include/asm/preempt.h:95 kernel/printk/printk.c:2480)
[   10.380756][    T1]        vprintk_default (kernel/printk/printk.c:2494)
[   10.381294][    T1]        vprintk (kernel/printk/printk_safe.c:82)
[   10.381739][    T1]        _printk (kernel/printk/printk.c:2507)
[   10.382203][    T1]        __hrtimer_run_queues (kernel/time/hrtimer.c:1826)
[   10.382783][    T1]        hrtimer_run_queues (kernel/time/hrtimer.c:2011)
[   10.389262][    T1]        update_process_times (kernel/time/timer.c:2455)
[   10.389835][    T1]        tick_periodic (kernel/time/tick-common.c:102)
[   10.390358][    T1]        tick_handle_periodic (include/linux/clockchips.h:152 kernel/time/tick-common.c:123)
[   10.390985][    T1]        __sysvec_apic_timer_interrupt (arch/x86/include/asm/jump_label.h:37 arch/x86/include/asm/trace/irq_vectors.h:40 arch/x86/kernel/apic/apic.c:1063)
[   10.391674][    T1]        sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1056 arch/x86/kernel/apic/apic.c:1056)
[   10.392321][    T1]        handle_exception_return (arch/x86/entry/entry_32.S:1055)
[   10.392917][    T1]        seqcount_lockdep_reader_access (arch/x86/include/asm/irqflags.h:158)
[   10.393582][    T1]        d_alloc_parallel (include/linux/seqlock.h:228)
[   10.394144][    T1]        __lookup_slow (include/linux/err.h:78)
[   10.394714][    T1]        lookup_slow (fs/namei.c:1933)
[   10.395229][    T1]        path_lookupat (fs/namei.c:2279)
[   10.395758][    T1]        filename_lookup (fs/namei.c:2833)
[   10.396308][    T1]        kern_path (fs/namei.c:3040)
[   10.396795][    T1]        init_stat (fs/init.c:149)
[   10.397286][    T1]        clean_path (init/initramfs.c:337)
[   10.397776][    T1]        do_name (init/initramfs.c:379)
[   10.398256][    T1]        flush_buffer (init/initramfs.c:470 init/initramfs.c:482)
[   10.398827][    T1]        __gunzip (lib/decompress_inflate.c:161)
[   10.399345][    T1]        gunzip (lib/decompress_inflate.c:207)
[   10.399806][    T1]        unpack_to_rootfs (init/initramfs.c:551)
[   10.400380][    T1]        do_populate_rootfs (init/initramfs.c:734)
[   10.400958][    T1]        async_run_entry_fn (kernel/async.c:136)
[   10.401540][    T1]        process_one_work (kernel/workqueue.c:3280)
[   10.402107][    T1]        worker_thread (kernel/workqueue.c:3352 kernel/workqueue.c:3439)
[   10.402695][    T1]        kthread (kernel/kthread.c:469)
[   10.403191][    T1]        ret_from_fork (arch/x86/kernel/process.c:164)
[   10.403729][    T1]        ret_from_fork_asm (arch/x86/entry/entry_32.S:737)
[   10.404302][    T1]        restore_all_switch_stack (arch/x86/entry/entry_32.S:945)
[   10.404940][    T1]
[   10.404940][    T1] -> #1 (hrtimer_bases.lock){-.-.}-{2:2}:
[   10.405824][    T1]        _raw_spin_lock_irqsave (include/linux/spinlock_api_smp.h:132 kernel/locking/spinlock.c:162)
[   10.406472][    T1]        hrtimer_start_range_ns (kernel/time/hrtimer.c:? kernel/time/hrtimer.c:1328)
[   10.407214][    T1]        rpm_suspend (drivers/base/power/runtime.c:632)
[   10.407794][    T1]        rpm_idle (drivers/base/power/runtime.c:562)
[   10.408341][    T1]        __pm_runtime_idle (drivers/base/power/runtime.c:1129)
[   10.408952][    T1]        device_release_driver_internal (drivers/base/dd.c:567)
[   10.409668][    T1]        device_release_driver (drivers/base/dd.c:1331)
[   10.410252][    T1]        bus_remove_device (drivers/base/bus.c:?)
[   10.410868][    T1]        device_del (drivers/base/power/power.h:142 drivers/base/core.c:3879)
[   10.411397][    T1]        serial_base_port_device_remove (drivers/tty/serial/serial_base_bus.c:211)
[   10.412070][    T1]        serial_core_unregister_port (drivers/tty/serial/serial_core.c:3232)
[   10.412731][    T1]        serial_ctrl_unregister_port (drivers/tty/serial/serial_ctrl.c:47)
[   10.413365][    T1]        uart_remove_one_port (drivers/tty/serial/serial_port.c:150)
[   10.413932][    T1]        serial8250_register_8250_port (drivers/tty/serial/8250/8250_core.c:722)
[   10.414658][    T1]        serial8250_probe (drivers/tty/serial/8250/8250_platform.c:195 drivers/tty/serial/8250/8250_platform.c:217)
[   10.415233][    T1]        platform_probe (drivers/base/platform.c:?)
[   10.415762][    T1]        really_probe (drivers/base/dd.c:?)
[   10.416293][    T1]        __driver_probe_device (drivers/base/dd.c:803)
[   10.416890][    T1]        driver_probe_device (drivers/base/dd.c:833)
[   10.417472][    T1]        __device_attach_driver (drivers/base/dd.c:962)
[   10.418086][    T1]        bus_for_each_drv (drivers/base/bus.c:500)
[   10.418679][    T1]        __device_attach (drivers/base/dd.c:1033)
[   10.419232][    T1]        device_initial_probe (drivers/base/dd.c:?)
[   10.419819][    T1]        bus_probe_device (drivers/base/bus.c:576)
[   10.420374][    T1]        device_add (drivers/base/core.c:3696)
[   10.420888][    T1]        platform_device_add (drivers/base/platform.c:757)
[   10.421475][    T1]        platform_device_register (drivers/base/platform.c:820)
[   10.422094][    T1]        hub6_init (drivers/tty/serial/8250/8250_hub6.c:46)
[   10.422568][    T1]        do_one_initcall (init/main.c:1382)
[   10.423164][    T1]        do_initcall_level (init/main.c:1443)
[   10.423734][    T1]        do_initcalls (init/main.c:1457)
[   10.424247][    T1]        do_basic_setup (init/main.c:1480)
[   10.424778][    T1]        kernel_init_freeable (init/main.c:1694)
[   10.425372][    T1]        kernel_init (init/main.c:1584)
[   10.425879][    T1]        ret_from_fork (arch/x86/kernel/process.c:164)
[   10.426419][    T1]        ret_from_fork_asm (arch/x86/entry/entry_32.S:737)
[   10.427374][    T1]        restore_all_switch_stack (arch/x86/entry/entry_32.S:945)
[   10.427978][    T1]
[   10.427978][    T1] -> #0 (&dev->power.lock){....}-{3:3}:
[   10.428776][    T1]        __lock_acquire (kernel/locking/lockdep.c:?)
[   10.429353][    T1]        lock_acquire (kernel/locking/lockdep.c:5868)
[   10.429881][    T1]        _raw_spin_lock_irqsave (include/linux/spinlock_api_smp.h:132 kernel/locking/spinlock.c:162)
[   10.430515][    T1]        __pm_runtime_resume (drivers/base/power/runtime.c:?)
[   10.431200][    T1]        __uart_start (drivers/tty/serial/serial_core.c:150)
[   10.431855][    T1]        uart_write (drivers/tty/serial/serial_core.c:634)
[   10.432366][    T1]        n_tty_write (drivers/tty/n_tty.c:557 drivers/tty/n_tty.c:2366)
[   10.432910][    T1]        file_tty_write (drivers/tty/tty_io.c:1006)
[   10.433445][    T1]        redirected_tty_write (drivers/tty/tty_io.c:1126)
[   10.434006][    T1]        do_iter_readv_writev (fs/read_write.c:830)
[   10.434582][    T1]        vfs_writev (fs/read_write.c:1059)
[   10.435151][    T1]        do_writev (fs/read_write.c:1105)
[   10.435641][    T1]        __ia32_sys_writev (fs/read_write.c:1173 fs/read_write.c:1170 fs/read_write.c:1170)
[   10.436175][    T1]        ia32_sys_call (kbuild/obj/consumer/i386-randconfig-054-20260223/./arch/x86/include/generated/asm/syscalls_32.h:170)
[   10.436701][    T1]        __do_fast_syscall_32 (arch/x86/entry/syscall_32.c:?)
[   10.437261][    T1]        do_fast_syscall_32 (arch/x86/entry/syscall_32.c:332)
[   10.437789][    T1]        do_SYSENTER_32 (arch/x86/entry/syscall_32.c:370)
[   10.438299][    T1]        entry_SYSENTER_32 (arch/x86/entry/entry_32.S:836)
[   10.438877][    T1]
[   10.438877][    T1] other info that might help us debug this:
[   10.438877][    T1]
[   10.439628][    T1] Chain exists of:
[   10.439628][    T1]   &dev->power.lock --> console_owner --> &port_lock_key
[   10.439628][    T1]
[   10.440511][    T1]  Possible unsafe locking scenario:
[   10.440511][    T1]
[   10.441017][    T1]        CPU0                    CPU1
[   10.441381][    T1]        ----                    ----
[   10.441746][    T1]   lock(&port_lock_key);
[   10.442043][    T1]                                lock(console_owner);
[   10.442498][    T1]                                lock(&port_lock_key);
[   10.443006][    T1]   lock(&dev->power.lock);
[   10.443320][    T1]
[   10.443320][    T1]  *** DEADLOCK ***
[   10.443320][    T1]
[   10.443878][    T1] 5 locks held by systemd/1:
[   10.444194][    T1]  #0: c4177058 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait (drivers/tty/tty_ldisc.c:244)
[   10.444811][    T1]  #1: c41770a0 (&tty->atomic_write_lock){+.+.}-{4:4}, at: file_tty_write (drivers/tty/tty_io.c:939)
[   10.445450][    T1]  #2: c417717c (&tty->termios_rwsem){++++}-{4:4}, at: n_tty_write (drivers/tty/n_tty.c:759 drivers/tty/n_tty.c:2352)
[   10.446049][    T1]  #3: f7c192d8 (&ldata->output_lock){+.+.}-{4:4}, at: n_tty_write (drivers/tty/n_tty.c:515 drivers/tty/n_tty.c:2366)
[   10.446663][    T1]  #4: c2bb2f60 (&port_lock_key){-...}-{3:3}, at: uart_port_ref_lock (include/linux/serial_core.h:717)


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260226/202602262005.2ceb43cb-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

